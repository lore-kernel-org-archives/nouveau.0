From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78570] New: GT215: Freeze on X startup, 2014.
Date: Sun, 11 May 2014 23:30:55 +0000
Message-ID: <bug-78570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0723591967=="
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


--===============0723591967==
Content-Type: multipart/alternative; boundary="1399851055.e2D71.13651"; charset="us-ascii"


--1399851055.e2D71.13651
Date: Sun, 11 May 2014 23:30:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78570

          Priority: medium
            Bug ID: 78570
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GT215: Freeze on X startup, 2014.
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: phix.nay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 98870
  --> https://bugs.freedesktop.org/attachment.cgi?id=98870&action=edit
3.13.0-24-generic log

The system freezes on X starup.
The kernel log reveals a gpu lockup:
16.840862] nouveau E[     DRM] GPU lockup - switching to software fbcon
[   16.844254] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   16.844257] nouveau 0000:02:00.0: registered panic notifier

I also have pictures of what the monitor looks like.

Software:
Ubuntu 14.04, updated 2014-5-11

Hardware: GT 240, GT215, GDDR5

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399851055.e2D71.13651
Date: Sun, 11 May 2014 23:30:55 +0000
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
   title="NEW --- - GT215: Freeze on X startup, 2014."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78570">78570</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GT215: Freeze on X startup, 2014.
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>phix.nay&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=98870" name="attach_98870" title="3.13.0-24-generic log">attachment 98870</a> <a href="attachment.cgi?id=98870&amp;action=edit" title="3.13.0-24-generic log">[details]</a></span>
3.13.0-24-generic log

The system freezes on X starup.
The kernel log reveals a gpu lockup:
16.840862] nouveau E[     DRM] GPU lockup - switching to software fbcon
[   16.844254] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   16.844257] nouveau 0000:02:00.0: registered panic notifier

I also have pictures of what the monitor looks like.

Software:
Ubuntu 14.04, updated 2014-5-11

Hardware: GT 240, GT215, GDDR5</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399851055.e2D71.13651--

--===============0723591967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0723591967==--
