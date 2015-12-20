From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93454] New: Can't build with LLVM/clang 3.7.0
Date: Sun, 20 Dec 2015 01:49:10 +0000
Message-ID: <bug-93454-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0309113585=="
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


--===============0309113585==
Content-Type: multipart/alternative; boundary="1450576150.4aD380.14152"; charset="UTF-8"


--1450576150.4aD380.14152
Date: Sun, 20 Dec 2015 01:49:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93454

            Bug ID: 93454
           Summary: Can't build with LLVM/clang 3.7.0
           Product: Mesa
           Version: 11.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

System is OpenMandriva Cooker running LLVM/clang 3.7.0 as default compiler.

When i build mesa i got this error:

Makefile:1205: recipe for target 'nv50/nv84_video_vp.lo' failed
make[3]: Leaving directory
'/builddir/build/BUILD/mesa-11.0.7/src/gallium/drivers/nouveau'
In file included from nv50/nv84_video_vp.c:25:
In file included from ../../../../src/gallium/auxiliary/util/u_sse.h:140:
/usr/bin/../lib64/clang/3.7.0/include/tmmintrin.h:28:2: error: "SSSE3
instruction set not enabled"
#error "SSSE3 instruction set not enabled"
 ^
1 error generated.
make[3]: *** [nv50/nv84_video_vp.lo] Error 1
make[3]: *** Waiting for unfinished jobs....

Adding -mssse3 to CFLAGS will not work for all hardware.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450576150.4aD380.14152
Date: Sun, 20 Dec 2015 01:49:10 +0000
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
   title="NEW - Can't build with LLVM/clang 3.7.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93454">93454</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Can't build with LLVM/clang 3.7.0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>tpgxyz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System is OpenMandriva Cooker running LLVM/clang 3.7.0 as default compiler.

When i build mesa i got this error:

Makefile:1205: recipe for target 'nv50/nv84_video_vp.lo' failed
make[3]: Leaving directory
'/builddir/build/BUILD/mesa-11.0.7/src/gallium/drivers/nouveau'
In file included from nv50/nv84_video_vp.c:25:
In file included from ../../../../src/gallium/auxiliary/util/u_sse.h:140:
/usr/bin/../lib64/clang/3.7.0/include/tmmintrin.h:28:2: error: &quot;SSSE3
instruction set not enabled&quot;
#error &quot;SSSE3 instruction set not enabled&quot;
 ^
1 error generated.
make[3]: *** [nv50/nv84_video_vp.lo] Error 1
make[3]: *** Waiting for unfinished jobs....

Adding -mssse3 to CFLAGS will not work for all hardware.</pre>
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

--1450576150.4aD380.14152--

--===============0309113585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0309113585==--
