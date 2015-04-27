From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90201] New: repeatable freeze with nouveau and
 geeqie context menus
Date: Mon, 27 Apr 2015 19:09:10 +0000
Message-ID: <bug-90201-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0005614901=="
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


--===============0005614901==
Content-Type: multipart/alternative; boundary="1430161750.8318C01.28757"; charset="UTF-8"


--1430161750.8318C01.28757
Date: Mon, 27 Apr 2015 19:09:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90201

            Bug ID: 90201
           Summary: repeatable freeze with nouveau and geeqie context
                    menus
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mattdm-u0/72CSfwU0dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115383
  --> https://bugs.freedesktop.org/attachment.cgi?id=115383&action=edit
system log from crash

Description of problem:

This seems kind of weird, but I can reliably trigger a hang of the GUI on my
system by running geeqie and right-clicking on the file list. The context menu
comes up, but the mouse and keyboard immediately become nonresponsive. I can
ssh in and reboot, though.


Version-Release number of selected component (if applicable):

xorg-x11-drv-nouveau-1.0.11-2.fc22.x86_64

How reproducible:

Seems to be always.

Steps to Reproduce:
1. run geeqie in a directory with a number of jpg files
2. right click on one of those files in the list
3. boom

Actual results:

mouse and keyboard freeze

Expected results:

not that.

Additional info:

system log is full of lines like:

Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 1 [DRM] subc 0 mthd 0x001c data 0x00001004
Apr 24 21:26:22 system.example.org systemd-journal[477]: Missed 16 kernel
messages
Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 1 [DRM] subc 0 mthd 0x001c data 0x00001004
Apr 24 21:26:22 system.example.org systemd-journal[477]: Missed 16 kernel
messages
Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 1 [DRM] subc 0 mthd 0x001c data 0x00001004
Apr 24 21:26:22 system.example.org systemd-journal[477]: Missed 19 kernel
messages
Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ACQUIRE


And by "full", I mean about 7.6 million lines of that in a few minutes -- so
much that it seems to have wiped out previous log information by sheer volume,
triggering systemd's log rotation.


This didn't happen with Fedora 21. I'm running under GNOME Shell -- I have not
tried other environments.

A bug filed in Fedora https://bugzilla.redhat.com/show_bug.cgi?id=1215329 has
additional logs from another tester who was able to reproduce.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430161750.8318C01.28757
Date: Mon, 27 Apr 2015 19:09:10 +0000
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
   title="NEW - repeatable freeze with nouveau and geeqie context menus"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90201">90201</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>repeatable freeze with nouveau and geeqie context menus
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>mattdm&#64;mattdm.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115383" name="attach_115383" title="system log from crash">attachment 115383</a> <a href="attachment.cgi?id=115383&amp;action=edit" title="system log from crash">[details]</a></span>
system log from crash

Description of problem:

This seems kind of weird, but I can reliably trigger a hang of the GUI on my
system by running geeqie and right-clicking on the file list. The context menu
comes up, but the mouse and keyboard immediately become nonresponsive. I can
ssh in and reboot, though.


Version-Release number of selected component (if applicable):

xorg-x11-drv-nouveau-1.0.11-2.fc22.x86_64

How reproducible:

Seems to be always.

Steps to Reproduce:
1. run geeqie in a directory with a number of jpg files
2. right click on one of those files in the list
3. boom

Actual results:

mouse and keyboard freeze

Expected results:

not that.

Additional info:

system log is full of lines like:

Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 1 [DRM] subc 0 mthd 0x001c data 0x00001004
Apr 24 21:26:22 system.example.org systemd-journal[477]: Missed 16 kernel
messages
Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 1 [DRM] subc 0 mthd 0x001c data 0x00001004
Apr 24 21:26:22 system.example.org systemd-journal[477]: Missed 16 kernel
messages
Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ch 1 [DRM] subc 0 mthd 0x001c data 0x00001004
Apr 24 21:26:22 system.example.org systemd-journal[477]: Missed 19 kernel
messages
Apr 24 21:26:22 system.example.org kernel: nouveau E[   PFIFO][0000:01:00.0]
PBDMA0: ACQUIRE


And by &quot;full&quot;, I mean about 7.6 million lines of that in a few minutes -- so
much that it seems to have wiped out previous log information by sheer volume,
triggering systemd's log rotation.


This didn't happen with Fedora 21. I'm running under GNOME Shell -- I have not
tried other environments.

A bug filed in Fedora <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1215329">https://bugzilla.redhat.com/show_bug.cgi?id=1215329</a> has
additional logs from another tester who was able to reproduce.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430161750.8318C01.28757--

--===============0005614901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0005614901==--
