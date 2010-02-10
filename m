From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: texture dimension limits in ddx
Date: Wed, 10 Feb 2010 20:03:32 +0100
Message-ID: <b67489df1002101103x23245766hacf4dc63e35a49a2@mail.gmail.com>
References: <b67489df1002091144vd1ee91fv3070b3dfd03cc7e7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1002091144vd1ee91fv3070b3dfd03cc7e7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 9, 2010 at 8:44 PM, Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> in nv10_exa.c :
> check_texture does :
> =A0 =A0 =A0 if (w > 2046 || h > 2046)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_FALLBACK("picture too large, %dx%d=
\n", w, h);
> check_render_target does :
> =A0 =A0 =A0 =A0if (w > 4096 || h > 4096)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
>
> So we have different size limits for the source and the destination ?
>
> Another thing is that nv20 uses nv10_exa.c code, and the limit in
> check_texture could be increased for nv20 according to curro :
> 01:03 < curro_> shining: btw, about the 2048x2048 fallback, i'm quite
> sure it's wrong for nv2x
> 01:05 < curro_> shining: it can do 4096x4096 with no problems, IIRC
>
> And finally I saw that nouveau_exa_init does this :
> =A0 =A0 =A0 if (pNv->Architecture >=3D NV_ARCH_50) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exa->maxX =3D 8192;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exa->maxY =3D 8192;
> =A0 =A0 =A0 =A0} else
> =A0 =A0 =A0 =A0if (pNv->Architecture >=3D NV_ARCH_20) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exa->maxX =3D 4096;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exa->maxY =3D 4096;
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exa->maxX =3D 2048;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exa->maxY =3D 2048;
> =A0 =A0 =A0 =A0}
>
> But these 3 values are hardcoded everywhere in the code.
> It might not be possible to use exa->maxX/Y directly as some functions
> like check_texture / check_render_target above don't seem to have
> access to them.
> Maybe some constants could be defined instead and used everywhere ?
> #define NV04_MAX 2048
> #define NV20_MAX 4096
> #define NV50_MAX 8192
> or something.
>

Or to put this another way, I would like to give a name to all the values b=
elow.
Actually nouveau_xv.c already defines some constants, but I have no
idea if it would make any sense to use them in the other source files.

src/nouveau_exa.c:		exa->maxX =3D 8192;
src/nouveau_exa.c:		exa->maxY =3D 8192;
src/nouveau_exa.c:		exa->maxX =3D 4096;
src/nouveau_exa.c:		exa->maxY =3D 4096;
src/nouveau_exa.c:		exa->maxX =3D 2048;
src/nouveau_exa.c:		exa->maxY =3D 2048;
src/nouveau_xv.c:#define IMAGE_MAX_W 2046
src/nouveau_xv.c:#define IMAGE_MAX_H 2046
src/nouveau_xv.c:#define TEX_IMAGE_MAX_W 4096
src/nouveau_xv.c:#define TEX_IMAGE_MAX_H 4096
src/nv10_exa.c:	if (w > 2046 || h > 2046)
src/nv10_exa.c:	if (w > 4096 || h > 4096)
src/nv30_exa.c:	if ((w > 4096) || (h > 4096))
src/nv30_exa.c:	int w=3D4096;
src/nv30_exa.c:	int h=3D4096;
src/nv30_exa.c:	int pitch=3D4096*4;
src/nv30_xv_tex.c:	if (drw_w > 4096 || drw_h > 4096) {
src/nv40_exa.c:	if ((w > 4096) || (h > 4096))
src/nv40_xv_tex.c:	if (drw_w > 4096 || drw_h > 4096) {
src/nv50_exa.c:	if (ppict->pDrawable->width > 8192 ||
src/nv50_exa.c:	    ppict->pDrawable->height > 8192)
src/nv50_exa.c:	if (ppict->pDrawable->width > 8192 ||
src/nv50_exa.c:	    ppict->pDrawable->height > 8192)
src/vl_hwmc.c:	2048,
src/vl_hwmc.c:	2048,
src/vl_hwmc.c:	2048,
src/vl_hwmc.c:	2048,
