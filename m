From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: vertex shader textures
Date: Thu, 10 Dec 2009 21:01:11 +0100
Message-ID: <4B215387.4050900@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080406050308070609060005"
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
--------------080406050308070609060005
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Maybe someone wants to have a look at this ... should work.

Thanks, Christoph

--------------080406050308070609060005
Content-Type: text/plain;
 name="0001-nv50-support-vertex-program-textures.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-nv50-support-vertex-program-textures.patch"

From 7ecd5a88d637a2199103dc321dc649b68e84cbbd Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Dec 2009 20:50:02 +0100
Subject: [PATCH 1/8] nv50: support vertex program textures

---
 src/gallium/drivers/nv50/nv50_context.h        |   12 ++--
 src/gallium/drivers/nv50/nv50_screen.c         |   17 +++--
 src/gallium/drivers/nv50/nv50_state.c          |   59 +++++++++++----
 src/gallium/drivers/nv50/nv50_state_validate.c |   52 ++++++++++----
 src/gallium/drivers/nv50/nv50_tex.c            |   90 +++++++++++++++--------
 5 files changed, 156 insertions(+), 74 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 79135f2..5578a58 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -126,7 +126,7 @@ struct nv50_state {
 	unsigned viewport_bypass;
 	struct nouveau_stateobj *tsc_upload;
 	struct nouveau_stateobj *tic_upload;
-	unsigned miptree_nr;
+	unsigned miptree_nr[PIPE_SHADER_TYPES];
 	struct nouveau_stateobj *vertprog;
 	struct nouveau_stateobj *fragprog;
 	struct nouveau_stateobj *programs;
@@ -162,10 +162,10 @@ struct nv50_context {
 	unsigned vtxbuf_nr;
 	struct pipe_vertex_element vtxelt[PIPE_MAX_ATTRIBS];
 	unsigned vtxelt_nr;
-	struct nv50_sampler_stateobj *sampler[PIPE_MAX_SAMPLERS];
-	unsigned sampler_nr;
-	struct nv50_miptree *miptree[PIPE_MAX_SAMPLERS];
-	unsigned miptree_nr;
+	struct nv50_sampler_stateobj *sampler[PIPE_SHADER_TYPES][PIPE_MAX_SAMPLERS];
+	unsigned sampler_nr[PIPE_SHADER_TYPES];
+	struct nv50_miptree *miptree[PIPE_SHADER_TYPES][PIPE_MAX_SAMPLERS];
+	unsigned miptree_nr[PIPE_SHADER_TYPES];
 
 	uint16_t vbo_fifo;
 };
@@ -218,7 +218,7 @@ extern void nv50_state_flush_notify(struct nouveau_channel *chan);
 extern void nv50_so_init_sifc(struct nv50_context *nv50,
 			      struct nouveau_stateobj *so,
 			      struct nouveau_bo *bo, unsigned reloc,
-			      unsigned size);
+			      unsigned offset, unsigned size);
 
 /* nv50_tex.c */
 extern void nv50_tex_validate(struct nv50_context *);
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index e1b2f11..b3d3d20 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -97,6 +97,10 @@ nv50_screen_get_param(struct pipe_screen *pscreen, int param)
 	switch (param) {
 	case PIPE_CAP_MAX_TEXTURE_IMAGE_UNITS:
 		return 32;
+	case PIPE_CAP_MAX_VERTEX_TEXTURE_UNITS:
+		return 32;
+	case PIPE_CAP_MAX_COMBINED_SAMPLERS:
+		return 64;
 	case PIPE_CAP_NPOT_TEXTURES:
 		return 1;
 	case PIPE_CAP_TWO_SIDED_STENCIL:
@@ -122,8 +126,6 @@ nv50_screen_get_param(struct pipe_screen *pscreen, int param)
 	case PIPE_CAP_TEXTURE_MIRROR_CLAMP:
 	case PIPE_CAP_TEXTURE_MIRROR_REPEAT:
 		return 1;
-	case PIPE_CAP_MAX_VERTEX_TEXTURE_UNITS:
-		return 0;
 	case PIPE_CAP_TGSI_CONT_SUPPORTED:
 		return 0;
 	case PIPE_CAP_BLEND_EQUATION_SEPARATE:
@@ -315,6 +317,9 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_method(so, screen->tesla, 0x1400, 1);
 	so_data  (so, 0xf);
 
+	/* max TIC (bits 4:8) & TSC bindings (ignored), per program type */
+	so_method(so, screen->tesla, 0x13b4, 1);
+	so_data  (so, 0x54);
 	so_method(so, screen->tesla, 0x13bc, 1);
 	so_data  (so, 0x54);
 	/* origin is top left (set to 1 for bottom left) */
@@ -387,7 +392,8 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
 	so_data  (so, 0x00000131 | (NV50_CB_PFP << 12));
 
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 64*8*4, &screen->tic);
+	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, PIPE_SHADER_TYPES*32*32,
+			     &screen->tic);
 	if (ret) {
 		nv50_screen_destroy(pscreen);
 		return NULL;
@@ -398,9 +404,10 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, 0x000007ff);
+	so_data  (so, PIPE_SHADER_TYPES * 32 - 1);
 
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 64*8*4, &screen->tsc);
+	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, PIPE_SHADER_TYPES*32*32,
+			     &screen->tsc);
 	if (ret) {
 		nv50_screen_destroy(pscreen);
 		return NULL;
diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 07318f2..9c8c0c2 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -215,41 +215,66 @@ nv50_sampler_state_create(struct pipe_context *pipe,
 	return (void *)sso;
 }
 
-static void
-nv50_sampler_state_bind(struct pipe_context *pipe, unsigned nr, void **sampler)
+static INLINE void
+nv50_sampler_state_bind(struct pipe_context *pipe, unsigned type,
+			unsigned nr, void **sampler)
 {
 	struct nv50_context *nv50 = nv50_context(pipe);
-	int i;
 
-	nv50->sampler_nr = nr;
-	for (i = 0; i < nv50->sampler_nr; i++)
-		nv50->sampler[i] = sampler[i];
+	memcpy(nv50->sampler[type], sampler, nr * sizeof(void *));
 
+	nv50->sampler_nr[type] = nr;
 	nv50->dirty |= NV50_NEW_SAMPLER;
 }
 
 static void
+nv50_vp_sampler_state_bind(struct pipe_context *pipe, unsigned nr, void **s)
+{
+	nv50_sampler_state_bind(pipe, PIPE_SHADER_VERTEX, nr, s);
+}
+
+static void
+nv50_fp_sampler_state_bind(struct pipe_context *pipe, unsigned nr, void **s)
+{
+	nv50_sampler_state_bind(pipe, PIPE_SHADER_FRAGMENT, nr, s);
+}
+
+static void
 nv50_sampler_state_delete(struct pipe_context *pipe, void *hwcso)
 {
 	FREE(hwcso);
 }
 
-static void
-nv50_set_sampler_texture(struct pipe_context *pipe, unsigned nr,
-			 struct pipe_texture **pt)
+static INLINE void
+nv50_set_sampler_texture(struct pipe_context *pipe, unsigned type,
+			 unsigned nr, struct pipe_texture **pt)
 {
 	struct nv50_context *nv50 = nv50_context(pipe);
-	int i;
+	unsigned i;
 
 	for (i = 0; i < nr; i++)
-		pipe_texture_reference((void *)&nv50->miptree[i], pt[i]);
-	for (i = nr; i < nv50->miptree_nr; i++)
-		pipe_texture_reference((void *)&nv50->miptree[i], NULL);
+		pipe_texture_reference((void *)&nv50->miptree[type][i], pt[i]);
+	for (i = nr; i < nv50->miptree_nr[type]; i++)
+		pipe_texture_reference((void *)&nv50->miptree[type][i], NULL);
 
-	nv50->miptree_nr = nr;
+	nv50->miptree_nr[type] = nr;
 	nv50->dirty |= NV50_NEW_TEXTURE;
 }
 
+static void
+nv50_set_vp_sampler_textures(struct pipe_context *pipe,
+			     unsigned nr, struct pipe_texture **pt)
+{
+	nv50_set_sampler_texture(pipe, PIPE_SHADER_VERTEX, nr, pt);
+}
+
+static void
+nv50_set_fp_sampler_textures(struct pipe_context *pipe,
+			     unsigned nr, struct pipe_texture **pt)
+{
+	nv50_set_sampler_texture(pipe, PIPE_SHADER_FRAGMENT, nr, pt);
+}
+
 static void *
 nv50_rasterizer_state_create(struct pipe_context *pipe,
 			     const struct pipe_rasterizer_state *cso)
@@ -648,9 +673,11 @@ nv50_init_state_functions(struct nv50_context *nv50)
 	nv50->pipe.delete_blend_state = nv50_blend_state_delete;
 
 	nv50->pipe.create_sampler_state = nv50_sampler_state_create;
-	nv50->pipe.bind_fragment_sampler_states = nv50_sampler_state_bind;
 	nv50->pipe.delete_sampler_state = nv50_sampler_state_delete;
-	nv50->pipe.set_fragment_sampler_textures = nv50_set_sampler_texture;
+	nv50->pipe.bind_fragment_sampler_states = nv50_fp_sampler_state_bind;
+	nv50->pipe.bind_vertex_sampler_states   = nv50_vp_sampler_state_bind;
+	nv50->pipe.set_fragment_sampler_textures = nv50_set_fp_sampler_textures;
+	nv50->pipe.set_vertex_sampler_textures   = nv50_set_vp_sampler_textures;
 
 	nv50->pipe.create_rasterizer_state = nv50_rasterizer_state_create;
 	nv50->pipe.bind_rasterizer_state = nv50_rasterizer_state_bind;
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index c871aca..691889b 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -156,6 +156,30 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 }
 
 static void
+nv50_validate_samplers(struct nv50_context *nv50, struct nouveau_stateobj *so,
+		       unsigned p)
+{
+	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
+	unsigned i, j, dw = nv50->sampler_nr[p] * 8;
+
+	if (!dw)
+		return;
+	nv50_so_init_sifc(nv50, so, nv50->screen->tsc, NOUVEAU_BO_VRAM,
+			  p * (32 * 8 * 4), dw * 4);
+
+	so_method(so, eng2d, NV50_2D_SIFC_DATA | (2 << 29), dw);
+
+	for (i = 0; i < nv50->sampler_nr[p]; ++i) {
+		if (nv50->sampler[p][i])
+			so_datap(so, nv50->sampler[p][i]->tsc, 8);
+		else {
+			for (j = 0; j < 8; ++j) /* you get punished */
+				so_data(so, 0); /* ... for leaving wholes */
+		}
+	}
+}
+
+static void
 nv50_state_emit(struct nv50_context *nv50)
 {
 	struct nv50_screen *screen = nv50->screen;
@@ -246,7 +270,6 @@ boolean
 nv50_state_validate(struct nv50_context *nv50)
 {
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
-	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
 	struct nouveau_stateobj *so;
 	unsigned i;
 
@@ -369,22 +392,16 @@ scissor_uptodate:
 viewport_uptodate:
 
 	if (nv50->dirty & NV50_NEW_SAMPLER) {
-		unsigned i;
+		unsigned nr = 0;
 
-		so = so_new(nv50->sampler_nr * 9 + 23 + 4, 2);
+		for (i = 0; i < PIPE_SHADER_TYPES; ++i)
+			nr += nv50->sampler_nr[i];
 
-		nv50_so_init_sifc(nv50, so, nv50->screen->tsc, NOUVEAU_BO_VRAM,
-				  nv50->sampler_nr * 8 * 4);
+		so = so_new(nr * 8 + 24 * PIPE_SHADER_TYPES + 2, 4);
 
-		for (i = 0; i < nv50->sampler_nr; i++) {
-			if (!nv50->sampler[i])
-				continue;
-			so_method(so, eng2d, NV50_2D_SIFC_DATA | (2 << 29), 8);
-			so_datap (so, nv50->sampler[i]->tsc, 8);
-		}
+		nv50_validate_samplers(nv50, so, PIPE_SHADER_VERTEX);
+		nv50_validate_samplers(nv50, so, PIPE_SHADER_FRAGMENT);
 
-		so_method(so, tesla, 0x1440, 1); /* sync SIFC */
-		so_data  (so, 0);
 		so_method(so, tesla, 0x1334, 1); /* flush TSC */
 		so_data  (so, 0);
 
@@ -407,10 +424,13 @@ viewport_uptodate:
 
 void nv50_so_init_sifc(struct nv50_context *nv50,
 		       struct nouveau_stateobj *so,
-		       struct nouveau_bo *bo, unsigned reloc, unsigned size)
+		       struct nouveau_bo *bo, unsigned reloc,
+		       unsigned offset, unsigned size)
 {
 	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
 
+	reloc |= NOUVEAU_BO_WR;
+
 	so_method(so, eng2d, NV50_2D_DST_FORMAT, 2);
 	so_data  (so, NV50_2D_DST_FORMAT_R8_UNORM);
 	so_data  (so, 1);
@@ -418,8 +438,8 @@ void nv50_so_init_sifc(struct nv50_context *nv50,
 	so_data  (so, 262144);
 	so_data  (so, 65536);
 	so_data  (so, 1);
-	so_reloc (so, bo, 0, reloc | NOUVEAU_BO_WR | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, bo, 0, reloc | NOUVEAU_BO_WR | NOUVEAU_BO_LOW, 0, 0);
+	so_reloc (so, bo, offset, reloc | NOUVEAU_BO_HIGH, 0, 0);
+	so_reloc (so, bo, offset, reloc | NOUVEAU_BO_LOW, 0, 0);
 	so_method(so, eng2d, NV50_2D_SIFC_UNK0800, 2);
 	so_data  (so, 0);
 	so_data  (so, NV50_2D_SIFC_FORMAT_R8_UNORM);
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index 417d367..60b0ca7 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -85,7 +85,7 @@ static const struct nv50_texture_format nv50_tex_format_list[] =
 
 static int
 nv50_tex_construct(struct nv50_context *nv50, struct nouveau_stateobj *so,
-		   struct nv50_miptree *mt, int unit)
+		   struct nv50_miptree *mt, int unit, unsigned p)
 {
 	unsigned i;
 	uint32_t mode;
@@ -96,7 +96,7 @@ nv50_tex_construct(struct nv50_context *nv50, struct nouveau_stateobj *so,
 	if (i == NV50_TEX_FORMAT_LIST_SIZE)
                 return 1;
 
-	if (nv50->sampler[unit]->normalized)
+	if (nv50->sampler[p][unit]->normalized)
 		mode = 0x50001000 | (1 << 31);
 	else {
 		mode = 0x50001000 | (7 << 14);
@@ -140,48 +140,78 @@ nv50_tex_construct(struct nv50_context *nv50, struct nouveau_stateobj *so,
 	return 0;
 }
 
-void
-nv50_tex_validate(struct nv50_context *nv50)
+#ifndef NV50TCL_BIND_TIC
+#define NV50TCL_BIND_TIC(n) (0x1448 + 8 * n)
+#endif
+
+static boolean
+nv50_validate_textures(struct nv50_context *nv50, struct nouveau_stateobj *so,
+		       unsigned p)
 {
+	static const unsigned p_remap[PIPE_SHADER_TYPES] = { 0, 2 };
+
 	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
-	struct nouveau_stateobj *so;
-	unsigned i, unit, push;
-
-	push = MAX2(nv50->miptree_nr, nv50->state.miptree_nr) * 2 + 23 + 6;
-	so = so_new(nv50->miptree_nr * 9 + push, nv50->miptree_nr * 2 + 2);
+	unsigned unit, j, p_hw = p_remap[p];
 
 	nv50_so_init_sifc(nv50, so, nv50->screen->tic, NOUVEAU_BO_VRAM,
-			  nv50->miptree_nr * 8 * 4);
+			  p * (32 * 8 * 4), nv50->miptree_nr[p] * 8 * 4);
 
-	for (i = 0, unit = 0; unit < nv50->miptree_nr; ++unit) {
-		struct nv50_miptree *mt = nv50->miptree[unit];
-
-		if (!mt)
-			continue;
+	for (unit = 0; unit < nv50->miptree_nr[p]; ++unit) {
+		struct nv50_miptree *mt = nv50->miptree[p][unit];
 
 		so_method(so, eng2d, NV50_2D_SIFC_DATA | (2 << 29), 8);
-		if (nv50_tex_construct(nv50, so, mt, unit)) {
-			NOUVEAU_ERR("failed tex validate\n");
-			so_ref(NULL, &so);
-			return;
+		if (mt) {
+			if (nv50_tex_construct(nv50, so, mt, unit, p))
+				return FALSE;
+			/* Set TEX insn $t src binding $unit in program type p
+			 * to TIC, TSC entry (32 * p + unit), mark valid (1).
+			 */
+			so_method(so, tesla, NV50TCL_BIND_TIC(p_hw), 1);
+			so_data  (so, ((32 * p + unit) << 9) | (unit << 1) | 1);
+		} else {
+			for (j = 0; j < 8; ++j)
+				so_data(so, 0);
+			so_method(so, tesla, NV50TCL_BIND_TIC(p_hw), 1);
+			so_data  (so, (unit << 1) | 0);
 		}
+	}
+
+	for (; unit < nv50->state.miptree_nr[p]; unit++) {
+		/* Make other bindings invalid. */
+		so_method(so, tesla, NV50TCL_BIND_TIC(p_hw), 1);
+		so_data  (so, (unit << 1) | 0);
+	}
+
+	nv50->state.miptree_nr[p] = nv50->miptree_nr[p];
+	return TRUE;
+}
 
-		so_method(so, tesla, NV50TCL_SET_SAMPLER_TEX, 1);
-		so_data  (so, (i++ << NV50TCL_SET_SAMPLER_TEX_TIC_SHIFT) |
-			  (unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) |
-			  NV50TCL_SET_SAMPLER_TEX_VALID);
+void
+nv50_tex_validate(struct nv50_context *nv50)
+{
+	struct nouveau_stateobj *so;
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	unsigned p, push, nrlc;
+
+	for (nrlc = 0, push = 0, p = 0; p < PIPE_SHADER_TYPES; ++p) {
+		push += MAX2(nv50->miptree_nr[p], nv50->state.miptree_nr[p]);
+		nrlc += nv50->miptree_nr[p];
 	}
+	push = push * 11 + 23 * PIPE_SHADER_TYPES + 4;
+	nrlc = nrlc * 2 + 2 * PIPE_SHADER_TYPES;
+
+	so = so_new(push, nrlc);
+
+	if (nv50_validate_textures(nv50, so, PIPE_SHADER_VERTEX) == FALSE ||
+	    nv50_validate_textures(nv50, so, PIPE_SHADER_FRAGMENT) == FALSE) {
+		so_ref(NULL, &so);
 
-	for (; unit < nv50->state.miptree_nr; unit++) {
-		so_method(so, tesla, NV50TCL_SET_SAMPLER_TEX, 1);
-		so_data  (so,
-			  (unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) | 0);
+		NOUVEAU_ERR("failed tex validate\n");
+		return;
 	}
 
 	/* not sure if the following really do what I think: */
-	so_method(so, tesla, 0x1440, 1); /* sync SIFC */
-	so_data  (so, 0);
 	so_method(so, tesla, 0x1330, 1); /* flush TIC */
 	so_data  (so, 0);
 	so_method(so, tesla, 0x1338, 1); /* flush texture caches */
@@ -189,6 +219,4 @@ nv50_tex_validate(struct nv50_context *nv50)
 
 	so_ref(so, &nv50->state.tic_upload);
 	so_ref(NULL, &so);
-	nv50->state.miptree_nr = nv50->miptree_nr;
 }
-
-- 
1.6.4.4


--------------080406050308070609060005
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------080406050308070609060005--
