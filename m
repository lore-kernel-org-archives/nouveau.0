From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 14/19] nvc0: don't forget to also clear
	additional layers
Date: Mon, 13 Jan 2014 14:19:30 -0500
Message-ID: <1389640775-25046-15-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_program.c |  2 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 22 ++++++++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index 813795f..e7609fa 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -166,6 +166,8 @@ nv50_fragprog_assign_slots(struct nv50_ir_prog_info *info)
 
          if (info->in[i].sn == TGSI_SEMANTIC_COLOR)
             prog->vp.bfc[info->in[i].si] = j;
+         if (info->in[i].sn == TGSI_SEMANTIC_PRIMID)
+            prog->vp.attrs[2] |= NV50_3D_VP_GP_BUILTIN_ATTR_EN_PRIMITIVE_ID;
 
          prog->in[j].id = i;
          prog->in[j].mask = info->in[i].mask;
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index 5375bd4..8cc7021 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -414,7 +414,7 @@ nvc0_clear(struct pipe_context *pipe, unsigned buffers,
    struct nvc0_context *nvc0 = nvc0_context(pipe);
    struct nouveau_pushbuf *push = nvc0->base.pushbuf;
    struct pipe_framebuffer_state *fb = &nvc0->framebuffer;
-   unsigned i;
+   unsigned i, j;
    uint32_t mode = 0;
 
    /* don't need NEW_BLEND, COLOR_MASK doesn't affect CLEAR_BUFFERS */
@@ -444,12 +444,22 @@ nvc0_clear(struct pipe_context *pipe, unsigned buffers,
       mode |= NVC0_3D_CLEAR_BUFFERS_S;
    }
 
-   BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
-   PUSH_DATA (push, mode);
+   if ((buffers & PIPE_CLEAR_DEPTH) || (buffers & PIPE_CLEAR_STENCIL)) {
+      for (j = fb->zsbuf->u.tex.first_layer; j <= fb->zsbuf->u.tex.last_layer; j++) {
+         BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
+         PUSH_DATA(push, mode | (j << NVC0_3D_CLEAR_BUFFERS_LAYER__SHIFT));
+      }
+   }
 
-   for (i = 1; i < fb->nr_cbufs; i++) {
-      BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
-      PUSH_DATA (push, (i << 6) | 0x3c);
+   if (buffers & PIPE_CLEAR_COLOR) {
+      for (i = 0; i < fb->nr_cbufs; i++) {
+         struct pipe_surface *sf = fb->cbufs[i];
+         for (j = sf->u.tex.first_layer; j <= sf->u.tex.last_layer; j++) {
+            BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
+            PUSH_DATA (push, (i << 6) | 0x3c |
+                       (j << NVC0_3D_CLEAR_BUFFERS_LAYER__SHIFT));
+         }
+      }
    }
 }
 
-- 
1.8.3.2
