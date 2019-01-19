From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH xf86-video-nouveau] xv: fix build warning
 regarding const qualifier
Date: Sat, 19 Jan 2019 18:37:41 -0500
Message-ID: <CA+iOQUHmKdwSzsySzfp+yJX9D9n=Xjf=wg1JvnAmb1y=VTjNbQ@mail.gmail.com>
References: <20190119233042.7979-1-rhyskidd@gmail.com>
 <CAKb7UvgS66eSyEWj-3k5kjvEffmpG5Oyu1h66xYcTBET7FfSuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0250434445=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgS66eSyEWj-3k5kjvEffmpG5Oyu1h66xYcTBET7FfSuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0250434445==
Content-Type: multipart/alternative; boundary="000000000000cd4e63057fd81dd2"

--000000000000cd4e63057fd81dd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Jan 2019 at 18:32, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> Is vlCreateAdaptorXvMC just silly, or does it really want to take
> ownership of the name pointer?
>

vlCreateAdaptorXvMC( ) doesn't need to take over ownership of the name
pointer, so yes - I guess it's being silly in one respect by not being
specific about const.


>
> On Sat, Jan 19, 2019 at 6:30 PM Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Fixes warning with gcc 8.2:
> >
> > nouveau_xv.c: In function =E2=80=98NVInitVideo=E2=80=99:
> > nouveau_xv.c:2247:68: warning: passing argument 2 of
> =E2=80=98vlCreateAdaptorXvMC=E2=80=99 discards =E2=80=98const=E2=80=99 qu=
alifier from pointer target type
> [-Wdiscarded-qualifiers]
> >     adaptorsXvMC[0] =3D vlCreateAdaptorXvMC(pScreen,
> textureAdaptor[0]->name);
> >
> ~~~~~~~~~~~~~~~~~^~~~~~
> > In file included from nouveau_xv.c:42:
> > vl_hwmc.h:6:63: note: expected =E2=80=98char *=E2=80=99 but argument is=
 of type =E2=80=98const
> char *=E2=80=99
> >  XF86MCAdaptorPtr vlCreateAdaptorXvMC(ScreenPtr pScreen, char
> *xv_adaptor_name);
> >
> ~~~~~~^~~~~~~~~~~~~~~
> >
> > Signed-off-by: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  src/nouveau_xv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
> > index a7ec21a..3258ef7 100644
> > --- a/src/nouveau_xv.c
> > +++ b/src/nouveau_xv.c
> > @@ -2244,7 +2244,7 @@ NVInitVideo(ScreenPtr pScreen)
> >                 XF86MCAdaptorPtr *adaptorsXvMC =3D
> malloc(sizeof(XF86MCAdaptorPtr));
> >
> >                 if (adaptorsXvMC) {
> > -                       adaptorsXvMC[0] =3D vlCreateAdaptorXvMC(pScreen=
,
> textureAdaptor[0]->name);
> > +                       adaptorsXvMC[0] =3D vlCreateAdaptorXvMC(pScreen=
,
> (char *)textureAdaptor[0]->name);
> >
> >                         if (adaptorsXvMC[0]) {
> >                                 vlInitXvMC(pScreen, 1, adaptorsXvMC);
> > --
> > 2.19.1
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--000000000000cd4e63057fd81dd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 19 Jan 2019 at 18:32, Ilia Mirkin=
 &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Is vlCreateAdaptorXvMC just silly, or does it really want =
to take<br>
ownership of the name pointer?<br></blockquote><div><br></div><div>vlCreate=
AdaptorXvMC( ) doesn&#39;t need to take over ownership of the name pointer,=
 so yes - I guess it&#39;s being silly in one respect by not being specific=
 about const.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
On Sat, Jan 19, 2019 at 6:30 PM Rhys Kidd &lt;<a href=3D"mailto:rhyskidd@gm=
ail.com" target=3D"_blank">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Fixes warning with gcc 8.2:<br>
&gt;<br>
&gt; nouveau_xv.c: In function =E2=80=98NVInitVideo=E2=80=99:<br>
&gt; nouveau_xv.c:2247:68: warning: passing argument 2 of =E2=80=98vlCreate=
AdaptorXvMC=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Wdiscarded-qualifiers]<br>
&gt;=C2=A0 =C2=A0 =C2=A0adaptorsXvMC[0] =3D vlCreateAdaptorXvMC(pScreen, te=
xtureAdaptor[0]-&gt;name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~^~~~~~<br>
&gt; In file included from nouveau_xv.c:42:<br>
&gt; vl_hwmc.h:6:63: note: expected =E2=80=98char *=E2=80=99 but argument i=
s of type =E2=80=98const char *=E2=80=99<br>
&gt;=C2=A0 XF86MCAdaptorPtr vlCreateAdaptorXvMC(ScreenPtr pScreen, char *xv=
_adaptor_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~^~~~~~~~~=
~~~~~~<br>
&gt;<br>
&gt; Signed-off-by: Rhys Kidd &lt;<a href=3D"mailto:rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" tar=
get=3D"_blank">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 src/nouveau_xv.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c<br>
&gt; index a7ec21a..3258ef7 100644<br>
&gt; --- a/src/nouveau_xv.c<br>
&gt; +++ b/src/nouveau_xv.c<br>
&gt; @@ -2244,7 +2244,7 @@ NVInitVideo(ScreenPtr pScreen)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XF86MCAda=
ptorPtr *adaptorsXvMC =3D malloc(sizeof(XF86MCAdaptorPtr));<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (adapt=
orsXvMC) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0adaptorsXvMC[0] =3D vlCreateAdaptorXvMC(pScreen, textureAdapt=
or[0]-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0adaptorsXvMC[0] =3D vlCreateAdaptorXvMC(pScreen, (char *)text=
ureAdaptor[0]-&gt;name);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (adaptorsXvMC[0]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vlInitXvMC(pScreen, 1, adap=
torsXvMC);<br>
&gt; --<br>
&gt; 2.19.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nou=
veau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div></div>

--000000000000cd4e63057fd81dd2--

--===============0250434445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0250434445==--
