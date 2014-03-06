From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2] nouveau: add valid range tracking to
	nouveau_buffer
Date: Wed,  5 Mar 2014 23:24:08 -0500
Message-ID: <1394079848-8793-1-git-send-email-imirkin@alum.mit.edu>
References: <1393663630-13733-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1393663630-13733-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Christoph Bumiller <e0425955@student.tuwien.ac.at>
List-Id: nouveau.vger.kernel.org

This logic is borrowed from the radeon code. The transfer logic will
only get called for PIPE_BUFFER resources, so it shouldn't be necessary
to worry about them becoming render targets.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

This was re-tested by someone on both nv50 and nvc0. The performance gain
remains on nv50 (25-30%), while no change in performance is observed on nvc0,
for source games.

v1 -> v2:
 - make copy_buffer also populate the valid range

 src/gallium/drivers/nouveau/nouveau_buffer.c     | 31 ++++++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_buffer.h     |  4 +++
 src/gallium/drivers/nouveau/nv50/nv50_resource.c |  2 ++
 src/gallium/drivers/nouveau/nv50/nv50_state.c    |  4 +++
 src/gallium/drivers/nouveau/nvc0/nvc0_resource.c |  2 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_state.c    |  4 +++
 6 files changed, 47 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.c b/src/gallium/drivers/nouveau/nouveau_buffer.c
index 5b0b93b..e308ff4 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.c
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.c
@@ -69,6 +69,8 @@ nouveau_buffer_allocate(struct nouveau_screen *screen,
    if (buf->bo)
       buf->address = buf->bo->offset + buf->offset;
 
+   util_range_set_empty(&buf->valid_buffer_range);
+
    return TRUE;
 }
 
@@ -124,6 +126,8 @@ nouveau_buffer_destroy(struct pipe_screen *pscreen,
    nouveau_fence_ref(NULL, &res->fence);
    nouveau_fence_ref(NULL, &res->fence_wr);
 
+   util_range_destroy(&res->valid_buffer_range);
+
    FREE(res);
 
    NOUVEAU_DRV_STAT(nouveau_screen(pscreen), buf_obj_current_count, -1);
@@ -387,6 +391,17 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
    if (usage & PIPE_TRANSFER_WRITE)
       NOUVEAU_DRV_STAT(nv->screen, buf_transfers_wr, 1);
 
+   /* If we are trying to write to an uninitialized range, the user shouldn't
+    * care what was there before. So we can treat the write as if the target
+    * range were being discarded. Furthermore, since we know that even if this
+    * buffer is busy due to GPU activity, because the contents were
+    * uninitialized, the GPU can't care what was there, and so we can treat
+    * the write as being unsynchronized.
+    */
+   if ((usage & PIPE_TRANSFER_WRITE) &&
+       !util_ranges_intersect(&buf->valid_buffer_range, box->x, box->x + box->width))
+      usage |= PIPE_TRANSFER_DISCARD_RANGE | PIPE_TRANSFER_UNSYNCHRONIZED;
+
    if (buf->domain == NOUVEAU_BO_VRAM) {
       if (usage & NOUVEAU_TRANSFER_DISCARD) {
          /* Set up a staging area for the user to write to. It will be copied
@@ -492,8 +507,14 @@ nouveau_buffer_transfer_flush_region(struct pipe_context *pipe,
                                      const struct pipe_box *box)
 {
    struct nouveau_transfer *tx = nouveau_transfer(transfer);
+   struct nv04_resource *buf = nv04_resource(transfer->resource);
+
    if (tx->map)
       nouveau_transfer_write(nouveau_context(pipe), tx, box->x, box->width);
+
+   util_range_add(&buf->valid_buffer_range,
+                  tx->base.box.x + box->x,
+                  tx->base.box.x + box->x + box->width);
 }
 
 /* Unmap stage of the transfer. If it was a WRITE transfer and the map that
@@ -522,6 +543,9 @@ nouveau_buffer_transfer_unmap(struct pipe_context *pipe,
          if (bind & (PIPE_BIND_CONSTANT_BUFFER))
             nv->cb_dirty = TRUE;
       }
+
+      util_range_add(&buf->valid_buffer_range,
+                     tx->base.box.x, tx->base.box.x + tx->base.box.width);
    }
 
    if (!tx->bo && (tx->base.usage & PIPE_TRANSFER_WRITE))
@@ -562,6 +586,8 @@ nouveau_copy_buffer(struct nouveau_context *nv,
                                 &dst->base, 0, dstx, 0, 0,
                                 &src->base, 0, &src_box);
    }
+
+   util_range_add(&dst->valid_buffer_range, dstx, dstx + size);
 }
 
 
@@ -659,6 +685,8 @@ nouveau_buffer_create(struct pipe_screen *pscreen,
 
    NOUVEAU_DRV_STAT(screen, buf_obj_current_count, 1);
 
+   util_range_init(&buffer->valid_buffer_range);
+
    return &buffer->base;
 
 fail:
@@ -690,6 +718,9 @@ nouveau_user_buffer_create(struct pipe_screen *pscreen, void *ptr,
    buffer->data = ptr;
    buffer->status = NOUVEAU_BUFFER_STATUS_USER_MEMORY;
 
+   util_range_init(&buffer->valid_buffer_range);
+   util_range_add(&buffer->valid_buffer_range, 0, bytes);
+
    return &buffer->base;
 }
 
diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.h b/src/gallium/drivers/nouveau/nouveau_buffer.h
index aeb9b17..f881adc 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.h
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.h
@@ -1,6 +1,7 @@
 #ifndef __NOUVEAU_BUFFER_H__
 #define __NOUVEAU_BUFFER_H__
 
+#include "util/u_range.h"
 #include "util/u_transfer.h"
 #include "util/u_double_list.h"
 
@@ -44,6 +45,9 @@ struct nv04_resource {
    struct nouveau_fence *fence_wr;
 
    struct nouveau_mm_allocation *mm;
+
+   /* buffer range that has been initialized */
+   struct util_range valid_buffer_range;
 };
 
 void
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_resource.c b/src/gallium/drivers/nouveau/nv50/nv50_resource.c
index 7fbb0a9..d289b4a 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_resource.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_resource.c
@@ -68,6 +68,8 @@ nv50_surface_create(struct pipe_context *pipe,
 		    struct pipe_resource *pres,
 		    const struct pipe_surface *templ)
 {
+   /* surfaces are assumed to be miptrees all over the place. */
+   assert(pres->target != PIPE_BUFFER);
    if (unlikely(pres->target == PIPE_BUFFER))
       return nv50_surface_from_buffer(pipe, pres, templ);
    return nv50_miptree_surface_new(pipe, pres, templ);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state.c b/src/gallium/drivers/nouveau/nv50/nv50_state.c
index 288ba46..c03d729 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state.c
@@ -1010,6 +1010,7 @@ nv50_so_target_create(struct pipe_context *pipe,
                       struct pipe_resource *res,
                       unsigned offset, unsigned size)
 {
+   struct nv04_resource *buf = (struct nv04_resource *)res;
    struct nv50_so_target *targ = MALLOC_STRUCT(nv50_so_target);
    if (!targ)
       return NULL;
@@ -1033,6 +1034,9 @@ nv50_so_target_create(struct pipe_context *pipe,
    pipe_resource_reference(&targ->pipe.buffer, res);
    pipe_reference_init(&targ->pipe.reference, 1);
 
+   assert(buf->base.target == PIPE_BUFFER);
+   util_range_add(&buf->valid_buffer_range, offset, offset + size);
+
    return &targ->pipe;
 }
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_resource.c b/src/gallium/drivers/nouveau/nvc0/nvc0_resource.c
index 4e70903..12b5a02 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_resource.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_resource.c
@@ -36,6 +36,8 @@ nvc0_surface_create(struct pipe_context *pipe,
                     struct pipe_resource *pres,
                     const struct pipe_surface *templ)
 {
+   /* surfaces are assumed to be miptrees all over the place. */
+   assert(pres->target != PIPE_BUFFER);
    if (unlikely(pres->target == PIPE_BUFFER))
       return nv50_surface_from_buffer(pipe, pres, templ);
    return nvc0_miptree_surface_new(pipe, pres, templ);
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
index 0213a8e..dec5355 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
@@ -992,6 +992,7 @@ nvc0_so_target_create(struct pipe_context *pipe,
                       struct pipe_resource *res,
                       unsigned offset, unsigned size)
 {
+   struct nv04_resource *buf = (struct nv04_resource *)res;
    struct nvc0_so_target *targ = MALLOC_STRUCT(nvc0_so_target);
    if (!targ)
       return NULL;
@@ -1010,6 +1011,9 @@ nvc0_so_target_create(struct pipe_context *pipe,
    pipe_resource_reference(&targ->pipe.buffer, res);
    pipe_reference_init(&targ->pipe.reference, 1);
 
+   assert(buf->base.target == PIPE_BUFFER);
+   util_range_add(&buf->valid_buffer_range, offset, offset + size);
+
    return &targ->pipe;
 }
 
-- 
1.8.3.2
