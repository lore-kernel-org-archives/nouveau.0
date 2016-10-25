From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/17] drm/nouveau/core: add missing header
	dependencies
Date: Tue, 25 Oct 2016 08:23:11 +0800
Message-ID: <CA+DQWkxWL527o97E5agC6MER0CtEvHTrDGYC2eWOdDFoygpU0Q@mail.gmail.com>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
 <CAEXux-ZYknEnU=D4qA_xv162vXF4UpVG-W9eNk68ahQoPP0ozQ@mail.gmail.com>
 <CA+DQWkwyKzpU+oPxsz1LAPB34gQRuJGchHqzj-4262dnYdsFFw@mail.gmail.com>
 <CAEXux-Y+MXCawYsWm3gNgjA+7y6iVqqJN0n_cLNqR2U33GRWrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1759149895=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEXux-Y+MXCawYsWm3gNgjA+7y6iVqqJN0n_cLNqR2U33GRWrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org, Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, tang.qiang007-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, han.fei-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1759149895==
Content-Type: multipart/alternative; boundary=f403045d9aaa7f6665053fa58380

--f403045d9aaa7f6665053fa58380
Content-Type: text/plain; charset=UTF-8

On 24 October 2016 at 23:43, Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> 2016-10-24 9:13 GMT+02:00 Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> >
> >
> > On 23 October 2016 at 01:32, Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> I think it would be better to squash those commits:
> >> 1. for the includes
> >> 2. for static declerations
> >>
> > OK, I have resent new patch that squash those commits.
> >
>
> thanks, this is much easier to review and keeps the git history clean :)
> Will try to make a test with those patches over the next days, but it
> looks fine as it is already.
>
>
I worked them out on next-20161021.


> >>
> >> 2016-10-22 11:41 GMT+02:00 Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> >> > We get 2 warnings when building kernel with W=1:
> >> > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:34:1: warning: no
> previous
> >> > prototype for 'nvkm_firmware_get' [-Wmissing-prototypes]
> >> > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:58:1: warning: no
> previous
> >> > prototype for 'nvkm_firmware_put' [-Wmissing-prototypes]
> >> >
> >> > In fact, these functions are declared in
> >> > drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h.
> >> > So this patch adds missing header dependencies.
> >> >
> >> > Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> > ---
> >> >  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> >> > b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> >> > index 34ecd4a..058ff46 100644
> >> > --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> >> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> >> > @@ -20,6 +20,7 @@
> >> >   * DEALINGS IN THE SOFTWARE.
> >> >   */
> >> >  #include <core/device.h>
> >> > +#include <core/firmware.h>
> >> >
> >> >  /**
> >> >   * nvkm_firmware_get - load firmware from the official nvidia/chip/
> >> > directory
> >> > --
> >> > 2.7.4
> >> >
> >> > _______________________________________________
> >> > Nouveau mailing list
> >> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> >
>

--f403045d9aaa7f6665053fa58380
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 24 October 2016 at 23:43, Karol Herbst <span dir=3D"ltr">&lt;<a href=
=3D"mailto:karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span class=3D"gmail-">2016-10-24 9:13 GMT+02:00 Baoyou Xie &lt;<a href=3D"m=
ailto:baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;:<br>
&gt;<br>
&gt;<br>
&gt; On 23 October 2016 at 01:32, Karol Herbst &lt;<a href=3D"mailto:karolh=
erbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I think it would be better to squash those commits:<br>
&gt;&gt; 1. for the includes<br>
&gt;&gt; 2. for static declerations<br>
&gt;&gt;<br>
&gt; OK, I have resent new patch that squash those commits.<br>
&gt;<br>
<br>
</span>thanks, this is much easier to review and keeps the git history clea=
n :)<br>
Will try to make a test with those patches over the next days, but it<br>
looks fine as it is already.<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br></div></div></block=
quote><div>=C2=A0</div><div>I worked them out on next-20161021.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"gmail-HOEnZb"><div class=3D"gmail-h5">
&gt;&gt;<br>
&gt;&gt; 2016-10-22 11:41 GMT+02:00 Baoyou Xie &lt;<a href=3D"mailto:baoyou=
.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;:<br>
&gt;&gt; &gt; We get 2 warnings when building kernel with W=3D1:<br>
&gt;&gt; &gt; drivers/gpu/drm/nouveau/nvkm/<wbr>core/firmware.c:34:1: warni=
ng: no previous<br>
&gt;&gt; &gt; prototype for &#39;nvkm_firmware_get&#39; [-Wmissing-prototyp=
es]<br>
&gt;&gt; &gt; drivers/gpu/drm/nouveau/nvkm/<wbr>core/firmware.c:58:1: warni=
ng: no previous<br>
&gt;&gt; &gt; prototype for &#39;nvkm_firmware_put&#39; [-Wmissing-prototyp=
es]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In fact, these functions are declared in<br>
&gt;&gt; &gt; drivers/gpu/drm/nouveau/<wbr>include/nvkm/core/firmware.h.<br=
>
&gt;&gt; &gt; So this patch adds missing header dependencies.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@li=
naro.org">baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/nouveau/nvkm/<wbr>core/firmware.c | 1 +=
<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.=
c<br>
&gt;&gt; &gt; b/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c<br>
&gt;&gt; &gt; index 34ecd4a..058ff46 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c<br>
&gt;&gt; &gt; @@ -20,6 +20,7 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* DEALINGS IN THE SOFTWARE.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;=C2=A0 #include &lt;core/device.h&gt;<br>
&gt;&gt; &gt; +#include &lt;core/firmware.h&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 /**<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* nvkm_firmware_get - load firmware from the offi=
cial nvidia/chip/<br>
&gt;&gt; &gt; directory<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.7.4<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Nouveau mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau@list=
s.freedesktop.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nou=
veau" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<w=
br>mailman/listinfo/nouveau</a><br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--f403045d9aaa7f6665053fa58380--

--===============1759149895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1759149895==--
