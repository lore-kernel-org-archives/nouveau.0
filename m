From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 32/37] drm: optimize drm_framebuffer_remove
Date: Wed, 12 Dec 2012 14:07:12 +0100
Message-ID: <1355317637-16742-33-git-send-email-daniel.vetter@ffwll.ch>
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

Now that all framebuffer usage is properly refcounted, we are no
longer required to hold the modeset locks while dropping the last
reference. Hence implemented a fastpath which avoids the potential
stalls associated with grabbing mode_config.lock for the case where
there's no other reference around.

Explain in a big comment why it is safe. Also update kerneldocs with
the new locking rules around drm_framebuffer_remove.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |   72 +++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 6562eba..6dd441c 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -516,7 +516,11 @@ EXPORT_SYMBOL(drm_framebuffer_cleanup);
  *
  * Scans all the CRTCs and planes in @dev's mode_config.  If they're
  * using @fb, removes it, setting it to NULL. Then drops the reference to the
- * passed-in framebuffer.
+ * passed-in framebuffer. Might take the modeset locks.
+ *
+ * Note that this function optimizes the cleanup away if the caller holds the
+ * last reference to the framebuffer. It is also guaranteed to not take the
+ * modeset locks in this case.
  */
 void drm_framebuffer_remove(struct drm_framebuffer *fb)
 {
@@ -526,33 +530,51 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 	struct drm_mode_set set;
 	int ret;
 
-	WARN_ON(!drm_modeset_is_locked(dev));
 	WARN_ON(!list_empty(&fb->filp_head));
 
-	/* remove from any CRTC */
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		if (crtc->fb == fb) {
-			/* should turn off the crtc */
-			memset(&set, 0, sizeof(struct drm_mode_set));
-			set.crtc = crtc;
-			set.fb = NULL;
-			ret = drm_mode_set_config_internal(&set);
-			if (ret)
-				DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crtc);
+	/*
+	 * drm ABI mandates that we remove any deleted framebuffers from active
+	 * useage. But since most sane clients only remove framebuffers they no
+	 * longer need, try to optimize this away.
+	 *
+	 * Since we're holding a reference ourselves, observing a refcount of 1
+	 * means that we're the last holder and can skip it. Also, the refcount
+	 * can never increase from 1 again, so we don't need any barriers or
+	 * locks.
+	 *
+	 * Note that userspace could try to race with use and instate a new
+	 * usage _after_ we've cleared all current ones. End result will be an
+	 * in-use fb with fb-id == 0. Userspace is allowed to shoot its own foot
+	 * in this manner.
+	 */
+	if (atomic_read(&fb->refcount.refcount) > 1) {
+		drm_modeset_lock_all(dev);
+		/* remove from any CRTC */
+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+			if (crtc->fb == fb) {
+				/* should turn off the crtc */
+				memset(&set, 0, sizeof(struct drm_mode_set));
+				set.crtc = crtc;
+				set.fb = NULL;
+				ret = drm_mode_set_config_internal(&set);
+				if (ret)
+					DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crtc);
+			}
 		}
-	}
 
-	list_for_each_entry(plane, &dev->mode_config.plane_list, head) {
-		if (plane->fb == fb) {
-			/* should turn off the crtc */
-			ret = plane->funcs->disable_plane(plane);
-			if (ret)
-				DRM_ERROR("failed to disable plane with busy fb\n");
-			/* disconnect the plane from the fb and crtc: */
-			__drm_framebuffer_unreference(plane->fb);
-			plane->fb = NULL;
-			plane->crtc = NULL;
+		list_for_each_entry(plane, &dev->mode_config.plane_list, head) {
+			if (plane->fb == fb) {
+				/* should turn off the crtc */
+				ret = plane->funcs->disable_plane(plane);
+				if (ret)
+					DRM_ERROR("failed to disable plane with busy fb\n");
+				/* disconnect the plane from the fb and crtc: */
+				__drm_framebuffer_unreference(plane->fb);
+				plane->fb = NULL;
+				plane->crtc = NULL;
+			}
 		}
+		drm_modeset_unlock_all(dev);
 	}
 
 	drm_framebuffer_unreference(fb);
@@ -2537,9 +2559,7 @@ int drm_mode_rmfb(struct drm_device *dev,
 	mutex_unlock(&dev->mode_config.fb_lock);
 	mutex_unlock(&file_priv->fbs_lock);
 
-	drm_modeset_lock_all(dev);
 	drm_framebuffer_remove(fb);
-	drm_modeset_unlock_all(dev);
 
 	return 0;
 
@@ -2687,9 +2707,7 @@ void drm_fb_release(struct drm_file *priv)
 		list_del_init(&fb->filp_head);
 
 		/* This will also drop the fpriv->fbs reference. */
-		drm_modeset_lock_all(dev);
 		drm_framebuffer_remove(fb);
-		drm_modeset_unlock_all(dev);
 	}
 	mutex_unlock(&priv->fbs_lock);
 }
-- 
1.7.10.4
