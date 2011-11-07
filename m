From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42672] New: NMI SERR with 2 Geforce 310 cards
Date: Mon, 07 Nov 2011 17:20:33 +0000
Message-ID: <bug-42672-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42672

             Bug #: 42672
           Summary: NMI SERR with 2 Geforce 310 cards
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nick-aWjYu2gNfz0dnm+yROfE0A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 53251
  --> https://bugs.freedesktop.org/attachment.cgi?id=53251
dmesg output

See also https://bugzilla.redhat.com/show_bug.cgi?id=751242

Description of problem:

I have a new install of Fedora 16 on an x86_64 platform with two Nvidia Geforce
310 cards (the goal is to have three or four displays under X).  On boot, I get 
[    2.765825] NMI: PCI system error (SERR) for reason b1 on CPU 0.
[    2.765825] Dazed and confused, but trying to continue

and the second card stops working at that point. The NMI occurs while nouveau
and drm are initializing. dmesg log attached.

I suspect that this is a simple user error, but cannot find any guidance.

Version-Release number of selected component (if applicable):
Kernel 3.1.0-5.fc16.x86_64

How reproducible:
Every boot

Steps to Reproduce:
1. Install 2 Geforce 310 cards
2. Boot!
3.

Actual results:


Expected results:


Additional info:
lspci -vvv:
00:00.0 Host bridge: Intel Corporation 82975X Memory Controller Hub
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort+
<MAbort+ >SERR- <PERR- INTx-
 Latency: 0
 Capabilities: <access denied>
 Kernel driver in use: i82975x_edac
 Kernel modules: i82975x_edac

00:01.0 PCI bridge: Intel Corporation 82975X PCI Express Root Port (prog-if 00
[Normal decode])
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx+
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
 I/O behind bridge: 00002000-00002fff
 Memory behind bridge: c5000000-c62fffff
 Prefetchable memory behind bridge: 00000000b0000000-00000000c21fffff
 Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
 BridgeCtl: Parity- SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
  PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
 Capabilities: <access denied>
 Kernel driver in use: pcieport
 Kernel modules: shpchp

00:1b.0 Audio device: Intel Corporation N10/ICH 7 Family High Definition Audio
Controller (rev 01)
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx+
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Interrupt: pin A routed to IRQ 45
 Region 0: Memory at c2500000 (64-bit, non-prefetchable) [size=16K]
 Capabilities: <access denied>
 Kernel driver in use: snd_hda_intel
 Kernel modules: snd-hda-intel

00:1c.0 PCI bridge: Intel Corporation N10/ICH 7 Family PCI Express Port 1 (rev
01) (prog-if 00 [Normal decode])
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx+
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Bus: primary=00, secondary=10, subordinate=10, sec-latency=0
 I/O behind bridge: 00001000-00001fff
 Memory behind bridge: c3000000-c42fffff
 Prefetchable memory behind bridge: 00000000d0000000-00000000e21fffff
 Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
 BridgeCtl: Parity- SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
  PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
 Capabilities: <access denied>
 Kernel driver in use: pcieport
 Kernel modules: shpchp

00:1c.4 PCI bridge: Intel Corporation 82801GR/GH/GHM (ICH7 Family) PCI Express
Port 5 (rev 01) (prog-if 00 [Normal decode])
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx+
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Bus: primary=00, secondary=28, subordinate=28, sec-latency=0
 I/O behind bridge: 00006000-00006fff
 Memory behind bridge: f4200000-f43fffff
 Prefetchable memory behind bridge: 00000000f4400000-00000000f45fffff
 Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
 BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
  PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
 Capabilities: <access denied>
 Kernel driver in use: pcieport
 Kernel modules: shpchp

00:1c.5 PCI bridge: Intel Corporation 82801GR/GH/GHM (ICH7 Family) PCI Express
Port 6 (rev 01) (prog-if 00 [Normal decode])
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx+
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Bus: primary=00, secondary=3f, subordinate=3f, sec-latency=0
 I/O behind bridge: 00005000-00005fff
 Memory behind bridge: c2200000-c24fffff
 Prefetchable memory behind bridge: 00000000f4000000-00000000f41fffff
 Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
 BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
  PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
 Capabilities: <access denied>
 Kernel driver in use: pcieport
 Kernel modules: shpchp

00:1d.0 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#1 (rev 01) (prog-if 00 [UHCI])
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin A routed to IRQ 20
 Region 4: I/O ports at 3000 [size=32]
 Kernel driver in use: uhci_hcd

00:1d.1 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#2 (rev 01) (prog-if 00 [UHCI])
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin B routed to IRQ 18
 Region 4: I/O ports at 3020 [size=32]
 Kernel driver in use: uhci_hcd

00:1d.2 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#3 (rev 01) (prog-if 00 [UHCI])
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin C routed to IRQ 21
 Region 4: I/O ports at 3040 [size=32]
 Kernel driver in use: uhci_hcd

00:1d.3 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#4 (rev 01) (prog-if 00 [UHCI])
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin D routed to IRQ 22
 Region 4: I/O ports at 3060 [size=32]
 Kernel driver in use: uhci_hcd

00:1d.7 USB Controller: Intel Corporation N10/ICH 7 Family USB2 EHCI Controller
(rev 01) (prog-if 20 [EHCI])
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin A routed to IRQ 20
 Region 0: Memory at c2504000 (32-bit, non-prefetchable) [size=1K]
 Capabilities: <access denied>
 Kernel driver in use: ehci_hcd

00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev e1) (prog-if 01
[Subtractive decode])
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Bus: primary=00, secondary=05, subordinate=05, sec-latency=32
 I/O behind bridge: 0000f000-00000fff
 Memory behind bridge: fff00000-000fffff
 Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
 Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort+ <SERR- <PERR-
 BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
  PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
 Capabilities: <access denied>

00:1f.0 ISA bridge: Intel Corporation 82801GB/GR (ICH7 Family) LPC Interface
Bridge (rev 01)
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR+ FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Capabilities: <access denied>
 Kernel modules: leds-ss4200, iTCO_wdt, intel-rng

00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Controller
(rev 01) (prog-if 8a [Master SecP PriP])
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin A routed to IRQ 17
 Region 0: I/O ports at 01f0 [size=8]
 Region 1: I/O ports at 03f4 [size=1]
 Region 2: I/O ports at 0170 [size=8]
 Region 3: I/O ports at 0374 [size=1]
 Region 4: I/O ports at 30a0 [size=16]
 Kernel driver in use: ata_piix
 Kernel modules: ata_generic, pata_acpi

00:1f.2 RAID bus controller: Intel Corporation 82801GR/GH (ICH7 Family) SATA
RAID Controller (rev 01)
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx+
 Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0
 Interrupt: pin B routed to IRQ 44
 Region 0: I/O ports at 30d0 [size=8]
 Region 1: I/O ports at 30e8 [size=4]
 Region 2: I/O ports at 30d8 [size=8]
 Region 3: I/O ports at 30ec [size=4]
 Region 4: I/O ports at 30b0 [size=16]
 Region 5: Memory at c2504400 (32-bit, non-prefetchable) [size=1K]
 Capabilities: <access denied>
 Kernel driver in use: ahci

01:00.0 VGA compatible controller: nVidia Corporation GT218 [GeForce 310] (rev
a2) (prog-if 00 [VGA controller])
 Subsystem: Device 1b0a:9060
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Interrupt: pin A routed to IRQ 16
 Region 0: Memory at c5000000 (32-bit, non-prefetchable) [size=16M]
 Region 1: Memory at b0000000 (64-bit, prefetchable) [size=256M]
 Region 3: Memory at c0000000 (64-bit, prefetchable) [size=32M]
 Region 5: I/O ports at 2000 [size=128]
 [virtual] Expansion ROM at c2000000 [disabled] [size=512K]
 Capabilities: <access denied>
 Kernel driver in use: nouveau
 Kernel modules: nouveau, nvidiafb

01:00.1 Audio device: nVidia Corporation High Definition Audio Controller (rev
a1)
 Subsystem: Device 1b0a:9060
 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Interrupt: pin A routed to IRQ 16
 Region 0: Memory at c6200000 (32-bit, non-prefetchable) [size=16K]
 Capabilities: <access denied>
 Kernel driver in use: snd_hda_intel
 Kernel modules: snd-hda-intel

10:00.0 VGA compatible controller: nVidia Corporation GT218 [GeForce 310] (rev
a2) (prog-if 00 [VGA controller])
 Subsystem: Device 1b0a:9060
 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Interrupt: pin A routed to IRQ 16
 Region 0: Memory at c3000000 (32-bit, non-prefetchable) [size=16M]
 Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
 Region 3: Memory at e0000000 (64-bit, prefetchable) [size=32M]
 Region 5: I/O ports at 1000 [size=128]
 [virtual] Expansion ROM at e2000000 [disabled] [size=512K]
 Capabilities: <access denied>
 Kernel driver in use: nouveau
 Kernel modules: nouveau, nvidiafb

10:00.1 Audio device: nVidia Corporation High Definition Audio Controller (rev
a1)
 Subsystem: Device 1b0a:9060
 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx-
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Interrupt: pin A routed to IRQ 16
 Region 0: Memory at c4200000 (32-bit, non-prefetchable) [size=16K]
 Capabilities: <access denied>
 Kernel driver in use: snd_hda_intel
 Kernel modules: snd-hda-intel

3f:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5755 Gigabit
Ethernet PCI Express (rev 02)
 Subsystem: Hewlett-Packard Company Device 280c
 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping-
SERR- FastB2B- DisINTx+
 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
 Latency: 0, Cache Line Size: 64 bytes
 Interrupt: pin A routed to IRQ 46
 Region 0: Memory at c2400000 (64-bit, non-prefetchable) [size=64K]
 Expansion ROM at <ignored> [disabled]
 Capabilities: <access denied>
 Kernel driver in use: tg3
 Kernel modules: tg3

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
