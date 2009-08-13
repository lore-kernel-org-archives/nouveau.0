From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 05/10] drm/nouveau: Restructure the nv04
	modesetting code.
Date: Thu, 13 Aug 2009 14:01:32 +0200
Message-ID: <1250164897-7871-5-git-send-email-currojerez@riseup.net>
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

* Delay the hardware state synchronization to crtc->commit(). This way
  the encoder-specific code can adjust the CRTC regs on mode_set()
  before they're written out.

* Don't abuse adjusted_mode to mean the output side mode, this makes
  impossible for the encoder code to fix up the actual CRTC mode.

* Split the digital from the analog stuff, as they have almost no
  common code and IMHO this will substantially improve consistency
  once the TVDAC implementation is imported.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile       |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c |   26 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  |   33 ++-
 drivers/gpu/drm/nouveau/nouveau_hw.c   |   10 +
 drivers/gpu/drm/nouveau/nv04_crtc.c    |  262 ++---------
 drivers/gpu/drm/nouveau/nv04_dac.c     |  497 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv04_dfp.c     |  611 ++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv04_display.c |   29 +-
 drivers/gpu/drm/nouveau/nv04_output.c  |  797 --------------------------------
 drivers/gpu/drm/nouveau/nvreg.h        |   14 +-
 10 files changed, 1235 insertions(+), 1048 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nv04_dac.c
 create mode 100644 drivers/gpu/drm/nouveau/nv04_dfp.c
 delete mode 100644 drivers/gpu/drm/nouveau/nv04_output.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 2ba1e45..4965e00 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -18,8 +18,8 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nv04_instmem.o nv50_instmem.o \
              nv50_crtc.o nv50_dac.o nv50_sor.o \
              nv50_cursor.o nv50_display.o nv50_fbcon.o \
-             nv04_display.o nv04_output.o nv04_crtc.o nv04_cursor.o \
-             nv04_fbcon.o
+             nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o \
+             nv04_dac.o nv04_dfp.o
 
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index db52f25..e9e1e8f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2698,30 +2698,6 @@ static void parse_init_tables(struct drm_device *dev, struct nvbios *bios)
 	}
 }
 
-static void link_head_and_output(struct drm_device *dev, struct dcb_entry *dcbent, int head, bool dl)
-{
-	/* The BIOS scripts don't do this for us, sadly
-	 * Luckily we do know the values ;-)
-	 *
-	 * head < 0 indicates we wish to force a setting with the overrideval
-	 * (for VT restore etc.)
-	 */
-
-	int ramdac = (dcbent->or & OUTPUT_C) >> 2;
-	uint8_t tmds04 = 0x80;
-
-	if (head != ramdac)
-		tmds04 = 0x88;
-
-	if (dcbent->type == OUTPUT_LVDS)
-		tmds04 |= 0x01;
-
-	nv_write_tmds(dev, dcbent->or, 0, 0x04, tmds04);
-
-	if (dl)	/* dual link */
-		nv_write_tmds(dev, dcbent->or, 1, 0x04, tmds04 ^ 0x08);
-}
-
 static uint16_t clkcmptable(struct nvbios *bios, uint16_t clktable, int pxclk)
 {
 	int compare_record_len, i = 0;
@@ -2762,7 +2738,7 @@ static void run_digital_op_script(struct drm_device *dev, uint16_t scriptptr, st
 	NVWriteVgaCrtc5758(dev, head, 0, dcbent->index);
 	parse_init_table(dev, bios, scriptptr, &iexec);
 
-	link_head_and_output(dev, dcbent, head, dl);
+	nv04_dfp_bind_head(dev, dcbent, head, dl);
 }
 
 static int call_lvds_manufacturer_script(struct drm_device *dev, struct dcb_entry *dcbent, int head, enum LVDS_script script)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 1197c68..22d08bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -331,6 +331,16 @@ struct nouveau_pll_vals {
 	int refclk;
 };
 
+enum nv04_fp_display_regs {
+	FP_DISPLAY_END,
+	FP_TOTAL,
+	FP_CRTC,
+	FP_SYNC_START,
+	FP_SYNC_END,
+	FP_VALID_START,
+	FP_VALID_END
+};
+
 struct nv04_crtc_reg {
 	unsigned char MiscOutReg;     /* */
 	uint8_t CRTC[0x9f];
@@ -364,6 +374,8 @@ struct nv04_crtc_reg {
 	uint32_t fp_debug_0;
 	uint32_t fp_debug_1;
 	uint32_t fp_debug_2;
+	uint32_t fp_margin_color;
+	uint32_t ramdac_8c0;
 	uint32_t ramdac_a20;
 	uint32_t ramdac_a24;
 	uint32_t ramdac_a34;
@@ -525,6 +537,7 @@ struct drm_nouveau_private {
 	struct nv04_mode_state saved_reg;
 	uint32_t saved_vga_font[4][16384];
 	uint32_t crtc_owner;
+	uint32_t dac_users[4];
 
 	struct nouveau_suspend_resume {
 		uint32_t fifo_mode;
@@ -893,16 +906,26 @@ extern void nv04_timer_takedown(struct drm_device *);
 extern long nouveau_compat_ioctl(struct file *file, unsigned int cmd,
 				 unsigned long arg);
 
+/* nv04_dac.c */
+extern int nv04_dac_create(struct drm_device *dev, struct dcb_entry *entry);
+extern enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
+						 struct drm_connector *connector);
+extern int nv04_dac_output_offset(struct drm_encoder *encoder);
+extern void nv04_dac_update_dacclk(struct drm_encoder *encoder, bool enable);
+
+/* nv04_dfp.c */
+extern int nv04_dfp_create(struct drm_device *dev, struct dcb_entry *entry);
+extern int nv04_dfp_get_bound_head(struct drm_device *dev, struct dcb_entry *dcbent);
+extern void nv04_dfp_bind_head(struct drm_device *dev, struct dcb_entry *dcbent,
+			       int head, bool dl);
+extern void nv04_dfp_disable(struct drm_device *dev, int head);
+extern void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode);
+
 /* nv04_display.c */
 extern int nv04_display_create(struct drm_device *);
 extern void nv04_display_destroy(struct drm_device *);
 extern void nv04_display_restore(struct drm_device *);
 
-/* nv04_output.c */
-extern int nv04_encoder_create(struct drm_device *, struct dcb_entry *);
-extern int nv04_connector_create(struct drm_device *, int i2c_index,
-				 uint16_t encoders, int type);
-
 /* nv04_crtc.c */
 extern int nv04_crtc_create(struct drm_device *, int index);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.c b/drivers/gpu/drm/nouveau/nouveau_hw.c
index d270d6f..5f49aed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.c
@@ -698,6 +698,11 @@ nv_save_state_ramdac(struct drm_device *dev, int head,
 	regp->fp_debug_1 = NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_DEBUG_1);
 	regp->fp_debug_2 = NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_DEBUG_2);
 
+	regp->fp_margin_color = NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_MARGIN_COLOR);
+
+	if (nv_arch(dev) >= NV_30)
+		regp->ramdac_8c0 = NVReadRAMDAC(dev, head, NV_PRAMDAC_8C0);
+
 	if (nv_arch(dev) == NV_40) {
 		regp->ramdac_a20 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A20);
 		regp->ramdac_a24 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A24);
@@ -751,6 +756,11 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
 	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_DEBUG_1, regp->fp_debug_1);
 	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_DEBUG_2, regp->fp_debug_2);
 
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_MARGIN_COLOR, regp->fp_margin_color);
+
+	if (nv_arch(dev) >= NV_30)
+		NVWriteRAMDAC(dev, head, NV_PRAMDAC_8C0, regp->ramdac_8c0);
+
 	if (nv_arch(dev) == NV_40) {
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A20, regp->ramdac_a20);
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A24, regp->ramdac_a24);
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 103e28c..802b290 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -74,6 +74,18 @@ static void nv_crtc_set_image_sharpening(struct drm_crtc *crtc, int level)
 	NVWriteRAMDAC(crtc->dev, nv_crtc->index, NV_PRAMDAC_634, regp->ramdac_634);
 }
 
+#define PLLSEL_VPLL1_MASK				\
+	(NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_VPLL	\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_VCLK_RATIO_DB2)
+#define PLLSEL_VPLL2_MASK				\
+	(NV_PRAMDAC_PLL_COEFF_SELECT_PLL_SOURCE_VPLL2		\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_VCLK2_RATIO_DB2)
+#define PLLSEL_TV_MASK					\
+	(NV_PRAMDAC_PLL_COEFF_SELECT_TV_VSCLK1		\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_TV_PCLK1		\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_TV_VSCLK2	\
+	 | NV_PRAMDAC_PLL_COEFF_SELECT_TV_PCLK2)
+
 /* NV4x 0x40.. pll notes:
  * gpu pll: 0x4000 + 0x4004
  * ?gpu? pll: 0x4008 + 0x400c
@@ -122,17 +134,16 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	if (!(vclk = nouveau_calc_pll_mnp(dev, &pll_lim, dot_clock, pv)))
 		return;
 
+	state->pllsel &= PLLSEL_VPLL1_MASK | PLLSEL_VPLL2_MASK | PLLSEL_TV_MASK;
+
 	/* The blob uses this always, so let's do the same */
 	if (nv_arch(dev) == NV_40)
-		state->pllsel |= NV_RAMDAC_PLL_SELECT_USE_VPLL2_TRUE;
+		state->pllsel |= NV_PRAMDAC_PLL_COEFF_SELECT_USE_VPLL2_TRUE;
 	/* again nv40 and some nv43 act more like nv3x as described above */
 	if (dev_priv->chipset < 0x41)
 		state->pllsel |= NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_MPLL |
 				 NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_NVPLL;
-	state->pllsel |= (nv_crtc->index ? NV_RAMDAC_PLL_SELECT_PLL_SOURCE_VPLL2 |
-					  NV_RAMDAC_PLL_SELECT_VCLK2_RATIO_DB2 :
-					  NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_VPLL |
-					  NV_PRAMDAC_PLL_COEFF_SELECT_VCLK_RATIO_DB2);
+	state->pllsel |= nv_crtc->index ? PLLSEL_VPLL2_MASK : PLLSEL_VPLL1_MASK;
 
 	if (pv->NM2)
 		NV_TRACE(dev, "vpll: n1 %d n2 %d m1 %d m2 %d log2p %d\n",
@@ -218,8 +229,7 @@ nv_crtc_mode_fixup(struct drm_crtc *crtc, struct drm_display_mode * mode,
 }
 
 static void
-nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode,
-		     struct drm_display_mode *adjusted_mode)
+nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -449,7 +459,8 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 	struct nv04_crtc_reg *regp = &dev_priv->mode_reg.crtc_reg[nv_crtc->index];
 	struct nv04_crtc_reg *savep = &dev_priv->saved_reg.crtc_reg[nv_crtc->index];
 	struct drm_encoder *encoder;
-	bool lvds_output = false, tmds_output = false, off_chip_digital = false;
+	bool lvds_output = false, tmds_output = false, tv_output = false,
+		off_chip_digital = false;
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
 		struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
@@ -460,6 +471,8 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 
 		if (nv_encoder->dcb->type == OUTPUT_LVDS)
 			digital = lvds_output = true;
+		if (nv_encoder->dcb->type == OUTPUT_TV)
+			tv_output = true;
 		if (nv_encoder->dcb->type == OUTPUT_TMDS)
 			digital = tmds_output = true;
 		if (nv_encoder->dcb->location != DCB_LOC_ON_CHIP && digital)
@@ -550,7 +563,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 
 	regp->CRTC[NV_CIO_CRE_PIXEL_INDEX] = (crtc->fb->depth + 1) / 8;
 	/* Enable slaved mode (called MODE_TV in nv4ref.h) */
-	if (lvds_output || tmds_output)
+	if (lvds_output || tmds_output || tv_output)
 		regp->CRTC[NV_CIO_CRE_PIXEL_INDEX] |= (1 << 7);
 
 	/* Generic PRAMDAC regs */
@@ -572,187 +585,12 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 	nv_crtc_set_image_sharpening(crtc, nv_crtc->sharpness);
 
 	/* Some values the blob sets */
+	regp->ramdac_8c0 = 0x100;
 	regp->ramdac_a20 = 0x0;
 	regp->ramdac_a24 = 0xfffff;
 	regp->ramdac_a34 = 0x1;
 }
 
-enum fp_display_regs {
-	FP_DISPLAY_END,
-	FP_TOTAL,
-	FP_CRTC,
-	FP_SYNC_START,
-	FP_SYNC_END,
-	FP_VALID_START,
-	FP_VALID_END
-};
-
-/* this could be set in nv_output, but would require some rework of load/save */
-static void
-nv_crtc_mode_set_fp_regs(struct drm_crtc *crtc, struct drm_display_mode *mode,
-			 struct drm_display_mode * adjusted_mode)
-{
-	struct drm_device *dev = crtc->dev;
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct nv04_crtc_reg *regp = &dev_priv->mode_reg.crtc_reg[nv_crtc->index];
-	struct nv04_crtc_reg *savep = &dev_priv->saved_reg.crtc_reg[nv_crtc->index];
-	struct nouveau_connector *nv_connector = nouveau_crtc_connector_get(nv_crtc);
-	struct nouveau_encoder *nv_encoder = NULL;
-	struct drm_encoder *encoder;
-	uint32_t mode_ratio, panel_ratio;
-
-	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
-		/* assuming one fp output per crtc seems ok */
-		if (encoder->crtc != crtc)
-			continue;
-		nv_encoder = nouveau_encoder(encoder);
-
-		if (nv_encoder->dcb->type == OUTPUT_LVDS ||
-		    nv_encoder->dcb->type == OUTPUT_TMDS)
-			break;
-		nv_encoder = NULL;
-	}
-
-	if (!nv_encoder)
-		return;
-
-	regp->fp_horiz_regs[FP_DISPLAY_END] = adjusted_mode->hdisplay - 1;
-	regp->fp_horiz_regs[FP_TOTAL] = adjusted_mode->htotal - 1;
-	if (!nv_gf4_disp_arch(dev) ||
-	    (adjusted_mode->hsync_start - adjusted_mode->hdisplay) >=
-					dev_priv->vbios->digital_min_front_porch)
-		regp->fp_horiz_regs[FP_CRTC] = adjusted_mode->hdisplay;
-	else
-		regp->fp_horiz_regs[FP_CRTC] = adjusted_mode->hsync_start - dev_priv->vbios->digital_min_front_porch - 1;
-	regp->fp_horiz_regs[FP_SYNC_START] = adjusted_mode->hsync_start - 1;
-	regp->fp_horiz_regs[FP_SYNC_END] = adjusted_mode->hsync_end - 1;
-	regp->fp_horiz_regs[FP_VALID_START] = adjusted_mode->hskew;
-	regp->fp_horiz_regs[FP_VALID_END] = adjusted_mode->hdisplay - 1;
-
-	regp->fp_vert_regs[FP_DISPLAY_END] = adjusted_mode->vdisplay - 1;
-	regp->fp_vert_regs[FP_TOTAL] = adjusted_mode->vtotal - 1;
-	regp->fp_vert_regs[FP_CRTC] = adjusted_mode->vtotal - 5 - 1;
-	regp->fp_vert_regs[FP_SYNC_START] = adjusted_mode->vsync_start - 1;
-	regp->fp_vert_regs[FP_SYNC_END] = adjusted_mode->vsync_end - 1;
-	regp->fp_vert_regs[FP_VALID_START] = 0;
-	regp->fp_vert_regs[FP_VALID_END] = adjusted_mode->vdisplay - 1;
-
-	/* bit26: a bit seen on some g7x, no as yet discernable purpose */
-	regp->fp_control = NV_PRAMDAC_FP_TG_CONTROL_DISPEN_POS |
-			   (savep->fp_control & (1 << 26 | NV_PRAMDAC_FP_TG_CONTROL_READ_PROG));
-	/* Deal with vsync/hsync polarity */
-	/* LVDS screens do set this, but modes with +ve syncs are very rare */
-	if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
-		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_VSYNC_POS;
-	if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
-		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_HSYNC_POS;
-	/* panel scaling first, as native would get set otherwise */
-	if (nv_connector->scaling_mode == DRM_MODE_SCALE_NON_GPU ||
-	    nv_connector->scaling_mode == DRM_MODE_SCALE_NO_SCALE)	/* panel handles it */
-		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_MODE_CENTER;
-	else if (mode->hdisplay == adjusted_mode->hdisplay &&
-		 mode->vdisplay == adjusted_mode->vdisplay) /* native mode */
-		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_MODE_NATIVE;
-	else /* gpu needs to scale */
-		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_MODE_SCALE;
-	if (nvReadEXTDEV(dev, NV_PEXTDEV_BOOT_0) & NV_PEXTDEV_BOOT_0_STRAP_FP_IFACE_12BIT)
-		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_WIDTH_12;
-	if (nv_encoder->dcb->location != DCB_LOC_ON_CHIP &&
-	    nv_connector->native_mode->clock > 165000)
-		regp->fp_control |= (2 << 24);
-	if (nv_encoder->dcb->type == OUTPUT_LVDS) {
-		bool duallink, dummy;
-
-		nouveau_bios_parse_lvds_table(dev, nv_connector->native_mode->
-					      clock, &duallink, &dummy);
-		if (duallink)
-			regp->fp_control |= (8 << 28);
-	} else
-	if (nv_connector->native_mode->clock > 165000)
-		regp->fp_control |= (8 << 28);
-
-	regp->fp_debug_0 = NV_PRAMDAC_FP_DEBUG_0_YWEIGHT_ROUND |
-			   NV_PRAMDAC_FP_DEBUG_0_XWEIGHT_ROUND |
-			   NV_PRAMDAC_FP_DEBUG_0_YINTERP_BILINEAR |
-			   NV_PRAMDAC_FP_DEBUG_0_XINTERP_BILINEAR |
-			   NV_RAMDAC_FP_DEBUG_0_TMDS_ENABLED |
-			   NV_PRAMDAC_FP_DEBUG_0_YSCALE_ENABLE |
-			   NV_PRAMDAC_FP_DEBUG_0_XSCALE_ENABLE;
-
-	/* We want automatic scaling */
-	regp->fp_debug_1 = 0;
-	/* This can override HTOTAL and VTOTAL */
-	regp->fp_debug_2 = 0;
-
-	/* Use 20.12 fixed point format to avoid floats */
-	mode_ratio = (1 << 12) * mode->hdisplay / mode->vdisplay;
-	panel_ratio = (1 << 12) * adjusted_mode->hdisplay / adjusted_mode->vdisplay;
-	/* if ratios are equal, SCALE_ASPECT will automatically (and correctly)
-	 * get treated the same as SCALE_FULLSCREEN */
-	if (nv_connector->scaling_mode == DRM_MODE_SCALE_ASPECT &&
-	    mode_ratio != panel_ratio) {
-		uint32_t diff, scale;
-		bool divide_by_2 = nv_gf4_disp_arch(dev);
-
-		if (mode_ratio < panel_ratio) {
-			/* vertical needs to expand to glass size (automatic)
-			 * horizontal needs to be scaled at vertical scale factor
-			 * to maintain aspect */
-
-			scale = (1 << 12) * mode->vdisplay / adjusted_mode->vdisplay;
-			regp->fp_debug_1 = NV_PRAMDAC_FP_DEBUG_1_XSCALE_TESTMODE_ENABLE |
-					   XLATE(scale, divide_by_2, NV_PRAMDAC_FP_DEBUG_1_XSCALE_VALUE);
-
-			/* restrict area of screen used, horizontally */
-			diff = adjusted_mode->hdisplay -
-			       adjusted_mode->vdisplay * mode_ratio / (1 << 12);
-			regp->fp_horiz_regs[FP_VALID_START] += diff / 2;
-			regp->fp_horiz_regs[FP_VALID_END] -= diff / 2;
-		}
-
-		if (mode_ratio > panel_ratio) {
-			/* horizontal needs to expand to glass size (automatic)
-			 * vertical needs to be scaled at horizontal scale factor
-			 * to maintain aspect */
-
-			scale = (1 << 12) * mode->hdisplay / adjusted_mode->hdisplay;
-			regp->fp_debug_1 = NV_PRAMDAC_FP_DEBUG_1_YSCALE_TESTMODE_ENABLE |
-					   XLATE(scale, divide_by_2, NV_PRAMDAC_FP_DEBUG_1_YSCALE_VALUE);
-
-			/* restrict area of screen used, vertically */
-			diff = adjusted_mode->vdisplay -
-			       (1 << 12) * adjusted_mode->hdisplay / mode_ratio;
-			regp->fp_vert_regs[FP_VALID_START] += diff / 2;
-			regp->fp_vert_regs[FP_VALID_END] -= diff / 2;
-		}
-	}
-
-	/* Output property. */
-	if (nv_connector && nv_connector->use_dithering) {
-		if (dev_priv->chipset == 0x11)
-			regp->dither = savep->dither | 0x00010000;
-		else {
-			int i;
-			regp->dither = savep->dither | 0x00000001;
-			for (i = 0; i < 3; i++) {
-				regp->dither_regs[i] = 0xe4e4e4e4;
-				regp->dither_regs[i + 3] = 0x44444444;
-			}
-		}
-	} else {
-		if (dev_priv->chipset != 0x11) {
-			/* reset them */
-			int i;
-			for (i = 0; i < 3; i++) {
-				regp->dither_regs[i] = savep->dither_regs[i];
-				regp->dither_regs[i + 3] = savep->dither_regs[i + 3];
-			}
-		}
-		regp->dither = savep->dither;
-	}
-}
-
 /**
  * Sets up registers for the given mode/adjusted_mode pair.
  *
@@ -770,35 +608,18 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	NV_TRACE(dev, "CTRC mode on CRTC %d:\n", nv_crtc->index);
-	drm_mode_debug_printmodeline(mode);
-	NV_TRACE(dev, "Output mode on CRTC %d:\n", nv_crtc->index);
-	drm_mode_debug_printmodeline(mode);
+	NV_DEBUG(dev, "CTRC mode on CRTC %d:\n", nv_crtc->index);
+	drm_mode_debug_printmodeline(adjusted_mode);
 
 	/* unlock must come after turning off FP_TG_CONTROL in output_prepare */
 	nv_lock_vga_crtc_shadow(dev, nv_crtc->index, -1);
 
-	nv_crtc_mode_set_vga(crtc, mode, adjusted_mode);
-	/* calculated in output_prepare, nv40 needs it written before calculating PLLs */
+	nv_crtc_mode_set_vga(crtc, adjusted_mode);
+	/* calculated in nv04_dfp_prepare, nv40 needs it written before calculating PLLs */
 	if (nv_arch(dev) == NV_40)
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK, dev_priv->mode_reg.sel_clk);
-	nv_crtc_mode_set_regs(crtc, mode);
-	nv_crtc_mode_set_fp_regs(crtc, mode, adjusted_mode);
+	nv_crtc_mode_set_regs(crtc, adjusted_mode);
 	nv_crtc_calc_state_ext(crtc, mode, adjusted_mode->clock);
-
-	nouveau_hw_load_state(dev, nv_crtc->index, &dev_priv->mode_reg);
-
-	nv04_crtc_mode_set_base(crtc, x, y, NULL);
-
-#ifdef __BIG_ENDIAN
-	/* turn on LFB swapping */
-	{
-		uint8_t tmp = NVReadVgaCrtc(dev, nv_crtc->index, NV_CIO_CRE_RCR);
-		tmp |= MASK(NV_CIO_CRE_RCR_ENDIAN_BIG);
-		NVWriteVgaCrtc(dev, nv_crtc->index, NV_CIO_CRE_RCR, tmp);
-	}
-#endif
-
 	return 0;
 }
 
@@ -806,15 +627,21 @@ static void nv_crtc_save(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct drm_nouveau_private *dev_priv = crtc->dev->dev_private;
+	struct nv04_mode_state *state = &dev_priv->mode_reg;
+	struct nv04_crtc_reg *crtc_state = &state->crtc_reg[nv_crtc->index];
+	struct nv04_mode_state *saved = &dev_priv->saved_reg;
+	struct nv04_crtc_reg *crtc_saved = &saved->crtc_reg[nv_crtc->index];
 
 	if (nv_two_heads(crtc->dev))
 		NVSetOwner(crtc->dev, nv_crtc->index);
 
-	nouveau_hw_save_state(crtc->dev, nv_crtc->index, &dev_priv->saved_reg);
+	nouveau_hw_save_state(crtc->dev, nv_crtc->index, saved);
 
 	/* init some state to saved value */
-	dev_priv->mode_reg.sel_clk = dev_priv->saved_reg.sel_clk & ~(0x5 << 16);
-	dev_priv->mode_reg.crtc_reg[nv_crtc->index].CRTC[NV_CIO_CRE_LCD__INDEX] = dev_priv->saved_reg.crtc_reg[nv_crtc->index].CRTC[NV_CIO_CRE_LCD__INDEX];
+	state->sel_clk = saved->sel_clk & ~(0x5 << 16);
+	crtc_state->CRTC[NV_CIO_CRE_LCD__INDEX] = crtc_saved->CRTC[NV_CIO_CRE_LCD__INDEX];
+	state->pllsel = saved->pllsel & ~(PLLSEL_VPLL1_MASK | PLLSEL_VPLL2_MASK | PLLSEL_TV_MASK);
+	crtc_state->gpio_ext = crtc_saved->gpio_ext;
 }
 
 static void nv_crtc_restore(struct drm_crtc *crtc)
@@ -856,7 +683,22 @@ static void nv_crtc_prepare(struct drm_crtc *crtc)
 
 static void nv_crtc_commit(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
 	struct drm_crtc_helper_funcs *funcs = crtc->helper_private;
+	struct drm_nouveau_private *dev_priv = crtc->dev->dev_private;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
+
+	nouveau_hw_load_state(dev, nv_crtc->index, &dev_priv->mode_reg);
+	nv04_crtc_mode_set_base(crtc, crtc->x, crtc->y, NULL);
+
+#ifdef __BIG_ENDIAN
+	/* turn on LFB swapping */
+	{
+		uint8_t tmp = NVReadVgaCrtc(dev, nv_crtc->index, NV_CIO_CRE_RCR);
+		tmp |= MASK(NV_CIO_CRE_RCR_ENDIAN_BIG);
+		NVWriteVgaCrtc(dev, nv_crtc->index, NV_CIO_CRE_RCR, tmp);
+	}
+#endif
 
 	funcs->dpms(crtc, DRM_MODE_DPMS_ON);
 }
diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouveau/nv04_dac.c
new file mode 100644
index 0000000..05fc393
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv04_dac.c
@@ -0,0 +1,497 @@
+/*
+ * Copyright 2003 NVIDIA, Corporation
+ * Copyright 2006 Dave Airlie
+ * Copyright 2007 Maarten Maathuis
+ * Copyright 2007-2009 Stuart Bennett
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "drmP.h"
+#include "drm_crtc_helper.h"
+
+#include "nouveau_drv.h"
+#include "nouveau_encoder.h"
+#include "nouveau_connector.h"
+#include "nouveau_crtc.h"
+#include "nouveau_hw.h"
+#include "nvreg.h"
+
+int nv04_dac_output_offset(struct drm_encoder *encoder)
+{
+	struct dcb_entry *dcb = nouveau_encoder(encoder)->dcb;
+	int offset = 0;
+
+	if (dcb->or & (8 | OUTPUT_C))
+		offset += 0x68;
+	if (dcb->or & (8 | OUTPUT_B))
+		offset += 0x2000;
+
+	return offset;
+}
+
+/*
+ * arbitrary limit to number of sense oscillations tolerated in one sample
+ * period (observed to be at least 13 in "nvidia")
+ */
+#define MAX_HBLANK_OSC 20
+
+/*
+ * arbitrary limit to number of conflicting sample pairs to tolerate at a
+ * voltage step (observed to be at least 5 in "nvidia")
+ */
+#define MAX_SAMPLE_PAIRS 10
+
+static int sample_load_twice(struct drm_device *dev, bool sense[2])
+{
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		bool sense_a, sense_b, sense_b_prime;
+		int j = 0;
+
+		/*
+		 * wait for bit 0 clear -- out of hblank -- (say reg value 0x4),
+		 * then wait for transition 0x4->0x5->0x4: enter hblank, leave
+		 * hblank again
+		 * use a 10ms timeout (guards against crtc being inactive, in
+		 * which case blank state would never change)
+		 */
+		if (!nouveau_wait_until(dev, 10000000, NV_PRMCIO_INP0__COLOR,
+					0x00000001, 0x00000000))
+			return -EBUSY;
+		if (!nouveau_wait_until(dev, 10000000, NV_PRMCIO_INP0__COLOR,
+					0x00000001, 0x00000001))
+			return -EBUSY;
+		if (!nouveau_wait_until(dev, 10000000, NV_PRMCIO_INP0__COLOR,
+					0x00000001, 0x00000000))
+			return -EBUSY;
+
+		udelay(100);
+		/* when level triggers, sense is _LO_ */
+		sense_a = nv_rd08(dev, NV_PRMCIO_INP0) & 0x10;
+
+		/* take another reading until it agrees with sense_a... */
+		do {
+			udelay(100);
+			sense_b = nv_rd08(dev, NV_PRMCIO_INP0) & 0x10;
+			if (sense_a != sense_b) {
+				sense_b_prime =
+					nv_rd08(dev, NV_PRMCIO_INP0) & 0x10;
+				if (sense_b == sense_b_prime) {
+					/* ... unless two consecutive subsequent
+					 * samples agree; sense_a is replaced */
+					sense_a = sense_b;
+					/* force mis-match so we loop */
+					sense_b = !sense_a;
+				}
+			}
+		} while ((sense_a != sense_b) && ++j < MAX_HBLANK_OSC);
+
+		if (j == MAX_HBLANK_OSC)
+			/* with so much oscillation, default to sense:LO */
+			sense[i] = false;
+		else
+			sense[i] = sense_a;
+	}
+
+	return 0;
+}
+
+static enum drm_connector_status nv04_dac_detect(struct drm_encoder *encoder,
+						 struct drm_connector *connector)
+{
+	struct drm_device *dev = encoder->dev;
+	uint8_t saved_seq1, saved_pi, saved_rpc1;
+	uint8_t saved_palette0[3], saved_palette_mask;
+	uint32_t saved_rtest_ctrl, saved_rgen_ctrl;
+	int i;
+	uint8_t blue;
+	bool sense = true;
+
+	/*
+	 * for this detection to work, there needs to be a mode set up on the
+	 * CRTC.  this is presumed to be the case
+	 */
+
+	if (nv_two_heads(dev))
+		/* only implemented for head A for now */
+		NVSetOwner(dev, 0);
+
+	saved_seq1 = NVReadVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX);
+	NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1 & ~0x20);
+
+	saved_rtest_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL,
+		      saved_rtest_ctrl & ~NV_PRAMDAC_TEST_CONTROL_PWRDWN_DAC_OFF);
+
+	msleep(10);
+
+	saved_pi = NVReadVgaCrtc(dev, 0, NV_CIO_CRE_PIXEL_INDEX);
+	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_PIXEL_INDEX,
+		       saved_pi & ~(0x80 | MASK(NV_CIO_CRE_PIXEL_FORMAT)));
+	saved_rpc1 = NVReadVgaCrtc(dev, 0, NV_CIO_CRE_RPC1_INDEX);
+	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_RPC1_INDEX, saved_rpc1 & ~0xc0);
+
+	nv_wr08(dev, NV_PRMDIO_READ_MODE_ADDRESS, 0x0);
+	for (i = 0; i < 3; i++)
+		saved_palette0[i] = nv_rd08(dev, NV_PRMDIO_PALETTE_DATA);
+	saved_palette_mask = nv_rd08(dev, NV_PRMDIO_PIXEL_MASK);
+	nv_wr08(dev, NV_PRMDIO_PIXEL_MASK, 0);
+
+	saved_rgen_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_GENERAL_CONTROL);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_GENERAL_CONTROL,
+		      (saved_rgen_ctrl & ~(NV_PRAMDAC_GENERAL_CONTROL_BPC_8BITS |
+					   NV_PRAMDAC_GENERAL_CONTROL_TERMINATION_75OHM)) |
+		      NV_PRAMDAC_GENERAL_CONTROL_PIXMIX_ON);
+
+	blue = 8;	/* start of test range */
+
+	do {
+		bool sense_pair[2];
+
+		nv_wr08(dev, NV_PRMDIO_WRITE_MODE_ADDRESS, 0);
+		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, 0);
+		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, 0);
+		/* testing blue won't find monochrome monitors.  I don't care */
+		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, blue);
+
+		i = 0;
+		/* take sample pairs until both samples in the pair agree */
+		do {
+			if (sample_load_twice(dev, sense_pair))
+				goto out;
+		} while ((sense_pair[0] != sense_pair[1]) &&
+							++i < MAX_SAMPLE_PAIRS);
+
+		if (i == MAX_SAMPLE_PAIRS)
+			/* too much oscillation defaults to LO */
+			sense = false;
+		else
+			sense = sense_pair[0];
+
+	/*
+	 * if sense goes LO before blue ramps to 0x18, monitor is not connected.
+	 * ergo, if blue gets to 0x18, monitor must be connected
+	 */
+	} while (++blue < 0x18 && sense);
+
+out:
+	nv_wr08(dev, NV_PRMDIO_PIXEL_MASK, saved_palette_mask);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_GENERAL_CONTROL, saved_rgen_ctrl);
+	nv_wr08(dev, NV_PRMDIO_WRITE_MODE_ADDRESS, 0);
+	for (i = 0; i < 3; i++)
+		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, saved_palette0[i]);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL, saved_rtest_ctrl);
+	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_PIXEL_INDEX, saved_pi);
+	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_RPC1_INDEX, saved_rpc1);
+	NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1);
+
+	if (blue == 0x18) {
+		NV_TRACE(dev, "Load detected on head A\n");
+		return connector_status_connected;
+	}
+
+	return connector_status_disconnected;
+}
+
+enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
+					  struct drm_connector *connector)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct dcb_entry *dcb = nouveau_encoder(encoder)->dcb;
+	uint32_t testval, regoffset = nv04_dac_output_offset(encoder);
+	uint32_t saved_powerctrl_2 = 0, saved_powerctrl_4 = 0, saved_routput,
+		saved_rtest_ctrl, temp, routput;
+	int head, present = 0;
+
+#define RGB_TEST_DATA(r,g,b) (r << 0 | g << 10 | b << 20)
+	testval = RGB_TEST_DATA(0x140, 0x140, 0x140); /* 0x94050140 */
+
+	if (dev_priv->vbios->dactestval)
+		testval = dev_priv->vbios->dactestval;
+
+	saved_rtest_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset,
+		      saved_rtest_ctrl & ~NV_PRAMDAC_TEST_CONTROL_PWRDWN_DAC_OFF);
+
+	saved_powerctrl_2 = nvReadMC(dev, NV_PBUS_POWERCTRL_2);
+
+	nvWriteMC(dev, NV_PBUS_POWERCTRL_2, saved_powerctrl_2 & 0xd7ffffff);
+	if (regoffset == 0x68) {
+		saved_powerctrl_4 = nvReadMC(dev, NV_PBUS_POWERCTRL_4);
+		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4 & 0xffffffcf);
+	}
+
+	msleep(4);
+
+	saved_routput = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset);
+	head = (saved_routput & 0x100) >> 8;
+#if 0
+	/* if there's a spare crtc, using it will minimise flicker for the case
+	 * where the in-use crtc is in use by an off-chip tmds encoder */
+	if (xf86_config->crtc[head]->enabled && !xf86_config->crtc[head ^ 1]->enabled)
+		head ^= 1;
+#endif
+	/* nv driver and nv31 use 0xfffffeee, nv34 and 6600 use 0xfffffece */
+	routput = (saved_routput & 0xfffffece) | head << 8;
+
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset, routput);
+	msleep(1);
+
+	temp = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset, temp | 1);
+
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TESTPOINT_DATA,
+		      NV_PRAMDAC_TESTPOINT_DATA_NOTBLANK | testval);
+	temp = NVReadRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL,
+		      temp | NV_PRAMDAC_TEST_CONTROL_TP_INS_EN_ASSERTED);
+	msleep(5);
+
+	temp = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset);
+
+	present = temp & NV_PRAMDAC_TEST_CONTROL_SENSEB_ALLHI;
+
+	temp = NVReadRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL,
+		      temp & ~NV_PRAMDAC_TEST_CONTROL_TP_INS_EN_ASSERTED);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TESTPOINT_DATA, 0);
+
+	/* bios does something more complex for restoring, but I think this is good enough */
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset, saved_routput);
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset, saved_rtest_ctrl);
+	if (regoffset == 0x68)
+		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4);
+	nvWriteMC(dev, NV_PBUS_POWERCTRL_2, saved_powerctrl_2);
+
+	if (present) {
+		NV_INFO(dev, "Load detected on output %c\n", '@' + ffs(dcb->or));
+		return connector_status_connected;
+	}
+
+	return connector_status_disconnected;
+}
+
+
+static bool nv04_dac_mode_fixup(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void nv04_dac_prepare(struct drm_encoder *encoder)
+{
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int head = nouveau_crtc(encoder->crtc)->index;
+	struct nv04_crtc_reg *crtcstate = dev_priv->mode_reg.crtc_reg;
+
+	helper->dpms(encoder, DRM_MODE_DPMS_OFF);
+
+	nv04_dfp_disable(dev, head);
+
+	/* Some NV4x have unknown values (0x3f, 0x50, 0x54, 0x6b, 0x79, 0x7f)
+	 * at LCD__INDEX which we don't alter
+	 */
+	if (!(crtcstate[head].CRTC[NV_CIO_CRE_LCD__INDEX] & 0x44))
+		crtcstate[head].CRTC[NV_CIO_CRE_LCD__INDEX] = 0;
+}
+
+
+static void nv04_dac_mode_set(struct drm_encoder *encoder,
+			      struct drm_display_mode *mode,
+			      struct drm_display_mode *adjusted_mode)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int head = nouveau_crtc(encoder->crtc)->index;
+
+	NV_TRACE(dev, "%s called for encoder %d\n", __func__,
+		      nv_encoder->dcb->index);
+
+	if (nv_gf4_disp_arch(dev)) {
+		struct drm_encoder *rebind;
+		uint32_t dac_offset = nv04_dac_output_offset(encoder);
+		uint32_t otherdac;
+
+		/* bit 16-19 are bits that are set on some G70 cards,
+		 * but don't seem to have much effect */
+		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + dac_offset,
+			      head << 8 | NV_PRAMDAC_DACCLK_SEL_DACCLK);
+		/* force any other vga encoders to bind to the other crtc */
+		list_for_each_entry(rebind, &dev->mode_config.encoder_list, head) {
+			if (rebind == encoder
+			    || nouveau_encoder(rebind)->dcb->type != OUTPUT_ANALOG)
+				continue;
+
+			dac_offset = nv04_dac_output_offset(rebind);
+			otherdac = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + dac_offset);
+			NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + dac_offset,
+				      (otherdac & ~0x0100) | (head ^ 1) << 8);
+		}
+	}
+
+	/* This could use refinement for flatpanels, but it should work this way */
+	if (dev_priv->chipset < 0x44)
+		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0xf0000000);
+	else
+		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0x00100000);
+}
+
+static void nv04_dac_commit(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+
+	helper->dpms(encoder, DRM_MODE_DPMS_ON);
+
+	NV_INFO(dev, "Output %s is running on CRTC %d using output %c\n",
+		drm_get_connector_name(&nouveau_encoder_connector_get(nv_encoder)->base),
+		nv_crtc->index, '@' + ffs(nv_encoder->dcb->or));
+}
+
+void nv04_dac_update_dacclk(struct drm_encoder *encoder, bool enable)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct dcb_entry *dcb = nouveau_encoder(encoder)->dcb;
+
+	if (nv_gf4_disp_arch(dev)) {
+		uint32_t *dac_users = &dev_priv->dac_users[ffs(dcb->or) - 1];
+		int dacclk_off = NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder);
+		uint32_t dacclk = NVReadRAMDAC(dev, 0, dacclk_off);
+
+		if (enable) {
+			*dac_users |= 1 << dcb->index;
+			NVWriteRAMDAC(dev, 0, dacclk_off, dacclk | NV_PRAMDAC_DACCLK_SEL_DACCLK);
+
+		} else if (!(*dac_users &= ~(1 << dcb->index)))
+			NVWriteRAMDAC(dev, 0, dacclk_off, dacclk & ~NV_PRAMDAC_DACCLK_SEL_DACCLK);
+	}
+}
+
+static void nv04_dac_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+	if (nv_encoder->last_dpms == mode)
+		return;
+	nv_encoder->last_dpms = mode;
+
+	NV_INFO(dev, "Setting dpms mode %d on vga encoder (output %d)\n",
+		     mode, nv_encoder->dcb->index);
+
+	nv04_dac_update_dacclk(encoder, mode == DRM_MODE_DPMS_ON);
+}
+
+static void nv04_dac_save(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+
+	if (nv_gf4_disp_arch(dev))
+		nv_encoder->restore.output = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK +
+							  nv04_dac_output_offset(encoder));
+}
+
+static void nv04_dac_restore(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+
+	if (nv_gf4_disp_arch(dev))
+		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder),
+			      nv_encoder->restore.output);
+
+	nv_encoder->last_dpms = NV_DPMS_CLEARED;
+}
+
+static void nv04_dac_destroy(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+	NV_DEBUG(encoder->dev, "\n");
+
+	drm_encoder_cleanup(encoder);
+	kfree(nv_encoder);
+}
+
+static const struct drm_encoder_helper_funcs nv04_dac_helper_funcs = {
+	.dpms = nv04_dac_dpms,
+	.save = nv04_dac_save,
+	.restore = nv04_dac_restore,
+	.mode_fixup = nv04_dac_mode_fixup,
+	.prepare = nv04_dac_prepare,
+	.commit = nv04_dac_commit,
+	.mode_set = nv04_dac_mode_set,
+	.detect = nv04_dac_detect
+};
+
+static const struct drm_encoder_helper_funcs nv17_dac_helper_funcs = {
+	.dpms = nv04_dac_dpms,
+	.save = nv04_dac_save,
+	.restore = nv04_dac_restore,
+	.mode_fixup = nv04_dac_mode_fixup,
+	.prepare = nv04_dac_prepare,
+	.commit = nv04_dac_commit,
+	.mode_set = nv04_dac_mode_set,
+	.detect = nv17_dac_detect
+};
+
+static const struct drm_encoder_funcs nv04_dac_funcs = {
+	.destroy = nv04_dac_destroy,
+};
+
+int nv04_dac_create(struct drm_device *dev, struct dcb_entry *entry)
+{
+	const struct drm_encoder_helper_funcs *helper;
+	struct drm_encoder *encoder;
+	struct nouveau_encoder *nv_encoder = NULL;
+
+	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
+	if (!nv_encoder)
+		return -ENOMEM;
+
+	encoder = to_drm_encoder(nv_encoder);
+
+	nv_encoder->dcb = entry;
+	nv_encoder->or = ffs(entry->or) - 1;
+
+	if (nv_gf4_disp_arch(dev))
+		helper = &nv17_dac_helper_funcs;
+	else
+		helper = &nv04_dac_helper_funcs;
+
+	drm_encoder_init(dev, encoder, &nv04_dac_funcs, DRM_MODE_ENCODER_DAC);
+	drm_encoder_helper_add(encoder, helper);
+
+	encoder->possible_crtcs = entry->heads;
+	encoder->possible_clones = 0;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau/nv04_dfp.c
new file mode 100644
index 0000000..7913e5f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
@@ -0,0 +1,611 @@
+/*
+ * Copyright 2003 NVIDIA, Corporation
+ * Copyright 2006 Dave Airlie
+ * Copyright 2007 Maarten Maathuis
+ * Copyright 2007-2009 Stuart Bennett
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "drmP.h"
+#include "drm_crtc_helper.h"
+
+#include "nouveau_drv.h"
+#include "nouveau_encoder.h"
+#include "nouveau_connector.h"
+#include "nouveau_crtc.h"
+#include "nouveau_hw.h"
+#include "nvreg.h"
+
+#define FP_TG_CONTROL_ON  (NV_PRAMDAC_FP_TG_CONTROL_DISPEN_POS |	\
+			   NV_PRAMDAC_FP_TG_CONTROL_HSYNC_POS |		\
+			   NV_PRAMDAC_FP_TG_CONTROL_VSYNC_POS)
+#define FP_TG_CONTROL_OFF (NV_PRAMDAC_FP_TG_CONTROL_DISPEN_DISABLE |	\
+			   NV_PRAMDAC_FP_TG_CONTROL_HSYNC_DISABLE |	\
+			   NV_PRAMDAC_FP_TG_CONTROL_VSYNC_DISABLE)
+
+static inline bool is_fpc_off(uint32_t fpc)
+{
+	return ((fpc & (FP_TG_CONTROL_ON | FP_TG_CONTROL_OFF)) ==
+			FP_TG_CONTROL_OFF);
+}
+
+int nv04_dfp_get_bound_head(struct drm_device *dev, struct dcb_entry *dcbent)
+{
+	/* special case of nv_read_tmds to find crtc associated with an output.
+	 * this does not give a correct answer for off-chip dvi, but there's no
+	 * use for such an answer anyway
+	 */
+	int ramdac = (dcbent->or & OUTPUT_C) >> 2;
+
+	NVWriteRAMDAC(dev, ramdac, NV_PRAMDAC_FP_TMDS_CONTROL,
+	NV_PRAMDAC_FP_TMDS_CONTROL_WRITE_DISABLE | 0x4);
+	return ((NVReadRAMDAC(dev, ramdac, NV_PRAMDAC_FP_TMDS_DATA) & 0x8) >> 3) ^ ramdac;
+}
+
+void nv04_dfp_bind_head(struct drm_device *dev, struct dcb_entry *dcbent,
+			int head, bool dl)
+{
+	/* The BIOS scripts don't do this for us, sadly
+	 * Luckily we do know the values ;-)
+	 *
+	 * head < 0 indicates we wish to force a setting with the overrideval
+	 * (for VT restore etc.)
+	 */
+
+	int ramdac = (dcbent->or & OUTPUT_C) >> 2;
+	uint8_t tmds04 = 0x80;
+
+	if (head != ramdac)
+		tmds04 = 0x88;
+
+	if (dcbent->type == OUTPUT_LVDS)
+		tmds04 |= 0x01;
+
+	nv_write_tmds(dev, dcbent->or, 0, 0x04, tmds04);
+
+	if (dl)	/* dual link */
+		nv_write_tmds(dev, dcbent->or, 1, 0x04, tmds04 ^ 0x08);
+}
+
+void nv04_dfp_disable(struct drm_device *dev, int head)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nv04_crtc_reg *crtcstate = dev_priv->mode_reg.crtc_reg;
+
+	if (NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL) &
+	    FP_TG_CONTROL_ON) {
+		/* digital remnants must be cleaned before new crtc
+		 * values programmed.  delay is time for the vga stuff
+		 * to realise it's in control again
+		 */
+		NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL,
+			      FP_TG_CONTROL_OFF);
+		msleep(50);
+	}
+	/* don't inadvertently turn it on when state written later */
+	crtcstate[head].fp_control = FP_TG_CONTROL_OFF;
+}
+
+void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct drm_crtc *crtc;
+	struct nouveau_crtc *nv_crtc;
+	uint32_t *fpc;
+
+	if (mode == DRM_MODE_DPMS_ON) {
+		nv_crtc = nouveau_crtc(encoder->crtc);
+		fpc = &dev_priv->mode_reg.crtc_reg[nv_crtc->index].fp_control;
+
+		if (is_fpc_off(*fpc)) {
+			/* using saved value is ok, as (is_digital && dpms_on &&
+			 * fp_control==OFF) is (at present) *only* true when
+			 * fpc's most recent change was by below "off" code
+			 */
+			*fpc = nv_crtc->dpms_saved_fp_control;
+		}
+
+		nv_crtc->fp_users |= 1 << nouveau_encoder(encoder)->dcb->index;
+		NVWriteRAMDAC(dev, nv_crtc->index, NV_PRAMDAC_FP_TG_CONTROL, *fpc);
+	} else {
+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+			nv_crtc = nouveau_crtc(crtc);
+			fpc = &dev_priv->mode_reg.crtc_reg[nv_crtc->index].fp_control;
+
+			nv_crtc->fp_users &= ~(1 << nouveau_encoder(encoder)->dcb->index);
+			if (!is_fpc_off(*fpc) && !nv_crtc->fp_users) {
+				nv_crtc->dpms_saved_fp_control = *fpc;
+				/* cut the FP output */
+				*fpc &= ~FP_TG_CONTROL_ON;
+				*fpc |= FP_TG_CONTROL_OFF;
+				NVWriteRAMDAC(dev, nv_crtc->index,
+					      NV_PRAMDAC_FP_TG_CONTROL, *fpc);
+			}
+		}
+	}
+}
+
+static bool nv04_dfp_mode_fixup(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct nouveau_connector *nv_connector = nouveau_encoder_connector_get(nv_encoder);
+
+	/* For internal panels and gpu scaling on DVI we need the native mode */
+	if (nv_connector->scaling_mode != DRM_MODE_SCALE_NON_GPU) {
+		nv_encoder->mode = *nv_connector->native_mode;
+		adjusted_mode->clock = nv_connector->native_mode->clock;
+	} else {
+		nv_encoder->mode = *adjusted_mode;
+	}
+
+	return true;
+}
+
+static void nv04_dfp_prepare_sel_clk(struct drm_device *dev,
+				     struct nouveau_encoder *nv_encoder, int head)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nv04_mode_state *state = &dev_priv->mode_reg;
+	uint32_t bits1618 = nv_encoder->dcb->or & OUTPUT_A ? 0x10000 : 0x40000;
+
+	if (nv_encoder->dcb->location != DCB_LOC_ON_CHIP)
+		return;
+
+	/* SEL_CLK is only used on the primary ramdac
+	 * It toggles spread spectrum PLL output and sets the bindings of PLLs
+	 * to heads on digital outputs
+	 */
+	if (head)
+		state->sel_clk |= bits1618;
+	else
+		state->sel_clk &= ~bits1618;
+
+	/* nv30:
+	 *	bit 0		NVClk spread spectrum on/off
+	 *	bit 2		MemClk spread spectrum on/off
+	 * 	bit 4		PixClk1 spread spectrum on/off toggle
+	 * 	bit 6		PixClk2 spread spectrum on/off toggle
+	 *
+	 * nv40 (observations from bios behaviour and mmio traces):
+	 * 	bits 4&6	as for nv30
+	 * 	bits 5&7	head dependent as for bits 4&6, but do not appear with 4&6;
+	 * 			maybe a different spread mode
+	 * 	bits 8&10	seen on dual-link dvi outputs, purpose unknown (set by POST scripts)
+	 * 	The logic behind turning spread spectrum on/off in the first place,
+	 * 	and which bit-pair to use, is unclear on nv40 (for earlier cards, the fp table
+	 * 	entry has the necessary info)
+	 */
+	if (nv_encoder->dcb->type == OUTPUT_LVDS && dev_priv->saved_reg.sel_clk & 0xf0) {
+		int shift = (dev_priv->saved_reg.sel_clk & 0x50) ? 0 : 1;
+
+		state->sel_clk &= ~0xf0;
+		state->sel_clk |= (head ? 0x40 : 0x10) << shift;
+	}
+}
+
+static void nv04_dfp_prepare(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int head = nouveau_crtc(encoder->crtc)->index;
+	struct nv04_crtc_reg *crtcstate = dev_priv->mode_reg.crtc_reg;
+	uint8_t *cr_lcd = &crtcstate[head].CRTC[NV_CIO_CRE_LCD__INDEX];
+	uint8_t *cr_lcd_oth = &crtcstate[head ^ 1].CRTC[NV_CIO_CRE_LCD__INDEX];
+
+	helper->dpms(encoder, DRM_MODE_DPMS_OFF);
+
+	nv04_dfp_prepare_sel_clk(dev, nv_encoder, head);
+
+	/* Some NV4x have unknown values (0x3f, 0x50, 0x54, 0x6b, 0x79, 0x7f)
+	 * at LCD__INDEX which we don't alter
+	 */
+	if (!(*cr_lcd & 0x44)) {
+		*cr_lcd = 0x3;
+
+		if (nv_two_heads(dev)) {
+			if (nv_encoder->dcb->location == DCB_LOC_ON_CHIP)
+				*cr_lcd |= head ? 0x0 : 0x8;
+			else {
+				*cr_lcd |= (nv_encoder->dcb->or << 4) & 0x30;
+				if (nv_encoder->dcb->type == OUTPUT_LVDS)
+					*cr_lcd |= 0x30;
+				if ((*cr_lcd & 0x30) == (*cr_lcd_oth & 0x30)) {
+					/* avoid being connected to both crtcs */
+					*cr_lcd_oth &= ~0x30;
+					NVWriteVgaCrtc(dev, head ^ 1,
+						       NV_CIO_CRE_LCD__INDEX,
+						       *cr_lcd_oth);
+				}
+			}
+		}
+	}
+}
+
+
+static void nv04_dfp_mode_set(struct drm_encoder *encoder,
+			      struct drm_display_mode *mode,
+			      struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
+	struct nv04_crtc_reg *regp = &dev_priv->mode_reg.crtc_reg[nv_crtc->index];
+	struct nv04_crtc_reg *savep = &dev_priv->saved_reg.crtc_reg[nv_crtc->index];
+	struct nouveau_connector *nv_connector = nouveau_crtc_connector_get(nv_crtc);
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_display_mode *output_mode = &nv_encoder->mode;
+	uint32_t mode_ratio, panel_ratio;
+
+	NV_DEBUG(dev, "Output mode on CRTC %d:\n", nv_crtc->index);
+	drm_mode_debug_printmodeline(output_mode);
+
+	/* Initialize the FP registers in this CRTC. */
+	regp->fp_horiz_regs[FP_DISPLAY_END] = output_mode->hdisplay - 1;
+	regp->fp_horiz_regs[FP_TOTAL] = output_mode->htotal - 1;
+	if (!nv_gf4_disp_arch(dev) ||
+	    (output_mode->hsync_start - output_mode->hdisplay) >=
+					dev_priv->vbios->digital_min_front_porch)
+		regp->fp_horiz_regs[FP_CRTC] = output_mode->hdisplay;
+	else
+		regp->fp_horiz_regs[FP_CRTC] = output_mode->hsync_start - dev_priv->vbios->digital_min_front_porch - 1;
+	regp->fp_horiz_regs[FP_SYNC_START] = output_mode->hsync_start - 1;
+	regp->fp_horiz_regs[FP_SYNC_END] = output_mode->hsync_end - 1;
+	regp->fp_horiz_regs[FP_VALID_START] = output_mode->hskew;
+	regp->fp_horiz_regs[FP_VALID_END] = output_mode->hdisplay - 1;
+
+	regp->fp_vert_regs[FP_DISPLAY_END] = output_mode->vdisplay - 1;
+	regp->fp_vert_regs[FP_TOTAL] = output_mode->vtotal - 1;
+	regp->fp_vert_regs[FP_CRTC] = output_mode->vtotal - 5 - 1;
+	regp->fp_vert_regs[FP_SYNC_START] = output_mode->vsync_start - 1;
+	regp->fp_vert_regs[FP_SYNC_END] = output_mode->vsync_end - 1;
+	regp->fp_vert_regs[FP_VALID_START] = 0;
+	regp->fp_vert_regs[FP_VALID_END] = output_mode->vdisplay - 1;
+
+	/* bit26: a bit seen on some g7x, no as yet discernable purpose */
+	regp->fp_control = NV_PRAMDAC_FP_TG_CONTROL_DISPEN_POS |
+			   (savep->fp_control & (1 << 26 | NV_PRAMDAC_FP_TG_CONTROL_READ_PROG));
+	/* Deal with vsync/hsync polarity */
+	/* LVDS screens do set this, but modes with +ve syncs are very rare */
+	if (output_mode->flags & DRM_MODE_FLAG_PVSYNC)
+		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_VSYNC_POS;
+	if (output_mode->flags & DRM_MODE_FLAG_PHSYNC)
+		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_HSYNC_POS;
+	/* panel scaling first, as native would get set otherwise */
+	if (nv_connector->scaling_mode == DRM_MODE_SCALE_NON_GPU ||
+	    nv_connector->scaling_mode == DRM_MODE_SCALE_NO_SCALE)	/* panel handles it */
+		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_MODE_CENTER;
+	else if (adjusted_mode->hdisplay == output_mode->hdisplay &&
+		 adjusted_mode->vdisplay == output_mode->vdisplay) /* native mode */
+		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_MODE_NATIVE;
+	else /* gpu needs to scale */
+		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_MODE_SCALE;
+	if (nvReadEXTDEV(dev, NV_PEXTDEV_BOOT_0) & NV_PEXTDEV_BOOT_0_STRAP_FP_IFACE_12BIT)
+		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_WIDTH_12;
+	if (nv_encoder->dcb->location != DCB_LOC_ON_CHIP &&
+	    nv_connector->native_mode->clock > 165000)
+		regp->fp_control |= (2 << 24);
+	if (nv_encoder->dcb->type == OUTPUT_LVDS) {
+		bool duallink, dummy;
+
+		nouveau_bios_parse_lvds_table(dev, nv_connector->native_mode->
+					      clock, &duallink, &dummy);
+		if (duallink)
+			regp->fp_control |= (8 << 28);
+	} else
+	if (nv_connector->native_mode->clock > 165000)
+		regp->fp_control |= (8 << 28);
+
+	regp->fp_debug_0 = NV_PRAMDAC_FP_DEBUG_0_YWEIGHT_ROUND |
+			   NV_PRAMDAC_FP_DEBUG_0_XWEIGHT_ROUND |
+			   NV_PRAMDAC_FP_DEBUG_0_YINTERP_BILINEAR |
+			   NV_PRAMDAC_FP_DEBUG_0_XINTERP_BILINEAR |
+			   NV_RAMDAC_FP_DEBUG_0_TMDS_ENABLED |
+			   NV_PRAMDAC_FP_DEBUG_0_YSCALE_ENABLE |
+			   NV_PRAMDAC_FP_DEBUG_0_XSCALE_ENABLE;
+
+	/* We want automatic scaling */
+	regp->fp_debug_1 = 0;
+	/* This can override HTOTAL and VTOTAL */
+	regp->fp_debug_2 = 0;
+
+	/* Use 20.12 fixed point format to avoid floats */
+	mode_ratio = (1 << 12) * adjusted_mode->hdisplay / adjusted_mode->vdisplay;
+	panel_ratio = (1 << 12) * output_mode->hdisplay / output_mode->vdisplay;
+	/* if ratios are equal, SCALE_ASPECT will automatically (and correctly)
+	 * get treated the same as SCALE_FULLSCREEN */
+	if (nv_connector->scaling_mode == DRM_MODE_SCALE_ASPECT &&
+	    mode_ratio != panel_ratio) {
+		uint32_t diff, scale;
+		bool divide_by_2 = nv_gf4_disp_arch(dev);
+
+		if (mode_ratio < panel_ratio) {
+			/* vertical needs to expand to glass size (automatic)
+			 * horizontal needs to be scaled at vertical scale factor
+			 * to maintain aspect */
+
+			scale = (1 << 12) * adjusted_mode->vdisplay / output_mode->vdisplay;
+			regp->fp_debug_1 = NV_PRAMDAC_FP_DEBUG_1_XSCALE_TESTMODE_ENABLE |
+					   XLATE(scale, divide_by_2, NV_PRAMDAC_FP_DEBUG_1_XSCALE_VALUE);
+
+			/* restrict area of screen used, horizontally */
+			diff = output_mode->hdisplay -
+			       output_mode->vdisplay * mode_ratio / (1 << 12);
+			regp->fp_horiz_regs[FP_VALID_START] += diff / 2;
+			regp->fp_horiz_regs[FP_VALID_END] -= diff / 2;
+		}
+
+		if (mode_ratio > panel_ratio) {
+			/* horizontal needs to expand to glass size (automatic)
+			 * vertical needs to be scaled at horizontal scale factor
+			 * to maintain aspect */
+
+			scale = (1 << 12) * adjusted_mode->hdisplay / output_mode->hdisplay;
+			regp->fp_debug_1 = NV_PRAMDAC_FP_DEBUG_1_YSCALE_TESTMODE_ENABLE |
+					   XLATE(scale, divide_by_2, NV_PRAMDAC_FP_DEBUG_1_YSCALE_VALUE);
+
+			/* restrict area of screen used, vertically */
+			diff = output_mode->vdisplay -
+			       (1 << 12) * output_mode->hdisplay / mode_ratio;
+			regp->fp_vert_regs[FP_VALID_START] += diff / 2;
+			regp->fp_vert_regs[FP_VALID_END] -= diff / 2;
+		}
+	}
+
+	/* Output property. */
+	if (nv_connector->use_dithering) {
+		if (dev_priv->chipset == 0x11)
+			regp->dither = savep->dither | 0x00010000;
+		else {
+			int i;
+			regp->dither = savep->dither | 0x00000001;
+			for (i = 0; i < 3; i++) {
+				regp->dither_regs[i] = 0xe4e4e4e4;
+				regp->dither_regs[i + 3] = 0x44444444;
+			}
+		}
+	} else {
+		if (dev_priv->chipset != 0x11) {
+			/* reset them */
+			int i;
+			for (i = 0; i < 3; i++) {
+				regp->dither_regs[i] = savep->dither_regs[i];
+				regp->dither_regs[i + 3] = savep->dither_regs[i + 3];
+			}
+		}
+		regp->dither = savep->dither;
+	}
+
+	regp->fp_margin_color = 0;
+}
+
+static void nv04_dfp_commit(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct dcb_entry *dcbe = nv_encoder->dcb;
+	int head = nouveau_crtc(encoder->crtc)->index;
+
+	NV_TRACE(dev, "%s called for encoder %d\n", __func__, nv_encoder->dcb->index);
+
+	if (dcbe->type == OUTPUT_TMDS)
+		run_tmds_table(dev, dcbe, head, nv_encoder->mode.clock);
+	else if (dcbe->type == OUTPUT_LVDS)
+		call_lvds_script(dev, dcbe, head, LVDS_RESET, nv_encoder->mode.clock);
+
+	/* update fp_control state for any changes made by scripts,
+	 * so correct value is written at DPMS on */
+	dev_priv->mode_reg.crtc_reg[head].fp_control =
+		NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL);
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
+static inline bool is_powersaving_dpms(int mode)
+{
+	return (mode != DRM_MODE_DPMS_ON);
+}
+
+static void nv04_lvds_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_crtc *crtc = encoder->crtc;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	bool was_powersaving = is_powersaving_dpms(nv_encoder->last_dpms);
+
+	if (nv_encoder->last_dpms == mode)
+		return;
+	nv_encoder->last_dpms = mode;
+
+	NV_INFO(dev, "Setting dpms mode %d on lvds encoder (output %d)\n",
+		     mode, nv_encoder->dcb->index);
+
+	if (was_powersaving && is_powersaving_dpms(mode))
+		return;
+
+	if (nv_encoder->dcb->lvdsconf.use_power_scripts) {
+		struct nouveau_connector *nv_connector = nouveau_encoder_connector_get(nv_encoder);
+
+		/* when removing an output, crtc may not be set, but PANEL_OFF
+		 * must still be run
+		 */
+		int head = crtc ? nouveau_crtc(crtc)->index :
+			   nv04_dfp_get_bound_head(dev, nv_encoder->dcb);
+
+		if (mode == DRM_MODE_DPMS_ON)
+			call_lvds_script(dev, nv_encoder->dcb, head,
+					 LVDS_PANEL_ON, nv_connector->native_mode->clock);
+		else
+			/* pxclk of 0 is fine for PANEL_OFF, and for a
+			 * disconnected LVDS encoder there is no native_mode
+			 */
+			call_lvds_script(dev, nv_encoder->dcb, head,
+					 LVDS_PANEL_OFF, 0);
+	}
+
+	nv04_dfp_update_fp_control(encoder, mode);
+
+	if (mode == DRM_MODE_DPMS_ON)
+		nv04_dfp_prepare_sel_clk(dev, nv_encoder, nouveau_crtc(crtc)->index);
+	else {
+		dev_priv->mode_reg.sel_clk = NVReadRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK);
+		dev_priv->mode_reg.sel_clk &= ~0xf0;
+	}
+	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK, dev_priv->mode_reg.sel_clk);
+}
+
+static void nv04_tmds_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+	if (nv_encoder->last_dpms == mode)
+		return;
+	nv_encoder->last_dpms = mode;
+
+	NV_INFO(dev, "Setting dpms mode %d on tmds encoder (output %d)\n",
+		     mode, nv_encoder->dcb->index);
+
+	nv04_dfp_update_fp_control(encoder, mode);
+}
+
+static void nv04_dfp_save(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+
+	if (nv_two_heads(dev))
+		nv_encoder->restore.head =
+			nv04_dfp_get_bound_head(dev, nv_encoder->dcb);
+}
+
+static void nv04_dfp_restore(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_device *dev = encoder->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int head = nv_encoder->restore.head;
+
+	if (nv_encoder->dcb->type == OUTPUT_LVDS) {
+		call_lvds_script(dev, nv_encoder->dcb, head, LVDS_PANEL_ON,
+				 nouveau_encoder_connector_get(nv_encoder)->native_mode->clock);
+
+	} else if (nv_encoder->dcb->type == OUTPUT_TMDS) {
+		int clock = nouveau_hw_pllvals_to_clk
+					(&dev_priv->saved_reg.crtc_reg[head].pllvals);
+
+		run_tmds_table(dev, nv_encoder->dcb, head, clock);
+	}
+
+	nv_encoder->last_dpms = NV_DPMS_CLEARED;
+}
+
+static void nv04_dfp_destroy(struct drm_encoder *encoder)
+{
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+	NV_DEBUG(encoder->dev, "\n");
+
+	drm_encoder_cleanup(encoder);
+	kfree(nv_encoder);
+}
+
+static const struct drm_encoder_helper_funcs nv04_lvds_helper_funcs = {
+	.dpms = nv04_lvds_dpms,
+	.save = nv04_dfp_save,
+	.restore = nv04_dfp_restore,
+	.mode_fixup = nv04_dfp_mode_fixup,
+	.prepare = nv04_dfp_prepare,
+	.commit = nv04_dfp_commit,
+	.mode_set = nv04_dfp_mode_set,
+	.detect = NULL,
+};
+
+static const struct drm_encoder_helper_funcs nv04_tmds_helper_funcs = {
+	.dpms = nv04_tmds_dpms,
+	.save = nv04_dfp_save,
+	.restore = nv04_dfp_restore,
+	.mode_fixup = nv04_dfp_mode_fixup,
+	.prepare = nv04_dfp_prepare,
+	.commit = nv04_dfp_commit,
+	.mode_set = nv04_dfp_mode_set,
+	.detect = NULL,
+};
+
+static const struct drm_encoder_funcs nv04_dfp_funcs = {
+	.destroy = nv04_dfp_destroy,
+};
+
+int nv04_dfp_create(struct drm_device *dev, struct dcb_entry *entry)
+{
+	const struct drm_encoder_helper_funcs *helper;
+	struct drm_encoder *encoder;
+	struct nouveau_encoder *nv_encoder = NULL;
+	int type;
+
+	switch (entry->type) {
+	case OUTPUT_TMDS:
+		type = DRM_MODE_ENCODER_TMDS;
+		helper = &nv04_tmds_helper_funcs;
+		break;
+	case OUTPUT_LVDS:
+		type = DRM_MODE_ENCODER_LVDS;
+		helper = &nv04_lvds_helper_funcs;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
+	if (!nv_encoder)
+		return -ENOMEM;
+
+	encoder = to_drm_encoder(nv_encoder);
+
+	nv_encoder->dcb = entry;
+	nv_encoder->or = ffs(entry->or) - 1;
+
+	drm_encoder_init(dev, encoder, &nv04_dfp_funcs, type);
+	drm_encoder_helper_add(encoder, helper);
+
+	encoder->possible_crtcs = entry->heads;
+	encoder->possible_clones = 0;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index ee50e34..4826e13 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -96,7 +96,7 @@ nv04_display_create(struct drm_device *dev)
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
 	uint16_t connectors[16] = { 0 };
-	int i;
+	int i, ret;
 
 	NV_DEBUG(dev, "\n");
 
@@ -130,16 +130,25 @@ nv04_display_create(struct drm_device *dev)
 	for (i = 0; i < dcb->entries; i++) {
 		struct dcb_entry *dcbent = &dcb->entry[i];
 
-		if (dcbent->type == OUTPUT_TV)
+		switch (dcbent->type) {
+		case OUTPUT_ANALOG:
+			ret = nv04_dac_create(dev, dcbent);
+			break;
+		case OUTPUT_LVDS:
+		case OUTPUT_TMDS:
+			ret = nv04_dfp_create(dev, dcbent);
+			break;
+		case OUTPUT_TV:
 			continue;
-		if (dcbent->type > 3) {
+		default:
 			NV_WARN(dev, "DCB type %d not known\n", dcbent->type);
 			continue;
 		}
 
-		connectors[dcbent->i2c_index] |= 1 << i;
+		if (ret)
+			continue;
 
-		nv04_encoder_create(dev, dcbent);
+		connectors[dcbent->i2c_index] |= 1 << i;
 	}
 
 	for (i = 0; i < dcb->entries; i++) {
@@ -171,13 +180,21 @@ nv04_display_create(struct drm_device *dev)
 			    dev_priv->vbios->fp_no_ddc)
 				i2c_index = 0xf;
 			break;
+		case OUTPUT_TV:
+			type = DRM_MODE_CONNECTOR_TV;
+			break;
 		default:
 			type = DRM_MODE_CONNECTOR_Unknown;
 			continue;
 		}
 
+		if (i2c_index == 0xf)
+			encoders = 1 << dcbent->index; /* allow multiple connectors with the
+							  same dummy i2c index */
+		else
+			connectors[i2c_index] = 0; /* avoid connectors being added multiply */
+
 		nouveau_connector_create(dev, i2c_index, type);
-		connectors[i2c_index] = 0; /* avoid connectors being added multiply */
 	}
 
 	/* Save previous state */
diff --git a/drivers/gpu/drm/nouveau/nv04_output.c b/drivers/gpu/drm/nouveau/nv04_output.c
deleted file mode 100644
index ba57dcf..0000000
--- a/drivers/gpu/drm/nouveau/nv04_output.c
+++ /dev/null
@@ -1,797 +0,0 @@
-/*
- * Copyright 2003 NVIDIA, Corporation
- * Copyright 2006 Dave Airlie
- * Copyright 2007 Maarten Maathuis
- * Copyright 2007-2009 Stuart Bennett
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#include "drmP.h"
-#include "drm_crtc_helper.h"
-
-#include "nouveau_drv.h"
-#include "nouveau_encoder.h"
-#include "nouveau_connector.h"
-#include "nouveau_crtc.h"
-#include "nouveau_hw.h"
-#include "nvreg.h"
-
-static int
-nv_output_ramdac_offset(struct nouveau_encoder *nv_encoder)
-{
-	int offset = 0;
-
-	if (nv_encoder->dcb->or & (8 | OUTPUT_C))
-		offset += 0x68;
-	if (nv_encoder->dcb->or & (8 | OUTPUT_B))
-		offset += 0x2000;
-
-	return offset;
-}
-
-static int
-nv_get_digital_bound_head(struct drm_device *dev, int or)
-{
-	/* special case of nv_read_tmds to find crtc associated with an output.
-	 * this does not give a correct answer for off-chip dvi, but there's no
-	 * use for such an answer anyway
-	 */
-	int ramdac = (or & OUTPUT_C) >> 2;
-
-	NVWriteRAMDAC(dev, ramdac, NV_PRAMDAC_FP_TMDS_CONTROL,
-	NV_PRAMDAC_FP_TMDS_CONTROL_WRITE_DISABLE | 0x4);
-	return (((NVReadRAMDAC(dev, ramdac, NV_PRAMDAC_FP_TMDS_DATA) & 0x8) >> 3) ^ ramdac);
-}
-
-/*
- * arbitrary limit to number of sense oscillations tolerated in one sample
- * period (observed to be at least 13 in "nvidia")
- */
-#define MAX_HBLANK_OSC 20
-
-/*
- * arbitrary limit to number of conflicting sample pairs to tolerate at a
- * voltage step (observed to be at least 5 in "nvidia")
- */
-#define MAX_SAMPLE_PAIRS 10
-
-static int sample_load_twice(struct drm_device *dev, bool sense[2])
-{
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		bool sense_a, sense_b, sense_b_prime;
-		int j = 0;
-
-		/*
-		 * wait for bit 0 clear -- out of hblank -- (say reg value 0x4),
-		 * then wait for transition 0x4->0x5->0x4: enter hblank, leave
-		 * hblank again
-		 * use a 10ms timeout (guards against crtc being inactive, in
-		 * which case blank state would never change)
-		 */
-		if (!nouveau_wait_until(dev, 10000000, NV_PRMCIO_INP0__COLOR,
-					0x00000001, 0x00000000))
-			return -EBUSY;
-		if (!nouveau_wait_until(dev, 10000000, NV_PRMCIO_INP0__COLOR,
-					0x00000001, 0x00000001))
-			return -EBUSY;
-		if (!nouveau_wait_until(dev, 10000000, NV_PRMCIO_INP0__COLOR,
-					0x00000001, 0x00000000))
-			return -EBUSY;
-
-		udelay(100);
-		/* when level triggers, sense is _LO_ */
-		sense_a = nv_rd08(dev, NV_PRMCIO_INP0) & 0x10;
-
-		/* take another reading until it agrees with sense_a... */
-		do {
-			udelay(100);
-			sense_b = nv_rd08(dev, NV_PRMCIO_INP0) & 0x10;
-			if (sense_a != sense_b) {
-				sense_b_prime =
-					nv_rd08(dev, NV_PRMCIO_INP0) & 0x10;
-				if (sense_b == sense_b_prime) {
-					/* ... unless two consecutive subsequent
-					 * samples agree; sense_a is replaced */
-					sense_a = sense_b;
-					/* force mis-match so we loop */
-					sense_b = !sense_a;
-				}
-			}
-		} while ((sense_a != sense_b) && ++j < MAX_HBLANK_OSC);
-
-		if (j == MAX_HBLANK_OSC)
-			/* with so much oscillation, default to sense:LO */
-			sense[i] = false;
-		else
-			sense[i] = sense_a;
-	}
-
-	return 0;
-}
-
-static enum drm_connector_status
-nv04_dac_load_detect(struct drm_encoder *encoder,
-		     struct drm_connector *connector)
-{
-	struct drm_device *dev = encoder->dev;
-	uint8_t saved_seq1, saved_pi, saved_rpc1;
-	uint8_t saved_palette0[3], saved_palette_mask;
-	uint32_t saved_rtest_ctrl, saved_rgen_ctrl;
-	int i;
-	uint8_t blue;
-	bool sense = true;
-
-	/*
-	 * for this detection to work, there needs to be a mode set up on the
-	 * CRTC.  this is presumed to be the case
-	 */
-
-	if (nv_two_heads(dev))
-		/* only implemented for head A for now */
-		NVSetOwner(dev, 0);
-
-	saved_seq1 = NVReadVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX);
-	NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1 & ~0x20);
-
-	saved_rtest_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL,
-		      saved_rtest_ctrl & ~NV_PRAMDAC_TEST_CONTROL_PWRDWN_DAC_OFF);
-
-	msleep(10);
-
-	saved_pi = NVReadVgaCrtc(dev, 0, NV_CIO_CRE_PIXEL_INDEX);
-	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_PIXEL_INDEX,
-		       saved_pi & ~(0x80 | MASK(NV_CIO_CRE_PIXEL_FORMAT)));
-	saved_rpc1 = NVReadVgaCrtc(dev, 0, NV_CIO_CRE_RPC1_INDEX);
-	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_RPC1_INDEX, saved_rpc1 & ~0xc0);
-
-	nv_wr08(dev, NV_PRMDIO_READ_MODE_ADDRESS, 0x0);
-	for (i = 0; i < 3; i++)
-		saved_palette0[i] = nv_rd08(dev, NV_PRMDIO_PALETTE_DATA);
-	saved_palette_mask = nv_rd08(dev, NV_PRMDIO_PIXEL_MASK);
-	nv_wr08(dev, NV_PRMDIO_PIXEL_MASK, 0);
-
-	saved_rgen_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_GENERAL_CONTROL);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_GENERAL_CONTROL,
-		      (saved_rgen_ctrl & ~(NV_PRAMDAC_GENERAL_CONTROL_BPC_8BITS |
-					   NV_PRAMDAC_GENERAL_CONTROL_TERMINATION_75OHM)) |
-		      NV_PRAMDAC_GENERAL_CONTROL_PIXMIX_ON);
-
-	blue = 8;	/* start of test range */
-
-	do {
-		bool sense_pair[2];
-
-		nv_wr08(dev, NV_PRMDIO_WRITE_MODE_ADDRESS, 0);
-		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, 0);
-		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, 0);
-		/* testing blue won't find monochrome monitors.  I don't care */
-		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, blue);
-
-		i = 0;
-		/* take sample pairs until both samples in the pair agree */
-		do {
-			if (sample_load_twice(dev, sense_pair))
-				goto out;
-		} while ((sense_pair[0] != sense_pair[1]) &&
-							++i < MAX_SAMPLE_PAIRS);
-
-		if (i == MAX_SAMPLE_PAIRS)
-			/* too much oscillation defaults to LO */
-			sense = false;
-		else
-			sense = sense_pair[0];
-
-	/*
-	 * if sense goes LO before blue ramps to 0x18, monitor is not connected.
-	 * ergo, if blue gets to 0x18, monitor must be connected
-	 */
-	} while (++blue < 0x18 && sense);
-
-out:
-	nv_wr08(dev, NV_PRMDIO_PIXEL_MASK, saved_palette_mask);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_GENERAL_CONTROL, saved_rgen_ctrl);
-	nv_wr08(dev, NV_PRMDIO_WRITE_MODE_ADDRESS, 0);
-	for (i = 0; i < 3; i++)
-		nv_wr08(dev, NV_PRMDIO_PALETTE_DATA, saved_palette0[i]);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL, saved_rtest_ctrl);
-	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_PIXEL_INDEX, saved_pi);
-	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_RPC1_INDEX, saved_rpc1);
-	NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1);
-
-	if (blue == 0x18) {
-		NV_TRACE(dev, "Load detected on head A\n");
-		return connector_status_connected;
-	}
-
-	return connector_status_disconnected;
-}
-
-static enum drm_connector_status
-nv17_dac_load_detect(struct drm_encoder *encoder,
-		     struct drm_connector *connector)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	uint32_t testval, regoffset = nv_output_ramdac_offset(nv_encoder);
-	uint32_t saved_powerctrl_2 = 0, saved_powerctrl_4 = 0, saved_routput, saved_rtest_ctrl, temp;
-	int head, present = 0;
-
-#define RGB_TEST_DATA(r,g,b) (r << 0 | g << 10 | b << 20)
-	testval = RGB_TEST_DATA(0x140, 0x140, 0x140); /* 0x94050140 */
-	if (dev_priv->vbios->dactestval)
-		testval = dev_priv->vbios->dactestval;
-
-	saved_rtest_ctrl = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset,
-		      saved_rtest_ctrl & ~NV_PRAMDAC_TEST_CONTROL_PWRDWN_DAC_OFF);
-
-	saved_powerctrl_2 = nvReadMC(dev, NV_PBUS_POWERCTRL_2);
-
-	nvWriteMC(dev, NV_PBUS_POWERCTRL_2, saved_powerctrl_2 & 0xd7ffffff);
-	if (regoffset == 0x68) {
-		saved_powerctrl_4 = nvReadMC(dev, NV_PBUS_POWERCTRL_4);
-		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4 & 0xffffffcf);
-	}
-
-	msleep(4);
-
-	saved_routput = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset);
-	head = (saved_routput & 0x100) >> 8;
-#if 0
-	/* if there's a spare crtc, using it will minimise flicker for the case
-	 * where the in-use crtc is in use by an off-chip tmds encoder */
-	if (xf86_config->crtc[head]->enabled && !xf86_config->crtc[head ^ 1]->enabled)
-		head ^= 1;
-#endif
-	/* nv driver and nv31 use 0xfffffeee, nv34 and 6600 use 0xfffffece */
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset,
-		      (saved_routput & 0xfffffece) | head << 8);
-	msleep(1);
-
-	temp = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset, temp | 1);
-
-	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TESTPOINT_DATA,
-		      NV_PRAMDAC_TESTPOINT_DATA_NOTBLANK | testval);
-	temp = NVReadRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL);
-	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL,
-		      temp | NV_PRAMDAC_TEST_CONTROL_TP_INS_EN_ASSERTED);
-	msleep(1);
-
-	present = NVReadRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset) &
-			NV_PRAMDAC_TEST_CONTROL_SENSEB_ALLHI;
-
-	temp = NVReadRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL);
-	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TEST_CONTROL,
-		      temp & ~NV_PRAMDAC_TEST_CONTROL_TP_INS_EN_ASSERTED);
-	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TESTPOINT_DATA, 0);
-
-	/* bios does something more complex for restoring, but I think this is good enough */
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + regoffset, saved_routput);
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + regoffset, saved_rtest_ctrl);
-	if (regoffset == 0x68)
-		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4);
-	nvWriteMC(dev, NV_PBUS_POWERCTRL_2, saved_powerctrl_2);
-
-	if (present) {
-		NV_INFO(dev, "Load detected on output %c\n",
-			     '@' + ffs(nv_encoder->dcb->or));
-		return connector_status_connected;
-	}
-
-	return connector_status_disconnected;
-}
-
-static bool
-nv_output_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
-		     struct drm_display_mode *adjusted_mode)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_connector *nv_connector;
-
-	nv_connector = nouveau_encoder_connector_get(nv_encoder);
-	if (!nv_connector)
-		return false;
-
-	/* For internal panels and gpu scaling on DVI we need the native mode */
-	if (nv_encoder->dcb->type == OUTPUT_LVDS ||
-	    (nv_encoder->dcb->type == OUTPUT_TMDS && nv_connector->scaling_mode != DRM_MODE_SCALE_NON_GPU)) {
-		int id = adjusted_mode->base.id;
-		*adjusted_mode = *nv_connector->native_mode;
-		adjusted_mode->base.id = id;
-	}
-
-	return true;
-}
-
-static void
-nv_digital_output_prepare_sel_clk(struct drm_device *dev,
-				  struct nouveau_encoder *nv_encoder, int head)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct nv04_mode_state *state = &dev_priv->mode_reg;
-	uint32_t bits1618 = nv_encoder->dcb->or & OUTPUT_A ? 0x10000 : 0x40000;
-
-	if (nv_encoder->dcb->location != DCB_LOC_ON_CHIP)
-		return;
-
-	/* SEL_CLK is only used on the primary ramdac
-	 * It toggles spread spectrum PLL output and sets the bindings of PLLs
-	 * to heads on digital outputs
-	 */
-	if (head)
-		state->sel_clk |= bits1618;
-	else
-		state->sel_clk &= ~bits1618;
-
-	/* nv30:
-	 *	bit 0		NVClk spread spectrum on/off
-	 *	bit 2		MemClk spread spectrum on/off
-	 * 	bit 4		PixClk1 spread spectrum on/off toggle
-	 * 	bit 6		PixClk2 spread spectrum on/off toggle
-	 *
-	 * nv40 (observations from bios behaviour and mmio traces):
-	 * 	bits 4&6	as for nv30
-	 * 	bits 5&7	head dependent as for bits 4&6, but do not appear with 4&6;
-	 * 			maybe a different spread mode
-	 * 	bits 8&10	seen on dual-link dvi outputs, purpose unknown (set by POST scripts)
-	 * 	The logic behind turning spread spectrum on/off in the first place,
-	 * 	and which bit-pair to use, is unclear on nv40 (for earlier cards, the fp table
-	 * 	entry has the necessary info)
-	 */
-	if (nv_encoder->dcb->type == OUTPUT_LVDS && dev_priv->saved_reg.sel_clk & 0xf0) {
-		int shift = (dev_priv->saved_reg.sel_clk & 0x50) ? 0 : 1;
-
-		state->sel_clk &= ~0xf0;
-		state->sel_clk |= (head ? 0x40 : 0x10) << shift;
-	}
-}
-
-#define FP_TG_CONTROL_ON  (NV_PRAMDAC_FP_TG_CONTROL_DISPEN_POS |	\
-			   NV_PRAMDAC_FP_TG_CONTROL_HSYNC_POS |		\
-			   NV_PRAMDAC_FP_TG_CONTROL_VSYNC_POS)
-#define FP_TG_CONTROL_OFF (NV_PRAMDAC_FP_TG_CONTROL_DISPEN_DISABLE |	\
-			   NV_PRAMDAC_FP_TG_CONTROL_HSYNC_DISABLE |	\
-			   NV_PRAMDAC_FP_TG_CONTROL_VSYNC_DISABLE)
-
-static inline bool is_fpc_off(uint32_t fpc)
-{
-	return ((fpc & (FP_TG_CONTROL_ON | FP_TG_CONTROL_OFF)) ==
-			FP_TG_CONTROL_OFF);
-}
-
-static void
-nv_output_prepare(struct drm_encoder *encoder)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
-	struct drm_device *dev = encoder->dev;
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	int head = nouveau_crtc(encoder->crtc)->index;
-	struct nv04_crtc_reg *crtcstate = dev_priv->mode_reg.crtc_reg;
-	uint8_t *cr_lcd = &crtcstate[head].CRTC[NV_CIO_CRE_LCD__INDEX];
-	uint8_t *cr_lcd_oth = &crtcstate[head ^ 1].CRTC[NV_CIO_CRE_LCD__INDEX];
-	bool digital_op = nv_encoder->dcb->type == OUTPUT_LVDS ||
-			  nv_encoder->dcb->type == OUTPUT_TMDS;
-
-	helper->dpms(encoder, DRM_MODE_DPMS_OFF);
-
-	if (nv_encoder->dcb->type == OUTPUT_ANALOG) {
-		if (NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL) &
-							FP_TG_CONTROL_ON) {
-			/* digital remnants must be cleaned before new crtc
-			 * values programmed.  delay is time for the vga stuff
-			 * to realise it's in control again
-			 */
-			NVWriteRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL,
-				      FP_TG_CONTROL_OFF);
-			msleep(50);
-		}
-		/* don't inadvertently turn it on when state written later */
-		crtcstate[head].fp_control = FP_TG_CONTROL_OFF;
-	}
-
-	/* calculate some output specific CRTC regs now, so that they can be
-	 * written in nv_crtc_set_mode
-	 */
-
-	if (digital_op)
-		nv_digital_output_prepare_sel_clk(dev, nv_encoder, head);
-
-	/* Some NV4x have unknown values (0x3f, 0x50, 0x54, 0x6b, 0x79, 0x7f)
-	 * at LCD__INDEX which we don't alter
-	 */
-	if (!(*cr_lcd & 0x44)) {
-		*cr_lcd = digital_op ? 0x3 : 0x0;
-		if (digital_op && nv_two_heads(dev)) {
-			if (nv_encoder->dcb->location == DCB_LOC_ON_CHIP)
-				*cr_lcd |= head ? 0x0 : 0x8;
-			else {
-				*cr_lcd |= (nv_encoder->dcb->or << 4) & 0x30;
-				if (nv_encoder->dcb->type == OUTPUT_LVDS)
-					*cr_lcd |= 0x30;
-				if ((*cr_lcd & 0x30) == (*cr_lcd_oth & 0x30)) {
-					/* avoid being connected to both crtcs */
-					*cr_lcd_oth &= ~0x30;
-					NVWriteVgaCrtc(dev, head ^ 1,
-						       NV_CIO_CRE_LCD__INDEX,
-						       *cr_lcd_oth);
-				}
-			}
-		}
-	}
-}
-
-static void
-nv_output_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode,
-		   struct drm_display_mode *adjusted_mode)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct dcb_entry *dcbe = nv_encoder->dcb;
-	int head = nouveau_crtc(encoder->crtc)->index;
-
-	NV_TRACE(dev, "%s called for encoder %d\n", __func__,
-		      nv_encoder->dcb->index);
-
-	if (nv_gf4_disp_arch(dev) && dcbe->type == OUTPUT_ANALOG) {
-		struct drm_encoder *rebind;
-		uint32_t dac_offset = nv_output_ramdac_offset(nv_encoder);
-		uint32_t otherdac;
-
-		/* bit 16-19 are bits that are set on some G70 cards,
-		 * but don't seem to have much effect */
-		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + dac_offset,
-			      head << 8 | NV_PRAMDAC_DACCLK_SEL_DACCLK);
-		/* force any other vga encoders to bind to the other crtc */
-		list_for_each_entry(rebind, &dev->mode_config.encoder_list, head) {
-			struct nouveau_encoder *nv_rebind = nouveau_encoder(rebind);
-
-			if (nv_rebind == nv_encoder || nv_rebind->dcb->type != OUTPUT_ANALOG)
-				continue;
-
-			dac_offset = nv_output_ramdac_offset(nv_rebind);
-			otherdac = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + dac_offset);
-			NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + dac_offset,
-				      (otherdac & ~0x0100) | (head ^ 1) << 8);
-		}
-	}
-	if (dcbe->type == OUTPUT_TMDS)
-		run_tmds_table(dev, dcbe, head, adjusted_mode->clock);
-	else if (dcbe->type == OUTPUT_LVDS)
-		call_lvds_script(dev, dcbe, head, LVDS_RESET, adjusted_mode->clock);
-	if (dcbe->type == OUTPUT_LVDS || dcbe->type == OUTPUT_TMDS)
-		/* update fp_control state for any changes made by scripts,
-		 * so correct value is written at DPMS on */
-		dev_priv->mode_reg.crtc_reg[head].fp_control =
-			NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL);
-
-	/* This could use refinement for flatpanels, but it should work this way */
-	if (dev_priv->chipset < 0x44)
-		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv_output_ramdac_offset(nv_encoder), 0xf0000000);
-	else
-		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv_output_ramdac_offset(nv_encoder), 0x00100000);
-}
-
-static void
-nv_output_commit(struct drm_encoder *encoder)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct drm_encoder_helper_funcs *helper = encoder->helper_private;
-
-	helper->dpms(encoder, DRM_MODE_DPMS_ON);
-
-	NV_INFO(dev, "Output %s is running on CRTC %d using output %c\n",
-		      drm_get_connector_name(&nouveau_encoder_connector_get(nv_encoder)->base), nv_crtc->index,
-		      '@' + ffs(nv_encoder->dcb->or));
-}
-
-static void
-dpms_update_fp_control(struct drm_device *dev,
-		       struct nouveau_encoder *nv_encoder, struct drm_crtc * crtc,
-		       int mode)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct nouveau_crtc *nv_crtc;
-	uint32_t *fpc;
-
-	if (mode == DRM_MODE_DPMS_ON) {
-		nv_crtc = nouveau_crtc(crtc);
-		fpc = &dev_priv->mode_reg.crtc_reg[nv_crtc->index].fp_control;
-
-		if (is_fpc_off(*fpc)) {
-			/* using saved value is ok, as (is_digital && dpms_on &&
-			 * fp_control==OFF) is (at present) *only* true when
-			 * fpc's most recent change was by below "off" code
-			 */
-			*fpc = nv_crtc->dpms_saved_fp_control;
-		}
-
-		nv_crtc->fp_users |= 1 << nv_encoder->dcb->index;
-		NVWriteRAMDAC(dev, nv_crtc->index, NV_PRAMDAC_FP_TG_CONTROL, *fpc);
-	} else {
-		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-			nv_crtc = nouveau_crtc(crtc);
-			fpc = &dev_priv->mode_reg.crtc_reg[nv_crtc->index].fp_control;
-
-			nv_crtc->fp_users &= ~(1 << nv_encoder->dcb->index);
-			if (!is_fpc_off(*fpc) && !nv_crtc->fp_users) {
-				nv_crtc->dpms_saved_fp_control = *fpc;
-				/* cut the FP output */
-				*fpc &= ~FP_TG_CONTROL_ON;
-				*fpc |= FP_TG_CONTROL_OFF;
-				NVWriteRAMDAC(dev, nv_crtc->index,
-					      NV_PRAMDAC_FP_TG_CONTROL, *fpc);
-			}
-		}
-	}
-}
-
-static inline bool is_powersaving_dpms(int mode)
-{
-	return (mode != DRM_MODE_DPMS_ON);
-}
-
-static void
-lvds_encoder_dpms(struct drm_device *dev, struct nouveau_encoder *nv_encoder,
-		  struct drm_crtc * crtc, int mode)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	bool was_powersaving = is_powersaving_dpms(nv_encoder->last_dpms);
-
-	if (nv_encoder->last_dpms == mode)
-		return;
-	nv_encoder->last_dpms = mode;
-
-	NV_INFO(dev, "Setting dpms mode %d on lvds encoder (output %d)\n",
-		     mode, nv_encoder->dcb->index);
-
-	if (was_powersaving && is_powersaving_dpms(mode))
-		return;
-
-	if (nv_encoder->dcb->lvdsconf.use_power_scripts) {
-		struct nouveau_connector *nv_connector = nouveau_encoder_connector_get(nv_encoder);
-
-		/* when removing an output, crtc may not be set, but PANEL_OFF
-		 * must still be run
-		 */
-		int head = crtc ? nouveau_crtc(crtc)->index :
-			   nv_get_digital_bound_head(dev, nv_encoder->dcb->or);
-
-		if (mode == DRM_MODE_DPMS_ON)
-			call_lvds_script(dev, nv_encoder->dcb, head,
-					 LVDS_PANEL_ON, nv_connector->native_mode->clock);
-		else
-			/* pxclk of 0 is fine for PANEL_OFF, and for a
-			 * disconnected LVDS encoder there is no native_mode
-			 */
-			call_lvds_script(dev, nv_encoder->dcb, head,
-					 LVDS_PANEL_OFF, 0);
-	}
-
-	dpms_update_fp_control(dev, nv_encoder, crtc, mode);
-
-	if (mode == DRM_MODE_DPMS_ON)
-		nv_digital_output_prepare_sel_clk(dev, nv_encoder, nouveau_crtc(crtc)->index);
-	else {
-		dev_priv->mode_reg.sel_clk = NVReadRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK);
-		dev_priv->mode_reg.sel_clk &= ~0xf0;
-	}
-	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK, dev_priv->mode_reg.sel_clk);
-}
-
-static void
-vga_encoder_dpms(struct drm_device *dev, struct nouveau_encoder *nv_encoder,
-		 struct drm_crtc * crtc, int mode)
-{
-	if (nv_encoder->last_dpms == mode)
-		return;
-	nv_encoder->last_dpms = mode;
-
-	NV_INFO(dev, "Setting dpms mode %d on vga encoder (output %d)\n",
-		     mode, nv_encoder->dcb->index);
-
-	if (nv_gf4_disp_arch(dev)) {
-		uint32_t outputval = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv_output_ramdac_offset(nv_encoder));
-
-		if (mode == DRM_MODE_DPMS_OFF)
-			NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv_output_ramdac_offset(nv_encoder),
-				      outputval & ~NV_PRAMDAC_DACCLK_SEL_DACCLK);
-		else if (mode == DRM_MODE_DPMS_ON)
-			NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv_output_ramdac_offset(nv_encoder),
-				      outputval | NV_PRAMDAC_DACCLK_SEL_DACCLK);
-	}
-}
-
-static void
-tmds_encoder_dpms(struct drm_device *dev, struct nouveau_encoder *nv_encoder,
-		  struct drm_crtc * crtc, int mode)
-{
-	if (nv_encoder->last_dpms == mode)
-		return;
-	nv_encoder->last_dpms = mode;
-
-	NV_INFO(dev, "Setting dpms mode %d on tmds encoder (output %d)\n",
-		     mode, nv_encoder->dcb->index);
-
-	dpms_update_fp_control(dev, nv_encoder, crtc, mode);
-}
-
-static void
-nv_output_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-	struct drm_crtc *crtc = encoder->crtc;
-	void (* const encoder_dpms[4])(struct drm_device *, struct nouveau_encoder *, struct drm_crtc *, int) =
-		/* index matches DCB type */
-		{ vga_encoder_dpms, NULL, tmds_encoder_dpms, lvds_encoder_dpms };
-
-	encoder_dpms[nv_encoder->dcb->type](dev, nv_encoder, crtc, mode);
-}
-
-static void
-nv04_encoder_save(struct drm_encoder *encoder)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-
-	if (!nv_encoder->dcb)	/* uninitialised encoder */
-		return;
-
-	if (nv_gf4_disp_arch(dev) && nv_encoder->dcb->type == OUTPUT_ANALOG)
-		nv_encoder->restore.output =
-			NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK +
-				nv_output_ramdac_offset(nv_encoder));
-	if (nv_two_heads(dev) && (nv_encoder->dcb->type == OUTPUT_LVDS ||
-			      nv_encoder->dcb->type == OUTPUT_TMDS))
-		nv_encoder->restore.head =
-			nv_get_digital_bound_head(dev, nv_encoder->dcb->or);
-}
-
-static void
-nv04_encoder_restore(struct drm_encoder *encoder)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	int head = nv_encoder->restore.head;
-
-	if (!nv_encoder->dcb)	/* uninitialised encoder */
-		return;
-
-	if (nv_gf4_disp_arch(dev) && nv_encoder->dcb->type == OUTPUT_ANALOG)
-		NVWriteRAMDAC(dev, 0,
-			      NV_PRAMDAC_DACCLK + nv_output_ramdac_offset(nv_encoder),
-			      nv_encoder->restore.output);
-	if (nv_encoder->dcb->type == OUTPUT_LVDS)
-		call_lvds_script(dev, nv_encoder->dcb, head, LVDS_PANEL_ON,
-				 nouveau_encoder_connector_get(nv_encoder)->native_mode->clock);
-	if (nv_encoder->dcb->type == OUTPUT_TMDS) {
-		int clock = nouveau_hw_pllvals_to_clk
-					(&dev_priv->saved_reg.crtc_reg[head].pllvals);
-
-		run_tmds_table(dev, nv_encoder->dcb, head, clock);
-	}
-
-	nv_encoder->last_dpms = NV_DPMS_CLEARED;
-}
-
-static const struct drm_encoder_helper_funcs nv04_dac_helper_funcs = {
-	.dpms = nv_output_dpms,
-	.save = nv04_encoder_save,
-	.restore = nv04_encoder_restore,
-	.mode_fixup = nv_output_mode_fixup,
-	.prepare = nv_output_prepare,
-	.commit = nv_output_commit,
-	.mode_set = nv_output_mode_set,
-	.detect = nv04_dac_load_detect
-};
-
-static const struct drm_encoder_helper_funcs nv17_dac_helper_funcs = {
-	.dpms = nv_output_dpms,
-	.save = nv04_encoder_save,
-	.restore = nv04_encoder_restore,
-	.mode_fixup = nv_output_mode_fixup,
-	.prepare = nv_output_prepare,
-	.commit = nv_output_commit,
-	.mode_set = nv_output_mode_set,
-	.detect = nv17_dac_load_detect
-};
-
-static const struct drm_encoder_helper_funcs nv04_encoder_helper_funcs = {
-	.dpms = nv_output_dpms,
-	.save = nv04_encoder_save,
-	.restore = nv04_encoder_restore,
-	.mode_fixup = nv_output_mode_fixup,
-	.prepare = nv_output_prepare,
-	.commit = nv_output_commit,
-	.mode_set = nv_output_mode_set,
-	.detect = NULL
-};
-
-static void
-nv04_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-
-	NV_DEBUG(encoder->dev, "\n");
-
-	drm_encoder_cleanup(encoder);
-	kfree(nv_encoder);
-}
-
-static const struct drm_encoder_funcs nv04_encoder_funcs = {
-	.destroy = nv04_encoder_destroy,
-};
-
-int
-nv04_encoder_create(struct drm_device *dev, struct dcb_entry *entry)
-{
-	const struct drm_encoder_helper_funcs *helper;
-	struct nouveau_encoder *nv_encoder = NULL;
-	int type;
-
-	switch (entry->type) {
-	case OUTPUT_TMDS:
-		type = DRM_MODE_ENCODER_TMDS;
-		break;
-	case OUTPUT_LVDS:
-		type = DRM_MODE_ENCODER_LVDS;
-		break;
-	case OUTPUT_ANALOG:
-		type = DRM_MODE_ENCODER_DAC;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-
-	nv_encoder->dcb = entry;
-	nv_encoder->or = ffs(entry->or) - 1;
-
-	if (entry->type == OUTPUT_ANALOG) {
-		if (nv_gf4_disp_arch(dev))
-			helper = &nv17_dac_helper_funcs;
-		else
-			helper = &nv04_dac_helper_funcs;
-	} else
-		helper = &nv04_encoder_helper_funcs;
-
-	drm_encoder_init(dev, to_drm_encoder(nv_encoder), &nv04_encoder_funcs, type);
-	drm_encoder_helper_add(to_drm_encoder(nv_encoder), helper);
-
-	to_drm_encoder(nv_encoder)->possible_crtcs = entry->heads;
-	to_drm_encoder(nv_encoder)->possible_clones = 0;
-
-	return 0;
-}
-
diff --git a/drivers/gpu/drm/nouveau/nvreg.h b/drivers/gpu/drm/nouveau/nvreg.h
index 90623b0..bc960b9 100644
--- a/drivers/gpu/drm/nouveau/nvreg.h
+++ b/drivers/gpu/drm/nouveau/nvreg.h
@@ -316,13 +316,18 @@
 #	define NV30_RAMDAC_ENABLE_VCO2				(8 << 4)
 
 #define NV_PRAMDAC_PLL_COEFF_SELECT			0x0068050c
-#	define NV_RAMDAC_PLL_SELECT_USE_VPLL2_TRUE		(4 << 0)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_USE_VPLL2_TRUE	(4 << 0)
 #	define NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_MPLL	(1 << 8)
 #	define NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_VPLL	(2 << 8)
 #	define NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_NVPLL	(4 << 8)
-#	define NV_RAMDAC_PLL_SELECT_PLL_SOURCE_VPLL2		(8 << 8)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_PLL_SOURCE_VPLL2	(8 << 8)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_TV_VSCLK1		(1 << 16)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_TV_PCLK1		(2 << 16)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_TV_VSCLK2		(4 << 16)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_TV_PCLK2		(8 << 16)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_TV_CLK_SOURCE_VIP	(1 << 20)
 #	define NV_PRAMDAC_PLL_COEFF_SELECT_VCLK_RATIO_DB2	(1 << 28)
-#	define NV_RAMDAC_PLL_SELECT_VCLK2_RATIO_DB2		(2 << 28)
+#	define NV_PRAMDAC_PLL_COEFF_SELECT_VCLK2_RATIO_DB2	(2 << 28)
 
 #define NV_PRAMDAC_PLL_SETUP_CONTROL			0x00680510
 #define NV_RAMDAC_VPLL2					0x00680520
@@ -384,6 +389,7 @@
 #	define NV_PRAMDAC_FP_TG_CONTROL_WIDTH_12		(1 << 24)
 #	define NV_PRAMDAC_FP_TG_CONTROL_DISPEN_POS		(1 << 28)
 #	define NV_PRAMDAC_FP_TG_CONTROL_DISPEN_DISABLE		(2 << 28)
+#define NV_PRAMDAC_FP_MARGIN_COLOR			0x0068084c
 #define NV_PRAMDAC_850					0x00680850
 #define NV_PRAMDAC_85C					0x0068085c
 #define NV_PRAMDAC_FP_DEBUG_0				0x00680880
@@ -409,6 +415,8 @@
 #	define NV_PRAMDAC_FP_TMDS_CONTROL_WRITE_DISABLE		(1 << 16)
 #define NV_PRAMDAC_FP_TMDS_DATA				0x006808b4
 
+#define NV_PRAMDAC_8C0                                  0x006808c0
+
 /* Some kind of switch */
 #define NV_PRAMDAC_900					0x00680900
 #define NV_PRAMDAC_A20					0x00680A20
-- 
1.6.3.3
