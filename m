From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv30/exa : cleanup from nv40 exa
Date: Tue, 20 Apr 2010 13:58:45 +0200
Message-ID: <1271764725-19797-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

This has two purposes :
- cleaner code
- reduce the diff between nv30 and nv40 exa for a possible nvfx_exa merge ?

The main differences seem to be that nv30 uses rect texture format (and does
not support repeat on that).  Then there are some minor changes in TX_FORMAT
RT_FORMAT and TEX_FILTER usage.  And NVAccelInitNVx0TCL look complete
different.

Tested with:
./rendercheck -t fill,dcoords,scoords,mcoords,tscoords,tmcoords,triangles,bug7366
./rendercheck -f a8r8g8b8,x8r8g8b8,r5g6b5,a8,a8b8g8r8,x8b8g8r8,x1r5g5b5
              -o Clear,Src,Dst,Over,OverReverse,In,InReverse,Out,OutReverse,Atop
              -t blend
(restricted blend test to supported formats and operation. exluded
composite,cacomposite,gradients,repeat tests which seem to take forever)

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv30_exa.c |  393 ++++++++++++++++++++++++--------------------------------
 src/nv40_exa.c |    2 +-
 2 files changed, 166 insertions(+), 229 deletions(-)

diff --git a/src/nv30_exa.c b/src/nv30_exa.c
index b736fb3..2cd7d32 100644
--- a/src/nv30_exa.c
+++ b/src/nv30_exa.c
@@ -56,26 +56,28 @@ typedef struct nv30_exa_state {
 static nv30_exa_state_t exa_state;
 #define NV30EXA_STATE nv30_exa_state_t *state = &exa_state
 
+#define NV34TCL_RT_FORMAT_COLOR_X1R5G5B5 0x00000002
 static nv_pict_surface_format_t
 NV30SurfaceFormat[] = {
-	{ PICT_a8r8g8b8	, 0x148 },
-	{ PICT_a8b8g8r8	, 0x150 },
-	{ PICT_x8r8g8b8	, 0x145 },
-	{ PICT_x8b8g8r8	, 0x14f },
-	{ PICT_r5g6b5	, 0x143 },
-	{ PICT_a8       , 0x149 },
-	{ PICT_x1r5g5b5	, 0x142 },
+	{ PICT_a8r8g8b8	, NV34TCL_RT_FORMAT_COLOR_A8R8G8B8 },
+	{ PICT_x8r8g8b8	, NV34TCL_RT_FORMAT_COLOR_X8R8G8B8 },
+	{ PICT_r5g6b5	, NV34TCL_RT_FORMAT_COLOR_R5G6B5   },
+	{ PICT_a8       , NV34TCL_RT_FORMAT_COLOR_B8       },
+	{ PICT_a8b8g8r8	, NV34TCL_RT_FORMAT_COLOR_A8B8G8R8 },
+	{ PICT_x8b8g8r8	, NV34TCL_RT_FORMAT_COLOR_X8B8G8R8 },
+	{ PICT_x1r5g5b5	, NV34TCL_RT_FORMAT_COLOR_X1R5G5B5 },
+	{ -1, ~0 }
 };
 
 static nv_pict_surface_format_t *
 NV30_GetPictSurfaceFormat(int format)
 {
-	int i;
+	int i = 0;
 
-	for(i=0;i<sizeof(NV30SurfaceFormat)/sizeof(NV30SurfaceFormat[0]);i++)
-	{
+	while (NV30SurfaceFormat[i].pict_fmt != -1) {
 		if (NV30SurfaceFormat[i].pict_fmt == format)
 			return &NV30SurfaceFormat[i];
+		i++;
 	}
 
 	return NULL;
@@ -123,106 +125,72 @@ NV30EXAHackupA8Shaders(ScrnInfoPtr pScrn)
 	}
 }
 
-/* should be in nouveau_reg.h at some point.. */
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_X_ZERO	 0
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_X_ONE	 1
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_X_S1		 2
-
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_X_SHIFT	14
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_Y_SHIFT	12
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_Z_SHIFT	10
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_W_SHIFT	 8
-
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_X		 3
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_Y		 2
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_Z		 1
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_W		 0
-
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_SHIFT	 6
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_Y_SHIFT	 4
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_Z_SHIFT	 2
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_W_SHIFT	 0
-
-#define _(r,tf,ts0x,ts0y,ts0z,ts0w,ts1x,ts1y,ts1z,ts1w)                       \
-  {                                                                           \
-  PICT_##r,                                                                   \
-  (tf),                                                                       \
-  (NV34TCL_TX_SWIZZLE_UNIT_S0_X_##ts0x << NV34TCL_TX_SWIZZLE_UNIT_S0_X_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S0_X_##ts0y << NV34TCL_TX_SWIZZLE_UNIT_S0_Y_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S0_X_##ts0z << NV34TCL_TX_SWIZZLE_UNIT_S0_Z_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S0_X_##ts0w << NV34TCL_TX_SWIZZLE_UNIT_S0_W_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S1_X_##ts1x << NV34TCL_TX_SWIZZLE_UNIT_S1_X_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S1_X_##ts1y << NV34TCL_TX_SWIZZLE_UNIT_S1_Y_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S1_X_##ts1z << NV34TCL_TX_SWIZZLE_UNIT_S1_Z_SHIFT)|\
-  (NV34TCL_TX_SWIZZLE_UNIT_S1_X_##ts1w << NV34TCL_TX_SWIZZLE_UNIT_S1_W_SHIFT)\
+#define _(r,tf,ts0x,ts0y,ts0z,ts0w,ts1x,ts1y,ts1z,ts1w)             \
+  {                                                                 \
+  PICT_##r, NV34TCL_TX_FORMAT_FORMAT_##tf,                          \
+  NV34TCL_TX_SWIZZLE_S0_X_##ts0x | NV34TCL_TX_SWIZZLE_S0_Y_##ts0y | \
+  NV34TCL_TX_SWIZZLE_S0_Z_##ts0z | NV34TCL_TX_SWIZZLE_S0_W_##ts0w | \
+  NV34TCL_TX_SWIZZLE_S1_X_##ts1x | NV34TCL_TX_SWIZZLE_S1_Y_##ts1y | \
+  NV34TCL_TX_SWIZZLE_S1_Z_##ts1z | NV34TCL_TX_SWIZZLE_S1_W_##ts1w,  \
   }
 
 static nv_pict_texture_format_t
 NV30TextureFormat[] = {
-	_(a8r8g8b8, 0x12,   S1,   S1,   S1,   S1, X, Y, Z, W),
-	_(a8b8g8r8, 0x12,   S1,   S1,   S1,   S1, Z, Y, X, W),
-	_(x8r8g8b8, 0x12,   S1,   S1,   S1,  ONE, X, Y, Z, W),
-	_(x8b8g8r8, 0x12,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+	_(a8r8g8b8, A8R8G8B8_RECT,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(a8b8g8r8, A8R8G8B8_RECT,   S1,   S1,   S1,   S1, Z, Y, X, W),
+	_(x8r8g8b8, A8R8G8B8_RECT,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(x8b8g8r8, A8R8G8B8_RECT,   S1,   S1,   S1,  ONE, Z, Y, X, W),
 
-	_(a1r5g5b5, 0x10,   S1,   S1,   S1,   S1, X, Y, Z, W),
-	_(x1r5g5b5, 0x10,   S1,   S1,   S1,  ONE, X, Y, Z, W),
-	_(a1b5g5r5, 0x10,   S1,   S1,   S1,   S1, Z, Y, X, W),
-	_(x1b5g5r5, 0x10,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+	_(a1r5g5b5, A1R5G5B5_RECT,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(x1r5g5b5, A1R5G5B5_RECT,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(a1b5g5r5, A1R5G5B5_RECT,   S1,   S1,   S1,   S1, Z, Y, X, W),
+	_(x1b5g5r5, A1R5G5B5_RECT,   S1,   S1,   S1,  ONE, Z, Y, X, W),
 
-	_(x4r4g4b4, 0x1d,   S1,   S1,   S1,  ONE, X, Y, Z, W),
-	_(a4r4g4b4, 0x1d,   S1,   S1,   S1,   S1, X, Y, Z, W),
-	_(x4b4g4r4, 0x1d,   S1,   S1,   S1,  ONE, Z, Y, X, W),
-	_(a4b4g4r4, 0x1d,   S1,   S1,   S1,   S1, Z, Y, X, W),
+	_(x4r4g4b4, A4R4G4B4_RECT,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(a4r4g4b4, A4R4G4B4_RECT,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(x4b4g4r4, A4R4G4B4_RECT,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+	_(a4b4g4r4, A4R4G4B4_RECT,   S1,   S1,   S1,   S1, Z, Y, X, W),
 
-	_(      a8, 0x1b, ZERO, ZERO, ZERO,   S1, X, X, X, X),
+	_(      a8,       A8_RECT, ZERO, ZERO, ZERO,   S1, X, X, X, X),
 
-	_(  r5g6b5, 0x11,   S1,   S1,   S1,  ONE, X, Y, Z, W),
-	_(  b5g6r5, 0x11,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+	_(  r5g6b5,   R5G6B5_RECT,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(  b5g6r5,   R5G6B5_RECT,   S1,   S1,   S1,  ONE, Z, Y, X, W),
 };
-
+#undef _
 
 static nv_pict_texture_format_t *
 NV30_GetPictTextureFormat(int format)
 {
-	int i;
+	int i = 0;
 
-	for(i=0;i<sizeof(NV30TextureFormat)/sizeof(NV30TextureFormat[0]);i++)
-	{
+	while (NV30TextureFormat[i].pict_fmt != -1) {
 		if (NV30TextureFormat[i].pict_fmt == format)
 			return &NV30TextureFormat[i];
+		i++;
 	}
 
 	return NULL;
 }
 
-#define NV34TCL_BF_ZERO                                     0x0000
-#define NV34TCL_BF_ONE                                      0x0001
-#define NV34TCL_BF_SRC_COLOR                                0x0300
-#define NV34TCL_BF_ONE_MINUS_SRC_COLOR                      0x0301
-#define NV34TCL_BF_SRC_ALPHA                                0x0302
-#define NV34TCL_BF_ONE_MINUS_SRC_ALPHA                      0x0303
-#define NV34TCL_BF_DST_ALPHA                                0x0304
-#define NV34TCL_BF_ONE_MINUS_DST_ALPHA                      0x0305
-#define NV34TCL_BF_DST_COLOR                                0x0306
-#define NV34TCL_BF_ONE_MINUS_DST_COLOR                      0x0307
-#define NV34TCL_BF_ALPHA_SATURATE                           0x0308
-#define BF(bf) NV34TCL_BF_##bf
-
+#define SF(bf) (NV34TCL_BLEND_FUNC_SRC_RGB_##bf |                              \
+		NV34TCL_BLEND_FUNC_SRC_ALPHA_##bf)
+#define DF(bf) (NV34TCL_BLEND_FUNC_DST_RGB_##bf |                              \
+		NV34TCL_BLEND_FUNC_DST_ALPHA_##bf)
 static nv_pict_op_t 
 NV30PictOp[] = {
-/* Clear       */ { 0, 0, BF(               ZERO), BF(               ZERO) },
-/* Src         */ { 0, 0, BF(                ONE), BF(               ZERO) },
-/* Dst         */ { 0, 0, BF(               ZERO), BF(                ONE) },
-/* Over        */ { 1, 0, BF(                ONE), BF(ONE_MINUS_SRC_ALPHA) },
-/* OverReverse */ { 0, 1, BF(ONE_MINUS_DST_ALPHA), BF(                ONE) },
-/* In          */ { 0, 1, BF(          DST_ALPHA), BF(               ZERO) },
-/* InReverse   */ { 1, 0, BF(               ZERO), BF(          SRC_ALPHA) },
-/* Out         */ { 0, 1, BF(ONE_MINUS_DST_ALPHA), BF(               ZERO) },
-/* OutReverse  */ { 1, 0, BF(               ZERO), BF(ONE_MINUS_SRC_ALPHA) },
-/* Atop        */ { 1, 1, BF(          DST_ALPHA), BF(ONE_MINUS_SRC_ALPHA) },
-/* AtopReverse */ { 1, 1, BF(ONE_MINUS_DST_ALPHA), BF(          SRC_ALPHA) },
-/* Xor         */ { 1, 1, BF(ONE_MINUS_DST_ALPHA), BF(ONE_MINUS_SRC_ALPHA) },
-/* Add         */ { 0, 0, BF(                ONE), BF(                ONE) }
+/* Clear       */ { 0, 0, SF(               ZERO), DF(               ZERO) },
+/* Src         */ { 0, 0, SF(                ONE), DF(               ZERO) },
+/* Dst         */ { 0, 0, SF(               ZERO), DF(                ONE) },
+/* Over        */ { 1, 0, SF(                ONE), DF(ONE_MINUS_SRC_ALPHA) },
+/* OverReverse */ { 0, 1, SF(ONE_MINUS_DST_ALPHA), DF(                ONE) },
+/* In          */ { 0, 1, SF(          DST_ALPHA), DF(               ZERO) },
+/* InReverse   */ { 1, 0, SF(               ZERO), DF(          SRC_ALPHA) },
+/* Out         */ { 0, 1, SF(ONE_MINUS_DST_ALPHA), DF(               ZERO) },
+/* OutReverse  */ { 1, 0, SF(               ZERO), DF(ONE_MINUS_SRC_ALPHA) },
+/* Atop        */ { 1, 1, SF(          DST_ALPHA), DF(ONE_MINUS_SRC_ALPHA) },
+/* AtopReverse */ { 1, 1, SF(ONE_MINUS_DST_ALPHA), DF(          SRC_ALPHA) },
+/* Xor         */ { 1, 1, SF(ONE_MINUS_DST_ALPHA), DF(ONE_MINUS_SRC_ALPHA) },
+/* Add         */ { 0, 0, SF(                ONE), DF(                ONE) }
 };
 
 static nv_pict_op_t *
@@ -230,24 +198,6 @@ NV30_GetPictOpRec(int op)
 {
 	if (op >= PictOpSaturate)
 		return NULL;
-#if 0
-	switch(op)
-	{
-		case 0:ErrorF("Op Clear\n");break;
-		case 1:ErrorF("Op Src\n");break;
-		case 2:ErrorF("Op Dst\n");break;
-		case 3:ErrorF("Op Over\n");break;
-		case 4:ErrorF("Op OverReverse\n");break;
-		case 5:ErrorF("Op In\n");break;
-		case 6:ErrorF("Op InReverse\n");break;
-		case 7:ErrorF("Op Out\n");break;
-		case 8:ErrorF("Op OutReverse\n");break;
-		case 9:ErrorF("Op Atop\n");break;
-		case 10:ErrorF("Op AtopReverse\n");break;
-		case 11:ErrorF("Op Xor\n");break;
-		case 12:ErrorF("Op Add\n");break;
-	}
-#endif
 	return &NV30PictOp[op];
 }
 
@@ -265,36 +215,36 @@ NV30_SetupBlend(ScrnInfoPtr pScrn, nv_pict_op_t *blend,
 
 	if (blend->dst_alpha) {
 		if (!PICT_FORMAT_A(dest_format)) {
-			if (sblend == BF(DST_ALPHA)) {
-				sblend = BF(ONE);
-			} else if (sblend == BF(ONE_MINUS_DST_ALPHA)) {
-				sblend = BF(ZERO);
+			if (sblend == SF(DST_ALPHA)) {
+				sblend = SF(ONE);
+			} else if (sblend == SF(ONE_MINUS_DST_ALPHA)) {
+				sblend = SF(ZERO);
 			}
 		} else if (dest_format == PICT_a8) {
-			if (sblend == BF(DST_ALPHA)) {
-				sblend = BF(DST_COLOR);
-			} else if (sblend == BF(ONE_MINUS_DST_ALPHA)) {
-				sblend = BF(ONE_MINUS_DST_COLOR);
+			if (sblend == SF(DST_ALPHA)) {
+				sblend = SF(DST_COLOR);
+			} else if (sblend == SF(ONE_MINUS_DST_ALPHA)) {
+				sblend = SF(ONE_MINUS_DST_COLOR);
 			}
 		}
 	}
 
 	if (blend->src_alpha && (component_alpha || dest_format == PICT_a8)) {
-		if (dblend == BF(SRC_ALPHA)) {
-			dblend = BF(SRC_COLOR);
-		} else if (dblend == BF(ONE_MINUS_SRC_ALPHA)) {
-			dblend = BF(ONE_MINUS_SRC_COLOR);
+		if (dblend == DF(SRC_ALPHA)) {
+			dblend = DF(SRC_COLOR);
+		} else if (dblend == DF(ONE_MINUS_SRC_ALPHA)) {
+			dblend = DF(ONE_MINUS_SRC_COLOR);
 		}
 	}
 
-	if (sblend == BF(ONE) && dblend == BF(ZERO)) {
+	if (sblend == SF(ONE) && dblend == DF(ZERO)) {
 		BEGIN_RING(chan, rankine, NV34TCL_BLEND_FUNC_ENABLE, 1);
 		OUT_RING  (chan, 0);
 	} else {
 		BEGIN_RING(chan, rankine, NV34TCL_BLEND_FUNC_ENABLE, 3);
 		OUT_RING  (chan, 1);
-		OUT_RING  (chan, (sblend << 16) | sblend);
-		OUT_RING  (chan, (dblend << 16) | dblend);
+		OUT_RING  (chan, sblend);
+		OUT_RING  (chan, dblend);
 	}
 }
 
@@ -305,43 +255,47 @@ NV30EXATexture(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict, int unit)
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *rankine = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pPix);
-	nv_pict_texture_format_t *fmt;
-	uint32_t card_filter, card_repeat;
 	uint32_t tex_reloc = NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD;
+	uint32_t pitch;
+	nv_pict_texture_format_t *fmt;
 	NV30EXA_STATE;
 
 	fmt = NV30_GetPictTextureFormat(pPict->format);
 	if (!fmt)
 		return FALSE;
 
-	card_repeat = 3; /* repeatNone */
-
-	if (pPict->filter == PictFilterBilinear)
-		card_filter = 2;
-	else
-		card_filter = 1;
-
 	BEGIN_RING(chan, rankine, NV34TCL_TX_OFFSET(unit), 8);
 	if (OUT_RELOCl(chan, bo, 0, tex_reloc) ||
-	    OUT_RELOCd(chan, bo, NV34TCL_TX_FORMAT_DIMS_2D | (1 << 16) | 8 |
-		       (fmt->card_fmt << NV34TCL_TX_FORMAT_FORMAT_SHIFT) |
+	    OUT_RELOCd(chan, bo, fmt->card_fmt |
+		       NV34TCL_TX_FORMAT_DIMS_2D | (1 << 16) |
+		       NV34TCL_TX_FORMAT_NO_BORDER |
 		       (log2i(pPix->drawable.width) <<
-			NV34TCL_TX_FORMAT_BASE_SIZE_U_SHIFT) |
+		        NV34TCL_TX_FORMAT_BASE_SIZE_U_SHIFT) |
 		       (log2i(pPix->drawable.height) <<
-			NV34TCL_TX_FORMAT_BASE_SIZE_V_SHIFT),
+		        NV34TCL_TX_FORMAT_BASE_SIZE_V_SHIFT),
 		       tex_reloc | NOUVEAU_BO_OR,
 		       NV34TCL_TX_FORMAT_DMA0, NV34TCL_TX_FORMAT_DMA1))
 		return FALSE;
-	OUT_RING  (chan, (card_repeat << NV34TCL_TX_WRAP_S_SHIFT) |
-			(card_repeat << NV34TCL_TX_WRAP_T_SHIFT) |
-			(card_repeat << NV34TCL_TX_WRAP_R_SHIFT));
+
+	/* repeatNone */
+	OUT_RING (chan, NV34TCL_TX_WRAP_S_CLAMP_TO_EDGE |
+			NV34TCL_TX_WRAP_T_CLAMP_TO_EDGE |
+			NV34TCL_TX_WRAP_R_CLAMP_TO_EDGE);
+
 	OUT_RING  (chan, NV34TCL_TX_ENABLE_ENABLE);
-	OUT_RING  (chan, (((uint32_t)exaGetPixmapPitch(pPix)) << NV34TCL_TX_SWIZZLE_RECT_PITCH_SHIFT ) | 
-			fmt->card_swz);
+	pitch = exaGetPixmapPitch(pPix);
+	OUT_RING  (chan, (pitch << NV34TCL_TX_SWIZZLE_RECT_PITCH_SHIFT) |
+			 fmt->card_swz);
+
+	/* 0x2000 = engine lock */
+	if (pPict->filter == PictFilterBilinear) {
+		OUT_RING  (chan, NV34TCL_TX_FILTER_MINIFY_LINEAR |
+				 NV34TCL_TX_FILTER_MAGNIFY_LINEAR | 0x2000);
+	} else {
+		OUT_RING  (chan, NV34TCL_TX_FILTER_MINIFY_NEAREST |
+				 NV34TCL_TX_FILTER_MAGNIFY_NEAREST | 0x2000);
+	}
 
-	OUT_RING  (chan, (card_filter << NV34TCL_TX_FILTER_MINIFY_SHIFT) /* min */ |
-			(card_filter << NV34TCL_TX_FILTER_MAGNIFY_SHIFT) /* mag */ |
-			0x2000 /* engine lock */);
 	OUT_RING  (chan, (pPix->drawable.width << NV34TCL_TX_NPOT_SIZE_W_SHIFT) | pPix->drawable.height);
 	OUT_RING  (chan, 0); /* border ARGB */
 
@@ -353,7 +307,7 @@ NV30EXATexture(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict, int unit)
 }
 
 static Bool
-NV30_SetupSurface(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict)
+NV30_SetupSurface(ScrnInfoPtr pScrn, PixmapPtr pPix, PictFormatShort format)
 {
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
@@ -361,7 +315,7 @@ NV30_SetupSurface(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict)
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pPix);
 	nv_pict_surface_format_t *fmt;
 
-	fmt = NV30_GetPictSurfaceFormat(pPict->format);
+	fmt = NV30_GetPictSurfaceFormat(format);
 	if (!fmt) {
 		ErrorF("AIII no format\n");
 		return FALSE;
@@ -370,8 +324,10 @@ NV30_SetupSurface(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict)
 	uint32_t pitch = (uint32_t)exaGetPixmapPitch(pPix);
 
 	BEGIN_RING(chan, rankine, NV34TCL_RT_FORMAT, 3);
-	OUT_RING  (chan, fmt->card_fmt); /* format */
-	OUT_RING  (chan, pitch << 16 | pitch);
+	OUT_RING  (chan, NV34TCL_RT_FORMAT_TYPE_LINEAR |
+		   NV34TCL_RT_FORMAT_ZETA_Z24S8 |
+		   fmt->card_fmt);
+	OUT_RING  (chan, pitch << NV34TCL_COLOR0_PITCH_ZETA_SHIFT | pitch);
 	if (OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR))
 		return FALSE;
 
@@ -399,7 +355,7 @@ NV30EXACheckCompositeTexture(PicturePtr pPict, PicturePtr pdPict, int op)
 				pPict->format);
 
 	if (pPict->filter != PictFilterNearest &&
-			pPict->filter != PictFilterBilinear)
+	    pPict->filter != PictFilterBilinear)
 		NOUVEAU_FALLBACK("filter 0x%x not supported\n", pPict->filter);
 
 	if (!(w==1 && h==1) && pPict->repeat && pPict->repeatType != RepeatNone)
@@ -421,8 +377,8 @@ NV30EXACheckCompositeTexture(PicturePtr pPict, PicturePtr pdPict, int op)
 
 Bool
 NV30EXACheckComposite(int op, PicturePtr psPict,
-		PicturePtr pmPict,
-		PicturePtr pdPict)
+			      PicturePtr pmPict,
+			      PicturePtr pdPict)
 {
 	nv_pict_surface_format_t *fmt;
 	nv_pict_op_t *opr;
@@ -440,8 +396,8 @@ NV30EXACheckComposite(int op, PicturePtr psPict,
 		NOUVEAU_FALLBACK("src picture\n");
 	if (pmPict) {
 		if (pmPict->componentAlpha &&
-				PICT_FORMAT_RGB(pmPict->format) &&
-				opr->src_alpha && opr->src_card_op != BF(ZERO))
+		    PICT_FORMAT_RGB(pmPict->format) &&
+		    opr->src_alpha && opr->src_card_op != SF(ZERO))
 			NOUVEAU_FALLBACK("mask CA + SA\n");
 		if (!NV30EXACheckCompositeTexture(pmPict, pdPict, op))
 			NOUVEAU_FALLBACK("mask picture\n");
@@ -462,11 +418,11 @@ NV30EXAStateCompositeReemit(struct nouveau_channel *chan)
 
 Bool
 NV30EXAPrepareComposite(int op, PicturePtr psPict,
-		PicturePtr pmPict,
-		PicturePtr pdPict,
-		PixmapPtr  psPix,
-		PixmapPtr  pmPix,
-		PixmapPtr  pdPix)
+				PicturePtr pmPict,
+				PicturePtr pdPict,
+				PixmapPtr  psPix,
+				PixmapPtr  pmPix,
+				PixmapPtr  pdPix)
 {
 	ScrnInfoPtr pScrn = xf86Screens[psPix->drawable.pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
@@ -485,26 +441,12 @@ NV30EXAPrepareComposite(int op, PicturePtr psPict,
 			(pmPict && pmPict->componentAlpha &&
 			 PICT_FORMAT_RGB(pmPict->format)));
 
-	if (!NV30_SetupSurface(pScrn, pdPix, pdPict) ||
+	if (!NV30_SetupSurface(pScrn, pdPix, pdPict->format) ||
 	    !NV30EXATexture(pScrn, psPix, psPict, 0)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
 
-#if 0
-#define printformat(f) ErrorF("(%xh %s %dbpp A%dR%dG%dB%d)",f,(f>>16)&0xf==2?"ARGB":"ABGR",(f>>24),(f&0xf000)>>12,(f&0xf00)>>8,(f&0xf0)>>4,f&0xf)
-	ErrorF("Preparecomposite src(%dx%d)",psPict->pDrawable->width,psPict->pDrawable->height);
-	printformat((psPict->format));
-	ErrorF(" dst(%dx%d)",pdPict->pDrawable->width,pdPict->pDrawable->height);
-	printformat((pdPict->format));
-	if (pmPict)
-	{
-		ErrorF(" mask(%dx%d)",pmPict->pDrawable->width,pmPict->pDrawable->height);
-		printformat((pmPict->format));
-	}
-	ErrorF("\n");
-#endif
-
 	if (pmPict) {
 		if (!NV30EXATexture(pScrn, pmPix, pmPict, 1)) {
 			MARK_UNDO(chan);
@@ -533,7 +475,7 @@ NV30EXAPrepareComposite(int op, PicturePtr psPict,
 		return FALSE;
 	}
 
-	BEGIN_RING(chan, rankine, 0x23c, 1);
+	BEGIN_RING(chan, rankine, NV34TCL_TX_UNITS_ENABLE, 1);
 	OUT_RING  (chan, pmPict?3:1);
 
 	pNv->alu = op;
@@ -550,13 +492,12 @@ NV30EXAPrepareComposite(int op, PicturePtr psPict,
 #define xFixedToFloat(v) \
 	((float)xFixedToInt((v)) + ((float)xFixedFrac(v) / 65536.0))
 
-static void
+static inline void
 NV30EXATransformCoord(PictTransformPtr t, int x, int y, float sx, float sy,
 					  float *x_ret, float *y_ret)
 {
-	PictVector v;
-
 	if (t) {
+		PictVector v;
 		v.vector[0] = IntToxFixed(x);
 		v.vector[1] = IntToxFixed(y);
 		v.vector[2] = xFixed1;
@@ -600,7 +541,9 @@ NV30EXAComposite(PixmapPtr pdPix, int srcX , int srcY,
 	WAIT_RING(chan, 64);
 
 	/* We're drawing a triangle, we need to scissor it to a quad. */
-	/* The scissors are here for a good reason, we don't get the full image, but just a part. */
+	/* The scissors are here for a good reason, we don't get the full
+	 * image, but just a part.
+	 */
 	/* Handling the cliprects is done for us already. */
 	BEGIN_RING(chan, rankine, NV34TCL_SCISSOR_HORIZ, 2);
 	OUT_RING  (chan, (width << 16) | dstX);
@@ -608,47 +551,42 @@ NV30EXAComposite(PixmapPtr pdPix, int srcX , int srcY,
 	BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
 	OUT_RING  (chan, NV34TCL_VERTEX_BEGIN_END_TRIANGLES);
 
-#if 0
-	ErrorF("Composite [%dx%d] (%d,%d)IN(%d,%d)OP(%d,%d)\n",width,height,srcX,srcY,maskX,maskY,dstX,dstY);
-#endif
-	NV30EXATransformCoord(state->unit[0].transform, 
-				srcX, srcY - height,
-				state->unit[0].width,
-				state->unit[0].height, &sX0, &sY0);
+	NV30EXATransformCoord(state->unit[0].transform, srcX, srcY - height,
+			      state->unit[0].width, state->unit[0].height,
+			      &sX0, &sY0);
+	NV30EXATransformCoord(state->unit[0].transform, srcX, srcY + height,
+			      state->unit[0].width, state->unit[0].height,
+			      &sX1, &sY1);
 	NV30EXATransformCoord(state->unit[0].transform,
-				srcX, srcY + height,
-				state->unit[0].width,
-				state->unit[0].height, &sX1, &sY1);
-	NV30EXATransformCoord(state->unit[0].transform,
-				srcX + 2*width, srcY + height,
-				state->unit[0].width,
-				state->unit[0].height, &sX2, &sY2);
+			      srcX + 2*width, srcY + height,
+			      state->unit[0].width,
+			      state->unit[0].height, &sX2, &sY2);
 
 	if (state->have_mask) {
-		NV30EXATransformCoord(state->unit[1].transform, 
-					maskX, maskY - height,
-					state->unit[1].width,
-					state->unit[1].height, &mX0, &mY0);
 		NV30EXATransformCoord(state->unit[1].transform,
-					maskX, maskY + height,
-					state->unit[1].width,
-					state->unit[1].height, &mX1, &mY1);
+				      maskX, maskY - height,
+				      state->unit[1].width,
+				      state->unit[1].height, &mX0, &mY0);
+		NV30EXATransformCoord(state->unit[1].transform,
+				      maskX, maskY + height,
+				      state->unit[1].width,
+				      state->unit[1].height, &mX1, &mY1);
 		NV30EXATransformCoord(state->unit[1].transform,
-					maskX + 2*width, maskY + height,
-					state->unit[1].width,
-					state->unit[1].height, &mX2, &mY2);
+				      maskX + 2*width, maskY + height,
+				      state->unit[1].width,
+				      state->unit[1].height, &mX2, &mY2);
 
-		CV_OUTm(sX0 , sY0 , mX0, mY0, dstX			,	dstY - height);
-		CV_OUTm(sX1 , sY1 , mX1, mY1, dstX			,	dstY + height);
-		CV_OUTm(sX2 , sY2 , mX2, mY2, dstX + 2*width	, 	dstY + height);
+		CV_OUTm(sX0, sY0, mX0, mY0, dstX, dstY - height);
+		CV_OUTm(sX1, sY1, mX1, mY1, dstX, dstY + height);
+		CV_OUTm(sX2, sY2, mX2, mY2, dstX + 2*width, dstY + height);
 	} else {
-		CV_OUT(sX0 , sY0 , dstX			,	dstY - height);
-		CV_OUT(sX1 , sY1 , dstX			,	dstY + height);
-		CV_OUT(sX2 , sY2 , dstX + 2*width	, 	dstY + height);
+		CV_OUT(sX0, sY0, dstX, dstY - height);
+		CV_OUT(sX1, sY1, dstX, dstY + height);
+		CV_OUT(sX2, sY2, dstX + 2*width, dstY + height);
 	}
 
 	BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-	OUT_RING  (chan, 0);
+	OUT_RING  (chan, NV34TCL_VERTEX_BEGIN_END_STOP);
 }
 
 void
@@ -661,6 +599,9 @@ NV30EXADoneComposite(PixmapPtr pdPix)
 	chan->flush_notify = NULL;
 }
 
+#define NV30TCL_CHIPSET_3X_MASK 0x00000003
+#define NV35TCL_CHIPSET_3X_MASK 0x000001e0
+#define NV34TCL_CHIPSET_3X_MASK 0x00000010
 Bool
 NVAccelInitNV30TCL(ScrnInfoPtr pScrn)
 {
@@ -673,27 +614,22 @@ NVAccelInitNV30TCL(ScrnInfoPtr pScrn)
 	if (!nv40_fp_map_a8[0])
 		NV30EXAHackupA8Shaders(pScrn);
 
-#define NV30TCL_CHIPSET_3X_MASK 0x00000003
-#define NV35TCL_CHIPSET_3X_MASK 0x000001e0
-#define NV34TCL_CHIPSET_3X_MASK 0x00000010
-
 	chipset = pNv->dev->chipset;
-	if ((chipset & 0xf0) != NV_ARCH_30)
+	if ((chipset & 0xf0) == NV_ARCH_30) {
+		chipset &= 0xf;
+		if (NV30TCL_CHIPSET_3X_MASK & (1<<chipset))
+			class = NV30TCL;
+		else if (NV35TCL_CHIPSET_3X_MASK & (1<<chipset))
+			class = NV35TCL;
+		else if (NV34TCL_CHIPSET_3X_MASK & (1<<chipset))
+			class = NV34TCL;
+		else {
+			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+					"NV30EXA: Unknown chipset NV3%1x\n", chipset);
+			return FALSE;
+		}
+	} else
 		return TRUE;
-	chipset &= 0xf;
-
-	if (NV30TCL_CHIPSET_3X_MASK & (1<<chipset))
-		class = NV30TCL;
-	else if (NV35TCL_CHIPSET_3X_MASK & (1<<chipset))
-		class = NV35TCL;
-	else if (NV34TCL_CHIPSET_3X_MASK & (1<<chipset))
-		class = NV34TCL;
-	else {
-		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
-			   "NV30EXA: Unknown chipset NV3%1x\n", chipset);
-		return FALSE;
-	}
-
 
 	if (!pNv->Nv3D) {
 		if (nouveau_grobj_alloc(chan, Nv3D, class, &pNv->Nv3D))
@@ -702,8 +638,9 @@ NVAccelInitNV30TCL(ScrnInfoPtr pScrn)
 	rankine = pNv->Nv3D;
 
 	if (!pNv->shader_mem) {
-		if (nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM | NOUVEAU_BO_MAP,
-				   0, 0x1000, &pNv->shader_mem)) {
+		if (nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM |
+				   NOUVEAU_BO_MAP, 0, 0x1000,
+				   &pNv->shader_mem)) {
 			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
 				   "Couldn't alloc fragprog buffer!\n");
 			nouveau_grobj_free(&pNv->Nv3D);
@@ -729,7 +666,7 @@ NVAccelInitNV30TCL(ScrnInfoPtr pScrn)
 		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(chan, rankine, 0x220, 1);
+	BEGIN_RING(chan, rankine, NV34TCL_RT_ENABLE, 1);
 	OUT_RING  (chan, 1);
 
 	BEGIN_RING(chan, rankine, 0x03b0, 1);
diff --git a/src/nv40_exa.c b/src/nv40_exa.c
index c2717f7..067ba20 100644
--- a/src/nv40_exa.c
+++ b/src/nv40_exa.c
@@ -628,7 +628,7 @@ NVAccelInitNV40TCL(ScrnInfoPtr pScrn)
 		return TRUE;
 
 	if (!pNv->Nv3D) {
-		if (nouveau_grobj_alloc(pNv->chan, Nv3D, class, &pNv->Nv3D))
+		if (nouveau_grobj_alloc(chan, Nv3D, class, &pNv->Nv3D))
 			return FALSE;
 	}
 	curie = pNv->Nv3D;
-- 
1.7.0.5
