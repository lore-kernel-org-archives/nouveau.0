From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69982] New: GPU+system crash with nouveau and kernel
	3.12-rc3
Date: Mon, 30 Sep 2013 20:13:39 +0000
Message-ID: <bug-69982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1229012773=="
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


--===============1229012773==
Content-Type: multipart/alternative; boundary="1380572019.d5aB31.719"; charset="us-ascii"


--1380572019.d5aB31.719
Date: Mon, 30 Sep 2013 20:13:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69982

          Priority: medium
            Bug ID: 69982
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GPU+system crash with nouveau and kernel 3.12-rc3
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 86871
  --> https://bugs.freedesktop.org/attachment.cgi?id=86871&action=edit
kernel log file edited for relevant lines with nouveau problems

Boot linux kernel mainline 3.12-rc3 in arch linux. Graphics hardware is:

01:00.0 VGA compatible controller: NVIDIA Corporation G86GLM [Quadro FX 360M]
(rev a1)

KDM greeter allows login to KDE.

Within a few seconds of logging in to KDE the DE freezes, and the mouse and all
controls are frozen. It is not possible to get to a text console and reboot is
necessary to unfreeze the system - using stable 3.11.2 kernel to continue
working.

Nouveau packages installed are: 

$ sudo pacman -Ss nouveau
extra/nouveau-dri 9.2.0-2 [installed]
    Mesa drivers for Nouveau
extra/xf86-video-nouveau 1.0.9-1 (xorg-drivers xorg) [installed]
    Open Source 2D acceleration driver for nVidia cards

Attaching log file segments relevant to the crash as follows:
kernel-sep30-crash.log
error.sep30-crash.log
Xorg.0.log.sep30.log

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380572019.d5aB31.719
Date: Mon, 30 Sep 2013 20:13:39 +0000
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
   title="NEW --- - GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982">69982</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU+system crash with nouveau and kernel 3.12-rc3
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>mike.cloaked&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=86871" name="attach_86871" title="kernel log file edited for relevant lines with nouveau problems">attachment 86871</a> <a href="attachment.cgi?id=86871&amp;action=edit" title="kernel log file edited for relevant lines with nouveau problems">[details]</a></span>
kernel log file edited for relevant lines with nouveau problems

Boot linux kernel mainline 3.12-rc3 in arch linux. Graphics hardware is:

01:00.0 VGA compatible controller: NVIDIA Corporation G86GLM [Quadro FX 360M]
(rev a1)

KDM greeter allows login to KDE.

Within a few seconds of logging in to KDE the DE freezes, and the mouse and all
controls are frozen. It is not possible to get to a text console and reboot is
necessary to unfreeze the system - using stable 3.11.2 kernel to continue
working.

Nouveau packages installed are: 

$ sudo pacman -Ss nouveau
extra/nouveau-dri 9.2.0-2 [installed]
    Mesa drivers for Nouveau
extra/xf86-video-nouveau 1.0.9-1 (xorg-drivers xorg) [installed]
    Open Source 2D acceleration driver for nVidia cards

Attaching log file segments relevant to the crash as follows:
kernel-sep30-crash.log
error.sep30-crash.log
Xorg.0.log.sep30.log</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380572019.d5aB31.719--

--===============1229012773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1229012773==--
