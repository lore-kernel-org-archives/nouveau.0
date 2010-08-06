From: Jason Long <mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org>
Subject: Re: Optimus and Nvidia
Date: Thu, 5 Aug 2010 23:39:20 -0500
Message-ID: <AANLkTimnVPsxcYP6EbnmyiekdYm+86Bu=ko=BFEx-PJp@mail.gmail.com>
References: <AANLkTimkvu_ic_B1KW9mW_6-DE2tiXxv4S+Jwwmkpm4c@mail.gmail.com>
	<AANLkTimB8Abtq4+zLq8Pa6gQbTcn5PQA1w9jOdF6XNjL@mail.gmail.com>
	<AANLkTi=OM2oeiLbWCVYQCjp8-c0ZM83SpFCXMc2n6Z9T@mail.gmail.com>
	<AANLkTimm1Joko5OwhNj=owkmJHgMrrfwGSb7JwR4A277@mail.gmail.com>
	<AANLkTim-Q09qTB1ijTctsftBb_Ww0FVe2vKMq40pWWre@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0246387209=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTim-Q09qTB1ijTctsftBb_Ww0FVe2vKMq40pWWre-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0246387209==
Content-Type: multipart/alternative; boundary=0016e64768ec1415c5048d204051

--0016e64768ec1415c5048d204051
Content-Type: text/plain; charset=ISO-8859-1

Which intel list is that?

I am assuming I can still run Linux in Virtual Box on a Windows 7 host.  Is
this correct?

I did Google quite a bit, but I could only find people that were thinking
about fixing, but not solutions or serious progress.

I can deal with running running Linux virtually for a while.

What are the chances that I will end up with a laptop that will never run
Fedora native?



On Thu, Aug 5, 2010 at 10:46 PM, Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> (Use reply-all if you want people on the list to see your emails, your
> last two were only to me.)
>
> Google "nvidia optimus linux" and you'll find some info on the matter.
> The Nvidia driver does not support Optimus. As far as I know this
> means that it will not work with the 330M in an Optimus chipset
> because the 330M is hooked up to the Intel chip, it doesn't matter
> that the Nvidia driver supports regular 330Ms, this is not a regular
> 330M. Nouveau doesn't support it either until someone figures out how
> it works.
>
> As far as the Intel chip is concerned I don't know if the Intel driver
> will support it and just ignore the Optimus-related stuff. Maybe you
> should ask that on the Intel list.
>
> What the sales guy told you about turning it off doesn't matter.
>
> On Thu, Aug 5, 2010 at 11:24 PM, Jason Long
> <mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org> wrote:
> > The NVIDIA GeForce GT 330M is supported by the propriety driver, but I do
> > not know how is will work with the integrated Intel.
> >
> > On Thu, Aug 5, 2010 at 10:22 PM, Jason Long <
> mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org>
> > wrote:
> >>
> >> It is a http://www.pctorque.com/sager-5125-gaming-computers.php
> >> with NVIDIA GeForce GT 330M with integrated Intel 4500 GMA.
> >> I am not really concerned about if Optimus works.  I am mainly concerned
> >> about using the latest Fedora release.  I do not even care if I have to
> use
> >> either the Intel of Nvidia card.  I just want 1080p under Linux.
> >> Does anyone know what the options are?  The sales guys said there was a
> >> switch to turn Optimus off.
> >> On Thu, Aug 5, 2010 at 10:08 PM, Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> >>>
> >>> On Thu, Aug 5, 2010 at 4:38 PM, Jason Long
> >>> <mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org> wrote:
> >>> > I need to buy a Sager 5125 laptop immediately and I am concerned
> about
> >>> > the
> >>> > Optimus setup in this model.
> >>> > It comes with a Nvidia 330M/Intel Hybrid.
> >>> > I want to use this with Fedora 13.  I do not care if I can switch.  I
> >>> > just
> >>> > want it to work.  I can also deal with only the onboard graphics
> >>> > working in
> >>> > linux.
> >>> > Do you think the HDMI output will work or I will need the 330M driver
> >>> > for
> >>> > that?
> >>> > I see nvidia has support for the 330M in their driver?  Will this
> work?
> >>> > _______________________________________________
> >>> > Nouveau mailing list
> >>> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >>>
> >>>
> >>> Last I heard I don't think Nvidia will support Optimus on Linux with
> >>> their driver. As far as Nouveau and DRM playing nice with Optimus I
> >>> think Dave Airlie had some interest in that but no access to hardware?
> >>> I don't remember the details myself, maybe someone else can tell you
> >>> more.
> >>
> >
> >
>

--0016e64768ec1415c5048d204051
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Which intel list is that?<div><br></div><div>I am assuming I can still run =
Linux in Virtual Box on a Windows 7 host. =A0Is this correct?</div><div><br=
></div><div>I did Google quite a bit, but I could only find people that wer=
e thinking about fixing, but not solutions or serious progress.</div>
<div><br></div><div>I can deal with running running Linux=A0virtually=A0for=
 a while.</div><div><br></div><div>What are the chances that I will end up =
with a laptop that will never run Fedora=A0native?</div><div><br></div><div=
><br>
<br><div class=3D"gmail_quote">On Thu, Aug 5, 2010 at 10:46 PM, Younes Mant=
on <span dir=3D"ltr">&lt;<a href=3D"mailto:younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">younes.m@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
(Use reply-all if you want people on the list to see your emails, your<br>
last two were only to me.)<br>
<br>
Google &quot;nvidia optimus linux&quot; and you&#39;ll find some info on th=
e matter.<br>
The Nvidia driver does not support Optimus. As far as I know this<br>
means that it will not work with the 330M in an Optimus chipset<br>
because the 330M is hooked up to the Intel chip, it doesn&#39;t matter<br>
that the Nvidia driver supports regular 330Ms, this is not a regular<br>
330M. Nouveau doesn&#39;t support it either until someone figures out how<b=
r>
it works.<br>
<br>
As far as the Intel chip is concerned I don&#39;t know if the Intel driver<=
br>
will support it and just ignore the Optimus-related stuff. Maybe you<br>
should ask that on the Intel list.<br>
<br>
What the sales guy told you about turning it off doesn&#39;t matter.<br>
<br>
On Thu, Aug 5, 2010 at 11:24 PM, Jason Long<br>
<div><div></div><div class=3D"h5">&lt;<a href=3D"mailto:mailing.lists@octgs=
oftware.com">mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org</a>&gt; wrote:<br>
&gt; The=A0NVIDIA GeForce GT 330M is supported by the=A0propriety=A0driver,=
 but I do<br>
&gt; not know how is will work with the integrated Intel.<br>
&gt;<br>
&gt; On Thu, Aug 5, 2010 at 10:22 PM, Jason Long &lt;<a href=3D"mailto:mail=
ing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org">mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; It is a <a href=3D"http://www.pctorque.com/sager-5125-gaming-compu=
ters.php" target=3D"_blank">http://www.pctorque.com/sager-5125-gaming-compu=
ters.php</a><br>
&gt;&gt; with=A0NVIDIA GeForce GT 330M with=A0integrated Intel 4500 GMA.<br=
>
&gt;&gt; I am not really concerned about if Optimus works. =A0I am mainly c=
oncerned<br>
&gt;&gt; about using the latest Fedora release. =A0I do not even care if I =
have to use<br>
&gt;&gt; either the Intel of Nvidia card. =A0I just want 1080p under Linux.=
<br>
&gt;&gt; Does anyone know what the options are? =A0The sales guys said ther=
e was a<br>
&gt;&gt; switch to turn Optimus off.<br>
&gt;&gt; On Thu, Aug 5, 2010 at 10:08 PM, Younes Manton &lt;<a href=3D"mail=
to:younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Aug 5, 2010 at 4:38 PM, Jason Long<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org">mailing.=
lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; I need to buy a Sager 5125 laptop=A0immediately=A0and I a=
m concerned about<br>
&gt;&gt;&gt; &gt; the<br>
&gt;&gt;&gt; &gt; Optimus setup in this model.<br>
&gt;&gt;&gt; &gt; It comes with a Nvidia 330M/Intel Hybrid.<br>
&gt;&gt;&gt; &gt; I want to use this with Fedora 13. =A0I do not care if I =
can switch. =A0I<br>
&gt;&gt;&gt; &gt; just<br>
&gt;&gt;&gt; &gt; want it to work. =A0I can also deal with only the onboard=
 graphics<br>
&gt;&gt;&gt; &gt; working in<br>
&gt;&gt;&gt; &gt; linux.<br>
&gt;&gt;&gt; &gt; Do you think the HDMI output will work or I will need the=
 330M driver<br>
&gt;&gt;&gt; &gt; for<br>
&gt;&gt;&gt; &gt; that?<br>
&gt;&gt;&gt; &gt; I see nvidia has support for the 330M in their driver? =
=A0Will this work?<br>
&gt;&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt;&gt; &gt; Nouveau mailing list<br>
&gt;&gt;&gt; &gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau@=
lists.freedesktop.org</a><br>
&gt;&gt;&gt; &gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/=
nouveau" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/no=
uveau</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Last I heard I don&#39;t think Nvidia will support Optimus on =
Linux with<br>
&gt;&gt;&gt; their driver. As far as Nouveau and DRM playing nice with Opti=
mus I<br>
&gt;&gt;&gt; think Dave Airlie had some interest in that but no access to h=
ardware?<br>
&gt;&gt;&gt; I don&#39;t remember the details myself, maybe someone else ca=
n tell you<br>
&gt;&gt;&gt; more.<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--0016e64768ec1415c5048d204051--

--===============0246387209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0246387209==--
