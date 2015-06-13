From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90967] [NV92] System freeze using nouveau
Date: Sat, 13 Jun 2015 20:46:21 +0000
Message-ID: <bug-90967-8800-Vn1aKi79gM@http.bugs.freedesktop.org/>
References: <bug-90967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1438393266=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90967-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1438393266==
Content-Type: multipart/alternative; boundary="1434228381.150FBCBA2.24630"; charset="UTF-8"


--1434228381.150FBCBA2.24630
Date: Sat, 13 Jun 2015 20:46:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90967

--- Comment #9 from homer242-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I think I have the same issue with my debian sid.

One week ago, I used nvidia driver and I haven't this kind of problem. Maybe
it's a coincidence because I did some upgrade of my packages.

Like J=C3=A9r=C3=B4me, the problem occurs when I use vlc with "automatic ou=
tput
selection" after a couple of minutes (i think it's random but it's about 20
minutes). When I use "X11 video output (XCB)", the problem don't show up. T=
he
other cases where the problem happens are when I played a youtube video on
iceweasel. Juste a second before my computer is freeze, there is a big
slow-down like a fork-bomb :)

----
libdrm-nouveau2:amd64                     2.4.60-3
libdrm-nouveau2:i386                      2.4.60-3
xserver-xorg-video-nouveau                1:1.0.11-1+b1
----

The most relevant part I think is this log from Xorg.log:

----
(EE) [mi] EQ overflow continuing.  1000 events have been dropped.
(EE) [mi] No further overflow reports will be reported until the clog is
cleared.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/Xorg (xorg_backtrace+0x56) [0x7f8530944a36]
(EE) 1: /usr/bin/Xorg (QueuePointerEvents+0x52) [0x7f8530801902]
(EE) 2: /usr/lib/xorg/modules/input/evdev_drv.so (0x7f8526289000+0x60a7)
[0x7f852628f0a7]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7f8526289000+0x687d)
[0x7f852628f87d]
(EE) 4: /usr/bin/Xorg (0x7f8530792000+0x963a8) [0x7f85308283a8]
(EE) 5: /usr/bin/Xorg (0x7f8530792000+0xbf349) [0x7f8530851349]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7f852e692000+0x35180)
[0x7f852e6c7180]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7f852e770be7]
(EE) 8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7f852fa4fb=
48]
(EE) 9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7f852fa5280b]
(EE) 10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 (nouveau_bo_wait+0x8=
c)
[0x7f852a5a276c]
(EE) 11: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f852a7a7000+0x7ef=
3)
[0x7f852a7aeef3]
(EE) 12: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0x569b)
[0x7f8529f6769b]
(EE) 13: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0x7e5f)
[0x7f8529f69e5f]
(EE) 14: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0x1194b)
[0x7f8529f7394b]
(EE) 15: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0xe810)
[0x7f8529f70810]
(EE) 16: /usr/bin/Xorg (0x7f8530792000+0x13b771) [0x7f85308cd771]
(EE) 17: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0xf72f)
[0x7f8529f7172f]
(EE) 18: /usr/bin/Xorg (0x7f8530792000+0x13212c) [0x7f85308c412c]
(EE) 19: /usr/bin/Xorg (0x7f8530792000+0x57f37) [0x7f85307e9f37]
(EE) 20: /usr/bin/Xorg (0x7f8530792000+0x5c0bb) [0x7f85307ee0bb]
(EE) 21: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf5)
[0x7f852e6b3b45]
(EE) 22: /usr/bin/Xorg (0x7f8530792000+0x464be) [0x7f85307d84be]
(EE)=20

----

I can give you more information if you want. I can easily reproduce the
problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1434228381.150FBCBA2.24630
Date: Sat, 13 Jun 2015 20:46:21 +0000
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
   title=3D"NEW - [NV92] System freeze using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90967#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] System freeze using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90967">bug 90967<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
homer242&#64;gmail.com" title=3D"homer242&#64;gmail.com">homer242&#64;gmail=
.com</a>
</span></b>
        <pre>I think I have the same issue with my debian sid.

One week ago, I used nvidia driver and I haven't this kind of problem. Maybe
it's a coincidence because I did some upgrade of my packages.

Like J=C3=A9r=C3=B4me, the problem occurs when I use vlc with &quot;automat=
ic output
selection&quot; after a couple of minutes (i think it's random but it's abo=
ut 20
minutes). When I use &quot;X11 video output (XCB)&quot;, the problem don't =
show up. The
other cases where the problem happens are when I played a youtube video on
iceweasel. Juste a second before my computer is freeze, there is a big
slow-down like a fork-bomb :)

----
libdrm-nouveau2:amd64                     2.4.60-3
libdrm-nouveau2:i386                      2.4.60-3
xserver-xorg-video-nouveau                1:1.0.11-1+b1
----

The most relevant part I think is this log from Xorg.log:

----
(EE) [mi] EQ overflow continuing.  1000 events have been dropped.
(EE) [mi] No further overflow reports will be reported until the clog is
cleared.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/Xorg (xorg_backtrace+0x56) [0x7f8530944a36]
(EE) 1: /usr/bin/Xorg (QueuePointerEvents+0x52) [0x7f8530801902]
(EE) 2: /usr/lib/xorg/modules/input/evdev_drv.so (0x7f8526289000+0x60a7)
[0x7f852628f0a7]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7f8526289000+0x687d)
[0x7f852628f87d]
(EE) 4: /usr/bin/Xorg (0x7f8530792000+0x963a8) [0x7f85308283a8]
(EE) 5: /usr/bin/Xorg (0x7f8530792000+0xbf349) [0x7f8530851349]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7f852e692000+0x35180)
[0x7f852e6c7180]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7f852e770be7]
(EE) 8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7f852fa4fb=
48]
(EE) 9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7f852fa5280b]
(EE) 10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 (nouveau_bo_wait+0x8=
c)
[0x7f852a5a276c]
(EE) 11: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f852a7a7000+0x7ef=
3)
[0x7f852a7aeef3]
(EE) 12: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0x569b)
[0x7f8529f6769b]
(EE) 13: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0x7e5f)
[0x7f8529f69e5f]
(EE) 14: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0x1194b)
[0x7f8529f7394b]
(EE) 15: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0xe810)
[0x7f8529f70810]
(EE) 16: /usr/bin/Xorg (0x7f8530792000+0x13b771) [0x7f85308cd771]
(EE) 17: /usr/lib/xorg/modules/libexa.so (0x7f8529f62000+0xf72f)
[0x7f8529f7172f]
(EE) 18: /usr/bin/Xorg (0x7f8530792000+0x13212c) [0x7f85308c412c]
(EE) 19: /usr/bin/Xorg (0x7f8530792000+0x57f37) [0x7f85307e9f37]
(EE) 20: /usr/bin/Xorg (0x7f8530792000+0x5c0bb) [0x7f85307ee0bb]
(EE) 21: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf5)
[0x7f852e6b3b45]
(EE) 22: /usr/bin/Xorg (0x7f8530792000+0x464be) [0x7f85307d84be]
(EE)=20

----

I can give you more information if you want. I can easily reproduce the
problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434228381.150FBCBA2.24630--

--===============1438393266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1438393266==--
