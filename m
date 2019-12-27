From: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Flickering Nvidia GeForce GT210
Date: Fri, 27 Dec 2019 13:45:19 +0000
Message-ID: <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>,
 <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1613140919=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1613140919==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_"

--_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The issue is like this.:

https://youtu.be/4YQSL3xWrJA

I have some tearing and sometimes flickering, just screen off and on sudden=
ly in shorts periods of time.

I have this problem with videos in YouTube using Firefox, and local videos =
using vlc and MPlayer for example.


Enviado desde mi Samsung Mobile de Claro



-------- Original message --------
From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date: 12/27/19 7:40 AM (GMT-06:00)
To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210

And when you say "flickering", do you really mean some kind of
decoding failure with blocks being off or whatever? Or maybe a frame
ordering issue (where old frames appear instead of new ones
sometimes)? Or just regular tearing?

Is your video player using GL output, VDPAU output (and vdpau
decoding), or Xv? (What video player are you using?)

On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
<jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
>
> I'm using xorg and nouveau, not modesetting.
>
>
> Thanks for your response.
>
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Date: 12/27/19 7:31 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> using -- nouveau or modesetting?
>
> On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > Hi mates,
> >
> > First to all thanks for your help.
> >
> > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlin=
ux, but I have some flickering issues when playing videos, only in the vide=
o windows.
> >
> > Sometimes I can see some flickering when scrolling.
> >
> > Please help. I don't know how to fix it.
> >
> >
> > Atte. Jairo Quintanilla
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div dir=3D"auto">
<div dir=3D"auto">The issue is like this.:</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">https://youtu.be/4YQSL3xWrJA</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I have some tearing and sometimes flickering, just screen=
 off and on suddenly in shorts periods of time.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I have this problem with videos in YouTube using Firefox,=
 and local videos using vlc and MPlayer for example.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"x_composer_signature" dir=3D"auto">
<div dir=3D"auto" style=3D"font-size:85%; color:#575757">Enviado desde mi S=
amsung Mobile de Claro</div>
</div>
<div dir=3D"auto"><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>-------- Original message --------</div>
<div>From: Ilia Mirkin &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt; </div>
<div>Date: 12/27/19 7:40 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; </div>
<div>Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">And when you say &quot;flickering&quot;, do you re=
ally mean some kind of<br>
decoding failure with blocks being off or whatever? Or maybe a frame<br>
ordering issue (where old frames appear instead of new ones<br>
sometimes)? Or just regular tearing?<br>
<br>
Is your video player using GL output, VDPAU output (and vdpau<br>
decoding), or Xv? (What video player are you using?)<br>
<br>
On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla<br>
&lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br>
&gt;<br>
&gt; I'm using xorg and nouveau, not modesetting.<br>
&gt;<br>
&gt;<br>
&gt; Thanks for your response.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -------- Original message --------<br>
&gt; From: Ilia Mirkin &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br>
&gt; Date: 12/27/19 7:31 AM (GMT-06:00)<br>
&gt; To: Jairo Quintanilla &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt;<br>
&gt; Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt;<br>
&gt; Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you=
<br>
&gt; using -- nouveau or modesetting?<br>
&gt;<br>
&gt; On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&gt; &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi mates,<br>
&gt; &gt;<br>
&gt; &gt; First to all thanks for your help.<br>
&gt; &gt;<br>
&gt; &gt; I've installed Nouveau driver for my Nvidia GeForce GT210 using A=
rchlinux, but I have some flickering issues when playing videos, only in th=
e video windows.<br>
&gt; &gt;<br>
&gt; &gt; Sometimes I can see some flickering when scrolling.<br>
&gt; &gt;<br>
&gt; &gt; Please help. I don't know how to fix it.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Atte. Jairo Quintanilla<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Nouveau mailing list<br>
&gt; &gt; Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau=
">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</body>
</html>

--_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_--

--===============1613140919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1613140919==--
