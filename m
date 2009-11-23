From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: Update the CRTC arbitration
	parameters on FB depth switch.
Date: Mon, 23 Nov 2009 14:45:51 +0100
Message-ID: <1258983953-15349-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
 drivers/gpu/drm/nouveau/nv04_crtc.c |   37 +++++++++++++++++++++-------------
 1 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 2ab9f30..0a5cfc1 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -106,10 +106,8 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv04_mode_state *state = &dev_priv->mode_reg;
 	struct nv04_crtc_reg *regp = &state->crtc_reg[nv_crtc->index];
-	struct drm_framebuffer *fb = crtc->fb;
 	struct nouveau_pll_vals *pv = &regp->pllvals;
 	struct pll_lims pll_lim;
-	int vclk, arb_burst, arb_fifo_lwm;
 
 	if (get_pll_limits(dev, nv_crtc->index ? VPLL2 : VPLL1, &pll_lim))
 		return;
@@ -130,8 +128,7 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	if (dev_priv->chipset > 0x40 && dot_clock <= (pll_lim.vco1.maxfreq / 2))
 		memset(&pll_lim.vco2, 0, sizeof(pll_lim.vco2));
 
-	vclk = nouveau_calc_pll_mnp(dev, &pll_lim, dot_clock, pv);
-	if (!vclk)
+	if (!nouveau_calc_pll_mnp(dev, &pll_lim, dot_clock, pv))
 		return;
 
 	state->pllsel &= PLLSEL_VPLL1_MASK | PLLSEL_VPLL2_MASK | PLLSEL_TV_MASK;
@@ -152,13 +149,6 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 		NV_TRACE(dev, "vpll: n %d m %d log2p %d\n",
 			 pv->N1, pv->M1, pv->log2P);
 
-	nouveau_calc_arb(dev, vclk, fb->bits_per_pixel, &arb_burst, &arb_fifo_lwm);
-
-	regp->CRTC[NV_CIO_CRE_FF_INDEX] = arb_burst;
-	regp->CRTC[NV_CIO_CRE_FFLWM__INDEX] = arb_fifo_lwm & 0xff;
-	if (nv_arch(dev) >= NV_30)
-		regp->CRTC[NV_CIO_CRE_47] = arb_fifo_lwm >> 8;
-
 	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
 }
 
@@ -775,10 +765,12 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 			struct drm_framebuffer *old_fb)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_nouveau_private *dev_priv = crtc->dev->dev_private;
+	struct drm_device *dev = crtc->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv04_crtc_reg *regp = &dev_priv->mode_reg.crtc_reg[nv_crtc->index];
 	struct drm_framebuffer *drm_fb = nv_crtc->base.fb;
 	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
+	int arb_burst, arb_lwm;
 	int ret;
 
 	ret = nouveau_bo_pin(fb->nvbo, TTM_PL_FLAG_VRAM);
@@ -797,13 +789,14 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 		nv_crtc_gamma_load(crtc);
 	}
 
+	/* Update the framebuffer format. */
 	regp->CRTC[NV_CIO_CRE_PIXEL_INDEX] &= ~3;
 	regp->CRTC[NV_CIO_CRE_PIXEL_INDEX] |= (crtc->fb->depth + 1) / 8;
 	regp->ramdac_gen_ctrl &= ~NV_PRAMDAC_GENERAL_CONTROL_ALT_MODE_SEL;
 	if (crtc->fb->depth == 16)
 		regp->ramdac_gen_ctrl |= NV_PRAMDAC_GENERAL_CONTROL_ALT_MODE_SEL;
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_PIXEL_INDEX);
-	NVWriteRAMDAC(crtc->dev, nv_crtc->index, NV_PRAMDAC_GENERAL_CONTROL,
+	NVWriteRAMDAC(dev, nv_crtc->index, NV_PRAMDAC_GENERAL_CONTROL,
 		      regp->ramdac_gen_ctrl);
 
 	regp->CRTC[NV_CIO_CR_OFFSET_INDEX] = drm_fb->pitch >> 3;
@@ -812,9 +805,25 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_RPC0_INDEX);
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CR_OFFSET_INDEX);
 
+	/* Update the framebuffer location. */
 	regp->fb_start = nv_crtc->fb.offset & ~3;
 	regp->fb_start += (y * drm_fb->pitch) + (x * drm_fb->bits_per_pixel / 8);
-	NVWriteCRTC(crtc->dev, nv_crtc->index, NV_PCRTC_START, regp->fb_start);
+	NVWriteCRTC(dev, nv_crtc->index, NV_PCRTC_START, regp->fb_start);
+
+	/* Update the arbitration parameters. */
+	nouveau_calc_arb(dev, crtc->mode.clock, drm_fb->bits_per_pixel,
+			 &arb_burst, &arb_lwm);
+
+	regp->CRTC[NV_CIO_CRE_FF_INDEX] = arb_burst;
+	regp->CRTC[NV_CIO_CRE_FFLWM__INDEX] = arb_lwm & 0xff;
+	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_FF_INDEX);
+	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_FFLWM__INDEX);
+
+	if (nv_arch(dev) >= NV_30) {
+		regp->CRTC[NV_CIO_CRE_47] = arb_lwm >> 8;
+		crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_47);
+	}
+
 	return 0;
 }
 
-- 
1.6.4.4
