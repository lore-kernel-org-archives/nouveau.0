From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [MESA PATCH 5/5] nv50: update after nouveau_class.h update
Date: Fri, 25 Dec 2009 22:40:12 +0100
Message-ID: <20091225214012.GE15610@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
 src/gallium/drivers/nv50/nv50_program.c        |    2 +-
 src/gallium/drivers/nv50/nv50_screen.c         |   17 ++++++++---------
 src/gallium/drivers/nv50/nv50_state_validate.c |   10 +++++-----
 src/gallium/drivers/nv50/nv50_transfer.c       |    8 ++++----
 src/gallium/drivers/nv50/nv50_vbo.c            |   24 ++++++++++++------------
 5 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index a101ac0..d3b0180 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -3498,7 +3498,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	so_data  (so, p->cfg.high_temp);
 	so_method(so, tesla, NV50TCL_FP_RESULT_COUNT, 1);
 	so_data  (so, p->cfg.high_result);
-	so_method(so, tesla, NV50TCL_FP_CTRL_UNK19A8, 1);
+	so_method(so, tesla, NV50TCL_FP_CONTROL, 1);
 	so_data  (so, p->cfg.regs[2]);
 	so_method(so, tesla, NV50TCL_FP_CTRL_UNK196C, 1);
 	so_data  (so, p->cfg.regs[3]);
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 5a1efd3..16f22a8 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -301,13 +301,12 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_data  (so, 1);
 	so_method(so, screen->tesla, NV50TCL_DMA_NOTIFY, 1);
 	so_data  (so, screen->sync->handle);
-	so_method(so, screen->tesla, NV50TCL_DMA_UNK0(0),
-				     NV50TCL_DMA_UNK0__SIZE);
-	for (i = 0; i < NV50TCL_DMA_UNK0__SIZE; i++)
+	so_method(so, screen->tesla, NV50TCL_DMA_ZETA, 11);
+	for (i = 0; i < 11; i++)
 		so_data(so, chan->vram->handle);
-	so_method(so, screen->tesla, NV50TCL_DMA_UNK1(0),
-				     NV50TCL_DMA_UNK1__SIZE);
-	for (i = 0; i < NV50TCL_DMA_UNK1__SIZE; i++)
+	so_method(so, screen->tesla, NV50TCL_DMA_COLOR(0),
+				     NV50TCL_DMA_COLOR__SIZE);
+	for (i = 0; i < NV50TCL_DMA_COLOR__SIZE; i++)
 		so_data(so, chan->vram->handle);
 	so_method(so, screen->tesla, 0x121c, 1);
 	so_data  (so, 1);
@@ -424,12 +423,12 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* Vertex array limits - max them out */
 	for (i = 0; i < 16; i++) {
-		so_method(so, screen->tesla, NV50TCL_UNK1080_OFFSET_HIGH(i), 2);
+		so_method(so, screen->tesla, NV50TCL_VERTEX_ARRAY_LIMIT_HIGH(i), 2);
 		so_data  (so, 0x000000ff);
 		so_data  (so, 0xffffffff);
 	}
 
-	so_method(so, screen->tesla, NV50TCL_DEPTH_RANGE_NEAR, 2);
+	so_method(so, screen->tesla, NV50TCL_DEPTH_RANGE_NEAR(0), 2);
 	so_data  (so, fui(0.0));
 	so_data  (so, fui(1.0));
 
@@ -438,7 +437,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_data  (so, 1);
 
 	/* activate first scissor rectangle */
-	so_method(so, screen->tesla, NV50TCL_SCISSOR_ENABLE, 1);
+	so_method(so, screen->tesla, NV50TCL_SCISSOR_ENABLE(0), 1);
 	so_data  (so, 1);
 
 	so_method(so, screen->tesla, 0x15e4, 1);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 871e809..0b6b672 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -135,11 +135,11 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 		so_data  (so, 0);
 	}
 
-	so_method(so, tesla, NV50TCL_VIEWPORT_HORIZ, 2);
+	so_method(so, tesla, NV50TCL_VIEWPORT_HORIZ(0), 2);
 	so_data  (so, w << 16);
 	so_data  (so, h << 16);
 	/* set window lower left corner */
-	so_method(so, tesla, NV50TCL_WINDOW_LEFT, 2);
+	so_method(so, tesla, NV50TCL_WINDOW_OFFSET_X, 2);
 	so_data  (so, 0);
 	so_data  (so, 0);
 	/* set screen scissor rectangle */
@@ -325,7 +325,7 @@ nv50_state_validate(struct nv50_context *nv50)
 		nv50->state.scissor_enabled = rast->scissor;
 
 		so = so_new(3, 0);
-		so_method(so, tesla, NV50TCL_SCISSOR_HORIZ, 2);
+		so_method(so, tesla, NV50TCL_SCISSOR_HORIZ(0), 2);
 		if (nv50->state.scissor_enabled) {
 			so_data(so, (s->maxx << 16) | s->minx);
 			so_data(so, (s->maxy << 16) | s->miny);
@@ -355,11 +355,11 @@ scissor_uptodate:
 
 		so = so_new(14, 0);
 		if (!bypass) {
-			so_method(so, tesla, NV50TCL_VIEWPORT_TRANSLATE(0), 3);
+			so_method(so, tesla, NV50TCL_VIEWPORT_TRANSLATE_X(0), 3);
 			so_data  (so, fui(nv50->viewport.translate[0]));
 			so_data  (so, fui(nv50->viewport.translate[1]));
 			so_data  (so, fui(nv50->viewport.translate[2]));
-			so_method(so, tesla, NV50TCL_VIEWPORT_SCALE(0), 3);
+			so_method(so, tesla, NV50TCL_VIEWPORT_SCALE_X(0), 3);
 			so_data  (so, fui(nv50->viewport.scale[0]));
 			so_data  (so, fui(nv50->viewport.scale[1]));
 			so_data  (so, fui(nv50->viewport.scale[2]));
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 4d9afa6..53e34a4 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -47,7 +47,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 			NV50_MEMORY_TO_MEMORY_FORMAT_LINEAR_IN, 1);
 		OUT_RING  (chan, 1);
 		BEGIN_RING(chan, m2mf,
-			NV50_MEMORY_TO_MEMORY_FORMAT_PITCH_IN, 1);
+			NV04_MEMORY_TO_MEMORY_FORMAT_PITCH_IN, 1);
 		OUT_RING  (chan, src_pitch);
 		src_offset += (sy * src_pitch) + (sx * cpp);
 	} else {
@@ -66,7 +66,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 			NV50_MEMORY_TO_MEMORY_FORMAT_LINEAR_OUT, 1);
 		OUT_RING  (chan, 1);
 		BEGIN_RING(chan, m2mf,
-			NV50_MEMORY_TO_MEMORY_FORMAT_PITCH_OUT, 1);
+			NV04_MEMORY_TO_MEMORY_FORMAT_PITCH_OUT, 1);
 		OUT_RING  (chan, dst_pitch);
 		dst_offset += (dy * dst_pitch) + (dx * cpp);
 	} else {
@@ -89,7 +89,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 		OUT_RELOCh(chan, src_bo, src_offset, src_reloc);
 		OUT_RELOCh(chan, dst_bo, dst_offset, dst_reloc);
 		BEGIN_RING(chan, m2mf,
-			NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN, 2);
+			NV04_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN, 2);
 		OUT_RELOCl(chan, src_bo, src_offset, src_reloc);
 		OUT_RELOCl(chan, dst_bo, dst_offset, dst_reloc);
 		if (src_bo->tile_flags) {
@@ -107,7 +107,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 			dst_offset += (line_count * dst_pitch);
 		}
 		BEGIN_RING(chan, m2mf,
-			NV50_MEMORY_TO_MEMORY_FORMAT_LINE_LENGTH_IN, 4);
+			NV04_MEMORY_TO_MEMORY_FORMAT_LINE_LENGTH_IN, 4);
 		OUT_RING  (chan, width * cpp);
 		OUT_RING  (chan, line_count);
 		OUT_RING  (chan, 0x00000101);
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 39324e3..ac29ae0 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -99,19 +99,19 @@ nv50_vbo_size_to_hw(unsigned size, unsigned nr_c)
 {
 	static const uint32_t hw_values[] = {
 		0, 0, 0, 0,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_8,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_8_8,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_8_8_8,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_8_8_8_8,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_16,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_16_16,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_16_16_16,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_16_16_16_16,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_8,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_8_8,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_8_8_8,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_8_8_8_8,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_16,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_16_16,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_16_16_16,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_16_16_16_16,
 		0, 0, 0, 0,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_32,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_32_32,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_32_32_32,
-		NV50TCL_VERTEX_ARRAY_ATTRIB_SIZE_32_32_32_32 };
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_32,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_32_32,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_32_32_32,
+		NV50TCL_VERTEX_ARRAY_ATTRIB_FORMAT_32_32_32_32 };
 
 	/* we'd also have R11G11B10 and R10G10B10A2 */
 
-- 
1.6.6.rc3
