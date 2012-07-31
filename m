From: Birin Sanchez <birintxo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: 9800m GT
Date: Tue, 31 Jul 2012 19:08:12 +0200
Message-ID: <501810FC.6020402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

Hi Everyone!

I've been trying to get my Nvidia 9800m GT working with the latest 
nouveau drivers with no luck so far. First of all I'd like to mention 
that this is a weird card as it is an SLI in one piece of hardware (not 
2 separated cards). It came with my Dell XPS M1730 laptop.

I know SLI is not currently supported and _I don't want_ to use SLI, I 
just would like to use one of the cards with nouveau drivers.

I build the latest drm drivers from the Linus tree, this is the last commit:

    commit 3f3dbea1c9818d29ab0d5b4a28d2c87006de54e3
    Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Date:   Fri Jul 27 14:18:03 2012 +1000

As soon as I load nouveau driver the monitor goes blank but from the 
logs everything seems to be perfect. If I ssh into my laptop from 
another computer I can even start a X session and everything loads 
without problems. I can run xrandr from the ssh session and see the 
available resolutions, I can even change the resolution using xrandr and 
see how the monitor blinks as if it is changing the resolution but still 
no picture on it.

I have done some debugging on the drm module and found the bit of code 
that makes the monitor go blank. It's on file nv50_display.c, function 
nv50_display_sync(), line 152:

  143         if (ret == 0) {
  144                 BEGIN_NV04(evo, 0, 0x0084, 1);
  145                 OUT_RING  (evo, 0x80000000);
  146                 BEGIN_NV04(evo, 0, 0x0080, 1);
  147                 OUT_RING  (evo, 0);
  148                 BEGIN_NV04(evo, 0, 0x0084, 1);
  149                 OUT_RING  (evo, 0x00000000);
  150
  151                 nv_wo32(disp->ntfy, 0x000, 0x00000000);
  152                 FIRE_RING (evo);
  153
  154                 start = ptimer->read(dev);
  155                 do {
  156                         if (nv_ro32(disp->ntfy, 0x000))
  157                                 return 0;
  158                 } while (ptimer->read(dev) - start < 2000000000ULL);
  159         }

Looking at hwdocs in envytools documents I found out that 0x0084 is 
sending FLUSH_CRTL to the card and 0x0080 is sending FLUSH. I played 
with values in line 145 with no luck so far.

Any suggestions on what to try or where to go from here will be more 
than welcome ;) How can I get what values does the blob use to get this 
card working?

I leave the output of dmesg here in case it is of any help.

Cheers,

Birin

dmesg:

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.5.0-birin5+ (root@bdev) (gcc version 
4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #4 SMP Mon Jul 30 17:44:34 CEST 2012
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   NSC Geode by NSC
[    0.000000]   Cyrix CyrixInstead
[    0.000000]   Centaur CentaurHauls
[    0.000000]   Transmeta GenuineTMx86
[    0.000000]   Transmeta TransmetaCPU
[    0.000000]   UMC UMC UMC UMC
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bfe71fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bfe72000-0x00000000bfffffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec0ffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed18000-0x00000000fed1bfff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed8ffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000feda0000-0x00000000feda5fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee0ffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffe00000-0x00000000ffffffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000013fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI 2.4 present.
[    0.000000] DMI: Dell Inc. MXG071 /0Y012C, BIOS A11 04/23/2010
[    0.000000] e820: update [mem 0x00000000-0x0000ffff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x140000 max_arch_pfn = 0x1000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-CFFFF write-protect
[    0.000000]   D0000-EFFFF uncachable
[    0.000000]   F0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask F80000000 write-back
[    0.000000]   1 base 080000000 mask FC0000000 write-back
[    0.000000]   2 base 100000000 mask FC0000000 write-back
[    0.000000]   3 base 0BFF00000 mask FFFF00000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 
0x7010600070106
[    0.000000] original variable MTRRs
[    0.000000] reg 0, base: 0GB, range: 2GB, type WB
[    0.000000] reg 1, base: 2GB, range: 1GB, type WB
[    0.000000] reg 2, base: 4GB, range: 1GB, type WB
[    0.000000] reg 3, base: 3071MB, range: 1MB, type UC
[    0.000000] total RAM covered: 4095M
[    0.000000] Found optimal setting for mtrr clean up
[    0.000000]  gran_size: 64K     chunk_size: 2M     num_reg: 4     
lose cover RAM: 0G
[    0.000000] New variable MTRRs
[    0.000000] reg 0, base: 0GB, range: 2GB, type WB
[    0.000000] reg 1, base: 2GB, range: 1GB, type WB
[    0.000000] reg 2, base: 3071MB, range: 1MB, type UC
[    0.000000] reg 3, base: 4GB, range: 1GB, type WB
[    0.000000] e820: update [mem 0xbff00000-0xffffffff] usable ==> reserved
[    0.000000] initial memory mapped: [mem 0x00000000-0x01ffffff]
[    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
[    0.000000] init_memory_mapping: [mem 0x00000000-0x37bfdfff]
[    0.000000]  [mem 0x00000000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0x379fffff] page 2M
[    0.000000]  [mem 0x37a00000-0x37bfdfff] page 4k
[    0.000000] kernel direct mapping tables up to 0x37bfdfff @ [mem 
0x01ffa000-0x01ffffff]
[    0.000000] RAMDISK: [mem 0x36f92000-0x377c0fff]
[    0.000000] ACPI: RSDP 000fb8d0 00024 (v02 DELL  )
[    0.000000] ACPI: XSDT bfe73a00 00064 (v01 DELL    M08 27DA0417 ASL  
00000061)
[    0.000000] ACPI: FACP bfe7389c 000F4 (v04 DELL    M08 27DA0417 ASL  
00000061)
[    0.000000] ACPI: DSDT bfe74000 04BD0 (v02 INT430 SYSFexxx 00001001 
INTL 20050624)
[    0.000000] ACPI: FACS bfe82800 00040
[    0.000000] ACPI: HPET bfe73b00 00038 (v01 DELL    M08 00000001 ASL  
00000061)
[    0.000000] ACPI: APIC bfe73c00 00068 (v01 DELL    M08 27DA0417 ASL  
00000047)
[    0.000000] ACPI: MCFG bfe73bc0 0003E (v16 DELL    M08 27DA0417 ASL  
00000061)
[    0.000000] ACPI: OSFR bfe73200 0007C (v01 DELL    M08 27DA0417 ASL  
00000061)
[    0.000000] ACPI: SLIC bfe73c9c 00176 (v01 DELL    M08 27DA0417 ASL  
00000061)
[    0.000000] ACPI: BOOT bfe737c0 00028 (v01 DELL    M08 27DA0417 ASL  
00000061)
[    0.000000] ACPI: SSDT bfe7217e 004CC (v01  PmRef    CpuPm 00003000 
INTL 20050624)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] 4228MB HIGHMEM available.
[    0.000000] 891MB LOWMEM available.
[    0.000000]   mapped low ram: 0 - 37bfe000
[    0.000000]   low ram: 0 - 37bfe000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00010000-0x00ffffff]
[    0.000000]   Normal   [mem 0x01000000-0x37bfdfff]
[    0.000000]   HighMem  [mem 0x37bfe000-0x3fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00010000-0x0009efff]
[    0.000000]   node   0: [mem 0x00100000-0xbfe71fff]
[    0.000000]   node   0: [mem 0x00000000-0x3fffffff]
[    0.000000] On node 0 totalpages: 1048065
[    0.000000] free_area_init_node: node 0, pgdat c183dc80, node_mem_map 
f4792200
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3951 pages, LIFO batch:0
[    0.000000]   Normal zone: 1752 pages used for memmap
[    0.000000]   Normal zone: 222502 pages, LIFO batch:31
[    0.000000]   HighMem zone: 8457 pages used for memmap
[    0.000000]   HighMem zone: 811371 pages, LIFO batch:31
[    0.000000] Using APIC driver default
[    0.000000] ACPI: PM-Timer IO Port: 0x1008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 
0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] SMP: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: 000000000009f000 - 
00000000000a0000
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 
0000000000100000
[    0.000000] e820: [mem 0xc0000000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 
nr_node_ids:1
[    0.000000] PERCPU: Embedded 14 pages/cpu @f7bcf000 s33920 r0 d23424 
u57344
[    0.000000] pcpu-alloc: s33920 r0 d23424 u57344 alloc=14*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  
Total pages: 1037824
[    0.000000] Kernel command line: 
BOOT_IMAGE=/boot/vmlinuz-3.5.0-birin5+ 
root=UUID=e94731c1-775c-4622-b537-eabe0c918fbb ro kgdboc=kbd
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 
bytes)
[    0.000000] __ex_table already sorted, skipping sort
[    0.000000] Initializing CPU#0
[    0.000000] allocated 10485632 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't 
want memory cgroups
[    0.000000] Initializing HighMem for node 0 (00037bfe:00140000)
[    0.000000] Memory: 4121520k/5242880k available (5756k kernel code, 
70740k reserved, 2733k data, 720k init, 3279312k highmem)
[    0.000000] virtual kernel memory layout:
[    0.000000]     fixmap  : 0xfff16000 - 0xfffff000   ( 932 kB)
[    0.000000]     pkmap   : 0xffc00000 - 0xffe00000   (2048 kB)
[    0.000000]     vmalloc : 0xf83fe000 - 0xffbfe000   ( 120 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf7bfe000   ( 891 MB)
[    0.000000]       .init : 0xc184b000 - 0xc18ff000   ( 720 kB)
[    0.000000]       .data : 0xc159f2d5 - 0xc184a880   (2733 kB)
[    0.000000]       .text : 0xc1000000 - 0xc159f2d5   (5756 kB)
[    0.000000] Checking if this processor honours the WP bit even in 
supervisor mode...Ok.
[    0.000000] SLUB: Genslabs=15, HWalign=64, Order=0-3, MinObjects=0, 
CPUs=2, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     RCU dyntick-idle grace-period acceleration is enabled.
[    0.000000] NR_IRQS:2304 nr_irqs:512 16
[    0.000000] CPU 0 irqstacks, hard=f3808000 soft=f380a000
[    0.000000] Extended CMOS year: 2000
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] hpet clockevent registered
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 2493.654 MHz processor.
[    0.004001] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 4987.30 BogoMIPS (lpj=9974616)
[    0.004167] pid_max: default: 32768 minimum: 301
[    0.004266] Security Framework initialized
[    0.004356] AppArmor: AppArmor initialized
[    0.004476] Mount-cache hash table entries: 512
[    0.004756] Initializing cgroup subsys cpuacct
[    0.004838] Initializing cgroup subsys memory
[    0.004924] Initializing cgroup subsys devices
[    0.008004] Initializing cgroup subsys freezer
[    0.008084] Initializing cgroup subsys blkio
[    0.008164] Initializing cgroup subsys perf_event
[    0.008271] CPU: Physical Processor ID: 0
[    0.008350] CPU: Processor Core ID: 0
[    0.008432] mce: CPU supports 6 MCE banks
[    0.008519] CPU0: Thermal monitoring enabled (TM2)
[    0.008601] using mwait in idle threads.
[    0.010704] ACPI: Core revision 20120320
[    0.015447] ftrace: allocating 23551 entries in 46 pages
[    0.024034] Enabling APIC mode:  Flat.  Using 1 I/O APICs
[    0.024571] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.067409] CPU0: Intel(R) Core(TM)2 Duo CPU     T9300  @ 2.50GHz 
stepping 06
[    0.068003] Performance Events: PEBS fmt0+, 4-deep LBR, Core2 events, 
Intel PMU driver.
[    0.068003] ... version:                2
[    0.068003] ... bit width:              40
[    0.068003] ... generic registers:      2
[    0.068003] ... value mask:             000000ffffffffff
[    0.068003] ... max period:             000000007fffffff
[    0.068003] ... fixed-purpose events:   3
[    0.068003] ... event mask:             0000000700000003
[    0.068003] NMI watchdog: enabled on all CPUs, permanently consumes 
one hw-PMU counter.
[    0.068003] CPU 1 irqstacks, hard=f38e0000 soft=f38e2000
[    0.068003] Booting Node   0, Processors  #1 Ok.
[    0.008000] Initializing CPU#1
[    0.078497] Brought up 2 CPUs
[    0.078659] Total of 2 processors activated (9974.61 BogoMIPS).
[    0.080078] devtmpfs: initialized
[    0.080273] EVM: security.selinux
[    0.080354] EVM: security.SMACK64
[    0.080432] EVM: security.capability
[    0.080950] dummy:
[    0.081066] RTC time: 18:06:51, date: 07/31/12
[    0.081186] NET: Registered protocol family 16
[    0.081399] EISA bus registered
[    0.084030] ACPI: bus type pci registered
[    0.084162] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.084265] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.084350] PCI: Using MMCONFIG for extended config space
[    0.084433] PCI: Using configuration type 1 for base access
[    0.084525] dmi type 0xB1 record - unknown flag
[    0.085543] bio: create slab <bio-0> at 0
[    0.085543] ACPI: Added _OSI(Module Device)
[    0.085543] ACPI: Added _OSI(Processor Device)
[    0.085543] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.085543] ACPI: Added _OSI(Processor Aggregator Device)
[    0.085543] ACPI: EC: Look up EC in DSDT
[    0.089677] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.093944] ACPI: SSDT bfe82880 00043 (v01  LMPWR  DELLLOM 00001001 
INTL 20050624)
[    0.094382] ACPI: Dynamic OEM Table Load:
[    0.094585] ACPI: SSDT   (null) 00043 (v01  LMPWR  DELLLOM 00001001 
INTL 20050624)
[    0.095044] ACPI: SSDT bfe72cb4 002C8 (v01  PmRef  Cpu0Ist 00003000 
INTL 20050624)
[    0.095496] ACPI: Dynamic OEM Table Load:
[    0.095698] ACPI: SSDT   (null) 002C8 (v01  PmRef  Cpu0Ist 00003000 
INTL 20050624)
[    0.096118] ACPI: SSDT bfe7264a 005E5 (v01  PmRef  Cpu0Cst 00003001 
INTL 20050624)
[    0.096553] ACPI: Dynamic OEM Table Load:
[    0.096757] ACPI: SSDT   (null) 005E5 (v01  PmRef  Cpu0Cst 00003001 
INTL 20050624)
[    0.097174] ACPI: SSDT bfe72f7c 000C4 (v01  PmRef  Cpu1Ist 00003000 
INTL 20050624)
[    0.097619] ACPI: Dynamic OEM Table Load:
[    0.097820] ACPI: SSDT   (null) 000C4 (v01  PmRef  Cpu1Ist 00003000 
INTL 20050624)
[    0.098131] ACPI: SSDT bfe72c2f 00085 (v01  PmRef  Cpu1Cst 00003000 
INTL 20050624)
[    0.100296] ACPI: Dynamic OEM Table Load:
[    0.100500] ACPI: SSDT   (null) 00085 (v01  PmRef  Cpu1Cst 00003000 
INTL 20050624)
[    0.100882] ACPI: Interpreter enabled
[    0.100969] ACPI: (supports S0 S3 S4 S5)
[    0.101305] ACPI: Using IOAPIC for interrupt routing
[    0.133073] ACPI: No dock devices found.
[    0.133160] PCI: Using host bridge windows from ACPI; if necessary, 
use "pci=nocrs" and report a bug
[    0.141405] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.157592] pci_root PNP0A03:00: host bridge window [io 0x0000-0x0cf7]
[    0.157679] pci_root PNP0A03:00: host bridge window [io 0x0d00-0xffff]
[    0.157765] pci_root PNP0A03:00: host bridge window [mem 
0x000a0000-0x000bffff]
[    0.157865] pci_root PNP0A03:00: host bridge window [mem 
0x000d0000-0x000dffff]
[    0.157963] pci_root PNP0A03:00: host bridge window [mem 
0xc0000000-0xf7ffffff]
[    0.158063] pci_root PNP0A03:00: host bridge window [mem 
0xfc000000-0xfebfffff]
[    0.158162] pci_root PNP0A03:00: host bridge window [mem 
0xfec10000-0xfecfffff]
[    0.158262] pci_root PNP0A03:00: host bridge window [mem 
0xfed1c000-0xfed1ffff]
[    0.158361] pci_root PNP0A03:00: host bridge window [mem 
0xfed90000-0xfed9ffff]
[    0.158460] pci_root PNP0A03:00: host bridge window [mem 
0xfeda7000-0xfedfffff]
[    0.158559] pci_root PNP0A03:00: host bridge window [mem 
0xfee10000-0xff9fffff]
[    0.158659] pci_root PNP0A03:00: host bridge window [mem 
0xffc00000-0xffdfffff]
[    0.158760] pci_root PNP0A03:00: host bridge window [mem 
0x140000000-0x337ffffff]
[    0.158898] PCI host bridge to bus 0000:00
[    0.158980] pci_bus 0000:00: root bus resource [io 0x0000-0x0cf7]
[    0.159065] pci_bus 0000:00: root bus resource [io 0x0d00-0xffff]
[    0.159150] pci_bus 0000:00: root bus resource [mem 
0x000a0000-0x000bffff]
[    0.159235] pci_bus 0000:00: root bus resource [mem 
0x000d0000-0x000dffff]
[    0.159320] pci_bus 0000:00: root bus resource [mem 
0xc0000000-0xf7ffffff]
[    0.159404] pci_bus 0000:00: root bus resource [mem 
0xfc000000-0xfebfffff]
[    0.159490] pci_bus 0000:00: root bus resource [mem 
0xfec10000-0xfecfffff]
[    0.159575] pci_bus 0000:00: root bus resource [mem 
0xfed1c000-0xfed1ffff]
[    0.159661] pci_bus 0000:00: root bus resource [mem 
0xfed90000-0xfed9ffff]
[    0.159746] pci_bus 0000:00: root bus resource [mem 
0xfeda7000-0xfedfffff]
[    0.159832] pci_bus 0000:00: root bus resource [mem 
0xfee10000-0xff9fffff]
[    0.159918] pci_bus 0000:00: root bus resource [mem 
0xffc00000-0xffdfffff]
[    0.160011] pci_bus 0000:00: root bus resource [mem 
0x140000000-0x337ffffff]
[    0.160106] pci 0000:00:00.0: [8086:2a00] type 00 class 0x060000
[    0.160154] pci 0000:00:01.0: [8086:2a01] type 01 class 0x060400
[    0.160199] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.160251] pci 0000:00:1a.0: [8086:2834] type 00 class 0x0c0300
[    0.160308] pci 0000:00:1a.0: reg 20: [io  0x6f20-0x6f3f]
[    0.160350] pci 0000:00:1a.1: [8086:2835] type 00 class 0x0c0300
[    0.160406] pci 0000:00:1a.1: reg 20: [io  0x6f00-0x6f1f]
[    0.160463] pci 0000:00:1a.7: [8086:283a] type 00 class 0x0c0320
[    0.160487] pci 0000:00:1a.7: reg 10: [mem 0xfed1c400-0xfed1c7ff]
[    0.160595] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    0.160628] pci 0000:00:1b.0: [8086:284b] type 00 class 0x040300
[    0.160650] pci 0000:00:1b.0: reg 10: [mem 0xf7ffc000-0xf7ffffff 64bit]
[    0.160754] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.160786] pci 0000:00:1c.0: [8086:283f] type 01 class 0x060400
[    0.160896] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.160931] pci 0000:00:1c.1: [8086:2841] type 01 class 0x060400
[    0.161040] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.161076] pci 0000:00:1c.3: [8086:2845] type 01 class 0x060400
[    0.161186] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.161221] pci 0000:00:1c.4: [8086:2847] type 01 class 0x060400
[    0.161331] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.161366] pci 0000:00:1c.5: [8086:2849] type 01 class 0x060400
[    0.161475] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.161509] pci 0000:00:1d.0: [8086:2830] type 00 class 0x0c0300
[    0.161565] pci 0000:00:1d.0: reg 20: [io  0x6f80-0x6f9f]
[    0.161608] pci 0000:00:1d.1: [8086:2831] type 00 class 0x0c0300
[    0.161664] pci 0000:00:1d.1: reg 20: [io  0x6f60-0x6f7f]
[    0.161705] pci 0000:00:1d.2: [8086:2832] type 00 class 0x0c0300
[    0.161761] pci 0000:00:1d.2: reg 20: [io  0x6f40-0x6f5f]
[    0.161817] pci 0000:00:1d.7: [8086:2836] type 00 class 0x0c0320
[    0.161841] pci 0000:00:1d.7: reg 10: [mem 0xfed1c000-0xfed1c3ff]
[    0.161948] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.161974] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.162070] pci 0000:00:1f.0: [8086:2811] type 00 class 0x060100
[    0.162184] pci 0000:00:1f.0: quirk: [io  0x1000-0x107f] claimed by 
ICH6 ACPI/GPIO/TCO
[    0.162289] pci 0000:00:1f.0: quirk: [io  0x1080-0x10bf] claimed by 
ICH6 GPIO
[    0.162378] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 
0900 (mask 007f)
[    0.162482] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 3 PIO at 
0c80 (mask 003f)
[    0.162638] pci 0000:00:1f.1: [8086:2850] type 00 class 0x01018a
[    0.162655] pci 0000:00:1f.1: reg 10: [io  0x01f0-0x01f7]
[    0.162667] pci 0000:00:1f.1: reg 14: [io  0x03f4-0x03f7]
[    0.162679] pci 0000:00:1f.1: reg 18: [io  0x0170-0x0177]
[    0.162691] pci 0000:00:1f.1: reg 1c: [io  0x0374-0x0377]
[    0.162703] pci 0000:00:1f.1: reg 20: [io  0x6fa0-0x6faf]
[    0.162757] pci 0000:00:1f.2: [8086:2829] type 00 class 0x010601
[    0.162783] pci 0000:00:1f.2: reg 10: [io  0x6eb0-0x6eb7]
[    0.162795] pci 0000:00:1f.2: reg 14: [io  0x6eb8-0x6ebb]
[    0.162807] pci 0000:00:1f.2: reg 18: [io  0x6ec0-0x6ec7]
[    0.162819] pci 0000:00:1f.2: reg 1c: [io  0x6ec8-0x6ecb]
[    0.162831] pci 0000:00:1f.2: reg 20: [io  0x6ee0-0x6eff]
[    0.162843] pci 0000:00:1f.2: reg 24: [mem 0xfed1c800-0xfed1cfff]
[    0.162908] pci 0000:00:1f.2: PME# supported from D3hot
[    0.162932] pci 0000:00:1f.3: [8086:283e] type 00 class 0x0c0500
[    0.162949] pci 0000:00:1f.3: reg 10: [mem 0xf7ffbf00-0xf7ffbfff]
[    0.162991] pci 0000:00:1f.3: reg 20: [io  0x10c0-0x10df]
[    0.163071] pci 0000:01:00.0: [10de:01b3] type 01 class 0x060400
[    0.163085] pci 0000:01:00.0: reg 10: [mem 0xf7efc000-0xf7efffff]
[    0.163147] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.163163] pci 0000:01:00.0: disabling ASPM on pre-1.1 PCIe device.  
You can enable it with 'pcie_aspm=force'
[    0.163273] pci 0000:00:01.0: PCI bridge to [bus 01-04]
[    0.163351] pci 0000:00:01.0:   bridge window [io  0xd000-0xefff]
[    0.163354] pci 0000:00:01.0:   bridge window [mem 0xf0f00000-0xf7efffff]
[    0.163358] pci 0000:00:01.0:   bridge window [mem 
0xc0000000-0xdfffffff 64bit pref]
[    0.163396] pci 0000:02:00.0: [10de:01b3] type 01 class 0x060400
[    0.163448] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.163459] pci 0000:02:00.0: disabling ASPM on pre-1.1 PCIe device.  
You can enable it with 'pcie_aspm=force'
[    0.163566] pci 0000:02:01.0: [10de:01b3] type 01 class 0x060400
[    0.163618] pci 0000:02:01.0: PME# supported from D0 D3hot D3cold
[    0.163629] pci 0000:02:00.0: disabling ASPM on pre-1.1 PCIe device.  
You can enable it with 'pcie_aspm=force'
[    0.163750] pci 0000:01:00.0: PCI bridge to [bus 02-04]
[    0.163829] pci 0000:01:00.0:   bridge window [io  0xd000-0xefff]
[    0.163833] pci 0000:01:00.0:   bridge window [mem 0xf0f00000-0xf7dfffff]
[    0.163839] pci 0000:01:00.0:   bridge window [mem 
0xc0000000-0xdfffffff 64bit pref]
[    0.163886] pci 0000:03:00.0: [10de:060b] type 00 class 0x030000
[    0.163903] pci 0000:03:00.0: reg 10: [mem 0xf6000000-0xf6ffffff]
[    0.163921] pci 0000:03:00.0: reg 14: [mem 0xc0000000-0xcfffffff 
64bit pref]
[    0.163940] pci 0000:03:00.0: reg 1c: [mem 0xf4000000-0xf5ffffff 64bit]
[    0.163952] pci 0000:03:00.0: reg 24: [io  0xef00-0xef7f]
[    0.163965] pci 0000:03:00.0: reg 30: [mem 0xf7d00000-0xf7d1ffff pref]
[    0.172023] pci 0000:02:00.0: PCI bridge to [bus 03-03]
[    0.172103] pci 0000:02:00.0:   bridge window [io  0xe000-0xefff]
[    0.172107] pci 0000:02:00.0:   bridge window [mem 0xf4000000-0xf7dfffff]
[    0.172113] pci 0000:02:00.0:   bridge window [mem 
0xc0000000-0xcfffffff 64bit pref]
[    0.172156] pci 0000:04:00.0: [10de:060b] type 00 class 0x030200
[    0.172170] pci 0000:04:00.0: reg 10: [mem 0xf1000000-0xf1ffffff]
[    0.172184] pci 0000:04:00.0: reg 14: [mem 0xd0000000-0xdfffffff 
64bit pref]
[    0.172199] pci 0000:04:00.0: reg 1c: [mem 0xf2000000-0xf3ffffff 64bit]
[    0.172209] pci 0000:04:00.0: reg 24: [io  0xdf00-0xdf7f]
[    0.172218] pci 0000:04:00.0: reg 30: [mem 0xf0f00000-0xf0f1ffff pref]
[    0.180021] pci 0000:02:01.0: PCI bridge to [bus 04-04]
[    0.180100] pci 0000:02:01.0:   bridge window [io  0xd000-0xdfff]
[    0.180104] pci 0000:02:01.0:   bridge window [mem 0xf0f00000-0xf3ffffff]
[    0.180110] pci 0000:02:01.0:   bridge window [mem 
0xd0000000-0xdfffffff 64bit pref]
[    0.180183] pci 0000:00:1c.0: PCI bridge to [bus 0b-0b]
[    0.180394] pci 0000:0c:00.0: [8086:4229] type 00 class 0x028000
[    0.180447] pci 0000:0c:00.0: reg 10: [mem 0xf0efe000-0xf0efffff 64bit]
[    0.180660] pci 0000:0c:00.0: PME# supported from D0 D3hot D3cold
[    0.188053] pci 0000:00:1c.1: PCI bridge to [bus 0c-0c]
[    0.188135] pci 0000:00:1c.1:   bridge window [mem 0xf0e00000-0xf0efffff]
[    0.188203] pci 0000:00:1c.3: PCI bridge to [bus 0d-0e]
[    0.188282] pci 0000:00:1c.3:   bridge window [io  0xc000-0xcfff]
[    0.188287] pci 0000:00:1c.3:   bridge window [mem 0xf0c00000-0xf0dfffff]
[    0.188295] pci 0000:00:1c.3:   bridge window [mem 
0xe0000000-0xe01fffff 64bit pref]
[    0.188385] pci 0000:0f:00.0: [1971:0000] type 00 class 0xff0000
[    0.188409] pci 0000:0f:00.0: reg 10: [mem 0xef000000-0xefffffff]
[    0.188606] pci 0000:0f:00.0: PME# supported from D0 D1 D2 D3hot
[    0.188641] pci 0000:0f:00.0: disabling ASPM on pre-1.1 PCIe device.  
You can enable it with 'pcie_aspm=force'
[    0.188747] pci 0000:00:1c.4: PCI bridge to [bus 0f-0f]
[    0.188828] pci 0000:00:1c.4:   bridge window [mem 0xef000000-0xf0bfffff]
[    0.188966] pci 0000:09:00.0: [14e4:1672] type 00 class 0x020000
[    0.188999] pci 0000:09:00.0: reg 10: [mem 0xeeff0000-0xeeffffff 64bit]
[    0.189186] pci 0000:09:00.0: PME# supported from D3hot D3cold
[    0.196067] pci 0000:00:1c.5: PCI bridge to [bus 09-09]
[    0.196150] pci 0000:00:1c.5:   bridge window [mem 0xeef00000-0xeeffffff]
[    0.196203] pci 0000:05:01.0: [1180:0832] type 00 class 0x0c0010
[    0.196227] pci 0000:05:01.0: reg 10: [mem 0xeeeff800-0xeeefffff]
[    0.196324] pci 0000:05:01.0: supports D1 D2
[    0.196326] pci 0000:05:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.196351] pci 0000:05:01.1: [1180:0822] type 00 class 0x080501
[    0.196373] pci 0000:05:01.1: reg 10: [mem 0xeeeff500-0xeeeff5ff]
[    0.196474] pci 0000:05:01.1: supports D1 D2
[    0.196476] pci 0000:05:01.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.196500] pci 0000:05:01.2: [1180:0592] type 00 class 0x088000
[    0.196522] pci 0000:05:01.2: reg 10: [mem 0xeeeff600-0xeeeff6ff]
[    0.196621] pci 0000:05:01.2: supports D1 D2
[    0.196623] pci 0000:05:01.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.196647] pci 0000:05:01.3: [1180:0852] type 00 class 0x088000
[    0.196669] pci 0000:05:01.3: reg 10: [mem 0xeeeff700-0xeeeff7ff]
[    0.196768] pci 0000:05:01.3: supports D1 D2
[    0.196770] pci 0000:05:01.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.196843] pci 0000:00:1e.0: PCI bridge to [bus 05-05] (subtractive 
decode)
[    0.196927] pci 0000:00:1e.0:   bridge window [mem 0xeee00000-0xeeefffff]
[    0.196935] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] 
(subtractive decode)
[    0.196938] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] 
(subtractive decode)
[    0.196940] pci 0000:00:1e.0:   bridge window [mem 
0x000a0000-0x000bffff] (subtractive decode)
[    0.196942] pci 0000:00:1e.0:   bridge window [mem 
0x000d0000-0x000dffff] (subtractive decode)
[    0.196944] pci 0000:00:1e.0:   bridge window [mem 
0xc0000000-0xf7ffffff] (subtractive decode)
[    0.196946] pci 0000:00:1e.0:   bridge window [mem 
0xfc000000-0xfebfffff] (subtractive decode)
[    0.196948] pci 0000:00:1e.0:   bridge window [mem 
0xfec10000-0xfecfffff] (subtractive decode)
[    0.196950] pci 0000:00:1e.0:   bridge window [mem 
0xfed1c000-0xfed1ffff] (subtractive decode)
[    0.196953] pci 0000:00:1e.0:   bridge window [mem 
0xfed90000-0xfed9ffff] (subtractive decode)
[    0.196955] pci 0000:00:1e.0:   bridge window [mem 
0xfeda7000-0xfedfffff] (subtractive decode)
[    0.196957] pci 0000:00:1e.0:   bridge window [mem 
0xfee10000-0xff9fffff] (subtractive decode)
[    0.196959] pci 0000:00:1e.0:   bridge window [mem 
0xffc00000-0xffdfffff] (subtractive decode)
[    0.196961] pci 0000:00:1e.0:   bridge window [mem 
0x140000000-0x337ffffff] (subtractive decode)
[    0.197002] pci_bus 0000:00: on NUMA node 0
[    0.197005] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.197247] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
[    0.197334] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
[    0.197371] ACPI: PCI Interrupt Routing Table 
[\_SB_.PCI0.AGP_.SLI_.SLI0._PRT]
[    0.197411] ACPI: PCI Interrupt Routing Table 
[\_SB_.PCI0.AGP_.SLI_.SLI1._PRT]
[    0.197447] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.RP01._PRT]
[    0.197493] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.RP02._PRT]
[    0.197540] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.RP04._PRT]
[    0.197584] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.RP05._PRT]
[    0.197629] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.RP06._PRT]
[    0.197676]  pci0000:00: Requesting ACPI _OSC control (0x1d)
[    0.197753]  pci0000:00: ACPI _OSC request failed (AE_NOT_FOUND), 
returned control mask: 0x1d
[    0.197846] ACPI _OSC control for PCIe not granted, disabling ASPM
[    0.206940] ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 11) *7
[    0.207403] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7) *10
[    0.207809] ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 11) *4
[    0.208250] ACPI: PCI Interrupt Link [LNKD] (IRQs *5 7 9 10 11)
[    0.208765] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11 
12 14 15)
[    0.209619] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 *10 11 
12 14 15)
[    0.210472] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 *9 10 11 
12 14 15)
[    0.211316] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 11 
12 14 15) *0, disabled.
[    0.212322] vgaarb: device added: 
PCI:0000:03:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.212322] vgaarb: loaded
[    0.212322] vgaarb: bridge control possible 0000:03:00.0
[    0.212422] SCSI subsystem initialized
[    0.212503] libata version 3.00 loaded.
[    0.212503] ACPI: bus type usb registered
[    0.212503] usbcore: registered new interface driver usbfs
[    0.212503] usbcore: registered new interface driver hub
[    0.212503] usbcore: registered new device driver usb
[    0.212503] PCI: Using ACPI for IRQ routing
[    0.213209] PCI: pci_cache_line_size set to 64 bytes
[    0.213463] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.213465] e820: reserve RAM buffer [mem 0xbfe72000-0xbfffffff]
[    0.213550] NetLabel: Initializing
[    0.213623] NetLabel:  domain hash size = 128
[    0.213697] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.213780] NetLabel:  unlabeled traffic allowed by default
[    0.216068] HPET: 3 timers in total, 0 timers will be used for 
per-cpu timer
[    0.216150] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.216442] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
[    0.220032] Switching to clocksource hpet
[    0.227533] AppArmor: AppArmor Filesystem Enabled
[    0.227621] pnp: PnP ACPI init
[    0.227703] ACPI: bus type pnp registered
[    0.235844] pnp 00:00: [bus 00-ff]
[    0.235847] pnp 00:00: [io  0x0000-0x0cf7 window]
[    0.235849] pnp 00:00: [io  0x0cf8-0x0cff]
[    0.235851] pnp 00:00: [io  0x0d00-0xffff window]
[    0.235854] pnp 00:00: [mem 0x000a0000-0x000bffff window]
[    0.235856] pnp 00:00: [mem 0x000d0000-0x000dffff window]
[    0.235858] pnp 00:00: [mem 0xc0000000-0xf7ffffff window]
[    0.235860] pnp 00:00: [mem 0xfc000000-0xfebfffff window]
[    0.235862] pnp 00:00: [mem 0xfec10000-0xfecfffff window]
[    0.235864] pnp 00:00: [mem 0xfed1c000-0xfed1ffff window]
[    0.235866] pnp 00:00: [mem 0xfed90000-0xfed9ffff window]
[    0.235868] pnp 00:00: [mem 0xfeda7000-0xfedfffff window]
[    0.235870] pnp 00:00: [mem 0xfee10000-0xff9fffff window]
[    0.235872] pnp 00:00: [mem 0xffc00000-0xffdfffff window]
[    0.235875] pnp 00:00: [mem 0x140000000-0x337ffffff window]
[    0.235929] pnp 00:00: Plug and Play ACPI device, IDs PNP0a03 (active)
[    0.235953] pnp 00:01: [irq 12]
[    0.235974] pnp 00:01: Plug and Play ACPI device, IDs PNP0f13 (active)
[    0.235988] pnp 00:02: [io  0x0060]
[    0.235990] pnp 00:02: [io  0x0064]
[    0.235992] pnp 00:02: [io  0x0062]
[    0.236009] pnp 00:02: [io  0x0066]
[    0.236015] pnp 00:02: [irq 1]
[    0.236036] pnp 00:02: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.236050] pnp 00:03: [io  0x0070-0x0071]
[    0.236055] pnp 00:03: [irq 8]
[    0.236057] pnp 00:03: [io  0x0072-0x0077]
[    0.236080] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.236096] pnp 00:04: [io  0x0061]
[    0.236098] pnp 00:04: [io  0x0063]
[    0.236100] pnp 00:04: [io  0x0065]
[    0.236101] pnp 00:04: [io  0x0067]
[    0.236123] pnp 00:04: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.236136] pnp 00:05: [io  0x0c80-0x0cff]
[    0.236183] system 00:05: [io  0x0c80-0x0cff] could not be reserved
[    0.236261] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.236278] pnp 00:06: [dma 4]
[    0.236280] pnp 00:06: [io  0x0000-0x000f]
[    0.236282] pnp 00:06: [io  0x0080-0x0085]
[    0.236284] pnp 00:06: [io  0x0087-0x008f]
[    0.236286] pnp 00:06: [io  0x00c0-0x00df]
[    0.236289] pnp 00:06: [io  0x0010-0x001f]
[    0.236291] pnp 00:06: [io  0x0090-0x0091]
[    0.236293] pnp 00:06: [io  0x0093-0x009f]
[    0.236316] pnp 00:06: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.236329] pnp 00:07: [io  0x00f0-0x00ff]
[    0.236335] pnp 00:07: [irq 13]
[    0.236358] pnp 00:07: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.236391] pnp 00:08: [mem 0xfed00000-0xfed003ff]
[    0.236439] system 00:08: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.236518] system 00:08: Plug and Play ACPI device, IDs PNP0103 
PNP0c01 (active)
[    0.236638] pnp 00:09: [io  0x0900-0x097f]
[    0.236640] pnp 00:09: [io  0x0092]
[    0.236642] pnp 00:09: [io  0x00b2-0x00b3]
[    0.236644] pnp 00:09: [io  0x0020-0x0021]
[    0.236646] pnp 00:09: [io  0x00a0-0x00a1]
[    0.236648] pnp 00:09: [irq 0 disabled]
[    0.236650] pnp 00:09: [io  0x04d0-0x04d1]
[    0.236652] pnp 00:09: [io  0x1000-0x1005]
[    0.236654] pnp 00:09: [io  0x1008-0x100f]
[    0.236670] pnp 00:09: disabling [io  0x1000-0x1005] because it 
overlaps 0000:00:1f.0 BAR 13 [io  0x1000-0x107f]
[    0.236766] pnp 00:09: disabling [io  0x1008-0x100f] because it 
overlaps 0000:00:1f.0 BAR 13 [io  0x1000-0x107f]
[    0.236914] system 00:09: [io  0x0900-0x097f] has been reserved
[    0.236992] system 00:09: [io  0x04d0-0x04d1] has been reserved
[    0.237070] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.237085] pnp 00:0a: [io  0xf400-0xf4fe]
[    0.237087] pnp 00:0a: [io  0x0086]
[    0.237089] pnp 00:0a: [io  0x1006-0x1007]
[    0.237091] pnp 00:0a: [io  0x100a-0x1059]
[    0.237093] pnp 00:0a: [io  0x1080-0x10bf]
[    0.237095] pnp 00:0a: [io  0x10c0-0x10df]
[    0.237097] pnp 00:0a: [io  0x1010-0x102f]
[    0.237098] pnp 00:0a: [io  0x0809]
[    0.237113] pnp 00:0a: disabling [io  0x1006-0x1007] because it 
overlaps 0000:00:1f.0 BAR 13 [io  0x1000-0x107f]
[    0.237210] pnp 00:0a: disabling [io  0x100a-0x1059] because it 
overlaps 0000:00:1f.0 BAR 13 [io  0x1000-0x107f]
[    0.237307] pnp 00:0a: disabling [io  0x1010-0x102f] because it 
overlaps 0000:00:1f.0 BAR 13 [io  0x1000-0x107f]
[    0.237453] system 00:0a: [io  0xf400-0xf4fe] has been reserved
[    0.237533] system 00:0a: [io  0x1080-0x10bf] has been reserved
[    0.237610] system 00:0a: [io  0x10c0-0x10df] has been reserved
[    0.237688] system 00:0a: [io  0x0809] has been reserved
[    0.237765] system 00:0a: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.247319] pnp 00:0b: [mem 0x00000000-0x0009efff]
[    0.247321] pnp 00:0b: [mem 0x0009f000-0x0009ffff]
[    0.247323] pnp 00:0b: [mem 0x000c0000-0x000cffff]
[    0.247325] pnp 00:0b: [mem 0x000e0000-0x000fffff]
[    0.247327] pnp 00:0b: [mem 0x00100000-0xbfe71fff]
[    0.247329] pnp 00:0b: [mem 0xbfe72000-0xbfefffff]
[    0.247331] pnp 00:0b: [mem 0xbff00000-0xbfffffff]
[    0.247333] pnp 00:0b: [mem 0xffe00000-0xffffffff]
[    0.247335] pnp 00:0b: [mem 0xffa00000-0xffbfffff]
[    0.247337] pnp 00:0b: [mem 0xfec00000-0xfec0ffff]
[    0.247339] pnp 00:0b: [mem 0xfee00000-0xfee0ffff]
[    0.247341] pnp 00:0b: [mem 0xfed20000-0xfed8ffff]
[    0.247343] pnp 00:0b: [mem 0xfeda0000-0xfeda3fff]
[    0.247345] pnp 00:0b: [mem 0xfeda4000-0xfeda4fff]
[    0.247347] pnp 00:0b: [mem 0xfeda5000-0xfeda5fff]
[    0.247349] pnp 00:0b: [mem 0xfeda6000-0xfeda6fff]
[    0.247351] pnp 00:0b: [mem 0xfed1c800-0xfed1cfff]
[    0.247353] pnp 00:0b: [mem 0xfed18000-0xfed1bfff]
[    0.247355] pnp 00:0b: [mem 0xf8000000-0xfbffffff]
[    0.247446] system 00:0b: [mem 0x00000000-0x0009efff] could not be 
reserved
[    0.247525] system 00:0b: [mem 0x0009f000-0x0009ffff] could not be 
reserved
[    0.247604] system 00:0b: [mem 0x000c0000-0x000cffff] could not be 
reserved
[    0.247683] system 00:0b: [mem 0x000e0000-0x000fffff] could not be 
reserved
[    0.247761] system 00:0b: [mem 0x00100000-0xbfe71fff] could not be 
reserved
[    0.247840] system 00:0b: [mem 0xbfe72000-0xbfefffff] has been reserved
[    0.247918] system 00:0b: [mem 0xbff00000-0xbfffffff] has been reserved
[    0.248011] system 00:0b: [mem 0xffe00000-0xffffffff] has been reserved
[    0.248090] system 00:0b: [mem 0xffa00000-0xffbfffff] has been reserved
[    0.248168] system 00:0b: [mem 0xfec00000-0xfec0ffff] could not be 
reserved
[    0.248247] system 00:0b: [mem 0xfee00000-0xfee0ffff] has been reserved
[    0.248324] system 00:0b: [mem 0xfed20000-0xfed8ffff] has been reserved
[    0.248403] system 00:0b: [mem 0xfeda0000-0xfeda3fff] has been reserved
[    0.248481] system 00:0b: [mem 0xfeda4000-0xfeda4fff] has been reserved
[    0.248560] system 00:0b: [mem 0xfeda5000-0xfeda5fff] has been reserved
[    0.248638] system 00:0b: [mem 0xfeda6000-0xfeda6fff] has been reserved
[    0.248716] system 00:0b: [mem 0xfed1c800-0xfed1cfff] has been reserved
[    0.248795] system 00:0b: [mem 0xfed18000-0xfed1bfff] has been reserved
[    0.248873] system 00:0b: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.248952] system 00:0b: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.249003] pnp: PnP ACPI: found 12 devices
[    0.249077] ACPI: ACPI bus type pnp unregistered
[    0.249152] PnPBIOS: Disabled by ACPI PNP
[    0.286129] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to 
[bus 0b-0b] add_size 1000
[    0.286133] pci 0000:00:1c.0: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 0b-0b] add_size 200000
[    0.286136] pci 0000:00:1c.0: bridge window [mem 
0x00100000-0x000fffff] to [bus 0b-0b] add_size 200000
[    0.286147] pci 0000:00:1c.1: bridge window [io  0x1000-0x0fff] to 
[bus 0c-0c] add_size 1000
[    0.286150] pci 0000:00:1c.1: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 0c-0c] add_size 200000
[    0.286170] pci 0000:00:1c.4: bridge window [io  0x1000-0x0fff] to 
[bus 0f-0f] add_size 1000
[    0.286173] pci 0000:00:1c.4: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 0f-0f] add_size 200000
[    0.286186] pci 0000:00:1c.5: bridge window [io  0x1000-0x0fff] to 
[bus 09-09] add_size 1000
[    0.286189] pci 0000:00:1c.5: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 09-09] add_size 200000
[    0.286206] pci 0000:00:1c.0: res[14]=[mem 0x00100000-0x000fffff] 
get_res_add_size add_size 200000
[    0.286208] pci 0000:00:1c.0: res[15]=[mem 0x00100000-0x000fffff 
64bit pref] get_res_add_size add_size 200000
[    0.286211] pci 0000:00:1c.1: res[15]=[mem 0x00100000-0x000fffff 
64bit pref] get_res_add_size add_size 200000
[    0.286213] pci 0000:00:1c.4: res[15]=[mem 0x00100000-0x000fffff 
64bit pref] get_res_add_size add_size 200000
[    0.286216] pci 0000:00:1c.5: res[15]=[mem 0x00100000-0x000fffff 
64bit pref] get_res_add_size add_size 200000
[    0.286218] pci 0000:00:1c.0: res[13]=[io  0x1000-0x0fff] 
get_res_add_size add_size 1000
[    0.286220] pci 0000:00:1c.1: res[13]=[io  0x1000-0x0fff] 
get_res_add_size add_size 1000
[    0.286223] pci 0000:00:1c.4: res[13]=[io  0x1000-0x0fff] 
get_res_add_size add_size 1000
[    0.286225] pci 0000:00:1c.5: res[13]=[io  0x1000-0x0fff] 
get_res_add_size add_size 1000
[    0.286230] pci 0000:00:1c.0: BAR 14: assigned [mem 
0xe0200000-0xe03fffff]
[    0.286309] pci 0000:00:1c.0: BAR 15: assigned [mem 
0xe0400000-0xe05fffff 64bit pref]
[    0.286404] pci 0000:00:1c.1: BAR 15: assigned [mem 
0xe0600000-0xe07fffff 64bit pref]
[    0.286497] pci 0000:00:1c.4: BAR 15: assigned [mem 
0xe0800000-0xe09fffff 64bit pref]
[    0.286591] pci 0000:00:1c.5: BAR 15: assigned [mem 
0xe0a00000-0xe0bfffff 64bit pref]
[    0.286685] pci 0000:00:1c.0: BAR 13: assigned [io 0x2000-0x2fff]
[    0.286763] pci 0000:00:1c.1: BAR 13: assigned [io 0x3000-0x3fff]
[    0.286841] pci 0000:00:1c.4: BAR 13: assigned [io 0x4000-0x4fff]
[    0.286920] pci 0000:00:1c.5: BAR 13: assigned [io 0x5000-0x5fff]
[    0.286998] pci 0000:02:00.0: PCI bridge to [bus 03-03]
[    0.287076] pci 0000:02:00.0:   bridge window [io  0xe000-0xefff]
[    0.287156] pci 0000:02:00.0:   bridge window [mem 0xf4000000-0xf7dfffff]
[    0.287236] pci 0000:02:00.0:   bridge window [mem 
0xc0000000-0xcfffffff 64bit pref]
[    0.287332] pci 0000:02:01.0: PCI bridge to [bus 04-04]
[    0.287408] pci 0000:02:01.0:   bridge window [io  0xd000-0xdfff]
[    0.287488] pci 0000:02:01.0:   bridge window [mem 0xf0f00000-0xf3ffffff]
[    0.287568] pci 0000:02:01.0:   bridge window [mem 
0xd0000000-0xdfffffff 64bit pref]
[    0.287664] pci 0000:01:00.0: PCI bridge to [bus 02-04]
[    0.287740] pci 0000:01:00.0:   bridge window [io  0xd000-0xefff]
[    0.287820] pci 0000:01:00.0:   bridge window [mem 0xf0f00000-0xf7dfffff]
[    0.287900] pci 0000:01:00.0:   bridge window [mem 
0xc0000000-0xdfffffff 64bit pref]
[    0.288010] pci 0000:00:01.0: PCI bridge to [bus 01-04]
[    0.290001] pci 0000:00:01.0:   bridge window [io  0xd000-0xefff]
[    0.290079] pci 0000:00:01.0:   bridge window [mem 0xf0f00000-0xf7efffff]
[    0.290159] pci 0000:00:01.0:   bridge window [mem 
0xc0000000-0xdfffffff 64bit pref]
[    0.290254] pci 0000:00:1c.0: PCI bridge to [bus 0b-0b]
[    0.290331] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.290412] pci 0000:00:1c.0:   bridge window [mem 0xe0200000-0xe03fffff]
[    0.290493] pci 0000:00:1c.0:   bridge window [mem 
0xe0400000-0xe05fffff 64bit pref]
[    0.290591] pci 0000:00:1c.1: PCI bridge to [bus 0c-0c]
[    0.290669] pci 0000:00:1c.1:   bridge window [io  0x3000-0x3fff]
[    0.290750] pci 0000:00:1c.1:   bridge window [mem 0xf0e00000-0xf0efffff]
[    0.290832] pci 0000:00:1c.1:   bridge window [mem 
0xe0600000-0xe07fffff 64bit pref]
[    0.290930] pci 0000:00:1c.3: PCI bridge to [bus 0d-0e]
[    0.291007] pci 0000:00:1c.3:   bridge window [io  0xc000-0xcfff]
[    0.291088] pci 0000:00:1c.3:   bridge window [mem 0xf0c00000-0xf0dfffff]
[    0.291169] pci 0000:00:1c.3:   bridge window [mem 
0xe0000000-0xe01fffff 64bit pref]
[    0.291267] pci 0000:00:1c.4: PCI bridge to [bus 0f-0f]
[    0.291345] pci 0000:00:1c.4:   bridge window [io  0x4000-0x4fff]
[    0.291426] pci 0000:00:1c.4:   bridge window [mem 0xef000000-0xf0bfffff]
[    0.291507] pci 0000:00:1c.4:   bridge window [mem 
0xe0800000-0xe09fffff 64bit pref]
[    0.291605] pci 0000:00:1c.5: PCI bridge to [bus 09-09]
[    0.291683] pci 0000:00:1c.5:   bridge window [io  0x5000-0x5fff]
[    0.291764] pci 0000:00:1c.5:   bridge window [mem 0xeef00000-0xeeffffff]
[    0.291845] pci 0000:00:1c.5:   bridge window [mem 
0xe0a00000-0xe0bfffff 64bit pref]
[    0.291944] pci 0000:00:1e.0: PCI bridge to [bus 05-05]
[    0.292038] pci 0000:00:1e.0:   bridge window [mem 0xeee00000-0xeeefffff]
[    0.292178] pci 0000:00:1e.0: setting latency timer to 64
[    0.292182] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    0.292184] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    0.292186] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.292188] pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff]
[    0.292190] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xf7ffffff]
[    0.292193] pci_bus 0000:00: resource 9 [mem 0xfc000000-0xfebfffff]
[    0.292195] pci_bus 0000:00: resource 10 [mem 0xfec10000-0xfecfffff]
[    0.292197] pci_bus 0000:00: resource 11 [mem 0xfed1c000-0xfed1ffff]
[    0.292199] pci_bus 0000:00: resource 12 [mem 0xfed90000-0xfed9ffff]
[    0.292201] pci_bus 0000:00: resource 13 [mem 0xfeda7000-0xfedfffff]
[    0.292203] pci_bus 0000:00: resource 14 [mem 0xfee10000-0xff9fffff]
[    0.292205] pci_bus 0000:00: resource 15 [mem 0xffc00000-0xffdfffff]
[    0.292207] pci_bus 0000:00: resource 16 [mem 0x140000000-0x337ffffff]
[    0.292209] pci_bus 0000:01: resource 0 [io  0xd000-0xefff]
[    0.292211] pci_bus 0000:01: resource 1 [mem 0xf0f00000-0xf7efffff]
[    0.292213] pci_bus 0000:01: resource 2 [mem 0xc0000000-0xdfffffff 
64bit pref]
[    0.292216] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    0.292218] pci_bus 0000:02: resource 1 [mem 0xf0f00000-0xf7dfffff]
[    0.292220] pci_bus 0000:02: resource 2 [mem 0xc0000000-0xdfffffff 
64bit pref]
[    0.292222] pci_bus 0000:03: resource 0 [io  0xe000-0xefff]
[    0.292224] pci_bus 0000:03: resource 1 [mem 0xf4000000-0xf7dfffff]
[    0.292226] pci_bus 0000:03: resource 2 [mem 0xc0000000-0xcfffffff 
64bit pref]
[    0.292228] pci_bus 0000:04: resource 0 [io  0xd000-0xdfff]
[    0.292230] pci_bus 0000:04: resource 1 [mem 0xf0f00000-0xf3ffffff]
[    0.292233] pci_bus 0000:04: resource 2 [mem 0xd0000000-0xdfffffff 
64bit pref]
[    0.292235] pci_bus 0000:0b: resource 0 [io  0x2000-0x2fff]
[    0.292237] pci_bus 0000:0b: resource 1 [mem 0xe0200000-0xe03fffff]
[    0.292239] pci_bus 0000:0b: resource 2 [mem 0xe0400000-0xe05fffff 
64bit pref]
[    0.292241] pci_bus 0000:0c: resource 0 [io  0x3000-0x3fff]
[    0.292243] pci_bus 0000:0c: resource 1 [mem 0xf0e00000-0xf0efffff]
[    0.292245] pci_bus 0000:0c: resource 2 [mem 0xe0600000-0xe07fffff 
64bit pref]
[    0.292247] pci_bus 0000:0d: resource 0 [io  0xc000-0xcfff]
[    0.292249] pci_bus 0000:0d: resource 1 [mem 0xf0c00000-0xf0dfffff]
[    0.292251] pci_bus 0000:0d: resource 2 [mem 0xe0000000-0xe01fffff 
64bit pref]
[    0.292253] pci_bus 0000:0f: resource 0 [io  0x4000-0x4fff]
[    0.292256] pci_bus 0000:0f: resource 1 [mem 0xef000000-0xf0bfffff]
[    0.292258] pci_bus 0000:0f: resource 2 [mem 0xe0800000-0xe09fffff 
64bit pref]
[    0.292260] pci_bus 0000:09: resource 0 [io  0x5000-0x5fff]
[    0.292262] pci_bus 0000:09: resource 1 [mem 0xeef00000-0xeeffffff]
[    0.292264] pci_bus 0000:09: resource 2 [mem 0xe0a00000-0xe0bfffff 
64bit pref]
[    0.292266] pci_bus 0000:05: resource 1 [mem 0xeee00000-0xeeefffff]
[    0.292268] pci_bus 0000:05: resource 4 [io  0x0000-0x0cf7]
[    0.292270] pci_bus 0000:05: resource 5 [io  0x0d00-0xffff]
[    0.292272] pci_bus 0000:05: resource 6 [mem 0x000a0000-0x000bffff]
[    0.292274] pci_bus 0000:05: resource 7 [mem 0x000d0000-0x000dffff]
[    0.292276] pci_bus 0000:05: resource 8 [mem 0xc0000000-0xf7ffffff]
[    0.292278] pci_bus 0000:05: resource 9 [mem 0xfc000000-0xfebfffff]
[    0.292280] pci_bus 0000:05: resource 10 [mem 0xfec10000-0xfecfffff]
[    0.292282] pci_bus 0000:05: resource 11 [mem 0xfed1c000-0xfed1ffff]
[    0.292284] pci_bus 0000:05: resource 12 [mem 0xfed90000-0xfed9ffff]
[    0.292287] pci_bus 0000:05: resource 13 [mem 0xfeda7000-0xfedfffff]
[    0.292289] pci_bus 0000:05: resource 14 [mem 0xfee10000-0xff9fffff]
[    0.292291] pci_bus 0000:05: resource 15 [mem 0xffc00000-0xffdfffff]
[    0.292293] pci_bus 0000:05: resource 16 [mem 0x140000000-0x337ffffff]
[    0.292325] NET: Registered protocol family 2
[    0.292438] IP route cache hash table entries: 32768 (order: 5, 
131072 bytes)
[    0.292623] TCP established hash table entries: 131072 (order: 8, 
1048576 bytes)
[    0.293038] TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
[    0.293282] TCP: Hash tables configured (established 131072 bind 65536)
[    0.293360] TCP: reno registered
[    0.293433] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.293517] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.293635] NET: Registered protocol family 1
[    0.293967] pci 0000:03:00.0: Boot video device
[    0.294061] PCI: CLS 64 bytes, default 64
[    0.294094] Trying to unpack rootfs image as initramfs...
[    0.446400] Freeing initrd memory: 8380k freed
[    0.450299] Simple Boot Flag at 0x79 set to 0x1
[    0.450798] audit: initializing netlink socket (disabled)
[    0.450887] type=2000 audit(1343758011.444:1): initialized
[    0.469878] highmem bounce pool size: 64 pages
[    0.469955] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.472118] VFS: Disk quotas dquot_6.5.2
[    0.472236] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.472798] fuse init (API version 7.19)
[    0.472963] msgmni has been set to 1661
[    0.473449] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 252)
[    0.473572] io scheduler noop registered
[    0.473647] io scheduler deadline registered
[    0.473725] io scheduler cfq registered (default)
[    0.473953] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
[    0.474051] pcieport 0000:00:1c.0: irq 41 for MSI/MSI-X
[    0.474177] pcieport 0000:00:1c.1: irq 42 for MSI/MSI-X
[    0.474304] pcieport 0000:00:1c.3: irq 43 for MSI/MSI-X
[    0.474430] pcieport 0000:00:1c.4: irq 44 for MSI/MSI-X
[    0.474555] pcieport 0000:00:1c.5: irq 45 for MSI/MSI-X
[    0.474731] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.474824] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.474928] intel_idle: does not run on family 6 model 23
[    0.475008] ACPI: Deprecated procfs I/F for AC is loaded, please 
retry with CONFIG_ACPI_PROCFS_POWER cleared
[    0.475144] ACPI: AC Adapter [AC] (on-line)
[    0.475278] input: Lid Switch as 
/devices/LNXSYSTM:00/device:00/PNP0C0D:00/input/input0
[    0.475782] ACPI: Lid Switch [LID]
[    0.475892] input: Power Button as 
/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input1
[    0.475987] ACPI: Power Button [PBTN]
[    0.476138] input: Sleep Button as 
/devices/LNXSYSTM:00/device:00/PNP0C0E:00/input/input2
[    0.476232] ACPI: Sleep Button [SBTN]
[    0.476367] ACPI: Requesting acpi_cpufreq
[    0.477662] Monitor-Mwait will be used to enter C-1 state
[    0.477694] Monitor-Mwait will be used to enter C-2 state
[    0.477722] Monitor-Mwait will be used to enter C-3 state
[    0.477729] Marking TSC unstable due to TSC halts in idle
[    0.477819] ACPI: acpi_idle registered with cpuidle
[    0.484716] thermal LNXTHERM:00: registered as thermal_zone0
[    0.484794] ACPI: Thermal Zone [THM] (49 C)
[    0.484895] GHES: HEST is not enabled!
[    0.484979] isapnp: Scanning for PnP cards...
[    0.504100] ACPI: Deprecated procfs I/F for battery is loaded, please 
retry with CONFIG_ACPI_PROCFS_POWER cleared
[    0.504200] ACPI: Battery Slot [BAT0] (battery present)
[    0.844455] isapnp: No Plug & Play device found
[    0.844600] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.846047] kgdb: Registered I/O driver kgdboc.
[    0.846288] Linux agpgart interface v0.103
[    0.848011] brd: module loaded
[    0.848827] loop: module loaded
[    0.849002] ahci 0000:00:1f.2: version 3.0
[    0.849053] ahci 0000:00:1f.2: irq 46 for MSI/MSI-X
[    0.849130] ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 3 ports 3 Gbps 
0x5 impl SATA mode
[    0.849223] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio 
slum part ccc ems
[    0.849319] ahci 0000:00:1f.2: setting latency timer to 64
[    0.856285] scsi0 : ahci
[    0.856437] scsi1 : ahci
[    0.856582] scsi2 : ahci
[    0.856779] ata1: SATA max UDMA/133 abar m2048@0xfed1c800 port 
0xfed1c900 irq 46
[    0.856871] ata2: DUMMY
[    0.856943] ata3: SATA max UDMA/133 abar m2048@0xfed1c800 port 
0xfed1ca00 irq 46
[    0.857091] ata_piix 0000:00:1f.1: version 2.13
[    0.857131] ata_piix 0000:00:1f.1: setting latency timer to 64
[    0.857418] scsi3 : ata_piix
[    0.857562] scsi4 : ata_piix
[    0.857910] ata4: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x6fa0 
irq 14
[    0.857989] ata5: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x6fa8 
irq 15
[    0.858133] ata5: port disabled--ignoring
[    0.858361] Fixed MDIO Bus: probed
[    0.858448] tun: Universal TUN/TAP device driver, 1.6
[    0.858523] tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
[    0.858760] PPP generic driver version 2.4.2
[    0.858925] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.859029] ehci_hcd 0000:00:1a.7: setting latency timer to 64
[    0.859033] ehci_hcd 0000:00:1a.7: EHCI Host Controller
[    0.859152] ehci_hcd 0000:00:1a.7: new USB bus registered, assigned 
bus number 1
[    0.859270] ehci_hcd 0000:00:1a.7: debug port 1
[    0.863225] ehci_hcd 0000:00:1a.7: cache line size of 64 is not supported
[    0.863240] ehci_hcd 0000:00:1a.7: irq 22, io mem 0xfed1c400
[    0.872020] ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    0.872235] hub 1-0:1.0: USB hub found
[    0.872312] hub 1-0:1.0: 4 ports detected
[    0.872468] ehci_hcd 0000:00:1d.7: setting latency timer to 64
[    0.872472] ehci_hcd 0000:00:1d.7: EHCI Host Controller
[    0.872591] ehci_hcd 0000:00:1d.7: new USB bus registered, assigned 
bus number 2
[    0.872709] ehci_hcd 0000:00:1d.7: debug port 1
[    0.876657] ehci_hcd 0000:00:1d.7: cache line size of 64 is not supported
[    0.876671] ehci_hcd 0000:00:1d.7: irq 20, io mem 0xfed1c000
[    0.888020] ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    0.888205] hub 2-0:1.0: USB hub found
[    0.888281] hub 2-0:1.0: 6 ports detected
[    0.888435] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.888529] uhci_hcd: USB Universal Host Controller Interface driver
[    0.888623] uhci_hcd 0000:00:1a.0: setting latency timer to 64
[    0.888626] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    0.888747] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned 
bus number 3
[    0.888865] uhci_hcd 0000:00:1a.0: irq 20, io base 0x00006f20
[    0.889074] hub 3-0:1.0: USB hub found
[    0.889149] hub 3-0:1.0: 2 ports detected
[    0.889297] uhci_hcd 0000:00:1a.1: setting latency timer to 64
[    0.889301] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    0.889415] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned 
bus number 4
[    0.889542] uhci_hcd 0000:00:1a.1: irq 21, io base 0x00006f00
[    0.889738] hub 4-0:1.0: USB hub found
[    0.889814] hub 4-0:1.0: 2 ports detected
[    0.889958] uhci_hcd 0000:00:1d.0: setting latency timer to 64
[    0.889962] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    0.890075] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned 
bus number 5
[    0.890191] uhci_hcd 0000:00:1d.0: irq 20, io base 0x00006f80
[    0.890392] hub 5-0:1.0: USB hub found
[    0.890468] hub 5-0:1.0: 2 ports detected
[    0.890613] uhci_hcd 0000:00:1d.1: setting latency timer to 64
[    0.890616] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    0.890729] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned 
bus number 6
[    0.890846] uhci_hcd 0000:00:1d.1: irq 21, io base 0x00006f60
[    0.891044] hub 6-0:1.0: USB hub found
[    0.891120] hub 6-0:1.0: 2 ports detected
[    0.891261] uhci_hcd 0000:00:1d.2: setting latency timer to 64
[    0.891265] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    0.891384] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned 
bus number 7
[    0.891501] uhci_hcd 0000:00:1d.2: irq 22, io base 0x00006f40
[    0.891701] hub 7-0:1.0: USB hub found
[    0.891777] hub 7-0:1.0: 2 ports detected
[    0.891962] usbcore: registered new interface driver libusual
[    0.892105] i8042: PNP: PS/2 Controller [PNP0303:KBC,PNP0f13:PS2M] at 
0x60,0x64 irq 1,12
[    0.895196] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.895273] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.895459] mousedev: PS/2 mouse device common for all mice
[    0.895683] rtc_cmos 00:03: RTC can wake from S4
[    0.895909] rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
[    0.896099] rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.896222] device-mapper: uevent: version 1.0.3
[    0.896362] device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) 
initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[    0.896483] EISA: Probing bus 0 at eisa.0
[    0.896558] EISA: Cannot allocate resource for mainboard
[    0.896633] Cannot allocate resource for EISA slot 1
[    0.896708] Cannot allocate resource for EISA slot 2
[    0.896783] Cannot allocate resource for EISA slot 3
[    0.896858] Cannot allocate resource for EISA slot 4
[    0.896933] Cannot allocate resource for EISA slot 5
[    0.897007] Cannot allocate resource for EISA slot 6
[    0.897082] Cannot allocate resource for EISA slot 7
[    0.897171] Cannot allocate resource for EISA slot 8
[    0.897246] EISA: Detected 0 cards.
[    0.897352] cpufreq-nforce2: No nForce2 chipset.
[    0.897467] cpuidle: using governor ladder
[    0.899523] cpuidle: using governor menu
[    0.899598] EFI Variables Facility v0.08 2004-May-17
[    0.899869] ashmem: initialized
[    0.900036] TCP: cubic registered
[    0.900200] NET: Registered protocol family 10
[    0.900390] input: AT Translated Set 2 keyboard as 
/devices/platform/i8042/serio0/input/input3
[    0.900448] NET: Registered protocol family 17
[    0.900455] Key type dns_resolver registered
[    0.900511] Using IPI No-Shortcut mode
[    0.900582] PM: Hibernation image not present or could not be loaded.
[    0.900592] registered taskstats version 1
[    0.902879] Key type trusted registered
[    0.905208] Key type encrypted registered
[    0.907751]   Magic number: 4:311:141
[    0.907834] block ram6: hash matches
[    0.907939] acpi device:12: hash matches
[    0.908086] rtc_cmos 00:03: setting system clock to 2012-07-31 
18:06:52 UTC (1343758012)
[    0.909056] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
[    0.909138] EDD information not available.
[    1.036498] ata4.00: ATAPI: TSSTcorp DVD+/-RW TS-L632H, D300, max UDMA/33
[    1.068365] ata4.00: configured for UDMA/33
[    1.176094] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.176216] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.177361] ata3.00: ATA-8: Hitachi HTS722016K9A300, DCDOCA1H, max 
UDMA/133
[    1.177446] ata3.00: 312581808 sectors, multi 8: LBA48 NCQ (depth 
31/32), AA
[    1.177547] ata1.00: ATA-8: Hitachi HTS722016K9A300, DCDOCA1H, max 
UDMA/133
[    1.177636] ata1.00: 312581808 sectors, multi 8: LBA48 NCQ (depth 
31/32), AA
[    1.178937] ata3.00: configured for UDMA/133
[    1.179118] ata1.00: configured for UDMA/133
[    1.179354] scsi 0:0:0:0: Direct-Access     ATA      Hitachi HTS72201 
DCDO PQ: 0 ANSI: 5
[    1.179584] sd 0:0:0:0: [sda] 312581808 512-byte logical blocks: (160 
GB/149 GiB)
[    1.179585] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.179918] sd 0:0:0:0: [sda] Write Protect is off
[    1.179995] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.180049] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    1.408056] usb 2-1: new high-speed USB device number 2 using ehci_hcd
[    1.520667]  sda: sda1
[    1.521134] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.521340] scsi 2:0:0:0: Direct-Access     ATA      Hitachi HTS72201 
DCDO PQ: 0 ANSI: 5
[    1.521540] sd 2:0:0:0: [sdb] 312581808 512-byte logical blocks: (160 
GB/149 GiB)
[    1.521544] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    1.521859] sd 2:0:0:0: [sdb] Write Protect is off
[    1.521941] sd 2:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    1.522003] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    1.544443] Initializing USB Mass Storage driver...
[    1.544625] scsi5 : usb-storage 2-1:1.0
[    1.544768] usbcore: registered new interface driver usb-storage
[    1.544854] USB Mass Storage support registered.
[    1.764063] usb 2-6: new high-speed USB device number 4 using ehci_hcd
[    1.883988]  sdb: sdb1 sdb2 < sdb5 >
[    1.884552] sd 2:0:0:0: [sdb] Attached SCSI disk
[    1.886843] scsi 3:0:0:0: CD-ROM            TSSTcorp DVD+-RW TS-L632H 
D300 PQ: 0 ANSI: 5
[    1.894134] sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
[    1.894219] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.894424] sr 3:0:0:0: Attached scsi CD-ROM sr0
[    1.894544] sr 3:0:0:0: Attached scsi generic sg2 type 5
[    1.894762] Freeing unused kernel memory: 720k freed
[    1.895174] Write protecting the kernel text: 5760k
[    1.895362] Write protecting the kernel read-only data: 2240k
[    1.895441] NX-protecting the kernel data: 4480k
[    1.911830] udevd[111]: starting version 175
[    1.972908] wmi: Mapper loaded
[    1.989569] tg3.c:v3.123 (March 21, 2012)
[    1.995042] acpi device:33: registered as cooling_device2
[    1.999911] usbcore: registered new interface driver usbhid
[    1.999990] usbhid: USB HID core driver
[    2.001008] ACPI: Video Device [VID] (multi-head: yes  rom: no post: no)
[    2.001133] input: Video Bus as 
/devices/LNXSYSTM:00/device:00/PNP0A03:00/device:2e/device:2f/device:30/LNXVIDEO:00/input/input4
[    2.005400] ACPI Warning: For \_SB_.PCI0.AGP_.SLI_.SLI1.VID1._DOD: 
Return Package has no elements (empty) (20120320/nspredef-463)
[    2.005619] ACPI: Video Device [VID1] (multi-head: yes  rom: no post: no)
[    2.005737] input: Video Bus as 
/devices/LNXSYSTM:00/device:00/PNP0A03:00/device:2e/device:2f/device:35/LNXVIDEO:01/input/input5
[    2.012677] tg3 0000:09:00.0: eth0: Tigon3 [partno(BCM95754m) rev 
b002] (PCI Express) MAC address 00:1d:09:51:15:b1
[    2.012779] tg3 0000:09:00.0: eth0: attached PHY is 5787 
(10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
[    2.012877] tg3 0000:09:00.0: eth0: RXcsums[1] LinkChgREG[0] MIirq[0] 
ASF[0] TSOcap[1]
[    2.012971] tg3 0000:09:00.0: eth0: dma_rwctrl[76180000] dma_mask[64-bit]
[    2.015268] sdhci: Secure Digital Host Controller Interface driver
[    2.015348] sdhci: Copyright(c) Pierre Ossman
[    2.076142] firewire_ohci 0000:05:01.0: added OHCI v1.10 device as 
card 0, 4 IR + 4 IT contexts, quirks 0x11
[    2.076374] sdhci-pci 0000:05:01.1: SDHCI controller found 
[1180:0822] (rev 22)
[    2.077524] mmc0: no vmmc regulator found
[    2.078618] Registered led device: mmc0::
[    2.108039] mmc0: SDHCI controller on PCI [0000:05:01.1] using DMA
[    2.140046] usb 3-2: new full-speed USB device number 2 using uhci_hcd
[    2.320084] hub 3-2:1.0: USB hub found
[    2.322017] hub 3-2:1.0: 3 ports detected
[    2.545004] scsi 5:0:0:0: Direct-Access     Ext Hard 
Disk                 PQ: 0 ANSI: 4
[    2.545996] sd 5:0:0:0: Attached scsi generic sg3 type 0
[    2.547332] sd 5:0:0:0: [sdc] 312581808 512-byte logical blocks: (160 
GB/149 GiB)
[    2.547834] sd 5:0:0:0: [sdc] Write Protect is off
[    2.547920] sd 5:0:0:0: [sdc] Mode Sense: 10 00 00 00
[    2.548350] sd 5:0:0:0: [sdc] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    2.550668]  sdc: sdc1
[    2.554283] sd 5:0:0:0: [sdc] Attached SCSI disk
[    2.564092] usb 4-1: new full-speed USB device number 2 using uhci_hcd
[    2.576216] firewire_core 0000:05:01.0: created device fw0: GUID 
474fc00014fb5470, S400
[    2.992056] usb 5-2: new full-speed USB device number 2 using uhci_hcd
[    3.420513] EXT4-fs (sdc1): INFO: recovery required on readonly 
filesystem
[    3.420532] EXT4-fs (sdc1): write access will be enabled during recovery
[    3.645998] usb 3-2.1: new full-speed USB device number 3 using uhci_hcd
[    3.850019] usb 3-2.2: new full-speed USB device number 4 using uhci_hcd
[    4.058018] usb 3-2.3: new full-speed USB device number 5 using uhci_hcd
[    4.141605] EXT4-fs (sdc1): recovery complete
[    4.144340] EXT4-fs (sdc1): mounted filesystem with ordered data 
mode. Opts: (null)
[    5.420295] init: ureadahead main process (331) terminated with status 5
[    8.280824] udevd[465]: starting version 175
[    8.504357] Adding 6384636k swap on /dev/sdb5.  Priority:-1 extents:1 
across:6384636k
[    9.347204] lp: driver loaded but no devices found
[    9.497642] EXT4-fs (sdc1): re-mounted. Opts: errors=remount-ro
[    9.771606] EXT4-fs (sdb1): mounted filesystem with ordered data 
mode. Opts: (null)
[    9.881700] dcdbas dcdbas: Dell Systems Management Base Driver 
(version 5.6.0-3.2)
[    9.903705] microcode: CPU0 sig=0x10676, pf=0x80, revision=0x60c
[    9.905086] input: Dell WMI hotkeys as /devices/virtual/input/input6
[    9.974134] Bluetooth: Core ver 2.16
[    9.974156] NET: Registered protocol family 31
[    9.974157] Bluetooth: HCI device and connection manager initialized
[    9.974159] Bluetooth: HCI socket layer initialized
[    9.974161] Bluetooth: L2CAP socket layer initialized
[    9.974165] Bluetooth: SCO socket layer initialized
[    9.977779] cfg80211: Calling CRDA to update world regulatory domain
[   10.010664] usbcore: registered new interface driver btusb
[   10.148268] r592: driver successfully loaded
[   11.381164] psmouse serio1: synaptics: Touchpad model: 1, fw: 6.3, 
id: 0x1a0b1, caps: 0xa04793/0x300000/0x0
[   11.381174] psmouse serio1: synaptics: serio: Synaptics pass-through 
port at isa0060/serio1/input0
[   11.418631] input: SynPS/2 Synaptics TouchPad as 
/devices/platform/i8042/serio1/input/input7
[   11.768117] microcode: CPU1 sig=0x10676, pf=0x80, revision=0x60c
[   11.769393] microcode: Microcode Update Driver: v2.00 
<tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
[   11.881752] iwl4965: Intel(R) Wireless WiFi 4965 driver for Linux, 
in-tree:
[   11.881754] iwl4965: Copyright(c) 2003-2011 Intel Corporation
[   11.881892] iwl4965 0000:0c:00.0: Detected Intel(R) Wireless WiFi 
Link 4965AGN, REV=0x4
[   11.924402] iwl4965 0000:0c:00.0: device EEPROM VER=0x36, CALIB=0x5
[   11.924415] iwl4965 0000:0c:00.0: Tunable channels: 13 802.11bg, 19 
802.11a channels
[   11.924534] iwl4965 0000:0c:00.0: irq 47 for MSI/MSI-X
[   11.926381] r852: driver loaded successfully
[   12.267795] input: Formac Elektronik GmbH Formac Disk Mini 2.5" USB 
as /devices/pci0000:00/0000:00:1d.7/usb2/2-1/2-1:1.1/input/input8
[   12.267930] hid-generic 0003:0928:0007.0001: input,hidraw0: USB HID 
v1.11 Device [Formac Elektronik GmbH Formac Disk Mini 2.5" USB] on 
usb-0000:00:1d.7-1/input1
[   12.270958] hid-generic 0003:046D:C251.0002: hiddev0,hidraw1: USB HID 
v1.11 Device [GamePanel LCD] on usb-0000:00:1a.1-1/input0
[   12.271505] input: Logitech G9 Laser Mouse as 
/devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.0/input/input9
[   12.271912] hid-generic 0003:046D:C048.0003: input,hidraw2: USB HID 
v1.11 Mouse [Logitech G9 Laser Mouse] on usb-0000:00:1d.0-2/input0
[   12.277476] input: Logitech G9 Laser Mouse as 
/devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.1/input/input10
[   12.277811] hid-generic 0003:046D:C048.0004: input,hiddev0,hidraw3: 
USB HID v1.11 Keyboard [Logitech G9 Laser Mouse] on 
usb-0000:00:1d.0-2/input1
[   12.278312] input: Broadcom Corp as 
/devices/pci0000:00/0000:00:1a.0/usb3/3-2/3-2.2/3-2.2:1.0/input/input11
[   12.278524] hid-generic 0003:0A5C:4502.0005: input,hidraw4: USB HID 
v1.11 Keyboard [Broadcom Corp] on usb-0000:00:1a.0-2.2/input0
[   12.279248] input: Broadcom Corp as 
/devices/pci0000:00/0000:00:1a.0/usb3/3-2/3-2.3/3-2.3:1.0/input/input12
[   12.280417] hid-generic 0003:0A5C:4503.0006: input,hidraw5: USB HID 
v1.11 Mouse [Broadcom Corp] on usb-0000:00:1a.0-2.3/input0
[   12.299039] Linux video capture interface: v2.00
[   12.345180] iwl4965 0000:0c:00.0: loaded firmware version 228.61.2.24
[   12.345359] Registered led device: phy0-led
[   12.345386] cfg80211: Ignoring regulatory request Set by core since 
the driver uses its own custom regulatory domain
[   12.662045] ieee80211 phy0: Selected rate control algorithm 'iwl-4965-rs'
[   13.051176] uvcvideo: Found UVC 1.00 device Laptop Integrated Webcam 
(05a9:2640)
[   13.051777] input: Laptop Integrated Webcam as 
/devices/pci0000:00/0000:00:1d.7/usb2/2-6/2-6:1.0/input/input13
[   13.051928] usbcore: registered new interface driver uvcvideo
[   13.051929] USB Video Class driver (1.1.1)
[   13.081398] snd_hda_intel 0000:00:1b.0: irq 48 for MSI/MSI-X
[   13.322018] cfg80211: Ignoring regulatory request Set by core since 
the driver uses its own custom regulatory domain
[   13.322022] cfg80211: World regulatory domain updated:
[   13.322023] cfg80211:   (start_freq - end_freq @ bandwidth), 
(max_antenna_gain, max_eirp)
[   13.322025] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 
mBi, 2000 mBm)
[   13.322027] cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz), (300 
mBi, 2000 mBm)
[   13.322028] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 
mBi, 2000 mBm)
[   13.322030] cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 
mBi, 2000 mBm)
[   13.322032] cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 
mBi, 2000 mBm)
[   13.680335] type=1400 audit(1343750825.268:2): apparmor="STATUS" 
operation="profile_load" name="/sbin/dhclient" pid=823 
comm="apparmor_parser"
[   13.680345] type=1400 audit(1343750825.268:3): apparmor="STATUS" 
operation="profile_replace" name="/sbin/dhclient" pid=712 
comm="apparmor_parser"
[   13.680719] type=1400 audit(1343750825.268:4): apparmor="STATUS" 
operation="profile_load" 
name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=823 
comm="apparmor_parser"
[   13.680728] type=1400 audit(1343750825.268:5): apparmor="STATUS" 
operation="profile_replace" 
name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=712 
comm="apparmor_parser"
[   13.680935] type=1400 audit(1343750825.268:6): apparmor="STATUS" 
operation="profile_load" name="/usr/lib/connman/scripts/dhclient-script" 
pid=823 comm="apparmor_parser"
[   13.680948] type=1400 audit(1343750825.268:7): apparmor="STATUS" 
operation="profile_replace" 
name="/usr/lib/connman/scripts/dhclient-script" pid=712 
comm="apparmor_parser"
[   15.552786] init: failsafe main process (849) killed by TERM signal
[   17.511925] ppdev: user-space parallel port driver
[   18.035729] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   18.035733] Bluetooth: BNEP filters: protocol multicast
[   18.073873] type=1400 audit(1343750829.660:8): apparmor="STATUS" 
operation="profile_load" name="/usr/lib/cups/backend/cups-pdf" pid=1000 
comm="apparmor_parser"
[   18.074323] type=1400 audit(1343750829.660:9): apparmor="STATUS" 
operation="profile_load" name="/usr/sbin/cupsd" pid=1000 
comm="apparmor_parser"
[   18.110166] Bluetooth: RFCOMM TTY layer initialized
[   18.110171] Bluetooth: RFCOMM socket layer initialized
[   18.110172] Bluetooth: RFCOMM ver 1.11
[   18.658029] init: udev-fallback-graphics main process (1038) 
terminated with status 1
[   18.758053] type=1400 audit(1343750830.344:10): apparmor="STATUS" 
operation="profile_replace" name="/sbin/dhclient" pid=1050 
comm="apparmor_parser"
[   18.758453] type=1400 audit(1343750830.344:11): apparmor="STATUS" 
operation="profile_replace" 
name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1050 
comm="apparmor_parser"
[   18.758675] type=1400 audit(1343750830.344:12): apparmor="STATUS" 
operation="profile_replace" 
name="/usr/lib/connman/scripts/dhclient-script" pid=1050 
comm="apparmor_parser"
[   18.960544] type=1400 audit(1343750830.548:13): apparmor="STATUS" 
operation="profile_load" 
name="/usr/lib/lightdm/lightdm/lightdm-guest-session-wrapper" pid=1049 
comm="apparmor_parser"
[   19.117138] type=1400 audit(1343750830.708:14): apparmor="STATUS" 
operation="profile_load" name="/usr/lib/telepathy/mission-control-5" 
pid=1054 comm="apparmor_parser"
[   19.117563] type=1400 audit(1343750830.708:15): apparmor="STATUS" 
operation="profile_load" name="/usr/lib/telepathy/telepathy-*" pid=1054 
comm="apparmor_parser"
[   19.120810] type=1400 audit(1343750830.708:16): apparmor="STATUS" 
operation="profile_replace" name="/usr/lib/cups/backend/cups-pdf" 
pid=1055 comm="apparmor_parser"
[   19.121270] type=1400 audit(1343750830.708:17): apparmor="STATUS" 
operation="profile_replace" name="/usr/sbin/cupsd" pid=1055 
comm="apparmor_parser"
[   19.146539] type=1400 audit(1343750830.732:18): apparmor="STATUS" 
operation="profile_load" name="/usr/bin/evince" pid=1051 
comm="apparmor_parser"
[   19.151355] type=1400 audit(1343750830.736:19): apparmor="STATUS" 
operation="profile_load" name="/usr/bin/evince//launchpad_integration" 
pid=1051 comm="apparmor_parser"
[   19.189693] input: G15 Extra Keys as /devices/virtual/input/input14
[   21.533034] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[   21.563943] tg3 0000:09:00.0: irq 49 for MSI/MSI-X
[   21.597806] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   23.181880] tg3 0000:09:00.0: eth0: Link is up at 100 Mbps, full duplex
[   23.181884] tg3 0000:09:00.0: eth0: Flow control is on for TX and on 
for RX
[   23.182029] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   24.193190] mtrr: base(0xf5000000) is not aligned on a size(0xe00000) 
boundary
[   27.927705] init: plymouth-stop pre-start process (1490) terminated 
with status 1
[   28.577117] wlan0: authenticate with 5c:d9:98:e9:37:74
[   28.586139] wlan0: send auth to 5c:d9:98:e9:37:74 (try 1/3)
[   28.587811] wlan0: authenticated
[   28.600041] wlan0: associate with 5c:d9:98:e9:37:74 (try 1/3)
[   28.603110] wlan0: RX AssocResp from 5c:d9:98:e9:37:74 (capab=0x471 
status=0 aid=3)
[   28.630753] wlan0: associated
[   28.630946] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   47.503641] audit_printk_skb: 21 callbacks suppressed
[   47.503645] type=1400 audit(1343750859.088:27): apparmor="DENIED" 
operation="capable" parent=1 profile="/usr/sbin/cupsd" pid=1021 
comm="cupsd" pid=1021 comm="cupsd" capability=36 capname="block_suspend"
[   74.592778] netpoll: netconsole: local port 6665
[   74.592784] netpoll: netconsole: local IP 0.0.0.0
[   74.592785] netpoll: netconsole: interface 'eth0'
[   74.592786] netpoll: netconsole: remote port 6666
[   74.592788] netpoll: netconsole: remote IP 10.0.0.2
[   74.592790] netpoll: netconsole: remote ethernet address 
00:22:15:65:26:5d
[   74.592792] netpoll: netconsole: local IP 10.0.0.1
[   74.592819] console [netcon0] enabled
[   74.592821] netconsole: network logging started
[  108.338397] [drm] Initialized drm 1.1.0 20060810
[  108.458431] [drm] nouveau 0000:03:00.0: Detected an NV50 generation 
card (0x092580a2)
[  108.465124] [drm] nouveau 0000:03:00.0: Checking PRAMIN for VBIOS
[  108.563551] [drm] nouveau 0000:03:00.0: ... appears to be valid
[  108.563554] [drm] nouveau 0000:03:00.0: Using VBIOS from PRAMIN
[  108.563557] [drm] nouveau 0000:03:00.0: BIT BIOS found
[  108.563560] [drm] nouveau 0000:03:00.0: Bios version 62.92.2c.02
[  108.563563] [drm] nouveau 0000:03:00.0: TMDS table version 2.0
[  108.563693] [drm] nouveau 0000:03:00.0: MXM: no VBIOS data, nothing to do
[  108.563697] [drm] nouveau 0000:03:00.0: DCB version 4.0
[  108.563700] [drm] nouveau 0000:03:00.0: DCB outp 00: 01000323 00010034
[  108.563703] [drm] nouveau 0000:03:00.0: DCB outp 01: 04011310 00000028
[  108.563706] [drm] nouveau 0000:03:00.0: DCB outp 02: 02021312 00000030
[  108.563709] [drm] nouveau 0000:03:00.0: DCB outp 03: 010323f1 00c0c080
[  108.563712] [drm] nouveau 0000:03:00.0: DCB conn 00: 00000041
[  108.563716] [drm] nouveau 0000:03:00.0: DCB conn 01: 00001130
[  108.563721] [drm] nouveau 0000:03:00.0: DCB conn 02: 00000210
[  108.563795] [drm] nouveau 0000:03:00.0: DCB conn 03: 00000211
[  108.563799] [drm] nouveau 0000:03:00.0: DCB conn 04: 00000213
[  108.563805] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 0 at 
offset 0xC582
[  108.587430] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 1 at 
offset 0xC933
[  108.590300] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 2 at 
offset 0xD6AE
[  108.590319] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 3 at 
offset 0xD7D0
[  108.591422] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 4 at 
offset 0xDA00
[  108.591429] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table at 
offset 0xDA65
[  108.611293] [drm] nouveau 0000:03:00.0: 0xDA65: Condition still not 
met after 20ms, skipping following opcodes
[  108.616075] [TTM] Zone  kernel: Available graphics memory: 425654 kiB
[  108.616079] [TTM] Zone highmem: Available graphics memory: 2065310 kiB
[  108.616082] [TTM] Initializing pool allocator
[  108.616087] [TTM] Initializing DMA pool allocator
[  108.616098] [drm] nouveau 0000:03:00.0: Detected 512MiB VRAM (GDDR3)
[  108.618933] [drm] nouveau 0000:03:00.0: 512 MiB GART (aperture)
[  108.639308] [drm] nouveau 0000:03:00.0: DCB encoder 1 unknown
[  108.639313] [drm] nouveau 0000:03:00.0: TV-1 has no encoders, removing
[  108.647496] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[  108.647502] [drm] No driver support for vblank timestamp query.
[  108.647505] [drm] nouveau 0000:03:00.0: ACPI backlight interface 
available, not registering our own
[  108.653106] [drm] nouveau 0000:03:00.0: 4 available performance level(s)
[  108.653112] [drm] nouveau 0000:03:00.0: 0: core 200MHz shader 400MHz 
memory 100MHz voltage 850mV fanspeed 100%
[  108.653116] [drm] nouveau 0000:03:00.0: 1: core 275MHz shader 550MHz 
memory 301MHz voltage 850mV fanspeed 100%
[  108.653120] [drm] nouveau 0000:03:00.0: 2: core 383MHz shader 767MHz 
memory 301MHz voltage 850mV fanspeed 100%
[  108.653123] [drm] nouveau 0000:03:00.0: 3: core 500MHz shader 1250MHz 
memory 799MHz voltage 1000mV fanspeed 100%
[  108.653127] [drm] nouveau 0000:03:00.0: c: core 275MHz shader 550MHz 
memory 300MHz voltage 850mV
[  108.674137] [drm] nouveau 0000:03:00.0: MM: using CRYPT for buffer copies
[  110.086832] [drm] nouveau 0000:03:00.0: allocated 1920x1200 fb: 
0x2c0000, bo f1a07600
[  110.086952] fbcon: nouveaufb (fb0) is primary device
[  110.087145] Console: switching to colour frame buffer device 240x75
[  110.087152] fb0: nouveaufb frame buffer device
[  110.087154] drm: registered panic notifier
[  110.087159] [drm] Initialized nouveau 1.0.0 20120316 for 0000:03:00.0 
on minor 0
[  110.092124] [drm] nouveau 0000:04:00.0: Detected an NV50 generation 
card (0x092580a2)
[  110.100889] [drm] nouveau 0000:04:00.0: Checking PRAMIN for VBIOS
[  110.100898] [drm] nouveau 0000:04:00.0: ... BIOS signature not found
[  110.100901] [drm] nouveau 0000:04:00.0: Checking PROM for VBIOS
[  110.278812] [drm] nouveau 0000:04:00.0: ... appears to be valid
[  110.278815] [drm] nouveau 0000:04:00.0: Using VBIOS from PROM
[  110.278818] [drm] nouveau 0000:04:00.0: BIT BIOS found
[  110.278821] [drm] nouveau 0000:04:00.0: Bios version 62.92.2c.02
[  110.278825] [drm] nouveau 0000:04:00.0: TMDS table version 2.0
[  110.278948] [drm] nouveau 0000:04:00.0: MXM: no VBIOS data, nothing to do
[  110.278952] [drm] nouveau 0000:04:00.0: DCB version 4.0
[  110.278956] [drm] nouveau 0000:04:00.0: DCB outp 00: 01000323 00010034
[  110.278958] [drm] nouveau 0000:04:00.0: DCB conn 00: 00000041
[  110.278968] [drm] nouveau 0000:04:00.0: Adaptor not initialised, 
running VBIOS init tables.
[  110.278971] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at 
offset 0xC582
[  110.302940] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at 
offset 0xC933
[  110.305824] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at 
offset 0xD6AE
[  110.305879] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at 
offset 0xD7D0
[  110.307002] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at 
offset 0xDA00
[  110.308577] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table at 
offset 0xDA65
[  110.333067] [drm] nouveau 0000:04:00.0: Detected 512MiB VRAM (GDDR3)
[  110.335870] [drm] nouveau 0000:04:00.0: 512 MiB GART (aperture)
[  110.357814] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[  110.357818] [drm] No driver support for vblank timestamp query.
[  110.357822] [drm] nouveau 0000:04:00.0: ACPI backlight interface 
available, not registering our own
[  110.363297] [drm] nouveau 0000:04:00.0: 4 available performance level(s)
[  110.363303] [drm] nouveau 0000:04:00.0: 0: core 200MHz shader 400MHz 
memory 100MHz voltage 850mV fanspeed 100%
[  110.363307] [drm] nouveau 0000:04:00.0: 1: core 275MHz shader 550MHz 
memory 301MHz voltage 850mV fanspeed 100%
[  110.363310] [drm] nouveau 0000:04:00.0: 2: core 383MHz shader 767MHz 
memory 301MHz voltage 850mV fanspeed 100%
[  110.363315] [drm] nouveau 0000:04:00.0: 3: core 500MHz shader 1250MHz 
memory 799MHz voltage 1000mV fanspeed 100%
[  110.363319] [drm] nouveau 0000:04:00.0: c: core 275MHz shader 550MHz 
memory 300MHz voltage 850mV
[  110.383789] [drm] nouveau 0000:04:00.0: MM: using CRYPT for buffer copies
[  110.690018] No connectors reported connected with modes
[  110.690041] [drm] Cannot find any crtc or sizes - going 1024x768
[  110.707491] [drm] nouveau 0000:04:00.0: allocated 1024x768 fb: 
0x2c0000, bo f1e02e00
[  110.707718] fb1: nouveaufb frame buffer device
[  110.707724] [drm] Initialized nouveau 1.0.0 20120316 for 0000:04:00.0 
on minor 1
[  129.628491] [drm] nouveau 0000:03:00.0: VM: trapped write at 
0x0001003930 on ch 0 [0x00000070] BAR/PFIFO_WRITE/IN reason: 
PAGE_NOT_PRESENT
