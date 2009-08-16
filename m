From: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] drm/nv04: fix null pointer dereferences of
	native_mode
Date: Sun, 16 Aug 2009 20:24:39 +0300
Message-ID: <4A8840D7.5000409@iki.fi>
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

Subject: [PATCH] drm/nv04: fix null pointer dereferences of native_mode

nv_connector->native_mode is not set when no modes were found for the
connector, so its existence can't be assumed.

In nv04_dfp_mode_fixup, reject the mode if GPU scaling is enabled but
native mode is not known.

In nv04_dfp_mode_set, use clock value from nv_encoder->mode instead of
nv_connector->native_mode. If panel scaling is enabled on a TMDS display
and the display did not have a valid EDID, native_mode is NULL.

In nv04_lvds_dpms and nv04_dfp_restore, refuse to turn on an LVDS panel
if native mode is not known. While clock is not always required for
turning panel on, having an LVDS without native mode means something went
wrong already, so trying to turn panel on only in cases where clock is
required would yield no added benefit.

This fixes http://bugs.freedesktop.org/show_bug.cgi?id=23295

Signed-off-by: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>

---

Please review especially the changes in nv04_dfp_mode_fixup. Previously
(2 << 24) | (8 << 28) was set in regp->fp_control with dual link TMDS
panel, even if we were using a single link mode with panel scaling. As I
didn't know what it is for, I assumed it was a mistake and made it depend
on the actual mode (i.e. native_mode with GPU scaling only) instead.
Someone who knows this stuff should confirm this or fix it in another
way :)

 nv04_dfp.c |   22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau/nv04_dfp.c
index 7913e5f..9dd4a98 100644
--- a/drivers/gpu/drm/nouveau/nv04_dfp.c
+++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
@@ -153,6 +153,8 @@ static bool nv04_dfp_mode_fixup(struct drm_encoder *encoder,
 
 	/* For internal panels and gpu scaling on DVI we need the native mode */
 	if (nv_connector->scaling_mode != DRM_MODE_SCALE_NON_GPU) {
+		if (!nv_connector->native_mode)
+			return false;
 		nv_encoder->mode = *nv_connector->native_mode;
 		adjusted_mode->clock = nv_connector->native_mode->clock;
 	} else {
@@ -305,7 +307,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 	if (nvReadEXTDEV(dev, NV_PEXTDEV_BOOT_0) & NV_PEXTDEV_BOOT_0_STRAP_FP_IFACE_12BIT)
 		regp->fp_control |= NV_PRAMDAC_FP_TG_CONTROL_WIDTH_12;
 	if (nv_encoder->dcb->location != DCB_LOC_ON_CHIP &&
-	    nv_connector->native_mode->clock > 165000)
+	    nv_encoder->mode.clock > 165000)
 		regp->fp_control |= (2 << 24);
 	if (nv_encoder->dcb->type == OUTPUT_LVDS) {
 		bool duallink, dummy;
@@ -315,7 +317,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 		if (duallink)
 			regp->fp_control |= (8 << 28);
 	} else
-	if (nv_connector->native_mode->clock > 165000)
+	if (nv_encoder->mode.clock > 165000)
 		regp->fp_control |= (8 << 28);
 
 	regp->fp_debug_0 = NV_PRAMDAC_FP_DEBUG_0_YWEIGHT_ROUND |
@@ -468,10 +470,14 @@ static void nv04_lvds_dpms(struct drm_encoder *encoder, int mode)
 		int head = crtc ? nouveau_crtc(crtc)->index :
 			   nv04_dfp_get_bound_head(dev, nv_encoder->dcb);
 
-		if (mode == DRM_MODE_DPMS_ON)
+		if (mode == DRM_MODE_DPMS_ON) {
+			if (!nv_connector->native_mode) {
+				NV_ERROR(dev, "Not turning on LVDS without native mode\n");
+				return;
+			}
 			call_lvds_script(dev, nv_encoder->dcb, head,
 					 LVDS_PANEL_ON, nv_connector->native_mode->clock);
-		else
+		} else
 			/* pxclk of 0 is fine for PANEL_OFF, and for a
 			 * disconnected LVDS encoder there is no native_mode
 			 */
@@ -523,8 +529,12 @@ static void nv04_dfp_restore(struct drm_encoder *encoder)
 	int head = nv_encoder->restore.head;
 
 	if (nv_encoder->dcb->type == OUTPUT_LVDS) {
-		call_lvds_script(dev, nv_encoder->dcb, head, LVDS_PANEL_ON,
-				 nouveau_encoder_connector_get(nv_encoder)->native_mode->clock);
+		struct drm_display_mode *native_mode = nouveau_encoder_connector_get(nv_encoder)->native_mode;
+		if (native_mode)
+			call_lvds_script(dev, nv_encoder->dcb, head, LVDS_PANEL_ON,
+					 native_mode->clock);
+		else
+			NV_ERROR(dev, "Not restoring LVDS without native mode\n");
 
 	} else if (nv_encoder->dcb->type == OUTPUT_TMDS) {
 		int clock = nouveau_hw_pllvals_to_clk



-- 
Anssi Hannula
