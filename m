From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: avoid running out of relocs (attempt 3)
Date: Sat,  5 Dec 2009 15:36:19 +0100
Message-ID: <1260023779-4095-1-git-send-email-madman2003@gmail.com>
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
List-Id: nouveau.vger.kernel.org

- NV30 and NV40 need testing.
- I'll take better naming suggestions for so_get_push_reloc().
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   49 +++++++++++++++++++-----
 src/gallium/drivers/nv04/nv04_surface_2d.c     |    9 +++-
 src/gallium/drivers/nv30/nv30_state_emit.c     |   26 ++++++++++++
 src/gallium/drivers/nv40/nv40_state_emit.c     |   30 ++++++++++++++
 src/gallium/drivers/nv50/nv50_query.c          |    2 +-
 src/gallium/drivers/nv50/nv50_state_validate.c |   39 +++++++++++++++++++
 src/gallium/drivers/nv50/nv50_surface.c        |    2 +
 src/gallium/drivers/nv50/nv50_transfer.c       |    4 +-
 8 files changed, 145 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index b595405..576fc95 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -107,28 +107,48 @@ so_dump(struct nouveau_stateobj *so)
 }
 
 static INLINE void
+so_get_push_reloc(struct nouveau_stateobj *so, int *push, int *reloc)
+{
+	*push += so->cur - so->push;
+	*reloc += so->cur_reloc;
+}
+
+static INLINE void
 so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
 	unsigned nr, i;
 
 	nr = so->cur - so->push;
-	if (pb->remaining < nr)
-		nouveau_pushbuf_flush(chan, nr);
+	if (pb->remaining < nr) {
+		debug_printf("so_emit ran out of space\n");
+		return;
+	}
 	pb->remaining -= nr;
 
 	memcpy(pb->cur, so->push, nr * 4);
 	for (i = 0; i < so->cur_reloc; i++) {
 		struct nouveau_stateobj_reloc *r = &so->reloc[i];
+		int ret = 0;
 
-		nouveau_pushbuf_emit_reloc(chan, pb->cur + r->offset,
+		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur + r->offset,
 					   r->bo, r->data, 0, r->flags,
-					   r->vor, r->tor);
+					   r->vor, r->tor))) {
+			debug_printf("so_emit failed reloc with error %d\n", ret);
+			return;
+		}
 	}
 	pb->cur += nr;
 }
 
 static INLINE void
+so_get_push_reloc_markers(struct nouveau_stateobj *so, int *push, int *reloc)
+{
+	*push += (so->cur_reloc << 1);
+	*reloc += (so->cur_reloc << 1);
+}
+
+static INLINE void
 so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
@@ -138,21 +158,30 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 		return;
 
 	i = so->cur_reloc << 1;
-	if (pb->remaining < i)
-		nouveau_pushbuf_flush(chan, i);
+	if (pb->remaining < i) {
+		debug_printf("so_emit_reloc_markers ran out of space\n");
+		return;
+	}
 	pb->remaining -= i;
 
 	for (i = 0; i < so->cur_reloc; i++) {
 		struct nouveau_stateobj_reloc *r = &so->reloc[i];
+		int ret = 0;
 
-		nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo, r->packet, 0,
+		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo, r->packet, 0,
 					   (r->flags & (NOUVEAU_BO_VRAM |
 							NOUVEAU_BO_GART |
 							NOUVEAU_BO_RDWR)) |
-					   NOUVEAU_BO_DUMMY, 0, 0);
-		nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo, r->data, 0,
+					   NOUVEAU_BO_DUMMY, 0, 0))) {
+			debug_printf("so_emit_reloc_markers failed reloc \
+						with error %d\n", ret);
+		}
+		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo, r->data, 0,
 					   r->flags | NOUVEAU_BO_DUMMY,
-					   r->vor, r->tor);
+					   r->vor, r->tor))) {
+			debug_printf("so_emit_reloc_markers failed reloc \
+						with error %d\n", ret);
+		}
 	}
 }
 
diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.c b/src/gallium/drivers/nv04/nv04_surface_2d.c
index 932893e..3020806 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.c
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.c
@@ -133,6 +133,9 @@ nv04_surface_copy_swizzle(struct nv04_surface_2d *ctx,
 	assert(sub_w == w || util_is_pot(sub_w));
 	assert(sub_h == h || util_is_pot(sub_h));
 
+	MARK_RING (chan, 8 + ((w+sub_w)/sub_w)*((h+sub_h)/sub_h)*17, 2 +
+			 ((w+sub_w)/sub_w)*((h+sub_h)/sub_h)*2);
+
 	BEGIN_RING(chan, swzsurf, NV04_SWIZZLED_SURFACE_DMA_IMAGE, 1);
 	OUT_RELOCo(chan, dst_bo,
 	                 NOUVEAU_BO_GART | NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
@@ -202,7 +205,7 @@ nv04_surface_copy_m2mf(struct nv04_surface_2d *ctx,
 	unsigned src_offset = src->offset + sy * src_pitch +
 	                      sx * pf_get_blocksize(src->texture->format);
 
-	WAIT_RING (chan, 3 + ((h / 2047) + 1) * 9);
+	MARK_RING (chan, 3 + ((h / 2047) + 1) * 9, 2 + ((h / 2047) + 1) * 2);
 	BEGIN_RING(chan, m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_DMA_BUFFER_IN, 2);
 	OUT_RELOCo(chan, src_bo,
 		   NOUVEAU_BO_GART | NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
@@ -250,7 +253,7 @@ nv04_surface_copy_blit(struct nv04_surface_2d *ctx, struct pipe_surface *dst,
 	if (format < 0)
 		return 1;
 
-	WAIT_RING (chan, 12);
+	MARK_RING (chan, 12, 4);
 	BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAGE_SOURCE, 2);
 	OUT_RELOCo(chan, src_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
 	OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
@@ -315,7 +318,7 @@ nv04_surface_fill(struct nv04_surface_2d *ctx, struct pipe_surface *dst,
 	gdirect_format = nv04_rect_format(dst->format);
 	assert(gdirect_format >= 0);
 
-	WAIT_RING (chan, 16);
+	MARK_RING (chan, 16, 4);
 	BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAGE_SOURCE, 2);
 	OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
diff --git a/src/gallium/drivers/nv30/nv30_state_emit.c b/src/gallium/drivers/nv30/nv30_state_emit.c
index 621b884..1cee89d 100644
--- a/src/gallium/drivers/nv30/nv30_state_emit.c
+++ b/src/gallium/drivers/nv30/nv30_state_emit.c
@@ -43,6 +43,7 @@ nv30_state_emit(struct nv30_context *nv30)
 	struct nv30_screen *screen = nv30->screen;
 	unsigned i, samplers;
 	uint64_t states;
+	int push = 0, reloc = 0;
 
 	if (nv30->pctx_id != screen->cur_pctx) {
 		for (i = 0; i < NV30_STATE_MAX; i++) {
@@ -53,6 +54,31 @@ nv30_state_emit(struct nv30_context *nv30)
 		screen->cur_pctx = nv30->pctx_id;
 	}
 
+	/* Find out if we have enough space in pushbuffer. */
+	for (i = 0, states = state->dirty; states; i++) {
+		if (!(states & (1ULL << i)))
+			continue;
+		if (state->hw[i])
+			so_get_push_reloc(nv30->screen->state[i], &push, &reloc);
+	}
+
+	so_get_push_reloc_markers(state->hw[NV30_STATE_FB], &push, &reloc);
+	for (i = 0, samplers = state->fp_samplers; i < 16 && samplers; i++) {
+		if (!(samplers & (1 << i)))
+			continue;
+		so_get_push_reloc_markers(state->hw[NV30_STATE_FRAGTEX0+i],
+			&push, &reloc);
+	}
+
+	so_get_push_reloc_markers(state->hw[NV30_STATE_FRAGPROG],
+		&push, &reloc);
+	if (state->hw[NV30_STATE_VTXBUF] /*&& nv30->render_mode == HW*/)
+		so_get_push_reloc_markers(state->hw[NV30_STATE_VTXBUF],
+			&push, &reloc);
+
+	/* Will flush if necessary. */
+	MARK_RING (chan, push, reloc);
+
 	for (i = 0, states = state->dirty; states; i++) {
 		if (!(states & (1ULL << i)))
 			continue;
diff --git a/src/gallium/drivers/nv40/nv40_state_emit.c b/src/gallium/drivers/nv40/nv40_state_emit.c
index 1986929..45a0ea1 100644
--- a/src/gallium/drivers/nv40/nv40_state_emit.c
+++ b/src/gallium/drivers/nv40/nv40_state_emit.c
@@ -59,6 +59,7 @@ nv40_state_emit(struct nv40_context *nv40)
 	struct nv40_screen *screen = nv40->screen;
 	unsigned i, samplers;
 	uint64_t states;
+	int push = 0, reloc = 0;
 
 	if (nv40->pctx_id != screen->cur_pctx) {
 		for (i = 0; i < NV40_STATE_MAX; i++) {
@@ -69,6 +70,35 @@ nv40_state_emit(struct nv40_context *nv40)
 		screen->cur_pctx = nv40->pctx_id;
 	}
 
+	/* Find out if we have enough space in pushbuffer. */
+	for (i = 0, states = state->dirty; states; i++) {
+		if (!(states & (1ULL << i)))
+			continue;
+		if (state->hw[i])
+			so_get_push_reloc(nv40->screen->state[i], &push, &reloc);
+	}
+
+	if (state->dirty & ((1ULL << NV40_STATE_FRAGPROG) |
+			    (1ULL << NV40_STATE_FRAGTEX0)))
+		push += 4;
+
+	so_get_push_reloc_markers(state->hw[NV40_STATE_FB], &push, &reloc);
+	for (i = 0, samplers = state->fp_samplers; i < 16 && samplers; i++) {
+		if (!(samplers & (1 << i)))
+			continue;
+		so_get_push_reloc_markers(state->hw[NV40_STATE_FRAGTEX0+i],
+			&push, &reloc);
+	}
+
+	so_get_push_reloc_markers(state->hw[NV40_STATE_FRAGPROG],
+		&push, &reloc);
+	if (state->hw[NV40_STATE_VTXBUF] && nv40->render_mode == HW)
+		so_get_push_reloc_markers(state->hw[NV40_STATE_VTXBUF],
+			&push, &reloc);
+
+	/* Will flush if necessary. */
+	MARK_RING (chan, push, reloc);
+
 	for (i = 0, states = state->dirty; states; i++) {
 		if (!(states & (1ULL << i)))
 			continue;
diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/nv50/nv50_query.c
index 5305c93..268c982 100644
--- a/src/gallium/drivers/nv50/nv50_query.c
+++ b/src/gallium/drivers/nv50/nv50_query.c
@@ -93,7 +93,7 @@ nv50_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_query *q = nv50_query(pq);
 
-	WAIT_RING (chan, 5);
+	MARK_RING (chan, 5, 2); /* flush on lack of space or relocs */
 	BEGIN_RING(chan, tesla, NV50TCL_QUERY_ADDRESS_HIGH, 4);
 	OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index c871aca..c42a666 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -160,6 +160,7 @@ nv50_state_emit(struct nv50_context *nv50)
 {
 	struct nv50_screen *screen = nv50->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	int push = 0, reloc = 0;
 
 	if (nv50->pctx_id != screen->cur_pctx) {
 		if (nv50->state.fb)
@@ -191,6 +192,44 @@ nv50_state_emit(struct nv50_context *nv50)
 		screen->cur_pctx = nv50->pctx_id;
 	}
 
+	/* Find out how much space we need in the pushbuffer. */
+	if (nv50->state.dirty & NV50_NEW_FRAMEBUFFER)
+		so_get_push_reloc(nv50->state.fb, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_BLEND)
+		so_get_push_reloc(nv50->state.blend, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_ZSA)
+		so_get_push_reloc(nv50->state.zsa, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_VERTPROG)
+		so_get_push_reloc(nv50->state.vertprog, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_FRAGPROG)
+		so_get_push_reloc(nv50->state.fragprog, &push, &reloc);
+	if (nv50->state.dirty & (NV50_NEW_FRAGPROG | NV50_NEW_VERTPROG |
+				 NV50_NEW_RASTERIZER))
+		so_get_push_reloc(nv50->state.programs, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_RASTERIZER)
+		so_get_push_reloc(nv50->state.rast, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_BLEND_COLOUR)
+		so_get_push_reloc(nv50->state.blend_colour, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_STIPPLE)
+		so_get_push_reloc(nv50->state.stipple, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_SCISSOR)
+		so_get_push_reloc(nv50->state.scissor, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_VIEWPORT)
+		so_get_push_reloc(nv50->state.viewport, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_SAMPLER)
+		so_get_push_reloc(nv50->state.tsc_upload, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_TEXTURE)
+		so_get_push_reloc(nv50->state.tic_upload, &push, &reloc);
+	if (nv50->state.dirty & NV50_NEW_ARRAYS) {
+		so_get_push_reloc(nv50->state.vtxfmt, &push, &reloc);
+		so_get_push_reloc(nv50->state.vtxbuf, &push, &reloc);
+		if (nv50->state.vtxattr)
+			so_get_push_reloc(nv50->state.vtxattr, &push, &reloc);
+	}
+
+	/* Flush if needed. */
+	MARK_RING(chan, push, reloc);
+
 	if (nv50->state.dirty & NV50_NEW_FRAMEBUFFER)
 		so_emit(chan, nv50->state.fb);
 	if (nv50->state.dirty & NV50_NEW_BLEND)
diff --git a/src/gallium/drivers/nv50/nv50_surface.c b/src/gallium/drivers/nv50/nv50_surface.c
index 6bf6f77..79655fc 100644
--- a/src/gallium/drivers/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nv50/nv50_surface.c
@@ -62,6 +62,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pipe_surface *ps, int dst)
  		return 1;
 
  	if (!bo->tile_flags) {
+		MARK_RING (chan, 9, 2); /* flush on lack of space or relocs */
  		BEGIN_RING(chan, eng2d, mthd, 2);
  		OUT_RING  (chan, format);
  		OUT_RING  (chan, 1);
@@ -72,6 +73,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pipe_surface *ps, int dst)
  		OUT_RELOCh(chan, bo, ps->offset, flags);
  		OUT_RELOCl(chan, bo, ps->offset, flags);
  	} else {
+		MARK_RING (chan, 11, 2); /* flush on lack of space or relocs */
  		BEGIN_RING(chan, eng2d, mthd, 5);
  		OUT_RING  (chan, format);
  		OUT_RING  (chan, 0);
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 4705f96..1b6c8d6 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -81,7 +81,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 	while (height) {
 		int line_count = height > 2047 ? 2047 : height;
 
-		WAIT_RING (chan, 15);
+		MARK_RING (chan, 15, 4); /* flush on lack of space or relocs */
 		BEGIN_RING(chan, m2mf,
 			NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN_HIGH, 2);
 		OUT_RELOCh(chan, src_bo, src_offset, src_reloc);
@@ -282,7 +282,7 @@ nv50_upload_sifc(struct nv50_context *nv50,
 
 	reloc |= NOUVEAU_BO_WR;
 
-	WAIT_RING (chan, 32);
+	MARK_RING (chan, 32, 2); /* flush on lack of space or relocs */
 
 	if (bo->tile_flags) {
 		BEGIN_RING(chan, eng2d, NV50_2D_DST_FORMAT, 5);
-- 
1.6.5.3
