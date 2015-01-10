From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88262] New: 3.19 kernels hang during boot for an
 NV28 based card
Date: Sat, 10 Jan 2015 09:21:29 +0000
Message-ID: <bug-88262-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0562059867=="
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


--===============0562059867==
Content-Type: multipart/alternative; boundary="1420881689.40b41.6250"; charset="UTF-8"


--1420881689.40b41.6250
Date: Sat, 10 Jan 2015 09:21:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88262

            Bug ID: 88262
           Summary: 3.19 kernels hang during boot for an NV28 based card
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bruno-bdMChIhFSYk@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 112047
  --> https://bugs.freedesktop.org/attachment.cgi?id=112047&action=edit
dmesg output from a successful 3.18 boot

3.19 kernels having been hanging for me during boot for one of my machines. 
This is still happening as of commit dc9319f5a3e1f67d2a2fbf190e30f6d03f569fed
(post rc3). The problem first happens with commit
ad4a362635353f7ceb66f4038269770fee1025fa. I tried reverting
ad4a362635353f7ceb66f4038269770fee1025fa from
dc9319f5a3e1f67d2a2fbf190e30f6d03f569fed, but there were conflicts and I don't
know enough to properly resolve them.
The hang is early enough that I can't get logging output from the boot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420881689.40b41.6250
Date: Sat, 10 Jan 2015 09:21:29 +0000
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
   title="NEW - 3.19 kernels hang during boot for an NV28 based card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262">88262</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>3.19 kernels hang during boot for an NV28 based card
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>bruno&#64;wolff.to
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=112047" name="attach_112047" title="dmesg output from a successful 3.18 boot">attachment 112047</a> <a href="attachment.cgi?id=112047&amp;action=edit" title="dmesg output from a successful 3.18 boot">[details]</a></span>
dmesg output from a successful 3.18 boot

3.19 kernels having been hanging for me during boot for one of my machines. 
This is still happening as of commit dc9319f5a3e1f67d2a2fbf190e30f6d03f569fed
(post rc3). The problem first happens with commit
ad4a362635353f7ceb66f4038269770fee1025fa. I tried reverting
ad4a362635353f7ceb66f4038269770fee1025fa from
dc9319f5a3e1f67d2a2fbf190e30f6d03f569fed, but there were conflicts and I don't
know enough to properly resolve them.
The hang is early enough that I can't get logging output from the boot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420881689.40b41.6250--

--===============0562059867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0562059867==--
