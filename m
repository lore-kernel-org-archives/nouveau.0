From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 03/37] drm: add drm_modeset_lock|unlock_all
Date: Wed, 12 Dec 2012 14:06:43 +0100
Message-ID: <1355317637-16742-4-git-send-email-daniel.vetter@ffwll.ch>
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

This is the first step towards introducing the new modeset locking
scheme. The plan is to put helper functions into place at all the
right places step-by-step, so that the final patch to switch on the
new locking scheme doesn't need to touch every single driver.

This helper here will serve as the shotgun solutions for all places
where a more fine-grained locking isn't (yet) implemented.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c        |  147 +++++++++++++++++++++----------------
 drivers/gpu/drm/drm_crtc_helper.c |    8 +-
 drivers/gpu/drm/drm_fb_helper.c   |   20 ++---
 include/drm/drm_crtc.h            |    3 +
 4 files changed, 102 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index f22d4a7..5d223af 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -37,6 +37,29 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 
+/**
+ * drm_modeset_lock_all - take all modeset locks
+ * @dev: drm device
+ *
+ * This function takes all modeset locks, suitable where a more fine-grained
+ * scheme isn't (yet) implemented.
+ */
+void drm_modeset_lock_all(struct drm_device *dev)
+{
+	mutex_lock(&dev->mode_config.mutex);
+}
+EXPORT_SYMBOL(drm_modeset_lock_all);
+
+/**
+ * drm_modeset_unlock_all - drop all modeset locks
+ * @drm: device
+ */
+void drm_modeset_unlock_all(struct drm_device *dev)
+{
+	mutex_unlock(&dev->mode_config.mutex);
+}
+EXPORT_SYMBOL(drm_modeset_unlock_all);
+
 /* Avoid boilerplate.  I'm tired of typing. */
 #define DRM_ENUM_NAME_FN(fnname, list)				\
 	char *fnname(int val)					\
@@ -427,7 +450,7 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	crtc->funcs = funcs;
 	crtc->invert_dimensions = false;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	ret = drm_mode_object_get(dev, &crtc->base, DRM_MODE_OBJECT_CRTC);
 	if (ret)
@@ -439,7 +462,7 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	dev->mode_config.num_crtc++;
 
  out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -514,7 +537,7 @@ int drm_connector_init(struct drm_device *dev,
 {
 	int ret;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	ret = drm_mode_object_get(dev, &connector->base, DRM_MODE_OBJECT_CONNECTOR);
 	if (ret)
@@ -544,7 +567,7 @@ int drm_connector_init(struct drm_device *dev,
 				      dev->mode_config.dpms_property, 0);
 
  out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -594,7 +617,7 @@ int drm_encoder_init(struct drm_device *dev,
 {
 	int ret;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	ret = drm_mode_object_get(dev, &encoder->base, DRM_MODE_OBJECT_ENCODER);
 	if (ret)
@@ -608,7 +631,7 @@ int drm_encoder_init(struct drm_device *dev,
 	dev->mode_config.num_encoder++;
 
  out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -617,11 +640,11 @@ EXPORT_SYMBOL(drm_encoder_init);
 void drm_encoder_cleanup(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	drm_mode_object_put(dev, &encoder->base);
 	list_del(&encoder->head);
 	dev->mode_config.num_encoder--;
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 }
 EXPORT_SYMBOL(drm_encoder_cleanup);
 
@@ -633,7 +656,7 @@ int drm_plane_init(struct drm_device *dev, struct drm_plane *plane,
 {
 	int ret;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	ret = drm_mode_object_get(dev, &plane->base, DRM_MODE_OBJECT_PLANE);
 	if (ret)
@@ -667,7 +690,7 @@ int drm_plane_init(struct drm_device *dev, struct drm_plane *plane,
 	}
 
  out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -677,7 +700,7 @@ void drm_plane_cleanup(struct drm_plane *plane)
 {
 	struct drm_device *dev = plane->dev;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	kfree(plane->format_types);
 	drm_mode_object_put(dev, &plane->base);
 	/* if not added to a list, it must be a private plane */
@@ -685,7 +708,7 @@ void drm_plane_cleanup(struct drm_plane *plane)
 		list_del(&plane->head);
 		dev->mode_config.num_plane--;
 	}
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 }
 EXPORT_SYMBOL(drm_plane_cleanup);
 
@@ -965,9 +988,9 @@ void drm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 	idr_init(&dev->mode_config.crtc_idr);
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	drm_mode_create_standard_connector_properties(dev);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	/* Just to be sure */
 	dev->mode_config.num_fb = 0;
@@ -1187,7 +1210,7 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	/*
 	 * For the non-control nodes we need to limit the list of resources
@@ -1329,7 +1352,7 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 		  card_res->count_connectors, card_res->count_encoders);
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1357,7 +1380,7 @@ int drm_mode_getcrtc(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, crtc_resp->crtc_id,
 				   DRM_MODE_OBJECT_CRTC);
@@ -1385,7 +1408,7 @@ int drm_mode_getcrtc(struct drm_device *dev,
 	}
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1428,7 +1451,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 
 	DRM_DEBUG_KMS("[CONNECTOR:%d:?]\n", out_resp->connector_id);
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, out_resp->connector_id,
 				   DRM_MODE_OBJECT_CONNECTOR);
@@ -1525,7 +1548,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	out_resp->count_encoders = encoders_count;
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1540,7 +1563,7 @@ int drm_mode_getencoder(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, enc_resp->encoder_id,
 				   DRM_MODE_OBJECT_ENCODER);
 	if (!obj) {
@@ -1559,7 +1582,7 @@ int drm_mode_getencoder(struct drm_device *dev, void *data,
 	enc_resp->possible_clones = encoder->possible_clones;
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1583,7 +1606,7 @@ int drm_mode_getplane_res(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	config = &dev->mode_config;
 
 	/*
@@ -1605,7 +1628,7 @@ int drm_mode_getplane_res(struct drm_device *dev, void *data,
 	plane_resp->count_planes = config->num_plane;
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1630,7 +1653,7 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, plane_resp->plane_id,
 				   DRM_MODE_OBJECT_PLANE);
 	if (!obj) {
@@ -1670,7 +1693,7 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	plane_resp->count_format_types = plane->format_count;
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1698,7 +1721,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	/*
 	 * First, find the plane, crtc, and fb objects.  If not available,
@@ -1797,7 +1820,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 	}
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
@@ -1837,7 +1860,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	if (crtc_req->x > INT_MAX || crtc_req->y > INT_MAX)
 		return -ERANGE;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, crtc_req->crtc_id,
 				   DRM_MODE_OBJECT_CRTC);
 	if (!obj) {
@@ -1970,7 +1993,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 out:
 	kfree(connector_set);
 	drm_mode_destroy(dev, mode);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -1988,7 +2011,7 @@ int drm_mode_cursor_ioctl(struct drm_device *dev,
 	if (!req->flags || (~DRM_MODE_CURSOR_FLAGS & req->flags))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, req->crtc_id, DRM_MODE_OBJECT_CRTC);
 	if (!obj) {
 		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
@@ -2016,7 +2039,7 @@ int drm_mode_cursor_ioctl(struct drm_device *dev,
 		}
 	}
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2095,7 +2118,7 @@ int drm_mode_addfb(struct drm_device *dev,
 	if ((config->min_height > r.height) || (r.height > config->max_height))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	/* TODO check buffer is sufficiently large */
 	/* TODO setup destructor callback */
@@ -2112,7 +2135,7 @@ int drm_mode_addfb(struct drm_device *dev,
 	DRM_DEBUG_KMS("[FB:%d]\n", fb->base.id);
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2280,7 +2303,7 @@ int drm_mode_addfb2(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	fb = dev->mode_config.funcs->fb_create(dev, file_priv, r);
 	if (IS_ERR(fb)) {
@@ -2294,7 +2317,7 @@ int drm_mode_addfb2(struct drm_device *dev,
 	DRM_DEBUG_KMS("[FB:%d]\n", fb->base.id);
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2324,7 +2347,7 @@ int drm_mode_rmfb(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, *id, DRM_MODE_OBJECT_FB);
 	/* TODO check that we really get a framebuffer back. */
 	if (!obj) {
@@ -2345,7 +2368,7 @@ int drm_mode_rmfb(struct drm_device *dev,
 	drm_framebuffer_remove(fb);
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2373,7 +2396,7 @@ int drm_mode_getfb(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, r->fb_id, DRM_MODE_OBJECT_FB);
 	if (!obj) {
 		ret = -EINVAL;
@@ -2389,7 +2412,7 @@ int drm_mode_getfb(struct drm_device *dev,
 	fb->funcs->create_handle(fb, file_priv, &r->handle);
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2408,7 +2431,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, r->fb_id, DRM_MODE_OBJECT_FB);
 	if (!obj) {
 		ret = -EINVAL;
@@ -2462,7 +2485,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 out_err2:
 	kfree(clips);
 out_err1:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2483,11 +2506,11 @@ void drm_fb_release(struct drm_file *priv)
 	struct drm_device *dev = priv->minor->dev;
 	struct drm_framebuffer *fb, *tfb;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
 		drm_framebuffer_remove(fb);
 	}
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 }
 
 /**
@@ -2602,7 +2625,7 @@ int drm_mode_attachmode_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, mode_cmd->connector_id, DRM_MODE_OBJECT_CONNECTOR);
 	if (!obj) {
@@ -2626,7 +2649,7 @@ int drm_mode_attachmode_ioctl(struct drm_device *dev,
 
 	drm_mode_attachmode(dev, connector, mode);
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2655,7 +2678,7 @@ int drm_mode_detachmode_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, mode_cmd->connector_id, DRM_MODE_OBJECT_CONNECTOR);
 	if (!obj) {
@@ -2672,7 +2695,7 @@ int drm_mode_detachmode_ioctl(struct drm_device *dev,
 
 	ret = drm_mode_detachmode(dev, connector, &mode);
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -2939,7 +2962,7 @@ int drm_mode_getproperty_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, out_resp->prop_id, DRM_MODE_OBJECT_PROPERTY);
 	if (!obj) {
 		ret = -EINVAL;
@@ -3017,7 +3040,7 @@ int drm_mode_getproperty_ioctl(struct drm_device *dev,
 		out_resp->count_enum_blobs = blob_count;
 	}
 done:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -3068,7 +3091,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, out_resp->blob_id, DRM_MODE_OBJECT_BLOB);
 	if (!obj) {
 		ret = -EINVAL;
@@ -3086,7 +3109,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
 	out_resp->length = blob->length;
 
 done:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -3228,7 +3251,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, arg->obj_id, arg->obj_type);
 	if (!obj) {
@@ -3265,7 +3288,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 	}
 	arg->count_props = props_count;
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -3282,7 +3305,7 @@ int drm_mode_obj_set_property_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	arg_obj = drm_mode_object_find(dev, arg->obj_id, arg->obj_type);
 	if (!arg_obj)
@@ -3320,7 +3343,7 @@ int drm_mode_obj_set_property_ioctl(struct drm_device *dev, void *data,
 	}
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -3382,7 +3405,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, crtc_lut->crtc_id, DRM_MODE_OBJECT_CRTC);
 	if (!obj) {
 		ret = -EINVAL;
@@ -3423,7 +3446,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
 	crtc->funcs->gamma_set(crtc, r_base, g_base, b_base, 0, crtc->gamma_size);
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 
 }
@@ -3441,7 +3464,7 @@ int drm_mode_gamma_get_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, crtc_lut->crtc_id, DRM_MODE_OBJECT_CRTC);
 	if (!obj) {
 		ret = -EINVAL;
@@ -3474,7 +3497,7 @@ int drm_mode_gamma_get_ioctl(struct drm_device *dev,
 		goto out;
 	}
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -3494,7 +3517,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	    page_flip->reserved != 0)
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, page_flip->crtc_id, DRM_MODE_OBJECT_CRTC);
 	if (!obj)
 		goto out;
@@ -3572,7 +3595,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	}
 
 out:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 7b2d378..400ef86 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -980,7 +980,7 @@ static void output_poll_execute(struct work_struct *work)
 	if (!drm_kms_helper_poll)
 		return;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 
 		/* Ignore forced connectors. */
@@ -1010,7 +1010,7 @@ static void output_poll_execute(struct work_struct *work)
 			changed = true;
 	}
 
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	if (changed)
 		drm_kms_helper_hotplug_event(dev);
@@ -1070,7 +1070,7 @@ void drm_helper_hpd_irq_event(struct drm_device *dev)
 	if (!dev->mode_config.poll_enabled)
 		return;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 
 		/* Only handle HPD capable connectors. */
@@ -1088,7 +1088,7 @@ void drm_helper_hpd_irq_event(struct drm_device *dev)
 			changed = true;
 	}
 
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	if (changed)
 		drm_kms_helper_hotplug_event(dev);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 05e623a..d84ec67 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -337,7 +337,7 @@ static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
 	/*
 	 * For each CRTC in this fb, turn the connectors on/off.
 	 */
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	for (i = 0; i < fb_helper->crtc_count; i++) {
 		crtc = fb_helper->crtc_info[i].mode_set.crtc;
 
@@ -352,7 +352,7 @@ static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
 				dev->mode_config.dpms_property, dpms_mode);
 		}
 	}
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 }
 
 int drm_fb_helper_blank(int blank, struct fb_info *info)
@@ -672,16 +672,16 @@ int drm_fb_helper_set_par(struct fb_info *info)
 		return -EINVAL;
 	}
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	for (i = 0; i < fb_helper->crtc_count; i++) {
 		crtc = fb_helper->crtc_info[i].mode_set.crtc;
 		ret = crtc->funcs->set_config(&fb_helper->crtc_info[i].mode_set);
 		if (ret) {
-			mutex_unlock(&dev->mode_config.mutex);
+			drm_modeset_unlock_all(dev);
 			return ret;
 		}
 	}
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	if (fb_helper->delayed_hotplug) {
 		fb_helper->delayed_hotplug = false;
@@ -701,7 +701,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 	int ret = 0;
 	int i;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	for (i = 0; i < fb_helper->crtc_count; i++) {
 		crtc = fb_helper->crtc_info[i].mode_set.crtc;
 
@@ -718,7 +718,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 			}
 		}
 	}
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fb_helper_pan_display);
@@ -1375,7 +1375,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	if (!fb_helper->fb)
 		return 0;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (crtc->fb)
 			crtcs_bound++;
@@ -1385,7 +1385,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 
 	if (bound < crtcs_bound) {
 		fb_helper->delayed_hotplug = true;
-		mutex_unlock(&dev->mode_config.mutex);
+		drm_modeset_unlock_all(dev);
 		return 0;
 	}
 	DRM_DEBUG_KMS("\n");
@@ -1397,7 +1397,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	count = drm_fb_helper_probe_connector_modes(fb_helper, max_width,
 						    max_height);
 	drm_setup_crtcs(fb_helper);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return drm_fb_helper_single_fb_probe(fb_helper, bpp_sel);
 }
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 3538eda..b487922 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -842,6 +842,9 @@ struct drm_prop_enum_list {
 	char *name;
 };
 
+extern void drm_modeset_lock_all(struct drm_device *dev);
+extern void drm_modeset_unlock_all(struct drm_device *dev);
+
 extern int drm_crtc_init(struct drm_device *dev,
 			 struct drm_crtc *crtc,
 			 const struct drm_crtc_funcs *funcs);
-- 
1.7.10.4
