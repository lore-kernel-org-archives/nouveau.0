From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] [GF110] KDE plasma locks randomly due to
 crash of nouveau driver
Date: Sat, 21 Nov 2015 07:50:35 +0000
Message-ID: <bug-92971-8800-zjOoVYeAUG@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0217353003=="
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


--===============0217353003==
Content-Type: multipart/alternative; boundary="1448092234.F6ca11.12777"; charset="UTF-8"


--1448092234.F6ca11.12777
Date: Sat, 21 Nov 2015 07:50:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92971

--- Comment #8 from Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> ---
Hello,
I desactivated kscreenlocker which resolve the reactivate problem.

But the problem of corrupt screen when starting different programs remains =
and
is worst since the last zypper dup.

I found this error still related to nouveau when the two screen got corrupt=
ed

ov 20 22:37:07 hpprol2 kernel: audit: type=3D1105 audit(1448055427.213:154):
pid=3D2624 uid=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_open
grantors=3Dpam_limits,pam_unix,pam_umask,pam_systemd,pam_gnome_keyring,pam_
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kwin_x11[2097]] subc 0 mthd 0000 data 00000000
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8004000=
0 []
ch 30 [007e6ab000 kwin_x11[2097]] subc 0 mthd 0000 data 00000000
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kwin_x11[2097]] subc 0 mthd 0000 data 00000000
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: read fault at
0000000000 engine 07 [PFIFO] client 06 [PFIFO] reason 00 [PT_NOT_PRESENT] on
channel 30 [007e6ab000 kwin_x11[2097]]
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: fifo engine fau=
lt
on channel 30, recovering...


during each boot i see two error messages related to edac (at the end)
Nov 20 22:58:07 hpprol2 kernel: EDAC MC: Ver: 3.0.0
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca0
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca0
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3c71
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3c71
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3caa
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3caa
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cab
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cab
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cac
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cac
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cad
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cad
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cb8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cb8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf4
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf4
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf6
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf6
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf5
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf5
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Some needed devices are missi=
ng
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Couldn't find mci handler


when the screens are corrupted I can still  go to a console (VIA CTRL-ALT-F=
1)
and if I start top I see that the plasmeshell is running at 100%  and also
Xorg.

trying to kill plasmashell d lock the graphic screens

in the kdm.log I have a lot of these errors

nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch0: krec 0 pushes 1 bufs 2 relocs 0
nouveau: ch0: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch0: buf 00000001 0000001c 00000002 00000000 00000002
nouveau: ch0: psh 00000000 0000006a04 0000006a84
nouveau:        0x20056080
nouveau:        0x000000cf
nouveau:        0x00000000
nouveau:        0x00000040
nouveau:        0x00000001
nouveau:        0x00000000
nouveau:        0x20046086
nouveau:        0x00000774
nouveau:        0x0000040d
nouveau:        0x00000000
nouveau:        0x06a20000
nouveau:        0x200460a0
nouveau:        0x00000000
nouveau:        0x00000000
nouveau:        0x00000774
nouveau:        0x0000040d
nouveau:        0x200160ab
nouveau:        0x00000003
nouveau:        0x20036160
nouveau:        0x00000004
nouveau:        0x000000cf
nouveau:        0x00d6d2d0
nouveau:        0x20046180
nouveau:        0x00000657
nouveau:        0x00000026
nouveau:        0x00000658
nouveau:        0x0000003d
nouveau:        0x20046180
nouveau:        0x0000013f
nouveau:        0x0000003d
nouveau:        0x00000658
nouveau:        0x0000003e
nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch0: krec 0 pushes 1 bufs 2 relocs 0
nouveau: ch0: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch0: buf 00000001 0000001c 00000002 00000000 00000002
nouveau: ch0: psh 00000000 0000006a84 0000006af0
nouveau:        0x20056080
nouveau:        0x000000cf
nouveau:        0x00000000
nouveau:        0x00000040
nouveau:        0x00000001
etc...

Regards
Philippe

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448092234.F6ca11.12777
Date: Sat, 21 Nov 2015 07:50:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971#c8">Comment=
 # 8</a>
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
I desactivated kscreenlocker which resolve the reactivate problem.

But the problem of corrupt screen when starting different programs remains =
and
is worst since the last zypper dup.

I found this error still related to nouveau when the two screen got corrupt=
ed

ov 20 22:37:07 hpprol2 kernel: audit: type=3D1105 audit(1448055427.213:154):
pid=3D2624 uid=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_open
grantors=3Dpam_limits,pam_unix,pam_umask,pam_systemd,pam_gnome_keyring,pam_
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kwin_x11[2097]] subc 0 mthd 0000 data 00000000
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8004000=
0 []
ch 30 [007e6ab000 kwin_x11[2097]] subc 0 mthd 0000 data 00000000
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kwin_x11[2097]] subc 0 mthd 0000 data 00000000
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: read fault at
0000000000 engine 07 [PFIFO] client 06 [PFIFO] reason 00 [PT_NOT_PRESENT] on
channel 30 [007e6ab000 kwin_x11[2097]]
Nov 20 22:39:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: fifo engine fau=
lt
on channel 30, recovering...


during each boot i see two error messages related to edac (at the end)
Nov 20 22:58:07 hpprol2 kernel: EDAC MC: Ver: 3.0.0
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca0
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca0
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3ca8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3c71
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3c71
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3caa
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3caa
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cab
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cab
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cac
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cac
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cad
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cad
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cb8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cb8
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf4
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf4
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf6
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf6
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf5
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Seeking for: PCI ID 8086:3cf5
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Some needed devices are missi=
ng
Nov 20 22:58:07 hpprol2 kernel: EDAC sbridge: Couldn't find mci handler


when the screens are corrupted I can still  go to a console (VIA CTRL-ALT-F=
1)
and if I start top I see that the plasmeshell is running at 100%  and also
Xorg.

trying to kill plasmashell d lock the graphic screens

in the kdm.log I have a lot of these errors

nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch0: krec 0 pushes 1 bufs 2 relocs 0
nouveau: ch0: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch0: buf 00000001 0000001c 00000002 00000000 00000002
nouveau: ch0: psh 00000000 0000006a04 0000006a84
nouveau:        0x20056080
nouveau:        0x000000cf
nouveau:        0x00000000
nouveau:        0x00000040
nouveau:        0x00000001
nouveau:        0x00000000
nouveau:        0x20046086
nouveau:        0x00000774
nouveau:        0x0000040d
nouveau:        0x00000000
nouveau:        0x06a20000
nouveau:        0x200460a0
nouveau:        0x00000000
nouveau:        0x00000000
nouveau:        0x00000774
nouveau:        0x0000040d
nouveau:        0x200160ab
nouveau:        0x00000003
nouveau:        0x20036160
nouveau:        0x00000004
nouveau:        0x000000cf
nouveau:        0x00d6d2d0
nouveau:        0x20046180
nouveau:        0x00000657
nouveau:        0x00000026
nouveau:        0x00000658
nouveau:        0x0000003d
nouveau:        0x20046180
nouveau:        0x0000013f
nouveau:        0x0000003d
nouveau:        0x00000658
nouveau:        0x0000003e
nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch0: krec 0 pushes 1 bufs 2 relocs 0
nouveau: ch0: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch0: buf 00000001 0000001c 00000002 00000000 00000002
nouveau: ch0: psh 00000000 0000006a84 0000006af0
nouveau:        0x20056080
nouveau:        0x000000cf
nouveau:        0x00000000
nouveau:        0x00000040
nouveau:        0x00000001
etc...

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

--1448092234.F6ca11.12777--

--===============0217353003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0217353003==--
