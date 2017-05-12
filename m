From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101024] New: Complete graphic freeze
Date: Fri, 12 May 2017 21:26:18 +0000
Message-ID: <bug-101024-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1217923768=="
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


--===============1217923768==
Content-Type: multipart/alternative; boundary="14946243780.43EE.22817";
 charset="UTF-8"


--14946243780.43EE.22817
Date: Fri, 12 May 2017 21:26:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101024

            Bug ID: 101024
           Summary: Complete graphic freeze
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mcondarelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131340
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131340&action=3Dedit
dmesg dump (complete)

I experience random (relatively low occurrence ~ twice a week) graphic lock=
ups.
Video is not updated, mouse is moving but no interaction is possible either
with mouse or keyboard.

System is somewhat alive and I can login via ssh.

I attach a complete dmesg dump taken via ssh.

Attempting to kill xorg to restart it resulted in a complete lockup (ssh ti=
med
out) and I had to brutally power-cycle the machine.

System is an up-to-date debian testing (stretch).

At the time of freeze I had one VirtualBox client (Win7) open but inactive
(window minimized).

I will be available to give further info, if required.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14946243780.43EE.22817
Date: Fri, 12 May 2017 21:26:18 +0000
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
   title=3D"NEW - Complete graphic freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101024">101024</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Complete graphic freeze
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
          <td>mcondarelli&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131340=
" name=3D"attach_131340" title=3D"dmesg dump (complete)">attachment 131340<=
/a> <a href=3D"attachment.cgi?id=3D131340&amp;action=3Dedit" title=3D"dmesg=
 dump (complete)">[details]</a></span>
dmesg dump (complete)

I experience random (relatively low occurrence ~ twice a week) graphic lock=
ups.
Video is not updated, mouse is moving but no interaction is possible either
with mouse or keyboard.

System is somewhat alive and I can login via ssh.

I attach a complete dmesg dump taken via ssh.

Attempting to kill xorg to restart it resulted in a complete lockup (ssh ti=
med
out) and I had to brutally power-cycle the machine.

System is an up-to-date debian testing (stretch).

At the time of freeze I had one VirtualBox client (Win7) open but inactive
(window minimized).

I will be available to give further info, if required.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14946243780.43EE.22817--

--===============1217923768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1217923768==--
