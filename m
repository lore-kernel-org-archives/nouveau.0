From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [MESA PATCH] Fix nv40_miptree_layout pitch
Date: Sat, 26 Dec 2009 07:22:10 +0100
Message-ID: <ff13bc9a0912252222t7ed30b00q3b5081a8ee6586c4@mail.gmail.com>
References: <ff13bc9a0912251659v27b69ea5he53c912cf86939b7@mail.gmail.com>
	<586c2acd0912251833x1665b258ica2a55ccfff629f6@mail.gmail.com>
	<ff13bc9a0912251937i3c32e044kc84f0c70ff1e9547@mail.gmail.com>
	<586c2acd0912252032t69dc63cej51472ecacc17d05f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0912252032t69dc63cej51472ecacc17d05f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I just coded a patch that does this and seems to work fine. It must be
fixed since it breaks OpenGL (or the state tracker can be changed, but
it seems better to do it in the driver).

The patch also fixes NV20 and NV30 in the same way. They compile but
are untested.

I would guess that using the 3D engine is faster for the larger
levels, but the 2D engine is faster for the smaller ones (and lacks
this issue).

diff --git a/src/gallium/drivers/nouveau/nouveau_winsys.h
b/src/gallium/drivers/nouveau/nouveau_winsys.h
index 42c77e5..4c3e08a 100644
--- a/src/gallium/drivers/nouveau/nouveau_winsys.h
+++ b/src/gallium/drivers/nouveau/nouveau_winsys.h
@@ -23,6 +23,9 @@
 #define NOUVEAU_BUFFER_USAGE_ZETA     (1 << 17)
 #define NOUVEAU_BUFFER_USAGE_TRANSFER (1 << 18)

+/* use along GPU_WRITE for 2D-only writes */
+#define NOUVEAU_BUFFER_USAGE_NO_RENDER (1 << 19)
+
 extern struct pipe_screen *
 nv04_screen_create(struct pipe_winsys *ws, struct nouveau_device *);

diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.c
b/src/gallium/drivers/nv04/nv04_surface_2d.c
index 12df7fd..16e8379 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.c
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.c
@@ -491,3 +501,49 @@ nv04_surface_2d_init(struct nouveau_screen *screen)
 	ctx->fill = nv04_surface_fill;
 	return ctx;
 }
+
+struct nv04_surface*
+nv04_surface_wrap_for_render(struct pipe_screen *pscreen, struct
nv04_surface_2d* eng2d, struct nv04_surface* ns)
+{
+	int temp_flags;
+
+	// printf("creating temp, flags is %i!\n", flags);
+
+	if(ns->base.usage & PIPE_BUFFER_USAGE_DISCARD)
+	{
+		temp_flags = ns->base.usage | PIPE_BUFFER_USAGE_GPU_READ;
+		ns->base.usage = PIPE_BUFFER_USAGE_GPU_WRITE |
NOUVEAU_BUFFER_USAGE_NO_RENDER | PIPE_BUFFER_USAGE_DISCARD;
+	}
+	else
+	{
+		temp_flags = ns->base.usage | PIPE_BUFFER_USAGE_GPU_READ |
PIPE_BUFFER_USAGE_GPU_WRITE;
+		ns->base.usage = PIPE_BUFFER_USAGE_GPU_WRITE |
NOUVEAU_BUFFER_USAGE_NO_RENDER | PIPE_BUFFER_USAGE_GPU_READ;
+	}
+
+	struct nv40_screen* screen = (struct nv40_screen*)pscreen;
+	ns->base.usage = PIPE_BUFFER_USAGE_GPU_READ | PIPE_BUFFER_USAGE_GPU_WRITE;
+
+	struct pipe_texture templ;
+	memset(&templ, 0, sizeof(templ));
+	templ.format = ns->base.texture->format;
+	templ.target = PIPE_TEXTURE_2D;
+	templ.width0 = ns->base.width;
+	templ.height0 = ns->base.height;
+	templ.depth0 = 1;
+	templ.last_level = 0;
+
+	// TODO: this is probably wrong and we should specifically handle
multisampling somehow once it is implemented
+	templ.nr_samples = ns->base.texture->nr_samples;
+
+	templ.tex_usage = ns->base.texture->tex_usage |
PIPE_TEXTURE_USAGE_RENDER_TARGET;
+
+	struct pipe_texture* temp_tex = pscreen->texture_create(pscreen, &templ);
+	struct nv04_surface* temp_ns = (struct
nv04_surface*)pscreen->get_tex_surface(pscreen, temp_tex, 0, 0, 0,
temp_flags);
+	temp_ns->backing = ns;
+
+	if(ns->base.usage & PIPE_BUFFER_USAGE_GPU_READ)
+		eng2d->copy(eng2d, &temp_ns->backing->base, 0, 0, &ns->base, 0, 0,
ns->base.width, ns->base.height);
+
+	return temp_ns;
+}
+
diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.h
b/src/gallium/drivers/nv04/nv04_surface_2d.h
index 02b3f56..ce696a1 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.h
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.h
@@ -4,6 +4,7 @@
 struct nv04_surface {
 	struct pipe_surface base;
 	unsigned pitch;
+	struct nv04_surface* backing;
 };

 struct nv04_surface_2d {
@@ -30,4 +31,7 @@ nv04_surface_2d_init(struct nouveau_screen *screen);
 void
 nv04_surface_2d_takedown(struct nv04_surface_2d **);

+struct nv04_surface*
+nv04_surface_wrap_for_render(struct pipe_screen *pscreen, struct
nv04_surface_2d* eng2d, struct nv04_surface* ns);
+
 #endif
diff --git a/src/gallium/drivers/nv20/nv20_miptree.c
b/src/gallium/drivers/nv20/nv20_miptree.c
index d1291a9..8f7538e 100644
--- a/src/gallium/drivers/nv20/nv20_miptree.c
+++ b/src/gallium/drivers/nv20/nv20_miptree.c
@@ -6,6 +6,7 @@

 #include "nv20_context.h"
 #include "nv20_screen.h"
+#include "../nv04/nv04_surface_2d.h"

 static void
 nv20_miptree_layout(struct nv20_miptree *nv20mt)
@@ -127,6 +128,12 @@ nv20_miptree_create(struct pipe_screen *screen,
const struct pipe_texture *pt)
 	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
 		buf_usage |= PIPE_BUFFER_USAGE_CPU_READ_WRITE;

+	/* apparently we can't render to swizzled surfaces smaller than 64
bytes, so make them linear.
+	 * If the user did not ask for a render target, they can still
render to it, but it will cost them an extra copy.
+	 * This also happens for small mipmaps of large textures. */
+	if (pt->tex_usage & PIPE_TEXTURE_USAGE_RENDER_TARGET &&
util_format_get_stride(pt->format, pt->width0) < 64)
+		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
+
 	nv20_miptree_layout(mt);

 	mt->buffer = screen->buffer_create(screen, 256, buf_usage, mt->total_size);
@@ -183,12 +190,27 @@ nv20_miptree_surface_get(struct pipe_screen
*screen, struct pipe_texture *pt,
 		ns->base.offset = nv20mt->level[level].image_offset[0];
 	}

+	/* create a linear temporary that we can render into if necessary.
+	 * Note that ns->pitch is always a multiple of 64 for linear
surfaces and swizzled surfaces are POT, so
+	 * ns->pitch & 63 is equivalent to (ns->pitch < 64 && swizzled)*/
+	if((ns->pitch & 63) && (ns->base.usage &
(PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER)) ==
PIPE_BUFFER_USAGE_GPU_WRITE)
+		return &nv04_surface_wrap_for_render(screen, ((struct
nv20_screen*)screen)->eng2d, ns)->base;
+
 	return &ns->base;
 }

 static void
 nv20_miptree_surface_destroy(struct pipe_surface *ps)
 {
+	struct nv04_surface* ns = (struct nv04_surface*)ps;
+	if(ns->backing)
+	{
+		struct nv20_screen* screen = (struct nv20_screen*)ps->texture->screen;
+		if(ns->backing->base.usage & PIPE_BUFFER_USAGE_GPU_WRITE)
+			screen->eng2d->copy(screen->eng2d, &ns->backing->base, 0, 0, ps,
0, 0, ns->base.width, ns->base.height);
+		nv20_miptree_surface_destroy(&ns->backing->base);
+	}
+	
 	pipe_texture_reference(&ps->texture, NULL);
 	FREE(ps);
 }
diff --git a/src/gallium/drivers/nv20/nv20_transfer.c
b/src/gallium/drivers/nv20/nv20_transfer.c
index 69b79c8..7b51188 100644
--- a/src/gallium/drivers/nv20/nv20_transfer.c
+++ b/src/gallium/drivers/nv20/nv20_transfer.c
@@ -126,7 +126,7 @@ nv20_transfer_del(struct pipe_transfer *ptx)

 		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
 	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE);
+	                                       PIPE_BUFFER_USAGE_GPU_WRITE |
NOUVEAU_BUFFER_USAGE_NO_RENDER);

 		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
 		nvscreen->eng2d->copy(nvscreen->eng2d,
diff --git a/src/gallium/drivers/nv30/nv30_miptree.c
b/src/gallium/drivers/nv30/nv30_miptree.c
index ce95d97..8fbba38 100644
--- a/src/gallium/drivers/nv30/nv30_miptree.c
+++ b/src/gallium/drivers/nv30/nv30_miptree.c
@@ -5,6 +5,7 @@
 #include "util/u_math.h"

 #include "nv30_context.h"
+#include "../nv04/nv04_surface_2d.h"

 static void
 nv30_miptree_layout(struct nv30_miptree *nv30mt)
@@ -108,6 +109,12 @@ nv30_miptree_create(struct pipe_screen *pscreen,
const struct pipe_texture *pt)
 	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
 		buf_usage |= PIPE_BUFFER_USAGE_CPU_READ_WRITE;

+	/* apparently we can't render to swizzled surfaces smaller than 64
bytes, so make them linear.
+	 * If the user did not ask for a render target, they can still
render to it, but it will cost them an extra copy.
+	 * This also happens for small mipmaps of large textures. */
+	if (pt->tex_usage & PIPE_TEXTURE_USAGE_RENDER_TARGET &&
util_format_get_stride(pt->format, pt->width0) < 64)
+		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
+
 	nv30_miptree_layout(mt);

 	mt->buffer = pscreen->buffer_create(pscreen, 256, buf_usage,
@@ -196,12 +203,27 @@ nv30_miptree_surface_new(struct pipe_screen
*pscreen, struct pipe_texture *pt,
 		ns->base.offset = nv30mt->level[level].image_offset[0];
 	}

+	/* create a linear temporary that we can render into if necessary.
+	 * Note that ns->pitch is always a multiple of 64 for linear
surfaces and swizzled surfaces are POT, so
+	 * ns->pitch & 63 is equivalent to (ns->pitch < 64 && swizzled)*/
+	if((ns->pitch & 63) && (ns->base.usage &
(PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER)) ==
PIPE_BUFFER_USAGE_GPU_WRITE)
+		return &nv04_surface_wrap_for_render(pscreen, ((struct
nv30_screen*)pscreen)->eng2d, ns)->base;
+
 	return &ns->base;
 }

 static void
 nv30_miptree_surface_del(struct pipe_surface *ps)
 {
+	struct nv04_surface* ns = (struct nv04_surface*)ps;
+	if(ns->backing)
+	{
+		struct nv30_screen* screen = (struct nv30_screen*)ps->texture->screen;
+		if(ns->backing->base.usage & PIPE_BUFFER_USAGE_GPU_WRITE)
+			screen->eng2d->copy(screen->eng2d, &ns->backing->base, 0, 0, ps,
0, 0, ns->base.width, ns->base.height);
+		nv30_miptree_surface_del(&ns->backing->base);
+	}
+
 	pipe_texture_reference(&ps->texture, NULL);
 	FREE(ps);
 }
diff --git a/src/gallium/drivers/nv30/nv30_transfer.c
b/src/gallium/drivers/nv30/nv30_transfer.c
index 2255a02..68047c4 100644
--- a/src/gallium/drivers/nv30/nv30_transfer.c
+++ b/src/gallium/drivers/nv30/nv30_transfer.c
@@ -126,7 +126,7 @@ nv30_transfer_del(struct pipe_transfer *ptx)

 		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
 	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE);
+	                                       PIPE_BUFFER_USAGE_GPU_WRITE |
NOUVEAU_BUFFER_USAGE_NO_RENDER);

 		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
 		nvscreen->eng2d->copy(nvscreen->eng2d,
diff --git a/src/gallium/drivers/nv40/nv40_miptree.c
b/src/gallium/drivers/nv40/nv40_miptree.c
index b5a193e..89bd155 100644
--- a/src/gallium/drivers/nv40/nv40_miptree.c
+++ b/src/gallium/drivers/nv40/nv40_miptree.c
@@ -5,6 +5,7 @@
 #include "util/u_math.h"

 #include "nv40_context.h"
+#include "../nv04/nv04_surface_2d.h"



@@ -108,6 +106,12 @@ nv40_miptree_create(struct pipe_screen *pscreen,
const struct pipe_texture *pt)
 	if (pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC)
 		buf_usage |= PIPE_BUFFER_USAGE_CPU_READ_WRITE;

+	/* apparently we can't render to swizzled surfaces smaller than 64
bytes, so make them linear.
+	 * If the user did not ask for a render target, they can still
render to it, but it will cost them an extra copy.
+	 * This also happens for small mipmaps of large textures. */
+	if (pt->tex_usage & PIPE_TEXTURE_USAGE_RENDER_TARGET &&
util_format_get_stride(pt->format, pt->width0) < 64)
+		mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
+
 	nv40_miptree_layout(mt);

 	mt->buffer = pscreen->buffer_create(pscreen, 256, buf_usage, mt->total_size);
@@ -194,12 +198,27 @@ nv40_miptree_surface_new(struct pipe_screen
*pscreen, struct pipe_texture *pt,
 		ns->base.offset = mt->level[level].image_offset[0];
 	}

+	/* create a linear temporary that we can render into if necessary.
+	 * Note that ns->pitch is always a multiple of 64 for linear
surfaces and swizzled surfaces are POT, so
+	 * ns->pitch & 63 is equivalent to (ns->pitch < 64 && swizzled)*/
+	if((ns->pitch & 63) && (ns->base.usage &
(PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_RENDER)) ==
PIPE_BUFFER_USAGE_GPU_WRITE)
+		return &nv04_surface_wrap_for_render(pscreen, ((struct
nv40_screen*)pscreen)->eng2d, ns)->base;
+
 	return &ns->base;
 }

 static void
 nv40_miptree_surface_del(struct pipe_surface *ps)
 {
+	struct nv04_surface* ns = (struct nv04_surface*)ps;
+	if(ns->backing)
+	{
+		struct nv40_screen* screen = (struct nv40_screen*)ps->texture->screen;
+		if(ns->backing->base.usage & PIPE_BUFFER_USAGE_GPU_WRITE)
+			screen->eng2d->copy(screen->eng2d, &ns->backing->base, 0, 0, ps,
0, 0, ns->base.width, ns->base.height);
+		nv40_miptree_surface_del(&ns->backing->base);
+	}
+
 	pipe_texture_reference(&ps->texture, NULL);
 	FREE(ps);
 }
diff --git a/src/gallium/drivers/nv40/nv40_transfer.c
b/src/gallium/drivers/nv40/nv40_transfer.c
index b084a38..adfd035 100644
--- a/src/gallium/drivers/nv40/nv40_transfer.c
+++ b/src/gallium/drivers/nv40/nv40_transfer.c
@@ -126,7 +126,7 @@ nv40_transfer_del(struct pipe_transfer *ptx)

 		dst = pscreen->get_tex_surface(pscreen, ptx->texture,
 	                                       ptx->face, ptx->level, ptx->zslice,
-	                                       PIPE_BUFFER_USAGE_GPU_WRITE);
+	                                       PIPE_BUFFER_USAGE_GPU_WRITE |
NOUVEAU_BUFFER_USAGE_NO_RENDER);

 		/* TODO: Check if SIFM can deal with x,y,w,h when swizzling */
 		nvscreen->eng2d->copy(nvscreen->eng2d,
