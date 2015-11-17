From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] [GF110] KDE plasma locks randomly due to
 crash of nouveau driver
Date: Tue, 17 Nov 2015 12:50:01 +0000
Message-ID: <bug-92971-8800-iAPLHfXtCI@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0914090033=="
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


--===============0914090033==
Content-Type: multipart/alternative; boundary="1447764601.c6Fa2181.6586"; charset="UTF-8"


--1447764601.c6Fa2181.6586
Date: Tue, 17 Nov 2015 12:50:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92971

--- Comment #6 from Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> ---
Hello,

I tested with the non Xen kernel vmlinux-4.3.0-1-default.
The crash exists also with this kernel

here the journalctl output with a crash when loading a page in the browser:=
 The
screen was totally corrupted but I succeeded to go the the console CTRL Alt=
 F1
and could load top =3D=3D> plasmashell (PID 2358) was running with 100%.=20

I tried to shutdown but the system locked (I did not see any shutdown messa=
ges
and did a hard reset)

Nov 17 13:21:23 hpprol2 login[1943]: ROOT LOGIN ON tty1
Nov 17 13:22:02 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358]: fa=
iled
to idle channel 0xcccc0000 [plasmashell[2358]]
Nov 17 13:22:15 hpprol2 systemd-logind[1141]: Power key pressed.
Nov 17 13:22:17 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358]: fa=
iled
to idle channel 0xcccc0000 [plasmashell[2358]]
Nov 17 13:22:23 hpprol2 kernel: nouveau 0000:0a:00.0: Xorg[2019]:
nv50cal_space: -16

The last line was repeated many times=20
thereafter are some lines related to the shutdown which end with
Nov 17 13:22:56 hpprol2 display-manager[4671]: Shutting down service kdm..d=
one
Nov 17 13:23:06 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2424]:
failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
Nov 17 13:23:21 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2424]:
failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
Nov 17 13:23:30 hpprol2 systemd-logind[1141]: Power key pressed.


can it be the plasmashell which start a crash in nouveau driver?

Regards
Philippe

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447764601.c6Fa2181.6586
Date: Tue, 17 Nov 2015 12:50:01 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF110] KDE plasma locks randomly due to crash of nouveau=
 driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971">bug 92971<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>Hello,

I tested with the non Xen kernel vmlinux-4.3.0-1-default.
The crash exists also with this kernel

here the journalctl output with a crash when loading a page in the browser:=
 The
screen was totally corrupted but I succeeded to go the the console CTRL Alt=
 F1
and could load top =3D=3D&gt; plasmashell (PID 2358) was running with 100%.=
=20

I tried to shutdown but the system locked (I did not see any shutdown messa=
ges
and did a hard reset)

Nov 17 13:21:23 hpprol2 login[1943]: ROOT LOGIN ON tty1
Nov 17 13:22:02 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358]: fa=
iled
to idle channel 0xcccc0000 [plasmashell[2358]]
Nov 17 13:22:15 hpprol2 systemd-logind[1141]: Power key pressed.
Nov 17 13:22:17 hpprol2 kernel: nouveau 0000:0a:00.0: plasmashell[2358]: fa=
iled
to idle channel 0xcccc0000 [plasmashell[2358]]
Nov 17 13:22:23 hpprol2 kernel: nouveau 0000:0a:00.0: Xorg[2019]:
nv50cal_space: -16

The last line was repeated many times=20
thereafter are some lines related to the shutdown which end with
Nov 17 13:22:56 hpprol2 display-manager[4671]: Shutting down service kdm..d=
one
Nov 17 13:23:06 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2424]:
failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
Nov 17 13:23:21 hpprol2 kernel: nouveau 0000:0a:00.0: xembedsniproxy[2424]:
failed to idle channel 0xcccc0000 [xembedsniproxy[2424]]
Nov 17 13:23:30 hpprol2 systemd-logind[1141]: Power key pressed.


can it be the plasmashell which start a crash in nouveau driver?

Regards
Philippe</pre>
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

--1447764601.c6Fa2181.6586--

--===============0914090033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0914090033==--
