From: Erwin Rieger <er-ri-hi6Y0CQ0nG0@public.gmane.org>
Subject: Kernel-BUG on resume from suspen-to-ram with NV GeForce
	Go 7600
Date: Tue, 23 Aug 2011 16:28:45 +0200
Message-ID: <1314109725.6956.73.camel@venus.ibrieger.local>
Reply-To: er-ri-hi6Y0CQ0nG0@public.gmane.org
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

Hello,

i'am trying to get suspend/resume working on a (old) asus A7T notebook
(NV GeForce Go 7600 GPU).

Suspend is OK, laptop goes to sleep and power-led is blinking.

Upon resume, the laptop and backlight are starting, but there is no
screen output (blank/black screen).

After some (stuck-) time i'am able to ssh to it and it seems to working
okay - apart from the blank screen.

Dmesg shows some "soft lockup, CPU stuck" errors, related to nouveau-drm
(i think), see attached dmesg-output.

There is no X11 involved (yet) - pure framebuffer-console.

Kernel is from freedesktop-git, version "3.1.0-rc2+ #8 SMP Tue Aug 23
08:14:54 UTC 2011".

Should this old hardware work / is it supported by current nouveau?

If more info/logs is needed - please let me know.

Thanks

============================== DMESG ==============================

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.1.0-rc2+ (root@l28) (gcc version 4.6.1 (Debian 4.6.1-4) ) #8 SMP Tue Aug 23 08:14:54 UTC 2011
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
[    0.000000]  BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 000000003ffc0000 (usable)
[    0.000000]  BIOS-e820: 000000003ffc0000 - 000000003ffce000 (ACPI data)
[    0.000000]  BIOS-e820: 000000003ffce000 - 000000003fff0000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000003fff0000 - 0000000040000000 (reserved)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fef00000 (reserved)
[    0.000000]  BIOS-e820: 00000000ff780000 - 0000000100000000 (reserved)
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI present.
[    0.000000] DMI: ASUSTeK Computer INC. A7T/A7T, BIOS 0803    11/07/2008
[    0.000000] e820 update range: 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
[    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
[    0.000000] last_pfn = 0x3ffc0 max_arch_pfn = 0x1000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-EFFFF uncachable
[    0.000000]   F0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0000000000 mask FFC0000000 write-back
[    0.000000]   1 disabled
[    0.000000]   2 disabled
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] found SMP MP-table at [c00ff780] ff780
[    0.000000] initial memory mapped : 0 - 01a00000
[    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
[    0.000000] init_memory_mapping: 0000000000000000-00000000379fe000
[    0.000000]  0000000000 - 0000200000 page 4k
[    0.000000]  0000200000 - 0037800000 page 2M
[    0.000000]  0037800000 - 00379fe000 page 4k
[    0.000000] kernel direct mapping tables up to 379fe000 @ 19fa000-1a00000
[    0.000000] RAMDISK: 3f60c000 - 3ffc0000
[    0.000000] Allocated new RAMDISK: 3704a000 - 379fd033
[    0.000000] Move RAMDISK from 000000003f60c000 - 000000003ffbf032 to 3704a000 - 379fd032
[    0.000000] ACPI: RSDP 000fb3e0 00014 (v00 ACPIAM)
[    0.000000] ACPI: RSDT 3ffc0000 00040 (v01 _ASUS_ Notebook 11000807 MSFT 00000097)
[    0.000000] ACPI: FACP 3ffc0200 00084 (v02 A_M_I_ OEMFACP  11000807 MSFT 00000097)
[    0.000000] ACPI: DSDT 3ffc05f0 06EA4 (v01  A0463 A0463000 00000000 INTL 20051117)
[    0.000000] ACPI: FACS 3ffce000 00040
[    0.000000] ACPI: APIC 3ffc0390 00070 (v01 A_M_I_ OEMAPIC  11000807 MSFT 00000097)
[    0.000000] ACPI: MCFG 3ffc0400 0003C (v01 A_M_I_ OEMMCFG  11000807 MSFT 00000097)
[    0.000000] ACPI: SLIC 3ffc0440 00176 (v01 _ASUS_ Notebook 11000807 MSFT 00000097)
[    0.000000] ACPI: BOOT 3ffc05c0 00028 (v01 A_M_I_ OEMBOOT  11000807 MSFT 00000097)
[    0.000000] ACPI: OEMB 3ffce040 00061 (v01 A_M_I_ AMI_OEM  11000807 MSFT 00000097)
[    0.000000] ACPI: HPET 3ffc74a0 00038 (v01 A_M_I_ OEMHPET0 11000807 MSFT 00000097)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] 133MB HIGHMEM available.
[    0.000000] 889MB LOWMEM available.
[    0.000000]   mapped low ram: 0 - 379fe000
[    0.000000]   low ram: 0 - 379fe000
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000010 -> 0x00001000
[    0.000000]   Normal   0x00001000 -> 0x000379fe
[    0.000000]   HighMem  0x000379fe -> 0x0003ffc0
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[2] active PFN ranges
[    0.000000]     0: 0x00000010 -> 0x0000009f
[    0.000000]     0: 0x00000100 -> 0x0003ffc0
[    0.000000] On node 0 totalpages: 261967
[    0.000000] free_area_init_node: node 0, pgdat c1413e00, node_mem_map f6849200
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3951 pages, LIFO batch:0
[    0.000000]   Normal zone: 1748 pages used for memmap
[    0.000000]   Normal zone: 221994 pages, LIFO batch:31
[    0.000000]   HighMem zone: 268 pages used for memmap
[    0.000000]   HighMem zone: 33974 pages, LIFO batch:7
[    0.000000] Using APIC driver default
[    0.000000] Detected use of extended apic ids on hypertransport bus
[    0.000000] ACPI: PM-Timer IO Port: 0x508
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 17, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 14 global_irq 14 high edge)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 15 global_irq 15 high edge)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] ACPI: IRQ14 used by override.
[    0.000000] ACPI: IRQ15 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x10de8201 base: 0xfed00000
[    0.000000] SMP: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: 000000000009f000 - 00000000000a0000
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 00000000000e0000
[    0.000000] PM: Registered nosave memory: 00000000000e0000 - 0000000000100000
[    0.000000] Allocating PCI resources starting at 40000000 (gap: 40000000:bec00000)
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:32 nr_cpumask_bits:32 nr_cpu_ids:2 nr_node_ids:1
[    0.000000] PERCPU: Embedded 13 pages/cpu @f6600000 s31744 r0 d21504 u1048576
[    0.000000] pcpu-alloc: s31744 r0 d21504 u1048576 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 259919
[    0.000000] Kernel command line: auto BOOT_IMAGE=linux-3.1.0-rc2 ro root=802
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Initializing CPU#0
[    0.000000] allocated 4193024 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
[    0.000000] Initializing HighMem for node 0 (000379fe:0003ffc0)
[    0.000000] Memory: 1019464k/1048320k available (2759k kernel code, 28404k reserved, 1446k data, 404k init, 136968k highmem)
[    0.000000] virtual kernel memory layout:
[    0.000000]     fixmap  : 0xffd36000 - 0xfffff000   (2852 kB)
[    0.000000]     pkmap   : 0xffa00000 - 0xffc00000   (2048 kB)
[    0.000000]     vmalloc : 0xf81fe000 - 0xff9fe000   ( 120 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf79fe000   ( 889 MB)
[    0.000000]       .init : 0xc141c000 - 0xc1481000   ( 404 kB)
[    0.000000]       .data : 0xc12b1cac - 0xc141b4c0   (1446 kB)
[    0.000000]       .text : 0xc1000000 - 0xc12b1cac   (2759 kB)
[    0.000000] Checking if this processor honours the WP bit even in supervisor mode...Ok.
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU dyntick-idle grace-period acceleration is enabled.
[    0.000000] NR_IRQS:1280
[    0.000000] CPU 0 irqstacks, hard=f5c0a000 soft=f5c0c000
[    0.000000] spurious 8259A interrupt: IRQ7.
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] hpet clockevent registered
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 1607.568 MHz processor.
[    0.000000] Marking TSC unstable due to TSCs unsynchronized
[    0.004050] Calibrating delay loop (skipped), value calculated using timer frequency.. 3215.13 BogoMIPS (lpj=6430272)
[    0.004145] pid_max: default: 32768 minimum: 301
[    0.004260] Security Framework initialized
[    0.004308] SELinux:  Disabled at boot.
[    0.004386] Mount-cache hash table entries: 512
[    0.004883] Initializing cgroup subsys cpuacct
[    0.004967] Initializing cgroup subsys memory
[    0.005033] Initializing cgroup subsys devices
[    0.005080] Initializing cgroup subsys freezer
[    0.005126] Initializing cgroup subsys net_cls
[    0.005173] Initializing cgroup subsys blkio
[    0.005255] CPU: Physical Processor ID: 0
[    0.005302] CPU: Processor Core ID: 0
[    0.005348] mce: CPU supports 5 MCE banks
[    0.005403] using AMD E400 aware idle routine
[    0.005790] ACPI: Core revision 20110623
[    0.008338] ACPI Error: Found unknown opcode 0xFD at AML address f8215e64 offset 0x5850, ignoring (20110623/psloop-141)
[    0.008477] ACPI Error: Found unknown opcode 0xFD at AML address f8215f13 offset 0x58FF, ignoring (20110623/psloop-141)
[    0.010944] ACPI Error: Found unknown opcode 0xFD at AML address f8215e64 offset 0x5850, ignoring (20110623/psloop-141)
[    0.011086] ACPI Error: Found unknown opcode 0xFD at AML address f8215f13 offset 0x58FF, ignoring (20110623/psloop-141)
[    0.012067] Enabling APIC mode:  Flat.  Using 1 I/O APICs
[    0.012746] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.053197] CPU0: AMD Turion(tm) 64 X2 Mobile Technology TL-52 stepping 02
[    0.056003] Performance Events: AMD PMU driver.
[    0.056003] ... version:                0
[    0.056003] ... bit width:              48
[    0.056003] ... generic registers:      4
[    0.056003] ... value mask:             0000ffffffffffff
[    0.056003] ... max period:             00007fffffffffff
[    0.056003] ... fixed-purpose events:   0
[    0.056003] ... event mask:             000000000000000f
[    0.056003] NMI watchdog enabled, takes one hw-pmu counter.
[    0.056003] CPU 1 irqstacks, hard=f5c94000 soft=f5c96000
[    0.056003] Booting Node   0, Processors  #1 Ok.
[    0.056003] smpboot cpu 1: start_ip = 9b000
[    0.008000] Initializing CPU#1
[    0.140153] NMI watchdog enabled, takes one hw-pmu counter.
[    0.140142] System has AMD C1E enabled
[    0.140142] Switch to broadcast mode on CPU1
[    0.140373] Brought up 2 CPUs
[    0.140421] Total of 2 processors activated (6429.77 BogoMIPS).
[    0.141169] Switch to broadcast mode on CPU0
[    0.141169] devtmpfs: initialized
[    0.141169] PM: Registering ACPI NVS region at 3ffce000 (139264 bytes)
[    0.141169] print_constraints: dummy: 
[    0.141169] NET: Registered protocol family 16
[    0.141169] node 0 link 0: io port [1000, ffffff]
[    0.141169] TOM: 0000000040000000 aka 1024M
[    0.141169] node 0 link 0: mmio [e0000000, efffffff]
[    0.141169] node 0 link 0: mmio [a0000, bffff]
[    0.141169] node 0 link 0: mmio [40000000, fe0bffff]
[    0.141169] bus: [00, ff] on node 0 link 0
[    0.141169] bus: 00 index 0 [io  0x0000-0xffff]
[    0.141169] bus: 00 index 1 [mem 0x40000000-0xfcffffffff]
[    0.141169] bus: 00 index 2 [mem 0x000a0000-0x000bffff]
[    0.141169] ACPI: bus type pci registered
[    0.141169] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.141169] PCI: not using MMCONFIG
[    0.141692] PCI : PCI BIOS aera is rw and x. Use pci=nobios if you want it NX.
[    0.141838] PCI: PCI BIOS revision 3.00 entry at 0xf0031, last bus=5
[    0.141888] PCI: Using configuration type 1 for base access
[    0.144098] bio: create slab <bio-0> at 0
[    0.144182] ACPI: Added _OSI(Module Device)
[    0.144182] ACPI: Added _OSI(Processor Device)
[    0.144201] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.144250] ACPI: Added _OSI(Processor Aggregator Device)
[    0.145851] ACPI: EC: Look up EC in DSDT
[    0.147191] ACPI: Executed 1 blocks of module-level executable AML code
[    0.148739] ACPI: Interpreter enabled
[    0.148791] ACPI: (supports S0 S3 S4 S5)
[    0.152094] ACPI: Using IOAPIC for interrupt routing
[    0.152168] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.160810] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
[    0.160869] PCI: Using MMCONFIG for extended config space
[    0.169362] ACPI: EC: GPE = 0x20, I/O: command/status = 0x66, data = 0x62
[    0.169619] ACPI: No dock devices found.
[    0.169665] HEST: Table not found.
[    0.169711] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.169858] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.170089] pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7]
[    0.170139] pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff]
[    0.170188] pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff]
[    0.170246] pci_root PNP0A03:00: host bridge window [mem 0x000d0000-0x000dffff]
[    0.170303] pci_root PNP0A03:00: host bridge window [mem 0x40000000-0xdfffffff]
[    0.170378] pci 0000:00:00.0: [10de:02f7] type 0 class 0x000500
[    0.170433] pci 0000:00:00.1: [10de:02fa] type 0 class 0x000500
[    0.170473] pci 0000:00:00.2: [10de:02fe] type 0 class 0x000500
[    0.170519] pci 0000:00:00.3: [10de:02f8] type 0 class 0x000500
[    0.170567] pci 0000:00:00.4: [10de:02f9] type 0 class 0x000500
[    0.170614] pci 0000:00:00.5: [10de:02ff] type 0 class 0x000500
[    0.170659] pci 0000:00:00.6: [10de:027f] type 0 class 0x000500
[    0.170698] pci 0000:00:00.7: [10de:027e] type 0 class 0x000500
[    0.170750] pci 0000:00:02.0: [10de:02fc] type 1 class 0x000604
[    0.170782] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.170787] pci 0000:00:02.0: PME# disabled
[    0.170806] pci 0000:00:03.0: [10de:02fd] type 1 class 0x000604
[    0.170835] pci 0000:00:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.170839] pci 0000:00:03.0: PME# disabled
[    0.170858] pci 0000:00:04.0: [10de:02fb] type 1 class 0x000604
[    0.170887] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.170892] pci 0000:00:04.0: PME# disabled
[    0.170932] pci 0000:00:09.0: [10de:0270] type 0 class 0x000500
[    0.171134] pci 0000:00:0a.0: [10de:0260] type 0 class 0x000601
[    0.171209] pci 0000:00:0a.1: [10de:0264] type 0 class 0x000c05
[    0.171260] pci 0000:00:0a.1: reg 20: [io  0x0700-0x073f]
[    0.171272] pci 0000:00:0a.1: reg 24: [io  0x0600-0x063f]
[    0.171307] pci 0000:00:0a.1: PME# supported from D3hot D3cold
[    0.171314] pci 0000:00:0a.1: PME# disabled
[    0.171342] pci 0000:00:0a.3: [10de:0271] type 0 class 0x000b40
[    0.171366] pci 0000:00:0a.3: reg 10: [mem 0xdcec0000-0xdcefffff]
[    0.171505] pci 0000:00:0b.0: [10de:026d] type 0 class 0x000c03
[    0.171806] pci 0000:00:0b.0: reg 10: [mem 0xdcebe000-0xdcebefff]
[    0.171865] pci 0000:00:0b.0: supports D1 D2
[    0.171869] pci 0000:00:0b.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.171874] pci 0000:00:0b.0: PME# disabled
[    0.171896] pci 0000:00:0b.1: [10de:026e] type 0 class 0x000c03
[    0.171915] pci 0000:00:0b.1: reg 10: [mem 0xdcebfc00-0xdcebfcff]
[    0.171977] pci 0000:00:0b.1: supports D1 D2
[    0.171980] pci 0000:00:0b.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.171986] pci 0000:00:0b.1: PME# disabled
[    0.172031] pci 0000:00:0d.0: [10de:0265] type 0 class 0x000101
[    0.172071] pci 0000:00:0d.0: reg 20: [io  0xffa0-0xffaf]
[    0.172122] pci 0000:00:0e.0: [10de:0266] type 0 class 0x000101
[    0.172142] pci 0000:00:0e.0: reg 10: [io  0xc800-0xc807]
[    0.172152] pci 0000:00:0e.0: reg 14: [io  0xc480-0xc483]
[    0.172162] pci 0000:00:0e.0: reg 18: [io  0xc400-0xc407]
[    0.172172] pci 0000:00:0e.0: reg 1c: [io  0xc080-0xc083]
[    0.172182] pci 0000:00:0e.0: reg 20: [io  0xc000-0xc00f]
[    0.172192] pci 0000:00:0e.0: reg 24: [mem 0xdcebd000-0xdcebdfff]
[    0.172245] pci 0000:00:10.0: [10de:026f] type 1 class 0x000604
[    0.172315] pci 0000:00:10.1: [10de:026c] type 0 class 0x000403
[    0.172336] pci 0000:00:10.1: reg 10: [mem 0xdceb8000-0xdcebbfff]
[    0.172404] pci 0000:00:10.1: PME# supported from D3hot D3cold
[    0.172410] pci 0000:00:10.1: PME# disabled
[    0.172445] pci 0000:00:18.0: [1022:1100] type 0 class 0x000600
[    0.172470] pci 0000:00:18.1: [1022:1101] type 0 class 0x000600
[    0.172492] pci 0000:00:18.2: [1022:1102] type 0 class 0x000600
[    0.172515] pci 0000:00:18.3: [1022:1103] type 0 class 0x000600
[    0.172584] pci 0000:01:00.0: [168c:001c] type 0 class 0x000200
[    0.172604] pci 0000:01:00.0: reg 10: [mem 0xdcff0000-0xdcffffff 64bit]
[    0.172683] pci 0000:01:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    0.172750] pci 0000:00:02.0: PCI bridge to [bus 01-01]
[    0.172801] pci 0000:00:02.0:   bridge window [mem 0xdcf00000-0xdcffffff]
[    0.172832] pci 0000:00:03.0: PCI bridge to [bus 02-03]
[    0.172881] pci 0000:00:03.0:   bridge window [io  0xd000-0xdfff]
[    0.172885] pci 0000:00:03.0:   bridge window [mem 0xbfc00000-0xbfcfffff]
[    0.172891] pci 0000:00:03.0:   bridge window [mem 0xbfd00000-0xbfdfffff 64bit pref]
[    0.172930] pci 0000:04:00.0: [10de:0398] type 0 class 0x000300
[    0.172941] pci 0000:04:00.0: reg 10: [mem 0xde000000-0xdeffffff]
[    0.172953] pci 0000:04:00.0: reg 14: [mem 0xc0000000-0xcfffffff 64bit pref]
[    0.172964] pci 0000:04:00.0: reg 1c: [mem 0xdd000000-0xddffffff 64bit]
[    0.172972] pci 0000:04:00.0: reg 24: [io  0xdc00-0xdc7f]
[    0.172981] pci 0000:04:00.0: reg 30: [mem 0xdfee0000-0xdfefffff pref]
[    0.173008] pci 0000:04:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    0.173072] pci 0000:00:04.0: PCI bridge to [bus 04-04]
[    0.173122] pci 0000:00:04.0:   bridge window [io  0xd000-0xdfff]
[    0.173126] pci 0000:00:04.0:   bridge window [mem 0xdd000000-0xdfefffff]
[    0.173132] pci 0000:00:04.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
[    0.173174] pci 0000:05:00.0: [10ec:8169] type 0 class 0x000200
[    0.173195] pci 0000:05:00.0: reg 10: [io  0xe800-0xe8ff]
[    0.173208] pci 0000:05:00.0: reg 14: [mem 0xdffffc00-0xdffffcff]
[    0.173255] pci 0000:05:00.0: reg 30: [mem 0xdffc0000-0xdffdffff pref]
[    0.173277] pci 0000:05:00.0: supports D1 D2
[    0.173280] pci 0000:05:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.173286] pci 0000:05:00.0: PME# disabled
[    0.173308] pci 0000:05:01.0: [1180:0832] type 0 class 0x000c00
[    0.173329] pci 0000:05:01.0: reg 10: [mem 0xdfffe800-0xdfffefff]
[    0.173401] pci 0000:05:01.0: PME# supported from D0 D3hot D3cold
[    0.173407] pci 0000:05:01.0: PME# disabled
[    0.173428] pci 0000:05:01.1: [1180:0822] type 0 class 0x000805
[    0.173447] pci 0000:05:01.1: reg 10: [mem 0xdffff000-0xdffff0ff]
[    0.173518] pci 0000:05:01.1: supports D1 D2
[    0.173522] pci 0000:05:01.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.173528] pci 0000:05:01.1: PME# disabled
[    0.173549] pci 0000:05:01.2: [1180:0592] type 0 class 0x000880
[    0.173569] pci 0000:05:01.2: reg 10: [mem 0xdffff400-0xdffff4ff]
[    0.173640] pci 0000:05:01.2: supports D1 D2
[    0.173643] pci 0000:05:01.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.173649] pci 0000:05:01.2: PME# disabled
[    0.173670] pci 0000:05:01.3: [1180:0852] type 0 class 0x000880
[    0.173689] pci 0000:05:01.3: reg 10: [mem 0xdffff800-0xdffff8ff]
[    0.173760] pci 0000:05:01.3: supports D1 D2
[    0.173763] pci 0000:05:01.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.173769] pci 0000:05:01.3: PME# disabled
[    0.173823] pci 0000:00:10.0: PCI bridge to [bus 05-05] (subtractive decode)
[    0.173874] pci 0000:00:10.0:   bridge window [io  0xe000-0xefff]
[    0.173879] pci 0000:00:10.0:   bridge window [mem 0xdff00000-0xdfffffff]
[    0.173885] pci 0000:00:10.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
[    0.173889] pci 0000:00:10.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
[    0.173896] pci 0000:00:10.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
[    0.173901] pci 0000:00:10.0:   bridge window [mem 0x000d0000-0x000dffff] (subtractive decode)
[    0.173906] pci 0000:00:10.0:   bridge window [mem 0x40000000-0xdfffffff] (subtractive decode)
[    0.173920] pci_bus 0000:00: on NUMA node 0
[    0.173925] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.174083] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P8._PRT]
[    0.174130] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0PA._PRT]
[    0.174212] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
[    0.174275] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P9._PRT]
[    0.174329]  pci0000:00: Requesting ACPI _OSC control (0x1d)
[    0.174378]  pci0000:00: ACPI _OSC request failed (AE_NOT_FOUND), returned control mask: 0x1d
[    0.174436] ACPI _OSC control for PCIe not granted, disabling ASPM
[    0.184039] ACPI: PCI Interrupt Link [LNKA] (IRQs 16 17 18 19) *11
[    0.184367] ACPI: PCI Interrupt Link [LNKB] (IRQs 16 17 18 19) *5
[    0.184690] ACPI: PCI Interrupt Link [LNKC] (IRQs 16 17 18 19) *5
[    0.185013] ACPI: PCI Interrupt Link [LNKD] (IRQs 16 17 18 19) *0, disabled.
[    0.185364] ACPI: PCI Interrupt Link [LNEA] (IRQs 16 17 18 19) *11
[    0.185688] ACPI: PCI Interrupt Link [LNEB] (IRQs 16 17 18 19) *5
[    0.186012] ACPI: PCI Interrupt Link [LNEC] (IRQs 16 17 18 19) *0, disabled.
[    0.186364] ACPI: PCI Interrupt Link [LNED] (IRQs 16 17 18 19) *0, disabled.
[    0.186714] ACPI: PCI Interrupt Link [LUB0] (IRQs 20 21 22 23) *11
[    0.187046] ACPI: PCI Interrupt Link [LUB2] (IRQs 20 21 22 23) *14
[    0.187370] ACPI: PCI Interrupt Link [LMAC] (IRQs 20 21 22 23) *0, disabled.
[    0.187722] ACPI: PCI Interrupt Link [LAZA] (IRQs 20 21 22 23) *5
[    0.188063] ACPI: PCI Interrupt Link [LACI] (IRQs 20 21 22 23) *0, disabled.
[    0.188415] ACPI: PCI Interrupt Link [LMC9] (IRQs 20 21 22 23) *0, disabled.
[    0.188768] ACPI: PCI Interrupt Link [LSMB] (IRQs 20 21 22 23) *7
[    0.189092] ACPI: PCI Interrupt Link [LPMU] (IRQs 20 21 22 23) *5
[    0.189417] ACPI: PCI Interrupt Link [LSA0] (IRQs 20 21 22 23) *5
[    0.189750] ACPI: PCI Interrupt Link [LSA1] (IRQs 20 21 22 23) *0, disabled.
[    0.190121] ACPI: PCI Interrupt Link [LATA] (IRQs 20 21 22 23) *0, disabled.
[    0.192061] vgaarb: device added: PCI:0000:04:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.192116] vgaarb: loaded
[    0.192154] vgaarb: bridge control possible 0000:04:00.0
[    0.192251] PCI: Using ACPI for IRQ routing
[    0.192322] PCI: pci_cache_line_size set to 64 bytes
[    0.192330] pci 0000:00:04.0: address space collision: [io  0xd000-0xdfff] conflicts with PCI Bus 0000:02 [io  0xd000-0xdfff]
[    0.192431] pci 0000:04:00.0: no compatible bridge window for [io  0xdc00-0xdc7f]
[    0.192538] reserve RAM buffer: 000000000009fc00 - 000000000009ffff 
[    0.192543] reserve RAM buffer: 000000003ffc0000 - 000000003fffffff 
[    0.192709] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
[    0.192759] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 31
[    0.192904] hpet0: 3 comparators, 32-bit 25.000000 MHz counter
[    0.204084] Switching to clocksource hpet
[    0.206345] pnp: PnP ACPI init
[    0.206404] ACPI: bus type pnp registered
[    0.206586] pnp 00:00: [bus 00-ff]
[    0.206590] pnp 00:00: [io  0x0cf8-0x0cff]
[    0.206594] pnp 00:00: [io  0x0000-0x0cf7 window]
[    0.206598] pnp 00:00: [io  0x0d00-0xffff window]
[    0.206602] pnp 00:00: [mem 0x000a0000-0x000bffff window]
[    0.206606] pnp 00:00: [mem 0x000d0000-0x000dffff window]
[    0.206610] pnp 00:00: [mem 0x40000000-0xdfffffff window]
[    0.206693] pnp 00:00: Plug and Play ACPI device, IDs PNP0a03 (active)
[    0.206731] pnp 00:01: [dma 4]
[    0.206735] pnp 00:01: [io  0x0000-0x000f]
[    0.206738] pnp 00:01: [io  0x0081-0x0083]
[    0.206742] pnp 00:01: [io  0x0087]
[    0.206746] pnp 00:01: [io  0x0089-0x008b]
[    0.206749] pnp 00:01: [io  0x008f]
[    0.206753] pnp 00:01: [io  0x00c0-0x00df]
[    0.206791] pnp 00:01: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.206807] pnp 00:02: [io  0x0070-0x0071]
[    0.206824] pnp 00:02: [irq 8]
[    0.206857] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.206897] pnp 00:03: [io  0x0060]
[    0.206901] pnp 00:03: [io  0x0064]
[    0.206912] pnp 00:03: [irq 1]
[    0.206947] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 PNP030b (active)
[    0.207008] pnp 00:04: [irq 12]
[    0.207044] pnp 00:04: Plug and Play ACPI device, IDs SYN0a06 PNP0f13 (active)
[    0.207057] pnp 00:05: [io  0x0061]
[    0.207098] pnp 00:05: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.207112] pnp 00:06: [io  0x00f0-0x00ff]
[    0.207122] pnp 00:06: [irq 13]
[    0.207158] pnp 00:06: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.207362] pnp 00:07: [io  0x0000-0xffffffffffffffff disabled]
[    0.207366] pnp 00:07: [io  0x0280-0x028f]
[    0.207370] pnp 00:07: [io  0x0290-0x029f]
[    0.207373] pnp 00:07: [io  0x02a0-0x02af]
[    0.207377] pnp 00:07: [io  0x02b0-0x02bf]
[    0.207472] system 00:07: [io  0x0280-0x028f] has been reserved
[    0.207515] system 00:07: [io  0x0290-0x029f] has been reserved
[    0.207558] system 00:07: [io  0x02a0-0x02af] has been reserved
[    0.207600] system 00:07: [io  0x02b0-0x02bf] has been reserved
[    0.207642] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.207679] pnp 00:08: [mem 0x00000000-0xffffffffffffffff disabled]
[    0.207752] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.207862] Switched to NOHz mode on CPU #1
[    0.207873] Switched to NOHz mode on CPU #0
[    0.207987] pnp 00:09: [mem 0x000d0000-0x000d3fff window]
[    0.207991] pnp 00:09: [mem 0x000d4000-0x000d7fff window]
[    0.207995] pnp 00:09: [mem 0x000de000-0x000dffff window]
[    0.208013] pnp 00:09: [io  0x0010-0x001f]
[    0.208016] pnp 00:09: [io  0x0022-0x003f]
[    0.208020] pnp 00:09: [io  0x0044-0x005f]
[    0.208023] pnp 00:09: [io  0x0062-0x0063]
[    0.208027] pnp 00:09: [io  0x0065-0x006f]
[    0.208030] pnp 00:09: [io  0x0072-0x007f]
[    0.208034] pnp 00:09: [io  0x0080]
[    0.208037] pnp 00:09: [io  0x0084-0x0086]
[    0.208041] pnp 00:09: [io  0x0088]
[    0.208044] pnp 00:09: [io  0x008c-0x008e]
[    0.208048] pnp 00:09: [io  0x0090-0x009f]
[    0.208051] pnp 00:09: [io  0x00a2-0x00bf]
[    0.208055] pnp 00:09: [io  0x00e0-0x00ef]
[    0.208058] pnp 00:09: [io  0x04d0-0x04d1]
[    0.208062] pnp 00:09: [io  0x0800-0x080f]
[    0.208065] pnp 00:09: [io  0x0500-0x057f]
[    0.208069] pnp 00:09: [io  0x0580-0x05ff]
[    0.208073] pnp 00:09: [io  0x0800-0x087f]
[    0.208076] pnp 00:09: [io  0x0880-0x08ff]
[    0.208080] pnp 00:09: [io  0x0900-0x097f]
[    0.208083] pnp 00:09: [io  0x0980-0x09ff]
[    0.208087] pnp 00:09: [mem 0x00000000-0xffffffffffffffff disabled]
[    0.208091] pnp 00:09: [mem 0xfee01000-0xfeefffff]
[    0.208153] pnp 00:09: disabling [io  0x0010-0x001f] because it overlaps 0000:04:00.0 BAR 5 [io  0x0000-0x007f]
[    0.208209] pnp 00:09: disabling [io  0x0022-0x003f] because it overlaps 0000:04:00.0 BAR 5 [io  0x0000-0x007f]
[    0.208263] pnp 00:09: disabling [io  0x0044-0x005f] because it overlaps 0000:04:00.0 BAR 5 [io  0x0000-0x007f]
[    0.208318] pnp 00:09: disabling [io  0x0062-0x0063] because it overlaps 0000:04:00.0 BAR 5 [io  0x0000-0x007f]
[    0.208373] pnp 00:09: disabling [io  0x0065-0x006f] because it overlaps 0000:04:00.0 BAR 5 [io  0x0000-0x007f]
[    0.208427] pnp 00:09: disabling [io  0x0072-0x007f] because it overlaps 0000:04:00.0 BAR 5 [io  0x0000-0x007f]
[    0.208537] system 00:09: [io  0x04d0-0x04d1] has been reserved
[    0.208580] system 00:09: [io  0x0800-0x080f] has been reserved
[    0.208623] system 00:09: [io  0x0500-0x057f] has been reserved
[    0.208665] system 00:09: [io  0x0580-0x05ff] has been reserved
[    0.208708] system 00:09: [io  0x0800-0x087f] could not be reserved
[    0.208752] system 00:09: [io  0x0880-0x08ff] has been reserved
[    0.208794] system 00:09: [io  0x0900-0x097f] has been reserved
[    0.208836] system 00:09: [io  0x0980-0x09ff] has been reserved
[    0.208880] system 00:09: [mem 0x000d0000-0x000d3fff window] has been reserved
[    0.208931] system 00:09: [mem 0x000d4000-0x000d7fff window] has been reserved
[    0.208982] system 00:09: [mem 0x000de000-0x000dffff window] has been reserved
[    0.209034] system 00:09: [mem 0xfee01000-0xfeefffff] has been reserved
[    0.209077] system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.209131] pnp 00:0a: [mem 0xfed00000-0xfed003ff]
[    0.209170] pnp 00:0a: Plug and Play ACPI device, IDs PNP0103 (active)
[    0.209236] pnp 00:0b: [mem 0xfec00000-0xfec00fff]
[    0.209240] pnp 00:0b: [mem 0xfee00000-0xfee00fff]
[    0.209313] system 00:0b: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.209357] system 00:0b: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.209400] system 00:0b: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.210117] pnp 00:0c: [io  0x03f8-0x03ff]
[    0.210128] pnp 00:0c: [irq 4]
[    0.210132] pnp 00:0c: [dma 0 disabled]
[    0.210278] pnp 00:0c: Plug and Play ACPI device, IDs PNP0510 (active)
[    0.210943] pnp 00:0d: [io  0x03e0-0x03e7]
[    0.210954] pnp 00:0d: [irq 10]
[    0.211037] pnp 00:0d: Plug and Play ACPI device, IDs ITE8704 (active)
[    0.211099] pnp 00:0e: [mem 0xe0000000-0xefffffff]
[    0.211170] system 00:0e: [mem 0xe0000000-0xefffffff] has been reserved
[    0.211214] system 00:0e: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.211419] pnp 00:0f: [mem 0x00000000-0x0009ffff]
[    0.211423] pnp 00:0f: [mem 0x000c0000-0x000cffff]
[    0.211427] pnp 00:0f: [mem 0x000e0000-0x000fffff]
[    0.211431] pnp 00:0f: [mem 0x00100000-0x3fffffff]
[    0.211434] pnp 00:0f: [mem 0xe0000000-0xffffffff]
[    0.211518] system 00:0f: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.211563] system 00:0f: [mem 0x000c0000-0x000cffff] could not be reserved
[    0.211606] system 00:0f: [mem 0x000e0000-0x000fffff] could not be reserved
[    0.211650] system 00:0f: [mem 0x00100000-0x3fffffff] could not be reserved
[    0.211693] system 00:0f: [mem 0xe0000000-0xffffffff] could not be reserved
[    0.211737] system 00:0f: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.212167] pnp: PnP ACPI: found 16 devices
[    0.212207] ACPI: ACPI bus type pnp unregistered
[    0.212248] PnPBIOS: Disabled by ACPI PNP
[    0.251332] PCI: max bus depth: 1 pci_try_num: 2
[    0.251365] pci 0000:00:04.0: BAR 13: assigned [io  0x1000-0x1fff]
[    0.251408] pci 0000:00:02.0: PCI bridge to [bus 01-01]
[    0.251451] pci 0000:00:02.0:   bridge window [mem 0xdcf00000-0xdcffffff]
[    0.251496] pci 0000:00:03.0: PCI bridge to [bus 02-03]
[    0.251537] pci 0000:00:03.0:   bridge window [io  0xd000-0xdfff]
[    0.251580] pci 0000:00:03.0:   bridge window [mem 0xbfc00000-0xbfcfffff]
[    0.251624] pci 0000:00:03.0:   bridge window [mem 0xbfd00000-0xbfdfffff 64bit pref]
[    0.251677] pci 0000:04:00.0: BAR 5: assigned [io  0x1000-0x107f]
[    0.251722] pci 0000:04:00.0: BAR 5: set to [io  0x1000-0x107f] (PCI address [0x1000-0x107f])
[    0.251774] pci 0000:00:04.0: PCI bridge to [bus 04-04]
[    0.251815] pci 0000:00:04.0:   bridge window [io  0x1000-0x1fff]
[    0.251858] pci 0000:00:04.0:   bridge window [mem 0xdd000000-0xdfefffff]
[    0.251902] pci 0000:00:04.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
[    0.251956] pci 0000:00:10.0: PCI bridge to [bus 05-05]
[    0.252014] pci 0000:00:10.0:   bridge window [io  0xe000-0xefff]
[    0.252059] pci 0000:00:10.0:   bridge window [mem 0xdff00000-0xdfffffff]
[    0.252110] pci 0000:00:02.0: setting latency timer to 64
[    0.252116] pci 0000:00:03.0: enabling device (0004 -> 0007)
[    0.252159] pci 0000:00:03.0: setting latency timer to 64
[    0.252166] pci 0000:00:04.0: setting latency timer to 64
[    0.252172] pci 0000:00:10.0: setting latency timer to 64
[    0.252178] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    0.252182] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    0.252186] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.252190] pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff]
[    0.252194] pci_bus 0000:00: resource 8 [mem 0x40000000-0xdfffffff]
[    0.252198] pci_bus 0000:01: resource 1 [mem 0xdcf00000-0xdcffffff]
[    0.252202] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
[    0.252206] pci_bus 0000:02: resource 1 [mem 0xbfc00000-0xbfcfffff]
[    0.252211] pci_bus 0000:02: resource 2 [mem 0xbfd00000-0xbfdfffff 64bit pref]
[    0.252215] pci_bus 0000:04: resource 0 [io  0x1000-0x1fff]
[    0.252219] pci_bus 0000:04: resource 1 [mem 0xdd000000-0xdfefffff]
[    0.252223] pci_bus 0000:04: resource 2 [mem 0xc0000000-0xcfffffff 64bit pref]
[    0.252227] pci_bus 0000:05: resource 0 [io  0xe000-0xefff]
[    0.252231] pci_bus 0000:05: resource 1 [mem 0xdff00000-0xdfffffff]
[    0.252235] pci_bus 0000:05: resource 4 [io  0x0000-0x0cf7]
[    0.252239] pci_bus 0000:05: resource 5 [io  0x0d00-0xffff]
[    0.252243] pci_bus 0000:05: resource 6 [mem 0x000a0000-0x000bffff]
[    0.252247] pci_bus 0000:05: resource 7 [mem 0x000d0000-0x000dffff]
[    0.252251] pci_bus 0000:05: resource 8 [mem 0x40000000-0xdfffffff]
[    0.252339] NET: Registered protocol family 2
[    0.252515] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.253013] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.253763] TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
[    0.254161] TCP: Hash tables configured (established 131072 bind 65536)
[    0.254204] TCP reno registered
[    0.254243] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.254297] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.254543] NET: Registered protocol family 1
[    0.254646] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.254710] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.254780] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.732127] pci 0000:00:09.0: Found enabled HT MSI Mapping
[    0.732516] pci 0000:00:09.0: Found enabled HT MSI Mapping
[    0.732632] pci 0000:00:09.0: Found enabled HT MSI Mapping
[    0.732700] pci 0000:04:00.0: Boot video device
[    0.732706] PCI: CLS mismatch (64 != 32), using 64 bytes
[    0.732776] Unpacking initramfs...
[    1.115433] Freeing initrd memory: 9936k freed
[    1.121540] Simple Boot Flag at 0x78 set to 0x1
[    1.122186] audit: initializing netlink socket (disabled)
[    1.122249] type=2000 audit(1314098727.116:1): initialized
[    1.144379] highmem bounce pool size: 64 pages
[    1.144432] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    1.150214] VFS: Disk quotas dquot_6.5.2
[    1.150392] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.150610] msgmni has been set to 1743
[    1.150992] alg: No test for stdrng (krng)
[    1.151088] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    1.151149] io scheduler noop registered
[    1.151197] io scheduler deadline registered
[    1.151264] io scheduler cfq registered (default)
[    1.151447] pcieport 0000:00:02.0: setting latency timer to 64
[    1.151478] pcieport 0000:00:02.0: irq 40 for MSI/MSI-X
[    1.151530] pcieport 0000:00:03.0: setting latency timer to 64
[    1.151555] pcieport 0000:00:03.0: irq 41 for MSI/MSI-X
[    1.151606] pcieport 0000:00:04.0: setting latency timer to 64
[    1.151630] pcieport 0000:00:04.0: irq 42 for MSI/MSI-X
[    1.151846] ERST: Table is not found!
[    1.151907] isapnp: Scanning for PnP cards...
[    1.506036] isapnp: No Plug & Play device found
[    1.506200] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.526801] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    1.528562] Linux agpgart interface v0.103
[    1.529207] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    1.531195] i8042: Detected active multiplexing controller, rev 1.1
[    1.532603] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.532659] serio: i8042 AUX0 port at 0x60,0x64 irq 12
[    1.532745] serio: i8042 AUX1 port at 0x60,0x64 irq 12
[    1.532827] serio: i8042 AUX2 port at 0x60,0x64 irq 12
[    1.532910] serio: i8042 AUX3 port at 0x60,0x64 irq 12
[    1.533156] mousedev: PS/2 mouse device common for all mice
[    1.533271] rtc_cmos 00:02: RTC can wake from S4
[    1.533472] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    1.533565] rtc0: alarms up to one year, y3k, 114 bytes nvram, hpet irqs
[    1.533631] cpuidle: using governor ladder
[    1.533678] cpuidle: using governor menu
[    1.534100] TCP cubic registered
[    1.541355] NET: Registered protocol family 10
[    1.542368] Mobile IPv6
[    1.542415] NET: Registered protocol family 17
[    1.542466] Registering the dns_resolver key type
[    1.542541] Using IPI No-Shortcut mode
[    1.542770] PM: Hibernation image not present or could not be loaded.
[    1.542788] registered taskstats version 1
[    1.546014] rtc_cmos 00:02: setting system clock to 2011-08-23 11:25:28 UTC (1314098728)
[    1.546128] Initializing network drop monitor service
[    1.546334] Freeing unused kernel memory: 404k freed
[    1.546969] Write protecting the kernel text: 2760k
[    1.547064] Write protecting the kernel read-only data: 1036k
[    1.547111] NX-protecting the kernel data: 3384k
[    1.561789] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.566274] udevd[49]: starting version 172
[    1.625757] usbcore: registered new interface driver usbfs
[    1.625838] usbcore: registered new interface driver hub
[    1.625936] usbcore: registered new device driver usb
[    1.626611] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.626883] ACPI: PCI Interrupt Link [LUB2] enabled at IRQ 23
[    1.626947] ehci_hcd 0000:00:0b.1: PCI INT B -> Link[LUB2] -> GSI 23 (level, low) -> IRQ 23
[    1.627025] ehci_hcd 0000:00:0b.1: setting latency timer to 64
[    1.627030] ehci_hcd 0000:00:0b.1: EHCI Host Controller
[    1.627125] ehci_hcd 0000:00:0b.1: new USB bus registered, assigned bus number 1
[    1.627253] ehci_hcd 0000:00:0b.1: debug port 1
[    1.627310] ehci_hcd 0000:00:0b.1: cache line size of 64 is not supported
[    1.627343] ehci_hcd 0000:00:0b.1: irq 23, io mem 0xdcebfc00
[    1.636110] ehci_hcd 0000:00:0b.1: USB 2.0 started, EHCI 1.00
[    1.636224] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    1.636276] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.636335] usb usb1: Product: EHCI Host Controller
[    1.636384] usb usb1: Manufacturer: Linux 3.1.0-rc2+ ehci_hcd
[    1.636433] usb usb1: SerialNumber: 0000:00:0b.1
[    1.636691] hub 1-0:1.0: USB hub found
[    1.636743] hub 1-0:1.0: 8 ports detected
[    1.650998] SCSI subsystem initialized
[    1.653831] thermal LNXTHERM:00: registered as thermal_zone0
[    1.653886] ACPI: Thermal Zone [THRM] (56 C)
[    1.662774] libata version 3.00 loaded.
[    1.663393] sata_nv 0000:00:0e.0: version 3.5
[    1.663611] ACPI: PCI Interrupt Link [LSA0] enabled at IRQ 22
[    1.663680] sata_nv 0000:00:0e.0: PCI INT A -> Link[LSA0] -> GSI 22 (level, low) -> IRQ 22
[    1.663741] sata_nv 0000:00:0e.0: Using SWNCQ mode
[    1.663858] sata_nv 0000:00:0e.0: setting latency timer to 64
[    1.664379] scsi0 : sata_nv
[    1.668076] scsi1 : sata_nv
[    1.668326] ata1: SATA max UDMA/133 cmd 0xc800 ctl 0xc480 bmdma 0xc000 irq 22
[    1.668379] ata2: SATA max UDMA/133 cmd 0xc400 ctl 0xc080 bmdma 0xc008 irq 22
[    1.675088] pata_amd 0000:00:0d.0: version 0.4.1
[    1.675155] pata_amd 0000:00:0d.0: setting latency timer to 64
[    1.676084] scsi2 : pata_amd
[    1.676691] scsi3 : pata_amd
[    1.678147] ata3: PATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xffa0 irq 14
[    1.678199] ata4: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0xffa8 irq 15
[    1.680776] ata3: port disabled--ignoring
[    1.733395] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.733673] ACPI: PCI Interrupt Link [LUB0] enabled at IRQ 21
[    1.733728] ohci_hcd 0000:00:0b.0: PCI INT A -> Link[LUB0] -> GSI 21 (level, low) -> IRQ 21
[    1.733798] ohci_hcd 0000:00:0b.0: setting latency timer to 64
[    1.733803] ohci_hcd 0000:00:0b.0: OHCI Host Controller
[    1.733857] ohci_hcd 0000:00:0b.0: new USB bus registered, assigned bus number 2
[    1.733945] ohci_hcd 0000:00:0b.0: irq 21, io mem 0xdcebe000
[    1.790061] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    1.790113] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.790172] usb usb2: Product: OHCI Host Controller
[    1.790221] usb usb2: Manufacturer: Linux 3.1.0-rc2+ ohci_hcd
[    1.790271] usb usb2: SerialNumber: 0000:00:0b.0
[    1.790502] hub 2-0:1.0: USB hub found
[    1.790559] hub 2-0:1.0: 8 ports detected
[    1.952059] usb 1-7: new high speed USB device number 2 using ehci_hcd
[    2.086191] usb 1-7: New USB device found, idVendor=174f, idProduct=a311
[    2.086244] usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.086296] usb 1-7: Product: USB2.0                  
[    2.086344] usb 1-7: Manufacturer: Syntek    
[    2.140088] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    2.148442] ata1.00: ATA-9: M4-CT064M4SSD2, 0002, max UDMA/100
[    2.148496] ata1.00: 125045424 sectors, multi 16: LBA48 NCQ (depth 31/32)
[    2.156421] ata1.00: configured for UDMA/100
[    2.156715] scsi 0:0:0:0: Direct-Access     ATA      M4-CT064M4SSD2   0002 PQ: 0 ANSI: 5
[    2.468061] ata2: SATA link down (SStatus 0 SControl 300)
[    2.632460] ata4.00: ATAPI: HL-DT-ST DVDRAM GMA-4082N, HJ02, max UDMA/33
[    2.632518] ata4: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000 (0xc000) ACPI=0x701f (60:900:0x11)
[    2.648687] ata4.00: configured for UDMA/33
[    2.657975] scsi 3:0:0:0: CD-ROM            HL-DT-ST DVDRAM GMA-4082N HJ02 PQ: 0 ANSI: 5
[    2.658842] sdhci: Secure Digital Host Controller Interface driver
[    2.658894] sdhci: Copyright(c) Pierre Ossman
[    2.659300] sdhci-pci 0000:05:01.1: SDHCI controller found [1180:0822] (rev 19)
[    2.659584] ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 19
[    2.659646] sdhci-pci 0000:05:01.1: PCI INT B -> Link[LNKC] -> GSI 19 (level, low) -> IRQ 19
[    2.659737] sdhci-pci 0000:05:01.1: Will use DMA mode even though HW doesn't fully claim to support it.
[    2.659827] mmc0: no vmmc regulator found
[    2.659920] Registered led device: mmc0::
[    2.660625] mmc0: SDHCI controller on PCI [0000:05:01.1] using DMA
[    2.660800] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[    2.661090] ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 18
[    2.661153] r8169 0000:05:00.0: PCI INT A -> Link[LNKA] -> GSI 18 (level, low) -> IRQ 18
[    2.661235] r8169 0000:05:00.0: (unregistered net_device): not PCI Express
[    2.662105] r8169 0000:05:00.0: eth0: RTL8169sb/8110sb at 0xf821cc00, 00:18:f3:49:84:f8, XID 10000000 IRQ 18
[    2.664594] ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 17
[    2.664662] firewire_ohci 0000:05:01.0: PCI INT A -> Link[LNKB] -> GSI 17 (level, low) -> IRQ 17
[    2.670451] sd 0:0:0:0: [sda] 125045424 512-byte logical blocks: (64.0 GB/59.6 GiB)
[    2.670594] sd 0:0:0:0: [sda] Write Protect is off
[    2.670642] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.670669] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.671580]  sda: sda1 sda2
[    2.671990] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.675674] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    2.675805] sr 3:0:0:0: Attached scsi generic sg1 type 5
[    2.676584] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[    2.676649] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.677138] sr 3:0:0:0: Attached scsi CD-ROM sr0
[    2.720090] firewire_ohci: Added fw-ohci device 0000:05:01.0, OHCI v1.0, 4 IR + 4 IT contexts, quirks 0x1
[    3.078419] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
[    3.164041] CE: hpet increased min_delta_ns to 11520 nsec
[    3.224432] firewire_core: created device fw0: GUID 00e018000368787d, S400
[    3.341704] udevd[263]: starting version 172
[    3.441335] input: Sleep Button as /devices/LNXSYSTM:00/device:00/PNP0C0E:00/input/input1
[    3.441405] ACPI: Sleep Button [SLPB]
[    3.441541] input: Lid Switch as /devices/LNXSYSTM:00/device:00/PNP0C0D:00/input/input2
[    3.447384] i2c i2c-0: nForce2 SMBus adapter at 0x700
[    3.447469] i2c i2c-1: nForce2 SMBus adapter at 0x600
[    3.451892] NV_TCO: NV TCO WatchDog Timer Driver v0.01
[    3.452190] NV_TCO: Watchdog reboot not detected.
[    3.453555] ACPI: Lid Switch [LID]
[    3.453705] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input3
[    3.453767] ACPI: Power Button [PWRB]
[    3.453901] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[    3.453960] ACPI: Power Button [PWRF]
[    3.455415] input: Video Bus as /devices/LNXSYSTM:00/device:00/PNP0A03:00/device:03/LNXVIDEO:00/input/input5
[    3.455483] ACPI: Video Device [VGA] (multi-head: yes  rom: no  post: no)
[    3.456264] NV_TCO: initialized (0x0840). heartbeat=30 sec (nowayout=0)
[    3.456939] wmi: Mapper loaded
[    3.471657] ACPI: acpi_idle registered with cpuidle
[    3.471706] ACPI: processor limited to max C-state 1
[    3.485171] r592 0000:05:01.2: PCI INT B -> Link[LNKC] -> GSI 19 (level, low) -> IRQ 19
[    3.485232] r592 0000:05:01.2: setting latency timer to 64
[    3.487507] asus_laptop: Asus Laptop Support version 0.42
[    3.488146] cfg80211: Calling CRDA to update world regulatory domain
[    3.488260] r592: driver successfully loaded
[    3.497152] asus_laptop: Error calling CWAP(1)
[    3.499104] asus_laptop:   A7T model detected
[    3.593879] IR NEC protocol handler initialized
[    3.594629] k8temp 0000:00:18.3: Temperature readouts might be wrong - check erratum #141
[    3.594758] [drm] Initialized drm 1.1.0 20060810
[    3.595534] input: PC Speaker as /devices/platform/pcspkr/input/input6
[    3.696986] cfg80211: World regulatory domain updated:
[    3.697032] cfg80211:     (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
[    3.697118] cfg80211:     (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
[    3.697212] cfg80211:     (2457000 KHz - 2482000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
[    3.697267] cfg80211:     (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
[    3.704332] cfg80211:     (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
[    3.704384] cfg80211:     (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
[    3.860299] input: Asus Laptop extra buttons as /devices/platform/asus_laptop/input/input7
[    3.860609] Registered led device: asus::phone
[    4.605894] ACPI: Battery Slot [BAT0] (battery present)
[    4.606033] ACPI: AC Adapter [AC0] (on-line)
[    4.609639] r852 0000:05:01.3: PCI INT B -> Link[LNKC] -> GSI 19 (level, low) -> IRQ 19
[    4.609700] r852 0000:05:01.3: setting latency timer to 64
[    4.609918] ite_cir: Auto-detected model: ITE8704 CIR transceiver
[    4.609967] ite_cir: Using model: ITE8704 CIR transceiver
[    4.610388] ite_cir: TX-capable: 1
[    4.610426] ite_cir: Sample period (ns): 8680
[    4.610466] ite_cir: TX carrier frequency (Hz): 38000
[    4.610506] ite_cir: TX duty cycle (%): 33
[    4.610551] ite_cir: RX low carrier frequency (Hz): 0
[    4.610605] ite_cir: RX high carrier frequency (Hz): 0
[    4.613939] r852: Non dma capable device detected, dma disabled
[    4.614002] r852: driver loaded successfully
[    4.617857] IR RC5(x) protocol handler initialized
[    4.624875] ACPI: PCI Interrupt Link [LNEB] enabled at IRQ 16
[    4.624935] ath5k 0000:01:00.0: PCI INT A -> Link[LNEB] -> GSI 16 (level, low) -> IRQ 16
[    4.624993] ath5k 0000:01:00.0: setting latency timer to 64
[    4.625062] ath5k 0000:01:00.0: registered as 'phy0'
[    4.647627] ACPI: PCI Interrupt Link [LAZA] enabled at IRQ 20
[    4.647689] snd_hda_intel 0000:00:10.1: PCI INT B -> Link[LAZA] -> GSI 20 (level, low) -> IRQ 20
[    4.647743] hda_intel: Disabling MSI
[    4.647828] snd_hda_intel 0000:00:10.1: setting latency timer to 64
[    4.651401] Registered IR keymap rc-rc6-mce
[    4.651595] input: ITE8704 CIR transceiver as /devices/virtual/rc/rc0/input8
[    4.652703] rc0: ITE8704 CIR transceiver as /devices/virtual/rc/rc0
[    4.653025] IR RC6 protocol handler initialized
[    4.662800] ite_cir: driver has been successfully loaded
[    4.684459] ACPI: PCI Interrupt Link [LNEA] enabled at IRQ 19
[    4.684510] nouveau 0000:04:00.0: PCI INT A -> Link[LNEA] -> GSI 19 (level, low) -> IRQ 19
[    4.684565] nouveau 0000:04:00.0: setting latency timer to 64
[    4.686714] [drm] nouveau 0000:04:00.0: Detected an NV40 generation card (0x04b800a2)
[    4.691918] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PRAMIN
[    4.797779] [drm] nouveau 0000:04:00.0: ... appears to be valid
[    4.797827] [drm] nouveau 0000:04:00.0: BIT BIOS found
[    4.797869] [drm] nouveau 0000:04:00.0: Bios version 05.73.22.24
[    4.797912] [drm] nouveau 0000:04:00.0: TMDS table version 1.1
[    4.797954] [drm] nouveau 0000:04:00.0: TMDS table script pointers not stubbed
[    4.798005] [drm] nouveau 0000:04:00.0: Found Display Configuration Block version 3.0
[    4.798058] [drm] nouveau 0000:04:00.0: Raw DCB entry 0: 03005323 00000004
[    4.798102] [drm] nouveau 0000:04:00.0: Raw DCB entry 1: 01010300 00000028
[    4.798147] [drm] nouveau 0000:04:00.0: Raw DCB entry 2: 04026312 00000000
[    4.798190] [drm] nouveau 0000:04:00.0: Raw DCB entry 3: 020323f1 00a0c070
[    4.798234] [drm] nouveau 0000:04:00.0: DCB connector table: VHER 0x30 5 10 2
[    4.798279] [drm] nouveau 0000:04:00.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
[    4.798331] [drm] nouveau 0000:04:00.0:   1: 0x00000130: type 0x30 idx 1 tag 0xff
[    4.798383] [drm] nouveau 0000:04:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[    4.798434] [drm] nouveau 0000:04:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[    4.798485] [drm] nouveau 0000:04:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[    4.798536] [drm] nouveau 0000:04:00.0:   5: 0x00000340: type 0x40 idx 5 tag 0xff
[    4.798588] [drm] nouveau 0000:04:00.0:   6: 0x00001431: type 0x31 idx 6 tag 0x07
[    4.798644] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xDE2E
[    4.798789] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xE4BA
[    4.810973] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xEBA4
[    4.811042] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xED1F
[    4.814232] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xEF0D
[    4.839832] [drm] nouveau 0000:04:00.0: 3 available performance level(s)
[    4.839884] [drm] nouveau 0000:04:00.0: 0: core 100MHz shader 100MHz memory 135MHz timing 0 voltage 1000mV fanspeed 100%
[    4.839942] [drm] nouveau 0000:04:00.0: 1: core 200MHz shader 200MHz memory 200MHz timing 0 voltage 1000mV fanspeed 100%
[    4.840020] [drm] nouveau 0000:04:00.0: 2: core 450MHz shader 450MHz memory 400MHz timing 0 voltage 1100mV fanspeed 100%
[    4.840082] [drm] nouveau 0000:04:00.0: c: core 200MHz shader 200MHz memory 202MHz fanspeed 100%
[    4.840410] [TTM] Zone  kernel: Available graphics memory: 446418 kiB.
[    4.840454] [TTM] Zone highmem: Available graphics memory: 514902 kiB.
[    4.840496] [TTM] Initializing pool allocator.
[    4.840547] [drm] nouveau 0000:04:00.0: Detected 256MiB VRAM
[    5.082642] [drm] nouveau 0000:04:00.0: 512 MiB GART (aperture)
[    5.082819] [drm] nouveau 0000:04:00.0: Saving VGA fonts
[    5.139007] IR JVC protocol handler initialized
[    5.141188] ath: EEPROM regdomain: 0x60
[    5.141191] ath: EEPROM indicates we should expect a direct regpair map
[    5.141196] ath: Country alpha2 being used: 00
[    5.141198] ath: Regpair used: 0x60
[    5.143419] IR Sony protocol handler initialized
[    5.145853] input: MCE IR Keyboard/Mouse (ite-cir) as /devices/virtual/input/input9
[    5.146019] IR MCE Keyboard/mouse protocol handler initialized
[    5.150819] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
[    5.152044] ath5k phy0: Atheros AR5414 chip found (MAC: 0xa0, PHY: 0x61)
[    5.153030] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    5.153076] [drm] No driver support for vblank timestamp query.
[    5.153128] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on lvds encoder (output 0)
[    5.153196] [drm] nouveau 0000:04:00.0: Calling LVDS script 6:
[    5.153240] [drm] nouveau 0000:04:00.0: 0xCFE1: Parsing digital output script table
[    5.180663] lirc_dev: IR Remote Control driver registered, major 251 
[    5.181523] rc rc0: lirc_dev: driver ir-lirc-codec (ite-cir) registered at minor = 0
[    5.181581] IR LIRC bridge handler initialized
[    5.431135] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[    5.431195] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[    5.431253] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[    5.633054] [drm] nouveau 0000:04:00.0: allocated 1440x900 fb: 0x49000, bo f557fe00
[    5.633220] fbcon: nouveaufb (fb0) is primary device
[    5.647757] [drm] nouveau 0000:04:00.0: Calling LVDS script 2:
[    5.647762] [drm] nouveau 0000:04:00.0: 0xD057: Parsing digital output script table
[    5.794761] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on lvds encoder (output 0)
[    5.794764] [drm] nouveau 0000:04:00.0: Calling LVDS script 5:
[    5.794767] [drm] nouveau 0000:04:00.0: 0xCFD2: Parsing digital output script table
[    5.794776] [drm] nouveau 0000:04:00.0: Output LVDS-1 is running on CRTC 0 using output A
[    5.797084] Console: switching to colour frame buffer device 180x56
[    5.799418] fb0: nouveaufb frame buffer device
[    5.799428] drm: registered panic notifier
[    5.799443] [drm] Initialized nouveau 0.0.16 20090420 for 0000:04:00.0 on minor 0
[    5.900253] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:10.1/input/input10
[    5.905072] input: ImPS/2 Generic Wheel Mouse as /devices/platform/i8042/serio4/input/input11
[    6.608672] Adding 2104476k swap on /dev/sda1.  Priority:-1 extents:1 across:2104476k SS
[    6.614048] EXT4-fs (sda2): re-mounted. Opts: (null)
[    7.134417] EXT4-fs (sda2): re-mounted. Opts: discard,user_xattr
[    7.554199] r8169 0000:05:00.0: eth0: link down
[    7.554786] r8169 0000:05:00.0: eth0: link down
[    7.558651] ADDRCONF(NETDEV_UP): eth0: link is not ready
[    7.594566] ADDRCONF(NETDEV_UP): wlan0: link is not ready
[    7.709464] RPC: Registered named UNIX socket transport module.
[    7.710067] RPC: Registered udp transport module.
[    7.710641] RPC: Registered tcp transport module.
[    7.711206] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.721162] FS-Cache: Loaded
[    7.747933] FS-Cache: Netfs 'nfs' registered for caching
[    7.759727] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
[    7.936397] fuse init (API version 7.16)
[    9.520137] input: ACPI Virtual Keyboard Device as /devices/virtual/input/input12
[   10.706623] r8169 0000:05:00.0: eth0: link up
[   10.709976] ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   20.944032] eth0: no IPv6 routers present
[  230.256260] snd_hda_intel 0000:00:10.1: PCI INT B disabled
[  230.271055] ohci_hcd 0000:00:0b.0: remove, state 4
[  230.271576] usb usb2: USB disconnect, device number 1
[  230.284192] ohci_hcd 0000:00:0b.0: USB bus 2 deregistered
[  230.284716] ohci_hcd 0000:00:0b.0: PCI INT A disabled
[  230.285693] ehci_hcd 0000:00:0b.1: remove, state 1
[  230.286201] usb usb1: USB disconnect, device number 1
[  230.286691] usb 1-7: USB disconnect, device number 2
[  230.296200] ehci_hcd 0000:00:0b.1: USB bus 1 deregistered
[  230.312115] ehci_hcd 0000:00:0b.1: PCI INT B disabled
[  230.313445] usbcore: deregistering device driver usb
[  230.324046] usbcore: deregistering interface driver usbfs
[  230.324581] usbcore: deregistering interface driver hub
[  230.364262] ath5k 0000:01:00.0: PCI INT A disabled
[  241.250292] EXT4-fs (sda2): re-mounted. Opts: discard,user_xattr,commit=0
[  242.712095] r8169 0000:05:00.0: PCI INT A disabled
[  243.212345] PM: Syncing filesystems ... done.
[  243.212832] PM: Preparing system for mem sleep
[  243.213845] Freezing user space processes ... (elapsed 0.01 seconds) done.
[  243.228060] Freezing remaining freezable tasks ... (elapsed 0.01 seconds) done.
[  243.244061] PM: Entering mem sleep
[  243.244088] Suspending console(s) (use no_console_suspend to debug)
[  243.244685] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  243.246771] sd 0:0:0:0: [sda] Stopping disk
[  243.249496] ite-cir 00:0d: disabled
[  243.249607] ACPI handle has no context!
[  243.249618] sdhci-pci 0000:05:01.1: PCI INT B disabled
[  243.249624] ACPI handle has no context!
[  243.249644] [drm] nouveau 0000:04:00.0: Disabling fbcon acceleration...
[  243.249648] [drm] nouveau 0000:04:00.0: Unpinning framebuffer(s)...
[  243.249672] ACPI handle has no context!
[  243.249674] [drm] nouveau 0000:04:00.0: Evicting buffers...
[  243.249781] sata_nv 0000:00:0e.0: PCI INT A disabled
[  243.251356] [drm] nouveau 0000:04:00.0: Idling channels...
[  243.252223] [drm] nouveau 0000:04:00.0: Suspending GPU objects...
[  243.427471] [drm] nouveau 0000:04:00.0: And we're gone!
[  243.427502] nouveau 0000:04:00.0: PCI INT A disabled
[  243.440123] PM: suspend of devices complete after 195.540 msecs
[  243.472747] PM: late suspend of devices complete after 32.618 msecs
[  243.472825] ACPI: Preparing to enter system sleep state S3
[  243.784620] PM: Saving platform NVS memory
[  243.784977] Disabling non-boot CPUs ...
[  243.888135] CPU 1 is now offline
[  243.888889] ACPI: Low-level resume complete
[  243.888889] PM: Restoring platform NVS memory
[  243.888889] Enabling non-boot CPUs ...
[  243.888889] Booting Node 0 Processor 1 APIC 0x1
[  243.888889] smpboot cpu 1: start_ip = 9b000
[  243.786667] Initializing CPU#1
[  243.786667] Calibrating delay loop (skipped) already calibrated this CPU
[  243.786667] Switch to broadcast mode on CPU1
[  243.902049] NMI watchdog enabled, takes one hw-pmu counter.
[  243.904054] Switched to NOHz mode on CPU #1
[  243.904111] CPU1 is up
[  243.904522] ACPI: Waking up from system sleep state S3
[  243.905220] pci 0000:00:00.0: restoring config space at offset 0xf (was 0x0, writing 0xff)
[  243.905251] pci 0000:00:00.0: Found disabled HT MSI Mapping
[  243.905257] pci 0000:00:00.0: Enabling HT MSI Mapping
[  243.905267] pci 0000:00:00.1: restoring config space at offset 0xf (was 0xffffffff, writing 0x0)
[  243.905273] pci 0000:00:00.1: restoring config space at offset 0xe (was 0xffffffff, writing 0x0)
[  243.905280] pci 0000:00:00.1: restoring config space at offset 0xd (was 0xffffffff, writing 0x0)
[  243.905286] pci 0000:00:00.1: restoring config space at offset 0xc (was 0xffffffff, writing 0x0)
[  243.905292] pci 0000:00:00.1: restoring config space at offset 0xb (was 0xffffffff, writing 0x13221043)
[  243.905298] pci 0000:00:00.1: restoring config space at offset 0xa (was 0xffffffff, writing 0x0)
[  243.905304] pci 0000:00:00.1: restoring config space at offset 0x9 (was 0xffffffff, writing 0x0)
[  243.905310] pci 0000:00:00.1: restoring config space at offset 0x8 (was 0xffffffff, writing 0x0)
[  243.905316] pci 0000:00:00.1: restoring config space at offset 0x7 (was 0xffffffff, writing 0x0)
[  243.905322] pci 0000:00:00.1: restoring config space at offset 0x6 (was 0xffffffff, writing 0x0)
[  243.905328] pci 0000:00:00.1: restoring config space at offset 0x5 (was 0xffffffff, writing 0x0)
[  243.905334] pci 0000:00:00.1: restoring config space at offset 0x4 (was 0xffffffff, writing 0x0)
[  243.905340] pci 0000:00:00.1: restoring config space at offset 0x3 (was 0xffffffff, writing 0x800000)
[  243.905346] pci 0000:00:00.1: restoring config space at offset 0x2 (was 0xffffffff, writing 0x50000a2)
[  243.905352] pci 0000:00:00.1: restoring config space at offset 0x1 (was 0xffffffff, writing 0x200100)
[  243.905358] pci 0000:00:00.1: restoring config space at offset 0x0 (was 0xffffffff, writing 0x2fa10de)
[  243.905383] pci 0000:00:00.3: restoring config space at offset 0xf (was 0x0, writing 0xff)
[  243.905399] pci 0000:00:00.4: restoring config space at offset 0xf (was 0x0, writing 0xff)
[  243.905416] pci 0000:00:00.5: restoring config space at offset 0xf (was 0x0, writing 0xff)
[  243.905459] pcieport 0000:00:02.0: restoring config space at offset 0x7 (was 0x1f1, writing 0x200001f1)
[  243.905466] pcieport 0000:00:02.0: restoring config space at offset 0x1 (was 0x100006, writing 0x100406)
[  243.905497] pci 0000:00:00.0: Found enabled HT MSI Mapping
[  243.905514] pcieport 0000:00:03.0: restoring config space at offset 0x1 (was 0x100004, writing 0x100407)
[  243.905548] pci 0000:00:00.0: Found enabled HT MSI Mapping
[  243.905562] pcieport 0000:00:04.0: restoring config space at offset 0x7 (was 0xd1d1, writing 0x1111)
[  243.905569] pcieport 0000:00:04.0: restoring config space at offset 0x1 (was 0x100007, writing 0x100407)
[  243.905607] pci 0000:00:00.0: Found enabled HT MSI Mapping
[  243.905798] pci 0000:00:0b.0: restoring config space at offset 0x1 (was 0xb00007, writing 0xb00003)
[  243.905825] pci 0000:00:0b.1: restoring config space at offset 0x1 (was 0xb00006, writing 0xb00002)
[  243.905928] pci 0000:00:09.0: Found enabled HT MSI Mapping
[  243.905942] pci 0000:00:10.0: restoring config space at offset 0x7 (was 0x280e0e0, writing 0x8280e0e0)
[  243.906003] pci 0000:00:09.0: Found enabled HT MSI Mapping
[  243.906024] pci 0000:00:10.1: restoring config space at offset 0x1 (was 0xb00006, writing 0xb00002)
[  243.906087] pci 0000:00:09.0: Found enabled HT MSI Mapping
[  243.906141] pci 0000:01:00.0: restoring config space at offset 0x1 (was 0x100107, writing 0x100103)
[  243.906166] nouveau 0000:04:00.0: restoring config space at offset 0xf (was 0x100, writing 0x10b)
[  243.906173] nouveau 0000:04:00.0: restoring config space at offset 0xc (was 0x0, writing 0xdfee0000)
[  243.906179] nouveau 0000:04:00.0: restoring config space at offset 0x9 (was 0x1, writing 0x1001)
[  243.906185] nouveau 0000:04:00.0: restoring config space at offset 0x7 (was 0x4, writing 0xdd000004)
[  243.906191] nouveau 0000:04:00.0: restoring config space at offset 0x5 (was 0xc, writing 0xc000000c)
[  243.906196] nouveau 0000:04:00.0: restoring config space at offset 0x4 (was 0x0, writing 0xde000000)
[  243.906201] nouveau 0000:04:00.0: restoring config space at offset 0x3 (was 0x0, writing 0x10)
[  243.906207] nouveau 0000:04:00.0: restoring config space at offset 0x1 (was 0x100000, writing 0x100007)
[  243.906239] pci 0000:05:00.0: restoring config space at offset 0x5 (was 0x0, writing 0xdffffc00)
[  243.906244] pci 0000:05:00.0: restoring config space at offset 0x4 (was 0x1, writing 0xe801)
[  243.906250] pci 0000:05:00.0: restoring config space at offset 0x3 (was 0x0, writing 0x4008)
[  243.906257] pci 0000:05:00.0: restoring config space at offset 0x1 (was 0x2b80000, writing 0x2b00103)
[  243.906273] firewire_ohci 0000:05:01.0: restoring config space at offset 0xf (was 0x4020100, writing 0x4020105)
[  243.906288] firewire_ohci 0000:05:01.0: restoring config space at offset 0x4 (was 0x0, writing 0xdfffe800)
[  243.906294] firewire_ohci 0000:05:01.0: restoring config space at offset 0x3 (was 0x800000, writing 0x804000)
[  243.906301] firewire_ohci 0000:05:01.0: restoring config space at offset 0x1 (was 0x2100000, writing 0x2100106)
[  243.906315] firewire_ohci 0000:05:01.0: proprietary Ricoh MMC controller disabled (via firewire function)
[  243.906319] firewire_ohci 0000:05:01.0: MMC cards are now supported by standard SDHCI controller
[  243.906329] sdhci-pci 0000:05:01.1: restoring config space at offset 0xf (was 0x200, writing 0x205)
[  243.906344] sdhci-pci 0000:05:01.1: restoring config space at offset 0x4 (was 0x0, writing 0xdffff000)
[  243.906350] sdhci-pci 0000:05:01.1: restoring config space at offset 0x3 (was 0x800000, writing 0x804000)
[  243.906357] sdhci-pci 0000:05:01.1: restoring config space at offset 0x1 (was 0x2100000, writing 0x2100106)
[  243.906373] r592 0000:05:01.2: restoring config space at offset 0xf (was 0x200, writing 0x205)
[  243.906387] r592 0000:05:01.2: restoring config space at offset 0x4 (was 0x0, writing 0xdffff400)
[  243.906395] r592 0000:05:01.2: restoring config space at offset 0x1 (was 0x2100000, writing 0x2100102)
[  243.906411] r852 0000:05:01.3: restoring config space at offset 0xf (was 0x200, writing 0x205)
[  243.906426] r852 0000:05:01.3: restoring config space at offset 0x4 (was 0x0, writing 0xdffff800)
[  243.906433] r852 0000:05:01.3: restoring config space at offset 0x1 (was 0x2100000, writing 0x2100102)
[  243.906524] PM: early resume of devices complete after 1.344 msecs
[  243.906792] pata_amd 0000:00:0d.0: setting latency timer to 64
[  243.906795] sata_nv 0000:00:0e.0: PCI INT A -> Link[LSA0] -> GSI 22 (level, low) -> IRQ 22
[  243.906806] sata_nv 0000:00:0e.0: setting latency timer to 64
[  243.906814] pci 0000:00:10.0: setting latency timer to 64
[  243.906825] [drm] nouveau 0000:04:00.0: We're back, enabling device...
[  243.906834] nouveau 0000:04:00.0: PCI INT A -> Link[LNEA] -> GSI 19 (level, low) -> IRQ 19
[  243.906839] nouveau 0000:04:00.0: setting latency timer to 64
[  243.906845] [drm] nouveau 0000:04:00.0: POSTing device...
[  243.906856] sdhci-pci 0000:05:01.1: PCI INT B -> Link[LNKC] -> GSI 19 (level, low) -> IRQ 19
[  243.906857] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xDE2E
[  243.906867] sdhci-pci 0000:05:01.1: Will use DMA mode even though HW doesn't fully claim to support it.
[  243.907036] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xE4BA
[  243.907916] sd 0:0:0:0: [sda] Starting disk
[  243.911108] ata3: port disabled--ignoring
[  243.919427] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xEBA4
[  243.919521] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xED1F
[  243.922922] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xEF0D
[  243.922926] [drm] nouveau 0000:04:00.0: Restoring GPU objects...
[  243.934519] [drm] nouveau 0000:04:00.0: Reinitialising engines...
[  243.934739] [drm] nouveau 0000:04:00.0: Restoring mode...
[  243.934906] [drm] nouveau 0000:04:00.0: Calling LVDS script 6:
[  243.934910] [drm] nouveau 0000:04:00.0: 0xCFE1: Parsing digital output script table
[  243.934920] [drm] nouveau 0000:04:00.0: Calling LVDS script 2:
[  243.934923] [drm] nouveau 0000:04:00.0: 0xD057: Parsing digital output script table
[  243.960115] firewire_core: skipped bus generations, destroying all nodes
[  244.072324] ata4.00: ACPI cmd ef/03:42:00:00:00:a0 (SET FEATURES) filtered out
[  244.072329] ata4.00: ACPI cmd ef/03:01:00:00:00:a0 (SET FEATURES) filtered out
[  244.072334] ata4.00: ACPI cmd f5/00:00:00:00:00:00 (SECURITY FREEZE LOCK) filtered out
[  244.072347] ata4: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000 (0xc000) ACPI=0x701f (60:900:0x11)
[  244.083127] [drm] nouveau 0000:04:00.0: Calling LVDS script 5:
[  244.083131] [drm] nouveau 0000:04:00.0: 0xCFD2: Parsing digital output script table
[  244.083141] [drm] nouveau 0000:04:00.0: 0xD1D0: Parsing digital output script table
[  244.088313] ata4.00: configured for UDMA/33
[  244.161793] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on lvds encoder (output 0)
[  244.161798] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[  244.161802] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[  244.161806] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[  246.987046] ata2: SATA link down (SStatus 0 SControl 300)
[  249.034254] hrtimer: interrupt took 514601000 ns
[  251.588107] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[  267.191900] ata1.00: ACPI cmd ef/03:46:00:00:00:a0 (SET FEATURES) filtered out
[  267.238114] ata1.00: ACPI cmd ef/90:06:00:00:00:a0 (SET FEATURES) succeeded
[  267.238119] ata1.00: ACPI cmd f5/00:00:00:00:00:00 (SECURITY FREEZE LOCK) filtered out
[  267.238243] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  267.238252] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  267.238263] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  267.238271] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBIF] (Node f5c415c0), AE_TIME (20110623/psparse-536)
[  267.238280] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BIF] (Node f5c41650), AE_TIME (20110623/psparse-536)
[  267.238292] ACPI Exception: AE_TIME, Evaluating _BIF (20110623/battery-419)
[  267.248032] [drm] nouveau 0000:04:00.0: Calling LVDS script 6:
[  267.358384] [drm] nouveau 0000:04:00.0: 0xCFE1: Parsing digital output script table
[  267.449851] ata1.00: configured for UDMA/100
[  267.452294] ite-cir 00:0d: activated
[  267.742356] [drm] nouveau 0000:04:00.0: Calling LVDS script 2:
[  267.758551] [drm] nouveau 0000:04:00.0: 0xD057: Parsing digital output script table
[  267.834880] [drm] nouveau 0000:04:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  267.834883] [drm] nouveau 0000:04:00.0: 0xD122: no tmds_index_reg
[  267.851074] [drm] nouveau 0000:04:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  267.851077] [drm] nouveau 0000:04:00.0: 0xD13D: no tmds_index_reg
[  267.964418] [drm] nouveau 0000:04:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  267.964421] [drm] nouveau 0000:04:00.0: 0xCF9E: no tmds_index_reg
[  267.980610] [drm] nouveau 0000:04:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  267.980613] [drm] nouveau 0000:04:00.0: 0xCFA3: no tmds_index_reg
[  267.996802] [drm] nouveau 0000:04:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  267.996805] [drm] nouveau 0000:04:00.0: 0xCFB2: no tmds_index_reg
[  268.087015] BUG: soft lockup - CPU#0 stuck for 22s! [kworker/u:6:1934]
[  268.087017] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  268.087078] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  268.087128] 
[  268.087131] Pid: 1934, comm: kworker/u:6 Not tainted 3.1.0-rc2+ #8 ASUSTeK Computer INC. A7T/A7T
[  268.087137] EIP: 0060:[<c115a670>] EFLAGS: 00000292 CPU: 0
[  268.087144] EIP is at ioread32+0x9/0x24
[  268.087147] EAX: ffffffff EBX: f7604000 ECX: 00680848 EDX: 00000000
[  268.087151] ESI: 00000000 EDI: 00680848 EBP: f5700000 ESP: f5447ce4
[  268.087154]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[  268.087158] Process kworker/u:6 (pid: 1934, ti=f5446000 task=f7580140 task.ti=f5446000)
[  268.087160] Stack:
[  268.087162]  f86ca563 00000000 f7797e00 f7604000 f5700000 f86cab6e f75f4000 f86deb44
[  268.087169]  f7797e00 f76042a0 f75f402c f75f4000 f83e2fd6 f75f401c f7604000 01000001
[  268.087176]  f7642ac0 f76042a4 f86df3cc 00000000 00000000 00000000 f5601bfc f56b7ac0
[  268.087183] Call Trace:
[  268.087218]  [<f86ca563>] ? NVReadRAMDAC+0x25/0x60 [nouveau]
[  268.087247]  [<f86cab6e>] ? nv04_dfp_commit+0x67/0x119 [nouveau]
[  268.087254]  [<f83e2fd6>] ? drm_crtc_helper_set_mode+0x25d/0x2f6 [drm_kms_helper]
[  268.087265]  [<f83e30bc>] ? drm_helper_resume_force_mode+0x4d/0xdf [drm_kms_helper]
[  268.087286]  [<f8684326>] ? nouveau_pci_resume+0x319/0x32b [nouveau]
[  268.087292]  [<c1167af0>] ? pci_legacy_resume+0x23/0x2a
[  268.087298]  [<c11e206d>] ? pm_op+0x84/0x108
[  268.087303]  [<c11e2356>] ? device_resume+0x78/0xc1
[  268.087307]  [<c11e23b2>] ? async_resume+0x13/0x33
[  268.087312]  [<c1051d43>] ? async_run_entry_fn+0x8d/0x126
[  268.087317]  [<c104954b>] ? process_one_work+0x112/0x1fa
[  268.087321]  [<c1051cb6>] ? async_schedule+0x10/0x10
[  268.087325]  [<c104a231>] ? worker_thread+0xa9/0x122
[  268.087329]  [<c104a188>] ? manage_workers.isra.23+0x13d/0x13d
[  268.087334]  [<c104c974>] ? kthread+0x63/0x68
[  268.087339]  [<c104c911>] ? kthread_worker_fn+0x101/0x101
[  268.087345]  [<c12b11fe>] ? kernel_thread_helper+0x6/0x10
[  268.087347] Code: 76 04 8b 00 eb 0b 3d 00 00 01 00 76 07 0f b7 d0 ed 0f c8 c3 ba 32 55 36 c1 e8 1c ff ff ff 83 c8 ff c3 3d ff ff 03 00 76 03 8b 00 <c3> 3d 00 00 01 00 76 05 0f b7 d0 ed c3 ba 4c 55 36 c1 e8 f8 fe 
[  268.087379] Call Trace:
[  268.087407]  [<f86ca563>] ? NVReadRAMDAC+0x25/0x60 [nouveau]
[  268.087435]  [<f86cab6e>] ? nv04_dfp_commit+0x67/0x119 [nouveau]
[  268.087442]  [<f83e2fd6>] ? drm_crtc_helper_set_mode+0x25d/0x2f6 [drm_kms_helper]
[  268.087452]  [<f83e30bc>] ? drm_helper_resume_force_mode+0x4d/0xdf [drm_kms_helper]
[  268.087472]  [<f8684326>] ? nouveau_pci_resume+0x319/0x32b [nouveau]
[  268.087477]  [<c1167af0>] ? pci_legacy_resume+0x23/0x2a
[  268.087482]  [<c11e206d>] ? pm_op+0x84/0x108
[  268.087486]  [<c11e2356>] ? device_resume+0x78/0xc1
[  268.087491]  [<c11e23b2>] ? async_resume+0x13/0x33
[  268.087494]  [<c1051d43>] ? async_run_entry_fn+0x8d/0x126
[  268.087499]  [<c104954b>] ? process_one_work+0x112/0x1fa
[  268.087502]  [<c1051cb6>] ? async_schedule+0x10/0x10
[  268.087506]  [<c104a231>] ? worker_thread+0xa9/0x122
[  268.087511]  [<c104a188>] ? manage_workers.isra.23+0x13d/0x13d
[  268.087515]  [<c104c974>] ? kthread+0x63/0x68
[  268.087520]  [<c104c911>] ? kthread_worker_fn+0x101/0x101
[  268.087525]  [<c12b11fe>] ? kernel_thread_helper+0x6/0x10
[  268.087532] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on lvds encoder (output 0)
[  268.087535] [drm] nouveau 0000:04:00.0: Calling LVDS script 5:
[  268.147156] [drm] nouveau 0000:04:00.0: 0xCFD2: Parsing digital output script table
[  268.163350] [drm] nouveau 0000:04:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  268.163353] [drm] nouveau 0000:04:00.0: 0xCFD2: no tmds_index_reg
[  268.207306] [drm] nouveau 0000:04:00.0: Output LVDS-1 is running on CRTC 0 using output A
[  268.207358] firewire_core: rediscovered device fw0
[  268.318581] PM: resume of devices complete after 24411.889 msecs
[  268.405967] PM: Finishing wakeup.
[  268.405969] Restarting tasks ... done.
[  268.412984] video LNXVIDEO:00: Restoring backlight state
[  273.512220] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  273.512235] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  273.512250] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  273.512259] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  273.512267] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  273.512281] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  274.798709] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  274.798724] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  274.798738] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  274.798747] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  274.798755] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  274.798768] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  276.342480] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  276.342489] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  276.342500] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  276.342508] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  276.342516] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  276.342527] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  292.946371] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  292.946386] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  292.946543] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  292.946551] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  292.946559] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  292.946572] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  293.496230] [drm] nouveau 0000:04:00.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x000093b8 Put 0x000093d4 State 0x80006c10 (err: INVALID_CMD) Push 0x00000000
[  295.095033] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  295.095047] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  295.095060] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  295.095068] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  295.095076] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  295.095089] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  296.124193] BUG: soft lockup - CPU#0 stuck for 22s! [kworker/0:2:179]
[  296.124196] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  296.124248] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  296.124288] 
[  296.124292] Pid: 179, comm: kworker/0:2 Not tainted 3.1.0-rc2+ #8 ASUSTeK Computer INC. A7T/A7T
[  296.124298] EIP: 0060:[<f868f772>] EFLAGS: 00000296 CPU: 0
[  296.124325] EIP is at nouveau_hw_load_state_palette+0x59/0x71 [nouveau]
[  296.124329] EAX: 00000066 EBX: 00000134 ECX: f8d813c9 EDX: f8d813c9
[  296.124332] ESI: 006813c9 EDI: f7604000 EBP: 00000000 ESP: f7493ea4
[  296.124335]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[  296.124340] Process kworker/0:2 (pid: 179, ti=f7492000 task=f7469ac0 task.ti=f7492000)
[  296.124342] Stack:
[  296.124344]  f57116b8 000000ff f554f400 00ff0000 f5601bac f83e131b 00000020 00000010
[  296.124350]  f75f4000 00000008 c1402314 00000000 0000ffff 00000010 0000ffff 0000ffff
[  296.124357]  f5601bfc 00000000 f5601b80 f86df3cc c150517c c150519c ffffffff c15051bc
[  296.124363] Call Trace:
[  296.124370]  [<f83e131b>] ? drm_fb_helper_setcmap+0x240/0x270 [drm_kms_helper]
[  296.124378]  [<c117575c>] ? fb_set_cmap+0x5f/0xdd
[  296.124383]  [<c117995b>] ? fbcon_set_palette+0x4b/0xf8
[  296.124389]  [<c11c568f>] ? set_palette+0x3d/0x3f
[  296.124394]  [<c11c57c2>] ? redraw_screen+0xcb/0x141
[  296.124398]  [<c11bfc1d>] ? complete_change_console+0x30/0xb0
[  296.124402]  [<c11c74ba>] ? console_callback+0x42/0xd5
[  296.124407]  [<c104954b>] ? process_one_work+0x112/0x1fa
[  296.124411]  [<c11c7478>] ? poke_blanked_console+0x97/0x97
[  296.124415]  [<c104a231>] ? worker_thread+0xa9/0x122
[  296.124419]  [<c104a188>] ? manage_workers.isra.23+0x13d/0x13d
[  296.124424]  [<c104c974>] ? kthread+0x63/0x68
[  296.124429]  [<c104c911>] ? kthread_worker_fn+0x101/0x101
[  296.124435]  [<c12b11fe>] ? kernel_thread_helper+0x6/0x10
[  296.124437] Code: c6 c9 13 68 00 e8 41 ee ff ff 69 c5 40 05 00 00 03 04 24 89 04 24 8b 04 24 89 f2 0f b6 8c 18 d4 00 00 00 89 f8 43 e8 20 ee ff ff 
[  296.124455]  fb 00 03 00 00 75 e3 5e 89 ea 5b 89 f8 5e 31 c9 5f 5d e9 ec 
[  296.124464] Call Trace:
[  296.124469]  [<f83e131b>] ? drm_fb_helper_setcmap+0x240/0x270 [drm_kms_helper]
[  296.124474]  [<c117575c>] ? fb_set_cmap+0x5f/0xdd
[  296.124478]  [<c117995b>] ? fbcon_set_palette+0x4b/0xf8
[  296.124483]  [<c11c568f>] ? set_palette+0x3d/0x3f
[  296.124487]  [<c11c57c2>] ? redraw_screen+0xcb/0x141
[  296.124491]  [<c11bfc1d>] ? complete_change_console+0x30/0xb0
[  296.124495]  [<c11c74ba>] ? console_callback+0x42/0xd5
[  296.124499]  [<c104954b>] ? process_one_work+0x112/0x1fa
[  296.124502]  [<c11c7478>] ? poke_blanked_console+0x97/0x97
[  296.124506]  [<c104a231>] ? worker_thread+0xa9/0x122
[  296.124510]  [<c104a188>] ? manage_workers.isra.23+0x13d/0x13d
[  296.124514]  [<c104c974>] ? kthread+0x63/0x68
[  296.124519]  [<c104c911>] ? kthread_worker_fn+0x101/0x101
[  296.124523]  [<c12b11fe>] ? kernel_thread_helper+0x6/0x10
[  300.240983] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  300.240997] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  300.241011] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  300.241019] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  300.241027] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  300.241040] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  307.823687] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20110623/evregion-478)
[  307.823702] ACPI Error: Method parse/execution failed [\_SB_.PCI0.SBRG.EC0_.ESMR] (Node f5c3ee30), AE_TIME (20110623/psparse-536)
[  307.823715] ACPI Error: Method parse/execution failed [\ECRW] (Node f5c3ee00), AE_TIME (20110623/psparse-536)
[  307.823723] ACPI Error: Method parse/execution failed [\_SB_.PCI0.CBST] (Node f5c41590), AE_TIME (20110623/psparse-536)
[  307.823731] ACPI Error: Method parse/execution failed [\_SB_.PCI0.BAT0._BST] (Node f5c41638), AE_TIME (20110623/psparse-536)
[  307.823744] ACPI Exception: AE_TIME, Evaluating _BST (20110623/battery-455)
[  339.954018] BUG: soft lockup - CPU#1 stuck for 22s! [99video:1970]
[  339.954021] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  339.954075] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  339.954117] 
[  339.954121] Pid: 1970, comm: 99video Not tainted 3.1.0-rc2+ #8 ASUSTeK Computer INC. A7T/A7T
[  339.954126] EIP: 0060:[<f868f772>] EFLAGS: 00000296 CPU: 1
[  339.954154] EIP is at nouveau_hw_load_state_palette+0x59/0x71 [nouveau]
[  339.954158] EAX: 00000025 EBX: 00000070 ECX: f8d813c9 EDX: f8d813c9
[  339.954161] ESI: 006813c9 EDI: f7604000 EBP: 00000000 ESP: f5013df4
[  339.954164]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[  339.954169] Process 99video (pid: 1970, ti=f5012000 task=f5c87940 task.ti=f5012000)
[  339.954171] Stack:
[  339.954173]  f57116b8 000000ff f554f400 00ff0000 f5601bac f83e131b 00000020 00000010
[  339.954179]  f75f4000 00000008 c1402314 00000000 0000ffff 00000010 0000ffff 0000ffff
[  339.954185]  f5601bfc 00000000 f5601b80 f86df3cc c150517c c150519c ffffffff c15051bc
[  339.954192] Call Trace:
[  339.954199]  [<f83e131b>] ? drm_fb_helper_setcmap+0x240/0x270 [drm_kms_helper]
[  339.954207]  [<c117575c>] ? fb_set_cmap+0x5f/0xdd
[  339.954213]  [<c117995b>] ? fbcon_set_palette+0x4b/0xf8
[  339.954218]  [<c11c568f>] ? set_palette+0x3d/0x3f
[  339.954223]  [<c11c57c2>] ? redraw_screen+0xcb/0x141
[  339.954227]  [<c117d12e>] ? fbcon_event_notify+0x95/0x56f
[  339.954233]  [<c109743a>] ? __alloc_pages_nodemask+0x105/0x5db
[  339.954239]  [<c12af384>] ? notifier_call_chain.isra.0+0x21/0x44
[  339.954245]  [<c105096c>] ? __blocking_notifier_call_chain+0x36/0x49
[  339.954250]  [<c1050988>] ? blocking_notifier_call_chain+0x9/0xc
[  339.954254]  [<c1173bf8>] ? fb_set_suspend+0x47/0x55
[  339.954258]  [<c1175f05>] ? store_fbstate+0x2e/0x3b
[  339.954262]  [<c1175ed7>] ? show_bpp+0x20/0x20
[  339.954266]  [<c11dc1cd>] ? dev_attr_store+0x19/0x1d
[  339.954271]  [<c1109a15>] ? sysfs_write_file+0xb6/0xe3
[  339.954274]  [<c110995f>] ? sysfs_poll+0x60/0x60
[  339.954279]  [<c10c7c1c>] ? vfs_write+0x83/0xd4
[  339.954283]  [<c10c7ddc>] ? sys_write+0x3d/0x61
[  339.954288]  [<c12b0c5f>] ? sysenter_do_call+0x12/0x28
[  339.954291] Code: c6 c9 13 68 00 e8 41 ee ff ff 69 c5 40 05 00 00 03 04 24 89 04 24 8b 04 24 89 f2 0f b6 8c 18 d4 00 00 00 89 f8 43 e8 20 ee ff ff 
[  339.954308]  fb 00 03 00 00 75 e3 5e 89 ea 5b 89 f8 5e 31 c9 5f 5d e9 ec 
[  339.954317] Call Trace:
[  339.954323]  [<f83e131b>] ? drm_fb_helper_setcmap+0x240/0x270 [drm_kms_helper]
[  339.954328]  [<c117575c>] ? fb_set_cmap+0x5f/0xdd
[  339.954332]  [<c117995b>] ? fbcon_set_palette+0x4b/0xf8
[  339.954337]  [<c11c568f>] ? set_palette+0x3d/0x3f
[  339.954341]  [<c11c57c2>] ? redraw_screen+0xcb/0x141
[  339.954345]  [<c117d12e>] ? fbcon_event_notify+0x95/0x56f
[  339.954349]  [<c109743a>] ? __alloc_pages_nodemask+0x105/0x5db
[  339.954354]  [<c12af384>] ? notifier_call_chain.isra.0+0x21/0x44
[  339.954358]  [<c105096c>] ? __blocking_notifier_call_chain+0x36/0x49
[  339.954363]  [<c1050988>] ? blocking_notifier_call_chain+0x9/0xc
[  339.954367]  [<c1173bf8>] ? fb_set_suspend+0x47/0x55
[  339.954370]  [<c1175f05>] ? store_fbstate+0x2e/0x3b
[  339.954374]  [<c1175ed7>] ? show_bpp+0x20/0x20
[  339.954378]  [<c11dc1cd>] ? dev_attr_store+0x19/0x1d
[  339.954381]  [<c1109a15>] ? sysfs_write_file+0xb6/0xe3
[  339.954385]  [<c110995f>] ? sysfs_poll+0x60/0x60
[  339.954389]  [<c10c7c1c>] ? vfs_write+0x83/0xd4
[  339.954392]  [<c10c7ddc>] ? sys_write+0x3d/0x61
[  339.954397]  [<c12b0c5f>] ? sysenter_do_call+0x12/0x28
[  340.227663] BUG: soft lockup - CPU#0 stuck for 23s! [sh:1983]
[  340.227666] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  340.227718] Modules linked in: uinput fuse nfsd nfs lockd fscache auth_rpcgss nfs_acl sunrpc ir_lirc_codec lirc_dev arc4 ir_mce_kbd_decoder ir_sony_decoder ir_jvc_decoder nouveau ir_rc6_decoder ttm rc_rc6_mce ir_rc5_decoder drm_kms_helper ite_cir r852 evdev pcspkr k8temp serio_raw ir_nec_decoder drm rc_core ac sm_common battery power_supply nand nand_ids nand_ecc soundcore mtd asus_laptop sparse_keymap processor r592 memstick i2c_algo_bit mxm_wmi wmi video nv_tco i2c_nforce2 button i2c_core rfkill ext4 mbcache jbd2 crc16 sg sr_mod cdrom sd_mod crc_t10dif firewire_ohci sdhci_pci ata_generic sdhci mmc_core firewire_core pata_amd crc_itu_t sata_nv libata thermal thermal_sys scsi_mod [last unloaded: mii]
[  340.227763] 
[  340.227766] Pid: 1983, comm: sh Not tainted 3.1.0-rc2+ #8 ASUSTeK Computer INC. A7T/A7T
[  340.227771] EIP: 0060:[<c103b782>] EFLAGS: 00000206 CPU: 0
[  340.227777] EIP is at arch_local_irq_enable+0x2/0x7
[  340.227781] EAX: 00000000 EBX: 00000282 ECX: fffff000 EDX: f5c0c000
[  340.227784] ESI: f4c16000 EDI: c103c0d5 EBP: 00000046 ESP: f5c0dfdc
[  340.227787]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[  340.227791] Process sh (pid: 1983, ti=f5c0c000 task=f502a620 task.ti=f4c16000)
[  340.227793] Stack:
[  340.227795]  c103c117 00000282 0000000a 00000000 f4c17d0c f4c16000 c103c0d5 00000046
[  340.227802]  c100ccb0
[  340.227804] Call Trace:
[  340.227809]  [<c103c117>] ? __do_softirq+0x42/0x12f
[  340.227813]  [<c103c0d5>] ? local_bh_enable+0x2/0x2
[  340.227815]  <IRQ> 
[  340.227819]  [<c103c35a>] ? irq_exit+0x32/0x80
[  340.227825]  [<c101dbc4>] ? smp_apic_timer_interrupt+0x5b/0x65
[  340.227829]  [<c12ad009>] ? apic_timer_interrupt+0x31/0x38
[  340.227835]  [<c10971b3>] ? get_page_from_freelist+0x2fb/0x36a
[  340.227840]  [<c109743a>] ? __alloc_pages_nodemask+0x105/0x5db
[  340.227845]  [<c102964d>] ? should_resched+0x5/0x1e
[  340.227850]  [<c12ab63a>] ? _cond_resched+0x5/0x18
[  340.227856]  [<c10b0735>] ? anon_vma_prepare+0x11/0xf6
[  340.227860]  [<c10a93c0>] ? handle_pte_fault+0x18d/0x8c9
[  340.227865]  [<c10a3008>] ? inc_zone_page_state+0x1c/0x1e
[  340.227871]  [<c102857e>] ? kmap_atomic_prot+0xc6/0xdb
[  340.227875]  [<c10a9d66>] ? handle_mm_fault+0x1ee/0x1fd
[  340.227879]  [<c10aa074>] ? __get_user_pages+0x288/0x3a3
[  340.227884]  [<c10cb761>] ? get_arg_page+0x2f/0x8a
[  340.227888]  [<c10cb8ba>] ? copy_strings+0xfe/0x1a0
[  340.227892]  [<c10cb975>] ? copy_strings_kernel+0x19/0x27
[  340.227896]  [<c10cc670>] ? do_execve+0x13d/0x24f
[  340.227901]  [<c1010eb1>] ? sys_execve+0x2c/0x53
[  340.227906]  [<c12b0d2e>] ? ptregs_execve+0x12/0x18
[  340.227911]  [<c12b0c5f>] ? sysenter_do_call+0x12/0x28
[  340.227913] Code: 24 8b 54 24 04 83 c4 08 5b 5e c3 90 90 f0 0f ab 02 19 c0 c3 9c 58 8d 74 26 00 c3 50 9d 8d 74 26 00 c3 fa 90 8d 74 26 00 c3 fb 90 <8d> 74 26 00 c3 f0 80 60 04 fd c3 c7 00 00 00 00 00 c7 40 04 00 
[  340.227941] Call Trace:
[  340.227945]  [<c103c117>] ? __do_softirq+0x42/0x12f
[  340.227949]  [<c103c0d5>] ? local_bh_enable+0x2/0x2
[  340.227951]  <IRQ>  [<c103c35a>] ? irq_exit+0x32/0x80
[  340.227958]  [<c101dbc4>] ? smp_apic_timer_interrupt+0x5b/0x65
[  340.227962]  [<c12ad009>] ? apic_timer_interrupt+0x31/0x38
[  340.227967]  [<c10971b3>] ? get_page_from_freelist+0x2fb/0x36a
[  340.227971]  [<c109743a>] ? __alloc_pages_nodemask+0x105/0x5db
[  340.227976]  [<c102964d>] ? should_resched+0x5/0x1e
[  340.227981]  [<c12ab63a>] ? _cond_resched+0x5/0x18
[  340.227985]  [<c10b0735>] ? anon_vma_prepare+0x11/0xf6
[  340.227989]  [<c10a93c0>] ? handle_pte_fault+0x18d/0x8c9
[  340.227993]  [<c10a3008>] ? inc_zone_page_state+0x1c/0x1e
[  340.227998]  [<c102857e>] ? kmap_atomic_prot+0xc6/0xdb
[  340.228002]  [<c10a9d66>] ? handle_mm_fault+0x1ee/0x1fd
[  340.228006]  [<c10aa074>] ? __get_user_pages+0x288/0x3a3
[  340.228010]  [<c10cb761>] ? get_arg_page+0x2f/0x8a
[  340.228014]  [<c10cb8ba>] ? copy_strings+0xfe/0x1a0
[  340.228018]  [<c10cb975>] ? copy_strings_kernel+0x19/0x27
[  340.228022]  [<c10cc670>] ? do_execve+0x13d/0x24f
[  340.228026]  [<c1010eb1>] ? sys_execve+0x2c/0x53
[  340.228031]  [<c12b0d2e>] ? ptregs_execve+0x12/0x18
[  340.228035]  [<c12b0c5f>] ? sysenter_do_call+0x12/0x28
[  362.097977] [drm] nouveau 0000:04:00.0: PFIFO_DMA_PUSHER - Ch 0 Get 0x0000a984 Put 0x00006ddc State 0x80006c80 (err: INVALID_CMD) Push 0x00000000
[  364.303008] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[  364.303560] r8169 0000:05:00.0: PCI INT A -> Link[LNKA] -> GSI 18 (level, low) -> IRQ 18
[  364.304130] r8169 0000:05:00.0: (unregistered net_device): not PCI Express
[  364.305473] r8169 0000:05:00.0: eth0: RTL8169sb/8110sb at 0xf820ec00, 00:18:f3:49:84:f8, XID 10000000 IRQ 18
[  364.374057] EXT4-fs (sda2): re-mounted. Opts: discard,user_xattr,commit=0
[  365.016653] Synaptics Touchpad, model: 1, fw: 6.1, id: 0xa3a0b3, caps: 0xa04713/0x10008/0x0
[  365.055538] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio4/input/input13
[  365.134752] r8169 0000:05:00.0: eth0: link down
[  365.135293] r8169 0000:05:00.0: eth0: link down
[  365.138524] ADDRCONF(NETDEV_UP): eth0: link is not ready
[  367.057353] r8169 0000:05:00.0: eth0: link down
[  367.058133] ADDRCONF(NETDEV_UP): eth0: link is not ready
[  367.129386] r8169 0000:05:00.0: eth0: link down
[  367.130166] ADDRCONF(NETDEV_UP): eth0: link is not ready
[  369.514150] r8169 0000:05:00.0: eth0: link up
[  369.517363] ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  379.536053] eth0: no IPv6 routers present

============================== DMESG ==============================
