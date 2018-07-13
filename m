From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: Use drm_connector_list_iter_* for iterating connectors
Date: Fri, 13 Jul 2018 12:24:40 -0400
Message-ID: <20180713162442.22522-2-lyude@redhat.com>
References: <20180713162442.22522-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713162442.22522-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Every codepath in nouveau that loops through the connector list
currently does so using the old method, which is prone to race
conditions from MST connectors being created and destroyed. This has
been causing a multitude of problems, including memory corruption from
trying to access connectors that have already been freed!

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c |  6 ++++--
 drivers/gpu/drm/nouveau/nouveau_connector.c |  9 +++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h | 14 ++++++++++----
 drivers/gpu/drm/nouveau/nouveau_display.c   | 10 ++++++++--
 4 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index debbbf0fd4bd..408b955e5c39 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -267,6 +267,7 @@ nouveau_backlight_init(struct drm_device *dev)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_device *device = &drm->client.device;
 	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
 
 	INIT_LIST_HEAD(&drm->bl_connectors);
 
@@ -275,7 +276,8 @@ nouveau_backlight_init(struct drm_device *dev)
 		return 0;
 	}
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (connector->connector_type != DRM_MODE_CONNECTOR_LVDS &&
 		    connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
@@ -292,7 +294,7 @@ nouveau_backlight_init(struct drm_device *dev)
 			break;
 		}
 	}
-
+	drm_connector_list_iter_end(&conn_iter);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7b557c354307..7dc380449232 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1208,14 +1208,19 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = NULL;
 	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
 	int type, ret = 0;
 	bool dummy;
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		nv_connector = nouveau_connector(connector);
-		if (nv_connector->index == index)
+		if (nv_connector->index == index) {
+			drm_connector_list_iter_end(&conn_iter);
 			return connector;
+		}
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	nv_connector = kzalloc(sizeof(*nv_connector), GFP_KERNEL);
 	if (!nv_connector)
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index a4d1a059bd3d..a8cbb4b56fc7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -65,14 +65,20 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 {
 	struct drm_device *dev = nv_crtc->base.dev;
 	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct nouveau_connector *nv_connector = NULL;
 	struct drm_crtc *crtc = to_drm_crtc(nv_crtc);
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if (connector->encoder && connector->encoder->crtc == crtc)
-			return nouveau_connector(connector);
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->encoder && connector->encoder->crtc == crtc) {
+			nv_connector = nouveau_connector(connector);
+			break;
+		}
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
-	return NULL;
+	return nv_connector;
 }
 
 struct drm_connector *
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 774b429142bc..46b8430ef4aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -404,6 +404,7 @@ nouveau_display_init(struct drm_device *dev)
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
 	int ret;
 
 	ret = disp->init(dev);
@@ -411,10 +412,12 @@ nouveau_display_init(struct drm_device *dev)
 		return ret;
 
 	/* enable hotplug interrupts */
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct nouveau_connector *conn = nouveau_connector(connector);
 		nvif_notify_get(&conn->hpd);
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	/* enable flip completion events */
 	nvif_notify_get(&drm->flip);
@@ -427,6 +430,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend)
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
 
 	if (!suspend) {
 		if (drm_drv_uses_atomic_modeset(dev))
@@ -439,10 +443,12 @@ nouveau_display_fini(struct drm_device *dev, bool suspend)
 	nvif_notify_put(&drm->flip);
 
 	/* disable hotplug interrupts */
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct nouveau_connector *conn = nouveau_connector(connector);
 		nvif_notify_put(&conn->hpd);
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	drm_kms_helper_poll_disable(dev);
 	disp->fini(dev);
-- 
2.17.1
