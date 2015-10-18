From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92522] New: Desktop freezes resuming after suspension
Date: Sun, 18 Oct 2015 13:58:23 +0000
Message-ID: <bug-92522-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2143054409=="
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


--===============2143054409==
Content-Type: multipart/alternative; boundary="1445176703.AccBf4f1.4256"; charset="UTF-8"


--1445176703.AccBf4f1.4256
Date: Sun, 18 Oct 2015 13:58:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92522

            Bug ID: 92522
           Summary: Desktop freezes resuming after suspension
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: carla.sella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118959
  --> https://bugs.freedesktop.org/attachment.cgi?id=118959&action=edit
Dmesg after BIOS update

I suspended my PC and when I resumed the desktop has a black background, you
could see the launcher but you were unable to do anything it is freezed.
This is my hardware: https://gist.github.com/anonymous/3203c7c5a43a509c0f22.
I am attaching the screen-shots of my desktop after resuming, also in terminal
(CTRL+ALT+F1) it looked rather garbled.

I have already reported this bug on launchpad:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1490143 and  it looks like
it is  a Nouveau Driver problem.


I have upgraded my BIOS to 0808, but the problem has not been soleved.

Nothing changed also with the latest mainline kernel (4.3-rc3).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445176703.AccBf4f1.4256
Date: Sun, 18 Oct 2015 13:58:23 +0000
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
   title="NEW - Desktop freezes resuming after suspension"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92522">92522</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Desktop freezes resuming after suspension
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
          <td>major
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
          <td>carla.sella&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118959" name="attach_118959" title="Dmesg after BIOS update">attachment 118959</a> <a href="attachment.cgi?id=118959&amp;action=edit" title="Dmesg after BIOS update">[details]</a></span>
Dmesg after BIOS update

I suspended my PC and when I resumed the desktop has a black background, you
could see the launcher but you were unable to do anything it is freezed.
This is my hardware: <a href="https://gist.github.com/anonymous/3203c7c5a43a509c0f22">https://gist.github.com/anonymous/3203c7c5a43a509c0f22</a>.
I am attaching the screen-shots of my desktop after resuming, also in terminal
(CTRL+ALT+F1) it looked rather garbled.

I have already reported this bug on launchpad:
<a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1490143">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1490143</a> and  it looks like
it is  a Nouveau Driver problem.


I have upgraded my BIOS to 0808, but the problem has not been soleved.

Nothing changed also with the latest mainline kernel (4.3-rc3).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445176703.AccBf4f1.4256--

--===============2143054409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2143054409==--
