From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99913] New: [G96] Reclocking fails on voltage
Date: Wed, 22 Feb 2017 19:16:04 +0000
Message-ID: <bug-99913-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1725948913=="
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


--===============1725948913==
Content-Type: multipart/alternative; boundary="14877909640.2ae7b866.32290";
 charset="UTF-8"


--14877909640.2ae7b866.32290
Date: Wed, 22 Feb 2017 19:16:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99913

            Bug ID: 99913
           Summary: [G96] Reclocking fails on voltage
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Attempting to set the performance level to 15 on my laptop results in error=
s.

nouveau 0000:01:00.0: NVIDIA G96 (096500a1)
nouveau 0000:01:00.0: bios: version 62.94.3c.00.15
nouveau 0000:01:00.0: fb: 512 MiB GDDR3

The kernel module has options: config=3DNvClkMode=3D15
That leads to errors:

nouveau 0000:01:00.0: clk: failed to raise voltage: -22
...
nouveau 0000:01:00.0: clk: error setting pstate 3: -22

After that the contents of /sys/kernel/debug/dri/0/pstate are:

03: core 169 MHz shader 338 MHz memory 100 MHz
05: core 275 MHz shader 550 MHz memory 300 MHz
07: core 400 MHz shader 800 MHz memory 300 MHz
0f: core 625 MHz shader 1563 MHz memory 800 MHz AC DC *
AC: core 275 MHz shader 550 MHz memory 799 MHz

Kernel log and VBIOS will follow.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14877909640.2ae7b866.32290
Date: Wed, 22 Feb 2017 19:16:04 +0000
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
   title=3D"NEW - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913">99913</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[G96] Reclocking fails on voltage
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>ppaalanen&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Attempting to set the performance level to 15 on my laptop res=
ults in errors.

nouveau 0000:01:00.0: NVIDIA G96 (096500a1)
nouveau 0000:01:00.0: bios: version 62.94.3c.00.15
nouveau 0000:01:00.0: fb: 512 MiB GDDR3

The kernel module has options: config=3DNvClkMode=3D15
That leads to errors:

nouveau 0000:01:00.0: clk: failed to raise voltage: -22
...
nouveau 0000:01:00.0: clk: error setting pstate 3: -22

After that the contents of /sys/kernel/debug/dri/0/pstate are:

03: core 169 MHz shader 338 MHz memory 100 MHz
05: core 275 MHz shader 550 MHz memory 300 MHz
07: core 400 MHz shader 800 MHz memory 300 MHz
0f: core 625 MHz shader 1563 MHz memory 800 MHz AC DC *
AC: core 275 MHz shader 550 MHz memory 799 MHz

Kernel log and VBIOS will follow.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14877909640.2ae7b866.32290--

--===============1725948913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1725948913==--
