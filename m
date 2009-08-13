From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 03/10] drm/nouveau: Use drm_encoder_slave
	instead of drm_encoder.
Date: Thu, 13 Aug 2009 14:01:30 +0200
Message-ID: <1250164897-7871-3-git-send-email-currojerez@riseup.net>
References: <1250164897-7871-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250164897-7871-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 drivers/gpu/drm/nouveau/nouveau_connector.c |    8 ++++----
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |   13 +++++++++++--
 drivers/gpu/drm/nouveau/nv04_output.c       |    8 ++++----
 drivers/gpu/drm/nouveau/nv50_crtc.c         |    2 +-
 drivers/gpu/drm/nouveau/nv50_dac.c          |   18 +++++++++---------
 drivers/gpu/drm/nouveau/nv50_sor.c          |   18 +++++++++---------
 6 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index c89bef7..54d5e58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -221,14 +221,14 @@ nouveau_connector_detect(struct drm_connector *connector)
 
 	nv_encoder = nouveau_connector_encoder_get(connector, OUTPUT_ANALOG);
 	if (!nouveau_connector_ddc_detect(connector)) {
-		if (!nv_encoder || !nv_encoder->base.helper_private)
+		if (!nv_encoder || !to_drm_encoder(nv_encoder)->helper_private)
 			return connector_status_disconnected;
 
-		helper = nv_encoder->base.helper_private;
+		helper = to_drm_encoder(nv_encoder)->helper_private;
 		if (!helper || !helper->detect)
 			return connector_status_disconnected;
 
-		if (helper->detect(&nv_encoder->base, connector) ==
+		if (helper->detect(to_drm_encoder(nv_encoder), connector) ==
 				connector_status_connected) {
 			nouveau_connector_set_encoder(connector, nv_encoder);
 			return connector_status_connected;
@@ -447,7 +447,7 @@ nouveau_connector_best_encoder(struct drm_connector *connector)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 
 	if (nv_connector->detected_encoder)
-		return &nv_connector->detected_encoder->base;
+		return to_drm_encoder(nv_connector->detected_encoder);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 3344e6c..8a7369c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -27,16 +27,18 @@
 #ifndef __NOUVEAU_OUTPUT_H__
 #define __NOUVEAU_OUTPUT_H__
 
+#include "drm_encoder_slave.h"
 #include "nouveau_drv.h"
 
 #define NV_DPMS_CLEARED 0x80
 
 struct nouveau_encoder {
-	struct drm_encoder base;
+	struct drm_encoder_slave base;
 
 	struct dcb_entry *dcb;
 	int or;
 
+	struct drm_display_mode mode;
 	int last_dpms;
 
 	struct nv04_output_reg restore;
@@ -44,7 +46,14 @@ struct nouveau_encoder {
 
 static inline struct nouveau_encoder *nouveau_encoder(struct drm_encoder *enc)
 {
-	return container_of(enc, struct nouveau_encoder, base);
+	struct drm_encoder_slave *slave = to_encoder_slave(enc);
+
+	return container_of(slave, struct nouveau_encoder, base);
+}
+
+static inline struct drm_encoder *to_drm_encoder(struct nouveau_encoder *enc)
+{
+	return &enc->base.base;
 }
 
 int nv50_sor_create(struct drm_device *dev, struct dcb_entry *entry);
diff --git a/drivers/gpu/drm/nouveau/nv04_output.c b/drivers/gpu/drm/nouveau/nv04_output.c
index 9bfeba4..ba57dcf 100644
--- a/drivers/gpu/drm/nouveau/nv04_output.c
+++ b/drivers/gpu/drm/nouveau/nv04_output.c
@@ -786,11 +786,11 @@ nv04_encoder_create(struct drm_device *dev, struct dcb_entry *entry)
 	} else
 		helper = &nv04_encoder_helper_funcs;
 
-	drm_encoder_init(dev, &nv_encoder->base, &nv04_encoder_funcs, type);
-	drm_encoder_helper_add(&nv_encoder->base, helper);
+	drm_encoder_init(dev, to_drm_encoder(nv_encoder), &nv04_encoder_funcs, type);
+	drm_encoder_helper_add(to_drm_encoder(nv_encoder), helper);
 
-	nv_encoder->base.possible_crtcs = entry->heads;
-	nv_encoder->base.possible_clones = 0;
+	to_drm_encoder(nv_encoder)->possible_crtcs = entry->heads;
+	to_drm_encoder(nv_encoder)->possible_clones = 0;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 99f24a3..d319a73 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -217,7 +217,7 @@ nouveau_crtc_connector_get(struct nouveau_crtc *crtc)
 		return NULL;
 
 	list_for_each_entry(drm_connector, &dev->mode_config.connector_list, head) {
-		if (drm_connector->encoder == &encoder->base)
+		if (drm_connector->encoder == to_drm_encoder(encoder))
 			return nouveau_connector(drm_connector);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_dac.c b/drivers/gpu/drm/nouveau/nv50_dac.c
index f07b92a..67b1457 100644
--- a/drivers/gpu/drm/nouveau/nv50_dac.c
+++ b/drivers/gpu/drm/nouveau/nv50_dac.c
@@ -36,7 +36,7 @@
 static void
 nv50_dac_disconnect(struct nouveau_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = to_drm_encoder(encoder)->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *evo = dev_priv->evo;
 	int ret;
@@ -57,7 +57,7 @@ nv50_dac_detect(struct drm_encoder *drm_encoder,
 		struct drm_connector *drm_connector)
 {
 	struct nouveau_encoder *encoder = nouveau_encoder(drm_encoder);
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = to_drm_encoder(encoder)->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	enum drm_connector_status status = connector_status_disconnected;
 	uint32_t dpms_state, load_pattern, load_state;
@@ -207,10 +207,10 @@ static void nv50_dac_mode_set(struct drm_encoder *drm_encoder,
 		mode_ctl |= NV50_EVO_DAC_MODE_CTRL_CRTC0;
 
 	/* Lacking a working tv-out, this is not a 100% sure. */
-	if (encoder->base.encoder_type == DRM_MODE_ENCODER_DAC) {
+	if (to_drm_encoder(encoder)->encoder_type == DRM_MODE_ENCODER_DAC) {
 		mode_ctl |= 0x40;
 	} else
-	if (encoder->base.encoder_type == DRM_MODE_ENCODER_TVDAC) {
+	if (to_drm_encoder(encoder)->encoder_type == DRM_MODE_ENCODER_TVDAC) {
 		mode_ctl |= 0x100;
 	}
 
@@ -250,7 +250,7 @@ static void nv50_dac_destroy(struct drm_encoder *drm_encoder)
 	if (!drm_encoder)
 		return;
 
-	drm_encoder_cleanup(&encoder->base);
+	drm_encoder_cleanup(to_drm_encoder(encoder));
 
 	kfree(encoder);
 }
@@ -273,12 +273,12 @@ int nv50_dac_create(struct drm_device *dev, struct dcb_entry *entry)
 	encoder->dcb = entry;
 	encoder->or = ffs(entry->or) - 1;
 
-	drm_encoder_init(dev, &encoder->base, &nv50_dac_encoder_funcs,
+	drm_encoder_init(dev, to_drm_encoder(encoder), &nv50_dac_encoder_funcs,
 			 DRM_MODE_ENCODER_DAC);
-	drm_encoder_helper_add(&encoder->base, &nv50_dac_helper_funcs);
+	drm_encoder_helper_add(to_drm_encoder(encoder), &nv50_dac_helper_funcs);
 
-	encoder->base.possible_crtcs = entry->heads;
-	encoder->base.possible_clones = 0;
+	to_drm_encoder(encoder)->possible_crtcs = entry->heads;
+	to_drm_encoder(encoder)->possible_clones = 0;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv50_sor.c b/drivers/gpu/drm/nouveau/nv50_sor.c
index af66324..60fe995 100644
--- a/drivers/gpu/drm/nouveau/nv50_sor.c
+++ b/drivers/gpu/drm/nouveau/nv50_sor.c
@@ -37,7 +37,7 @@
 static void
 nv50_sor_disconnect(struct nouveau_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = to_drm_encoder(encoder)->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *evo = dev_priv->evo;
 	int ret;
@@ -106,11 +106,11 @@ static void nv50_sor_restore(struct drm_encoder *drm_encoder)
 struct nouveau_connector *
 nouveau_encoder_connector_get(struct nouveau_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = to_drm_encoder(encoder)->dev;
 	struct drm_connector *drm_connector;
 
 	list_for_each_entry(drm_connector, &dev->mode_config.connector_list, head) {
-		if (drm_connector->encoder == &encoder->base)
+		if (drm_connector->encoder == to_drm_encoder(encoder))
 			return nouveau_connector(drm_connector);
 	}
 
@@ -166,7 +166,7 @@ static void nv50_sor_mode_set(struct drm_encoder *drm_encoder,
 	nv50_sor_dpms(drm_encoder, DRM_MODE_DPMS_ON);
 	dev_priv->in_modeset = ret;
 
-	if (encoder->base.encoder_type != DRM_MODE_ENCODER_LVDS) {
+	if (to_drm_encoder(encoder)->encoder_type != DRM_MODE_ENCODER_LVDS) {
 		mode_ctl |= NV50_EVO_SOR_MODE_CTRL_TMDS;
 		if (adjusted_mode->clock > 165000)
 			mode_ctl |= NV50_EVO_SOR_MODE_CTRL_TMDS_DUAL_LINK;
@@ -212,7 +212,7 @@ static void nv50_sor_destroy(struct drm_encoder *drm_encoder)
 	if (!drm_encoder)
 		return;
 
-	drm_encoder_cleanup(&encoder->base);
+	drm_encoder_cleanup(to_drm_encoder(encoder));
 
 	kfree(encoder);
 }
@@ -254,11 +254,11 @@ int nv50_sor_create(struct drm_device *dev, struct dcb_entry *entry)
 	encoder->dcb = entry;
 	encoder->or = ffs(entry->or) - 1;
 
-	drm_encoder_init(dev, &encoder->base, &nv50_sor_encoder_funcs, type);
-	drm_encoder_helper_add(&encoder->base, &nv50_sor_helper_funcs);
+	drm_encoder_init(dev, to_drm_encoder(encoder), &nv50_sor_encoder_funcs, type);
+	drm_encoder_helper_add(to_drm_encoder(encoder), &nv50_sor_helper_funcs);
 
-	encoder->base.possible_crtcs = entry->heads;
-	encoder->base.possible_clones = 0;
+	to_drm_encoder(encoder)->possible_crtcs = entry->heads;
+	to_drm_encoder(encoder)->possible_clones = 0;
 
 	return 0;
 }
-- 
1.6.3.3
