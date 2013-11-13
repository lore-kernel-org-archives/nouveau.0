From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71563] New: [nvc0] color garbage after resume
Date: Wed, 13 Nov 2013 07:47:43 +0000
Message-ID: <bug-71563-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1451053993=="
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


--===============1451053993==
Content-Type: multipart/alternative; boundary="1384328863.601a21.10388"; charset="us-ascii"


--1384328863.601a21.10388
Date: Wed, 13 Nov 2013 07:47:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71563

          Priority: medium
            Bug ID: 71563
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nvc0] color garbage after resume
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ulf.dambacher-S0/GAf8tV78@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 89122
  --> https://bugs.freedesktop.org/attachment.cgi?id=89122&action=edit
picture of gnome 3.10 screensaver after resume taken with camera

I enclose two pictures of the gnome 3.10 start screen and login screen after
hibernaation. color is garbled. using ctrl-alt-backspace to start a new xorg
server and reinitialize gets back a working setup.

computer: lenovo thinkpad w520
distro gentoo amd64
kernel 3.10.17 (vanilla)
drm nouveau 1.1.1 20120801
xorg-server-1.14.3
xf86-video-nouveau-1.0.9
mesa 9.2.2
gnome 3.10

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384328863.601a21.10388
Date: Wed, 13 Nov 2013 07:47:43 +0000
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
   title="NEW --- - [nvc0] color garbage after resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71563">71563</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nvc0] color garbage after resume
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
          <td>ulf.dambacher&#64;web.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=89122" name="attach_89122" title="picture of gnome 3.10 screensaver after resume taken with camera">attachment 89122</a> <a href="attachment.cgi?id=89122&amp;action=edit" title="picture of gnome 3.10 screensaver after resume taken with camera">[details]</a></span>
picture of gnome 3.10 screensaver after resume taken with camera

I enclose two pictures of the gnome 3.10 start screen and login screen after
hibernaation. color is garbled. using ctrl-alt-backspace to start a new xorg
server and reinitialize gets back a working setup.

computer: lenovo thinkpad w520
distro gentoo amd64
kernel 3.10.17 (vanilla)
drm nouveau 1.1.1 20120801
xorg-server-1.14.3
xf86-video-nouveau-1.0.9
mesa 9.2.2
gnome 3.10</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384328863.601a21.10388--

--===============1451053993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1451053993==--
