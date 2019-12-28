From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Flickering Nvidia GeForce GT210
Date: Fri, 27 Dec 2019 20:31:32 -0500
Message-ID: <CAKb7UvhA7NqOVa0--v4paV-5uAzJ6DN3mO0XYNjXUxVJdQs1xA@mail.gmail.com>
References: <BN6PR01MB2337BD8F279BCB99674C4EE0E3250@BN6PR01MB2337.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1010843622=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BN6PR01MB2337BD8F279BCB99674C4EE0E3250-ymtO2jJJLx+5jGy5ZsTgUV5F3wEVaoLpobIHt/V7iKVBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1010843622==
Content-Type: multipart/alternative; boundary="000000000000a7310c059ab9929c"

--000000000000a7310c059ab9929c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's rather odd ... a reclock should not persist across a reboot.

On Fri, Dec 27, 2019 at 7:51 PM Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
wrote:

> Hi again.
>
> I made echo 0f > /sys/kernel/debug/dri/0/pstate and then reboot the
> system.
>
> And, flickering disappear completely, I just have some tearing when
> something it's moving a lot in videos.
>
> Definitely it was the solution for flickering issue.
>
> Have a nice day =F0=9F=98=8A
>
> Enviado desde mi Samsung Mobile de Claro
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Date: 12/27/19 7:50 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> Hm, this kind of "incomplete fill" flicker could be due to something
> just not being able to keep up. But you may be in luck - nouveau may
> support reclocking on your GPU -- check the contents
> /sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.
> "0f" or "22" or whatever the desired level is listed as back into that
> file (note - AC =3D "current", not an actual level).
>
> On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla
> <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > The issue is like this.:
> >
> > https://youtu.be/4YQSL3xWrJA
> >
> > I have some tearing and sometimes flickering, just screen off and on
> suddenly in shorts periods of time.
> >
> > I have this problem with videos in YouTube using Firefox, and local
> videos using vlc and MPlayer for example.
> >
> >
> > Enviado desde mi Samsung Mobile de Claro
> >
> >
> >
> > -------- Original message --------
> > From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > Date: 12/27/19 7:40 AM (GMT-06:00)
> > To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> >
> > And when you say "flickering", do you really mean some kind of
> > decoding failure with blocks being off or whatever? Or maybe a frame
> > ordering issue (where old frames appear instead of new ones
> > sometimes)? Or just regular tearing?
> >
> > Is your video player using GL output, VDPAU output (and vdpau
> > decoding), or Xv? (What video player are you using?)
> >
> > On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
> > <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > I'm using xorg and nouveau, not modesetting.
> > >
> > >
> > > Thanks for your response.
> > >
> > >
> > >
> > > Enviado desde mi Samsung Mobile de Claro
> > >
> > >
> > >
> > > -------- Original message --------
> > > From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > > Date: 12/27/19 7:31 AM (GMT-06:00)
> > > To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> > > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> > >
> > > Are you on Xorg or wayland of some sort? If on Xorg, which DDX are yo=
u
> > > using -- nouveau or modesetting?
> > >
> > > On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> > > <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> > > >
> > > > Hi mates,
> > > >
> > > > First to all thanks for your help.
> > > >
> > > > I've installed Nouveau driver for my Nvidia GeForce GT210 using
> Archlinux, but I have some flickering issues when playing videos, only in
> the video windows.
> > > >
> > > > Sometimes I can see some flickering when scrolling.
> > > >
> > > > Please help. I don't know how to fix it.
> > > >
> > > >
> > > > Atte. Jairo Quintanilla
> > > > _______________________________________________
> > > > Nouveau mailing list
> > > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--000000000000a7310c059ab9929c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s rather odd ... a reclock should=C2=A0not persis=
t across a reboot.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Dec 27, 2019 at 7:51 PM Jairo Quintanilla &lt;<a =
href=3D"mailto:jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org">jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">



<div dir=3D"auto">
<div dir=3D"auto">Hi again.=C2=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I made echo 0f &gt; /sys/kernel/debug/dri/0/pstate and th=
en reboot the system.=C2=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">And, flickering disappear completely, I just have some te=
aring when something it&#39;s moving a lot in videos.=C2=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Definitely it was the solution for flickering issue.=C2=
=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Have a nice day =F0=9F=98=8A</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"gmail-m_-8732262085506877971composer_signature" dir=3D"auto">
<div style=3D"font-size:85%;color:rgb(87,87,87)" dir=3D"auto">Enviado desde=
 mi Samsung Mobile de Claro</div>
</div>
<div dir=3D"auto"><br>
</div>
<div><br>
</div>
<div style=3D"font-size:100%;color:rgb(0,0,0)" dir=3D"auto">
<div>-------- Original message --------</div>
<div>From: Ilia Mirkin &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=
=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; </div>
<div>Date: 12/27/19 7:50 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;<a href=3D"mailto:jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org" ta=
rget=3D"_blank">jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt; </div>
<div>Cc: <a href=3D"mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank"=
>nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a> </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt">
<div>Hm, this kind of &quot;incomplete fill&quot; flicker could be due to s=
omething<br>
just not being able to keep up. But you may be in luck - nouveau may<br>
support reclocking on your GPU -- check the contents<br>
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.<br>
&quot;0f&quot; or &quot;22&quot; or whatever the desired level is listed as=
 back into that<br>
file (note - AC =3D &quot;current&quot;, not an actual level).<br>
<br>
On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla<br>
&lt;<a href=3D"mailto:jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">jairo_6875@=
hotmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The issue is like this.:<br>
&gt;<br>
&gt; <a href=3D"https://youtu.be/4YQSL3xWrJA" target=3D"_blank">https://you=
tu.be/4YQSL3xWrJA</a><br>
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
&gt; From: Ilia Mirkin &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=
=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;<br>
&gt; Date: 12/27/19 7:40 AM (GMT-06:00)<br>
&gt; To: Jairo Quintanilla &lt;<a href=3D"mailto:jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org" ta=
rget=3D"_blank">jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank"=
>nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
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
&gt; &lt;<a href=3D"mailto:jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">jairo_=
6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m using xorg and nouveau, not modesetting.<br>
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
&gt; &gt; From: Ilia Mirkin &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" tar=
get=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;<br>
&gt; &gt; Date: 12/27/19 7:31 AM (GMT-06:00)<br>
&gt; &gt; To: Jairo Quintanilla &lt;<a href=3D"mailto:jairo_6875-PkbjNfxxIASIwRZHo2/mJg@public.gmane.org=
m" target=3D"_blank">jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_b=
lank">nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
&gt; &gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt; &gt;<br>
&gt; &gt; Are you on Xorg or wayland of some sort? If on Xorg, which DDX ar=
e you<br>
&gt; &gt; using -- nouveau or modesetting?<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&gt; &gt; &lt;<a href=3D"mailto:jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">j=
airo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi mates,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; First to all thanks for your help.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve installed Nouveau driver for my Nvidia GeForce GT21=
0 using Archlinux, but I have some flickering issues when playing videos, o=
nly in the video windows.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sometimes I can see some flickering when scrolling.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Please help. I don&#39;t know how to fix it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Atte. Jairo Quintanilla<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Nouveau mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_=
blank">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau" target=3D"_blank">
https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</div>

</blockquote></div>

--000000000000a7310c059ab9929c--

--===============1010843622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1010843622==--
