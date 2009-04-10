From: Christoph <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH/Gallium] nv50_clear again (might work better)
Date: Fri, 10 Apr 2009 12:04:34 +0200
Message-ID: <49DF19B2.9070409@student.tuwien.ac.at>
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

I've been looking at REnouveau dumps to check how the blob does the clear buffers
thing and they seem to do it a bit differently than what you committed, so I tried
a new version of the clear functions (see how I changed it below) with a little test:

Setup 2 texture render targets (and a depth target) and glClear them to a color
changing with time, then render a triangle textured with the texture bound to
GL_COLOR_ATTACHMENT0/1. It turns out that with my version it works as I expected it
(both textures are the color set with glClearColor), and with the one currently in GIT
the second texture first was just random noise and after I tested my patch and switched
back the color didn't change anymore and stayed the last value my version cleared it to
(probably occupies the same memory area).

My test's here should you want to try it: stud3.tuwien.ac.at/~e0425955/rtx_clear_test.c

(NOTE: since commit 8e753d04045a82062ac34d3b2622eb9dba8af374 the buffers aren't swapped
 anymore with DRI1 because are are no cliprects or something so I reverted it, DRI2 was
 a bit unstable when I used it).

(You'd probably want to put the defines elsewhere or remove them)

---------
diff --git a/src/gallium/drivers/nv50/nv50_clear.c b/src/gallium/drivers/nv50/nv50_clear.c
index eca65a8..d0785fc 100644
--- a/src/gallium/drivers/nv50/nv50_clear.c
+++ b/src/gallium/drivers/nv50/nv50_clear.c
@@ -26,6 +26,13 @@

 #include "nv50_context.h"

+/* If clearing the stencil buffer is not requested, NVIDIA clears both
+   anyway as long as stencil testing is off. */
+#define NV50TCL_CLEAR_DEPTH_BITS 0x01
+#define NV50TCL_CLEAR_STENCIL_BITS 0x02
+#define NV50TCL_CLEAR_DEPTH_STENCIL_BITS 0x03
+#define NV50TCL_CLEAR_COLOR_BITS(i) (0x3c + (0x40 * (i)))
+
 void
 nv50_clear(struct pipe_context *pipe, unsigned buffers,
 	   const float *rgba, double depth, unsigned stencil)
@@ -40,26 +47,32 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
 		return;

 	if (buffers & PIPE_CLEAR_COLOR) {
-		BEGIN_RING(chan, tesla, NV50TCL_CLEAR_COLOR(0), 4*fb->nr_cbufs);
-		for (i = 0; i < fb->nr_cbufs; i++) {
-			OUT_RING  (chan, fui(rgba[0]));
-			OUT_RING  (chan, fui(rgba[1]));
-			OUT_RING  (chan, fui(rgba[2]));
-			OUT_RING  (chan, fui(rgba[3]));
-		}
-		mode |= 0x3c;
+		assert(fb->nr_cbufs > 0);
+		BEGIN_RING(chan, tesla, NV50TCL_CLEAR_COLOR(0), 4);
+		OUT_RING  (chan, fui(rgba[0]));
+		OUT_RING  (chan, fui(rgba[1]));
+		OUT_RING  (chan, fui(rgba[2]));
+		OUT_RING  (chan, fui(rgba[3]));
+		mode |= NV50TCL_CLEAR_COLOR_BITS(0);
 	}

 	if (buffers & PIPE_CLEAR_DEPTHSTENCIL) {
+		assert(fb->zsbuf != NULL);
 		BEGIN_RING(chan, tesla, NV50TCL_CLEAR_DEPTH, 1);
 		OUT_RING  (chan, fui(depth));
 		BEGIN_RING(chan, tesla, NV50TCL_CLEAR_STENCIL, 1);
 		OUT_RING  (chan, stencil & 0xff);
-
-		mode |= 0x03;
+		mode |= NV50TCL_CLEAR_DEPTH_STENCIL_BITS;
 	}

+	assert(mode != 0);
+
 	BEGIN_RING(chan, tesla, NV50TCL_CLEAR_BUFFERS, 1);
 	OUT_RING  (chan, mode);
+
+	for (i = 1; i < fb->nr_cbufs; ++i) {
+		BEGIN_RING(chan, tesla, NV50TCL_CLEAR_BUFFERS, 1);
+		OUT_RING  (chan, NV50TCL_CLEAR_COLOR_BITS(i));
+	}
 }

-------
