From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv/exa: fix 15/16 bits solid fill
Date: Sat, 31 Oct 2009 20:24:52 +0100
Message-ID: <20091031192448.GA10378@joi.lan>
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

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

after this change nouveau passes all fill and blend tests of rendercheck
(before: fill - 108/120, blend - 3323868/3569150)
tested on NV34

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv04_exa.c        |   19 +++++++++----------
 src/nv_accel_common.c |    5 ++++-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/src/nv04_exa.c b/src/nv04_exa.c
index 132c9d5..1852f99 100644
--- a/src/nv04_exa.c
+++ b/src/nv04_exa.c
@@ -81,7 +81,7 @@ NV04EXAPrepareSolid(PixmapPtr pPixmap, int alu, Pixel planemask, Pixel fg)
 	struct nouveau_grobj *rect = pNv->NvRectangle;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pPixmap);
 	unsigned delta = nouveau_pixmap_offset(pPixmap);
-	unsigned int fmt, pitch, color;
+	unsigned int fmt, pitch, fmt2 = NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8;
 
 	WAIT_RING(chan, 64);
 
@@ -102,13 +102,12 @@ NV04EXAPrepareSolid(PixmapPtr pPixmap, int alu, Pixel planemask, Pixel fg)
 	pitch = exaGetPixmapPitch(pPixmap);
 
 	if (pPixmap->drawable.bitsPerPixel == 16) {
-		/* convert to 32bpp */
-		uint32_t r =  (fg&0x1F)          * 255 / 31;
-		uint32_t g = ((fg&0x7E0) >> 5)   * 255 / 63;
-		uint32_t b = ((fg&0xF100) >> 11) * 255 / 31;
-		color = b<<16 | g<<8 | r;
-	} else 
-		color = fg;
+		if (pPixmap->drawable.depth == 16) {
+			fmt2 = NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A16R5G6B5;
+		} else if (pPixmap->drawable.depth == 15) {
+			fmt2 = NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_X16A1R5G5B5;
+		}
+	}
 
 	/* When SURFACE_FORMAT_A8R8G8B8 is used with GDI_RECTANGLE_TEXT, the 
 	 * alpha channel gets forced to 0xFF for some reason.  We're using 
@@ -124,9 +123,9 @@ NV04EXAPrepareSolid(PixmapPtr pPixmap, int alu, Pixel planemask, Pixel fg)
 	OUT_RELOCl(chan, bo, delta, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	BEGIN_RING(chan, rect, NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT, 1);
-	OUT_RING  (chan, NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8);
+	OUT_RING  (chan, fmt2);
 	BEGIN_RING(chan, rect, NV04_GDI_RECTANGLE_TEXT_COLOR1_A, 1);
-	OUT_RING (chan, color);
+	OUT_RING (chan, fg);
 
 	pNv->pdpix = pPixmap;
 	pNv->alu = alu;
diff --git a/src/nv_accel_common.c b/src/nv_accel_common.c
index fa77cc3..3c8911e 100644
--- a/src/nv_accel_common.c
+++ b/src/nv_accel_common.c
@@ -117,7 +117,10 @@ NVAccelGetCtxSurf2DFormatFromPixmap(PixmapPtr pPix, int *fmt_ret)
 		*fmt_ret = NV04_CONTEXT_SURFACES_2D_FORMAT_X8R8G8B8_Z8R8G8B8;
 		break;
 	case 16:
-		*fmt_ret = NV04_CONTEXT_SURFACES_2D_FORMAT_R5G6B5;
+		if (pPix->drawable.depth == 16)
+			*fmt_ret = NV04_CONTEXT_SURFACES_2D_FORMAT_R5G6B5;
+		else
+			*fmt_ret = NV04_CONTEXT_SURFACES_2D_FORMAT_X1R5G5B5_Z1R5G5B5;
 		break;
 	case 8:
 		*fmt_ret = NV04_CONTEXT_SURFACES_2D_FORMAT_Y8;
-- 
1.6.4.4
