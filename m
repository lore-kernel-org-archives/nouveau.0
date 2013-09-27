From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] New: [NVE6] GPU lockups
Date: Fri, 27 Sep 2013 16:33:45 +0000
Message-ID: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1986390835=="
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


--===============1986390835==
Content-Type: multipart/alternative; boundary="1380299625.7b36dEdf1.11557"; charset="us-ascii"


--1380299625.7b36dEdf1.11557
Date: Fri, 27 Sep 2013 16:33:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69882

          Priority: medium
            Bug ID: 69882
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE6] GPU lockups
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 86731
  --> https://bugs.freedesktop.org/attachment.cgi?id=86731&action=edit
Kernel log

Sometimes the X server crashes due to a GPU lockup, caused by a page fault. It
happens seemingly randomly, at irregular intervals (sometimes it takes several
hours, sometimes it crashes in half an hour).

Before that happens, I see a small amount of corruption (noise around the
cursor), then everything but the mouse hangs. After a while, the mouse also
hangs, the screen becomes black with a "_" symbol in the upper right corner of
the screen (but the mouse is still displayed), and after some more time the
whole screen becomes corrupt in vertical blocks. If I press Ctrl+Alt+F1 fast
enough, I can switch out of X and use the console for a while, otherwise the
whole PC hangs and I need to do a hard reboot.

This issue may or may not be related to bug #69029 (the symptoms seem similar,
but the errors are different).

I am using a GeForce 660 card on openSUSE 13.1 x86_64 Beta. I also reported the
bug downstream.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380299625.7b36dEdf1.11557
Date: Fri, 27 Sep 2013 16:33:45 +0000
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
   title="NEW --- - [NVE6] GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69882">69882</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] GPU lockups
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>pastas4&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=86731" name="attach_86731" title="Kernel log">attachment 86731</a> <a href="attachment.cgi?id=86731&amp;action=edit" title="Kernel log">[details]</a></span>
Kernel log

Sometimes the X server crashes due to a GPU lockup, caused by a page fault. It
happens seemingly randomly, at irregular intervals (sometimes it takes several
hours, sometimes it crashes in half an hour).

Before that happens, I see a small amount of corruption (noise around the
cursor), then everything but the mouse hangs. After a while, the mouse also
hangs, the screen becomes black with a &quot;_&quot; symbol in the upper right corner of
the screen (but the mouse is still displayed), and after some more time the
whole screen becomes corrupt in vertical blocks. If I press Ctrl+Alt+F1 fast
enough, I can switch out of X and use the console for a while, otherwise the
whole PC hangs and I need to do a hard reboot.

This issue may or may not be related to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="show_bug.cgi?id=69029">bug #69029</a> (the symptoms seem similar,
but the errors are different).

I am using a GeForce 660 card on openSUSE 13.1 x86_64 Beta. I also reported the
bug downstream.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380299625.7b36dEdf1.11557--

--===============1986390835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1986390835==--
