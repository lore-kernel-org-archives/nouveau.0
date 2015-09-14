From: Ondrej Zary <linux@rainbow-software.org>
Subject: [PATCH] nouveau: Disable AGP for SiS 761
Date: Mon, 14 Sep 2015 21:19:57 +0200
Message-ID: <1442258397-28071-1-git-send-email-linux@rainbow-software.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Kernel development list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

SiS 761 chipset does not support AGP cards but has AGP capability (for
the onboard video). At least PC Chips A31G board using this chipset has
an AGP-like AGPro slot that's wired to the PCI bus. Enabling AGP will
fail (GPU lockup and software fbcon, X11 hangs).

Add support for matching just the host bridge in nvkm_device_agp_quirks
and add entry for SiS 761 with mode 0 (AGP disabled).

Signed-off-by: Ondrej Zary <linux@rainbow-software.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.c
index 814cb51..385a90f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.c
@@ -35,6 +35,8 @@ static const struct nvkm_device_agp_quirk
 nvkm_device_agp_quirks[] = {
 	/* VIA Apollo PRO133x / GeForce FX 5600 Ultra - fdo#20341 */
 	{ PCI_VENDOR_ID_VIA, 0x0691, PCI_VENDOR_ID_NVIDIA, 0x0311, 2 },
+	/* SiS 761 does not support AGP cards, use PCI mode */
+	{ PCI_VENDOR_ID_SI, 0x0761, PCI_ANY_ID, PCI_ANY_ID, 0 },
 	{},
 };
 
@@ -137,8 +139,10 @@ nvkm_agp_ctor(struct nvkm_pci *pci)
 	while (quirk->hostbridge_vendor) {
 		if (info.device->vendor == quirk->hostbridge_vendor &&
 		    info.device->device == quirk->hostbridge_device &&
-		    pci->pdev->vendor == quirk->chip_vendor &&
-		    pci->pdev->device == quirk->chip_device) {
+		    (quirk->chip_vendor == (u16)PCI_ANY_ID ||
+		    pci->pdev->vendor == quirk->chip_vendor) &&
+		    (quirk->chip_device == (u16)PCI_ANY_ID ||
+		    pci->pdev->device == quirk->chip_device)) {
 			nvkm_info(subdev, "forcing default agp mode to %dX, "
 					  "use NvAGP=<mode> to override\n",
 				  quirk->mode);
-- 
Ondrej Zary
