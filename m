From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25619] New: nouveau fails to detect connected
 monitor on nforce1 (nv1a)
Date: Sun, 13 Dec 2009 05:47:45 -0800 (PST)
Message-ID: <bug-25619-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25619

           Summary: nouveau fails to detect connected monitor on nforce1
                    (nv1a)
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32037)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32037)
Kernel log

System is MSI K7N420 Pro, using the onboard nforce graphics.

lspci:
00:00.0 Host bridge [0600]: nVidia Corporation nForce CPU bridge [10de:01a4]
(rev b2)
00:00.1 RAM memory [0500]: nVidia Corporation nForce 220/420 Memory Controller
[10de:01ac] (rev b2)
00:00.2 RAM memory [0500]: nVidia Corporation nForce 220/420 Memory Controller
[10de:01ad] (rev b2)
00:00.3 RAM memory [0500]: nVidia Corporation nForce 420 Memory Controller
(DDR) [10de:01ab] (rev b2)
00:01.0 ISA bridge [0601]: nVidia Corporation nForce ISA Bridge [10de:01b2]
(rev c3)
00:01.1 SMBus [0c05]: nVidia Corporation nForce PCI System Management
[10de:01b4] (rev c1)
00:02.0 USB Controller [0c03]: nVidia Corporation nForce USB Controller
[10de:01c2] (rev c3)
00:03.0 USB Controller [0c03]: nVidia Corporation nForce USB Controller
[10de:01c2] (rev c3)
00:04.0 Ethernet controller [0200]: nVidia Corporation nForce Ethernet
Controller [10de:01c3] (rev c2)
00:05.0 Multimedia audio controller [0401]: nVidia Corporation nForce Audio
Processing Unit [10de:01b0] (rev c2)
00:06.0 Multimedia audio controller [0401]: nVidia Corporation nForce AC'97
Audio Controller [10de:01b1] (rev c2)
00:08.0 PCI bridge [0604]: nVidia Corporation nForce PCI-to-PCI bridge
[10de:01b8] (rev c2)
00:09.0 IDE interface [0101]: nVidia Corporation nForce IDE [10de:01bc] (rev
c3)
00:1e.0 PCI bridge [0604]: nVidia Corporation nForce AGP to PCI Bridge
[10de:01b7] (rev b2)
01:00.0 USB Controller [0c03]: NEC Corporation USB [1033:0035] (rev 41)
01:00.1 USB Controller [0c03]: NEC Corporation USB [1033:0035] (rev 41)
01:00.2 USB Controller [0c03]: NEC Corporation USB 2.0 [1033:00e0] (rev 02)
01:02.0 VGA compatible controller [0300]: Cirrus Logic GD 5446 [1013:00b8]
02:00.0 VGA compatible controller [0300]: nVidia Corporation NVCrush11
[GeForce2 MX Integrated Graphics] [10de:01a0] (rev b1)

When loading nouveau, display goes into standby mode (no signal).
Unloading an loading nouveau again does not change anything.

nvidiafb is able to get the display running.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
