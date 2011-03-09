From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: nouveaufb problems with NV18
Date: 9 Mar 2011 15:06:56 -0500
Message-ID: <20110309200656.23070.qmail@science.horizon.com>
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
Cc: linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

I have an NV18 (GeForce4 MX) connected via DVI to a 1920x1080 LCD,
and when I try to use the nouveau kernel driver, I get a crappy display.

Thanks in advance to anyone who can help.

I'm running a recent nouveau git (fa17f241 drm/nv50: fix thinko in vm fault)
merged with 2.6.38-rc8.

When the driver loads (it's compiled as a module, so this is after init
starts), the console shrinks to a 36x90 character box in the upper-left
corner of the display.

When the system is busy, the screen "flashes" to the right.
The console text appears half a screen to the right for a moment.
It's particularly annoying right after boot, but settles down once the
system goes quescent.

The problem is NOT associated with screen updates.  I can run "yes"
and see the problem very little.  hdparm -tT, however, makes the screen
almost unusable during *both* phases.

Watching during heavy activity, there's a "standard position" to the
right where the text tends to appear, but there's also lots of "tearing"
and it appears in multiple positions.  Still pretty recognizable as text,
though; it doesn't seem to change every scanline.

X is also screwed up; it fails to start with the messages:
[   214.714] (II) NOUVEAU(0): Opened GPU channel 1
[   214.715] (II) NOUVEAU(0): [DRI2] Setup complete
[   214.715] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[   214.716] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
[   214.716]
Fatal server error:
[   214.716] AddScreen/ScreenInit failed for driver 0

... but I figure that's a more advanced problem.

I've tried and been unhappy with the nouveau driver on this system in
the past (I remember it coming up but having lots of horizontal lines of
"snow" on the display), but Debian recently removed the nv driver that
worked fine for me from its X distribution, so I'm trying again a bit
harder this time.

It's a 2 GB Athlon system, small form factor with onboard video.
lspci -nn gives:

00:00.0 Host bridge [0600]: nVidia Corporation nForce2 IGP2 [10de:01e0] (rev a2)
00:00.1 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 1 [10de:01eb] (rev a2)
00:00.2 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 4 [10de:01ee] (rev a2)
00:00.3 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 3 [10de:01ed] (rev a2)
00:00.4 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 2 [10de:01ec] (rev a2)
00:00.5 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 5 [10de:01ef] (rev a2)
00:01.0 ISA bridge [0601]: nVidia Corporation nForce2 ISA Bridge [10de:0060] (rev a3)
00:01.1 SMBus [0c05]: nVidia Corporation nForce2 SMBus (MCP) [10de:0064] (rev a2)
00:02.0 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0067] (rev a3)
00:02.1 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0067] (rev a3)
00:02.2 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0068] (rev a3)
00:04.0 Ethernet controller [0200]: nVidia Corporation nForce2 Ethernet Controller [10de:0066] (rev a1)
00:05.0 Multimedia audio controller [0401]: nVidia Corporation nForce Audio Processing Unit [10de:006b] (rev a2)
00:06.0 Multimedia audio controller [0401]: nVidia Corporation nForce2 AC97 Audio Controler (MCP) [10de:006a] (rev a1)
00:08.0 PCI bridge [0604]: nVidia Corporation nForce2 External PCI Bridge [10de:006c] (rev a3)
00:09.0 IDE interface [0101]: nVidia Corporation nForce2 IDE [10de:0065] (rev a2)
00:0d.0 FireWire (IEEE 1394) [0c00]: nVidia Corporation nForce2 FireWire (IEEE 1394) Controller [10de:006e] (rev a3)
00:1e.0 PCI bridge [0604]: nVidia Corporation nForce2 AGP [10de:01e8] (rev a2)
01:06.0 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev 80)
01:06.1 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev 80)
04:00.0 VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX - nForce GPU] [10de:01f0] (rev a3)


Here's the full dmesg output, as requested.

[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.38-rc8+ ($USER@$HOST) (gcc version 4.5.2 (Debian 4.5.2-5) ) #22 Tue Mar 8 21:47:31 EST 2011
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
[    0.000000]  BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 000000007dff0000 (usable)
[    0.000000]  BIOS-e820: 000000007dff0000 - 000000007dff3000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007dff3000 - 000000007e000000 (ACPI data)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
[    0.000000] Notice: NX (Execute Disable) protection missing in CPU!
[    0.000000] DMI 2.2 present.
[    0.000000] DMI:    /FN41 , BIOS 6.00 PG 08/23/2004
[    0.000000] e820 update range: 0000000000000000 - 0000000000001000 (usable) ==> (reserved)
[    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
[    0.000000] last_pfn = 0x7dff0 max_arch_pfn = 0x100000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-AFFFF uncachable
[    0.000000]   B0000-BFFFF write-combining
[    0.000000]   C0000-C7FFF write-protect
[    0.000000]   C8000-FFFFF uncachable
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask F80000000 write-back
[    0.000000]   1 base 07E000000 mask FFE000000 uncachable
[    0.000000]   2 base 0E0000000 mask FFC000000 write-combining
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] initial memory mapped : 0 - 01800000
[    0.000000] init_memory_mapping: 0000000000000000-00000000377fe000
[    0.000000]  0000000000 - 0000400000 page 4k
[    0.000000]  0000400000 - 0037400000 page 2M
[    0.000000]  0037400000 - 00377fe000 page 4k
[    0.000000] kernel direct mapping tables up to 377fe000 @ 17fb000-1800000
[    0.000000] ACPI: RSDP 000f6e60 00014 (v00 Nvidia)
[    0.000000] ACPI: RSDT 7dff3000 0002C (v01 Nvidia AWRDACPI 42302E31 AWRD 00000000)
[    0.000000] ACPI: FACP 7dff3040 00074 (v01 Nvidia AWRDACPI 42302E31 AWRD 00000000)
[    0.000000] ACPI: DSDT 7dff30c0 04139 (v01 NVIDIA AWRDACPI 00001000 MSFT 0100000D)
[    0.000000] ACPI: FACS 7dff0000 00040
[    0.000000] ACPI: APIC 7dff7200 0005A (v01 Nvidia AWRDACPI 42302E31 AWRD 00000000)
[    0.000000] 1127MB HIGHMEM available.
[    0.000000] 887MB LOWMEM available.
[    0.000000]   mapped low ram: 0 - 377fe000
[    0.000000]   low ram: 0 - 377fe000
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000001 -> 0x00001000
[    0.000000]   Normal   0x00001000 -> 0x000377fe
[    0.000000]   HighMem  0x000377fe -> 0x0007dff0
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[2] active PFN ranges
[    0.000000]     0: 0x00000001 -> 0x000000a0
[    0.000000]     0: 0x00000100 -> 0x0007dff0
[    0.000000] On node 0 totalpages: 515983
[    0.000000] free_area_init_node: node 0, pgdat c13805c8, node_mem_map f683d020
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3967 pages, LIFO batch:0
[    0.000000]   Normal zone: 1744 pages used for memmap
[    0.000000]   Normal zone: 221486 pages, LIFO batch:31
[    0.000000]   HighMem zone: 2256 pages used for memmap
[    0.000000]   HighMem zone: 286498 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x4008
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 00000000000f0000
[    0.000000] PM: Registered nosave memory: 00000000000f0000 - 0000000000100000
[    0.000000] Allocating PCI resources starting at 7e000000 (gap: 7e000000:80c00000)
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 511951
[    0.000000] Kernel command line: auto BOOT_IMAGE=2.6 ro root=302
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Initializing CPU#0
[    0.000000] Initializing HighMem for node 0 (000377fe:0007dff0)
[    0.000000] Memory: 2042708k/2064320k available (2373k kernel code, 21224k reserved, 1230k data, 276k init, 1155016k highmem)
[    0.000000] virtual kernel memory layout:
[    0.000000]     fixmap  : 0xfffe4000 - 0xfffff000   ( 108 kB)
[    0.000000]     pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
[    0.000000]     vmalloc : 0xf7ffe000 - 0xff7fe000   ( 120 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf77fe000   ( 887 MB)
[    0.000000]       .init : 0xc1385000 - 0xc13ca000   ( 276 kB)
[    0.000000]       .data : 0xc12514bf - 0xc1384e40   (1230 kB)
[    0.000000]       .text : 0xc1000000 - 0xc12514bf   (2373 kB)
[    0.000000] Checking if this processor honours the WP bit even in supervisor mode...Ok.
[    0.000000] SLUB: Genslabs=15, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16
[    0.000000] CPU 0 irqstacks, hard=f6008000 soft=f600a000
[    0.000000] Console: colour VGA+ 80x50
[    0.000000] console [tty0] enabled
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 1469.907 MHz processor.
[    0.006670] Calibrating delay loop (skipped), value calculated using timer frequency.. 2940.30 BogoMIPS (lpj=4899690)
[    0.006745] pid_max: default: 32768 minimum: 301
[    0.006838] Mount-cache hash table entries: 512
[    0.007058] Initializing cgroup subsys blkio
[    0.010034] mce: CPU supports 4 MCE banks
[    0.010087] CPU: AMD Athlon(tm) XP 1700+ stepping 02
[    0.010275] ACPI: Core revision 20110112
[    0.014177] ACPI: setting ELCR to 0200 (from 1c28)
[    0.015007] Performance Events: AMD PMU driver.
[    0.015067] ... version:                0
[    0.015102] ... bit width:              48
[    0.015137] ... generic registers:      4
[    0.015172] ... value mask:             0000ffffffffffff
[    0.015208] ... max period:             00007fffffffffff
[    0.015245] ... fixed-purpose events:   0
[    0.015279] ... event mask:             000000000000000f
[    0.015470] NMI watchdog enabled, takes one hw-pmu counter.
[    0.015959] xor: automatically using best checksumming function: pIII_sse
[    0.030004]    pIII_sse  :  4164.000 MB/sec
[    0.030040] xor: using function: pIII_sse (4164.000 MB/sec)
[    0.030127] NET: Registered protocol family 16
[    0.030679] ACPI: bus type pci registered
[    0.066457] PCI: PCI BIOS revision 2.10 entry at 0xfb760, last bus=4
[    0.066497] PCI: Using configuration type 1 for base access
[    0.072331] bio: create slab <bio-0> at 0
[    0.126710] raid6: int32x1    514 MB/s
[    0.183333] raid6: int32x2    665 MB/s
[    0.240026] raid6: int32x4    496 MB/s
[    0.296792] raid6: int32x8    380 MB/s
[    0.353327] raid6: mmxx1     1243 MB/s
[    0.409983] raid6: mmxx2     2042 MB/s
[    0.466679] raid6: sse1x1    1151 MB/s
[    0.523334] raid6: sse1x2    1828 MB/s
[    0.523369] raid6: using algorithm sse1x2 (1828 MB/s)
[    0.525044] ACPI: EC: Look up EC in DSDT
[    0.529868] ACPI: Interpreter enabled
[    0.529910] ACPI: (supports S0 S1 S4 S5)
[    0.530068] ACPI: Using PIC for interrupt routing
[    0.541762] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.541933] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.542209] pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7] (ignored)
[    0.542215] pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff] (ignored)
[    0.542221] pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff] (ignored)
[    0.542227] pci_root PNP0A03:00: host bridge window [mem 0x000c0000-0x000dffff] (ignored)
[    0.542232] pci_root PNP0A03:00: host bridge window [mem 0x7e000000-0xfebfffff] (ignored)
[    0.542253] pci 0000:00:00.0: [10de:01e0] type 0 class 0x000600
[    0.542264] pci 0000:00:00.0: reg 10: [mem 0xe0000000-0xe3ffffff pref]
[    0.542312] pci 0000:00:00.1: [10de:01eb] type 0 class 0x000500
[    0.542353] pci 0000:00:00.2: [10de:01ee] type 0 class 0x000500
[    0.542394] pci 0000:00:00.3: [10de:01ed] type 0 class 0x000500
[    0.542432] pci 0000:00:00.4: [10de:01ec] type 0 class 0x000500
[    0.542473] pci 0000:00:00.5: [10de:01ef] type 0 class 0x000500
[    0.542519] pci 0000:00:01.0: [10de:0060] type 0 class 0x000601
[    0.542604] pci 0000:00:01.1: [10de:0064] type 0 class 0x000c05
[    0.542621] pci 0000:00:01.1: reg 10: [io  0xc400-0xc41f]
[    0.542679] pci 0000:00:01.1: PME# supported from D3hot D3cold
[    0.542685] pci 0000:00:01.1: PME# disabled
[    0.542711] pci 0000:00:02.0: [10de:0067] type 0 class 0x000c03
[    0.542727] pci 0000:00:02.0: reg 10: [mem 0xef080000-0xef080fff]
[    0.542784] pci 0000:00:02.0: supports D1 D2
[    0.542788] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.542794] pci 0000:00:02.0: PME# disabled
[    0.542815] pci 0000:00:02.1: [10de:0067] type 0 class 0x000c03
[    0.542831] pci 0000:00:02.1: reg 10: [mem 0xef083000-0xef083fff]
[    0.542888] pci 0000:00:02.1: supports D1 D2
[    0.542892] pci 0000:00:02.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.542898] pci 0000:00:02.1: PME# disabled
[    0.542919] pci 0000:00:02.2: [10de:0068] type 0 class 0x000c03
[    0.542938] pci 0000:00:02.2: reg 10: [mem 0xef086000-0xef0860ff]
[    0.543001] pci 0000:00:02.2: supports D1 D2
[    0.543005] pci 0000:00:02.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543011] pci 0000:00:02.2: PME# disabled
[    0.543038] pci 0000:00:04.0: [10de:0066] type 0 class 0x000200
[    0.543055] pci 0000:00:04.0: reg 10: [mem 0xef087000-0xef087fff]
[    0.543066] pci 0000:00:04.0: reg 14: [io  0xb000-0xb007]
[    0.543116] pci 0000:00:04.0: supports D1 D2
[    0.543120] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543126] pci 0000:00:04.0: PME# disabled
[    0.543145] pci 0000:00:05.0: [10de:006b] type 0 class 0x000401
[    0.543162] pci 0000:00:05.0: reg 10: [mem 0xef000000-0xef07ffff]
[    0.543219] pci 0000:00:05.0: supports D1 D2
[    0.543238] pci 0000:00:06.0: [10de:006a] type 0 class 0x000401
[    0.543254] pci 0000:00:06.0: reg 10: [io  0xb400-0xb4ff]
[    0.543265] pci 0000:00:06.0: reg 14: [io  0xb800-0xb87f]
[    0.543276] pci 0000:00:06.0: reg 18: [mem 0xef081000-0xef081fff]
[    0.543350] pci 0000:00:06.0: supports D1 D2
[    0.543408] pci 0000:00:08.0: [10de:006c] type 1 class 0x000604
[    0.543452] pci 0000:00:09.0: [10de:0065] type 0 class 0x000101
[    0.543495] pci 0000:00:09.0: reg 20: [io  0xf000-0xf00f]
[    0.543545] pci 0000:00:0d.0: [10de:006e] type 0 class 0x000c00
[    0.543562] pci 0000:00:0d.0: reg 10: [mem 0xef084000-0xef0847ff]
[    0.543573] pci 0000:00:0d.0: reg 14: [mem 0xef085000-0xef08503f]
[    0.543624] pci 0000:00:0d.0: supports D1 D2
[    0.543628] pci 0000:00:0d.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543634] pci 0000:00:0d.0: PME# disabled
[    0.543668] pci 0000:00:1e.0: [10de:01e8] type 1 class 0x000604
[    0.543729] pci 0000:01:06.0: [1180:0476] type 2 class 0x000607
[    0.543751] pci 0000:01:06.0: reg 10: [mem 0xee000000-0xee000fff]
[    0.543774] pci 0000:01:06.0: supports D1 D2
[    0.543778] pci 0000:01:06.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543785] pci 0000:01:06.0: PME# disabled
[    0.543809] pci 0000:01:06.1: [1180:0476] type 2 class 0x000607
[    0.543831] pci 0000:01:06.1: reg 10: [mem 0xee005000-0xee005fff]
[    0.543853] pci 0000:01:06.1: supports D1 D2
[    0.543857] pci 0000:01:06.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543864] pci 0000:01:06.1: PME# disabled
[    0.543919] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.543961] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.543967] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.543975] pci 0000:00:08.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
[    0.544059] pci_bus 0000:03: [bus 03-06] partially hidden behind bridge 0000:01 [bus 01-03]
[    0.544135] pci 0000:04:00.0: [10de:01f0] type 0 class 0x000300
[    0.544153] pci 0000:04:00.0: reg 10: [mem 0xec000000-0xecffffff]
[    0.544163] pci 0000:04:00.0: reg 14: [mem 0xe4000000-0xe7ffffff pref]
[    0.544174] pci 0000:04:00.0: reg 18: [mem 0xe8000000-0xe807ffff pref]
[    0.544202] pci 0000:04:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
[    0.544254] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.544294] pci 0000:00:1e.0:   bridge window [io  0xf000-0x0000] (disabled)
[    0.544300] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.544306] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.544320] pci_bus 0000:00: on NUMA node 0
[    0.544326] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.544523] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.HUB0._PRT]
[    0.544594] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGPB._PRT]
[    0.587975] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.588338] ACPI: PCI Interrupt Link [LNK2] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.588697] ACPI: PCI Interrupt Link [LNK3] (IRQs *3 4 5 6 7 10 11 12 14 15)
[    0.589009] ACPI: PCI Interrupt Link [LNK4] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.589319] ACPI: PCI Interrupt Link [LNK5] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.589628] ACPI: PCI Interrupt Link [LUBA] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.590039] ACPI: PCI Interrupt Link [LUBB] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.590353] ACPI: PCI Interrupt Link [LMAC] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.590665] ACPI: PCI Interrupt Link [LAPU] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.590975] ACPI: PCI Interrupt Link [LACI] (IRQs 3 4 5 6 7 10 11 *12 14 15)
[    0.591284] ACPI: PCI Interrupt Link [LMCI] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.591638] ACPI: PCI Interrupt Link [LSMB] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.591994] ACPI: PCI Interrupt Link [LUB2] (IRQs 3 4 5 6 7 10 11 *12 14 15)
[    0.592305] ACPI: PCI Interrupt Link [LFIR] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.592613] ACPI: PCI Interrupt Link [L3CM] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.592967] ACPI: PCI Interrupt Link [LIDE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.593371] ACPI: PCI Interrupt Link [APC1] (IRQs *16), disabled.
[    0.593542] ACPI: PCI Interrupt Link [APC2] (IRQs *17), disabled.
[    0.593712] ACPI: PCI Interrupt Link [APC3] (IRQs *18)
[    0.593864] ACPI: PCI Interrupt Link [APC4] (IRQs *19)
[    0.594024] ACPI: PCI Interrupt Link [APCE] (IRQs *16)
[    0.594221] ACPI: PCI Interrupt Link [APCF] (IRQs 20 21 22) *0, disabled.
[    0.594484] ACPI: PCI Interrupt Link [APCG] (IRQs 20 21 22) *0
[    0.594727] ACPI: PCI Interrupt Link [APCH] (IRQs 20 21 22) *0
[    0.594969] ACPI: PCI Interrupt Link [APCI] (IRQs 20 21 22) *0
[    0.595225] ACPI: PCI Interrupt Link [APCJ] (IRQs 20 21 22) *0
[    0.595468] ACPI: PCI Interrupt Link [APCK] (IRQs 20 21 22) *0, disabled.
[    0.595690] ACPI: PCI Interrupt Link [APCS] (IRQs *23), disabled.
[    0.595899] ACPI: PCI Interrupt Link [APCL] (IRQs 20 21 22) *0
[    0.596150] ACPI: PCI Interrupt Link [APCM] (IRQs 20 21 22) *0
[    0.596395] ACPI: PCI Interrupt Link [AP3C] (IRQs 20 21 22) *0, disabled.
[    0.596683] ACPI: PCI Interrupt Link [APCZ] (IRQs 20 21 22) *0, disabled.
[    0.597150] vgaarb: device added: PCI:0000:04:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.597204] vgaarb: loaded
[    0.597503] SCSI subsystem initialized
[    0.597715] usbcore: registered new interface driver usbfs
[    0.597865] usbcore: registered new interface driver hub
[    0.597978] usbcore: registered new device driver usb
[    0.598376] Advanced Linux Sound Architecture Driver Version 1.0.23.
[    0.598474] PCI: Using ACPI for IRQ routing
[    0.598518] PCI: pci_cache_line_size set to 32 bytes
[    0.598603] reserve RAM buffer: 000000007dff0000 - 000000007fffffff 
[    0.598858] Switching to clocksource pit
[    0.599005] pnp: PnP ACPI init
[    0.599058] ACPI: bus type pnp registered
[    0.599462] pnp 00:00: [io  0x4000-0x407f]
[    0.599468] pnp 00:00: [io  0x4080-0x40ff]
[    0.599472] pnp 00:00: [io  0x4400-0x447f]
[    0.599476] pnp 00:00: [io  0x4480-0x44ff]
[    0.599480] pnp 00:00: [io  0x4200-0x427f]
[    0.599484] pnp 00:00: [io  0x4280-0x42ff]
[    0.599609] system 00:00: [io  0x4000-0x407f] has been reserved
[    0.599651] system 00:00: [io  0x4080-0x40ff] has been reserved
[    0.599691] system 00:00: [io  0x4400-0x447f] has been reserved
[    0.599730] system 00:00: [io  0x4480-0x44ff] has been reserved
[    0.599770] system 00:00: [io  0x4200-0x427f] has been reserved
[    0.599809] system 00:00: [io  0x4280-0x42ff] has been reserved
[    0.599850] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.599872] pnp 00:01: [io  0x5000-0x503f]
[    0.599877] pnp 00:01: [io  0x5100-0x513f]
[    0.599954] system 00:01: [io  0x5000-0x503f] has been reserved
[    0.599954] system 00:01: [io  0x5100-0x513f] has been reserved
[    0.599954] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.599954] system 00:02: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.599954] pnp 00:03: [bus 00-ff]
[    0.599954] pnp 00:03: [io  0x0cf8-0x0cff]
[    0.599954] pnp 00:03: [io  0x0000-0x0cf7 window]
[    0.599954] pnp 00:03: [io  0x0d00-0xffff window]
[    0.599954] pnp 00:03: [mem 0x000a0000-0x000bffff window]
[    0.599954] pnp 00:03: [mem 0x000c0000-0x000dffff window]
[    0.599954] pnp 00:03: [mem 0x7e000000-0xfebfffff window]
[    0.599954] pnp 00:03: Plug and Play ACPI device, IDs PNP0a03 (active)
[    0.599954] pnp 00:04: [io  0x0010-0x001f]
[    0.599954] pnp 00:04: [io  0x0022-0x003f]
[    0.599954] pnp 00:04: [io  0x0044-0x005f]
[    0.599954] pnp 00:04: [io  0x0062-0x0063]
[    0.599954] pnp 00:04: [io  0x0065-0x006f]
[    0.599954] pnp 00:04: [io  0x0074-0x007f]
[    0.599954] pnp 00:04: [io  0x0091-0x0093]
[    0.599954] pnp 00:04: [io  0x00a2-0x00bf]
[    0.599954] pnp 00:04: [io  0x00e0-0x00ef]
[    0.599954] pnp 00:04: [io  0x04d0-0x04d1]
[    0.599954] pnp 00:04: [io  0x0800-0x0805]
[    0.599954] pnp 00:04: [io  0x0290-0x0297]
[    0.599954] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.601173] system 00:04: [io  0x0800-0x0805] has been reserved
[    0.601214] system 00:04: [io  0x0290-0x0297] has been reserved
[    0.601255] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.601281] pnp 00:05: [dma 4]
[    0.601285] pnp 00:05: [io  0x0000-0x000f]
[    0.601289] pnp 00:05: [io  0x0080-0x0090]
[    0.601293] pnp 00:05: [io  0x0094-0x009f]
[    0.601297] pnp 00:05: [io  0x00c0-0x00df]
[    0.601406] pnp 00:05: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.601430] pnp 00:06: [io  0x0070-0x0073]
[    0.601436] pnp 00:06: [irq 8]
[    0.601534] pnp 00:06: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.601555] pnp 00:07: [io  0x0061]
[    0.601653] pnp 00:07: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.601674] pnp 00:08: [io  0x00f0-0x00ff]
[    0.601679] pnp 00:08: [irq 13]
[    0.601779] pnp 00:08: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.602041] pnp 00:09: [io  0x03f0-0x03f5]
[    0.602046] pnp 00:09: [io  0x03f7]
[    0.602050] pnp 00:09: [irq 6]
[    0.602054] pnp 00:09: [dma 2]
[    0.602184] pnp 00:09: Plug and Play ACPI device, IDs PNP0700 (active)
[    0.602514] pnp 00:0a: [io  0x03f8-0x03ff]
[    0.602519] pnp 00:0a: [irq 4]
[    0.602672] pnp 00:0a: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.603474] pnp 00:0b: [io  0x0378-0x037f]
[    0.603479] pnp 00:0b: [io  0x0778-0x077b]
[    0.603484] pnp 00:0b: [irq 7]
[    0.603488] pnp 00:0b: [dma 3]
[    0.603658] pnp 00:0b: Plug and Play ACPI device, IDs PNP0401 (active)
[    0.603753] pnp: PnP ACPI: found 12 devices
[    0.603791] ACPI: ACPI bus type pnp unregistered
[    0.644477] Switching to clocksource acpi_pm
[    0.644594] pci 0000:00:08.0: BAR 9: assigned [mem 0x80000000-0x87ffffff pref]
[    0.644650] pci 0000:01:06.0: BAR 9: assigned [mem 0x80000000-0x83ffffff pref]
[    0.644703] pci 0000:01:06.0: BAR 10: can't assign mem (size 0x4000000)
[    0.644745] pci 0000:01:06.1: BAR 9: assigned [mem 0x84000000-0x87ffffff pref]
[    0.644797] pci 0000:01:06.1: BAR 10: can't assign mem (size 0x4000000)
[    0.644838] pci 0000:01:06.0: BAR 7: assigned [io  0x9000-0x90ff]
[    0.644878] pci 0000:01:06.0: BAR 8: assigned [io  0x9400-0x94ff]
[    0.644918] pci 0000:01:06.1: BAR 7: assigned [io  0x9800-0x98ff]
[    0.644958] pci 0000:01:06.1: BAR 8: assigned [io  0x9c00-0x9cff]
[    0.644997] pci 0000:01:06.0: CardBus bridge to [bus 02-02]
[    0.645036] pci 0000:01:06.0:   bridge window [io  0x9000-0x90ff]
[    0.645078] pci 0000:01:06.0:   bridge window [io  0x9400-0x94ff]
[    0.645120] pci 0000:01:06.0:   bridge window [mem 0x80000000-0x83ffffff pref]
[    0.645174] pci 0000:01:06.1: CardBus bridge to [bus 03-06]
[    0.645212] pci 0000:01:06.1:   bridge window [io  0x9800-0x98ff]
[    0.645254] pci 0000:01:06.1:   bridge window [io  0x9c00-0x9cff]
[    0.645296] pci 0000:01:06.1:   bridge window [mem 0x84000000-0x87ffffff pref]
[    0.645350] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.645389] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.645431] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.645474] pci 0000:00:08.0:   bridge window [mem 0x80000000-0x87ffffff pref]
[    0.645531] pci 0000:04:00.0: BAR 6: assigned [mem 0xe8080000-0xe809ffff pref]
[    0.645583] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.645620] pci 0000:00:1e.0:   bridge window [io  disabled]
[    0.645661] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.645703] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.645768] pci 0000:00:08.0: setting latency timer to 64
[    0.645980] ACPI: PCI Interrupt Link [LNK3] enabled at IRQ 3
[    0.646020] PCI: setting IRQ 3 as level-triggered
[    0.646029] pci 0000:01:06.0: PCI INT A -> Link[LNK3] -> GSI 3 (level, low) -> IRQ 3
[    0.646192] ACPI: PCI Interrupt Link [LNK4] enabled at IRQ 11
[    0.646231] PCI: setting IRQ 11 as level-triggered
[    0.646239] pci 0000:01:06.1: PCI INT B -> Link[LNK4] -> GSI 11 (level, low) -> IRQ 11
[    0.646300] pci_bus 0000:00: resource 0 [io  0x0000-0xffff]
[    0.646306] pci_bus 0000:00: resource 1 [mem 0x00000000-0xffffffff]
[    0.646311] pci_bus 0000:01: resource 0 [io  0x9000-0xafff]
[    0.646316] pci_bus 0000:01: resource 1 [mem 0xee000000-0xeeffffff]
[    0.646321] pci_bus 0000:01: resource 2 [mem 0x80000000-0x87ffffff pref]
[    0.646326] pci_bus 0000:02: resource 0 [io  0x9000-0x90ff]
[    0.646330] pci_bus 0000:02: resource 1 [io  0x9400-0x94ff]
[    0.646335] pci_bus 0000:02: resource 2 [mem 0x80000000-0x83ffffff pref]
[    0.646340] pci_bus 0000:03: resource 0 [io  0x9800-0x98ff]
[    0.646344] pci_bus 0000:03: resource 1 [io  0x9c00-0x9cff]
[    0.646349] pci_bus 0000:03: resource 2 [mem 0x84000000-0x87ffffff pref]
[    0.646354] pci_bus 0000:04: resource 1 [mem 0xec000000-0xedffffff]
[    0.646359] pci_bus 0000:04: resource 2 [mem 0xe4000000-0xebffffff pref]
[    0.646424] NET: Registered protocol family 2
[    0.646538] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.647071] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.647735] Switched to NOHz mode on CPU #0
[    0.648782] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
[    0.649304] TCP: Hash tables configured (established 131072 bind 65536)
[    0.649344] TCP reno registered
[    0.649381] UDP hash table entries: 512 (order: 1, 8192 bytes)
[    0.649432] UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
[    0.649674] NET: Registered protocol family 1
[    0.680078] pci 0000:04:00.0: Boot video device
[    0.680084] PCI: CLS 0 bytes, default 32
[    0.680912] Scanning for low memory corruption every 60 seconds
[    0.681858] highmem bounce pool size: 64 pages
[    0.681902] HugeTLB registered 4 MB page size, pre-allocated 0 pages
[    0.688597] msgmni has been set to 1733
[    0.688935] alg: No test for stdrng (krng)
[    0.688983] io scheduler noop registered
[    0.689019] io scheduler deadline registered
[    0.689073] io scheduler cfq registered (default)
[    0.689568] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.963426] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.984674] 00:0a: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.985153] Linux agpgart interface v0.103
[    0.985221] agpgart: Detected NVIDIA nForce2 chipset
[    0.991051] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M @ 0xe0000000
[    0.991345] Floppy drive(s): fd0 is 1.44M
[    1.006848] FDC 0 is a post-1991 82077
[    1.008156] Uniform Multi-Platform E-IDE driver
[    1.008320] amd74xx 0000:00:09.0: UDMA133 controller
[    1.008361] amd74xx 0000:00:09.0: IDE controller (0x10de:0x0065 rev 0xa2)
[    1.008447] amd74xx 0000:00:09.0: BIOS didn't set cable bits correctly. Enabling workaround.
[    1.008503] amd74xx 0000:00:09.0: not 100% native mode: will probe irqs later
[    1.008548]     ide0: BM-DMA at 0xf000-0xf007
[    1.008591]     ide1: BM-DMA at 0xf008-0xf00f
[    1.008631] Probing IDE interface ide0...
[    1.283492] hda: ST3120022A, ATA DISK drive
[    1.683371] Refined TSC clocksource calibration: 1469.999 MHz.
[    1.683412] Switching to clocksource tsc
[    1.923441] hda: host max PIO5 wanted PIO255(auto-tune) selected PIO4
[    1.923657] hda: UDMA/100 mode selected
[    1.923924] Probing IDE interface ide1...
[    2.463460] ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
[    2.463547] ide1 at 0x170-0x177,0x376 on irq 15
[    2.463819] ide_generic: please use "probe_mask=0x3f" module parameter for probing all legacy ISA IDE ports
[    2.463875] ide-gd driver 1.18
[    2.463935] hda: max request size: 512KiB
[    2.473520] hda: 234441648 sectors (120034 MB) w/2048KiB Cache, CHS=16383/255/63
[    2.473760] hda: cache flushes supported
[    2.488251]  hda: hda1 hda2 hda3 hda4
[    2.488858] ide-cd driver 5.00
[    2.488971] forcedeth: Reverse Engineered nForce ethernet driver. Version 0.64.
[    2.489248] ACPI: PCI Interrupt Link [LMAC] enabled at IRQ 11
[    2.489293] forcedeth 0000:00:04.0: PCI INT A -> Link[LMAC] -> GSI 11 (level, low) -> IRQ 11
[    2.489350] forcedeth 0000:00:04.0: setting latency timer to 64
[    3.010760] forcedeth 0000:00:04.0: ifname eth0, PHY OUI 0x732 @ 1, addr aa:bb:cc:dd:ee:ff
[    3.010816] forcedeth 0000:00:04.0: timirq lnktim desc-v1
[    3.011110] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.011336] ACPI: PCI Interrupt Link [LUB2] enabled at IRQ 12
[    3.011376] PCI: setting IRQ 12 as level-triggered
[    3.011384] ehci_hcd 0000:00:02.2: PCI INT C -> Link[LUB2] -> GSI 12 (level, low) -> IRQ 12
[    3.011455] ehci_hcd 0000:00:02.2: setting latency timer to 64
[    3.011461] ehci_hcd 0000:00:02.2: EHCI Host Controller
[    3.011611] ehci_hcd 0000:00:02.2: new USB bus registered, assigned bus number 1
[    3.011713] ehci_hcd 0000:00:02.2: debug port 1
[    3.011757] ehci_hcd 0000:00:02.2: cache line size of 32 is not supported
[    3.011773] ehci_hcd 0000:00:02.2: irq 12, io mem 0xef086000
[    3.020024] ehci_hcd 0000:00:02.2: USB 2.0 started, EHCI 1.00
[    3.020115] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    3.020156] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.020207] usb usb1: Product: EHCI Host Controller
[    3.020244] usb usb1: Manufacturer: Linux 2.6.38-rc8+ ehci_hcd
[    3.020282] usb usb1: SerialNumber: 0000:00:02.2
[    3.020523] hub 1-0:1.0: USB hub found
[    3.020566] hub 1-0:1.0: 6 ports detected
[    3.020819] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.021044] ACPI: PCI Interrupt Link [LUBA] enabled at IRQ 10
[    3.021084] PCI: setting IRQ 10 as level-triggered
[    3.021093] ohci_hcd 0000:00:02.0: PCI INT A -> Link[LUBA] -> GSI 10 (level, low) -> IRQ 10
[    3.021164] ohci_hcd 0000:00:02.0: setting latency timer to 64
[    3.021169] ohci_hcd 0000:00:02.0: OHCI Host Controller
[    3.021324] ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 2
[    3.021400] ohci_hcd 0000:00:02.0: irq 10, io mem 0xef080000
[    3.075384] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    3.075426] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.075477] usb usb2: Product: OHCI Host Controller
[    3.075514] usb usb2: Manufacturer: Linux 2.6.38-rc8+ ohci_hcd
[    3.075552] usb usb2: SerialNumber: 0000:00:02.0
$HOST    3.075782] hub 2-0:1.0: USB hub found
[    3.075826] hub 2-0:1.0: 3 ports detected
[    3.076179] ACPI: PCI Interrupt Link [LUBB] enabled at IRQ 5
[    3.076218] PCI: setting IRQ 5 as level-triggered
[    3.076227] ohci_hcd 0000:00:02.1: PCI INT B -> Link[LUBB] -> GSI 5 (level, low) -> IRQ 5
[    3.076295] ohci_hcd 0000:00:02.1: setting latency timer to 64
[    3.076300] ohci_hcd 0000:00:02.1: OHCI Host Controller
[    3.076447] ohci_hcd 0000:00:02.1: new USB bus registered, assigned bus number 3
[    3.076522] ohci_hcd 0000:00:02.1: irq 5, io mem 0xef083000
[    3.128713] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    3.128755] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.128806] usb usb3: Product: OHCI Host Controller
[    3.128843] usb usb3: Manufacturer: Linux 2.6.38-rc8+ ohci_hcd
[    3.128881] usb usb3: SerialNumber: 0000:00:02.1
[    3.129122] hub 3-0:1.0: USB hub found
[    3.129166] hub 3-0:1.0: 3 ports detected
[    3.129502] usbcore: registered new interface driver libusual
[    3.129776] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    3.274501] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.276214] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.276648] mousedev: PS/2 mouse device common for all mice
[    3.276922] rtc_cmos 00:06: RTC can wake from S4
[    3.277080] rtc_cmos 00:06: rtc core: registered rtc_cmos as rtc0
[    3.277142] rtc0: alarms up to one year, y3k, 242 bytes nvram
[    3.277232] i2c /dev entries driver
[    3.330105] i2c i2c-0: nForce2 SMBus adapter at 0x5000
[    3.383427] i2c i2c-1: nForce2 SMBus adapter at 0x5100
[    3.383552] it87: Found IT8712F chip at 0x290, revision 5
[    3.383669] ACPI: resource it87 [io  0x0295-0x0296] conflicts with ACPI region SPIO [io 0x295-0x296]
[    3.383724] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    3.383828] md: raid1 personality registered for level 1
[    3.383868] md: raid10 personality registered for level 10
[    3.383905] md: raid6 personality registered for level 6
[    3.383942] md: raid5 personality registered for level 5
[    3.383979] md: raid4 personality registered for level 4
[    3.384017] cpuidle: using governor ladder
[    3.384052] cpuidle: using governor menu
[    3.385759] usbcore: registered new interface driver usbhid
[    3.385799] usbhid: USB HID core driver
[    3.386216] ACPI: PCI Interrupt Link [LACI] enabled at IRQ 12
[    3.386262] Intel ICH 0000:00:06.0: PCI INT A -> Link[LACI] -> GSI 12 (level, low) -> IRQ 12
[    3.386356] Intel ICH 0000:00:06.0: setting latency timer to 64
[    3.620024] usb 2-1: new full speed USB device using ohci_hcd and address 2
[    3.703359] intel8x0_measure_ac97_clock: measured 52159 usecs (2536 samples)
[    3.703401] intel8x0: clocking to 47387
[    3.704127] ALSA device list:
[    3.704163]   #0: NVidia nForce2 with ALC650E at irq 12
[    3.704691] TCP cubic registered
[    3.704728] NET: Registered protocol family 17
[    3.704775] Registering the dns_resolver key type
[    3.705614] registered taskstats version 1
[    3.706074] rtc_cmos 00:06: setting system clock to 2011-03-09 02:50:24 UTC (1299639024)
[    3.773354] usb 2-1: New USB device found, idVendor=0430, idProduct=100e
[    3.773397] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.776427] hub 2-1:1.0: USB hub found
[    3.779338] hub 2-1:1.0: 4 ports detected
[    4.036692] usb 2-2: new low speed USB device using ohci_hcd and address 3
[    4.123546] md: Waiting for all devices to be available before autodetect
[    4.123587] md: If you don't use raid, use raid=noautodetect
[    4.123889] md: Autodetecting RAID arrays.
[    4.123926] md: Scanned 0 and added 0 devices.
[    4.123961] md: autorun ...
[    4.123993] md: ... autorun DONE.
[    4.136736] EXT3-fs: barriers not enabled
[    4.150265] kjournald starting.  Commit interval 5 seconds
[    4.150328] EXT3-fs (hda2): mounted filesystem with ordered data mode
[    4.150377] VFS: Mounted root (ext3 filesystem) readonly on device 3:2.
[    4.150472] Freeing unused kernel memory: 276k freed
[    4.191326] usb 2-2: New USB device found, idVendor=1241, idProduct=1166
[    4.191371] usb 2-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.205887] input: HID 1241:1166 as /devices/pci0000:00/0000:00:02.0/usb2/2-2/2-2:1.0/input/input0
[    4.206145] generic-usb 0003:1241:1166.0001: input,hidraw0: USB HID v1.10 Mouse [HID 1241:1166] on usb-0000:00:02.0-2/input0
[    4.378310] usb 2-1.4: new full speed USB device using ohci_hcd and address 4
[    4.489306] usb 2-1.4: New USB device found, idVendor=0430, idProduct=00a2
[    4.489354] usb 2-1.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    4.489406] usb 2-1.4: Product: Sun USB Keyboard
[    4.498899] input: Sun USB Keyboard as /devices/pci0000:00/0000:00:02.0/usb2/2-1/2-1.4/2-1.4:1.0/input/input1
[    4.499092] generic-usb 0003:0430:00A2.0002: input,hidraw1: USB HID v1.10 Keyboard [Sun USB Keyboard] on usb-0000:00:02.0-1.4/input0
[    7.443767] yenta_cardbus 0000:01:06.0: CardBus bridge found [14ef:0202]
[    7.570355] yenta_cardbus 0000:01:06.0: ISA IRQ mask 0x0000, PCI irq 3
[    7.570404] yenta_cardbus 0000:01:06.0: Socket status: 30000410
[    7.570454] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [io  0x9000-0xafff]
[    7.570509] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [mem 0xee000000-0xeeffffff]
[    7.570565] pcmcia_socket pcmcia_socket0: cs: memory probe 0xee000000-0xeeffffff: excluding 0xee000000-0xee0fffff
[    7.570685] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [mem 0x80000000-0x87ffffff pref]
[    7.570740] pcmcia_socket pcmcia_socket0: cs: memory probe 0x80000000-0x87ffffff: excluding 0x80000000-0x87ffffff
[    7.571365] yenta_cardbus 0000:01:06.1: CardBus bridge found [14ef:0202]
[    7.577424] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2
[    7.578108] ACPI: Power Button [PWRB]
[    7.579148] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    7.579423] ACPI: Power Button [PWRF]
[    7.696916] yenta_cardbus 0000:01:06.1: ISA IRQ mask 0x0000, PCI irq 11
[    7.696966] yenta_cardbus 0000:01:06.1: Socket status: 30000410
[    7.697007] pci_bus 0000:03: Upper limit for fixing this bridge's parent bridge: #03
[    7.697069] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [io  0x9000-0xafff]
[    7.697124] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [mem 0xee000000-0xeeffffff]
[    7.697180] pcmcia_socket pcmcia_socket1: cs: memory probe 0xee000000-0xeeffffff: excluding 0xee000000-0xee0fffff
[    7.697300] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [mem 0x80000000-0x87ffffff pref]
[    7.697356] pcmcia_socket pcmcia_socket1: cs: memory probe 0x80000000-0x87ffffff: excluding 0x80000000-0x87ffffff
[    8.536355] [drm] Initialized drm 1.1.0 20060810
[    9.076711] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card inserted into slot 0
[    9.076778] pcmcia_socket pcmcia_socket0: cs: memory probe 0xee100000-0xeeffffff: clean.
[    9.082865] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 3)
[    9.084673] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0fffff: excluding 0xc0000-0xfffff
[    9.084863] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[    9.085045] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[    9.123847] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 10
[    9.123899] nouveau 0000:04:00.0: PCI INT A -> Link[LNK5] -> GSI 10 (level, low) -> IRQ 10
[    9.129897] [drm] nouveau 0000:04:00.0: Detected an NV10 generation card (0x01f000a5)
[    9.130763] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PRAMIN
[    9.175165] [drm] nouveau 0000:04:00.0: ... BIOS checksum invalid
[    9.175205] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PROM
[    9.175259] [drm] nouveau 0000:04:00.0: ... BIOS signature not found
[    9.175298] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PCIROM
[    9.175760] [drm] nouveau 0000:04:00.0: ... appears to be valid
[    9.176312] [drm] nouveau 0000:04:00.0: BMP BIOS found
[    9.176350] [drm] nouveau 0000:04:00.0: BMP version 5.21
[    9.176388] [drm] nouveau 0000:04:00.0: Bios version 04.1f.00.07
[    9.176428] [drm] nouveau 0000:04:00.0: Found Display Configuration Block version 2.0
[    9.176482] [drm] nouveau 0000:04:00.0: Raw DCB entry 0: 01000100 000088b8
[    9.176524] [drm] nouveau 0000:04:00.0: Raw DCB entry 1: 02010210 000088b8
[    9.176564] [drm] nouveau 0000:04:00.0: Raw DCB entry 2: 01120132 00000000
[    9.176604] [drm] nouveau 0000:04:00.0: Raw DCB entry 3: 01120232 00000000
[    9.176644] [drm] nouveau 0000:04:00.0: Raw DCB entry 4: 02010121 00000003
[    9.176703] [drm] nouveau 0000:04:00.0: Raw DCB entry 5: 02010221 00000003
[    9.176744] [drm] nouveau 0000:04:00.0: Merging DCB entries 2 and 3
[    9.176783] [drm] nouveau 0000:04:00.0: Merging DCB entries 4 and 5
[    9.177322] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xC284
[    9.177400] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xC4E0
[    9.177458] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xC2E7
[    9.192556] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xC632
[    9.192616] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xC47B
[    9.192670] [drm] nouveau 0000:04:00.0: Unknown memclock table version 0.
[    9.227437] [drm] nouveau 0000:04:00.0: 0 available performance level(s)
[    9.227507] [drm] nouveau 0000:04:00.0: c: memory 200454MHz core 199MHz
[    9.227628] [TTM] Zone  kernel: Available graphics memory: 443984 kiB.
[    9.227669] [TTM] Zone highmem: Available graphics memory: 1021492 kiB.
[    9.227708] [TTM] Initializing pool allocator.
[    9.227765] [drm] nouveau 0000:04:00.0: Detected 32MiB VRAM
[    9.228117] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[    9.228185] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[    9.228298] nouveau 0000:04:00.0: putting AGP V2 device into 4x mode
[    9.228334] [drm] nouveau 0000:04:00.0: 64 MiB GART (aperture)
[    9.228415] [drm] nouveau 0000:04:00.0: Saving VGA fonts
[    9.276657] [drm] nouveau 0000:04:00.0: Detected TMDS transmitter: sil164
[    9.281254] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    9.281297] [drm] No driver support for vblank timestamp query.
[    9.283437] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 0)
[    9.283491] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[    9.283535] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[    9.283580] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[    9.513366] [drm] nouveau 0000:04:00.0: Load detected on output B
[    9.514854] [drm] nouveau 0000:04:00.0: allocated 1920x1080 fb: 0x4a000, bo f63f9800
[   10.178216] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[   10.178223] [drm] nouveau 0000:04:00.0: Output DVI-D-1 is running on CRTC 0 using output A
[   10.200240] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on TV encoder (output 3)
[   10.200249] [drm] nouveau 0000:04:00.0: Output TV-1 is running on CRTC 1 using output B
[   10.201105] Console: switching to colour frame buffer device 90x36
[   10.205458] fb0: nouveaufb frame buffer device
[   10.205461] drm: registered panic notifier
[   10.206666] [drm] Initialized nouveau 0.0.16 20090420 for 0000:04:00.0 on minor 0
[   10.683364] pcmcia_socket pcmcia_socket1: pccard: PCMCIA card inserted into slot 1
[   10.683872] pcmcia_socket pcmcia_socket1: cs: memory probe 0xee100000-0xeeffffff: excluding 0xee100000-0xee1effff
[   10.690439] pcmcia_socket pcmcia_socket1: cs: memory probe 0x0c0000-0x0fffff: excluding 0xc0000-0xfffff
[   10.692000] pcmcia_socket pcmcia_socket1: cs: memory probe 0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[   10.693091] pcmcia_socket pcmcia_socket1: cs: memory probe 0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[   10.701327] 
[   10.702269] pcmcia 1.0: pcmcia: registering new device pcmcia1.0 (IRQ: 11)
[   12.972003] Adding 1951860k swap on /dev/hda1.  Priority:-1 extents:1 across:1951860k 
[   13.225707] EXT3-fs (hda2): using internal journal
[   13.544190] loop: module loaded
[   14.097220] fuse init (API version 7.16)
[   14.192652] EXT3-fs: barriers not enabled
[   14.200535] kjournald starting.  Commit interval 5 seconds
[   14.201183] EXT3-fs (hda3): using internal journal
[   14.201618] EXT3-fs (hda3): mounted filesystem with ordered data mode
[   37.166760] [drm] nouveau 0000:04:00.0: Load detected on output B
[   37.426696] [drm] nouveau 0000:04:00.0: Load detected on output B
[   38.056689] [drm] nouveau 0000:04:00.0: Load detected on output B
[   38.266697] [drm] nouveau 0000:04:00.0: Load detected on output B
[   38.590029] [drm] nouveau 0000:04:00.0: Load detected on output B
[   38.806683] [drm] nouveau 0000:04:00.0: Load detected on output B
[   39.066683] [drm] nouveau 0000:04:00.0: Load detected on output B
[   39.270016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   39.533349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   39.736682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   39.996683] [drm] nouveau 0000:04:00.0: Load detected on output B
[   40.200016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   40.473349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   40.713350] [drm] nouveau 0000:04:00.0: Load detected on output B
[   41.020018] [drm] nouveau 0000:04:00.0: Load detected on output B
[   41.223350] [drm] nouveau 0000:04:00.0: Load detected on output B
[   41.483349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   41.686685] [drm] nouveau 0000:04:00.0: Load detected on output B
[   41.953355] [drm] nouveau 0000:04:00.0: Load detected on output B
[   42.156682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   42.416682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   42.620015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   42.880015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   43.083349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   43.346683] [drm] nouveau 0000:04:00.0: Load detected on output B
[   43.550021] [drm] nouveau 0000:04:00.0: Load detected on output B
[   43.813348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   44.016687] [drm] nouveau 0000:04:00.0: Load detected on output B
[   44.276682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   44.480015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   44.740015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   44.943348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   45.203349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   45.420016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   45.680015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   45.883350] [drm] nouveau 0000:04:00.0: Load detected on output B
[   46.143348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   46.346682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   46.606682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   46.810017] [drm] nouveau 0000:04:00.0: Load detected on output B
[   47.070016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   47.273349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   47.533349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   47.736682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   47.996682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   48.200015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   48.463348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   48.666682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   48.926682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   49.130015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   49.390015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   49.593348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   49.853348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   50.056682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   50.330015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   50.540015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   50.800015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   51.003352] [drm] nouveau 0000:04:00.0: Load detected on output B
[   51.263348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   51.470015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   51.730015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   51.933348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   52.193348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   52.396681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   52.656682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   52.860014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   53.120015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   53.323348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   53.583348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   53.786681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   54.046681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   54.250021] [drm] nouveau 0000:04:00.0: Load detected on output B
[   54.510016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   54.713348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   54.973349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   55.176681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   55.446681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   55.650015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   55.910015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   56.113348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   56.373348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   56.576681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   56.836682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   57.040015] [drm] nouveau 0000:04:00.0: Load detected on output B
[   57.303348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   57.506681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   57.766681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   57.970017] [drm] nouveau 0000:04:00.0: Load detected on output B
[   58.230014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   58.433348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   58.693348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   58.896681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   59.156681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   59.360024] [drm] nouveau 0000:04:00.0: Load detected on output B
[   59.620014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   59.823347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   60.083348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   60.286680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   60.560014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   60.763347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   61.023348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   61.226681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   61.486680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   61.690016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   61.950014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   62.153347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   62.413348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   62.616680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   62.876681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   63.080014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   63.340014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   63.543347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   63.803347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   64.006681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   64.266680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   64.470013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   64.730013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   64.933347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   65.193347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   65.396680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   65.656681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   65.860013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   66.120013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   66.323346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   66.583346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   66.786680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   67.046680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   67.250012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   67.510013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   67.713346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   67.973348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   68.176680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   68.436680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   68.640013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   68.900013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   69.103345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   69.363347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   69.566680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   69.826679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   70.030013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   70.290013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   70.500018] [drm] nouveau 0000:04:00.0: Load detected on output B
[   70.760013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   70.963346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   71.223347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   71.426680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   71.686682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   71.890012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   72.150013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   72.353346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   72.613346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   72.816679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   73.076680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   73.280012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   73.540016] [drm] nouveau 0000:04:00.0: Load detected on output B
[   73.743346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   74.003349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   74.206705] [drm] nouveau 0000:04:00.0: Load detected on output B
[   74.466679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   74.670014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   74.930013] [drm] nouveau 0000:04:00.0: Load detected on output B
[   75.133346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   75.393351] [drm] nouveau 0000:04:00.0: Load detected on output B
[   75.606680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   75.866678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   76.070012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   76.330012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   76.533355] [drm] nouveau 0000:04:00.0: Load detected on output B
[   76.793346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   76.996681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   77.260012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   77.463345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   77.723346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   77.926680] [drm] nouveau 0000:04:00.0: Load detected on output B
[   78.186682] [drm] nouveau 0000:04:00.0: Load detected on output B
[   78.390012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   78.650012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   78.853345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   79.113345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   79.316678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   79.576679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   79.780011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   80.040012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   80.243346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   80.503346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   80.723344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   80.983346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   81.186681] [drm] nouveau 0000:04:00.0: Load detected on output B
[   81.446679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   81.650012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   81.910012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   82.113348] [drm] nouveau 0000:04:00.0: Load detected on output B
[   82.373345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   82.580011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   82.840012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   83.043345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   83.303346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   83.506678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   83.766679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   83.970012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   84.230012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   84.433345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   84.693346] [drm] nouveau 0000:04:00.0: Load detected on output B
[   84.896677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   85.156678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   85.360011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   85.633345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   85.836678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   86.096678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   86.300011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   86.560012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   86.763344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   87.023347] [drm] nouveau 0000:04:00.0: Load detected on output B
[   87.226678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   87.486678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   87.690014] [drm] nouveau 0000:04:00.0: Load detected on output B
[   87.950012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   88.153344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   88.413345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   88.616678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   88.876678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   89.080012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   89.340012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   89.543349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   89.803345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   90.006679] [drm] nouveau 0000:04:00.0: Load detected on output B
[   90.266678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   90.470010] [drm] nouveau 0000:04:00.0: Load detected on output B
[   90.750012] [drm] nouveau 0000:04:00.0: Load detected on output B
[   90.953343] [drm] nouveau 0000:04:00.0: Load detected on output B
[   91.213349] [drm] nouveau 0000:04:00.0: Load detected on output B
[   91.416678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   91.676678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   91.880010] [drm] nouveau 0000:04:00.0: Load detected on output B
[   92.140011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   92.343344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   92.603344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   92.806677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   93.066678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   93.270020] [drm] nouveau 0000:04:00.0: Load detected on output B
[   93.530011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   93.733344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   93.993344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   94.196677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   94.456677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   94.660010] [drm] nouveau 0000:04:00.0: Load detected on output B
[   94.920010] [drm] nouveau 0000:04:00.0: Load detected on output B
[   95.123344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   95.383344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   95.586677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   95.850011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   96.053344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   96.313345] [drm] nouveau 0000:04:00.0: Load detected on output B
[   96.516676] [drm] nouveau 0000:04:00.0: Load detected on output B
[   96.776677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   96.980010] [drm] nouveau 0000:04:00.0: Load detected on output B
[   97.240011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   97.443344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   97.703344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   97.906676] [drm] nouveau 0000:04:00.0: Load detected on output B
[   98.166677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   98.370010] [drm] nouveau 0000:04:00.0: Load detected on output B
[   98.630011] [drm] nouveau 0000:04:00.0: Load detected on output B
[   98.833344] [drm] nouveau 0000:04:00.0: Load detected on output B
[   99.093343] [drm] nouveau 0000:04:00.0: Load detected on output B
[   99.296677] [drm] nouveau 0000:04:00.0: Load detected on output B
[   99.556678] [drm] nouveau 0000:04:00.0: Load detected on output B
[   99.760010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  100.020014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  100.223344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  100.483344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  100.703344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  100.963344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  101.166676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  101.430010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  101.633350] [drm] nouveau 0000:04:00.0: Load detected on output B
[  101.893343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  102.096677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  102.356677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  102.560010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  102.820010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  103.023347] [drm] nouveau 0000:04:00.0: Load detected on output B
[  103.283346] [drm] nouveau 0000:04:00.0: Load detected on output B
[  103.486676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  103.746677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  103.950013] [drm] nouveau 0000:04:00.0: Load detected on output B
[  104.210014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  104.413342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  104.673344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  104.876679] [drm] nouveau 0000:04:00.0: Load detected on output B
[  105.136676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  105.340010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  105.600010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  105.813343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  106.073343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  106.276677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  106.536676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  106.740010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  107.000010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  107.203343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  107.463343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  107.666676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  107.926676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  108.130009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  108.390010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  108.593342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  108.853343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  109.056676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  109.316676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  109.520009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  109.780010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  109.983342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  110.246677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  110.450009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  110.730010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  110.933342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  111.193343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  111.396676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  111.656676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  111.860008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  112.120009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  112.323342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  112.583342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  112.786676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  113.046676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  113.250014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  113.513342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  113.716675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  113.976676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  114.180010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  114.440009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  114.643342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  114.903342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  115.106675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  115.366676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  115.570010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  115.840009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  116.043343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  116.303342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  116.506675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  116.766676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  116.970008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  117.230009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  117.433341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  117.693343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  117.896677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  118.156676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  118.360009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  118.620008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  118.823342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  119.083341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  119.286675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  119.546676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  119.750008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  120.010007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  120.213346] [drm] nouveau 0000:04:00.0: Load detected on output B
[  120.473342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  120.683347] [drm] nouveau 0000:04:00.0: Load detected on output B
[  120.946675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  121.150008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  121.410008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  121.613342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  121.873341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  122.076675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  122.336675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  122.540008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  122.800008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  123.003343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  123.263346] [drm] nouveau 0000:04:00.0: Load detected on output B
[  123.466675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  123.726675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  123.930007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  124.190011] [drm] nouveau 0000:04:00.0: Load detected on output B
[  124.393341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  124.653344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  124.856674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  125.116675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  125.320008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  125.580008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  125.793342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  126.053341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  126.256677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  126.516675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  126.720008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  126.980009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  127.183348] [drm] nouveau 0000:04:00.0: Load detected on output B
[  127.443341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  127.646674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  127.906677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  128.110007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  128.370007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  128.573341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  128.833341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  129.036674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  129.296675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  129.500006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  129.760007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  129.963340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  130.223343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  130.426674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  130.686677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  130.916675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  131.176674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  131.380008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  131.640008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  131.843340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  132.103341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  132.306674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  132.566681] [drm] nouveau 0000:04:00.0: Load detected on output B
[  132.770007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  133.030011] [drm] nouveau 0000:04:00.0: Load detected on output B
[  133.233340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  133.493341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  133.696673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  133.956674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  134.160007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  134.420007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  134.623341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  134.883343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  135.086674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  135.346674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  135.550006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  135.823341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  136.026674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  136.286674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  136.490006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  136.750008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  136.953340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  137.213344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  137.416673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  137.676674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  137.880006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  138.140007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  138.343341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  138.603341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  138.806673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  139.066673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  139.270007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  139.530007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  139.733340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  139.993341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  140.196674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  140.456673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  140.660007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  140.943390] [drm] nouveau 0000:04:00.0: Load detected on output B
[  141.146675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  141.406672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  141.610006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  141.870006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  142.073342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  142.333340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  142.536673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  142.796674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  143.000008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  143.263340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  143.466672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  143.726673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  143.930006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  144.190010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  144.393340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  144.656672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  144.860006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  145.120007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  145.323340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  145.583342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  145.786672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  146.060006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  146.263339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  146.523341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  146.726673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  146.986673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  147.190009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  147.450006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  147.653339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  147.913339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  148.116673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  148.376673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  148.580011] [drm] nouveau 0000:04:00.0: Load detected on output B
[  148.840006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  149.043339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  149.303339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  149.506672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  149.766672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  149.970005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  150.230006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  150.433339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  150.693339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  150.913340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  151.173339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  151.376672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  151.636672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  151.840005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  152.100006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  152.303339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  152.563339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  152.766671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  153.026673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  153.230007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  153.490006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  153.693339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  153.953342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  154.156672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  154.416672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  154.620006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  154.880005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  155.083339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  155.343339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  155.546671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  155.806672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  156.020005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  156.280005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  156.483338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  156.743338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  156.946672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  157.206678] [drm] nouveau 0000:04:00.0: Load detected on output B
[  157.410005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  157.670006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  157.873338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  158.133338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  158.336672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  158.596672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  158.800004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  159.060009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  159.263338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  159.523339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  159.726671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  159.986671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  160.190008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  160.450005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  160.653338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  160.940005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  161.143339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  161.403338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  161.606671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  161.866672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  162.070005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  162.330005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  162.533337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  162.793338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  162.996670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  163.256671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  163.460004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  163.720004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  163.923337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  164.183345] [drm] nouveau 0000:04:00.0: Load detected on output B
[  164.386670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  164.646670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  164.850004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  165.110004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  165.313338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  165.573337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  165.776671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  166.050004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  166.253337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  166.513337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  166.716670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  166.976670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  167.180003] [drm] nouveau 0000:04:00.0: Load detected on output B
[  167.440004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  167.643337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  167.903338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  168.106670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  168.366671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  168.570004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  168.830004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  169.033341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  169.293337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  169.496671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  169.756671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  169.960004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  170.220004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  170.423337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  170.683340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  170.893337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  171.166670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  171.370004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  171.630372] [drm] nouveau 0000:04:00.0: Load detected on output B
[  171.833337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  172.093337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  172.296671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  172.560004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  172.763337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  173.026734] [drm] nouveau 0000:04:00.0: Load detected on output B
[  173.230005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  173.490004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  173.693337] [drm] nouveau 0000:04:00.0: Load detected on output B
[  173.953344] [drm] nouveau 0000:04:00.0: Load detected on output B
[  174.156670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  174.416670] [drm] nouveau 0000:04:00.0: Load detected on output B
[  174.620016] [drm] nouveau 0000:04:00.0: Load detected on output B
[  174.896681] [drm] nouveau 0000:04:00.0: Load detected on output B
[  175.100009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  175.366676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  175.573343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  175.840007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  176.150008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  176.426680] [drm] nouveau 0000:04:00.0: Load detected on output B
[  176.636679] [drm] nouveau 0000:04:00.0: Load detected on output B
[  176.966735] [drm] nouveau 0000:04:00.0: Load detected on output B
[  177.273405] [drm] nouveau 0000:04:00.0: Load detected on output B
[  177.683361] [drm] nouveau 0000:04:00.0: Load detected on output B
[  177.940012] [drm] nouveau 0000:04:00.0: Load detected on output B
[  178.210009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  178.430014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  178.733345] [drm] nouveau 0000:04:00.0: Load detected on output B
[  178.970027] [drm] nouveau 0000:04:00.0: Load detected on output B
[  179.313350] [drm] nouveau 0000:04:00.0: Load detected on output B
[  179.550045] [drm] nouveau 0000:04:00.0: Load detected on output B
[  179.850015] [drm] nouveau 0000:04:00.0: Load detected on output B
[  180.083345] [drm] nouveau 0000:04:00.0: Load detected on output B
[  180.396681] [drm] nouveau 0000:04:00.0: Load detected on output B
[  180.626753] [drm] nouveau 0000:04:00.0: Load detected on output B
[  180.943371] [drm] nouveau 0000:04:00.0: Load detected on output B
[  181.233347] [drm] nouveau 0000:04:00.0: Load detected on output B
[  181.530021] [drm] nouveau 0000:04:00.0: Load detected on output B
[  181.766714] [drm] nouveau 0000:04:00.0: Load detected on output B
[  182.073386] [drm] nouveau 0000:04:00.0: Load detected on output B
[  182.295416] [drm] nouveau 0000:04:00.0: Load detected on output B
[  182.593349] [drm] nouveau 0000:04:00.0: Load detected on output B
[  182.810828] [drm] nouveau 0000:04:00.0: Load detected on output B
[  183.103343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  183.340012] [drm] nouveau 0000:04:00.0: Load detected on output B
[  183.630029] [drm] nouveau 0000:04:00.0: Load detected on output B
[  183.850063] [drm] nouveau 0000:04:00.0: Load detected on output B
[  184.146676] [drm] nouveau 0000:04:00.0: Load detected on output B
[  184.366748] [drm] nouveau 0000:04:00.0: Load detected on output B
[  184.663341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  184.886694] [drm] nouveau 0000:04:00.0: Load detected on output B
[  185.176674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  185.396683] [drm] nouveau 0000:04:00.0: Load detected on output B
[  185.686678] [drm] nouveau 0000:04:00.0: Load detected on output B
[  185.920013] [drm] nouveau 0000:04:00.0: Load detected on output B
[  186.236716] [drm] nouveau 0000:04:00.0: Load detected on output B
[  186.453346] [drm] nouveau 0000:04:00.0: Load detected on output B
[  186.750020] [drm] nouveau 0000:04:00.0: Load detected on output B
[  186.970013] [drm] nouveau 0000:04:00.0: Load detected on output B
[  187.260014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  187.490026] [drm] nouveau 0000:04:00.0: Load detected on output B
[  187.796728] [drm] nouveau 0000:04:00.0: Load detected on output B
[  188.023387] [drm] nouveau 0000:04:00.0: Load detected on output B
[  188.330014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  188.556678] [drm] nouveau 0000:04:00.0: Load detected on output B
[  188.870045] [drm] nouveau 0000:04:00.0: Load detected on output B
[  189.103345] [drm] nouveau 0000:04:00.0: Load detected on output B
[  189.406712] [drm] nouveau 0000:04:00.0: Load detected on output B
[  189.626743] [drm] nouveau 0000:04:00.0: Load detected on output B
[  189.920262] [drm] nouveau 0000:04:00.0: Load detected on output B
[  190.150055] [drm] nouveau 0000:04:00.0: Load detected on output B
[  190.466679] [drm] nouveau 0000:04:00.0: Load detected on output B
[  190.700020] [drm] nouveau 0000:04:00.0: Load detected on output B
[  190.980013] [drm] nouveau 0000:04:00.0: Load detected on output B
[  191.196807] [drm] nouveau 0000:04:00.0: Load detected on output B
[  191.510015] [drm] nouveau 0000:04:00.0: Load detected on output B
[  191.736674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  192.046674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  192.270061] [drm] nouveau 0000:04:00.0: Load detected on output B
[  192.563391] [drm] nouveau 0000:04:00.0: Load detected on output B
[  192.816721] [drm] nouveau 0000:04:00.0: Load detected on output B
[  193.120010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  193.360015] [drm] nouveau 0000:04:00.0: Load detected on output B
[  193.680070] [drm] nouveau 0000:04:00.0: Load detected on output B
[  193.923345] [drm] nouveau 0000:04:00.0: Load detected on output B
[  194.230017] [drm] nouveau 0000:04:00.0: Load detected on output B
[  194.460010] [drm] nouveau 0000:04:00.0: Load detected on output B
[  194.770029] [drm] nouveau 0000:04:00.0: Load detected on output B
[  195.013375] [drm] nouveau 0000:04:00.0: Load detected on output B
[  195.326683] [drm] nouveau 0000:04:00.0: Load detected on output B
[  195.576716] [drm] nouveau 0000:04:00.0: Load detected on output B
[  195.880012] [drm] nouveau 0000:04:00.0: Load detected on output B
[  196.170015] [drm] nouveau 0000:04:00.0: Load detected on output B
[  196.476672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  196.690009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  196.976672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  197.200009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  197.470007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  197.676674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  197.943343] [drm] nouveau 0000:04:00.0: Load detected on output B
[  198.153340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  198.433356] [drm] nouveau 0000:04:00.0: Load detected on output B
[  198.650005] [drm] nouveau 0000:04:00.0: Load detected on output B
[  198.923338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  199.130012] [drm] nouveau 0000:04:00.0: Load detected on output B
[  199.403339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  199.613338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  199.886677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  200.093372] [drm] nouveau 0000:04:00.0: Load detected on output B
[  200.370011] [drm] nouveau 0000:04:00.0: Load detected on output B
[  200.600014] [drm] nouveau 0000:04:00.0: Load detected on output B
[  200.880006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  201.096677] [drm] nouveau 0000:04:00.0: Load detected on output B
[  201.630004] [drm] nouveau 0000:04:00.0: Load detected on output B
[  201.840006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  202.113341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  202.326675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  202.600106] [drm] nouveau 0000:04:00.0: Load detected on output B
[  202.806673] [drm] nouveau 0000:04:00.0: Load detected on output B
[  203.080007] [drm] nouveau 0000:04:00.0: Load detected on output B
[  203.290006] [drm] nouveau 0000:04:00.0: Load detected on output B
[  203.563341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  203.770009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  204.043338] [drm] nouveau 0000:04:00.0: Load detected on output B
[  204.256671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  204.526679] [drm] nouveau 0000:04:00.0: Load detected on output B
[  204.750008] [drm] nouveau 0000:04:00.0: Load detected on output B
[  205.033712] [drm] nouveau 0000:04:00.0: Load detected on output B
[  205.250012] [drm] nouveau 0000:04:00.0: Load detected on output B
[  205.533341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  205.773347] [drm] nouveau 0000:04:00.0: Load detected on output B
[  206.100013] [drm] nouveau 0000:04:00.0: Load detected on output B
[  207.500009] [drm] nouveau 0000:04:00.0: Load detected on output B
[  207.773339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  207.983342] [drm] nouveau 0000:04:00.0: Load detected on output B
[  208.253341] [drm] nouveau 0000:04:00.0: Load detected on output B
[  208.460013] [drm] nouveau 0000:04:00.0: Load detected on output B
[  208.733351] [drm] nouveau 0000:04:00.0: Load detected on output B
[  208.936671] [drm] nouveau 0000:04:00.0: Load detected on output B
[  209.203340] [drm] nouveau 0000:04:00.0: Load detected on output B
[  209.406680] [drm] nouveau 0000:04:00.0: Load detected on output B
[  209.676672] [drm] nouveau 0000:04:00.0: Load detected on output B
[  209.883349] [drm] nouveau 0000:04:00.0: Load detected on output B
[  210.156674] [drm] nouveau 0000:04:00.0: Load detected on output B
[  210.363346] [drm] nouveau 0000:04:00.0: Load detected on output B
[  210.640015] [drm] nouveau 0000:04:00.0: Load detected on output B
[  210.843339] [drm] nouveau 0000:04:00.0: Load detected on output B
[  211.116675] [drm] nouveau 0000:04:00.0: Load detected on output B
[  214.710077] [drm] nouveau 0000:04:00.0: Load detected on output B
[ 2020.319903] [drm] nouveau 0000:04:00.0: Setting dpms mode 1 on tmds encoder (output 2)
[ 2020.329920] [drm] nouveau 0000:04:00.0: Setting dpms mode 1 on TV encoder (output 3)
[56527.565289] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[56527.575301] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on TV encoder (output 3)
