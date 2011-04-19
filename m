From: Marc Rios <marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nvidia GT450M
Date: Tue, 19 Apr 2011 10:19:09 +0200
Message-ID: <BANLkTikgjUfmtAHUqs08cT=G7koGTvW21Q@mail.gmail.com>
References: <BANLkTinPx2y-7YZxg6amLvVsaPgaVY2x5w@mail.gmail.com>
	<1303165988.3453.0.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0970067426=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1303165988.3453.0.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0970067426==
Content-Type: multipart/alternative; boundary=0023543a27b8c2cfa204a1412ae1

--0023543a27b8c2cfa204a1412ae1
Content-Type: text/plain; charset=UTF-8

Hi Ben,

I know I have optimus, and we are trying a module to be able to switch
between screens, you can check it here: git://
github.com/awilliam/asus-switcheroo.git

I will try to get better debug and see why I get a black screen...

This error is not significant then???

Thanks
--
Marc Rios




On Tue, Apr 19, 2011 at 12:33 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, 2011-04-18 at 21:17 +0200, Marc Rios wrote:
> > Hi,
> >
> > I supose this has been reported yet, but I have not find it.
> >
> > I have recently bought a new laptop (ASUS N53S) with nvidia card 450M.
> > When I load the nouveau module I get this error in dmesg:
> >
> > [  117.724465] [drm] nouveau 0000:01:00.0: PGRAPH: unsupported
> > chipset, please report!
> > [  117.724593] [drm] nouveau 0000:01:00.0: PGRAPH: unknown config:
> > 2/0/0/0, 1
> > [  117.727225] [drm] nouveau 0000:01:00.0: failed to load fuc409d
> >
> > I think you may find it interesting. If I try to switch to nvidia card
> > I get a black screen. I supose, can be caused by this error...
> This error wouldn't get you a black screen.  However, I'd say you've
> probably got an Optimus laptop, which means you're out of luck.  Only
> the intel GPU is physically wired up to the display..
>
> Ben.
>
> >
> > Regards,
> >
> > --
> > Marc Rios
> >
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
>

--0023543a27b8c2cfa204a1412ae1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ben,<br><br>I know I have optimus, and we are trying a module to be able=
 to switch between screens, you can check it here: git://<a href=3D"http://=
github.com/awilliam/asus-switcheroo.git" target=3D"_blank">github.com/awill=
iam/asus-switcheroo.git</a><br>

<br>I will try to get better debug and see why I get a black screen... <br>=
<br>This error is not significant then???<br><br>Thanks<br clear=3D"all">--=
<br>Marc Rios<br><br><br>
<br><br><div class=3D"gmail_quote">On Tue, Apr 19, 2011 at 12:33 AM, Ben Sk=
eggs <span dir=3D"ltr">&lt;<a href=3D"mailto:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">skeggsb@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">

<div><div></div><div class=3D"h5">On Mon, 2011-04-18 at 21:17 +0200, Marc R=
ios wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I supose this has been reported yet, but I have not find it.<br>
&gt;<br>
&gt; I have recently bought a new laptop (ASUS N53S) with nvidia card 450M.=
<br>
&gt; When I load the nouveau module I get this error in dmesg:<br>
&gt;<br>
&gt; [ =C2=A0117.724465] [drm] nouveau 0000:01:00.0: PGRAPH: unsupported<br=
>
&gt; chipset, please report!<br>
&gt; [ =C2=A0117.724593] [drm] nouveau 0000:01:00.0: PGRAPH: unknown config=
:<br>
&gt; 2/0/0/0, 1<br>
&gt; [ =C2=A0117.727225] [drm] nouveau 0000:01:00.0: failed to load fuc409d=
<br>
&gt;<br>
&gt; I think you may find it interesting. If I try to switch to nvidia card=
<br>
&gt; I get a black screen. I supose, can be caused by this error...<br>
</div></div>This error wouldn&#39;t get you a black screen. =C2=A0However, =
I&#39;d say you&#39;ve<br>
probably got an Optimus laptop, which means you&#39;re out of luck. =C2=A0O=
nly<br>
the intel GPU is physically wired up to the display..<br>
<br>
Ben.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; --<br>
&gt; Marc Rios<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" targ=
et=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br>
<br>
</blockquote></div><br>

--0023543a27b8c2cfa204a1412ae1--

--===============0970067426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0970067426==--
