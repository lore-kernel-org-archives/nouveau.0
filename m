From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 2/2] gallium/nouveau: move pushbuf and fences to
	context
Date: Mon, 16 Jun 2014 18:02:11 +0200
Message-ID: <539F1503.2030006@canonical.com>
References: <539F1492.3030101@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <539F1492.3030101-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

nv30 seems to not support dma objects with offset, so simply extend the query_heap to cover the entire notifier,
and use a offset in nv30_context_kick_notify.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
  src/gallium/drivers/nouveau/nouveau_buffer.c       |  14 +-
  src/gallium/drivers/nouveau/nouveau_context.h      |   5 +
  src/gallium/drivers/nouveau/nouveau_fence.c        |  10 +
  src/gallium/drivers/nouveau/nouveau_fence.h        |   6 +-
  src/gallium/drivers/nouveau/nouveau_screen.c       |  16 --
  src/gallium/drivers/nouveau/nouveau_screen.h       |   5 -
  src/gallium/drivers/nouveau/nv30/nv30_context.c    | 104 +++++++--
  src/gallium/drivers/nouveau/nv30/nv30_context.h    |   2 +
  src/gallium/drivers/nouveau/nv30/nv30_draw.c       |   4 +-
  src/gallium/drivers/nouveau/nv30/nv30_query.c      |   6 +-
  src/gallium/drivers/nouveau/nv30/nv30_screen.c     | 160 ++++---------
  src/gallium/drivers/nouveau/nv30/nv30_screen.h     |   4 +-
  .../drivers/nouveau/nv30/nv30_state_validate.c     |   9 +-
  src/gallium/drivers/nouveau/nv50/nv50_context.c    | 128 ++++++++---
  src/gallium/drivers/nouveau/nv50/nv50_context.h    |  33 ++-
  src/gallium/drivers/nouveau/nv50/nv50_program.c    |   2 +-
  src/gallium/drivers/nouveau/nv50/nv50_query.c      |   2 +-
  src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  79 +------
  src/gallium/drivers/nouveau/nv50/nv50_screen.h     |  35 +--
  .../drivers/nouveau/nv50/nv50_state_validate.c     |   8 +-
  src/gallium/drivers/nouveau/nv50/nv50_surface.c    |   6 +-
  src/gallium/drivers/nouveau/nv50/nv50_vbo.c        |   6 +-
  src/gallium/drivers/nouveau/nv50/nv84_video.c      |  16 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_compute.c    |  20 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_compute.h    |   4 +
  src/gallium/drivers/nouveau/nvc0/nvc0_context.c    | 133 ++++++++---
  src/gallium/drivers/nouveau/nvc0/nvc0_context.h    |  32 +++
  src/gallium/drivers/nouveau/nvc0/nvc0_query.c      |   4 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     | 253 +++++++++------------
  src/gallium/drivers/nouveau/nvc0/nvc0_screen.h     |  35 +--
  .../drivers/nouveau/nvc0/nvc0_state_validate.c     |   6 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c    |  10 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c        |   6 +-
  src/gallium/drivers/nouveau/nvc0/nve4_compute.c    |  22 +-
  src/gallium/drivers/nouveau/nvc0/nve4_compute.h    |   3 +
  35 files changed, 625 insertions(+), 563 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.c b/src/gallium/drivers/nouveau/nouveau_buffer.c
index 49ff100..8affb0e 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.c
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.c
@@ -217,8 +217,8 @@ nouveau_transfer_write(struct nouveau_context *nv, struct nouveau_transfer *tx,
     else
        nv->push_data(nv, buf->bo, buf->offset + base, buf->domain, size, data);
  
-   nouveau_fence_ref(nv->screen->fence.current, &buf->fence);
-   nouveau_fence_ref(nv->screen->fence.current, &buf->fence_wr);
+   nouveau_fence_ref(nv->fence.current, &buf->fence);
+   nouveau_fence_ref(nv->fence.current, &buf->fence_wr);
  }
  
  /* Does a CPU wait for the buffer's backing data to become reliably accessible
@@ -288,7 +288,7 @@ nouveau_buffer_transfer_del(struct nouveau_context *nv,
        if (likely(tx->bo)) {
           nouveau_bo_ref(NULL, &tx->bo);
           if (tx->mm)
-            release_allocation(&tx->mm, nv->screen->fence.current);
+            release_allocation(&tx->mm, nv->fence.current);
        } else {
           align_free(tx->map -
                      (tx->base.box.x & NOUVEAU_MIN_BUFFER_MAP_ALIGN_MASK));
@@ -572,11 +572,11 @@ nouveau_copy_buffer(struct nouveau_context *nv,
                      src->bo, src->offset + srcx, src->domain, size);
  
        dst->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
-      nouveau_fence_ref(nv->screen->fence.current, &dst->fence);
-      nouveau_fence_ref(nv->screen->fence.current, &dst->fence_wr);
+      nouveau_fence_ref(nv->fence.current, &dst->fence);
+      nouveau_fence_ref(nv->fence.current, &dst->fence_wr);
  
        src->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
-      nouveau_fence_ref(nv->screen->fence.current, &src->fence);
+      nouveau_fence_ref(nv->fence.current, &src->fence);
     } else {
        struct pipe_box src_box;
        src_box.x = srcx;
@@ -787,7 +787,7 @@ nouveau_buffer_migrate(struct nouveau_context *nv,
  
        nouveau_bo_ref(NULL, &bo);
        if (mm)
-         release_allocation(&mm, screen->fence.current);
+         release_allocation(&mm, nv->fence.current);
     } else
     if (new_domain == NOUVEAU_BO_VRAM && old_domain == 0) {
        struct nouveau_transfer tx;
diff --git a/src/gallium/drivers/nouveau/nouveau_context.h b/src/gallium/drivers/nouveau/nouveau_context.h
index 14608d3..48e2a66 100644
--- a/src/gallium/drivers/nouveau/nouveau_context.h
+++ b/src/gallium/drivers/nouveau/nouveau_context.h
@@ -49,6 +49,8 @@ struct nouveau_context {
        uint32_t buf_cache_count;
        uint32_t buf_cache_frame;
     } stats;
+
+   struct nouveau_fence_mgr fence;
  };
  
  static INLINE struct nouveau_context *
@@ -91,6 +93,7 @@ nouveau_context_destroy(struct nouveau_context *ctx)
        if (ctx->scratch.bo[i])
           nouveau_bo_ref(NULL, &ctx->scratch.bo[i]);
  
+   nouveau_pushbuf_del(&ctx->pushbuf);
     FREE(ctx);
  }
  
@@ -106,4 +109,6 @@ nouveau_context_update_frame_stats(struct nouveau_context *nv)
     }
  }
  
+int nouveau_context_fence_kick(struct nouveau_fence_mgr *);
+
  #endif
diff --git a/src/gallium/drivers/nouveau/nouveau_fence.c b/src/gallium/drivers/nouveau/nouveau_fence.c
index 09b3b1e..b751971 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.c
+++ b/src/gallium/drivers/nouveau/nouveau_fence.c
@@ -23,6 +23,7 @@
  #include "util/u_double_list.h"
  
  #include "nouveau_screen.h"
+#include "nouveau_context.h"
  #include "nouveau_winsys.h"
  #include "nouveau_fence.h"
  
@@ -30,6 +31,15 @@
  #include <sched.h>
  #endif
  
+int nouveau_context_fence_kick(struct nouveau_fence_mgr *mgr)
+{
+   struct nouveau_context *context = NULL;
+
+   context = container_of(mgr, context, fence);
+
+   return nouveau_pushbuf_kick(context->pushbuf, context->pushbuf->channel);
+}
+
  boolean
  nouveau_fence_new(struct nouveau_fence_mgr *mgr, struct nouveau_fence **fence,
                    boolean emit)
diff --git a/src/gallium/drivers/nouveau/nouveau_fence.h b/src/gallium/drivers/nouveau/nouveau_fence.h
index cb44dd3..cdc60ed 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.h
+++ b/src/gallium/drivers/nouveau/nouveau_fence.h
@@ -32,10 +32,10 @@ struct nouveau_fence_work {
  };
  
  struct nouveau_fence {
+   int32_t ref;
     struct nouveau_fence *next;
     struct nouveau_fence_mgr *mgr;
     int state;
-   int ref;
     uint32_t sequence;
     struct list_head work;
  };
@@ -55,10 +55,10 @@ static INLINE void
  nouveau_fence_ref(struct nouveau_fence *fence, struct nouveau_fence **ref)
  {
     if (fence)
-      ++fence->ref;
+      p_atomic_inc(&fence->ref);
  
     if (*ref) {
-      if (--(*ref)->ref == 0)
+      if (p_atomic_dec_zero(&(*ref)->ref))
           nouveau_fence_del(*ref);
     }
  
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 9ea3a46..f78b6e1 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -167,11 +167,6 @@ nouveau_screen_init(struct nouveau_screen *screen, struct nouveau_device *dev)
  	ret = nouveau_client_new(screen->device, &screen->client);
  	if (ret)
  		return ret;
-	ret = nouveau_pushbuf_new(screen->client, screen->channel,
-				  4, 512 * 1024, 1,
-				  &screen->pushbuf);
-	if (ret)
-		return ret;
  
          /* getting CPU time first appears to be more accurate */
          screen->cpu_gpu_time_delta = os_time_get();
@@ -216,19 +211,8 @@ nouveau_screen_fini(struct nouveau_screen *screen)
  	nouveau_mm_destroy(screen->mm_GART);
  	nouveau_mm_destroy(screen->mm_VRAM);
  
-	nouveau_pushbuf_del(&screen->pushbuf);
-
  	nouveau_client_del(&screen->client);
  	nouveau_object_del(&screen->channel);
  
  	nouveau_device_del(&screen->device);
  }
-
-int nouveau_screen_fence_kick(struct nouveau_fence_mgr *mgr)
-{
-	struct nouveau_screen *screen = NULL;
-
-	screen = container_of(mgr, screen, fence);
-
-	return nouveau_pushbuf_kick(screen->pushbuf, screen->pushbuf->channel);
-}
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index 7682214..c1e9bc3 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -22,7 +22,6 @@ struct nouveau_screen {
  	struct nouveau_device *device;
  	struct nouveau_object *channel;
  	struct nouveau_client *client;
-	struct nouveau_pushbuf *pushbuf;
  
  	int refcount;
  
@@ -36,8 +35,6 @@ struct nouveau_screen {
  
  	uint16_t class_3d;
  
-	struct nouveau_fence_mgr fence;
-
  	struct nouveau_mman *mm_VRAM;
  	struct nouveau_mman *mm_GART;
  
@@ -126,6 +123,4 @@ void nouveau_screen_fini(struct nouveau_screen *);
  
  void nouveau_screen_init_vdec(struct nouveau_screen *);
  
-int nouveau_screen_fence_kick(struct nouveau_fence_mgr *);
-
  #endif
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.c b/src/gallium/drivers/nouveau/nv30/nv30_context.c
index 35c66f1..5cb75b8 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.c
@@ -36,29 +36,27 @@
  static void
  nv30_context_kick_notify(struct nouveau_pushbuf *push)
  {
-   struct nouveau_screen *screen;
     struct nv30_context *nv30;
  
     if (!push->user_priv)
        return;
     nv30 = container_of(push->user_priv, nv30, bufctx);
-   screen = &nv30->screen->base;
  
-   nouveau_fence_next(&screen->fence);
-   nouveau_fence_update(&screen->fence, TRUE);
+   nouveau_fence_next(&nv30->base.fence);
+   nouveau_fence_update(&nv30->base.fence, TRUE);
  
     if (push->bufctx) {
        struct nouveau_bufref *bref;
        LIST_FOR_EACH_ENTRY(bref, &push->bufctx->current, thead) {
           struct nv04_resource *res = bref->priv;
           if (res && res->mm) {
-            nouveau_fence_ref(screen->fence.current, &res->fence);
+            nouveau_fence_ref(nv30->base.fence.current, &res->fence);
  
              if (bref->flags & NOUVEAU_BO_RD)
                 res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
  
              if (bref->flags & NOUVEAU_BO_WR) {
-               nouveau_fence_ref(screen->fence.current, &res->fence_wr);
+               nouveau_fence_ref(nv30->base.fence.current, &res->fence_wr);
                 res->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING |
                    NOUVEAU_BUFFER_STATUS_DIRTY;
              }
@@ -75,7 +73,7 @@ nv30_context_flush(struct pipe_context *pipe, struct pipe_fence_handle **fence,
     struct nouveau_pushbuf *push = nv30->base.pushbuf;
  
     if (fence)
-      nouveau_fence_ref(nv30->screen->base.fence.current,
+      nouveau_fence_ref(nv30->base.fence.current,
                          (struct nouveau_fence **)fence);
  
     PUSH_KICK(push);
@@ -159,6 +157,22 @@ nv30_context_destroy(struct pipe_context *pipe)
  {
     struct nv30_context *nv30 = nv30_context(pipe);
  
+   /* need to flush before destroying the bufctx */
+   nouveau_pushbuf_kick(nv30->base.pushbuf, nv30->base.pushbuf->channel);
+
+   if (nv30->base.fence.current) {
+      struct nouveau_fence *current = NULL;
+
+      /* nouveau_fence_wait will create a new current fence, so wait on the
+       * _current_ one, and remove both.
+       */
+      nouveau_fence_ref(nv30->base.fence.current, &current);
+      nouveau_fence_wait(current);
+      nouveau_fence_ref(NULL, &current);
+      nouveau_fence_ref(NULL, &nv30->base.fence.current);
+   }
+   nouveau_heap_free(&nv30->fence);
+
     if (nv30->blitter)
        util_blitter_destroy(nv30->blitter);
  
@@ -173,6 +187,33 @@ nv30_context_destroy(struct pipe_context *pipe)
     nouveau_context_destroy(&nv30->base);
  }
  
+static void
+nv30_context_fence_emit(struct nouveau_fence_mgr *mgr, uint32_t *sequence)
+{
+   struct nv30_context *nv30 = NULL;
+   struct nouveau_pushbuf *push;
+
+   nv30 = container_of(mgr, nv30, base.fence);
+   push = nv30->base.pushbuf;
+
+   *sequence = ++nv30->base.fence.sequence;
+
+   BEGIN_NV04(push, NV30_3D(FENCE_OFFSET), 2);
+   PUSH_DATA (push, nv30->fence->start);
+   PUSH_DATA (push, *sequence);
+}
+
+static uint32_t
+nv30_context_fence_update(struct nouveau_fence_mgr *mgr)
+{
+   struct nv30_context *nv30 = NULL;
+
+   nv30 = container_of(mgr, nv30, base.fence);
+
+   return *(uint32_t *)((char *)nv30->screen->notify->map + nv30->fence->start);
+}
+
+
  #define FAIL_CONTEXT_INIT(str, err)                   \
     do {                                               \
        NOUVEAU_ERR(str, err);                          \
@@ -185,7 +226,6 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
  {
     struct nv30_screen *screen = nv30_screen(pscreen);
     struct nv30_context *nv30 = CALLOC_STRUCT(nv30_context);
-   struct nouveau_pushbuf *push;
     struct pipe_context *pipe;
     int ret;
  
@@ -202,23 +242,37 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
     pipe->destroy = nv30_context_destroy;
     pipe->flush = nv30_context_flush;
  
-   /*XXX: *cough* per-context client */
     nv30->base.client = screen->base.client;
  
-   /*XXX: *cough* per-context pushbufs */
-   push = screen->base.pushbuf;
-   nv30->base.pushbuf = push;
+   ret = nouveau_pushbuf_new(screen->base.client, screen->base.channel,
+                             4, 512 * 1024, 1, &nv30->base.pushbuf);
+   if (ret)
+      goto err;
+
+   /* DMA_FENCE refuses to accept DMA objects with "adjust" filled in,
+    * this means that the address pointed at by the DMA object must
+    * be 4KiB aligned, which means this object needs to be the first
+    * one allocated on the channel.
+    */
+   ret = nouveau_heap_alloc(screen->query_heap, 32, NULL, &nv30->fence);
+
+   if (ret)
+      goto err;
+
     nv30->base.pushbuf->user_priv = &nv30->bufctx; /* hack at validate time */
     nv30->base.pushbuf->rsvd_kick = 16; /* hack in screen before first space */
     nv30->base.pushbuf->kick_notify = nv30_context_kick_notify;
  
+   nv30->base.fence.screen = &screen->base;
+   nv30->base.fence.flush = nouveau_context_fence_kick;
+   nv30->base.fence.emit = nv30_context_fence_emit;
+   nv30->base.fence.update = nv30_context_fence_update;
+
     nv30->base.invalidate_resource_storage = nv30_invalidate_resource_storage;
  
     ret = nouveau_bufctx_new(nv30->base.client, 64, &nv30->bufctx);
-   if (ret) {
-      nv30_context_destroy(pipe);
-      return NULL;
-   }
+   if (ret)
+      goto err;
  
     /*XXX: make configurable with performance vs quality, these defaults
      *     match the binary driver's defaults
@@ -233,6 +287,14 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
     if (debug_get_bool_option("NV30_SWTNL", FALSE))
        nv30->draw_flags |= NV30_NEW_SWTNL;
  
+   nouveau_fence_new(&nv30->base.fence, &nv30->base.fence.current, FALSE);
+
+   if (!screen->cur_ctx) {
+      nv30_screen_init_hwctx(screen, nv30->base.pushbuf);
+      screen->cur_ctx = nv30;
+   }
+   nouveau_pushbuf_bufctx(nv30->base.pushbuf, nv30->bufctx);
+
     nv30->sample_mask = 0xffff;
     nv30_vbo_init(pipe);
     nv30_query_init(pipe);
@@ -247,12 +309,14 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
     nv30_draw_init(pipe);
  
     nv30->blitter = util_blitter_create(pipe);
-   if (!nv30->blitter) {
-      nv30_context_destroy(pipe);
-      return NULL;
-   }
+   if (!nv30->blitter)
+      goto err;
  
     nouveau_context_init_vdec(&nv30->base);
  
     return pipe;
+
+err:
+   nv30_context_destroy(pipe);
+   return NULL;
  }
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.h b/src/gallium/drivers/nouveau/nv30/nv30_context.h
index 7b32aae..e9180a5 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.h
@@ -97,6 +97,8 @@ struct nv30_context {
        unsigned dirty_samplers;
     } fragprog;
  
+   struct nouveau_heap *fence;
+
     struct pipe_framebuffer_state framebuffer;
     struct pipe_blend_color blend_colour;
     struct pipe_stencil_ref stencil_ref;
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_draw.c b/src/gallium/drivers/nouveau/nv30/nv30_draw.c
index 3575c3d..2ee5e58 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_draw.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_draw.c
@@ -119,7 +119,7 @@ nv30_render_draw_elements(struct vbuf_render *render,
  {
     struct nv30_render *r = nv30_render(render);
     struct nv30_context *nv30 = r->nv30;
-   struct nouveau_pushbuf *push = nv30->screen->base.pushbuf;
+   struct nouveau_pushbuf *push = nv30->base.pushbuf;
     unsigned i;
  
     BEGIN_NV04(push, NV30_3D(VTXBUF(0)), r->vertex_info.num_attribs);
@@ -269,7 +269,7 @@ nv30_render_validate(struct nv30_context *nv30)
     struct nv30_render *r = nv30_render(nv30->draw->render);
     struct nv30_rasterizer_stateobj *rast = nv30->rast;
     struct pipe_screen *pscreen = &nv30->screen->base.base;
-   struct nouveau_pushbuf *push = nv30->screen->base.pushbuf;
+   struct nouveau_pushbuf *push = nv30->base.pushbuf;
     struct nouveau_object *eng3d = nv30->screen->eng3d;
     struct nv30_vertprog *vp = nv30->vertprog.program;
     struct vertex_info *vinfo = &r->vertex_info;
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_query.c b/src/gallium/drivers/nouveau/nv30/nv30_query.c
index 01b3817..6b27267 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_query.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_query.c
@@ -39,7 +39,7 @@ struct nv30_query_object {
  static volatile void *
  nv30_ntfy(struct nv30_screen *screen, struct nv30_query_object *qo)
  {
-   struct nv04_notify *query = screen->query->data;
+   struct nv04_notify *query = screen->ntfy->data;
     struct nouveau_bo *notify = screen->notify;
     volatile void *ntfy = NULL;
  
@@ -76,6 +76,10 @@ nv30_query_object_new(struct nv30_screen *screen)
      * spin waiting for one to become free
      */
     while (nouveau_heap_alloc(screen->query_heap, 32, NULL, &qo->hw)) {
+      if (&screen->queries == screen->queries.next) {
+         FREE(qo);
+         return NULL;
+      }
        oq = LIST_FIRST_ENTRY(struct nv30_query_object, &screen->queries, list);
        nv30_query_object_del(screen, &oq);
     }
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index a0518c3..3e86470 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -287,34 +287,6 @@ nv30_screen_is_format_supported(struct pipe_screen *pscreen,
  }
  
  static void
-nv30_screen_fence_emit(struct nouveau_fence_mgr *mgr, uint32_t *sequence)
-{
-   struct nv30_screen *screen = NULL;
-   struct nouveau_pushbuf *push;
-
-   screen = container_of(mgr, screen, base.fence);
-   push = screen->base.pushbuf;
-
-   *sequence = ++screen->base.fence.sequence;
-
-   BEGIN_NV04(push, NV30_3D(FENCE_OFFSET), 2);
-   PUSH_DATA (push, 0);
-   PUSH_DATA (push, *sequence);
-}
-
-static uint32_t
-nv30_screen_fence_update(struct nouveau_fence_mgr *mgr)
-{
-   struct nv30_screen *screen = NULL;
-   struct nv04_notify *fence;
-
-   screen = container_of(mgr, screen, base.fence);
-   fence = screen->fence->data;
-
-   return *(uint32_t *)((char *)screen->notify->map + fence->offset);
-}
-
-static void
  nv30_screen_destroy(struct pipe_screen *pscreen)
  {
     struct nv30_screen *screen = nv30_screen(pscreen);
@@ -322,20 +294,6 @@ nv30_screen_destroy(struct pipe_screen *pscreen)
     if (!nouveau_drm_screen_unref(&screen->base))
        return;
  
-   if (screen->base.fence.current) {
-      struct nouveau_fence *current = NULL;
-
-      /* nouveau_fence_wait will create a new current fence, so wait on the
-       * _current_ one, and remove both.
-       */
-      nouveau_fence_ref(screen->base.fence.current, &current);
-      nouveau_fence_wait(current);
-      nouveau_fence_ref(NULL, &current);
-      nouveau_fence_ref(NULL, &screen->base.fence.current);
-   }
-
-   nouveau_object_del(&screen->query);
-   nouveau_object_del(&screen->fence);
     nouveau_object_del(&screen->ntfy);
  
     nouveau_object_del(&screen->sifm);
@@ -361,10 +319,9 @@ nv30_screen_create(struct nouveau_device *dev)
  {
     struct nv30_screen *screen = CALLOC_STRUCT(nv30_screen);
     struct pipe_screen *pscreen;
-   struct nouveau_pushbuf *push;
     struct nv04_fifo *fifo;
     unsigned oclass = 0;
-   int ret, i;
+   int ret;
  
     if (!screen)
        return NULL;
@@ -411,11 +368,6 @@ nv30_screen_create(struct nouveau_device *dev)
     nv30_resource_screen_init(pscreen);
     nouveau_screen_init_vdec(&screen->base);
  
-   screen->base.fence.screen = &screen->base;
-   screen->base.fence.flush = nouveau_screen_fence_kick;
-   screen->base.fence.emit = nv30_screen_fence_emit;
-   screen->base.fence.update = nv30_screen_fence_update;
-
     ret = nouveau_screen_init(&screen->base, dev);
     if (ret)
        FAIL_SCREEN_INIT("nv30_screen_init failed: %d\n", ret);
@@ -428,46 +380,25 @@ nv30_screen_create(struct nouveau_device *dev)
     }
  
     fifo = screen->base.channel->data;
-   push = screen->base.pushbuf;
-   push->rsvd_kick = 16;
  
     ret = nouveau_object_new(screen->base.channel, 0x00000000, NV01_NULL_CLASS,
                              NULL, 0, &screen->null);
     if (ret)
        FAIL_SCREEN_INIT("error allocating null object: %d\n", ret);
  
-   /* DMA_FENCE refuses to accept DMA objects with "adjust" filled in,
-    * this means that the address pointed at by the DMA object must
-    * be 4KiB aligned, which means this object needs to be the first
-    * one allocated on the channel.
+   /*
+    * DMA_NOTIFY object, we don't actually use this but M2MF fails without
+    *
+    * suballocations are also used for queries and fences.
      */
-   ret = nouveau_object_new(screen->base.channel, 0xbeef1e00,
-                            NOUVEAU_NOTIFIER_CLASS, &(struct nv04_notify) {
-                            .length = 32 }, sizeof(struct nv04_notify),
-                            &screen->fence);
-   if (ret)
-      FAIL_SCREEN_INIT("error allocating fence notifier: %d\n", ret);
-
-   /* DMA_NOTIFY object, we don't actually use this but M2MF fails without */
     ret = nouveau_object_new(screen->base.channel, 0xbeef0301,
                              NOUVEAU_NOTIFIER_CLASS, &(struct nv04_notify) {
-                            .length = 32 }, sizeof(struct nv04_notify),
+                            .length = 4096 }, sizeof(struct nv04_notify),
                              &screen->ntfy);
     if (ret)
        FAIL_SCREEN_INIT("error allocating sync notifier: %d\n", ret);
  
-   /* DMA_QUERY, used to implement occlusion queries, we attempt to allocate
-    * the remainder of the "notifier block" assigned by the kernel for
-    * use as query objects
-    */
-   ret = nouveau_object_new(screen->base.channel, 0xbeef0351,
-                            NOUVEAU_NOTIFIER_CLASS, &(struct nv04_notify) {
-                            .length = 4096 - 128 }, sizeof(struct nv04_notify),
-                            &screen->query);
-   if (ret)
-      FAIL_SCREEN_INIT("error allocating query notifier: %d\n", ret);
-
-   ret = nouveau_heap_init(&screen->query_heap, 0, 4096 - 128);
+   ret = nouveau_heap_init(&screen->query_heap, 32, 4096 - 32);
     if (ret)
        FAIL_SCREEN_INIT("error creating query heap: %d\n", ret);
  
@@ -495,6 +426,44 @@ nv30_screen_create(struct nouveau_device *dev)
     if (ret)
        FAIL_SCREEN_INIT("error allocating 3d object: %d\n", ret);
  
+   ret = nouveau_object_new(screen->base.channel, 0xbeef3901, NV03_M2MF_CLASS,
+                            NULL, 0, &screen->m2mf);
+   if (ret)
+      FAIL_SCREEN_INIT("error allocating m2mf object: %d\n", ret);
+
+   ret = nouveau_object_new(screen->base.channel, 0xbeef6201,
+                            NV10_SURFACE_2D_CLASS, NULL, 0, &screen->surf2d);
+   if (ret)
+      FAIL_SCREEN_INIT("error allocating surf2d object: %d\n", ret);
+
+   if (dev->chipset < 0x40)
+      oclass = NV30_SURFACE_SWZ_CLASS;
+   else
+      oclass = NV40_SURFACE_SWZ_CLASS;
+
+   ret = nouveau_object_new(screen->base.channel, 0xbeef5201, oclass,
+                            NULL, 0, &screen->swzsurf);
+   if (ret)
+      FAIL_SCREEN_INIT("error allocating swizzled surface object: %d\n", ret);
+
+   if (dev->chipset < 0x40)
+      oclass = NV30_SIFM_CLASS;
+   else
+      oclass = NV40_SIFM_CLASS;
+
+   ret = nouveau_object_new(screen->base.channel, 0xbeef7701, oclass,
+                            NULL, 0, &screen->sifm);
+   if (ret)
+      FAIL_SCREEN_INIT("error allocating scaled image object: %d\n", ret);
+
+   return pscreen;
+}
+
+void nv30_screen_init_hwctx(struct nv30_screen *screen, struct nouveau_pushbuf *push)
+{
+   struct nv04_fifo *fifo = screen->base.channel->data;
+   int i;
+
     BEGIN_NV04(push, NV01_SUBC(3D, OBJECT), 1);
     PUSH_DATA (push, screen->eng3d->handle);
     BEGIN_NV04(push, NV30_3D(DMA_NOTIFY), 13);
@@ -507,8 +476,8 @@ nv30_screen_create(struct nouveau_device *dev)
     PUSH_DATA (push, fifo->vram);     /* ZETA */
     PUSH_DATA (push, fifo->vram);     /* VTXBUF0 */
     PUSH_DATA (push, fifo->gart);     /* VTXBUF1 */
-   PUSH_DATA (push, screen->fence->handle);  /* FENCE */
-   PUSH_DATA (push, screen->query->handle);  /* QUERY - intr 0x80 if nullobj */
+   PUSH_DATA (push, screen->ntfy->handle);  /* FENCE */
+   PUSH_DATA (push, screen->ntfy->handle);  /* QUERY - intr 0x80 if nullobj */
     PUSH_DATA (push, screen->null->handle);  /* UNK1AC */
     PUSH_DATA (push, screen->null->handle);  /* UNK1B0 */
     if (screen->eng3d->oclass < NV40_3D_CLASS) {
@@ -562,51 +531,21 @@ nv30_screen_create(struct nouveau_device *dev)
        PUSH_DATA (push, NV40_3D_MIPMAP_ROUNDING_MODE_DOWN);
     }
  
-   ret = nouveau_object_new(screen->base.channel, 0xbeef3901, NV03_M2MF_CLASS,
-                            NULL, 0, &screen->m2mf);
-   if (ret)
-      FAIL_SCREEN_INIT("error allocating m2mf object: %d\n", ret);
-
     BEGIN_NV04(push, NV01_SUBC(M2MF, OBJECT), 1);
     PUSH_DATA (push, screen->m2mf->handle);
     BEGIN_NV04(push, NV03_M2MF(DMA_NOTIFY), 1);
     PUSH_DATA (push, screen->ntfy->handle);
  
-   ret = nouveau_object_new(screen->base.channel, 0xbeef6201,
-                            NV10_SURFACE_2D_CLASS, NULL, 0, &screen->surf2d);
-   if (ret)
-      FAIL_SCREEN_INIT("error allocating surf2d object: %d\n", ret);
-
     BEGIN_NV04(push, NV01_SUBC(SF2D, OBJECT), 1);
     PUSH_DATA (push, screen->surf2d->handle);
     BEGIN_NV04(push, NV04_SF2D(DMA_NOTIFY), 1);
     PUSH_DATA (push, screen->ntfy->handle);
  
-   if (dev->chipset < 0x40)
-      oclass = NV30_SURFACE_SWZ_CLASS;
-   else
-      oclass = NV40_SURFACE_SWZ_CLASS;
-
-   ret = nouveau_object_new(screen->base.channel, 0xbeef5201, oclass,
-                            NULL, 0, &screen->swzsurf);
-   if (ret)
-      FAIL_SCREEN_INIT("error allocating swizzled surface object: %d\n", ret);
-
     BEGIN_NV04(push, NV01_SUBC(SSWZ, OBJECT), 1);
     PUSH_DATA (push, screen->swzsurf->handle);
     BEGIN_NV04(push, NV04_SSWZ(DMA_NOTIFY), 1);
     PUSH_DATA (push, screen->ntfy->handle);
  
-   if (dev->chipset < 0x40)
-      oclass = NV30_SIFM_CLASS;
-   else
-      oclass = NV40_SIFM_CLASS;
-
-   ret = nouveau_object_new(screen->base.channel, 0xbeef7701, oclass,
-                            NULL, 0, &screen->sifm);
-   if (ret)
-      FAIL_SCREEN_INIT("error allocating scaled image object: %d\n", ret);
-
     BEGIN_NV04(push, NV01_SUBC(SIFM, OBJECT), 1);
     PUSH_DATA (push, screen->sifm->handle);
     BEGIN_NV04(push, NV03_SIFM(DMA_NOTIFY), 1);
@@ -614,8 +553,5 @@ nv30_screen_create(struct nouveau_device *dev)
     BEGIN_NV04(push, NV05_SIFM(COLOR_CONVERSION), 1);
     PUSH_DATA (push, NV05_SIFM_COLOR_CONVERSION_TRUNCATE);
  
-   nouveau_pushbuf_kick(push, push->channel);
-
-   nouveau_fence_new(&screen->base.fence, &screen->base.fence.current, FALSE);
-   return pscreen;
+   PUSH_KICK (push);
  }
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.h b/src/gallium/drivers/nouveau/nv30/nv30_screen.h
index 0b3bbbb..7a8c339 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.h
@@ -22,9 +22,7 @@ struct nv30_screen {
     struct nouveau_bo *notify;
  
     struct nouveau_object *ntfy;
-   struct nouveau_object *fence;
  
-   struct nouveau_object *query;
     struct nouveau_heap *query_heap;
     struct list_head queries;
  
@@ -46,4 +44,6 @@ nv30_screen(struct pipe_screen *pscreen)
     return (struct nv30_screen *)pscreen;
  }
  
+extern void nv30_screen_init_hwctx(struct nv30_screen *screen, struct nouveau_pushbuf *push);
+
  #endif
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c b/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c
index f227559..0daab1b 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c
@@ -432,8 +432,10 @@ nv30_state_context_switch(struct nv30_context *nv30)
  {
     struct nv30_context *prev = nv30->screen->cur_ctx;
  
-   if (prev)
+   if (prev) {
+      PUSH_KICK(prev->base.pushbuf);
        nv30->state = prev->state;
+   }
     nv30->dirty = NV30_NEW_ALL;
  
     if (!nv30->vertex)
@@ -458,7 +460,6 @@ nv30_state_context_switch(struct nv30_context *nv30)
  boolean
  nv30_state_validate(struct nv30_context *nv30, boolean hwtnl)
  {
-   struct nouveau_screen *screen = &nv30->screen->base;
     struct nouveau_pushbuf *push = nv30->base.pushbuf;
     struct nouveau_bufctx *bctx = nv30->bufctx;
     struct nouveau_bufref *bref;
@@ -516,13 +517,13 @@ nv30_state_validate(struct nv30_context *nv30, boolean hwtnl)
     LIST_FOR_EACH_ENTRY(bref, &bctx->current, thead) {
        struct nv04_resource *res = bref->priv;
        if (res && res->mm) {
-         nouveau_fence_ref(screen->fence.current, &res->fence);
+         nouveau_fence_ref(nv30->base.fence.current, &res->fence);
  
           if (bref->flags & NOUVEAU_BO_RD)
              res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
  
           if (bref->flags & NOUVEAU_BO_WR) {
-            nouveau_fence_ref(screen->fence.current, &res->fence_wr);
+            nouveau_fence_ref(nv30->base.fence.current, &res->fence_wr);
              res->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
           }
        }
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index af1e436..526f6e0 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -36,14 +36,14 @@ nv50_flush(struct pipe_context *pipe,
             struct pipe_fence_handle **fence,
             unsigned flags)
  {
-   struct nouveau_screen *screen = nouveau_screen(pipe->screen);
+   struct nv50_context *nv50 = nv50_context(pipe);
  
     if (fence)
-      nouveau_fence_ref(screen->fence.current, (struct nouveau_fence **)fence);
+      nouveau_fence_ref(nv50->base.fence.current, (struct nouveau_fence **)fence);
  
-   PUSH_KICK(screen->pushbuf);
+   PUSH_KICK(nv50->base.pushbuf);
  
-   nouveau_context_update_frame_stats(nouveau_context(pipe));
+   nouveau_context_update_frame_stats(&nv50->base);
  }
  
  static void
@@ -80,14 +80,11 @@ nv50_memory_barrier(struct pipe_context *pipe, unsigned flags)
  void
  nv50_default_kick_notify(struct nouveau_pushbuf *push)
  {
-   struct nv50_screen *screen = push->user_priv;
+   struct nv50_context *nv50 = push->user_priv;
  
-   if (screen) {
-      nouveau_fence_next(&screen->base.fence);
-      nouveau_fence_update(&screen->base.fence, TRUE);
-      if (screen->cur_ctx)
-         screen->cur_ctx->state.flushed = TRUE;
-   }
+   nouveau_fence_next(&nv50->base.fence);
+   nouveau_fence_update(&nv50->base.fence, TRUE);
+   nv50->state.flushed = TRUE;
  }
  
  static void
@@ -124,8 +121,27 @@ nv50_destroy(struct pipe_context *pipe)
  
     if (nv50_context_screen(nv50)->cur_ctx == nv50)
        nv50_context_screen(nv50)->cur_ctx = NULL;
-   nouveau_pushbuf_bufctx(nv50->base.pushbuf, NULL);
-   nouveau_pushbuf_kick(nv50->base.pushbuf, nv50->base.pushbuf->channel);
+
+   if (nv50->base.pushbuf) {
+      nouveau_pushbuf_bufctx(nv50->base.pushbuf, NULL);
+      nouveau_pushbuf_kick(nv50->base.pushbuf, nv50->base.pushbuf->channel);
+   }
+
+   if (nv50->base.fence.current) {
+      struct nouveau_fence *current = NULL;
+
+      /* nouveau_fence_wait will create a new current fence, so wait on the
+       * _current_ one, and remove both.
+       */
+      nouveau_fence_ref(nv50->base.fence.current, &current);
+      nouveau_fence_wait(current);
+      nouveau_fence_ref(NULL, &current);
+      nouveau_fence_ref(NULL, &nv50->base.fence.current);
+   }
+   if (nv50->fence.mm) {
+      nouveau_mm_free(nv50->fence.mm);
+      nouveau_bo_ref(NULL, &nv50->fence.bo);
+   }
  
     nv50_context_unreference_resources(nv50);
  
@@ -138,6 +154,40 @@ nv50_destroy(struct pipe_context *pipe)
     nouveau_context_destroy(&nv50->base);
  }
  
+
+static void
+nv50_context_fence_emit(struct nouveau_fence_mgr *mgr, u32 *sequence)
+{
+   struct nv50_context *nv50 = NULL;
+   struct nouveau_pushbuf *push;
+
+   nv50 = container_of(mgr, nv50, base.fence);
+   push = nv50->base.pushbuf;
+
+   /* we need to do it after possible flush in MARK_RING */
+   *sequence = ++nv50->base.fence.sequence;
+
+   PUSH_DATA (push, NV50_FIFO_PKHDR(NV50_3D(QUERY_ADDRESS_HIGH), 4));
+   PUSH_DATAh(push, nv50->fence.bo->offset + nv50->fence.ofs);
+   PUSH_DATA (push, nv50->fence.bo->offset + nv50->fence.ofs);
+   PUSH_DATA (push, *sequence);
+   PUSH_DATA (push, NV50_3D_QUERY_GET_MODE_WRITE_UNK0 |
+                    NV50_3D_QUERY_GET_UNK4 |
+                    NV50_3D_QUERY_GET_UNIT_CROP |
+                    NV50_3D_QUERY_GET_TYPE_QUERY |
+                    NV50_3D_QUERY_GET_QUERY_SELECT_ZERO |
+                    NV50_3D_QUERY_GET_SHORT);
+}
+
+static u32
+nv50_context_fence_update(struct nouveau_fence_mgr *mgr)
+{
+   struct nv50_context *nv50 = NULL;
+
+   nv50 = container_of(mgr, nv50, base.fence);
+   return nv50->fence.map[0];
+}
+
  static int
  nv50_invalidate_resource_storage(struct nouveau_context *ctx,
                                   struct pipe_resource *res,
@@ -240,9 +290,29 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
     if (!nv50_blitctx_create(nv50))
        goto out_err;
  
-   nv50->base.pushbuf = screen->base.pushbuf;
     nv50->base.client = screen->base.client;
  
+   ret = nouveau_pushbuf_new(screen->base.client, screen->base.channel,
+                             4, 512 * 1024, 1, &nv50->base.pushbuf);
+   if (ret)
+       goto out_err;
+
+   nv50->base.pushbuf->kick_notify = nv50_default_kick_notify;
+   nv50->base.pushbuf->user_priv = nv50;
+   nv50->base.pushbuf->rsvd_kick = 5;
+
+   nv50->base.fence.screen = &screen->base;
+   nv50->base.fence.flush = nouveau_context_fence_kick;
+   nv50->base.fence.emit = nv50_context_fence_emit;
+   nv50->base.fence.update = nv50_context_fence_update;
+
+   nv50->fence.mm = nouveau_mm_allocate(screen->base.mm_GART, 16, &nv50->fence.bo, &nv50->fence.ofs);
+   if (!nv50->fence.bo)
+      goto out_err;
+
+   nouveau_bo_map(nv50->fence.bo, NOUVEAU_BO_RD, screen->base.client);
+   nv50->fence.map = (u32 *)((char *)nv50->fence.bo->map + nv50->fence.ofs);
+
     ret = nouveau_bufctx_new(screen->base.client, NV50_BIND_COUNT,
                              &nv50->bufctx_3d);
     if (!ret)
@@ -250,6 +320,14 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
     if (ret)
        goto out_err;
  
+   nouveau_fence_new(&nv50->base.fence, &nv50->base.fence.current, FALSE);
+
+   if (!screen->cur_ctx) {
+      nv50_screen_init_hwctx(screen, nv50->base.pushbuf);
+      screen->cur_ctx = nv50;
+   }
+   nouveau_pushbuf_bufctx(nv50->base.pushbuf, nv50->bufctx);
+
     nv50->base.screen    = &screen->base;
     nv50->base.copy_data = nv50_m2mf_copy_linear;
     nv50->base.push_data = nv50_sifc_linear_u8;
@@ -269,12 +347,6 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
     pipe->memory_barrier = nv50_memory_barrier;
     pipe->get_sample_position = nv50_context_get_sample_position;
  
-   if (!screen->cur_ctx) {
-      screen->cur_ctx = nv50;
-      nouveau_pushbuf_bufctx(screen->base.pushbuf, nv50->bufctx);
-   }
-   nv50->base.pushbuf->kick_notify = nv50_default_kick_notify;
-
     nv50_init_query_functions(nv50);
     nv50_init_surface_functions(nv50);
     nv50_init_state_functions(nv50);
@@ -313,26 +385,20 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
  
     flags = NOUVEAU_BO_GART | NOUVEAU_BO_WR;
  
-   BCTX_REFN_bo(nv50->bufctx_3d, SCREEN, flags, screen->fence.bo);
-   BCTX_REFN_bo(nv50->bufctx, FENCE, flags, screen->fence.bo);
+   BCTX_REFN_bo(nv50->bufctx_3d, SCREEN, flags, nv50->fence.bo);
+   BCTX_REFN_bo(nv50->bufctx, FENCE, flags, nv50->fence.bo);
  
     nv50->base.scratch.bo_size = 2 << 20;
  
     return pipe;
  
  out_err:
-   if (nv50->bufctx_3d)
-      nouveau_bufctx_del(&nv50->bufctx_3d);
-   if (nv50->bufctx)
-      nouveau_bufctx_del(&nv50->bufctx);
-   if (nv50->blit)
-      FREE(nv50->blit);
-   FREE(nv50);
+   nv50_destroy(pipe);
     return NULL;
  }
  
  void
-nv50_bufctx_fence(struct nouveau_bufctx *bufctx, boolean on_flush)
+nv50_bufctx_fence(struct nv50_context *nv50, struct nouveau_bufctx *bufctx, boolean on_flush)
  {
     struct nouveau_list *list = on_flush ? &bufctx->current : &bufctx->pending;
     struct nouveau_list *it;
@@ -341,7 +407,7 @@ nv50_bufctx_fence(struct nouveau_bufctx *bufctx, boolean on_flush)
        struct nouveau_bufref *ref = (struct nouveau_bufref *)it;
        struct nv04_resource *res = ref->priv;
        if (res)
-         nv50_resource_validate(res, (unsigned)ref->priv_data);
+         nv50_resource_validate(nv50, res, (unsigned)ref->priv_data);
     }
  }
  
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index 3b7cb18..529a6da 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -186,6 +186,13 @@ struct nv50_context {
  
     struct nv50_blitctx *blit;
  
+   struct {
+      struct nouveau_mm_allocation *mm;
+      struct nouveau_bo *bo;
+      unsigned ofs;
+      u32 *map;
+   } fence;
+
  #ifdef NV50_WITH_DRAW_MODULE
     struct draw_context *draw;
  #endif
@@ -218,10 +225,34 @@ nv50_context_shader_stage(unsigned pipe)
     }
  }
  
+static INLINE void
+nv50_resource_fence(struct nv50_context *nv50, struct nv04_resource *res, uint32_t flags)
+{
+   if (res->mm) {
+      nouveau_fence_ref(nv50->base.fence.current, &res->fence);
+      if (flags & NOUVEAU_BO_WR)
+         nouveau_fence_ref(nv50->base.fence.current, &res->fence_wr);
+   }
+}
+
+static INLINE void
+nv50_resource_validate(struct nv50_context *nv50, struct nv04_resource *res, uint32_t flags)
+{
+   if (likely(res->bo)) {
+      if (flags & NOUVEAU_BO_WR)
+         res->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING |
+            NOUVEAU_BUFFER_STATUS_DIRTY;
+      if (flags & NOUVEAU_BO_RD)
+         res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
+
+      nv50_resource_fence(nv50, res, flags);
+   }
+}
+
  /* nv50_context.c */
  struct pipe_context *nv50_create(struct pipe_screen *, void *);
  
-void nv50_bufctx_fence(struct nouveau_bufctx *, boolean on_flush);
+void nv50_bufctx_fence(struct nv50_context *nv50, struct nouveau_bufctx *, boolean on_flush);
  
  void nv50_default_kick_notify(struct nouveau_pushbuf *);
  
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index 4744a3c..c489a0d 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -445,7 +445,7 @@ nv50_program_upload_code(struct nv50_context *nv50, struct nv50_program *prog)
     }
     prog->code_base = prog->mem->start;
  
-   ret = nv50_tls_realloc(nv50->screen, prog->tls_space);
+   ret = nv50_tls_realloc(nv50, prog->tls_space);
     if (ret < 0) {
        nouveau_heap_free(&prog->mem);
        return FALSE;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_query.c b/src/gallium/drivers/nouveau/nv50/nv50_query.c
index 6a17139..44ac2e1 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_query.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_query.c
@@ -68,7 +68,7 @@ nv50_query_allocate(struct nv50_context *nv50, struct nv50_query *q, int size)
           if (q->ready)
              nouveau_mm_free(q->mm);
           else
-            nouveau_fence_work(screen->base.fence.current, nouveau_mm_free_work,
+            nouveau_fence_work(nv50->base.fence.current, nouveau_mm_free_work,
                                 q->mm);
        }
     }
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 8195650..4efcac6 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -307,20 +307,6 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
     if (!nouveau_drm_screen_unref(&screen->base))
        return;
  
-   if (screen->base.fence.current) {
-      struct nouveau_fence *current = NULL;
-
-      /* nouveau_fence_wait will create a new current fence, so wait on the
-       * _current_ one, and remove both.
-       */
-      nouveau_fence_ref(screen->base.fence.current, &current);
-      nouveau_fence_wait(current);
-      nouveau_fence_ref(NULL, &current);
-      nouveau_fence_ref(NULL, &screen->base.fence.current);
-   }
-   if (screen->base.pushbuf)
-      screen->base.pushbuf->user_priv = NULL;
-
     if (screen->blitter)
        nv50_blitter_destroy(screen);
  
@@ -329,7 +315,6 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
     nouveau_bo_ref(NULL, &screen->stack_bo);
     nouveau_bo_ref(NULL, &screen->txc);
     nouveau_bo_ref(NULL, &screen->uniforms);
-   nouveau_bo_ref(NULL, &screen->fence.bo);
  
     nouveau_heap_destroy(&screen->vp_code_heap);
     nouveau_heap_destroy(&screen->gp_code_heap);
@@ -347,43 +332,9 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
     FREE(screen);
  }
  
-static void
-nv50_screen_fence_emit(struct nouveau_fence_mgr *mgr, u32 *sequence)
-{
-   struct nv50_screen *screen = NULL;
-   struct nouveau_pushbuf *push;
-
-   screen = container_of(mgr, screen, base.fence);
-   push = screen->base.pushbuf;
-
-   /* we need to do it after possible flush in MARK_RING */
-   *sequence = ++screen->base.fence.sequence;
-
-   PUSH_DATA (push, NV50_FIFO_PKHDR(NV50_3D(QUERY_ADDRESS_HIGH), 4));
-   PUSH_DATAh(push, screen->fence.bo->offset);
-   PUSH_DATA (push, screen->fence.bo->offset);
-   PUSH_DATA (push, *sequence);
-   PUSH_DATA (push, NV50_3D_QUERY_GET_MODE_WRITE_UNK0 |
-                    NV50_3D_QUERY_GET_UNK4 |
-                    NV50_3D_QUERY_GET_UNIT_CROP |
-                    NV50_3D_QUERY_GET_TYPE_QUERY |
-                    NV50_3D_QUERY_GET_QUERY_SELECT_ZERO |
-                    NV50_3D_QUERY_GET_SHORT);
-}
-
-static u32
-nv50_screen_fence_update(struct nouveau_fence_mgr *mgr)
+void
+nv50_screen_init_hwctx(struct nv50_screen *screen, struct nouveau_pushbuf *push)
  {
-   struct nv50_screen *screen = NULL;
-
-   screen = container_of(mgr, screen, base.fence);
-   return screen->fence.map[0];
-}
-
-static void
-nv50_screen_init_hwctx(struct nv50_screen *screen)
-{
-   struct nouveau_pushbuf *push = screen->base.pushbuf;
     struct nv04_fifo *fifo;
     unsigned i;
  
@@ -625,9 +576,10 @@ static int nv50_tls_alloc(struct nv50_screen *screen, unsigned tls_space,
     return 0;
  }
  
-int nv50_tls_realloc(struct nv50_screen *screen, unsigned tls_space)
+int nv50_tls_realloc(struct nv50_context *nv50, unsigned tls_space)
  {
-   struct nouveau_pushbuf *push = screen->base.pushbuf;
+   struct nouveau_pushbuf *push = nv50->base.pushbuf;
+   struct nv50_screen *screen = nv50->screen;
     int ret;
     uint64_t tls_size;
  
@@ -685,9 +637,6 @@ nv50_screen_create(struct nouveau_device *dev)
     screen->base.sysmem_bindings |=
        PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER;
  
-   screen->base.pushbuf->user_priv = screen;
-   screen->base.pushbuf->rsvd_kick = 5;
-
     chan = screen->base.channel;
  
     pscreen->destroy = nv50_screen_destroy;
@@ -714,20 +663,6 @@ nv50_screen_create(struct nouveau_device *dev)
        screen->base.base.is_video_format_supported = nouveau_vp3_screen_video_supported;
     }
  
-   ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0, 4096,
-                        NULL, &screen->fence.bo);
-   if (ret) {
-      NOUVEAU_ERR("Failed to allocate fence bo: %d\n", ret);
-      goto fail;
-   }
-
-   nouveau_bo_map(screen->fence.bo, 0, NULL);
-   screen->fence.map = screen->fence.bo->map;
-   screen->base.fence.screen = &screen->base;
-   screen->base.fence.flush = nouveau_screen_fence_kick;
-   screen->base.fence.emit = nv50_screen_fence_emit;
-   screen->base.fence.update = nv50_screen_fence_update;
-
     ret = nouveau_object_new(chan, 0xbeef0301, NOUVEAU_NOTIFIER_CLASS,
                              &(struct nv04_notify){ .length = 32 },
                              sizeof(struct nv04_notify), &screen->sync);
@@ -856,10 +791,6 @@ nv50_screen_create(struct nouveau_device *dev)
     if (!nv50_blitter_create(screen))
        goto fail;
  
-   nv50_screen_init_hwctx(screen);
-
-   nouveau_fence_new(&screen->base.fence, &screen->base.fence.current, FALSE);
-
     return pscreen;
  
  fail:
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.h b/src/gallium/drivers/nouveau/nv50/nv50_screen.h
index f8ce365..db69b67 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.h
@@ -59,11 +59,6 @@ struct nv50_screen {
        uint32_t lock[NV50_TSC_MAX_ENTRIES / 32];
     } tsc;
  
-   struct {
-      uint32_t *map;
-      struct nouveau_bo *bo;
-   } fence;
-
     struct nouveau_object *sync;
  
     struct nouveau_object *tesla;
@@ -83,32 +78,6 @@ void nv50_blitter_destroy(struct nv50_screen *);
  int nv50_screen_tic_alloc(struct nv50_screen *, void *);
  int nv50_screen_tsc_alloc(struct nv50_screen *, void *);
  
-static INLINE void
-nv50_resource_fence(struct nv04_resource *res, uint32_t flags)
-{
-   struct nv50_screen *screen = nv50_screen(res->base.screen);
-
-   if (res->mm) {
-      nouveau_fence_ref(screen->base.fence.current, &res->fence);
-      if (flags & NOUVEAU_BO_WR)
-         nouveau_fence_ref(screen->base.fence.current, &res->fence_wr);
-   }
-}
-
-static INLINE void
-nv50_resource_validate(struct nv04_resource *res, uint32_t flags)
-{
-   if (likely(res->bo)) {
-      if (flags & NOUVEAU_BO_WR)
-         res->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING |
-            NOUVEAU_BUFFER_STATUS_DIRTY;
-      if (flags & NOUVEAU_BO_RD)
-         res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
-
-      nv50_resource_fence(res, flags);
-   }
-}
-
  struct nv50_format {
     uint32_t rt;
     uint32_t tic;
@@ -150,6 +119,8 @@ nv50_screen_tsc_free(struct nv50_screen *screen, struct nv50_tsc_entry *tsc)
     }
  }
  
-extern int nv50_tls_realloc(struct nv50_screen *screen, unsigned tls_space);
+extern int nv50_tls_realloc(struct nv50_context *nv50, unsigned tls_space);
+
+extern void nv50_screen_init_hwctx(struct nv50_screen *screen, struct nouveau_pushbuf *push);
  
  #endif
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 1dcb961..3c6acb3 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -393,8 +393,10 @@ nv50_switch_pipe_context(struct nv50_context *ctx_to)
  {
     struct nv50_context *ctx_from = ctx_to->screen->cur_ctx;
  
-   if (ctx_from)
+   if (ctx_from) {
+      PUSH_KICK(ctx_from->base.pushbuf);
        ctx_to->state = ctx_from->state;
+   }
  
     ctx_to->dirty = ~0;
     ctx_to->viewports_dirty = ~0;
@@ -494,14 +496,14 @@ nv50_state_validate(struct nv50_context *nv50, uint32_t mask, unsigned words)
           PUSH_DATA (nv50->base.pushbuf, 0);
        }
  
-      nv50_bufctx_fence(nv50->bufctx_3d, FALSE);
+      nv50_bufctx_fence(nv50, nv50->bufctx_3d, FALSE);
     }
     nouveau_pushbuf_bufctx(nv50->base.pushbuf, nv50->bufctx_3d);
     ret = nouveau_pushbuf_validate(nv50->base.pushbuf);
  
     if (unlikely(nv50->state.flushed)) {
        nv50->state.flushed = FALSE;
-      nv50_bufctx_fence(nv50->bufctx_3d, TRUE);
+      nv50_bufctx_fence(nv50, nv50->bufctx_3d, TRUE);
     }
     return !ret;
  }
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index 6e68fb8..fd555d5 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -601,8 +601,8 @@ nv50_clear_buffer(struct pipe_context *pipe,
        PUSH_DATA (push, 0x3c);
     }
  
-   nouveau_fence_ref(nv50->screen->base.fence.current, &buf->fence);
-   nouveau_fence_ref(nv50->screen->base.fence.current, &buf->fence_wr);
+   nouveau_fence_ref(nv50->base.fence.current, &buf->fence);
+   nouveau_fence_ref(nv50->base.fence.current, &buf->fence_wr);
  
     nv50->dirty |= NV50_NEW_FRAMEBUFFER | NV50_NEW_SCISSOR;
  }
@@ -1405,7 +1405,7 @@ nv50_blit_eng2d(struct nv50_context *nv50, const struct pipe_blit_info *info)
           PUSH_DATA (push, srcy >> 32);
        }
     }
-   nv50_bufctx_fence(nv50->bufctx, FALSE);
+   nv50_bufctx_fence(nv50, nv50->bufctx, FALSE);
  
     nouveau_bufctx_reset(nv50->bufctx, NV50_BIND_2D);
  
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index 3fa2f05..9707a45 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -735,11 +735,11 @@ nva0_draw_stream_output(struct nv50_context *nv50,
  static void
  nv50_draw_vbo_kick_notify(struct nouveau_pushbuf *chan)
  {
-   struct nv50_screen *screen = chan->user_priv;
+   struct nv50_context *nv50 = chan->user_priv;
  
-   nouveau_fence_update(&screen->base.fence, TRUE);
+   nouveau_fence_update(&nv50->base.fence, TRUE);
  
-   nv50_bufctx_fence(screen->cur_ctx->bufctx_3d, TRUE);
+   nv50_bufctx_fence(nv50, nv50->bufctx_3d, TRUE);
  }
  
  void
diff --git a/src/gallium/drivers/nouveau/nv50/nv84_video.c b/src/gallium/drivers/nouveau/nv50/nv84_video.c
index a39f572..d5aa43b 100644
--- a/src/gallium/drivers/nouveau/nv50/nv84_video.c
+++ b/src/gallium/drivers/nouveau/nv50/nv84_video.c
@@ -492,17 +492,17 @@ nv84_create_decoder(struct pipe_context *context,
        surf.offset = dec->vpring->size - 0x1000;
        context->clear_render_target(context, &surf.base, &color, 0, 0, 1024, 1);
  
-      PUSH_SPACE(screen->pushbuf, 5);
-      PUSH_REFN(screen->pushbuf, dec->fence, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+      PUSH_SPACE(nv50->base.pushbuf, 5);
+      PUSH_REFN(nv50->base.pushbuf, dec->fence, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
        /* The clear_render_target is done via 3D engine, so use it to write to a
         * sempahore to indicate that it's done.
         */
-      BEGIN_NV04(screen->pushbuf, NV50_3D(QUERY_ADDRESS_HIGH), 4);
-      PUSH_DATAh(screen->pushbuf, dec->fence->offset);
-      PUSH_DATA (screen->pushbuf, dec->fence->offset);
-      PUSH_DATA (screen->pushbuf, 1);
-      PUSH_DATA (screen->pushbuf, 0xf010);
-      PUSH_KICK (screen->pushbuf);
+      BEGIN_NV04(nv50->base.pushbuf, NV50_3D(QUERY_ADDRESS_HIGH), 4);
+      PUSH_DATAh(nv50->base.pushbuf, dec->fence->offset);
+      PUSH_DATA (nv50->base.pushbuf, dec->fence->offset);
+      PUSH_DATA (nv50->base.pushbuf, 1);
+      PUSH_DATA (nv50->base.pushbuf, 0xf010);
+      PUSH_KICK (nv50->base.pushbuf);
  
        PUSH_SPACE(bsp_push, 2 + 12 + 2 + 4 + 3);
  
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_compute.c b/src/gallium/drivers/nouveau/nvc0/nvc0_compute.c
index ad287a2..f769e67 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_compute.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_compute.c
@@ -26,14 +26,12 @@
  #include "nvc0/nvc0_compute.h"
  
  int
-nvc0_screen_compute_setup(struct nvc0_screen *screen,
-                          struct nouveau_pushbuf *push)
+nvc0_screen_compute_setup(struct nvc0_screen *screen)
  {
     struct nouveau_object *chan = screen->base.channel;
     struct nouveau_device *dev = screen->base.device;
     uint32_t obj_class;
     int ret;
-   int i;
  
     switch (dev->chipset & ~0xf) {
     case 0xc0:
@@ -59,8 +57,18 @@ nvc0_screen_compute_setup(struct nvc0_screen *screen,
  
     ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 1 << 12, NULL,
                          &screen->parm);
-   if (ret)
-      return ret;
+   return ret;
+}
+
+void
+nvc0_context_compute_setup(struct nvc0_context *nvc0)
+{
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+   struct nvc0_screen *screen = nvc0->screen;
+   int i;
+
+   if (!screen->parm)
+      return;
  
     BEGIN_NVC0(push, SUBC_COMPUTE(NV01_SUBCHAN_OBJECT), 1);
     PUSH_DATA (push, screen->compute->oclass);
@@ -117,8 +125,6 @@ nvc0_screen_compute_setup(struct nvc0_screen *screen,
     PUSH_DATA (push, (0 << 8) | 1);
  
     /* TODO: textures & samplers */
-
-   return 0;
  }
  
  boolean
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_compute.h b/src/gallium/drivers/nouveau/nvc0/nvc0_compute.h
index 9a1a717..6364c3b 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_compute.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_compute.h
@@ -4,6 +4,10 @@
  #include "nv50/nv50_defs.xml.h"
  #include "nvc0/nvc0_compute.xml.h"
  
+void nvc0_context_compute_setup(struct nvc0_context *nvc0);
+
+int nvc0_screen_compute_setup(struct nvc0_screen *);
+
  boolean
  nvc0_compute_validate_program(struct nvc0_context *nvc0);
  
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
index 52f8a57..1fd3091 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
@@ -37,10 +37,9 @@ nvc0_flush(struct pipe_context *pipe,
             unsigned flags)
  {
     struct nvc0_context *nvc0 = nvc0_context(pipe);
-   struct nouveau_screen *screen = &nvc0->screen->base;
  
     if (fence)
-      nouveau_fence_ref(screen->fence.current, (struct nouveau_fence **)fence);
+      nouveau_fence_ref(nvc0->base.fence.current, (struct nouveau_fence **)fence);
  
     PUSH_KICK(nvc0->base.pushbuf); /* fencing handled in kick_notify */
  
@@ -50,7 +49,8 @@ nvc0_flush(struct pipe_context *pipe,
  static void
  nvc0_texture_barrier(struct pipe_context *pipe)
  {
-   struct nouveau_pushbuf *push = nvc0_context(pipe)->base.pushbuf;
+   struct nvc0_context *nvc0 = nvc0_context(pipe);
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
  
     IMMED_NVC0(push, NVC0_3D(SERIALIZE), 0);
     IMMED_NVC0(push, NVC0_3D(TEX_CACHE_CTL), 0);
@@ -125,11 +125,27 @@ nvc0_destroy(struct pipe_context *pipe)
  
     if (nvc0->screen->cur_ctx == nvc0)
        nvc0->screen->cur_ctx = NULL;
-   /* Unset bufctx, we don't want to revalidate any resources after the flush.
-    * Other contexts will always set their bufctx again on action calls.
-    */
-   nouveau_pushbuf_bufctx(nvc0->base.pushbuf, NULL);
-   nouveau_pushbuf_kick(nvc0->base.pushbuf, nvc0->base.pushbuf->channel);
+
+   if (nvc0->base.pushbuf) {
+      nouveau_pushbuf_bufctx(nvc0->base.pushbuf, NULL);
+      nouveau_pushbuf_kick(nvc0->base.pushbuf, nvc0->base.pushbuf->channel);
+   }
+
+   if (nvc0->base.fence.current) {
+      struct nouveau_fence *current = NULL;
+
+      /* nouveau_fence_wait will create a new current fence, so wait on the
+       * _current_ one, and remove both.
+       */
+      nouveau_fence_ref(nvc0->base.fence.current, &current);
+      nouveau_fence_wait(current);
+      nouveau_fence_ref(NULL, &current);
+      nouveau_fence_ref(NULL, &nvc0->base.fence.current);
+   }
+   if (nvc0->fence.mm) {
+      nouveau_mm_free(nvc0->fence.mm);
+      nouveau_bo_ref(NULL, &nvc0->fence.bo);
+   }
  
     nvc0_context_unreference_resources(nvc0);
     nvc0_blitctx_destroy(nvc0);
@@ -144,15 +160,14 @@ nvc0_destroy(struct pipe_context *pipe)
  void
  nvc0_default_kick_notify(struct nouveau_pushbuf *push)
  {
-   struct nvc0_screen *screen = push->user_priv;
+   struct nvc0_context *nvc0 = push->user_priv;
  
-   if (screen) {
-      nouveau_fence_next(&screen->base.fence);
-      nouveau_fence_update(&screen->base.fence, TRUE);
-      if (screen->cur_ctx)
-         screen->cur_ctx->state.flushed = TRUE;
+   if (nvc0) {
+      nouveau_fence_next(&nvc0->base.fence);
+      nouveau_fence_update(&nvc0->base.fence, TRUE);
+      nvc0->state.flushed = TRUE;
     }
-   NOUVEAU_DRV_STAT(&screen->base, pushbuf_count, 1);
+   NOUVEAU_DRV_STAT(&nvc0->screen->base, pushbuf_count, 1);
  }
  
  static int
@@ -240,6 +255,53 @@ static void
  nvc0_context_get_sample_position(struct pipe_context *, unsigned, unsigned,
                                   float *);
  
+static void
+nvc0_context_fence_emit(struct nouveau_fence_mgr *mgr, u32 *sequence)
+{
+   struct nvc0_context *nvc0 = NULL;
+   struct nouveau_pushbuf *push;
+
+   nvc0 = container_of(mgr, nvc0, base.fence);
+   push = nvc0->base.pushbuf;
+
+   /* we need to do it after possible flush in MARK_RING */
+   *sequence = ++mgr->sequence;
+
+   BEGIN_NVC0(push, NVC0_3D(QUERY_ADDRESS_HIGH), 4);
+   PUSH_DATAh(push, nvc0->fence.bo->offset + nvc0->fence.ofs);
+   PUSH_DATA (push, nvc0->fence.bo->offset + nvc0->fence.ofs);
+   PUSH_DATA (push, *sequence);
+   PUSH_DATA (push, NVC0_3D_QUERY_GET_FENCE | NVC0_3D_QUERY_GET_SHORT |
+              (0xf << NVC0_3D_QUERY_GET_UNIT__SHIFT));
+}
+
+static u32
+nvc0_context_fence_update(struct nouveau_fence_mgr *mgr)
+{
+   struct nvc0_context *nvc0 = NULL;
+
+   nvc0 = container_of(mgr, nvc0, base.fence);
+   return nvc0->fence.map[0];
+}
+
+static void nvc0_init_fence_functions(struct nvc0_context *nvc0)
+{
+   struct nvc0_screen *screen = nvc0->screen;
+
+   nvc0->fence.mm = nouveau_mm_allocate(screen->base.mm_GART, 16, &nvc0->fence.bo, &nvc0->fence.ofs);
+   if (nvc0->fence.bo) {
+      nouveau_bo_map(nvc0->fence.bo, NOUVEAU_BO_RD, screen->base.client);
+      nvc0->fence.map = (u32 *)((char *)nvc0->fence.bo->map + nvc0->fence.ofs);
+
+      nouveau_fence_new(&nvc0->base.fence, &nvc0->base.fence.current, FALSE);
+   }
+
+   nvc0->base.fence.screen = &screen->base;
+   nvc0->base.fence.flush = nouveau_context_fence_kick;
+   nvc0->base.fence.emit = nvc0_context_fence_emit;
+   nvc0->base.fence.update = nvc0_context_fence_update;
+}
+
  struct pipe_context *
  nvc0_create(struct pipe_screen *pscreen, void *priv)
  {
@@ -257,9 +319,17 @@ nvc0_create(struct pipe_screen *pscreen, void *priv)
     if (!nvc0_blitctx_create(nvc0))
        goto out_err;
  
-   nvc0->base.pushbuf = screen->base.pushbuf;
     nvc0->base.client = screen->base.client;
  
+   ret = nouveau_pushbuf_new(screen->base.client, screen->base.channel,
+                             4, 512 * 1024, 1, &nvc0->base.pushbuf);
+   if (ret)
+       goto out_err;
+
+   nvc0->base.pushbuf->kick_notify = nvc0_default_kick_notify;
+   nvc0->base.pushbuf->user_priv = nvc0;
+   nvc0->base.pushbuf->rsvd_kick = 5;
+
     ret = nouveau_bufctx_new(screen->base.client, 2, &nvc0->bufctx);
     if (!ret)
        ret = nouveau_bufctx_new(screen->base.client, NVC0_BIND_3D_COUNT,
@@ -288,11 +358,12 @@ nvc0_create(struct pipe_screen *pscreen, void *priv)
     pipe->memory_barrier = nvc0_memory_barrier;
     pipe->get_sample_position = nvc0_context_get_sample_position;
  
+   nvc0_init_fence_functions(nvc0);
     if (!screen->cur_ctx) {
        screen->cur_ctx = nvc0;
-      nouveau_pushbuf_bufctx(screen->base.pushbuf, nvc0->bufctx);
+      nvc0_screen_init_hwctx(nvc0);
     }
-   screen->base.pushbuf->kick_notify = nvc0_default_kick_notify;
+   nouveau_pushbuf_bufctx(nvc0->base.pushbuf, nvc0->bufctx);
  
     nvc0_init_query_functions(nvc0);
     nvc0_init_surface_functions(nvc0);
@@ -337,10 +408,14 @@ nvc0_create(struct pipe_screen *pscreen, void *priv)
  
     flags = NOUVEAU_BO_GART | NOUVEAU_BO_WR;
  
-   BCTX_REFN_bo(nvc0->bufctx_3d, SCREEN, flags, screen->fence.bo);
-   BCTX_REFN_bo(nvc0->bufctx, FENCE, flags, screen->fence.bo);
-   if (screen->compute)
-      BCTX_REFN_bo(nvc0->bufctx_cp, CP_SCREEN, flags, screen->fence.bo);
+   BCTX_REFN_bo(nvc0->bufctx_3d, SCREEN, flags, screen->notify.bo);
+   BCTX_REFN_bo(nvc0->bufctx_3d, SCREEN, flags, nvc0->fence.bo);
+   BCTX_REFN_bo(nvc0->bufctx, FENCE, flags, screen->notify.bo);
+   BCTX_REFN_bo(nvc0->bufctx, FENCE, flags, nvc0->fence.bo);
+   if (screen->compute) {
+      BCTX_REFN_bo(nvc0->bufctx_3d, CP_SCREEN, flags, screen->notify.bo);
+      BCTX_REFN_bo(nvc0->bufctx_cp, CP_SCREEN, flags, nvc0->fence.bo);
+   }
  
     nvc0->base.scratch.bo_size = 2 << 20;
  
@@ -351,17 +426,7 @@ nvc0_create(struct pipe_screen *pscreen, void *priv)
     return pipe;
  
  out_err:
-   if (nvc0) {
-      if (nvc0->bufctx_3d)
-         nouveau_bufctx_del(&nvc0->bufctx_3d);
-      if (nvc0->bufctx_cp)
-         nouveau_bufctx_del(&nvc0->bufctx_cp);
-      if (nvc0->bufctx)
-         nouveau_bufctx_del(&nvc0->bufctx);
-      if (nvc0->blit)
-         FREE(nvc0->blit);
-      FREE(nvc0);
-   }
+   nvc0_destroy(pipe);
     return NULL;
  }
  
@@ -377,7 +442,7 @@ nvc0_bufctx_fence(struct nvc0_context *nvc0, struct nouveau_bufctx *bufctx,
        struct nouveau_bufref *ref = (struct nouveau_bufref *)it;
        struct nv04_resource *res = ref->priv;
        if (res)
-         nvc0_resource_validate(res, (unsigned)ref->priv_data);
+         nvc0_resource_validate(nvc0, res, (unsigned)ref->priv_data);
        NOUVEAU_DRV_STAT_IFD(count++);
     }
     NOUVEAU_DRV_STAT(&nvc0->screen->base, resource_validate_count, count);
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
index 76416a0..823a181 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
@@ -140,6 +140,13 @@ struct nvc0_context {
        struct nvc0_transform_feedback_state *tfb;
     } state;
  
+   struct {
+      struct nouveau_mm_allocation *mm;
+      struct nouveau_bo *bo;
+      u32 ofs;
+      u32 *map;
+   } fence;
+
     struct nvc0_blend_stateobj *blend;
     struct nvc0_rasterizer_stateobj *rast;
     struct nvc0_zsa_stateobj *zsa;
@@ -356,4 +363,29 @@ void nve4_launch_grid(struct pipe_context *,
  void nvc0_launch_grid(struct pipe_context *,
                        const uint *, const uint *, uint32_t, const void *);
  
+
+static INLINE void
+nvc0_resource_fence(struct nvc0_context *nvc0, struct nv04_resource *res, uint32_t flags)
+{
+   if (res->mm) {
+      nouveau_fence_ref(nvc0->base.fence.current, &res->fence);
+      if (flags & NOUVEAU_BO_WR)
+         nouveau_fence_ref(nvc0->base.fence.current, &res->fence_wr);
+   }
+}
+
+static INLINE void
+nvc0_resource_validate(struct nvc0_context *nvc0, struct nv04_resource *res, uint32_t flags)
+{
+   if (likely(res->bo)) {
+      if (flags & NOUVEAU_BO_WR)
+         res->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING |
+            NOUVEAU_BUFFER_STATUS_DIRTY;
+      if (flags & NOUVEAU_BO_RD)
+         res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
+
+      nvc0_resource_fence(nvc0, res, flags);
+   }
+}
+
  #endif
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_query.c b/src/gallium/drivers/nouveau/nvc0/nvc0_query.c
index 856f685..7438d62 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_query.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_query.c
@@ -79,7 +79,7 @@ nvc0_query_allocate(struct nvc0_context *nvc0, struct nvc0_query *q, int size)
           if (q->state == NVC0_QUERY_STATE_READY)
              nouveau_mm_free(q->u.mm);
           else
-            nouveau_fence_work(screen->base.fence.current,
+            nouveau_fence_work(nvc0->base.fence.current,
                                 nouveau_mm_free_work, q->u.mm);
        }
     }
@@ -411,7 +411,7 @@ nvc0_query_end(struct pipe_context *pipe, struct pipe_query *pq)
        break;
     }
     if (q->is64bit)
-      nouveau_fence_ref(nvc0->screen->base.fence.current, &q->fence);
+      nouveau_fence_ref(nvc0->base.fence.current, &q->fence);
  }
  
  static INLINE void
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index 2a317af..26ddbed 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -31,6 +31,8 @@
  
  #include "nvc0/nvc0_context.h"
  #include "nvc0/nvc0_screen.h"
+#include "nvc0/nvc0_compute.h"
+#include "nvc0/nve4_compute.h"
  
  #include "nvc0/mme/com9097.mme.h"
  
@@ -357,20 +359,6 @@ nvc0_screen_destroy(struct pipe_screen *pscreen)
     if (!nouveau_drm_screen_unref(&screen->base))
        return;
  
-   if (screen->base.fence.current) {
-      struct nouveau_fence *current = NULL;
-
-      /* nouveau_fence_wait will create a new current fence, so wait on the
-       * _current_ one, and remove both.
-       */
-      nouveau_fence_ref(screen->base.fence.current, &current);
-      nouveau_fence_wait(current);
-      nouveau_fence_ref(NULL, &current);
-      nouveau_fence_ref(NULL, &screen->base.fence.current);
-   }
-   if (screen->base.pushbuf)
-      screen->base.pushbuf->user_priv = NULL;
-
     if (screen->blitter)
        nvc0_blitter_destroy(screen);
     if (screen->pm.prog) {
@@ -382,9 +370,11 @@ nvc0_screen_destroy(struct pipe_screen *pscreen)
     nouveau_bo_ref(NULL, &screen->uniform_bo);
     nouveau_bo_ref(NULL, &screen->tls);
     nouveau_bo_ref(NULL, &screen->txc);
-   nouveau_bo_ref(NULL, &screen->fence.bo);
     nouveau_bo_ref(NULL, &screen->poly_cache);
     nouveau_bo_ref(NULL, &screen->parm);
+   nouveau_bo_ref(NULL, &screen->notify.bo);
+   if (screen->notify.mm)
+      nouveau_mm_free(screen->notify.mm);
  
     nouveau_heap_destroy(&screen->lib_code);
     nouveau_heap_destroy(&screen->text_heap);
@@ -405,11 +395,9 @@ nvc0_screen_destroy(struct pipe_screen *pscreen)
  }
  
  static int
-nvc0_graph_set_macro(struct nvc0_screen *screen, uint32_t m, unsigned pos,
+nvc0_graph_set_macro(struct nouveau_pushbuf *push, uint32_t m, unsigned pos,
                       unsigned size, const uint32_t *data)
  {
-   struct nouveau_pushbuf *push = screen->base.pushbuf;
-
     size /= 4;
  
     BEGIN_NVC0(push, SUBC_3D(NVC0_GRAPH_MACRO_ID), 2);
@@ -489,35 +477,6 @@ nvc0_magic_3d_init(struct nouveau_pushbuf *push, uint16_t obj_class)
      * are supposed to do */
  }
  
-static void
-nvc0_screen_fence_emit(struct nouveau_fence_mgr *mgr, u32 *sequence)
-{
-   struct nvc0_screen *screen = NULL;
-   struct nouveau_pushbuf *push;
-
-   screen = container_of(mgr, screen, base.fence);
-   push = screen->base.pushbuf;
-
-   /* we need to do it after possible flush in MARK_RING */
-   *sequence = ++screen->base.fence.sequence;
-
-   BEGIN_NVC0(push, NVC0_3D(QUERY_ADDRESS_HIGH), 4);
-   PUSH_DATAh(push, screen->fence.bo->offset);
-   PUSH_DATA (push, screen->fence.bo->offset);
-   PUSH_DATA (push, *sequence);
-   PUSH_DATA (push, NVC0_3D_QUERY_GET_FENCE | NVC0_3D_QUERY_GET_SHORT |
-              (0xf << NVC0_3D_QUERY_GET_UNIT__SHIFT));
-}
-
-static u32
-nvc0_screen_fence_update(struct nouveau_fence_mgr *mgr)
-{
-   struct nvc0_screen *screen = NULL;
-
-   screen = container_of(mgr, screen, base.fence);
-   return screen->fence.map[0];
-}
-
  static int
  nvc0_screen_init_compute(struct nvc0_screen *screen)
  {
@@ -530,10 +489,10 @@ nvc0_screen_init_compute(struct nvc0_screen *screen)
         * investigate this further before enabling it by default.
         */
        if (debug_get_bool_option("NVC0_COMPUTE", FALSE))
-         return nvc0_screen_compute_setup(screen, screen->base.pushbuf);
+         return nvc0_screen_compute_setup(screen);
        return 0;
     case 0xe0:
-      return nve4_screen_compute_setup(screen, screen->base.pushbuf);
+      return nve4_screen_compute_setup(screen);
     case 0xf0:
     case 0x100:
     case 0x110:
@@ -586,11 +545,9 @@ nvc0_screen_create(struct nouveau_device *dev)
     struct nvc0_screen *screen;
     struct pipe_screen *pscreen;
     struct nouveau_object *chan;
-   struct nouveau_pushbuf *push;
     uint64_t value;
     uint32_t obj_class;
     int ret;
-   unsigned i;
     union nouveau_bo_config mm_config;
  
     switch (dev->chipset & ~0xf) {
@@ -616,9 +573,6 @@ nvc0_screen_create(struct nouveau_device *dev)
        return NULL;
     }
     chan = screen->base.channel;
-   push = screen->base.pushbuf;
-   push->user_priv = screen;
-   push->rsvd_kick = 5;
  
     screen->base.vidmem_bindings |= PIPE_BIND_CONSTANT_BUFFER |
        PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER;
@@ -638,16 +592,12 @@ nvc0_screen_create(struct nouveau_device *dev)
     screen->base.base.get_video_param = nouveau_vp3_screen_get_video_param;
     screen->base.base.is_video_format_supported = nouveau_vp3_screen_video_supported;
  
-   ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0, 4096, NULL,
-                        &screen->fence.bo);
-   if (ret)
+
+   screen->notify.mm = nouveau_mm_allocate(screen->base.mm_GART, 16,
+                                           &screen->notify.bo,
+                                           &screen->notify.ofs);
+   if (!screen->notify.mm)
        goto fail;
-   nouveau_bo_map(screen->fence.bo, 0, NULL);
-   screen->fence.map = screen->fence.bo->map;
-   screen->base.fence.screen = &screen->base;
-   screen->base.fence.flush = nouveau_screen_fence_kick;
-   screen->base.fence.emit = nvc0_screen_fence_emit;
-   screen->base.fence.update = nvc0_screen_fence_update;
  
  
     ret = nouveau_object_new(chan,
@@ -675,39 +625,11 @@ nvc0_screen_create(struct nouveau_device *dev)
     if (ret)
        FAIL_SCREEN_INIT("Error allocating PGRAPH context for M2MF: %d\n", ret);
  
-   BEGIN_NVC0(push, SUBC_M2MF(NV01_SUBCHAN_OBJECT), 1);
-   PUSH_DATA (push, screen->m2mf->oclass);
-   if (screen->m2mf->oclass == NVE4_P2MF_CLASS) {
-      BEGIN_NVC0(push, SUBC_COPY(NV01_SUBCHAN_OBJECT), 1);
-      PUSH_DATA (push, 0xa0b5);
-   }
-
     ret = nouveau_object_new(chan, 0xbeef902d, NVC0_2D_CLASS, NULL, 0,
                              &screen->eng2d);
     if (ret)
        FAIL_SCREEN_INIT("Error allocating PGRAPH context for 2D: %d\n", ret);
  
-   BEGIN_NVC0(push, SUBC_2D(NV01_SUBCHAN_OBJECT), 1);
-   PUSH_DATA (push, screen->eng2d->oclass);
-   BEGIN_NVC0(push, NVC0_2D(SINGLE_GPC), 1);
-   PUSH_DATA (push, 0);
-   BEGIN_NVC0(push, NVC0_2D(OPERATION), 1);
-   PUSH_DATA (push, NVC0_2D_OPERATION_SRCCOPY);
-   BEGIN_NVC0(push, NVC0_2D(CLIP_ENABLE), 1);
-   PUSH_DATA (push, 0);
-   BEGIN_NVC0(push, NVC0_2D(COLOR_KEY_ENABLE), 1);
-   PUSH_DATA (push, 0);
-   BEGIN_NVC0(push, SUBC_2D(0x0884), 1);
-   PUSH_DATA (push, 0x3f);
-   BEGIN_NVC0(push, SUBC_2D(0x0888), 1);
-   PUSH_DATA (push, 1);
-   BEGIN_NVC0(push, NVC0_2D(COND_MODE), 1);
-   PUSH_DATA (push, NVC0_2D_COND_MODE_ALWAYS);
-
-   BEGIN_NVC0(push, SUBC_2D(NVC0_GRAPH_NOTIFY_ADDRESS_HIGH), 2);
-   PUSH_DATAh(push, screen->fence.bo->offset + 16);
-   PUSH_DATA (push, screen->fence.bo->offset + 16);
-
     switch (dev->chipset & ~0xf) {
     case 0x110:
        obj_class = GM107_3D_CLASS;
@@ -750,6 +672,95 @@ nvc0_screen_create(struct nouveau_device *dev)
        FAIL_SCREEN_INIT("Error allocating PGRAPH context for 3D: %d\n", ret);
     screen->base.class_3d = obj_class;
  
+   ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 1 << 17, 1 << 20, NULL,
+                        &screen->text);
+   if (ret)
+      goto fail;
+
+   /* XXX: getting a page fault at the end of the code buffer every few
+    *  launches, don't use the last 256 bytes to work around them - prefetch ?
+    */
+   nouveau_heap_init(&screen->text_heap, 0, (1 << 20) - 0x100);
+
+   ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 1 << 12, 6 << 16, NULL,
+                        &screen->uniform_bo);
+   if (ret)
+      goto fail;
+
+   if (dev->drm_version >= 0x01000101) {
+      ret = nouveau_getparam(dev, NOUVEAU_GETPARAM_GRAPH_UNITS, &value);
+      if (ret) {
+         NOUVEAU_ERR("NOUVEAU_GETPARAM_GRAPH_UNITS failed.\n");
+         goto fail;
+      }
+   } else {
+      if (dev->chipset >= 0xe0 && dev->chipset < 0xf0)
+         value = (8 << 8) | 4;
+      else
+         value = (16 << 8) | 4;
+   }
+   screen->mp_count = value >> 8;
+   screen->mp_count_compute = screen->mp_count;
+
+   nvc0_screen_resize_tls_area(screen, 128 * 16, 0, 0x200);
+
+   screen->tic.entries = CALLOC(4096, sizeof(void *));
+   screen->tsc.entries = screen->tic.entries + 2048;
+
+   mm_config.nvc0.tile_mode = 0;
+   mm_config.nvc0.memtype = 0xfe0;
+   screen->mm_VRAM_fe0 = nouveau_mm_create(dev, NOUVEAU_BO_VRAM, &mm_config);
+
+   if (!nvc0_blitter_create(screen))
+      goto fail;
+
+   if (nvc0_screen_init_compute(screen))
+      goto fail;
+
+   return pscreen;
+
+fail:
+   nvc0_screen_destroy(pscreen);
+   return NULL;
+}
+
+int
+nvc0_screen_init_hwctx(struct nvc0_context *nvc0)
+{
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+   struct nvc0_screen *screen = nvc0->screen;
+   struct nouveau_device *dev = screen->base.device;
+   unsigned i;
+   int ret;
+
+   BEGIN_NVC0(push, SUBC_M2MF(NV01_SUBCHAN_OBJECT), 1);
+   PUSH_DATA (push, screen->m2mf->oclass);
+   if (screen->m2mf->oclass == NVE4_P2MF_CLASS) {
+      BEGIN_NVC0(push, SUBC_COPY(NV01_SUBCHAN_OBJECT), 1);
+      PUSH_DATA (push, 0xa0b5);
+   }
+
+   BEGIN_NVC0(push, SUBC_2D(NV01_SUBCHAN_OBJECT), 1);
+   PUSH_DATA (push, screen->eng2d->oclass);
+   BEGIN_NVC0(push, NVC0_2D(SINGLE_GPC), 1);
+   PUSH_DATA (push, 0);
+   BEGIN_NVC0(push, NVC0_2D(OPERATION), 1);
+   PUSH_DATA (push, NVC0_2D_OPERATION_SRCCOPY);
+   BEGIN_NVC0(push, NVC0_2D(CLIP_ENABLE), 1);
+   PUSH_DATA (push, 0);
+   BEGIN_NVC0(push, NVC0_2D(COLOR_KEY_ENABLE), 1);
+   PUSH_DATA (push, 0);
+   BEGIN_NVC0(push, SUBC_2D(0x0884), 1);
+   PUSH_DATA (push, 0x3f);
+   BEGIN_NVC0(push, SUBC_2D(0x0888), 1);
+   PUSH_DATA (push, 1);
+   BEGIN_NVC0(push, NVC0_2D(COND_MODE), 1);
+   PUSH_DATA (push, NVC0_2D_COND_MODE_ALWAYS);
+
+   BEGIN_NVC0(push, SUBC_2D(NVC0_GRAPH_NOTIFY_ADDRESS_HIGH), 2);
+   PUSH_DATAh(push, screen->notify.bo->offset + screen->notify.ofs);
+   PUSH_DATA (push, screen->notify.bo->offset + screen->notify.ofs);
+
     BEGIN_NVC0(push, SUBC_3D(NV01_SUBCHAN_OBJECT), 1);
     PUSH_DATA (push, screen->eng3d->oclass);
  
@@ -804,21 +815,6 @@ nvc0_screen_create(struct nouveau_device *dev)
  
     nvc0_magic_3d_init(push, screen->eng3d->oclass);
  
-   ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 1 << 17, 1 << 20, NULL,
-                        &screen->text);
-   if (ret)
-      goto fail;
-
-   /* XXX: getting a page fault at the end of the code buffer every few
-    *  launches, don't use the last 256 bytes to work around them - prefetch ?
-    */
-   nouveau_heap_init(&screen->text_heap, 0, (1 << 20) - 0x100);
-
-   ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 1 << 12, 6 << 16, NULL,
-                        &screen->uniform_bo);
-   if (ret)
-      goto fail;
-
     PUSH_REFN (push, screen->uniform_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
  
     for (i = 0; i < 5; ++i) {
@@ -859,23 +855,6 @@ nvc0_screen_create(struct nouveau_device *dev)
     PUSH_DATAh(push, screen->uniform_bo->offset + (5 << 16) + (6 << 9));
     PUSH_DATA (push, screen->uniform_bo->offset + (5 << 16) + (6 << 9));
  
-   if (dev->drm_version >= 0x01000101) {
-      ret = nouveau_getparam(dev, NOUVEAU_GETPARAM_GRAPH_UNITS, &value);
-      if (ret) {
-         NOUVEAU_ERR("NOUVEAU_GETPARAM_GRAPH_UNITS failed.\n");
-         goto fail;
-      }
-   } else {
-      if (dev->chipset >= 0xe0 && dev->chipset < 0xf0)
-         value = (8 << 8) | 4;
-      else
-         value = (16 << 8) | 4;
-   }
-   screen->mp_count = value >> 8;
-   screen->mp_count_compute = screen->mp_count;
-
-   nvc0_screen_resize_tls_area(screen, 128 * 16, 0, 0x200);
-
     BEGIN_NVC0(push, NVC0_3D(CODE_ADDRESS_HIGH), 2);
     PUSH_DATAh(push, screen->text->offset);
     PUSH_DATA (push, screen->text->offset);
@@ -954,7 +933,7 @@ nvc0_screen_create(struct nouveau_device *dev)
     PUSH_DATA (push, 8192 << 16);
     PUSH_DATA (push, 8192 << 16);
  
-#define MK_MACRO(m, n) i = nvc0_graph_set_macro(screen, m, i, sizeof(n), n);
+#define MK_MACRO(m, n) i = nvc0_graph_set_macro(push, m, i, sizeof(n), n);
  
     i = 0;
     MK_MACRO(NVC0_3D_MACRO_VERTEX_ARRAY_PER_INSTANCE, mme9097_per_instance_bf);
@@ -989,28 +968,14 @@ nvc0_screen_create(struct nouveau_device *dev)
  
     IMMED_NVC0(push, NVC0_3D(EDGEFLAG), 1);
  
-   if (nvc0_screen_init_compute(screen))
-      goto fail;
-
-   PUSH_KICK (push);
-
-   screen->tic.entries = CALLOC(4096, sizeof(void *));
-   screen->tsc.entries = screen->tic.entries + 2048;
-
-   mm_config.nvc0.tile_mode = 0;
-   mm_config.nvc0.memtype = 0xfe0;
-   screen->mm_VRAM_fe0 = nouveau_mm_create(dev, NOUVEAU_BO_VRAM, &mm_config);
-
-   if (!nvc0_blitter_create(screen))
-      goto fail;
-
-   nouveau_fence_new(&screen->base.fence, &screen->base.fence.current, FALSE);
-
-   return pscreen;
+   if (dev->chipset < 0xe0)
+      nvc0_context_compute_setup(nvc0);
+   else
+      nve4_context_compute_setup(nvc0);
  
  fail:
-   nvc0_screen_destroy(pscreen);
-   return NULL;
+   PUSH_KICK (push);
+   return ret;
  }
  
  int
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
index c58add5..95843c7 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
@@ -59,9 +59,11 @@ struct nvc0_screen {
     } tsc;
  
     struct {
+      struct nouveau_mm_allocation *mm;
        struct nouveau_bo *bo;
-      uint32_t *map;
-   } fence;
+      u32 ofs;
+      u32 *map;
+   } notify;
  
     struct {
        struct nvc0_program *prog; /* compute state object to read MP counters */
@@ -250,37 +252,10 @@ void nvc0_screen_make_buffers_resident(struct nvc0_screen *);
  int nvc0_screen_tic_alloc(struct nvc0_screen *, void *);
  int nvc0_screen_tsc_alloc(struct nvc0_screen *, void *);
  
-int nve4_screen_compute_setup(struct nvc0_screen *, struct nouveau_pushbuf *);
-int nvc0_screen_compute_setup(struct nvc0_screen *, struct nouveau_pushbuf *);
-
  boolean nvc0_screen_resize_tls_area(struct nvc0_screen *, uint32_t lpos,
                                      uint32_t lneg, uint32_t cstack);
  
-static INLINE void
-nvc0_resource_fence(struct nv04_resource *res, uint32_t flags)
-{
-   struct nvc0_screen *screen = nvc0_screen(res->base.screen);
-
-   if (res->mm) {
-      nouveau_fence_ref(screen->base.fence.current, &res->fence);
-      if (flags & NOUVEAU_BO_WR)
-         nouveau_fence_ref(screen->base.fence.current, &res->fence_wr);
-   }
-}
-
-static INLINE void
-nvc0_resource_validate(struct nv04_resource *res, uint32_t flags)
-{
-   if (likely(res->bo)) {
-      if (flags & NOUVEAU_BO_WR)
-         res->status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING |
-            NOUVEAU_BUFFER_STATUS_DIRTY;
-      if (flags & NOUVEAU_BO_RD)
-         res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
-
-      nvc0_resource_fence(res, flags);
-   }
-}
+int nvc0_screen_init_hwctx(struct nvc0_context *nvc0);
  
  struct nvc0_format {
     uint32_t rt;
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
index dcec910..e808082 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
@@ -130,7 +130,7 @@ nvc0_validate_fb(struct nvc0_context *nvc0)
             PUSH_DATA(push, 0);
             PUSH_DATA(push, 0);
  
-           nvc0_resource_fence(res, NOUVEAU_BO_WR);
+           nvc0_resource_fence(nvc0, res, NOUVEAU_BO_WR);
  
             assert(!fb->zsbuf);
          }
@@ -523,8 +523,10 @@ nvc0_switch_pipe_context(struct nvc0_context *ctx_to)
     struct nvc0_context *ctx_from = ctx_to->screen->cur_ctx;
     unsigned s;
  
-   if (ctx_from)
+   if (ctx_from) {
+      PUSH_KICK(ctx_from->base.pushbuf);
        ctx_to->state = ctx_from->state;
+   }
  
     ctx_to->dirty = ~0;
  
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index c28ec6d..6e4f68b 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -332,7 +332,7 @@ nvc0_clear_render_target(struct pipe_context *pipe,
        IMMED_NVC0(push, NVC0_3D(ZETA_ENABLE), 0);
  
        /* tiled textures don't have to be fenced, they're not mapped directly */
-      nvc0_resource_fence(res, NOUVEAU_BO_WR);
+      nvc0_resource_fence(nvc0, res, NOUVEAU_BO_WR);
     }
  
     BEGIN_NIC0(push, NVC0_3D(CLEAR_BUFFERS), sf->depth);
@@ -479,8 +479,8 @@ nvc0_clear_buffer(struct pipe_context *pipe,
        IMMED_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 0x3c);
     }
  
-   nouveau_fence_ref(nvc0->screen->base.fence.current, &buf->fence);
-   nouveau_fence_ref(nvc0->screen->base.fence.current, &buf->fence_wr);
+   nouveau_fence_ref(nvc0->base.fence.current, &buf->fence);
+   nouveau_fence_ref(nvc0->base.fence.current, &buf->fence_wr);
     nvc0->dirty |= NVC0_NEW_FRAMEBUFFER;
  }
  
@@ -1354,8 +1354,8 @@ nvc0_blit_eng2d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
           PUSH_DATA (push, srcy >> 32);
        }
     }
-   nvc0_resource_validate(&dst->base, NOUVEAU_BO_WR);
-   nvc0_resource_validate(&src->base, NOUVEAU_BO_RD);
+   nvc0_resource_validate(nvc0, &dst->base, NOUVEAU_BO_WR);
+   nvc0_resource_validate(nvc0, &src->base, NOUVEAU_BO_RD);
  
     nouveau_bufctx_reset(nvc0->bufctx, NVC0_BIND_2D);
  
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index 6406cf5..fbb18cf 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
@@ -557,11 +557,11 @@ nvc0_prim_gl(unsigned prim)
  static void
  nvc0_draw_vbo_kick_notify(struct nouveau_pushbuf *push)
  {
-   struct nvc0_screen *screen = push->user_priv;
+   struct nvc0_context *nvc0 = push->user_priv;
  
-   nouveau_fence_update(&screen->base.fence, TRUE);
+   nouveau_fence_update(&nvc0->base.fence, TRUE);
  
-   NOUVEAU_DRV_STAT(&screen->base, pushbuf_count, 1);
+   NOUVEAU_DRV_STAT(&nvc0->screen->base, pushbuf_count, 1);
  }
  
  static void
diff --git a/src/gallium/drivers/nouveau/nvc0/nve4_compute.c b/src/gallium/drivers/nouveau/nvc0/nve4_compute.c
index f243316..90848b4 100644
--- a/src/gallium/drivers/nouveau/nvc0/nve4_compute.c
+++ b/src/gallium/drivers/nouveau/nvc0/nve4_compute.c
@@ -34,12 +34,10 @@ static void nve4_compute_dump_launch_desc(const struct nve4_cp_launch_desc *);
  
  
  int
-nve4_screen_compute_setup(struct nvc0_screen *screen,
-                          struct nouveau_pushbuf *push)
+nve4_screen_compute_setup(struct nvc0_screen *screen)
  {
     struct nouveau_device *dev = screen->base.device;
     struct nouveau_object *chan = screen->base.channel;
-   unsigned i;
     int ret;
     uint32_t obj_class;
  
@@ -65,9 +63,21 @@ nve4_screen_compute_setup(struct nvc0_screen *screen,
  
     ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, NVE4_CP_PARAM_SIZE, NULL,
                          &screen->parm);
-   if (ret)
-      return ret;
+   return ret;
+}
+
+void
+nve4_context_compute_setup(struct nvc0_context *nvc0)
+{
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+   struct nvc0_screen *screen = nvc0->screen;
+   uint32_t obj_class;
+   unsigned i;
  
+   if (!screen->parm)
+      return;
+
+   obj_class = screen->compute->oclass;
     BEGIN_NVC0(push, SUBC_COMPUTE(NV01_SUBCHAN_OBJECT), 1);
     PUSH_DATA (push, screen->compute->oclass);
  
@@ -176,8 +186,6 @@ nve4_screen_compute_setup(struct nvc0_screen *screen,
  
     BEGIN_NVC0(push, NVE4_COMPUTE(FLUSH), 1);
     PUSH_DATA (push, NVE4_COMPUTE_FLUSH_CB);
-
-   return 0;
  }
  
  
diff --git a/src/gallium/drivers/nouveau/nvc0/nve4_compute.h b/src/gallium/drivers/nouveau/nvc0/nve4_compute.h
index 79862b7..a4be963 100644
--- a/src/gallium/drivers/nouveau/nvc0/nve4_compute.h
+++ b/src/gallium/drivers/nouveau/nvc0/nve4_compute.h
@@ -5,6 +5,9 @@
  #include "nv50/nv50_defs.xml.h"
  #include "nvc0/nve4_compute.xml.h"
  
+void nve4_context_compute_setup(struct nvc0_context *nvc0);
+int nve4_screen_compute_setup(struct nvc0_screen *);
+
  /* Input space is implemented as c0[], to which we bind the screen->parm bo.
   */
  #define NVE4_CP_INPUT_USER           0x0000
-- 
2.0.0
