From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nvfx: restore BEGIN_RING usage
Date: Mon, 20 Dec 2010 12:50:14 +0100
Message-ID: <1292845814-23623-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

As curro said, "let's keep it simple for the maintainers until the big
bottlenecks are gone"

Benchmarked on nv35 with openarena, nexuiz and ut2004 and no performance
regression.

The core of this patch was made with Coccinelle, with minor manual fixes
made on top.
---
 src/gallium/drivers/nvfx/nv30_fragtex.c    |    3 +-
 src/gallium/drivers/nvfx/nv40_fragtex.c    |    5 +-
 src/gallium/drivers/nvfx/nvfx_context.c    |    6 +-
 src/gallium/drivers/nvfx/nvfx_context.h    |   13 +++--
 src/gallium/drivers/nvfx/nvfx_draw.c       |   14 +++--
 src/gallium/drivers/nvfx/nvfx_fragprog.c   |   12 ++--
 src/gallium/drivers/nvfx/nvfx_fragtex.c    |    4 +-
 src/gallium/drivers/nvfx/nvfx_push.c       |   57 +++++++++++++++--------
 src/gallium/drivers/nvfx/nvfx_query.c      |   12 ++--
 src/gallium/drivers/nvfx/nvfx_screen.c     |   70 ++++++++++++++-------------
 src/gallium/drivers/nvfx/nvfx_state_emit.c |   68 +++++++++++++--------------
 src/gallium/drivers/nvfx/nvfx_state_fb.c   |   39 ++++++++--------
 src/gallium/drivers/nvfx/nvfx_surface.c    |    8 ++--
 src/gallium/drivers/nvfx/nvfx_vbo.c        |   23 +++++----
 src/gallium/drivers/nvfx/nvfx_vertprog.c   |   14 ++---
 15 files changed, 184 insertions(+), 164 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nv30_fragtex.c b/src/gallium/drivers/nvfx/nv30_fragtex.c
index 951fb20..b609891 100644
--- a/src/gallium/drivers/nvfx/nv30_fragtex.c
+++ b/src/gallium/drivers/nvfx/nv30_fragtex.c
@@ -71,6 +71,7 @@ nv30_fragtex_set(struct nvfx_context *nvfx, int unit)
 	struct nvfx_sampler_view* sv = (struct nvfx_sampler_view*)nvfx->fragment_sampler_views[unit];
 	struct nouveau_bo *bo = ((struct nvfx_miptree *)sv->base.texture)->base.bo;
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned txf;
 	unsigned tex_flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD;
 	unsigned use_rect;
@@ -102,7 +103,7 @@ nv30_fragtex_set(struct nvfx_context *nvfx, int unit)
 	txf = sv->u.nv30.fmt[ps->compare + (use_rect ? 2 : 0)];
 
 	MARK_RING(chan, 9, 2);
-	OUT_RING(chan, RING_3D(NV30_3D_TEX_OFFSET(unit), 8));
+	BEGIN_RING(chan, eng3d, NV30_3D_TEX_OFFSET(unit), 8);
 	OUT_RELOC(chan, bo, sv->offset, tex_flags | NOUVEAU_BO_LOW, 0, 0);
 	OUT_RELOC(chan, bo, txf,
 		tex_flags | NOUVEAU_BO_OR,
diff --git a/src/gallium/drivers/nvfx/nv40_fragtex.c b/src/gallium/drivers/nvfx/nv40_fragtex.c
index e8ab403..563183d 100644
--- a/src/gallium/drivers/nvfx/nv40_fragtex.c
+++ b/src/gallium/drivers/nvfx/nv40_fragtex.c
@@ -76,6 +76,7 @@ void
 nv40_fragtex_set(struct nvfx_context *nvfx, int unit)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct nvfx_sampler_state *ps = nvfx->tex_sampler[unit];
 	struct nvfx_sampler_view* sv = (struct nvfx_sampler_view*)nvfx->fragment_sampler_views[unit];
 	struct nouveau_bo *bo = ((struct nvfx_miptree *)sv->base.texture)->base.bo;
@@ -87,7 +88,7 @@ nv40_fragtex_set(struct nvfx_context *nvfx, int unit)
 	txf = sv->u.nv40.fmt[ps->compare] | ps->fmt;
 
 	MARK_RING(chan, 11, 2);
-	OUT_RING(chan, RING_3D(NV30_3D_TEX_OFFSET(unit), 8));
+	BEGIN_RING(chan, eng3d, NV30_3D_TEX_OFFSET(unit), 8);
 	OUT_RELOC(chan, bo, sv->offset, tex_flags | NOUVEAU_BO_LOW, 0, 0);
 	OUT_RELOC(chan, bo, txf, tex_flags | NOUVEAU_BO_OR,
 			NV30_3D_TEX_FORMAT_DMA0, NV30_3D_TEX_FORMAT_DMA1);
@@ -97,7 +98,7 @@ nv40_fragtex_set(struct nvfx_context *nvfx, int unit)
 	OUT_RING(chan, ps->filt | sv->filt);
 	OUT_RING(chan, sv->npot_size);
 	OUT_RING(chan, ps->bcol);
-	OUT_RING(chan, RING_3D(NV40_3D_TEX_SIZE1(unit), 1));
+	BEGIN_RING(chan, eng3d, NV40_3D_TEX_SIZE1(unit), 1);
 	OUT_RING(chan, sv->u.nv40.npot_size2);
 
 	nvfx->hw_txf[unit] = txf;
diff --git a/src/gallium/drivers/nvfx/nvfx_context.c b/src/gallium/drivers/nvfx/nvfx_context.c
index 95834d2..6c8934d 100644
--- a/src/gallium/drivers/nvfx/nvfx_context.c
+++ b/src/gallium/drivers/nvfx/nvfx_context.c
@@ -13,13 +13,13 @@ nvfx_flush(struct pipe_context *pipe, unsigned flags,
 	struct nvfx_context *nvfx = nvfx_context(pipe);
 	struct nvfx_screen *screen = nvfx->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *eng3d = screen->eng3d;
 
 	/* XXX: we need to actually be intelligent here */
 	if (flags & PIPE_FLUSH_TEXTURE_CACHE) {
-		WAIT_RING(chan, 4);
-		OUT_RING(chan, RING_3D(0x1fd8, 1));
+		BEGIN_RING(chan, eng3d, 0x1fd8, 1);
 		OUT_RING(chan, 2);
-		OUT_RING(chan, RING_3D(0x1fd8, 1));
+		BEGIN_RING(chan, eng3d, 0x1fd8, 1);
 		OUT_RING(chan, 1);
 	}
 
diff --git a/src/gallium/drivers/nvfx/nvfx_context.h b/src/gallium/drivers/nvfx/nvfx_context.h
index 6ef2a69..2238aa1 100644
--- a/src/gallium/drivers/nvfx/nvfx_context.h
+++ b/src/gallium/drivers/nvfx/nvfx_context.h
@@ -339,30 +339,31 @@ extern void nvfx_init_vertprog_functions(struct nvfx_context *nvfx);
 /* nvfx_push.c */
 extern void nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info);
 
-/* must WAIT_RING(chan, ncomp + 1) or equivalent beforehand! */
-static inline void nvfx_emit_vtx_attr(struct nouveau_channel* chan, unsigned attrib, const float* v, unsigned ncomp)
+static inline void nvfx_emit_vtx_attr(struct nouveau_channel* chan,
+		struct nouveau_grobj *eng3d, unsigned attrib, const float* v,
+		unsigned ncomp)
 {
 	switch (ncomp) {
 	case 4:
-		OUT_RING(chan, RING_3D(NV30_3D_VTX_ATTR_4F_X(attrib), 4));
+		BEGIN_RING(chan, eng3d, NV30_3D_VTX_ATTR_4F_X(attrib), 4);
 		OUT_RING(chan, fui(v[0]));
 		OUT_RING(chan, fui(v[1]));
 		OUT_RING(chan,  fui(v[2]));
 		OUT_RING(chan,  fui(v[3]));
 		break;
 	case 3:
-		OUT_RING(chan, RING_3D(NV30_3D_VTX_ATTR_3F_X(attrib), 3));
+		BEGIN_RING(chan, eng3d, NV30_3D_VTX_ATTR_3F_X(attrib), 3);
 		OUT_RING(chan,  fui(v[0]));
 		OUT_RING(chan,  fui(v[1]));
 		OUT_RING(chan,  fui(v[2]));
 		break;
 	case 2:
-		OUT_RING(chan, RING_3D(NV30_3D_VTX_ATTR_2F_X(attrib), 2));
+		BEGIN_RING(chan, eng3d, NV30_3D_VTX_ATTR_2F_X(attrib), 2);
 		OUT_RING(chan,  fui(v[0]));
 		OUT_RING(chan,  fui(v[1]));
 		break;
 	case 1:
-		OUT_RING(chan, RING_3D(NV30_3D_VTX_ATTR_1F(attrib), 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VTX_ATTR_1F(attrib), 1);
 		OUT_RING(chan,  fui(v[0]));
 		break;
 	}
diff --git a/src/gallium/drivers/nvfx/nvfx_draw.c b/src/gallium/drivers/nvfx/nvfx_draw.c
index 61f888a..81f1ec4 100644
--- a/src/gallium/drivers/nvfx/nvfx_draw.c
+++ b/src/gallium/drivers/nvfx/nvfx_draw.c
@@ -28,10 +28,10 @@ nvfx_render_flush(struct draw_stage *stage, unsigned flags)
 	struct nvfx_render_stage *rs = nvfx_render_stage(stage);
 	struct nvfx_context *nvfx = rs->nvfx;
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 
 	if (rs->prim != NV30_3D_VERTEX_BEGIN_END_STOP) {
-		assert(AVAIL_RING(chan) >= 2);
-		OUT_RING(chan, RING_3D(NV30_3D_VERTEX_BEGIN_END, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VERTEX_BEGIN_END, 1);
 		OUT_RING(chan, NV30_3D_VERTEX_BEGIN_END_STOP);
 		rs->prim = NV30_3D_VERTEX_BEGIN_END_STOP;
 	}
@@ -46,6 +46,7 @@ nvfx_render_prim(struct draw_stage *stage, struct prim_header *prim,
 
 	struct nvfx_screen *screen = nvfx->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *eng3d = screen->eng3d;
 	boolean no_elements = nvfx->vertprog->draw_no_elements;
 	unsigned num_attribs = nvfx->vertprog->draw_elements;
 
@@ -63,7 +64,7 @@ nvfx_render_prim(struct draw_stage *stage, struct prim_header *prim,
 	/* Switch primitive modes if necessary */
 	if (rs->prim != mode) {
 		if (rs->prim != NV30_3D_VERTEX_BEGIN_END_STOP) {
-			OUT_RING(chan, RING_3D(NV30_3D_VERTEX_BEGIN_END, 1));
+			BEGIN_RING(chan, eng3d, NV30_3D_VERTEX_BEGIN_END, 1);
 			OUT_RING(chan, NV30_3D_VERTEX_BEGIN_END_STOP);
 		}
 
@@ -74,23 +75,24 @@ nvfx_render_prim(struct draw_stage *stage, struct prim_header *prim,
 			int i;
 			for(i = 0; i < 32; ++i)
 			{
-				OUT_RING(chan, RING_3D(0x1dac, 1));
+				BEGIN_RING(chan, eng3d, 0x1dac, 1);
 				OUT_RING(chan, 0);
 			}
 		}
 
-		OUT_RING(chan, RING_3D(NV30_3D_VERTEX_BEGIN_END, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VERTEX_BEGIN_END, 1);
 		OUT_RING  (chan, mode);
 		rs->prim = mode;
 	}
 
-	OUT_RING(chan, RING_3D_NI(NV30_3D_VERTEX_DATA, num_attribs * 4 * count));
 	if(no_elements) {
+		BEGIN_RING_NI(chan, eng3d, NV30_3D_VERTEX_DATA, 4);
 		OUT_RING(chan, 0);
 		OUT_RING(chan, 0);
 		OUT_RING(chan, 0);
 		OUT_RING(chan, 0);
 	} else {
+		BEGIN_RING_NI(chan, eng3d, NV30_3D_VERTEX_DATA, num_attribs * 4 * count);
 		for (unsigned i = 0; i < count; ++i)
 		{
 			struct vertex_header* v = prim->v[i];
diff --git a/src/gallium/drivers/nvfx/nvfx_fragprog.c b/src/gallium/drivers/nvfx/nvfx_fragprog.c
index 1740d72..dbd7c77 100644
--- a/src/gallium/drivers/nvfx/nvfx_fragprog.c
+++ b/src/gallium/drivers/nvfx/nvfx_fragprog.c
@@ -1233,6 +1233,7 @@ void
 nvfx_fragprog_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct nvfx_pipe_fragment_program *pfp = nvfx->fragprog;
 	struct nvfx_vertex_program* vp;
 
@@ -1499,17 +1500,17 @@ update:
 		nvfx->hw_fragprog = fp;
 
 		MARK_RING(chan, 8, 1);
-		OUT_RING(chan, RING_3D(NV30_3D_FP_ACTIVE_PROGRAM, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_FP_ACTIVE_PROGRAM, 1);
 		OUT_RELOC(chan, fp->fpbo->bo, offset, NOUVEAU_BO_VRAM |
 			      NOUVEAU_BO_GART | NOUVEAU_BO_RD | NOUVEAU_BO_LOW |
 			      NOUVEAU_BO_OR, NV30_3D_FP_ACTIVE_PROGRAM_DMA0,
 			      NV30_3D_FP_ACTIVE_PROGRAM_DMA1);
-		OUT_RING(chan, RING_3D(NV30_3D_FP_CONTROL, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_FP_CONTROL, 1);
 		OUT_RING(chan, fp->fp_control);
 		if(!nvfx->is_nv4x) {
-			OUT_RING(chan, RING_3D(NV30_3D_FP_REG_CONTROL, 1));
+			BEGIN_RING(chan, eng3d, NV30_3D_FP_REG_CONTROL, 1);
 			OUT_RING(chan, (1<<16)|0x4);
-			OUT_RING(chan, RING_3D(NV30_3D_TEX_UNITS_ENABLE, 1));
+			BEGIN_RING(chan, eng3d, NV30_3D_TEX_UNITS_ENABLE, 1);
 			OUT_RING(chan, fp->samplers);
 		}
 	}
@@ -1518,8 +1519,7 @@ update:
 		unsigned pointsprite_control = fp->point_sprite_control | nvfx->rasterizer->pipe.point_quad_rasterization;
 		if(pointsprite_control != nvfx->hw_pointsprite_control)
 		{
-			WAIT_RING(chan, 2);
-			OUT_RING(chan, RING_3D(NV30_3D_POINT_SPRITE, 1));
+			BEGIN_RING(chan, eng3d, NV30_3D_POINT_SPRITE, 1);
 			OUT_RING(chan, pointsprite_control);
 			nvfx->hw_pointsprite_control = pointsprite_control;
 		}
diff --git a/src/gallium/drivers/nvfx/nvfx_fragtex.c b/src/gallium/drivers/nvfx/nvfx_fragtex.c
index fd0aff6..1c4901d 100644
--- a/src/gallium/drivers/nvfx/nvfx_fragtex.c
+++ b/src/gallium/drivers/nvfx/nvfx_fragtex.c
@@ -177,6 +177,7 @@ void
 nvfx_fragtex_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned samplers, unit;
 
 	samplers = nvfx->dirty_samplers;
@@ -197,9 +198,8 @@ nvfx_fragtex_validate(struct nvfx_context *nvfx)
 			else
 				nv40_fragtex_set(nvfx, unit);
 		} else {
-			WAIT_RING(chan, 2);
 			/* this is OK for nv40 too */
-			OUT_RING(chan, RING_3D(NV30_3D_TEX_ENABLE(unit), 1));
+			BEGIN_RING(chan, eng3d, NV30_3D_TEX_ENABLE(unit), 1);
 			OUT_RING(chan, 0);
 			nvfx->hw_samplers &= ~(1 << unit);
 		}
diff --git a/src/gallium/drivers/nvfx/nvfx_push.c b/src/gallium/drivers/nvfx/nvfx_push.c
index ebf47e6..6391741 100644
--- a/src/gallium/drivers/nvfx/nvfx_push.c
+++ b/src/gallium/drivers/nvfx/nvfx_push.c
@@ -10,6 +10,7 @@
 
 struct push_context {
 	struct nouveau_channel* chan;
+	struct nouveau_grobj *eng3d;
 
 	void *idxbuf;
 	int32_t idxbias;
@@ -27,9 +28,10 @@ static void
 emit_edgeflag(void *priv, boolean enabled)
 {
 	struct push_context* ctx = priv;
+	struct nouveau_grobj *eng3d = ctx->eng3d;
 	struct nouveau_channel *chan = ctx->chan;
 
-	OUT_RING(chan, RING_3D(NV30_3D_EDGEFLAG, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_EDGEFLAG, 1);
 	OUT_RING(chan, enabled ? 1 : 0);
 }
 
@@ -37,6 +39,7 @@ static void
 emit_vertices_lookup8(void *priv, unsigned start, unsigned count)
 {
         struct push_context *ctx = priv;
+        struct nouveau_grobj *eng3d = ctx->eng3d;
         uint8_t* elts = (uint8_t*)ctx->idxbuf + start;
 
         while(count)
@@ -44,7 +47,7 @@ emit_vertices_lookup8(void *priv, unsigned start, unsigned count)
                 unsigned push = MIN2(count, ctx->max_vertices_per_packet);
                 unsigned length = push * ctx->vertex_length;
 
-                OUT_RING(ctx->chan, RING_3D_NI(NV30_3D_VERTEX_DATA, length));
+                BEGIN_RING_NI(ctx->chan, eng3d, NV30_3D_VERTEX_DATA, length);
                 ctx->translate->run_elts8(ctx->translate, elts, push, 0, ctx->chan->cur);
                 ctx->chan->cur += length;
 
@@ -57,6 +60,7 @@ static void
 emit_vertices_lookup16(void *priv, unsigned start, unsigned count)
 {
 	struct push_context *ctx = priv;
+	struct nouveau_grobj *eng3d = ctx->eng3d;
         uint16_t* elts = (uint16_t*)ctx->idxbuf + start;
 
         while(count)
@@ -64,7 +68,7 @@ emit_vertices_lookup16(void *priv, unsigned start, unsigned count)
                 unsigned push = MIN2(count, ctx->max_vertices_per_packet);
                 unsigned length = push * ctx->vertex_length;
 
-                OUT_RING(ctx->chan, RING_3D_NI(NV30_3D_VERTEX_DATA, length));
+                BEGIN_RING_NI(ctx->chan, eng3d, NV30_3D_VERTEX_DATA, length);
                 ctx->translate->run_elts16(ctx->translate, elts, push, 0, ctx->chan->cur);
                 ctx->chan->cur += length;
 
@@ -77,6 +81,7 @@ static void
 emit_vertices_lookup32(void *priv, unsigned start, unsigned count)
 {
         struct push_context *ctx = priv;
+        struct nouveau_grobj *eng3d = ctx->eng3d;
         uint32_t* elts = (uint32_t*)ctx->idxbuf + start;
 
         while(count)
@@ -84,7 +89,7 @@ emit_vertices_lookup32(void *priv, unsigned start, unsigned count)
                 unsigned push = MIN2(count, ctx->max_vertices_per_packet);
                 unsigned length = push * ctx->vertex_length;
 
-                OUT_RING(ctx->chan, RING_3D_NI(NV30_3D_VERTEX_DATA, length));
+                BEGIN_RING_NI(ctx->chan, eng3d, NV30_3D_VERTEX_DATA, length);
                 ctx->translate->run_elts(ctx->translate, elts, push, 0, ctx->chan->cur);
                 ctx->chan->cur += length;
 
@@ -97,13 +102,14 @@ static void
 emit_vertices(void *priv, unsigned start, unsigned count)
 {
         struct push_context *ctx = priv;
+        struct nouveau_grobj *eng3d = ctx->eng3d;
 
         while(count)
         {
 		unsigned push = MIN2(count, ctx->max_vertices_per_packet);
 		unsigned length = push * ctx->vertex_length;
 
-		OUT_RING(ctx->chan, RING_3D_NI(NV30_3D_VERTEX_DATA, length));
+		BEGIN_RING_NI(ctx->chan, eng3d, NV30_3D_VERTEX_DATA, length);
 		ctx->translate->run(ctx->translate, start, push, 0, ctx->chan->cur);
 		ctx->chan->cur += length;
 
@@ -116,10 +122,11 @@ static void
 emit_ranges(void* priv, unsigned start, unsigned vc, unsigned reg)
 {
 	struct push_context* ctx = priv;
+	struct nouveau_grobj *eng3d = ctx->eng3d;
 	struct nouveau_channel *chan = ctx->chan;
 	unsigned nr = (vc & 0xff);
 	if (nr) {
-		OUT_RING(chan, RING_3D(reg, 1));
+		BEGIN_RING(chan, eng3d, reg, 1);
 		OUT_RING  (chan, ((nr - 1) << 24) | start);
 		start += nr;
 	}
@@ -130,7 +137,7 @@ emit_ranges(void* priv, unsigned start, unsigned vc, unsigned reg)
 
 		nr -= push;
 
-		OUT_RING(chan, RING_3D_NI(reg, push));
+		BEGIN_RING_NI(chan, eng3d, reg, push);
 		while (push--) {
 			OUT_RING(chan, ((0x100 - 1) << 24) | start);
 			start += 0x100;
@@ -154,12 +161,13 @@ static INLINE void
 emit_elt8(void* priv, unsigned start, unsigned vc)
 {
 	struct push_context* ctx = priv;
+	struct nouveau_grobj *eng3d = ctx->eng3d;
 	struct nouveau_channel *chan = ctx->chan;
 	uint8_t *elts = (uint8_t *)ctx->idxbuf + start;
 	int idxbias = ctx->idxbias;
 
 	if (vc & 1) {
-		OUT_RING(chan, RING_3D(NV30_3D_VB_ELEMENT_U32, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VB_ELEMENT_U32, 1);
 		OUT_RING  (chan, elts[0]);
 		elts++; vc--;
 	}
@@ -168,7 +176,7 @@ emit_elt8(void* priv, unsigned start, unsigned vc)
 		unsigned i;
 		unsigned push = MIN2(vc, 2047 * 2);
 
-		OUT_RING(chan, RING_3D_NI(NV30_3D_VB_ELEMENT_U16, push >> 1));
+		BEGIN_RING_NI(chan, eng3d, NV30_3D_VB_ELEMENT_U16, push >> 1);
 		for (i = 0; i < push; i+=2)
 			OUT_RING(chan, ((elts[i+1] + idxbias) << 16) | (elts[i] + idxbias));
 
@@ -181,12 +189,13 @@ static INLINE void
 emit_elt16(void* priv, unsigned start, unsigned vc)
 {
 	struct push_context* ctx = priv;
+	struct nouveau_grobj *eng3d = ctx->eng3d;
 	struct nouveau_channel *chan = ctx->chan;
 	uint16_t *elts = (uint16_t *)ctx->idxbuf + start;
 	int idxbias = ctx->idxbias;
 
 	if (vc & 1) {
-		OUT_RING(chan, RING_3D(NV30_3D_VB_ELEMENT_U32, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VB_ELEMENT_U32, 1);
 		OUT_RING  (chan, elts[0]);
 		elts++; vc--;
 	}
@@ -195,7 +204,7 @@ emit_elt16(void* priv, unsigned start, unsigned vc)
 		unsigned i;
 		unsigned push = MIN2(vc, 2047 * 2);
 
-		OUT_RING(chan, RING_3D_NI(NV30_3D_VB_ELEMENT_U16, push >> 1));
+		BEGIN_RING_NI(chan, eng3d, NV30_3D_VB_ELEMENT_U16, push >> 1);
 		for (i = 0; i < push; i+=2)
 			OUT_RING(chan, ((elts[i+1] + idxbias) << 16) | (elts[i] + idxbias));
 
@@ -208,6 +217,7 @@ static INLINE void
 emit_elt32(void* priv, unsigned start, unsigned vc)
 {
 	struct push_context* ctx = priv;
+	struct nouveau_grobj *eng3d = ctx->eng3d;
 	struct nouveau_channel *chan = ctx->chan;
 	uint32_t *elts = (uint32_t *)ctx->idxbuf + start;
 	int idxbias = ctx->idxbias;
@@ -215,8 +225,7 @@ emit_elt32(void* priv, unsigned start, unsigned vc)
 	while (vc) {
 		unsigned push = MIN2(vc, 2047);
 
-		OUT_RING(chan, RING_3D_NI(NV30_3D_VB_ELEMENT_U32, push));
-		assert(AVAIL_RING(chan) >= push);
+		BEGIN_RING_NI(chan, eng3d, NV30_3D_VB_ELEMENT_U32, push);
 		if(idxbias)
 		{
 			for(unsigned i = 0; i < push; ++i)
@@ -235,6 +244,7 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
 	struct nvfx_context *nvfx = nvfx_context(pipe);
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct push_context ctx;
 	struct util_split_prim s;
 	unsigned instances_left = info->instance_count;
@@ -251,6 +261,7 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 			+ 4; /* potential edgeflag enable/disable */
 
 	ctx.chan = nvfx->screen->base.channel;
+	ctx.eng3d = nvfx->screen->eng3d;
 	ctx.translate = nvfx->vtxelt->translate;
 	ctx.idxbuf = NULL;
 	ctx.vertex_length = nvfx->vtxelt->vertex_length;
@@ -333,8 +344,9 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 
 		nvfx->vtxelt->per_instance[i].base.fetch_rgba_float(v, per_instance[i].map, 0, 0);
 
-		WAIT_RING(chan, 5);
-		nvfx_emit_vtx_attr(chan, nvfx->vtxelt->per_instance[i].base.idx, v, nvfx->vtxelt->per_instance[i].base.ncomp);
+		nvfx_emit_vtx_attr(chan, eng3d,
+				   nvfx->vtxelt->per_instance[i].base.idx, v,
+				   nvfx->vtxelt->per_instance[i].base.ncomp);
 	}
 
 	/* per-instance loop */
@@ -374,15 +386,18 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 					int i;
 					for(i = 0; i < 32; ++i)
 					{
-						OUT_RING(chan, RING_3D(0x1dac, 1));
+						BEGIN_RING(chan, eng3d,
+							   0x1dac, 1);
 						OUT_RING(chan, 0);
 					}
 				}
 
-				OUT_RING(chan, RING_3D(NV30_3D_VERTEX_BEGIN_END, 1));
+				BEGIN_RING(chan, eng3d,
+					   NV30_3D_VERTEX_BEGIN_END, 1);
 				OUT_RING(chan, hw_mode);
 				done = util_split_prim_next(&s, max_verts);
-				OUT_RING(chan, RING_3D(NV30_3D_VERTEX_BEGIN_END, 1));
+				BEGIN_RING(chan, eng3d,
+					   NV30_3D_VERTEX_BEGIN_END, 1);
 				OUT_RING(chan, 0);
 
 				if(done)
@@ -406,8 +421,10 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 				per_instance[i].step = 0;
 
 				nvfx->vtxelt->per_instance[i].base.fetch_rgba_float(v, per_instance[i].map, 0, 0);
-				WAIT_RING(chan, 5);
-				nvfx_emit_vtx_attr(chan, nvfx->vtxelt->per_instance[i].base.idx, v, nvfx->vtxelt->per_instance[i].base.ncomp);
+				nvfx_emit_vtx_attr(chan, eng3d,
+						   nvfx->vtxelt->per_instance[i].base.idx,
+						   v,
+						   nvfx->vtxelt->per_instance[i].base.ncomp);
 			}
 		}
 	}
diff --git a/src/gallium/drivers/nvfx/nvfx_query.c b/src/gallium/drivers/nvfx/nvfx_query.c
index 3935ffd..3cd6bf1 100644
--- a/src/gallium/drivers/nvfx/nvfx_query.c
+++ b/src/gallium/drivers/nvfx/nvfx_query.c
@@ -49,6 +49,7 @@ nvfx_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nvfx_query *q = nvfx_query(pq);
 	struct nvfx_screen *screen = nvfx->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *eng3d = screen->eng3d;
 	uint64_t tmp;
 
 	assert(!nvfx->query);
@@ -72,10 +73,9 @@ nvfx_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 
 	nouveau_notifier_reset(nvfx->screen->query, q->object->start);
 
-	WAIT_RING(chan, 4);
-	OUT_RING(chan, RING_3D(NV30_3D_QUERY_RESET, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_QUERY_RESET, 1);
 	OUT_RING(chan, 1);
-	OUT_RING(chan, RING_3D(NV30_3D_QUERY_ENABLE, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_QUERY_ENABLE, 1);
 	OUT_RING(chan, 1);
 
 	q->ready = FALSE;
@@ -88,15 +88,15 @@ nvfx_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 {
 	struct nvfx_context *nvfx = nvfx_context(pipe);
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct nvfx_query *q = nvfx_query(pq);
 
 	assert(nvfx->query == pq);
 
-	WAIT_RING(chan, 4);
-	OUT_RING(chan, RING_3D(NV30_3D_QUERY_GET, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_QUERY_GET, 1);
 	OUT_RING  (chan, (0x01 << NV30_3D_QUERY_GET_UNK24__SHIFT) |
 		   ((q->object->start * 32) << NV30_3D_QUERY_GET_OFFSET__SHIFT));
-	OUT_RING(chan, RING_3D(NV30_3D_QUERY_ENABLE, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_QUERY_ENABLE, 1);
 	OUT_RING(chan, 0);
 	FIRE_RING(chan);
 
diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
index 92e1d33..aa1e956 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.c
+++ b/src/gallium/drivers/nvfx/nvfx_screen.c
@@ -301,98 +301,100 @@ nvfx_screen_destroy(struct pipe_screen *pscreen)
 static void nv30_screen_init(struct nvfx_screen *screen)
 {
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *eng3d = screen->eng3d;
 	int i;
 
 	/* TODO: perhaps we should do some of this on nv40 too? */
 	for (i=1; i<8; i++) {
-		OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_CLIP_HORIZ(i), 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_CLIP_HORIZ(i), 1);
 		OUT_RING(chan, 0);
-		OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_CLIP_VERT(i), 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_CLIP_VERT(i), 1);
 		OUT_RING(chan, 0);
 	}
 
-	OUT_RING(chan, RING_3D(0x220, 1));
+	BEGIN_RING(chan, eng3d, 0x220, 1);
 	OUT_RING(chan, 1);
 
-	OUT_RING(chan, RING_3D(0x03b0, 1));
+	BEGIN_RING(chan, eng3d, 0x03b0, 1);
 	OUT_RING(chan, 0x00100000);
-	OUT_RING(chan, RING_3D(0x1454, 1));
+	BEGIN_RING(chan, eng3d, 0x1454, 1);
 	OUT_RING(chan, 0);
-	OUT_RING(chan, RING_3D(0x1d80, 1));
+	BEGIN_RING(chan, eng3d, 0x1d80, 1);
 	OUT_RING(chan, 3);
-	OUT_RING(chan, RING_3D(0x1450, 1));
+	BEGIN_RING(chan, eng3d, 0x1450, 1);
 	OUT_RING(chan, 0x00030004);
 
 	/* NEW */
-	OUT_RING(chan, RING_3D(0x1e98, 1));
+	BEGIN_RING(chan, eng3d, 0x1e98, 1);
 	OUT_RING(chan, 0);
-	OUT_RING(chan, RING_3D(0x17e0, 3));
+	BEGIN_RING(chan, eng3d, 0x17e0, 3);
 	OUT_RING(chan, fui(0.0));
 	OUT_RING(chan, fui(0.0));
 	OUT_RING(chan, fui(1.0));
-	OUT_RING(chan, RING_3D(0x1f80, 16));
+	BEGIN_RING(chan, eng3d, 0x1f80, 16);
 	for (i=0; i<16; i++) {
 		OUT_RING(chan, (i==8) ? 0x0000ffff : 0);
 	}
 
-	OUT_RING(chan, RING_3D(0x120, 3));
+	BEGIN_RING(chan, eng3d, 0x120, 3);
 	OUT_RING(chan, 0);
 	OUT_RING(chan, 1);
 	OUT_RING(chan, 2);
 
-	OUT_RING(chan, RING_3D(0x1d88, 1));
+	BEGIN_RING(chan, eng3d, 0x1d88, 1);
 	OUT_RING(chan, 0x00001200);
 
-	OUT_RING(chan, RING_3D(NV30_3D_RC_ENABLE, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_RC_ENABLE, 1);
 	OUT_RING(chan, 0);
 
-	OUT_RING(chan, RING_3D(NV30_3D_DEPTH_RANGE_NEAR, 2));
+	BEGIN_RING(chan, eng3d, NV30_3D_DEPTH_RANGE_NEAR, 2);
 	OUT_RING(chan, fui(0.0));
 	OUT_RING(chan, fui(1.0));
 
-	OUT_RING(chan, RING_3D(NV30_3D_MULTISAMPLE_CONTROL, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_MULTISAMPLE_CONTROL, 1);
 	OUT_RING(chan, 0xffff0000);
 
 	/* enables use of vp rather than fixed-function somehow */
-	OUT_RING(chan, RING_3D(0x1e94, 1));
+	BEGIN_RING(chan, eng3d, 0x1e94, 1);
 	OUT_RING(chan, 0x13);
 }
 
 static void nv40_screen_init(struct nvfx_screen *screen)
 {
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *eng3d = screen->eng3d;
 
-	OUT_RING(chan, RING_3D(NV40_3D_DMA_COLOR2, 2));
+	BEGIN_RING(chan, eng3d, NV40_3D_DMA_COLOR2, 2);
 	OUT_RING(chan, screen->base.channel->vram->handle);
 	OUT_RING(chan, screen->base.channel->vram->handle);
 
-	OUT_RING(chan, RING_3D(0x1450, 1));
+	BEGIN_RING(chan, eng3d, 0x1450, 1);
 	OUT_RING(chan, 0x00000004);
 
-	OUT_RING(chan, RING_3D(0x1ea4, 3));
+	BEGIN_RING(chan, eng3d, 0x1ea4, 3);
 	OUT_RING(chan, 0x00000010);
 	OUT_RING(chan, 0x01000100);
 	OUT_RING(chan, 0xff800006);
 
 	/* vtxprog output routing */
-	OUT_RING(chan, RING_3D(0x1fc4, 1));
+	BEGIN_RING(chan, eng3d, 0x1fc4, 1);
 	OUT_RING(chan, 0x06144321);
-	OUT_RING(chan, RING_3D(0x1fc8, 2));
+	BEGIN_RING(chan, eng3d, 0x1fc8, 2);
 	OUT_RING(chan, 0xedcba987);
 	OUT_RING(chan, 0x0000006f);
-	OUT_RING(chan, RING_3D(0x1fd0, 1));
+	BEGIN_RING(chan, eng3d, 0x1fd0, 1);
 	OUT_RING(chan, 0x00171615);
-	OUT_RING(chan, RING_3D(0x1fd4, 1));
+	BEGIN_RING(chan, eng3d, 0x1fd4, 1);
 	OUT_RING(chan, 0x001b1a19);
 
-	OUT_RING(chan, RING_3D(0x1ef8, 1));
+	BEGIN_RING(chan, eng3d, 0x1ef8, 1);
 	OUT_RING(chan, 0x0020ffff);
-	OUT_RING(chan, RING_3D(0x1d64, 1));
+	BEGIN_RING(chan, eng3d, 0x1d64, 1);
 	OUT_RING(chan, 0x01d300d4);
-	OUT_RING(chan, RING_3D(0x1e94, 1));
+	BEGIN_RING(chan, eng3d, 0x1e94, 1);
 	OUT_RING(chan, 0x00000001);
 
-	OUT_RING(chan, RING_3D(NV40_3D_MIPMAP_ROUNDING, 1));
+	BEGIN_RING(chan, eng3d, NV40_3D_MIPMAP_ROUNDING, 1);
 	OUT_RING(chan, NV40_3D_MIPMAP_ROUNDING_MODE_DOWN);
 }
 
@@ -571,25 +573,25 @@ nvfx_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* Static eng3d initialisation */
 	/* note that we just started using the channel, so we must have space in the pushbuffer */
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_NOTIFY, 1));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_NOTIFY, 1);
 	OUT_RING(chan, screen->sync->handle);
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_TEXTURE0, 2));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_TEXTURE0, 2);
 	OUT_RING(chan, chan->vram->handle);
 	OUT_RING(chan, chan->gart->handle);
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_COLOR1, 1));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_COLOR1, 1);
 	OUT_RING(chan, chan->vram->handle);
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_COLOR0, 2));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_COLOR0, 2);
 	OUT_RING(chan, chan->vram->handle);
 	OUT_RING(chan, chan->vram->handle);
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_VTXBUF0, 2));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_VTXBUF0, 2);
 	OUT_RING(chan, chan->vram->handle);
 	OUT_RING(chan, chan->gart->handle);
 
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_FENCE, 2));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_FENCE, 2);
 	OUT_RING(chan, 0);
 	OUT_RING(chan, screen->query->handle);
 
-	OUT_RING(chan, RING_3D(NV30_3D_DMA_UNK1AC, 2));
+	BEGIN_RING(chan, screen->eng3d, NV30_3D_DMA_UNK1AC, 2);
 	OUT_RING(chan, chan->vram->handle);
 	OUT_RING(chan, chan->vram->handle);
 
diff --git a/src/gallium/drivers/nvfx/nvfx_state_emit.c b/src/gallium/drivers/nvfx/nvfx_state_emit.c
index 501fdd4..40ae4f5 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_emit.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_emit.c
@@ -7,11 +7,11 @@ void
 nvfx_state_viewport_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct pipe_viewport_state *vpt = &nvfx->viewport;
 
-	WAIT_RING(chan, 11);
 	if(nvfx->render_mode == HW) {
-		OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_TRANSLATE_X, 8));
+		BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_TRANSLATE_X, 8);
 		OUT_RINGf(chan, vpt->translate[0]);
 		OUT_RINGf(chan, vpt->translate[1]);
 		OUT_RINGf(chan, vpt->translate[2]);
@@ -20,10 +20,10 @@ nvfx_state_viewport_validate(struct nvfx_context *nvfx)
 		OUT_RINGf(chan, vpt->scale[1]);
 		OUT_RINGf(chan, vpt->scale[2]);
 		OUT_RINGf(chan, vpt->scale[3]);
-		OUT_RING(chan, RING_3D(0x1d78, 1));
+		BEGIN_RING(chan, eng3d, 0x1d78, 1);
 		OUT_RING(chan, 1);
 	} else {
-		OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_TRANSLATE_X, 8));
+		BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_TRANSLATE_X, 8);
 		OUT_RINGf(chan, 0.0f);
 		OUT_RINGf(chan, 0.0f);
 		OUT_RINGf(chan, 0.0f);
@@ -32,7 +32,7 @@ nvfx_state_viewport_validate(struct nvfx_context *nvfx)
 		OUT_RINGf(chan, 1.0f);
 		OUT_RINGf(chan, 1.0f);
 		OUT_RINGf(chan, 1.0f);
-		OUT_RING(chan, RING_3D(0x1d78, 1));
+		BEGIN_RING(chan, eng3d, 0x1d78, 1);
 		OUT_RING(chan, nvfx->is_nv4x ? 0x110 : 1);
 	}
 }
@@ -41,6 +41,7 @@ void
 nvfx_state_scissor_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct pipe_rasterizer_state *rast = &nvfx->rasterizer->pipe;
 	struct pipe_scissor_state *s = &nvfx->scissor;
 
@@ -48,8 +49,7 @@ nvfx_state_scissor_validate(struct nvfx_context *nvfx)
 		return;
 	nvfx->state.scissor_enabled = rast->scissor;
 
-	WAIT_RING(chan, 3);
-	OUT_RING(chan, RING_3D(NV30_3D_SCISSOR_HORIZ, 2));
+	BEGIN_RING(chan, eng3d, NV30_3D_SCISSOR_HORIZ, 2);
 	if (nvfx->state.scissor_enabled) {
 		OUT_RING(chan, ((s->maxx - s->minx) << 16) | s->minx);
 		OUT_RING(chan, ((s->maxy - s->miny) << 16) | s->miny);
@@ -63,12 +63,12 @@ void
 nvfx_state_sr_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct pipe_stencil_ref *sr = &nvfx->stencil_ref;
 
-	WAIT_RING(chan, 4);
-	OUT_RING(chan, RING_3D(NV30_3D_STENCIL_FUNC_REF(0), 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_STENCIL_FUNC_REF(0), 1);
 	OUT_RING(chan, sr->ref_value[0]);
-	OUT_RING(chan, RING_3D(NV30_3D_STENCIL_FUNC_REF(1), 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_STENCIL_FUNC_REF(1), 1);
 	OUT_RING(chan, sr->ref_value[1]);
 }
 
@@ -76,10 +76,10 @@ void
 nvfx_state_blend_colour_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	struct pipe_blend_color *bcol = &nvfx->blend_colour;
 
-	WAIT_RING(chan, 2);
-	OUT_RING(chan, RING_3D(NV30_3D_BLEND_COLOR, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_BLEND_COLOR, 1);
 	OUT_RING(chan, ((float_to_ubyte(bcol->color[3]) << 24) |
 		       (float_to_ubyte(bcol->color[0]) << 16) |
 		       (float_to_ubyte(bcol->color[1]) <<  8) |
@@ -90,9 +90,9 @@ void
 nvfx_state_stipple_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 
-	WAIT_RING(chan, 33);
-	OUT_RING(chan, RING_3D(NV30_3D_POLYGON_STIPPLE_PATTERN(0), 32));
+	BEGIN_RING(chan, eng3d, NV30_3D_POLYGON_STIPPLE_PATTERN(0), 32);
 	OUT_RINGp(chan, nvfx->stipple, 32);
 }
 
@@ -100,12 +100,12 @@ static void
 nvfx_coord_conventions_validate(struct nvfx_context* nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned value = nvfx->hw_fragprog->coord_conventions;
 	if(value & NV30_3D_COORD_CONVENTIONS_ORIGIN_INVERTED)
 		value |= nvfx->framebuffer.height << NV30_3D_COORD_CONVENTIONS_HEIGHT__SHIFT;
 
-	WAIT_RING(chan, 2);
-	OUT_RING(chan, RING_3D(NV30_3D_COORD_CONVENTIONS, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_COORD_CONVENTIONS, 1);
 	OUT_RING(chan, value);
 }
 
@@ -113,6 +113,7 @@ static void
 nvfx_ucp_validate(struct nvfx_context* nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned enables[7] =
 	{
 			0,
@@ -126,17 +127,15 @@ nvfx_ucp_validate(struct nvfx_context* nvfx)
 
 	if(!nvfx->use_vp_clipping)
 	{
-		WAIT_RING(chan, 2);
-		OUT_RING(chan, RING_3D(NV30_3D_VP_CLIP_PLANES_ENABLE, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_CLIP_PLANES_ENABLE, 1);
 		OUT_RING(chan, 0);
 
-		WAIT_RING(chan, 6 * 4 + 1);
-		OUT_RING(chan, RING_3D(NV30_3D_VP_CLIP_PLANE(0, 0), nvfx->clip.nr * 4));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_CLIP_PLANE(0, 0),
+			   nvfx->clip.nr * 4);
 		OUT_RINGp(chan, &nvfx->clip.ucp[0][0], nvfx->clip.nr * 4);
 	}
 
-	WAIT_RING(chan, 2);
-	OUT_RING(chan, RING_3D(NV30_3D_VP_CLIP_PLANES_ENABLE, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_VP_CLIP_PLANES_ENABLE, 1);
 	OUT_RING(chan, enables[nvfx->clip.nr]);
 }
 
@@ -144,38 +143,37 @@ static void
 nvfx_vertprog_ucp_validate(struct nvfx_context* nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned i;
 	struct nvfx_vertex_program* vp = nvfx->hw_vertprog;
 	if(nvfx->clip.nr != vp->clip_nr)
 	{
 		unsigned idx;
-		WAIT_RING(chan, 14);
 
 		/* remove last instruction bit */
 		if(vp->clip_nr >= 0)
 		{
 			idx = vp->nr_insns - 7 + vp->clip_nr;
-			OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_FROM_ID, 1));
+			BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_FROM_ID, 1);
 			OUT_RING(chan,  vp->exec->start + idx);
-			OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_INST(0), 4));
+			BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_INST(0), 4);
 			OUT_RINGp (chan, vp->insns[idx].data, 4);
 		}
 
 		 /* set last instruction bit */
 		idx = vp->nr_insns - 7 + nvfx->clip.nr;
-		OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_FROM_ID, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_FROM_ID, 1);
 		OUT_RING(chan,  vp->exec->start + idx);
-		OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_INST(0), 4));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_INST(0), 4);
 		OUT_RINGp(chan, vp->insns[idx].data, 3);
 		OUT_RING(chan, vp->insns[idx].data[3] | 1);
 		vp->clip_nr = nvfx->clip.nr;
 	}
 
 	// TODO: only do this for the ones changed
-	WAIT_RING(chan, 6 * 6);
 	for(i = 0; i < nvfx->clip.nr; ++i)
 	{
-		OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_CONST_ID, 5));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_CONST_ID, 5);
 		OUT_RING(chan, vp->data->start + i);
 		OUT_RINGp (chan, nvfx->clip.ucp[i], 4);
 	}
@@ -185,6 +183,7 @@ static boolean
 nvfx_state_validate_common(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned dirty;
 	unsigned still_dirty = 0;
 	int new_fb_mode = -1; /* 1 = all swizzled, 0 = make all linear */
@@ -287,8 +286,7 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 
 		if(vp_output != nvfx->hw_vp_output)
 		{
-			WAIT_RING(chan, 2);
-			OUT_RING(chan, RING_3D(NV40_3D_VP_RESULT_EN, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_VP_RESULT_EN, 1);
 			OUT_RING(chan, vp_output);
 			nvfx->hw_vp_output = vp_output;
 		}
@@ -320,8 +318,7 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 
 	if(dirty & NVFX_NEW_ZSA || (new_fb_mode >= 0))
 	{
-		WAIT_RING(chan, 3);
-		OUT_RING(chan, RING_3D(NV30_3D_DEPTH_WRITE_ENABLE, 2));
+		BEGIN_RING(chan, eng3d, NV30_3D_DEPTH_WRITE_ENABLE, 2);
 		OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.writemask);
 	        OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.enabled);
 	}
@@ -334,10 +331,9 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		// TODO: what about nv30?
 		if(nvfx->is_nv4x)
 		{
-			WAIT_RING(chan, 4);
-			OUT_RING(chan, RING_3D(NV40_3D_TEX_CACHE_CTL, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_TEX_CACHE_CTL, 1);
 			OUT_RING(chan, 2);
-			OUT_RING(chan, RING_3D(NV40_3D_TEX_CACHE_CTL, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_TEX_CACHE_CTL, 1);
 			OUT_RING(chan, 1);
 		}
 	}
diff --git a/src/gallium/drivers/nvfx/nvfx_state_fb.c b/src/gallium/drivers/nvfx/nvfx_state_fb.c
index 816bb89..f9fed94 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_fb.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_fb.c
@@ -96,6 +96,7 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 {
 	struct pipe_framebuffer_state *fb = &nvfx->framebuffer;
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	uint32_t rt_enable, rt_format;
 	int i;
 	unsigned rt_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
@@ -204,11 +205,11 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 
 		//printf("rendering to bo %p [%i] at offset %i with pitch %i\n", rt0->bo, rt0->bo->handle, rt0->offset, pitch);
 
-		OUT_RING(chan, RING_3D(NV30_3D_DMA_COLOR0, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_DMA_COLOR0, 1);
 		OUT_RELOC(chan, rt0->bo, 0,
 			      rt_flags | NOUVEAU_BO_OR,
 			      chan->vram->handle, chan->gart->handle);
-		OUT_RING(chan, RING_3D(NV30_3D_COLOR0_PITCH, 2));
+		BEGIN_RING(chan, eng3d, NV30_3D_COLOR0_PITCH, 2);
 		OUT_RING(chan, pitch);
 		OUT_RELOC(chan, rt0->bo,
 			      rt0->offset, rt_flags | NOUVEAU_BO_LOW,
@@ -216,11 +217,11 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 	}
 
 	if (rt_enable & NV30_3D_RT_ENABLE_COLOR1) {
-		OUT_RING(chan, RING_3D(NV30_3D_DMA_COLOR1, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_DMA_COLOR1, 1);
 		OUT_RELOC(chan, nvfx->hw_rt[1].bo, 0,
 			      rt_flags | NOUVEAU_BO_OR,
 			      chan->vram->handle, chan->gart->handle);
-		OUT_RING(chan, RING_3D(NV30_3D_COLOR1_OFFSET, 2));
+		BEGIN_RING(chan, eng3d, NV30_3D_COLOR1_OFFSET, 2);
 		OUT_RELOC(chan, nvfx->hw_rt[1].bo,
 				nvfx->hw_rt[1].offset, rt_flags | NOUVEAU_BO_LOW,
 			      0, 0);
@@ -230,68 +231,68 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 	if(nvfx->is_nv4x)
 	{
 		if (rt_enable & NV40_3D_RT_ENABLE_COLOR2) {
-			OUT_RING(chan, RING_3D(NV40_3D_DMA_COLOR2, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_DMA_COLOR2, 1);
 			OUT_RELOC(chan, nvfx->hw_rt[2].bo, 0,
 				      rt_flags | NOUVEAU_BO_OR,
 				      chan->vram->handle, chan->gart->handle);
-			OUT_RING(chan, RING_3D(NV40_3D_COLOR2_OFFSET, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_COLOR2_OFFSET, 1);
 			OUT_RELOC(chan, nvfx->hw_rt[2].bo,
 				      nvfx->hw_rt[2].offset, rt_flags | NOUVEAU_BO_LOW,
 				      0, 0);
-			OUT_RING(chan, RING_3D(NV40_3D_COLOR2_PITCH, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_COLOR2_PITCH, 1);
 			OUT_RING(chan, nvfx->hw_rt[2].pitch);
 		}
 
 		if (rt_enable & NV40_3D_RT_ENABLE_COLOR3) {
-			OUT_RING(chan, RING_3D(NV40_3D_DMA_COLOR3, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_DMA_COLOR3, 1);
 			OUT_RELOC(chan, nvfx->hw_rt[3].bo, 0,
 				      rt_flags | NOUVEAU_BO_OR,
 				      chan->vram->handle, chan->gart->handle);
-			OUT_RING(chan, RING_3D(NV40_3D_COLOR3_OFFSET, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_COLOR3_OFFSET, 1);
 			OUT_RELOC(chan, nvfx->hw_rt[3].bo,
 					nvfx->hw_rt[3].offset, rt_flags | NOUVEAU_BO_LOW,
 				      0, 0);
-			OUT_RING(chan, RING_3D(NV40_3D_COLOR3_PITCH, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_COLOR3_PITCH, 1);
 			OUT_RING(chan, nvfx->hw_rt[3].pitch);
 		}
 	}
 
 	if (fb->zsbuf) {
-		OUT_RING(chan, RING_3D(NV30_3D_DMA_ZETA, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_DMA_ZETA, 1);
 		OUT_RELOC(chan, nvfx->hw_zeta.bo, 0,
 			      rt_flags | NOUVEAU_BO_OR,
 			      chan->vram->handle, chan->gart->handle);
-		OUT_RING(chan, RING_3D(NV30_3D_ZETA_OFFSET, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_ZETA_OFFSET, 1);
 		/* TODO: reverse engineer LMA */
 		OUT_RELOC(chan, nvfx->hw_zeta.bo,
 			     nvfx->hw_zeta.offset, rt_flags | NOUVEAU_BO_LOW, 0, 0);
 	        if(nvfx->is_nv4x) {
-			OUT_RING(chan, RING_3D(NV40_3D_ZETA_PITCH, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_ZETA_PITCH, 1);
 			OUT_RING(chan, nvfx->hw_zeta.pitch);
 		}
 	}
 	else if(nvfx->is_nv4x) {
-		OUT_RING(chan, RING_3D(NV40_3D_ZETA_PITCH, 1));
+		BEGIN_RING(chan, eng3d, NV40_3D_ZETA_PITCH, 1);
 		OUT_RING(chan, 64);
 	}
 
-	OUT_RING(chan, RING_3D(NV30_3D_RT_ENABLE, 1));
+	BEGIN_RING(chan, eng3d, NV30_3D_RT_ENABLE, 1);
 	OUT_RING(chan, rt_enable);
-	OUT_RING(chan, RING_3D(NV30_3D_RT_HORIZ, 3));
+	BEGIN_RING(chan, eng3d, NV30_3D_RT_HORIZ, 3);
 	OUT_RING(chan, (w << 16) | 0);
 	OUT_RING(chan, (h << 16) | 0);
 	OUT_RING(chan, rt_format);
-	OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_HORIZ, 2));
+	BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_HORIZ, 2);
 	OUT_RING(chan, (w << 16) | 0);
 	OUT_RING(chan, (h << 16) | 0);
-	OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_CLIP_HORIZ(0), 2));
+	BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_CLIP_HORIZ(0), 2);
 	OUT_RING(chan, ((w - 1) << 16) | 0);
 	OUT_RING(chan, ((h - 1) << 16) | 0);
 
 	if(!nvfx->is_nv4x) {
 		/* Wonder why this is needed, context should all be set to zero on init */
 		/* TODO: we can most likely remove this, after putting it in context init */
-		OUT_RING(chan, RING_3D(NV30_3D_VIEWPORT_TX_ORIGIN, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VIEWPORT_TX_ORIGIN, 1);
 		OUT_RING(chan, 0);
 	}
 	nvfx->relocs_needed &=~ NVFX_RELOCATE_FRAMEBUFFER;
diff --git a/src/gallium/drivers/nvfx/nvfx_surface.c b/src/gallium/drivers/nvfx/nvfx_surface.c
index 6fd6c47..be31853 100644
--- a/src/gallium/drivers/nvfx/nvfx_surface.c
+++ b/src/gallium/drivers/nvfx/nvfx_surface.c
@@ -168,8 +168,8 @@ nvfx_get_blitter(struct pipe_context* pipe, int copy)
 	if(nvfx->query && !nvfx->blitters_in_use)
 	{
 		struct nouveau_channel* chan = nvfx->screen->base.channel;
-		WAIT_RING(chan, 2);
-		OUT_RING(chan, RING_3D(NV30_3D_QUERY_ENABLE, 1));
+		struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
+		BEGIN_RING(chan, eng3d, NV30_3D_QUERY_ENABLE, 1);
 		OUT_RING(chan, 0);
 	}
 
@@ -209,8 +209,8 @@ nvfx_put_blitter(struct pipe_context* pipe, struct blitter_context* blitter)
 	if(nvfx->query && !nvfx->blitters_in_use)
 	{
 		struct nouveau_channel* chan = nvfx->screen->base.channel;
-		WAIT_RING(chan, 2);
-		OUT_RING(chan, RING_3D(NV30_3D_QUERY_ENABLE, 1));
+		struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
+		BEGIN_RING(chan, eng3d, NV30_3D_QUERY_ENABLE, 1);
 		OUT_RING(chan, 1);
 	}
 }
diff --git a/src/gallium/drivers/nvfx/nvfx_vbo.c b/src/gallium/drivers/nvfx/nvfx_vbo.c
index 597664e..5853683 100644
--- a/src/gallium/drivers/nvfx/nvfx_vbo.c
+++ b/src/gallium/drivers/nvfx/nvfx_vbo.c
@@ -247,6 +247,7 @@ boolean
 nvfx_vbo_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	int i;
 	int elements = MAX2(nvfx->vtxelt->num_elements, nvfx->hw_vtxelt_nr);
 	unsigned vb_flags = nvfx->screen->vertex_buffer_reloc_flags | NOUVEAU_BO_RD;
@@ -262,11 +263,11 @@ nvfx_vbo_validate(struct nvfx_context *nvfx)
 		struct nvfx_buffer* buffer = nvfx_buffer(vb->buffer);
 		float v[4];
 		ve->fetch_rgba_float(v, buffer->data + vb->buffer_offset + ve->src_offset, 0, 0);
-		nvfx_emit_vtx_attr(chan, ve->idx, v, ve->ncomp);
+		nvfx_emit_vtx_attr(chan, eng3d, ve->idx, v, ve->ncomp);
 	}
 
 
-	OUT_RING(chan, RING_3D(NV30_3D_VTXFMT(0), elements));
+	BEGIN_RING(chan, eng3d, NV30_3D_VTXFMT(0), elements);
 	if(nvfx->use_vertex_buffers)
 	{
 		unsigned idx = 0;
@@ -297,12 +298,12 @@ nvfx_vbo_validate(struct nvfx_context *nvfx)
 		unsigned i;
 		/* seems to be some kind of cache flushing */
 		for(i = 0; i < 3; ++i) {
-			OUT_RING(chan, RING_3D(0x1718, 1));
+			BEGIN_RING(chan, eng3d, 0x1718, 1);
 			OUT_RING(chan, 0);
 		}
 	}
 
-	OUT_RING(chan, RING_3D(NV30_3D_VTXBUF(0), elements));
+	BEGIN_RING(chan, eng3d, NV30_3D_VTXBUF(0), elements);
 	if(nvfx->use_vertex_buffers)
 	{
 		unsigned idx = 0;
@@ -330,7 +331,7 @@ nvfx_vbo_validate(struct nvfx_context *nvfx)
 			OUT_RING(chan, 0);
 	}
 
-	OUT_RING(chan, RING_3D(0x1710, 1));
+	BEGIN_RING(chan, eng3d, 0x1710, 1);
 	OUT_RING(chan, 0);
 
 	nvfx->hw_vtxelt_nr = nvfx->vtxelt->num_elements;
@@ -342,15 +343,14 @@ void
 nvfx_vbo_swtnl_validate(struct nvfx_context *nvfx)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned num_outputs = nvfx->vertprog->draw_elements;
 	int elements = MAX2(num_outputs, nvfx->hw_vtxelt_nr);
 
 	if (!elements)
 		return;
 
-	WAIT_RING(chan, (1 + 6 + 1 + 2) + elements * 2);
-
-	OUT_RING(chan, RING_3D(NV30_3D_VTXFMT(0), elements));
+	BEGIN_RING(chan, eng3d, NV30_3D_VTXFMT(0), elements);
 	for(unsigned i = 0; i < num_outputs; ++i)
 		OUT_RING(chan, (4 << NV30_3D_VTXFMT_SIZE__SHIFT) | NV30_3D_VTXFMT_TYPE_V32_FLOAT);
 	for(unsigned i = num_outputs; i < elements; ++i)
@@ -360,16 +360,16 @@ nvfx_vbo_swtnl_validate(struct nvfx_context *nvfx)
 		unsigned i;
 		/* seems to be some kind of cache flushing */
 		for(i = 0; i < 3; ++i) {
-			OUT_RING(chan, RING_3D(0x1718, 1));
+			BEGIN_RING(chan, eng3d, 0x1718, 1);
 			OUT_RING(chan, 0);
 		}
 	}
 
-	OUT_RING(chan, RING_3D(NV30_3D_VTXBUF(0), elements));
+	BEGIN_RING(chan, eng3d, NV30_3D_VTXBUF(0), elements);
 	for (unsigned i = 0; i < elements; i++)
 		OUT_RING(chan, 0);
 
-	OUT_RING(chan, RING_3D(0x1710, 1));
+	BEGIN_RING(chan, eng3d, 0x1710, 1);
 	OUT_RING(chan, 0);
 
 	nvfx->hw_vtxelt_nr = num_outputs;
@@ -408,6 +408,7 @@ static void
 nvfx_idxbuf_emit(struct nvfx_context* nvfx, unsigned ib_flags)
 {
 	struct nouveau_channel* chan = nvfx->screen->base.channel;
+	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned ib_format = (nvfx->idxbuf.index_size == 2) ? NV30_3D_IDXBUF_FORMAT_TYPE_U16 : NV30_3D_IDXBUF_FORMAT_TYPE_U32;
 	struct nouveau_bo* bo = nvfx_resource(nvfx->idxbuf.buffer)->bo;
 	ib_flags |= nvfx->screen->index_buffer_reloc_flags | NOUVEAU_BO_RD;
diff --git a/src/gallium/drivers/nvfx/nvfx_vertprog.c b/src/gallium/drivers/nvfx/nvfx_vertprog.c
index e543fda..a11941f 100644
--- a/src/gallium/drivers/nvfx/nvfx_vertprog.c
+++ b/src/gallium/drivers/nvfx/nvfx_vertprog.c
@@ -1182,6 +1182,7 @@ nvfx_vertprog_validate(struct nvfx_context *nvfx)
 {
 	struct nvfx_screen *screen = nvfx->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *eng3d = screen->eng3d;
 	struct nvfx_pipe_vertex_program *pvp = nvfx->vertprog;
 	struct nvfx_vertex_program* vp;
 	struct pipe_resource *constbuf;
@@ -1341,7 +1342,6 @@ nvfx_vertprog_validate(struct nvfx_context *nvfx)
 		}
 		*/
 
-		WAIT_RING(chan, 6 * vp->nr_consts);
 		for (i = nvfx->use_vp_clipping ? 6 : 0; i < vp->nr_consts; i++) {
 			struct nvfx_vertex_program_data *vpd = &vp->consts[i];
 
@@ -1356,7 +1356,7 @@ nvfx_vertprog_validate(struct nvfx_context *nvfx)
 
 			//printf("upload into %i + %i: %f %f %f %f\n", vp->data->start, i, vpd->value[0], vpd->value[1], vpd->value[2], vpd->value[3]);
 
-			OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_CONST_ID, 5));
+			BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_CONST_ID, 5);
 			OUT_RING(chan, i + vp->data->start);
 			OUT_RINGp(chan, (uint32_t *)vpd->value, 4);
 		}
@@ -1364,11 +1364,10 @@ nvfx_vertprog_validate(struct nvfx_context *nvfx)
 
 	/* Upload vtxprog */
 	if (upload_code) {
-		WAIT_RING(chan, 2 + 5 * vp->nr_insns);
-		OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_FROM_ID, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_FROM_ID, 1);
 		OUT_RING(chan, vp->exec->start);
 		for (i = 0; i < vp->nr_insns; i++) {
-			OUT_RING(chan, RING_3D(NV30_3D_VP_UPLOAD_INST(0), 4));
+			BEGIN_RING(chan, eng3d, NV30_3D_VP_UPLOAD_INST(0), 4);
 			//printf("%08x %08x %08x %08x\n", vp->insns[i].data[0], vp->insns[i].data[1], vp->insns[i].data[2], vp->insns[i].data[3]);
 			OUT_RINGp(chan, vp->insns[i].data, 4);
 		}
@@ -1377,11 +1376,10 @@ nvfx_vertprog_validate(struct nvfx_context *nvfx)
 
 	if(nvfx->dirty & (NVFX_NEW_VERTPROG))
 	{
-		WAIT_RING(chan, 6);
-		OUT_RING(chan, RING_3D(NV30_3D_VP_START_FROM_ID, 1));
+		BEGIN_RING(chan, eng3d, NV30_3D_VP_START_FROM_ID, 1);
 		OUT_RING(chan, vp->exec->start);
 		if(nvfx->is_nv4x) {
-			OUT_RING(chan, RING_3D(NV40_3D_VP_ATTRIB_EN, 1));
+			BEGIN_RING(chan, eng3d, NV40_3D_VP_ATTRIB_EN, 1);
 			OUT_RING(chan, vp->ir);
 		}
 	}
-- 
1.7.3.3
