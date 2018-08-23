From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 5/5] drm/nouveau: Refactor nvXX_backlight_init()
Date: Wed, 22 Aug 2018 21:21:50 -0400
Message-ID: <20180823012151.20099-6-lyude@redhat.com>
References: <20180823012151.20099-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823012151.20099-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Jeffery Miller <jmiller@neverware.com>, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

There's literally no difference between any of the backlight init
functions besides the backlight properties they set and the backlight
callbacks that they set, so move all of the duplicated backlight init
code out of there and into nouveau_backlight_init().

This gets rid of a lot of copy pasta!

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Jeffery Miller <jmiller@neverware.com>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 131 +++++++++-----------
 1 file changed, 57 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 7ad90e7610a1..0712b2688e18 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -94,48 +94,20 @@ static const struct backlight_ops nv40_bl_ops = {
 };
 
 static int
-nv40_backlight_init(struct drm_connector *connector)
+nv40_backlight_init(struct drm_connector *connector,
+		    struct backlight_properties *props,
+		    const struct backlight_ops **ops)
 {
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nouveau_backlight *bl;
 	struct nvif_object *device = &drm->client.device.object;
-	struct backlight_properties props;
-	char backlight_name[BL_NAME_SIZE];
-	int ret = 0;
 
 	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
-		return 0;
-
-	bl = kzalloc(sizeof(*bl), GFP_KERNEL);
-	if (!bl)
-		return -ENOMEM;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.type = BACKLIGHT_RAW;
-	props.max_brightness = 31;
-	if (!nouveau_get_backlight_name(backlight_name, bl)) {
-		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
-		goto fail_alloc;
-	}
-
-	bl->dev = backlight_device_register(backlight_name, connector->kdev,
-					    drm, &nv40_bl_ops, &props);
-	if (IS_ERR(bl->dev)) {
-		if (bl->id >= 0)
-			ida_simple_remove(&bl_ida, bl->id);
-
-		ret = PTR_ERR(bl->dev);
-		goto fail_alloc;
-	}
-
-	nouveau_connector(connector)->backlight = bl;
-	bl->dev->props.brightness = nv40_get_intensity(bl->dev);
-	backlight_update_status(bl->dev);
+		return -ENODEV;
 
+	props->type = BACKLIGHT_RAW;
+	props->max_brightness = 31;
+	*ops = &nv40_bl_ops;
 	return 0;
-fail_alloc:
-	kfree(bl);
-	return ret;
 }
 
 static int
@@ -221,16 +193,13 @@ static const struct backlight_ops nva3_bl_ops = {
 };
 
 static int
-nv50_backlight_init(struct drm_connector *connector)
+nv50_backlight_init(struct drm_connector *connector,
+		    struct backlight_properties *props,
+		    const struct backlight_ops **ops)
 {
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
 	struct nvif_object *device = &drm->client.device.object;
 	struct nouveau_encoder *nv_encoder;
-	struct nouveau_backlight *bl;
-	struct backlight_properties props;
-	const struct backlight_ops *ops;
-	char backlight_name[BL_NAME_SIZE];
-	int ret = 0;
 
 	nv_encoder = find_encoder(connector, DCB_OUTPUT_LVDS);
 	if (!nv_encoder) {
@@ -240,52 +209,31 @@ nv50_backlight_init(struct drm_connector *connector)
 	}
 
 	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)))
-		return 0;
-
-	bl = kzalloc(sizeof(*bl), GFP_KERNEL);
-	if (!bl)
-		return -ENOMEM;
+		return -ENODEV;
 
 	if (drm->client.device.info.chipset <= 0xa0 ||
 	    drm->client.device.info.chipset == 0xaa ||
 	    drm->client.device.info.chipset == 0xac)
-		ops = &nv50_bl_ops;
+		*ops = &nv50_bl_ops;
 	else
-		ops = &nva3_bl_ops;
+		*ops = &nva3_bl_ops;
 
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.type = BACKLIGHT_RAW;
-	props.max_brightness = 100;
-	if (!nouveau_get_backlight_name(backlight_name, bl)) {
-		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
-		goto fail_alloc;
-	}
-
-	bl->dev = backlight_device_register(backlight_name, connector->kdev,
-					    nv_encoder, ops, &props);
-	if (IS_ERR(bl->dev)) {
-		if (bl->id >= 0)
-			ida_simple_remove(&bl_ida, bl->id);
+	props->type = BACKLIGHT_RAW;
+	props->max_brightness = 100;
 
-		ret = PTR_ERR(bl->dev);
-		goto fail_alloc;
-	}
-
-	nouveau_connector(connector)->backlight = bl;
-	bl->dev->props.brightness = bl->dev->ops->get_brightness(bl->dev);
-	backlight_update_status(bl->dev);
 	return 0;
-
-fail_alloc:
-	kfree(bl);
-	return ret;
 }
 
 int
 nouveau_backlight_init(struct drm_connector *connector)
 {
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_backlight *bl;
 	struct nvif_device *device = &drm->client.device;
+	char backlight_name[BL_NAME_SIZE];
+	struct backlight_properties props = {0};
+	const struct backlight_ops *ops;
+	int ret;
 
 	if (apple_gmux_present()) {
 		NV_INFO(drm, "Apple GMUX detected: not registering Nouveau backlight interface\n");
@@ -298,15 +246,50 @@ nouveau_backlight_init(struct drm_connector *connector)
 
 	switch (device->info.family) {
 	case NV_DEVICE_INFO_V0_CURIE:
-		return nv40_backlight_init(connector);
+		ret = nv40_backlight_init(connector, &props, &ops);
+		break;
 	case NV_DEVICE_INFO_V0_TESLA:
 	case NV_DEVICE_INFO_V0_FERMI:
 	case NV_DEVICE_INFO_V0_KEPLER:
 	case NV_DEVICE_INFO_V0_MAXWELL:
-		return nv50_backlight_init(connector);
+		ret = nv50_backlight_init(connector, &props, &ops);
+		break;
 	default:
 		return 0;
 	}
+
+	if (ret == -ENODEV)
+		return 0;
+	else if (ret)
+		return ret;
+
+	bl = kzalloc(sizeof(*bl), GFP_KERNEL);
+	if (!bl)
+		return -ENOMEM;
+
+	if (!nouveau_get_backlight_name(backlight_name, bl)) {
+		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
+		goto fail_alloc;
+	}
+
+	bl->dev = backlight_device_register(backlight_name, connector->kdev,
+					    drm, ops, &props);
+	if (IS_ERR(bl->dev)) {
+		if (bl->id >= 0)
+			ida_simple_remove(&bl_ida, bl->id);
+		ret = PTR_ERR(bl->dev);
+		goto fail_alloc;
+	}
+
+	nouveau_connector(connector)->backlight = bl;
+	bl->dev->props.brightness = bl->dev->ops->get_brightness(bl->dev);
+	backlight_update_status(bl->dev);
+
+	return 0;
+
+fail_alloc:
+	kfree(bl);
+	return ret;
 }
 
 void
-- 
2.17.1
