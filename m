From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] New: Nouveau Random GPU Lockups
Date: Sat, 30 Nov 2013 18:05:36 +0000
Message-ID: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1222835381=="
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


--===============1222835381==
Content-Type: multipart/alternative; boundary="1385834736.fa20cEFf1.26804"; charset="us-ascii"


--1385834736.fa20cEFf1.26804
Date: Sat, 30 Nov 2013 18:05:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

          Priority: medium
            Bug ID: 72180
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau Random GPU Lockups
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bass.jordan+bugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 90035
  --> https://bugs.freedesktop.org/attachment.cgi?id=90035&action=edit
nouveau log

Frequent GPU lockups, happens anywhere from 10 minutes to 2 hours after
booting. No common cause that I've noticed when it happens. Occasionally I can
get out to another tty but often completely unresponsive. Some system
information:

Linux jordans-pc 3.11.9-200.fc19.x86_64 #1 SMP Wed Nov 20 21:22:24 UTC 2013
x86_64 x86_64 x86_64 GNU/Linux

xorg-x11-server-Xorg.x86_64               1.14.4-3.fc19
xorg-x11-server-common.x86_64             1.14.4-3.fc19
xorg-x11-server-utils.x86_64              7.7-1.fc19 
xorg-x11-utils.x86_64                     7.5-9.fc19
xorg-x11-xauth.x86_64                     1:1.0.7-3.fc19
xorg-x11-xinit.x86_64                     1.3.2-8.fc19 
xorg-x11-xkb-utils.x86_64                 7.7-7.fc19
xorg-x11-drv-nouveau.x86_64               1:1.0.9-1.fc19

Attached log of messages from Nouveau from time of boot until lockup.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385834736.fa20cEFf1.26804
Date: Sat, 30 Nov 2013 18:05:36 +0000
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
   title="NEW --- - Nouveau Random GPU Lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">72180</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau Random GPU Lockups
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>bass.jordan+bugzilla&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=90035" name="attach_90035" title="nouveau log">attachment 90035</a> <a href="attachment.cgi?id=90035&amp;action=edit" title="nouveau log">[details]</a></span>
nouveau log

Frequent GPU lockups, happens anywhere from 10 minutes to 2 hours after
booting. No common cause that I've noticed when it happens. Occasionally I can
get out to another tty but often completely unresponsive. Some system
information:

Linux jordans-pc 3.11.9-200.fc19.x86_64 #1 SMP Wed Nov 20 21:22:24 UTC 2013
x86_64 x86_64 x86_64 GNU/Linux

xorg-x11-server-Xorg.x86_64               1.14.4-3.fc19
xorg-x11-server-common.x86_64             1.14.4-3.fc19
xorg-x11-server-utils.x86_64              7.7-1.fc19 
xorg-x11-utils.x86_64                     7.5-9.fc19
xorg-x11-xauth.x86_64                     1:1.0.7-3.fc19
xorg-x11-xinit.x86_64                     1.3.2-8.fc19 
xorg-x11-xkb-utils.x86_64                 7.7-7.fc19
xorg-x11-drv-nouveau.x86_64               1:1.0.9-1.fc19

Attached log of messages from Nouveau from time of boot until lockup.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385834736.fa20cEFf1.26804--

--===============1222835381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1222835381==--
