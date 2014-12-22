From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87576] New: Null dereference in npramin_finit
Date: Mon, 22 Dec 2014 06:07:26 +0000
Message-ID: <bug-87576-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0896093242=="
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


--===============0896093242==
Content-Type: multipart/alternative; boundary="1419228446.483aff0.28514"; charset="UTF-8"


--1419228446.483aff0.28514
Date: Mon, 22 Dec 2014 06:07:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87576

            Bug ID: 87576
           Summary: Null dereference in npramin_finit
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org

Created attachment 111144
  --> https://bugs.freedesktop.org/attachment.cgi?id=111144&action=edit
fix null dereference oops in nouveau.ko

This problem manifests when chipset is < nv50. In this case, pramin_init
returns NULL. mthd->data is then set to this value in shadow_method. Later,
mthd-> data is passed as a parameter to pramin_fini. The result is a kernel
oops. The attached patch takes care of that.

Best Wishes,

Bob Gleitsmann

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419228446.483aff0.28514
Date: Mon, 22 Dec 2014 06:07:26 +0000
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
   title="NEW - Null dereference in npramin_finit"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87576">87576</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Null dereference in npramin_finit
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
          <td>blocker
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
          <td>rjgleits&#64;bellsouth.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111144" name="attach_111144" title="fix null dereference oops in nouveau.ko">attachment 111144</a> <a href="attachment.cgi?id=111144&amp;action=edit" title="fix null dereference oops in nouveau.ko">[details]</a></span>
fix null dereference oops in nouveau.ko

This problem manifests when chipset is &lt; nv50. In this case, pramin_init
returns NULL. mthd-&gt;data is then set to this value in shadow_method. Later,
mthd-&gt; data is passed as a parameter to pramin_fini. The result is a kernel
oops. The attached patch takes care of that.

Best Wishes,

Bob Gleitsmann</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419228446.483aff0.28514--

--===============0896093242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0896093242==--
