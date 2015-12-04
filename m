From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93250] New: After VGA change monitor do not detects
	properly
Date: Fri, 04 Dec 2015 17:10:18 +0000
Message-ID: <bug-93250-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0604414057=="
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


--===============0604414057==
Content-Type: multipart/alternative; boundary="1449249018.eadBB1.11973"; charset="UTF-8"


--1449249018.eadBB1.11973
Date: Fri, 4 Dec 2015 17:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93250

            Bug ID: 93250
           Summary: After VGA change monitor do not detects properly
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vourlo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 120354
  --> https://bugs.freedesktop.org/attachment.cgi?id=120354&action=edit
Kernel log

Hello!

I've changed VGA from Geforce GTX 470 to 980.
My distro is openSUSE 13.2. From the moment of installation I've used nouveau
driver and it worked very well. I have DELL U2415 monitor attached via HDMI.
Since the switch the monitor is detected as default and the resolution is set
to 1024X768.
Using the 'nomodeset' parameter can rise the resolution to 1600X1200, but
monitor is still not detected, and no native resolution can be picked.

Thank you in advance,
Piotr.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449249018.eadBB1.11973
Date: Fri, 4 Dec 2015 17:10:18 +0000
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
   title="NEW - After VGA change monitor do not detects properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93250">93250</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>After VGA change monitor do not detects properly
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
          <td>vourlo&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120354" name="attach_120354" title="Kernel log">attachment 120354</a> <a href="attachment.cgi?id=120354&amp;action=edit" title="Kernel log">[details]</a></span>
Kernel log

Hello!

I've changed VGA from Geforce GTX 470 to 980.
My distro is openSUSE 13.2. From the moment of installation I've used nouveau
driver and it worked very well. I have DELL U2415 monitor attached via HDMI.
Since the switch the monitor is detected as default and the resolution is set
to 1024X768.
Using the 'nomodeset' parameter can rise the resolution to 1600X1200, but
monitor is still not detected, and no native resolution can be picked.

Thank you in advance,
Piotr.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449249018.eadBB1.11973--

--===============0604414057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0604414057==--
