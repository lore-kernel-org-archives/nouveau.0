From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27136] New: blank screen with G98 [Quadro NVS 420]
 (NV98) dual GPU, 4-head
Date: Wed, 17 Mar 2010 12:59:06 -0700 (PDT)
Message-ID: <bug-27136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

http://bugs.freedesktop.org/show_bug.cgi?id=27136

           Summary: blank screen with G98 [Quadro NVS 420] (NV98) dual GPU,
                    4-head
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: hudler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=34158)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=34158)
Xorg log loading nouveau using minimal 4-line xorg.conf

I am running debian unstable with latest git and following InstallNouveau and
InstallDRM instructions from the wiki at http://nouveau.freedesktop.org/wiki/.

PROBLEM:
When I type "modprobe nouveau", I get a blank screen and the monitor says
"Entering Power Save Mode", which is something it might do when there is no
input.  The same happens when Xorg loads the module, rather than just manually
from the console.

No modules are loaded by initramfs or after init.  No framebuffer driver is
built in this kernel, but CONFIG_FRAMEBUFFER_CONSOLE=y.

Complete Xorg logs are attached (using the minimal xorg.conf).  I will attach
kernel logs in the next update.

HARDWARE DETAILS:
This card has two GPU's and one DisplayPort.  The DisplayPort has a splitter
with dual connectors each containing two DVI ports.  Each connector is
controlled by one of the GPU's.  Currently everything works in Xorg using the
nvidia driver with TWO Device sections:

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BoardName      "Quadro NVS 420"
    BusID          "PCI:5:0:0"
EndSection

Section "Device"
    Identifier     "Device1"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BoardName      "Quadro NVS 420"
    BusID          "PCI:6:0:0"
EndSection

Each device has a corresponding screen and it is all combined with TwinView,
etc.

Here's lcpci output:

05:00.0 VGA compatible controller: nVidia Corporation G98 [Quadro NVS 420] (rev
a1) (prog-if 00 [VGA controller])
        Subsystem: nVidia Corporation Device 057e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 24
        Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f4000000 (64-bit, non-prefetchable) [size=32M]
        Region 5: I/O ports at dc80 [size=128]
        [virtual] Expansion ROM at f7e00000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel driver in use: nvidia

06:00.0 3D controller: nVidia Corporation G98 [Quadro NVS 420] (rev a1)
        Subsystem: nVidia Corporation Device 057e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 35
        Region 0: Memory at f1000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f2000000 (64-bit, non-prefetchable) [size=32M]
        Region 5: I/O ports at cc80 [size=128]
        [virtual] Expansion ROM at f0f00000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel driver in use: nvidia

Ignore the "Kernel driver in use" line, I was using nvidia when I copied this.

What I am trying to do with nouveau is just get ONE screen working on any of
the GPUs, even if I must disable one of them somehow.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
