From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Fwd: Problem with GT218 (GeForce GT210)
Date: Fri, 12 Jun 2015 03:47:44 -0400
Message-ID: <CAKb7UvhhsC4ShMP4rhzz3_Kt1ZDGSH3SVz=AZTsAWoqwZsvRiA@mail.gmail.com>
References: <CABLbVHNMTS9SzT_Qgn+N0L4p+fFOTHA=C2-FmUaYu0f-xA6zZg@mail.gmail.com>
 <CABLbVHP9Qgzh1RB3ZGeXJWqOpGhAbV3hF3DdS58bB2dxkdAHjg@mail.gmail.com>
 <CAKb7UvjD464REqBi=vz7qS-KLeYb+TEqbB8hsb+2L1qvP5aZSQ@mail.gmail.com>
 <CABLbVHO-Cw99WeW7mchDKfV2gNEvD=LC_gSFunO1YYv_tSXdMQ@mail.gmail.com>
 <CABLbVHPevEt7SBa8UqMzNDc-A5fC69hywzuZ-_rfAx=i7ti+_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0444492031=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CABLbVHPevEt7SBa8UqMzNDc-A5fC69hywzuZ-_rfAx=i7ti+_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andre Campos Rodovalho <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0444492031==
Content-Type: multipart/alternative; boundary=001a1141b5fedae57805184d52a1

--001a1141b5fedae57805184d52a1
Content-Type: text/plain; charset=UTF-8

Hm, well you can see the messages about failure to set plls, which is why
you don't see anything. The only odd thing I see is that you're using vesa,
which can definitely mess things up. Try not using that. Also try booting
with nouveau.debug=debug drm.debug=0xe which might provide more relevant
info.
On Jun 12, 2015 8:34 AM, "Andre Campos Rodovalho" <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> dmesg output:
>
>
> ---------------------------------------------------------------------------------------------------------
>
>
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 3.16.0-38-generic (buildd@allspice) (gcc
> version 4.8.2 (Ubuntu 4.8.2-19ubuntu1) ) #52~14.04.1-Ubuntu SMP Fri May 8
> 09:43:57 UTC 2015 (Ubuntu 3.16.0-38.52~14.04.1-generic 3.16.7-ckt10)
> [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-3.16.0-38-generic
> root=/dev/sda2 ro
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   Centaur CentaurHauls
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dbff]
> usable
> [    0.000000] BIOS-e820: [mem 0x000000000009dc00-0x000000000009ffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x00000000000e6000-0x00000000000fffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cff9ffff]
> usable
> [    0.000000] BIOS-e820: [mem 0x00000000cffa0000-0x00000000cffaffff] ACPI
> data
> [    0.000000] BIOS-e820: [mem 0x00000000cffb0000-0x00000000cffdffff] ACPI
> NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cffe0000-0x00000000cfffffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x00000000ffe00000-0x00000000ffffffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000022effffff]
> usable
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.6 present.
> [    0.000000] DMI: To Be Filled By O.E.M. To Be Filled By
> O.E.M./980DE3/U3S3, BIOS P1.60 05/06/2014
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] e820: last_pfn = 0x22f000 max_arch_pfn = 0x400000000
> [    0.000000] MTRR default type: uncachable
> [    0.000000] MTRR fixed ranges enabled:
> [    0.000000]   00000-9FFFF write-back
> [    0.000000]   A0000-EFFFF uncachable
> [    0.000000]   F0000-FFFFF write-protect
> [    0.000000] MTRR variable ranges enabled:
> [    0.000000]   0 base 000000000000 mask FFFF80000000 write-back
> [    0.000000]   1 base 000080000000 mask FFFFC0000000 write-back
> [    0.000000]   2 base 0000C0000000 mask FFFFF0000000 write-back
> [    0.000000]   3 disabled
> [    0.000000]   4 disabled
> [    0.000000]   5 disabled
> [    0.000000]   6 disabled
> [    0.000000]   7 disabled
> [    0.000000] TOM2: 000000022f000000 aka 8944M
> [    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new
> 0x7010600070106
> [    0.000000] e820: update [mem 0xd0000000-0xffffffff] usable ==> reserved
> [    0.000000] e820: last_pfn = 0xcffa0 max_arch_pfn = 0x400000000
> [    0.000000] found SMP MP-table at [mem 0x000ff780-0x000ff78f] mapped at
> [ffff8800000ff780]
> [    0.000000] Scanning 1 areas for low memory corruption
> [    0.000000] Base memory trampoline at [ffff880000097000] 97000 size
> 24576
> [    0.000000] Using GB pages for direct mapping
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x01fbd000, 0x01fbdfff] PGTABLE
> [    0.000000] BRK [0x01fbe000, 0x01fbefff] PGTABLE
> [    0.000000] BRK [0x01fbf000, 0x01fbffff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x22ee00000-0x22effffff]
> [    0.000000]  [mem 0x22ee00000-0x22effffff] page 2M
> [    0.000000] BRK [0x01fc0000, 0x01fc0fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x22c000000-0x22edfffff]
> [    0.000000]  [mem 0x22c000000-0x22edfffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x200000000-0x22bffffff]
> [    0.000000]  [mem 0x200000000-0x22bffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0xcff9ffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x3fffffff] page 2M
> [    0.000000]  [mem 0x40000000-0xbfffffff] page 1G
> [    0.000000]  [mem 0xc0000000-0xcfdfffff] page 2M
> [    0.000000]  [mem 0xcfe00000-0xcff9ffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x100000000-0x1ffffffff]
> [    0.000000]  [mem 0x100000000-0x1ffffffff] page 1G
> [    0.000000] RAMDISK: [mem 0x35a96000-0x36d42fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000FB6C0 000014 (v00 ACPIAM)
> [    0.000000] ACPI: RSDT 0x00000000CFFA0000 000040 (v01 050614 RSDT1213
> 20140506 MSFT 00000097)
> [    0.000000] ACPI: FACP 0x00000000CFFA0200 000084 (v01 A_M_I  OEMFACP
>  12000601 MSFT 00000097)
> [    0.000000] ACPI BIOS Warning (bug): Optional FADT field
> Pm2ControlBlock has zero address or length: 0x0000000000000000/0x1
> (20140424/tbfadt-649)
> [    0.000000] ACPI: DSDT 0x00000000CFFA0460 0088B0 (v01 AS636  AS636152
> 00000152 INTL 20051117)
> [    0.000000] ACPI: FACS 0x00000000CFFB0000 000040
> [    0.000000] ACPI: APIC 0x00000000CFFA0390 00008C (v01 050614 APIC1213
> 20140506 MSFT 00000097)
> [    0.000000] ACPI: MCFG 0x00000000CFFA0420 00003C (v01 050614 OEMMCFG
>  20140506 MSFT 00000097)
> [    0.000000] ACPI: OEMB 0x00000000CFFB0040 000072 (v01 050614 OEMB1213
> 20140506 MSFT 00000097)
> [    0.000000] ACPI: AAFT 0x00000000CFFAA460 000027 (v01 050614 OEMAAFT
>  20140506 MSFT 00000097)
> [    0.000000] ACPI: HPET 0x00000000CFFAA490 000038 (v01 050614 OEMHPET
>  20140506 MSFT 00000097)
> [    0.000000] ACPI: SSDT 0x00000000CFFAA4D0 001714 (v01 A M I  POWERNOW
> 00000001 AMD  00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x000000022effffff]
> [    0.000000] Initmem setup node 0 [mem 0x00000000-0x22effffff]
> [    0.000000]   NODE_DATA [mem 0x22eff9000-0x22effdfff]
> [    0.000000]  [ffffea0000000000-ffffea0008bfffff] PMD ->
> [ffff880226600000-ffff88022e5fffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
> [    0.000000]   Normal   [mem 0x100000000-0x22effffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
> [    0.000000]   node   0: [mem 0x00100000-0xcff9ffff]
> [    0.000000]   node   0: [mem 0x100000000-0x22effffff]
> [    0.000000] On node 0 totalpages: 2092860
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3996 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 13247 pages used for memmap
> [    0.000000]   DMA32 zone: 847776 pages, LIFO batch:31
> [    0.000000]   Normal zone: 19392 pages used for memmap
> [    0.000000]   Normal zone: 1241088 pages, LIFO batch:31
> [    0.000000] ACPI: PM-Timer IO Port: 0x808
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x10] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x11] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x12] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x13] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x14] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x15] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x07] lapic_id[0x16] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x17] enabled)
> [    0.000000] ACPI: IOAPIC (id[0x18] address[0xfec00000] gsi_base[0])
> [    0.000000] IOAPIC[0]: apic_id 24, version 33, address 0xfec00000, GSI
> 0-23
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> [    0.000000] ACPI: IRQ0 used by override.
> [    0.000000] ACPI: IRQ2 used by override.
> [    0.000000] ACPI: IRQ9 used by override.
> [    0.000000] Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x8300 base: 0xfed00000
> [    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
> [    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
> [    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000e5fff]
> [    0.000000] PM: Registered nosave memory: [mem 0x000e6000-0x000fffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xcffa0000-0xcffaffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xcffb0000-0xcffdffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xcffe0000-0xcfffffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xd0000000-0xffdfffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xffe00000-0xffffffff]
> [    0.000000] e820: [mem 0xd0000000-0xffdfffff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on bare hardware
> [    0.000000] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8
> nr_node_ids:1
> [    0.000000] PERCPU: Embedded 27 pages/cpu @ffff88022ec00000 s81408
> r8192 d20992 u262144
> [    0.000000] pcpu-alloc: s81408 r8192 d20992 u262144 alloc=1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
> Total pages: 2060136
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line:
> BOOT_IMAGE=/boot/vmlinuz-3.16.0-38-generic root=/dev/sda2 ro
> [    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
> [    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
> [    0.000000] AGP: Checking aperture...
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] AGP: Node 0: aperture [bus addr 0x00000000-0x01ffffff]
> (32MB)
> [    0.000000] AGP: Your BIOS doesn't leave a aperture memory hole
> [    0.000000] AGP: Please enable the IOMMU option in the BIOS setup
> [    0.000000] AGP: This costs you 64MB of RAM
> [    0.000000] AGP: Mapping aperture over RAM [mem 0xc4000000-0xc7ffffff]
> (65536KB)
> [    0.000000] PM: Registered nosave memory: [mem 0xc4000000-0xc7ffffff]
> [    0.000000] Memory: 8072292K/8371440K available (7626K kernel code,
> 1131K rwdata, 3596K rodata, 1352K init, 1300K bss, 299148K reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU dyntick-idle grace-period acceleration is enabled.
> [    0.000000] RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=8.
> [    0.000000] Offload RCU callbacks from all CPUs
> [    0.000000] Offload RCU callbacks from CPUs: 0-7.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
> [    0.000000] NR_IRQS:16640 nr_irqs:744 16
> [    0.000000] spurious 8259A interrupt: IRQ7.
> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] allocated 33554432 bytes of page_cgroup
> [    0.000000] please try 'cgroup_disable=memory' option if you don't want
> memory cgroups
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 4680.606 MHz processor
> [    0.000020] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 9361.21 BogoMIPS (lpj=18722424)
> [    0.000024] pid_max: default: 32768 minimum: 301
> [    0.000031] ACPI: Core revision 20140424
> [    0.002757] ACPI: All ACPI Tables successfully acquired
> [    0.011663] Security Framework initialized
> [    0.011684] AppArmor: AppArmor initialized
> [    0.011686] Yama: becoming mindful.
> [    0.012143] Dentry cache hash table entries: 1048576 (order: 11,
> 8388608 bytes)
> [    0.014204] Inode-cache hash table entries: 524288 (order: 10, 4194304
> bytes)
> [    0.015161] Mount-cache hash table entries: 16384 (order: 5, 131072
> bytes)
> [    0.015170] Mountpoint-cache hash table entries: 16384 (order: 5,
> 131072 bytes)
> [    0.015394] Initializing cgroup subsys memory
> [    0.015413] Initializing cgroup subsys devices
> [    0.015419] Initializing cgroup subsys freezer
> [    0.015422] Initializing cgroup subsys net_cls
> [    0.015426] Initializing cgroup subsys blkio
> [    0.015430] Initializing cgroup subsys perf_event
> [    0.015432] Initializing cgroup subsys net_prio
> [    0.015439] Initializing cgroup subsys hugetlb
> [    0.015456] tseg: 0000000000
> [    0.015460] CPU: Physical Processor ID: 0
> [    0.015462] CPU: Processor Core ID: 0
> [    0.015464] mce: CPU supports 7 MCE banks
> [    0.015470] LVT offset 1 assigned for vector 0xf9
> [    0.015475] Last level iTLB entries: 4KB 512, 2MB 1024, 4MB 512
> [    0.015475] Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 512, 1GB 0
> [    0.015475] tlb_flushall_shift: 6
> [    0.015553] Freeing SMP alternatives memory: 32K (ffffffff81e6e000 -
> ffffffff81e76000)
> [    0.016170] ftrace: allocating 29244 entries in 115 pages
> [    0.023710] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.063438] smpboot: CPU0: AMD FX(tm)-8350 Eight-Core Processor (fam:
> 15, model: 02, stepping: 00)
> [    0.167980] Performance Events: Fam15h core perfctr, AMD PMU driver.
> [    0.167985] ... version:                0
> [    0.167987] ... bit width:              48
> [    0.167988] ... generic registers:      6
> [    0.167990] ... value mask:             0000ffffffffffff
> [    0.167992] ... max period:             00007fffffffffff
> [    0.167993] ... fixed-purpose events:   0
> [    0.167995] ... event mask:             000000000000003f
> [    0.169378] NMI watchdog: enabled on all CPUs, permanently consumes one
> hw-PMU counter.
> [    0.169445] x86: Booting SMP configuration:
> [    0.169447] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
> [    0.261441] x86: Booted up 1 node, 8 CPUs
> [    0.261446] smpboot: Total of 8 processors activated (74889.69 BogoMIPS)
> [    0.269594] devtmpfs: initialized
> [    0.272590] evm: security.selinux
> [    0.272592] evm: security.SMACK64
> [    0.272594] evm: security.SMACK64EXEC
> [    0.272596] evm: security.SMACK64TRANSMUTE
> [    0.272597] evm: security.SMACK64MMAP
> [    0.272599] evm: security.ima
> [    0.272600] evm: security.capability
> [    0.272651] PM: Registering ACPI NVS region [mem 0xcffb0000-0xcffdffff]
> (196608 bytes)
> [    0.273377] pinctrl core: initialized pinctrl subsystem
> [    0.273439] regulator-dummy: no parameters
> [    0.273472] RTC time: 23:16:50, date: 06/11/15
> [    0.273514] NET: Registered protocol family 16
> [    0.273639] cpuidle: using governor ladder
> [    0.273642] cpuidle: using governor menu
> [    0.273705] ACPI: bus type PCI registered
> [    0.273708] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.273767] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
> 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.273771] PCI: not using MMCONFIG
> [    0.273773] PCI: Using configuration type 1 for base access
> [    0.273775] PCI: Using configuration type 1 for extended access
> [    0.274069] mtrr: your CPUs had inconsistent variable MTRR settings
> [    0.274071] mtrr: probably your BIOS does not setup all CPUs.
> [    0.274073] mtrr: corrected configuration.
> [    0.276493] ACPI: Added _OSI(Module Device)
> [    0.276496] ACPI: Added _OSI(Processor Device)
> [    0.276498] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.276500] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.278445] ACPI: Executed 3 blocks of module-level executable AML code
> [    0.281893] ACPI: Interpreter enabled
> [    0.281902] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
> [\_S2_] (20140424/hwxface-580)
> [    0.281918] ACPI: (supports S0 S1 S3 S4 S5)
> [    0.281920] ACPI: Using IOAPIC for interrupt routing
> [    0.281975] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
> 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.282810] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in
> ACPI motherboard resources
> [    0.283069] PCI: Using host bridge windows from ACPI; if necessary, use
> "pci=nocrs" and report a bug
> [    0.288165] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.288171] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI]
> [    0.288365] acpi PNP0A03:00: _OSC: platform does not support
> [PCIeHotplug PME]
> [    0.288550] acpi PNP0A03:00: _OSC: OS now controls [AER PCIeCapability]
> [    0.288835] PCI host bridge to bus 0000:00
> [    0.288838] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.288840] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.288843] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
> [    0.288846] pci_bus 0000:00: root bus resource [mem
> 0x000a0000-0x000bffff]
> [    0.288848] pci_bus 0000:00: root bus resource [mem
> 0x000d0000-0x000dffff]
> [    0.288851] pci_bus 0000:00: root bus resource [mem
> 0xd0000000-0xdfffffff]
> [    0.288853] pci_bus 0000:00: root bus resource [mem
> 0xf0000000-0xfebfffff]
> [    0.288863] pci 0000:00:00.0: [1022:9601] type 00 class 0x060000
> [    0.288955] pci 0000:00:02.0: [1022:9603] type 01 class 0x060400
> [    0.288988] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
> [    0.289023] pci 0000:00:02.0: System wakeup disabled by ACPI
> [    0.289059] pci 0000:00:06.0: [1022:9606] type 01 class 0x060400
> [    0.289090] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
> [    0.289127] pci 0000:00:06.0: System wakeup disabled by ACPI
> [    0.289159] pci 0000:00:07.0: [1022:9607] type 01 class 0x060400
> [    0.289190] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
> [    0.289224] pci 0000:00:07.0: System wakeup disabled by ACPI
> [    0.289257] pci 0000:00:09.0: [1022:9608] type 01 class 0x060400
> [    0.289288] pci 0000:00:09.0: PME# supported from D0 D3hot D3cold
> [    0.289322] pci 0000:00:09.0: System wakeup disabled by ACPI
> [    0.289353] pci 0000:00:0a.0: [1022:9609] type 01 class 0x060400
> [    0.289383] pci 0000:00:0a.0: PME# supported from D0 D3hot D3cold
> [    0.289417] pci 0000:00:0a.0: System wakeup disabled by ACPI
> [    0.289463] pci 0000:00:11.0: [1002:4391] type 00 class 0x010601
> [    0.289482] pci 0000:00:11.0: reg 0x10: [io  0x9000-0x9007]
> [    0.289491] pci 0000:00:11.0: reg 0x14: [io  0x8000-0x8003]
> [    0.289499] pci 0000:00:11.0: reg 0x18: [io  0x7000-0x7007]
> [    0.289508] pci 0000:00:11.0: reg 0x1c: [io  0x6000-0x6003]
> [    0.289516] pci 0000:00:11.0: reg 0x20: [io  0x5000-0x500f]
> [    0.289525] pci 0000:00:11.0: reg 0x24: [mem 0xf9fffc00-0xf9ffffff]
> [    0.289622] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310
> [    0.289635] pci 0000:00:12.0: reg 0x10: [mem 0xf9ffe000-0xf9ffefff]
> [    0.289715] pci 0000:00:12.0: System wakeup disabled by ACPI
> [    0.289748] pci 0000:00:12.1: [1002:4398] type 00 class 0x0c0310
> [    0.289760] pci 0000:00:12.1: reg 0x10: [mem 0xf9ffd000-0xf9ffdfff]
> [    0.289841] pci 0000:00:12.1: System wakeup disabled by ACPI
> [    0.289879] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320
> [    0.289896] pci 0000:00:12.2: reg 0x10: [mem 0xf9fff800-0xf9fff8ff]
> [    0.289973] pci 0000:00:12.2: supports D1 D2
> [    0.289974] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot
> [    0.290012] pci 0000:00:12.2: System wakeup disabled by ACPI
> [    0.290050] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310
> [    0.290062] pci 0000:00:13.0: reg 0x10: [mem 0xf9ffc000-0xf9ffcfff]
> [    0.290143] pci 0000:00:13.0: System wakeup disabled by ACPI
> [    0.290175] pci 0000:00:13.1: [1002:4398] type 00 class 0x0c0310
> [    0.290187] pci 0000:00:13.1: reg 0x10: [mem 0xf9ffb000-0xf9ffbfff]
> [    0.290269] pci 0000:00:13.1: System wakeup disabled by ACPI
> [    0.290306] pci 0000:00:13.2: [1002:4396] type 00 class 0x0c0320
> [    0.290324] pci 0000:00:13.2: reg 0x10: [mem 0xf9fff400-0xf9fff4ff]
> [    0.290400] pci 0000:00:13.2: supports D1 D2
> [    0.290401] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot
> [    0.290440] pci 0000:00:13.2: System wakeup disabled by ACPI
> [    0.290481] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500
> [    0.290619] pci 0000:00:14.1: [1002:439c] type 00 class 0x01018a
> [    0.290634] pci 0000:00:14.1: reg 0x10: [io  0x0000-0x0007]
> [    0.290642] pci 0000:00:14.1: reg 0x14: [io  0x0000-0x0003]
> [    0.290650] pci 0000:00:14.1: reg 0x18: [io  0x0000-0x0007]
> [    0.290658] pci 0000:00:14.1: reg 0x1c: [io  0x0000-0x0003]
> [    0.290667] pci 0000:00:14.1: reg 0x20: [io  0xff00-0xff0f]
> [    0.290685] pci 0000:00:14.1: legacy IDE quirk: reg 0x10: [io
>  0x01f0-0x01f7]
> [    0.290688] pci 0000:00:14.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    0.290690] pci 0000:00:14.1: legacy IDE quirk: reg 0x18: [io
>  0x0170-0x0177]
> [    0.290692] pci 0000:00:14.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    0.290775] pci 0000:00:14.2: [1002:4383] type 00 class 0x040300
> [    0.290795] pci 0000:00:14.2: reg 0x10: [mem 0xf9ff4000-0xf9ff7fff
> 64bit]
> [    0.290856] pci 0000:00:14.2: PME# supported from D0 D3hot D3cold
> [    0.290891] pci 0000:00:14.2: System wakeup disabled by ACPI
> [    0.290924] pci 0000:00:14.3: [1002:439d] type 00 class 0x060100
> [    0.291040] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401
> [    0.291100] pci 0000:00:14.4: System wakeup disabled by ACPI
> [    0.291132] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310
> [    0.291144] pci 0000:00:14.5: reg 0x10: [mem 0xf9ffa000-0xf9ffafff]
> [    0.291226] pci 0000:00:14.5: System wakeup disabled by ACPI
> [    0.291261] pci 0000:00:18.0: [1022:1600] type 00 class 0x060000
> [    0.291323] pci 0000:00:18.1: [1022:1601] type 00 class 0x060000
> [    0.291378] pci 0000:00:18.2: [1022:1602] type 00 class 0x060000
> [    0.291435] pci 0000:00:18.3: [1022:1603] type 00 class 0x060000
> [    0.291495] pci 0000:00:18.4: [1022:1604] type 00 class 0x060000
> [    0.291550] pci 0000:00:18.5: [1022:1605] type 00 class 0x060000
> [    0.291651] pci 0000:01:00.0: [10de:0a65] type 00 class 0x030000
> [    0.291661] pci 0000:01:00.0: reg 0x10: [mem 0xfd000000-0xfdffffff]
> [    0.291671] pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff
> 64bit pref]
> [    0.291680] pci 0000:01:00.0: reg 0x1c: [mem 0xfa000000-0xfbffffff
> 64bit]
> [    0.291686] pci 0000:01:00.0: reg 0x24: [io  0xa800-0xa87f]
> [    0.291692] pci 0000:01:00.0: reg 0x30: [mem 0xfe8e0000-0xfe8fffff pref]
> [    0.296100] pci 0000:00:02.0: PCI bridge to [bus 01]
> [    0.296105] pci 0000:00:02.0:   bridge window [io  0xa000-0xafff]
> [    0.296107] pci 0000:00:02.0:   bridge window [mem
> 0xfa000000-0xfe8fffff]
> [    0.296109] pci 0000:00:02.0:   bridge window [mem
> 0xd0000000-0xdfffffff 64bit pref]
> [    0.296156] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
> [    0.296170] pci 0000:02:00.0: reg 0x10: [io  0xb800-0xb8ff]
> [    0.296189] pci 0000:02:00.0: reg 0x18: [mem 0xfe9ff000-0xfe9fffff
> 64bit]
> [    0.296201] pci 0000:02:00.0: reg 0x20: [mem 0xf8efc000-0xf8efffff
> 64bit pref]
> [    0.296263] pci 0000:02:00.0: supports D1 D2
> [    0.296264] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.304108] pci 0000:00:06.0: PCI bridge to [bus 02]
> [    0.304112] pci 0000:00:06.0:   bridge window [io  0xb000-0xbfff]
> [    0.304114] pci 0000:00:06.0:   bridge window [mem
> 0xfe900000-0xfe9fffff]
> [    0.304117] pci 0000:00:06.0:   bridge window [mem
> 0xf8e00000-0xf8efffff 64bit pref]
> [    0.304162] pci 0000:03:00.0: [1b21:0612] type 00 class 0x010601
> [    0.304174] pci 0000:03:00.0: reg 0x10: [io  0xd800-0xd807]
> [    0.304181] pci 0000:03:00.0: reg 0x14: [io  0xd400-0xd403]
> [    0.304188] pci 0000:03:00.0: reg 0x18: [io  0xd000-0xd007]
> [    0.304195] pci 0000:03:00.0: reg 0x1c: [io  0xc800-0xc803]
> [    0.304202] pci 0000:03:00.0: reg 0x20: [io  0xc400-0xc41f]
> [    0.304209] pci 0000:03:00.0: reg 0x24: [mem 0xfeaffc00-0xfeaffdff]
> [    0.312113] pci 0000:00:07.0: PCI bridge to [bus 03]
> [    0.312118] pci 0000:00:07.0:   bridge window [io  0xc000-0xdfff]
> [    0.312119] pci 0000:00:07.0:   bridge window [mem
> 0xfea00000-0xfeafffff]
> [    0.312166] pci 0000:04:00.0: [1b6f:7052] type 00 class 0x0c0330
> [    0.312184] pci 0000:04:00.0: reg 0x10: [mem 0xfebf8000-0xfebfffff
> 64bit]
> [    0.312263] pci 0000:04:00.0: supports D1 D2
> [    0.312265] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.320122] pci 0000:00:09.0: PCI bridge to [bus 04]
> [    0.320128] pci 0000:00:09.0:   bridge window [mem
> 0xfeb00000-0xfebfffff]
> [    0.320173] pci 0000:05:00.0: [10ec:8168] type 00 class 0x020000
> [    0.320187] pci 0000:05:00.0: reg 0x10: [io  0xe800-0xe8ff]
> [    0.320206] pci 0000:05:00.0: reg 0x18: [mem 0xf8fff000-0xf8ffffff
> 64bit pref]
> [    0.320218] pci 0000:05:00.0: reg 0x20: [mem 0xf8ff8000-0xf8ffbfff
> 64bit pref]
> [    0.320279] pci 0000:05:00.0: supports D1 D2
> [    0.320280] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.328130] pci 0000:00:0a.0: PCI bridge to [bus 05]
> [    0.328134] pci 0000:00:0a.0:   bridge window [io  0xe000-0xefff]
> [    0.328138] pci 0000:00:0a.0:   bridge window [mem
> 0xf8f00000-0xf8ffffff 64bit pref]
> [    0.328209] pci 0000:00:14.4: PCI bridge to [bus 06] (subtractive
> decode)
> [    0.328219] pci 0000:00:14.4:   bridge window [io  0x0000-0x0cf7]
> (subtractive decode)
> [    0.328220] pci 0000:00:14.4:   bridge window [io  0x0d00-0xffff]
> (subtractive decode)
> [    0.328221] pci 0000:00:14.4:   bridge window [mem
> 0x000a0000-0x000bffff] (subtractive decode)
> [    0.328223] pci 0000:00:14.4:   bridge window [mem
> 0x000d0000-0x000dffff] (subtractive decode)
> [    0.328224] pci 0000:00:14.4:   bridge window [mem
> 0xd0000000-0xdfffffff] (subtractive decode)
> [    0.328225] pci 0000:00:14.4:   bridge window [mem
> 0xf0000000-0xfebfffff] (subtractive decode)
> [    0.328246] pci_bus 0000:00: on NUMA node 0
> [    0.328858] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 7 10 11 12 14 15)
> *0, disabled.
> [    0.328900] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 7 10 11 12 14 15)
> *0, disabled.
> [    0.328942] ACPI: PCI Interrupt Link [LNKC] (IRQs 10 12 14 15) *0,
> disabled.
> [    0.328981] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 7 10 11 12 14 15)
> *0, disabled.
> [    0.329021] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 10 11 12 14 15) *0,
> disabled.
> [    0.329061] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 10 11 12 14 15) *0,
> disabled.
> [    0.329101] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 10 11 12 14 15) *0,
> disabled.
> [    0.329143] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 7 10 11 12 14 15)
> *0, disabled.
> [    0.329200] ACPI: Enabled 1 GPEs in block 00 to 1F
> [    0.329282] vgaarb: setting as boot device: PCI:0000:01:00.0
> [    0.329285] vgaarb: device added:
> PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
> [    0.329288] vgaarb: loaded
> [    0.329290] vgaarb: bridge control possible 0000:01:00.0
> [    0.329498] SCSI subsystem initialized
> [    0.329545] libata version 3.00 loaded.
> [    0.329567] ACPI: bus type USB registered
> [    0.329583] usbcore: registered new interface driver usbfs
> [    0.329592] usbcore: registered new interface driver hub
> [    0.329612] usbcore: registered new device driver usb
> [    0.329737] PCI: Using ACPI for IRQ routing
> [    0.337703] PCI: pci_cache_line_size set to 64 bytes
> [    0.337758] e820: reserve RAM buffer [mem 0x0009dc00-0x0009ffff]
> [    0.337759] e820: reserve RAM buffer [mem 0xcffa0000-0xcfffffff]
> [    0.337760] e820: reserve RAM buffer [mem 0x22f000000-0x22fffffff]
> [    0.337848] NetLabel: Initializing
> [    0.337849] NetLabel:  domain hash size = 128
> [    0.337851] NetLabel:  protocols = UNLABELED CIPSOv4
> [    0.337861] NetLabel:  unlabeled traffic allowed by default
> [    0.337907] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
> [    0.337912] hpet0: 4 comparators, 32-bit 14.318180 MHz counter
> [    0.339983] Switched to clocksource hpet
> [    0.345803] AppArmor: AppArmor Filesystem Enabled
> [    0.345823] pnp: PnP ACPI init
> [    0.345835] ACPI: bus type PNP registered
> [    0.345949] system 00:00: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.345997] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.346391] system 00:02: [mem 0xfec00000-0xfec00fff] could not be
> reserved
> [    0.346394] system 00:02: [mem 0xfee00000-0xfee00fff] has been reserved
> [    0.346397] system 00:02: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.346596] system 00:03: [io  0x04d0-0x04d1] has been reserved
> [    0.346599] system 00:03: [io  0x040b] has been reserved
> [    0.346602] system 00:03: [io  0x04d6] has been reserved
> [    0.346605] system 00:03: [io  0x0c00-0x0c01] has been reserved
> [    0.346607] system 00:03: [io  0x0c14] has been reserved
> [    0.346610] system 00:03: [io  0x0c50-0x0c51] has been reserved
> [    0.346613] system 00:03: [io  0x0c52] has been reserved
> [    0.346615] system 00:03: [io  0x0c6c] has been reserved
> [    0.346618] system 00:03: [io  0x0c6f] has been reserved
> [    0.346620] system 00:03: [io  0x0cd0-0x0cd1] has been reserved
> [    0.346623] system 00:03: [io  0x0cd2-0x0cd3] has been reserved
> [    0.346626] system 00:03: [io  0x0cd4-0x0cd5] has been reserved
> [    0.346628] system 00:03: [io  0x0cd6-0x0cd7] has been reserved
> [    0.346631] system 00:03: [io  0x0cd8-0x0cdf] has been reserved
> [    0.346634] system 00:03: [io  0x0800-0x089f] could not be reserved
> [    0.346636] system 00:03: [io  0x0b00-0x0b0f] has been reserved
> [    0.346639] system 00:03: [io  0x0b20-0x0b3f] has been reserved
> [    0.346642] system 00:03: [io  0x0900-0x090f] has been reserved
> [    0.346644] system 00:03: [io  0x0910-0x091f] has been reserved
> [    0.346647] system 00:03: [io  0xfe00-0xfefe] has been reserved
> [    0.346650] system 00:03: [mem 0xffb80000-0xffbfffff] has been reserved
> [    0.346653] system 00:03: [mem 0xfec10000-0xfec1001f] has been reserved
> [    0.346656] system 00:03: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.346855] pnp 00:04: [dma 0 disabled]
> [    0.346903] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.346983] system 00:05: [io  0x0290-0x029f] has been reserved
> [    0.346986] system 00:05: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.347038] system 00:06: [mem 0xe0000000-0xefffffff] has been reserved
> [    0.347041] system 00:06: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.347225] system 00:07: [mem 0x00000000-0x0009ffff] could not be
> reserved
> [    0.347228] system 00:07: [mem 0x000e0000-0x000fffff] could not be
> reserved
> [    0.347231] system 00:07: [mem 0x00100000-0xcfffffff] could not be
> reserved
> [    0.347234] system 00:07: [mem 0xfec00000-0xffffffff] could not be
> reserved
> [    0.347237] system 00:07: Plug and Play ACPI device, IDs PNP0c01
> (active)
> [    0.347320] pnp: PnP ACPI: found 8 devices
> [    0.347322] ACPI: bus type PNP unregistered
> [    0.353807] pci 0000:00:02.0: PCI bridge to [bus 01]
> [    0.353810] pci 0000:00:02.0:   bridge window [io  0xa000-0xafff]
> [    0.353814] pci 0000:00:02.0:   bridge window [mem
> 0xfa000000-0xfe8fffff]
> [    0.353817] pci 0000:00:02.0:   bridge window [mem
> 0xd0000000-0xdfffffff 64bit pref]
> [    0.353822] pci 0000:00:06.0: PCI bridge to [bus 02]
> [    0.353824] pci 0000:00:06.0:   bridge window [io  0xb000-0xbfff]
> [    0.353828] pci 0000:00:06.0:   bridge window [mem
> 0xfe900000-0xfe9fffff]
> [    0.353831] pci 0000:00:06.0:   bridge window [mem
> 0xf8e00000-0xf8efffff 64bit pref]
> [    0.353835] pci 0000:00:07.0: PCI bridge to [bus 03]
> [    0.353838] pci 0000:00:07.0:   bridge window [io  0xc000-0xdfff]
> [    0.353841] pci 0000:00:07.0:   bridge window [mem
> 0xfea00000-0xfeafffff]
> [    0.353846] pci 0000:00:09.0: PCI bridge to [bus 04]
> [    0.353849] pci 0000:00:09.0:   bridge window [mem
> 0xfeb00000-0xfebfffff]
> [    0.353853] pci 0000:00:0a.0: PCI bridge to [bus 05]
> [    0.353856] pci 0000:00:0a.0:   bridge window [io  0xe000-0xefff]
> [    0.353860] pci 0000:00:0a.0:   bridge window [mem
> 0xf8f00000-0xf8ffffff 64bit pref]
> [    0.353864] pci 0000:00:14.4: PCI bridge to [bus 06]
> [    0.353876] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.353877] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
> [    0.353878] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
> [    0.353880] pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff]
> [    0.353881] pci_bus 0000:00: resource 8 [mem 0xd0000000-0xdfffffff]
> [    0.353882] pci_bus 0000:00: resource 9 [mem 0xf0000000-0xfebfffff]
> [    0.353883] pci_bus 0000:01: resource 0 [io  0xa000-0xafff]
> [    0.353885] pci_bus 0000:01: resource 1 [mem 0xfa000000-0xfe8fffff]
> [    0.353886] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff
> 64bit pref]
> [    0.353887] pci_bus 0000:02: resource 0 [io  0xb000-0xbfff]
> [    0.353888] pci_bus 0000:02: resource 1 [mem 0xfe900000-0xfe9fffff]
> [    0.353889] pci_bus 0000:02: resource 2 [mem 0xf8e00000-0xf8efffff
> 64bit pref]
> [    0.353891] pci_bus 0000:03: resource 0 [io  0xc000-0xdfff]
> [    0.353892] pci_bus 0000:03: resource 1 [mem 0xfea00000-0xfeafffff]
> [    0.353893] pci_bus 0000:04: resource 1 [mem 0xfeb00000-0xfebfffff]
> [    0.353894] pci_bus 0000:05: resource 0 [io  0xe000-0xefff]
> [    0.353896] pci_bus 0000:05: resource 2 [mem 0xf8f00000-0xf8ffffff
> 64bit pref]
> [    0.353897] pci_bus 0000:06: resource 4 [io  0x0000-0x0cf7]
> [    0.353898] pci_bus 0000:06: resource 5 [io  0x0d00-0xffff]
> [    0.353899] pci_bus 0000:06: resource 6 [mem 0x000a0000-0x000bffff]
> [    0.353900] pci_bus 0000:06: resource 7 [mem 0x000d0000-0x000dffff]
> [    0.353902] pci_bus 0000:06: resource 8 [mem 0xd0000000-0xdfffffff]
> [    0.353903] pci_bus 0000:06: resource 9 [mem 0xf0000000-0xfebfffff]
> [    0.353923] NET: Registered protocol family 2
> [    0.354110] TCP established hash table entries: 65536 (order: 7, 524288
> bytes)
> [    0.354288] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
> [    0.354512] TCP: Hash tables configured (established 65536 bind 65536)
> [    0.354544] TCP: reno registered
> [    0.354554] UDP hash table entries: 4096 (order: 5, 131072 bytes)
> [    0.354595] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
> [    0.354661] NET: Registered protocol family 1
> [    0.800566] pci 0000:01:00.0: Video device with shadowed ROM
> [    0.800712] PCI: CLS 64 bytes, default 64
> [    0.800769] Trying to unpack rootfs image as initramfs...
> [    1.010395] Freeing initrd memory: 19124K (ffff880035a96000 -
> ffff880036d43000)
> [    1.010691] PCI-DMA: Disabling AGP.
> [    1.010769] PCI-DMA: aperture base @ c4000000 size 65536 KB
> [    1.010771] PCI-DMA: using GART IOMMU.
> [    1.010774] PCI-DMA: Reserving 64MB of IOMMU area in the AGP aperture
> [    1.014431] perf: AMD NB counters detected
> [    1.014496] microcode: CPU0: patch_level=0x06000817
> [    1.014503] microcode: CPU1: patch_level=0x06000817
> [    1.014513] microcode: CPU2: patch_level=0x06000817
> [    1.014523] microcode: CPU3: patch_level=0x06000817
> [    1.014533] microcode: CPU4: patch_level=0x06000817
> [    1.014544] microcode: CPU5: patch_level=0x06000817
> [    1.014553] microcode: CPU6: patch_level=0x06000817
> [    1.014564] microcode: CPU7: patch_level=0x06000817
> [    1.014613] microcode: Microcode Update Driver: v2.00 <
> tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
> [    1.014619] LVT offset 0 assigned for vector 0x400
> [    1.014639] perf: AMD IBS detected (0x000000ff)
> [    1.014657] Scanning for low memory corruption every 60 seconds
> [    1.014968] futex hash table entries: 2048 (order: 5, 131072 bytes)
> [    1.014992] Initialise system trusted keyring
> [    1.015010] audit: initializing netlink subsys (disabled)
> [    1.015024] audit: type=2000 audit(1434064609.896:1): initialized
> [    1.015292] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> [    1.016720] zpool: loaded
> [    1.016723] zbud: loaded
> [    1.016845] VFS: Disk quotas dquot_6.5.2
> [    1.016876] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    1.017318] fuse init (API version 7.23)
> [    1.017394] msgmni has been set to 15932
> [    1.017442] Key type big_key registered
> [    1.017828] Key type asymmetric registered
> [    1.017831] Asymmetric key parser 'x509' registered
> [    1.017862] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 252)
> [    1.017915] io scheduler noop registered
> [    1.017918] io scheduler deadline registered (default)
> [    1.017960] io scheduler cfq registered
> [    1.018161] pcieport 0000:00:02.0: irq 40 for MSI/MSI-X
> [    1.018295] pcieport 0000:00:06.0: irq 41 for MSI/MSI-X
> [    1.018422] pcieport 0000:00:07.0: irq 42 for MSI/MSI-X
> [    1.018463] pcieport 0000:00:09.0: irq 43 for MSI/MSI-X
> [    1.018590] pcieport 0000:00:0a.0: irq 44 for MSI/MSI-X
> [    1.018646] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
> [    1.018661] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
> [    1.018704] vesafb: mode is 640x480x32, linelength=2560, pages=0
> [    1.018706] vesafb: scrolling: redraw
> [    1.018708] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
> [    1.026887] vesafb: framebuffer at 0xfb000000, mapped to
> 0xffffc90010e80000, using 1216k, total 1216k
> [    1.027623] Console: switching to colour frame buffer device 80x30
> [    1.028274] fb0: VESA VGA frame buffer device
> [    1.028370] input: Power Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> [    1.028398] ACPI: Power Button [PWRB]
> [    1.028444] input: Power Button as
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> [    1.029305] ACPI: Power Button [PWRF]
> [    1.029779] ACPI: acpi_idle registered with cpuidle
> [    1.030211] GHES: HEST is not enabled!
> [    1.030719] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    1.051604] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is
> a 16550A
> [    1.054011] Linux agpgart interface v0.103
> [    1.055645] brd: module loaded
> [    1.056690] loop: module loaded
> [    1.057325] libphy: Fixed MDIO Bus: probed
> [    1.057761] tun: Universal TUN/TAP device driver, 1.6
> [    1.058190] tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
> [    1.058676] PPP generic driver version 2.4.2
> [    1.059153] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    1.059606] ehci-pci: EHCI PCI platform driver
> [    1.060181] ehci-pci 0000:00:12.2: EHCI Host Controller
> [    1.060640] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus
> number 1
> [    1.061560] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3
> EHCI dummy qh workaround
> [    1.062496] ehci-pci 0000:00:12.2: debug port 1
> [    1.062998] ehci-pci 0000:00:12.2: irq 17, io mem 0xf9fff800
> [    1.072731] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
> [    1.073227] usb usb1: New USB device found, idVendor=1d6b,
> idProduct=0002
> [    1.073681] usb usb1: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.074551] usb usb1: Product: EHCI Host Controller
> [    1.074973] usb usb1: Manufacturer: Linux 3.16.0-38-generic ehci_hcd
> [    1.075404] usb usb1: SerialNumber: 0000:00:12.2
> [    1.075971] hub 1-0:1.0: USB hub found
> [    1.076402] hub 1-0:1.0: 6 ports detected
> [    1.077091] ehci-pci 0000:00:13.2: EHCI Host Controller
> [    1.077521] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus
> number 2
> [    1.078364] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3
> EHCI dummy qh workaround
> [    1.079229] ehci-pci 0000:00:13.2: debug port 1
> [    1.079699] ehci-pci 0000:00:13.2: irq 19, io mem 0xf9fff400
> [    1.088779] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
> [    1.089269] usb usb2: New USB device found, idVendor=1d6b,
> idProduct=0002
> [    1.089718] usb usb2: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.090598] usb usb2: Product: EHCI Host Controller
> [    1.091031] usb usb2: Manufacturer: Linux 3.16.0-38-generic ehci_hcd
> [    1.091458] usb usb2: SerialNumber: 0000:00:13.2
> [    1.092027] hub 2-0:1.0: USB hub found
> [    1.092455] hub 2-0:1.0: 6 ports detected
> [    1.093003] ehci-platform: EHCI generic platform driver
> [    1.093427] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    1.093842] ohci-pci: OHCI PCI platform driver
> [    1.094365] ohci-pci 0000:00:12.0: OHCI PCI host controller
> [    1.094785] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus
> number 3
> [    1.095643] ohci-pci 0000:00:12.0: irq 16, io mem 0xf9ffe000
> [    1.152862] usb usb3: New USB device found, idVendor=1d6b,
> idProduct=0001
> [    1.153294] usb usb3: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.154140] usb usb3: Product: OHCI PCI host controller
> [    1.154576] usb usb3: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.155016] usb usb3: SerialNumber: 0000:00:12.0
> [    1.155600] hub 3-0:1.0: USB hub found
> [    1.156043] hub 3-0:1.0: 3 ports detected
> [    1.156655] ohci-pci 0000:00:12.1: OHCI PCI host controller
> [    1.157090] ohci-pci 0000:00:12.1: new USB bus registered, assigned bus
> number 4
> [    1.157929] ohci-pci 0000:00:12.1: irq 16, io mem 0xf9ffd000
> [    1.216925] usb usb4: New USB device found, idVendor=1d6b,
> idProduct=0001
> [    1.217364] usb usb4: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.218228] usb usb4: Product: OHCI PCI host controller
> [    1.218669] usb usb4: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.219105] usb usb4: SerialNumber: 0000:00:12.1
> [    1.219692] hub 4-0:1.0: USB hub found
> [    1.220126] hub 4-0:1.0: 3 ports detected
> [    1.220728] ohci-pci 0000:00:13.0: OHCI PCI host controller
> [    1.221161] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus
> number 5
> [    1.222054] ohci-pci 0000:00:13.0: irq 18, io mem 0xf9ffc000
> [    1.280989] usb usb5: New USB device found, idVendor=1d6b,
> idProduct=0001
> [    1.281442] usb usb5: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.282335] usb usb5: Product: OHCI PCI host controller
> [    1.282785] usb usb5: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.283234] usb usb5: SerialNumber: 0000:00:13.0
> [    1.283833] hub 5-0:1.0: USB hub found
> [    1.284272] hub 5-0:1.0: 3 ports detected
> [    1.284875] ohci-pci 0000:00:13.1: OHCI PCI host controller
> [    1.285305] ohci-pci 0000:00:13.1: new USB bus registered, assigned bus
> number 6
> [    1.286172] ohci-pci 0000:00:13.1: irq 18, io mem 0xf9ffb000
> [    1.345068] usb usb6: New USB device found, idVendor=1d6b,
> idProduct=0001
> [    1.345522] usb usb6: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.346411] usb usb6: Product: OHCI PCI host controller
> [    1.346858] usb usb6: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.347307] usb usb6: SerialNumber: 0000:00:13.1
> [    1.347896] hub 6-0:1.0: USB hub found
> [    1.348335] hub 6-0:1.0: 3 ports detected
> [    1.348937] ohci-pci 0000:00:14.5: OHCI PCI host controller
> [    1.349366] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus
> number 7
> [    1.350231] ohci-pci 0000:00:14.5: irq 18, io mem 0xf9ffa000
> [    1.409109] usb usb7: New USB device found, idVendor=1d6b,
> idProduct=0001
> [    1.409546] usb usb7: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.410403] usb usb7: Product: OHCI PCI host controller
> [    1.410846] usb usb7: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.411294] usb usb7: SerialNumber: 0000:00:14.5
> [    1.411881] hub 7-0:1.0: USB hub found
> [    1.412320] hub 7-0:1.0: 2 ports detected
> [    1.412809] ohci-platform: OHCI generic platform driver
> [    1.413242] uhci_hcd: USB Universal Host Controller Interface driver
> [    1.413734] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.414166] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus
> number 8
> [    1.415118] xhci_hcd 0000:04:00.0: irq 45 for MSI/MSI-X
> [    1.415165] usb usb8: New USB device found, idVendor=1d6b,
> idProduct=0002
> [    1.415619] usb usb8: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.416507] usb usb8: Product: xHCI Host Controller
> [    1.416952] usb usb8: Manufacturer: Linux 3.16.0-38-generic xhci_hcd
> [    1.417409] usb usb8: SerialNumber: 0000:04:00.0
> [    1.417980] hub 8-0:1.0: USB hub found
> [    1.418413] hub 8-0:1.0: 4 ports detected
> [    1.418922] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.419346] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus
> number 9
> [    1.420224] usb usb9: New USB device found, idVendor=1d6b,
> idProduct=0003
> [    1.420676] usb usb9: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    1.421566] usb usb9: Product: xHCI Host Controller
> [    1.422009] usb usb9: Manufacturer: Linux 3.16.0-38-generic xhci_hcd
> [    1.422453] usb usb9: SerialNumber: 0000:04:00.0
> [    1.423014] hub 9-0:1.0: USB hub found
> [    1.423450] hub 9-0:1.0: 4 ports detected
> [    1.423994] i8042: PNP: No PS/2 controller found. Probing ports
> directly.
> [    1.426976] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    1.427395] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    1.427950] mousedev: PS/2 mouse device common for all mice
> [    1.428542] rtc_cmos 00:01: RTC can wake from S4
> [    1.429140] rtc_cmos 00:01: rtc core: registered rtc_cmos as rtc0
> [    1.429594] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes
> nvram, hpet irqs
> [    1.430501] device-mapper: uevent: version 1.0.3
> [    1.431015] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30)
> initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
> [    1.431876] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.432385] TCP: cubic registered
> [    1.432912] NET: Registered protocol family 10
> [    1.433562] NET: Registered protocol family 17
> [    1.433981] Key type dns_resolver registered
> [    1.435067] Loading compiled-in X.509 certificates
> [    1.436122] Loaded X.509 cert 'Magrathea: Glacier signing key:
> c284edaccf0b473652c34d23bec356944236e63b'
> [    1.436985] registered taskstats version 1
> [    1.439184] Key type trusted registered
> [    1.442721] Key type encrypted registered
> [    1.443116] AppArmor: AppArmor sha1 policy hashing enabled
> [    1.443514] ima: No TPM chip found, activating TPM-bypass!
> [    1.443921] evm: HMAC attrs: 0x1
> [    1.444727]   Magic number: 3:985:301
> [    1.445140] tty tty30: hash matches
> [    1.445619] rtc_cmos 00:01: setting system clock to 2015-06-11 23:16:51
> UTC (1434064611)
> [    1.446702] acpi-cpufreq: overriding BIOS provided _PSD data
> [    1.447525] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
> [    1.447941] EDD information not available.
> [    1.448403] PM: Hibernation image not present or could not be loaded.
> [    1.449473] Freeing unused kernel memory: 1352K (ffffffff81d1c000 -
> ffffffff81e6e000)
> [    1.450347] Write protecting the kernel read-only data: 12288k
> [    1.452474] Freeing unused kernel memory: 556K (ffff880001775000 -
> ffff880001800000)
> [    1.454811] Freeing unused kernel memory: 500K (ffff880001b83000 -
> ffff880001c00000)
> [    1.467097] systemd-udevd[144]: starting version 204
> [    1.482331] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
> [    1.482910] ahci 0000:00:11.0: version 3.0
> [    1.483020] r8169 0000:02:00.0: irq 46 for MSI/MSI-X
> [    1.483144] ahci 0000:00:11.0: AHCI 0001.0100 32 slots 4 ports 3 Gbps
> 0xf impl SATA mode
> [    1.483256] r8169 0000:02:00.0 eth0: RTL8168e/8111e at
> 0xffffc90010e66000, e8:de:27:01:f6:19, XID 0c200000 IRQ 46
> [    1.483257] r8169 0000:02:00.0 eth0: jumbo features [frames: 9200
> bytes, tx checksumming: ko]
> [    1.483275] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
> [    1.483500] r8169 0000:05:00.0: irq 47 for MSI/MSI-X
> [    1.483671] r8169 0000:05:00.0 eth1: RTL8168evl/8111evl at
> 0xffffc90010fb4000, d0:50:99:30:c6:76, XID 0c900800 IRQ 47
> [    1.483672] r8169 0000:05:00.0 eth1: jumbo features [frames: 9200
> bytes, tx checksumming: ko]
> [    1.488749] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo
> pmp pio slum part ccc
> [    1.490977] scsi0 : ahci
> [    1.492030] scsi1 : ahci
> [    1.494136] scsi2 : ahci
> [    1.494821] scsi3 : ahci
> [    1.495406] ata1: SATA max UDMA/133 abar m1024@0xf9fffc00 port
> 0xf9fffd00 irq 22
> [    1.496404] ata2: SATA max UDMA/133 abar m1024@0xf9fffc00 port
> 0xf9fffd80 irq 22
> [    1.497415] ata3: SATA max UDMA/133 abar m1024@0xf9fffc00 port
> 0xf9fffe00 irq 22
> [    1.498417] ata4: SATA max UDMA/133 abar m1024@0xf9fffc00 port
> 0xf9fffe80 irq 22
> [    1.499589] ahci 0000:03:00.0: irq 48 for MSI/MSI-X
> [    1.499613] ahci 0000:03:00.0: SSS flag set, parallel bus scan disabled
> [    1.500164] ahci 0000:03:00.0: AHCI 0001.0200 32 slots 2 ports 6 Gbps
> 0x3 impl SATA mode
> [    1.501225] ahci 0000:03:00.0: flags: 64bit ncq sntf stag led clo pmp
> pio slum part ccc sxs
> [    1.501229] scsi4 : pata_atiixp
> [    1.501445] scsi5 : pata_atiixp
> [    1.501573] ata5: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0xff00
> irq 14
> [    1.501573] ata6: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0xff08
> irq 15
> [    1.504907] scsi6 : ahci
> [    1.505613] scsi7 : ahci
> [    1.506270] ata7: SATA max UDMA/133 abar m512@0xfeaffc00 port
> 0xfeaffd00 irq 48
> [    1.507196] ata8: SATA max UDMA/133 abar m512@0xfeaffc00 port
> 0xfeaffd80 irq 48
> [    1.529416] systemd-udevd[147]: renamed network interface eth1 to p10p1
> [    1.545433] systemd-udevd[152]: renamed network interface eth0 to p7p1
> [    1.573331] usb 2-2: new high-speed USB device number 2 using ehci-pci
> [    1.685915] ata6.01: ATAPI: HL-DT-STDVD-RAM GSA-H58N, 1.00, max UDMA/66
> [    1.701871] ata6.01: configured for UDMA/66
> [    1.706182] usb 2-2: New USB device found, idVendor=0ace, idProduct=1215
> [    1.706692] usb 2-2: New USB device strings: Mfr=16, Product=32,
> SerialNumber=0
> [    1.707680] usb 2-2: Product: USB2.0 WLAN
> [    1.708165] usb 2-2: Manufacturer: ZyDAS
> [    1.817520] ata1: SATA link down (SStatus 0 SControl 300)
> [    1.818101] ata3: SATA link down (SStatus 0 SControl 300)
> [    1.818587] ata4: SATA link down (SStatus 0 SControl 300)
> [    1.819049] ata2: SATA link down (SStatus 0 SControl 300)
> [    1.821142] scsi 5:0:1:0: CD-ROM            HL-DT-ST DVD-RAM GSA-H58N
> 1.00 PQ: 0 ANSI: 5
> [    1.831872] sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2
> cdda tray
> [    1.832776] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    1.833371] sr 5:0:1:0: Attached scsi CD-ROM sr0
> [    1.833487] sr 5:0:1:0: Attached scsi generic sg0 type 5
> [    1.841543] usb 4-1: new low-speed USB device number 2 using ohci-pci
> [    1.997384] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [    1.998773] ata7.00: ATA-9: SSD2SC120G1SA754D117-820, N0530A, max
> UDMA/133
> [    1.999239] ata7.00: 234441648 sectors, multi 1: LBA48 NCQ (depth
> 31/32), AA
> [    1.999981] ata7.00: configured for UDMA/133
> [    2.000550] scsi 6:0:0:0: Direct-Access     ATA      SSD2SC120G1SA754
> 0A   PQ: 0 ANSI: 5
> [    2.001687] sd 6:0:0:0: [sda] 234441648 512-byte logical blocks: (120
> GB/111 GiB)
> [    2.001692] sd 6:0:0:0: Attached scsi generic sg1 type 0
> [    2.003149] sd 6:0:0:0: [sda] Write Protect is off
> [    2.003554] sd 6:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    2.003683] sd 6:0:0:0: [sda] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [    2.005117]  sda: sda1 sda2 sda3
> [    2.005816] sd 6:0:0:0: [sda] Attached SCSI disk
> [    2.008240] tsc: Refined TSC clocksource calibration: 4653.112 MHz
> [    2.013385] usb 4-1: New USB device found, idVendor=04d9, idProduct=0022
> [    2.013882] usb 4-1: New USB device strings: Mfr=0, Product=2,
> SerialNumber=0
> [    2.014284] usb 4-1: Product: USB Keyboard
> [    2.018348] hidraw: raw HID events driver (C) Jiri Kosina
> [    2.042342] usbcore: registered new interface driver usbhid
> [    2.042763] usbhid: USB HID core driver
> [    2.044476] input: USB Keyboard as
> /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.0/0003:04D9:0022.0001/input/input5
> [    2.045444] hid-generic 0003:04D9:0022.0001: input,hidraw0: USB HID
> v1.10 Keyboard [USB Keyboard] on usb-0000:00:12.1-1/input0
> [    2.046435] input: USB Keyboard as
> /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.1/0003:04D9:0022.0002/input/input6
> [    2.047461] hid-generic 0003:04D9:0022.0002: input,hidraw1: USB HID
> v1.10 Device [USB Keyboard] on usb-0000:00:12.1-1/input1
> [    2.303673] ata8: SATA link down (SStatus 0 SControl 300)
> [    2.920111] Switched to clocksource tsc
> [    4.382933] floppy0: no floppy controllers found
> [    7.272503] EXT4-fs (sda2): mounted filesystem with ordered data mode.
> Opts: (null)
> [    7.364061] random: init urandom read with 70 bits of entropy available
> [    7.388873] init: plymouth-upstart-bridge main process (237) terminated
> with status 1
> [    7.389819] init: plymouth-upstart-bridge main process ended, respawning
> [    7.394387] init: plymouth-upstart-bridge main process (246) terminated
> with status 1
> [    7.395354] init: plymouth-upstart-bridge main process ended, respawning
> [    7.399374] init: plymouth-upstart-bridge main process (250) terminated
> with status 1
> [    7.400340] init: plymouth-upstart-bridge main process ended, respawning
> [    7.402987] init: plymouth-upstart-bridge main process (254) terminated
> with status 1
> [    7.403967] init: plymouth-upstart-bridge main process ended, respawning
> [    7.495806] Adding 2097148k swap on /dev/sda1.  Priority:-1 extents:1
> across:2097148k SSFS
> [    7.499478] EXT4-fs (sda2): re-mounted. Opts: errors=remount-ro
> [    7.607450] systemd-udevd[399]: starting version 204
> [    7.619836] EXT4-fs (sda3): mounted filesystem with ordered data mode.
> Opts: (null)
> [    7.629983] lp: driver loaded but no devices found
> [    7.637946] ppdev: user-space parallel port driver
> [    7.647449] wmi: Mapper loaded
> [    7.647894] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    7.655187] [drm] Initialized drm 1.1.0 20060810
> [    7.664060] ACPI Warning: SystemIO range
> 0x0000000000000b00-0x0000000000000b07 conflicts with OpRegion
> 0x0000000000000b00-0x0000000000000b0f (\SOR1) (20140424/utaddress-258)
> [    7.664067] ACPI: If an ACPI driver is available for this device, you
> should use it instead of the native driver
> [    7.672812] MCE: In-kernel MCE decoding enabled.
> [    7.674623] EDAC MC: Ver: 3.0.0
> [    7.675757] checking generic (fb000000 130000) vs hw (d0000000 10000000)
> [    7.675759] checking generic (fb000000 130000) vs hw (fa000000 2000000)
> [    7.675761] fb: switching to nouveaufb from VESA VGA
> [    7.675782] Console: switching to colour dummy device 80x25
> [    7.675981] AMD64 EDAC driver v3.4.0
> [    7.676002] EDAC amd64: DRAM ECC disabled.
> [    7.676008] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
> module will not load.
> [    7.676008]  Either enable ECC checking or force module loading by
> setting 'ecc_enable_override'.
> [    7.676008]  (Note that use of the override may cause unknown side
> effects.)
> [    7.676119] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x298280a2
> [    7.676122] nouveau  [  DEVICE][0000:01:00.0] Chipset: G98 (NV98)
> [    7.676123] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
> [    7.676213] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
> image...
> [    7.693108] AVX version of gcm_enc/dec engaged.
> [    7.712757] kvm: Nested Virtualization enabled
> [    7.712762] kvm: Nested Paging enabled
> [    7.733822] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
> [    7.733823] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
> [    7.733905] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> [    7.733908] nouveau  [   VBIOS][0000:01:00.0] version 70.18.36.00.00
> [    7.754325] nouveau 0000:01:00.0: irq 49 for MSI/MSI-X
> [    7.754335] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
> [    7.754358] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
> [    7.754360] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
> [    7.754361] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 960 tags
> [    7.764707] sound hdaudioC0D0: autoconfig: line_outs=1
> (0x14/0x0/0x0/0x0/0x0) type:line
> [    7.764710] sound hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    7.764712] sound hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
> [    7.764713] sound hdaudioC0D0:    mono: mono_out=0x0
> [    7.764714] sound hdaudioC0D0:    dig-out=0x1e/0x0
> [    7.764715] sound hdaudioC0D0:    inputs:
> [    7.764717] sound hdaudioC0D0:      Front Mic=0x19
> [    7.764718] sound hdaudioC0D0:      Rear Mic=0x18
> [    7.764719] sound hdaudioC0D0:      Line=0x1a
> [    7.777512] input: HDA ATI SB Rear Mic as
> /devices/pci0000:00/0000:00:14.2/sound/card0/input7
> [    7.779263] input: HDA ATI SB Line as
> /devices/pci0000:00/0000:00:14.2/sound/card0/input8
> [    7.779485] input: HDA ATI SB Line Out as
> /devices/pci0000:00/0000:00:14.2/sound/card0/input9
> [    7.784065] nouveau  [  PTHERM][0000:01:00.0] FAN control: none /
> external
> [    7.784077] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
> [    7.784079] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
> [    7.784087] nouveau  [     CLK][0000:01:00.0] 0f: core 550 MHz shader
> 1375 MHz memory 266 MHz
> [    7.784121] nouveau  [     CLK][0000:01:00.0] --: core 566 MHz shader
> 1400 MHz memory 265 MHz
> [    7.784167] nouveau E[   PDISP][0000:01:00.0] 02:0261: func 08 lookup
> failed, -2
> [    7.784558] [TTM] Zone  kernel: Available graphics memory: 4079904 kiB
> [    7.784560] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
> [    7.784561] [TTM] Initializing pool allocator
> [    7.784567] [TTM] Initializing DMA pool allocator
> [    7.784584] nouveau  [     DRM] VRAM: 1024 MiB
> [    7.784586] nouveau  [     DRM] GART: 1048576 MiB
> [    7.784590] nouveau  [     DRM] TMDS table version 2.0
> [    7.784593] nouveau  [     DRM] DCB version 4.0
> [    7.784596] nouveau  [     DRM] DCB outp 00: 02000300 00000028
> [    7.784599] nouveau  [     DRM] DCB outp 01: 01000302 00020030
> [    7.784601] nouveau  [     DRM] DCB outp 02: 04011310 00000028
> [    7.784603] nouveau  [     DRM] DCB outp 03: 02022322 00c20090
> [    7.784605] nouveau  [     DRM] DCB conn 00: 00001030
> [    7.784608] nouveau  [     DRM] DCB conn 01: 00000100
> [    7.784610] nouveau  [     DRM] DCB conn 02: 00002261
> [    7.790697] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    7.790699] [drm] Driver supports precise vblank timestamp query.
> [    7.799009] nouveau  [     DRM] MM: using M2MF for buffer copies
> [    7.811344] cfg80211: Calling CRDA to update world regulatory domain
> [    7.833323] cfg80211: World regulatory domain updated:
> [    7.833326] cfg80211:  DFS Master region: unset
> [    7.833327] cfg80211:   (start_freq - end_freq @ bandwidth),
> (max_antenna_gain, max_eirp), (dfs_cac_time)
> [    7.833330] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300
> mBi, 2000 mBm), (N/A)
> [    7.833331] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (300
> mBi, 2000 mBm), (N/A)
> [    7.833333] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300
> mBi, 2000 mBm), (N/A)
> [    7.833335] cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300
> mBi, 2000 mBm), (N/A)
> [    7.833336] cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300
> mBi, 2000 mBm), (N/A)
> [    7.860841] init: failsafe main process (660) killed by TERM signal
> [    7.869101] nouveau  [     DRM] allocated 1360x768 fb: 0x60000, bo
> ffff8800cadfe000
> [    7.869168] fbcon: nouveaufb (fb0) is primary device
> [    7.870010] nouveau E[ DEVINIT][0000:01:00.0] unable to compute
> acceptable pll values
> [    7.870012] nouveau E[ DEVINIT][0000:01:00.0] failed pll calculation
> [    7.925743] Bluetooth: Core ver 2.19
> [    7.925758] NET: Registered protocol family 31
> [    7.925759] Bluetooth: HCI device and connection manager initialized
> [    7.925765] Bluetooth: HCI socket layer initialized
> [    7.925767] Bluetooth: L2CAP socket layer initialized
> [    7.925780] Bluetooth: SCO socket layer initialized
> [    7.928636] Bluetooth: RFCOMM TTY layer initialized
> [    7.928640] Bluetooth: RFCOMM socket layer initialized
> [    7.928644] Bluetooth: RFCOMM ver 1.11
> [    7.934949] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    7.934949] Bluetooth: BNEP filters: protocol multicast
> [    7.934954] Bluetooth: BNEP socket layer initialized
> [    7.936155] usb 2-2: reset high-speed USB device number 2 using ehci-pci
> [    7.938438] init: cups main process (727) killed by HUP signal
> [    7.938443] init: cups main process ended, respawning
> [    8.070645] ieee80211 phy0: Selected rate control algorithm
> 'minstrel_ht'
> [    8.070835] zd1211rw 2-2:1.0: phy0
> [    8.070858] usbcore: registered new interface driver zd1211rw
> [    8.096090] Console: switching to colour frame buffer device 170x48
> [    8.096656] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
> [    8.096657] nouveau 0000:01:00.0: registered panic notifier
> [    8.108042] random: nonblocking pool is initialized
> [    8.115300] [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0
> on minor 0
> [    8.286280] r8169 0000:02:00.0 p7p1: link down
> [    8.286309] IPv6: ADDRCONF(NETDEV_UP): p7p1: link is not ready
> [    8.403879] r8169 0000:05:00.0 p10p1: link down
> [    8.403918] IPv6: ADDRCONF(NETDEV_UP): p10p1: link is not ready
> [    8.443017] zd1211rw 2-2:1.0: firmware version 4725
> [    8.462399] vboxdrv: module verification failed: signature and/or
>  required key missing - tainting kernel
> [    8.465366] vboxdrv: Found 8 processor cores.
> [    8.465801] vboxdrv: fAsync=0 offMin=0x529 offMax=0x3ee0
> [    8.465893] vboxdrv: TSC mode is 'synchronous', kernel timer mode is
> 'normal'.
> [    8.465894] vboxdrv: Successfully loaded version 4.3.20 (interface
> 0x001a0008).
> [    8.483055] zd1211rw 2-2:1.0: zd1211b chip 0ace:1215 v4810 high
> 00-02-72 AL2230_RF pa0 g--NS
> [    8.519323] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
> [    8.519353] cfg80211: Calling CRDA for country: DE
> [    8.521334] cfg80211: Regulatory domain changed to country: DE
> [    8.521336] cfg80211:  DFS Master region: unset
> [    8.521337] cfg80211:   (start_freq - end_freq @ bandwidth),
> (max_antenna_gain, max_eirp), (dfs_cac_time)
> [    8.521339] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A,
> 2000 mBm), (N/A)
> [    8.521340] cfg80211:   (5150000 KHz - 5250000 KHz @ 40000 KHz), (N/A,
> 2000 mBm), (N/A)
> [    8.521342] cfg80211:   (5250000 KHz - 5350000 KHz @ 40000 KHz), (N/A,
> 2000 mBm), (0 s)
> [    8.521343] cfg80211:   (5470000 KHz - 5725000 KHz @ 40000 KHz), (N/A,
> 2698 mBm), (0 s)
> [    8.521344] cfg80211:   (57240000 KHz - 65880000 KHz @ 2160000 KHz),
> (N/A, 4000 mBm), (N/A)
> [    8.671967] vboxpci: IOMMU not found (not registered)
> [    9.153486] init: plymouth-upstart-bridge main process ended, respawning
> [    9.407531] wlan0: authenticate with 5a:98:26:49:92:24
> [    9.433096] wlan0: send auth to 5a:98:26:49:92:24 (try 1/3)
> [    9.434594] wlan0: authenticated
> [    9.436876] wlan0: associate with 5a:98:26:49:92:24 (try 1/3)
> [    9.443353] wlan0: RX AssocResp from 5a:98:26:49:92:24 (capab=0x411
> status=0 aid=2)
> [    9.443853] wlan0: associated
> [    9.443881] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [   10.655128] floppy0: no floppy controllers found
>
>
> 2015-06-11 20:52 GMT-03:00 Andre Campos Rodovalho <
> andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>
>> Hi, the boot does not fail, I belive... I can turn on and off the
>> computer, I can access it throught SSH and even VNC. The computer is
>> functinal, but screen is blank/black. My monitor says something like
>> "invalid format" or "invalid input"...
>>
>> Tnx
>>
>> -----------------------------------------------------------------------------------------
>>
>> Jun 11 20:16:58 v-caps rsyslogd: [origin software="rsyslogd"
>> swVersion="7.4.4" x-pid="662" x-info="http://www.rsyslog.com"] start
>> Jun 11 20:16:58 v-caps rsyslogd: rsyslogd's groupid changed to 104
>> Jun 11 20:16:58 v-caps rsyslogd: rsyslogd's userid changed to 101
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Initializing cgroup subsys
>> cpuset
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Initializing cgroup subsys
>> cpu
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Initializing cgroup subsys
>> cpuacct
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Linux version
>> 3.16.0-38-generic (buildd@allspice) (gcc version 4.8.2 (Ubuntu
>> 4.8.2-19ubuntu1) ) #52~14.04.1-Ubuntu SMP Fri May 8 09:43:57 UTC 2015
>> (Ubuntu 3.16.0-38.52~14.04.1-generic 3.16.7-ckt10)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Command line:
>> BOOT_IMAGE=/boot/vmlinuz-3.16.0-38-generic root=/dev/sda2 ro
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] KERNEL supported cpus:
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   Intel GenuineIntel
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   AMD AuthenticAMD
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   Centaur CentaurHauls
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: BIOS-provided
>> physical RAM map:
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x0000000000000000-0x000000000009dbff] usable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x000000000009dc00-0x000000000009ffff] reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x00000000000e6000-0x00000000000fffff] reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x0000000000100000-0x00000000cff9ffff] usable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x00000000cffa0000-0x00000000cffaffff] ACPI data
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x00000000cffb0000-0x00000000cffdffff] ACPI NVS
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x00000000cffe0000-0x00000000cfffffff] reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x00000000ffe00000-0x00000000ffffffff] reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BIOS-e820: [mem
>> 0x0000000100000000-0x000000022effffff] usable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] NX (Execute Disable)
>> protection: active
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] SMBIOS 2.6 present.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] DMI: To Be Filled By O.E.M.
>> To Be Filled By O.E.M./980DE3/U3S3, BIOS P1.60 05/06/2014
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: update [mem
>> 0x00000000-0x00000fff] usable ==> reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: remove [mem
>> 0x000a0000-0x000fffff] usable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: No AGP bridge found
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: last_pfn = 0x22f000
>> max_arch_pfn = 0x400000000
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] MTRR default type:
>> uncachable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] MTRR fixed ranges enabled:
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   00000-9FFFF write-back
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   A0000-EFFFF uncachable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   F0000-FFFFF write-protect
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] MTRR variable ranges
>> enabled:
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   0 base 000000000000 mask
>> FFFF80000000 write-back
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   1 base 000080000000 mask
>> FFFFC0000000 write-back
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   2 base 0000C0000000 mask
>> FFFFF0000000 write-back
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   3 disabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   4 disabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   5 disabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   6 disabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   7 disabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] TOM2: 000000022f000000 aka
>> 8944M
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] x86 PAT enabled: cpu 0, old
>> 0x7040600070406, new 0x7010600070106
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: update [mem
>> 0xd0000000-0xffffffff] usable ==> reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: last_pfn = 0xcffa0
>> max_arch_pfn = 0x400000000
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] found SMP MP-table at [mem
>> 0x000ff780-0x000ff78f] mapped at [ffff8800000ff780]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Scanning 1 areas for low
>> memory corruption
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Base memory trampoline at
>> [ffff880000097000] 97000 size 24576
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Using GB pages for direct
>> mapping
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] init_memory_mapping: [mem
>> 0x00000000-0x000fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x00000000-0x000fffff] page 4k
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BRK [0x01fbd000,
>> 0x01fbdfff] PGTABLE
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BRK [0x01fbe000,
>> 0x01fbefff] PGTABLE
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BRK [0x01fbf000,
>> 0x01fbffff] PGTABLE
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] init_memory_mapping: [mem
>> 0x22ee00000-0x22effffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x22ee00000-0x22effffff] page 2M
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] BRK [0x01fc0000,
>> 0x01fc0fff] PGTABLE
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] init_memory_mapping: [mem
>> 0x22c000000-0x22edfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x22c000000-0x22edfffff] page 2M
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] init_memory_mapping: [mem
>> 0x200000000-0x22bffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x200000000-0x22bffffff] page 2M
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] init_memory_mapping: [mem
>> 0x00100000-0xcff9ffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x00100000-0x001fffff] page 4k
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x00200000-0x3fffffff] page 2M
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x40000000-0xbfffffff] page 1G
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0xc0000000-0xcfdfffff] page 2M
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0xcfe00000-0xcff9ffff] page 4k
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] init_memory_mapping: [mem
>> 0x100000000-0x1ffffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]  [mem
>> 0x100000000-0x1ffffffff] page 1G
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] RAMDISK: [mem
>> 0x35a96000-0x36d42fff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: Early table checksum
>> verification disabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: RSDP
>> 0x00000000000FB6C0 000014 (v00 ACPIAM)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: RSDT
>> 0x00000000CFFA0000 000040 (v01 050614 RSDT1213 20140506 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: FACP
>> 0x00000000CFFA0200 000084 (v01 A_M_I  OEMFACP  12000601 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI BIOS Warning (bug):
>> Optional FADT field Pm2ControlBlock has zero address or length:
>> 0x0000000000000000/0x1 (20140424/tbfadt-649)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: DSDT
>> 0x00000000CFFA0460 0088B0 (v01 AS636  AS636152 00000152 INTL 20051117)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: FACS
>> 0x00000000CFFB0000 000040
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: APIC
>> 0x00000000CFFA0390 00008C (v01 050614 APIC1213 20140506 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: MCFG
>> 0x00000000CFFA0420 00003C (v01 050614 OEMMCFG  20140506 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: OEMB
>> 0x00000000CFFB0040 000072 (v01 050614 OEMB1213 20140506 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: AAFT
>> 0x00000000CFFAA460 000027 (v01 050614 OEMAAFT  20140506 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: HPET
>> 0x00000000CFFAA490 000038 (v01 050614 OEMHPET  20140506 MSFT 00000097)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: SSDT
>> 0x00000000CFFAA4D0 001714 (v01 A M I  POWERNOW 00000001 AMD  00000001)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: Local APIC address
>> 0xfee00000
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] No NUMA configuration found
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Faking a node at [mem
>> 0x0000000000000000-0x000000022effffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Initmem setup node 0 [mem
>> 0x00000000-0x22effffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   NODE_DATA [mem
>> 0x22eff9000-0x22effdfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]
>>  [ffffea0000000000-ffffea0008bfffff] PMD ->
>> [ffff880226600000-ffff88022e5fffff] on node 0
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Zone ranges:
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA      [mem
>> 0x00001000-0x00ffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA32    [mem
>> 0x01000000-0xffffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   Normal   [mem
>> 0x100000000-0x22effffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Movable zone start for each
>> node
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Early memory node ranges
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   node   0: [mem
>> 0x00001000-0x0009cfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   node   0: [mem
>> 0x00100000-0xcff9ffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   node   0: [mem
>> 0x100000000-0x22effffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] On node 0 totalpages:
>> 2092860
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA zone: 64 pages used
>> for memmap
>> Jun 11 20:16:58 v-caps kernel
>>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
> ...

--001a1141b5fedae57805184d52a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hm, well you can see the messages about failure to set plls,=
 which is why you don&#39;t see anything. The only odd thing I see is that =
you&#39;re using vesa, which can definitely mess things up. Try not using t=
hat. Also try booting with nouveau.debug=3Ddebug drm.debug=3D0xe which migh=
t provide more relevant info.</p>
<div class=3D"gmail_quote">On Jun 12, 2015 8:34 AM, &quot;Andre Campos Rodo=
valho&quot; &lt;<a href=3D"mailto:andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">andre.rodovalh=
o@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">dmesg output:<div><br></div><div>------------------=
---------------------------------------------------------------------------=
------------</div><div><br></div><div><br></div><div class=3D"gmail_extra">=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Initializing cgroup sub=
sys cpuset</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Initial=
izing cgroup subsys cpu</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] Initializing cgroup subsys cpuacct</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] Linux version 3.16.0-38-generic (buildd@allspice) (g=
cc version 4.8.2 (Ubuntu 4.8.2-19ubuntu1) ) #52~14.04.1-Ubuntu SMP Fri May =
8 09:43:57 UTC 2015 (Ubuntu 3.16.0-38.52~14.04.1-generic 3.16.7-ckt10)</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Command line: BOOT_IMA=
GE=3D/boot/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.000000] KERNEL supported cpus:</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 Centaur Ce=
ntaurHauls</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820: B=
IOS-provided physical RAM map:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dbff] usable<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x=
000000000009dc00-0x000000000009ffff] reserved</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000000e6000-0x0000000000=
0fffff] reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] B=
IOS-e820: [mem 0x0000000000100000-0x00000000cff9ffff] usable</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000cffa00=
00-0x00000000cffaffff] ACPI data</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] BIOS-e820: [mem 0x00000000cffb0000-0x00000000cffdffff] ACPI=
 NVS</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [m=
em 0x00000000cffe0000-0x00000000cfffffff] reserved</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000ffe00000-0x00000=
000ffffffff] reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] BIOS-e820: [mem 0x0000000100000000-0x000000022effffff] usable</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] NX (Execute Disable) protec=
tion: active</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] SMBIO=
S 2.6 present.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] DMI=
: To Be Filled By O.E.M. To Be Filled By O.E.M./980DE3/U3S3, BIOS P1.60 05/=
06/2014</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820: upda=
te [mem 0x00000000-0x00000fff] usable =3D=3D&gt; reserved</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820: remove [mem 0x000a0000-0x00=
0fffff] usable</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] AGP=
: No AGP bridge found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] e820: last_pfn =3D 0x22f000 max_arch_pfn =3D 0x400000000</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] MTRR default type: uncachable</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] MTRR fixed ranges en=
abled:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 0000=
0-9FFFF write-back</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000]=
 =C2=A0 A0000-EFFFF uncachable</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] =C2=A0 F0000-FFFFF write-protect</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.000000] MTRR variable ranges enabled:</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 0 base 000000000000 mask F=
FFF80000000 write-back</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000=
000] =C2=A0 1 base 000080000000 mask FFFFC0000000 write-back</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 2 base 0000C0000000 mask =
FFFFF0000000 write-back</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0 3 disabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0 4 disabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0 5 disabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0 6 disabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0 7 disabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] TOM2: 000000022f000000 aka 8944M</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7=
010600070106</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820:=
 update [mem 0xd0000000-0xffffffff] usable =3D=3D&gt; reserved</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820: last_pfn =3D 0xcffa0 max=
_arch_pfn =3D 0x400000000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
000000] found SMP MP-table at [mem 0x000ff780-0x000ff78f] mapped at [ffff88=
00000ff780]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Scanni=
ng 1 areas for low memory corruption</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] Base memory trampoline at [ffff880000097000] 97000 size=
 24576</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Using GB pa=
ges for direct mapping</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000=
000] init_memory_mapping: [mem 0x00000000-0x000fffff]</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x00000000-0x000fffff] page =
4k</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BRK [0x01fbd000=
, 0x01fbdfff] PGTABLE</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] BRK [0x01fbe000, 0x01fbefff] PGTABLE</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] BRK [0x01fbf000, 0x01fbffff] PGTABLE</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x22ee0=
0000-0x22effffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
=C2=A0[mem 0x22ee00000-0x22effffff] page 2M</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.000000] BRK [0x01fc0000, 0x01fc0fff] PGTABLE</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x22=
c000000-0x22edfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] =C2=A0[mem 0x22c000000-0x22edfffff] page 2M</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x200000000-0x22bfff=
fff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x=
200000000-0x22bffffff] page 2M</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] init_memory_mapping: [mem 0x00100000-0xcff9ffff]</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x00100000-0x001ffff=
f] page 4k</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[=
mem 0x00200000-0x3fffffff] page 2M</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.000000] =C2=A0[mem 0x40000000-0xbfffffff] page 1G</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0xc0000000-0xcfdfffff]=
 page 2M</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[me=
m 0xcfe00000-0xcff9ffff] page 4k</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] init_memory_mapping: [mem 0x100000000-0x1ffffffff]</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x100000000-0x1=
ffffffff] page 1G</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
RAMDISK: [mem 0x35a96000-0x36d42fff]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] ACPI: Early table checksum verification disabled</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: RSDP 0x00000000000=
FB6C0 000014 (v00 ACPIAM)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
000000] ACPI: RSDT 0x00000000CFFA0000 000040 (v01 050614 RSDT1213 20140506 =
MSFT 00000097)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACP=
I: FACP 0x00000000CFFA0200 000084 (v01 A_M_I =C2=A0OEMFACP =C2=A012000601 M=
SFT 00000097)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI=
 BIOS Warning (bug): Optional FADT field Pm2ControlBlock has zero address o=
r length: 0x0000000000000000/0x1 (20140424/tbfadt-649)</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.000000] ACPI: DSDT 0x00000000CFFA0460 0088B0 (=
v01 AS636 =C2=A0AS636152 00000152 INTL 20051117)</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.000000] ACPI: FACS 0x00000000CFFB0000 000040</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: APIC 0x00000000CFFA=
0390 00008C (v01 050614 APIC1213 20140506 MSFT 00000097)</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: MCFG 0x00000000CFFA0420 00003C=
 (v01 050614 OEMMCFG =C2=A020140506 MSFT 00000097)</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] ACPI: OEMB 0x00000000CFFB0040 000072 (v01 =
050614 OEMB1213 20140506 MSFT 00000097)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] ACPI: AAFT 0x00000000CFFAA460 000027 (v01 050614 OEM=
AAFT =C2=A020140506 MSFT 00000097)</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.000000] ACPI: HPET 0x00000000CFFAA490 000038 (v01 050614 OEMHPET =
=C2=A020140506 MSFT 00000097)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] ACPI: SSDT 0x00000000CFFAA4D0 001714 (v01 A M I =C2=A0POWERNOW=
 00000001 AMD =C2=A000000001)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] ACPI: Local APIC address 0xfee00000</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.000000] No NUMA configuration found</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Faking a node at [mem 0x000000000=
0000000-0x000000022effffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.000000] Initmem setup node 0 [mem 0x00000000-0x22effffff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 NODE_DATA [mem 0x22eff9000=
-0x22effdfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=
=A0[ffffea0000000000-ffffea0008bfffff] PMD -&gt; [ffff880226600000-ffff8802=
2e5fffff] on node 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000=
] Zone ranges:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=
=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x00001000-0x00ffffff]</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x0100=
0000-0xffffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
=C2=A0 Normal =C2=A0 [mem 0x100000000-0x22effffff]</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] Movable zone start for each node</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Early memory node ranges</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0=
: [mem 0x00001000-0x0009cfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00100000-0xcff9ffff]</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x1=
00000000-0x22effffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] On node 0 totalpages: 2092860</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] =C2=A0 DMA zone: 64 pages used for memmap</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA zone: 21 pages reserve=
d</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA zone:=
 3996 pages, LIFO batch:0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
000000] =C2=A0 DMA32 zone: 13247 pages used for memmap</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 zone: 847776 pages, LIFO =
batch:31</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 No=
rmal zone: 19392 pages used for memmap</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] =C2=A0 Normal zone: 1241088 pages, LIFO batch:31</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: PM-Timer IO Por=
t: 0x808</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: Loc=
al APIC address 0xfee00000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x10] enabled)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x02] lapic_=
id[0x11] enabled)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
ACPI: LAPIC (acpi_id[0x03] lapic_id[0x12] enabled)</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x13] =
enabled)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAP=
IC (acpi_id[0x05] lapic_id[0x14] enabled)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x15] enabled)<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_=
id[0x07] lapic_id[0x16] enabled)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x17] enabled)</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: IOAPIC (id[0x18] add=
ress[0xfec00000] gsi_base[0])</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] IOAPIC[0]: apic_id 24, version 33, address 0xfec00000, GSI 0-2=
3</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: INT_SRC_OV=
R (bus 0 bus_irq 0 global_irq 2 dfl dfl)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low =
level)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: IRQ0 =
used by override.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
ACPI: IRQ2 used by override.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] ACPI: IRQ9 used by override.</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.000000] Using ACPI (MADT) for SMP configuration information=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: HPET id: 0x=
8300 base: 0xfed00000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] smpboot: Allowing 8 CPUs, 0 hotplug CPUs</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.000000] nr_irqs_gsi: 40</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0x0009d000-0x00=
09dfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Regist=
ered nosave memory: [mem 0x0009e000-0x0009ffff]</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0x000a0000=
-0x000e5fff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: R=
egistered nosave memory: [mem 0x000e6000-0x000fffff]</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0xcff=
a0000-0xcffaffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
PM: Registered nosave memory: [mem 0xcffb0000-0xcffdffff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [me=
m 0xcffe0000-0xcfffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0=
00000] PM: Registered nosave memory: [mem 0xd0000000-0xffdfffff]</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory=
: [mem 0xffe00000-0xffffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] e820: [mem 0xd0000000-0xffdfffff] available for PCI devices</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Booting paravirtuali=
zed kernel on bare hardware</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.000000] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8 nr_nod=
e_ids:1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PERCPU: Em=
bedded 27 pages/cpu @ffff88022ec00000 s81408 r8192 d20992 u262144</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] pcpu-alloc: s81408 r8192 d2=
0992 u262144 alloc=3D1*2097152</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=C2=A0</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] Built 1 zonelists in Zone order, mobility =
grouping on.=C2=A0 Total pages: 2060136</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] Policy zone: Normal</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-3.=
16.0-38-generic root=3D/dev/sda2 ro</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] xsave: enabled xstat=
e_bv 0x7, cntxt size 0x340</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.000000] AGP: Checking aperture...</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.000000] AGP: No AGP bridge found</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.000000] AGP: Node 0: aperture [bus addr 0x00000000-0x01ffff=
ff] (32MB)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] AGP: Yo=
ur BIOS doesn&#39;t leave a aperture memory hole</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.000000] AGP: Please enable the IOMMU option in the B=
IOS setup</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] AGP: Thi=
s costs you 64MB of RAM</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] AGP: Mapping aperture over RAM [mem 0xc4000000-0xc7ffffff] (65536KB)<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nos=
ave memory: [mem 0xc4000000-0xc7ffffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] Memory: 8072292K/8371440K available (7626K kernel co=
de, 1131K rwdata, 3596K rodata, 1352K init, 1300K bss, 299148K reserved)</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, =
Order=3D0-3, MinObjects=3D0, CPUs=3D8, Nodes=3D1</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.000000] Hierarchical RCU implementation.</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=3D"white-space:pr=
e-wrap">	</span>RCU dyntick-idle grace-period acceleration is enabled.</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=3D"white-s=
pace:pre-wrap">	</span>RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_id=
s=3D8.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=
=3D"white-space:pre-wrap">	</span>Offload RCU callbacks from all CPUs</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=3D"white-sp=
ace:pre-wrap">	</span>Offload RCU callbacks from CPUs: 0-7.</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] RCU: Adjusting geometry for rcu_f=
anout_leaf=3D16, nr_cpu_ids=3D8</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] NR_IRQS:16640 nr_irqs:744 16</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.000000] spurious 8259A interrupt: IRQ7.</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Console: colour dummy device 80x2=
5</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] console [tty0] e=
nabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] allocated 3=
3554432 bytes of page_cgroup</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] please try &#39;cgroup_disable=3Dmemory&#39; option if you don=
&#39;t want memory cgroups</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.000000] hpet clockevent registered</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] tsc: Fast TSC calibration using PIT</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.000000] tsc: Detected 4680.606 MHz processor<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000020] Calibrating delay =
loop (skipped), value calculated using timer frequency.. 9361.21 BogoMIPS (=
lpj=3D18722424)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000024] pi=
d_max: default: 32768 minimum: 301</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.000031] ACPI: Core revision 20140424</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.002757] ACPI: All ACPI Tables successfully acquired</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.011663] Security Framework in=
itialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.011684] AppArmor=
: AppArmor initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.011=
686] Yama: becoming mindful.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.012143] Dentry cache hash table entries: 1048576 (order: 11, 8388608 b=
ytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.014204] Inode-cache =
hash table entries: 524288 (order: 10, 4194304 bytes)</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.015161] Mount-cache hash table entries: 16384 (=
order: 5, 131072 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.01=
5170] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015394] Initializing cgroup=
 subsys memory</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015413] Ini=
tializing cgroup subsys devices</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.015419] Initializing cgroup subsys freezer</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.015422] Initializing cgroup subsys net_cls</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.015426] Initializing cgroup subsy=
s blkio</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015430] Initializi=
ng cgroup subsys perf_event</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.015432] Initializing cgroup subsys net_prio</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.015439] Initializing cgroup subsys hugetlb</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.015456] tseg: 0000000000</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.015460] CPU: Physical Processor ID: 0</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015462] CPU: Processor Core=
 ID: 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015464] mce: CPU su=
pports 7 MCE banks</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015470]=
 LVT offset 1 assigned for vector 0xf9</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.015475] Last level iTLB entries: 4KB 512, 2MB 1024, 4MB 512<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015475] Last level dTLB en=
tries: 4KB 1024, 2MB 1024, 4MB 512, 1GB 0</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.015475] tlb_flushall_shift: 6</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.015553] Freeing SMP alternatives memory: 32K (ffffffff8=
1e6e000 - ffffffff81e76000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.016170] ftrace: allocating 29244 entries in 115 pages</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.023710] ..TIMER: vector=3D0x30 apic1=3D0 pin1=
=3D2 apic2=3D-1 pin2=3D-1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
063438] smpboot: CPU0: AMD FX(tm)-8350 Eight-Core Processor (fam: 15, model=
: 02, stepping: 00)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167980=
] Performance Events: Fam15h core perfctr, AMD PMU driver.</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.167985] ... version: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.167987] ... bit width: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A048</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167988] ... g=
eneric registers: =C2=A0 =C2=A0 =C2=A06</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.167990] ... value mask: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0000ffffffffffff</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.16=
7992] ... max period: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 00007ffffff=
fffff</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167993] ... fixed-pu=
rpose events: =C2=A0 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167=
995] ... event mask: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 000000000000=
003f</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.169378] NMI watchdog:=
 enabled on all CPUs, permanently consumes one hw-PMU counter.</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.169445] x86: Booting SMP configuration=
:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.169447] .... node =C2=A0=
#0, CPUs: =C2=A0 =C2=A0 =C2=A0#1 #2 #3 #4 #5 #6 #7</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.261441] x86: Booted up 1 node, 8 CPUs</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.261446] smpboot: Total of 8 processors=
 activated (74889.69 BogoMIPS)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.269594] devtmpfs: initialized</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.272590] evm: security.selinux</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.272592] evm: security.SMACK64</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.272594] evm: security.SMACK64EXEC</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.272596] evm: security.SMACK64TRANSMUTE</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.272597] evm: security.SMACK64MMAP</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272599] evm: security.ima</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272600] evm: security.capab=
ility</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272651] PM: Register=
ing ACPI NVS region [mem 0xcffb0000-0xcffdffff] (196608 bytes)</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.273377] pinctrl core: initialized pinc=
trl subsystem</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273439] regu=
lator-dummy: no parameters</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.273472] RTC time: 23:16:50, date: 06/11/15</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.273514] NET: Registered protocol family 16</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.273639] cpuidle: using governor ladder</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273642] cpuidle: using gove=
rnor menu</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273705] ACPI: bu=
s type PCI registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2737=
08] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.273767] PCI: MMCONFIG for domain 0000 [=
bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.273771] PCI: not using MMCONFIG</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.273773] PCI: Using configuration ty=
pe 1 for base access</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.27377=
5] PCI: Using configuration type 1 for extended access</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.274069] mtrr: your CPUs had inconsistent varia=
ble MTRR settings</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.274071] =
mtrr: probably your BIOS does not setup all CPUs.</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.274073] mtrr: corrected configuration.</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.276493] ACPI: Added _OSI(Module Device=
)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.276496] ACPI: Added _OSI=
(Processor Device)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.276498]=
 ACPI: Added _OSI(3.0 _SCP Extensions)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.276500] ACPI: Added _OSI(Processor Aggregator Device)</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.278445] ACPI: Executed 3 blocks =
of module-level executable AML code</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.281893] ACPI: Interpreter enabled</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.281902] ACPI Exception: AE_NOT_FOUND, While evaluating =
Sleep State [\_S2_] (20140424/hwxface-580)</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.281918] ACPI: (supports S0 S1 S3 S4 S5)</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.281920] ACPI: Using IOAPIC for interrupt rou=
ting</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.281975] PCI: MMCONFIG=
 for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe000000=
0)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.282810] PCI: MMCONFIG a=
t [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.283069] PCI: Using host bridge w=
indows from ACPI; if necessary, use &quot;pci=3Dnocrs&quot; and report a bu=
g</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288165] ACPI: PCI Root B=
ridge [PCI0] (domain 0000 [bus 00-ff])</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.288171] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig A=
SPM ClockPM Segments MSI]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
288365] acpi PNP0A03:00: _OSC: platform does not support [PCIeHotplug PME]<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288550] acpi PNP0A03:00: _=
OSC: OS now controls [AER PCIeCapability]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.288835] PCI host bridge to bus 0000:00</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.288838] pci_bus 0000:00: root bus resource [bu=
s 00-ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288840] pci_bus 0=
000:00: root bus resource [io =C2=A00x0000-0x0cf7]</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.288843] pci_bus 0000:00: root bus resource [io =C2=
=A00x0d00-0xffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288846] =
pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.288848] pci_bus 0000:00: root bus reso=
urce [mem 0x000d0000-0x000dffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.288851] pci_bus 0000:00: root bus resource [mem 0xd0000000-0xdfffff=
ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288853] pci_bus 0000:0=
0: root bus resource [mem 0xf0000000-0xfebfffff]</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.288863] pci 0000:00:00.0: [1022:9601] type 00 class =
0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288955] pci 0000:=
00:02.0: [1022:9603] type 01 class 0x060400</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.288988] pci 0000:00:02.0: PME# supported from D0 D3hot D3=
cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289023] pci 0000:00:0=
2.0: System wakeup disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.289059] pci 0000:00:06.0: [1022:9606] type 01 class 0x060400</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289090] pci 0000:00:06.0: PM=
E# supported from D0 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289127] pci 0000:00:06.0: System wakeup disabled by ACPI</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.289159] pci 0000:00:07.0: [1022:9607=
] type 01 class 0x060400</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2=
89190] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.289224] pci 0000:00:07.0: System wakeup =
disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289257] p=
ci 0000:00:09.0: [1022:9608] type 01 class 0x060400</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.289288] pci 0000:00:09.0: PME# supported from D0 =
D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289322] pci 0=
000:00:09.0: System wakeup disabled by ACPI</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.289353] pci 0000:00:0a.0: [1022:9609] type 01 class 0x060=
400</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289383] pci 0000:00:0a=
.0: PME# supported from D0 D3hot D3cold</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.289417] pci 0000:00:0a.0: System wakeup disabled by ACPI</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289463] pci 0000:00:11.0: [10=
02:4391] type 00 class 0x010601</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289482] pci 0000:00:11.0: reg 0x10: [io =C2=A00x9000-0x9007]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289491] pci 0000:00:11.0: reg 0x=
14: [io =C2=A00x8000-0x8003]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.289499] pci 0000:00:11.0: reg 0x18: [io =C2=A00x7000-0x7007]</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.289508] pci 0000:00:11.0: reg 0x1c:=
 [io =C2=A00x6000-0x6003]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
289516] pci 0000:00:11.0: reg 0x20: [io =C2=A00x5000-0x500f]</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.289525] pci 0000:00:11.0: reg 0x24: [mem=
 0xf9fffc00-0xf9ffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.28=
9622] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.289635] pci 0000:00:12.0: reg 0x10: [mem =
0xf9ffe000-0xf9ffefff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289=
715] pci 0000:00:12.0: System wakeup disabled by ACPI</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.289748] pci 0000:00:12.1: [1002:4398] type 00 c=
lass 0x0c0310</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289760] pci =
0000:00:12.1: reg 0x10: [mem 0xf9ffd000-0xf9ffdfff]</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.289841] pci 0000:00:12.1: System wakeup disabled =
by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289879] pci 0000:0=
0:12.2: [1002:4396] type 00 class 0x0c0320</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.289896] pci 0000:00:12.2: reg 0x10: [mem 0xf9fff800-0xf9ff=
f8ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289973] pci 0000:00:=
12.2: supports D1 D2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.28997=
4] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.290012] pci 0000:00:12.2: System wakeup disab=
led by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290050] pci 00=
00:00:13.0: [1002:4397] type 00 class 0x0c0310</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.290062] pci 0000:00:13.0: reg 0x10: [mem 0xf9ffc000-0x=
f9ffcfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290143] pci 0000=
:00:13.0: System wakeup disabled by ACPI</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.290175] pci 0000:00:13.1: [1002:4398] type 00 class 0x0c0310=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290187] pci 0000:00:13.1:=
 reg 0x10: [mem 0xf9ffb000-0xf9ffbfff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.290269] pci 0000:00:13.1: System wakeup disabled by ACPI</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290306] pci 0000:00:13.2: [10=
02:4396] type 00 class 0x0c0320</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.290324] pci 0000:00:13.2: reg 0x10: [mem 0xf9fff400-0xf9fff4ff]</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290400] pci 0000:00:13.2: sup=
ports D1 D2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290401] pci 00=
00:00:13.2: PME# supported from D0 D1 D2 D3hot</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.290440] pci 0000:00:13.2: System wakeup disabled by AC=
PI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290481] pci 0000:00:14.=
0: [1002:4385] type 00 class 0x0c0500</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.290619] pci 0000:00:14.1: [1002:439c] type 00 class 0x01018a</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290634] pci 0000:00:14.1: re=
g 0x10: [io =C2=A00x0000-0x0007]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.290642] pci 0000:00:14.1: reg 0x14: [io =C2=A00x0000-0x0003]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290650] pci 0000:00:14.1: reg 0x=
18: [io =C2=A00x0000-0x0007]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.290658] pci 0000:00:14.1: reg 0x1c: [io =C2=A00x0000-0x0003]</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.290667] pci 0000:00:14.1: reg 0x20:=
 [io =C2=A00xff00-0xff0f]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
290685] pci 0000:00:14.1: legacy IDE quirk: reg 0x10: [io =C2=A00x01f0-0x01=
f7]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290688] pci 0000:00:14=
.1: legacy IDE quirk: reg 0x14: [io =C2=A00x03f6]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.290690] pci 0000:00:14.1: legacy IDE quirk: reg 0x1=
8: [io =C2=A00x0170-0x0177]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.290692] pci 0000:00:14.1: legacy IDE quirk: reg 0x1c: [io =C2=A00x0376]</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290775] pci 0000:00:14.2: [=
1002:4383] type 00 class 0x040300</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.290795] pci 0000:00:14.2: reg 0x10: [mem 0xf9ff4000-0xf9ff7fff 64bi=
t]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290856] pci 0000:00:14.=
2: PME# supported from D0 D3hot D3cold</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.290891] pci 0000:00:14.2: System wakeup disabled by ACPI</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290924] pci 0000:00:14.3: [10=
02:439d] type 00 class 0x060100</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.291040] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291100] pci 0000:00:14.4: System=
 wakeup disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2=
91132] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.291144] pci 0000:00:14.5: reg 0x10: [mem =
0xf9ffa000-0xf9ffafff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291=
226] pci 0000:00:14.5: System wakeup disabled by ACPI</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.291261] pci 0000:00:18.0: [1022:1600] type 00 c=
lass 0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291323] pci =
0000:00:18.1: [1022:1601] type 00 class 0x060000</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.291378] pci 0000:00:18.2: [1022:1602] type 00 class =
0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291435] pci 0000:=
00:18.3: [1022:1603] type 00 class 0x060000</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.291495] pci 0000:00:18.4: [1022:1604] type 00 class 0x060=
000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291550] pci 0000:00:18=
.5: [1022:1605] type 00 class 0x060000</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.291651] pci 0000:01:00.0: [10de:0a65] type 00 class 0x030000=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291661] pci 0000:01:00.0:=
 reg 0x10: [mem 0xfd000000-0xfdffffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.291671] pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffff=
ff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291680] pci=
 0000:01:00.0: reg 0x1c: [mem 0xfa000000-0xfbffffff 64bit]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.291686] pci 0000:01:00.0: reg 0x24: [io =
=C2=A00xa800-0xa87f]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.29169=
2] pci 0000:01:00.0: reg 0x30: [mem 0xfe8e0000-0xfe8fffff pref]</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.296100] pci 0000:00:02.0: PCI bridge =
to [bus 01]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.296105] pci 00=
00:00:02.0: =C2=A0 bridge window [io =C2=A00xa000-0xafff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.296107] pci 0000:00:02.0: =C2=A0 bridge w=
indow [mem 0xfa000000-0xfe8fffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.296109] pci 0000:00:02.0: =C2=A0 bridge window [mem 0xd0000000-0xdf=
ffffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.296156]=
 pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.296170] pci 0000:02:00.0: reg 0x10: [io =C2=A00=
xb800-0xb8ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.296189] pci =
0000:02:00.0: reg 0x18: [mem 0xfe9ff000-0xfe9fffff 64bit]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.296201] pci 0000:02:00.0: reg 0x20: [mem =
0xf8efc000-0xf8efffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.296263] pci 0000:02:00.0: supports D1 D2</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.296264] pci 0000:02:00.0: PME# supported from D0 D1 =
D2 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304108] pc=
i 0000:00:06.0: PCI bridge to [bus 02]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.304112] pci 0000:00:06.0: =C2=A0 bridge window [io =C2=A00xb=
000-0xbfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304114] pci 00=
00:00:06.0: =C2=A0 bridge window [mem 0xfe900000-0xfe9fffff]</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.304117] pci 0000:00:06.0: =C2=A0 bridge =
window [mem 0xf8e00000-0xf8efffff 64bit pref]</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.304162] pci 0000:03:00.0: [1b21:0612] type 00 class 0x0=
10601</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304174] pci 0000:03:=
00.0: reg 0x10: [io =C2=A00xd800-0xd807]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.304181] pci 0000:03:00.0: reg 0x14: [io =C2=A00xd400-0xd403]=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304188] pci 0000:03:00.0:=
 reg 0x18: [io =C2=A00xd000-0xd007]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.304195] pci 0000:03:00.0: reg 0x1c: [io =C2=A00xc800-0xc803]</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304202] pci 0000:03:00.0: re=
g 0x20: [io =C2=A00xc400-0xc41f]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.304209] pci 0000:03:00.0: reg 0x24: [mem 0xfeaffc00-0xfeaffdff]</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.312113] pci 0000:00:07.0: PCI=
 bridge to [bus 03]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.312118=
] pci 0000:00:07.0: =C2=A0 bridge window [io =C2=A00xc000-0xdfff]</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.312119] pci 0000:00:07.0: =C2=A0 br=
idge window [mem 0xfea00000-0xfeafffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.312166] pci 0000:04:00.0: [1b6f:7052] type 00 class 0x0c0330=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.312184] pci 0000:04:00.0:=
 reg 0x10: [mem 0xfebf8000-0xfebfffff 64bit]</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.312263] pci 0000:04:00.0: supports D1 D2</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.312265] pci 0000:04:00.0: PME# supported =
from D0 D1 D2 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.320122] pci 0000:00:09.0: PCI bridge to [bus 04]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.320128] pci 0000:00:09.0: =C2=A0 bridge window [mem=
 0xfeb00000-0xfebfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.32=
0173] pci 0000:05:00.0: [10ec:8168] type 00 class 0x020000</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.320187] pci 0000:05:00.0: reg 0x10: [io =
=C2=A00xe800-0xe8ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.32020=
6] pci 0000:05:00.0: reg 0x18: [mem 0xf8fff000-0xf8ffffff 64bit pref]</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.320218] pci 0000:05:00.0: reg 0=
x20: [mem 0xf8ff8000-0xf8ffbfff 64bit pref]</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.320279] pci 0000:05:00.0: supports D1 D2</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.320280] pci 0000:05:00.0: PME# supported =
from D0 D1 D2 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.328130] pci 0000:00:0a.0: PCI bridge to [bus 05]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.328134] pci 0000:00:0a.0: =C2=A0 bridge window [io =
=C2=A00xe000-0xefff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.32813=
8] pci 0000:00:0a.0: =C2=A0 bridge window [mem 0xf8f00000-0xf8ffffff 64bit =
pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.328209] pci 0000:00:=
14.4: PCI bridge to [bus 06] (subtractive decode)</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.328219] pci 0000:00:14.4: =C2=A0 bridge window [io =
=C2=A00x0000-0x0cf7] (subtractive decode)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.328220] pci 0000:00:14.4: =C2=A0 bridge window [io =C2=A00x=
0d00-0xffff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.328221] pci 0000:00:14.4: =C2=A0 bridge window [mem 0x000a0000-0x00=
0bffff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.328223] pci 0000:00:14.4: =C2=A0 bridge window [mem 0x000d0000-0x000df=
fff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
328224] pci 0000:00:14.4: =C2=A0 bridge window [mem 0xd0000000-0xdfffffff] =
(subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.32822=
5] pci 0000:00:14.4: =C2=A0 bridge window [mem 0xf0000000-0xfebfffff] (subt=
ractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.328246] pc=
i_bus 0000:00: on NUMA node 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.328858] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 7 10 11 12 14 15) *0, =
disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.328900] ACPI: PC=
I Interrupt Link [LNKB] (IRQs 4 7 10 11 12 14 15) *0, disabled.</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.328942] ACPI: PCI Interrupt Link [LNK=
C] (IRQs 10 12 14 15) *0, disabled.</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.328981] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 7 10 11 12 14 1=
5) *0, disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329021] A=
CPI: PCI Interrupt Link [LNKE] (IRQs 4 10 11 12 14 15) *0, disabled.</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329061] ACPI: PCI Interrupt Link=
 [LNKF] (IRQs 4 10 11 12 14 15) *0, disabled.</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.329101] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 10 11 1=
2 14 15) *0, disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329=
143] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 7 10 11 12 14 15) *0, disabled=
.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329200] ACPI: Enabled 1 =
GPEs in block 00 to 1F</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329=
282] vgaarb: setting as boot device: PCI:0000:01:00.0</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.329285] vgaarb: device added: PCI:0000:01:00.0,=
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.329288] vgaarb: loaded</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.329290] vgaarb: bridge control possible 0000:01:00.0</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.329498] SCSI subsystem initialize=
d</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329545] libata version 3=
.00 loaded.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329567] ACPI: =
bus type USB registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.32=
9583] usbcore: registered new interface driver usbfs</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.329592] usbcore: registered new interface driver=
 hub</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329612] usbcore: regi=
stered new device driver usb</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.329737] PCI: Using ACPI for IRQ routing</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.337703] PCI: pci_cache_line_size set to 64 bytes</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.337758] e820: reserve RAM buffer =
[mem 0x0009dc00-0x0009ffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.337759] e820: reserve RAM buffer [mem 0xcffa0000-0xcfffffff]</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.337760] e820: reserve RAM buffer [mem =
0x22f000000-0x22fffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3=
37848] NetLabel: Initializing</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.337849] NetLabel: =C2=A0domain hash size =3D 128</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.337851] NetLabel: =C2=A0protocols =3D UNLABELED=
 CIPSOv4</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.337861] NetLabel:=
 =C2=A0unlabeled traffic allowed by default</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.337907] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.337912] hpet0: 4 comparators, 32=
-bit 14.318180 MHz counter</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.339983] Switched to clocksource hpet</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.345803] AppArmor: AppArmor Filesystem Enabled</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.345823] pnp: PnP ACPI init</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.345835] ACPI: bus type PNP registered</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.345949] system 00:00: Plug a=
nd Play ACPI device, IDs PNP0c02 (active)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.345997] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (=
active)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346391] system 00:=
02: [mem 0xfec00000-0xfec00fff] could not be reserved</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.346394] system 00:02: [mem 0xfee00000-0xfee00ff=
f] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.34639=
7] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.346596] system 00:03: [io =C2=A00x04=
d0-0x04d1] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.346599] system 00:03: [io =C2=A00x040b] has been reserved</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.346602] system 00:03: [io =C2=A00x04d6=
] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346605=
] system 00:03: [io =C2=A00x0c00-0x0c01] has been reserved</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.346607] system 00:03: [io =C2=A00x0c14] h=
as been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346610] s=
ystem 00:03: [io =C2=A00x0c50-0x0c51] has been reserved</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.346613] system 00:03: [io =C2=A00x0c52] has b=
een reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346615] syste=
m 00:03: [io =C2=A00x0c6c] has been reserved</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.346618] system 00:03: [io =C2=A00x0c6f] has been reserve=
d</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346620] system 00:03: [i=
o =C2=A00x0cd0-0x0cd1] has been reserved</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.346623] system 00:03: [io =C2=A00x0cd2-0x0cd3] has been rese=
rved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346626] system 00:03:=
 [io =C2=A00x0cd4-0x0cd5] has been reserved</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.346628] system 00:03: [io =C2=A00x0cd6-0x0cd7] has been r=
eserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346631] system 00:=
03: [io =C2=A00x0cd8-0x0cdf] has been reserved</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.346634] system 00:03: [io =C2=A00x0800-0x089f] could n=
ot be reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346636] sys=
tem 00:03: [io =C2=A00x0b00-0x0b0f] has been reserved</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.346639] system 00:03: [io =C2=A00x0b20-0x0b3f] =
has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346642] =
system 00:03: [io =C2=A00x0900-0x090f] has been reserved</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.346644] system 00:03: [io =C2=A00x0910-0x091=
f] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.34664=
7] system 00:03: [io =C2=A00xfe00-0xfefe] has been reserved</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.346650] system 00:03: [mem 0xffb80000-0xf=
fbfffff] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.346653] system 00:03: [mem 0xfec10000-0xfec1001f] has been reserved</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346656] system 00:03: Plug and P=
lay ACPI device, IDs PNP0c02 (active)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.346855] pnp 00:04: [dma 0 disabled]</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A00.346903] pnp 00:04: Plug and Play ACPI device, IDs PNP=
0501 (active)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346983] syst=
em 00:05: [io =C2=A00x0290-0x029f] has been reserved</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.346986] system 00:05: Plug and Play ACPI device,=
 IDs PNP0c02 (active)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3470=
38] system 00:06: [mem 0xe0000000-0xefffffff] has been reserved</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.347041] system 00:06: Plug and Play A=
CPI device, IDs PNP0c02 (active)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.347225] system 00:07: [mem 0x00000000-0x0009ffff] could not be rese=
rved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.347228] system 00:07:=
 [mem 0x000e0000-0x000fffff] could not be reserved</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.347231] system 00:07: [mem 0x00100000-0xcfffffff] =
could not be reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3472=
34] system 00:07: [mem 0xfec00000-0xffffffff] could not be reserved</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.347237] system 00:07: Plug and Pl=
ay ACPI device, IDs PNP0c01 (active)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.347320] pnp: PnP ACPI: found 8 devices</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.347322] ACPI: bus type PNP unregistered</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.353807] pci 0000:00:02.0: PCI bridge=
 to [bus 01]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353810] pci 0=
000:00:02.0: =C2=A0 bridge window [io =C2=A00xa000-0xafff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.353814] pci 0000:00:02.0: =C2=A0 bridge w=
indow [mem 0xfa000000-0xfe8fffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.353817] pci 0000:00:02.0: =C2=A0 bridge window [mem 0xd0000000-0xdf=
ffffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353822]=
 pci 0000:00:06.0: PCI bridge to [bus 02]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.353824] pci 0000:00:06.0: =C2=A0 bridge window [io =C2=A00x=
b000-0xbfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353828] pci 0=
000:00:06.0: =C2=A0 bridge window [mem 0xfe900000-0xfe9fffff]</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.353831] pci 0000:00:06.0: =C2=A0 bridge=
 window [mem 0xf8e00000-0xf8efffff 64bit pref]</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.353835] pci 0000:00:07.0: PCI bridge to [bus 03]</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353838] pci 0000:00:07.0: =C2=
=A0 bridge window [io =C2=A00xc000-0xdfff]</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.353841] pci 0000:00:07.0: =C2=A0 bridge window [mem 0xfea0=
0000-0xfeafffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353846] p=
ci 0000:00:09.0: PCI bridge to [bus 04]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.353849] pci 0000:00:09.0: =C2=A0 bridge window [mem 0xfeb000=
00-0xfebfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353853] pci=
 0000:00:0a.0: PCI bridge to [bus 05]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.353856] pci 0000:00:0a.0: =C2=A0 bridge window [io =C2=A00xe000=
-0xefff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353860] pci 0000:=
00:0a.0: =C2=A0 bridge window [mem 0xf8f00000-0xf8ffffff 64bit pref]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353864] pci 0000:00:14.4: PCI br=
idge to [bus 06]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353876] p=
ci_bus 0000:00: resource 4 [io =C2=A00x0000-0x0cf7]</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.353877] pci_bus 0000:00: resource 5 [io =C2=A00x0=
d00-0xffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353878] pci_bu=
s 0000:00: resource 6 [mem 0x000a0000-0x000bffff]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.353880] pci_bus 0000:00: resource 7 [mem 0x000d0000=
-0x000dffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353881] pci_b=
us 0000:00: resource 8 [mem 0xd0000000-0xdfffffff]</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.353882] pci_bus 0000:00: resource 9 [mem 0xf000000=
0-0xfebfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353883] pci_=
bus 0000:01: resource 0 [io =C2=A00xa000-0xafff]</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.353885] pci_bus 0000:01: resource 1 [mem 0xfa000000-=
0xfe8fffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353886] pci_bu=
s 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.353887] pci_bus 0000:02: resource 0 [io =
=C2=A00xb000-0xbfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.35388=
8] pci_bus 0000:02: resource 1 [mem 0xfe900000-0xfe9fffff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.353889] pci_bus 0000:02: resource 2 [mem =
0xf8e00000-0xf8efffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.353891] pci_bus 0000:03: resource 0 [io =C2=A00xc000-0xdfff]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353892] pci_bus 0000:03: resourc=
e 1 [mem 0xfea00000-0xfeafffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.353893] pci_bus 0000:04: resource 1 [mem 0xfeb00000-0xfebfffff]</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353894] pci_bus 0000:05: reso=
urce 0 [io =C2=A00xe000-0xefff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.353896] pci_bus 0000:05: resource 2 [mem 0xf8f00000-0xf8ffffff 64bi=
t pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353897] pci_bus 00=
00:06: resource 4 [io =C2=A00x0000-0x0cf7]</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.353898] pci_bus 0000:06: resource 5 [io =C2=A00x0d00-0xfff=
f]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353899] pci_bus 0000:06=
: resource 6 [mem 0x000a0000-0x000bffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.353900] pci_bus 0000:06: resource 7 [mem 0x000d0000-0x000dff=
ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353902] pci_bus 0000:0=
6: resource 8 [mem 0xd0000000-0xdfffffff]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.353903] pci_bus 0000:06: resource 9 [mem 0xf0000000-0xfebff=
fff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353923] NET: Register=
ed protocol family 2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.35411=
0] TCP established hash table entries: 65536 (order: 7, 524288 bytes)</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.354288] TCP bind hash table ent=
ries: 65536 (order: 8, 1048576 bytes)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.354512] TCP: Hash tables configured (established 65536 bind 655=
36)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.354544] TCP: reno regi=
stered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.354554] UDP hash ta=
ble entries: 4096 (order: 5, 131072 bytes)</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.354595] UDP-Lite hash table entries: 4096 (order: 5, 13107=
2 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.354661] NET: Regi=
stered protocol family 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.8=
00566] pci 0000:01:00.0: Video device with shadowed ROM</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.800712] PCI: CLS 64 bytes, default 64</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.800769] Trying to unpack rootfs i=
mage as initramfs...</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.01039=
5] Freeing initrd memory: 19124K (ffff880035a96000 - ffff880036d43000)</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.010691] PCI-DMA: Disabling AGP=
.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.010769] PCI-DMA: apertur=
e base @ c4000000 size 65536 KB</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.010771] PCI-DMA: using GART IOMMU.</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.010774] PCI-DMA: Reserving 64MB of IOMMU area in the AGP a=
perture</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014431] perf: AMD =
NB counters detected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.01449=
6] microcode: CPU0: patch_level=3D0x06000817</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.014503] microcode: CPU1: patch_level=3D0x06000817</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014513] microcode: CPU2: patch_l=
evel=3D0x06000817</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014523] =
microcode: CPU3: patch_level=3D0x06000817</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.014533] microcode: CPU4: patch_level=3D0x06000817</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.014544] microcode: CPU5: patch_leve=
l=3D0x06000817</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014553] mic=
rocode: CPU6: patch_level=3D0x06000817</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.014564] microcode: CPU7: patch_level=3D0x06000817</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A01.014613] microcode: Microcode Update =
Driver: v2.00 &lt;<a href=3D"mailto:tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org" target=3D"=
_blank">tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org</a>&gt;, Peter Oruba</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A01.014619] LVT offset 0 assigned for vector 0x4=
00</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014639] perf: AMD IBS d=
etected (0x000000ff)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.01465=
7] Scanning for low memory corruption every 60 seconds</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.014968] futex hash table entries: 2048 (order:=
 5, 131072 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014992] =
Initialise system trusted keyring</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.015010] audit: initializing netlink subsys (disabled)</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.015024] audit: type=3D2000 audit(143406=
4609.896:1): initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.0=
15292] HugeTLB registered 2 MB page size, pre-allocated 0 pages</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.016720] zpool: loaded</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.016723] zbud: loaded</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.016845] VFS: Disk quotas dquot_6.5.2</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.016876] Dquot-cache hash table entr=
ies: 512 (order 0, 4096 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.017318] fuse init (API version 7.23)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.017394] msgmni has been set to 15932</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A01.017442] Key type big_key registered</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.017828] Key type asymmetric registered=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017831] Asymmetric key pa=
rser &#39;x509&#39; registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.017862] Block layer SCSI generic (bsg) driver version 0.4 loaded (majo=
r 252)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017915] io schedule=
r noop registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017918] =
io scheduler deadline registered (default)</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.017960] io scheduler cfq registered</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A01.018161] pcieport 0000:00:02.0: irq 40 for MSI/MS=
I-X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018295] pcieport 0000:=
00:06.0: irq 41 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.018422] pcieport 0000:00:07.0: irq 42 for MSI/MSI-X</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A01.018463] pcieport 0000:00:09.0: irq 43 for MS=
I/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018590] pcieport 0=
000:00:0a.0: irq 44 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.018646] pci_hotplug: PCI Hot Plug PCI Core version: 0.5</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.018661] pciehp: PCI Express Hot Plug =
Controller Driver version: 0.4</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.018704] vesafb: mode is 640x480x32, linelength=3D2560, pages=3D0</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018706] vesafb: scrolling: redr=
aw</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018708] vesafb: Truecol=
or: size=3D8:8:8:8, shift=3D24:16:8:0</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.026887] vesafb: framebuffer at 0xfb000000, mapped to 0xffffc900=
10e80000, using 1216k, total 1216k</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.027623] Console: switching to colour frame buffer device 80x30</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.028274] fb0: VESA VGA frame b=
uffer device</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.028370] input=
: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.028398] ACPI: Power Button=
 [PWRB]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.028444] input: Pow=
er Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.029305] ACPI: Power Button [PWRF]</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A01.029779] ACPI: acpi_idle registere=
d with cpuidle</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.030211] GHE=
S: HEST is not enabled!</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.03=
0719] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.051604] 00:04: ttyS0 at I/O 0x3f8 (irq=
 =3D 4, base_baud =3D 115200) is a 16550A</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.054011] Linux agpgart interface v0.103</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.055645] brd: module loaded</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.056690] loop: module loaded</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.057325] libphy: Fixed MDIO Bus: probed</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.057761] tun: Universal TUN/T=
AP device driver, 1.6</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.0581=
90] tun: (C) 1999-2004 Max Krasnyansky &lt;<a href=3D"mailto:maxk@qualcomm.=
com" target=3D"_blank">maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org</a>&gt;</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.058676] PPP generic driver version 2.4.2</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.059153] ehci_hcd: USB 2.0 &#39;Enhanc=
ed&#39; Host Controller (EHCI) Driver</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.059606] ehci-pci: EHCI PCI platform driver</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.060181] ehci-pci 0000:00:12.2: EHCI Host Contr=
oller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.060640] ehci-pci 000=
0:00:12.2: new USB bus registered, assigned bus number 1</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A01.061560] ehci-pci 0000:00:12.2: applying AMD =
SB700/SB800/Hudson-2/3 EHCI dummy qh workaround</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A01.062496] ehci-pci 0000:00:12.2: debug port 1</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.062998] ehci-pci 0000:00:12.2: irq =
17, io mem 0xf9fff800</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.0727=
31] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.073227] usb usb1: New USB device found, idVendo=
r=3D1d6b, idProduct=3D0002</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01=
.073681] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumb=
er=3D1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.074551] usb usb1: P=
roduct: EHCI Host Controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.074973] usb usb1: Manufacturer: Linux 3.16.0-38-generic ehci_hcd</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.075404] usb usb1: SerialNumber:=
 0000:00:12.2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.075971] hub =
1-0:1.0: USB hub found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.076=
402] hub 1-0:1.0: 6 ports detected</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.077091] ehci-pci 0000:00:13.2: EHCI Host Controller</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.077521] ehci-pci 0000:00:13.2: new USB b=
us registered, assigned bus number 2</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.078364] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-=
2/3 EHCI dummy qh workaround</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.079229] ehci-pci 0000:00:13.2: debug port 1</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.079699] ehci-pci 0000:00:13.2: irq 19, io mem 0xf9ff=
f400</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.088779] ehci-pci 0000=
:00:13.2: USB 2.0 started, EHCI 1.00</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.089269] usb usb2: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0002</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.089718] usb usb=
2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.090598] usb usb2: Product: EHCI Hos=
t Controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.091031] usb u=
sb2: Manufacturer: Linux 3.16.0-38-generic ehci_hcd</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A01.091458] usb usb2: SerialNumber: 0000:00:13.2</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.092027] hub 2-0:1.0: USB hub f=
ound</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.092455] hub 2-0:1.0: =
6 ports detected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.093003] e=
hci-platform: EHCI generic platform driver</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.093427] ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller (=
OHCI) Driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.093842] ohci-=
pci: OHCI PCI platform driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.094365] ohci-pci 0000:00:12.0: OHCI PCI host controller</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.094785] ohci-pci 0000:00:12.0: new USB b=
us registered, assigned bus number 3</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.095643] ohci-pci 0000:00:12.0: irq 16, io mem 0xf9ffe000</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.152862] usb usb3: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0001</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.153294] usb usb3: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.154=
140] usb usb3: Product: OHCI PCI host controller</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.154576] usb usb3: Manufacturer: Linux 3.16.0-38-gene=
ric ohci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.155016] usb u=
sb3: SerialNumber: 0000:00:12.0</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.155600] hub 3-0:1.0: USB hub found</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.156043] hub 3-0:1.0: 3 ports detected</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.156655] ohci-pci 0000:00:12.1: OHCI PCI host c=
ontroller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.157090] ohci-pci=
 0000:00:12.1: new USB bus registered, assigned bus number 4</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.157929] ohci-pci 0000:00:12.1: irq 16, i=
o mem 0xf9ffd000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.216925] u=
sb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0001</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A01.217364] usb usb4: New USB device str=
ings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.218228] usb usb4: Product: OHCI PCI host controller</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.218669] usb usb4: Manufacturer=
: Linux 3.16.0-38-generic ohci_hcd</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.219105] usb usb4: SerialNumber: 0000:00:12.1</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.219692] hub 4-0:1.0: USB hub found</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.220126] hub 4-0:1.0: 3 ports detected<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.220728] ohci-pci 0000:00:1=
3.0: OHCI PCI host controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.221161] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus nu=
mber 5</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.222054] ohci-pci 00=
00:00:13.0: irq 18, io mem 0xf9ffc000</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.280989] usb usb5: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0001</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.281442] usb usb=
5: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.282335] usb usb5: Product: OHCI PCI=
 host controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.282785] u=
sb usb5: Manufacturer: Linux 3.16.0-38-generic ohci_hcd</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.283234] usb usb5: SerialNumber: 0000:00:13.0<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.283833] hub 5-0:1.0: USB h=
ub found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.284272] hub 5-0:1=
.0: 3 ports detected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.28487=
5] ohci-pci 0000:00:13.1: OHCI PCI host controller</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A01.285305] ohci-pci 0000:00:13.1: new USB bus registe=
red, assigned bus number 6</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01=
.286172] ohci-pci 0000:00:13.1: irq 18, io mem 0xf9ffb000</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.345068] usb usb6: New USB device found, i=
dVendor=3D1d6b, idProduct=3D0001</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.345522] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.346411] usb =
usb6: Product: OHCI PCI host controller</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.346858] usb usb6: Manufacturer: Linux 3.16.0-38-generic ohci=
_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.347307] usb usb6: Ser=
ialNumber: 0000:00:13.1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.34=
7896] hub 6-0:1.0: USB hub found</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.348335] hub 6-0:1.0: 3 ports detected</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.348937] ohci-pci 0000:00:14.5: OHCI PCI host controller=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.349366] ohci-pci 0000:00:=
14.5: new USB bus registered, assigned bus number 7</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A01.350231] ohci-pci 0000:00:14.5: irq 18, io mem 0xf=
9ffa000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.409109] usb usb7: =
New USB device found, idVendor=3D1d6b, idProduct=3D0001</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.409546] usb usb7: New USB device strings: Mfr=
=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.410403] usb usb7: Product: OHCI PCI host controller</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.410846] usb usb7: Manufacturer: Linux=
 3.16.0-38-generic ohci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.411294] usb usb7: SerialNumber: 0000:00:14.5</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A01.411881] hub 7-0:1.0: USB hub found</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.412320] hub 7-0:1.0: 2 ports detected</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A01.412809] ohci-platform: OHCI gener=
ic platform driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.413242]=
 uhci_hcd: USB Universal Host Controller Interface driver</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.413734] xhci_hcd 0000:04:00.0: xHCI Host =
Controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.414166] xhci_hc=
d 0000:04:00.0: new USB bus registered, assigned bus number 8</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.415118] xhci_hcd 0000:04:00.0: irq 45 f=
or MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.415165] usb u=
sb8: New USB device found, idVendor=3D1d6b, idProduct=3D0002</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.415619] usb usb8: New USB device strings=
: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.416507] usb usb8: Product: xHCI Host Controller</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.416952] usb usb8: Manufacturer: Linux =
3.16.0-38-generic xhci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01=
.417409] usb usb8: SerialNumber: 0000:04:00.0</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.417980] hub 8-0:1.0: USB hub found</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.418413] hub 8-0:1.0: 4 ports detected</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A01.418922] xhci_hcd 0000:04:00.0: xHC=
I Host Controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.419346] =
xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 9</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.420224] usb usb9: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0003</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.420676] usb usb9: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.421=
566] usb usb9: Product: xHCI Host Controller</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.422009] usb usb9: Manufacturer: Linux 3.16.0-38-generic =
xhci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.422453] usb usb9:=
 SerialNumber: 0000:04:00.0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.423014] hub 9-0:1.0: USB hub found</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.423450] hub 9-0:1.0: 4 ports detected</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A01.423994] i8042: PNP: No PS/2 controller found. Probi=
ng ports directly.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.426976]=
 serio: i8042 KBD port at 0x60,0x64 irq 1</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.427395] serio: i8042 AUX port at 0x60,0x64 irq 12</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.427950] mousedev: PS/2 mouse device=
 common for all mice</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.42854=
2] rtc_cmos 00:01: RTC can wake from S4</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.429140] rtc_cmos 00:01: rtc core: registered rtc_cmos as rtc=
0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.429594] rtc_cmos 00:01: =
alarms up to one month, y3k, 114 bytes nvram, hpet irqs</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.430501] device-mapper: uevent: version 1.0.3<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.431015] device-mapper: ioc=
tl: 4.27.0-ioctl (2013-10-30) initialised: <a href=3D"mailto:dm-devel@redha=
t.com" target=3D"_blank">dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a></div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.431876] ledtrig-cpu: registered to indicate activity=
 on CPUs</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.432385] TCP: cubi=
c registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.432912] NET: =
Registered protocol family 10</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.433562] NET: Registered protocol family 17</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A01.433981] Key type dns_resolver registered</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.435067] Loading compiled-in X.509 cert=
ificates</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.436122] Loaded X.=
509 cert &#39;Magrathea: Glacier signing key: c284edaccf0b473652c34d23bec35=
6944236e63b&#39;</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.436985] r=
egistered taskstats version 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.439184] Key type trusted registered</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.442721] Key type encrypted registered</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A01.443116] AppArmor: AppArmor sha1 policy hashing e=
nabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.443514] ima: No TPM=
 chip found, activating TPM-bypass!</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.443921] evm: HMAC attrs: 0x1</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.444727] =C2=A0 Magic number: 3:985:301</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.445140] tty tty30: hash matches</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.445619] rtc_cmos 00:01: setting system cl=
ock to 2015-06-11 23:16:51 UTC (1434064611)</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A01.446702] acpi-cpufreq: overriding BIOS provided _PSD data<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.447525] BIOS EDD facility =
v0.16 2004-Jun-25, 0 devices found</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.447941] EDD information not available.</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A01.448403] PM: Hibernation image not present or could no=
t be loaded.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.449473] Freei=
ng unused kernel memory: 1352K (ffffffff81d1c000 - ffffffff81e6e000)</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.450347] Write protecting the ker=
nel read-only data: 12288k</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01=
.452474] Freeing unused kernel memory: 556K (ffff880001775000 - ffff8800018=
00000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.454811] Freeing unu=
sed kernel memory: 500K (ffff880001b83000 - ffff880001c00000)</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.467097] systemd-udevd[144]: starting ve=
rsion 204</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.482331] r8169 Gi=
gabit Ethernet driver 2.3LK-NAPI loaded</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.482910] ahci 0000:00:11.0: version 3.0</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.483020] r8169 0000:02:00.0: irq 46 for MSI/MSI-=
X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483144] ahci 0000:00:11.=
0: AHCI 0001.0100 32 slots 4 ports 3 Gbps 0xf impl SATA mode</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.483256] r8169 0000:02:00.0 eth0: RTL8168=
e/8111e at 0xffffc90010e66000, e8:de:27:01:f6:19, XID 0c200000 IRQ 46</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483257] r8169 0000:02:00.0 eth0=
: jumbo features [frames: 9200 bytes, tx checksumming: ko]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.483275] r8169 Gigabit Ethernet driver 2.3=
LK-NAPI loaded</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483500] r81=
69 0000:05:00.0: irq 47 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.483671] r8169 0000:05:00.0 eth1: RTL8168evl/8111evl at 0xffffc9=
0010fb4000, d0:50:99:30:c6:76, XID 0c900800 IRQ 47</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A01.483672] r8169 0000:05:00.0 eth1: jumbo features [f=
rames: 9200 bytes, tx checksumming: ko]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.488749] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led=
 clo pmp pio slum part ccc=C2=A0</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.490977] scsi0 : ahci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.492030] scsi1 : ahci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.=
494136] scsi2 : ahci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.49482=
1] scsi3 : ahci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.495406] at=
a1: SATA max UDMA/133 abar m1024@0xf9fffc00 port 0xf9fffd00 irq 22</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A01.496404] ata2: SATA max UDMA/133 ab=
ar m1024@0xf9fffc00 port 0xf9fffd80 irq 22</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.497415] ata3: SATA max UDMA/133 abar m1024@0xf9fffc00 port=
 0xf9fffe00 irq 22</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.498417]=
 ata4: SATA max UDMA/133 abar m1024@0xf9fffc00 port 0xf9fffe80 irq 22</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.499589] ahci 0000:03:00.0: irq =
48 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.499613] a=
hci 0000:03:00.0: SSS flag set, parallel bus scan disabled</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.500164] ahci 0000:03:00.0: AHCI 0001.0200=
 32 slots 2 ports 6 Gbps 0x3 impl SATA mode</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A01.501225] ahci 0000:03:00.0: flags: 64bit ncq sntf stag led=
 clo pmp pio slum part ccc sxs=C2=A0</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.501229] scsi4 : pata_atiixp</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.501445] scsi5 : pata_atiixp</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.501573] ata5: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma =
0xff00 irq 14</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.501573] ata6=
: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0xff08 irq 15</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.504907] scsi6 : ahci</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.505613] scsi7 : ahci</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A01.506270] ata7: SATA max UDMA/133 abar m512@0xfeaffc0=
0 port 0xfeaffd00 irq 48</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.5=
07196] ata8: SATA max UDMA/133 abar m512@0xfeaffc00 port 0xfeaffd80 irq 48<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.529416] systemd-udevd[147]=
: renamed network interface eth1 to p10p1</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.545433] systemd-udevd[152]: renamed network interface eth0 =
to p7p1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.573331] usb 2-2: n=
ew high-speed USB device number 2 using ehci-pci</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.685915] ata6.01: ATAPI: HL-DT-STDVD-RAM GSA-H58N, 1.=
00, max UDMA/66</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.701871] at=
a6.01: configured for UDMA/66</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.706182] usb 2-2: New USB device found, idVendor=3D0ace, idProduct=3D12=
15</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.706692] usb 2-2: New US=
B device strings: Mfr=3D16, Product=3D32, SerialNumber=3D0</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.707680] usb 2-2: Product: USB2.0 WLAN</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.708165] usb 2-2: Manufacturer=
: ZyDAS</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.817520] ata1: SATA=
 link down (SStatus 0 SControl 300)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.818101] ata3: SATA link down (SStatus 0 SControl 300)</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.818587] ata4: SATA link down (SStat=
us 0 SControl 300)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.819049]=
 ata2: SATA link down (SStatus 0 SControl 300)</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A01.821142] scsi 5:0:1:0: CD-ROM =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0HL-DT-ST DVD-RAM GSA-H58N 1.00 PQ: 0 ANSI: 5</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.831872] sr0: scsi3-mmc drive: 48x/48x w=
riter dvd-ram cd/rw xa/form2 cdda tray</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.832776] cdrom: Uniform CD-ROM driver Revision: 3.20</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A01.833371] sr 5:0:1:0: Attached scsi =
CD-ROM sr0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.833487] sr 5:0:=
1:0: Attached scsi generic sg0 type 5</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.841543] usb 4-1: new low-speed USB device number 2 using ohci-p=
ci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.997384] ata7: SATA link=
 up 6.0 Gbps (SStatus 133 SControl 300)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.998773] ata7.00: ATA-9: SSD2SC120G1SA754D117-820, N0530A, ma=
x UDMA/133</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.999239] ata7.00=
: 234441648 sectors, multi 1: LBA48 NCQ (depth 31/32), AA</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.999981] ata7.00: configured for UDMA/133<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.000550] scsi 6:0:0:0: Dire=
ct-Access =C2=A0 =C2=A0 ATA =C2=A0 =C2=A0 =C2=A0SSD2SC120G1SA754 0A =C2=A0 =
PQ: 0 ANSI: 5</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.001687] sd 6=
:0:0:0: [sda] 234441648 512-byte logical blocks: (120 GB/111 GiB)</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A02.001692] sd 6:0:0:0: Attached scsi g=
eneric sg1 type 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.003149] =
sd 6:0:0:0: [sda] Write Protect is off</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A02.003554] sd 6:0:0:0: [sda] Mode Sense: 00 3a 00 00</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A02.003683] sd 6:0:0:0: [sda] Write cach=
e: enabled, read cache: enabled, doesn&#39;t support DPO or FUA</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A02.005117] =C2=A0sda: sda1 sda2 sda3</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.005816] sd 6:0:0:0: [sda] Att=
ached SCSI disk</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.008240] ts=
c: Refined TSC clocksource calibration: 4653.112 MHz</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A02.013385] usb 4-1: New USB device found, idVendor=
=3D04d9, idProduct=3D0022</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.=
013882] usb 4-1: New USB device strings: Mfr=3D0, Product=3D2, SerialNumber=
=3D0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.014284] usb 4-1: Prod=
uct: USB Keyboard</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.018348] =
hidraw: raw HID events driver (C) Jiri Kosina</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A02.042342] usbcore: registered new interface driver usbhid=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.042763] usbhid: USB HID c=
ore driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.044476] input: =
USB Keyboard as /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.0/0003:04D9=
:0022.0001/input/input5</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.04=
5444] hid-generic 0003:04D9:0022.0001: input,hidraw0: USB HID v1.10 Keyboar=
d [USB Keyboard] on usb-0000:00:12.1-1/input0</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A02.046435] input: USB Keyboard as /devices/pci0000:00/0000=
:00:12.1/usb4/4-1/4-1:1.1/0003:04D9:0022.0002/input/input6</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A02.047461] hid-generic 0003:04D9:0022.0002: =
input,hidraw1: USB HID v1.10 Device [USB Keyboard] on usb-0000:00:12.1-1/in=
put1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.303673] ata8: SATA li=
nk down (SStatus 0 SControl 300)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A02.920111] Switched to clocksource tsc</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A04.382933] floppy0: no floppy controllers found</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.272503] EXT4-fs (sda2): mounted filesy=
stem with ordered data mode. Opts: (null)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A07.364061] random: init urandom read with 70 bits of entropy a=
vailable</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.388873] init: ply=
mouth-upstart-bridge main process (237) terminated with status 1</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A07.389819] init: plymouth-upstart-bridg=
e main process ended, respawning</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.394387] init: plymouth-upstart-bridge main process (246) terminated=
 with status 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.395354] ini=
t: plymouth-upstart-bridge main process ended, respawning</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.399374] init: plymouth-upstart-bridge mai=
n process (250) terminated with status 1</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.400340] init: plymouth-upstart-bridge main process ended, re=
spawning</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.402987] init: ply=
mouth-upstart-bridge main process (254) terminated with status 1</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A07.403967] init: plymouth-upstart-bridg=
e main process ended, respawning</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.495806] Adding 2097148k swap on /dev/sda1.=C2=A0 Priority:-1 extent=
s:1 across:2097148k SSFS</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.4=
99478] EXT4-fs (sda2): re-mounted. Opts: errors=3Dremount-ro</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A07.607450] systemd-udevd[399]: starting ver=
sion 204</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.619836] EXT4-fs (=
sda3): mounted filesystem with ordered data mode. Opts: (null)</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.629983] lp: driver loaded but no devic=
es found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.637946] ppdev: us=
er-space parallel port driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.647449] wmi: Mapper loaded</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.647894] shpchp: Standard Hot Plug PCI Controller Driver version: 0.=
4</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.655187] [drm] Initialize=
d drm 1.1.0 20060810</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.66406=
0] ACPI Warning: SystemIO range 0x0000000000000b00-0x0000000000000b07 confl=
icts with OpRegion 0x0000000000000b00-0x0000000000000b0f (\SOR1) (20140424/=
utaddress-258)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.664067] ACP=
I: If an ACPI driver is available for this device, you should use it instea=
d of the native driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.672=
812] MCE: In-kernel MCE decoding enabled.</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A07.674623] EDAC MC: Ver: 3.0.0</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A07.675757] checking generic (fb000000 130000) vs hw (d000000=
0 10000000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.675759] checki=
ng generic (fb000000 130000) vs hw (fa000000 2000000)</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A07.675761] fb: switching to nouveaufb from VESA VG=
A</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.675782] Console: switchi=
ng to colour dummy device 80x25</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.675981] AMD64 EDAC driver v3.4.0</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.676002] EDAC amd64: DRAM ECC disabled.</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A07.676008] EDAC amd64: ECC disabled in the BIOS or=
 no ECC capability, module will not load.</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A07.676008] =C2=A0Either enable ECC checking or force module lo=
ading by setting &#39;ecc_enable_override&#39;.</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A07.676008] =C2=A0(Note that use of the override may caus=
e unknown side effects.)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.6=
76119] nouveau =C2=A0[ =C2=A0DEVICE][0000:01:00.0] BOOT0 =C2=A0: 0x298280a2=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.676122] nouveau =C2=A0[ =
=C2=A0DEVICE][0000:01:00.0] Chipset: G98 (NV98)</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A07.676123] nouveau =C2=A0[ =C2=A0DEVICE][0000:01:00.0] F=
amily : NV50</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.676213] nouve=
au =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] checking PRAMIN for image...</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A07.693108] AVX version of gcm_enc/de=
c engaged.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.712757] kvm: Ne=
sted Virtualization enabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
7.712762] kvm: Nested Paging enabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A07.733822] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] ... appears=
 to be valid</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.733823] nouve=
au =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] using image from PRAMIN</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.733905] nouveau =C2=A0[ =C2=A0 VBIOS][=
0000:01:00.0] BIT signature found</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.733908] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] version 70.18.3=
6.00.00</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.754325] nouveau 00=
00:01:00.0: irq 49 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.754335] nouveau =C2=A0[ =C2=A0 =C2=A0 PMC][0000:01:00.0] MSI interr=
upts enabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.754358] nouve=
au =C2=A0[ =C2=A0 =C2=A0 PFB][0000:01:00.0] RAM type: DDR2</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.754360] nouveau =C2=A0[ =C2=A0 =C2=A0 PFB=
][0000:01:00.0] RAM size: 1024 MiB</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A07.754361] nouveau =C2=A0[ =C2=A0 =C2=A0 PFB][0000:01:00.0] =C2=A0 =
=C2=A0ZCOMP: 960 tags</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.7647=
07] sound hdaudioC0D0: autoconfig: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) typ=
e:line</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764710] sound hdaud=
ioC0D0: =C2=A0 =C2=A0speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.764712] sound hdaudioC0D0: =C2=A0 =C2=A0h=
p_outs=3D1 (0x1b/0x0/0x0/0x0/0x0)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.764713] sound hdaudioC0D0: =C2=A0 =C2=A0mono: mono_out=3D0x0</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764714] sound hdaudioC0D0: =C2=
=A0 =C2=A0dig-out=3D0x1e/0x0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.764715] sound hdaudioC0D0: =C2=A0 =C2=A0inputs:</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A07.764717] sound hdaudioC0D0: =C2=A0 =C2=A0 =C2=A0F=
ront Mic=3D0x19</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764718] so=
und hdaudioC0D0: =C2=A0 =C2=A0 =C2=A0Rear Mic=3D0x18</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A07.764719] sound hdaudioC0D0: =C2=A0 =C2=A0 =C2=A0L=
ine=3D0x1a</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.777512] input: =
HDA ATI SB Rear Mic as /devices/pci0000:00/0000:00:14.2/sound/card0/input7<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.779263] input: HDA ATI SB =
Line as /devices/pci0000:00/0000:00:14.2/sound/card0/input8</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.779485] input: HDA ATI SB Line Out as /de=
vices/pci0000:00/0000:00:14.2/sound/card0/input9</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A07.784065] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] =
FAN control: none / external</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.784077] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] fan management: au=
tomatic</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784079] nouveau =
=C2=A0[ =C2=A0PTHERM][0000:01:00.0] internal sensor: yes</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A07.784087] nouveau =C2=A0[ =C2=A0 =C2=A0 CLK][0=
000:01:00.0] 0f: core 550 MHz shader 1375 MHz memory 266 MHz</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A07.784121] nouveau =C2=A0[ =C2=A0 =C2=A0 CL=
K][0000:01:00.0] --: core 566 MHz shader 1400 MHz memory 265 MHz</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A07.784167] nouveau E[ =C2=A0 PDISP][000=
0:01:00.0] 02:0261: func 08 lookup failed, -2</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A07.784558] [TTM] Zone =C2=A0kernel: Available graphics mem=
ory: 4079904 kiB</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784560] [=
TTM] Zone =C2=A0 dma32: Available graphics memory: 2097152 kiB</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.784561] [TTM] Initializing pool alloca=
tor</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784567] [TTM] Initiali=
zing DMA pool allocator</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.78=
4584] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] VRAM: 1024 MiB</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A07.784586] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] GA=
RT: 1048576 MiB</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784590] no=
uveau =C2=A0[ =C2=A0 =C2=A0 DRM] TMDS table version 2.0</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A07.784593] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DC=
B version 4.0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784596] nouv=
eau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 00: 02000300 00000028</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A07.784599] nouveau =C2=A0[ =C2=A0 =C2=A0 D=
RM] DCB outp 01: 01000302 00020030</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A07.784601] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 02: 04011310 0=
0000028</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784603] nouveau =
=C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 03: 02022322 00c20090</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.784605] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM=
] DCB conn 00: 00001030</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.78=
4608] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB conn 01: 00000100</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.784610] nouveau =C2=A0[ =C2=A0 =C2=A0 =
DRM] DCB conn 02: 00002261</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07=
.790697] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A07.790699] [drm] Driver supports pr=
ecise vblank timestamp query.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.799009] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] MM: using M2MF for buffer c=
opies</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.811344] cfg80211: Ca=
lling CRDA to update world regulatory domain</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A07.833323] cfg80211: World regulatory domain updated:</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833326] cfg80211: =C2=A0DFS Mas=
ter region: unset</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833327] =
cfg80211: =C2=A0 (start_freq - end_freq @ bandwidth), (max_antenna_gain, ma=
x_eirp), (dfs_cac_time)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.83=
3330] cfg80211: =C2=A0 (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2=
000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833331] cf=
g80211: =C2=A0 (2457000 KHz - 2482000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)=
, (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833333] cfg80211: =
=C2=A0 (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833335] cfg80211: =C2=A0 (=
5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A07.833336] cfg80211: =C2=A0 (5735000 =
KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.860841] init: failsafe main process (660)=
 killed by TERM signal</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.869=
101] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] allocated 1360x768 fb: 0x60000, bo =
ffff8800cadfe000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.869168] f=
bcon: nouveaufb (fb0) is primary device</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.870010] nouveau E[ DEVINIT][0000:01:00.0] unable to compute =
acceptable pll values</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.8700=
12] nouveau E[ DEVINIT][0000:01:00.0] failed pll calculation</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A07.925743] Bluetooth: Core ver 2.19</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A07.925758] NET: Registered protocol =
family 31</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925759] Bluetoot=
h: HCI device and connection manager initialized</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A07.925765] Bluetooth: HCI socket layer initialized</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925767] Bluetooth: L2CAP socke=
t layer initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925780=
] Bluetooth: SCO socket layer initialized</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A07.928636] Bluetooth: RFCOMM TTY layer initialized</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A07.928640] Bluetooth: RFCOMM socket laye=
r initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.928644] Blue=
tooth: RFCOMM ver 1.11</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.934=
949] Bluetooth: BNEP (Ethernet Emulation) ver 1.3</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A07.934949] Bluetooth: BNEP filters: protocol multicast=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.934954] Bluetooth: BNEP s=
ocket layer initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.93=
6155] usb 2-2: reset high-speed USB device number 2 using ehci-pci</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A07.938438] init: cups main process (7=
27) killed by HUP signal</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.9=
38443] init: cups main process ended, respawning</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A08.070645] ieee80211 phy0: Selected rate control algori=
thm &#39;minstrel_ht&#39;</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.=
070835] zd1211rw 2-2:1.0: phy0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A08.070858] usbcore: registered new interface driver zd1211rw</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A08.096090] Console: switching to colour f=
rame buffer device 170x48</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.=
096656] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A08.096657] nouveau 0000:01:00.0: regist=
ered panic notifier</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.108042=
] random: nonblocking pool is initialized</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A08.115300] [drm] Initialized nouveau 1.1.2 20120801 for 0000:0=
1:00.0 on minor 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.286280] =
r8169 0000:02:00.0 p7p1: link down</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A08.286309] IPv6: ADDRCONF(NETDEV_UP): p7p1: link is not ready</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A08.403879] r8169 0000:05:00.0 p10p1:=
 link down</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.403918] IPv6: A=
DDRCONF(NETDEV_UP): p10p1: link is not ready</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A08.443017] zd1211rw 2-2:1.0: firmware version 4725</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A08.462399] vboxdrv: module verificati=
on failed: signature and/or =C2=A0required key missing - tainting kernel</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.465366] vboxdrv: Found 8 pro=
cessor cores.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.465801] vbox=
drv: fAsync=3D0 offMin=3D0x529 offMax=3D0x3ee0</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A08.465893] vboxdrv: TSC mode is &#39;synchronous&#39;, ke=
rnel timer mode is &#39;normal&#39;.</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A08.465894] vboxdrv: Successfully loaded version 4.3.20 (interface =
0x001a0008).</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.483055] zd121=
1rw 2-2:1.0: zd1211b chip 0ace:1215 v4810 high 00-02-72 AL2230_RF pa0 g--NS=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.519323] IPv6: ADDRCONF(NE=
TDEV_UP): wlan0: link is not ready</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A08.519353] cfg80211: Calling CRDA for country: DE</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A08.521334] cfg80211: Regulatory domain changed t=
o country: DE</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.521336] cfg8=
0211: =C2=A0DFS Master region: unset</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A08.521337] cfg80211: =C2=A0 (start_freq - end_freq @ bandwidth), (=
max_antenna_gain, max_eirp), (dfs_cac_time)</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A08.521339] cfg80211: =C2=A0 (2400000 KHz - 2483500 KHz @ 400=
00 KHz), (N/A, 2000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A08.521340] cfg80211: =C2=A0 (5150000 KHz - 5250000 KHz @ 40000 KHz), (=
N/A, 2000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.5213=
42] cfg80211: =C2=A0 (5250000 KHz - 5350000 KHz @ 40000 KHz), (N/A, 2000 mB=
m), (0 s)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.521343] cfg80211=
: =C2=A0 (5470000 KHz - 5725000 KHz @ 40000 KHz), (N/A, 2698 mBm), (0 s)</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.521344] cfg80211: =C2=A0 (57=
240000 KHz - 65880000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A08.671967] vboxpci: IOMMU not found (no=
t registered)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.153486] init=
: plymouth-upstart-bridge main process ended, respawning</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A09.407531] wlan0: authenticate with 5a:98:26:49=
:92:24</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.433096] wlan0: send=
 auth to 5a:98:26:49:92:24 (try 1/3)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A09.434594] wlan0: authenticated</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A09.436876] wlan0: associate with 5a:98:26:49:92:24 (try 1/3)</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.443353] wlan0: RX AssocResp =
from 5a:98:26:49:92:24 (capab=3D0x411 status=3D0 aid=3D2)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A09.443853] wlan0: associated</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A09.443881] IPv6: ADDRCONF(NETDEV_CHANGE): wl=
an0: link becomes ready</div><div class=3D"gmail_extra">[ =C2=A0 10.655128]=
 floppy0: no floppy controllers found</div><div><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><br></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div>
<br><div class=3D"gmail_quote">2015-06-11 20:52 GMT-03:00 Andre Campos Rodo=
valho <span dir=3D"ltr">&lt;<a href=3D"mailto:andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" ta=
rget=3D"_blank">andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x"><div dir=3D"ltr">Hi, the boot does not fail, I belive... I can turn on a=
nd off the computer, I can access it throught SSH and even VNC. The compute=
r is functinal, but screen is blank/black. My monitor says something like &=
quot;invalid format&quot; or &quot;invalid input&quot;...<div><br></div><di=
v>Tnx</div><div>-----------------------------------------------------------=
------------------------------</div><div><br></div><div><div>Jun 11 20:16:5=
8 v-caps rsyslogd: [origin software=3D&quot;rsyslogd&quot; swVersion=3D&quo=
t;7.4.4&quot; x-pid=3D&quot;662&quot; x-info=3D&quot;<a href=3D"http://www.=
rsyslog.com" target=3D"_blank">http://www.rsyslog.com</a>&quot;] start</div=
><div>Jun 11 20:16:58 v-caps rsyslogd: rsyslogd&#39;s groupid changed to 10=
4</div><div>Jun 11 20:16:58 v-caps rsyslogd: rsyslogd&#39;s userid changed =
to 101</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] In=
itializing cgroup subsys cpuset</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] Initializing cgroup subsys cpu</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Initializing cgroup subsys cpu=
acct</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Linu=
x version 3.16.0-38-generic (buildd@allspice) (gcc version 4.8.2 (Ubuntu 4.=
8.2-19ubuntu1) ) #52~14.04.1-Ubuntu SMP Fri May 8 09:43:57 UTC 2015 (Ubuntu=
 3.16.0-38.52~14.04.1-generic 3.16.7-ckt10)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz=
-3.16.0-38-generic root=3D/dev/sda2 ro</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 AMD Aut=
henticAMD</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000]=
 =C2=A0 Centaur CentaurHauls</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] e820: BIOS-provided physical RAM map:</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000=
00000000-0x000000000009dbff] usable</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x000000000009dc00-0x00000000000=
9ffff] reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.0=
00000] BIOS-e820: [mem 0x00000000000e6000-0x00000000000fffff] reserved</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] BIOS-e820: [m=
em 0x0000000000100000-0x00000000cff9ffff] usable</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000cffa0000-=
0x00000000cffaffff] ACPI data</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000cffb0000-0x00000000cffdfff=
f] ACPI NVS</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.00000=
0] BIOS-e820: [mem 0x00000000cffe0000-0x00000000cfffffff] reserved</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0=
x00000000ffe00000-0x00000000ffffffff] reserved</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000100000000-0x=
000000022effffff] usable</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] NX (Execute Disable) protection: active</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] SMBIOS 2.6 present.</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] DMI: To Be Filled=
 By O.E.M. To Be Filled By O.E.M./980DE3/U3S3, BIOS P1.60 05/06/2014</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] e820: update [m=
em 0x00000000-0x00000fff] usable =3D=3D&gt; reserved</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] e820: remove [mem 0x000a0000-0x=
000fffff] usable</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
000000] AGP: No AGP bridge found</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A00.000000] e820: last_pfn =3D 0x22f000 max_arch_pfn =3D 0x4000=
00000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] MTR=
R default type: uncachable</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] MTRR fixed ranges enabled:</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 00000-9FFFF write-back</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 A0000-EFF=
FF uncachable</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000=
000] =C2=A0 F0000-FFFFF write-protect</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.000000] MTRR variable ranges enabled:</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 0 base 00000000000=
0 mask FFFF80000000 write-back</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] =C2=A0 1 base 000080000000 mask FFFFC0000000 write-b=
ack</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=
=A0 2 base 0000C0000000 mask FFFFF0000000 write-back</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 3 disabled</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 4 disabled</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 5 disa=
bled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=
=A0 6 disabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.00=
0000] =C2=A0 7 disabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] TOM2: 000000022f000000 aka 8944M</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.000000] x86 PAT enabled: cpu 0, old 0x70406=
00070406, new 0x7010600070106</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] e820: update [mem 0xd0000000-0xffffffff] usable =3D=
=3D&gt; reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
000000] e820: last_pfn =3D 0xcffa0 max_arch_pfn =3D 0x400000000</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] found SMP MP-table a=
t [mem 0x000ff780-0x000ff78f] mapped at [ffff8800000ff780]</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Scanning 1 areas for low =
memory corruption</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00=
.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Using GB page=
s for direct mapping</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x00000000-=
0x000fffff] page 4k</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] BRK [0x01fbd000, 0x01fbdfff] PGTABLE</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.000000] BRK [0x01fbe000, 0x01fbefff] PGTAB=
LE</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] BRK [0=
x01fbf000, 0x01fbffff] PGTABLE</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x22ee00000-0x22effffff]</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0[mem=
 0x22ee00000-0x22effffff] page 2M</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.000000] BRK [0x01fc0000, 0x01fc0fff] PGTABLE</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] init_memory_mapping: [=
mem 0x22c000000-0x22edfffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] =C2=A0[mem 0x22c000000-0x22edfffff] page 2M</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] init_memory_mapping:=
 [mem 0x200000000-0x22bffffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] =C2=A0[mem 0x200000000-0x22bffffff] page 2M</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] init_memory_mappi=
ng: [mem 0x00100000-0xcff9ffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] =C2=A0[mem 0x00100000-0x001fffff] page 4k</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x002000=
00-0x3fffffff] page 2M</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] =C2=A0[mem 0x40000000-0xbfffffff] page 1G</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0[mem 0xc0000000-0xcf=
dfffff] page 2M</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.0=
00000] =C2=A0[mem 0xcfe00000-0xcff9ffff] page 4k</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x1000000=
00-0x1ffffffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.0=
00000] =C2=A0[mem 0x100000000-0x1ffffffff] page 1G</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.000000] RAMDISK: [mem 0x35a96000-0x36d42f=
ff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI:=
 Early table checksum verification disabled</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.000000] ACPI: RSDP 0x00000000000FB6C0 000014 (v0=
0 ACPIAM)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000]=
 ACPI: RSDT 0x00000000CFFA0000 000040 (v01 050614 RSDT1213 20140506 MSFT 00=
000097)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] A=
CPI: FACP 0x00000000CFFA0200 000084 (v01 A_M_I =C2=A0OEMFACP =C2=A012000601=
 MSFT 00000097)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.0=
00000] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock has zer=
o address or length: 0x0000000000000000/0x1 (20140424/tbfadt-649)</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: DSDT 0x00000=
000CFFA0460 0088B0 (v01 AS636 =C2=A0AS636152 00000152 INTL 20051117)</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: FACS 0x00=
000000CFFB0000 000040</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] ACPI: APIC 0x00000000CFFA0390 00008C (v01 050614 APIC1213 2014=
0506 MSFT 00000097)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] ACPI: MCFG 0x00000000CFFA0420 00003C (v01 050614 OEMMCFG =C2=
=A020140506 MSFT 00000097)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] ACPI: OEMB 0x00000000CFFB0040 000072 (v01 050614 OEMB12=
13 20140506 MSFT 00000097)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] ACPI: AAFT 0x00000000CFFAA460 000027 (v01 050614 OEMAAF=
T =C2=A020140506 MSFT 00000097)</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.000000] ACPI: HPET 0x00000000CFFAA490 000038 (v01 050614 OEM=
HPET =C2=A020140506 MSFT 00000097)</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.000000] ACPI: SSDT 0x00000000CFFAA4D0 001714 (v01 A M I =
=C2=A0POWERNOW 00000001 AMD =C2=A000000001)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.000000] ACPI: Local APIC address 0xfee00000</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] No NUMA confi=
guration found</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.00=
0000] Faking a node at [mem 0x0000000000000000-0x000000022effffff]</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Initmem setup nod=
e 0 [mem 0x00000000-0x22effffff]</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A00.000000] =C2=A0 NODE_DATA [mem 0x22eff9000-0x22effdfff]</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0[ffffea=
0000000000-ffffea0008bfffff] PMD -&gt; [ffff880226600000-ffff88022e5fffff] =
on node 0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000]=
 Zone ranges:</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000=
000] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x00001000-0x00ffffff]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =
=C2=A0[mem 0x01000000-0xffffffff]</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 [mem 0x100000000-0x22effffff]=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Movable =
zone start for each node</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] Early memory node ranges</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00001000-0x000=
9cfff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =
=C2=A0 node =C2=A0 0: [mem 0x00100000-0xcff9ffff]</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x10000=
0000-0x22effffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00=
.000000] On node 0 totalpages: 2092860</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A00.000000] =C2=A0 DMA zone: 64 pages used for memmap</di=
v><div>Jun 11 20:16:58 v-caps kernel</div></div></div></blockquote></div></=
div></div><br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"no=
referrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/n=
ouveau</a><br>
<br>...</blockquote></div>

--001a1141b5fedae57805184d52a1--

--===============0444492031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0444492031==--
