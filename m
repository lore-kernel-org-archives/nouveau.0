From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 16/37] drm/<drivers>: reorder framebuffer init sequence
Date: Wed, 12 Dec 2012 14:06:56 +0100
Message-ID: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-driver-ati>
List-Post: <mailto:xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

With more fine-grained locking we can no longer rely on the big
mode_config lock to prevent concurrent access to mode resources
like framebuffers. Instead a framebuffer becomes accessible to
other threads as soon as it is added to the relevant lookup
structures. Hence it needs to be fully set up by the time drivers
call drm_framebuffer_init.

This patch here is the drivers part of that reorg. Nothing really fancy
going on safe for three special cases.

- exynos needs to be careful to properly unref all handles.
- nouveau gets a resource leak fixed for free: one of the error
  cases didn't cleanup the framebuffer, which is now moot since
  the framebuffer is only registered once it is fully set up.
- vmwgfx requires a slight reordering of operations, I'm hoping I didn't
  break anything (but it's refcount management only, so should be safe).

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/ast/ast_main.c            |    4 ++--
 drivers/gpu/drm/cirrus/cirrus_main.c      |    9 +++++++--
 drivers/gpu/drm/drm_fb_cma_helper.c       |   10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   20 +++++++++++---------
 drivers/gpu/drm/gma500/framebuffer.c      |    4 ++--
 drivers/gpu/drm/i915/intel_display.c      |    5 +++--
 drivers/gpu/drm/mgag200/mgag200_main.c    |    8 +++++---
 drivers/gpu/drm/nouveau/nouveau_display.c |   10 +++++-----
 drivers/gpu/drm/radeon/radeon_display.c   |    2 +-
 drivers/gpu/drm/udl/udl_fb.c              |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       |   28 ++++++++++++++--------------
 drivers/staging/omapdrm/omap_fb.c         |   16 ++++++++--------
 12 files changed, 64 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f668e6c..d5ba709 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -266,13 +266,13 @@ int ast_framebuffer_init(struct drm_device *dev,
 {
 	int ret;
 
+	drm_helper_mode_fill_fb_struct(&ast_fb->base, mode_cmd);
+	ast_fb->obj = obj;
 	ret = drm_framebuffer_init(dev, &ast_fb->base, &ast_fb_funcs);
 	if (ret) {
 		DRM_ERROR("framebuffer init failed %d\n", ret);
 		return ret;
 	}
-	drm_helper_mode_fill_fb_struct(&ast_fb->base, mode_cmd);
-	ast_fb->obj = obj;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/cirrus/cirrus_main.c b/drivers/gpu/drm/cirrus/cirrus_main.c
index 6a9b12e..2eac87b 100644
--- a/drivers/gpu/drm/cirrus/cirrus_main.c
+++ b/drivers/gpu/drm/cirrus/cirrus_main.c
@@ -42,13 +42,13 @@ int cirrus_framebuffer_init(struct drm_device *dev,
 {
 	int ret;
 
+	drm_helper_mode_fill_fb_struct(&gfb->base, mode_cmd);
+	gfb->obj = obj;
 	ret = drm_framebuffer_init(dev, &gfb->base, &cirrus_fb_funcs);
 	if (ret) {
 		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
 		return ret;
 	}
-	drm_helper_mode_fill_fb_struct(&gfb->base, mode_cmd);
-	gfb->obj = obj;
 	return 0;
 }
 
@@ -79,6 +79,11 @@ cirrus_user_framebuffer_create(struct drm_device *dev,
 
 	ret = cirrus_framebuffer_init(dev, cirrus_fb, mode_cmd, obj);
 	if (ret) {
+	ret = drm_framebuffer_init(dev, &gfb->base, &cirrus_fb_funcs);
+	if (ret) {
+		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
+		return ret;
+	}
 		drm_gem_object_unreference_unlocked(obj);
 		kfree(cirrus_fb);
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index fd9d0af..e1e0cb0 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -85,6 +85,11 @@ static struct drm_fb_cma *drm_fb_cma_alloc(struct drm_device *dev,
 	if (!fb_cma)
 		return ERR_PTR(-ENOMEM);
 
+	drm_helper_mode_fill_fb_struct(&fb_cma->fb, mode_cmd);
+
+	for (i = 0; i < num_planes; i++)
+		fb_cma->obj[i] = obj[i];
+
 	ret = drm_framebuffer_init(dev, &fb_cma->fb, &drm_fb_cma_funcs);
 	if (ret) {
 		dev_err(dev->dev, "Failed to initalize framebuffer: %d\n", ret);
@@ -92,11 +97,6 @@ static struct drm_fb_cma *drm_fb_cma_alloc(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	drm_helper_mode_fill_fb_struct(&fb_cma->fb, mode_cmd);
-
-	for (i = 0; i < num_planes; i++)
-		fb_cma->obj[i] = obj[i];
-
 	return fb_cma;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 4ef4cd3..179c177 100644
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
 
@@ -202,12 +202,6 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-ENOENT);
 	}
 
-	fb = exynos_drm_framebuffer_init(dev, mode_cmd, obj);
-	if (IS_ERR(fb)) {
-		drm_gem_object_unreference_unlocked(obj);
-		return fb;
-	}
-
 	exynos_fb = to_exynos_fb(fb);
 	exynos_fb->buf_cnt = exynos_drm_format_num_buffers(mode_cmd);
 
@@ -225,6 +219,14 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		exynos_fb->exynos_gem_obj[i] = to_exynos_gem_obj(obj);
 	}
 
+	fb = exynos_drm_framebuffer_init(dev, mode_cmd, obj);
+	if (IS_ERR(fb)) {
+		for (i = 0; i < exynos_fb->buf_cnt; i++)
+			drm_gem_object_unreference_unlocked(&exynos_fb->exynos_gem_obj[i]->base);
+
+		return fb;
+	}
+
 	return fb;
 }
 
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index afded54..38e7e75 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -260,13 +260,13 @@ static int psb_framebuffer_init(struct drm_device *dev,
 	default:
 		return -EINVAL;
 	}
+	drm_helper_mode_fill_fb_struct(&fb->base, mode_cmd);
+	fb->gtt = gt;
 	ret = drm_framebuffer_init(dev, &fb->base, &psb_fb_funcs);
 	if (ret) {
 		dev_err(dev->dev, "framebuffer init failed: %d\n", ret);
 		return ret;
 	}
-	drm_helper_mode_fill_fb_struct(&fb->base, mode_cmd);
-	fb->gtt = gt;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index a0d8869..65f5362 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -8311,14 +8311,15 @@ int intel_framebuffer_init(struct drm_device *dev,
 	if (mode_cmd->offsets[0] != 0)
 		return -EINVAL;
 
+	drm_helper_mode_fill_fb_struct(&intel_fb->base, mode_cmd);
+	intel_fb->obj = obj;
+
 	ret = drm_framebuffer_init(dev, &intel_fb->base, &intel_fb_funcs);
 	if (ret) {
 		DRM_ERROR("framebuffer init failed %d\n", ret);
 		return ret;
 	}
 
-	drm_helper_mode_fill_fb_struct(&intel_fb->base, mode_cmd);
-	intel_fb->obj = obj;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 70dd3c5..266438a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -40,13 +40,15 @@ int mgag200_framebuffer_init(struct drm_device *dev,
 			     struct drm_mode_fb_cmd2 *mode_cmd,
 			     struct drm_gem_object *obj)
 {
-	int ret = drm_framebuffer_init(dev, &gfb->base, &mga_fb_funcs);
+	int ret;
+	
+	drm_helper_mode_fill_fb_struct(&gfb->base, mode_cmd);
+	gfb->obj = obj;
+	ret = drm_framebuffer_init(dev, &gfb->base, &mga_fb_funcs);
 	if (ret) {
 		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
 		return ret;
 	}
-	drm_helper_mode_fill_fb_struct(&gfb->base, mode_cmd);
-	gfb->obj = obj;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e4188f2..2591ff2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -78,11 +78,6 @@ nouveau_framebuffer_init(struct drm_device *dev,
 	struct drm_framebuffer *fb = &nv_fb->base;
 	int ret;
 
-	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
-	if (ret) {
-		return ret;
-	}
-
 	drm_helper_mode_fill_fb_struct(fb, mode_cmd);
 	nv_fb->nvbo = nvbo;
 
@@ -125,6 +120,11 @@ nouveau_framebuffer_init(struct drm_device *dev,
 		}
 	}
 
+	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
+	if (ret) {
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index bfa2a60..8724196 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1080,12 +1080,12 @@ radeon_framebuffer_init(struct drm_device *dev,
 {
 	int ret;
 	rfb->obj = obj;
+	drm_helper_mode_fill_fb_struct(&rfb->base, mode_cmd);
 	ret = drm_framebuffer_init(dev, &rfb->base, &radeon_fb_funcs);
 	if (ret) {
 		rfb->obj = NULL;
 		return ret;
 	}
-	drm_helper_mode_fill_fb_struct(&rfb->base, mode_cmd);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
index d4ab3be..829c4a7 100644
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ b/drivers/gpu/drm/udl/udl_fb.c
@@ -435,8 +435,8 @@ udl_framebuffer_init(struct drm_device *dev,
 	int ret;
 
 	ufb->obj = obj;
-	ret = drm_framebuffer_init(dev, &ufb->base, &udlfb_funcs);
 	drm_helper_mode_fill_fb_struct(&ufb->base, mode_cmd);
+	ret = drm_framebuffer_init(dev, &ufb->base, &udlfb_funcs);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 385b8849..d2e2d49 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -714,14 +714,9 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 		goto out_err1;
 	}
 
-	ret = drm_framebuffer_init(dev, &vfbs->base.base,
-				   &vmw_framebuffer_surface_funcs);
-	if (ret)
-		goto out_err2;
-
 	if (!vmw_surface_reference(surface)) {
 		DRM_ERROR("failed to reference surface %p\n", surface);
-		goto out_err3;
+		goto out_err2;
 	}
 
 	/* XXX get the first 3 from the surface info */
@@ -740,10 +735,15 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 
 	*out = &vfbs->base;
 
+	ret = drm_framebuffer_init(dev, &vfbs->base.base,
+				   &vmw_framebuffer_surface_funcs);
+	if (ret)
+		goto out_err3;
+
 	return 0;
 
 out_err3:
-	drm_framebuffer_cleanup(&vfbs->base.base);
+	vmw_surface_unreference(&surface);
 out_err2:
 	kfree(vfbs);
 out_err1:
@@ -1086,14 +1086,9 @@ static int vmw_kms_new_framebuffer_dmabuf(struct vmw_private *dev_priv,
 		goto out_err1;
 	}
 
-	ret = drm_framebuffer_init(dev, &vfbd->base.base,
-				   &vmw_framebuffer_dmabuf_funcs);
-	if (ret)
-		goto out_err2;
-
 	if (!vmw_dmabuf_reference(dmabuf)) {
 		DRM_ERROR("failed to reference dmabuf %p\n", dmabuf);
-		goto out_err3;
+		goto out_err2;
 	}
 
 	vfbd->base.base.bits_per_pixel = mode_cmd->bpp;
@@ -1110,10 +1105,15 @@ static int vmw_kms_new_framebuffer_dmabuf(struct vmw_private *dev_priv,
 	vfbd->base.user_handle = mode_cmd->handle;
 	*out = &vfbd->base;
 
+	ret = drm_framebuffer_init(dev, &vfbd->base.base,
+				   &vmw_framebuffer_dmabuf_funcs);
+	if (ret)
+		goto out_err3;
+
 	return 0;
 
 out_err3:
-	drm_framebuffer_cleanup(&vfbd->base.base);
+	vmw_dmabuf_unreference(&dmabuf);
 out_err2:
 	kfree(vfbd);
 out_err1:
diff --git a/drivers/staging/omapdrm/omap_fb.c b/drivers/staging/omapdrm/omap_fb.c
index 446801d..5090547 100644
--- a/drivers/staging/omapdrm/omap_fb.c
+++ b/drivers/staging/omapdrm/omap_fb.c
@@ -425,14 +425,6 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 	}
 
 	fb = &omap_fb->base;
-	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
-	if (ret) {
-		dev_err(dev->dev, "framebuffer init failed: %d\n", ret);
-		goto fail;
-	}
-
-	DBG("create: FB ID: %d (%p)", fb->base.id, fb);
-
 	omap_fb->format = format;
 
 	for (i = 0; i < n; i++) {
@@ -463,6 +455,14 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 
 	drm_helper_mode_fill_fb_struct(fb, mode_cmd);
 
+	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
+	if (ret) {
+		dev_err(dev->dev, "framebuffer init failed: %d\n", ret);
+		goto fail;
+	}
+
+	DBG("create: FB ID: %d (%p)", fb->base.id, fb);
+
 	return fb;
 
 fail:
-- 
1.7.10.4
