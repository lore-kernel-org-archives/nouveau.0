From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 13/19] nv50: don't forget to also clear additional
	layers
Date: Mon, 13 Jan 2014 14:19:29 -0500
Message-ID: <1389640775-25046-14-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes most of the tests/spec/gl-3.2/layered-rendering/* piglits.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_surface.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index 358f57a..16a4369 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -395,7 +395,7 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
    struct nv50_context *nv50 = nv50_context(pipe);
    struct nouveau_pushbuf *push = nv50->base.pushbuf;
    struct pipe_framebuffer_state *fb = &nv50->framebuffer;
-   unsigned i;
+   unsigned i, j;
    uint32_t mode = 0;
 
    /* don't need NEW_BLEND, COLOR_MASK doesn't affect CLEAR_BUFFERS */
@@ -408,9 +408,6 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
       PUSH_DATAf(push, color->f[1]);
       PUSH_DATAf(push, color->f[2]);
       PUSH_DATAf(push, color->f[3]);
-      mode =
-         NV50_3D_CLEAR_BUFFERS_R | NV50_3D_CLEAR_BUFFERS_G |
-         NV50_3D_CLEAR_BUFFERS_B | NV50_3D_CLEAR_BUFFERS_A;
    }
 
    if (buffers & PIPE_CLEAR_DEPTH) {
@@ -425,12 +422,22 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
       mode |= NV50_3D_CLEAR_BUFFERS_S;
    }
 
-   BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
-   PUSH_DATA (push, mode);
+   if ((buffers & PIPE_CLEAR_DEPTH) || (buffers & PIPE_CLEAR_STENCIL)) {
+      for (j = fb->zsbuf->u.tex.first_layer; j <= fb->zsbuf->u.tex.last_layer; j++) {
+         BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
+         PUSH_DATA(push, mode | (j << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
+      }
+   }
 
-   for (i = 1; i < fb->nr_cbufs; i++) {
-      BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
-      PUSH_DATA (push, (i << 6) | 0x3c);
+   if (buffers & PIPE_CLEAR_COLOR) {
+      for (i = 0; i < fb->nr_cbufs; i++) {
+         struct pipe_surface *sf = fb->cbufs[i];
+         for (j = sf->u.tex.first_layer; j <= sf->u.tex.last_layer; j++) {
+            BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
+            PUSH_DATA (push, (i << 6) | 0x3c |
+                       (j << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
+         }
+      }
    }
 }
 
-- 
1.8.3.2
