From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 19/21] drm/vkms: Convert to CRTC VBLANK callbacks
Date: Wed, 15 Jan 2020 13:16:50 +0100
Message-ID: <20200115121652.7050-20-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: nouveau.vger.kernel.org

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert vkms over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 9 ++++++---
 drivers/gpu/drm/vkms/vkms_drv.c  | 1 -
 drivers/gpu/drm/vkms/vkms_drv.h  | 4 ----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 74f703b8d22a..ac85e17428f8 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -76,10 +76,12 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
 	hrtimer_cancel(&out->vblank_hrtimer);
 }
 
-bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
-			       int *max_error, ktime_t *vblank_time,
-			       bool in_vblank_irq)
+static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
+				      int *max_error, ktime_t *vblank_time,
+				      bool in_vblank_irq)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
@@ -154,6 +156,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.atomic_destroy_state   = vkms_atomic_crtc_destroy_state,
 	.enable_vblank		= vkms_enable_vblank,
 	.disable_vblank		= vkms_disable_vblank,
+	.get_vblank_timestamp	= vkms_get_vblank_timestamp,
 	.get_crc_sources	= vkms_get_crc_sources,
 	.set_crc_source		= vkms_set_crc_source,
 	.verify_crc_source	= vkms_verify_crc_source,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 25bd7519295f..860de052e820 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -103,7 +103,6 @@ static struct drm_driver vkms_driver = {
 	.dumb_create		= vkms_dumb_create,
 	.gem_vm_ops		= &vkms_gem_vm_ops,
 	.gem_free_object_unlocked = vkms_gem_free_object,
-	.get_vblank_timestamp	= vkms_get_vblank_timestamp,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 7d52e24564db..eda04ffba7b1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -111,10 +111,6 @@ struct vkms_gem_object {
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor);
 
-bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
-			       int *max_error, ktime_t *vblank_time,
-			       bool in_vblank_irq);
-
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
 struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-- 
2.24.1
