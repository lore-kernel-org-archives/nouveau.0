From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88822] X freezes after watching videos
Date: Tue, 10 Feb 2015 22:23:00 +0000
Message-ID: <bug-88822-8800-Je9a1ZdEla@http.bugs.freedesktop.org/>
References: <bug-88822-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1590494079=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88822-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1590494079==
Content-Type: multipart/alternative; boundary="1423606979.b7d28e01.31916"; charset="UTF-8"


--1423606979.b7d28e01.31916
Date: Tue, 10 Feb 2015 22:22:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D88822

--- Comment #2 from rv <shuihuzhuan-GANU6spQydw@public.gmane.org> ---
I now have the same problem with Libreoffice 4.4. Log file attached.

Note : I switched my video card to a 8600GS (instead of my old 7600GT)

f=C3=A9vr. 10 22:55:51 maisondubonheur kernel: nouveau E[   PFIFO][0000:01:=
00.0]
still angry after 101 spins, halt
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] EQ overf=
lowing.=20
Additional events will be discarded until existing events are processed.
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE)
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) Backtrace:
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 0: /usr/bin/X=
org.bin
(xorg_backtrace+0x56) [0x594276]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 1: /usr/bin/X=
org.bin
(mieqEnqueue+0x24b) [0x5753cb]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 2: /usr/bin/X=
org.bin
(QueuePointerEvents+0x52) [0x44f1c2]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 3:
/usr/lib/xorg/modules/input/evdev_drv.so (0x7f5bd212e000+0x5f77)
[0x7f5bd2133f77]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 4:
/usr/lib/xorg/modules/input/evdev_drv.so (0x7f5bd212e000+0x66bd)
[0x7f5bd21346bd]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 5: /usr/bin/X=
org.bin
(0x400000+0x75a78) [0x475a78]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 6: /usr/bin/X=
org.bin
(0x400000+0xa0717) [0x4a0717]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 7: /usr/lib/l=
ibc.so.6
(0x7f5bdbbcc000+0x33540) [0x7f5bdbbff540]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 8: /usr/lib/l=
ibc.so.6
(ioctl+0x7) [0x7f5bdbcacb27]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 9:
/usr/lib/libdrm.so.2 (drmIoctl+0x28) [0x7f5bdcd6e9d8]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 10:
/usr/lib/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f5bdcd7139b]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 11:
/usr/lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f5bd64d1829]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 12:
/usr/lib/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xde) [0x7f5bd64d2b4e]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 13:
/usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f5bd66d6000+0x1f669)
[0x7f5bd66f5669]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 14:
/usr/lib/xorg/modules/libexa.so (0x7f5bd5c87000+0xe1ae) [0x7f5bd5c951ae]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 15:
/usr/lib/xorg/modules/libexa.so (0x7f5bd5c87000+0xecf1) [0x7f5bd5c95cf1]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 16: /usr/bin/=
Xorg.bin
(0x400000+0x11a951) [0x51a951]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 17: /usr/bin/=
Xorg.bin
(0x400000+0x110644) [0x510644]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 18: /usr/bin/=
Xorg.bin
(0x400000+0x37807) [0x437807]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 19: /usr/bin/=
Xorg.bin
(0x400000+0x3b9a6) [0x43b9a6]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 20: /usr/lib/=
libc.so.6
(__libc_start_main+0xf0) [0x7f5bdbbec800]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 21: /usr/bin/=
Xorg.bin
(0x400000+0x25dce) [0x425dce]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE)
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] These ba=
cktraces
from mieqEnqueue may point to a culprit higher up the stack.
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] mieq is =
*NOT* the
cause.  It is a victim.
f=C3=A9vr. 10 22:55:58 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] EQ overf=
low
continuing.  100 events have been dropped.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1423606979.b7d28e01.31916
Date: Tue, 10 Feb 2015 22:22:59 +0000
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
   title=3D"NEW - X freezes after watching videos"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88822#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X freezes after watching videos"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88822">bug 88822<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shuihuzhuan&#64;free.fr" title=3D"rv &lt;shuihuzhuan&#64;free.fr&gt;"> <spa=
n class=3D"fn">rv</span></a>
</span></b>
        <pre>I now have the same problem with Libreoffice 4.4. Log file att=
ached.

Note : I switched my video card to a 8600GS (instead of my old 7600GT)

f=C3=A9vr. 10 22:55:51 maisondubonheur kernel: nouveau E[   PFIFO][0000:01:=
00.0]
still angry after 101 spins, halt
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] EQ overf=
lowing.=20
Additional events will be discarded until existing events are processed.
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE)
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) Backtrace:
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 0: /usr/bin/X=
org.bin
(xorg_backtrace+0x56) [0x594276]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 1: /usr/bin/X=
org.bin
(mieqEnqueue+0x24b) [0x5753cb]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 2: /usr/bin/X=
org.bin
(QueuePointerEvents+0x52) [0x44f1c2]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 3:
/usr/lib/xorg/modules/input/evdev_drv.so (0x7f5bd212e000+0x5f77)
[0x7f5bd2133f77]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 4:
/usr/lib/xorg/modules/input/evdev_drv.so (0x7f5bd212e000+0x66bd)
[0x7f5bd21346bd]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 5: /usr/bin/X=
org.bin
(0x400000+0x75a78) [0x475a78]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 6: /usr/bin/X=
org.bin
(0x400000+0xa0717) [0x4a0717]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 7: /usr/lib/l=
ibc.so.6
(0x7f5bdbbcc000+0x33540) [0x7f5bdbbff540]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 8: /usr/lib/l=
ibc.so.6
(ioctl+0x7) [0x7f5bdbcacb27]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 9:
/usr/lib/libdrm.so.2 (drmIoctl+0x28) [0x7f5bdcd6e9d8]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 10:
/usr/lib/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f5bdcd7139b]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 11:
/usr/lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f5bd64d1829]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 12:
/usr/lib/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xde) [0x7f5bd64d2b4e]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 13:
/usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f5bd66d6000+0x1f669)
[0x7f5bd66f5669]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 14:
/usr/lib/xorg/modules/libexa.so (0x7f5bd5c87000+0xe1ae) [0x7f5bd5c951ae]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 15:
/usr/lib/xorg/modules/libexa.so (0x7f5bd5c87000+0xecf1) [0x7f5bd5c95cf1]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 16: /usr/bin/=
Xorg.bin
(0x400000+0x11a951) [0x51a951]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 17: /usr/bin/=
Xorg.bin
(0x400000+0x110644) [0x510644]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 18: /usr/bin/=
Xorg.bin
(0x400000+0x37807) [0x437807]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 19: /usr/bin/=
Xorg.bin
(0x400000+0x3b9a6) [0x43b9a6]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 20: /usr/lib/=
libc.so.6
(__libc_start_main+0xf0) [0x7f5bdbbec800]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) 21: /usr/bin/=
Xorg.bin
(0x400000+0x25dce) [0x425dce]
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE)
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] These ba=
cktraces
from mieqEnqueue may point to a culprit higher up the stack.
f=C3=A9vr. 10 22:55:57 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] mieq is =
*NOT* the
cause.  It is a victim.
f=C3=A9vr. 10 22:55:58 maisondubonheur gdm-Xorg-:1[604]: (EE) [mi] EQ overf=
low
continuing.  100 events have been dropped.</pre>
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

--1423606979.b7d28e01.31916--

--===============1590494079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1590494079==--
