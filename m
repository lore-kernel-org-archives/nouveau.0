From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Fix surface_fill alpha
Date: Wed, 30 Dec 2009 05:57:26 +0100
Message-ID: <ff13bc9a0912292057m58858c89qaadf15bce852a9df@mail.gmail.com>
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

Currently surface_fill sets alpha incorrectly to 1.0 when drawing to
A8R8G8B8 instead of the correct value.

xf86-video-nouveau has the following comment confirming the issue:
        /* When SURFACE_FORMAT_A8R8G8B8 is used with GDI_RECTANGLE_TEXT, the
         * alpha channel gets forced to 0xFF for some reason.  We're using
         * SURFACE_FORMAT_Y32 as a workaround
         */

This patch fixes it by always using SURFACE_FORMAT_Y formats in surface_fill.

diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.c
b/src/gallium/drivers/nv04/nv04_surface_2d.c
index 3193086..dfe30c0 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.c
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.c
@@ -34,26 +34,6 @@ nv04_surface_format(enum pipe_format format)
 }

 static INLINE int
-nv04_rect_format(enum pipe_format format)
-{
-	switch (format) {
-	case PIPE_FORMAT_A8_UNORM:
-		return NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8;
-	case PIPE_FORMAT_R5G6B5_UNORM:
-	case PIPE_FORMAT_A8L8_UNORM:
-	case PIPE_FORMAT_Z16_UNORM:
-		return NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A16R5G6B5;
-	case PIPE_FORMAT_X8R8G8B8_UNORM:
-	case PIPE_FORMAT_A8R8G8B8_UNORM:
-	case PIPE_FORMAT_Z24S8_UNORM:
-	case PIPE_FORMAT_Z24X8_UNORM:
-		return NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8;
-	default:
-		return -1;
-	}
-}
-
-static INLINE int
 nv04_scaled_image_format(enum pipe_format format)
 {
 	switch (format) {
@@ -319,13 +299,24 @@ nv04_surface_fill(struct nv04_surface_2d *ctx,
struct pipe_surface *dst,
 	struct nouveau_grobj *rect = ctx->rect;
 	struct nouveau_bo *dst_bo = nouveau_bo(ctx->buf(dst));
 	unsigned dst_pitch = ((struct nv04_surface *)dst)->pitch;
+	int bpp = util_format_get_blocksize(dst->format);
 	int cs2d_format, gdirect_format;

-	cs2d_format = nv04_surface_format(dst->format);
-	assert(cs2d_format >= 0);
-
-	gdirect_format = nv04_rect_format(dst->format);
-	assert(gdirect_format >= 0);
+	if(bpp == 1)
+	{
+		gdirect_format = NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8;
+		cs2d_format = NV04_CONTEXT_SURFACES_2D_FORMAT_Y8;
+	}
+	else if(bpp == 2)
+	{
+		gdirect_format = NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A16R5G6B5;
+		cs2d_format = NV04_CONTEXT_SURFACES_2D_FORMAT_Y16;
+	}
+	else
+	{
+		gdirect_format = NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT_A8R8G8B8;
+		cs2d_format = NV04_CONTEXT_SURFACES_2D_FORMAT_Y32;
+	}

 	MARK_RING (chan, 16, 4);
 	BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAGE_SOURCE, 2);
