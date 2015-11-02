From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: help with push
Date: Mon, 2 Nov 2015 15:36:35 -0300
Message-ID: <CANbfre6bnDw2PDRvtA3ByHKk5qT6XdqD6+0gg+G89d7hoYYVew@mail.gmail.com>
References: <CANbfre6ywp5quasRAsF-69DtYAj5XY3GwKXK4HtUk92G-Y22gw@mail.gmail.com>
 <CAKb7Uvg7zgFCuez+FVEUiac6G0SbL8ptu_i08qyP8GeQhZDBtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1697617121=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg7zgFCuez+FVEUiac6G0SbL8ptu_i08qyP8GeQhZDBtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1697617121==
Content-Type: multipart/alternative; boundary=001a1147956e9cc31e0523930e45

--001a1147956e9cc31e0523930e45
Content-Type: text/plain; charset=UTF-8

But at the time the mesa3d file
src/gallium/drivers/nouveau/nv30/nv30_screen.c
is called and when the various PUSH_DATA begin to be called there is not yet
a call to nouveau_pushbuf_space. So it would generate a seg fault in
push->curr. Again, sorry for the confusion and thanks for the reply.
Awaiting
for an answer if possible. Thanks in advance.

2015-11-02 14:44 GMT-03:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> See libdrm's pushbuf.c -- iirc push->cur points to a GART-mapped bo.
>
> http://cgit.freedesktop.org/mesa/drm/tree/nouveau/pushbuf.c#n682
>
> nouveau_pushbuf_data(push, NULL, 0, 0);
> nouveau_bo_ref(bo, &nvpb->bo);
> nouveau_bo_ref(NULL, &bo);
>
> nvpb->bgn = nvpb->bo->map;
> nvpb->ptr = nvpb->bgn;
> push->cur = nvpb->bgn;
> push->end = push->cur + (nvpb->bo->size / 4);
> push->end -= 2 + push->rsvd_kick; /* space for suffix */
>
> Not sure what problem you're trying to solve.
>
>   -ilia
>
> On Mon, Nov 2, 2015 at 12:31 PM, Daniel Melo Jorge da Cunha
> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi, sorry if I misunderstood everything...
> >
> > In the file src/gallium/drivers/nouveau/nv30/nv30_screen.c there is
> loans of
> > PUSH_DATA which is basically *push->curr = data;
> >
> > I'm thinking that somehow push->curr is the bo->map = drm_mmap(...)
> > that is called in nouveau_bo_map. But I cannot see how they are linked...
> > Because when nouveau_bo_map calls nouveau_bo_wait
> > push = cli_push_get(client, bo) returns NULL...
> >
> > Is push->curr the region of memory that we send data to the card?
> > If so, how is it mapped?
> > Has bo->map something to do with it? If so, how are they linked?
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
>

--001a1147956e9cc31e0523930e45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>But at the time the mesa3d file src/ga=
llium/drivers/nouveau/nv30/nv30_screen.c<br></div>is called and when the va=
rious PUSH_DATA begin to be called there is not yet<br></div>a call to<code=
> <span style=3D"font-family:arial,helvetica,sans-serif">nouveau_pushbuf_sp=
ace. So it would generate a seg fault in<br></span></code></div><code><span=
 style=3D"font-family:arial,helvetica,sans-serif">push-&gt;curr. Again, sor=
ry for the confusion and thanks for the reply. Awaiting<br></span></code></=
div><code><span style=3D"font-family:arial,helvetica,sans-serif">for an ans=
wer if possible. Thanks in advance.<br></span></code></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">2015-11-02 14:44 GMT-03:00 Ilia M=
irkin <span dir=3D"ltr">&lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=
=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</span>:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">See libdrm&#39;s pushbuf.c -- iirc push-&gt;cur points to a GART-ma=
pped bo.<br>
<br>
<a href=3D"http://cgit.freedesktop.org/mesa/drm/tree/nouveau/pushbuf.c#n682=
" rel=3D"noreferrer" target=3D"_blank">http://cgit.freedesktop.org/mesa/drm=
/tree/nouveau/pushbuf.c#n682</a><br>
<br>
nouveau_pushbuf_data(push, NULL, 0, 0);<br>
nouveau_bo_ref(bo, &amp;nvpb-&gt;bo);<br>
nouveau_bo_ref(NULL, &amp;bo);<br>
<br>
nvpb-&gt;bgn =3D nvpb-&gt;bo-&gt;map;<br>
nvpb-&gt;ptr =3D nvpb-&gt;bgn;<br>
push-&gt;cur =3D nvpb-&gt;bgn;<br>
push-&gt;end =3D push-&gt;cur + (nvpb-&gt;bo-&gt;size / 4);<br>
push-&gt;end -=3D 2 + push-&gt;rsvd_kick; /* space for suffix */<br>
<br>
Not sure what problem you&#39;re trying to solve.<br>
<br>
=C2=A0 -ilia<br>
<div><div class=3D"h5"><br>
On Mon, Nov 2, 2015 at 12:31 PM, Daniel Melo Jorge da Cunha<br>
&lt;<a href=3D"mailto:dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:=
<br>
&gt; Hi, sorry if I misunderstood everything...<br>
&gt;<br>
&gt; In the file src/gallium/drivers/nouveau/nv30/nv30_screen.c there is lo=
ans of<br>
&gt; PUSH_DATA which is basically *push-&gt;curr =3D data;<br>
&gt;<br>
&gt; I&#39;m thinking that somehow push-&gt;curr is the bo-&gt;map =3D drm_=
mmap(...)<br>
&gt; that is called in nouveau_bo_map. But I cannot see how they are linked=
...<br>
&gt; Because when nouveau_bo_map calls nouveau_bo_wait<br>
&gt; push =3D cli_push_get(client, bo) returns NULL...<br>
&gt;<br>
&gt; Is push-&gt;curr the region of memory that we send data to the card?<b=
r>
&gt; If so, how is it mapped?<br>
&gt; Has bo-&gt;map something to do with it? If so, how are they linked?<br=
>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">http://lists.freedesktop.org/mailman/list=
info/nouveau</a><br>
&gt;<br>
</blockquote></div><br></div>

--001a1147956e9cc31e0523930e45--

--===============1697617121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1697617121==--
