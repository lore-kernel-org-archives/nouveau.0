From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Subject: Some initial tidy-ups and refactoring
Date: Tue, 12 Aug 2014 00:03:06 +0100
Message-ID: <53E94BAA.9000305@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050608010307080906080508"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------050608010307080906080508
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The patches contain some tidy-up work, and refactoring that has arisen 
as a by-product of my initial work on adding TV support to nv50.

Best Regards
Joel Holdsworth

--------------050608010307080906080508
Content-Type: text/x-patch;
 name="0001-drm-nouveau-Removed-unneeded-include-in-nvc0_fence.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drm-nouveau-Removed-unneeded-include-in-nvc0_fence.c.pa";
 filename*1="tch"

From 3bb0d2f6d3c08bdd5fbcf953f2b4d327e4624663 Mon Sep 17 00:00:00 2001
From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Date: Sat, 7 Jun 2014 13:10:59 +0100
Subject: [PATCH 1/4] drm/nouveau: Removed unneeded include in nvc0_fence.c

---
 drivers/gpu/drm/nouveau/nvc0_fence.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c b/drivers/gpu/drm/nouveau/nvc0_fence.c
index becf19a..c9fc6f7 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fence.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fence.c
@@ -26,8 +26,6 @@
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
 
-#include "nv50_display.h"
-
 static int
 nvc0_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 {
-- 
1.9.1


--------------050608010307080906080508
Content-Type: text/x-patch;
 name="0002-drm-nouveau-Replaced-magic-numbers-with-defines-from.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-drm-nouveau-Replaced-magic-numbers-with-defines-from.pa";
 filename*1="tch"

From b47ad53d2bb492d480b4d42b6229902dd4d9728e Mon Sep 17 00:00:00 2001
From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Date: Mon, 11 Aug 2014 18:42:54 +0100
Subject: [PATCH 2/4] drm/nouveau: Replaced magic numbers with defines from
 nouveau_reg

---
 drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
index b36addf..61e29d6 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
@@ -31,11 +31,12 @@
 #include <subdev/timer.h>
 
 #include "nv50.h"
+#include "nouveau_reg.h"
 
 int
 nv50_dac_power(NV50_DISP_MTHD_V1)
 {
-	const u32 doff = outp->or * 0x800;
+	const u32 dpms_ctrl = NV50_PDISPLAY_DAC_DPMS_CTRL(outp->or);
 	union {
 		struct nv50_disp_dac_pwr_v0 v0;
 	} *args = data;
@@ -55,19 +56,21 @@ nv50_dac_power(NV50_DISP_MTHD_V1)
 	} else
 		return ret;
 
-	nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
-	nv_mask(priv, 0x61a004 + doff, 0xc000007f, 0x80000000 | stat);
-	nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
+	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
+	nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x4000007f,
+		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | stat);
+	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
 	return 0;
 }
 
 int
 nv50_dac_sense(NV50_DISP_MTHD_V1)
 {
+	const u32 dpms_ctrl = NV50_PDISPLAY_DAC_DPMS_CTRL(outp->or);
+	const u32 load_ctrl = NV50_PDISPLAY_DAC_LOAD_CTRL(outp->or);
 	union {
 		struct nv50_disp_dac_load_v0 v0;
 	} *args = data;
-	const u32 doff = outp->or * 0x800;
 	u32 loadval;
 	int ret;
 
@@ -81,16 +84,18 @@ nv50_dac_sense(NV50_DISP_MTHD_V1)
 	} else
 		return ret;
 
-	nv_mask(priv, 0x61a004 + doff, 0x807f0000, 0x80150000);
-	nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
+	nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
+		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00150000);
+	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
 
-	nv_wr32(priv, 0x61a00c + doff, 0x00100000 | loadval);
+	nv_wr32(priv, load_ctrl, 0x00100000 | loadval);
 	mdelay(9);
 	udelay(500);
-	loadval = nv_mask(priv, 0x61a00c + doff, 0xffffffff, 0x00000000);
+	loadval = nv_mask(priv, load_ctrl, 0xffffffff, 0x00000000);
 
-	nv_mask(priv, 0x61a004 + doff, 0x807f0000, 0x80550000);
-	nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
+	nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
+		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00550000);
+	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
 
 	nv_debug(priv, "DAC%d sense: 0x%08x\n", outp->or, loadval);
 	if (!(loadval & 0x80000000))
-- 
1.9.1


--------------050608010307080906080508
Content-Type: text/x-patch;
 name="0003-drm-nouveau-Replaced-copy-pasted-nv_wait-with-nv50_w.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-drm-nouveau-Replaced-copy-pasted-nv_wait-with-nv50_w.pa";
 filename*1="tch"

From 643cb54bba1bf8b4ab994da1447f0e91fd682b9c Mon Sep 17 00:00:00 2001
From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Date: Mon, 11 Aug 2014 18:44:25 +0100
Subject: [PATCH 3/4] drm/nouveau: Replaced copy-pasted nv_wait with
 nv50_wait_dpms_ctrl helper

---
 drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
index 61e29d6..98bded6 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
@@ -33,6 +33,12 @@
 #include "nv50.h"
 #include "nouveau_reg.h"
 
+static void
+nv50_wait_dpms_ctrl(struct nv50_disp_priv *priv, const u32 dpms_ctrl)
+{
+	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
+}
+
 int
 nv50_dac_power(NV50_DISP_MTHD_V1)
 {
@@ -56,10 +62,10 @@ nv50_dac_power(NV50_DISP_MTHD_V1)
 	} else
 		return ret;
 
-	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
+	nv50_wait_dpms_ctrl(priv, dpms_ctrl);
 	nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x4000007f,
 		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | stat);
-	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
+	nv50_wait_dpms_ctrl(priv, dpms_ctrl);
 	return 0;
 }
 
@@ -86,7 +92,7 @@ nv50_dac_sense(NV50_DISP_MTHD_V1)
 
 	nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
 		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00150000);
-	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
+	nv50_wait_dpms_ctrl(priv, dpms_ctrl);
 
 	nv_wr32(priv, load_ctrl, 0x00100000 | loadval);
 	mdelay(9);
@@ -95,7 +101,7 @@ nv50_dac_sense(NV50_DISP_MTHD_V1)
 
 	nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
 		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00550000);
-	nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
+	nv50_wait_dpms_ctrl(priv, dpms_ctrl);
 
 	nv_debug(priv, "DAC%d sense: 0x%08x\n", outp->or, loadval);
 	if (!(loadval & 0x80000000))
-- 
1.9.1


--------------050608010307080906080508
Content-Type: text/x-patch;
 name="0004-drm-nouveau-Refactored-encoder-create-functions-into.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0004-drm-nouveau-Refactored-encoder-create-functions-into.pa";
 filename*1="tch"

From 0e3a77833e345b45d0fa85857ef38d8cb2976d64 Mon Sep 17 00:00:00 2001
From: Joel Holdsworth <joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
Date: Sun, 1 Jun 2014 18:52:13 +0100
Subject: [PATCH 4/4] drm/nouveau: Refactored encoder create functions into
 common nv50_encoder_create helper

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


--------------050608010307080906080508
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------050608010307080906080508--
