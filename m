From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 1/2] nv30-nv40: support unlimited queries
Date: Mon, 18 Jan 2010 01:18:03 +0100
Message-ID: <1263773884-21961-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Currently on NV30/NV40 an assert will be triggered once 32 queries are
outstanding.

This violates the OpenGL/Gallium interface, which requires support for
an unlimited number of fences.

This patch fixes the problem by putting queries in a linked list and
waiting on the oldest one if allocation fails.

nVidia seems to use a similar strategy, but with 1024 instead of 32 fences.
The next patch will improve this.
---
 src/gallium/drivers/nv30/nv30_query.c  |   26 ++++++++++++++++++--------
 src/gallium/drivers/nv30/nv30_screen.c |    2 ++
 src/gallium/drivers/nv30/nv30_screen.h |    1 +
 src/gallium/drivers/nv40/nv40_query.c  |   26 ++++++++++++++++++--------
 src/gallium/drivers/nv40/nv40_screen.c |    2 ++
 src/gallium/drivers/nv40/nv40_screen.h |    1 +
 6 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_query.c b/src/gallium/drivers/nv30/nv30_query.c
index e27e9cc..c0d192b 100644
--- a/src/gallium/drivers/nv30/nv30_query.c
+++ b/src/gallium/drivers/nv30/nv30_query.c
@@ -3,6 +3,7 @@
 #include "nv30_context.h"
 
 struct nv30_query {
+        struct list_head list;
 	struct nouveau_resource *object;
 	unsigned type;
 	boolean ready;
@@ -23,6 +24,8 @@ nv30_query_create(struct pipe_context *pipe, unsigned query_type)
 	q = CALLOC(1, sizeof(struct nv30_query));
 	q->type = query_type;
 
+       assert(q->type == PIPE_QUERY_OCCLUSION_COUNTER);
+
 	return (struct pipe_query *)q;
 }
 
@@ -32,7 +35,10 @@ nv30_query_destroy(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nv30_query *q = nv30_query(pq);
 
 	if (q->object)
+	{
 		nouveau_resource_free(&q->object);
+                LIST_DEL(&q->list);
+	}
 	FREE(q);
 }
 
@@ -44,20 +50,25 @@ nv30_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nv30_screen *screen = nv30->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *rankine = screen->rankine;
-
-	assert(q->type == PIPE_QUERY_OCCLUSION_COUNTER);
+        uint64_t tmp;
 
 	/* Happens when end_query() is called, then another begin_query()
 	 * without querying the result in-between.  For now we'll wait for
 	 * the existing query to notify completion, but it could be better.
 	 */
-	if (q->object) {
-		uint64_t tmp;
+	if (q->object)
 		pipe->get_query_result(pipe, pq, 1, &tmp);
+
+	while (nouveau_resource_alloc(nv30->screen->query_heap, 1, NULL, &q->object))
+	{
+		struct nv30_query* oldestq;
+		assert(!LIST_IS_EMPTY(&nv30->screen->query_list));
+		oldestq = LIST_ENTRY(struct nv30_query, nv30->screen->query_list.next, list);
+		pipe->get_query_result(pipe, (struct pipe_query*)oldestq, 1, &tmp);
 	}
 
-	if (nouveau_resource_alloc(nv30->screen->query_heap, 1, NULL, &q->object))
-		assert(0);
+	LIST_ADDTAIL(&q->list, &nv30->screen->query_list);
+
 	nouveau_notifier_reset(nv30->screen->query, q->object->start);
 
 	BEGIN_RING(chan, rankine, NV34TCL_QUERY_RESET, 1);
@@ -90,8 +101,6 @@ nv30_query_result(struct pipe_context *pipe, struct pipe_query *pq,
 	struct nv30_context *nv30 = nv30_context(pipe);
 	struct nv30_query *q = nv30_query(pq);
 
-	assert(q->object && q->type == PIPE_QUERY_OCCLUSION_COUNTER);
-
 	if (!q->ready) {
 		unsigned status;
 
@@ -110,6 +119,7 @@ nv30_query_result(struct pipe_context *pipe, struct pipe_query *pq,
 							q->object->start);
 		q->ready = TRUE;
 		nouveau_resource_free(&q->object);
+		LIST_DEL(&q->list);
 	}
 
 	*result = q->result;
diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 48a562e..2cd5d12 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -252,6 +252,8 @@ nv30_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 
+	LIST_INITHEAD(&screen->query_list);
+
 	/* Vtxprog resources */
 	if (nouveau_resource_init(&screen->vp_exec_heap, 0, 256) ||
 	    nouveau_resource_init(&screen->vp_data_heap, 0, 256)) {
diff --git a/src/gallium/drivers/nv30/nv30_screen.h b/src/gallium/drivers/nv30/nv30_screen.h
index cbf945f..9190789 100644
--- a/src/gallium/drivers/nv30/nv30_screen.h
+++ b/src/gallium/drivers/nv30/nv30_screen.h
@@ -19,6 +19,7 @@ struct nv30_screen {
 	/* Query object resources */
 	struct nouveau_notifier *query;
 	struct nouveau_resource *query_heap;
+	struct list_head query_list;
 
 	/* Vtxprog resources */
 	struct nouveau_resource *vp_exec_heap;
diff --git a/src/gallium/drivers/nv40/nv40_query.c b/src/gallium/drivers/nv40/nv40_query.c
index 8ed4a67..01d35ea 100644
--- a/src/gallium/drivers/nv40/nv40_query.c
+++ b/src/gallium/drivers/nv40/nv40_query.c
@@ -3,6 +3,7 @@
 #include "nv40_context.h"
 
 struct nv40_query {
+        struct list_head list;
 	struct nouveau_resource *object;
 	unsigned type;
 	boolean ready;
@@ -23,6 +24,8 @@ nv40_query_create(struct pipe_context *pipe, unsigned query_type)
 	q = CALLOC(1, sizeof(struct nv40_query));
 	q->type = query_type;
 
+       assert(q->type == PIPE_QUERY_OCCLUSION_COUNTER);
+
 	return (struct pipe_query *)q;
 }
 
@@ -32,7 +35,10 @@ nv40_query_destroy(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nv40_query *q = nv40_query(pq);
 
 	if (q->object)
+	{
 		nouveau_resource_free(&q->object);
+                LIST_DEL(&q->list);
+	}
 	FREE(q);
 }
 
@@ -44,20 +50,25 @@ nv40_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nv40_screen *screen = nv40->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *curie = screen->curie;
-
-	assert(q->type == PIPE_QUERY_OCCLUSION_COUNTER);
+        uint64_t tmp;
 
 	/* Happens when end_query() is called, then another begin_query()
 	 * without querying the result in-between.  For now we'll wait for
 	 * the existing query to notify completion, but it could be better.
 	 */
-	if (q->object) {
-		uint64_t tmp;
+	if (q->object)
 		pipe->get_query_result(pipe, pq, 1, &tmp);
+
+	while (nouveau_resource_alloc(nv40->screen->query_heap, 1, NULL, &q->object))
+	{
+		struct nv40_query* oldestq;
+		assert(!LIST_IS_EMPTY(&nv40->screen->query_list));
+		oldestq = LIST_ENTRY(struct nv40_query, nv40->screen->query_list.next, list);
+		pipe->get_query_result(pipe, (struct pipe_query*)oldestq, 1, &tmp);
 	}
 
-	if (nouveau_resource_alloc(nv40->screen->query_heap, 1, NULL, &q->object))
-		assert(0);
+	LIST_ADDTAIL(&q->list, &nv40->screen->query_list);
+
 	nouveau_notifier_reset(nv40->screen->query, q->object->start);
 
 	BEGIN_RING(chan, curie, NV40TCL_QUERY_RESET, 1);
@@ -90,8 +101,6 @@ nv40_query_result(struct pipe_context *pipe, struct pipe_query *pq,
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_query *q = nv40_query(pq);
 
-	assert(q->object && q->type == PIPE_QUERY_OCCLUSION_COUNTER);
-
 	if (!q->ready) {
 		unsigned status;
 
@@ -110,6 +119,7 @@ nv40_query_result(struct pipe_context *pipe, struct pipe_query *pq,
 							q->object->start);
 		q->ready = TRUE;
 		nouveau_resource_free(&q->object);
+		LIST_DEL(&q->list);
 	}
 
 	*result = q->result;
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index 2939572..a8c14f9 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -237,6 +237,8 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 
+	LIST_INITHEAD(&screen->query_list);
+
 	/* Vtxprog resources */
 	if (nouveau_resource_init(&screen->vp_exec_heap, 0, 512) ||
 	    nouveau_resource_init(&screen->vp_data_heap, 0, 256)) {
diff --git a/src/gallium/drivers/nv40/nv40_screen.h b/src/gallium/drivers/nv40/nv40_screen.h
index 77bf94b..f3569a2 100644
--- a/src/gallium/drivers/nv40/nv40_screen.h
+++ b/src/gallium/drivers/nv40/nv40_screen.h
@@ -18,6 +18,7 @@ struct nv40_screen {
 	/* Query object resources */
 	struct nouveau_notifier *query;
 	struct nouveau_resource *query_heap;
+	struct list_head query_list;
 
 	/* Vtxprog resources */
 	struct nouveau_resource *vp_exec_heap;
-- 
1.6.3.3
