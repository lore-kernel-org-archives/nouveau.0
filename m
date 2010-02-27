From: Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: GeForce 6150SE: DVI-connector not detected
Date: Sat, 27 Feb 2010 12:05:30 +0100
Message-ID: <4B88FC7A.6010403@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070909030201010104010100"
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

This is a multi-part message in MIME format.
--------------070909030201010104010100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

today I tested kernel 2.6.33 and it seems that nouveau doesn't detect
the DVI-connector of my GeForce 6150SE (Asus M2N-VM DH).
The screen turns black during boot-process immediately after the "[drm]
nouveau ..." messages appeared.

The board has two connectors (DVI + VGA) and I'm using the DVI-connector
only. Everything is fine when I use a VGA-cable instead.

See boot.msg in the attachment. Please tell me if you need further
informations. I can also test patches.

Regards,
Frank Schaefer



--------------070909030201010104010100
Content-Type: text/plain;
 name="boot.msg"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="boot.msg"

Inspecting /boot/System.map-2.6.33-0.1-pae
Cannot find map file.
No module symbols loaded - kernel modules not enabled.

Cannot build symbol table - disabling symbol lookups
klogd 1.4.1, log source = ksyslog started.
<6>Initializing cgroup subsys cpuset
<6>Initializing cgroup subsys cpu
<5>Linux version 2.6.33-0.1-pae (root@Athlon64X2-5000) (gcc version 4.3.2 [gcc-4_3-branch revision 141291] (SUSE Linux) ) #2 SMP Thu Feb 25 16:29:19 CET 2010
<6>BIOS-provided physical RAM map:
<6> BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
<6> BIOS-e820: 000000000009f000 - 00000000000a0000 (reserved)
<6> BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
<6> BIOS-e820: 0000000000100000 - 00000000afee0000 (usable)
<6> BIOS-e820: 00000000afee0000 - 00000000afee3000 (ACPI NVS)
<6> BIOS-e820: 00000000afee3000 - 00000000afef0000 (ACPI data)
<6> BIOS-e820: 00000000afef0000 - 00000000aff00000 (reserved)
<6> BIOS-e820: 00000000b0000000 - 00000000c0000000 (reserved)
<6> BIOS-e820: 00000000f0000000 - 00000000f4000000 (reserved)
<6> BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
<6> BIOS-e820: 0000000100000000 - 00000001a0000000 (usable)
<6>NX (Execute Disable) protection: active
<6>DMI 2.4 present.
<5>Phoenix BIOS detected: BIOS may corrupt low RAM, working around it.
<7>e820 update range: 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
<6>last_pfn = 0x1a0000 max_arch_pfn = 0x1000000
<7>MTRR default type: uncachable
<7>MTRR fixed ranges enabled:
<7>  00000-9FFFF write-back
<7>  A0000-BFFFF uncachable
<7>  C0000-C7FFF write-protect
<7>  C8000-FFFFF uncachable
<7>MTRR variable ranges enabled:
<7>  0 base 0000000000 mask FF80000000 write-back
<7>  1 base 0080000000 mask FFC0000000 write-back
<7>  2 base 0100000000 mask FF80000000 write-back
<7>  3 base 0180000000 mask FFE0000000 write-back
<7>  4 disabled
<7>  5 disabled
<7>  6 disabled
<7>  7 disabled
<7>TOM2: 00000001a0000000 aka 6656M
<6>x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
<7>e820 update range: 00000000c0000000 - 0000000100000000 (usable) ==> (reserved)
<6>Scanning 0 areas for low memory corruption
<6>modified physical RAM map:
<6> modified: 0000000000000000 - 0000000000010000 (reserved)
<6> modified: 0000000000010000 - 000000000009f000 (usable)
<6> modified: 000000000009f000 - 00000000000a0000 (reserved)
<6> modified: 00000000000f0000 - 0000000000100000 (reserved)
<6> modified: 0000000000100000 - 00000000afee0000 (usable)
<6> modified: 00000000afee0000 - 00000000afee3000 (ACPI NVS)
<6> modified: 00000000afee3000 - 00000000afef0000 (ACPI data)
<6> modified: 00000000afef0000 - 00000000aff00000 (reserved)
<6> modified: 00000000b0000000 - 00000000c0000000 (reserved)
<6> modified: 00000000f0000000 - 00000000f4000000 (reserved)
<6> modified: 00000000fec00000 - 0000000100000000 (reserved)
<6> modified: 0000000100000000 - 00000001a0000000 (usable)
<7>initial memory mapped : 0 - 00a00000
<6>found SMP MP-table at [c00f54d0] f54d0
<6>init_memory_mapping: 0000000000000000-00000000361fe000
<7> 0000000000 - 0000200000 page 4k
<7> 0000200000 - 0036000000 page 2M
<7> 0036000000 - 00361fe000 page 4k
<7>kernel direct mapping tables up to 361fe000 @ 15000-1b000
<6>RAMDISK: 37a58000 - 37feff56
<6>Allocated new RAMDISK: 005af000 - 00b46f56
<6>Move RAMDISK from 0000000037a58000 - 0000000037feff55 to 005af000 - 00b46f55
<4>ACPI: RSDP 000f7060 00024 (v02 Nvidia)
<4>ACPI: XSDT afee30c0 00044 (v01 Nvidia ASUSACPI 42302E31 AWRD 00000000)
<4>ACPI: FACP afeeb840 000F4 (v03 Nvidia ASUSACPI 42302E31 AWRD 00000000)
<4>ACPI: DSDT afee3240 0858F (v01 NVIDIA ASUSACPI 00001000 MSFT 03000000)
<4>ACPI: FACS afee0000 00040
<4>ACPI: SSDT afeeba40 0028A (v01 PTLTD  POWERNOW 00000001  LTP 00000001)
<4>ACPI: MCFG afeebd40 0003C (v01 Nvidia ASUSACPI 42302E31 AWRD 00000000)
<4>ACPI: APIC afeeb980 0007C (v01 Nvidia ASUSACPI 42302E31 AWRD 00000000)
<7>ACPI: Local APIC address 0xfee00000
<5>5790MB HIGHMEM available.
<5>865MB LOWMEM available.
<6>  mapped low ram: 0 - 361fe000
<6>  low ram: 0 - 361fe000
<6>  node 0 low ram: 00000000 - 361fe000
<6>  node 0 bootmap 00017000 - 0001dc40
<6>(14 early reservations) ==> bootmem [0000000000 - 00361fe000]
<6>  #0 [0000000000 - 0000001000]   BIOS data page ==> [0000000000 - 0000001000]
<6>  #1 [0000001000 - 0000002000]    EX TRAMPOLINE ==> [0000001000 - 0000002000]
<6>  #2 [0000100000 - 00005a8ab8]    TEXT DATA BSS ==> [0000100000 - 00005a8ab8]
<6>  #3 [00005a9000 - 00005ae14d]              BRK ==> [00005a9000 - 00005ae14d]
<6>  #4 [00000f54e0 - 0000100000]    BIOS reserved ==> [00000f54e0 - 0000100000]
<6>  #5 [00000f54d0 - 00000f54e0]     MP-table mpf ==> [00000f54d0 - 00000f54e0]
<6>  #6 [000009f000 - 00000f1400]    BIOS reserved ==> [000009f000 - 00000f1400]
<6>  #7 [00000f1544 - 00000f54d0]    BIOS reserved ==> [00000f1544 - 00000f54d0]
<6>  #8 [00000f1400 - 00000f1544]     MP-table mpc ==> [00000f1400 - 00000f1544]
<6>  #9 [0000010000 - 0000011000]       TRAMPOLINE ==> [0000010000 - 0000011000]
<6>  #10 [0000011000 - 0000015000]      ACPI WAKEUP ==> [0000011000 - 0000015000]
<6>  #11 [0000015000 - 0000017000]          PGTABLE ==> [0000015000 - 0000017000]
<6>  #12 [00005af000 - 0000b46f56]      NEW RAMDISK ==> [00005af000 - 0000b46f56]
<6>  #13 [0000017000 - 000001e000]          BOOTMAP ==> [0000017000 - 000001e000]
<4>Zone PFN ranges:
<4>  DMA      0x00000010 -> 0x00001000
<4>  Normal   0x00001000 -> 0x000361fe
<4>  HighMem  0x000361fe -> 0x001a0000
<4>Movable zone start PFN for each node
<4>early_node_map[3] active PFN ranges
<4>    0: 0x00000010 -> 0x0000009f
<4>    0: 0x00000100 -> 0x000afee0
<4>    0: 0x00100000 -> 0x001a0000
<7>On node 0 totalpages: 1375855
<7>free_area_init_node: node 0, pgdat c04cd2c0, node_mem_map c1001200
<7>  DMA zone: 32 pages used for memmap
<7>  DMA zone: 0 pages reserved
<7>  DMA zone: 3951 pages, LIFO batch:0
<7>  Normal zone: 1700 pages used for memmap
<7>  Normal zone: 215898 pages, LIFO batch:31
<7>  HighMem zone: 11581 pages used for memmap
<7>  HighMem zone: 1142693 pages, LIFO batch:31
<6>Using APIC driver default
<6>Nvidia board detected. Ignoring ACPI timer override.
<6>If you got timer trouble try acpi_use_timer_override
<6>ACPI: PM-Timer IO Port: 0x1008
<7>ACPI: Local APIC address 0xfee00000
<6>ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
<6>ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
<6>ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
<6>ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
<6>ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
<6>IOAPIC[0]: apic_id 2, version 17, address 0xfec00000, GSI 0-23
<6>ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
<4>ACPI: BIOS IRQ0 pin2 override ignored.
<6>ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
<6>ACPI: INT_SRC_OVR (bus 0 bus_irq 14 global_irq 14 high edge)
<6>ACPI: INT_SRC_OVR (bus 0 bus_irq 15 global_irq 15 high edge)
<7>ACPI: IRQ9 used by override.
<7>ACPI: IRQ14 used by override.
<7>ACPI: IRQ15 used by override.
<6>Using ACPI (MADT) for SMP configuration information
<6>SMP: Allowing 2 CPUs, 0 hotplug CPUs
<7>nr_irqs_gsi: 24
<6>PM: Registered nosave memory: 000000000009f000 - 00000000000a0000
<6>PM: Registered nosave memory: 00000000000a0000 - 00000000000f0000
<6>PM: Registered nosave memory: 00000000000f0000 - 0000000000100000
<6>Allocating PCI resources starting at c0000000 (gap: c0000000:30000000)
<6>setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_node_ids:1
<6>PERCPU: Embedded 12 pages/cpu @c4600000 s26968 r0 d22184 u1048576
<6>pcpu-alloc: s26968 r0 d22184 u1048576 alloc=1*2097152
<6>pcpu-alloc: [0] 0 1 
<4>Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1362542
<5>Kernel command line: root=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 resume=/dev/sda5 splash=silent vmalloc=144M hpet=force vga=0x31B
<6>PID hash table entries: 4096 (order: 2, 16384 bytes)
<6>Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
<6>Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
<6>Enabling fast FPU save and restore... done.
<6>Enabling unmasked SIMD FPU exception support... done.
<6>Initializing CPU#0
<6>allocated 34078400 bytes of page_cgroup
<6>please try 'cgroup_disable=memory' option if you don't want memory cgroups
<6>Initializing HighMem for node 0 (000361fe:001a0000)
<6>Memory: 5404368k/6815744k available (2399k kernel code, 98040k reserved, 1515k data, 444k init, 4617096k highmem)
<6>virtual kernel memory layout:
<6>    fixmap  : 0xfff1f000 - 0xfffff000   ( 896 kB)
<6>    pkmap   : 0xffa00000 - 0xffc00000   (2048 kB)
<6>    vmalloc : 0xf69fe000 - 0xff9fe000   ( 144 MB)
<6>    lowmem  : 0xc0000000 - 0xf61fe000   ( 865 MB)
<6>      .init : 0xc04d3000 - 0xc0542000   ( 444 kB)
<6>      .data : 0xc0357d4e - 0xc04d2968   (1515 kB)
<6>      .text : 0xc0100000 - 0xc0357d4e   (2399 kB)
<6>Checking if this processor honours the WP bit even in supervisor mode...Ok.
<6>Hierarchical RCU implementation.
<6>NR_IRQS:512
<6>Extended CMOS year: 2000
<7>spurious 8259A interrupt: IRQ7.
<4>Console: colour dummy device 80x25
<6>console [tty0] enabled
<4>Fast TSC calibration using PIT
<4>Detected 2612.304 MHz processor.
<6>Calibrating delay loop (skipped), value calculated using timer frequency.. 5224.60 BogoMIPS (lpj=10449216)
<6>Security Framework initialized
<6>SELinux:  Disabled at boot.
<4>Mount-cache hash table entries: 512
<6>Initializing cgroup subsys ns
<6>Initializing cgroup subsys cpuacct
<6>Initializing cgroup subsys memory
<6>Initializing cgroup subsys devices
<6>Initializing cgroup subsys freezer
<6>Initializing cgroup subsys blkio
<6>CPU: Physical Processor ID: 0
<6>CPU: Processor Core ID: 0
<6>mce: CPU supports 5 MCE banks
<6>using C1E aware idle routine
<6>Performance Events: AMD PMU driver.
<6>... version:                0
<6>... bit width:              48
<6>... generic registers:      4
<6>... value mask:             0000ffffffffffff
<6>... max period:             00007fffffffffff
<6>... fixed-purpose events:   0
<6>... event mask:             000000000000000f
<6>Checking 'hlt' instruction... OK.
<6>ACPI: Core revision 20091214
<6>Enabling APIC mode:  Flat.  Using 1 I/O APICs
<6>..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
<6>CPU0: AMD Athlon(tm) 64 X2 Dual Core Processor 5000+ stepping 01
<6>Booting Node   0, Processors  #1 Ok.
<6>Initializing CPU#1
<6>Brought up 2 CPUs
<6>Total of 2 processors activated (10448.63 BogoMIPS).
<6>System has AMD C1E enabled
<6>Switch to broadcast mode on CPU1
<6>Switch to broadcast mode on CPU0
<6>regulator: core version 0.5
<6>NET: Registered protocol family 16
<6>EISA bus registered
<6>ACPI: bus type pci registered
<6>PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf0000000-0xf3ffffff] (base 0xf0000000)
<6>PCI: MMCONFIG at [mem 0xf0000000-0xf3ffffff] reserved in E820
<6>PCI: Using MMCONFIG for extended config space
<6>PCI: Using configuration type 1 for base access
<4>bio: create slab <bio-0> at 0
<7>ACPI: EC: Look up EC in DSDT
<6>ACPI: Interpreter enabled
<6>ACPI: (supports S0 S1 S3 S4 S5)
<6>ACPI: Using IOAPIC for interrupt routing
<6>ACPI: No dock devices found.
<6>ACPI: PCI Root Bridge [PCI0] (0000:00)
<6>pci_root PNP0A08:00: ignoring host bridge windows from ACPI; boot with "pci=use_crs" to use them
<7>pci_root PNP0A08:00: host bridge window [io  0x0000-0x03af] (ignored)
<7>pci_root PNP0A08:00: host bridge window [io  0x03e0-0x0cf7] (ignored)
<7>pci_root PNP0A08:00: host bridge window [io  0x1c00-0x1c7f] (ignored)
<7>pci_root PNP0A08:00: host bridge window [io  0x7000-0xffff] (ignored)
<7>pci_root PNP0A08:00: host bridge window [io  0x03b0-0x03df] (ignored)
<7>pci_root PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff] (ignored)
<7>pci_root PNP0A08:00: host bridge window [mem 0xc0000000-0xefffffff] (ignored)
<7>pci_root PNP0A08:00: host bridge window [mem 0xf4000000-0xfe02ffff] (ignored)
<7>pci 0000:00:01.0: Force enabled HPET at 0xfed00000
<7>pci 0000:00:01.1: reg 10: [io  0xfc00-0xfc3f]
<7>pci 0000:00:01.1: reg 20: [io  0x1c00-0x1c3f]
<7>pci 0000:00:01.1: reg 24: [io  0x1c40-0x1c7f]
<7>pci 0000:00:01.1: PME# supported from D3hot D3cold
<7>pci 0000:00:01.1: PME# disabled
<7>pci 0000:00:02.0: reg 10: [mem 0xfe02f000-0xfe02ffff]
<7>pci 0000:00:02.0: supports D1 D2
<7>pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
<7>pci 0000:00:02.0: PME# disabled
<7>pci 0000:00:02.1: reg 10: [mem 0xfe02e000-0xfe02e0ff]
<7>pci 0000:00:02.1: supports D1 D2
<7>pci 0000:00:02.1: PME# supported from D0 D1 D2 D3hot D3cold
<7>pci 0000:00:02.1: PME# disabled
<7>pci 0000:00:05.0: reg 10: [mem 0xfe024000-0xfe027fff]
<7>pci 0000:00:05.0: PME# supported from D3hot D3cold
<7>pci 0000:00:05.0: PME# disabled
<7>pci 0000:00:06.0: reg 20: [io  0xf000-0xf00f]
<7>pci 0000:00:07.0: reg 10: [mem 0xfe02d000-0xfe02dfff]
<7>pci 0000:00:07.0: reg 14: [io  0xec00-0xec07]
<7>pci 0000:00:07.0: supports D1 D2
<7>pci 0000:00:07.0: PME# supported from D0 D1 D2 D3hot D3cold
<7>pci 0000:00:07.0: PME# disabled
<7>pci 0000:00:08.0: reg 10: [io  0x09f0-0x09f7]
<7>pci 0000:00:08.0: reg 14: [io  0x0bf0-0x0bf3]
<7>pci 0000:00:08.0: reg 18: [io  0x0970-0x0977]
<7>pci 0000:00:08.0: reg 1c: [io  0x0b70-0x0b73]
<7>pci 0000:00:08.0: reg 20: [io  0xd800-0xd80f]
<7>pci 0000:00:08.0: reg 24: [mem 0xfe02c000-0xfe02cfff]
<7>pci 0000:00:08.1: reg 10: [io  0x09e0-0x09e7]
<7>pci 0000:00:08.1: reg 14: [io  0x0be0-0x0be3]
<7>pci 0000:00:08.1: reg 18: [io  0x0960-0x0967]
<7>pci 0000:00:08.1: reg 1c: [io  0x0b60-0x0b63]
<7>pci 0000:00:08.1: reg 20: [io  0xc400-0xc40f]
<7>pci 0000:00:08.1: reg 24: [mem 0xfe02b000-0xfe02bfff]
<7>pci 0000:00:09.0: PME# supported from D0 D1 D2 D3hot D3cold
<7>pci 0000:00:09.0: PME# disabled
<7>pci 0000:00:0b.0: PME# supported from D0 D1 D2 D3hot D3cold
<7>pci 0000:00:0b.0: PME# disabled
<7>pci 0000:00:0c.0: PME# supported from D0 D1 D2 D3hot D3cold
<7>pci 0000:00:0c.0: PME# disabled
<7>pci 0000:00:0d.0: reg 10: [mem 0xfb000000-0xfbffffff]
<7>pci 0000:00:0d.0: reg 14: [mem 0xe0000000-0xefffffff 64bit pref]
<7>pci 0000:00:0d.0: reg 1c: [mem 0xfc000000-0xfcffffff 64bit]
<7>pci 0000:00:0d.0: reg 30: [mem 0x00000000-0x0001ffff pref]
<7>pci 0000:01:06.0: reg 10: [mem 0xfd8ff000-0xfd8ff7ff]
<7>pci 0000:01:06.0: reg 14: [mem 0xfd8f8000-0xfd8fbfff]
<7>pci 0000:01:06.0: supports D1 D2
<7>pci 0000:01:06.0: PME# supported from D0 D1 D2 D3hot
<7>pci 0000:01:06.0: PME# disabled
<7>pci 0000:01:07.0: reg 10: [io  0xbc00-0xbc07]
<7>pci 0000:01:07.0: reg 14: [mem 0xfd8fe000-0xfd8fe0ff]
<7>pci 0000:01:07.0: supports D1 D2
<7>pci 0000:01:07.0: PME# supported from D0 D1 D2 D3hot
<7>pci 0000:01:07.0: PME# disabled
<7>pci 0000:01:08.0: reg 10: [mem 0xfdfff000-0xfdffffff pref]
<7>pci 0000:01:08.1: reg 10: [mem 0xfdffe000-0xfdffefff pref]
<6>pci 0000:00:04.0: PCI bridge to [bus 01-01] (subtractive decode)
<7>pci 0000:00:04.0:   bridge window [io  0xb000-0xbfff]
<7>pci 0000:00:04.0:   bridge window [mem 0xfd800000-0xfd8fffff]
<7>pci 0000:00:04.0:   bridge window [mem 0xfdf00000-0xfdffffff pref]
<6>pci 0000:00:09.0: PCI bridge to [bus 02-02]
<7>pci 0000:00:09.0:   bridge window [io  0xa000-0xafff]
<7>pci 0000:00:09.0:   bridge window [mem 0xfde00000-0xfdefffff]
<7>pci 0000:00:09.0:   bridge window [mem 0xfdd00000-0xfddfffff 64bit pref]
<7>pci 0000:03:00.0: reg 24: [mem 0xfdcfe000-0xfdcfffff]
<7>pci 0000:03:00.0: reg 30: [mem 0xfdce0000-0xfdceffff pref]
<7>pci 0000:03:00.0: PME# supported from D3hot
<7>pci 0000:03:00.0: PME# disabled
<7>pci 0000:03:00.1: reg 10: [io  0x9c00-0x9c07]
<7>pci 0000:03:00.1: reg 14: [io  0x9800-0x9803]
<7>pci 0000:03:00.1: reg 18: [io  0x9400-0x9407]
<7>pci 0000:03:00.1: reg 1c: [io  0x9000-0x9003]
<7>pci 0000:03:00.1: reg 20: [io  0x8c00-0x8c0f]
<6>pci 0000:03:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
<6>pci 0000:00:0b.0: PCI bridge to [bus 03-03]
<7>pci 0000:00:0b.0:   bridge window [io  0x8000-0x9fff]
<7>pci 0000:00:0b.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
<7>pci 0000:00:0b.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
<6>pci 0000:00:0c.0: PCI bridge to [bus 04-04]
<7>pci 0000:00:0c.0:   bridge window [io  0x7000-0x7fff]
<7>pci 0000:00:0c.0:   bridge window [mem 0xfda00000-0xfdafffff]
<7>pci 0000:00:0c.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
<7>pci_bus 0000:00: on NUMA node 0
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.HUB0._PRT]
<6>ACPI: PCI Interrupt Link [LNK1] (IRQs 5 7 9 *10 11 14 15)
<6>ACPI: PCI Interrupt Link [LNK2] (IRQs 5 7 9 10 *11 14 15)
<6>ACPI: PCI Interrupt Link [LNK3] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LNK4] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LNK5] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LNK6] (IRQs *5 7 9 10 11 14 15)
<6>ACPI: PCI Interrupt Link [LNK7] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LNK8] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LIGP] (IRQs 5 7 9 *10 11 14 15)
<6>ACPI: PCI Interrupt Link [LP2P] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LUBA] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LMAC] (IRQs 5 7 9 10 *11 14 15)
<6>ACPI: PCI Interrupt Link [LAZA] (IRQs *5 7 9 10 11 14 15)
<6>ACPI: PCI Interrupt Link [LPMU] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LSMB] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LUB2] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LIDE] (IRQs 5 7 9 10 11 14 15) *0, disabled.
<6>ACPI: PCI Interrupt Link [LSID] (IRQs 5 7 9 *10 11 14 15)
<6>ACPI: PCI Interrupt Link [LFID] (IRQs 5 7 9 10 *11 14 15)
<6>ACPI: PCI Interrupt Link [APC1] (IRQs 16) *0
<6>ACPI: PCI Interrupt Link [APC2] (IRQs 17) *0
<6>ACPI: PCI Interrupt Link [APC3] (IRQs 18) *0, disabled.
<6>ACPI: PCI Interrupt Link [APC4] (IRQs 19) *0, disabled.
<6>ACPI: PCI Interrupt Link [APC5] (IRQs 16) *0, disabled.
<6>ACPI: PCI Interrupt Link [APC6] (IRQs 16) *0
<6>ACPI: PCI Interrupt Link [APC7] (IRQs 16) *0, disabled.
<6>ACPI: PCI Interrupt Link [APC8] (IRQs 16) *0, disabled.
<6>ACPI: PCI Interrupt Link [AIGP] (IRQs 22 23) *0
<6>ACPI: PCI Interrupt Link [APCF] (IRQs 22 23) *0, disabled.
<6>ACPI: PCI Interrupt Link [APCH] (IRQs 22 23) *0
<6>ACPI: PCI Interrupt Link [APMU] (IRQs 22 23) *0, disabled.
<6>ACPI: PCI Interrupt Link [AAZA] (IRQs 22 23) *0
<6>ACPI: PCI Interrupt Link [APCS] (IRQs 22 23) *0, disabled.
<6>ACPI: PCI Interrupt Link [APCL] (IRQs 22 23) *0, disabled.
<6>ACPI: PCI Interrupt Link [APCM] (IRQs 22 23) *0, disabled.
<6>ACPI: PCI Interrupt Link [APCZ] (IRQs 22 23) *0, disabled.
<6>ACPI: PCI Interrupt Link [APSI] (IRQs 20) *0
<6>ACPI: PCI Interrupt Link [APSJ] (IRQs 21) *0
<6>vgaarb: device added: PCI:0000:00:0d.0,decodes=io+mem,owns=io+mem,locks=none
<6>vgaarb: loaded
<6>PCI: Using ACPI for IRQ routing
<7>PCI: pci_cache_line_size set to 64 bytes
<6>NetLabel: Initializing
<6>NetLabel:  domain hash size = 128
<6>NetLabel:  protocols = UNLABELED CIPSOv4
<6>NetLabel:  unlabeled traffic allowed by default
<7>hpet clockevent registered
<6>HPET: 3 timers in total, 0 timers will be used for per-cpu timer
<6>hpet0: at MMIO 0xfed00000, IRQs 2, 8, 31
<6>hpet0: 3 comparators, 32-bit 25.000000 MHz counter
<6>Switching to clocksource hpet
<6>pnp: PnP ACPI init
<6>ACPI: bus type pnp registered
<6>pnp: PnP ACPI: found 14 devices
<6>ACPI: ACPI bus type pnp unregistered
<6>PnPBIOS: Disabled by ACPI PNP
<6>system 00:01: [io  0x1000-0x107f] has been reserved
<6>system 00:01: [io  0x1080-0x10ff] has been reserved
<6>system 00:01: [io  0x1400-0x147f] has been reserved
<6>system 00:01: [io  0x1480-0x14ff] has been reserved
<6>system 00:01: [io  0x1800-0x187f] has been reserved
<6>system 00:01: [io  0x1880-0x18ff] has been reserved
<6>system 00:02: [io  0x0b78-0x0b7b] has been reserved
<6>system 00:02: [io  0x0f78-0x0f7b] has been reserved
<6>system 00:02: [io  0x0a78-0x0a7b] has been reserved
<6>system 00:02: [io  0x0e78-0x0e7b] has been reserved
<6>system 00:02: [io  0x0bbc-0x0bbf] has been reserved
<6>system 00:02: [io  0x0fbc-0x0fbf] has been reserved
<6>system 00:02: [io  0x04d0-0x04d1] has been reserved
<6>system 00:02: [io  0x0294-0x0297] has been reserved
<6>system 00:02: [io  0x0800-0x087f] has been reserved
<6>system 00:02: [io  0x0290-0x0297] could not be reserved
<6>system 00:0c: [mem 0xf0000000-0xf3ffffff] has been reserved
<6>system 00:0d: [mem 0x000d2800-0x000d3fff] has been reserved
<6>system 00:0d: [mem 0x000f0000-0x000f7fff] could not be reserved
<6>system 00:0d: [mem 0x000f8000-0x000fbfff] could not be reserved
<6>system 00:0d: [mem 0x000fc000-0x000fffff] could not be reserved
<6>system 00:0d: [mem 0xafee0000-0xafefffff] could not be reserved
<6>system 00:0d: [mem 0xffff0000-0xffffffff] has been reserved
<6>system 00:0d: [mem 0x00000000-0x0009ffff] could not be reserved
<6>system 00:0d: [mem 0x00100000-0xafedffff] could not be reserved
<6>system 00:0d: [mem 0xafff0000-0xbffeffff] could not be reserved
<6>system 00:0d: [mem 0xfec00000-0xfec00fff] could not be reserved
<6>system 00:0d: [mem 0xfee00000-0xfeefffff] has been reserved
<6>system 00:0d: [mem 0xfefff000-0xfeffffff] has been reserved
<6>system 00:0d: [mem 0xfff80000-0xfff80fff] has been reserved
<6>system 00:0d: [mem 0xfff90000-0xfffbffff] has been reserved
<6>system 00:0d: [mem 0xfffed000-0xfffeffff] has been reserved
<6>pci 0000:00:0d.0: BAR 6: assigned [mem 0xc0000000-0xc001ffff pref]
<6>pci 0000:00:04.0: PCI bridge to [bus 01-01]
<6>pci 0000:00:04.0:   bridge window [io  0xb000-0xbfff]
<6>pci 0000:00:04.0:   bridge window [mem 0xfd800000-0xfd8fffff]
<6>pci 0000:00:04.0:   bridge window [mem 0xfdf00000-0xfdffffff pref]
<6>pci 0000:00:09.0: PCI bridge to [bus 02-02]
<6>pci 0000:00:09.0:   bridge window [io  0xa000-0xafff]
<6>pci 0000:00:09.0:   bridge window [mem 0xfde00000-0xfdefffff]
<6>pci 0000:00:09.0:   bridge window [mem 0xfdd00000-0xfddfffff 64bit pref]
<6>pci 0000:00:0b.0: PCI bridge to [bus 03-03]
<6>pci 0000:00:0b.0:   bridge window [io  0x8000-0x9fff]
<6>pci 0000:00:0b.0:   bridge window [mem 0xfdc00000-0xfdcfffff]
<6>pci 0000:00:0b.0:   bridge window [mem 0xfdb00000-0xfdbfffff 64bit pref]
<6>pci 0000:00:0c.0: PCI bridge to [bus 04-04]
<6>pci 0000:00:0c.0:   bridge window [io  0x7000-0x7fff]
<6>pci 0000:00:0c.0:   bridge window [mem 0xfda00000-0xfdafffff]
<6>pci 0000:00:0c.0:   bridge window [mem 0xfd900000-0xfd9fffff 64bit pref]
<7>pci 0000:00:04.0: setting latency timer to 64
<7>pci 0000:00:09.0: setting latency timer to 64
<7>pci 0000:00:0b.0: setting latency timer to 64
<7>pci 0000:00:0c.0: setting latency timer to 64
<7>pci_bus 0000:00: resource 0 [io  0x0000-0xffff]
<7>pci_bus 0000:00: resource 1 [mem 0x00000000-0xffffffffffffffff]
<7>pci_bus 0000:01: resource 0 [io  0xb000-0xbfff]
<7>pci_bus 0000:01: resource 1 [mem 0xfd800000-0xfd8fffff]
<7>pci_bus 0000:01: resource 2 [mem 0xfdf00000-0xfdffffff pref]
<7>pci_bus 0000:01: resource 3 [io  0x0000-0xffff]
<7>pci_bus 0000:01: resource 4 [mem 0x00000000-0xffffffffffffffff]
<7>pci_bus 0000:02: resource 0 [io  0xa000-0xafff]
<7>pci_bus 0000:02: resource 1 [mem 0xfde00000-0xfdefffff]
<7>pci_bus 0000:02: resource 2 [mem 0xfdd00000-0xfddfffff 64bit pref]
<7>pci_bus 0000:03: resource 0 [io  0x8000-0x9fff]
<7>pci_bus 0000:03: resource 1 [mem 0xfdc00000-0xfdcfffff]
<7>pci_bus 0000:03: resource 2 [mem 0xfdb00000-0xfdbfffff 64bit pref]
<7>pci_bus 0000:04: resource 0 [io  0x7000-0x7fff]
<7>pci_bus 0000:04: resource 1 [mem 0xfda00000-0xfdafffff]
<7>pci_bus 0000:04: resource 2 [mem 0xfd900000-0xfd9fffff 64bit pref]
<6>NET: Registered protocol family 2
<6>IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
<6>TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
<6>TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
<6>TCP: Hash tables configured (established 131072 bind 65536)
<6>TCP reno registered
<6>UDP hash table entries: 512 (order: 2, 16384 bytes)
<6>UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
<6>NET: Registered protocol family 1
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<6>pci 0000:00:00.0: Found enabled HT MSI Mapping
<7>pci 0000:00:0d.0: Boot video device
<7>PCI: CLS 32 bytes, default 64
<6>Unpacking initramfs...
<6>Freeing initrd memory: 5727k freed
<6>Scanning for low memory corruption every 60 seconds
<6>audit: initializing netlink socket (disabled)
<5>type=2000 audit(1267270471.417:1): initialized
<4>highmem bounce pool size: 64 pages
<6>HugeTLB registered 2 MB page size, pre-allocated 0 pages
<5>VFS: Disk quotas dquot_6.5.2
<4>Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
<6>msgmni has been set to 1550
<6>alg: No test for stdrng (krng)
<6>Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
<6>io scheduler noop registered
<6>io scheduler deadline registered
<6>io scheduler cfq registered (default)
<7>pcieport 0000:00:09.0: setting latency timer to 64
<7>pcieport 0000:00:09.0: irq 24 for MSI/MSI-X
<7>pcieport 0000:00:0b.0: setting latency timer to 64
<7>pcieport 0000:00:0b.0: irq 25 for MSI/MSI-X
<7>pcieport 0000:00:0c.0: setting latency timer to 64
<7>pcieport 0000:00:0c.0: irq 26 for MSI/MSI-X
<6>vesafb: framebuffer at 0xe0000000, mapped to 0xf6a80000, using 10240k, total 262144k
<6>vesafb: mode is 1280x1024x32, linelength=5120, pages=0
<6>vesafb: protected mode interface info at c000:d030
<6>vesafb: pmi: set display start = c00cd066, set palette = c00cd0d0
<6>vesafb: pmi: ports = 3b4 3b5 3ba 3c0 3c1 3c4 3c5 3c6 3c7 3c8 3c9 3cc 3ce 3cf 3d0 3d1 3d2 3d3 3d4 3d5 3da 
<6>vesafb: scrolling: redraw
<6>vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
<4>Console: switching to colour frame buffer device 160x64
<6>fb0: VESA VGA frame buffer device
<6>isapnp: Scanning for PnP cards...
<6>isapnp: No Plug & Play device found
<6>Serial: 8250/16550 driver, 8 ports, IRQ sharing enabled
<6>serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
<6>00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
<6>PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
<6>serio: i8042 KBD port at 0x60,0x64 irq 1
<6>serio: i8042 AUX port at 0x60,0x64 irq 12
<6>mice: PS/2 mouse device common for all mice
<6>EISA: Probing bus 0 at eisa.0
<4>Cannot allocate resource for EISA slot 1
<4>Cannot allocate resource for EISA slot 7
<4>Cannot allocate resource for EISA slot 8
<6>EISA: Detected 0 cards.
<6>cpuidle: using governor ladder
<6>cpuidle: using governor menu
<6>TCP cubic registered
<6>Using IPI No-Shortcut mode
<6>input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
<4>logips2pp: Detected unknown logitech mouse model 102
<6>input: ImExPS/2 Logitech Explorer Mouse as /devices/platform/i8042/serio1/input/input1
<4>registered taskstats version 1
<6>Freeing unused kernel memory: 444k freed
<6>Write protecting the kernel text: 2400k
<6>Write protecting the kernel read-only data: 1244k
<5>SCSI subsystem initialized
<7>libata version 3.00 loaded.
<7>sata_nv 0000:00:08.0: version 3.5
<4>ACPI: PCI Interrupt Link [APSI] enabled at IRQ 20
<6>sata_nv 0000:00:08.0: PCI INT A -> Link[APSI] -> GSI 20 (level, low) -> IRQ 20
<7>sata_nv 0000:00:08.0: setting latency timer to 64
<6>scsi0 : sata_nv
<6>scsi1 : sata_nv
<6>ata1: SATA max UDMA/133 cmd 0x9f0 ctl 0xbf0 bmdma 0xd800 irq 20
<6>ata2: SATA max UDMA/133 cmd 0x970 ctl 0xb70 bmdma 0xd808 irq 20
<4>ACPI: PCI Interrupt Link [APSJ] enabled at IRQ 21
<6>sata_nv 0000:00:08.1: PCI INT B -> Link[APSJ] -> GSI 21 (level, low) -> IRQ 21
<7>sata_nv 0000:00:08.1: setting latency timer to 64
<6>scsi2 : sata_nv
<6>scsi3 : sata_nv
<6>ata3: SATA max UDMA/133 cmd 0x9e0 ctl 0xbe0 bmdma 0xc400 irq 21
<6>ata4: SATA max UDMA/133 cmd 0x960 ctl 0xb60 bmdma 0xc408 irq 21
<6>ata1: SATA link down (SStatus 0 SControl 300)
<6>ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
<6>ata3.00: ATAPI: HL-DT-ST DVDRAM GSA-H66N, CB00, max UDMA/100
<6>ata3.00: configured for UDMA/100
<6>ata2: SATA link down (SStatus 0 SControl 300)
<5>scsi 2:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-H66N  CB00 PQ: 0 ANSI: 5
<6>ata4: SATA link down (SStatus 0 SControl 300)
<7>pata_amd 0000:00:06.0: version 0.4.1
<7>pata_amd 0000:00:06.0: setting latency timer to 64
<6>scsi4 : pata_amd
<6>scsi5 : pata_amd
<6>ata5: PATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xf000 irq 14
<6>ata6: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0xf008 irq 15
<7>ata6: port disabled. ignoring.
<7>ahci 0000:03:00.0: version 3.0
<4>ACPI: PCI Interrupt Link [APC6] enabled at IRQ 16
<6>ahci 0000:03:00.0: PCI INT A -> Link[APC6] -> GSI 16 (level, low) -> IRQ 16
<6>ahci 0000:03:00.0: AHCI 0001.0000 32 slots 2 ports 3 Gbps 0x3 impl SATA mode
<6>ahci 0000:03:00.0: flags: 64bit ncq pm led clo pmp pio slum part 
<7>ahci 0000:03:00.0: setting latency timer to 64
<6>scsi6 : ahci
<6>scsi7 : ahci
<6>ata7: SATA max UDMA/133 abar m8192@0xfdcfe000 port 0xfdcfe100 irq 16
<6>ata8: SATA max UDMA/133 abar m8192@0xfdcfe000 port 0xfdcfe180 irq 16
<6>ata7: SATA link down (SStatus 0 SControl 300)
<6>ata8: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
<6>ata8.00: ATA-8: WDC WD6401AALS-00L3B2, 01.03B01, max UDMA/133
<6>ata8.00: 1250263728 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
<6>ata8.00: configured for UDMA/133
<5>scsi 7:0:0:0: Direct-Access     ATA      WDC WD6401AALS-0 01.0 PQ: 0 ANSI: 5
<6>pata_jmicron 0000:03:00.1: enabling device (0000 -> 0001)
<4>ACPI: PCI Interrupt Link [APC7] enabled at IRQ 16
<6>pata_jmicron 0000:03:00.1: PCI INT B -> Link[APC7] -> GSI 16 (level, low) -> IRQ 16
<7>pata_jmicron 0000:03:00.1: setting latency timer to 64
<6>scsi8 : pata_jmicron
<6>scsi9 : pata_jmicron
<6>ata9: PATA max UDMA/100 cmd 0x9c00 ctl 0x9800 bmdma 0x8c00 irq 16
<6>ata10: PATA max UDMA/100 cmd 0x9400 ctl 0x9000 bmdma 0x8c08 irq 16
<6>Uniform Multi-Platform E-IDE driver
<5>ACPI: processor limited to max C-state 1
<6>thermal LNXTHERM:01: registered as thermal_zone0
<6>ACPI: Thermal Zone [THRM] (37 C)
<6>ACPI: Fan [FAN] (on)
<6>BIOS EDD facility v0.16 2004-Jun-25, 1 devices found
<6>udevd version 128 started
<6>usbcore: registered new interface driver usbfs
<6>usbcore: registered new interface driver hub
<6>usbcore: registered new device driver usb
<6>ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
<5>sd 7:0:0:0: [sda] 1250263728 512-byte logical blocks: (640 GB/596 GiB)
<5>sd 7:0:0:0: [sda] Write Protect is off
<7>sd 7:0:0:0: [sda] Mode Sense: 00 3a 00 00
<4>ACPI: PCI Interrupt Link [APCL] enabled at IRQ 23
<5>sd 7:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
<6> sda: sda1 sda2 sda3 < sda5
<6>ehci_hcd 0000:00:02.1: PCI INT B -> Link[APCL] -> GSI 23 (level, low) -> IRQ 23
<4> sda6
<7>ehci_hcd 0000:00:02.1: setting latency timer to 64
<4> sda7 >
<6>ehci_hcd 0000:00:02.1: EHCI Host Controller
<5>sd 7:0:0:0: [sda] Attached SCSI disk
<6>ehci_hcd 0000:00:02.1: new USB bus registered, assigned bus number 1
<6>ehci_hcd 0000:00:02.1: debug port 1
<7>ehci_hcd 0000:00:02.1: cache line size of 32 is not supported
<6>ehci_hcd 0000:00:02.1: irq 23, io mem 0xfe02e000
<6>ehci_hcd 0000:00:02.1: USB 2.0 started, EHCI 1.00
<6>usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
<6>usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
<6>usb usb1: Product: EHCI Host Controller
<6>usb usb1: Manufacturer: Linux 2.6.33-0.1-pae ehci_hcd
<6>usb usb1: SerialNumber: 0000:00:02.1
<6>hub 1-0:1.0: USB hub found
<6>hub 1-0:1.0: 10 ports detected
<6>ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
<4>ACPI: PCI Interrupt Link [APCF] enabled at IRQ 22
<6>ohci_hcd 0000:00:02.0: PCI INT A -> Link[APCF] -> GSI 22 (level, low) -> IRQ 22
<7>ohci_hcd 0000:00:02.0: setting latency timer to 64
<6>ohci_hcd 0000:00:02.0: OHCI Host Controller
<6>ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 2
<6>ohci_hcd 0000:00:02.0: irq 22, io mem 0xfe02f000
<6>usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
<6>usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
<6>usb usb2: Product: OHCI Host Controller
<6>usb usb2: Manufacturer: Linux 2.6.33-0.1-pae ohci_hcd
<6>usb usb2: SerialNumber: 0000:00:02.0
<6>hub 2-0:1.0: USB hub found
<6>hub 2-0:1.0: 10 ports detected
<6>PM: Starting manual resume from disk
<6>usb 1-5: new high speed USB device using ehci_hcd and address 3
<6>usb 1-5: New USB device found, idVendor=0bda, idProduct=8187
<6>usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
<6>usb 1-5: Product: RTL8187_Wireless
<6>usb 1-5: Manufacturer: Manufacturer_Realtek_RTL8187_
<6>usb 1-5: SerialNumber: 0015AF08A9E5
<6>usb 1-10: new high speed USB device using ehci_hcd and address 4
<6>kjournald starting.  Commit interval 5 seconds
<6>EXT3-fs (sda6): using internal journal
<6>EXT3-fs (sda6): mounted filesystem with writeback data mode
<6>usb 1-10: New USB device found, idVendor=0bda, idProduct=0151
<6>usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
<6>usb 1-10: Product: USB2.0-CRW
<6>usb 1-10: Manufacturer: Generic
<6>usb 1-10: SerialNumber: 20060413092100000
<6>usb 2-1: new full speed USB device using ohci_hcd and address 2
<6>usb 2-1: New USB device found, idVendor=03f0, idProduct=3104
<6>usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
<6>usb 2-1: Product: DeskJet 960C
<6>usb 2-1: Manufacturer: Hewlett-Packard
<6>usb 2-1: SerialNumber: HU1BU1S14HRO
<6>udevd version 128 started
<6>Floppy drive(s): fd0 is 1.44M
<5>scsi 2:0:0:0: Attached scsi generic sg0 type 5
<5>sd 7:0:0:0: Attached scsi generic sg1 type 0
<6>FDC 0 is a post-1991 82077
<6>forcedeth: Reverse Engineered nForce ethernet driver. Version 0.64.
<6>input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2
<6>ACPI: Power Button [PWRB]
<6>input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
<6>ACPI: Power Button [PWRF]
<6>Initializing USB Mass Storage driver...
<6>input: PC Speaker as /devices/platform/pcspkr/input/input4
<4>sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
<6>Uniform CD-ROM driver Revision: 3.20
<7>sr 2:0:0:0: Attached scsi CD-ROM sr0
<6>usblp0: USB Bidirectional printer dev 2 if 0 alt 0 proto 2 vid 0x03F0 pid 0x3104
<6>usbcore: registered new interface driver usblp
<6>scsi10 : usb-storage 1-10:1.0
<6>usbcore: registered new interface driver usb-storage
<6>Linux agpgart interface v0.103
<6>USB Mass Storage support registered.
<6>cfg80211: Calling CRDA to update world regulatory domain
<6>parport_pc 00:09: reported by Plug and Play ACPI
<6>parport0: PC-style at 0x378 (0x778), irq 7, dma 3 [PCSPP,TRISTATE,COMPAT,ECP,DMA]
<4>ACPI: PCI Interrupt Link [APCH] enabled at IRQ 23
<6>forcedeth 0000:00:07.0: PCI INT A -> Link[APCH] -> GSI 23 (level, low) -> IRQ 23
<7>forcedeth 0000:00:07.0: setting latency timer to 64
<6>[drm] Initialized drm 1.1.0 20060810
<4>ACPI: PCI Interrupt Link [APC1] enabled at IRQ 16
<6>ohci1394 0000:01:06.0: PCI INT A -> Link[APC1] -> GSI 16 (level, low) -> IRQ 16
<6>Linux video capture interface: v2.00
<6>ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[16]  MMIO=[fd8ff000-fd8ff7ff]  Max Packet=[2048]  IR/IT contexts=[4/8]
<6>ppdev: user-space parallel port driver
<6>rtc_cmos 00:04: RTC can wake from S4
<6>rtc_cmos 00:04: rtc core: registered rtc_cmos as rtc0
<6>rtc0: alarms up to one year, y3k, 242 bytes nvram, hpet irqs
<6>bttv: driver version 0.9.18 loaded
<6>bttv: using 8 buffers with 2080k (520 pages) each for capture
<6>bttv: Bt8xx card found (0).
<4>ACPI: PCI Interrupt Link [APC3] enabled at IRQ 18
<6>bttv 0000:01:08.0: PCI INT A -> Link[APC3] -> GSI 18 (level, low) -> IRQ 18
<6>bttv0: Bt878 (rev 17) at 0000:01:08.0, irq: 18, latency: 32, mmio: 0xfdfff000
<6>bttv0: detected: Hauppauge WinTV [card=10], PCI subsystem ID is 0070:13eb
<6>bttv0: using: Hauppauge (bt878) [card=10,autodetected]
<4>IRQ 18/bttv0: IRQF_DISABLED is not guaranteed on shared IRQs
<7>bttv0: gpio: en=00000000, out=00000000 in=00ffffdb [init]
<6>bttv0: Hauppauge/Voodoo msp34xx: reset line init [5]
<6>bt878 #0 [sw]: Test OK
<6>tveeprom 0-0050: Hauppauge model 37284, rev B421, serial# 5111944
<6>tveeprom 0-0050: tuner model is Philips FM1216 (idx 21, type 5)
<6>tveeprom 0-0050: TV standards PAL(B/G) (eeprom 0x04)
<6>tveeprom 0-0050: audio processor is MSP3410D (idx 5)
<6>tveeprom 0-0050: has radio
<4>bttv0: Hauppauge eeprom indicates model#37284
<6>bttv0: tuner type=5
<6>forcedeth 0000:00:07.0: ifname eth0, PHY OUI 0x50ef @ 1, addr 00:18:f3:a7:44:77
<6>forcedeth 0000:00:07.0: highdma pwrctl mgmt gbit lnktim msi desc-v3
<4>k8temp 0000:00:18.3: Temperature readouts might be wrong - check erratum #141
<3>ACPI: I/O resource nForce2_smbus [0x1c00-0x1c3f] conflicts with ACPI region SM00 [0x1c00-0x1c05]
<6>ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
<3>nForce2_smbus 0000:00:01.1: Error probing SMB1.
<6>i2c i2c-1: nForce2 SMBus adapter at 0x1c40
<4>ACPI: PCI Interrupt Link [AAZA] enabled at IRQ 22
<6>HDA Intel 0000:00:05.0: PCI INT B -> Link[AAZA] -> GSI 22 (level, low) -> IRQ 22
<7>HDA Intel 0000:00:05.0: irq 27 for MSI/MSI-X
<7>HDA Intel 0000:00:05.0: setting latency timer to 64
<6>msp3400 0-0040: MSP3410D-C5 found @ 0x80 (bt878 #0 [sw])
<6>msp3400 0-0040: msp3400 supports nicam, mode is autodetect
<7>phy0: Selected rate control algorithm 'minstrel'
<6>phy0: hwaddr 00:15:af:08:a9:e5, RTL8187vB (default) V1 + rtl8225z2, rfkill mask 2
<6>tuner 0-0042: chip found @ 0x84 (bt878 #0 [sw])
<6>rtl8187: Customer ID is 0x00
<6>Registered led device: rtl8187-phy0::radio
<6>Registered led device: rtl8187-phy0::tx
<6>Registered led device: rtl8187-phy0::rx
<6>rtl8187: wireless switch is on
<6>usbcore: registered new interface driver rtl8187
<6>tda9887 0-0042: creating new instance
<6>tda9887 0-0042: tda988[5/6/7] found
<6>tuner 0-0061: chip found @ 0xc2 (bt878 #0 [sw])
<6>tuner-simple 0-0061: creating new instance
<6>tuner-simple 0-0061: type set to 5 (Philips PAL_BG (FI1216 and compatibles))
<6>bttv0: registered device video0
<6>bttv0: registered device vbi0
<6>bttv0: registered device radio0
<6>bttv0: PLL: 28636363 => 35468950 .. ok
<7>ieee1394: Host added: ID:BUS[0-00:1023]  GUID[0011d80000f3d0c3]
<6>hda_codec: AD1988: BIOS auto-probing.
<6>input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:05.0/input/input5
<4>ACPI: PCI Interrupt Link [AIGP] enabled at IRQ 23
<6>nouveau 0000:00:0d.0: PCI INT A -> Link[AIGP] -> GSI 23 (level, low) -> IRQ 23
<7>nouveau 0000:00:0d.0: setting latency timer to 64
<6>[drm] nouveau 0000:00:0d.0: Detected an NV40 generation card (0x04c000a2)
<6>[drm] nouveau 0000:00:0d.0: Attempting to load BIOS image from PROM
<5>[drm] nouveau 0000:00:0d.0: ... BIOS signature not found
<6>[drm] nouveau 0000:00:0d.0: Attempting to load BIOS image from PRAMIN
<6>[drm] nouveau 0000:00:0d.0: ... appears to be valid
<6>[drm] nouveau 0000:00:0d.0: BIT BIOS found
<6>[drm] nouveau 0000:00:0d.0: Bios version 05.61.32.14
<4>[drm] nouveau 0000:00:0d.0: TMDS table script pointers not stubbed
<6>[drm] nouveau 0000:00:0d.0: BIT table 'd' not found
<6>[drm] nouveau 0000:00:0d.0: Found Display Configuration Block version 3.0
<6>[drm] nouveau 0000:00:0d.0: DCB connector table: VHER 0x30 5 10 2
<6>[drm] nouveau 0000:00:0d.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
<5>[drm] nouveau 0000:00:0d.0: Raw DCB entry 0: 01000310 00000023
<5>[drm] nouveau 0000:00:0d.0: Raw DCB entry 1: 00110204 974f0000
<6>[drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 0 at offset 0xDA6D
<3>[drm] nouveau 0000:00:0d.0: ======= misaligned reg 0x0060081D =======
<3>[drm] nouveau 0000:00:0d.0: ======= misaligned reg 0x0060081D =======
<6>[drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 1 at offset 0xDBC4
<6>[drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 2 at offset 0xDBC5
<6>[drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 3 at offset 0xDD47
<6>[drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 4 at offset 0xDD90
<6>[TTM] Zone  kernel: Available graphics memory: 397228 kiB.
<6>[TTM] Zone highmem: Available graphics memory: 2705776 kiB.
<6>[drm] nouveau 0000:00:0d.0: 256 MiB VRAM
<6>[drm] nouveau 0000:00:0d.0: 64 MiB GART (aperture)
<6>[drm] nouveau 0000:00:0d.0: Allocating FIFO number 0
<6>[drm] nouveau 0000:00:0d.0: nouveau_channel_alloc: initialised FIFO 0
<6>[drm] nouveau 0000:00:0d.0: Initial CRTC_OWNER is 0
<4>[drm] nouveau 0000:00:0d.0: DCB type 4 not known
<6>[drm] nouveau 0000:00:0d.0: Detected a VGA connector
<6>[drm] nouveau 0000:00:0d.0: Setting dpms mode 3 on vga encoder (output 0)
<6>nouveau-0000:00:0d.0-1: Test OK
<6>No connectors reported connected with modes
<6>[drm] Initialized nouveau 0.0.15 20090420 for 0000:00:0d.0 on minor 0
<6>Adding 5245148k swap on /dev/sda5.  Priority:-1 extents:1 across:5245148k 
<6>device-mapper: uevent: version 1.0.3
<6>device-mapper: ioctl: 4.16.0-ioctl (2009-11-05) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
<6>loop: module loaded
<6>kjournald starting.  Commit interval 5 seconds
<6>EXT3-fs (sda7): using internal journal
<6>EXT3-fs (sda7): mounted filesystem with writeback data mode
<6>fuse init (API version 7.13)
<5>scsi 10:0:0:0: Direct-Access     Generic- Compact Flash    1.00 PQ: 0 ANSI: 0 CCS
<5>scsi 10:0:0:1: Direct-Access     Generic- SM/xD-Picture    1.00 PQ: 0 ANSI: 0 CCS
<5>scsi 10:0:0:2: Direct-Access     Generic- SD/MMC           1.00 PQ: 0 ANSI: 0 CCS
<5>scsi 10:0:0:3: Direct-Access     Generic- MS/MS-Pro        1.00 PQ: 0 ANSI: 0 CCS
<5>sd 10:0:0:0: Attached scsi generic sg2 type 0
<5>sd 10:0:0:1: Attached scsi generic sg3 type 0
<5>sd 10:0:0:2: Attached scsi generic sg4 type 0
<5>sd 10:0:0:3: Attached scsi generic sg5 type 0
<5>sd 10:0:0:0: [sdb] Attached SCSI removable disk
<5>sd 10:0:0:2: [sdd] Attached SCSI removable disk
<5>sd 10:0:0:1: [sdc] Attached SCSI removable disk
<5>sd 10:0:0:3: [sde] Attached SCSI removable disk
Kernel logging (ksyslog) stopped.
Kernel log daemon terminating.

Boot logging started on /dev/tty1(/dev/console) at Sat Feb 27 11:34:35 2010

Trying manual resume from /dev/sda5
Invoking userspace resume from /dev/sda5
resume: libgcrypt version: 1.4.1
Trying manual resume from /dev/sda5
Invoking in-kernel resume from /dev/sda5
Waiting for device /dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 to appear:  ok
showconsole: Warning: the ioctl TIOCGDEV is not known by the kernel
fsck 1.41.1 (01-Sep-2008)
[/sbin/fsck.ext3 (1) -- /] fsck.ext3 -a -C0 /dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 
/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6: clean, 891368/6553600 files, 11213743/26214055 blocks
fsck succeeded. Mounting root device read-write.
Mounting root /dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6
mount -o rw,acl,user_xattr -t ext3 /dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 /root

Boot logging started on /dev/tty1(/dev/console) at Sat Feb 27 11:34:45 2010

Master Resource Control: previous runlevel: N, switching to runlevel: 5
<notice>startproc: execve (/sbin/acpid) [ /sbin/acpid ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/sbin/acpid ]
acpid: starting up


acpid: 2 rules loaded


Starting acpid done
Initializing random number generatordone
<notice>startproc: execve (/sbin/syslog-ng) [ /sbin/syslog-ng ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin DO_CONFIRM= vga=0x31B RUNLEVEL=5 SPLASHCFG= PWD=/ PREVLEVEL=N LINES=64 SHLVL=2 HOME=/ SPLASH=no splash=silent ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/sbin/syslog-ng ]
<notice>startproc: execve (/sbin/klogd) [ /sbin/klogd -c 1 -x ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin DO_CONFIRM= vga=0x31B RUNLEVEL=5 SPLASHCFG= PWD=/ PREVLEVEL=N LINES=64 SHLVL=2 HOME=/ SPLASH=no splash=silent ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/sbin/klogd ]
Starting syslog servicesdone
Starting D-Bus daemondone
Setting up ISDN card contr0 Asus PCI (CCD HFC)done
Loading Driver contr0 hisaxdone
Starting Firewall Initialization (phase 1 of 2) done
Setting up (localfs) network interfaces:
    lo        
    lo        IP address: 127.0.0.1/8   
              IP address: 127.0.0.2/8   
    lo       
done    eth0      device: nVidia Corporation MCP61 Ethernet (rev a2)
              No configuration found for eth0
    eth0     
unusedSetting up service (localfs) network  .  .  .  .  .  .  .  .  .  .done
Loading CPUFreq modulesdone
Starting HAL daemondone
Starting service kdm<notice>startproc: execve (/usr/bin/kdm) [ /usr/bin/kdm ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.86 KDEROOTHOME=/root/.kdm REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin DO_CONFIRM= vga=0x31B RUNLEVEL=5 SPLASHCFG= PWD=/ LANG=de_DE.UTF-8 PREVLEVEL=N LINES=64 QT_SYSTEM_DIR=/usr/share/desktop-data SHLVL=2 HOME=/ XCURSOR_THEME=DMZ WINDOWMANAGER=/usr/bin/startkde SPLASH=no splash=silent ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/bin/kdm ]
done
Starting rpcbind <notice>startproc: execve (/sbin/rpcbind) [ /sbin/rpcbind ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/sbin/rpcbind ]
done
Not starting NFS client services - no NFS found in /etc/fstab:unused
Mount CIFS File Systems unused
Loading console font lat9w-16.psfu  -m trivial G0:loadable
doneLoading keymap assuming iso-8859-15 euro
Loading /usr/share/kbd/keymaps/i386/qwertz/de-latin1-nodeadkeys.map.gz
doneLoading compose table latin1.adddone
Start Unicode mode
done<notice>checkproc: /usr/bin/kdm 2943
Starting auditd <notice>startproc: execve (/sbin/auditd) [ /sbin/auditd -s disable ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/sbin/auditd ]
done
Starting Avahi daemon done
Starting cupsd<notice>startproc: execve (/usr/sbin/cupsd) [ /usr/sbin/cupsd ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/sbin/cupsd ]
done
<notice>startproc: execve (/usr/sbin/nscd) [ /usr/sbin/nscd ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/sbin/nscd ]
<notice>startproc: execve (/usr/bin/ksysguardd) [ /usr/bin/ksysguardd -d ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/bin/ksysguardd ]
Starting java.binfmt_misc done
Starting Name Service Cache Daemondone
Starting KDE ksysguard daemon (ksysguardd)done
<notice>startproc: execve (/usr/sbin/smpppd) [ /usr/sbin/smpppd ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/sbin/smpppd ]
ksysguardd 4
(c) 1999, 2000, 2001, 2002 Chris Schlaeger <cs-RoXCvvDuEio@public.gmane.org>
(c) 2001 Tobias Koenig <tokoe-RoXCvvDuEio@public.gmane.org>
(c) 2006-2008 Greg Martyn <greg.martyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
This program is part of the KDE Project and licensed under
the GNU GPL version 2. See http://www.kde.org for details.
Starting SMPPPDdone
Starting smartd done
<notice>startproc: execve (/usr/sbin/hddtemp) [ /usr/sbin/hddtemp -d -f /etc/hddtemp.db -p 7634 /dev/sda ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/sbin/hddtemp ]
Starting hddtemp daemon for /dev/sdadone
<notice>startproc: execve (/usr/sbin/sshd) [ /usr/sbin/sshd -o PidFile=/var/run/sshd.init.pid ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/sbin/sshd ]
Setting up (remotefs) network interfaces:
    wlan0     
              No configuration found for wlan0
    wlan0    
unused    ippp0     
    ippp0     Startmode is 'manual'
    ippp0    
skippedSetting up service (remotefs) network  .  .  .  .  .  .  .  .  .  .done
Starting SSH daemondone
Starting mail service (Postfix)done
<notice>startproc: execve (/usr/sbin/cron) [ /usr/sbin/cron ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=ext3 SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 LC_ALL=POSIX INIT_VERSION=sysvinit-2.86 REDIRECT=/dev/tty1 COLUMNS=160 PATH=/bin:/sbin:/usr/bin:/usr/sbin vga=0x31B DO_CONFIRM= RUNLEVEL=5 PWD=/ SPLASHCFG= PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/disk/by-id/ata-WDC_WD6401AALS-00L3B2_WD-WMASY7431406-part6 _=/sbin/startproc DAEMON=/usr/sbin/cron ]
Starting CRON daemondone
done
Starting Firewall Initialization (phase 2 of 2) done
Master Resource Control: runlevel 5 has been reached
Skipped services in runlevel 5: nfs smbfs splash
<notice>killproc: kill(2221,3)

Boot logging started on /dev/tty1(/dev/console) at Sat Feb 27 11:36:06 2010

Master Resource Control: previous runlevel: 5, switching to runlevel: 0
Shutting down the Firewall skipped
<notice><notice>killproc: kill(3146,15)
<notice>killproc: kill(3673,15)
killproc: kill(3259,15)
<notice>killproc: kill(3412,15)
<notice>killproc: kill(3478,15)
Shutting down CRON daemondone
Shutting down cupsddone
Shutting down KDE ksysguard daemon (ksysguardd)done
Shutting down hddtemp daemon for /dev/sdadone
<notice>killproc: kill(2943,15)
Shutting down smartd done
Shutting down java.binfmt_misc done
<notice>killproc: kill(3647,15)
Shutting down service kdmdone
<notice>killproc: kill(3619,15)
<notice>killproc: kill(3111,15)
Shutting down mail service (Postfix)done
Shutting down Avahi daemon done
Shutting down SSH daemondone
/etc/init.d/kbd stopdone
<notice>killproc: kill(2273,15)
Shutting down auditd done
<notice>killproc: kill(3221,15)
Saving random seeddone
done
Shutting down service kdmdone
Shutting down acpid done
Shutting down Name Service Cache Daemondone
Shutting down SMPPPDdone
Shutting down (remotefs) network interfaces:
    wlan0     
              No configuration found for wlan0 
              Nevertheless the interface will be shut down.
    wlan0    
doneUmount SMB/ CIFS File Systems done
<notice>killproc: kill(2371,15)
Shutting down NFS client services:done
<notice>killproc: kill(2972,15)
Shutting down rpcbind done
<notice>killproc: kill(2300,15)
<notice>killproc: kill(2316,15)
Shutting down HAL daemondone
Shutting down syslog servicesdone
Shutting down (localfs) network interfaces:
    eth0      device: nVidia Corporation MCP61 Ethernet (rev a2)
              No configuration found for eth0 
              Nevertheless the interface will be shut down.
    eth0     
doneShutting down service (localfs) network  .  .  .  .  .  .  .  .  .done
<notice>killproc: kill(2326,15)
Stopping ISDN done
Shutting down D-Bus daemondone
<notice>killproc: kill(3826,3)
<notice>halt start

--------------070909030201010104010100
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------070909030201010104010100--
