From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] nv50: remove vtxbuf stateobject after a
	referenced vtxbuf is mapped
Date: Wed, 30 Dec 2009 22:37:46 +0100
Message-ID: <6d4bc9fc0912301337n1994c554k66f2dd8fc09d392a@mail.gmail.com>
References: <1262209002-10778-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262209002-10778-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Same patch from before, without the debatable unmap change.

On Wed, Dec 30, 2009 at 10:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> - This avoids problematic "reloc'ed while mapped" messages and
> some associated corruption as well.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0src/gallium/drivers/nouveau/nouveau_screen.c =A0 | =A0 21 ++++++++++++=
+++++++++
> =A0src/gallium/drivers/nouveau/nouveau_screen.h =A0 | =A0 =A03 +++
> =A0src/gallium/drivers/nouveau/nouveau_stateobj.h | =A0 13 +++++++++++++
> =A0src/gallium/drivers/nv50/nv50_screen.c =A0 =A0 =A0 =A0 | =A0 23 ++++++=
+++++++++++++++++
> =A0src/gallium/drivers/nv50/nv50_screen.h =A0 =A0 =A0 =A0 | =A0 =A02 ++
> =A0src/gallium/drivers/nv50/nv50_state_validate.c | =A0 =A03 +++
> =A06 files changed, 65 insertions(+), 0 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/d=
rivers/nouveau/nouveau_screen.c
> index 0437af3..7ebc94e 100644
> --- a/src/gallium/drivers/nouveau/nouveau_screen.c
> +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
> @@ -127,8 +127,18 @@ nouveau_screen_bo_map(struct pipe_screen *pscreen, s=
truct pipe_buffer *pb,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned usage)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_bo *bo =3D nouveau_bo(pb);
> + =A0 =A0 =A0 struct nouveau_screen *nscreen =3D nouveau_screen(pscreen);
> =A0 =A0 =A0 =A0int ret;
>
> + =A0 =A0 =A0 if (nscreen->pre_pipebuffer_map_callback) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D nscreen->pre_pipebuffer_map_callbac=
k(pscreen, pb, usage);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("pre_pipebuffe=
r_map_callback failed %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0ret =3D nouveau_bo_map(bo, nouveau_screen_map_flags(usage)=
);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debug_printf("map failed: %d\n", ret);
> @@ -143,11 +153,22 @@ nouveau_screen_bo_map_range(struct pipe_screen *psc=
reen, struct pipe_buffer *pb,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned offset, u=
nsigned length, unsigned usage)
> =A0{
> =A0 =A0 =A0 =A0struct nouveau_bo *bo =3D nouveau_bo(pb);
> + =A0 =A0 =A0 struct nouveau_screen *nscreen =3D nouveau_screen(pscreen);
> =A0 =A0 =A0 =A0uint32_t flags =3D nouveau_screen_map_flags(usage);
> =A0 =A0 =A0 =A0int ret;
>
> + =A0 =A0 =A0 if (nscreen->pre_pipebuffer_map_callback) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D nscreen->pre_pipebuffer_map_callbac=
k(pscreen, pb, usage);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("pre_pipebuffe=
r_map_callback failed %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0ret =3D nouveau_bo_map_range(bo, offset, length, flags);
> =A0 =A0 =A0 =A0if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_bo_unmap(bo);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(flags & NOUVEAU_BO_NOWAIT) || ret !=
=3D -EBUSY)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debug_printf("map_range fa=
iled: %d\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/d=
rivers/nouveau/nouveau_screen.h
> index ebfc67a..a7927d8 100644
> --- a/src/gallium/drivers/nouveau/nouveau_screen.h
> +++ b/src/gallium/drivers/nouveau/nouveau_screen.h
> @@ -5,6 +5,9 @@ struct nouveau_screen {
> =A0 =A0 =A0 =A0struct pipe_screen base;
> =A0 =A0 =A0 =A0struct nouveau_device *device;
> =A0 =A0 =A0 =A0struct nouveau_channel *channel;
> +
> + =A0 =A0 =A0 int (*pre_pipebuffer_map_callback) (struct pipe_screen *psc=
reen,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pipe_buffer *pb, unsigned usage);
> =A0};
>
> =A0static inline struct nouveau_screen *
> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium=
/drivers/nouveau/nouveau_stateobj.h
> index 9aee9e4..b8c83db 100644
> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
> @@ -98,6 +98,19 @@ so_reloc(struct nouveau_stateobj *so, struct nouveau_b=
o *bo,
> =A0 =A0 =A0 =A0so_data(so, data);
> =A0}
>
> +/* Determine if this buffer object is referenced by this state object. */
> +static INLINE bool
> +so_bo_is_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo)
> +{
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < so->cur_reloc; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (so->reloc[i].bo =3D=3D bo)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return true;
> +
> + =A0 =A0 =A0 return false;
> +}
> +
> =A0static INLINE void
> =A0so_dump(struct nouveau_stateobj *so)
> =A0{
> diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers=
/nv50/nv50_screen.c
> index 7e039ea..1778a74 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nv50/nv50_screen.c
> @@ -189,6 +189,28 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
> =A0 =A0 =A0 =A0FREE(screen);
> =A0}
>
> +static int
> +nv50_pre_pipebuffer_map(struct pipe_screen *pscreen, struct pipe_buffer =
*pb,
> + =A0 =A0 =A0 unsigned usage)
> +{
> + =A0 =A0 =A0 struct nv50_screen *screen =3D nv50_screen(pscreen);
> + =A0 =A0 =A0 struct nv50_context *ctx =3D screen->cur_ctx;
> +
> + =A0 =A0 =A0 if (!(pb->usage & PIPE_BUFFER_USAGE_VERTEX))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 /* Our vtxbuf got mapped, it can no longer be considered pa=
rt of current
> + =A0 =A0 =A0 =A0* state, remove it to avoid emitting reloc markers.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (ctx && ctx->state.vtxbuf && so_bo_is_reloc(ctx->state.v=
txbuf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_bo(pb))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so_ref(NULL, &ctx->state.vtxbuf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctx->dirty |=3D NV50_NEW_ARRAYS;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0struct pipe_screen *
> =A0nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
> =A0{
> @@ -216,6 +238,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nou=
veau_device *dev)
> =A0 =A0 =A0 =A0pscreen->get_param =3D nv50_screen_get_param;
> =A0 =A0 =A0 =A0pscreen->get_paramf =3D nv50_screen_get_paramf;
> =A0 =A0 =A0 =A0pscreen->is_format_supported =3D nv50_screen_is_format_sup=
ported;
> + =A0 =A0 =A0 screen->base.pre_pipebuffer_map_callback =3D nv50_pre_pipeb=
uffer_map;
>
> =A0 =A0 =A0 =A0nv50_screen_init_miptree_functions(pscreen);
> =A0 =A0 =A0 =A0nv50_transfer_init_screen_functions(pscreen);
> diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers=
/nv50/nv50_screen.h
> index 61e24a5..a038a4e 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.h
> +++ b/src/gallium/drivers/nv50/nv50_screen.h
> @@ -2,6 +2,7 @@
> =A0#define __NV50_SCREEN_H__
>
> =A0#include "nouveau/nouveau_screen.h"
> +#include "nv50_context.h"
>
> =A0struct nv50_screen {
> =A0 =A0 =A0 =A0struct nouveau_screen base;
> @@ -9,6 +10,7 @@ struct nv50_screen {
> =A0 =A0 =A0 =A0struct nouveau_winsys *nvws;
>
> =A0 =A0 =A0 =A0unsigned cur_pctx;
> + =A0 =A0 =A0 struct nv50_context *cur_ctx;
>
> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla;
> =A0 =A0 =A0 =A0struct nouveau_grobj *eng2d;
> diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium=
/drivers/nv50/nv50_state_validate.c
> index c8bdf9d..6827863 100644
> --- a/src/gallium/drivers/nv50/nv50_state_validate.c
> +++ b/src/gallium/drivers/nv50/nv50_state_validate.c
> @@ -185,6 +185,9 @@ nv50_state_emit(struct nv50_context *nv50)
> =A0 =A0 =A0 =A0struct nv50_screen *screen =3D nv50->screen;
> =A0 =A0 =A0 =A0struct nouveau_channel *chan =3D screen->base.channel;
>
> + =A0 =A0 =A0 /* I don't want to copy headers from the winsys. */
> + =A0 =A0 =A0 screen->cur_ctx =3D nv50;
> +
> =A0 =A0 =A0 =A0if (nv50->pctx_id !=3D screen->cur_pctx) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nv50->state.fb)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50->state.dirty |=3D NV5=
0_NEW_FRAMEBUFFER;
> --
> 1.6.6.rc4
>
>
