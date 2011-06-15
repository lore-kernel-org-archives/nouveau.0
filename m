From: zaverel <zaverel-GANU6spQydw@public.gmane.org>
Subject: nouveau Ignoring invalid EDID block 1
Date: Wed, 15 Jun 2011 12:24:34 +0200
Message-ID: <4DF88862.9030609@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060305060604070301020202"
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

This is a multi-part message in MIME format.
--------------060305060604070301020202
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello ,

All is fine except i can't change resolution on my second monitor vga
,tv in fact,
(reported as DVI-I-2 ) anymore with my 9400gt.



Now , i'm on :

linux-2.6.39-gentoo-r1
xorg-server-1.10.2
xf86-video-nouveau-0.0.16_pre20110323
libdrm-2.4.25

Errors in dmesg  are:

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................




whatever i valid with xrandr is not really do on my tv
although xrandr say it's good , my tv always report 1202x670 50hz

I tried with and without xorg.conf

My last kernel working is linux-2.6.36-gentoo-r6.

see you.






--------------060305060604070301020202
Content-Type: text/plain;
 name="dmesg_log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg_log"

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 2.6.39-gentoo-r1 (root@funky64) (gcc version 4.5.2 (Gentoo 4.5.2 p1.0, pie-0.4.5) ) #1 SMP PREEMPT Fri Jun 10 17:18:16 CEST 2011
Command line: BOOT_IMAGE=/boot/vmlinuz-2.6.39-gentoo-r1 root=/dev/sda1 ro rootfstype=ext4 log_buf_len=1M
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009ec00 (usable)
 BIOS-e820: 000000000009ec00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e4c00 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000007f680000 (usable)
 BIOS-e820: 000000007f680000 - 000000007f698000 (ACPI data)
 BIOS-e820: 000000007f698000 - 000000007f6dc000 (ACPI NVS)
 BIOS-e820: 000000007f6dc000 - 0000000080000000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
 BIOS-e820: 00000000ffe00000 - 0000000100000000 (reserved)
NX (Execute Disable) protection: active
DMI 2.5 present.
DMI: System manufacturer System Product Name/P6T, BIOS 1303    03/08/2010
e820 update range: 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
No AGP bridge found
last_pfn = 0x7f680 max_arch_pfn = 0x400000000
MTRR default type: uncachable
MTRR fixed ranges enabled:
  00000-9FFFF write-back
  A0000-BFFFF uncachable
  C0000-E3FFF write-protect
  E4000-EBFFF write-through
  EC000-FFFFF write-protect
MTRR variable ranges enabled:
  0 base 000000000 mask F80000000 write-back
  1 base 07F700000 mask FFFF00000 uncachable
  2 base 07F800000 mask FFF800000 uncachable
  3 disabled
  4 disabled
  5 disabled
  6 disabled
  7 disabled
x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
found SMP MP-table at [ffff8800000ff780] ff780
initial memory mapped : 0 - 20000000
Base memory trampoline at [ffff880000099000] 99000 size 20480
init_memory_mapping: 0000000000000000-000000007f680000
 0000000000 - 007f600000 page 2M
 007f600000 - 007f680000 page 4k
kernel direct mapping tables up to 7f680000 @ 7f67c000-7f680000
ACPI: RSDP 00000000000fad60 00024 (v02 ACPIAM)
ACPI: XSDT 000000007f680100 0005C (v01 030810 XSDT1026 20100308 MSFT 00000097)
ACPI: FACP 000000007f680290 000F4 (v03 030810 FACP1026 20100308 MSFT 00000097)
ACPI: DSDT 000000007f6804b0 0C466 (v01  A1146 A1146001 00000001 INTL 20060113)
ACPI: FACS 000000007f698000 00040
ACPI: APIC 000000007f680390 000D8 (v01 030810 APIC1026 20100308 MSFT 00000097)
ACPI: MCFG 000000007f680470 0003C (v01 030810 OEMMCFG  20100308 MSFT 00000097)
ACPI: OEMB 000000007f698040 00072 (v01 030810 OEMB1026 20100308 MSFT 00000097)
ACPI: HPET 000000007f68f4b0 00038 (v01 030810 OEMHPET  20100308 MSFT 00000097)
ACPI: OSFR 000000007f68f4f0 000B0 (v01 030810 OEMOSFR  20100308 MSFT 00000097)
ACPI: SSDT 000000007f69a330 00363 (v01 DpgPmm    CpuPm 00000012 INTL 20060113)
ACPI: Local APIC address 0xfee00000
No NUMA configuration found
Faking a node at 0000000000000000-000000007f680000
NUMA: Using 63 for the hash shift.
Initmem setup node 0 0000000000000000-000000007f680000
  NODE_DATA [000000007f677000 - 000000007f67bfff]
 [ffffea0000000000-ffffea0001bfffff] PMD -> [ffff88007ce00000-ffff88007e9fffff] on node 0
Zone PFN ranges:
  DMA      0x00000010 -> 0x00001000
  DMA32    0x00001000 -> 0x00100000
  Normal   empty
Movable zone start PFN for each node
early_node_map[2] active PFN ranges
    0: 0x00000010 -> 0x0000009e
    0: 0x00000100 -> 0x0007f680
On node 0 totalpages: 521742
  DMA zone: 56 pages used for memmap
  DMA zone: 5 pages reserved
  DMA zone: 3921 pages, LIFO batch:0
  DMA32 zone: 7079 pages used for memmap
  DMA32 zone: 510681 pages, LIFO batch:31
ACPI: PM-Timer IO Port: 0x808
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
ACPI: LAPIC (acpi_id[0x05] lapic_id[0x01] enabled)
ACPI: LAPIC (acpi_id[0x06] lapic_id[0x03] enabled)
ACPI: LAPIC (acpi_id[0x07] lapic_id[0x05] enabled)
ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] enabled)
ACPI: LAPIC (acpi_id[0x09] lapic_id[0x88] disabled)
ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x89] disabled)
ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x8a] disabled)
ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x8b] disabled)
ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x8c] disabled)
ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x8d] disabled)
ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x8e] disabled)
ACPI: LAPIC (acpi_id[0x10] lapic_id[0x8f] disabled)
ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
ACPI: IOAPIC (id[0x09] address[0xfec8a000] gsi_base[24])
IOAPIC[1]: apic_id 9, version 32, address 0xfec8a000, GSI 24-47
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Using ACPI (MADT) for SMP configuration information
ACPI: HPET id: 0x8086a301 base: 0xfed00000
SMP: Allowing 16 CPUs, 8 hotplug CPUs
nr_irqs_gsi: 64
PM: Registered nosave memory: 000000000009e000 - 000000000009f000
PM: Registered nosave memory: 000000000009f000 - 00000000000a0000
PM: Registered nosave memory: 00000000000a0000 - 00000000000e5000
PM: Registered nosave memory: 00000000000e5000 - 0000000000100000
Allocating PCI resources starting at 80000000 (gap: 80000000:7ee00000)
setup_percpu: NR_CPUS:32 nr_cpumask_bits:32 nr_cpu_ids:16 nr_node_ids:1
PERCPU: Embedded 26 pages/cpu @ffff88007f400000 s73984 r8192 d24320 u131072
pcpu-alloc: s73984 r8192 d24320 u131072 alloc=1*2097152
pcpu-alloc: [0] 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 
Built 1 zonelists in Node order, mobility grouping on.  Total pages: 514602
Policy zone: DMA32
Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.39-gentoo-r1 root=/dev/sda1 ro rootfstype=ext4 log_buf_len=1M
log_buf_len: 1048576
PID hash table entries: 4096 (order: 3, 32768 bytes)
Checking aperture...
No AGP bridge found
Calgary: detecting Calgary via BIOS EBDA area
Calgary: Unable to locate Rio Grande table in EBDA - bailing!
Memory: 2049216k/2087424k available (3300k kernel code, 456k absent, 37752k reserved, 1930k data, 576k init)
Preemptable hierarchical RCU implementation.
	Verbose stalled-CPUs detection is disabled.
NR_IRQS:1280
Extended CMOS year: 2000
Console: colour VGA+ 80x25
console [tty0] enabled
hpet clockevent registered
Fast TSC calibration failed
TSC: PIT calibration matches HPET. 1 loops
Detected 2672.820 MHz processor.
Calibrating delay loop (skipped), value calculated using timer frequency.. 5345.64 BogoMIPS (lpj=2672820)
pid_max: default: 32768 minimum: 301
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 256
Initializing cgroup subsys ns
ns_cgroup deprecated: consider using the 'clone_children' flag without the ns_cgroup.
Initializing cgroup subsys cpuacct
Initializing cgroup subsys blkio
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 0
mce: CPU supports 9 MCE banks
CPU0: Thermal monitoring enabled (TM1)
using mwait in idle threads.
ACPI: Core revision 20110316
Setting APIC routing to physical flat
..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
CPU0: Intel(R) Core(TM) i7 CPU         920  @ 2.67GHz stepping 05
Performance Events: PEBS fmt1+, erratum AAJ80 worked around, Nehalem events, Intel PMU driver.
... version:                3
... bit width:              48
... generic registers:      4
... value mask:             0000ffffffffffff
... max period:             000000007fffffff
... fixed-purpose events:   3
... event mask:             000000070000000f
NMI watchdog enabled, takes one hw-pmu counter.
Booting Node   0, Processors  #1
smpboot cpu 1: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
 #2
smpboot cpu 2: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
 #3
smpboot cpu 3: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
 #4
smpboot cpu 4: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
 #5
smpboot cpu 5: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
 #6
smpboot cpu 6: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
 #7
smpboot cpu 7: start_ip = 99000
NMI watchdog enabled, takes one hw-pmu counter.
Brought up 8 CPUs
Total of 8 processors activated (42972.15 BogoMIPS).
PM: Registering ACPI NVS region at 7f698000 (278528 bytes)
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
PCI: not using MMCONFIG
PCI: Using configuration type 1 for base access
bio: create slab <bio-0> at 0
ACPI: EC: Look up EC in DSDT
ACPI: Executed 1 blocks of module-level executable AML code
ACPI: SSDT 000000007f6980c0 01C0C (v01 DpgPmm  P001Ist 00000011 INTL 20060113)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT           (null) 01C0C (v01 DpgPmm  P001Ist 00000011 INTL 20060113)
ACPI: SSDT 000000007f699cd0 00659 (v01  PmRef  P001Cst 00003001 INTL 20060113)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT           (null) 00659 (v01  PmRef  P001Cst 00003001 INTL 20060113)
ACPI: Interpreter enabled
ACPI: (supports S0 S1 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
pci_root PNP0A08:00: host bridge window [io  0x0000-0x0cf7]
pci_root PNP0A08:00: host bridge window [io  0x0d00-0xffff]
pci_root PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff]
pci_root PNP0A08:00: host bridge window [mem 0x000d0000-0x000dffff]
pci_root PNP0A08:00: host bridge window [mem 0x7ff00000-0xdfffffff]
pci_root PNP0A08:00: host bridge window [mem 0xf0000000-0xfed8ffff]
pci 0000:00:00.0: [8086:3405] type 0 class 0x000600
pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
pci 0000:00:00.0: PME# disabled
pci 0000:00:01.0: [8086:3408] type 1 class 0x000604
pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
pci 0000:00:01.0: PME# disabled
pci 0000:00:03.0: [8086:340a] type 1 class 0x000604
pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
pci 0000:00:03.0: PME# disabled
pci 0000:00:07.0: [8086:340e] type 1 class 0x000604
pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
pci 0000:00:07.0: PME# disabled
pci 0000:00:14.0: [8086:342e] type 0 class 0x000800
pci 0000:00:14.1: [8086:3422] type 0 class 0x000800
pci 0000:00:14.2: [8086:3423] type 0 class 0x000800
pci 0000:00:14.3: [8086:3438] type 0 class 0x000800
pci 0000:00:1a.0: [8086:3a37] type 0 class 0x000c03
pci 0000:00:1a.0: reg 20: [io  0xb800-0xb81f]
pci 0000:00:1a.1: [8086:3a38] type 0 class 0x000c03
pci 0000:00:1a.1: reg 20: [io  0xb880-0xb89f]
pci 0000:00:1a.2: [8086:3a39] type 0 class 0x000c03
pci 0000:00:1a.2: reg 20: [io  0xbc00-0xbc1f]
pci 0000:00:1a.7: [8086:3a3c] type 0 class 0x000c03
pci 0000:00:1a.7: reg 10: [mem 0xf7fff000-0xf7fff3ff]
pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1a.7: PME# disabled
pci 0000:00:1b.0: [8086:3a3e] type 0 class 0x000403
pci 0000:00:1b.0: reg 10: [mem 0xf7ff8000-0xf7ffbfff 64bit]
pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1b.0: PME# disabled
pci 0000:00:1c.0: [8086:3a40] type 1 class 0x000604
pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.0: PME# disabled
pci 0000:00:1c.2: [8086:3a44] type 1 class 0x000604
pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.2: PME# disabled
pci 0000:00:1c.4: [8086:3a48] type 1 class 0x000604
pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.4: PME# disabled
pci 0000:00:1d.0: [8086:3a34] type 0 class 0x000c03
pci 0000:00:1d.0: reg 20: [io  0xb080-0xb09f]
pci 0000:00:1d.1: [8086:3a35] type 0 class 0x000c03
pci 0000:00:1d.1: reg 20: [io  0xb400-0xb41f]
pci 0000:00:1d.2: [8086:3a36] type 0 class 0x000c03
pci 0000:00:1d.2: reg 20: [io  0xb480-0xb49f]
pci 0000:00:1d.7: [8086:3a3a] type 0 class 0x000c03
pci 0000:00:1d.7: reg 10: [mem 0xf7ffe000-0xf7ffe3ff]
pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1d.7: PME# disabled
pci 0000:00:1e.0: [8086:244e] type 1 class 0x000604
pci 0000:00:1f.0: [8086:3a16] type 0 class 0x000601
pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 0294 (mask 0003)
pci 0000:00:1f.0: ICH7 LPC Generic IO decode 3 PIO at 4700 (mask 001f)
pci 0000:00:1f.2: [8086:3a22] type 0 class 0x000106
pci 0000:00:1f.2: reg 10: [io  0xac00-0xac07]
pci 0000:00:1f.2: reg 14: [io  0xa880-0xa883]
pci 0000:00:1f.2: reg 18: [io  0xa800-0xa807]
pci 0000:00:1f.2: reg 1c: [io  0xa480-0xa483]
pci 0000:00:1f.2: reg 20: [io  0xa400-0xa41f]
pci 0000:00:1f.2: reg 24: [mem 0xf7ffc000-0xf7ffc7ff]
pci 0000:00:1f.2: PME# supported from D3hot
pci 0000:00:1f.2: PME# disabled
pci 0000:00:1f.3: [8086:3a30] type 0 class 0x000c05
pci 0000:00:1f.3: reg 10: [mem 0xf7ffd000-0xf7ffd0ff 64bit]
pci 0000:00:1f.3: reg 20: [io  0x0400-0x041f]
pci 0000:00:01.0: PCI bridge to [bus 01-01]
pci 0000:00:01.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:01.0:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:01.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
pci 0000:02:00.0: [10de:0641] type 0 class 0x000300
pci 0000:02:00.0: reg 10: [mem 0xfa000000-0xfaffffff]
pci 0000:02:00.0: reg 14: [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:02:00.0: reg 1c: [mem 0xf8000000-0xf9ffffff 64bit]
pci 0000:02:00.0: reg 24: [io  0xcc00-0xcc7f]
pci 0000:02:00.0: reg 30: [mem 0xfbc80000-0xfbcfffff pref]
pci 0000:00:03.0: PCI bridge to [bus 02-02]
pci 0000:00:03.0:   bridge window [io  0xc000-0xcfff]
pci 0000:00:03.0:   bridge window [mem 0xf8000000-0xfbcfffff]
pci 0000:00:03.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:00:07.0: PCI bridge to [bus 03-03]
pci 0000:00:07.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:07.0:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:07.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
pci 0000:00:1c.0: PCI bridge to [bus 06-06]
pci 0000:00:1c.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1c.0:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:1c.0:   bridge window [mem 0xf6f00000-0xf6ffffff 64bit pref]
pci 0000:05:00.0: [10ec:8168] type 0 class 0x000200
pci 0000:05:00.0: reg 10: [io  0xe800-0xe8ff]
pci 0000:05:00.0: reg 18: [mem 0xfbeff000-0xfbefffff 64bit]
pci 0000:05:00.0: reg 20: [mem 0xf6ef0000-0xf6efffff 64bit pref]
pci 0000:05:00.0: reg 30: [mem 0xfbec0000-0xfbedffff pref]
pci 0000:05:00.0: supports D1 D2
pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
pci 0000:05:00.0: PME# disabled
pci 0000:00:1c.2: PCI bridge to [bus 05-05]
pci 0000:00:1c.2:   bridge window [io  0xe000-0xefff]
pci 0000:00:1c.2:   bridge window [mem 0xfbe00000-0xfbefffff]
pci 0000:00:1c.2:   bridge window [mem 0xf6e00000-0xf6efffff 64bit pref]
pci 0000:04:00.0: [197b:2363] type 0 class 0x000101
pci 0000:04:00.0: reg 24: [mem 0xfbdfe000-0xfbdfffff]
pci 0000:04:00.0: reg 30: [mem 0xfbde0000-0xfbdeffff pref]
pci 0000:04:00.0: PME# supported from D3hot
pci 0000:04:00.0: PME# disabled
pci 0000:04:00.1: [197b:2363] type 0 class 0x000101
pci 0000:04:00.1: reg 10: [io  0xdc00-0xdc07]
pci 0000:04:00.1: reg 14: [io  0xd880-0xd883]
pci 0000:04:00.1: reg 18: [io  0xd800-0xd807]
pci 0000:04:00.1: reg 1c: [io  0xd480-0xd483]
pci 0000:04:00.1: reg 20: [io  0xd400-0xd40f]
pci 0000:04:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
pci 0000:00:1c.4: PCI bridge to [bus 04-04]
pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
pci 0000:00:1c.4:   bridge window [mem 0xfbd00000-0xfbdfffff]
pci 0000:00:1c.4:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
pci 0000:00:1e.0: PCI bridge to [bus 07-07] (subtractive decode)
pci 0000:00:1e.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1e.0:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:1e.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
pci 0000:00:1e.0:   bridge window [mem 0x000d0000-0x000dffff] (subtractive decode)
pci 0000:00:1e.0:   bridge window [mem 0x7ff00000-0xdfffffff] (subtractive decode)
pci 0000:00:1e.0:   bridge window [mem 0xf0000000-0xfed8ffff] (subtractive decode)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P4._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P6._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P8._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.NPE1._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.NPE3._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.NPE7._PRT]
 pci0000:00: Requesting ACPI _OSC control (0x1d)
Unable to assume _OSC PCIe control. Disabling ASPM
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 6 7 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs *5)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 6 7 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 6 7 10 11 12 *14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 6 7 10 11 12 14 *15)
ACPI: PCI Interrupt Link [LNKF] (IRQs *3 4 6 7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 6 *7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 *4 6 7 10 11 12 14 15)
vgaarb: device added: PCI:0000:02:00.0,decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
Expanded resource reserved due to conflict with PCI Bus 0000:00
reserve RAM buffer: 000000000009ec00 - 000000000009ffff 
reserve RAM buffer: 000000007f680000 - 000000007fffffff 
HPET: 4 timers in total, 0 timers will be used for per-cpu timer
Switching to clocksource hpet
Switched to NOHz mode on CPU #0
Switched to NOHz mode on CPU #5
Switched to NOHz mode on CPU #3
Switched to NOHz mode on CPU #4
Switched to NOHz mode on CPU #6
Switched to NOHz mode on CPU #2
Switched to NOHz mode on CPU #7
Switched to NOHz mode on CPU #1
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp 00:00: [bus 00-ff]
pnp 00:00: [io  0x0cf8-0x0cff]
pnp 00:00: [io  0x0000-0x0cf7 window]
pnp 00:00: [io  0x0d00-0xffff window]
pnp 00:00: [mem 0x000a0000-0x000bffff window]
pnp 00:00: [mem 0x000d0000-0x000dffff window]
pnp 00:00: [mem 0x7ff00000-0xdfffffff window]
pnp 00:00: [mem 0xf0000000-0xfed8ffff window]
pnp 00:00: Plug and Play ACPI device, IDs PNP0a08 PNP0a03 (active)
pnp 00:01: [mem 0xfbf00000-0xfbffffff]
pnp 00:01: [mem 0xfc000000-0xfcffffff]
pnp 00:01: [mem 0xfd000000-0xfdffffff]
pnp 00:01: [mem 0xfe000000-0xfebfffff]
pnp 00:01: [mem 0xfec8a000-0xfec8afff]
pnp 00:01: [mem 0xfed10000-0xfed10fff]
system 00:01: [mem 0xfbf00000-0xfbffffff] has been reserved
system 00:01: [mem 0xfc000000-0xfcffffff] has been reserved
system 00:01: [mem 0xfd000000-0xfdffffff] has been reserved
system 00:01: [mem 0xfe000000-0xfebfffff] has been reserved
system 00:01: [mem 0xfec8a000-0xfec8afff] could not be reserved
system 00:01: [mem 0xfed10000-0xfed10fff] has been reserved
system 00:01: Plug and Play ACPI device, IDs PNP0c01 (active)
pnp 00:02: [dma 4]
pnp 00:02: [io  0x0000-0x000f]
pnp 00:02: [io  0x0081-0x0083]
pnp 00:02: [io  0x0087]
pnp 00:02: [io  0x0089-0x008b]
pnp 00:02: [io  0x008f]
pnp 00:02: [io  0x00c0-0x00df]
pnp 00:02: Plug and Play ACPI device, IDs PNP0200 (active)
pnp 00:03: [io  0x0070-0x0071]
pnp 00:03: [irq 8]
pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
pnp 00:04: [io  0x0061]
pnp 00:04: Plug and Play ACPI device, IDs PNP0800 (active)
pnp 00:05: [io  0x00f0-0x00ff]
pnp 00:05: [irq 13]
pnp 00:05: Plug and Play ACPI device, IDs PNP0c04 (active)
pnp 00:06: [io  0x0000-0xffffffffffffffff disabled]
pnp 00:06: [io  0x0000-0xffffffffffffffff disabled]
pnp 00:06: [io  0x0290-0x029f]
system 00:06: [io  0x0290-0x029f] has been reserved
system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
pnp 00:07: [io  0x0010-0x001f]
pnp 00:07: [io  0x0022-0x003f]
pnp 00:07: [io  0x0044-0x004d]
pnp 00:07: [io  0x0050-0x005f]
pnp 00:07: [io  0x0062-0x0063]
pnp 00:07: [io  0x0065-0x006f]
pnp 00:07: [io  0x0072-0x007f]
pnp 00:07: [io  0x0080]
pnp 00:07: [io  0x0084-0x0086]
pnp 00:07: [io  0x0088]
pnp 00:07: [io  0x008c-0x008e]
pnp 00:07: [io  0x0090-0x009f]
pnp 00:07: [io  0x00a2-0x00bf]
pnp 00:07: [io  0x00e0-0x00ef]
pnp 00:07: [io  0x04d0-0x04d1]
pnp 00:07: [io  0x0800-0x087f]
pnp 00:07: [io  0x0400-0x03ff disabled]
pnp 00:07: [io  0x0500-0x057f]
pnp 00:07: [mem 0xfed1c000-0xfed1ffff]
pnp 00:07: [mem 0xfed20000-0xfed3ffff]
pnp 00:07: [mem 0xfed40000-0xfed8ffff]
system 00:07: [io  0x04d0-0x04d1] has been reserved
system 00:07: [io  0x0800-0x087f] has been reserved
system 00:07: [io  0x0500-0x057f] has been reserved
system 00:07: [mem 0xfed1c000-0xfed1ffff] has been reserved
system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
system 00:07: [mem 0xfed40000-0xfed8ffff] has been reserved
system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
pnp 00:08: [mem 0xfed00000-0xfed003ff]
pnp 00:08: Plug and Play ACPI device, IDs PNP0103 (active)
pnp 00:09: [mem 0xffa00000-0xffbfffff]
pnp 00:09: [mem 0xffe00000-0xffffffff]
pnp 00:09: Plug and Play ACPI device, IDs INT0800 (active)
pnp 00:0a: [mem 0xffc00000-0xffdfffff]
system 00:0a: [mem 0xffc00000-0xffdfffff] has been reserved
system 00:0a: Plug and Play ACPI device, IDs PNP0c02 (active)
pnp 00:0b: [io  0x0060]
pnp 00:0b: [io  0x0064]
pnp 00:0b: [mem 0xfec00000-0xfec00fff]
pnp 00:0b: [mem 0xfee00000-0xfee00fff]
system 00:0b: [mem 0xfec00000-0xfec00fff] could not be reserved
system 00:0b: [mem 0xfee00000-0xfee00fff] has been reserved
system 00:0b: Plug and Play ACPI device, IDs PNP0c02 (active)
pnp 00:0c: [mem 0xe0000000-0xefffffff]
system 00:0c: [mem 0xe0000000-0xefffffff] has been reserved
system 00:0c: Plug and Play ACPI device, IDs PNP0c02 (active)
pnp 00:0d: [mem 0x00000000-0x0009ffff]
pnp 00:0d: [mem 0x000c0000-0x000cffff]
pnp 00:0d: [mem 0x000e0000-0x000fffff]
pnp 00:0d: [mem 0x00100000-0x7fefffff]
pnp 00:0d: [mem 0xfed90000-0xffffffff]
system 00:0d: [mem 0x00000000-0x0009ffff] could not be reserved
system 00:0d: [mem 0x000c0000-0x000cffff] has been reserved
system 00:0d: [mem 0x000e0000-0x000fffff] could not be reserved
system 00:0d: [mem 0x00100000-0x7fefffff] could not be reserved
system 00:0d: [mem 0xfed90000-0xffffffff] could not be reserved
system 00:0d: Plug and Play ACPI device, IDs PNP0c01 (active)
pnp: PnP ACPI: found 14 devices
ACPI: ACPI bus type pnp unregistered
pci 0000:00:1c.4: BAR 9: assigned [mem 0x80000000-0x801fffff 64bit pref]
pci 0000:00:1c.0: BAR 8: assigned [mem 0x80200000-0x805fffff]
pci 0000:00:1c.0: BAR 7: assigned [io  0x1000-0x1fff]
pci 0000:00:01.0: PCI bridge to [bus 01-01]
pci 0000:00:01.0:   bridge window [io  disabled]
pci 0000:00:01.0:   bridge window [mem disabled]
pci 0000:00:01.0:   bridge window [mem pref disabled]
pci 0000:00:03.0: PCI bridge to [bus 02-02]
pci 0000:00:03.0:   bridge window [io  0xc000-0xcfff]
pci 0000:00:03.0:   bridge window [mem 0xf8000000-0xfbcfffff]
pci 0000:00:03.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:00:07.0: PCI bridge to [bus 03-03]
pci 0000:00:07.0:   bridge window [io  disabled]
pci 0000:00:07.0:   bridge window [mem disabled]
pci 0000:00:07.0:   bridge window [mem pref disabled]
pci 0000:00:1c.0: PCI bridge to [bus 06-06]
pci 0000:00:1c.0:   bridge window [io  0x1000-0x1fff]
pci 0000:00:1c.0:   bridge window [mem 0x80200000-0x805fffff]
pci 0000:00:1c.0:   bridge window [mem 0xf6f00000-0xf6ffffff 64bit pref]
pci 0000:00:1c.2: PCI bridge to [bus 05-05]
pci 0000:00:1c.2:   bridge window [io  0xe000-0xefff]
pci 0000:00:1c.2:   bridge window [mem 0xfbe00000-0xfbefffff]
pci 0000:00:1c.2:   bridge window [mem 0xf6e00000-0xf6efffff 64bit pref]
pci 0000:00:1c.4: PCI bridge to [bus 04-04]
pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
pci 0000:00:1c.4:   bridge window [mem 0xfbd00000-0xfbdfffff]
pci 0000:00:1c.4:   bridge window [mem 0x80000000-0x801fffff 64bit pref]
pci 0000:00:1e.0: PCI bridge to [bus 07-07]
pci 0000:00:1e.0:   bridge window [io  disabled]
pci 0000:00:1e.0:   bridge window [mem disabled]
pci 0000:00:1e.0:   bridge window [mem pref disabled]
pci 0000:00:01.0: setting latency timer to 64
pci 0000:00:03.0: setting latency timer to 64
pci 0000:00:07.0: setting latency timer to 64
pci 0000:00:1c.0: enabling device (0106 -> 0107)
pci 0000:00:1c.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.0: setting latency timer to 64
pci 0000:00:1c.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
pci 0000:00:1c.2: setting latency timer to 64
pci 0000:00:1c.4: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.4: setting latency timer to 64
pci 0000:00:1e.0: setting latency timer to 64
pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff]
pci_bus 0000:00: resource 8 [mem 0x7ff00000-0xdfffffff]
pci_bus 0000:00: resource 9 [mem 0xf0000000-0xfed8ffff]
pci_bus 0000:02: resource 0 [io  0xc000-0xcfff]
pci_bus 0000:02: resource 1 [mem 0xf8000000-0xfbcfffff]
pci_bus 0000:02: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
pci_bus 0000:06: resource 0 [io  0x1000-0x1fff]
pci_bus 0000:06: resource 1 [mem 0x80200000-0x805fffff]
pci_bus 0000:06: resource 2 [mem 0xf6f00000-0xf6ffffff 64bit pref]
pci_bus 0000:05: resource 0 [io  0xe000-0xefff]
pci_bus 0000:05: resource 1 [mem 0xfbe00000-0xfbefffff]
pci_bus 0000:05: resource 2 [mem 0xf6e00000-0xf6efffff 64bit pref]
pci_bus 0000:04: resource 0 [io  0xd000-0xdfff]
pci_bus 0000:04: resource 1 [mem 0xfbd00000-0xfbdfffff]
pci_bus 0000:04: resource 2 [mem 0x80000000-0x801fffff 64bit pref]
pci_bus 0000:07: resource 4 [io  0x0000-0x0cf7]
pci_bus 0000:07: resource 5 [io  0x0d00-0xffff]
pci_bus 0000:07: resource 6 [mem 0x000a0000-0x000bffff]
pci_bus 0000:07: resource 7 [mem 0x000d0000-0x000dffff]
pci_bus 0000:07: resource 8 [mem 0x7ff00000-0xdfffffff]
pci_bus 0000:07: resource 9 [mem 0xf0000000-0xfed8ffff]
NET: Registered protocol family 2
IP route cache hash table entries: 65536 (order: 7, 524288 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
UDP hash table entries: 1024 (order: 3, 32768 bytes)
UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
NET: Registered protocol family 1
pci 0000:02:00.0: Boot video device
PCI: CLS 256 bytes, default 64
audit: initializing netlink socket (disabled)
type=2000 audit(1307729773.687:1): initialized
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
msgmni has been set to 4002
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
pcieport 0000:00:1c.0: setting latency timer to 64
pcieport 0000:00:1c.0: irq 64 for MSI/MSI-X
pcieport 0000:00:1c.2: setting latency timer to 64
pcieport 0000:00:1c.2: irq 65 for MSI/MSI-X
pcieport 0000:00:1c.4: setting latency timer to 64
pcieport 0000:00:1c.4: irq 66 for MSI/MSI-X
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
brd: module loaded
loop: module loaded
ahci 0000:00:1f.2: version 3.0
ahci 0000:00:1f.2: PCI INT B -> GSI 20 (level, low) -> IRQ 20
ahci 0000:00:1f.2: irq 67 for MSI/MSI-X
ahci: SSS flag set, parallel bus scan disabled
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA mode
ahci 0000:00:1f.2: flags: 64bit ncq sntf stag pm led clo pmp pio slum part ccc ems sxs 
ahci 0000:00:1f.2: setting latency timer to 64
scsi0 : ahci
scsi1 : ahci
scsi2 : ahci
scsi3 : ahci
scsi4 : ahci
scsi5 : ahci
ata1: SATA max UDMA/133 abar m2048@0xf7ffc000 port 0xf7ffc100 irq 67
ata2: SATA max UDMA/133 abar m2048@0xf7ffc000 port 0xf7ffc180 irq 67
ata3: SATA max UDMA/133 abar m2048@0xf7ffc000 port 0xf7ffc200 irq 67
ata4: SATA max UDMA/133 abar m2048@0xf7ffc000 port 0xf7ffc280 irq 67
ata5: SATA max UDMA/133 abar m2048@0xf7ffc000 port 0xf7ffc300 irq 67
ata6: SATA max UDMA/133 abar m2048@0xf7ffc000 port 0xf7ffc380 irq 67
ahci 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
ahci 0000:04:00.0: AHCI 0001.0000 32 slots 2 ports 3 Gbps 0x3 impl SATA mode
ahci 0000:04:00.0: flags: 64bit ncq pm led clo pmp pio slum part 
ahci 0000:04:00.0: setting latency timer to 64
scsi6 : ahci
scsi7 : ahci
ata7: SATA max UDMA/133 abar m8192@0xfbdfe000 port 0xfbdfe100 irq 16
ata8: SATA max UDMA/133 abar m8192@0xfbdfe000 port 0xfbdfe180 irq 16
pata_jmicron 0000:04:00.1: enabling device (0000 -> 0001)
pata_jmicron 0000:04:00.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
pata_jmicron 0000:04:00.1: setting latency timer to 64
scsi8 : pata_jmicron
scsi9 : pata_jmicron
ata9: PATA max UDMA/100 cmd 0xdc00 ctl 0xd880 bmdma 0xd400 irq 17
ata10: PATA max UDMA/100 cmd 0xd800 ctl 0xd480 bmdma 0xd408 irq 17
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
i8042: PNP: No PS/2 controller found. Probing ports directly.
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mousedev: PS/2 mouse device common for all mice
i2c /dev entries driver
cpuidle: using governor ladder
cpuidle: using governor menu
TCP cubic registered
NET: Registered protocol family 17
Registering the dns_resolver key type
registered taskstats version 1
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
ata9.00: HPA detected: current 398294975, native 398297088
ata9.00: ATA-7: Maxtor 6B200P0, BAH41BM0, max UDMA/133
ata9.00: 398294975 sectors, multi 0: LBA48 
ata9.00: configured for UDMA/100
ata1: SATA link down (SStatus 0 SControl 300)
ata7: SATA link down (SStatus 0 SControl 300)
ata8: SATA link down (SStatus 0 SControl 300)
ata2: SATA link down (SStatus 0 SControl 300)
ata3: SATA link down (SStatus 0 SControl 300)
Refined TSC clocksource calibration: 2672.727 MHz.
Switching to clocksource tsc
ata4: SATA link down (SStatus 0 SControl 300)
ata5: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata5.00: HPA detected: current 321670847, native 321672960
ata5.00: ATA-7: HDT722516DLA380, V43OA96A, max UDMA/133
ata5.00: 321670847 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
ata5.00: configured for UDMA/133
scsi 4:0:0:0: Direct-Access     ATA      HDT722516DLA380  V43O PQ: 0 ANSI: 5
sd 4:0:0:0: [sda] 321670847 512-byte logical blocks: (164 GB/153 GiB)
sd 4:0:0:0: Attached scsi generic sg0 type 0
sd 4:0:0:0: [sda] Write Protect is off
sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sda: sda1 sda2
sd 4:0:0:0: [sda] Attached SCSI disk
ata6: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata6.00: ATA-7: ST3320620AS, 3.AAK, max UDMA/133
ata6.00: 625142448 sectors, multi 0: LBA48 NCQ (depth 31/32)
ata6.00: configured for UDMA/133
scsi 5:0:0:0: Direct-Access     ATA      ST3320620AS      3.AA PQ: 0 ANSI: 5
sd 5:0:0:0: [sdb] 625142448 512-byte logical blocks: (320 GB/298 GiB)
sd 5:0:0:0: Attached scsi generic sg1 type 0
sd 5:0:0:0: [sdb] Write Protect is off
sd 5:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 5:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
scsi 8:0:0:0: Direct-Access     ATA      Maxtor 6B200P0   BAH4 PQ: 0 ANSI: 5
sd 8:0:0:0: [sdc] 398294975 512-byte logical blocks: (203 GB/189 GiB)
sd 8:0:0:0: Attached scsi generic sg2 type 0
sd 8:0:0:0: [sdc] Write Protect is off
sd 8:0:0:0: [sdc] Mode Sense: 00 3a 00 00
sd 8:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sdc: sdc1
sd 8:0:0:0: [sdc] Attached SCSI disk
 sdb: sdb1 sdb2 sdb3
sd 5:0:0:0: [sdb] Attached SCSI disk
EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 8:1.
Freeing unused kernel memory: 576k freed
udevd[1833]: starting version 171
input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0
ACPI: Power Button [PWRB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
ACPI: Power Button [PWRF]
rtc_cmos 00:03: RTC can wake from S4
rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
i801_smbus 0000:00:1f.3: PCI INT C -> GSI 18 (level, low) -> IRQ 18
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci_hcd 0000:00:1a.7: PCI INT C -> GSI 18 (level, low) -> IRQ 18
ehci_hcd 0000:00:1a.7: setting latency timer to 64
ehci_hcd 0000:00:1a.7: EHCI Host Controller
ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:1a.7: debug port 1
ehci_hcd 0000:00:1a.7: cache line size of 256 is not supported
ehci_hcd 0000:00:1a.7: irq 18, io mem 0xf7fff000
ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
ehci_hcd 0000:00:1d.7: PCI INT A -> GSI 23 (level, low) -> IRQ 23
ehci_hcd 0000:00:1d.7: setting latency timer to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 2
r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
r8169 0000:05:00.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
r8169 0000:05:00.0: setting latency timer to 64
r8169 0000:05:00.0: irq 68 for MSI/MSI-X
r8169 0000:05:00.0: eth0: RTL8168c/8111c at 0xffffc90010a60000, e0:cb:4e:81:62:dd, XID 1c4000c0 IRQ 68
ehci_hcd 0000:00:1d.7: debug port 1
ehci_hcd 0000:00:1d.7: cache line size of 256 is not supported
ehci_hcd 0000:00:1d.7: irq 23, io mem 0xf7ffe000
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 6 ports detected
ACPI: acpi_idle registered with cpuidle
Monitor-Mwait will be used to enter C-1 state
Monitor-Mwait will be used to enter C-2 state
Monitor-Mwait will be used to enter C-3 state
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
uhci_hcd 0000:00:1a.0: setting latency timer to 64
uhci_hcd 0000:00:1a.0: UHCI Host Controller
uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1a.0: irq 16, io base 0x0000b800
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:1a.1: setting latency timer to 64
uhci_hcd 0000:00:1a.1: UHCI Host Controller
uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1a.1: irq 21, io base 0x0000b880
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
uhci_hcd 0000:00:1a.2: PCI INT D -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:1a.2: setting latency timer to 64
uhci_hcd 0000:00:1a.2: UHCI Host Controller
uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus number 5
uhci_hcd 0000:00:1a.2: irq 19, io base 0x0000bc00
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
uhci_hcd 0000:00:1d.0: setting latency timer to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 6
uhci_hcd 0000:00:1d.0: irq 23, io base 0x0000b080
hub 6-0:1.0: USB hub found
hub 6-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:1d.1: setting latency timer to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 7
uhci_hcd 0000:00:1d.1: irq 19, io base 0x0000b400
hub 7-0:1.0: USB hub found
hub 7-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1d.2: setting latency timer to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 8
uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000b480
hub 8-0:1.0: USB hub found
hub 8-0:1.0: 2 ports detected
[drm] Initialized drm 1.1.0 20060810
usb 5-1: new full speed USB device number 2 using uhci_hcd
HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
HDA Intel 0000:00:1b.0: irq 69 for MSI/MSI-X
HDA Intel 0000:00:1b.0: setting latency timer to 64
hub 5-1:1.0: USB hub found
hub 5-1:1.0: 3 ports detected
nouveau 0000:02:00.0: PCI INT A -> GSI 24 (level, low) -> IRQ 24
nouveau 0000:02:00.0: setting latency timer to 64
[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x096080c1)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
hda_codec: ALC1200: BIOS auto-probing.
usb 6-2: new full speed USB device number 2 using uhci_hcd
[drm] nouveau 0000:02:00.0: ... appears to be valid
[drm] nouveau 0000:02:00.0: BIT BIOS found
[drm] nouveau 0000:02:00.0: Bios version 62.94.4b.00
[drm] nouveau 0000:02:00.0: TMDS table version 2.0
[drm] nouveau 0000:02:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:02:00.0: Raw DCB entry 0: 02000300 00000028
[drm] nouveau 0000:02:00.0: Raw DCB entry 1: 01000302 00020030
[drm] nouveau 0000:02:00.0: Raw DCB entry 2: 04011310 00000028
[drm] nouveau 0000:02:00.0: Raw DCB entry 3: 02021342 00020030
[drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:02:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
[drm] nouveau 0000:02:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
[drm] nouveau 0000:02:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:02:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:02:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xD20A
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xD657
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xE6A7
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xE7F0
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xEA5C
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset 0xEAC1
[drm] nouveau 0000:02:00.0: 0xEAC1: Condition still not met after 20ms, skipping following opcodes
[drm] nouveau 0000:02:00.0: 1 available performance level(s)
[drm] nouveau 0000:02:00.0: 3: memory 333MHz core 550MHz shader 1375MHz fanspeed 100%
[drm] nouveau 0000:02:00.0: c: memory 399MHz core 400MHz shader 800MHz
[TTM] Zone  kernel: Available graphics memory: 1024896 kiB.
[TTM] Initializing pool allocator.
[drm] nouveau 0000:02:00.0: Detected 512MiB VRAM
[drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
hub 6-2:1.0: USB hub found
hub 6-2:1.0: 4 ports detected
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
usb 7-1: new full speed USB device number 2 using uhci_hcd
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

usb 5-1.1: new full speed USB device number 3 using uhci_hcd
lirc_dev: IR Remote Control driver registered, major 251 
IR LIRC bridge handler initialized
IR keymap rc-rc6-mce not found
Registered IR keymap rc-empty
input: Media Center Ed. eHome Infrared Remote Transceiver (0471:0815) as /devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1:1.0/rc/rc0/input2
rc0: Media Center Ed. eHome Infrared Remote Transceiver (0471:0815) as /devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1:1.0/rc/rc0
rc rc0: lirc_dev: driver ir-lirc-codec (mceusb) registered at minor = 0
mceusb 7-1:1.0: Registered Philips eHome Infrared Transceiver on usb7:2
usbcore: registered new interface driver mceusb
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

input: HID 0a5c:4502 as /devices/pci0000:00/0000:00:1a.2/usb5/5-1/5-1.1/5-1.1:1.0/input/input3
generic-usb 0003:0A5C:4502.0001: input,hidraw0: USB HID v1.11 Keyboard [HID 0a5c:4502] on usb-0000:00:1a.2-1.1/input0
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
usb 5-1.2: new full speed USB device number 4 using uhci_hcd
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

input: HID 0a5c:4503 as /devices/pci0000:00/0000:00:1a.2/usb5/5-1/5-1.2/5-1.2:1.0/input/input4
generic-usb 0003:0A5C:4503.0002: input,hidraw1: USB HID v1.11 Mouse [HID 0a5c:4503] on usb-0000:00:1a.2-1.2/input0
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm] nouveau 0000:02:00.0: allocated 1680x1050 fb: 0x40000000, bo ffff880078fc6800
fbcon: nouveaufb (fb0) is primary device
usb 5-1.3: new full speed USB device number 5 using uhci_hcd
Console: switching to colour frame buffer device 160x45
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:02:00.0 on minor 0
Bluetooth: Core ver 2.16
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
usb 6-2.1: new low speed USB device number 3 using uhci_hcd
Bluetooth: Generic Bluetooth USB driver ver 0.6
usbcore: registered new interface driver btusb
usb 5-1.1: input irq status -75 received
usb 5-1.1: input irq status -75 received
usb 5-1.1: input irq status -75 received
input: G15 Gaming Keyboard as /devices/pci0000:00/0000:00:1d.0/usb6/6-2/6-2.1/6-2.1:1.0/input/input5
generic-usb 0003:046D:C226.0003: input,hidraw2: USB HID v1.10 Keyboard [G15 Gaming Keyboard] on usb-0000:00:1d.0-2.1/input0
input: G15 Gaming Keyboard as /devices/pci0000:00/0000:00:1d.0/usb6/6-2/6-2.1/6-2.1:1.1/input/input6
generic-usb 0003:046D:C226.0004: input,hiddev0,hidraw3: USB HID v1.10 Device [G15 Gaming Keyboard] on usb-0000:00:1d.0-2.1/input1
usb 6-2.3: new low speed USB device number 4 using uhci_hcd
input: Microsoft Microsoft 5-Button Mouse with IntelliEye(TM) as /devices/pci0000:00/0000:00:1d.0/usb6/6-2/6-2.3/6-2.3:1.0/input/input7
generic-usb 0003:045E:0039.0005: input,hidraw4: USB HID v1.10 Mouse [Microsoft Microsoft 5-Button Mouse with IntelliEye(TM)] on usb-0000:00:1d.0-2.3/input0
usb 6-2.4: new full speed USB device number 5 using uhci_hcd
input: G15 GamePanel LCD as /devices/pci0000:00/0000:00:1d.0/usb6/6-2/6-2.4/6-2.4:1.0/input/input8
generic-usb 0003:046D:C227.0006: input,hiddev0,hidraw5: USB HID v1.11 Keypad [G15 GamePanel LCD] on usb-0000:00:1d.0-2.4/input0
EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sdc1): using internal journal
EXT3-fs (sdc1): mounted filesystem with writeback data mode
input: G15 Extra Keys as /devices/virtual/input/input9
Adding 971928k swap on /dev/sda2.  Priority:-1 extents:1 across:971928k 
r8169 0000:05:00.0: eth0: link down
r8169 0000:05:00.0: eth0: link down
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Registering the id_resolver key type
r8169 0000:05:00.0: eth0: link up
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11
coretemp coretemp.0: TjMax is 97 C.
coretemp coretemp.1: TjMax is 97 C.
coretemp coretemp.2: TjMax is 97 C.
coretemp coretemp.3: TjMax is 97 C.
w83627ehf: Found W83667HG chip at 0x290
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro,commit=0
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[drm:drm_edid_block_valid] *ERROR* Raw EDID:
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
<3>00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

nouveau 0000:02:00.0: DVI-I-2: Ignoring invalid EDID block 1.






--------------060305060604070301020202
Content-Type: text/plain;
 name="xrandr_log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="xrandr_log"

Screen 0: minimum 320 x 200, current 2960 x 1050, maximum 8192 x 8192
DVI-I-1 connected 1680x1050+0+0 (0x63) normal (normal left inverted right x axis y axis) 473mm x 296mm
	Identifier: 0x61
	Timestamp:  301673
	Subpixel:   unknown
	Gamma:      1.0:1.0:1.0
	Brightness: 1.0
	Clones:    
	CRTC:       0
	CRTCs:      0 1
	Transform:  1.000000 0.000000 0.000000
	            0.000000 1.000000 0.000000
	            0.000000 0.000000 1.000000
	           filter: 
	EDID:
		00ffffffffffff00047274ad70096064
		2e100103e82f1e782ec585a459499a24
		125054bfef0081808140714f9500950f
		b30081c08bc021399030621a274068b0
		3600d9281100001c000000fd00384c1e
		5210000a202020202020000000fc0041
		63657220414c32323136570a000000ff
		004c373430393034363338323020002f
	dithering:	Off
		supported: Off          On           Automatic   
	scaling mode:	Full
		supported: None         Full         Center       Full aspect 
	select subconnector:	Automatic
		supported: Automatic    DVI-D        DVI-A       
	subconnector:	DVI-D
		supported: Unknown      DVI-D        DVI-A       
  1680x1050 (0x63)  146.2MHz -HSync +VSync *current +preferred
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock   65.3KHz
        v: height 1050 start 1053 end 1059 total 1089           clock   60.0Hz
  1280x1024 (0x64)  135.0MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock   80.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   75.0Hz
  1280x1024 (0x65)  108.0MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz
  1440x900 (0x66)  136.8MHz -HSync +VSync
        h: width  1440 start 1536 end 1688 total 1936 skew    0 clock   70.6KHz
        v: height  900 start  903 end  909 total  942           clock   75.0Hz
  1440x900 (0x67)  106.5MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock   55.9KHz
        v: height  900 start  903 end  909 total  934           clock   59.9Hz
  1280x960 (0x68)  108.0MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock   60.0KHz
        v: height  960 start  961 end  964 total 1000           clock   60.0Hz
  1360x768 (0x69)   84.8MHz -HSync +VSync
        h: width  1366 start 1431 end 1567 total 1776 skew    0 clock   47.7KHz
        v: height  768 start  771 end  781 total  798           clock   59.8Hz
  1152x864 (0x6a)  108.0MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock   67.5KHz
        v: height  864 start  865 end  868 total  900           clock   75.0Hz
  1280x720 (0x6b)   74.4MHz -HSync +VSync
        h: width  1280 start 1336 end 1472 total 1664 skew    0 clock   44.7KHz
        v: height  720 start  721 end  724 total  746           clock   60.0Hz
  1024x768 (0x6c)   78.8MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock   60.1KHz
        v: height  768 start  769 end  772 total  800           clock   75.1Hz
  1024x768 (0x6d)   75.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock   56.5KHz
        v: height  768 start  771 end  777 total  806           clock   70.1Hz
  1024x768 (0x6e)   65.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  832x624 (0x6f)   57.3MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock   49.7KHz
        v: height  624 start  625 end  628 total  667           clock   74.6Hz
  800x600 (0x70)   50.0MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock   48.1KHz
        v: height  600 start  637 end  643 total  666           clock   72.2Hz
  800x600 (0x71)   49.5MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock   46.9KHz
        v: height  600 start  601 end  604 total  625           clock   75.0Hz
  800x600 (0x72)   40.0MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  800x600 (0x73)   36.0MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.2KHz
        v: height  600 start  601 end  603 total  625           clock   56.2Hz
  640x480 (0x74)   31.5MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock   37.9KHz
        v: height  480 start  489 end  491 total  520           clock   72.8Hz
  640x480 (0x75)   31.5MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock   37.5KHz
        v: height  480 start  481 end  484 total  500           clock   75.0Hz
  640x480 (0x76)   30.2MHz -HSync -VSync
        h: width   640 start  704 end  768 total  864 skew    0 clock   35.0KHz
        v: height  480 start  483 end  486 total  525           clock   66.7Hz
  640x480 (0x77)   25.2MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   60.0Hz
  720x400 (0x78)   28.3MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock   31.5KHz
        v: height  400 start  412 end  414 total  449           clock   70.1Hz
DVI-I-2 connected 1280x720+1680+0 (0x79) normal (normal left inverted right x axis y axis) 708mm x 398mm
	Identifier: 0x62
	Timestamp:  301673
	Subpixel:   unknown
	Gamma:      1.0:1.0:1.0
	Brightness: 1.0
	Clones:    
	CRTC:       1
	CRTCs:      0 1
	Transform:  1.000000 0.000000 0.000000
	            0.000000 1.000000 0.000000
	            0.000000 0.000000 1.000000
	           filter: 
	EDID:
		00ffffffffffff0008ab333261b90b03
		310f01030e4628782a3f44a654469924
		13484bbfee0001010101010101010101
		010101010101011d00bc52d01e20b828
		5540c48e2100001e000000fd00384c1f
		3d08000a202020202020000000ff0035
		32353030303030300a202020000000fc
		0042454b4f2d564a415a310a2020006d
	dithering:	Off
		supported: Off          On           Automatic   
	scaling mode:	Full
		supported: None         Full         Center       Full aspect 
	select subconnector:	Automatic
		supported: Automatic    DVI-D        DVI-A       
	subconnector:	DVI-A
		supported: Unknown      DVI-D        DVI-A       
  1280x720 (0x79)   74.2MHz +HSync +VSync *current +preferred
        h: width  1280 start 1720 end 1760 total 1980 skew    0 clock   37.5KHz
        v: height  720 start  725 end  730 total  750           clock   50.0Hz
  1024x768 (0x6c)   78.8MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock   60.1KHz
        v: height  768 start  769 end  772 total  800           clock   75.1Hz
  1024x768 (0x6d)   75.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock   56.5KHz
        v: height  768 start  771 end  777 total  806           clock   70.1Hz
  1024x768 (0x6e)   65.0MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  832x624 (0x6f)   57.3MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock   49.7KHz
        v: height  624 start  625 end  628 total  667           clock   74.6Hz
  800x600 (0x70)   50.0MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock   48.1KHz
        v: height  600 start  637 end  643 total  666           clock   72.2Hz
  800x600 (0x71)   49.5MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock   46.9KHz
        v: height  600 start  601 end  604 total  625           clock   75.0Hz
  800x600 (0x72)   40.0MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  800x600 (0x73)   36.0MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.2KHz
        v: height  600 start  601 end  603 total  625           clock   56.2Hz
  640x480 (0x74)   31.5MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock   37.9KHz
        v: height  480 start  489 end  491 total  520           clock   72.8Hz
  640x480 (0x75)   31.5MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock   37.5KHz
        v: height  480 start  481 end  484 total  500           clock   75.0Hz
  640x480 (0x76)   30.2MHz -HSync -VSync
        h: width   640 start  704 end  768 total  864 skew    0 clock   35.0KHz
        v: height  480 start  483 end  486 total  525           clock   66.7Hz
  640x480 (0x77)   25.2MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   60.0Hz
  720x400 (0x78)   28.3MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock   31.5KHz
        v: height  400 start  412 end  414 total  449           clock   70.1Hz






--------------060305060604070301020202
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------060305060604070301020202--
