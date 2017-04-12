From: Alastair Bridgewater <alastair.bridgewater-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 10/10] drm/nouveau: Enable stereoscopic 3D
 output over HDMI
Date: Wed, 12 Apr 2017 11:22:57 -0400
Message-ID: <CAEcYz2Tf_WmX=XY0F-M4msYhf_pDC5WWQgfQKnb9UfQh3h9KEg@mail.gmail.com>
References: <20170117224204.27516-1-alastair.bridgewater@gmail.com>
 <20170411171125.10496-1-alastair.bridgewater@gmail.com>
 <20170411171125.10496-11-alastair.bridgewater@gmail.com>
 <CAKb7UvjimkWMZdi1-NwWDf6BK99d1epo+i1dwrONQYrcf+n57A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0652331927=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjimkWMZdi1-NwWDf6BK99d1epo+i1dwrONQYrcf+n57A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0652331927==
Content-Type: multipart/alternative; boundary=001a1143edfe84076e054cf9c8b6

--001a1143edfe84076e054cf9c8b6
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 1:32 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Tue, Apr 11, 2017 at 1:11 PM, Alastair Bridgewater
> <alastair.bridgewater-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > +       /* HDMI 3D support */
> > +       if ((disp->disp.oclass >= NV50_DISP)
>
> You probably meant G82_DISP. Although I don't know if there were any
> G80's with DP or HDMI. Either way, all that logic is in hdmig84.c (and
> newer), so ... :)
>

Having taken a closer look at the lower level code, I agree. It should be
G82_DISP.  Will correct in the v4 patch series (if there ends up being a v4
patch series). Good catch, and thank you!

-- Alastair Bridgewater

--001a1143edfe84076e054cf9c8b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Apr 11, 2017 at 1:32 PM, Ilia Mirkin <span dir=3D"=
ltr">&lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin@=
alum.mit.edu</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Ap=
r 11, 2017 at 1:11 PM, Alastair Bridgewater<br>
&lt;<a href=3D"mailto:alastair.bridgewater-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">alastair.bridgewater@=
gmail.<wbr>com</a>&gt; wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* HDMI 3D support */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((disp-&gt;disp.oclass &gt;=3D NV50_DIS=
P)<br>
<br>
</span>You probably meant G82_DISP. Although I don&#39;t know if there were=
 any<br>
G80&#39;s with DP or HDMI. Either way, all that logic is in hdmig84.c (and<=
br>
newer), so ... :)<br></blockquote><div><br></div><div>Having taken a closer=
 look at the lower level code, I agree. It should be G82_DISP.=C2=A0 Will c=
orrect in the v4 patch series (if there ends up being a v4 patch series). G=
ood catch, and thank you!<br><br></div><div>-- Alastair Bridgewater<br></di=
v></div></div></div>

--001a1143edfe84076e054cf9c8b6--

--===============0652331927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0652331927==--
