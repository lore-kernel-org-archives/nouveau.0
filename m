From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] New: Screen freezes during boot with an 3.13
 kernel (Arch Linux)
Date: Tue, 25 Feb 2014 22:15:15 +0000
Message-ID: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0576213829=="
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


--===============0576213829==
Content-Type: multipart/alternative; boundary="1393366515.BACd8FD21.29573"; charset="us-ascii"


--1393366515.BACd8FD21.29573
Date: Tue, 25 Feb 2014 22:15:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

          Priority: medium
            Bug ID: 75511
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen freezes during boot with an 3.13 kernel (Arch
                    Linux)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 94735
  --> https://bugs.freedesktop.org/attachment.cgi?id=94735&action=edit
dmesg output

During boot (with late module load of nouveau) the screen freezes at about the
time where normally a glitch occurs and the resolution is set much higher. It
will not recover from this state and the machine must be restarted/powered off
via ctrl+alt+del or the power button. The journald log shows that systemd
booted normally. I circumvented the problem by downgrading to kernel 3.12 where
everything works fine. Here are the Arch Linux package versions of the
configuration when the error occurs:

kernel - 3.13.5-1
xf86-video-nouveau - 1.0.10-2
nouveau-dri - 10.0.3-1
mesa - 10.0.3-1
xorg-server - 1.15.0-5
libdrm - 2.4.52-1


The dmesg output in the attachment was taken during a boot (as last systemd
target before gnome) with the problem described above.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393366515.BACd8FD21.29573
Date: Tue, 25 Feb 2014 22:15:15 +0000
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
   title="NEW --- - Screen freezes during boot with an 3.13 kernel (Arch Linux)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">75511</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen freezes during boot with an 3.13 kernel (Arch Linux)
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
          <td>cllorenz&#64;uni-potsdam.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=94735" name="attach_94735" title="dmesg output">attachment 94735</a> <a href="attachment.cgi?id=94735&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

During boot (with late module load of nouveau) the screen freezes at about the
time where normally a glitch occurs and the resolution is set much higher. It
will not recover from this state and the machine must be restarted/powered off
via ctrl+alt+del or the power button. The journald log shows that systemd
booted normally. I circumvented the problem by downgrading to kernel 3.12 where
everything works fine. Here are the Arch Linux package versions of the
configuration when the error occurs:

kernel - 3.13.5-1
xf86-video-nouveau - 1.0.10-2
nouveau-dri - 10.0.3-1
mesa - 10.0.3-1
xorg-server - 1.15.0-5
libdrm - 2.4.52-1


The dmesg output in the attachment was taken during a boot (as last systemd
target before gnome) with the problem described above.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393366515.BACd8FD21.29573--

--===============0576213829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0576213829==--
