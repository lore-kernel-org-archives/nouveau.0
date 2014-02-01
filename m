From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74316] New: [NV92] Graphical corruption on KDE
 shutdown/restart/log out screen
Date: Sat, 01 Feb 2014 12:39:22 +0000
Message-ID: <bug-74316-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1838190761=="
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


--===============1838190761==
Content-Type: multipart/alternative; boundary="1391258362.cff10AB1.25918"; charset="us-ascii"


--1391258362.cff10AB1.25918
Date: Sat, 1 Feb 2014 12:39:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74316

          Priority: medium
            Bug ID: 74316
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV92] Graphical corruption on KDE
                    shutdown/restart/log out screen
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 93166
  --> https://bugs.freedesktop.org/attachment.cgi?id=93166&action=edit
kernel log

When I try to shutdown/restart/log out of KDE, the window with the countdown
opens and show up correctly, but the background is corrupted with random stuff
such as windows/menus that were opened before, or even currently opened windows
but totally reversed and/or at different places. 
Unfortunately, it doesn't look like I can take a screenshot while that screen
is open.
It works fine with the proprietary driver.

Card: Nvidia 8800 GT
I am using mesa-git (as of commit 80bf1fbaf6bb3d9b7a8543ea764c6d19887ac0b8).
xf86-video-nouveau 1.0.10-2
Arch Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391258362.cff10AB1.25918
Date: Sat, 1 Feb 2014 12:39:22 +0000
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
   title="NEW --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316">74316</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV92] Graphical corruption on KDE shutdown/restart/log out screen
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
          <td>anakin.cs&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=93166" name="attach_93166" title="kernel log">attachment 93166</a> <a href="attachment.cgi?id=93166&amp;action=edit" title="kernel log">[details]</a></span>
kernel log

When I try to shutdown/restart/log out of KDE, the window with the countdown
opens and show up correctly, but the background is corrupted with random stuff
such as windows/menus that were opened before, or even currently opened windows
but totally reversed and/or at different places. 
Unfortunately, it doesn't look like I can take a screenshot while that screen
is open.
It works fine with the proprietary driver.

Card: Nvidia 8800 GT
I am using mesa-git (as of commit 80bf1fbaf6bb3d9b7a8543ea764c6d19887ac0b8).
xf86-video-nouveau 1.0.10-2
Arch Linux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391258362.cff10AB1.25918--

--===============1838190761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1838190761==--
