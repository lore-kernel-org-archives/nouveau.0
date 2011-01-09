From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH 1/2] nouveau: fix after libdrm_nouveau reloc
	API changes
Date: Sun,  9 Jan 2011 18:31:02 +0100
Message-ID: <1294594263-1862-5-git-send-email-marcin.slusarz@gmail.com>
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

---
 src/gallium/drivers/nouveau/nouveau_stateobj.h  |    2 +-
 src/gallium/drivers/nv50/nv50_tex.c             |    4 ++--
 src/gallium/drivers/nvc0/nvc0_winsys.h          |    2 +-
 src/mesa/drivers/dri/nouveau/nouveau_bo_state.c |    9 +++------
 src/mesa/drivers/dri/nouveau/nouveau_bo_state.h |    8 +++-----
 src/mesa/drivers/dri/nouveau/nv04_state_tex.c   |    4 ++--
 src/mesa/drivers/dri/nouveau/nv10_state_tex.c   |    2 +-
 src/mesa/drivers/dri/nouveau/nv20_render.c      |    2 +-
 src/mesa/drivers/dri/nouveau/nv20_state_tex.c   |    2 +-
 9 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index e920cf9..7b06518 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -259,7 +259,7 @@ so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 
 		if ((ret = nouveau_pushbuf_emit_reloc(chan, chan->cur - nr +
 						r->push_offset, r->bo, r->data,
-						0, r->flags, r->vor, r->tor))) {
+						r->flags, r->vor, r->tor))) {
 			debug_printf("so_emit failed reloc with error %d\n", ret);
 			assert(0);
 		}
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index 9243f9e..ffa033b 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -186,10 +186,10 @@ nv50_emit_texture_relocs(struct nv50_context *nv50, int prog)
 			continue;
 		mt = nv50_miptree(view->pipe.texture);
 
-		nouveau_reloc_emit(chan, tic, base + 4, NULL, mt->base.bo, 0, 0,
+		nouveau_reloc_emit(chan, tic, base + 4, NULL, mt->base.bo, 0,
 				   NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 				   NOUVEAU_BO_LOW, 0, 0);
-		nouveau_reloc_emit(chan, tic, base + 8, NULL, mt->base.bo, 0, 0,
+		nouveau_reloc_emit(chan, tic, base + 8, NULL, mt->base.bo, 0,
 				   NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 				   NOUVEAU_BO_HIGH, view->tic[2], view->tic[2]);
 	}
diff --git a/src/gallium/drivers/nvc0/nvc0_winsys.h b/src/gallium/drivers/nvc0/nvc0_winsys.h
index 1544fb7..9b606b3 100644
--- a/src/gallium/drivers/nvc0/nvc0_winsys.h
+++ b/src/gallium/drivers/nvc0/nvc0_winsys.h
@@ -48,7 +48,7 @@ static INLINE void
 nouveau_bo_validate(struct nouveau_channel *chan,
                     struct nouveau_bo *bo, unsigned flags)
 {
-   nouveau_reloc_emit(chan, NULL, 0, NULL, bo, 0, 0, flags, 0, 0);
+   nouveau_reloc_emit(chan, NULL, 0, NULL, bo, 0, flags, 0, 0);
 }
 
 /* incremental methods */
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c b/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c
index 7eef8c1..8397c6f 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c
@@ -44,7 +44,7 @@ nouveau_bo_marker_emit(struct gl_context *ctx, struct nouveau_bo_marker *m,
 
 	if (flags) {
 		if (nouveau_pushbuf_emit_reloc(chan, chan->cur++, m->bo,
-					       packet, 0, flags |
+					       packet, flags |
 					       (m->flags & (NOUVEAU_BO_VRAM |
 							    NOUVEAU_BO_GART |
 							    NOUVEAU_BO_RDWR)),
@@ -55,8 +55,7 @@ nouveau_bo_marker_emit(struct gl_context *ctx, struct nouveau_bo_marker *m,
 	}
 
 	if (nouveau_pushbuf_emit_reloc(chan, chan->cur++, m->bo, m->data,
-				       m->data2, flags | m->flags,
-				       m->vor, m->tor))
+				       flags | m->flags, m->vor, m->tor))
 		goto fail;
 
 	return GL_TRUE;
@@ -85,8 +84,7 @@ nouveau_bo_context_grow(struct nouveau_bo_context *bctx)
 GLboolean
 nouveau_bo_mark(struct nouveau_bo_context *bctx, struct nouveau_grobj *gr,
 		uint32_t mthd, struct nouveau_bo *bo,
-		uint32_t data, uint32_t data2, uint32_t vor, uint32_t tor,
-		uint32_t flags)
+		uint32_t data, uint32_t vor, uint32_t tor, uint32_t flags)
 {
 	struct nouveau_bo_state *s = &to_nouveau_context(bctx->ctx)->bo;
 	struct nouveau_bo_marker *m;
@@ -102,7 +100,6 @@ nouveau_bo_mark(struct nouveau_bo_context *bctx, struct nouveau_grobj *gr,
 		.gr = gr,
 		.mthd = mthd,
 		.data = data,
-		.data2 = data2,
 		.vor = vor,
 		.tor = tor,
 		.flags = flags,
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_bo_state.h b/src/mesa/drivers/dri/nouveau/nouveau_bo_state.h
index 388a16a..8aba5d6 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_bo_state.h
+++ b/src/mesa/drivers/dri/nouveau/nouveau_bo_state.h
@@ -45,7 +45,6 @@ struct nouveau_bo_marker {
 
 	struct nouveau_bo *bo;
 	uint32_t data;
-	uint32_t data2;
 	uint32_t vor;
 	uint32_t tor;
 	uint32_t flags;
@@ -67,15 +66,14 @@ struct nouveau_bo_state {
 GLboolean
 nouveau_bo_mark(struct nouveau_bo_context *bctx, struct nouveau_grobj *gr,
 		uint32_t mthd, struct nouveau_bo *bo,
-		uint32_t data, uint32_t data2, uint32_t vor, uint32_t tor,
-		uint32_t flags);
+		uint32_t data, uint32_t vor, uint32_t tor, uint32_t flags);
 
 #define nouveau_bo_markl(bctx, gr, mthd, bo, data, flags)		\
-	nouveau_bo_mark(bctx, gr, mthd, bo, data, 0, 0, 0,		\
+	nouveau_bo_mark(bctx, gr, mthd, bo, data, 0, 0,			\
 			flags | NOUVEAU_BO_LOW);
 
 #define nouveau_bo_marko(bctx, gr, mthd, bo, flags)			\
-	nouveau_bo_mark(bctx, gr, mthd, bo, 0, 0,			\
+	nouveau_bo_mark(bctx, gr, mthd, bo, 0,				\
 			context_chan(ctx)->vram->handle,		\
 			context_chan(ctx)->gart->handle,		\
 			flags | NOUVEAU_BO_OR);
diff --git a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c b/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
index 5ed8b14..c0b1943 100644
--- a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
@@ -121,7 +121,7 @@ nv04_emit_tex_obj(struct gl_context *ctx, int emit)
 
 		nouveau_bo_mark(bctx, fahrenheit,
 				NV04_MULTITEX_TRIANGLE_FORMAT(i),
-				s->bo, format, 0,
+				s->bo, format,
 				NV04_MULTITEX_TRIANGLE_FORMAT_DMA_A,
 				NV04_MULTITEX_TRIANGLE_FORMAT_DMA_B,
 				bo_flags | NOUVEAU_BO_OR);
@@ -136,7 +136,7 @@ nv04_emit_tex_obj(struct gl_context *ctx, int emit)
 
 		nouveau_bo_mark(bctx, fahrenheit,
 				NV04_TEXTURED_TRIANGLE_FORMAT,
-				s->bo, format, 0,
+				s->bo, format,
 				NV04_TEXTURED_TRIANGLE_FORMAT_DMA_A,
 				NV04_TEXTURED_TRIANGLE_FORMAT_DMA_B,
 				bo_flags | NOUVEAU_BO_OR);
diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_tex.c b/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
index fda67b1..8a6f2bc 100644
--- a/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
@@ -215,7 +215,7 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
 
 	/* Write it to the hardware. */
 	nouveau_bo_mark(bctx, celsius, NV10_3D_TEX_FORMAT(i),
-			s->bo, tx_format, 0,
+			s->bo, tx_format,
 			NV10_3D_TEX_FORMAT_DMA0,
 			NV10_3D_TEX_FORMAT_DMA1,
 			bo_flags | NOUVEAU_BO_OR);
diff --git a/src/mesa/drivers/dri/nouveau/nv20_render.c b/src/mesa/drivers/dri/nouveau/nv20_render.c
index 2bdc85c..df70b70 100644
--- a/src/mesa/drivers/dri/nouveau/nv20_render.c
+++ b/src/mesa/drivers/dri/nouveau/nv20_render.c
@@ -168,7 +168,7 @@ nv20_render_bind_vertices(struct gl_context *ctx)
 
 		nouveau_bo_mark(bctx, kelvin,
 				NV20_3D_VTXBUF_OFFSET(i),
-				a->bo, a->offset, 0,
+				a->bo, a->offset,
 				0, NV20_3D_VTXBUF_OFFSET_DMA1,
 				NOUVEAU_BO_LOW | NOUVEAU_BO_OR |
 				NOUVEAU_BO_GART | NOUVEAU_BO_RD);
diff --git a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
index c362aca..2d5b010 100644
--- a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
@@ -227,7 +227,7 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
 
 	/* Write it to the hardware. */
 	nouveau_bo_mark(bctx, kelvin, NV20_3D_TEX_FORMAT(i),
-			s->bo, tx_format, 0,
+			s->bo, tx_format,
 			NV20_3D_TEX_FORMAT_DMA0,
 			NV20_3D_TEX_FORMAT_DMA1,
 			bo_flags | NOUVEAU_BO_OR);
-- 
1.7.3.3
