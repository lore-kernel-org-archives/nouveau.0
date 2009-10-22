From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nv04-nv40/exa: Reorder the commands in
	PrepareCopy to match the blob.
Date: Thu, 22 Oct 2009 02:36:02 +0200
Message-ID: <1256171762-666-1-git-send-email-currojerez@riseup.net>
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

This fixes a somewhat indeterministic corruption problem on nv17 when
there is stuff going on the other fifos (e.g. gallium but I've also
reproduced it with an app just SIFM-ing memory around): in some cases
it made the blits the X server had scheduled use the wrong pitch.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nv04_exa.c |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/src/nv04_exa.c b/src/nv04_exa.c
index 132c9d5..7384cbc 100644
--- a/src/nv04_exa.c
+++ b/src/nv04_exa.c
@@ -197,16 +197,9 @@ NV04EXAPrepareCopy(PixmapPtr pSrcPixmap, PixmapPtr pDstPixmap, int dx, int dy,
 		return FALSE;
 
 	planemask |= ~0 << pDstPixmap->drawable.bitsPerPixel;
-	if (planemask != ~0 || alu != GXcopy) {
-		if (pDstPixmap->drawable.bitsPerPixel == 32)
-			return FALSE;
-		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_OPERATION, 1);
-		OUT_RING  (chan, 1); /* ROP_AND */
-		NV04EXASetROP(pScrn, alu, planemask);
-	} else {
-		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_OPERATION, 1);
-		OUT_RING  (chan, 3); /* SRCCOPY */
-	}
+	if ((planemask != ~0 || alu != GXcopy)
+	    && pDstPixmap->drawable.bitsPerPixel == 32)
+		return FALSE;
 
 	if (!NVAccelGetCtxSurf2DFormatFromPixmap(pDstPixmap, &fmt))
 		return FALSE;
@@ -218,6 +211,15 @@ NV04EXAPrepareCopy(PixmapPtr pSrcPixmap, PixmapPtr pDstPixmap, int dx, int dy,
 	OUT_RELOCl(chan, src_bo, src_delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
 	OUT_RELOCl(chan, dst_bo, dst_delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
+	if (planemask != ~0 || alu != GXcopy) {
+		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_OPERATION, 1);
+		OUT_RING  (chan, 1); /* ROP_AND */
+		NV04EXASetROP(pScrn, alu, planemask);
+	} else {
+		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_OPERATION, 1);
+		OUT_RING  (chan, 3); /* SRCCOPY */
+	}
+
 	pNv->pspix = pSrcPixmap;
 	pNv->pdpix = pDstPixmap;
 	pNv->alu = alu;
-- 
1.6.4.4
