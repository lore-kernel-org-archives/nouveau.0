From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72717] New: No sound via display port (hdmi works)
Date: Sat, 14 Dec 2013 22:02:29 +0000
Message-ID: <bug-72717-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1951118794=="
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


--===============1951118794==
Content-Type: multipart/alternative; boundary="1387058550.4FdFc1.939"; charset="us-ascii"


--1387058550.4FdFc1.939
Date: Sat, 14 Dec 2013 22:02:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72717

          Priority: medium
            Bug ID: 72717
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: No sound via display port (hdmi works)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 7.4 (2008.09)
         Component: Driver/nouveau
           Product: xorg

Created attachment 90786
  --> https://bugs.freedesktop.org/attachment.cgi?id=90786&action=edit
Kernel log with monitor attached to display port

I own an ASUS Nvidia GTX 660 card. If I connect a monitor to the HDMI
connector, sound works. If I connect a monitor to the display port connector,
sound does not work. In the latter case, all /proc/asound/NVidia/eld* show the
output

monitor_present         0
eld_valid               0

If I connect a monitor to the HDMI port, "monitor_present" shows "1".

Kernel: 3.12.5 (Gentoo)
Dmesg for the display port case (failure case): See attachment

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387058550.4FdFc1.939
Date: Sat, 14 Dec 2013 22:02:30 +0000
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
   title="NEW --- - No sound via display port (hdmi works)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72717">72717</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No sound via display port (hdmi works)
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
          <td>matthias.h.nagel&#64;gmail.com
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
          <td>7.4 (2008.09)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=90786" name="attach_90786" title="Kernel log with monitor attached to display port">attachment 90786</a> <a href="attachment.cgi?id=90786&amp;action=edit" title="Kernel log with monitor attached to display port">[details]</a></span>
Kernel log with monitor attached to display port

I own an ASUS Nvidia GTX 660 card. If I connect a monitor to the HDMI
connector, sound works. If I connect a monitor to the display port connector,
sound does not work. In the latter case, all /proc/asound/NVidia/eld* show the
output

monitor_present         0
eld_valid               0

If I connect a monitor to the HDMI port, &quot;monitor_present&quot; shows &quot;1&quot;.

Kernel: 3.12.5 (Gentoo)
Dmesg for the display port case (failure case): See attachment</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387058550.4FdFc1.939--

--===============1951118794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1951118794==--
