From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau_fan_update: possible circular locking
	dependency detected
Date: Thu, 13 Mar 2014 23:20:57 +0100
Message-ID: <20140313222057.GA2900@joi.home>
References: <20140309145157.GA504@joi.home>
	<CAKb7UviyaTRBqjcj6wZo=5_rZ+9V8WyMeE6O03nDk1QW-LEYEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UviyaTRBqjcj6wZo=5_rZ+9V8WyMeE6O03nDk1QW-LEYEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2014 at 09:38:45AM -0400, Ilia Mirkin wrote:
> On Sun, Mar 9, 2014 at 10:51 AM, Marcin Slusarz
> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > [  326.168487] ======================================================
> > [  326.168491] [ INFO: possible circular locking dependency detected ]
> > [  326.168496] 3.13.6 #1270 Not tainted
> > [  326.168500] -------------------------------------------------------
> > [  326.168504] ldconfig/22297 is trying to acquire lock:
> > [  326.168507]  (&(&priv->fan->lock)->rlock){-.-...}, at: [<ffffffffa00d5363>] nouveau_fan_update+0xeb/0x252 [nouveau]
> > [  326.168551]
> > but task is already holding lock:
> > [  326.168555]  (&(&priv->sensor.alarm_program_lock)->rlock){-.-...}, at: [<ffffffffa00d6a8a>] alarm_timer_callback+0xf1/0x179 [nouveau]
> > [  326.168587]
> > which lock already depends on the new lock.
> > (...)
> 
> Marcin, how reproducible is this? What hardware was this on? If it's
> reasonably reproducible perhaps it makes sense to file a bug in the
> fd.o tracker?

It happened only once so far (but I don't use this machine every day) - on the
first boot of 3.13 kernel. At that time the machine was quite hot (it was
rebuilding the whole system (Gentoo) *and* CPU fan was dusty), so it probably
affected GPU temperature.
It's NVA8 card (dmesg attached).

Marcin

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="d.txt"

[    0.000000] Linux version 3.13.6 (marcin@joi) (gcc version 4.7.3 (Gentoo 4.7.3-r1 p1.4, pie-0.5.5) ) #1274 SMP PREEMPT Thu Mar 13 22:55:41 CET 2014
[    0.000000] Command line: BOOT_IMAGE=/boot/kernel-3.13.6 root=UUID=a55f9cc0-8726-4a17-9198-a153da676c85 netconsole=33333-Q0ErXNX1RubLJd2+pq3grw@public.gmane.org/eth0,8888-Q0ErXNX1RuaiuRF/M/dTPA@public.gmane.org/00:06:5b:6a:a5:74
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e4c00-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bf77ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bf780000-0x00000000bf797fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000bf798000-0x00000000bf7dbfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000bf7dc000-0x00000000bfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000001bfffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.5 present.
[    0.000000] DMI: System manufacturer System Product Name/P6T SE, BIOS 0603    09/02/2009
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] No AGP bridge found
[    0.000000] e820: last_pfn = 0x1c0000 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-E3FFF write-protect
[    0.000000]   E4000-EBFFF write-through
[    0.000000]   EC000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 1C0000000 mask FC0000000 uncachable
[    0.000000]   1 base 000000000 mask E00000000 write-back
[    0.000000]   2 base 0C0000000 mask FC0000000 uncachable
[    0.000000]   3 base 0BF800000 mask FFF800000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] original variable MTRRs
[    0.000000] reg 0, base: 7GB, range: 1GB, type UC
[    0.000000] reg 1, base: 0GB, range: 8GB, type WB
[    0.000000] reg 2, base: 3GB, range: 1GB, type UC
[    0.000000] reg 3, base: 3064MB, range: 8MB, type UC
[    0.000000] total RAM covered: 6136M
[    0.000000] Found optimal setting for mtrr clean up
[    0.000000]  gran_size: 64K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 0G
[    0.000000] New variable MTRRs
[    0.000000] reg 0, base: 0GB, range: 2GB, type WB
[    0.000000] reg 1, base: 2GB, range: 1GB, type WB
[    0.000000] reg 2, base: 3064MB, range: 8MB, type UC
[    0.000000] reg 3, base: 4GB, range: 2GB, type WB
[    0.000000] reg 4, base: 6GB, range: 1GB, type WB
[    0.000000] e820: update [mem 0xbf800000-0xffffffff] usable ==> reserved
[    0.000000] e820: last_pfn = 0xbf780 max_arch_pfn = 0x400000000
[    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24576
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x027db000, 0x027dbfff] PGTABLE
[    0.000000] BRK [0x027dc000, 0x027dcfff] PGTABLE
[    0.000000] BRK [0x027dd000, 0x027ddfff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x1bfe00000-0x1bfffffff]
[    0.000000]  [mem 0x1bfe00000-0x1bfffffff] page 2M
[    0.000000] BRK [0x027de000, 0x027defff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x1bc000000-0x1bfdfffff]
[    0.000000]  [mem 0x1bc000000-0x1bfdfffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x180000000-0x1bbffffff]
[    0.000000]  [mem 0x180000000-0x1bbffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0xbf77ffff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0xbf5fffff] page 2M
[    0.000000]  [mem 0xbf600000-0xbf77ffff] page 4k
[    0.000000] init_memory_mapping: [mem 0x100000000-0x17fffffff]
[    0.000000]  [mem 0x100000000-0x17fffffff] page 2M
[    0.000000] BRK [0x027df000, 0x027dffff] PGTABLE
[    0.000000] BRK [0x027e0000, 0x027e0fff] PGTABLE
[    0.000000] ACPI: RSDP 00000000000fb250 000024 (v02 ACPIAM)
[    0.000000] ACPI: XSDT 00000000bf780100 000064 (v01 090209 XSDT1920 20090902 MSFT 00000097)
[    0.000000] ACPI: FACP 00000000bf780290 0000F4 (v03 090209 FACP1920 20090902 MSFT 00000097)
[    0.000000] ACPI: DSDT 00000000bf7804b0 00C2E4 (v01  A1279 A1279001 00000001 INTL 20060113)
[    0.000000] ACPI: FACS 00000000bf798000 000040
[    0.000000] ACPI: APIC 00000000bf780390 0000D8 (v01 090209 APIC1920 20090902 MSFT 00000097)
[    0.000000] ACPI: MCFG 00000000bf780470 00003C (v01 090209 OEMMCFG  20090902 MSFT 00000097)
[    0.000000] ACPI: OEMB 00000000bf798040 000072 (v01 090209 OEMB1920 20090902 MSFT 00000097)
[    0.000000] ACPI: HPET 00000000bf78f4b0 000038 (v01 090209 OEMHPET  20090902 MSFT 00000097)
[    0.000000] ACPI: DMAR 00000000bf7980c0 000138 (v01    AMI  OEMDMAR 00000001 MSFT 00000097)
[    0.000000] ACPI: OSFR 00000000bf78f4f0 0000B0 (v01 090209 OEMOSFR  20090902 MSFT 00000097)
[    0.000000] ACPI: SSDT 00000000bf79a280 00249F (v01 DpgPmm    CpuPm 00000012 INTL 20060113)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000]  [ffffea0000000000-ffffea0006ffffff] PMD -> [ffff8801b9600000-ffff8801bf5fffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
[    0.000000]   Normal   [mem 0x100000000-0x1bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009efff]
[    0.000000]   node   0: [mem 0x00100000-0xbf77ffff]
[    0.000000]   node   0: [mem 0x100000000-0x1bfffffff]
[    0.000000] On node 0 totalpages: 1570590
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3998 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 12190 pages used for memmap
[    0.000000]   DMA32 zone: 780160 pages, LIFO batch:31
[    0.000000]   Normal zone: 12288 pages used for memmap
[    0.000000]   Normal zone: 786432 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x03] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x07] lapic_id[0x05] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x09] lapic_id[0x88] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x89] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x8a] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x8b] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x8c] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x8d] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x8e] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x10] lapic_id[0x8f] disabled)
[    0.000000] ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: IOAPIC (id[0x09] address[0xfec8a000] gsi_base[24])
[    0.000000] IOAPIC[1]: apic_id 9, version 32, address 0xfec8a000, GSI 24-47
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a301 base: 0xfed00000
[    0.000000] smpboot: 16 Processors exceeds NR_CPUS limit of 8
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 64
[    0.000000] e820: [mem 0xc0000000-0xfedfffff] available for PCI devices
[    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.000000] PERCPU: Embedded 28 pages/cpu @ffff8801bfc00000 s82624 r8192 d23872 u262144
[    0.000000] pcpu-alloc: s82624 r8192 d23872 u262144 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1546027
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/kernel-3.13.6 root=UUID=a55f9cc0-8726-4a17-9198-a153da676c85 netconsole=33333-Q0ErXNX1RubLJd2+pq3grw@public.gmane.org/eth0,8888-Q0ErXNX1RuaiuRF/M/dTPA@public.gmane.org/00:06:5b:6a:a5:74
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Checking aperture...
[    0.000000] No AGP bridge found
[    0.000000] Memory: 6079736K/6282360K available (5800K kernel code, 690K rwdata, 2804K rodata, 2140K init, 11324K bss, 202624K reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] 	Dump stacks of tasks blocking RCU-preempt GP.
[    0.000000] NR_IRQS:4352 nr_irqs:1152 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.000000] ... MAX_LOCK_DEPTH:          48
[    0.000000] ... MAX_LOCKDEP_KEYS:        8191
[    0.000000] ... CLASSHASH_SIZE:          4096
[    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
[    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
[    0.000000] ... CHAINHASH_SIZE:          16384
[    0.000000]  memory used by lock dependency info: 5855 kB
[    0.000000]  per task-struct memory footprint: 1920 bytes
[    0.000000] kmemleak: Kernel memory leak detector disabled
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.010000] tsc: Detected 2672.871 MHz processor
[    0.000003] Calibrating delay loop (skipped), value calculated using timer frequency.. 5345.74 BogoMIPS (lpj=26728710)
[    0.000498] pid_max: default: 32768 minimum: 301
[    0.000853] Mount-cache hash table entries: 256
[    0.001802] CPU: Physical Processor ID: 0
[    0.002048] CPU: Processor Core ID: 0
[    0.002295] mce: CPU supports 9 MCE banks
[    0.002547] CPU0: Thermal monitoring enabled (TM1)
[    0.002805] Last level iTLB entries: 4KB 512, 2MB 7, 4MB 7
Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32
tlb_flushall_shift: 6
[    0.003630] Freeing SMP alternatives memory: 24K (ffffffff90cc5000 - ffffffff90ccb000)
[    0.004092] ACPI: Core revision 20131115
[    0.011156] ACPI: All ACPI Tables successfully acquired
[    0.036875] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.137104] smpboot: CPU0: Intel(R) Core(TM) i7 CPU         920  @ 2.67GHz (fam: 06, model: 1a, stepping: 05)
[    0.267639] APIC calibration not consistent with PM-Timer: 119ms instead of 100ms
[    0.268101] APIC delta adjusted to PM-Timer: 835225 (1002266)
[    0.268370] Performance Events: PEBS fmt1+, 16-deep LBR, Nehalem events, Intel PMU driver.
[    0.268955] perf_event_intel: CPU erratum AAJ80 worked around
[    0.269203] perf_event_intel: CPUID marked event: 'bus cycles' unavailable
[    0.269465] ... version:                3
[    0.269710] ... bit width:              48
[    0.269954] ... generic registers:      4
[    0.270199] ... value mask:             0000ffffffffffff
[    0.270447] ... max period:             000000007fffffff
[    0.270694] ... fixed-purpose events:   3
[    0.270939] ... event mask:             000000070000000f
[    0.348556] x86: Booting SMP configuration:
[    0.362361] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
[    0.348803] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.541725] x86: Booted up 1 node, 8 CPUs
[    0.542211] smpboot: Total of 8 processors activated (42765.93 BogoMIPS)
[    0.548390] devtmpfs: initialized
[    0.549004] PM: Registering ACPI NVS region [mem 0xbf798000-0xbf7dbfff] (278528 bytes)
[    0.550036] xor: measuring software checksum speed
[    0.648280]    prefetch64-sse: 10882.400 MB/sec
[    0.748246]    generic_sse:  9634.800 MB/sec
[    0.748495] xor: using function: prefetch64-sse (10882.400 MB/sec)
[    0.748957] NET: Registered protocol family 16
[    0.749975] cpuidle: using governor ladder
[    0.750222] cpuidle: using governor menu
[    0.750516] ACPI: bus type PCI registered
[    0.750932] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.751394] PCI: not using MMCONFIG
[    0.751639] PCI: Using configuration type 1 for base access
[    0.762810] bio: create slab <bio-0> at 0
[    0.928188] raid6: sse2x1    6630 MB/s
[    1.098122] raid6: sse2x2    7615 MB/s
[    1.268065] raid6: sse2x4    8579 MB/s
[    1.268313] raid6: using algorithm sse2x4 (8579 MB/s)
[    1.268560] raid6: using ssse3x2 recovery algorithm
[    1.269003] ACPI: Added _OSI(Module Device)
[    1.269250] ACPI: Added _OSI(Processor Device)
[    1.269496] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.269743] ACPI: Added _OSI(Processor Aggregator Device)
[    1.278304] ACPI: Executed 1 blocks of module-level executable AML code
[    1.307822] ACPI: SSDT 00000000bf798200 000403 (v01 DpgPmm  P001Ist 00000011 INTL 20060113)
[    1.309368] ACPI: Dynamic OEM Table Load:
[    1.309676] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P001Ist 00000011 INTL 20060113)
[    1.310628] ACPI: SSDT 00000000bf798610 000403 (v01 DpgPmm  P002Ist 00000012 INTL 20060113)
[    1.312160] ACPI: Dynamic OEM Table Load:
[    1.312467] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P002Ist 00000012 INTL 20060113)
[    1.313418] ACPI: SSDT 00000000bf798a20 000403 (v01 DpgPmm  P003Ist 00000012 INTL 20060113)
[    1.314957] ACPI: Dynamic OEM Table Load:
[    1.320438] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P003Ist 00000012 INTL 20060113)
[    1.321400] ACPI: SSDT 00000000bf798e30 000403 (v01 DpgPmm  P004Ist 00000012 INTL 20060113)
[    1.322944] ACPI: Dynamic OEM Table Load:
[    1.323251] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P004Ist 00000012 INTL 20060113)
[    1.358491] ACPI: SSDT 00000000bf799240 000403 (v01 DpgPmm  P005Ist 00000012 INTL 20060113)
[    1.360040] ACPI: Dynamic OEM Table Load:
[    1.360347] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P005Ist 00000012 INTL 20060113)
[    1.388477] ACPI: SSDT 00000000bf799650 000403 (v01 DpgPmm  P006Ist 00000012 INTL 20060113)
[    1.390030] ACPI: Dynamic OEM Table Load:
[    1.390337] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P006Ist 00000012 INTL 20060113)
[    1.418484] ACPI: SSDT 00000000bf799a60 000403 (v01 DpgPmm  P007Ist 00000012 INTL 20060113)
[    1.420043] ACPI: Dynamic OEM Table Load:
[    1.420350] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P007Ist 00000012 INTL 20060113)
[    1.478119] ACPI: SSDT 00000000bf799e70 000403 (v01 DpgPmm  P008Ist 00000012 INTL 20060113)
[    1.479704] ACPI: Dynamic OEM Table Load:
[    1.480011] ACPI: SSDT           (null) 000403 (v01 DpgPmm  P008Ist 00000012 INTL 20060113)
[    1.480928] ACPI: Interpreter enabled
[    1.481184] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20131115/hwxface-580)
[    1.481742] ACPI: (supports S0 S1 S3 S5)
[    1.481992] ACPI: Using IOAPIC for interrupt routing
[    1.482274] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    1.485270] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
[    1.502434] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    1.522379] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.522635] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    1.523140] acpi PNP0A08:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
[    1.523735] PCI host bridge to bus 0000:00
[    1.523983] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.524233] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
[    1.524483] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    1.524734] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
[    1.524986] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000dffff]
[    1.525237] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xdfffffff]
[    1.525489] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfed8ffff]
[    1.525784] pci 0000:00:00.0: [8086:3405] type 00 class 0x060000
[    1.525881] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    1.526156] pci 0000:00:01.0: [8086:3408] type 01 class 0x060400
[    1.526228] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    1.526437] pci 0000:00:01.0: System wakeup disabled by ACPI
[    1.526779] pci 0000:00:03.0: [8086:340a] type 01 class 0x060400
[    1.526855] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
[    1.527002] pci 0000:00:03.0: System wakeup disabled by ACPI
[    1.527343] pci 0000:00:07.0: [8086:340e] type 01 class 0x060400
[    1.527414] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    1.527561] pci 0000:00:07.0: System wakeup disabled by ACPI
[    1.527907] pci 0000:00:14.0: [8086:342e] type 00 class 0x080000
[    1.528172] pci 0000:00:14.1: [8086:3422] type 00 class 0x080000
[    1.528427] pci 0000:00:14.2: [8086:3423] type 00 class 0x080000
[    1.528680] pci 0000:00:14.3: [8086:3438] type 00 class 0x080000
[    1.528930] pci 0000:00:1a.0: [8086:3a37] type 00 class 0x0c0300
[    1.528983] pci 0000:00:1a.0: reg 0x20: [io  0xb800-0xb81f]
[    1.529204] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    1.529541] pci 0000:00:1a.1: [8086:3a38] type 00 class 0x0c0300
[    1.529594] pci 0000:00:1a.1: reg 0x20: [io  0xb880-0xb89f]
[    1.529800] pci 0000:00:1a.1: System wakeup disabled by ACPI
[    1.530140] pci 0000:00:1a.2: [8086:3a39] type 00 class 0x0c0300
[    1.530193] pci 0000:00:1a.2: reg 0x20: [io  0xbc00-0xbc1f]
[    1.530399] pci 0000:00:1a.2: System wakeup disabled by ACPI
[    1.530747] pci 0000:00:1a.7: [8086:3a3c] type 00 class 0x0c0320
[    1.530773] pci 0000:00:1a.7: reg 0x10: [mem 0xf9fff000-0xf9fff3ff]
[    1.530883] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    1.531032] pci 0000:00:1a.7: System wakeup disabled by ACPI
[    1.531378] pci 0000:00:1b.0: [8086:3a3e] type 00 class 0x040300
[    1.531398] pci 0000:00:1b.0: reg 0x10: [mem 0xf9ff8000-0xf9ffbfff 64bit]
[    1.531483] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    1.531712] pci 0000:00:1c.0: [8086:3a40] type 01 class 0x060400
[    1.531801] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    1.531948] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    1.532286] pci 0000:00:1c.2: [8086:3a44] type 01 class 0x060400
[    1.532374] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    1.532520] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    1.532855] pci 0000:00:1c.4: [8086:3a48] type 01 class 0x060400
[    1.532943] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    1.533090] pci 0000:00:1c.4: System wakeup disabled by ACPI
[    1.533428] pci 0000:00:1d.0: [8086:3a34] type 00 class 0x0c0300
[    1.533481] pci 0000:00:1d.0: reg 0x20: [io  0xb080-0xb09f]
[    1.533687] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    1.534023] pci 0000:00:1d.1: [8086:3a35] type 00 class 0x0c0300
[    1.534075] pci 0000:00:1d.1: reg 0x20: [io  0xb400-0xb41f]
[    1.534283] pci 0000:00:1d.1: System wakeup disabled by ACPI
[    1.534621] pci 0000:00:1d.2: [8086:3a36] type 00 class 0x0c0300
[    1.534674] pci 0000:00:1d.2: reg 0x20: [io  0xb480-0xb49f]
[    1.534879] pci 0000:00:1d.2: System wakeup disabled by ACPI
[    1.535227] pci 0000:00:1d.7: [8086:3a3a] type 00 class 0x0c0320
[    1.535253] pci 0000:00:1d.7: reg 0x10: [mem 0xf9ffe000-0xf9ffe3ff]
[    1.535363] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    1.535510] pci 0000:00:1d.7: System wakeup disabled by ACPI
[    1.535845] pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
[    1.536034] pci 0000:00:1e.0: System wakeup disabled by ACPI
[    1.536371] pci 0000:00:1f.0: [8086:3a16] type 00 class 0x060100
[    1.536465] pci 0000:00:1f.0: address space collision: [io  0x0800-0x087f] conflicts with ACPI CPU throttle [??? 0x00000810-0x00000815 flags 0x80000000]
[    1.536940] pci 0000:00:1f.0: quirk: [io  0x0500-0x053f] claimed by ICH6 GPIO
[    1.537195] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 0294 (mask 0003)
[    1.537657] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 3 PIO at 4700 (mask 001f)
[    1.538366] pci 0000:00:1f.2: [8086:3a20] type 00 class 0x01018f
[    1.538386] pci 0000:00:1f.2: reg 0x10: [io  0xa000-0xa007]
[    1.538396] pci 0000:00:1f.2: reg 0x14: [io  0x9c00-0x9c03]
[    1.538406] pci 0000:00:1f.2: reg 0x18: [io  0x9880-0x9887]
[    1.538416] pci 0000:00:1f.2: reg 0x1c: [io  0x9800-0x9803]
[    1.538426] pci 0000:00:1f.2: reg 0x20: [io  0x9480-0x948f]
[    1.538436] pci 0000:00:1f.2: reg 0x24: [io  0x9400-0x940f]
[    1.538685] pci 0000:00:1f.3: [8086:3a30] type 00 class 0x0c0500
[    1.538704] pci 0000:00:1f.3: reg 0x10: [mem 0xf9ffd000-0xf9ffd0ff 64bit]
[    1.538730] pci 0000:00:1f.3: reg 0x20: [io  0x0400-0x041f]
[    1.538956] pci 0000:00:1f.5: [8086:3a26] type 00 class 0x010185
[    1.538976] pci 0000:00:1f.5: reg 0x10: [io  0xb000-0xb007]
[    1.538986] pci 0000:00:1f.5: reg 0x14: [io  0xac00-0xac03]
[    1.538996] pci 0000:00:1f.5: reg 0x18: [io  0xa880-0xa887]
[    1.539006] pci 0000:00:1f.5: reg 0x1c: [io  0xa800-0xa803]
[    1.539016] pci 0000:00:1f.5: reg 0x20: [io  0xa480-0xa48f]
[    1.539026] pci 0000:00:1f.5: reg 0x24: [io  0xa400-0xa40f]
[    1.539362] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.539725] pci 0000:02:00.0: [10de:0a65] type 00 class 0x030000
[    1.539739] pci 0000:02:00.0: reg 0x10: [mem 0xfa000000-0xfaffffff]
[    1.539753] pci 0000:02:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff 64bit pref]
[    1.539767] pci 0000:02:00.0: reg 0x1c: [mem 0xce000000-0xcfffffff 64bit pref]
[    1.539776] pci 0000:02:00.0: reg 0x24: [io  0xcc00-0xcc7f]
[    1.539786] pci 0000:02:00.0: reg 0x30: [mem 0xfbc00000-0xfbc7ffff pref]
[    1.539931] pci 0000:02:00.1: [10de:0be3] type 00 class 0x040300
[    1.539944] pci 0000:02:00.1: reg 0x10: [mem 0xfbcfc000-0xfbcfffff]
[    1.558093] pci 0000:00:03.0: PCI bridge to [bus 02]
[    1.558352] pci 0000:00:03.0:   bridge window [io  0xc000-0xcfff]
[    1.558356] pci 0000:00:03.0:   bridge window [mem 0xfa000000-0xfbcfffff]
[    1.558363] pci 0000:00:03.0:   bridge window [mem 0xce000000-0xdfffffff 64bit pref]
[    1.558466] pci 0000:00:07.0: PCI bridge to [bus 03]
[    1.558823] pci 0000:00:1c.0: PCI bridge to [bus 06]
[    1.559082] pci 0000:00:1c.0:   bridge window [mem 0xf8f00000-0xf8ffffff 64bit pref]
[    1.559205] pci 0000:05:00.0: [10ec:8168] type 00 class 0x020000
[    1.559226] pci 0000:05:00.0: reg 0x10: [io  0xe800-0xe8ff]
[    1.559258] pci 0000:05:00.0: reg 0x18: [mem 0xfbeff000-0xfbefffff 64bit]
[    1.559279] pci 0000:05:00.0: reg 0x20: [mem 0xf8ef0000-0xf8efffff 64bit pref]
[    1.559294] pci 0000:05:00.0: reg 0x30: [mem 0xfbec0000-0xfbedffff pref]
[    1.559371] pci 0000:05:00.0: supports D1 D2
[    1.559373] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.578085] pci 0000:00:1c.2: PCI bridge to [bus 05]
[    1.578343] pci 0000:00:1c.2:   bridge window [io  0xe000-0xefff]
[    1.578348] pci 0000:00:1c.2:   bridge window [mem 0xfbe00000-0xfbefffff]
[    1.578355] pci 0000:00:1c.2:   bridge window [mem 0xf8e00000-0xf8efffff 64bit pref]
[    1.578483] pci 0000:04:00.0: [197b:2363] type 00 class 0x010185
[    1.578584] pci 0000:04:00.0: reg 0x24: [mem 0xfbdfe000-0xfbdfffff]
[    1.578600] pci 0000:04:00.0: reg 0x30: [mem 0xfbde0000-0xfbdeffff pref]
[    1.578660] pci 0000:04:00.0: PME# supported from D3hot
[    1.578791] pci 0000:04:00.1: [197b:2363] type 00 class 0x010185
[    1.578816] pci 0000:04:00.1: reg 0x10: [io  0xdc00-0xdc07]
[    1.578828] pci 0000:04:00.1: reg 0x14: [io  0xd880-0xd883]
[    1.578840] pci 0000:04:00.1: reg 0x18: [io  0xd800-0xd807]
[    1.578852] pci 0000:04:00.1: reg 0x1c: [io  0xd480-0xd483]
[    1.578864] pci 0000:04:00.1: reg 0x20: [io  0xd400-0xd40f]
[    1.579035] pci 0000:04:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    1.579511] pci 0000:00:1c.4: PCI bridge to [bus 04]
[    1.579762] pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
[    1.579767] pci 0000:00:1c.4:   bridge window [mem 0xfbd00000-0xfbdfffff]
[    1.579899] pci 0000:00:1e.0: PCI bridge to [bus 07] (subtractive decode)
[    1.580162] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
[    1.580165] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
[    1.580167] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
[    1.580170] pci 0000:00:1e.0:   bridge window [mem 0x000d0000-0x000dffff] (subtractive decode)
[    1.580172] pci 0000:00:1e.0:   bridge window [mem 0xc0000000-0xdfffffff] (subtractive decode)
[    1.580175] pci 0000:00:1e.0:   bridge window [mem 0xf0000000-0xfed8ffff] (subtractive decode)
[    1.580228] pci_bus 0000:00: on NUMA node 0
[    1.581886] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 6 7 10 *11 12 14 15)
[    1.582577] ACPI: PCI Interrupt Link [LNKB] (IRQs *5)
[    1.583014] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 6 7 *10 11 12 14 15)
[    1.583702] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 6 7 10 11 12 *14 15)
[    1.584390] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 6 7 10 11 12 14 *15)
[    1.585078] ACPI: PCI Interrupt Link [LNKF] (IRQs *3 4 6 7 10 11 12 14 15)
[    1.585765] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 6 *7 10 11 12 14 15)
[    1.586453] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 *4 6 7 10 11 12 14 15)
[    1.587473] ACPI: Enabled 3 GPEs in block 00 to 3F
[    1.587792] ACPI: \_SB_.PCI0: notify handler is installed
[    1.587921] Found 1 acpi root devices
[    1.588422] vgaarb: device added: PCI:0000:02:00.0,decodes=io+mem,owns=io+mem,locks=none
[    1.588885] vgaarb: loaded
[    1.589128] vgaarb: bridge control possible 0000:02:00.0
[    1.589556] SCSI subsystem initialized
[    1.589989] libata version 3.00 loaded.
[    1.590002] ACPI: bus type USB registered
[    1.590347] usbcore: registered new interface driver usbfs
[    1.590643] usbcore: registered new interface driver hub
[    1.590955] usbcore: registered new device driver usb
[    1.591410] EDAC MC: Ver: 3.0.0
[    1.591990] wmi: Mapper loaded
[    1.592327] Advanced Linux Sound Architecture Driver Initialized.
[    1.592578] PCI: Using ACPI for IRQ routing
[    1.599713] PCI: Discovered peer bus ff
[    1.599960] PCI: root bus ff: using default resources
[    1.599962] PCI: Probing PCI hardware (bus ff)
[    1.600026] PCI host bridge to bus 0000:ff
[    1.600275] pci_bus 0000:ff: root bus resource [io  0x0000-0xffff]
[    1.600526] pci_bus 0000:ff: root bus resource [mem 0x00000000-0xfffffffff]
[    1.600779] pci_bus 0000:ff: No busn resource found for root bus, will use [bus ff-ff]
[    1.601245] pci 0000:ff:00.0: [8086:2c41] type 00 class 0x060000
[    1.601361] pci 0000:ff:00.1: [8086:2c01] type 00 class 0x060000
[    1.601474] pci 0000:ff:02.0: [8086:2c10] type 00 class 0x060000
[    1.601568] pci 0000:ff:02.1: [8086:2c11] type 00 class 0x060000
[    1.601664] pci 0000:ff:03.0: [8086:2c18] type 00 class 0x060000
[    1.601756] pci 0000:ff:03.1: [8086:2c19] type 00 class 0x060000
[    1.601849] pci 0000:ff:03.4: [8086:2c1c] type 00 class 0x060000
[    1.601941] pci 0000:ff:04.0: [8086:2c20] type 00 class 0x060000
[    1.602033] pci 0000:ff:04.1: [8086:2c21] type 00 class 0x060000
[    1.602125] pci 0000:ff:04.2: [8086:2c22] type 00 class 0x060000
[    1.602217] pci 0000:ff:04.3: [8086:2c23] type 00 class 0x060000
[    1.602312] pci 0000:ff:05.0: [8086:2c28] type 00 class 0x060000
[    1.602408] pci 0000:ff:05.1: [8086:2c29] type 00 class 0x060000
[    1.602502] pci 0000:ff:05.2: [8086:2c2a] type 00 class 0x060000
[    1.602594] pci 0000:ff:05.3: [8086:2c2b] type 00 class 0x060000
[    1.602690] pci 0000:ff:06.0: [8086:2c30] type 00 class 0x060000
[    1.602781] pci 0000:ff:06.1: [8086:2c31] type 00 class 0x060000
[    1.602871] pci 0000:ff:06.2: [8086:2c32] type 00 class 0x060000
[    1.602962] pci 0000:ff:06.3: [8086:2c33] type 00 class 0x060000
[    1.603077] pci_bus 0000:ff: busn_res: [bus ff] end is updated to ff
[    1.603087] PCI: pci_cache_line_size set to 64 bytes
[    1.603195] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    1.603202] e820: reserve RAM buffer [mem 0xbf780000-0xbfffffff]
[    1.603717] HPET: 4 timers in total, 0 timers will be used for per-cpu timer
[    1.603973] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
[    1.604377] hpet0: 4 comparators, 64-bit 14.318180 MHz counter
[    1.608104] Switched to clocksource hpet
[    1.621924] pnp: PnP ACPI init
[    1.622193] ACPI: bus type PNP registered
[    1.622613] system 00:00: [mem 0xfbf00000-0xfbffffff] has been reserved
[    1.622867] system 00:00: [mem 0xfc000000-0xfcffffff] has been reserved
[    1.623120] system 00:00: [mem 0xfd000000-0xfdffffff] has been reserved
[    1.623373] system 00:00: [mem 0xfe000000-0xfebfffff] has been reserved
[    1.623626] system 00:00: [mem 0xfec8a000-0xfec8afff] could not be reserved
[    1.623879] system 00:00: [mem 0xfed10000-0xfed10fff] has been reserved
[    1.624191] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    1.624260] pnp 00:01: [dma 4]
[    1.624335] pnp 00:01: Plug and Play ACPI device, IDs PNP0200 (active)
[    1.624434] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.624514] pnp 00:03: Plug and Play ACPI device, IDs PNP0800 (active)
[    1.624599] pnp 00:04: Plug and Play ACPI device, IDs PNP0c04 (active)
[    1.624925] system 00:05: [io  0x0290-0x029f] has been reserved
[    1.625179] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.625494] system 00:06: [io  0x04d0-0x04d1] has been reserved
[    1.625747] system 00:06: [io  0x0800-0x087f] could not be reserved
[    1.625999] system 00:06: [io  0x0500-0x057f] could not be reserved
[    1.626252] system 00:06: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    1.626504] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[    1.626757] system 00:06: [mem 0xfed40000-0xfed8ffff] has been reserved
[    1.627011] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.627173] pnp 00:07: Plug and Play ACPI device, IDs PNP0103 (active)
[    1.627314] pnp 00:08: Plug and Play ACPI device, IDs INT0800 (active)
[    1.627470] system 00:09: [mem 0xffc00000-0xffdfffff] has been reserved
[    1.627726] system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.627941] system 00:0a: [mem 0xfec00000-0xfec00fff] could not be reserved
[    1.628204] system 00:0a: [mem 0xfee00000-0xfee00fff] has been reserved
[    1.628458] system 00:0a: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.628671] system 00:0b: [mem 0xe0000000-0xefffffff] has been reserved
[    1.628927] system 00:0b: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.629324] system 00:0c: [mem 0x00000000-0x0009ffff] could not be reserved
[    1.629580] system 00:0c: [mem 0x000c0000-0x000cffff] could not be reserved
[    1.629833] system 00:0c: [mem 0x000e0000-0x000fffff] could not be reserved
[    1.630087] system 00:0c: [mem 0x00100000-0xbfffffff] could not be reserved
[    1.630341] system 00:0c: [mem 0xfed90000-0xffffffff] could not be reserved
[    1.630596] system 00:0c: Plug and Play ACPI device, IDs PNP0c01 (active)
[    1.630786] pnp: PnP ACPI: found 13 devices
[    1.631033] ACPI: bus type PNP unregistered
[    1.641953] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus 06] add_size 1000
[    1.641958] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] to [bus 06] add_size 400000
[    1.641975] pci 0000:00:1c.4: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 04] add_size 200000
[    1.641991] pci 0000:00:1f.0: BAR 7: [io  0x0800-0x087f] has bogus alignment
[    1.642246] pci 0000:00:1c.0: res[8]=[mem 0x00100000-0x000fffff] get_res_add_size add_size 400000
[    1.642249] pci 0000:00:1c.4: res[9]=[mem 0x00100000-0x000fffff 64bit pref] get_res_add_size add_size 200000
[    1.642252] pci 0000:00:1c.0: res[7]=[io  0x1000-0x0fff] get_res_add_size add_size 1000
[    1.642257] pci 0000:00:1c.0: BAR 8: assigned [mem 0xc0000000-0xc03fffff]
[    1.642511] pci 0000:00:1c.4: BAR 9: assigned [mem 0xc0400000-0xc05fffff 64bit pref]
[    1.642973] pci 0000:00:1c.0: BAR 7: assigned [io  0x1000-0x1fff]
[    1.643226] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.643484] pci 0000:00:03.0: PCI bridge to [bus 02]
[    1.643735] pci 0000:00:03.0:   bridge window [io  0xc000-0xcfff]
[    1.643989] pci 0000:00:03.0:   bridge window [mem 0xfa000000-0xfbcfffff]
[    1.644244] pci 0000:00:03.0:   bridge window [mem 0xce000000-0xdfffffff 64bit pref]
[    1.644709] pci 0000:00:07.0: PCI bridge to [bus 03]
[    1.644967] pci 0000:00:1c.0: PCI bridge to [bus 06]
[    1.645217] pci 0000:00:1c.0:   bridge window [io  0x1000-0x1fff]
[    1.645472] pci 0000:00:1c.0:   bridge window [mem 0xc0000000-0xc03fffff]
[    1.645727] pci 0000:00:1c.0:   bridge window [mem 0xf8f00000-0xf8ffffff 64bit pref]
[    1.646193] pci 0000:00:1c.2: PCI bridge to [bus 05]
[    1.646443] pci 0000:00:1c.2:   bridge window [io  0xe000-0xefff]
[    1.646698] pci 0000:00:1c.2:   bridge window [mem 0xfbe00000-0xfbefffff]
[    1.646953] pci 0000:00:1c.2:   bridge window [mem 0xf8e00000-0xf8efffff 64bit pref]
[    1.647419] pci 0000:00:1c.4: PCI bridge to [bus 04]
[    1.647668] pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
[    1.647922] pci 0000:00:1c.4:   bridge window [mem 0xfbd00000-0xfbdfffff]
[    1.648184] pci 0000:00:1c.4:   bridge window [mem 0xc0400000-0xc05fffff 64bit pref]
[    1.648655] pci 0000:00:1e.0: PCI bridge to [bus 07]
[    1.648914] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    1.648917] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    1.648919] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    1.648921] pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff]
[    1.648924] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xdfffffff]
[    1.648926] pci_bus 0000:00: resource 9 [mem 0xf0000000-0xfed8ffff]
[    1.648929] pci_bus 0000:02: resource 0 [io  0xc000-0xcfff]
[    1.648931] pci_bus 0000:02: resource 1 [mem 0xfa000000-0xfbcfffff]
[    1.648934] pci_bus 0000:02: resource 2 [mem 0xce000000-0xdfffffff 64bit pref]
[    1.648936] pci_bus 0000:06: resource 0 [io  0x1000-0x1fff]
[    1.648939] pci_bus 0000:06: resource 1 [mem 0xc0000000-0xc03fffff]
[    1.648941] pci_bus 0000:06: resource 2 [mem 0xf8f00000-0xf8ffffff 64bit pref]
[    1.648943] pci_bus 0000:05: resource 0 [io  0xe000-0xefff]
[    1.648946] pci_bus 0000:05: resource 1 [mem 0xfbe00000-0xfbefffff]
[    1.648948] pci_bus 0000:05: resource 2 [mem 0xf8e00000-0xf8efffff 64bit pref]
[    1.648951] pci_bus 0000:04: resource 0 [io  0xd000-0xdfff]
[    1.648953] pci_bus 0000:04: resource 1 [mem 0xfbd00000-0xfbdfffff]
[    1.648955] pci_bus 0000:04: resource 2 [mem 0xc0400000-0xc05fffff 64bit pref]
[    1.648958] pci_bus 0000:07: resource 4 [io  0x0000-0x0cf7]
[    1.648960] pci_bus 0000:07: resource 5 [io  0x0d00-0xffff]
[    1.648963] pci_bus 0000:07: resource 6 [mem 0x000a0000-0x000bffff]
[    1.648965] pci_bus 0000:07: resource 7 [mem 0x000d0000-0x000dffff]
[    1.648967] pci_bus 0000:07: resource 8 [mem 0xc0000000-0xdfffffff]
[    1.648970] pci_bus 0000:07: resource 9 [mem 0xf0000000-0xfed8ffff]
[    1.648973] pci_bus 0000:ff: resource 4 [io  0x0000-0xffff]
[    1.648975] pci_bus 0000:ff: resource 5 [mem 0x00000000-0xfffffffff]
[    1.649018] NET: Registered protocol family 2
[    1.649570] TCP established hash table entries: 65536 (order: 7, 524288 bytes)
[    1.650142] TCP bind hash table entries: 65536 (order: 10, 4194304 bytes)
[    1.654299] TCP: Hash tables configured (established 65536 bind 65536)
[    1.654599] TCP: reno registered
[    1.654862] UDP hash table entries: 4096 (order: 7, 655360 bytes)
[    1.655625] UDP-Lite hash table entries: 4096 (order: 7, 655360 bytes)
[    1.656565] NET: Registered protocol family 1
[    1.657057] RPC: Registered named UNIX socket transport module.
[    1.657309] RPC: Registered udp transport module.
[    1.657556] RPC: Registered tcp transport module.
[    1.657804] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.668329] pci 0000:02:00.0: Boot video device
[    1.668384] PCI: CLS 64 bytes, default 64
[    1.686643] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.686898] software IO TLB [mem 0xbb780000-0xbf780000] (64MB) mapped at [ffff8800bb780000-ffff8800bf77ffff]
[    1.687486] kvm: VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL does not work properly. Using workaround
[    1.691248] audit: initializing netlink socket (disabled)
[    1.691531] type=2000 audit(1394748036.550:1): initialized
[    1.700643] fuse init (API version 7.22)
[    1.701838] bio: create slab <bio-1> at 1
[    1.702578] Btrfs loaded
[    1.702830] msgmni has been set to 11874
[    1.703883] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    1.704357] io scheduler noop registered
[    1.704766] io scheduler cfq registered (default)
[    1.705393] pcieport 0000:00:1c.0: enabling device (0106 -> 0107)
[    1.706105] pcieport 0000:00:1c.0: irq 64 for MSI/MSI-X
[    1.706677] pcieport 0000:00:1c.2: irq 65 for MSI/MSI-X
[    1.707170] pcieport 0000:00:1c.4: irq 66 for MSI/MSI-X
[    1.707872] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0
[    1.708383] ACPI: Power Button [PWRB]
[    1.708731] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    1.709194] ACPI: Power Button [PWRF]
[    1.765871] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.767417] Linux agpgart interface v0.103
[    1.769847] loop: module loaded
[    1.770366] ahci 0000:04:00.0: version 3.0
[    1.788118] ahci 0000:04:00.0: AHCI 0001.0000 32 slots 2 ports 3 Gbps 0x3 impl SATA mode
[    1.788583] ahci 0000:04:00.0: flags: 64bit ncq pm led clo pmp pio slum part 
[    1.789674] scsi0 : ahci
[    1.790219] scsi1 : ahci
[    1.790616] ata1: SATA max UDMA/133 abar m8192@0xfbdfe000 port 0xfbdfe100 irq 16
[    1.791079] ata2: SATA max UDMA/133 abar m8192@0xfbdfe000 port 0xfbdfe180 irq 16
[    1.791785] ata_piix 0000:00:1f.2: version 2.13
[    1.792186] ata_piix 0000:00:1f.2: MAP [ P0 P2 P1 P3 ]
[    1.794969] scsi2 : ata_piix
[    1.795385] scsi3 : ata_piix
[    1.795766] ata3: SATA max UDMA/133 cmd 0xa000 ctl 0x9c00 bmdma 0x9480 irq 20
[    1.796022] ata4: SATA max UDMA/133 cmd 0x9880 ctl 0x9800 bmdma 0x9488 irq 20
[    1.796670] ata_piix 0000:00:1f.5: MAP [ P0 -- P1 -- ]
[    1.798976] scsi4 : ata_piix
[    1.799392] scsi5 : ata_piix
[    1.799772] ata5: SATA max UDMA/133 cmd 0xb000 ctl 0xac00 bmdma 0xa480 irq 20
[    1.800028] ata6: SATA max UDMA/133 cmd 0xa880 ctl 0xa800 bmdma 0xa488 irq 20
[    1.800420] pata_jmicron 0000:04:00.1: enabling device (0000 -> 0001)
[    1.802114] scsi6 : pata_jmicron
[    1.802522] scsi7 : pata_jmicron
[    1.802911] ata7: PATA max UDMA/100 cmd 0xdc00 ctl 0xd880 bmdma 0xd400 irq 17
[    1.803165] ata8: PATA max UDMA/100 cmd 0xd800 ctl 0xd480 bmdma 0xd408 irq 17
[    1.803556] tun: Universal TUN/TAP device driver, 1.6
[    1.803807] tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
[    1.804209] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[    1.804469] r8169 0000:05:00.0: can't disable ASPM; OS doesn't have ASPM control
[    1.805144] r8169 0000:05:00.0: irq 67 for MSI/MSI-X
[    1.805503] r8169 0000:05:00.0 eth0: RTL8168c/8111c at 0xffffc9000003c000, 90:e6:ba:78:06:e6, XID 1c4000c0 IRQ 67
[    1.805971] r8169 0000:05:00.0 eth0: jumbo features [frames: 6128 bytes, tx checksumming: ko]
[    1.806578] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.806830] ehci-pci: EHCI PCI platform driver
[    1.807560] ehci-pci 0000:00:1a.7: EHCI Host Controller
[    1.807903] ehci-pci 0000:00:1a.7: new USB bus registered, assigned bus number 1
[    1.808400] ehci-pci 0000:00:1a.7: debug port 1
[    1.812590] ehci-pci 0000:00:1a.7: cache line size of 64 is not supported
[    1.812635] ehci-pci 0000:00:1a.7: irq 18, io mem 0xf9fff000
[    1.828073] ehci-pci 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    1.828524] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    1.828778] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.829238] usb usb1: Product: EHCI Host Controller
[    1.829486] usb usb1: Manufacturer: Linux 3.13.6 ehci_hcd
[    1.829735] usb usb1: SerialNumber: 0000:00:1a.7
[    1.830598] hub 1-0:1.0: USB hub found
[    1.830895] hub 1-0:1.0: 6 ports detected
[    1.831911] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    1.832178] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus number 2
[    1.832651] ehci-pci 0000:00:1d.7: debug port 1
[    1.836782] ehci-pci 0000:00:1d.7: cache line size of 64 is not supported
[    1.836805] ehci-pci 0000:00:1d.7: irq 23, io mem 0xf9ffe000
[    1.848054] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    1.848363] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    1.848617] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.849083] usb usb2: Product: EHCI Host Controller
[    1.849331] usb usb2: Manufacturer: Linux 3.13.6 ehci_hcd
[    1.849580] usb usb2: SerialNumber: 0000:00:1d.7
[    1.850084] hub 2-0:1.0: USB hub found
[    1.850342] hub 2-0:1.0: 6 ports detected
[    1.850842] uhci_hcd: USB Universal Host Controller Interface driver
[    1.851494] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    1.851756] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
[    1.852242] uhci_hcd 0000:00:1a.0: irq 16, io base 0x0000b800
[    1.852586] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    1.852840] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.853298] usb usb3: Product: UHCI Host Controller
[    1.853546] usb usb3: Manufacturer: Linux 3.13.6 uhci_hcd
[    1.853796] usb usb3: SerialNumber: 0000:00:1a.0
[    1.854292] hub 3-0:1.0: USB hub found
[    1.854560] hub 3-0:1.0: 2 ports detected
[    1.855342] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    1.855600] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
[    1.856099] uhci_hcd 0000:00:1a.1: irq 21, io base 0x0000b880
[    1.856420] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
[    1.856673] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.857132] usb usb4: Product: UHCI Host Controller
[    1.857381] usb usb4: Manufacturer: Linux 3.13.6 uhci_hcd
[    1.857629] usb usb4: SerialNumber: 0000:00:1a.1
[    1.858146] hub 4-0:1.0: USB hub found
[    1.858404] hub 4-0:1.0: 2 ports detected
[    1.859155] uhci_hcd 0000:00:1a.2: UHCI Host Controller
[    1.859413] uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus number 5
[    1.859913] uhci_hcd 0000:00:1a.2: irq 19, io base 0x0000bc00
[    1.860232] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001
[    1.860485] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.860944] usb usb5: Product: UHCI Host Controller
[    1.861192] usb usb5: Manufacturer: Linux 3.13.6 uhci_hcd
[    1.861442] usb usb5: SerialNumber: 0000:00:1a.2
[    1.861937] hub 5-0:1.0: USB hub found
[    1.862194] hub 5-0:1.0: 2 ports detected
[    1.862948] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    1.863207] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 6
[    1.863691] uhci_hcd 0000:00:1d.0: irq 23, io base 0x0000b080
[    1.864010] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
[    1.864263] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.864723] usb usb6: Product: UHCI Host Controller
[    1.864971] usb usb6: Manufacturer: Linux 3.13.6 uhci_hcd
[    1.865220] usb usb6: SerialNumber: 0000:00:1d.0
[    1.865717] hub 6-0:1.0: USB hub found
[    1.865974] hub 6-0:1.0: 2 ports detected
[    1.866725] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    1.866984] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 7
[    1.867469] uhci_hcd 0000:00:1d.1: irq 19, io base 0x0000b400
[    1.867788] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
[    1.868052] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.868511] usb usb7: Product: UHCI Host Controller
[    1.868760] usb usb7: Manufacturer: Linux 3.13.6 uhci_hcd
[    1.869009] usb usb7: SerialNumber: 0000:00:1d.1
[    1.869505] hub 7-0:1.0: USB hub found
[    1.869763] hub 7-0:1.0: 2 ports detected
[    1.870513] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    1.870771] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 8
[    1.871255] uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000b480
[    1.871575] usb usb8: New USB device found, idVendor=1d6b, idProduct=0001
[    1.871830] usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.872289] usb usb8: Product: UHCI Host Controller
[    1.872537] usb usb8: Manufacturer: Linux 3.13.6 uhci_hcd
[    1.872787] usb usb8: SerialNumber: 0000:00:1d.2
[    1.873284] hub 8-0:1.0: USB hub found
[    1.873541] hub 8-0:1.0: 2 ports detected
[    1.874067] usbcore: registered new interface driver usb-storage
[    1.874625] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    1.877597] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.877889] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.878381] mousedev: PS/2 mouse device common for all mice
[    1.879322] rtc_cmos 00:02: RTC can wake from S4
[    1.879854] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    1.880138] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    1.880654] i2c /dev entries driver
[    1.881336] ACPI Warning: 0x0000000000000400-0x000000000000041f SystemIO conflicts with Region \SMRG 1 (20131115/utaddress-251)
[    1.881870] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    1.883695] EDAC MC0: Giving out device to module i7core_edac.c controller i7 core #0: DEV 0000:ff:03.0 (POLLED)
[    1.884440] EDAC PCI0: Giving out device to module i7core_edac controller EDAC PCI controller: DEV 0000:ff:03.0 (POLLED)
[    1.884913] EDAC i7core: Driver loaded, 1 memory controller(s) found.
[    1.891282] usbcore: registered new interface driver usbhid
[    1.891533] usbhid: USB HID core driver
[    1.893540] snd_hda_intel 0000:00:1b.0: irq 68 for MSI/MSI-X
[    1.917057] hda_intel: Disabling MSI
[    1.978607] ata7.00: ATAPI: HL-DT-ST DVDRAM GSA-4163B, A102, max UDMA/33
[    2.018543] ata7.00: configured for UDMA/33
[    2.137962] ata2: SATA link down (SStatus 0 SControl 300)
[    2.138257] ata1: SATA link down (SStatus 0 SControl 300)
[    2.158698] ata5: SATA link down (SStatus 0 SControl 300)
[    2.169720] ata6: SATA link down (SStatus 0 SControl 300)
[    2.217950] usb 1-3: new high-speed USB device number 3 using ehci-pci
[    2.370373] usb 1-3: New USB device found, idVendor=058f, idProduct=6362
[    2.370634] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    2.370887] usb 1-3: Product: Mass Storage Device
[    2.371135] usb 1-3: Manufacturer: Generic
[    2.371381] usb 1-3: SerialNumber: 058F312D81B
[    2.372119] usb-storage 1-3:1.0: USB Mass Storage device detected
[    2.372466] scsi8 : usb-storage 1-3:1.0
[    2.498708] ata3.00: SATA link down (SStatus 0 SControl 300)
[    2.498971] ata3.01: SATA link down (SStatus 0 SControl 300)
[    2.647841] ata4.00: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    2.648105] ata4.01: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    2.687830] tsc: Refined TSC clocksource calibration: 2672.726 MHz
[    2.688297] ata4.00: ATA-9: INTEL SSDSC2CW060A3, 400i, max UDMA/133
[    2.688556] ata4.00: 117231408 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    2.688945] ata4.01: ATA-7: SAMSUNG HD753LJ, 1AA01118, max UDMA7
[    2.689203] ata4.01: 1465149168 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    2.708249] ata4.00: configured for UDMA/133
[    2.728000] ata4.01: configured for UDMA/133
[    2.728681] scsi 3:0:0:0: Direct-Access     ATA      INTEL SSDSC2CW06 400i PQ: 0 ANSI: 5
[    2.729862] sd 3:0:0:0: [sda] 117231408 512-byte logical blocks: (60.0 GB/55.8 GiB)
[    2.730198] sd 3:0:0:0: Attached scsi generic sg0 type 0
[    2.730630] scsi 3:0:1:0: Direct-Access     ATA      SAMSUNG HD753LJ  1AA0 PQ: 0 ANSI: 5
[    2.730724] sd 3:0:0:0: [sda] Write Protect is off
[    2.730726] sd 3:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.730769] sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.731960]  sda: sda1 sda2
[    2.732151] sd 3:0:1:0: [sdb] 1465149168 512-byte logical blocks: (750 GB/698 GiB)
[    2.732277] sd 3:0:1:0: [sdb] Write Protect is off
[    2.732279] sd 3:0:1:0: [sdb] Mode Sense: 00 3a 00 00
[    2.732312] sd 3:0:1:0: Attached scsi generic sg1 type 0
[    2.732324] sd 3:0:1:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.736375] scsi 6:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-4163B A102 PQ: 0 ANSI: 5
[    2.743017] sr0: scsi3-mmc drive: 40x/40x writer dvd-ram cd/rw xa/form2 cdda tray
[    2.743485] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.744159] sr 6:0:0:0: Attached scsi CD-ROM sr0
[    2.744342] sr 6:0:0:0: Attached scsi generic sg2 type 5
[    2.747958] sd 3:0:0:0: [sda] Attached SCSI disk
[    2.797794]  sdb: sdb1 sdb2 sdb3 < sdb5 sdb6 sdb7 sdb8 sdb9 > sdb4
[    2.799417] sd 3:0:1:0: [sdb] Attached SCSI disk
[    2.807749] usb 3-2: new low-speed USB device number 2 using uhci_hcd
[    3.137128] usb 3-2: New USB device found, idVendor=046d, idProduct=c30e
[    3.137389] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.137660] usb 3-2: Product: HID compliant keyboard
[    3.137910] usb 3-2: Manufacturer: Logitech
[    3.211724] input: Logitech HID compliant keyboard as /devices/pci0000:00/0000:00:1a.0/usb3/3-2/3-2:1.0/input/input5
[    3.212452] hid-generic 0003:046D:C30E.0001: input: USB HID v1.10 Keyboard [Logitech HID compliant keyboard] on usb-0000:00:1a.0-2/input0
[    3.338230] input: Logitech HID compliant keyboard as /devices/pci0000:00/0000:00:1a.0/usb3/3-2/3-2:1.1/input/input6
[    3.338804] hid-generic 0003:046D:C30E.0002: input: USB HID v1.10 Device [Logitech HID compliant keyboard] on usb-0000:00:1a.0-2/input1
[    3.368701] scsi 8:0:0:0: Direct-Access     Generic  USB SD Reader    1.00 PQ: 0 ANSI: 0
[    3.369684] scsi 8:0:0:1: Direct-Access     Generic  USB CF Reader    1.01 PQ: 0 ANSI: 0
[    3.370684] scsi 8:0:0:2: Direct-Access     Generic  USB SM Reader    1.02 PQ: 0 ANSI: 0
[    3.371683] scsi 8:0:0:3: Direct-Access     Generic  USB MS Reader    1.03 PQ: 0 ANSI: 0
[    3.372946] sd 8:0:0:0: Attached scsi generic sg3 type 0
[    3.373664] sd 8:0:0:1: Attached scsi generic sg4 type 0
[    3.374406] sd 8:0:0:2: Attached scsi generic sg5 type 0
[    3.375125] sd 8:0:0:3: Attached scsi generic sg6 type 0
[    3.377046] sd 8:0:0:0: [sdc] Attached SCSI removable disk
[    3.378545] sd 8:0:0:2: [sde] Attached SCSI removable disk
[    3.379174] sd 8:0:0:1: [sdd] Attached SCSI removable disk
[    3.381420] sd 8:0:0:3: [sdf] Attached SCSI removable disk
[    3.667469] hda_codec: cannot build controls for #1 (error -16)
[    3.687502] hda_codec: cannot build controls for #2 (error -16)
[    3.687768] Switched to clocksource tsc
[    3.707418] hda_codec: cannot build controls for #3 (error -16)
[    3.708317] oprofile: using NMI interrupt.
[    3.708832] ip_tables: (C) 2000-2006 Netfilter Core Team
[    3.709291] TCP: cubic registered
[    3.709537] Initializing XFRM netlink socket
[    3.709801] NET: Registered protocol family 17
[    3.710348] Bridge firewalling registered
[    3.711575] registered taskstats version 1
[    3.712653] netpoll: netconsole: local port 33333
[    3.712903] netpoll: netconsole: local IPv4 address 192.168.1.123
[    3.713153] netpoll: netconsole: interface 'eth0'
[    3.713400] netpoll: netconsole: remote port 8888
[    3.713647] netpoll: netconsole: remote IPv4 address 192.168.1.102
[    3.713898] netpoll: netconsole: remote ethernet address 00:06:5b:6a:a5:74
[    3.714150] netpoll: netconsole: device eth0 not up yet, forcing it
[    3.728717] r8169 0000:05:00.0 eth0: link down
[    3.728764] r8169 0000:05:00.0 eth0: link down
[    5.897671] r8169 0000:05:00.0 eth0: link up
[    5.912241] console [netcon0] enabled
[    5.912491] netconsole: network logging started
[    5.912775] rtc_cmos 00:02: setting system clock to 2014-03-13 22:00:41 UTC (1394748041)
[    5.920002] ALSA device list:
[    5.920255]   #0: HDA Intel at 0xf9ff8000 irq 68
[    5.920504]   #1: HDA NVidia at 0xfbcfc000 irq 34
[    5.920784] Warning: unable to open an initial console.
[    5.922586] Freeing unused kernel memory: 2140K (ffffffff90aae000 - ffffffff90cc5000)
[    5.923049] Write protecting the kernel read-only data: 10240k
[    5.924187] Freeing unused kernel memory: 332K (ffff8800015ad000 - ffff880001600000)
[    5.927158] Freeing unused kernel memory: 1292K (ffff8800018bd000 - ffff880001a00000)
[    6.320907] UDF-fs: warning (device sda1): udf_fill_super: No partition found (2)
[    6.321889] btrfs: device fsid a55f9cc0-8726-4a17-9198-a153da676c85 devid 1 transid 130428 /dev/sda1
[    6.342679] Btrfs detected SSD devices, enabling SSD mode
[    7.430884] random: nonblocking pool is initialized
[    7.604325] systemd-udevd[1806]: starting version 210
[    7.726828] [drm] Initialized drm 1.1.0 20060810
[    7.754383] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0a8280b1
[    7.754388] nouveau  [  DEVICE][0000:02:00.0] Chipset: GT218 (NVA8)
[    7.754391] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
[    7.756566] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    7.824973] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    7.824977] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    7.825110] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    7.825113] nouveau  [   VBIOS][0000:02:00.0] version 70.18.83.00.0f
[    7.831942] nouveau 0000:02:00.0: irq 69 for MSI/MSI-X
[    7.832090] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[    7.832205] nouveau  [     PFB][0000:02:00.0] RAM type: DDR3
[    7.832209] nouveau  [     PFB][0000:02:00.0] RAM size: 512 MiB
[    7.832213] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 960 tags
[    7.842202] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 900000uv
[    7.986834] btrfs: device fsid bacdf4ee-3b0c-423f-8f03-3701a7f24b74 devid 1 transid 155206 /dev/sda2
[    7.990360] btrfs: device fsid a55f9cc0-8726-4a17-9198-a153da676c85 devid 1 transid 130428 /dev/sda1
[   11.034942] nouveau  [  PTHERM][0000:02:00.0] FAN control: PWM
[   11.034954] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[   11.035097] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   11.035162] nouveau  [     CLK][0000:02:00.0] 03: core 135 MHz shader 270 MHz memory 135 MHz
[   11.035167] nouveau  [     CLK][0000:02:00.0] 0f: core 590 MHz shader 1405 MHz memory 800 MHz
[   11.035187] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz shader 810 MHz memory 405 MHz
[   11.035649] [TTM] Zone  kernel: Available graphics memory: 3041762 kiB
[   11.035651] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   11.035653] [TTM] Initializing pool allocator
[   11.035670] [TTM] Initializing DMA pool allocator
[   11.035770] nouveau  [     DRM] VRAM: 512 MiB
[   11.035772] nouveau  [     DRM] GART: 1048576 MiB
[   11.035776] nouveau  [     DRM] TMDS table version 2.0
[   11.035779] nouveau  [     DRM] DCB version 4.0
[   11.035781] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[   11.035783] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[   11.035786] nouveau  [     DRM] DCB outp 02: 02021362 00020010
[   11.035788] nouveau  [     DRM] DCB outp 04: 01032310 00000000
[   11.035790] nouveau  [     DRM] DCB conn 00: 00001030
[   11.035792] nouveau  [     DRM] DCB conn 01: 00002161
[   11.035795] nouveau  [     DRM] DCB conn 02: 00000200
[   11.079039] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   11.079041] [drm] No driver support for vblank timestamp query.
[   11.126156] nouveau  [     DRM] MM: using COPY for buffer copies
[   11.182923] nouveau  [     DRM] allocated 1920x1080 fb: 0x70000, bo ffff8800b85e4800
[   11.183480] fbcon: nouveaufb (fb0) is primary device
[   11.243061] Console: switching to colour frame buffer device 240x67
[   11.246236] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   11.246239] nouveau 0000:02:00.0: registered panic notifier
[   11.246262] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on minor 0
[   12.448760] Adding 1951892k swap on /dev/sdb2.  Priority:-1 extents:1 across:1951892k 
[   12.499048] kjournald starting.  Commit interval 5 seconds
[   12.499293] EXT3-fs (sdb1): using internal journal
[   12.499298] EXT3-fs (sdb1): mounted filesystem with writeback data mode
[   12.537775] kjournald starting.  Commit interval 5 seconds
[   12.538036] EXT3-fs (sdb6): using internal journal
[   12.538042] EXT3-fs (sdb6): mounted filesystem with writeback data mode
[   12.556783] EXT4-fs (sdb7): mounted filesystem with ordered data mode. Opts: (null)
[   12.607628] EXT4-fs (sdb8): mounted filesystem with ordered data mode. Opts: (null)
[   12.633611] EXT4-fs (sdb9): mounted filesystem with ordered data mode. Opts: (null)
[   12.634890] btrfs: device fsid bacdf4ee-3b0c-423f-8f03-3701a7f24b74 devid 1 transid 155206 /dev/sda2
[   12.635901] btrfs: use ssd allocation scheme

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--BXVAT5kNtrzKuDFl--
