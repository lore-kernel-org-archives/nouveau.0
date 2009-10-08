From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv3 2/3] nv10/exa: Allow component-alpha masks.
Date: Thu,  8 Oct 2009 04:10:11 +0200
Message-ID: <1254967812-9268-2-git-send-email-currojerez@riseup.net>
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
 src/nv10_exa.c |  286 ++++++++++++++++++++++++++++++++------------------------
 1 files changed, 164 insertions(+), 122 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index 4027982..eda92aa 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -39,6 +39,44 @@ typedef struct nv10_exa_state {
 } nv10_exa_state_t;
 static nv10_exa_state_t state;
 
+#define SF(x) NV10TCL_BLEND_FUNC_SRC_##x
+#define DF(x) NV10TCL_BLEND_FUNC_DST_##x
+
+static struct nv10_pictop {
+	int src;
+	int dst;
+} NV10PictOp [] = {
+	{ SF(ZERO),		   DF(ZERO) },		      /* Clear */
+	{ SF(ONE),		   DF(ZERO) },		      /* Src */
+	{ SF(ZERO),		   DF(ONE) },		      /* Dst */
+	{ SF(ONE),		   DF(ONE_MINUS_SRC_ALPHA) }, /* Over */
+	{ SF(ONE_MINUS_DST_ALPHA), DF(ONE) },		      /* OverReverse */
+	{ SF(DST_ALPHA),	   DF(ZERO) },                /* In */
+	{ SF(ZERO),		   DF(SRC_ALPHA) },           /* InReverse */
+	{ SF(ONE_MINUS_DST_ALPHA), DF(ZERO) },		      /* Out */
+	{ SF(ZERO),		   DF(ONE_MINUS_SRC_ALPHA) }, /* OutReverse */
+	{ SF(DST_ALPHA),	   DF(ONE_MINUS_SRC_ALPHA) }, /* Atop */
+	{ SF(ONE_MINUS_DST_ALPHA), DF(SRC_ALPHA) },	      /* AtopReverse */
+	{ SF(ONE_MINUS_DST_ALPHA), DF(ONE_MINUS_SRC_ALPHA) }, /* Xor */
+	{ SF(ONE),		   DF(ONE) },		      /* Add */
+};
+
+static inline bool needs_src_alpha(int op)
+{
+	return NV10PictOp[op].dst == DF(ONE_MINUS_SRC_ALPHA)
+		|| NV10PictOp[op].dst == DF(SRC_ALPHA);
+}
+
+static inline bool needs_src(int op)
+{
+	return NV10PictOp[op].src != DF(ZERO);
+}
+
+static inline bool effective_component_alpha(PicturePtr mask)
+{
+	return mask && mask->componentAlpha && PICT_FORMAT_RGB(mask->format);
+}
+
 static int NV10TexFormat(int ExaFormat)
 {
 	struct {int exa;int hw;} tex_format[] =
@@ -97,8 +135,6 @@ static Bool NV10CheckTexture(PicturePtr Picture)
 		return FALSE;
 	if (Picture->filter != PictFilterNearest && Picture->filter != PictFilterBilinear)
 		return FALSE;
-	if (Picture->componentAlpha)
-		return FALSE;
 	/* we cannot repeat on NV10 because NPOT textures do not support this. unfortunately. */
 	if (Picture->repeat != RepeatNone)
 		/* we can repeat 1x1 textures */
@@ -114,8 +150,6 @@ static Bool NV10CheckBuffer(PicturePtr Picture)
 
 	if ((w > 4096) || (h > 4096))
 		return FALSE;
-	if (Picture->componentAlpha)
-		return FALSE;
 	if (!NV10DstFormat(Picture->format))
 		return FALSE;
 	return TRUE;
@@ -265,6 +299,8 @@ NV10EXAFallbackInfo(char * reason, int op, PicturePtr pSrcPicture,
 		sprintf(out, "(%dx%d) ", pMaskPicture->pDrawable->width, pMaskPicture->pDrawable->height);
 		if ( pMaskPicture->repeat != RepeatNone )
 			strcat(out, "R ");
+		if ( pMaskPicture->componentAlpha )
+			strcat(out, "C ");
 		out+=strlen(out);
 	}
 	strcat(out, "\n");
@@ -296,19 +332,28 @@ Bool NV10EXACheckComposite(int	op,
 		NV10EXAFallbackInfo("dst", op, pSrcPicture, pMaskPicture, pDstPicture);
 		return FALSE;
 		}
-		
+
 	if (!NV10CheckTexture(pSrcPicture))
 		{
 		NV10EXAFallbackInfo("src", op, pSrcPicture, pMaskPicture, pDstPicture);
 		return FALSE;
 		}
-		
-	if ((pMaskPicture) &&(!NV10CheckTexture(pMaskPicture)))
-		{
-		NV10EXAFallbackInfo("mask", op, pSrcPicture, pMaskPicture, pDstPicture);
-		return FALSE;
+
+	if (pMaskPicture) {
+		if (!NV10CheckTexture(pMaskPicture)) {
+			NV10EXAFallbackInfo("mask", op, pSrcPicture,
+					    pMaskPicture, pDstPicture);
+			return FALSE;
 		}
-		
+
+		if (effective_component_alpha(pMaskPicture) &&
+		    needs_src(op) && needs_src_alpha(op)) {
+			NV10EXAFallbackInfo("ca-mask", op, pSrcPicture,
+					    pMaskPicture, pDstPicture);
+			return FALSE;
+		}
+	}
+
 	NV10EXAFallbackInfo("Accelerating", op, pSrcPicture, pMaskPicture, pDstPicture);
 	return TRUE;
 }
@@ -439,10 +484,16 @@ static void NV10SetBuffer(NVPtr pNv,PicturePtr Pict,PixmapPtr pixmap)
 	OUT_RING  (chan, 0);
 }
 
+#define RC_IN_ONE(chan, input)						\
+	(NV10TCL_RC_IN_##chan##_##input##_INPUT_ZERO			\
+	 | NV10TCL_RC_IN_##chan##_##input##_COMPONENT_USAGE_##chan	\
+	 | NV10TCL_RC_IN_##chan##_##input##_MAPPING_UNSIGNED_INVERT_NV)
+
 static void NV10SetRegCombs(NVPtr pNv, PicturePtr src, PicturePtr mask)
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celcius = pNv->Nv3D;
+	unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
 
 /*This can be a bit difficult to understand at first glance.
 Reg combiners are described here:
@@ -463,65 +514,61 @@ RC 1s are unused
 Final combiner uses default setup
 	
 */
+	if (PICT_FORMAT_A(src->format))
+		rc0_in_alpha |= NV10TCL_RC_IN_ALPHA_A_INPUT_TEXTURE0_ARB
+			| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA;
+	else
+		rc0_in_alpha |= RC_IN_ONE(ALPHA, A);
 
-unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
-unsigned int rc1_in_alpha = 0, rc1_in_rgb = 0;
-unsigned int color0 = 0, color1 = 0;
-#define A_ALPHA_ZERO (NV10TCL_RC_IN_ALPHA_A_INPUT_ZERO | NV10TCL_RC_IN_ALPHA_A_COMPONENT_USAGE_ALPHA)
-#define B_ALPHA_ZERO (NV10TCL_RC_IN_ALPHA_B_INPUT_ZERO | NV10TCL_RC_IN_ALPHA_B_COMPONENT_USAGE_ALPHA)
-#define C_ALPHA_ZERO (NV10TCL_RC_IN_ALPHA_C_INPUT_ZERO | NV10TCL_RC_IN_ALPHA_C_COMPONENT_USAGE_ALPHA)
-#define D_ALPHA_ZERO (NV10TCL_RC_IN_ALPHA_D_INPUT_ZERO | NV10TCL_RC_IN_ALPHA_D_COMPONENT_USAGE_ALPHA)
-	
-#define A_ALPHA_ONE (A_ALPHA_ZERO | (NV10TCL_RC_IN_ALPHA_A_MAPPING_UNSIGNED_INVERT_NV))
-#define B_ALPHA_ONE (B_ALPHA_ZERO | (NV10TCL_RC_IN_ALPHA_B_MAPPING_UNSIGNED_INVERT_NV))
-#define C_ALPHA_ONE (C_ALPHA_ZERO | (NV10TCL_RC_IN_ALPHA_C_MAPPING_UNSIGNED_INVERT_NV))
-#define D_ALPHA_ONE (D_ALPHA_ZERO | (NV10TCL_RC_IN_ALPHA_D_MAPPING_UNSIGNED_INVERT_NV))
-
-#define A_RGB_ZERO (NV10TCL_RC_IN_RGB_A_INPUT_ZERO | NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_RGB)
-#define B_RGB_ZERO (NV10TCL_RC_IN_RGB_B_INPUT_ZERO | NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB)
-#define C_RGB_ZERO (NV10TCL_RC_IN_RGB_C_INPUT_ZERO | NV10TCL_RC_IN_RGB_C_COMPONENT_USAGE_RGB)
-#define D_RGB_ZERO (NV10TCL_RC_IN_RGB_D_INPUT_ZERO | NV10TCL_RC_IN_RGB_D_COMPONENT_USAGE_RGB)
-
-#define A_RGB_ONE (A_RGB_ZERO | NV10TCL_RC_IN_RGB_A_MAPPING_UNSIGNED_INVERT_NV)
-#define B_RGB_ONE (B_RGB_ZERO | NV10TCL_RC_IN_RGB_B_MAPPING_UNSIGNED_INVERT_NV)
-#define C_RGB_ONE (C_RGB_ZERO | NV10TCL_RC_IN_RGB_C_MAPPING_UNSIGNED_INVERT_NV)
-#define D_RGB_ONE (D_RGB_ZERO | NV10TCL_RC_IN_RGB_D_MAPPING_UNSIGNED_INVERT_NV)
-
-	rc0_in_alpha |= C_ALPHA_ZERO | D_ALPHA_ZERO;
-	if (src->format == PICT_x8r8g8b8)
-		rc0_in_alpha |= A_ALPHA_ONE;
+	if (mask && PICT_FORMAT_A(mask->format))
+		rc0_in_alpha |= NV10TCL_RC_IN_RGB_B_INPUT_TEXTURE1_ARB
+			| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_ALPHA;
 	else
-		rc0_in_alpha |= 0x18000000;
+		rc0_in_alpha |= RC_IN_ONE(ALPHA, B);
+
+	if (effective_component_alpha(mask)) {
+		rc0_in_rgb |= NV10TCL_RC_IN_RGB_B_INPUT_TEXTURE1_ARB
+			| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB;
+
+		if (!needs_src_alpha(pNv->alu)) {
+			/*
+			 * The alpha channels won't be used for blending. Drop
+			 * them, as our pixels only have 4 components...
+			 * output_i = src_i * mask_i
+			 */
+			if (PICT_FORMAT_RGB(src->format))
+				rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
+					| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_RGB;
+
+		} else {
+			/*
+			 * The RGB channels won't be used for blending. Drop
+			 * them.
+			 * output_i = src_alpha * mask_i
+			 */
+			if (PICT_FORMAT_A(src->format))
+				rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
+					| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA;
+			else
+				rc0_in_rgb |= RC_IN_ONE(RGB, A);
+		}
 
-	if ( ! mask ) 
-		rc0_in_alpha |= B_ALPHA_ONE;
-	else 
-		if ( mask->format == PICT_x8r8g8b8 )  /*no alpha? ignore it*/
-			rc0_in_alpha |= B_ALPHA_ONE;
-		else
-			rc0_in_alpha |= 0x00190000; /*B = a_1*/
-
-	rc0_in_rgb |=  C_RGB_ZERO | D_RGB_ZERO;
-	if (src->format == PICT_a8 )
-		rc0_in_rgb |= A_RGB_ZERO;
-	else 
-		rc0_in_rgb |= 0x08000000; /*A = rgb_0*/
-
-	if ( ! mask )
-		rc0_in_rgb |= B_RGB_ONE;
-	else 
-		if (  mask->format == PICT_x8r8g8b8 )  /*no alpha? ignore it*/
-			rc0_in_rgb |= B_RGB_ONE;
+	} else {
+		if (PICT_FORMAT_RGB(src->format))
+			rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
+				| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_RGB;
+
+		if (mask && PICT_FORMAT_A(mask->format))
+			rc0_in_rgb |= NV10TCL_RC_IN_RGB_B_INPUT_TEXTURE1_ARB
+				| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_ALPHA;
 		else
-			rc0_in_rgb |= 0x00190000; /*B = a_1*/
-		
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 6);
+			rc0_in_rgb |= RC_IN_ONE(RGB, B);
+	}
+
+	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 1);
 	OUT_RING  (chan, rc0_in_alpha);
-	OUT_RING  (chan, rc1_in_alpha);
+	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_RGB(0), 1);
 	OUT_RING  (chan, rc0_in_rgb);
-	OUT_RING  (chan, rc1_in_rgb);
-	OUT_RING  (chan, color0); /*COLOR 0*/
-	OUT_RING  (chan, color1); /*COLOR 1*/
 }
 
 static void NV10SetRegCombs_A8plusA8(NVPtr pNv, int pass, int mask_out_bytes)
@@ -529,82 +576,70 @@ static void NV10SetRegCombs_A8plusA8(NVPtr pNv, int pass, int mask_out_bytes)
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celcius = pNv->Nv3D;
 	unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
-	unsigned int rc1_in_alpha = 0, rc1_in_rgb = 0;
 	unsigned int color0 = 0, color1 = 0;
 
-	if ( pass == 1)
-		{
-		if ( mask_out_bytes & 1 )
-			rc0_in_alpha = A_ALPHA_ZERO | B_ALPHA_ZERO | C_ALPHA_ZERO | D_ALPHA_ZERO;
-		else rc0_in_alpha = 0x19000000 | B_ALPHA_ONE | C_ALPHA_ZERO | D_ALPHA_ZERO;
-		
-		rc0_in_rgb = C_RGB_ZERO | D_RGB_ZERO;
-		
-		if ( mask_out_bytes & 2 )
-			rc0_in_rgb |= A_RGB_ZERO | B_RGB_ZERO;
-		else rc0_in_rgb |= 0x18000000 | 0x00010000;
-		
+	if (pass == 1) {
+		if (~mask_out_bytes & 1)
+			rc0_in_alpha |= NV10TCL_RC_IN_ALPHA_A_INPUT_TEXTURE1_ARB
+				| NV10TCL_RC_IN_ALPHA_A_COMPONENT_USAGE_ALPHA
+				| RC_IN_ONE(ALPHA, B);
+
+		if (~mask_out_bytes & 2)
+			rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
+				| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA
+				| NV10TCL_RC_IN_RGB_B_INPUT_CONSTANT_COLOR0_NV
+				| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB;
+
 		color0 = 0x00ff0000; /*R = 1 G = 0 B = 0*/
-		}
-	else {
-		rc0_in_alpha = A_ALPHA_ZERO | B_ALPHA_ZERO | C_ALPHA_ZERO | D_ALPHA_ZERO;
-		
-		rc0_in_rgb = 0;
-		
-		
-		
-		if ( mask_out_bytes & 8 )
-			rc0_in_rgb |= A_RGB_ZERO | B_RGB_ZERO;
-		else  rc0_in_rgb |= 0x18000000 | 0x00010000; /*A = a_0, B= cst color 0*/
-		
-		color0 = 0x000000ff; 
-		
-		if ( mask_out_bytes & 4)
-			rc0_in_rgb |= C_RGB_ZERO | D_RGB_ZERO;
-		else rc0_in_rgb |= 0x1900 | 0x02; /*C = a_1, D = cst color 1*/
-			
+	} else {
+		if (~mask_out_bytes & 8)
+			rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
+				| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA
+				| NV10TCL_RC_IN_RGB_B_INPUT_CONSTANT_COLOR0_NV
+				| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB;
+
+		color0 = 0x000000ff;
+
+		if (~mask_out_bytes & 4)
+			rc0_in_rgb |= NV10TCL_RC_IN_RGB_C_INPUT_TEXTURE1_ARB
+				| NV10TCL_RC_IN_RGB_C_COMPONENT_USAGE_ALPHA
+				| NV10TCL_RC_IN_RGB_D_INPUT_CONSTANT_COLOR1_NV
+				| NV10TCL_RC_IN_RGB_D_COMPONENT_USAGE_RGB;
+
 		color1 = 0x0000ff00; /*R = 0, G = 1, B = 0*/
-		}
+	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 6);
+	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 1);
 	OUT_RING  (chan, rc0_in_alpha);
-	OUT_RING  (chan, rc1_in_alpha);
+	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_RGB(0), 1);
 	OUT_RING  (chan, rc0_in_rgb);
-	OUT_RING  (chan, rc1_in_rgb);
-	OUT_RING  (chan, color0); /*COLOR 0*/
-	OUT_RING  (chan, color1); /*COLOR 1*/
+	BEGIN_RING(chan, celcius, NV10TCL_RC_COLOR(0), 2);
+	OUT_RING  (chan, color0);
+	OUT_RING  (chan, color1);
 }
 
 static void NV10SetPictOp(NVPtr pNv,int op)
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celcius = pNv->Nv3D;
-	struct {int src;int dst;} pictops[] =
-	{
-		{0x0000,0x0000}, /* PictOpClear */
-		{0x0001,0x0000}, /* PictOpSrc */
-		{0x0000,0x0001}, /* PictOpDst */
-		{0x0001,0x0303}, /* PictOpOver */
-		{0x0305,0x0001}, /* PictOpOverReverse */
-		{0x0304,0x0000}, /* PictOpIn */
-		{0x0000,0x0302}, /* PictOpInReverse */
-		{0x0305,0x0000}, /* PictOpOut */
-		{0x0000,0x0303}, /* PictOpOutReverse */
-		{0x0304,0x0303}, /* PictOpAtop */
-		{0x0305,0x0302}, /* PictOpAtopReverse */
-		{0x0305,0x0303}, /* PictOpXor */
-		{0x0001,0x0001}, /* PictOpAdd */
-	};
-	int src_factor = pictops[op].src;
-	int dst_factor = pictops[op].dst;
-	
-	if (src_factor == NV10TCL_BLEND_FUNC_SRC_ONE_MINUS_DST_ALPHA &&
+	struct nv10_pictop *nv10_op = &NV10PictOp[op];
+	int src_factor = nv10_op->src;
+	int dst_factor = nv10_op->dst;
+
+	if (src_factor == SF(ONE_MINUS_DST_ALPHA) &&
 	    !PICT_FORMAT_A(pNv->pdpict->format))
 		/* ONE_MINUS_DST_ALPHA doesn't always do the right thing for
 		 * framebuffers without alpha channel. But it's the same as
 		 * ZERO in that case.
 		 */
-		src_factor = NV10TCL_BLEND_FUNC_SRC_ZERO;
+		src_factor = SF(ZERO);
+
+	if (effective_component_alpha(pNv->pmpict)) {
+		if (dst_factor == DF(SRC_ALPHA))
+			dst_factor = DF(SRC_COLOR);
+		else if (dst_factor == DF(ONE_MINUS_SRC_ALPHA))
+			dst_factor = DF(ONE_MINUS_SRC_COLOR);
+	}
 
 	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_SRC, 2);
 	OUT_RING  (chan, src_factor);
@@ -1001,6 +1036,13 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	BEGIN_RING(chan, celcius, NV10TCL_TX_ENABLE(0), 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 6);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
 	BEGIN_RING(chan, celcius, NV10TCL_RC_OUT_ALPHA(0), 6);
 	OUT_RING  (chan, 0x00000c00);
 	OUT_RING  (chan, 0);
-- 
1.6.3.3
