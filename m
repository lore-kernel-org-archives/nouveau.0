From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] New: GeForce 8300 not supported
	(10de:0848/C77/MCP77)
Date: Wed, 29 Oct 2008 00:32:05 -0700 (PDT)
Message-ID: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286

           Summary: GeForce 8300 not supported (10de:0848/C77/MCP77)
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sbrandt-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=19924)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=19924)
excerpt of Xorg.log with detection/startup messages

The GeForce 8300 graphics chip is not supported by the nouveau
driver of the current (7.4) xorg release. 
(Neither by the open source NVidia driver, see bug #18092 and bug #17526)

The 8300 is only available as OEM/on board, e.g., on the ASUS M3N/H-HDMI
mainboard. Called mGPU (Motherboard GPU) now, by NVidia.
lscpi: 02:00.0 VGA compatible controller: nVidia Corporation Device 0848 (rev
a2)
lspci -n: 02:00.0 0300: 10de:0848 (rev a2)
http://pci-ids.ucw.cz/read/PC/10de/0848 

According to
http://en.wikipedia.org/wiki/GeForce_8_Series#Geforce_8300_and_8400, it has a
G86 core. Or maybe not - I think they refer to the 8300 GS.

NVidia proprietary driver supports it, of course (since at least 173.14.05)
(II) NVIDIA(0): NVIDIA GPU GeForce 8300 (C77) at PCI:2:0:0 (GPU-0).

I changed the nv_driver.c to get some information about the architecture, and
to try to support it. 

static int NVGetArchitecture(volatile uint32_t *regs) ...
Architecture is detected as 0xAA.

static Bool NVPciProbe
Allowed architecture up to 0xAA (was 0x9F before).

Excerpt from Xorg.log is attached, where libglx.so was still set to closed
source nvidia. [SBr] log messages have been added by myself.

After correcting the glx, the X server crashed quite hard. I will do this again
and attach the log.
Pls tell me whether you need ReNouveau or MMIO Trace dumps.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
