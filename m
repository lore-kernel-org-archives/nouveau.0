From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54830] New: Display is shifted to right (ASUS VS197)
Date: Wed, 12 Sep 2012 23:22:36 +0000
Message-ID: <bug-54830-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54830

             Bug #: 54830
           Summary: Display is shifted to right (ASUS VS197)
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: javibarroso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 67066
  --> https://bugs.freedesktop.org/attachment.cgi?id=67066
dmesg output

Hello,

I'm using debian sid, with its xorg/nouveau version:
ii  xserver-xorg                    1:7.7+1              amd64
ii  xserver-xorg-video-nouveau      1:1.0.1-3            amd64

I'm attaching Xorg.0.log and dmesg output, as required in instructions.

I read in
http://mac.linux.be/content/howto-fix-20-g5-imac-display-shift-nv-debian about
how to fix a similar issue with nv driver. I cannot see the equivalent in
nouveau source.

Do you have any hint (I cannot use monitor button, because this is a shared
computer (and it has 2 different OS))?

Thanks !
xrandr output is:
Screen 0: minimum 320 x 200, current 1366 x 768, maximum 4096 x 4096
VGA-1 connected 1366x768+0+0 (normal left inverted right x axis y axis) 410mm x
230mm
   1366x768       59.8*+
   1280x720       60.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  

No xorg.conf is configured ( I tried some combinations, but none helped to me)
dmesg output:
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.2.0-3-amd64 (Debian 3.2.23-1)
(debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org) (gcc version 4.6.3 (Debian 4.6.3-8) ) #1 SMP
Mon Jul 23 02:45:17 UTC 2012
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-3.2.0-3-amd64
root=UUID=02759007-1b38-42f2-8f29-d670db72d7a6 ro quiet
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009f800 (usable)
[    0.000000]  BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 000000007bff0000 (usable)
[    0.000000]  BIOS-e820: 000000007bff0000 - 000000007bff3000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007bff3000 - 000000007c000000 (ACPI data)
[    0.000000]  BIOS-e820: 000000007c000000 - 0000000080000000 (reserved)
[    0.000000]  BIOS-e820: 00000000f0000000 - 00000000f2000000 (reserved)
[    0.000000]  BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI 2.4 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. M61P-S3/M61P-S3, BIOS F5
06/21/2007
[    0.000000] e820 update range: 0000000000000000 - 0000000000010000 (usable)
==> (reserved)
[    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
[    0.000000] No AGP bridge found
[    0.000000] last_pfn = 0x7bff0 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-C7FFF write-protect
[    0.000000]   C8000-EFFFF uncachable
[    0.000000]   F0000-FFFFF write-through
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0000000000 mask FF80000000 write-back
[    0.000000]   1 base 007C000000 mask FFFC000000 uncachable
[    0.000000]   2 disabled
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] found SMP MP-table at [ffff8800000f4ae0] f4ae0
[    0.000000] initial memory mapped : 0 - 20000000
[    0.000000] Base memory trampoline at [ffff88000009a000] 9a000 size 20480
[    0.000000] init_memory_mapping: 0000000000000000-000000007bff0000
[    0.000000]  0000000000 - 007be00000 page 2M
[    0.000000]  007be00000 - 007bff0000 page 4k
[    0.000000] kernel direct mapping tables up to 7bff0000 @ 1fffc000-20000000
[    0.000000] RAMDISK: 36bfe000 - 375f7000
[    0.000000] ACPI: RSDP 00000000000f64a0 00014 (v00 GBT   )
[    0.000000] ACPI: RSDT 000000007bff3000 00038 (v01 GBT    NVDAACPI 42302E31
NVDA 01010101)
[    0.000000] ACPI: FACP 000000007bff3040 00074 (v01 GBT    NVDAACPI 42302E31
NVDA 01010101)
[    0.000000] ACPI: DSDT 000000007bff30c0 046EB (v01 GBT    NVDAACPI 00001000
MSFT 0100000C)
[    0.000000] ACPI: FACS 000000007bff0000 00040
[    0.000000] ACPI: SSDT 000000007bff7840 00206 (v01 PTLTD  POWERNOW 00000001 
LTP 00000001)
[    0.000000] ACPI: HPET 000000007bff7a80 00038 (v01 GBT    NVDAACPI 42302E31
NVDA 00000098)
[    0.000000] ACPI: MCFG 000000007bff7ac0 0003C (v01 GBT    NVDAACPI 42302E31
NVDA 01010101)
[    0.000000] ACPI: APIC 000000007bff77c0 0007C (v01 GBT    NVDAACPI 42302E31
NVDA 01010101)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] Scanning NUMA topology in Northbridge 24
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at 0000000000000000-000000007bff0000
[    0.000000] Initmem setup node 0 0000000000000000-000000007bff0000
[    0.000000]   NODE_DATA [000000007bfeb000 - 000000007bfeffff]
[    0.000000]  [ffffea0000000000-ffffea0001bfffff] PMD ->
[ffff880079600000-ffff88007b1fffff] on node 0
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000010 -> 0x00001000
[    0.000000]   DMA32    0x00001000 -> 0x00100000
[    0.000000]   Normal   empty
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[2] active PFN ranges
[    0.000000]     0: 0x00000010 -> 0x0000009f
[    0.000000]     0: 0x00000100 -> 0x0007bff0
[    0.000000] On node 0 totalpages: 507775
[    0.000000]   DMA zone: 56 pages used for memmap
[    0.000000]   DMA zone: 5 pages reserved
[    0.000000]   DMA zone: 3922 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 6888 pages used for memmap
[    0.000000]   DMA32 zone: 496904 pages, LIFO batch:31
[    0.000000] Detected use of extended apic ids on hypertransport bus
[    0.000000] ACPI: PM-Timer IO Port: 0x1008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
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
[    0.000000] ACPI: HPET id: 0x10de8201 base: 0xfeff0000
[    0.000000] SMP: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: 000000000009f000 -
00000000000a0000
[    0.000000] PM: Registered nosave memory: 00000000000a0000 -
00000000000f0000
[    0.000000] PM: Registered nosave memory: 00000000000f0000 -
0000000000100000
[    0.000000] Allocating PCI resources starting at 80000000 (gap:
80000000:70000000)
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 nr_cpu_ids:2
nr_node_ids:1
[    0.000000] PERCPU: Embedded 28 pages/cpu @ffff88007bc00000 s82816 r8192
d23680 u1048576
[    0.000000] pcpu-alloc: s82816 r8192 d23680 u1048576 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total
pages: 500826
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.2.0-3-amd64
root=UUID=02759007-1b38-42f2-8f29-d670db72d7a6 ro quiet
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Checking aperture...
[    0.000000] No AGP bridge found
[    0.000000] Node 0: aperture @ 808000000 size 32 MB
[    0.000000] Aperture beyond 4GB. Ignoring.
[    0.000000] Memory: 1983472k/2031552k available (3409k kernel code, 452k
absent, 47628k reserved, 3324k data, 572k init)
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     RCU dyntick-idle grace-period acceleration is enabled.
[    0.000000] NR_IRQS:33024 nr_irqs:512 16
[    0.000000] spurious 8259A interrupt: IRQ7.
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] hpet clockevent registered
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 2209.855 MHz processor.
[    0.000000] Marking TSC unstable due to TSCs unsynchronized
[    0.004006] Calibrating delay loop (skipped), value calculated using timer
frequency.. 4419.71 BogoMIPS (lpj=8839420)
[    0.004011] pid_max: default: 32768 minimum: 301
[    0.004073] Security Framework initialized
[    0.004079] AppArmor: AppArmor disabled by boot time parameter
[    0.004329] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes)
[    0.005394] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.005931] Mount-cache hash table entries: 256
[    0.006102] Initializing cgroup subsys cpuacct
[    0.006108] Initializing cgroup subsys memory
[    0.006125] Initializing cgroup subsys devices
[    0.006128] Initializing cgroup subsys freezer
[    0.006132] Initializing cgroup subsys net_cls
[    0.006135] Initializing cgroup subsys blkio
[    0.006147] Initializing cgroup subsys perf_event
[    0.006184] tseg: 0000000000
[    0.006208] CPU: Physical Processor ID: 0
[    0.006210] CPU: Processor Core ID: 0
[    0.006212] mce: CPU supports 5 MCE banks
[    0.006224] using AMD E400 aware idle routine
[    0.006553] ACPI: Core revision 20110623
[    0.012524] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.052440] CPU0: AMD Athlon(tm) 64 X2 Dual Core Processor 4200+ stepping 02
[    0.056003] Performance Events: AMD PMU driver.
[    0.056003] ... version:                0
[    0.056003] ... bit width:              48
[    0.056003] ... generic registers:      4
[    0.056003] ... value mask:             0000ffffffffffff
[    0.056003] ... max period:             00007fffffffffff
[    0.056003] ... fixed-purpose events:   0
[    0.056003] ... event mask:             000000000000000f
[    0.056003] NMI watchdog enabled, takes one hw-pmu counter.
[    0.056003] Booting Node   0, Processors  #1 Ok.
[    0.056003] smpboot cpu 1: start_ip = 9a000
[    0.140126] NMI watchdog enabled, takes one hw-pmu counter.
[    0.140151] Brought up 2 CPUs
[    0.140154] Total of 2 processors activated (8839.84 BogoMIPS).
[    0.140657] devtmpfs: initialized
[    0.144227] PM: Registering ACPI NVS region at 7bff0000 (12288 bytes)
[    0.144227] print_constraints: dummy: 
[    0.144300] NET: Registered protocol family 16
[    0.144433] node 0 link 0: io port [1000, fffff]
[    0.144437] TOM: 0000000080000000 aka 2048M
[    0.144439] node 0 link 0: mmio [f0000000, f1ffffff]
[    0.144443] node 0 link 0: mmio [a0000, bffff]
[    0.144446] node 0 link 0: mmio [80000000, ffb7ffff]
[    0.144449] bus: [00, ff] on node 0 link 0
[    0.144452] bus: 00 index 0 [io  0x0000-0xffff]
[    0.144454] bus: 00 index 1 [mem 0x80000000-0xfcffffffff]
[    0.144457] bus: 00 index 2 [mem 0x000a0000-0x000bffff]
[    0.144468] ACPI: bus type pci registered
[    0.144555] PCI: MMCONFIG for domain 0000 [bus 00-1f] at [mem
0xf0000000-0xf1ffffff] (base 0xf0000000)
[    0.144559] PCI: MMCONFIG at [mem 0xf0000000-0xf1ffffff] reserved in E820
[    0.146798] PCI: Using configuration type 1 for base access
[    0.148078] bio: create slab <bio-0> at 0
[    0.148131] ACPI: Added _OSI(Module Device)
[    0.148131] ACPI: Added _OSI(Processor Device)
[    0.148131] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.148131] ACPI: Added _OSI(Processor Aggregator Device)
[    0.148933] ACPI: EC: Look up EC in DSDT
[    0.153804] ACPI: Interpreter enabled
[    0.153812] ACPI: (supports S0 S1 S4 S5)
[    0.153837] ACPI: Using IOAPIC for interrupt routing
[    0.161044] ACPI: No dock devices found.
[    0.161048] HEST: Table not found.
[    0.161053] PCI: Ignoring host bridge windows from ACPI; if necessary, use
"pci=use_crs" and report a bug
[    0.161122] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.161259] pci_root PNP0A08:00: host bridge window [io  0x0000-0x0cf7]
(ignored)
[    0.161263] pci_root PNP0A08:00: host bridge window [io  0x0d00-0xffff]
(ignored)
[    0.161266] pci_root PNP0A08:00: host bridge window [mem
0x000a0000-0x000bffff] (ignored)
[    0.161269] pci_root PNP0A08:00: host bridge window [mem
0x000c0000-0x000dffff] (ignored)
[    0.161272] pci_root PNP0A08:00: host bridge window [mem
0x7c000000-0xfebfffff] (ignored)
[    0.161297] pci 0000:00:00.0: [10de:03ea] type 0 class 0x000500
[    0.161473] pci 0000:00:01.0: [10de:03e0] type 0 class 0x000601
[    0.161516] pci 0000:00:01.1: [10de:03eb] type 0 class 0x000c05
[    0.161527] pci 0000:00:01.1: reg 10: [io  0xb800-0xb83f]
[    0.161543] pci 0000:00:01.1: reg 20: [io  0x1c00-0x1c3f]
[    0.161548] pci 0000:00:01.1: reg 24: [io  0x1c40-0x1c7f]
[    0.161577] pci 0000:00:01.1: PME# supported from D3hot D3cold
[    0.161583] pci 0000:00:01.1: PME# disabled
[    0.161596] pci 0000:00:01.2: [10de:03f5] type 0 class 0x000500
[    0.161642] pci 0000:00:02.0: [10de:03f1] type 0 class 0x000c03
[    0.161651] pci 0000:00:02.0: reg 10: [mem 0xf5105000-0xf5105fff]
[    0.161684] pci 0000:00:02.0: supports D1 D2
[    0.161687] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.161690] pci 0000:00:02.0: PME# disabled
[    0.161705] pci 0000:00:02.1: [10de:03f2] type 0 class 0x000c03
[    0.161715] pci 0000:00:02.1: reg 10: [mem 0xf5106000-0xf51060ff]
[    0.161754] pci 0000:00:02.1: supports D1 D2
[    0.161757] pci 0000:00:02.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.161760] pci 0000:00:02.1: PME# disabled
[    0.161781] pci 0000:00:04.0: [10de:03f3] type 1 class 0x000604
[    0.161823] pci 0000:00:05.0: [10de:03f0] type 0 class 0x000403
[    0.161834] pci 0000:00:05.0: reg 10: [mem 0xf5100000-0xf5103fff]
[    0.161874] pci 0000:00:05.0: PME# supported from D3hot D3cold
[    0.161878] pci 0000:00:05.0: PME# disabled
[    0.161899] pci 0000:00:06.0: [10de:03ec] type 0 class 0x000101
[    0.161920] pci 0000:00:06.0: reg 20: [io  0xf000-0xf00f]
[    0.161953] pci 0000:00:07.0: [10de:03ef] type 0 class 0x000680
[    0.161963] pci 0000:00:07.0: reg 10: [mem 0xf5107000-0xf5107fff]
[    0.161968] pci 0000:00:07.0: reg 14: [io  0xbc00-0xbc07]
[    0.162001] pci 0000:00:07.0: supports D1 D2
[    0.162003] pci 0000:00:07.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.162008] pci 0000:00:07.0: PME# disabled
[    0.162024] pci 0000:00:08.0: [10de:03f6] type 0 class 0x000101
[    0.162032] pci 0000:00:08.0: reg 10: [io  0x09f0-0x09f7]
[    0.162037] pci 0000:00:08.0: reg 14: [io  0x0bf0-0x0bf3]
[    0.162042] pci 0000:00:08.0: reg 18: [io  0x0970-0x0977]
[    0.162047] pci 0000:00:08.0: reg 1c: [io  0x0b70-0x0b73]
[    0.162052] pci 0000:00:08.0: reg 20: [io  0xd000-0xd00f]
[    0.162057] pci 0000:00:08.0: reg 24: [mem 0xf5108000-0xf5108fff]
[    0.162087] pci 0000:00:08.1: [10de:03f6] type 0 class 0x000101
[    0.162095] pci 0000:00:08.1: reg 10: [io  0x09e0-0x09e7]
[    0.162100] pci 0000:00:08.1: reg 14: [io  0x0be0-0x0be3]
[    0.162105] pci 0000:00:08.1: reg 18: [io  0x0960-0x0967]
[    0.162109] pci 0000:00:08.1: reg 1c: [io  0x0b60-0x0b63]
[    0.162114] pci 0000:00:08.1: reg 20: [io  0xe400-0xe40f]
[    0.162119] pci 0000:00:08.1: reg 24: [mem 0xf5104000-0xf5104fff]
[    0.162157] pci 0000:00:0d.0: [10de:03d0] type 0 class 0x000300
[    0.162164] pci 0000:00:0d.0: reg 10: [mem 0xf2000000-0xf2ffffff]
[    0.162169] pci 0000:00:0d.0: reg 14: [mem 0xe0000000-0xefffffff 64bit pref]
[    0.162175] pci 0000:00:0d.0: reg 1c: [mem 0xf3000000-0xf3ffffff 64bit]
[    0.162182] pci 0000:00:0d.0: reg 30: [mem 0x00000000-0x0001ffff pref]
[    0.162211] pci 0000:00:18.0: [1022:1100] type 0 class 0x000600
[    0.162233] pci 0000:00:18.1: [1022:1101] type 0 class 0x000600
[    0.162250] pci 0000:00:18.2: [1022:1102] type 0 class 0x000600
[    0.162268] pci 0000:00:18.3: [1022:1103] type 0 class 0x000600
[    0.162290] PCI: peer root bus 00 res updated from pci conf
[    0.162325] pci 0000:01:07.0: [10ec:8139] type 0 class 0x000200
[    0.162338] pci 0000:01:07.0: reg 10: [io  0xa000-0xa0ff]
[    0.162346] pci 0000:01:07.0: reg 14: [mem 0xf5005000-0xf50050ff]
[    0.162392] pci 0000:01:07.0: supports D1 D2
[    0.162395] pci 0000:01:07.0: PME# supported from D1 D2 D3hot D3cold
[    0.162399] pci 0000:01:07.0: PME# disabled
[    0.162421] pci 0000:01:0e.0: [104c:8024] type 0 class 0x000c00
[    0.162434] pci 0000:01:0e.0: reg 10: [mem 0xf5004000-0xf50047ff]
[    0.162442] pci 0000:01:0e.0: reg 14: [mem 0xf5000000-0xf5003fff]
[    0.162490] pci 0000:01:0e.0: supports D1 D2
[    0.162493] pci 0000:01:0e.0: PME# supported from D0 D1 D2 D3hot
[    0.162497] pci 0000:01:0e.0: PME# disabled
[    0.162517] pci 0000:00:04.0: PCI bridge to [bus 01-01] (subtractive decode)
[    0.162521] pci 0000:00:04.0:   bridge window [io  0xa000-0xafff]
[    0.162524] pci 0000:00:04.0:   bridge window [mem 0xf5000000-0xf50fffff]
[    0.162528] pci 0000:00:04.0:   bridge window [io  0x0000-0xffff]
(subtractive decode)
[    0.162531] pci 0000:00:04.0:   bridge window [mem 0x80000000-0xfcffffffff]
(subtractive decode)
[    0.162535] pci 0000:00:04.0:   bridge window [mem 0x000a0000-0x000bffff]
(subtractive decode)
[    0.162542] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.162761] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.HUB0._PRT]
[    0.162993]  pci0000:00: Requesting ACPI _OSC control (0x1d)
[    0.162997]  pci0000:00: ACPI _OSC request failed (AE_NOT_FOUND), returned
control mask: 0x1d
[    0.162999] ACPI _OSC control for PCIe not granted, disabling ASPM
[    0.185760] ACPI: PCI Interrupt Link [LNK1] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.185827] ACPI: PCI Interrupt Link [LNK2] (IRQs *5 7 9 10 11 14 15)
[    0.185882] ACPI: PCI Interrupt Link [LNK3] (IRQs 5 7 9 10 *11 14 15)
[    0.185935] ACPI: PCI Interrupt Link [LNK4] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.185989] ACPI: PCI Interrupt Link [LNK5] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186043] ACPI: PCI Interrupt Link [LNK6] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186096] ACPI: PCI Interrupt Link [LNK7] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186152] ACPI: PCI Interrupt Link [LNK8] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186208] ACPI: PCI Interrupt Link [LIGP] (IRQs 5 7 9 *10 11 14 15)
[    0.186262] ACPI: PCI Interrupt Link [LP2P] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186318] ACPI: PCI Interrupt Link [LUBA] (IRQs *5 7 9 10 11 14 15)
[    0.186373] ACPI: PCI Interrupt Link [LMAC] (IRQs 5 7 9 10 *11 14 15)
[    0.186428] ACPI: PCI Interrupt Link [LAZA] (IRQs *5 7 9 10 11 14 15)
[    0.186481] ACPI: PCI Interrupt Link [LPMU] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186537] ACPI: PCI Interrupt Link [LSMB] (IRQs 5 7 9 10 *11 14 15)
[    0.186592] ACPI: PCI Interrupt Link [LUB2] (IRQs 5 7 9 *10 11 14 15)
[    0.186646] ACPI: PCI Interrupt Link [LIDE] (IRQs 5 7 9 10 11 14 15) *0,
disabled.
[    0.186702] ACPI: PCI Interrupt Link [LSID] (IRQs 5 7 9 10 *11 14 15)
[    0.186756] ACPI: PCI Interrupt Link [LFID] (IRQs 5 7 9 *10 11 14 15)
[    0.186860] ACPI: PCI Interrupt Link [APC1] (IRQs 16) *0, disabled.
[    0.186959] ACPI: PCI Interrupt Link [APC2] (IRQs 17) *0
[    0.187056] ACPI: PCI Interrupt Link [APC3] (IRQs 18) *0
[    0.187153] ACPI: PCI Interrupt Link [APC4] (IRQs 19) *0, disabled.
[    0.187250] ACPI: PCI Interrupt Link [APC5] (IRQs 16) *0, disabled.
[    0.187346] ACPI: PCI Interrupt Link [APC6] (IRQs 16) *0, disabled.
[    0.187442] ACPI: PCI Interrupt Link [APC7] (IRQs 16) *0, disabled.
[    0.187539] ACPI: PCI Interrupt Link [APC8] (IRQs 16) *0, disabled.
[    0.187635] ACPI: PCI Interrupt Link [AIGP] (IRQs 20 21 22 23) *0
[    0.187733] ACPI: PCI Interrupt Link [APCF] (IRQs 20 21 22 23) *0
[    0.187830] ACPI: PCI Interrupt Link [APCH] (IRQs 20 21 22 23) *0
[    0.187928] ACPI: PCI Interrupt Link [APMU] (IRQs 20 21 22 23) *0, disabled.
[    0.188034] ACPI: PCI Interrupt Link [AAZA] (IRQs 20 21 22 23) *0
[    0.188132] ACPI: PCI Interrupt Link [APCS] (IRQs 20 21 22 23) *0
[    0.188229] ACPI: PCI Interrupt Link [APCL] (IRQs 20 21 22 23) *0
[    0.188328] ACPI: PCI Interrupt Link [APCM] (IRQs 20 21 22 23) *0, disabled.
[    0.188426] ACPI: PCI Interrupt Link [APCZ] (IRQs 20 21 22 23) *0, disabled.
[    0.188525] ACPI: PCI Interrupt Link [APSI] (IRQs 20 21 22 23) *0
[    0.188623] ACPI: PCI Interrupt Link [APSJ] (IRQs 20 21 22 23) *0
[    0.188759] vgaarb: device added:
PCI:0000:00:0d.0,decodes=io+mem,owns=io+mem,locks=none
[    0.188759] vgaarb: loaded
[    0.188759] vgaarb: bridge control possible 0000:00:0d.0
[    0.188759] PCI: Using ACPI for IRQ routing
[    0.188832] PCI: pci_cache_line_size set to 64 bytes
[    0.188888] reserve RAM buffer: 000000000009f800 - 000000000009ffff 
[    0.188891] reserve RAM buffer: 000000007bff0000 - 000000007bffffff 
[    0.189038] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
[    0.189045] hpet0: at MMIO 0xfeff0000, IRQs 2, 8, 31
[    0.189050] hpet0: 3 comparators, 32-bit 25.000000 MHz counter
[    0.192139] Switching to clocksource hpet
[    0.194594] pnp: PnP ACPI init
[    0.194620] ACPI: bus type pnp registered
[    0.194742] pnp 00:00: [bus 00-ff]
[    0.194745] pnp 00:00: [io  0x0cf8-0x0cff]
[    0.194748] pnp 00:00: [io  0x0000-0x0cf7 window]
[    0.194751] pnp 00:00: [io  0x0d00-0xffff window]
[    0.194754] pnp 00:00: [mem 0x000a0000-0x000bffff window]
[    0.194757] pnp 00:00: [mem 0x000c0000-0x000dffff window]
[    0.194760] pnp 00:00: [mem 0x7c000000-0xfebfffff window]
[    0.194847] pnp 00:00: Plug and Play ACPI device, IDs PNP0a08 PNP0a03
(active)
[    0.194938] pnp 00:01: [io  0x1000-0x107f]
[    0.194941] pnp 00:01: [io  0x1080-0x10ff]
[    0.194944] pnp 00:01: [io  0x1400-0x147f]
[    0.194948] pnp 00:01: [io  0x1480-0x14ff]
[    0.194951] pnp 00:01: [io  0x1800-0x187f]
[    0.194953] pnp 00:01: [io  0x1880-0x18ff]
[    0.194956] pnp 00:01: [mem 0xfefe0000-0xfefe01ff]
[    0.194959] pnp 00:01: [mem 0xfefe1000-0xfefe10ff]
[    0.194961] pnp 00:01: [mem 0x7c000000-0x7fffffff]
[    0.195034] system 00:01: [io  0x1000-0x107f] has been reserved
[    0.195038] system 00:01: [io  0x1080-0x10ff] has been reserved
[    0.195041] system 00:01: [io  0x1400-0x147f] has been reserved
[    0.195044] system 00:01: [io  0x1480-0x14ff] has been reserved
[    0.195047] system 00:01: [io  0x1800-0x187f] has been reserved
[    0.195051] system 00:01: [io  0x1880-0x18ff] has been reserved
[    0.195055] system 00:01: [mem 0xfefe0000-0xfefe01ff] has been reserved
[    0.195059] system 00:01: [mem 0xfefe1000-0xfefe10ff] has been reserved
[    0.195062] system 00:01: [mem 0x7c000000-0x7fffffff] has been reserved
[    0.195066] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.195131] pnp 00:02: [io  0x0010-0x001f]
[    0.195134] pnp 00:02: [io  0x0022-0x003f]
[    0.195136] pnp 00:02: [io  0x0044-0x005f]
[    0.195139] pnp 00:02: [io  0x0062-0x0063]
[    0.195141] pnp 00:02: [io  0x0065-0x006f]
[    0.195144] pnp 00:02: [io  0x0074-0x007f]
[    0.195147] pnp 00:02: [io  0x0091-0x0093]
[    0.195149] pnp 00:02: [io  0x00a2-0x00bf]
[    0.195152] pnp 00:02: [io  0x00e0-0x00ef]
[    0.195154] pnp 00:02: [io  0x04d0-0x04d1]
[    0.195157] pnp 00:02: [io  0x0800-0x087f]
[    0.195159] pnp 00:02: [io  0x0295-0x0314]
[    0.195162] pnp 00:02: [io  0x0290-0x0294]
[    0.195230] system 00:02: [io  0x04d0-0x04d1] has been reserved
[    0.195233] system 00:02: [io  0x0800-0x087f] has been reserved
[    0.195237] system 00:02: [io  0x0295-0x0314] has been reserved
[    0.195240] system 00:02: [io  0x0290-0x0294] has been reserved
[    0.195244] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.195259] pnp 00:03: [dma 4]
[    0.195262] pnp 00:03: [io  0x0000-0x000f]
[    0.195265] pnp 00:03: [io  0x0080-0x0090]
[    0.195267] pnp 00:03: [io  0x0094-0x009f]
[    0.195270] pnp 00:03: [io  0x00c0-0x00df]
[    0.195305] pnp 00:03: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.195319] pnp 00:04: [io  0x0070-0x0073]
[    0.195333] pnp 00:04: [irq 8]
[    0.195375] pnp 00:04: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.195388] pnp 00:05: [io  0x0061]
[    0.195426] pnp 00:05: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.195439] pnp 00:06: [io  0x00f0-0x00ff]
[    0.195446] pnp 00:06: [irq 13]
[    0.195485] pnp 00:06: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.195642] pnp 00:07: [io  0x03f0-0x03f5]
[    0.195644] pnp 00:07: [io  0x03f7]
[    0.195651] pnp 00:07: [irq 6]
[    0.195653] pnp 00:07: [dma 2]
[    0.195709] pnp 00:07: Plug and Play ACPI device, IDs PNP0700 (active)
[    0.195910] pnp 00:08: [io  0x03f8-0x03ff]
[    0.195917] pnp 00:08: [irq 4]
[    0.195994] pnp 00:08: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.196234] pnp 00:09: [io  0x02f8-0x02ff]
[    0.196240] pnp 00:09: [irq 3]
[    0.196312] pnp 00:09: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.196552] pnp 00:0a: [io  0x0378-0x037f]
[    0.196559] pnp 00:0a: [irq 7]
[    0.196625] pnp 00:0a: Plug and Play ACPI device, IDs PNP0400 (active)
[    0.196740] pnp 00:0b: [io  0x0060]
[    0.196742] pnp 00:0b: [io  0x0064]
[    0.196748] pnp 00:0b: [irq 1]
[    0.196791] pnp 00:0b: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.197466] pnp 00:0c: [mem 0xf0000000-0xf1ffffff]
[    0.197541] system 00:0c: [mem 0xf0000000-0xf1ffffff] has been reserved
[    0.197544] system 00:0c: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.197729] pnp 00:0d: [mem 0x000cec00-0x000cffff]
[    0.197732] pnp 00:0d: [mem 0x000f0000-0x000f7fff]
[    0.197735] pnp 00:0d: [mem 0x000f8000-0x000fbfff]
[    0.197738] pnp 00:0d: [mem 0x000fc000-0x000fffff]
[    0.197741] pnp 00:0d: [mem 0x7bff0000-0x7bffffff]
[    0.197743] pnp 00:0d: [mem 0xffff0000-0xffffffff]
[    0.197746] pnp 00:0d: [mem 0x00000000-0x0009ffff]
[    0.197748] pnp 00:0d: [mem 0x00100000-0x7bfeffff]
[    0.197751] pnp 00:0d: [mem 0x7c000000-0x7fffffff]
[    0.197753] pnp 00:0d: [mem 0xfec00000-0xfec00fff]
[    0.197756] pnp 00:0d: [mem 0xfee00000-0xfee00fff]
[    0.197836] system 00:0d: [mem 0x000cec00-0x000cffff] has been reserved
[    0.197840] system 00:0d: [mem 0x000f0000-0x000f7fff] could not be reserved
[    0.197843] system 00:0d: [mem 0x000f8000-0x000fbfff] could not be reserved
[    0.197847] system 00:0d: [mem 0x000fc000-0x000fffff] could not be reserved
[    0.197850] system 00:0d: [mem 0x7bff0000-0x7bffffff] could not be reserved
[    0.197854] system 00:0d: [mem 0xffff0000-0xffffffff] has been reserved
[    0.197857] system 00:0d: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.197861] system 00:0d: [mem 0x00100000-0x7bfeffff] could not be reserved
[    0.197864] system 00:0d: [mem 0x7c000000-0x7fffffff] has been reserved
[    0.197868] system 00:0d: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.197871] system 00:0d: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.197875] system 00:0d: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.197895] pnp: PnP ACPI: found 14 devices
[    0.197897] ACPI: ACPI bus type pnp unregistered
[    0.205778] PCI: max bus depth: 1 pci_try_num: 2
[    0.205796] pci 0000:00:0d.0: BAR 6: assigned [mem 0x80000000-0x8001ffff
pref]
[    0.205801] pci 0000:00:04.0: PCI bridge to [bus 01-01]
[    0.205804] pci 0000:00:04.0:   bridge window [io  0xa000-0xafff]
[    0.205808] pci 0000:00:04.0:   bridge window [mem 0xf5000000-0xf50fffff]
[    0.205820] pci 0000:00:04.0: setting latency timer to 64
[    0.205823] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.205826] pci_bus 0000:00: resource 5 [mem 0x80000000-0xfcffffffff]
[    0.205829] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.205832] pci_bus 0000:01: resource 0 [io  0xa000-0xafff]
[    0.205835] pci_bus 0000:01: resource 1 [mem 0xf5000000-0xf50fffff]
[    0.205838] pci_bus 0000:01: resource 4 [io  0x0000-0xffff]
[    0.205840] pci_bus 0000:01: resource 5 [mem 0x80000000-0xfcffffffff]
[    0.205843] pci_bus 0000:01: resource 6 [mem 0x000a0000-0x000bffff]
[    0.205933] NET: Registered protocol family 2
[    0.206076] IP route cache hash table entries: 65536 (order: 7, 524288
bytes)
[    0.207136] TCP established hash table entries: 262144 (order: 10, 4194304
bytes)
[    0.209045] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.209535] TCP: Hash tables configured (established 262144 bind 65536)
[    0.209538] TCP reno registered
[    0.209550] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    0.209576] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    0.209733] NET: Registered protocol family 1
[    0.210014] ACPI: PCI Interrupt Link [APCF] enabled at IRQ 23
[    0.210030] pci 0000:00:02.0: PCI INT A -> Link[APCF] -> GSI 23 (level, low)
-> IRQ 23
[    0.210051] pci 0000:00:02.0: PCI INT A disabled
[    0.210219] ACPI: PCI Interrupt Link [APCL] enabled at IRQ 22
[    0.210229] pci 0000:00:02.1: PCI INT B -> Link[APCL] -> GSI 22 (level, low)
-> IRQ 22
[    0.210242] pci 0000:00:02.1: PCI INT B disabled
[    0.210285] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.210332] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.210389] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.210444] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.210499] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.210506] pci 0000:00:0d.0: Boot video device
[    0.210523] PCI: CLS 32 bytes, default 64
[    0.210596] Unpacking initramfs...
[    0.495457] Freeing initrd memory: 10212k freed
[    0.502399] audit: initializing netlink socket (disabled)
[    0.502417] type=2000 audit(1347495143.496:1): initialized
[    0.525090] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.539529] VFS: Disk quotas dquot_6.5.2
[    0.539570] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.539658] msgmni has been set to 3893
[    0.539859] alg: No test for stdrng (krng)
[    0.539902] Block layer SCSI generic (bsg) driver version 0.4 loaded (major
253)
[    0.539905] io scheduler noop registered
[    0.539907] io scheduler deadline registered
[    0.539927] io scheduler cfq registered (default)
[    0.540074] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.540108] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.540111] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.540582] ERST: Table is not found!
[    0.540584] GHES: HEST is not enabled!
[    0.540663] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.560996] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.600311] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[    0.640510] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.676408] 00:09: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[    0.692245] Linux agpgart interface v0.103
[    0.692382] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    0.692384] i8042: PNP: PS/2 appears to have AUX port disabled, if this is
incorrect please boot with i8042.nopnp
[    0.692559] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.692708] mousedev: PS/2 mouse device common for all mice
[    0.692771] rtc_cmos 00:04: RTC can wake from S4
[    0.692924] rtc_cmos 00:04: rtc core: registered rtc_cmos as rtc0
[    0.692960] rtc0: alarms up to one year, y3k, 242 bytes nvram, hpet irqs
[    0.692975] cpuidle: using governor ladder
[    0.692977] cpuidle: using governor menu
[    0.693222] TCP cubic registered
[    0.693285] NET: Registered protocol family 10
[    0.693857] Mobile IPv6
[    0.693860] NET: Registered protocol family 17
[    0.693865] Registering the dns_resolver key type
[    0.694042] PM: Hibernation image not present or could not be loaded.
[    0.694055] registered taskstats version 1
[    0.701448] rtc_cmos 00:04: setting system clock to 2012-09-13 00:12:23 UTC
(1347495143)
[    0.701499] Initializing network drop monitor service
[    0.702995] Freeing unused kernel memory: 572k freed
[    0.703267] Write protecting the kernel read-only data: 6144k
[    0.706479] Freeing unused kernel memory: 668k freed
[    0.710051] Freeing unused kernel memory: 684k freed
[    0.718255] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    0.734193] udevd[72]: starting version 175
[    0.784411] forcedeth: Reverse Engineered nForce ethernet driver. Version
0.64.
[    0.784636] ACPI: PCI Interrupt Link [APCH] enabled at IRQ 21
[    0.784658] forcedeth 0000:00:07.0: PCI INT A -> Link[APCH] -> GSI 21
(level, low) -> IRQ 21
[    0.784664] forcedeth 0000:00:07.0: setting latency timer to 64
[    0.789495] 8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
[    0.794305] usbcore: registered new interface driver usbfs
[    0.794335] usbcore: registered new interface driver hub
[    0.800150] usbcore: registered new device driver usb
[    0.801120] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.801167] 8139cp 0000:01:07.0: This (id 10ec:8139 rev 10) is not an 8139C+
compatible chip, use 8139too
[    0.802077] 8139too: 8139too Fast Ethernet driver 0.9.28
[    0.810754] ACPI: PCI Interrupt Link [APC2] enabled at IRQ 17
[    0.810776] 8139too 0000:01:07.0: PCI INT A -> Link[APC2] -> GSI 17 (level,
low) -> IRQ 17
[    0.811579] 8139too 0000:01:07.0: eth0: RealTek RTL8139 at
0xffffc90000306000, 00:50:bf:e5:08:74, IRQ 17
[    0.812224] SCSI subsystem initialized
[    0.827905] ACPI: PCI Interrupt Link [APC3] enabled at IRQ 18
[    0.827927] firewire_ohci 0000:01:0e.0: PCI INT A -> Link[APC3] -> GSI 18
(level, low) -> IRQ 18
[    0.828508] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.838327] libata version 3.00 loaded.
[    0.867312] Floppy drive(s): fd0 is 1.44M
[    0.880082] firewire_ohci: Added fw-ohci device 0000:01:0e.0, OHCI v1.10, 4
IR + 8 IT contexts, quirks 0x2
[    0.887625] FDC 0 is a post-1991 82077
[    1.309110] forcedeth 0000:00:07.0: ifname eth1, PHY OUI 0x732 @ 1, addr
00:1a:4d:92:56:7b
[    1.309115] forcedeth 0000:00:07.0: highdma pwrctl mgmt gbit lnktim msi
desc-v3
[    1.309439] ehci_hcd 0000:00:02.1: PCI INT B -> Link[APCL] -> GSI 22 (level,
low) -> IRQ 22
[    1.309465] ehci_hcd 0000:00:02.1: setting latency timer to 64
[    1.309469] ehci_hcd 0000:00:02.1: EHCI Host Controller
[    1.309504] ehci_hcd 0000:00:02.1: new USB bus registered, assigned bus
number 1
[    1.309631] ehci_hcd 0000:00:02.1: debug port 1
[    1.309640] ehci_hcd 0000:00:02.1: cache line size of 32 is not supported
[    1.309664] ehci_hcd 0000:00:02.1: irq 22, io mem 0xf5106000
[    1.320025] ehci_hcd 0000:00:02.1: USB 2.0 started, EHCI 1.00
[    1.320052] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    1.320055] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.320058] usb usb1: Product: EHCI Host Controller
[    1.320060] usb usb1: Manufacturer: Linux 3.2.0-3-amd64 ehci_hcd
[    1.320062] usb usb1: SerialNumber: 0000:00:02.1
[    1.320216] hub 1-0:1.0: USB hub found
[    1.320222] hub 1-0:1.0: 10 ports detected
[    1.320389] ohci_hcd 0000:00:02.0: PCI INT A -> Link[APCF] -> GSI 23 (level,
low) -> IRQ 23
[    1.320409] ohci_hcd 0000:00:02.0: setting latency timer to 64
[    1.320412] ohci_hcd 0000:00:02.0: OHCI Host Controller
[    1.320423] ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus
number 2
[    1.320455] ohci_hcd 0000:00:02.0: irq 23, io mem 0xf5105000
[    1.378032] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    1.378037] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.378040] usb usb2: Product: OHCI Host Controller
[    1.378042] usb usb2: Manufacturer: Linux 3.2.0-3-amd64 ohci_hcd
[    1.378044] usb usb2: SerialNumber: 0000:00:02.0
[    1.378209] hub 2-0:1.0: USB hub found
[    1.378216] hub 2-0:1.0: 10 ports detected
[    1.378368] pata_amd 0000:00:06.0: version 0.4.1
[    1.378424] pata_amd 0000:00:06.0: setting latency timer to 64
[    1.379022] scsi0 : pata_amd
[    1.379140] scsi1 : pata_amd
[    1.379658] ata1: PATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xf000 irq 14
[    1.379661] ata2: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0xf008 irq 15
[    1.379771] sata_nv 0000:00:08.0: version 3.5
[    1.380118] ACPI: PCI Interrupt Link [APSI] enabled at IRQ 20
[    1.380138] sata_nv 0000:00:08.0: PCI INT A -> Link[APSI] -> GSI 20 (level,
low) -> IRQ 20
[    1.380144] firewire_core: created device fw0: GUID 001a4d0000ea3f50, S400
[    1.380209] sata_nv 0000:00:08.0: setting latency timer to 64
[    1.380938] scsi2 : sata_nv
[    1.381188] scsi3 : sata_nv
[    1.381337] ata3: SATA max UDMA/133 cmd 0x9f0 ctl 0xbf0 bmdma 0xd000 irq 20
[    1.381341] ata4: SATA max UDMA/133 cmd 0x970 ctl 0xb70 bmdma 0xd008 irq 20
[    1.381667] ACPI: PCI Interrupt Link [APSJ] enabled at IRQ 23
[    1.381673] sata_nv 0000:00:08.1: PCI INT B -> Link[APSJ] -> GSI 23 (level,
low) -> IRQ 23
[    1.381726] sata_nv 0000:00:08.1: setting latency timer to 64
[    1.382027] scsi4 : sata_nv
[    1.382126] scsi5 : sata_nv
[    1.382258] ata5: SATA max UDMA/133 cmd 0x9e0 ctl 0xbe0 bmdma 0xe400 irq 23
[    1.382262] ata6: SATA max UDMA/133 cmd 0x960 ctl 0xb60 bmdma 0xe408 irq 23
[    1.552465] ata1.00: HPA detected: current 240119615, native 240121728
[    1.552471] ata1.00: ATA-7: Maxtor 6Y120L0, YAR41BW0, max UDMA/133
[    1.552475] ata1.00: 240119615 sectors, multi 16: LBA 
[    1.552483] ata1.01: ATAPI: HL-DT-ST DVDRAM GSA-4082B, A201, max UDMA/33
[    1.552491] ata1: nv_mode_filter: 0x7f39f&0x7f39f->0x7f39f, BIOS=0x7f000
(0xc7c00000) ACPI=0x7f01f (15:60:0x1f)
[    1.552497] ata1: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000
(0xc7c00000) ACPI=0x701f (15:60:0x1f)
[    1.568388] ata1.00: configured for UDMA/133
[    1.584226] ata1.01: configured for UDMA/33
[    1.586957] scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6Y120L0   YAR4
PQ: 0 ANSI: 5
[    1.592974] scsi 0:0:1:0: CD-ROM            HL-DT-ST DVDRAM GSA-4082B A201
PQ: 0 ANSI: 5
[    1.593170] ata2: port disabled--ignoring
[    1.688019] usb 1-3: new high-speed USB device number 3 using ehci_hcd
[    1.702291] ata5: SATA link down (SStatus 0 SControl 300)
[    1.702294] ata3: SATA link down (SStatus 0 SControl 300)
[    1.821437] usb 1-3: New USB device found, idVendor=04a9, idProduct=1909
[    1.821440] usb 1-3: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    1.821443] usb 1-3: Product: CanoScan
[    1.821445] usb 1-3: Manufacturer: Canon
[    1.932015] usb 1-4: new high-speed USB device number 4 using ehci_hcd
[    2.022249] ata4: SATA link down (SStatus 0 SControl 300)
[    2.103311] usb 1-4: New USB device found, idVendor=145f, idProduct=0187
[    2.103315] usb 1-4: New USB device strings: Mfr=2, Product=1,
SerialNumber=0
[    2.103317] usb 1-4: Product: Trust Webcam
[    2.103319] usb 1-4: Manufacturer: Trust Webcam
[    2.216021] usb 1-5: new high-speed USB device number 5 using ehci_hcd
[    2.358438] usb 1-5: New USB device found, idVendor=05e3, idProduct=070e
[    2.358441] usb 1-5: New USB device strings: Mfr=3, Product=4,
SerialNumber=5
[    2.358444] usb 1-5: Product: USB Reader
[    2.358446] usb 1-5: Manufacturer: Genesys 
[    2.358448] usb 1-5: SerialNumber: 3000047950
[    2.361389] usbcore: registered new interface driver uas
[    2.488043] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    2.536668] ata6.00: HPA detected: current 625140335, native 625142448
[    2.536675] ata6.00: ATA-7: MAXTOR STM3320820AS, 3.AAE, max UDMA/133
[    2.536678] ata6.00: 625140335 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    2.603310] ata6.00: configured for UDMA/133
[    2.603479] scsi 5:0:0:0: Direct-Access     ATA      MAXTOR STM332082 3.AA
PQ: 0 ANSI: 5
[    2.608555] Initializing USB Mass Storage driver...
[    2.611465] scsi6 : usb-storage 1-5:1.0
[    2.611568] usbcore: registered new interface driver usb-storage
[    2.611571] USB Mass Storage support registered.
[    2.611956] sd 0:0:0:0: [sda] 240119615 512-byte logical blocks: (122 GB/114
GiB)
[    2.612046] sd 0:0:0:0: [sda] Write Protect is off
[    2.612049] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.612072] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    2.621773] sr0: scsi3-mmc drive: 32x/32x writer dvd-ram cd/rw xa/form2 cdda
tray
[    2.621777] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.622046] sr 0:0:1:0: Attached scsi CD-ROM sr0
[    2.622186] sd 5:0:0:0: [sdb] 625140335 512-byte logical blocks: (320 GB/298
GiB)
[    2.622239] sd 5:0:0:0: [sdb] Write Protect is off
[    2.622242] sd 5:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    2.622265] sd 5:0:0:0: [sdb] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    2.626495] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    2.626583] sr 0:0:1:0: Attached scsi generic sg1 type 5
[    2.626646] sd 5:0:0:0: Attached scsi generic sg2 type 0
[    2.637102]  sda: sda1 sda2 sda3 < sda5 >
[    2.637648] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.675329]  sdb: sdb1 sdb2 < sdb5 sdb6 sdb7 > sdb3
[    2.675965] sd 5:0:0:0: [sdb] Attached SCSI disk
[    2.772031] usb 2-2: new low-speed USB device number 2 using ohci_hcd
[    2.987075] usb 2-2: New USB device found, idVendor=046d, idProduct=c040
[    2.987080] usb 2-2: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    2.987083] usb 2-2: Product: USB-PS/2 Optical Mouse
[    2.987086] usb 2-2: Manufacturer: Logitech
[    3.000351] input: Logitech USB-PS/2 Optical Mouse as
/devices/pci0000:00/0000:00:02.0/usb2/2-2/2-2:1.0/input/input1
[    3.000451] generic-usb 0003:046D:C040.0001: input,hidraw0: USB HID v1.10
Mouse [Logitech USB-PS/2 Optical Mouse] on usb-0000:00:02.0-2/input0
[    3.000478] usbcore: registered new interface driver usbhid
[    3.000480] usbhid: USB HID core driver
[    3.292029] usb 2-8: new full-speed USB device number 3 using ohci_hcd
[    3.459826] PM: Starting manual resume from disk
[    3.459831] PM: Hibernation image partition 8:22 present
[    3.459833] PM: Looking for hibernation image.
[    3.460118] PM: Image not found (code -22)
[    3.460123] PM: Hibernation image not present or could not be loaded.
[    3.493301] kjournald starting.  Commit interval 5 seconds
[    3.493341] EXT3-fs (sdb3): mounted filesystem with ordered data mode
[    3.532035] usb 2-8: New USB device found, idVendor=03f0, idProduct=0904
[    3.532040] usb 2-8: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    3.532043] usb 2-8: Product: DeskJet 845C
[    3.532045] usb 2-8: Manufacturer: Hewlett-Packard
[    3.532047] usb 2-8: SerialNumber: TH1BC1C08WSX
[    3.609211] scsi 6:0:0:0: Direct-Access     Generic  STORAGE DEVICE   9602
PQ: 0 ANSI: 0
[    3.609951] scsi 6:0:0:1: Direct-Access     Generic  STORAGE DEVICE   9602
PQ: 0 ANSI: 0
[    3.610700] scsi 6:0:0:2: Direct-Access     Generic  STORAGE DEVICE   9602
PQ: 0 ANSI: 0
[    3.611451] scsi 6:0:0:3: Direct-Access     Generic  STORAGE DEVICE   9602
PQ: 0 ANSI: 0
[    3.612127] sd 6:0:0:0: Attached scsi generic sg3 type 0
[    3.612313] sd 6:0:0:1: Attached scsi generic sg4 type 0
[    3.612495] sd 6:0:0:2: Attached scsi generic sg5 type 0
[    3.612676] sd 6:0:0:3: Attached scsi generic sg6 type 0
[    3.618456] sd 6:0:0:0: [sdc] Attached SCSI removable disk
[    3.619066] sd 6:0:0:1: [sdd] Attached SCSI removable disk
[    3.619690] sd 6:0:0:2: [sde] Attached SCSI removable disk
[    3.620317] sd 6:0:0:3: [sdf] Attached SCSI removable disk
[    5.782633] udevd[398]: starting version 175
[    6.300091] input: Power Button as
/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2
[    6.300099] ACPI: Power Button [PWRB]
[    6.300202] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    6.300206] ACPI: Power Button [PWRF]
[    6.453202] input: PC Speaker as /devices/platform/pcspkr/input/input4
[    6.935192] k8temp 0000:00:18.3: Temperature readouts might be wrong - check
erratum #141
[    7.201317] [drm] Initialized drm 1.1.0 20060810
[    7.206264] i2c i2c-0: nForce2 SMBus adapter at 0x1c00
[    7.206292] i2c i2c-1: nForce2 SMBus adapter at 0x1c40
[    7.247638] powernow-k8: Found 1 AMD Athlon(tm) 64 X2 Dual Core Processor
4200+ (2 cpu cores) (version 2.20.00)
[    7.247693] powernow-k8: fid 0xe (2200 MHz), vid 0xc
[    7.247695] powernow-k8: fid 0xc (2000 MHz), vid 0xe
[    7.247697] powernow-k8: fid 0xa (1800 MHz), vid 0x10
[    7.247699] powernow-k8: fid 0x2 (1000 MHz), vid 0x12
[    7.265845] parport_pc 00:0a: reported by Plug and Play ACPI
[    7.265898] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
[    7.277162] EDAC MC: Ver: 2.1.0
[    7.351260] MCE: In-kernel MCE decoding enabled.
[    7.356792] wmi: Mapper loaded
[    7.373208] AMD64 EDAC driver v3.4.0
[    7.376152] EDAC amd64: DRAM ECC disabled.
[    7.376171] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
[    7.376175]  Either enable ECC checking or force module loading by setting
'ecc_enable_override'.
[    7.376178]  (Note that use of the override may cause unknown side effects.)
[    7.381543] udevd[450]: renamed network interface eth1 to eth4
[    7.465049] udevd[456]: renamed network interface eth0 to eth2
[    7.666625] ACPI: PCI Interrupt Link [AAZA] enabled at IRQ 22
[    7.666641] snd_hda_intel 0000:00:05.0: PCI INT B -> Link[AAZA] -> GSI 22
(level, low) -> IRQ 22
[    7.666650] hda_intel: Disabling MSI
[    7.666707] snd_hda_intel 0000:00:05.0: setting latency timer to 64
[    8.248511] Linux media interface: v0.10
[    8.263511] Linux video capture interface: v2.00
[    8.266948] uvcvideo: Found UVC 1.00 device Trust Webcam (145f:0187)
[    8.284450] input: Trust Webcam as
/devices/pci0000:00/0000:00:02.1/usb1/1-4/1-4:1.0/input/input5
[    8.285317] usbcore: registered new interface driver uvcvideo
[    8.285325] USB Video Class driver (1.1.1)
[    8.396255] input: HDA Digital PCBeep as
/devices/pci0000:00/0000:00:05.0/input/input6
[    8.566683] ACPI: PCI Interrupt Link [AIGP] enabled at IRQ 21
[    8.566700] nouveau 0000:00:0d.0: PCI INT A -> Link[AIGP] -> GSI 21 (level,
low) -> IRQ 21
[    8.566711] nouveau 0000:00:0d.0: setting latency timer to 64
[    8.573599] [drm] nouveau 0000:00:0d.0: Detected an NV40 generation card
(0x04c000a2)
[    8.577348] [drm] nouveau 0000:00:0d.0: Attempting to load BIOS image from
PRAMIN
[    8.622394] [drm] nouveau 0000:00:0d.0: ... appears to be valid
[    8.622406] [drm] nouveau 0000:00:0d.0: BIT BIOS found
[    8.622413] [drm] nouveau 0000:00:0d.0: Bios version 05.61.32.19
[    8.622421] [drm] nouveau 0000:00:0d.0: TMDS table version 1.1
[    8.622427] [drm] nouveau 0000:00:0d.0: Found Display Configuration Block
version 3.0
[    8.622435] [drm] nouveau 0000:00:0d.0: Raw DCB entry 0: 01000310 00000023
[    8.622442] [drm] nouveau 0000:00:0d.0: Raw DCB entry 1: 00110204 97e70000
[    8.622450] [drm] nouveau 0000:00:0d.0: DCB connector table: VHER 0x30 5 10
2
[    8.622457] [drm] nouveau 0000:00:0d.0:   0: 0x00000000: type 0x00 idx 0 tag
0xff
[    8.622468] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 0 at offset
0xDB8A
[    8.622475] [drm] nouveau 0000:00:0d.0: ======= misaligned reg 0x0060081D
=======
[    8.622518] [drm] nouveau 0000:00:0d.0: ======= misaligned reg 0x0060081D
=======
[    8.622658] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 1 at offset
0xDCE1
[    8.622664] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 2 at offset
0xDCE2
[    8.622790] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 3 at offset
0xDE64
[    8.622801] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 4 at offset
0xDEAD
[    9.100056] [drm] nouveau 0000:00:0d.0: 1 available performance level(s)
[    9.100062] [drm] nouveau 0000:00:0d.0: 0: core 425MHz shader 425MHz
fanspeed 100%
[    9.100069] [drm] nouveau 0000:00:0d.0: c:
[    9.100243] [TTM] Zone  kernel: Available graphics memory: 997804 kiB.
[    9.100246] [TTM] Initializing pool allocator.
[    9.100259] [drm] nouveau 0000:00:0d.0: Detected 64MiB VRAM
[    9.100864] [drm] nouveau 0000:00:0d.0: 64 MiB GART (aperture)
[    9.104668] [drm] nouveau 0000:00:0d.0: Saving VGA fonts
[    9.140999] [drm] nouveau 0000:00:0d.0: unknown connector type: 0xff!!
[    9.142188] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    9.142191] [drm] No driver support for vblank timestamp query.
[    9.142204] [drm] nouveau 0000:00:0d.0: Setting dpms mode 3 on vga encoder
(output 0)
[    9.265576] [drm] nouveau 0000:00:0d.0: allocated 1366x768 fb: 0x49000, bo
ffff8800371cb000
[    9.265687] fbcon: nouveaufb (fb0) is primary device
[    9.334300] [drm] nouveau 0000:00:0d.0: Setting dpms mode 0 on vga encoder
(output 0)
[    9.334303] [drm] nouveau 0000:00:0d.0: Output VGA-1 is running on CRTC 0
using output A
[    9.335419] Console: switching to colour frame buffer device 170x48
[    9.336459] fb0: nouveaufb frame buffer device
[    9.336461] drm: registered panic notifier
[    9.336470] [drm] Initialized nouveau 1.0.0 20120316 for 0000:00:0d.0 on
minor 0
[    9.527637] kvm: disabled by bios
[   10.503351] Adding 2514136k swap on /dev/sdb6.  Priority:-1 extents:1
across:2514136k 
[   11.292495] EXT3-fs (sdb3): using internal journal
[   11.505045] fuse init (API version 7.17)
[   11.570476] loop: module loaded
[   11.886023] it87: Found IT8716F chip at 0x290, revision 0
[   11.886050] it87: Beeping is supported
[   13.812629] kjournald starting.  Commit interval 5 seconds
[   13.812872] EXT3-fs (sdb7): using internal journal
[   13.812883] EXT3-fs (sdb7): mounted filesystem with ordered data mode
[   16.488495] 8139too 0000:01:07.0: eth2: link up, 100Mbps, full-duplex, lpa
0xC5E1
[   26.848019] eth2: no IPv6 routers present
[   29.998275] Bluetooth: Core ver 2.16
[   29.998328] NET: Registered protocol family 31
[   29.998334] Bluetooth: HCI device and connection manager initialized
[   29.998343] Bluetooth: HCI socket layer initialized
[   29.998347] Bluetooth: L2CAP socket layer initialized
[   29.998360] Bluetooth: SCO socket layer initialized
[   30.138462] Bluetooth: RFCOMM TTY layer initialized
[   30.138476] Bluetooth: RFCOMM socket layer initialized
[   30.138481] Bluetooth: RFCOMM ver 1.11
[   30.268429] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   30.268437] Bluetooth: BNEP filters: protocol multicast
[   34.514507] lp0: using parport0 (interrupt-driven).
[   34.573890] ppdev: user-space parallel port driver
[   36.029561] forcedeth 0000:00:07.0: irq 40 for MSI/MSI-X
[   36.029779] forcedeth 0000:00:07.0: eth4: no link during initialization
[   36.030957] ADDRCONF(NETDEV_UP): eth4: link is not ready
[   42.664633] [drm] nouveau 0000:00:0d.0: Setting dpms mode 3 on vga encoder
(output 0)
[   42.684870] [drm] nouveau 0000:00:0d.0: Setting dpms mode 0 on vga encoder
(output 0)
[   42.684879] [drm] nouveau 0000:00:0d.0: Output VGA-1 is running on CRTC 0
using output A

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
