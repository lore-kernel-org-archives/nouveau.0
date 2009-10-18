From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/2] nv50/crtc: Don't perform the LUT expansion
	twice.
Date: Sun, 18 Oct 2009 19:48:40 +0200
Message-ID: <1255888120-20934-2-git-send-email-currojerez@riseup.net>
References: <1255888120-20934-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1255888120-20934-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 src/nv50_crtc.c |   40 ++++++----------------------------------
 1 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/src/nv50_crtc.c b/src/nv50_crtc.c
index 73f6239..aa85cee 100644
--- a/src/nv50_crtc.c
+++ b/src/nv50_crtc.c
@@ -455,46 +455,18 @@ NV50CrtcLoadCursor(nouveauCrtcPtr crtc, Bool argb, uint32_t *src)
  * The indices are a bit strange, but i'll assume it's correct (taken from nv).
  * The LUT resolution seems to be 14 bits on NV50 as opposed to the 8 bits of previous hardware.
  */
-#define NV50_LUT_INDEX(val, w) ((val << (8 - w)) | (val >> ((w << 1) - 8)))
 static void
 NV50CrtcGammaSet(nouveauCrtcPtr crtc, uint16_t *red, uint16_t *green, uint16_t *blue, int size)
 {
 	ScrnInfoPtr pScrn = crtc->scrn;
-	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "NV50CrtcGammaSet is called for %s.\n", crtc->index ? "CRTC1" : "CRTC0");
-	uint32_t index, i;
+	uint32_t i;
 
-	switch (pScrn->depth) {
-	case 15:
-		/* R5G5B5 */
-		for (i = 0; i < 32; i++) {
-			index = NV50_LUT_INDEX(i, 5);
-			crtc->lut_values[index].red = red[i] >> 2;
-			crtc->lut_values[index].green = green[i] >> 2;
-			crtc->lut_values[index].blue = blue[i] >> 2;
-		}
-		break;
-	case 16:
-		/* R5G6B5 */
-		for (i = 0; i < 32; i++) {
-			index = NV50_LUT_INDEX(i, 5);
-			crtc->lut_values[index].red = red[i] >> 2;
-			crtc->lut_values[index].blue = blue[i] >> 2;
-		}
+	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "NV50CrtcGammaSet is called for %s.\n", crtc->index ? "CRTC1" : "CRTC0");
 
-		/* Green has an extra bit. */
-		for (i = 0; i < 64; i++) {
-			index = NV50_LUT_INDEX(i, 6);
-			crtc->lut_values[index].green = green[i] >> 2;
-		}
-		break;
-	default:
-		/* R8G8B8 */
-		for (i = 0; i < 256; i++) {
-			crtc->lut_values[i].red = red[i] >> 2;
-			crtc->lut_values[i].green = green[i] >> 2;
-			crtc->lut_values[i].blue = blue[i] >> 2;
-		}
-		break;
+	for (i = 0; i < 256; i++) {
+		crtc->lut_values[i].red = red[i] >> 2;
+		crtc->lut_values[i].green = green[i] >> 2;
+		crtc->lut_values[i].blue = blue[i] >> 2;
 	}
 
 	crtc->lut_values_valid = true;
-- 
1.6.4.4
