From: Alexander Alemayhu <alexander@alemayhu.com>
Subject: nouveau: display freezing
Date: Fri, 6 Jan 2017 20:23:01 +0100
Message-ID: <20170106192301.GA5113@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Transfer-Encoding: 8bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hei,

839ca903f12e (drm/nouveau/kms/nv50: transition to atomic interfaces internally,
2016-11-04) seems to introduce a regression on my machine.  Attached dmesg
output. Has anyone else seen this on a MacBookPro?

Thanks.

-- 
Mit freundlichen Gr��en

Alexander Alemayhu

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="4.10.0-rc2.dmesg.txt"
Content-Transfer-Encoding: 8bit

[    0.000000] microcode: microcode updated early to revision 0x16, date = 2016-04-01
[    0.000000] Linux version 4.10.0-rc2 (scanf@hafza) (gcc version 6.3.1 20161221 (Red Hat 6.3.1-1) (GCC) ) #1 SMP Wed Jan 4 20:16:20 CET 2017
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-4.10.0-rc2 root=/dev/mapper/fedora_hafza-root ro rd.lvm.lv=fedora_hafza/root rd.lvm.lv=fedora_hafza/swap rhgb quiet intel_pstate=support_acpi_ppc
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000008efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000008f000-0x000000000008ffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000090000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000bffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007ad13fff] usable
[    0.000000] BIOS-e820: [mem 0x000000007ad14000-0x000000007ad52fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000007ad53000-0x000000007ad5efff] usable
[    0.000000] BIOS-e820: [mem 0x000000007ad5f000-0x000000007ad8efff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000007ad8f000-0x000000007ae38fff] usable
[    0.000000] BIOS-e820: [mem 0x000000007ae39000-0x000000007ae8efff] reserved
[    0.000000] BIOS-e820: [mem 0x000000007ae8f000-0x000000007aecffff] usable
[    0.000000] BIOS-e820: [mem 0x000000007aed0000-0x000000007aefefff] reserved
[    0.000000] BIOS-e820: [mem 0x000000007aeff000-0x000000007af7afff] usable
[    0.000000] BIOS-e820: [mem 0x000000007af7b000-0x000000007afe4fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000007afe5000-0x000000007affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000007b000000-0x000000007f9fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e00f8000-0x00000000e00f8fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffe10000-0x00000000ffe3ffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047f5fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x77d00190-0x77d167cf] usable ==> usable
[    0.000000] e820: update [mem 0x77cfe190-0x77cff04e] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x0000000000057fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000058000-0x0000000000058fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000059000-0x000000000008efff] usable
[    0.000000] reserve setup_data: [mem 0x000000000008f000-0x000000000008ffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000090000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000bffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000077cfe18f] usable
[    0.000000] reserve setup_data: [mem 0x0000000077cfe190-0x0000000077cff04e] usable
[    0.000000] reserve setup_data: [mem 0x0000000077cff04f-0x0000000077d0018f] usable
[    0.000000] reserve setup_data: [mem 0x0000000077d00190-0x0000000077d167cf] usable
[    0.000000] reserve setup_data: [mem 0x0000000077d167d0-0x000000007ad13fff] usable
[    0.000000] reserve setup_data: [mem 0x000000007ad14000-0x000000007ad52fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000007ad53000-0x000000007ad5efff] usable
[    0.000000] reserve setup_data: [mem 0x000000007ad5f000-0x000000007ad8efff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000007ad8f000-0x000000007ae38fff] usable
[    0.000000] reserve setup_data: [mem 0x000000007ae39000-0x000000007ae8efff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007ae8f000-0x000000007aecffff] usable
[    0.000000] reserve setup_data: [mem 0x000000007aed0000-0x000000007aefefff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007aeff000-0x000000007af7afff] usable
[    0.000000] reserve setup_data: [mem 0x000000007af7b000-0x000000007afe4fff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007afe5000-0x000000007affffff] usable
[    0.000000] reserve setup_data: [mem 0x000000007b000000-0x000000007f9fffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000e00f8000-0x00000000e00f8fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ffe10000-0x00000000ffe3ffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000047f5fffff] usable
[    0.000000] efi: EFI v1.10 by Apple
[    0.000000] efi:  ACPI=0x7ad8e000  ACPI 2.0=0x7ad8e014  SMBIOS=0x7ad15000 
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS MBP112.88Z.0138.B17.1602221600 02/22/2016
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x47f600 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: write-back
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-DFFFF write-protect
[    0.000000]   E0000-FFFFF uncachable
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0080000000 mask 7F80000000 uncachable
[    0.000000]   1 base 007C000000 mask 7FFC000000 uncachable
[    0.000000]   2 base 007B800000 mask 7FFF800000 uncachable
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT  
[    0.000000] e820: last_pfn = 0x7b000 max_arch_pfn = 0x400000000
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [ffff8a6880099000] 99000 size 24576
[    0.000000] Using GB pages for direct mapping
[    0.000000] BRK [0x41b4ed000, 0x41b4edfff] PGTABLE
[    0.000000] BRK [0x41b4ee000, 0x41b4eefff] PGTABLE
[    0.000000] BRK [0x41b4ef000, 0x41b4effff] PGTABLE
[    0.000000] BRK [0x41b4f0000, 0x41b4f0fff] PGTABLE
[    0.000000] BRK [0x41b4f1000, 0x41b4f1fff] PGTABLE
[    0.000000] BRK [0x41b4f2000, 0x41b4f2fff] PGTABLE
[    0.000000] BRK [0x41b4f3000, 0x41b4f3fff] PGTABLE
[    0.000000] BRK [0x41b4f4000, 0x41b4f4fff] PGTABLE
[    0.000000] RAMDISK: [mem 0x3a814000-0x3fffafff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x000000007AD8E014 000024 (v02 APPLE )
[    0.000000] ACPI: XSDT 0x000000007AD8E1C0 00009C (v01 APPLE  Apple00  00000000      01000013)
[    0.000000] ACPI: FACP 0x000000007AD8C000 0000F4 (v05 APPLE  Apple00  00000000 Loki 0000005F)
[    0.000000] ACPI BIOS Warning (bug): 32/64X length mismatch in FADT/Gpe0Block: 128/0 (20160930/tbfadt-603)
[    0.000000] ACPI: DSDT 0x000000007AD80000 006C1F (v03 APPLE  MacBookP 00110002 INTL 20100915)
[    0.000000] ACPI: FACS 0x000000007AD1C000 000040
[    0.000000] ACPI: FACS 0x000000007AD1C000 000040
[    0.000000] ACPI: HPET 0x000000007AD8B000 000038 (v01 APPLE  Apple00  00000001 Loki 0000005F)
[    0.000000] ACPI: APIC 0x000000007AD8A000 0000BC (v02 APPLE  Apple00  00000001 Loki 0000005F)
[    0.000000] ACPI: SBST 0x000000007AD88000 000030 (v01 APPLE  Apple00  00000001 Loki 0000005F)
[    0.000000] ACPI: ECDT 0x000000007AD87000 000053 (v01 APPLE  Apple00  00000001 Loki 0000005F)
[    0.000000] ACPI: SSDT 0x000000007AD7F000 00010B (v01 APPLE  SataAhci 00001000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD7E000 000024 (v01 APPLE  SmcDppt  00001000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD7C000 000688 (v01 APPLE  SDUsbLpt 00001000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD79000 000032 (v01 APPLE  SsdtS3   00001000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD64000 009E2C (v01 APPLE  TbtPEG11 00001000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD63000 0000B8 (v01 APPLE  Sdxc     00001000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD61000 0006DE (v01 PmRef  Cpu0Ist  00003000 INTL 20100915)
[    0.000000] ACPI: SSDT 0x000000007AD60000 000B83 (v01 PmRef  CpuPm    00003000 INTL 20100915)
[    0.000000] ACPI: MCFG 0x000000007AD89000 00003C (v01 APPLE  Apple00  00000001 Loki 0000005F)
[    0.000000] ACPI: DMAR 0x000000007AD5F000 000088 (v01 APPLE  HSW      00000001 AAPL 00000001)
[    0.000000] ACPI: DMI detected to setup _OSI("Darwin"): Apple hardware
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000047f5fffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x47f5d5000-0x47f5fffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000047f5fffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.000000]   node   0: [mem 0x0000000000059000-0x000000000008efff]
[    0.000000]   node   0: [mem 0x0000000000090000-0x000000000009ffff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000007ad13fff]
[    0.000000]   node   0: [mem 0x000000007ad53000-0x000000007ad5efff]
[    0.000000]   node   0: [mem 0x000000007ad8f000-0x000000007ae38fff]
[    0.000000]   node   0: [mem 0x000000007ae8f000-0x000000007aecffff]
[    0.000000]   node   0: [mem 0x000000007aeff000-0x000000007af7afff]
[    0.000000]   node   0: [mem 0x000000007afe5000-0x000000007affffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000047f5fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000047f5fffff]
[    0.000000] On node 0 totalpages: 4170815
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 22 pages reserved
[    0.000000]   DMA zone: 3997 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 7803 pages used for memmap
[    0.000000]   DMA32 zone: 499362 pages, LIFO batch:31
[    0.000000]   Normal zone: 57304 pages used for memmap
[    0.000000]   Normal zone: 3667456 pages, LIFO batch:31
[    0.000000] tboot: non-0 tboot_addr but it is not of type E820_RESERVED
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0008f000-0x0008ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000bffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000c0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x77cfe000-0x77cfefff]
[    0.000000] PM: Registered nosave memory: [mem 0x77cff000-0x77cfffff]
[    0.000000] PM: Registered nosave memory: [mem 0x77d00000-0x77d00fff]
[    0.000000] PM: Registered nosave memory: [mem 0x77d16000-0x77d16fff]
[    0.000000] PM: Registered nosave memory: [mem 0x7ad14000-0x7ad52fff]
[    0.000000] PM: Registered nosave memory: [mem 0x7ad5f000-0x7ad8efff]
[    0.000000] PM: Registered nosave memory: [mem 0x7ae39000-0x7ae8efff]
[    0.000000] PM: Registered nosave memory: [mem 0x7aed0000-0x7aefefff]
[    0.000000] PM: Registered nosave memory: [mem 0x7af7b000-0x7afe4fff]
[    0.000000] PM: Registered nosave memory: [mem 0x7b000000-0x7f9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x7fa00000-0xe00f7fff]
[    0.000000] PM: Registered nosave memory: [mem 0xe00f8000-0xe00f8fff]
[    0.000000] PM: Registered nosave memory: [mem 0xe00f9000-0xfed1bfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xffe0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffe10000-0xffe3ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffe40000-0xffffffff]
[    0.000000] e820: [mem 0x7fa00000-0xe00f7fff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.000000] percpu: Embedded 485 pages/cpu @ffff8a6cedc00000 s1948632 r8192 d29736 u2097152
[    0.000000] pcpu-alloc: s1948632 r8192 d29736 u2097152 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 4105622
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-4.10.0-rc2 root=/dev/mapper/fedora_hafza-root ro rd.lvm.lv=fedora_hafza/root rd.lvm.lv=fedora_hafza/swap rhgb quiet intel_pstate=support_acpi_ppc
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Memory: 16160396K/16683260K available (9522K kernel code, 1994K rwdata, 3720K rodata, 4156K init, 17280K bss, 522864K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] Running RCU self tests
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU lockdep checking is enabled.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=8
[    0.000000] kmemleak: Kernel memory leak detector disabled
[    0.000000] NR_IRQS:524544 nr_irqs:488 16
[    0.000000] 	Offload RCU callbacks from all CPUs
[    0.000000] 	Offload RCU callbacks from CPUs: 0-7.
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.000000] ... MAX_LOCK_DEPTH:          48
[    0.000000] ... MAX_LOCKDEP_KEYS:        8191
[    0.000000] ... CLASSHASH_SIZE:          4096
[    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
[    0.000000] ... CHAINHASH_SIZE:          32768
[    0.000000]  memory used by lock dependency info: 8671 kB
[    0.000000]  per task-struct memory footprint: 2688 bytes
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2294.834 MHz processor
[    0.000029] Calibrating delay loop (skipped), value calculated using timer frequency.. 4589.66 BogoMIPS (lpj=2294834)
[    0.000031] pid_max: default: 32768 minimum: 301
[    0.000045] ACPI: Core revision 20160930
[    0.034504] ACPI: 9 ACPI AML tables successfully acquired and loaded
[    0.034779] ---[ User Space ]---
[    0.034781] 0x0000000000000000-0x00000000000a0000         640K                               pte
[    0.034783] 0x00000000000a0000-0x00000000000c0000         128K     RW     PCD         GLB x  pte
[    0.034788] 0x00000000000c0000-0x0000000000200000        1280K                               pte
[    0.034794] 0x0000000000200000-0x0000000077a00000        1912M                               pmd
[    0.034796] 0x0000000077a00000-0x0000000077ad5000         852K                               pte
[    0.034798] 0x0000000077ad5000-0x0000000077b5a000         532K     RW                 GLB x  pte
[    0.034801] 0x0000000077b5a000-0x0000000077b5f000          20K                               pte
[    0.034803] 0x0000000077b5f000-0x0000000077b60000           4K     RW                 GLB x  pte
[    0.034806] 0x0000000077b60000-0x0000000077b66000          24K                               pte
[    0.034807] 0x0000000077b66000-0x0000000077b67000           4K     RW                 GLB x  pte
[    0.034810] 0x0000000077b67000-0x0000000077b6c000          20K                               pte
[    0.034813] 0x0000000077b6c000-0x0000000077c9e000        1224K     RW                 GLB x  pte
[    0.034816] 0x0000000077c9e000-0x0000000077d17000         484K                               pte
[    0.034817] 0x0000000077d17000-0x0000000077d18000           4K     RW                 GLB x  pte
[    0.034820] 0x0000000077d18000-0x0000000077d19000           4K                               pte
[    0.034823] 0x0000000077d19000-0x0000000077e00000         924K     RW                 GLB x  pte
[    0.034826] 0x0000000077e00000-0x0000000079400000          22M     RW         PSE         x  pmd
[    0.034835] 0x0000000079400000-0x0000000079a00000           6M     RW                 GLB x  pte
[    0.034839] 0x0000000079a00000-0x0000000079c00000           2M     RW         PSE         x  pmd
[    0.034844] 0x0000000079c00000-0x0000000079e00000           2M     RW                 GLB x  pte
[    0.034847] 0x0000000079e00000-0x000000007ac00000          14M     RW         PSE         x  pmd
[    0.034851] 0x000000007ac00000-0x000000007ad03000        1036K     RW                 GLB x  pte
[    0.034855] 0x000000007ad03000-0x000000007ae39000        1240K                               pte
[    0.034857] 0x000000007ae39000-0x000000007ae8f000         344K     RW                 GLB x  pte
[    0.034860] 0x000000007ae8f000-0x000000007aed0000         260K                               pte
[    0.034862] 0x000000007aed0000-0x000000007aeff000         188K     RW                 GLB x  pte
[    0.034866] 0x000000007aeff000-0x000000007afe5000         920K                               pte
[    0.034867] 0x000000007afe5000-0x000000007b000000         108K     RW                 GLB x  pte
[    0.034870] 0x000000007b000000-0x000000007fa00000          74M     RW     PCD PSE         x  pmd
[    0.034873] 0x000000007fa00000-0x0000000080000000           6M                               pmd
[    0.034875] 0x0000000080000000-0x00000000c0000000           1G                               pud
[    0.034877] 0x00000000c0000000-0x00000000e0000000         512M                               pmd
[    0.034880] 0x00000000e0000000-0x00000000e00f8000         992K                               pte
[    0.034881] 0x00000000e00f8000-0x00000000e00f9000           4K     RW     PCD         GLB x  pte
[    0.034885] 0x00000000e00f9000-0x00000000e0200000        1052K                               pte
[    0.034888] 0x00000000e0200000-0x00000000fec00000         490M                               pmd
[    0.034890] 0x00000000fec00000-0x00000000fed1c000        1136K                               pte
[    0.034891] 0x00000000fed1c000-0x00000000fed20000          16K     RW     PCD         GLB x  pte
[    0.034895] 0x00000000fed20000-0x00000000fee00000         896K                               pte
[    0.034897] 0x00000000fee00000-0x00000000ffe00000          16M                               pmd
[    0.034898] 0x00000000ffe00000-0x00000000ffe10000          64K                               pte
[    0.034899] 0x00000000ffe10000-0x00000000ffe40000         192K     RW     PCD         GLB x  pte
[    0.034904] 0x00000000ffe40000-0x0000000100000000        1792K                               pte
[    0.034906] 0x0000000100000000-0x0000000440000000          13G                               pud
[    0.034909] 0x0000000440000000-0x000000046d800000         728M                               pmd
[    0.034912] 0x000000046d800000-0x000000046d968000        1440K                               pte
[    0.034913] 0x000000046d968000-0x000000046d96c000          16K     RW                 GLB NX pte
[    0.034917] 0x000000046d96c000-0x000000046da00000         592K                               pte
[    0.034919] 0x000000046da00000-0x0000000480000000         294M                               pmd
[    0.034935] 0x0000000480000000-0x0000008000000000         494G                               pud
[    0.034938] 0x0000008000000000-0xffff800000000000   17179737600G                               pgd
[    0.034939] ---[ Kernel Space ]---
[    0.034940] 0xffff800000000000-0xffff808000000000         512G                               pgd
[    0.034941] ---[ Low Kernel Mapping ]---
[    0.034942] 0xffff808000000000-0xffff810000000000         512G                               pgd
[    0.034943] ---[ vmalloc() Area ]---
[    0.034943] 0xffff810000000000-0xffff818000000000         512G                               pgd
[    0.034945] ---[ Vmemmap ]---
[    0.034945] 0xffff818000000000-0xffff8a0000000000        8704G                               pgd
[    0.034950] 0xffff8a0000000000-0xffff8a6880000000         418G                               pud
[    0.034953] 0xffff8a6880000000-0xffff8a6880200000           2M     RW                 GLB NX pte
[    0.034963] 0xffff8a6880200000-0xffff8a68fac00000        1962M     RW         PSE     GLB NX pmd
[    0.034967] 0xffff8a68fac00000-0xffff8a68fad14000        1104K     RW                 GLB NX pte
[    0.034970] 0xffff8a68fad14000-0xffff8a68fad53000         252K                               pte
[    0.034971] 0xffff8a68fad53000-0xffff8a68fad5f000          48K     RW                 GLB NX pte
[    0.034975] 0xffff8a68fad5f000-0xffff8a68fad8f000         192K                               pte
[    0.034977] 0xffff8a68fad8f000-0xffff8a68fae39000         680K     RW                 GLB NX pte
[    0.034980] 0xffff8a68fae39000-0xffff8a68fae8f000         344K                               pte
[    0.034982] 0xffff8a68fae8f000-0xffff8a68faed0000         260K     RW                 GLB NX pte
[    0.034985] 0xffff8a68faed0000-0xffff8a68faeff000         188K                               pte
[    0.034987] 0xffff8a68faeff000-0xffff8a68faf7b000         496K     RW                 GLB NX pte
[    0.034990] 0xffff8a68faf7b000-0xffff8a68fafe5000         424K                               pte
[    0.034992] 0xffff8a68fafe5000-0xffff8a68fb000000         108K     RW                 GLB NX pte
[    0.034995] 0xffff8a68fb000000-0xffff8a6900000000          80M                               pmd
[    0.034997] 0xffff8a6900000000-0xffff8a6980000000           2G                               pud
[    0.034998] 0xffff8a6980000000-0xffff8a6cc0000000          13G     RW         PSE     GLB NX pud
[    0.035004] 0xffff8a6cc0000000-0xffff8a6cff600000        1014M     RW         PSE     GLB NX pmd
[    0.035007] 0xffff8a6cff600000-0xffff8a6d00000000          10M                               pmd
[    0.035009] 0xffff8a6d00000000-0xffff8a8000000000          76G                               pud
[    0.035011] 0xffff8a8000000000-0xffff968000000000          12T                               pgd
[    0.035013] 0xffff968000000000-0xffff96a300000000         140G                               pud
[    0.035014] 0xffff96a300000000-0xffff96a300001000           4K     RW     PCD         GLB NX pte
[    0.035017] 0xffff96a300001000-0xffff96a300002000           4K                               pte
[    0.035018] 0xffff96a300002000-0xffff96a300003000           4K     RW                 GLB NX pte
[    0.035021] 0xffff96a300003000-0xffff96a300004000           4K                               pte
[    0.035023] 0xffff96a300004000-0xffff96a300005000           4K     RW                 GLB NX pte
[    0.035026] 0xffff96a300005000-0xffff96a300006000           4K                               pte
[    0.035027] 0xffff96a300006000-0xffff96a300007000           4K     RW                 GLB NX pte
[    0.035030] 0xffff96a300007000-0xffff96a300008000           4K                               pte
[    0.035031] 0xffff96a300008000-0xffff96a30000f000          28K     RW                 GLB NX pte
[    0.035034] 0xffff96a30000f000-0xffff96a300010000           4K                               pte
[    0.035035] 0xffff96a300010000-0xffff96a300011000           4K     RW                 GLB NX pte
[    0.035038] 0xffff96a300011000-0xffff96a300012000           4K                               pte
[    0.035040] 0xffff96a300012000-0xffff96a300013000           4K     RW                 GLB NX pte
[    0.035043] 0xffff96a300013000-0xffff96a300014000           4K                               pte
[    0.035044] 0xffff96a300014000-0xffff96a300015000           4K     RW                 GLB NX pte
[    0.035047] 0xffff96a300015000-0xffff96a300016000           4K                               pte
[    0.035048] 0xffff96a300016000-0xffff96a300017000           4K     RW                 GLB NX pte
[    0.035051] 0xffff96a300017000-0xffff96a300020000          36K                               pte
[    0.035053] 0xffff96a300020000-0xffff96a30002a000          40K     RW                 GLB NX pte
[    0.035058] 0xffff96a30002a000-0xffff96a300200000        1880K                               pte
[    0.035062] 0xffff96a300200000-0xffff96a340000000        1022M                               pmd
[    0.035065] 0xffff96a340000000-0xffff970000000000         371G                               pud
[    0.035067] 0xffff970000000000-0xffffef0000000000          88T                               pgd
[    0.035069] 0xffffef0000000000-0xffffef0980000000          38G                               pud
[    0.035071] 0xffffef0980000000-0xffffef0982000000          32M     RW         PSE     GLB NX pmd
[    0.035074] 0xffffef0982000000-0xffffef0984000000          32M                               pmd
[    0.035076] 0xffffef0984000000-0xffffef0992000000         224M     RW         PSE     GLB NX pmd
[    0.035081] 0xffffef0992000000-0xffffef09c0000000         736M                               pmd
[    0.035085] 0xffffef09c0000000-0xffffef8000000000         473G                               pud
[    0.035087] 0xffffef8000000000-0xffffff0000000000       15872G                               pgd
[    0.035088] ---[ ESPfix Area ]---
[    0.035088] 0xffffff0000000000-0xffffff8000000000         512G                               pgd
[    0.035092] 0xffffff8000000000-0xffffffef00000000         444G                               pud
[    0.035094] ---[ EFI Runtime Services ]---
[    0.035095] 0xffffffef00000000-0xfffffffec0000000          63G                               pud
[    0.035098] 0xfffffffec0000000-0xfffffffef7a00000         890M                               pmd
[    0.035100] 0xfffffffef7a00000-0xfffffffef7ad5000         852K                               pte
[    0.035102] 0xfffffffef7ad5000-0xfffffffef7b5a000         532K     RW                 GLB x  pte
[    0.035105] 0xfffffffef7b5a000-0xfffffffef7b5f000          20K                               pte
[    0.035107] 0xfffffffef7b5f000-0xfffffffef7b60000           4K     RW                 GLB x  pte
[    0.035110] 0xfffffffef7b60000-0xfffffffef7b66000          24K                               pte
[    0.035111] 0xfffffffef7b66000-0xfffffffef7b67000           4K     RW                 GLB x  pte
[    0.035114] 0xfffffffef7b67000-0xfffffffef7b6c000          20K                               pte
[    0.035117] 0xfffffffef7b6c000-0xfffffffef7c9e000        1224K     RW                 GLB x  pte
[    0.035120] 0xfffffffef7c9e000-0xfffffffef7d17000         484K                               pte
[    0.035122] 0xfffffffef7d17000-0xfffffffef7d18000           4K     RW                 GLB x  pte
[    0.035125] 0xfffffffef7d18000-0xfffffffef7d19000           4K                               pte
[    0.035127] 0xfffffffef7d19000-0xfffffffef7e00000         924K     RW                 GLB x  pte
[    0.035130] 0xfffffffef7e00000-0xfffffffef9400000          22M     RW         PSE         x  pmd
[    0.035140] 0xfffffffef9400000-0xfffffffef9a00000           6M     RW                 GLB x  pte
[    0.035143] 0xfffffffef9a00000-0xfffffffef9c00000           2M     RW         PSE         x  pmd
[    0.035148] 0xfffffffef9c00000-0xfffffffef9e00000           2M     RW                 GLB x  pte
[    0.035151] 0xfffffffef9e00000-0xfffffffefac00000          14M     RW         PSE         x  pmd
[    0.035155] 0xfffffffefac00000-0xfffffffefad03000        1036K     RW                 GLB x  pte
[    0.035160] 0xfffffffefad03000-0xfffffffefae39000        1240K                               pte
[    0.035161] 0xfffffffefae39000-0xfffffffefae8f000         344K     RW                 GLB x  pte
[    0.035165] 0xfffffffefae8f000-0xfffffffefaed0000         260K                               pte
[    0.035166] 0xfffffffefaed0000-0xfffffffefaeff000         188K     RW                 GLB x  pte
[    0.035170] 0xfffffffefaeff000-0xfffffffefafe5000         920K                               pte
[    0.035171] 0xfffffffefafe5000-0xfffffffefb000000         108K     RW                 GLB x  pte
[    0.035175] 0xfffffffefb000000-0xfffffffefb0a0000         640K                               pte
[    0.035177] 0xfffffffefb0a0000-0xfffffffefb0c0000         128K     RW     PCD         GLB x  pte
[    0.035181] 0xfffffffefb0c0000-0xfffffffefb200000        1280K                               pte
[    0.035182] 0xfffffffefb200000-0xfffffffeffc00000          74M     RW     PCD PSE         x  pmd
[    0.035187] 0xfffffffeffc00000-0xfffffffeffcf8000         992K                               pte
[    0.035188] 0xfffffffeffcf8000-0xfffffffeffcf9000           4K     RW     PCD         GLB x  pte
[    0.035191] 0xfffffffeffcf9000-0xfffffffeffd1c000         140K                               pte
[    0.035192] 0xfffffffeffd1c000-0xfffffffeffd20000          16K     RW     PCD         GLB x  pte
[    0.035196] 0xfffffffeffd20000-0xfffffffeffe10000         960K                               pte
[    0.035198] 0xfffffffeffe10000-0xfffffffeffe40000         192K     RW     PCD         GLB x  pte
[    0.035203] 0xfffffffeffe40000-0xffffffff00000000        1792K                               pte
[    0.035204] 0xffffffff00000000-0xffffffff80000000           2G                               pud
[    0.035206] ---[ High Kernel Mapping ]---
[    0.035206] 0xffffffff80000000-0xffffffff8c000000         192M                               pmd
[    0.035208] 0xffffffff8c000000-0xffffffff8e600000          38M     RW         PSE     GLB x  pmd
[    0.035213] 0xffffffff8e600000-0xffffffffc0000000         794M                               pmd
[    0.035214] ---[ Modules ]---
[    0.035217] 0xffffffffc0000000-0xffffffffff000000        1008M                               pmd
[    0.035219] ---[ End Modules ]---
[    0.035219] 0xffffffffff000000-0xffffffffff200000           2M                               pmd
[    0.035224] 0xffffffffff200000-0xffffffffff57b000        3564K                               pte
[    0.035225] 0xffffffffff57b000-0xffffffffff57c000           4K     ro                 GLB NX pte
[    0.035229] 0xffffffffff57c000-0xffffffffff5fb000         508K                               pte
[    0.035230] 0xffffffffff5fb000-0xffffffffff5fd000           8K     RW PWT PCD         GLB NX pte
[    0.035234] 0xffffffffff5fd000-0xffffffffff600000          12K                               pte
[    0.035235] 0xffffffffff600000-0xffffffffff601000           4K USR ro                 GLB NX pte
[    0.035240] 0xffffffffff601000-0xffffffffff800000        2044K                               pte
[    0.035242] 0xffffffffff800000-0x0000000000000000           8M                               pmd
[    0.048333] Security Framework initialized
[    0.048334] Yama: becoming mindful.
[    0.048341] SELinux:  Initializing.
[    0.048382] SELinux:  Starting in permissive mode
[    0.050377] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[    0.053186] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.054102] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.054133] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.054640] CPU: Physical Processor ID: 0
[    0.054641] CPU: Processor Core ID: 0
[    0.054644] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.054644] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.054647] mce: CPU supports 10 MCE banks
[    0.054657] CPU0: Thermal monitoring enabled (TM1)
[    0.054672] process: using mwait in idle threads
[    0.054674] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 1024
[    0.054675] Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 1024, 1GB 4
[    0.055068] Freeing SMP alternatives memory: 32K
[    0.062820] ftrace: allocating 31569 entries in 124 pages
[    0.073251] smpboot: Max logical packages: 2
[    0.073268] DMAR: Host address width 39
[    0.073269] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.073279] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap c0000020660462 ecap f0101a
[    0.073280] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.073284] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008020660462 ecap f010da
[    0.073285] DMAR: RMRR base: 0x0000007b800000 end: 0x0000007f9fffff
[    0.073287] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.073288] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.073288] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.073547] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.073547] x2apic enabled
[    0.073555] Switched APIC routing to cluster x2apic.
[    0.074152] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.084166] TSC deadline timer enabled
[    0.084169] smpboot: CPU0: Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz (family: 0x6, model: 0x46, stepping: 0x1)
[    0.084312] Performance Events: PEBS fmt2+, Haswell events, 16-deep LBR, full-width counters, Intel PMU driver.
[    0.084347] ... version:                3
[    0.084347] ... bit width:              48
[    0.084348] ... generic registers:      4
[    0.084348] ... value mask:             0000ffffffffffff
[    0.084348] ... max period:             00007fffffffffff
[    0.084349] ... fixed-purpose events:   3
[    0.084349] ... event mask:             000000070000000f
[    0.085376] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
[    0.085415] smp: Bringing up secondary CPUs ...
[    0.085748] x86: Booting SMP configuration:
[    0.085749] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.548735] smp: Brought up 1 node, 8 CPUs
[    0.548737] smpboot: Total of 8 processors activated (36808.10 BogoMIPS)
[    0.626396] devtmpfs: initialized
[    0.626577] x86/mm: Memory block size: 128MB
[    0.633693] PM: Registering ACPI NVS region [mem 0x7ad14000-0x7ad52fff] (258048 bytes)
[    0.633856] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.633969] atomic64_test: passed for x86-64 platform with CX8 and with SSE
[    0.633970] pinctrl core: initialized pinctrl subsystem
[    0.634081] RTC time: 18:53:08, date: 01/06/17
[    0.634304] NET: Registered protocol family 16
[    0.638729] cpuidle: using governor menu
[    0.638732] PCCT header not found.
[    0.638919] ACPI: bus type PCI registered
[    0.638920] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.639104] PCI: MMCONFIG for domain 0000 [bus 00-9c] at [mem 0xe0000000-0xe9cfffff] (base 0xe0000000)
[    0.639271] PCI: not using MMCONFIG
[    0.639273] PCI: Using configuration type 1 for base access
[    0.639404] core: PMU erratum BJ122, BV98, HSD29 worked around, HT is on
[    0.649181] HugeTLB registered 1 GB page size, pre-allocated 0 pages
[    0.649183] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.650143] ACPI: Disabled all _OSI OS vendors
[    0.650145] ACPI: Added _OSI(Module Device)
[    0.650146] ACPI: Added _OSI(Processor Device)
[    0.650147] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.650149] ACPI: Added _OSI(Processor Aggregator Device)
[    0.650150] ACPI: Added _OSI(Darwin)
[    0.650170] ACPI : EC: EC started
[    0.676117] ACPI: \: Used as first EC
[    0.676120] ACPI: \: GPE=0x17, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.676122] ACPI: \: Used as boot ECDT EC to handle transactions
[    0.700190] ACPI: BIOS _OSI(Darwin) query honored via DMI
[    0.713798] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.714660] ACPI: Dynamic OEM Table Load:
[    0.714674] ACPI: SSDT 0xFFFF8A6CEB453000 0004F0 (v01 PmRef  Cpu0Cst  00003001 INTL 20100915)
[    0.715661] ACPI: Dynamic OEM Table Load:
[    0.715679] ACPI: SSDT 0xFFFF8A6CEB4D0000 00067C (v01 PmRef  ApIst    00003000 INTL 20100915)
[    0.717132] ACPI: Dynamic OEM Table Load:
[    0.717145] ACPI: SSDT 0xFFFF8A6CEB527600 000119 (v01 PmRef  ApCst    00003000 INTL 20100915)
[    0.721874] ACPI : EC: EC stopped
[    0.721875] ACPI : EC: EC started
[    0.741731] ACPI: \_SB_.PCI0.LPCB.EC__: Used as first EC
[    0.741734] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x17, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.741736] ACPI: \_SB_.PCI0.LPCB.EC__: Used as boot DSDT EC to handle transactions
[    0.741737] ACPI: Interpreter enabled
[    0.741786] ACPI: (supports S0 S3 S4 S5)
[    0.741786] ACPI: Using IOAPIC for interrupt routing
[    0.741866] PCI: MMCONFIG for domain 0000 [bus 00-9c] at [mem 0xe0000000-0xe9cfffff] (base 0xe0000000)
[    0.744042] PCI: MMCONFIG at [mem 0xe0000000-0xe9cfffff] reserved in ACPI motherboard resources
[    0.744059] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.804254] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.804259] acpi PNP0A08:00: _OSC: OS assumes control of [PCIeHotplug SHPCHotplug AER PCIeCapability]
[    0.804289] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-9c] only partially covers this bridge
[    0.805021] PCI host bridge to bus 0000:00
[    0.805023] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.805024] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.805025] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.805026] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]
[    0.805027] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[    0.805028] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]
[    0.805028] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]
[    0.805029] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]
[    0.805030] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]
[    0.805031] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]
[    0.805032] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]
[    0.805033] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff window]
[    0.805034] pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff window]
[    0.805034] pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000ebfff window]
[    0.805035] pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000effff window]
[    0.805036] pci_bus 0000:00: root bus resource [mem 0x000f0000-0x000fffff window]
[    0.805037] pci_bus 0000:00: root bus resource [mem 0x7fa00000-0xfeafffff window]
[    0.805038] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed44fff window]
[    0.805039] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.805054] pci 0000:00:00.0: [8086:0d04] type 00 class 0x060000
[    0.805314] pci 0000:00:01.0: [8086:0d01] type 01 class 0x060400
[    0.805369] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.805483] pci 0000:00:01.0: System wakeup disabled by ACPI
[    0.805587] pci 0000:00:01.1: [8086:0d05] type 01 class 0x060400
[    0.805639] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.805743] pci 0000:00:01.1: System wakeup disabled by ACPI
[    0.805893] pci 0000:00:14.0: [8086:8c31] type 00 class 0x0c0330
[    0.805925] pci 0000:00:14.0: reg 0x10: [mem 0xc1e00000-0xc1e0ffff 64bit]
[    0.806048] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.806270] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.806378] pci 0000:00:16.0: [8086:8c3a] type 00 class 0x078000
[    0.806409] pci 0000:00:16.0: reg 0x10: [mem 0xc1e19100-0xc1e1910f 64bit]
[    0.806529] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.806730] pci 0000:00:1b.0: [8086:8c20] type 00 class 0x040300
[    0.806759] pci 0000:00:1b.0: reg 0x10: [mem 0xc1e14000-0xc1e17fff 64bit]
[    0.806891] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.806988] pci 0000:00:1b.0: System wakeup disabled by ACPI
[    0.807093] pci 0000:00:1c.0: [8086:8c10] type 01 class 0x060400
[    0.807229] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.807416] pci 0000:00:1c.2: [8086:8c14] type 01 class 0x060400
[    0.807552] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.807653] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    0.807756] pci 0000:00:1c.3: [8086:8c16] type 01 class 0x060400
[    0.807890] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.807994] pci 0000:00:1c.3: System wakeup disabled by ACPI
[    0.808096] pci 0000:00:1c.4: [8086:8c18] type 01 class 0x060400
[    0.808240] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.808343] pci 0000:00:1c.4: System wakeup disabled by ACPI
[    0.808455] pci 0000:00:1f.0: [8086:8c4b] type 00 class 0x060100
[    0.808773] pci 0000:00:1f.3: [8086:8c22] type 00 class 0x0c0500
[    0.808799] pci 0000:00:1f.3: reg 0x10: [mem 0xc1e19000-0xc1e190ff 64bit]
[    0.808836] pci 0000:00:1f.3: reg 0x20: [io  0xefa0-0xefbf]
[    0.809200] pci 0000:01:00.0: [10de:0fe9] type 00 class 0x030000
[    0.809219] pci 0000:01:00.0: reg 0x10: [mem 0xc0000000-0xc0ffffff]
[    0.809236] pci 0000:01:00.0: reg 0x14: [mem 0x80000000-0x8fffffff 64bit pref]
[    0.809254] pci 0000:01:00.0: reg 0x1c: [mem 0x90000000-0x91ffffff 64bit pref]
[    0.809265] pci 0000:01:00.0: reg 0x24: [io  0x1000-0x107f]
[    0.809276] pci 0000:01:00.0: reg 0x30: [mem 0xc1000000-0xc107ffff pref]
[    0.809481] pci 0000:01:00.0: System wakeup disabled by ACPI
[    0.809592] pci 0000:01:00.1: [10de:0e1b] type 00 class 0x040300
[    0.809608] pci 0000:01:00.1: reg 0x10: [mem 0xc1080000-0xc1083fff]
[    0.819383] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.819386] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[    0.819390] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xc10fffff]
[    0.819394] pci 0000:00:01.0:   bridge window [mem 0x80000000-0x91ffffff 64bit pref]
[    0.819589] pci 0000:06:00.0: [8086:156d] type 01 class 0x060400
[    0.819720] pci 0000:06:00.0: supports D1 D2
[    0.819721] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.822415] pci 0000:00:01.1: PCI bridge to [bus 06-9c]
[    0.822418] pci 0000:00:01.1:   bridge window [io  0x3000-0x5fff]
[    0.822421] pci 0000:00:01.1:   bridge window [mem 0xc1f00000-0xcdffffff]
[    0.822426] pci 0000:00:01.1:   bridge window [mem 0xce000000-0xd9ffffff 64bit pref]
[    0.822885] pci 0000:07:00.0: [8086:156d] type 01 class 0x060400
[    0.823028] pci 0000:07:00.0: supports D1 D2
[    0.823029] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.823289] pci 0000:07:03.0: [8086:156d] type 01 class 0x060400
[    0.823432] pci 0000:07:03.0: supports D1 D2
[    0.823433] pci 0000:07:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.823662] pci 0000:07:04.0: [8086:156d] type 01 class 0x060400
[    0.823767] pci 0000:07:04.0: supports D1 D2
[    0.823768] pci 0000:07:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.823942] pci 0000:07:05.0: [8086:156d] type 01 class 0x060400
[    0.824047] pci 0000:07:05.0: supports D1 D2
[    0.824047] pci 0000:07:05.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.824222] pci 0000:07:06.0: [8086:156d] type 01 class 0x060400
[    0.824326] pci 0000:07:06.0: supports D1 D2
[    0.824327] pci 0000:07:06.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.824531] pci 0000:06:00.0: PCI bridge to [bus 07-6c]
[    0.824536] pci 0000:06:00.0:   bridge window [io  0x3000-0x4fff]
[    0.824539] pci 0000:06:00.0:   bridge window [mem 0xc1f00000-0xc9ffffff]
[    0.824543] pci 0000:06:00.0:   bridge window [mem 0xce000000-0xd5ffffff 64bit pref]
[    0.824657] pci 0000:08:00.0: [8086:156c] type 00 class 0x088000
[    0.824675] pci 0000:08:00.0: reg 0x10: [mem 0xc1f00000-0xc1f3ffff]
[    0.824686] pci 0000:08:00.0: reg 0x14: [mem 0xc1f40000-0xc1f40fff]
[    0.824839] pci 0000:08:00.0: supports D1 D2
[    0.824840] pci 0000:08:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.828476] pci 0000:07:00.0: PCI bridge to [bus 08]
[    0.828486] pci 0000:07:00.0:   bridge window [mem 0xc1f00000-0xc1ffffff]
[    0.828710] pci 0000:07:03.0: PCI bridge to [bus 09-39]
[    0.828716] pci 0000:07:03.0:   bridge window [io  0x3000-0x3fff]
[    0.828720] pci 0000:07:03.0:   bridge window [mem 0xc2000000-0xc5ffffff]
[    0.828726] pci 0000:07:03.0:   bridge window [mem 0xce000000-0xd1ffffff 64bit pref]
[    0.828932] pci 0000:07:04.0: PCI bridge to [bus 3a]
[    0.829150] pci 0000:07:05.0: PCI bridge to [bus 3b-6b]
[    0.829156] pci 0000:07:05.0:   bridge window [io  0x4000-0x4fff]
[    0.829160] pci 0000:07:05.0:   bridge window [mem 0xc6000000-0xc9ffffff]
[    0.829166] pci 0000:07:05.0:   bridge window [mem 0xd2000000-0xd5ffffff 64bit pref]
[    0.829272] pci 0000:07:06.0: PCI bridge to [bus 6c]
[    0.829447] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.829735] pci 0000:03:00.0: [14e4:43a0] type 00 class 0x028000
[    0.829772] pci 0000:03:00.0: reg 0x10: [mem 0xc1a00000-0xc1a07fff 64bit]
[    0.829794] pci 0000:03:00.0: reg 0x18: [mem 0xc1800000-0xc19fffff 64bit]
[    0.830019] pci 0000:03:00.0: supports D1 D2
[    0.830020] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.830141] pci 0000:03:00.0: System wakeup disabled by ACPI
[    0.833571] pci 0000:00:1c.2: PCI bridge to [bus 03]
[    0.833581] pci 0000:00:1c.2:   bridge window [mem 0xc1800000-0xc1afffff]
[    0.833785] pci 0000:04:00.0: [14e4:1570] type 00 class 0x048000
[    0.833817] pci 0000:04:00.0: reg 0x10: [mem 0xc1d00000-0xc1d0ffff 64bit]
[    0.833838] pci 0000:04:00.0: reg 0x18: [mem 0xa0000000-0xafffffff 64bit pref]
[    0.833859] pci 0000:04:00.0: reg 0x20: [mem 0xc1c00000-0xc1cfffff 64bit]
[    0.834021] pci 0000:04:00.0: supports D1
[    0.834022] pci 0000:04:00.0: PME# supported from D0 D3hot
[    0.834312] pci 0000:00:1c.3: PCI bridge to [bus 04]
[    0.834322] pci 0000:00:1c.3:   bridge window [mem 0xc1c00000-0xc1dfffff]
[    0.834331] pci 0000:00:1c.3:   bridge window [mem 0xa0000000-0xafffffff 64bit pref]
[    0.834592] pci 0000:05:00.0: [144d:1600] type 00 class 0x010601
[    0.834698] pci 0000:05:00.0: reg 0x24: [mem 0xc1b00000-0xc1b01fff]
[    0.834714] pci 0000:05:00.0: reg 0x30: [mem 0xffff0000-0xffffffff pref]
[    0.834846] pci 0000:05:00.0: PME# supported from D3hot D3cold
[    0.835177] pci 0000:00:1c.4: PCI bridge to [bus 05]
[    0.835185] pci 0000:00:1c.4:   bridge window [mem 0xc1b00000-0xc1bfffff]
[    0.838077] ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7 10 12 14 15) *0, disabled.
[    0.838225] ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 5 6 7 11 12 14 15) *0, disabled.
[    0.838370] ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7 10 12 14 15) *0, disabled.
[    0.838514] ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7 11 12 14 15) *0, disabled.
[    0.838668] ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 5 6 7 10 12 14 15) *0, disabled.
[    0.838812] ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 4 5 6 7 11 12 14 15) *0, disabled.
[    0.838951] ACPI: PCI Interrupt Link [LNKG] (IRQs 1 3 4 5 6 7 10 12 14 15) *0, disabled.
[    0.839094] ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 7 11 12 14 15) *0, disabled.
[    0.839575] ACPI: Enabled 2 GPEs in block 00 to 3F
[    0.839726] ACPI : EC: event unblocked
[    0.839733] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x17, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.839734] ACPI: \_SB_.PCI0.LPCB.EC__: Used as boot DSDT EC to handle transactions and events
[    0.840182] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.840188] pci 0000:01:00.0: vgaarb: setting as boot device
[    0.840189] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.840189] vgaarb: loaded
[    0.840360] SCSI subsystem initialized
[    0.840452] libata version 3.00 loaded.
[    0.840504] ACPI: bus type USB registered
[    0.840560] usbcore: registered new interface driver usbfs
[    0.840581] usbcore: registered new interface driver hub
[    0.840636] usbcore: registered new device driver usb
[    0.840796] Registered efivars operations
[    1.121496] PCI: Using ACPI for IRQ routing
[    1.125373] PCI: pci_cache_line_size set to 64 bytes
[    1.125605] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    1.125609] e820: reserve RAM buffer [mem 0x0008f000-0x0008ffff]
[    1.125611] e820: reserve RAM buffer [mem 0x77cfe190-0x77ffffff]
[    1.125612] e820: reserve RAM buffer [mem 0x77d00190-0x77ffffff]
[    1.125613] e820: reserve RAM buffer [mem 0x7ad14000-0x7bffffff]
[    1.125615] e820: reserve RAM buffer [mem 0x7ad5f000-0x7bffffff]
[    1.125617] e820: reserve RAM buffer [mem 0x7ae39000-0x7bffffff]
[    1.125618] e820: reserve RAM buffer [mem 0x7aed0000-0x7bffffff]
[    1.125620] e820: reserve RAM buffer [mem 0x7af7b000-0x7bffffff]
[    1.125621] e820: reserve RAM buffer [mem 0x7b000000-0x7bffffff]
[    1.125622] e820: reserve RAM buffer [mem 0x47f600000-0x47fffffff]
[    1.125954] NetLabel: Initializing
[    1.125954] NetLabel:  domain hash size = 128
[    1.125955] NetLabel:  protocols = UNLABELED CIPSOv4
[    1.125984] NetLabel:  unlabeled traffic allowed by default
[    1.126127] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    1.126131] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    1.128214] clocksource: Switched to clocksource hpet
[    1.163152] VFS: Disk quotas dquot_6.6.0
[    1.163182] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.163464] pnp: PnP ACPI init
[    1.165525] system 00:00: [mem 0xfed00000-0xfed03fff] has been reserved
[    1.165538] system 00:00: Plug and Play ACPI device, IDs PNP0103 PNP0c01 (active)
[    1.165652] system 00:01: [io  0xffff] has been reserved
[    1.165654] system 00:01: [io  0x0400-0x047f] has been reserved
[    1.165656] system 00:01: [io  0x0800-0x087f] has been reserved
[    1.165660] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.165720] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.165895] pnp 00:03: Plug and Play ACPI device, IDs APP000b (active)
[    1.166269] system 00:04: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    1.166272] system 00:04: [mem 0xfed10000-0xfed17fff] has been reserved
[    1.166274] system 00:04: [mem 0xfed18000-0xfed18fff] has been reserved
[    1.166275] system 00:04: [mem 0xfed19000-0xfed19fff] has been reserved
[    1.166279] system 00:04: [mem 0xe0000000-0xefffffff] could not be reserved
[    1.166280] system 00:04: [mem 0xfed20000-0xfed3ffff] has been reserved
[    1.166282] system 00:04: [mem 0xfed90000-0xfed93fff] could not be reserved
[    1.166283] system 00:04: [mem 0xfed45000-0xfed8ffff] has been reserved
[    1.166286] system 00:04: [mem 0xff000000-0xffffffff] could not be reserved
[    1.166287] system 00:04: [mem 0xfee00000-0xfeefffff] has been reserved
[    1.166291] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.166424] system 00:05: [mem 0x20000000-0x201fffff] could not be reserved
[    1.166426] system 00:05: [mem 0x40000000-0x401fffff] could not be reserved
[    1.166430] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (active)
[    1.166754] pnp: PnP ACPI: found 6 devices
[    1.172600] pci 0000:01:00.0: assigning 43 device properties
[    1.172696] apple-properties: device path parse error -19 at 0x14:
[    1.172703] apple-properties: 00000000: 7e 01 00 00 03 00 00 00 02 01 0c 00 d0 41 03 0a  ~............A..
[    1.172708] apple-properties: 00000010: 00 00 00 00 01 01 06 00 00 02 7f ff 04 00 1e 00  ................
[    1.172713] apple-properties: 00000020: 00 00 73 00 61 00 76 00 65 00 64 00 2d 00 63 00  ..s.a.v.e.d.-.c.
[    1.172718] apple-properties: 00000030: 6f 00 6e 00 66 00 69 00 67 00 00 00 e2 00 00 00  o.n.f.i.g.......
[    1.172723] apple-properties: 00000040: 47 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  G...............
[    1.172728] apple-properties: 00000050: 00 00 03 00 09 00 26 0d 00 a1 07 00 00 00 00 00  ......&.........
[    1.172733] apple-properties: 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172738] apple-properties: 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172743] apple-properties: 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172748] apple-properties: 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172752] apple-properties: 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172758] apple-properties: 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172764] apple-properties: 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172770] apple-properties: 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172776] apple-properties: 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172783] apple-properties: 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172790] apple-properties: 00000100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[    1.172796] apple-properties: 00000110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2c 00  ..............,.
[    1.172803] apple-properties: 00000120: 00 00 41 00 41 00 50 00 4c 00 2c 00 69 00 67 00  ..A.A.P.L.,.i.g.
[    1.172809] apple-properties: 00000130: 2d 00 70 00 6c 00 61 00 74 00 66 00 6f 00 72 00  -.p.l.a.t.f.o.r.
[    1.172815] apple-properties: 00000140: 6d 00 2d 00 69 00 64 00 00 00 08 00 00 00 09 00  m.-.i.d.........
[    1.172822] apple-properties: 00000150: 26 0d 24 00 00 00 67 00 72 00 61 00 70 00 68 00  &.$...g.r.a.p.h.
[    1.172828] apple-properties: 00000160: 69 00 63 00 2d 00 6f 00 70 00 74 00 69 00 6f 00  i.c.-.o.p.t.i.o.
[    1.172834] apple-properties: 00000170: 6e 00 73 00 00 00 08 00 00 00 0c 00 00 00        n.s...........
[    1.172865] pci 0000:08:00.0: assigning 7 device properties
[    1.172905] pci 0000:00:1b.0: assigning 4 device properties
[    1.177493] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    1.177498] pci 0000:05:00.0: can't claim BAR 6 [mem 0xffff0000-0xffffffff pref]: no compatible bridge window
[    1.177512] pci 0000:07:00.0: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
[    1.177514] pci 0000:07:00.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 08] add_size 200000 add_align 100000
[    1.177528] pci 0000:07:04.0: bridge window [io  0x1000-0x0fff] to [bus 3a] add_size 1000
[    1.177529] pci 0000:07:04.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 3a] add_size 200000 add_align 100000
[    1.177530] pci 0000:07:04.0: bridge window [mem 0x00100000-0x000fffff] to [bus 3a] add_size 200000 add_align 100000
[    1.177543] pci 0000:07:06.0: bridge window [io  0x1000-0x0fff] to [bus 6c] add_size 1000
[    1.177544] pci 0000:07:06.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 6c] add_size 200000 add_align 100000
[    1.177545] pci 0000:07:06.0: bridge window [mem 0x00100000-0x000fffff] to [bus 6c] add_size 200000 add_align 100000
[    1.177571] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
[    1.177572] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 02] add_size 200000 add_align 100000
[    1.177573] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] to [bus 02] add_size 200000 add_align 100000
[    1.177608] pci 0000:00:1c.0: res[14]=[mem 0x00100000-0x000fffff] res_to_dev_res add_size 200000 min_align 100000
[    1.177609] pci 0000:00:1c.0: res[14]=[mem 0x00100000-0x002fffff] res_to_dev_res add_size 200000 min_align 100000
[    1.177610] pci 0000:00:1c.0: res[15]=[mem 0x00100000-0x000fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177611] pci 0000:00:1c.0: res[15]=[mem 0x00100000-0x002fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177612] pci 0000:00:1c.0: res[13]=[io  0x1000-0x0fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177613] pci 0000:00:1c.0: res[13]=[io  0x1000-0x1fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177620] pci 0000:00:1c.0: BAR 14: assigned [mem 0x7fa00000-0x7fbfffff]
[    1.177631] pci 0000:00:1c.0: BAR 15: assigned [mem 0x7fc00000-0x7fdfffff 64bit pref]
[    1.177632] pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
[    1.177636] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.177638] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[    1.177641] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xc10fffff]
[    1.177643] pci 0000:00:01.0:   bridge window [mem 0x80000000-0x91ffffff 64bit pref]
[    1.177650] pci 0000:07:00.0: res[15]=[mem 0x00100000-0x000fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177651] pci 0000:07:00.0: res[15]=[mem 0x00100000-0x002fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177651] pci 0000:07:04.0: res[14]=[mem 0x00100000-0x000fffff] res_to_dev_res add_size 200000 min_align 100000
[    1.177652] pci 0000:07:04.0: res[14]=[mem 0x00100000-0x002fffff] res_to_dev_res add_size 200000 min_align 100000
[    1.177653] pci 0000:07:04.0: res[15]=[mem 0x00100000-0x000fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177654] pci 0000:07:04.0: res[15]=[mem 0x00100000-0x002fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177655] pci 0000:07:06.0: res[14]=[mem 0x00100000-0x000fffff] res_to_dev_res add_size 200000 min_align 100000
[    1.177656] pci 0000:07:06.0: res[14]=[mem 0x00100000-0x002fffff] res_to_dev_res add_size 200000 min_align 100000
[    1.177657] pci 0000:07:06.0: res[15]=[mem 0x00100000-0x000fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177657] pci 0000:07:06.0: res[15]=[mem 0x00100000-0x002fffff 64bit pref] res_to_dev_res add_size 200000 min_align 100000
[    1.177658] pci 0000:07:00.0: res[13]=[io  0x1000-0x0fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177659] pci 0000:07:00.0: res[13]=[io  0x1000-0x1fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177660] pci 0000:07:04.0: res[13]=[io  0x1000-0x0fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177661] pci 0000:07:04.0: res[13]=[io  0x1000-0x1fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177662] pci 0000:07:06.0: res[13]=[io  0x1000-0x0fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177662] pci 0000:07:06.0: res[13]=[io  0x1000-0x1fff] res_to_dev_res add_size 1000 min_align 1000
[    1.177666] pci 0000:07:00.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    1.177672] pci 0000:07:00.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    1.177673] pci 0000:07:04.0: BAR 14: no space for [mem size 0x00200000]
[    1.177674] pci 0000:07:04.0: BAR 14: failed to assign [mem size 0x00200000]
[    1.177677] pci 0000:07:04.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    1.177678] pci 0000:07:04.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    1.177679] pci 0000:07:06.0: BAR 14: no space for [mem size 0x00200000]
[    1.177680] pci 0000:07:06.0: BAR 14: failed to assign [mem size 0x00200000]
[    1.177683] pci 0000:07:06.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    1.177684] pci 0000:07:06.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    1.177685] pci 0000:07:00.0: BAR 13: no space for [io  size 0x1000]
[    1.177686] pci 0000:07:00.0: BAR 13: failed to assign [io  size 0x1000]
[    1.177687] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[    1.177688] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[    1.177689] pci 0000:07:06.0: BAR 13: no space for [io  size 0x1000]
[    1.177689] pci 0000:07:06.0: BAR 13: failed to assign [io  size 0x1000]
[    1.177695] pci 0000:07:06.0: BAR 14: no space for [mem size 0x00200000]
[    1.177696] pci 0000:07:06.0: BAR 14: failed to assign [mem size 0x00200000]
[    1.177699] pci 0000:07:06.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    1.177700] pci 0000:07:06.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    1.177701] pci 0000:07:06.0: BAR 13: no space for [io  size 0x1000]
[    1.177702] pci 0000:07:06.0: BAR 13: failed to assign [io  size 0x1000]
[    1.177703] pci 0000:07:04.0: BAR 14: no space for [mem size 0x00200000]
[    1.177704] pci 0000:07:04.0: BAR 14: failed to assign [mem size 0x00200000]
[    1.177707] pci 0000:07:04.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    1.177708] pci 0000:07:04.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    1.177709] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[    1.177710] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[    1.177713] pci 0000:07:00.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    1.177714] pci 0000:07:00.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    1.177715] pci 0000:07:00.0: BAR 13: no space for [io  size 0x1000]
[    1.177716] pci 0000:07:00.0: BAR 13: failed to assign [io  size 0x1000]
[    1.177719] pci 0000:07:00.0: PCI bridge to [bus 08]
[    1.177723] pci 0000:07:00.0:   bridge window [mem 0xc1f00000-0xc1ffffff]
[    1.177731] pci 0000:07:03.0: PCI bridge to [bus 09-39]
[    1.177733] pci 0000:07:03.0:   bridge window [io  0x3000-0x3fff]
[    1.177737] pci 0000:07:03.0:   bridge window [mem 0xc2000000-0xc5ffffff]
[    1.177739] pci 0000:07:03.0:   bridge window [mem 0xce000000-0xd1ffffff 64bit pref]
[    1.177744] pci 0000:07:04.0: PCI bridge to [bus 3a]
[    1.177755] pci 0000:07:05.0: PCI bridge to [bus 3b-6b]
[    1.177757] pci 0000:07:05.0:   bridge window [io  0x4000-0x4fff]
[    1.177761] pci 0000:07:05.0:   bridge window [mem 0xc6000000-0xc9ffffff]
[    1.177763] pci 0000:07:05.0:   bridge window [mem 0xd2000000-0xd5ffffff 64bit pref]
[    1.177768] pci 0000:07:06.0: PCI bridge to [bus 6c]
[    1.177779] pci 0000:06:00.0: PCI bridge to [bus 07-6c]
[    1.177780] pci 0000:06:00.0:   bridge window [io  0x3000-0x4fff]
[    1.177784] pci 0000:06:00.0:   bridge window [mem 0xc1f00000-0xc9ffffff]
[    1.177787] pci 0000:06:00.0:   bridge window [mem 0xce000000-0xd5ffffff 64bit pref]
[    1.177792] pci 0000:00:01.1: PCI bridge to [bus 06-9c]
[    1.177793] pci 0000:00:01.1:   bridge window [io  0x3000-0x5fff]
[    1.177796] pci 0000:00:01.1:   bridge window [mem 0xc1f00000-0xcdffffff]
[    1.177798] pci 0000:00:01.1:   bridge window [mem 0xce000000-0xd9ffffff 64bit pref]
[    1.177801] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    1.177808] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    1.177814] pci 0000:00:1c.0:   bridge window [mem 0x7fa00000-0x7fbfffff]
[    1.177819] pci 0000:00:1c.0:   bridge window [mem 0x7fc00000-0x7fdfffff 64bit pref]
[    1.177827] pci 0000:00:1c.2: PCI bridge to [bus 03]
[    1.177833] pci 0000:00:1c.2:   bridge window [mem 0xc1800000-0xc1afffff]
[    1.177844] pci 0000:00:1c.3: PCI bridge to [bus 04]
[    1.177850] pci 0000:00:1c.3:   bridge window [mem 0xc1c00000-0xc1dfffff]
[    1.177855] pci 0000:00:1c.3:   bridge window [mem 0xa0000000-0xafffffff 64bit pref]
[    1.177864] pci 0000:05:00.0: BAR 6: assigned [mem 0xc1b10000-0xc1b1ffff pref]
[    1.177865] pci 0000:00:1c.4: PCI bridge to [bus 05]
[    1.177871] pci 0000:00:1c.4:   bridge window [mem 0xc1b00000-0xc1bfffff]
[    1.177883] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.177884] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.177885] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    1.177885] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]
[    1.177886] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]
[    1.177887] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]
[    1.177887] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]
[    1.177888] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]
[    1.177889] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]
[    1.177890] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]
[    1.177890] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]
[    1.177891] pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff window]
[    1.177892] pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff window]
[    1.177892] pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff window]
[    1.177893] pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff window]
[    1.177894] pci_bus 0000:00: resource 19 [mem 0x000f0000-0x000fffff window]
[    1.177895] pci_bus 0000:00: resource 20 [mem 0x7fa00000-0xfeafffff window]
[    1.177895] pci_bus 0000:00: resource 21 [mem 0xfed40000-0xfed44fff window]
[    1.177896] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    1.177897] pci_bus 0000:01: resource 1 [mem 0xc0000000-0xc10fffff]
[    1.177898] pci_bus 0000:01: resource 2 [mem 0x80000000-0x91ffffff 64bit pref]
[    1.177899] pci_bus 0000:06: resource 0 [io  0x3000-0x5fff]
[    1.177899] pci_bus 0000:06: resource 1 [mem 0xc1f00000-0xcdffffff]
[    1.177900] pci_bus 0000:06: resource 2 [mem 0xce000000-0xd9ffffff 64bit pref]
[    1.177901] pci_bus 0000:07: resource 0 [io  0x3000-0x4fff]
[    1.177902] pci_bus 0000:07: resource 1 [mem 0xc1f00000-0xc9ffffff]
[    1.177902] pci_bus 0000:07: resource 2 [mem 0xce000000-0xd5ffffff 64bit pref]
[    1.177903] pci_bus 0000:08: resource 1 [mem 0xc1f00000-0xc1ffffff]
[    1.177904] pci_bus 0000:09: resource 0 [io  0x3000-0x3fff]
[    1.177905] pci_bus 0000:09: resource 1 [mem 0xc2000000-0xc5ffffff]
[    1.177905] pci_bus 0000:09: resource 2 [mem 0xce000000-0xd1ffffff 64bit pref]
[    1.177906] pci_bus 0000:3b: resource 0 [io  0x4000-0x4fff]
[    1.177907] pci_bus 0000:3b: resource 1 [mem 0xc6000000-0xc9ffffff]
[    1.177908] pci_bus 0000:3b: resource 2 [mem 0xd2000000-0xd5ffffff 64bit pref]
[    1.177909] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    1.177909] pci_bus 0000:02: resource 1 [mem 0x7fa00000-0x7fbfffff]
[    1.177910] pci_bus 0000:02: resource 2 [mem 0x7fc00000-0x7fdfffff 64bit pref]
[    1.177911] pci_bus 0000:03: resource 1 [mem 0xc1800000-0xc1afffff]
[    1.177912] pci_bus 0000:04: resource 1 [mem 0xc1c00000-0xc1dfffff]
[    1.177913] pci_bus 0000:04: resource 2 [mem 0xa0000000-0xafffffff 64bit pref]
[    1.177913] pci_bus 0000:05: resource 1 [mem 0xc1b00000-0xc1bfffff]
[    1.178253] NET: Registered protocol family 2
[    1.178764] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    1.179498] TCP bind hash table entries: 65536 (order: 10, 5242880 bytes)
[    1.181684] TCP: Hash tables configured (established 131072 bind 65536)
[    1.181902] UDP hash table entries: 8192 (order: 8, 1572864 bytes)
[    1.182654] UDP-Lite hash table entries: 8192 (order: 8, 1572864 bytes)
[    1.183429] NET: Registered protocol family 1
[    1.184270] PCI: CLS 256 bytes, default 64
[    1.184449] Unpacking initramfs...
[    2.420626] Freeing initrd memory: 90012K
[    2.434158] DMA-API: preallocated 65536 debug entries
[    2.434159] DMA-API: debugging enabled by kernel config
[    2.434254] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    2.434257] software IO TLB [mem 0x73ad5000-0x77ad5000] (64MB) mapped at [ffff8a68f3ad5000-ffff8a68f7ad4fff]
[    2.437439] Scanning for low memory corruption every 60 seconds
[    2.437861] cryptomgr_test (94) used greatest stack depth: 14640 bytes left
[    2.438901] futex hash table entries: 2048 (order: 6, 262144 bytes)
[    2.439033] audit: initializing netlink subsys (disabled)
[    2.439158] audit: type=2000 audit(1483728789.349:1): initialized
[    2.439781] Initialise system trusted keyrings
[    2.440083] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    2.445586] zbud: loaded
[    2.447411] SELinux:  Registering netfilter hooks
[    2.477081] cryptomgr_test (99) used greatest stack depth: 13568 bytes left
[    2.483398] cryptomgr_test (118) used greatest stack depth: 13376 bytes left
[    2.489817] NET: Registered protocol family 38
[    2.489837] Key type asymmetric registered
[    2.489844] Asymmetric key parser 'x509' registered
[    2.489997] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    2.490162] io scheduler noop registered
[    2.490163] io scheduler deadline registered
[    2.490298] io scheduler cfq registered (default)
[    2.490299] start plist test
[    2.491948] end plist test
[    2.493405] pcieport 0000:00:1c.0: enabling device (0000 -> 0003)
[    2.495433] pcieport 0000:07:03.0: enabling device (0000 -> 0003)
[    2.496113] pcieport 0000:07:05.0: enabling device (0000 -> 0003)
[    2.496880] pciehp 0000:00:1c.0:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    2.497060] pciehp 0000:07:00.0:pcie204: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    2.497189] pciehp 0000:07:03.0:pcie204: Slot #3 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    2.497298] pciehp 0000:07:04.0:pcie204: Slot #4 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    2.497405] pciehp 0000:07:05.0:pcie204: Slot #5 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    2.497510] pciehp 0000:07:06.0:pcie204: Slot #6 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    2.497651] efifb: probing for efifb
[    2.497691] efifb: framebuffer at 0x80020000, using 28800k, total 28800k
[    2.497692] efifb: mode is 2880x1800x32, linelength=16384, pages=1
[    2.497692] efifb: scrolling: redraw
[    2.497693] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    2.512407] Console: switching to colour frame buffer device 360x112
[    2.526149] fb0: EFI VGA frame buffer device
[    2.526163] intel_idle: MWAIT substates: 0x42120
[    2.526164] intel_idle: v0.4.1 model 0x46
[    2.527222] intel_idle: lapic_timer_reliable_states 0xffffffff
[    2.527423] ACPI: AC Adapter [ADP1] (on-line)
[    2.527686] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    2.527770] ACPI: Lid Switch [LID0]
[    2.527911] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    2.527928] ACPI: Power Button [PWRB]
[    2.528058] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
[    2.528061] ACPI: Sleep Button [SLPB]
[    2.528231] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    2.528235] ACPI: Power Button [PWRF]
[    2.529701] GHES: HEST is not enabled!
[    2.529964] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    2.535997] Non-volatile memory driver v1.3
[    2.536094] Linux agpgart interface v0.103
[    2.539773] ahci 0000:05:00.0: version 3.0
[    2.550228] ahci 0000:05:00.0: AHCI 0001.0300 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
[    2.550231] ahci 0000:05:00.0: flags: 64bit ncq led clo only pio ccc 
[    2.551319] scsi host0: ahci
[    2.551621] ata1: SATA max UDMA/133 abar m8192@0xc1b00000 port 0xc1b00100 irq 16
[    2.551919] libphy: Fixed MDIO Bus: probed
[    2.552169] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.552178] ehci-pci: EHCI PCI platform driver
[    2.552222] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.552228] ohci-pci: OHCI PCI platform driver
[    2.552258] uhci_hcd: USB Universal Host Controller Interface driver
[    2.552754] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.553081] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    2.554348] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x00009810
[    2.554355] xhci_hcd 0000:00:14.0: cache line size of 256 is not supported
[    2.554659] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    2.554661] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.554662] usb usb1: Product: xHCI Host Controller
[    2.554662] usb usb1: Manufacturer: Linux 4.10.0-rc2 xhci-hcd
[    2.554663] usb usb1: SerialNumber: 0000:00:14.0
[    2.555194] hub 1-0:1.0: USB hub found
[    2.555266] hub 1-0:1.0: 14 ports detected
[    2.556990] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.557212] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    2.557327] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    2.557328] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.557329] usb usb2: Product: xHCI Host Controller
[    2.557329] usb usb2: Manufacturer: Linux 4.10.0-rc2 xhci-hcd
[    2.557330] usb usb2: SerialNumber: 0000:00:14.0
[    2.557742] hub 2-0:1.0: USB hub found
[    2.557788] hub 2-0:1.0: 6 ports detected
[    2.558754] usbcore: registered new interface driver usbserial
[    2.558765] usbcore: registered new interface driver usbserial_generic
[    2.558799] usbserial: USB Serial support registered for generic
[    2.558856] i8042: PNP: No PS/2 controller found.
[    2.558997] mousedev: PS/2 mouse device common for all mice
[    2.559734] rtc_cmos 00:02: RTC can wake from S4
[    2.560017] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    2.560063] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
[    2.560226] device-mapper: uevent: version 1.0.3
[    2.560454] device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
[    2.560616] intel_pstate: Intel P-state driver initializing
[    2.566265] hidraw: raw HID events driver (C) Jiri Kosina
[    2.566593] usbcore: registered new interface driver usbhid
[    2.566594] usbhid: USB HID core driver
[    2.567273] drop_monitor: Initializing network drop monitor service
[    2.567683] ip_tables: (C) 2000-2006 Netfilter Core Team
[    2.567902] Initializing XFRM netlink socket
[    2.569425] NET: Registered protocol family 10
[    2.578371] Segment Routing with IPv6
[    2.578390] mip6: Mobile IPv6
[    2.578418] NET: Registered protocol family 17
[    2.580252] microcode: sig=0x40661, pf=0x20, revision=0x0
[    2.580604] microcode: Microcode Update Driver: v2.2.
[    2.580626] AVX2 version of gcm_enc/dec engaged.
[    2.580627] AES CTR mode by8 optimization enabled
[    2.604064] registered taskstats version 1
[    2.604092] Loading compiled-in X.509 certificates
[    2.607482] alg: No test for pkcs1pad(rsa,sha256) (pkcs1pad(rsa-generic,sha256))
[    2.608204] Loaded X.509 cert 'Build time autogenerated kernel key: 296724e03b9d4de80d67b826f74ef7ee39b823ce'
[    2.608347] zswap: loaded using pool lzo/zbud
[    2.618714] Key type big_key registered
[    2.622640] Key type encrypted registered
[    2.624610]   Magic number: 1:667:897
[    2.624749] rtc_cmos 00:02: setting system clock to 2017-01-06 18:53:10 UTC (1483728790)
[    2.624974] PM: Hibernation image not present or could not be loaded.
[    2.863920] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    2.864605] ata1.00: unexpected _GTF length (8)
[    2.864806] ata1.00: ATA-8: APPLE SSD SM0512F, UXM2JA1Q, max UDMA/133
[    2.864808] ata1.00: 977105060 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    2.865323] ata1.00: unexpected _GTF length (8)
[    2.865524] ata1.00: configured for UDMA/133
[    2.866867] scsi 0:0:0:0: Direct-Access     ATA      APPLE SSD SM0512 JA1Q PQ: 0 ANSI: 5
[    2.872527] usb 2-4: new SuperSpeed USB device number 2 using xhci_hcd
[    2.887423] usb 2-4: New USB device found, idVendor=05ac, idProduct=8406
[    2.887426] usb 2-4: New USB device strings: Mfr=3, Product=4, SerialNumber=5
[    2.887427] usb 2-4: Product: Card Reader
[    2.887429] usb 2-4: Manufacturer: Apple
[    2.887430] usb 2-4: SerialNumber: 000000000820
[    2.887696] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    2.888137] sd 0:0:0:0: [sda] 977105060 512-byte logical blocks: (500 GB/466 GiB)
[    2.888139] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    2.888225] sd 0:0:0:0: [sda] Write Protect is off
[    2.888228] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.888398] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.893499]  sda: sda1 sda2 sda3 sda4 sda5 sda6
[    2.896396] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.898756] Freeing unused kernel memory: 4156K
[    2.898758] Write protecting the kernel read-only data: 14336k
[    2.899963] Freeing unused kernel memory: 704K
[    2.901462] Freeing unused kernel memory: 376K
[    2.909669] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.041151] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    3.209555] usb 1-1: New USB device found, idVendor=1a40, idProduct=0101
[    3.209557] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    3.209558] usb 1-1: Product: USB 2.0 Hub
[    3.210228] hub 1-1:1.0: USB hub found
[    3.210344] hub 1-1:1.0: 4 ports detected
[    3.367100] usb 1-8: new full-speed USB device number 3 using xhci_hcd
[    3.448158] tsc: Refined TSC clocksource calibration: 2294.698 MHz
[    3.448170] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2113a48d1ad, max_idle_ns: 440795270477 ns
[    3.467287] random: systemd: uninitialized urandom read (16 bytes read)
[    3.468104] random: systemd: uninitialized urandom read (16 bytes read)
[    3.468123] random: systemd: uninitialized urandom read (16 bytes read)
[    3.471051] systemd[1]: systemd 231 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    3.471500] systemd[1]: Detected architecture x86-64.
[    3.471504] systemd[1]: Running in initial RAM disk.
[    3.471537] systemd[1]: Set hostname to <hafza>.
[    3.481400] systemd-fstab-g (210) used greatest stack depth: 13312 bytes left
[    3.536364] usb 1-8: New USB device found, idVendor=0a5c, idProduct=4500
[    3.536365] usb 1-8: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.536366] usb 1-8: Product: BRCM20702 Hub
[    3.536367] usb 1-8: Manufacturer: Apple Inc.
[    3.536978] dracut-rootfs-g (211) used greatest stack depth: 13200 bytes left
[    3.537032] hub 1-8:1.0: USB hub found
[    3.537170] hub 1-8:1.0: 3 ports detected
[    3.537963] random: systemd: uninitialized urandom read (16 bytes read)
[    3.537993] random: systemd: uninitialized urandom read (16 bytes read)
[    3.538033] random: systemd: uninitialized urandom read (16 bytes read)
[    3.538127] random: systemd: uninitialized urandom read (16 bytes read)
[    3.539389] random: systemd: uninitialized urandom read (16 bytes read)
[    3.539617] random: systemd: uninitialized urandom read (16 bytes read)
[    3.539884] random: systemd: uninitialized urandom read (16 bytes read)
[    3.543904] systemd[1]: Reached target Local File Systems.
[    3.543982] systemd[1]: Reached target Swap.
[    3.544049] systemd[1]: Listening on udev Kernel Socket.
[    3.544211] systemd[1]: Listening on Journal Audit Socket.
[    3.544236] systemd[1]: Reached target Timers.
[    3.544343] systemd[1]: Listening on Journal Socket.
[    3.577647] audit: type=1130 audit(1483728791.451:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.613096] usb 1-1.1: new high-speed USB device number 4 using xhci_hcd
[    3.658022] audit: type=1130 audit(1483728791.531:3): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-vconsole-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.683841] audit: type=1130 audit(1483728791.557:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.701608] usb 1-1.1: New USB device found, idVendor=0451, idProduct=8142
[    3.701609] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    3.701610] usb 1-1.1: SerialNumber: 1F0008593B9B
[    3.702467] hub 1-1.1:1.0: USB hub found
[    3.702528] hub 1-1.1:1.0: 4 ports detected
[    3.703793] audit: type=1130 audit(1483728791.577:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.757308] audit: type=1130 audit(1483728791.631:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.771348] audit: type=1130 audit(1483728791.645:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.857098] usb 1-12: new full-speed USB device number 5 using xhci_hcd
[    3.929761] [Firmware Bug]: ACPI(GFX0) defines _DOD but not _DOS
[    3.929942] ACPI: Video Device [GFX0] (multi-head: yes  rom: yes  post: no)
[    3.934179] acpi device:02: registered as cooling_device8
[    3.934464] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input/input4
[    3.938352] audit: type=1130 audit(1483728791.812:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.947687] FUJITSU Extended Socket Network Device Driver - version 1.2 - Copyright (c) 2015 FUJITSU LIMITED
[    3.965913] audit: type=1130 audit(1483728791.839:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=plymouth-start comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.982307] ata_id (418) used greatest stack depth: 12656 bytes left
[    3.998001] usb-storage 2-4:1.0: USB Mass Storage device detected
[    4.013086] scsi host1: usb-storage 2-4:1.0
[    4.013518] usbcore: registered new interface driver usb-storage
[    4.018946] usbcore: registered new interface driver uas
[    4.030709] usb 1-12: New USB device found, idVendor=05ac, idProduct=0263
[    4.030712] usb 1-12: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.030713] usb 1-12: Product: Apple Internal Keyboard / Trackpad
[    4.030715] usb 1-12: Manufacturer: Apple Inc.
[    4.065168] input: Apple Inc. Apple Internal Keyboard / Trackpad as /devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.0/0003:05AC:0263.0001/input/input5
[    4.101440] [drm] Initialized
[    4.102053] usb 1-1.3: new high-speed USB device number 6 using xhci_hcd
[    4.118773] apple 0003:05AC:0263.0001: input,hidraw0: USB HID v1.11 Keyboard [Apple Inc. Apple Internal Keyboard / Trackpad] on usb-0000:00:14.0-12/input0
[    4.120964] apple 0003:05AC:0263.0002: hidraw1: USB HID v1.11 Device [Apple Inc. Apple Internal Keyboard / Trackpad] on usb-0000:00:14.0-12/input1
[    4.167387] wmi: Mapper loaded
[    4.190707] usb 1-1.3: New USB device found, idVendor=0204, idProduct=6025
[    4.190710] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    4.190711] usb 1-1.3: Product: USB2.0
[    4.190713] usb 1-1.3: Manufacturer: CBM
[    4.190714] usb 1-1.3: SerialNumber: 141011001170C805
[    4.191858] usb-storage 1-1.3:1.0: USB Mass Storage device detected
[    4.192454] scsi host2: usb-storage 1-1.3:1.0
[    4.254064] usb 1-8.1: new full-speed USB device number 7 using xhci_hcd
[    4.318166] random: fast init done
[    4.331436] usb 1-8.1: New USB device found, idVendor=05ac, idProduct=820a
[    4.331438] usb 1-8.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.334920] input: HID 05ac:820a as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8.1/1-8.1:1.0/0003:05AC:820A.0003/input/input6
[    4.387685] hid-generic 0003:05AC:820A.0003: input,hidraw2: USB HID v1.11 Keyboard [HID 05ac:820a] on usb-0000:00:14.0-8.1/input0
[    4.394044] usb 1-1.1.1: new low-speed USB device number 8 using xhci_hcd
[    5.447240] clocksource: Switched to clocksource tsc
[    5.447610] usb 1-1.1.1: Device not responding to setup address.
[    5.448601] scsi 2:0:0:0: Direct-Access     CBM      USB2.0           5.00 PQ: 0 ANSI: 2
[    5.449668] scsi 1:0:0:0: Direct-Access     APPLE    SD Card Reader   3.00 PQ: 0 ANSI: 6
[    5.450846] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    5.450975] sd 2:0:0:0: [sdb] 8302592 512-byte logical blocks: (4.25 GB/3.96 GiB)
[    5.451137] sd 2:0:0:0: [sdb] Write Protect is off
[    5.451140] sd 2:0:0:0: [sdb] Mode Sense: 0b 00 00 08
[    5.451680] sd 1:0:0:0: Attached scsi generic sg2 type 0
[    5.451781] sd 2:0:0:0: [sdb] No Caching mode page found
[    5.451817] sd 2:0:0:0: [sdb] Assuming drive cache: write through
[    5.453135] sd 1:0:0:0: [sdc] Attached SCSI removable disk
[    5.453900]  sdb: sdb1 sdb2
[    5.455520] sd 2:0:0:0: [sdb] Attached SCSI removable disk
[    5.483872] ACPI Warning: \_SB.PCI0.P0P2.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20160930/nsarguments-95)
[    5.483906] ACPI: \_SB_.PCI0.P0P2.GFX0: failed to evaluate _DSM
[    5.483992] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    5.484407] checking generic (80020000 1c20000) vs hw (80000000 10000000)
[    5.484408] fb: switching to nouveaufb from EFI VGA
[    5.484478] Console: switching to colour dummy device 80x25
[    5.485784] nouveau 0000:01:00.0: NVIDIA GK107 (0e7290a2)
[    5.515533] nouveau 0000:01:00.0: bios: version 80.07.c7.04.01
[    5.518424] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    5.590193] [TTM] Zone  kernel: Available graphics memory: 8153308 kiB
[    5.590194] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    5.590195] [TTM] Initializing pool allocator
[    5.590207] [TTM] Initializing DMA pool allocator
[    5.590348] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    5.590349] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.590352] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    5.590353] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.590354] nouveau 0000:01:00.0: DRM: DCB outp 00: 04810fb6 0f230010
[    5.590355] nouveau 0000:01:00.0: DRM: DCB outp 01: 01821fd6 0f420020
[    5.590356] nouveau 0000:01:00.0: DRM: DCB outp 02: 01021f12 00020020
[    5.590357] nouveau 0000:01:00.0: DRM: DCB outp 03: 08832fc6 0f420010
[    5.590357] nouveau 0000:01:00.0: DRM: DCB outp 04: 08032f02 00020010
[    5.590358] nouveau 0000:01:00.0: DRM: DCB outp 05: 02843f62 00020010
[    5.590359] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
[    5.590360] nouveau 0000:01:00.0: DRM: DCB conn 01: 02208146
[    5.590360] nouveau 0000:01:00.0: DRM: DCB conn 02: 01104246
[    5.590361] nouveau 0000:01:00.0: DRM: DCB conn 03: 00410361
[    5.656143] usb 1-1.1.1: Device not responding to setup address.
[    5.657157] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.657159] [drm] Driver supports precise vblank timestamp query.
[    5.657399] nouveau 0000:01:00.0: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    5.836793] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    5.863947] usb 1-1.1.1: device not accepting address 8, error -71
[    5.864062] usb 1-1.1-port1: cannot disable (err = -71)
[    5.939952] usb 1-1.4: new high-speed USB device number 9 using xhci_hcd
[    6.022017] nouveau 0000:01:00.0: DRM: allocated 2880x1800 fb: 0x60000, bo ffff8a6cd5b75800
[    6.025487] fbcon: nouveaufb (fb0) is primary device
[    6.046683] usb 1-1.4: New USB device found, idVendor=05ac, idProduct=1402
[    6.046684] usb 1-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    6.046685] usb 1-1.4: Product: Apple USB Ethe娕燬ጠ✩騀龝㢟Љ≠㙱นн
[    6.046686] usb 1-1.4: Manufacturer: Apple Inc.      
[    6.046686] usb 1-1.4: SerialNumber: 1460AB
[    6.049053] usb 1-1.1: USB disconnect, device number 4
[    6.094932] usb 1-8.2: new full-speed USB device number 10 using xhci_hcd
[    6.173938] usb 1-8.2: New USB device found, idVendor=05ac, idProduct=820b
[    6.173939] usb 1-8.2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    6.175789] input: HID 05ac:820b as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8.2/1-8.2:1.0/0003:05AC:820B.0004/input/input7
[    6.176382] hid-generic 0003:05AC:820B.0004: input,hidraw3: USB HID v1.11 Mouse [HID 05ac:820b] on usb-0000:00:14.0-8.2/input0
[    6.239922] usb 1-8.3: new full-speed USB device number 14 using xhci_hcd
[    6.318002] usb 1-8.3: New USB device found, idVendor=05ac, idProduct=8289
[    6.318004] usb 1-8.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    6.318005] usb 1-8.3: Product: Bluetooth USB Host Controller
[    6.318005] usb 1-8.3: Manufacturer: Apple Inc.
[    6.592126] Console: switching to colour frame buffer device 320x90
[    6.712937] asix 1-1.4:1.0 eth0: register 'asix' at usb-0000:00:14.0-1.4, ASIX AX88772 USB 2.0 Ethernet, 00:9a:9d:9f:9f:38
[    6.713121] usbcore: registered new interface driver asix
[    6.718179] asix 1-1.4:1.0 enp0s20u1u4: renamed from eth0
[    6.722961] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.731989] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
[    6.815574] systemd-udevd (396) used greatest stack depth: 12528 bytes left
[    6.815602] systemd-udevd (394) used greatest stack depth: 12304 bytes left
[    6.815630] systemd-udevd (432) used greatest stack depth: 12080 bytes left
[    6.816779] systemd-udevd (391) used greatest stack depth: 11264 bytes left
[    7.070997] audit: type=1130 audit(1483728794.945:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.137508] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: (null)
[    7.449051] kauditd_printk_skb: 12 callbacks suppressed
[    7.449054] audit: type=1130 audit(1483728795.323:15): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-cleanup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.449077] audit: type=1131 audit(1483728795.323:16): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-cleanup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.450974] audit: type=1131 audit(1483728795.325:17): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-pivot comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.451856] audit: type=1130 audit(1483728795.326:18): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.451870] audit: type=1131 audit(1483728795.326:19): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.453324] audit: type=1130 audit(1483728795.327:20): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.453330] audit: type=1131 audit(1483728795.327:21): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.454432] audit: type=1130 audit(1483728795.328:22): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.454439] audit: type=1131 audit(1483728795.328:23): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.464910] audit: type=1130 audit(1483728795.339:24): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=plymouth-switch-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    7.516051] systemd-journald[243]: Received SIGTERM from PID 1 (systemd).
[    7.635498] systemd: 16 output lines suppressed due to ratelimiting
[    7.745300] SELinux: 32768 avtab hash slots, 107270 rules.
[    7.769316] SELinux: 32768 avtab hash slots, 107270 rules.
[    7.821842] SELinux:  8 users, 14 roles, 5082 types, 306 bools, 1 sens, 1024 cats
[    7.821845] SELinux:  94 classes, 107270 rules
[    7.828277] SELinux:  Permission validate_trans in class security not defined in policy.
[    7.828284] SELinux:  Permission module_load in class system not defined in policy.
[    7.828341] SELinux: the above unknown classes and permissions will be allowed
[    7.828347] SELinux:  Completing initialization.
[    7.828347] SELinux:  Setting up existing superblocks.
[    7.868376] systemd[1]: Successfully loaded SELinux policy in 156.021ms.
[    7.906958] systemd[1]: Relabelled /dev and /run in 21.797ms.
[    7.938023] systemd-fstab-g (624) used greatest stack depth: 10960 bytes left
[    7.955966] kdump-dep-gener (628) used greatest stack depth: 10560 bytes left
[    8.129004] EXT4-fs (dm-0): re-mounted. Opts: (null)
[    8.175062] systemd-journald[639]: Received request to flush runtime journal from PID 1
[    8.230109] RPC: Registered named UNIX socket transport module.
[    8.230110] RPC: Registered udp transport module.
[    8.230111] RPC: Registered tcp transport module.
[    8.230112] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    8.441574] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    8.518481] ACPI: SBS HC: EC = 0xffff8a6ceb575000, offset = 0x20, query_bit = 0x10
[    8.589424] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    8.598288] ACPI Warning: SystemIO range 0x0000000000000840-0x000000000000084F conflicts with OpRegion 0x0000000000000800-0x0000000000000863 (\GPIO) (20160930/utaddress-247)
[    8.598295] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    8.598297] ACPI Warning: SystemIO range 0x0000000000000830-0x000000000000083F conflicts with OpRegion 0x0000000000000800-0x0000000000000863 (\GPIO) (20160930/utaddress-247)
[    8.598301] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    8.598303] ACPI Warning: SystemIO range 0x0000000000000800-0x000000000000082F conflicts with OpRegion 0x0000000000000800-0x0000000000000863 (\GPIO) (20160930/utaddress-247)
[    8.598307] ACPI Warning: SystemIO range 0x0000000000000800-0x000000000000082F conflicts with OpRegion 0x0000000000000810-0x0000000000000813 (\IO_D) (20160930/utaddress-247)
[    8.598312] ACPI Warning: SystemIO range 0x0000000000000800-0x000000000000082F conflicts with OpRegion 0x0000000000000800-0x000000000000080F (\IO_T) (20160930/utaddress-247)
[    8.598316] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    8.598317] lpc_ich: Resource conflict(s) found affecting gpio_ich
[    8.612890] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    8.644920] (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    8.645133] ACPI: Smart Battery System [SBS0]: Battery Slot [BAT0] (battery present)
[    8.655120] input: bcm5974 as /devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.2/input/input8
[    8.672846] usbcore: registered new interface driver bcm5974
[    8.681031] random: crng init done
[    8.701855] bcma-pci-bridge 0000:03:00.0: enabling device (0000 -> 0002)
[    8.702343] bcma: bus0: Found chip with id 0x4360, rev 0x03 and package 0x00
[    8.702389] bcma: bus0: Core 0 found: ChipCommon (manuf 0x4BF, id 0x800, rev 0x2B, class 0x0)
[    8.702415] bcma: bus0: Core 1 found: IEEE 802.11 (manuf 0x4BF, id 0x812, rev 0x2A, class 0x0)
[    8.702460] bcma: bus0: Core 2 found: ARM CR4 (manuf 0x4BF, id 0x83E, rev 0x02, class 0x0)
[    8.702509] bcma: bus0: Core 3 found: PCIe Gen2 (manuf 0x4BF, id 0x83C, rev 0x01, class 0x0)
[    8.702533] bcma: bus0: Core 4 found: USB 2.0 Device (manuf 0x4BF, id 0x81A, rev 0x11, class 0x0)
[    8.760035] bcma: Unsupported SPROM revision: 11
[    8.760180] usb 1-1.1: new high-speed USB device number 15 using xhci_hcd
[    8.777349] bcma: bus0: Invalid SPROM read from the PCIe card, trying to use fallback SPROM
[    8.777350] bcma: bus0: Using fallback SPROM failed (err -2)
[    8.777351] bcma: bus0: No SPROM available
[    8.781239] bcma: bus0: Bus registered
[    8.811023] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360 ms ovfl timer
[    8.811025] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    8.811026] RAPL PMU: hw unit of domain package 2^-14 Joules
[    8.811027] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    8.811028] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    8.850141] usb 1-1.1: New USB device found, idVendor=0451, idProduct=8142
[    8.850144] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    8.850146] usb 1-1.1: SerialNumber: 1F0008593B9B
[    8.851590] hub 1-1.1:1.0: USB hub found
[    8.851654] hub 1-1.1:1.0: 4 ports detected
[    8.909680] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[    8.909875] snd_hda_intel 0000:01:00.1: Disabling MSI
[    8.909890] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
[    8.942740] Bluetooth: Core ver 2.22
[    8.942793] NET: Registered protocol family 31
[    8.942794] Bluetooth: HCI device and connection manager initialized
[    8.942856] Bluetooth: HCI socket layer initialized
[    8.942861] Bluetooth: L2CAP socket layer initialized
[    8.942928] Bluetooth: SCO socket layer initialized
[    8.946356] applesmc: key=661 fan=2 temp=41 index=40 acc=0 lux=2 kbd=1
[    8.947120] applesmc applesmc.768: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    8.978620] snd_hda_codec_cirrus hdaudioC0D0: autoconfig for CS4208: line_outs=2 (0x12/0x13/0x0/0x0/0x0) type:speaker
[    8.978622] snd_hda_codec_cirrus hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    8.978623] snd_hda_codec_cirrus hdaudioC0D0:    hp_outs=1 (0x10/0x0/0x0/0x0/0x0)
[    8.978624] snd_hda_codec_cirrus hdaudioC0D0:    mono: mono_out=0x0
[    8.978624] snd_hda_codec_cirrus hdaudioC0D0:    dig-out=0x21/0x0
[    8.978625] snd_hda_codec_cirrus hdaudioC0D0:    inputs:
[    8.978627] snd_hda_codec_cirrus hdaudioC0D0:      Internal Mic=0x1c
[    8.978628] snd_hda_codec_cirrus hdaudioC0D0:      Mic=0x18
[    8.993004] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
[    8.994011] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
[    8.995331] input: HDA Intel PCH SPDIF as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
[    8.995393] usbcore: registered new interface driver btusb
[    8.998685] iTCO_vendor_support: vendor-support=0
[    9.000796] Bluetooth: hci0: BCM: chip id 73 build 1036
[    9.001811] Bluetooth: hci0: BCM: product 05ac:8289
[    9.012249] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    9.012323] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by hardware/BIOS
[    9.018885] Bluetooth: hci0: hafza
[    9.048402] Adding 8196092k swap on /dev/mapper/fedora_hafza-swap.  Priority:-1 extents:1 across:8196092k SSFS
[    9.053025] usb 1-8.1: USB disconnect, device number 7
[    9.216187] usb 1-1.1.1: new low-speed USB device number 16 using xhci_hcd
[    9.299222] usb 1-1.1.1: New USB device found, idVendor=046d, idProduct=c31c
[    9.299225] usb 1-1.1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    9.299227] usb 1-1.1.1: Product: USB Keyboard
[    9.299228] usb 1-1.1.1: Manufacturer: Logitech
[    9.305780] input: Logitech USB Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1:1.0/0003:046D:C31C.0005/input/input15
[    9.521041] intel_rapl: Found RAPL domain package
[    9.521043] intel_rapl: Found RAPL domain core
[    9.521044] intel_rapl: Found RAPL domain uncore
[    9.521045] intel_rapl: Found RAPL domain dram
[    9.603485] hid-generic 0003:046D:C31C.0005: input,hidraw2: USB HID v1.10 Keyboard [Logitech USB Keyboard] on usb-0000:00:14.0-1.1.1/input0
[    9.610911] input: Logitech USB Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1:1.1/0003:046D:C31C.0006/input/input16
[    9.641430] b43-phy0: Broadcom 4360 WLAN found (core revision 42)
[    9.663262] hid-generic 0003:046D:C31C.0006: input,hidraw4: USB HID v1.10 Device [Logitech USB Keyboard] on usb-0000:00:14.0-1.1.1/input1
[    9.675225] usb 1-8.2: USB disconnect, device number 10
[    9.694520] bcma: bus0: HT force timeout
[    9.699313] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input12
[    9.726747] usb 1-1.1.2: new low-speed USB device number 17 using xhci_hcd
[    9.806431] usb 1-1.1.2: New USB device found, idVendor=046d, idProduct=c05a
[    9.806432] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    9.806433] usb 1-1.1.2: Product: USB Optical Mouse
[    9.806434] usb 1-1.1.2: Manufacturer: Logitech
[    9.809363] input: Logitech USB Optical Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:046D:C05A.0007/input/input17
[   10.047716] bcma: bus0: PLL enable timeout
[   10.047776] b43-phy0 ERROR: FOUND UNSUPPORTED PHY (Analog 12, Type 11 (AC), Revision 1)
[   10.047845] b43: probe of bcma0:1 failed with error -95
[   10.047911] Broadcom 43xx driver loaded [ Features: PNLS ]
[   10.078029] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input13
[   10.079332] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input14
[   10.081178] hid-generic 0003:046D:C05A.0007: input,hidraw3: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-0000:00:14.0-1.1.2/input0
[   10.146694] usb 1-1.1.4: new high-speed USB device number 18 using xhci_hcd
[   10.223250] usb 1-1.1.4: New USB device found, idVendor=0451, idProduct=8142
[   10.223252] usb 1-1.1.4: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[   10.223253] usb 1-1.1.4: SerialNumber: EE0000593B9B
[   10.225704] hub 1-1.1.4:1.0: USB hub found
[   10.225760] hub 1-1.1.4:1.0: 2 ports detected
[   10.249251] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
[   10.418027] EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts: (null)
[   10.775778] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   10.775779] Bluetooth: BNEP filters: protocol multicast
[   10.775787] Bluetooth: BNEP socket layer initialized
[   12.298224] ip6_tables: (C) 2000-2006 Netfilter Core Team
[   12.345672] Ebtables v2.0 registered
[   12.463171] IPv6: ADDRCONF(NETDEV_UP): enp0s20u1u4: link is not ready
[   12.463950] IPv6: ADDRCONF(NETDEV_UP): enp0s20u1u4: link is not ready
[   12.520803] nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
[   12.569234] loop: module loaded
[   12.639548] IPv6: ADDRCONF(NETDEV_CHANGE): enp0s20u1u4: link becomes ready
[   12.646186] asix 1-1.4:1.0 enp0s20u1u4: link up, 100Mbps, full-duplex, lpa 0xCDE1
[   12.927334] Netfilter messages via NETLINK v0.30.
[   12.948772] ip_set: protocol 6
[   13.200117] IPv6: ADDRCONF(NETDEV_UP): docker0: link is not ready
[   17.446609] tun: Universal TUN/TAP device driver, 1.6
[   17.446611] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[   17.495950] virbr0: port 1(virbr0-nic) entered blocking state
[   17.495954] virbr0: port 1(virbr0-nic) entered disabled state
[   17.496129] device virbr0-nic entered promiscuous mode
[   17.729010] virbr0: port 1(virbr0-nic) entered blocking state
[   17.729015] virbr0: port 1(virbr0-nic) entered listening state
[   17.776316] virbr0: port 1(virbr0-nic) entered disabled state
[   56.582016] ------------[ cut here ]------------
[   56.582065] WARNING: CPU: 7 PID: 1193 at drivers/gpu/drm/nouveau/nouveau_bo.c:137 nouveau_bo_del_ttm+0x7f/0x90 [nouveau]
[   56.582066] Modules linked in: xt_CHECKSUM ipt_MASQUERADE nf_nat_masquerade_ipv4 tun nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw dm_thin_pool ip6table_security dm_persistent_data iptable_nat nf_conntrack_ipv4 dm_bio_prison nf_defrag_ipv4 nf_nat_ipv4 loop nf_nat nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security ebtable_filter ebtables ip6table_filter ip6_tables cmac bnep nls_utf8 hfsplus b43 ssb intel_rapl mmc_core x86_pkg_temp_thermal intel_powerclamp coretemp mac80211 kvm_intel kvm cfg80211 snd_hda_codec_hdmi irqbypass crct10dif_pclmul joydev iTCO_wdt crc32_pclmul
  iTCO_vendor_support
[   56.582105]  btusb snd_hda_codec_cirrus ghash_clmulni_intel btrtl snd_hda_codec_generic intel_cstate btbcm btintel bluetooth snd_hda_intel snd_hda_codec applesmc input_polldev snd_hwdep snd_hda_core intel_uncore snd_seq intel_rapl_perf rfkill snd_seq_device snd_pcm bcma bcm5974 snd_timer snd mei_me mei i2c_i801 soundcore lpc_ich shpchp sbs acpi_als kfifo_buf sbshc industrialio tpm_tis tpm_tis_core tpm apple_bl nfsd auth_rpcgss nfs_acl lockd grace sunrpc asix usbnet mii nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper ttm drm hid_apple uas crc32c_intel usb_storage fjes video
[   56.582142] CPU: 7 PID: 1193 Comm: Xorg Not tainted 4.10.0-rc2 #1
[   56.582143] Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS MBP112.88Z.0138.B17.1602221600 02/22/2016
[   56.582144] Call Trace:
[   56.582147]  dump_stack+0x86/0xc3
[   56.582150]  __warn+0xcb/0xf0
[   56.582152]  warn_slowpath_null+0x1d/0x20
[   56.582180]  nouveau_bo_del_ttm+0x7f/0x90 [nouveau]
[   56.582184]  ttm_bo_release_list+0xdb/0x210 [ttm]
[   56.582188]  ttm_bo_release+0x23d/0x340 [ttm]
[   56.582191]  ttm_bo_unref+0x24/0x30 [ttm]
[   56.582194]  ttm_bo_vm_close+0x34/0x60 [ttm]
[   56.582197]  remove_vma+0x45/0x80
[   56.582199]  do_munmap+0x2b2/0x460
[   56.582201]  SyS_munmap+0x53/0x70
[   56.582204]  entry_SYSCALL_64_fastpath+0x1f/0xc2
[   56.582205] RIP: 0033:0x7f989734d237
[   56.582206] RSP: 002b:00007fffe1fb82f8 EFLAGS: 00003206 ORIG_RAX: 000000000000000b
[   56.582208] RAX: ffffffffffffffda RBX: 000000000165d170 RCX: 00007f989734d237
[   56.582208] RDX: 00007fffe1fb8300 RSI: 0000000002340000 RDI: 00007f987d20a000
[   56.582209] RBP: 00007fffe1fb8300 R08: 0000000000000000 R09: 000000000165d270
[   56.582210] R10: 000000000000006f R11: 0000000000003206 R12: 0000000040086409
[   56.582211] R13: 0000000000000010 R14: 000000000173da20 R15: 000000000165d630
[   56.582212] ---[ end trace 78ae14ab19be6a84 ]---
[  194.270366] BUG: unable to handle kernel NULL pointer dereference at 000000000000001f
[  194.270389] IP: dma_fence_wait_timeout+0x8d/0x280
[  194.270396] PGD 45ae50067 
[  194.270397] PUD 4598ad067 
[  194.270401] PMD 0 

[  194.270411] Oops: 0000 [#1] SMP
[  194.270416] Modules linked in: xt_CHECKSUM ipt_MASQUERADE nf_nat_masquerade_ipv4 tun nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw dm_thin_pool ip6table_security dm_persistent_data iptable_nat nf_conntrack_ipv4 dm_bio_prison nf_defrag_ipv4 nf_nat_ipv4 loop nf_nat nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security ebtable_filter ebtables ip6table_filter ip6_tables cmac bnep nls_utf8 hfsplus b43 ssb intel_rapl mmc_core x86_pkg_temp_thermal intel_powerclamp coretemp mac80211 kvm_intel kvm cfg80211 snd_hda_codec_hdmi irqbypass crct10dif_pclmul joydev iTCO_wdt crc32_pclmul
  iTCO_vendor_support
[  194.270488]  btusb snd_hda_codec_cirrus ghash_clmulni_intel btrtl snd_hda_codec_generic intel_cstate btbcm btintel bluetooth snd_hda_intel snd_hda_codec applesmc input_polldev snd_hwdep snd_hda_core intel_uncore snd_seq intel_rapl_perf rfkill snd_seq_device snd_pcm bcma bcm5974 snd_timer snd mei_me mei i2c_i801 soundcore lpc_ich shpchp sbs acpi_als kfifo_buf sbshc industrialio tpm_tis tpm_tis_core tpm apple_bl nfsd auth_rpcgss nfs_acl lockd grace sunrpc asix usbnet mii nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper ttm drm hid_apple uas crc32c_intel usb_storage fjes video
[  194.270549] CPU: 4 PID: 1193 Comm: Xorg Tainted: G        W       4.10.0-rc2 #1
[  194.270555] Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS MBP112.88Z.0138.B17.1602221600 02/22/2016
[  194.270562] task: ffff8a6ccc700000 task.stack: ffff96a302eac000
[  194.270569] RIP: 0010:dma_fence_wait_timeout+0x8d/0x280
[  194.270574] RSP: 0018:ffff96a302eafa30 EFLAGS: 00010286
[  194.270585] RAX: ffffffffffffffff RBX: ffff8a6ce79333c0 RCX: 00000000000000ff
[  194.270590] RDX: 7fffffffffffffff RSI: 0000000000000001 RDI: ffff8a6cdea413c0
[  194.270596] RBP: ffff96a302eafa50 R08: 0000000000000000 R09: bedfe8c000000000
[  194.270602] R10: 0000000000000001 R11: 0000000000000000 R12: ffff8a6cdea413c0
[  194.270607] R13: 0000000000000001 R14: 7fffffffffffffff R15: 0000000000000001
[  194.270614] FS:  00007f9899aca1c0(0000) GS:ffff8a6cee400000(0000) knlGS:0000000000000000
[  194.270620] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  194.270625] CR2: 000000000000001f CR3: 00000004562d8000 CR4: 00000000001406e0
[  194.270631] Call Trace:
[  194.270645]  drm_atomic_helper_wait_for_fences+0x48/0x120 [drm_kms_helper]
[  194.270696]  nv50_disp_atomic_commit+0x1c8/0x2d0 [nouveau]
[  194.270714]  drm_atomic_commit+0x4b/0x50 [drm]
[  194.270724]  drm_atomic_helper_update_plane+0xec/0x150 [drm_kms_helper]
[  194.270740]  __setplane_internal+0x1b7/0x280 [drm]
[  194.270755]  drm_mode_cursor_universal+0x126/0x210 [drm]
[  194.270770]  drm_mode_cursor_common+0x89/0x180 [drm]
[  194.270784]  drm_mode_cursor_ioctl+0x50/0x70 [drm]
[  194.270797]  drm_ioctl+0x37a/0x4e0 [drm]
[  194.270804]  ? sched_clock_cpu+0xa7/0xc0
[  194.270817]  ? drm_mode_setplane+0x1b0/0x1b0 [drm]
[  194.270825]  ? trace_hardirqs_on_caller+0xf5/0x1b0
[  194.270831]  ? trace_hardirqs_on+0xd/0x10
[  194.270869]  nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[  194.270876]  do_vfs_ioctl+0xa3/0x740
[  194.270882]  ? __fget+0x5/0x200
[  194.270887]  SyS_ioctl+0x79/0x90
[  194.270894]  entry_SYSCALL_64_fastpath+0x1f/0xc2
[  194.270899] RIP: 0033:0x7f9897348757
[  194.270904] RSP: 002b:00007fffe1fb7ff8 EFLAGS: 00003246 ORIG_RAX: 0000000000000010
[  194.270911] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f9897348757
[  194.270918] RDX: 00007fffe1fb8030 RSI: 00000000c01c64a3 RDI: 0000000000000010
[  194.270924] RBP: 0000000000830344 R08: 0000000000000040 R09: 0000000000000100
[  194.270931] R10: 0000000000000040 R11: 0000000000003246 R12: 0000000000850800
[  194.270937] R13: 00007fffe1fb8434 R14: 00000000008465a0 R15: 0000000000000000
[  194.270944] Code: a0 9b 73 eb 17 65 8b 05 6a 6d 9b 73 89 c0 48 0f a3 05 78 15 99 00 0f 82 cd 00 00 00 49 8b 44 24 08 41 0f b6 f5 4c 89 f2 4c 89 e7 <ff> 50 20 49 89 c5 0f 1f 44 00 00 65 8b 05 39 6d 9b 73 89 c0 48 
[  194.270989] RIP: dma_fence_wait_timeout+0x8d/0x280 RSP: ffff96a302eafa30
[  194.270996] CR2: 000000000000001f
[  194.279696] ---[ end trace 78ae14ab19be6a85 ]---

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--TB36FDmn/VVEgNH/--
