From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] nv10/exa: Fix PictOpAtopReverse for
	destination pixmaps with no alpha channel.
Date: Thu,  8 Oct 2009 04:10:10 +0200
Message-ID: <1254967812-9268-1-git-send-email-currojerez@riseup.net>
References: <1254750372-491-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1254750372-491-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 src/nv10_exa.c |   52 ++++++++++++++++++++++++++++------------------------
 1 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index 71184b1..4027982 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -123,10 +123,6 @@ static Bool NV10CheckBuffer(PicturePtr Picture)
 
 static Bool NV10CheckPictOp(int op)
 {
-	if ( op == PictOpAtopReverse ) /*this op doesn't work*/
-		{
-		return FALSE;
-		}
 	if ( op >= PictOpSaturate )
 		{ /*we do no saturate, disjoint, conjoint, though we could do e.g. DisjointClear which really is Clear*/
 		return FALSE;
@@ -595,14 +591,24 @@ static void NV10SetPictOp(NVPtr pNv,int op)
 		{0x0305,0x0000}, /* PictOpOut */
 		{0x0000,0x0303}, /* PictOpOutReverse */
 		{0x0304,0x0303}, /* PictOpAtop */
-		{0x0305,0x0302}, /* PictOpAtopReverse - DOES NOT WORK*/
+		{0x0305,0x0302}, /* PictOpAtopReverse */
 		{0x0305,0x0303}, /* PictOpXor */
 		{0x0001,0x0001}, /* PictOpAdd */
 	};
+	int src_factor = pictops[op].src;
+	int dst_factor = pictops[op].dst;
 	
+	if (src_factor == NV10TCL_BLEND_FUNC_SRC_ONE_MINUS_DST_ALPHA &&
+	    !PICT_FORMAT_A(pNv->pdpict->format))
+		/* ONE_MINUS_DST_ALPHA doesn't always do the right thing for
+		 * framebuffers without alpha channel. But it's the same as
+		 * ZERO in that case.
+		 */
+		src_factor = NV10TCL_BLEND_FUNC_SRC_ZERO;
+
 	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_SRC, 2);
-	OUT_RING  (chan, pictops[op].src);
-	OUT_RING  (chan, pictops[op].dst);
+	OUT_RING  (chan, src_factor);
+	OUT_RING  (chan, dst_factor);
 	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_ENABLE, 1);
 	OUT_RING  (chan, 1);
 }
@@ -631,19 +637,27 @@ Bool NV10EXAPrepareComposite(int op,
 
 	WAIT_RING(chan, 128);
 
-	if (NV10Check_A8plusA8_Feasability(pSrcPicture,pMaskPicture,pDstPicture,op))
-		{
-		state.have_mask = FALSE;
+	state.is_a8_plus_a8 = FALSE;
+	state.have_mask=(pMaskPicture!=NULL);
+
+	pNv->alu = op;
+	pNv->pspict = pSrcPicture;
+	pNv->pmpict = pMaskPicture;
+	pNv->pdpict = pDstPicture;
+	pNv->pspix = pSrc;
+	pNv->pmpix = pMask;
+	pNv->pdpix = pDst;
+	chan->flush_notify = NV10StateCompositeReemit;
+
+	if (NV10Check_A8plusA8_Feasability(pSrcPicture,pMaskPicture,pDstPicture,op)) {
 		state.is_a8_plus_a8 = TRUE;
 		NV10SetBuffer(pNv,pDstPicture,pDst);
 		NV10SetPictOp(pNv, op);
 		NV10SetTexture(pNv, 0, pSrcPicture, pSrc);
 		NV10SetTexture(pNv, 1, pSrcPicture, pSrc);
 		return TRUE;
-		}
-	
-	state.is_a8_plus_a8 = FALSE;
-		
+	}
+
 	/* Set dst format */
 	NV10SetBuffer(pNv,pDstPicture,pDst);
 
@@ -659,16 +673,6 @@ Bool NV10EXAPrepareComposite(int op,
 	/* Set PictOp */
 	NV10SetPictOp(pNv, op);
 
-
-	pNv->alu = op;
-	pNv->pspict = pSrcPicture;
-	pNv->pmpict = pMaskPicture;
-	pNv->pdpict = pDstPicture;
-	pNv->pspix = pSrc;
-	pNv->pmpix = pMask;
-	pNv->pdpix = pDst;
-	chan->flush_notify = NV10StateCompositeReemit;
-	state.have_mask=(pMaskPicture!=NULL);
 	return TRUE;
 }
 
-- 
1.6.3.3
