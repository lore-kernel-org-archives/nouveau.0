From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92515] Virtualbox with 3D acceleration and with
 installed vbox-additions crashes
Date: Sun, 13 Dec 2015 21:31:15 +0000
Message-ID: <bug-92515-8800-Wke5we57CE@http.bugs.freedesktop.org/>
References: <bug-92515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1952969836=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92515-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1952969836==
Content-Type: multipart/alternative; boundary="1450042274.dcA257660.18711"; charset="UTF-8"


--1450042274.dcA257660.18711
Date: Sun, 13 Dec 2015 21:31:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92515

Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|10.5                        |10.6

--- Comment #4 from Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm still having this issue with mesa-10.6.9 and kernel-4.1.12 and
libdrm-2.4.65 with vbox-5.0.10

I'm trying to run Plasma 5 inside vbox. Nowadays Plasma 5 and SDDM uses hea=
vily
OGL features throug Qt5Quick. Tricks like QT_XCB_FORCE_SOFTWARE_OPENGL=3D1 =
or
LIBGL_ALWAYS_SOFTWARE=3D1 gives black screen.

Below is the output from host system when , in start Plasma 5 inside vbox w=
ith
3D accel enabled.

gru 13 22:20:12 lazur kernel: vboxdrv: ffffffffc087c020 VMMR0.r0
gru 13 22:20:12 lazur kernel: vboxdrv: ffffffffc0975020 VBoxDDR0.r0
gru 13 22:20:12 lazur kernel: vboxdrv: ffffffffc007d020 VBoxDD2R0.r0
gru 13 22:20:12 lazur kernel: PS2K: Selected scan set 2
gru 13 22:20:21 lazur kernel: HPET: Using timer above configured range: 3
gru 13 22:20:21 lazur kernel: HPET: Using timer above configured range: 3
gru 13 22:20:21 lazur kernel: HPET: Using timer above configured range: 3
gru 13 22:24:08 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER =
- ch
6 [VBoxCrWinCmd[26409]] get 0x002001cf60 put 0x002001d6f4 ib_get 0x00000045
ib_put 0x00000046 state 0x40000004 (... push 0x00406040
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_VALUE
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x0214 data
0x00086e04
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_VALUE
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x0218 data
0x02800000
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_VALUE
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x021c data
0x01e00000
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_BITFIELD
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x0220 data
0x00086e14
gru 13 22:24:08 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR=
 -
ch 6 [VBoxCrWinCmd[26409]] subc 0 mthd 0x0000 data 0x00086e24
gru 13 22:26:05 lazur kernel: vboxdrv: ffffffffc0993020 VMMR0.r0
gru 13 22:26:06 lazur kernel: vboxdrv: ffffffffc0a8c020 VBoxDDR0.r0
gru 13 22:26:06 lazur kernel: vboxdrv: ffffffffc0098020 VBoxDD2R0.r0

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450042274.dcA257660.18711
Date: Sun, 13 Dec 2015 21:31:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tpgxyz&#6=
4;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.com&gt;">=
 <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Virtualbox with 3D acceleration and with installed vbox-a=
dditions crashes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92515">bug 92515<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>10.5
           </td>
           <td>10.6
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Virtualbox with 3D acceleration and with installed vbox-a=
dditions crashes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92515#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Virtualbox with 3D acceleration and with installed vbox-a=
dditions crashes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92515">bug 92515<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tpgxyz&#64;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.=
com&gt;"> <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span></b>
        <pre>I'm still having this issue with mesa-10.6.9 and kernel-4.1.12=
 and
libdrm-2.4.65 with vbox-5.0.10

I'm trying to run Plasma 5 inside vbox. Nowadays Plasma 5 and SDDM uses hea=
vily
OGL features throug Qt5Quick. Tricks like QT_XCB_FORCE_SOFTWARE_OPENGL=3D1 =
or
LIBGL_ALWAYS_SOFTWARE=3D1 gives black screen.

Below is the output from host system when , in start Plasma 5 inside vbox w=
ith
3D accel enabled.

gru 13 22:20:12 lazur kernel: vboxdrv: ffffffffc087c020 VMMR0.r0
gru 13 22:20:12 lazur kernel: vboxdrv: ffffffffc0975020 VBoxDDR0.r0
gru 13 22:20:12 lazur kernel: vboxdrv: ffffffffc007d020 VBoxDD2R0.r0
gru 13 22:20:12 lazur kernel: PS2K: Selected scan set 2
gru 13 22:20:21 lazur kernel: HPET: Using timer above configured range: 3
gru 13 22:20:21 lazur kernel: HPET: Using timer above configured range: 3
gru 13 22:20:21 lazur kernel: HPET: Using timer above configured range: 3
gru 13 22:24:08 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER =
- ch
6 [VBoxCrWinCmd[26409]] get 0x002001cf60 put 0x002001d6f4 ib_get 0x00000045
ib_put 0x00000046 state 0x40000004 (... push 0x00406040
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_VALUE
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x0214 data
0x00086e04
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_VALUE
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x0218 data
0x02800000
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_VALUE
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x021c data
0x01e00000
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
INVALID_BITFIELD
gru 13 22:24:08 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 6
[0x001f5dd000 VBoxCrWinCmd[26409]] subc 4 class 0x502d mthd 0x0220 data
0x00086e14
gru 13 22:24:08 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR=
 -
ch 6 [VBoxCrWinCmd[26409]] subc 0 mthd 0x0000 data 0x00086e24
gru 13 22:26:05 lazur kernel: vboxdrv: ffffffffc0993020 VMMR0.r0
gru 13 22:26:06 lazur kernel: vboxdrv: ffffffffc0a8c020 VBoxDDR0.r0
gru 13 22:26:06 lazur kernel: vboxdrv: ffffffffc0098020 VBoxDD2R0.r0</pre>
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

--1450042274.dcA257660.18711--

--===============1952969836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1952969836==--
