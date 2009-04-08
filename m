From: Christoph <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH/Gallium] nv50: update nv50_clear to new interface
Date: Wed, 08 Apr 2009 23:26:16 +0200
Message-ID: <49DD1678.7070309@student.tuwien.ac.at>
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

Commit eb168e26aa63f11a47d70c4555cae30691a2cd57 changed the way
pipe->clear works so I figured I'd try to make an updated version, so
below is the diff - my concerns/uncertainties should be contained in
the comments.

Or maybe you want to do it the way NV40 does it, just calling
surface_fill through a utility function (althoug this does currently
seem to only clear one color buffer) . I'll have a look at my REnouveau
dumps to see if there are push buffer commands to clear buffers of the
other formats, though I'll most probably fail. And I expect you
probably have another/better implementation, but here's my try (I still
need to learn a lot, I hope there are no new bugs at least):

---
 src/gallium/drivers/nv50/nv50_clear.c |   85 ++++++++++++++++++++++----------
 1 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_clear.c b/src/gallium/drivers/nv50/nv50_clear.c
index db44a9d..45d0a00 100644
--- a/src/gallium/drivers/nv50/nv50_clear.c
+++ b/src/gallium/drivers/nv50/nv50_clear.c
@@ -26,10 +26,15 @@

 #include "nv50_context.h"

+#include "util/u_pack_color.h"
+
 void
-nv50_clear(struct pipe_context *pipe, struct pipe_surface *ps,
-	   unsigned clearValue)
+nv50_clear(struct pipe_context *pipe, unsigned buffers,
+		   const float *rgba, double depth, unsigned stencil)
 {
+	struct pipe_surface *ps = NULL;
+	/* silenced 'used uninitialized' warning by setting NULL,
+	 * GCC doesn't know it can't actually happen */
 	struct nv50_context *nv50 = nv50_context(pipe);
 	struct nouveau_channel *chan = nv50->screen->nvws->channel;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
@@ -37,21 +42,45 @@ nv50_clear(struct pipe_context *pipe, struct pipe_surface *ps,
 	struct pipe_scissor_state sc, s_sc = nv50->scissor;
 	unsigned dirty = nv50->dirty;

+	/* if 'no buffers' case is possible, change this to if/return */
+	assert(buffers && (s_fb.nr_cbufs > 0 || s_fb.zsbuf != NULL));
+
 	nv50->dirty = 0;
+	fb.nr_cbufs = 0;

-	if (ps->format == PIPE_FORMAT_Z24S8_UNORM ||
-	    ps->format == PIPE_FORMAT_Z16_UNORM) {
-		fb.nr_cbufs = 0;
-		fb.zsbuf = ps;
+	if (buffers & PIPE_CLEAR_COLOR) {
+		/* Should we clear all color buffers (nv40 doesn't), clear_with_quad
+		 * from the mesa state tracker seems to ? */
+		for (unsigned i = 0; i < s_fb.nr_cbufs; ++i) {
+			unsigned color;
+			ps = s_fb.cbufs[i];
+
+			if (ps->format == PIPE_FORMAT_A8R8G8B8_UNORM) {
+				fb.cbufs[fb.nr_cbufs++] = ps;
+			} else {
+				util_pack_color(rgba, ps->format, &color);
+				pipe->surface_fill(pipe, ps, 0, 0, ps->width, ps->height,
+								   color);
+			}
+		}
+	}
+
+	if (buffers & PIPE_CLEAR_DEPTHSTENCIL) {
+		ps = fb.zsbuf = s_fb.zsbuf;
 	} else {
-		fb.nr_cbufs = 1;
-		fb.cbufs[0] = ps;
 		fb.zsbuf = NULL;
 	}
+
+	/* actually this can't happen, so initializing ps to NULL isn't
+	 * really necessary as well */
+	assert(ps);
+
 	fb.width = ps->width;
 	fb.height = ps->height;
 	pipe->set_framebuffer_state(pipe, &fb);

+	/* XXX: mesa state tracker does clear_with_quad if scissor is enabled,
+	 * so this is probably unnecessary (?) */
 	sc.minx = sc.miny = 0;
 	sc.maxx = fb.width;
 	sc.maxy = fb.height;
@@ -59,28 +88,30 @@ nv50_clear(struct pipe_context *pipe, struct pipe_surface *ps,

 	nv50_state_validate(nv50);

-	switch (ps->format) {
-	case PIPE_FORMAT_A8R8G8B8_UNORM:
+	if (fb.nr_cbufs > 0) {
+		/* Does this clear all color buffers ? */
 		BEGIN_RING(chan, tesla, 0x0d80, 4);
-		OUT_RINGf (chan, ubyte_to_float((clearValue >> 16) & 0xff));
-		OUT_RINGf (chan, ubyte_to_float((clearValue >>  8) & 0xff));
-		OUT_RINGf (chan, ubyte_to_float((clearValue >>  0) & 0xff));
-		OUT_RINGf (chan, ubyte_to_float((clearValue >> 24) & 0xff));
+		OUT_RINGf (chan, rgba[0]);
+		OUT_RINGf (chan, rgba[1]);
+		OUT_RINGf (chan, rgba[2]);
+		OUT_RINGf (chan, rgba[3]);
 		BEGIN_RING(chan, tesla, 0x19d0, 1);
 		OUT_RING  (chan, 0x3c);
-		break;
-	case PIPE_FORMAT_Z24S8_UNORM:
-		BEGIN_RING(chan, tesla, 0x0d90, 1);
-		OUT_RINGf (chan, (float)(clearValue >> 8) * (1.0 / 16777215.0));
-		BEGIN_RING(chan, tesla, 0x0da0, 1);
-		OUT_RING  (chan, clearValue & 0xff);
-		BEGIN_RING(chan, tesla, 0x19d0, 1);
-		OUT_RING  (chan, 0x03);
-		break;
-	default:
-		pipe->surface_fill(pipe, ps, 0, 0, ps->width, ps->height,
-				   clearValue);
-		break;
+	}
+
+	if (fb.zsbuf) {
+		if (ps->format == PIPE_FORMAT_Z24S8_UNORM) {
+			BEGIN_RING(chan, tesla, 0x0d90, 1);
+			OUT_RINGf (chan, (float)depth);
+			BEGIN_RING(chan, tesla, 0x0da0, 1);
+			OUT_RING  (chan, stencil);
+			BEGIN_RING(chan, tesla, 0x19d0, 1);
+			OUT_RING  (chan, 0x03);
+		} else {
+			/* ps has been set to zsbuf above if we get here */
+			pipe->surface_fill(pipe, ps, 0, 0, ps->width, ps->height,
+						util_pack_z_stencil(ps->format, depth, stencil));
+		}
 	}

 	pipe->set_framebuffer_state(pipe, &s_fb);
-- 
1.6.0.6
