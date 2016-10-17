From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau on a Jetson TK1 problems
Date: Mon, 17 Oct 2016 07:21:19 +0200
Message-ID: <CAEXux-YX0WveOKxUdgQGje1zSsHeBGe2C8_GZCQpLpyZx3uM6Q@mail.gmail.com>
References: <e880adbd-fe20-cb09-5da8-5a5775908557@centurylink.net>
 <CAOnawYoT0zV_M-qoS-dvRv_KaV80sWh8yd3jM5Mp_CW2B00UNA@mail.gmail.com>
 <CAKb7UvjP9sVbbgpr8a7pUxF6DWj+VmiYwFmc8g6nY0uwD=k__Q@mail.gmail.com>
 <CAOnawYrA6a9yYR+=p3mnWm9xShzxtuC8OchpfUkeKZ5eTxc6cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1418712412=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAOnawYrA6a9yYR+=p3mnWm9xShzxtuC8OchpfUkeKZ5eTxc6cg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?B?QyBCZXJnc3Ryw7Zt?= <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1418712412==
Content-Type: multipart/alternative; boundary=001a113f28b6145bd5053f08bf63

--001a113f28b6145bd5053f08bf63
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

mhh, I thought nouveau _is_ the new thing officially for tegra? Or did I
miss anything?

On 17 Oct 2016 05:59, "C Bergstr=C3=B6m" <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org> wrote:

> On Mon, Oct 17, 2016 at 11:48 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> wrote:
> > On Sun, Oct 16, 2016 at 11:39 PM, C Bergstr=C3=B6m <cbergstrom@pathscal=
e.com>
> wrote:
> >> Is there any particular reason you're not using the open source NVIDIA
> >> Tegra drivers?
> >>
> >> This is what is being used for the TX1 (Sorry I don't know if it's the
> >> same for the TK1)
> >> http://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-3.10.git;a=3Dsummary
> >
> > That's ... not particularly helpful. Presumably non-upstream and the
> > fact that it's ancient are turn-offs. Either way, he seems to have a
> > desire to try to get nouveau going.
>
> Compared to buggy, not working and pointless?
>
> "ancient" it's like saying everything that RH ships is worthless..
>
> I was hoping not to get trolled and instead to get sincere feedback
> from the user about what his needs might be. It may be simple
> curiosity or actually something technical. So I'm happy you may be
> able to help him on his mission, but attacks (esp stupid ones) aren't
> appreciated.
>
> >
> >>
> >> On Mon, Oct 17, 2016 at 11:11 AM, ben <benjaminscott-Og7d35KcFB1bTxZzi51Fyw@public.gmane.org>
> wrote:
> >>> I hope this is a good mailing list for this problem. I have a Jetson
> TK1
> >>> board and I am trying to get the nouveau drivers running on it withou=
t
> >>> success. I am using the following:
> >>>
> >>> Nouveau linux kernel 4.8.0-rc4+
> >>> Nouveau DRM git master
> >>> xf86-video-nouveau git master
> >>> Gnurou xserver  git branch GK20A
> >>>
> >>> My base system is Debian.
> >>>
> >>> When I try to start X I get:  X: drmmode_display.c:783:
> drmmode_crtc_init:
> >>> Assertion `ret =3D=3D 0' failed. There is also a kernel log message: =
[drm]
> >>> Cannot find any crtc or sizes - going 1024x768
> >
> > I don't think I've seen this before. The odd thing about the TK1 (and
> > TX1, I believe), is that the GK20A device doesn't have any display
> > capabilities - those are left up to tegra. Sounds like you're trying
> > to use the nouveau ddx as the primary, which fails as there are no
> > CRTC's. I believe Gnurou's xserver hacks rely on you using glamor (and
> > thus the modesetting xorg ddx). Is that what you're using? Can you
> > provide an xorg log?
> >
> > Cheers,
> >
> >   -ilia
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a113f28b6145bd5053f08bf63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">mhh, I thought nouveau _is_ the new thing officially for teg=
ra? Or did I miss anything?</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 Oct 2016 05=
:59, &quot;C Bergstr=C3=B6m&quot; &lt;<a href=3D"mailto:cbergstrom@pathscal=
e.com">cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org</a>&gt; wrote:<br type=3D"attribution"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Mon, Oct 17, 2016 at 11:48 AM, Ilia Mirkin &l=
t;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrot=
e:<br>
&gt; On Sun, Oct 16, 2016 at 11:39 PM, C Bergstr=C3=B6m &lt;<a href=3D"mail=
to:cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org">cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt; Is there any particular reason you&#39;re not using the open sourc=
e NVIDIA<br>
&gt;&gt; Tegra drivers?<br>
&gt;&gt;<br>
&gt;&gt; This is what is being used for the TX1 (Sorry I don&#39;t know if =
it&#39;s the<br>
&gt;&gt; same for the TK1)<br>
&gt;&gt; <a href=3D"http://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-3.10.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http://nv-tegra.nvidia.com=
/<wbr>gitweb/?p=3Dlinux-3.10.git;a=3D<wbr>summary</a><br>
&gt;<br>
&gt; That&#39;s ... not particularly helpful. Presumably non-upstream and t=
he<br>
&gt; fact that it&#39;s ancient are turn-offs. Either way, he seems to have=
 a<br>
&gt; desire to try to get nouveau going.<br>
<br>
Compared to buggy, not working and pointless?<br>
<br>
&quot;ancient&quot; it&#39;s like saying everything that RH ships is worthl=
ess..<br>
<br>
I was hoping not to get trolled and instead to get sincere feedback<br>
from the user about what his needs might be. It may be simple<br>
curiosity or actually something technical. So I&#39;m happy you may be<br>
able to help him on his mission, but attacks (esp stupid ones) aren&#39;t<b=
r>
appreciated.<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Oct 17, 2016 at 11:11 AM, ben &lt;<a href=3D"mailto:benjam=
inscott-Og7d35KcFB1bTxZzi51Fyw@public.gmane.org">benjaminscott-Og7d35KcFB1bTxZzi51Fyw@public.gmane.org</a><wbr>&gt; wrote:<=
br>
&gt;&gt;&gt; I hope this is a good mailing list for this problem. I have a =
Jetson TK1<br>
&gt;&gt;&gt; board and I am trying to get the nouveau drivers running on it=
 without<br>
&gt;&gt;&gt; success. I am using the following:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Nouveau linux kernel 4.8.0-rc4+<br>
&gt;&gt;&gt; Nouveau DRM git master<br>
&gt;&gt;&gt; xf86-video-nouveau git master<br>
&gt;&gt;&gt; Gnurou xserver=C2=A0 git branch GK20A<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My base system is Debian.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; When I try to start X I get:=C2=A0 X: drmmode_display.c:783: d=
rmmode_crtc_init:<br>
&gt;&gt;&gt; Assertion `ret =3D=3D 0&#39; failed. There is also a kernel lo=
g message: [drm]<br>
&gt;&gt;&gt; Cannot find any crtc or sizes - going 1024x768<br>
&gt;<br>
&gt; I don&#39;t think I&#39;ve seen this before. The odd thing about the T=
K1 (and<br>
&gt; TX1, I believe), is that the GK20A device doesn&#39;t have any display=
<br>
&gt; capabilities - those are left up to tegra. Sounds like you&#39;re tryi=
ng<br>
&gt; to use the nouveau ddx as the primary, which fails as there are no<br>
&gt; CRTC&#39;s. I believe Gnurou&#39;s xserver hacks rely on you using gla=
mor (and<br>
&gt; thus the modesetting xorg ddx). Is that what you&#39;re using? Can you=
<br>
&gt; provide an xorg log?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0-ilia<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div></div>

--001a113f28b6145bd5053f08bf63--

--===============1418712412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1418712412==--
