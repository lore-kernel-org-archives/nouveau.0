From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: fix viewport & scissoring
Date: Sun, 12 Jul 2009 15:56:54 +0200
Message-ID: <4A59EBA6.9010803@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050205000506050205030809"
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

This is a multi-part message in MIME format.
--------------050205000506050205030809
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

These patches should fix viewport and scissoring
being y-inverted.
The effect should be visible in the gearbox demo.

Christoph

--------------050205000506050205030809
Content-Type: text/plain;
 name="0001-nv50-use-correct-scissor-reg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-nv50-use-correct-scissor-reg.patch"

From 2bd1767340698ff6efb38c1869febdde52c4369d Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 12 Jul 2009 15:39:41 +0200
Subject: [PATCH 1/3] nv50: use correct scissor reg

---
 src/gallium/drivers/nv50/nv50_screen.c         |    4 ++++
 src/gallium/drivers/nv50/nv50_state_validate.c |   21 +++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index b4d6530..fd41d88 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -416,6 +416,10 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_method(so, screen->tesla, 0x1234, 1);
 	so_data  (so, 1);
 
+	/* activate first scissor rectangle */
+	so_method(so, screen->tesla, 0x0e00, 1);
+	so_data  (so, 1);
+
 	so_emit(chan, so);
 	so_ref (so, &screen->static_init);
 	so_ref (NULL, &so);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 1edf741..4981b1b 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -124,12 +124,18 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 	so_method(so, tesla, NV50TCL_VIEWPORT_HORIZ, 2);
 	so_data  (so, w << 16);
 	so_data  (so, h << 16);
+	/* set window scissor rectangle to window extents */
 	so_method(so, tesla, 0x0e04, 2);
 	so_data  (so, w << 16);
 	so_data  (so, h << 16);
-	so_method(so, tesla, 0xdf8, 2);
+	/* set window lower left corner */
+	so_method(so, tesla, 0x0df8, 2);
 	so_data  (so, 0);
 	so_data  (so, h);
+	/* set screen scissor rectangle */
+	so_method(so, tesla, 0x0ff4, 2);
+	so_data  (so, w << 16);
+	so_data  (so, h << 16);
 
 	so_ref(so, &nv50->state.fb);
 	so_ref(NULL, &so);
@@ -238,13 +244,16 @@ nv50_state_validate(struct nv50_context *nv50)
 		nv50->state.scissor_enabled = rast->scissor;
 
 		so = so_new(3, 0);
-		so_method(so, tesla, 0x0ff4, 2);
+		so_method(so, tesla, 0x0e04, 2);
 		if (nv50->state.scissor_enabled) {
-			so_data(so, ((s->maxx - s->minx) << 16) | s->minx);
-			so_data(so, ((s->maxy - s->miny) << 16) | s->miny);
+			/* pipe always uses Y_0_TOP for scissor state */
+			unsigned scs_top = nv50->framebuffer.height - s->miny;
+			unsigned scs_btm = nv50->framebuffer.height - s->maxy;
+			so_data(so, (s->maxx << 16) | s->minx);
+			so_data(so, (scs_top << 16) | scs_btm);
 		} else {
-			so_data(so, (8192 << 16));
-			so_data(so, (8192 << 16));
+			so_data(so, (nv50->framebuffer.width << 16));
+			so_data(so, (nv50->framebuffer.height << 16));
 		}
 		so_ref(so, &nv50->state.scissor);
 		so_ref(NULL, &so);
-- 
1.6.3.3


--------------050205000506050205030809
Content-Type: text/plain;
 name="0002-nv50-fix-viewport-transform.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-nv50-fix-viewport-transform.patch"

From b5e44bc72717c9774e943cb7073b662a4bf74967 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 12 Jul 2009 15:45:57 +0200
Subject: [PATCH 2/3] nv50: fix viewport transform

We need to invert the viewport translate/scale parameters
when the state tracker thinks we have Y_0_TOP.

If these cases, we have do to bypass mode by setting an
identity viewport transform for x, z and inversion for y,
or p.e. clear_with_quad won't work correctly.
Clipping for xy in NDC space needs to be disabled then.
---
 src/gallium/drivers/nv50/nv50_context.h        |    1 +
 src/gallium/drivers/nv50/nv50_state_validate.c |   55 +++++++++++++++++-------
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 9b8cc4d..f66e0f2 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -140,6 +140,7 @@ struct nv50_context {
 	struct pipe_scissor_state scissor;
 	struct pipe_viewport_state viewport;
 	struct pipe_framebuffer_state framebuffer;
+	int fb_invert_y;
 	struct nv50_program *vertprog;
 	struct nv50_program *fragprog;
 	struct pipe_buffer *constbuf[PIPE_SHADER_TYPES];
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 4981b1b..b65301b 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -31,6 +31,11 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 	struct pipe_framebuffer_state *fb = &nv50->framebuffer;
 	unsigned i, w, h, gw = 0;
 
+	nv50->fb_invert_y = 0;
+	if (fb->nr_cbufs && (fb->cbufs[0]->texture->tex_usage &
+			     PIPE_TEXTURE_USAGE_DISPLAY_TARGET))
+		nv50->fb_invert_y = fb->cbufs[0]->height;
+
 	for (i = 0; i < fb->nr_cbufs; i++) {
 		struct pipe_texture *pt = fb->cbufs[i]->texture;
 		struct nouveau_bo *bo = nv50_miptree(pt)->bo;
@@ -263,6 +268,7 @@ scissor_uptodate:
 
 	if (nv50->dirty & (NV50_NEW_VIEWPORT | NV50_NEW_RASTERIZER)) {
 		unsigned bypass;
+		struct pipe_viewport_state viewp;
 
 		if (!nv50->rasterizer->pipe.bypass_vs_clip_and_viewport)
 			bypass = 0;
@@ -277,25 +283,42 @@ scissor_uptodate:
 
 		so = so_new(12, 0);
 		if (!bypass) {
-			so_method(so, tesla, NV50TCL_VIEWPORT_UNK1(0), 3);
-			so_data  (so, fui(nv50->viewport.translate[0]));
-			so_data  (so, fui(nv50->viewport.translate[1]));
-			so_data  (so, fui(nv50->viewport.translate[2]));
-			so_method(so, tesla, NV50TCL_VIEWPORT_UNK0(0), 3);
-			so_data  (so, fui(nv50->viewport.scale[0]));
-			so_data  (so, fui(-nv50->viewport.scale[1]));
-			so_data  (so, fui(nv50->viewport.scale[2]));
-			so_method(so, tesla, 0x192c, 1);
-			so_data  (so, 1);
-			so_method(so, tesla, 0x0f90, 1);
-			so_data  (so, 0);
+			memcpy(&viewp, &nv50->viewport, sizeof(viewp));
+
+			if (nv50->fb_invert_y) {
+				viewp.scale[1] = -nv50->viewport.scale[1];
+				viewp.translate[1] = (float)nv50->fb_invert_y -
+					nv50->viewport.translate[1];
+			}
+			so_method(so, tesla, 0x193c, 1);
+			so_data  (so, 0x0000);
 		} else {
-			so_method(so, tesla, 0x192c, 1);
-			so_data  (so, 0);
-			so_method(so, tesla, 0x0f90, 1);
-			so_data  (so, 1);
+			viewp.scale[0] = viewp.scale[2] = 1.0f;
+			viewp.translate[0] = viewp.translate[2] = 0.0f;
+
+			if (nv50->fb_invert_y) {
+				viewp.scale[1] = -1.0f;
+				viewp.translate[1] = (float)nv50->fb_invert_y;
+			} else {
+				viewp.scale[1] = 1.0f;
+				viewp.translate[1] = 0.0f;
+			}
+			/* don't do xy-clipping in NDC space */
+			so_method(so, tesla, 0x193c, 1);
+			so_data  (so, 0x0800);
 		}
 
+		so_method(so, tesla, 0x192c, 1);
+		so_data  (so, 1);
+		so_method(so, tesla, NV50TCL_VIEWPORT_UNK1(0), 3);
+		so_data  (so, fui(viewp.translate[0]));
+		so_data  (so, fui(viewp.translate[1]));
+		so_data  (so, fui(viewp.translate[2]));
+		so_method(so, tesla, NV50TCL_VIEWPORT_UNK0(0), 3);
+		so_data  (so, fui(viewp.scale[0]));
+		so_data  (so, fui(viewp.scale[1]));
+		so_data  (so, fui(viewp.scale[2]));
+
 		so_ref(so, &nv50->state.viewport);
 		so_ref(NULL, &so);
 		nv50->state.dirty |= NV50_NEW_VIEWPORT;
-- 
1.6.3.3


--------------050205000506050205030809
Content-Type: text/plain;
 name="0003-nv50-invert-y-coordinates-in-transfers-if-needed.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0003-nv50-invert-y-coordinates-in-transfers-if-needed.patch"

From 345fe5b25c1fbc0bfbff1c93ca3f2d43f7752801 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 12 Jul 2009 15:51:16 +0200
Subject: [PATCH 3/3] nv50: invert y coordinates in transfers if needed

When the state tracker assumes Y_0_BOTTOM (i.e. when rendering
to an OpenGL FBO), we need to invert the y coordinates as well,
since for M2MF, y = 0 is the beginning of the memory area.
---
 src/gallium/drivers/nv50/nv50_transfer.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index d0b7f0b..f6a8a47 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -76,13 +76,13 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct nouveau_bo *src_bo,
 		OUT_RELOCl(chan, dst_bo, dst_offset, dst_reloc);
 		if (src_bo->tile_flags) {
 			BEGIN_RING(chan, m2mf, 0x0218, 1);
-			OUT_RING  (chan, (dy << 16) | sx);
+			OUT_RING  (chan, (sy << 16) | sx);
 		} else {
 			src_offset += (line_count * src_pitch);
 		}
 		if (dst_bo->tile_flags) {
 			BEGIN_RING(chan, m2mf, 0x0234, 1);
-			OUT_RING  (chan, (sy << 16) | dx);
+			OUT_RING  (chan, (dy << 16) | dx);
 		} else {
 			dst_offset += (line_count * dst_pitch);
 		}
@@ -112,6 +112,9 @@ nv50_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	unsigned image = 0;
 	int ret;
 
+	if (!(pt->tex_usage & PIPE_TEXTURE_USAGE_DISPLAY_TARGET))
+		y = pt->height[level] - y - h;
+
 	if (pt->target == PIPE_TEXTURE_CUBE)
 		image = face;
 	else
-- 
1.6.3.3


--------------050205000506050205030809
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------050205000506050205030809--
