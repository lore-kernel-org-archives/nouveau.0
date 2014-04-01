From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76818] Xorg EQ overflowing lock up
Date: Tue, 01 Apr 2014 02:36:52 +0000
Message-ID: <bug-76818-8800-Fb5OnWTADE@http.bugs.freedesktop.org/>
References: <bug-76818-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1087940026=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76818-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1087940026==
Content-Type: multipart/alternative; boundary="1396319812.47CC1.14411"; charset="us-ascii"


--1396319812.47CC1.14411
Date: Tue, 1 Apr 2014 02:36:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76818

--- Comment #2 from Max <max.snow-Po5arK1fDv3vnOemgxGiVw@public.gmane.org> ---
Sure, here it is

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.13.7-200.fc20.x86_64 (mockbuild@bkernel02) (gcc
version 4.8.2 20131212 (Red Hat 4.8.2-7) (GCC) ) #1 SMP Mon Mar 24 22:01:49 UTC
2014
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-3.13.7-200.fc20.x86_64
root=UUID=814b8090-a6a3-4be3-b91d-29a259094e61 ro rd.md=0 rd.lvm=0 rd.dm=0
vconsole.keymap=us rd.luks=0 vconsole.font=latarcyrheb-sun16 rhgb quiet
LANG=en_GB.UTF-8 vga=normal
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000df15dfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df15e000-0x00000000df1a7fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000df1a8000-0x00000000df1affff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000df1b0000-0x00000000df3c5fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df3c6000-0x00000000df3c6fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df3c7000-0x00000000df3d6fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df3d7000-0x00000000df3e1fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000df3e2000-0x00000000df406fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df407000-0x00000000df449fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000df44a000-0x00000000df684fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df685000-0x00000000df7fffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f7fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.6 present.
[    0.000000] DMI:                  /DH61CR, BIOS
BEH6110H.86A.0016.2011.0118.1128 01/18/2011
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x21f800 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-CFFFF write-protect
[    0.000000]   D0000-E7FFF uncachable
[    0.000000]   E8000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask E00000000 write-back
[    0.000000]   1 base 200000000 mask FE0000000 write-back
[    0.000000]   2 base 0E0000000 mask FE0000000 uncachable
[    0.000000]   3 base 21F800000 mask FFF800000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] e820: update [mem 0xe0000000-0xffffffff] usable ==> reserved
[    0.000000] e820: last_pfn = 0xdf800 max_arch_pfn = 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000fce50-0x000fce5f] mapped at
[ffff8800000fce50]
[    0.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x0200f000, 0x0200ffff] PGTABLE
[    0.000000] BRK [0x02010000, 0x02010fff] PGTABLE
[    0.000000] BRK [0x02011000, 0x02011fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x21f600000-0x21f7fffff]
[    0.000000]  [mem 0x21f600000-0x21f7fffff] page 2M
[    0.000000] BRK [0x02012000, 0x02012fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x21c000000-0x21f5fffff]
[    0.000000]  [mem 0x21c000000-0x21f5fffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x200000000-0x21bffffff]
[    0.000000]  [mem 0x200000000-0x21bffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0xdf15dfff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0xdeffffff] page 2M
[    0.000000]  [mem 0xdf000000-0xdf15dfff] page 4k
[    0.000000] init_memory_mapping: [mem 0xdf3c6000-0xdf3c6fff]
[    0.000000]  [mem 0xdf3c6000-0xdf3c6fff] page 4k
[    0.000000] BRK [0x02013000, 0x02013fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0xdf685000-0xdf7fffff]
[    0.000000]  [mem 0xdf685000-0xdf7fffff] page 4k
[    0.000000] BRK [0x02014000, 0x02014fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x100000000-0x1ffffffff]
[    0.000000]  [mem 0x100000000-0x1ffffffff] page 2M
[    0.000000] RAMDISK: [mem 0x36c36000-0x37612fff]
[    0.000000] ACPI: RSDP 00000000000f0450 000024 (v02  INTEL)
[    0.000000] ACPI: XSDT 00000000df1a8068 00004C (v01 INTEL  DH61CR   01072009
AMI  00010013)
[    0.000000] ACPI: FACP 00000000df1af340 0000F4 (v04 INTEL  DH61CR   01072009
AMI  00010013)
[    0.000000] ACPI: DSDT 00000000df1a8140 0071FD (v02 INTEL  DH61CR   00000012
INTL 20051117)
[    0.000000] ACPI: FACS 00000000df3d9f80 000040
[    0.000000] ACPI: APIC 00000000df1af438 000072 (v03 INTEL  DH61CR   01072009
AMI  00010013)
[    0.000000] ACPI: SSDT 00000000df1af4b0 000102 (v01 INTEL  DH61CR   00000001
MSFT 03000001)
[    0.000000] ACPI: MCFG 00000000df1af5b8 00003C (v01 INTEL  DH61CR   01072009
MSFT 00000097)
[    0.000000] ACPI: HPET 00000000df1af5f8 000038 (v01 INTEL  DH61CR   01072009
AMI. 00000004)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000021f7fffff]
[    0.000000] Initmem setup node 0 [mem 0x00000000-0x21f7fffff]
[    0.000000]   NODE_DATA [mem 0x21f7e4000-0x21f7f7fff]
[    0.000000]  [ffffea0000000000-ffffea00087fffff] PMD ->
[ffff880216e00000-ffff88021edfffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
[    0.000000]   Normal   [mem 0x100000000-0x21f7fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
[    0.000000]   node   0: [mem 0x00100000-0xdf15dfff]
[    0.000000]   node   0: [mem 0xdf3c6000-0xdf3c6fff]
[    0.000000]   node   0: [mem 0xdf685000-0xdf7fffff]
[    0.000000]   node   0: [mem 0x100000000-0x21f7fffff]
[    0.000000] On node 0 totalpages: 2091638
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 14220 pages used for memmap
[    0.000000]   DMA32 zone: 910042 pages, LIFO batch:31
[    0.000000]   Normal zone: 18400 pages used for memmap
[    0.000000]   Normal zone: 1177600 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf15e000-0xdf1a7fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf1a8000-0xdf1affff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf1b0000-0xdf3c5fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf3c7000-0xdf3d6fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf3d7000-0xdf3e1fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf3e2000-0xdf406fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf407000-0xdf449fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf44a000-0xdf684fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf800000-0xfed1bfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] e820: [mem 0xdf800000-0xfed1bfff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:1024 nr_cpumask_bits:4 nr_cpu_ids:4
nr_node_ids:1
[    0.000000] PERCPU: Embedded 29 pages/cpu @ffff88021f400000 s86592 r8192
d24000 u524288
[    0.000000] pcpu-alloc: s86592 r8192 d24000 u524288 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total
pages: 2058933
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-3.13.7-200.fc20.x86_64
root=UUID=814b8090-a6a3-4be3-b91d-29a259094e61 ro rd.md=0 rd.lvm=0 rd.dm=0
vconsole.keymap=us rd.luks=0 vconsole.font=latarcyrheb-sun16 rhgb quiet
LANG=en_GB.UTF-8 vga=normal
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
[    0.000000] Memory: 8141948K/8366552K available (6762K kernel code, 1067K
rwdata, 2984K rodata, 1424K init, 1628K bss, 224604K reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     RCU restricting CPUs from NR_CPUS=1024 to nr_cpu_ids=4.
[    0.000000] NR_IRQS:65792 nr_irqs:712 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] allocated 33554432 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't want
memory cgroups
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.001000] tsc: Detected 3292.304 MHz processor
[    0.000001] Calibrating delay loop (skipped), value calculated using timer
frequency.. 6584.60 BogoMIPS (lpj=3292304)
[    0.000003] pid_max: default: 32768 minimum: 301
[    0.000031] Security Framework initialized
[    0.000036] SELinux:  Initializing.
[    0.000042] SELinux:  Starting in permissive mode
[    0.000528] Dentry cache hash table entries: 1048576 (order: 11, 8388608
bytes)
[    0.001780] Inode-cache hash table entries: 524288 (order: 10, 4194304
bytes)
[    0.002295] Mount-cache hash table entries: 256
[    0.002423] Initializing cgroup subsys memory
[    0.002428] Initializing cgroup subsys devices
[    0.002429] Initializing cgroup subsys freezer
[    0.002430] Initializing cgroup subsys net_cls
[    0.002431] Initializing cgroup subsys blkio
[    0.002432] Initializing cgroup subsys perf_event
[    0.002433] Initializing cgroup subsys hugetlb
[    0.002451] CPU: Physical Processor ID: 0
[    0.002452] CPU: Processor Core ID: 0
[    0.002455] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.002457] mce: CPU supports 9 MCE banks
[    0.002467] CPU0: Thermal monitoring enabled (TM1)
[    0.002475] Last level iTLB entries: 4KB 512, 2MB 0, 4MB 0
Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32
tlb_flushall_shift: 5
[    0.002544] Freeing SMP alternatives memory: 24K (ffffffff81e70000 -
ffffffff81e76000)
[    0.003611] ACPI: Core revision 20131115
[    0.005356] ACPI: All ACPI Tables successfully acquired
[    0.229736] ftrace: allocating 25917 entries in 102 pages
[    0.239695] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.249697] smpboot: CPU0: Intel(R) Core(TM) i5-2500 CPU @ 3.30GHz (fam: 06,
model: 2a, stepping: 07)
[    0.249703] TSC deadline timer enabled
[    0.249711] Performance Events: PEBS fmt1+, 16-deep LBR, SandyBridge events,
full-width counters, Intel PMU driver.
[    0.249716] perf_event_intel: PEBS disabled due to CPU errata, please
upgrade microcode
[    0.249717] ... version:                3
[    0.249718] ... bit width:              48
[    0.249719] ... generic registers:      8
[    0.249719] ... value mask:             0000ffffffffffff
[    0.249720] ... max period:             0000ffffffffffff
[    0.249721] ... fixed-purpose events:   3
[    0.249722] ... event mask:             00000007000000ff
[    0.250630] x86: Booting SMP configuration:
[    0.263898] NMI watchdog: enabled on all CPUs, permanently consumes one
hw-PMU counter.
[    0.250632] .... node  #0, CPUs:      #1 #2 #3
[    0.290483] x86: Booted up 1 node, 4 CPUs
[    0.290486] smpboot: Total of 4 processors activated (26338.43 BogoMIPS)
[    0.292865] devtmpfs: initialized
[    0.294916] PM: Registering ACPI NVS region [mem 0xdf15e000-0xdf1a7fff]
(303104 bytes)
[    0.294921] PM: Registering ACPI NVS region [mem 0xdf3d7000-0xdf3e1fff]
(45056 bytes)
[    0.294922] PM: Registering ACPI NVS region [mem 0xdf407000-0xdf449fff]
(274432 bytes)
[    0.295501] atomic64 test passed for x86-64 platform with CX8 and with SSE
[    0.295503] pinctrl core: initialized pinctrl subsystem
[    0.295536] RTC time:  9:06:11, date: 04/01/14
[    0.295561] NET: Registered protocol family 16
[    0.295631] cpuidle: using governor menu
[    0.295675] ACPI: bus type PCI registered
[    0.295676] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.295719] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.295721] PCI: not using MMCONFIG
[    0.295722] PCI: Using configuration type 1 for base access
[    0.296400] bio: create slab <bio-0> at 0
[    0.296481] ACPI: Added _OSI(Module Device)
[    0.296482] ACPI: Added _OSI(Processor Device)
[    0.296483] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.296484] ACPI: Added _OSI(Processor Aggregator Device)
[    0.297860] ACPI: Executed 1 blocks of module-level executable AML code
[    0.299385] ACPI: SSDT 00000000df3d8c18 00038C (v01    AMI      IST 00000001
MSFT 03000001)
[    0.299563] ACPI: Dynamic OEM Table Load:
[    0.299564] ACPI: SSDT           (null) 00038C (v01    AMI      IST 00000001
MSFT 03000001)
[    0.299579] ACPI: SSDT 00000000df3d9e18 000084 (v01    AMI      CST 00000001
MSFT 03000001)
[    0.299726] ACPI: Dynamic OEM Table Load:
[    0.299728] ACPI: SSDT           (null) 000084 (v01    AMI      CST 00000001
MSFT 03000001)
[    0.300046] ACPI: Interpreter enabled
[    0.300049] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S1_] (20131115/hwxface-580)
[    0.300052] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S2_] (20131115/hwxface-580)
[    0.300060] ACPI: (supports S0 S3 S4 S5)
[    0.300060] ACPI: Using IOAPIC for interrupt routing
[    0.300073] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.300110] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in ACPI
motherboard resources
[    0.304347] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=nocrs" and report a bug
[    0.304425] ACPI: No dock devices found.
[    0.304554] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.308026] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.308030] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM
Segments MSI]
[    0.308149] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER
PCIeCapability]
[    0.308273] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus
00-3f] only partially covers this bridge
[    0.308397] PCI host bridge to bus 0000:00
[    0.308399] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.308400] pci_bus 0000:00: root bus resource [io  0x0000-0x03af]
[    0.308401] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7]
[    0.308402] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df]
[    0.308404] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    0.308405] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
[    0.308406] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff]
[    0.308407] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xffffffff]
[    0.308413] pci 0000:00:00.0: [8086:0100] type 00 class 0x060000
[    0.308472] pci 0000:00:01.0: [8086:0101] type 01 class 0x060400
[    0.308495] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.308522] pci 0000:00:01.0: System wakeup disabled by ACPI
[    0.308597] pci 0000:00:16.0: [8086:1c3a] type 00 class 0x078000
[    0.308629] pci 0000:00:16.0: reg 0x10: [mem 0xf7129000-0xf712900f 64bit]
[    0.308738] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.308819] pci 0000:00:19.0: [8086:1503] type 00 class 0x020000
[    0.308846] pci 0000:00:19.0: reg 0x10: [mem 0xf7100000-0xf711ffff]
[    0.308858] pci 0000:00:19.0: reg 0x14: [mem 0xf7128000-0xf7128fff]
[    0.308870] pci 0000:00:19.0: reg 0x18: [io  0xf040-0xf05f]
[    0.308969] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.309007] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.309039] pci 0000:00:1a.0: [8086:1c2d] type 00 class 0x0c0320
[    0.309067] pci 0000:00:1a.0: reg 0x10: [mem 0xf7127000-0xf71273ff]
[    0.309195] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.309234] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    0.309265] pci 0000:00:1b.0: [8086:1c20] type 00 class 0x040300
[    0.309288] pci 0000:00:1b.0: reg 0x10: [mem 0xf7120000-0xf7123fff 64bit]
[    0.309390] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.309453] pci 0000:00:1c.0: [8086:1c10] type 01 class 0x060400
[    0.309567] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.309609] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.309651] pci 0000:00:1d.0: [8086:1c26] type 00 class 0x0c0320
[    0.309679] pci 0000:00:1d.0: reg 0x10: [mem 0xf7126000-0xf71263ff]
[    0.309810] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.309849] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.309877] pci 0000:00:1f.0: [8086:1c5c] type 00 class 0x060100
[    0.310073] pci 0000:00:1f.2: [8086:1c02] type 00 class 0x010601
[    0.310104] pci 0000:00:1f.2: reg 0x10: [io  0xf090-0xf097]
[    0.310116] pci 0000:00:1f.2: reg 0x14: [io  0xf080-0xf083]
[    0.310128] pci 0000:00:1f.2: reg 0x18: [io  0xf070-0xf077]
[    0.310139] pci 0000:00:1f.2: reg 0x1c: [io  0xf060-0xf063]
[    0.310151] pci 0000:00:1f.2: reg 0x20: [io  0xf020-0xf03f]
[    0.310163] pci 0000:00:1f.2: reg 0x24: [mem 0xf7125000-0xf71257ff]
[    0.310238] pci 0000:00:1f.2: PME# supported from D3hot
[    0.310292] pci 0000:00:1f.3: [8086:1c22] type 00 class 0x0c0500
[    0.310315] pci 0000:00:1f.3: reg 0x10: [mem 0xf7124000-0xf71240ff 64bit]
[    0.310347] pci 0000:00:1f.3: reg 0x20: [io  0xf000-0xf01f]
[    0.310446] pci 0000:01:00.0: [10de:0fc6] type 00 class 0x030000
[    0.310454] pci 0000:01:00.0: reg 0x10: [mem 0xf6000000-0xf6ffffff]
[    0.310464] pci 0000:01:00.0: reg 0x14: [mem 0xe0000000-0xefffffff 64bit
pref]
[    0.310473] pci 0000:01:00.0: reg 0x1c: [mem 0xf0000000-0xf1ffffff 64bit
pref]
[    0.310479] pci 0000:01:00.0: reg 0x24: [io  0xe000-0xe07f]
[    0.310485] pci 0000:01:00.0: reg 0x30: [mem 0xf7000000-0xf707ffff pref]
[    0.310546] pci 0000:01:00.1: [10de:0e1b] type 00 class 0x040300
[    0.310555] pci 0000:01:00.1: reg 0x10: [mem 0xf7080000-0xf7083fff]
[    0.311732] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.311736] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.311740] pci 0000:00:01.0:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.311744] pci 0000:00:01.0:   bridge window [mem 0xe0000000-0xf1ffffff
64bit pref]
[    0.311861] pci 0000:02:00.0: [1283:8892] type 01 class 0x060400
[    0.312088] pci 0000:02:00.0: supports D1 D2
[    0.312089] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.312134] pci 0000:02:00.0: System wakeup disabled by ACPI
[    0.312151] pci 0000:02:00.0: disabling ASPM on pre-1.1 PCIe device.  You
can enable it with 'pcie_aspm=force'
[    0.312167] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.312404] pci 0000:02:00.0: PCI bridge to [bus 03]
[    0.312841] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.312877] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.312911] ACPI: PCI Interrupt Link [LNKC] (IRQs *3 4 5 6 10 11 12 14 15)
[    0.312944] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.312978] ACPI: PCI Interrupt Link [LNKE] (IRQs *3 4 5 6 7 10 11 12 14 15)
[    0.313011] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11 12 14 15)
*0
[    0.313045] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 *7 10 11 12 14 15)
[    0.313078] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.313142] ACPI: Enabled 3 GPEs in block 00 to 3F
[    0.313147] ACPI: \_SB_.PCI0: notify handler is installed
[    0.313173] Found 1 acpi root devices
[    0.313223] vgaarb: device added:
PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.313224] vgaarb: loaded
[    0.313225] vgaarb: bridge control possible 0000:01:00.0
[    0.313263] SCSI subsystem initialized
[    0.313287] libata version 3.00 loaded.
[    0.313298] ACPI: bus type USB registered
[    0.313308] usbcore: registered new interface driver usbfs
[    0.313313] usbcore: registered new interface driver hub
[    0.313325] usbcore: registered new device driver usb
[    0.313358] PCI: Using ACPI for IRQ routing
[    0.315843] PCI: pci_cache_line_size set to 64 bytes
[    0.315890] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
[    0.315891] e820: reserve RAM buffer [mem 0xdf15e000-0xdfffffff]
[    0.315892] e820: reserve RAM buffer [mem 0xdf3c7000-0xdfffffff]
[    0.315893] e820: reserve RAM buffer [mem 0xdf800000-0xdfffffff]
[    0.315894] e820: reserve RAM buffer [mem 0x21f800000-0x21fffffff]
[    0.315945] NetLabel: Initializing
[    0.315946] NetLabel:  domain hash size = 128
[    0.315946] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.315955] NetLabel:  unlabeled traffic allowed by default
[    0.315996] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.316000] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.318019] Switched to clocksource hpet
[    0.321494] pnp: PnP ACPI init
[    0.321504] ACPI: bus type PNP registered
[    0.321586] system 00:00: [mem 0xfed10000-0xfed19fff] has been reserved
[    0.321588] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.321589] system 00:00: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.321591] system 00:00: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.321592] system 00:00: [mem 0xfee00000-0xfee0ffff] has been reserved
[    0.321595] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.321696] system 00:01: [io  0x0778-0x077f] has been reserved
[    0.321698] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.321873] pnp 00:02: [dma 0 disabled]
[    0.321908] pnp 00:02: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.322103] pnp 00:03: [dma 3]
[    0.322172] pnp 00:03: Plug and Play ACPI device, IDs PNP0400 (active)
[    0.322178] pnp 00:04: [dma 4]
[    0.322189] pnp 00:04: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.322205] pnp 00:05: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.322218] pnp 00:06: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.322249] system 00:07: [io  0x04d0-0x04d1] has been reserved
[    0.322251] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.322267] pnp 00:08: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.322380] system 00:09: [io  0x0400-0x0453] could not be reserved
[    0.322381] system 00:09: [io  0x0458-0x047f] has been reserved
[    0.322383] system 00:09: [io  0x1180-0x119f] has been reserved
[    0.322384] system 00:09: [io  0x0500-0x057f] has been reserved
[    0.322385] system 00:09: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.322387] system 00:09: [mem 0xfec00000-0xfecfffff] could not be reserved
[    0.322388] system 00:09: [mem 0xfed08000-0xfed08fff] has been reserved
[    0.322390] system 00:09: [mem 0xff000000-0xffffffff] has been reserved
[    0.322391] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.322424] system 00:0a: [io  0x0454-0x0457] has been reserved
[    0.322426] system 00:0a: Plug and Play ACPI device, IDs INT3f0d PNP0c02
(active)
[    0.322502] pnp 00:0b: Plug and Play ACPI device, IDs PNP0103 (active)
[    0.322591] pnp: PnP ACPI: found 12 devices
[    0.322592] ACPI: bus type PNP unregistered
[    0.328496] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.328498] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.328501] pci 0000:00:01.0:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.328503] pci 0000:00:01.0:   bridge window [mem 0xe0000000-0xf1ffffff
64bit pref]
[    0.328505] pci 0000:02:00.0: PCI bridge to [bus 03]
[    0.328538] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.328553] pci_bus 0000:00: resource 4 [io  0x0000-0x03af]
[    0.328554] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7]
[    0.328556] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df]
[    0.328557] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff]
[    0.328558] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff]
[    0.328559] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff]
[    0.328560] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xffffffff]
[    0.328562] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    0.328563] pci_bus 0000:01: resource 1 [mem 0xf6000000-0xf70fffff]
[    0.328564] pci_bus 0000:01: resource 2 [mem 0xe0000000-0xf1ffffff 64bit
pref]
[    0.328585] NET: Registered protocol family 2
[    0.328707] TCP established hash table entries: 65536 (order: 7, 524288
bytes)
[    0.328831] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.328944] TCP: Hash tables configured (established 65536 bind 65536)
[    0.328958] TCP: reno registered
[    0.328967] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.328992] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.329054] NET: Registered protocol family 1
[    0.329254] pci 0000:01:00.0: Boot video device
[    0.329267] PCI: CLS 64 bytes, default 64
[    0.329298] Unpacking initramfs...
[    0.440633] Freeing initrd memory: 10100K (ffff880036c36000 -
ffff880037613000)
[    0.440636] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.440638] software IO TLB [mem 0xdb15e000-0xdf15e000] (64MB) mapped at
[ffff8800db15e000-ffff8800df15dfff]
[    0.442364] alg: No test for __gcm-aes-aesni (__driver-gcm-aes-aesni)
[    0.442606] Initialise system trusted keyring
[    0.442639] audit: initializing netlink socket (disabled)
[    0.442646] type=2000 audit(1396343171.210:1): initialized
[    0.459276] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.460078] zbud: loaded
[    0.460177] VFS: Disk quotas dquot_6.5.2
[    0.460204] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.460424] msgmni has been set to 15922
[    0.460457] Key type big_key registered
[    0.460458] SELinux:  Registering netfilter hooks
[    0.461072] alg: No test for stdrng (krng)
[    0.461077] NET: Registered protocol family 38
[    0.461079] Key type asymmetric registered
[    0.461080] Asymmetric key parser 'x509' registered
[    0.461100] Block layer SCSI generic (bsg) driver version 0.4 loaded (major
252)
[    0.461122] io scheduler noop registered
[    0.461123] io scheduler deadline registered
[    0.461138] io scheduler cfq registered (default)
[    0.461259] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
[    0.461354] pcieport 0000:00:1c.0: irq 41 for MSI/MSI-X
[    0.461442] pcieport 0000:00:01.0: Signaling PME through PCIe PME interrupt
[    0.461443] pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
[    0.461444] pci 0000:01:00.1: Signaling PME through PCIe PME interrupt
[    0.461446] pcie_pme 0000:00:01.0:pcie01: service driver pcie_pme loaded
[    0.461465] pcieport 0000:00:1c.0: Signaling PME through PCIe PME interrupt
[    0.461466] pci 0000:02:00.0: Signaling PME through PCIe PME interrupt
[    0.461470] pcie_pme 0000:00:1c.0:pcie01: service driver pcie_pme loaded
[    0.461476] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.461484] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.461503] intel_idle: MWAIT substates: 0x1120
[    0.461504] intel_idle: v0.4 model 0x2A
[    0.461505] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.461593] input: Power Button as
/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0
[    0.461596] ACPI: Power Button [PWRB]
[    0.461617] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.461619] ACPI: Power Button [PWRF]
[    0.461896] GHES: HEST is not enabled!
[    0.461932] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.482510] 00:02: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a
16550A
[    0.482884] Non-volatile memory driver v1.3
[    0.482885] Linux agpgart interface v0.103
[    0.482946] ahci 0000:00:1f.2: version 3.0
[    0.483028] ahci 0000:00:1f.2: irq 42 for MSI/MSI-X
[    0.494089] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 4 ports 3 Gbps 0x23
impl SATA mode
[    0.494100] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum
part ems apst 
[    0.498417] scsi0 : ahci
[    0.498546] scsi1 : ahci
[    0.498677] scsi2 : ahci
[    0.498807] scsi3 : ahci
[    0.498936] scsi4 : ahci
[    0.499042] scsi5 : ahci
[    0.499073] ata1: SATA max UDMA/133 abar m2048@0xf7125000 port 0xf7125100
irq 42
[    0.499076] ata2: SATA max UDMA/133 abar m2048@0xf7125000 port 0xf7125180
irq 42
[    0.499076] ata3: DUMMY
[    0.499077] ata4: DUMMY
[    0.499078] ata5: DUMMY
[    0.499080] ata6: SATA max UDMA/133 abar m2048@0xf7125000 port 0xf7125380
irq 42
[    0.499120] libphy: Fixed MDIO Bus: probed
[    0.499178] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.499183] ehci-pci: EHCI PCI platform driver
[    0.499248] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    0.499307] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus
number 1
[    0.499323] ehci-pci 0000:00:1a.0: debug port 2
[    0.503231] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[    0.503244] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf7127000
[    0.509030] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    0.509057] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    0.509059] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    0.509060] usb usb1: Product: EHCI Host Controller
[    0.509061] usb usb1: Manufacturer: Linux 3.13.7-200.fc20.x86_64 ehci_hcd
[    0.509062] usb usb1: SerialNumber: 0000:00:1a.0
[    0.509143] hub 1-0:1.0: USB hub found
[    0.509147] hub 1-0:1.0: 2 ports detected
[    0.509257] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    0.509313] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus
number 2
[    0.509328] ehci-pci 0000:00:1d.0: debug port 2
[    0.513239] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[    0.513252] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf7126000
[    0.519029] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    0.519052] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    0.519053] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    0.519054] usb usb2: Product: EHCI Host Controller
[    0.519056] usb usb2: Manufacturer: Linux 3.13.7-200.fc20.x86_64 ehci_hcd
[    0.519057] usb usb2: SerialNumber: 0000:00:1d.0
[    0.519149] hub 2-0:1.0: USB hub found
[    0.519152] hub 2-0:1.0: 2 ports detected
[    0.519205] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.519206] ohci-pci: OHCI PCI platform driver
[    0.519211] uhci_hcd: USB Universal Host Controller Interface driver
[    0.519238] usbcore: registered new interface driver usbserial
[    0.519242] usbcore: registered new interface driver usbserial_generic
[    0.519246] usbserial: USB Serial support registered for generic
[    0.519262] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    0.522336] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.522341] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.522458] mousedev: PS/2 mouse device common for all mice
[    0.522725] rtc_cmos 00:05: RTC can wake from S4
[    0.522852] rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
[    0.522883] rtc_cmos 00:05: alarms up to one month, y3k, 114 bytes nvram,
hpet irqs
[    0.522918] device-mapper: uevent: version 1.0.3
[    0.522957] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30) initialised:
dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[    0.522967] Intel P-state driver initializing.
[    0.522974] Intel pstate controlling: cpu 0
[    0.522983] Intel pstate controlling: cpu 1
[    0.522989] Intel pstate controlling: cpu 2
[    0.522997] Intel pstate controlling: cpu 3
[    0.523134] hidraw: raw HID events driver (C) Jiri Kosina
[    0.523180] usbcore: registered new interface driver usbhid
[    0.523181] usbhid: USB HID core driver
[    0.523198] drop_monitor: Initializing network drop monitor service
[    0.523237] ip_tables: (C) 2000-2006 Netfilter Core Team
[    0.523333] TCP: cubic registered
[    0.523334] Initializing XFRM netlink socket
[    0.523386] NET: Registered protocol family 10
[    0.523486] mip6: Mobile IPv6
[    0.523488] NET: Registered protocol family 17
[    0.523715] Loading compiled-in X.509 certificates
[    0.524392] Loaded X.509 cert 'Fedora kernel signing key:
c3830b4732e7ae9d9e43fcfb76f135cc8fff609e'
[    0.524400] registered taskstats version 1
[    0.524931]   Magic number: 10:79:120
[    0.524933] misc device-mapper: hash matches
[    0.525029] rtc_cmos 00:05: setting system clock to 2014-04-01 09:06:11 UTC
(1396343171)
[    0.525050] PM: Hibernation image not present or could not be loaded.
[    0.804077] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    0.804104] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    0.804133] ata6: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    0.804696] ata1.00: ATAPI: TSSTcorp CDDVDW SH-222AB, SB00, max UDMA/100
[    0.804999] ata6.00: failed to get NCQ Send/Recv Log Emask 0x1
[    0.805003] ata6.00: ATA-9: Samsung SSD 840 Series, DXT08B0Q, max UDMA/133
[    0.805025] ata6.00: 234441648 sectors, multi 16: LBA48 NCQ (depth 31/32),
AA
[    0.805397] ata2.00: ATA-8: ST1000DM003-1CH162, CC46, max UDMA/133
[    0.805401] ata2.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 31/32),
AA
[    0.805454] ata1.00: configured for UDMA/100
[    0.805668] ata6.00: failed to get NCQ Send/Recv Log Emask 0x1
[    0.805759] ata6.00: configured for UDMA/133
[    0.806281] ata2.00: configured for UDMA/133
[    0.806509] scsi 0:0:0:0: CD-ROM            TSSTcorp CDDVDW SH-222AB  SB00
PQ: 0 ANSI: 5
[    0.809083] sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda
tray
[    0.809087] cdrom: Uniform CD-ROM driver Revision: 3.20
[    0.809273] sr 0:0:0:0: Attached scsi CD-ROM sr0
[    0.809413] sr 0:0:0:0: Attached scsi generic sg0 type 5
[    0.809758] scsi 1:0:0:0: Direct-Access     ATA      ST1000DM003-1CH1 CC46
PQ: 0 ANSI: 5
[    0.809916] sd 1:0:0:0: Attached scsi generic sg1 type 0
[    0.809964] sd 1:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00
TB/931 GiB)
[    0.809966] sd 1:0:0:0: [sda] 4096-byte physical blocks
[    0.810155] sd 1:0:0:0: [sda] Write Protect is off
[    0.810160] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    0.810222] scsi 5:0:0:0: Direct-Access     ATA      Samsung SSD 840  DXT0
PQ: 0 ANSI: 5
[    0.810251] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    0.810366] sd 5:0:0:0: Attached scsi generic sg2 type 0
[    0.810369] sd 5:0:0:0: [sdb] 234441648 512-byte logical blocks: (120 GB/111
GiB)
[    0.810556] sd 5:0:0:0: [sdb] Write Protect is off
[    0.810561] sd 5:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    0.810603] sd 5:0:0:0: [sdb] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    0.811038] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    0.811198]  sdb: sdb1 sdb2 sdb3
[    0.811836] sd 5:0:0:0: [sdb] Attached SCSI disk
[    0.818443]  sda: sda1
[    0.819025] sd 1:0:0:0: [sda] Attached SCSI disk
[    0.820192] Freeing unused kernel memory: 1424K (ffffffff81d0c000 -
ffffffff81e70000)
[    0.820195] Write protecting the kernel read-only data: 12288k
[    0.824134] Freeing unused kernel memory: 1420K (ffff88000169d000 -
ffff880001800000)
[    0.826954] Freeing unused kernel memory: 1112K (ffff880001aea000 -
ffff880001c00000)
[    0.829938] systemd[1]: systemd 208 running in system mode. (+PAM +LIBWRAP
+AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ)
[    0.830131] systemd[1]: Running in initial RAM disk.
[    0.830188] systemd[1]: Set hostname to <soshi>.
[    0.830729] random: systemd urandom read with 20 bits of entropy available
[    0.835483] systemd[1]: Expecting device
dev-disk-by\x2duuid-814b8090\x2da6a3\x2d4be3\x2db91d\x2d29a259094e61.device...
[    0.835500] systemd[1]: Starting -.slice.
[    0.835633] systemd[1]: Created slice -.slice.
[    0.835648] systemd[1]: Starting System Slice.
[    0.835716] systemd[1]: Created slice System Slice.
[    0.835728] systemd[1]: Starting Slices.
[    0.835739] systemd[1]: Reached target Slices.
[    0.835748] systemd[1]: Starting Timers.
[    0.835759] systemd[1]: Reached target Timers.
[    0.835771] systemd[1]: Starting udev Kernel Socket.
[    0.835803] systemd[1]: Listening on udev Kernel Socket.
[    0.835815] systemd[1]: Starting udev Control Socket.
[    0.835845] systemd[1]: Listening on udev Control Socket.
[    0.835856] systemd[1]: Starting Journal Socket.
[    0.835900] systemd[1]: Listening on Journal Socket.
[    0.836021] systemd[1]: Starting dracut cmdline hook...
[    0.836308] systemd[1]: Starting Sockets.
[    0.836321] systemd[1]: Reached target Sockets.
[    0.836332] systemd[1]: Starting Journal Service...
[    0.836638] systemd[1]: Started Journal Service.
[    0.894738] systemd-udevd[159]: starting version 208
[    0.917714] [drm] Initialized drm 1.1.0 20060810
[    0.924328] wmi: Mapper loaded
[    0.929404] usb 1-1: New USB device found, idVendor=8087, idProduct=0024
[    0.929407] usb 1-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    0.929541] hub 1-1:1.0: USB hub found
[    0.929643] hub 1-1:1.0: 4 ports detected
[    0.941019] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7060a2
[    0.941022] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    0.941023] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    0.942163] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.942169] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.942170] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    1.033045] usb 2-1: new high-speed USB device number 2 using ehci-pci
[    1.064806] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.064808] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    1.064879] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.064881] nouveau  [   VBIOS][0000:01:00.0] version 80.07.35.00.60
[    1.065096] nouveau 0000:01:00.0: irq 43 for MSI/MSI-X
[    1.065105] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.065163] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.065165] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    1.065165] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.147471] usb 2-1: New USB device found, idVendor=8087, idProduct=0024
[    1.147474] usb 2-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    1.147814] hub 2-1:1.0: USB hub found
[    1.147923] hub 2-1:1.0: 6 ports detected
[    1.222225] usb 1-1.1: new low-speed USB device number 3 using ehci-pci
[    1.311845] usb 1-1.1: New USB device found, idVendor=046d, idProduct=c077
[    1.311847] usb 1-1.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    1.311848] usb 1-1.1: Product: USB Optical Mouse
[    1.311849] usb 1-1.1: Manufacturer: Logitech
[    1.314100] input: Logitech USB Optical Mouse as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.1/1-1.1:1.0/input/input5
[    1.314463] hid-generic 0003:046D:C077.0001: input,hidraw0: USB HID v1.11
Mouse [Logitech USB Optical Mouse] on usb-0000:00:1a.0-1.1/input0
[    1.387184] usb 1-1.2: new low-speed USB device number 4 using ehci-pci
[    1.442050] tsc: Refined TSC clocksource calibration: 3292.509 MHz
[    1.444970] PM: Starting manual resume from disk
[    1.444982] PM: Hibernation image partition 8:18 present
[    1.444983] PM: Looking for hibernation image.
[    1.445682] PM: Image not found (code -22)
[    1.445683] PM: Hibernation image not present or could not be loaded.
[    1.457388] EXT4-fs (sdb3): mounted filesystem with ordered data mode. Opts:
(null)
[    1.480540] usb 1-1.2: New USB device found, idVendor=413c, idProduct=2107
[    1.480543] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    1.480545] usb 1-1.2: Product: Dell USB Entry Keyboard
[    1.480546] usb 1-1.2: Manufacturer: Dell
[    1.484711] input: Dell Dell USB Entry Keyboard as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input6
[    1.484835] hid-generic 0003:413C:2107.0002: input,hidraw1: USB HID v1.10
Keyboard [Dell Dell USB Entry Keyboard] on usb-0000:00:1a.0-1.2/input0
[    1.558218] usb 2-1.2: new full-speed USB device number 3 using ehci-pci
[    1.644705] usb 2-1.2: New USB device found, idVendor=0a12, idProduct=0001
[    1.644707] usb 2-1.2: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    1.709004] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.709009] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.709012] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.709051] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 324
MHz 
[    1.709056] nouveau  [     CLK][0000:01:00.0] 0a: core 540 MHz memory 810
MHz 
[    1.709060] nouveau  [     CLK][0000:01:00.0] 0f: core 1110 MHz memory 2500
MHz 
[    1.709199] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 324
MHz 
[    1.733172] [TTM] Zone  kernel: Available graphics memory: 4078014 kiB
[    1.733173] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.733174] [TTM] Initializing pool allocator
[    1.733177] [TTM] Initializing DMA pool allocator
[    1.733189] nouveau  [     DRM] VRAM: 1024 MiB
[    1.733190] nouveau  [     DRM] GART: 1048576 MiB
[    1.733193] nouveau  [     DRM] TMDS table version 2.0
[    1.733194] nouveau  [     DRM] DCB version 4.0
[    1.733195] nouveau  [     DRM] DCB outp 00: 02033f10 00000000
[    1.733197] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    1.733198] nouveau  [     DRM] DCB outp 02: 08011f82 00020030
[    1.733198] nouveau  [     DRM] DCB outp 03: 02022f62 00020010
[    1.733200] nouveau  [     DRM] DCB conn 00: 00001031
[    1.733201] nouveau  [     DRM] DCB conn 01: 00002131
[    1.733202] nouveau  [     DRM] DCB conn 02: 00010261
[    1.733203] nouveau  [     DRM] DCB conn 03: 00000300
[    1.734344] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.734345] [drm] No driver support for vblank timestamp query.
[    1.744598] nouveau  [     DRM] MM: using COPY for buffer copies
[    1.884895] nouveau  [     DRM] allocated 2560x1600 fb: 0x80000, bo
ffff8800dac54400
[    1.884965] fbcon: nouveaufb (fb0) is primary device
[    1.986744] Console: switching to colour frame buffer device 240x67
[    1.989939] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    1.989939] nouveau 0000:01:00.0: registered panic notifier
[    1.989942] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[    2.270321] systemd-journald[95]: Received SIGTERM
[    2.318554] SELinux:  Disabled at runtime.
[    2.318570] SELinux:  Unregistering netfilter hooks
[    2.356008] type=1404 audit(1396343173.330:2): selinux=0 auid=4294967295
ses=4294967295
[    2.364208] systemd[1]: RTC configured in localtime, applying delta of 660
minutes to system time.
[    2.415930] random: nonblocking pool is initialized
[    2.442069] Switched to clocksource tsc
[    2.462548] systemd-readahead[288]: Bumped block_nr parameter of 8:16 to
20480. This is a temporary hack and should be removed one day.
[    2.584549] systemd-udevd[326]: starting version 208
[    2.586029] EXT4-fs (sdb3): re-mounted. Opts: (null)
[    2.618145] parport_pc 00:03: reported by Plug and Play ACPI
[    2.618173] parport0: PC-style at 0x378, irq 5 [PCSPP,TRISTATE,EPP]
[    2.619451] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.621972] pps_core: LinuxPPS API ver. 1 registered
[    2.621974] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    2.622841] PTP clock support registered
[    2.627745] e1000e: Intel(R) PRO/1000 Network Driver - 2.3.2-k
[    2.627748] e1000e: Copyright(c) 1999 - 2013 Intel Corporation.
[    2.627885] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to
dynamic conservative mode
[    2.627905] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    2.640037] microcode: CPU0 sig=0x206a7, pf=0x2, revision=0x14
[    2.641951] microcode: CPU0 sig=0x206a7, pf=0x2, revision=0x14
[    2.642412] microcode: CPU0 updated to revision 0x29, date = 2013-06-12
[    2.642419] microcode: CPU1 sig=0x206a7, pf=0x2, revision=0x14
[    2.642436] microcode: CPU1 sig=0x206a7, pf=0x2, revision=0x14
[    2.642668] microcode: CPU1 updated to revision 0x29, date = 2013-06-12
[    2.642672] microcode: CPU2 sig=0x206a7, pf=0x2, revision=0x14
[    2.642683] microcode: CPU2 sig=0x206a7, pf=0x2, revision=0x14
[    2.642913] microcode: CPU2 updated to revision 0x29, date = 2013-06-12
[    2.642918] microcode: CPU3 sig=0x206a7, pf=0x2, revision=0x14
[    2.642932] microcode: CPU3 sig=0x206a7, pf=0x2, revision=0x14
[    2.643171] microcode: CPU3 updated to revision 0x29, date = 2013-06-12
[    2.643173] perf_event_intel: PEBS enabled due to microcode update
[    2.643349] microcode: Microcode Update Driver: v2.00
<tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
[    2.649001] alg: No test for crc32 (crc32-pclmul)
[    2.687070] ppdev: user-space parallel port driver
[    2.701527] Bluetooth: Core ver 2.17
[    2.701538] NET: Registered protocol family 31
[    2.701539] Bluetooth: HCI device and connection manager initialized
[    2.701546] Bluetooth: HCI socket layer initialized
[    2.701547] Bluetooth: L2CAP socket layer initialized
[    2.701550] Bluetooth: SCO socket layer initialized
[    2.702803] usbcore: registered new interface driver btusb
[    2.713536] Adding 8273916k swap on /dev/sdb2.  Priority:-1 extents:1
across:8273916k SSFS
[    2.753183] EXT4-fs (sdb1): mounted filesystem with ordered data mode. Opts:
(null)
[    2.859950] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts:
(null)
[    2.864211] systemd-journald[297]: Received request to flush runtime journal
from PID 1
[    2.865098] type=1305 audit(1396303573.839:3): audit_pid=482 old=0
auid=4294967295 ses=4294967295 res=1
[    2.888880] e1000e 0000:00:19.0 eth0: registered PHC clock
[    2.888883] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1)
e0:69:95:36:42:91
[    2.888884] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connection
[    2.888914] e1000e 0000:00:19.0 eth0: MAC: 10, PHY: 11, PBA No: FFFFFF-0FF
[    2.889140] mei_me 0000:00:16.0: irq 45 for MSI/MSI-X
[    2.890191] iTCO_vendor_support: vendor-support=0
[    2.890222] gpio_ich: GPIO from 180 to 255 on gpio_ich
[    2.891037] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.10
[    2.891055] iTCO_wdt: Found a Cougar Point TCO device (Version=2,
TCOBASE=0x0460)
[    2.891161] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    2.896538] i801_smbus 0000:00:1f.3: SMBus using PCI Interrupt
[    2.896642] snd_hda_intel 0000:00:1b.0: irq 46 for MSI/MSI-X
[    2.898049] systemd-udevd[342]: renamed network interface eth0 to em1
[    2.906776] ALSA sound/pci/hda/patch_realtek.c:419 SKU: Nid=0x1d
sku_cfg=0x4016c629
[    2.906778] ALSA sound/pci/hda/patch_realtek.c:421 SKU:
port_connectivity=0x1
[    2.906779] ALSA sound/pci/hda/patch_realtek.c:422 SKU: enable_pcbeep=0x1
[    2.906780] ALSA sound/pci/hda/patch_realtek.c:423 SKU: check_sum=0x00000006
[    2.906781] ALSA sound/pci/hda/patch_realtek.c:424 SKU:
customization=0x000000c6
[    2.906782] ALSA sound/pci/hda/patch_realtek.c:425 SKU: external_amp=0x5
[    2.906783] ALSA sound/pci/hda/patch_realtek.c:426 SKU: platform_type=0x0
[    2.906784] ALSA sound/pci/hda/patch_realtek.c:427 SKU: swap=0x0
[    2.906785] ALSA sound/pci/hda/patch_realtek.c:428 SKU: override=0x1
[    2.907104] ALSA sound/pci/hda/hda_auto_parser.c:393 autoconfig: line_outs=1
(0x14/0x0/0x0/0x0/0x0) type:line
[    2.907106] ALSA sound/pci/hda/hda_auto_parser.c:397    speaker_outs=1
(0x17/0x0/0x0/0x0/0x0)
[    2.907107] ALSA sound/pci/hda/hda_auto_parser.c:401    hp_outs=1
(0x1b/0x0/0x0/0x0/0x0)
[    2.907108] ALSA sound/pci/hda/hda_auto_parser.c:402    mono: mono_out=0x0
[    2.907109] ALSA sound/pci/hda/hda_auto_parser.c:405    dig-out=0x11/0x0
[    2.907110] ALSA sound/pci/hda/hda_auto_parser.c:406    inputs:
[    2.907111] ALSA sound/pci/hda/hda_auto_parser.c:410      Front Mic=0x19
[    2.907113] ALSA sound/pci/hda/hda_auto_parser.c:410      Rear Mic=0x18
[    2.907114] ALSA sound/pci/hda/hda_auto_parser.c:410      Line=0x1a
[    2.907115] ALSA sound/pci/hda/patch_realtek.c:491 realtek: No valid SSID,
checking pincfg 0x4016c629 for NID 0x1d
[    2.907116] ALSA sound/pci/hda/patch_realtek.c:507 realtek: Enabling init
ASM_ID=0xc629 CODEC_ID=10ec0892
[    2.918798] input: HDA Intel PCH Front Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input11
[    2.918848] input: HDA Intel PCH Line Out as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input10
[    2.918880] input: HDA Intel PCH Line as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input9
[    2.918909] input: HDA Intel PCH Rear Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input8
[    2.918937] input: HDA Intel PCH Front Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input7
[    2.919116] hda_intel: Disabling MSI
[    2.919121] ALSA sound/pci/hda/hda_intel.c:3173 0000:01:00.1: Handle
VGA-switcheroo audio client
[    2.919154] ALSA sound/pci/hda/hda_intel.c:3657 0000:01:00.1: Disabling
64bit DMA
[    2.922252] ALSA sound/pci/hda/hda_intel.c:1760 0000:01:00.1: Enable delay
in RIRB handling
[    3.087058] input: HDA NVidia HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input14
[    3.087209] input: HDA NVidia HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input13
[    3.087358] input: HDA NVidia HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input12
[    3.330219] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    3.330221] Bluetooth: BNEP filters: protocol multicast
[    3.330328] Bluetooth: BNEP socket layer initialized
[    3.349510] Guest personality initialized and is inactive
[    3.349631] VMCI host device registered (name=vmci, major=10, minor=57)
[    3.349633] Initialized host personality
[    3.547020] NET: Registered protocol family 40
[    3.565255] fuse init (API version 7.22)
[    3.668720] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
[    3.684374] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    3.775958] Ebtables v2.0 registered
[    3.783675] Bridge firewalling registered
[    3.904634] cfg80211: Calling CRDA to update world regulatory domain
[    3.907373] cfg80211: World regulatory domain updated:
[    3.907376] cfg80211:   (start_freq - end_freq @ bandwidth),
(max_antenna_gain, max_eirp)
[    3.907377] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000
mBm)
[    3.907378] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000
mBm)
[    3.907379] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000
mBm)
[    3.907380] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 2000
mBm)
[    3.907381] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000
mBm)
[    3.907382] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0
mBm)
[    4.074050] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    4.174975] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    4.175082] IPv6: ADDRCONF(NETDEV_UP): em1: link is not ready
[    6.982939] e1000e: em1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx
[    6.982976] IPv6: ADDRCONF(NETDEV_CHANGE): em1: link becomes ready
[  114.241813] Bluetooth: RFCOMM TTY layer initialized
[  114.241822] Bluetooth: RFCOMM socket layer initialized
[  114.241826] Bluetooth: RFCOMM ver 1.11
[ 1743.737807] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
[ 8543.865800] nouveau E[     DRM] GPU lockup - switching to software fbcon
[ 8558.870800] nouveau E[  X[808]] failed to idle channel 0xcccc0001 [X[808]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396319812.47CC1.14411
Date: Tue, 1 Apr 2014 02:36:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg EQ overflowing lock up"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg EQ overflowing lock up"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818">bug 76818</a>
              from <span class="vcard"><a class="email" href="mailto:max.snow&#64;4mation.com.au" title="Max &lt;max.snow&#64;4mation.com.au&gt;"> <span class="fn">Max</span></a>
</span></b>
        <pre>Sure, here it is

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.13.7-200.fc20.x86_64 (mockbuild&#64;bkernel02) (gcc
version 4.8.2 20131212 (Red Hat 4.8.2-7) (GCC) ) #1 SMP Mon Mar 24 22:01:49 UTC
2014
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-3.13.7-200.fc20.x86_64
root=UUID=814b8090-a6a3-4be3-b91d-29a259094e61 ro rd.md=0 rd.lvm=0 rd.dm=0
vconsole.keymap=us rd.luks=0 vconsole.font=latarcyrheb-sun16 rhgb quiet
LANG=en_GB.UTF-8 vga=normal
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000df15dfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df15e000-0x00000000df1a7fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000df1a8000-0x00000000df1affff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000df1b0000-0x00000000df3c5fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df3c6000-0x00000000df3c6fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df3c7000-0x00000000df3d6fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df3d7000-0x00000000df3e1fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000df3e2000-0x00000000df406fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df407000-0x00000000df449fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000df44a000-0x00000000df684fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000df685000-0x00000000df7fffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f7fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.6 present.
[    0.000000] DMI:                  /DH61CR, BIOS
BEH6110H.86A.0016.2011.0118.1128 01/18/2011
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==&gt; reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x21f800 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-CFFFF write-protect
[    0.000000]   D0000-E7FFF uncachable
[    0.000000]   E8000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask E00000000 write-back
[    0.000000]   1 base 200000000 mask FE0000000 write-back
[    0.000000]   2 base 0E0000000 mask FE0000000 uncachable
[    0.000000]   3 base 21F800000 mask FFF800000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] e820: update [mem 0xe0000000-0xffffffff] usable ==&gt; reserved
[    0.000000] e820: last_pfn = 0xdf800 max_arch_pfn = 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000fce50-0x000fce5f] mapped at
[ffff8800000fce50]
[    0.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x0200f000, 0x0200ffff] PGTABLE
[    0.000000] BRK [0x02010000, 0x02010fff] PGTABLE
[    0.000000] BRK [0x02011000, 0x02011fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x21f600000-0x21f7fffff]
[    0.000000]  [mem 0x21f600000-0x21f7fffff] page 2M
[    0.000000] BRK [0x02012000, 0x02012fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x21c000000-0x21f5fffff]
[    0.000000]  [mem 0x21c000000-0x21f5fffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x200000000-0x21bffffff]
[    0.000000]  [mem 0x200000000-0x21bffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0xdf15dfff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0xdeffffff] page 2M
[    0.000000]  [mem 0xdf000000-0xdf15dfff] page 4k
[    0.000000] init_memory_mapping: [mem 0xdf3c6000-0xdf3c6fff]
[    0.000000]  [mem 0xdf3c6000-0xdf3c6fff] page 4k
[    0.000000] BRK [0x02013000, 0x02013fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0xdf685000-0xdf7fffff]
[    0.000000]  [mem 0xdf685000-0xdf7fffff] page 4k
[    0.000000] BRK [0x02014000, 0x02014fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x100000000-0x1ffffffff]
[    0.000000]  [mem 0x100000000-0x1ffffffff] page 2M
[    0.000000] RAMDISK: [mem 0x36c36000-0x37612fff]
[    0.000000] ACPI: RSDP 00000000000f0450 000024 (v02  INTEL)
[    0.000000] ACPI: XSDT 00000000df1a8068 00004C (v01 INTEL  DH61CR   01072009
AMI  00010013)
[    0.000000] ACPI: FACP 00000000df1af340 0000F4 (v04 INTEL  DH61CR   01072009
AMI  00010013)
[    0.000000] ACPI: DSDT 00000000df1a8140 0071FD (v02 INTEL  DH61CR   00000012
INTL 20051117)
[    0.000000] ACPI: FACS 00000000df3d9f80 000040
[    0.000000] ACPI: APIC 00000000df1af438 000072 (v03 INTEL  DH61CR   01072009
AMI  00010013)
[    0.000000] ACPI: SSDT 00000000df1af4b0 000102 (v01 INTEL  DH61CR   00000001
MSFT 03000001)
[    0.000000] ACPI: MCFG 00000000df1af5b8 00003C (v01 INTEL  DH61CR   01072009
MSFT 00000097)
[    0.000000] ACPI: HPET 00000000df1af5f8 000038 (v01 INTEL  DH61CR   01072009
AMI. 00000004)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000021f7fffff]
[    0.000000] Initmem setup node 0 [mem 0x00000000-0x21f7fffff]
[    0.000000]   NODE_DATA [mem 0x21f7e4000-0x21f7f7fff]
[    0.000000]  [ffffea0000000000-ffffea00087fffff] PMD -&gt;
[ffff880216e00000-ffff88021edfffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
[    0.000000]   Normal   [mem 0x100000000-0x21f7fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
[    0.000000]   node   0: [mem 0x00100000-0xdf15dfff]
[    0.000000]   node   0: [mem 0xdf3c6000-0xdf3c6fff]
[    0.000000]   node   0: [mem 0xdf685000-0xdf7fffff]
[    0.000000]   node   0: [mem 0x100000000-0x21f7fffff]
[    0.000000] On node 0 totalpages: 2091638
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 14220 pages used for memmap
[    0.000000]   DMA32 zone: 910042 pages, LIFO batch:31
[    0.000000]   Normal zone: 18400 pages used for memmap
[    0.000000]   Normal zone: 1177600 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf15e000-0xdf1a7fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf1a8000-0xdf1affff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf1b0000-0xdf3c5fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf3c7000-0xdf3d6fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf3d7000-0xdf3e1fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf3e2000-0xdf406fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf407000-0xdf449fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf44a000-0xdf684fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdf800000-0xfed1bfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] e820: [mem 0xdf800000-0xfed1bfff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:1024 nr_cpumask_bits:4 nr_cpu_ids:4
nr_node_ids:1
[    0.000000] PERCPU: Embedded 29 pages/cpu &#64;ffff88021f400000 s86592 r8192
d24000 u524288
[    0.000000] pcpu-alloc: s86592 r8192 d24000 u524288 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total
pages: 2058933
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-3.13.7-200.fc20.x86_64
root=UUID=814b8090-a6a3-4be3-b91d-29a259094e61 ro rd.md=0 rd.lvm=0 rd.dm=0
vconsole.keymap=us rd.luks=0 vconsole.font=latarcyrheb-sun16 rhgb quiet
LANG=en_GB.UTF-8 vga=normal
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
[    0.000000] Memory: 8141948K/8366552K available (6762K kernel code, 1067K
rwdata, 2984K rodata, 1424K init, 1628K bss, 224604K reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     RCU restricting CPUs from NR_CPUS=1024 to nr_cpu_ids=4.
[    0.000000] NR_IRQS:65792 nr_irqs:712 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] allocated 33554432 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't want
memory cgroups
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.001000] tsc: Detected 3292.304 MHz processor
[    0.000001] Calibrating delay loop (skipped), value calculated using timer
frequency.. 6584.60 BogoMIPS (lpj=3292304)
[    0.000003] pid_max: default: 32768 minimum: 301
[    0.000031] Security Framework initialized
[    0.000036] SELinux:  Initializing.
[    0.000042] SELinux:  Starting in permissive mode
[    0.000528] Dentry cache hash table entries: 1048576 (order: 11, 8388608
bytes)
[    0.001780] Inode-cache hash table entries: 524288 (order: 10, 4194304
bytes)
[    0.002295] Mount-cache hash table entries: 256
[    0.002423] Initializing cgroup subsys memory
[    0.002428] Initializing cgroup subsys devices
[    0.002429] Initializing cgroup subsys freezer
[    0.002430] Initializing cgroup subsys net_cls
[    0.002431] Initializing cgroup subsys blkio
[    0.002432] Initializing cgroup subsys perf_event
[    0.002433] Initializing cgroup subsys hugetlb
[    0.002451] CPU: Physical Processor ID: 0
[    0.002452] CPU: Processor Core ID: 0
[    0.002455] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.002457] mce: CPU supports 9 MCE banks
[    0.002467] CPU0: Thermal monitoring enabled (TM1)
[    0.002475] Last level iTLB entries: 4KB 512, 2MB 0, 4MB 0
Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32
tlb_flushall_shift: 5
[    0.002544] Freeing SMP alternatives memory: 24K (ffffffff81e70000 -
ffffffff81e76000)
[    0.003611] ACPI: Core revision 20131115
[    0.005356] ACPI: All ACPI Tables successfully acquired
[    0.229736] ftrace: allocating 25917 entries in 102 pages
[    0.239695] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.249697] smpboot: CPU0: Intel(R) Core(TM) i5-2500 CPU &#64; 3.30GHz (fam: 06,
model: 2a, stepping: 07)
[    0.249703] TSC deadline timer enabled
[    0.249711] Performance Events: PEBS fmt1+, 16-deep LBR, SandyBridge events,
full-width counters, Intel PMU driver.
[    0.249716] perf_event_intel: PEBS disabled due to CPU errata, please
upgrade microcode
[    0.249717] ... version:                3
[    0.249718] ... bit width:              48
[    0.249719] ... generic registers:      8
[    0.249719] ... value mask:             0000ffffffffffff
[    0.249720] ... max period:             0000ffffffffffff
[    0.249721] ... fixed-purpose events:   3
[    0.249722] ... event mask:             00000007000000ff
[    0.250630] x86: Booting SMP configuration:
[    0.263898] NMI watchdog: enabled on all CPUs, permanently consumes one
hw-PMU counter.
[    0.250632] .... node  #0, CPUs:      #1 #2 #3
[    0.290483] x86: Booted up 1 node, 4 CPUs
[    0.290486] smpboot: Total of 4 processors activated (26338.43 BogoMIPS)
[    0.292865] devtmpfs: initialized
[    0.294916] PM: Registering ACPI NVS region [mem 0xdf15e000-0xdf1a7fff]
(303104 bytes)
[    0.294921] PM: Registering ACPI NVS region [mem 0xdf3d7000-0xdf3e1fff]
(45056 bytes)
[    0.294922] PM: Registering ACPI NVS region [mem 0xdf407000-0xdf449fff]
(274432 bytes)
[    0.295501] atomic64 test passed for x86-64 platform with CX8 and with SSE
[    0.295503] pinctrl core: initialized pinctrl subsystem
[    0.295536] RTC time:  9:06:11, date: 04/01/14
[    0.295561] NET: Registered protocol family 16
[    0.295631] cpuidle: using governor menu
[    0.295675] ACPI: bus type PCI registered
[    0.295676] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.295719] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.295721] PCI: not using MMCONFIG
[    0.295722] PCI: Using configuration type 1 for base access
[    0.296400] bio: create slab &lt;bio-0&gt; at 0
[    0.296481] ACPI: Added _OSI(Module Device)
[    0.296482] ACPI: Added _OSI(Processor Device)
[    0.296483] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.296484] ACPI: Added _OSI(Processor Aggregator Device)
[    0.297860] ACPI: Executed 1 blocks of module-level executable AML code
[    0.299385] ACPI: SSDT 00000000df3d8c18 00038C (v01    AMI      IST 00000001
MSFT 03000001)
[    0.299563] ACPI: Dynamic OEM Table Load:
[    0.299564] ACPI: SSDT           (null) 00038C (v01    AMI      IST 00000001
MSFT 03000001)
[    0.299579] ACPI: SSDT 00000000df3d9e18 000084 (v01    AMI      CST 00000001
MSFT 03000001)
[    0.299726] ACPI: Dynamic OEM Table Load:
[    0.299728] ACPI: SSDT           (null) 000084 (v01    AMI      CST 00000001
MSFT 03000001)
[    0.300046] ACPI: Interpreter enabled
[    0.300049] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S1_] (20131115/hwxface-580)
[    0.300052] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S2_] (20131115/hwxface-580)
[    0.300060] ACPI: (supports S0 S3 S4 S5)
[    0.300060] ACPI: Using IOAPIC for interrupt routing
[    0.300073] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.300110] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in ACPI
motherboard resources
[    0.304347] PCI: Using host bridge windows from ACPI; if necessary, use
&quot;pci=nocrs&quot; and report a bug
[    0.304425] ACPI: No dock devices found.
[    0.304554] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.308026] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.308030] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM
Segments MSI]
[    0.308149] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER
PCIeCapability]
[    0.308273] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus
00-3f] only partially covers this bridge
[    0.308397] PCI host bridge to bus 0000:00
[    0.308399] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.308400] pci_bus 0000:00: root bus resource [io  0x0000-0x03af]
[    0.308401] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7]
[    0.308402] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df]
[    0.308404] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    0.308405] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
[    0.308406] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff]
[    0.308407] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xffffffff]
[    0.308413] pci 0000:00:00.0: [8086:0100] type 00 class 0x060000
[    0.308472] pci 0000:00:01.0: [8086:0101] type 01 class 0x060400
[    0.308495] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.308522] pci 0000:00:01.0: System wakeup disabled by ACPI
[    0.308597] pci 0000:00:16.0: [8086:1c3a] type 00 class 0x078000
[    0.308629] pci 0000:00:16.0: reg 0x10: [mem 0xf7129000-0xf712900f 64bit]
[    0.308738] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.308819] pci 0000:00:19.0: [8086:1503] type 00 class 0x020000
[    0.308846] pci 0000:00:19.0: reg 0x10: [mem 0xf7100000-0xf711ffff]
[    0.308858] pci 0000:00:19.0: reg 0x14: [mem 0xf7128000-0xf7128fff]
[    0.308870] pci 0000:00:19.0: reg 0x18: [io  0xf040-0xf05f]
[    0.308969] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.309007] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.309039] pci 0000:00:1a.0: [8086:1c2d] type 00 class 0x0c0320
[    0.309067] pci 0000:00:1a.0: reg 0x10: [mem 0xf7127000-0xf71273ff]
[    0.309195] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.309234] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    0.309265] pci 0000:00:1b.0: [8086:1c20] type 00 class 0x040300
[    0.309288] pci 0000:00:1b.0: reg 0x10: [mem 0xf7120000-0xf7123fff 64bit]
[    0.309390] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.309453] pci 0000:00:1c.0: [8086:1c10] type 01 class 0x060400
[    0.309567] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.309609] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.309651] pci 0000:00:1d.0: [8086:1c26] type 00 class 0x0c0320
[    0.309679] pci 0000:00:1d.0: reg 0x10: [mem 0xf7126000-0xf71263ff]
[    0.309810] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.309849] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.309877] pci 0000:00:1f.0: [8086:1c5c] type 00 class 0x060100
[    0.310073] pci 0000:00:1f.2: [8086:1c02] type 00 class 0x010601
[    0.310104] pci 0000:00:1f.2: reg 0x10: [io  0xf090-0xf097]
[    0.310116] pci 0000:00:1f.2: reg 0x14: [io  0xf080-0xf083]
[    0.310128] pci 0000:00:1f.2: reg 0x18: [io  0xf070-0xf077]
[    0.310139] pci 0000:00:1f.2: reg 0x1c: [io  0xf060-0xf063]
[    0.310151] pci 0000:00:1f.2: reg 0x20: [io  0xf020-0xf03f]
[    0.310163] pci 0000:00:1f.2: reg 0x24: [mem 0xf7125000-0xf71257ff]
[    0.310238] pci 0000:00:1f.2: PME# supported from D3hot
[    0.310292] pci 0000:00:1f.3: [8086:1c22] type 00 class 0x0c0500
[    0.310315] pci 0000:00:1f.3: reg 0x10: [mem 0xf7124000-0xf71240ff 64bit]
[    0.310347] pci 0000:00:1f.3: reg 0x20: [io  0xf000-0xf01f]
[    0.310446] pci 0000:01:00.0: [10de:0fc6] type 00 class 0x030000
[    0.310454] pci 0000:01:00.0: reg 0x10: [mem 0xf6000000-0xf6ffffff]
[    0.310464] pci 0000:01:00.0: reg 0x14: [mem 0xe0000000-0xefffffff 64bit
pref]
[    0.310473] pci 0000:01:00.0: reg 0x1c: [mem 0xf0000000-0xf1ffffff 64bit
pref]
[    0.310479] pci 0000:01:00.0: reg 0x24: [io  0xe000-0xe07f]
[    0.310485] pci 0000:01:00.0: reg 0x30: [mem 0xf7000000-0xf707ffff pref]
[    0.310546] pci 0000:01:00.1: [10de:0e1b] type 00 class 0x040300
[    0.310555] pci 0000:01:00.1: reg 0x10: [mem 0xf7080000-0xf7083fff]
[    0.311732] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.311736] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.311740] pci 0000:00:01.0:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.311744] pci 0000:00:01.0:   bridge window [mem 0xe0000000-0xf1ffffff
64bit pref]
[    0.311861] pci 0000:02:00.0: [1283:8892] type 01 class 0x060400
[    0.312088] pci 0000:02:00.0: supports D1 D2
[    0.312089] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.312134] pci 0000:02:00.0: System wakeup disabled by ACPI
[    0.312151] pci 0000:02:00.0: disabling ASPM on pre-1.1 PCIe device.  You
can enable it with 'pcie_aspm=force'
[    0.312167] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.312404] pci 0000:02:00.0: PCI bridge to [bus 03]
[    0.312841] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.312877] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.312911] ACPI: PCI Interrupt Link [LNKC] (IRQs *3 4 5 6 10 11 12 14 15)
[    0.312944] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.312978] ACPI: PCI Interrupt Link [LNKE] (IRQs *3 4 5 6 7 10 11 12 14 15)
[    0.313011] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11 12 14 15)
*0
[    0.313045] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 *7 10 11 12 14 15)
[    0.313078] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.313142] ACPI: Enabled 3 GPEs in block 00 to 3F
[    0.313147] ACPI: \_SB_.PCI0: notify handler is installed
[    0.313173] Found 1 acpi root devices
[    0.313223] vgaarb: device added:
PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.313224] vgaarb: loaded
[    0.313225] vgaarb: bridge control possible 0000:01:00.0
[    0.313263] SCSI subsystem initialized
[    0.313287] libata version 3.00 loaded.
[    0.313298] ACPI: bus type USB registered
[    0.313308] usbcore: registered new interface driver usbfs
[    0.313313] usbcore: registered new interface driver hub
[    0.313325] usbcore: registered new device driver usb
[    0.313358] PCI: Using ACPI for IRQ routing
[    0.315843] PCI: pci_cache_line_size set to 64 bytes
[    0.315890] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
[    0.315891] e820: reserve RAM buffer [mem 0xdf15e000-0xdfffffff]
[    0.315892] e820: reserve RAM buffer [mem 0xdf3c7000-0xdfffffff]
[    0.315893] e820: reserve RAM buffer [mem 0xdf800000-0xdfffffff]
[    0.315894] e820: reserve RAM buffer [mem 0x21f800000-0x21fffffff]
[    0.315945] NetLabel: Initializing
[    0.315946] NetLabel:  domain hash size = 128
[    0.315946] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.315955] NetLabel:  unlabeled traffic allowed by default
[    0.315996] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.316000] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.318019] Switched to clocksource hpet
[    0.321494] pnp: PnP ACPI init
[    0.321504] ACPI: bus type PNP registered
[    0.321586] system 00:00: [mem 0xfed10000-0xfed19fff] has been reserved
[    0.321588] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.321589] system 00:00: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.321591] system 00:00: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.321592] system 00:00: [mem 0xfee00000-0xfee0ffff] has been reserved
[    0.321595] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.321696] system 00:01: [io  0x0778-0x077f] has been reserved
[    0.321698] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.321873] pnp 00:02: [dma 0 disabled]
[    0.321908] pnp 00:02: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.322103] pnp 00:03: [dma 3]
[    0.322172] pnp 00:03: Plug and Play ACPI device, IDs PNP0400 (active)
[    0.322178] pnp 00:04: [dma 4]
[    0.322189] pnp 00:04: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.322205] pnp 00:05: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.322218] pnp 00:06: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.322249] system 00:07: [io  0x04d0-0x04d1] has been reserved
[    0.322251] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.322267] pnp 00:08: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.322380] system 00:09: [io  0x0400-0x0453] could not be reserved
[    0.322381] system 00:09: [io  0x0458-0x047f] has been reserved
[    0.322383] system 00:09: [io  0x1180-0x119f] has been reserved
[    0.322384] system 00:09: [io  0x0500-0x057f] has been reserved
[    0.322385] system 00:09: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.322387] system 00:09: [mem 0xfec00000-0xfecfffff] could not be reserved
[    0.322388] system 00:09: [mem 0xfed08000-0xfed08fff] has been reserved
[    0.322390] system 00:09: [mem 0xff000000-0xffffffff] has been reserved
[    0.322391] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.322424] system 00:0a: [io  0x0454-0x0457] has been reserved
[    0.322426] system 00:0a: Plug and Play ACPI device, IDs INT3f0d PNP0c02
(active)
[    0.322502] pnp 00:0b: Plug and Play ACPI device, IDs PNP0103 (active)
[    0.322591] pnp: PnP ACPI: found 12 devices
[    0.322592] ACPI: bus type PNP unregistered
[    0.328496] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.328498] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.328501] pci 0000:00:01.0:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.328503] pci 0000:00:01.0:   bridge window [mem 0xe0000000-0xf1ffffff
64bit pref]
[    0.328505] pci 0000:02:00.0: PCI bridge to [bus 03]
[    0.328538] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.328553] pci_bus 0000:00: resource 4 [io  0x0000-0x03af]
[    0.328554] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7]
[    0.328556] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df]
[    0.328557] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff]
[    0.328558] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff]
[    0.328559] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff]
[    0.328560] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xffffffff]
[    0.328562] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    0.328563] pci_bus 0000:01: resource 1 [mem 0xf6000000-0xf70fffff]
[    0.328564] pci_bus 0000:01: resource 2 [mem 0xe0000000-0xf1ffffff 64bit
pref]
[    0.328585] NET: Registered protocol family 2
[    0.328707] TCP established hash table entries: 65536 (order: 7, 524288
bytes)
[    0.328831] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.328944] TCP: Hash tables configured (established 65536 bind 65536)
[    0.328958] TCP: reno registered
[    0.328967] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.328992] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.329054] NET: Registered protocol family 1
[    0.329254] pci 0000:01:00.0: Boot video device
[    0.329267] PCI: CLS 64 bytes, default 64
[    0.329298] Unpacking initramfs...
[    0.440633] Freeing initrd memory: 10100K (ffff880036c36000 -
ffff880037613000)
[    0.440636] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.440638] software IO TLB [mem 0xdb15e000-0xdf15e000] (64MB) mapped at
[ffff8800db15e000-ffff8800df15dfff]
[    0.442364] alg: No test for __gcm-aes-aesni (__driver-gcm-aes-aesni)
[    0.442606] Initialise system trusted keyring
[    0.442639] audit: initializing netlink socket (disabled)
[    0.442646] type=2000 audit(1396343171.210:1): initialized
[    0.459276] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.460078] zbud: loaded
[    0.460177] VFS: Disk quotas dquot_6.5.2
[    0.460204] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.460424] msgmni has been set to 15922
[    0.460457] Key type big_key registered
[    0.460458] SELinux:  Registering netfilter hooks
[    0.461072] alg: No test for stdrng (krng)
[    0.461077] NET: Registered protocol family 38
[    0.461079] Key type asymmetric registered
[    0.461080] Asymmetric key parser 'x509' registered
[    0.461100] Block layer SCSI generic (bsg) driver version 0.4 loaded (major
252)
[    0.461122] io scheduler noop registered
[    0.461123] io scheduler deadline registered
[    0.461138] io scheduler cfq registered (default)
[    0.461259] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
[    0.461354] pcieport 0000:00:1c.0: irq 41 for MSI/MSI-X
[    0.461442] pcieport 0000:00:01.0: Signaling PME through PCIe PME interrupt
[    0.461443] pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
[    0.461444] pci 0000:01:00.1: Signaling PME through PCIe PME interrupt
[    0.461446] pcie_pme 0000:00:01.0:pcie01: service driver pcie_pme loaded
[    0.461465] pcieport 0000:00:1c.0: Signaling PME through PCIe PME interrupt
[    0.461466] pci 0000:02:00.0: Signaling PME through PCIe PME interrupt
[    0.461470] pcie_pme 0000:00:1c.0:pcie01: service driver pcie_pme loaded
[    0.461476] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.461484] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.461503] intel_idle: MWAIT substates: 0x1120
[    0.461504] intel_idle: v0.4 model 0x2A
[    0.461505] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.461593] input: Power Button as
/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0
[    0.461596] ACPI: Power Button [PWRB]
[    0.461617] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.461619] ACPI: Power Button [PWRF]
[    0.461896] GHES: HEST is not enabled!
[    0.461932] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.482510] 00:02: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a
16550A
[    0.482884] Non-volatile memory driver v1.3
[    0.482885] Linux agpgart interface v0.103
[    0.482946] ahci 0000:00:1f.2: version 3.0
[    0.483028] ahci 0000:00:1f.2: irq 42 for MSI/MSI-X
[    0.494089] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 4 ports 3 Gbps 0x23
impl SATA mode
[    0.494100] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum
part ems apst 
[    0.498417] scsi0 : ahci
[    0.498546] scsi1 : ahci
[    0.498677] scsi2 : ahci
[    0.498807] scsi3 : ahci
[    0.498936] scsi4 : ahci
[    0.499042] scsi5 : ahci
[    0.499073] ata1: SATA max UDMA/133 abar m2048&#64;0xf7125000 port 0xf7125100
irq 42
[    0.499076] ata2: SATA max UDMA/133 abar m2048&#64;0xf7125000 port 0xf7125180
irq 42
[    0.499076] ata3: DUMMY
[    0.499077] ata4: DUMMY
[    0.499078] ata5: DUMMY
[    0.499080] ata6: SATA max UDMA/133 abar m2048&#64;0xf7125000 port 0xf7125380
irq 42
[    0.499120] libphy: Fixed MDIO Bus: probed
[    0.499178] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.499183] ehci-pci: EHCI PCI platform driver
[    0.499248] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    0.499307] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus
number 1
[    0.499323] ehci-pci 0000:00:1a.0: debug port 2
[    0.503231] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[    0.503244] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf7127000
[    0.509030] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    0.509057] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    0.509059] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    0.509060] usb usb1: Product: EHCI Host Controller
[    0.509061] usb usb1: Manufacturer: Linux 3.13.7-200.fc20.x86_64 ehci_hcd
[    0.509062] usb usb1: SerialNumber: 0000:00:1a.0
[    0.509143] hub 1-0:1.0: USB hub found
[    0.509147] hub 1-0:1.0: 2 ports detected
[    0.509257] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    0.509313] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus
number 2
[    0.509328] ehci-pci 0000:00:1d.0: debug port 2
[    0.513239] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[    0.513252] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf7126000
[    0.519029] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    0.519052] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    0.519053] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    0.519054] usb usb2: Product: EHCI Host Controller
[    0.519056] usb usb2: Manufacturer: Linux 3.13.7-200.fc20.x86_64 ehci_hcd
[    0.519057] usb usb2: SerialNumber: 0000:00:1d.0
[    0.519149] hub 2-0:1.0: USB hub found
[    0.519152] hub 2-0:1.0: 2 ports detected
[    0.519205] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.519206] ohci-pci: OHCI PCI platform driver
[    0.519211] uhci_hcd: USB Universal Host Controller Interface driver
[    0.519238] usbcore: registered new interface driver usbserial
[    0.519242] usbcore: registered new interface driver usbserial_generic
[    0.519246] usbserial: USB Serial support registered for generic
[    0.519262] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    0.522336] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.522341] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.522458] mousedev: PS/2 mouse device common for all mice
[    0.522725] rtc_cmos 00:05: RTC can wake from S4
[    0.522852] rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
[    0.522883] rtc_cmos 00:05: alarms up to one month, y3k, 114 bytes nvram,
hpet irqs
[    0.522918] device-mapper: uevent: version 1.0.3
[    0.522957] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30) initialised:
<a href="mailto:dm-devel&#64;redhat.com">dm-devel&#64;redhat.com</a>
[    0.522967] Intel P-state driver initializing.
[    0.522974] Intel pstate controlling: cpu 0
[    0.522983] Intel pstate controlling: cpu 1
[    0.522989] Intel pstate controlling: cpu 2
[    0.522997] Intel pstate controlling: cpu 3
[    0.523134] hidraw: raw HID events driver (C) Jiri Kosina
[    0.523180] usbcore: registered new interface driver usbhid
[    0.523181] usbhid: USB HID core driver
[    0.523198] drop_monitor: Initializing network drop monitor service
[    0.523237] ip_tables: (C) 2000-2006 Netfilter Core Team
[    0.523333] TCP: cubic registered
[    0.523334] Initializing XFRM netlink socket
[    0.523386] NET: Registered protocol family 10
[    0.523486] mip6: Mobile IPv6
[    0.523488] NET: Registered protocol family 17
[    0.523715] Loading compiled-in X.509 certificates
[    0.524392] Loaded X.509 cert 'Fedora kernel signing key:
c3830b4732e7ae9d9e43fcfb76f135cc8fff609e'
[    0.524400] registered taskstats version 1
[    0.524931]   Magic number: 10:79:120
[    0.524933] misc device-mapper: hash matches
[    0.525029] rtc_cmos 00:05: setting system clock to 2014-04-01 09:06:11 UTC
(1396343171)
[    0.525050] PM: Hibernation image not present or could not be loaded.
[    0.804077] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    0.804104] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    0.804133] ata6: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    0.804696] ata1.00: ATAPI: TSSTcorp CDDVDW SH-222AB, SB00, max UDMA/100
[    0.804999] ata6.00: failed to get NCQ Send/Recv Log Emask 0x1
[    0.805003] ata6.00: ATA-9: Samsung SSD 840 Series, DXT08B0Q, max UDMA/133
[    0.805025] ata6.00: 234441648 sectors, multi 16: LBA48 NCQ (depth 31/32),
AA
[    0.805397] ata2.00: ATA-8: ST1000DM003-1CH162, CC46, max UDMA/133
[    0.805401] ata2.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 31/32),
AA
[    0.805454] ata1.00: configured for UDMA/100
[    0.805668] ata6.00: failed to get NCQ Send/Recv Log Emask 0x1
[    0.805759] ata6.00: configured for UDMA/133
[    0.806281] ata2.00: configured for UDMA/133
[    0.806509] scsi 0:0:0:0: CD-ROM            TSSTcorp CDDVDW SH-222AB  SB00
PQ: 0 ANSI: 5
[    0.809083] sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda
tray
[    0.809087] cdrom: Uniform CD-ROM driver Revision: 3.20
[    0.809273] sr 0:0:0:0: Attached scsi CD-ROM sr0
[    0.809413] sr 0:0:0:0: Attached scsi generic sg0 type 5
[    0.809758] scsi 1:0:0:0: Direct-Access     ATA      ST1000DM003-1CH1 CC46
PQ: 0 ANSI: 5
[    0.809916] sd 1:0:0:0: Attached scsi generic sg1 type 0
[    0.809964] sd 1:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00
TB/931 GiB)
[    0.809966] sd 1:0:0:0: [sda] 4096-byte physical blocks
[    0.810155] sd 1:0:0:0: [sda] Write Protect is off
[    0.810160] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    0.810222] scsi 5:0:0:0: Direct-Access     ATA      Samsung SSD 840  DXT0
PQ: 0 ANSI: 5
[    0.810251] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    0.810366] sd 5:0:0:0: Attached scsi generic sg2 type 0
[    0.810369] sd 5:0:0:0: [sdb] 234441648 512-byte logical blocks: (120 GB/111
GiB)
[    0.810556] sd 5:0:0:0: [sdb] Write Protect is off
[    0.810561] sd 5:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    0.810603] sd 5:0:0:0: [sdb] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    0.811038] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    0.811198]  sdb: sdb1 sdb2 sdb3
[    0.811836] sd 5:0:0:0: [sdb] Attached SCSI disk
[    0.818443]  sda: sda1
[    0.819025] sd 1:0:0:0: [sda] Attached SCSI disk
[    0.820192] Freeing unused kernel memory: 1424K (ffffffff81d0c000 -
ffffffff81e70000)
[    0.820195] Write protecting the kernel read-only data: 12288k
[    0.824134] Freeing unused kernel memory: 1420K (ffff88000169d000 -
ffff880001800000)
[    0.826954] Freeing unused kernel memory: 1112K (ffff880001aea000 -
ffff880001c00000)
[    0.829938] systemd[1]: systemd 208 running in system mode. (+PAM +LIBWRAP
+AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ)
[    0.830131] systemd[1]: Running in initial RAM disk.
[    0.830188] systemd[1]: Set hostname to &lt;soshi&gt;.
[    0.830729] random: systemd urandom read with 20 bits of entropy available
[    0.835483] systemd[1]: Expecting device
dev-disk-by\x2duuid-814b8090\x2da6a3\x2d4be3\x2db91d\x2d29a259094e61.device...
[    0.835500] systemd[1]: Starting -.slice.
[    0.835633] systemd[1]: Created slice -.slice.
[    0.835648] systemd[1]: Starting System Slice.
[    0.835716] systemd[1]: Created slice System Slice.
[    0.835728] systemd[1]: Starting Slices.
[    0.835739] systemd[1]: Reached target Slices.
[    0.835748] systemd[1]: Starting Timers.
[    0.835759] systemd[1]: Reached target Timers.
[    0.835771] systemd[1]: Starting udev Kernel Socket.
[    0.835803] systemd[1]: Listening on udev Kernel Socket.
[    0.835815] systemd[1]: Starting udev Control Socket.
[    0.835845] systemd[1]: Listening on udev Control Socket.
[    0.835856] systemd[1]: Starting Journal Socket.
[    0.835900] systemd[1]: Listening on Journal Socket.
[    0.836021] systemd[1]: Starting dracut cmdline hook...
[    0.836308] systemd[1]: Starting Sockets.
[    0.836321] systemd[1]: Reached target Sockets.
[    0.836332] systemd[1]: Starting Journal Service...
[    0.836638] systemd[1]: Started Journal Service.
[    0.894738] systemd-udevd[159]: starting version 208
[    0.917714] [drm] Initialized drm 1.1.0 20060810
[    0.924328] wmi: Mapper loaded
[    0.929404] usb 1-1: New USB device found, idVendor=8087, idProduct=0024
[    0.929407] usb 1-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    0.929541] hub 1-1:1.0: USB hub found
[    0.929643] hub 1-1:1.0: 4 ports detected
[    0.941019] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7060a2
[    0.941022] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    0.941023] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    0.942163] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.942169] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.942170] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    1.033045] usb 2-1: new high-speed USB device number 2 using ehci-pci
[    1.064806] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.064808] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    1.064879] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.064881] nouveau  [   VBIOS][0000:01:00.0] version 80.07.35.00.60
[    1.065096] nouveau 0000:01:00.0: irq 43 for MSI/MSI-X
[    1.065105] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.065163] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.065165] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    1.065165] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.147471] usb 2-1: New USB device found, idVendor=8087, idProduct=0024
[    1.147474] usb 2-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    1.147814] hub 2-1:1.0: USB hub found
[    1.147923] hub 2-1:1.0: 6 ports detected
[    1.222225] usb 1-1.1: new low-speed USB device number 3 using ehci-pci
[    1.311845] usb 1-1.1: New USB device found, idVendor=046d, idProduct=c077
[    1.311847] usb 1-1.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    1.311848] usb 1-1.1: Product: USB Optical Mouse
[    1.311849] usb 1-1.1: Manufacturer: Logitech
[    1.314100] input: Logitech USB Optical Mouse as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.1/1-1.1:1.0/input/input5
[    1.314463] hid-generic 0003:046D:C077.0001: input,hidraw0: USB HID v1.11
Mouse [Logitech USB Optical Mouse] on usb-0000:00:1a.0-1.1/input0
[    1.387184] usb 1-1.2: new low-speed USB device number 4 using ehci-pci
[    1.442050] tsc: Refined TSC clocksource calibration: 3292.509 MHz
[    1.444970] PM: Starting manual resume from disk
[    1.444982] PM: Hibernation image partition 8:18 present
[    1.444983] PM: Looking for hibernation image.
[    1.445682] PM: Image not found (code -22)
[    1.445683] PM: Hibernation image not present or could not be loaded.
[    1.457388] EXT4-fs (sdb3): mounted filesystem with ordered data mode. Opts:
(null)
[    1.480540] usb 1-1.2: New USB device found, idVendor=413c, idProduct=2107
[    1.480543] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    1.480545] usb 1-1.2: Product: Dell USB Entry Keyboard
[    1.480546] usb 1-1.2: Manufacturer: Dell
[    1.484711] input: Dell Dell USB Entry Keyboard as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input6
[    1.484835] hid-generic 0003:413C:2107.0002: input,hidraw1: USB HID v1.10
Keyboard [Dell Dell USB Entry Keyboard] on usb-0000:00:1a.0-1.2/input0
[    1.558218] usb 2-1.2: new full-speed USB device number 3 using ehci-pci
[    1.644705] usb 2-1.2: New USB device found, idVendor=0a12, idProduct=0001
[    1.644707] usb 2-1.2: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    1.709004] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.709009] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.709012] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.709051] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 324
MHz 
[    1.709056] nouveau  [     CLK][0000:01:00.0] 0a: core 540 MHz memory 810
MHz 
[    1.709060] nouveau  [     CLK][0000:01:00.0] 0f: core 1110 MHz memory 2500
MHz 
[    1.709199] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 324
MHz 
[    1.733172] [TTM] Zone  kernel: Available graphics memory: 4078014 kiB
[    1.733173] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.733174] [TTM] Initializing pool allocator
[    1.733177] [TTM] Initializing DMA pool allocator
[    1.733189] nouveau  [     DRM] VRAM: 1024 MiB
[    1.733190] nouveau  [     DRM] GART: 1048576 MiB
[    1.733193] nouveau  [     DRM] TMDS table version 2.0
[    1.733194] nouveau  [     DRM] DCB version 4.0
[    1.733195] nouveau  [     DRM] DCB outp 00: 02033f10 00000000
[    1.733197] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    1.733198] nouveau  [     DRM] DCB outp 02: 08011f82 00020030
[    1.733198] nouveau  [     DRM] DCB outp 03: 02022f62 00020010
[    1.733200] nouveau  [     DRM] DCB conn 00: 00001031
[    1.733201] nouveau  [     DRM] DCB conn 01: 00002131
[    1.733202] nouveau  [     DRM] DCB conn 02: 00010261
[    1.733203] nouveau  [     DRM] DCB conn 03: 00000300
[    1.734344] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.734345] [drm] No driver support for vblank timestamp query.
[    1.744598] nouveau  [     DRM] MM: using COPY for buffer copies
[    1.884895] nouveau  [     DRM] allocated 2560x1600 fb: 0x80000, bo
ffff8800dac54400
[    1.884965] fbcon: nouveaufb (fb0) is primary device
[    1.986744] Console: switching to colour frame buffer device 240x67
[    1.989939] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    1.989939] nouveau 0000:01:00.0: registered panic notifier
[    1.989942] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[    2.270321] systemd-journald[95]: Received SIGTERM
[    2.318554] SELinux:  Disabled at runtime.
[    2.318570] SELinux:  Unregistering netfilter hooks
[    2.356008] type=1404 audit(1396343173.330:2): selinux=0 auid=4294967295
ses=4294967295
[    2.364208] systemd[1]: RTC configured in localtime, applying delta of 660
minutes to system time.
[    2.415930] random: nonblocking pool is initialized
[    2.442069] Switched to clocksource tsc
[    2.462548] systemd-readahead[288]: Bumped block_nr parameter of 8:16 to
20480. This is a temporary hack and should be removed one day.
[    2.584549] systemd-udevd[326]: starting version 208
[    2.586029] EXT4-fs (sdb3): re-mounted. Opts: (null)
[    2.618145] parport_pc 00:03: reported by Plug and Play ACPI
[    2.618173] parport0: PC-style at 0x378, irq 5 [PCSPP,TRISTATE,EPP]
[    2.619451] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.621972] pps_core: LinuxPPS API ver. 1 registered
[    2.621974] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti &lt;<a href="mailto:giometti&#64;linux.it">giometti&#64;linux.it</a>&gt;
[    2.622841] PTP clock support registered
[    2.627745] e1000e: Intel(R) PRO/1000 Network Driver - 2.3.2-k
[    2.627748] e1000e: Copyright(c) 1999 - 2013 Intel Corporation.
[    2.627885] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to
dynamic conservative mode
[    2.627905] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    2.640037] microcode: CPU0 sig=0x206a7, pf=0x2, revision=0x14
[    2.641951] microcode: CPU0 sig=0x206a7, pf=0x2, revision=0x14
[    2.642412] microcode: CPU0 updated to revision 0x29, date = 2013-06-12
[    2.642419] microcode: CPU1 sig=0x206a7, pf=0x2, revision=0x14
[    2.642436] microcode: CPU1 sig=0x206a7, pf=0x2, revision=0x14
[    2.642668] microcode: CPU1 updated to revision 0x29, date = 2013-06-12
[    2.642672] microcode: CPU2 sig=0x206a7, pf=0x2, revision=0x14
[    2.642683] microcode: CPU2 sig=0x206a7, pf=0x2, revision=0x14
[    2.642913] microcode: CPU2 updated to revision 0x29, date = 2013-06-12
[    2.642918] microcode: CPU3 sig=0x206a7, pf=0x2, revision=0x14
[    2.642932] microcode: CPU3 sig=0x206a7, pf=0x2, revision=0x14
[    2.643171] microcode: CPU3 updated to revision 0x29, date = 2013-06-12
[    2.643173] perf_event_intel: PEBS enabled due to microcode update
[    2.643349] microcode: Microcode Update Driver: v2.00
&lt;<a href="mailto:tigran&#64;aivazian.fsnet.co.uk">tigran&#64;aivazian.fsnet.co.uk</a>&gt;, Peter Oruba
[    2.649001] alg: No test for crc32 (crc32-pclmul)
[    2.687070] ppdev: user-space parallel port driver
[    2.701527] Bluetooth: Core ver 2.17
[    2.701538] NET: Registered protocol family 31
[    2.701539] Bluetooth: HCI device and connection manager initialized
[    2.701546] Bluetooth: HCI socket layer initialized
[    2.701547] Bluetooth: L2CAP socket layer initialized
[    2.701550] Bluetooth: SCO socket layer initialized
[    2.702803] usbcore: registered new interface driver btusb
[    2.713536] Adding 8273916k swap on /dev/sdb2.  Priority:-1 extents:1
across:8273916k SSFS
[    2.753183] EXT4-fs (sdb1): mounted filesystem with ordered data mode. Opts:
(null)
[    2.859950] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts:
(null)
[    2.864211] systemd-journald[297]: Received request to flush runtime journal
from PID 1
[    2.865098] type=1305 audit(1396303573.839:3): audit_pid=482 old=0
auid=4294967295 ses=4294967295 res=1
[    2.888880] e1000e 0000:00:19.0 eth0: registered PHC clock
[    2.888883] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1)
e0:69:95:36:42:91
[    2.888884] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connection
[    2.888914] e1000e 0000:00:19.0 eth0: MAC: 10, PHY: 11, PBA No: FFFFFF-0FF
[    2.889140] mei_me 0000:00:16.0: irq 45 for MSI/MSI-X
[    2.890191] iTCO_vendor_support: vendor-support=0
[    2.890222] gpio_ich: GPIO from 180 to 255 on gpio_ich
[    2.891037] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.10
[    2.891055] iTCO_wdt: Found a Cougar Point TCO device (Version=2,
TCOBASE=0x0460)
[    2.891161] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    2.896538] i801_smbus 0000:00:1f.3: SMBus using PCI Interrupt
[    2.896642] snd_hda_intel 0000:00:1b.0: irq 46 for MSI/MSI-X
[    2.898049] systemd-udevd[342]: renamed network interface eth0 to em1
[    2.906776] ALSA sound/pci/hda/patch_realtek.c:419 SKU: Nid=0x1d
sku_cfg=0x4016c629
[    2.906778] ALSA sound/pci/hda/patch_realtek.c:421 SKU:
port_connectivity=0x1
[    2.906779] ALSA sound/pci/hda/patch_realtek.c:422 SKU: enable_pcbeep=0x1
[    2.906780] ALSA sound/pci/hda/patch_realtek.c:423 SKU: check_sum=0x00000006
[    2.906781] ALSA sound/pci/hda/patch_realtek.c:424 SKU:
customization=0x000000c6
[    2.906782] ALSA sound/pci/hda/patch_realtek.c:425 SKU: external_amp=0x5
[    2.906783] ALSA sound/pci/hda/patch_realtek.c:426 SKU: platform_type=0x0
[    2.906784] ALSA sound/pci/hda/patch_realtek.c:427 SKU: swap=0x0
[    2.906785] ALSA sound/pci/hda/patch_realtek.c:428 SKU: override=0x1
[    2.907104] ALSA sound/pci/hda/hda_auto_parser.c:393 autoconfig: line_outs=1
(0x14/0x0/0x0/0x0/0x0) type:line
[    2.907106] ALSA sound/pci/hda/hda_auto_parser.c:397    speaker_outs=1
(0x17/0x0/0x0/0x0/0x0)
[    2.907107] ALSA sound/pci/hda/hda_auto_parser.c:401    hp_outs=1
(0x1b/0x0/0x0/0x0/0x0)
[    2.907108] ALSA sound/pci/hda/hda_auto_parser.c:402    mono: mono_out=0x0
[    2.907109] ALSA sound/pci/hda/hda_auto_parser.c:405    dig-out=0x11/0x0
[    2.907110] ALSA sound/pci/hda/hda_auto_parser.c:406    inputs:
[    2.907111] ALSA sound/pci/hda/hda_auto_parser.c:410      Front Mic=0x19
[    2.907113] ALSA sound/pci/hda/hda_auto_parser.c:410      Rear Mic=0x18
[    2.907114] ALSA sound/pci/hda/hda_auto_parser.c:410      Line=0x1a
[    2.907115] ALSA sound/pci/hda/patch_realtek.c:491 realtek: No valid SSID,
checking pincfg 0x4016c629 for NID 0x1d
[    2.907116] ALSA sound/pci/hda/patch_realtek.c:507 realtek: Enabling init
ASM_ID=0xc629 CODEC_ID=10ec0892
[    2.918798] input: HDA Intel PCH Front Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input11
[    2.918848] input: HDA Intel PCH Line Out as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input10
[    2.918880] input: HDA Intel PCH Line as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input9
[    2.918909] input: HDA Intel PCH Rear Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input8
[    2.918937] input: HDA Intel PCH Front Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input7
[    2.919116] hda_intel: Disabling MSI
[    2.919121] ALSA sound/pci/hda/hda_intel.c:3173 0000:01:00.1: Handle
VGA-switcheroo audio client
[    2.919154] ALSA sound/pci/hda/hda_intel.c:3657 0000:01:00.1: Disabling
64bit DMA
[    2.922252] ALSA sound/pci/hda/hda_intel.c:1760 0000:01:00.1: Enable delay
in RIRB handling
[    3.087058] input: HDA NVidia HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input14
[    3.087209] input: HDA NVidia HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input13
[    3.087358] input: HDA NVidia HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input12
[    3.330219] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    3.330221] Bluetooth: BNEP filters: protocol multicast
[    3.330328] Bluetooth: BNEP socket layer initialized
[    3.349510] Guest personality initialized and is inactive
[    3.349631] VMCI host device registered (name=vmci, major=10, minor=57)
[    3.349633] Initialized host personality
[    3.547020] NET: Registered protocol family 40
[    3.565255] fuse init (API version 7.22)
[    3.668720] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
[    3.684374] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    3.775958] Ebtables v2.0 registered
[    3.783675] Bridge firewalling registered
[    3.904634] cfg80211: Calling CRDA to update world regulatory domain
[    3.907373] cfg80211: World regulatory domain updated:
[    3.907376] cfg80211:   (start_freq - end_freq &#64; bandwidth),
(max_antenna_gain, max_eirp)
[    3.907377] cfg80211:   (2402000 KHz - 2472000 KHz &#64; 40000 KHz), (N/A, 2000
mBm)
[    3.907378] cfg80211:   (2457000 KHz - 2482000 KHz &#64; 40000 KHz), (N/A, 2000
mBm)
[    3.907379] cfg80211:   (2474000 KHz - 2494000 KHz &#64; 20000 KHz), (N/A, 2000
mBm)
[    3.907380] cfg80211:   (5170000 KHz - 5250000 KHz &#64; 80000 KHz), (N/A, 2000
mBm)
[    3.907381] cfg80211:   (5735000 KHz - 5835000 KHz &#64; 80000 KHz), (N/A, 2000
mBm)
[    3.907382] cfg80211:   (57240000 KHz - 63720000 KHz &#64; 2160000 KHz), (N/A, 0
mBm)
[    4.074050] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    4.174975] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    4.175082] IPv6: ADDRCONF(NETDEV_UP): em1: link is not ready
[    6.982939] e1000e: em1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx
[    6.982976] IPv6: ADDRCONF(NETDEV_CHANGE): em1: link becomes ready
[  114.241813] Bluetooth: RFCOMM TTY layer initialized
[  114.241822] Bluetooth: RFCOMM socket layer initialized
[  114.241826] Bluetooth: RFCOMM ver 1.11
[ 1743.737807] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
[ 8543.865800] nouveau E[     DRM] GPU lockup - switching to software fbcon
[ 8558.870800] nouveau E[  X[808]] failed to idle channel 0xcccc0001 [X[808]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396319812.47CC1.14411--

--===============1087940026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1087940026==--
