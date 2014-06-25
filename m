From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80506] New: Video failed on resume from suspend -
 G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2
Date: Wed, 25 Jun 2014 00:38:49 +0000
Message-ID: <bug-80506-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775883957=="
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


--===============1775883957==
Content-Type: multipart/alternative; boundary="1403656730.78013bCd1.30312"; charset="us-ascii"


--1403656730.78013bCd1.30312
Date: Wed, 25 Jun 2014 00:38:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80506

          Priority: medium
            Bug ID: 80506
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Video failed on resume from suspend - G94 / GeForce
                    9600 GT, 10de:0622 , kernel 3.16 rc2
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: All
          Reporter: awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 101708
  --> https://bugs.freedesktop.org/attachment.cgi?id=101708&action=edit
journalctl from a 3.16 rc2 boot that reproduces the issue

This is kind of a follow-up to
https://bugs.freedesktop.org/show_bug.cgi?id=77599 , but the behaviour seems
different now and we're on kernel 3.16, so I figured we'd best start from
scratch.

With kernel 3.16 rc2, resuming from suspend on my GeForce 9600 GT (10de:0622)
*always* seems to fail. Screens never come out of power-saving mode, can't ssh
in. This differs from 3.15, where it sometimes succeeded and sometimes failed,
and never seemed to fail if I just booted, quickly suspended, and quickly
resumed - with 3.16 rc2, doing that causes it to fail every time.

I'll attach journalctl with drm.debug=15 from a boot where I booted to gdm,
suspended, resumed, left the system sitting for a while, then forcibly
rebooted.

This is on Fedora Rawhide, with:

kernel-3.16.0-0.rc2.git0.1.fc21.x86_64
xorg-x11-drv-nouveau-1.0.10-5.fc21.x86_64
xorg-x11-server-common-1.15.99.903-2.fc21.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403656730.78013bCd1.30312
Date: Wed, 25 Jun 2014 00:38:50 +0000
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
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80506">80506</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>awilliam&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=101708" name="attach_101708" title="journalctl from a 3.16 rc2 boot that reproduces the issue">attachment 101708</a> <a href="attachment.cgi?id=101708&amp;action=edit" title="journalctl from a 3.16 rc2 boot that reproduces the issue">[details]</a></span>
journalctl from a 3.16 rc2 boot that reproduces the issue

This is kind of a follow-up to
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622"
   href="show_bug.cgi?id=77599">https://bugs.freedesktop.org/show_bug.cgi?id=77599</a> , but the behaviour seems
different now and we're on kernel 3.16, so I figured we'd best start from
scratch.

With kernel 3.16 rc2, resuming from suspend on my GeForce 9600 GT (10de:0622)
*always* seems to fail. Screens never come out of power-saving mode, can't ssh
in. This differs from 3.15, where it sometimes succeeded and sometimes failed,
and never seemed to fail if I just booted, quickly suspended, and quickly
resumed - with 3.16 rc2, doing that causes it to fail every time.

I'll attach journalctl with drm.debug=15 from a boot where I booted to gdm,
suspended, resumed, left the system sitting for a while, then forcibly
rebooted.

This is on Fedora Rawhide, with:

kernel-3.16.0-0.rc2.git0.1.fc21.x86_64
xorg-x11-drv-nouveau-1.0.10-5.fc21.x86_64
xorg-x11-server-common-1.15.99.903-2.fc21.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403656730.78013bCd1.30312--

--===============1775883957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1775883957==--
