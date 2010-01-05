From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50: conditional rendering
Date: Tue, 05 Jan 2010 19:43:27 +0100
Message-ID: <4B43884F.7080200@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060703070100030003060000"
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
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------060703070100030003060000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The libdrm patch adds functions for unrestricted access to
the notifier area, the second adds conditional rendering:

In order to make the GPU wait for an occlusion query to return
its result, I want to use semaphores (following the example),
but they only work if you use a DMA object + a small offset
(using a RELOC on a query buffer didn't work, FIFO interrupt
(1 << 20)).

The only bo we have a DMA object for is the notifier, so I
thought we could just direct queries to that area, since it
isn't used anway.

Now if the state tracker wants to read the result, I can't
do waiting anymore by mapping a bo (since I didn't reloc one),
and thus I have to busy wait on the notifier area, which isn't
necessarily optimal ...

Any suggestions ?
Christoph

--------------060703070100030003060000
Content-Type: text/plain;
 name="0001-nv50-support-conditional-rendering.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-nv50-support-conditional-rendering.patch"

From 5f08c8ec98e389f69d80b4529a89ebaee3a72a93 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Tue, 5 Jan 2010 14:22:06 +0100
Subject: [PATCH 1/7] nv50: support conditional rendering

On get_query_result with wait == TRUE, we now flush
and then busy wait for the result to be written.
---
 src/gallium/drivers/nv50/nv50_query.c  |   94 +++++++++++++++++++++++---------
 src/gallium/drivers/nv50/nv50_screen.c |    6 ++-
 src/gallium/drivers/nv50/nv50_screen.h |    1 +
 3 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/nv50/nv50_query.c
index 5d9e182..e320cc6 100644
--- a/src/gallium/drivers/nv50/nv50_query.c
+++ b/src/gallium/drivers/nv50/nv50_query.c
@@ -27,6 +27,7 @@
 
 struct nv50_query {
 	struct nouveau_bo *bo;
+	int slot;
 	unsigned type;
 	boolean ready;
 	uint64_t result;
@@ -41,19 +42,23 @@ nv50_query(struct pipe_query *pipe)
 static struct pipe_query *
 nv50_query_create(struct pipe_context *pipe, unsigned type)
 {
-	struct nouveau_device *dev = nouveau_screen(pipe->screen)->device;
-	struct nv50_query *q = CALLOC_STRUCT(nv50_query);
-	int ret;
+	struct nv50_screen *screen = nv50_context(pipe)->screen;
+	struct nv50_query *q;
+	int slot;
 
-	assert (q->type == PIPE_QUERY_OCCLUSION_COUNTER);
-	q->type = type;
+	assert(type == PIPE_QUERY_OCCLUSION_COUNTER);
 
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM | NOUVEAU_BO_MAP, 256,
-			     16, &q->bo);
-	if (ret) {
-		FREE(q);
+	slot = ffs(screen->notifier_slots) - 1;
+	if (slot < 0)
 		return NULL;
-	}
+
+	q = CALLOC_STRUCT(nv50_query);
+	if (!q)
+		return NULL;
+
+	screen->notifier_slots |= 1 << slot;
+	q->slot = slot;
+	q->type = type;
 
 	return (struct pipe_query *)q;
 }
@@ -61,10 +66,11 @@ nv50_query_create(struct pipe_context *pipe, unsigned type)
 static void
 nv50_query_destroy(struct pipe_context *pipe, struct pipe_query *pq)
 {
+	struct nv50_screen *screen = nv50_context(pipe)->screen;
 	struct nv50_query *q = nv50_query(pq);
 
 	if (q) {
-		nouveau_bo_ref(NULL, &q->bo);
+		screen->notifier_slots &= ~(1 << q->slot);
 		FREE(q);
 	}
 }
@@ -72,11 +78,14 @@ nv50_query_destroy(struct pipe_context *pipe, struct pipe_query *pq)
 static void
 nv50_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 {
-	struct nv50_context *nv50 = nv50_context(pipe);
-	struct nouveau_channel *chan = nv50->screen->base.channel;
-	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_screen *screen = nv50_context(pipe)->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *tesla = screen->tesla;
 	struct nv50_query *q = nv50_query(pq);
 
+	nouveau_notifier_wr32(screen->sync, q->slot * 4 + 0, 0xff);
+	nouveau_notifier_wr32(screen->sync, q->slot * 4 + 1, 0xff);
+
 	BEGIN_RING(chan, tesla, NV50TCL_SAMPLECNT_RESET, 1);
 	OUT_RING  (chan, 1);
 	BEGIN_RING(chan, tesla, NV50TCL_SAMPLECNT_ENABLE, 1);
@@ -93,36 +102,70 @@ nv50_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_query *q = nv50_query(pq);
 
-	MARK_RING (chan, 5, 2); /* flush on lack of space or relocs */
 	BEGIN_RING(chan, tesla, NV50TCL_QUERY_ADDRESS_HIGH, 4);
-	OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, q->slot * 16);
 	OUT_RING  (chan, 0x00000000);
 	OUT_RING  (chan, 0x0100f002);
-	FIRE_RING (chan);
+
+	BEGIN_RING(chan, tesla, NV50TCL_SAMPLECNT_ENABLE, 1);
+	OUT_RING  (chan, 0);
 }
 
 static boolean
 nv50_query_result(struct pipe_context *pipe, struct pipe_query *pq,
 		  boolean wait, uint64_t *result)
 {
+	struct nv50_screen *screen = nv50_context(pipe)->screen;
+	struct nouveau_channel *chan = screen->base.channel;
 	struct nv50_query *q = nv50_query(pq);
-	int ret;
 
 	if (!q->ready) {
-		ret = nouveau_bo_map(q->bo, NOUVEAU_BO_RD |
-				     wait ? 0 : NOUVEAU_BO_NOWAIT);
-		if (ret)
-			return false;
-		q->result = ((uint32_t *)q->bo->map)[1];
+		int pos = q->slot * 16;
+
+		if (nouveau_notifier_rd32(screen->sync, pos)) {
+			if (!wait)
+				return false;
+			FIRE_RING(chan);
+		}
+		while (nouveau_notifier_rd32(screen->sync, pos));
+
+		q->result = nouveau_notifier_rd32(screen->sync, pos + 1);
 		q->ready = TRUE;
-		nouveau_bo_unmap(q->bo);
 	}
 
 	*result = q->result;
 	return q->ready;
 }
 
+static void
+nv50_render_condition(struct pipe_context *pipe,
+		      struct pipe_query *pq, uint mode)
+{
+	struct nv50_screen *screen = nv50_context(pipe)->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *tesla = screen->tesla;
+	struct nv50_query *q = nv50_query(pq);
+
+	if (q) {
+		if (mode == PIPE_RENDER_COND_WAIT ||
+		    mode == PIPE_RENDER_COND_BY_REGION_WAIT) {
+			BEGIN_RING(chan, tesla, 0x60, 3);
+			OUT_RING  (chan, screen->sync->handle);
+			OUT_RING  (chan, q->slot * 16);
+			OUT_RING  (chan, 0);
+		}
+
+		BEGIN_RING(chan, tesla, NV50TCL_COND_ADDRESS_HIGH, 3);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, q->slot * 16);
+		OUT_RING  (chan, NV50TCL_COND_MODE_RES);
+	} else {
+		BEGIN_RING(chan, tesla, NV50TCL_COND_MODE, 1);
+		OUT_RING  (chan, NV50TCL_COND_MODE_ALWAYS);
+	}
+}
+
 void
 nv50_init_query_functions(struct nv50_context *nv50)
 {
@@ -131,4 +174,5 @@ nv50_init_query_functions(struct nv50_context *nv50)
 	nv50->pipe.begin_query = nv50_query_begin;
 	nv50->pipe.end_query = nv50_query_end;
 	nv50->pipe.get_query_result = nv50_query_result;
+	nv50->pipe.render_condition = nv50_render_condition;
 }
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 7e039ea..d7bc3cd 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -276,12 +276,13 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	BIND_RING(chan, screen->tesla, 3);
 
 	/* Sync notifier */
-	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
+	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 16, &screen->sync);
 	if (ret) {
 		NOUVEAU_ERR("Error creating notifier object: %d\n", ret);
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
+	screen->notifier_slots = 0x3; /* mark first 2 slots as reserved */
 
 	/* Static M2MF init */
 	so = so_new(32, 0);
@@ -322,6 +323,9 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 				     NV50TCL_DMA_COLOR__SIZE);
 	for (i = 0; i < NV50TCL_DMA_COLOR__SIZE; i++)
 		so_data(so, chan->vram->handle);
+	so_method(so, screen->tesla, NV50TCL_DMA_QUERY, 1);
+	so_data  (so, screen->sync->handle);
+
 	so_method(so, screen->tesla, NV50TCL_RT_CONTROL, 1);
 	so_data  (so, 1);
 
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
index 61e24a5..7a66e11 100644
--- a/src/gallium/drivers/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nv50/nv50_screen.h
@@ -14,6 +14,7 @@ struct nv50_screen {
 	struct nouveau_grobj *eng2d;
 	struct nouveau_grobj *m2mf;
 	struct nouveau_notifier *sync;
+	uint32_t notifier_slots;
 
 	struct nouveau_bo *constbuf_misc[1];
 	struct nouveau_bo *constbuf_parm[2];
-- 
1.6.4.4


--------------060703070100030003060000
Content-Type: text/plain;
 name="0001-nouveau-add-nouveau_notifier_rd32-wr32.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-nouveau-add-nouveau_notifier_rd32-wr32.patch"

From b91119114f01bb47d958a59fdb566c4c70b50500 Mon Sep 17 00:00:00 2001
From: root <root@ECHELON.(none)>
Date: Tue, 5 Jan 2010 12:12:35 +0100
Subject: [PATCH] nouveau: add nouveau_notifier_rd32/wr32

---
 nouveau/nouveau_notifier.c |   15 +++++++++++++++
 nouveau/nouveau_notifier.h |    6 ++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_notifier.c b/nouveau/nouveau_notifier.c
index f8cfd8b..5e6e47c 100644
--- a/nouveau/nouveau_notifier.c
+++ b/nouveau/nouveau_notifier.c
@@ -144,3 +144,18 @@ nouveau_notifier_wait_status(struct nouveau_notifier *notifier, int id,
 	return -EBUSY;
 }
 
+uint32_t
+nouveau_notifier_rd32(struct nouveau_notifier *notifier, int pos)
+{
+	struct nouveau_notifier_priv *nvnotify = nouveau_notifier(notifier);
+
+	return ((volatile uint32_t *)nvnotify->map)[pos];
+}
+
+void
+nouveau_notifier_wr32(struct nouveau_notifier *notifier, int pos, uint32_t val)
+{
+	struct nouveau_notifier_priv *nvnotify = nouveau_notifier(notifier);
+
+	((volatile uint32_t *)nvnotify->map)[pos] = val;
+}
diff --git a/nouveau/nouveau_notifier.h b/nouveau/nouveau_notifier.h
index dbc6a3b..0008df1 100644
--- a/nouveau/nouveau_notifier.h
+++ b/nouveau/nouveau_notifier.h
@@ -56,6 +56,12 @@ nouveau_notifier_status(struct nouveau_notifier *, int id);
 uint32_t
 nouveau_notifier_return_val(struct nouveau_notifier *, int id);
 
+uint32_t
+nouveau_notifier_rd32(struct nouveau_notifier *, int pos);
+
+void
+nouveau_notifier_wr32(struct nouveau_notifier *, int pos, uint32_t val);
+
 int
 nouveau_notifier_wait_status(struct nouveau_notifier *, int id, uint32_t status,
 			     double timeout);
-- 
1.6.4.4


--------------060703070100030003060000
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------060703070100030003060000--
