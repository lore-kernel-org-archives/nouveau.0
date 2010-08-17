From: Michael Tokarev <mjt-XAri/EZa3C4vJsYlp49lxw@public.gmane.org>
Subject: ol'good notebook with GF Go 7600: suspend/resume problems
Date: Tue, 17 Aug 2010 17:51:29 +0400
Message-ID: <4C6A93E1.7080505@msgid.tls.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080703070303060907080205"
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
--------------080703070303060907080205
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello.

I'm trying to debug a suspend/resume problem on my old
(circa 2006) and so far good Acer Aspire 9300 notebook,
which has NV40-class graphics (G73 [GeForce Go 7600]),
and is based on AMD Turion processor and Nvidia chipset.

Obviously suspend/resume (both to disk and ram) are quite
important for such devices.

But the problem is that no suspend/resume variant works.

I tried with various kernels, and collected all info on
2.6.35.2 + nouveau/master git as of today (actually one
commit behind - right before merge of 2.6.36-rc1).  All
versions behave in a similar way, give or take, but the
result is always the same: after resuming from ram, the
machine never recovers, it stays with blank screen and
the fan is blowing very hot air from inside; it is either
completely dead/locked up, or may start answering pings
or even lets to ssh in after some time.

Attached is a full dmesg output of one such experiment,
from 2.6.35+git.  I logged in over network to capture
the dmesg.

This is, again, suspend-to-ram.  With suspend-to-disk,
things are even "funnier", as in, it never completes
the _suspend_ (freeze) stage.  But that's different
story...

Is there anything I can do to enable this device to
peform suspend/resume to/from ram cycle correctly?

Thank you!

/mjt


--------------080703070303060907080205
Content-Type: text/plain;
 name="dmesg"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg"

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.35-amd64 (mjt@gandalf) (gcc version 4.4.5 20100728 (prerelease) (Debian 4.4.4-8) ) #2.6.35.2 SMP Tue Aug 17 14:52:34 MSD 2010
[    0.000000] Command line: ro root=/dev/sda3 rootflags=commit=60 panic=20 cgroup_disable=memory resume=/dev/sda8 initrd=initrd-2.6.35-amd64 BOOT_IMAGE=vmlinuz-2.6.35-amd64 
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009dc00 (usable)
[    0.000000]  BIOS-e820: 000000000009dc00 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000d0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 000000007ff10000 (usable)
[    0.000000]  BIOS-e820: 000000007ff10000 - 000000007ff1a000 (ACPI data)
[    0.000000]  BIOS-e820: 000000007ff1a000 - 000000007ff80000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007ff80000 - 0000000080000000 (reserved)
[    0.000000]  BIOS-e820: 00000000e0000000 - 00000000f0000000 (reserved)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec10000 (reserved)
[    0.000000]  BIOS-e820: 00000000fed00000 - 00000000fed00400 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000fff80000 - 0000000100000000 (reserved)
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI present.
[    0.000000] Phoenix BIOS detected: BIOS may corrupt low RAM, working around it.
[    0.000000] e820 update range: 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
[    0.000000] e820 update range: 0000000000000000 - 0000000000001000 (usable) ==> (reserved)
[    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
[    0.000000] No AGP bridge found
[    0.000000] last_pfn = 0x7ff10 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-CFFFF write-protect
[    0.000000]   D0000-E3FFF uncachable
[    0.000000]   E4000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0000000000 mask FF80000000 write-back
[    0.000000]   1 disabled
[    0.000000]   2 disabled
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] initial memory mapped : 0 - 20000000
[    0.000000] found SMP MP-table at [ffff8800000f81a0] f81a0
[    0.000000] init_memory_mapping: 0000000000000000-000000007ff10000
[    0.000000]  0000000000 - 007fe00000 page 2M
[    0.000000]  007fe00000 - 007ff10000 page 4k
[    0.000000] kernel direct mapping tables up to 7ff10000 @ 16000-1a000
[    0.000000] RAMDISK: 7fcb2000 - 7ff0f000
[    0.000000] ACPI: RSDP 00000000000f8230 00024 (v03 PTLTD )
[    0.000000] ACPI: XSDT 000000007ff138c9 0005C (v01 ACRSYS ACRPRDCT 06040000 INNA 00000000)
[    0.000000] ACPI: FACP 000000007ff19aa6 000F4 (v03 NVIDIA MCP51M   06040000 PTL  000F4240)
[    0.000000] ACPI: DSDT 000000007ff13925 06181 (v01 NVIDIA   MCP51M 06040000 MSFT 0100000E)
[    0.000000] ACPI: FACS 000000007ff1afc0 00040
[    0.000000] ACPI: SLIC 000000007ff19c0e 00176 (v01 ACRSYS ACRPRDCT 06040000 ANNI 00000001)
[    0.000000] ACPI: MCFG 000000007ff19d84 0003C (v01 PTLTD    MCFG   06040000  LTP 00000000)
[    0.000000] ACPI: HPET 000000007ff19dc0 00038 (v01 PTLTD  HPETTBL  06040000  LTP 00000001)
[    0.000000] ACPI: APIC 000000007ff19df8 0005E (v01 PTLTD  ? APIC   06040000  LTP 00000000)
[    0.000000] ACPI: BOOT 000000007ff19e56 00028 (v01 PTLTD  $SBFTBL$ 06040000  LTP 00000001)
[    0.000000] ACPI: SSDT 000000007ff19e7e 00182 (v01 PTLTD  POWERNOW 06040000  LTP 00000001)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000]  [ffffea0000000000-ffffea0001bfffff] PMD -> [ffff880001e00000-ffff8800039fffff] on node 0
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000010 -> 0x00001000
[    0.000000]   DMA32    0x00001000 -> 0x00100000
[    0.000000]   Normal   empty
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[2] active PFN ranges
[    0.000000]     0: 0x00000010 -> 0x0000009d
[    0.000000]     0: 0x00000100 -> 0x0007ff10
[    0.000000] On node 0 totalpages: 523933
[    0.000000]   DMA zone: 56 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3925 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 7109 pages used for memmap
[    0.000000]   DMA32 zone: 512843 pages, LIFO batch:31
[    0.000000] Detected use of extended apic ids on hypertransport bus
[    0.000000] ACPI: PM-Timer IO Port: 0x1008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 17, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x10de8201 base: 0xfed00000
[    0.000000] SMP: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] early_res array is doubled to 64 at [18000 - 187ff]
[    0.000000] PM: Registered nosave memory: 000000000009d000 - 000000000009e000
[    0.000000] PM: Registered nosave memory: 000000000009e000 - 00000000000a0000
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 00000000000d0000
[    0.000000] PM: Registered nosave memory: 00000000000d0000 - 0000000000100000
[    0.000000] Allocating PCI resources starting at 80000000 (gap: 80000000:60000000)
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_node_ids:1
[    0.000000] PERCPU: Embedded 28 pages/cpu @ffff880001600000 s82688 r8192 d23808 u1048576
[    0.000000] pcpu-alloc: s82688 r8192 d23808 u1048576 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 516768
[    0.000000] Kernel command line: ro root=/dev/sda3 rootflags=commit=60 panic=20 cgroup_disable=memory resume=/dev/sda8 initrd=initrd-2.6.35-amd64 BOOT_IMAGE=vmlinuz-2.6.35-amd64 
[    0.000000] Disabling memory control group subsystem
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Checking aperture...
[    0.000000] No AGP bridge found
[    0.000000] Node 0: aperture @ c100000000 size 32 MB
[    0.000000] Aperture beyond 4GB. Ignoring.
[    0.000000] Subtract (50 early reservations)
[    0.000000]   #1 [0001000000 - 00015305a4]   TEXT DATA BSS
[    0.000000]   #2 [007fcb2000 - 007ff0f000]         RAMDISK
[    0.000000]   #3 [0001531000 - 0001531188]             BRK
[    0.000000]   #4 [00000f81b0 - 0000100000]   BIOS reserved
[    0.000000]   #5 [00000f81a0 - 00000f81b0]    MP-table mpf
[    0.000000]   #6 [000009dc00 - 000009e171]   BIOS reserved
[    0.000000]   #7 [000009e27d - 00000f81a0]   BIOS reserved
[    0.000000]   #8 [000009e171 - 000009e27d]    MP-table mpc
[    0.000000]   #9 [0000010000 - 0000012000]      TRAMPOLINE
[    0.000000]   #10 [0000012000 - 0000016000]     ACPI WAKEUP
[    0.000000]   #11 [0000016000 - 0000018000]         PGTABLE
[    0.000000]   #12 [00015311c0 - 00015321c0]         BOOTMEM
[    0.000000]   #13 [00015305c0 - 0001530740]         BOOTMEM
[    0.000000]   #14 [0001d33000 - 0001d34000]         BOOTMEM
[    0.000000]   #15 [0001d34000 - 0001d35000]         BOOTMEM
[    0.000000]   #16 [0001e00000 - 0003a00000]        MEMMAP 0
[    0.000000]   #17 [0001530740 - 00015308c0]         BOOTMEM
[    0.000000]   #18 [00015321c0 - 000153e1c0]         BOOTMEM
[    0.000000]   #19 [000153f000 - 0001540000]         BOOTMEM
[    0.000000]   #20 [00015308c0 - 0001530901]         BOOTMEM
[    0.000000]   #21 [0001530940 - 0001530983]         BOOTMEM
[    0.000000]   #22 [00015309c0 - 0001530c98]         BOOTMEM
[    0.000000]   #23 [0001530cc0 - 0001530d28]         BOOTMEM
[    0.000000]   #24 [0001530d40 - 0001530da8]         BOOTMEM
[    0.000000]   #25 [0001530dc0 - 0001530e28]         BOOTMEM
[    0.000000]   #26 [0001530e40 - 0001530ea8]         BOOTMEM
[    0.000000]   #27 [0001530ec0 - 0001530f28]         BOOTMEM
[    0.000000]   #28 [0001530f40 - 0001530fa8]         BOOTMEM
[    0.000000]   #29 [000153e1c0 - 000153e228]         BOOTMEM
[    0.000000]   #30 [000153e240 - 000153e2a8]         BOOTMEM
[    0.000000]   #31 [000153e2c0 - 000153e328]         BOOTMEM
[    0.000000]   #32 [000153e340 - 000153e3a8]         BOOTMEM
[    0.000000]   #33 [000153e3c0 - 000153e428]         BOOTMEM
[    0.000000]   #34 [000153e440 - 000153e4a8]         BOOTMEM
[    0.000000]   #35 [0001530fc0 - 0001530fe0]         BOOTMEM
[    0.000000]   #36 [000153e4c0 - 000153e552]         BOOTMEM
[    0.000000]   #37 [000153e580 - 000153e612]         BOOTMEM
[    0.000000]   #38 [0001600000 - 000161c000]         BOOTMEM
[    0.000000]   #39 [0001700000 - 000171c000]         BOOTMEM
[    0.000000]   #40 [000153e640 - 000153e648]         BOOTMEM
[    0.000000]   #41 [000153e680 - 000153e688]         BOOTMEM
[    0.000000]   #42 [000153e6c0 - 000153e6c8]         BOOTMEM
[    0.000000]   #43 [000153e700 - 000153e710]         BOOTMEM
[    0.000000]   #44 [000153e740 - 000153e880]         BOOTMEM
[    0.000000]   #45 [000153e880 - 000153e8e0]         BOOTMEM
[    0.000000]   #46 [000153e900 - 000153e960]         BOOTMEM
[    0.000000]   #47 [0001540000 - 0001548000]         BOOTMEM
[    0.000000]   #48 [000171c000 - 000191c000]         BOOTMEM
[    0.000000]   #49 [000191c000 - 0001a1c000]         BOOTMEM
[    0.000000] Memory: 2055896k/2096192k available (2933k kernel code, 460k absent, 39836k reserved, 1275k data, 456k init)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	CONFIG_RCU_FANOUT set to non-default value of 32
[    0.000000] 	RCU-based detection of stalled CPUs is disabled.
[    0.000000] 	Verbose stalled-CPUs detection is disabled.
[    0.000000] NR_IRQS:512
[    0.000000] Extended CMOS year: 2000
[    0.000000] spurious 8259A interrupt: IRQ7.
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] hpet clockevent registered
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 1607.601 MHz processor.
[    0.003340] Calibrating delay loop (skipped), value calculated using timer frequency.. 3216.16 BogoMIPS (lpj=5358670)
[    0.003441] pid_max: default: 32768 minimum: 301
[    0.003552] Mount-cache hash table entries: 256
[    0.003738] Initializing cgroup subsys ns
[    0.003790] Initializing cgroup subsys cpuacct
[    0.003842] Initializing cgroup subsys memory
[    0.003900] Initializing cgroup subsys devices
[    0.003950] Initializing cgroup subsys freezer
[    0.003999] Initializing cgroup subsys net_cls
[    0.004049] Initializing cgroup subsys blkio
[    0.004121] tseg: 007ff80000
[    0.004124] CPU: Physical Processor ID: 0
[    0.004174] CPU: Processor Core ID: 0
[    0.004223] mce: CPU supports 5 MCE banks
[    0.004282] using C1E aware idle routine
[    0.004330] Performance Events: AMD PMU driver.
[    0.004418] ... version:                0
[    0.004467] ... bit width:              48
[    0.004515] ... generic registers:      4
[    0.004563] ... value mask:             0000ffffffffffff
[    0.004612] ... max period:             00007fffffffffff
[    0.004661] ... fixed-purpose events:   0
[    0.006670] ... event mask:             000000000000000f
[    0.007505] ACPI: Core revision 20100428
[    0.016728] Setting APIC routing to flat
[    0.017350] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.050937] CPU0: AMD Turion(tm) 64 X2 Mobile Technology TL-52 stepping 02
[    0.053332] Booting Node   0, Processors  #1 Ok.
[    0.006666] System has AMD C1E enabled
[    0.143418] Brought up 2 CPUs
[    0.143421] Total of 2 processors activated (6432.71 BogoMIPS).
[    0.143416] Switch to broadcast mode on CPU1
[    0.143895] Switch to broadcast mode on CPU0
[    0.143895] devtmpfs: initialized
[    0.143895] NET: Registered protocol family 16
[    0.143895] node 0 link 0: io port [2000, fffff]
[    0.143895] TOM: 0000000080000000 aka 2048M
[    0.143895] node 0 link 0: mmio [e0000000, efffffff]
[    0.143895] node 0 link 0: mmio [a0000, bffff]
[    0.143895] node 0 link 0: mmio [80000000, fe0bffff]
[    0.143895] bus: [00, ff] on node 0 link 0
[    0.143895] bus: 00 index 0 [io  0x0000-0xffff]
[    0.143895] bus: 00 index 1 [mem 0x80000000-0xfcffffffff]
[    0.143895] bus: 00 index 2 [mem 0x000a0000-0x000bffff]
[    0.143895] ACPI: bus type pci registered
[    0.143895] PCI: MMCONFIG for domain 0000 [bus 00-04] at [mem 0xe0000000-0xe04fffff] (base 0xe0000000)
[    0.143895] PCI: MMCONFIG at [mem 0xe0000000-0xe04fffff] reserved in E820
[    0.143995] PCI: Using configuration type 1 for base access
[    0.146718] bio: create slab <bio-0> at 0
[    0.147603] ACPI: EC: Look up EC in DSDT
[    0.151824] ACPI: BIOS _OSI(Linux) query ignored
[    0.153532] ACPI: Interpreter enabled
[    0.153593] ACPI: (supports S0 S3 S4 S5)
[    0.153846] ACPI: Using IOAPIC for interrupt routing
[    0.166773] ACPI: EC: GPE = 0x1, I/O: command/status = 0x66, data = 0x62
[    0.166961] ACPI: No dock devices found.
[    0.167014] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.167239] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.167324] pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000c0000-0x000c3fff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000c4000-0x000c7fff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000c8000-0x000cbfff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000cc000-0x000cffff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000d0000-0x000d3fff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000d4000-0x000d7fff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000d8000-0x000dbfff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000dc000-0x000dffff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000e0000-0x000e3fff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000e4000-0x000e7fff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000e8000-0x000ebfff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000ec000-0x000effff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x000f0000-0x000fffff] (ignored)
[    0.167324] pci_root PNP0A03:00: host bridge window [mem 0x80000000-0xfebfffff] (ignored)
[    0.167324] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.167324] pci 0000:00:02.0: PME# disabled
[    0.167324] pci 0000:00:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.167324] pci 0000:00:03.0: PME# disabled
[    0.167324] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.167324] pci 0000:00:04.0: PME# disabled
[    0.167544] pci 0000:00:0a.1: reg 20: [io  0x3040-0x307f]
[    0.167550] pci 0000:00:0a.1: reg 24: [io  0x3000-0x303f]
[    0.167576] pci 0000:00:0a.1: PME# supported from D3hot D3cold
[    0.167582] pci 0000:00:0a.1: PME# disabled
[    0.167616] pci 0000:00:0a.3: reg 10: [mem 0xc0040000-0xc007ffff]
[    0.167709] pci 0000:00:0b.0: reg 10: [mem 0xc0004000-0xc0004fff]
[    0.167744] pci 0000:00:0b.0: supports D1 D2
[    0.167747] pci 0000:00:0b.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.167752] pci 0000:00:0b.0: PME# disabled
[    0.167779] pci 0000:00:0b.1: reg 10: [mem 0xc0005000-0xc00050ff]
[    0.167814] pci 0000:00:0b.1: supports D1 D2
[    0.167817] pci 0000:00:0b.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.167821] pci 0000:00:0b.1: PME# disabled
[    0.167860] pci 0000:00:0d.0: reg 20: [io  0x3080-0x308f]
[    0.167939] pci 0000:00:10.1: reg 10: [mem 0xc0000000-0xc0003fff]
[    0.167975] pci 0000:00:10.1: PME# supported from D3hot D3cold
[    0.167980] pci 0000:00:10.1: PME# disabled
[    0.168014] pci 0000:00:14.0: reg 10: [mem 0xc0007000-0xc0007fff]
[    0.168021] pci 0000:00:14.0: reg 14: [io  0x30b8-0x30bf]
[    0.168047] pci 0000:00:14.0: supports D1 D2
[    0.168049] pci 0000:00:14.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.168054] pci 0000:00:14.0: PME# disabled
[    0.168137] PCI: peer root bus 00 res updated from pci conf
[    0.168166] pci 0000:00:02.0: PCI bridge to [bus 01-01]
[    0.168221] pci 0000:00:02.0:   bridge window [io  0xf000-0x0000] (disabled)
[    0.168225] pci 0000:00:02.0:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
[    0.168231] pci 0000:00:02.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
[    0.168256] pci 0000:00:03.0: PCI bridge to [bus 02-02]
[    0.168309] pci 0000:00:03.0:   bridge window [io  0x4000-0x4fff]
[    0.168313] pci 0000:00:03.0:   bridge window [mem 0xc4000000-0xc40fffff]
[    0.168317] pci 0000:00:03.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
[    0.168366] pci 0000:03:00.0: reg 10: [mem 0xc2000000-0xc2ffffff]
[    0.168378] pci 0000:03:00.0: reg 14: [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.168390] pci 0000:03:00.0: reg 1c: [mem 0xc1000000-0xc1ffffff 64bit]
[    0.168395] pci 0000:03:00.0: reg 24: [io  0x4000-0x407f]
[    0.168403] pci 0000:03:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
[    0.168419] pci 0000:03:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    0.168419] pci 0000:00:04.0: PCI bridge to [bus 03-03]
[    0.168419] pci 0000:00:04.0:   bridge window [io  0x4000-0x4fff]
[    0.168419] pci 0000:00:04.0:   bridge window [mem 0xc1000000-0xc2ffffff]
[    0.168419] pci 0000:00:04.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.168419] pci 0000:04:05.0: reg 10: [mem 0xc3000000-0xc300ffff]
[    0.168419] pci 0000:04:06.0: reg 10: [mem 0xc3010000-0xc3010fff]
[    0.168419] pci 0000:04:06.0: supports D1 D2
[    0.168419] pci 0000:04:06.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.168419] pci 0000:04:06.0: PME# disabled
[    0.168419] pci 0000:04:06.2: reg 10: [mem 0xc3012000-0xc3012fff]
[    0.168419] pci 0000:04:06.2: supports D1 D2
[    0.168419] pci 0000:04:06.2: PME# supported from D0 D1 D2 D3hot
[    0.168419] pci 0000:04:06.2: PME# disabled
[    0.168419] pci 0000:00:10.0: PCI bridge to [bus 04-05] (subtractive decode)
[    0.168419] pci 0000:00:10.0:   bridge window [io  0xf000-0x0000] (disabled)
[    0.168419] pci 0000:00:10.0:   bridge window [mem 0xc3000000-0xc30fffff]
[    0.168419] pci 0000:00:10.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
[    0.168419] pci 0000:00:10.0:   bridge window [io  0x0000-0xffff] (subtractive decode)
[    0.168419] pci 0000:00:10.0:   bridge window [mem 0x80000000-0xfcffffffff] (subtractive decode)
[    0.168419] pci 0000:00:10.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
[    0.168419] pci_bus 0000:05: [bus 05-08] partially hidden behind transparent bridge 0000:04 [bus 04-05]
[    0.168419] pci_bus 0000:00: on NUMA node 0
[    0.168419] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.168419] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P2P0._PRT]
[    0.168419] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.XVR0._PRT]
[    0.168419] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.XVR1._PRT]
[    0.168419] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.XVR2._PRT]
[    0.213558] ACPI: PCI Interrupt Link [LNK1] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.214134] ACPI: PCI Interrupt Link [LNK2] (IRQs 16 17 18 19 20 21 22 23) *10
[    0.214676] ACPI: PCI Interrupt Link [LNK3] (IRQs 16 17 18 19 20 21 22 23) *10
[    0.215149] ACPI: PCI Interrupt Link [LNK4] (IRQs 5 7 9 10 *11 14 15)
[    0.215630] ACPI: PCI Interrupt Link [LK1E] (IRQs 16 17 18 19 20 21 22 23) *10
[    0.216171] ACPI: PCI Interrupt Link [LK2E] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.216308] ACPI: PCI Interrupt Link [LK3E] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.216308] ACPI: PCI Interrupt Link [LK4E] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.216308] ACPI: PCI Interrupt Link [LSMB] (IRQs 16 17 18 19 20 21 22 23) *10
[    0.216308] ACPI: PCI Interrupt Link [LSMU] (IRQs 16 17 18 19 20 21 22 23) *11
[    0.216308] ACPI: PCI Interrupt Link [LUS0] (IRQs 16 17 18 19 20 21 22 23) *11
[    0.216536] ACPI: PCI Interrupt Link [LUS2] (IRQs 16 17 18 19 20 21 22 23) *7
[    0.217080] ACPI: PCI Interrupt Link [LMAC] (IRQs 16 17 18 19 20 21 22 23) *11
[    0.217630] ACPI: PCI Interrupt Link [LAZA] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.218201] ACPI: PCI Interrupt Link [LACI] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.218770] ACPI: PCI Interrupt Link [LMCI] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.219338] ACPI: PCI Interrupt Link [LPID] (IRQs 16 17 18 19 20 21 22 23) *0, disabled.
[    0.219919] ACPI: PCI Interrupt Link [LTID] (IRQs 16 17 18 19 20 21 22 23) *5
[    0.220461] ACPI: PCI Interrupt Link [LSI1] (IRQs 16 17 18 19 20 21 22 23) *0
[    0.223354] HEST: Table is not found!
[    0.223404] vgaarb: device added: PCI:0000:03:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.223430] vgaarb: loaded
[    0.223477] PCI: Using ACPI for IRQ routing
[    0.223477] PCI: pci_cache_line_size set to 64 bytes
[    0.223477] pci 0000:00:04.0: address space collision: [io  0x4000-0x4fff] conflicts with PCI Bus 0000:02 [io  0x4000-0x4fff]
[    0.223518] pci 0000:03:00.0: no compatible bridge window for [io  0x4000-0x407f]
[    0.223613] reserve RAM buffer: 000000000009dc00 - 000000000009ffff 
[    0.223616] reserve RAM buffer: 000000007ff10000 - 000000007fffffff 
[    0.223638] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
[    0.223638] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 31
[    0.223638] hpet0: 3 comparators, 32-bit 25.000000 MHz counter
[    0.233372] Switching to clocksource hpet
[    0.234673] pnp: PnP ACPI init
[    0.234735] ACPI: bus type pnp registered
[    0.235870] pnp 00:03: disabling [io  0x0010-0x001f] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.235926] pnp 00:03: disabling [io  0x0022-0x003f] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.235980] pnp 00:03: disabling [io  0x0044-0x005f] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.236034] pnp 00:03: disabling [io  0x0063] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.236087] pnp 00:03: disabling [io  0x0065] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.236140] pnp 00:03: disabling [io  0x0067-0x006f] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.236193] pnp 00:03: disabling [io  0x0072-0x0073] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.236247] pnp 00:03: disabling [io  0x0074-0x007f] because it overlaps 0000:03:00.0 BAR 5 [io  0x0000-0x007f]
[    0.239176] pnp: PnP ACPI: found 11 devices
[    0.239217] ACPI: ACPI bus type pnp unregistered
[    0.239271] system 00:01: [mem 0xe0000000-0xefffffff] has been reserved
[    0.239317] system 00:02: [io  0x1000-0x107f] has been reserved
[    0.239359] system 00:02: [io  0x1080-0x10ff] has been reserved
[    0.239401] system 00:02: [io  0x1400-0x147f] has been reserved
[    0.239445] system 00:02: [io  0x1480-0x14ff] has been reserved
[    0.239488] system 00:02: [io  0x1800-0x187f] has been reserved
[    0.239530] system 00:02: [io  0x1880-0x18ff] has been reserved
[    0.239572] system 00:02: [io  0x2000-0x203f] has been reserved
[    0.239617] system 00:03: [io  0x0360-0x0361] has been reserved
[    0.239659] system 00:03: [io  0x04d0-0x04d1] has been reserved
[    0.245164] pci 0000:00:10.0: BAR 9: assigned [mem 0x80000000-0x83ffffff pref]
[    0.245216] pci 0000:00:04.0: BAR 7: assigned [io  0x5000-0x5fff]
[    0.245258] pci 0000:00:10.0: BAR 7: assigned [io  0x6000-0x6fff]
[    0.245300] pci 0000:00:02.0: PCI bridge to [bus 01-01]
[    0.245340] pci 0000:00:02.0:   bridge window [io  disabled]
[    0.245381] pci 0000:00:02.0:   bridge window [mem disabled]
[    0.245422] pci 0000:00:02.0:   bridge window [mem pref disabled]
[    0.245465] pci 0000:00:03.0: PCI bridge to [bus 02-02]
[    0.245506] pci 0000:00:03.0:   bridge window [io  0x4000-0x4fff]
[    0.245548] pci 0000:00:03.0:   bridge window [mem 0xc4000000-0xc40fffff]
[    0.245590] pci 0000:00:03.0:   bridge window [mem pref disabled]
[    0.245634] pci 0000:03:00.0: BAR 6: can't assign mem pref (size 0x20000)
[    0.245677] pci 0000:03:00.0: BAR 5: assigned [io  0x5000-0x507f]
[    0.245721] pci 0000:03:00.0: BAR 5: set to [io  0x5000-0x507f] (PCI address [0x5000-0x507f]
[    0.245772] pci 0000:00:04.0: PCI bridge to [bus 03-03]
[    0.245813] pci 0000:00:04.0:   bridge window [io  0x5000-0x5fff]
[    0.245855] pci 0000:00:04.0:   bridge window [mem 0xc1000000-0xc2ffffff]
[    0.245898] pci 0000:00:04.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.245952] pci 0000:04:06.0: BAR 9: assigned [mem 0x80000000-0x83ffffff pref]
[    0.246003] pci 0000:04:06.0: BAR 10: assigned [mem 0x84000000-0x87ffffff]
[    0.246045] pci 0000:04:06.0: BAR 7: assigned [io  0x6000-0x60ff]
[    0.246087] pci 0000:04:06.0: BAR 8: assigned [io  0x6400-0x64ff]
[    0.246129] pci 0000:04:06.0: CardBus bridge to [bus 05-08]
[    0.246169] pci 0000:04:06.0:   bridge window [io  0x6000-0x60ff]
[    0.246213] pci 0000:04:06.0:   bridge window [io  0x6400-0x64ff]
[    0.246257] pci 0000:04:06.0:   bridge window [mem 0x80000000-0x83ffffff pref]
[    0.246308] pci 0000:04:06.0:   bridge window [mem 0x84000000-0x87ffffff]
[    0.246352] pci 0000:00:10.0: PCI bridge to [bus 04-05]
[    0.246393] pci 0000:00:10.0:   bridge window [io  0x6000-0x6fff]
[    0.246436] pci 0000:00:10.0:   bridge window [mem 0xc3000000-0xc30fffff]
[    0.246479] pci 0000:00:10.0:   bridge window [mem 0x80000000-0x83ffffff pref]
[    0.246538] pci 0000:00:02.0: setting latency timer to 64
[    0.246544] pci 0000:00:03.0: setting latency timer to 64
[    0.246550] pci 0000:00:04.0: setting latency timer to 64
[    0.246556] pci 0000:00:10.0: setting latency timer to 64
[    0.246783] ACPI: PCI Interrupt Link [LNK4] enabled at IRQ 11
[    0.246834] pci 0000:04:06.0: PCI INT A -> Link[LNK4] -> GSI 11 (level, low) -> IRQ 11
[    0.246888] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.246891] pci_bus 0000:00: resource 5 [mem 0x80000000-0xfcffffffff]
[    0.246894] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.246898] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.246901] pci_bus 0000:02: resource 1 [mem 0xc4000000-0xc40fffff]
[    0.246904] pci_bus 0000:03: resource 0 [io  0x5000-0x5fff]
[    0.246907] pci_bus 0000:03: resource 1 [mem 0xc1000000-0xc2ffffff]
[    0.246911] pci_bus 0000:03: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.246914] pci_bus 0000:04: resource 0 [io  0x6000-0x6fff]
[    0.246918] pci_bus 0000:04: resource 1 [mem 0xc3000000-0xc30fffff]
[    0.246921] pci_bus 0000:04: resource 2 [mem 0x80000000-0x83ffffff pref]
[    0.246924] pci_bus 0000:04: resource 4 [io  0x0000-0xffff]
[    0.246927] pci_bus 0000:04: resource 5 [mem 0x80000000-0xfcffffffff]
[    0.246930] pci_bus 0000:04: resource 6 [mem 0x000a0000-0x000bffff]
[    0.246934] pci_bus 0000:05: resource 0 [io  0x6000-0x60ff]
[    0.246937] pci_bus 0000:05: resource 1 [io  0x6400-0x64ff]
[    0.246940] pci_bus 0000:05: resource 2 [mem 0x80000000-0x83ffffff pref]
[    0.246944] pci_bus 0000:05: resource 3 [mem 0x84000000-0x87ffffff]
[    0.247019] NET: Registered protocol family 2
[    0.247115] IP route cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.247786] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[    0.251243] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.252109] TCP: Hash tables configured (established 262144 bind 65536)
[    0.252153] TCP reno registered
[    0.252194] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    0.252262] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    0.252458] NET: Registered protocol family 1
[    0.252556] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.252618] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.252686] pci 0000:00:00.0: Found enabled HT MSI Mapping
[    0.467619] pci 0000:00:09.0: Found enabled HT MSI Mapping
[    0.467710] pci 0000:00:09.0: Found enabled HT MSI Mapping
[    0.467770] pci 0000:03:00.0: Boot video device
[    0.467782] PCI: CLS 64 bytes, default 64
[    0.467837] Unpacking initramfs...
[    0.541401] Freeing initrd memory: 2420k freed
[    0.543646] Simple Boot Flag at 0x36 set to 0x1
[    0.548934] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.549483] VFS: Disk quotas dquot_6.5.2
[    0.549555] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.549677] msgmni has been set to 4020
[    0.550255] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
[    0.550316] io scheduler noop registered
[    0.550363] io scheduler deadline registered
[    0.552522] io scheduler cfq registered (default)
[    0.552824] pcieport 0000:00:02.0: setting latency timer to 64
[    0.552853] pcieport 0000:00:02.0: irq 40 for MSI/MSI-X
[    0.553611] pcieport 0000:00:03.0: setting latency timer to 64
[    0.553637] pcieport 0000:00:03.0: irq 41 for MSI/MSI-X
[    0.554354] pcieport 0000:00:04.0: setting latency timer to 64
[    0.554380] pcieport 0000:00:04.0: irq 42 for MSI/MSI-X
[    0.557042] ERST: Table is not found!
[    0.622590] Real Time Clock Driver v1.12b
[    0.624412] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.632088] PNP: PS/2 Controller [PNP0303:KBD0,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.633186] i8042.c: Detected active multiplexing controller, rev 1.1.
[    0.633324] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.633376] serio: i8042 AUX0 port at 0x60,0x64 irq 12
[    0.633417] serio: i8042 AUX1 port at 0x60,0x64 irq 12
[    0.633458] serio: i8042 AUX2 port at 0x60,0x64 irq 12
[    0.633499] serio: i8042 AUX3 port at 0x60,0x64 irq 12
[    0.636971] mice: PS/2 mouse device common for all mice
[    0.641288] input: PC Speaker as /devices/platform/pcspkr/input/input0
[    0.644591] cpuidle: using governor ladder
[    0.644644] cpuidle: using governor menu
[    0.644781] TCP cubic registered
[    0.644829] NET: Registered protocol family 17
[    0.648413] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
[    0.652415] Freeing unused kernel memory: 456k freed
[    0.654389] Processing INITRAMFS
[    0.659681] loading module sd_mod
[    0.678627] SCSI subsystem initialized
[    0.828558] libata version 3.00 loaded.
[    0.831109] pata_amd 0000:00:0d.0: version 0.4.1
[    0.831164] pata_amd 0000:00:0d.0: setting latency timer to 64
[    0.831248] scsi0 : pata_amd
[    0.832659] scsi1 : pata_amd
[    0.833769] ata1: PATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0x3080 irq 14
[    0.833813] ata2: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0x3088 irq 15
[    0.990685] ata1.00: ATA-7: Hitachi HTS541612J9AT00, SBDOA70H, max UDMA/100
[    0.990741] ata1.00: 234441648 sectors, multi 16: LBA48 
[    0.990817] ata1: nv_mode_filter: 0x3f39f&0x3f39f->0x3f39f, BIOS=0x3f000 (0xc600c000) ACPI=0x3f01f (20:600:0x13)
[    1.003962] ata1.00: configured for UDMA/100
[    1.004196] scsi 0:0:0:0: Direct-Access     ATA      Hitachi HTS54161 SBDO PQ: 0 ANSI: 5
[    1.005984] sd 0:0:0:0: [sda] 234441648 512-byte logical blocks: (120 GB/111 GiB)
[    1.006104] sd 0:0:0:0: [sda] Write Protect is off
[    1.006154] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.006180] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.006430]  sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 >
[    1.116201] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.203798] ata2.00: ATAPI: Slimtype DVDRW SSM-8515S, GRS6, max UDMA/33
[    1.203878] ata2: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000 (0xc600c000) ACPI=0x701f (60:600:0x13)
[    1.240411] ata2.00: configured for UDMA/33
[    1.243808] scsi 1:0:0:0: CD-ROM            Slimtype DVDRW SSM-8515S  GRS6 PQ: 0 ANSI: 5
[    1.285232] trying to resume from /dev/sda8 (8:8)
[    1.285314] PM: Starting manual resume from disk
[    1.285569] warning: resume from /dev/sda8 (8:8) failed, continuing
[    1.286035] warning: root device /dev/sda3 does not exist
[    1.286097] mounting ext4 fs on /dev/sda3 (options: commit=60)
[    1.374974] EXT4-fs (sda3): recovery complete
[    1.375334] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: commit=60
[    3.431483] ACPI: AC Adapter [ADP1] (on-line)
[    3.436088] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    3.439358] ACPI: Lid Switch [LID0]
[    3.439478] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input3
[    3.439533] ACPI: Sleep Button [SLPB]
[    3.439622] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input4
[    3.439674] ACPI: Power Button [PWRB]
[    3.439792] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input5
[    3.439846] ACPI: Power Button [PWRF]
[    3.444438] ACPI: EC: GPE storm detected, transactions will use polling mode
[    3.610485] ACPI: WMI: Mapper loaded
[    3.645097] forcedeth: Reverse Engineered nForce ethernet driver. Version 0.64.
[    3.645539] ACPI: PCI Interrupt Link [LMAC] enabled at IRQ 23
[    3.645592] forcedeth 0000:00:14.0: PCI INT A -> Link[LMAC] -> GSI 23 (level, high) -> IRQ 23
[    3.645646] forcedeth 0000:00:14.0: setting latency timer to 64
[    3.645711] nv_probe: set workaround bit for reversed mac addr
[    3.665626] usbcore: registered new interface driver usbfs
[    3.665709] usbcore: registered new interface driver hub
[    3.671827] usbcore: registered new device driver usb
[    3.770751] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.890048] ACPI: acpi_idle registered with cpuidle
[    3.890102] ACPI: processor limited to max C-state 1
[    4.160709] forcedeth 0000:00:14.0: ifname eth0, PHY OUI 0x732 @ 1, addr 00:16:d3:4a:02:7a
[    4.160766] forcedeth 0000:00:14.0: highdma pwrctl gbit lnktim desc-v3
[    4.160850] k8temp 0000:00:18.3: Temperature readouts might be wrong - check erratum #141
[    4.161374] ACPI: PCI Interrupt Link [LUS2] enabled at IRQ 22
[    4.161431] ehci_hcd 0000:00:0b.1: PCI INT B -> Link[LUS2] -> GSI 22 (level, high) -> IRQ 22
[    4.161506] ehci_hcd 0000:00:0b.1: setting latency timer to 64
[    4.161510] ehci_hcd 0000:00:0b.1: EHCI Host Controller
[    4.161578] ehci_hcd 0000:00:0b.1: new USB bus registered, assigned bus number 1
[    4.161661] ehci_hcd 0000:00:0b.1: debug port 1
[    4.161706] ehci_hcd 0000:00:0b.1: cache line size of 64 is not supported
[    4.161731] ehci_hcd 0000:00:0b.1: irq 22, io mem 0xc0005000
[    4.170051] ehci_hcd 0000:00:0b.1: USB 2.0 started, EHCI 1.00
[    4.170124] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    4.170167] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.170217] usb usb1: Product: EHCI Host Controller
[    4.170257] usb usb1: Manufacturer: Linux 2.6.35-amd64 ehci_hcd
[    4.170297] usb usb1: SerialNumber: 0000:00:0b.1
[    4.170482] hub 1-0:1.0: USB hub found
[    4.170527] hub 1-0:1.0: 8 ports detected
[    4.258450] Synaptics Touchpad, model: 1, fw: 6.2, id: 0x1280b1, caps: 0xa04713/0x204000/0x0
[    4.288955] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio4/input/input6
[    4.477556] usb 1-6: new high speed USB device using ehci_hcd and address 2
[    4.608697] usb 1-6: New USB device found, idVendor=0402, idProduct=5602
[    4.608753] usb 1-6: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    4.608805] usb 1-6: Product: USB2.0 Camera
[    4.681060] thermal LNXTHERM:01: registered as thermal_zone0
[    4.681115] ACPI: Thermal Zone [TZS0] (65 C)
[    4.766959] ACPI: Battery Slot [BAT0] (battery present)
[    4.811005] thermal LNXTHERM:02: registered as thermal_zone1
[    4.811068] ACPI: Thermal Zone [TZS1] (68 C)
[    4.968387] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[    4.968452] Uniform CD-ROM driver Revision: 3.20
[    4.968617] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    4.993660] yenta_cardbus 0000:04:06.0: CardBus bridge found [1025:0112]
[    4.993735] yenta_cardbus 0000:04:06.0: Using CSCINT to route CSC interrupts to PCI
[    4.993796] yenta_cardbus 0000:04:06.0: Routing CardBus interrupts to PCI
[    4.993851] yenta_cardbus 0000:04:06.0: TI: mfunc 0x013a1b22, devctl 0x64
[    4.998643] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    4.998735] sr 1:0:0:0: Attached scsi generic sg1 type 5
[    5.141446] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    5.141921] ACPI: PCI Interrupt Link [LUS0] enabled at IRQ 21
[    5.141985] ohci_hcd 0000:00:0b.0: PCI INT A -> Link[LUS0] -> GSI 21 (level, high) -> IRQ 21
[    5.142066] ohci_hcd 0000:00:0b.0: setting latency timer to 64
[    5.142071] ohci_hcd 0000:00:0b.0: OHCI Host Controller
[    5.142136] ohci_hcd 0000:00:0b.0: new USB bus registered, assigned bus number 2
[    5.142237] ohci_hcd 0000:00:0b.0: irq 21, io mem 0xc0004000
[    5.195434] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    5.195486] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.195545] usb usb2: Product: OHCI Host Controller
[    5.195593] usb usb2: Manufacturer: Linux 2.6.35-amd64 ohci_hcd
[    5.195643] usb usb2: SerialNumber: 0000:00:0b.0
[    5.195837] hub 2-0:1.0: USB hub found
[    5.195899] hub 2-0:1.0: 8 ports detected
[    5.221651] yenta_cardbus 0000:04:06.0: ISA IRQ mask 0x04f8, PCI irq 11
[    5.221698] yenta_cardbus 0000:04:06.0: Socket status: 30000006
[    5.221741] pci_bus 0000:04: Raising subordinate bus# of parent bus (#04) from #05 to #08
[    5.269485] i2c i2c-0: nForce2 SMBus adapter at 0x3040
[    5.269546] i2c i2c-1: nForce2 SMBus adapter at 0x3000
[    5.279364] cfg80211: Calling CRDA to update world regulatory domain
[    5.312022] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:18/LNXVIDEO:01/input/input7
[    5.312140] ACPI: Video Device [VGA1] (multi-head: yes  rom: no  post: no)
[    5.407496] usbcore: registered new interface driver usbserial
[    5.407649] USB Serial support registered for generic
[    5.407722] usbcore: registered new interface driver usbserial_generic
[    5.407763] usbserial: USB Serial Driver core
[    5.555878] USB Serial support registered for GSM modem (1-port)
[    5.555968] usbcore: registered new interface driver option
[    5.556011] option: v0.7.2:USB Driver for GSM modems
[    5.969357] ACPI: PCI Interrupt Link [LNK2] enabled at IRQ 20
[    5.969414] ath5k 0000:04:05.0: PCI INT A -> Link[LNK2] -> GSI 20 (level, high) -> IRQ 20
[    5.969531] ath5k 0000:04:05.0: registered as 'phy0'
[    6.671428] ath: EEPROM regdomain: 0x63
[    6.671431] ath: EEPROM indicates we should expect a direct regpair map
[    6.671436] ath: Country alpha2 being used: 00
[    6.671438] ath: Regpair used: 0x63
[    6.691402] acer-wmi: Acer Laptop ACPI-WMI Extras
[    6.716098] HDA Intel 0000:00:10.1: power state changed by ACPI to D0
[    6.716185] HDA Intel 0000:00:10.1: power state changed by ACPI to D0
[    6.716556] ACPI: PCI Interrupt Link [LAZA] enabled at IRQ 19
[    6.716609] HDA Intel 0000:00:10.1: PCI INT B -> Link[LAZA] -> GSI 19 (level, high) -> IRQ 19
[    6.716684] hda_intel: Disable MSI for Nvidia chipset
[    6.716780] HDA Intel 0000:00:10.1: setting latency timer to 64
[    6.833836] phy0: Selected rate control algorithm 'minstrel'
[    6.833985] ath5k phy0: Atheros AR2413 chip found (MAC: 0x78, PHY: 0x45)
[    7.380727] hda_codec: ALC883: SKU not ready 0x411111f0
[    8.342639] Adding 4194268k swap on /dev/sda8.  Priority:-1 extents:1 across:4194268k 
[    8.418221] EXT4-fs (sda3): re-mounted. Opts: (null)
[    9.159527] EXT4-fs (sda3): re-mounted. Opts: commit=600
[    9.587848] netconsole: local port 4331
[    9.587903] netconsole: local IP 192.168.88.6
[    9.587950] netconsole: interface 'eth0'
[    9.588001] netconsole: remote port 3265
[    9.588049] netconsole: remote IP 192.168.88.2
[    9.588097] netconsole: remote ethernet address 00:22:15:2c:8d:8b
[    9.588148] netconsole: device eth0 not up yet, forcing it
[    9.590132] netconsole: carrier detect appears untrustworthy, waiting 4 seconds
[   13.631795] console [netcon0] enabled
[   13.631837] netconsole: network logging started
[   13.669308] powernow-k8: Found 1 AMD Turion(tm) 64 X2 Mobile Technology TL-52 (2 cpu cores) (version 2.20.00)
[   13.669480] powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x12
[   13.669523] powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x1e
[   14.003389] Clocksource tsc unstable (delta = -116289603 ns)
[   15.179351] fuse init (API version 7.14)
[   15.735486] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: commit=600
[   15.838362] EXT4-fs (sda6): mounted filesystem with ordered data mode. Opts: commit=600
[   18.512089] kvm: Nested Virtualization enabled
[   21.714930] Linux agpgart interface v0.103
[   76.815928] [drm] Initialized drm 1.1.0 20060810
[   87.498617] ACPI: PCI Interrupt Link [LK1E] enabled at IRQ 18
[   87.498695] nouveau 0000:03:00.0: PCI INT A -> Link[LK1E] -> GSI 18 (level, high) -> IRQ 18
[   87.498758] nouveau 0000:03:00.0: setting latency timer to 64
[   87.510598] [drm] nouveau 0000:03:00.0: Detected an NV40 generation card (0x04b800b1)
[   87.514107] [drm] nouveau 0000:03:00.0: Attempting to load BIOS image from PRAMIN
[   87.628597] [drm] nouveau 0000:03:00.0: ... appears to be valid
[   87.628643] [drm] nouveau 0000:03:00.0: BIT BIOS found
[   87.628684] [drm] nouveau 0000:03:00.0: Bios version 05.73.22.47
[   87.628727] [drm] nouveau 0000:03:00.0: TMDS table version 1.1
[   87.628768] [drm] nouveau 0000:03:00.0: TMDS table script pointers not stubbed
[   87.628818] [drm] nouveau 0000:03:00.0: BIT table 'd' not found
[   87.628860] [drm] nouveau 0000:03:00.0: Found Display Configuration Block version 3.0
[   87.628912] [drm] nouveau 0000:03:00.0: Raw DCB entry 0: 03005323 00000004
[   87.628955] [drm] nouveau 0000:03:00.0: Raw DCB entry 1: 01010300 00000028
[   87.628998] [drm] nouveau 0000:03:00.0: Raw DCB entry 2: 020223f1 0020c070
[   87.629041] [drm] nouveau 0000:03:00.0: DCB connector table: VHER 0x30 5 10 2
[   87.629085] [drm] nouveau 0000:03:00.0:   0: 0x00002030: type 0x30 idx 0 tag 0x08
[   87.629136] [drm] nouveau 0000:03:00.0:   1: 0x00001130: type 0x30 idx 1 tag 0x07
[   87.629187] [drm] nouveau 0000:03:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[   87.629238] [drm] nouveau 0000:03:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[   87.629288] [drm] nouveau 0000:03:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[   87.629339] [drm] nouveau 0000:03:00.0:   5: 0x00000340: type 0x40 idx 5 tag 0xff
[   87.629394] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 0 at offset 0xD00A
[   87.629721] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 1 at offset 0xD6B4
[   87.666720] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 2 at offset 0xDDAB
[   87.666787] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 3 at offset 0xDF2F
[   87.686724] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 4 at offset 0xE134
[   87.686787] [drm] nouveau 0000:03:00.0: Detected 128MiB VRAM
[   87.707364] [TTM] Zone  kernel: Available graphics memory: 1029386 kiB.
[   87.707419] [TTM] Initializing pool allocator.
[   87.708879] [drm] nouveau 0000:03:00.0: 64 MiB GART (aperture)
[   87.709261] [drm] nouveau 0000:03:00.0: Saving VGA fonts
[   87.779552] [drm] nouveau 0000:03:00.0: Allocating FIFO number 0
[   87.781067] [drm] nouveau 0000:03:00.0: nouveau_channel_alloc: initialised FIFO 0
[   87.781125] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on lvds encoder (output 0)
[   87.781199] [drm] nouveau 0000:03:00.0: Calling LVDS script 6:
[   87.781256] [drm] nouveau 0000:03:00.0: 0xC1DD: Parsing digital output script table
[   88.060074] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on vga encoder (output 1)
[   88.060149] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on TV encoder (output 2)
[   88.254611] [drm] nouveau 0000:03:00.0: allocated 1440x900 fb: 0x48000, bo ffff88007e4d5400
[   88.254830] fbcon: nouveaufb (fb0) is primary device
[   88.266962] [drm] nouveau 0000:03:00.0: Calling LVDS script 2:
[   88.266972] [drm] nouveau 0000:03:00.0: 0xC253: Parsing digital output script table
[   88.430979] [drm] nouveau 0000:03:00.0: Setting dpms mode 0 on lvds encoder (output 0)
[   88.430986] [drm] nouveau 0000:03:00.0: Calling LVDS script 5:
[   88.430991] [drm] nouveau 0000:03:00.0: 0xC1CE: Parsing digital output script table
[   88.431005] [drm] nouveau 0000:03:00.0: Output LVDS-1 is running on CRTC 0 using output A
[   88.432725] Console: switching to colour frame buffer device 180x56
[   88.434627] fb0: nouveaufb frame buffer device
[   88.434644] drm: registered panic notifier
[   88.434662] Slow work thread pool: Starting up
[   88.434884] Slow work thread pool: Ready
[   88.434915] [drm] Initialized nouveau 0.0.16 v2.6.35-rc3-916-gc6ba3d3cc507a575f for 0000:03:00.0 on minor 0
[  180.130840] eth0: link down.
[  183.035225] eth0: link up.
[  321.891247] PM: Syncing filesystems ... done.
[  322.492016] Freezing user space processes ... (elapsed 0.01 seconds) done.
[  322.503449] Freezing remaining freezable tasks ... (elapsed 0.01 seconds) done.
[  322.516813] Suspending console(s) (use no_console_suspend to debug)
[  322.571068] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  322.602258] [drm] nouveau 0000:03:00.0: Disabling fbcon acceleration...
[  322.602265] [drm] nouveau 0000:03:00.0: Unpinning framebuffer(s)...
[  322.602304] [drm] nouveau 0000:03:00.0: Evicting buffers...
[  322.604116] forcedeth 0000:00:14.0: PCI INT A disabled
[  322.604289] ehci_hcd 0000:00:0b.1: PCI INT B disabled
[  322.604313] ohci_hcd 0000:00:0b.0: PCI INT A disabled
[  322.605825] [drm] nouveau 0000:03:00.0: Idling channels...
[  322.606695] [drm] nouveau 0000:03:00.0: Suspending GPU objects...
[  322.609293] sd 0:0:0:0: [sda] Stopping disk
[  322.904201] HDA Intel 0000:00:10.1: PCI INT B disabled
[  322.917642] HDA Intel 0000:00:10.1: power state changed by ACPI to D3
[  323.120296] [drm] nouveau 0000:03:00.0: And we're gone!
[  323.120344] nouveau 0000:03:00.0: PCI INT A disabled
[  323.133487] PM: suspend of devices complete after 616.049 msecs
[  323.173785] PM: late suspend of devices complete after 40.288 msecs
[  323.203459] ACPI: Preparing to enter system sleep state S3
[  323.307628] PM: Saving platform NVS memory
[  323.317725] Disabling non-boot CPUs ...
[  323.346874] ACPI Exception: AE_BAD_PARAMETER, Returned by Handler for [EmbeddedControl] (20100428/evregion-474)
[  323.346895] ACPI Error (psparse-0537): Method parse/execution failed [\_SB_.AMW0.WMCA] (Node ffff88007f859650), AE_BAD_PARAMETER
[  323.355600] CPU 1 is now offline
[  323.355606] SMP alternatives: switching to UP code
[  323.366049] Extended CMOS year: 2000
[  323.366049] Back to C!
[  323.366049] PM: Restoring platform NVS memory
[  323.366049] Extended CMOS year: 2000
[  323.368087] Enabling non-boot CPUs ...
[  323.368347] SMP alternatives: switching to SMP code
[  323.373062] Booting Node 0 Processor 1 APIC 0x1
[  323.365027] Switch to broadcast mode on CPU1
[  323.480264] CPU1 is up
[  323.480567] ACPI: Waking up from system sleep state S3
[  323.647987] pci 0000:00:00.1: restoring config space at offset 0x1 (was 0x200100, writing 0x40200100)
[  323.648110] pcieport 0000:00:02.0: restoring config space at offset 0xf (was 0x0, writing 0x400ff)
[  323.648121] pcieport 0000:00:02.0: restoring config space at offset 0x9 (was 0x10011, writing 0x1fff1)
[  323.648129] pcieport 0000:00:02.0: restoring config space at offset 0x8 (was 0x10, writing 0xfff0)
[  323.648137] pcieport 0000:00:02.0: restoring config space at offset 0x7 (was 0x101, writing 0x1f1)
[  323.648144] pcieport 0000:00:02.0: restoring config space at offset 0x6 (was 0x0, writing 0x10100)
[  323.648153] pcieport 0000:00:02.0: restoring config space at offset 0x3 (was 0x10000, writing 0x10010)
[  323.648162] pcieport 0000:00:02.0: restoring config space at offset 0x1 (was 0x100000, writing 0x100407)
[  323.648216] pci 0000:00:00.0: Found enabled HT MSI Mapping
[  323.648235] pcieport 0000:00:03.0: restoring config space at offset 0xf (was 0x0, writing 0x400ff)
[  323.648245] pcieport 0000:00:03.0: restoring config space at offset 0x9 (was 0x10011, writing 0x1fff1)
[  323.648253] pcieport 0000:00:03.0: restoring config space at offset 0x8 (was 0x10, writing 0xc400c400)
[  323.648261] pcieport 0000:00:03.0: restoring config space at offset 0x7 (was 0x101, writing 0x4141)
[  323.648269] pcieport 0000:00:03.0: restoring config space at offset 0x6 (was 0x0, writing 0x20200)
[  323.648278] pcieport 0000:00:03.0: restoring config space at offset 0x3 (was 0x10000, writing 0x10010)
[  323.648286] pcieport 0000:00:03.0: restoring config space at offset 0x1 (was 0x100000, writing 0x100407)
[  323.648340] pci 0000:00:00.0: Found enabled HT MSI Mapping
[  323.648362] pcieport 0000:00:04.0: restoring config space at offset 0x7 (was 0x4141, writing 0x5151)
[  323.648373] pcieport 0000:00:04.0: restoring config space at offset 0x1 (was 0x100007, writing 0x100407)
[  323.648434] pci 0000:00:00.0: Found enabled HT MSI Mapping
[  323.648599] pci 0000:00:0a.3: restoring config space at offset 0xf (was 0x1030200, writing 0x103020b)
[  323.648673] ohci_hcd 0000:00:0b.0: restoring config space at offset 0x1 (was 0xb00007, writing 0xb00003)
[  323.648717] ehci_hcd 0000:00:0b.1: restoring config space at offset 0x1 (was 0xb00006, writing 0xb00002)
[  323.648778] pci 0000:00:10.0: restoring config space at offset 0x9 (was 0xfff0, writing 0x83f08000)
[  323.648787] pci 0000:00:10.0: restoring config space at offset 0x7 (was 0x28000f0, writing 0x2806060)
[  323.648795] pci 0000:00:10.0: restoring config space at offset 0x6 (was 0x40050400, writing 0x40080400)
[  323.648868] pci 0000:00:09.0: Found enabled HT MSI Mapping
[  323.648886] HDA Intel 0000:00:10.1: restoring config space at offset 0xf (was 0x5020200, writing 0x502020a)
[  323.648904] HDA Intel 0000:00:10.1: restoring config space at offset 0x4 (was 0x0, writing 0xc0000000)
[  323.648914] HDA Intel 0000:00:10.1: restoring config space at offset 0x1 (was 0xb00000, writing 0xb00002)
[  323.648988] pci 0000:00:09.0: Found enabled HT MSI Mapping
[  323.649086] nouveau 0000:03:00.0: restoring config space at offset 0xf (was 0x100, writing 0x10a)
[  323.649099] nouveau 0000:03:00.0: restoring config space at offset 0x9 (was 0x1, writing 0x5001)
[  323.649108] nouveau 0000:03:00.0: restoring config space at offset 0x7 (was 0x4, writing 0xc1000004)
[  323.649117] nouveau 0000:03:00.0: restoring config space at offset 0x5 (was 0xc, writing 0xd000000c)
[  323.649126] nouveau 0000:03:00.0: restoring config space at offset 0x4 (was 0x0, writing 0xc2000000)
[  323.649134] nouveau 0000:03:00.0: restoring config space at offset 0x3 (was 0x0, writing 0x10)
[  323.649144] nouveau 0000:03:00.0: restoring config space at offset 0x1 (was 0x100000, writing 0x100007)
[  323.649175] ath5k 0000:04:05.0: restoring config space at offset 0xf (was 0x1c0a0100, writing 0x1c0a010a)
[  323.649196] ath5k 0000:04:05.0: restoring config space at offset 0x4 (was 0x0, writing 0xc3000000)
[  323.649205] ath5k 0000:04:05.0: restoring config space at offset 0x3 (was 0x0, writing 0xa810)
[  323.649215] ath5k 0000:04:05.0: restoring config space at offset 0x1 (was 0x2900000, writing 0x2900016)
[  323.649238] yenta_cardbus 0000:04:06.0: restoring config space at offset 0xf (was 0x3c001ff, writing 0x5c0010a)
[  323.649247] yenta_cardbus 0000:04:06.0: restoring config space at offset 0xe (was 0x0, writing 0x64fc)
[  323.649256] yenta_cardbus 0000:04:06.0: restoring config space at offset 0xd (was 0x0, writing 0x6400)
[  323.649265] yenta_cardbus 0000:04:06.0: restoring config space at offset 0xc (was 0x0, writing 0x60fc)
[  323.649275] yenta_cardbus 0000:04:06.0: restoring config space at offset 0xb (was 0x0, writing 0x6000)
[  323.649284] yenta_cardbus 0000:04:06.0: restoring config space at offset 0xa (was 0x0, writing 0x87fff000)
[  323.649294] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x9 (was 0x0, writing 0x84000000)
[  323.649303] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x8 (was 0x0, writing 0x83fff000)
[  323.649312] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x7 (was 0x0, writing 0x80000000)
[  323.649321] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x6 (was 0x0, writing 0xb0080504)
[  323.649331] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x4 (was 0x0, writing 0xc3010000)
[  323.649341] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x3 (was 0x824010, writing 0x82a810)
[  323.649352] yenta_cardbus 0000:04:06.0: restoring config space at offset 0x1 (was 0x2100000, writing 0x2100007)
[  323.649390] pci 0000:04:06.2: restoring config space at offset 0xf (was 0x40701ff, writing 0x407010a)
[  323.649410] pci 0000:04:06.2: restoring config space at offset 0x4 (was 0x0, writing 0xc3012000)
[  323.649419] pci 0000:04:06.2: restoring config space at offset 0x3 (was 0x800000, writing 0x804010)
[  323.649429] pci 0000:04:06.2: restoring config space at offset 0x1 (was 0x2100000, writing 0x2100006)
[  323.649620] PM: early resume of devices complete after 1.711 msecs
[  323.650075] ohci_hcd 0000:00:0b.0: PCI INT A -> Link[LUS0] -> GSI 21 (level, high) -> IRQ 21
[  323.650088] ohci_hcd 0000:00:0b.0: setting latency timer to 64
[  323.650119] ehci_hcd 0000:00:0b.1: PCI INT B -> Link[LUS2] -> GSI 22 (level, high) -> IRQ 22
[  323.650128] ehci_hcd 0000:00:0b.1: setting latency timer to 64
[  323.650174] pata_amd 0000:00:0d.0: setting latency timer to 64
[  323.650182] pci 0000:00:10.0: setting latency timer to 64
[  323.650220] [drm] nouveau 0000:03:00.0: We're back, enabling device...
[  323.650242] nouveau 0000:03:00.0: PCI INT A -> Link[LK1E] -> GSI 18 (level, high) -> IRQ 18
[  323.650255] nouveau 0000:03:00.0: setting latency timer to 64
[  323.650280] [drm] nouveau 0000:03:00.0: POSTing device...
[  323.650287] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 0 at offset 0xD00A
[  323.650706] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 1 at offset 0xD6B4
[  323.650793] sd 0:0:0:0: [sda] Starting disk
[  323.653478] HDA Intel 0000:00:10.1: power state changed by ACPI to D0
[  323.654597] HDA Intel 0000:00:10.1: power state changed by ACPI to D0
[  323.654739] HDA Intel 0000:00:10.1: power state changed by ACPI to D0
[  323.654813] HDA Intel 0000:00:10.1: power state changed by ACPI to D0
[  323.654832] HDA Intel 0000:00:10.1: PCI INT B -> Link[LAZA] -> GSI 19 (level, high) -> IRQ 19
[  323.654841] HDA Intel 0000:00:10.1: setting latency timer to 64
[  323.690136] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 2 at offset 0xDDAB
[  323.690187] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 3 at offset 0xDF2F
[  323.710065] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 4 at offset 0xE134
[  323.710070] [drm] nouveau 0000:03:00.0: Reinitialising engines...
[  323.710174] [drm] nouveau 0000:03:00.0: Restoring GPU objects...
[  323.734129] [drm] nouveau 0000:03:00.0: Restoring mode...
[  323.734258] [drm] nouveau 0000:03:00.0: Calling LVDS script 6:
[  323.734266] [drm] nouveau 0000:03:00.0: 0xC1DD: Parsing digital output script table
[  323.734282] [drm] nouveau 0000:03:00.0: Calling LVDS script 2:
[  323.734288] [drm] nouveau 0000:03:00.0: 0xC253: Parsing digital output script table
[  323.900060] [drm] nouveau 0000:03:00.0: Calling LVDS script 5:
[  323.900066] [drm] nouveau 0000:03:00.0: 0xC1CE: Parsing digital output script table
[  335.372677] usb 1-6: reset high speed USB device using ehci_hcd and address 2
[  358.818641] ata1.00: ACPI cmd ef/03:45:00:00:00:a0 (SET FEATURES) filtered out
[  358.818651] ata1.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered out
[  358.818743] ata2.00: ACPI cmd ef/03:42:00:00:00:a0 (SET FEATURES) filtered out
[  358.818752] ata2.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered out
[  358.818819] ata2: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000 (0xc600c000) ACPI=0x701f (60:600:0x13)
[  358.818979] ata1: nv_mode_filter: 0x3f39f&0x3f39f->0x3f39f, BIOS=0x3f000 (0xc600c000) ACPI=0x3f01f (20:600:0x13)
[  358.831527] ata1.00: configured for UDMA/100
[  358.837603] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on lvds encoder (output 0)
[  358.837611] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on vga encoder (output 1)
[  358.837619] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on TV encoder (output 2)
[  382.352606] ata2.00: configured for UDMA/33
[  382.362103] [drm] nouveau 0000:03:00.0: Calling LVDS script 6:
[  382.504761] [drm] nouveau 0000:03:00.0: 0xC1DD: Parsing digital output script table
[  382.701512] [drm] nouveau 0000:03:00.0: Calling LVDS script 2:
[  382.717576] [drm] nouveau 0000:03:00.0: 0xC253: Parsing digital output script table
[  382.800855] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  382.800861] [drm] nouveau 0000:03:00.0: 0xC31E: no tmds_index_reg
[  382.817042] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  382.817048] [drm] nouveau 0000:03:00.0: 0xC339: no tmds_index_reg
[  382.937320] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  382.937326] [drm] nouveau 0000:03:00.0: 0xC199: no tmds_index_reg
[  382.953640] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  382.953645] [drm] nouveau 0000:03:00.0: 0xC19E: no tmds_index_reg
[  382.969712] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  382.969718] [drm] nouveau 0000:03:00.0: 0xC1AD: no tmds_index_reg
[  383.059922] [drm] nouveau 0000:03:00.0: Setting dpms mode 0 on lvds encoder (output 0)
[  383.059929] [drm] nouveau 0000:03:00.0: Calling LVDS script 5:
[  383.120061] [drm] nouveau 0000:03:00.0: 0xC1CE: Parsing digital output script table
[  383.136255] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  383.136260] [drm] nouveau 0000:03:00.0: 0xC1CE: no tmds_index_reg
[  383.180211] [drm] nouveau 0000:03:00.0: Output LVDS-1 is running on CRTC 0 using output A
[  385.551993] PM: resume of devices complete after 61902.301 msecs
[  385.583931] Restarting tasks ... done.
[  385.599807] video LNXVIDEO:01: Restoring backlight state
[  385.620049] [drm] nouveau 0000:03:00.0: Load detected on output A
[  385.644252] [drm] nouveau 0000:03:00.0: Load detected on output B
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_CACHE_ERROR - Ch 31/7 Mthd 0x1ffc Data 0xffffffff
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_DMA_PUSHER - Ch 31
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_INTR 0xffefeffe - Ch 31
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_CACHE_ERROR - Ch 0/3 Mthd 0x0bec Data 0x03700000
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_DMA_PUSHER - Ch 0
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_INTR 0xffefeffe - Ch 0
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_CACHE_ERROR - Ch 31/7 Mthd 0x1ffc Data 0xffffffff
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_DMA_PUSHER - Ch 31
[  397.785767] [drm] nouveau 0000:03:00.0: PFIFO_INTR 0xffefeffe - Ch 31
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c7c Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - Ch -1/0 Class 0x0039 Mthd 0x0000 Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch -1/7 Class 0x0000 Mthd 0x1ffc Data 0xffffffff:0xffffffff
[  397.785767] [drm] nouveau 0000:03:00.0: Context switch not implemented
[  397.785767] [drm] nouveau 0000:03:00.0: Unhandled PGRAPH_INTR - 0xffefeffe
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - Ch -1/0 Class 0x0039 Mthd 0x0000 Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: INVALID_STATE
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c7c Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: Context switch not implemented
[  397.785767] [drm] nouveau 0000:03:00.0: Unhandled PGRAPH_INTR - 0xffefeffe
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - Ch -1/0 Class 0x0039 Mthd 0x0000 Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch -1/7 Class 0x0000 Mthd 0x1ffc Data 0xffffffff:0xffffffff
[  397.785767] [drm] nouveau 0000:03:00.0: Context switch not implemented
[  397.785767] [drm] nouveau 0000:03:00.0: Unhandled PGRAPH_INTR - 0xffefeffe
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - Ch -1/0 Class 0x0039 Mthd 0x0000 Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch -1/7 Class 0x0000 Mthd 0x1ffc Data 0xffffffff:0xffffffff
[  397.785767] [drm] nouveau 0000:03:00.0: Context switch not implemented
[  397.785767] [drm] nouveau 0000:03:00.0: Unhandled PGRAPH_INTR - 0xffefeffe
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_NOTIFY - Ch 0/3 Class 0x004a Mthd 0x1c7c Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: AIII, invalid/inactive channel id 32
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: NOTIFICATION DATA_ERROR PROTECTION_ERROR RANGE_EXCEPTION LIMIT_COLOR LIMIT_ZETA ILLEGAL_MTHD DMA_R_PROTECTION DMA_W_PROTECTION FORMAT_EXCEPTION PATCH_EXCEPTION STATE_INVALID DOUBLE_NOTIFY NOTIFY_IN_USE METHOD_CNT BFR_NOTIFICATION DMA_VTX_PROTECTION DMA_WIDTH_A DMA_WIDTH_B (unknown bits 0xfff80000), nStatus: STATE_IN_USE INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT (unknown bits 0xf87fffff)
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch -1/7 Class 0x0000 Mthd 0x1ffc Data 0xffffffff:0xffffffff
[  397.785767] [drm] nouveau 0000:03:00.0: Context switch not implemented
[  397.785767] [drm] nouveau 0000:03:00.0: Unhandled PGRAPH_INTR - 0xffefeffe
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c84 Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c8c Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c94 Data 0x00000000:0x00200280
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c9c Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1ca4 Data 0x00000000:0x00100030
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1cac Data 0x00200280:0x00200280
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1cb4 Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1cbc Data 0x00000000:0x00000000
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1cc4 Data 0x006c1038:0x006c1038
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1ccc Data 0xc66600c6:0xc66600c6
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1cd4 Data 0xc6c6c666:0xc6c6c666
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1cdc Data 0x00000000:0x38d6c6d6
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  397.785767] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1ce4 Data 0x00000000:0xc66638c6
[  397.785767] [drm] nouveau 0000:03:00.0: Unhandled PMC INTR status bits 0xf8dfeeff
[  409.043484] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  409.043490] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c7c Data 0x00000000:0x00000000
[  409.043504] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  409.043509] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c84 Data 0x00000000:0x00000000
[  409.043523] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  409.043528] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c8c Data 0x00000000:0x00000000
[  409.043542] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - nSource: DATA_ERROR METHOD_CNT, nStatus: INVALID_STATE BAD_ARGUMENT
[  409.043548] [drm] nouveau 0000:03:00.0: PGRAPH_ERROR - Ch 0/3 Class 0x004a Mthd 0x1c94 Data 0x00200280:0x00200280
[  409.044777] [drm] nouveau 0000:03:00.0: PFIFO_CACHE_ERROR - Ch 0/3 Mthd 0x0000 Data 0x767c3c00
[  409.046084] [drm] nouveau 0000:03:00.0: PFIFO_CACHE_ERROR - Ch 0/3 Mthd 0x0000 Data 0x767c3c00
[  409.164179] ACPI Exception: AE_TIME, Returned by Handler for [EmbeddedControl] (20100428/evregion-474)
[  409.164649] ACPI Error (psparse-0537): Method parse/execution failed [\_SB_.LID0._LID] (Node ffff88007f859450), AE_TIME
[  409.194273] [drm] nouveau 0000:03:00.0: Load detected on output A
[  409.220885] [drm] nouveau 0000:03:00.0: Load detected on output B
[  409.221359] [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on lvds encoder (output 0)
[  409.221938] [drm] nouveau 0000:03:00.0: Calling LVDS script 6:
[  409.222873] [drm] nouveau 0000:03:00.0: 0xC1DD: Parsing digital output script table
[  421.556082] [drm] nouveau 0000:03:00.0: Calling LVDS script 2:
[  421.556484] [drm] nouveau 0000:03:00.0: 0xC253: Parsing digital output script table
[  421.659475] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  422.008835] [drm] nouveau 0000:03:00.0: 0xC339: no tmds_index_reg
[  422.131459] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  422.298632] [drm] nouveau 0000:03:00.0: 0xC199: no tmds_index_reg
[  422.314102] [drm] nouveau 0000:03:00.0: CR58 doesn't have a valid DCB entry currently (FF)
[  422.481103] [drm] nouveau 0000:03:00.0: 0xC1AD: no tmds_index_reg
[  422.531532] [drm] nouveau 0000:03:00.0: Setting dpms mode 0 on lvds encoder (output 0)
[  422.576023] [drm] nouveau 0000:03:00.0: Calling LVDS script 5:
[  422.591519] [drm] nouveau 0000:03:00.0: 0xC1CE: Parsing digital output script table
[  422.624057] [drm] nouveau 0000:03:00.0: Output LVDS-1 is running on CRTC 0 using output A
[  422.807916] [drm] nouveau 0000:03:00.0: Setting dpms mode 0 on TV encoder (output 2)
[  422.808706] [drm] nouveau 0000:03:00.0: Output TV-1 is running on CRTC 1 using output B


--------------080703070303060907080205
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------080703070303060907080205--
