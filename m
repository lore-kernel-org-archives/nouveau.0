From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43562] New: GT215: Freeze on X startup
Date: Tue, 06 Dec 2011 17:24:43 +0000
Message-ID: <bug-43562-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

https://bugs.freedesktop.org/show_bug.cgi?id=43562

             Bug #: 43562
           Summary: GT215: Freeze on X startup
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dimon-hi6Y0CQ0nG0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 54166
  --> https://bugs.freedesktop.org/attachment.cgi?id=54166
dmesg 3.0.0-13-generic and 3.2.0-030200rc4-generic

The system freezes on X starup.
The kernel log reveals a gpu lockup.
Removing vt.handoff (as suggested in #nouveau)from the boot parameters doesn't
resolve the problem.
A GeForce 210G is running on the same system without any problems.




Software:
Ubuntu Oneiric:
linux: 3.0.0-13-generic / 3.2.0-030200rc4-generic
xserver-xorg-core:
2:1.11.2.901+git20111128+server-1.11-branch.bed7d7f3-0ubuntu0sarvatt
xserver-xorg-video-nouveau:
1:0.0.16+git20111201.b5534a15-0ubuntu0sarvatt~oneiric
libdrm-nouveau1a: 2.4.28+git20111205.902ee661-0ubuntu0sarvatt~oneiric
libdrm2: 2.4.28+git20111205.902ee661-0ubuntu0sarvatt~oneiric


Hardware:
00:00.0 RAM memory: nVidia Corporation MCP61 Memory Controller (rev a1)
00:01.0 ISA bridge: nVidia Corporation MCP61 LPC Bridge (rev a2)
00:01.1 SMBus: nVidia Corporation MCP61 SMBus (rev a2)
00:01.2 RAM memory: nVidia Corporation MCP61 Memory Controller (rev a2)
00:02.0 USB Controller: nVidia Corporation MCP61 USB Controller (rev a3)
00:02.1 USB Controller: nVidia Corporation MCP61 USB Controller (rev a3)
00:04.0 PCI bridge: nVidia Corporation MCP61 PCI bridge (rev a1)
00:06.0 IDE interface: nVidia Corporation MCP61 IDE (rev a2)
00:07.0 Bridge: nVidia Corporation MCP61 Ethernet (rev a2)
00:09.0 PCI bridge: nVidia Corporation MCP61 PCI Express bridge (rev a2)
00:18.0 Host bridge: Advanced Micro Devices [AMD] Family 10h Processor
HyperTransport Configuration
00:18.1 Host bridge: Advanced Micro Devices [AMD] Family 10h Processor Address
Map
00:18.2 Host bridge: Advanced Micro Devices [AMD] Family 10h Processor DRAM
Controller
00:18.3 Host bridge: Advanced Micro Devices [AMD] Family 10h Processor
Miscellaneous Control
00:18.4 Host bridge: Advanced Micro Devices [AMD] Family 10h Processor Link
Control
01:07.0 Multimedia audio controller: Creative Labs SB Audigy (rev 03)
01:07.1 Input device controller: Creative Labs SB Audigy Game Port (rev 03)
01:07.2 FireWire (IEEE 1394): Creative Labs SB Audigy FireWire Port
02:00.0 VGA compatible controller: nVidia Corporation GT215 [GeForce GT 240]
(rev a2)
02:00.1 Audio device: nVidia Corporation High Definition Audio Controller (rev
a1)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
