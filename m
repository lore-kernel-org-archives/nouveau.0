From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97067] New: WebGL:
 conformance/glsl/misc/shaders-with-invariance.html Fail
Date: Sun, 24 Jul 2016 20:03:53 +0000
Message-ID: <bug-97067-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838579306=="
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


--===============0838579306==
Content-Type: multipart/alternative; boundary="14693906320.C0Bcba8.3972";
 charset="UTF-8"


--14693906320.C0Bcba8.3972
Date: Sun, 24 Jul 2016 20:03:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97067

            Bug ID: 97067
           Summary: WebGL:
                    conformance/glsl/misc/shaders-with-invariance.html
                    Fail
           Product: Mesa
           Version: 11.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lukebenes-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

With a GeForce GTX 650 and Mesa 11.2.0 I'm getting the following failure on
Google Chrome and Firefox


https://www.khronos.org/registry/webgl/conformance-suites/1.0.3/conformance=
/glsl/misc/shaders-with-invariance.html?webglVersion=3D1


test: vertex shader with variant varying and fragment shader with invariant
(global setting) varying must fail

FAIL [unexpected fragment shader compile status] (expected: true) vertex sh=
ader
with variant varying and fragment shader with invariant (global setting)
varying must fail


test: vertex shader with invariant varying and fragment shader with invaria=
nt
(global setting) varying must succeed

FAIL [unexpected fragment shader compile status] (expected: true) vertex sh=
ader
with invariant varying and fragment shader with invariant (global setting)
varying must succeed

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14693906320.C0Bcba8.3972
Date: Sun, 24 Jul 2016 20:03:52 +0000
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
   title=3D"NEW - WebGL: conformance/glsl/misc/shaders-with-invariance.html=
 Fail"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97067">97067</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>WebGL:  conformance/glsl/misc/shaders-with-invariance.html Fa=
il
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
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
          <td>lukebenes&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>With a GeForce GTX 650 and Mesa 11.2.0 I'm getting the followi=
ng failure on
Google Chrome and Firefox


<a href=3D"https://www.khronos.org/registry/webgl/conformance-suites/1.0.3/=
conformance/glsl/misc/shaders-with-invariance.html?webglVersion=3D1">https:=
//www.khronos.org/registry/webgl/conformance-suites/1.0.3/conformance/glsl/=
misc/shaders-with-invariance.html?webglVersion=3D1</a>


test: vertex shader with variant varying and fragment shader with invariant
(global setting) varying must fail

FAIL [unexpected fragment shader compile status] (expected: true) vertex sh=
ader
with variant varying and fragment shader with invariant (global setting)
varying must fail


test: vertex shader with invariant varying and fragment shader with invaria=
nt
(global setting) varying must succeed

FAIL [unexpected fragment shader compile status] (expected: true) vertex sh=
ader
with invariant varying and fragment shader with invariant (global setting)
varying must succeed</pre>
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

--14693906320.C0Bcba8.3972--

--===============0838579306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0838579306==--
