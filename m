From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/21] drm/msm: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
Date: Wed, 15 Jan 2020 13:16:43 +0100
Message-ID: <20200115121652.7050-13-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: nouveau.vger.kernel.org

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
mem over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 67 +++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 61 ---------------------
 2 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 05cc04f729d6..4decf19847a8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -405,6 +405,72 @@ static void mdp5_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&mdp5_crtc->lm_lock, flags);
 }
 
+static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, dev)
+		if (encoder->crtc == crtc)
+			return encoder;
+
+	return NULL;
+}
+
+static bool mdp5_crtc_get_scanout_position(struct drm_crtc *crtc,
+					   bool in_vblank_irq,
+					   int *vpos, int *hpos,
+					   ktime_t *stime, ktime_t *etime,
+					   const struct drm_display_mode *mode)
+{
+	unsigned int pipe = crtc->index;
+	struct drm_encoder *encoder;
+	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
+
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder) {
+		DRM_ERROR("no encoder found for crtc %d\n", pipe);
+		return false;
+	}
+
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
+
+	/*
+	 * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
+	 * the end of VFP. Translate the porch values relative to the line
+	 * counter positions.
+	 */
+
+	vactive_start = vsw + vbp + 1;
+
+	vactive_end = vactive_start + mode->crtc_vdisplay;
+
+	/* last scan line before VSYNC */
+	vfp_end = mode->crtc_vtotal;
+
+	if (stime)
+		*stime = ktime_get();
+
+	line = mdp5_encoder_get_linecount(encoder);
+
+	if (line < vactive_start)
+		line -= vactive_start;
+	else if (line > vactive_end)
+		line = line - vfp_end - vactive_start;
+	else
+		line -= vactive_start;
+
+	*vpos = line;
+	*hpos = 0;
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
 static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
@@ -1063,6 +1129,7 @@ static const struct drm_crtc_helper_funcs mdp5_crtc_helper_funcs = {
 	.atomic_flush = mdp5_crtc_atomic_flush,
 	.atomic_enable = mdp5_crtc_atomic_enable,
 	.atomic_disable = mdp5_crtc_atomic_disable,
+	.get_scanout_position = mdp5_crtc_get_scanout_position,
 };
 
 static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index e43ecd4be10a..8b72ac44ce55 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -595,66 +595,6 @@ static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 	return NULL;
 }
 
-static bool mdp5_get_scanoutpos(struct drm_device *dev, unsigned int pipe,
-				bool in_vblank_irq, int *vpos, int *hpos,
-				ktime_t *stime, ktime_t *etime,
-				const struct drm_display_mode *mode)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_crtc *crtc;
-	struct drm_encoder *encoder;
-	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
-
-	crtc = priv->crtcs[pipe];
-	if (!crtc) {
-		DRM_ERROR("Invalid crtc %d\n", pipe);
-		return false;
-	}
-
-	encoder = get_encoder_from_crtc(crtc);
-	if (!encoder) {
-		DRM_ERROR("no encoder found for crtc %d\n", pipe);
-		return false;
-	}
-
-	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
-	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
-
-	/*
-	 * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
-	 * the end of VFP. Translate the porch values relative to the line
-	 * counter positions.
-	 */
-
-	vactive_start = vsw + vbp + 1;
-
-	vactive_end = vactive_start + mode->crtc_vdisplay;
-
-	/* last scan line before VSYNC */
-	vfp_end = mode->crtc_vtotal;
-
-	if (stime)
-		*stime = ktime_get();
-
-	line = mdp5_encoder_get_linecount(encoder);
-
-	if (line < vactive_start) {
-		line -= vactive_start;
-	} else if (line > vactive_end) {
-		line = line - vfp_end - vactive_start;
-	} else {
-		line -= vactive_start;
-	}
-
-	*vpos = line;
-	*hpos = 0;
-
-	if (etime)
-		*etime = ktime_get();
-
-	return true;
-}
-
 static u32 mdp5_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -763,7 +703,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	dev->mode_config.max_height = 0xffff;
 
 	dev->driver->get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos;
-	dev->driver->get_scanout_position = mdp5_get_scanoutpos;
 	dev->driver->get_vblank_counter = mdp5_get_vblank_counter;
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
-- 
2.24.1
