From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: a few patches, updated
Date: Wed, 29 Jul 2009 01:32:59 +0200
Message-ID: <4A6F8AAB.8020805@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030109060900080900080804"
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
--------------030109060900080900080804
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Half of them I sent previously, now with updated reg names and
corrections, the other half is new. Read them for a description,
I'm too tired now for detailed explanations ...

Christoph

--------------030109060900080900080804
Content-Type: text/plain;
 name="0001-nv50-use-correct-scissor-reg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-nv50-use-correct-scissor-reg.patch"

From 4a2fe7e7e3dd3f7dcb1451f6ee74038897c6df7a Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 29 Jul 2009 00:35:12 +0200
Subject: [PATCH 1/8] nv50: use correct scissor reg

---
 src/gallium/drivers/nv50/nv50_screen.c         |    4 ++++
 src/gallium/drivers/nv50/nv50_state_validate.c |   23 ++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index ce8f906..349619d 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -417,6 +417,10 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_method(so, screen->tesla, 0x1234, 1);
 	so_data  (so, 1);
 
+	/* activate first scissor rectangle */
+	so_method(so, screen->tesla, NV50TCL_SCISSOR_ENABLE, 1);
+	so_data  (so, 1);
+
 	so_emit(chan, so);
 	so_ref (so, &screen->static_init);
 	so_ref (NULL, &so);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index d313e9d..03aed81 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -119,12 +119,18 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 	so_method(so, tesla, NV50TCL_VIEWPORT_HORIZ, 2);
 	so_data  (so, w << 16);
 	so_data  (so, h << 16);
-	so_method(so, tesla, 0x0e04, 2);
+	/* set window scissor rectangle to window extents */
+	so_method(so, tesla, NV50TCL_SCISSOR_HORIZ, 2);
 	so_data  (so, w << 16);
 	so_data  (so, h << 16);
-	so_method(so, tesla, 0xdf8, 2);
+	/* set window lower left corner */
+	so_method(so, tesla, NV50TCL_WINDOW_LEFT, 2);
 	so_data  (so, 0);
 	so_data  (so, h);
+	/* set screen scissor rectangle */
+	so_method(so, tesla, NV50TCL_SCREEN_SCISSOR_HORIZ, 2);
+	so_data  (so, w << 16);
+	so_data  (so, h << 16);
 
 	so_ref(so, &nv50->state.fb);
 	so_ref(NULL, &so);
@@ -233,13 +239,16 @@ nv50_state_validate(struct nv50_context *nv50)
 		nv50->state.scissor_enabled = rast->scissor;
 
 		so = so_new(3, 0);
-		so_method(so, tesla, 0x0ff4, 2);
+		so_method(so, tesla, NV50TCL_SCISSOR_HORIZ, 2);
 		if (nv50->state.scissor_enabled) {
-			so_data(so, ((s->maxx - s->minx) << 16) | s->minx);
-			so_data(so, ((s->maxy - s->miny) << 16) | s->miny);
+			/* the hw has y = 0 = bottom here */
+			unsigned top = nv50->framebuffer.height - s->miny;
+			unsigned bottom = nv50->framebuffer.height - s->maxy;
+			so_data(so, (s->maxx << 16) | s->minx);
+			so_data(so, (top << 16) | bottom);
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


--------------030109060900080900080804
Content-Type: text/plain;
 name="0002-nv50-fix-viewport-transform.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-nv50-fix-viewport-transform.patch"

From 17b8672f7f32015e58006384c8cdb14eddc05491 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 29 Jul 2009 01:21:41 +0200
Subject: [PATCH 2/8] nv50: fix viewport transform

The translation also needs to be inverted, and in bypass mode
the state tracker incorrectly assumes that Y = 0 = TOP, so we
need inversion there to; NDC clipping has to be deactivated
explicitly.
---
 src/gallium/drivers/nv50/nv50_state_validate.c |   31 +++++++++++++++--------
 1 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 03aed81..ce8e44f 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -258,6 +258,7 @@ scissor_uptodate:
 
 	if (nv50->dirty & (NV50_NEW_VIEWPORT | NV50_NEW_RASTERIZER)) {
 		unsigned bypass;
+		float y_translate = (float)nv50->framebuffer.height;
 
 		if (!nv50->rasterizer->pipe.bypass_vs_clip_and_viewport)
 			bypass = 0;
@@ -271,25 +272,33 @@ scissor_uptodate:
 		nv50->state.viewport_bypass = bypass;
 
 		so = so_new(12, 0);
+		so_method(so, tesla, NV50TCL_VIEW_VOLUME_CLIP_CTRL, 1);
 		if (!bypass) {
-			so_method(so, tesla, NV50TCL_VIEWPORT_UNK1(0), 3);
+			so_data(so, 0x0000);
+			y_translate -= nv50->viewport.translate[1];
+			so_method(so, tesla, NV50TCL_VIEWPORT_TRANSLATE(0), 3);
 			so_data  (so, fui(nv50->viewport.translate[0]));
-			so_data  (so, fui(nv50->viewport.translate[1]));
+			so_data  (so, fui(y_translate));
 			so_data  (so, fui(nv50->viewport.translate[2]));
-			so_method(so, tesla, NV50TCL_VIEWPORT_UNK0(0), 3);
+			so_method(so, tesla, NV50TCL_VIEWPORT_SCALE(0), 3);
 			so_data  (so, fui(nv50->viewport.scale[0]));
 			so_data  (so, fui(-nv50->viewport.scale[1]));
 			so_data  (so, fui(nv50->viewport.scale[2]));
-			so_method(so, tesla, 0x192c, 1);
-			so_data  (so, 1);
-			so_method(so, tesla, 0x0f90, 1);
-			so_data  (so, 0);
 		} else {
-			so_method(so, tesla, 0x192c, 1);
-			so_data  (so, 0);
-			so_method(so, tesla, 0x0f90, 1);
-			so_data  (so, 1);
+			/* don't do xy-clipping in NDC space */
+			so_data(so, 0x0800);
+			/* in bypass mode, y = 0 would be bottom */
+			so_method(so, tesla, NV50TCL_VIEWPORT_TRANSLATE(0), 3);
+			so_data  (so, fui(0.0f));
+			so_data  (so, fui(y_translate));
+			so_data  (so, fui(0.0f));
+			so_method(so, tesla, NV50TCL_VIEWPORT_SCALE(0), 3);
+			so_data  (so, fui(1.0f));
+			so_data  (so, fui(-1.0f));
+			so_data  (so, fui(1.0f));
 		}
+		so_method(so, tesla, NV50TCL_VIEWPORT_TRANSFORM_EN, 1);
+		so_data  (so, 1);
 
 		so_ref(so, &nv50->state.viewport);
 		so_ref(NULL, &so);
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain;
 name="0003-nv50-fix-sx-dx-typo-in-transfer_rect_m2mf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0003-nv50-fix-sx-dx-typo-in-transfer_rect_m2mf.patch"

From 3c0ae2090315103b380fbf7f458386c74621ebbd Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 29 Jul 2009 00:51:35 +0200
Subject: [PATCH 3/8] nv50: fix sx/dx typo in transfer_rect_m2mf

---
 src/gallium/drivers/nv50/nv50_transfer.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index d0b7f0b..6ff3759 100644
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
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain;
 name="0004-nv50-TIC-TSC-fixes-and-additions.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0004-nv50-TIC-TSC-fixes-and-additions.patch"

From 25287680e645714f457aedec6fb7a054f8c07ad9 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 29 Jul 2009 00:55:03 +0200
Subject: [PATCH 4/8] nv50: TIC/TSC fixes and additions

Red and blue were interchanged in TIC.
Add border color and some formats.
---
 src/gallium/drivers/nv50/nv50_state.c   |    7 +++-
 src/gallium/drivers/nv50/nv50_tex.c     |   16 ++++----
 src/gallium/drivers/nv50/nv50_texture.h |   71 ++++++++++++++++++++-----------
 3 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 116866a..c93694c 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -205,11 +205,16 @@ nv50_sampler_state_create(struct pipe_context *pipe,
 	}
 
 	limit = CLAMP(cso->lod_bias, -16.0, 15.0);
-	tsc[1] |= ((int)(limit * 256.0) & 0x1fff) << 11;
+	tsc[1] |= ((int)(limit * 256.0) & 0x1fff) << 12;
 
 	tsc[2] |= ((int)CLAMP(cso->max_lod, 0.0, 15.0) << 20) |
 		  ((int)CLAMP(cso->min_lod, 0.0, 15.0) << 8);
 
+	tsc[4] = fui(cso->border_color[0]);
+	tsc[5] = fui(cso->border_color[1]);
+	tsc[6] = fui(cso->border_color[2]);
+	tsc[7] = fui(cso->border_color[3]);
+
 	sso->normalized = cso->normalized_coords;
 	return (void *)sso;
 }
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index ff40c2a..46c3073 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -32,30 +32,30 @@ nv50_tex_construct(struct nv50_context *nv50, struct nouveau_stateobj *so,
 	switch (mt->base.format) {
 	case PIPE_FORMAT_A8R8G8B8_UNORM:
 		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
+			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
 			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
+			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
 			    NV50TIC_0_0_FMT_8_8_8_8);
 		break;
 	case PIPE_FORMAT_A1R5G5B5_UNORM:
 		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
+			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
 			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
+			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
 			    NV50TIC_0_0_FMT_1_5_5_5);
 		break;
 	case PIPE_FORMAT_A4R4G4B4_UNORM:
 		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
+			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
 			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
+			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
 			    NV50TIC_0_0_FMT_4_4_4_4);
 		break;
 	case PIPE_FORMAT_R5G6B5_UNORM:
 		so_data(so, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
+			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
 			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
+			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
 			    NV50TIC_0_0_FMT_5_6_5);
 		break;
 	case PIPE_FORMAT_L8_UNORM:
diff --git a/src/gallium/drivers/nv50/nv50_texture.h b/src/gallium/drivers/nv50/nv50_texture.h
index aca622c..207fb03 100644
--- a/src/gallium/drivers/nv50/nv50_texture.h
+++ b/src/gallium/drivers/nv50/nv50_texture.h
@@ -14,13 +14,13 @@
 #define NV50TIC_0_0_MAPA_C2                                       0x20000000
 #define NV50TIC_0_0_MAPA_C3                                       0x28000000
 #define NV50TIC_0_0_MAPA_ONE                                      0x38000000
-#define NV50TIC_0_0_MAPR_MASK                                     0x07000000
-#define NV50TIC_0_0_MAPR_ZERO                                     0x00000000
-#define NV50TIC_0_0_MAPR_C0                                       0x02000000
-#define NV50TIC_0_0_MAPR_C1                                       0x03000000
-#define NV50TIC_0_0_MAPR_C2                                       0x04000000
-#define NV50TIC_0_0_MAPR_C3                                       0x05000000
-#define NV50TIC_0_0_MAPR_ONE                                      0x07000000
+#define NV50TIC_0_0_MAPB_MASK                                     0x07000000
+#define NV50TIC_0_0_MAPB_ZERO                                     0x00000000
+#define NV50TIC_0_0_MAPB_C0                                       0x02000000
+#define NV50TIC_0_0_MAPB_C1                                       0x03000000
+#define NV50TIC_0_0_MAPB_C2                                       0x04000000
+#define NV50TIC_0_0_MAPB_C3                                       0x05000000
+#define NV50TIC_0_0_MAPB_ONE                                      0x07000000
 #define NV50TIC_0_0_MAPG_MASK                                     0x00e00000
 #define NV50TIC_0_0_MAPG_ZERO                                     0x00000000
 #define NV50TIC_0_0_MAPG_C0                                       0x00400000
@@ -28,31 +28,49 @@
 #define NV50TIC_0_0_MAPG_C2                                       0x00800000
 #define NV50TIC_0_0_MAPG_C3                                       0x00a00000
 #define NV50TIC_0_0_MAPG_ONE                                      0x00e00000
-#define NV50TIC_0_0_MAPB_MASK                                     0x001c0000
-#define NV50TIC_0_0_MAPB_ZERO                                     0x00000000
-#define NV50TIC_0_0_MAPB_C0                                       0x00080000
-#define NV50TIC_0_0_MAPB_C1                                       0x000c0000
-#define NV50TIC_0_0_MAPB_C2                                       0x00100000
-#define NV50TIC_0_0_MAPB_C3                                       0x00140000
-#define NV50TIC_0_0_MAPB_ONE                                      0x001c0000
+#define NV50TIC_0_0_MAPR_MASK                                     0x001c0000
+#define NV50TIC_0_0_MAPR_ZERO                                     0x00000000
+#define NV50TIC_0_0_MAPR_C0                                       0x00080000
+#define NV50TIC_0_0_MAPR_C1                                       0x000c0000
+#define NV50TIC_0_0_MAPR_C2                                       0x00100000
+#define NV50TIC_0_0_MAPR_C3                                       0x00140000
+#define NV50TIC_0_0_MAPR_ONE                                      0x001c0000
 #define NV50TIC_0_0_TYPEA_MASK                                    0x00038000
 #define NV50TIC_0_0_TYPEA_UNORM                                   0x00010000
-#define NV50TIC_0_0_TYPER_MASK                                    0x00007000
-#define NV50TIC_0_0_TYPER_UNORM                                   0x00002000
+#define NV50TIC_0_0_TYPEA_SNORM                                   0x00008000
+#define NV50TIC_0_0_TYPEA_FLOAT                                   0x00038000
+#define NV50TIC_0_0_TYPEB_MASK                                    0x00007000
+#define NV50TIC_0_0_TYPEB_UNORM                                   0x00002000
+#define NV50TIC_0_0_TYPEB_SNORM                                   0x00001000
+#define NV50TIC_0_0_TYPEB_FLOAT                                   0x00007000
 #define NV50TIC_0_0_TYPEG_MASK                                    0x00000e00
 #define NV50TIC_0_0_TYPEG_UNORM                                   0x00000400
-#define NV50TIC_0_0_TYPEB_MASK                                    0x000001c0
-#define NV50TIC_0_0_TYPEB_UNORM                                   0x00000080
-#define NV50TIC_0_0_FMT_MASK                                      0x0000003c
+#define NV50TIC_0_0_TYPEG_SNORM                                   0x00000200
+#define NV50TIC_0_0_TYPEG_FLOAT                                   0x00000e00
+#define NV50TIC_0_0_TYPER_MASK                                    0x000001c0
+#define NV50TIC_0_0_TYPER_UNORM                                   0x00000080
+#define NV50TIC_0_0_TYPER_SNORM                                   0x00000040
+#define NV50TIC_0_0_TYPER_FLOAT                                   0x000001c0
+#define NV50TIC_0_0_FMT_MASK                                      0x0000003f
+#define NV50TIC_0_0_FMT_32_32_32_32                               0x00000001
+#define NV50TIC_0_0_FMT_16_16_16_16                               0x00000003
+#define NV50TIC_0_0_FMT_32_32                                     0x00000004
 #define NV50TIC_0_0_FMT_8_8_8_8                                   0x00000008
+#define NV50TIC_0_0_FMT_2_10_10_10                                0x00000009
+#define NV50TIC_0_0_FMT_32                                        0x0000000f
 #define NV50TIC_0_0_FMT_4_4_4_4                                   0x00000012
-#define NV50TIC_0_0_FMT_1_5_5_5                                   0x00000013
+/* #define NV50TIC_0_0_FMT_1_5_5_5                                0x00000013 */
+#define NV50TIC_0_0_FMT_1_5_5_5                                   0x00000014
 #define NV50TIC_0_0_FMT_5_6_5                                     0x00000015
 #define NV50TIC_0_0_FMT_8_8                                       0x00000018
+#define NV50TIC_0_0_FMT_16                                        0x0000001b
 #define NV50TIC_0_0_FMT_8                                         0x0000001d
+#define NV50TIC_0_0_FMT_10_11_11                                  0x00000021
 #define NV50TIC_0_0_FMT_DXT1                                      0x00000024
 #define NV50TIC_0_0_FMT_DXT3                                      0x00000025
 #define NV50TIC_0_0_FMT_DXT5                                      0x00000026
+#define NV50TIC_0_0_FMT_RGTC1                                     0x00000027
+#define NV50TIC_0_0_FMT_RGTC2                                     0x00000028
 
 #define NV50TIC_0_1_OFFSET_LOW_MASK                               0xffffffff
 #define NV50TIC_0_1_OFFSET_LOW_SHIFT                                       0
@@ -102,6 +120,7 @@
 #define NV50TSC_1_0_WRAPR_MIRROR_CLAMP_TO_EDGE                   0x00000140
 #define NV50TSC_1_0_WRAPR_MIRROR_CLAMP_TO_BORDER                 0x00000180
 #define NV50TSC_1_0_WRAPR_MIRROR_CLAMP                           0x000001c0
+#define NV50TSC_1_0_MAX_ANISOTROPY_MASK                          0x00700000
 
 #define NV50TSC_1_1_MAGF_MASK                                    0x00000003
 #define NV50TSC_1_1_MAGF_NEAREST                                 0x00000001
@@ -113,17 +132,19 @@
 #define NV50TSC_1_1_MIPF_NONE                                    0x00000040
 #define NV50TSC_1_1_MIPF_NEAREST                                 0x00000080
 #define NV50TSC_1_1_MIPF_LINEAR                                  0x000000c0
+#define NV50TSC_1_1_LOD_BIAS_MASK                                0x01fff000
 
-#define NV50TSC_1_2_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_2_MIN_LOD_MASK                                 0x00000f00
+#define NV50TSC_1_2_MAX_LOD_MASK                                 0x00f00000
 
 #define NV50TSC_1_3_UNKNOWN_MASK                                 0xffffffff
 
-#define NV50TSC_1_4_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_4_BORDER_COLOR_RED_MASK                        0xffffffff
 
-#define NV50TSC_1_5_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_5_BORDER_COLOR_GREEN_MASK                      0xffffffff
 
-#define NV50TSC_1_6_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_6_BORDER_COLOR_BLUE_MASK                       0xffffffff
 
-#define NV50TSC_1_7_UNKNOWN_MASK                                 0xffffffff
+#define NV50TSC_1_7_BORDER_COLOR_ALPHA_MASK                      0xffffffff
 
 #endif
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain;
 name="0005-nv50-should-use-uint32_t-ptr-in-draw_elements_inline.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0005-nv50-should-use-uint32_t-ptr-in-draw_elements_inline.pa";
 filename*1="tch"

From d72930b4d92441f2c8d4c11137db3253195578a0 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Tue, 28 Jul 2009 17:21:31 +0200
Subject: [PATCH 5/8] nv50: should use uint32_t ptr in draw_elements_inline_u32

---
 src/gallium/drivers/nv50/nv50_vbo.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index f81929f..cbd9d6a 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -139,7 +139,7 @@ nv50_draw_elements_inline_u16(struct nv50_context *nv50, uint16_t *map,
 }
 
 static INLINE void
-nv50_draw_elements_inline_u32(struct nv50_context *nv50, uint8_t *map,
+nv50_draw_elements_inline_u32(struct nv50_context *nv50, uint32_t *map,
 			      unsigned start, unsigned count)
 {
 	struct nouveau_channel *chan = nv50->screen->tesla->channel;
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain;
 name="0006-nv50-support-more-vtxelt-formats.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0006-nv50-support-more-vtxelt-formats.patch"

From 7ca453090979a133bc81be682d6b006947ef756d Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Tue, 28 Jul 2009 17:34:07 +0200
Subject: [PATCH 6/8] nv50: support more vtxelt formats

NOTE: we must not try to emit buffer relocations when
vtxbuf_nr is 0 but vtxelt_nr is not
---
 src/gallium/drivers/nv50/nv50_vbo.c |   80 ++++++++++++++++++++++++----------
 1 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index cbd9d6a..422c8c6 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -49,6 +49,57 @@ nv50_prim(unsigned mode)
 	return NV50TCL_VERTEX_BEGIN_POINTS;
 }
 
+static INLINE unsigned
+nv50_vtxeltfmt(unsigned pf)
+{
+	static const uint8_t vtxelt_32[4] = { 0x90, 0x20, 0x10, 0x08 };
+	static const uint8_t vtxelt_16[4] = { 0xd8, 0x78, 0x28, 0x18 };
+	static const uint8_t vtxelt_08[4] = { 0xe8, 0xc0, 0x98, 0x50 };
+
+	unsigned nf, c = 0;
+
+	switch (pf_type(pf)) {
+	case PIPE_FORMAT_TYPE_FLOAT:
+		nf = NV50TCL_VERTEX_ARRAY_ATTRIB_TYPE_FLOAT; break;
+	case PIPE_FORMAT_TYPE_UNORM:
+		nf = NV50TCL_VERTEX_ARRAY_ATTRIB_TYPE_UNORM; break;
+	case PIPE_FORMAT_TYPE_SNORM:
+		nf = NV50TCL_VERTEX_ARRAY_ATTRIB_TYPE_SNORM; break;
+	case PIPE_FORMAT_TYPE_USCALED:
+		nf = NV50TCL_VERTEX_ARRAY_ATTRIB_TYPE_USCALED; break;
+	case PIPE_FORMAT_TYPE_SSCALED:
+		nf = NV50TCL_VERTEX_ARRAY_ATTRIB_TYPE_SSCALED; break;
+	default:
+		NOUVEAU_ERR("invalid vbo type %d\n",pf_type(pf));
+		assert(0);
+		nf = NV50TCL_VERTEX_ARRAY_ATTRIB_TYPE_FLOAT;
+		break;
+	}
+
+	if (pf_size_y(pf)) c++;
+	if (pf_size_z(pf)) c++;
+	if (pf_size_w(pf)) c++;
+
+	if (pf_exp2(pf) == 3) {
+		switch (pf_size_x(pf)) {
+		case 1: return (nf | (vtxelt_08[c] << 16));
+		case 2: return (nf | (vtxelt_16[c] << 16));
+		case 4: return (nf | (vtxelt_32[c] << 16));
+		default:
+			break;
+		}
+	} else
+	if (pf_exp2(pf) == 6 && pf_size_x(pf) == 1) {
+		NOUVEAU_ERR("unsupported vbo component size 64\n");
+		assert(0);
+		return (nf | 0x08000000);
+	}
+
+	NOUVEAU_ERR("invalid vbo format %s\n",pf_name(pf));
+	assert(0);
+	return (nf | 0x08000000);
+}
+
 boolean
 nv50_draw_arrays(struct pipe_context *pipe, unsigned mode, unsigned start,
 		 unsigned count)
@@ -208,6 +259,10 @@ nv50_vbo_validate(struct nv50_context *nv50)
 	struct nouveau_stateobj *vtxbuf, *vtxfmt;
 	int i;
 
+	/* don't validate if Gallium took away our buffers */
+	if (nv50->vtxbuf_nr == 0)
+		return;
+
 	vtxbuf = so_new(nv50->vtxelt_nr * 4, nv50->vtxelt_nr * 2);
 	vtxfmt = so_new(nv50->vtxelt_nr + 1, 0);
 	so_method(vtxfmt, tesla, 0x1ac0, nv50->vtxelt_nr);
@@ -218,30 +273,7 @@ nv50_vbo_validate(struct nv50_context *nv50)
 			&nv50->vtxbuf[ve->vertex_buffer_index];
 		struct nouveau_bo *bo = nouveau_bo(vb->buffer);
 
-		switch (ve->src_format) {
-		case PIPE_FORMAT_R32G32B32A32_FLOAT:
-			so_data(vtxfmt, 0x7e080000 | i);
-			break;
-		case PIPE_FORMAT_R32G32B32_FLOAT:
-			so_data(vtxfmt, 0x7e100000 | i);
-			break;
-		case PIPE_FORMAT_R32G32_FLOAT:
-			so_data(vtxfmt, 0x7e200000 | i);
-			break;
-		case PIPE_FORMAT_R32_FLOAT:
-			so_data(vtxfmt, 0x7e900000 | i);
-			break;
-		case PIPE_FORMAT_R8G8B8A8_UNORM:
-			so_data(vtxfmt, 0x24500000 | i);
-			break;
-		default:
-		{
-			NOUVEAU_ERR("invalid vbo format %s\n",
-				    pf_name(ve->src_format));
-			assert(0);
-			return;
-		}
-		}
+		so_data(vtxfmt, nv50_vtxeltfmt(ve->src_format) | i);
 
 		so_method(vtxbuf, tesla, 0x900 + (i * 16), 3);
 		so_data  (vtxbuf, 0x20000000 | vb->stride);
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain;
 name="0007-nv50-use-new-2D-surface-format-names.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0007-nv50-use-new-2D-surface-format-names.patch"

From 80706efc3d71865fc9a3a3acda0a7e2f34ea32ab Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Tue, 28 Jul 2009 17:38:28 +0200
Subject: [PATCH 7/8] nv50: use new 2D surface format names

---
 src/gallium/drivers/nv50/nv50_surface.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_surface.c b/src/gallium/drivers/nv50/nv50_surface.c
index 3da9d6e..31c36a1 100644
--- a/src/gallium/drivers/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nv50/nv50_surface.c
@@ -35,13 +35,13 @@ nv50_format(enum pipe_format format)
 {
 	switch (format) {
 	case PIPE_FORMAT_A8R8G8B8_UNORM:
-		return NV50_2D_DST_FORMAT_32BPP;
+		return NV50_2D_DST_FORMAT_A8R8G8B8_UNORM;
 	case PIPE_FORMAT_X8R8G8B8_UNORM:
-		return NV50_2D_DST_FORMAT_24BPP;
+		return NV50_2D_DST_FORMAT_X8R8G8B8_UNORM;
 	case PIPE_FORMAT_R5G6B5_UNORM:
-		return NV50_2D_DST_FORMAT_16BPP;
+		return NV50_2D_DST_FORMAT_R5G6B5_UNORM;
 	case PIPE_FORMAT_A8_UNORM:
-		return NV50_2D_DST_FORMAT_8BPP;
+		return NV50_2D_DST_FORMAT_R8_UNORM;
 	default:
 		return -1;
 	}
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain;
 name="0008-nv50-correct-zeta-formats.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0008-nv50-correct-zeta-formats.patch"

From 92bd0d46fa55f0f2a154d150fbb69b3daf7bbd2c Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 29 Jul 2009 01:07:52 +0200
Subject: [PATCH 8/8] nv50: correct zeta formats

What was Z24S8 before is actually S8Z24, and what we had for Z16
is actually X8Z24. Now, we also have the REAL Z24S8 and I added
Z32_FLOAT as well; most of the formats need different tile_flags.
---
 src/gallium/drivers/nv50/nv50_miptree.c        |    9 +++++++--
 src/gallium/drivers/nv50/nv50_screen.c         |    5 +++--
 src/gallium/drivers/nv50/nv50_state_validate.c |   15 ++++++++++-----
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 22465e0..c839279 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -42,9 +42,14 @@ nv50_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *tmp)
 	mt->base.screen = pscreen;
 
 	switch (pt->format) {
-	case PIPE_FORMAT_Z24X8_UNORM:
+	case PIPE_FORMAT_Z32_FLOAT:
+		tile_flags = 0x4800;
+		break;
 	case PIPE_FORMAT_Z24S8_UNORM:
-	case PIPE_FORMAT_Z16_UNORM:
+		tile_flags = 0x1800;
+		break;
+	case PIPE_FORMAT_X8Z24_UNORM:
+	case PIPE_FORMAT_S8Z24_UNORM:
 		tile_flags = 0x2800;
 		break;
 	default:
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 349619d..0f6b1ae 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -44,9 +44,10 @@ nv50_screen_is_format_supported(struct pipe_screen *pscreen,
 	} else
 	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
 		switch (format) {
+		case PIPE_FORMAT_Z32_FLOAT:
 		case PIPE_FORMAT_Z24S8_UNORM:
-		case PIPE_FORMAT_Z24X8_UNORM:
-		case PIPE_FORMAT_Z16_UNORM:
+		case PIPE_FORMAT_X8Z24_UNORM:
+		case PIPE_FORMAT_S8Z24_UNORM:
 			return TRUE;
 		default:
 			break;
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index ce8e44f..4a49b10 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -92,17 +92,22 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 		so_reloc (so, bo, fb->zsbuf->offset, NOUVEAU_BO_VRAM |
 			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
 		switch (fb->zsbuf->format) {
+		case PIPE_FORMAT_Z32_FLOAT:
+			so_data(so, NV50TCL_ZETA_FORMAT_Z32_FLOAT);
+			break;
 		case PIPE_FORMAT_Z24S8_UNORM:
-		case PIPE_FORMAT_Z24X8_UNORM:
-			so_data(so, 0x16);
+			so_data(so, NV50TCL_ZETA_FORMAT_Z24S8_UNORM);
+			break;
+		case PIPE_FORMAT_X8Z24_UNORM:
+			so_data(so, NV50TCL_ZETA_FORMAT_X8Z24_UNORM);
 			break;
-		case PIPE_FORMAT_Z16_UNORM:
-			so_data(so, 0x15);
+		case PIPE_FORMAT_S8Z24_UNORM:
+			so_data(so, NV50TCL_ZETA_FORMAT_S8Z24_UNORM);
 			break;
 		default:
 			NOUVEAU_ERR("AIIII unknown format %s\n",
 				    pf_name(fb->zsbuf->format));
-			so_data(so, 0x16);
+			so_data(so, NV50TCL_ZETA_FORMAT_S8Z24_UNORM);
 			break;
 		}
 		so_data(so, bo->tile_mode << 4);
-- 
1.6.3.3


--------------030109060900080900080804
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------030109060900080900080804--
