From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv40: remove leftover nv40_transfer.c from
	unification into nvfx
Date: Mon, 15 Mar 2010 10:15:12 -0400
Message-ID: <586c2acd1003150715y3017c1bn1645ed6e5a5541a0@mail.gmail.com>
References: <1268660141-4869-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1268660141-4869-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 15, 2010 at 9:35 AM, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> wro=
te:
> ---
> =A0src/gallium/drivers/nv40/nv40_transfer.c | =A0181 --------------------=
----------
> =A01 files changed, 0 insertions(+), 181 deletions(-)
> =A0delete mode 100644 src/gallium/drivers/nv40/nv40_transfer.c
>
> diff --git a/src/gallium/drivers/nv40/nv40_transfer.c b/src/gallium/drive=
rs/nv40/nv40_transfer.c
> deleted file mode 100644
> index 3d8c8e8..0000000
> --- a/src/gallium/drivers/nv40/nv40_transfer.c
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -#include "pipe/p_state.h"
> -#include "pipe/p_defines.h"
> -#include "util/u_inlines.h"
> -#include "util/u_format.h"
> -#include "util/u_memory.h"
> -#include "util/u_math.h"
> -#include "nouveau/nouveau_winsys.h"
> -#include "nv40_context.h"
> -#include "nvfx_screen.h"
> -#include "nvfx_state.h"
> -
> -struct nv40_transfer {
> - =A0 =A0 =A0 struct pipe_transfer base;
> - =A0 =A0 =A0 struct pipe_surface *surface;
> - =A0 =A0 =A0 boolean direct;
> -};
> -
> -static void
> -nv40_compatible_transfer_tex(struct pipe_texture *pt, unsigned width, un=
signed height,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pipe_tex=
ture *template)
> -{
> - =A0 =A0 =A0 memset(template, 0, sizeof(struct pipe_texture));
> - =A0 =A0 =A0 template->target =3D pt->target;
> - =A0 =A0 =A0 template->format =3D pt->format;
> - =A0 =A0 =A0 template->width0 =3D width;
> - =A0 =A0 =A0 template->height0 =3D height;
> - =A0 =A0 =A0 template->depth0 =3D 1;
> - =A0 =A0 =A0 template->last_level =3D 0;
> - =A0 =A0 =A0 template->nr_samples =3D pt->nr_samples;
> -
> - =A0 =A0 =A0 template->tex_usage =3D PIPE_TEXTURE_USAGE_DYNAMIC |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_TEXTURE=
_USAGE_LINEAR;
> -}
> -
> -static struct pipe_transfer *
> -nv40_transfer_new(struct pipe_context *pcontext, struct pipe_texture *pt,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned face, unsigned level, unsigned=
 zslice,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum pipe_transfer_usage usage,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned x, unsigned y, unsigned w, uns=
igned h)
> -{
> - =A0 =A0 =A0 =A0struct pipe_screen *pscreen =3D pcontext->screen;
> - =A0 =A0 =A0 struct nvfx_miptree *mt =3D (struct nvfx_miptree *)pt;
> - =A0 =A0 =A0 struct nv40_transfer *tx;
> - =A0 =A0 =A0 struct pipe_texture tx_tex_template, *tx_tex;
> -
> - =A0 =A0 =A0 tx =3D CALLOC_STRUCT(nv40_transfer);
> - =A0 =A0 =A0 if (!tx)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> -
> - =A0 =A0 =A0 pipe_texture_reference(&tx->base.texture, pt);
> - =A0 =A0 =A0 tx->base.x =3D x;
> - =A0 =A0 =A0 tx->base.y =3D y;
> - =A0 =A0 =A0 tx->base.width =3D w;
> - =A0 =A0 =A0 tx->base.height =3D h;
> - =A0 =A0 =A0 tx->base.stride =3D mt->level[level].pitch;
> - =A0 =A0 =A0 tx->base.usage =3D usage;
> - =A0 =A0 =A0 tx->base.face =3D face;
> - =A0 =A0 =A0 tx->base.level =3D level;
> - =A0 =A0 =A0 tx->base.zslice =3D zslice;
> -
> - =A0 =A0 =A0 /* Direct access to texture */
> - =A0 =A0 =A0 if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
> - =A0 =A0 =A0 =A0 =A0 =A0debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRU=
E/*XXX:FALSE*/)) &&
> - =A0 =A0 =A0 =A0 =A0 pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx->direct =3D true;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx->surface =3D pscreen->get_tex_surface(ps=
creen, pt,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0face, level, zslice,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pipe_transfer_buffer_flags(&tx->base));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return &tx->base;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 tx->direct =3D false;
> -
> - =A0 =A0 =A0 nv40_compatible_transfer_tex(pt, w, h, &tx_tex_template);
> -
> - =A0 =A0 =A0 tx_tex =3D pscreen->texture_create(pscreen, &tx_tex_templat=
e);
> - =A0 =A0 =A0 if (!tx_tex)
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(tx);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 tx->base.stride =3D ((struct nvfx_miptree*)tx_tex)->level[0=
].pitch;
> -
> - =A0 =A0 =A0 tx->surface =3D pscreen->get_tex_surface(pscreen, tx_tex,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A00, 0, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0pipe_transfer_buffer_flags(&tx->base));
> -
> - =A0 =A0 =A0 pipe_texture_reference(&tx_tex, NULL);
> -
> - =A0 =A0 =A0 if (!tx->surface)
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pipe_surface_reference(&tx->surface, NULL);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(tx);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (usage & PIPE_TRANSFER_READ) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nvfx_screen *nvscreen =3D nvfx_scree=
n(pscreen);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pipe_surface *src;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 src =3D pscreen->get_tex_surface(pscreen, p=
t,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0face, level, zslice,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0PIPE_BUFFER_USAGE_GPU_READ);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* TODO: Check if SIFM can deal with x,y,w,=
h when swizzling */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* TODO: Check if SIFM can un-swizzle */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvscreen->eng2d->copy(nvscreen->eng2d,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 tx->surface, 0, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 src, x, y,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 w, h);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pipe_surface_reference(&src, NULL);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return &tx->base;
> -}
> -
> -static void
> -nv40_transfer_del(struct pipe_context *pcontext, struct pipe_transfer *p=
tx)
> -{
> - =A0 =A0 =A0 struct nv40_transfer *tx =3D (struct nv40_transfer *)ptx;
> -
> - =A0 =A0 =A0 if (!tx->direct && (ptx->usage & PIPE_TRANSFER_WRITE)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pipe_screen *pscreen =3D pcontext->s=
creen;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nvfx_screen *nvscreen =3D nvfx_scree=
n(pscreen);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pipe_surface *dst;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst =3D pscreen->get_tex_surface(pscreen, p=
tx->texture,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0ptx->face, ptx->level, ptx->zslice,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0PIPE_BUFFER_USAGE_GPU_WRITE | NOUVEAU_BUFFER_USAGE_NO_R=
ENDER);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* TODO: Check if SIFM can deal with x,y,w,=
h when swizzling */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvscreen->eng2d->copy(nvscreen->eng2d,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 dst, tx->base.x, tx->base.y,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 tx->surface, 0, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 tx->base.width, tx->base.height);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pipe_surface_reference(&dst, NULL);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 pipe_surface_reference(&tx->surface, NULL);
> - =A0 =A0 =A0 pipe_texture_reference(&ptx->texture, NULL);
> - =A0 =A0 =A0 FREE(ptx);
> -}
> -
> -static void *
> -nv40_transfer_map(struct pipe_context *pcontext, struct pipe_transfer *p=
tx)
> -{
> - =A0 =A0 =A0 =A0struct pipe_screen *pscreen =3D pcontext->screen;
> - =A0 =A0 =A0 struct nv40_transfer *tx =3D (struct nv40_transfer *)ptx;
> - =A0 =A0 =A0 struct nv04_surface *ns =3D (struct nv04_surface *)tx->surf=
ace;
> - =A0 =A0 =A0 struct nvfx_miptree *mt =3D (struct nvfx_miptree *)tx->surf=
ace->texture;
> - =A0 =A0 =A0 void *map =3D pipe_buffer_map(pscreen, mt->buffer,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pip=
e_transfer_buffer_flags(ptx));
> -
> - =A0 =A0 =A0 if(!tx->direct)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return map + ns->base.offset;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return map + ns->base.offset + ptx->y * ns-=
>pitch + ptx->x * util_format_get_blocksize(ptx->texture->format);
> -}
> -
> -static void
> -nv40_transfer_unmap(struct pipe_context *pcontext, struct pipe_transfer =
*ptx)
> -{
> - =A0 =A0 =A0 =A0struct pipe_screen *pscreen =3D pcontext->screen;
> - =A0 =A0 =A0 struct nv40_transfer *tx =3D (struct nv40_transfer *)ptx;
> - =A0 =A0 =A0 struct nvfx_miptree *mt =3D (struct nvfx_miptree *)tx->surf=
ace->texture;
> -
> - =A0 =A0 =A0 pipe_buffer_unmap(pscreen, mt->buffer);
> -}
> -
> -void
> -nv40_init_transfer_functions(struct nvfx_context *nvfx)
> -{
> - =A0 =A0 =A0 nvfx->pipe.get_tex_transfer =3D nv40_transfer_new;
> - =A0 =A0 =A0 nvfx->pipe.tex_transfer_destroy =3D nv40_transfer_del;
> - =A0 =A0 =A0 nvfx->pipe.transfer_map =3D nv40_transfer_map;
> - =A0 =A0 =A0 nvfx->pipe.transfer_unmap =3D nv40_transfer_unmap;
> -}
> --
> 1.6.3.3
>
>

Pushed. Thanks.
