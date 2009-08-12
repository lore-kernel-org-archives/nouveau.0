From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 09/12] drm/nouveau: Add some new register defines
	needed for TV-out.
Date: Wed, 12 Aug 2009 02:15:05 +0200
Message-ID: <1250036108-28655-10-git-send-email-currojerez@riseup.net>
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
 drivers/gpu/drm/nouveau/nouveau_drv.h |    9 +++++
 drivers/gpu/drm/nouveau/nouveau_hw.c  |   54 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nv04_crtc.c   |    3 +-
 drivers/gpu/drm/nouveau/nvreg.h       |   24 ++++++++++++++
 4 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index ffdb104..bf61e75 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -372,6 +372,14 @@ struct nv04_crtc_reg {
 	uint32_t ramdac_gen_ctrl;
 	uint32_t ramdac_630;
 	uint32_t ramdac_634;
+	uint32_t tv_setup;
+	uint32_t tv_vtotal;
+	uint32_t tv_vskew;
+	uint32_t tv_vsync_delay;
+	uint32_t tv_htotal;
+	uint32_t tv_hskew;
+	uint32_t tv_hsync_delay;
+	uint32_t tv_hsync_delay2;
 	uint32_t fp_horiz_regs[7];
 	uint32_t fp_vert_regs[7];
 	uint32_t dither;
@@ -385,6 +393,7 @@ struct nv04_crtc_reg {
 	uint32_t ramdac_a20;
 	uint32_t ramdac_a24;
 	uint32_t ramdac_a34;
+	uint32_t ctv_regs[38];
 };
 
 struct nv04_output_reg {
diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.c b/drivers/gpu/drm/nouveau/nouveau_hw.c
index 1e3fbf8..432013f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.c
@@ -673,6 +673,15 @@ nv_save_state_ramdac(struct drm_device *dev, int head,
 	if (dev_priv->chipset >= 0x30)
 		regp->ramdac_634 = NVReadRAMDAC(dev, head, NV_PRAMDAC_634);
 
+	regp->tv_setup = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_SETUP);
+	regp->tv_vtotal = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_VTOTAL);
+	regp->tv_vskew = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_VSKEW);
+	regp->tv_vsync_delay = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_VSYNC_DELAY);
+	regp->tv_htotal = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_HTOTAL);
+	regp->tv_hskew = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_HSKEW);
+	regp->tv_hsync_delay = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_HSYNC_DELAY);
+	regp->tv_hsync_delay2 = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_HSYNC_DELAY2);
+
 	for (i = 0; i < 7; i++) {
 		uint32_t ramdac_reg = NV_PRAMDAC_FP_VDISPLAY_END + (i * 4);
 		regp->fp_vert_regs[i] = NVReadRAMDAC(dev, head, ramdac_reg);
@@ -707,6 +716,10 @@ nv_save_state_ramdac(struct drm_device *dev, int head,
 		regp->ramdac_a20 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A20);
 		regp->ramdac_a24 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A24);
 		regp->ramdac_a34 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A34);
+
+		for (i = 0; i < 38; i++)
+			regp->ctv_regs[i] = NVReadRAMDAC(dev, head,
+							 NV_PRAMDAC_CTV + 4*i);
 	}
 }
 
@@ -736,6 +749,15 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
 	if (dev_priv->chipset >= 0x30)
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_634, regp->ramdac_634);
 
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_SETUP, regp->tv_setup);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_VTOTAL, regp->tv_vtotal);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_VSKEW, regp->tv_vskew);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_VSYNC_DELAY, regp->tv_vsync_delay);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_HTOTAL, regp->tv_htotal);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_HSKEW, regp->tv_hskew);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_HSYNC_DELAY, regp->tv_hsync_delay);
+	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_HSYNC_DELAY2, regp->tv_hsync_delay2);
+
 	for (i = 0; i < 7; i++) {
 		uint32_t ramdac_reg = NV_PRAMDAC_FP_VDISPLAY_END + (i * 4);
 
@@ -765,6 +787,10 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A20, regp->ramdac_a20);
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A24, regp->ramdac_a24);
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A34, regp->ramdac_a34);
+
+		for (i = 0; i < 38; i++)
+			NVWriteRAMDAC(dev, head,
+				      NV_PRAMDAC_CTV + 4*i, regp->ctv_regs[i]);
 	}
 }
 
@@ -838,6 +864,7 @@ nv_save_state_ext(struct drm_device *dev, int head,
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_21);
 	if (nv_arch(dev) >= NV_30)
 		rd_cio_state(dev, head, regp, NV_CIO_CRE_47);
+	rd_cio_state(dev, head, regp, NV_CIO_CRE_49);
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR0_INDEX);
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR1_INDEX);
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR2_INDEX);
@@ -846,10 +873,13 @@ nv_save_state_ext(struct drm_device *dev, int head,
 	if (nv_arch(dev) >= NV_10) {
 		regp->crtc_830 = NVReadCRTC(dev, head, NV_PCRTC_830);
 		regp->crtc_834 = NVReadCRTC(dev, head, NV_PCRTC_834);
-		if (nv_arch(dev) == NV_40) {
+
+                if (nv_arch(dev) >= NV_30)
+                        regp->gpio_ext = NVReadCRTC(dev, head, NV_PCRTC_GPIO_EXT);
+
+		if (nv_arch(dev) == NV_40)
 			regp->crtc_850 = NVReadCRTC(dev, head, NV_PCRTC_850);
-			regp->gpio_ext = NVReadCRTC(dev, head, NV_PCRTC_GPIO_EXT);
-		}
+
 		if (nv_two_heads(dev))
 			regp->crtc_eng_ctrl = NVReadCRTC(dev, head, NV_PCRTC_ENGINE_CTRL);
 		regp->cursor_cfg = NVReadCRTC(dev, head, NV_PCRTC_CURSOR_CONFIG);
@@ -888,6 +918,7 @@ nv_load_state_ext(struct drm_device *dev, int head,
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv04_crtc_reg * regp = &state->crtc_reg[head];
+	uint32_t reg900;
 	int i;
 
 	if (nv_arch(dev) >= NV_10) {
@@ -911,13 +942,14 @@ nv_load_state_ext(struct drm_device *dev, int head,
 		NVWriteCRTC(dev, head, NV_PCRTC_CURSOR_CONFIG, regp->cursor_cfg);
 		NVWriteCRTC(dev, head, NV_PCRTC_830, regp->crtc_830);
 		NVWriteCRTC(dev, head, NV_PCRTC_834, regp->crtc_834);
+
+		if (nv_arch(dev) >= NV_30)
+                        NVWriteCRTC(dev, head, NV_PCRTC_GPIO_EXT, regp->gpio_ext);
+
 		if (nv_arch(dev) == NV_40) {
 			NVWriteCRTC(dev, head, NV_PCRTC_850, regp->crtc_850);
-			NVWriteCRTC(dev, head, NV_PCRTC_GPIO_EXT, regp->gpio_ext);
-		}
 
-		if (nv_arch(dev) == NV_40) {
-			uint32_t reg900 = NVReadRAMDAC(dev, head, NV_PRAMDAC_900);
+			reg900 = NVReadRAMDAC(dev, head, NV_PRAMDAC_900);
 			if (regp->crtc_cfg == NV_PCRTC_CONFIG_START_ADDRESS_HSYNC)
 				NVWriteRAMDAC(dev, head, NV_PRAMDAC_900, reg900 | 0x10000);
 			else
@@ -939,6 +971,7 @@ nv_load_state_ext(struct drm_device *dev, int head,
 	if (nv_arch(dev) >= NV_30)
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_47);
 
+	wr_cio_state(dev, head, regp, NV_CIO_CRE_49);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR0_INDEX);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR1_INDEX);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR2_INDEX);
@@ -956,6 +989,13 @@ nv_load_state_ext(struct drm_device *dev, int head,
 	}
 	/* NV11 and NV20 stop at 0x52. */
 	if (nv_gf4_disp_arch(dev)) {
+		if (nv_arch(dev) == NV_10) {
+			/* Not waiting for vertical retrace before modifying
+			   CRE_53/CRE_54 causes lockups. */
+			nouveau_wait_until(dev, 650000000, NV_PRMCIO_INP0__COLOR, 0x8, 0x8);
+			nouveau_wait_until(dev, 650000000, NV_PRMCIO_INP0__COLOR, 0x8, 0x0);
+		}
+
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_53);
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_54);
 
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index b43372d..a2a8943 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -550,7 +550,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 		/* This is what the blob does */
 		regp->crtc_850 = NVReadCRTC(dev, 0, NV_PCRTC_850);
 
-	if (nv_arch(dev) == NV_40)
+	if (nv_arch(dev) >= NV_30)
 		regp->gpio_ext = NVReadCRTC(dev, 0, NV_PCRTC_GPIO_EXT);
 
 	regp->crtc_cfg = NV_PCRTC_CONFIG_START_ADDRESS_HSYNC;
@@ -581,6 +581,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 		regp->ramdac_gen_ctrl |= NV_PRAMDAC_GENERAL_CONTROL_PIPE_LONG;
 
 	regp->ramdac_630 = 0; /* turn off green mode (tv test pattern?) */
+	regp->tv_setup = 0;
 
 	nv_crtc_set_image_sharpening(crtc, nv_crtc->sharpness);
 
diff --git a/drivers/gpu/drm/nouveau/nvreg.h b/drivers/gpu/drm/nouveau/nvreg.h
index bc960b9..5998c35 100644
--- a/drivers/gpu/drm/nouveau/nvreg.h
+++ b/drivers/gpu/drm/nouveau/nvreg.h
@@ -50,6 +50,9 @@
 #define NV_PPM_OFFSET               0x0000A000
 #define NV_PPM_SIZE                 0x00001000
 
+#define NV_PTV_OFFSET               0x0000D000
+#define NV_PTV_SIZE                 0x00001000
+
 #define NV_PRMVGA_OFFSET            0x000A0000
 #define NV_PRMVGA_SIZE              0x00020000
 
@@ -117,6 +120,12 @@
 
 #define NV_PFIFO_RAMHT			0x00002210
 
+#define NV_PTV_TV_INDEX			0x0000d220
+#define NV_PTV_TV_DATA			0x0000d224
+#define NV_PTV_HFILTER			0x0000d310
+#define NV_PTV_HFILTER2			0x0000d390
+#define NV_PTV_VFILTER			0x0000d510
+
 #define NV_PRMVIO_MISC__WRITE		0x000c03c2
 #define NV_PRMVIO_SRX			0x000c03c4
 #define NV_PRMVIO_SR			0x000c03c5
@@ -288,11 +297,13 @@
 #		define NV_CIO_CRE_EBR_VDE_11		2:2
 #		define NV_CIO_CRE_EBR_VRS_11		4:4
 #		define NV_CIO_CRE_EBR_VBS_11		6:6
+#	define NV_CIO_CRE_43			0x43
 #	define NV_CIO_CRE_44			0x44	/* head control */
 #	define NV_CIO_CRE_CSB			0x45	/* colour saturation boost */
 #	define NV_CIO_CRE_RCR			0x46
 #		define NV_CIO_CRE_RCR_ENDIAN_BIG	7:7
 #	define NV_CIO_CRE_47			0x47	/* extended fifo lwm, used on nv30+ */
+#	define NV_CIO_CRE_49			0x49
 #	define NV_CIO_CRE_4B			0x4b	/* given patterns in 0x[2-3][a-c] regs, probably scratch 6 */
 #	define NV_CIO_CRE_TVOUT_LATENCY		0x52
 #	define NV_CIO_CRE_53			0x53	/* `fp_htiming' according to Haiku */
@@ -361,6 +372,17 @@
 #define NV_PRAMDAC_630					0x00680630
 #define NV_PRAMDAC_634					0x00680634
 
+#define NV_PRAMDAC_TV_SETUP				0x00680700
+#define NV_PRAMDAC_TV_VTOTAL				0x00680720
+#define NV_PRAMDAC_TV_VSKEW				0x00680724
+#define NV_PRAMDAC_TV_VSYNC_DELAY			0x00680728
+#define NV_PRAMDAC_TV_HTOTAL				0x0068072c
+#define NV_PRAMDAC_TV_HSKEW				0x00680730
+#define NV_PRAMDAC_TV_HSYNC_DELAY			0x00680734
+#define NV_PRAMDAC_TV_HSYNC_DELAY2			0x00680738
+
+#define NV_PRAMDAC_TV_SETUP                             0x00680700
+
 #define NV_PRAMDAC_FP_VDISPLAY_END			0x00680800
 #define NV_PRAMDAC_FP_VTOTAL				0x00680804
 #define NV_PRAMDAC_FP_VCRTC				0x00680808
@@ -423,6 +445,8 @@
 #define NV_PRAMDAC_A24					0x00680A24
 #define NV_PRAMDAC_A34					0x00680A34
 
+#define NV_PRAMDAC_CTV					0x00680c00
+
 /* names fabricated from NV_USER_DAC info */
 #define NV_PRMDIO_PIXEL_MASK		0x006813c6
 #	define NV_PRMDIO_PIXEL_MASK_MASK	0xff
-- 
1.6.3.3
