From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81614] New: Nouveau freezes on GeForce 580 GTX at a
	random time
Date: Mon, 21 Jul 2014 16:14:25 +0000
Message-ID: <bug-81614-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1096918346=="
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


--===============1096918346==
Content-Type: multipart/alternative; boundary="1405959265.0AD00.18459"; charset="us-ascii"


--1405959265.0AD00.18459
Date: Mon, 21 Jul 2014 16:14:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81614

          Priority: medium
            Bug ID: 81614
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau freezes on GeForce 580 GTX at a random time
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: doityourselfteam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 103199
  --> https://bugs.freedesktop.org/attachment.cgi?id=103199&action=edit
Kernel log

When using nouveau on Nvidia GeForce 580 GTX PC freezes. No reaction on
keyboard only mouse pointer can move. Sometimes mouse pointer is not reacting
too. It happens for a random time and in random activity, most often 10 sec - 2
min.
But if I set "nomodeset" option in kernel boot parameters the system is working
fine without freezes.
This problem is actual for X.Org and Mir (Ubuntu-Next 14.10 x64) display
servers.
Tested on Ubuntu 14.10 x64, kernel 3.16. But problem is actual for all versions
of Ubuntu with Nouveau.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405959265.0AD00.18459
Date: Mon, 21 Jul 2014 16:14:25 +0000
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
   title="NEW --- - Nouveau freezes on GeForce 580 GTX at a random time"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81614">81614</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau freezes on GeForce 580 GTX at a random time
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
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
          <td>doityourselfteam&#64;gmail.com
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=103199" name="attach_103199" title="Kernel log">attachment 103199</a> <a href="attachment.cgi?id=103199&amp;action=edit" title="Kernel log">[details]</a></span>
Kernel log

When using nouveau on Nvidia GeForce 580 GTX PC freezes. No reaction on
keyboard only mouse pointer can move. Sometimes mouse pointer is not reacting
too. It happens for a random time and in random activity, most often 10 sec - 2
min.
But if I set &quot;nomodeset&quot; option in kernel boot parameters the system is working
fine without freezes.
This problem is actual for X.Org and Mir (Ubuntu-Next 14.10 x64) display
servers.
Tested on Ubuntu 14.10 x64, kernel 3.16. But problem is actual for all versions
of Ubuntu with Nouveau.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405959265.0AD00.18459--

--===============1096918346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1096918346==--
