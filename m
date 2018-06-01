From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106772] New: Xorg crashes with nouveau and dual
 screen setup
Date: Fri, 01 Jun 2018 19:01:21 +0000
Message-ID: <bug-106772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0371996764=="
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


--===============0371996764==
Content-Type: multipart/alternative; boundary="15278796820.b5EeEf69D.5305"
Content-Transfer-Encoding: 7bit


--15278796820.b5EeEf69D.5305
Date: Fri, 1 Jun 2018 19:01:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106772

            Bug ID: 106772
           Summary: Xorg crashes with nouveau and dual screen setup
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bircoph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139910
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139910&action=3Dedit
gdb.log

Hi!

I tried Nouveau (xorg-dri-nouveau-18.1.0 from mesa 18.1.0 and
xorg-drv-nouveau-1.0.15) with the latest xorg-1.20 and dual monitors. With
single screen and xinerama it works fine, with dual screens (w/o xinerama) =
it
segfaults, see log below.

I want to use separate X screens, since monitors have sufficiently different
DPI and color temp and Xinerama doesn't allow different DPI on different
monitors.

Kernel in use is 4.6.13 with nouveau built as module.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15278796820.b5EeEf69D.5305
Date: Fri, 1 Jun 2018 19:01:22 +0000
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
   title=3D"NEW - Xorg crashes with nouveau and dual screen setup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106772">106772</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg crashes with nouveau and dual screen setup
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
          <td>bircoph&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139910=
" name=3D"attach_139910" title=3D"gdb.log">attachment 139910</a> <a href=3D=
"attachment.cgi?id=3D139910&amp;action=3Dedit" title=3D"gdb.log">[details]<=
/a></span>
gdb.log

Hi!

I tried Nouveau (xorg-dri-nouveau-18.1.0 from mesa 18.1.0 and
xorg-drv-nouveau-1.0.15) with the latest xorg-1.20 and dual monitors. With
single screen and xinerama it works fine, with dual screens (w/o xinerama) =
it
segfaults, see log below.

I want to use separate X screens, since monitors have sufficiently different
DPI and color temp and Xinerama doesn't allow different DPI on different
monitors.

Kernel in use is 4.6.13 with nouveau built as module.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15278796820.b5EeEf69D.5305--

--===============0371996764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0371996764==--
