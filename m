From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61947] New: nullpointer dereference causes
 xorg-server segfault when nouveau DRI driver is loaded
Date: Thu, 07 Mar 2013 08:51:39 +0000
Message-ID: <bug-61947-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0517892795=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0517892795==
Content-Type: multipart/alternative; boundary="1362646300.8C32FA4B1.21587"; charset="us-ascii"


--1362646300.8C32FA4B1.21587
Date: Thu, 7 Mar 2013 08:51:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61947

          Priority: medium
            Bug ID: 61947
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nullpointer dereference causes xorg-server segfault
                    when nouveau DRI driver is loaded
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jan-Nxuwd0F5s3rq0s6DQE6FoQ@public.gmane.org
          Hardware: All
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 76086
  --> https://bugs.freedesktop.org/attachment.cgi?id=76086&action=edit
Patch that fixes the segfault

Chromium can crash Xorg when the nouveau DRI driver is loaded. This is due to a
nullpointer dereference.

Archlinux bug (Xorg crash): https://bugs.archlinux.org/task/33994
Fedora bug (Application crash, same cause):
https://bugzilla.redhat.com/show_bug.cgi?id=862466

As suggested in the Fedora bug, comment 15, attached is a patch that fixes this
issue (confirmed on Archlinux). This is the same check the Intel DRI driver
does, so I think it's needed there.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362646300.8C32FA4B1.21587
Date: Thu, 7 Mar 2013 08:51:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nullpointer dereference causes xorg-server segfault when nouveau DRI driver is loaded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61947">61947</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nullpointer dereference causes xorg-server segfault when nouveau DRI driver is loaded
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jan&#64;jgc.homeip.net
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>9.1
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=76086" name="attach_76086" title="Patch that fixes the segfault">attachment 76086</a> <a href="attachment.cgi?id=76086&amp;action=edit" title="Patch that fixes the segfault">[details]</a></span>
Patch that fixes the segfault

Chromium can crash Xorg when the nouveau DRI driver is loaded. This is due to a
nullpointer dereference.

Archlinux bug (Xorg crash): <a href="https://bugs.archlinux.org/task/33994">https://bugs.archlinux.org/task/33994</a>
Fedora bug (Application crash, same cause):
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=862466">https://bugzilla.redhat.com/show_bug.cgi?id=862466</a>

As suggested in the Fedora bug, <a href="show_bug.cgi?id=61947#c15">comment 15</a>, attached is a patch that fixes this
issue (confirmed on Archlinux). This is the same check the Intel DRI driver
does, so I think it's needed there.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362646300.8C32FA4B1.21587--

--===============0517892795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0517892795==--
