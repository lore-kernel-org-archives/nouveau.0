From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58101] New: Rendering problems with a Geforce Go 5300
Date: Mon, 10 Dec 2012 22:11:49 +0000
Message-ID: <bug-58101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0879121813=="
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


--===============0879121813==
Content-Type: multipart/alternative; boundary="1355177509.CbA8dd1.29686"; charset="us-ascii"


--1355177509.CbA8dd1.29686
Date: Mon, 10 Dec 2012 22:11:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58101

          Priority: medium
            Bug ID: 58101
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Rendering problems with a Geforce Go 5300
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: miknix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 71293
  --> https://bugs.freedesktop.org/attachment.cgi?id=71293&action=edit
dmesg

Some gtk+ widgets (even entire windows) are not drawn below a certain screen
height, see screenshot. This behavior happens with compositing enabled and
disabled. Other examples of strange behavior include:
- On wireshark, widgets below a certain screen height are not shown. Hovering
over them makes them appear.
- Clicking on the text area of gvim to set the cursor position; then after
clicking over somewhere else, the text under the previous location disappears.
- On xfce-desktop, icons below a certain screen height are not displayed.
Dragging a selection rectangle over them makes them appear.

Qt software is rendered without problems. As suggested in the IRC by joi, it
might be related to cairo.

Gentoo x86_64 3.5.4-hardened-r1
x11-base/xorg-server-1.13.0-r1
x11-base/xorg-x11-7.4-r2
x11-drivers/xf86-video-nouveau-1.0.4
x11-libs/cairo-1.10.2-r3
media-libs/mesa-9.0.1
x11-libs/gtk+-2.24.12

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355177509.CbA8dd1.29686
Date: Mon, 10 Dec 2012 22:11:49 +0000
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
   title="NEW --- - Rendering problems with a Geforce Go 5300"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58101">58101</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Rendering problems with a Geforce Go 5300
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>miknix&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=71293" name="attach_71293" title="dmesg">attachment 71293</a> <a href="attachment.cgi?id=71293&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Some gtk+ widgets (even entire windows) are not drawn below a certain screen
height, see screenshot. This behavior happens with compositing enabled and
disabled. Other examples of strange behavior include:
- On wireshark, widgets below a certain screen height are not shown. Hovering
over them makes them appear.
- Clicking on the text area of gvim to set the cursor position; then after
clicking over somewhere else, the text under the previous location disappears.
- On xfce-desktop, icons below a certain screen height are not displayed.
Dragging a selection rectangle over them makes them appear.

Qt software is rendered without problems. As suggested in the IRC by joi, it
might be related to cairo.

Gentoo x86_64 3.5.4-hardened-r1
x11-base/xorg-server-1.13.0-r1
x11-base/xorg-x11-7.4-r2
x11-drivers/xf86-video-nouveau-1.0.4
x11-libs/cairo-1.10.2-r3
media-libs/mesa-9.0.1
x11-libs/gtk+-2.24.12</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355177509.CbA8dd1.29686--

--===============0879121813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0879121813==--
