From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
Date: Thu, 13 Dec 2012 12:05:19 +0100
Message-ID: <1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1355396719-25286-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

For user framebuffers it's easier to just inline the
exynos_drm_framebuffer_init helper instead of trying to adjust it -
most of the things that helper sets up need to be overwritten anyway
again due to the multiple backing storage objects support exynos has,
but does not use for the fbdev.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c |   32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 4ef4cd3..aea6500 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -136,15 +136,15 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
+	exynos_fb->exynos_gem_obj[0] = to_exynos_gem_obj(obj);
+
 	ret = drm_framebuffer_init(dev, &exynos_fb->fb, &exynos_drm_fb_funcs);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer\n");
 		return ERR_PTR(ret);
 	}
 
-	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
-	exynos_fb->exynos_gem_obj[0] = to_exynos_gem_obj(obj);
-
 	return &exynos_fb->fb;
 }
 
@@ -190,9 +190,8 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_gem_object *obj;
-	struct drm_framebuffer *fb;
 	struct exynos_drm_fb *exynos_fb;
-	int i;
+	int i, ret;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
@@ -202,13 +201,13 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-ENOENT);
 	}
 
-	fb = exynos_drm_framebuffer_init(dev, mode_cmd, obj);
-	if (IS_ERR(fb)) {
-		drm_gem_object_unreference_unlocked(obj);
-		return fb;
+	exynos_fb = kzalloc(sizeof(*exynos_fb), GFP_KERNEL);
+	if (!exynos_fb) {
+		DRM_ERROR("failed to allocate exynos drm framebuffer\n");
+		return ERR_PTR(-ENOMEM);
 	}
 
-	exynos_fb = to_exynos_fb(fb);
+	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
 	exynos_fb->buf_cnt = exynos_drm_format_num_buffers(mode_cmd);
 
 	DRM_DEBUG_KMS("buf_cnt = %d\n", exynos_fb->buf_cnt);
@@ -218,14 +217,23 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 				mode_cmd->handles[i]);
 		if (!obj) {
 			DRM_ERROR("failed to lookup gem object\n");
-			exynos_drm_fb_destroy(fb);
+			kfree(exynos_fb);
 			return ERR_PTR(-ENOENT);
 		}
 
 		exynos_fb->exynos_gem_obj[i] = to_exynos_gem_obj(obj);
 	}
 
-	return fb;
+	ret = drm_framebuffer_init(dev, &exynos_fb->fb, &exynos_drm_fb_funcs);
+	if (ret) {
+		for (i = 0; i < exynos_fb->buf_cnt; i++)
+			drm_gem_object_unreference_unlocked(&exynos_fb->exynos_gem_obj[i]->base);
+
+		kfree(exynos_fb);
+		return ERR_PTR(ret);
+	}
+
+	return &exynos_fb->fb;
 }
 
 struct exynos_drm_gem_buf *exynos_drm_fb_buffer(struct drm_framebuffer *fb,
-- 
1.7.10.4
