From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] [GF110] KDE plasma locks randomly due to
 crash of nouveau driver
Date: Tue, 17 Nov 2015 13:05:52 +0000
Message-ID: <bug-92971-8800-9lywVUnW2I@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1541386941=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1541386941==
Content-Type: multipart/alternative; boundary="1447765551.82462.8999"; charset="UTF-8"


--1447765551.82462.8999
Date: Tue, 17 Nov 2015 13:05:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92971

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Philippe Cond=C3=A9 from comment #6)
> Hello,
>=20
> I tested with the non Xen kernel vmlinux-4.3.0-1-default.
> The crash exists also with this kernel
>=20
> here the journalctl output with a crash when loading a page in the browse=
r:
> The screen was totally corrupted but I succeeded to go the the console CT=
RL
> Alt F1 and could load top =3D=3D> plasmashell (PID 2358) was running with=
 100%.

Probably busy-waiting on a fence...

>=20
> I tried to shutdown but the system locked (I did not see any shutdown
> messages and did a hard reset)
>=20
> Nov 17 13:21:23 hpprol2 login[1943]: ROOT LOGIN ON tty1
> Nov 17 13:22:02 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358]:
> failed to idle channel 0xcccc0000 [plasmashell[2358]]

This generally indicates a GPU hang. This was the first complaint of any so=
rt
from nouveau in your logs? Nothing before that other than the init messages=
 at
boot time?

> Nov 17 13:22:15 hpprol2 systemd-logind[1141]: Power key pressed.
> Nov 17 13:22:17 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358]:
> failed to idle channel 0xcccc0000 [plasmashell[2358]]
> Nov 17 13:22:23 hpprol2 kernel: nouveau 0000:0a:00.0: Xorg[2019]:
> nv50cal_space: -16

This definitely indicates a GPU hang.

>=20
> The last line was repeated many times=20
> thereafter are some lines related to the shutdown which end with
> Nov 17 13:22:56 hpprol2 display-manager[4671]: Shutting down service
> kdm..done
> Nov 17 13:23:06 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2424=
]:
> failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
> Nov 17 13:23:21 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2424=
]:
> failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
> Nov 17 13:23:30 hpprol2 systemd-logind[1141]: Power key pressed.
>=20
>=20
> can it be the plasmashell which start a crash in nouveau driver?

Various people have poorly understood issues with KDE5 and nouveau. A class=
 of
those are fixed in kernel 4.3, but from the looks of it, hardly all.

I don't think this is your issue, but there have been some locking fixes:

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=3D2f3a56ad019e378a=
352e9cb7a559f478826f1a87
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=3D4179b15c6e9fcfb2=
53e811e5477debe46c84c395

are the ones that'd apply for your GPU. Don't think they'll have an effect
though, but it's something to try (you appear to be comfortable building
kernels).

It is also worth noting that at some point in the past, people with GF110's
(NVC8) have had various issues with nouveau's context switching firmware. We
believe we fixed those, but... who knows. You could try using blob pgraph
firmware. See http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmwa=
re
for how to extract it, and boot with nouveau.config=3DNvGrUseFW=3D1 . [Yeah=
, that
page is about video decoding firmware, but that script also extracts the PG=
RAPH
ctxsw fw.]

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447765551.82462.8999
Date: Tue, 17 Nov 2015 13:05:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF110] KDE plasma locks randomly due to crash of nouveau=
 driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF110] KDE plasma locks randomly due to crash of nouveau=
 driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971">bug 92971<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Philippe Cond=C3=A9 from <a href=3D"show_bug.cgi?=
id=3D92971#c6">comment #6</a>)
<span class=3D"quote">&gt; Hello,
&gt;=20
&gt; I tested with the non Xen kernel vmlinux-4.3.0-1-default.
&gt; The crash exists also with this kernel
&gt;=20
&gt; here the journalctl output with a crash when loading a page in the bro=
wser:
&gt; The screen was totally corrupted but I succeeded to go the the console=
 CTRL
&gt; Alt F1 and could load top =3D=3D&gt; plasmashell (PID 2358) was runnin=
g with 100%.</span >

Probably busy-waiting on a fence...

<span class=3D"quote">&gt;=20
&gt; I tried to shutdown but the system locked (I did not see any shutdown
&gt; messages and did a hard reset)
&gt;=20
&gt; Nov 17 13:21:23 hpprol2 login[1943]: ROOT LOGIN ON tty1
&gt; Nov 17 13:22:02 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358=
]:
&gt; failed to idle channel 0xcccc0000 [plasmashell[2358]]</span >

This generally indicates a GPU hang. This was the first complaint of any so=
rt
from nouveau in your logs? Nothing before that other than the init messages=
 at
boot time?

<span class=3D"quote">&gt; Nov 17 13:22:15 hpprol2 systemd-logind[1141]: Po=
wer key pressed.
&gt; Nov 17 13:22:17 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358=
]:
&gt; failed to idle channel 0xcccc0000 [plasmashell[2358]]
&gt; Nov 17 13:22:23 hpprol2 kernel: nouveau 0000:0a:00.0: Xorg[2019]:
&gt; nv50cal_space: -16</span >

This definitely indicates a GPU hang.

<span class=3D"quote">&gt;=20
&gt; The last line was repeated many times=20
&gt; thereafter are some lines related to the shutdown which end with
&gt; Nov 17 13:22:56 hpprol2 display-manager[4671]: Shutting down service
&gt; kdm..done
&gt; Nov 17 13:23:06 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2=
424]:
&gt; failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
&gt; Nov 17 13:23:21 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2=
424]:
&gt; failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
&gt; Nov 17 13:23:30 hpprol2 systemd-logind[1141]: Power key pressed.
&gt;=20
&gt;=20
&gt; can it be the plasmashell which start a crash in nouveau driver?</span=
 >

Various people have poorly understood issues with KDE5 and nouveau. A class=
 of
those are fixed in kernel 4.3, but from the looks of it, hardly all.

I don't think this is your issue, but there have been some locking fixes:

<a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=3D2f3a5=
6ad019e378a352e9cb7a559f478826f1a87">http://cgit.freedesktop.org/~darktama/=
nouveau/commit/?id=3D2f3a56ad019e378a352e9cb7a559f478826f1a87</a>
<a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=3D4179b=
15c6e9fcfb253e811e5477debe46c84c395">http://cgit.freedesktop.org/~darktama/=
nouveau/commit/?id=3D4179b15c6e9fcfb253e811e5477debe46c84c395</a>

are the ones that'd apply for your GPU. Don't think they'll have an effect
though, but it's something to try (you appear to be comfortable building
kernels).

It is also worth noting that at some point in the past, people with GF110's
(NVC8) have had various issues with nouveau's context switching firmware. We
believe we fixed those, but... who knows. You could try using blob pgraph
firmware. See <a href=3D"http://nouveau.freedesktop.org/wiki/VideoAccelerat=
ion/#firmware">http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmw=
are</a>
for how to extract it, and boot with nouveau.config=3DNvGrUseFW=3D1 . [Yeah=
, that
page is about video decoding firmware, but that script also extracts the PG=
RAPH
ctxsw fw.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447765551.82462.8999--

--===============1541386941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1541386941==--
