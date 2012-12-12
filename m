From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 28/37] drm: encapsulate crtc->set_config calls
Date: Wed, 12 Dec 2012 14:07:08 +0100
Message-ID: <1355317637-16742-29-git-send-email-daniel.vetter@ffwll.ch>
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

With refcounting we need to adjust framebuffer refcounts at each
callsite - much easier to do if they all call the same little helper
function.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c             |   19 +++++++++++++++++--
 drivers/gpu/drm/drm_fb_helper.c        |    6 +++---
 drivers/gpu/drm/i2c/ch7006_drv.c       |    2 +-
 drivers/gpu/drm/nouveau/nv04_display.c |    2 +-
 drivers/gpu/drm/nouveau/nv17_tv.c      |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    |    2 +-
 include/drm/drm_crtc.h                 |    1 +
 7 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index ccf15ad..229853e 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -536,7 +536,7 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 			memset(&set, 0, sizeof(struct drm_mode_set));
 			set.crtc = crtc;
 			set.fb = NULL;
-			ret = crtc->funcs->set_config(&set);
+			ret = drm_mode_set_config_internal(&set);
 			if (ret)
 				DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crtc);
 		}
@@ -1974,6 +1974,21 @@ out:
 }
 
 /**
+ * drm_mode_set_config_internal - helper to call ->set_config
+ * @set: modeset config to set
+ *
+ * This is a little helper to wrap internal calls to the ->set_config driver
+ * interface. The only thing it adds is correct refcounting dance.
+ */
+int drm_mode_set_config_internal(struct drm_mode_set *set)
+{
+	struct drm_crtc *crtc = set->crtc;
+
+	return crtc->funcs->set_config(set);
+}
+EXPORT_SYMBOL(drm_mode_set_config_internal);
+
+/**
  * drm_mode_setcrtc - set CRTC configuration
  * @dev: drm device for the ioctl
  * @data: data pointer for the ioctl
@@ -2137,7 +2152,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	set.connectors = connector_set;
 	set.num_connectors = crtc_req->count_connectors;
 	set.fb = fb;
-	ret = crtc->funcs->set_config(&set);
+	ret = drm_mode_set_config_internal(&set);
 
 out:
 	kfree(connector_set);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d84ec67..403d53e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -245,7 +245,7 @@ bool drm_fb_helper_restore_fbdev_mode(struct drm_fb_helper *fb_helper)
 	int i, ret;
 	for (i = 0; i < fb_helper->crtc_count; i++) {
 		struct drm_mode_set *mode_set = &fb_helper->crtc_info[i].mode_set;
-		ret = mode_set->crtc->funcs->set_config(mode_set);
+		ret = drm_mode_set_config_internal(mode_set);
 		if (ret)
 			error = true;
 	}
@@ -675,7 +675,7 @@ int drm_fb_helper_set_par(struct fb_info *info)
 	drm_modeset_lock_all(dev);
 	for (i = 0; i < fb_helper->crtc_count; i++) {
 		crtc = fb_helper->crtc_info[i].mode_set.crtc;
-		ret = crtc->funcs->set_config(&fb_helper->crtc_info[i].mode_set);
+		ret = drm_mode_set_config_internal(&fb_helper->crtc_info[i].mode_set);
 		if (ret) {
 			drm_modeset_unlock_all(dev);
 			return ret;
@@ -711,7 +711,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 		modeset->y = var->yoffset;
 
 		if (modeset->num_connectors) {
-			ret = crtc->funcs->set_config(modeset);
+			ret = drm_mode_set_config_internal(modeset);
 			if (!ret) {
 				info->var.xoffset = var->xoffset;
 				info->var.yoffset = var->yoffset;
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 599099f..c5c947c 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -364,7 +364,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 				.crtc = crtc,
 			};
 
-			crtc->funcs->set_config(&modeset);
+			drm_mode_set_config_internal(&modeset);
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index 2cd6fb8..4c6e9f8 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -140,7 +140,7 @@ nv04_display_destroy(struct drm_device *dev)
 			.crtc = crtc,
 		};
 
-		crtc->funcs->set_config(&modeset);
+		drm_mode_set_config_internal(&modeset);
 	}
 
 	/* Restore state */
diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
index 897b636..bb3abfc 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -768,7 +768,7 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
 				.crtc = crtc,
 			};
 
-			crtc->funcs->set_config(&modeset);
+			drm_mode_set_config_internal(&modeset);
 		}
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 91581fd..5e598f4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -829,7 +829,7 @@ static void vmw_lastclose(struct drm_device *dev)
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		set.crtc = crtc;
-		ret = crtc->funcs->set_config(&set);
+		ret = drm_mode_set_config_internal(&set);
 		WARN_ON(ret != 0);
 	}
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index b24ad78..e3ff0a3 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1022,6 +1022,7 @@ extern int drm_mode_getcrtc(struct drm_device *dev,
 			    void *data, struct drm_file *file_priv);
 extern int drm_mode_getconnector(struct drm_device *dev,
 			      void *data, struct drm_file *file_priv);
+extern int drm_mode_set_config_internal(struct drm_mode_set *set);
 extern int drm_mode_setcrtc(struct drm_device *dev,
 			    void *data, struct drm_file *file_priv);
 extern int drm_mode_getplane(struct drm_device *dev,
-- 
1.7.10.4
