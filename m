From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs (attempt
	4)
Date: Sun, 13 Dec 2009 01:33:57 +0100
Message-ID: <6d4bc9fc0912121633n54abe4c3ncdc8a4cef400fa5a@mail.gmail.com>
References: <1260046520-2376-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260046520-2376-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sat, Dec 5, 2009 at 9:55 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> - Added flush notify functions for NV30 and NV40.
> - NV30 and NV40 need testing.
> ---
> =A0src/gallium/drivers/nouveau/nouveau_stateobj.h | =A0 42 ++++++++++++++=
++++------
> =A0src/gallium/drivers/nv04/nv04_surface_2d.c =A0 =A0 | =A0 =A09 +++--
> =A0src/gallium/drivers/nv30/nv30_context.c =A0 =A0 =A0 =A0| =A0 =A03 ++
> =A0src/gallium/drivers/nv30/nv30_context.h =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0src/gallium/drivers/nv30/nv30_state_emit.c =A0 =A0 | =A0 10 +++++-
> =A0src/gallium/drivers/nv40/nv40_context.c =A0 =A0 =A0 =A0| =A0 =A03 ++
> =A0src/gallium/drivers/nv40/nv40_context.h =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0src/gallium/drivers/nv40/nv40_state_emit.c =A0 =A0 | =A0 10 +++++-
> =A0src/gallium/drivers/nv50/nv50_query.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0src/gallium/drivers/nv50/nv50_surface.c =A0 =A0 =A0 =A0| =A0 =A02 +
> =A0src/gallium/drivers/nv50/nv50_transfer.c =A0 =A0 =A0 | =A0 =A04 +-
> =A011 files changed, 69 insertions(+), 18 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium=
/drivers/nouveau/nouveau_stateobj.h
> index b595405..67b6c94 100644
> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
> @@ -111,19 +111,28 @@ so_emit(struct nouveau_channel *chan, struct nouvea=
u_stateobj *so)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_pushbuf *pb =3D chan->pushbuf;
> =A0 =A0 =A0 =A0unsigned nr, i;
> + =A0 =A0 =A0 int ret =3D 0;
>
> =A0 =A0 =A0 =A0nr =3D so->cur - so->push;
> - =A0 =A0 =A0 if (pb->remaining < nr)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_flush(chan, nr);
> + =A0 =A0 =A0 /* This will flush if we need space.
> + =A0 =A0 =A0 =A0* We don't actually need the marker.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_marker_emit(chan, nr, so->cur_=
reloc))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit failed marker emit wi=
th error %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0pb->remaining -=3D nr;
>
> =A0 =A0 =A0 =A0memcpy(pb->cur, so->push, nr * 4);
> =A0 =A0 =A0 =A0for (i =3D 0; i < so->cur_reloc; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_stateobj_reloc *r =3D &so->=
reloc[i];
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_emit_reloc(chan, pb->cur + =
r->offset,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(cha=
n, pb->cur + r->offset,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 r->bo, r->data, 0, r->flags,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0r->vor, r->tor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0r->vor, r->tor))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit faile=
d reloc with error %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0pb->cur +=3D nr;
> =A0}
> @@ -133,26 +142,39 @@ so_emit_reloc_markers(struct nouveau_channel *chan,=
 struct nouveau_stateobj *so)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_pushbuf *pb =3D chan->pushbuf;
> =A0 =A0 =A0 =A0unsigned i;
> + =A0 =A0 =A0 int ret =3D 0;
>
> =A0 =A0 =A0 =A0if (!so)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> =A0 =A0 =A0 =A0i =3D so->cur_reloc << 1;
> - =A0 =A0 =A0 if (pb->remaining < i)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_flush(chan, i);
> + =A0 =A0 =A0 /* This will flush if we need space.
> + =A0 =A0 =A0 =A0* We don't actually need the marker.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_marker_emit(chan, i, i))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit_reloc_markers failed =
marker emit with \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 error %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0pb->remaining -=3D i;
>
> =A0 =A0 =A0 =A0for (i =3D 0; i < so->cur_reloc; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_stateobj_reloc *r =3D &so->=
reloc[i];
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_emit_reloc(chan, pb->cur++,=
 r->bo, r->packet, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(cha=
n, pb->cur++, r->bo, r->packet, 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (r->flags & (NOUVEAU_BO_VRAM |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_GART |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_RDWR)) |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0NOUVEAU_BO_DUMMY, 0, 0);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_emit_reloc(chan, pb->cur++,=
 r->bo, r->data, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0NOUVEAU_BO_DUMMY, 0, 0))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit_reloc=
_markers failed reloc \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 with error %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(cha=
n, pb->cur++, r->bo, r->data, 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 r->flags | NOUVEAU_BO_DUMMY,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0r->vor, r->tor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0r->vor, r->tor))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit_reloc=
_markers failed reloc \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 with error %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}
> =A0}
>
> diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.c b/src/gallium/dri=
vers/nv04/nv04_surface_2d.c
> index 932893e..3020806 100644
> --- a/src/gallium/drivers/nv04/nv04_surface_2d.c
> +++ b/src/gallium/drivers/nv04/nv04_surface_2d.c
> @@ -133,6 +133,9 @@ nv04_surface_copy_swizzle(struct nv04_surface_2d *ctx,
> =A0 =A0 =A0 =A0assert(sub_w =3D=3D w || util_is_pot(sub_w));
> =A0 =A0 =A0 =A0assert(sub_h =3D=3D h || util_is_pot(sub_h));
>
> + =A0 =A0 =A0 MARK_RING (chan, 8 + ((w+sub_w)/sub_w)*((h+sub_h)/sub_h)*17=
, 2 +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((w+sub_w)/sub_w)*((h+su=
b_h)/sub_h)*2);
> +
> =A0 =A0 =A0 =A0BEGIN_RING(chan, swzsurf, NV04_SWIZZLED_SURFACE_DMA_IMAGE,=
 1);
> =A0 =A0 =A0 =A0OUT_RELOCo(chan, dst_bo,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_GART | NOUVEAU=
_BO_VRAM | NOUVEAU_BO_WR);
> @@ -202,7 +205,7 @@ nv04_surface_copy_m2mf(struct nv04_surface_2d *ctx,
> =A0 =A0 =A0 =A0unsigned src_offset =3D src->offset + sy * src_pitch +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sx * pf_get_bl=
ocksize(src->texture->format);
>
> - =A0 =A0 =A0 WAIT_RING (chan, 3 + ((h / 2047) + 1) * 9);
> + =A0 =A0 =A0 MARK_RING (chan, 3 + ((h / 2047) + 1) * 9, 2 + ((h / 2047) =
+ 1) * 2);
> =A0 =A0 =A0 =A0BEGIN_RING(chan, m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_DMA_BU=
FFER_IN, 2);
> =A0 =A0 =A0 =A0OUT_RELOCo(chan, src_bo,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_GART | NOUVEAU_BO_VRAM | N=
OUVEAU_BO_RD);
> @@ -250,7 +253,7 @@ nv04_surface_copy_blit(struct nv04_surface_2d *ctx, s=
truct pipe_surface *dst,
> =A0 =A0 =A0 =A0if (format < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
>
> - =A0 =A0 =A0 WAIT_RING (chan, 12);
> + =A0 =A0 =A0 MARK_RING (chan, 12, 4);
> =A0 =A0 =A0 =A0BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAG=
E_SOURCE, 2);
> =A0 =A0 =A0 =A0OUT_RELOCo(chan, src_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
> =A0 =A0 =A0 =A0OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> @@ -315,7 +318,7 @@ nv04_surface_fill(struct nv04_surface_2d *ctx, struct=
 pipe_surface *dst,
> =A0 =A0 =A0 =A0gdirect_format =3D nv04_rect_format(dst->format);
> =A0 =A0 =A0 =A0assert(gdirect_format >=3D 0);
>
> - =A0 =A0 =A0 WAIT_RING (chan, 16);
> + =A0 =A0 =A0 MARK_RING (chan, 16, 4);
> =A0 =A0 =A0 =A0BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAG=
E_SOURCE, 2);
> =A0 =A0 =A0 =A0OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> =A0 =A0 =A0 =A0OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> diff --git a/src/gallium/drivers/nv30/nv30_context.c b/src/gallium/driver=
s/nv30/nv30_context.c
> index d8300fd..46a821a 100644
> --- a/src/gallium/drivers/nv30/nv30_context.c
> +++ b/src/gallium/drivers/nv30/nv30_context.c
> @@ -58,6 +58,9 @@ nv30_create(struct pipe_screen *pscreen, unsigned pctx_=
id)
> =A0 =A0 =A0 =A0nv30->pipe.is_texture_referenced =3D nouveau_is_texture_re=
ferenced;
> =A0 =A0 =A0 =A0nv30->pipe.is_buffer_referenced =3D nouveau_is_buffer_refe=
renced;
>
> + =A0 =A0 =A0 screen->base.channel->user_private =3D nv30;
> + =A0 =A0 =A0 screen->base.channel->flush_notify =3D nv30_state_flush_not=
ify;
> +
> =A0 =A0 =A0 =A0nv30_init_query_functions(nv30);
> =A0 =A0 =A0 =A0nv30_init_surface_functions(nv30);
> =A0 =A0 =A0 =A0nv30_init_state_functions(nv30);
> diff --git a/src/gallium/drivers/nv30/nv30_context.h b/src/gallium/driver=
s/nv30/nv30_context.h
> index 8d49366..6f44b1c 100644
> --- a/src/gallium/drivers/nv30/nv30_context.h
> +++ b/src/gallium/drivers/nv30/nv30_context.h
> @@ -184,6 +184,7 @@ extern void nv30_fragtex_bind(struct nv30_context *);
> =A0/* nv30_state.c and friends */
> =A0extern boolean nv30_state_validate(struct nv30_context *nv30);
> =A0extern void nv30_state_emit(struct nv30_context *nv30);
> +extern void nv30_state_flush_notify(struct nouveau_channel *chan);
> =A0extern struct nv30_state_entry nv30_state_rasterizer;
> =A0extern struct nv30_state_entry nv30_state_scissor;
> =A0extern struct nv30_state_entry nv30_state_stipple;
> diff --git a/src/gallium/drivers/nv30/nv30_state_emit.c b/src/gallium/dri=
vers/nv30/nv30_state_emit.c
> index 621b884..d2e5312 100644
> --- a/src/gallium/drivers/nv30/nv30_state_emit.c
> +++ b/src/gallium/drivers/nv30/nv30_state_emit.c
> @@ -41,7 +41,7 @@ nv30_state_emit(struct nv30_context *nv30)
> =A0 =A0 =A0 =A0struct nouveau_channel *chan =3D nv30->screen->base.channe=
l;
> =A0 =A0 =A0 =A0struct nv30_state *state =3D &nv30->state;
> =A0 =A0 =A0 =A0struct nv30_screen *screen =3D nv30->screen;
> - =A0 =A0 =A0 unsigned i, samplers;
> + =A0 =A0 =A0 unsigned i;
> =A0 =A0 =A0 =A0uint64_t states;
>
> =A0 =A0 =A0 =A0if (nv30->pctx_id !=3D screen->cur_pctx) {
> @@ -63,6 +63,14 @@ nv30_state_emit(struct nv30_context *nv30)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0state->dirty =3D 0;
> +}
> +
> +void
> +nv30_state_flush_notify(struct nouveau_channel *chan)
> +{
> + =A0 =A0 =A0 struct nv30_context *nv30 =3D chan->user_private;
> + =A0 =A0 =A0 struct nv30_state *state =3D &nv30->state;
> + =A0 =A0 =A0 unsigned i, samplers;
>
> =A0 =A0 =A0 =A0so_emit_reloc_markers(chan, state->hw[NV30_STATE_FB]);
> =A0 =A0 =A0 =A0for (i =3D 0, samplers =3D state->fp_samplers; i < 16 && s=
amplers; i++) {
> diff --git a/src/gallium/drivers/nv40/nv40_context.c b/src/gallium/driver=
s/nv40/nv40_context.c
> index 7f00827..eb9cce4 100644
> --- a/src/gallium/drivers/nv40/nv40_context.c
> +++ b/src/gallium/drivers/nv40/nv40_context.c
> @@ -58,6 +58,9 @@ nv40_create(struct pipe_screen *pscreen, unsigned pctx_=
id)
> =A0 =A0 =A0 =A0nv40->pipe.is_texture_referenced =3D nouveau_is_texture_re=
ferenced;
> =A0 =A0 =A0 =A0nv40->pipe.is_buffer_referenced =3D nouveau_is_buffer_refe=
renced;
>
> + =A0 =A0 =A0 screen->base.channel->user_private =3D nv40;
> + =A0 =A0 =A0 screen->base.channel->flush_notify =3D nv40_state_flush_not=
ify;
> +
> =A0 =A0 =A0 =A0nv40_init_query_functions(nv40);
> =A0 =A0 =A0 =A0nv40_init_surface_functions(nv40);
> =A0 =A0 =A0 =A0nv40_init_state_functions(nv40);
> diff --git a/src/gallium/drivers/nv40/nv40_context.h b/src/gallium/driver=
s/nv40/nv40_context.h
> index a3d5941..cf33b64 100644
> --- a/src/gallium/drivers/nv40/nv40_context.h
> +++ b/src/gallium/drivers/nv40/nv40_context.h
> @@ -204,6 +204,7 @@ extern void nv40_fragtex_bind(struct nv40_context *);
> =A0extern boolean nv40_state_validate(struct nv40_context *nv40);
> =A0extern boolean nv40_state_validate_swtnl(struct nv40_context *nv40);
> =A0extern void nv40_state_emit(struct nv40_context *nv40);
> +extern void nv40_state_flush_notify(struct nouveau_channel *chan);
> =A0extern struct nv40_state_entry nv40_state_rasterizer;
> =A0extern struct nv40_state_entry nv40_state_scissor;
> =A0extern struct nv40_state_entry nv40_state_stipple;
> diff --git a/src/gallium/drivers/nv40/nv40_state_emit.c b/src/gallium/dri=
vers/nv40/nv40_state_emit.c
> index 1986929..ba0fbcb 100644
> --- a/src/gallium/drivers/nv40/nv40_state_emit.c
> +++ b/src/gallium/drivers/nv40/nv40_state_emit.c
> @@ -57,7 +57,7 @@ nv40_state_emit(struct nv40_context *nv40)
> =A0 =A0 =A0 =A0struct nouveau_channel *chan =3D nv40->screen->base.channe=
l;
> =A0 =A0 =A0 =A0struct nv40_state *state =3D &nv40->state;
> =A0 =A0 =A0 =A0struct nv40_screen *screen =3D nv40->screen;
> - =A0 =A0 =A0 unsigned i, samplers;
> + =A0 =A0 =A0 unsigned i;
> =A0 =A0 =A0 =A0uint64_t states;
>
> =A0 =A0 =A0 =A0if (nv40->pctx_id !=3D screen->cur_pctx) {
> @@ -87,6 +87,14 @@ nv40_state_emit(struct nv40_context *nv40)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0state->dirty =3D 0;
> +}
> +
> +void
> +nv40_state_flush_notify(struct nouveau_channel *chan)
> +{
> + =A0 =A0 =A0 struct nv40_context *nv40 =3D chan->user_private;
> + =A0 =A0 =A0 struct nv40_state *state =3D &nv40->state;
> + =A0 =A0 =A0 unsigned i, samplers;
>
> =A0 =A0 =A0 =A0so_emit_reloc_markers(chan, state->hw[NV40_STATE_FB]);
> =A0 =A0 =A0 =A0for (i =3D 0, samplers =3D state->fp_samplers; i < 16 && s=
amplers; i++) {
> diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/=
nv50/nv50_query.c
> index 5305c93..268c982 100644
> --- a/src/gallium/drivers/nv50/nv50_query.c
> +++ b/src/gallium/drivers/nv50/nv50_query.c
> @@ -93,7 +93,7 @@ nv50_query_end(struct pipe_context *pipe, struct pipe_q=
uery *pq)
> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50->screen->tesla;
> =A0 =A0 =A0 =A0struct nv50_query *q =3D nv50_query(pq);
>
> - =A0 =A0 =A0 WAIT_RING (chan, 5);
> + =A0 =A0 =A0 MARK_RING (chan, 5, 2); /* flush on lack of space or relocs=
 */
> =A0 =A0 =A0 =A0BEGIN_RING(chan, tesla, NV50TCL_QUERY_ADDRESS_HIGH, 4);
> =A0 =A0 =A0 =A0OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR=
);
> =A0 =A0 =A0 =A0OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR=
);
> diff --git a/src/gallium/drivers/nv50/nv50_surface.c b/src/gallium/driver=
s/nv50/nv50_surface.c
> index 6bf6f77..79655fc 100644
> --- a/src/gallium/drivers/nv50/nv50_surface.c
> +++ b/src/gallium/drivers/nv50/nv50_surface.c
> @@ -62,6 +62,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pip=
e_surface *ps, int dst)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
>
> =A0 =A0 =A0 =A0if (!bo->tile_flags) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_RING (chan, 9, 2); /* flush on lack of=
 space or relocs */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BEGIN_RING(chan, eng2d, mthd, 2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RING =A0(chan, format);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RING =A0(chan, 1);
> @@ -72,6 +73,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pip=
e_surface *ps, int dst)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RELOCh(chan, bo, ps->offset, flags);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RELOCl(chan, bo, ps->offset, flags);
> =A0 =A0 =A0 =A0} else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_RING (chan, 11, 2); /* flush on lack o=
f space or relocs */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BEGIN_RING(chan, eng2d, mthd, 5);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RING =A0(chan, format);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RING =A0(chan, 0);
> diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drive=
rs/nv50/nv50_transfer.c
> index 4705f96..1b6c8d6 100644
> --- a/src/gallium/drivers/nv50/nv50_transfer.c
> +++ b/src/gallium/drivers/nv50/nv50_transfer.c
> @@ -81,7 +81,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
> =A0 =A0 =A0 =A0while (height) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int line_count =3D height > 2047 ? 2047 : =
height;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 WAIT_RING (chan, 15);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_RING (chan, 15, 4); /* flush on lack o=
f space or relocs */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BEGIN_RING(chan, m2mf,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV50_MEMORY_TO_MEMORY_FORM=
AT_OFFSET_IN_HIGH, 2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RELOCh(chan, src_bo, src_offset, src_r=
eloc);
> @@ -282,7 +282,7 @@ nv50_upload_sifc(struct nv50_context *nv50,
>
> =A0 =A0 =A0 =A0reloc |=3D NOUVEAU_BO_WR;
>
> - =A0 =A0 =A0 WAIT_RING (chan, 32);
> + =A0 =A0 =A0 MARK_RING (chan, 32, 2); /* flush on lack of space or reloc=
s */
>
> =A0 =A0 =A0 =A0if (bo->tile_flags) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BEGIN_RING(chan, eng2d, NV50_2D_DST_FORMAT=
, 5);
> --
> 1.6.5.3
>
>

Can someone on NV30 and NV40 test this patch?
