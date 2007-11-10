From: "Chris Lewis" <chris-wfxh7x6G0zpdj4APDhWzjA@public.gmane.org>
Subject: Re: xf86-video-nouveau does not compile
Date: Sat, 10 Nov 2007 23:02:56 +0000
Message-ID: <20071110225833.M64071@kool4katz.co.uk>
References: <20071110111645.M861@kool4katz.co.uk>
	<6a89f9d50711100640r169198e7xc4f2303e6447c5ae@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0035544319=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50711100640r169198e7xc4f2303e6447c5ae-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0035544319==
Content-Type: text/html;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<HTML>
<HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" http-equiv=3DContent-Type>
<META content=3D"OPENWEBMAIL" name=3DGENERATOR>
</HEAD>
<BODY bgColor=3D#ffffff>

<font size=3D"2"><b>Hi Stephane,
<br />
<br />Thanks - I was foolishly compiling against the libdrm-devel from fc7 =
rather than the nouveau version.=A0 I reinstalled the drm with ./configure =
--prefix=3D/usr ,having removed the=A0 fc7 libdrm-devel packages and all wa=
s well.
<br />
<br />Cheers
<br />
<br />Chris
<br />
<br />
<br />
<br />
<br />On Sat, 10 Nov 2007 15:40:05 +0100, Stephane Marchesin wrote</b>
<br />&gt; Oops=20
replying to the list as well this time...
<br />&gt;=20
<br />&gt; Hi,
<br />&gt;=20
<br />&gt;=20
Do you have the DRM compiled and installed ? Also, line=20
369
of nv_type.h is not about fifo for me (nor for git head), so are=20
you
sure you're using an unmodified git checkout=20
?

<br />&gt; <span class=3D"sg">
<br />&gt; Stephane
<br />&gt;=20
<br />&gt;=20
</span>

<br />
<br />
<br />--=20

<br />
Open WebMail Project (<a target=3D"_blank" href=3D"http://openwebmail.org/"=
>http://openwebmail.org</a>)=20

<br />

<br />
</font>
</BODY>
</HTML>


--===============0035544319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0035544319==--
