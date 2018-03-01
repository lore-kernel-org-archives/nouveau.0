From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] New: DRM: EVO timeout with kernel 4.15.x
Date: Thu, 01 Mar 2018 23:05:16 +0000
Message-ID: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1366279204=="
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


--===============1366279204==
Content-Type: multipart/alternative; boundary="15199455161.4D73393B.25889"
Content-Transfer-Encoding: 7bit


--15199455161.4D73393B.25889
Date: Thu, 1 Mar 2018 23:05:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

            Bug ID: 105319
           Summary: DRM: EVO timeout with kernel 4.15.x
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

booting with kernel 4.15.6 , Linux Fedora 27=20

mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: NVIDIA G98 (298480a=
2)
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: bios: version
62.98.2e.00.08
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: bios: M0203T not fo=
und
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: bios: M0203E not
matched!
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: fb: 256 MiB DDR2
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 =
MiB
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: TMDS table ver=
sion
2.0
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB outp 00:
01000323 00010034
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB outp 01:
02011300 00000028
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB outp 02:
04032312 00020010
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB conn 00:
00000040
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB conn 01:
00000100
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB conn 02:
00001261
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: MM: using M2MF=
 for
buffer copies
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: allocated 1280=
x800
fb: 0x50000, bo 000000008139a319
mar 01 21:05:06 darkstart kernel: fbcon: nouveaufb (fb0) is primary device
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: EVO timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeou=
tmar
01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: EVO timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: GPU lockup -
switching to software fbcon
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame
buffer device
mar 01 21:05:19 darkstart kernel: [drm] Initialized nouveau 1.3.1 20120801 =
for
0000:01:00.0 on minor 0
mar 01 21:05:21 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:30 darkstart kernel: nouveau 0000:01:00.0: DRM: EVO timeout

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199455161.4D73393B.25889
Date: Thu, 1 Mar 2018 23:05:16 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">105319</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DRM: EVO timeout with kernel 4.15.x
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
          <td>sergio&#64;serjux.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>booting with kernel 4.15.6 , Linux Fedora 27=20

mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: NVIDIA G98 (298480a=
2)
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: bios: version
62.98.2e.00.08
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: bios: M0203T not fo=
und
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: bios: M0203E not
matched!
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: fb: 256 MiB DDR2
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 =
MiB
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: TMDS table ver=
sion
2.0
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB outp 00:
01000323 00010034
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB outp 01:
02011300 00000028
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB outp 02:
04032312 00020010
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB conn 00:
00000040
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB conn 01:
00000100
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: DCB conn 02:
00001261
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: MM: using M2MF=
 for
buffer copies
mar 01 21:05:06 darkstart kernel: nouveau 0000:01:00.0: DRM: allocated 1280=
x800
fb: 0x50000, bo 000000008139a319
mar 01 21:05:06 darkstart kernel: fbcon: nouveaufb (fb0) is primary device
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: EVO timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeou=
tmar
01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: EVO timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: GPU lockup -
switching to software fbcon
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:19 darkstart kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame
buffer device
mar 01 21:05:19 darkstart kernel: [drm] Initialized nouveau 1.3.1 20120801 =
for
0000:01:00.0 on minor 0
mar 01 21:05:21 darkstart kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
mar 01 21:05:30 darkstart kernel: nouveau 0000:01:00.0: DRM: EVO timeout</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199455161.4D73393B.25889--

--===============1366279204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1366279204==--
