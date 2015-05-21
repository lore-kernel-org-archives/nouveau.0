From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] New: Display freeze when starting League of
 Legends (Wine)
Date: Thu, 21 May 2015 15:13:47 +0000
Message-ID: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1863646074=="
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


--===============1863646074==
Content-Type: multipart/alternative; boundary="1432221227.7dCbeD1.9425"; charset="UTF-8"


--1432221227.7dCbeD1.9425
Date: Thu, 21 May 2015 15:13:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

            Bug ID: 90567
           Summary: Display freeze when starting League of Legends (Wine)
           Product: xorg
           Version: 7.6 (2010.12)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: detlev.casanova-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115953
  --> https://bugs.freedesktop.org/attachment.cgi?id=115953&action=edit
Nouveau error log - 1

Up until recently, I was able to play League of Legends on Linux with Wine,
using the open source driver nouveau. And that was with great performances.

Since an upgrade of the game (I cannot go back to the old version though),
everytime the game starts, The display freezes (sometimes after up to 5 seconds
but it always does).

The cursor is still moving but typing commands blindly doesn't seem to work.

The network and SSH deamon being still running, I was able to collect some
Kernel logs. I attach them.

I also tried to go back to an older version of the Kernel in case the problem
was in there but that did not help (So I can't bissect the kernel to find the
possible bug)

I am not sure if the game is doing something nasty or if there is a bug in the
opensource driver.

Logs show all kind of error messages I could find.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432221227.7dCbeD1.9425
Date: Thu, 21 May 2015 15:13:47 +0000
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
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">90567</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display freeze when starting League of Legends (Wine)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.6 (2010.12)
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
          <td>detlev.casanova&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115953" name="attach_115953" title="Nouveau error log - 1">attachment 115953</a> <a href="attachment.cgi?id=115953&amp;action=edit" title="Nouveau error log - 1">[details]</a></span>
Nouveau error log - 1

Up until recently, I was able to play League of Legends on Linux with Wine,
using the open source driver nouveau. And that was with great performances.

Since an upgrade of the game (I cannot go back to the old version though),
everytime the game starts, The display freezes (sometimes after up to 5 seconds
but it always does).

The cursor is still moving but typing commands blindly doesn't seem to work.

The network and SSH deamon being still running, I was able to collect some
Kernel logs. I attach them.

I also tried to go back to an older version of the Kernel in case the problem
was in there but that did not help (So I can't bissect the kernel to find the
possible bug)

I am not sure if the game is doing something nasty or if there is a bug in the
opensource driver.

Logs show all kind of error messages I could find.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432221227.7dCbeD1.9425--

--===============1863646074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1863646074==--
