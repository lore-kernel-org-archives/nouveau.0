From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 22/37] drm: nest modeset locks within fpriv->fbs_lock
Date: Wed, 12 Dec 2012 14:07:02 +0100
Message-ID: <1355317637-16742-23-git-send-email-daniel.vetter@ffwll.ch>
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

Atm we still need to unconditionally take the modeset locks in the
rmfb paths. But eventually we only want to take them if there are
other users around as a slow-path. This way sane userspace avoids
blocking on edid reads and other stuff in rmfb if it ensures that the
fb isn't used anywhere by a crtc/plane.

We can do a quick check for such other users once framebuffers are
properly refcounting by locking at the refcount - if it's more than 1,
there are other users left. Again, rmfb racing against other ioctls
isn't a real problem, userspace is allowed to shoot its foot.

This patch just prepares this by moving the modeset locks to nest
within fpriv->fbs_lock. Now the distinction between the fbs_lock and
the device-global fb_lock is clear, since we need to hold the fbs_lock
outside of any modeset_locks in fb_release.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 20ccdc4..33e95bb 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2266,13 +2266,13 @@ int drm_mode_addfb(struct drm_device *dev,
 		drm_modeset_unlock_all(dev);
 		return PTR_ERR(fb);
 	}
+	drm_modeset_unlock_all(dev);
 
 	mutex_lock(&file_priv->fbs_lock);
 	or->fb_id = fb->base.id;
 	list_add(&fb->filp_head, &file_priv->fbs);
 	DRM_DEBUG_KMS("[FB:%d]\n", fb->base.id);
 	mutex_unlock(&file_priv->fbs_lock);
-	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -2449,6 +2449,7 @@ int drm_mode_addfb2(struct drm_device *dev,
 		drm_modeset_unlock_all(dev);
 		return PTR_ERR(fb);
 	}
+	drm_modeset_unlock_all(dev);
 
 	mutex_lock(&file_priv->fbs_lock);
 	r->fb_id = fb->base.id;
@@ -2456,7 +2457,6 @@ int drm_mode_addfb2(struct drm_device *dev,
 	DRM_DEBUG_KMS("[FB:%d]\n", fb->base.id);
 	mutex_unlock(&file_priv->fbs_lock);
 
-	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -2651,7 +2651,6 @@ void drm_fb_release(struct drm_file *priv)
 	struct drm_device *dev = priv->minor->dev;
 	struct drm_framebuffer *fb, *tfb;
 
-	drm_modeset_lock_all(dev);
 	mutex_lock(&priv->fbs_lock);
 	list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
 
@@ -2663,10 +2662,11 @@ void drm_fb_release(struct drm_file *priv)
 		list_del_init(&fb->filp_head);
 
 		/* This will also drop the fpriv->fbs reference. */
+		drm_modeset_lock_all(dev);
 		drm_framebuffer_remove(fb);
+		drm_modeset_unlock_all(dev);
 	}
 	mutex_unlock(&priv->fbs_lock);
-	drm_modeset_unlock_all(dev);
 }
 
 /**
-- 
1.7.10.4
