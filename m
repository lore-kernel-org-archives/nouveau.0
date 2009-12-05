From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: avoid running out of relocs (attempt 4)
Date: Sat,  5 Dec 2009 21:55:20 +0100
Message-ID: <1260046520-2376-1-git-send-email-madman2003@gmail.com>
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

- Added flush notify functions for NV30 and NV40.
- NV30 and NV40 need testing.
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   42 ++++++++++++++++++------
 src/gallium/drivers/nv04/nv04_surface_2d.c     |    9 +++--
 src/gallium/drivers/nv30/nv30_context.c        |    3 ++
 src/gallium/drivers/nv30/nv30_context.h        |    1 +
 src/gallium/drivers/nv30/nv30_state_emit.c     |   10 +++++-
 src/gallium/drivers/nv40/nv40_context.c        |    3 ++
 src/gallium/drivers/nv40/nv40_context.h        |    1 +
 src/gallium/drivers/nv40/nv40_state_emit.c     |   10 +++++-
 src/gallium/drivers/nv50/nv50_query.c          |    2 +-
 src/gallium/drivers/nv50/nv50_surface.c        |    2 +
 src/gallium/drivers/nv50/nv50_transfer.c       |    4 +-
 11 files changed, 69 insertions(+), 18 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index b595405..67b6c94 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -111,19 +111,28 @@ so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
 	unsigned nr, i;
+	int ret = 0;
 
 	nr = so->cur - so->push;
-	if (pb->remaining < nr)
-		nouveau_pushbuf_flush(chan, nr);
+	/* This will flush if we need space.
+	 * We don't actually need the marker.
+	 */
+	if ((ret = nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc))) {
+		debug_printf("so_emit failed marker emit with error %d\n", ret);
+		return;
+	}
 	pb->remaining -= nr;
 
 	memcpy(pb->cur, so->push, nr * 4);
 	for (i = 0; i < so->cur_reloc; i++) {
 		struct nouveau_stateobj_reloc *r = &so->reloc[i];
 
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
@@ -133,26 +142,39 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
 	unsigned i;
+	int ret = 0;
 
 	if (!so)
 		return;
 
 	i = so->cur_reloc << 1;
-	if (pb->remaining < i)
-		nouveau_pushbuf_flush(chan, i);
+	/* This will flush if we need space.
+	 * We don't actually need the marker.
+	 */
+	if ((ret = nouveau_pushbuf_marker_emit(chan, i, i))) {
+		debug_printf("so_emit_reloc_markers failed marker emit with \
+			error %d\n", ret);
+		return;
+	}
 	pb->remaining -= i;
 
 	for (i = 0; i < so->cur_reloc; i++) {
 		struct nouveau_stateobj_reloc *r = &so->reloc[i];
 
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
diff --git a/src/gallium/drivers/nv30/nv30_context.c b/src/gallium/drivers/nv30/nv30_context.c
index d8300fd..46a821a 100644
--- a/src/gallium/drivers/nv30/nv30_context.c
+++ b/src/gallium/drivers/nv30/nv30_context.c
@@ -58,6 +58,9 @@ nv30_create(struct pipe_screen *pscreen, unsigned pctx_id)
 	nv30->pipe.is_texture_referenced = nouveau_is_texture_referenced;
 	nv30->pipe.is_buffer_referenced = nouveau_is_buffer_referenced;
 
+	screen->base.channel->user_private = nv30;
+	screen->base.channel->flush_notify = nv30_state_flush_notify;
+
 	nv30_init_query_functions(nv30);
 	nv30_init_surface_functions(nv30);
 	nv30_init_state_functions(nv30);
diff --git a/src/gallium/drivers/nv30/nv30_context.h b/src/gallium/drivers/nv30/nv30_context.h
index 8d49366..6f44b1c 100644
--- a/src/gallium/drivers/nv30/nv30_context.h
+++ b/src/gallium/drivers/nv30/nv30_context.h
@@ -184,6 +184,7 @@ extern void nv30_fragtex_bind(struct nv30_context *);
 /* nv30_state.c and friends */
 extern boolean nv30_state_validate(struct nv30_context *nv30);
 extern void nv30_state_emit(struct nv30_context *nv30);
+extern void nv30_state_flush_notify(struct nouveau_channel *chan);
 extern struct nv30_state_entry nv30_state_rasterizer;
 extern struct nv30_state_entry nv30_state_scissor;
 extern struct nv30_state_entry nv30_state_stipple;
diff --git a/src/gallium/drivers/nv30/nv30_state_emit.c b/src/gallium/drivers/nv30/nv30_state_emit.c
index 621b884..d2e5312 100644
--- a/src/gallium/drivers/nv30/nv30_state_emit.c
+++ b/src/gallium/drivers/nv30/nv30_state_emit.c
@@ -41,7 +41,7 @@ nv30_state_emit(struct nv30_context *nv30)
 	struct nouveau_channel *chan = nv30->screen->base.channel;
 	struct nv30_state *state = &nv30->state;
 	struct nv30_screen *screen = nv30->screen;
-	unsigned i, samplers;
+	unsigned i;
 	uint64_t states;
 
 	if (nv30->pctx_id != screen->cur_pctx) {
@@ -63,6 +63,14 @@ nv30_state_emit(struct nv30_context *nv30)
 	}
 
 	state->dirty = 0;
+}
+
+void
+nv30_state_flush_notify(struct nouveau_channel *chan) 
+{
+	struct nv30_context *nv30 = chan->user_private;
+	struct nv30_state *state = &nv30->state;
+	unsigned i, samplers;
 
 	so_emit_reloc_markers(chan, state->hw[NV30_STATE_FB]);
 	for (i = 0, samplers = state->fp_samplers; i < 16 && samplers; i++) {
diff --git a/src/gallium/drivers/nv40/nv40_context.c b/src/gallium/drivers/nv40/nv40_context.c
index 7f00827..eb9cce4 100644
--- a/src/gallium/drivers/nv40/nv40_context.c
+++ b/src/gallium/drivers/nv40/nv40_context.c
@@ -58,6 +58,9 @@ nv40_create(struct pipe_screen *pscreen, unsigned pctx_id)
 	nv40->pipe.is_texture_referenced = nouveau_is_texture_referenced;
 	nv40->pipe.is_buffer_referenced = nouveau_is_buffer_referenced;
 
+	screen->base.channel->user_private = nv40;
+	screen->base.channel->flush_notify = nv40_state_flush_notify;
+
 	nv40_init_query_functions(nv40);
 	nv40_init_surface_functions(nv40);
 	nv40_init_state_functions(nv40);
diff --git a/src/gallium/drivers/nv40/nv40_context.h b/src/gallium/drivers/nv40/nv40_context.h
index a3d5941..cf33b64 100644
--- a/src/gallium/drivers/nv40/nv40_context.h
+++ b/src/gallium/drivers/nv40/nv40_context.h
@@ -204,6 +204,7 @@ extern void nv40_fragtex_bind(struct nv40_context *);
 extern boolean nv40_state_validate(struct nv40_context *nv40);
 extern boolean nv40_state_validate_swtnl(struct nv40_context *nv40);
 extern void nv40_state_emit(struct nv40_context *nv40);
+extern void nv40_state_flush_notify(struct nouveau_channel *chan);
 extern struct nv40_state_entry nv40_state_rasterizer;
 extern struct nv40_state_entry nv40_state_scissor;
 extern struct nv40_state_entry nv40_state_stipple;
diff --git a/src/gallium/drivers/nv40/nv40_state_emit.c b/src/gallium/drivers/nv40/nv40_state_emit.c
index 1986929..ba0fbcb 100644
--- a/src/gallium/drivers/nv40/nv40_state_emit.c
+++ b/src/gallium/drivers/nv40/nv40_state_emit.c
@@ -57,7 +57,7 @@ nv40_state_emit(struct nv40_context *nv40)
 	struct nouveau_channel *chan = nv40->screen->base.channel;
 	struct nv40_state *state = &nv40->state;
 	struct nv40_screen *screen = nv40->screen;
-	unsigned i, samplers;
+	unsigned i;
 	uint64_t states;
 
 	if (nv40->pctx_id != screen->cur_pctx) {
@@ -87,6 +87,14 @@ nv40_state_emit(struct nv40_context *nv40)
 	}
 
 	state->dirty = 0;
+}
+
+void
+nv40_state_flush_notify(struct nouveau_channel *chan)
+{
+	struct nv40_context *nv40 = chan->user_private;
+	struct nv40_state *state = &nv40->state;
+	unsigned i, samplers;
 
 	so_emit_reloc_markers(chan, state->hw[NV40_STATE_FB]);
 	for (i = 0, samplers = state->fp_samplers; i < 16 && samplers; i++) {
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
