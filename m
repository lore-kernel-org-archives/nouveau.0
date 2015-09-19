From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92049] New: Suspend/resume failure on Acer Aspire
 V5-573G notebook
Date: Sat, 19 Sep 2015 18:36:09 +0000
Message-ID: <bug-92049-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1711880002=="
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


--===============1711880002==
Content-Type: multipart/alternative; boundary="1442687769.eC7f5E1.32046"; charset="UTF-8"


--1442687769.eC7f5E1.32046
Date: Sat, 19 Sep 2015 18:36:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92049

            Bug ID: 92049
           Summary: Suspend/resume failure on Acer Aspire V5-573G notebook
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mkizub-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118364
  --> https://bugs.freedesktop.org/attachment.cgi?id=118364&action=edit
Bug report in Kernel.org format

Suspend doesn't work.

Put Acer Aspire V5-573G laptop into suspend mode in any way (either using
pm-suspend, gui button, user activity timeout).
Attempt to resume it (by pressing any key) - the notebook wakeups, shows it's
screen with the same state as before suspension, but does not respond to any
actions (keyboard, mouse, ssh/telnet, etc), cursor does not blinks. The only
way to continue working is rebooting (long press of power button).

Detailed information is attached with /home/mkizub/KernelBugReport.txt

This bug on launchpad.net:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1483467

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442687769.eC7f5E1.32046
Date: Sat, 19 Sep 2015 18:36:09 +0000
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
   title="NEW - Suspend/resume failure on Acer Aspire V5-573G notebook"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92049">92049</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Suspend/resume failure on Acer Aspire V5-573G notebook
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
          <td>mkizub&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118364" name="attach_118364" title="Bug report in Kernel.org format">attachment 118364</a> <a href="attachment.cgi?id=118364&amp;action=edit" title="Bug report in Kernel.org format">[details]</a></span>
Bug report in Kernel.org format

Suspend doesn't work.

Put Acer Aspire V5-573G laptop into suspend mode in any way (either using
pm-suspend, gui button, user activity timeout).
Attempt to resume it (by pressing any key) - the notebook wakeups, shows it's
screen with the same state as before suspension, but does not respond to any
actions (keyboard, mouse, ssh/telnet, etc), cursor does not blinks. The only
way to continue working is rebooting (long press of power button).

Detailed information is attached with /home/mkizub/KernelBugReport.txt

This bug on launchpad.net:
<a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1483467">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1483467</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442687769.eC7f5E1.32046--

--===============1711880002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1711880002==--
