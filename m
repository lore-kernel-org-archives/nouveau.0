From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 17/21] drm/vc4: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
Date: Wed, 15 Jan 2020 13:16:48 +0100
Message-ID: <20200115121652.7050-18-tzimmermann@suse.de>
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
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert vc4
over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 +++++++-----
 drivers/gpu/drm/vc4/vc4_drv.c  |  1 -
 drivers/gpu/drm/vc4/vc4_drv.h  |  4 ----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index b00e20f5ce05..f1e7597ea17e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -84,13 +84,14 @@ static const struct debugfs_reg32 crtc_regs[] = {
 	VC4_REG32(PV_HACT_ACT),
 };
 
-bool vc4_crtc_get_scanoutpos(struct drm_device *dev, unsigned int crtc_id,
-			     bool in_vblank_irq, int *vpos, int *hpos,
-			     ktime_t *stime, ktime_t *etime,
-			     const struct drm_display_mode *mode)
+static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
+					  bool in_vblank_irq,
+					  int *vpos, int *hpos,
+					  ktime_t *stime, ktime_t *etime,
+					  const struct drm_display_mode *mode)
 {
+	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, crtc_id);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	u32 val;
 	int fifo_lines;
@@ -1039,6 +1040,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.atomic_flush = vc4_crtc_atomic_flush,
 	.atomic_enable = vc4_crtc_atomic_enable,
 	.atomic_disable = vc4_crtc_atomic_disable,
+	.get_scanout_position = vc4_crtc_get_scanout_position,
 };
 
 static const struct vc4_crtc_data pv0_data = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 5e6fb6c2307f..e6982a7b0c5e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -190,7 +190,6 @@ static struct drm_driver vc4_drm_driver = {
 	.irq_postinstall = vc4_irq_postinstall,
 	.irq_uninstall = vc4_irq_uninstall,
 
-	.get_scanout_position = vc4_crtc_get_scanoutpos,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
 
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6627b20c99e9..f90c0d08e740 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -743,10 +743,6 @@ void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo);
 
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
-bool vc4_crtc_get_scanoutpos(struct drm_device *dev, unsigned int crtc_id,
-			     bool in_vblank_irq, int *vpos, int *hpos,
-			     ktime_t *stime, ktime_t *etime,
-			     const struct drm_display_mode *mode);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
 void vc4_crtc_txp_armed(struct drm_crtc_state *state);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
-- 
2.24.1
