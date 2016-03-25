From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94694] New: Attempt to use kde/plasma renders the
 system immediately unresponsive
Date: Fri, 25 Mar 2016 13:03:40 +0000
Message-ID: <bug-94694-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1761000753=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1761000753==
Content-Type: multipart/alternative; boundary="14589110200.8DE5.10816";
 charset="UTF-8"


--14589110200.8DE5.10816
Date: Fri, 25 Mar 2016 13:03:40 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94694

            Bug ID: 94694
           Summary: Attempt to use kde/plasma renders the system
                    immediately unresponsive
           Product: Mesa
           Version: 11.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: oakad-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 122538
  --> https://bugs.freedesktop.org/attachment.cgi?id=122538&action=edit
Xorg.0.log for the failed session

The crux of the problem: 

Mar 25 23:40:25 mercador kernel: nouveau 0000:01:00.0: plasmashell[6208]:
failed
 to idle channel 17 [plasmashell[6208]]
Mar 25 23:40:27 mercador kernel: nouveau 0000:01:00.0: timeout at
drivers/gpu/dr
m/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpfifo_engine_fini()!
Mar 25 23:40:27 mercador kernel: nouveau 0000:01:00.0: fifo: channel 17
[plasmas
hell[6208]] kick timeout
Mar 25 23:40:27 mercador kernel: nouveau: plasmashell[6208]:00000000:0000906f:
d
etach gr failed, -16
Mar 25 23:40:27 mercador kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
Mar 25 23:40:29 mercador kernel: nouveau 0000:01:00.0: timeout at
drivers/gpu/dr
m/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpfifo_engine_fini()!
Mar 25 23:40:29 mercador kernel: nouveau 0000:01:00.0: fifo: channel 17
[plasmas
hell[6208]] kick timeout
Mar 25 23:40:29 mercador kernel: nouveau: plasmashell[6208]:00000000:0000906f:
d
etach sw failed, -16
Mar 25 23:40:44 mercador kernel: nouveau 0000:01:00.0: plasmashell[6208]:
failed
 to idle channel 17 [plasmashell[6208]]

This will happen immediately upon any interaction with KDE 5 panel.

At this moment system is rendered inoperable, even though it may still possible
to reboot it over network. The CPU usage becomes high, apparently being
consumed by an in-kernel thread.

The kernel version is 4.4.6
Kde/plasma version is 5.19.0, qt is 5.5.1
X11/nouveau driver version is 1.0.12

Xorg.0.log is attached (with some additional errors signalling that event queue
is filling up).

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14589110200.8DE5.10816
Date: Fri, 25 Mar 2016 13:03:40 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Attempt to use kde/plasma renders the system immediately unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94694">94694</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Attempt to use kde/plasma renders the system immediately unresponsive
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.1
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>oakad&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122538" name="attach_122538" title="Xorg.0.log for the failed session">attachment 122538</a> <a href="attachment.cgi?id=122538&amp;action=edit" title="Xorg.0.log for the failed session">[details]</a></span>
Xorg.0.log for the failed session

The crux of the problem: 

Mar 25 23:40:25 mercador kernel: nouveau 0000:01:00.0: plasmashell[6208]:
failed
 to idle channel 17 [plasmashell[6208]]
Mar 25 23:40:27 mercador kernel: nouveau 0000:01:00.0: timeout at
drivers/gpu/dr
m/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpfifo_engine_fini()!
Mar 25 23:40:27 mercador kernel: nouveau 0000:01:00.0: fifo: channel 17
[plasmas
hell[6208]] kick timeout
Mar 25 23:40:27 mercador kernel: nouveau: plasmashell[6208]:00000000:0000906f:
d
etach gr failed, -16
Mar 25 23:40:27 mercador kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
Mar 25 23:40:29 mercador kernel: nouveau 0000:01:00.0: timeout at
drivers/gpu/dr
m/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpfifo_engine_fini()!
Mar 25 23:40:29 mercador kernel: nouveau 0000:01:00.0: fifo: channel 17
[plasmas
hell[6208]] kick timeout
Mar 25 23:40:29 mercador kernel: nouveau: plasmashell[6208]:00000000:0000906f:
d
etach sw failed, -16
Mar 25 23:40:44 mercador kernel: nouveau 0000:01:00.0: plasmashell[6208]:
failed
 to idle channel 17 [plasmashell[6208]]

This will happen immediately upon any interaction with KDE 5 panel.

At this moment system is rendered inoperable, even though it may still possible
to reboot it over network. The CPU usage becomes high, apparently being
consumed by an in-kernel thread.

The kernel version is 4.4.6
Kde/plasma version is 5.19.0, qt is 5.5.1
X11/nouveau driver version is 1.0.12

Xorg.0.log is attached (with some additional errors signalling that event queue
is filling up).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14589110200.8DE5.10816--

--===============1761000753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1761000753==--
