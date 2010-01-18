From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 1/2] nv30-nv40: Rewrite primitive splitting and
	emission
Date: Mon, 18 Jan 2010 15:43:58 +0100
Message-ID: <1263825839-16277-1-git-send-email-luca@luca-barbieri.com>
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

The current code for primitive splitting and emission on pre-nv50 is
severely broken.

In particular:
1. Quads and lines are totally broken because "&= 3" should be "&= ~3"
and similar for lines
2. Triangle fans and polygons are broken because the first vertex
must be repeated for each split chunk
3. Line loops are broken because the must be converted to a line strip,
reemitting the first vertex at the end to close the loop
4. Quad strips are broken because 2 vertices must be repeated, and not 3

This patch rewrites the splitting code to work correctly for all
primitives, including those with adjacency.

It also rewrites the nv30/nv40 code to make use of the the new splitting
code and simplifies it by making more code common between the different
emission strategies (vbo, u8/u16/u32 indices, index buffer).

Note that the splitting helper is now independent of nouveau and could
be moved into gallium/auxiliary.
---
 src/gallium/drivers/nouveau/nouveau_util.h |  107 ++++++++---
 src/gallium/drivers/nv30/nv30_vbo.c        |  287 ++++++++++++++++------------
 src/gallium/drivers/nv40/nv40_vbo.c        |  280 +++++++++++++++------------
 3 files changed, 403 insertions(+), 271 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_util.h b/src/gallium/drivers/nouveau/nouveau_util.h
index a10114b..a74d75d 100644
--- a/src/gallium/drivers/nouveau/nouveau_util.h
+++ b/src/gallium/drivers/nouveau/nouveau_util.h
@@ -1,63 +1,124 @@
 #ifndef __NOUVEAU_UTIL_H__
 #define __NOUVEAU_UTIL_H__
 
-/* Determine how many vertices can be pushed into the command stream.
- * Where the remaining space isn't large enough to represent all verices,
- * split the buffer at primitive boundaries.
+// output v[global_start] before the chunk
+#define SPLIT_BEGIN_WITH_FIRST 1
+
+// output v[global_start] before the chunk, with edgeflag off
+#define SPLIT_BEGIN_WITH_FIRST_EDGEFLAG_OFF 2
+
+// output v[global_start] after the chunk
+#define SPLIT_END_WITH_FIRST 4
+
+// output v[chunk_start - 4], v[chunk_start - 6], v[chunk_start - 2] before the chunk
+// output v[chunk_end + 1] after the chunk
+#define SPLIT_TRIANGLE_STRIP_ADJACENCY 8
+
+/* private flags for nouveau_vbuf_split to keep state */
+#define SPLIT_CLOSE_LOOP 0x40000000
+
+/* If 0 is returned, you must flush and retry
  *
- * Returns a count of vertices that can be rendered, and an index to
- * restart drawing at after a flush.
+ * Otherwise:
+ * 1. Output special vertices at the beginning if the _old_ value of flags specifies that
+ * 2. Output the returned amount of vertices
+ * 3. Output special vertices at the end if the _new_ value of flags specifies that
+ * 3. Set start to *restart. If *restart == end, you are done
  */
 static INLINE unsigned
-nouveau_vbuf_split(unsigned remaining, unsigned overhead, unsigned vpp,
-		   unsigned mode, unsigned start, unsigned count,
-		   unsigned *restart)
+util_split_primitive(int max, unsigned* pmode, unsigned* pstart, unsigned end, unsigned* flags)
 {
-	int max, adj = 0;
+	unsigned mode = *pmode;
+	unsigned start = *pstart;
+	unsigned count = end - start;
+	int adj = 0;
 
-	max  = remaining - overhead;
 	if (max < 0)
 		return 0;
 
-	max *= vpp;
 	if (max >= count)
+	{
+		if(*flags & SPLIT_CLOSE_LOOP)
+			*flags |= SPLIT_END_WITH_FIRST;
+
+		*flags &= ~SPLIT_TRIANGLE_STRIP_ADJACENCY;
+		*pstart = end;
+
 		return count;
+	}
 
 	switch (mode) {
 	case PIPE_PRIM_POINTS:
 		break;
 	case PIPE_PRIM_LINES:
-		max = max & 1;
-		break;
-	case PIPE_PRIM_TRIANGLES:
-		max = max - (max % 3);
-		break;
-	case PIPE_PRIM_QUADS:
-		max = max & 3;
+		max &= ~1;
 		break;
 	case PIPE_PRIM_LINE_LOOP:
+		if (max < 2)
+			return 0;
+		adj = 1;
+		*pmode = PIPE_PRIM_LINE_STRIP;
+		*flags |= SPLIT_CLOSE_LOOP;
+		break;
 	case PIPE_PRIM_LINE_STRIP:
 		if (max < 2)
-			max = 0;
+			return 0;
 		adj = 1;
 		break;
-	case PIPE_PRIM_POLYGON:
+	case PIPE_PRIM_TRIANGLES:
+		max = max - (max % 3);
+		break;
 	case PIPE_PRIM_TRIANGLE_STRIP:
-	case PIPE_PRIM_TRIANGLE_FAN:
 		if (max < 3)
 			max = 0;
 		adj = 2;
 		break;
+	case PIPE_PRIM_TRIANGLE_FAN:
+		if(max < 3)
+			return 0;
+		adj = 1;
+		*flags |= SPLIT_BEGIN_WITH_FIRST;
+		break;
+	case PIPE_PRIM_QUADS:
+		max &= ~3;
+		break;
 	case PIPE_PRIM_QUAD_STRIP:
+		max &= ~1;
 		if (max < 4)
-			max = 0;
+			return 0;
+		adj = 2;
+		break;
+	case PIPE_PRIM_POLYGON:
+		if(max < 3)
+			return 0;
+		adj = 1;
+		*flags |= SPLIT_BEGIN_WITH_FIRST | SPLIT_BEGIN_WITH_FIRST_EDGEFLAG_OFF;
+		break;
+	case PIPE_PRIM_LINES_ADJACENCY:
+		max &= ~3;
+		break;
+	case PIPE_PRIM_LINE_STRIP_ADJACENCY:
+		if (max < 4)
+			return 0;
 		adj = 3;
 		break;
+	case PIPE_PRIM_TRIANGLES_ADJACENCY:
+		max = max - (max % 6);
+		break;
+	case PIPE_PRIM_TRIANGLE_STRIP_ADJACENCY:
+		max &= ~3;
+		if(!max)
+			return 0;
+		--max;
+		*flags |= SPLIT_TRIANGLE_STRIP_ADJACENCY;
 	default:
 		assert(0);
 	}
 
-	*restart = start + max - adj;
+	assert(max > 0);
+	assert(adj < max);
+	assert(max < count);
+	*pstart = start + max - adj;
 	return max;
 }
 
diff --git a/src/gallium/drivers/nv30/nv30_vbo.c b/src/gallium/drivers/nv30/nv30_vbo.c
index 1c5db03..b89ef5d 100644
--- a/src/gallium/drivers/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nv30/nv30_vbo.c
@@ -163,6 +163,121 @@ nv30_vbo_static_attrib(struct nv30_context *nv30, struct nouveau_stateobj *so,
 	return TRUE;
 }
 
+// TODO: share this with NV40 instead of duplicating
+struct nv30_primitive
+{
+	struct nv30_context *nv30;
+	unsigned mode;
+	unsigned start;
+	unsigned end;
+	unsigned vpp;
+	unsigned flags;
+	unsigned startv;
+	int chunk;
+};
+
+static inline void
+nv30_primitive_init(struct nv30_primitive* prim, struct nv30_context *nv30,
+		 unsigned mode, unsigned start, unsigned count, unsigned vpp, unsigned startv)
+{
+	prim->nv30 = nv30;
+	prim->start = start;
+	prim->end = start + count;
+	prim->mode = mode;
+	prim->flags = 0;
+	prim->startv = startv;
+	prim->chunk = -1;
+	prim->vpp = vpp;
+
+	nv30_state_emit(nv30);
+}
+
+#define START_INDEX 0x80000000
+
+static inline void
+nv30_primitive_start_vertex(struct nv30_primitive* prim)
+{
+	struct nv30_screen *screen = prim->nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
+
+	if(prim->startv & START_INDEX)
+	{
+		BEGIN_RING(chan, rankine, NV34TCL_VB_INDEX_BATCH, 1);
+		OUT_RING  (chan, (prim->startv & ~START_INDEX));
+	}
+	else
+	{
+		BEGIN_RING(chan, rankine, NV34TCL_VB_ELEMENT_U32, 1);
+		OUT_RING  (chan, prim->startv);
+	}
+}
+
+static inline unsigned
+nv30_primitive_begin(struct nv30_primitive* prim, unsigned* pstart)
+{
+	struct nv30_screen *screen = prim->nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
+	unsigned vc;
+	unsigned oldflags = prim->flags;
+	unsigned avail;
+
+	*pstart = prim->start;
+
+	if(prim->start == prim->end)
+		return 0;
+
+retry:
+	avail = chan->pushbuf->remaining;
+	avail -= 10 + 1 + (chan->pushbuf->remaining >> 11); /* for the BEGIN_RING_NIs */
+	avail *= prim->vpp;
+	vc = util_split_primitive(avail, &prim->mode, &prim->start, prim->end, &prim->flags);
+	if(!vc)
+	{
+		FIRE_RING(chan);
+		goto retry;
+	}
+
+	BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+	OUT_RING  (chan, nvgl_primitive(prim->mode));
+
+	if(oldflags & SPLIT_BEGIN_WITH_FIRST)
+		nv30_primitive_start_vertex(prim);
+
+	++prim->chunk;
+	return vc;
+}
+
+static inline void
+nv30_primitive_end(struct nv30_primitive* prim)
+{
+	struct nv30_screen *screen = prim->nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
+
+	if(prim->flags & SPLIT_END_WITH_FIRST)
+		nv30_primitive_start_vertex(prim);
+
+	BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+	OUT_RING  (chan, 0);
+}
+
+static inline unsigned
+nv30_primitive_chunk(struct nv30_primitive* prim, unsigned* pstart)
+{
+	if(prim->chunk >= 0)
+		nv30_primitive_end(prim);
+
+	unsigned vc = nv30_primitive_begin(prim, pstart);
+	if(!vc)
+	{
+		prim->nv30->pipe.flush(&prim->nv30->pipe, 0, NULL);
+		return 0;
+	}
+	return vc;
+}
+
 void
 nv30_draw_arrays(struct pipe_context *pipe,
 		 unsigned mode, unsigned start, unsigned count)
@@ -171,59 +286,41 @@ nv30_draw_arrays(struct pipe_context *pipe,
 	struct nv30_screen *screen = nv30->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *rankine = screen->rankine;
-	unsigned restart = 0;
+	struct nv30_primitive prim;
+	unsigned vc;
 
 	nv30_vbo_set_idxbuf(nv30, NULL, 0);
 	if (FORCE_SWTNL || !nv30_state_validate(nv30)) {
-		/*return nv30_draw_elements_swtnl(pipe, NULL, 0,
-						mode, start, count);*/
-		return;
+		/*nv30_draw_elements_swtnl(pipe, NULL, 0,
+                                         mode, start, count);*/
+                return;
 	}
 
-	while (count) {
-		unsigned vc, nr;
-
-		nv30_state_emit(nv30);
+	nv30_primitive_init(&prim, nv30, mode, start, count, 256, start);
 
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
-					mode, start, count, &restart);
-		if (!vc) {
-			FIRE_RING(chan);
-			continue;
-		}
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
-
-		nr = (vc & 0xff);
+	while ((vc = nv30_primitive_chunk(&prim, &start)))
+	{
+		assert(start < (nv30->vtxbuf[0].buffer->size >> 2));
+		unsigned nr = (vc & 0xff);
 		if (nr) {
 			BEGIN_RING(chan, rankine, NV34TCL_VB_VERTEX_BATCH, 1);
 			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
-		nr = vc >> 8;
-		while (nr) {
-			unsigned push = nr > 2047 ? 2047 : nr;
-
-			nr -= push;
+		vc >>= 8;
+		while (vc) {
+			unsigned push = vc > 2047 ? 2047 : vc;
+			vc -= push;
 
 			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_VERTEX_BATCH, push);
 			while (push--) {
+				assert(start < (nv30->vtxbuf[0].buffer->size >> 2));
 				OUT_RING(chan, ((0x100 - 1) << 24) | start);
 				start += 0x100;
 			}
 		}
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		count -= vc;
-		start = restart;
 	}
-
-	pipe->flush(pipe, 0, NULL);
-	return TRUE;
 }
 
 static INLINE void
@@ -233,24 +330,14 @@ nv30_draw_elements_u08(struct nv30_context *nv30, void *ib,
 	struct nv30_screen *screen = nv30->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *rankine = screen->rankine;
+	struct nv30_primitive prim;
+	unsigned vc;
 
-	while (count) {
-		uint8_t *elts = (uint8_t *)ib + start;
-		unsigned vc, push, restart = 0;
-
-		nv30_state_emit(nv30);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
-					mode, start, count, &restart);
-		if (vc == 0) {
-			FIRE_RING(chan);
-			continue;
-		}
-		count -= vc;
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
+	nv30_primitive_init(&prim, nv30, mode, start, count, 2, ((uint8_t*)ib)[start]);
 
+	while ((vc = nv30_primitive_chunk(&prim, &start)))
+	{
+		uint8_t* elts = (uint8_t*)ib + start;
 		if (vc & 1) {
 			BEGIN_RING(chan, rankine, NV34TCL_VB_ELEMENT_U32, 1);
 			OUT_RING  (chan, elts[0]);
@@ -259,8 +346,7 @@ nv30_draw_elements_u08(struct nv30_context *nv30, void *ib,
 
 		while (vc) {
 			unsigned i;
-
-			push = MIN2(vc, 2047 * 2);
+			unsigned push = MIN2(vc, 2047 * 2);
 
 			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
@@ -269,11 +355,6 @@ nv30_draw_elements_u08(struct nv30_context *nv30, void *ib,
 			vc -= push;
 			elts += push;
 		}
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		start = restart;
 	}
 }
 
@@ -284,23 +365,14 @@ nv30_draw_elements_u16(struct nv30_context *nv30, void *ib,
 	struct nv30_screen *screen = nv30->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *rankine = screen->rankine;
+	struct nv30_primitive prim;
+	unsigned vc;
 
-	while (count) {
-		uint16_t *elts = (uint16_t *)ib + start;
-		unsigned vc, push, restart = 0;
-
-		nv30_state_emit(nv30);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
-					mode, start, count, &restart);
-		if (vc == 0) {
-			FIRE_RING(chan);
-			continue;
-		}
-		count -= vc;
+	nv30_primitive_init(&prim, nv30, mode, start, count, 2, ((uint16_t*)ib)[start]);
 
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
+	while ((vc = nv30_primitive_chunk(&prim, &start)))
+	{
+		uint16_t *elts = (uint16_t *)ib + start;
 
 		if (vc & 1) {
 			BEGIN_RING(chan, rankine, NV34TCL_VB_ELEMENT_U32, 1);
@@ -310,8 +382,7 @@ nv30_draw_elements_u16(struct nv30_context *nv30, void *ib,
 
 		while (vc) {
 			unsigned i;
-
-			push = MIN2(vc, 2047 * 2);
+			unsigned push = MIN2(vc, 2047 * 2);
 
 			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
@@ -320,11 +391,6 @@ nv30_draw_elements_u16(struct nv30_context *nv30, void *ib,
 			vc -= push;
 			elts += push;
 		}
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		start = restart;
 	}
 }
 
@@ -335,26 +401,17 @@ nv30_draw_elements_u32(struct nv30_context *nv30, void *ib,
 	struct nv30_screen *screen = nv30->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *rankine = screen->rankine;
+	struct nv30_primitive prim;
+	unsigned vc;
 
-	while (count) {
-		uint32_t *elts = (uint32_t *)ib + start;
-		unsigned vc, push, restart = 0;
-
-		nv30_state_emit(nv30);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 5, 1,
-					mode, start, count, &restart);
-		if (vc == 0) {
-			FIRE_RING(chan);
-			continue;
-		}
-		count -= vc;
+	nv30_primitive_init(&prim, nv30, mode, start, count, 1, ((uint32_t*)ib)[start]);
 
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
+	while ((vc = nv30_primitive_chunk(&prim, &start)))
+	{
+		uint32_t *elts = (uint32_t *)ib + start;
 
 		while (vc) {
-			push = MIN2(vc, 2047);
+			unsigned push = MIN2(vc, 2047);
 
 			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_ELEMENT_U32, push);
 			OUT_RINGp    (chan, elts, push);
@@ -362,11 +419,6 @@ nv30_draw_elements_u32(struct nv30_context *nv30, void *ib,
 			vc -= push;
 			elts += push;
 		}
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		start = restart;
 	}
 }
 
@@ -411,35 +463,24 @@ nv30_draw_elements_vbo(struct pipe_context *pipe,
 	struct nv30_screen *screen = nv30->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *rankine = screen->rankine;
-	unsigned restart = 0;
-
-	while (count) {
-		unsigned nr, vc;
+	struct nv30_primitive prim;
+	unsigned vc;
 
-		nv30_state_emit(nv30);
+	nv30_primitive_init(&prim, nv30, mode, start, count, 256, START_INDEX | start);
 
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
-					mode, start, count, &restart);
-		if (!vc) {
-			FIRE_RING(chan);
-			continue;
-		}
-		
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
-
-		nr = (vc & 0xff);
+	while ((vc = nv30_primitive_chunk(&prim, &start)))
+	{
+		unsigned nr = (vc & 0xff);
 		if (nr) {
 			BEGIN_RING(chan, rankine, NV34TCL_VB_INDEX_BATCH, 1);
 			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
-		nr = vc >> 8;
-		while (nr) {
-			unsigned push = nr > 2047 ? 2047 : nr;
-
-			nr -= push;
+		vc >>= 8;
+		while (vc) {
+			unsigned push = vc > 2047 ? 2047 : vc;
+			vc -= push;
 
 			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_INDEX_BATCH, push);
 			while (push--) {
@@ -447,12 +488,6 @@ nv30_draw_elements_vbo(struct pipe_context *pipe,
 				start += 0x100;
 			}
 		}
-
-		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		count -= vc;
-		start = restart;
 	}
 }
 
diff --git a/src/gallium/drivers/nv40/nv40_vbo.c b/src/gallium/drivers/nv40/nv40_vbo.c
index a777898..1182fc4 100644
--- a/src/gallium/drivers/nv40/nv40_vbo.c
+++ b/src/gallium/drivers/nv40/nv40_vbo.c
@@ -164,6 +164,121 @@ nv40_vbo_static_attrib(struct nv40_context *nv40, struct nouveau_stateobj *so,
 	return TRUE;
 }
 
+// TODO: share this with NV30
+struct nv40_primitive
+{
+	struct nv40_context *nv40;
+	unsigned mode;
+	unsigned start;
+	unsigned end;
+	unsigned vpp;
+	unsigned flags;
+	unsigned startv;
+	int chunk;
+};
+
+static inline void
+nv40_primitive_init(struct nv40_primitive* prim, struct nv40_context *nv40,
+		 unsigned mode, unsigned start, unsigned count, unsigned vpp, unsigned startv)
+{
+	prim->nv40 = nv40;
+	prim->start = start;
+	prim->end = start + count;
+	prim->mode = mode;
+	prim->flags = 0;
+	prim->startv = startv;
+	prim->chunk = -1;
+	prim->vpp = vpp;
+
+	nv40_state_emit(nv40);
+}
+
+#define START_INDEX 0x80000000
+
+static inline void
+nv40_primitive_start_vertex(struct nv40_primitive* prim)
+{
+	struct nv40_screen *screen = prim->nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
+
+	if(prim->startv & START_INDEX)
+	{
+		BEGIN_RING(chan, curie, NV40TCL_VB_INDEX_BATCH, 1);
+		OUT_RING  (chan, (prim->startv & ~START_INDEX));
+	}
+	else
+	{
+		BEGIN_RING(chan, curie, NV40TCL_VB_ELEMENT_U32, 1);
+		OUT_RING  (chan, prim->startv);
+	}
+}
+
+static inline unsigned
+nv40_primitive_begin(struct nv40_primitive* prim, unsigned* pstart)
+{
+	struct nv40_screen *screen = prim->nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
+	unsigned vc;
+	unsigned oldflags = prim->flags;
+	unsigned avail;
+
+	*pstart = prim->start;
+
+	if(prim->start == prim->end)
+		return 0;
+
+retry:
+	avail = chan->pushbuf->remaining;
+	avail -= 10 + 1 + (chan->pushbuf->remaining >> 11); /* for the BEGIN_RING_NIs */
+	avail *= prim->vpp;
+	vc = util_split_primitive(avail, &prim->mode, &prim->start, prim->end, &prim->flags);
+	if(!vc)
+	{
+		FIRE_RING(chan);
+		goto retry;
+	}
+
+	BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+	OUT_RING  (chan, nvgl_primitive(prim->mode));
+
+	if(oldflags & SPLIT_BEGIN_WITH_FIRST)
+		nv40_primitive_start_vertex(prim);
+
+	++prim->chunk;
+	return vc;
+}
+
+static inline void
+nv40_primitive_end(struct nv40_primitive* prim)
+{
+	struct nv40_screen *screen = prim->nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
+
+	if(prim->flags & SPLIT_END_WITH_FIRST)
+		nv40_primitive_start_vertex(prim);
+
+	BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+	OUT_RING  (chan, 0);
+}
+
+static inline unsigned
+nv40_primitive_chunk(struct nv40_primitive* prim, unsigned* pstart)
+{
+	if(prim->chunk >= 0)
+		nv40_primitive_end(prim);
+
+	unsigned vc = nv40_primitive_begin(prim, pstart);
+	if(!vc)
+	{
+		prim->nv40->pipe.flush(&prim->nv40->pipe, 0, NULL);
+		return 0;
+	}
+	return vc;
+}
+
 void
 nv40_draw_arrays(struct pipe_context *pipe,
 		 unsigned mode, unsigned start, unsigned count)
@@ -172,7 +287,8 @@ nv40_draw_arrays(struct pipe_context *pipe,
 	struct nv40_screen *screen = nv40->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *curie = screen->curie;
-	unsigned restart;
+	struct nv40_primitive prim;
+	unsigned vc;
 
 	nv40_vbo_set_idxbuf(nv40, NULL, 0);
 	if (FORCE_SWTNL || !nv40_state_validate(nv40)) {
@@ -181,49 +297,31 @@ nv40_draw_arrays(struct pipe_context *pipe,
                 return;
 	}
 
-	while (count) {
-		unsigned vc, nr;
+	nv40_primitive_init(&prim, nv40, mode, start, count, 256, start);
 
-		nv40_state_emit(nv40);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
-					mode, start, count, &restart);
-		if (!vc) {
-			FIRE_RING(chan);
-			continue;
-		}
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
-
-		nr = (vc & 0xff);
+	while ((vc = nv40_primitive_chunk(&prim, &start)))
+	{
+		assert(start < (nv40->vtxbuf[0].buffer->size >> 2));
+		unsigned nr = (vc & 0xff);
 		if (nr) {
 			BEGIN_RING(chan, curie, NV40TCL_VB_VERTEX_BATCH, 1);
 			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
-		nr = vc >> 8;
-		while (nr) {
-			unsigned push = nr > 2047 ? 2047 : nr;
-
-			nr -= push;
+		vc >>= 8;
+		while (vc) {
+			unsigned push = vc > 2047 ? 2047 : vc;
+			vc -= push;
 
 			BEGIN_RING_NI(chan, curie, NV40TCL_VB_VERTEX_BATCH, push);
 			while (push--) {
+				assert(start < (nv40->vtxbuf[0].buffer->size >> 2));
 				OUT_RING(chan, ((0x100 - 1) << 24) | start);
 				start += 0x100;
 			}
 		}
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		count -= vc;
-		start = restart;
 	}
-
-	pipe->flush(pipe, 0, NULL);
 }
 
 static INLINE void
@@ -233,24 +331,14 @@ nv40_draw_elements_u08(struct nv40_context *nv40, void *ib,
 	struct nv40_screen *screen = nv40->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *curie = screen->curie;
+	struct nv40_primitive prim;
+	unsigned vc;
 
-	while (count) {
-		uint8_t *elts = (uint8_t *)ib + start;
-		unsigned vc, push, restart;
-
-		nv40_state_emit(nv40);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
-					mode, start, count, &restart);
-		if (vc == 0) {
-			FIRE_RING(chan);
-			continue;
-		}
-		count -= vc;
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
+	nv40_primitive_init(&prim, nv40, mode, start, count, 2, ((uint8_t*)ib)[start]);
 
+	while ((vc = nv40_primitive_chunk(&prim, &start)))
+	{
+		uint8_t* elts = (uint8_t*)ib + start;
 		if (vc & 1) {
 			BEGIN_RING(chan, curie, NV40TCL_VB_ELEMENT_U32, 1);
 			OUT_RING  (chan, elts[0]);
@@ -259,8 +347,7 @@ nv40_draw_elements_u08(struct nv40_context *nv40, void *ib,
 
 		while (vc) {
 			unsigned i;
-
-			push = MIN2(vc, 2047 * 2);
+			unsigned push = MIN2(vc, 2047 * 2);
 
 			BEGIN_RING_NI(chan, curie, NV40TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
@@ -269,11 +356,6 @@ nv40_draw_elements_u08(struct nv40_context *nv40, void *ib,
 			vc -= push;
 			elts += push;
 		}
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		start = restart;
 	}
 }
 
@@ -284,23 +366,14 @@ nv40_draw_elements_u16(struct nv40_context *nv40, void *ib,
 	struct nv40_screen *screen = nv40->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *curie = screen->curie;
+	struct nv40_primitive prim;
+	unsigned vc;
 
-	while (count) {
-		uint16_t *elts = (uint16_t *)ib + start;
-		unsigned vc, push, restart;
-
-		nv40_state_emit(nv40);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
-					mode, start, count, &restart);
-		if (vc == 0) {
-			FIRE_RING(chan);
-			continue;
-		}
-		count -= vc;
+	nv40_primitive_init(&prim, nv40, mode, start, count, 2, ((uint16_t*)ib)[start]);
 
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
+	while ((vc = nv40_primitive_chunk(&prim, &start)))
+	{
+		uint16_t *elts = (uint16_t *)ib + start;
 
 		if (vc & 1) {
 			BEGIN_RING(chan, curie, NV40TCL_VB_ELEMENT_U32, 1);
@@ -310,8 +383,7 @@ nv40_draw_elements_u16(struct nv40_context *nv40, void *ib,
 
 		while (vc) {
 			unsigned i;
-
-			push = MIN2(vc, 2047 * 2);
+			unsigned push = MIN2(vc, 2047 * 2);
 
 			BEGIN_RING_NI(chan, curie, NV40TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
@@ -320,11 +392,6 @@ nv40_draw_elements_u16(struct nv40_context *nv40, void *ib,
 			vc -= push;
 			elts += push;
 		}
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		start = restart;
 	}
 }
 
@@ -335,26 +402,17 @@ nv40_draw_elements_u32(struct nv40_context *nv40, void *ib,
 	struct nv40_screen *screen = nv40->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *curie = screen->curie;
+	struct nv40_primitive prim;
+	unsigned vc;
 
-	while (count) {
-		uint32_t *elts = (uint32_t *)ib + start;
-		unsigned vc, push, restart;
+	nv40_primitive_init(&prim, nv40, mode, start, count, 1, ((uint32_t*)ib)[start]);
 
-		nv40_state_emit(nv40);
-
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 5, 1,
-					mode, start, count, &restart);
-		if (vc == 0) {
-			FIRE_RING(chan);
-			continue;
-		}
-		count -= vc;
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
+	while ((vc = nv40_primitive_chunk(&prim, &start)))
+	{
+		uint32_t *elts = (uint32_t *)ib + start;
 
 		while (vc) {
-			push = MIN2(vc, 2047);
+			unsigned push = MIN2(vc, 2047);
 
 			BEGIN_RING_NI(chan, curie, NV40TCL_VB_ELEMENT_U32, push);
 			OUT_RINGp    (chan, elts, push);
@@ -362,11 +420,6 @@ nv40_draw_elements_u32(struct nv40_context *nv40, void *ib,
 			vc -= push;
 			elts += push;
 		}
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		start = restart;
 	}
 }
 
@@ -411,35 +464,24 @@ nv40_draw_elements_vbo(struct pipe_context *pipe,
 	struct nv40_screen *screen = nv40->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *curie = screen->curie;
-	unsigned restart;
-
-	while (count) {
-		unsigned nr, vc;
+	struct nv40_primitive prim;
+	unsigned vc;
 
-		nv40_state_emit(nv40);
+	nv40_primitive_init(&prim, nv40, mode, start, count, 256, START_INDEX | start);
 
-		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
-					mode, start, count, &restart);
-		if (!vc) {
-			FIRE_RING(chan);
-			continue;
-		}
-		
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, nvgl_primitive(mode));
-
-		nr = (vc & 0xff);
+	while ((vc = nv40_primitive_chunk(&prim, &start)))
+	{
+		unsigned nr = (vc & 0xff);
 		if (nr) {
 			BEGIN_RING(chan, curie, NV40TCL_VB_INDEX_BATCH, 1);
 			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
-		nr = vc >> 8;
-		while (nr) {
-			unsigned push = nr > 2047 ? 2047 : nr;
-
-			nr -= push;
+		vc >>= 8;
+		while (vc) {
+			unsigned push = vc > 2047 ? 2047 : vc;
+			vc -= push;
 
 			BEGIN_RING_NI(chan, curie, NV40TCL_VB_INDEX_BATCH, push);
 			while (push--) {
@@ -447,12 +489,6 @@ nv40_draw_elements_vbo(struct pipe_context *pipe,
 				start += 0x100;
 			}
 		}
-
-		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (chan, 0);
-
-		count -= vc;
-		start = restart;
 	}
 }
 
-- 
1.6.3.3
