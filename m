From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2] nv04-nv40/crtc: Don't perform the LUT
	expansion twice.
Date: Sun, 18 Oct 2009 19:48:39 +0200
Message-ID: <1255888120-20934-1-git-send-email-currojerez@riseup.net>
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

Fixes bug 24595.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nv_crtc.c |   34 ++++------------------------------
 1 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/src/nv_crtc.c b/src/nv_crtc.c
index 2ae36a0..9708741 100644
--- a/src/nv_crtc.c
+++ b/src/nv_crtc.c
@@ -888,8 +888,6 @@ static void nv_crtc_unlock(xf86CrtcPtr crtc)
 {
 }
 
-#define DEPTH_SHIFT(val, w) ((val << (8 - w)) | (val >> ((w << 1) - 8)))
-
 static void
 nv_crtc_gamma_set(xf86CrtcPtr crtc, CARD16 *red, CARD16 *green, CARD16 *blue,
 					int size)
@@ -901,34 +899,10 @@ nv_crtc_gamma_set(xf86CrtcPtr crtc, CARD16 *red, CARD16 *green, CARD16 *blue,
 
 	rgbs = (struct rgb *)nv_crtc->state->DAC;
 
-	switch (crtc->scrn->depth) {
-	case 15:
-		/* R5G5B5 */
-		/* spread 5 bits per colour (32 colours) over 256 (per colour) registers */
-		for (i = 0; i < 32; i++) {
-			rgbs[DEPTH_SHIFT(i, 5)].r = red[i] >> 8;
-			rgbs[DEPTH_SHIFT(i, 5)].g = green[i] >> 8;
-			rgbs[DEPTH_SHIFT(i, 5)].b = blue[i] >> 8;
-		}
-		break;
-	case 16:
-		/* R5G6B5 */
-		for (i = 0; i < 64; i++) {
-			/* set 64 regs for green's 6 bits of colour */
-			rgbs[DEPTH_SHIFT(i, 6)].g = green[i] >> 8;
-			if (i < 32) {
-				rgbs[DEPTH_SHIFT(i, 5)].r = red[i] >> 8;
-				rgbs[DEPTH_SHIFT(i, 5)].b = blue[i] >> 8;
-			}
-		}
-		break;
-	default:
-		/* R8G8B8 */
-		for (i = 0; i < 256; i++) {
-			rgbs[i].r = red[i] >> 8;
-			rgbs[i].g = green[i] >> 8;
-			rgbs[i].b = blue[i] >> 8;
-		}
+	for (i = 0; i < 256; i++) {
+		rgbs[i].r = red[i] >> 8;
+		rgbs[i].g = green[i] >> 8;
+		rgbs[i].b = blue[i] >> 8;
 	}
 
 	nouveau_hw_load_state_palette(pNv, nv_crtc->head, &pNv->set_state);
-- 
1.6.4.4
