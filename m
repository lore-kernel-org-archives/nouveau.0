From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 29/37] drm: refcounting for crtc framebuffers
Date: Wed, 12 Dec 2012 14:07:09 +0100
Message-ID: <1355317637-16742-30-git-send-email-daniel.vetter@ffwll.ch>
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

With the prep patch to encapsulate ->set_crtc calls, this is now
rather easy. Hooray for inconsistent semantics between ->set_crtc and
->page_flip, where the driver callback is supposed to update the fb
pointer, and ->update_plane, where the drm core does the same.

Also, since the drm core functions check crtc->fb before calling into
driver callbacks, we can't really reduce the critical sections
protected by the mode_config locks.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |   37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 229853e..6562eba 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1983,8 +1983,21 @@ out:
 int drm_mode_set_config_internal(struct drm_mode_set *set)
 {
 	struct drm_crtc *crtc = set->crtc;
+	struct drm_framebuffer *fb, *old_fb;
+	int ret;
+
+	old_fb = crtc->fb;
+	fb = set->fb;
 
-	return crtc->funcs->set_config(set);
+	ret = crtc->funcs->set_config(set);
+	if (ret == 0) {
+		if (old_fb)
+			drm_framebuffer_unreference(old_fb);
+		if (fb)
+			drm_framebuffer_reference(fb);
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_mode_set_config_internal);
 
@@ -2045,6 +2058,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 				goto out;
 			}
 			fb = crtc->fb;
+			/* Make refcounting symmetric with the lookup path. */
+			drm_framebuffer_reference(fb);
 		} else {
 			fb = drm_framebuffer_lookup(dev, crtc_req->fb_id);
 			if (!fb) {
@@ -2053,9 +2068,6 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 				ret = -EINVAL;
 				goto out;
 			}
-			/* fb is protect by the mode_config lock, so drop the
-			 * ref immediately */
-			drm_framebuffer_unreference(fb);
 		}
 
 		mode = drm_mode_create(dev);
@@ -2155,6 +2167,9 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	ret = drm_mode_set_config_internal(&set);
 
 out:
+	if (fb)
+		drm_framebuffer_unreference(fb);
+
 	kfree(connector_set);
 	drm_mode_destroy(dev, mode);
 	drm_modeset_unlock_all(dev);
@@ -3673,7 +3688,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	struct drm_mode_crtc_page_flip *page_flip = data;
 	struct drm_mode_object *obj;
 	struct drm_crtc *crtc;
-	struct drm_framebuffer *fb;
+	struct drm_framebuffer *fb = NULL, *old_fb = NULL;
 	struct drm_pending_vblank_event *e = NULL;
 	unsigned long flags;
 	int hdisplay, vdisplay;
@@ -3704,8 +3719,6 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	fb = drm_framebuffer_lookup(dev, page_flip->fb_id);
 	if (!fb)
 		goto out;
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
 
 	hdisplay = crtc->mode.hdisplay;
 	vdisplay = crtc->mode.vdisplay;
@@ -3751,6 +3764,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 			(void (*) (struct drm_pending_event *)) kfree;
 	}
 
+	old_fb = crtc->fb;
 	ret = crtc->funcs->page_flip(crtc, fb, e);
 	if (ret) {
 		if (page_flip->flags & DRM_MODE_PAGE_FLIP_EVENT) {
@@ -3759,9 +3773,18 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 			spin_unlock_irqrestore(&dev->event_lock, flags);
 			kfree(e);
 		}
+		/* Keep the old fb, don't unref it. */
+		old_fb = NULL;
+	} else {
+		/* Unref only the old framebuffer. */
+		fb = NULL;
 	}
 
 out:
+	if (fb)
+		drm_framebuffer_unreference(fb);
+	if (old_fb)
+		drm_framebuffer_unreference(old_fb);
 	drm_modeset_unlock_all(dev);
 	return ret;
 }
-- 
1.7.10.4
