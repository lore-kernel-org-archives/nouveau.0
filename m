From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 24/37] drm: push modeset_lock_all into ->fb_create
	driver callbacks
Date: Wed, 12 Dec 2012 14:07:04 +0100
Message-ID: <1355317637-16742-25-git-send-email-daniel.vetter@ffwll.ch>
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

And drop it where it's not needed. Most driver just lookup the gem
object, allocate an fb struct, fill in all the useful fields and then
register it with drm_framebuffer_init.

All of these operations are already separately locked, and since we
only put the fb into the fpriv->fbs list _after_ having called
->fb_create, we can't also race with rmfb. We can otoh race with other
ioctls that put the framebuffer to use, but all drivers have been
reorganized already to call drm_framebuffer_init last in the fb
creation sequence.

So essentially, we can completely remove any modeset locks from the
addfb ioctl paths. Yeah!

Also, reference-counting is solid - we get a reference from fb_create
which we transfer to the fpriv->fbs list. And after unlocking the
fpriv->fbs_lock we don't touch the framebuffer any longer. Furthermore
drm_framebuffer_init has added a 2nd reference for the idr lookup, and
any access through that table will do it's own refcounting.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 33e95bb..9ad807d 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2255,18 +2255,12 @@ int drm_mode_addfb(struct drm_device *dev,
 	if ((config->min_height > r.height) || (r.height > config->max_height))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
-
-	/* TODO check buffer is sufficiently large */
-	/* TODO setup destructor callback */
-
 	fb = dev->mode_config.funcs->fb_create(dev, file_priv, &r);
 	if (IS_ERR(fb)) {
 		DRM_DEBUG_KMS("could not create framebuffer\n");
 		drm_modeset_unlock_all(dev);
 		return PTR_ERR(fb);
 	}
-	drm_modeset_unlock_all(dev);
 
 	mutex_lock(&file_priv->fbs_lock);
 	or->fb_id = fb->base.id;
@@ -2441,15 +2435,12 @@ int drm_mode_addfb2(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	drm_modeset_lock_all(dev);
-
 	fb = dev->mode_config.funcs->fb_create(dev, file_priv, r);
 	if (IS_ERR(fb)) {
 		DRM_DEBUG_KMS("could not create framebuffer\n");
 		drm_modeset_unlock_all(dev);
 		return PTR_ERR(fb);
 	}
-	drm_modeset_unlock_all(dev);
 
 	mutex_lock(&file_priv->fbs_lock);
 	r->fb_id = fb->base.id;
-- 
1.7.10.4
