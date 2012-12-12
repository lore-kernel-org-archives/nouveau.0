From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 20/37] drm: revamp framebuffer cleanup interfaces
Date: Wed, 12 Dec 2012 14:07:00 +0100
Message-ID: <1355317637-16742-21-git-send-email-daniel.vetter@ffwll.ch>
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

We have two classes of framebuffer
- Created by the driver (atm only for fbdev), and the driver holds
  onto the last reference count until destruction.
- Created by userspace and associated with a given fd. These
  framebuffers will be reaped when their assoiciated fb is closed.

Now these two cases are set up differently, the framebuffers are on
different lists and hence destruction needs to clean up different
things. Also, for userspace framebuffers we remove them from any
current usage, whereas for internal framebuffers it is assumed that
the driver has done this already.

Long story short, we need two different ways to cleanup such drivers.
Three functions are involved in total:
- drm_framebuffer_remove: Convenience function which removes the fb
  from all active usage and then drops the passed-in reference.
- drm_framebuffer_unregister_private: Will remove driver-private
  framebuffers from relevant lists and drop the corresponding
  references. Should be called for driver-private framebuffers before
  dropping the last reference (or like for a lot of the drivers where
  the fbdev is embedded someplace else, before doing the cleanup
  manually).
- drm_framebuffer_cleanup: Final cleanup for both classes of fbs,
  should be called by the driver's ->destroy callback once the last
  reference is gone.

This patch just rolls out the new interfaces and updates all drivers
(by adding calls to drm_framebuffer_unregister_private at all the
right places)- no functional changes yet. Follow-on patches will move
drm core code around and update the lifetime management for
framebuffers, so that we are no longer required to keep framebuffers
alive by locking mode_config.mutex.

I've also updated the kerneldoc already.

vmwgfx seems to again be a bit special, at least I haven't figured out
how the fbdev support in that driver works. It smells like it's
external though.

v2: The i915 driver creates another private framebuffer in the
load-detect code. Adjust its cleanup code, too.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/ast/ast_fb.c              |    1 +
 drivers/gpu/drm/cirrus/cirrus_fbdev.c     |    1 +
 drivers/gpu/drm/drm_crtc.c                |   31 ++++++++++++++++++++++++++---
 drivers/gpu/drm/drm_fb_cma_helper.c       |    5 ++++-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |    4 +++-
 drivers/gpu/drm/gma500/framebuffer.c      |    1 +
 drivers/gpu/drm/i915/intel_display.c      |    6 ++++--
 drivers/gpu/drm/i915/intel_fb.c           |    1 +
 drivers/gpu/drm/mgag200/mgag200_fb.c      |    1 +
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   |    1 +
 drivers/gpu/drm/radeon/radeon_fb.c        |    2 ++
 drivers/gpu/drm/udl/udl_fb.c              |    1 +
 drivers/staging/omapdrm/omap_fbdev.c      |    8 ++++++--
 include/drm/drm_crtc.h                    |    1 +
 14 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb.c
index d9ec779..3e6584b 100644
--- a/drivers/gpu/drm/ast/ast_fb.c
+++ b/drivers/gpu/drm/ast/ast_fb.c
@@ -290,6 +290,7 @@ static void ast_fbdev_destroy(struct drm_device *dev,
 	drm_fb_helper_fini(&afbdev->helper);
 
 	vfree(afbdev->sysram);
+	drm_framebuffer_unregister_private(&afb->base);
 	drm_framebuffer_cleanup(&afb->base);
 }
 
diff --git a/drivers/gpu/drm/cirrus/cirrus_fbdev.c b/drivers/gpu/drm/cirrus/cirrus_fbdev.c
index 6c6b4c8..3daea0f 100644
--- a/drivers/gpu/drm/cirrus/cirrus_fbdev.c
+++ b/drivers/gpu/drm/cirrus/cirrus_fbdev.c
@@ -258,6 +258,7 @@ static int cirrus_fbdev_destroy(struct drm_device *dev,
 
 	vfree(gfbdev->sysram);
 	drm_fb_helper_fini(&gfbdev->helper);
+	drm_framebuffer_unregister_private(&gfb->base);
 	drm_framebuffer_cleanup(&gfb->base);
 
 	return 0;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 17cdd32..e2d70f6 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -68,6 +68,7 @@ void drm_modeset_unlock_all(struct drm_device *dev)
 
 	mutex_unlock(&dev->mode_config.mutex);
 }
+
 EXPORT_SYMBOL(drm_modeset_unlock_all);
 
 /* Avoid boilerplate.  I'm tired of typing. */
@@ -429,11 +430,34 @@ void drm_framebuffer_reference(struct drm_framebuffer *fb)
 EXPORT_SYMBOL(drm_framebuffer_reference);
 
 /**
+ * drm_framebuffer_unregister_private - unregister a private fb from the lookup idr
+ * @fb: fb to unregister
+ *
+ * Drivers need to call this when cleaning up driver-private framebuffers, e.g.
+ * those used for fbdev. Note that the caller must hold a reference of it's own,
+ * i.e. the object may not be destroyed through this call (since it'll lead to a
+ * locking inversion).
+ */
+void drm_framebuffer_unregister_private(struct drm_framebuffer *fb)
+{
+}
+EXPORT_SYMBOL(drm_framebuffer_unregister_private);
+
+/**
  * drm_framebuffer_cleanup - remove a framebuffer object
  * @fb: framebuffer to remove
  *
- * Scans all the CRTCs in @dev's mode_config.  If they're using @fb, removes
- * it, setting it to NULL.
+ * Cleanup references to a user-created framebuffer. This function is intended
+ * to be used from the drivers ->destroy callback.
+ *
+ * Note that this function does not remove the fb from active usuage - if it is
+ * still used anywhere, hilarity can ensue since userspace could call getfb on
+ * the id and get back -EINVAL. Obviously no concern at driver unload time.
+ *
+ * Also, the framebuffer will not be removed from the lookup idr - for
+ * user-created framebuffers this will happen in in the rmfb ioctl. For
+ * driver-private objects (e.g. for fbdev) drivers need to explicitly call
+ * drm_framebuffer_unregister_private.
  */
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
@@ -459,7 +483,8 @@ EXPORT_SYMBOL(drm_framebuffer_cleanup);
  * @fb: framebuffer to remove
  *
  * Scans all the CRTCs and planes in @dev's mode_config.  If they're
- * using @fb, removes it, setting it to NULL.
+ * using @fb, removes it, setting it to NULL. Then drops the reference to the
+ * passed-in framebuffer.
  */
 void drm_framebuffer_remove(struct drm_framebuffer *fb)
 {
diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index e1e0cb0..3742bc9 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -266,6 +266,7 @@ static int drm_fbdev_cma_create(struct drm_fb_helper *helper,
 	return 0;
 
 err_drm_fb_cma_destroy:
+	drm_framebuffer_unregister_private(fb);
 	drm_fb_cma_destroy(fb);
 err_framebuffer_release:
 	framebuffer_release(fbi);
@@ -370,8 +371,10 @@ void drm_fbdev_cma_fini(struct drm_fbdev_cma *fbdev_cma)
 		framebuffer_release(info);
 	}
 
-	if (fbdev_cma->fb)
+	if (fbdev_cma->fb) {
+		drm_framebuffer_unregister_private(&fbdev_cma->fb->fb);
 		drm_fb_cma_destroy(&fbdev_cma->fb->fb);
+	}
 
 	drm_fb_helper_fini(&fbdev_cma->fb_helper);
 	kfree(fbdev_cma);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 67eb6ba..d333e9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -269,8 +269,10 @@ static void exynos_drm_fbdev_destroy(struct drm_device *dev,
 	/* release drm framebuffer and real buffer */
 	if (fb_helper->fb && fb_helper->fb->funcs) {
 		fb = fb_helper->fb;
-		if (fb)
+		if (fb) {
+			drm_framebuffer_unregister_private(fb);
 			drm_framebuffer_remove(fb);
+		}
 	}
 
 	/* release linux framebuffer */
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 49800d2..c1ef37e 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -590,6 +590,7 @@ static int psb_fbdev_destroy(struct drm_device *dev, struct psb_fbdev *fbdev)
 		framebuffer_release(info);
 	}
 	drm_fb_helper_fini(&fbdev->psb_fb_helper);
+	drm_framebuffer_unregister_private(&psbfb->base);
 	drm_framebuffer_cleanup(&psbfb->base);
 
 	if (psbfb->gtt)
diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 65f5362..fd8cfeb 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -6479,8 +6479,10 @@ void intel_release_load_detect_pipe(struct drm_connector *connector,
 		intel_encoder->new_crtc = NULL;
 		intel_set_mode(crtc, NULL, 0, 0, NULL);
 
-		if (old->release_fb)
-			old->release_fb->funcs->destroy(old->release_fb);
+		if (old->release_fb) {
+			drm_framebuffer_unregister_private(old->release_fb);
+			drm_framebuffer_unreference(old->release_fb);
+		}
 
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/intel_fb.c b/drivers/gpu/drm/i915/intel_fb.c
index ed7bb33..dca62dd 100644
--- a/drivers/gpu/drm/i915/intel_fb.c
+++ b/drivers/gpu/drm/i915/intel_fb.c
@@ -214,6 +214,7 @@ static void intel_fbdev_destroy(struct drm_device *dev,
 
 	drm_fb_helper_fini(&ifbdev->helper);
 
+	drm_framebuffer_unregister_private(&ifb->base);
 	drm_framebuffer_cleanup(&ifb->base);
 	if (ifb->obj) {
 		drm_gem_object_unreference_unlocked(&ifb->obj->base);
diff --git a/drivers/gpu/drm/mgag200/mgag200_fb.c b/drivers/gpu/drm/mgag200/mgag200_fb.c
index 2f48648..5c69b43 100644
--- a/drivers/gpu/drm/mgag200/mgag200_fb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_fb.c
@@ -247,6 +247,7 @@ static int mga_fbdev_destroy(struct drm_device *dev,
 	}
 	drm_fb_helper_fini(&mfbdev->helper);
 	vfree(mfbdev->sysram);
+	drm_framebuffer_unregister_private(&mfb->base);
 	drm_framebuffer_cleanup(&mfb->base);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 67a1a06..d4ecb4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -433,6 +433,7 @@ nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 		nouveau_fb->nvbo = NULL;
 	}
 	drm_fb_helper_fini(&fbcon->helper);
+	drm_framebuffer_unregister_private(&nouveau_fb->base);
 	drm_framebuffer_cleanup(&nouveau_fb->base);
 	return 0;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index cc8489d..515e5ee 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -293,6 +293,7 @@ out_unref:
 	}
 	if (fb && ret) {
 		drm_gem_object_unreference(gobj);
+		drm_framebuffer_unregister_private(fb);
 		drm_framebuffer_cleanup(fb);
 		kfree(fb);
 	}
@@ -339,6 +340,7 @@ static int radeon_fbdev_destroy(struct drm_device *dev, struct radeon_fbdev *rfb
 		rfb->obj = NULL;
 	}
 	drm_fb_helper_fini(&rfbdev->helper);
+	drm_framebuffer_unregister_private(&rfb->base);
 	drm_framebuffer_cleanup(&rfb->base);
 
 	return 0;
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
index 829c4a7..c09c04e 100644
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ b/drivers/gpu/drm/udl/udl_fb.c
@@ -556,6 +556,7 @@ static void udl_fbdev_destroy(struct drm_device *dev,
 		framebuffer_release(info);
 	}
 	drm_fb_helper_fini(&ufbdev->helper);
+	drm_framebuffer_unregister_private(&ufbdev->ufb.base);
 	drm_framebuffer_cleanup(&ufbdev->ufb.base);
 	drm_gem_object_unreference_unlocked(&ufbdev->ufb.obj->base);
 }
diff --git a/drivers/staging/omapdrm/omap_fbdev.c b/drivers/staging/omapdrm/omap_fbdev.c
index 8a027bb..2728e37 100644
--- a/drivers/staging/omapdrm/omap_fbdev.c
+++ b/drivers/staging/omapdrm/omap_fbdev.c
@@ -275,8 +275,10 @@ fail:
 	if (ret) {
 		if (fbi)
 			framebuffer_release(fbi);
-		if (fb)
+		if (fb) {
+			drm_framebuffer_unregister_private(fb);
 			drm_framebuffer_remove(fb);
+		}
 	}
 
 	return ret;
@@ -400,8 +402,10 @@ void omap_fbdev_free(struct drm_device *dev)
 	fbdev = to_omap_fbdev(priv->fbdev);
 
 	/* this will free the backing object */
-	if (fbdev->fb)
+	if (fbdev->fb) {
+		drm_framebuffer_unregister_private(fbdev->fb);
 		drm_framebuffer_remove(fbdev->fb);
+	}
 
 	kfree(fbdev);
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 77b6a2d..b24ad78 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -970,6 +970,7 @@ extern void drm_framebuffer_unreference(struct drm_framebuffer *fb);
 extern void drm_framebuffer_reference(struct drm_framebuffer *fb);
 extern void drm_framebuffer_remove(struct drm_framebuffer *fb);
 extern void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
+extern void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 extern int drmfb_probe(struct drm_device *dev, struct drm_crtc *crtc);
 extern int drmfb_remove(struct drm_device *dev, struct drm_framebuffer *fb);
 extern void drm_crtc_probe_connector_modes(struct drm_device *dev, int maxX, int maxY);
-- 
1.7.10.4
