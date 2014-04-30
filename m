From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nouveau: remove cb_dirty, it's never used
Date: Wed, 30 Apr 2014 16:48:06 -0400
Message-ID: <1398890887-11414-1-git-send-email-imirkin@alum.mit.edu>
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
 src/gallium/drivers/nouveau/nouveau_buffer.c  | 4 +---
 src/gallium/drivers/nouveau/nouveau_context.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.c b/src/gallium/drivers/nouveau/nouveau_buffer.c
index e308ff4..904e2cc 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.c
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.c
@@ -521,7 +521,7 @@ nouveau_buffer_transfer_flush_region(struct pipe_context *pipe,
  * was returned was not the real resource's data, this needs to transfer the
  * data back to the resource.
  *
- * Also marks vbo/cb dirty if the buffer's binding
+ * Also marks vbo dirty based on the buffer's binding
  */
 static void
 nouveau_buffer_transfer_unmap(struct pipe_context *pipe,
@@ -540,8 +540,6 @@ nouveau_buffer_transfer_unmap(struct pipe_context *pipe,
          /* make sure we invalidate dedicated caches */
          if (bind & (PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER))
             nv->vbo_dirty = TRUE;
-         if (bind & (PIPE_BIND_CONSTANT_BUFFER))
-            nv->cb_dirty = TRUE;
       }
 
       util_range_add(&buf->valid_buffer_range,
diff --git a/src/gallium/drivers/nouveau/nouveau_context.h b/src/gallium/drivers/nouveau/nouveau_context.h
index c8d9d84..14608d3 100644
--- a/src/gallium/drivers/nouveau/nouveau_context.h
+++ b/src/gallium/drivers/nouveau/nouveau_context.h
@@ -14,7 +14,6 @@ struct nouveau_context {
    struct nouveau_pushbuf *pushbuf;
 
    boolean vbo_dirty;
-   boolean cb_dirty;
 
    void (*copy_data)(struct nouveau_context *,
                      struct nouveau_bo *dst, unsigned, unsigned,
-- 
1.8.3.2
