From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] nv50: whitespace fixes and deobfuscation
Date: Sun, 16 Aug 2009 04:14:17 +0200
Message-ID: <1250388860-11109-1-git-send-email-madman2003@gmail.com>
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

---
 src/gallium/drivers/nv50/nv50_context.c        |    2 -
 src/gallium/drivers/nv50/nv50_miptree.c        |    8 ++--
 src/gallium/drivers/nv50/nv50_program.c        |   33 +++++++++---------
 src/gallium/drivers/nv50/nv50_query.c          |    2 +-
 src/gallium/drivers/nv50/nv50_screen.c         |   43 +++++++++++++-----------
 src/gallium/drivers/nv50/nv50_state_validate.c |   13 ++++---
 src/gallium/drivers/nv50/nv50_tex.c            |   15 +++++---
 src/gallium/drivers/nv50/nv50_transfer.c       |   33 ++++++++++++------
 src/gallium/drivers/nv50/nv50_vbo.c            |    5 ++-
 9 files changed, 85 insertions(+), 69 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index e02afc4..a2222d8 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -112,5 +112,3 @@ nv50_create(struct pipe_screen *pscreen, unsigned pctx_id)
 
 	return &nv50->pipe;
 }
-
-		
diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 7493ef3..dd1b030 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -121,7 +121,7 @@ nv50_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *tmp)
 		FREE(mt);
 		return NULL;
 	}
-			     
+
 	return &mt->base;
 }
 
@@ -158,7 +158,7 @@ nv50_miptree_destroy(struct pipe_texture *pt)
 	struct nv50_miptree *mt = nv50_miptree(pt);
 
 	nouveau_bo_ref(NULL, &mt->bo);
-        FREE(mt);
+	FREE(mt);
 }
 
 static struct pipe_surface *
@@ -201,8 +201,8 @@ nv50_miptree_surface_del(struct pipe_surface *ps)
 {
 	struct nv50_surface *s = nv50_surface(ps);
 
-        pipe_texture_reference(&ps->texture, NULL);
-        FREE(s);
+	pipe_texture_reference(&ps->texture, NULL);
+	FREE(s);
 }
 
 void
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index e45769c..289c348 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2222,9 +2222,9 @@ nv50_program_upload_data(struct nv50_context *nv50, float *map,
 	while (count) {
 		unsigned nr = count > 2047 ? 2047 : count;
 
-		BEGIN_RING(chan, tesla, 0x00000f00, 1);
+		BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
 		OUT_RING  (chan, (cbuf << 0) | (start << 8));
-		BEGIN_RING(chan, tesla, 0x40000f04, nr);
+		BEGIN_RING(chan, tesla, NV50TCL_CB_DATA(0) | 0x40000000, nr);
 		OUT_RINGp (chan, map, nr);
 
 		map += nr;
@@ -2346,7 +2346,7 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 	}
 
 	so = so_new(4,2);
-	so_method(so, nv50->screen->tesla, 0x1280, 3);
+	so_method(so, nv50->screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
 	so_reloc (so, p->bo, 0, flags | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, p->bo, 0, flags | NOUVEAU_BO_LOW, 0, 0);
 	so_data  (so, (NV50_CB_PUPLOAD << 16) | 0x0800); //(p->exec_size * 4));
@@ -2365,9 +2365,9 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 			continue;
 		}
 
-		BEGIN_RING(chan, tesla, 0x0f00, 1);
+		BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
 		OUT_RING  (chan, (start << 8) | NV50_CB_PUPLOAD);
-		BEGIN_RING(chan, tesla, 0x40000f04, nr);	
+		BEGIN_RING(chan, tesla, NV50TCL_CB_DATA(0) | 0x40000000, nr);
 		OUT_RINGp (chan, up + start, nr);
 
 		start += nr;
@@ -2400,15 +2400,15 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 		      NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		      NOUVEAU_BO_LOW, 0, 0);
-	so_method(so, tesla, 0x1650, 2);
+	so_method(so, tesla, NV50TCL_VP_ATTR_EN_0, 2);
 	so_data  (so, p->cfg.vp.attr[0]);
 	so_data  (so, p->cfg.vp.attr[1]);
-	so_method(so, tesla, 0x16b8, 1);
+	so_method(so, tesla, NV50TCL_VP_REG_ALLOC_RESULT, 1);
 	so_data  (so, p->cfg.high_result);
-	so_method(so, tesla, 0x16ac, 2);
+	so_method(so, tesla, NV50TCL_VP_RESULT_MAP_SIZE, 2);
 	so_data  (so, p->cfg.high_result); //8);
 	so_data  (so, p->cfg.high_temp);
-	so_method(so, tesla, 0x140c, 1);
+	so_method(so, tesla, NV50TCL_VP_START_ID, 1);
 	so_data  (so, 0); /* program start offset */
 	so_ref(so, &nv50->state.vertprog);
 	so_ref(NULL, &so);
@@ -2437,24 +2437,24 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 		      NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		      NOUVEAU_BO_LOW, 0, 0);
-	so_method(so, tesla, 0x1904, 4);
+	so_method(so, tesla, NV50TCL_MAP_SEMANTIC_0, 4);
 	so_data  (so, p->cfg.fp.regs[0]); /* 0x01000404 / 0x00040404 */
 	so_data  (so, 0x00000004);
 	so_data  (so, 0x00000000);
 	so_data  (so, 0x00000000);
-	so_method(so, tesla, 0x16bc, p->cfg.fp.high_map);
+	so_method(so, tesla, NV50TCL_VP_RESULT_MAP(0), p->cfg.fp.high_map);
 	for (i = 0; i < p->cfg.fp.high_map; i++)
 		so_data(so, p->cfg.fp.map[i]);
-	so_method(so, tesla, 0x1988, 2);
+	so_method(so, tesla, NV50TCL_FP_INTERPOLANT_CTRL, 2);
 	so_data  (so, p->cfg.fp.regs[1]); /* 0x08040404 / 0x0f000401 */
 	so_data  (so, p->cfg.high_temp);
-	so_method(so, tesla, 0x1298, 1);
+	so_method(so, tesla, NV50TCL_FP_RESULT_COUNT, 1);
 	so_data  (so, p->cfg.high_result);
-	so_method(so, tesla, 0x19a8, 1);
+	so_method(so, tesla, NV50TCL_FP_CTRL_UNK19A8, 1);
 	so_data  (so, p->cfg.fp.regs[2]);
-	so_method(so, tesla, 0x196c, 1);
+	so_method(so, tesla, NV50TCL_FP_CTRL_UNK196C, 1);
 	so_data  (so, p->cfg.fp.regs[3]);
-	so_method(so, tesla, 0x1414, 1);
+	so_method(so, tesla, NV50TCL_FP_START_ID, 1);
 	so_data  (so, 0); /* program start offset */
 	so_ref(so, &nv50->state.fragprog);
 	so_ref(NULL, &so);
@@ -2479,4 +2479,3 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 
 	p->translated = 0;
 }
-
diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/nv50/nv50_query.c
index c354e10..5305c93 100644
--- a/src/gallium/drivers/nv50/nv50_query.c
+++ b/src/gallium/drivers/nv50/nv50_query.c
@@ -94,7 +94,7 @@ nv50_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nv50_query *q = nv50_query(pq);
 
 	WAIT_RING (chan, 5);
-	BEGIN_RING(chan, tesla, 0x1b00, 4);
+	BEGIN_RING(chan, tesla, NV50TCL_QUERY_ADDRESS_HIGH, 4);
 	OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, 0x00000000);
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index e13536e..f4d9114 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -189,7 +189,8 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	nv50_transfer_init_screen_functions(pscreen);
 
 	/* DMA engine object */
-	ret = nouveau_grobj_alloc(chan, 0xbeef5039, 0x5039, &screen->m2mf);
+	ret = nouveau_grobj_alloc(chan, 0xbeef5039,
+		NV50_MEMORY_TO_MEMORY_FORMAT, &screen->m2mf);
 	if (ret) {
 		NOUVEAU_ERR("Error creating M2MF object: %d\n", ret);
 		nv50_screen_destroy(pscreen);
@@ -198,7 +199,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	BIND_RING(chan, screen->m2mf, 1);
 
 	/* 2D object */
-	ret = nouveau_grobj_alloc(chan, 0xbeef502d, 0x502d, &screen->eng2d);
+	ret = nouveau_grobj_alloc(chan, 0xbeef502d, NV50_2D, &screen->eng2d);
 	if (ret) {
 		NOUVEAU_ERR("Error creating 2D object: %d\n", ret);
 		nv50_screen_destroy(pscreen);
@@ -209,14 +210,15 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	/* 3D object */
 	switch (chipset & 0xf0) {
 	case 0x50:
-		tesla_class = 0x5097;
+		tesla_class = NV50TCL;
 		break;
 	case 0x80:
 	case 0x90:
-		tesla_class = 0x8297;
+		/* this stupid name should be corrected. */
+		tesla_class = NV54TCL;
 		break;
 	case 0xa0:
-		tesla_class = 0x8397;
+		tesla_class = NVA0TCL;
 		break;
 	default:
 		NOUVEAU_ERR("Not a known NV50 chipset: NV%02x\n", chipset);
@@ -230,7 +232,8 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 
-	ret = nouveau_grobj_alloc(chan, 0xbeef5097, tesla_class, &screen->tesla);
+	ret = nouveau_grobj_alloc(chan, 0xbeef5097, tesla_class, 
+		&screen->tesla);
 	if (ret) {
 		NOUVEAU_ERR("Error creating 3D object: %d\n", ret);
 		nv50_screen_destroy(pscreen);
@@ -248,7 +251,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* Static M2MF init */
 	so = so_new(32, 0);
-	so_method(so, screen->m2mf, 0x0180, 3);
+	so_method(so, screen->m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_DMA_NOTIFY, 3);
 	so_data  (so, screen->sync->handle);
 	so_data  (so, chan->vram->handle);
 	so_data  (so, chan->vram->handle);
@@ -294,7 +297,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	/* origin is top left (set to 1 for bottom left) */
 	so_method(so, screen->tesla, 0x13ac, 1);
 	so_data  (so, 0);
-	so_method(so, screen->tesla, 0x16b8, 1);
+	so_method(so, screen->tesla, NV50TCL_VP_REG_ALLOC_RESULT, 1);
 	so_data  (so, 8);
 
 	/* constant buffers for immediates and VP/FP parameters */
@@ -332,33 +335,33 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_data  (so, 0x000BBNP1);
 	*/
 
-	so_method(so, screen->tesla, 0x1280, 3);
+	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
 	so_data  (so, (NV50_CB_PMISC << 16) | 0x00000800);
-	so_method(so, screen->tesla, 0x1694, 1);
+	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
 	so_data  (so, 0x00000001 | (NV50_CB_PMISC << 12));
-	so_method(so, screen->tesla, 0x1694, 1);
+	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
 	so_data  (so, 0x00000031 | (NV50_CB_PMISC << 12));
 
-	so_method(so, screen->tesla, 0x1280, 3);
+	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->constbuf_parm[0], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->constbuf_parm[0], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
 	so_data  (so, (NV50_CB_PVP << 16) | 0x00000800);
-	so_method(so, screen->tesla, 0x1694, 1);
+	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
 	so_data  (so, 0x00000101 | (NV50_CB_PVP << 12));
 
-	so_method(so, screen->tesla, 0x1280, 3);
+	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->constbuf_parm[1], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->constbuf_parm[1], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
 	so_data  (so, (NV50_CB_PFP << 16) | 0x00000800);
-	so_method(so, screen->tesla, 0x1694, 1);
+	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
 	so_data  (so, 0x00000131 | (NV50_CB_PFP << 12));
 
 	/* Texture sampler/image unit setup - we abuse the constant buffer
@@ -372,13 +375,13 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 
-	so_method(so, screen->tesla, 0x1280, 3);
+	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
 	so_data  (so, (NV50_CB_TIC << 16) | 0x0800);
-	so_method(so, screen->tesla, 0x1574, 3);
+	so_method(so, screen->tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
@@ -391,13 +394,13 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 
-	so_method(so, screen->tesla, 0x1280, 3);
+	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
 	so_data  (so, (NV50_CB_TSC << 16) | 0x0800);
-	so_method(so, screen->tesla, 0x155c, 3);
+	so_method(so, screen->tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
@@ -407,7 +410,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* Vertex array limits - max them out */
 	for (i = 0; i < 16; i++) {
-		so_method(so, screen->tesla, 0x1080 + (i * 8), 2);
+		so_method(so, screen->tesla, NV50TCL_UNK1080_OFFSET_HIGH(i), 2);
 		so_data  (so, 0x000000ff);
 		so_data  (so, 0xffffffff);
 	}
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 633be78..a879df2 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -55,15 +55,15 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
 		switch (fb->cbufs[i]->format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
-			so_data(so, 0xcf);
+			so_data(so, NV50TCL_RT_FORMAT_A8R8G8B8_UNORM);
 			break;
 		case PIPE_FORMAT_R5G6B5_UNORM:
-			so_data(so, 0xe8);
+			so_data(so, NV50TCL_RT_FORMAT_R5G6B5_UNORM);
 			break;
 		default:
 			NOUVEAU_ERR("AIIII unknown format %s\n",
 				    pf_name(fb->cbufs[i]->format));
-			so_data(so, 0xe6);
+			so_data(so, NV50TCL_RT_FORMAT_X8R8G8B8_UNORM);
 			break;
 		}
 		so_data(so, bo->tile_mode << 4);
@@ -115,7 +115,7 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 
 		so_method(so, tesla, 0x1538, 1);
 		so_data  (so, 1);
-		so_method(so, tesla, 0x1228, 3);
+		so_method(so, tesla, NV50TCL_ZETA_HORIZ, 3);
 		so_data  (so, fb->zsbuf->width);
 		so_data  (so, fb->zsbuf->height);
 		so_data  (so, 0x00010001);
@@ -330,9 +330,10 @@ viewport_uptodate:
 		int i;
 
 		so = so_new(nv50->sampler_nr * 8 + 3, 0);
-		so_method(so, tesla, 0x0f00, 1);
+		so_method(so, tesla, NV50TCL_CB_ADDR, 1);
 		so_data  (so, NV50_CB_TSC);
-		so_method(so, tesla, 0x40000f04, nv50->sampler_nr * 8);
+		so_method(so, tesla, NV50TCL_CB_DATA(0) | 0x40000000,
+			nv50->sampler_nr * 8);
 		for (i = 0; i < nv50->sampler_nr; i++)
 			so_datap (so, nv50->sampler[i]->tsc, 8);
 		so_ref(so, &nv50->state.tsc_upload);
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index 46c3073..6b66d80 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -145,25 +145,28 @@ nv50_tex_validate(struct nv50_context *nv50)
 	push += MAX2(nv50->miptree_nr, nv50->state.miptree_nr) * 2;
 
 	so = so_new(push, nv50->miptree_nr * 2);
-	so_method(so, tesla, 0x0f00, 1);
+	so_method(so, tesla, NV50TCL_CB_ADDR, 1);
 	so_data  (so, NV50_CB_TIC);
 	for (unit = 0; unit < nv50->miptree_nr; unit++) {
 		struct nv50_miptree *mt = nv50->miptree[unit];
 
-		so_method(so, tesla, 0x40000f04, 8);
+		so_method(so, tesla, NV50TCL_CB_DATA(0) | 0x40000000, 8);
 		if (nv50_tex_construct(nv50, so, mt, unit)) {
 			NOUVEAU_ERR("failed tex validate\n");
 			so_ref(NULL, &so);
 			return;
 		}
 
-		so_method(so, tesla, 0x1458, 1);
-		so_data  (so, (unit << 9) | (unit << 1) | 1);
+		so_method(so, tesla, NV50TCL_SET_SAMPLER_TEX, 1);
+		so_data  (so, (unit << NV50TCL_SET_SAMPLER_TEX_TIC_SHIFT) | 
+			(unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) | 
+			NV50TCL_SET_SAMPLER_TEX_VALID);
 	}
 
 	for (; unit < nv50->state.miptree_nr; unit++) {
-		so_method(so, tesla, 0x1458, 1);
-		so_data  (so, (unit << 1) | 0);
+		so_method(so, tesla, NV50TCL_SET_SAMPLER_TEX, 1);
+		so_data  (so,
+			(unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) | 0);
 	}
 
 	so_ref(so, &nv50->state.tic_upload);
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 1c47c30..d2b5e4d 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -37,13 +37,16 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 	WAIT_RING (chan, 14);
 
 	if (!src_bo->tile_flags) {
-		BEGIN_RING(chan, m2mf, 0x0200, 1);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_LINEAR_IN, 1);
 		OUT_RING  (chan, 1);
-		BEGIN_RING(chan, m2mf, 0x0314, 1);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_PITCH_IN, 1);
 		OUT_RING  (chan, src_pitch);
 		src_offset += (sy * src_pitch) + (sx * cpp);
 	} else {
-		BEGIN_RING(chan, m2mf, 0x0200, 6);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_LINEAR_IN, 6);
 		OUT_RING  (chan, 0);
 		OUT_RING  (chan, src_tile_mode << 4);
 		OUT_RING  (chan, sw * cpp);
@@ -53,13 +56,16 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 	}
 
 	if (!dst_bo->tile_flags) {
-		BEGIN_RING(chan, m2mf, 0x021c, 1);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_LINEAR_OUT, 1);
 		OUT_RING  (chan, 1);
-		BEGIN_RING(chan, m2mf, 0x0318, 1);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_PITCH_OUT, 1);
 		OUT_RING  (chan, dst_pitch);
 		dst_offset += (dy * dst_pitch) + (dx * cpp);
 	} else {
-		BEGIN_RING(chan, m2mf, 0x021c, 6);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_LINEAR_OUT, 6);
 		OUT_RING  (chan, 0);
 		OUT_RING  (chan, dst_tile_mode << 4);
 		OUT_RING  (chan, dw * cpp);
@@ -72,25 +78,30 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 		int line_count = height > 2047 ? 2047 : height;
 
 		WAIT_RING (chan, 15);
-		BEGIN_RING(chan, m2mf, 0x0238, 2);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN_HIGH, 2);
 		OUT_RELOCh(chan, src_bo, src_offset, src_reloc);
 		OUT_RELOCh(chan, dst_bo, dst_offset, dst_reloc);
-		BEGIN_RING(chan, m2mf, 0x030c, 2);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN, 2);
 		OUT_RELOCl(chan, src_bo, src_offset, src_reloc);
 		OUT_RELOCl(chan, dst_bo, dst_offset, dst_reloc);
 		if (src_bo->tile_flags) {
-			BEGIN_RING(chan, m2mf, 0x0218, 1);
+			BEGIN_RING(chan, m2mf,
+				NV50_MEMORY_TO_MEMORY_FORMAT_TILING_POSITION_IN, 1);
 			OUT_RING  (chan, (sy << 16) | sx);
 		} else {
 			src_offset += (line_count * src_pitch);
 		}
 		if (dst_bo->tile_flags) {
-			BEGIN_RING(chan, m2mf, 0x0234, 1);
+			BEGIN_RING(chan, m2mf,
+				NV50_MEMORY_TO_MEMORY_FORMAT_TILING_POSITION_OUT, 1);
 			OUT_RING  (chan, (dy << 16) | dx);
 		} else {
 			dst_offset += (line_count * dst_pitch);
 		}
-		BEGIN_RING(chan, m2mf, 0x031c, 4);
+		BEGIN_RING(chan, m2mf,
+			NV50_MEMORY_TO_MEMORY_FORMAT_LINE_LENGTH_IN, 4);
 		OUT_RING  (chan, width * cpp);
 		OUT_RING  (chan, line_count);
 		OUT_RING  (chan, 0x00000101);
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 422c8c6..17283f3 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -265,7 +265,8 @@ nv50_vbo_validate(struct nv50_context *nv50)
 
 	vtxbuf = so_new(nv50->vtxelt_nr * 4, nv50->vtxelt_nr * 2);
 	vtxfmt = so_new(nv50->vtxelt_nr + 1, 0);
-	so_method(vtxfmt, tesla, 0x1ac0, nv50->vtxelt_nr);
+	so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(0),
+		nv50->vtxelt_nr);
 
 	for (i = 0; i < nv50->vtxelt_nr; i++) {
 		struct pipe_vertex_element *ve = &nv50->vtxelt[i];
@@ -275,7 +276,7 @@ nv50_vbo_validate(struct nv50_context *nv50)
 
 		so_data(vtxfmt, nv50_vtxeltfmt(ve->src_format) | i);
 
-		so_method(vtxbuf, tesla, 0x900 + (i * 16), 3);
+		so_method(vtxbuf, tesla, NV50TCL_VERTEX_ARRAY_FORMAT(i), 3);
 		so_data  (vtxbuf, 0x20000000 | vb->stride);
 		so_reloc (vtxbuf, bo, vb->buffer_offset +
 			  ve->src_offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART |
-- 
1.6.4
