From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 11/12] drm/nouveau: Import <nv17 TV-out support.
Date: Wed, 12 Aug 2009 02:15:07 +0200
Message-ID: <1250036108-28655-12-git-send-email-currojerez@riseup.net>
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
 drivers/gpu/drm/nouveau/Makefile       |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c |   33 +++-
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    4 +
 drivers/gpu/drm/nouveau/nouveau_i2c.c  |    6 +-
 drivers/gpu/drm/nouveau/nouveau_i2c.h  |    1 +
 drivers/gpu/drm/nouveau/nv04_display.c |    6 +-
 drivers/gpu/drm/nouveau/nv04_tv.c      |  306 ++++++++++++++++++++++++++++++++
 7 files changed, 352 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nv04_tv.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 4965e00..a79acec 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -18,8 +18,8 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nv04_instmem.o nv50_instmem.o \
              nv50_crtc.o nv50_dac.o nv50_sor.o \
              nv50_cursor.o nv50_display.o nv50_fbcon.o \
-             nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o \
-             nv04_dac.o nv04_dfp.o
+             nv04_dac.o nv04_dfp.o nv04_tv.o \
+             nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o
 
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 2d2e4eb..66f7d8b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -4493,6 +4493,16 @@ static void fabricate_dvi_i_output(struct parsed_dcb *dcb, bool twoHeads)
 #endif
 }
 
+static void fabricate_tv_output(struct parsed_dcb *dcb, bool twoHeads)
+{
+	struct dcb_entry *entry = new_dcb_entry(dcb);
+
+	entry->type = 1;
+	entry->i2c_index = LEGACY_I2C_TV;
+	entry->heads = twoHeads ? 3 : 1;
+	entry->location = !DCB_LOC_ON_CHIP;	/* ie OFF CHIP */
+}
+
 static bool
 parse_dcb20_entry(struct drm_device *dev, struct bios_parsed_dcb *bdcb,
 		  uint32_t conn, uint32_t conf, struct dcb_entry *entry)
@@ -4729,6 +4739,11 @@ static int parse_dcb_table(struct drm_device *dev, struct nvbios *bios, bool two
 			       "assuming a CRT output exists\n");
 		/* this situation likely means a really old card, pre DCB */
 		fabricate_vga_output(dcb, LEGACY_I2C_CRT, 1);
+
+		if (nv04_tv_identify(dev,
+				     bios->legacy.i2c_indices.tv) >= 0)
+			fabricate_tv_output(dcb, twoHeads);
+
 		return 0;
 	}
 
@@ -4789,9 +4804,19 @@ static int parse_dcb_table(struct drm_device *dev, struct nvbios *bios, bool two
 		NV_TRACEWARN(dev, "No useful information in BIOS output table; "
 				  "adding all possible outputs\n");
 		fabricate_vga_output(dcb, LEGACY_I2C_CRT, 1);
-		if (bios->tmds.output0_script_ptr ||
-		    bios->tmds.output1_script_ptr)
+
+		/* Attempt to detect TV before DVI because the test
+		 * for the former is more accurate and it rules the
+		 * latter out.
+		 */
+		if (nv04_tv_identify(dev,
+				     bios->legacy.i2c_indices.tv) >= 0)
+			fabricate_tv_output(dcb, twoHeads);
+
+		else if (bios->tmds.output0_script_ptr ||
+			 bios->tmds.output1_script_ptr)
 			fabricate_dvi_i_output(dcb, twoHeads);
+
 		return 0;
 	}
 
@@ -5026,6 +5051,8 @@ nouveau_bios_init(struct drm_device *dev)
 	uint32_t saved_nv_pextdev_boot_0;
 	int ret;
 
+	dev_priv->vbios = &bios->pub;
+
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
 
@@ -5061,8 +5088,6 @@ nouveau_bios_init(struct drm_device *dev)
 
 	bios_wr32(dev, NV_PEXTDEV_BOOT_0, saved_nv_pextdev_boot_0);
 
-	dev_priv->vbios = &bios->pub;
-
 	ret = nouveau_run_vbios_init(dev);
 	if (ret) {
 		dev_priv->vbios = NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index bf61e75..74f8b63 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -936,6 +936,10 @@ extern void nv04_dfp_bind_head(struct drm_device *dev, struct dcb_entry *dcbent,
 extern void nv04_dfp_disable(struct drm_device *dev, int head);
 extern void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode);
 
+/* nv04_tv.c */
+extern int nv04_tv_identify(struct drm_device *dev, int i2c_index);
+extern int nv04_tv_create(struct drm_device *dev, struct dcb_entry *entry);
+
 /* nv04_display.c */
 extern int nv04_display_create(struct drm_device *);
 extern void nv04_display_destroy(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_i2c.c b/drivers/gpu/drm/nouveau/nouveau_i2c.c
index c3b9a6f..5ac9e89 100644
--- a/drivers/gpu/drm/nouveau/nouveau_i2c.c
+++ b/drivers/gpu/drm/nouveau/nouveau_i2c.c
@@ -181,6 +181,7 @@ nouveau_i2c_new(struct drm_device *dev, const char *name, unsigned index,
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.algo_data = &i2c->algo;
 	i2c->dev = dev;
+	i2c->index = index;
 
 	switch (dcbi2c->port_type) {
 	case 0:
@@ -235,11 +236,14 @@ void
 nouveau_i2c_del(struct nouveau_i2c_chan **pi2c)
 {
 	struct nouveau_i2c_chan *i2c = *pi2c;
+	struct drm_nouveau_private *dev_priv;
 
 	if (!i2c)
 		return;
 
-	*pi2c = NULL;
+	dev_priv = i2c->dev->dev_private;
+
+	dev_priv->vbios->dcb->i2c[i2c->index].chan = *pi2c = NULL;
 	i2c_del_adapter(&i2c->adapter);
 	kfree(i2c);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_i2c.h b/drivers/gpu/drm/nouveau/nouveau_i2c.h
index e04c77e..babb9f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_i2c.h
+++ b/drivers/gpu/drm/nouveau/nouveau_i2c.h
@@ -33,6 +33,7 @@ struct nouveau_i2c_chan {
 	struct drm_device *dev;
 	struct i2c_adapter adapter;
 	struct i2c_algo_bit_data algo;
+	unsigned index;
 	unsigned rd;
 	unsigned wr;
 	unsigned data;
diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index 0aa720d..ff701ef 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -139,7 +139,11 @@ nv04_display_create(struct drm_device *dev)
 			ret = nv04_dfp_create(dev, dcbent);
 			break;
 		case OUTPUT_TV:
-			continue;
+			if (dcbent->location == DCB_LOC_ON_CHIP)
+				continue;
+			else
+				ret = nv04_tv_create(dev, dcbent);
+			break;
 		default:
 			NV_WARN(dev, "DCB type %d not known\n", dcbent->type);
 			continue;
diff --git a/drivers/gpu/drm/nouveau/nv04_tv.c b/drivers/gpu/drm/nouveau/nv04_tv.c
new file mode 100644
index 0000000..9b5090f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv04_tv.c
@@ -0,0 +1,306 @@
+/*
+ * Copyright (C) 2009 Francisco Jerez.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include "drmP.h"
+#include "nouveau_drv.h"
+#include "nouveau_encoder.h"
+#include "nouveau_crtc.h"
+#include "nouveau_hw.h"
+#include "drm_crtc_helper.h"
+
+#include <drm/i2c/ch7006.h>
+
+static struct {
+	struct i2c_board_info board_info;
+	struct drm_encoder_funcs funcs;
+	struct drm_encoder_helper_funcs hfuncs;
+	void *params;
+
+} nv04_tv_encoder_info[] = {
+	{
+		.board_info = { I2C_BOARD_INFO("ch7006", 0x75) },
+		.params = &(struct ch7006_encoder_params) {
+			CH7006_FORMAT_RGB24m12I, CH7006_CLOCK_MASTER,
+			0, 0, 0,
+			CH7006_SYNC_SLAVE, CH7006_SYNC_SEPARATED,
+			CH7006_POUT_3_3V, CH7006_ACTIVE_HSYNC
+		},
+	},
+};
+
+static bool probe_i2c_addr(struct i2c_adapter *adapter, int addr)
+{
+	struct i2c_msg msg = {
+		.addr = addr,
+		.len = 0,
+	};
+
+	return i2c_transfer(adapter, &msg, 1) == 1;
+}
+
+int nv04_tv_identify(struct drm_device *dev, int i2c_index)
+{
+	char adaptername[11];
+	struct nouveau_i2c_chan *i2c;
+	bool was_locked;
+	int i,ret;
+
+	NV_TRACE(dev, "Probing TV encoders on I2C bus: %d\n", i2c_index);
+
+	snprintf(adaptername, 11, "DCB-I2C-%d", i2c_index);
+	if (nouveau_i2c_new(dev, adaptername, i2c_index, &i2c))
+		return -ENODEV;
+
+	was_locked = NVLockVgaCrtcs(dev, false);
+
+	for (i = 0; i < ARRAY_SIZE(nv04_tv_encoder_info); i++) {
+		if (probe_i2c_addr(&i2c->adapter,
+				   nv04_tv_encoder_info[i].board_info.addr)) {
+			ret = i;
+			break;
+		}
+	}
+
+	if (i < ARRAY_SIZE(nv04_tv_encoder_info)) {
+		NV_TRACE(dev, "Detected TV encoder: %s\n",
+			 nv04_tv_encoder_info[i].board_info.type);
+
+	} else {
+		NV_TRACE(dev, "No TV encoders found.\n");
+
+		nouveau_i2c_del(&i2c);
+		i = -ENODEV;
+	}
+
+	NVLockVgaCrtcs(dev, was_locked);
+	return i;
+}
+
+#define PLLSEL_TV_CRTC1_MASK				\
+	(NV_PRAMDAC_PLL_COEFF_SELECT_TV_VSCLK1		\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_TV_PCLK1)
+#define PLLSEL_TV_CRTC2_MASK				\
+	(NV_PRAMDAC_PLL_COEFF_SELECT_TV_VSCLK2		\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_TV_PCLK2)
+
+static void nv04_tv_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nv04_mode_state *state = &dev_priv->mode_reg;
+	uint8_t crtc1A;
+
+	NV_INFO(dev, "Setting dpms mode %d on TV encoder (output %d)\n",
+		mode, nv_encoder->dcb->index);
+
+	state->pllsel &= ~(PLLSEL_TV_CRTC1_MASK | PLLSEL_TV_CRTC2_MASK);
+
+	if (mode == DRM_MODE_DPMS_ON) {
+		int head = nouveau_crtc(encoder->crtc)->index;
+		crtc1A = NVReadVgaCrtc(dev, head, NV_CIO_CRE_RPC1_INDEX);
+
+		state->pllsel |= head? PLLSEL_TV_CRTC2_MASK : PLLSEL_TV_CRTC1_MASK;
+
+		/* Inhibit hsync */
+		crtc1A |= 0x80;
+
+		NVWriteVgaCrtc(dev, head, NV_CIO_CRE_RPC1_INDEX, crtc1A);
+	}
+
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_PLL_COEFF_SELECT, state->pllsel);
+
+	to_encoder_slave(encoder)->slave_funcs->dpms(encoder, mode);
+}
+
+static void nv04_tv_bind(struct drm_device *dev, int head, bool bind)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nv04_crtc_reg *state = &dev_priv->mode_reg.crtc_reg[head];
+
+	state->tv_setup = 0;
+
+	if (bind) {
+		state->CRTC[NV_CIO_CRE_LCD__INDEX] = 0;
+		state->CRTC[NV_CIO_CRE_49] |= 0x10;
+	} else {
+		state->CRTC[NV_CIO_CRE_49] &= ~0x10;
+	}
+
+	NVWriteVgaCrtc(dev, head, NV_CIO_CRE_LCD__INDEX,
+		       state->CRTC[NV_CIO_CRE_LCD__INDEX]);
+	NVWriteVgaCrtc(dev, head, NV_CIO_CRE_49,
+		       state->CRTC[NV_CIO_CRE_49]);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_SETUP,
+		      state->tv_setup);
+}
+
+static void nv04_tv_prepare(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	int head = nouveau_crtc(encoder->crtc)->index;
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+
+	helper->dpms(encoder, DRM_MODE_DPMS_OFF);
+
+	nv04_dfp_disable(dev, head);
+
+	if (nv_two_heads(dev))
+		nv04_tv_bind(dev, head ^ 1, false);
+
+	nv04_tv_bind(dev, head, true);
+}
+
+static void nv04_tv_mode_set(struct drm_encoder* encoder,
+			     struct drm_display_mode *mode,
+			     struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
+	struct nv04_crtc_reg *regp = &dev_priv->mode_reg.crtc_reg[nv_crtc->index];
+
+	regp->tv_htotal = adjusted_mode->htotal;
+	regp->tv_vtotal = adjusted_mode->vtotal;
+
+	/* These delay the TV signals with respect to the VGA port,
+	 * they might be useful if we ever allow a CRTC to drive
+	 * multiple outputs.
+	 */
+	regp->tv_hskew = 1;
+	regp->tv_hsync_delay = 1;
+	regp->tv_hsync_delay2 = 64;
+	regp->tv_vskew = 1;
+	regp->tv_vsync_delay = 1;
+
+	to_encoder_slave(encoder)->slave_funcs->mode_set(encoder, mode, adjusted_mode);
+}
+
+static void nv04_tv_commit(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+
+	helper->dpms(encoder, DRM_MODE_DPMS_ON);
+
+	NV_INFO(dev, "Output %s is running on CRTC %d using output %c\n",
+		      drm_get_connector_name(&nouveau_encoder_connector_get(nv_encoder)->base), nv_crtc->index,
+		      '@' + ffs(nv_encoder->dcb->or));
+}
+
+static void nv04_tv_destroy(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+	to_encoder_slave(encoder)->slave_funcs->destroy(encoder);
+
+	drm_encoder_cleanup(encoder);
+
+	kfree(nv_encoder);
+}
+
+int nv04_tv_create(struct drm_device *dev, struct dcb_entry *entry)
+{
+	struct nouveau_encoder *nv_encoder;
+	struct drm_encoder *encoder;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct i2c_adapter *adap;
+	struct drm_encoder_funcs *funcs = NULL;
+	struct drm_encoder_helper_funcs *hfuncs = NULL;
+	struct drm_encoder_slave_funcs *sfuncs = NULL;
+	int i2c_index = entry->i2c_index;
+	int type, ret;
+	bool was_locked;
+
+	/* Ensure that we can talk to this encoder */
+	type = nv04_tv_identify(dev, i2c_index);
+	if (type < 0)
+		return type;
+
+	/* Allocate the necessary memory */
+	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
+	if (!nv_encoder)
+		return -ENOMEM;
+
+	/* Initialize the common members */
+	encoder = to_drm_encoder(nv_encoder);
+
+	funcs = &nv04_tv_encoder_info[type].funcs;
+	hfuncs = &nv04_tv_encoder_info[type].hfuncs;
+
+	drm_encoder_init(dev, encoder, funcs, DRM_MODE_ENCODER_TVDAC);
+	drm_encoder_helper_add(encoder, hfuncs);
+
+	encoder->possible_crtcs = entry->heads;
+	encoder->possible_clones = 0;
+
+	nv_encoder->dcb = entry;
+	nv_encoder->or = ffs(entry->or) - 1;
+
+	/* Run the slave-specific initialization */
+	adap = &dev_priv->vbios->dcb->i2c[i2c_index].chan->adapter;
+
+	was_locked = NVLockVgaCrtcs(dev, false);
+
+	ret = drm_i2c_encoder_init(encoder->dev, to_encoder_slave(encoder), adap,
+				   &nv04_tv_encoder_info[type].board_info);
+
+	NVLockVgaCrtcs(dev, was_locked);
+
+	if (ret < 0)
+		goto fail;
+
+	/* Fill the function pointers */
+	sfuncs = to_encoder_slave(encoder)->slave_funcs;
+
+	*funcs = (struct drm_encoder_funcs) {
+		.destroy = nv04_tv_destroy,
+	};
+
+	*hfuncs = (struct drm_encoder_helper_funcs) {
+		.dpms = nv04_tv_dpms,
+		.save = sfuncs->save,
+		.restore = sfuncs->restore,
+		.mode_fixup = sfuncs->mode_fixup,
+		.prepare = nv04_tv_prepare,
+		.commit = nv04_tv_commit,
+		.mode_set = nv04_tv_mode_set,
+		.detect = sfuncs->detect,
+	};
+
+	/* Set the slave encoder configuration */
+	sfuncs->set_config(encoder, nv04_tv_encoder_info[type].params);
+
+	return 0;
+
+fail:
+	drm_encoder_cleanup(encoder);
+
+	kfree(nv_encoder);
+	return ret;
+}
-- 
1.6.3.3
