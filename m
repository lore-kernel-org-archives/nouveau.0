From: Zhiqiang Liu <gavin.liuzq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: About Using "nVidia Open Source Driver" on MIPS Computer
Date: Tue, 20 May 2014 10:33:31 -0400
Message-ID: <CACGcVE2hDJk3qLaAhyXFqnzvFJz3CkSGqQyNmqpH6dZs859Sqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0584319339=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0584319339==
Content-Type: multipart/alternative; boundary=047d7bb049e892a28804f9d5c30a

--047d7bb049e892a28804f9d5c30a
Content-Type: text/plain; charset=UTF-8

Hello, Gurus, recently I got a MIPS computer installed with Linux
OS(Fedora), unfortunately there is no driver for the graphics
card, so it cannot perform 3D acceleration. Since I happen to have a nVidia
graphics card at hand (it is GeForce 9500GT, somewhat old), I want to apply
this card on this computer, so my questions are:

1. Is it possible to make a nVidia graphics driver for this MIPS computer
from current open source driver, i.e, transplant current
X86-based driver to MIPs-based driver?
2. If it is possible to do so, then what and where should I start with? what
parts of the driver I'll have to modify? and are there any
architecture-specific
parts, e.g, parts implemented by X86 assembly language or something else HW
dependent?
3. What skills do you think I must have to do this job? I am skillful at C
programming in Linux, and have much experience on HW designing, should I
grasp OpenGL for this work?
4. To make a workable driver with 3D acceleration, which modules' source codes
should I download? I have downloaded a file named
"xf86-video-nouveau-1.0.10.zip", is it right?

Currently I don't have so much knowledge on Graphics Card and Linux, but I
am interested in this task very much, I will try my best to finish it as
long as there are possibilities to succeed.

Thank your gurus very much!

Best Regards
Gavin

--047d7bb049e892a28804f9d5c30a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80);font-family:arial,sans-s=
erif;font-size:13px">Hello, Gurus,=C2=A0</span><span style=3D"color:rgb(80,=
0,80);font-family:arial,sans-serif;font-size:13px">recently I got a MIPS co=
mputer installed with=C2=A0</span><span style=3D"color:rgb(80,0,80);font-fa=
mily:arial,sans-serif;font-size:13px">Linux OS(Fedora), unfortunately there=
 is no driver for the graphics</span><br style=3D"color:rgb(80,0,80);font-f=
amily:arial,sans-serif;font-size:13px">
<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13=
px">card, so it cannot perform 3D acceleration. Since I happen to have a=C2=
=A0</span><span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;fo=
nt-size:13px">nVidia graphics card at hand (it is GeForce 9500GT, somewhat =
old), I want to apply this card on this=C2=A0</span><span style=3D"color:rg=
b(80,0,80);font-family:arial,sans-serif;font-size:13px">computer, so my que=
stions are:</span><br style=3D"color:rgb(80,0,80);font-family:arial,sans-se=
rif;font-size:13px">
<br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px=
"><span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:=
13px">1. Is it possible to make a nVidia graphics driver for this MIPS=C2=
=A0</span><span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;fo=
nt-size:13px">computer from current open source driver, i.e, transplant cur=
rent</span><br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;fon=
t-size:13px">
<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13=
px">X86-based driver to MIPs-based driver?</span><br style=3D"color:rgb(80,=
0,80);font-family:arial,sans-serif;font-size:13px"><span style=3D"color:rgb=
(80,0,80);font-family:arial,sans-serif;font-size:13px">2. If it is possible=
 to do so, then what and where should I start with? </span><span style=3D"c=
olor:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px">what parts o=
f the driver I&#39;ll have to modify? and are there any </span><span style=
=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px">archite=
cture-specific parts, e.g, parts implemented by X86 assembly language or so=
mething else HW dependent?</span><br style=3D"color:rgb(80,0,80);font-famil=
y:arial,sans-serif;font-size:13px">
<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13=
px">3. What skills do you think I must have to do this job? I am skillful a=
t=C2=A0</span><span style=3D"color:rgb(80,0,80);font-family:arial,sans-seri=
f;font-size:13px">C programming in Linux, and have much experience on HW de=
signing,=C2=A0</span><span style=3D"color:rgb(80,0,80);font-family:arial,sa=
ns-serif;font-size:13px">should I grasp OpenGL for this work?</span><br sty=
le=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px">
<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13=
px">4. To make a workable driver with 3D acceleration, which modules&#39; s=
ource=C2=A0</span><span style=3D"color:rgb(80,0,80);font-family:arial,sans-=
serif;font-size:13px">codes should I download? I have downloaded a file nam=
ed</span><br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-=
size:13px">
<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13=
px">&quot;xf86-video-nouveau-1.0.10.</span><u style=3D"color:rgb(80,0,80);f=
ont-family:arial,sans-serif;font-size:13px"></u><span style=3D"color:rgb(80=
,0,80);font-family:arial,sans-serif;font-size:13px">zip</span><span style=
=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px">&quot;,=
 is it right?</span><br style=3D"color:rgb(80,0,80);font-family:arial,sans-=
serif;font-size:13px">
<br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px=
"><span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:=
13px">Currently I don&#39;t have so much knowledge on Graphics Card and Lin=
ux, but=C2=A0</span><span style=3D"color:rgb(80,0,80);font-family:arial,san=
s-serif;font-size:13px">I am interested in this task very much, I will try =
my best to finish it=C2=A0</span><span style=3D"color:rgb(80,0,80);font-fam=
ily:arial,sans-serif;font-size:13px">as long as there are possibilities to =
succeed.</span><br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif=
;font-size:13px">
<br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px=
"><span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:=
13px">Thank your gurus very much!</span><br style=3D"color:rgb(80,0,80);fon=
t-family:arial,sans-serif;font-size:13px">
<br style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px=
"><span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:=
13px">Best Regards</span><br style=3D"color:rgb(80,0,80);font-family:arial,=
sans-serif;font-size:13px">
<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13=
px">Gavin</span><br></div>

--047d7bb049e892a28804f9d5c30a--

--===============0584319339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0584319339==--
