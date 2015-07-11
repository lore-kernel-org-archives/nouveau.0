From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91306] New: Axis Game Factory v3.0 (native) renders
 black ground
Date: Sat, 11 Jul 2015 11:34:17 +0000
Message-ID: <bug-91306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0891775665=="
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


--===============0891775665==
Content-Type: multipart/alternative; boundary="1436614457.d03A60.24271"; charset="UTF-8"


--1436614457.d03A60.24271
Date: Sat, 11 Jul 2015 11:34:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91306

            Bug ID: 91306
           Summary: Axis Game Factory v3.0 (native) renders black ground
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 117057
  --> https://bugs.freedesktop.org/attachment.cgi?id=117057&action=edit
screenshot, comparison (nouveau vs. nvidia)

The application runs natively on Linux, I tested the demo version on Steam.
The demo contains some example sceneries, all of them have the same problem:
terrain objects (rocks, vegetation) are rendered properly, but ground textures
are black.

Disabling shader optimization doesn't help.
Ground looks OK with the llvmpipe driver/ Nvidia binary drivers.
Tested and reproduced in Mesa 10.1 and 10.4 as well.

Trace file:
https://drive.google.com/open?id=0B-tTbLKBl-tOQ25kNE80VjY3alk

VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Mesa from git
Kernel 4.1.2
Fedora 22 32-bit

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436614457.d03A60.24271
Date: Sat, 11 Jul 2015 11:34:17 +0000
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
   title="NEW - Axis Game Factory v3.0 (native) renders black ground"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91306">91306</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Axis Game Factory v3.0 (native) renders black ground
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
        <pre>Created <span class=""><a href="attachment.cgi?id=117057" name="attach_117057" title="screenshot, comparison (nouveau vs. nvidia)">attachment 117057</a> <a href="attachment.cgi?id=117057&amp;action=edit" title="screenshot, comparison (nouveau vs. nvidia)">[details]</a></span>
screenshot, comparison (nouveau vs. nvidia)

The application runs natively on Linux, I tested the demo version on Steam.
The demo contains some example sceneries, all of them have the same problem:
terrain objects (rocks, vegetation) are rendered properly, but ground textures
are black.

Disabling shader optimization doesn't help.
Ground looks OK with the llvmpipe driver/ Nvidia binary drivers.
Tested and reproduced in Mesa 10.1 and 10.4 as well.

Trace file:
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tOQ25kNE80VjY3alk">https://drive.google.com/open?id=0B-tTbLKBl-tOQ25kNE80VjY3alk</a>

VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Mesa from git
Kernel 4.1.2
Fedora 22 32-bit</pre>
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

--1436614457.d03A60.24271--

--===============0891775665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0891775665==--
