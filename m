From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 11/37] drm/radeon: add W|RREG32_IDX for MM_INDEX|DATA based
	mmio accesss
Date: Wed, 12 Dec 2012 14:06:51 +0100
Message-ID: <1355317637-16742-12-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

Just refactoring to make the next patche simpler. Now all indirect register
access in the new modesetting driver should go through the r100_mm_(w|r)reg
fucntions.

RADEON_READ_MM from the old driver seems to be totally unused, so just kill
it.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/radeon/r100.c           |   10 ++++++----
 drivers/gpu/drm/radeon/radeon.h         |   16 ++++++++++------
 drivers/gpu/drm/radeon/radeon_combios.c |    6 ++----
 drivers/gpu/drm/radeon/radeon_cp.c      |   14 --------------
 drivers/gpu/drm/radeon/radeon_cursor.c  |   17 +++++++++--------
 drivers/gpu/drm/radeon/radeon_drv.h     |    1 -
 6 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 376884f..ae4c857 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -4135,9 +4135,10 @@ int r100_init(struct radeon_device *rdev)
 	return 0;
 }
 
-uint32_t r100_mm_rreg(struct radeon_device *rdev, uint32_t reg)
+uint32_t r100_mm_rreg(struct radeon_device *rdev, uint32_t reg,
+		      bool always_indirect)
 {
-	if (reg < rdev->rmmio_size)
+	if (reg < rdev->rmmio_size && !always_indirect)
 		return readl(((void __iomem *)rdev->rmmio) + reg);
 	else {
 		writel(reg, ((void __iomem *)rdev->rmmio) + RADEON_MM_INDEX);
@@ -4145,9 +4146,10 @@ uint32_t r100_mm_rreg(struct radeon_device *rdev, uint32_t reg)
 	}
 }
 
-void r100_mm_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v)
+void r100_mm_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v,
+		  bool always_indirect)
 {
-	if (reg < rdev->rmmio_size)
+	if (reg < rdev->rmmio_size && !always_indirect)
 		writel(v, ((void __iomem *)rdev->rmmio) + reg);
 	else {
 		writel(reg, ((void __iomem *)rdev->rmmio) + RADEON_MM_INDEX);
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 8c42d54..bcb00b8 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1614,8 +1614,10 @@ int radeon_device_init(struct radeon_device *rdev,
 void radeon_device_fini(struct radeon_device *rdev);
 int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
 
-uint32_t r100_mm_rreg(struct radeon_device *rdev, uint32_t reg);
-void r100_mm_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v);
+uint32_t r100_mm_rreg(struct radeon_device *rdev, uint32_t reg,
+		      bool always_indirect);
+void r100_mm_wreg(struct radeon_device *rdev, uint32_t reg, uint32_t v,
+		  bool always_indirect);
 u32 r100_io_rreg(struct radeon_device *rdev, u32 reg);
 void r100_io_wreg(struct radeon_device *rdev, u32 reg, u32 v);
 
@@ -1631,9 +1633,11 @@ void r100_io_wreg(struct radeon_device *rdev, u32 reg, u32 v);
 #define WREG8(reg, v) writeb(v, (rdev->rmmio) + (reg))
 #define RREG16(reg) readw((rdev->rmmio) + (reg))
 #define WREG16(reg, v) writew(v, (rdev->rmmio) + (reg))
-#define RREG32(reg) r100_mm_rreg(rdev, (reg))
-#define DREG32(reg) printk(KERN_INFO "REGISTER: " #reg " : 0x%08X\n", r100_mm_rreg(rdev, (reg)))
-#define WREG32(reg, v) r100_mm_wreg(rdev, (reg), (v))
+#define RREG32(reg) r100_mm_rreg(rdev, (reg), false)
+#define RREG32_IDX(reg) r100_mm_rreg(rdev, (reg), true)
+#define DREG32(reg) printk(KERN_INFO "REGISTER: " #reg " : 0x%08X\n", r100_mm_rreg(rdev, (reg), false))
+#define WREG32(reg, v) r100_mm_wreg(rdev, (reg), (v), false)
+#define WREG32_IDX(reg, v) r100_mm_wreg(rdev, (reg), (v), true)
 #define REG_SET(FIELD, v) (((v) << FIELD##_SHIFT) & FIELD##_MASK)
 #define REG_GET(FIELD, v) (((v) << FIELD##_SHIFT) & FIELD##_MASK)
 #define RREG32_PLL(reg) rdev->pll_rreg(rdev, (reg))
@@ -1658,7 +1662,7 @@ void r100_io_wreg(struct radeon_device *rdev, u32 reg, u32 v);
 		tmp_ |= ((val) & ~(mask));			\
 		WREG32_PLL(reg, tmp_);				\
 	} while (0)
-#define DREG32_SYS(sqf, rdev, reg) seq_printf((sqf), #reg " : 0x%08X\n", r100_mm_rreg((rdev), (reg)))
+#define DREG32_SYS(sqf, rdev, reg) seq_printf((sqf), #reg " : 0x%08X\n", r100_mm_rreg((rdev), (reg), false))
 #define RREG32_IO(reg) r100_io_rreg(rdev, (reg))
 #define WREG32_IO(reg, v) r100_io_wreg(rdev, (reg), (v))
 
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 45b660b..4af8912 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -3246,11 +3246,9 @@ static uint32_t combios_detect_ram(struct drm_device *dev, int ram,
 	while (ram--) {
 		addr = ram * 1024 * 1024;
 		/* write to each page */
-		WREG32(RADEON_MM_INDEX, (addr) | RADEON_MM_APER);
-		WREG32(RADEON_MM_DATA, 0xdeadbeef);
+		WREG32_IDX((addr) | RADEON_MM_APER, 0xdeadbeef);
 		/* read back and verify */
-		WREG32(RADEON_MM_INDEX, (addr) | RADEON_MM_APER);
-		if (RREG32(RADEON_MM_DATA) != 0xdeadbeef)
+		if (RREG32_IDX((addr) | RADEON_MM_APER) != 0xdeadbeef)
 			return 0;
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_cp.c b/drivers/gpu/drm/radeon/radeon_cp.c
index 8b2797d..9143fc4 100644
--- a/drivers/gpu/drm/radeon/radeon_cp.c
+++ b/drivers/gpu/drm/radeon/radeon_cp.c
@@ -116,20 +116,6 @@ u32 radeon_get_scratch(drm_radeon_private_t *dev_priv, int index)
 	}
 }
 
-u32 RADEON_READ_MM(drm_radeon_private_t *dev_priv, int addr)
-{
-	u32 ret;
-
-	if (addr < 0x10000)
-		ret = DRM_READ32(dev_priv->mmio, addr);
-	else {
-		DRM_WRITE32(dev_priv->mmio, RADEON_MM_INDEX, addr);
-		ret = DRM_READ32(dev_priv->mmio, RADEON_MM_DATA);
-	}
-
-	return ret;
-}
-
 static u32 R500_READ_MCIND(drm_radeon_private_t *dev_priv, int addr)
 {
 	u32 ret;
diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
index 0fe56c9..ad6df62 100644
--- a/drivers/gpu/drm/radeon/radeon_cursor.c
+++ b/drivers/gpu/drm/radeon/radeon_cursor.c
@@ -66,24 +66,25 @@ static void radeon_hide_cursor(struct drm_crtc *crtc)
 	struct radeon_device *rdev = crtc->dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev)) {
-		WREG32(RADEON_MM_INDEX, EVERGREEN_CUR_CONTROL + radeon_crtc->crtc_offset);
-		WREG32(RADEON_MM_DATA, EVERGREEN_CURSOR_MODE(EVERGREEN_CURSOR_24_8_PRE_MULT) |
-		       EVERGREEN_CURSOR_URGENT_CONTROL(EVERGREEN_CURSOR_URGENT_1_2));
+		WREG32_IDX(EVERGREEN_CUR_CONTROL + radeon_crtc->crtc_offset,
+			   EVERGREEN_CURSOR_MODE(EVERGREEN_CURSOR_24_8_PRE_MULT) |
+			   EVERGREEN_CURSOR_URGENT_CONTROL(EVERGREEN_CURSOR_URGENT_1_2));
 	} else if (ASIC_IS_AVIVO(rdev)) {
-		WREG32(RADEON_MM_INDEX, AVIVO_D1CUR_CONTROL + radeon_crtc->crtc_offset);
-		WREG32(RADEON_MM_DATA, (AVIVO_D1CURSOR_MODE_24BPP << AVIVO_D1CURSOR_MODE_SHIFT));
+		WREG32_IDX(AVIVO_D1CUR_CONTROL + radeon_crtc->crtc_offset,
+			   (AVIVO_D1CURSOR_MODE_24BPP << AVIVO_D1CURSOR_MODE_SHIFT));
 	} else {
+		u32 reg;
 		switch (radeon_crtc->crtc_id) {
 		case 0:
-			WREG32(RADEON_MM_INDEX, RADEON_CRTC_GEN_CNTL);
+			reg = RADEON_CRTC_GEN_CNTL;
 			break;
 		case 1:
-			WREG32(RADEON_MM_INDEX, RADEON_CRTC2_GEN_CNTL);
+			reg = RADEON_CRTC2_GEN_CNTL;
 			break;
 		default:
 			return;
 		}
-		WREG32_P(RADEON_MM_DATA, 0, ~RADEON_CRTC_CUR_EN);
+		WREG32_IDX(reg, RREG32_IDX(reg) & ~RADEON_CRTC_CUR_EN);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
index a1b59ca..e7fdf16 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.h
+++ b/drivers/gpu/drm/radeon/radeon_drv.h
@@ -366,7 +366,6 @@ extern int radeon_cp_buffers(struct drm_device *dev, void *data, struct drm_file
 extern u32 radeon_read_fb_location(drm_radeon_private_t *dev_priv);
 extern void radeon_write_agp_location(drm_radeon_private_t *dev_priv, u32 agp_loc);
 extern void radeon_write_agp_base(drm_radeon_private_t *dev_priv, u64 agp_base);
-extern u32 RADEON_READ_MM(drm_radeon_private_t *dev_priv, int addr);
 
 extern void radeon_freelist_reset(struct drm_device * dev);
 extern struct drm_buf *radeon_freelist_get(struct drm_device * dev);
-- 
1.7.10.4
