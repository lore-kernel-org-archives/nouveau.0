From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2] nv10/exa: Spring-cleaning
Date: Thu,  5 Nov 2009 03:35:11 +0100
Message-ID: <1257388511-5061-1-git-send-email-currojerez@riseup.net>
References: <1257356702-24730-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1257356702-24730-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

* Kill the A8+A8 hack. Recent enough X servers (>=1.7) fall back to
  ARGB glyphs for drivers not supporting A8 render targets.

* Kill all the global state. It doesn't matter a lot yet but it might
  if we get multicard working at some point.

* Other random clean-ups with no functional changes.

Some numbers from x11perf -aa10text -aa24text -comppixwin10 -comppixwin500:

* Before, with A glyphs:
   12000000 trep @   0.0025 msec (394000.0/sec): Char in 80-char aa line (Charter 10)
    3200000 trep @   0.0119 msec ( 84300.0/sec): Char in 30-char aa line (Charter 24)
    8000000 trep @   0.0036 msec (280000.0/sec): Composite 10x10 from pixmap to window
      60000 trep @   0.4813 msec (  2080.0/sec): Composite 500x500 from pixmap to window

* After, ARGB glyphs:
   20000000 trep @   0.0015 msec (649000.0/sec): Char in 80-char aa line (Charter 10)
    4800000 trep @   0.0057 msec (175000.0/sec): Char in 30-char aa line (Charter 24)
    8000000 trep @   0.0036 msec (280000.0/sec): Composite 10x10 from pixmap to window
      60000 trep @   0.4813 msec (  2080.0/sec): Composite 500x500 from pixmap to window

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nv10_exa.c |  921 ++++++++++++++++++++++----------------------------------
 1 files changed, 361 insertions(+), 560 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index fe86fd7..70f2fbc 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -2,6 +2,7 @@
  * Copyright 2007 Stephane Marchesin
  * Copyright 2007 Arthur Huillet
  * Copyright 2007 Peter Winters
+ * Copyright 2009 Francisco Jerez
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -28,24 +29,83 @@
 
 #include "nv_include.h"
 
-typedef struct nv10_exa_state {
-	Bool have_mask;
-	Bool is_a8_plus_a8;
-	struct {
-		PictTransformPtr transform;
-		float width;
-		float height;
-	} unit[2];
-} nv10_exa_state_t;
-static nv10_exa_state_t state;
+/* Texture/Render target formats. */
+static struct pict_format {
+	int exa;
+	int hw;
+} nv10_tex_format_pot[] = {
+	{ PICT_a8,       0x80  },
+	{ PICT_r5g6b5,	 0x280 },
+	{ PICT_x8r8g8b8, 0x300 },
+	{ PICT_a8r8g8b8, 0x300 },
+	{},
+
+}, nv10_tex_format_rect[] = {
+	{ PICT_a8,       0x980 },
+	{ PICT_r5g6b5,   0x880 },
+	{ PICT_x8r8g8b8, 0x900 },
+	{ PICT_a8r8g8b8, 0x900 },
+	{},
+
+}, nv20_tex_format_rect[] = {
+	{ PICT_a8,	 0xd80 },
+	{ PICT_r5g6b5,   0x880 },
+	{ PICT_x8r8g8b8, 0x900 },
+	{ PICT_a8r8g8b8, 0x900 },
+	{},
+
+}, nv10_rt_format[] = {
+	{ PICT_r5g6b5,	 0x103 },
+	{ PICT_x8r8g8b8, 0x108 },
+	{ PICT_a8r8g8b8, 0x108 },
+	{},
+};
+
+static int
+get_tex_format(PicturePtr pict)
+{
+	ScrnInfoPtr pScrn = xf86Screens[pict->pDrawable->pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+
+	/* If repeat is set we're always handling a 1x1 texture with
+	 * ARGB/XRGB destination, in that case we change the format to
+	 * use the POT (swizzled) matching format.
+	 */
+	struct pict_format *format =
+		pict->repeat != RepeatNone ? nv10_tex_format_pot :
+		pNv->Architecture == NV_ARCH_20 ? nv20_tex_format_rect :
+		nv10_tex_format_rect;
+
+	for (; format->hw; format++) {
+		if (format->exa == pict->format)
+			return format->hw;
+	}
+
+	return 0;
+}
+
+static int
+get_rt_format(PicturePtr pict)
+{
+	struct pict_format *format = nv10_rt_format;
+
+	for (; format->hw; format++) {
+		if (format->exa == pict->format)
+			return format->hw;
+	}
+
+	return 0;
+}
 
+/* Blending functions. */
 #define SF(x) NV10TCL_BLEND_FUNC_SRC_##x
 #define DF(x) NV10TCL_BLEND_FUNC_DST_##x
 
-static struct nv10_pictop {
+static struct pict_op {
 	int src;
 	int dst;
-} NV10PictOp [] = {
+
+} nv10_pict_op[] = {
 	{ SF(ZERO),		   DF(ZERO) },		      /* Clear */
 	{ SF(ONE),		   DF(ZERO) },		      /* Src */
 	{ SF(ZERO),		   DF(ONE) },		      /* Dst */
@@ -61,131 +121,91 @@ static struct nv10_pictop {
 	{ SF(ONE),		   DF(ONE) },		      /* Add */
 };
 
-static inline bool needs_src_alpha(int op)
+static inline Bool
+needs_src_alpha(int op)
 {
-	return NV10PictOp[op].dst == DF(ONE_MINUS_SRC_ALPHA)
-		|| NV10PictOp[op].dst == DF(SRC_ALPHA);
+	return nv10_pict_op[op].dst == DF(ONE_MINUS_SRC_ALPHA)
+		|| nv10_pict_op[op].dst == DF(SRC_ALPHA);
 }
 
-static inline bool needs_src(int op)
+static inline Bool
+needs_src(int op)
 {
-	return NV10PictOp[op].src != DF(ZERO);
+	return nv10_pict_op[op].src != DF(ZERO);
 }
 
-static inline bool effective_component_alpha(PicturePtr mask)
+static inline Bool
+effective_component_alpha(PicturePtr mask)
 {
 	return mask && mask->componentAlpha && PICT_FORMAT_RGB(mask->format);
 }
 
-static int NV10TexFormat(int ExaFormat)
-{
-	struct {int exa;int hw;} tex_format[] =
-	{
-		{PICT_a8r8g8b8,	0x900},
-		{PICT_x8r8g8b8,	0x900},
-		{PICT_r5g6b5, 0x880}, /*this one was only tested with rendercheck*/
-		/*{PICT_a1r5g5b5,	NV10TCL_TX_FORMAT_FORMAT_R5G5B5A1},
-		{PICT_a4r4g4b4,	NV10TCL_TX_FORMAT_FORMAT_R4G4B4A4},*/
-		{PICT_a8,	0x980}, /*this is a NV1x only format, corresponding NV2x is 0xD80, we hack it in below*/
-	};
-
-	int i;
-	for (i = 0; i < sizeof(tex_format) / sizeof(tex_format[0]); i++) {
-		if (tex_format[i].exa == ExaFormat)
-			return tex_format[i].hw;
-	}
-
-	return 0;
-}
-
-static int NV10DstFormat(int ExaFormat)
-{
-	struct {int exa;int hw;} dst_format[] =
-	{
-		{PICT_a8r8g8b8,	0x108},
-		{PICT_x8r8g8b8, 0x108},
-		{PICT_r5g6b5,	0x103}
-	};
-
-	int i;
-	for (i = 0; i < sizeof(dst_format) / sizeof(dst_format[0]); i++) {
-		if (dst_format[i].exa == ExaFormat)
-			return dst_format[i].hw;
-	}
-
-	return 0;
-}
-
-static Bool NV10CheckTexture(PicturePtr Picture)
+static Bool
+check_texture(PicturePtr pict)
 {
 	int w, h;
 
-	if (!Picture->pDrawable)
+	if (!pict->pDrawable)
 		NOUVEAU_FALLBACK("Solid and gradient pictures unsupported\n");
 
-	w = Picture->pDrawable->width;
-	h = Picture->pDrawable->height;
+	w = pict->pDrawable->width;
+	h = pict->pDrawable->height;
 
-	if ((w > 2046) || (h > 2046))
+	if (w > 2046 || h > 2046)
 		NOUVEAU_FALLBACK("picture too large, %dx%d\n", w, h);
 
-	if (!NV10TexFormat(Picture->format))
+	if (!get_tex_format(pict))
 		return FALSE;
-	if (Picture->filter != PictFilterNearest && Picture->filter != PictFilterBilinear)
+
+	if (pict->filter != PictFilterNearest &&
+	    pict->filter != PictFilterBilinear)
 		return FALSE;
-	/* we cannot repeat on NV10 because NPOT textures do not support this. unfortunately. */
-	if (Picture->repeat != RepeatNone)
+
+	/* We cannot repeat on NV10 because NPOT textures do not
+	 * support this. unfortunately. */
+	if (pict->repeat != RepeatNone)
 		/* we can repeat 1x1 textures */
 		if (!(w == 1 && h == 1))
 			return FALSE;
+
 	return TRUE;
 }
 
-static Bool NV10CheckBuffer(PicturePtr Picture)
+static Bool
+check_render_target(PicturePtr pict)
 {
-	int w = Picture->pDrawable->width;
-	int h = Picture->pDrawable->height;
+	int w = pict->pDrawable->width;
+	int h = pict->pDrawable->height;
 
-	if ((w > 4096) || (h > 4096))
-		return FALSE;
-	if (!NV10DstFormat(Picture->format))
+	if (w > 4096 || h > 4096)
 		return FALSE;
-	return TRUE;
-}
 
-static Bool NV10CheckPictOp(int op)
-{
-	if (op >= PictOpSaturate) {
-		/*we do no saturate, disjoint, conjoint, though we could do e.g. DisjointClear which really is Clear */
+	if (!get_rt_format(pict))
 		return FALSE;
-	}
+
 	return TRUE;
 }
 
-/* Check if the current operation is a doable A8 + A8 */
-/* A8 destination is a special case, because we do it by having the card think 
-it's ARGB. For now we support PictOpAdd which is the only important op for this dst format, 
-and without transformation or funny things.*/
-static Bool NV10Check_A8plusA8_Feasability(PicturePtr src, PicturePtr msk, PicturePtr dst, int op)
+static Bool
+check_pict_op(int op)
 {
-#if X_BYTE_ORDER == X_BIG_ENDIAN
-	return FALSE;
-#endif
-	if ((!msk) && (src->format == PICT_a8) && (dst->format == PICT_a8) && (!src->transform) &&
-	    (op == PictOpAdd) && (src->repeat == RepeatNone)) {
-		return TRUE;
-	}
-	return FALSE;
+	/* We do no saturate, disjoint, conjoint, though we
+	 * could do e.g. DisjointClear which really is
+	 * Clear. */
+	return op < PictOpSaturate;
 }
 
 #if 0
-static void NV10EXAFallbackInfo(char *reason, int op, PicturePtr pSrcPicture,
-				PicturePtr pMaskPicture, PicturePtr pDstPicture)
+static void
+print_fallback_info(char *reason, int op, PicturePtr src, PicturePtr mask,
+		    PicturePtr dst)
 {
 	char out2[4096];
 	char *out = out2;
+
 	sprintf(out, "%s  ", reason);
-	out = out + strlen(out);
+	out += strlen(out);
+
 	switch (op) {
 	case PictOpClear:
 		sprintf(out, "PictOpClear ");
@@ -208,8 +228,9 @@ static void NV10EXAFallbackInfo(char *reason, int op, PicturePtr pSrcPicture,
 	default:
 		sprintf(out, "PictOp%d ", op);
 	}
-	out = out + strlen(out);
-	switch (pSrcPicture->format) {
+	out += strlen(out);
+
+	switch (src->format) {
 	case PICT_a8r8g8b8:
 		sprintf(out, "A8R8G8B8 ");
 		break;
@@ -229,16 +250,18 @@ static void NV10EXAFallbackInfo(char *reason, int op, PicturePtr pSrcPicture,
 		sprintf(out, "A1 ");
 		break;
 	default:
-		sprintf(out, "%x ", pSrcPicture->format);
+		sprintf(out, "%x ", src->format);
 	}
 	out += strlen(out);
-	sprintf(out, "(%dx%d) ", pSrcPicture->pDrawable->width, pSrcPicture->pDrawable->height);
-	if (pSrcPicture->repeat != RepeatNone)
+
+	sprintf(out, "(%dx%d) ", src->pDrawable->width,
+		src->pDrawable->height);
+	if (src->repeat != RepeatNone)
 		strcat(out, "R ");
 	strcat(out, "-> ");
 	out += strlen(out);
 
-	switch (pDstPicture->format) {
+	switch (dst->format) {
 	case PICT_a8r8g8b8:
 		sprintf(out, "A8R8G8B8 ");
 		break;
@@ -258,17 +281,20 @@ static void NV10EXAFallbackInfo(char *reason, int op, PicturePtr pSrcPicture,
 		sprintf(out, "A1  ");
 		break;
 	default:
-		sprintf(out, "%x  ", pDstPicture->format);
+		sprintf(out, "%x  ", dst->format);
 	}
 	out += strlen(out);
-	sprintf(out, "(%dx%d) ", pDstPicture->pDrawable->width, pDstPicture->pDrawable->height);
-	if (pDstPicture->repeat != RepeatNone)
+
+	sprintf(out, "(%dx%d) ", dst->pDrawable->width,
+		dst->pDrawable->height);
+	if (dst->repeat != RepeatNone)
 		strcat(out, "R ");
 	out += strlen(out);
-	if (!pMaskPicture)
+
+	if (!mask)
 		sprintf(out, "& NONE");
 	else {
-		switch (pMaskPicture->format) {
+		switch (mask->format) {
 		case PICT_a8r8g8b8:
 			sprintf(out, "& A8R8G8B8 ");
 			break;
@@ -285,116 +311,98 @@ static void NV10EXAFallbackInfo(char *reason, int op, PicturePtr pSrcPicture,
 			sprintf(out, "& A1  ");
 			break;
 		default:
-			sprintf(out, "& %x  ", pMaskPicture->format);
+			sprintf(out, "& %x  ", mask->format);
 		}
 		out += strlen(out);
-		sprintf(out, "(%dx%d) ", pMaskPicture->pDrawable->width, pMaskPicture->pDrawable->height);
-		if (pMaskPicture->repeat != RepeatNone)
+
+		sprintf(out, "(%dx%d) ", mask->pDrawable->width,
+			mask->pDrawable->height);
+		if (mask->repeat != RepeatNone)
 			strcat(out, "R ");
-		if (pMaskPicture->componentAlpha)
+		if (mask->componentAlpha)
 			strcat(out, "C ");
 		out += strlen(out);
 	}
 	strcat(out, "\n");
+
 	xf86DrvMsg(0, X_INFO, "%s", out2);
 }
 #else
-#define NV10EXAFallbackInfo(X,Y,Z,S,T) do { ; } while (0)
+#define print_fallback_info(...)
 #endif
 
-Bool NV10EXACheckComposite(int op,
-			PicturePtr pSrcPicture,
-			PicturePtr pMaskPicture,
-			PicturePtr pDstPicture)
+Bool
+NV10EXACheckComposite(int op, PicturePtr src, PicturePtr mask, PicturePtr dst)
 {
-
-	if (NV10Check_A8plusA8_Feasability(pSrcPicture, pMaskPicture, pDstPicture, op)) {
-		NV10EXAFallbackInfo("Hackelerating", op, pSrcPicture, pMaskPicture, pDstPicture);
-		return TRUE;
-	}
-
-	if (!NV10CheckPictOp(op)) {
-		NV10EXAFallbackInfo("pictop", op, pSrcPicture, pMaskPicture, pDstPicture);
+	if (!check_pict_op(op)) {
+		print_fallback_info("pictop", op, src, mask, dst);
 		return FALSE;
 	}
-	if (!NV10CheckBuffer(pDstPicture)) {
-		NV10EXAFallbackInfo("dst", op, pSrcPicture, pMaskPicture, pDstPicture);
+
+	if (!check_render_target(dst)) {
+		print_fallback_info("dst", op, src, mask, dst);
 		return FALSE;
 	}
 
-	if (!NV10CheckTexture(pSrcPicture)) {
-		NV10EXAFallbackInfo("src", op, pSrcPicture, pMaskPicture, pDstPicture);
+	if (!check_texture(src)) {
+		print_fallback_info("src", op, src, mask, dst);
 		return FALSE;
 	}
 
-	if (pMaskPicture) {
-		if (!NV10CheckTexture(pMaskPicture)) {
-			NV10EXAFallbackInfo("mask", op, pSrcPicture,
-					    pMaskPicture, pDstPicture);
+	if (mask) {
+		if (!check_texture(mask)) {
+			print_fallback_info("mask", op, src,
+					    mask, dst);
 			return FALSE;
 		}
 
-		if (effective_component_alpha(pMaskPicture) &&
+		if (effective_component_alpha(mask) &&
 		    needs_src(op) && needs_src_alpha(op)) {
-			NV10EXAFallbackInfo("ca-mask", op, pSrcPicture,
-					    pMaskPicture, pDstPicture);
+			print_fallback_info("ca-mask", op, src,
+					    mask, dst);
 			return FALSE;
 		}
 	}
 
-	NV10EXAFallbackInfo("Accelerating", op, pSrcPicture, pMaskPicture, pDstPicture);
+	print_fallback_info("Accelerating", op, src, mask, dst);
 	return TRUE;
 }
 
-static Bool NV10SetTexture(NVPtr pNv, int unit, PicturePtr Pict, PixmapPtr pixmap)
+static Bool
+setup_texture(NVPtr pNv, int unit, PicturePtr pict, PixmapPtr pixmap)
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celsius = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pixmap);
 	unsigned delta = nouveau_pixmap_offset(pixmap);
-	int log2w = log2i(Pict->pDrawable->width);
-	int log2h = log2i(Pict->pDrawable->height);
-	int w;
+	long w = pict->pDrawable->width,
+	     h = pict->pDrawable->height;
 	unsigned int txfmt =
-			(NV10TCL_TX_FORMAT_WRAP_T_CLAMP_TO_EDGE) |
-			(NV10TCL_TX_FORMAT_WRAP_S_CLAMP_TO_EDGE) |
-			(log2w<<20) |
-			(log2h<<16) |
-			(1<<12) | /* lod == 1 */
-			0x51 /* UNK */;
+		NV10TCL_TX_FORMAT_WRAP_T_CLAMP_TO_EDGE |
+		NV10TCL_TX_FORMAT_WRAP_S_CLAMP_TO_EDGE |
+		log2i(w) << 20 | log2i(h) << 16 |
+		1 << 12 | /* lod == 1 */
+		get_tex_format(pict) |
+		0x51 /* UNK */;
 
 	BEGIN_RING(chan, celsius, NV10TCL_TX_OFFSET(unit), 1);
 	if (OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD))
 		return FALSE;
 
-	/* if repeat is set we're always handling a 1x1 texture with ARGB/XRGB destination, 
-	in that case we change the format	to use the POT (swizzled) matching format */
-	if (Pict->repeat != RepeatNone)
-	{
-		if (Pict->format == PICT_a8)
-			txfmt |= 0x80; /* A8 */
-		else if (Pict->format == PICT_r5g6b5 )
-			txfmt |= 0x280; /* R5G6B5 */
-		else
-			txfmt |= 0x300; /* ARGB format */
-	} else {
-		if (pNv->Architecture == NV_ARCH_20 && Pict->format == PICT_a8)
-			txfmt |= 0xd80;
-		else
-			txfmt |= NV10TexFormat(Pict->format);
-		w = Pict->pDrawable->width;
-		/* NPOT_SIZE expects an even number for width, we can round up uneven
-		* numbers here because EXA always gives 64 byte aligned pixmaps
-		* and for all formats we support 64 bytes represents an even number
-		* of pixels
-		*/
+	if (pict->repeat == RepeatNone) {
+		/* NPOT_SIZE expects an even number for width, we can
+		 * round up uneven numbers here because EXA always
+		 * gives 64 byte aligned pixmaps and for all formats
+		 * we support 64 bytes represents an even number of
+		 * pixels
+		 */
 		w = (w + 1) &~ 1;
 
 		BEGIN_RING(chan, celsius, NV10TCL_TX_NPOT_PITCH(unit), 1);
 		OUT_RING  (chan, exaGetPixmapPitch(pixmap) << 16);
 
 		BEGIN_RING(chan, celsius, NV10TCL_TX_NPOT_SIZE(unit), 1);
-		OUT_RING  (chan, (w<<16) | Pict->pDrawable->height);
+		OUT_RING  (chan, w << 16 | h);
 	}
 
 	BEGIN_RING(chan, celsius, NV10TCL_TX_FORMAT(unit), 1 );
@@ -404,218 +412,135 @@ static Bool NV10SetTexture(NVPtr pNv, int unit, PicturePtr Pict, PixmapPtr pixma
 	OUT_RING  (chan, NV10TCL_TX_ENABLE_ENABLE);
 
 	BEGIN_RING(chan, celsius, NV10TCL_TX_FILTER(unit), 1);
-	if (Pict->filter == PictFilterNearest)
-		OUT_RING  (chan, (NV10TCL_TX_FILTER_MAGNIFY_NEAREST) |
-				(NV10TCL_TX_FILTER_MINIFY_NEAREST));
+	if (pict->filter == PictFilterNearest)
+		OUT_RING(chan, (NV10TCL_TX_FILTER_MAGNIFY_NEAREST |
+				NV10TCL_TX_FILTER_MINIFY_NEAREST));
 	else
-		OUT_RING  (chan, (NV10TCL_TX_FILTER_MAGNIFY_LINEAR) |
-				(NV10TCL_TX_FILTER_MINIFY_LINEAR));
+		OUT_RING(chan, (NV10TCL_TX_FILTER_MAGNIFY_LINEAR |
+				NV10TCL_TX_FILTER_MINIFY_LINEAR));
 
-	state.unit[unit].width		= (float)pixmap->drawable.width;
-	state.unit[unit].height		= (float)pixmap->drawable.height;
-	state.unit[unit].transform	= Pict->transform;
 	return TRUE;
 }
 
-static Bool NV10SetBuffer(NVPtr pNv, PicturePtr Pict, PixmapPtr pixmap)
+static Bool
+setup_render_target(NVPtr pNv, PicturePtr pict, PixmapPtr pixmap)
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celsius = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pixmap);
 	unsigned delta = nouveau_pixmap_offset(pixmap);
-	int i;
-	int x = 0;
-	int y = 0;
-	int w = 2048;
-	int h = 2048;
-
-	BEGIN_RING(chan, celsius, NV10TCL_RT_FORMAT, 4);
-	if (state.is_a8_plus_a8) {
-		/*A8 + A8 hack */
-		OUT_RING  (chan, NV10DstFormat(PICT_a8r8g8b8));
-	} else {
-		OUT_RING  (chan, NV10DstFormat(Pict->format));
-	}
 
-	OUT_RING  (chan, ((uint32_t)exaGetPixmapPitch(pixmap) << 16) |(uint32_t)exaGetPixmapPitch(pixmap));
+	BEGIN_RING(chan, celsius, NV10TCL_RT_FORMAT, 2);
+	OUT_RING  (chan, get_rt_format(pict));
+	OUT_RING  (chan, (exaGetPixmapPitch(pixmap) << 16 |
+			  exaGetPixmapPitch(pixmap)));
+
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_OFFSET, 1);
 	if (OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR))
 		return FALSE;
-	OUT_RING  (chan, 0);
 
-	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 2);
-	OUT_RING  (chan, (w<<16)|x);
-	OUT_RING  (chan, (h<<16)|y);
-	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_MODE, 1); /* clip_mode */
-	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
-	OUT_RING  (chan, ((w-1+x)<<16)|x|0x08000800);
-	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
-	OUT_RING  (chan, ((h-1+y)<<16)|y|0x08000800);
+	return TRUE;
+}
 
-	BEGIN_RING(chan, celsius, NV10TCL_PROJECTION_MATRIX(0), 16);
-	for(i=0;i<16;i++)
-		if (i/4==i%4)
-			OUT_RINGf (chan, 1.0f);
-		else
-			OUT_RINGf (chan, 0.0f);
+/*
+ * This can be a bit difficult to understand at first glance.  Reg
+ * combiners are described here:
+ * http://icps.u-strasbg.fr/~marchesin/perso/extensions/NV/register_combiners.html
+ *
+ * Single texturing setup, without honoring vertex colors (non default
+ * setup) is: Alpha RC 0 : a_0 * 1 + 0 * 0 RGB RC 0 : rgb_0 * 1 + 0 *
+ * 0 RC 1s are unused Final combiner uses default setup
+ *
+ * Default setup uses vertex rgb/alpha in place of 1s above, but we
+ * don't need that in 2D.
+ *
+ * Multi texturing setup, where we do TEX0 in TEX1 (masking) is:
+ * Alpha RC 0 : a_0 * a_1 + 0 * 0
+ * RGB RC0 : rgb_0 * a_1 + 0 * 0
+ * RC 1s are unused
+ * Final combiner uses default setup
+ */
 
-	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_RANGE_NEAR, 2);
-	OUT_RING  (chan, 0);
-#if SCREEN_BPP == 32
-	OUT_RINGf (chan, 16777216.0);
-#else
-	OUT_RINGf (chan, 65536.0);
-#endif
-	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_SCALE_X, 4);
-	OUT_RINGf (chan, -2048.0);
-	OUT_RINGf (chan, -2048.0);
-	OUT_RINGf (chan, 0);
-	OUT_RING  (chan, 0);
+/* Bind the combiner variable <input> to a constant 1. */
+#define RC_IN_ONE(input)						\
+	(NV10TCL_RC_IN_RGB_##input##_INPUT_ZERO |			\
+	 NV10TCL_RC_IN_RGB_##input##_COMPONENT_USAGE_ALPHA |		\
+	 NV10TCL_RC_IN_RGB_##input##_MAPPING_UNSIGNED_INVERT_NV)
 
-	return TRUE;
-}
+/* Bind the combiner variable <input> to the specified channel from
+ * the texture unit <unit>. */
+#define RC_IN_TEX(input, chan, unit)					\
+	(NV10TCL_RC_IN_RGB_##input##_INPUT_TEXTURE##unit##_ARB |	\
+	 NV10TCL_RC_IN_RGB_##input##_COMPONENT_USAGE_##chan)
 
-#define RC_IN_ONE(chan, input)						\
-	(NV10TCL_RC_IN_##chan##_##input##_INPUT_ZERO			\
-	 | NV10TCL_RC_IN_##chan##_##input##_COMPONENT_USAGE_##chan	\
-	 | NV10TCL_RC_IN_##chan##_##input##_MAPPING_UNSIGNED_INVERT_NV)
+/* Bind the combiner variable <input> to the specified channel from
+ * the constant color <unit>. */
+#define RC_IN_COLOR(input, chan, unit)					\
+	(NV10TCL_RC_IN_RGB_##input##_INPUT_CONSTANT_COLOR##unit##_NV | \
+	 NV10TCL_RC_IN_RGB_##input##_COMPONENT_USAGE_##chan)
 
-static void NV10SetRegCombs(NVPtr pNv, PicturePtr src, PicturePtr mask)
+static void
+setup_combiners(NVPtr pNv, PicturePtr src, PicturePtr mask)
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celsius = pNv->Nv3D;
-	unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
-
-/*This can be a bit difficult to understand at first glance.
-Reg combiners are described here:
-http://icps.u-strasbg.fr/~marchesin/perso/extensions/NV/register_combiners.html
-	
-Single texturing setup, without honoring vertex colors (non default setup) is:
-Alpha RC 0 : a_0  * 1 + 0 * 0
-RGB RC 0 : rgb_0 * 1 + 0 * 0
-RC 1s are unused
-Final combiner uses default setup
-	
-Default setup uses vertex rgb/alpha in place of 1s above, but we don't need that in 2D.
-	
-Multi texturing setup, where we do TEX0 in TEX1 (masking) is:
-Alpha RC 0 : a_0 * a_1 + 0 * 0
-RGB RC0 : rgb_0 * a_1 + 0 * 0
-RC 1s are unused
-Final combiner uses default setup
-	
-*/
+	uint32_t rc_in_alpha = 0, rc_in_rgb = 0;
+
 	if (PICT_FORMAT_A(src->format))
-		rc0_in_alpha |= NV10TCL_RC_IN_ALPHA_A_INPUT_TEXTURE0_ARB
-			| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA;
+		rc_in_alpha |= RC_IN_TEX(A, ALPHA, 0);
 	else
-		rc0_in_alpha |= RC_IN_ONE(ALPHA, A);
+		rc_in_alpha |= RC_IN_ONE(A);
 
 	if (mask && PICT_FORMAT_A(mask->format))
-		rc0_in_alpha |= NV10TCL_RC_IN_RGB_B_INPUT_TEXTURE1_ARB
-			| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_ALPHA;
+		rc_in_alpha |= RC_IN_TEX(B, ALPHA, 1);
 	else
-		rc0_in_alpha |= RC_IN_ONE(ALPHA, B);
+		rc_in_alpha |= RC_IN_ONE(B);
 
 	if (effective_component_alpha(mask)) {
-		rc0_in_rgb |= NV10TCL_RC_IN_RGB_B_INPUT_TEXTURE1_ARB
-			| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB;
-
 		if (!needs_src_alpha(pNv->alu)) {
-			/*
-			 * The alpha channels won't be used for blending. Drop
+			/* The alpha channels won't be used for blending. Drop
 			 * them, as our pixels only have 4 components...
 			 * output_i = src_i * mask_i
 			 */
 			if (PICT_FORMAT_RGB(src->format))
-				rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
-					| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_RGB;
-
+				rc_in_rgb |= RC_IN_TEX(A, RGB, 0);
 		} else {
-			/*
-			 * The RGB channels won't be used for blending. Drop
+			/* The RGB channels won't be used for blending. Drop
 			 * them.
 			 * output_i = src_alpha * mask_i
 			 */
 			if (PICT_FORMAT_A(src->format))
-				rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
-					| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA;
+				rc_in_rgb |= RC_IN_TEX(A, ALPHA, 0);
 			else
-				rc0_in_rgb |= RC_IN_ONE(RGB, A);
+				rc_in_rgb |= RC_IN_ONE(A);
 		}
 
+		rc_in_rgb |= RC_IN_TEX(B, RGB, 1);
+
 	} else {
 		if (PICT_FORMAT_RGB(src->format))
-			rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
-				| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_RGB;
+			rc_in_rgb |= RC_IN_TEX(A, RGB, 0);
 
 		if (mask && PICT_FORMAT_A(mask->format))
-			rc0_in_rgb |= NV10TCL_RC_IN_RGB_B_INPUT_TEXTURE1_ARB
-				| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_ALPHA;
+			rc_in_rgb |= RC_IN_TEX(B, ALPHA, 1);
 		else
-			rc0_in_rgb |= RC_IN_ONE(RGB, B);
+			rc_in_rgb |= RC_IN_ONE(B);
 	}
 
 	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_ALPHA(0), 1);
-	OUT_RING  (chan, rc0_in_alpha);
+	OUT_RING  (chan, rc_in_alpha);
 	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_RGB(0), 1);
-	OUT_RING  (chan, rc0_in_rgb);
+	OUT_RING  (chan, rc_in_rgb);
 }
 
-static void NV10SetRegCombs_A8plusA8(NVPtr pNv, int pass, int mask_out_bytes)
-{
-	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celsius = pNv->Nv3D;
-	unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
-	unsigned int color0 = 0, color1 = 0;
-
-	if (pass == 1) {
-		if (~mask_out_bytes & 1)
-			rc0_in_alpha |= NV10TCL_RC_IN_ALPHA_A_INPUT_TEXTURE1_ARB
-				| NV10TCL_RC_IN_ALPHA_A_COMPONENT_USAGE_ALPHA
-				| RC_IN_ONE(ALPHA, B);
-
-		if (~mask_out_bytes & 2)
-			rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
-				| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA
-				| NV10TCL_RC_IN_RGB_B_INPUT_CONSTANT_COLOR0_NV
-				| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB;
-
-		color0 = 0x00ff0000; /*R = 1 G = 0 B = 0*/
-	} else {
-		if (~mask_out_bytes & 8)
-			rc0_in_rgb |= NV10TCL_RC_IN_RGB_A_INPUT_TEXTURE0_ARB
-				| NV10TCL_RC_IN_RGB_A_COMPONENT_USAGE_ALPHA
-				| NV10TCL_RC_IN_RGB_B_INPUT_CONSTANT_COLOR0_NV
-				| NV10TCL_RC_IN_RGB_B_COMPONENT_USAGE_RGB;
-
-		color0 = 0x000000ff;
-
-		if (~mask_out_bytes & 4)
-			rc0_in_rgb |= NV10TCL_RC_IN_RGB_C_INPUT_TEXTURE1_ARB
-				| NV10TCL_RC_IN_RGB_C_COMPONENT_USAGE_ALPHA
-				| NV10TCL_RC_IN_RGB_D_INPUT_CONSTANT_COLOR1_NV
-				| NV10TCL_RC_IN_RGB_D_COMPONENT_USAGE_RGB;
-
-		color1 = 0x0000ff00; /*R = 0, G = 1, B = 0*/
-	}
-
-	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_ALPHA(0), 1);
-	OUT_RING  (chan, rc0_in_alpha);
-	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_RGB(0), 1);
-	OUT_RING  (chan, rc0_in_rgb);
-	BEGIN_RING(chan, celsius, NV10TCL_RC_COLOR(0), 2);
-	OUT_RING  (chan, color0);
-	OUT_RING  (chan, color1);
-}
-
-static void NV10SetPictOp(NVPtr pNv, int op)
+static void
+setup_blend_function(NVPtr pNv)
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celsius = pNv->Nv3D;
-	struct nv10_pictop *nv10_op = &NV10PictOp[op];
-	int src_factor = nv10_op->src;
-	int dst_factor = nv10_op->dst;
+	struct pict_op *op = &nv10_pict_op[pNv->alu];
+	int src_factor = op->src;
+	int dst_factor = op->dst;
 
 	if (src_factor == SF(ONE_MINUS_DST_ALPHA) &&
 	    !PICT_FORMAT_A(pNv->pdpict->format))
@@ -649,294 +574,150 @@ NV10StateCompositeReemit(struct nouveau_channel *chan)
 				pNv->pspix, pNv->pmpix, pNv->pdpix);
 }
 
-Bool NV10EXAPrepareComposite(int op,
-			     PicturePtr pSrcPicture,
-			     PicturePtr pMaskPicture,
-			     PicturePtr pDstPicture,
-			     PixmapPtr  pSrc,
-			     PixmapPtr  pMask,
-			     PixmapPtr  pDst)
+Bool
+NV10EXAPrepareComposite(int op,
+			PicturePtr pict_src,
+			PicturePtr pict_mask,
+			PicturePtr pict_dst,
+			PixmapPtr src,
+			PixmapPtr mask,
+			PixmapPtr dst)
 {
-	ScrnInfoPtr pScrn = xf86Screens[pDst->drawable.pScreen->myNum];
+	ScrnInfoPtr pScrn = xf86Screens[dst->drawable.pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
 
 	if (MARK_RING(chan, 128, 3))
 		return FALSE;
 
-	state.is_a8_plus_a8 = FALSE;
-	state.have_mask=(pMaskPicture!=NULL);
-
 	pNv->alu = op;
-	pNv->pspict = pSrcPicture;
-	pNv->pmpict = pMaskPicture;
-	pNv->pdpict = pDstPicture;
-	pNv->pspix = pSrc;
-	pNv->pmpix = pMask;
-	pNv->pdpix = pDst;
-	chan->flush_notify = NV10StateCompositeReemit;
-
-	if (NV10Check_A8plusA8_Feasability(pSrcPicture, pMaskPicture, pDstPicture, op)) {
-		state.is_a8_plus_a8 = TRUE;
-		if (!NV10SetBuffer(pNv, pDstPicture, pDst) ||
-		    !NV10SetTexture(pNv, 0, pSrcPicture, pSrc) ||
-		    !NV10SetTexture(pNv, 1, pSrcPicture, pSrc)) {
-			MARK_UNDO(chan);
-			return FALSE;
-		}
-		NV10SetPictOp(pNv, op);
-		return TRUE;
-	}
+	pNv->pspict = pict_src;
+	pNv->pmpict = pict_mask;
+	pNv->pdpict = pict_dst;
+	pNv->pspix = src;
+	pNv->pmpix = mask;
+	pNv->pdpix = dst;
 
 	/* Set dst format */
-	if (!NV10SetBuffer(pNv, pDstPicture, pDst)) {
-		MARK_UNDO(chan);
-		return FALSE;
-	}
+	if (!setup_render_target(pNv, pict_dst, dst))
+		goto fail;
 
 	/* Set src format */
-	if (!NV10SetTexture(pNv, 0, pSrcPicture, pSrc)) {
-		MARK_UNDO(chan);
-		return FALSE;
-	}
+	if (!setup_texture(pNv, 0, pict_src, src))
+		goto fail;
 
 	/* Set mask format */
-	if (pMaskPicture) {
-		if (!NV10SetTexture(pNv, 1, pMaskPicture, pMask)) {
-			MARK_UNDO(chan);
-			return FALSE;
-		}
-	}
+	if (mask &&
+	    !setup_texture(pNv, 1, pict_mask, mask))
+		goto fail;
 
-	NV10SetRegCombs(pNv, pSrcPicture, pMaskPicture);
+	/* Set the register combiners up. */
+	setup_combiners(pNv, pict_src, pict_mask);
 
 	/* Set PictOp */
-	NV10SetPictOp(pNv, op);
+	setup_blend_function(pNv);
+
+	chan->flush_notify = NV10StateCompositeReemit;
 
 	return TRUE;
-}
 
-static inline void NV10Vertex(NVPtr pNv, float vx, float vy, float tx, float ty)
-{
-	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celsius = pNv->Nv3D;
+fail:
+	MARK_UNDO(chan);
 
-	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX0_2F_S, 2);
-	OUT_RINGf (chan, tx);
-	OUT_RINGf (chan, ty);
-	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_POS_3F_X, 3);
-	OUT_RINGf (chan, vx);
-	OUT_RINGf (chan, vy);
-	OUT_RINGf (chan, 0.f);
+	return FALSE;
 }
 
-static inline void NV10MVertex(NVPtr pNv, float vx, float vy, float t0x, float t0y, float t1x, float t1y)
+#define QUAD(x, y, w, h)					\
+	{{{ IntToxFixed(x),     IntToxFixed(y),     xFixed1 }},	\
+	 {{ IntToxFixed(x + w), IntToxFixed(y),     xFixed1 }},	\
+	 {{ IntToxFixed(x + w), IntToxFixed(y + h), xFixed1 }},	\
+	 {{ IntToxFixed(x),     IntToxFixed(y + h), xFixed1 }}}
+
+#define MAP(f, p, v, ...) do {						\
+		int __i;						\
+		for (__i = 0; __i < sizeof(v)/sizeof((v)[0]); __i++)	\
+			f(p, __i, v, ## __VA_ARGS__);			\
+	} while (0);
+
+#define xFixedToFloat(v) \
+	((float)xFixedToInt((v)) + ((float)xFixedFrac(v) / 65536.0))
+
+#define OUT_RINGi(chan, v, i)				\
+	OUT_RINGf(chan, xFixedToFloat((v).vector[i]))
+
+static inline void
+emit_vertex(NVPtr pNv, int i, PictVector pos[],
+	    PictVector tex0[], PictVector tex1[])
 {
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celsius = pNv->Nv3D;
 
 	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX0_2F_S, 2);
-	OUT_RINGf (chan, t0x);
-	OUT_RINGf (chan, t0y);
-	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX1_2F_S, 2);
-	OUT_RINGf (chan, t1x);
-	OUT_RINGf (chan, t1y);
+	OUT_RINGi (chan, tex0[i], 0);
+	OUT_RINGi (chan, tex0[i], 1);
+
+	if (tex1) {
+		BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX1_2F_S, 2);
+		OUT_RINGi (chan, tex1[i], 0);
+		OUT_RINGi (chan, tex1[i], 1);
+	}
+
 	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_POS_3F_X, 3);
-	OUT_RINGf (chan, vx);
-	OUT_RINGf (chan, vy);
-	OUT_RINGf (chan, 0.f);
+	OUT_RINGi (chan, pos[i], 0);
+	OUT_RINGi (chan, pos[i], 1);
+	OUT_RINGf (chan, 0);
 }
 
-#define xFixedToFloat(v) \
-	((float)xFixedToInt((v)) + ((float)xFixedFrac(v) / 65536.0))
-
-static void
-NV10EXATransformCoord(PictTransformPtr t, int x, int y, float sx, float sy,
-					  float *x_ret, float *y_ret)
+static inline void
+transform_vertex(PictTransformPtr t, int i, PictVector vs[])
 {
-	PictVector v;
-
-	if (t) {
-		v.vector[0] = IntToxFixed(x);
-		v.vector[1] = IntToxFixed(y);
-		v.vector[2] = xFixed1;
-		PictureTransformPoint(t, &v);
-		*x_ret = xFixedToFloat(v.vector[0]);
-		*y_ret = xFixedToFloat(v.vector[1]);
-	} else {
-		*x_ret = (float)x;
-		*y_ret = (float)y;
-	}
+	if  (t)
+		PictureTransformPoint(t, &vs[i]);
 }
 
-
-void NV10EXAComposite(PixmapPtr pDst,
-			int	  srcX,
-			int	  srcY,
-			int	  maskX,
-			int	  maskY,
-			int	  dstX,
-			int	  dstY,
-			int	  width,
-			int	  height)
+void
+NV10EXAComposite(PixmapPtr pix_dst,
+		 int srcX, int srcY,
+		 int maskX, int maskY,
+		 int dstX, int dstY,
+		 int width, int height)
 {
-	ScrnInfoPtr pScrn = xf86Screens[pDst->drawable.pScreen->myNum];
+	ScrnInfoPtr pScrn = xf86Screens[pix_dst->drawable.pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *celsius = pNv->Nv3D;
-	float sX0, sX1, sX2, sY0, sY1, sY2, sX3, sY3;
-	float mX0, mX1, mX2, mY0, mY1, mY2, mX3, mY3;
+	PicturePtr mask = pNv->pmpict,
+		src = pNv->pspict;
+	PictVector dstq[4] = QUAD(dstX, dstY, width, height),
+		maskq[4] = QUAD(maskX, maskY, width, height),
+		srcq[4] = QUAD(srcX, srcY, width, height);
+
+	MAP(transform_vertex, src->transform, srcq);
+	if (mask)
+		MAP(transform_vertex, mask->transform, maskq);
 
 	WAIT_RING (chan, 64);
 	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 	OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_QUADS);
 
-	NV10EXATransformCoord(state.unit[0].transform, srcX, srcY,
-			      state.unit[0].width,
-			      state.unit[0].height, &sX0, &sY0);
-	NV10EXATransformCoord(state.unit[0].transform,
-			      srcX + width, srcY,
-			      state.unit[0].width,
-			      state.unit[0].height, &sX1, &sY1);
-	NV10EXATransformCoord(state.unit[0].transform,
-			      srcX + width, srcY + height,
-			      state.unit[0].width,
-			      state.unit[0].height, &sX2, &sY2);
-	NV10EXATransformCoord(state.unit[0].transform,
-			      srcX, srcY + height,
-			      state.unit[0].width,
-			      state.unit[0].height, &sX3, &sY3);
-
-	if (state.is_a8_plus_a8) {
-		/*We do A8 + A8 in 2-pass : setup the source texture as A8 twice, 
-			with different tex coords, do B and G on first pass
-		Then setup again and do R and A on second pass
-		*/
-		int part_pos_dX = 0;
-		int part_pos_sX = 0;
-		int mask_out_bytes = 0;
-
-		part_pos_dX = (dstX & ~3) >> 2;	/*we start at the 4byte boundary to the left of the image */
-		part_pos_sX = sX0 + (dstX & ~3) - dstX;
-
-		/*xf86DrvMsg(0, X_INFO, "drawing - srcX %f dstX %d w %d\n", sX0, dstX, width);*/
-		for (; part_pos_dX <= (((dstX + width) & ~3) >> 2); part_pos_sX += 4, part_pos_dX++) {
-			mask_out_bytes = 0;
-			if (part_pos_dX == (dstX & ~3) >> 2) {
-				/*we're slightly on the left of the image, bytes to mask out */
-				/*xf86DrvMsg(0, X_INFO, "on left border...\n");*/
-				switch (dstX - (dstX & ~3)) {	/*mask out the extra pixels on the left */
-				case 4:
-					mask_out_bytes |= 1 << 0;
-				case 3:
-					mask_out_bytes |= 1 << 1;
-				case 2:
-					mask_out_bytes |= 1 << 2;
-				case 1:
-					mask_out_bytes |= 1 << 3;
-				case 0:
-					break;
-				}
-
-				/*mask out extra pixels on the right, in case the picture never touches an alignment marker */
-				switch (width + (dstX & 3)) {
-				case 0:
-					mask_out_bytes |= 1 << 3;
-				case 1:
-					mask_out_bytes |= 1 << 2;
-				case 2:
-					mask_out_bytes |= 1 << 1;
-				case 3:
-					mask_out_bytes |= 1 << 0;
-				default:
-					break;
-				}
-			} else if (part_pos_dX == (((dstX + width) & ~3) >> 2)) {
-				/*xf86DrvMsg(0, X_INFO, "on right border...\n"); */
-				switch (4 - ((dstX + width) & 3)) {
-				case 4:
-					mask_out_bytes |= 1 << 3;
-				case 3:
-					mask_out_bytes |= 1 << 2;
-				case 2:
-					mask_out_bytes |= 1 << 1;
-				case 1:
-					mask_out_bytes |= 1 << 0;
-				case 0:
-					break;
-				}
-			}
-
-			/*Pass number 0*/
-			
-			NV10SetRegCombs_A8plusA8(pNv, 0, mask_out_bytes);
-			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
-			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_QUADS);		
-					
-			NV10MVertex(pNv , part_pos_dX	, dstY              , part_pos_sX, sY0, part_pos_sX + 1, sY0);
-			NV10MVertex(pNv , part_pos_dX + 1, dstY              , part_pos_sX, sY0, part_pos_sX + 1, sY0);
-			NV10MVertex(pNv , part_pos_dX + 1, dstY + height, part_pos_sX,  sY2, part_pos_sX + 1, sY2);
-			NV10MVertex(pNv , part_pos_dX	, dstY + height, part_pos_sX, sY2, part_pos_sX + 1, sY2);
-			
-			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
-			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_STOP);
-			
-			/*Pass number 1*/
-
-			NV10SetRegCombs_A8plusA8(pNv, 1, mask_out_bytes);
-			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
-			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_QUADS);		
-					
-			NV10MVertex(pNv , part_pos_dX, dstY              , part_pos_sX + 2, sY0, part_pos_sX + 3, sY0);
-			NV10MVertex(pNv , part_pos_dX + 1 , dstY              , part_pos_sX + 2, sY0, part_pos_sX + 3, sY0);
-			NV10MVertex(pNv , part_pos_dX + 1 , dstY + height, part_pos_sX + 2, sY2, part_pos_sX + 3, sY2);
-			NV10MVertex(pNv , part_pos_dX, dstY + height, part_pos_sX + 2, sY2, part_pos_sX + 3, sY2);
-
-			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
-			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_STOP);
-			
-			}
-	} else if (state.have_mask) {
-		NV10EXATransformCoord(state.unit[1].transform, maskX, maskY,
-				      state.unit[1].width,
-				      state.unit[1].height, &mX0, &mY0);
-		NV10EXATransformCoord(state.unit[1].transform,
-				      maskX + width, maskY,
-				      state.unit[1].width,
-				      state.unit[1].height, &mX1, &mY1);
-		NV10EXATransformCoord(state.unit[1].transform,
-				      maskX + width, maskY + height,
-				      state.unit[1].width,
-				      state.unit[1].height, &mX2, &mY2);
-		NV10EXATransformCoord(state.unit[1].transform,
-				      maskX, maskY + height,
-				      state.unit[1].width,
-				      state.unit[1].height, &mX3, &mY3);
-		NV10MVertex(pNv , dstX         ,          dstY,sX0 , sY0 , mX0 , mY0);
-		NV10MVertex(pNv , dstX + width ,          dstY,sX1 , sY1 , mX1 , mY1);
-		NV10MVertex(pNv , dstX + width , dstY + height,sX2 , sY2 , mX2 , mY2);
-		NV10MVertex(pNv , dstX         , dstY + height,sX3 , sY3 , mX3 , mY3);
-	} else {
-		NV10Vertex(pNv , dstX         ,          dstY , sX0 , sY0);
-		NV10Vertex(pNv , dstX + width ,          dstY , sX1 , sY1);
-		NV10Vertex(pNv , dstX + width , dstY + height , sX2 , sY2);
-		NV10Vertex(pNv , dstX         , dstY + height , sX3 , sY3);
-	}
+	MAP(emit_vertex, pNv, dstq, srcq, mask ? maskq : NULL);
 
 	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 	OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_STOP);
 }
 
-void NV10EXADoneComposite(PixmapPtr pDst)
+void
+NV10EXADoneComposite(PixmapPtr dst)
 {
-	ScrnInfoPtr pScrn = xf86Screens[pDst->drawable.pScreen->myNum];
+	ScrnInfoPtr pScrn = xf86Screens[dst->drawable.pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
 
 	chan->flush_notify = NULL;
 }
 
-Bool NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
+Bool
+NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 {
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
@@ -978,13 +759,19 @@ Bool NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0);
 
 	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 2);
+	OUT_RING  (chan, 2048 << 16 | 0);
+	OUT_RING  (chan, 2048 << 16 | 0);
+
+	BEGIN_RING(chan, celsius, NV10TCL_ZETA_OFFSET, 1);
 	OUT_RING  (chan, 0);
+
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_MODE, 1);
 	OUT_RING  (chan, 0);
 
 	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
-	OUT_RING  (chan, (0x7ff<<16)|0x800);
+	OUT_RING  (chan, 0x7ff << 16 | 0x800800);
 	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
-	OUT_RING  (chan, (0x7ff<<16)|0x800);
+	OUT_RING  (chan, 0x7ff << 16 | 0x800800);
 
 	for (i = 1; i < 8; i++) {
 		BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(i), 1);
@@ -1113,9 +900,9 @@ Bool NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE_ENABLE, 1);
 	OUT_RING  (chan, 0);
 	BEGIN_RING(chan, celsius, NV10TCL_TX_GEN_S(0), 8);
-	for (i = 0; i < 8; i++) {
+	for (i = 0; i < 8; i++)
 		OUT_RING  (chan, 0);
-	}
+
 	BEGIN_RING(chan, celsius, NV10TCL_FOG_EQUATION_CONSTANT, 3);
 	OUT_RING  (chan, 0x3fc00000);	/* -1.50 */
 	OUT_RING  (chan, 0xbdb8aa0a);	/* -0.09 */
@@ -1135,6 +922,20 @@ Bool NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	BEGIN_RING(chan, celsius, NV10TCL_COLOR_MASK, 1);
 	OUT_RING  (chan, 0x01010101);
 
+	BEGIN_RING(chan, celsius, NV10TCL_PROJECTION_MATRIX(0), 16);
+	for(i = 0; i < 16; i++)
+		OUT_RINGf(chan, i/4 == i%4 ? 1.0 : 0.0);
+
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_RANGE_NEAR, 2);
+	OUT_RING  (chan, 0);
+	OUT_RINGf (chan, 65536.0);
+
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_SCALE_X, 4);
+	OUT_RINGf (chan, -2048.0);
+	OUT_RINGf (chan, -2048.0);
+	OUT_RINGf (chan, 0);
+	OUT_RING  (chan, 0);
+
 	/* Set vertex component */
 	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_COL_4F_R, 4);
 	OUT_RINGf (chan, 1.0);
-- 
1.6.4.4
