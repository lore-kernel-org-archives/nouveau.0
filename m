From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/17] drm/nouveau/core: add missing header
	dependencies
Date: Mon, 24 Oct 2016 15:13:36 +0800
Message-ID: <CA+DQWkwyKzpU+oPxsz1LAPB34gQRuJGchHqzj-4262dnYdsFFw@mail.gmail.com>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
 <CAEXux-ZYknEnU=D4qA_xv162vXF4UpVG-W9eNk68ahQoPP0ozQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1776865328=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEXux-ZYknEnU=D4qA_xv162vXF4UpVG-W9eNk68ahQoPP0ozQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============1776865328==
Content-Type: multipart/alternative; boundary=001a11c1584866245d053f9721d3

--001a11c1584866245d053f9721d3
Content-Type: text/plain; charset=UTF-8

On 23 October 2016 at 01:32, Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I think it would be better to squash those commits:
> 1. for the includes
> 2. for static declerations
>
> OK, I have resent new patch that squash those commits.


> 2016-10-22 11:41 GMT+02:00 Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > We get 2 warnings when building kernel with W=1:
> > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:34:1: warning: no previous
> prototype for 'nvkm_firmware_get' [-Wmissing-prototypes]
> > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:58:1: warning: no previous
> prototype for 'nvkm_firmware_put' [-Wmissing-prototypes]
> >
> > In fact, these functions are declared in
> > drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h.
> > So this patch adds missing header dependencies.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> > index 34ecd4a..058ff46 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> > @@ -20,6 +20,7 @@
> >   * DEALINGS IN THE SOFTWARE.
> >   */
> >  #include <core/device.h>
> > +#include <core/firmware.h>
> >
> >  /**
> >   * nvkm_firmware_get - load firmware from the official nvidia/chip/
> directory
> > --
> > 2.7.4
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a11c1584866245d053f9721d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 23 October 2016 at 01:32, Karol Herbst <span dir=3D"ltr">&lt;<a href=
=3D"mailto:karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
 think it would be better to squash those commits:<br>
1. for the includes<br>
2. for static declerations<br>
<div><div class=3D"gmail-h5"><br></div></div></blockquote><div>OK, I have r=
esent new patch that squash those commits.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail-h5">
2016-10-22 11:41 GMT+02:00 Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@lina=
ro.org">baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;:<br>
&gt; We get 2 warnings when building kernel with W=3D1:<br>
&gt; drivers/gpu/drm/nouveau/nvkm/<wbr>core/firmware.c:34:1: warning: no pr=
evious prototype for &#39;nvkm_firmware_get&#39; [-Wmissing-prototypes]<br>
&gt; drivers/gpu/drm/nouveau/nvkm/<wbr>core/firmware.c:58:1: warning: no pr=
evious prototype for &#39;nvkm_firmware_put&#39; [-Wmissing-prototypes]<br>
&gt;<br>
&gt; In fact, these functions are declared in<br>
&gt; drivers/gpu/drm/nouveau/<wbr>include/nvkm/core/firmware.h.<br>
&gt; So this patch adds missing header dependencies.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org"=
>baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nvkm/<wbr>core/firmware.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c b/drive=
rs/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c<br>
&gt; index 34ecd4a..058ff46 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/core/firmware.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0* DEALINGS IN THE SOFTWARE.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #include &lt;core/device.h&gt;<br>
&gt; +#include &lt;core/firmware.h&gt;<br>
&gt;<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* nvkm_firmware_get - load firmware from the official nvid=
ia/chip/ directory<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailma=
n/listinfo/nouveau</a><br>
</blockquote></div><br></div></div>

--001a11c1584866245d053f9721d3--

--===============1776865328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1776865328==--
