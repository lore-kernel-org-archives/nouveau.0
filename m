From: pierre.morrow-GANU6spQydw@public.gmane.org
Subject: Re: Help needed for bug 58556
Date: Fri, 31 Jan 2014 23:39:25 +0100 (CET)
Message-ID: <964876991.396653347.1391207965303.JavaMail.root@spooler8-g27.priv.proxad.net>
References: <CAKb7Uvijy5X8=fpt1qy4w_-sVUT9NCc_ft9yOvPPdkCOd6oXSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2138326712=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvijy5X8=fpt1qy4w_-sVUT9NCc_ft9yOvPPdkCOd6oXSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============2138326712==
Content-Type: multipart/alternative;
	boundary="----=_Part_396653346_1732406031.1391207965303"

------=_Part_396653346_1732406031.1391207965303
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

----- Mail original -----

> De: "Ilia Mirkin" <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> =C3=80: "pierre morrow" <pierre.morrow-GANU6spQydw@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Envoy=C3=A9: Vendredi 31 Janvier 2014 21:16:40
> Objet: Re: [Nouveau] Help needed for bug 58556

> Unfortunately this is a *massive* bug... and confused by the "other"
> very similar but apparently not identical bug in the system.

> What happens if you only enable acceleration on the NVAC card? (e.g.
> by hacking up nouveau to ignore the other one entirely). Wasn't there
> some thing where the NV96 card was effectively disabled but still
> appearing in PCI space? Or I might be thinking of a different mac
> situation...

Well, if I disable acceleration for the NV96 card, it doesn't hang after in=
itialising it, but I get spammed (I think it's PAGE_NOT_PRESENT errors, lik=
e [1], but my screen goes garbage at that point, so I can't read anything) =
later on, and I don't get to login.=20
BTW, what could I do to get boot logs even if the system did not make it tr=
ough (apart from recording with my phone...)?=20

> As you probably saw, this is a MASSIVE commit. What exactly was the
> problem with 20abd1634a?

The vblank structure was a little bit modified, and psw->vblank would be in=
itialised only when acceleration is on (it was always initialised before), =
though it would be used inside functions called even when acceleration is o=
ff. You can see it in comments 18 [2] and 20 [3].=20

> Can you go into some detail on what these tests were that yielded a
> successful outcome? IIRC nouveau_channel_new is called to create a
> new... channel, which is used by drm clients. If you don't have
> acceleration, that whole api is disabled, so it shouldn't come up. I
> guess accel_init also initializes drm->channel which is the kernel
> channel for doing stuff. [Although TBH I'm not entirely sure how
> things work without acceleration enabled... but I think there's a
> non-fifo way to show images on the screen.]

My tests were pretty bruteforcing ones:=20
* comment all nouveau_accel_init content, and uncomment block by block unti=
l it works;=20
* then comment all nouveau_channel_new content, and uncomment function by f=
unction until it works;=20
* and finally, I did the same inside nouveau_channel_init (for this functio=
n, only the vram creation, gart creation and dma variables initialisation w=
ere enough to get a clean screen) .=20

To sum up what pieces of nouveau_accel_init were needed to get a clean scre=
en:=20
* return if card is an NV96 one;=20
* init fence;=20
* run nouveau_channel_new:=20
* nouveau_channel_ind=20
* nouveau_channel_init, precisely these parts:=20
* vram creation;=20
* gart creation;=20
* dma variables initialisation.=20
> -ilia

Pierre Moreau=20

[1]: nouveau E[PFB][0000:03:00:0] trapped write at 0x0000546000 on channel =
0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT=20
[2]: https://bugs.freedesktop.org/show_bug.cgi?id=3D58556#c18=20
[3]: https://bugs.freedesktop.org/show_bug.cgi?id=3D58556#c20
------=_Part_396653346_1732406031.1391207965303
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D'text/css'>p { margin: 0; }</style></head><body><=
div style=3D'font-family: arial,helvetica,sans-serif; font-size: 12pt; colo=
r: #000000'><br><br><hr id=3D"zwchr"><blockquote id=3D"DWT995" style=3D"bor=
der-left:2px solid rgb(16, 16, 255);margin-left:5px;padding-left:5px;color:=
#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:=
Helvetica,Arial,sans-serif;font-size:12pt;"><b>De: </b>"Ilia Mirkin" &lt;im=
irkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br><b>=C3=80: </b>"pierre morrow" &lt;pierre.morrow@=
free.fr&gt;<br><b>Cc: </b>nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br><b>Envoy=C3=A9: =
</b>Vendredi 31 Janvier 2014 21:16:40<br><b>Objet: </b>Re: [Nouveau] Help n=
eeded for bug 58556<br><br>Unfortunately this is a *massive* bug... and con=
fused by the "other"<br>very similar but apparently not identical bug in th=
e system.<br><br><br>What happens if you only enable acceleration on the NV=
AC card? (e.g.<br>by hacking up nouveau to ignore the other one entirely). =
Wasn't there<br>some thing where the NV96 card was effectively disabled but=
 still<br>appearing in PCI space? Or I might be thinking of a different mac=
<br>situation...<br><br></blockquote>Well, if I disable acceleration for th=
e NV96 card, it doesn't hang after initialising it, but I get spammed (I th=
ink it's PAGE_NOT_PRESENT errors, like [1], but my screen goes garbage at t=
hat point, so I can't read anything) later on, and I don't get to login.<br=
>BTW, what could I do to get boot logs even if the system did not make it t=
rough (apart from recording with my phone...)?<br><br><blockquote id=3D"DWT=
996" style=3D"border-left:2px solid rgb(16, 16, 255);margin-left:5px;paddin=
g-left:5px;color:#000;font-weight:normal;font-style:normal;text-decoration:=
none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><br>As you pro=
bably saw, this is a MASSIVE commit. What exactly was the<br>problem with 2=
0abd1634a?<br><br></blockquote>The vblank structure was a little bit modifi=
ed, and psw-&gt;vblank would be initialised only when acceleration is on (i=
t was always initialised before), though it would be used inside functions =
called even when acceleration is off. You can see it in comments 18 [2] and=
 20 [3].<br><blockquote id=3D"DWT997" style=3D"border-left:2px solid rgb(16=
, 16, 255);margin-left:5px;padding-left:5px;color:#000;font-weight:normal;f=
ont-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-seri=
f;font-size:12pt;"><br>Can you go into some detail on what these tests were=
 that yielded a<br>successful outcome? IIRC nouveau_channel_new is called t=
o create a<br>new... channel, which is used by drm clients. If you don't ha=
ve<br>acceleration, that whole api is disabled, so it shouldn't come up. I<=
br>guess accel_init also initializes drm-&gt;channel which is the kernel<br=
>channel for doing stuff. [Although TBH I'm not entirely sure how<br>things=
 work without acceleration enabled... &nbsp;but I think there's a<br>non-fi=
fo way to show images on the screen.]<br><br></blockquote>My tests were pre=
tty bruteforcing ones:<br>*&nbsp;&nbsp; comment all nouveau_accel_init cont=
ent, and uncomment block by block until it works;<br>*&nbsp;&nbsp; then com=
ment all nouveau_channel_new content, and uncomment function by function un=
til it works;<br>*&nbsp;&nbsp; and finally, I did the same inside nouveau_c=
hannel_init (for this function, only the vram creation, gart creation and d=
ma variables initialisation were enough to get a clean screen).<br><br>To s=
um up what pieces of nouveau_accel_init were needed to get a clean screen:<=
br>*&nbsp;&nbsp; return if card is an NV96 one;<br>*&nbsp;&nbsp; init fence=
;<br>*&nbsp;&nbsp; run nouveau_channel_new:<br>&nbsp;&nbsp;&nbsp; *&nbsp;&n=
bsp; nouveau_channel_ind<br>&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; nouveau_channe=
l_init, precisely these parts:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; *&nbsp;&nbsp; vram creation;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; *&nbsp;&nbsp; gart creation;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; *&nbsp;&nbsp; dma variables initialisation.<blockquote style=3D"border-le=
ft:2px solid rgb(16, 16, 255);margin-left:5px;padding-left:5px;color:#000;f=
ont-weight:normal;font-style:normal;text-decoration:none;font-family:Helvet=
ica,Arial,sans-serif;font-size:12pt;">&nbsp;&nbsp;-ilia<br></blockquote><br=
>Pierre Moreau<br><br><br>[1]: nouveau E[PFB][0000:03:00:0] trapped write a=
t 0x0000546000 on=20
channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT<br=
>[2]: https://bugs.freedesktop.org/show_bug.cgi?id=3D58556#c18<br>[3]: http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D58556#c20</div></body></html>
------=_Part_396653346_1732406031.1391207965303--

--===============2138326712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2138326712==--
