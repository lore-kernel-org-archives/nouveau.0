From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] nv50/gallium: small fix for
 nv50_transfer_rect_m2mf (sy <-> dy)
Date: Mon, 11 May 2009 22:27:06 +0200
Message-ID: <4A088A1A.9010108@student.tuwien.ac.at>
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

Hi !
I think src and dst starting positions got mixed up in nv50_transfer_rect_m2mf,
there's a diff at the bottom of this message.
This came up when trying to make the gearbox demo run correctly, but this change
alone doesn't fix it. The mesa state tracker in st_cb_clear.c assumes Y_0_TOP
when clearing the color buffer, but that seems to be wrong for NV50.
When bypassing the viewport transformation, vertex position (0, 0) becomes bottom
left, and not top.
This is a problem in several other places. In st_atom_viewport.c, because of
Y_0_TOP we get inverted viewport parameters, so the translations are wrong there, too,
the image doesn't appear flipped though becasuse scale[1] gets negated again
in nv50_state_validate (but the translation - inconsistenly - remains unchanged).
Now one could do
   so_data  (so, fui(-(nv50->viewport.translate[1] - nv50->framebuffer.height));
as well, which would make the viewport transformation correct, but the ST still
outputs the wrong vertex coordinates for clear_with_quad.
To fix both things, one could just let st_fb_orientation in st_context.h return
Y_0_BOTTOM, but then glCopyTexSubImage2D (calling the appropriate function in
 st_cb_texture.c) flips the image and copies from the wrong offset, since offset
0 in memory is, well, top, as opposed to bottom like it seems to be for vertex
coordinates that bypass the viewport ...

Anyway, I guess I'm a bit confused now, and I don't know where to make the
adjustment, in the nv50 driver or in the mesa state tracker (and how to NOT
break all other drivers); but then, I guess this issue is probably not
so important right now because no one uses and no one is working on the
nv50 driver anyway. I just wanted to mention it once.

Bye, Christoph.

-------------------
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 747195b..41d8160 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -79,13 +79,13 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct pipe_buffer *src,
 		OUT_RELOCl(chan, dst_bo, dst_offset, dst_reloc);
 		if (src_bo->tiled) {
 			BEGIN_RING(chan, m2mf, 0x0218, 1);
-			OUT_RING  (chan, (dy << 16) | sx);
+			OUT_RING  (chan, (sy << 16) | sx);
 		} else {
 			src_offset += (line_count * src_pitch);
 		}
 		if (dst_bo->tiled) {
 			BEGIN_RING(chan, m2mf, 0x0234, 1);
-			OUT_RING  (chan, (sy << 16) | dx);
+			OUT_RING  (chan, (dy << 16) | dx);
 		} else {
 			dst_offset += (line_count * dst_pitch);
 		}

---------------------------
