From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Move irq setup/teardown to pci ctor/dtor
Date: Thu, 25 Jan 2018 17:31:53 -0500
Message-ID: <20180125223156.23874-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Mike Galbraith <efault@gmx.de>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Karol Herbst <karolherbst@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

For a while we've been having issues with seemingly random interrupts
coming from nvidia cards when resuming them. Originally the fix for this
was thought to be just re-arming the MSI interrupt registers right after
re-allocating our IRQs, however it seems a lot of what we do is both
wrong and not even nessecary.

This was made apparent by what appeared to be a regression in the
mainline kernel that started introducing suspend/resume issues for
nouveau:

        a0c9259dc4e1 (irq/matrix: Spread interrupts on allocation)

After this commit was introduced, we started getting interrupts from the
GPU before we actually re-allocated our own IRQ (see references below)
and assigned the IRQ handler. Investigating this turned out that the
problem was not with the commit, but the fact that nouveau even
free/allocates it's irqs before and after suspend/resume.

For starters: drivers in the linux kernel haven't had to handle
freeing/re-allocating their IRQs during suspend/resume cycles for quite
a while now. Nouveau seems to be one of the few drivers left that still
does this, despite the fact there's no reason we actually need to since
disabling interrupts from the device side should be enough, as the
kernel is already smart enough to know to disable host-side interrupts
for us before going into suspend. Since we were tearing down our IRQs by
hand however, that means there was a short period during resume where
interrupts could be received before we re-allocated our IRQ which would
lead to us getting an unhandled IRQ. Since we never handle said IRQ and
re-arm the interrupt registers, this would cause us to miss all of the
interrupts from the GPU and cause our init process to start timing out
on anything requiring interrupts.

So, since this whole setup/teardown every suspend/resume cycle is
useless anyway, move irq setup/teardown into the pci subdev's ctor/dtor
functions instead so they're only called at driver load and driver
unload. This should fix most of the issues with pending interrupts on
resume, along with getting suspend/resume for nouveau to work again.

As well, this probably means we can also just remove the msi rearm call
inside nvkm_pci_init(). But since our main focus here is to fix
suspend/resume before 4.16, we'll save that for a later patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Mike Galbraith <efault@gmx.de>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c    | 43 +++++++++++++++--------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
index 23803cc859fd..378bfc8d5fa8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
@@ -31,6 +31,7 @@ struct nvkm_pci {
 	} pcie;
 
 	bool msi;
+	bool teardown;
 };
 
 u32 nvkm_pci_rd32(struct nvkm_pci *, u16 addr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
index deb96de54b00..4e020f05c99f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
@@ -71,6 +71,10 @@ nvkm_pci_intr(int irq, void *arg)
 	struct nvkm_pci *pci = arg;
 	struct nvkm_device *device = pci->subdev.device;
 	bool handled = false;
+
+	if (pci->teardown)
+		return IRQ_HANDLED;
+
 	nvkm_mc_intr_unarm(device);
 	if (pci->msi)
 		pci->func->msi_rearm(pci);
@@ -84,11 +88,6 @@ nvkm_pci_fini(struct nvkm_subdev *subdev, bool suspend)
 {
 	struct nvkm_pci *pci = nvkm_pci(subdev);
 
-	if (pci->irq >= 0) {
-		free_irq(pci->irq, pci);
-		pci->irq = -1;
-	}
-
 	if (pci->agp.bridge)
 		nvkm_agp_fini(pci);
 
@@ -108,8 +107,20 @@ static int
 nvkm_pci_oneinit(struct nvkm_subdev *subdev)
 {
 	struct nvkm_pci *pci = nvkm_pci(subdev);
-	if (pci_is_pcie(pci->pdev))
-		return nvkm_pcie_oneinit(pci);
+	struct pci_dev *pdev = pci->pdev;
+	int ret;
+
+	if (pci_is_pcie(pci->pdev)) {
+		ret = nvkm_pcie_oneinit(pci);
+		if (ret)
+			return ret;
+	}
+
+	ret = request_irq(pdev->irq, nvkm_pci_intr, IRQF_SHARED, "nvkm", pci);
+	if (ret)
+		return ret;
+	pci->irq = pdev->irq;
+
 	return 0;
 }
 
@@ -117,7 +128,6 @@ static int
 nvkm_pci_init(struct nvkm_subdev *subdev)
 {
 	struct nvkm_pci *pci = nvkm_pci(subdev);
-	struct pci_dev *pdev = pci->pdev;
 	int ret;
 
 	if (pci->agp.bridge) {
@@ -131,28 +141,30 @@ nvkm_pci_init(struct nvkm_subdev *subdev)
 	if (pci->func->init)
 		pci->func->init(pci);
 
-	ret = request_irq(pdev->irq, nvkm_pci_intr, IRQF_SHARED, "nvkm", pci);
-	if (ret)
-		return ret;
-
-	pci->irq = pdev->irq;
-
 	/* Ensure MSI interrupts are armed, for the case where there are
 	 * already interrupts pending (for whatever reason) at load time.
 	 */
 	if (pci->msi)
 		pci->func->msi_rearm(pci);
 
-	return ret;
+	return 0;
 }
 
 static void *
 nvkm_pci_dtor(struct nvkm_subdev *subdev)
 {
 	struct nvkm_pci *pci = nvkm_pci(subdev);
+
 	nvkm_agp_dtor(pci);
+
+	if (pci->irq >= 0) {
+		pci->teardown = true;
+		free_irq(pci->irq, pci);
+	}
+
 	if (pci->msi)
 		pci_disable_msi(pci->pdev);
+
 	return nvkm_pci(subdev);
 }
 
@@ -177,6 +189,7 @@ nvkm_pci_new_(const struct nvkm_pci_func *func, struct nvkm_device *device,
 	pci->func = func;
 	pci->pdev = device->func->pci(device)->pdev;
 	pci->irq = -1;
+	pci->teardown = false;
 	pci->pcie.speed = -1;
 	pci->pcie.width = -1;
 
-- 
2.14.3
