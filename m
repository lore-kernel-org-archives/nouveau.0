From: Joel Holdsworth <joel.holdsworth-EQPyqoE4rJiYoAmmQSGB5AC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 4/4] drm/nouveau: Refactored encoder create
	functions into common nv50_encoder_create helper
Date: Tue, 12 Aug 2014 10:05:09 +0100
Message-ID: <1407834309-16817-5-git-send-email-joel@airwebreathe.org.uk>
References: <1407834309-16817-1-git-send-email-joel@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407834309-16817-1-git-send-email-joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nv50_display.c | 178 +++++++++++++--------------------
 1 file changed, 71 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 03949ea..048e03e 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1442,6 +1442,37 @@ out:
 }
 
 /******************************************************************************
+ * Encoder Helpers
+ *****************************************************************************/
+
+static int
+nv50_encoder_create(struct drm_connector *connector, struct dcb_output *dcbe,
+	int type, int init_dpms, struct nouveau_i2c_port *i2c_port,
+	const struct drm_encoder_funcs *func,
+	const struct drm_encoder_helper_funcs *hfunc)
+{
+	struct nouveau_encoder *nv_encoder;
+	struct drm_encoder *encoder;
+
+	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
+	if (!nv_encoder)
+		return -ENOMEM;
+	nv_encoder->dcb = dcbe;
+	nv_encoder->or = ffs(dcbe->or) - 1;
+	nv_encoder->i2c = i2c_port;
+	nv_encoder->last_dpms = init_dpms;
+
+	encoder = to_drm_encoder(nv_encoder);
+	encoder->possible_crtcs = dcbe->heads;
+	encoder->possible_clones = 0;
+	drm_encoder_init(connector->dev, encoder, func, type);
+	drm_encoder_helper_add(encoder, hfunc);
+
+	drm_mode_connector_attach_encoder(connector, encoder);
+	return 0;
+}
+
+/******************************************************************************
  * DAC
  *****************************************************************************/
 static void
@@ -1618,32 +1649,6 @@ static const struct drm_encoder_funcs nv50_dac_func = {
 	.destroy = nv50_dac_destroy,
 };
 
-static int
-nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
-{
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nouveau_i2c *i2c = nvkm_i2c(&drm->device);
-	struct nouveau_encoder *nv_encoder;
-	struct drm_encoder *encoder;
-	int type = DRM_MODE_ENCODER_DAC;
-
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
-	nv_encoder->or = ffs(dcbe->or) - 1;
-	nv_encoder->i2c = i2c->find(i2c, dcbe->i2c_index);
-
-	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_dac_func, type);
-	drm_encoder_helper_add(encoder, &nv50_dac_hfunc);
-
-	drm_mode_connector_attach_encoder(connector, encoder);
-	return 0;
-}
-
 /******************************************************************************
  * Audio
  *****************************************************************************/
@@ -2017,42 +2022,6 @@ static const struct drm_encoder_funcs nv50_sor_func = {
 	.destroy = nv50_sor_destroy,
 };
 
-static int
-nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
-{
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nouveau_i2c *i2c = nvkm_i2c(&drm->device);
-	struct nouveau_encoder *nv_encoder;
-	struct drm_encoder *encoder;
-	int type;
-
-	switch (dcbe->type) {
-	case DCB_OUTPUT_LVDS: type = DRM_MODE_ENCODER_LVDS; break;
-	case DCB_OUTPUT_TMDS:
-	case DCB_OUTPUT_DP:
-	default:
-		type = DRM_MODE_ENCODER_TMDS;
-		break;
-	}
-
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
-	nv_encoder->or = ffs(dcbe->or) - 1;
-	nv_encoder->i2c = i2c->find(i2c, dcbe->i2c_index);
-	nv_encoder->last_dpms = DRM_MODE_DPMS_OFF;
-
-	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_sor_func, type);
-	drm_encoder_helper_add(encoder, &nv50_sor_hfunc);
-
-	drm_mode_connector_attach_encoder(connector, encoder);
-	return 0;
-}
-
 /******************************************************************************
  * PIOR
  *****************************************************************************/
@@ -2198,46 +2167,6 @@ static const struct drm_encoder_funcs nv50_pior_func = {
 	.destroy = nv50_pior_destroy,
 };
 
-static int
-nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
-{
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nouveau_i2c *i2c = nvkm_i2c(&drm->device);
-	struct nouveau_i2c_port *ddc = NULL;
-	struct nouveau_encoder *nv_encoder;
-	struct drm_encoder *encoder;
-	int type;
-
-	switch (dcbe->type) {
-	case DCB_OUTPUT_TMDS:
-		ddc  = i2c->find_type(i2c, NV_I2C_TYPE_EXTDDC(dcbe->extdev));
-		type = DRM_MODE_ENCODER_TMDS;
-		break;
-	case DCB_OUTPUT_DP:
-		ddc  = i2c->find_type(i2c, NV_I2C_TYPE_EXTAUX(dcbe->extdev));
-		type = DRM_MODE_ENCODER_TMDS;
-		break;
-	default:
-		return -ENODEV;
-	}
-
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
-	nv_encoder->or = ffs(dcbe->or) - 1;
-	nv_encoder->i2c = ddc;
-
-	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_pior_func, type);
-	drm_encoder_helper_add(encoder, &nv50_pior_hfunc);
-
-	drm_mode_connector_attach_encoder(connector, encoder);
-	return 0;
-}
-
 /******************************************************************************
  * Framebuffer
  *****************************************************************************/
@@ -2437,10 +2366,12 @@ nv50_display_create(struct drm_device *dev)
 {
 	struct nvif_device *device = &nouveau_drm(dev)->device;
 	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_i2c *i2c = nvkm_i2c(&drm->device);
 	struct dcb_table *dcb = &drm->vbios.dcb;
 	struct drm_connector *connector, *tmp;
 	struct nv50_disp *disp;
 	struct dcb_output *dcbe;
+	struct nouveau_i2c_port *i2c_port;
 	int crtcs, ret, i;
 
 	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
@@ -2498,21 +2429,54 @@ nv50_display_create(struct drm_device *dev)
 			continue;
 
 		if (dcbe->location == DCB_LOC_ON_CHIP) {
+			i2c_port = i2c->find(i2c, dcbe->i2c_index);
+
 			switch (dcbe->type) {
+			case DCB_OUTPUT_ANALOG:
+				ret = nv50_encoder_create(connector, dcbe,
+					DRM_MODE_ENCODER_DAC, DRM_MODE_DPMS_ON,
+					i2c_port, &nv50_dac_func,
+					&nv50_dac_hfunc);
+				break;
 			case DCB_OUTPUT_TMDS:
-			case DCB_OUTPUT_LVDS:
 			case DCB_OUTPUT_DP:
-				ret = nv50_sor_create(connector, dcbe);
+				ret = nv50_encoder_create(connector, dcbe,
+					DRM_MODE_ENCODER_TMDS,
+					DRM_MODE_DPMS_OFF,
+					i2c_port, &nv50_sor_func,
+					&nv50_sor_hfunc);
 				break;
-			case DCB_OUTPUT_ANALOG:
-				ret = nv50_dac_create(connector, dcbe);
+			case DCB_OUTPUT_LVDS:
+				ret = nv50_encoder_create(connector, dcbe,
+					DRM_MODE_ENCODER_LVDS, DRM_MODE_DPMS_ON,
+					i2c_port, &nv50_sor_func,
+					&nv50_sor_hfunc);
 				break;
 			default:
 				ret = -ENODEV;
 				break;
 			}
 		} else {
-			ret = nv50_pior_create(connector, dcbe);
+			switch (dcbe->type) {
+			case DCB_OUTPUT_TMDS:
+				i2c_port = i2c->find_type(i2c,
+					NV_I2C_TYPE_EXTDDC(dcbe->extdev));
+				ret = nv50_encoder_create(connector, dcbe,
+					DRM_MODE_ENCODER_TMDS, DRM_MODE_DPMS_ON,
+					i2c_port, &nv50_pior_func,
+					&nv50_pior_hfunc);
+				break;
+			case DCB_OUTPUT_DP:
+				i2c_port = i2c->find_type(i2c,
+					NV_I2C_TYPE_EXTAUX(dcbe->extdev));
+				ret = nv50_encoder_create(connector, dcbe,
+					DRM_MODE_ENCODER_TMDS, DRM_MODE_DPMS_ON,
+					i2c_port, &nv50_pior_func,
+					&nv50_pior_hfunc);
+				break;
+			default:
+				ret = -ENODEV;
+			}
 		}
 
 		if (ret) {
-- 
1.9.1
