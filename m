From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64772] New: nouveau GF108 kernel errors and graphics
 corruption when enabling second output
Date: Sun, 19 May 2013 20:42:09 +0000
Message-ID: <bug-64772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779044023=="
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


--===============1779044023==
Content-Type: multipart/alternative; boundary="1368996130.fA151.3831"; charset="us-ascii"


--1368996130.fA151.3831
Date: Sun, 19 May 2013 20:42:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64772

          Priority: medium
            Bug ID: 64772
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau GF108 kernel errors and graphics corruption
                    when enabling second output
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: pasik-X3B1VOXEql0@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 79548
  --> https://bugs.freedesktop.org/attachment.cgi?id=79548&action=edit
nouveau errors, dmesg from Linux kernel 3.9.2

I'm using Lenovo T430 laptop with intel/nvidia hybrid graphics, but optimus is
disabled in BIOS, and only the Nvidia discreet GPU is enabled currently:

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [Quadro NVS 5400M]
(rev a1)

I boot up the laptop with only using the laptop internal LVDS panel, and when
in X session, I connect DVI cable to the docking station. xrandr now correctly
shows DP2 as connected, and when I enable the DVI display, I get these nouveau
errors in the kernel dmesg:

[  103.196252] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS0: 0x036f0040
[  103.196257] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS1: 0x036f0040
[  103.353160] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  103.353163] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[  103.353923] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  103.353925] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
..
..

DVI monitor output actually gets enabled, and I can see the desktop there, but
both the LVDS display and the DVI display are all messed up.

For example moving a window around leaves traces of other window contents, and
the background image gets replaced with all kinds of corrupted patterns, so
graphics looks quite weird and corrupted on both displays.

Switching back to only using the internal LVDS (disabling DVI/DP2 output) fixes
the graphics corruptions.

$ uname -a
Linux localhost.localdomain 3.8.11-200.fc18.x86_64 #1 SMP Wed May 1 19:44:27
UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

I also tried Linux kernel 3.9.2, and there I get exactly the same graphics
corruption behaviour, but the kernel errors are slightly different:

[   91.533612] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS0: 0x036f0040
[   91.533618] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS1: 0x036f0040
[   91.533856] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x141820 [ IBUS ]
[  246.466283] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  246.466287] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[  246.499229] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  246.499232] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28


Dmesg from Linux 3.9.2 attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368996130.fA151.3831
Date: Sun, 19 May 2013 20:42:10 +0000
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
   title="NEW --- - nouveau GF108 kernel errors and graphics corruption when enabling second output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64772">64772</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau GF108 kernel errors and graphics corruption when enabling second output
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
          <td>pasik&#64;iki.fi
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
        <pre>Created <span class=""><a href="attachment.cgi?id=79548" name="attach_79548" title="nouveau errors, dmesg from Linux kernel 3.9.2">attachment 79548</a> <a href="attachment.cgi?id=79548&amp;action=edit" title="nouveau errors, dmesg from Linux kernel 3.9.2">[details]</a></span>
nouveau errors, dmesg from Linux kernel 3.9.2

I'm using Lenovo T430 laptop with intel/nvidia hybrid graphics, but optimus is
disabled in BIOS, and only the Nvidia discreet GPU is enabled currently:

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [Quadro NVS 5400M]
(rev a1)

I boot up the laptop with only using the laptop internal LVDS panel, and when
in X session, I connect DVI cable to the docking station. xrandr now correctly
shows DP2 as connected, and when I enable the DVI display, I get these nouveau
errors in the kernel dmesg:

[  103.196252] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS0: 0x036f0040
[  103.196257] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS1: 0x036f0040
[  103.353160] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  103.353163] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[  103.353923] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  103.353925] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
..
..

DVI monitor output actually gets enabled, and I can see the desktop there, but
both the LVDS display and the DVI display are all messed up.

For example moving a window around leaves traces of other window contents, and
the background image gets replaced with all kinds of corrupted patterns, so
graphics looks quite weird and corrupted on both displays.

Switching back to only using the internal LVDS (disabling DVI/DP2 output) fixes
the graphics corruptions.

$ uname -a
Linux localhost.localdomain 3.8.11-200.fc18.x86_64 #1 SMP Wed May 1 19:44:27
UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

I also tried Linux kernel 3.9.2, and there I get exactly the same graphics
corruption behaviour, but the kernel errors are slightly different:

[   91.533612] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS0: 0x036f0040
[   91.533618] nouveau  [   PLTCG][0000:01:00.0] LTC0_LTS1: 0x036f0040
[   91.533856] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x141820 [ IBUS ]
[  246.466283] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  246.466287] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[  246.499229] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[  246.499232] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28


Dmesg from Linux 3.9.2 attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368996130.fA151.3831--

--===============1779044023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1779044023==--
