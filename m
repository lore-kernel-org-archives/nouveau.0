From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21023] New: NV34GL: fails to properly set up DVI
Date: Thu,  2 Apr 2009 21:31:38 -0700 (PDT)
Message-ID: <bug-21023-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21023

           Summary: NV34GL: fails to properly set up DVI
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: notting-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24488)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24488)
X log

Originally filed as: https://bugzilla.redhat.com/show_bug.cgi?id=492399

When using DVI (to a Dell 2005FPW), it fails to set up the mode correctly. The
screen briefly appears, wobbles, and then blinks on and off.

VGA connection works fine.

Relevant dmesg:
mtrr: type mismatch for e8000000,8000000 old: write-back new: write-combining
agpgart-intel 0000:00:00.0: AGP 3.0 bridge
agpgart: Xorg tried to set rate=x12. Setting to AGP3 x8 mode.
agpgart-intel 0000:00:00.0: putting AGP V3 device into 8x mode
pci 0000:01:00.0: putting AGP V3 device into 8x mode
[drm] Allocating FIFO number 0
[drm] nouveau_fifo_alloc: initialised FIFO 0
[drm] Allocating FIFO number 1
[drm] nouveau_fifo_alloc: initialised FIFO 1

lspci:
00:00.0 Host bridge: Intel Corporation E7505 Memory Controller Hub (rev 03)
00:00.1 Class ff00: Intel Corporation E7505/E7205 Series RAS Controller (rev
03)
00:01.0 PCI bridge: Intel Corporation E7505/E7205 PCI-to-AGP Bridge (rev 03)
00:02.0 PCI bridge: Intel Corporation E7505 Hub Interface B PCI-to-PCI Bridge
(rev 03)
00:02.1 Class ff00: Intel Corporation E7505 Hub Interface B PCI-to-PCI Bridge
RAS Controller (rev 03)
00:1d.0 USB Controller: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M)
USB UHCI Controller #1 (rev 02)
00:1d.1 USB Controller: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M)
USB UHCI Controller #2 (rev 02)
00:1d.2 USB Controller: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M)
USB UHCI Controller #3 (rev 02)
00:1d.7 USB Controller: Intel Corporation 82801DB/DBM (ICH4/ICH4-M) USB2 EHCI
Controller (rev 02)
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 82)
00:1f.0 ISA bridge: Intel Corporation 82801DB/DBL (ICH4/ICH4-L) LPC Interface
Bridge (rev 02)
00:1f.1 IDE interface: Intel Corporation 82801DB (ICH4) IDE Controller (rev 02)
00:1f.3 SMBus: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) SMBus
Controller (rev 02)
00:1f.5 Multimedia audio controller: Intel Corporation 82801DB/DBL/DBM
(ICH4/ICH4-L/ICH4-M) AC'97 Audio Controller (rev 02)
01:00.0 VGA compatible controller: nVidia Corporation NV34GL [Quadro FX 500/600
PCI] (rev a1)
02:1c.0 PIC: Intel Corporation 82870P2 P64H2 I/OxAPIC (rev 04)
02:1d.0 PCI bridge: Intel Corporation 82870P2 P64H2 Hub PCI Bridge (rev 04)
02:1e.0 PIC: Intel Corporation 82870P2 P64H2 I/OxAPIC (rev 04)
02:1f.0 PCI bridge: Intel Corporation 82870P2 P64H2 Hub PCI Bridge (rev 04)
03:03.0 Ethernet controller: Intel Corporation 82545EM Gigabit Ethernet
Controller (Copper) (rev 01)

No xorg.conf. Xorg.log attached.

Version-Release number of selected component (if applicable):

kernel-2.6.29-0.258.2.3.rc8.git2.fc11.i686.PAE
xorg-x11-drv-nouveau-0.0.12-10.20090310git8f9a580.fc11.i586

How reproducible:

Every time


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
