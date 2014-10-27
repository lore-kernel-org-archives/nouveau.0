From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH] nv50: Fix allocation size for querys
Date: Mon, 27 Oct 2014 04:47:22 +0100
Message-ID: <1414381642-8710-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This was missed by commit:
nv50: handle inverted render conditions 1a170980a09d82201b88e3fe20684a0df2cfea80

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_query.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_query.c b/src/gallium/drivers/nouveau/nv50/nv50_query.c
index e0671ce..77dddad 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_query.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_query.c
@@ -41,14 +41,14 @@ struct nv50_query {
    uint32_t sequence;
    struct nouveau_bo *bo;
    uint32_t base;
-   uint32_t offset; /* base + i * 16 */
+   uint32_t offset; /* base + i * 32 */
    boolean ready;
    boolean flushed;
    boolean is64bit;
    struct nouveau_mm_allocation *mm;
 };
 
-#define NV50_QUERY_ALLOC_SPACE 128
+#define NV50_QUERY_ALLOC_SPACE 256
 
 static INLINE struct nv50_query *
 nv50_query(struct pipe_query *pipe)
@@ -116,8 +116,8 @@ nv50_query_create(struct pipe_context *pipe, unsigned type, unsigned index)
    q->type = type;
 
    if (q->type == PIPE_QUERY_OCCLUSION_COUNTER) {
-      q->offset -= 16;
-      q->data -= 16 / sizeof(*q->data); /* we advance before query_begin ! */
+      q->offset -= 32;
+      q->data -= 32 / sizeof(*q->data); /* we advance before query_begin ! */
    }
 
    return (struct pipe_query *)q;
@@ -150,8 +150,8 @@ nv50_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
     * initialized it to TRUE.
     */
    if (q->type == PIPE_QUERY_OCCLUSION_COUNTER) {
-      q->offset += 16;
-      q->data += 16 / sizeof(*q->data);
+      q->offset += 32;
+      q->data += 32 / sizeof(*q->data);
       if (q->offset - q->base == NV50_QUERY_ALLOC_SPACE)
          nv50_query_allocate(nv50, q, NV50_QUERY_ALLOC_SPACE);
 
-- 
2.1.2
