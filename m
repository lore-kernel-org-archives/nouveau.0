From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37549] New: Dell Studio XPS 1340 - fails to enter
	suspend mode
Date: Tue, 24 May 2011 09:21:56 -0700 (PDT)
Message-ID: <bug-37549-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37549

           Summary: Dell Studio XPS 1340 - fails to enter suspend mode
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: daniel-FhjLw7zaDyBIvLhBkaBJOXtgZLXuOG4l@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


This problem was originally reported here:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/754711

The system works correctly with the Ubuntu-patched 2.6.35 Kernel as shipped
with Ubuntu 10.10, but fails with the 2.6.38 kernel from Ubuntu 11.04.

While tracking down this problem, I tested several mainline kernels, all of
which also fail to suspend/resume on this system, as I describe below.

Steps to reproduce:
- try to enter suspend mode (I used sudo pm-suspend)

Expected result:
- The system enters sleep mode and upon pressing the power switch, resumes
successfully

Actual result:
I tried this with the following kernels (all mainline):

2.6.39-999.201104080911 - The system enters suspend mode, but upon trying to
resume, the system is unresponsive: backlight doesn't come on, there is no
display, keyboard is unresponsive, and system doesn't respond to pings on the
network.

2.6.38-3-natty mainline kernel. The system boots and is usable, enters suspend
mode, but upon attempting to resume is unresponsive, the backlight doesn't come
up, no display, keyboard is unresponsive and system doesn't respond to pings on
the network. At some point I saw capslock flashing but it stopped after a bit.

v2.6.35.12-maverick mainline kernel, with this kernel the system boots but when
trying to enter graphical mode becomes unresponsive, no keyboard, network ping
or display (screen is black). 

Here is some relevant information on the system, please let me know if any more
tests are needed.

dmi.bios.date: 09/08/2009
dmi.bios.vendor: Dell Inc.
dmi.bios.version: A11
dmi.board.name: 0K183D
dmi.board.vendor: Dell Inc.
dmi.board.version: A11
dmi.chassis.asset.tag: 1234567890
dmi.chassis.type: 8
dmi.chassis.vendor: Dell Inc.
dmi.chassis.version: A11
dmi.modalias:
dmi:bvnDellInc.:bvrA11:bd09/08/2009:svnDellInc.:pnStudioXPS1340:pvrA11:rvnDellInc.:rn0K183D:rvrA11:cvnDellInc.:ct8:cvrA11:
dmi.product.name: Studio XPS 1340
dmi.product.version: A11
dmi.sys.vendor: Dell Inc.

GraphicsCard:
02:00.0 VGA compatible controller [0300]: nVidia Corporation G98 [GeForce 9200M
GS] [10de:06e8] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device [1028:0271]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 23
    Region 0: Memory at ae000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at ac000000 (64-bit, non-prefetchable) [size=32M]
    Region 5: I/O ports at 4000 [size=128]
    Capabilities: <access denied>
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb

03:00.0 VGA compatible controller [0300]: nVidia Corporation C79 [GeForce 9400M
G] [10de:0866] (rev b1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device [1028:0271]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 18
    Region 0: Memory at aa000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at b0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at cc000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at 5000 [size=128]
    [virtual] Expansion ROM at c0000000 [disabled] [size=128K]
    Capabilities: <access denied>
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
