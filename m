From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111007] New: Blender crash when opening material tab
 GTX 750Ti -- NV117 (GM107)
Date: Wed, 26 Jun 2019 18:55:19 +0000
Message-ID: <bug-111007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1438397664=="
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


--===============1438397664==
Content-Type: multipart/alternative; boundary="15615753190.99F90ec.7235"
Content-Transfer-Encoding: 7bit


--15615753190.99F90ec.7235
Date: Wed, 26 Jun 2019 18:55:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111007

            Bug ID: 111007
           Summary: Blender crash when opening material tab GTX 750Ti --
                    NV117 (GM107)
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: joinlaw-kcyQbWKpldg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

System Information
Operating system: Linux-5.1.6-gnu-1-x86_64-with-arch 64 Bits (Parabola
GNU/Linux-libre) arch derivative
Graphics card: NV117 nouveau 4.3 (Core Profile) Mesa 19.1.0

description of error:
Blender crash when opening the material tab in properties and opening previ=
ew
tab
this GPU ( nividia GTX 750Ti ) support OpenGL 4.3 on the nouveau and blender
run fine but when opening material
tab it crash.

and here is glxinfo | grep OpenGL :
OpenGL vendor string: nouveau
OpenGL renderer string: NV117
OpenGL core profile version string: 4.3 (Core Profile) Mesa 19.1.0
OpenGL core profile shading language version string: 4.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.3 (Compatibility Profile) Mesa 19.1.0
OpenGL shading language version string: 4.30
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.1.0
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:.....

NOTE: also reported in https://developer.blender.org/T66159

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15615753190.99F90ec.7235
Date: Wed, 26 Jun 2019 18:55:19 +0000
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
   title=3D"NEW - Blender crash when opening material tab GTX 750Ti -- NV11=
7 (GM107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111007">111007</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Blender crash when opening material tab GTX 750Ti -- NV117 (G=
M107)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>joinlaw&#64;cock.li
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System Information
Operating system: Linux-5.1.6-gnu-1-x86_64-with-arch 64 Bits (Parabola
GNU/Linux-libre) arch derivative
Graphics card: NV117 nouveau 4.3 (Core Profile) Mesa 19.1.0

description of error:
Blender crash when opening the material tab in properties and opening previ=
ew
tab
this GPU ( nividia GTX 750Ti ) support OpenGL 4.3 on the nouveau and blender
run fine but when opening material
tab it crash.

and here is glxinfo | grep OpenGL :
OpenGL vendor string: nouveau
OpenGL renderer string: NV117
OpenGL core profile version string: 4.3 (Core Profile) Mesa 19.1.0
OpenGL core profile shading language version string: 4.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.3 (Compatibility Profile) Mesa 19.1.0
OpenGL shading language version string: 4.30
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.1.0
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:.....

NOTE: also reported in <a href=3D"https://developer.blender.org/T66159">htt=
ps://developer.blender.org/T66159</a></pre>
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

--15615753190.99F90ec.7235--

--===============1438397664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1438397664==--
