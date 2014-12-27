From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87775] New: [ALL] WARNING: value %x not uniquely
	defined
Date: Sat, 27 Dec 2014 21:34:30 +0000
Message-ID: <bug-87775-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1423482984=="
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


--===============1423482984==
Content-Type: multipart/alternative; boundary="1419716070.2F5D83c0.32478"; charset="UTF-8"


--1419716070.2F5D83c0.32478
Date: Sat, 27 Dec 2014 21:34:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87775

            Bug ID: 87775
           Summary: [ALL] WARNING: value %x not uniquely defined
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org

Created attachment 111409
  --> https://bugs.freedesktop.org/attachment.cgi?id=111409&action=edit
tgsi shader

For the attached shader:

WARNING: value %17 not uniquely defined
WARNING: value %18 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %22 not uniquely defined
WARNING: value %7 not uniquely defined
WARNING: value %20 not uniquely defined
WARNING: value %21 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined

Pretty sure the warnings are bogus, but need to either not emit them, or fix
their cause.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419716070.2F5D83c0.32478
Date: Sat, 27 Dec 2014 21:34:30 +0000
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
   title="NEW - [ALL] WARNING: value %x not uniquely defined"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87775">87775</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[ALL] WARNING: value %x not uniquely defined
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
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111409" name="attach_111409" title="tgsi shader">attachment 111409</a> <a href="attachment.cgi?id=111409&amp;action=edit" title="tgsi shader">[details]</a></span>
tgsi shader

For the attached shader:

WARNING: value %17 not uniquely defined
WARNING: value %18 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined
WARNING: value %22 not uniquely defined
WARNING: value %7 not uniquely defined
WARNING: value %20 not uniquely defined
WARNING: value %21 not uniquely defined
WARNING: value %57 not uniquely defined
WARNING: value %54 not uniquely defined
WARNING: value %55 not uniquely defined
WARNING: value %56 not uniquely defined

Pretty sure the warnings are bogus, but need to either not emit them, or fix
their cause.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419716070.2F5D83c0.32478--

--===============1423482984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1423482984==--
