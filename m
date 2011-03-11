From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: 11 Mar 2011 10:27:18 -0500
Message-ID: <20110311152718.19243.qmail@science.horizon.com>
References: <000e0cd488aa1f9936049e26203c@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <000e0cd488aa1f9936049e26203c-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Thanks for the reply!  Sorry it took me a day to respond.

> Is there anything at all connected to the other output (referred to as TV-1  
> in your log)? You can try disabling TV detection with the tv_disable  
> nouveau.ko module parameter if a non-existent TV is somehow being detected.

No, nothing.  Adding the parameter (it's actually tv_disable=1; required
a couple of reboots since the module's loaded early and can't be unloaded)
produced a full-screen console (67x240), but with the same "flashing"
to the right on system activity.  (I don't get it on VC switch now, however!)

Also, the display (DVI-D) appears to be half a line low.  Tall characters
($ and ^) on the top line have their topmost row of pixels replicated into a
vertical stripe, and the bottom row of text is only half visible.
(Actually a little more than half; both bars of = are visible.)

X still refuses to start; messages attached.

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
[    0.000000] Detected 1469.814 MHz processor.
[    0.006670] Calibrating delay loop (skipped), value calculated using timer frequency.. 2940.11 BogoMIPS (lpj=4899380)
[    0.006744] pid_max: default: 32768 minimum: 301
[    0.006837] Mount-cache hash table entries: 512
[    0.010164] Initializing cgroup subsys blkio
[    0.010246] mce: CPU supports 4 MCE banks
[    0.010299] CPU: AMD Athlon(tm) XP 1700+ stepping 02
[    0.010487] ACPI: Core revision 20110112
[    0.014391] ACPI: setting ELCR to 0200 (from 1c28)
[    0.015222] Performance Events: AMD PMU driver.
[    0.015282] ... version:                0
[    0.015317] ... bit width:              48
[    0.015351] ... generic registers:      4
[    0.015386] ... value mask:             0000ffffffffffff
[    0.015422] ... max period:             00007fffffffffff
[    0.015459] ... fixed-purpose events:   0
[    0.015493] ... event mask:             000000000000000f
[    0.015685] NMI watchdog enabled, takes one hw-pmu counter.
[    0.016172] xor: automatically using best checksumming function: pIII_sse
[    0.030004]    pIII_sse  :  4162.800 MB/sec
[    0.030040] xor: using function: pIII_sse (4162.800 MB/sec)
[    0.030127] NET: Registered protocol family 16
[    0.030677] ACPI: bus type pci registered
[    0.066458] PCI: PCI BIOS revision 2.10 entry at 0xfb760, last bus=4
[    0.066498] PCI: Using configuration type 1 for base access
[    0.072308] bio: create slab <bio-0> at 0
[    0.126700] raid6: int32x1    515 MB/s
[    0.183398] raid6: int32x2    667 MB/s
[    0.240033] raid6: int32x4    498 MB/s
[    0.296675] raid6: int32x8    380 MB/s
[    0.353356] raid6: mmxx1     1231 MB/s
[    0.409992] raid6: mmxx2     2035 MB/s
[    0.466675] raid6: sse1x1    1153 MB/s
[    0.523310] raid6: sse1x2    1828 MB/s
[    0.523345] raid6: using algorithm sse1x2 (1828 MB/s)
[    0.525010] ACPI: EC: Look up EC in DSDT
[    0.529866] ACPI: Interpreter enabled
[    0.529909] ACPI: (supports S0 S1 S4 S5)
[    0.530067] ACPI: Using PIC for interrupt routing
[    0.541787] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.541958] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.542239] pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7] (ignored)
[    0.542245] pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff] (ignored)
[    0.542251] pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff] (ignored)
[    0.542256] pci_root PNP0A03:00: host bridge window [mem 0x000c0000-0x000dffff] (ignored)
[    0.542262] pci_root PNP0A03:00: host bridge window [mem 0x7e000000-0xfebfffff] (ignored)
[    0.542283] pci 0000:00:00.0: [10de:01e0] type 0 class 0x000600
[    0.542295] pci 0000:00:00.0: reg 10: [mem 0xe0000000-0xe3ffffff pref]
[    0.542342] pci 0000:00:00.1: [10de:01eb] type 0 class 0x000500
[    0.542384] pci 0000:00:00.2: [10de:01ee] type 0 class 0x000500
[    0.542425] pci 0000:00:00.3: [10de:01ed] type 0 class 0x000500
[    0.542463] pci 0000:00:00.4: [10de:01ec] type 0 class 0x000500
[    0.542504] pci 0000:00:00.5: [10de:01ef] type 0 class 0x000500
[    0.542550] pci 0000:00:01.0: [10de:0060] type 0 class 0x000601
[    0.542636] pci 0000:00:01.1: [10de:0064] type 0 class 0x000c05
[    0.542653] pci 0000:00:01.1: reg 10: [io  0xc400-0xc41f]
[    0.542710] pci 0000:00:01.1: PME# supported from D3hot D3cold
[    0.542717] pci 0000:00:01.1: PME# disabled
[    0.542742] pci 0000:00:02.0: [10de:0067] type 0 class 0x000c03
[    0.542759] pci 0000:00:02.0: reg 10: [mem 0xef080000-0xef080fff]
[    0.542816] pci 0000:00:02.0: supports D1 D2
[    0.542820] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.542826] pci 0000:00:02.0: PME# disabled
[    0.542846] pci 0000:00:02.1: [10de:0067] type 0 class 0x000c03
[    0.542863] pci 0000:00:02.1: reg 10: [mem 0xef083000-0xef083fff]
[    0.542920] pci 0000:00:02.1: supports D1 D2
[    0.542924] pci 0000:00:02.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.542930] pci 0000:00:02.1: PME# disabled
[    0.542951] pci 0000:00:02.2: [10de:0068] type 0 class 0x000c03
[    0.542970] pci 0000:00:02.2: reg 10: [mem 0xef086000-0xef0860ff]
[    0.543033] pci 0000:00:02.2: supports D1 D2
[    0.543037] pci 0000:00:02.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543044] pci 0000:00:02.2: PME# disabled
[    0.543071] pci 0000:00:04.0: [10de:0066] type 0 class 0x000200
[    0.543088] pci 0000:00:04.0: reg 10: [mem 0xef087000-0xef087fff]
[    0.543099] pci 0000:00:04.0: reg 14: [io  0xb000-0xb007]
[    0.543149] pci 0000:00:04.0: supports D1 D2
[    0.543153] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543159] pci 0000:00:04.0: PME# disabled
[    0.543178] pci 0000:00:05.0: [10de:006b] type 0 class 0x000401
[    0.543195] pci 0000:00:05.0: reg 10: [mem 0xef000000-0xef07ffff]
[    0.543251] pci 0000:00:05.0: supports D1 D2
[    0.543270] pci 0000:00:06.0: [10de:006a] type 0 class 0x000401
[    0.543316] pci 0000:00:06.0: reg 10: [io  0xb400-0xb4ff]
[    0.543328] pci 0000:00:06.0: reg 14: [io  0xb800-0xb87f]
[    0.543339] pci 0000:00:06.0: reg 18: [mem 0xef081000-0xef081fff]
[    0.543383] pci 0000:00:06.0: supports D1 D2
[    0.543440] pci 0000:00:08.0: [10de:006c] type 1 class 0x000604
[    0.543483] pci 0000:00:09.0: [10de:0065] type 0 class 0x000101
[    0.543526] pci 0000:00:09.0: reg 20: [io  0xf000-0xf00f]
[    0.543575] pci 0000:00:0d.0: [10de:006e] type 0 class 0x000c00
[    0.543592] pci 0000:00:0d.0: reg 10: [mem 0xef084000-0xef0847ff]
[    0.543604] pci 0000:00:0d.0: reg 14: [mem 0xef085000-0xef08503f]
[    0.543654] pci 0000:00:0d.0: supports D1 D2
[    0.543658] pci 0000:00:0d.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543664] pci 0000:00:0d.0: PME# disabled
[    0.543698] pci 0000:00:1e.0: [10de:01e8] type 1 class 0x000604
[    0.543759] pci 0000:01:06.0: [1180:0476] type 2 class 0x000607
[    0.543781] pci 0000:01:06.0: reg 10: [mem 0xee000000-0xee000fff]
[    0.543804] pci 0000:01:06.0: supports D1 D2
[    0.543808] pci 0000:01:06.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543815] pci 0000:01:06.0: PME# disabled
[    0.543838] pci 0000:01:06.1: [1180:0476] type 2 class 0x000607
[    0.543860] pci 0000:01:06.1: reg 10: [mem 0xee005000-0xee005fff]
[    0.543882] pci 0000:01:06.1: supports D1 D2
[    0.543886] pci 0000:01:06.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.543893] pci 0000:01:06.1: PME# disabled
[    0.543947] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.543989] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.543996] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.544003] pci 0000:00:08.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
[    0.544087] pci_bus 0000:03: [bus 03-06] partially hidden behind bridge 0000:01 [bus 01-03]
[    0.544163] pci 0000:04:00.0: [10de:01f0] type 0 class 0x000300
[    0.544180] pci 0000:04:00.0: reg 10: [mem 0xec000000-0xecffffff]
[    0.544191] pci 0000:04:00.0: reg 14: [mem 0xe4000000-0xe7ffffff pref]
[    0.544201] pci 0000:04:00.0: reg 18: [mem 0xe8000000-0xe807ffff pref]
[    0.544229] pci 0000:04:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
[    0.544281] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.544320] pci 0000:00:1e.0:   bridge window [io  0xf000-0x0000] (disabled)
[    0.544326] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.544333] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.544346] pci_bus 0000:00: on NUMA node 0
[    0.544352] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.544550] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.HUB0._PRT]
[    0.544620] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGPB._PRT]
[    0.587825] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.588187] ACPI: PCI Interrupt Link [LNK2] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.588545] ACPI: PCI Interrupt Link [LNK3] (IRQs *3 4 5 6 7 10 11 12 14 15)
[    0.588854] ACPI: PCI Interrupt Link [LNK4] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.589164] ACPI: PCI Interrupt Link [LNK5] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.589471] ACPI: PCI Interrupt Link [LUBA] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.589825] ACPI: PCI Interrupt Link [LUBB] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.590189] ACPI: PCI Interrupt Link [LMAC] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.590501] ACPI: PCI Interrupt Link [LAPU] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.590810] ACPI: PCI Interrupt Link [LACI] (IRQs 3 4 5 6 7 10 11 *12 14 15)
[    0.591118] ACPI: PCI Interrupt Link [LMCI] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.591470] ACPI: PCI Interrupt Link [LSMB] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.591825] ACPI: PCI Interrupt Link [LUB2] (IRQs 3 4 5 6 7 10 11 *12 14 15)
[    0.592134] ACPI: PCI Interrupt Link [LFIR] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.592441] ACPI: PCI Interrupt Link [L3CM] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.592794] ACPI: PCI Interrupt Link [LIDE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.593156] ACPI: PCI Interrupt Link [APC1] (IRQs *16), disabled.
[    0.593366] ACPI: PCI Interrupt Link [APC2] (IRQs *17), disabled.
[    0.593537] ACPI: PCI Interrupt Link [APC3] (IRQs *18)
[    0.593688] ACPI: PCI Interrupt Link [APC4] (IRQs *19)
[    0.593848] ACPI: PCI Interrupt Link [APCE] (IRQs *16)
[    0.594044] ACPI: PCI Interrupt Link [APCF] (IRQs 20 21 22) *0, disabled.
[    0.594305] ACPI: PCI Interrupt Link [APCG] (IRQs 20 21 22) *0
[    0.594547] ACPI: PCI Interrupt Link [APCH] (IRQs 20 21 22) *0
[    0.594788] ACPI: PCI Interrupt Link [APCI] (IRQs 20 21 22) *0
[    0.595043] ACPI: PCI Interrupt Link [APCJ] (IRQs 20 21 22) *0
[    0.595284] ACPI: PCI Interrupt Link [APCK] (IRQs 20 21 22) *0, disabled.
[    0.595505] ACPI: PCI Interrupt Link [APCS] (IRQs *23), disabled.
[    0.595713] ACPI: PCI Interrupt Link [APCL] (IRQs 20 21 22) *0
[    0.595964] ACPI: PCI Interrupt Link [APCM] (IRQs 20 21 22) *0
[    0.596205] ACPI: PCI Interrupt Link [AP3C] (IRQs 20 21 22) *0, disabled.
[    0.596465] ACPI: PCI Interrupt Link [APCZ] (IRQs 20 21 22) *0, disabled.
[    0.596955] vgaarb: device added: PCI:0000:04:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.597009] vgaarb: loaded
[    0.597310] SCSI subsystem initialized
[    0.597521] usbcore: registered new interface driver usbfs
[    0.597670] usbcore: registered new interface driver hub
[    0.597784] usbcore: registered new device driver usb
[    0.598182] Advanced Linux Sound Architecture Driver Version 1.0.23.
[    0.598280] PCI: Using ACPI for IRQ routing
[    0.598324] PCI: pci_cache_line_size set to 32 bytes
[    0.598408] reserve RAM buffer: 000000007dff0000 - 000000007fffffff 
[    0.598660] Switching to clocksource pit
[    0.598808] pnp: PnP ACPI init
[    0.598860] ACPI: bus type pnp registered
[    0.599263] pnp 00:00: [io  0x4000-0x407f]
[    0.599269] pnp 00:00: [io  0x4080-0x40ff]
[    0.599273] pnp 00:00: [io  0x4400-0x447f]
[    0.599277] pnp 00:00: [io  0x4480-0x44ff]
[    0.599281] pnp 00:00: [io  0x4200-0x427f]
[    0.599285] pnp 00:00: [io  0x4280-0x42ff]
[    0.599409] system 00:00: [io  0x4000-0x407f] has been reserved
[    0.599450] system 00:00: [io  0x4080-0x40ff] has been reserved
[    0.599490] system 00:00: [io  0x4400-0x447f] has been reserved
[    0.599530] system 00:00: [io  0x4480-0x44ff] has been reserved
[    0.599569] system 00:00: [io  0x4200-0x427f] has been reserved
[    0.599609] system 00:00: [io  0x4280-0x42ff] has been reserved
[    0.599650] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.599672] pnp 00:01: [io  0x5000-0x503f]
[    0.599677] pnp 00:01: [io  0x5100-0x513f]
[    0.599781] system 00:01: [io  0x5000-0x503f] has been reserved
[    0.599823] system 00:01: [io  0x5100-0x513f] has been reserved
[    0.599863] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.599952] system 00:02: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.599952] pnp 00:03: [bus 00-ff]
[    0.599952] pnp 00:03: [io  0x0cf8-0x0cff]
[    0.599952] pnp 00:03: [io  0x0000-0x0cf7 window]
[    0.599952] pnp 00:03: [io  0x0d00-0xffff window]
[    0.599952] pnp 00:03: [mem 0x000a0000-0x000bffff window]
[    0.599952] pnp 00:03: [mem 0x000c0000-0x000dffff window]
[    0.599952] pnp 00:03: [mem 0x7e000000-0xfebfffff window]
[    0.599952] pnp 00:03: Plug and Play ACPI device, IDs PNP0a03 (active)
[    0.599952] pnp 00:04: [io  0x0010-0x001f]
[    0.599952] pnp 00:04: [io  0x0022-0x003f]
[    0.599952] pnp 00:04: [io  0x0044-0x005f]
[    0.599952] pnp 00:04: [io  0x0062-0x0063]
[    0.599952] pnp 00:04: [io  0x0065-0x006f]
[    0.599952] pnp 00:04: [io  0x0074-0x007f]
[    0.599952] pnp 00:04: [io  0x0091-0x0093]
[    0.599952] pnp 00:04: [io  0x00a2-0x00bf]
[    0.599952] pnp 00:04: [io  0x00e0-0x00ef]
[    0.599952] pnp 00:04: [io  0x04d0-0x04d1]
[    0.599952] pnp 00:04: [io  0x0800-0x0805]
[    0.599952] pnp 00:04: [io  0x0290-0x0297]
[    0.599952] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.601116] system 00:04: [io  0x0800-0x0805] has been reserved
[    0.601156] system 00:04: [io  0x0290-0x0297] has been reserved
[    0.601196] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.601278] pnp 00:05: [dma 4]
[    0.601283] pnp 00:05: [io  0x0000-0x000f]
[    0.601287] pnp 00:05: [io  0x0080-0x0090]
[    0.601291] pnp 00:05: [io  0x0094-0x009f]
[    0.601295] pnp 00:05: [io  0x00c0-0x00df]
[    0.601397] pnp 00:05: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.601421] pnp 00:06: [io  0x0070-0x0073]
[    0.601427] pnp 00:06: [irq 8]
[    0.601530] pnp 00:06: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.601551] pnp 00:07: [io  0x0061]
[    0.601649] pnp 00:07: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.601671] pnp 00:08: [io  0x00f0-0x00ff]
[    0.601676] pnp 00:08: [irq 13]
[    0.601776] pnp 00:08: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.602041] pnp 00:09: [io  0x03f0-0x03f5]
[    0.602046] pnp 00:09: [io  0x03f7]
[    0.602050] pnp 00:09: [irq 6]
[    0.602054] pnp 00:09: [dma 2]
[    0.602186] pnp 00:09: Plug and Play ACPI device, IDs PNP0700 (active)
[    0.602515] pnp 00:0a: [io  0x03f8-0x03ff]
[    0.602521] pnp 00:0a: [irq 4]
[    0.602674] pnp 00:0a: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.603480] pnp 00:0b: [io  0x0378-0x037f]
[    0.603485] pnp 00:0b: [io  0x0778-0x077b]
[    0.603490] pnp 00:0b: [irq 7]
[    0.603494] pnp 00:0b: [dma 3]
[    0.603668] pnp 00:0b: Plug and Play ACPI device, IDs PNP0401 (active)
[    0.603763] pnp: PnP ACPI: found 12 devices
[    0.603801] ACPI: ACPI bus type pnp unregistered
[    0.644436] Switching to clocksource acpi_pm
[    0.644568] Switched to NOHz mode on CPU #0
[    0.644623] pci 0000:00:08.0: BAR 9: assigned [mem 0x80000000-0x87ffffff pref]
[    0.644695] pci 0000:01:06.0: BAR 9: assigned [mem 0x80000000-0x83ffffff pref]
[    0.644748] pci 0000:01:06.0: BAR 10: can't assign mem (size 0x4000000)
[    0.644790] pci 0000:01:06.1: BAR 9: assigned [mem 0x84000000-0x87ffffff pref]
[    0.644842] pci 0000:01:06.1: BAR 10: can't assign mem (size 0x4000000)
[    0.644883] pci 0000:01:06.0: BAR 7: assigned [io  0x9000-0x90ff]
[    0.644923] pci 0000:01:06.0: BAR 8: assigned [io  0x9400-0x94ff]
[    0.644963] pci 0000:01:06.1: BAR 7: assigned [io  0x9800-0x98ff]
[    0.645003] pci 0000:01:06.1: BAR 8: assigned [io  0x9c00-0x9cff]
[    0.645042] pci 0000:01:06.0: CardBus bridge to [bus 02-02]
[    0.645080] pci 0000:01:06.0:   bridge window [io  0x9000-0x90ff]
[    0.645123] pci 0000:01:06.0:   bridge window [io  0x9400-0x94ff]
[    0.645165] pci 0000:01:06.0:   bridge window [mem 0x80000000-0x83ffffff pref]
[    0.645219] pci 0000:01:06.1: CardBus bridge to [bus 03-06]
[    0.645257] pci 0000:01:06.1:   bridge window [io  0x9800-0x98ff]
[    0.645298] pci 0000:01:06.1:   bridge window [io  0x9c00-0x9cff]
[    0.645340] pci 0000:01:06.1:   bridge window [mem 0x84000000-0x87ffffff pref]
[    0.645394] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.645432] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.645475] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.645517] pci 0000:00:08.0:   bridge window [mem 0x80000000-0x87ffffff pref]
[    0.645574] pci 0000:04:00.0: BAR 6: assigned [mem 0xe8080000-0xe809ffff pref]
[    0.645626] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.645663] pci 0000:00:1e.0:   bridge window [io  disabled]
[    0.645704] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.645745] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.645811] pci 0000:00:08.0: setting latency timer to 64
[    0.646021] ACPI: PCI Interrupt Link [LNK3] enabled at IRQ 3
[    0.646061] PCI: setting IRQ 3 as level-triggered
[    0.646070] pci 0000:01:06.0: PCI INT A -> Link[LNK3] -> GSI 3 (level, low) -> IRQ 3
[    0.646234] ACPI: PCI Interrupt Link [LNK4] enabled at IRQ 11
[    0.646272] PCI: setting IRQ 11 as level-triggered
[    0.646281] pci 0000:01:06.1: PCI INT B -> Link[LNK4] -> GSI 11 (level, low) -> IRQ 11
[    0.646341] pci_bus 0000:00: resource 0 [io  0x0000-0xffff]
[    0.646347] pci_bus 0000:00: resource 1 [mem 0x00000000-0xffffffff]
[    0.646352] pci_bus 0000:01: resource 0 [io  0x9000-0xafff]
[    0.646357] pci_bus 0000:01: resource 1 [mem 0xee000000-0xeeffffff]
[    0.646362] pci_bus 0000:01: resource 2 [mem 0x80000000-0x87ffffff pref]
[    0.646367] pci_bus 0000:02: resource 0 [io  0x9000-0x90ff]
[    0.646372] pci_bus 0000:02: resource 1 [io  0x9400-0x94ff]
[    0.646377] pci_bus 0000:02: resource 2 [mem 0x80000000-0x83ffffff pref]
[    0.646382] pci_bus 0000:03: resource 0 [io  0x9800-0x98ff]
[    0.646386] pci_bus 0000:03: resource 1 [io  0x9c00-0x9cff]
[    0.646391] pci_bus 0000:03: resource 2 [mem 0x84000000-0x87ffffff pref]
[    0.646396] pci_bus 0000:04: resource 1 [mem 0xec000000-0xedffffff]
[    0.646401] pci_bus 0000:04: resource 2 [mem 0xe4000000-0xebffffff pref]
[    0.646467] NET: Registered protocol family 2
[    0.646580] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.647145] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.648738] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
[    0.649259] TCP: Hash tables configured (established 131072 bind 65536)
[    0.649300] TCP reno registered
[    0.649336] UDP hash table entries: 512 (order: 1, 8192 bytes)
[    0.649388] UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
[    0.649552] NET: Registered protocol family 1
[    0.680077] pci 0000:04:00.0: Boot video device
[    0.680083] PCI: CLS 0 bytes, default 32
[    0.680914] Scanning for low memory corruption every 60 seconds
[    0.681865] highmem bounce pool size: 64 pages
[    0.681909] HugeTLB registered 4 MB page size, pre-allocated 0 pages
[    0.688621] msgmni has been set to 1733
[    0.688957] alg: No test for stdrng (krng)
[    0.689005] io scheduler noop registered
[    0.689041] io scheduler deadline registered
[    0.689095] io scheduler cfq registered (default)
[    0.689591] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.963426] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.984674] 00:0a: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.985156] Linux agpgart interface v0.103
[    0.985225] agpgart: Detected NVIDIA nForce2 chipset
[    0.991055] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M @ 0xe0000000
[    0.991347] Floppy drive(s): fd0 is 1.44M
[    1.006844] FDC 0 is a post-1991 82077
[    1.008152] Uniform Multi-Platform E-IDE driver
[    1.008316] amd74xx 0000:00:09.0: UDMA133 controller
[    1.008357] amd74xx 0000:00:09.0: IDE controller (0x10de:0x0065 rev 0xa2)
[    1.008442] amd74xx 0000:00:09.0: BIOS didn't set cable bits correctly. Enabling workaround.
[    1.008498] amd74xx 0000:00:09.0: not 100% native mode: will probe irqs later
[    1.008543]     ide0: BM-DMA at 0xf000-0xf007
[    1.008586]     ide1: BM-DMA at 0xf008-0xf00f
[    1.008626] Probing IDE interface ide0...
[    1.283492] hda: ST3120022A, ATA DISK drive
[    1.683368] Refined TSC clocksource calibration: 1469.999 MHz.
[    1.683409] Switching to clocksource tsc
[    1.923441] hda: host max PIO5 wanted PIO255(auto-tune) selected PIO4
[    1.923917] hda: UDMA/100 mode selected
[    1.924214] Probing IDE interface ide1...
[    2.463459] ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
[    2.463546] ide1 at 0x170-0x177,0x376 on irq 15
[    2.463817] ide_generic: please use "probe_mask=0x3f" module parameter for probing all legacy ISA IDE ports
[    2.463873] ide-gd driver 1.18
[    2.463932] hda: max request size: 512KiB
[    2.473767] hda: 234441648 sectors (120034 MB) w/2048KiB Cache, CHS=16383/255/63
[    2.474000] hda: cache flushes supported
[    2.484046]  hda: hda1 hda2 hda3 hda4
[    2.484652] ide-cd driver 5.00
[    2.484766] forcedeth: Reverse Engineered nForce ethernet driver. Version 0.64.
[    2.485043] ACPI: PCI Interrupt Link [LMAC] enabled at IRQ 11
[    2.485088] forcedeth 0000:00:04.0: PCI INT A -> Link[LMAC] -> GSI 11 (level, low) -> IRQ 11
[    2.485145] forcedeth 0000:00:04.0: setting latency timer to 64
[    3.000743] forcedeth 0000:00:04.0: ifname eth0, PHY OUI 0x732 @ 1, addr aa:bb:cc:dd:ee:ff
[    3.000799] forcedeth 0000:00:04.0: timirq lnktim desc-v1
[    3.001094] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.001319] ACPI: PCI Interrupt Link [LUB2] enabled at IRQ 12
[    3.001359] PCI: setting IRQ 12 as level-triggered
[    3.001368] ehci_hcd 0000:00:02.2: PCI INT C -> Link[LUB2] -> GSI 12 (level, low) -> IRQ 12
[    3.001440] ehci_hcd 0000:00:02.2: setting latency timer to 64
[    3.001445] ehci_hcd 0000:00:02.2: EHCI Host Controller
[    3.001595] ehci_hcd 0000:00:02.2: new USB bus registered, assigned bus number 1
[    3.001695] ehci_hcd 0000:00:02.2: debug port 1
[    3.001740] ehci_hcd 0000:00:02.2: cache line size of 32 is not supported
[    3.001755] ehci_hcd 0000:00:02.2: irq 12, io mem 0xef086000
[    3.010024] ehci_hcd 0000:00:02.2: USB 2.0 started, EHCI 1.00
[    3.010115] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    3.010156] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.010208] usb usb1: Product: EHCI Host Controller
[    3.010244] usb usb1: Manufacturer: Linux 2.6.38-rc8+ ehci_hcd
[    3.010282] usb usb1: SerialNumber: 0000:00:02.2
[    3.010522] hub 1-0:1.0: USB hub found
[    3.010564] hub 1-0:1.0: 6 ports detected
[    3.010818] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.011044] ACPI: PCI Interrupt Link [LUBA] enabled at IRQ 10
[    3.011084] PCI: setting IRQ 10 as level-triggered
[    3.011093] ohci_hcd 0000:00:02.0: PCI INT A -> Link[LUBA] -> GSI 10 (level, low) -> IRQ 10
[    3.011165] ohci_hcd 0000:00:02.0: setting latency timer to 64
[    3.011171] ohci_hcd 0000:00:02.0: OHCI Host Controller
[    3.011327] ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 2
[    3.011404] ohci_hcd 0000:00:02.0: irq 10, io mem 0xef080000
[    3.065383] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    3.065425] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.065477] usb usb2: Product: OHCI Host Controller
[    3.065513] usb usb2: Manufacturer: Linux 2.6.38-rc8+ ohci_hcd
[    3.065551] usb usb2: SerialNumber: 0000:00:02.0
[    3.065784] hub 2-0:1.0: USB hub found
[    3.065829] hub 2-0:1.0: 3 ports detected
[    3.066187] ACPI: PCI Interrupt Link [LUBB] enabled at IRQ 5
[    3.066227] PCI: setting IRQ 5 as level-triggered
[    3.066236] ohci_hcd 0000:00:02.1: PCI INT B -> Link[LUBB] -> GSI 5 (level, low) -> IRQ 5
[    3.066304] ohci_hcd 0000:00:02.1: setting latency timer to 64
[    3.066309] ohci_hcd 0000:00:02.1: OHCI Host Controller
[    3.066453] ohci_hcd 0000:00:02.1: new USB bus registered, assigned bus number 3
[    3.066528] ohci_hcd 0000:00:02.1: irq 5, io mem 0xef083000
[    3.118713] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    3.118756] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.118806] usb usb3: Product: OHCI Host Controller
[    3.118843] usb usb3: Manufacturer: Linux 2.6.38-rc8+ ohci_hcd
[    3.118881] usb usb3: SerialNumber: 0000:00:02.1
[    3.119120] hub 3-0:1.0: USB hub found
[    3.119164] hub 3-0:1.0: 3 ports detected
[    3.119497] usbcore: registered new interface driver libusual
[    3.119772] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    3.264501] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.266208] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.266638] mousedev: PS/2 mouse device common for all mice
[    3.266912] rtc_cmos 00:06: RTC can wake from S4
[    3.267070] rtc_cmos 00:06: rtc core: registered rtc_cmos as rtc0
[    3.267131] rtc0: alarms up to one year, y3k, 242 bytes nvram
[    3.267220] i2c /dev entries driver
[    3.320106] i2c i2c-0: nForce2 SMBus adapter at 0x5000
[    3.373427] i2c i2c-1: nForce2 SMBus adapter at 0x5100
[    3.373553] it87: Found IT8712F chip at 0x290, revision 5
[    3.373669] ACPI: resource it87 [io  0x0295-0x0296] conflicts with ACPI region SPIO [io 0x295-0x296]
[    3.373724] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    3.373827] md: raid1 personality registered for level 1
[    3.373867] md: raid10 personality registered for level 10
[    3.373905] md: raid6 personality registered for level 6
[    3.373942] md: raid5 personality registered for level 5
[    3.373979] md: raid4 personality registered for level 4
[    3.374017] cpuidle: using governor ladder
[    3.374052] cpuidle: using governor menu
[    3.375757] usbcore: registered new interface driver usbhid
[    3.375797] usbhid: USB HID core driver
[    3.376221] ACPI: PCI Interrupt Link [LACI] enabled at IRQ 12
[    3.376266] Intel ICH 0000:00:06.0: PCI INT A -> Link[LACI] -> GSI 12 (level, low) -> IRQ 12
[    3.376362] Intel ICH 0000:00:06.0: setting latency timer to 64
[    3.610024] usb 2-1: new full speed USB device using ohci_hcd and address 2
[    3.693358] intel8x0_measure_ac97_clock: measured 52172 usecs (2536 samples)
[    3.693399] intel8x0: clocking to 47399
[    3.694128] ALSA device list:
[    3.694163]   #0: NVidia nForce2 with ALC650E at irq 12
[    3.694690] TCP cubic registered
[    3.694727] NET: Registered protocol family 17
[    3.694774] Registering the dns_resolver key type
[    3.695430] registered taskstats version 1
[    3.695891] rtc_cmos 00:06: setting system clock to 2011-03-11 03:38:08 UTC (1299814688)
[    3.763354] usb 2-1: New USB device found, idVendor=0430, idProduct=100e
[    3.763396] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.766428] hub 2-1:1.0: USB hub found
[    3.769338] hub 2-1:1.0: 4 ports detected
[    4.026693] usb 2-2: new low speed USB device using ohci_hcd and address 3
[    4.113545] md: Waiting for all devices to be available before autodetect
[    4.113586] md: If you don't use raid, use raid=noautodetect
[    4.113887] md: Autodetecting RAID arrays.
[    4.113924] md: Scanned 0 and added 0 devices.
[    4.113959] md: autorun ...
[    4.113992] md: ... autorun DONE.
[    4.132630] EXT3-fs: barriers not enabled
[    4.146154] kjournald starting.  Commit interval 5 seconds
[    4.146216] EXT3-fs (hda2): mounted filesystem with ordered data mode
[    4.146266] VFS: Mounted root (ext3 filesystem) readonly on device 3:2.
[    4.146361] Freeing unused kernel memory: 276k freed
[    4.181327] usb 2-2: New USB device found, idVendor=1241, idProduct=1166
[    4.181372] usb 2-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.195896] input: HID 1241:1166 as /devices/pci0000:00/0000:00:02.0/usb2/2-2/2-2:1.0/input/input0
[    4.196157] generic-usb 0003:1241:1166.0001: input,hidraw0: USB HID v1.10 Mouse [HID 1241:1166] on usb-0000:00:02.0-2/input0
[    4.368309] usb 2-1.4: new full speed USB device using ohci_hcd and address 4
[    4.479305] usb 2-1.4: New USB device found, idVendor=0430, idProduct=00a2
[    4.479353] usb 2-1.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    4.479405] usb 2-1.4: Product: Sun USB Keyboard
[    4.488889] input: Sun USB Keyboard as /devices/pci0000:00/0000:00:02.0/usb2/2-1/2-1.4/2-1.4:1.0/input/input1
[    4.489081] generic-usb 0003:0430:00A2.0002: input,hidraw1: USB HID v1.10 Keyboard [Sun USB Keyboard] on usb-0000:00:02.0-1.4/input0
[    7.597586] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2
[    7.597654] ACPI: Power Button [PWRB]
[    7.598746] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    7.598810] ACPI: Power Button [PWRF]
[    7.648290] yenta_cardbus 0000:01:06.0: CardBus bridge found [14ef:0202]
[    7.773689] yenta_cardbus 0000:01:06.0: ISA IRQ mask 0x0000, PCI irq 3
[    7.773739] yenta_cardbus 0000:01:06.0: Socket status: 30000410
[    7.773791] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [io  0x9000-0xafff]
[    7.773846] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [mem 0xee000000-0xeeffffff]
[    7.773902] pcmcia_socket pcmcia_socket0: cs: memory probe 0xee000000-0xeeffffff: excluding 0xee000000-0xee0fffff
[    7.774023] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [mem 0x80000000-0x87ffffff pref]
[    7.774079] pcmcia_socket pcmcia_socket0: cs: memory probe 0x80000000-0x87ffffff: excluding 0x80000000-0x87ffffff
[    7.774760] yenta_cardbus 0000:01:06.1: CardBus bridge found [14ef:0202]
[    7.900247] yenta_cardbus 0000:01:06.1: ISA IRQ mask 0x0000, PCI irq 11
[    7.900296] yenta_cardbus 0000:01:06.1: Socket status: 30000410
[    7.900337] pci_bus 0000:03: Upper limit for fixing this bridge's parent bridge: #03
[    7.900400] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [io  0x9000-0xafff]
[    7.900455] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [mem 0xee000000-0xeeffffff]
[    7.900511] pcmcia_socket pcmcia_socket1: cs: memory probe 0xee000000-0xeeffffff: excluding 0xee000000-0xee0fffff
[    7.900632] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [mem 0x80000000-0x87ffffff pref]
[    7.900687] pcmcia_socket pcmcia_socket1: cs: memory probe 0x80000000-0x87ffffff: excluding 0x80000000-0x87ffffff
[    8.890947] [drm] Initialized drm 1.1.0 20060810
[    9.160733] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 10
[    9.160785] nouveau 0000:04:00.0: PCI INT A -> Link[LNK5] -> GSI 10 (level, low) -> IRQ 10
[    9.166856] [drm] nouveau 0000:04:00.0: Detected an NV10 generation card (0x01f000a5)
[    9.167185] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PRAMIN
[    9.211562] [drm] nouveau 0000:04:00.0: ... BIOS checksum invalid
[    9.211602] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PROM
[    9.211655] [drm] nouveau 0000:04:00.0: ... BIOS signature not found
[    9.211693] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PCIROM
[    9.212159] [drm] nouveau 0000:04:00.0: ... appears to be valid
[    9.212711] [drm] nouveau 0000:04:00.0: BMP BIOS found
[    9.212749] [drm] nouveau 0000:04:00.0: BMP version 5.21
[    9.212787] [drm] nouveau 0000:04:00.0: Bios version 04.1f.00.07
[    9.212827] [drm] nouveau 0000:04:00.0: Found Display Configuration Block version 2.0
[    9.212881] [drm] nouveau 0000:04:00.0: Raw DCB entry 0: 01000100 000088b8
[    9.212923] [drm] nouveau 0000:04:00.0: Raw DCB entry 1: 02010210 000088b8
[    9.212964] [drm] nouveau 0000:04:00.0: Raw DCB entry 2: 01120132 00000000
[    9.213004] [drm] nouveau 0000:04:00.0: Raw DCB entry 3: 01120232 00000000
[    9.213044] [drm] nouveau 0000:04:00.0: Raw DCB entry 4: 02010121 00000003
[    9.213085] [drm] nouveau 0000:04:00.0: Raw DCB entry 5: 02010221 00000003
[    9.213125] [drm] nouveau 0000:04:00.0: Merging DCB entries 2 and 3
[    9.213164] [drm] nouveau 0000:04:00.0: Merging DCB entries 4 and 5
[    9.213721] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xC284
[    9.213800] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xC4E0
[    9.213859] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xC2E7
[    9.228955] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xC632
[    9.229015] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xC47B
[    9.229069] [drm] nouveau 0000:04:00.0: Unknown memclock table version 0.
[    9.259928] [drm] nouveau 0000:04:00.0: 0 available performance level(s)
[    9.259997] [drm] nouveau 0000:04:00.0: c: memory 200454MHz core 199MHz
[    9.260177] [TTM] Zone  kernel: Available graphics memory: 443984 kiB.
[    9.260218] [TTM] Zone highmem: Available graphics memory: 1021492 kiB.
[    9.260257] [TTM] Initializing pool allocator.
[    9.260315] [drm] nouveau 0000:04:00.0: Detected 32MiB VRAM
[    9.260667] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[    9.260735] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[    9.260849] nouveau 0000:04:00.0: putting AGP V2 device into 4x mode
[    9.260884] [drm] nouveau 0000:04:00.0: 64 MiB GART (aperture)
[    9.260961] [drm] nouveau 0000:04:00.0: Saving VGA fonts
[    9.308950] [drm] nouveau 0000:04:00.0: Detected TMDS transmitter: sil164
[    9.314989] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    9.315032] [drm] No driver support for vblank timestamp query.
[    9.317176] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 0)
[    9.317230] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[    9.317274] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[    9.317318] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[    9.337394] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card inserted into slot 0
[    9.337442] pcmcia_socket pcmcia_socket0: cs: memory probe 0xee100000-0xeeffffff: clean.
[    9.343201] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 3)
[    9.347323] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0fffff: excluding 0xc0000-0xfffff
[    9.347501] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[    9.347673] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[    9.522119] [drm] nouveau 0000:04:00.0: allocated 1920x1080 fb: 0x4a000, bo f6004000
[   10.185624] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[   10.185631] [drm] nouveau 0000:04:00.0: Output DVI-D-1 is running on CRTC 0 using output A
[   10.188075] Console: switching to colour frame buffer device 240x67
[   10.190146] fb0: nouveaufb frame buffer device
[   10.190149] drm: registered panic notifier
[   10.190187] [drm] Initialized nouveau 0.0.16 20090420 for 0000:04:00.0 on minor 0
[   10.896694] pcmcia_socket pcmcia_socket1: pccard: PCMCIA card inserted into slot 1
[   10.896729] pcmcia_socket pcmcia_socket1: cs: memory probe 0xee100000-0xeeffffff: excluding 0xee100000-0xee1effff
[   10.904003] pcmcia_socket pcmcia_socket1: cs: memory probe 0x0c0000-0x0fffff: excluding 0xc0000-0xfffff
[   10.904123] pcmcia_socket pcmcia_socket1: cs: memory probe 0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[   10.904238] pcmcia_socket pcmcia_socket1: cs: memory probe 0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[   10.910323] 
[   10.910761] pcmcia 1.0: pcmcia: registering new device pcmcia1.0 (IRQ: 11)
[   13.076997] Adding 1951860k swap on /dev/hda1.  Priority:-1 extents:1 across:1951860k 
[   13.349114] EXT3-fs (hda2): using internal journal
[   13.665513] loop: module loaded
[   14.251954] fuse init (API version 7.16)
[   14.347416] EXT3-fs: barriers not enabled
[   14.355296] kjournald starting.  Commit interval 5 seconds
[   14.356633] EXT3-fs (hda3): using internal journal
[   14.357749] EXT3-fs (hda3): mounted filesystem with ordered data mode
[ 1842.826524] [drm] nouveau 0000:04:00.0: Setting dpms mode 1 on tmds encoder (output 2)
[40548.282031] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)


[ 40725.600] _XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
[ 40725.600] _XSERVTransOpen: transport open failed for inet6/$HOST:0
[ 40725.600] _XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6
[ 40725.602] 
X.Org X Server 1.9.4.901 (1.9.5 RC 1)
Release Date: 2011-03-04
[ 40725.602] X Protocol Version 11, Revision 0
[ 40725.602] Build Operating System: Linux 2.6.26-2-amd64 i686 Debian
[ 40725.602] Current Operating System: Linux $HOST 2.6.38-rc8+ #22 Tue Mar 8 21:47:31 EST 2011 i686
[ 40725.602] Kernel command line: auto BOOT_IMAGE=2.6 ro root=302
[ 40725.602] Build Date: 07 March 2011  05:01:39PM
[ 40725.603] xorg-server 2:1.9.4.901-1 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[ 40725.603] Current version of pixman: 0.21.4
[ 40725.603] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[ 40725.603] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[ 40725.603] (==) Log file: "/var/log/Xorg.0.log", Time: Fri Mar 11 09:56:50 2011
[ 40725.603] (==) Using config file: "/etc/X11/xorg.conf"
[ 40725.603] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[ 40725.604] (==) ServerLayout "Default Layout"
[ 40725.604] (**) |-->Screen "Default Screen" (0)
[ 40725.604] (**) |   |-->Monitor "2243SWX"
[ 40725.604] (**) Option "ReducedBlanking"
[ 40725.604] (==) No device specified for screen "Default Screen".
	Using the first device section listed.
[ 40725.604] (**) |   |-->Device "Configured Video Device"
[ 40725.604] (**) Option "DontZap" "off"
[ 40725.604] (**) Option "AllowMouseOpenFail" "off"
[ 40725.605] (==) Automatically adding devices
[ 40725.605] (==) Automatically enabling devices
[ 40725.605] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[ 40725.605] 	Entry deleted from font path.
[ 40725.605] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
[ 40725.605] (==) ModulePath set to "/usr/lib/xorg/modules"
[ 40725.605] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[ 40725.605] (II) Loader magic: 0x81f9fc0
[ 40725.605] (II) Module ABI versions:
[ 40725.605] 	X.Org ANSI C Emulation: 0.4
[ 40725.605] 	X.Org Video Driver: 8.0
[ 40725.605] 	X.Org XInput driver : 11.0
[ 40725.605] 	X.Org Server Extension : 4.0
[ 40725.606] (--) PCI:*(0:4:0:0) 10de:01f0:0000:0000 rev 163, Mem @ 0xec000000/16777216, 0xe4000000/67108864, 0xe8000000/524288, BIOS @ 0x????????/131072
[ 40725.607] (II) Open ACPI successful (/var/run/acpid.socket)
[ 40725.607] (II) LoadModule: "extmod"
[ 40725.608] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[ 40725.608] (II) Module extmod: vendor="X.Org Foundation"
[ 40725.608] 	compiled for 1.9.4.901, module version = 1.0.0
[ 40725.608] 	Module class: X.Org Server Extension
[ 40725.608] 	ABI class: X.Org Server Extension, version 4.0
[ 40725.608] (II) Loading extension SELinux
[ 40725.608] (II) Loading extension MIT-SCREEN-SAVER
[ 40725.608] (II) Loading extension XFree86-VidModeExtension
[ 40725.609] (II) Loading extension XFree86-DGA
[ 40725.609] (II) Loading extension DPMS
[ 40725.609] (II) Loading extension XVideo
[ 40725.609] (II) Loading extension XVideo-MotionCompensation
[ 40725.609] (II) Loading extension X-Resource
[ 40725.609] (II) LoadModule: "dbe"
[ 40725.609] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[ 40725.609] (II) Module dbe: vendor="X.Org Foundation"
[ 40725.609] 	compiled for 1.9.4.901, module version = 1.0.0
[ 40725.609] 	Module class: X.Org Server Extension
[ 40725.609] 	ABI class: X.Org Server Extension, version 4.0
[ 40725.609] (II) Loading extension DOUBLE-BUFFER
[ 40725.609] (II) LoadModule: "glx"
[ 40725.610] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[ 40725.610] (II) Module glx: vendor="X.Org Foundation"
[ 40725.610] 	compiled for 1.9.4.901, module version = 1.0.0
[ 40725.610] 	ABI class: X.Org Server Extension, version 4.0
[ 40725.610] (==) AIGLX enabled
[ 40725.610] (II) Loading extension GLX
[ 40725.610] (II) LoadModule: "record"
[ 40725.610] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[ 40725.611] (II) Module record: vendor="X.Org Foundation"
[ 40725.611] 	compiled for 1.9.4.901, module version = 1.13.0
[ 40725.611] 	Module class: X.Org Server Extension
[ 40725.611] 	ABI class: X.Org Server Extension, version 4.0
[ 40725.611] (II) Loading extension RECORD
[ 40725.611] (II) LoadModule: "dri"
[ 40725.611] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[ 40725.611] (II) Module dri: vendor="X.Org Foundation"
[ 40725.611] 	compiled for 1.9.4.901, module version = 1.0.0
[ 40725.611] 	ABI class: X.Org Server Extension, version 4.0
[ 40725.611] (II) Loading extension XFree86-DRI
[ 40725.611] (II) LoadModule: "dri2"
[ 40725.612] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[ 40725.612] (II) Module dri2: vendor="X.Org Foundation"
[ 40725.612] 	compiled for 1.9.4.901, module version = 1.2.0
[ 40725.612] 	ABI class: X.Org Server Extension, version 4.0
[ 40725.612] (II) Loading extension DRI2
[ 40725.612] (II) LoadModule: "nouveau"
[ 40725.612] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[ 40725.613] (II) Module nouveau: vendor="X.Org Foundation"
[ 40725.613] 	compiled for 1.9.4, module version = 0.0.16
[ 40725.613] 	Module class: X.Org Video Driver
[ 40725.613] 	ABI class: X.Org Video Driver, version 8.0
[ 40725.613] (II) NOUVEAU driver Date:   Tue Nov 30 15:27:36 2010 +1000
[ 40725.613] (II) NOUVEAU driver for NVIDIA chipset families :
[ 40725.613] 	RIVA TNT    (NV04)
[ 40725.613] 	RIVA TNT2   (NV05)
[ 40725.613] 	GeForce 256 (NV10)
[ 40725.613] 	GeForce 2   (NV11, NV15)
[ 40725.613] 	GeForce 4MX (NV17, NV18)
[ 40725.613] 	GeForce 3   (NV20)
[ 40725.613] 	GeForce 4Ti (NV25, NV28)
[ 40725.613] 	GeForce FX  (NV3x)
[ 40725.613] 	GeForce 6   (NV4x)
[ 40725.613] 	GeForce 7   (G7x)
[ 40725.613] 	GeForce 8   (G8x)
[ 40725.613] (--) using VT number 7

[ 40725.616] drmOpenDevice: node name is /dev/dri/card0
[ 40725.617] drmOpenDevice: open result is 9, (OK)
[ 40725.617] drmOpenByBusid: Searching for BusID pci:0000:04:00.0
[ 40725.617] drmOpenDevice: node name is /dev/dri/card0
[ 40725.617] drmOpenDevice: open result is 9, (OK)
[ 40725.617] drmOpenByBusid: drmOpenMinor returns 9
[ 40725.617] drmOpenByBusid: drmGetBusid reports pci:0000:04:00.0
[ 40725.617] (II) [drm] nouveau interface version: 0.0.16
[ 40725.617] (II) Loading sub module "dri"
[ 40725.617] (II) LoadModule: "dri"
[ 40725.617] (II) Reloading /usr/lib/xorg/modules/extensions/libdri.so
[ 40725.618] (II) NOUVEAU(0): Loaded DRI module
[ 40725.618] drmOpenDevice: node name is /dev/dri/card0
[ 40725.618] drmOpenDevice: open result is 10, (OK)
[ 40725.618] drmOpenDevice: node name is /dev/dri/card0
[ 40725.618] drmOpenDevice: open result is 10, (OK)
[ 40725.618] drmOpenByBusid: Searching for BusID pci:0000:04:00.0
[ 40725.618] drmOpenDevice: node name is /dev/dri/card0
[ 40725.618] drmOpenDevice: open result is 10, (OK)
[ 40725.618] drmOpenByBusid: drmOpenMinor returns 10
[ 40725.618] drmOpenByBusid: drmGetBusid reports pci:0000:04:00.0
[ 40725.618] (II) [drm] DRM interface version 1.4
[ 40725.618] (II) [drm] DRM open master succeeded.
[ 40725.618] (--) NOUVEAU(0): Chipset: "NVIDIA NV1f"
[ 40725.618] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[ 40725.618] (==) NOUVEAU(0): RGB weight 888
[ 40725.618] (==) NOUVEAU(0): Default visual is TrueColor
[ 40725.618] (==) NOUVEAU(0): Using HW cursor
[ 40725.618] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[ 40725.686] (II) NOUVEAU(0): Output VGA-1 using monitor section 2243SWX
[ 40725.745] (II) NOUVEAU(0): Output VGA-2 has no monitor section
[ 40725.853] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[ 40725.853] (II) NOUVEAU(0): Output TV-1 has no monitor section
[ 40725.912] (II) NOUVEAU(0): EDID for output VGA-1
[ 40725.972] (II) NOUVEAU(0): EDID for output VGA-2
[ 40726.080] (II) NOUVEAU(0): EDID for output DVI-D-1
[ 40726.080] (II) NOUVEAU(0): Manufacturer: SAM  Model: 4e7  Serial#: 1297691186
[ 40726.080] (II) NOUVEAU(0): Year: 2009  Week: 14
[ 40726.080] (II) NOUVEAU(0): EDID Version: 1.3
[ 40726.080] (II) NOUVEAU(0): Digital Display Input
[ 40726.080] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 48  vert.: 27
[ 40726.080] (II) NOUVEAU(0): Gamma: 2.20
[ 40726.080] (II) NOUVEAU(0): DPMS capabilities: Off
[ 40726.080] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[ 40726.080] (II) NOUVEAU(0): First detailed timing is preferred mode
[ 40726.080] (II) NOUVEAU(0): redX: 0.649 redY: 0.335   greenX: 0.283 greenY: 0.605
[ 40726.080] (II) NOUVEAU(0): blueX: 0.151 blueY: 0.073   whiteX: 0.312 whiteY: 0.329
[ 40726.080] (II) NOUVEAU(0): Supported established timings:
[ 40726.080] (II) NOUVEAU(0): 640x480@60Hz
[ 40726.080] (II) NOUVEAU(0): 800x600@56Hz
[ 40726.080] (II) NOUVEAU(0): 800x600@60Hz
[ 40726.080] (II) NOUVEAU(0): 1024x768@60Hz
[ 40726.080] (II) NOUVEAU(0): Manufacturer's mask: 0
[ 40726.080] (II) NOUVEAU(0): Supported standard timings:
[ 40726.080] (II) NOUVEAU(0): #0: hsize: 1280  vsize 800  refresh: 60  vid: 129
[ 40726.080] (II) NOUVEAU(0): #1: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[ 40726.080] (II) NOUVEAU(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[ 40726.080] (II) NOUVEAU(0): #3: hsize: 1440  vsize 900  refresh: 60  vid: 149
[ 40726.080] (II) NOUVEAU(0): #4: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[ 40726.080] (II) NOUVEAU(0): #5: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[ 40726.080] (II) NOUVEAU(0): Supported detailed timing:
[ 40726.080] (II) NOUVEAU(0): clock: 138.5 MHz   Image Size:  477 x 268 mm
[ 40726.080] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[ 40726.080] (II) NOUVEAU(0): v_active: 1080  v_sync: 1083  v_sync_end 1088 v_blanking: 1111 v_border: 0
[ 40726.080] (II) NOUVEAU(0): Ranges: V min: 56 V max: 61 Hz, H min: 30 H max: 75 kHz, PixClock max 175 MHz
[ 40726.080] (II) NOUVEAU(0): Monitor name: SyncMaster
[ 40726.080] (II) NOUVEAU(0): Serial No: H9NS400521
[ 40726.080] (II) NOUVEAU(0): EDID (in hex):
[ 40726.080] (II) NOUVEAU(0): 	00ffffffffffff004c2de7043232594d
[ 40726.081] (II) NOUVEAU(0): 	0e13010380301b782a78f1a655489b26
[ 40726.081] (II) NOUVEAU(0): 	1250542308008100814081809500b300
[ 40726.081] (II) NOUVEAU(0): 	a940010101011a3680a070381f403020
[ 40726.081] (II) NOUVEAU(0): 	3500dd0c1100001a000000fd00383d1e
[ 40726.081] (II) NOUVEAU(0): 	4b11000a202020202020000000fc0053
[ 40726.081] (II) NOUVEAU(0): 	796e634d61737465720a2020000000ff
[ 40726.081] (II) NOUVEAU(0): 	0048394e533430303532310a20200094
[ 40726.081] (II) NOUVEAU(0): Printing probed modes for output DVI-D-1
[ 40726.081] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 40726.081] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 40726.081] (II) NOUVEAU(0): EDID for output TV-1
[ 40726.081] (II) NOUVEAU(0): Output VGA-1 disconnected
[ 40726.081] (II) NOUVEAU(0): Output VGA-2 disconnected
[ 40726.081] (II) NOUVEAU(0): Output DVI-D-1 connected
[ 40726.081] (II) NOUVEAU(0): Output TV-1 disconnected
[ 40726.081] (II) NOUVEAU(0): Using user preference for initial modes
[ 40726.081] (II) NOUVEAU(0): Output DVI-D-1 using initial mode 1920x1080
[ 40726.081] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[ 40726.081] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[ 40726.081] (**) NOUVEAU(0):  Driver mode "1920x1080": 138.5 MHz (scaled from 0.0 MHz), 66.6 kHz, 59.9 Hz
[ 40726.081] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 40726.081] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
[ 40726.081] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "1280x800": 83.5 MHz (scaled from 0.0 MHz), 49.7 kHz, 59.8 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 40726.082] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[ 40726.082] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 40726.082] (**) NOUVEAU(0): Display dimensions: (477, 268) mm
[ 40726.082] (**) NOUVEAU(0): DPI set to (102, 102)
[ 40726.082] (II) Loading sub module "fb"
[ 40726.082] (II) LoadModule: "fb"
[ 40726.082] (II) Loading /usr/lib/xorg/modules/libfb.so
[ 40726.083] (II) Module fb: vendor="X.Org Foundation"
[ 40726.083] 	compiled for 1.9.4.901, module version = 1.0.0
[ 40726.083] 	ABI class: X.Org ANSI C Emulation, version 0.4
[ 40726.083] (II) Loading sub module "exa"
[ 40726.083] (II) LoadModule: "exa"
[ 40726.083] (II) Loading /usr/lib/xorg/modules/libexa.so
[ 40726.083] (II) Module exa: vendor="X.Org Foundation"
[ 40726.083] 	compiled for 1.9.4.901, module version = 2.5.0
[ 40726.083] 	ABI class: X.Org Video Driver, version 8.0
[ 40726.083] (II) Loading sub module "shadowfb"
[ 40726.083] (II) LoadModule: "shadowfb"
[ 40726.083] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[ 40726.084] (II) Module shadowfb: vendor="X.Org Foundation"
[ 40726.084] 	compiled for 1.9.4.901, module version = 1.0.0
[ 40726.084] 	ABI class: X.Org ANSI C Emulation, version 0.4
[ 40726.084] (--) Depth 24 pixmap format is 32 bpp
[ 40726.085] (II) NOUVEAU(0): Opened GPU channel 1
[ 40726.086] (II) NOUVEAU(0): [DRI2] Setup complete
[ 40726.086] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[ 40726.087] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
[ 40726.087] 
Fatal server error:
[ 40726.087] AddScreen/ScreenInit failed for driver 0
[ 40726.087] 
[ 40726.087] 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
[ 40726.087] Please also check the log file at "/var/log/Xorg.0.log" for additional information.
[ 40726.087] 
