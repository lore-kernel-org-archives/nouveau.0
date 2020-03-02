From: Juan Manuel Alvarez <alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Problems with nouveau driver in Ubuntu 18.04
Date: Mon, 2 Mar 2020 13:58:05 +0000
Message-ID: <AM6PR09MB34475CCDB0389669141C7803FBE70@AM6PR09MB3447.eurprd09.prod.outlook.com>
References: <AM6PR09MB3447992A0A96D6377F7B9CF8FBEB0@AM6PR09MB3447.eurprd09.prod.outlook.com>,
 <CAKb7UvgpgsmddaVwSxF8mWhyPyOxZ9JxCG10hNXU=9UGEbvNwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1277883636=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgpgsmddaVwSxF8mWhyPyOxZ9JxCG10hNXU=9UGEbvNwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: es-ES
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

--===============1277883636==
Content-Language: es-ES
Content-Type: multipart/alternative;
	boundary="_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_"

--_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

It seems that it works! Thanks!

Regars!

________________________________
De: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Enviado: s=E1bado, 29 de febrero de 2020 20:25
Para: Juan Manuel Alvarez <alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Asunto: Re: [Nouveau] Problems with nouveau driver in Ubuntu 18.04

Can you try to figure out what was updated in the latest updates? My
guess would be that it's actually the software used to display your
desktop/etc which changed.

You can disable all accel by booting with nouveau.noaccel=3D1.

Cheers,

  -ilia

On Sat, Feb 29, 2020 at 12:31 AM Juan Manuel Alvarez
<alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hello,
>
>
> I use Ubuntu 18.04, since one of the last upgrades I have problems with n=
ouveau drivers.
>
> My screen look like the picture atteched.
>
>
>  [~]$ uname -a
> Linux  5.3.0-40-generic #32~18.04.1-Ubuntu SMP Mon Feb 3 14:05:59 UTC 202=
0 x86_64 x86_64 x86_64 GNU/Linux
>
> [~]$ inxi -Gx
> Graphics:  Card: NVIDIA G71GL [Quadro FX 1500] bus-ID: 01:00.0
>            Display Server: x11 (X.Org 1.20.5 ) driver: nouveau Resolution=
: 1920x1080-qEAkLYPErqw@public.gmane.org, 1920x1080-qEAkLYPErqw@public.gmane.org
>            OpenGL: renderer: NV49 version: 2.1 Mesa 19.2.8 Direct Render:=
 Yes
>
> I have tried to install Nvidia driver 304.137, but it seems is not suppor=
ted in Ubuntu 18.04 anymore.
>
>
> Are there any nouveau upgrade (that it is not on Canonical) that fixes th=
is problem?
>
> Or how I can downgrade nouveau driver to any previous one that works fine=
 in ubuntu 18.04 with my graphics card?
>
>
> Regards!
>
> Juanma
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi!</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
It seems that it works! Thanks!</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Regars!</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>De:</b> Ilia Mirkin &lt;imirkin=
@alum.mit.edu&gt;<br>
<b>Enviado:</b> s=E1bado, 29 de febrero de 2020 20:25<br>
<b>Para:</b> Juan Manuel Alvarez &lt;alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt;<br>
<b>Cc:</b> nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org &lt;nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org&=
gt;<br>
<b>Asunto:</b> Re: [Nouveau] Problems with nouveau driver in Ubuntu 18.04</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Can you try to figure out what was updated in the =
latest updates? My<br>
guess would be that it's actually the software used to display your<br>
desktop/etc which changed.<br>
<br>
You can disable all accel by booting with nouveau.noaccel=3D1.<br>
<br>
Cheers,<br>
<br>
&nbsp; -ilia<br>
<br>
On Sat, Feb 29, 2020 at 12:31 AM Juan Manuel Alvarez<br>
&lt;alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt;<br>
&gt; I use Ubuntu 18.04, since one of the last upgrades I have problems wit=
h nouveau drivers.<br>
&gt;<br>
&gt; My screen look like the picture atteched.<br>
&gt;<br>
&gt;<br>
&gt;&nbsp; [~]$ uname -a<br>
&gt; Linux&nbsp; 5.3.0-40-generic #32~18.04.1-Ubuntu SMP Mon Feb 3 14:05:59=
 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux<br>
&gt;<br>
&gt; [~]$ inxi -Gx<br>
&gt; Graphics:&nbsp; Card: NVIDIA G71GL [Quadro FX 1500] bus-ID: 01:00.0<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disp=
lay Server: x11 (X.Org 1.20.5 ) driver: nouveau Resolution: 1920x1080-A9UFjWEnGtU@public.gmane.org=
hz, 1920x1080-qEAkLYPErqw@public.gmane.org<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Open=
GL: renderer: NV49 version: 2.1 Mesa 19.2.8 Direct Render: Yes<br>
&gt;<br>
&gt; I have tried to install Nvidia driver 304.137, but it seems is not sup=
ported in Ubuntu 18.04 anymore.<br>
&gt;<br>
&gt;<br>
&gt; Are there any nouveau upgrade (that it is not on Canonical) that fixes=
 this problem?<br>
&gt;<br>
&gt; Or how I can downgrade nouveau driver to any previous one that works f=
ine in ubuntu 18.04 with my graphics card?<br>
&gt;<br>
&gt;<br>
&gt; Regards!<br>
&gt;<br>
&gt; Juanma<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_--

--===============1277883636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1277883636==--
