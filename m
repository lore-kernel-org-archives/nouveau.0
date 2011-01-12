From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH 3/2 ;
 )] gallium/nouveau: introduce so_reloc2 as so_reloc(high) +
 so_reloc(low)
Date: Wed, 12 Jan 2011 20:29:43 +0100
Message-ID: <20110112192943.GD3189@joi.lan>
References: <1294594263-1862-6-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1294594263-1862-6-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 src/gallium/drivers/nouveau/nouveau_stateobj.h |    8 ++++++++
 src/gallium/drivers/nv50/nv50_shader_state.c   |   15 +++------------
 src/gallium/drivers/nv50/nv50_state_validate.c |   15 +++++----------
 src/gallium/drivers/nv50/nv50_vbo.c            |   15 ++++-----------
 4 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index 7b06518..be8850b 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -211,6 +211,14 @@ so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
 	so->cur_reloc++;
 }
 
+static INLINE void 
+so_reloc2(struct nouveau_stateobj *so, struct nouveau_bo *bo,
+	 unsigned data, unsigned flags, unsigned vor, unsigned tor)
+{
+	so_reloc(so, bo, data, flags | NOUVEAU_BO_HIGH, vor, tor);
+	so_reloc(so, bo, data, flags | NOUVEAU_BO_LOW, vor, tor);
+}
+
 /* Determine if this buffer object is referenced by this state object. */
 static INLINE boolean
 so_bo_is_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo)
diff --git a/src/gallium/drivers/nv50/nv50_shader_state.c b/src/gallium/drivers/nv50/nv50_shader_state.c
index ffdd8b9..e3e47dd 100644
--- a/src/gallium/drivers/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nv50/nv50_shader_state.c
@@ -215,10 +215,7 @@ nv50_vp_update_stateobj(struct nv50_context *nv50, struct nv50_program *p)
    nv50_program_validate_code(nv50, p);
 
    so_method(so, tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
-   so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-             NOUVEAU_BO_HIGH, 0, 0);
-   so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-             NOUVEAU_BO_LOW, 0, 0);
+   so_reloc2(so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD, 0, 0);
    so_method(so, tesla, NV50TCL_VP_ATTR_EN_0, 2);
    so_data  (so, p->vp.attrs[0]);
    so_data  (so, p->vp.attrs[1]);
@@ -242,10 +239,7 @@ nv50_fp_update_stateobj(struct nv50_context *nv50, struct nv50_program *p)
    nv50_program_validate_code(nv50, p);
 
    so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
-   so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-             NOUVEAU_BO_HIGH, 0, 0);
-   so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-             NOUVEAU_BO_LOW, 0, 0);
+   so_reloc2(so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD, 0, 0);
    so_method(so, tesla, NV50TCL_FP_REG_ALLOC_TEMP, 1);
    so_data  (so, p->max_gpr);
    so_method(so, tesla, NV50TCL_FP_RESULT_COUNT, 1);
@@ -270,10 +264,7 @@ nv50_gp_update_stateobj(struct nv50_context *nv50, struct nv50_program *p)
    nv50_program_validate_code(nv50, p);
 
    so_method(so, tesla, NV50TCL_GP_ADDRESS_HIGH, 2);
-   so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-             NOUVEAU_BO_HIGH, 0, 0);
-   so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-             NOUVEAU_BO_LOW, 0, 0);
+   so_reloc2(so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD, 0, 0);
    so_method(so, tesla, NV50TCL_GP_REG_ALLOC_TEMP, 1);
    so_data  (so, p->max_gpr);
    so_method(so, tesla, NV50TCL_GP_REG_ALLOC_RESULT, 1);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index ae02143..80737c1 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -63,10 +63,8 @@ validate_fb(struct nv50_context *nv50)
 		so_data  (so, fb->cbufs[i]->height);
 
 		so_method(so, tesla, NV50TCL_RT_ADDRESS_HIGH(i), 5);
-		so_reloc (so, bo, ((struct nv50_surface *)fb->cbufs[i])->offset, NOUVEAU_BO_VRAM |
-			      NOUVEAU_BO_HIGH | NOUVEAU_BO_RDWR, 0, 0);
-		so_reloc (so, bo, ((struct nv50_surface *)fb->cbufs[i])->offset, NOUVEAU_BO_VRAM |
-			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
+		so_reloc2(so, bo, ((struct nv50_surface *)fb->cbufs[i])->offset, NOUVEAU_BO_VRAM |
+			      NOUVEAU_BO_RDWR, 0, 0);
 		so_data  (so, nv50_format_table[fb->cbufs[i]->format].rt);
 		so_data  (so, nv50_miptree(pt)->
 			      level[fb->cbufs[i]->u.tex.level].tile_mode << 4);
@@ -92,10 +90,8 @@ validate_fb(struct nv50_context *nv50)
 		assert(nv50_format_table[fb->zsbuf->format].rt);
 
 		so_method(so, tesla, NV50TCL_ZETA_ADDRESS_HIGH, 5);
-		so_reloc (so, bo, ((struct nv50_surface *)(fb->zsbuf))->offset, NOUVEAU_BO_VRAM |
-			      NOUVEAU_BO_HIGH | NOUVEAU_BO_RDWR, 0, 0);
-		so_reloc (so, bo, ((struct nv50_surface *)(fb->zsbuf))->offset, NOUVEAU_BO_VRAM |
-			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
+		so_reloc2(so, bo, ((struct nv50_surface *)(fb->zsbuf))->offset, NOUVEAU_BO_VRAM |
+			      NOUVEAU_BO_RDWR, 0, 0);
 		so_data  (so, nv50_format_table[fb->zsbuf->format].rt);
 		so_data  (so, nv50_miptree(pt)->
 			      level[fb->zsbuf->u.tex.level].tile_mode << 4);
@@ -430,8 +426,7 @@ void nv50_so_init_sifc(struct nv50_context *nv50,
 	so_data  (so, 262144);
 	so_data  (so, 65536);
 	so_data  (so, 1);
-	so_reloc (so, bo, offset, reloc | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, bo, offset, reloc | NOUVEAU_BO_LOW, 0, 0);
+	so_reloc2(so, bo, offset, reloc, 0, 0);
 	so_method(so, eng2d, NV50_2D_SIFC_BITMAP_ENABLE, 2);
 	so_data  (so, 0);
 	so_data  (so, NV50_2D_SIFC_FORMAT_R8_UNORM);
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 30a0d41..945595c 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -527,21 +527,14 @@ nv50_vbo_validate(struct nv50_context *nv50)
 		so_method(vtxbuf, tesla, NV50TCL_VERTEX_ARRAY_FORMAT(i), 3);
 		so_data  (vtxbuf, 0x20000000 |
 			  (ve->instance_divisor ? 0 : vb->stride));
-		so_reloc (vtxbuf, bo, vb->buffer_offset +
+		so_reloc2(vtxbuf, bo, vb->buffer_offset +
 			  ve->src_offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART |
-			  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-		so_reloc (vtxbuf, bo, vb->buffer_offset +
-			  ve->src_offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART |
-			  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
+			  NOUVEAU_BO_RD, 0, 0);
 
 		/* vertex array limits */
 		so_method(vtxbuf, tesla, NV50TCL_VERTEX_ARRAY_LIMIT_HIGH(i), 2);
-		so_reloc (vtxbuf, bo, vb->buffer->width0 - 1,
-			  NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD |
-			  NOUVEAU_BO_HIGH, 0, 0);
-		so_reloc (vtxbuf, bo, vb->buffer->width0 - 1,
-			  NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD |
-			  NOUVEAU_BO_LOW, 0, 0);
+		so_reloc2(vtxbuf, bo, vb->buffer->width0 - 1, NOUVEAU_BO_VRAM |
+					NOUVEAU_BO_GART | NOUVEAU_BO_RD, 0, 0);
 	}
 	for (; i < n_ve; ++i) {
 		so_data  (vtxfmt, 0x7e080010);
-- 
1.7.3.3
