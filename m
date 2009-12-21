From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv50: remove vtxbuf stateobject after a
	referenced vtxbuf is mapped
Date: Mon, 21 Dec 2009 14:48:54 +0100
Message-ID: <6d4bc9fc0912210548v24ce667exd2d8343b774641a6@mail.gmail.com>
References: <1261323978-5330-1-git-send-email-madman2003@gmail.com>
	<4B2F4D04.1000101@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2F4D04.1000101-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 21, 2009 at 11:25 AM, Christoph Bumiller
<e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
> On 12/20/2009 04:46 PM, Maarten Maathuis wrote:
>> - This avoids problematic "reloc'ed while mapped" messages and
>> some associated corruption as well.
>> - Also add one nouveau_bo_unmap() in the vbo code that wasn't present.
> I didn't think nouveau_bo_unmap was necessary if the map failed.
> As far as I can see, map will be NULL, and unmap will do nothing.
> I don't know what our API doc says about that though ...
> But the DDX seems to not unmap after failure.
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0src/gallium/drivers/nouveau/nouveau_screen.c =A0 | =A0 21 +++++++++++=
++++++++++
>> =A0src/gallium/drivers/nouveau/nouveau_screen.h =A0 | =A0 =A03 +++
>> =A0src/gallium/drivers/nouveau/nouveau_stateobj.h | =A0 13 +++++++++++++
>> =A0src/gallium/drivers/nv50/nv50_screen.c =A0 =A0 =A0 =A0 | =A0 23 +++++=
++++++++++++++++++
>> =A0src/gallium/drivers/nv50/nv50_screen.h =A0 =A0 =A0 =A0 | =A0 =A02 ++
>> =A0src/gallium/drivers/nv50/nv50_state_validate.c | =A0 =A02 ++
>> =A0src/gallium/drivers/nv50/nv50_vbo.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04=
 +++-
>> =A07 files changed, 67 insertions(+), 1 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/=
drivers/nouveau/nouveau_screen.c
>> index e4cf91c..c85057a 100644
>> --- a/src/gallium/drivers/nouveau/nouveau_screen.c
>> +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
>> @@ -127,8 +127,18 @@ nouveau_screen_bo_map(struct pipe_screen *pscreen, =
struct pipe_buffer *pb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned usage)
> ...
>> +static int
>> +nv50_pre_pipebuffer_map(struct pipe_screen *pscreen, struct pipe_buffer=
 *pb,
>> + =A0 =A0 unsigned usage)
>> +{
>> + =A0 =A0 struct nv50_screen *screen =3D nv50_screen(pscreen);
>> + =A0 =A0 struct nv50_context *ctx =3D screen->cur_ctx;
>> +
>> + =A0 =A0 if (!(pb->usage & PIPE_BUFFER_USAGE_VERTEX))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +
>> + =A0 =A0 /* Our vtxbuf got mapped, it can no longer be considered part =
of current
>> + =A0 =A0 =A0* state, remove it to avoid emitting reloc markers.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if (ctx && ctx->state.vtxbuf && so_bo_is_reloc(ctx->state.vtxb=
uf,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_bo(pb))) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 so_ref(NULL, &ctx->state.vtxbuf);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ctx->state.dirty |=3D NV50_NEW_ARRAYS;
> Hm ... I know I suggested it but I'm not completely sure it works now.
> ctx->state.dirty will be checked in nv50_state_emit as far as I
> can see, and then state stateobj better not be NULL.
> (at least if I do this regardless of so_bo_is_reloc, I get a segfault)
>
> Since we're operating on the current context here, we should probably
> set ctx->(no state.)dirty which is used in nv50_state_validate (no
> segfault on emit then).
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> =A0struct pipe_screen *
>> =A0nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
>> =A0{
>> @@ -201,6 +223,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct no=
uveau_device *dev)
>> =A0 =A0 =A0 pscreen->get_param =3D nv50_screen_get_param;
>> =A0 =A0 =A0 pscreen->get_paramf =3D nv50_screen_get_paramf;
>> =A0 =A0 =A0 pscreen->is_format_supported =3D nv50_screen_is_format_suppo=
rted;
>> + =A0 =A0 screen->base.pre_pipebuffer_map_callback =3D nv50_pre_pipebuff=
er_map;
>>
>> =A0 =A0 =A0 nv50_screen_init_miptree_functions(pscreen);
>> =A0 =A0 =A0 nv50_transfer_init_screen_functions(pscreen);
>> diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/driver=
s/nv50/nv50_screen.h
>> index 61e24a5..a038a4e 100644
>> --- a/src/gallium/drivers/nv50/nv50_screen.h
>> +++ b/src/gallium/drivers/nv50/nv50_screen.h
>> @@ -2,6 +2,7 @@
>> =A0#define __NV50_SCREEN_H__
>>
>> =A0#include "nouveau/nouveau_screen.h"
>> +#include "nv50_context.h"
>>
>> =A0struct nv50_screen {
>> =A0 =A0 =A0 struct nouveau_screen base;
>> @@ -9,6 +10,7 @@ struct nv50_screen {
>> =A0 =A0 =A0 struct nouveau_winsys *nvws;
>>
>> =A0 =A0 =A0 unsigned cur_pctx;
>> + =A0 =A0 struct nv50_context *cur_ctx;
>>
> Using struct pipe_context **nouveau_winsys::pcxt would work too ...

Is this a C++ feature?

>
>> =A0 =A0 =A0 struct nouveau_grobj *tesla;
>> =A0 =A0 =A0 struct nouveau_grobj *eng2d;
>> diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/galliu=
m/drivers/nv50/nv50_state_validate.c
>> index 871e809..8cf4ff4 100644
>> --- a/src/gallium/drivers/nv50/nv50_state_validate.c
>> +++ b/src/gallium/drivers/nv50/nv50_state_validate.c
>> @@ -185,6 +185,8 @@ nv50_state_emit(struct nv50_context *nv50)
>> =A0 =A0 =A0 struct nv50_screen *screen =3D nv50->screen;
>> =A0 =A0 =A0 struct nouveau_channel *chan =3D screen->base.channel;
>>
>> + =A0 =A0 screen->cur_ctx =3D nv50;
>> +
>> =A0 =A0 =A0 if (nv50->pctx_id !=3D screen->cur_pctx) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nv50->state.fb)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50->state.dirty |=3D NV50_=
NEW_FRAMEBUFFER;
>> diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/n=
v50/nv50_vbo.c
>> index db54380..ce6e4eb 100644
>> --- a/src/gallium/drivers/nv50/nv50_vbo.c
>> +++ b/src/gallium/drivers/nv50/nv50_vbo.c
>> @@ -325,8 +325,10 @@ nv50_vbo_static_attrib(struct nv50_context *nv50, u=
nsigned attrib,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return FALSE;
>>
>> =A0 =A0 =A0 ret =3D nouveau_bo_map(bo, NOUVEAU_BO_RD);
>> - =A0 =A0 if (ret)
>> + =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 nouveau_bo_unmap(bo);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return FALSE;
>> + =A0 =A0 }
>> =A0 =A0 =A0 v =3D (float *)(bo->map + (vb->buffer_offset + ve->src_offse=
t));
>>
>> =A0 =A0 =A0 so =3D *pso;
>
>
