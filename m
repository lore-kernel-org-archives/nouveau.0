From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 14/23] drm/i915: Convert to CRTC VBLANK callbacks
Date: Fri, 10 Jan 2020 10:21:18 +0100
Message-ID: <20200110092127.27847-15-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: nouveau.vger.kernel.org

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert i915 over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_display.c |  7 +++++++
 drivers/gpu/drm/i915/i915_drv.c              |  2 --
 drivers/gpu/drm/i915/i915_irq.c              | 13 +++----------
 drivers/gpu/drm/i915/i915_irq.h              |  3 +--
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index da5266e76738..515788698298 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -16227,6 +16227,7 @@ static const struct drm_crtc_funcs bdw_crtc_funcs = {
 	.get_vblank_counter = g4x_get_vblank_counter,
 	.enable_vblank = bdw_enable_vblank,
 	.disable_vblank = bdw_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_funcs ilk_crtc_funcs = {
@@ -16235,6 +16236,7 @@ static const struct drm_crtc_funcs ilk_crtc_funcs = {
 	.get_vblank_counter = g4x_get_vblank_counter,
 	.enable_vblank = ilk_enable_vblank,
 	.disable_vblank = ilk_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_funcs g4x_crtc_funcs = {
@@ -16243,6 +16245,7 @@ static const struct drm_crtc_funcs g4x_crtc_funcs = {
 	.get_vblank_counter = g4x_get_vblank_counter,
 	.enable_vblank = i965_enable_vblank,
 	.disable_vblank = i965_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_funcs i965_crtc_funcs = {
@@ -16251,6 +16254,7 @@ static const struct drm_crtc_funcs i965_crtc_funcs = {
 	.get_vblank_counter = i915_get_vblank_counter,
 	.enable_vblank = i965_enable_vblank,
 	.disable_vblank = i965_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_funcs i915gm_crtc_funcs = {
@@ -16259,6 +16263,7 @@ static const struct drm_crtc_funcs i915gm_crtc_funcs = {
 	.get_vblank_counter = i915_get_vblank_counter,
 	.enable_vblank = i915gm_enable_vblank,
 	.disable_vblank = i915gm_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_funcs i915_crtc_funcs = {
@@ -16267,6 +16272,7 @@ static const struct drm_crtc_funcs i915_crtc_funcs = {
 	.get_vblank_counter = i915_get_vblank_counter,
 	.enable_vblank = i8xx_enable_vblank,
 	.disable_vblank = i8xx_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static const struct drm_crtc_funcs i8xx_crtc_funcs = {
@@ -16275,6 +16281,7 @@ static const struct drm_crtc_funcs i8xx_crtc_funcs = {
 	/* no hw vblank counter */
 	.enable_vblank = i8xx_enable_vblank,
 	.disable_vblank = i8xx_disable_vblank,
+	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
 };
 
 static struct intel_crtc *intel_crtc_alloc(void)
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 4a0a7fb85c53..30b9ba136a81 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -2769,8 +2769,6 @@ static struct drm_driver driver = {
 	.gem_prime_export = i915_gem_prime_export,
 	.gem_prime_import = i915_gem_prime_import,
 
-	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
-
 	.dumb_create = i915_gem_dumb_create,
 	.dumb_map_offset = i915_gem_dumb_mmap_offset,
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 99d0c3b0feae..dbbbdff8fa89 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -885,28 +885,21 @@ static bool i915_get_crtc_scanoutpos(struct drm_device *dev,
 	return true;
 }
 
-bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
-					    unsigned int pipe,
+bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_crtc *crtc,
 					    int *max_error,
 					    ktime_t *vblank_time,
 					    bool in_vblank_irq)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct timespec64 ts_etime, ts_vblank_time;
 	ktime_t stime, etime;
 	bool vbl_status;
-	struct drm_crtc *crtc;
 	const struct drm_display_mode *mode;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	int vpos, hpos, i;
 	int delta_ns, duration_ns;
 
-	crtc = drm_crtc_from_index(dev, pipe);
-
-	if (pipe >= dev->num_crtcs || !crtc) {
-		DRM_ERROR("Invalid crtc %u\n", pipe);
-		return false;
-	}
-
 	if (drm_drv_uses_atomic_modeset(dev))
 		mode = &vblank->hwmode;
 	else
diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
index 5f7b133ce721..756577a7a384 100644
--- a/drivers/gpu/drm/i915/i915_irq.h
+++ b/drivers/gpu/drm/i915/i915_irq.h
@@ -101,8 +101,7 @@ void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
 void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_priv,
 				     u8 pipe_mask);
 
-bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
-					    unsigned int pipe,
+bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_crtc *crtc,
 					    int *max_error,
 					    ktime_t *vblank_time,
 					    bool in_vblank_irq);
-- 
2.24.1
