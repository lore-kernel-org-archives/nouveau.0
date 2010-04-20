From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv30/exa : cleanup from nv40 exa
Date: Tue, 20 Apr 2010 23:48:57 +0200
Message-ID: <1271800137-9951-1-git-send-email-chantry.xavier@gmail.com>
References: <1271764725-19797-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1271764725-19797-1-git-send-email-chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

A few explanations, even though these cleanups were all made to nv40
already, most of them in commit 0d1835d67e :
- (sblend << 16) | sblend -> sblend is normal, as the new SF and DF
  definitions include both ALPHA (<< 16) and RGB.
- about PictFilterBilinear, the if was just moved directly around the
  OUT_RING
- about RT_FORMAT, zeta_z24s8 and type_linear were previously directly
  hardcoded in the rt format values
0x148 = NV34TCL_RT_FORMAT_TYPE_LINEAR (0x100) +
	NV34TCL_RT_FORMAT_ZETA_Z24S8 (0x40) +
	NV34TCL_RT_FORMAT_COLOR_A8R8G8B8 (0x8)

v2: smaller diff, without strict indent changes and removal of debug code

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv30_exa.c |  230 +++++++++++++++++++++++++-------------------------------
 src/nv40_exa.c |    2 +-
 2 files changed, 103 insertions(+), 129 deletions(-)

diff --git a/src/nv30_exa.c b/src/nv30_exa.c
index b736fb3..0031fe7 100644
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
@@ -265,36 +233,36 @@ NV30_SetupBlend(ScrnInfoPtr pScrn, nv_pict_op_t *blend,
 
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
 
@@ -306,42 +274,46 @@ NV30EXATexture(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict, int unit)
 	struct nouveau_grobj *rankine = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pPix);
 	nv_pict_texture_format_t *fmt;
-	uint32_t card_filter, card_repeat;
 	uint32_t tex_reloc = NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD;
+	uint32_t pitch;
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
 
@@ -370,8 +342,10 @@ NV30_SetupSurface(ScrnInfoPtr pScrn, PixmapPtr pPix, PicturePtr pPict)
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
 
@@ -440,8 +414,8 @@ NV30EXACheckComposite(int op, PicturePtr psPict,
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
@@ -533,7 +507,7 @@ NV30EXAPrepareComposite(int op, PicturePtr psPict,
 		return FALSE;
 	}
 
-	BEGIN_RING(chan, rankine, 0x23c, 1);
+	BEGIN_RING(chan, rankine, NV34TCL_TX_UNITS_ENABLE, 1);
 	OUT_RING  (chan, pmPict?3:1);
 
 	pNv->alu = op;
@@ -648,7 +622,7 @@ NV30EXAComposite(PixmapPtr pdPix, int srcX , int srcY,
 	}
 
 	BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-	OUT_RING  (chan, 0);
+	OUT_RING  (chan, NV34TCL_VERTEX_BEGIN_END_STOP);
 }
 
 void
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
