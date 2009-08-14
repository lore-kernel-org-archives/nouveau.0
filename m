From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv4 10/10] drm/nouveau: Import >=nv17 TV-out support.
Date: Fri, 14 Aug 2009 14:31:44 +0200
Message-ID: <1250253104-1299-1-git-send-email-currojerez@riseup.net>
References: <1250189355-28844-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250189355-28844-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
This version converts interpolate() to a static inline function.

 drivers/gpu/drm/nouveau/Makefile        |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    6 +
 drivers/gpu/drm/nouveau/nv04_dac.c      |   38 ++-
 drivers/gpu/drm/nouveau/nv04_display.c  |    2 +-
 drivers/gpu/drm/nouveau/nv17_tv.c       |  625 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv17_tv.h       |  156 ++++++++
 drivers/gpu/drm/nouveau/nv17_tv_modes.c |  583 ++++++++++++++++++++++++++++
 7 files changed, 1405 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nv17_tv.c
 create mode 100644 drivers/gpu/drm/nouveau/nv17_tv.h
 create mode 100644 drivers/gpu/drm/nouveau/nv17_tv_modes.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index a79acec..5a46cdd 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -18,7 +18,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nv04_instmem.o nv50_instmem.o \
              nv50_crtc.o nv50_dac.o nv50_sor.o \
              nv50_cursor.o nv50_display.o nv50_fbcon.o \
-             nv04_dac.o nv04_dfp.o nv04_tv.o \
+             nv04_dac.o nv04_dfp.o nv04_tv.o nv17_tv.o nv17_tv_modes.o \
              nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o
 
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index aa74ff6..65751de 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -934,6 +934,12 @@ extern void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode);
 extern int nv04_tv_identify(struct drm_device *dev, int i2c_index);
 extern int nv04_tv_create(struct drm_device *dev, struct dcb_entry *entry);
 
+/* nv17_tv.c */
+extern int nv17_tv_create(struct drm_device *dev, struct dcb_entry *entry);
+extern enum drm_connector_status nv17_tv_detect(struct drm_encoder *encoder,
+						struct drm_connector *connector,
+						uint32_t pin_mask);
+
 /* nv04_display.c */
 extern int nv04_display_create(struct drm_device *);
 extern void nv04_display_destroy(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouveau/nv04_dac.c
index 05fc393..31f7bbf 100644
--- a/drivers/gpu/drm/nouveau/nv04_dac.c
+++ b/drivers/gpu/drm/nouveau/nv04_dac.c
@@ -220,14 +220,21 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 	struct dcb_entry *dcb = nouveau_encoder(encoder)->dcb;
 	uint32_t testval, regoffset = nv04_dac_output_offset(encoder);
 	uint32_t saved_powerctrl_2 = 0, saved_powerctrl_4 = 0, saved_routput,
-		saved_rtest_ctrl, temp, routput;
+		saved_rtest_ctrl, temp, saved_gpio_ext = 0, routput;
 	int head, present = 0;
 
 #define RGB_TEST_DATA(r,g,b) (r << 0 | g << 10 | b << 20)
-	testval = RGB_TEST_DATA(0x140, 0x140, 0x140); /* 0x94050140 */
+	if (dcb->type == OUTPUT_TV) {
+		testval = RGB_TEST_DATA(0xa0, 0xa0, 0xa0);
 
-	if (dev_priv->vbios->dactestval)
-		testval = dev_priv->vbios->dactestval;
+		if (dev_priv->vbios->tvdactestval)
+			testval = dev_priv->vbios->tvdactestval;
+	} else {
+		testval = RGB_TEST_DATA(0x140, 0x140, 0x140); /* 0x94050140 */
+
+		if (dev_priv->vbios->dactestval)
+			testval = dev_priv->vbios->dactestval;
+	}
 
 	saved_rtest_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset);
 	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset,
@@ -241,6 +248,13 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4 & 0xffffffcf);
 	}
 
+	if (nv_arch(dev) >= NV_30) {
+		saved_gpio_ext = NVReadCRTC(dev, 0, NV_PCRTC_GPIO_EXT);
+
+		NVWriteCRTC(dev, 0, NV_PCRTC_GPIO_EXT, (saved_gpio_ext & ~(3 << 20)) |
+			    (dcb->type == OUTPUT_TV ? (1 << 20) : 0));
+	}
+
 	msleep(4);
 
 	saved_routput = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset);
@@ -254,6 +268,13 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 	/* nv driver and nv31 use 0xfffffeee, nv34 and 6600 use 0xfffffece */
 	routput = (saved_routput & 0xfffffece) | head << 8;
 
+	if (nv_arch(dev) >= NV_40) {
+		if (dcb->type == OUTPUT_TV)
+			routput |= 1 << 20;
+		else
+			routput &= ~(1 << 20);
+	}
+
 	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset, routput);
 	msleep(1);
 
@@ -269,7 +290,11 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 
 	temp = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset);
 
-	present = temp & NV_PRAMDAC_TEST_CONTROL_SENSEB_ALLHI;
+	if (dcb->type == OUTPUT_TV)
+		present = (nv17_tv_detect(encoder, connector, (temp >> 28) & 0xe)
+			   == connector_status_connected);
+	else
+		present = temp & NV_PRAMDAC_TEST_CONTROL_SENSEB_ALLHI;
 
 	temp = NVReadRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL);
 	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL,
@@ -283,6 +308,9 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4);
 	nvWriteMC(dev, NV_PBUS_POWERCTRL_2, saved_powerctrl_2);
 
+	if (nv_arch(dev) >= NV_30)
+		NVWriteRAMDAC(dev, 0, NV_PCRTC_GPIO_EXT, saved_gpio_ext);
+
 	if (present) {
 		NV_INFO(dev, "Load detected on output %c\n", '@' + ffs(dcb->or));
 		return connector_status_connected;
diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index ceed5bf..8d6ce2e 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -140,7 +140,7 @@ nv04_display_create(struct drm_device *dev)
 			break;
 		case OUTPUT_TV:
 			if (dcbent->location == DCB_LOC_ON_CHIP)
-				continue;
+				ret = nv17_tv_create(dev, dcbent);
 			else
 				ret = nv04_tv_create(dev, dcbent);
 			break;
diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
new file mode 100644
index 0000000..6055043
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -0,0 +1,625 @@
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
+#include "drm_crtc_helper.h"
+#include "nouveau_drv.h"
+#include "nouveau_encoder.h"
+#include "nouveau_crtc.h"
+#include "nouveau_hw.h"
+#include "nv17_tv.h"
+
+enum drm_connector_status nv17_tv_detect(struct drm_encoder *encoder,
+					 struct drm_connector *connector,
+					 uint32_t pin_mask)
+{
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+
+	tv_enc->pin_mask = pin_mask;
+
+	switch (pin_mask) {
+	case 0x2:
+	case 0x4:
+		tv_enc->subconnector = DRM_MODE_SUBCONNECTOR_Composite;
+		break;
+	case 0xc:
+		tv_enc->subconnector = DRM_MODE_SUBCONNECTOR_SVIDEO;
+		break;
+	case 0xe:
+		if (nouveau_encoder(encoder)->dcb->tvconf.has_component_output)
+			tv_enc->subconnector = DRM_MODE_SUBCONNECTOR_Component;
+		else
+			tv_enc->subconnector = DRM_MODE_SUBCONNECTOR_SCART;
+		break;
+	default:
+		tv_enc->subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
+		break;
+	}
+
+	drm_connector_property_set_value(connector,
+					 encoder->dev->mode_config.tv_subconnector_property,
+					 tv_enc->subconnector);
+
+	return tv_enc->subconnector? connector_status_connected
+		: connector_status_disconnected;
+}
+
+static int nv17_tv_get_modes(struct drm_encoder *encoder,
+			     struct drm_connector *connector)
+{
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+	struct drm_display_mode *mode;
+	int n = 0;
+
+	if (tv_norm->kind == CTV_ENC_MODE) {
+		struct drm_display_mode *output_mode = &tv_norm->ctv_enc_mode.mode;
+		int i;
+		struct {
+			int hdisplay;
+			int vdisplay;
+		} modes[] = {{ 640, 400 },
+			     { 640, 480 },
+			     { 720, 480 },
+			     { 720, 576 },
+			     { 800, 600 },
+			     { 1024, 768 },
+			     { 1280, 720 },
+			     { 1280, 1024 },
+			     { 1920, 1080 }};
+
+		for (i = 0; i < ARRAY_SIZE(modes); i++) {
+			if (modes[i].hdisplay > output_mode->hdisplay ||
+			    modes[i].vdisplay > output_mode->vdisplay)
+				continue;
+
+			if (modes[i].hdisplay == output_mode->hdisplay &&
+			    modes[i].vdisplay == output_mode->vdisplay) {
+				mode = drm_mode_duplicate(encoder->dev, output_mode);
+				mode->type |= DRM_MODE_TYPE_PREFERRED;
+			} else {
+				mode = drm_cvt_mode(encoder->dev, modes[i].hdisplay,
+						    modes[i].vdisplay, 60, false,
+						    output_mode->flags & DRM_MODE_FLAG_INTERLACE);
+			}
+
+			/* CVT modes are sometimes unsuitable... */
+			if (output_mode->hdisplay <= 720
+			    || output_mode->hdisplay >= 1920) {
+				mode->htotal = output_mode->htotal;
+				mode->hsync_start = (mode->hdisplay + (mode->htotal
+						     - mode->hdisplay) * 9 / 10) & ~7;
+				mode->hsync_end = mode->hsync_start + 8;
+			}
+			if (output_mode->vdisplay >= 1024) {
+				mode->vtotal = output_mode->vtotal;
+				mode->vsync_start = output_mode->vsync_start;
+				mode->vsync_end = output_mode->vsync_end;
+			}
+
+			mode->type |= DRM_MODE_TYPE_DRIVER;
+			drm_mode_probed_add(connector, mode);
+			n++;
+		}
+
+
+	} else {
+		struct drm_display_mode *tv_mode;
+
+		for (tv_mode = nv17_tv_modes; tv_mode->hdisplay; tv_mode++) {
+			mode = drm_mode_duplicate(encoder->dev, tv_mode);
+
+			mode->clock = tv_norm->tv_enc_mode.vrefresh
+				*mode->htotal/1000*mode->vtotal/1000;
+
+			if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
+				mode->clock *= 2;
+
+			if (mode->hdisplay == tv_norm->tv_enc_mode.hdisplay &&
+			    mode->vdisplay == tv_norm->tv_enc_mode.vdisplay)
+				mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+			drm_mode_probed_add(connector, mode);
+			n++;
+		}
+	}
+
+	return n;
+}
+
+static int nv17_tv_mode_valid(struct drm_encoder *encoder,
+			      struct drm_display_mode *mode)
+{
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+
+	if (tv_norm->kind == CTV_ENC_MODE) {
+		struct drm_display_mode *output_mode = &tv_norm->ctv_enc_mode.mode;
+
+		if (mode->clock > 400000)
+			return MODE_CLOCK_HIGH;
+
+		if (mode->hdisplay > output_mode->hdisplay ||
+		    mode->vdisplay > output_mode->vdisplay)
+			return MODE_BAD;
+
+		if ((mode->flags & DRM_MODE_FLAG_INTERLACE) !=
+		    (output_mode->flags & DRM_MODE_FLAG_INTERLACE))
+			return MODE_NO_INTERLACE;
+
+		if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
+			return MODE_NO_DBLESCAN;
+
+	} else {
+		const int vsync_tolerance = 10;
+
+		if (mode->clock > 70000)
+			return MODE_CLOCK_HIGH;
+
+		if (abs(drm_mode_vrefresh(mode) - tv_norm->tv_enc_mode.vrefresh) >
+		    vsync_tolerance)
+			return MODE_VSYNC;
+
+		/* The encoder takes care of the actual interlacing */
+		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+			return MODE_NO_INTERLACE;
+	}
+
+	return MODE_OK;
+}
+
+static bool nv17_tv_mode_fixup(struct drm_encoder *encoder,
+			       struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
+{
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+
+	if (tv_norm->kind == CTV_ENC_MODE)
+		adjusted_mode->clock = tv_norm->ctv_enc_mode.mode.clock;
+	else
+		adjusted_mode->clock = 90000;
+
+	return true;
+}
+
+static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nv17_tv_state *regs = &to_tv_enc(encoder)->state;
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+
+	if (nouveau_encoder(encoder)->last_dpms == mode)
+		return;
+	nouveau_encoder(encoder)->last_dpms = mode;
+
+	NV_TRACE(dev, "Setting dpms mode %d on TV encoder (output %d)\n",
+		 mode, nouveau_encoder(encoder)->dcb->index);
+
+	regs->ptv_200 &= ~1;
+
+	if (tv_norm->kind == CTV_ENC_MODE) {
+		nv04_dfp_update_fp_control(encoder, mode);
+
+	} else {
+		nv04_dfp_update_fp_control(encoder, DRM_MODE_DPMS_OFF);
+
+		if (mode == DRM_MODE_DPMS_ON)
+			regs->ptv_200 |= 1;
+	}
+
+	nv_load_ptv(dev, regs, 200);
+
+	if (nv_arch(dev) >= NV_30) {
+		uint32_t *gpio_ext = &dev_priv->mode_reg.crtc_reg[0].gpio_ext;
+
+		*gpio_ext &= ~(3 << 20);
+		if (mode == DRM_MODE_DPMS_ON)
+			*gpio_ext |= 1 << 20;
+
+		NVWriteCRTC(dev, 0, NV_PCRTC_GPIO_EXT, *gpio_ext);
+	}
+
+	nv04_dac_update_dacclk(encoder, mode == DRM_MODE_DPMS_ON);
+}
+
+static void nv17_tv_prepare(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+	int head = nouveau_crtc(encoder->crtc)->index;
+	uint8_t *cr_lcd = &dev_priv->mode_reg.crtc_reg[head].CRTC[NV_CIO_CRE_LCD__INDEX];
+	uint32_t dacclk_off = NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder);
+	uint32_t dacclk;
+
+	helper->dpms(encoder, DRM_MODE_DPMS_OFF);
+
+	nv04_dfp_disable(dev, head);
+
+	/* Unbind any FP encoders from this head if we need the FP
+	 * stuff enabled. */
+	if (tv_norm->kind == CTV_ENC_MODE) {
+		struct drm_encoder *enc;
+
+		list_for_each_entry(enc, &dev->mode_config.encoder_list, head) {
+			struct dcb_entry *dcb = nouveau_encoder(enc)->dcb;
+
+			if ((dcb->type == OUTPUT_TMDS || dcb->type == OUTPUT_LVDS)
+			    && !enc->crtc && nv04_dfp_get_bound_head(dev, dcb) == head)
+				nv04_dfp_bind_head(dev, dcb, head ^ 1, dev_priv->VBIOS.fp.dual_link);
+		}
+
+	}
+
+	/* Some NV4x have unknown values (0x3f, 0x50, 0x54, 0x6b, 0x79, 0x7f)
+	 * at LCD__INDEX which we don't alter
+	 */
+	if (!(*cr_lcd & 0x44)) {
+		if (tv_norm->kind == CTV_ENC_MODE)
+			*cr_lcd = 0x1 | (head ? 0x0 : 0x8);
+		else
+			*cr_lcd = 0;
+	}
+
+	/* Set the DACCLK register */
+	dacclk = (NVReadRAMDAC(dev, 0, dacclk_off) & ~0x30) | 0x1;
+
+	if (nv_arch(dev) == NV_40)
+		dacclk |= 1 << 20;
+
+	if (tv_norm->kind == CTV_ENC_MODE) {
+		dacclk |=  0x20;
+
+		if (head)
+			dacclk |= 0x100;
+		else
+			dacclk &= ~0x100;
+
+	} else {
+		dacclk |= 0x10;
+
+	}
+
+	NVWriteRAMDAC(dev, 0, dacclk_off, dacclk);
+}
+
+static void nv17_tv_mode_set(struct drm_encoder *encoder,
+			     struct drm_display_mode *drm_mode,
+			     struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int head = nouveau_crtc(encoder->crtc)->index;
+	struct nv04_crtc_reg *regs = &dev_priv->mode_reg.crtc_reg[head];
+	struct nv17_tv_state *tv_regs = &to_tv_enc(encoder)->state;
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+	int i;
+
+	regs->CRTC[NV_CIO_CRE_53] = 0x40; /* FP_HTIMING */
+	regs->CRTC[NV_CIO_CRE_54] = 0; /* FP_VTIMING */
+	regs->ramdac_630 = 0x2; /* turn off green mode (tv test pattern?) */
+	regs->tv_setup = 1;
+	regs->ramdac_8c0 = 0x0;
+
+	if (tv_norm->kind == TV_ENC_MODE) {
+		tv_regs->ptv_200 = 0x13111100;
+		if (head)
+			tv_regs->ptv_200 |= 0x10;
+
+		tv_regs->ptv_20c = 0x808010;
+		tv_regs->ptv_304 = 0x2d00000;
+		tv_regs->ptv_600 = 0x0;
+		tv_regs->ptv_60c = 0x0;
+		tv_regs->ptv_610 = 0x1e00000;
+
+		if (tv_norm->tv_enc_mode.vdisplay == 576) {
+			tv_regs->ptv_508 = 0x1200000;
+			tv_regs->ptv_614 = 0x33;
+
+		} else if (tv_norm->tv_enc_mode.vdisplay == 480) {
+			tv_regs->ptv_508 = 0xf00000;
+			tv_regs->ptv_614 = 0x13;
+		}
+
+		if (nv_arch(dev) >= NV_30) {
+			tv_regs->ptv_500 = 0xe8e0;
+			tv_regs->ptv_504 = 0x1710;
+			tv_regs->ptv_604 = 0x0;
+			tv_regs->ptv_608 = 0x0;
+		} else {
+			if (tv_norm->tv_enc_mode.vdisplay == 576) {
+				tv_regs->ptv_604 = 0x20;
+				tv_regs->ptv_608 = 0x10;
+				tv_regs->ptv_500 = 0x19710;
+				tv_regs->ptv_504 = 0x68f0;
+
+			} else if (tv_norm->tv_enc_mode.vdisplay == 480) {
+				tv_regs->ptv_604 = 0x10;
+				tv_regs->ptv_608 = 0x20;
+				tv_regs->ptv_500 = 0x4b90;
+				tv_regs->ptv_504 = 0x1b480;
+			}
+		}
+
+		for (i = 0; i < 0x40; i++)
+			tv_regs->tv_enc[i] = tv_norm->tv_enc_mode.tv_enc[i];
+
+	} else {
+		struct drm_display_mode *output_mode = &tv_norm->ctv_enc_mode.mode;
+
+		/* The registers in PRAMDAC+0xc00 control some timings and CSC
+		 * parameters for the CTV encoder (It's only used for "HD" TV
+		 * modes, I don't think I have enough working to guess what
+		 * they exactly mean...), it's probably connected at the
+		 * output of the FP encoder, but it also needs the analog
+		 * encoder in its OR enabled and routed to the head it's
+		 * using. It's enabled with the DACCLK register, bits [5:4].
+		 */
+		for (i = 0; i < 38; i++)
+			regs->ctv_regs[i] = tv_norm->ctv_enc_mode.ctv_regs[i];
+
+		regs->fp_horiz_regs[FP_DISPLAY_END] = output_mode->hdisplay - 1;
+		regs->fp_horiz_regs[FP_TOTAL] = output_mode->htotal - 1;
+		regs->fp_horiz_regs[FP_SYNC_START] = output_mode->hsync_start - 1;
+		regs->fp_horiz_regs[FP_SYNC_END] = output_mode->hsync_end - 1;
+		regs->fp_horiz_regs[FP_CRTC] = output_mode->hdisplay +
+			max((output_mode->hdisplay-600)/40 - 1, 1);
+
+		regs->fp_vert_regs[FP_DISPLAY_END] = output_mode->vdisplay - 1;
+		regs->fp_vert_regs[FP_TOTAL] = output_mode->vtotal - 1;
+		regs->fp_vert_regs[FP_SYNC_START] = output_mode->vsync_start - 1;
+		regs->fp_vert_regs[FP_SYNC_END] = output_mode->vsync_end - 1;
+		regs->fp_vert_regs[FP_CRTC] = output_mode->vdisplay - 1;
+
+		regs->fp_control = NV_PRAMDAC_FP_TG_CONTROL_DISPEN_POS |
+			NV_PRAMDAC_FP_TG_CONTROL_READ_PROG |
+			NV_PRAMDAC_FP_TG_CONTROL_WIDTH_12;
+
+		if (output_mode->flags & DRM_MODE_FLAG_PVSYNC)
+			regs->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_VSYNC_POS;
+		if (output_mode->flags & DRM_MODE_FLAG_PHSYNC)
+			regs->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_HSYNC_POS;
+
+		regs->fp_debug_0 = NV_PRAMDAC_FP_DEBUG_0_YWEIGHT_ROUND |
+			NV_PRAMDAC_FP_DEBUG_0_XWEIGHT_ROUND |
+			NV_PRAMDAC_FP_DEBUG_0_YINTERP_BILINEAR |
+			NV_PRAMDAC_FP_DEBUG_0_XINTERP_BILINEAR |
+			NV_RAMDAC_FP_DEBUG_0_TMDS_ENABLED |
+			NV_PRAMDAC_FP_DEBUG_0_YSCALE_ENABLE |
+			NV_PRAMDAC_FP_DEBUG_0_XSCALE_ENABLE;
+
+		regs->fp_debug_2 = 0;
+
+		regs->fp_margin_color = 0x801080;
+
+	}
+}
+
+static void nv17_tv_commit(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+
+	if (get_tv_norm(encoder)->kind == TV_ENC_MODE) {
+		nv17_tv_update_rescaler(encoder);
+		nv17_tv_update_properties(encoder);
+	} else {
+		nv17_ctv_update_rescaler(encoder);
+	}
+
+	nv17_tv_state_load(dev, &to_tv_enc(encoder)->state);
+
+	/* This could use refinement for flatpanels, but it should work this way */
+	if (dev_priv->chipset < 0x44)
+		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0xf0000000);
+	else
+		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0x00100000);
+
+	helper->dpms(encoder, DRM_MODE_DPMS_ON);
+
+	NV_INFO(dev, "Output %s is running on CRTC %d using output %c\n",
+		drm_get_connector_name(&nouveau_encoder_connector_get(nv_encoder)->base),
+		nv_crtc->index, '@' + ffs(nv_encoder->dcb->or));
+}
+
+static void nv17_tv_save(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+
+	nouveau_encoder(encoder)->restore.output =
+		NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder));
+
+	nv17_tv_state_save(dev, &tv_enc->saved_state);
+
+	tv_enc->state.ptv_200 = tv_enc->saved_state.ptv_200;
+}
+
+static void nv17_tv_restore(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder),
+		      nouveau_encoder(encoder)->restore.output);
+
+	nv17_tv_state_load(dev, &to_tv_enc(encoder)->saved_state);
+}
+
+static int nv17_tv_create_resources(struct drm_encoder *encoder,
+				    struct drm_connector *connector)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_mode_config *conf = &dev->mode_config;
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+	struct dcb_entry *dcb = nouveau_encoder(encoder)->dcb;
+
+	drm_mode_create_tv_properties(dev,
+				      dcb->tvconf.has_component_output? NUM_TV_NORMS
+				      : NUM_LD_TV_NORMS, nv17_tv_norm_names);
+
+	drm_connector_attach_property(connector, conf->tv_select_subconnector_property,
+				      tv_enc->select_subconnector);
+	drm_connector_attach_property(connector, conf->tv_subconnector_property,
+				      tv_enc->subconnector);
+	drm_connector_attach_property(connector, conf->tv_mode_property,
+				      tv_enc->tv_norm);
+	drm_connector_attach_property(connector, conf->tv_flicker_reduction_property,
+				      tv_enc->flicker);
+	drm_connector_attach_property(connector, conf->tv_saturation_property,
+				      tv_enc->saturation);
+	drm_connector_attach_property(connector, conf->tv_hue_property,
+				      tv_enc->hue);
+	drm_connector_attach_property(connector, conf->tv_overscan_property,
+				      tv_enc->overscan);
+
+	return 0;
+}
+
+static int nv17_tv_set_property(struct drm_encoder *encoder,
+				struct drm_connector *connector,
+				struct drm_property *property,
+				uint64_t val)
+{
+	struct drm_mode_config *conf = &encoder->dev->mode_config;
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+
+	if (property == conf->tv_overscan_property) {
+		tv_enc->overscan = val;
+		if (encoder->crtc) {
+			if (tv_norm->kind == CTV_ENC_MODE)
+				nv17_ctv_update_rescaler(encoder);
+			else
+				nv17_tv_update_rescaler(encoder);
+		}
+
+	} else if (property == conf->tv_saturation_property) {
+		if (tv_norm->kind != TV_ENC_MODE)
+			return -EINVAL;
+
+		tv_enc->saturation = val;
+		nv17_tv_update_properties(encoder);
+
+	} else if (property == conf->tv_hue_property) {
+		if (tv_norm->kind != TV_ENC_MODE)
+			return -EINVAL;
+
+		tv_enc->hue = val;
+		nv17_tv_update_properties(encoder);
+
+	} else if (property == conf->tv_flicker_reduction_property) {
+		if (tv_norm->kind != TV_ENC_MODE)
+			return -EINVAL;
+
+		tv_enc->flicker = val;
+		if (encoder->crtc)
+			nv17_tv_update_rescaler(encoder);
+
+	} else if (property == conf->tv_mode_property) {
+		tv_enc->tv_norm = val;
+		drm_helper_probe_single_connector_modes(connector, 0, 0);
+
+	} else if (property == conf->tv_select_subconnector_property) {
+		if (tv_norm->kind != TV_ENC_MODE)
+			return -EINVAL;
+
+		tv_enc->select_subconnector = val;
+		nv17_tv_update_properties(encoder);
+
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void nv17_tv_destroy(struct drm_encoder *encoder)
+{
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+
+	NV_DEBUG(encoder->dev, "\n");
+
+	drm_encoder_cleanup(encoder);
+	kfree(tv_enc);
+}
+
+static struct drm_encoder_helper_funcs nv17_tv_helper_funcs = {
+	.dpms = nv17_tv_dpms,
+	.save = nv17_tv_save,
+	.restore = nv17_tv_restore,
+	.mode_fixup = nv17_tv_mode_fixup,
+	.prepare = nv17_tv_prepare,
+	.commit = nv17_tv_commit,
+	.mode_set = nv17_tv_mode_set,
+	.detect = nv17_dac_detect,
+};
+
+static struct drm_encoder_slave_funcs nv17_tv_slave_funcs = {
+	.get_modes = nv17_tv_get_modes,
+	.mode_valid = nv17_tv_mode_valid,
+	.create_resources = nv17_tv_create_resources,
+	.set_property = nv17_tv_set_property,
+};
+
+static struct drm_encoder_funcs nv17_tv_funcs = {
+	.destroy = nv17_tv_destroy,
+};
+
+int nv17_tv_create(struct drm_device *dev, struct dcb_entry *entry)
+{
+	struct drm_encoder *encoder;
+	struct nv17_tv_encoder *tv_enc = NULL;
+
+	tv_enc = kzalloc(sizeof(*tv_enc), GFP_KERNEL);
+	if (!tv_enc)
+		return -ENOMEM;
+
+	tv_enc->overscan = 50;
+	tv_enc->flicker = 50;
+	tv_enc->saturation = 50;
+	tv_enc->hue = 0;
+	tv_enc->tv_norm = TV_NORM_PAL;
+	tv_enc->subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
+	tv_enc->select_subconnector = DRM_MODE_SUBCONNECTOR_Automatic;
+	tv_enc->pin_mask = 0;
+
+	encoder = to_drm_encoder(&tv_enc->base);
+
+	tv_enc->base.dcb = entry;
+	tv_enc->base.or = ffs(entry->or) - 1;
+
+	drm_encoder_init(dev, encoder, &nv17_tv_funcs, DRM_MODE_ENCODER_TVDAC);
+	drm_encoder_helper_add(encoder, &nv17_tv_helper_funcs);
+	to_encoder_slave(encoder)->slave_funcs = &nv17_tv_slave_funcs;
+
+	encoder->possible_crtcs = entry->heads;
+	encoder->possible_clones = 0;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nv17_tv.h b/drivers/gpu/drm/nouveau/nv17_tv.h
new file mode 100644
index 0000000..c00977c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv17_tv.h
@@ -0,0 +1,156 @@
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
+#ifndef __NV17_TV_H__
+#define __NV17_TV_H__
+
+struct nv17_tv_state {
+	uint8_t tv_enc[0x40];
+
+	uint32_t hfilter[4][7];
+	uint32_t hfilter2[4][7];
+	uint32_t vfilter[4][7];
+
+	uint32_t ptv_200;
+	uint32_t ptv_204;
+	uint32_t ptv_208;
+	uint32_t ptv_20c;
+	uint32_t ptv_304;
+	uint32_t ptv_500;
+	uint32_t ptv_504;
+	uint32_t ptv_508;
+	uint32_t ptv_600;
+	uint32_t ptv_604;
+	uint32_t ptv_608;
+	uint32_t ptv_60c;
+	uint32_t ptv_610;
+	uint32_t ptv_614;
+};
+
+enum nv17_tv_norm{
+	TV_NORM_PAL,
+	TV_NORM_PAL_M,
+	TV_NORM_PAL_N,
+	TV_NORM_PAL_NC,
+	TV_NORM_NTSC_M,
+	TV_NORM_NTSC_J,
+	NUM_LD_TV_NORMS,
+	TV_NORM_HD480I = NUM_LD_TV_NORMS,
+	TV_NORM_HD480P,
+	TV_NORM_HD576I,
+	TV_NORM_HD576P,
+	TV_NORM_HD720P,
+	TV_NORM_HD1080I,
+	NUM_TV_NORMS
+};
+
+struct nv17_tv_encoder {
+	struct nouveau_encoder base;
+
+	struct nv17_tv_state state;
+	struct nv17_tv_state saved_state;
+
+	int overscan;
+	int flicker;
+	int saturation;
+	int hue;
+	enum nv17_tv_norm tv_norm;
+	int subconnector;
+	int select_subconnector;
+	uint32_t pin_mask;
+};
+#define to_tv_enc(x) container_of(nouveau_encoder(x),		\
+				  struct nv17_tv_encoder, base)
+
+extern char *nv17_tv_norm_names[NUM_TV_NORMS];
+
+extern struct nv17_tv_norm_params {
+	enum {
+		TV_ENC_MODE,
+		CTV_ENC_MODE,
+	} kind;
+
+	union {
+		struct {
+			int hdisplay;
+			int vdisplay;
+			int vrefresh; /* mHz */
+
+			uint8_t tv_enc[0x40];
+		} tv_enc_mode;
+
+		struct {
+			struct drm_display_mode mode;
+
+			uint32_t ctv_regs[38];
+		} ctv_enc_mode;
+	};
+
+} nv17_tv_norms[NUM_TV_NORMS];
+#define get_tv_norm(enc) (&nv17_tv_norms[to_tv_enc(enc)->tv_norm])
+
+extern struct drm_display_mode nv17_tv_modes[];
+
+static inline int interpolate(int y0, int y1, int y2, int x)
+{
+	return y1 + (x < 50 ? y1 - y0 : y2 - y1) * (x - 50) / 50;
+}
+
+void nv17_tv_state_save(struct drm_device *dev, struct nv17_tv_state *state);
+void nv17_tv_state_load(struct drm_device *dev, struct nv17_tv_state *state);
+void nv17_tv_update_properties(struct drm_encoder *encoder);
+void nv17_tv_update_rescaler(struct drm_encoder *encoder);
+void nv17_ctv_update_rescaler(struct drm_encoder *encoder);
+
+/* TV hardware access functions */
+
+static inline void nv_write_ptv(struct drm_device *dev, uint32_t reg, uint32_t val)
+{
+	nv_wr32(dev, reg, val);
+}
+
+static inline uint32_t nv_read_ptv(struct drm_device *dev, uint32_t reg)
+{
+	return nv_rd32(dev, reg);
+}
+
+static inline void nv_write_tv_enc(struct drm_device *dev, uint8_t reg, uint8_t val)
+{
+	nv_write_ptv(dev, NV_PTV_TV_INDEX, reg);
+	nv_write_ptv(dev, NV_PTV_TV_DATA, val);
+}
+
+static inline uint8_t nv_read_tv_enc(struct drm_device *dev, uint8_t reg)
+{
+	nv_write_ptv(dev, NV_PTV_TV_INDEX, reg);
+	return nv_read_ptv(dev, NV_PTV_TV_DATA);
+}
+
+#define nv_load_ptv(dev, state, reg) nv_write_ptv(dev, NV_PTV_OFFSET + 0x##reg, state->ptv_##reg)
+#define nv_save_ptv(dev, state, reg) state->ptv_##reg = nv_read_ptv(dev, NV_PTV_OFFSET + 0x##reg)
+#define nv_load_tv_enc(dev, state, reg) nv_write_tv_enc(dev, 0x##reg, state->tv_enc[0x##reg])
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nv17_tv_modes.c b/drivers/gpu/drm/nouveau/nv17_tv_modes.c
new file mode 100644
index 0000000..17adb8d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv17_tv_modes.c
@@ -0,0 +1,583 @@
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
+#include "drm_crtc_helper.h"
+#include "nouveau_drv.h"
+#include "nouveau_encoder.h"
+#include "nouveau_crtc.h"
+#include "nouveau_hw.h"
+#include "nv17_tv.h"
+
+char *nv17_tv_norm_names[NUM_TV_NORMS] = {
+	[TV_NORM_PAL] = "PAL",
+	[TV_NORM_PAL_M] = "PAL-M",
+	[TV_NORM_PAL_N] = "PAL-N",
+	[TV_NORM_PAL_NC] = "PAL-Nc",
+	[TV_NORM_NTSC_M] = "NTSC-M",
+	[TV_NORM_NTSC_J] = "NTSC-J",
+	[TV_NORM_HD480I] = "hd480i",
+	[TV_NORM_HD480P] = "hd480p",
+	[TV_NORM_HD576I] = "hd576i",
+	[TV_NORM_HD576P] = "hd576p",
+	[TV_NORM_HD720P] = "hd720p",
+	[TV_NORM_HD1080I] = "hd1080i"
+};
+
+/* TV standard specific parameters */
+
+struct nv17_tv_norm_params nv17_tv_norms[NUM_TV_NORMS] = {
+	[TV_NORM_PAL] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 576, 50000, {
+					0x2a, 0x9, 0x8a, 0xcb, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x40, 0x8a, 0x35, 0x27, 0x0, 0x34, 0x3,
+					0x3e, 0x3, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x9c,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x3,
+					0xd3, 0x4, 0xd4, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x1a, 0xff, 0x3, 0x18, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x49, 0x10, 0x0, 0x9b,
+					0xbd, 0x15, 0x5, 0x15, 0x3e, 0x3, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_PAL_M] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 480, 59940, {
+					0x21, 0xe6, 0xef, 0xe3, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x44, 0x76, 0x32, 0x25, 0x0, 0x3c, 0x0,
+					0x3c, 0x0, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x83,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x1,
+					0xc5, 0x4, 0xc5, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x18, 0xff, 0x3, 0x20, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x40, 0x10, 0x0, 0x9c,
+					0xc8, 0x15, 0x5, 0x15, 0x3c, 0x0, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_PAL_N] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 576, 50000, {
+					0x2a, 0x9, 0x8a, 0xcb, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x40, 0x8a, 0x32, 0x25, 0x0, 0x3c, 0x0,
+					0x3c, 0x0, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x9c,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x1,
+					0xc5, 0x4, 0xc5, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x1a, 0xff, 0x3, 0x18, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x49, 0x10, 0x0, 0x9b,
+					0xbd, 0x15, 0x5, 0x15, 0x3c, 0x0, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_PAL_NC] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 576, 50000, {
+					0x21, 0xf6, 0x94, 0x46, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x44, 0x8a, 0x35, 0x27, 0x0, 0x34, 0x3,
+					0x3e, 0x3, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x9c,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x3,
+					0xd3, 0x4, 0xd4, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x1a, 0xff, 0x3, 0x18, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x49, 0x10, 0x0, 0x9b,
+					0xbd, 0x15, 0x5, 0x15, 0x3e, 0x3, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_NTSC_M] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 480, 59940, {
+					0x21, 0xf0, 0x7c, 0x1f, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x44, 0x76, 0x48, 0x0, 0x0, 0x3c, 0x0,
+					0x3c, 0x0, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x83,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x1,
+					0xc5, 0x4, 0xc5, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x16, 0xff, 0x3, 0x20, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x4, 0x10, 0x0, 0x9c,
+					0xc8, 0x15, 0x5, 0x15, 0x3c, 0x0, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_NTSC_J] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 480, 59940, {
+					0x21, 0xf0, 0x7c, 0x1f, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x44, 0x76, 0x48, 0x0, 0x0, 0x32, 0x0,
+					0x3c, 0x0, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x83,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x1,
+					0xcf, 0x4, 0xcf, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x16, 0xff, 0x3, 0x20, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x4, 0x10, 0x0, 0xa4,
+					0xc8, 0x15, 0x5, 0x15, 0x3c, 0x0, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_HD480I] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 480, 59940, {
+					0x21, 0xf0, 0x7c, 0x1f, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x44, 0x76, 0x48, 0x0, 0x0, 0x32, 0x0,
+					0x3c, 0x0, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x83,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x1,
+					0xcf, 0x4, 0xcf, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x16, 0xff, 0x3, 0x20, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x4, 0x10, 0x0, 0xa4,
+					0xc8, 0x15, 0x5, 0x15, 0x3c, 0x0, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_HD576I] = { TV_ENC_MODE, {
+			.tv_enc_mode = {720, 576, 50000, {
+					0x2a, 0x9, 0x8a, 0xcb, 0x0, 0x0, 0xb, 0x18,
+					0x7e, 0x40, 0x8a, 0x35, 0x27, 0x0, 0x34, 0x3,
+					0x3e, 0x3, 0x17, 0x21, 0x1b, 0x1b, 0x24, 0x9c,
+					0x1, 0x0, 0xf, 0xf, 0x60, 0x5, 0xd3, 0x3,
+					0xd3, 0x4, 0xd4, 0x1, 0x2, 0x0, 0xa, 0x5,
+					0x0, 0x1a, 0xff, 0x3, 0x18, 0xf, 0x78, 0x0,
+					0x0, 0xb4, 0x0, 0x15, 0x49, 0x10, 0x0, 0x9b,
+					0xbd, 0x15, 0x5, 0x15, 0x3e, 0x3, 0x0, 0x0
+				}}}},
+
+
+	[TV_NORM_HD480P] = { CTV_ENC_MODE, {
+			.ctv_enc_mode = {
+				.mode = { DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 25312,
+						   720, 735, 743, 858, 0, 480, 490, 494, 525, 0,
+						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
+				.ctv_regs = { 0x3540000, 0x0, 0x0, 0x314,
+					      0x354003a, 0x40000, 0x6f0344, 0x18100000,
+					      0x10160004, 0x10060005, 0x1006000c, 0x10060020,
+					      0x10060021, 0x140e0022, 0x10060202, 0x1802020a,
+					      0x1810020b, 0x10000fff, 0x10000fff, 0x10000fff,
+					      0x10000fff, 0x10000fff, 0x10000fff, 0x70,
+					      0x3ff0000, 0x57, 0x2e001e, 0x258012c,
+					      0xa0aa04ec, 0x30, 0x80960019, 0x12c0300,
+					      0x2019, 0x600, 0x32060019, 0x0, 0x0, 0x400
+				}}}},
+
+	[TV_NORM_HD576P] = { CTV_ENC_MODE, {
+			.ctv_enc_mode = {
+				.mode = { DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 25312,
+						   720, 730, 738, 864, 0, 576, 581, 585, 625, 0,
+						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
+				.ctv_regs = { 0x3540000, 0x0, 0x0, 0x314,
+					      0x354003a, 0x40000, 0x6f0344, 0x18100000,
+					      0x10060001, 0x10060009, 0x10060026, 0x10060027,
+					      0x140e0028, 0x10060268, 0x1810026d, 0x10000fff,
+					      0x10000fff, 0x10000fff, 0x10000fff, 0x10000fff,
+					      0x10000fff, 0x10000fff, 0x10000fff, 0x69,
+					      0x3ff0000, 0x57, 0x2e001e, 0x258012c,
+					      0xa0aa04ec, 0x30, 0x80960019, 0x12c0300,
+					      0x2019, 0x600, 0x32060019, 0x0, 0x0, 0x400
+				}}}},
+
+	[TV_NORM_HD720P] = { CTV_ENC_MODE, {
+			.ctv_enc_mode = {
+				.mode = { DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 70875,
+						   1280, 1349, 1357, 1650, 0, 720, 725, 730, 750, 0,
+						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
+				.ctv_regs = { 0x1260394, 0x0, 0x0, 0x622,
+					      0x66b0021, 0x6004a, 0x1210626, 0x8170000,
+					      0x70004, 0x70016, 0x70017, 0x40f0018,
+					      0x702e8, 0x81702ed, 0xfff, 0xfff,
+					      0xfff, 0xfff, 0xfff, 0xfff,
+					      0xfff, 0xfff, 0xfff, 0x0,
+					      0x2e40001, 0x58, 0x2e001e, 0x258012c,
+					      0xa0aa04ec, 0x30, 0x810c0039, 0x12c0300,
+					      0xc0002039, 0x600, 0x32060039, 0x0, 0x0, 0x0
+				}}}},
+
+	[TV_NORM_HD1080I] = { CTV_ENC_MODE, {
+			.ctv_enc_mode = {
+				.mode = { DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 70875,
+						   1920, 1961, 2049, 2200, 0, 1080, 1084, 1088, 1125, 0,
+						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC
+						   | DRM_MODE_FLAG_INTERLACE) },
+				.ctv_regs = { 0xac0420, 0x44c0478, 0x4a4, 0x4fc0868,
+					      0x8940028, 0x60054, 0xe80870, 0xbf70000,
+					      0xbc70004, 0x70005, 0x70012, 0x70013,
+					      0x40f0014, 0x70230, 0xbf70232, 0xbf70233,
+					      0x1c70237, 0x70238, 0x70244, 0x70245,
+					      0x40f0246, 0x70462, 0x1f70464, 0x0,
+					      0x2e40001, 0x58, 0x2e001e, 0x258012c,
+					      0xa0aa04ec, 0x30, 0x815f004c, 0x12c0300,
+					      0xc000204c, 0x600, 0x3206004c, 0x0, 0x0, 0x0
+				}}}}
+};
+
+/*
+ * The following is some guesswork on how the TV encoder flicker
+ * filter/rescaler works:
+ *
+ * It seems to use some sort of resampling filter, it is controlled
+ * through the registers at NV_PTV_HFILTER and NV_PTV_VFILTER, they
+ * control the horizontal and vertical stage respectively, there is
+ * also NV_PTV_HFILTER2 the blob fills identically to NV_PTV_HFILTER,
+ * but they seem to do nothing. A rough guess might be that they could
+ * be used to independently control the filtering of each interlaced
+ * field, but I don't know how they are enabled. The whole filtering
+ * process seems to be disabled with bits 26:27 of PTV_200, but we
+ * aren't doing that.
+ *
+ * The layout of both register sets is the same:
+ *
+ * A: [BASE+0x18]...[BASE+0x0] [BASE+0x58]..[BASE+0x40]
+ * B: [BASE+0x34]...[BASE+0x1c] [BASE+0x74]..[BASE+0x5c]
+ *
+ * Each coefficient is stored in bits [31],[15:9] in two's complement
+ * format. They seem to be some kind of weights used in a low-pass
+ * filter. Both A and B coefficients are applied to the 14 nearest
+ * samples on each side (Listed from nearest to furthermost.  They
+ * roughly cover 2 framebuffer pixels on each side).  They are
+ * probably multiplied with some more hardwired weights before being
+ * used: B-coefficients are applied the same on both sides,
+ * A-coefficients are inverted before being applied to the opposite
+ * side.
+ *
+ * After all the hassle, I got the following formula by empirical
+ * means...
+ */
+
+#define calc_overscan(o) interpolate(0x100, 0xe1, 0xc1, o)
+
+#define id1 (1LL << 8)
+#define id2 (1LL << 16)
+#define id3 (1LL << 24)
+#define id4 (1LL << 32)
+#define id5 (1LL << 48)
+
+static struct filter_params{
+	int64_t k1;
+	int64_t ki;
+	int64_t ki2;
+	int64_t ki3;
+	int64_t kr;
+	int64_t kir;
+	int64_t ki2r;
+	int64_t ki3r;
+	int64_t kf;
+	int64_t kif;
+	int64_t ki2f;
+	int64_t ki3f;
+	int64_t krf;
+	int64_t kirf;
+	int64_t ki2rf;
+	int64_t ki3rf;
+} fparams[2][4] = {
+	/* Horizontal filter parameters */
+	{
+		{64.311690 * id5, -39.516924 * id5, 6.586143 * id5, 0.000002 * id5,
+		 0.051285 * id4, 26.168746 * id4, -4.361449 * id4, -0.000001 * id4,
+		 9.308169 * id3, 78.180965 * id3, -13.030158 * id3, -0.000001 * id3,
+		 -8.801540 * id1, -46.572890 * id1, 7.762145 * id1, -0.000000 * id1},
+		{-44.565569 * id5, -68.081246 * id5, 39.812074 * id5, -4.009316 * id5,
+		 29.832207 * id4, 50.047322 * id4, -25.380017 * id4, 2.546422 * id4,
+		 104.605622 * id3, 141.908641 * id3, -74.322319 * id3, 7.484316 * id3,
+		 -37.081621 * id1, -90.397510 * id1, 42.784229 * id1, -4.289952 * id1},
+		{-56.793244 * id5, 31.153584 * id5, -5.192247 * id5, -0.000003 * id5,
+		 33.541131 * id4, -34.149302 * id4, 5.691537 * id4, 0.000002 * id4,
+		 87.196610 * id3, -88.995169 * id3, 14.832456 * id3, 0.000012 * id3,
+		 17.288138 * id1, 71.864786 * id1, -11.977408 * id1, -0.000009 * id1},
+		{51.787796 * id5, 21.211771 * id5, -18.993730 * id5, 1.853310 * id5,
+		 -41.470726 * id4, -17.775823 * id4, 13.057821 * id4, -1.15823 * id4,
+		 -154.235673 * id3, -44.878641 * id3, 40.656077 * id3, -3.695595 * id3,
+		 112.201065 * id1, 39.992155 * id1, -25.155714 * id1, 2.113984 * id1},
+	},
+
+	/* Vertical filter parameters */
+	{
+		{67.601979 * id5, 0.428319 * id5, -0.071318 * id5, -0.000012 * id5,
+		 -3.402339 * id4, 0.000209 * id4, -0.000092 * id4, 0.000010 * id4,
+		 -9.180996 * id3, 6.111270 * id3, -1.024457 * id3, 0.001043 * id3,
+		 6.060315 * id1, -0.017425 * id1, 0.007830 * id1, -0.000869 * id1},
+		{6.755647 * id5, 5.841348 * id5, 1.469734 * id5, -0.149656 * id5,
+		 8.293120 * id4, -1.192888 * id4, -0.947652 * id4, 0.094507 * id4,
+		 37.526655 * id3, 10.257875 * id3, -10.823275 * id3, 1.081497 * id3,
+		 -2.361928 * id1, -2.059432 * id1, 1.840671 * id1, -0.168100 * id1},
+		{-14.780391 * id5, -16.042148 * id5, 2.673692 * id5, -0.000000 * id5,
+		 39.541978 * id4, 5.680053 * id4, -0.946676 * id4, 0.000000 * id4,
+		 152.994486 * id3, 12.625439 * id3, -2.119579 * id3, 0.002708 * id3,
+		 -38.125089 * id1, -0.855880 * id1, 0.155359 * id1, -0.002245 * id1},
+		{-27.476193 * id5, -1.454976 * id5, 1.286557 * id5, 0.025346 * id5,
+		 20.687300 * id4, 3.014003 * id4, -0.557786 * id4, -0.01311 * id4,
+		 60.008737 * id3, -0.738273 * id3, 5.408217 * id3, -0.796798 * id3,
+		 -17.296835 * id1, 4.438577 * id1, -2.809420 * id1, 0.385491 * id1},
+	}
+};
+
+static void tv_setup_filter(struct drm_encoder *encoder)
+{
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+	struct drm_display_mode *mode = &encoder->crtc->mode;
+	uint32_t (*filters[])[4][7] = {&tv_enc->state.hfilter,
+				       &tv_enc->state.vfilter};
+	int i, j, k;
+	int32_t overscan = calc_overscan(tv_enc->overscan);
+	int64_t flicker = (tv_enc->flicker - 50) * id3;
+	int64_t rs[] = {mode->hdisplay * id3,
+			mode->vdisplay * id3};
+
+	do_div(flicker, 100);
+	do_div(rs[0], overscan * tv_norm->tv_enc_mode.hdisplay);
+	do_div(rs[1], overscan * tv_norm->tv_enc_mode.vdisplay);
+
+	for (k = 0; k < 2; k++) {
+		rs[k] = max(rs[k], id2);
+
+		for (j = 0; j < 4; j++) {
+			struct filter_params *p = &fparams[k][j];
+
+			for (i = 0; i < 7; i++) {
+				int64_t c = (p->k1 + p->ki*i + p->ki2*i*i + p->ki3*i*i*i)
+					+ (p->kr + p->kir*i + p->ki2r*i*i + p->ki3r*i*i*i)*rs[k]
+					+ (p->kf + p->kif*i + p->ki2f*i*i + p->ki3f*i*i*i)*flicker
+					+ (p->krf + p->kirf*i + p->ki2rf*i*i + p->ki3rf*i*i*i)*flicker*rs[k];
+
+				(*filters[k])[j][i] = (c + id5/2) >> 39 & (0x1 << 31 | 0x7f << 9);
+			}
+		}
+	}
+}
+
+/* Hardware state saving/restoring */
+
+static void tv_save_filter(struct drm_device *dev, uint32_t base, uint32_t regs[4][7])
+{
+	int i, j;
+	uint32_t offsets[] = { base, base + 0x1c, base + 0x40, base + 0x5c };
+
+	for (i = 0; i < 4; i++) {
+		for (j = 0; j < 7; j++)
+			regs[i][j] = nv_read_ptv(dev, offsets[i]+4*j);
+	}
+}
+
+static void tv_load_filter(struct drm_device *dev, uint32_t base, uint32_t regs[4][7])
+{
+	int i, j;
+	uint32_t offsets[] = { base, base + 0x1c, base + 0x40, base + 0x5c };
+
+	for (i = 0; i < 4; i++) {
+		for (j = 0; j < 7; j++)
+			nv_write_ptv(dev, offsets[i]+4*j, regs[i][j]);
+	}
+}
+
+void nv17_tv_state_save(struct drm_device *dev, struct nv17_tv_state *state)
+{
+	int i;
+
+	for (i = 0; i < 0x40; i++)
+		state->tv_enc[i] = nv_read_tv_enc(dev, i);
+
+	tv_save_filter(dev, NV_PTV_HFILTER, state->hfilter);
+	tv_save_filter(dev, NV_PTV_HFILTER2, state->hfilter2);
+	tv_save_filter(dev, NV_PTV_VFILTER, state->vfilter);
+
+	nv_save_ptv(dev, state, 200);
+	nv_save_ptv(dev, state, 204);
+	nv_save_ptv(dev, state, 208);
+	nv_save_ptv(dev, state, 20c);
+	nv_save_ptv(dev, state, 304);
+	nv_save_ptv(dev, state, 500);
+	nv_save_ptv(dev, state, 504);
+	nv_save_ptv(dev, state, 508);
+	nv_save_ptv(dev, state, 600);
+	nv_save_ptv(dev, state, 604);
+	nv_save_ptv(dev, state, 608);
+	nv_save_ptv(dev, state, 60c);
+	nv_save_ptv(dev, state, 610);
+	nv_save_ptv(dev, state, 614);
+}
+
+void nv17_tv_state_load(struct drm_device *dev, struct nv17_tv_state *state)
+{
+	int i;
+
+	for (i = 0; i < 0x40; i++)
+		nv_write_tv_enc(dev, i, state->tv_enc[i]);
+
+	tv_load_filter(dev, NV_PTV_HFILTER, state->hfilter);
+	tv_load_filter(dev, NV_PTV_HFILTER2, state->hfilter2);
+	tv_load_filter(dev, NV_PTV_VFILTER, state->vfilter);
+
+	nv_load_ptv(dev, state, 200);
+	nv_load_ptv(dev, state, 204);
+	nv_load_ptv(dev, state, 208);
+	nv_load_ptv(dev, state, 20c);
+	nv_load_ptv(dev, state, 304);
+	nv_load_ptv(dev, state, 500);
+	nv_load_ptv(dev, state, 504);
+	nv_load_ptv(dev, state, 508);
+	nv_load_ptv(dev, state, 600);
+	nv_load_ptv(dev, state, 604);
+	nv_load_ptv(dev, state, 608);
+	nv_load_ptv(dev, state, 60c);
+	nv_load_ptv(dev, state, 610);
+	nv_load_ptv(dev, state, 614);
+
+	/* This is required for some settings to kick in. */
+	nv_write_tv_enc(dev, 0x3e, 1);
+	nv_write_tv_enc(dev, 0x3e, 0);
+}
+
+/* Timings similar to the ones the blob sets */
+
+struct drm_display_mode nv17_tv_modes[] = {
+	{ DRM_MODE("320x200", DRM_MODE_TYPE_DRIVER, 0,
+		   320, 344, 392, 560, 0, 200, 200, 202, 220, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC
+		   | DRM_MODE_FLAG_DBLSCAN | DRM_MODE_FLAG_CLKDIV2) },
+	{ DRM_MODE("320x240", DRM_MODE_TYPE_DRIVER, 0,
+		   320, 344, 392, 560, 0, 240, 240, 246, 263, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC
+		   | DRM_MODE_FLAG_DBLSCAN | DRM_MODE_FLAG_CLKDIV2) },
+	{ DRM_MODE("400x300", DRM_MODE_TYPE_DRIVER, 0,
+		   400, 432, 496, 640, 0, 300, 300, 303, 314, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC
+		   | DRM_MODE_FLAG_DBLSCAN | DRM_MODE_FLAG_CLKDIV2) },
+	{ DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 0,
+		   640, 672, 768, 880, 0, 480, 480, 492, 525, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
+	{ DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 0,
+		   720, 752, 872, 960, 0, 480, 480, 493, 525, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
+	{ DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 0,
+		   720, 776, 856, 960, 0, 576, 576, 588, 597, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
+	{ DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 0,
+		   800, 840, 920, 1040, 0, 600, 600, 604, 618, 0,
+		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
+	{ DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 0,
+		   1024, 1064, 1200, 1344, 0, 768, 768, 777, 806, 0,
+		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
+	{}
+};
+
+void nv17_tv_update_properties(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+	struct nv17_tv_state *regs = &tv_enc->state;
+	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+	int subconnector = tv_enc->select_subconnector? tv_enc->select_subconnector
+		: tv_enc->subconnector;
+
+	switch (subconnector) {
+	case DRM_MODE_SUBCONNECTOR_Composite:
+	{
+		regs->ptv_204 = 0x2;
+
+		/* The composite connector may be found on either pin. */
+		if (tv_enc->pin_mask & 0x4)
+			regs->ptv_204 |= 0x010000;
+		else if (tv_enc->pin_mask & 0x2)
+			regs->ptv_204 |= 0x100000;
+		else
+			regs->ptv_204 |= 0x110000;
+
+		regs->tv_enc[0x7] = 0x10;
+		break;
+	}
+	case DRM_MODE_SUBCONNECTOR_SVIDEO:
+		regs->ptv_204 = 0x11012;
+		regs->tv_enc[0x7] = 0x18;
+		break;
+
+	case DRM_MODE_SUBCONNECTOR_Component:
+		regs->ptv_204 = 0x111333;
+		regs->tv_enc[0x7] = 0x14;
+		break;
+
+	case DRM_MODE_SUBCONNECTOR_SCART:
+		regs->ptv_204 = 0x111012;
+		regs->tv_enc[0x7] = 0x18;
+		break;
+	}
+
+	regs->tv_enc[0x20] = interpolate(0, tv_norm->tv_enc_mode.tv_enc[0x20], 255,
+					 tv_enc->saturation);
+	regs->tv_enc[0x22] = interpolate(0, tv_norm->tv_enc_mode.tv_enc[0x22], 255,
+					 tv_enc->saturation);
+	regs->tv_enc[0x25] = tv_enc->hue * 255 / 100;
+
+	nv_load_ptv(dev, regs, 204);
+	nv_load_tv_enc(dev, regs, 7);
+	nv_load_tv_enc(dev, regs, 20);
+	nv_load_tv_enc(dev, regs, 22);
+	nv_load_tv_enc(dev, regs, 25);
+}
+
+void nv17_tv_update_rescaler(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+	struct nv17_tv_state *regs = &tv_enc->state;
+
+	regs->ptv_208 = 0x40 | (calc_overscan(tv_enc->overscan) << 8);
+
+	tv_setup_filter(encoder);
+
+	nv_load_ptv(dev, regs, 208);
+	tv_load_filter(dev, NV_PTV_HFILTER, regs->hfilter);
+	tv_load_filter(dev, NV_PTV_HFILTER2, regs->hfilter2);
+	tv_load_filter(dev, NV_PTV_VFILTER, regs->vfilter);
+}
+
+void nv17_ctv_update_rescaler(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
+	int head = nouveau_crtc(encoder->crtc)->index;
+	struct nv04_crtc_reg *regs = &dev_priv->mode_reg.crtc_reg[head];
+	struct drm_display_mode *crtc_mode = &encoder->crtc->mode;
+	struct drm_display_mode *output_mode = &get_tv_norm(encoder)->ctv_enc_mode.mode;
+	int overscan, hmargin, vmargin, hratio, vratio;
+
+	/* The rescaler doesn't do the right thing for interlaced modes. */
+	if (output_mode->flags & DRM_MODE_FLAG_INTERLACE)
+		overscan = 100;
+	else
+		overscan = tv_enc->overscan;
+
+	hmargin = (output_mode->hdisplay - crtc_mode->hdisplay) / 2;
+	vmargin = (output_mode->vdisplay - crtc_mode->vdisplay) / 2;
+
+	hmargin = interpolate(0, min(hmargin, output_mode->hdisplay/20), hmargin,
+			      overscan);
+	vmargin = interpolate(0, min(vmargin, output_mode->vdisplay/20), vmargin,
+			      overscan);
+
+	hratio = crtc_mode->hdisplay * 0x800 / (output_mode->hdisplay - 2*hmargin);
+	vratio = crtc_mode->vdisplay * 0x800 / (output_mode->vdisplay - 2*vmargin) & ~3;
+
+	regs->fp_horiz_regs[FP_VALID_START] = hmargin;
+	regs->fp_horiz_regs[FP_VALID_END] = output_mode->hdisplay - hmargin - 1;
+	regs->fp_vert_regs[FP_VALID_START] = vmargin;
+	regs->fp_vert_regs[FP_VALID_END] = output_mode->vdisplay - vmargin - 1;
+
+	regs->fp_debug_1 = NV_PRAMDAC_FP_DEBUG_1_YSCALE_TESTMODE_ENABLE |
+		XLATE(vratio, 0, NV_PRAMDAC_FP_DEBUG_1_YSCALE_VALUE) |
+		NV_PRAMDAC_FP_DEBUG_1_XSCALE_TESTMODE_ENABLE |
+		XLATE(hratio, 0, NV_PRAMDAC_FP_DEBUG_1_XSCALE_VALUE);
+
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_HVALID_START,
+		      regs->fp_horiz_regs[FP_VALID_START]);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_HVALID_END,
+		      regs->fp_horiz_regs[FP_VALID_END]);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_VVALID_START,
+		      regs->fp_vert_regs[FP_VALID_START]);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_VVALID_END,
+		      regs->fp_vert_regs[FP_VALID_END]);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_DEBUG_1, regs->fp_debug_1);
+}
-- 
1.6.3.3
