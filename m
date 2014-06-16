From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 1/2] gallium/nouveau: decouple nouveau_fence
 implementation from screen
Date: Mon, 16 Jun 2014 18:00:18 +0200
Message-ID: <539F1492.3030101@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
  src/gallium/drivers/nouveau/nouveau_fence.c     | 76 ++++++++++++-------------
  src/gallium/drivers/nouveau/nouveau_fence.h     | 22 +++++--
  src/gallium/drivers/nouveau/nouveau_screen.c    |  9 +++
  src/gallium/drivers/nouveau/nouveau_screen.h    | 14 ++---
  src/gallium/drivers/nouveau/nv30/nv30_context.c |  4 +-
  src/gallium/drivers/nouveau/nv30/nv30_screen.c  | 23 +++++---
  src/gallium/drivers/nouveau/nv50/nv50_context.c |  4 +-
  src/gallium/drivers/nouveau/nv50/nv50_screen.c  | 20 +++++--
  src/gallium/drivers/nouveau/nv50/nv50_vbo.c     |  2 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_context.c |  4 +-
  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c  | 19 +++++--
  src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c     |  2 +-
  12 files changed, 121 insertions(+), 78 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_fence.c b/src/gallium/drivers/nouveau/nouveau_fence.c
index c686710..09b3b1e 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.c
+++ b/src/gallium/drivers/nouveau/nouveau_fence.c
@@ -31,14 +31,14 @@
  #endif
  
  boolean
-nouveau_fence_new(struct nouveau_screen *screen, struct nouveau_fence **fence,
+nouveau_fence_new(struct nouveau_fence_mgr *mgr, struct nouveau_fence **fence,
                    boolean emit)
  {
     *fence = CALLOC_STRUCT(nouveau_fence);
     if (!*fence)
        return FALSE;
  
-   (*fence)->screen = screen;
+   (*fence)->mgr = mgr;
     (*fence)->ref = 1;
     LIST_INITHEAD(&(*fence)->work);
  
@@ -83,7 +83,7 @@ nouveau_fence_work(struct nouveau_fence *fence,
  void
  nouveau_fence_emit(struct nouveau_fence *fence)
  {
-   struct nouveau_screen *screen = fence->screen;
+   struct nouveau_fence_mgr *mgr = fence->mgr;
  
     assert(fence->state == NOUVEAU_FENCE_STATE_AVAILABLE);
  
@@ -92,14 +92,14 @@ nouveau_fence_emit(struct nouveau_fence *fence)
  
     ++fence->ref;
  
-   if (screen->fence.tail)
-      screen->fence.tail->next = fence;
+   if (mgr->tail)
+      mgr->tail->next = fence;
     else
-      screen->fence.head = fence;
+      mgr->head = fence;
  
-   screen->fence.tail = fence;
+   mgr->tail = fence;
  
-   screen->fence.emit(&screen->base, &fence->sequence);
+   mgr->emit(mgr, &fence->sequence);
  
     assert(fence->state == NOUVEAU_FENCE_STATE_EMITTING);
     fence->state = NOUVEAU_FENCE_STATE_EMITTED;
@@ -109,19 +109,19 @@ void
  nouveau_fence_del(struct nouveau_fence *fence)
  {
     struct nouveau_fence *it;
-   struct nouveau_screen *screen = fence->screen;
+   struct nouveau_fence_mgr *mgr = fence->mgr;
  
     if (fence->state == NOUVEAU_FENCE_STATE_EMITTED ||
         fence->state == NOUVEAU_FENCE_STATE_FLUSHED) {
-      if (fence == screen->fence.head) {
-         screen->fence.head = fence->next;
-         if (!screen->fence.head)
-            screen->fence.tail = NULL;
+      if (fence == mgr->head) {
+         mgr->head = fence->next;
+         if (!mgr->head)
+            mgr->tail = NULL;
        } else {
-         for (it = screen->fence.head; it && it->next != fence; it = it->next);
+         for (it = mgr->head; it && it->next != fence; it = it->next);
           it->next = fence->next;
-         if (screen->fence.tail == fence)
-            screen->fence.tail = it;
+         if (mgr->tail == fence)
+            mgr->tail = it;
        }
     }
  
@@ -134,17 +134,17 @@ nouveau_fence_del(struct nouveau_fence *fence)
  }
  
  void
-nouveau_fence_update(struct nouveau_screen *screen, boolean flushed)
+nouveau_fence_update(struct nouveau_fence_mgr *mgr, boolean flushed)
  {
     struct nouveau_fence *fence;
     struct nouveau_fence *next = NULL;
-   u32 sequence = screen->fence.update(&screen->base);
+   u32 sequence = mgr->update(mgr);
  
-   if (screen->fence.sequence_ack == sequence)
+   if (mgr->sequence_ack == sequence)
        return;
-   screen->fence.sequence_ack = sequence;
+   mgr->sequence_ack = sequence;
  
-   for (fence = screen->fence.head; fence; fence = next) {
+   for (fence = mgr->head; fence; fence = next) {
        next = fence->next;
        sequence = fence->sequence;
  
@@ -153,12 +153,12 @@ nouveau_fence_update(struct nouveau_screen *screen, boolean flushed)
        nouveau_fence_trigger_work(fence);
        nouveau_fence_ref(NULL, &fence);
  
-      if (sequence == screen->fence.sequence_ack)
+      if (sequence == mgr->sequence_ack)
           break;
     }
-   screen->fence.head = next;
+   mgr->head = next;
     if (!next)
-      screen->fence.tail = NULL;
+      mgr->tail = NULL;
  
     if (flushed) {
        for (fence = next; fence; fence = fence->next)
@@ -172,10 +172,10 @@ nouveau_fence_update(struct nouveau_screen *screen, boolean flushed)
  boolean
  nouveau_fence_signalled(struct nouveau_fence *fence)
  {
-   struct nouveau_screen *screen = fence->screen;
+   struct nouveau_fence_mgr *mgr = fence->mgr;
  
     if (fence->state >= NOUVEAU_FENCE_STATE_EMITTED)
-      nouveau_fence_update(screen, FALSE);
+      nouveau_fence_update(mgr, FALSE);
  
     return fence->state == NOUVEAU_FENCE_STATE_SIGNALLED;
  }
@@ -183,7 +183,7 @@ nouveau_fence_signalled(struct nouveau_fence *fence)
  boolean
  nouveau_fence_wait(struct nouveau_fence *fence)
  {
-   struct nouveau_screen *screen = fence->screen;
+   struct nouveau_fence_mgr *mgr = fence->mgr;
     uint32_t spins = 0;
  
     /* wtf, someone is waiting on a fence in flush_notify handler? */
@@ -193,19 +193,19 @@ nouveau_fence_wait(struct nouveau_fence *fence)
        nouveau_fence_emit(fence);
  
     if (fence->state < NOUVEAU_FENCE_STATE_FLUSHED)
-      if (nouveau_pushbuf_kick(screen->pushbuf, screen->pushbuf->channel))
+      if (mgr->flush(mgr))
           return FALSE;
  
-   if (fence == screen->fence.current)
-      nouveau_fence_next(screen);
+   if (fence == mgr->current)
+      nouveau_fence_next(mgr);
  
     do {
-      nouveau_fence_update(screen, FALSE);
+      nouveau_fence_update(mgr, FALSE);
  
        if (fence->state == NOUVEAU_FENCE_STATE_SIGNALLED)
           return TRUE;
        if (!spins)
-         NOUVEAU_DRV_STAT(screen, any_non_kernel_fence_sync_count, 1);
+         NOUVEAU_DRV_STAT(mgr->screen, any_non_kernel_fence_sync_count, 1);
        spins++;
  #ifdef PIPE_OS_UNIX
        if (!(spins % 8)) /* donate a few cycles */
@@ -215,18 +215,18 @@ nouveau_fence_wait(struct nouveau_fence *fence)
  
     debug_printf("Wait on fence %u (ack = %u, next = %u) timed out !\n",
                  fence->sequence,
-                screen->fence.sequence_ack, screen->fence.sequence);
+                mgr->sequence_ack, mgr->sequence);
  
     return FALSE;
  }
  
  void
-nouveau_fence_next(struct nouveau_screen *screen)
+nouveau_fence_next(struct nouveau_fence_mgr *mgr)
  {
-   if (screen->fence.current->state < NOUVEAU_FENCE_STATE_EMITTING)
-      nouveau_fence_emit(screen->fence.current);
+   if (mgr->current->state < NOUVEAU_FENCE_STATE_EMITTING)
+      nouveau_fence_emit(mgr->current);
  
-   nouveau_fence_ref(NULL, &screen->fence.current);
+   nouveau_fence_ref(NULL, &mgr->current);
  
-   nouveau_fence_new(screen, &screen->fence.current, FALSE);
+   nouveau_fence_new(mgr, &mgr->current, FALSE);
  }
diff --git a/src/gallium/drivers/nouveau/nouveau_fence.h b/src/gallium/drivers/nouveau/nouveau_fence.h
index 3984a9a..cb44dd3 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.h
+++ b/src/gallium/drivers/nouveau/nouveau_fence.h
@@ -11,6 +11,20 @@
  #define NOUVEAU_FENCE_STATE_FLUSHED   3
  #define NOUVEAU_FENCE_STATE_SIGNALLED 4
  
+struct nouveau_fence_mgr {
+	struct nouveau_fence *head;
+	struct nouveau_fence *tail;
+	struct nouveau_fence *current;
+	uint32_t sequence;
+	uint32_t sequence_ack;
+	int  (*flush)(struct nouveau_fence_mgr *);
+	void (*emit)(struct nouveau_fence_mgr *, uint32_t *sequence);
+	uint32_t (*update)(struct nouveau_fence_mgr *);
+
+	/* for driver stats */
+	struct nouveau_screen *screen;
+};
+
  struct nouveau_fence_work {
     struct list_head list;
     void (*func)(void *);
@@ -19,7 +33,7 @@ struct nouveau_fence_work {
  
  struct nouveau_fence {
     struct nouveau_fence *next;
-   struct nouveau_screen *screen;
+   struct nouveau_fence_mgr *mgr;
     int state;
     int ref;
     uint32_t sequence;
@@ -29,11 +43,11 @@ struct nouveau_fence {
  void nouveau_fence_emit(struct nouveau_fence *);
  void nouveau_fence_del(struct nouveau_fence *);
  
-boolean nouveau_fence_new(struct nouveau_screen *, struct nouveau_fence **,
+boolean nouveau_fence_new(struct nouveau_fence_mgr *, struct nouveau_fence **,
                            boolean emit);
  boolean nouveau_fence_work(struct nouveau_fence *, void (*)(void *), void *);
-void    nouveau_fence_update(struct nouveau_screen *, boolean flushed);
-void    nouveau_fence_next(struct nouveau_screen *);
+void    nouveau_fence_update(struct nouveau_fence_mgr *, boolean flushed);
+void    nouveau_fence_next(struct nouveau_fence_mgr *);
  boolean nouveau_fence_wait(struct nouveau_fence *);
  boolean nouveau_fence_signalled(struct nouveau_fence *);
  
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 9d71bf7..9ea3a46 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -223,3 +223,12 @@ nouveau_screen_fini(struct nouveau_screen *screen)
  
  	nouveau_device_del(&screen->device);
  }
+
+int nouveau_screen_fence_kick(struct nouveau_fence_mgr *mgr)
+{
+	struct nouveau_screen *screen = NULL;
+
+	screen = container_of(mgr, screen, fence);
+
+	return nouveau_pushbuf_kick(screen->pushbuf, screen->pushbuf->channel);
+}
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index cf06f7e..7682214 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -4,6 +4,8 @@
  #include "pipe/p_screen.h"
  #include "util/u_memory.h"
  
+#include "nouveau_fence.h"
+
  #ifdef DEBUG
  # define NOUVEAU_ENABLE_DRIVER_STATISTICS
  #endif
@@ -34,15 +36,7 @@ struct nouveau_screen {
  
  	uint16_t class_3d;
  
-	struct {
-		struct nouveau_fence *head;
-		struct nouveau_fence *tail;
-		struct nouveau_fence *current;
-		u32 sequence;
-		u32 sequence_ack;
-		void (*emit)(struct pipe_screen *, u32 *sequence);
-		u32  (*update)(struct pipe_screen *);
-	} fence;
+	struct nouveau_fence_mgr fence;
  
  	struct nouveau_mman *mm_VRAM;
  	struct nouveau_mman *mm_GART;
@@ -132,4 +126,6 @@ void nouveau_screen_fini(struct nouveau_screen *);
  
  void nouveau_screen_init_vdec(struct nouveau_screen *);
  
+int nouveau_screen_fence_kick(struct nouveau_fence_mgr *);
+
  #endif
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.c b/src/gallium/drivers/nouveau/nv30/nv30_context.c
index f325c5c..35c66f1 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.c
@@ -44,8 +44,8 @@ nv30_context_kick_notify(struct nouveau_pushbuf *push)
     nv30 = container_of(push->user_priv, nv30, bufctx);
     screen = &nv30->screen->base;
  
-   nouveau_fence_next(screen);
-   nouveau_fence_update(screen, TRUE);
+   nouveau_fence_next(&screen->fence);
+   nouveau_fence_update(&screen->fence, TRUE);
  
     if (push->bufctx) {
        struct nouveau_bufref *bref;
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index fb9378c..a0518c3 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -287,10 +287,13 @@ nv30_screen_is_format_supported(struct pipe_screen *pscreen,
  }
  
  static void
-nv30_screen_fence_emit(struct pipe_screen *pscreen, uint32_t *sequence)
+nv30_screen_fence_emit(struct nouveau_fence_mgr *mgr, uint32_t *sequence)
  {
-   struct nv30_screen *screen = nv30_screen(pscreen);
-   struct nouveau_pushbuf *push = screen->base.pushbuf;
+   struct nv30_screen *screen = NULL;
+   struct nouveau_pushbuf *push;
+
+   screen = container_of(mgr, screen, base.fence);
+   push = screen->base.pushbuf;
  
     *sequence = ++screen->base.fence.sequence;
  
@@ -300,10 +303,14 @@ nv30_screen_fence_emit(struct pipe_screen *pscreen, uint32_t *sequence)
  }
  
  static uint32_t
-nv30_screen_fence_update(struct pipe_screen *pscreen)
+nv30_screen_fence_update(struct nouveau_fence_mgr *mgr)
  {
-   struct nv30_screen *screen = nv30_screen(pscreen);
-   struct nv04_notify *fence = screen->fence->data;
+   struct nv30_screen *screen = NULL;
+   struct nv04_notify *fence;
+
+   screen = container_of(mgr, screen, base.fence);
+   fence = screen->fence->data;
+
     return *(uint32_t *)((char *)screen->notify->map + fence->offset);
  }
  
@@ -404,6 +411,8 @@ nv30_screen_create(struct nouveau_device *dev)
     nv30_resource_screen_init(pscreen);
     nouveau_screen_init_vdec(&screen->base);
  
+   screen->base.fence.screen = &screen->base;
+   screen->base.fence.flush = nouveau_screen_fence_kick;
     screen->base.fence.emit = nv30_screen_fence_emit;
     screen->base.fence.update = nv30_screen_fence_update;
  
@@ -607,6 +616,6 @@ nv30_screen_create(struct nouveau_device *dev)
  
     nouveau_pushbuf_kick(push, push->channel);
  
-   nouveau_fence_new(&screen->base, &screen->base.fence.current, FALSE);
+   nouveau_fence_new(&screen->base.fence, &screen->base.fence.current, FALSE);
     return pscreen;
  }
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index f844592..af1e436 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -83,8 +83,8 @@ nv50_default_kick_notify(struct nouveau_pushbuf *push)
     struct nv50_screen *screen = push->user_priv;
  
     if (screen) {
-      nouveau_fence_next(&screen->base);
-      nouveau_fence_update(&screen->base, TRUE);
+      nouveau_fence_next(&screen->base.fence);
+      nouveau_fence_update(&screen->base.fence, TRUE);
        if (screen->cur_ctx)
           screen->cur_ctx->state.flushed = TRUE;
     }
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 015f139..8195650 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -348,10 +348,13 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
  }
  
  static void
-nv50_screen_fence_emit(struct pipe_screen *pscreen, u32 *sequence)
+nv50_screen_fence_emit(struct nouveau_fence_mgr *mgr, u32 *sequence)
  {
-   struct nv50_screen *screen = nv50_screen(pscreen);
-   struct nouveau_pushbuf *push = screen->base.pushbuf;
+   struct nv50_screen *screen = NULL;
+   struct nouveau_pushbuf *push;
+
+   screen = container_of(mgr, screen, base.fence);
+   push = screen->base.pushbuf;
  
     /* we need to do it after possible flush in MARK_RING */
     *sequence = ++screen->base.fence.sequence;
@@ -369,9 +372,12 @@ nv50_screen_fence_emit(struct pipe_screen *pscreen, u32 *sequence)
  }
  
  static u32
-nv50_screen_fence_update(struct pipe_screen *pscreen)
+nv50_screen_fence_update(struct nouveau_fence_mgr *mgr)
  {
-   return nv50_screen(pscreen)->fence.map[0];
+   struct nv50_screen *screen = NULL;
+
+   screen = container_of(mgr, screen, base.fence);
+   return screen->fence.map[0];
  }
  
  static void
@@ -717,6 +723,8 @@ nv50_screen_create(struct nouveau_device *dev)
  
     nouveau_bo_map(screen->fence.bo, 0, NULL);
     screen->fence.map = screen->fence.bo->map;
+   screen->base.fence.screen = &screen->base;
+   screen->base.fence.flush = nouveau_screen_fence_kick;
     screen->base.fence.emit = nv50_screen_fence_emit;
     screen->base.fence.update = nv50_screen_fence_update;
  
@@ -850,7 +858,7 @@ nv50_screen_create(struct nouveau_device *dev)
  
     nv50_screen_init_hwctx(screen);
  
-   nouveau_fence_new(&screen->base, &screen->base.fence.current, FALSE);
+   nouveau_fence_new(&screen->base.fence, &screen->base.fence.current, FALSE);
  
     return pscreen;
  
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index 7c2b7ff..3fa2f05 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -737,7 +737,7 @@ nv50_draw_vbo_kick_notify(struct nouveau_pushbuf *chan)
  {
     struct nv50_screen *screen = chan->user_priv;
  
-   nouveau_fence_update(&screen->base, TRUE);
+   nouveau_fence_update(&screen->base.fence, TRUE);
  
     nv50_bufctx_fence(screen->cur_ctx->bufctx_3d, TRUE);
  }
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
index e5040c4..52f8a57 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
@@ -147,8 +147,8 @@ nvc0_default_kick_notify(struct nouveau_pushbuf *push)
     struct nvc0_screen *screen = push->user_priv;
  
     if (screen) {
-      nouveau_fence_next(&screen->base);
-      nouveau_fence_update(&screen->base, TRUE);
+      nouveau_fence_next(&screen->base.fence);
+      nouveau_fence_update(&screen->base.fence, TRUE);
        if (screen->cur_ctx)
           screen->cur_ctx->state.flushed = TRUE;
     }
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index 3e6b011..2a317af 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -490,10 +490,13 @@ nvc0_magic_3d_init(struct nouveau_pushbuf *push, uint16_t obj_class)
  }
  
  static void
-nvc0_screen_fence_emit(struct pipe_screen *pscreen, u32 *sequence)
+nvc0_screen_fence_emit(struct nouveau_fence_mgr *mgr, u32 *sequence)
  {
-   struct nvc0_screen *screen = nvc0_screen(pscreen);
-   struct nouveau_pushbuf *push = screen->base.pushbuf;
+   struct nvc0_screen *screen = NULL;
+   struct nouveau_pushbuf *push;
+
+   screen = container_of(mgr, screen, base.fence);
+   push = screen->base.pushbuf;
  
     /* we need to do it after possible flush in MARK_RING */
     *sequence = ++screen->base.fence.sequence;
@@ -507,9 +510,11 @@ nvc0_screen_fence_emit(struct pipe_screen *pscreen, u32 *sequence)
  }
  
  static u32
-nvc0_screen_fence_update(struct pipe_screen *pscreen)
+nvc0_screen_fence_update(struct nouveau_fence_mgr *mgr)
  {
-   struct nvc0_screen *screen = nvc0_screen(pscreen);
+   struct nvc0_screen *screen = NULL;
+
+   screen = container_of(mgr, screen, base.fence);
     return screen->fence.map[0];
  }
  
@@ -639,6 +644,8 @@ nvc0_screen_create(struct nouveau_device *dev)
        goto fail;
     nouveau_bo_map(screen->fence.bo, 0, NULL);
     screen->fence.map = screen->fence.bo->map;
+   screen->base.fence.screen = &screen->base;
+   screen->base.fence.flush = nouveau_screen_fence_kick;
     screen->base.fence.emit = nvc0_screen_fence_emit;
     screen->base.fence.update = nvc0_screen_fence_update;
  
@@ -997,7 +1004,7 @@ nvc0_screen_create(struct nouveau_device *dev)
     if (!nvc0_blitter_create(screen))
        goto fail;
  
-   nouveau_fence_new(&screen->base, &screen->base.fence.current, FALSE);
+   nouveau_fence_new(&screen->base.fence, &screen->base.fence.current, FALSE);
  
     return pscreen;
  
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index 83d406d..6406cf5 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
@@ -559,7 +559,7 @@ nvc0_draw_vbo_kick_notify(struct nouveau_pushbuf *push)
  {
     struct nvc0_screen *screen = push->user_priv;
  
-   nouveau_fence_update(&screen->base, TRUE);
+   nouveau_fence_update(&screen->base.fence, TRUE);
  
     NOUVEAU_DRV_STAT(&screen->base, pushbuf_count, 1);
  }
-- 
2.0.0
