From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 16/22] drm/sti: Convert to CRTC VBLANK callbacks
Date: Mon, 20 Jan 2020 09:23:08 +0100
Message-ID: <20200120082314.14756-17-tzimmermann@suse.de>
References: <20200120082314.14756-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200120082314.14756-1-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: nouveau.vger.kernel.org

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert sti over.

v2:
	* remove unnecessary include of sti_crtc.h from sti_drv.c

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 drivers/gpu/drm/sti/sti_crtc.c | 11 ++++++++---
 drivers/gpu/drm/sti/sti_crtc.h |  2 --
 drivers/gpu/drm/sti/sti_drv.c  |  4 ----
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index dc64fbfc4e61..49e6cb8f5836 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -279,12 +279,13 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 	return 0;
 }
 
-int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
+static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct sti_private *dev_priv = dev->dev_private;
 	struct sti_compositor *compo = dev_priv->compo;
 	struct notifier_block *vtg_vblank_nb = &compo->vtg_vblank_nb[pipe];
-	struct drm_crtc *crtc = &compo->mixer[pipe]->drm_crtc;
 	struct sti_vtg *vtg = compo->vtg[pipe];
 
 	DRM_DEBUG_DRIVER("\n");
@@ -297,8 +298,10 @@ int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
 	return 0;
 }
 
-void sti_crtc_disable_vblank(struct drm_device *drm_dev, unsigned int pipe)
+static void sti_crtc_disable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *drm_dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct sti_private *priv = drm_dev->dev_private;
 	struct sti_compositor *compo = priv->compo;
 	struct notifier_block *vtg_vblank_nb = &compo->vtg_vblank_nb[pipe];
@@ -330,6 +333,8 @@ static const struct drm_crtc_funcs sti_crtc_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.late_register = sti_crtc_late_register,
+	.enable_vblank = sti_crtc_enable_vblank,
+	.disable_vblank = sti_crtc_disable_vblank,
 };
 
 bool sti_crtc_is_main(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/sti/sti_crtc.h b/drivers/gpu/drm/sti/sti_crtc.h
index df489ab14e2b..1132b4586712 100644
--- a/drivers/gpu/drm/sti/sti_crtc.h
+++ b/drivers/gpu/drm/sti/sti_crtc.h
@@ -15,8 +15,6 @@ struct sti_mixer;
 
 int sti_crtc_init(struct drm_device *drm_dev, struct sti_mixer *mixer,
 		  struct drm_plane *primary, struct drm_plane *cursor);
-int sti_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe);
-void sti_crtc_disable_vblank(struct drm_device *dev, unsigned int pipe);
 int sti_crtc_vblank_cb(struct notifier_block *nb,
 		       unsigned long event, void *data);
 bool sti_crtc_is_main(struct drm_crtc *drm_crtc);
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index a39fc36f815b..50870d8cbb76 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 
-#include "sti_crtc.h"
 #include "sti_drv.h"
 #include "sti_plane.h"
 
@@ -146,9 +145,6 @@ static struct drm_driver sti_driver = {
 	.dumb_create = drm_gem_cma_dumb_create,
 	.fops = &sti_driver_fops,
 
-	.enable_vblank = sti_crtc_enable_vblank,
-	.disable_vblank = sti_crtc_disable_vblank,
-
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
-- 
2.24.1
