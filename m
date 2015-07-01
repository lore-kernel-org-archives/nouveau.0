From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91171] New: Space Rangers 2 (in Wine) shows only
	black screen
Date: Wed, 01 Jul 2015 05:00:54 +0000
Message-ID: <bug-91171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1933498750=="
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


--===============1933498750==
Content-Type: multipart/alternative; boundary="1435726854.B804b8f1.14574"; charset="UTF-8"


--1435726854.B804b8f1.14574
Date: Wed, 1 Jul 2015 05:00:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91171

            Bug ID: 91171
           Summary: Space Rangers 2 (in Wine) shows only black screen
           Product: Mesa
           Version: git
          Hardware: Other
               URL: http://www.fileplanet.com/162972/160000/fileinfo/Space
                    -Rangers-2:-Rise-of-the-Dominators-Demo
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

The game starts and runs fine except that the screen remains black during the
intro videos and in the menu, only audio can be heard.
This is with the default OpenGL renderer in Wine. When using the legacy GDI
renderer the game displays properly. 
From the http://wiki.winehq.org/UsefulRegistryKeys page:
"The "gdi" option mostly exists for legacy reasons. Aside from bugs in the GL
renderer, only change this if you have a setup without OpenGL. Installing a
software GL implementation is the preferred solution in that case though."

The problem doesn't occur with the binary drivers.
When using the software renderer (LIBGL_ALWAYS_SOFTWARE=1) 2 out of the 4 intro
videos and the menu is displayed properly.

Trace:
https://drive.google.com/open?id=0B-tTbLKBl-tOOGEwLXMtdmt2T1U
The trace consists of only a single frame which contains >100k calls.

Fedora 22 32-bit
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Mesa 10.6-branchpoint-773-g1de93f9
Kernel 4.0.6-300.fc22.i686+PAE
Xorg 1.17.2
libdrm-2.4.61-3.fc22.i686

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435726854.B804b8f1.14574
Date: Wed, 1 Jul 2015 05:00:54 +0000
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
   title="NEW - Space Rangers 2 (in Wine) shows only black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91171">91171</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Space Rangers 2 (in Wine) shows only black screen
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
          <th>URL</th>
          <td>http://www.fileplanet.com/162972/160000/fileinfo/Space-Rangers-2:-Rise-of-the-Dominators-Demo
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
          <td>gyebro69&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The game starts and runs fine except that the screen remains black during the
intro videos and in the menu, only audio can be heard.
This is with the default OpenGL renderer in Wine. When using the legacy GDI
renderer the game displays properly. 
From the <a href="http://wiki.winehq.org/UsefulRegistryKeys">http://wiki.winehq.org/UsefulRegistryKeys</a> page:
&quot;The &quot;gdi&quot; option mostly exists for legacy reasons. Aside from bugs in the GL
renderer, only change this if you have a setup without OpenGL. Installing a
software GL implementation is the preferred solution in that case though.&quot;

The problem doesn't occur with the binary drivers.
When using the software renderer (LIBGL_ALWAYS_SOFTWARE=1) 2 out of the 4 intro
videos and the menu is displayed properly.

Trace:
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tOOGEwLXMtdmt2T1U">https://drive.google.com/open?id=0B-tTbLKBl-tOOGEwLXMtdmt2T1U</a>
The trace consists of only a single frame which contains &gt;100k calls.

Fedora 22 32-bit
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Mesa 10.6-branchpoint-773-g1de93f9
Kernel 4.0.6-300.fc22.i686+PAE
Xorg 1.17.2
libdrm-2.4.61-3.fc22.i686</pre>
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

--1435726854.B804b8f1.14574--

--===============1933498750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1933498750==--
