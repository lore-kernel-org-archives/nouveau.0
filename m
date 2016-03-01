From: Efrem Mc <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Dual monitors have same identifier
Date: Tue, 1 Mar 2016 16:08:17 -0500
Message-ID: <CAEhOZrejZDbd=7DwZ=9FHfVh0fBMLPMO3B0u4hQpBzV0xt6Q8A@mail.gmail.com>
References: <56D5D496.5050009@hewett.co.nz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0181213956=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56D5D496.5050009-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Peter Hewett <nouveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0181213956==
Content-Type: multipart/alternative; boundary=001a1143f2ac141b9f052d032ad2

--001a1143f2ac141b9f052d032ad2
Content-Type: text/plain; charset=UTF-8

The Xorg.0.log file is located usally in /var/log/, use less
/var/log/Xorg.0.log se view the contents easily or your favorite tool.

The log above will let you know what files are being used.

You can start manually such as:

startx  -- -logverbose 6

This will capture additional information.

Here are the links.

http://www.x.org/wiki/

http://www.x.org/wiki/guide/





On Tue, Mar 1, 2016 at 12:42 PM, Peter Hewett <nouveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org> wrote:

> ------------------------
> From: Efrem Mc <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Tue, 1 Mar 2016 00:27:52 -0500
>
> > 'Normally, the monitor-edid, can report the options as well as the
> > journalctl -k on boot.  I have a GTX 960, and it has a DVI-I, DVI-D, >
> DP 1.2, HDMI, and it names the ports as follows, DVI-I as
> > (DVI-I-1/DFP-0, DFP-1 (HDMI-1), DFP-2 (DVI-D-1/DFP-2), and for the
> > Display port (DP-1.   In the X configuration, you can specify in
> > the device section, a BusID "PCI:2:0:0" for the GPU.  There is
> > also an Identifier= "name", see /var/log/Xorg.0.log file.
> >
> > These are some examples, and this is document in xorg.conf(5)
>
> Thanks
>
> I remember dabbling with xorg.conf many many years ago, but now there is
> no xorg.conf file anywhere in Kubuntu. Should I just add one in /etc/X11/ ?
> Are you able to point me to a beginners guide? I couldn't find any
> example xorg.conf files, or howto guides for nouveau.
>
> And grep finds no 'identifier' string in Xorg.log.0.
>
> TIA
>
> Peter
>
>
> > On Mon, Feb 29, 2016 at 8:12 PM, Peter Hewett <nouveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org>
> wrote:
> >>
> >> Hi
> >> My desktop is Kubuntu 15.10 with GeForce GTX 970 and two monitors,
> >> using the Nouveau drivers.
> >>
> >> In System Settings > Display and Monitor, the two monitors are
> >> shown but with the same identifier, DVI-0. This is giving some
> >> problems such as random allocation of primary screen and no right
> >> click on one of the monitors.
> >>
> >> How can I get the monitors to have different identifiers?
> >>
> >> Thank you
> >>
> >> Peter
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a1143f2ac141b9f052d032ad2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>The Xorg.0.log file is located usally in /v=
ar/log/, use less /var/log/Xorg.0.log se view the contents easily or your f=
avorite tool.<div><br></div><div>The log above will let you know what files=
 are being used.</div><div><br></div><div>You can start manually such as:</=
div><div><br></div><div>startx =C2=A0-- -logverbose 6</div><div><br></div><=
div>This will capture additional information.<br><div><br></div><div>Here a=
re the links.</div><div><br></div><div><a href=3D"http://www.x.org/wiki/" t=
arget=3D"_blank">http://www.x.org/wiki/</a><br></div><div><br></div><div><a=
 href=3D"http://www.x.org/wiki/guide/" target=3D"_blank">http://www.x.org/w=
iki/guide/</a><br></div><div><br></div><div><br></div><div><br></div><div><=
br></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 1, 2016 at 12:42 PM, Peter Hewett <span dir=3D"ltr">&lt;<a =
href=3D"mailto:nouveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org" target=3D"_blank">nouveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">------------------=
------<br>
From: Efrem Mc &lt;<a href=3D"mailto:efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
</a>&gt;<br>
Date: Tue, 1 Mar 2016 00:27:52 -0500<br>
<span class=3D""><br>
&gt; &#39;Normally, the monitor-edid, can report the options as well as the=
<br>
&gt; journalctl -k on boot.=C2=A0 I have a GTX 960, and it has a DVI-I, DVI=
-D, &gt;<br>
DP 1.2, HDMI, and it names the ports as follows, DVI-I as<br>
&gt; (DVI-I-1/DFP-0, DFP-1 (HDMI-1), DFP-2 (DVI-D-1/DFP-2), and for the<br>
&gt; Display port (DP-1.=C2=A0 =C2=A0In the X configuration, you can specif=
y in<br>
&gt; the device section, a BusID &quot;PCI:2:0:0&quot; for the GPU.=C2=A0 T=
here is<br>
&gt; also an Identifier=3D &quot;name&quot;, see /var/log/Xorg.0.log file.<=
br>
&gt;<br>
&gt; These are some examples, and this is document in xorg.conf(5)<br>
<br>
</span>Thanks<br>
<br>
I remember dabbling with xorg.conf many many years ago, but now there is<br=
>
no xorg.conf file anywhere in Kubuntu. Should I just add one in /etc/X11/ ?=
<br>
Are you able to point me to a beginners guide? I couldn&#39;t find any<br>
example xorg.conf files, or howto guides for nouveau.<br>
<br>
And grep finds no &#39;identifier&#39; string in Xorg.log.0.<br>
<br>
TIA<br>
<br>
Peter<br>
<br>
<br>
&gt; On Mon, Feb 29, 2016 at 8:12 PM, Peter Hewett &lt;<a href=3D"mailto:no=
uveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org">nouveau-Xt07Ec+vcEZIJsTUW+i+0g@public.gmane.org</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi<br>
&gt;&gt; My desktop is Kubuntu 15.10 with GeForce GTX 970 and two monitors,=
<br>
&gt;&gt; using the Nouveau drivers.<br>
&gt;&gt;<br>
&gt;&gt; In System Settings &gt; Display and Monitor, the two monitors are<=
br>
&gt;&gt; shown but with the same identifier, DVI-0. This is giving some<br>
&gt;&gt; problems such as random allocation of primary screen and no right<=
br>
&gt;&gt; click on one of the monitors.<br>
&gt;&gt;<br>
&gt;&gt; How can I get the monitors to have different identifiers?<br>
&gt;&gt;<br>
&gt;&gt; Thank you<br>
&gt;&gt;<br>
&gt;&gt; Peter<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Nouveau mailing list<br>
&gt;&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mzQB+pC5nmwQ@public.gmane.org=
edesktop.org</a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman=
/listinfo/nouveau</a><br>
&gt;&gt;<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</div></div></blockquote></div><br></div>

--001a1143f2ac141b9f052d032ad2--

--===============0181213956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0181213956==--
