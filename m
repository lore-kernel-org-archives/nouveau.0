From: pierre.morrow-GANU6spQydw@public.gmane.org
Subject: Re: Help needed for bug 58556
Date: Sat, 1 Feb 2014 16:25:49 +0100 (CET)
Message-ID: <1898763704.398274625.1391268349313.JavaMail.root@spooler8-g27.priv.proxad.net>
References: <CAKb7UviKuN35KDW73kqOGWzd9GYTzrfodA+TPHa460vUy0iANA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0379882611=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviKuN35KDW73kqOGWzd9GYTzrfodA+TPHa460vUy0iANA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============0379882611==
Content-Type: multipart/alternative;
	boundary="----=_Part_398274624_274533302.1391268349312"

------=_Part_398274624_274533302.1391268349312
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

----- Mail original -----

> De: "Ilia Mirkin" <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> =C3=80: "pierre morrow" <pierre.morrow-GANU6spQydw@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Envoy=C3=A9: Vendredi 31 Janvier 2014 23:58:58
> Objet: Re: [Nouveau] Help needed for bug 58556

> I meant disable it much harder -- like tell nouveau to just ignore it
> as though modeset=3D0 was passed in for it. Also I seem to recall you
> can do an outb (even from grub) that will just turn off the nv96 card
> entirely.

So I denied pci to enable the card, but nothing changed: with noaccel, scre=
en is still corrupted and without it, I still don't boot, getting lots of e=
rrors.=20
Oh, I forgot to precise: the screen gets scrambled just after the handover =
from efifb to nouveaufb.=20

> pstore if you have efi, netconsole, blockconsole. And phone isn't so
> bad either :)

> Yeah, so all these things should only be necessary if you have
> acceleration enabled. I wonder if the card comes up in a funny "I'm
> still executing stuff" state and nouveau fails to "shut it down" when
> noaccel is passed in.

Well, from what I saw in nouveau_accel_init, it just enables things if noac=
cel=3D0, and does nothing otherwise; noaccel isn't used apart from accel_in=
it.=20

> -ilia

Pierre=20

------=_Part_398274624_274533302.1391268349312
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D'text/css'>p { margin: 0; }</style></head><body><=
div style=3D'font-family: arial,helvetica,sans-serif; font-size: 12pt; colo=
r: #000000'><br><br><hr id=3D"zwchr"><blockquote id=3D"DWT246" style=3D"bor=
der-left:2px solid rgb(16, 16, 255);margin-left:5px;padding-left:5px;color:=
#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:=
Helvetica,Arial,sans-serif;font-size:12pt;"><b>De: </b>"Ilia Mirkin" &lt;im=
irkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br><b>=C3=80: </b>"pierre morrow" &lt;pierre.morrow@=
free.fr&gt;<br><b>Cc: </b>nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br><b>Envoy=C3=A9: =
</b>Vendredi 31 Janvier 2014 23:58:58<br><b>Objet: </b>Re: [Nouveau] Help n=
eeded for bug 58556<br><br>I meant disable it much harder -- like tell nouv=
eau to just ignore it<br>as though modeset=3D0 was passed in for it. Also I=
 seem to recall you<br>can do an outb (even from grub) that will just turn =
off the nv96 card<br>entirely.<br><br></blockquote>So I denied pci to enabl=
e the card, but nothing changed: with noaccel, screen is still corrupted an=
d without it, I still don't boot, getting lots of errors.<br>Oh, I forgot t=
o precise: the screen gets scrambled just after the handover from efifb to =
nouveaufb.<br><blockquote id=3D"DWT247" style=3D"border-left:2px solid rgb(=
16, 16, 255);margin-left:5px;padding-left:5px;color:#000;font-weight:normal=
;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-se=
rif;font-size:12pt;"><br>pstore if you have efi, netconsole, blockconsole. =
And phone isn't so<br>bad either :)<br><br><br>Yeah, so all these things sh=
ould only be necessary if you have<br>acceleration enabled. I wonder if the=
 card comes up in a funny "I'm<br>still executing stuff" state and nouveau =
fails to "shut it down" when<br>noaccel is passed in.<br></blockquote>Well,=
 from what I saw in nouveau_accel_init, it just enables things if noaccel=
=3D0, and does nothing otherwise; noaccel isn't used apart from accel_init.=
<br><blockquote style=3D"border-left:2px solid rgb(16, 16, 255);margin-left=
:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-=
decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><br=
>&nbsp;&nbsp;-ilia<br></blockquote>Pierre<br></div></body></html>
------=_Part_398274624_274533302.1391268349312--

--===============0379882611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0379882611==--
