From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nouveau: Add lots of comments to the buffer
	transfer logic
Date: Mon,  2 Dec 2013 00:21:54 -0500
Message-ID: <1385961714-20564-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

This is my shot at understanding this whole transfer business. The upshot is
that after reading through it and understanding it, the transfer logic does
appear correct if potentially less-than-perfectly-efficient (e.g. one could
keep track of ranges being read/written, etc).

 src/gallium/drivers/nouveau/nouveau_buffer.c | 71 +++++++++++++++++++++++++++-
 src/gallium/drivers/nouveau/nouveau_buffer.h |  4 +-
 2 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.c b/src/gallium/drivers/nouveau/nouveau_buffer.c
index 95905a8..0b21530 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.c
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.c
@@ -129,6 +129,10 @@ nouveau_buffer_destroy(struct pipe_screen *pscreen,
    NOUVEAU_DRV_STAT(nouveau_screen(pscreen), buf_obj_current_count, -1);
 }
 
+/* Set up a staging area for the transfer. This is either done in "regular"
+ * system memory if the driver supports push_data (nv50+) and the data is
+ * small enough (and permit_pb == true), or in GART memory.
+ */
 static uint8_t *
 nouveau_transfer_staging(struct nouveau_context *nv,
                          struct nouveau_transfer *tx, boolean permit_pb)
@@ -155,7 +159,10 @@ nouveau_transfer_staging(struct nouveau_context *nv,
    return tx->map;
 }
 
-/* Maybe just migrate to GART right away if we actually need to do this. */
+/* Copies data from the resource into the the transfer's temporary GART
+ * buffer. Also updates buf->data if present.
+ *
+ * Maybe just migrate to GART right away if we actually need to do this. */
 static boolean
 nouveau_transfer_read(struct nouveau_context *nv, struct nouveau_transfer *tx)
 {
@@ -210,7 +217,9 @@ nouveau_transfer_write(struct nouveau_context *nv, struct nouveau_transfer *tx,
    nouveau_fence_ref(nv->screen->fence.current, &buf->fence_wr);
 }
 
-
+/* Does a CPU wait for the buffer's backing data to become reliably accessible
+ * for write/read by waiting on the buffer's relevant fences.
+ */
 static INLINE boolean
 nouveau_buffer_sync(struct nv04_resource *buf, unsigned rw)
 {
@@ -283,6 +292,7 @@ nouveau_buffer_transfer_del(struct nouveau_context *nv,
    }
 }
 
+/* Creates a cache in system memory of the buffer data. */
 static boolean
 nouveau_buffer_cache(struct nouveau_context *nv, struct nv04_resource *buf)
 {
@@ -317,6 +327,10 @@ nouveau_buffer_cache(struct nouveau_context *nv, struct nv04_resource *buf)
 #define NOUVEAU_TRANSFER_DISCARD \
    (PIPE_TRANSFER_DISCARD_RANGE | PIPE_TRANSFER_DISCARD_WHOLE_RESOURCE)
 
+/* Checks whether it is possible to completely discard the memory backing this
+ * resource. This can be useful if we would otherwise have to wait for a read
+ * operation to complete on this data.
+ */
 static INLINE boolean
 nouveau_buffer_should_discard(struct nv04_resource *buf, unsigned usage)
 {
@@ -327,6 +341,29 @@ nouveau_buffer_should_discard(struct nv04_resource *buf, unsigned usage)
    return buf->mm && nouveau_buffer_busy(buf, PIPE_TRANSFER_WRITE);
 }
 
+/* Returns a pointer to a memory area representing a window into the
+ * resource's data.
+ *
+ * This may or may not be the _actual_ memory area of the resource. However
+ * when calling nouveau_buffer_transfer_unmap, if it wasn't the actual memory
+ * area, the contents of the returned map are copied over to the resource.
+ *
+ * The usage indicates what the caller plans to do with the map:
+ *
+ *   WRITE means that the user plans to write to it
+ *
+ *   READ means that the user plans on reading from it
+ *
+ *   DISCARD_WHOLE_RESOURCE means that the whole resource is going to be
+ *   potentially overwritten, and even if it isn't, the bits that aren't don't
+ *   need to be maintained.
+ *
+ *   DISCARD_RANGE means that all the data in the specified range is going to
+ *   be overwritten.
+ *
+ * The strategy for determining what kind of memory area to return is complex,
+ * see comments inside of the function.
+ */
 static void *
 nouveau_buffer_transfer_map(struct pipe_context *pipe,
                             struct pipe_resource *resource,
@@ -352,11 +389,17 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
 
    if (buf->domain == NOUVEAU_BO_VRAM) {
       if (usage & NOUVEAU_TRANSFER_DISCARD) {
+         /* Set up a staging area for the user to write to. It will be copied
+          * back into VRAM on unmap. */
          if (usage & PIPE_TRANSFER_DISCARD_WHOLE_RESOURCE)
             buf->status &= NOUVEAU_BUFFER_STATUS_REALLOC_MASK;
          nouveau_transfer_staging(nv, tx, TRUE);
       } else {
          if (buf->status & NOUVEAU_BUFFER_STATUS_GPU_WRITING) {
+            /* The GPU is currently writing to this buffer. Copy its current
+             * contents to a staging area in the GART. This is necessary since
+             * not the whole area being mapped is being discarded.
+             */
             if (buf->data) {
                align_free(buf->data);
                buf->data = NULL;
@@ -364,6 +407,8 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
             nouveau_transfer_staging(nv, tx, FALSE);
             nouveau_transfer_read(nv, tx);
          } else {
+            /* The buffer is currently idle. Create a staging area for writes,
+             * and make sure that the cached data is up-to-date. */
             if (usage & PIPE_TRANSFER_WRITE)
                nouveau_transfer_staging(nv, tx, TRUE);
             if (!buf->data)
@@ -376,6 +421,8 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
       return buf->data + box->x;
    }
 
+   /* At this point, buf->domain == GART */
+
    if (nouveau_buffer_should_discard(buf, usage)) {
       int ref = buf->base.reference.count - 1;
       nouveau_buffer_reallocate(nv->screen, buf, buf->domain);
@@ -383,6 +430,12 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
          nv->invalidate_resource_storage(nv, &buf->base, ref);
    }
 
+   /* Note that nouveau_bo_map ends up doing a nouveau_bo_wait with the
+    * relevant flags. If buf->mm is set, that means this resource is part of a
+    * larger slab bo that holds multiple resources. So in that case, don't
+    * wait on the whole slab and instead use the logic below to return a
+    * reasonable buffer for that case.
+    */
    ret = nouveau_bo_map(buf->bo,
                         buf->mm ? 0 : nouveau_screen_transfer_flags(usage),
                         nv->client);
@@ -396,6 +449,10 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
    if ((usage & PIPE_TRANSFER_UNSYNCHRONIZED) || !buf->mm)
       return map;
 
+   /* If the GPU is currently reading/writing this buffer, we shouldn't
+    * interfere with its progress. So instead we either wait for the GPU to
+    * complete its operation, or set up a staging area to perform our work in.
+    */
    if (nouveau_buffer_busy(buf, usage & PIPE_TRANSFER_READ_WRITE)) {
       if (unlikely(usage & PIPE_TRANSFER_DISCARD_WHOLE_RESOURCE)) {
          /* Discarding was not possible, must sync because
@@ -403,6 +460,8 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
          nouveau_buffer_sync(buf, usage & PIPE_TRANSFER_READ_WRITE);
       } else
       if (usage & PIPE_TRANSFER_DISCARD_RANGE) {
+         /* The whole range is being discarded, so it doesn't matter what was
+          * there before. No need to copy anything over. */
          nouveau_transfer_staging(nv, tx, TRUE);
          map = tx->map;
       } else
@@ -412,6 +471,8 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
          else
             nouveau_buffer_sync(buf, usage & PIPE_TRANSFER_READ_WRITE);
       } else {
+         /* It is expected that the returned buffer be a representation of the
+          * data in question, so we must copy it over from the buffer. */
          nouveau_transfer_staging(nv, tx, TRUE);
          if (tx->map)
             memcpy(tx->map, map, box->width);
@@ -435,6 +496,12 @@ nouveau_buffer_transfer_flush_region(struct pipe_context *pipe,
       nouveau_transfer_write(nouveau_context(pipe), tx, box->x, box->width);
 }
 
+/* Unmap stage of the transfer. If it was a WRITE transfer and the map that
+ * was returned was not the real resource's data, this needs to transfer the
+ * data back to the resource.
+ *
+ * Also marks vbo/cb dirty if the buffer's binding
+ */
 static void
 nouveau_buffer_transfer_unmap(struct pipe_context *pipe,
                               struct pipe_transfer *transfer)
diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.h b/src/gallium/drivers/nouveau/nouveau_buffer.h
index fd7a3f1..aeb9b17 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.h
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.h
@@ -33,9 +33,9 @@ struct nv04_resource {
 
    uint64_t address; /* virtual address (nv50+) */
 
-   uint8_t *data;
+   uint8_t *data; /* resource's contents, if domain == 0, or cached */
    struct nouveau_bo *bo;
-   uint32_t offset;
+   uint32_t offset; /* offset into the data/bo */
 
    uint8_t status;
    uint8_t domain;
-- 
1.8.3.2
