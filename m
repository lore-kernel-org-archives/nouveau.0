From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH 2/2] gallium/nouveau: convert OUT_RELOCh +
	OUT_RELOCl to OUT_RELOChl
Date: Sun,  9 Jan 2011 18:31:03 +0100
Message-ID: <1294594263-1862-6-git-send-email-marcin.slusarz@gmail.com>
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
 src/gallium/drivers/nv50/nv50_query.c          |    6 +--
 src/gallium/drivers/nv50/nv50_screen.c         |   39 ++++++++----------------
 src/gallium/drivers/nv50/nv50_shader_state.c   |    3 +-
 src/gallium/drivers/nv50/nv50_surface.c        |   12 ++-----
 src/gallium/drivers/nv50/nv50_transfer.c       |    6 +--
 src/gallium/drivers/nv50/nv50_vbo.c            |    4 +--
 src/gallium/drivers/nvc0/nvc0_fence.c          |    3 +-
 src/gallium/drivers/nvc0/nvc0_screen.c         |   24 +++++----------
 src/gallium/drivers/nvc0/nvc0_state_validate.c |   21 ++++--------
 src/gallium/drivers/nvc0/nvc0_surface.c        |   12 ++-----
 src/gallium/drivers/nvc0/nvc0_tex.c            |    3 +-
 src/gallium/drivers/nvc0/nvc0_transfer.c       |   18 ++++-------
 src/gallium/drivers/nvc0/nvc0_vbo.c            |    3 +-
 13 files changed, 51 insertions(+), 103 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/nv50/nv50_query.c
index 53f9482..ed682ae 100644
--- a/src/gallium/drivers/nv50/nv50_query.c
+++ b/src/gallium/drivers/nv50/nv50_query.c
@@ -95,8 +95,7 @@ nv50_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 
 	MARK_RING (chan, 5, 2); /* flush on lack of space or relocs */
 	BEGIN_RING(chan, tesla, NV50TCL_QUERY_ADDRESS_HIGH, 4);
-	OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, q->bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_WR);
 	OUT_RING  (chan, 0x00000000);
 	OUT_RING  (chan, 0x0100f002);
 
@@ -150,8 +149,7 @@ nv50_render_condition(struct pipe_context *pipe,
 	}
 
 	BEGIN_RING(chan, tesla, NV50TCL_COND_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-	OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+	OUT_RELOChl(chan, q->bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_RD);
 	OUT_RING  (chan, NV50TCL_COND_MODE_RES);
 }
 
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index edc3d54..02ed8e9 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -262,8 +262,7 @@ nv50_screen_reloc_constbuf(struct nv50_screen *screen, unsigned cbi)
 	}
 
 	BGN_RELOC (chan, bo, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3, rl);
-	OUT_RELOCh(chan, bo, 0, rl);
-	OUT_RELOCl(chan, bo, 0, rl);
+	OUT_RELOChl(chan, bo, 0, rl);
 	OUT_RELOC (chan, bo, (cbi << 16) | size, rl, 0, 0);
 }
 
@@ -282,19 +281,16 @@ nv50_screen_relocs(struct nv50_screen *screen)
 	OUT_RING  (chan, 0);
 
 	BGN_RELOC (chan, screen->tic, tesla, NV50TCL_TIC_ADDRESS_HIGH, 2, rl);
-	OUT_RELOCh(chan, screen->tic, 0, rl);
-	OUT_RELOCl(chan, screen->tic, 0, rl);
+	OUT_RELOChl(chan, screen->tic, 0, rl);
 
 	BGN_RELOC (chan, screen->tsc, tesla, NV50TCL_TSC_ADDRESS_HIGH, 2, rl);
-	OUT_RELOCh(chan, screen->tsc, 0, rl);
-	OUT_RELOCl(chan, screen->tsc, 0, rl);
+	OUT_RELOChl(chan, screen->tsc, 0, rl);
 
 	nv50_screen_reloc_constbuf(screen, NV50_CB_PMISC);
 
 	BGN_RELOC (chan, screen->constbuf_misc[0],
 		   tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3, rl);
-	OUT_RELOCh(chan, screen->constbuf_misc[0], 0x200, rl);
-	OUT_RELOCl(chan, screen->constbuf_misc[0], 0x200, rl);
+	OUT_RELOChl(chan, screen->constbuf_misc[0], 0x200, rl);
 	OUT_RELOC (chan, screen->constbuf_misc[0],
 		   (NV50_CB_AUX << 16) | 0x0200, rl, 0, 0);
 
@@ -303,16 +299,14 @@ nv50_screen_relocs(struct nv50_screen *screen)
 
 	BGN_RELOC (chan, screen->stack_bo,
 		   tesla, NV50TCL_STACK_ADDRESS_HIGH, 2, rl);
-	OUT_RELOCh(chan, screen->stack_bo, 0, rl);
-	OUT_RELOCl(chan, screen->stack_bo, 0, rl);
+	OUT_RELOChl(chan, screen->stack_bo, 0, rl);
 
 	if (!screen->cur_ctx->req_lmem)
 		return;
 
 	BGN_RELOC (chan, screen->local_bo,
 		   tesla, NV50TCL_LOCAL_ADDRESS_HIGH, 2, rl);
-	OUT_RELOCh(chan, screen->local_bo, 0, rl);
-	OUT_RELOCl(chan, screen->local_bo, 0, rl);
+	OUT_RELOChl(chan, screen->local_bo, 0, rl);
 }
 
 #ifndef NOUVEAU_GETPARAM_GRAPH_UNITS
@@ -484,12 +478,10 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 	BEGIN_RING(chan, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, screen->constbuf_misc[0], 0, rl);
-	OUT_RELOCl(chan, screen->constbuf_misc[0], 0, rl);
+	OUT_RELOChl(chan, screen->constbuf_misc[0], 0, rl);
 	OUT_RING  (chan, (NV50_CB_PMISC << 16) | 0x0200);
 	BEGIN_RING(chan, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, screen->constbuf_misc[0], 0x200, rl);
-	OUT_RELOCl(chan, screen->constbuf_misc[0], 0x200, rl);
+	OUT_RELOChl(chan, screen->constbuf_misc[0], 0x200, rl);
 	OUT_RING  (chan, (NV50_CB_AUX << 16) | 0x0200);
 
 	for (i = 0; i < 3; i++) {
@@ -500,8 +492,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 			return NULL;
 		}
 		BEGIN_RING(chan, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-		OUT_RELOCh(chan, screen->constbuf_parm[i], 0, rl);
-		OUT_RELOCl(chan, screen->constbuf_parm[i], 0, rl);
+		OUT_RELOChl(chan, screen->constbuf_parm[i], 0, rl);
 		/* CB_DEF_SET_SIZE value of 0x0000 means 65536 */
 		OUT_RING  (chan, ((NV50_CB_PVP + i) << 16) | 0x0000);
 	}
@@ -519,8 +510,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 	BEGIN_RING(chan, screen->tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, screen->tic, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-	OUT_RELOCl(chan, screen->tic, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+	OUT_RELOChl(chan, screen->tic, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
 	OUT_RING  (chan, 3 * 32 - 1);
 
 	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 3 * 32 * (8 * 4),
@@ -530,8 +520,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 	BEGIN_RING(chan, screen->tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, screen->tsc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-	OUT_RELOCl(chan, screen->tsc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+	OUT_RELOChl(chan, screen->tsc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
 	OUT_RING  (chan, 0); /* ignored if TSC_LINKED (0x1234) == 1 */
 
 	/* map constant buffers:
@@ -568,8 +557,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 	BEGIN_RING(chan, screen->tesla, NV50TCL_STACK_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, screen->stack_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, screen->stack_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, screen->stack_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, 4);
 
 	local_size = (NV50_CAP_MAX_PROGRAM_TEMPS * 16) * max_warps * 32;
@@ -584,8 +572,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	local_size = NV50_CAP_MAX_PROGRAM_TEMPS * 16;
 
 	BEGIN_RING(chan, screen->tesla, NV50TCL_LOCAL_ADDRESS_HIGH, 3);
-	OUT_RELOCh(chan, screen->local_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, screen->local_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, screen->local_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, util_unsigned_logbase2(local_size / 8));
 
 	/* Vertex array limits - max them out */
diff --git a/src/gallium/drivers/nv50/nv50_shader_state.c b/src/gallium/drivers/nv50/nv50_shader_state.c
index 1c1b66d..1c59dbf 100644
--- a/src/gallium/drivers/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nv50/nv50_shader_state.c
@@ -178,8 +178,7 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
       assert(!(size & 3));
 
       BEGIN_RING(chan, eng2d, NV50_2D_DST_ADDRESS_HIGH, 2);
-      OUT_RELOCh(chan, p->bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-      OUT_RELOCl(chan, p->bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+      OUT_RELOChl(chan, p->bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
       BEGIN_RING(chan, eng2d, NV50_2D_SIFC_BITMAP_ENABLE, 2);
       OUT_RING  (chan, 0);
       OUT_RING  (chan, NV50_2D_SIFC_FORMAT_R8_UNORM);
diff --git a/src/gallium/drivers/nv50/nv50_surface.c b/src/gallium/drivers/nv50/nv50_surface.c
index a99df76..edb6ba2 100644
--- a/src/gallium/drivers/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nv50/nv50_surface.c
@@ -100,8 +100,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pipe_surface *ps, int dst)
 		OUT_RING  (chan, mt->level[ps->u.tex.level].pitch);
  		OUT_RING  (chan, ps->width);
  		OUT_RING  (chan, ps->height);
- 		OUT_RELOCh(chan, bo, ((struct nv50_surface *)ps)->offset, flags);
- 		OUT_RELOCl(chan, bo, ((struct nv50_surface *)ps)->offset, flags);
+ 		OUT_RELOChl(chan, bo, ((struct nv50_surface *)ps)->offset, flags);
  	} else {
  		BEGIN_RING(chan, eng2d, mthd, 5);
  		OUT_RING  (chan, format);
@@ -112,8 +111,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pipe_surface *ps, int dst)
  		BEGIN_RING(chan, eng2d, mthd + 0x18, 4);
  		OUT_RING  (chan, ps->width);
  		OUT_RING  (chan, ps->height);
- 		OUT_RELOCh(chan, bo, ((struct nv50_surface *)ps)->offset, flags);
- 		OUT_RELOCl(chan, bo, ((struct nv50_surface *)ps)->offset, flags);
+ 		OUT_RELOChl(chan, bo, ((struct nv50_surface *)ps)->offset, flags);
  	}
  
 #if 0
@@ -236,8 +234,7 @@ nv50_clear_render_target(struct pipe_context *pipe,
 	BEGIN_RING(chan, tesla, NV50TCL_RT_CONTROL, 1);
 	OUT_RING  (chan, 1);
 	BEGIN_RING(chan, tesla, NV50TCL_RT_ADDRESS_HIGH(0), 5);
-	OUT_RELOCh(chan, bo, ((struct nv50_surface *)dst)->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, bo, ((struct nv50_surface *)dst)->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, bo, ((struct nv50_surface *)dst)->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, nv50_format_table[dst->format].rt);
 	OUT_RING  (chan, mt->level[dst->u.tex.level].tile_mode << 4);
 	OUT_RING  (chan, 0);
@@ -292,8 +289,7 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
 		return;
 
 	BEGIN_RING(chan, tesla, NV50TCL_ZETA_ADDRESS_HIGH, 5);
-	OUT_RELOCh(chan, bo, ((struct nv50_surface *)dst)->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, bo, ((struct nv50_surface *)dst)->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, bo, ((struct nv50_surface *)dst)->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, nv50_format_table[dst->format].rt);
 	OUT_RING  (chan, mt->level[dst->u.tex.level].tile_mode << 4);
 	OUT_RING  (chan, 0);
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index bf5af4d..14f0114 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -301,8 +301,7 @@ nv50_upload_sifc(struct nv50_context *nv50,
 	BEGIN_RING(chan, eng2d, NV50_2D_DST_WIDTH, 4);
 	OUT_RING  (chan, dst_w);
 	OUT_RING  (chan, dst_h);
-	OUT_RELOCh(chan, bo, dst_offset, reloc);
-	OUT_RELOCl(chan, bo, dst_offset, reloc);
+	OUT_RELOChl(chan, bo, dst_offset, reloc);
 
 	/* NV50_2D_OPERATION_SRCCOPY assumed already set */
 
@@ -333,8 +332,7 @@ nv50_upload_sifc(struct nv50_context *nv50,
 
 				BEGIN_RING(chan, eng2d,
 					   NV50_2D_DST_ADDRESS_HIGH, 2);
-				OUT_RELOCh(chan, bo, dst_offset, reloc);
-				OUT_RELOCl(chan, bo, dst_offset, reloc);
+				OUT_RELOChl(chan, bo, dst_offset, reloc);
 			}
 			assert(AVAIL_RING(chan) > nr);
 
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 53f319a..051d872 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -72,9 +72,7 @@ instance_step(struct nv50_context *nv50, struct instance *a)
 
 		BEGIN_RING(chan, tesla,
 			   NV50TCL_VERTEX_ARRAY_START_HIGH(i), 2);
-		OUT_RELOCh(chan, a[i].bo, a[i].delta, NOUVEAU_BO_RD |
-			   NOUVEAU_BO_VRAM | NOUVEAU_BO_GART);
-		OUT_RELOCl(chan, a[i].bo, a[i].delta, NOUVEAU_BO_RD |
+		OUT_RELOChl(chan, a[i].bo, a[i].delta, NOUVEAU_BO_RD |
 			   NOUVEAU_BO_VRAM | NOUVEAU_BO_GART);
 		if (++a[i].step == a[i].divisor) {
 			a[i].step = 0;
diff --git a/src/gallium/drivers/nvc0/nvc0_fence.c b/src/gallium/drivers/nvc0/nvc0_fence.c
index 7c214ca..d36774b 100644
--- a/src/gallium/drivers/nvc0/nvc0_fence.c
+++ b/src/gallium/drivers/nvc0/nvc0_fence.c
@@ -56,8 +56,7 @@ nvc0_fence_emit(struct nvc0_fence *fence)
    assert(fence->state == NVC0_FENCE_STATE_AVAILABLE);
 
    BEGIN_RING(chan, RING_3D(QUERY_ADDRESS_HIGH), 4);
-   OUT_RELOCh(chan, screen->fence.bo, 0, NOUVEAU_BO_WR);
-   OUT_RELOCl(chan, screen->fence.bo, 0, NOUVEAU_BO_WR);
+   OUT_RELOChl(chan, screen->fence.bo, 0, NOUVEAU_BO_WR);
    OUT_RING  (chan, fence->sequence);
    OUT_RING  (chan, NVC0_3D_QUERY_GET_FENCE);
 
diff --git a/src/gallium/drivers/nvc0/nvc0_screen.c b/src/gallium/drivers/nvc0/nvc0_screen.c
index e149b90..c0d3e71 100644
--- a/src/gallium/drivers/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nvc0/nvc0_screen.c
@@ -405,8 +405,7 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
    BIND_RING (chan, screen->m2mf, NVC0_SUBCH_MF);
    BEGIN_RING(chan, RING_MF(NOTIFY_ADDRESS_HIGH), 3);
-   OUT_RELOCh(chan, screen->fence.bo, 16, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
-   OUT_RELOCl(chan, screen->fence.bo, 16, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
+   OUT_RELOChl(chan, screen->fence.bo, 16, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
    OUT_RING  (chan, 0);
 
    ret = nouveau_grobj_alloc(chan, 0xbeef902d, NVC0_2D, &screen->eng2d);
@@ -431,8 +430,7 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
    BIND_RING (chan, screen->fermi, NVC0_SUBCH_3D);
    BEGIN_RING(chan, RING_3D(NOTIFY_ADDRESS_HIGH), 3);
-   OUT_RELOCh(chan, screen->fence.bo, 32, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
-   OUT_RELOCl(chan, screen->fence.bo, 32, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
+   OUT_RELOChl(chan, screen->fence.bo, 32, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
    OUT_RING  (chan, 0);
 
    BEGIN_RING(chan, RING_3D(COND_MODE), 1);
@@ -466,8 +464,7 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    /* auxiliary constants (6 user clip planes, base instance id) */
    BEGIN_RING(chan, RING_3D(CB_SIZE), 3);
    OUT_RING  (chan, 256);
-   OUT_RELOCh(chan, screen->uniforms, 5 << 16, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-   OUT_RELOCl(chan, screen->uniforms, 5 << 16, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+   OUT_RELOChl(chan, screen->uniforms, 5 << 16, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
    for (i = 0; i < 5; ++i) {
       BEGIN_RING(chan, RING_3D(CB_BIND(i)), 1);
       OUT_RING  (chan, (15 << 4) | 1);
@@ -480,11 +477,9 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
       goto fail;
 
    BEGIN_RING(chan, RING_3D(CODE_ADDRESS_HIGH), 2);
-   OUT_RELOCh(chan, screen->text, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-   OUT_RELOCl(chan, screen->text, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+   OUT_RELOChl(chan, screen->text, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
    BEGIN_RING(chan, RING_3D(LOCAL_ADDRESS_HIGH), 4);
-   OUT_RELOCh(chan, screen->tls, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
-   OUT_RELOCl(chan, screen->tls, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+   OUT_RELOChl(chan, screen->tls, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
    OUT_RING  (chan, screen->tls_size >> 32);
    OUT_RING  (chan, screen->tls_size);
    BEGIN_RING(chan, RING_3D(LOCAL_BASE), 1);
@@ -503,8 +498,7 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
       goto fail;
 
    BEGIN_RING(chan, RING_3D_(0x17bc), 3);
-   OUT_RELOCh(chan, screen->mp_stack_bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
-   OUT_RELOCl(chan, screen->mp_stack_bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
+   OUT_RELOChl(chan, screen->mp_stack_bo, 0, NOUVEAU_BO_GART | NOUVEAU_BO_RDWR);
    OUT_RING  (chan, 1);
 
    ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 1 << 17, 1 << 17, &screen->txc);
@@ -512,13 +506,11 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
       goto fail;
 
    BEGIN_RING(chan, RING_3D(TIC_ADDRESS_HIGH), 3);
-   OUT_RELOCh(chan, screen->txc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-   OUT_RELOCl(chan, screen->txc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+   OUT_RELOChl(chan, screen->txc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
    OUT_RING  (chan, NVC0_TIC_MAX_ENTRIES - 1);
 
    BEGIN_RING(chan, RING_3D(TSC_ADDRESS_HIGH), 3);
-   OUT_RELOCh(chan, screen->txc, 65536, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-   OUT_RELOCl(chan, screen->txc, 65536, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+   OUT_RELOChl(chan, screen->txc, 65536, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
    OUT_RING  (chan, NVC0_TSC_MAX_ENTRIES - 1);
 
    BEGIN_RING(chan, RING_3D(Y_ORIGIN_BOTTOM), 1);
diff --git a/src/gallium/drivers/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nvc0/nvc0_state_validate.c
index 25aec02..a7a453a 100644
--- a/src/gallium/drivers/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nvc0/nvc0_state_validate.c
@@ -28,12 +28,10 @@ nvc0_validate_zcull(struct nvc0_context *nvc0)
     BEGIN_RING(chan, RING_3D_(0x1590), 1); /* ZCULL_REGION_INDEX (bits 0x3f) */
     OUT_RING  (chan, 0);
     BEGIN_RING(chan, RING_3D_(0x07e8), 2); /* ZCULL_ADDRESS_A_HIGH */
-    OUT_RELOCh(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
-    OUT_RELOCl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+    OUT_RELOChl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
     offset += 1 << 17;
     BEGIN_RING(chan, RING_3D_(0x07f0), 2); /* ZCULL_ADDRESS_B_HIGH */
-    OUT_RELOCh(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
-    OUT_RELOCl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+    OUT_RELOChl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
     BEGIN_RING(chan, RING_3D_(0x07e0), 2);
     OUT_RING  (chan, size);
     OUT_RING  (chan, size >> 16);
@@ -73,8 +71,7 @@ nvc0_validate_fb(struct nvc0_context *nvc0)
         uint32_t offset = sf->offset;
         
         BEGIN_RING(chan, RING_3D(RT_ADDRESS_HIGH(i)), 8);
-        OUT_RELOCh(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
-        OUT_RELOCl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+        OUT_RELOChl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
         OUT_RING  (chan, sf->width);
         OUT_RING  (chan, sf->height);
         OUT_RING  (chan, nvc0_format_table[sf->base.format].rt);
@@ -95,8 +92,7 @@ nvc0_validate_fb(struct nvc0_context *nvc0)
         uint32_t offset = sf->offset;
         
         BEGIN_RING(chan, RING_3D(ZETA_ADDRESS_HIGH), 5);
-        OUT_RELOCh(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
-        OUT_RELOCl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+        OUT_RELOChl(chan, bo, offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
         OUT_RING  (chan, nvc0_format_table[fb->zsbuf->format].rt);
         OUT_RING  (chan, mt->level[sf->base.u.tex.level].tile_mode);
         OUT_RING  (chan, mt->layer_stride >> 2);
@@ -240,8 +236,7 @@ nvc0_validate_clip(struct nvc0_context *nvc0)
 
       BEGIN_RING(chan, RING_3D(CB_SIZE), 3);
       OUT_RING  (chan, 256);
-      OUT_RELOCh(chan, bo, 5 << 16, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-      OUT_RELOCl(chan, bo, 5 << 16, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+      OUT_RELOChl(chan, bo, 5 << 16, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
       BEGIN_RING_1I(chan, RING_3D(CB_POS), nvc0->clip.nr * 4 + 1);
       OUT_RING  (chan, 0);
       OUT_RINGp (chan, &nvc0->clip.ucp[0][0], nvc0->clip.nr * 4);
@@ -342,8 +337,7 @@ nvc0_constbufs_validate(struct nvc0_context *nvc0)
          if (rebind) {
             BEGIN_RING(chan, RING_3D(CB_SIZE), 3);
             OUT_RING  (chan, align(res->base.width0, 0x100));
-            OUT_RELOCh(chan, bo, base, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-            OUT_RELOCl(chan, bo, base, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+            OUT_RELOChl(chan, bo, base, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
             BEGIN_RING(chan, RING_3D(CB_BIND(s)), 1);
             OUT_RING  (chan, (i << 4) | 1);
          }
@@ -359,8 +353,7 @@ nvc0_constbufs_validate(struct nvc0_context *nvc0)
 
             BEGIN_RING(chan, RING_3D(CB_SIZE), 3);
             OUT_RING  (chan, align(res->base.width0, 0x100));
-            OUT_RELOCh(chan, bo, base, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
-            OUT_RELOCl(chan, bo, base, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+            OUT_RELOChl(chan, bo, base, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
             BEGIN_RING_1I(chan, RING_3D(CB_POS), nr + 1);
             OUT_RING  (chan, offset);
             OUT_RINGp (chan, &res->data[offset], nr);
diff --git a/src/gallium/drivers/nvc0/nvc0_surface.c b/src/gallium/drivers/nvc0/nvc0_surface.c
index cc0a656..d29c0e4 100644
--- a/src/gallium/drivers/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nvc0/nvc0_surface.c
@@ -115,8 +115,7 @@ nvc0_2d_texture_set(struct nouveau_channel *chan, int dst,
       OUT_RING  (chan, mt->level[level].pitch);
       OUT_RING  (chan, width);
       OUT_RING  (chan, height);
-      OUT_RELOCh(chan, bo, offset, flags);
-      OUT_RELOCl(chan, bo, offset, flags);
+      OUT_RELOChl(chan, bo, offset, flags);
    } else {
       BEGIN_RING(chan, RING_2D_(mthd), 5);
       OUT_RING  (chan, format);
@@ -127,8 +126,7 @@ nvc0_2d_texture_set(struct nouveau_channel *chan, int dst,
       BEGIN_RING(chan, RING_2D_(mthd + 0x18), 4);
       OUT_RING  (chan, width);
       OUT_RING  (chan, height);
-      OUT_RELOCh(chan, bo, offset, flags);
-      OUT_RELOCl(chan, bo, offset, flags);
+      OUT_RELOChl(chan, bo, offset, flags);
    }
 
 #if 0
@@ -240,8 +238,7 @@ nvc0_clear_render_target(struct pipe_context *pipe,
 	BEGIN_RING(chan, RING_3D(RT_CONTROL), 1);
 	OUT_RING  (chan, 1);
 	BEGIN_RING(chan, RING_3D(RT_ADDRESS_HIGH(0)), 8);
-	OUT_RELOCh(chan, bo, sf->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, bo, sf->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, bo, sf->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, sf->width);
 	OUT_RING  (chan, sf->height);
 	OUT_RING  (chan, nvc0_format_table[dst->format].rt);
@@ -294,8 +291,7 @@ nvc0_clear_depth_stencil(struct pipe_context *pipe,
 		return;
 
 	BEGIN_RING(chan, RING_3D(ZETA_ADDRESS_HIGH), 5);
-	OUT_RELOCh(chan, bo, sf->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	OUT_RELOCl(chan, bo, sf->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOChl(chan, bo, sf->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RING  (chan, nvc0_format_table[dst->format].rt);
 	OUT_RING  (chan, mt->level[sf->base.u.tex.level].tile_mode);
 	OUT_RING  (chan, 0);
diff --git a/src/gallium/drivers/nvc0/nvc0_tex.c b/src/gallium/drivers/nvc0/nvc0_tex.c
index b219f82..bb223e4 100644
--- a/src/gallium/drivers/nvc0/nvc0_tex.c
+++ b/src/gallium/drivers/nvc0/nvc0_tex.c
@@ -181,8 +181,7 @@ nvc0_validate_tic(struct nvc0_context *nvc0, int s)
 
          MARK_RING (chan, 9 + 8, 4);
          BEGIN_RING(chan, RING_MF(OFFSET_OUT_HIGH), 2);
-         OUT_RELOCh(chan, txc, tic->id * 32, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-         OUT_RELOCl(chan, txc, tic->id * 32, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+         OUT_RELOChl(chan, txc, tic->id * 32, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
          BEGIN_RING(chan, RING_MF(LINE_LENGTH_IN), 2);
          OUT_RING  (chan, 32);
          OUT_RING  (chan, 1);
diff --git a/src/gallium/drivers/nvc0/nvc0_transfer.c b/src/gallium/drivers/nvc0/nvc0_transfer.c
index 286b382..d735ef2 100644
--- a/src/gallium/drivers/nvc0/nvc0_transfer.c
+++ b/src/gallium/drivers/nvc0/nvc0_transfer.c
@@ -68,12 +68,10 @@ nvc0_m2mf_transfer_rect(struct pipe_screen *pscreen,
       MARK_RING (chan, 17, 4);
 
       BEGIN_RING(chan, RING_MF(OFFSET_IN_HIGH), 2);
-      OUT_RELOCh(chan, src->bo, src_ofst, src->domain | NOUVEAU_BO_RD);
-      OUT_RELOCl(chan, src->bo, src_ofst, src->domain | NOUVEAU_BO_RD);
+      OUT_RELOChl(chan, src->bo, src_ofst, src->domain | NOUVEAU_BO_RD);
 
       BEGIN_RING(chan, RING_MF(OFFSET_OUT_HIGH), 2);
-      OUT_RELOCh(chan, dst->bo, dst_ofst, dst->domain | NOUVEAU_BO_WR);
-      OUT_RELOCl(chan, dst->bo, dst_ofst, dst->domain | NOUVEAU_BO_WR);
+      OUT_RELOChl(chan, dst->bo, dst_ofst, dst->domain | NOUVEAU_BO_WR);
 
       if (!(exec & NVC0_M2MF_EXEC_LINEAR_IN)) {
          BEGIN_RING(chan, RING_MF(TILING_POSITION_IN_X), 2);
@@ -114,8 +112,7 @@ nvc0_m2mf_push_linear(struct nvc0_context *nvc0,
    MARK_RING (chan, 8, 2);
 
    BEGIN_RING(chan, RING_MF(OFFSET_OUT_HIGH), 2);
-   OUT_RELOCh(chan, dst, offset, domain | NOUVEAU_BO_WR);
-   OUT_RELOCl(chan, dst, offset, domain | NOUVEAU_BO_WR);
+   OUT_RELOChl(chan, dst, offset, domain | NOUVEAU_BO_WR);
    BEGIN_RING(chan, RING_MF(LINE_LENGTH_IN), 2);
    OUT_RING  (chan, size);
    OUT_RING  (chan, 1);
@@ -155,11 +152,9 @@ nvc0_m2mf_copy_linear(struct nvc0_context *nvc0,
       MARK_RING (chan, 11, 4);
 
       BEGIN_RING(chan, RING_MF(OFFSET_OUT_HIGH), 2);
-      OUT_RELOCh(chan, dst, dstoff, dstdom | NOUVEAU_BO_WR);
-      OUT_RELOCl(chan, dst, dstoff, dstdom | NOUVEAU_BO_WR);
+      OUT_RELOChl(chan, dst, dstoff, dstdom | NOUVEAU_BO_WR);
       BEGIN_RING(chan, RING_MF(OFFSET_IN_HIGH), 2);
-      OUT_RELOCh(chan, src, srcoff, srcdom | NOUVEAU_BO_RD);
-      OUT_RELOCl(chan, src, srcoff, srcdom | NOUVEAU_BO_RD);
+      OUT_RELOChl(chan, src, srcoff, srcdom | NOUVEAU_BO_RD);
       BEGIN_RING(chan, RING_MF(LINE_LENGTH_IN), 2);
       OUT_RING  (chan, bytes);
       OUT_RING  (chan, 1);
@@ -206,8 +201,7 @@ nvc0_m2mf_push_rect(struct pipe_screen *pscreen,
       words = (line_count * line_len + 3) / 4;
 
       BEGIN_RING(chan, RING_MF(OFFSET_OUT_HIGH), 2);
-      OUT_RELOCh(chan, dst->bo, dst->base, dst->domain | NOUVEAU_BO_WR);
-      OUT_RELOCl(chan, dst->bo, dst->base, dst->domain | NOUVEAU_BO_WR);
+      OUT_RELOChl(chan, dst->bo, dst->base, dst->domain | NOUVEAU_BO_WR);
 
       BEGIN_RING(chan, RING_MF(TILING_POSITION_OUT_X), 2);
       OUT_RING  (chan, dst->x * cpp);
diff --git a/src/gallium/drivers/nvc0/nvc0_vbo.c b/src/gallium/drivers/nvc0/nvc0_vbo.c
index fd7a794..cdf1dbd 100644
--- a/src/gallium/drivers/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nvc0/nvc0_vbo.c
@@ -301,8 +301,7 @@ nvc0_tfb_setup(struct nvc0_context *nvc0)
    OUT_RING  (chan, 1);
    BEGIN_RING(chan, RING_3D(TFB_BUFFER_ENABLE(0)), 5);
    OUT_RING  (chan, 1);
-   OUT_RELOCh(chan, tfb, 0, NOUVEAU_BO_GART | NOUVEAU_BO_WR);
-   OUT_RELOCl(chan, tfb, 0, NOUVEAU_BO_GART | NOUVEAU_BO_WR);
+   OUT_RELOChl(chan, tfb, 0, NOUVEAU_BO_GART | NOUVEAU_BO_WR);
    OUT_RING  (chan, tfb->size);
    OUT_RING  (chan, 0); /* TFB_PRIMITIVE_ID(0) */
    BEGIN_RING(chan, RING_3D(TFB_UNK0700(0)), 3);
-- 
1.7.3.3
