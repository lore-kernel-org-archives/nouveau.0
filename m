From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] nvc0: add a memory barrier when there are
	persistent UBOs
Date: Tue,  1 Jul 2014 02:22:28 -0400
Message-ID: <1404195748-12400-2-git-send-email-imirkin@alum.mit.edu>
References: <1404195748-12400-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404195748-12400-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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
 src/gallium/drivers/nouveau/nvc0/nvc0_context.c | 22 +++++++++++++++++++-
 src/gallium/drivers/nouveau/nvc0/nvc0_context.h |  2 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_state.c   |  5 +++++
 src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c     | 27 ++++++++++++++++++++++++-
 src/gallium/drivers/nouveau/nvc0/nvc0_winsys.h  |  5 +++--
 5 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
index e5040c4..5928c99 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
@@ -60,7 +60,7 @@ static void
 nvc0_memory_barrier(struct pipe_context *pipe, unsigned flags)
 {
    struct nvc0_context *nvc0 = nvc0_context(pipe);
-   int i;
+   int i, s;
 
    if (flags & PIPE_BARRIER_MAPPED_BUFFER) {
       for (i = 0; i < nvc0->num_vtxbufs; ++i) {
@@ -73,6 +73,26 @@ nvc0_memory_barrier(struct pipe_context *pipe, unsigned flags)
       if (nvc0->idxbuf.buffer &&
           nvc0->idxbuf.buffer->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
          nvc0->base.vbo_dirty = TRUE;
+
+      for (s = 0; s < 5 && !nvc0->cb_dirty; ++s) {
+         uint32_t valid = nvc0->constbuf_valid[s];
+
+         while (valid && !nvc0->cb_dirty) {
+            const unsigned i = ffs(valid) - 1;
+            struct pipe_resource *res;
+
+            valid &= ~(1 << i);
+            if (nvc0->constbuf[s][i].user)
+               continue;
+
+            res = nvc0->constbuf[s][i].u.buf;
+            if (!res)
+               continue;
+
+            if (res->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
+               nvc0->cb_dirty = TRUE;
+         }
+      }
    }
 }
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
index 052f0ba..ebeb8c4 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
@@ -154,6 +154,8 @@ struct nvc0_context {
 
    struct nvc0_constbuf constbuf[6][NVC0_MAX_PIPE_CONSTBUFS];
    uint16_t constbuf_dirty[6];
+   uint16_t constbuf_valid[6];
+   boolean cb_dirty;
 
    struct pipe_vertex_buffer vtxbuf[PIPE_MAX_ATTRIBS];
    unsigned num_vtxbufs;
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
index ef9d479..d1a7cf5 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
@@ -808,10 +808,15 @@ nvc0_set_constant_buffer(struct pipe_context *pipe, uint shader, uint index,
    if (nvc0->constbuf[s][i].user) {
       nvc0->constbuf[s][i].u.data = cb->user_buffer;
       nvc0->constbuf[s][i].size = cb->buffer_size;
+      nvc0->constbuf_valid[s] |= 1 << i;
    } else
    if (cb) {
       nvc0->constbuf[s][i].offset = cb->buffer_offset;
       nvc0->constbuf[s][i].size = align(cb->buffer_size, 0x100);
+      nvc0->constbuf_valid[s] |= 1 << i;
+   }
+   else {
+      nvc0->constbuf_valid[s] &= ~(1 << i);
    }
 }
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index 83d406d..e92ca9c 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
@@ -799,7 +799,7 @@ nvc0_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
    struct nvc0_context *nvc0 = nvc0_context(pipe);
    struct nouveau_pushbuf *push = nvc0->base.pushbuf;
-   int i;
+   int i, s;
 
    /* NOTE: caller must ensure that (min_index + index_bias) is >= 0 */
    nvc0->vb_elt_first = info->min_index + info->index_bias;
@@ -832,6 +832,31 @@ nvc0_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 
    push->kick_notify = nvc0_draw_vbo_kick_notify;
 
+   for (s = 0; s < 5 && !nvc0->cb_dirty; ++s) {
+      uint32_t valid = nvc0->constbuf_valid[s];
+
+      while (valid && !nvc0->cb_dirty) {
+         const unsigned i = ffs(valid) - 1;
+         struct pipe_resource *res;
+
+         valid &= ~(1 << i);
+         if (nvc0->constbuf[s][i].user)
+            continue;
+
+         res = nvc0->constbuf[s][i].u.buf;
+         if (!res)
+            continue;
+
+         if (res->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
+            nvc0->cb_dirty = TRUE;
+      }
+   }
+
+   if (nvc0->cb_dirty) {
+      IMMED_NVC0(push, NVC0_3D(MEM_BARRIER), 0x1011);
+      nvc0->cb_dirty = FALSE;
+   }
+
    if (nvc0->state.vbo_mode) {
       nvc0_push_vbo(nvc0, info);
       push->kick_notify = nvc0_default_kick_notify;
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_winsys.h b/src/gallium/drivers/nouveau/nvc0/nvc0_winsys.h
index 3514d9d..a83b31d 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_winsys.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_winsys.h
@@ -80,8 +80,9 @@ NVC0_FIFO_PKHDR_NI(int subc, int mthd, unsigned size)
 }
 
 static INLINE uint32_t
-NVC0_FIFO_PKHDR_IL(int subc, int mthd, uint8_t data)
+NVC0_FIFO_PKHDR_IL(int subc, int mthd, uint16_t data)
 {
+   assert(data < 0x2000);
    return 0x80000000 | (data << 16) | (subc << 13) | (mthd >> 2);
 }
 
@@ -133,7 +134,7 @@ BEGIN_1IC0(struct nouveau_pushbuf *push, int subc, int mthd, unsigned size)
 }
 
 static INLINE void
-IMMED_NVC0(struct nouveau_pushbuf *push, int subc, int mthd, uint8_t data)
+IMMED_NVC0(struct nouveau_pushbuf *push, int subc, int mthd, uint16_t data)
 {
 #ifndef NVC0_PUSH_EXPLICIT_SPACE_CHECKING
    PUSH_SPACE(push, 1);
-- 
1.8.5.5
