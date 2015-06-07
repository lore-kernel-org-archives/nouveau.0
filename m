From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] New: PhiMovesPass in register allocator broken
Date: Sun, 07 Jun 2015 19:32:04 +0000
Message-ID: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1978632865=="
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


--===============1978632865==
Content-Type: multipart/alternative; boundary="1433705524.B08F40.26739"; charset="UTF-8"


--1433705524.B08F40.26739
Date: Sun, 7 Jun 2015 19:32:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

            Bug ID: 90887
           Summary: PhiMovesPass in register allocator broken
           Product: Mesa
           Version: git
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 116339
  --> https://bugs.freedesktop.org/attachment.cgi?id=116339&action=edit
Candidate Fix for nv50 PhiMovesPass

The PhiMovesPass depends on strict correspondence between phi argument and
incoming flow edge order. Unfortunately it destroys this correspondence itself
in the needNewElseBlock case resulting in the wrong (potentially uninitialized)
registers being copied.

The attached patch fixes problems in the following games on NVA5 (Debian
Jessie, wine git): Costume Quest (with FXAA option), Lifeless Planet, and
Eidolon. These are not present when using the LLVMPIPE driver.

I have analyzed the situation starting with Lifeless Planet (but simplifying
the shader until I could handle the problem): the postprocessing shader
modifies part of the rendered image with a shader like this

 1. sample the vincinity of the current position
 2. sample the current position
 2. compute something based on all of these pixels
 3. if some condition is reached
 4.     do some more computations (including TEXL)
 5.     replace current position value sampled above by computed value
 6. return current position value or computed value (see if)

The PhiMovesPass detects needNewElseBlock conditions and splits the 'else' edge
incoming from the if thereby switching the order of incoming edges leading to
adding copies from the sampled value to the if branch (discarding the computed
values) and copies from the (unitialized) computed values to the new else block
corrupting the result for all pixels except the ones where the condition is
true (where it produces the originally sampled value).

The fix slightly modifies the needNewElseBlock logic to not detach/attach the
incoming edge. Costume Quest (with FXAA) and Eidolon look correct with this
fix. Lifeless Planet is much better but still somewhat bad, but that may be
intended (it looks similarly crappy with LLVMPIPE). The latter may also be a
problem with wine).

NB: This might be related to bug #90347. The shader code given there looks like
it could trigger this case, but I haven't tried it.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1433705524.B08F40.26739
Date: Sun, 7 Jun 2015 19:32:04 +0000
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
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">90887</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>PhiMovesPass in register allocator broken
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
          <td>All
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
          <td>j-r&#64;online.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116339" name="attach_116339" title="Candidate Fix for nv50 PhiMovesPass">attachment 116339</a> <a href="attachment.cgi?id=116339&amp;action=edit" title="Candidate Fix for nv50 PhiMovesPass">[details]</a></span>
Candidate Fix for nv50 PhiMovesPass

The PhiMovesPass depends on strict correspondence between phi argument and
incoming flow edge order. Unfortunately it destroys this correspondence itself
in the needNewElseBlock case resulting in the wrong (potentially uninitialized)
registers being copied.

The attached patch fixes problems in the following games on NVA5 (Debian
Jessie, wine git): Costume Quest (with FXAA option), Lifeless Planet, and
Eidolon. These are not present when using the LLVMPIPE driver.

I have analyzed the situation starting with Lifeless Planet (but simplifying
the shader until I could handle the problem): the postprocessing shader
modifies part of the rendered image with a shader like this

 1. sample the vincinity of the current position
 2. sample the current position
 2. compute something based on all of these pixels
 3. if some condition is reached
 4.     do some more computations (including TEXL)
 5.     replace current position value sampled above by computed value
 6. return current position value or computed value (see if)

The PhiMovesPass detects needNewElseBlock conditions and splits the 'else' edge
incoming from the if thereby switching the order of incoming edges leading to
adding copies from the sampled value to the if branch (discarding the computed
values) and copies from the (unitialized) computed values to the new else block
corrupting the result for all pixels except the ones where the condition is
true (where it produces the originally sampled value).

The fix slightly modifies the needNewElseBlock logic to not detach/attach the
incoming edge. Costume Quest (with FXAA) and Eidolon look correct with this
fix. Lifeless Planet is much better but still somewhat bad, but that may be
intended (it looks similarly crappy with LLVMPIPE). The latter may also be a
problem with wine).

NB: This might be related to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="show_bug.cgi?id=90347">bug #90347</a>. The shader code given there looks like
it could trigger this case, but I haven't tried it.</pre>
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

--1433705524.B08F40.26739--

--===============1978632865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1978632865==--
