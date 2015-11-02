From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: help with push
Date: Mon, 2 Nov 2015 15:50:11 -0300
Message-ID: <CANbfre7AzH_E2A3YNDZuuiU4dxWv2vLH_jMgUuE-q+RO+_JWOQ@mail.gmail.com>
References: <CANbfre6ywp5quasRAsF-69DtYAj5XY3GwKXK4HtUk92G-Y22gw@mail.gmail.com>
 <CAKb7Uvg7zgFCuez+FVEUiac6G0SbL8ptu_i08qyP8GeQhZDBtQ@mail.gmail.com>
 <CANbfre6bnDw2PDRvtA3ByHKk5qT6XdqD6+0gg+G89d7hoYYVew@mail.gmail.com>
 <CAKb7Uvj5bFy165NitrBYTm-h79WA4wspVLhJY5i7rR1r8j=PBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0808484541=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvj5bFy165NitrBYTm-h79WA4wspVLhJY5i7rR1r8j=PBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============0808484541==
Content-Type: multipart/alternative; boundary=001a114a79123b01da0523933fe9

--001a114a79123b01da0523933fe9
Content-Type: text/plain; charset=UTF-8

SORRY SORRY SORRY :)
Thanks for the consideration.

2015-11-02 15:42 GMT-03:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> Errrr.... are you sure?
>
> nv30_screen_create starts with a bunch of stuff init'ing objects, and then
> does:
>
>    BEGIN_NV04(push, NV01_SUBC(3D, OBJECT), 1);
>    PUSH_DATA (push, screen->eng3d->handle);
>
> And as you can see in nv30_winsys.h:
>
> static inline void
> BEGIN_NV04(struct nouveau_pushbuf *push, int subc, int mthd, int size)
> {
>    PUSH_SPACE(push, size + 1);
>    PUSH_DATA (push, 0x00000000 | (size << 18) | (subc << 13) | mthd);
> }
>
> and PUSH_SPACE in turn calls nouveau_pushbuf_space.
>
>   -ilia
>
> On Mon, Nov 2, 2015 at 1:36 PM, Daniel Melo Jorge da Cunha
> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > But at the time the mesa3d file
> > src/gallium/drivers/nouveau/nv30/nv30_screen.c
> > is called and when the various PUSH_DATA begin to be called there is not
> yet
> > a call to nouveau_pushbuf_space. So it would generate a seg fault in
> > push->curr. Again, sorry for the confusion and thanks for the reply.
> > Awaiting
> > for an answer if possible. Thanks in advance.
> >
> > 2015-11-02 14:44 GMT-03:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:
> >>
> >> See libdrm's pushbuf.c -- iirc push->cur points to a GART-mapped bo.
> >>
> >> http://cgit.freedesktop.org/mesa/drm/tree/nouveau/pushbuf.c#n682
> >>
> >> nouveau_pushbuf_data(push, NULL, 0, 0);
> >> nouveau_bo_ref(bo, &nvpb->bo);
> >> nouveau_bo_ref(NULL, &bo);
> >>
> >> nvpb->bgn = nvpb->bo->map;
> >> nvpb->ptr = nvpb->bgn;
> >> push->cur = nvpb->bgn;
> >> push->end = push->cur + (nvpb->bo->size / 4);
> >> push->end -= 2 + push->rsvd_kick; /* space for suffix */
> >>
> >> Not sure what problem you're trying to solve.
> >>
> >>   -ilia
> >>
> >> On Mon, Nov 2, 2015 at 12:31 PM, Daniel Melo Jorge da Cunha
> >> <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > Hi, sorry if I misunderstood everything...
> >> >
> >> > In the file src/gallium/drivers/nouveau/nv30/nv30_screen.c there is
> >> > loans of
> >> > PUSH_DATA which is basically *push->curr = data;
> >> >
> >> > I'm thinking that somehow push->curr is the bo->map = drm_mmap(...)
> >> > that is called in nouveau_bo_map. But I cannot see how they are
> >> > linked...
> >> > Because when nouveau_bo_map calls nouveau_bo_wait
> >> > push = cli_push_get(client, bo) returns NULL...
> >> >
> >> > Is push->curr the region of memory that we send data to the card?
> >> > If so, how is it mapped?
> >> > Has bo->map something to do with it? If so, how are they linked?
> >> >
> >> > _______________________________________________
> >> > Nouveau mailing list
> >> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >> >
> >
> >
>

--001a114a79123b01da0523933fe9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>SORRY SORRY SORRY :)<br></div>Thanks for the consider=
ation.<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2=
015-11-02 15:42 GMT-03:00 Ilia Mirkin <span dir=3D"ltr">&lt;<a href=3D"mail=
to:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</sp=
an>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Errrr.... are you sure?<br>
<br>
nv30_screen_create starts with a bunch of stuff init&#39;ing objects, and t=
hen does:<br>
<br>
=C2=A0 =C2=A0BEGIN_NV04(push, NV01_SUBC(3D, OBJECT), 1);<br>
=C2=A0 =C2=A0PUSH_DATA (push, screen-&gt;eng3d-&gt;handle);<br>
<br>
And as you can see in nv30_winsys.h:<br>
<br>
static inline void<br>
BEGIN_NV04(struct nouveau_pushbuf *push, int subc, int mthd, int size)<br>
{<br>
=C2=A0 =C2=A0PUSH_SPACE(push, size + 1);<br>
=C2=A0 =C2=A0PUSH_DATA (push, 0x00000000 | (size &lt;&lt; 18) | (subc &lt;&=
lt; 13) | mthd);<br>
}<br>
<br>
and PUSH_SPACE in turn calls nouveau_pushbuf_space.<br>
<br>
=C2=A0 -ilia<br>
<br>
On Mon, Nov 2, 2015 at 1:36 PM, Daniel Melo Jorge da Cunha<br>
<div class=3D"HOEnZb"><div class=3D"h5">&lt;<a href=3D"mailto:dmjcunha@gmai=
l.com">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; But at the time the mesa3d file<br>
&gt; src/gallium/drivers/nouveau/nv30/nv30_screen.c<br>
&gt; is called and when the various PUSH_DATA begin to be called there is n=
ot yet<br>
&gt; a call to nouveau_pushbuf_space. So it would generate a seg fault in<b=
r>
&gt; push-&gt;curr. Again, sorry for the confusion and thanks for the reply=
.<br>
&gt; Awaiting<br>
&gt; for an answer if possible. Thanks in advance.<br>
&gt;<br>
&gt; 2015-11-02 14:44 GMT-03:00 Ilia Mirkin &lt;<a href=3D"mailto:imirkin@a=
lum.mit.edu">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; See libdrm&#39;s pushbuf.c -- iirc push-&gt;cur points to a GART-m=
apped bo.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://cgit.freedesktop.org/mesa/drm/tree/nouveau/pushb=
uf.c#n682" rel=3D"noreferrer" target=3D"_blank">http://cgit.freedesktop.org=
/mesa/drm/tree/nouveau/pushbuf.c#n682</a><br>
&gt;&gt;<br>
&gt;&gt; nouveau_pushbuf_data(push, NULL, 0, 0);<br>
&gt;&gt; nouveau_bo_ref(bo, &amp;nvpb-&gt;bo);<br>
&gt;&gt; nouveau_bo_ref(NULL, &amp;bo);<br>
&gt;&gt;<br>
&gt;&gt; nvpb-&gt;bgn =3D nvpb-&gt;bo-&gt;map;<br>
&gt;&gt; nvpb-&gt;ptr =3D nvpb-&gt;bgn;<br>
&gt;&gt; push-&gt;cur =3D nvpb-&gt;bgn;<br>
&gt;&gt; push-&gt;end =3D push-&gt;cur + (nvpb-&gt;bo-&gt;size / 4);<br>
&gt;&gt; push-&gt;end -=3D 2 + push-&gt;rsvd_kick; /* space for suffix */<b=
r>
&gt;&gt;<br>
&gt;&gt; Not sure what problem you&#39;re trying to solve.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Nov 2, 2015 at 12:31 PM, Daniel Melo Jorge da Cunha<br>
&gt;&gt; &lt;<a href=3D"mailto:dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&g=
t; wrote:<br>
&gt;&gt; &gt; Hi, sorry if I misunderstood everything...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In the file src/gallium/drivers/nouveau/nv30/nv30_screen.c th=
ere is<br>
&gt;&gt; &gt; loans of<br>
&gt;&gt; &gt; PUSH_DATA which is basically *push-&gt;curr =3D data;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m thinking that somehow push-&gt;curr is the bo-&gt;map=
 =3D drm_mmap(...)<br>
&gt;&gt; &gt; that is called in nouveau_bo_map. But I cannot see how they a=
re<br>
&gt;&gt; &gt; linked...<br>
&gt;&gt; &gt; Because when nouveau_bo_map calls nouveau_bo_wait<br>
&gt;&gt; &gt; push =3D cli_push_get(client, bo) returns NULL...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is push-&gt;curr the region of memory that we send data to th=
e card?<br>
&gt;&gt; &gt; If so, how is it mapped?<br>
&gt;&gt; &gt; Has bo-&gt;map something to do with it? If so, how are they l=
inked?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Nouveau mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau@list=
s.freedesktop.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouv=
eau" rel=3D"noreferrer" target=3D"_blank">http://lists.freedesktop.org/mail=
man/listinfo/nouveau</a><br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a114a79123b01da0523933fe9--

--===============0808484541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0808484541==--
