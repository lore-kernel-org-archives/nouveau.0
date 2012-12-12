From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 27/37] drm: refcounting for sprite framebuffers
Date: Wed, 12 Dec 2012 14:07:07 +0100
Message-ID: <1355317637-16742-28-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
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
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Now plane->fb holds a reference onto it's framebuffer. Nothing too
fancy going on here:
- Extract __drm_framebuffer_unreference to be called when we know
  we're not dropping the last reference, e.g. useful in the fb cleanup
  code.
- Reduce the locked sections in the set_plane ioctl to only protect
  plane->fb/plane->crtc and the driver callback (i.e. hw state).
  Everything either doesn't disappear (crtc, plane) or is refcounted
  (fb), and all the data we check is invariant over the respective
  object's lifetimes.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |   30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 8132e13..ccf15ad 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -444,6 +444,12 @@ static void drm_framebuffer_free_bug(struct kref *kref)
 	BUG();
 }
 
+static void __drm_framebuffer_unreference(struct drm_framebuffer *fb)
+{
+	DRM_DEBUG("FB ID: %d\n", fb->base.id);
+	kref_put(&fb->refcount, drm_framebuffer_free_bug);
+}
+
 /* dev->mode_config.fb_lock must be held! */
 static void __drm_framebuffer_unregister(struct drm_device *dev,
 					 struct drm_framebuffer *fb)
@@ -454,7 +460,7 @@ static void __drm_framebuffer_unregister(struct drm_device *dev,
 
 	fb->base.id = 0;
 
-	kref_put(&fb->refcount, drm_framebuffer_free_bug);
+	__drm_framebuffer_unreference(fb);
 }
 
 /**
@@ -543,6 +549,7 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 			if (ret)
 				DRM_ERROR("failed to disable plane with busy fb\n");
 			/* disconnect the plane from the fb and crtc: */
+			__drm_framebuffer_unreference(plane->fb);
 			plane->fb = NULL;
 			plane->crtc = NULL;
 		}
@@ -1849,7 +1856,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	struct drm_mode_object *obj;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
-	struct drm_framebuffer *fb;
+	struct drm_framebuffer *fb = NULL, *old_fb = NULL;
 	int ret = 0;
 	unsigned int fb_width, fb_height;
 	int i;
@@ -1857,8 +1864,6 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
-
 	/*
 	 * First, find the plane, crtc, and fb objects.  If not available,
 	 * we don't bother to call the driver.
@@ -1868,16 +1873,18 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	if (!obj) {
 		DRM_DEBUG_KMS("Unknown plane ID %d\n",
 			      plane_req->plane_id);
-		ret = -ENOENT;
-		goto out;
+		return -ENOENT;
 	}
 	plane = obj_to_plane(obj);
 
 	/* No fb means shut it down */
 	if (!plane_req->fb_id) {
+		drm_modeset_lock_all(dev);
+		old_fb = plane->fb;
 		plane->funcs->disable_plane(plane);
 		plane->crtc = NULL;
 		plane->fb = NULL;
+		drm_modeset_unlock_all(dev);
 		goto out;
 	}
 
@@ -1898,8 +1905,6 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 		ret = -ENOENT;
 		goto out;
 	}
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
 
 	/* Check whether this plane supports the fb pixel format. */
 	for (i = 0; i < plane->format_count; i++)
@@ -1945,18 +1950,25 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 		goto out;
 	}
 
+	drm_modeset_lock_all(dev);
 	ret = plane->funcs->update_plane(plane, crtc, fb,
 					 plane_req->crtc_x, plane_req->crtc_y,
 					 plane_req->crtc_w, plane_req->crtc_h,
 					 plane_req->src_x, plane_req->src_y,
 					 plane_req->src_w, plane_req->src_h);
 	if (!ret) {
+		old_fb = plane->fb;
+		fb = NULL;
 		plane->crtc = crtc;
 		plane->fb = fb;
 	}
+	drm_modeset_unlock_all(dev);
 
 out:
-	drm_modeset_unlock_all(dev);
+	if (fb)
+		drm_framebuffer_unreference(fb);
+	if (old_fb)
+		drm_framebuffer_unreference(old_fb);
 
 	return ret;
 }
-- 
1.7.10.4
