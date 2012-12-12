From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 21/37] drm: reference framebuffers which are on the idr
Date: Wed, 12 Dec 2012 14:07:01 +0100
Message-ID: <1355317637-16742-22-git-send-email-daniel.vetter@ffwll.ch>
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

Since otherwise looking and reference-counting around
drm_framebuffer_lookup will be an unmanageable mess. With this change,
an object can either be found in the idr and will stay around once we
incremented the reference counter. Or it will be gone for good and
can't be looked up using its id any more.

Atomicity is guaranteed by the dev->mode_config.fb_lock. The
newly-introduce fpriv->fbs_lock looks a bit redundant, but the next
patch will shuffle the locking order between these two locks and all
the modeset locks taken in modeset_lock_all, so we'll need it.

Also, since userspace could do really funky stuff and race e.g. a
getresources with an rmfb, we need to make sure that the kernel
doesn't fall over trying to look-up an inexistent fb, or causing
confusion by having two fbs around with the same id. Simply reset the
framebuffer id to 0, which marks it as reaped. Any lookups of that id
will fail, so the object is really gone for good from userspace's pov.

Note that we still need to protect the "remove framebuffer from all
use-cases" and the final unreference with the modeset-lock, since most
framebuffer use-sites don't implement proper reference counting yet.
We can only lift this once _all_ users are converted.

With this change, two references are held on alife, but unused
framebuffers:
- The reference for the idr lookup, created in this patch.
- For user-created framebuffers the fpriv->fbs reference, for
  driver-private fbs the driver is supposed to hold it's own last
  reference.

Note that the dev->mode_config.fb_list itself does _not_ hold a
reference onto the framebuffers (this list is essentially only used
for debugfs files). Hence if there's anything left there when the
driver has cleaned up all it's modeset resources, this is a ref-leak.
WARN about it.

Now we only need to fix up all other places to properly reference
count framebuffers.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |  118 ++++++++++++++++++++++++++++++--------------
 1 file changed, 80 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index e2d70f6..20ccdc4 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -356,6 +356,9 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	if (ret)
 		return ret;
 
+	/* Grab the idr reference. */
+	drm_framebuffer_reference(fb);
+
 	dev->mode_config.num_fb++;
 	list_add(&fb->head, &dev->mode_config.fb_list);
 	mutex_unlock(&dev->mode_config.fb_lock);
@@ -371,6 +374,23 @@ static void drm_framebuffer_free(struct kref *kref)
 	fb->funcs->destroy(fb);
 }
 
+static struct drm_framebuffer *__drm_framebuffer_lookup(struct drm_device *dev,
+							uint32_t id)
+{
+	struct drm_mode_object *obj = NULL;
+	struct drm_framebuffer *fb;
+
+	mutex_lock(&dev->mode_config.idr_mutex);
+	obj = idr_find(&dev->mode_config.crtc_idr, id);
+	if (!obj || (obj->type != DRM_MODE_OBJECT_FB) || (obj->id != id))
+		fb = NULL;
+	else
+		fb = obj_to_fb(obj);
+	mutex_unlock(&dev->mode_config.idr_mutex);
+
+	return fb;
+}
+
 /**
  * drm_framebuffer_lookup - look up a drm framebuffer and grab a reference
  * @dev: drm device
@@ -383,22 +403,12 @@ static void drm_framebuffer_free(struct kref *kref)
 struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
 					       uint32_t id)
 {
-	struct drm_mode_object *obj = NULL;
 	struct drm_framebuffer *fb;
 
 	mutex_lock(&dev->mode_config.fb_lock);
-
-	mutex_lock(&dev->mode_config.idr_mutex);
-	obj = idr_find(&dev->mode_config.crtc_idr, id);
-	if (!obj || (obj->type != DRM_MODE_OBJECT_FB) || (obj->id != id))
-		fb = NULL;
-	else
-		fb = obj_to_fb(obj);
-	mutex_unlock(&dev->mode_config.idr_mutex);
-
+	fb = __drm_framebuffer_lookup(dev, id);
 	if (fb)
 		kref_get(&fb->refcount);
-
 	mutex_unlock(&dev->mode_config.fb_lock);
 
 	return fb;
@@ -429,6 +439,24 @@ void drm_framebuffer_reference(struct drm_framebuffer *fb)
 }
 EXPORT_SYMBOL(drm_framebuffer_reference);
 
+static void drm_framebuffer_free_bug(struct kref *kref)
+{
+	BUG();
+}
+
+/* dev->mode_config.fb_lock must be held! */
+static void __drm_framebuffer_unregister(struct drm_device *dev,
+					 struct drm_framebuffer *fb)
+{
+	mutex_lock(&dev->mode_config.idr_mutex);
+	idr_remove(&dev->mode_config.crtc_idr, fb->base.id);
+	mutex_unlock(&dev->mode_config.idr_mutex);
+
+	fb->base.id = 0;
+
+	kref_put(&fb->refcount, drm_framebuffer_free_bug);
+}
+
 /**
  * drm_framebuffer_unregister_private - unregister a private fb from the lookup idr
  * @fb: fb to unregister
@@ -440,6 +468,12 @@ EXPORT_SYMBOL(drm_framebuffer_reference);
  */
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb)
 {
+	struct drm_device *dev = fb->dev;
+
+	mutex_lock(&dev->mode_config.fb_lock);
+	/* Mark fb as reaped and drop idr ref. */
+	__drm_framebuffer_unregister(dev, fb);
+	mutex_unlock(&dev->mode_config.fb_lock);
 }
 EXPORT_SYMBOL(drm_framebuffer_unregister_private);
 
@@ -463,14 +497,6 @@ void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
 
-	/*
-	 * This could be moved to drm_framebuffer_remove(), but for
-	 * debugging is nice to keep around the list of fb's that are
-	 * no longer associated w/ a drm_file but are not unreferenced
-	 * yet.  (i915 and omapdrm have debugfs files which will show
-	 * this.)
-	 */
-	drm_mode_object_put(dev, &fb->base);
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
 	dev->mode_config.num_fb--;
@@ -1180,9 +1206,15 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 		drm_property_destroy(dev, property);
 	}
 
-	/* Single-threaded teardown context, so it's not requied to grab the
+	/*
+	 * Single-threaded teardown context, so it's not requied to grab the
 	 * fb_lock to protect against concurrent fb_list access. Contrary, it
-	 * would actually deadlock with the drm_framebuffer_cleanup function. */
+	 * would actually deadlock with the drm_framebuffer_cleanup function.
+	 *
+	 * Also, if there are any framebuffers left, that's a driver leak now,
+	 * so politely WARN about this.
+	 */
+	WARN_ON(!list_empty(&dev->mode_config.fb_list));
 	list_for_each_entry_safe(fb, fbt, &dev->mode_config.fb_list, head) {
 		drm_framebuffer_remove(fb);
 	}
@@ -2448,39 +2480,41 @@ int drm_mode_rmfb(struct drm_device *dev,
 	struct drm_framebuffer *fb = NULL;
 	struct drm_framebuffer *fbl = NULL;
 	uint32_t *id = data;
-	int ret = 0;
 	int found = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
-	fb = drm_framebuffer_lookup(dev, *id);
-	if (!fb) {
-		ret = -EINVAL;
-		goto out;
-	}
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
-
 	mutex_lock(&file_priv->fbs_lock);
+	mutex_lock(&dev->mode_config.fb_lock);
+	fb = __drm_framebuffer_lookup(dev, *id);
+	if (!fb)
+		goto fail_lookup;
+
 	list_for_each_entry(fbl, &file_priv->fbs, filp_head)
 		if (fb == fbl)
 			found = 1;
-	if (!found) {
-		ret = -EINVAL;
-		mutex_unlock(&file_priv->fbs_lock);
-		goto out;
-	}
+	if (!found)
+		goto fail_lookup;
+
+	/* Mark fb as reaped, we still have a ref from fpriv->fbs. */
+	__drm_framebuffer_unregister(dev, fb);
 
 	list_del_init(&fb->filp_head);
+	mutex_unlock(&dev->mode_config.fb_lock);
 	mutex_unlock(&file_priv->fbs_lock);
 
+	drm_modeset_lock_all(dev);
 	drm_framebuffer_remove(fb);
-out:
 	drm_modeset_unlock_all(dev);
 
-	return ret;
+	return 0;
+
+fail_lookup:
+	mutex_unlock(&dev->mode_config.fb_lock);
+	mutex_unlock(&file_priv->fbs_lock);
+
+	return -EINVAL;
 }
 
 /**
@@ -2620,7 +2654,15 @@ void drm_fb_release(struct drm_file *priv)
 	drm_modeset_lock_all(dev);
 	mutex_lock(&priv->fbs_lock);
 	list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
+
+		mutex_lock(&dev->mode_config.fb_lock);
+		/* Mark fb as reaped, we still have a ref from fpriv->fbs. */
+		__drm_framebuffer_unregister(dev, fb);
+		mutex_unlock(&dev->mode_config.fb_lock);
+
 		list_del_init(&fb->filp_head);
+
+		/* This will also drop the fpriv->fbs reference. */
 		drm_framebuffer_remove(fb);
 	}
 	mutex_unlock(&priv->fbs_lock);
-- 
1.7.10.4
