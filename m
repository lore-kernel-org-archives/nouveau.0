From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98525] New: nouveau graphics freeze when using KDE
 Plasma 5 with "fifo: PBDMA0: 00200000 subc 0 mthd 000c data 00000000"
Date: Tue, 01 Nov 2016 08:24:43 +0000
Message-ID: <bug-98525-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1674221372=="
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


--===============1674221372==
Content-Type: multipart/alternative; boundary="14779886831.5eFDC399.25333";
 charset="UTF-8"


--14779886831.5eFDC399.25333
Date: Tue, 1 Nov 2016 08:24:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98525

            Bug ID: 98525
           Summary: nouveau graphics freeze when using KDE Plasma 5 with
                    "fifo: PBDMA0: 00200000 subc 0 mthd 000c data
                    00000000"
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Kernel version: 4.4.26

Graphic card: "ASUS GeForce GTX 660 PCI 3.0 2GB DDR5"

uname: "Linux 4.4.26-gentoo #1 SMP Mon Oct 31 17:05:30 CET 2016 x86_64 Inte=
l(R)
Xeon(R) CPU E3-1230 v3 @ 3.30GHz GenuineIntel GNU/Linux

SW versions:
x11-base/xorg-drivers-1.18-r1
x11-base/xorg-server-1.18.4
x11-base/xorg-x11-7.4-r2
kde-plasma/kwin-5.7.5

The system freezes, the X screen gets locked, mouse can still be moved,
switching VT console is not possible, three-finger-salute does not work, no
keyboard login possible Login via SSH and reboot still possible.

The bug is usually triggered if huge parts of the display needs rapid updat=
es,
e.g. compiling a piece of software in a X terminal in full screen mode.

I use the proprietary PGRAPH firmware due to bugs #69882, #93629, #93630 and
#95054.

Kernel message:

nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 12 [023f28f000
Compositor[2492]] subc 0 mthd 000c data 00000000

This message floods the logs until they are overwritten from the beginning.=
 The
other message is "Missed NN kernel messages".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14779886831.5eFDC399.25333
Date: Tue, 1 Nov 2016 08:24:43 +0000
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
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5 with &quo=
t;fifo: PBDMA0: 00200000 subc 0 mthd 000c data 00000000&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98525">98525</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau graphics freeze when using KDE Plasma 5 with &quot;fi=
fo: PBDMA0: 00200000 subc 0 mthd 000c data 00000000&quot;
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
          <td>matthias.h.nagel&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Kernel version: 4.4.26

Graphic card: &quot;ASUS GeForce GTX 660 PCI 3.0 2GB DDR5&quot;

uname: &quot;Linux 4.4.26-gentoo #1 SMP Mon Oct 31 17:05:30 CET 2016 x86_64=
 Intel(R)
Xeon(R) CPU E3-1230 v3 &#64; 3.30GHz GenuineIntel GNU/Linux

SW versions:
x11-base/xorg-drivers-1.18-r1
x11-base/xorg-server-1.18.4
x11-base/xorg-x11-7.4-r2
kde-plasma/kwin-5.7.5

The system freezes, the X screen gets locked, mouse can still be moved,
switching VT console is not possible, three-finger-salute does not work, no
keyboard login possible Login via SSH and reboot still possible.

The bug is usually triggered if huge parts of the display needs rapid updat=
es,
e.g. compiling a piece of software in a X terminal in full screen mode.

I use the proprietary PGRAPH firmware due to bugs <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"show_bug.cgi?id=3D69882">#69882</a>, <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"show_bug.cgi?id=3D93629">#93629</a>, <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] disrupted display, cannot switch VT, everything el=
se still works, E[ PDISP] link training failed"
   href=3D"show_bug.cgi?id=3D93630">#93630</a> and
#95054.

Kernel message:

nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 12 [023f28f000
Compositor[2492]] subc 0 mthd 000c data 00000000

This message floods the logs until they are overwritten from the beginning.=
 The
other message is &quot;Missed NN kernel messages&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14779886831.5eFDC399.25333--

--===============1674221372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1674221372==--
