From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2 1/2] nv50/exa: add support for more color formats
Date: Wed, 30 Dec 2009 21:05:56 +0100
Message-ID: <20091230200556.GA11325@joi.lan>
References: <20091228173717.GA10639@joi.lan>
	<6d4bc9fc0912280955h348381der3ebae761e412ba5c@mail.gmail.com>
	<20091229170634.GA2879@joi.lan>
	<4B3B8FD9.4070605@student.tuwien.ac.at>
	<4B3B9368.3020602@student.tuwien.ac.at>
	<20091230193532.GA10600@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091230193532.GA10600-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Dec 30, 2009 at 08:35:32PM +0100, Marcin Slusarz wrote:
> ps: i'll remove the piece you fixed differently and resend my patch soon

here we go: (2nd patch applies cleanly, so I won't resend it)

---
From 201601b66386d6fc8e28b863eac405f91edee5ed Mon Sep 17 00:00:00 2001
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Thu, 24 Dec 2009 21:29:10 +0100
Subject: [PATCH 1/2] nv50/exa: add support for more color formats

---
 src/nv50_exa.c |  148 ++++++++++++++++++++++++++++++++++++--------------------
 1 files changed, 96 insertions(+), 52 deletions(-)

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index bddc463..c9d4c06 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -442,12 +442,17 @@ NV50EXACheckRenderTarget(PicturePtr ppict)
 				 ppict->pDrawable->height);
 
 	switch (ppict->format) {
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
 	case PICT_a8r8g8b8:
 	case PICT_x8r8g8b8:
 	case PICT_r5g6b5:
 	case PICT_a8:
+	case PICT_x1r5g5b5:
+	case PICT_a1r5g5b5:
+	case PICT_x8b8g8r8:
+	case PICT_a2b10g10r10:
+	case PICT_x2b10g10r10:
+	case PICT_a2r10g10b10:
+	case PICT_x2r10g10b10:
 		break;
 	default:
 		NOUVEAU_FALLBACK("picture format 0x%08x\n", ppict->format);
@@ -469,14 +474,23 @@ NV50EXARenderTarget(PixmapPtr ppix, PicturePtr ppict)
 		NOUVEAU_FALLBACK("pixmap is scanout buffer\n");
 
 	switch (ppict->format) {
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
-		format = NV50TCL_RT_FORMAT_A2B10G10R10_UNORM;
-		break;
 	case PICT_a8r8g8b8: format = NV50TCL_RT_FORMAT_A8R8G8B8_UNORM; break;
 	case PICT_x8r8g8b8: format = NV50TCL_RT_FORMAT_X8R8G8B8_UNORM; break;
 	case PICT_r5g6b5  : format = NV50TCL_RT_FORMAT_R5G6B5_UNORM; break;
 	case PICT_a8      : format = NV50TCL_RT_FORMAT_A8_UNORM; break;
+	case PICT_x1r5g5b5:
+	case PICT_a1r5g5b5:
+		format = NV50TCL_RT_FORMAT_A1R5G5B5_UNORM;
+		break;
+	case PICT_x8b8g8r8: format = NV50TCL_RT_FORMAT_X8B8G8R8_UNORM; break;
+	case PICT_a2b10g10r10:
+	case PICT_x2b10g10r10:
+		format = NV50TCL_RT_FORMAT_A2B10G10R10_UNORM;
+		break;
+	case PICT_a2r10g10b10: 
+	case PICT_x2r10g10b10:
+		format = NV50TCL_RT_FORMAT_A2R10G10B10_UNORM;
+		break;
 	default:
 		NOUVEAU_FALLBACK("invalid picture format\n");
 	}
@@ -510,14 +524,27 @@ NV50EXACheckTexture(PicturePtr ppict, PicturePtr pdpict, int op)
 				 ppict->pDrawable->height);
 
 	switch (ppict->format) {
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
 	case PICT_a8r8g8b8:
 	case PICT_a8b8g8r8:
 	case PICT_x8r8g8b8:
 	case PICT_x8b8g8r8:
 	case PICT_r5g6b5:
 	case PICT_a8:
+	case PICT_x1r5g5b5:
+	case PICT_x1b5g5r5:
+	case PICT_a1r5g5b5:
+	case PICT_a1b5g5r5:
+	case PICT_b5g6r5:
+	case PICT_b8g8r8a8:
+	case PICT_b8g8r8x8:
+	case PICT_a2b10g10r10:
+	case PICT_x2b10g10r10:
+	case PICT_x2r10g10b10:
+	case PICT_a2r10g10b10:
+	case PICT_x4r4g4b4:
+	case PICT_x4b4g4r4:
+	case PICT_a4r4g4b4:
+	case PICT_a4b4g4r4:
 		break;
 	default:
 		NOUVEAU_FALLBACK("picture format 0x%08x\n", ppict->format);
@@ -544,6 +571,13 @@ NV50EXACheckTexture(PicturePtr ppict, PicturePtr pdpict, int op)
 	return TRUE;
 }
 
+#define NV50TIC_0_0_FMT_1_5_5_5                                     0x00000014
+#define NV50TIC_0_0_FMT_4_4_4_4                                     0x00000012
+
+#define _(X1,X2,X3,X4,FMT) (NV50TIC_0_0_TYPER_UNORM | NV50TIC_0_0_TYPEG_UNORM | NV50TIC_0_0_TYPEB_UNORM | NV50TIC_0_0_TYPEA_UNORM | \
+			    NV50TIC_0_0_MAP##X1 | NV50TIC_0_0_MAP##X2 | NV50TIC_0_0_MAP##X3 | NV50TIC_0_0_MAP##X4 | \
+			    NV50TIC_0_0_FMT_##FMT)
+
 static Bool
 NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 {
@@ -569,66 +603,76 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 	BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
 	OUT_RING  (chan, CB_TIC | ((unit * 8) << NV50TCL_CB_ADDR_ID_SHIFT));
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DATA(0) | 0x40000000, 8);
+
 	switch (ppict->format) {
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10):
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_2_10_10_10);
-		break;
-	case PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10):
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_2_10_10_10);
-		break;
 	case PICT_a8r8g8b8:
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_8_8_8_8);
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 8_8_8_8));
 		break;
 	case PICT_a8b8g8r8:
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_8_8_8_8);
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 8_8_8_8));
 		break;
 	case PICT_x8r8g8b8:
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_8_8_8_8);
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 8_8_8_8));
 		break;
 	case PICT_x8b8g8r8:
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_8_8_8_8);
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 8_8_8_8));
 		break;
 	case PICT_r5g6b5:
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_5_6_5);
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 5_6_5));
 		break;
 	case PICT_a8:
-		OUT_RING  (chan, NV50TIC_0_0_MAPA_C0 | NV50TIC_0_0_TYPEA_UNORM |
-			 NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
-			 NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEB_UNORM |
-			 NV50TIC_0_0_MAPB_ZERO | NV50TIC_0_0_TYPEG_UNORM |
-			 NV50TIC_0_0_FMT_8);
+		OUT_RING(chan, _(A_C0, R_ZERO, G_ZERO, B_ZERO, 8));
+		break;
+	case PICT_x1r5g5b5:
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 1_5_5_5));
+		break;
+	case PICT_x1b5g5r5:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 1_5_5_5));
+		break;
+	case PICT_a1r5g5b5:
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 1_5_5_5));
+		break;
+	case PICT_a1b5g5r5:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 1_5_5_5));
+		break;
+	case PICT_b5g6r5:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 5_6_5));
+		break;
+	case PICT_b8g8r8x8:
+		OUT_RING(chan, _(A_ONE, B_C1, G_C2, R_C3, 8_8_8_8));
+		break;
+	case PICT_b8g8r8a8:
+		OUT_RING(chan, _(A_C0, B_C1, G_C2, R_C3, 8_8_8_8));
+		break;
+	case PICT_a2b10g10r10:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 2_10_10_10));
+		break;
+	case PICT_x2b10g10r10:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 2_10_10_10));
+		break;
+	case PICT_x2r10g10b10:
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 2_10_10_10));
+		break;
+	case PICT_a2r10g10b10:
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 2_10_10_10));
+		break;
+	case PICT_x4r4g4b4:
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_ONE, 4_4_4_4));
+		break;
+	case PICT_x4b4g4r4:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_ONE, 4_4_4_4));
+		break;
+	case PICT_a4r4g4b4:
+		OUT_RING(chan, _(R_C0, G_C1, B_C2, A_C3, 4_4_4_4));
+		break;
+	case PICT_a4b4g4r4:
+		OUT_RING(chan, _(B_C0, G_C1, R_C2, A_C3, 4_4_4_4));
 		break;
 	default:
 		NOUVEAU_FALLBACK("invalid picture format, this SHOULD NOT HAPPEN. Expect trouble.\n");
 	}
+#undef _
+
 	if (OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD))
 		return FALSE;
 	OUT_RING  (chan, 0xd0005000 | (bo->tile_mode << 22));
-- 
1.6.6.rc3
