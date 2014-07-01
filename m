From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nv50: do an explicit flush on draw when there
	are persistent buffers
Date: Tue,  1 Jul 2014 02:22:27 -0400
Message-ID: <1404195748-12400-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_context.c | 22 ++++++++++++++++++-
 src/gallium/drivers/nouveau/nv50/nv50_context.h |  1 +
 src/gallium/drivers/nouveau/nv50/nv50_vbo.c     | 29 ++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index 3f3a888..c2eb0c0 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -61,7 +61,7 @@ static void
 nv50_memory_barrier(struct pipe_context *pipe, unsigned flags)
 {
    struct nv50_context *nv50 = nv50_context(pipe);
-   int i;
+   int i, s;
 
    if (flags & PIPE_BARRIER_MAPPED_BUFFER) {
       for (i = 0; i < nv50->num_vtxbufs; ++i) {
@@ -74,6 +74,26 @@ nv50_memory_barrier(struct pipe_context *pipe, unsigned flags)
       if (nv50->idxbuf.buffer &&
           nv50->idxbuf.buffer->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
          nv50->base.vbo_dirty = TRUE;
+
+      for (s = 0; s < 3 && !nv50->cb_dirty; ++s) {
+         uint32_t valid = nv50->constbuf_valid[s];
+
+         while (valid && !nv50->cb_dirty) {
+            const unsigned i = ffs(valid) - 1;
+            struct pipe_resource *res;
+
+            valid &= ~(1 << i);
+            if (nv50->constbuf[s][i].user)
+               continue;
+
+            res = nv50->constbuf[s][i].u.buf;
+            if (!res)
+               continue;
+
+            if (res->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
+               nv50->cb_dirty = TRUE;
+         }
+      }
    }
 }
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index 3b7cb18..9c2af40 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -106,6 +106,7 @@ struct nv50_context {
    struct nouveau_bufctx *bufctx;
 
    uint32_t dirty;
+   boolean cb_dirty;
 
    struct {
       uint32_t instance_elts; /* bitmask of per-instance elements */
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index 7c2b7ff..5a4a457 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -747,7 +747,7 @@ nv50_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
    struct nv50_context *nv50 = nv50_context(pipe);
    struct nouveau_pushbuf *push = nv50->base.pushbuf;
-   int i;
+   int i, s;
 
    /* NOTE: caller must ensure that (min_index + index_bias) is >= 0 */
    nv50->vb_elt_first = info->min_index + info->index_bias;
@@ -776,6 +776,33 @@ nv50_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 
    push->kick_notify = nv50_draw_vbo_kick_notify;
 
+   for (s = 0; s < 3 && !nv50->cb_dirty; ++s) {
+      uint32_t valid = nv50->constbuf_valid[s];
+
+      while (valid && !nv50->cb_dirty) {
+         const unsigned i = ffs(valid) - 1;
+         struct pipe_resource *res;
+
+         valid &= ~(1 << i);
+         if (nv50->constbuf[s][i].user)
+            continue;
+
+         res = nv50->constbuf[s][i].u.buf;
+         if (!res)
+            continue;
+
+         if (res->flags & PIPE_RESOURCE_FLAG_MAP_COHERENT)
+            nv50->cb_dirty = TRUE;
+      }
+   }
+
+   /* If there are any coherent constbufs, flush the cache */
+   if (nv50->cb_dirty) {
+      BEGIN_NV04(push, NV50_3D(CODE_CB_FLUSH), 1);
+      PUSH_DATA (push, 0);
+      nv50->cb_dirty = FALSE;
+   }
+
    if (nv50->vbo_fifo) {
       nv50_push_vbo(nv50, info);
       push->kick_notify = nv50_default_kick_notify;
-- 
1.8.5.5
