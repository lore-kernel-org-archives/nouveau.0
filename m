From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 18/37] drm: create drm_framebuffer_lookup
Date: Wed, 12 Dec 2012 14:06:58 +0100
Message-ID: <1355317637-16742-19-git-send-email-daniel.vetter@ffwll.ch>
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

And replace all fb lookups with it. Also add a WARN to
drm_mode_object_find since that is now no longer the blessed interface
to look up an fb. And add kerneldoc to both functions.

This only updates all callsites, but immediately drops the acquired
refence again. Hence all callers still rely on the fact that a mode fb
can't disappear while they're holding the struct mutex. Subsequent
patches will instate proper use of refcounts, and then rework the rmfb
and unref code to no longer serialize fb destruction with the
mode_config lock. We don't want that since otherwise a compositor
might end up stalling for a few frames in rmfb.

v2: Don't use kreg_get_unless_zero - Greg KH doesn't like that kind of
interface.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c            |  109 ++++++++++++++++++++++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c |   24 ++++----
 include/drm/drm_crtc.h                |    2 +
 3 files changed, 86 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 5a46ea1..75ffc3b 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -294,11 +294,24 @@ static void drm_mode_object_put(struct drm_device *dev,
 	mutex_unlock(&dev->mode_config.idr_mutex);
 }
 
+/**
+ * drm_mode_object_find - look up a drm object with static lifetime
+ * @dev: drm device
+ * @id: id of the mode object
+ * @type: type of the mode object
+ *
+ * Note that framebuffers cannot be looked up with this functions - since those
+ * are reference counted, they need special treatment.
+ */
 struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 		uint32_t id, uint32_t type)
 {
 	struct drm_mode_object *obj = NULL;
 
+	/* Framebuffers are reference counted and need their own lookup
+	 * function.*/
+	WARN_ON(type == DRM_MODE_OBJECT_FB);
+
 	mutex_lock(&dev->mode_config.idr_mutex);
 	obj = idr_find(&dev->mode_config.crtc_idr, id);
 	if (!obj || (obj->type != type) || (obj->id != id))
@@ -358,6 +371,40 @@ static void drm_framebuffer_free(struct kref *kref)
 }
 
 /**
+ * drm_framebuffer_lookup - look up a drm framebuffer and grab a reference
+ * @dev: drm device
+ * @id: id of the fb object
+ *
+ * If successful, this grabs an additional reference to the framebuffer -
+ * callers need to make sure to eventually unreference the returned framebuffer
+ * again.
+ */
+struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
+					       uint32_t id)
+{
+	struct drm_mode_object *obj = NULL;
+	struct drm_framebuffer *fb;
+
+	mutex_lock(&dev->mode_config.fb_lock);
+
+	mutex_lock(&dev->mode_config.idr_mutex);
+	obj = idr_find(&dev->mode_config.crtc_idr, id);
+	if (!obj || (obj->type != DRM_MODE_OBJECT_FB) || (obj->id != id))
+		fb = NULL;
+	else
+		fb = obj_to_fb(obj);
+	mutex_unlock(&dev->mode_config.idr_mutex);
+
+	if (fb)
+		kref_get(&fb->refcount);
+
+	mutex_unlock(&dev->mode_config.fb_lock);
+
+	return fb;
+}
+EXPORT_SYMBOL(drm_framebuffer_lookup);
+
+/**
  * drm_framebuffer_unreference - unref a framebuffer
  * @fb: framebuffer to unref
  *
@@ -1789,17 +1836,15 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	}
 	crtc = obj_to_crtc(obj);
 
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, plane_req->fb_id,
-				   DRM_MODE_OBJECT_FB);
-	mutex_unlock(&dev->mode_config.fb_lock);
-	if (!obj) {
+	fb = drm_framebuffer_lookup(dev, plane_req->fb_id);
+	if (!fb) {
 		DRM_DEBUG_KMS("Unknown framebuffer ID %d\n",
 			      plane_req->fb_id);
 		ret = -ENOENT;
 		goto out;
 	}
-	fb = obj_to_fb(obj);
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
 
 	/* Check whether this plane supports the fb pixel format. */
 	for (i = 0; i < plane->format_count; i++)
@@ -1919,17 +1964,16 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 			}
 			fb = crtc->fb;
 		} else {
-			mutex_lock(&dev->mode_config.fb_lock);
-			obj = drm_mode_object_find(dev, crtc_req->fb_id,
-						   DRM_MODE_OBJECT_FB);
-			mutex_unlock(&dev->mode_config.fb_lock);
-			if (!obj) {
+			fb = drm_framebuffer_lookup(dev, crtc_req->fb_id);
+			if (!fb) {
 				DRM_DEBUG_KMS("Unknown FB ID%d\n",
 						crtc_req->fb_id);
 				ret = -EINVAL;
 				goto out;
 			}
-			fb = obj_to_fb(obj);
+			/* fb is protect by the mode_config lock, so drop the
+			 * ref immediately */
+			drm_framebuffer_unreference(fb);
 		}
 
 		mode = drm_mode_create(dev);
@@ -2378,7 +2422,6 @@ int drm_mode_addfb2(struct drm_device *dev,
 int drm_mode_rmfb(struct drm_device *dev,
 		   void *data, struct drm_file *file_priv)
 {
-	struct drm_mode_object *obj;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_framebuffer *fbl = NULL;
 	uint32_t *id = data;
@@ -2389,16 +2432,13 @@ int drm_mode_rmfb(struct drm_device *dev,
 		return -EINVAL;
 
 	drm_modeset_lock_all(dev);
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, *id, DRM_MODE_OBJECT_FB);
-	/* TODO check that we really get a framebuffer back. */
-	if (!obj) {
-		mutex_unlock(&dev->mode_config.fb_lock);
+	fb = drm_framebuffer_lookup(dev, *id);
+	if (!fb) {
 		ret = -EINVAL;
 		goto out;
 	}
-	fb = obj_to_fb(obj);
-	mutex_unlock(&dev->mode_config.fb_lock);
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
 
 	mutex_lock(&file_priv->fbs_lock);
 	list_for_each_entry(fbl, &file_priv->fbs, filp_head)
@@ -2437,7 +2477,6 @@ int drm_mode_getfb(struct drm_device *dev,
 		   void *data, struct drm_file *file_priv)
 {
 	struct drm_mode_fb_cmd *r = data;
-	struct drm_mode_object *obj;
 	struct drm_framebuffer *fb;
 	int ret = 0;
 
@@ -2445,14 +2484,13 @@ int drm_mode_getfb(struct drm_device *dev,
 		return -EINVAL;
 
 	drm_modeset_lock_all(dev);
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, r->fb_id, DRM_MODE_OBJECT_FB);
-	mutex_unlock(&dev->mode_config.fb_lock);
-	if (!obj) {
+	fb = drm_framebuffer_lookup(dev, r->fb_id);
+	if (!fb) {
 		ret = -EINVAL;
 		goto out;
 	}
-	fb = obj_to_fb(obj);
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
 
 	r->height = fb->height;
 	r->width = fb->width;
@@ -2472,7 +2510,6 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 	struct drm_clip_rect __user *clips_ptr;
 	struct drm_clip_rect *clips = NULL;
 	struct drm_mode_fb_dirty_cmd *r = data;
-	struct drm_mode_object *obj;
 	struct drm_framebuffer *fb;
 	unsigned flags;
 	int num_clips;
@@ -2482,14 +2519,13 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	drm_modeset_lock_all(dev);
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, r->fb_id, DRM_MODE_OBJECT_FB);
-	mutex_unlock(&dev->mode_config.fb_lock);
-	if (!obj) {
+	fb = drm_framebuffer_lookup(dev, r->fb_id);
+	if (!fb) {
 		ret = -EINVAL;
 		goto out_err1;
 	}
-	fb = obj_to_fb(obj);
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
 
 	num_clips = r->num_clips;
 	clips_ptr = (struct drm_clip_rect __user *)(unsigned long)r->clips_ptr;
@@ -3590,12 +3626,11 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	if (crtc->funcs->page_flip == NULL)
 		goto out;
 
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, page_flip->fb_id, DRM_MODE_OBJECT_FB);
-	mutex_unlock(&dev->mode_config.fb_lock);
-	if (!obj)
+	fb = drm_framebuffer_lookup(dev, page_flip->fb_id);
+	if (!fb)
 		goto out;
-	fb = obj_to_fb(obj);
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
 
 	hdisplay = crtc->mode.hdisplay;
 	vdisplay = crtc->mode.vdisplay;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 84c2c44..4a73e9e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -129,7 +129,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 	struct vmw_master *vmaster = vmw_master(file_priv->master);
 	struct drm_vmw_rect __user *clips_ptr;
 	struct drm_vmw_rect *clips = NULL;
-	struct drm_mode_object *obj;
+	struct drm_framebuffer *fb;
 	struct vmw_framebuffer *vfb;
 	struct vmw_resource *res;
 	uint32_t num_clips;
@@ -163,15 +163,15 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 
 	drm_modeset_lock_all(dev);
 
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, arg->fb_id, DRM_MODE_OBJECT_FB);
-	mutex_unlock(&dev->mode_config.fb_lock);
-	if (!obj) {
+	fb = drm_framebuffer_lookup(dev, arg->fb_id);
+	if (!fb) {
 		DRM_ERROR("Invalid framebuffer id.\n");
 		ret = -EINVAL;
 		goto out_no_fb;
 	}
-	vfb = vmw_framebuffer_to_vfb(obj_to_fb(obj));
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
+	vfb = vmw_framebuffer_to_vfb(fb);
 
 	ret = ttm_read_lock(&vmaster->lock, true);
 	if (unlikely(ret != 0))
@@ -215,7 +215,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 	struct vmw_master *vmaster = vmw_master(file_priv->master);
 	struct drm_vmw_rect __user *clips_ptr;
 	struct drm_vmw_rect *clips = NULL;
-	struct drm_mode_object *obj;
+	struct drm_framebuffer *fb;
 	struct vmw_framebuffer *vfb;
 	uint32_t num_clips;
 	int ret;
@@ -248,16 +248,16 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 
 	drm_modeset_lock_all(dev);
 
-	mutex_lock(&dev->mode_config.fb_lock);
-	obj = drm_mode_object_find(dev, arg->fb_id, DRM_MODE_OBJECT_FB);
-	mutex_unlock(&dev->mode_config.fb_lock);
-	if (!obj) {
+	fb = drm_framebuffer_lookup(dev, arg->fb_id);
+	if (!fb) {
 		DRM_ERROR("Invalid framebuffer id.\n");
 		ret = -EINVAL;
 		goto out_no_fb;
 	}
+	/* fb is protect by the mode_config lock, so drop the ref immediately */
+	drm_framebuffer_unreference(fb);
 
-	vfb = vmw_framebuffer_to_vfb(obj_to_fb(obj));
+	vfb = vmw_framebuffer_to_vfb(fb);
 	if (!vfb->dmabuf) {
 		DRM_ERROR("Framebuffer not dmabuf backed.\n");
 		ret = -EINVAL;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 334765a..77b6a2d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -964,6 +964,8 @@ extern void drm_framebuffer_set_object(struct drm_device *dev,
 extern int drm_framebuffer_init(struct drm_device *dev,
 				struct drm_framebuffer *fb,
 				const struct drm_framebuffer_funcs *funcs);
+extern struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
+						      uint32_t id);
 extern void drm_framebuffer_unreference(struct drm_framebuffer *fb);
 extern void drm_framebuffer_reference(struct drm_framebuffer *fb);
 extern void drm_framebuffer_remove(struct drm_framebuffer *fb);
-- 
1.7.10.4
