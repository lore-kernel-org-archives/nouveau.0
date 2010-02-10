From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: texture dimension limits in ddx
Date: Wed, 10 Feb 2010 14:49:09 -0500
Message-ID: <586c2acd1002101149i396e5178u9fcb3493078d658d@mail.gmail.com>
References: <b67489df1002091144vd1ee91fv3070b3dfd03cc7e7@mail.gmail.com>
	<b67489df1002101103x23245766hacf4dc63e35a49a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1002101103x23245766hacf4dc63e35a49a2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Feb 10, 2010 at 2:03 PM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Feb 9, 2010 at 8:44 PM, Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> in nv10_exa.c :
>> check_texture does :
>>       if (w > 2046 || h > 2046)
>>                NOUVEAU_FALLBACK("picture too large, %dx%d\n", w, h);
>> check_render_target does :
>>        if (w > 4096 || h > 4096)
>>                return FALSE;
>>
>> So we have different size limits for the source and the destination ?
>>
>> Another thing is that nv20 uses nv10_exa.c code, and the limit in
>> check_texture could be increased for nv20 according to curro :
>> 01:03 < curro_> shining: btw, about the 2048x2048 fallback, i'm quite
>> sure it's wrong for nv2x
>> 01:05 < curro_> shining: it can do 4096x4096 with no problems, IIRC
>>
>> And finally I saw that nouveau_exa_init does this :
>>       if (pNv->Architecture >= NV_ARCH_50) {
>>                exa->maxX = 8192;
>>                exa->maxY = 8192;
>>        } else
>>        if (pNv->Architecture >= NV_ARCH_20) {
>>                exa->maxX = 4096;
>>                exa->maxY = 4096;
>>        } else {
>>                exa->maxX = 2048;
>>                exa->maxY = 2048;
>>        }
>>
>> But these 3 values are hardcoded everywhere in the code.
>> It might not be possible to use exa->maxX/Y directly as some functions
>> like check_texture / check_render_target above don't seem to have
>> access to them.
>> Maybe some constants could be defined instead and used everywhere ?
>> #define NV04_MAX 2048
>> #define NV20_MAX 4096
>> #define NV50_MAX 8192
>> or something.
>>
>
> Or to put this another way, I would like to give a name to all the values below.
> Actually nouveau_xv.c already defines some constants, but I have no
> idea if it would make any sense to use them in the other source files.
>
> src/nouveau_exa.c:              exa->maxX = 8192;
> src/nouveau_exa.c:              exa->maxY = 8192;
> src/nouveau_exa.c:              exa->maxX = 4096;
> src/nouveau_exa.c:              exa->maxY = 4096;
> src/nouveau_exa.c:              exa->maxX = 2048;
> src/nouveau_exa.c:              exa->maxY = 2048;
> src/nouveau_xv.c:#define IMAGE_MAX_W 2046
> src/nouveau_xv.c:#define IMAGE_MAX_H 2046
> src/nouveau_xv.c:#define TEX_IMAGE_MAX_W 4096
> src/nouveau_xv.c:#define TEX_IMAGE_MAX_H 4096
> src/nv10_exa.c: if (w > 2046 || h > 2046)
> src/nv10_exa.c: if (w > 4096 || h > 4096)
> src/nv30_exa.c: if ((w > 4096) || (h > 4096))
> src/nv30_exa.c: int w=4096;
> src/nv30_exa.c: int h=4096;
> src/nv30_exa.c: int pitch=4096*4;
> src/nv30_xv_tex.c:      if (drw_w > 4096 || drw_h > 4096) {
> src/nv40_exa.c: if ((w > 4096) || (h > 4096))
> src/nv40_xv_tex.c:      if (drw_w > 4096 || drw_h > 4096) {
> src/nv50_exa.c: if (ppict->pDrawable->width > 8192 ||
> src/nv50_exa.c:     ppict->pDrawable->height > 8192)
> src/nv50_exa.c: if (ppict->pDrawable->width > 8192 ||
> src/nv50_exa.c:     ppict->pDrawable->height > 8192)
> src/vl_hwmc.c:  2048,
> src/vl_hwmc.c:  2048,
> src/vl_hwmc.c:  2048,
> src/vl_hwmc.c:  2048,

It makes sense to clean this up if you're up to it. Some are max
texture sizes and others are max render target sizes like you said. If
you can figure out the limits of the various HW classes you can
substitute them into the code. Just remember, if a surface is both a
texture and a render target you'll have to use the smaller of the two
limits.

Maybe it makes sense to add it to nouveau_class.h if it's not already
there in some form so it can be used everywhere.

The value in vl_hwmc.c is for XvMC surfaces, which are used both as
textures and RTs and I just chose the a small reasonable value, it's
not based on any HW limits.
