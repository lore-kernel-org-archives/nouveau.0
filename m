From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89759] New: WebGL OGL ES GLSL conformance test with
 mesa drivers fails
Date: Wed, 25 Mar 2015 06:27:58 +0000
Message-ID: <bug-89759-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1428984626=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1428984626==
Content-Type: multipart/alternative; boundary="1427264877.7673FF0.24347"; charset="UTF-8"


--1427264877.7673FF0.24347
Date: Wed, 25 Mar 2015 06:27:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89759

            Bug ID: 89759
           Summary: WebGL OGL ES GLSL conformance test with mesa drivers
                    fails
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lukebenes-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

On a GTX 650, the following 2 GLSL tests fail with the nouveau drivers but pass
with the nvidia proprietary driver:

https://www.khronos.org/registry/webgl/conformance-suites/1.0.2/conformance/ogles/GL/functions/functions_001_to_008.html

test: array_float_vert.test.html
FAIL pixel @ (33, 33 was [182,255,255,255] expected [255,255,255,255]

test: array_float_frag.test.html
FAIL pixel @ (33, 33 was [182,255,255,255] expected [255,255,255,255]

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1427264877.7673FF0.24347
Date: Wed, 25 Mar 2015 06:27:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - WebGL OGL ES GLSL conformance test with mesa drivers fails"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89759">89759</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>WebGL OGL ES GLSL conformance test with mesa drivers fails
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
        <pre>On a GTX 650, the following 2 GLSL tests fail with the nouveau drivers but pass
with the nvidia proprietary driver:

<a href="https://www.khronos.org/registry/webgl/conformance-suites/1.0.2/conformance/ogles/GL/functions/functions_001_to_008.html">https://www.khronos.org/registry/webgl/conformance-suites/1.0.2/conformance/ogles/GL/functions/functions_001_to_008.html</a>

test: array_float_vert.test.html
FAIL pixel &#64; (33, 33 was [182,255,255,255] expected [255,255,255,255]

test: array_float_frag.test.html
FAIL pixel &#64; (33, 33 was [182,255,255,255] expected [255,255,255,255]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427264877.7673FF0.24347--

--===============1428984626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1428984626==--
