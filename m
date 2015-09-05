From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91890] New: [nve7] witcher2: blurry image &
 DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)
Date: Sat, 05 Sep 2015 23:35:17 +0000
Message-ID: <bug-91890-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1089935764=="
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


--===============1089935764==
Content-Type: multipart/alternative; boundary="1441496117.d3D1d7cC0.10690"; charset="UTF-8"


--1441496117.d3D1d7cC0.10690
Date: Sat, 5 Sep 2015 23:35:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91890

            Bug ID: 91890
           Summary: [nve7] witcher2: blurry image & DATA_ERRORs (class
                    0xa097 mthd 0x2380/0x238c)
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118091
  --> https://bugs.freedesktop.org/attachment.cgi?id=118091&action=edit
Witcher2 on Nouveau

Witcher 2 looks blurry on nouveau and spams dmesg with a lot of:

[  390.489069] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 5 [0x007f853000 witcher2[5663]] subc 0 class 0xa097 mthd 0x2380 data
0x00024000
[  390.489156] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 5 [0x007f853000 witcher2[5663]] subc 0 class 0xa097 mthd 0x238c data
0x00010500

Screenshots comparing intel and nouveau attached.
Apitrace: http://people.freedesktop.org/~mslusarz/witcher2.trace.xz (130MB)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441496117.d3D1d7cC0.10690
Date: Sat, 5 Sep 2015 23:35:17 +0000
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
   title="NEW - [nve7] witcher2: blurry image &amp; DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91890">91890</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nve7] witcher2: blurry image &amp; DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)
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
          <td>marcin.slusarz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118091" name="attach_118091" title="Witcher2 on Nouveau">attachment 118091</a> <a href="attachment.cgi?id=118091&amp;action=edit" title="Witcher2 on Nouveau">[details]</a></span>
Witcher2 on Nouveau

Witcher 2 looks blurry on nouveau and spams dmesg with a lot of:

[  390.489069] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 5 [0x007f853000 witcher2[5663]] subc 0 class 0xa097 mthd 0x2380 data
0x00024000
[  390.489156] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [INVALID_BITFIELD]
ch 5 [0x007f853000 witcher2[5663]] subc 0 class 0xa097 mthd 0x238c data
0x00010500

Screenshots comparing intel and nouveau attached.
Apitrace: <a href="http://people.freedesktop.org/~mslusarz/witcher2.trace.xz">http://people.freedesktop.org/~mslusarz/witcher2.trace.xz</a> (130MB)</pre>
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

--1441496117.d3D1d7cC0.10690--

--===============1089935764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1089935764==--
