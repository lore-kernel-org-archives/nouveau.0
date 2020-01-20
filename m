From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/22] drm/nouveau: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
Date: Mon, 20 Jan 2020 09:23:00 +0100
Message-ID: <20200120082314.14756-9-tzimmermann@suse.de>
References: <20200120082314.14756-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200120082314.14756-1-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: nouveau.vger.kernel.org

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
nouveau over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c   |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c | 14 +++-----------
 drivers/gpu/drm/nouveau/nouveau_display.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 -
 5 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 37c50ea8f847..17e9d1c078a0 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1258,6 +1258,7 @@ static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
 	.mode_set_base = nv04_crtc_mode_set_base,
 	.mode_set_base_atomic = nv04_crtc_mode_set_base_atomic,
 	.disable = nv_crtc_disable,
+	.get_scanout_position = nouveau_display_scanoutpos,
 };
 
 static const uint32_t modeset_formats[] = {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index d9d64602947d..41852dd8fdbd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -413,6 +413,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
 static const struct drm_crtc_helper_funcs
 nv50_head_help = {
 	.atomic_check = nv50_head_atomic_check,
+	.get_scanout_position = nouveau_display_scanoutpos,
 };
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 53f9bceaf17a..86f99dc8fcef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -136,21 +136,13 @@ nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 }
 
 bool
-nouveau_display_scanoutpos(struct drm_device *dev, unsigned int pipe,
+nouveau_display_scanoutpos(struct drm_crtc *crtc,
 			   bool in_vblank_irq, int *vpos, int *hpos,
 			   ktime_t *stime, ktime_t *etime,
 			   const struct drm_display_mode *mode)
 {
-	struct drm_crtc *crtc;
-
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		if (nouveau_crtc(crtc)->index == pipe) {
-			return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
-							       stime, etime);
-		}
-	}
-
-	return false;
+	return nouveau_display_scanoutpos_head(crtc, vpos, hpos,
+					       stime, etime);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 6e8e66882e45..71e2af693f7f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -63,7 +63,7 @@ int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
 int  nouveau_display_vblank_enable(struct drm_device *, unsigned int);
 void nouveau_display_vblank_disable(struct drm_device *, unsigned int);
-bool  nouveau_display_scanoutpos(struct drm_device *, unsigned int,
+bool  nouveau_display_scanoutpos(struct drm_crtc *,
 				 bool, int *, int *, ktime_t *,
 				 ktime_t *, const struct drm_display_mode *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b65ae817eabf..fcc036a08965 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1122,7 +1122,6 @@ driver_stub = {
 
 	.enable_vblank = nouveau_display_vblank_enable,
 	.disable_vblank = nouveau_display_vblank_disable,
-	.get_scanout_position = nouveau_display_scanoutpos,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
 
 	.ioctls = nouveau_ioctls,
-- 
2.24.1
