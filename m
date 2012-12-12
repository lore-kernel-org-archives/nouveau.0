From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 05/37] drm/i915: use drm_modeset_lock_all
Date: Wed, 12 Dec 2012 14:06:45 +0100
Message-ID: <1355317637-16742-6-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

Two exceptions:
- debugfs files only read information which is not related to crtc, so
  can stay on the modeset_config lock.
- Same holds for the edp vdd work in intel_dp.c. Add a corresponding
  WARN_ON and a comment next to the intel_dp struct fields for
  documentation.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/intel_dp.c      |    2 ++
 drivers/gpu/drm/i915/intel_fb.c      |    4 ++--
 drivers/gpu/drm/i915/intel_lvds.c    |    4 ++--
 drivers/gpu/drm/i915/intel_overlay.c |   14 +++++++-------
 drivers/gpu/drm/i915/intel_sprite.c  |    8 ++++----
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index b51043e..66ec9ca 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -1052,6 +1052,8 @@ static void ironlake_panel_vdd_off_sync(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = dev->dev_private;
 	u32 pp;
 
+	WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
+
 	if (!intel_dp->want_panel_vdd && ironlake_edp_have_panel_vdd(intel_dp)) {
 		pp = ironlake_get_pp_control(dev_priv);
 		pp &= ~EDP_FORCE_VDD;
diff --git a/drivers/gpu/drm/i915/intel_fb.c b/drivers/gpu/drm/i915/intel_fb.c
index b7773e5..ed7bb33 100644
--- a/drivers/gpu/drm/i915/intel_fb.c
+++ b/drivers/gpu/drm/i915/intel_fb.c
@@ -282,7 +282,7 @@ void intel_fb_restore_mode(struct drm_device *dev)
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_plane *plane;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	ret = drm_fb_helper_restore_fbdev_mode(&dev_priv->fbdev->helper);
 	if (ret)
@@ -292,5 +292,5 @@ void intel_fb_restore_mode(struct drm_device *dev)
 	list_for_each_entry(plane, &config->plane_list, head)
 		plane->funcs->disable_plane(plane);
 
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 }
diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/intel_lvds.c
index 7781069..2719665 100644
--- a/drivers/gpu/drm/i915/intel_lvds.c
+++ b/drivers/gpu/drm/i915/intel_lvds.c
@@ -586,9 +586,9 @@ static int intel_lid_notify(struct notifier_block *nb, unsigned long val,
 
 	dev_priv->modeset_on_lid = 0;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	intel_modeset_setup_hw_state(dev, true);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return NOTIFY_OK;
 }
diff --git a/drivers/gpu/drm/i915/intel_overlay.c b/drivers/gpu/drm/i915/intel_overlay.c
index fabe0ac..1e901c3 100644
--- a/drivers/gpu/drm/i915/intel_overlay.c
+++ b/drivers/gpu/drm/i915/intel_overlay.c
@@ -1045,13 +1045,13 @@ int intel_overlay_put_image(struct drm_device *dev, void *data,
 	}
 
 	if (!(put_image_rec->flags & I915_OVERLAY_ENABLE)) {
-		mutex_lock(&dev->mode_config.mutex);
+		drm_modeset_lock_all(dev);
 		mutex_lock(&dev->struct_mutex);
 
 		ret = intel_overlay_switch_off(overlay);
 
 		mutex_unlock(&dev->struct_mutex);
-		mutex_unlock(&dev->mode_config.mutex);
+		drm_modeset_unlock_all(dev);
 
 		return ret;
 	}
@@ -1075,7 +1075,7 @@ int intel_overlay_put_image(struct drm_device *dev, void *data,
 		goto out_free;
 	}
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	mutex_lock(&dev->struct_mutex);
 
 	if (new_bo->tiling_mode) {
@@ -1157,7 +1157,7 @@ int intel_overlay_put_image(struct drm_device *dev, void *data,
 		goto out_unlock;
 
 	mutex_unlock(&dev->struct_mutex);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	kfree(params);
 
@@ -1165,7 +1165,7 @@ int intel_overlay_put_image(struct drm_device *dev, void *data,
 
 out_unlock:
 	mutex_unlock(&dev->struct_mutex);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	drm_gem_object_unreference_unlocked(&new_bo->base);
 out_free:
 	kfree(params);
@@ -1241,7 +1241,7 @@ int intel_overlay_attrs(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 	mutex_lock(&dev->struct_mutex);
 
 	ret = -EINVAL;
@@ -1307,7 +1307,7 @@ int intel_overlay_attrs(struct drm_device *dev, void *data,
 	ret = 0;
 out_unlock:
 	mutex_unlock(&dev->struct_mutex);
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/intel_sprite.c b/drivers/gpu/drm/i915/intel_sprite.c
index 827dcd4..d9f45d4c 100644
--- a/drivers/gpu/drm/i915/intel_sprite.c
+++ b/drivers/gpu/drm/i915/intel_sprite.c
@@ -595,7 +595,7 @@ int intel_sprite_set_colorkey(struct drm_device *dev, void *data,
 	if ((set->flags & (I915_SET_COLORKEY_DESTINATION | I915_SET_COLORKEY_SOURCE)) == (I915_SET_COLORKEY_DESTINATION | I915_SET_COLORKEY_SOURCE))
 		return -EINVAL;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, set->plane_id, DRM_MODE_OBJECT_PLANE);
 	if (!obj) {
@@ -608,7 +608,7 @@ int intel_sprite_set_colorkey(struct drm_device *dev, void *data,
 	ret = intel_plane->update_colorkey(plane, set);
 
 out_unlock:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
@@ -624,7 +624,7 @@ int intel_sprite_get_colorkey(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -ENODEV;
 
-	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, get->plane_id, DRM_MODE_OBJECT_PLANE);
 	if (!obj) {
@@ -637,7 +637,7 @@ int intel_sprite_get_colorkey(struct drm_device *dev, void *data,
 	intel_plane->get_colorkey(plane, get);
 
 out_unlock:
-	mutex_unlock(&dev->mode_config.mutex);
+	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
-- 
1.7.10.4
