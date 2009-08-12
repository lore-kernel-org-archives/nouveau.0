From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 06/12] drm/nouveau: Prepare the connector code for
	TV-out.
Date: Wed, 12 Aug 2009 02:15:02 +0200
Message-ID: <1250036108-28655-7-git-send-email-currojerez@riseup.net>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036108-28655-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |  198 +++++++++++++--------------
 drivers/gpu/drm/nouveau/nv50_sor.c          |   14 --
 2 files changed, 97 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 54d5e58..d49282e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -34,8 +34,10 @@
 #include "nouveau_connector.h"
 #include "nouveau_hw.h"
 
+#define get_slave_funcs(nv_encoder) (to_encoder_slave(to_drm_encoder(nv_encoder))->slave_funcs)
+
 static struct nouveau_encoder *
-nouveau_connector_encoder_get(struct drm_connector *connector, int type)
+find_encoder_by_type(struct drm_connector *connector, int type)
 {
 	struct drm_device *dev = connector->dev;
 	struct nouveau_encoder *nv_encoder;
@@ -59,6 +61,21 @@ nouveau_connector_encoder_get(struct drm_connector *connector, int type)
 	return NULL;
 }
 
+struct nouveau_connector *
+nouveau_encoder_connector_get(struct nouveau_encoder *encoder)
+{
+	struct drm_device *dev = to_drm_encoder(encoder)->dev;
+	struct drm_connector *drm_connector;
+
+	list_for_each_entry(drm_connector, &dev->mode_config.connector_list, head) {
+		if (drm_connector->encoder == to_drm_encoder(encoder))
+			return nouveau_connector(drm_connector);
+	}
+
+	return NULL;
+}
+
+
 static void
 nouveau_connector_destroy(struct drm_connector *drm_connector)
 {
@@ -173,95 +190,63 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 }
 
 static enum drm_connector_status
-nouveau_connector_lvds_detect(struct drm_connector *connector)
-{
-	struct nouveau_connector *nv_connector = nouveau_connector(connector);
-	struct nouveau_encoder *nv_encoder;
-	struct drm_device *dev = connector->dev;
-	int flags;
-
-	nv_encoder = nouveau_connector_encoder_get(connector, OUTPUT_LVDS);
-	if (!nv_encoder) {
-		NV_ERROR(dev, "LVDS but no encoder!\n");
-		return connector_status_disconnected;
-	}
-
-	if (nv_connector->native_mode) {
-		nouveau_connector_set_encoder(connector, nv_encoder);
-		return connector_status_connected;
-	}
-
-	nouveau_connector_ddc_prepare(connector, &flags);
-	nv_connector->edid =
-		drm_get_edid(connector, &nv_connector->i2c_chan->adapter);
-	nouveau_connector_ddc_finish(connector, flags);
-	drm_mode_connector_update_edid_property(connector, nv_connector->edid);
-	if (!nv_connector->edid) {
-		NV_ERROR(dev, "LVDS but no modes!\n");
-		return connector_status_disconnected;
-	}
-
-	nouveau_connector_set_encoder(connector, nv_encoder);
-	return connector_status_connected;
-}
-
-static enum drm_connector_status
 nouveau_connector_detect(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
-	struct drm_encoder_helper_funcs *helper = NULL;
 	struct nouveau_encoder *nv_encoder = NULL;
 	int type, flags;
 
-	nv_connector->detected_encoder = NULL;
+	if ((nv_encoder = find_encoder_by_type(connector, OUTPUT_LVDS))
+	    && nv_connector->native_mode) {
 
-	if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
-		return nouveau_connector_lvds_detect(connector);
+		nouveau_connector_set_encoder(connector, nv_encoder);
+		return connector_status_connected;
+	}
 
-	nv_encoder = nouveau_connector_encoder_get(connector, OUTPUT_ANALOG);
-	if (!nouveau_connector_ddc_detect(connector)) {
-		if (!nv_encoder || !to_drm_encoder(nv_encoder)->helper_private)
+	if (nouveau_connector_ddc_detect(connector)) {
+		nouveau_connector_ddc_prepare(connector, &flags);
+		nv_connector->edid =
+			drm_get_edid(connector, &nv_connector->i2c_chan->adapter);
+		nouveau_connector_ddc_finish(connector, flags);
+		drm_mode_connector_update_edid_property(connector, nv_connector->edid);
+		if (!nv_connector->edid) {
+			NV_ERROR(dev, "DDC responded, but no EDID for %s\n",
+				 drm_get_connector_name(connector));
 			return connector_status_disconnected;
+		}
 
-		helper = to_drm_encoder(nv_encoder)->helper_private;
-		if (!helper || !helper->detect)
-			return connector_status_disconnected;
+		if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
+			type = OUTPUT_LVDS;
+		else if (nv_connector->edid->input & DRM_EDID_INPUT_DIGITAL)
+			type = OUTPUT_TMDS;
+		else
+			type = OUTPUT_ANALOG;
 
-		if (helper->detect(to_drm_encoder(nv_encoder), connector) ==
-				connector_status_connected) {
-			nouveau_connector_set_encoder(connector, nv_encoder);
-			return connector_status_connected;
+		nv_encoder = find_encoder_by_type(connector, type);
+		if (!nv_encoder) {
+			NV_ERROR(dev, "Detected %d encoder on %s, but no object!\n",
+				 type, drm_get_connector_name(connector));
+			return connector_status_disconnected;
 		}
 
-		return connector_status_disconnected;
+		nouveau_connector_set_encoder(connector, nv_encoder);
+		return connector_status_connected;
 	}
 
-	nouveau_connector_ddc_prepare(connector, &flags);
-	nv_connector->edid =
-		drm_get_edid(connector, &nv_connector->i2c_chan->adapter);
-	nouveau_connector_ddc_finish(connector, flags);
-	drm_mode_connector_update_edid_property(connector, nv_connector->edid);
-	if (!nv_connector->edid) {
-		NV_ERROR(dev, "DDC responded, but no EDID for %s\n",
-			      drm_get_connector_name(connector));
-		return connector_status_disconnected;
-	}
+	if ((nv_encoder = find_encoder_by_type(connector, OUTPUT_ANALOG)) ||
+	    (nv_encoder = find_encoder_by_type(connector, OUTPUT_TV))) {
+		struct drm_encoder *encoder = to_drm_encoder(nv_encoder);
+		struct drm_encoder_helper_funcs *helper = encoder->helper_private;
 
-	if (nv_connector->edid->input & DRM_EDID_INPUT_DIGITAL)
-		type = OUTPUT_TMDS;
-	else
-		type = OUTPUT_ANALOG;
+		if (helper->detect(encoder, connector) == connector_status_connected) {
+			nouveau_connector_set_encoder(connector, nv_encoder);
+			return connector_status_connected;
+		}
 
-	nv_encoder = nouveau_connector_encoder_get(connector, type);
-	if (!nv_encoder) {
-		NV_ERROR(dev, "Detected %d encoder on %s, but no object!\n",
-			      type, drm_get_connector_name(connector));
-		return connector_status_disconnected;
 	}
 
-	nouveau_connector_set_encoder(connector, nv_encoder);
-	return connector_status_connected;
+	return connector_status_disconnected;
 }
 
 static int
@@ -269,6 +254,7 @@ nouveau_connector_set_property(struct drm_connector *connector,
 			       struct drm_property *property, uint64_t value)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
+	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
 	struct drm_device *dev = connector->dev;
 	int ret;
 
@@ -310,8 +296,8 @@ nouveau_connector_set_property(struct drm_connector *connector,
 							&nv_crtc->base.mode,
 							nv_crtc->base.x,
 							nv_crtc->base.y, NULL);
-			if (ret)
-				return ret;
+			if (!ret)
+				return -EINVAL;
 		} else {
 			ret = nv_crtc->set_scale(nv_crtc, value, true);
 			if (ret)
@@ -340,6 +326,11 @@ nouveau_connector_set_property(struct drm_connector *connector,
 					   true);
 	}
 
+
+	if (nv_encoder && nv_encoder->dcb->type == OUTPUT_TV)
+		return get_slave_funcs(nv_encoder)->
+			set_property(to_drm_encoder(nv_encoder), connector, property, value);
+
 	return -EINVAL;
 }
 
@@ -348,8 +339,9 @@ nouveau_connector_native_mode(struct nouveau_connector *connector)
 {
 	struct drm_device *dev = connector->base.dev;
 	struct drm_display_mode *mode;
+	uint8_t type = connector->detected_encoder->dcb->type;
 
-	if (connector->detected_encoder->dcb->type == OUTPUT_ANALOG)
+	if (type != OUTPUT_LVDS && type != OUTPUT_TMDS)
 		return NULL;
 
 	list_for_each_entry(mode, &connector->base.probed_modes, head) {
@@ -363,8 +355,9 @@ nouveau_connector_native_mode(struct nouveau_connector *connector)
 static int
 nouveau_connector_get_modes(struct drm_connector *connector)
 {
-	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct drm_device *dev = connector->dev;
+	struct nouveau_connector *nv_connector = nouveau_connector(connector);
+	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
 	int ret = 0;
 
 	/* If we're not LVDS, destroy the previous native mode, the attached
@@ -394,6 +387,10 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 		ret = 1;
 	}
 
+	if (nv_encoder->dcb->type == OUTPUT_TV)
+		ret = get_slave_funcs(nv_encoder)->
+			get_modes(to_drm_encoder(nv_encoder),connector);
+
 	return ret;
 }
 
@@ -404,9 +401,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	struct drm_nouveau_private *dev_priv = connector->dev->dev_private;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
-	unsigned min_clock, max_clock;
-
-	min_clock = 25000;
+	unsigned min_clock = 25000, max_clock = min_clock;
 
 	switch (nv_encoder->dcb->type) {
 	case OUTPUT_LVDS:
@@ -425,11 +420,15 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 		else
 			max_clock = 330000;
 		break;
-	default:
+	case OUTPUT_ANALOG:
 		max_clock = nv_encoder->dcb->crtconf.maxfreq;
 		if (!max_clock)
 			max_clock = 350000;
 		break;
+	case OUTPUT_TV:
+		return get_slave_funcs(nv_encoder)->
+			mode_valid(to_drm_encoder(nv_encoder), mode);
+
 	}
 
 	if (mode->clock < min_clock)
@@ -523,7 +522,7 @@ nouveau_connector_create(struct drm_device *dev, int i2c_index, int type)
 			return ret;
 		}
 		break;
-	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_TV:
 		NV_INFO(dev, "Detected a TV connector\n");
 		break;
 	default:
@@ -531,21 +530,6 @@ nouveau_connector_create(struct drm_device *dev, int i2c_index, int type)
 		break;
 	}
 
-	/* some reasonable defaults */
-	switch (type) {
-	case DRM_MODE_CONNECTOR_DVII:
-	case DRM_MODE_CONNECTOR_DVID:
-	case DRM_MODE_CONNECTOR_LVDS:
-		nv_connector->scaling_mode = DRM_MODE_SCALE_FULLSCREEN;
-		break;
-	default:
-		nv_connector->scaling_mode = DRM_MODE_SCALE_NON_GPU;
-		break;
-	}
-
-	if (type != DRM_MODE_CONNECTOR_LVDS)
-		nv_connector->use_dithering = false;
-
 	/* defaults, will get overridden in detect() */
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
@@ -569,14 +553,23 @@ nouveau_connector_create(struct drm_device *dev, int i2c_index, int type)
 		drm_connector_attach_property(connector, dev->mode_config.dvi_i_select_subconnector_property, 0);
 	}
 
-	/* If supported in the future, it will have to use the scalers
-	 * internally and not expose them.
-	 */
-	if (type != DRM_MODE_CONNECTOR_SVIDEO) {
-		drm_connector_attach_property(connector, dev->mode_config.scaling_mode_property, nv_connector->scaling_mode);
-	}
+	if (type != DRM_MODE_CONNECTOR_LVDS)
+		nv_connector->use_dithering = false;
+
+	if (type == DRM_MODE_CONNECTOR_DVID ||
+	    type == DRM_MODE_CONNECTOR_DVII ||
+	    type == DRM_MODE_CONNECTOR_LVDS) {
+		nv_connector->scaling_mode = DRM_MODE_SCALE_FULLSCREEN;
 
-	drm_connector_attach_property(connector, dev->mode_config.dithering_mode_property, nv_connector->use_dithering ? DRM_MODE_DITHERING_ON : DRM_MODE_DITHERING_OFF);
+		drm_connector_attach_property(connector, dev->mode_config.scaling_mode_property,
+					      nv_connector->scaling_mode);
+		drm_connector_attach_property(connector, dev->mode_config.dithering_mode_property,
+					      nv_connector->use_dithering ? DRM_MODE_DITHERING_ON
+					      : DRM_MODE_DITHERING_OFF);
+
+	} else {
+		nv_connector->scaling_mode = DRM_MODE_SCALE_NON_GPU;
+	}
 
 	/* attach encoders */
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
@@ -585,6 +578,9 @@ nouveau_connector_create(struct drm_device *dev, int i2c_index, int type)
 		if (nv_encoder->dcb->i2c_index != i2c_index)
 			continue;
 
+		if (get_slave_funcs(nv_encoder))
+			get_slave_funcs(nv_encoder)->create_resources(encoder, connector);
+
 		drm_mode_connector_attach_encoder(connector, encoder);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_sor.c b/drivers/gpu/drm/nouveau/nv50_sor.c
index 60fe995..fb973fa 100644
--- a/drivers/gpu/drm/nouveau/nv50_sor.c
+++ b/drivers/gpu/drm/nouveau/nv50_sor.c
@@ -103,20 +103,6 @@ static void nv50_sor_restore(struct drm_encoder *drm_encoder)
 	NV_ERROR(drm_encoder->dev, "!!\n");
 }
 
-struct nouveau_connector *
-nouveau_encoder_connector_get(struct nouveau_encoder *encoder)
-{
-	struct drm_device *dev = to_drm_encoder(encoder)->dev;
-	struct drm_connector *drm_connector;
-
-	list_for_each_entry(drm_connector, &dev->mode_config.connector_list, head) {
-		if (drm_connector->encoder == to_drm_encoder(encoder))
-			return nouveau_connector(drm_connector);
-	}
-
-	return NULL;
-}
-
 static bool nv50_sor_mode_fixup(struct drm_encoder *drm_encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
-- 
1.6.3.3
