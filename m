From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109558] New: Plasma locks up after splash screen
Date: Tue, 05 Feb 2019 14:30:38 +0000
Message-ID: <bug-109558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0341839110=="
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


--===============0341839110==
Content-Type: multipart/alternative; boundary="15493770400.175B3bA.20038"
Content-Transfer-Encoding: 7bit


--15493770400.175B3bA.20038
Date: Tue, 5 Feb 2019 14:30:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109558

            Bug ID: 109558
           Summary: Plasma locks up after splash screen
           Product: Mesa
           Version: 18.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: qjztreez-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 143306
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143306&action=3Dedit
Output of dmesg

Operating System: Arch Linux=20
KDE Plasma Version: 5.14.5
Qt Version: 5.12.1
KDE Frameworks Version: 5.54.0
Kernel Version: 4.20.6-arch1-1-ARCH
Graphics Card: NVIDIA GeForce GT 650M

Plasma locks up after splash screen, and it is sometimes (but not always)
possible to switch to tty2 and kill the session using loginctl. The magic S=
ysRq
keys Alt+SysRq+REISUB and Alt+SysRq+REISUO always work though.

This seems to be a problem related to acceleration because adding the
'nouveau.noaccel=3D1' kernel parameter solves the problem, but disables some
desktop effects as well.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15493770400.175B3bA.20038
Date: Tue, 5 Feb 2019 14:30:40 +0000
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
   title=3D"NEW - Plasma locks up after splash screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109558">109558</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Plasma locks up after splash screen
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.3
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>qjztreez&#64;outlook.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143306=
" name=3D"attach_143306" title=3D"Output of dmesg">attachment 143306</a> <a=
 href=3D"attachment.cgi?id=3D143306&amp;action=3Dedit" title=3D"Output of d=
mesg">[details]</a></span>
Output of dmesg

Operating System: Arch Linux=20
KDE Plasma Version: 5.14.5
Qt Version: 5.12.1
KDE Frameworks Version: 5.54.0
Kernel Version: 4.20.6-arch1-1-ARCH
Graphics Card: NVIDIA GeForce GT 650M

Plasma locks up after splash screen, and it is sometimes (but not always)
possible to switch to tty2 and kill the session using loginctl. The magic S=
ysRq
keys Alt+SysRq+REISUB and Alt+SysRq+REISUO always work though.

This seems to be a problem related to acceleration because adding the
'nouveau.noaccel=3D1' kernel parameter solves the problem, but disables some
desktop effects as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15493770400.175B3bA.20038--

--===============0341839110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0341839110==--
