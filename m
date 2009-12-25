From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [DDX PATCH 4/5] nv50: update nv50_texture.h
Date: Fri, 25 Dec 2009 22:39:34 +0100
Message-ID: <20091225213934.GD15610@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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


- copy changes from mesa/src/gallium/drivers/nv50/nv50_texture.h
- remove 2 redefinitions
- fix R<->B rename (see df189c9efc0fbcdce816af483f0147ab635280d1
  (nv50: TIC/TSC fixes and additions) in mesa repo)
---
 src/nv50_exa.c     |   45 ++++++++++++--------------
 src/nv50_texture.h |   89 ++++++++++++++++++++++++++++++++++++++--------------
 src/nv50_xv.c      |   16 +++++-----
 3 files changed, 94 insertions(+), 56 deletions(-)

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index d56c567..33cde24 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -572,9 +572,6 @@ NV50EXACheckTexture(PicturePtr ppict, PicturePtr pdpict, int op)
 	return TRUE;
 }
 
-#define NV50TIC_0_0_FMT_1_5_5_5                                     0x00000014
-#define NV50TIC_0_0_FMT_4_4_4_4                                     0x00000012
-
 #define _(X1,X2,X3,X4,FMT) (NV50TIC_0_0_TYPER_UNORM | NV50TIC_0_0_TYPEG_UNORM | NV50TIC_0_0_TYPEB_UNORM | NV50TIC_0_0_TYPEA_UNORM | \
 			    NV50TIC_0_0_MAP##X1 | NV50TIC_0_0_MAP##X2 | NV50TIC_0_0_MAP##X3 | NV50TIC_0_0_MAP##X4 | \
 			    NV50TIC_0_0_FMT_##FMT)
@@ -607,67 +604,67 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 
 	switch (ppict->format) {
 	case PICT_a8r8g8b8:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 8_8_8_8));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 8_8_8_8));
 		break;
 	case PICT_a8b8g8r8:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 8_8_8_8));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 8_8_8_8));
 		break;
 	case PICT_x8r8g8b8:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 8_8_8_8));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 8_8_8_8));
 		break;
 	case PICT_x8b8g8r8:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 8_8_8_8));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 8_8_8_8));
 		break;
 	case PICT_r5g6b5:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 5_6_5));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 5_6_5));
 		break;
 	case PICT_a8:
-		OUT_RING(chan, _(A_C0, R_ZERO, G_ZERO, B_ZERO, 8));
+		OUT_RING(chan, _(A_C0, B_ZERO, G_ZERO, R_ZERO, 8));
 		break;
 	case PICT_x1r5g5b5:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 1_5_5_5));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 1_5_5_5));
 		break;
 	case PICT_x1b5g5r5:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 1_5_5_5));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 1_5_5_5));
 		break;
 	case PICT_a1r5g5b5:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 1_5_5_5));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 1_5_5_5));
 		break;
 	case PICT_a1b5g5r5:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 1_5_5_5));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 1_5_5_5));
 		break;
 	case PICT_b5g6r5:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 5_6_5));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 5_6_5));
 		break;
 	case PICT_b8g8r8x8:
-		OUT_RING(chan, _(A_ONE, B_C1, G_C2, R_C3, 8_8_8_8));
+		OUT_RING(chan, _(A_ONE, R_C1, G_C2, B_C3, 8_8_8_8));
 		break;
 	case PICT_b8g8r8a8:
-		OUT_RING(chan, _(A_C0, B_C1, G_C2, R_C3, 8_8_8_8));
+		OUT_RING(chan, _(A_C0, R_C1, G_C2, B_C3, 8_8_8_8));
 		break;
 	case PICT_a2b10g10r10:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 2_10_10_10));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 2_10_10_10));
 		break;
 	case PICT_x2b10g10r10:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 2_10_10_10));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 2_10_10_10));
 		break;
 	case PICT_x2r10g10b10:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 2_10_10_10));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 2_10_10_10));
 		break;
 	case PICT_a2r10g10b10:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 2_10_10_10));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 2_10_10_10));
 		break;
 	case PICT_x4r4g4b4:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 4_4_4_4));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 4_4_4_4));
 		break;
 	case PICT_x4b4g4r4:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 4_4_4_4));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 4_4_4_4));
 		break;
 	case PICT_a4r4g4b4:
-		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 4_4_4_4));
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 4_4_4_4));
 		break;
 	case PICT_a4b4g4r4:
-		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 4_4_4_4));
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 4_4_4_4));
 		break;
 	default:
 		NOUVEAU_FALLBACK("invalid picture format, this SHOULD NOT HAPPEN. Expect trouble.\n");
diff --git a/src/nv50_texture.h b/src/nv50_texture.h
index e3ab119..b870302 100644
--- a/src/nv50_texture.h
+++ b/src/nv50_texture.h
@@ -14,13 +14,13 @@
 #define NV50TIC_0_0_MAPA_C2                                       0x20000000
 #define NV50TIC_0_0_MAPA_C3                                       0x28000000
 #define NV50TIC_0_0_MAPA_ONE                                      0x38000000
-#define NV50TIC_0_0_MAPR_MASK                                     0x07000000
-#define NV50TIC_0_0_MAPR_ZERO                                     0x00000000
-#define NV50TIC_0_0_MAPR_C0                                       0x02000000
-#define NV50TIC_0_0_MAPR_C1                                       0x03000000
-#define NV50TIC_0_0_MAPR_C2                                       0x04000000
-#define NV50TIC_0_0_MAPR_C3                                       0x05000000
-#define NV50TIC_0_0_MAPR_ONE                                      0x07000000
+#define NV50TIC_0_0_MAPB_MASK                                     0x07000000
+#define NV50TIC_0_0_MAPB_ZERO                                     0x00000000
+#define NV50TIC_0_0_MAPB_C0                                       0x02000000
+#define NV50TIC_0_0_MAPB_C1                                       0x03000000
+#define NV50TIC_0_0_MAPB_C2                                       0x04000000
+#define NV50TIC_0_0_MAPB_C3                                       0x05000000
+#define NV50TIC_0_0_MAPB_ONE                                      0x07000000
 #define NV50TIC_0_0_MAPG_MASK                                     0x00e00000
 #define NV50TIC_0_0_MAPG_ZERO                                     0x00000000
 #define NV50TIC_0_0_MAPG_C0                                       0x00400000
@@ -28,27 +28,63 @@
 #define NV50TIC_0_0_MAPG_C2                                       0x00800000
 #define NV50TIC_0_0_MAPG_C3                                       0x00a00000
 #define NV50TIC_0_0_MAPG_ONE                                      0x00e00000
-#define NV50TIC_0_0_MAPB_MASK                                     0x001c0000
-#define NV50TIC_0_0_MAPB_ZERO                                     0x00000000
-#define NV50TIC_0_0_MAPB_C0                                       0x00080000
-#define NV50TIC_0_0_MAPB_C1                                       0x000c0000
-#define NV50TIC_0_0_MAPB_C2                                       0x00100000
-#define NV50TIC_0_0_MAPB_C3                                       0x00140000
-#define NV50TIC_0_0_MAPB_ONE                                      0x001c0000
+#define NV50TIC_0_0_MAPR_MASK                                     0x001c0000
+#define NV50TIC_0_0_MAPR_ZERO                                     0x00000000
+#define NV50TIC_0_0_MAPR_C0                                       0x00080000
+#define NV50TIC_0_0_MAPR_C1                                       0x000c0000
+#define NV50TIC_0_0_MAPR_C2                                       0x00100000
+#define NV50TIC_0_0_MAPR_C3                                       0x00140000
+#define NV50TIC_0_0_MAPR_ONE                                      0x001c0000
 #define NV50TIC_0_0_TYPEA_MASK                                    0x00038000
 #define NV50TIC_0_0_TYPEA_UNORM                                   0x00010000
-#define NV50TIC_0_0_TYPER_MASK                                    0x00007000
-#define NV50TIC_0_0_TYPER_UNORM                                   0x00002000
+#define NV50TIC_0_0_TYPEA_SNORM                                   0x00008000
+#define NV50TIC_0_0_TYPEA_SINT                                    0x00018000
+#define NV50TIC_0_0_TYPEA_UINT                                    0x00020000
+#define NV50TIC_0_0_TYPEA_FLOAT                                   0x00038000
+#define NV50TIC_0_0_TYPEB_MASK                                    0x00007000
+#define NV50TIC_0_0_TYPEB_UNORM                                   0x00002000
+#define NV50TIC_0_0_TYPEB_SNORM                                   0x00001000
+#define NV50TIC_0_0_TYPEB_SINT                                    0x00003000
+#define NV50TIC_0_0_TYPEB_UINT                                    0x00004000
+#define NV50TIC_0_0_TYPEB_FLOAT                                   0x00007000
 #define NV50TIC_0_0_TYPEG_MASK                                    0x00000e00
 #define NV50TIC_0_0_TYPEG_UNORM                                   0x00000400
-#define NV50TIC_0_0_TYPEB_MASK                                    0x000001c0
-#define NV50TIC_0_0_TYPEB_UNORM                                   0x00000080
-#define NV50TIC_0_0_FMT_MASK                                      0x0000003c
+#define NV50TIC_0_0_TYPEG_SNORM                                   0x00000200
+#define NV50TIC_0_0_TYPEG_SINT                                    0x00000600
+#define NV50TIC_0_0_TYPEG_UINT                                    0x00000800
+#define NV50TIC_0_0_TYPEG_FLOAT                                   0x00000e00
+#define NV50TIC_0_0_TYPER_MASK                                    0x000001c0
+#define NV50TIC_0_0_TYPER_UNORM                                   0x00000080
+#define NV50TIC_0_0_TYPER_SNORM                                   0x00000040
+#define NV50TIC_0_0_TYPER_SINT                                    0x000000c0
+#define NV50TIC_0_0_TYPER_UINT                                    0x00000100
+#define NV50TIC_0_0_TYPER_FLOAT                                   0x000001c0
+#define NV50TIC_0_0_FMT_MASK                                      0x0000003f
+#define NV50TIC_0_0_FMT_32_32_32_32                               0x00000001
+#define NV50TIC_0_0_FMT_16_16_16_16                               0x00000003
+#define NV50TIC_0_0_FMT_32_32                                     0x00000004
 #define NV50TIC_0_0_FMT_8_8_8_8                                   0x00000008
 #define NV50TIC_0_0_FMT_2_10_10_10                                0x00000009
+#define NV50TIC_0_0_FMT_16_16                                     0x0000000c
+#define NV50TIC_0_0_FMT_32                                        0x0000000f
+#define NV50TIC_0_0_FMT_4_4_4_4                                   0x00000012
+/* #define NV50TIC_0_0_FMT_1_5_5_5                                0x00000013 */
+#define NV50TIC_0_0_FMT_1_5_5_5                                   0x00000014
 #define NV50TIC_0_0_FMT_5_6_5                                     0x00000015
 #define NV50TIC_0_0_FMT_8_8                                       0x00000018
+#define NV50TIC_0_0_FMT_16                                        0x0000001b
 #define NV50TIC_0_0_FMT_8                                         0x0000001d
+#define NV50TIC_0_0_FMT_5_9_9_9                                   0x00000020
+#define NV50TIC_0_0_FMT_10_11_11                                  0x00000021
+#define NV50TIC_0_0_FMT_DXT1                                      0x00000024
+#define NV50TIC_0_0_FMT_DXT3                                      0x00000025
+#define NV50TIC_0_0_FMT_DXT5                                      0x00000026
+#define NV50TIC_0_0_FMT_RGTC1                                     0x00000027
+#define NV50TIC_0_0_FMT_RGTC2                                     0x00000028
+#define NV50TIC_0_0_FMT_24_8                                      0x00000029
+#define NV50TIC_0_0_FMT_8_24                                      0x0000002a
+#define NV50TIC_0_0_FMT_32_DEPTH                                  0x0000002f
+#define NV50TIC_0_0_FMT_32_8                                      0x00000030
 
 #define NV50TIC_0_1_OFFSET_LOW_MASK                               0xffffffff
 #define NV50TIC_0_1_OFFSET_LOW_SHIFT                                       0
@@ -98,6 +134,7 @@
 #define NV50TSC_1_0_WRAPR_MIRROR_CLAMP_TO_EDGE                   0x00000140
 #define NV50TSC_1_0_WRAPR_MIRROR_CLAMP_TO_BORDER                 0x00000180
 #define NV50TSC_1_0_WRAPR_MIRROR_CLAMP                           0x000001c0
+#define NV50TSC_1_0_MAX_ANISOTROPY_MASK                          0x00700000
 
 #define NV50TSC_1_1_MAGF_MASK                                    0x00000003
 #define NV50TSC_1_1_MAGF_NEAREST                                 0x00000001
@@ -109,17 +146,21 @@
 #define NV50TSC_1_1_MIPF_NONE                                    0x00000040
 #define NV50TSC_1_1_MIPF_NEAREST                                 0x00000080
 #define NV50TSC_1_1_MIPF_LINEAR                                  0x000000c0
+#define NV50TSC_1_1_LOD_BIAS_MASK                                0x01fff000
+#define NV50TSC_1_1_UNKN_ANISO_15                                0x10000000
+#define NV50TSC_1_1_UNKN_ANISO_35                                0x18000000
 
-#define NV50TSC_1_2_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_2_MIN_LOD_MASK                                 0x00000f00
+#define NV50TSC_1_2_MAX_LOD_MASK                                 0x00f00000
 
 #define NV50TSC_1_3_UNKNOWN_MASK                                 0xffffffff
 
-#define NV50TSC_1_4_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_4_BORDER_COLOR_RED_MASK                        0xffffffff
 
-#define NV50TSC_1_5_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_5_BORDER_COLOR_GREEN_MASK                      0xffffffff
 
-#define NV50TSC_1_6_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_6_BORDER_COLOR_BLUE_MASK                       0xffffffff
 
-#define NV50TSC_1_7_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_7_BORDER_COLOR_ALPHA_MASK                      0xffffffff
 
 #endif
diff --git a/src/nv50_xv.c b/src/nv50_xv.c
index fd339f9..d9a6534 100644
--- a/src/nv50_xv.c
+++ b/src/nv50_xv.c
@@ -113,9 +113,9 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DATA(0) | 0x40000000, 16);
 	if (id == FOURCC_YV12 || id == FOURCC_I420) {
 	OUT_RING  (chan, NV50TIC_0_0_MAPA_C0 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
 			 NV50TIC_0_0_MAPB_ZERO | NV50TIC_0_0_TYPEB_UNORM |
+			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
+			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
 			 NV50TIC_0_0_FMT_8);
 	if (OUT_RELOCl(chan, src, packed_y, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD)) {
 		MARK_UNDO(chan);
@@ -131,9 +131,9 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 		return FALSE;
 	}
 	OUT_RING  (chan, NV50TIC_0_0_MAPA_C1 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
+			 NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
 			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_MAPB_ZERO | NV50TIC_0_0_TYPEB_UNORM |
+			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
 			 NV50TIC_0_0_FMT_8_8);
 	if (OUT_RELOCl(chan, src, uv, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD)) {
 		MARK_UNDO(chan);
@@ -150,9 +150,9 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 	}
 	} else {
 	OUT_RING  (chan, NV50TIC_0_0_MAPA_C0 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
 			 NV50TIC_0_0_MAPB_ZERO | NV50TIC_0_0_TYPEB_UNORM |
+			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
+			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
 			 NV50TIC_0_0_FMT_8_8);
 	if (OUT_RELOCl(chan, src, packed_y, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD)) {
 		MARK_UNDO(chan);
@@ -168,9 +168,9 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 		return FALSE;
 	}
 	OUT_RING  (chan, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C1 | NV50TIC_0_0_TYPER_UNORM |
+			 NV50TIC_0_0_MAPB_C1 | NV50TIC_0_0_TYPEB_UNORM |
 			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_MAPB_ZERO | NV50TIC_0_0_TYPEB_UNORM |
+			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
 			 NV50TIC_0_0_FMT_8_8_8_8);
 	if (OUT_RELOCl(chan, src, packed_y, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD)) {
 		MARK_UNDO(chan);
-- 
1.6.6.rc3
