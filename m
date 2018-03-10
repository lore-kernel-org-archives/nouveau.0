From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105432] New: [NVE0] Display Freezes but SSH Works
 When Using OpenGL Applications
Date: Sat, 10 Mar 2018 22:03:43 +0000
Message-ID: <bug-105432-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1384151245=="
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


--===============1384151245==
Content-Type: multipart/alternative; boundary="15207194230.aD4B86b99.4923"
Content-Transfer-Encoding: 7bit


--15207194230.aD4B86b99.4923
Date: Sat, 10 Mar 2018 22:03:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105432

            Bug ID: 105432
           Summary: [NVE0] Display Freezes but SSH Works When Using OpenGL
                    Applications
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyroninja-C5B2xTl6qTs@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

System:
Gentoo - Last Updated 2018-03-09
libdrm: 2.4.91
mesa: 18.0.0
xf86-video-nouveau-1.0.15
Graphics Card: NVIDIA GeForce GTX 650 Ti Boost

Description:
When I am using opengl application, after a random amount of time of contin=
uous
use my system will freeze. On the Diagnosing a Hang wiki page my machine
reaches level 3 where my display is frozen, but my mouse doesn't move nor d=
oes
my num lock key turn on my num lock light on my keyboard. My ssh connection
still works though. Attached is a log of me loading quake3-cpma (a mod to
ioquake3) and it immediately freezing on the main menu. Often times I can p=
lay
several matches before it freezes. I have also experienced this hang when u=
sing
mpv (a movie player).

Work Around:
Using the kernel parameter nouveau.noaccel=3D1 prevents lockups, but switch=
es you
into using software rendering for opengl.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15207194230.aD4B86b99.4923
Date: Sat, 10 Mar 2018 22:03:43 +0000
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
   title=3D"NEW - [NVE0] Display Freezes but SSH Works When Using OpenGL Ap=
plications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105432">105432</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE0] Display Freezes but SSH Works When Using OpenGL Applic=
ations
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
          <td>gyroninja&#64;tfwno.gf
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System:
Gentoo - Last Updated 2018-03-09
libdrm: 2.4.91
mesa: 18.0.0
xf86-video-nouveau-1.0.15
Graphics Card: NVIDIA GeForce GTX 650 Ti Boost

Description:
When I am using opengl application, after a random amount of time of contin=
uous
use my system will freeze. On the Diagnosing a Hang wiki page my machine
reaches level 3 where my display is frozen, but my mouse doesn't move nor d=
oes
my num lock key turn on my num lock light on my keyboard. My ssh connection
still works though. Attached is a log of me loading quake3-cpma (a mod to
ioquake3) and it immediately freezing on the main menu. Often times I can p=
lay
several matches before it freezes. I have also experienced this hang when u=
sing
mpv (a movie player).

Work Around:
Using the kernel parameter nouveau.noaccel=3D1 prevents lockups, but switch=
es you
into using software rendering for opengl.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15207194230.aD4B86b99.4923--

--===============1384151245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1384151245==--
