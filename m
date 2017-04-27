From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100860] New: Dual Monitor display problem,
 after switching screen positions, with 4.10 Kernels
Date: Thu, 27 Apr 2017 21:56:37 +0000
Message-ID: <bug-100860-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0929245993=="
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


--===============0929245993==
Content-Type: multipart/alternative; boundary="14933301970.d68c.9544";
 charset="UTF-8"


--14933301970.d68c.9544
Date: Thu, 27 Apr 2017 21:56:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100860

            Bug ID: 100860
           Summary: Dual Monitor display problem, after switching screen
                    positions, with 4.10 Kernels
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tobias.muhlhofer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131105
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131105&action=3Dedit
Kernel log

When switching screen positions of dual monitors, there is a display issue.
Steps to reproduce:

- Boot the system.

- Log into an Xterm session (to make things as clean as possible).

--> Screens are displayed by default as 1 left, 2 right. The xterm window i=
s on
screen 1.

- Use xrandr --right-of to switch the screens to put 1 right of 2 (i.e. 2 l=
eft,
1 right).

--> The xterm window remains displayed on screen 1, but the system acts as =
if
the window were now displayed on screen 2. Through this, the mouse pointer
position is displayed accurately. That means, in order for a click to regis=
ter
in the Xterm window, I have to click on the top left of screen 2, which loo=
ks
blank.

Checking xev, all mouse pointer coordinates are displayed as if screen 2 we=
re
on the left.

Suspending the system and waking it back up fixes the problem.


Setup is FC24, 4.10 kernels (4.10.8,4.10.9,4.10.10 tried so far), video car=
d is
Nvidia Quadro K620.

This problem did not occur with the 4.9.13 kernel (which was the last one I
used before the 4.10s).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14933301970.d68c.9544
Date: Thu, 27 Apr 2017 21:56:37 +0000
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
   title=3D"NEW - Dual Monitor display problem, after switching screen posi=
tions, with 4.10 Kernels"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100860">100860</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dual Monitor display problem, after switching screen position=
s, with 4.10 Kernels
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
          <td>critical
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
          <td>tobias.muhlhofer&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131105=
" name=3D"attach_131105" title=3D"Kernel log">attachment 131105</a> <a href=
=3D"attachment.cgi?id=3D131105&amp;action=3Dedit" title=3D"Kernel log">[det=
ails]</a></span>
Kernel log

When switching screen positions of dual monitors, there is a display issue.
Steps to reproduce:

- Boot the system.

- Log into an Xterm session (to make things as clean as possible).

--&gt; Screens are displayed by default as 1 left, 2 right. The xterm windo=
w is on
screen 1.

- Use xrandr --right-of to switch the screens to put 1 right of 2 (i.e. 2 l=
eft,
1 right).

--&gt; The xterm window remains displayed on screen 1, but the system acts =
as if
the window were now displayed on screen 2. Through this, the mouse pointer
position is displayed accurately. That means, in order for a click to regis=
ter
in the Xterm window, I have to click on the top left of screen 2, which loo=
ks
blank.

Checking xev, all mouse pointer coordinates are displayed as if screen 2 we=
re
on the left.

Suspending the system and waking it back up fixes the problem.


Setup is FC24, 4.10 kernels (4.10.8,4.10.9,4.10.10 tried so far), video car=
d is
Nvidia Quadro K620.

This problem did not occur with the 4.9.13 kernel (which was the last one I
used before the 4.10s).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14933301970.d68c.9544--

--===============0929245993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0929245993==--
