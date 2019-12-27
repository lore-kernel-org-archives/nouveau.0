From: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Flickering Nvidia GeForce GT210
Date: Fri, 27 Dec 2019 15:36:30 +0000
Message-ID: <BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0@BN6PR01MB2337.prod.exchangelabs.com>
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
 <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>,
 <CAKb7UvhPJs1_0oEuj-W6N9gby9ntnoWNytaJ2RHKcaj-x7Q1zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1432913032=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhPJs1_0oEuj-W6N9gby9ntnoWNytaJ2RHKcaj-x7Q1zw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============1432913032==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_"

--_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'll see this file and test some things, and I'll give a feedback later.

Thanks again for your help. I really appreciate it.



Enviado desde mi Samsung Mobile de Claro



-------- Original message --------
From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date: 12/27/19 7:50 AM (GMT-06:00)
To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210

Hm, this kind of "incomplete fill" flicker could be due to something
just not being able to keep up. But you may be in luck - nouveau may
support reclocking on your GPU -- check the contents
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.
"0f" or "22" or whatever the desired level is listed as back into that
file (note - AC =3D "current", not an actual level).

On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla
<jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
>
> The issue is like this.:
>
> https://youtu.be/4YQSL3xWrJA
>
> I have some tearing and sometimes flickering, just screen off and on sudd=
enly in shorts periods of time.
>
> I have this problem with videos in YouTube using Firefox, and local video=
s using vlc and MPlayer for example.
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Date: 12/27/19 7:40 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> And when you say "flickering", do you really mean some kind of
> decoding failure with blocks being off or whatever? Or maybe a frame
> ordering issue (where old frames appear instead of new ones
> sometimes)? Or just regular tearing?
>
> Is your video player using GL output, VDPAU output (and vdpau
> decoding), or Xv? (What video player are you using?)
>
> On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
> <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > I'm using xorg and nouveau, not modesetting.
> >
> >
> > Thanks for your response.
> >
> >
> >
> > Enviado desde mi Samsung Mobile de Claro
> >
> >
> >
> > -------- Original message --------
> > From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > Date: 12/27/19 7:31 AM (GMT-06:00)
> > To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> >
> > Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> > using -- nouveau or modesetting?
> >
> > On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> > <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > Hi mates,
> > >
> > > First to all thanks for your help.
> > >
> > > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archl=
inux, but I have some flickering issues when playing videos, only in the vi=
deo windows.
> > >
> > > Sometimes I can see some flickering when scrolling.
> > >
> > > Please help. I don't know how to fix it.
> > >
> > >
> > > Atte. Jairo Quintanilla
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_
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
<div dir=3D"auto">I'll see this file and test some things, and I'll give a =
feedback later.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks again for your help. I really appreciate it.&nbsp;=
</div>
<div dir=3D"auto"><br>
</div>
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
<div>Date: 12/27/19 7:50 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; </div>
<div>Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hm, this kind of &quot;incomplete fill&quot; flick=
er could be due to something<br>
just not being able to keep up. But you may be in luck - nouveau may<br>
support reclocking on your GPU -- check the contents<br>
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.<br>
&quot;0f&quot; or &quot;22&quot; or whatever the desired level is listed as=
 back into that<br>
file (note - AC =3D &quot;current&quot;, not an actual level).<br>
<br>
On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla<br>
&lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br>
&gt;<br>
&gt; The issue is like this.:<br>
&gt;<br>
&gt; <a href=3D"https://youtu.be/4YQSL3xWrJA">https://youtu.be/4YQSL3xWrJA<=
/a><br>
&gt;<br>
&gt; I have some tearing and sometimes flickering, just screen off and on s=
uddenly in shorts periods of time.<br>
&gt;<br>
&gt; I have this problem with videos in YouTube using Firefox, and local vi=
deos using vlc and MPlayer for example.<br>
&gt;<br>
&gt;<br>
&gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -------- Original message --------<br>
&gt; From: Ilia Mirkin &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br>
&gt; Date: 12/27/19 7:40 AM (GMT-06:00)<br>
&gt; To: Jairo Quintanilla &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt;<br>
&gt; Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt;<br>
&gt; And when you say &quot;flickering&quot;, do you really mean some kind =
of<br>
&gt; decoding failure with blocks being off or whatever? Or maybe a frame<b=
r>
&gt; ordering issue (where old frames appear instead of new ones<br>
&gt; sometimes)? Or just regular tearing?<br>
&gt;<br>
&gt; Is your video player using GL output, VDPAU output (and vdpau<br>
&gt; decoding), or Xv? (What video player are you using?)<br>
&gt;<br>
&gt; On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla<br>
&gt; &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I'm using xorg and nouveau, not modesetting.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks for your response.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -------- Original message --------<br>
&gt; &gt; From: Ilia Mirkin &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br>
&gt; &gt; Date: 12/27/19 7:31 AM (GMT-06:00)<br>
&gt; &gt; To: Jairo Quintanilla &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt;<br>
&gt; &gt; Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt; &gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt; &gt;<br>
&gt; &gt; Are you on Xorg or wayland of some sort? If on Xorg, which DDX ar=
e you<br>
&gt; &gt; using -- nouveau or modesetting?<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&gt; &gt; &lt;jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi mates,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; First to all thanks for your help.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I've installed Nouveau driver for my Nvidia GeForce GT210 us=
ing Archlinux, but I have some flickering issues when playing videos, only =
in the video windows.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sometimes I can see some flickering when scrolling.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Please help. I don't know how to fix it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Atte. Jairo Quintanilla<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Nouveau mailing list<br>
&gt; &gt; &gt; Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</body>
</html>

--_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_--

--===============1432913032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1432913032==--
