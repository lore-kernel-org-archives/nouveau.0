From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: implement precise vblank
	timestamping
Date: Thu, 26 Apr 2012 00:26:22 +0200
Message-ID: <1335392782-2141-2-git-send-email-dev@lynxeye.de>
References: <1335392782-2141-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335392782-2141-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch implements the driver hooks needed for precise vblank
timestamping. This is a complementary patch to Mario Kleiner's
patches to improve swap scheduling. With the complete
patchset applied nouveau will be able to provide correct and
precise pageflip timestamps (compliant to OML_sync_control spec)

v2: - Rebase on top of nouveau tree and update to reflect Ben's
      review feedback.

v3: - Split nv04+ and nv50+ paths into separate functions.
    - Do not advertise precise vblank timestamping on nvd9+,
      as it's not confirmed to work and the nv50 codepath may
      not work due to moved regs.

Kudos to Mario for his many helpful comments and testing.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Reviewed-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Tested-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c |   25 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_reg.h     |    9 +++-
 drivers/gpu/drm/nouveau/nv04_display.c    |   55 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_crtc.c       |   19 ++++++++
 drivers/gpu/drm/nouveau/nv50_display.c    |   71 +++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvreg.h           |    1 +
 6 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 2c0f415..810ba72 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -258,6 +258,27 @@ nouveau_display_fini(struct drm_device *dev)
 }
 
 int
+nouveau_get_vblank_timestamp(struct drm_device *dev, int crtc,
+			     int *max_error, struct timeval *vblank_time,
+			     unsigned flags)
+{
+	struct drm_crtc *drmcrtc;
+
+	if (crtc < 0 || crtc >= dev->num_crtcs) {
+		DRM_ERROR("Invalid crtc %d\n", crtc);
+		return -EINVAL;
+	}
+
+	list_for_each_entry(drmcrtc, &dev->mode_config.crtc_list, head) {
+		if(nouveau_crtc(drmcrtc)->index == crtc)
+			break;
+	}
+
+	return drm_calc_vbltimestamp_from_scanoutpos(dev, crtc, max_error,
+				vblank_time, flags, drmcrtc);
+}
+
+int
 nouveau_display_create(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -327,6 +348,10 @@ nouveau_display_create(struct drm_device *dev)
 	if (ret)
 		goto disp_create_err;
 
+	if (dev->driver->get_scanout_position)
+		dev->driver->get_vblank_timestamp =
+		nouveau_get_vblank_timestamp;
+
 	if (dev->mode_config.num_crtc) {
 		ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index 43a96b9..0ec1945 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -762,7 +762,7 @@
 #define NV50_PDISPLAY_CRTC_CLOCK                                     0x00610ad0
 #define NV50_PDISPLAY_CRTC_COLOR_CTRL                                0x00610ae0
 #define NV50_PDISPLAY_CRTC_SYNC_START_TO_BLANK_END                   0x00610ae8
-#define NV50_PDISPLAY_CRTC_MODE_UNK1                                 0x00610af0
+#define NV50_PDISPLAY_CRTC_VBL_START                                 0x00610af0
 #define NV50_PDISPLAY_CRTC_DISPLAY_TOTAL                             0x00610af8
 #define NV50_PDISPLAY_CRTC_SYNC_DURATION                             0x00610b00
 #define NV50_PDISPLAY_CRTC_MODE_UNK2                                 0x00610b08
@@ -800,6 +800,13 @@
 #define NV50_PDISPLAY_SOR_CLK                                        0x00614000
 #define NV50_PDISPLAY_SOR_CLK_CTRL2(i)                  ((i) * 0x800 + 0x614300)
 
+#define NV50_PDISPLAY_CRTC_STAT_VERT(i0)		       (0x00616340 + 0x800*(i0))
+#define NV50_PDISPLAY_CRTC_STAT_VERT_VLINE__MASK		0x0000ffff
+#define NV50_PDISPLAY_CRTC_STAT_VERT_VBLANK_COUNT__MASK		0xffff0000
+#define NV50_PDISPLAY_CRTC_STAT_VERT_VBLANK_COUNT__SHIFT	16
+#define NV50_PDISPLAY_CRTC_STAT_HORZ(i0)		       (0x00616344 + 0x800*(i0))
+#define NV50_PDISPLAY_CRTC_STAT_HORZ_HLINE__MASK		0x0000ffff
+
 #define NV50_PDISPLAY_VGACRTC(r)                                ((r) + 0x619400)
 
 #define NV50_PDISPLAY_DAC                                            0x0061a000
diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index 7047d37..2622953 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -26,6 +26,7 @@
 #include "drm.h"
 #include "drm_crtc_helper.h"
 
+#include "nouveau_crtc.h"
 #include "nouveau_drv.h"
 #include "nouveau_fb.h"
 #include "nouveau_hw.h"
@@ -35,6 +36,58 @@
 static void nv04_vblank_crtc0_isr(struct drm_device *);
 static void nv04_vblank_crtc1_isr(struct drm_device *);
 
+int
+nv04_display_scanoutpos_get(struct drm_device *dev, int crtc,
+		            int *vpos, int *hpos)
+{
+	int vline, ret = 0;
+	u32 vbl_start, vbl_end;
+	struct drm_crtc *drmcrtc;
+
+	if (crtc < 0 || crtc >= dev->num_crtcs) {
+		DRM_ERROR("Invalid crtc %d\n", crtc);
+		return -EINVAL;
+	}
+
+	list_for_each_entry(drmcrtc, &dev->mode_config.crtc_list, head) {
+		if (nouveau_crtc(drmcrtc)->index == crtc)
+			break;
+	}
+
+	/* get vsync area from PRAMDAC */
+	vbl_start = NVReadRAMDAC(dev, crtc, NV_PRAMDAC_FP_VDISPLAY_END)
+		    & 0xffff;
+	vbl_end = (NVReadRAMDAC(dev, crtc, NV_PRAMDAC_FP_VTOTAL)
+		   & 0xffff) + 1;
+
+	/* get current scanout position from PCRTC */
+	vline = nv_rd32(dev, NV_PCRTC_STAT(crtc)) & 0xffff;
+
+	/*
+	 * vline == 0 could be invalid:
+	 * Some gpu's get stuck on that value inside vblank. Try again
+	 * after one scanline duration, if it still reads 0 give up.
+	 */
+	if (vline == 0) {
+		ndelay(drmcrtc->linedur_ns & 0xffff);
+		vline = nv_rd32(dev, NV_PCRTC_STAT(crtc)) & 0xffff;
+	}
+
+	if (vline > 0)
+		ret |= DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_ACCURATE;
+
+	/* are we in vblank? if yes: do neg countdown */
+	if ((vline >= vbl_start) && (vline < vbl_end)) {
+		ret |= DRM_SCANOUTPOS_INVBL;
+		vline -= vbl_end;
+	}
+
+	*vpos = vline;
+	*hpos = 0; /* don't use hline as it's unreliable */
+
+	return ret;
+}
+
 static void
 nv04_display_store_initial_head_owner(struct drm_device *dev)
 {
@@ -179,6 +232,8 @@ nv04_display_create(struct drm_device *dev)
 		func->save(encoder);
 	}
 
+	dev->driver->get_scanout_position = nv04_display_scanoutpos_get;
+
 	nouveau_irq_register(dev, 24, nv04_vblank_crtc0_isr);
 	nouveau_irq_register(dev, 25, nv04_vblank_crtc1_isr);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index e021b1c..0652675 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -530,6 +530,25 @@ static bool
 nv50_crtc_mode_fixup(struct drm_crtc *crtc, struct drm_display_mode *mode,
 		     struct drm_display_mode *adjusted_mode)
 {
+	/* crtc_xxx fields are needed by drm core. Init them with the
+	 * settings we actually use for mode programming. */
+	adjusted_mode->synth_clock = adjusted_mode->clock;
+	adjusted_mode->crtc_hdisplay = adjusted_mode->hdisplay;
+	adjusted_mode->crtc_hblank_start = 0;
+	adjusted_mode->crtc_hblank_end = 0;
+	adjusted_mode->crtc_hsync_start = adjusted_mode->hsync_start;
+	adjusted_mode->crtc_hsync_end = adjusted_mode->hsync_end;
+	adjusted_mode->crtc_htotal = adjusted_mode->htotal;
+	adjusted_mode->crtc_hskew = adjusted_mode->hskew;
+	adjusted_mode->crtc_vdisplay = adjusted_mode->vdisplay;
+	adjusted_mode->crtc_vblank_start = 0;
+	adjusted_mode->crtc_vblank_end = 0;
+	adjusted_mode->crtc_vsync_start = adjusted_mode->vsync_start;
+	adjusted_mode->crtc_vsync_end = adjusted_mode->vsync_end;
+	adjusted_mode->crtc_vtotal = adjusted_mode->vtotal;
+	adjusted_mode->crtc_hadjusted = 0;
+	adjusted_mode->crtc_vadjusted = 0;
+
 	return true;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index b526e3f..86042f9 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -37,6 +37,75 @@
 static void nv50_display_isr(struct drm_device *);
 static void nv50_display_bh(unsigned long);
 
+int
+nv50_display_scanoutpos_get(struct drm_device *dev, int crtc,
+		            int *vpos, int *hpos)
+{
+	int vline, hline, ret = 0;
+	u32 vbias, hbias, reg, vbl_start, vbl_end;
+	struct drm_crtc *drmcrtc;
+
+	if (crtc < 0 || crtc >= dev->num_crtcs) {
+		DRM_ERROR("Invalid crtc %d\n", crtc);
+		return -EINVAL;
+	}
+
+	list_for_each_entry(drmcrtc, &dev->mode_config.crtc_list, head) {
+		if (nouveau_crtc(drmcrtc)->index == crtc)
+			break;
+	}
+
+	/* get vsync and hsync area */
+	reg = nv_rd32(dev, NV50_PDISPLAY_CRTC_C(crtc,
+	                   SYNC_START_TO_BLANK_END));
+	vbias = (reg >> 16) & 0xffff;
+	hbias = reg & 0xffff;
+
+	/* get vertical display size including bias as vbl_start
+	 * and vtotal as vbl_end */
+	vbl_start = (nv_rd32(dev, NV50_PDISPLAY_CRTC_C(crtc,
+	                          VBL_START)) >> 16) & 0xffff;
+	vbl_end = (nv_rd32(dev, NV50_PDISPLAY_CRTC_C(crtc,
+	                        DISPLAY_TOTAL)) >> 16) & 0xffff;
+
+	/* get current scanout position from PDISPLAY */
+	vline = nv_rd32(dev, NV50_PDISPLAY_CRTC_STAT_VERT(crtc))
+	                & NV50_PDISPLAY_CRTC_STAT_VERT_VLINE__MASK;
+
+	/*
+	 * vline == 0 could be invalid:
+	 * Some gpu's get stuck on that value inside vblank. Try again
+	 * after one scanline duration, if it still reads 0 give up.
+	 */
+	if (vline == 0) {
+		ndelay(drmcrtc->linedur_ns & 0xffff);
+		vline = nv_rd32(dev, NV50_PDISPLAY_CRTC_STAT_VERT(crtc))
+		        & NV50_PDISPLAY_CRTC_STAT_VERT_VLINE__MASK;
+	}
+
+	hline = nv_rd32(dev, NV50_PDISPLAY_CRTC_STAT_HORZ(crtc))
+	                & NV50_PDISPLAY_CRTC_STAT_HORZ_HLINE__MASK;
+
+	if ((vline > 0) && (vline < vbl_end))
+		ret |= DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_ACCURATE;
+
+	if ((vline >= vbl_start) || (vline < vbias)) {
+		/* we are in vblank so do a neg countdown */
+		ret |= DRM_SCANOUTPOS_INVBL;
+		vline -= (vline < vbias) ? vbias : (vbl_end + vbias);
+		hline -= hbias;
+	} else {
+		/* apply corrective offset */
+		vline -= vbias;
+		hline -= hbias;
+	}
+
+	*vpos = vline;
+	*hpos = hline;
+
+	return ret;
+}
+
 static inline int
 nv50_sor_nr(struct drm_device *dev)
 {
@@ -411,6 +480,8 @@ nv50_display_create(struct drm_device *dev)
 		return ret;
 	}
 
+	dev->driver->get_scanout_position = nv50_display_scanoutpos_get;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvreg.h b/drivers/gpu/drm/nouveau/nvreg.h
index bbfb1a6..e8281c4 100644
--- a/drivers/gpu/drm/nouveau/nvreg.h
+++ b/drivers/gpu/drm/nouveau/nvreg.h
@@ -172,6 +172,7 @@
 #define NV_PCRTC_834					0x00600834
 #define NV_PCRTC_850					0x00600850
 #define NV_PCRTC_ENGINE_CTRL				0x00600860
+#define NV_PCRTC_STAT(i0)			(0x00600868 + 0x2000*(i0))
 #	define NV_CRTC_FSEL_I2C					(1 << 4)
 #	define NV_CRTC_FSEL_OVERLAY				(1 << 12)
 
-- 
1.7.10
