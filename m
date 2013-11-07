From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71357] New: After S3 resume X is broken and reboot
	needed
Date: Thu, 07 Nov 2013 21:26:47 +0000
Message-ID: <bug-71357-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582673594=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1582673594==
Content-Type: multipart/alternative; boundary="1383859607.0f4ddD0.1188"; charset="us-ascii"


--1383859607.0f4ddD0.1188
Date: Thu, 7 Nov 2013 21:26:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71357

          Priority: medium
            Bug ID: 71357
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: After S3 resume X is broken and reboot needed
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: krah.tm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 88845
  --> https://bugs.freedesktop.org/attachment.cgi?id=88845&action=edit
Xorg.0.log

Got a Lenovo T530 notebook with a NVS 5400M card.
Suspending to RAM and resume from console only does work fine.

But doing it from X i've get a broken X system, starting X after the resume
basic stuff from mdm display manager is ok, but as soon as cinnamon is starting
its broken again.

Attached is the Xorg.0.log with errors logged.

dmesg is also there - the first 2 errors with cinnamon were logged when i did
"service mdm stop", the other 4 were logged after "kill -9 7350".
Only a reboot did work and it was possible to reboot the box.
Attached is also a full backtrace from gdb after X was tried to shut down via
"kill -9" which did not work.

Its a stock ubuntu 13.10 with mesa 9.2.1.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383859607.0f4ddD0.1188
Date: Thu, 7 Nov 2013 21:26:47 +0000
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
   title="NEW --- - After S3 resume X is broken and reboot needed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71357">71357</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>After S3 resume X is broken and reboot needed
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>krah.tm&#64;gmail.com
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
          <td>9.2
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88845" name="attach_88845" title="Xorg.0.log">attachment 88845</a> <a href="attachment.cgi?id=88845&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

Got a Lenovo T530 notebook with a NVS 5400M card.
Suspending to RAM and resume from console only does work fine.

But doing it from X i've get a broken X system, starting X after the resume
basic stuff from mdm display manager is ok, but as soon as cinnamon is starting
its broken again.

Attached is the Xorg.0.log with errors logged.

dmesg is also there - the first 2 errors with cinnamon were logged when i did
&quot;service mdm stop&quot;, the other 4 were logged after &quot;kill -9 7350&quot;.
Only a reboot did work and it was possible to reboot the box.
Attached is also a full backtrace from gdb after X was tried to shut down via
&quot;kill -9&quot; which did not work.

Its a stock ubuntu 13.10 with mesa 9.2.1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383859607.0f4ddD0.1188--

--===============1582673594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1582673594==--
