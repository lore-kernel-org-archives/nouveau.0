From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] nv10/exa: Replace "celcius" with "celsius".
Date: Thu,  8 Oct 2009 04:10:12 +0200
Message-ID: <1254967812-9268-3-git-send-email-currojerez@riseup.net>
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
 src/nv10_exa.c |  200 ++++++++++++++++++++++++++++----------------------------
 1 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index eda92aa..1b99117 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -361,7 +361,7 @@ Bool NV10EXACheckComposite(int	op,
 static void NV10SetTexture(NVPtr pNv,int unit,PicturePtr Pict,PixmapPtr pixmap)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pixmap);
 	unsigned delta = nouveau_pixmap_offset(pixmap);
 	int log2w = log2i(Pict->pDrawable->width);
@@ -375,7 +375,7 @@ static void NV10SetTexture(NVPtr pNv,int unit,PicturePtr Pict,PixmapPtr pixmap)
 			(1<<12) | /* lod == 1 */
 			0x51 /* UNK */;
 
-	BEGIN_RING(chan, celcius, NV10TCL_TX_OFFSET(unit), 1 );
+	BEGIN_RING(chan, celsius, NV10TCL_TX_OFFSET(unit), 1 );
 	OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
 
 	/* if repeat is set we're always handling a 1x1 texture with ARGB/XRGB destination, 
@@ -402,20 +402,20 @@ static void NV10SetTexture(NVPtr pNv,int unit,PicturePtr Pict,PixmapPtr pixmap)
 		*/
 		w = (w + 1) &~ 1;
 
-		BEGIN_RING(chan, celcius, NV10TCL_TX_NPOT_PITCH(unit), 1);
+		BEGIN_RING(chan, celsius, NV10TCL_TX_NPOT_PITCH(unit), 1);
 		OUT_RING  (chan, exaGetPixmapPitch(pixmap) << 16);
 
-		BEGIN_RING(chan, celcius, NV10TCL_TX_NPOT_SIZE(unit), 1);
+		BEGIN_RING(chan, celsius, NV10TCL_TX_NPOT_SIZE(unit), 1);
 		OUT_RING  (chan, (w<<16) | Pict->pDrawable->height);
 	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_TX_FORMAT(unit), 1 );
+	BEGIN_RING(chan, celsius, NV10TCL_TX_FORMAT(unit), 1 );
 	OUT_RING  (chan, txfmt);
 
-	BEGIN_RING(chan, celcius, NV10TCL_TX_ENABLE(unit), 1 );
+	BEGIN_RING(chan, celsius, NV10TCL_TX_ENABLE(unit), 1 );
 	OUT_RING  (chan, NV10TCL_TX_ENABLE_ENABLE);
 
-	BEGIN_RING(chan, celcius, NV10TCL_TX_FILTER(unit), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_TX_FILTER(unit), 1);
 	if (Pict->filter == PictFilterNearest)
 		OUT_RING  (chan, (NV10TCL_TX_FILTER_MAGNIFY_NEAREST) |
 				(NV10TCL_TX_FILTER_MINIFY_NEAREST));
@@ -431,7 +431,7 @@ static void NV10SetTexture(NVPtr pNv,int unit,PicturePtr Pict,PixmapPtr pixmap)
 static void NV10SetBuffer(NVPtr pNv,PicturePtr Pict,PixmapPtr pixmap)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pixmap);
 	unsigned delta = nouveau_pixmap_offset(pixmap);
 	int i;
@@ -440,7 +440,7 @@ static void NV10SetBuffer(NVPtr pNv,PicturePtr Pict,PixmapPtr pixmap)
 	int w = 2048;
 	int h = 2048;
 
-	BEGIN_RING(chan, celcius, NV10TCL_RT_FORMAT, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_RT_FORMAT, 4);
 	if ( state.is_a8_plus_a8 )
 		{ /*A8 + A8 hack*/
 		OUT_RING  (chan, NV10DstFormat(PICT_a8r8g8b8));
@@ -453,31 +453,31 @@ static void NV10SetBuffer(NVPtr pNv,PicturePtr Pict,PixmapPtr pixmap)
 	OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, 0);
 		
-	BEGIN_RING(chan, celcius, NV10TCL_RT_HORIZ, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 2);
 	OUT_RING  (chan, (w<<16)|x);
 	OUT_RING  (chan, (h<<16)|y);
-	BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_MODE, 1); /* clip_mode */
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_MODE, 1); /* clip_mode */
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
 	OUT_RING  (chan, ((w-1+x)<<16)|x|0x08000800);
-	BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
 	OUT_RING  (chan, ((h-1+y)<<16)|y|0x08000800);
 
-	BEGIN_RING(chan, celcius, NV10TCL_PROJECTION_MATRIX(0), 16);
+	BEGIN_RING(chan, celsius, NV10TCL_PROJECTION_MATRIX(0), 16);
 	for(i=0;i<16;i++)
 		if (i/4==i%4)
 			OUT_RINGf (chan, 1.0f);
 		else
 			OUT_RINGf (chan, 0.0f);
 
-	BEGIN_RING(chan, celcius, NV10TCL_DEPTH_RANGE_NEAR, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_RANGE_NEAR, 2);
 	OUT_RING  (chan, 0);
 #if SCREEN_BPP == 32
 	OUT_RINGf (chan, 16777216.0);
 #else
 	OUT_RINGf (chan, 65536.0);
 #endif
-	BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_SCALE_X, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_SCALE_X, 4);
 	OUT_RINGf (chan, -2048.0);
 	OUT_RINGf (chan, -2048.0);
 	OUT_RINGf (chan, 0);
@@ -492,7 +492,7 @@ static void NV10SetBuffer(NVPtr pNv,PicturePtr Pict,PixmapPtr pixmap)
 static void NV10SetRegCombs(NVPtr pNv, PicturePtr src, PicturePtr mask)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 	unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
 
 /*This can be a bit difficult to understand at first glance.
@@ -565,16 +565,16 @@ Final combiner uses default setup
 			rc0_in_rgb |= RC_IN_ONE(RGB, B);
 	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_ALPHA(0), 1);
 	OUT_RING  (chan, rc0_in_alpha);
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_RGB(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_RGB(0), 1);
 	OUT_RING  (chan, rc0_in_rgb);
 }
 
 static void NV10SetRegCombs_A8plusA8(NVPtr pNv, int pass, int mask_out_bytes)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 	unsigned int rc0_in_alpha = 0, rc0_in_rgb = 0;
 	unsigned int color0 = 0, color1 = 0;
 
@@ -609,11 +609,11 @@ static void NV10SetRegCombs_A8plusA8(NVPtr pNv, int pass, int mask_out_bytes)
 		color1 = 0x0000ff00; /*R = 0, G = 1, B = 0*/
 	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_ALPHA(0), 1);
 	OUT_RING  (chan, rc0_in_alpha);
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_RGB(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_RGB(0), 1);
 	OUT_RING  (chan, rc0_in_rgb);
-	BEGIN_RING(chan, celcius, NV10TCL_RC_COLOR(0), 2);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_COLOR(0), 2);
 	OUT_RING  (chan, color0);
 	OUT_RING  (chan, color1);
 }
@@ -621,7 +621,7 @@ static void NV10SetRegCombs_A8plusA8(NVPtr pNv, int pass, int mask_out_bytes)
 static void NV10SetPictOp(NVPtr pNv,int op)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 	struct nv10_pictop *nv10_op = &NV10PictOp[op];
 	int src_factor = nv10_op->src;
 	int dst_factor = nv10_op->dst;
@@ -641,10 +641,10 @@ static void NV10SetPictOp(NVPtr pNv,int op)
 			dst_factor = DF(ONE_MINUS_SRC_COLOR);
 	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_SRC, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_SRC, 2);
 	OUT_RING  (chan, src_factor);
 	OUT_RING  (chan, dst_factor);
-	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_ENABLE, 1);
 	OUT_RING  (chan, 1);
 }
 
@@ -714,12 +714,12 @@ Bool NV10EXAPrepareComposite(int op,
 static inline void NV10Vertex(NVPtr pNv,float vx,float vy,float tx,float ty)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_TX0_2F_S, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX0_2F_S, 2);
 	OUT_RINGf (chan, tx);
 	OUT_RINGf (chan, ty);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_POS_3F_X, 3);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_POS_3F_X, 3);
 	OUT_RINGf (chan, vx);
 	OUT_RINGf (chan, vy);
 	OUT_RINGf (chan, 0.f);
@@ -728,15 +728,15 @@ static inline void NV10Vertex(NVPtr pNv,float vx,float vy,float tx,float ty)
 static inline void NV10MVertex(NVPtr pNv,float vx,float vy,float t0x,float t0y,float t1x,float t1y)
 {
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_TX0_2F_S, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX0_2F_S, 2);
 	OUT_RINGf (chan, t0x);
 	OUT_RINGf (chan, t0y);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_TX1_2F_S, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX1_2F_S, 2);
 	OUT_RINGf (chan, t1x);
 	OUT_RINGf (chan, t1y);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_POS_3F_X, 3);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_POS_3F_X, 3);
 	OUT_RINGf (chan, vx);
 	OUT_RINGf (chan, vy);
 	OUT_RINGf (chan, 0.f);
@@ -778,12 +778,12 @@ void NV10EXAComposite(PixmapPtr pDst,
 	ScrnInfoPtr pScrn = xf86Screens[pDst->drawable.pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius = pNv->Nv3D;
+	struct nouveau_grobj *celsius = pNv->Nv3D;
 	float sX0, sX1, sX2, sY0, sY1, sY2, sX3, sY3;
 	float mX0, mX1, mX2, mY0, mY1, mY2, mX3, mY3;
 
 	WAIT_RING (chan, 64);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_BEGIN_END, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 	OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_QUADS);
 
 	NV10EXATransformCoord(state.unit[0].transform, srcX, srcY,
@@ -871,7 +871,7 @@ void NV10EXAComposite(PixmapPtr pDst,
 			/*Pass number 0*/
 			
 			NV10SetRegCombs_A8plusA8(pNv, 0, mask_out_bytes);
-			BEGIN_RING(chan, celcius, NV10TCL_VERTEX_BEGIN_END, 1);
+			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_QUADS);		
 					
 			NV10MVertex(pNv , part_pos_dX	, dstY              , part_pos_sX, sY0, part_pos_sX + 1, sY0);
@@ -879,13 +879,13 @@ void NV10EXAComposite(PixmapPtr pDst,
 			NV10MVertex(pNv , part_pos_dX + 1, dstY + height, part_pos_sX,  sY2, part_pos_sX + 1, sY2);
 			NV10MVertex(pNv , part_pos_dX	, dstY + height, part_pos_sX, sY2, part_pos_sX + 1, sY2);
 			
-			BEGIN_RING(chan, celcius, NV10TCL_VERTEX_BEGIN_END, 1);
+			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_STOP);
 			
 			/*Pass number 1*/
 			
 			NV10SetRegCombs_A8plusA8(pNv, 1, mask_out_bytes);
-			BEGIN_RING(chan, celcius, NV10TCL_VERTEX_BEGIN_END, 1);
+			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_QUADS);		
 					
 			NV10MVertex(pNv , part_pos_dX, dstY              , part_pos_sX + 2, sY0, part_pos_sX + 3, sY0);
@@ -893,7 +893,7 @@ void NV10EXAComposite(PixmapPtr pDst,
 			NV10MVertex(pNv , part_pos_dX + 1 , dstY + height, part_pos_sX + 2, sY2, part_pos_sX + 3, sY2);
 			NV10MVertex(pNv , part_pos_dX, dstY + height, part_pos_sX + 2, sY2, part_pos_sX + 3, sY2);
 
-			BEGIN_RING(chan, celcius, NV10TCL_VERTEX_BEGIN_END, 1);
+			BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 			OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_STOP);
 			
 			}
@@ -925,7 +925,7 @@ void NV10EXAComposite(PixmapPtr pDst,
 		NV10Vertex(pNv , dstX         , dstY + height , sX3 , sY3);
 	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_BEGIN_END, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BEGIN_END, 1);
 	OUT_RING  (chan, NV10TCL_VERTEX_BEGIN_END_STOP);
 }
 
@@ -944,7 +944,7 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 {
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_channel *chan = pNv->chan;
-	struct nouveau_grobj *celcius;
+	struct nouveau_grobj *celsius;
 	uint32_t class = 0, chipset;
 	int i;
 
@@ -966,49 +966,49 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 		if (nouveau_grobj_alloc(pNv->chan, Nv3D, class, &pNv->Nv3D))
 			return FALSE;
 	}
-	celcius = pNv->Nv3D;
+	celsius = pNv->Nv3D;
 
-	BEGIN_RING(chan, celcius, NV10TCL_DMA_NOTIFY, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_NOTIFY, 1);
 	OUT_RING  (chan, chan->nullobj->handle);
 
-	BEGIN_RING(chan, celcius, NV10TCL_DMA_IN_MEMORY0, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_IN_MEMORY0, 2);
 	OUT_RING  (chan, pNv->chan->vram->handle);
 	OUT_RING  (chan, pNv->chan->gart->handle);
 
-	BEGIN_RING(chan, celcius, NV10TCL_DMA_IN_MEMORY2, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_IN_MEMORY2, 2);
 	OUT_RING  (chan, pNv->chan->vram->handle);
 	OUT_RING  (chan, pNv->chan->vram->handle);
 
-	BEGIN_RING(chan, celcius, NV10TCL_NOP, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
 	OUT_RING  (chan, 0);
 
-	BEGIN_RING(chan, celcius, NV10TCL_RT_HORIZ, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 
-	BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
 	OUT_RING  (chan, (0x7ff<<16)|0x800);
-	BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
 	OUT_RING  (chan, (0x7ff<<16)|0x800);
 
 	for (i=1;i<8;i++) {
-		BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_HORIZ(i), 1);
+		BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(i), 1);
 		OUT_RING  (chan, 0);
-		BEGIN_RING(chan, celcius, NV10TCL_VIEWPORT_CLIP_VERT(i), 1);
+		BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(i), 1);
 		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(chan, celcius, 0x290, 1);
+	BEGIN_RING(chan, celsius, 0x290, 1);
 	OUT_RING  (chan, (0x10<<16)|1);
-	BEGIN_RING(chan, celcius, 0x3f4, 1);
+	BEGIN_RING(chan, celsius, 0x3f4, 1);
 	OUT_RING  (chan, 0);
 
-	BEGIN_RING(chan, celcius, NV10TCL_NOP, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
 	OUT_RING  (chan, 0);
 
 	if (class != NV10TCL) {
 		/* For nv11, nv17 */
-		BEGIN_RING(chan, celcius, 0x120, 3);
+		BEGIN_RING(chan, celsius, 0x120, 3);
 		OUT_RING  (chan, 0);
 		OUT_RING  (chan, 1);
 		OUT_RING  (chan, 2);
@@ -1018,54 +1018,54 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 		OUT_RING  (chan, 1);
 		OUT_RING  (chan, 2);
 
-		BEGIN_RING(chan, celcius, NV10TCL_NOP, 1);
+		BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
 		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(chan, celcius, NV10TCL_NOP, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
 	OUT_RING  (chan, 0);
 
 	/* Set state */
-	BEGIN_RING(chan, celcius, NV10TCL_FOG_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_ALPHA_FUNC_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_ALPHA_FUNC_FUNC, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_FUNC, 2);
 	OUT_RING  (chan, 0x207);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_TX_ENABLE(0), 2);
+	BEGIN_RING(chan, celsius, NV10TCL_TX_ENABLE(0), 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 6);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_ALPHA(0), 6);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_RC_OUT_ALPHA(0), 6);
+	BEGIN_RING(chan, celsius, NV10TCL_RC_OUT_ALPHA(0), 6);
 	OUT_RING  (chan, 0x00000c00);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0x00000c00);
 	OUT_RING  (chan, 0x18000000);
 	OUT_RING  (chan, 0x300c0000);
 	OUT_RING  (chan, 0x00001c80);
-	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_DITHER_ENABLE, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_DITHER_ENABLE, 2);
 	OUT_RING  (chan, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_WEIGHT_ENABLE, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_WEIGHT_ENABLE, 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_BLEND_FUNC_SRC, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_SRC, 4);
 	OUT_RING  (chan, 1);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0x8006);
-	BEGIN_RING(chan, celcius, NV10TCL_STENCIL_MASK, 8);
+	BEGIN_RING(chan, celsius, NV10TCL_STENCIL_MASK, 8);
 	OUT_RING  (chan, 0xff);
 	OUT_RING  (chan, 0x207);
 	OUT_RING  (chan, 0);
@@ -1074,99 +1074,99 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0x1e00);
 	OUT_RING  (chan, 0x1e00);
 	OUT_RING  (chan, 0x1d01);
-	BEGIN_RING(chan, celcius, NV10TCL_NORMALIZE_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_NORMALIZE_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_FOG_ENABLE, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_ENABLE, 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_LIGHT_MODEL, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_LIGHT_MODEL, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_COLOR_CONTROL, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_CONTROL, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_ENABLED_LIGHTS, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_ENABLED_LIGHTS, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_POLYGON_OFFSET_POINT_ENABLE, 3);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_OFFSET_POINT_ENABLE, 3);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_DEPTH_FUNC, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_FUNC, 1);
 	OUT_RING  (chan, 0x201);
-	BEGIN_RING(chan, celcius, NV10TCL_DEPTH_WRITE_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_WRITE_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_DEPTH_TEST_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_TEST_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_POLYGON_OFFSET_FACTOR, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_OFFSET_FACTOR, 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_POINT_SIZE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_POINT_SIZE, 1);
 	OUT_RING  (chan, 8);
-	BEGIN_RING(chan, celcius, NV10TCL_POINT_PARAMETERS_ENABLE, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_POINT_PARAMETERS_ENABLE, 2);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_LINE_WIDTH, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_WIDTH, 1);
 	OUT_RING  (chan, 8);
-	BEGIN_RING(chan, celcius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_POLYGON_MODE_FRONT, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_MODE_FRONT, 2);
 	OUT_RING  (chan, 0x1b02);
 	OUT_RING  (chan, 0x1b02);
-	BEGIN_RING(chan, celcius, NV10TCL_CULL_FACE, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE, 2);
 	OUT_RING  (chan, 0x405);
 	OUT_RING  (chan, 0x901);
-	BEGIN_RING(chan, celcius, NV10TCL_POLYGON_SMOOTH_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_SMOOTH_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_CULL_FACE_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE_ENABLE, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_TX_GEN_S(0), 8);
+	BEGIN_RING(chan, celsius, NV10TCL_TX_GEN_S(0), 8);
 	for (i=0;i<8;i++) {
 		OUT_RING  (chan, 0);
 	}
-	BEGIN_RING(chan, celcius, NV10TCL_FOG_EQUATION_CONSTANT, 3);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_EQUATION_CONSTANT, 3);
 	OUT_RING  (chan, 0x3fc00000);	/* -1.50 */
 	OUT_RING  (chan, 0xbdb8aa0a);	/* -0.09 */
 	OUT_RING  (chan, 0);		/*  0.00 */
 
-	BEGIN_RING(chan, celcius, NV10TCL_NOP, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
 	OUT_RING  (chan, 0);
 
-	BEGIN_RING(chan, celcius, NV10TCL_FOG_MODE, 2);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_MODE, 2);
 	OUT_RING  (chan, 0x802);
 	OUT_RING  (chan, 2);
 	/* for some reason VIEW_MATRIX_ENABLE need to be 6 instead of 4 when
 	 * using texturing, except when using the texture matrix
 	 */
-	BEGIN_RING(chan, celcius, NV10TCL_VIEW_MATRIX_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEW_MATRIX_ENABLE, 1);
 	OUT_RING  (chan, 6);
-	BEGIN_RING(chan, celcius, NV10TCL_COLOR_MASK, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_MASK, 1);
 	OUT_RING  (chan, 0x01010101);
 
 	/* Set vertex component */
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_COL_4F_R, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_COL_4F_R, 4);
 	OUT_RINGf (chan, 1.0);
 	OUT_RINGf (chan, 1.0);
 	OUT_RINGf (chan, 1.0);
 	OUT_RINGf (chan, 1.0);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_COL2_3F_R, 3);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_COL2_3F_R, 3);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_NOR_3F_X, 3);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_NOR_3F_X, 3);
 	OUT_RING  (chan, 0);
 	OUT_RING  (chan, 0);
 	OUT_RINGf (chan, 1.0);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_TX0_4F_S, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX0_4F_S, 4);
 	OUT_RINGf (chan, 0.0);
 	OUT_RINGf (chan, 0.0);
 	OUT_RINGf (chan, 0.0);
 	OUT_RINGf (chan, 1.0);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_TX1_4F_S, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX1_4F_S, 4);
 	OUT_RINGf (chan, 0.0);
 	OUT_RINGf (chan, 0.0);
 	OUT_RINGf (chan, 0.0);
 	OUT_RINGf (chan, 1.0);
-	BEGIN_RING(chan, celcius, NV10TCL_VERTEX_FOG_1F, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_FOG_1F, 1);
 	OUT_RINGf (chan, 0.0);
-	BEGIN_RING(chan, celcius, NV10TCL_EDGEFLAG_ENABLE, 1);
+	BEGIN_RING(chan, celsius, NV10TCL_EDGEFLAG_ENABLE, 1);
 	OUT_RING  (chan, 1);
 
 	return TRUE;
-- 
1.6.3.3
