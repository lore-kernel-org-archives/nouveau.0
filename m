From: Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: UBO support for nouveau broken
Date: Fri, 21 Jun 2013 00:59:59 +0200
Message-ID: <CAMv9YTfiUo3BtogiohwiC5cLd7qkYYUuxvjhkY1vXpW_LEP2+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1865834661=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1865834661==
Content-Type: multipart/alternative; boundary=001a11c28b94e10f3804df9de7e0

--001a11c28b94e10f3804df9de7e0
Content-Type: text/plain; charset=ISO-8859-1

Hey guys,
I'm using the dolphin emulator from time and the stable version works
reasonable well with current nvidia cards and nouveau.The git version got
an overhaul however and now uses opengl3 and ubos (without ubo it uses a
glUniform fallback).
The ubo support works with the blobs.
There are probably a few bugs with ubo one might be  because of ubo
access+offset (glBindBufferRange) as this is uncommon, there are no piglit
tests.
I use the linux kernel from git and mesa from git (last time I compiled it
was 3 days ago).
The main card I test it on is
> 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce 9300M
GS] (rev a1)
but I tested it on newer ones as well.
If you want to test it you can compile dolphin-emu from git (
https://code.google.com/p/dolphin-emu/wiki/Linux_Build) and use this image
http://sonicadvance11.dyndns.org/starfield.dol to test it.You don't need
any bios files or actual wii games to dump.
With kind regards,
Thomas Schneider

--001a11c28b94e10f3804df9de7e0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey guys,<div>I&#39;m using the dolphin emulator from time=
 and the stable version works reasonable well with current nvidia cards and=
 nouveau.The git version got an overhaul however and now uses opengl3 and u=
bos (without ubo it uses a glUniform fallback).</div>
<div>The ubo support works with the blobs.</div><div>There are probably a f=
ew bugs with ubo one might be =A0because of ubo access+offset (glBindBuffer=
Range) as this is uncommon, there are no piglit tests.</div><div>I use the =
linux kernel from git and mesa from git (last time I compiled it was 3 days=
 ago).</div>
<div>The main card I test it on is=A0</div><div>&gt; 01:00.0 VGA compatible=
 controller: NVIDIA Corporation G98M [GeForce 9300M GS] (rev a1)</div><div>=
but I tested it on newer ones as well.</div><div>If you want to test it you=
 can compile dolphin-emu from git (<a href=3D"https://code.google.com/p/dol=
phin-emu/wiki/Linux_Build">https://code.google.com/p/dolphin-emu/wiki/Linux=
_Build</a>) and use this image=A0<span style=3D"color:rgb(0,0,0);font-famil=
y:&#39;Times New Roman&#39;"><a href=3D"http://sonicadvance11.dyndns.org/st=
arfield.dol">http://sonicadvance11.dyndns.org/starfield.dol</a> to test it.=
You don&#39;t need any bios files or actual wii games to dump.</span></div>
<div><span style=3D"color:rgb(0,0,0);font-family:&#39;Times New Roman&#39;"=
>With kind regards,</span></div><div><span style=3D"color:rgb(0,0,0);font-f=
amily:&#39;Times New Roman&#39;">Thomas Schneider</span></div></div>

--001a11c28b94e10f3804df9de7e0--

--===============1865834661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1865834661==--
