From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98270] New: Firefox + Google Maps + scroll => EQ
	overflowing
Date: Sat, 15 Oct 2016 08:00:05 +0000
Message-ID: <bug-98270-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0475745412=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0475745412==
Content-Type: multipart/alternative; boundary="14765184051.cF32Fd3a.9627";
 charset="UTF-8"


--14765184051.cF32Fd3a.9627
Date: Sat, 15 Oct 2016 08:00:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98270

            Bug ID: 98270
           Summary: Firefox + Google Maps + scroll =3D> EQ overflowing
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: infos+xfreedesktop-rd4SwTL5TRxfP/DOUEAtB1AUjnlXr6A1@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I recently switched from NVidia to Nouveau driver, on a dual-head Gentoo AM=
D64
computer.

Only with Google Maps on Firefox (version 45, 46 or 49), the 'default' maps
loads ok but anything that would require to redisplay the map's tiles leads
quickly to total freeze of the computer.=20

 Xorg.0.log file contains several error backtraces :

(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x589e96]
(EE) 1: /usr/bin/X (mieqEnqueue+0x24b) [0x56bddb]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x52) [0x44db52]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fd526d53000+0x623f)
[0x7fd526d5923f]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fd526d53000+0x6acd)
[0x7fd526d59acd]
(EE) 5: /usr/bin/X (0x400000+0x74ea8) [0x474ea8]
(EE) 6: /usr/bin/X (0x400000+0x99da7) [0x499da7]
(EE) 7: /lib64/libc.so.6 (0x7fd53212e000+0x332d0) [0x7fd5321612d0]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fd53220f825]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fd5332bfc68]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fd5332c298b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7fd52da97=
43c]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fd52dc9c000+0x7=
f2d)
[0x7fd52dca3f2d]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (0x7fd52d455000+0x586b)
[0x7fd52d45a86b]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7fd52d455000+0x7f70)
[0x7fd52d45cf70]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7fd52d455000+0x10c01)
[0x7fd52d465c01]
(EE) 16: /usr/bin/X (0x400000+0x114ea7) [0x514ea7]
(EE) 17: /usr/bin/X (0x400000+0x31a86) [0x431a86]
(EE) 18: /usr/bin/X (0x400000+0x3553f) [0x43553f]
(EE) 19: /usr/bin/X (0x400000+0x395b3) [0x4395b3]
(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7fd53214e620]
(EE) 21: /usr/bin/X (_start+0x29) [0x423919]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.

Hardware :=20
02:00.0 VGA compatible controller: NVIDIA Corporation GF106M [GeForce GTX 4=
60M]
(rev a1)

Software :
Kernel 4.1.15
xorg-server 1.18.4
nouveau driver 1.0.12

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14765184051.cF32Fd3a.9627
Date: Sat, 15 Oct 2016 08:00:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Firefox + Google Maps + scroll =3D&gt; EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98270">98270</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Firefox + Google Maps + scroll =3D&gt; EQ overflowing
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>infos+xfreedesktop&#64;ba-consultants.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I recently switched from NVidia to Nouveau driver, on a dual-h=
ead Gentoo AMD64
computer.

Only with Google Maps on Firefox (version 45, 46 or 49), the 'default' maps
loads ok but anything that would require to redisplay the map's tiles leads
quickly to total freeze of the computer.=20

 Xorg.0.log file contains several error backtraces :

(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x589e96]
(EE) 1: /usr/bin/X (mieqEnqueue+0x24b) [0x56bddb]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x52) [0x44db52]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fd526d53000+0x623f)
[0x7fd526d5923f]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fd526d53000+0x6acd)
[0x7fd526d59acd]
(EE) 5: /usr/bin/X (0x400000+0x74ea8) [0x474ea8]
(EE) 6: /usr/bin/X (0x400000+0x99da7) [0x499da7]
(EE) 7: /lib64/libc.so.6 (0x7fd53212e000+0x332d0) [0x7fd5321612d0]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fd53220f825]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fd5332bfc68]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fd5332c298b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7fd52da97=
43c]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fd52dc9c000+0x7=
f2d)
[0x7fd52dca3f2d]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (0x7fd52d455000+0x586b)
[0x7fd52d45a86b]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7fd52d455000+0x7f70)
[0x7fd52d45cf70]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7fd52d455000+0x10c01)
[0x7fd52d465c01]
(EE) 16: /usr/bin/X (0x400000+0x114ea7) [0x514ea7]
(EE) 17: /usr/bin/X (0x400000+0x31a86) [0x431a86]
(EE) 18: /usr/bin/X (0x400000+0x3553f) [0x43553f]
(EE) 19: /usr/bin/X (0x400000+0x395b3) [0x4395b3]
(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7fd53214e620]
(EE) 21: /usr/bin/X (_start+0x29) [0x423919]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.

Hardware :=20
02:00.0 VGA compatible controller: NVIDIA Corporation GF106M [GeForce GTX 4=
60M]
(rev a1)

Software :
Kernel 4.1.15
xorg-server 1.18.4
nouveau driver 1.0.12</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14765184051.cF32Fd3a.9627--

--===============0475745412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0475745412==--
