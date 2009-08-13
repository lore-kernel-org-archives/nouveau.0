From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 08/10] drm: Import driver for the ch7006 I2C TV
	encoder chip.
Date: Thu, 13 Aug 2009 14:01:35 +0200
Message-ID: <1250164897-7871-8-git-send-email-currojerez@riseup.net>
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
 drivers/gpu/drm/Kconfig           |   14 +
 drivers/gpu/drm/Makefile          |    1 +
 drivers/gpu/drm/i2c/Makefile      |    4 +
 drivers/gpu/drm/i2c/ch7006_drv.c  |  477 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i2c/ch7006_mode.c |  470 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i2c/ch7006_priv.h |  333 ++++++++++++++++++++++++++
 include/drm/i2c/ch7006.h          |   86 +++++++
 7 files changed, 1385 insertions(+), 0 deletions(-)
 create mode 100644 drivers/gpu/drm/i2c/Makefile
 create mode 100644 drivers/gpu/drm/i2c/ch7006_drv.c
 create mode 100644 drivers/gpu/drm/i2c/ch7006_mode.c
 create mode 100644 drivers/gpu/drm/i2c/ch7006_priv.h
 create mode 100644 include/drm/i2c/ch7006.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5ea10e5..49b21cc 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -173,3 +173,17 @@ config DRM_NOUVEAU_BACKLIGHT
 	  Say Y here if you want to control the backlight of your display
 	  (e.g. a laptop panel).
 
+menu "I2C encoder or helper chips"
+     depends on DRM
+
+config DRM_I2C_CH7006
+	tristate "Chrontel ch7006 TV encoder"
+	default m if DRM_NOUVEAU
+	help
+	  Support for Chrontel ch7006 and similar TV encoders, found
+	  on some nVidia video cards.
+
+	  This driver is currently only useful if you're also using
+	  the nouveau driver.
+
+endmenu
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index eeb20aa..f0ef455 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_DRM_SIS)   += sis/
 obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VIA)	+=via/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-y			+= i2c/
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
new file mode 100644
index 0000000..6d2abaf
--- /dev/null
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -0,0 +1,4 @@
+ccflags-y := -Iinclude/drm
+
+ch7006-y := ch7006_drv.o ch7006_mode.o
+obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
new file mode 100644
index 0000000..c2594a1
--- /dev/null
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -0,0 +1,477 @@
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
+#include "ch7006_priv.h"
+
+/* DRM encoder functions */
+
+static void ch7006_encoder_set_config(struct drm_encoder *encoder,
+				      void *params)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+
+	priv->params = params;
+}
+
+static void ch7006_encoder_destroy(struct drm_encoder *encoder)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+
+	drm_property_destroy(encoder->dev, priv->scale_property);
+
+	kfree(priv);
+	to_encoder_slave(encoder)->slave_priv = NULL;
+
+	drm_i2c_encoder_destroy(encoder);
+}
+
+static void  ch7006_encoder_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_state *state = &priv->state;
+
+	ch7006_dbg(client, "\n");
+
+	if (mode == priv->last_dpms)
+		return;
+	priv->last_dpms = mode;
+
+	ch7006_setup_power_state(encoder);
+
+	ch7006_load_reg(client, state, CH7006_POWER);
+}
+
+static void ch7006_encoder_save(struct drm_encoder *encoder)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+
+	ch7006_dbg(client, "\n");
+
+	ch7006_state_save(client, &priv->saved_state);
+}
+
+static void ch7006_encoder_restore(struct drm_encoder *encoder)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+
+	ch7006_dbg(client, "\n");
+
+	ch7006_state_load(client, &priv->saved_state);
+}
+
+static bool ch7006_encoder_mode_fixup(struct drm_encoder *encoder,
+				      struct drm_display_mode *mode,
+				      struct drm_display_mode *adjusted_mode)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+
+	/* The ch7006 is painfully picky with the input timings so no
+	 * custom modes for now... */
+
+	priv->mode = ch7006_lookup_mode(encoder, mode);
+
+	return !!priv->mode;
+}
+
+static int ch7006_encoder_mode_valid(struct drm_encoder *encoder,
+				     struct drm_display_mode *mode)
+{
+	if (ch7006_lookup_mode(encoder, mode))
+		return MODE_OK;
+	else
+		return MODE_BAD;
+}
+
+static void ch7006_encoder_mode_set(struct drm_encoder *encoder,
+				     struct drm_display_mode *drm_mode,
+				     struct drm_display_mode *adjusted_mode)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_encoder_params *params = priv->params;
+	struct ch7006_state *state = &priv->state;
+	uint8_t *regs = state->regs;
+	struct ch7006_mode *mode = priv->mode;
+	struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
+	int start_active;
+
+	ch7006_dbg(client, "\n");
+
+	regs[CH7006_DISPMODE] = norm->dispmode | mode->dispmode;
+	regs[CH7006_BWIDTH] = 0;
+	regs[CH7006_INPUT_FORMAT] = bitf(CH7006_INPUT_FORMAT_FORMAT,
+					 params->input_format);
+
+	regs[CH7006_CLKMODE] = CH7006_CLKMODE_SUBC_LOCK
+		| bitf(CH7006_CLKMODE_XCM, params->xcm)
+		| bitf(CH7006_CLKMODE_PCM, params->pcm);
+	if (params->clock_mode)
+		regs[CH7006_CLKMODE] |= CH7006_CLKMODE_MASTER;
+	if (params->clock_edge)
+		regs[CH7006_CLKMODE] |= CH7006_CLKMODE_POS_EDGE;
+
+	start_active = (drm_mode->htotal & ~0x7) - (drm_mode->hsync_start & ~0x7);
+	regs[CH7006_POV] = bitf(CH7006_POV_START_ACTIVE_8, start_active);
+	regs[CH7006_START_ACTIVE] = bitf(CH7006_START_ACTIVE_0, start_active);
+
+	regs[CH7006_INPUT_SYNC] = 0;
+	if (params->sync_direction)
+		regs[CH7006_INPUT_SYNC] |= CH7006_INPUT_SYNC_OUTPUT;
+	if (params->sync_encoding)
+		regs[CH7006_INPUT_SYNC] |= CH7006_INPUT_SYNC_EMBEDDED;
+	if (drm_mode->flags & DRM_MODE_FLAG_PVSYNC)
+		regs[CH7006_INPUT_SYNC] |= CH7006_INPUT_SYNC_PVSYNC;
+	if (drm_mode->flags & DRM_MODE_FLAG_PHSYNC)
+		regs[CH7006_INPUT_SYNC] |= CH7006_INPUT_SYNC_PHSYNC;
+
+	regs[CH7006_DETECT] = 0;
+	regs[CH7006_BCLKOUT] = 0;
+
+	regs[CH7006_SUBC_INC3] = 0;
+	if (params->pout_level)
+		regs[CH7006_SUBC_INC3] |= CH7006_SUBC_INC3_POUT_3_3V;
+
+	regs[CH7006_SUBC_INC4] = 0;
+	if (params->active_detect)
+		regs[CH7006_SUBC_INC4] |= CH7006_SUBC_INC4_DS_INPUT;
+
+	regs[CH7006_PLL_CONTROL] = priv->saved_state.regs[CH7006_PLL_CONTROL];
+
+	ch7006_setup_levels(encoder);
+	ch7006_setup_subcarrier(encoder);
+	ch7006_setup_pll(encoder);
+	ch7006_setup_power_state(encoder);
+	ch7006_setup_properties(encoder);
+
+	ch7006_state_load(client, state);
+}
+
+static enum drm_connector_status ch7006_encoder_detect(struct drm_encoder *encoder,
+						       struct drm_connector *connector)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_state *state = &priv->state;
+	int det;
+
+	ch7006_dbg(client, "\n");
+
+	ch7006_save_reg(client, state, CH7006_DETECT);
+	ch7006_save_reg(client, state, CH7006_POWER);
+	ch7006_save_reg(client, state, CH7006_CLKMODE);
+
+	ch7006_write(client, CH7006_POWER, CH7006_POWER_RESET |
+					   bitfs(CH7006_POWER_LEVEL, NORMAL));
+	ch7006_write(client, CH7006_CLKMODE, CH7006_CLKMODE_MASTER);
+
+	ch7006_write(client, CH7006_DETECT, CH7006_DETECT_SENSE);
+
+	ch7006_write(client, CH7006_DETECT, 0);
+
+	det = ch7006_read(client, CH7006_DETECT);
+
+	ch7006_load_reg(client, state, CH7006_CLKMODE);
+	ch7006_load_reg(client, state, CH7006_POWER);
+	ch7006_load_reg(client, state, CH7006_DETECT);
+
+	if ((det & (CH7006_DETECT_SVIDEO_Y_TEST|
+		    CH7006_DETECT_SVIDEO_C_TEST|
+		    CH7006_DETECT_CVBS_TEST)) == 0)
+		priv->subconnector = DRM_MODE_SUBCONNECTOR_SCART;
+	else if ((det & (CH7006_DETECT_SVIDEO_Y_TEST|
+			 CH7006_DETECT_SVIDEO_C_TEST)) == 0)
+		priv->subconnector = DRM_MODE_SUBCONNECTOR_SVIDEO;
+	else if ((det & CH7006_DETECT_CVBS_TEST) == 0)
+		priv->subconnector = DRM_MODE_SUBCONNECTOR_Composite;
+	else
+		priv->subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
+
+	drm_connector_property_set_value(connector,
+					 encoder->dev->mode_config.tv_subconnector_property,
+					 priv->subconnector);
+
+	return priv->subconnector?
+		connector_status_connected
+		: connector_status_disconnected;
+}
+
+static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
+				    struct drm_connector *connector)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_mode *mode;
+	int n = 0;
+
+	for (mode = ch7006_modes; mode->mode.clock; mode++) {
+		if (~mode->valid_scales & 1<<priv->scale ||
+		    ~mode->valid_norms & 1<<priv->norm)
+			continue;
+
+		drm_mode_probed_add(connector,
+				    drm_mode_duplicate(encoder->dev, &mode->mode));
+
+		n++;
+	}
+
+	return n;
+}
+
+static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
+					   struct drm_connector *connector)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct drm_device *dev = encoder->dev;
+	struct drm_mode_config *conf = &dev->mode_config;
+
+	drm_mode_create_tv_properties(dev, NUM_TV_NORMS, ch7006_tv_norm_names);
+
+	priv->scale_property = drm_property_create(dev, DRM_MODE_PROP_RANGE,
+						   "scale", 2);
+	priv->scale_property->values[0] = 0;
+	priv->scale_property->values[1] = 2;
+
+	drm_connector_attach_property(connector, conf->tv_select_subconnector_property,
+				      priv->select_subconnector);
+	drm_connector_attach_property(connector, conf->tv_subconnector_property,
+				      priv->subconnector);
+	drm_connector_attach_property(connector, conf->tv_left_margin_property,
+				      priv->hmargin);
+	drm_connector_attach_property(connector, conf->tv_bottom_margin_property,
+				      priv->vmargin);
+	drm_connector_attach_property(connector, conf->tv_mode_property,
+				      priv->norm);
+	drm_connector_attach_property(connector, conf->tv_brightness_property,
+				      priv->brightness);
+	drm_connector_attach_property(connector, conf->tv_contrast_property,
+				      priv->contrast);
+	drm_connector_attach_property(connector, conf->tv_flicker_reduction_property,
+				      priv->flicker);
+	drm_connector_attach_property(connector, priv->scale_property,
+				      priv->scale);
+
+	return 0;
+}
+
+static int ch7006_encoder_set_property(struct drm_encoder *encoder,
+				       struct drm_connector *connector,
+				       struct drm_property *property,
+				       uint64_t val)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_state *state = &priv->state;
+	struct drm_mode_config *conf = &encoder->dev->mode_config;
+
+	ch7006_dbg(client, "\n");
+
+	if (property == conf->tv_select_subconnector_property) {
+		priv->select_subconnector = val;
+
+		ch7006_setup_power_state(encoder);
+
+		ch7006_load_reg(client, state, CH7006_POWER);
+
+	} else if (property == conf->tv_left_margin_property) {
+		priv->hmargin = val;
+
+		ch7006_setup_properties(encoder);
+
+		ch7006_load_reg(client, state, CH7006_POV);
+		ch7006_load_reg(client, state, CH7006_HPOS);
+
+	} else if (property == conf->tv_bottom_margin_property) {
+		priv->vmargin = val;
+
+		ch7006_setup_properties(encoder);
+
+		ch7006_load_reg(client, state, CH7006_POV);
+		ch7006_load_reg(client, state, CH7006_VPOS);
+
+	} else if (property == conf->tv_mode_property) {
+		priv->norm = val;
+
+		drm_helper_probe_single_connector_modes(connector, 0, 0);
+
+	} else if (property == conf->tv_brightness_property) {
+		priv->brightness = val;
+
+		ch7006_setup_levels(encoder);
+
+		ch7006_load_reg(client, state, CH7006_BLACK_LEVEL);
+
+	} else if (property == conf->tv_contrast_property) {
+		priv->contrast = val;
+
+		ch7006_setup_properties(encoder);
+
+		ch7006_load_reg(client, state, CH7006_CONTRAST);
+
+	} else if (property == conf->tv_flicker_reduction_property) {
+		priv->flicker = val;
+
+		ch7006_setup_properties(encoder);
+
+		ch7006_load_reg(client, state, CH7006_FFILTER);
+
+	} else if (property == priv->scale_property) {
+		priv->scale = val;
+
+		drm_helper_probe_single_connector_modes(connector, 0, 0);
+
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
+	.set_config = ch7006_encoder_set_config,
+	.destroy = ch7006_encoder_destroy,
+	.dpms = ch7006_encoder_dpms,
+	.save = ch7006_encoder_save,
+	.restore = ch7006_encoder_restore,
+	.mode_fixup = ch7006_encoder_mode_fixup,
+	.mode_valid = ch7006_encoder_mode_valid,
+	.mode_set = ch7006_encoder_mode_set,
+	.detect = ch7006_encoder_detect,
+	.get_modes = ch7006_encoder_get_modes,
+	.create_resources = ch7006_encoder_create_resources,
+	.set_property = ch7006_encoder_set_property,
+};
+
+
+/* I2C driver functions */
+
+static int ch7006_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	uint8_t addr = CH7006_VERSION_ID;
+	uint8_t val;
+	int ret;
+
+	ch7006_dbg(client, "\n");
+
+	ret = i2c_master_send(client, &addr, sizeof(addr));
+	if (ret < 0)
+		goto fail;
+
+	ret = i2c_master_recv(client, &val, sizeof(val));
+	if (ret < 0)
+		goto fail;
+
+	ch7006_info(client, "Detected version ID: %x\n", val);
+
+	return 0;
+
+fail:
+	ch7006_err(client, "Error %d reading version ID\n", ret);
+
+	return -ENODEV;
+}
+
+static int ch7006_remove(struct i2c_client *client)
+{
+	ch7006_dbg(client, "\n");
+
+	return 0;
+}
+
+static int ch7006_encoder_init(struct i2c_client *client,
+			       struct drm_device *dev,
+			       struct drm_encoder_slave *encoder)
+{
+	struct ch7006_priv *priv;
+
+	ch7006_dbg(client, "\n");
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	encoder->slave_priv = priv;
+	encoder->slave_funcs = &ch7006_encoder_funcs;
+
+	priv->norm = TV_NORM_PAL;
+	priv->select_subconnector = DRM_MODE_SUBCONNECTOR_Automatic;
+	priv->subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
+	priv->scale = 1;
+	priv->contrast = 50;
+	priv->brightness = 50;
+	priv->flicker = 50;
+	priv->hmargin = 50;
+	priv->vmargin = 50;
+	priv->last_dpms = -1;
+
+	return 0;
+}
+
+static struct i2c_device_id ch7006_ids[] = {
+	{ "ch7006", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ch7006_ids);
+
+static struct drm_i2c_encoder_driver ch7006_driver = {
+	.i2c_driver = {
+		.probe = ch7006_probe,
+		.remove = ch7006_remove,
+
+		.driver = {
+			.name = "ch7006",
+		},
+
+		.id_table = ch7006_ids,
+	},
+
+	.encoder_init = ch7006_encoder_init,
+};
+
+
+/* Module initialization */
+
+static int __init ch7006_init(void)
+{
+	return drm_i2c_encoder_register(THIS_MODULE, &ch7006_driver);
+}
+
+static void __exit ch7006_exit(void)
+{
+	drm_i2c_encoder_unregister(&ch7006_driver);
+}
+
+int ch7006_debug = 0;
+module_param_named(debug, ch7006_debug, int, 0600);
+MODULE_PARM_DESC(debug, "Enable debug output.");
+
+MODULE_AUTHOR("Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>");
+MODULE_DESCRIPTION("Chrontel ch7006 TV encoder driver");
+MODULE_LICENSE("GPL and additional rights");
+
+module_init(ch7006_init);
+module_exit(ch7006_exit);
diff --git a/drivers/gpu/drm/i2c/ch7006_mode.c b/drivers/gpu/drm/i2c/ch7006_mode.c
new file mode 100644
index 0000000..a4c2798
--- /dev/null
+++ b/drivers/gpu/drm/i2c/ch7006_mode.c
@@ -0,0 +1,470 @@
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
+#include "ch7006_priv.h"
+
+char *ch7006_tv_norm_names[] = {
+	[TV_NORM_PAL] = "PAL",
+	[TV_NORM_PAL_M] = "PAL-M",
+	[TV_NORM_PAL_N] = "PAL-N",
+	[TV_NORM_PAL_NC] = "PAL-Nc",
+	[TV_NORM_PAL_60] = "PAL-60",
+	[TV_NORM_NTSC_M] = "NTSC-M",
+	[TV_NORM_NTSC_J] = "NTSC-J",
+};
+
+#define NTSC_LIKE_TIMINGS .vrefresh = 60 * fixed1/1.001,		\
+		.vdisplay = 480,					\
+		.vtotal = 525,						\
+		.hvirtual = 660
+
+#define PAL_LIKE_TIMINGS .vrefresh = 50 * fixed1,		\
+		.vdisplay = 576,				\
+		.vtotal = 625,					\
+		.hvirtual = 810
+
+struct ch7006_tv_norm_info ch7006_tv_norms[] = {
+	[TV_NORM_NTSC_M] = {
+		NTSC_LIKE_TIMINGS,
+		.black_level = 0.339 * fixed1,
+		.subc_freq = 3579545 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, NTSC),
+		.voffset = 0,
+	},
+	[TV_NORM_NTSC_J] = {
+		NTSC_LIKE_TIMINGS,
+		.black_level = 0.286 * fixed1,
+		.subc_freq = 3579545 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, NTSC_J),
+		.voffset = 0,
+	},
+	[TV_NORM_PAL] = {
+		PAL_LIKE_TIMINGS,
+		.black_level = 0.3 * fixed1,
+		.subc_freq = 4433618.75 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, PAL),
+		.voffset = 0,
+	},
+	[TV_NORM_PAL_M] = {
+		NTSC_LIKE_TIMINGS,
+		.black_level = 0.339 * fixed1,
+		.subc_freq = 3575611.433 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, PAL_M),
+		.voffset = 16,
+	},
+
+	/* The following modes seem to work right but they're
+	 * undocumented */
+
+	[TV_NORM_PAL_N] = {
+		PAL_LIKE_TIMINGS,
+		.black_level = 0.339 * fixed1,
+		.subc_freq = 4433618.75 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, PAL),
+		.voffset = 0,
+	},
+	[TV_NORM_PAL_NC] = {
+		PAL_LIKE_TIMINGS,
+		.black_level = 0.3 * fixed1,
+		.subc_freq = 3582056.25 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, PAL),
+		.voffset = 0,
+	},
+	[TV_NORM_PAL_60] = {
+		NTSC_LIKE_TIMINGS,
+		.black_level = 0.3 * fixed1,
+		.subc_freq = 4433618.75 * fixed1,
+		.dispmode = bitfs(CH7006_DISPMODE_OUTPUT_STD, PAL_M),
+		.voffset = 16,
+	},
+};
+
+#define __MODE(f, hd, vd, ht, vt, hsynp, vsynp,				\
+	       subc, scale, scale_mask, norm_mask, e_hd, e_vd) {	\
+		.mode = {						\
+			.name = #hd "x" #vd,				\
+			.status = 0,					\
+			.type = DRM_MODE_TYPE_DRIVER,			\
+			.clock = f,					\
+			.hdisplay = hd,					\
+			.hsync_start = e_hd + 16,			\
+			.hsync_end = e_hd + 80,				\
+			.htotal = ht,					\
+			.hskew = 0,					\
+			.vdisplay = vd,					\
+			.vsync_start = vd + 10,				\
+			.vsync_end = vd + 26,				\
+			.vtotal = vt,					\
+			.vscan = 0,					\
+			.flags = DRM_MODE_FLAG_##hsynp##HSYNC |		\
+				DRM_MODE_FLAG_##vsynp##VSYNC,		\
+			.vrefresh = 0,					\
+		},							\
+		.enc_hdisp = e_hd,					\
+		.enc_vdisp = e_vd,					\
+		.subc_coeff = subc * fixed1,				\
+		.dispmode = bitfs(CH7006_DISPMODE_SCALING_RATIO, scale) | \
+			    bitfs(CH7006_DISPMODE_INPUT_RES, e_hd##x##e_vd), \
+		.valid_scales = scale_mask,				\
+		.valid_norms = norm_mask				\
+	 }
+
+#define MODE(f, hd, vd, ht, vt, hsynp, vsynp,				\
+	     subc, scale, scale_mask, norm_mask)			\
+	__MODE(f, hd, vd, ht, vt, hsynp, vsynp, subc, scale,		\
+	       scale_mask, norm_mask, hd, vd)
+
+#define NTSC_LIKE (1 << TV_NORM_NTSC_M | 1 << TV_NORM_NTSC_J |		\
+		   1 << TV_NORM_PAL_M | 1 << TV_NORM_PAL_60)
+
+#define PAL_LIKE (1 << TV_NORM_PAL | 1 << TV_NORM_PAL_N | 1 << TV_NORM_PAL_NC)
+
+struct ch7006_mode ch7006_modes[] = {
+	MODE(21000, 512, 384, 840, 500, N, N, 181.797557582, 5_4, 0x6, PAL_LIKE),
+	MODE(26250, 512, 384, 840, 625, N, N, 145.438046066, 1_1, 0x1, PAL_LIKE),
+	MODE(20140, 512, 384, 800, 420, N, N, 213.257083791, 5_4, 0x4, NTSC_LIKE),
+	MODE(24671, 512, 384, 784, 525, N, N, 174.0874153, 1_1, 0x3, NTSC_LIKE),
+	MODE(28125, 720, 400, 1125, 500, N, N, 135.742176298, 5_4, 0x6, PAL_LIKE),
+	MODE(34875, 720, 400, 1116, 625, N, N, 109.469496898, 1_1, 0x1, PAL_LIKE),
+	MODE(23790, 720, 400, 945, 420, N, N, 160.475642016, 5_4, 0x4, NTSC_LIKE),
+	MODE(29455, 720, 400, 936, 525, N, N, 129.614941843, 1_1, 0x3, NTSC_LIKE),
+	MODE(25000, 640, 400, 1000, 500, N, N, 152.709948279, 5_4, 0x6, PAL_LIKE),
+	MODE(31500, 640, 400, 1008, 625, N, N, 121.198371646, 1_1, 0x1, PAL_LIKE),
+	MODE(21147, 640, 400, 840, 420, N, N, 180.535097338, 5_4, 0x4, NTSC_LIKE),
+	MODE(26434, 640, 400, 840, 525, N, N, 144.42807787, 1_1, 0x2, NTSC_LIKE),
+	MODE(30210, 640, 400, 840, 600, N, N, 126.374568276, 7_8, 0x1, NTSC_LIKE),
+	MODE(21000, 640, 480, 840, 500, N, N, 181.797557582, 5_4, 0x4, PAL_LIKE),
+	MODE(26250, 640, 480, 840, 625, N, N, 145.438046066, 1_1, 0x2, PAL_LIKE),
+	MODE(31500, 640, 480, 840, 750, N, N, 121.198371646, 5_6, 0x1, PAL_LIKE),
+	MODE(24671, 640, 480, 784, 525, N, N, 174.0874153, 1_1, 0x4, NTSC_LIKE),
+	MODE(28196, 640, 480, 784, 600, N, N, 152.326488422, 7_8, 0x2, NTSC_LIKE),
+	MODE(30210, 640, 480, 800, 630, N, N, 142.171389101, 5_6, 0x1, NTSC_LIKE),
+	__MODE(29500, 720, 576, 944, 625, P, P, 145.592111636, 1_1, 0x7, PAL_LIKE, 800, 600),
+	MODE(36000, 800, 600, 960, 750, P, P, 119.304647022, 5_6, 0x6, PAL_LIKE),
+	MODE(39000, 800, 600, 936, 836, P, P, 110.127366499, 3_4, 0x1, PAL_LIKE),
+	MODE(39273, 800, 600, 1040, 630, P, P, 145.816809399, 5_6, 0x4, NTSC_LIKE),
+	MODE(43636, 800, 600, 1040, 700, P, P, 131.235128487, 3_4, 0x2, NTSC_LIKE),
+	MODE(47832, 800, 600, 1064, 750, P, P, 119.723275165, 7_10, 0x1, NTSC_LIKE),
+	{}
+};
+
+struct ch7006_mode *ch7006_lookup_mode(struct drm_encoder *encoder,
+				       struct drm_display_mode *drm_mode)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_mode *mode;
+
+	for (mode = ch7006_modes; mode->mode.clock; mode++) {
+
+		if (~mode->valid_norms & 1<<priv->norm)
+			continue;
+
+		if (mode->mode.hdisplay != drm_mode->hdisplay ||
+		    mode->mode.vdisplay != drm_mode->vdisplay ||
+		    mode->mode.vtotal != drm_mode->vtotal ||
+		    mode->mode.htotal != drm_mode->htotal ||
+		    mode->mode.clock != drm_mode->clock)
+			continue;
+
+		return mode;
+	}
+
+	return NULL;
+}
+
+/* Some common HW state calculation code */
+
+void ch7006_setup_levels(struct drm_encoder *encoder)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	uint8_t *regs = priv->state.regs;
+	struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
+	fixed gain;
+	int black_level;
+
+	/* Set DAC_GAIN if the voltage drop between white and black is
+	 * high enough. */
+	if (norm->black_level < 0.339 * fixed1) {
+		gain = 76*fixed1/71;
+
+		regs[CH7006_INPUT_FORMAT] |= CH7006_INPUT_FORMAT_DAC_GAIN;
+	} else {
+		gain = fixed1;
+
+		regs[CH7006_INPUT_FORMAT] &= ~CH7006_INPUT_FORMAT_DAC_GAIN;
+	}
+
+	black_level = norm->black_level*375/gain;
+
+	/* Correct it with the specified brightness. */
+	black_level = interpolate(90, black_level, 208, priv->brightness);
+
+	regs[CH7006_BLACK_LEVEL] = bitf(CH7006_BLACK_LEVEL_0, black_level);
+
+	ch7006_dbg(client, "black level: %d\n", black_level);
+}
+
+void ch7006_setup_subcarrier(struct drm_encoder *encoder)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_state *state = &priv->state;
+	struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
+	struct ch7006_mode *mode = priv->mode;
+	uint32_t subc_inc;
+
+	subc_inc = ((mode->subc_coeff >> 8)
+		    * (norm->subc_freq >> 24) + 0.5 * fixed1) / fixed1;
+
+	setbitf(state, CH7006_SUBC_INC0, 28, subc_inc);
+	setbitf(state, CH7006_SUBC_INC1, 24, subc_inc);
+	setbitf(state, CH7006_SUBC_INC2, 20, subc_inc);
+	setbitf(state, CH7006_SUBC_INC3, 16, subc_inc);
+	setbitf(state, CH7006_SUBC_INC4, 12, subc_inc);
+	setbitf(state, CH7006_SUBC_INC5, 8, subc_inc);
+	setbitf(state, CH7006_SUBC_INC6, 4, subc_inc);
+	setbitf(state, CH7006_SUBC_INC7, 0, subc_inc);
+
+	ch7006_dbg(client, "subcarrier inc: %u\n", subc_inc);
+}
+
+void ch7006_setup_pll(struct drm_encoder *encoder)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	uint8_t *regs = priv->state.regs;
+	struct ch7006_mode *mode = priv->mode;
+	int n, best_n = 0;
+	int m, best_m = 0;
+	int freq, best_freq = 0;
+
+	for (n = 0; n < CH7006_MAXN; n++) {
+		for (m = 0; m < CH7006_MAXM; m++) {
+			freq = CH7006_FREQ0*(n+2)/(m+2);
+
+			if (abs(freq - mode->mode.clock) <
+			    abs(best_freq - mode->mode.clock)) {
+				best_freq = freq;
+				best_n = n;
+				best_m = m;
+			}
+		}
+	}
+
+	regs[CH7006_PLLOV] = bitf(CH7006_PLLOV_N_8, best_n) |
+		bitf(CH7006_PLLOV_M_8, best_m);
+
+	regs[CH7006_PLLM] = bitf(CH7006_PLLM_0, best_m);
+	regs[CH7006_PLLN] = bitf(CH7006_PLLN_0, best_n);
+
+	if (best_n < 108)
+		regs[CH7006_PLL_CONTROL] |= CH7006_PLL_CONTROL_CAPACITOR;
+	else
+		regs[CH7006_PLL_CONTROL] &= ~CH7006_PLL_CONTROL_CAPACITOR;
+
+	ch7006_dbg(client, "n=%d m=%d f=%d c=%d\n",
+		   best_n, best_m, best_freq, best_n < 108);
+}
+
+void ch7006_setup_power_state(struct drm_encoder *encoder)
+{
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	uint8_t *power = &priv->state.regs[CH7006_POWER];
+	int subconnector;
+
+	subconnector = priv->select_subconnector?
+		priv->select_subconnector : priv->subconnector;
+
+	*power = CH7006_POWER_RESET;
+
+	if (priv->last_dpms == DRM_MODE_DPMS_ON) {
+		switch (subconnector) {
+		case DRM_MODE_SUBCONNECTOR_SVIDEO:
+			*power |= bitfs(CH7006_POWER_LEVEL, CVBS_OFF);
+			break;
+		case DRM_MODE_SUBCONNECTOR_Composite:
+			*power |= bitfs(CH7006_POWER_LEVEL, SVIDEO_OFF);
+			break;
+		case DRM_MODE_SUBCONNECTOR_SCART:
+			*power |= bitfs(CH7006_POWER_LEVEL, NORMAL) |
+				CH7006_POWER_SCART;
+			break;
+		}
+
+	} else {
+		*power |= bitfs(CH7006_POWER_LEVEL, FULL_POWER_OFF);
+	}
+}
+
+void ch7006_setup_properties(struct drm_encoder *encoder)
+{
+	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
+	struct ch7006_priv *priv = to_ch7006_priv(encoder);
+	struct ch7006_state *state = &priv->state;
+	struct ch7006_tv_norm_info *norm = &ch7006_tv_norms[priv->norm];
+	struct ch7006_mode *ch_mode = priv->mode;
+	struct drm_display_mode *mode = &ch_mode->mode;
+	uint8_t *regs = state->regs;
+	int flicker, contrast, hpos, vpos;
+	fixed scale, aspect;
+
+	flicker = interpolate(0, 2, 3, priv->flicker);
+	regs[CH7006_FFILTER] = bitf(CH7006_FFILTER_TEXT, flicker) |
+		bitf(CH7006_FFILTER_LUMA, flicker) |
+		bitf(CH7006_FFILTER_CHROMA, 1);
+
+	contrast = interpolate(0, 5, 7, priv->contrast);
+	regs[CH7006_CONTRAST] = bitf(CH7006_CONTRAST_0, contrast);
+
+	scale = norm->vtotal*fixed1/mode->vtotal;
+	aspect = ch_mode->enc_hdisp*fixed1/ch_mode->enc_vdisp;
+
+	hpos = (norm->hvirtual*aspect - mode->hdisplay*scale)
+		* priv->hmargin / scale / 100 / 4;
+
+	setbitf(state, CH7006_POV, HPOS_8, hpos);
+	setbitf(state, CH7006_HPOS, 0, hpos);
+
+	vpos = max(0LL, norm->vdisplay - mode->vdisplay*scale/fixed1
+		   + norm->voffset) * priv->vmargin / 100 / 2;
+
+	setbitf(state, CH7006_POV, VPOS_8, vpos);
+	setbitf(state, CH7006_VPOS, 0, vpos);
+
+	ch7006_dbg(client, "hpos: %d, vpos: %d\n", hpos, vpos);
+}
+
+/* HW access functions */
+
+void ch7006_write(struct i2c_client *client, uint8_t addr, uint8_t val)
+{
+	uint8_t buf[] = {addr, val};
+	int ret;
+
+	ret = i2c_master_send(client, buf, ARRAY_SIZE(buf));
+	if (ret < 0)
+		ch7006_err(client, "Error %d writing to subaddress 0x%x\n",
+			   ret, addr);
+}
+
+uint8_t ch7006_read(struct i2c_client *client, uint8_t addr)
+{
+	uint8_t val;
+	int ret;
+
+	ret = i2c_master_send(client, &addr, sizeof(addr));
+	if (ret < 0)
+		goto fail;
+
+	ret = i2c_master_recv(client, &val, sizeof(val));
+	if (ret < 0)
+		goto fail;
+
+	return val;
+
+fail:
+	ch7006_err(client, "Error %d reading from subaddress 0x%x\n",
+		   ret, addr);
+	return 0;
+}
+
+void ch7006_state_load(struct i2c_client *client,
+		       struct ch7006_state *state)
+{
+	ch7006_load_reg(client, state, CH7006_POWER);
+
+	ch7006_load_reg(client, state, CH7006_DISPMODE);
+	ch7006_load_reg(client, state, CH7006_FFILTER);
+	ch7006_load_reg(client, state, CH7006_BWIDTH);
+	ch7006_load_reg(client, state, CH7006_INPUT_FORMAT);
+	ch7006_load_reg(client, state, CH7006_CLKMODE);
+	ch7006_load_reg(client, state, CH7006_START_ACTIVE);
+	ch7006_load_reg(client, state, CH7006_POV);
+	ch7006_load_reg(client, state, CH7006_BLACK_LEVEL);
+	ch7006_load_reg(client, state, CH7006_HPOS);
+	ch7006_load_reg(client, state, CH7006_VPOS);
+	ch7006_load_reg(client, state, CH7006_INPUT_SYNC);
+	ch7006_load_reg(client, state, CH7006_DETECT);
+	ch7006_load_reg(client, state, CH7006_CONTRAST);
+	ch7006_load_reg(client, state, CH7006_PLLOV);
+	ch7006_load_reg(client, state, CH7006_PLLM);
+	ch7006_load_reg(client, state, CH7006_PLLN);
+	ch7006_load_reg(client, state, CH7006_BCLKOUT);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC0);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC1);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC2);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC3);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC4);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC5);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC6);
+	ch7006_load_reg(client, state, CH7006_SUBC_INC7);
+	ch7006_load_reg(client, state, CH7006_PLL_CONTROL);
+	ch7006_load_reg(client, state, CH7006_CALC_SUBC_INC0);
+
+	/* I don't know what this is for, but otherwise I get no
+	 * signal.
+	 */
+	ch7006_write(client, 0x3d, 0x0);
+}
+
+void ch7006_state_save(struct i2c_client *client,
+		       struct ch7006_state *state)
+{
+	ch7006_save_reg(client, state, CH7006_POWER);
+
+	ch7006_save_reg(client, state, CH7006_DISPMODE);
+	ch7006_save_reg(client, state, CH7006_FFILTER);
+	ch7006_save_reg(client, state, CH7006_BWIDTH);
+	ch7006_save_reg(client, state, CH7006_INPUT_FORMAT);
+	ch7006_save_reg(client, state, CH7006_CLKMODE);
+	ch7006_save_reg(client, state, CH7006_START_ACTIVE);
+	ch7006_save_reg(client, state, CH7006_POV);
+	ch7006_save_reg(client, state, CH7006_BLACK_LEVEL);
+	ch7006_save_reg(client, state, CH7006_HPOS);
+	ch7006_save_reg(client, state, CH7006_VPOS);
+	ch7006_save_reg(client, state, CH7006_INPUT_SYNC);
+	ch7006_save_reg(client, state, CH7006_DETECT);
+	ch7006_save_reg(client, state, CH7006_CONTRAST);
+	ch7006_save_reg(client, state, CH7006_PLLOV);
+	ch7006_save_reg(client, state, CH7006_PLLM);
+	ch7006_save_reg(client, state, CH7006_PLLN);
+	ch7006_save_reg(client, state, CH7006_BCLKOUT);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC0);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC1);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC2);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC3);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC4);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC5);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC6);
+	ch7006_save_reg(client, state, CH7006_SUBC_INC7);
+	ch7006_save_reg(client, state, CH7006_PLL_CONTROL);
+	ch7006_save_reg(client, state, CH7006_CALC_SUBC_INC0);
+
+	state->regs[CH7006_FFILTER] = (state->regs[CH7006_FFILTER] & 0xf0) |
+		(state->regs[CH7006_FFILTER] & 0x0c) >> 2 |
+		(state->regs[CH7006_FFILTER] & 0x03) << 2;
+}
diff --git a/drivers/gpu/drm/i2c/ch7006_priv.h b/drivers/gpu/drm/i2c/ch7006_priv.h
new file mode 100644
index 0000000..59945eb
--- /dev/null
+++ b/drivers/gpu/drm/i2c/ch7006_priv.h
@@ -0,0 +1,333 @@
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
+#ifndef __DRM_I2C_CH7006_PRIV_H__
+#define __DRM_I2C_CH7006_PRIV_H__
+
+#include "drmP.h"
+#include "drm_crtc_helper.h"
+#include "drm_encoder_slave.h"
+#include "i2c/ch7006.h"
+
+typedef int64_t fixed;
+#define fixed1 (1LL << 32)
+
+enum ch7006_tv_norm {
+	TV_NORM_PAL,
+	TV_NORM_PAL_M,
+	TV_NORM_PAL_N,
+	TV_NORM_PAL_NC,
+	TV_NORM_PAL_60,
+	TV_NORM_NTSC_M,
+	TV_NORM_NTSC_J,
+	NUM_TV_NORMS
+};
+
+struct ch7006_tv_norm_info {
+	fixed vrefresh;
+	int vdisplay;
+	int vtotal;
+	int hvirtual;
+
+	fixed subc_freq;
+	fixed black_level;
+
+	uint32_t dispmode;
+	int voffset;
+};
+
+struct ch7006_mode {
+	struct drm_display_mode mode;
+
+	int enc_hdisp;
+	int enc_vdisp;
+
+	fixed subc_coeff;
+	uint32_t dispmode;
+
+	uint32_t valid_scales;
+	uint32_t valid_norms;
+};
+
+struct ch7006_state {
+	uint8_t regs[0x26];
+};
+
+struct ch7006_priv {
+	struct ch7006_encoder_params *params;
+	struct ch7006_mode *mode;
+
+	struct ch7006_state state;
+	struct ch7006_state saved_state;
+
+	struct drm_property *scale_property;
+
+	int select_subconnector;
+	int subconnector;
+	int hmargin;
+	int vmargin;
+	enum ch7006_tv_norm norm;
+	int brightness;
+	int contrast;
+	int flicker;
+	int scale;
+
+	int last_dpms;
+};
+
+#define to_ch7006_priv(x) ((struct ch7006_priv *)to_encoder_slave(x)->slave_priv)
+
+extern int ch7006_debug;
+
+extern char *ch7006_tv_norm_names[];
+extern struct ch7006_tv_norm_info ch7006_tv_norms[];
+extern struct ch7006_mode ch7006_modes[];
+
+struct ch7006_mode *ch7006_lookup_mode(struct drm_encoder *encoder,
+				       struct drm_display_mode *drm_mode);
+
+void ch7006_setup_levels(struct drm_encoder *encoder);
+void ch7006_setup_subcarrier(struct drm_encoder *encoder);
+void ch7006_setup_pll(struct drm_encoder *encoder);
+void ch7006_setup_power_state(struct drm_encoder *encoder);
+void ch7006_setup_properties(struct drm_encoder *encoder);
+
+void ch7006_write(struct i2c_client *client, uint8_t addr, uint8_t val);
+uint8_t ch7006_read(struct i2c_client *client, uint8_t addr);
+
+void ch7006_state_load(struct i2c_client *client,
+		       struct ch7006_state *state);
+void ch7006_state_save(struct i2c_client *client,
+		       struct ch7006_state *state);
+
+/* Some helper macros */
+
+#define ch7006_dbg(client, format, ...) do {				\
+		if (ch7006_debug)					\
+			dev_printk(KERN_DEBUG, &client->dev,		\
+				   "%s: " format, __func__, ## __VA_ARGS__); \
+	} while (0)
+#define ch7006_info(client, format, ...) dev_info(&client->dev, format, __VA_ARGS__)
+#define ch7006_err(client, format, ...) dev_err(&client->dev, format, __VA_ARGS__)
+
+#define __mask(src, bitfield) (((2 << (1?bitfield)) - 1) & ~((1 << (0?bitfield)) - 1))
+#define mask(bitfield) __mask(bitfield)
+
+#define __bitf(src, bitfield, x) (((x) >> (src) << (0?bitfield)) &	\
+				  __mask(src, bitfield))
+#define bitf(bitfield, x) __bitf(bitfield, x)
+#define bitfs(bitfield, s) __bitf(bitfield, bitfield##_##s)
+#define setbitf(state, reg, bitfield, x)				\
+	state->regs[reg] = (state->regs[reg] &				\
+			    (typeof(*state->regs)) ~mask(reg##_##bitfield)) | \
+			    bitf(reg##_##bitfield, x)
+
+#define __unbitf(src, bitfield, x) ((x & __mask(src, bitfield)) \
+				    >> (0?bitfield) << (src))
+#define unbitf(bitfield, x) __unbitf(bitfield, x)
+
+#define interpolate(y0, y1, y2, x) ((y1) +				\
+				    ((x) < 50 ? (y1) - (y0) : (y2) - (y1)) \
+				    * ((x) - 50) / 50)
+
+#define ch7006_load_reg(client, state, reg) ch7006_write(client, reg, state->regs[reg])
+#define ch7006_save_reg(client, state, reg) state->regs[reg] = ch7006_read(client, reg)
+
+/* Fixed hardware specs */
+
+#define CH7006_FREQ0				14318
+#define CH7006_MAXN				650
+#define CH7006_MAXM				315
+
+/* Register definitions */
+
+#define CH7006_DISPMODE				0x00
+#define CH7006_DISPMODE_INPUT_RES		0, 7:5
+#define CH7006_DISPMODE_INPUT_RES_512x384	0x0
+#define CH7006_DISPMODE_INPUT_RES_720x400	0x1
+#define CH7006_DISPMODE_INPUT_RES_640x400	0x2
+#define CH7006_DISPMODE_INPUT_RES_640x480	0x3
+#define CH7006_DISPMODE_INPUT_RES_800x600	0x4
+#define CH7006_DISPMODE_INPUT_RES_NATIVE	0x5
+#define CH7006_DISPMODE_OUTPUT_STD		0, 4:3
+#define CH7006_DISPMODE_OUTPUT_STD_PAL		0x0
+#define CH7006_DISPMODE_OUTPUT_STD_NTSC		0x1
+#define CH7006_DISPMODE_OUTPUT_STD_PAL_M	0x2
+#define CH7006_DISPMODE_OUTPUT_STD_NTSC_J	0x3
+#define CH7006_DISPMODE_SCALING_RATIO		0, 2:0
+#define CH7006_DISPMODE_SCALING_RATIO_5_4	0x0
+#define CH7006_DISPMODE_SCALING_RATIO_1_1	0x1
+#define CH7006_DISPMODE_SCALING_RATIO_7_8	0x2
+#define CH7006_DISPMODE_SCALING_RATIO_5_6	0x3
+#define CH7006_DISPMODE_SCALING_RATIO_3_4	0x4
+#define CH7006_DISPMODE_SCALING_RATIO_7_10	0x5
+
+#define CH7006_FFILTER				0x01
+#define CH7006_FFILTER_TEXT			0, 5:4
+#define CH7006_FFILTER_LUMA			0, 3:2
+#define CH7006_FFILTER_CHROMA			0, 1:0
+#define CH7006_FFILTER_CHROMA_NO_DCRAWL		0x3
+
+#define CH7006_BWIDTH				0x03
+#define CH7006_BWIDTH_5L_FFILER			(1 << 7)
+#define CH7006_BWIDTH_CVBS_NO_CHROMA		(1 << 6)
+#define CH7006_BWIDTH_CHROMA			0, 5:4
+#define CH7006_BWIDTH_SVIDEO_YPEAK		(1 << 3)
+#define CH7006_BWIDTH_SVIDEO_LUMA		0, 2:1
+#define CH7006_BWIDTH_CVBS_LUMA			0, 0:0
+
+#define CH7006_INPUT_FORMAT			0x04
+#define CH7006_INPUT_FORMAT_DAC_GAIN		(1 << 6)
+#define CH7006_INPUT_FORMAT_RGB_PASS_THROUGH	(1 << 5)
+#define CH7006_INPUT_FORMAT_FORMAT		0, 3:0
+#define CH7006_INPUT_FORMAT_FORMAT_RGB16	0x0
+#define CH7006_INPUT_FORMAT_FORMAT_YCrCb24m16	0x1
+#define CH7006_INPUT_FORMAT_FORMAT_RGB24m16	0x2
+#define CH7006_INPUT_FORMAT_FORMAT_RGB15	0x3
+#define CH7006_INPUT_FORMAT_FORMAT_RGB24m12C	0x4
+#define CH7006_INPUT_FORMAT_FORMAT_RGB24m12I	0x5
+#define CH7006_INPUT_FORMAT_FORMAT_RGB24m8	0x6
+#define CH7006_INPUT_FORMAT_FORMAT_RGB16m8	0x7
+#define CH7006_INPUT_FORMAT_FORMAT_RGB15m8	0x8
+#define CH7006_INPUT_FORMAT_FORMAT_YCrCb24m8	0x9
+
+#define CH7006_CLKMODE				0x06
+#define CH7006_CLKMODE_SUBC_LOCK		(1 << 7)
+#define CH7006_CLKMODE_MASTER			(1 << 6)
+#define CH7006_CLKMODE_POS_EDGE			(1 << 4)
+#define CH7006_CLKMODE_XCM			0, 3:2
+#define CH7006_CLKMODE_PCM			0, 1:0
+
+#define CH7006_START_ACTIVE			0x07
+#define CH7006_START_ACTIVE_0			0, 7:0
+
+#define CH7006_POV				0x08
+#define CH7006_POV_START_ACTIVE_8		8, 2:2
+#define CH7006_POV_HPOS_8			8, 1:1
+#define CH7006_POV_VPOS_8			8, 0:0
+
+#define CH7006_BLACK_LEVEL			0x09
+#define CH7006_BLACK_LEVEL_0			0, 7:0
+
+#define CH7006_HPOS				0x0a
+#define CH7006_HPOS_0				0, 7:0
+
+#define CH7006_VPOS				0x0b
+#define CH7006_VPOS_0				0, 7:0
+
+#define CH7006_INPUT_SYNC			0x0d
+#define CH7006_INPUT_SYNC_EMBEDDED		(1 << 3)
+#define CH7006_INPUT_SYNC_OUTPUT		(1 << 2)
+#define CH7006_INPUT_SYNC_PVSYNC		(1 << 1)
+#define CH7006_INPUT_SYNC_PHSYNC		(1 << 0)
+
+#define CH7006_POWER				0x0e
+#define CH7006_POWER_SCART			(1 << 4)
+#define CH7006_POWER_RESET			(1 << 3)
+#define CH7006_POWER_LEVEL			0, 2:0
+#define CH7006_POWER_LEVEL_CVBS_OFF		0x0
+#define CH7006_POWER_LEVEL_POWER_OFF		0x1
+#define CH7006_POWER_LEVEL_SVIDEO_OFF		0x2
+#define CH7006_POWER_LEVEL_NORMAL		0x3
+#define CH7006_POWER_LEVEL_FULL_POWER_OFF	0x4
+
+#define CH7006_DETECT				0x10
+#define CH7006_DETECT_SVIDEO_Y_TEST		(1 << 3)
+#define CH7006_DETECT_SVIDEO_C_TEST		(1 << 2)
+#define CH7006_DETECT_CVBS_TEST			(1 << 1)
+#define CH7006_DETECT_SENSE			(1 << 0)
+
+#define CH7006_CONTRAST				0x11
+#define CH7006_CONTRAST_0			0, 2:0
+
+#define CH7006_PLLOV	 			0x13
+#define CH7006_PLLOV_N_8	 		8, 2:1
+#define CH7006_PLLOV_M_8	 		8, 0:0
+
+#define CH7006_PLLM	 			0x14
+#define CH7006_PLLM_0	 			0, 7:0
+
+#define CH7006_PLLN	 			0x15
+#define CH7006_PLLN_0	 			0, 7:0
+
+#define CH7006_BCLKOUT	 			0x17
+
+#define CH7006_SUBC_INC0			0x18
+#define CH7006_SUBC_INC0_28			28, 3:0
+
+#define CH7006_SUBC_INC1			0x19
+#define CH7006_SUBC_INC1_24			24, 3:0
+
+#define CH7006_SUBC_INC2			0x1a
+#define CH7006_SUBC_INC2_20			20, 3:0
+
+#define CH7006_SUBC_INC3			0x1b
+#define CH7006_SUBC_INC3_GPIO1_VAL		(1 << 7)
+#define CH7006_SUBC_INC3_GPIO0_VAL		(1 << 6)
+#define CH7006_SUBC_INC3_POUT_3_3V		(1 << 5)
+#define CH7006_SUBC_INC3_POUT_INV		(1 << 4)
+#define CH7006_SUBC_INC3_16			16, 3:0
+
+#define CH7006_SUBC_INC4			0x1c
+#define CH7006_SUBC_INC4_GPIO1_IN		(1 << 7)
+#define CH7006_SUBC_INC4_GPIO0_IN		(1 << 6)
+#define CH7006_SUBC_INC4_DS_INPUT		(1 << 4)
+#define CH7006_SUBC_INC4_12			12, 3:0
+
+#define CH7006_SUBC_INC5			0x1d
+#define CH7006_SUBC_INC5_8			8, 3:0
+
+#define CH7006_SUBC_INC6			0x1e
+#define CH7006_SUBC_INC6_4			4, 3:0
+
+#define CH7006_SUBC_INC7			0x1f
+#define CH7006_SUBC_INC7_0			0, 3:0
+
+#define CH7006_PLL_CONTROL			0x20
+#define CH7006_PLL_CONTROL_CPI			(1 << 5)
+#define CH7006_PLL_CONTROL_CAPACITOR		(1 << 4)
+#define CH7006_PLL_CONTROL_7STAGES		(1 << 3)
+#define CH7006_PLL_CONTROL_DIGITAL_5V		(1 << 2)
+#define CH7006_PLL_CONTROL_ANALOG_5V		(1 << 1)
+#define CH7006_PLL_CONTROL_MEMORY_5V		(1 << 0)
+
+#define CH7006_CALC_SUBC_INC0			0x21
+#define CH7006_CALC_SUBC_INC0_24		24, 4:3
+#define CH7006_CALC_SUBC_INC0_HYST		0, 2:1
+#define CH7006_CALC_SUBC_INC0_AUTO		(1 << 0)
+
+#define CH7006_CALC_SUBC_INC1			0x22
+#define CH7006_CALC_SUBC_INC1_16		16, 7:0
+
+#define CH7006_CALC_SUBC_INC2			0x23
+#define CH7006_CALC_SUBC_INC2_8			8, 7:0
+
+#define CH7006_CALC_SUBC_INC3			0x24
+#define CH7006_CALC_SUBC_INC3_0			0, 7:0
+
+#define CH7006_VERSION_ID			0x25
+
+#endif
diff --git a/include/drm/i2c/ch7006.h b/include/drm/i2c/ch7006.h
new file mode 100644
index 0000000..8390b43
--- /dev/null
+++ b/include/drm/i2c/ch7006.h
@@ -0,0 +1,86 @@
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
+#ifndef __DRM_I2C_CH7006_H__
+#define __DRM_I2C_CH7006_H__
+
+/**
+ * struct ch7006_encoder_params
+ *
+ * Describes how the ch7006 is wired up with the GPU. It should be
+ * used as the @params parameter of its @set_config method.
+ *
+ * See "http://www.chrontel.com/pdf/7006.pdf" for their precise
+ * meaning.
+ */
+struct ch7006_encoder_params {
+	enum {
+		CH7006_FORMAT_RGB16 = 0,
+		CH7006_FORMAT_YCrCb24m16,
+		CH7006_FORMAT_RGB24m16,
+		CH7006_FORMAT_RGB15,
+		CH7006_FORMAT_RGB24m12C,
+		CH7006_FORMAT_RGB24m12I,
+		CH7006_FORMAT_RGB24m8,
+		CH7006_FORMAT_RGB16m8,
+		CH7006_FORMAT_RGB15m8,
+		CH7006_FORMAT_YCrCb24m8,
+	} input_format;
+
+	enum {
+		CH7006_CLOCK_SLAVE = 0,
+		CH7006_CLOCK_MASTER,
+	} clock_mode;
+
+	enum {
+		CH7006_CLOCK_EDGE_NEG = 0,
+		CH7006_CLOCK_EDGE_POS,
+	} clock_edge;
+
+	int xcm, pcm;
+
+	enum {
+		CH7006_SYNC_SLAVE = 0,
+		CH7006_SYNC_MASTER,
+	} sync_direction;
+
+	enum {
+		CH7006_SYNC_SEPARATED = 0,
+		CH7006_SYNC_EMBEDDED,
+	} sync_encoding;
+
+	enum {
+		CH7006_POUT_1_8V = 0,
+		CH7006_POUT_3_3V,
+	} pout_level;
+
+	enum {
+		CH7006_ACTIVE_HSYNC = 0,
+		CH7006_ACTIVE_DSTART,
+	} active_detect;
+};
+
+#endif
-- 
1.6.3.3
