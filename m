From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] nouveau: rewrite nouveau_stateobj to use
	BEGIN_RING properly
Date: Tue, 5 Jan 2010 00:04:11 +0100
Message-ID: <91752841001041504m7a9e0145s91fd0b72ff2cbff4@mail.gmail.com>
References: <1262209002-10778-1-git-send-email-madman2003@gmail.com>
	<1262209002-10778-2-git-send-email-madman2003@gmail.com>
	<1262209002-10778-3-git-send-email-madman2003@gmail.com>
	<6d4bc9fc0912301339l6e639d46oef3bab28dad70e15@mail.gmail.com>
	<6d4bc9fc0912301443g7721311anbe7ea2dbe6156eac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0912301443g7721311anbe7ea2dbe6156eac-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Looks good on nv35 and nv84.
On nv35 I measured perf on xmoto and tremulous. xmoto is as good as
before, tremulous as bad as before :)
On nv84 I did not benchmark, but if there is a regression, at least I
cannot feel it while playing.

On Wed, Dec 30, 2009 at 11:43 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> If anyone experiences a sustained performance loss of more than 1%,
> then i'm curious how much it is, if it can be reproduced with
> something free, even better :-)
>
> On Wed, Dec 30, 2009 at 10:39 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>> The prerequisite patch (which kills nouveau_push) got stuck in queue
>> because of it's size.
>>
>> This patch is here for discussion, and it needs testing on nv30/nv40
>> for miscalculated so sizes.
>>
>> On Wed, Dec 30, 2009 at 10:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>> - The previous solution was hacky and didn't do subchannel autobinding.
>>> - The beheaviour should match what libdrm_nouveau does closely.
>>> - There appears to be a minor performance loss, probably due to having =
multiple
>>> memcpy's instead of one.
>>> - The solution remains statically sized, but when debugging is on it wi=
ll check
>>> for abuse.
>>> - The values for nv30/nv40 may be off, but this should be easily caught=
 with
>>> DEBUG on.
>>>
>>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>> =A0src/gallium/drivers/nouveau/nouveau_stateobj.h | =A0289 ++++++++++++=
+++++-------
>>> =A0src/gallium/drivers/nv04/nv04_screen.c =A0 =A0 =A0 =A0 | =A0 =A02 -
>>> =A0src/gallium/drivers/nv10/nv10_screen.c =A0 =A0 =A0 =A0 | =A0 =A01 -
>>> =A0src/gallium/drivers/nv20/nv20_screen.c =A0 =A0 =A0 =A0 | =A0 =A01 -
>>> =A0src/gallium/drivers/nv30/nv30_fragprog.c =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv30/nv30_fragtex.c =A0 =A0 =A0 =A0| =A0 =A04 +-
>>> =A0src/gallium/drivers/nv30/nv30_screen.c =A0 =A0 =A0 =A0 | =A0 =A03 +-
>>> =A0src/gallium/drivers/nv30/nv30_state.c =A0 =A0 =A0 =A0 =A0| =A0 =A06 =
+-
>>> =A0src/gallium/drivers/nv30/nv30_state_blend.c =A0 =A0| =A0 =A02 +-
>>> =A0src/gallium/drivers/nv30/nv30_state_fb.c =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv30/nv30_state_scissor.c =A0| =A0 =A02 +-
>>> =A0src/gallium/drivers/nv30/nv30_state_stipple.c =A0| =A0 =A04 +-
>>> =A0src/gallium/drivers/nv30/nv30_state_viewport.c | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv30/nv30_vbo.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 +-
>>> =A0src/gallium/drivers/nv30/nv30_vertprog.c =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv40/nv40_fragprog.c =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv40/nv40_fragtex.c =A0 =A0 =A0 =A0| =A0 =A04 +-
>>> =A0src/gallium/drivers/nv40/nv40_screen.c =A0 =A0 =A0 =A0 | =A0 =A03 +-
>>> =A0src/gallium/drivers/nv40/nv40_state.c =A0 =A0 =A0 =A0 =A0| =A0 =A06 =
+-
>>> =A0src/gallium/drivers/nv40/nv40_state_blend.c =A0 =A0| =A0 =A02 +-
>>> =A0src/gallium/drivers/nv40/nv40_state_fb.c =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv40/nv40_state_scissor.c =A0| =A0 =A02 +-
>>> =A0src/gallium/drivers/nv40/nv40_state_stipple.c =A0| =A0 =A04 +-
>>> =A0src/gallium/drivers/nv40/nv40_state_viewport.c | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv40/nv40_vbo.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 +-
>>> =A0src/gallium/drivers/nv40/nv40_vertprog.c =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0src/gallium/drivers/nv50/nv50_program.c =A0 =A0 =A0 =A0| =A0 =A06 +-
>>> =A0src/gallium/drivers/nv50/nv50_screen.c =A0 =A0 =A0 =A0 | =A0 =A09 +-
>>> =A0src/gallium/drivers/nv50/nv50_state.c =A0 =A0 =A0 =A0 =A0| =A0 =A06 =
+-
>>> =A0src/gallium/drivers/nv50/nv50_state_validate.c | =A0 13 +-
>>> =A0src/gallium/drivers/nv50/nv50_tex.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 =
+-
>>> =A0src/gallium/drivers/nv50/nv50_vbo.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 +-
>>> =A032 files changed, 266 insertions(+), 147 deletions(-)
>>>
>>> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/galli=
um/drivers/nouveau/nouveau_stateobj.h
>>> index b8c83db..d33c55d 100644
>>> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
>>> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
>>> @@ -3,41 +3,96 @@
>>>
>>> =A0#include "util/u_debug.h"
>>>
>>> +#ifdef DEBUG
>>> +#define DEBUG_NOUVEAU_STATEOBJ
>>> +#endif /* DEBUG */
>>> +
>>> =A0struct nouveau_stateobj_reloc {
>>> =A0 =A0 =A0 =A0struct nouveau_bo *bo;
>>>
>>> - =A0 =A0 =A0 unsigned offset;
>>> - =A0 =A0 =A0 unsigned packet;
>>> + =A0 =A0 =A0 struct nouveau_grobj *gr;
>>> + =A0 =A0 =A0 uint32_t push_offset;
>>> + =A0 =A0 =A0 uint32_t mthd;
>>>
>>> - =A0 =A0 =A0 unsigned data;
>>> + =A0 =A0 =A0 uint32_t data;
>>> =A0 =A0 =A0 =A0unsigned flags;
>>> =A0 =A0 =A0 =A0unsigned vor;
>>> =A0 =A0 =A0 =A0unsigned tor;
>>> =A0};
>>>
>>> +struct nouveau_stateobj_start {
>>> + =A0 =A0 =A0 struct nouveau_grobj *gr;
>>> + =A0 =A0 =A0 uint32_t mthd;
>>> + =A0 =A0 =A0 uint32_t size;
>>> + =A0 =A0 =A0 unsigned offset;
>>> +};
>>> +
>>> =A0struct nouveau_stateobj {
>>> =A0 =A0 =A0 =A0struct pipe_reference reference;
>>>
>>> - =A0 =A0 =A0 unsigned *push;
>>> + =A0 =A0 =A0 struct nouveau_stateobj_start *start;
>>> =A0 =A0 =A0 =A0struct nouveau_stateobj_reloc *reloc;
>>>
>>> - =A0 =A0 =A0 unsigned *cur;
>>> - =A0 =A0 =A0 unsigned cur_packet;
>>> + =A0 =A0 =A0 /* Common memory pool for data. */
>>> + =A0 =A0 =A0 uint32_t *pool;
>>> + =A0 =A0 =A0 unsigned pool_cur;
>>> +
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 unsigned start_alloc;
>>> + =A0 =A0 =A0 unsigned reloc_alloc;
>>> + =A0 =A0 =A0 unsigned pool_alloc;
>>> +#endif =A0/* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 unsigned total; /* includes begin_ring */
>>> + =A0 =A0 =A0 unsigned cur; /* excludes begin_ring, offset from "cur_st=
art" */
>>> + =A0 =A0 =A0 unsigned cur_start;
>>> =A0 =A0 =A0 =A0unsigned cur_reloc;
>>> =A0};
>>>
>>> +static INLINE void
>>> +so_dump(struct nouveau_stateobj *so)
>>> +{
>>> + =A0 =A0 =A0 unsigned i, nr, total =3D 0;
>>> +
>>> + =A0 =A0 =A0 for (i =3D 0; i < so->cur_start; i++) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (so->start[i].gr->subc > -1)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("+0x%04x: 0x=
%08x\n", total++,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (so->star=
t[i].size << 18) | (so->start[i].gr->subc << 13)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | so->sta=
rt[i].mthd);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("+0x%04x: 0x=
%08x\n", total++,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (so->star=
t[i].size << 18) | so->start[i].mthd);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (nr =3D 0; nr < so->start[i].size; nr=
++, total++)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("+0x%04x: 0x=
%08x\n", total,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 so->pool[=
so->start[i].offset + nr]);
>>> + =A0 =A0 =A0 }
>>> +}
>>> +
>>> +/* Arguments are ignored, dynamic allocation. */
>>> =A0static INLINE struct nouveau_stateobj *
>>> -so_new(unsigned push, unsigned reloc)
>>> +so_new(unsigned start, unsigned push, unsigned reloc)
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nouveau_stateobj *so;
>>>
>>> =A0 =A0 =A0 =A0so =3D MALLOC(sizeof(struct nouveau_stateobj));
>>> =A0 =A0 =A0 =A0pipe_reference_init(&so->reference, 1);
>>> - =A0 =A0 =A0 so->push =3D MALLOC(sizeof(unsigned) * push);
>>> - =A0 =A0 =A0 so->reloc =3D MALLOC(sizeof(struct nouveau_stateobj_reloc=
) * reloc);
>>> -
>>> - =A0 =A0 =A0 so->cur =3D so->push;
>>> - =A0 =A0 =A0 so->cur_reloc =3D so->cur_packet =3D 0;
>>> + =A0 =A0 =A0 so->total =3D so->cur =3D so->cur_start =3D so->cur_reloc=
 =3D 0;
>>> +
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 so->start_alloc =3D start;
>>> + =A0 =A0 =A0 so->reloc_alloc =3D reloc;
>>> + =A0 =A0 =A0 so->pool_alloc =3D push;
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 so->start =3D MALLOC(start * sizeof(struct nouveau_stateo=
bj_start));
>>> + =A0 =A0 =A0 so->reloc =3D MALLOC(reloc * sizeof(struct nouveau_stateo=
bj_reloc));
>>> + =A0 =A0 =A0 so->pool =3D MALLOC(push * sizeof(uint32_t));
>>> + =A0 =A0 =A0 so->pool_cur =3D 0;
>>> +
>>> + =A0 =A0 =A0 if (!so->start || !so->reloc || !so->pool) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("malloc failed\n");
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>>
>>> =A0 =A0 =A0 =A0return so;
>>> =A0}
>>> @@ -48,54 +103,115 @@ so_ref(struct nouveau_stateobj *ref, struct nouve=
au_stateobj **pso)
>>> =A0 =A0 =A0 =A0struct nouveau_stateobj *so =3D *pso;
>>> =A0 =A0 =A0 =A0int i;
>>>
>>> - =A0 =A0 =A0 =A0if (pipe_reference(&(*pso)->reference, &ref->reference=
)) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(so->push);
>>> + =A0 =A0 =A0 if (pipe_reference(&(*pso)->reference, &ref->reference)) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(so->start);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < so->cur_reloc; i++)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_bo_ref(NULL, &so=
->reloc[i].bo);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(so->reloc);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(so);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(so->reloc);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(so->pool);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(so);
>>> =A0 =A0 =A0 =A0}
>>> =A0 =A0 =A0 =A0*pso =3D ref;
>>> =A0}
>>>
>>> =A0static INLINE void
>>> -so_data(struct nouveau_stateobj *so, unsigned data)
>>> +so_data(struct nouveau_stateobj *so, uint32_t data)
>>> =A0{
>>> - =A0 =A0 =A0 (*so->cur++) =3D (data);
>>> - =A0 =A0 =A0 so->cur_packet +=3D 4;
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if (so->cur >=3D so->start[so->cur_start - 1].size) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("exceeding specified size\n"=
);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 so->pool[so->start[so->cur_start - 1].offset + so->cur++]=
 =3D data;
>>> =A0}
>>>
>>> =A0static INLINE void
>>> -so_datap(struct nouveau_stateobj *so, unsigned *data, unsigned size)
>>> +so_datap(struct nouveau_stateobj *so, uint32_t *data, unsigned size)
>>> =A0{
>>> - =A0 =A0 =A0 so->cur_packet +=3D (4 * size);
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if ((so->cur + size) > so->start[so->cur_start - 1].size)=
 {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("exceeding specified size\n"=
);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> =A0 =A0 =A0 =A0while (size--)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 (*so->cur++) =3D (*data++);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so->pool[so->start[so->cur_start - 1].off=
set + so->cur++] =3D
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *data++;
>>> =A0}
>>>
>>> =A0static INLINE void
>>> =A0so_method(struct nouveau_stateobj *so, struct nouveau_grobj *gr,
>>> =A0 =A0 =A0 =A0 =A0unsigned mthd, unsigned size)
>>> =A0{
>>> - =A0 =A0 =A0 so->cur_packet =3D (gr->subc << 13) | (1 << 18) | (mthd -=
 4);
>>> - =A0 =A0 =A0 so_data(so, (gr->subc << 13) | (size << 18) | mthd);
>>> + =A0 =A0 =A0 struct nouveau_stateobj_start *start;
>>> +
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if (so->start_alloc <=3D so->cur_start) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("exceeding num_start size\n"=
);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 } else
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 start =3D so->start;
>>> +
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if (so->cur_start > 0 && start[so->cur_start - 1].size > =
so->cur) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("previous so_method was not =
filled\n");
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 so->start =3D start;
>>> + =A0 =A0 =A0 start[so->cur_start].gr =3D gr;
>>> + =A0 =A0 =A0 start[so->cur_start].mthd =3D mthd;
>>> + =A0 =A0 =A0 start[so->cur_start].size =3D size;
>>> +
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if (so->pool_alloc < (size + so->pool_cur)) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("exceeding num_pool size\n");
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 start[so->cur_start].offset =3D so->pool_cur;
>>> + =A0 =A0 =A0 so->pool_cur +=3D size;
>>> +
>>> + =A0 =A0 =A0 so->cur_start++;
>>> + =A0 =A0 =A0 /* The 1 is for *this* begin_ring. */
>>> + =A0 =A0 =A0 so->total +=3D so->cur + 1;
>>> + =A0 =A0 =A0 so->cur =3D 0;
>>> =A0}
>>>
>>> =A0static INLINE void
>>> =A0so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
>>> =A0 =A0 =A0 =A0 unsigned data, unsigned flags, unsigned vor, unsigned t=
or)
>>> =A0{
>>> - =A0 =A0 =A0 struct nouveau_stateobj_reloc *r =3D &so->reloc[so->cur_r=
eloc++];
>>> -
>>> - =A0 =A0 =A0 r->bo =3D NULL;
>>> - =A0 =A0 =A0 nouveau_bo_ref(bo, &r->bo);
>>> - =A0 =A0 =A0 r->offset =3D so->cur - so->push;
>>> - =A0 =A0 =A0 r->packet =3D so->cur_packet;
>>> - =A0 =A0 =A0 r->data =3D data;
>>> - =A0 =A0 =A0 r->flags =3D flags;
>>> - =A0 =A0 =A0 r->vor =3D vor;
>>> - =A0 =A0 =A0 r->tor =3D tor;
>>> + =A0 =A0 =A0 struct nouveau_stateobj_reloc *r;
>>> +
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if (so->reloc_alloc <=3D so->cur_reloc) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("exceeding num_reloc size\n"=
);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 } else
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D so->reloc;
>>> +
>>> + =A0 =A0 =A0 so->reloc =3D r;
>>> + =A0 =A0 =A0 r[so->cur_reloc].bo =3D NULL;
>>> + =A0 =A0 =A0 nouveau_bo_ref(bo, &(r[so->cur_reloc].bo));
>>> + =A0 =A0 =A0 r[so->cur_reloc].gr =3D so->start[so->cur_start-1].gr;
>>> + =A0 =A0 =A0 r[so->cur_reloc].push_offset =3D so->total + so->cur;
>>> + =A0 =A0 =A0 r[so->cur_reloc].data =3D data;
>>> + =A0 =A0 =A0 r[so->cur_reloc].flags =3D flags;
>>> + =A0 =A0 =A0 r[so->cur_reloc].mthd =3D so->start[so->cur_start-1].mthd=
 +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (so->cur << 2);
>>> + =A0 =A0 =A0 r[so->cur_reloc].vor =3D vor;
>>> + =A0 =A0 =A0 r[so->cur_reloc].tor =3D tor;
>>> +
>>> =A0 =A0 =A0 =A0so_data(so, data);
>>> + =A0 =A0 =A0 so->cur_reloc++;
>>> =A0}
>>>
>>> =A0/* Determine if this buffer object is referenced by this state objec=
t. */
>>> @@ -112,90 +228,99 @@ so_bo_is_reloc(struct nouveau_stateobj *so, struc=
t nouveau_bo *bo)
>>> =A0}
>>>
>>> =A0static INLINE void
>>> -so_dump(struct nouveau_stateobj *so)
>>> -{
>>> - =A0 =A0 =A0 unsigned i, nr =3D so->cur - so->push;
>>> -
>>> - =A0 =A0 =A0 for (i =3D 0; i < nr; i++)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("+0x%04x: 0x%08x\n", i, so->=
push[i]);
>>> -}
>>> -
>>> -static INLINE void
>>> =A0so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nouveau_pushbuf *pb =3D chan->pushbuf;
>>> =A0 =A0 =A0 =A0unsigned nr, i;
>>> =A0 =A0 =A0 =A0int ret =3D 0;
>>>
>>> - =A0 =A0 =A0 nr =3D so->cur - so->push;
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 if (so->start[so->cur_start - 1].size > so->cur) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("emit: previous so_method wa=
s not filled\n");
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 /* We cannot update total in case we so_emit again. */
>>> + =A0 =A0 =A0 nr =3D so->total + so->cur;
>>> +
>>> =A0 =A0 =A0 =A0/* This will flush if we need space.
>>> =A0 =A0 =A0 =A0 * We don't actually need the marker.
>>> =A0 =A0 =A0 =A0 */
>>> =A0 =A0 =A0 =A0if ((ret =3D nouveau_pushbuf_marker_emit(chan, nr, so->c=
ur_reloc))) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debug_printf("so_emit failed marker emit=
 with error %d\n", ret);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> + =A0 =A0 =A0 }
>>> +
>>> + =A0 =A0 =A0 /* Submit data. This will ensure proper binding of object=
s. */
>>> + =A0 =A0 =A0 for (i =3D 0; i < so->cur_start; i++) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BEGIN_RING(chan, so->start[i].gr, so->sta=
rt[i].mthd, so->start[i].size);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RINGp(chan, &(so->pool[so->start[i].o=
ffset]), so->start[i].size);
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 pb->remaining -=3D nr;
>>>
>>> - =A0 =A0 =A0 memcpy(pb->cur, so->push, nr * 4);
>>> =A0 =A0 =A0 =A0for (i =3D 0; i < so->cur_reloc; i++) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_stateobj_reloc *r =3D &so=
->reloc[i];
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(c=
han, pb->cur + r->offset,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0r->bo, r->data, 0, r->flags,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0r->vor, r->tor))) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(c=
han, pb->cur - nr +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 r->push_offset, r->bo, r->data,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 0, r->flags, r->vor, r->tor))) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debug_printf("so_emit fa=
iled reloc with error %d\n", ret);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> =A0 =A0 =A0 =A0}
>>> -out:
>>> - =A0 =A0 =A0 pb->cur +=3D nr;
>>> =A0}
>>>
>>> =A0static INLINE void
>>> =A0so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_s=
tateobj *so)
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nouveau_pushbuf *pb =3D chan->pushbuf;
>>> + =A0 =A0 =A0 struct nouveau_grobj *gr =3D NULL;
>>> =A0 =A0 =A0 =A0unsigned i;
>>> =A0 =A0 =A0 =A0int ret =3D 0;
>>>
>>> =A0 =A0 =A0 =A0if (!so)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>>>
>>> - =A0 =A0 =A0 i =3D so->cur_reloc << 1;
>>> - =A0 =A0 =A0 /* This will flush if we need space.
>>> - =A0 =A0 =A0 =A0* We don't actually need the marker.
>>> - =A0 =A0 =A0 =A0*/
>>> - =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_marker_emit(chan, i, i))) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit_reloc_markers faile=
d marker emit with" \
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "error %d\n", ret);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>>> - =A0 =A0 =A0 }
>>> - =A0 =A0 =A0 pb->remaining -=3D i;
>>> -
>>> + =A0 =A0 =A0 /* If we need to flush in flush notify, then we have a pr=
oblem anyway. */
>>> =A0 =A0 =A0 =A0for (i =3D 0; i < so->cur_reloc; i++) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_stateobj_reloc *r =3D &so=
->reloc[i];
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(c=
han, pb->cur++, r->bo,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0r->packet, 0,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(r->flags & (NOUVEAU_BO_VRAM |
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_GART |
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_RDWR)) |
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0NOUVEAU_BO_DUMMY, 0, 0))) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit_rel=
oc_markers failed reloc" \
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 "with error %d\n", ret);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pb->remaining +=3D ((so->=
cur_reloc - i) << 1);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>>> +#ifdef DEBUG_NOUVEAU_STATEOBJ
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r->mthd & 0x40000000) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("error: NI m=
thd 0x%08X\n", r->mthd);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> +#endif /* DEBUG_NOUVEAU_STATEOBJ */
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The object needs to be bound and the s=
ystem must know the
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* subchannel is being used. Otherwise =
it will discard it.
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (gr !=3D r->gr) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BEGIN_RING(chan, r->gr, 0=
x100, 1);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gr =3D r->gr;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Some relocs really don't like to be ha=
mmered,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* NOUVEAU_BO_DUMMY makes sure it only
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* happens when needed.
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D OUT_RELOC(chan, r->bo, (r->gr->su=
bc << 13) | (1<< 18) |
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r->mthd, (r->flags & (NOU=
VEAU_BO_VRAM | NOUVEAU_BO_GART
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | NOUVEAU=
_BO_RDWR)) | NOUVEAU_BO_DUMMY, 0, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("OUT_RELOC f=
ailed %d\n", ret);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(c=
han, pb->cur++, r->bo,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0r->data, 0,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0r->flags | NOUVEAU_BO_DUMMY,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0r->vor, r->tor))) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("so_emit_rel=
oc_markers failed reloc" \
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 "with error %d\n", ret);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pb->remaining +=3D ((so->=
cur_reloc - i) << 1) - 1;
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D OUT_RELOC(chan, r->bo, r->data, r=
->flags |
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_DUMMY, r->vor,=
 r->tor);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_printf("OUT_RELOC f=
ailed %d\n", ret);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pb->remaining -=3D 2;
>>> =A0 =A0 =A0 =A0}
>>> =A0}
>>>
>>> diff --git a/src/gallium/drivers/nv04/nv04_screen.c b/src/gallium/drive=
rs/nv04/nv04_screen.c
>>> index 7c5b6e8..da3b562 100644
>>> --- a/src/gallium/drivers/nv04/nv04_screen.c
>>> +++ b/src/gallium/drivers/nv04/nv04_screen.c
>>> @@ -184,7 +184,6 @@ nv04_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR("Error creating 3D object: %=
d\n", ret);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->fahrenheit, 7);
>>>
>>> =A0 =A0 =A0 =A0/* 3D surface object */
>>> =A0 =A0 =A0 =A0ret =3D nouveau_grobj_alloc(chan, 0xbeef0002, sub3d_clas=
s,
>>> @@ -193,7 +192,6 @@ nv04_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR("Error creating 3D surface o=
bject: %d\n", ret);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->context_surfaces_3d, 6);
>>>
>>> =A0 =A0 =A0 =A0/* 2D engine setup */
>>> =A0 =A0 =A0 =A0screen->eng2d =3D nv04_surface_2d_init(&screen->base);
>>> diff --git a/src/gallium/drivers/nv10/nv10_screen.c b/src/gallium/drive=
rs/nv10/nv10_screen.c
>>> index 6a39dde..69a6dab 100644
>>> --- a/src/gallium/drivers/nv10/nv10_screen.c
>>> +++ b/src/gallium/drivers/nv10/nv10_screen.c
>>> @@ -180,7 +180,6 @@ nv10_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR("Error creating 3D object: %=
d\n", ret);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->celsius, 7);
>>>
>>> =A0 =A0 =A0 =A0/* 2D engine setup */
>>> =A0 =A0 =A0 =A0screen->eng2d =3D nv04_surface_2d_init(&screen->base);
>>> diff --git a/src/gallium/drivers/nv20/nv20_screen.c b/src/gallium/drive=
rs/nv20/nv20_screen.c
>>> index a0973f1..d091335 100644
>>> --- a/src/gallium/drivers/nv20/nv20_screen.c
>>> +++ b/src/gallium/drivers/nv20/nv20_screen.c
>>> @@ -176,7 +176,6 @@ nv20_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR("Error creating 3D object: %=
d\n", ret);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->kelvin, 7);
>>>
>>> =A0 =A0 =A0 =A0/* 2D engine setup */
>>> =A0 =A0 =A0 =A0screen->eng2d =3D nv04_surface_2d_init(&screen->base);
>>> diff --git a/src/gallium/drivers/nv30/nv30_fragprog.c b/src/gallium/dri=
vers/nv30/nv30_fragprog.c
>>> index d1ff18e..2d565cb 100644
>>> --- a/src/gallium/drivers/nv30/nv30_fragprog.c
>>> +++ b/src/gallium/drivers/nv30/nv30_fragprog.c
>>> @@ -837,7 +837,7 @@ nv30_fragprog_validate(struct nv30_context *nv30)
>>> =A0 =A0 =A0 =A0fp->buffer =3D pscreen->buffer_create(pscreen, 0x100, 0,=
 fp->insn_len * 4);
>>> =A0 =A0 =A0 =A0nv30_fragprog_upload(nv30, fp);
>>>
>>> - =A0 =A0 =A0 so =3D so_new(8, 1);
>>> + =A0 =A0 =A0 so =3D so_new(4, 4, 1);
>>> =A0 =A0 =A0 =A0so_method(so, nv30->screen->rankine, NV34TCL_FP_ACTIVE_P=
ROGRAM, 1);
>>> =A0 =A0 =A0 =A0so_reloc (so, nouveau_bo(fp->buffer), 0, NOUVEAU_BO_VRAM=
 |
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_GART | NOUVEAU_BO=
_RD | NOUVEAU_BO_LOW |
>>> diff --git a/src/gallium/drivers/nv30/nv30_fragtex.c b/src/gallium/driv=
ers/nv30/nv30_fragtex.c
>>> index b3293ee..9893567 100644
>>> --- a/src/gallium/drivers/nv30/nv30_fragtex.c
>>> +++ b/src/gallium/drivers/nv30/nv30_fragtex.c
>>> @@ -106,7 +106,7 @@ nv30_fragtex_build(struct nv30_context *nv30, int u=
nit)
>>>
>>> =A0 =A0 =A0 =A0txs =3D tf->swizzle;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(16, 2);
>>> + =A0 =A0 =A0 so =3D so_new(1, 8, 2);
>>> =A0 =A0 =A0 =A0so_method(so, nv30->screen->rankine, NV34TCL_TX_OFFSET(u=
nit), 8);
>>> =A0 =A0 =A0 =A0so_reloc (so, bo, 0, tex_flags | NOUVEAU_BO_LOW, 0, 0);
>>> =A0 =A0 =A0 =A0so_reloc (so, bo, txf, tex_flags | NOUVEAU_BO_OR,
>>> @@ -135,7 +135,7 @@ nv30_fragtex_validate(struct nv30_context *nv30)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unit =3D ffs(samplers) - 1;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0samplers &=3D ~(1 << unit);
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, nv30->screen->rankine, NV3=
4TCL_TX_ENABLE(unit), 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_ref(so, &nv30->state.hw[NV30_STATE_FR=
AGTEX0 + unit]);
>>> diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drive=
rs/nv30/nv30_screen.c
>>> index 760467f..9ed4817 100644
>>> --- a/src/gallium/drivers/nv30/nv30_screen.c
>>> +++ b/src/gallium/drivers/nv30/nv30_screen.c
>>> @@ -233,7 +233,6 @@ nv30_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR("Error creating 3D object: %=
d\n", ret);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->rankine, 7);
>>>
>>> =A0 =A0 =A0 =A0/* 2D engine setup */
>>> =A0 =A0 =A0 =A0screen->eng2d =3D nv04_surface_2d_init(&screen->base);
>>> @@ -270,7 +269,7 @@ nv30_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0/* Static rankine initialisation */
>>> - =A0 =A0 =A0 so =3D so_new(128, 0);
>>> + =A0 =A0 =A0 so =3D so_new(36, 60, 0);
>>> =A0 =A0 =A0 =A0so_method(so, screen->rankine, NV34TCL_DMA_NOTIFY, 1);
>>> =A0 =A0 =A0 =A0so_data =A0(so, screen->sync->handle);
>>> =A0 =A0 =A0 =A0so_method(so, screen->rankine, NV34TCL_DMA_TEXTURE0, 2);
>>> diff --git a/src/gallium/drivers/nv30/nv30_state.c b/src/gallium/driver=
s/nv30/nv30_state.c
>>> index e6321b4..a80dfb0 100644
>>> --- a/src/gallium/drivers/nv30/nv30_state.c
>>> +++ b/src/gallium/drivers/nv30/nv30_state.c
>>> @@ -14,7 +14,7 @@ nv30_blend_state_create(struct pipe_context *pipe,
>>> =A0 =A0 =A0 =A0struct nv30_context *nv30 =3D nv30_context(pipe);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *rankine =3D nv30->screen->rankine;
>>> =A0 =A0 =A0 =A0struct nv30_blend_state *bso =3D CALLOC(1, sizeof(*bso));
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(16, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(5, 8, 0);
>>>
>>> =A0 =A0 =A0 =A0if (cso->blend_enable) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, rankine, NV34TCL_BLEND_FUN=
C_ENABLE, 3);
>>> @@ -300,7 +300,7 @@ nv30_rasterizer_state_create(struct pipe_context *p=
ipe,
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nv30_context *nv30 =3D nv30_context(pipe);
>>> =A0 =A0 =A0 =A0struct nv30_rasterizer_state *rsso =3D CALLOC(1, sizeof(=
*rsso));
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(32, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(9, 19, 0);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *rankine =3D nv30->screen->rankine;
>>>
>>> =A0 =A0 =A0 =A0/*XXX: ignored:
>>> @@ -435,7 +435,7 @@ nv30_depth_stencil_alpha_state_create(struct pipe_c=
ontext *pipe,
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nv30_context *nv30 =3D nv30_context(pipe);
>>> =A0 =A0 =A0 =A0struct nv30_zsa_state *zsaso =3D CALLOC(1, sizeof(*zsaso=
));
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(32, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(5, 21, 0);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *rankine =3D nv30->screen->rankine;
>>>
>>> =A0 =A0 =A0 =A0so_method(so, rankine, NV34TCL_DEPTH_FUNC, 3);
>>> diff --git a/src/gallium/drivers/nv30/nv30_state_blend.c b/src/gallium/=
drivers/nv30/nv30_state_blend.c
>>> index 64cf9ae..c36d58c 100644
>>> --- a/src/gallium/drivers/nv30/nv30_state_blend.c
>>> +++ b/src/gallium/drivers/nv30/nv30_state_blend.c
>>> @@ -18,7 +18,7 @@ struct nv30_state_entry nv30_state_blend =3D {
>>> =A0static boolean
>>> =A0nv30_state_blend_colour_validate(struct nv30_context *nv30)
>>> =A0{
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0struct pipe_blend_color *bcol =3D &nv30->blend_colour;
>>>
>>> =A0 =A0 =A0 =A0so_method(so, nv30->screen->rankine, NV34TCL_BLEND_COLOR=
, 1);
>>> diff --git a/src/gallium/drivers/nv30/nv30_state_fb.c b/src/gallium/dri=
vers/nv30/nv30_state_fb.c
>>> index 6f6d174..2ed2ea5 100644
>>> --- a/src/gallium/drivers/nv30/nv30_state_fb.c
>>> +++ b/src/gallium/drivers/nv30/nv30_state_fb.c
>>> @@ -10,7 +10,7 @@ nv30_state_framebuffer_validate(struct nv30_context *=
nv30)
>>> =A0 =A0 =A0 =A0struct nv04_surface *rt[2], *zeta =3D NULL;
>>> =A0 =A0 =A0 =A0uint32_t rt_enable =3D 0, rt_format =3D 0;
>>> =A0 =A0 =A0 =A0int i, colour_format =3D 0, zeta_format =3D 0, depth_onl=
y =3D 0;
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(64, 10);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(12, 18, 10);
>>> =A0 =A0 =A0 =A0unsigned rt_flags =3D NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
>>> =A0 =A0 =A0 =A0unsigned w =3D fb->width;
>>> =A0 =A0 =A0 =A0unsigned h =3D fb->height;
>>> diff --git a/src/gallium/drivers/nv30/nv30_state_scissor.c b/src/galliu=
m/drivers/nv30/nv30_state_scissor.c
>>> index 3ac7a84..ba61a9e 100644
>>> --- a/src/gallium/drivers/nv30/nv30_state_scissor.c
>>> +++ b/src/gallium/drivers/nv30/nv30_state_scissor.c
>>> @@ -12,7 +12,7 @@ nv30_state_scissor_validate(struct nv30_context *nv30)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0nv30->state.scissor_enabled =3D rast->scissor;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(3, 0);
>>> + =A0 =A0 =A0 so =3D so_new(1, 2, 0);
>>> =A0 =A0 =A0 =A0so_method(so, nv30->screen->rankine, NV34TCL_SCISSOR_HOR=
IZ, 2);
>>> =A0 =A0 =A0 =A0if (nv30->state.scissor_enabled) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, ((s->maxx - s->minx) << =
16) | s->minx);
>>> diff --git a/src/gallium/drivers/nv30/nv30_state_stipple.c b/src/galliu=
m/drivers/nv30/nv30_state_stipple.c
>>> index d0c791a..ed520a4 100644
>>> --- a/src/gallium/drivers/nv30/nv30_state_stipple.c
>>> +++ b/src/gallium/drivers/nv30/nv30_state_stipple.c
>>> @@ -14,14 +14,14 @@ nv30_state_stipple_validate(struct nv30_context *nv=
30)
>>> =A0 =A0 =A0 =A0if (rast->poly_stipple_enable) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned i;
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(35, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 33, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, rankine, NV34TCL_POLYGON_S=
TIPPLE_ENABLE, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, rankine, NV34TCL_POLYGON_S=
TIPPLE_PATTERN(0), 32);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < 32; i++)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data(so, nv30->stippl=
e[i]);
>>> =A0 =A0 =A0 =A0} else {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, rankine, NV34TCL_POLYGON_S=
TIPPLE_ENABLE, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, 0);
>>> =A0 =A0 =A0 =A0}
>>> diff --git a/src/gallium/drivers/nv30/nv30_state_viewport.c b/src/galli=
um/drivers/nv30/nv30_state_viewport.c
>>> index c3eb413..2d77812 100644
>>> --- a/src/gallium/drivers/nv30/nv30_state_viewport.c
>>> +++ b/src/gallium/drivers/nv30/nv30_state_viewport.c
>>> @@ -19,7 +19,7 @@ nv30_state_viewport_validate(struct nv30_context *nv3=
0)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0nv30->state.viewport_bypass =3D bypass;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(11, 0);
>>> + =A0 =A0 =A0 so =3D so_new(3, 10, 0);
>>> =A0 =A0 =A0 =A0if (!bypass) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, nv30->screen->rankine,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV34TCL_VIEWPORT_TRA=
NSLATE_X, 8);
>>> diff --git a/src/gallium/drivers/nv30/nv30_vbo.c b/src/gallium/drivers/=
nv30/nv30_vbo.c
>>> index 242a2b0..80c7eb1 100644
>>> --- a/src/gallium/drivers/nv30/nv30_vbo.c
>>> +++ b/src/gallium/drivers/nv30/nv30_vbo.c
>>> @@ -495,9 +495,9 @@ nv30_vbo_validate(struct nv30_context *nv30)
>>> =A0 =A0 =A0 =A0unsigned vb_flags =3D NOUVEAU_BO_VRAM | NOUVEAU_BO_GART =
| NOUVEAU_BO_RD;
>>> =A0 =A0 =A0 =A0int hw;
>>>
>>> - =A0 =A0 =A0 vtxbuf =3D so_new(20, 18);
>>> + =A0 =A0 =A0 vtxbuf =3D so_new(3, 17, 18);
>>> =A0 =A0 =A0 =A0so_method(vtxbuf, rankine, NV34TCL_VTXBUF_ADDRESS(0), nv=
30->vtxelt_nr);
>>> - =A0 =A0 =A0 vtxfmt =3D so_new(17, 0);
>>> + =A0 =A0 =A0 vtxfmt =3D so_new(1, 16, 0);
>>> =A0 =A0 =A0 =A0so_method(vtxfmt, rankine, NV34TCL_VTXFMT(0), nv30->vtxe=
lt_nr);
>>>
>>> =A0 =A0 =A0 =A0for (hw =3D 0; hw < nv30->vtxelt_nr; hw++) {
>>> @@ -510,7 +510,7 @@ nv30_vbo_validate(struct nv30_context *nv30)
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!vb->stride) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!sattr)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sattr =3D=
 so_new(16 * 5, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sattr =3D=
 so_new(16, 16 * 4, 0);
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nv30_vbo_static_attr=
ib(nv30, sattr, hw, ve, vb)) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data(=
vtxbuf, 0);
>>> diff --git a/src/gallium/drivers/nv30/nv30_vertprog.c b/src/gallium/dri=
vers/nv30/nv30_vertprog.c
>>> index 4e6d3d0..e77a5be 100644
>>> --- a/src/gallium/drivers/nv30/nv30_vertprog.c
>>> +++ b/src/gallium/drivers/nv30/nv30_vertprog.c
>>> @@ -686,7 +686,7 @@ nv30_vertprog_validate(struct nv30_context *nv30)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0assert(0=
);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, rankine, NV34TCL_VP_START_=
FROM_ID, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, vp->exec->start);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_ref(so, &vp->so);
>>> diff --git a/src/gallium/drivers/nv40/nv40_fragprog.c b/src/gallium/dri=
vers/nv40/nv40_fragprog.c
>>> index bb9c85c..1237066 100644
>>> --- a/src/gallium/drivers/nv40/nv40_fragprog.c
>>> +++ b/src/gallium/drivers/nv40/nv40_fragprog.c
>>> @@ -919,7 +919,7 @@ nv40_fragprog_validate(struct nv40_context *nv40)
>>> =A0 =A0 =A0 =A0fp->buffer =3D pscreen->buffer_create(pscreen, 0x100, 0,=
 fp->insn_len * 4);
>>> =A0 =A0 =A0 =A0nv40_fragprog_upload(nv40, fp);
>>>
>>> - =A0 =A0 =A0 so =3D so_new(4, 1);
>>> + =A0 =A0 =A0 so =3D so_new(2, 2, 1);
>>> =A0 =A0 =A0 =A0so_method(so, nv40->screen->curie, NV40TCL_FP_ADDRESS, 1=
);
>>> =A0 =A0 =A0 =A0so_reloc (so, nouveau_bo(fp->buffer), 0, NOUVEAU_BO_VRAM=
 |
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_GART | NOUVEAU_BO=
_RD | NOUVEAU_BO_LOW |
>>> diff --git a/src/gallium/drivers/nv40/nv40_fragtex.c b/src/gallium/driv=
ers/nv40/nv40_fragtex.c
>>> index 44abc84..aad9198 100644
>>> --- a/src/gallium/drivers/nv40/nv40_fragtex.c
>>> +++ b/src/gallium/drivers/nv40/nv40_fragtex.c
>>> @@ -108,7 +108,7 @@ nv40_fragtex_build(struct nv40_context *nv40, int u=
nit)
>>>
>>> =A0 =A0 =A0 =A0txs =3D tf->swizzle;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(16, 2);
>>> + =A0 =A0 =A0 so =3D so_new(2, 9, 2);
>>> =A0 =A0 =A0 =A0so_method(so, nv40->screen->curie, NV40TCL_TEX_OFFSET(un=
it), 8);
>>> =A0 =A0 =A0 =A0so_reloc (so, bo, 0, tex_flags | NOUVEAU_BO_LOW, 0, 0);
>>> =A0 =A0 =A0 =A0so_reloc (so, bo, txf, tex_flags | NOUVEAU_BO_OR,
>>> @@ -139,7 +139,7 @@ nv40_fragtex_validate(struct nv40_context *nv40)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unit =3D ffs(samplers) - 1;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0samplers &=3D ~(1 << unit);
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, nv40->screen->curie, NV40T=
CL_TEX_ENABLE(unit), 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_ref(so, &nv40->state.hw[NV40_STATE_FR=
AGTEX0 + unit]);
>>> diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drive=
rs/nv40/nv40_screen.c
>>> index d01e712..9e55e5a 100644
>>> --- a/src/gallium/drivers/nv40/nv40_screen.c
>>> +++ b/src/gallium/drivers/nv40/nv40_screen.c
>>> @@ -215,7 +215,6 @@ nv40_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR("Error creating 3D object: %=
d\n", ret);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->curie, 7);
>>>
>>> =A0 =A0 =A0 =A0/* 2D engine setup */
>>> =A0 =A0 =A0 =A0screen->eng2d =3D nv04_surface_2d_init(&screen->base);
>>> @@ -252,7 +251,7 @@ nv40_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0/* Static curie initialisation */
>>> - =A0 =A0 =A0 so =3D so_new(128, 0);
>>> + =A0 =A0 =A0 so =3D so_new(16, 25, 0);
>>> =A0 =A0 =A0 =A0so_method(so, screen->curie, NV40TCL_DMA_NOTIFY, 1);
>>> =A0 =A0 =A0 =A0so_data =A0(so, screen->sync->handle);
>>> =A0 =A0 =A0 =A0so_method(so, screen->curie, NV40TCL_DMA_TEXTURE0, 2);
>>> diff --git a/src/gallium/drivers/nv40/nv40_state.c b/src/gallium/driver=
s/nv40/nv40_state.c
>>> index ed55d29..ed0ca9e 100644
>>> --- a/src/gallium/drivers/nv40/nv40_state.c
>>> +++ b/src/gallium/drivers/nv40/nv40_state.c
>>> @@ -16,7 +16,7 @@ nv40_blend_state_create(struct pipe_context *pipe,
>>> =A0 =A0 =A0 =A0struct nv40_context *nv40 =3D nv40_context(pipe);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *curie =3D nv40->screen->curie;
>>> =A0 =A0 =A0 =A0struct nv40_blend_state *bso =3D CALLOC(1, sizeof(*bso));
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(16, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(5, 8, 0);
>>>
>>> =A0 =A0 =A0 =A0if (cso->blend_enable) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_BLEND_ENABL=
E, 3);
>>> @@ -310,7 +310,7 @@ nv40_rasterizer_state_create(struct pipe_context *p=
ipe,
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nv40_context *nv40 =3D nv40_context(pipe);
>>> =A0 =A0 =A0 =A0struct nv40_rasterizer_state *rsso =3D CALLOC(1, sizeof(=
*rsso));
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(32, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(8, 18, 0);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *curie =3D nv40->screen->curie;
>>>
>>> =A0 =A0 =A0 =A0/*XXX: ignored:
>>> @@ -445,7 +445,7 @@ nv40_depth_stencil_alpha_state_create(struct pipe_c=
ontext *pipe,
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nv40_context *nv40 =3D nv40_context(pipe);
>>> =A0 =A0 =A0 =A0struct nv40_zsa_state *zsaso =3D CALLOC(1, sizeof(*zsaso=
));
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(32, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(4, 21, 0);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *curie =3D nv40->screen->curie;
>>>
>>> =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_DEPTH_FUNC, 3);
>>> diff --git a/src/gallium/drivers/nv40/nv40_state_blend.c b/src/gallium/=
drivers/nv40/nv40_state_blend.c
>>> index 8cd05ce..3ff00a3 100644
>>> --- a/src/gallium/drivers/nv40/nv40_state_blend.c
>>> +++ b/src/gallium/drivers/nv40/nv40_state_blend.c
>>> @@ -18,7 +18,7 @@ struct nv40_state_entry nv40_state_blend =3D {
>>> =A0static boolean
>>> =A0nv40_state_blend_colour_validate(struct nv40_context *nv40)
>>> =A0{
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0struct pipe_blend_color *bcol =3D &nv40->blend_colour;
>>>
>>> =A0 =A0 =A0 =A0so_method(so, nv40->screen->curie, NV40TCL_BLEND_COLOR, =
1);
>>> diff --git a/src/gallium/drivers/nv40/nv40_state_fb.c b/src/gallium/dri=
vers/nv40/nv40_state_fb.c
>>> index 1c7a7cd..a58fe9d 100644
>>> --- a/src/gallium/drivers/nv40/nv40_state_fb.c
>>> +++ b/src/gallium/drivers/nv40/nv40_state_fb.c
>>> @@ -19,7 +19,7 @@ nv40_state_framebuffer_validate(struct nv40_context *=
nv40)
>>> =A0 =A0 =A0 =A0struct nv04_surface *rt[4], *zeta;
>>> =A0 =A0 =A0 =A0uint32_t rt_enable, rt_format;
>>> =A0 =A0 =A0 =A0int i, colour_format =3D 0, zeta_format =3D 0;
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(64, 10);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(18, 24, 10);
>>> =A0 =A0 =A0 =A0unsigned rt_flags =3D NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
>>> =A0 =A0 =A0 =A0unsigned w =3D fb->width;
>>> =A0 =A0 =A0 =A0unsigned h =3D fb->height;
>>> diff --git a/src/gallium/drivers/nv40/nv40_state_scissor.c b/src/galliu=
m/drivers/nv40/nv40_state_scissor.c
>>> index cf58d33..753a505 100644
>>> --- a/src/gallium/drivers/nv40/nv40_state_scissor.c
>>> +++ b/src/gallium/drivers/nv40/nv40_state_scissor.c
>>> @@ -12,7 +12,7 @@ nv40_state_scissor_validate(struct nv40_context *nv40)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0nv40->state.scissor_enabled =3D rast->scissor;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(3, 0);
>>> + =A0 =A0 =A0 so =3D so_new(1, 2, 0);
>>> =A0 =A0 =A0 =A0so_method(so, nv40->screen->curie, NV40TCL_SCISSOR_HORIZ=
, 2);
>>> =A0 =A0 =A0 =A0if (nv40->state.scissor_enabled) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, ((s->maxx - s->minx) << =
16) | s->minx);
>>> diff --git a/src/gallium/drivers/nv40/nv40_state_stipple.c b/src/galliu=
m/drivers/nv40/nv40_state_stipple.c
>>> index b51024a..2b371eb 100644
>>> --- a/src/gallium/drivers/nv40/nv40_state_stipple.c
>>> +++ b/src/gallium/drivers/nv40/nv40_state_stipple.c
>>> @@ -14,14 +14,14 @@ nv40_state_stipple_validate(struct nv40_context *nv=
40)
>>> =A0 =A0 =A0 =A0if (rast->poly_stipple_enable) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned i;
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(35, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 33, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_POLYGON_STI=
PPLE_ENABLE, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_POLYGON_STI=
PPLE_PATTERN(0), 32);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < 32; i++)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data(so, nv40->stippl=
e[i]);
>>> =A0 =A0 =A0 =A0} else {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(2, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 1, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_POLYGON_STI=
PPLE_ENABLE, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, 0);
>>> =A0 =A0 =A0 =A0}
>>> diff --git a/src/gallium/drivers/nv40/nv40_state_viewport.c b/src/galli=
um/drivers/nv40/nv40_state_viewport.c
>>> index 665d2d5..9919ba1 100644
>>> --- a/src/gallium/drivers/nv40/nv40_state_viewport.c
>>> +++ b/src/gallium/drivers/nv40/nv40_state_viewport.c
>>> @@ -19,7 +19,7 @@ nv40_state_viewport_validate(struct nv40_context *nv4=
0)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>>> =A0 =A0 =A0 =A0nv40->state.viewport_bypass =3D bypass;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(11, 0);
>>> + =A0 =A0 =A0 so =3D so_new(2, 9, 0);
>>> =A0 =A0 =A0 =A0if (!bypass) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, nv40->screen->curie,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV40TCL_VIEWPORT_TRA=
NSLATE_X, 8);
>>> diff --git a/src/gallium/drivers/nv40/nv40_vbo.c b/src/gallium/drivers/=
nv40/nv40_vbo.c
>>> index d76af31..340ad67 100644
>>> --- a/src/gallium/drivers/nv40/nv40_vbo.c
>>> +++ b/src/gallium/drivers/nv40/nv40_vbo.c
>>> @@ -494,9 +494,9 @@ nv40_vbo_validate(struct nv40_context *nv40)
>>> =A0 =A0 =A0 =A0unsigned vb_flags =3D NOUVEAU_BO_VRAM | NOUVEAU_BO_GART =
| NOUVEAU_BO_RD;
>>> =A0 =A0 =A0 =A0int hw;
>>>
>>> - =A0 =A0 =A0 vtxbuf =3D so_new(20, 18);
>>> + =A0 =A0 =A0 vtxbuf =3D so_new(3, 17, 18);
>>> =A0 =A0 =A0 =A0so_method(vtxbuf, curie, NV40TCL_VTXBUF_ADDRESS(0), nv40=
->vtxelt_nr);
>>> - =A0 =A0 =A0 vtxfmt =3D so_new(17, 0);
>>> + =A0 =A0 =A0 vtxfmt =3D so_new(1, 16, 0);
>>> =A0 =A0 =A0 =A0so_method(vtxfmt, curie, NV40TCL_VTXFMT(0), nv40->vtxelt=
_nr);
>>>
>>> =A0 =A0 =A0 =A0for (hw =3D 0; hw < nv40->vtxelt_nr; hw++) {
>>> @@ -509,7 +509,7 @@ nv40_vbo_validate(struct nv40_context *nv40)
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!vb->stride) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!sattr)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sattr =3D=
 so_new(16 * 5, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sattr =3D=
 so_new(16, 16 * 4, 0);
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nv40_vbo_static_attr=
ib(nv40, sattr, hw, ve, vb)) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data(=
vtxbuf, 0);
>>> diff --git a/src/gallium/drivers/nv40/nv40_vertprog.c b/src/gallium/dri=
vers/nv40/nv40_vertprog.c
>>> index afbb2cb..8d80fca 100644
>>> --- a/src/gallium/drivers/nv40/nv40_vertprog.c
>>> +++ b/src/gallium/drivers/nv40/nv40_vertprog.c
>>> @@ -886,7 +886,7 @@ check_gpu_resources:
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0assert(0=
);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(7, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(3, 4, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_VP_START_FR=
OM_ID, 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, vp->exec->start);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, curie, NV40TCL_VP_ATTRIB_E=
N, 2);
>>> diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/driv=
ers/nv50/nv50_program.c
>>> index b9910b4..a3f1372 100644
>>> --- a/src/gallium/drivers/nv50/nv50_program.c
>>> +++ b/src/gallium/drivers/nv50/nv50_program.c
>>> @@ -3452,7 +3452,7 @@ nv50_vertprog_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0nv50_program_validate_data(nv50, p);
>>> =A0 =A0 =A0 =A0nv50_program_validate_code(nv50, p);
>>>
>>> - =A0 =A0 =A0 so =3D so_new(13, 2);
>>> + =A0 =A0 =A0 so =3D so_new(5, 8, 2);
>>> =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
>>> =A0 =A0 =A0 =A0so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_HIGH, 0, 0);
>>> @@ -3488,7 +3488,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0nv50_program_validate_data(nv50, p);
>>> =A0 =A0 =A0 =A0nv50_program_validate_code(nv50, p);
>>>
>>> - =A0 =A0 =A0 so =3D so_new(64, 2);
>>> + =A0 =A0 =A0 so =3D so_new(6, 7, 2);
>>> =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
>>> =A0 =A0 =A0 =A0so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_HIGH, 0, 0);
>>> @@ -3656,7 +3656,7 @@ nv50_linkage_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0/* now fill the stateobj */
>>> - =A0 =A0 =A0 so =3D so_new(64, 0);
>>> + =A0 =A0 =A0 so =3D so_new(6, 58, 0);
>>>
>>> =A0 =A0 =A0 =A0n =3D (m + 3) / 4;
>>> =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_VP_RESULT_MAP_SIZE, 1);
>>> diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drive=
rs/nv50/nv50_screen.c
>>> index 1778a74..28e2b35 100644
>>> --- a/src/gallium/drivers/nv50/nv50_screen.c
>>> +++ b/src/gallium/drivers/nv50/nv50_screen.c
>>> @@ -251,7 +251,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_screen_destroy(pscreen);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->m2mf, 1);
>>>
>>> =A0 =A0 =A0 =A0/* 2D object */
>>> =A0 =A0 =A0 =A0ret =3D nouveau_grobj_alloc(chan, 0xbeef502d, NV50_2D, &=
screen->eng2d);
>>> @@ -260,7 +259,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_screen_destroy(pscreen);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->eng2d, 2);
>>>
>>> =A0 =A0 =A0 =A0/* 3D object */
>>> =A0 =A0 =A0 =A0switch (chipset & 0xf0) {
>>> @@ -296,7 +294,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_screen_destroy(pscreen);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 BIND_RING(chan, screen->tesla, 3);
>>>
>>> =A0 =A0 =A0 =A0/* Sync notifier */
>>> =A0 =A0 =A0 =A0ret =3D nouveau_notifier_alloc(chan, 0xbeef0301, 1, &scr=
een->sync);
>>> @@ -307,7 +304,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0/* Static M2MF init */
>>> - =A0 =A0 =A0 so =3D so_new(32, 0);
>>> + =A0 =A0 =A0 so =3D so_new(1, 3, 0);
>>> =A0 =A0 =A0 =A0so_method(so, screen->m2mf, NV04_MEMORY_TO_MEMORY_FORMAT=
_DMA_NOTIFY, 3);
>>> =A0 =A0 =A0 =A0so_data =A0(so, screen->sync->handle);
>>> =A0 =A0 =A0 =A0so_data =A0(so, chan->vram->handle);
>>> @@ -316,7 +313,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0so_ref (NULL, &so);
>>>
>>> =A0 =A0 =A0 =A0/* Static 2D init */
>>> - =A0 =A0 =A0 so =3D so_new(64, 0);
>>> + =A0 =A0 =A0 so =3D so_new(4, 7, 0);
>>> =A0 =A0 =A0 =A0so_method(so, screen->eng2d, NV50_2D_DMA_NOTIFY, 4);
>>> =A0 =A0 =A0 =A0so_data =A0(so, screen->sync->handle);
>>> =A0 =A0 =A0 =A0so_data =A0(so, chan->vram->handle);
>>> @@ -332,7 +329,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct n=
ouveau_device *dev)
>>> =A0 =A0 =A0 =A0so_ref(NULL, &so);
>>>
>>> =A0 =A0 =A0 =A0/* Static tesla init */
>>> - =A0 =A0 =A0 so =3D so_new(256, 20);
>>> + =A0 =A0 =A0 so =3D so_new(40, 84, 20);
>>>
>>> =A0 =A0 =A0 =A0so_method(so, screen->tesla, NV50TCL_COND_MODE, 1);
>>> =A0 =A0 =A0 =A0so_data =A0(so, NV50TCL_COND_MODE_ALWAYS);
>>> diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/driver=
s/nv50/nv50_state.c
>>> index 18a2b81..18b5a9a 100644
>>> --- a/src/gallium/drivers/nv50/nv50_state.c
>>> +++ b/src/gallium/drivers/nv50/nv50_state.c
>>> @@ -35,7 +35,7 @@ static void *
>>> =A0nv50_blend_state_create(struct pipe_context *pipe,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct pipe_blend_=
state *cso)
>>> =A0{
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(64, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(5, 24, 0);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50_context(pipe)->scre=
en->tesla;
>>> =A0 =A0 =A0 =A0struct nv50_blend_stateobj *bso =3D CALLOC_STRUCT(nv50_b=
lend_stateobj);
>>> =A0 =A0 =A0 =A0unsigned cmask =3D 0, i;
>>> @@ -280,7 +280,7 @@ static void *
>>> =A0nv50_rasterizer_state_create(struct pipe_context *pipe,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct pi=
pe_rasterizer_state *cso)
>>> =A0{
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(64, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(15, 21, 0);
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50_context(pipe)->scre=
en->tesla;
>>> =A0 =A0 =A0 =A0struct nv50_rasterizer_stateobj *rso =3D
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CALLOC_STRUCT(nv50_rasterizer_stateobj);
>>> @@ -425,7 +425,7 @@ nv50_depth_stencil_alpha_state_create(struct pipe_c=
ontext *pipe,
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50_context(pipe)->scre=
en->tesla;
>>> =A0 =A0 =A0 =A0struct nv50_zsa_stateobj *zsa =3D CALLOC_STRUCT(nv50_zsa=
_stateobj);
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(64, 0);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(8, 22, 0);
>>>
>>> =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_DEPTH_WRITE_ENABLE, 1);
>>> =A0 =A0 =A0 =A0so_data =A0(so, cso->depth.writemask ? 1 : 0);
>>> diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/galli=
um/drivers/nv50/nv50_state_validate.c
>>> index 6827863..f83232f 100644
>>> --- a/src/gallium/drivers/nv50/nv50_state_validate.c
>>> +++ b/src/gallium/drivers/nv50/nv50_state_validate.c
>>> @@ -33,7 +33,7 @@ static void
>>> =A0nv50_state_validate_fb(struct nv50_context *nv50)
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50->screen->tesla;
>>> - =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(128, 18);
>>> + =A0 =A0 =A0 struct nouveau_stateobj *so =3D so_new(32, 79, 18);
>>> =A0 =A0 =A0 =A0struct pipe_framebuffer_state *fb =3D &nv50->framebuffer;
>>> =A0 =A0 =A0 =A0unsigned i, w, h, gw =3D 0;
>>>
>>> @@ -299,7 +299,7 @@ nv50_state_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_ref(nv50->rasterizer->so, &nv50->stat=
e.rast);
>>>
>>> =A0 =A0 =A0 =A0if (nv50->dirty & NV50_NEW_BLEND_COLOUR) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(5, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 4, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_BLEND_COLOR=
(0), 4);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, fui(nv50->blend_colour.c=
olor[0]));
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, fui(nv50->blend_colour.c=
olor[1]));
>>> @@ -310,7 +310,7 @@ nv50_state_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0}
>>>
>>> =A0 =A0 =A0 =A0if (nv50->dirty & NV50_NEW_STIPPLE) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(33, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 32, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_POLYGON_STI=
PPLE_PATTERN(0), 32);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < 32; i++)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data(so, util_bswap32=
(nv50->stipple.stipple[i]));
>>> @@ -327,7 +327,7 @@ nv50_state_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto scissor_uptodate;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50->state.scissor_enabled =3D rast->sc=
issor;
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(3, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1, 2, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_SCISSOR_HOR=
IZ(0), 2);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nv50->state.scissor_enabled) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data(so, (s->maxx << =
16) | s->minx);
>>> @@ -356,7 +356,7 @@ scissor_uptodate:
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto viewport_uptodate;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50->state.viewport_bypass =3D bypass;
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(14, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(5, 9, 0);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!bypass) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_method(so, tesla, NV5=
0TCL_VIEWPORT_TRANSLATE_X(0), 3);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0so_data =A0(so, fui(nv50=
->viewport.translate[0]));
>>> @@ -400,7 +400,8 @@ viewport_uptodate:
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < PIPE_SHADER_TYPES; ++i)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nr +=3D nv50->sampler_nr=
[i];
>>>
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(nr * 8 + 24 * PIPE_SHADER_T=
YPES + 2, 4);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so =3D so_new(1+ 5 * PIPE_SHADER_TYPES, 1=
+ 19 * PIPE_SHADER_TYPES
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 + nr * 8, PIPE_SHADER_TYPES * 2);
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_validate_samplers(nv50, so, PIPE_SH=
ADER_VERTEX);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_validate_samplers(nv50, so, PIPE_SH=
ADER_FRAGMENT);
>>> diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/=
nv50/nv50_tex.c
>>> index c4ca096..bef548b 100644
>>> --- a/src/gallium/drivers/nv50/nv50_tex.c
>>> +++ b/src/gallium/drivers/nv50/nv50_tex.c
>>> @@ -199,16 +199,18 @@ nv50_tex_validate(struct nv50_context *nv50)
>>> =A0{
>>> =A0 =A0 =A0 =A0struct nouveau_stateobj *so;
>>> =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50->screen->tesla;
>>> - =A0 =A0 =A0 unsigned p, push, nrlc;
>>> + =A0 =A0 =A0 unsigned p, start, push, nrlc;
>>>
>>> - =A0 =A0 =A0 for (nrlc =3D 0, push =3D 0, p =3D 0; p < PIPE_SHADER_TYP=
ES; ++p) {
>>> + =A0 =A0 =A0 for (nrlc =3D 0, start =3D 0, push =3D 0, p =3D 0; p < PI=
PE_SHADER_TYPES; ++p) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 start +=3D MAX2(nv50->miptree_nr[p], nv50=
->state.miptree_nr[p]);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0push +=3D MAX2(nv50->miptree_nr[p], nv50=
->state.miptree_nr[p]);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nrlc +=3D nv50->miptree_nr[p];
>>> =A0 =A0 =A0 =A0}
>>> - =A0 =A0 =A0 push =3D push * 11 + 23 * PIPE_SHADER_TYPES + 4;
>>> + =A0 =A0 =A0 start =3D start * 2 + 4 * PIPE_SHADER_TYPES + 2;
>>> + =A0 =A0 =A0 push =3D push * 9 + 19 * PIPE_SHADER_TYPES + 2;
>>> =A0 =A0 =A0 =A0nrlc =3D nrlc * 2 + 2 * PIPE_SHADER_TYPES;
>>>
>>> - =A0 =A0 =A0 so =3D so_new(push, nrlc);
>>> + =A0 =A0 =A0 so =3D so_new(start, push, nrlc);
>>>
>>> =A0 =A0 =A0 =A0if (nv50_validate_textures(nv50, so, PIPE_SHADER_VERTEX)=
 =3D=3D FALSE ||
>>> =A0 =A0 =A0 =A0 =A0 =A0nv50_validate_textures(nv50, so, PIPE_SHADER_FRA=
GMENT) =3D=3D FALSE) {
>>> diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/=
nv50/nv50_vbo.c
>>> index 602adfc..5186960 100644
>>> --- a/src/gallium/drivers/nv50/nv50_vbo.c
>>> +++ b/src/gallium/drivers/nv50/nv50_vbo.c
>>> @@ -350,7 +350,7 @@ nv50_vbo_static_attrib(struct nv50_context *nv50, u=
nsigned attrib,
>>>
>>> =A0 =A0 =A0 =A0so =3D *pso;
>>> =A0 =A0 =A0 =A0if (!so)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 *pso =3D so =3D so_new(nv50->vtxelt_nr * =
5, 0);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *pso =3D so =3D so_new(nv50->vtxelt_nr, n=
v50->vtxelt_nr * 4, 0);
>>>
>>> =A0 =A0 =A0 =A0switch (ve->nr_components) {
>>> =A0 =A0 =A0 =A0case 4:
>>> @@ -411,8 +411,8 @@ nv50_vbo_validate(struct nv50_context *nv50)
>>> =A0 =A0 =A0 =A0n_ve =3D MAX2(nv50->vtxelt_nr, nv50->state.vtxelt_nr);
>>>
>>> =A0 =A0 =A0 =A0vtxattr =3D NULL;
>>> - =A0 =A0 =A0 vtxbuf =3D so_new(n_ve * 7, nv50->vtxelt_nr * 4);
>>> - =A0 =A0 =A0 vtxfmt =3D so_new(n_ve + 1, 0);
>>> + =A0 =A0 =A0 vtxbuf =3D so_new(n_ve * 2, n_ve * 5, nv50->vtxelt_nr * 4=
);
>>> + =A0 =A0 =A0 vtxfmt =3D so_new(1, n_ve, 0);
>>> =A0 =A0 =A0 =A0so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(0),=
 n_ve);
>>>
>>> =A0 =A0 =A0 =A0for (i =3D 0; i < nv50->vtxelt_nr; i++) {
>>> --
>>> 1.6.6.rc4
>>>
>>>
>>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
