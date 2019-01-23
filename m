From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH xf86-video-nouveau] wfb: Fix missing init
 function decls behind FB_ACCESS_WRAPPER
Date: Wed, 23 Jan 2019 12:22:22 -0500
Message-ID: <CA+iOQUE==3Kg1aGSCnRF-=t7Kzwr2rXGWJnwB3Bw-969R-Zt4A@mail.gmail.com>
References: <20190121002008.31559-1-rhyskidd@gmail.com>
 <CAKb7Uvj0kCQaB3aFh1Esf=D+BhWG0Op_-54M4oW6pbi7N-ZDtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0133892188=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvj0kCQaB3aFh1Esf=D+BhWG0Op_-54M4oW6pbi7N-ZDtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============0133892188==
Content-Type: multipart/alternative; boundary="000000000000e1608c05802356c7"

--000000000000e1608c05802356c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 12:41 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> This causes nouveau_drv.so to not be loadable due to a missing
> wfbPictureInit. I'm not 100% sure what causes it -- it happens at
> runtime in the middle of probe, and I don't have wfb enabled. Either
> way, I'm going to revert this until we get a better idea of what's
> going on.
>

OK to revert, this patch must be exposing something else that is going on
with wrappedfb support on some setups.


> On Sun, Jan 20, 2019 at 7:20 PM Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Fixes warning with xserver 1.20 and gcc 8.2:
> >
> > nv_driver.c:1443:9: warning: implicit declaration of function
> =E2=80=98wfbScreenInit=E2=80=99; did you mean =E2=80=98fbScreenInit=E2=80=
=99?
> [-Wimplicit-function-declaration]
> >    ret =3D wfbScreenInit(pScreen, FBStart, pScrn->virtualX,
> >          ^~~~~~~~~~~~~
> >          fbScreenInit
> >
> > (See xserver 706e6d9cd074da606016ed4ecff51e9c2a822087)
> >
> > Signed-off-by: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  src/nv_include.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/src/nv_include.h b/src/nv_include.h
> > index de55570..6fdeeab 100644
> > --- a/src/nv_include.h
> > +++ b/src/nv_include.h
> > @@ -38,6 +38,7 @@
> >  #include "dixstruct.h"
> >  #include "scrnintstr.h"
> >
> > +#define FB_ACCESS_WRAPPER
> >  #include "fb.h"
> >
> >  #include "xf86cmap.h"
> > --
> > 2.19.1
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--000000000000e1608c05802356c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jan 23, 2019 at 12:41 AM Ilia Mirkin &lt;<a href=3D"mailto:imi=
rkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br></div><div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This causes nouveau_drv=
.so to not be loadable due to a missing<br>
wfbPictureInit. I&#39;m not 100% sure what causes it -- it happens at<br>
runtime in the middle of probe, and I don&#39;t have wfb enabled. Either<br=
>
way, I&#39;m going to revert this until we get a better idea of what&#39;s<=
br>
going on.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">OK to revert, th=
is patch must be exposing something else that is going on with wrappedfb su=
pport on some setups.</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
On Sun, Jan 20, 2019 at 7:20 PM Rhys Kidd &lt;<a href=3D"mailto:rhyskidd@gm=
ail.com" target=3D"_blank">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Fixes warning with xserver 1.20 and gcc 8.2:<br>
&gt;<br>
&gt; nv_driver.c:1443:9: warning: implicit declaration of function =E2=80=
=98wfbScreenInit=E2=80=99; did you mean =E2=80=98fbScreenInit=E2=80=99? [-W=
implicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 ret =3D wfbScreenInit(pScreen, FBStart, pScrn-&gt;virtual=
X,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fbScreenInit<br>
&gt;<br>
&gt; (See xserver 706e6d9cd074da606016ed4ecff51e9c2a822087)<br>
&gt;<br>
&gt; Signed-off-by: Rhys Kidd &lt;<a href=3D"mailto:rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" tar=
get=3D"_blank">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 src/nv_include.h | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/src/nv_include.h b/src/nv_include.h<br>
&gt; index de55570..6fdeeab 100644<br>
&gt; --- a/src/nv_include.h<br>
&gt; +++ b/src/nv_include.h<br>
&gt; @@ -38,6 +38,7 @@<br>
&gt;=C2=A0 #include &quot;dixstruct.h&quot;<br>
&gt;=C2=A0 #include &quot;scrnintstr.h&quot;<br>
&gt;<br>
&gt; +#define FB_ACCESS_WRAPPER<br>
&gt;=C2=A0 #include &quot;fb.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #include &quot;xf86cmap.h&quot;<br>
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

--000000000000e1608c05802356c7--

--===============0133892188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0133892188==--
