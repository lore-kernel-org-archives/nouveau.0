From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] nv04-nv40: Rewrite and unify miptree and transfer
	code (v2)
Date: Mon, 18 Jan 2010 22:54:31 +0100
Message-ID: <1263851671-26318-1-git-send-email-luca@luca-barbieri.com>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Changes:
- Fixed some nv##_miptree that were not converted to nv04_miptree.
- Disable swizzling on non-RGBA 2D textures, since the current 2D
  code is mostly broken in those cases. A later patch will fix this.
  Thanks to Andrew Randrianasulu who reported this.

This patch rewrites all the miptree layout and transfer code in the
pre-NV50 Gallium drivers.
The code is also unified among them and put in the nv04 directory.

The current code is broken in several ways:
1. 3D textures are laid out first by face, then by level, which is
incorrect
2. Cube maps should have 128-byte aligned faces
3. Swizzled textures have a strange alignment test that seems
unnecessary
4. We store the image_offsets for each face/slice but they can be
easily computed instead
5. "Swizzling" is not supported for compressed formats. They can be
"swizzled" but swizzling only means that there are no gaps (pitch is
level-dependant) and the layout is still linear
6. Swizzling is not supported for non-RGBA formats. All formats (except
possibly depth) can be swizzled according to my testing.

The miptree layout is rewritten based on my empirical testing, which I
posted in the "miptree finding" mail.
The image_offset array is removed, since it can be calculated with a
simple multiplication; the only array in the miptree structure is now
the one for mipmap level starts, which it seems cannot be easily
computed in constant time.

Also, we now directly store a nouveau_bo instead of a pipe_buffer in
the miptree structure, like nv50 does.

All the deletions are due to the nv04-nv40 unification.

Support for render temporaries is removed, and will be readded in a
later patch.

Note that the current temporary code is broken, because it does not
copy the temporary back on render cache flushes.
---
 src/gallium/drivers/nv04/nv04_context.h    |    1 -
 src/gallium/drivers/nv04/nv04_miptree.c    |  160 ++++++++++++++-----
 src/gallium/drivers/nv04/nv04_screen.c     |    9 -
 src/gallium/drivers/nv04/nv04_state.h      |   13 --
 src/gallium/drivers/nv04/nv04_state_emit.c |   14 +-
 src/gallium/drivers/nv04/nv04_surface_2d.c |   14 +-
 src/gallium/drivers/nv04/nv04_surface_2d.h |   14 ++-
 src/gallium/drivers/nv04/nv04_transfer.c   |   37 +++--
 src/gallium/drivers/nv10/Makefile          |    2 -
 src/gallium/drivers/nv10/nv10_context.h    |    6 +-
 src/gallium/drivers/nv10/nv10_fragtex.c    |    2 +-
 src/gallium/drivers/nv10/nv10_miptree.c    |  165 -------------------
 src/gallium/drivers/nv10/nv10_screen.c     |   13 +--
 src/gallium/drivers/nv10/nv10_state.c      |    2 +-
 src/gallium/drivers/nv10/nv10_state.h      |   13 --
 src/gallium/drivers/nv10/nv10_state_emit.c |   14 +-
 src/gallium/drivers/nv10/nv10_transfer.c   |  178 ---------------------
 src/gallium/drivers/nv20/Makefile          |    2 -
 src/gallium/drivers/nv20/nv20_context.h    |    6 +-
 src/gallium/drivers/nv20/nv20_fragtex.c    |    2 +-
 src/gallium/drivers/nv20/nv20_miptree.c    |  226 --------------------------
 src/gallium/drivers/nv20/nv20_screen.c     |   13 +--
 src/gallium/drivers/nv20/nv20_state.c      |    2 +-
 src/gallium/drivers/nv20/nv20_state.h      |   13 --
 src/gallium/drivers/nv20/nv20_state_emit.c |   14 +-
 src/gallium/drivers/nv20/nv20_transfer.c   |  178 ---------------------
 src/gallium/drivers/nv30/Makefile          |    2 -
 src/gallium/drivers/nv30/nv30_context.h    |    2 +-
 src/gallium/drivers/nv30/nv30_fragtex.c    |    8 +-
 src/gallium/drivers/nv30/nv30_miptree.c    |  239 ----------------------------
 src/gallium/drivers/nv30/nv30_screen.c     |   13 +--
 src/gallium/drivers/nv30/nv30_state.h      |   13 --
 src/gallium/drivers/nv30/nv30_state_fb.c   |   20 ++--
 src/gallium/drivers/nv30/nv30_transfer.c   |  178 ---------------------
 src/gallium/drivers/nv40/Makefile          |    2 -
 src/gallium/drivers/nv40/nv40_context.h    |    2 +-
 src/gallium/drivers/nv40/nv40_fragtex.c    |   12 +-
 src/gallium/drivers/nv40/nv40_miptree.c    |  235 ---------------------------
 src/gallium/drivers/nv40/nv40_screen.c     |   13 +--
 src/gallium/drivers/nv40/nv40_state.h      |   13 --
 src/gallium/drivers/nv40/nv40_state_fb.c   |   10 +-
 src/gallium/drivers/nv40/nv40_transfer.c   |  178 ---------------------
 42 files changed, 229 insertions(+), 1824 deletions(-)
 delete mode 100644 src/gallium/drivers/nv10/nv10_miptree.c
 delete mode 100644 src/gallium/drivers/nv10/nv10_transfer.c
 delete mode 100644 src/gallium/drivers/nv20/nv20_miptree.c
 delete mode 100644 src/gallium/drivers/nv20/nv20_transfer.c
 delete mode 100644 src/gallium/drivers/nv30/nv30_miptree.c
 delete mode 100644 src/gallium/drivers/nv30/nv30_transfer.c
 delete mode 100644 src/gallium/drivers/nv40/nv40_miptree.c
 delete mode 100644 src/gallium/drivers/nv40/nv40_transfer.c

diff --git a/src/gallium/drivers/nv04/nv04_context.h b/src/gallium/drivers/nv04/nv04_context.h
index fe3b527..9c5d282 100644
--- a/src/gallium/drivers/nv04/nv04_context.h
+++ b/src/gallium/drivers/nv04/nv04_context.h
@@ -111,7 +111,6 @@ nv04_context(struct pipe_context *pipe)
 
 extern void nv04_init_state_functions(struct nv04_context *nv04);
 extern void nv04_init_surface_functions(struct nv04_context *nv04);
-extern void nv04_screen_init_miptree_functions(struct pipe_screen *screen);
 
 /* nv04_clear.c */
 extern void nv04_clear(struct pipe_context *pipe, struct pipe_surface *ps,
diff --git a/src/gallium/drivers/nv04/nv04_miptree.c b/src/gallium/drivers/nv04/nv04_miptree.c
index e0a6948..74c2250 100644
--- a/src/gallium/drivers/nv04/nv04_miptree.c
+++ b/src/gallium/drivers/nv04/nv04_miptree.c
@@ -1,64 +1,138 @@
 #include "pipe/p_state.h"
 #include "pipe/p_defines.h"
 #include "pipe/p_inlines.h"
+#include "util/u_format.h"
 #include "util/u_math.h"
 
 #include "nv04_context.h"
-#include "nv04_screen.h"
 
-static void
-nv04_miptree_layout(struct nv04_miptree *nv04mt)
+static unsigned
+nv04_miptree_layout(struct nv04_miptree *mt)
 {
-	struct pipe_texture *pt = &nv04mt->base;
+	struct pipe_texture *pt = &mt->base;
 	uint offset = 0;
-	int nr_faces, l;
-
-	nr_faces = 1;
+	unsigned uniform_pitch = 0;
+	static int no_swizzle = -1;
+	if(no_swizzle < 0)
+		no_swizzle = debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE);
+
+	/* Non-uniform pitch textures must be POT */
+	if (pt->width0 & (pt->width0 - 1) ||
+	    pt->height0 & (pt->height0 - 1) ||
+	    pt->depth0 & (pt->depth0 - 1)
+	    )
+		uniform_pitch = 1;
+
+	/* All texture formats except compressed ones can be swizzled
+	 * Unsure about depth, let's prevent swizzling for now
+	 */
+	if (pt->tex_usage & (PIPE_TEXTURE_USAGE_PRIMARY |
+	                     PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
+	                     PIPE_TEXTURE_USAGE_DEPTH_STENCIL |
+	                     PIPE_TEXTURE_USAGE_DYNAMIC)
+	       || util_format_is_depth_or_stencil(pt->format)
+	       || util_format_is_compressed(pt->format)
+	       // disable swizzled textures on NV04-NV20 as our current drivers don't fully support that
+	       // TODO: hardware should support them, fix the drivers and reenable
+	       || nouveau_screen(pt->screen)->device->chipset < 0x30
+	       || no_swizzle
+
+	       // disable swizzling for non-RGBA 2D because our current 2D code can't handle anything
+               // else correctly, and even that is semi-broken
+	       || pt->target != PIPE_TEXTURE_2D
+               || (pt->format != PIPE_FORMAT_A8R8G8B8_UNORM && pt->format != PIPE_FORMAT_X8R8G8B8_UNORM)
+	)
+		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
+
+	/* non compressed formats with uniform pitch must be linear, and vice versa */
+	if(!util_format_is_compressed(pt->format)
+		&& (uniform_pitch || mt->base.tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR))
+	{
+		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
+		uniform_pitch = 1;
+	}
 
-	for (l = 0; l <= pt->last_level; l++) {
-		nv04mt->level[l].pitch = pt->width0;
-		nv04mt->level[l].pitch = (nv04mt->level[l].pitch + 63) & ~63;
+	if(uniform_pitch)
+	{
+		mt->linear_pitch = util_format_get_stride(pt->format, pt->width0);
+
+		// TODO: this is only a constraint for rendering and not sampling, apparently
+		// we may also want this unconditionally
+		if(pt->tex_usage & (PIPE_TEXTURE_USAGE_SAMPLER |
+			                           PIPE_TEXTURE_USAGE_DEPTH_STENCIL |
+			                           PIPE_TEXTURE_USAGE_RENDER_TARGET |
+			                           PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
+			                           PIPE_TEXTURE_USAGE_PRIMARY))
+			mt->linear_pitch = align(mt->linear_pitch, 64);
 	}
+	else
+		mt->linear_pitch = 0;
+
+	for (unsigned l = 0; l <= pt->last_level; l++)
+	{
+		unsigned size;
+		mt->level_offset[l] = offset;
 
-	for (l = 0; l <= pt->last_level; l++) {
-		nv04mt->level[l].image_offset = 
-			CALLOC(nr_faces, sizeof(unsigned));
-		/* XXX guess was obviously missing */
-		nv04mt->level[l].image_offset[0] = offset;
-		offset += nv04mt->level[l].pitch * u_minify(pt->height0, l);
+		if(mt->linear_pitch)
+			size = mt->linear_pitch;
+		else
+			size = util_format_get_stride(pt->format, u_minify(pt->width0, l));
+		size = util_format_get_2d_size(pt->format, size, u_minify(pt->height0, l));
+
+		if(pt->target == PIPE_TEXTURE_3D)
+			size *= u_minify(pt->depth0, l);
+
+		offset += size;
 	}
 
-	nv04mt->total_size = offset;
+	offset = align(offset, 128);
+	mt->face_size = offset;
+	if(mt->base.target == PIPE_TEXTURE_CUBE)
+		offset += 5 * mt->face_size;
+	return offset;
 }
 
 static struct pipe_texture *
 nv04_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
 {
 	struct nv04_miptree *mt;
+	struct nouveau_device *dev = nouveau_screen(pscreen)->device;
+
+	if(pt->width0 > 4096 || pt->height0 > 4096)
+		return NULL;
 
-	mt = MALLOC(sizeof(struct nv04_miptree));
+	mt = CALLOC_STRUCT(nv04_miptree);
 	if (!mt)
 		return NULL;
 	mt->base = *pt;
 	pipe_reference_init(&mt->base.reference, 1);
 	mt->base.screen = pscreen;
 
-	//mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
+	// set this to the actual capabilities, we use it to decide whether to use the 3D engine for copies
+	mt->base.tex_usage = pt->tex_usage | PIPE_TEXTURE_USAGE_RENDER_TARGET | PIPE_TEXTURE_USAGE_SAMPLER | PIPE_TEXTURE_USAGE_DEPTH_STENCIL;
+
+	// on our current driver (and the driver too), format support does not depend on geometry, so don't bother computing it
+	if(!pscreen->is_format_supported(pscreen, pt->format, pt->target, PIPE_TEXTURE_USAGE_RENDER_TARGET, 0))
+		mt->base.tex_usage &=~ PIPE_TEXTURE_USAGE_RENDER_TARGET;
+	if(!pscreen->is_format_supported(pscreen, pt->format, pt->target, PIPE_TEXTURE_USAGE_SAMPLER, 0))
+		mt->base.tex_usage &=~ PIPE_TEXTURE_USAGE_SAMPLER;
+	if(!pscreen->is_format_supported(pscreen, pt->format, pt->target, PIPE_TEXTURE_USAGE_DEPTH_STENCIL, 0))
+		mt->base.tex_usage &=~ PIPE_TEXTURE_USAGE_DEPTH_STENCIL;
 
-	nv04_miptree_layout(mt);
+	unsigned flags = NOUVEAU_BO_MAP | NOUVEAU_BO_GART;
 
-	mt->buffer = pscreen->buffer_create(pscreen, 256, PIPE_BUFFER_USAGE_PIXEL |
-						NOUVEAU_BUFFER_USAGE_TEXTURE,
-						mt->total_size);
-	if (!mt->buffer) {
-		printf("failed %d byte alloc\n",mt->total_size);
+	if (!(pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC))
+		flags |= NOUVEAU_BO_VRAM;
+
+	nouveau_bo_new(dev, flags, 256, nv04_miptree_layout(mt), &mt->bo);
+	if (!mt->bo) {
 		FREE(mt);
 		return NULL;
 	}
-	mt->bo = nouveau_bo(mt->buffer);
 	return &mt->base;
 }
 
+// TODO: redo this, just calling miptree_layout
 static struct pipe_texture *
 nv04_miptree_blanket(struct pipe_screen *pscreen, const struct pipe_texture *pt,
 		     const unsigned *stride, struct pipe_buffer *pb)
@@ -77,11 +151,13 @@ nv04_miptree_blanket(struct pipe_screen *pscreen, const struct pipe_texture *pt,
 	mt->base = *pt;
 	pipe_reference_init(&mt->base.reference, 1);
 	mt->base.screen = pscreen;
-	mt->level[0].pitch = stride[0];
-	mt->level[0].image_offset = CALLOC(1, sizeof(unsigned));
+	mt->linear_pitch = stride[0];
+
+	/* Assume whoever created this buffer expects it to be linear for now */
+	if(!(pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR))
+		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
 
-	pipe_buffer_reference(&mt->buffer, pb);
-	mt->bo = nouveau_bo(mt->buffer);
+	nouveau_bo_ref(nouveau_bo(pb), &mt->bo);
 	return &mt->base;
 }
 
@@ -89,14 +165,7 @@ static void
 nv04_miptree_destroy(struct pipe_texture *pt)
 {
 	struct nv04_miptree *mt = (struct nv04_miptree *)pt;
-	int l;
-
-	pipe_buffer_reference(&mt->buffer, NULL);
-	for (l = 0; l <= pt->last_level; l++) {
-		if (mt->level[l].image_offset)
-			FREE(mt->level[l].image_offset);
-	}
-
+	nouveau_bo_ref(0, &mt->bo);
 	FREE(mt);
 }
 
@@ -105,7 +174,7 @@ nv04_miptree_surface_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 			 unsigned face, unsigned level, unsigned zslice,
 			 unsigned flags)
 {
-	struct nv04_miptree *nv04mt = (struct nv04_miptree *)pt;
+	struct nv04_miptree *mt = (struct nv04_miptree *)pt;
 	struct nv04_surface *ns;
 
 	ns = CALLOC_STRUCT(nv04_surface);
@@ -120,9 +189,18 @@ nv04_miptree_surface_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	ns->base.face = face;
 	ns->base.level = level;
 	ns->base.zslice = zslice;
-	ns->pitch = nv04mt->level[level].pitch;
 
-	ns->base.offset = nv04mt->level[level].image_offset[0];
+	if(mt->linear_pitch)
+		ns->pitch = mt->linear_pitch;
+	else
+		ns->pitch = util_format_get_stride(ns->base.format, ns->base.width);
+
+	ns->base.offset = mt->level_offset[level];
+	if (pt->target == PIPE_TEXTURE_CUBE)
+		ns->base.offset += mt->face_size * face;
+	else if (pt->target == PIPE_TEXTURE_3D && mt->linear_pitch)
+		ns->base.offset += zslice
+		* util_format_get_2d_size(ns->base.format, (mt->linear_pitch ? mt->linear_pitch : util_format_get_stride(ns->base.format, ns->base.width)),  ns->base.height);
 
 	return &ns->base;
 }
diff --git a/src/gallium/drivers/nv04/nv04_screen.c b/src/gallium/drivers/nv04/nv04_screen.c
index 7c5b6e8..fc99596 100644
--- a/src/gallium/drivers/nv04/nv04_screen.c
+++ b/src/gallium/drivers/nv04/nv04_screen.c
@@ -124,14 +124,6 @@ nv04_screen_destroy(struct pipe_screen *pscreen)
 	FREE(pscreen);
 }
 
-static struct pipe_buffer *
-nv04_surface_buffer(struct pipe_surface *surf)
-{
-	struct nv04_miptree *mt = (struct nv04_miptree *)surf->texture;
-
-	return mt->buffer;
-}
-
 struct pipe_screen *
 nv04_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 {
@@ -197,7 +189,6 @@ nv04_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
-	screen->eng2d->buf = nv04_surface_buffer;
 
 	/* Notifier for sync purposes */
 	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
diff --git a/src/gallium/drivers/nv04/nv04_state.h b/src/gallium/drivers/nv04/nv04_state.h
index 81d1d2e..3e1a84c 100644
--- a/src/gallium/drivers/nv04/nv04_state.h
+++ b/src/gallium/drivers/nv04/nv04_state.h
@@ -29,19 +29,6 @@ struct nv04_rasterizer_state {
 	const struct pipe_rasterizer_state *templ;
 };
 
-struct nv04_miptree {
-	struct pipe_texture base;
-	struct nouveau_bo *bo;
-
-	struct pipe_buffer *buffer;
-	uint total_size;
-
-	struct {
-		uint pitch;
-		uint *image_offset;
-	} level[PIPE_MAX_TEXTURE_LEVELS];
-};
-
 struct nv04_fragment_program_data {
 	unsigned offset;
 	unsigned index;
diff --git a/src/gallium/drivers/nv04/nv04_state_emit.c b/src/gallium/drivers/nv04/nv04_state_emit.c
index b8d6dc5..d68e248 100644
--- a/src/gallium/drivers/nv04/nv04_state_emit.c
+++ b/src/gallium/drivers/nv04/nv04_state_emit.c
@@ -92,11 +92,10 @@ static void nv04_emit_sampler(struct nv04_context *nv04, int unit)
 	struct nv04_screen *screen = nv04->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
-	struct nouveau_bo *bo = nouveau_bo(nv04mt->buffer);
 
 	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 3);
-	OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-	OUT_RELOCd(chan, bo, (nv04->fragtex.format | nv04->sampler[unit]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
+	OUT_RELOCl(chan, nv04mt->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+	OUT_RELOCd(chan, nv04mt->bo, (nv04->fragtex.format | nv04->sampler[unit]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
 	OUT_RING(chan, nv04->sampler[unit]->filter);
 }
 
@@ -146,11 +145,11 @@ static void nv04_state_emit_framebuffer(struct nv04_context* nv04)
 	OUT_RING(chan, rt_format);
 
 	nv04mt = (struct nv04_miptree *)rt->base.texture;
-	bo = nouveau_bo(nv04mt->buffer);
+
 	/* FIXME pitches have to be aligned ! */
 	BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_PITCH, 2);
 	OUT_RING(chan, rt->pitch|(zeta->pitch<<16));
-	OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOCl(chan, nv04mt->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	if (fb->zsbuf) {
 		nv04mt = (struct nv04_miptree *)zeta->base.texture;
 		BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_OFFSET_ZETA, 1);
@@ -237,10 +236,9 @@ nv04_emit_hw_state(struct nv04_context *nv04)
 		if (!(nv04->fp_samplers & (1 << i)))
 			continue;
 		struct nv04_miptree *nv04mt = nv04->tex_miptree[i];
-		struct nouveau_bo *bo = nouveau_bo(nv04mt->buffer);
 		BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 2);
-		OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-		OUT_RELOCd(chan, bo, (nv04->fragtex.format | nv04->sampler[i]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
+		OUT_RELOCl(chan, nv04mt->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+		OUT_RELOCd(chan, nv04mt->bo, (nv04->fragtex.format | nv04->sampler[i]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
 	}
 }
 
diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.c b/src/gallium/drivers/nv04/nv04_surface_2d.c
index b24a9ce..1721fee 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.c
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.c
@@ -125,8 +125,8 @@ nv04_surface_copy_swizzle(struct nv04_surface_2d *ctx,
 	struct nouveau_channel *chan = ctx->swzsurf->channel;
 	struct nouveau_grobj *swzsurf = ctx->swzsurf;
 	struct nouveau_grobj *sifm = ctx->sifm;
-	struct nouveau_bo *src_bo = nouveau_bo(ctx->buf(src));
-	struct nouveau_bo *dst_bo = nouveau_bo(ctx->buf(dst));
+	struct nouveau_bo *src_bo = ((struct nv04_miptree*)src->texture)->bo;
+	struct nouveau_bo *dst_bo = ((struct nv04_miptree*)dst->texture)->bo;
 	const unsigned src_pitch = ((struct nv04_surface *)src)->pitch;
         /* Max width & height may not be the same on all HW, but must be POT */
 	const unsigned max_w = 1024;
@@ -205,8 +205,8 @@ nv04_surface_copy_m2mf(struct nv04_surface_2d *ctx,
 {
 	struct nouveau_channel *chan = ctx->m2mf->channel;
 	struct nouveau_grobj *m2mf = ctx->m2mf;
-	struct nouveau_bo *src_bo = nouveau_bo(ctx->buf(src));
-	struct nouveau_bo *dst_bo = nouveau_bo(ctx->buf(dst));
+	struct nouveau_bo *src_bo = ((struct nv04_miptree*)src->texture)->bo;
+	struct nouveau_bo *dst_bo = ((struct nv04_miptree*)dst->texture)->bo;
 	unsigned src_pitch = ((struct nv04_surface *)src)->pitch;
 	unsigned dst_pitch = ((struct nv04_surface *)dst)->pitch;
 	unsigned dst_offset = dst->offset + dy * dst_pitch +
@@ -252,8 +252,8 @@ nv04_surface_copy_blit(struct nv04_surface_2d *ctx, struct pipe_surface *dst,
 	struct nouveau_channel *chan = ctx->surf2d->channel;
 	struct nouveau_grobj *surf2d = ctx->surf2d;
 	struct nouveau_grobj *blit = ctx->blit;
-	struct nouveau_bo *src_bo = nouveau_bo(ctx->buf(src));
-	struct nouveau_bo *dst_bo = nouveau_bo(ctx->buf(dst));
+	struct nouveau_bo *src_bo = ((struct nv04_miptree*)src->texture)->bo;
+	struct nouveau_bo *dst_bo = ((struct nv04_miptree*)dst->texture)->bo;
 	unsigned src_pitch = ((struct nv04_surface *)src)->pitch;
 	unsigned dst_pitch = ((struct nv04_surface *)dst)->pitch;
 	int format;
@@ -317,7 +317,7 @@ nv04_surface_fill(struct nv04_surface_2d *ctx, struct pipe_surface *dst,
 	struct nouveau_channel *chan = ctx->surf2d->channel;
 	struct nouveau_grobj *surf2d = ctx->surf2d;
 	struct nouveau_grobj *rect = ctx->rect;
-	struct nouveau_bo *dst_bo = nouveau_bo(ctx->buf(dst));
+	struct nouveau_bo *dst_bo = ((struct nv04_miptree*)dst->texture)->bo;
 	unsigned dst_pitch = ((struct nv04_surface *)dst)->pitch;
 	int cs2d_format, gdirect_format;
 
diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.h b/src/gallium/drivers/nv04/nv04_surface_2d.h
index ce696a1..1f1fe11 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.h
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.h
@@ -1,6 +1,18 @@
 #ifndef __NV04_SURFACE_2D_H__
 #define __NV04_SURFACE_2D_H__
 
+struct nv04_miptree {
+	struct pipe_texture base;
+	struct nouveau_bo *bo;
+
+	unsigned linear_pitch; /* for linear textures, 0 for swizzled and compressed textures with level-dependent minimal pitch */
+	unsigned face_size; /* 128-byte aligned face/total size */
+	unsigned level_offset[PIPE_MAX_TEXTURE_LEVELS];
+};
+
+extern void nv04_screen_init_miptree_functions(struct pipe_screen *screen);
+extern void nv04_screen_init_transfer_functions(struct pipe_screen *screen);
+
 struct nv04_surface {
 	struct pipe_surface base;
 	unsigned pitch;
@@ -16,8 +28,6 @@ struct nv04_surface_2d {
 	struct nouveau_grobj *blit;
 	struct nouveau_grobj *sifm;
 
-	struct pipe_buffer *(*buf)(struct pipe_surface *);
-
 	void (*copy)(struct nv04_surface_2d *, struct pipe_surface *dst,
 		     int dx, int dy, struct pipe_surface *src, int sx, int sy,
 		     int w, int h);
diff --git a/src/gallium/drivers/nv04/nv04_transfer.c b/src/gallium/drivers/nv04/nv04_transfer.c
index 2dd2e14..ff62515 100644
--- a/src/gallium/drivers/nv04/nv04_transfer.c
+++ b/src/gallium/drivers/nv04/nv04_transfer.c
@@ -41,6 +41,9 @@ nv04_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	struct nv04_miptree *mt = (struct nv04_miptree *)pt;
 	struct nv04_transfer *tx;
 	struct pipe_texture tx_tex_template, *tx_tex;
+	static int no_transfer = -1;
+	if(no_transfer < 0)
+		no_transfer = debug_get_bool_option("NOUVEAU_NO_TRANSFER", FALSE);
 
 	tx = CALLOC_STRUCT(nv04_transfer);
 	if (!tx)
@@ -51,20 +54,21 @@ nv04_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	tx->base.y = y;
 	tx->base.width = w;
 	tx->base.height = h;
-	tx->base.stride = mt->level[level].pitch;
+	tx->base.stride = mt->linear_pitch;
+	if(!tx->base.stride)
+		tx->base.stride = util_format_get_stride(pt->format, u_minify(pt->width0, level));
 	tx->base.usage = usage;
 	tx->base.face = face;
 	tx->base.level = level;
 	tx->base.zslice = zslice;
 
 	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
+	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC || no_transfer) &&
 	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
 	{
 		tx->direct = true;
 		tx->surface = pscreen->get_tex_surface(pscreen, pt,
-	                                               0, 0, 0,
+	                                               face, level, zslice,
 	                                               pipe_transfer_buffer_flags(&tx->base));
 		return &tx->base;
 	}
@@ -80,10 +84,12 @@ nv04_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 		return NULL;
 	}
 
-	tx->base.stride = ((struct nv04_miptree*)tx_tex)->level[0].pitch;
+	tx->base.stride = ((struct nv04_miptree*)tx_tex)->linear_pitch;
+	if(!tx->base.stride)
+		tx->base.stride = util_format_get_stride(pt->format, u_minify(pt->width0, level));
 
 	tx->surface = pscreen->get_tex_surface(pscreen, tx_tex,
-	                                       face, level, zslice,
+	                                       0, 0, 0,
 	                                       pipe_transfer_buffer_flags(&tx->base));
 
 	pipe_texture_reference(&tx_tex, NULL);
@@ -150,13 +156,22 @@ nv04_transfer_map(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
 	struct nv04_transfer *tx = (struct nv04_transfer *)ptx;
 	struct nv04_surface *ns = (struct nv04_surface *)tx->surface;
 	struct nv04_miptree *mt = (struct nv04_miptree *)tx->surface->texture;
-	void *map = pipe_buffer_map(pscreen, mt->buffer,
-	                            pipe_transfer_buffer_flags(ptx));
+	unsigned flags = 0;
+	int ret;
+
+	if (ptx->usage & PIPE_TRANSFER_WRITE)
+		flags |= NOUVEAU_BO_WR;
+	if (ptx->usage & PIPE_TRANSFER_READ)
+		flags |= NOUVEAU_BO_RD;
+
+	ret = nouveau_bo_map(mt->bo, flags);
 
 	if(!tx->direct)
-		return map + ns->base.offset;
+		return mt->bo->map + ns->base.offset;
 	else
-		return map + ns->base.offset + ptx->y * ns->pitch + ptx->x * util_format_get_blocksize(ptx->texture->format);
+		return mt->bo->map + ns->base.offset
+		+ util_format_get_2d_size(ns->base.format, ns->pitch, ptx->y)
+		+ util_format_get_stride(ptx->texture->format, ptx->x);
 }
 
 static void
@@ -165,7 +180,7 @@ nv04_transfer_unmap(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
 	struct nv04_transfer *tx = (struct nv04_transfer *)ptx;
 	struct nv04_miptree *mt = (struct nv04_miptree *)tx->surface->texture;
 
-	pipe_buffer_unmap(pscreen, mt->buffer);
+	nouveau_bo_unmap(mt->bo);
 }
 
 void
diff --git a/src/gallium/drivers/nv10/Makefile b/src/gallium/drivers/nv10/Makefile
index 62677f5..2b100c5 100644
--- a/src/gallium/drivers/nv10/Makefile
+++ b/src/gallium/drivers/nv10/Makefile
@@ -8,13 +8,11 @@ C_SOURCES = \
 	nv10_context.c \
 	nv10_fragprog.c \
 	nv10_fragtex.c \
-	nv10_miptree.c \
 	nv10_prim_vbuf.c \
 	nv10_screen.c \
 	nv10_state.c \
 	nv10_state_emit.c \
 	nv10_surface.c \
-	nv10_transfer.c \
 	nv10_vbo.c
 
 include ../../Makefile.template
diff --git a/src/gallium/drivers/nv10/nv10_context.h b/src/gallium/drivers/nv10/nv10_context.h
index ab4b825..fc001c1 100644
--- a/src/gallium/drivers/nv10/nv10_context.h
+++ b/src/gallium/drivers/nv10/nv10_context.h
@@ -47,14 +47,14 @@ struct nv10_context {
 	uint32_t dirty;
 
 	struct nv10_sampler_state *tex_sampler[PIPE_MAX_SAMPLERS];
-	struct nv10_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
+	struct nv04_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
 	unsigned dirty_samplers;
 	unsigned fp_samplers;
 	unsigned vp_samplers;
 
 	uint32_t rt_enable;
-	struct pipe_buffer *rt[4];
-	struct pipe_buffer *zeta;
+	struct nouveau_bo *rt[4];
+	struct nouveau_bo *zeta;
 	uint32_t lma_offset;
 
 	struct nv10_blend_state *blend;
diff --git a/src/gallium/drivers/nv10/nv10_fragtex.c b/src/gallium/drivers/nv10/nv10_fragtex.c
index c1f7ccb..3d34f9a 100644
--- a/src/gallium/drivers/nv10/nv10_fragtex.c
+++ b/src/gallium/drivers/nv10/nv10_fragtex.c
@@ -49,7 +49,7 @@ nv10_fragtex_build(struct nv10_context *nv10, int unit)
 {
 #if 0
 	struct nv10_sampler_state *ps = nv10->tex_sampler[unit];
-	struct nv10_miptree *nv10mt = nv10->tex_miptree[unit];
+	struct nv04_miptree *nv10mt = nv10->tex_miptree[unit];
 	struct pipe_texture *pt = &nv10mt->base;
 	struct nv10_texture_format *tf;
 	struct nv10_screen *screen = nv10->screen;
diff --git a/src/gallium/drivers/nv10/nv10_miptree.c b/src/gallium/drivers/nv10/nv10_miptree.c
deleted file mode 100644
index 908482a..0000000
--- a/src/gallium/drivers/nv10/nv10_miptree.c
+++ /dev/null
@@ -1,165 +0,0 @@
-#include "pipe/p_state.h"
-#include "pipe/p_defines.h"
-#include "pipe/p_inlines.h"
-#include "util/u_format.h"
-#include "util/u_math.h"
-
-#include "nv10_context.h"
-#include "nv10_screen.h"
-
-static void
-nv10_miptree_layout(struct nv10_miptree *nv10mt)
-{
-	struct pipe_texture *pt = &nv10mt->base;
-	boolean swizzled = FALSE;
-	uint width = pt->width0;
-	uint offset = 0;
-	int nr_faces, l, f;
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		nr_faces = 6;
-	} else {
-		nr_faces = 1;
-	}
-	
-	for (l = 0; l <= pt->last_level; l++) {
-		if (swizzled)
-			nv10mt->level[l].pitch = util_format_get_stride(pt->format, width);
-		else
-			nv10mt->level[l].pitch = util_format_get_stride(pt->format, pt->width0);
-		nv10mt->level[l].pitch = (nv10mt->level[l].pitch + 63) & ~63;
-
-		nv10mt->level[l].image_offset =
-			CALLOC(nr_faces, sizeof(unsigned));
-
-		width  = u_minify(width, 1);
-
-	}
-
-	for (f = 0; f < nr_faces; f++) {
-		for (l = 0; l <= pt->last_level; l++) {
-			nv10mt->level[l].image_offset[f] = offset;
-			offset += nv10mt->level[l].pitch * u_minify(pt->height0, l);
-		}
-	}
-
-	nv10mt->total_size = offset;
-}
-
-static struct pipe_texture *
-nv10_miptree_blanket(struct pipe_screen *pscreen, const struct pipe_texture *pt,
-		     const unsigned *stride, struct pipe_buffer *pb)
-{
-	struct nv10_miptree *mt;
-
-	/* Only supports 2D, non-mipmapped textures for the moment */
-	if (pt->target != PIPE_TEXTURE_2D || pt->last_level != 0 ||
-	    pt->depth0 != 1)
-		return NULL;
-
-	mt = CALLOC_STRUCT(nv10_miptree);
-	if (!mt)
-		return NULL;
-
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = pscreen;
-	mt->level[0].pitch = stride[0];
-	mt->level[0].image_offset = CALLOC(1, sizeof(unsigned));
-
-	pipe_buffer_reference(&mt->buffer, pb);
-	mt->bo = nouveau_bo(mt->buffer);
-	return &mt->base;
-}
-
-static struct pipe_texture *
-nv10_miptree_create(struct pipe_screen *screen, const struct pipe_texture *pt)
-{
-	struct nv10_miptree *mt;
-
-	mt = MALLOC(sizeof(struct nv10_miptree));
-	if (!mt)
-		return NULL;
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = screen;
-
-	nv10_miptree_layout(mt);
-
-	mt->buffer = screen->buffer_create(screen, 256, PIPE_BUFFER_USAGE_PIXEL,
-					   mt->total_size);
-	if (!mt->buffer) {
-		FREE(mt);
-		return NULL;
-	}
-	mt->bo = nouveau_bo(mt->buffer);
-	
-	return &mt->base;
-}
-
-static void
-nv10_miptree_destroy(struct pipe_texture *pt)
-{
-	struct nv10_miptree *nv10mt = (struct nv10_miptree *)pt;
-        int l;
-
-        pipe_buffer_reference(&nv10mt->buffer, NULL);
-        for (l = 0; l <= pt->last_level; l++) {
-		if (nv10mt->level[l].image_offset)
-			FREE(nv10mt->level[l].image_offset);
-        }
-        FREE(nv10mt);
-}
-
-static void
-nv10_miptree_update(struct pipe_context *pipe, struct pipe_texture *mt,
-		    uint face, uint levels)
-{
-}
-
-
-static struct pipe_surface *
-nv10_miptree_surface_get(struct pipe_screen *screen, struct pipe_texture *pt,
-			 unsigned face, unsigned level, unsigned zslice,
-			 unsigned flags)
-{
-	struct nv10_miptree *nv10mt = (struct nv10_miptree *)pt;
-	struct nv04_surface *ns;
-
-	ns = CALLOC_STRUCT(nv04_surface);
-	if (!ns)
-		return NULL;
-	pipe_texture_reference(&ns->base.texture, pt);
-	ns->base.format = pt->format;
-	ns->base.width = u_minify(pt->width0, level);
-	ns->base.height = u_minify(pt->height0, level);
-	ns->base.usage = flags;
-	pipe_reference_init(&ns->base.reference, 1);
-	ns->base.face = face;
-	ns->base.level = level;
-	ns->base.zslice = zslice;
-	ns->pitch = nv10mt->level[level].pitch;
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		ns->base.offset = nv10mt->level[level].image_offset[face];
-	} else {
-		ns->base.offset = nv10mt->level[level].image_offset[0];
-	}
-
-	return &ns->base;
-}
-
-static void
-nv10_miptree_surface_destroy(struct pipe_surface *surface)
-{
-}
-
-void nv10_screen_init_miptree_functions(struct pipe_screen *pscreen)
-{
-	pscreen->texture_create = nv10_miptree_create;
-	pscreen->texture_blanket = nv10_miptree_blanket;
-	pscreen->texture_destroy = nv10_miptree_destroy;
-	pscreen->get_tex_surface = nv10_miptree_surface_get;
-	pscreen->tex_surface_destroy = nv10_miptree_surface_destroy;
-}
-
diff --git a/src/gallium/drivers/nv10/nv10_screen.c b/src/gallium/drivers/nv10/nv10_screen.c
index 69a6dab..a12034d 100644
--- a/src/gallium/drivers/nv10/nv10_screen.c
+++ b/src/gallium/drivers/nv10/nv10_screen.c
@@ -122,14 +122,6 @@ nv10_screen_destroy(struct pipe_screen *pscreen)
 	FREE(pscreen);
 }
 
-static struct pipe_buffer *
-nv10_surface_buffer(struct pipe_surface *surf)
-{
-	struct nv10_miptree *mt = (struct nv10_miptree *)surf->texture;
-
-	return mt->buffer;
-}
-
 struct pipe_screen *
 nv10_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 {
@@ -156,8 +148,8 @@ nv10_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	pscreen->get_paramf = nv10_screen_get_paramf;
 	pscreen->is_format_supported = nv10_screen_is_format_supported;
 
-	nv10_screen_init_miptree_functions(pscreen);
-	nv10_screen_init_transfer_functions(pscreen);
+	nv04_screen_init_miptree_functions(pscreen);
+	nv04_screen_init_transfer_functions(pscreen);
 
 	/* 3D object */
 	if (dev->chipset >= 0x20)
@@ -183,7 +175,6 @@ nv10_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
-	screen->eng2d->buf = nv10_surface_buffer;
 
 	/* Notifier for sync purposes */
 	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
diff --git a/src/gallium/drivers/nv10/nv10_state.c b/src/gallium/drivers/nv10/nv10_state.c
index ad7def5..627135a 100644
--- a/src/gallium/drivers/nv10/nv10_state.c
+++ b/src/gallium/drivers/nv10/nv10_state.c
@@ -230,7 +230,7 @@ nv10_set_sampler_texture(struct pipe_context *pipe, unsigned nr,
 	unsigned unit;
 
 	for (unit = 0; unit < nr; unit++) {
-		nv10->tex_miptree[unit] = (struct nv10_miptree *)miptree[unit];
+		nv10->tex_miptree[unit] = (struct nv04_miptree *)miptree[unit];
 		nv10->dirty_samplers |= (1 << unit);
 	}
 }
diff --git a/src/gallium/drivers/nv10/nv10_state.h b/src/gallium/drivers/nv10/nv10_state.h
index 2524ac0..27433df 100644
--- a/src/gallium/drivers/nv10/nv10_state.h
+++ b/src/gallium/drivers/nv10/nv10_state.h
@@ -124,17 +124,4 @@ struct nv10_depth_stencil_alpha_state {
 	} alpha;
 };
 
-struct nv10_miptree {
-	struct pipe_texture base;
-	struct nouveau_bo *bo;
-
-	struct pipe_buffer *buffer;
-	uint total_size;
-
-	struct {
-		uint pitch;
-		uint *image_offset;
-	} level[PIPE_MAX_TEXTURE_LEVELS];
-};
-
 #endif
diff --git a/src/gallium/drivers/nv10/nv10_state_emit.c b/src/gallium/drivers/nv10/nv10_state_emit.c
index 30a596c..694ca9c 100644
--- a/src/gallium/drivers/nv10/nv10_state_emit.c
+++ b/src/gallium/drivers/nv10/nv10_state_emit.c
@@ -119,7 +119,7 @@ static void nv10_state_emit_framebuffer(struct nv10_context* nv10)
 	struct nv04_surface *rt, *zeta = NULL;
 	uint32_t rt_format, w, h;
 	int colour_format = 0, zeta_format = 0;
-        struct nv10_miptree *nv10mt = 0;
+	struct nv04_miptree *nv10mt = 0;
 
 	struct nv10_screen *screen = nv10->screen;
 	struct nouveau_channel *chan = screen->base.channel;
@@ -168,13 +168,13 @@ static void nv10_state_emit_framebuffer(struct nv10_context* nv10)
 		OUT_RING  (chan, rt->pitch | (rt->pitch << 16));
 	}
 
-	nv10mt = (struct nv10_miptree *)rt->base.texture;
-	nv10->rt[0] = nv10mt->buffer;
+	nv10mt = (struct nv04_miptree *)rt->base.texture;
+	nv10->rt[0] = nv10mt->bo;
 
 	if (zeta_format)
 	{
-		nv10mt = (struct nv10_miptree *)zeta->base.texture;
-		nv10->zeta = nv10mt->buffer;
+		nv10mt = (struct nv04_miptree *)zeta->base.texture;
+		nv10->zeta = nv10mt->bo;
 	}
 
 	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 3);
@@ -290,7 +290,7 @@ nv10_emit_hw_state(struct nv10_context *nv10)
 	 */
 
 	/* Render target */
-	rt_bo = nouveau_bo(nv10->rt[0]);
+	rt_bo = nv10->rt[0];
 // XXX figre out who's who for NV10TCL_DMA_* and fill accordingly
 //	BEGIN_RING(chan, celsius, NV10TCL_DMA_COLOR0, 1);
 //	OUT_RELOCo(chan, rt_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
@@ -298,7 +298,7 @@ nv10_emit_hw_state(struct nv10_context *nv10)
 	OUT_RELOCl(chan, rt_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	if (nv10->zeta) {
-		struct nouveau_bo *zeta_bo = nouveau_bo(nv10->zeta);
+		struct nouveau_bo *zeta_bo = nv10->zeta;
 // XXX
 //		BEGIN_RING(chan, celsius, NV10TCL_DMA_ZETA, 1);
 //		OUT_RELOCo(chan, zeta_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
diff --git a/src/gallium/drivers/nv10/nv10_transfer.c b/src/gallium/drivers/nv10/nv10_transfer.c
deleted file mode 100644
index eb04af9..0000000
--- a/src/gallium/drivers/nv10/nv10_transfer.c
+++ /dev/null
@@ -1,178 +0,0 @@
-#include <pipe/p_state.h>
-#include <pipe/p_defines.h>
-#include <pipe/p_inlines.h>
-#include <util/u_format.h>
-#include <util/u_memory.h>
-#include <util/u_math.h>
-#include <nouveau/nouveau_winsys.h>
-#include "nv10_context.h"
-#include "nv10_screen.h"
-#include "nv10_state.h"
-
-struct nv10_transfer {
-	struct pipe_transfer base;
-	struct pipe_surface *surface;
-	boolean direct;
-};
-
-static void
-nv10_compatible_transfer_tex(struct pipe_texture *pt, unsigned width, unsigned height,
-                             struct pipe_texture *template)
-{
-	memset(template, 0, sizeof(struct pipe_texture));
-	template->target = pt->target;
-	template->format = pt->format;
-	template->width0 = width;
-	template->height0 = height;
-	template->depth0 = 1;
-	template->last_level = 0;
-	template->nr_samples = pt->nr_samples;
-
-	template->tex_usage = PIPE_TEXTURE_USAGE_DYNAMIC |
-	                      NOUVEAU_TEXTURE_USAGE_LINEAR;
-}
-
-static struct pipe_transfer *
-nv10_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
-		  unsigned face, unsigned level, unsigned zslice,
-		  enum pipe_transfer_usage usage,
-		  unsigned x, unsigned y, unsigned w, unsigned h)
-{
-	struct nv10_miptree *mt = (struct nv10_miptree *)pt;
-	struct nv10_transfer *tx;
-	struct pipe_texture tx_tex_template, *tx_tex;
-
-	tx = CALLOC_STRUCT(nv10_transfer);
-	if (!tx)
-		return NULL;
-
-	pipe_texture_reference(&tx->base.texture, pt);
-	tx->base.x = x;
-	tx->base.y = y;
-	tx->base.width = w;
-	tx->base.height = h;
-	tx->base.stride = mt->level[level].pitch;
-	tx->base.usage = usage;
-	tx->base.face = face;
-	tx->base.level = level;
-	tx->base.zslice = zslice;
-
-	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
-	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
-	{
-		tx->direct = true;
-		tx->surface = pscreen->get_tex_surface(pscreen, pt,
-	                                               0, 0, 0,
-	                                               pipe_transfer_buffer_flags(&tx->base));
-		return &tx->base;
-	}
-
-	tx->direct = false;
-
-	nv10_compatible_transfer_tex(pt, w, h, &tx_tex_template);
-
-	tx_tex = pscreen->texture_create(pscreen, &tx_tex_template);
-	if (!tx_tex)
-	{
-		FREE(tx);
-		return NULL;
-	}
-
-	tx->base.stride = ((struct nv10_miptree*)tx_tex)->level[0].pitch;
-
-	tx->surface = pscreen->get_tex_surface(pscreen, tx_tex,
-	                                       face, level, zslice,
-	                                       pipe_transfer_buffer_flags(&tx->base));
-
-	pipe_texture_reference(&tx_tex, NULL);
-
-	if (!tx->surface)
-	{
-		pipe_surface_reference(&tx->surface, NULL);
-		FREE(tx);
-		return NULL;
-	}
-
-	if (usage & PIPE_TRANSFER_READ) {
-		struct nv10_screen *nvscreen = nv10_screen(pscreen);
-		struct pipe_surface *src;
-
-		src = pscreen->get_tex_surface(pscreen, pt,
-	                                       face, level, zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_READ);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		/* TODO: Check if SIFM can un-swizzle */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      tx->surface, 0, 0,
-		                      src, x, y,
-		                      w, h);
-
-		pipe_surface_reference(&src, NULL);
-	}
-
-	return &tx->base;
-}
-
-static void
-nv10_transfer_del(struct pipe_transfer *ptx)
-{
-	struct nv10_transfer *tx = (struct nv10_transfer *)ptx;
-
-	if (!tx->direct && (ptx->usage & PIPE_TRANSFER_WRITE)) {
-		struct pipe_screen *pscreen = ptx->texture->screen;
-		struct nv10_screen *nvscreen = nv10_screen(pscreen);
-		struct pipe_surface *dst;
-
-		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
-	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      dst, tx->base.x, tx->base.y,
-		                      tx->surface, 0, 0,
-		                      tx->base.width, tx->base.height);
-
-		pipe_surface_reference(&dst, NULL);
-	}
-
-	pipe_surface_reference(&tx->surface, NULL);
-	pipe_texture_reference(&ptx->texture, NULL);
-	FREE(ptx);
-}
-
-static void *
-nv10_transfer_map(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv10_transfer *tx = (struct nv10_transfer *)ptx;
-	struct nv04_surface *ns = (struct nv04_surface *)tx->surface;
-	struct nv10_miptree *mt = (struct nv10_miptree *)tx->surface->texture;
-	void *map = pipe_buffer_map(pscreen, mt->buffer,
-	                            pipe_transfer_buffer_flags(ptx));
-
-	if(!tx->direct)
-		return map + ns->base.offset;
-	else
-		return map + ns->base.offset + ptx->y * ns->pitch + ptx->x * util_format_get_blocksize(ptx->texture->format);
-}
-
-static void
-nv10_transfer_unmap(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv10_transfer *tx = (struct nv10_transfer *)ptx;
-	struct nv10_miptree *mt = (struct nv10_miptree *)tx->surface->texture;
-
-	pipe_buffer_unmap(pscreen, mt->buffer);
-}
-
-void
-nv10_screen_init_transfer_functions(struct pipe_screen *pscreen)
-{
-	pscreen->get_tex_transfer = nv10_transfer_new;
-	pscreen->tex_transfer_destroy = nv10_transfer_del;
-	pscreen->transfer_map = nv10_transfer_map;
-	pscreen->transfer_unmap = nv10_transfer_unmap;
-}
diff --git a/src/gallium/drivers/nv20/Makefile b/src/gallium/drivers/nv20/Makefile
index 1305f26..ffbbae2 100644
--- a/src/gallium/drivers/nv20/Makefile
+++ b/src/gallium/drivers/nv20/Makefile
@@ -8,13 +8,11 @@ C_SOURCES = \
 	nv20_context.c \
 	nv20_fragprog.c \
 	nv20_fragtex.c \
-	nv20_miptree.c \
 	nv20_prim_vbuf.c \
 	nv20_screen.c \
 	nv20_state.c \
 	nv20_state_emit.c \
 	nv20_surface.c \
-	nv20_transfer.c \
 	nv20_vbo.c
 #	nv20_vertprog.c
 
diff --git a/src/gallium/drivers/nv20/nv20_context.h b/src/gallium/drivers/nv20/nv20_context.h
index c7dfada..5cf33a3 100644
--- a/src/gallium/drivers/nv20/nv20_context.h
+++ b/src/gallium/drivers/nv20/nv20_context.h
@@ -47,14 +47,14 @@ struct nv20_context {
 	uint32_t dirty;
 
 	struct nv20_sampler_state *tex_sampler[PIPE_MAX_SAMPLERS];
-	struct nv20_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
+	struct nv04_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
 	unsigned dirty_samplers;
 	unsigned fp_samplers;
 	unsigned vp_samplers;
 
 	uint32_t rt_enable;
-	struct pipe_buffer *rt[4];
-	struct pipe_buffer *zeta;
+	struct nouveau_bo *rt[4];
+	struct nouveau_bo *zeta;
 	uint32_t lma_offset;
 
 	struct nv20_blend_state *blend;
diff --git a/src/gallium/drivers/nv20/nv20_fragtex.c b/src/gallium/drivers/nv20/nv20_fragtex.c
index dedbec7..8b31149 100644
--- a/src/gallium/drivers/nv20/nv20_fragtex.c
+++ b/src/gallium/drivers/nv20/nv20_fragtex.c
@@ -49,7 +49,7 @@ nv20_fragtex_build(struct nv20_context *nv20, int unit)
 {
 #if 0
 	struct nv20_sampler_state *ps = nv20->tex_sampler[unit];
-	struct nv20_miptree *nv20mt = nv20->tex_miptree[unit];
+	struct nv04_miptree *nv20mt = nv20->tex_miptree[unit];
 	struct pipe_texture *pt = &nv20mt->base;
 	struct nv20_texture_format *tf;
 	struct nv20_screen *screen = nv20->screen;
diff --git a/src/gallium/drivers/nv20/nv20_miptree.c b/src/gallium/drivers/nv20/nv20_miptree.c
deleted file mode 100644
index 8f7538e..0000000
--- a/src/gallium/drivers/nv20/nv20_miptree.c
+++ /dev/null
@@ -1,226 +0,0 @@
-#include "pipe/p_state.h"
-#include "pipe/p_defines.h"
-#include "pipe/p_inlines.h"
-#include "util/u_format.h"
-#include "util/u_math.h"
-
-#include "nv20_context.h"
-#include "nv20_screen.h"
-#include "../nv04/nv04_surface_2d.h"
-
-static void
-nv20_miptree_layout(struct nv20_miptree *nv20mt)
-{
-	struct pipe_texture *pt = &nv20mt->base;
-	uint width = pt->width0;
-	uint offset = 0;
-	int nr_faces, l, f;
-	uint wide_pitch = pt->tex_usage & (PIPE_TEXTURE_USAGE_SAMPLER |
-		                           PIPE_TEXTURE_USAGE_DEPTH_STENCIL |
-		                           PIPE_TEXTURE_USAGE_RENDER_TARGET |
-		                           PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
-		                           PIPE_TEXTURE_USAGE_PRIMARY);
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		nr_faces = 6;
-	} else {
-		nr_faces = 1;
-	}
-	
-	for (l = 0; l <= pt->last_level; l++) {
-		if (wide_pitch && (pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR))
-			nv20mt->level[l].pitch = align(util_format_get_stride(pt->format, pt->width0), 64);
-		else
-			nv20mt->level[l].pitch = util_format_get_stride(pt->format, width);
-
-		nv20mt->level[l].image_offset =
-			CALLOC(nr_faces, sizeof(unsigned));
-
-		width  = u_minify(width, 1);
-	}
-
-	for (f = 0; f < nr_faces; f++) {
-		for (l = 0; l < pt->last_level; l++) {
-			nv20mt->level[l].image_offset[f] = offset;
-
-			if (!(pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR) &&
-			    u_minify(pt->width0, l + 1) > 1 && u_minify(pt->height0, l + 1) > 1)
-				offset += align(nv20mt->level[l].pitch * u_minify(pt->height0, l), 64);
-			else
-				offset += nv20mt->level[l].pitch * u_minify(pt->height0, l);
-		}
-
-		nv20mt->level[l].image_offset[f] = offset;
-		offset += nv20mt->level[l].pitch * u_minify(pt->height0, l);
-	}
-
-	nv20mt->total_size = offset;
-}
-
-static struct pipe_texture *
-nv20_miptree_blanket(struct pipe_screen *pscreen, const struct pipe_texture *pt,
-		     const unsigned *stride, struct pipe_buffer *pb)
-{
-	struct nv20_miptree *mt;
-
-	/* Only supports 2D, non-mipmapped textures for the moment */
-	if (pt->target != PIPE_TEXTURE_2D || pt->last_level != 0 ||
-	    pt->depth0 != 1)
-		return NULL;
-
-	mt = CALLOC_STRUCT(nv20_miptree);
-	if (!mt)
-		return NULL;
-
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = pscreen;
-	mt->level[0].pitch = stride[0];
-	mt->level[0].image_offset = CALLOC(1, sizeof(unsigned));
-
-	pipe_buffer_reference(&mt->buffer, pb);
-	mt->bo = nouveau_bo(mt->buffer);
-	return &mt->base;
-}
-
-static struct pipe_texture *
-nv20_miptree_create(struct pipe_screen *screen, const struct pipe_texture *pt)
-{
-	struct nv20_miptree *mt;
-	unsigned buf_usage = PIPE_BUFFER_USAGE_PIXEL |
-	                     NOUVEAU_BUFFER_USAGE_TEXTURE;
-
-	mt = MALLOC(sizeof(struct nv20_miptree));
-	if (!mt)
-		return NULL;
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = screen;
-
-	/* Swizzled textures must be POT */
-	if (pt->width0 & (pt->width0 - 1) ||
-	    pt->height0 & (pt->height0 - 1))
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else
-	if (pt->tex_usage & (PIPE_TEXTURE_USAGE_PRIMARY |
-	                     PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
-	                     PIPE_TEXTURE_USAGE_DEPTH_STENCIL))
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else {
-		switch (pt->format) {
-		/* TODO: Figure out which formats can be swizzled */
-		case PIPE_FORMAT_A8R8G8B8_UNORM:
-		case PIPE_FORMAT_X8R8G8B8_UNORM:
-		case PIPE_FORMAT_R16_SNORM:
-		{
-			if (debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE))
-				mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-			break;
-		}
-		default:
-			mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-		}
-	}
-
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
-		buf_usage |= PIPE_BUFFER_USAGE_CPU_READ_WRITE;
-
-	/* apparently we can't render to swizzled surfaces smaller than 64 bytes, so make them linear.
-	 * If the user did not ask for a render target, they can still render to it, but it will cost them an extra copy.
-	 * This also happens for small mipmaps of large textures. */
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_RENDER_TARGET && util_format_get_stride(pt->format, pt->width0) < 64)
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-
-	nv20_miptree_layout(mt);
-
-	mt->buffer = screen->buffer_create(screen, 256, buf_usage, mt->total_size);
-	if (!mt->buffer) {
-		FREE(mt);
-		return NULL;
-	}
-	mt->bo = nouveau_bo(mt->buffer);
-	
-	return &mt->base;
-}
-
-static void
-nv20_miptree_destroy(struct pipe_texture *pt)
-{
-	struct nv20_miptree *nv20mt = (struct nv20_miptree *)pt;
-        int l;
-
-        pipe_buffer_reference(&nv20mt->buffer, NULL);
-        for (l = 0; l <= pt->last_level; l++) {
-		if (nv20mt->level[l].image_offset)
-			FREE(nv20mt->level[l].image_offset);
-        }
-}
-
-static struct pipe_surface *
-nv20_miptree_surface_get(struct pipe_screen *screen, struct pipe_texture *pt,
-			 unsigned face, unsigned level, unsigned zslice,
-			 unsigned flags)
-{
-	struct nv20_miptree *nv20mt = (struct nv20_miptree *)pt;
-	struct nv04_surface *ns;
-
-	ns = CALLOC_STRUCT(nv04_surface);
-	if (!ns)
-		return NULL;
-	pipe_texture_reference(&ns->base.texture, pt);
-	ns->base.format = pt->format;
-	ns->base.width = u_minify(pt->width0, level);
-	ns->base.height = u_minify(pt->height0, level);
-	ns->base.usage = flags;
-	pipe_reference_init(&ns->base.reference, 1);
-	ns->base.face = face;
-	ns->base.level = level;
-	ns->base.zslice = zslice;
-	ns->pitch = nv20mt->level[level].pitch;
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		ns->base.offset = nv20mt->level[level].image_offset[face];
-	} else
-	if (pt->target == PIPE_TEXTURE_3D) {
-		ns->base.offset = nv20mt->level[level].image_offset[zslice];
-	} else {
-		ns->base.offset = nv20mt->level[level].image_offset[0];
-	}
-
-	/* create a linear temporary that we can render into if necessary.
-	 * Note that ns->pitch is always a multiple of 64 for linear surfaces and swizzled surfaces are POT, so
-	 * ns->pitch & 63 is equivalent to (ns->pitch < 64 && swizzled)*/
-	if((ns->pitch & 63) && (ns->base.usage & (PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER)) == PIPE_BUFFER_USAGE_GPU_WRITE)
-		return &nv04_surface_wrap_for_render(screen, ((struct nv20_screen*)screen)->eng2d, ns)->base;
-
-	return &ns->base;
-}
-
-static void
-nv20_miptree_surface_destroy(struct pipe_surface *ps)
-{
-	struct nv04_surface* ns = (struct nv04_surface*)ps;
-	if(ns->backing)
-	{
-		struct nv20_screen* screen = (struct nv20_screen*)ps->texture->screen;
-		if(ns->backing->base.usage & PIPE_BUFFER_USAGE_GPU_WRITE)
-			screen->eng2d->copy(screen->eng2d, &ns->backing->base, 0, 0, ps, 0, 0, ns->base.width, ns->base.height);
-		nv20_miptree_surface_destroy(&ns->backing->base);
-	}
-	
-	pipe_texture_reference(&ps->texture, NULL);
-	FREE(ps);
-}
-
-void nv20_screen_init_miptree_functions(struct pipe_screen *pscreen)
-{
-	pscreen->texture_create = nv20_miptree_create;
-	pscreen->texture_blanket = nv20_miptree_blanket;
-	pscreen->texture_destroy = nv20_miptree_destroy;
-	pscreen->get_tex_surface = nv20_miptree_surface_get;
-	pscreen->tex_surface_destroy = nv20_miptree_surface_destroy;
-}
-
diff --git a/src/gallium/drivers/nv20/nv20_screen.c b/src/gallium/drivers/nv20/nv20_screen.c
index d091335..340c58c 100644
--- a/src/gallium/drivers/nv20/nv20_screen.c
+++ b/src/gallium/drivers/nv20/nv20_screen.c
@@ -122,14 +122,6 @@ nv20_screen_destroy(struct pipe_screen *pscreen)
 	FREE(pscreen);
 }
 
-static struct pipe_buffer *
-nv20_surface_buffer(struct pipe_surface *surf)
-{
-	struct nv20_miptree *mt = (struct nv20_miptree *)surf->texture;
-
-	return mt->buffer;
-}
-
 struct pipe_screen *
 nv20_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 {
@@ -156,8 +148,8 @@ nv20_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	pscreen->get_paramf = nv20_screen_get_paramf;
 	pscreen->is_format_supported = nv20_screen_is_format_supported;
 
-	nv20_screen_init_miptree_functions(pscreen);
-	nv20_screen_init_transfer_functions(pscreen);
+	nv04_screen_init_miptree_functions(pscreen);
+	nv04_screen_init_transfer_functions(pscreen);
 
 	/* 3D object */
 	if (dev->chipset >= 0x25)
@@ -179,7 +171,6 @@ nv20_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
-	screen->eng2d->buf = nv20_surface_buffer;
 
 	/* Notifier for sync purposes */
 	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
diff --git a/src/gallium/drivers/nv20/nv20_state.c b/src/gallium/drivers/nv20/nv20_state.c
index 05d47aa..7ade874 100644
--- a/src/gallium/drivers/nv20/nv20_state.c
+++ b/src/gallium/drivers/nv20/nv20_state.c
@@ -221,7 +221,7 @@ nv20_set_sampler_texture(struct pipe_context *pipe, unsigned nr,
 	unsigned unit;
 
 	for (unit = 0; unit < nr; unit++) {
-		nv20->tex_miptree[unit] = (struct nv20_miptree *)miptree[unit];
+		nv20->tex_miptree[unit] = (struct nv04_miptree *)miptree[unit];
 		nv20->dirty_samplers |= (1 << unit);
 	}
 }
diff --git a/src/gallium/drivers/nv20/nv20_state.h b/src/gallium/drivers/nv20/nv20_state.h
index b8b0366..b08a62a 100644
--- a/src/gallium/drivers/nv20/nv20_state.h
+++ b/src/gallium/drivers/nv20/nv20_state.h
@@ -126,17 +126,4 @@ struct nv20_depth_stencil_alpha_state {
 	} alpha;
 };
 
-struct nv20_miptree {
-	struct pipe_texture base;
-	struct nouveau_bo *bo;
-
-	struct pipe_buffer *buffer;
-	uint total_size;
-
-	struct {
-		uint pitch;
-		uint *image_offset;
-	} level[PIPE_MAX_TEXTURE_LEVELS];
-};
-
 #endif
diff --git a/src/gallium/drivers/nv20/nv20_state_emit.c b/src/gallium/drivers/nv20/nv20_state_emit.c
index a916788..0ba1cb0 100644
--- a/src/gallium/drivers/nv20/nv20_state_emit.c
+++ b/src/gallium/drivers/nv20/nv20_state_emit.c
@@ -132,7 +132,7 @@ static void nv20_state_emit_framebuffer(struct nv20_context* nv20)
 	struct nv04_surface *rt, *zeta = NULL;
 	uint32_t rt_format, w, h;
 	int colour_format = 0, zeta_format = 0;
-	struct nv20_miptree *nv20mt = 0;
+	struct nv04_miptree *nv20mt = 0;
 	struct nv20_screen *screen = nv20->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 	struct nouveau_grobj *kelvin = screen->kelvin;
@@ -180,13 +180,13 @@ static void nv20_state_emit_framebuffer(struct nv20_context* nv20)
 		OUT_RING  (chan, rt->pitch | (rt->pitch << 16));
 	}
 
-	nv20mt = (struct nv20_miptree *)rt->base.texture;
-	nv20->rt[0] = nv20mt->buffer;
+	nv20mt = (struct nv04_miptree *)rt->base.texture;
+	nv20->rt[0] = nv20mt->bo;
 
 	if (zeta_format)
 	{
-		nv20mt = (struct nv20_miptree *)zeta->base.texture;
-		nv20->zeta = nv20mt->buffer;
+		nv20mt = (struct nv04_miptree *)zeta->base.texture;
+		nv20->zeta = nv20mt->bo;
 	}
 
 	BEGIN_RING(chan, kelvin, NV20TCL_RT_HORIZ, 3);
@@ -388,14 +388,14 @@ nv20_emit_hw_state(struct nv20_context *nv20)
 	 */
 
 	/* Render target */
-	rt_bo = nouveau_bo(nv20->rt[0]);
+	rt_bo = nv20->rt[0];
 	BEGIN_RING(chan, kelvin, NV20TCL_DMA_COLOR, 1);
 	OUT_RELOCo(chan, rt_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	BEGIN_RING(chan, kelvin, NV20TCL_COLOR_OFFSET, 1);
 	OUT_RELOCl(chan, rt_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	if (nv20->zeta) {
-		struct nouveau_bo *zeta_bo = nouveau_bo(nv20->zeta);
+		struct nouveau_bo *zeta_bo = nv20->zeta;
 		BEGIN_RING(chan, kelvin, NV20TCL_DMA_ZETA, 1);
 		OUT_RELOCo(chan, zeta_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 		BEGIN_RING(chan, kelvin, NV20TCL_ZETA_OFFSET, 1);
diff --git a/src/gallium/drivers/nv20/nv20_transfer.c b/src/gallium/drivers/nv20/nv20_transfer.c
deleted file mode 100644
index 699773e..0000000
--- a/src/gallium/drivers/nv20/nv20_transfer.c
+++ /dev/null
@@ -1,178 +0,0 @@
-#include <pipe/p_state.h>
-#include <pipe/p_defines.h>
-#include <pipe/p_inlines.h>
-#include <util/u_format.h>
-#include <util/u_memory.h>
-#include <util/u_math.h>
-#include <nouveau/nouveau_winsys.h>
-#include "nv20_context.h"
-#include "nv20_screen.h"
-#include "nv20_state.h"
-
-struct nv20_transfer {
-	struct pipe_transfer base;
-	struct pipe_surface *surface;
-	boolean direct;
-};
-
-static void
-nv20_compatible_transfer_tex(struct pipe_texture *pt, unsigned width, unsigned height,
-                             struct pipe_texture *template)
-{
-	memset(template, 0, sizeof(struct pipe_texture));
-	template->target = pt->target;
-	template->format = pt->format;
-	template->width0 = width;
-	template->height0 = height;
-	template->depth0 = 1;
-	template->last_level = 0;
-	template->nr_samples = pt->nr_samples;
-
-	template->tex_usage = PIPE_TEXTURE_USAGE_DYNAMIC |
-	                      NOUVEAU_TEXTURE_USAGE_LINEAR;
-}
-
-static struct pipe_transfer *
-nv20_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
-		  unsigned face, unsigned level, unsigned zslice,
-		  enum pipe_transfer_usage usage,
-		  unsigned x, unsigned y, unsigned w, unsigned h)
-{
-	struct nv20_miptree *mt = (struct nv20_miptree *)pt;
-	struct nv20_transfer *tx;
-	struct pipe_texture tx_tex_template, *tx_tex;
-
-	tx = CALLOC_STRUCT(nv20_transfer);
-	if (!tx)
-		return NULL;
-
-	pipe_texture_reference(&tx->base.texture, pt);
-	tx->base.x = x;
-	tx->base.y = y;
-	tx->base.width = w;
-	tx->base.height = h;
-	tx->base.stride = mt->level[level].pitch;
-	tx->base.usage = usage;
-	tx->base.face = face;
-	tx->base.level = level;
-	tx->base.zslice = zslice;
-
-	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
-	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
-	{
-		tx->direct = true;
-		tx->surface = pscreen->get_tex_surface(pscreen, pt,
-	                                               0, 0, 0,
-	                                               pipe_transfer_buffer_flags(&tx->base));
-		return &tx->base;
-	}
-
-	tx->direct = false;
-
-	nv20_compatible_transfer_tex(pt, w, h, &tx_tex_template);
-
-	tx_tex = pscreen->texture_create(pscreen, &tx_tex_template);
-	if (!tx_tex)
-	{
-		FREE(tx);
-		return NULL;
-	}
-
-	tx->base.stride = ((struct nv20_miptree*)tx_tex)->level[0].pitch;
-
-	tx->surface = pscreen->get_tex_surface(pscreen, tx_tex,
-	                                       face, level, zslice,
-	                                       pipe_transfer_buffer_flags(&tx->base));
-
-	pipe_texture_reference(&tx_tex, NULL);
-
-	if (!tx->surface)
-	{
-		pipe_surface_reference(&tx->surface, NULL);
-		FREE(tx);
-		return NULL;
-	}
-
-	if (usage & PIPE_TRANSFER_READ) {
-		struct nv20_screen *nvscreen = nv20_screen(pscreen);
-		struct pipe_surface *src;
-
-		src = pscreen->get_tex_surface(pscreen, pt,
-	                                       face, level, zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_READ);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		/* TODO: Check if SIFM can un-swizzle */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      tx->surface, 0, 0,
-		                      src, x, y,
-		                      w, h);
-
-		pipe_surface_reference(&src, NULL);
-	}
-
-	return &tx->base;
-}
-
-static void
-nv20_transfer_del(struct pipe_transfer *ptx)
-{
-	struct nv20_transfer *tx = (struct nv20_transfer *)ptx;
-
-	if (!tx->direct && (ptx->usage = PIPE_TRANSFER_WRITE)) {
-		struct pipe_screen *pscreen = ptx->texture->screen;
-		struct nv20_screen *nvscreen = nv20_screen(pscreen);
-		struct pipe_surface *dst;
-
-		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
-	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      dst, tx->base.x, tx->base.y,
-		                      tx->surface, 0, 0,
-		                      tx->base.width, tx->base.height);
-
-		pipe_surface_reference(&dst, NULL);
-	}
-
-	pipe_surface_reference(&tx->surface, NULL);
-	pipe_texture_reference(&ptx->texture, NULL);
-	FREE(ptx);
-}
-
-static void *
-nv20_transfer_map(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv20_transfer *tx = (struct nv20_transfer *)ptx;
-	struct nv04_surface *ns = (struct nv04_surface *)tx->surface;
-	struct nv20_miptree *mt = (struct nv20_miptree *)tx->surface->texture;
-	void *map = pipe_buffer_map(pscreen, mt->buffer,
-	                            pipe_transfer_buffer_flags(ptx));
-
-	if(!tx->direct)
-		return map + ns->base.offset;
-	else
-		return map + ns->base.offset + ptx->y * ns->pitch + ptx->x * util_format_get_blocksize(ptx->texture->format);
-}
-
-static void
-nv20_transfer_unmap(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv20_transfer *tx = (struct nv20_transfer *)ptx;
-	struct nv20_miptree *mt = (struct nv20_miptree *)tx->surface->texture;
-
-	pipe_buffer_unmap(pscreen, mt->buffer);
-}
-
-void
-nv20_screen_init_transfer_functions(struct pipe_screen *pscreen)
-{
-	pscreen->get_tex_transfer = nv20_transfer_new;
-	pscreen->tex_transfer_destroy = nv20_transfer_del;
-	pscreen->transfer_map = nv20_transfer_map;
-	pscreen->transfer_unmap = nv20_transfer_unmap;
-}
diff --git a/src/gallium/drivers/nv30/Makefile b/src/gallium/drivers/nv30/Makefile
index 364c80d..d428864 100644
--- a/src/gallium/drivers/nv30/Makefile
+++ b/src/gallium/drivers/nv30/Makefile
@@ -9,7 +9,6 @@ C_SOURCES = \
 	nv30_draw.c \
 	nv30_fragprog.c \
 	nv30_fragtex.c \
-	nv30_miptree.c \
 	nv30_query.c \
 	nv30_screen.c \
 	nv30_state.c \
@@ -22,7 +21,6 @@ C_SOURCES = \
 	nv30_state_viewport.c \
 	nv30_state_zsa.c \
 	nv30_surface.c \
-	nv30_transfer.c \
 	nv30_vbo.c \
 	nv30_vertprog.c
 
diff --git a/src/gallium/drivers/nv30/nv30_context.h b/src/gallium/drivers/nv30/nv30_context.h
index e594492..e79c12f 100644
--- a/src/gallium/drivers/nv30/nv30_context.h
+++ b/src/gallium/drivers/nv30/nv30_context.h
@@ -132,7 +132,7 @@ struct nv30_context {
 	struct pipe_buffer *idxbuf;
 	unsigned idxbuf_format;
 	struct nv30_sampler_state *tex_sampler[PIPE_MAX_SAMPLERS];
-	struct nv30_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
+	struct nv04_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
 	unsigned nr_samplers;
 	unsigned nr_textures;
 	unsigned dirty_samplers;
diff --git a/src/gallium/drivers/nv30/nv30_fragtex.c b/src/gallium/drivers/nv30/nv30_fragtex.c
index 0cc3172..36d2666 100644
--- a/src/gallium/drivers/nv30/nv30_fragtex.c
+++ b/src/gallium/drivers/nv30/nv30_fragtex.c
@@ -59,9 +59,9 @@ static struct nouveau_stateobj *
 nv30_fragtex_build(struct nv30_context *nv30, int unit)
 {
 	struct nv30_sampler_state *ps = nv30->tex_sampler[unit];
-	struct nv30_miptree *nv30mt = nv30->tex_miptree[unit];
-	struct pipe_texture *pt = &nv30mt->base;
-	struct nouveau_bo *bo = nouveau_bo(nv30mt->buffer);
+	struct nv04_miptree *mt = nv30->tex_miptree[unit];
+	struct pipe_texture *pt = &mt->base;
+	struct nouveau_bo *bo = mt->bo;
 	struct nv30_texture_format *tf;
 	struct nouveau_stateobj *so;
 	uint32_t txf, txs;
@@ -96,6 +96,8 @@ nv30_fragtex_build(struct nv30_context *nv30, int unit)
 		return NULL;
 	}
 
+	/* FIXME: specify whether textures are swizzled or not somehow */
+
 	txs = tf->swizzle;
 
 	so = so_new(1, 8, 2);
diff --git a/src/gallium/drivers/nv30/nv30_miptree.c b/src/gallium/drivers/nv30/nv30_miptree.c
deleted file mode 100644
index 8fbba38..0000000
--- a/src/gallium/drivers/nv30/nv30_miptree.c
+++ /dev/null
@@ -1,239 +0,0 @@
-#include "pipe/p_state.h"
-#include "pipe/p_defines.h"
-#include "pipe/p_inlines.h"
-#include "util/u_format.h"
-#include "util/u_math.h"
-
-#include "nv30_context.h"
-#include "../nv04/nv04_surface_2d.h"
-
-static void
-nv30_miptree_layout(struct nv30_miptree *nv30mt)
-{
-	struct pipe_texture *pt = &nv30mt->base;
-	uint width = pt->width0;
-	uint offset = 0;
-	int nr_faces, l, f;
-	uint wide_pitch = pt->tex_usage & (PIPE_TEXTURE_USAGE_SAMPLER |
-		                           PIPE_TEXTURE_USAGE_DEPTH_STENCIL |
-		                           PIPE_TEXTURE_USAGE_RENDER_TARGET |
-		                           PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
-		                           PIPE_TEXTURE_USAGE_PRIMARY);
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		nr_faces = 6;
-	} else
-	if (pt->target == PIPE_TEXTURE_3D) {
-		nr_faces = pt->depth0;
-	} else {
-		nr_faces = 1;
-	}
-
-	for (l = 0; l <= pt->last_level; l++) {
-		if (wide_pitch && (pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR))
-			nv30mt->level[l].pitch = align(util_format_get_stride(pt->format, pt->width0), 64);
-		else
-			nv30mt->level[l].pitch = util_format_get_stride(pt->format, width);
-
-		nv30mt->level[l].image_offset =
-			CALLOC(nr_faces, sizeof(unsigned));
-
-		width  = u_minify(width, 1);
-	}
-
-	for (f = 0; f < nr_faces; f++) {
-		for (l = 0; l < pt->last_level; l++) {
-			nv30mt->level[l].image_offset[f] = offset;
-
-			if (!(pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR) &&
-			    u_minify(pt->width0, l + 1) > 1 && u_minify(pt->height0, l + 1) > 1)
-				offset += align(nv30mt->level[l].pitch * u_minify(pt->height0, l), 64);
-			else
-				offset += nv30mt->level[l].pitch * u_minify(pt->height0, l);
-		}
-
-		nv30mt->level[l].image_offset[f] = offset;
-		offset += nv30mt->level[l].pitch * u_minify(pt->height0, l);
-	}
-
-	nv30mt->total_size = offset;
-}
-
-static struct pipe_texture *
-nv30_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
-{
-	struct nv30_miptree *mt;
-	unsigned buf_usage = PIPE_BUFFER_USAGE_PIXEL |
-	                     NOUVEAU_BUFFER_USAGE_TEXTURE;
-
-	mt = MALLOC(sizeof(struct nv30_miptree));
-	if (!mt)
-		return NULL;
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = pscreen;
-
-	/* Swizzled textures must be POT */
-	if (pt->width0 & (pt->width0 - 1) ||
-	    pt->height0 & (pt->height0 - 1))
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else
-	if (pt->tex_usage & (PIPE_TEXTURE_USAGE_PRIMARY |
-	                     PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
-	                     PIPE_TEXTURE_USAGE_DEPTH_STENCIL))
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else {
-		switch (pt->format) {
-		/* TODO: Figure out which formats can be swizzled */
-		case PIPE_FORMAT_A8R8G8B8_UNORM:
-		case PIPE_FORMAT_X8R8G8B8_UNORM:
-		case PIPE_FORMAT_R16_SNORM:
-		case PIPE_FORMAT_R5G6B5_UNORM:
-		case PIPE_FORMAT_A8L8_UNORM:
-		case PIPE_FORMAT_A8_UNORM:
-		case PIPE_FORMAT_L8_UNORM:
-		case PIPE_FORMAT_I8_UNORM:
-		{
-			if (debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE))
-				mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
- 			break;
-		}
-		default:
-			mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-		}
-	}
-
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
-		buf_usage |= PIPE_BUFFER_USAGE_CPU_READ_WRITE;
-
-	/* apparently we can't render to swizzled surfaces smaller than 64 bytes, so make them linear.
-	 * If the user did not ask for a render target, they can still render to it, but it will cost them an extra copy.
-	 * This also happens for small mipmaps of large textures. */
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_RENDER_TARGET && util_format_get_stride(pt->format, pt->width0) < 64)
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-
-	nv30_miptree_layout(mt);
-
-	mt->buffer = pscreen->buffer_create(pscreen, 256, buf_usage,
-				       mt->total_size);
-	if (!mt->buffer) {
-		FREE(mt);
-		return NULL;
-	}
-	mt->bo = nouveau_bo(mt->buffer);
-
-	return &mt->base;
-}
-
-static struct pipe_texture *
-nv30_miptree_blanket(struct pipe_screen *pscreen, const struct pipe_texture *pt,
-		     const unsigned *stride, struct pipe_buffer *pb)
-{
-	struct nv30_miptree *mt;
-
-	/* Only supports 2D, non-mipmapped textures for the moment */
-	if (pt->target != PIPE_TEXTURE_2D || pt->last_level != 0 ||
-	    pt->depth0 != 1)
-		return NULL;
-
-	mt = CALLOC_STRUCT(nv30_miptree);
-	if (!mt)
-		return NULL;
-
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = pscreen;
-	mt->level[0].pitch = stride[0];
-	mt->level[0].image_offset = CALLOC(1, sizeof(unsigned));
-
-	/* Assume whoever created this buffer expects it to be linear for now */
-	mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-
-	pipe_buffer_reference(&mt->buffer, pb);
-	mt->bo = nouveau_bo(mt->buffer);
-	return &mt->base;
-}
-
-static void
-nv30_miptree_destroy(struct pipe_texture *pt)
-{
-	struct nv30_miptree *mt = (struct nv30_miptree *)pt;
-	int l;
-
-	pipe_buffer_reference(&mt->buffer, NULL);
-	for (l = 0; l <= pt->last_level; l++) {
-		if (mt->level[l].image_offset)
-			FREE(mt->level[l].image_offset);
-	}
-
-	FREE(mt);
-}
-
-static struct pipe_surface *
-nv30_miptree_surface_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
-			 unsigned face, unsigned level, unsigned zslice,
-			 unsigned flags)
-{
-	struct nv30_miptree *nv30mt = (struct nv30_miptree *)pt;
-	struct nv04_surface *ns;
-
-	ns = CALLOC_STRUCT(nv04_surface);
-	if (!ns)
-		return NULL;
-	pipe_texture_reference(&ns->base.texture, pt);
-	ns->base.format = pt->format;
-	ns->base.width = u_minify(pt->width0, level);
-	ns->base.height = u_minify(pt->height0, level);
-	ns->base.usage = flags;
-	pipe_reference_init(&ns->base.reference, 1);
-	ns->base.face = face;
-	ns->base.level = level;
-	ns->base.zslice = zslice;
-	ns->pitch = nv30mt->level[level].pitch;
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		ns->base.offset = nv30mt->level[level].image_offset[face];
-	} else
-	if (pt->target == PIPE_TEXTURE_3D) {
-		ns->base.offset = nv30mt->level[level].image_offset[zslice];
-	} else {
-		ns->base.offset = nv30mt->level[level].image_offset[0];
-	}
-
-	/* create a linear temporary that we can render into if necessary.
-	 * Note that ns->pitch is always a multiple of 64 for linear surfaces and swizzled surfaces are POT, so
-	 * ns->pitch & 63 is equivalent to (ns->pitch < 64 && swizzled)*/
-	if((ns->pitch & 63) && (ns->base.usage & (PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER)) == PIPE_BUFFER_USAGE_GPU_WRITE)
-		return &nv04_surface_wrap_for_render(pscreen, ((struct nv30_screen*)pscreen)->eng2d, ns)->base;
-
-	return &ns->base;
-}
-
-static void
-nv30_miptree_surface_del(struct pipe_surface *ps)
-{
-	struct nv04_surface* ns = (struct nv04_surface*)ps;
-	if(ns->backing)
-	{
-		struct nv30_screen* screen = (struct nv30_screen*)ps->texture->screen;
-		if(ns->backing->base.usage & PIPE_BUFFER_USAGE_GPU_WRITE)
-			screen->eng2d->copy(screen->eng2d, &ns->backing->base, 0, 0, ps, 0, 0, ns->base.width, ns->base.height);
-		nv30_miptree_surface_del(&ns->backing->base);
-	}
-
-	pipe_texture_reference(&ps->texture, NULL);
-	FREE(ps);
-}
-
-void
-nv30_screen_init_miptree_functions(struct pipe_screen *pscreen)
-{
-	pscreen->texture_create = nv30_miptree_create;
-	pscreen->texture_blanket = nv30_miptree_blanket;
-	pscreen->texture_destroy = nv30_miptree_destroy;
-	pscreen->get_tex_surface = nv30_miptree_surface_new;
-	pscreen->tex_surface_destroy = nv30_miptree_surface_del;
-}
diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index f564084..fed8f0e 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -144,14 +144,6 @@ nv30_screen_surface_format_supported(struct pipe_screen *pscreen,
 	return FALSE;
 }
 
-static struct pipe_buffer *
-nv30_surface_buffer(struct pipe_surface *surf)
-{
-	struct nv30_miptree *mt = (struct nv30_miptree *)surf->texture;
-
-	return mt->buffer;
-}
-
 static void
 nv30_screen_destroy(struct pipe_screen *pscreen)
 {
@@ -203,8 +195,8 @@ nv30_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	pscreen->get_paramf = nv30_screen_get_paramf;
 	pscreen->is_format_supported = nv30_screen_surface_format_supported;
 
-	nv30_screen_init_miptree_functions(pscreen);
-	nv30_screen_init_transfer_functions(pscreen);
+	nv04_screen_init_miptree_functions(pscreen);
+	nv04_screen_init_transfer_functions(pscreen);
 
 	/* 3D object */
 	switch (dev->chipset & 0xf0) {
@@ -236,7 +228,6 @@ nv30_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
-	screen->eng2d->buf = nv30_surface_buffer;
 
 	/* Notifier for sync purposes */
 	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
diff --git a/src/gallium/drivers/nv30/nv30_state.h b/src/gallium/drivers/nv30/nv30_state.h
index e42e872..49be8b5 100644
--- a/src/gallium/drivers/nv30/nv30_state.h
+++ b/src/gallium/drivers/nv30/nv30_state.h
@@ -70,17 +70,4 @@ struct nv30_fragment_program {
 	struct nouveau_stateobj *so;
 };
 
-struct nv30_miptree {
-	struct pipe_texture base;
-	struct nouveau_bo *bo;
-
-	struct pipe_buffer *buffer;
-	uint total_size;
-
-	struct {
-		uint pitch;
-		uint *image_offset;
-	} level[PIPE_MAX_TEXTURE_LEVELS];
-};
-
 #endif
diff --git a/src/gallium/drivers/nv30/nv30_state_fb.c b/src/gallium/drivers/nv30/nv30_state_fb.c
index 2ed2ea5..c0b5b6a 100644
--- a/src/gallium/drivers/nv30/nv30_state_fb.c
+++ b/src/gallium/drivers/nv30/nv30_state_fb.c
@@ -14,7 +14,7 @@ nv30_state_framebuffer_validate(struct nv30_context *nv30)
 	unsigned rt_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
 	unsigned w = fb->width;
 	unsigned h = fb->height;
-	struct nv30_miptree *nv30mt;
+	struct nv04_miptree *mt;
 	int colour_bits = 32, zeta_bits = 32;
 
 	for (i = 0; i < fb->nr_cbufs; i++) {
@@ -109,34 +109,34 @@ nv30_state_framebuffer_validate(struct nv30_context *nv30)
 			pitch |= (pitch << 16);
 		}
 
-		nv30mt = (struct nv30_miptree *) rt0->base.texture;
+		mt = (struct nv04_miptree *) rt0->base.texture;
 		so_method(so, rankine, NV34TCL_DMA_COLOR0, 1);
-		so_reloc (so, nouveau_bo(nv30mt->buffer), 0, rt_flags | NOUVEAU_BO_OR,
+		so_reloc (so, mt->bo, 0, rt_flags | NOUVEAU_BO_OR,
 			      chan->vram->handle, chan->gart->handle);
 		so_method(so, rankine, NV34TCL_COLOR0_PITCH, 2);
 		so_data  (so, pitch);
-		so_reloc (so, nouveau_bo(nv30mt->buffer), rt0->base.offset,
+		so_reloc (so, mt->bo, rt0->base.offset,
 			      rt_flags | NOUVEAU_BO_LOW, 0, 0);
 	}
 
 	if (rt_enable & NV34TCL_RT_ENABLE_COLOR1) {
-		nv30mt = (struct nv30_miptree *)rt[1]->base.texture;
+		mt = (struct nv04_miptree *)rt[1]->base.texture;
 		so_method(so, rankine, NV34TCL_DMA_COLOR1, 1);
-		so_reloc (so, nouveau_bo(nv30mt->buffer), 0, rt_flags | NOUVEAU_BO_OR,
+		so_reloc (so, mt->bo, 0, rt_flags | NOUVEAU_BO_OR,
 			      chan->vram->handle, chan->gart->handle);
 		so_method(so, rankine, NV34TCL_COLOR1_OFFSET, 2);
-		so_reloc (so, nouveau_bo(nv30mt->buffer), rt[1]->base.offset,
+		so_reloc (so, mt->bo, rt[1]->base.offset,
 			      rt_flags | NOUVEAU_BO_LOW, 0, 0);
 		so_data  (so, rt[1]->pitch);
 	}
 
 	if (zeta_format) {
-		nv30mt = (struct nv30_miptree *)zeta->base.texture;
+		mt = (struct nv04_miptree *)zeta->base.texture;
 		so_method(so, rankine, NV34TCL_DMA_ZETA, 1);
-		so_reloc (so, nouveau_bo(nv30mt->buffer), 0, rt_flags | NOUVEAU_BO_OR,
+		so_reloc (so, mt->bo, 0, rt_flags | NOUVEAU_BO_OR,
 			      chan->vram->handle, chan->gart->handle);
 		so_method(so, rankine, NV34TCL_ZETA_OFFSET, 1);
-		so_reloc (so, nouveau_bo(nv30mt->buffer), zeta->base.offset,
+		so_reloc (so, mt->bo, zeta->base.offset,
 			      rt_flags | NOUVEAU_BO_LOW, 0, 0);
 		/* TODO: allocate LMA depth buffer */
 	}
diff --git a/src/gallium/drivers/nv30/nv30_transfer.c b/src/gallium/drivers/nv30/nv30_transfer.c
deleted file mode 100644
index 6559899..0000000
--- a/src/gallium/drivers/nv30/nv30_transfer.c
+++ /dev/null
@@ -1,178 +0,0 @@
-#include <pipe/p_state.h>
-#include <pipe/p_defines.h>
-#include <pipe/p_inlines.h>
-#include <util/u_format.h>
-#include <util/u_memory.h>
-#include <util/u_math.h>
-#include <nouveau/nouveau_winsys.h>
-#include "nv30_context.h"
-#include "nv30_screen.h"
-#include "nv30_state.h"
-
-struct nv30_transfer {
-	struct pipe_transfer base;
-	struct pipe_surface *surface;
-	boolean direct;
-};
-
-static void
-nv30_compatible_transfer_tex(struct pipe_texture *pt, unsigned width, unsigned height,
-                             struct pipe_texture *template)
-{
-	memset(template, 0, sizeof(struct pipe_texture));
-	template->target = pt->target;
-	template->format = pt->format;
-	template->width0 = width;
-	template->height0 = height;
-	template->depth0 = 1;
-	template->last_level = 0;
-	template->nr_samples = pt->nr_samples;
-
-	template->tex_usage = PIPE_TEXTURE_USAGE_DYNAMIC |
-	                      NOUVEAU_TEXTURE_USAGE_LINEAR;
-}
-
-static struct pipe_transfer *
-nv30_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
-		  unsigned face, unsigned level, unsigned zslice,
-		  enum pipe_transfer_usage usage,
-		  unsigned x, unsigned y, unsigned w, unsigned h)
-{
-	struct nv30_miptree *mt = (struct nv30_miptree *)pt;
-	struct nv30_transfer *tx;
-	struct pipe_texture tx_tex_template, *tx_tex;
-
-	tx = CALLOC_STRUCT(nv30_transfer);
-	if (!tx)
-		return NULL;
-
-	pipe_texture_reference(&tx->base.texture, pt);
-	tx->base.x = x;
-	tx->base.y = y;
-	tx->base.width = w;
-	tx->base.height = h;
-	tx->base.stride = mt->level[level].pitch;
-	tx->base.usage = usage;
-	tx->base.face = face;
-	tx->base.level = level;
-	tx->base.zslice = zslice;
-
-	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
-	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
-	{
-		tx->direct = true;
-		tx->surface = pscreen->get_tex_surface(pscreen, pt,
-	                                               face, level, zslice,
-	                                               pipe_transfer_buffer_flags(&tx->base));
-		return &tx->base;
-	}
-
-	tx->direct = false;
-
-	nv30_compatible_transfer_tex(pt, w, h, &tx_tex_template);
-
-	tx_tex = pscreen->texture_create(pscreen, &tx_tex_template);
-	if (!tx_tex)
-	{
-		FREE(tx);
-		return NULL;
-	}
-
-	tx->base.stride = ((struct nv30_miptree*)tx_tex)->level[0].pitch;
-
-	tx->surface = pscreen->get_tex_surface(pscreen, tx_tex,
-	                                       0, 0, 0,
-	                                       pipe_transfer_buffer_flags(&tx->base));
-
-	pipe_texture_reference(&tx_tex, NULL);
-
-	if (!tx->surface)
-	{
-		pipe_surface_reference(&tx->surface, NULL);
-		FREE(tx);
-		return NULL;
-	}
-
-	if (usage & PIPE_TRANSFER_READ) {
-		struct nv30_screen *nvscreen = nv30_screen(pscreen);
-		struct pipe_surface *src;
-
-		src = pscreen->get_tex_surface(pscreen, pt,
-	                                       face, level, zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_READ);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		/* TODO: Check if SIFM can un-swizzle */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      tx->surface, 0, 0,
-		                      src, x, y,
-		                      w, h);
-
-		pipe_surface_reference(&src, NULL);
-	}
-
-	return &tx->base;
-}
-
-static void
-nv30_transfer_del(struct pipe_transfer *ptx)
-{
-	struct nv30_transfer *tx = (struct nv30_transfer *)ptx;
-
-	if (!tx->direct && (ptx->usage & PIPE_TRANSFER_WRITE)) {
-		struct pipe_screen *pscreen = ptx->texture->screen;
-		struct nv30_screen *nvscreen = nv30_screen(pscreen);
-		struct pipe_surface *dst;
-
-		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
-	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      dst, tx->base.x, tx->base.y,
-		                      tx->surface, 0, 0,
-		                      tx->base.width, tx->base.height);
-
-		pipe_surface_reference(&dst, NULL);
-	}
-
-	pipe_surface_reference(&tx->surface, NULL);
-	pipe_texture_reference(&ptx->texture, NULL);
-	FREE(ptx);
-}
-
-static void *
-nv30_transfer_map(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv30_transfer *tx = (struct nv30_transfer *)ptx;
-	struct nv04_surface *ns = (struct nv04_surface *)tx->surface;
-	struct nv30_miptree *mt = (struct nv30_miptree *)tx->surface->texture;
-	void *map = pipe_buffer_map(pscreen, mt->buffer,
-	                            pipe_transfer_buffer_flags(ptx));
-
-	if(!tx->direct)
-		return map + ns->base.offset;
-	else
-		return map + ns->base.offset + ptx->y * ns->pitch + ptx->x * util_format_get_blocksize(ptx->texture->format);
-}
-
-static void
-nv30_transfer_unmap(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv30_transfer *tx = (struct nv30_transfer *)ptx;
-	struct nv30_miptree *mt = (struct nv30_miptree *)tx->surface->texture;
-
-	pipe_buffer_unmap(pscreen, mt->buffer);
-}
-
-void
-nv30_screen_init_transfer_functions(struct pipe_screen *pscreen)
-{
-	pscreen->get_tex_transfer = nv30_transfer_new;
-	pscreen->tex_transfer_destroy = nv30_transfer_del;
-	pscreen->transfer_map = nv30_transfer_map;
-	pscreen->transfer_unmap = nv30_transfer_unmap;
-}
diff --git a/src/gallium/drivers/nv40/Makefile b/src/gallium/drivers/nv40/Makefile
index 0ecae2b..99a0104 100644
--- a/src/gallium/drivers/nv40/Makefile
+++ b/src/gallium/drivers/nv40/Makefile
@@ -9,7 +9,6 @@ C_SOURCES = \
 	nv40_draw.c \
 	nv40_fragprog.c \
 	nv40_fragtex.c \
-	nv40_miptree.c \
 	nv40_query.c \
 	nv40_screen.c \
 	nv40_state.c \
@@ -22,7 +21,6 @@ C_SOURCES = \
 	nv40_state_viewport.c \
 	nv40_state_zsa.c \
 	nv40_surface.c \
-	nv40_transfer.c \
 	nv40_vbo.c \
 	nv40_vertprog.c
 
diff --git a/src/gallium/drivers/nv40/nv40_context.h b/src/gallium/drivers/nv40/nv40_context.h
index 220cd27..ed0426d 100644
--- a/src/gallium/drivers/nv40/nv40_context.h
+++ b/src/gallium/drivers/nv40/nv40_context.h
@@ -148,7 +148,7 @@ struct nv40_context {
 	struct pipe_buffer *idxbuf;
 	unsigned idxbuf_format;
 	struct nv40_sampler_state *tex_sampler[PIPE_MAX_SAMPLERS];
-	struct nv40_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
+	struct nv04_miptree *tex_miptree[PIPE_MAX_SAMPLERS];
 	unsigned nr_samplers;
 	unsigned nr_textures;
 	unsigned dirty_samplers;
diff --git a/src/gallium/drivers/nv40/nv40_fragtex.c b/src/gallium/drivers/nv40/nv40_fragtex.c
index aad9198..e3eac23 100644
--- a/src/gallium/drivers/nv40/nv40_fragtex.c
+++ b/src/gallium/drivers/nv40/nv40_fragtex.c
@@ -62,9 +62,9 @@ static struct nouveau_stateobj *
 nv40_fragtex_build(struct nv40_context *nv40, int unit)
 {
 	struct nv40_sampler_state *ps = nv40->tex_sampler[unit];
-	struct nv40_miptree *nv40mt = nv40->tex_miptree[unit];
-	struct nouveau_bo *bo = nouveau_bo(nv40mt->buffer);
-	struct pipe_texture *pt = &nv40mt->base;
+	struct nv04_miptree *mt = nv40->tex_miptree[unit];
+	struct nouveau_bo *bo = mt->bo;
+	struct pipe_texture *pt = &mt->base;
 	struct nv40_texture_format *tf;
 	struct nouveau_stateobj *so;
 	uint32_t txf, txs, txp;
@@ -99,10 +99,10 @@ nv40_fragtex_build(struct nv40_context *nv40, int unit)
 		return NULL;
 	}
 
-	if (!(pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)) {
+	if(!mt->linear_pitch)
 		txp = 0;
-	} else {
-		txp  = nv40mt->level[0].pitch;
+	else {
+		txp  = mt->linear_pitch;
 		txf |= NV40TCL_TEX_FORMAT_LINEAR;
 	}
 
diff --git a/src/gallium/drivers/nv40/nv40_miptree.c b/src/gallium/drivers/nv40/nv40_miptree.c
deleted file mode 100644
index 89bd155..0000000
--- a/src/gallium/drivers/nv40/nv40_miptree.c
+++ /dev/null
@@ -1,235 +0,0 @@
-#include "pipe/p_state.h"
-#include "pipe/p_defines.h"
-#include "pipe/p_inlines.h"
-#include "util/u_format.h"
-#include "util/u_math.h"
-
-#include "nv40_context.h"
-#include "../nv04/nv04_surface_2d.h"
-
-
-
-static void
-nv40_miptree_layout(struct nv40_miptree *mt)
-{
-	struct pipe_texture *pt = &mt->base;
-	uint width = pt->width0;
-	uint offset = 0;
-	int nr_faces, l, f;
-	uint wide_pitch = pt->tex_usage & (PIPE_TEXTURE_USAGE_SAMPLER |
-		                           PIPE_TEXTURE_USAGE_DEPTH_STENCIL |
-		                           PIPE_TEXTURE_USAGE_RENDER_TARGET |
-		                           PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
-		                           PIPE_TEXTURE_USAGE_PRIMARY);
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		nr_faces = 6;
-	} else
-	if (pt->target == PIPE_TEXTURE_3D) {
-		nr_faces = pt->depth0;
-	} else {
-		nr_faces = 1;
-	}
-
-	for (l = 0; l <= pt->last_level; l++) {
-		if (wide_pitch && (pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR))
-			mt->level[l].pitch = align(util_format_get_stride(pt->format, pt->width0), 64);
-		else
-			mt->level[l].pitch = util_format_get_stride(pt->format, width);
-
-		mt->level[l].image_offset =
-			CALLOC(nr_faces, sizeof(unsigned));
-
-		width  = u_minify(width, 1);
-	}
-
-	for (f = 0; f < nr_faces; f++) {
-		for (l = 0; l < pt->last_level; l++) {
-			mt->level[l].image_offset[f] = offset;
-
-			if (!(pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR) &&
-			    u_minify(pt->width0, l + 1) > 1 && u_minify(pt->height0, l + 1) > 1)
-				offset += align(mt->level[l].pitch * u_minify(pt->height0, l), 64);
-			else
-				offset += mt->level[l].pitch * u_minify(pt->height0, l);
-		}
-
-		mt->level[l].image_offset[f] = offset;
-		offset += mt->level[l].pitch * u_minify(pt->height0, l);
-	}
-
-	mt->total_size = offset;
-}
-
-static struct pipe_texture *
-nv40_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
-{
-	struct nv40_miptree *mt;
-	unsigned buf_usage = PIPE_BUFFER_USAGE_PIXEL |
-	                     NOUVEAU_BUFFER_USAGE_TEXTURE;
-
-	mt = MALLOC(sizeof(struct nv40_miptree));
-	if (!mt)
-		return NULL;
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = pscreen;
-
-	/* Swizzled textures must be POT */
-	if (pt->width0 & (pt->width0 - 1) ||
-	    pt->height0 & (pt->height0 - 1))
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else
-	if (pt->tex_usage & (PIPE_TEXTURE_USAGE_PRIMARY |
-	                     PIPE_TEXTURE_USAGE_DISPLAY_TARGET |
-	                     PIPE_TEXTURE_USAGE_DEPTH_STENCIL))
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-	else {
-		switch (pt->format) {
-		/* TODO: Figure out which formats can be swizzled */
-		case PIPE_FORMAT_A8R8G8B8_UNORM:
-		case PIPE_FORMAT_X8R8G8B8_UNORM:
-		case PIPE_FORMAT_R16_SNORM:
-		{
-			if (debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE))
-				mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-			break;
-		}
-		default:
-			mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-		}
-	}
-
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
-		buf_usage |= PIPE_BUFFER_USAGE_CPU_READ_WRITE;
-
-	/* apparently we can't render to swizzled surfaces smaller than 64 bytes, so make them linear.
-	 * If the user did not ask for a render target, they can still render to it, but it will cost them an extra copy.
-	 * This also happens for small mipmaps of large textures. */
-	if (pt->tex_usage & PIPE_TEXTURE_USAGE_RENDER_TARGET && util_format_get_stride(pt->format, pt->width0) < 64)
-		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-
-	nv40_miptree_layout(mt);
-
-	mt->buffer = pscreen->buffer_create(pscreen, 256, buf_usage, mt->total_size);
-	if (!mt->buffer) {
-		FREE(mt);
-		return NULL;
-	}
-	mt->bo = nouveau_bo(mt->buffer);
-	return &mt->base;
-}
-
-static struct pipe_texture *
-nv40_miptree_blanket(struct pipe_screen *pscreen, const struct pipe_texture *pt,
-		     const unsigned *stride, struct pipe_buffer *pb)
-{
-	struct nv40_miptree *mt;
-
-	/* Only supports 2D, non-mipmapped textures for the moment */
-	if (pt->target != PIPE_TEXTURE_2D || pt->last_level != 0 ||
-	    pt->depth0 != 1)
-		return NULL;
-
-	mt = CALLOC_STRUCT(nv40_miptree);
-	if (!mt)
-		return NULL;
-
-	mt->base = *pt;
-	pipe_reference_init(&mt->base.reference, 1);
-	mt->base.screen = pscreen;
-	mt->level[0].pitch = stride[0];
-	mt->level[0].image_offset = CALLOC(1, sizeof(unsigned));
-
-	/* Assume whoever created this buffer expects it to be linear for now */
-	mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
-
-	pipe_buffer_reference(&mt->buffer, pb);
-	mt->bo = nouveau_bo(mt->buffer);
-	return &mt->base;
-}
-
-static void
-nv40_miptree_destroy(struct pipe_texture *pt)
-{
-	struct nv40_miptree *mt = (struct nv40_miptree *)pt;
-	int l;
-
-	pipe_buffer_reference(&mt->buffer, NULL);
-	for (l = 0; l <= pt->last_level; l++) {
-		if (mt->level[l].image_offset)
-			FREE(mt->level[l].image_offset);
-	}
-
-	FREE(mt);
-}
-
-static struct pipe_surface *
-nv40_miptree_surface_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
-			 unsigned face, unsigned level, unsigned zslice,
-			 unsigned flags)
-{
-	struct nv40_miptree *mt = (struct nv40_miptree *)pt;
-	struct nv04_surface *ns;
-
-	ns = CALLOC_STRUCT(nv04_surface);
-	if (!ns)
-		return NULL;
-	pipe_texture_reference(&ns->base.texture, pt);
-	ns->base.format = pt->format;
-	ns->base.width = u_minify(pt->width0, level);
-	ns->base.height = u_minify(pt->height0, level);
-	ns->base.usage = flags;
-	pipe_reference_init(&ns->base.reference, 1);
-	ns->base.face = face;
-	ns->base.level = level;
-	ns->base.zslice = zslice;
-	ns->pitch = mt->level[level].pitch;
-
-	if (pt->target == PIPE_TEXTURE_CUBE) {
-		ns->base.offset = mt->level[level].image_offset[face];
-	} else
-	if (pt->target == PIPE_TEXTURE_3D) {
-		ns->base.offset = mt->level[level].image_offset[zslice];
-	} else {
-		ns->base.offset = mt->level[level].image_offset[0];
-	}
-
-	/* create a linear temporary that we can render into if necessary.
-	 * Note that ns->pitch is always a multiple of 64 for linear surfaces and swizzled surfaces are POT, so
-	 * ns->pitch & 63 is equivalent to (ns->pitch < 64 && swizzled)*/
-	if((ns->pitch & 63) && (ns->base.usage & (PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER)) == PIPE_BUFFER_USAGE_GPU_WRITE)
-		return &nv04_surface_wrap_for_render(pscreen, ((struct nv40_screen*)pscreen)->eng2d, ns)->base;
-
-	return &ns->base;
-}
-
-static void
-nv40_miptree_surface_del(struct pipe_surface *ps)
-{
-	struct nv04_surface* ns = (struct nv04_surface*)ps;
-	if(ns->backing)
-	{
-		struct nv40_screen* screen = (struct nv40_screen*)ps->texture->screen;
-		if(ns->backing->base.usage & PIPE_BUFFER_USAGE_GPU_WRITE)
-			screen->eng2d->copy(screen->eng2d, &ns->backing->base, 0, 0, ps, 0, 0, ns->base.width, ns->base.height);
-		nv40_miptree_surface_del(&ns->backing->base);
-	}
-
-	pipe_texture_reference(&ps->texture, NULL);
-	FREE(ps);
-}
-
-void
-nv40_screen_init_miptree_functions(struct pipe_screen *pscreen)
-{
-	pscreen->texture_create = nv40_miptree_create;
-	pscreen->texture_blanket = nv40_miptree_blanket;
-	pscreen->texture_destroy = nv40_miptree_destroy;
-	pscreen->get_tex_surface = nv40_miptree_surface_new;
-	pscreen->tex_surface_destroy = nv40_miptree_surface_del;
-}
-
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index d57461c..2743135 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -128,14 +128,6 @@ nv40_screen_surface_format_supported(struct pipe_screen *pscreen,
 	return FALSE;
 }
 
-static struct pipe_buffer *
-nv40_surface_buffer(struct pipe_surface *surf)
-{
-	struct nv40_miptree *mt = (struct nv40_miptree *)surf->texture;
-
-	return mt->buffer;
-}
-
 static void
 nv40_screen_destroy(struct pipe_screen *pscreen)
 {
@@ -189,8 +181,8 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	pscreen->get_paramf = nv40_screen_get_paramf;
 	pscreen->is_format_supported = nv40_screen_surface_format_supported;
 
-	nv40_screen_init_miptree_functions(pscreen);
-	nv40_screen_init_transfer_functions(pscreen);
+	nv04_screen_init_miptree_functions(pscreen);
+	nv04_screen_init_transfer_functions(pscreen);
 
 	/* 3D object */
 	switch (dev->chipset & 0xf0) {
@@ -220,7 +212,6 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 
 	/* 2D engine setup */
 	screen->eng2d = nv04_surface_2d_init(&screen->base);
-	screen->eng2d->buf = nv40_surface_buffer;
 
 	/* Notifier for sync purposes */
 	ret = nouveau_notifier_alloc(chan, 0xbeef0301, 1, &screen->sync);
diff --git a/src/gallium/drivers/nv40/nv40_state.h b/src/gallium/drivers/nv40/nv40_state.h
index 192074e..bda9a45 100644
--- a/src/gallium/drivers/nv40/nv40_state.h
+++ b/src/gallium/drivers/nv40/nv40_state.h
@@ -73,17 +73,4 @@ struct nv40_fragment_program {
 	struct nouveau_stateobj *so;
 };
 
-struct nv40_miptree {
-	struct pipe_texture base;
-	struct nouveau_bo *bo;
-
-	struct pipe_buffer *buffer;
-	uint total_size;
-
-	struct {
-		uint pitch;
-		uint *image_offset;
-	} level[PIPE_MAX_TEXTURE_LEVELS];
-};
-
 #endif
diff --git a/src/gallium/drivers/nv40/nv40_state_fb.c b/src/gallium/drivers/nv40/nv40_state_fb.c
index a58fe9d..f1bbe7a 100644
--- a/src/gallium/drivers/nv40/nv40_state_fb.c
+++ b/src/gallium/drivers/nv40/nv40_state_fb.c
@@ -1,15 +1,13 @@
 #include "nv40_context.h"
 #include "nouveau/nouveau_util.h"
 
-static struct pipe_buffer *
-nv40_do_surface_buffer(struct pipe_surface *surface)
+static struct nouveau_bo*
+nv40_surface_buffer(struct pipe_surface *surface)
 {
-	struct nv40_miptree *mt = (struct nv40_miptree *)surface->texture;
-	return mt->buffer;
+	struct nv04_miptree *mt = (struct nv04_miptree *)surface->texture;
+	return mt->bo;
 }
 
-#define nv40_surface_buffer(ps) nouveau_bo(nv40_do_surface_buffer(ps))
-
 static boolean
 nv40_state_framebuffer_validate(struct nv40_context *nv40)
 {
diff --git a/src/gallium/drivers/nv40/nv40_transfer.c b/src/gallium/drivers/nv40/nv40_transfer.c
deleted file mode 100644
index 791ee68..0000000
--- a/src/gallium/drivers/nv40/nv40_transfer.c
+++ /dev/null
@@ -1,178 +0,0 @@
-#include <pipe/p_state.h>
-#include <pipe/p_defines.h>
-#include <pipe/p_inlines.h>
-#include <util/u_format.h>
-#include <util/u_memory.h>
-#include <util/u_math.h>
-#include <nouveau/nouveau_winsys.h>
-#include "nv40_context.h"
-#include "nv40_screen.h"
-#include "nv40_state.h"
-
-struct nv40_transfer {
-	struct pipe_transfer base;
-	struct pipe_surface *surface;
-	boolean direct;
-};
-
-static void
-nv40_compatible_transfer_tex(struct pipe_texture *pt, unsigned width, unsigned height,
-                             struct pipe_texture *template)
-{
-	memset(template, 0, sizeof(struct pipe_texture));
-	template->target = pt->target;
-	template->format = pt->format;
-	template->width0 = width;
-	template->height0 = height;
-	template->depth0 = 1;
-	template->last_level = 0;
-	template->nr_samples = pt->nr_samples;
-
-	template->tex_usage = PIPE_TEXTURE_USAGE_DYNAMIC |
-	                      NOUVEAU_TEXTURE_USAGE_LINEAR;
-}
-
-static struct pipe_transfer *
-nv40_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
-		  unsigned face, unsigned level, unsigned zslice,
-		  enum pipe_transfer_usage usage,
-		  unsigned x, unsigned y, unsigned w, unsigned h)
-{
-	struct nv40_miptree *mt = (struct nv40_miptree *)pt;
-	struct nv40_transfer *tx;
-	struct pipe_texture tx_tex_template, *tx_tex;
-
-	tx = CALLOC_STRUCT(nv40_transfer);
-	if (!tx)
-		return NULL;
-
-	pipe_texture_reference(&tx->base.texture, pt);
-	tx->base.x = x;
-	tx->base.y = y;
-	tx->base.width = w;
-	tx->base.height = h;
-	tx->base.stride = mt->level[level].pitch;
-	tx->base.usage = usage;
-	tx->base.face = face;
-	tx->base.level = level;
-	tx->base.zslice = zslice;
-
-	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
-	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
-	{
-		tx->direct = true;
-		tx->surface = pscreen->get_tex_surface(pscreen, pt,
-	                                               face, level, zslice,
-	                                               pipe_transfer_buffer_flags(&tx->base));
-		return &tx->base;
-	}
-
-	tx->direct = false;
-
-	nv40_compatible_transfer_tex(pt, w, h, &tx_tex_template);
-
-	tx_tex = pscreen->texture_create(pscreen, &tx_tex_template);
-	if (!tx_tex)
-	{
-		FREE(tx);
-		return NULL;
-	}
-
-	tx->base.stride = ((struct nv40_miptree*)tx_tex)->level[0].pitch;
-
-	tx->surface = pscreen->get_tex_surface(pscreen, tx_tex,
-	                                       0, 0, 0,
-	                                       pipe_transfer_buffer_flags(&tx->base));
-
-	pipe_texture_reference(&tx_tex, NULL);
-
-	if (!tx->surface)
-	{
-		pipe_surface_reference(&tx->surface, NULL);
-		FREE(tx);
-		return NULL;
-	}
-
-	if (usage & PIPE_TRANSFER_READ) {
-		struct nv40_screen *nvscreen = nv40_screen(pscreen);
-		struct pipe_surface *src;
-
-		src = pscreen->get_tex_surface(pscreen, pt,
-	                                       face, level, zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_READ);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		/* TODO: Check if SIFM can un-swizzle */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      tx->surface, 0, 0,
-		                      src, x, y,
-		                      w, h);
-
-		pipe_surface_reference(&src, NULL);
-	}
-
-	return &tx->base;
-}
-
-static void
-nv40_transfer_del(struct pipe_transfer *ptx)
-{
-	struct nv40_transfer *tx = (struct nv40_transfer *)ptx;
-
-	if (!tx->direct && (ptx->usage & PIPE_TRANSFER_WRITE)) {
-		struct pipe_screen *pscreen = ptx->texture->screen;
-		struct nv40_screen *nvscreen = nv40_screen(pscreen);
-		struct pipe_surface *dst;
-
-		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
-	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER);
-
-		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
-		nvscreen->eng2d->copy(nvscreen->eng2d,
-		                      dst, tx->base.x, tx->base.y,
-		                      tx->surface, 0, 0,
-		                      tx->base.width, tx->base.height);
-
-		pipe_surface_reference(&dst, NULL);
-	}
-
-	pipe_surface_reference(&tx->surface, NULL);
-	pipe_texture_reference(&ptx->texture, NULL);
-	FREE(ptx);
-}
-
-static void *
-nv40_transfer_map(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv40_transfer *tx = (struct nv40_transfer *)ptx;
-	struct nv04_surface *ns = (struct nv04_surface *)tx->surface;
-	struct nv40_miptree *mt = (struct nv40_miptree *)tx->surface->texture;
-	void *map = pipe_buffer_map(pscreen, mt->buffer,
-	                            pipe_transfer_buffer_flags(ptx));
-
-	if(!tx->direct)
-		return map + ns->base.offset;
-	else
-		return map + ns->base.offset + ptx->y * ns->pitch + ptx->x * util_format_get_blocksize(ptx->texture->format);
-}
-
-static void
-nv40_transfer_unmap(struct pipe_screen *pscreen, struct pipe_transfer *ptx)
-{
-	struct nv40_transfer *tx = (struct nv40_transfer *)ptx;
-	struct nv40_miptree *mt = (struct nv40_miptree *)tx->surface->texture;
-
-	pipe_buffer_unmap(pscreen, mt->buffer);
-}
-
-void
-nv40_screen_init_transfer_functions(struct pipe_screen *pscreen)
-{
-	pscreen->get_tex_transfer = nv40_transfer_new;
-	pscreen->tex_transfer_destroy = nv40_transfer_del;
-	pscreen->transfer_map = nv40_transfer_map;
-	pscreen->transfer_unmap = nv40_transfer_unmap;
-}
-- 
1.6.3.3
