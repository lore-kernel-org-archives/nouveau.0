From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99954] New: Errors when using VirtualBox with 3D
 acceleration: gr: ILLEGAL_CLASS ch 6 [007f7f8000 VirtualBox[5063]] subc 0
 class c000 mthd 2390 data 00000000
Date: Sat, 25 Feb 2017 00:24:41 +0000
Message-ID: <bug-99954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1570552681=="
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


--===============1570552681==
Content-Type: multipart/alternative; boundary="14879822810.FEBe4C4.23746";
 charset="UTF-8"


--14879822810.FEBe4C4.23746
Date: Sat, 25 Feb 2017 00:24:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99954

            Bug ID: 99954
           Summary: Errors when using VirtualBox with 3D acceleration: gr:
                    ILLEGAL_CLASS ch 6 [007f7f8000 VirtualBox[5063]] subc
                    0 class c000 mthd 2390 data 00000000
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mpiechotka-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

On W530 with iGPU disabled I see the errors in dmesg log when I try to run
VirtualBox with 3D acceleration:

[ 8781.350709] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350729] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350749] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350769] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350789] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350808] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350828] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350848] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350868] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350888] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350907] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350927] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2380 data 00000800
[ 8781.350947] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2384 data 00000000
[ 8781.350967] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2388 data 00380800

VirtualBox itself has hang.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14879822810.FEBe4C4.23746
Date: Sat, 25 Feb 2017 00:24:41 +0000
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
   title=3D"NEW - Errors when using VirtualBox with 3D acceleration: gr: IL=
LEGAL_CLASS ch 6 [007f7f8000 VirtualBox[5063]] subc 0 class c000 mthd 2390 =
data 00000000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99954">99954</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Errors when using VirtualBox with 3D acceleration: gr: ILLEGA=
L_CLASS ch 6 [007f7f8000 VirtualBox[5063]] subc 0 class c000 mthd 2390 data=
 00000000
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
          <td>mpiechotka&#64;nvidia.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On W530 with iGPU disabled I see the errors in dmesg log when =
I try to run
VirtualBox with 3D acceleration:

[ 8781.350709] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350729] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350749] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350769] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350789] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350808] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350828] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350848] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350868] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350888] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350907] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2390 data 00000000
[ 8781.350927] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2380 data 00000800
[ 8781.350947] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2384 data 00000000
[ 8781.350967] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [007f7f8000
VirtualBox[5063]] subc 0 class c000 mthd 2388 data 00380800

VirtualBox itself has hang.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14879822810.FEBe4C4.23746--

--===============1570552681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1570552681==--
