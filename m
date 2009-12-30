From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] nouveau: rewrite nouveau_stateobj to use
	BEGIN_RING properly
Date: Wed, 30 Dec 2009 22:36:42 +0100
Message-ID: <1262209002-10778-3-git-send-email-madman2003@gmail.com>
References: <1262209002-10778-1-git-send-email-madman2003@gmail.com>
	<1262209002-10778-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262209002-10778-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- The previous solution was hacky and didn't do subchannel autobinding.
- The beheaviour should match what libdrm_nouveau does closely.
- There appears to be a minor performance loss, probably due to having multiple
memcpy's instead of one.
- The solution remains statically sized, but when debugging is on it will check
for abuse.
- The values for nv30/nv40 may be off, but this should be easily caught with
DEBUG on.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |  289 +++++++++++++++++-------
 src/gallium/drivers/nv04/nv04_screen.c         |    2 -
 src/gallium/drivers/nv10/nv10_screen.c         |    1 -
 src/gallium/drivers/nv20/nv20_screen.c         |    1 -
 src/gallium/drivers/nv30/nv30_fragprog.c       |    2 +-
 src/gallium/drivers/nv30/nv30_fragtex.c        |    4 +-
 src/gallium/drivers/nv30/nv30_screen.c         |    3 +-
 src/gallium/drivers/nv30/nv30_state.c          |    6 +-
 src/gallium/drivers/nv30/nv30_state_blend.c    |    2 +-
 src/gallium/drivers/nv30/nv30_state_fb.c       |    2 +-
 src/gallium/drivers/nv30/nv30_state_scissor.c  |    2 +-
 src/gallium/drivers/nv30/nv30_state_stipple.c  |    4 +-
 src/gallium/drivers/nv30/nv30_state_viewport.c |    2 +-
 src/gallium/drivers/nv30/nv30_vbo.c            |    6 +-
 src/gallium/drivers/nv30/nv30_vertprog.c       |    2 +-
 src/gallium/drivers/nv40/nv40_fragprog.c       |    2 +-
 src/gallium/drivers/nv40/nv40_fragtex.c        |    4 +-
 src/gallium/drivers/nv40/nv40_screen.c         |    3 +-
 src/gallium/drivers/nv40/nv40_state.c          |    6 +-
 src/gallium/drivers/nv40/nv40_state_blend.c    |    2 +-
 src/gallium/drivers/nv40/nv40_state_fb.c       |    2 +-
 src/gallium/drivers/nv40/nv40_state_scissor.c  |    2 +-
 src/gallium/drivers/nv40/nv40_state_stipple.c  |    4 +-
 src/gallium/drivers/nv40/nv40_state_viewport.c |    2 +-
 src/gallium/drivers/nv40/nv40_vbo.c            |    6 +-
 src/gallium/drivers/nv40/nv40_vertprog.c       |    2 +-
 src/gallium/drivers/nv50/nv50_program.c        |    6 +-
 src/gallium/drivers/nv50/nv50_screen.c         |    9 +-
 src/gallium/drivers/nv50/nv50_state.c          |    6 +-
 src/gallium/drivers/nv50/nv50_state_validate.c |   13 +-
 src/gallium/drivers/nv50/nv50_tex.c            |   10 +-
 src/gallium/drivers/nv50/nv50_vbo.c            |    6 +-
 32 files changed, 266 insertions(+), 147 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index b8c83db..d33c55d 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -3,41 +3,96 @@
 
 #include "util/u_debug.h"
 
+#ifdef DEBUG
+#define DEBUG_NOUVEAU_STATEOBJ
+#endif /* DEBUG */
+
 struct nouveau_stateobj_reloc {
 	struct nouveau_bo *bo;
 
-	unsigned offset;
-	unsigned packet;
+	struct nouveau_grobj *gr;
+	uint32_t push_offset;
+	uint32_t mthd;
 
-	unsigned data;
+	uint32_t data;
 	unsigned flags;
 	unsigned vor;
 	unsigned tor;
 };
 
+struct nouveau_stateobj_start {
+	struct nouveau_grobj *gr;
+	uint32_t mthd;
+	uint32_t size;
+	unsigned offset;
+};
+
 struct nouveau_stateobj {
 	struct pipe_reference reference;
 
-	unsigned *push;
+	struct nouveau_stateobj_start *start;
 	struct nouveau_stateobj_reloc *reloc;
 
-	unsigned *cur;
-	unsigned cur_packet;
+	/* Common memory pool for data. */
+	uint32_t *pool;
+	unsigned pool_cur;
+
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	unsigned start_alloc;
+	unsigned reloc_alloc;
+	unsigned pool_alloc;
+#endif  /* DEBUG_NOUVEAU_STATEOBJ */
+
+	unsigned total; /* includes begin_ring */
+	unsigned cur; /* excludes begin_ring, offset from "cur_start" */
+	unsigned cur_start;
 	unsigned cur_reloc;
 };
 
+static INLINE void
+so_dump(struct nouveau_stateobj *so)
+{
+	unsigned i, nr, total = 0;
+
+	for (i = 0; i < so->cur_start; i++) {
+		if (so->start[i].gr->subc > -1)
+			debug_printf("+0x%04x: 0x%08x\n", total++,
+				(so->start[i].size << 18) | (so->start[i].gr->subc << 13)
+				| so->start[i].mthd);
+		else
+			debug_printf("+0x%04x: 0x%08x\n", total++,
+				(so->start[i].size << 18) | so->start[i].mthd);
+		for (nr = 0; nr < so->start[i].size; nr++, total++)
+			debug_printf("+0x%04x: 0x%08x\n", total,
+				so->pool[so->start[i].offset + nr]);
+	}
+}
+
+/* Arguments are ignored, dynamic allocation. */
 static INLINE struct nouveau_stateobj *
-so_new(unsigned push, unsigned reloc)
+so_new(unsigned start, unsigned push, unsigned reloc)
 {
 	struct nouveau_stateobj *so;
 
 	so = MALLOC(sizeof(struct nouveau_stateobj));
 	pipe_reference_init(&so->reference, 1);
-	so->push = MALLOC(sizeof(unsigned) * push);
-	so->reloc = MALLOC(sizeof(struct nouveau_stateobj_reloc) * reloc);
-
-	so->cur = so->push;
-	so->cur_reloc = so->cur_packet = 0;
+	so->total = so->cur = so->cur_start = so->cur_reloc = 0;
+
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	so->start_alloc = start;
+	so->reloc_alloc = reloc;
+	so->pool_alloc = push;
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
+	so->start = MALLOC(start * sizeof(struct nouveau_stateobj_start));
+	so->reloc = MALLOC(reloc * sizeof(struct nouveau_stateobj_reloc));
+	so->pool = MALLOC(push * sizeof(uint32_t));
+	so->pool_cur = 0;
+
+	if (!so->start || !so->reloc || !so->pool) {
+		debug_printf("malloc failed\n");
+		assert(0);
+	}
 
 	return so;
 }
@@ -48,54 +103,115 @@ so_ref(struct nouveau_stateobj *ref, struct nouveau_stateobj **pso)
 	struct nouveau_stateobj *so = *pso;
 	int i;
 
-        if (pipe_reference(&(*pso)->reference, &ref->reference)) {
-		free(so->push);
+	if (pipe_reference(&(*pso)->reference, &ref->reference)) {
+		FREE(so->start);
 		for (i = 0; i < so->cur_reloc; i++)
 			nouveau_bo_ref(NULL, &so->reloc[i].bo);
-		free(so->reloc);
-		free(so);
+		FREE(so->reloc);
+		FREE(so->pool);
+		FREE(so);
 	}
 	*pso = ref;
 }
 
 static INLINE void
-so_data(struct nouveau_stateobj *so, unsigned data)
+so_data(struct nouveau_stateobj *so, uint32_t data)
 {
-	(*so->cur++) = (data);
-	so->cur_packet += 4;
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if (so->cur >= so->start[so->cur_start - 1].size) {
+		debug_printf("exceeding specified size\n");
+		assert(0);
+	}
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
+	so->pool[so->start[so->cur_start - 1].offset + so->cur++] = data;
 }
 
 static INLINE void
-so_datap(struct nouveau_stateobj *so, unsigned *data, unsigned size)
+so_datap(struct nouveau_stateobj *so, uint32_t *data, unsigned size)
 {
-	so->cur_packet += (4 * size);
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if ((so->cur + size) > so->start[so->cur_start - 1].size) {
+		debug_printf("exceeding specified size\n");
+		assert(0);
+	}
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
 	while (size--)
-		(*so->cur++) = (*data++);
+		so->pool[so->start[so->cur_start - 1].offset + so->cur++] =
+			*data++;
 }
 
 static INLINE void
 so_method(struct nouveau_stateobj *so, struct nouveau_grobj *gr,
 	  unsigned mthd, unsigned size)
 {
-	so->cur_packet = (gr->subc << 13) | (1 << 18) | (mthd - 4);
-	so_data(so, (gr->subc << 13) | (size << 18) | mthd);
+	struct nouveau_stateobj_start *start;
+
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if (so->start_alloc <= so->cur_start) {
+		debug_printf("exceeding num_start size\n");
+		assert(0);
+	} else
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+		start = so->start;
+
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if (so->cur_start > 0 && start[so->cur_start - 1].size > so->cur) {
+		debug_printf("previous so_method was not filled\n");
+		assert(0);
+	}
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
+	so->start = start;
+	start[so->cur_start].gr = gr;
+	start[so->cur_start].mthd = mthd;
+	start[so->cur_start].size = size;
+
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if (so->pool_alloc < (size + so->pool_cur)) {
+		debug_printf("exceeding num_pool size\n");
+		assert(0);
+	}
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
+	start[so->cur_start].offset = so->pool_cur;
+	so->pool_cur += size;
+
+	so->cur_start++;
+	/* The 1 is for *this* begin_ring. */
+	so->total += so->cur + 1;
+	so->cur = 0;
 }
 
 static INLINE void
 so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
 	 unsigned data, unsigned flags, unsigned vor, unsigned tor)
 {
-	struct nouveau_stateobj_reloc *r = &so->reloc[so->cur_reloc++];
-	
-	r->bo = NULL;
-	nouveau_bo_ref(bo, &r->bo);
-	r->offset = so->cur - so->push;
-	r->packet = so->cur_packet;
-	r->data = data;
-	r->flags = flags;
-	r->vor = vor;
-	r->tor = tor;
+	struct nouveau_stateobj_reloc *r;
+
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if (so->reloc_alloc <= so->cur_reloc) {
+		debug_printf("exceeding num_reloc size\n");
+		assert(0);
+	} else
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+		r = so->reloc;
+
+	so->reloc = r;
+	r[so->cur_reloc].bo = NULL;
+	nouveau_bo_ref(bo, &(r[so->cur_reloc].bo));
+	r[so->cur_reloc].gr = so->start[so->cur_start-1].gr;
+	r[so->cur_reloc].push_offset = so->total + so->cur;
+	r[so->cur_reloc].data = data;
+	r[so->cur_reloc].flags = flags;
+	r[so->cur_reloc].mthd = so->start[so->cur_start-1].mthd +
+							(so->cur << 2);
+	r[so->cur_reloc].vor = vor;
+	r[so->cur_reloc].tor = tor;
+
 	so_data(so, data);
+	so->cur_reloc++;
 }
 
 /* Determine if this buffer object is referenced by this state object. */
@@ -112,90 +228,99 @@ so_bo_is_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo)
 }
 
 static INLINE void
-so_dump(struct nouveau_stateobj *so)
-{
-	unsigned i, nr = so->cur - so->push;
-
-	for (i = 0; i < nr; i++)
-		debug_printf("+0x%04x: 0x%08x\n", i, so->push[i]);
-}
-
-static INLINE void
 so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
 	unsigned nr, i;
 	int ret = 0;
 
-	nr = so->cur - so->push;
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+	if (so->start[so->cur_start - 1].size > so->cur) {
+		debug_printf("emit: previous so_method was not filled\n");
+		assert(0);
+	}
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
+	/* We cannot update total in case we so_emit again. */
+	nr = so->total + so->cur;
+
 	/* This will flush if we need space.
 	 * We don't actually need the marker.
 	 */
 	if ((ret = nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc))) {
 		debug_printf("so_emit failed marker emit with error %d\n", ret);
-		return;
+		assert(0);
+	}
+
+	/* Submit data. This will ensure proper binding of objects. */
+	for (i = 0; i < so->cur_start; i++) {
+		BEGIN_RING(chan, so->start[i].gr, so->start[i].mthd, so->start[i].size);
+		OUT_RINGp(chan, &(so->pool[so->start[i].offset]), so->start[i].size);
 	}
-	pb->remaining -= nr;
 
-	memcpy(pb->cur, so->push, nr * 4);
 	for (i = 0; i < so->cur_reloc; i++) {
 		struct nouveau_stateobj_reloc *r = &so->reloc[i];
 
-		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur + r->offset,
-					   r->bo, r->data, 0, r->flags,
-					   r->vor, r->tor))) {
+		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur - nr +
+						r->push_offset, r->bo, r->data,
+						0, r->flags, r->vor, r->tor))) {
 			debug_printf("so_emit failed reloc with error %d\n", ret);
-			goto out;
+			assert(0);
 		}
 	}
-out:
-	pb->cur += nr;
 }
 
 static INLINE void
 so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
+	struct nouveau_grobj *gr = NULL;
 	unsigned i;
 	int ret = 0;
 
 	if (!so)
 		return;
 
-	i = so->cur_reloc << 1;
-	/* This will flush if we need space.
-	 * We don't actually need the marker.
-	 */
-	if ((ret = nouveau_pushbuf_marker_emit(chan, i, i))) {
-		debug_printf("so_emit_reloc_markers failed marker emit with" \
-			"error %d\n", ret);
-		return;
-	}
-	pb->remaining -= i;
-
+	/* If we need to flush in flush notify, then we have a problem anyway. */
 	for (i = 0; i < so->cur_reloc; i++) {
 		struct nouveau_stateobj_reloc *r = &so->reloc[i];
 
-		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo,
-					   r->packet, 0,
-					   (r->flags & (NOUVEAU_BO_VRAM |
-							NOUVEAU_BO_GART |
-							NOUVEAU_BO_RDWR)) |
-					   NOUVEAU_BO_DUMMY, 0, 0))) {
-			debug_printf("so_emit_reloc_markers failed reloc" \
-						"with error %d\n", ret);
-			pb->remaining += ((so->cur_reloc - i) << 1);
-			return;
+#ifdef DEBUG_NOUVEAU_STATEOBJ
+		if (r->mthd & 0x40000000) {
+			debug_printf("error: NI mthd 0x%08X\n", r->mthd);
+			continue;
+		}
+#endif /* DEBUG_NOUVEAU_STATEOBJ */
+
+		/* The object needs to be bound and the system must know the
+		 * subchannel is being used. Otherwise it will discard it.
+		 */
+		if (gr != r->gr) {
+			BEGIN_RING(chan, r->gr, 0x100, 1);
+			OUT_RING(chan, 0);
+			gr = r->gr;
+		}
+
+		/* Some relocs really don't like to be hammered,
+		 * NOUVEAU_BO_DUMMY makes sure it only
+		 * happens when needed.
+		 */
+		ret = OUT_RELOC(chan, r->bo, (r->gr->subc << 13) | (1<< 18) |
+			r->mthd, (r->flags & (NOUVEAU_BO_VRAM | NOUVEAU_BO_GART
+				| NOUVEAU_BO_RDWR)) | NOUVEAU_BO_DUMMY, 0, 0);
+		if (ret) {
+			debug_printf("OUT_RELOC failed %d\n", ret);
+			assert(0);
 		}
-		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo,
-					   r->data, 0,
-					   r->flags | NOUVEAU_BO_DUMMY,
-					   r->vor, r->tor))) {
-			debug_printf("so_emit_reloc_markers failed reloc" \
-						"with error %d\n", ret);
-			pb->remaining += ((so->cur_reloc - i) << 1) - 1;
-			return;
+
+		ret = OUT_RELOC(chan, r->bo, r->data, r->flags |
+			NOUVEAU_BO_DUMMY, r->vor, r->tor);
+		if (ret) {
+			debug_printf("OUT_RELOC failed %d\n", ret);
+			assert(0);
 		}
+
+		pb->remaining -= 2;
 	}
 }
 
diff --git a/src/gallium/drivers/nv04/nv04_screen.c b/src/gallium/drivers/nv04/nv04_screen.c
index 7c5b6e8..da3b562 100644
--- a/src/gallium/drivers/nv04/nv04_screen.c
+++ b/src/gallium/drivers/nv04/nv04_screen.c
@@ -184,7 +184,6 @@ nv04_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		NOUVEAU_ERR("Error creating 3D object: %d\n", ret);
 		return NULL;
 	}
-	BIND_RING(chan, screen->fahrenheit, 7);
 
 	/* 3D surface object */
 	ret = nouveau_grobj_alloc(chan, 0xbeef0002, sub3d_class,
@@ -193,7 +192,6 @@ nv04_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		NOUVEAU_ERR("Error creating 3D surface object: %d\n", ret);
 		return NULL;
 	}
-	BIND_RING(chan, screen->context_surfaces_3d, 6);
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
diff --git a/src/gallium/drivers/nv10/nv10_screen.c b/src/gallium/drivers/nv10/nv10_screen.c
index 6a39dde..69a6dab 100644
--- a/src/gallium/drivers/nv10/nv10_screen.c
+++ b/src/gallium/drivers/nv10/nv10_screen.c
@@ -180,7 +180,6 @@ nv10_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		NOUVEAU_ERR("Error creating 3D object: %d\n", ret);
 		return FALSE;
 	}
-	BIND_RING(chan, screen->celsius, 7);
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
diff --git a/src/gallium/drivers/nv20/nv20_screen.c b/src/gallium/drivers/nv20/nv20_screen.c
index a0973f1..d091335 100644
--- a/src/gallium/drivers/nv20/nv20_screen.c
+++ b/src/gallium/drivers/nv20/nv20_screen.c
@@ -176,7 +176,6 @@ nv20_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		NOUVEAU_ERR("Error creating 3D object: %d\n", ret);
 		return FALSE;
 	}
-	BIND_RING(chan, screen->kelvin, 7);
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
diff --git a/src/gallium/drivers/nv30/nv30_fragprog.c b/src/gallium/drivers/nv30/nv30_fragprog.c
index d1ff18e..2d565cb 100644
--- a/src/gallium/drivers/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nv30/nv30_fragprog.c
@@ -837,7 +837,7 @@ nv30_fragprog_validate(struct nv30_context *nv30)
 	fp->buffer = pscreen->buffer_create(pscreen, 0x100, 0, fp->insn_len * 4);
 	nv30_fragprog_upload(nv30, fp);
 
-	so = so_new(8, 1);
+	so = so_new(4, 4, 1);
 	so_method(so, nv30->screen->rankine, NV34TCL_FP_ACTIVE_PROGRAM, 1);
 	so_reloc (so, nouveau_bo(fp->buffer), 0, NOUVEAU_BO_VRAM |
 		      NOUVEAU_BO_GART | NOUVEAU_BO_RD | NOUVEAU_BO_LOW |
diff --git a/src/gallium/drivers/nv30/nv30_fragtex.c b/src/gallium/drivers/nv30/nv30_fragtex.c
index b3293ee..9893567 100644
--- a/src/gallium/drivers/nv30/nv30_fragtex.c
+++ b/src/gallium/drivers/nv30/nv30_fragtex.c
@@ -106,7 +106,7 @@ nv30_fragtex_build(struct nv30_context *nv30, int unit)
 
 	txs = tf->swizzle;
 
-	so = so_new(16, 2);
+	so = so_new(1, 8, 2);
 	so_method(so, nv30->screen->rankine, NV34TCL_TX_OFFSET(unit), 8);
 	so_reloc (so, bo, 0, tex_flags | NOUVEAU_BO_LOW, 0, 0);
 	so_reloc (so, bo, txf, tex_flags | NOUVEAU_BO_OR,
@@ -135,7 +135,7 @@ nv30_fragtex_validate(struct nv30_context *nv30)
 		unit = ffs(samplers) - 1;
 		samplers &= ~(1 << unit);
 
-		so = so_new(2, 0);
+		so = so_new(1, 1, 0);
 		so_method(so, nv30->screen->rankine, NV34TCL_TX_ENABLE(unit), 1);
 		so_data  (so, 0);
 		so_ref(so, &nv30->state.hw[NV30_STATE_FRAGTEX0 + unit]);
diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 760467f..9ed4817 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -233,7 +233,6 @@ nv30_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		NOUVEAU_ERR("Error creating 3D object: %d\n", ret);
 		return FALSE;
 	}
-	BIND_RING(chan, screen->rankine, 7);
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
@@ -270,7 +269,7 @@ nv30_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	}
 
 	/* Static rankine initialisation */
-	so = so_new(128, 0);
+	so = so_new(36, 60, 0);
 	so_method(so, screen->rankine, NV34TCL_DMA_NOTIFY, 1);
 	so_data  (so, screen->sync->handle);
 	so_method(so, screen->rankine, NV34TCL_DMA_TEXTURE0, 2);
diff --git a/src/gallium/drivers/nv30/nv30_state.c b/src/gallium/drivers/nv30/nv30_state.c
index e6321b4..a80dfb0 100644
--- a/src/gallium/drivers/nv30/nv30_state.c
+++ b/src/gallium/drivers/nv30/nv30_state.c
@@ -14,7 +14,7 @@ nv30_blend_state_create(struct pipe_context *pipe,
 	struct nv30_context *nv30 = nv30_context(pipe);
 	struct nouveau_grobj *rankine = nv30->screen->rankine;
 	struct nv30_blend_state *bso = CALLOC(1, sizeof(*bso));
-	struct nouveau_stateobj *so = so_new(16, 0);
+	struct nouveau_stateobj *so = so_new(5, 8, 0);
 
 	if (cso->blend_enable) {
 		so_method(so, rankine, NV34TCL_BLEND_FUNC_ENABLE, 3);
@@ -300,7 +300,7 @@ nv30_rasterizer_state_create(struct pipe_context *pipe,
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
 	struct nv30_rasterizer_state *rsso = CALLOC(1, sizeof(*rsso));
-	struct nouveau_stateobj *so = so_new(32, 0);
+	struct nouveau_stateobj *so = so_new(9, 19, 0);
 	struct nouveau_grobj *rankine = nv30->screen->rankine;
 
 	/*XXX: ignored:
@@ -435,7 +435,7 @@ nv30_depth_stencil_alpha_state_create(struct pipe_context *pipe,
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
 	struct nv30_zsa_state *zsaso = CALLOC(1, sizeof(*zsaso));
-	struct nouveau_stateobj *so = so_new(32, 0);
+	struct nouveau_stateobj *so = so_new(5, 21, 0);
 	struct nouveau_grobj *rankine = nv30->screen->rankine;
 
 	so_method(so, rankine, NV34TCL_DEPTH_FUNC, 3);
diff --git a/src/gallium/drivers/nv30/nv30_state_blend.c b/src/gallium/drivers/nv30/nv30_state_blend.c
index 64cf9ae..c36d58c 100644
--- a/src/gallium/drivers/nv30/nv30_state_blend.c
+++ b/src/gallium/drivers/nv30/nv30_state_blend.c
@@ -18,7 +18,7 @@ struct nv30_state_entry nv30_state_blend = {
 static boolean
 nv30_state_blend_colour_validate(struct nv30_context *nv30)
 {
-	struct nouveau_stateobj *so = so_new(2, 0);
+	struct nouveau_stateobj *so = so_new(1, 1, 0);
 	struct pipe_blend_color *bcol = &nv30->blend_colour;
 
 	so_method(so, nv30->screen->rankine, NV34TCL_BLEND_COLOR, 1);
diff --git a/src/gallium/drivers/nv30/nv30_state_fb.c b/src/gallium/drivers/nv30/nv30_state_fb.c
index 6f6d174..2ed2ea5 100644
--- a/src/gallium/drivers/nv30/nv30_state_fb.c
+++ b/src/gallium/drivers/nv30/nv30_state_fb.c
@@ -10,7 +10,7 @@ nv30_state_framebuffer_validate(struct nv30_context *nv30)
 	struct nv04_surface *rt[2], *zeta = NULL;
 	uint32_t rt_enable = 0, rt_format = 0;
 	int i, colour_format = 0, zeta_format = 0, depth_only = 0;
-	struct nouveau_stateobj *so = so_new(64, 10);
+	struct nouveau_stateobj *so = so_new(12, 18, 10);
 	unsigned rt_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
 	unsigned w = fb->width;
 	unsigned h = fb->height;
diff --git a/src/gallium/drivers/nv30/nv30_state_scissor.c b/src/gallium/drivers/nv30/nv30_state_scissor.c
index 3ac7a84..ba61a9e 100644
--- a/src/gallium/drivers/nv30/nv30_state_scissor.c
+++ b/src/gallium/drivers/nv30/nv30_state_scissor.c
@@ -12,7 +12,7 @@ nv30_state_scissor_validate(struct nv30_context *nv30)
 		return FALSE;
 	nv30->state.scissor_enabled = rast->scissor;
 
-	so = so_new(3, 0);
+	so = so_new(1, 2, 0);
 	so_method(so, nv30->screen->rankine, NV34TCL_SCISSOR_HORIZ, 2);
 	if (nv30->state.scissor_enabled) {
 		so_data  (so, ((s->maxx - s->minx) << 16) | s->minx);
diff --git a/src/gallium/drivers/nv30/nv30_state_stipple.c b/src/gallium/drivers/nv30/nv30_state_stipple.c
index d0c791a..ed520a4 100644
--- a/src/gallium/drivers/nv30/nv30_state_stipple.c
+++ b/src/gallium/drivers/nv30/nv30_state_stipple.c
@@ -14,14 +14,14 @@ nv30_state_stipple_validate(struct nv30_context *nv30)
 	if (rast->poly_stipple_enable) {
 		unsigned i;
 
-		so = so_new(35, 0);
+		so = so_new(2, 33, 0);
 		so_method(so, rankine, NV34TCL_POLYGON_STIPPLE_ENABLE, 1);
 		so_data  (so, 1);
 		so_method(so, rankine, NV34TCL_POLYGON_STIPPLE_PATTERN(0), 32);
 		for (i = 0; i < 32; i++)
 			so_data(so, nv30->stipple[i]);
 	} else {
-		so = so_new(2, 0);
+		so = so_new(1, 1, 0);
 		so_method(so, rankine, NV34TCL_POLYGON_STIPPLE_ENABLE, 1);
 		so_data  (so, 0);
 	}
diff --git a/src/gallium/drivers/nv30/nv30_state_viewport.c b/src/gallium/drivers/nv30/nv30_state_viewport.c
index c3eb413..2d77812 100644
--- a/src/gallium/drivers/nv30/nv30_state_viewport.c
+++ b/src/gallium/drivers/nv30/nv30_state_viewport.c
@@ -19,7 +19,7 @@ nv30_state_viewport_validate(struct nv30_context *nv30)
 		return FALSE;
 	nv30->state.viewport_bypass = bypass;
 
-	so = so_new(11, 0);
+	so = so_new(3, 10, 0);
 	if (!bypass) {
 		so_method(so, nv30->screen->rankine,
 			  NV34TCL_VIEWPORT_TRANSLATE_X, 8);
diff --git a/src/gallium/drivers/nv30/nv30_vbo.c b/src/gallium/drivers/nv30/nv30_vbo.c
index 242a2b0..80c7eb1 100644
--- a/src/gallium/drivers/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nv30/nv30_vbo.c
@@ -495,9 +495,9 @@ nv30_vbo_validate(struct nv30_context *nv30)
 	unsigned vb_flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD;
 	int hw;
 
-	vtxbuf = so_new(20, 18);
+	vtxbuf = so_new(3, 17, 18);
 	so_method(vtxbuf, rankine, NV34TCL_VTXBUF_ADDRESS(0), nv30->vtxelt_nr);
-	vtxfmt = so_new(17, 0);
+	vtxfmt = so_new(1, 16, 0);
 	so_method(vtxfmt, rankine, NV34TCL_VTXFMT(0), nv30->vtxelt_nr);
 
 	for (hw = 0; hw < nv30->vtxelt_nr; hw++) {
@@ -510,7 +510,7 @@ nv30_vbo_validate(struct nv30_context *nv30)
 
 		if (!vb->stride) {
 			if (!sattr)
-				sattr = so_new(16 * 5, 0);
+				sattr = so_new(16, 16 * 4, 0);
 
 			if (nv30_vbo_static_attrib(nv30, sattr, hw, ve, vb)) {
 				so_data(vtxbuf, 0);
diff --git a/src/gallium/drivers/nv30/nv30_vertprog.c b/src/gallium/drivers/nv30/nv30_vertprog.c
index 4e6d3d0..e77a5be 100644
--- a/src/gallium/drivers/nv30/nv30_vertprog.c
+++ b/src/gallium/drivers/nv30/nv30_vertprog.c
@@ -686,7 +686,7 @@ nv30_vertprog_validate(struct nv30_context *nv30)
 				assert(0);
 		}
 
-		so = so_new(2, 0);
+		so = so_new(1, 1, 0);
 		so_method(so, rankine, NV34TCL_VP_START_FROM_ID, 1);
 		so_data  (so, vp->exec->start);
 		so_ref(so, &vp->so);
diff --git a/src/gallium/drivers/nv40/nv40_fragprog.c b/src/gallium/drivers/nv40/nv40_fragprog.c
index bb9c85c..1237066 100644
--- a/src/gallium/drivers/nv40/nv40_fragprog.c
+++ b/src/gallium/drivers/nv40/nv40_fragprog.c
@@ -919,7 +919,7 @@ nv40_fragprog_validate(struct nv40_context *nv40)
 	fp->buffer = pscreen->buffer_create(pscreen, 0x100, 0, fp->insn_len * 4);
 	nv40_fragprog_upload(nv40, fp);
 
-	so = so_new(4, 1);
+	so = so_new(2, 2, 1);
 	so_method(so, nv40->screen->curie, NV40TCL_FP_ADDRESS, 1);
 	so_reloc (so, nouveau_bo(fp->buffer), 0, NOUVEAU_BO_VRAM |
 		      NOUVEAU_BO_GART | NOUVEAU_BO_RD | NOUVEAU_BO_LOW |
diff --git a/src/gallium/drivers/nv40/nv40_fragtex.c b/src/gallium/drivers/nv40/nv40_fragtex.c
index 44abc84..aad9198 100644
--- a/src/gallium/drivers/nv40/nv40_fragtex.c
+++ b/src/gallium/drivers/nv40/nv40_fragtex.c
@@ -108,7 +108,7 @@ nv40_fragtex_build(struct nv40_context *nv40, int unit)
 
 	txs = tf->swizzle;
 
-	so = so_new(16, 2);
+	so = so_new(2, 9, 2);
 	so_method(so, nv40->screen->curie, NV40TCL_TEX_OFFSET(unit), 8);
 	so_reloc (so, bo, 0, tex_flags | NOUVEAU_BO_LOW, 0, 0);
 	so_reloc (so, bo, txf, tex_flags | NOUVEAU_BO_OR,
@@ -139,7 +139,7 @@ nv40_fragtex_validate(struct nv40_context *nv40)
 		unit = ffs(samplers) - 1;
 		samplers &= ~(1 << unit);
 
-		so = so_new(2, 0);
+		so = so_new(1, 1, 0);
 		so_method(so, nv40->screen->curie, NV40TCL_TEX_ENABLE(unit), 1);
 		so_data  (so, 0);
 		so_ref(so, &nv40->state.hw[NV40_STATE_FRAGTEX0 + unit]);
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index d01e712..9e55e5a 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -215,7 +215,6 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		NOUVEAU_ERR("Error creating 3D object: %d\n", ret);
 		return FALSE;
 	}
-	BIND_RING(chan, screen->curie, 7);
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
@@ -252,7 +251,7 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	}
 
 	/* Static curie initialisation */
-	so = so_new(128, 0);
+	so = so_new(16, 25, 0);
 	so_method(so, screen->curie, NV40TCL_DMA_NOTIFY, 1);
 	so_data  (so, screen->sync->handle);
 	so_method(so, screen->curie, NV40TCL_DMA_TEXTURE0, 2);
diff --git a/src/gallium/drivers/nv40/nv40_state.c b/src/gallium/drivers/nv40/nv40_state.c
index ed55d29..ed0ca9e 100644
--- a/src/gallium/drivers/nv40/nv40_state.c
+++ b/src/gallium/drivers/nv40/nv40_state.c
@@ -16,7 +16,7 @@ nv40_blend_state_create(struct pipe_context *pipe,
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nouveau_grobj *curie = nv40->screen->curie;
 	struct nv40_blend_state *bso = CALLOC(1, sizeof(*bso));
-	struct nouveau_stateobj *so = so_new(16, 0);
+	struct nouveau_stateobj *so = so_new(5, 8, 0);
 
 	if (cso->blend_enable) {
 		so_method(so, curie, NV40TCL_BLEND_ENABLE, 3);
@@ -310,7 +310,7 @@ nv40_rasterizer_state_create(struct pipe_context *pipe,
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_rasterizer_state *rsso = CALLOC(1, sizeof(*rsso));
-	struct nouveau_stateobj *so = so_new(32, 0);
+	struct nouveau_stateobj *so = so_new(8, 18, 0);
 	struct nouveau_grobj *curie = nv40->screen->curie;
 
 	/*XXX: ignored:
@@ -445,7 +445,7 @@ nv40_depth_stencil_alpha_state_create(struct pipe_context *pipe,
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_zsa_state *zsaso = CALLOC(1, sizeof(*zsaso));
-	struct nouveau_stateobj *so = so_new(32, 0);
+	struct nouveau_stateobj *so = so_new(4, 21, 0);
 	struct nouveau_grobj *curie = nv40->screen->curie;
 
 	so_method(so, curie, NV40TCL_DEPTH_FUNC, 3);
diff --git a/src/gallium/drivers/nv40/nv40_state_blend.c b/src/gallium/drivers/nv40/nv40_state_blend.c
index 8cd05ce..3ff00a3 100644
--- a/src/gallium/drivers/nv40/nv40_state_blend.c
+++ b/src/gallium/drivers/nv40/nv40_state_blend.c
@@ -18,7 +18,7 @@ struct nv40_state_entry nv40_state_blend = {
 static boolean
 nv40_state_blend_colour_validate(struct nv40_context *nv40)
 {
-	struct nouveau_stateobj *so = so_new(2, 0);
+	struct nouveau_stateobj *so = so_new(1, 1, 0);
 	struct pipe_blend_color *bcol = &nv40->blend_colour;
 
 	so_method(so, nv40->screen->curie, NV40TCL_BLEND_COLOR, 1);
diff --git a/src/gallium/drivers/nv40/nv40_state_fb.c b/src/gallium/drivers/nv40/nv40_state_fb.c
index 1c7a7cd..a58fe9d 100644
--- a/src/gallium/drivers/nv40/nv40_state_fb.c
+++ b/src/gallium/drivers/nv40/nv40_state_fb.c
@@ -19,7 +19,7 @@ nv40_state_framebuffer_validate(struct nv40_context *nv40)
 	struct nv04_surface *rt[4], *zeta;
 	uint32_t rt_enable, rt_format;
 	int i, colour_format = 0, zeta_format = 0;
-	struct nouveau_stateobj *so = so_new(64, 10);
+	struct nouveau_stateobj *so = so_new(18, 24, 10);
 	unsigned rt_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
 	unsigned w = fb->width;
 	unsigned h = fb->height;
diff --git a/src/gallium/drivers/nv40/nv40_state_scissor.c b/src/gallium/drivers/nv40/nv40_state_scissor.c
index cf58d33..753a505 100644
--- a/src/gallium/drivers/nv40/nv40_state_scissor.c
+++ b/src/gallium/drivers/nv40/nv40_state_scissor.c
@@ -12,7 +12,7 @@ nv40_state_scissor_validate(struct nv40_context *nv40)
 		return FALSE;
 	nv40->state.scissor_enabled = rast->scissor;
 
-	so = so_new(3, 0);
+	so = so_new(1, 2, 0);
 	so_method(so, nv40->screen->curie, NV40TCL_SCISSOR_HORIZ, 2);
 	if (nv40->state.scissor_enabled) {
 		so_data  (so, ((s->maxx - s->minx) << 16) | s->minx);
diff --git a/src/gallium/drivers/nv40/nv40_state_stipple.c b/src/gallium/drivers/nv40/nv40_state_stipple.c
index b51024a..2b371eb 100644
--- a/src/gallium/drivers/nv40/nv40_state_stipple.c
+++ b/src/gallium/drivers/nv40/nv40_state_stipple.c
@@ -14,14 +14,14 @@ nv40_state_stipple_validate(struct nv40_context *nv40)
 	if (rast->poly_stipple_enable) {
 		unsigned i;
 
-		so = so_new(35, 0);
+		so = so_new(2, 33, 0);
 		so_method(so, curie, NV40TCL_POLYGON_STIPPLE_ENABLE, 1);
 		so_data  (so, 1);
 		so_method(so, curie, NV40TCL_POLYGON_STIPPLE_PATTERN(0), 32);
 		for (i = 0; i < 32; i++)
 			so_data(so, nv40->stipple[i]);
 	} else {
-		so = so_new(2, 0);
+		so = so_new(1, 1, 0);
 		so_method(so, curie, NV40TCL_POLYGON_STIPPLE_ENABLE, 1);
 		so_data  (so, 0);
 	}
diff --git a/src/gallium/drivers/nv40/nv40_state_viewport.c b/src/gallium/drivers/nv40/nv40_state_viewport.c
index 665d2d5..9919ba1 100644
--- a/src/gallium/drivers/nv40/nv40_state_viewport.c
+++ b/src/gallium/drivers/nv40/nv40_state_viewport.c
@@ -19,7 +19,7 @@ nv40_state_viewport_validate(struct nv40_context *nv40)
 		return FALSE;
 	nv40->state.viewport_bypass = bypass;
 
-	so = so_new(11, 0);
+	so = so_new(2, 9, 0);
 	if (!bypass) {
 		so_method(so, nv40->screen->curie,
 			  NV40TCL_VIEWPORT_TRANSLATE_X, 8);
diff --git a/src/gallium/drivers/nv40/nv40_vbo.c b/src/gallium/drivers/nv40/nv40_vbo.c
index d76af31..340ad67 100644
--- a/src/gallium/drivers/nv40/nv40_vbo.c
+++ b/src/gallium/drivers/nv40/nv40_vbo.c
@@ -494,9 +494,9 @@ nv40_vbo_validate(struct nv40_context *nv40)
 	unsigned vb_flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD;
 	int hw;
 
-	vtxbuf = so_new(20, 18);
+	vtxbuf = so_new(3, 17, 18);
 	so_method(vtxbuf, curie, NV40TCL_VTXBUF_ADDRESS(0), nv40->vtxelt_nr);
-	vtxfmt = so_new(17, 0);
+	vtxfmt = so_new(1, 16, 0);
 	so_method(vtxfmt, curie, NV40TCL_VTXFMT(0), nv40->vtxelt_nr);
 
 	for (hw = 0; hw < nv40->vtxelt_nr; hw++) {
@@ -509,7 +509,7 @@ nv40_vbo_validate(struct nv40_context *nv40)
 
 		if (!vb->stride) {
 			if (!sattr)
-				sattr = so_new(16 * 5, 0);
+				sattr = so_new(16, 16 * 4, 0);
 
 			if (nv40_vbo_static_attrib(nv40, sattr, hw, ve, vb)) {
 				so_data(vtxbuf, 0);
diff --git a/src/gallium/drivers/nv40/nv40_vertprog.c b/src/gallium/drivers/nv40/nv40_vertprog.c
index afbb2cb..8d80fca 100644
--- a/src/gallium/drivers/nv40/nv40_vertprog.c
+++ b/src/gallium/drivers/nv40/nv40_vertprog.c
@@ -886,7 +886,7 @@ check_gpu_resources:
 				assert(0);
 		}
 
-		so = so_new(7, 0);
+		so = so_new(3, 4, 0);
 		so_method(so, curie, NV40TCL_VP_START_FROM_ID, 1);
 		so_data  (so, vp->exec->start);
 		so_method(so, curie, NV40TCL_VP_ATTRIB_EN, 2);
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index b9910b4..a3f1372 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -3452,7 +3452,7 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(13, 2);
+	so = so_new(5, 8, 2);
 	so_method(so, tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
 	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		      NOUVEAU_BO_HIGH, 0, 0);
@@ -3488,7 +3488,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(64, 2);
+	so = so_new(6, 7, 2);
 	so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
 	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		      NOUVEAU_BO_HIGH, 0, 0);
@@ -3656,7 +3656,7 @@ nv50_linkage_validate(struct nv50_context *nv50)
 	}
 
 	/* now fill the stateobj */
-	so = so_new(64, 0);
+	so = so_new(6, 58, 0);
 
 	n = (m + 3) / 4;
 	so_method(so, tesla, NV50TCL_VP_RESULT_MAP_SIZE, 1);
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 1778a74..28e2b35 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -251,7 +251,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
-	BIND_RING(chan, screen->m2mf, 1);
 
 	/* 2D object */
 	ret = nouveau_grobj_alloc(chan, 0xbeef502d, NV50_2D, &screen->eng2d);
@@ -260,7 +259,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
-	BIND_RING(chan, screen->eng2d, 2);
 
 	/* 3D object */
 	switch (chipset & 0xf0) {
@@ -296,7 +294,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
-	BIND_RING(chan, screen->tesla, 3);
 
 	/* Sync notifier */
 	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
@@ -307,7 +304,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	}
 
 	/* Static M2MF init */
-	so = so_new(32, 0);
+	so = so_new(1, 3, 0);
 	so_method(so, screen->m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_DMA_NOTIFY, 3);
 	so_data  (so, screen->sync->handle);
 	so_data  (so, chan->vram->handle);
@@ -316,7 +313,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_ref (NULL, &so);
 
 	/* Static 2D init */
-	so = so_new(64, 0);
+	so = so_new(4, 7, 0);
 	so_method(so, screen->eng2d, NV50_2D_DMA_NOTIFY, 4);
 	so_data  (so, screen->sync->handle);
 	so_data  (so, chan->vram->handle);
@@ -332,7 +329,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_ref(NULL, &so);
 
 	/* Static tesla init */
-	so = so_new(256, 20);
+	so = so_new(40, 84, 20);
 
 	so_method(so, screen->tesla, NV50TCL_COND_MODE, 1);
 	so_data  (so, NV50TCL_COND_MODE_ALWAYS);
diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 18a2b81..18b5a9a 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -35,7 +35,7 @@ static void *
 nv50_blend_state_create(struct pipe_context *pipe,
 			const struct pipe_blend_state *cso)
 {
-	struct nouveau_stateobj *so = so_new(64, 0);
+	struct nouveau_stateobj *so = so_new(5, 24, 0);
 	struct nouveau_grobj *tesla = nv50_context(pipe)->screen->tesla;
 	struct nv50_blend_stateobj *bso = CALLOC_STRUCT(nv50_blend_stateobj);
 	unsigned cmask = 0, i;
@@ -280,7 +280,7 @@ static void *
 nv50_rasterizer_state_create(struct pipe_context *pipe,
 			     const struct pipe_rasterizer_state *cso)
 {
-	struct nouveau_stateobj *so = so_new(64, 0);
+	struct nouveau_stateobj *so = so_new(15, 21, 0);
 	struct nouveau_grobj *tesla = nv50_context(pipe)->screen->tesla;
 	struct nv50_rasterizer_stateobj *rso =
 		CALLOC_STRUCT(nv50_rasterizer_stateobj);
@@ -425,7 +425,7 @@ nv50_depth_stencil_alpha_state_create(struct pipe_context *pipe,
 {
 	struct nouveau_grobj *tesla = nv50_context(pipe)->screen->tesla;
 	struct nv50_zsa_stateobj *zsa = CALLOC_STRUCT(nv50_zsa_stateobj);
-	struct nouveau_stateobj *so = so_new(64, 0);
+	struct nouveau_stateobj *so = so_new(8, 22, 0);
 
 	so_method(so, tesla, NV50TCL_DEPTH_WRITE_ENABLE, 1);
 	so_data  (so, cso->depth.writemask ? 1 : 0);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 6827863..f83232f 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -33,7 +33,7 @@ static void
 nv50_state_validate_fb(struct nv50_context *nv50)
 {
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
-	struct nouveau_stateobj *so = so_new(128, 18);
+	struct nouveau_stateobj *so = so_new(32, 79, 18);
 	struct pipe_framebuffer_state *fb = &nv50->framebuffer;
 	unsigned i, w, h, gw = 0;
 
@@ -299,7 +299,7 @@ nv50_state_validate(struct nv50_context *nv50)
 		so_ref(nv50->rasterizer->so, &nv50->state.rast);
 
 	if (nv50->dirty & NV50_NEW_BLEND_COLOUR) {
-		so = so_new(5, 0);
+		so = so_new(1, 4, 0);
 		so_method(so, tesla, NV50TCL_BLEND_COLOR(0), 4);
 		so_data  (so, fui(nv50->blend_colour.color[0]));
 		so_data  (so, fui(nv50->blend_colour.color[1]));
@@ -310,7 +310,7 @@ nv50_state_validate(struct nv50_context *nv50)
 	}
 
 	if (nv50->dirty & NV50_NEW_STIPPLE) {
-		so = so_new(33, 0);
+		so = so_new(1, 32, 0);
 		so_method(so, tesla, NV50TCL_POLYGON_STIPPLE_PATTERN(0), 32);
 		for (i = 0; i < 32; i++)
 			so_data(so, util_bswap32(nv50->stipple.stipple[i]));
@@ -327,7 +327,7 @@ nv50_state_validate(struct nv50_context *nv50)
 			goto scissor_uptodate;
 		nv50->state.scissor_enabled = rast->scissor;
 
-		so = so_new(3, 0);
+		so = so_new(1, 2, 0);
 		so_method(so, tesla, NV50TCL_SCISSOR_HORIZ(0), 2);
 		if (nv50->state.scissor_enabled) {
 			so_data(so, (s->maxx << 16) | s->minx);
@@ -356,7 +356,7 @@ scissor_uptodate:
 			goto viewport_uptodate;
 		nv50->state.viewport_bypass = bypass;
 
-		so = so_new(14, 0);
+		so = so_new(5, 9, 0);
 		if (!bypass) {
 			so_method(so, tesla, NV50TCL_VIEWPORT_TRANSLATE_X(0), 3);
 			so_data  (so, fui(nv50->viewport.translate[0]));
@@ -400,7 +400,8 @@ viewport_uptodate:
 		for (i = 0; i < PIPE_SHADER_TYPES; ++i)
 			nr += nv50->sampler_nr[i];
 
-		so = so_new(nr * 8 + 24 * PIPE_SHADER_TYPES + 2, 4);
+		so = so_new(1+ 5 * PIPE_SHADER_TYPES, 1+ 19 * PIPE_SHADER_TYPES
+					+ nr * 8, PIPE_SHADER_TYPES * 2);
 
 		nv50_validate_samplers(nv50, so, PIPE_SHADER_VERTEX);
 		nv50_validate_samplers(nv50, so, PIPE_SHADER_FRAGMENT);
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index c4ca096..bef548b 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -199,16 +199,18 @@ nv50_tex_validate(struct nv50_context *nv50)
 {
 	struct nouveau_stateobj *so;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
-	unsigned p, push, nrlc;
+	unsigned p, start, push, nrlc;
 
-	for (nrlc = 0, push = 0, p = 0; p < PIPE_SHADER_TYPES; ++p) {
+	for (nrlc = 0, start = 0, push = 0, p = 0; p < PIPE_SHADER_TYPES; ++p) {
+		start += MAX2(nv50->miptree_nr[p], nv50->state.miptree_nr[p]);
 		push += MAX2(nv50->miptree_nr[p], nv50->state.miptree_nr[p]);
 		nrlc += nv50->miptree_nr[p];
 	}
-	push = push * 11 + 23 * PIPE_SHADER_TYPES + 4;
+	start = start * 2 + 4 * PIPE_SHADER_TYPES + 2;
+	push = push * 9 + 19 * PIPE_SHADER_TYPES + 2;
 	nrlc = nrlc * 2 + 2 * PIPE_SHADER_TYPES;
 
-	so = so_new(push, nrlc);
+	so = so_new(start, push, nrlc);
 
 	if (nv50_validate_textures(nv50, so, PIPE_SHADER_VERTEX) == FALSE ||
 	    nv50_validate_textures(nv50, so, PIPE_SHADER_FRAGMENT) == FALSE) {
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 602adfc..5186960 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -350,7 +350,7 @@ nv50_vbo_static_attrib(struct nv50_context *nv50, unsigned attrib,
 
 	so = *pso;
 	if (!so)
-		*pso = so = so_new(nv50->vtxelt_nr * 5, 0);
+		*pso = so = so_new(nv50->vtxelt_nr, nv50->vtxelt_nr * 4, 0);
 
 	switch (ve->nr_components) {
 	case 4:
@@ -411,8 +411,8 @@ nv50_vbo_validate(struct nv50_context *nv50)
 	n_ve = MAX2(nv50->vtxelt_nr, nv50->state.vtxelt_nr);
 
 	vtxattr = NULL;
-	vtxbuf = so_new(n_ve * 7, nv50->vtxelt_nr * 4);
-	vtxfmt = so_new(n_ve + 1, 0);
+	vtxbuf = so_new(n_ve * 2, n_ve * 5, nv50->vtxelt_nr * 4);
+	vtxfmt = so_new(1, n_ve, 0);
 	so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(0), n_ve);
 
 	for (i = 0; i < nv50->vtxelt_nr; i++) {
-- 
1.6.6.rc4
