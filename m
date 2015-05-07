From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90363] New: [nv50] HW state is not reset correctly
 when using a new GL context
Date: Thu, 07 May 2015 16:46:53 +0000
Message-ID: <bug-90363-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0622453658=="
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


--===============0622453658==
Content-Type: multipart/alternative; boundary="1431017213.1BEd3600.14869"; charset="UTF-8"


--1431017213.1BEd3600.14869
Date: Thu, 7 May 2015 16:46:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90363

            Bug ID: 90363
           Summary: [nv50] HW state is not reset correctly when using a
                    new GL context
           Product: Mesa
           Version: git
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matteo.mystral-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 115622
  --> https://bugs.freedesktop.org/attachment.cgi?id=115622&action=edit
Hack

Hardware state is not reset correctly when a process makes use of a new GL
context, after it has used and then destroyed the previous one.
This manifests in a (still uncommitted,
https://www.winehq.org/pipermail/wine-patches/2015-April/138974.html) Wine test
which fails on nv50. Actually commenting out stream_test(), which makes use of
instanced draws with ARB_instanced_arrays, workarounds the issue.
A single process executes both tests, destroying and then recreating a GL
context in between. AFAIU specifically the per-instance enable flags are never
reset on the HW and that breaks the latter test.

I'm attaching a patch which "fixes" the issue for me but it's not the correct
approach.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431017213.1BEd3600.14869
Date: Thu, 7 May 2015 16:46:53 +0000
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
   title="NEW - [nv50] HW state is not reset correctly when using a new GL context"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90363">90363</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv50] HW state is not reset correctly when using a new GL context
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
          <td>matteo.mystral&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115622" name="attach_115622" title="Hack">attachment 115622</a> <a href="attachment.cgi?id=115622&amp;action=edit" title="Hack">[details]</a></span>
Hack

Hardware state is not reset correctly when a process makes use of a new GL
context, after it has used and then destroyed the previous one.
This manifests in a (still uncommitted,
<a href="https://www.winehq.org/pipermail/wine-patches/2015-April/138974.html">https://www.winehq.org/pipermail/wine-patches/2015-April/138974.html</a>) Wine test
which fails on nv50. Actually commenting out stream_test(), which makes use of
instanced draws with ARB_instanced_arrays, workarounds the issue.
A single process executes both tests, destroying and then recreating a GL
context in between. AFAIU specifically the per-instance enable flags are never
reset on the HW and that breaks the latter test.

I'm attaching a patch which &quot;fixes&quot; the issue for me but it's not the correct
approach.</pre>
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

--1431017213.1BEd3600.14869--

--===============0622453658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0622453658==--
