From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] nv50/gallium: use SIFC to upload to TIC/TSC
Date: Wed, 14 Oct 2009 23:35:56 +0200
Message-ID: <20091014233556.6rojd5f4w084cg48@webmail.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_4pufqx3vez28"
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

This message is in MIME format.

--=_4pufqx3vez28
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

If we use SIFC to upload the TIC and TSC (like the blob does) instead 
of the CB upload mechanism, we can remove the 2D.0100 flush without 
getting the issue that wrong (i.e. probably those set earlier) textures 
are used.

Looks like this might the better way, even though attempts to do the 
same in the DDX failed. This can provide a good speed boost in some 
cases, too.

I'll wait a while for potential comments before pushing this.


--=_4pufqx3vez28
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="0001-nv50-use-SIFC-for-TIC-TSC-upload.patch"
Content-Disposition: inline;
	filename="0001-nv50-use-SIFC-for-TIC-TSC-upload.patch"
Content-Transfer-Encoding: 7bit

From 3a4317961fda080aa23a35e0f22146dd14f738f0 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 10 Oct 2009 13:13:16 +0200
Subject: [PATCH 1/7] nv50: use SIFC for TIC, TSC upload

Add proper flushes for TIC and TSC and remove
the costly 2D.0110 flush in nv50_flush.

Correct TIC and TSC bo sizes.
---
 src/gallium/drivers/nv50/nv50_context.c        |    7 ---
 src/gallium/drivers/nv50/nv50_context.h        |    5 ++
 src/gallium/drivers/nv50/nv50_screen.c         |   25 ++---------
 src/gallium/drivers/nv50/nv50_state_validate.c |   53 +++++++++++++++++++++---
 src/gallium/drivers/nv50/nv50_tex.c            |   33 +++++++++-----
 src/gallium/drivers/nv50/nv50_vbo.c            |    4 --
 6 files changed, 77 insertions(+), 50 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index fca078b..0cdab9b 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -33,13 +33,6 @@ nv50_flush(struct pipe_context *pipe, unsigned flags,
 {
 	struct nv50_context *nv50 = nv50_context(pipe);
 	struct nouveau_channel *chan = nv50->screen->base.channel;
-	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
-
-	/* We need this in the ddx for reliable composite, not sure what we're
-	 * actually flushing. We generate all our own flushes with flags = 0. */
-	WAIT_RING(chan, 2);
-	BEGIN_RING(chan, eng2d, 0x0110, 1);
-	OUT_RING  (chan, 0);
 
 	if (flags & PIPE_FLUSH_FRAME)
 		FIRE_RING(chan);
diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 4608854..be53990 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -198,6 +198,11 @@ extern void nv50_program_destroy(struct nv50_context *nv50, struct nv50_program
 extern boolean nv50_state_validate(struct nv50_context *nv50);
 extern void nv50_state_flush_notify(struct nouveau_channel *chan);
 
+extern void nv50_so_init_sifc(struct nv50_context *nv50,
+			      struct nouveau_stateobj *so,
+			      struct nouveau_bo *bo, unsigned reloc,
+			      unsigned size);
+
 /* nv50_tex.c */
 extern void nv50_tex_validate(struct nv50_context *);
 
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index dd7baec..66361dc 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -364,48 +364,31 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
 	so_data  (so, 0x00000131 | (NV50_CB_PFP << 12));
 
-	/* Texture sampler/image unit setup - we abuse the constant buffer
-	 * upload mechanism for the moment to upload data to the tex config
-	 * blocks.  At some point we *may* want to go the NVIDIA way of doing
-	 * things?
-	 */
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 32*8*4, &screen->tic);
+	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 64*8*4, &screen->tic);
 	if (ret) {
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
 
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_TIC << 16) | 0x0800);
 	so_method(so, screen->tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, 0x00000800);
+	so_data  (so, 0x000007ff);
 
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 32*8*4, &screen->tsc);
+	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 64*8*4, &screen->tsc);
 	if (ret) {
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
 
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_TSC << 16) | 0x0800);
 	so_method(so, screen->tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
 	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, 0x00000800);
+	so_data  (so, 0x00000000);
 
 
 	/* Vertex array limits - max them out */
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index fd27620..012911f 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -222,6 +222,9 @@ nv50_state_flush_notify(struct nouveau_channel *chan)
 {
 	struct nv50_context *nv50 = chan->user_private;
 
+	if (nv50->state.tic_upload && !(nv50->dirty & NV50_NEW_TEXTURE))
+		so_emit(chan, nv50->state.tic_upload);
+
 	so_emit_reloc_markers(chan, nv50->state.fb);
 	so_emit_reloc_markers(chan, nv50->state.vertprog);
 	so_emit_reloc_markers(chan, nv50->state.fragprog);
@@ -233,6 +236,7 @@ boolean
 nv50_state_validate(struct nv50_context *nv50)
 {
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
 	struct nouveau_stateobj *so;
 	unsigned i;
 
@@ -354,18 +358,25 @@ scissor_uptodate:
 viewport_uptodate:
 
 	if (nv50->dirty & NV50_NEW_SAMPLER) {
-		int i;
+		unsigned i;
+
+		so = so_new(nv50->sampler_nr * 9 + 23 + 4, 2);
+
+		nv50_so_init_sifc(nv50, so, nv50->screen->tsc, NOUVEAU_BO_VRAM,
+				  nv50->sampler_nr * 8 * 4);
 
-		so = so_new(nv50->sampler_nr * 9 + 2, 0);
-		so_method(so, tesla, NV50TCL_CB_ADDR, 1);
-		so_data  (so, NV50_CB_TSC);
 		for (i = 0; i < nv50->sampler_nr; i++) {
 			if (!nv50->sampler[i])
 				continue;
-
-			so_method(so, tesla, NV50TCL_CB_DATA(0) | (2<<29), 8);
+			so_method(so, eng2d, NV50_2D_SIFC_DATA | (2 << 29), 8);
 			so_datap (so, nv50->sampler[i]->tsc, 8);
 		}
+
+		so_method(so, tesla, 0x1440, 1); /* sync SIFC */
+		so_data  (so, 0);
+		so_method(so, tesla, 0x1334, 1); /* flush TSC */
+		so_data  (so, 0);
+
 		so_ref(so, &nv50->state.tsc_upload);
 		so_ref(NULL, &so);
 	}
@@ -383,3 +394,33 @@ viewport_uptodate:
 	return TRUE;
 }
 
+void nv50_so_init_sifc(struct nv50_context *nv50,
+		       struct nouveau_stateobj *so,
+		       struct nouveau_bo *bo, unsigned reloc, unsigned size)
+{
+	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
+
+	so_method(so, eng2d, NV50_2D_DST_FORMAT, 2);
+	so_data  (so, NV50_2D_DST_FORMAT_R8_UNORM);
+	so_data  (so, 1);
+	so_method(so, eng2d, NV50_2D_DST_PITCH, 5);
+	so_data  (so, 262144);
+	so_data  (so, 65536);
+	so_data  (so, 1);
+	so_reloc (so, bo, 0, reloc | NOUVEAU_BO_WR | NOUVEAU_BO_HIGH, 0, 0);
+	so_reloc (so, bo, 0, reloc | NOUVEAU_BO_WR | NOUVEAU_BO_LOW, 0, 0);
+	so_method(so, eng2d, NV50_2D_SIFC_UNK0800, 2);
+	so_data  (so, 0);
+	so_data  (so, NV50_2D_SIFC_FORMAT_R8_UNORM);
+	so_method(so, eng2d, NV50_2D_SIFC_WIDTH, 10);
+	so_data  (so, size);
+	so_data  (so, 1);
+	so_data  (so, 0);
+	so_data  (so, 1);
+	so_data  (so, 0);
+	so_data  (so, 1);
+	so_data  (so, 0);
+	so_data  (so, 0);
+	so_data  (so, 0);
+	so_data  (so, 0);
+}
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index 72d3315..f81f5e1 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -144,23 +144,24 @@ nv50_tex_construct(struct nv50_context *nv50, struct nouveau_stateobj *so,
 void
 nv50_tex_validate(struct nv50_context *nv50)
 {
+	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nouveau_stateobj *so;
-	int unit, push;
+	unsigned i, unit, push;
 
-	push  = nv50->miptree_nr * 9 + 2;
-	push += MAX2(nv50->miptree_nr, nv50->state.miptree_nr) * 2;
+	push = MAX2(nv50->miptree_nr, nv50->state.miptree_nr) * 2 + 23 + 6;
+	so = so_new(nv50->miptree_nr * 9 + push, nv50->miptree_nr + 2);
 
-	so = so_new(push, nv50->miptree_nr * 2);
-	so_method(so, tesla, NV50TCL_CB_ADDR, 1);
-	so_data  (so, NV50_CB_TIC);
-	for (unit = 0; unit < nv50->miptree_nr; unit++) {
+	nv50_so_init_sifc(nv50, so, nv50->screen->tic, NOUVEAU_BO_VRAM,
+			  nv50->miptree_nr * 8 * 4);
+
+	for (i = 0, unit = 0; unit < nv50->miptree_nr; ++unit) {
 		struct nv50_miptree *mt = nv50->miptree[unit];
 
 		if (!mt)
 			continue;
 
-		so_method(so, tesla, NV50TCL_CB_DATA(0) | 0x40000000, 8);
+		so_method(so, eng2d, NV50_2D_SIFC_DATA | (2 << 29), 8);
 		if (nv50_tex_construct(nv50, so, mt, unit)) {
 			NOUVEAU_ERR("failed tex validate\n");
 			so_ref(NULL, &so);
@@ -168,17 +169,25 @@ nv50_tex_validate(struct nv50_context *nv50)
 		}
 
 		so_method(so, tesla, NV50TCL_SET_SAMPLER_TEX, 1);
-		so_data  (so, (unit << NV50TCL_SET_SAMPLER_TEX_TIC_SHIFT) |
-			(unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) |
-			NV50TCL_SET_SAMPLER_TEX_VALID);
+		so_data  (so, (i++ << NV50TCL_SET_SAMPLER_TEX_TIC_SHIFT) |
+			  (unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) |
+			  NV50TCL_SET_SAMPLER_TEX_VALID);
 	}
 
 	for (; unit < nv50->state.miptree_nr; unit++) {
 		so_method(so, tesla, NV50TCL_SET_SAMPLER_TEX, 1);
 		so_data  (so,
-			(unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) | 0);
+			  (unit << NV50TCL_SET_SAMPLER_TEX_SAMPLER_SHIFT) | 0);
 	}
 
+	/* not sure if the following really do what I think: */
+	so_method(so, tesla, 0x1440, 1); /* sync SIFC */
+	so_data  (so, 0);
+	so_method(so, tesla, 0x1330, 1); /* flush TIC */
+	so_data  (so, 0);
+	so_method(so, tesla, 0x1338, 1); /* flush texture caches */
+	so_data  (so, 0x20);
+
 	so_ref(so, &nv50->state.tic_upload);
 	so_ref(NULL, &so);
 	nv50->state.miptree_nr = nv50->miptree_nr;
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index eeed148..8b0fbf0 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -139,10 +139,6 @@ nv50_draw_arrays(struct pipe_context *pipe, unsigned mode, unsigned start,
 	OUT_RING  (chan, 0);
 	BEGIN_RING(chan, tesla, 0x142c, 1);
 	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, tesla, 0x1440, 1);
-	OUT_RING  (chan, 0);
-	BEGIN_RING(chan, tesla, 0x1334, 1);
-	OUT_RING  (chan, 0);
 
 	BEGIN_RING(chan, tesla, NV50TCL_VERTEX_BEGIN, 1);
 	OUT_RING  (chan, nv50_prim(mode));
-- 
1.6.3.3


--=_4pufqx3vez28
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="0002-nv50-nicer-texture-format-switch.patch"
Content-Disposition: inline;
	filename="0002-nv50-nicer-texture-format-switch.patch"
Content-Transfer-Encoding: 7bit

From 38c2907af4281f2f1182770e3c07cae164eb6775 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 10 Oct 2009 13:18:07 +0200
Subject: [PATCH 2/7] nv50: nicer texture format switch

Similar to nv40.
---
 src/gallium/drivers/nv50/nv50_tex.c |  144 ++++++++++++-----------------------
 1 files changed, 49 insertions(+), 95 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index f81f5e1..925f666 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -25,106 +25,60 @@
 
 #include "nouveau/nouveau_stateobj.h"
 
+#define _(pf, tt, r, g, b, a, tf)                       	\
+{                                                       	\
+	PIPE_FORMAT_##pf,					\
+	NV50TIC_0_0_MAPR_##r | NV50TIC_0_0_TYPER_##tt |		\
+	NV50TIC_0_0_MAPG_##g | NV50TIC_0_0_TYPEG_##tt |		\
+	NV50TIC_0_0_MAPB_##b | NV50TIC_0_0_TYPEB_##tt |		\
+	NV50TIC_0_0_MAPA_##a | NV50TIC_0_0_TYPEA_##tt |		\
+	NV50TIC_0_0_FMT_##tf					\
+}
+
+struct nv50_texture_format {
+	enum pipe_format pf;
+	uint32_t hw;
+};
+
+#define NV50_TEX_FORMAT_LIST_SIZE \
+	sizeof(nv50_tex_format_list) / sizeof(struct nv50_texture_format)
+
+static const struct nv50_texture_format nv50_tex_format_list[] =
+{
+	_(A8R8G8B8_UNORM, UNORM, C2, C1, C0, C3,  8_8_8_8),
+	_(X8R8G8B8_UNORM, UNORM, C2, C1, C0, ONE, 8_8_8_8),
+	_(A1R5G5B5_UNORM, UNORM, C2, C1, C0, C3,  1_5_5_5),
+	_(A4R4G4B4_UNORM, UNORM, C2, C1, C0, C3,  4_4_4_4),
+
+	_(R5G6B5_UNORM, UNORM, C2, C1, C0, ONE, 5_6_5),
+
+	_(L8_UNORM, UNORM, C0, C0, C0, ONE, 8),
+	_(A8_UNORM, UNORM, ZERO, ZERO, ZERO, C0, 8),
+	_(I8_UNORM, UNORM, C0, C0, C0, C0, 8),
+
+	_(A8L8_UNORM, UNORM, C0, C0, C0, C1, 8_8),
+
+	_(DXT1_RGB, UNORM, C0, C1, C2, ONE, DXT1),
+	_(DXT1_RGBA, UNORM, C0, C1, C2, C3, DXT1),
+	_(DXT3_RGBA, UNORM, C0, C1, C2, C3, DXT3),
+	_(DXT5_RGBA, UNORM, C0, C1, C2, C3, DXT5)
+};
+
+#undef _
+
 static int
 nv50_tex_construct(struct nv50_context *nv50, struct nouveau_stateobj *so,
 		   struct nv50_miptree *mt, int unit)
 {
-	switch (mt->base.base.format) {
-	case PIPE_FORMAT_A8R8G8B8_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_8_8_8_8);
-		break;
-	case PIPE_FORMAT_X8R8G8B8_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_8_8_8_8);
-		break;
-	case PIPE_FORMAT_A1R5G5B5_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_1_5_5_5);
-		break;
-	case PIPE_FORMAT_A4R4G4B4_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_4_4_4_4);
-		break;
-	case PIPE_FORMAT_R5G6B5_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C2 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_5_6_5);
-		break;
-	case PIPE_FORMAT_L8_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_8);
-		break;
-	case PIPE_FORMAT_A8_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_C0 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_ZERO | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_ZERO | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_ZERO | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_8);
-		break;
-	case PIPE_FORMAT_I8_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_C0 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_8);
-		break;
-	case PIPE_FORMAT_A8L8_UNORM:
-		so_data(so, NV50TIC_0_0_MAPA_C1 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C0 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C0 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_8_8);
-		break;
-	case PIPE_FORMAT_DXT1_RGB:
-		so_data(so, NV50TIC_0_0_MAPA_ONE | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_DXT1);
-		break;
-	case PIPE_FORMAT_DXT1_RGBA:
-		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_DXT1);
-		break;
-	case PIPE_FORMAT_DXT3_RGBA:
-		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_DXT3);
-		break;
-	case PIPE_FORMAT_DXT5_RGBA:
-		so_data(so, NV50TIC_0_0_MAPA_C3 | NV50TIC_0_0_TYPEA_UNORM |
-			    NV50TIC_0_0_MAPR_C0 | NV50TIC_0_0_TYPER_UNORM |
-			    NV50TIC_0_0_MAPG_C1 | NV50TIC_0_0_TYPEG_UNORM |
-			    NV50TIC_0_0_MAPB_C2 | NV50TIC_0_0_TYPEB_UNORM |
-			    NV50TIC_0_0_FMT_DXT5);
-		break;
-	default:
-		return 1;
-	}
+	unsigned i;
+
+	for (i = 0; i < NV50_TEX_FORMAT_LIST_SIZE; i++)
+		if (nv50_tex_format_list[i].pf == mt->base.base.format)
+			break;
+	if (i == NV50_TEX_FORMAT_LIST_SIZE)
+                return 1;
 
+	so_data (so, nv50_tex_format_list[i].hw);
 	so_reloc(so, mt->base.bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_LOW |
 		     NOUVEAU_BO_RD, 0, 0);
 	if (nv50->sampler[unit]->normalized)
-- 
1.6.3.3


--=_4pufqx3vez28
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=_4pufqx3vez28--
