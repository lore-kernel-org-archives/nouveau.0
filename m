From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Don't forget to label dp_aux devices
Date: Thu, 12 Jul 2018 13:13:52 -0400
Message-ID: <20180712171356.10227-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Archit Taneja <architt@codeaurora.org>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This makes debugging with DP tracing a lot harder to interpret, so name
each i2c based off the name of the encoder that it's for

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  3 ++-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 501d2d290e9c..45ff1872d894 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -64,7 +64,7 @@ nv04_display_create(struct drm_device *dev)
 	for (i = 0; i < dcb->entries; i++) {
 		struct dcb_output *dcbent = &dcb->entry[i];
 
-		connector = nouveau_connector_create(dev, dcbent->connector);
+		connector = nouveau_connector_create(dev, dcbent);
 		if (IS_ERR(connector))
 			continue;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9382e99a0bc7..4f8d51590bbb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2198,7 +2198,7 @@ nv50_display_create(struct drm_device *dev)
 
 	/* create encoder/connector objects based on VBIOS DCB table */
 	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
-		connector = nouveau_connector_create(dev, dcbe->connector);
+		connector = nouveau_connector_create(dev, dcbe);
 		if (IS_ERR(connector))
 			continue;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7b557c354307..0c5cc600c973 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -408,8 +408,10 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	kfree(nv_connector->edid);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
-	if (nv_connector->aux.transfer)
+	if (nv_connector->aux.transfer) {
 		drm_dp_aux_unregister(&nv_connector->aux);
+		kfree(nv_connector->aux.name);
+	}
 	kfree(connector);
 }
 
@@ -1201,13 +1203,16 @@ drm_conntype_from_dcb(enum dcb_connector_type dcb)
 }
 
 struct drm_connector *
-nouveau_connector_create(struct drm_device *dev, int index)
+nouveau_connector_create(struct drm_device *dev,
+			 const struct dcb_output *dcbe)
 {
 	const struct drm_connector_funcs *funcs = &nouveau_connector_funcs;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = NULL;
 	struct drm_connector *connector;
+	char aux_name[48] = {0};
+	int index = dcbe->connector;
 	int type, ret = 0;
 	bool dummy;
 
@@ -1306,6 +1311,9 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	case DRM_MODE_CONNECTOR_eDP:
 		nv_connector->aux.dev = dev->dev;
 		nv_connector->aux.transfer = nouveau_connector_aux_xfer;
+		snprintf(aux_name, sizeof(aux_name), "sor-%04x-%04x",
+			 dcbe->hasht, dcbe->hashm);
+		nv_connector->aux.name = kstrdup(aux_name, GFP_KERNEL);
 		ret = drm_dp_aux_register(&nv_connector->aux);
 		if (ret) {
 			NV_ERROR(drm, "failed to register aux channel\n");
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index a4d1a059bd3d..2c5cb51c7c33 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -35,6 +35,7 @@
 #include "nouveau_crtc.h"
 
 struct nvkm_i2c_port;
+struct dcb_output;
 
 struct nouveau_connector {
 	struct drm_connector base;
@@ -76,7 +77,7 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 }
 
 struct drm_connector *
-nouveau_connector_create(struct drm_device *, int index);
+nouveau_connector_create(struct drm_device *, const struct dcb_output *);
 
 extern int nouveau_tv_disable;
 extern int nouveau_ignorelid;
-- 
2.17.1
