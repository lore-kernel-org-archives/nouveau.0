From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97462] New: Graphics deadlock "ILLEGAL_MTHD" in
 nouveau with mesa version 11.2.2 when visiting Google Maps with firefox
 49.0b5
Date: Wed, 24 Aug 2016 09:10:15 +0000
Message-ID: <bug-97462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650719700=="
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


--===============1650719700==
Content-Type: multipart/alternative; boundary="14720298151.FA6FAF.27805";
 charset="UTF-8"


--14720298151.FA6FAF.27805
Date: Wed, 24 Aug 2016 09:10:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

            Bug ID: 97462
           Summary: Graphics deadlock "ILLEGAL_MTHD" in nouveau with mesa
                    version 11.2.2 when visiting Google Maps with firefox
                    49.0b5
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: wadev-cl+VPiYnx/0HWmgEVkV9KA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When visiting Google Maps website from Firefox 49.0b5, the computer totally
locks up.
It becomes unresponsive, no keyboard input (not even leds) nor mouse activi=
ty
from there on.

If I press the power button, however, it *will* shut down in a superfast 5-6
minutes course.

This must be the same problem as #33222 and #96802, more details added for
reproducibility. Should you need any further information, please let me kno=
w.

glxinfo excerpt:

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: nouveau (0x10de)
    Device: NVD9 (0x104a)
    Version: 11.2.2
    Accelerated: yes
    Video memory: 2031MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.1
    Max compat profile version: 3.0
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.0
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.2.2
OpenGL core profile shading language version string: 4.10

Syslog excerpt as follows:

Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 000c data
80000671
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 =
[]
ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0020 data 00004302
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0030 data
200104d6
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0034 data
00004303
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0038 data
800103e4
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 003c data
20010680
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0040 data
00001111
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0044 data
00000000
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0048 data
800104b3
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 004c data
800104ba
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 00000004
[INVALID_VALUE] ch 7 [007f9ed000 Compositor[29014]] subc 0 class 9297 mthd =
0804
data 3a88acfb
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0054 data
00000203
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0058 data
8000066f
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 005c data
800004e0
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0060 data
800004bb
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: read fault at
0020040000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT=
] on
channel 7 [007f9ed000 Compositor[29014]]
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: fifo engine fault=
 on
channel 7, recovering...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14720298151.FA6FAF.27805
Date: Wed, 24 Aug 2016 09:10:15 +0000
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
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462">97462</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau with me=
sa version 11.2.2 when visiting Google Maps with firefox 49.0b5
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
          <td>major
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
          <td>wadev&#64;mailbox.hu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When visiting Google Maps website from Firefox 49.0b5, the com=
puter totally
locks up.
It becomes unresponsive, no keyboard input (not even leds) nor mouse activi=
ty
from there on.

If I press the power button, however, it *will* shut down in a superfast 5-6
minutes course.

This must be the same problem as #33222 and #96802, more details added for
reproducibility. Should you need any further information, please let me kno=
w.

glxinfo excerpt:

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: nouveau (0x10de)
    Device: NVD9 (0x104a)
    Version: 11.2.2
    Accelerated: yes
    Video memory: 2031MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.1
    Max compat profile version: 3.0
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.0
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.2.2
OpenGL core profile shading language version string: 4.10

Syslog excerpt as follows:

Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 000c data
80000671
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 =
[]
ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0020 data 00004302
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0030 data
200104d6
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0034 data
00004303
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0038 data
800103e4
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 003c data
20010680
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0040 data
00001111
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0044 data
00000000
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0048 data
800104b3
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 004c data
800104ba
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 00000004
[INVALID_VALUE] ch 7 [007f9ed000 Compositor[29014]] subc 0 class 9297 mthd =
0804
data 3a88acfb
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0054 data
00000203
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0058 data
8000066f
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 005c data
800004e0
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[29014]] subc 0 mthd 0060 data
800004bb
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: read fault at
0020040000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT=
] on
channel 7 [007f9ed000 Compositor[29014]]
Aug 23 10:46:13 terra kernel: nouveau 0000:01:00.0: fifo: fifo engine fault=
 on
channel 7, recovering...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14720298151.FA6FAF.27805--

--===============1650719700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1650719700==--
