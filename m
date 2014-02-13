From: pierre.morrow-GANU6spQydw@public.gmane.org
Subject: Re: Help needed for bug 58556
Date: Thu, 13 Feb 2014 14:00:20 +0100 (CET)
Message-ID: <1597202039.431575888.1392296420109.JavaMail.root@spooler8-g27.priv.proxad.net>
References: <3D3EC88C-612F-485B-A8F0-3C197D9FD2A4@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960357796=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3D3EC88C-612F-485B-A8F0-3C197D9FD2A4-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0960357796==
Content-Type: multipart/alternative;
	boundary="----=_Part_431575887_927728237.1392296420109"

------=_Part_431575887_927728237.1392296420109
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,=20

One thing that differs between the NV96 and the NVAC, is the efifb handling=
:=20
for the NVAC, efifb is conflicting with nouveaufb, therefore it is removed,=
=20
whereas the NV96 has no problem and keeps efifb along.=20

To sum up what happens with the different framebuffers on the two cards:=20

NVAC: with efifb+nouveaufb: corruption, with nouveaufb: still corrupted=20
NV96: with efifb+nouveaufb: ok, with nouveaufb: screen freezes=20

So NV96 does not seem to use nouveaufb for outputing, as removing efifb=20
freezes the screen (ie. the machine continues to run, just the screen isn=
=E2=80=99t=20
updated anymore) and removing nouveau_fbcon_init has no effect. Not sure wh=
y=20
NV96 does not use nouveaufb...=20
And NVAC uses nouveaufb (removing efifb has no effect and removing=20
nouveau_fbcon_init causes a screen freeze). I need to do some further tests=
=20
as removing nouveau_fbcon_init and nouveau_accel_init does not seem to brin=
g=20
garbage screen before freezing.=20

Pierre
------=_Part_431575887_927728237.1392296420109
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D'text/css'>p { margin: 0; }</style></head><body><=
div style=3D'font-family: arial,helvetica,sans-serif; font-size: 12pt; colo=
r: #000000'>Hello,<br><br>One thing that differs between the NV96 and the N=
VAC, is the efifb handling:<br>for the NVAC, efifb is conflicting with nouv=
eaufb, therefore it is removed,<br>whereas the NV96 has no problem and keep=
s efifb along.<br><br>To sum up what happens with the different framebuffer=
s on the two cards:<br><br>NVAC: with efifb+nouveaufb: corruption, with nou=
veaufb: still corrupted<br>NV96: with efifb+nouveaufb: ok,&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with nouveaufb: screen freezes<br><br>So NV=
96 does not seem to use nouveaufb for outputing, as removing efifb<br>freez=
es the screen (ie. the machine continues to run, just the screen isn=E2=80=
=99t<br>updated anymore) and removing nouveau_fbcon_init has no effect. Not=
 sure why<br>NV96 does not use nouveaufb...<br>And NVAC uses nouveaufb (rem=
oving efifb has no effect and removing<br>nouveau_fbcon_init causes a scree=
n freeze). I need to do some further tests<br>as removing nouveau_fbcon_ini=
t and nouveau_accel_init does not seem to bring<br>garbage screen before fr=
eezing.<br><br>Pierre</div></body></html>
------=_Part_431575887_927728237.1392296420109--

--===============0960357796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0960357796==--
