From: Mario Kleiner <mario.kleiner@tuebingen.mpg.de>
Subject: [PATCH 2/2] nouveau: implement precise vblank timestamping
Date: Wed, 15 Feb 2012 23:55:11 +0100
Message-ID: <1329346511-27433-3-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1329346511-27433-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1329346511-27433-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, bskeggs@redhat.com, mario.kleiner@tuebingen.mpg.de
List-Id: nouveau.vger.kernel.org

From: Lucas Stach <dev@lynxeye.de>

This patch implements the drivers hooks needed for precise vblank
timestamping. This is a complementary patch to Mario Kleiner's
patches to improve swap scheduling. With the complete
patchset applied nouveau will be able to provide correct and
precise pageflip timestamps (compliant to OML_sync_control spec)

Kudos to Mario for his many helpful comments and testing.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Reviewed-by: Mario Kleiner <mario.kleiner@tuebingen.mpg.de>
Tested-by: Mario Kleiner <mario.kleiner@tuebingen.mpg.de>
---
 drivers/gpu/drm/nouveau/nouveau_display.c |  124 +++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.c     |    2 +
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    5 +
 drivers/gpu/drm/nouveau/nouveau_reg.h     |    9 ++-
 drivers/gpu/drm/nouveau/nv50_crtc.c       |   19 +++++
 drivers/gpu/drm/nouveau/nvreg.h           |    1 +
 6 files changed, 159 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 5bd392f..7fdd6a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -431,3 +431,127 @@ nouveau_display_dumb_map_offset(struct drm_file *file_priv,
 
 	return -ENOENT;
 }
+
+int
+nouveau_get_scanoutpos(struct drm_device *dev, int crtc, int *vpos, int *hpos)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
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
+		if(nouveau_crtc(drmcrtc)->index == crtc)
+			/* stop if we have found crtc with matching index */
+			break;
+	}
+
+	if(dev_priv->card_type >= NV_50) {
+		/* get vsync and hsync area */
+		reg = nv_rd32(dev, NV50_PDISPLAY_CRTC_P(crtc,
+		                   SYNC_START_TO_BLANK_END));
+		vbias = (reg >> 16) & 0xffff;
+		hbias = reg & 0xffff;
+
+		/* get vertical display size including bias as vbl_start
+		 * and vtotal as vbl_end */
+		vbl_start = (nv_rd32(dev, NV50_PDISPLAY_CRTC_P(crtc,
+		                          VBL_START)) >> 16) & 0xffff;
+		vbl_end = (nv_rd32(dev, NV50_PDISPLAY_CRTC_P(crtc,
+		                        DISPLAY_TOTAL)) >> 16) & 0xffff;
+
+		/* get current scanout position from PDISPLAY */
+		vline = nv_rd32(dev, NV50_PDISPLAY_CRTC_STAT_VERT(crtc))
+		                & NV50_PDISPLAY_CRTC_STAT_VERT_VLINE__MASK;
+
+		/*
+		 * vline == 0 could be invalid:
+		 * Some gpu's get stuck on that value inside vblank. Try again
+		 * after one scanline duration, if it still reads 0 give up.
+		 */
+		if (vline == 0) {
+			ndelay(drmcrtc->linedur_ns & 0xffff);
+			vline = nv_rd32(dev, NV50_PDISPLAY_CRTC_STAT_VERT(crtc))
+			        & NV50_PDISPLAY_CRTC_STAT_VERT_VLINE__MASK;
+		}
+
+		hline = nv_rd32(dev, NV50_PDISPLAY_CRTC_STAT_HORZ(crtc))
+		                & NV50_PDISPLAY_CRTC_STAT_HORZ_HLINE__MASK;
+
+		if((vline > 0) && (vline < vbl_end))
+			ret |= DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_ACCURATE;
+
+		if((vline >= vbl_start) || (vline < vbias)) {
+			/* we are in vblank so do a neg countdown */
+			ret |= DRM_SCANOUTPOS_INVBL;
+			vline -= (vline < vbias) ? vbias : (vbl_end + vbias);
+			hline -= hbias;
+		} else {
+			/* apply corrective offset */
+			vline -= vbias;
+			hline -= hbias;
+		}
+	} else {
+		/* get vsync area from PRAMDAC */
+		vbl_start = NVReadRAMDAC(dev, crtc, NV_PRAMDAC_FP_VDISPLAY_END)
+		            & 0xffff;
+		vbl_end = (NVReadRAMDAC(dev, crtc, NV_PRAMDAC_FP_VTOTAL)
+			   & 0xffff) + 1;
+
+		/* get current scanout position from PCRTC */
+		vline = nv_rd32(dev, NV_PCRTC_STAT(crtc)) & 0xffff;
+
+		/*
+		 * vline == 0 could be invalid:
+		 * Some gpu's get stuck on that value inside vblank. Try again
+		 * after one scanline duration, if it still reads 0 give up.
+		 */
+		if (vline == 0) {
+			ndelay(drmcrtc->linedur_ns & 0xffff);
+			vline = nv_rd32(dev, NV_PCRTC_STAT(crtc)) & 0xffff;
+		}
+
+		if(vline > 0)
+			ret |= DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_ACCURATE;
+
+		/* are we in vblank? if yes: do neg countdown */
+		if((vline >= vbl_start) && (vline < vbl_end)) {
+			ret |= DRM_SCANOUTPOS_INVBL;
+			vline -= vbl_end;
+		}
+
+		hline = 0; /* don't use hline as it's unreliable */
+	}
+
+	*vpos = vline;
+	*hpos = hline;
+
+	return ret;
+}
+
+int
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
+			/* stop if we have found crtc with matching index */
+			break;
+	}
+
+	return drm_calc_vbltimestamp_from_scanoutpos(dev, crtc, max_error,
+				vblank_time, flags, drmcrtc);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 9791d13..555b4aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -411,6 +411,8 @@ static struct drm_driver driver = {
 	.get_vblank_counter = drm_vblank_count,
 	.enable_vblank = nouveau_vblank_enable,
 	.disable_vblank = nouveau_vblank_disable,
+	.get_vblank_timestamp = nouveau_get_vblank_timestamp,
+	.get_scanout_position = nouveau_get_scanoutpos,
 	.reclaim_buffers = drm_core_reclaim_buffers,
 	.ioctls = nouveau_ioctls,
 	.fops = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index f489c22..52c3de7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1419,6 +1419,11 @@ int nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 			   struct drm_pending_vblank_event *event);
 int nouveau_finish_page_flip(struct nouveau_channel *,
 			     struct nouveau_page_flip_state *);
+int nouveau_get_scanoutpos(struct drm_device *dev, int crtc,
+                            int *vpos, int *hpos);
+int nouveau_get_vblank_timestamp(struct drm_device *dev, int crtc,
+				 int *max_error, struct timeval *vblank_time,
+				 unsigned flags);
 int nouveau_display_dumb_create(struct drm_file *, struct drm_device *,
 				struct drm_mode_create_dumb *args);
 int nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
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
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 882080e..89fbc31 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -505,6 +505,25 @@ static bool
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
1.7.5.4
