From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51144] New: significant pixel corruption in text
Date: Fri, 15 Jun 2012 23:26:27 +0000
Message-ID: <bug-51144-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51144

             Bug #: 51144
           Summary: significant pixel corruption in text
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: basile-VdE74OAlGqnvXjIo7pOF+l6hYfS7NtTn@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 63099
  --> https://bugs.freedesktop.org/attachment.cgi?id=63099
photo of screen portion with corrupted text pixels

(perhaps bug similar to 20363)

with latest git of xf86-video-nouveau:

commit 36d3f8c28c55c05ccf4efa985831d2d249bad2fe
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Jun 13 22:41:58 2012 +1000

    dri2: kill debug spam

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


with latest git of drm
 % git log    
commit d1fcfb17b9642ae351b03056a27b328f314ca80a
Author: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Tue Jun 12 18:09:55 2012 -0400

    radeon: force 1D array mode for z/stencil surface

    On r6xx or evergreen z/stencil surface don't support linear or
    linear aligned surface, force 1D tiled mode for those.

    Signed-off-by: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

=======================================
hardware (bought last week, june 2012):
   motherboard ASUS P8Z77-V
   Intel(R) Core(TM) i7-3770K CPU
   one graphic card Gigabyte GTS 450
   16Gb RAM, SSD disk + Sata disks
=========================
kernel: Linux 3.4.2 AMD64 (downloaded from kernel.org, compiled thru make-kpkg)

% lspci
00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM Controller
(rev 09)
00:01.0 PCI bridge: Intel Corporation 3rd Gen Core processor PCI Express Root
Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
00:14.0 USB controller: Intel Corporation 7 Series Chipset Family USB xHCI Host
Controller (rev 04)
00:16.0 Communication controller: Intel Corporation 7 Series Chipset Family MEI
Controller #1 (rev 04)
00:19.0 Ethernet controller: Intel Corporation 82579V Gigabit Network
Connection (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series Chipset Family USB Enhanced
Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 7 Series Chipset Family High Definition
Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 7 Series Chipset Family PCI Express Root
Port 1 (rev c4)
00:1c.3 PCI bridge: Intel Corporation 7 Series Chipset Family PCI Express Root
Port 4 (rev c4)
00:1c.4 PCI bridge: Intel Corporation 82801 PCI Bridge (rev c4)
00:1c.7 PCI bridge: Intel Corporation 7 Series Chipset Family PCI Express Root
Port 8 (rev c4)
00:1d.0 USB controller: Intel Corporation 7 Series Chipset Family USB Enhanced
Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation Z77 Express Chipset LPC Controller (rev
04)
00:1f.2 SATA controller: Intel Corporation 7 Series Chipset Family 6-port SATA
AHCI Controller (rev 04)
00:1f.3 SMBus: Intel Corporation 7 Series Chipset Family SMBus Controller (rev
04)
01:00.0 VGA compatible controller: NVIDIA Corporation GF116 [GeForce GTS 450]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF116 High Definition Audio Controller
(rev a1)
03:00.0 SATA controller: ASMedia Technology Inc. ASM1062 Serial ATA Controller
(rev 01)
04:00.0 PCI bridge: ASMedia Technology Inc. ASM1083/1085 PCIe to PCI Bridge
(rev 03)
06:00.0 USB controller: ASMedia Technology Inc. ASM1042 SuperSpeed USB Host
Controller

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
