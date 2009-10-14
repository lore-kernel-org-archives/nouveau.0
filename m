From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] nv50/gallium: submit user vbufs through the fifo
Date: Wed, 14 Oct 2009 23:30:42 +0200
Message-ID: <20091014233042.sr47tjhgts88w48k@webmail.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_3hwvn9kudmw4"
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
List-Id: nouveau.vger.kernel.org

This message is in MIME format.

--=_3hwvn9kudmw4
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Mesa sometimes hands us large user buffers where only a few vertices 
are read from
in the drawing calls before they change again.

In such cases, allocating a new buffer from the kernel and copying all 
the data takes much too long, so this patch uses NV50TCL_VERTEX_DATA to 
push vertices on
the FIFO, which speeds up e.g. nexuiz quite a lot.

Additionally it gets rid of the issue that the card uses garbage as 
vertex data, which is probably an issue we should still investigate 
further.
Maybe using memcpy to upload data doesn't invalidate caches on the GPU 
side or doesn't make it wait for the data - uploading stuff with SIFC 
instead of memcpy helps there, but it's still a lot slower than using 
VERTEX_DATA since we'd upload everything.

The blob does it the same way for drawing with 
glVertex/Color/AttribArray(user space pointer) (except it converts 
everything to float).

Maybe someone wants to comment on the implementation here, though.


--=_3hwvn9kudmw4
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="0003-nv50-submit-user-vbo-data-through-the-fifo.patch"
Content-Disposition: inline;
	filename="0003-nv50-submit-user-vbo-data-through-the-fifo.patch"
Content-Transfer-Encoding: 7bit

From 53c844d32f94f62e8c947a744f383eb7b4fb21e7 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 14 Oct 2009 21:23:29 +0200
Subject: [PATCH 3/7] nv50: submit user vbo data through the fifo

Requesting a new real buffer from the kernel and
copying all the data is wasteful e.g. if only a
few (but widely spread) vertices are accessed.
---
 src/gallium/drivers/nv50/nv50_context.h |    3 +
 src/gallium/drivers/nv50/nv50_vbo.c     |  409 +++++++++++++++++++++++++++++--
 2 files changed, 394 insertions(+), 18 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index be53990..8e2d695 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -120,6 +120,7 @@ struct nv50_state {
 	struct nouveau_stateobj *vtxfmt;
 	struct nouveau_stateobj *vtxbuf;
 	struct nouveau_stateobj *vtxattr;
+	unsigned vtxelt_nr;
 };
 
 struct nv50_context {
@@ -152,6 +153,8 @@ struct nv50_context {
 	unsigned sampler_nr;
 	struct nv50_miptree *miptree[PIPE_MAX_SAMPLERS];
 	unsigned miptree_nr;
+
+	uint16_t vbo_fifo;
 };
 
 static INLINE struct nv50_context *
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 8b0fbf0..697a807 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -26,6 +26,18 @@
 
 #include "nv50_context.h"
 
+static boolean
+nv50_push_elements_u08(struct nv50_context *, uint8_t *, unsigned);
+
+static boolean
+nv50_push_elements_u16(struct nv50_context *, uint16_t *, unsigned);
+
+static boolean
+nv50_push_elements_u32(struct nv50_context *, uint32_t *, unsigned);
+
+static boolean
+nv50_push_arrays(struct nv50_context *, unsigned, unsigned);
+
 static INLINE unsigned
 nv50_prim(unsigned mode)
 {
@@ -132,6 +144,7 @@ nv50_draw_arrays(struct pipe_context *pipe, unsigned mode, unsigned start,
 	struct nv50_context *nv50 = nv50_context(pipe);
 	struct nouveau_channel *chan = nv50->screen->tesla->channel;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	boolean ret;
 
 	nv50_state_validate(nv50);
 
@@ -142,17 +155,22 @@ nv50_draw_arrays(struct pipe_context *pipe, unsigned mode, unsigned start,
 
 	BEGIN_RING(chan, tesla, NV50TCL_VERTEX_BEGIN, 1);
 	OUT_RING  (chan, nv50_prim(mode));
-	BEGIN_RING(chan, tesla, NV50TCL_VERTEX_BUFFER_FIRST, 2);
-	OUT_RING  (chan, start);
-	OUT_RING  (chan, count);
+
+	if (nv50->vbo_fifo)
+		ret = nv50_push_arrays(nv50, start, count);
+	else {
+		BEGIN_RING(chan, tesla, NV50TCL_VERTEX_BUFFER_FIRST, 2);
+		OUT_RING  (chan, start);
+		OUT_RING  (chan, count);
+		ret = TRUE;
+	}
 	BEGIN_RING(chan, tesla, NV50TCL_VERTEX_END, 1);
 	OUT_RING  (chan, 0);
 
-	pipe->flush(pipe, 0, NULL);
-	return TRUE;
+	return ret;
 }
 
-static INLINE void
+static INLINE boolean
 nv50_draw_elements_inline_u08(struct nv50_context *nv50, uint8_t *map,
 			      unsigned start, unsigned count)
 {
@@ -161,6 +179,9 @@ nv50_draw_elements_inline_u08(struct nv50_context *nv50, uint8_t *map,
 
 	map += start;
 
+	if (nv50->vbo_fifo)
+		return nv50_push_elements_u08(nv50, map, count);
+
 	if (count & 1) {
 		BEGIN_RING(chan, tesla, 0x15e8, 1);
 		OUT_RING  (chan, map[0]);
@@ -179,9 +200,10 @@ nv50_draw_elements_inline_u08(struct nv50_context *nv50, uint8_t *map,
 		count -= nr;
 		map += nr;
 	}
+	return TRUE;
 }
 
-static INLINE void
+static INLINE boolean
 nv50_draw_elements_inline_u16(struct nv50_context *nv50, uint16_t *map,
 			      unsigned start, unsigned count)
 {
@@ -190,6 +212,9 @@ nv50_draw_elements_inline_u16(struct nv50_context *nv50, uint16_t *map,
 
 	map += start;
 
+	if (nv50->vbo_fifo)
+		return nv50_push_elements_u16(nv50, map, count);
+
 	if (count & 1) {
 		BEGIN_RING(chan, tesla, 0x15e8, 1);
 		OUT_RING  (chan, map[0]);
@@ -208,9 +233,10 @@ nv50_draw_elements_inline_u16(struct nv50_context *nv50, uint16_t *map,
 		count -= nr;
 		map += nr;
 	}
+	return TRUE;
 }
 
-static INLINE void
+static INLINE boolean
 nv50_draw_elements_inline_u32(struct nv50_context *nv50, uint32_t *map,
 			      unsigned start, unsigned count)
 {
@@ -219,6 +245,9 @@ nv50_draw_elements_inline_u32(struct nv50_context *nv50, uint32_t *map,
 
 	map += start;
 
+	if (nv50->vbo_fifo)
+		return nv50_push_elements_u32(nv50, map, count);
+
 	while (count) {
 		unsigned nr = count > 2047 ? 2047 : count;
 
@@ -228,6 +257,7 @@ nv50_draw_elements_inline_u32(struct nv50_context *nv50, uint32_t *map,
 		count -= nr;
 		map += nr;
 	}
+	return TRUE;
 }
 
 boolean
@@ -240,6 +270,7 @@ nv50_draw_elements(struct pipe_context *pipe,
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct pipe_screen *pscreen = pipe->screen;
 	void *map;
+	boolean ret;
 	
 	map = pipe_buffer_map(pscreen, indexBuffer, PIPE_BUFFER_USAGE_CPU_READ);
 
@@ -254,23 +285,25 @@ nv50_draw_elements(struct pipe_context *pipe,
 	OUT_RING  (chan, nv50_prim(mode));
 	switch (indexSize) {
 	case 1:
-		nv50_draw_elements_inline_u08(nv50, map, start, count);
+		ret = nv50_draw_elements_inline_u08(nv50, map, start, count);
 		break;
 	case 2:
-		nv50_draw_elements_inline_u16(nv50, map, start, count);
+		ret = nv50_draw_elements_inline_u16(nv50, map, start, count);
 		break;
 	case 4:
-		nv50_draw_elements_inline_u32(nv50, map, start, count);
+		ret = nv50_draw_elements_inline_u32(nv50, map, start, count);
 		break;
 	default:
 		assert(0);
+		ret = FALSE;
+		break;
 	}
 	BEGIN_RING(chan, tesla, NV50TCL_VERTEX_END, 1);
 	OUT_RING  (chan, 0);
 
 	pipe_buffer_unmap(pscreen, indexBuffer);
-	pipe->flush(pipe, 0, NULL);
-	return TRUE;
+
+	return ret;
 }
 
 static INLINE boolean
@@ -337,17 +370,24 @@ nv50_vbo_validate(struct nv50_context *nv50)
 {
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nouveau_stateobj *vtxbuf, *vtxfmt, *vtxattr;
-	unsigned i;
+	unsigned i, n_ve;
 
 	/* don't validate if Gallium took away our buffers */
 	if (nv50->vtxbuf_nr == 0)
 		return;
+	nv50->vbo_fifo = 0;
+
+	for (i = 0; i < nv50->vtxbuf_nr; ++i)
+		if (nv50->vtxbuf[i].stride &&
+		    !(nv50->vtxbuf[i].buffer->usage & PIPE_BUFFER_USAGE_VERTEX))
+			nv50->vbo_fifo = 0xffff;
+
+	n_ve = MAX2(nv50->vtxelt_nr, nv50->state.vtxelt_nr);
 
 	vtxattr = NULL;
-	vtxbuf = so_new(nv50->vtxelt_nr * 7, nv50->vtxelt_nr * 4);
-	vtxfmt = so_new(nv50->vtxelt_nr + 1, 0);
-	so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(0),
-		nv50->vtxelt_nr);
+	vtxbuf = so_new(n_ve * 7, nv50->vtxelt_nr * 4);
+	vtxfmt = so_new(n_ve + 1, 0);
+	so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(0), n_ve);
 
 	for (i = 0; i < nv50->vtxelt_nr; i++) {
 		struct pipe_vertex_element *ve = &nv50->vtxelt[i];
@@ -363,10 +403,19 @@ nv50_vbo_validate(struct nv50_context *nv50)
 			so_method(vtxbuf, tesla,
 				  NV50TCL_VERTEX_ARRAY_FORMAT(i), 1);
 			so_data  (vtxbuf, 0);
+
+			nv50->vbo_fifo &= ~(1 << i);
 			continue;
 		}
 		so_data(vtxfmt, hw | i);
 
+		if (nv50->vbo_fifo) {
+			so_method(vtxbuf, tesla,
+				  NV50TCL_VERTEX_ARRAY_FORMAT(i), 1);
+			so_data  (vtxbuf, 0);
+			continue;
+		}
+
 		so_method(vtxbuf, tesla, NV50TCL_VERTEX_ARRAY_FORMAT(i), 3);
 		so_data  (vtxbuf, 0x20000000 | vb->stride);
 		so_reloc (vtxbuf, bo, vb->buffer_offset +
@@ -385,6 +434,13 @@ nv50_vbo_validate(struct nv50_context *nv50)
 			  NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD |
 			  NOUVEAU_BO_LOW, 0, 0);
 	}
+	for (; i < n_ve; ++i) {
+		so_data  (vtxfmt, 0x7e080010);
+
+		so_method(vtxbuf, tesla, NV50TCL_VERTEX_ARRAY_FORMAT(i), 1);
+		so_data  (vtxbuf, 0);
+	}
+	nv50->state.vtxelt_nr = nv50->vtxelt_nr;
 
 	so_ref (vtxfmt, &nv50->state.vtxfmt);
 	so_ref (vtxbuf, &nv50->state.vtxbuf);
@@ -394,3 +450,320 @@ nv50_vbo_validate(struct nv50_context *nv50)
 	so_ref (NULL, &vtxattr);
 }
 
+typedef void (*pfn_push)(struct nouveau_channel *, void *);
+
+struct nv50_vbo_emitctx
+{
+	pfn_push push[16];
+	void *map[16];
+	unsigned stride[16];
+	unsigned nr_ve;
+	unsigned vtx_dwords;
+	unsigned vtx_max;
+};
+
+static INLINE void
+emit_vtx_next(struct nouveau_channel *chan, struct nv50_vbo_emitctx *emit)
+{
+	unsigned i;
+
+	for (i = 0; i < emit->nr_ve; ++i) {
+		emit->push[i](chan, emit->map[i]);
+		emit->map[i] += emit->stride[i];
+	}
+}
+
+static INLINE void
+emit_vtx(struct nouveau_channel *chan, struct nv50_vbo_emitctx *emit,
+	 uint32_t vi)
+{
+	unsigned i;
+
+	for (i = 0; i < emit->nr_ve; ++i)
+		emit->push[i](chan, emit->map[i] + emit->stride[i] * vi);
+}
+
+static INLINE boolean
+nv50_map_vbufs(struct nv50_context *nv50)
+{
+	int i;
+
+	for (i = 0; i < nv50->vtxbuf_nr; ++i) {
+		struct pipe_vertex_buffer *vb = &nv50->vtxbuf[i];
+		unsigned size, delta;
+
+		if (nouveau_bo(vb->buffer)->map)
+			continue;
+
+		size = vb->stride * (vb->max_index + 1);
+		delta = vb->buffer_offset;
+
+		if (!size)
+			size = vb->buffer->size - vb->buffer_offset;
+
+		if (nouveau_bo_map_range(nouveau_bo(vb->buffer),
+					 delta, size, NOUVEAU_BO_RD))
+			break;
+	}
+
+	if (i == nv50->vtxbuf_nr)
+		return TRUE;
+	for (; i >= 0; --i)
+		nouveau_bo_unmap(nouveau_bo(nv50->vtxbuf[i].buffer));
+	return FALSE;
+}
+
+static INLINE void
+nv50_unmap_vbufs(struct nv50_context *nv50)
+{
+        unsigned i;
+
+        for (i = 0; i < nv50->vtxbuf_nr; ++i)
+                if (nouveau_bo(nv50->vtxbuf[i].buffer)->map)
+                        nouveau_bo_unmap(nouveau_bo(nv50->vtxbuf[i].buffer));
+}
+
+static void
+emit_b32_1(struct nouveau_channel *chan, void *data)
+{
+	uint32_t *v = data;
+
+	OUT_RING(chan, v[0]);
+}
+
+static void
+emit_b32_2(struct nouveau_channel *chan, void *data)
+{
+	uint32_t *v = data;
+
+	OUT_RING(chan, v[0]);
+	OUT_RING(chan, v[1]);
+}
+
+static void
+emit_b32_3(struct nouveau_channel *chan, void *data)
+{
+	uint32_t *v = data;
+
+	OUT_RING(chan, v[0]);
+	OUT_RING(chan, v[1]);
+	OUT_RING(chan, v[2]);
+}
+
+static void
+emit_b32_4(struct nouveau_channel *chan, void *data)
+{
+	uint32_t *v = data;
+
+	OUT_RING(chan, v[0]);
+	OUT_RING(chan, v[1]);
+	OUT_RING(chan, v[2]);
+	OUT_RING(chan, v[3]);
+}
+
+static void
+emit_b16_1(struct nouveau_channel *chan, void *data)
+{
+	uint16_t *v = data;
+
+	OUT_RING(chan, v[0]);
+}
+
+static void
+emit_b16_3(struct nouveau_channel *chan, void *data)
+{
+	uint16_t *v = data;
+
+	OUT_RING(chan, (v[1] << 16) | v[0]);
+	OUT_RING(chan, v[2]);
+}
+
+static void
+emit_b08_1(struct nouveau_channel *chan, void *data)
+{
+	uint8_t *v = data;
+
+	OUT_RING(chan, v[0]);
+}
+
+static void
+emit_b08_3(struct nouveau_channel *chan, void *data)
+{
+	uint8_t *v = data;
+
+	OUT_RING(chan, (v[2] << 16) | (v[1] << 8) | v[0]);
+}
+
+static boolean
+emit_prepare(struct nv50_context *nv50, struct nv50_vbo_emitctx *emit,
+	     unsigned start)
+{
+	unsigned i;
+
+	if (nv50_map_vbufs(nv50) == FALSE)
+		return FALSE;
+
+	emit->nr_ve = 0;
+	emit->vtx_dwords = 0;
+
+	for (i = 0; i < nv50->vtxelt_nr; ++i) {
+		struct pipe_vertex_element *ve;
+		struct pipe_vertex_buffer *vb;
+		unsigned n, type, size;
+
+		ve = &nv50->vtxelt[i];
+		vb = &nv50->vtxbuf[ve->vertex_buffer_index];
+		if (!(nv50->vbo_fifo & (1 << i)))
+			continue;
+		n = emit->nr_ve++;
+
+		emit->stride[n] = vb->stride;
+		emit->map[n] = nouveau_bo(vb->buffer)->map +
+			(start * vb->stride + ve->src_offset);
+
+		type = pf_type(ve->src_format);
+		size = pf_size_x(ve->src_format) << pf_exp2(ve->src_format);
+
+		assert(ve->nr_components > 0 && ve->nr_components <= 4);
+
+		/* It shouldn't be necessary to push the implicit 1s
+		 * for case 3 and size 8 cases 1, 2, 3.
+		 */
+		switch (size) {
+		default:
+			NOUVEAU_ERR("unsupported vtxelt size: %u\n", size);
+			return FALSE;
+		case 32:
+			switch (ve->nr_components) {
+			case 1: emit->push[n] = emit_b32_1; break;
+			case 2: emit->push[n] = emit_b32_2; break;
+			case 3: emit->push[n] = emit_b32_3; break;
+			case 4: emit->push[n] = emit_b32_4; break;
+			}
+			emit->vtx_dwords += ve->nr_components;
+			break;
+		case 16:
+			switch (ve->nr_components) {
+			case 1: emit->push[n] = emit_b16_1; break;
+			case 2: emit->push[n] = emit_b32_1; break;
+			case 3: emit->push[n] = emit_b16_3; break;
+			case 4: emit->push[n] = emit_b32_2; break;
+			}
+			emit->vtx_dwords += (ve->nr_components + 1) >> 1;
+			break;
+		case 8:
+			switch (type) {
+			case 1: emit->push[n] = emit_b08_1; break;
+			case 2: emit->push[n] = emit_b16_1; break;
+			case 3: emit->push[n] = emit_b08_3; break;
+			case 4: emit->push[n] = emit_b32_1; break;
+			}
+			emit->vtx_dwords += 1;
+			break;
+		}
+	}
+
+	emit->vtx_max = 512 / emit->vtx_dwords;
+
+	return TRUE;
+}
+
+static boolean
+nv50_push_arrays(struct nv50_context *nv50, unsigned start, unsigned count)
+{
+	struct nouveau_channel *chan = nv50->screen->base.channel;
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_vbo_emitctx emit;
+
+	if (emit_prepare(nv50, &emit, start) == FALSE)
+		return FALSE;
+
+	while (count) {
+		unsigned i, dw, nr = MIN2(count, emit.vtx_max);
+	        dw = nr * emit.vtx_dwords;
+
+		BEGIN_RING(chan, tesla, NV50TCL_VERTEX_DATA | 0x40000000, dw);
+		for (i = 0; i < nr; ++i)
+			emit_vtx_next(chan, &emit);
+
+		count -= nr;
+	}
+	nv50_unmap_vbufs(nv50);
+
+	return TRUE;
+}
+
+static boolean
+nv50_push_elements_u32(struct nv50_context *nv50, uint32_t *map, unsigned count)
+{
+	struct nouveau_channel *chan = nv50->screen->base.channel;
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_vbo_emitctx emit;
+
+	if (emit_prepare(nv50, &emit, 0) == FALSE)
+		return FALSE;
+
+	while (count) {
+		unsigned i, dw, nr = MIN2(count, emit.vtx_max);
+	        dw = nr * emit.vtx_dwords;
+
+		BEGIN_RING(chan, tesla, NV50TCL_VERTEX_DATA | 0x40000000, dw);
+		for (i = 0; i < nr; ++i)
+			emit_vtx(chan, &emit, *map++);
+
+		count -= nr;
+	}
+	nv50_unmap_vbufs(nv50);
+
+	return TRUE;
+}
+
+static boolean
+nv50_push_elements_u16(struct nv50_context *nv50, uint16_t *map, unsigned count)
+{
+	struct nouveau_channel *chan = nv50->screen->base.channel;
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_vbo_emitctx emit;
+
+	if (emit_prepare(nv50, &emit, 0) == FALSE)
+		return FALSE;
+
+	while (count) {
+		unsigned i, dw, nr = MIN2(count, emit.vtx_max);
+	        dw = nr * emit.vtx_dwords;
+
+		BEGIN_RING(chan, tesla, NV50TCL_VERTEX_DATA | 0x40000000, dw);
+		for (i = 0; i < nr; ++i)
+			emit_vtx(chan, &emit, *map++);
+
+		count -= nr;
+	}
+	nv50_unmap_vbufs(nv50);
+
+	return TRUE;
+}
+
+static boolean
+nv50_push_elements_u08(struct nv50_context *nv50, uint8_t *map, unsigned count)
+{
+	struct nouveau_channel *chan = nv50->screen->base.channel;
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_vbo_emitctx emit;
+
+	if (emit_prepare(nv50, &emit, 0) == FALSE)
+		return FALSE;
+
+	while (count) {
+		unsigned i, dw, nr = MIN2(count, emit.vtx_max);
+	        dw = nr * emit.vtx_dwords;
+
+		BEGIN_RING(chan, tesla, NV50TCL_VERTEX_DATA | 0x40000000, dw);
+		for (i = 0; i < nr; ++i)
+			emit_vtx(chan, &emit, *map++);
+
+		count -= nr;
+	}
+	nv50_unmap_vbufs(nv50);
+
+	return TRUE;
+}
-- 
1.6.3.3


--=_3hwvn9kudmw4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=_3hwvn9kudmw4--
