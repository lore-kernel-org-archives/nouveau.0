From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 12/37] drm/radeon: make indirect register access
	concurrency-safe
Date: Wed, 12 Dec 2012 14:06:52 +0100
Message-ID: <1355317637-16742-13-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-driver-ati>
List-Post: <mailto:xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

With the new per-crtc locking mutliple set-cursor calls could happen
in parallel. Out of sheer paranoia I've opted for an irqsave spinlock.
But if there's indeed an access from interrupt contexts to these regs
it's already broken with the old code, so this can likely just be
reduced to a normal spinlock. Otoh the pageflip completion happens
from the vblank irq handler ...

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/radeon/r100.c          |   13 ++++++++++++-
 drivers/gpu/drm/radeon/radeon.h        |    2 ++
 drivers/gpu/drm/radeon/radeon_device.c |    1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index ae4c857..8ff7cac 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -4141,8 +4141,15 @@ uint32_t r100_mm_rreg(struct radeon_device *rdev, uint32_t reg,
 	if (reg < rdev->rmmio_size && !always_indirect)
 		return readl(((void __iomem *)rdev->rmmio) + reg);
 	else {
+		unsigned long flags;
+		uint32_t ret;
+
+		spin_lock_irqsave(&rdev->mmio_idx_lock, flags);
 		writel(reg, ((void __iomem *)rdev->rmmio) + RADEON_MM_INDEX);
-		return readl(((void __iomem *)rdev->rmmio) + RADEON_MM_DATA);
+		ret = readl(((void __iomem *)rdev->rmmio) + RADEON_MM_DATA);
+		spin_unlock_irqrestore(&rdev->mmio_idx_lock, flags);
+
+		return ret;
 	}
 }
 
@@ -4152,8 +4159,12 @@ void r100_mm_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v,
 	if (reg < rdev->rmmio_size && !always_indirect)
 		writel(v, ((void __iomem *)rdev->rmmio) + reg);
 	else {
+		unsigned long flags;
+
+		spin_lock_irqsave(&rdev->mmio_idx_lock, flags);
 		writel(reg, ((void __iomem *)rdev->rmmio) + RADEON_MM_INDEX);
 		writel(v, ((void __iomem *)rdev->rmmio) + RADEON_MM_DATA);
+		spin_unlock_irqrestore(&rdev->mmio_idx_lock, flags);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index bcb00b8..3dedb39 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1539,6 +1539,8 @@ struct radeon_device {
 	/* Register mmio */
 	resource_size_t			rmmio_base;
 	resource_size_t			rmmio_size;
+	/* protects concurrent MM_INDEX/DATA based register access */
+	spinlock_t mmio_idx_lock;
 	void __iomem			*rmmio;
 	radeon_rreg_t			mc_rreg;
 	radeon_wreg_t			mc_wreg;
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index e2f5f88..49b0659 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1059,6 +1059,7 @@ int radeon_device_init(struct radeon_device *rdev,
 
 	/* Registers mapping */
 	/* TODO: block userspace mapping of io register */
+	spin_lock_init(&rdev->mmio_idx_lock);
 	rdev->rmmio_base = pci_resource_start(rdev->pdev, 2);
 	rdev->rmmio_size = pci_resource_len(rdev->pdev, 2);
 	rdev->rmmio = ioremap(rdev->rmmio_base, rdev->rmmio_size);
-- 
1.7.10.4
