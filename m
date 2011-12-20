From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] drm/nv50/display: expose color vibrance control
Date: Tue, 20 Dec 2011 15:01:19 +0100
Message-ID: <1324389679-24248-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nouveau_connector.c |   23 ++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_crtc.h      |    3 ++
 drivers/gpu/drm/nouveau/nouveau_display.c   |   12 +++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h       |    3 ++
 drivers/gpu/drm/nouveau/nv50_crtc.c         |   42 +++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nv50_evo.h          |    3 +-
 6 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index f3ce34b..80f2473 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -519,6 +519,19 @@ nouveau_connector_set_property(struct drm_connector *connector,
 		return nv_crtc->set_dither(nv_crtc, true);
 	}
 
+	if (nv_crtc && nv_crtc->set_color_vibrance) {
+		/* Hue */
+		if (property == disp->vibrant_hue_property) {
+			nv_crtc->vibrant_hue = value - 90;
+			return nv_crtc->set_color_vibrance(nv_crtc, true);
+		}
+		/* Saturation */
+		if (property == disp->color_vibrance_property) {
+			nv_crtc->color_vibrance = value - 100;
+			return nv_crtc->set_color_vibrance(nv_crtc, true);
+		}
+	}
+
 	if (nv_encoder && nv_encoder->dcb->type == OUTPUT_TV)
 		return get_slave_funcs(encoder)->set_property(
 			encoder, connector, property, value);
@@ -1014,6 +1027,16 @@ nouveau_connector_create(struct drm_device *dev, int index)
 					      0);
 	}
 
+	/* Add hue and saturation options */
+	if (dev_priv->card_type >= NV_50) {
+		drm_connector_attach_property(connector,
+					      disp->vibrant_hue_property,
+					      90);
+		drm_connector_attach_property(connector,
+					      disp->color_vibrance_property,
+					      150);
+	}
+
 	switch (nv_connector->type) {
 	case DCB_CONNECTOR_VGA:
 		if (dev_priv->card_type >= NV_50) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_crtc.h b/drivers/gpu/drm/nouveau/nouveau_crtc.h
index 686f6b4..e6d0d1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_crtc.h
+++ b/drivers/gpu/drm/nouveau/nouveau_crtc.h
@@ -35,6 +35,8 @@ struct nouveau_crtc {
 	uint32_t dpms_saved_fp_control;
 	uint32_t fp_users;
 	int saturation;
+	int color_vibrance;
+	int vibrant_hue;
 	int sharpness;
 	int last_dpms;
 
@@ -67,6 +69,7 @@ struct nouveau_crtc {
 
 	int (*set_dither)(struct nouveau_crtc *crtc, bool update);
 	int (*set_scale)(struct nouveau_crtc *crtc, bool update);
+	int (*set_color_vibrance)(struct nouveau_crtc *crtc, bool update);
 };
 
 static inline struct nouveau_crtc *nouveau_crtc(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 05f1692..3fe7101 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -282,6 +282,18 @@ nouveau_display_create(struct drm_device *dev)
 	disp->underscan_vborder_property->values[0] = 0;
 	disp->underscan_vborder_property->values[1] = 128;
 
+	disp->vibrant_hue_property =
+		drm_property_create(dev, DRM_MODE_PROP_RANGE,
+				    "vibrant hue", 2);
+	disp->vibrant_hue_property->values[0] = 0;
+	disp->vibrant_hue_property->values[1] = 180;
+
+	disp->color_vibrance_property =
+		drm_property_create(dev, DRM_MODE_PROP_RANGE,
+				    "color vibrance", 2);
+	disp->color_vibrance_property->values[0] = 0;
+	disp->color_vibrance_property->values[1] = 200;
+
 	dev->mode_config.funcs = (void *)&nouveau_mode_config_funcs;
 	dev->mode_config.fb_base = pci_resource_start(dev->pdev, 1);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2316ec9..8039445 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -405,6 +405,9 @@ struct nouveau_display_engine {
 	struct drm_property *underscan_property;
 	struct drm_property *underscan_hborder_property;
 	struct drm_property *underscan_vborder_property;
+	/* not really hue and saturation: */
+	struct drm_property *vibrant_hue_property;
+	struct drm_property *color_vibrance_property;
 };
 
 struct nouveau_gpio_engine {
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 8f6c2ac..701b927 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -170,6 +170,41 @@ nv50_crtc_set_dither(struct nouveau_crtc *nv_crtc, bool update)
 	return ret;
 }
 
+static int
+nv50_crtc_set_color_vibrance(struct nouveau_crtc *nv_crtc, bool update)
+{
+	struct drm_device *dev = nv_crtc->base.dev;
+	struct nouveau_channel *evo = nv50_display(dev)->master;
+	int ret;
+	int adj;
+	u32 hue, vib;
+
+	NV_DEBUG_KMS(dev, "vibrance = %i, hue = %i\n",
+		     nv_crtc->color_vibrance, nv_crtc->vibrant_hue);
+
+	ret = RING_SPACE(evo, 2 + (update ? 2 : 0));
+	if (ret) {
+		NV_ERROR(dev, "no space while setting color vibrance\n");
+		return ret;
+	}
+
+	adj = (nv_crtc->color_vibrance > 0) ? 50 : 0;
+	vib = ((nv_crtc->color_vibrance * 2047 + adj) / 100) & 0xfff;
+
+	hue = ((nv_crtc->vibrant_hue * 2047) / 100) & 0xfff;
+
+	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, COLOR_CTRL), 1);
+	OUT_RING  (evo, (hue << 20) | (vib << 8));
+
+	if (update) {
+		BEGIN_RING(evo, 0, NV50_EVO_UPDATE, 1);
+		OUT_RING  (evo, 0);
+		FIRE_RING (evo);
+	}
+
+	return 0;
+}
+
 struct nouveau_connector *
 nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 {
@@ -577,8 +612,6 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	OUT_RING  (evo, fb->base.depth == 8 ?
 		   NV50_EVO_CRTC_CLUT_MODE_OFF : NV50_EVO_CRTC_CLUT_MODE_ON);
 
-	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, COLOR_CTRL), 1);
-	OUT_RING  (evo, NV50_EVO_CRTC_COLOR_CTRL_COLOR);
 	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, FB_POS), 1);
 	OUT_RING  (evo, (y << 16) | x);
 
@@ -661,6 +694,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *umode,
 
 	nv_crtc->set_dither(nv_crtc, false);
 	nv_crtc->set_scale(nv_crtc, false);
+	nv_crtc->set_color_vibrance(nv_crtc, false);
 
 	return nv50_crtc_do_mode_set_base(crtc, old_fb, x, y, false);
 }
@@ -721,6 +755,9 @@ nv50_crtc_create(struct drm_device *dev, int index)
 	if (!nv_crtc)
 		return -ENOMEM;
 
+	nv_crtc->color_vibrance = 50;
+	nv_crtc->vibrant_hue = 0;
+
 	/* Default CLUT parameters, will be activated on the hw upon
 	 * first mode set.
 	 */
@@ -751,6 +788,7 @@ nv50_crtc_create(struct drm_device *dev, int index)
 	/* set function pointers */
 	nv_crtc->set_dither = nv50_crtc_set_dither;
 	nv_crtc->set_scale = nv50_crtc_set_scale;
+	nv_crtc->set_color_vibrance = nv50_crtc_set_color_vibrance;
 
 	drm_crtc_init(dev, &nv_crtc->base, &nv50_crtc_funcs);
 	drm_crtc_helper_add(&nv_crtc->base, &nv50_crtc_helper_funcs);
diff --git a/drivers/gpu/drm/nouveau/nv50_evo.h b/drivers/gpu/drm/nouveau/nv50_evo.h
index 3860ca6..771d879 100644
--- a/drivers/gpu/drm/nouveau/nv50_evo.h
+++ b/drivers/gpu/drm/nouveau/nv50_evo.h
@@ -104,7 +104,8 @@
 #define NV50_EVO_CRTC_SCALE_CTRL_INACTIVE                            0x00000000
 #define NV50_EVO_CRTC_SCALE_CTRL_ACTIVE                              0x00000009
 #define NV50_EVO_CRTC_COLOR_CTRL                                     0x000008a8
-#define NV50_EVO_CRTC_COLOR_CTRL_COLOR                               0x00040000
+#define NV50_EVO_CRTC_COLOR_CTRL_VIBRANCE                            0x000fff00
+#define NV50_EVO_CRTC_COLOR_CTRL_HUE                                 0xfff00000
 #define NV50_EVO_CRTC_FB_POS                                         0x000008c0
 #define NV50_EVO_CRTC_REAL_RES                                       0x000008c8
 #define NV50_EVO_CRTC_SCALE_CENTER_OFFSET                            0x000008d4
-- 
1.7.3.4
