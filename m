From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101000] New: Cinelerra crashes with OpenGL output on
	mesa git
Date: Thu, 11 May 2017 10:50:03 +0000
Message-ID: <bug-101000-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0021234882=="
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


--===============0021234882==
Content-Type: multipart/alternative; boundary="14944998030.A7Defca.543";
 charset="UTF-8"


--14944998030.A7Defca.543
Date: Thu, 11 May 2017 10:50:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101000

            Bug ID: 101000
           Summary: Cinelerra crashes with OpenGL output on mesa git
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 131311
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131311&action=3Dedit
apitrace

Hello!

Not sure if this bug is regression or it was there for long time, but master
branch of Cinelerra-CV (open-source video editing software, see
https://git.cinelerra-cv.org/gitweb for their source code, I talk about ver=
sion
from https://git.cinelerra-cv.org/gitweb?p=3DCinelerraCV.git;a=3Dsummary ) =
crashes
for me on Mesa/Nouveau (nv92), if I set Video Output for OpenGL, on video l=
oad.

I made apitrace of this crash, but it strangely short (attached)

Currently running mesa OpenGL core profile version string: 3.3 (Core Profil=
e)
Mesa 17.2.0-devel (git-bdaff25) , X server 1.19.1, kernel 4.11.0-rc7-x64+,
xf86-video-nouveau commit a7c190e0c230ed2d5e047ed6aba12d71a4866950 (1.0.15).

I'll attach gdb session log, too.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14944998030.A7Defca.543
Date: Thu, 11 May 2017 10:50:03 +0000
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
   title=3D"NEW - Cinelerra crashes with OpenGL output on mesa git"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101000">101000</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cinelerra crashes with OpenGL output on mesa git
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131311=
" name=3D"attach_131311" title=3D"apitrace">attachment 131311</a> <a href=
=3D"attachment.cgi?id=3D131311&amp;action=3Dedit" title=3D"apitrace">[detai=
ls]</a></span>
apitrace

Hello!

Not sure if this bug is regression or it was there for long time, but master
branch of Cinelerra-CV (open-source video editing software, see
<a href=3D"https://git.cinelerra-cv.org/gitweb">https://git.cinelerra-cv.or=
g/gitweb</a> for their source code, I talk about version
from <a href=3D"https://git.cinelerra-cv.org/gitweb?p=3DCinelerraCV.git;a=
=3Dsummary">https://git.cinelerra-cv.org/gitweb?p=3DCinelerraCV.git;a=3Dsum=
mary</a> ) crashes
for me on Mesa/Nouveau (nv92), if I set Video Output for OpenGL, on video l=
oad.

I made apitrace of this crash, but it strangely short (attached)

Currently running mesa OpenGL core profile version string: 3.3 (Core Profil=
e)
Mesa 17.2.0-devel (git-bdaff25) , X server 1.19.1, kernel 4.11.0-rc7-x64+,
xf86-video-nouveau commit a7c190e0c230ed2d5e047ed6aba12d71a4866950 (1.0.15).

I'll attach gdb session log, too.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14944998030.A7Defca.543--

--===============0021234882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0021234882==--
