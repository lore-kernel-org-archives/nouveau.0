From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/23] drm/stm: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Date: Fri, 10 Jan 2020 10:21:12 +0100
Message-ID: <20200110092127.27847-9-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert stm
over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/stm/drv.c  |  1 -
 drivers/gpu/drm/stm/ltdc.c | 65 ++++++++++++++++++++------------------
 drivers/gpu/drm/stm/ltdc.h |  5 ---
 3 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 5a9f9aca8bc2..486985604109 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -72,7 +72,6 @@ static struct drm_driver drv_driver = {
 	.gem_prime_vmap = drm_gem_cma_prime_vmap,
 	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = drm_gem_cma_prime_mmap,
-	.get_scanout_position = ltdc_crtc_scanoutpos,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
 };
 
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index c2815e8ae1da..8b6d1a2252e3 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -636,38 +636,13 @@ static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
-static const struct drm_crtc_helper_funcs ltdc_crtc_helper_funcs = {
-	.mode_valid = ltdc_crtc_mode_valid,
-	.mode_fixup = ltdc_crtc_mode_fixup,
-	.mode_set_nofb = ltdc_crtc_mode_set_nofb,
-	.atomic_flush = ltdc_crtc_atomic_flush,
-	.atomic_enable = ltdc_crtc_atomic_enable,
-	.atomic_disable = ltdc_crtc_atomic_disable,
-};
-
-static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-
-	DRM_DEBUG_DRIVER("\n");
-	reg_set(ldev->regs, LTDC_IER, IER_LIE);
-
-	return 0;
-}
-
-static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-
-	DRM_DEBUG_DRIVER("\n");
-	reg_clear(ldev->regs, LTDC_IER, IER_LIE);
-}
-
-bool ltdc_crtc_scanoutpos(struct drm_device *ddev, unsigned int pipe,
-			  bool in_vblank_irq, int *vpos, int *hpos,
-			  ktime_t *stime, ktime_t *etime,
-			  const struct drm_display_mode *mode)
+static bool ltdc_crtc_get_scanout_position(struct drm_crtc *crtc,
+					   bool in_vblank_irq,
+					   int *vpos, int *hpos,
+					   ktime_t *stime, ktime_t *etime,
+					   const struct drm_display_mode *mode)
 {
+	struct drm_device *ddev = crtc->dev;
 	struct ltdc_device *ldev = ddev->dev_private;
 	int line, vactive_start, vactive_end, vtotal;
 
@@ -710,6 +685,34 @@ bool ltdc_crtc_scanoutpos(struct drm_device *ddev, unsigned int pipe,
 	return true;
 }
 
+static const struct drm_crtc_helper_funcs ltdc_crtc_helper_funcs = {
+	.mode_valid = ltdc_crtc_mode_valid,
+	.mode_fixup = ltdc_crtc_mode_fixup,
+	.mode_set_nofb = ltdc_crtc_mode_set_nofb,
+	.atomic_flush = ltdc_crtc_atomic_flush,
+	.atomic_enable = ltdc_crtc_atomic_enable,
+	.atomic_disable = ltdc_crtc_atomic_disable,
+	.get_scanout_position = ltdc_crtc_get_scanout_position,
+};
+
+static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
+
+	DRM_DEBUG_DRIVER("\n");
+	reg_set(ldev->regs, LTDC_IER, IER_LIE);
+
+	return 0;
+}
+
+static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
+
+	DRM_DEBUG_DRIVER("\n");
+	reg_clear(ldev->regs, LTDC_IER, IER_LIE);
+}
+
 static const struct drm_crtc_funcs ltdc_crtc_funcs = {
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index a1ad0ae3b006..c5467d74e707 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -39,11 +39,6 @@ struct ltdc_device {
 	struct drm_atomic_state *suspend_state;
 };
 
-bool ltdc_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
-			  bool in_vblank_irq, int *vpos, int *hpos,
-			  ktime_t *stime, ktime_t *etime,
-			  const struct drm_display_mode *mode);
-
 int ltdc_load(struct drm_device *ddev);
 void ltdc_unload(struct drm_device *ddev);
 void ltdc_suspend(struct drm_device *ddev);
-- 
2.24.1
