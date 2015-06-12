From: Andre Campos Rodovalho <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: Problem with GT218 (GeForce GT210)
Date: Thu, 11 Jun 2015 21:04:53 -0300
Message-ID: <CABLbVHOrWu-UWnf_S=i02nEjBcLS043HqDCtTvU_C20=VpW5pQ@mail.gmail.com>
References: <CABLbVHNMTS9SzT_Qgn+N0L4p+fFOTHA=C2-FmUaYu0f-xA6zZg@mail.gmail.com>
 <CABLbVHP9Qgzh1RB3ZGeXJWqOpGhAbV3hF3DdS58bB2dxkdAHjg@mail.gmail.com>
 <CAKb7UvjD464REqBi=vz7qS-KLeYb+TEqbB8hsb+2L1qvP5aZSQ@mail.gmail.com>
 <CABLbVHO-Cw99WeW7mchDKfV2gNEvD=LC_gSFunO1YYv_tSXdMQ@mail.gmail.com>
 <CABLbVHPevEt7SBa8UqMzNDc-A5fC69hywzuZ-_rfAx=i7ti+_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a1135fbdec411a0051846dca0
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--001a1135fbdec411a0051846dca0
Content-Type: multipart/alternative; boundary=001a1135fbdec41199051846dc9e

--001a1135fbdec41199051846dc9e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, the boot does not fail, I belive... I can turn on and off the computer,
I can access it throught SSH and even VNC. The computer is functinal, but
screen is blank/black. My monitor says something like "invalid format" or
"invalid input"...

Tnx
---------------------------------------------------------------------------=
--------------

I'm attaching the files, because this list does not accept a very big
e-mail content...



2015-06-11 20:59 GMT-03:00 Andre Campos Rodovalho <andre.rodovalho-Re5JQEeQqe8@public.gmane.org=
m
>:

> dmesg output:
>
>
> -------------------------------------------------------------------------=
--------------------------------
>
>
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 3.16.0-38-generic (buildd@allspice) (gcc
> version 4.8.2 (Ubuntu 4.8.2-19ubuntu1) ) #52~14.04.1-Ubuntu SMP Fri May 8
> 09:43:57 UTC 2015 (Ubuntu 3.16.0-38.52~14.04.1-generic 3.16.7-ckt10)
> [    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-38-generic
> root=3D/dev/sda2 ro
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
> [    0.000000] BIOS-e820: [mem 0x00000000cffa0000-0x00000000cffaffff] ACP=
I
> data
> [    0.000000] BIOS-e820: [mem 0x00000000cffb0000-0x00000000cffdffff] ACP=
I
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
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] e820: last_pfn =3D 0x22f000 max_arch_pfn =3D 0x400000000
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
> [    0.000000] e820: update [mem 0xd0000000-0xffffffff] usable =3D=3D> re=
served
> [    0.000000] e820: last_pfn =3D 0xcffa0 max_arch_pfn =3D 0x400000000
> [    0.000000] found SMP MP-table at [mem 0x000ff780-0x000ff78f] mapped a=
t
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
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x000000022efffff=
f]
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
> [    0.000000] e820: [mem 0xd0000000-0xffdfffff] available for PCI device=
s
> [    0.000000] Booting paravirtualized kernel on bare hardware
> [    0.000000] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8
> nr_node_ids:1
> [    0.000000] PERCPU: Embedded 27 pages/cpu @ffff88022ec00000 s81408
> r8192 d20992 u262144
> [    0.000000] pcpu-alloc: s81408 r8192 d20992 u262144 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
> Total pages: 2060136
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line:
> BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro
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
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8,=
 Nodes=3D1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU dyntick-idle grace-period acceleration is enabled.
> [    0.000000] RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D8.
> [    0.000000] Offload RCU callbacks from all CPUs
> [    0.000000] Offload RCU callbacks from CPUs: 0-7.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D8
> [    0.000000] NR_IRQS:16640 nr_irqs:744 16
> [    0.000000] spurious 8259A interrupt: IRQ7.
> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] allocated 33554432 bytes of page_cgroup
> [    0.000000] please try 'cgroup_disable=3Dmemory' option if you don't w=
ant
> memory cgroups
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 4680.606 MHz processor
> [    0.000020] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 9361.21 BogoMIPS (lpj=3D18722424)
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
> [    0.015475] Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 512, 1GB =
0
> [    0.015475] tlb_flushall_shift: 6
> [    0.015553] Freeing SMP alternatives memory: 32K (ffffffff81e6e000 -
> ffffffff81e76000)
> [    0.016170] ftrace: allocating 29244 entries in 115 pages
> [    0.023710] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
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
> [    0.169378] NMI watchdog: enabled on all CPUs, permanently consumes on=
e
> hw-PMU counter.
> [    0.169445] x86: Booting SMP configuration:
> [    0.169447] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
> [    0.261441] x86: Booted up 1 node, 8 CPUs
> [    0.261446] smpboot: Total of 8 processors activated (74889.69 BogoMIP=
S)
> [    0.269594] devtmpfs: initialized
> [    0.272590] evm: security.selinux
> [    0.272592] evm: security.SMACK64
> [    0.272594] evm: security.SMACK64EXEC
> [    0.272596] evm: security.SMACK64TRANSMUTE
> [    0.272597] evm: security.SMACK64MMAP
> [    0.272599] evm: security.ima
> [    0.272600] evm: security.capability
> [    0.272651] PM: Registering ACPI NVS region [mem 0xcffb0000-0xcffdffff=
]
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
> [    0.278445] ACPI: Executed 3 blocks of module-level executable AML cod=
e
> [    0.281893] ACPI: Interpreter enabled
> [    0.281902] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
> [\_S2_] (20140424/hwxface-580)
> [    0.281918] ACPI: (supports S0 S1 S3 S4 S5)
> [    0.281920] ACPI: Using IOAPIC for interrupt routing
> [    0.281975] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
> 0xe0000000-0xefffffff] (base 0xe0000000)
> [    0.282810] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in
> ACPI motherboard resources
> [    0.283069] PCI: Using host bridge windows from ACPI; if necessary, us=
e
> "pci=3Dnocrs" and report a bug
> [    0.288165] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.288171] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI]
> [    0.288365] acpi PNP0A03:00: _OSC: platform does not support
> [PCIeHotplug PME]
> [    0.288550] acpi PNP0A03:00: _OSC: OS now controls [AER PCIeCapability=
]
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
> [    0.291692] pci 0000:01:00.0: reg 0x30: [mem 0xfe8e0000-0xfe8fffff pre=
f]
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
> [    0.296264] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
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
> [    0.312265] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
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
> [    0.320280] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
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
> [    0.329021] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 10 11 12 14 15) *0=
,
> disabled.
> [    0.329061] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 10 11 12 14 15) *0=
,
> disabled.
> [    0.329101] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 10 11 12 14 15) *0=
,
> disabled.
> [    0.329143] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 7 10 11 12 14 15)
> *0, disabled.
> [    0.329200] ACPI: Enabled 1 GPEs in block 00 to 1F
> [    0.329282] vgaarb: setting as boot device: PCI:0000:01:00.0
> [    0.329285] vgaarb: device added:
> PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
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
> [    0.337849] NetLabel:  domain hash size =3D 128
> [    0.337851] NetLabel:  protocols =3D UNLABELED CIPSOv4
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
> [    0.346394] system 00:02: [mem 0xfee00000-0xfee00fff] has been reserve=
d
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
> [    0.346650] system 00:03: [mem 0xffb80000-0xffbfffff] has been reserve=
d
> [    0.346653] system 00:03: [mem 0xfec10000-0xfec1001f] has been reserve=
d
> [    0.346656] system 00:03: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.346855] pnp 00:04: [dma 0 disabled]
> [    0.346903] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.346983] system 00:05: [io  0x0290-0x029f] has been reserved
> [    0.346986] system 00:05: Plug and Play ACPI device, IDs PNP0c02
> (active)
> [    0.347038] system 00:06: [mem 0xe0000000-0xefffffff] has been reserve=
d
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
> [    0.354110] TCP established hash table entries: 65536 (order: 7, 52428=
8
> bytes)
> [    0.354288] TCP bind hash table entries: 65536 (order: 8, 1048576 byte=
s)
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
> [    1.014496] microcode: CPU0: patch_level=3D0x06000817
> [    1.014503] microcode: CPU1: patch_level=3D0x06000817
> [    1.014513] microcode: CPU2: patch_level=3D0x06000817
> [    1.014523] microcode: CPU3: patch_level=3D0x06000817
> [    1.014533] microcode: CPU4: patch_level=3D0x06000817
> [    1.014544] microcode: CPU5: patch_level=3D0x06000817
> [    1.014553] microcode: CPU6: patch_level=3D0x06000817
> [    1.014564] microcode: CPU7: patch_level=3D0x06000817
> [    1.014613] microcode: Microcode Update Driver: v2.00 <
> tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
> [    1.014619] LVT offset 0 assigned for vector 0x400
> [    1.014639] perf: AMD IBS detected (0x000000ff)
> [    1.014657] Scanning for low memory corruption every 60 seconds
> [    1.014968] futex hash table entries: 2048 (order: 5, 131072 bytes)
> [    1.014992] Initialise system trusted keyring
> [    1.015010] audit: initializing netlink subsys (disabled)
> [    1.015024] audit: type=3D2000 audit(1434064609.896:1): initialized
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
> [    1.018661] pciehp: PCI Express Hot Plug Controller Driver version: 0.=
4
> [    1.018704] vesafb: mode is 640x480x32, linelength=3D2560, pages=3D0
> [    1.018706] vesafb: scrolling: redraw
> [    1.018708] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
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
> [    1.051604] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is
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
> [    1.060640] ehci-pci 0000:00:12.2: new USB bus registered, assigned bu=
s
> number 1
> [    1.061560] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3
> EHCI dummy qh workaround
> [    1.062496] ehci-pci 0000:00:12.2: debug port 1
> [    1.062998] ehci-pci 0000:00:12.2: irq 17, io mem 0xf9fff800
> [    1.072731] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
> [    1.073227] usb usb1: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002
> [    1.073681] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.074551] usb usb1: Product: EHCI Host Controller
> [    1.074973] usb usb1: Manufacturer: Linux 3.16.0-38-generic ehci_hcd
> [    1.075404] usb usb1: SerialNumber: 0000:00:12.2
> [    1.075971] hub 1-0:1.0: USB hub found
> [    1.076402] hub 1-0:1.0: 6 ports detected
> [    1.077091] ehci-pci 0000:00:13.2: EHCI Host Controller
> [    1.077521] ehci-pci 0000:00:13.2: new USB bus registered, assigned bu=
s
> number 2
> [    1.078364] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3
> EHCI dummy qh workaround
> [    1.079229] ehci-pci 0000:00:13.2: debug port 1
> [    1.079699] ehci-pci 0000:00:13.2: irq 19, io mem 0xf9fff400
> [    1.088779] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
> [    1.089269] usb usb2: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002
> [    1.089718] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.090598] usb usb2: Product: EHCI Host Controller
> [    1.091031] usb usb2: Manufacturer: Linux 3.16.0-38-generic ehci_hcd
> [    1.091458] usb usb2: SerialNumber: 0000:00:13.2
> [    1.092027] hub 2-0:1.0: USB hub found
> [    1.092455] hub 2-0:1.0: 6 ports detected
> [    1.093003] ehci-platform: EHCI generic platform driver
> [    1.093427] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    1.093842] ohci-pci: OHCI PCI platform driver
> [    1.094365] ohci-pci 0000:00:12.0: OHCI PCI host controller
> [    1.094785] ohci-pci 0000:00:12.0: new USB bus registered, assigned bu=
s
> number 3
> [    1.095643] ohci-pci 0000:00:12.0: irq 16, io mem 0xf9ffe000
> [    1.152862] usb usb3: New USB device found, idVendor=3D1d6b,
> idProduct=3D0001
> [    1.153294] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.154140] usb usb3: Product: OHCI PCI host controller
> [    1.154576] usb usb3: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.155016] usb usb3: SerialNumber: 0000:00:12.0
> [    1.155600] hub 3-0:1.0: USB hub found
> [    1.156043] hub 3-0:1.0: 3 ports detected
> [    1.156655] ohci-pci 0000:00:12.1: OHCI PCI host controller
> [    1.157090] ohci-pci 0000:00:12.1: new USB bus registered, assigned bu=
s
> number 4
> [    1.157929] ohci-pci 0000:00:12.1: irq 16, io mem 0xf9ffd000
> [    1.216925] usb usb4: New USB device found, idVendor=3D1d6b,
> idProduct=3D0001
> [    1.217364] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.218228] usb usb4: Product: OHCI PCI host controller
> [    1.218669] usb usb4: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.219105] usb usb4: SerialNumber: 0000:00:12.1
> [    1.219692] hub 4-0:1.0: USB hub found
> [    1.220126] hub 4-0:1.0: 3 ports detected
> [    1.220728] ohci-pci 0000:00:13.0: OHCI PCI host controller
> [    1.221161] ohci-pci 0000:00:13.0: new USB bus registered, assigned bu=
s
> number 5
> [    1.222054] ohci-pci 0000:00:13.0: irq 18, io mem 0xf9ffc000
> [    1.280989] usb usb5: New USB device found, idVendor=3D1d6b,
> idProduct=3D0001
> [    1.281442] usb usb5: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.282335] usb usb5: Product: OHCI PCI host controller
> [    1.282785] usb usb5: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.283234] usb usb5: SerialNumber: 0000:00:13.0
> [    1.283833] hub 5-0:1.0: USB hub found
> [    1.284272] hub 5-0:1.0: 3 ports detected
> [    1.284875] ohci-pci 0000:00:13.1: OHCI PCI host controller
> [    1.285305] ohci-pci 0000:00:13.1: new USB bus registered, assigned bu=
s
> number 6
> [    1.286172] ohci-pci 0000:00:13.1: irq 18, io mem 0xf9ffb000
> [    1.345068] usb usb6: New USB device found, idVendor=3D1d6b,
> idProduct=3D0001
> [    1.345522] usb usb6: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.346411] usb usb6: Product: OHCI PCI host controller
> [    1.346858] usb usb6: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.347307] usb usb6: SerialNumber: 0000:00:13.1
> [    1.347896] hub 6-0:1.0: USB hub found
> [    1.348335] hub 6-0:1.0: 3 ports detected
> [    1.348937] ohci-pci 0000:00:14.5: OHCI PCI host controller
> [    1.349366] ohci-pci 0000:00:14.5: new USB bus registered, assigned bu=
s
> number 7
> [    1.350231] ohci-pci 0000:00:14.5: irq 18, io mem 0xf9ffa000
> [    1.409109] usb usb7: New USB device found, idVendor=3D1d6b,
> idProduct=3D0001
> [    1.409546] usb usb7: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.410403] usb usb7: Product: OHCI PCI host controller
> [    1.410846] usb usb7: Manufacturer: Linux 3.16.0-38-generic ohci_hcd
> [    1.411294] usb usb7: SerialNumber: 0000:00:14.5
> [    1.411881] hub 7-0:1.0: USB hub found
> [    1.412320] hub 7-0:1.0: 2 ports detected
> [    1.412809] ohci-platform: OHCI generic platform driver
> [    1.413242] uhci_hcd: USB Universal Host Controller Interface driver
> [    1.413734] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.414166] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bu=
s
> number 8
> [    1.415118] xhci_hcd 0000:04:00.0: irq 45 for MSI/MSI-X
> [    1.415165] usb usb8: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002
> [    1.415619] usb usb8: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.416507] usb usb8: Product: xHCI Host Controller
> [    1.416952] usb usb8: Manufacturer: Linux 3.16.0-38-generic xhci_hcd
> [    1.417409] usb usb8: SerialNumber: 0000:04:00.0
> [    1.417980] hub 8-0:1.0: USB hub found
> [    1.418413] hub 8-0:1.0: 4 ports detected
> [    1.418922] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [    1.419346] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bu=
s
> number 9
> [    1.420224] usb usb9: New USB device found, idVendor=3D1d6b,
> idProduct=3D0003
> [    1.420676] usb usb9: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
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
> [    1.445619] rtc_cmos 00:01: setting system clock to 2015-06-11 23:16:5=
1
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
> [    1.499613] ahci 0000:03:00.0: SSS flag set, parallel bus scan disable=
d
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
> [    1.529416] systemd-udevd[147]: renamed network interface eth1 to p10p=
1
> [    1.545433] systemd-udevd[152]: renamed network interface eth0 to p7p1
> [    1.573331] usb 2-2: new high-speed USB device number 2 using ehci-pci
> [    1.685915] ata6.01: ATAPI: HL-DT-STDVD-RAM GSA-H58N, 1.00, max UDMA/6=
6
> [    1.701871] ata6.01: configured for UDMA/66
> [    1.706182] usb 2-2: New USB device found, idVendor=3D0ace, idProduct=
=3D1215
> [    1.706692] usb 2-2: New USB device strings: Mfr=3D16, Product=3D32,
> SerialNumber=3D0
> [    1.707680] usb 2-2: Product: USB2.0 WLAN
> [    1.708165] usb 2-2: Manufacturer: ZyDAS
> [    1.817520] ata1: SATA link down (SStatus 0 SControl 300)
> [    1.818101] ata3: SATA link down (SStatus 0 SControl 300)
> [    1.818587] ata4: SATA link down (SStatus 0 SControl 300)
> [    1.819049] ata2: SATA link down (SStatus 0 SControl 300)
> [    1.821142] scsi 5:0:1:0: CD-ROM            HL-DT-ST DVD-RAM GSA-H58N
> 1.00 PQ: 0 ANSI: 5
> [    1.831872] sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form=
2
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
> [    2.013385] usb 4-1: New USB device found, idVendor=3D04d9, idProduct=
=3D0022
> [    2.013882] usb 4-1: New USB device strings: Mfr=3D0, Product=3D2,
> SerialNumber=3D0
> [    2.014284] usb 4-1: Product: USB Keyboard
> [    2.018348] hidraw: raw HID events driver (C) Jiri Kosina
> [    2.042342] usbcore: registered new interface driver usbhid
> [    2.042763] usbhid: USB HID core driver
> [    2.044476] input: USB Keyboard as
> /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.0/0003:04D9:0022.0001/inp=
ut/input5
> [    2.045444] hid-generic 0003:04D9:0022.0001: input,hidraw0: USB HID
> v1.10 Keyboard [USB Keyboard] on usb-0000:00:12.1-1/input0
> [    2.046435] input: USB Keyboard as
> /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.1/0003:04D9:0022.0002/inp=
ut/input6
> [    2.047461] hid-generic 0003:04D9:0022.0002: input,hidraw1: USB HID
> v1.10 Device [USB Keyboard] on usb-0000:00:12.1-1/input1
> [    2.303673] ata8: SATA link down (SStatus 0 SControl 300)
> [    2.920111] Switched to clocksource tsc
> [    4.382933] floppy0: no floppy controllers found
> [    7.272503] EXT4-fs (sda2): mounted filesystem with ordered data mode.
> Opts: (null)
> [    7.364061] random: init urandom read with 70 bits of entropy availabl=
e
> [    7.388873] init: plymouth-upstart-bridge main process (237) terminate=
d
> with status 1
> [    7.389819] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [    7.394387] init: plymouth-upstart-bridge main process (246) terminate=
d
> with status 1
> [    7.395354] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [    7.399374] init: plymouth-upstart-bridge main process (250) terminate=
d
> with status 1
> [    7.400340] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [    7.402987] init: plymouth-upstart-bridge main process (254) terminate=
d
> with status 1
> [    7.403967] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [    7.495806] Adding 2097148k swap on /dev/sda1.  Priority:-1 extents:1
> across:2097148k SSFS
> [    7.499478] EXT4-fs (sda2): re-mounted. Opts: errors=3Dremount-ro
> [    7.607450] systemd-udevd[399]: starting version 204
> [    7.619836] EXT4-fs (sda3): mounted filesystem with ordered data mode.
> Opts: (null)
> [    7.629983] lp: driver loaded but no devices found
> [    7.637946] ppdev: user-space parallel port driver
> [    7.647449] wmi: Mapper loaded
> [    7.647894] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    7.655187] [drm] Initialized drm 1.1.0 20060810
> [    7.664060] ACPI Warning: SystemIO range
> 0x0000000000000b00-0x0000000000000b07 conflicts with OpRegion
> 0x0000000000000b00-0x0000000000000b0f (\SOR1) (20140424/utaddress-258)
> [    7.664067] ACPI: If an ACPI driver is available for this device, you
> should use it instead of the native driver
> [    7.672812] MCE: In-kernel MCE decoding enabled.
> [    7.674623] EDAC MC: Ver: 3.0.0
> [    7.675757] checking generic (fb000000 130000) vs hw (d0000000 1000000=
0)
> [    7.675759] checking generic (fb000000 130000) vs hw (fa000000 2000000=
)
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
> [    7.764707] sound hdaudioC0D0: autoconfig: line_outs=3D1
> (0x14/0x0/0x0/0x0/0x0) type:line
> [    7.764710] sound hdaudioC0D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x=
0)
> [    7.764712] sound hdaudioC0D0:    hp_outs=3D1 (0x1b/0x0/0x0/0x0/0x0)
> [    7.764713] sound hdaudioC0D0:    mono: mono_out=3D0x0
> [    7.764714] sound hdaudioC0D0:    dig-out=3D0x1e/0x0
> [    7.764715] sound hdaudioC0D0:    inputs:
> [    7.764717] sound hdaudioC0D0:      Front Mic=3D0x19
> [    7.764718] sound hdaudioC0D0:      Rear Mic=3D0x18
> [    7.764719] sound hdaudioC0D0:      Line=3D0x1a
> [    7.777512] input: HDA ATI SB Rear Mic as
> /devices/pci0000:00/0000:00:14.2/sound/card0/input7
> [    7.779263] input: HDA ATI SB Line as
> /devices/pci0000:00/0000:00:14.2/sound/card0/input8
> [    7.779485] input: HDA ATI SB Line Out as
> /devices/pci0000:00/0000:00:14.2/sound/card0/input9
> [    7.784065] nouveau  [  PTHERM][0000:01:00.0] FAN control: none /
> external
> [    7.784077] nouveau  [  PTHERM][0000:01:00.0] fan management: automati=
c
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
> [    7.790697] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013)=
.
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
> [    7.936155] usb 2-2: reset high-speed USB device number 2 using ehci-p=
ci
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
> [    8.465801] vboxdrv: fAsync=3D0 offMin=3D0x529 offMax=3D0x3ee0
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
> [    9.153486] init: plymouth-upstart-bridge main process ended, respawni=
ng
> [    9.407531] wlan0: authenticate with 5a:98:26:49:92:24
> [    9.433096] wlan0: send auth to 5a:98:26:49:92:24 (try 1/3)
> [    9.434594] wlan0: authenticated
> [    9.436876] wlan0: associate with 5a:98:26:49:92:24 (try 1/3)
> [    9.443353] wlan0: RX AssocResp from 5a:98:26:49:92:24 (capab=3D0x411
> status=3D0 aid=3D2)
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
>> ------------------------------------------------------------------------=
-----------------
>>
>> Jun 11 20:16:58 v-caps rsyslogd: [origin software=3D"rsyslogd"
>> swVersion=3D"7.4.4" x-pid=3D"662" x-info=3D"http://www.rsyslog.com"] sta=
rt
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
>> BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro
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
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] DMI: To Be Filled By O.E.M=
.
>> To Be Filled By O.E.M./980DE3/U3S3, BIOS P1.60 05/06/2014
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: update [mem
>> 0x00000000-0x00000fff] usable =3D=3D> reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: remove [mem
>> 0x000a0000-0x000fffff] usable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: No AGP bridge found
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: last_pfn =3D 0x22f00=
0
>> max_arch_pfn =3D 0x400000000
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] MTRR default type:
>> uncachable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] MTRR fixed ranges enabled:
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   00000-9FFFF write-back
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   A0000-EFFFF uncachable
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   F0000-FFFFF write-protec=
t
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
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] x86 PAT enabled: cpu 0, ol=
d
>> 0x7040600070406, new 0x7010600070106
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: update [mem
>> 0xd0000000-0xffffffff] usable =3D=3D> reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: last_pfn =3D 0xcffa0
>> max_arch_pfn =3D 0x400000000
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
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] No NUMA configuration foun=
d
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
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Movable zone start for eac=
h
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
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA zone: 21 pages
>> reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA zone: 3996 pages,
>> LIFO batch:0
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA32 zone: 13247 pages
>> used for memmap
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   DMA32 zone: 847776 pages=
,
>> LIFO batch:31
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   Normal zone: 19392 pages
>> used for memmap
>> Jun 11 20:16:58 v-caps kernel: [    0.000000]   Normal zone: 1241088
>> pages, LIFO batch:31
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: PM-Timer IO Port:
>> 0x808
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: Local APIC address
>> 0xfee00000
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x01]
>> lapic_id[0x10] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x02]
>> lapic_id[0x11] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x03]
>> lapic_id[0x12] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x04]
>> lapic_id[0x13] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x05]
>> lapic_id[0x14] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x06]
>> lapic_id[0x15] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x07]
>> lapic_id[0x16] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x08]
>> lapic_id[0x17] enabled)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: IOAPIC (id[0x18]
>> address[0xfec00000] gsi_base[0])
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] IOAPIC[0]: apic_id 24,
>> version 33, address 0xfec00000, GSI 0-23
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: INT_SRC_OVR (bus 0
>> bus_irq 0 global_irq 2 dfl dfl)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: INT_SRC_OVR (bus 0
>> bus_irq 9 global_irq 9 low level)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: IRQ0 used by overrid=
e.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: IRQ2 used by overrid=
e.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: IRQ9 used by overrid=
e.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Using ACPI (MADT) for SMP
>> configuration information
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] ACPI: HPET id: 0x8300 base=
:
>> 0xfed00000
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] smpboot: Allowing 8 CPUs, =
0
>> hotplug CPUs
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] nr_irqs_gsi: 40
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0x0009d000-0x0009dfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0x0009e000-0x0009ffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0x000a0000-0x000e5fff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0x000e6000-0x000fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0xcffa0000-0xcffaffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0xcffb0000-0xcffdffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0xcffe0000-0xcfffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0xd0000000-0xffdfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0xffe00000-0xffffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] e820: [mem
>> 0xd0000000-0xffdfffff] available for PCI devices
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Booting paravirtualized
>> kernel on bare hardware
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] setup_percpu: NR_CPUS:256
>> nr_cpumask_bits:256 nr_cpu_ids:8 nr_node_ids:1
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PERCPU: Embedded 27
>> pages/cpu @ffff88022ec00000 s81408 r8192 d20992 u262144
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] pcpu-alloc: s81408 r8192
>> d20992 u262144 alloc=3D1*2097152
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] pcpu-alloc: [0] 0 1 2 3 4 =
5
>> 6 7
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Built 1 zonelists in Zone
>> order, mobility grouping on.  Total pages: 2060136
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Policy zone: Normal
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Kernel command line:
>> BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PID hash table entries:
>> 4096 (order: 3, 32768 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] xsave: enabled xstate_bv
>> 0x7, cntxt size 0x340
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: Checking aperture...
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: No AGP bridge found
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: Node 0: aperture [bus
>> addr 0x00000000-0x01ffffff] (32MB)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: Your BIOS doesn't
>> leave a aperture memory hole
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: Please enable the
>> IOMMU option in the BIOS setup
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: This costs you 64MB o=
f
>> RAM
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] AGP: Mapping aperture over
>> RAM [mem 0xc4000000-0xc7ffffff] (65536KB)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] PM: Registered nosave
>> memory: [mem 0xc4000000-0xc7ffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Memory: 8072292K/8371440K
>> available (7626K kernel code, 1131K rwdata, 3596K rodata, 1352K init, 13=
00K
>> bss, 299148K reserved)
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] SLUB: HWalign=3D64,
>> Order=3D0-3, MinObjects=3D0, CPUs=3D8, Nodes=3D1
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Hierarchical RCU
>> implementation.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] RCU dyntick-idle
>> grace-period acceleration is enabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] RCU restricting CPUs from
>> NR_CPUS=3D256 to nr_cpu_ids=3D8.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Offload RCU callbacks from
>> all CPUs
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Offload RCU callbacks from
>> CPUs: 0-7.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] RCU: Adjusting geometry fo=
r
>> rcu_fanout_leaf=3D16, nr_cpu_ids=3D8
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] NR_IRQS:16640 nr_irqs:744 =
16
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] spurious 8259A interrupt:
>> IRQ7.
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] Console: colour dummy
>> device 80x25
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] console [tty0] enabled
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] allocated 33554432 bytes o=
f
>> page_cgroup
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] please try
>> 'cgroup_disable=3Dmemory' option if you don't want memory cgroups
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] hpet clockevent registered
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] tsc: Fast TSC calibration
>> using PIT
>> Jun 11 20:16:58 v-caps kernel: [    0.000000] tsc: Detected 4680.606 MHz
>> processor
>> Jun 11 20:16:58 v-caps kernel: [    0.000020] Calibrating delay loop
>> (skipped), value calculated using timer frequency.. 9361.21 BogoMIPS
>> (lpj=3D18722424)
>> Jun 11 20:16:58 v-caps kernel: [    0.000024] pid_max: default: 32768
>> minimum: 301
>> Jun 11 20:16:58 v-caps kernel: [    0.000031] ACPI: Core revision 201404=
24
>> Jun 11 20:16:58 v-caps kernel: [    0.002757] ACPI: All ACPI Tables
>> successfully acquired
>> Jun 11 20:16:58 v-caps kernel: [    0.011663] Security Framework
>> initialized
>> Jun 11 20:16:58 v-caps kernel: [    0.011684] AppArmor: AppArmor
>> initialized
>> Jun 11 20:16:58 v-caps kernel: [    0.011686] Yama: becoming mindful.
>> Jun 11 20:16:58 v-caps kernel: [    0.012143] Dentry cache hash table
>> entries: 1048576 (order: 11, 8388608 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.014204] Inode-cache hash table
>> entries: 524288 (order: 10, 4194304 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.015161] Mount-cache hash table
>> entries: 16384 (order: 5, 131072 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.015170] Mountpoint-cache hash tabl=
e
>> entries: 16384 (order: 5, 131072 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.015394] Initializing cgroup subsys
>> memory
>> Jun 11 20:16:58 v-caps kernel: [    0.015413] Initializing cgroup subsys
>> devices
>> Jun 11 20:16:58 v-caps kernel: [    0.015419] Initializing cgroup subsys
>> freezer
>> Jun 11 20:16:58 v-caps kernel: [    0.015422] Initializing cgroup subsys
>> net_cls
>> Jun 11 20:16:58 v-caps kernel: [    0.015426] Initializing cgroup subsys
>> blkio
>> Jun 11 20:16:58 v-caps kernel: [    0.015430] Initializing cgroup subsys
>> perf_event
>> Jun 11 20:16:58 v-caps kernel: [    0.015432] Initializing cgroup subsys
>> net_prio
>> Jun 11 20:16:58 v-caps kernel: [    0.015439] Initializing cgroup subsys
>> hugetlb
>> Jun 11 20:16:58 v-caps kernel: [    0.015456] tseg: 0000000000
>> Jun 11 20:16:58 v-caps kernel: [    0.015460] CPU: Physical Processor ID=
:
>> 0
>> Jun 11 20:16:58 v-caps kernel: [    0.015462] CPU: Processor Core ID: 0
>> Jun 11 20:16:58 v-caps kernel: [    0.015464] mce: CPU supports 7 MCE
>> banks
>> Jun 11 20:16:58 v-caps kernel: [    0.015470] LVT offset 1 assigned for
>> vector 0xf9
>> Jun 11 20:16:58 v-caps kernel: [    0.015475] Last level iTLB entries:
>> 4KB 512, 2MB 1024, 4MB 512
>> Jun 11 20:16:58 v-caps kernel: [    0.015475] Last level dTLB entries:
>> 4KB 1024, 2MB 1024, 4MB 512, 1GB 0
>> Jun 11 20:16:58 v-caps kernel: [    0.015475] tlb_flushall_shift: 6
>> Jun 11 20:16:58 v-caps kernel: [    0.015553] Freeing SMP alternatives
>> memory: 32K (ffffffff81e6e000 - ffffffff81e76000)
>> Jun 11 20:16:58 v-caps kernel: [    0.016170] ftrace: allocating 29244
>> entries in 115 pages
>> Jun 11 20:16:58 v-caps kernel: [    0.023710] ..TIMER: vector=3D0x30
>> apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
>> Jun 11 20:16:58 v-caps kernel: [    0.063438] smpboot: CPU0: AMD
>> FX(tm)-8350 Eight-Core Processor (fam: 15, model: 02, stepping: 00)
>> Jun 11 20:16:58 v-caps kernel: [    0.167980] Performance Events: Fam15h
>> core perfctr, AMD PMU driver.
>> Jun 11 20:16:58 v-caps kernel: [    0.167985] ... version:
>>  0
>> Jun 11 20:16:58 v-caps kernel: [    0.167987] ... bit width:
>>  48
>> Jun 11 20:16:58 v-caps kernel: [    0.167988] ... generic registers:
>>  6
>> Jun 11 20:16:58 v-caps kernel: [    0.167990] ... value mask:
>> 0000ffffffffffff
>> Jun 11 20:16:58 v-caps kernel: [    0.167992] ... max period:
>> 00007fffffffffff
>> Jun 11 20:16:58 v-caps kernel: [    0.167993] ... fixed-purpose events:
>> 0
>> Jun 11 20:16:58 v-caps kernel: [    0.167995] ... event mask:
>> 000000000000003f
>> Jun 11 20:16:58 v-caps kernel: [    0.169378] NMI watchdog: enabled on
>> all CPUs, permanently consumes one hw-PMU counter.
>> Jun 11 20:16:58 v-caps kernel: [    0.169445] x86: Booting SMP
>> configuration:
>> Jun 11 20:16:58 v-caps kernel: [    0.169447] .... node  #0, CPUs:
>>  #1 #2 #3 #4 #5 #6 #7
>> Jun 11 20:16:58 v-caps kernel: [    0.261441] x86: Booted up 1 node, 8
>> CPUs
>> Jun 11 20:16:58 v-caps kernel: [    0.261446] smpboot: Total of 8
>> processors activated (74889.69 BogoMIPS)
>> Jun 11 20:16:58 v-caps kernel: [    0.269594] devtmpfs: initialized
>> Jun 11 20:16:58 v-caps kernel: [    0.272590] evm: security.selinux
>> Jun 11 20:16:58 v-caps kernel: [    0.272592] evm: security.SMACK64
>> Jun 11 20:16:58 v-caps kernel: [    0.272594] evm: security.SMACK64EXEC
>> Jun 11 20:16:58 v-caps kernel: [    0.272596] evm:
>> security.SMACK64TRANSMUTE
>> Jun 11 20:16:58 v-caps kernel: [    0.272597] evm: security.SMACK64MMAP
>> Jun 11 20:16:58 v-caps kernel: [    0.272599] evm: security.ima
>> Jun 11 20:16:58 v-caps kernel: [    0.272600] evm: security.capability
>> Jun 11 20:16:58 v-caps kernel: [    0.272651] PM: Registering ACPI NVS
>> region [mem 0xcffb0000-0xcffdffff] (196608 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.273377] pinctrl core: initialized
>> pinctrl subsystem
>> Jun 11 20:16:58 v-caps kernel: [    0.273439] regulator-dummy: no
>> parameters
>> Jun 11 20:16:58 v-caps kernel: [    0.273472] RTC time: 23:16:50, date:
>> 06/11/15
>> Jun 11 20:16:58 v-caps kernel: [    0.273514] NET: Registered protocol
>> family 16
>> Jun 11 20:16:58 v-caps kernel: [    0.273639] cpuidle: using governor
>> ladder
>> Jun 11 20:16:58 v-caps kernel: [    0.273642] cpuidle: using governor me=
nu
>> Jun 11 20:16:58 v-caps kernel: [    0.273705] ACPI: bus type PCI
>> registered
>> Jun 11 20:16:58 v-caps kernel: [    0.273708] acpiphp: ACPI Hot Plug PCI
>> Controller Driver version: 0.5
>> Jun 11 20:16:58 v-caps kernel: [    0.273767] PCI: MMCONFIG for domain
>> 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
>> Jun 11 20:16:58 v-caps kernel: [    0.273771] PCI: not using MMCONFIG
>> Jun 11 20:16:58 v-caps kernel: [    0.273773] PCI: Using configuration
>> type 1 for base access
>> Jun 11 20:16:58 v-caps kernel: [    0.273775] PCI: Using configuration
>> type 1 for extended access
>> Jun 11 20:16:58 v-caps kernel: [    0.274069] mtrr: your CPUs had
>> inconsistent variable MTRR settings
>> Jun 11 20:16:58 v-caps kernel: [    0.274071] mtrr: probably your BIOS
>> does not setup all CPUs.
>> Jun 11 20:16:58 v-caps kernel: [    0.274073] mtrr: corrected
>> configuration.
>> Jun 11 20:16:58 v-caps kernel: [    0.276493] ACPI: Added _OSI(Module
>> Device)
>> Jun 11 20:16:58 v-caps kernel: [    0.276496] ACPI: Added _OSI(Processor
>> Device)
>> Jun 11 20:16:58 v-caps kernel: [    0.276498] ACPI: Added _OSI(3.0 _SCP
>> Extensions)
>> Jun 11 20:16:58 v-caps kernel: [    0.276500] ACPI: Added _OSI(Processor
>> Aggregator Device)
>> Jun 11 20:16:58 v-caps kernel: [    0.278445] ACPI: Executed 3 blocks of
>> module-level executable AML code
>> Jun 11 20:16:58 v-caps kernel: [    0.281893] ACPI: Interpreter enabled
>> Jun 11 20:16:58 v-caps kernel: [    0.281902] ACPI Exception:
>> AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20140424/hwxface-580=
)
>> Jun 11 20:16:58 v-caps kernel: [    0.281918] ACPI: (supports S0 S1 S3 S=
4
>> S5)
>> Jun 11 20:16:58 v-caps kernel: [    0.281920] ACPI: Using IOAPIC for
>> interrupt routing
>> Jun 11 20:16:58 v-caps kernel: [    0.281975] PCI: MMCONFIG for domain
>> 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
>> Jun 11 20:16:58 v-caps kernel: [    0.282810] PCI: MMCONFIG at [mem
>> 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
>> Jun 11 20:16:58 v-caps kernel: [    0.283069] PCI: Using host bridge
>> windows from ACPI; if necessary, use "pci=3Dnocrs" and report a bug
>> Jun 11 20:16:58 v-caps kernel: [    0.288165] ACPI: PCI Root Bridge
>> [PCI0] (domain 0000 [bus 00-ff])
>> Jun 11 20:16:58 v-caps kernel: [    0.288171] acpi PNP0A03:00: _OSC: OS
>> supports [ExtendedConfig ASPM ClockPM Segments MSI]
>> Jun 11 20:16:58 v-caps kernel: [    0.288365] acpi PNP0A03:00: _OSC:
>> platform does not support [PCIeHotplug PME]
>> Jun 11 20:16:58 v-caps kernel: [    0.288550] acpi PNP0A03:00: _OSC: OS
>> now controls [AER PCIeCapability]
>> Jun 11 20:16:58 v-caps kernel: [    0.288835] PCI host bridge to bus
>> 0000:00
>> Jun 11 20:16:58 v-caps kernel: [    0.288838] pci_bus 0000:00: root bus
>> resource [bus 00-ff]
>> Jun 11 20:16:58 v-caps kernel: [    0.288840] pci_bus 0000:00: root bus
>> resource [io  0x0000-0x0cf7]
>> Jun 11 20:16:58 v-caps kernel: [    0.288843] pci_bus 0000:00: root bus
>> resource [io  0x0d00-0xffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.288846] pci_bus 0000:00: root bus
>> resource [mem 0x000a0000-0x000bffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.288848] pci_bus 0000:00: root bus
>> resource [mem 0x000d0000-0x000dffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.288851] pci_bus 0000:00: root bus
>> resource [mem 0xd0000000-0xdfffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.288853] pci_bus 0000:00: root bus
>> resource [mem 0xf0000000-0xfebfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.288863] pci 0000:00:00.0:
>> [1022:9601] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.288955] pci 0000:00:02.0:
>> [1022:9603] type 01 class 0x060400
>> Jun 11 20:16:58 v-caps kernel: [    0.288988] pci 0000:00:02.0: PME#
>> supported from D0 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.289023] pci 0000:00:02.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289059] pci 0000:00:06.0:
>> [1022:9606] type 01 class 0x060400
>> Jun 11 20:16:58 v-caps kernel: [    0.289090] pci 0000:00:06.0: PME#
>> supported from D0 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.289127] pci 0000:00:06.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289159] pci 0000:00:07.0:
>> [1022:9607] type 01 class 0x060400
>> Jun 11 20:16:58 v-caps kernel: [    0.289190] pci 0000:00:07.0: PME#
>> supported from D0 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.289224] pci 0000:00:07.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289257] pci 0000:00:09.0:
>> [1022:9608] type 01 class 0x060400
>> Jun 11 20:16:58 v-caps kernel: [    0.289288] pci 0000:00:09.0: PME#
>> supported from D0 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.289322] pci 0000:00:09.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289353] pci 0000:00:0a.0:
>> [1022:9609] type 01 class 0x060400
>> Jun 11 20:16:58 v-caps kernel: [    0.289383] pci 0000:00:0a.0: PME#
>> supported from D0 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.289417] pci 0000:00:0a.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289463] pci 0000:00:11.0:
>> [1002:4391] type 00 class 0x010601
>> Jun 11 20:16:58 v-caps kernel: [    0.289482] pci 0000:00:11.0: reg 0x10=
:
>> [io  0x9000-0x9007]
>> Jun 11 20:16:58 v-caps kernel: [    0.289491] pci 0000:00:11.0: reg 0x14=
:
>> [io  0x8000-0x8003]
>> Jun 11 20:16:58 v-caps kernel: [    0.289499] pci 0000:00:11.0: reg 0x18=
:
>> [io  0x7000-0x7007]
>> Jun 11 20:16:58 v-caps kernel: [    0.289508] pci 0000:00:11.0: reg 0x1c=
:
>> [io  0x6000-0x6003]
>> Jun 11 20:16:58 v-caps kernel: [    0.289516] pci 0000:00:11.0: reg 0x20=
:
>> [io  0x5000-0x500f]
>> Jun 11 20:16:58 v-caps kernel: [    0.289525] pci 0000:00:11.0: reg 0x24=
:
>> [mem 0xf9fffc00-0xf9ffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.289622] pci 0000:00:12.0:
>> [1002:4397] type 00 class 0x0c0310
>> Jun 11 20:16:58 v-caps kernel: [    0.289635] pci 0000:00:12.0: reg 0x10=
:
>> [mem 0xf9ffe000-0xf9ffefff]
>> Jun 11 20:16:58 v-caps kernel: [    0.289715] pci 0000:00:12.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289748] pci 0000:00:12.1:
>> [1002:4398] type 00 class 0x0c0310
>> Jun 11 20:16:58 v-caps kernel: [    0.289760] pci 0000:00:12.1: reg 0x10=
:
>> [mem 0xf9ffd000-0xf9ffdfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.289841] pci 0000:00:12.1: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.289879] pci 0000:00:12.2:
>> [1002:4396] type 00 class 0x0c0320
>> Jun 11 20:16:58 v-caps kernel: [    0.289896] pci 0000:00:12.2: reg 0x10=
:
>> [mem 0xf9fff800-0xf9fff8ff]
>> Jun 11 20:16:58 v-caps kernel: [    0.289973] pci 0000:00:12.2: supports
>> D1 D2
>> Jun 11 20:16:58 v-caps kernel: [    0.289974] pci 0000:00:12.2: PME#
>> supported from D0 D1 D2 D3hot
>> Jun 11 20:16:58 v-caps kernel: [    0.290012] pci 0000:00:12.2: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.290050] pci 0000:00:13.0:
>> [1002:4397] type 00 class 0x0c0310
>> Jun 11 20:16:58 v-caps kernel: [    0.290062] pci 0000:00:13.0: reg 0x10=
:
>> [mem 0xf9ffc000-0xf9ffcfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.290143] pci 0000:00:13.0: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.290175] pci 0000:00:13.1:
>> [1002:4398] type 00 class 0x0c0310
>> Jun 11 20:16:58 v-caps kernel: [    0.290187] pci 0000:00:13.1: reg 0x10=
:
>> [mem 0xf9ffb000-0xf9ffbfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.290269] pci 0000:00:13.1: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.290306] pci 0000:00:13.2:
>> [1002:4396] type 00 class 0x0c0320
>> Jun 11 20:16:58 v-caps kernel: [    0.290324] pci 0000:00:13.2: reg 0x10=
:
>> [mem 0xf9fff400-0xf9fff4ff]
>> Jun 11 20:16:58 v-caps kernel: [    0.290400] pci 0000:00:13.2: supports
>> D1 D2
>> Jun 11 20:16:58 v-caps kernel: [    0.290401] pci 0000:00:13.2: PME#
>> supported from D0 D1 D2 D3hot
>> Jun 11 20:16:58 v-caps kernel: [    0.290440] pci 0000:00:13.2: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.290481] pci 0000:00:14.0:
>> [1002:4385] type 00 class 0x0c0500
>> Jun 11 20:16:58 v-caps kernel: [    0.290619] pci 0000:00:14.1:
>> [1002:439c] type 00 class 0x01018a
>> Jun 11 20:16:58 v-caps kernel: [    0.290634] pci 0000:00:14.1: reg 0x10=
:
>> [io  0x0000-0x0007]
>> Jun 11 20:16:58 v-caps kernel: [    0.290642] pci 0000:00:14.1: reg 0x14=
:
>> [io  0x0000-0x0003]
>> Jun 11 20:16:58 v-caps kernel: [    0.290650] pci 0000:00:14.1: reg 0x18=
:
>> [io  0x0000-0x0007]
>> Jun 11 20:16:58 v-caps kernel: [    0.290658] pci 0000:00:14.1: reg 0x1c=
:
>> [io  0x0000-0x0003]
>> Jun 11 20:16:58 v-caps kernel: [    0.290667] pci 0000:00:14.1: reg 0x20=
:
>> [io  0xff00-0xff0f]
>> Jun 11 20:16:58 v-caps kernel: [    0.290685] pci 0000:00:14.1: legacy
>> IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
>> Jun 11 20:16:58 v-caps kernel: [    0.290688] pci 0000:00:14.1: legacy
>> IDE quirk: reg 0x14: [io  0x03f6]
>> Jun 11 20:16:58 v-caps kernel: [    0.290690] pci 0000:00:14.1: legacy
>> IDE quirk: reg 0x18: [io  0x0170-0x0177]
>> Jun 11 20:16:58 v-caps kernel: [    0.290692] pci 0000:00:14.1: legacy
>> IDE quirk: reg 0x1c: [io  0x0376]
>> Jun 11 20:16:58 v-caps kernel: [    0.290775] pci 0000:00:14.2:
>> [1002:4383] type 00 class 0x040300
>> Jun 11 20:16:58 v-caps kernel: [    0.290795] pci 0000:00:14.2: reg 0x10=
:
>> [mem 0xf9ff4000-0xf9ff7fff 64bit]
>> Jun 11 20:16:58 v-caps kernel: [    0.290856] pci 0000:00:14.2: PME#
>> supported from D0 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.290891] pci 0000:00:14.2: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.290924] pci 0000:00:14.3:
>> [1002:439d] type 00 class 0x060100
>> Jun 11 20:16:58 v-caps kernel: [    0.291040] pci 0000:00:14.4:
>> [1002:4384] type 01 class 0x060401
>> Jun 11 20:16:58 v-caps kernel: [    0.291100] pci 0000:00:14.4: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.291132] pci 0000:00:14.5:
>> [1002:4399] type 00 class 0x0c0310
>> Jun 11 20:16:58 v-caps kernel: [    0.291144] pci 0000:00:14.5: reg 0x10=
:
>> [mem 0xf9ffa000-0xf9ffafff]
>> Jun 11 20:16:58 v-caps kernel: [    0.291226] pci 0000:00:14.5: System
>> wakeup disabled by ACPI
>> Jun 11 20:16:58 v-caps kernel: [    0.291261] pci 0000:00:18.0:
>> [1022:1600] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.291323] pci 0000:00:18.1:
>> [1022:1601] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.291378] pci 0000:00:18.2:
>> [1022:1602] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.291435] pci 0000:00:18.3:
>> [1022:1603] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.291495] pci 0000:00:18.4:
>> [1022:1604] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.291550] pci 0000:00:18.5:
>> [1022:1605] type 00 class 0x060000
>> Jun 11 20:16:58 v-caps kernel: [    0.291651] pci 0000:01:00.0:
>> [10de:0a65] type 00 class 0x030000
>> Jun 11 20:16:58 v-caps kernel: [    0.291661] pci 0000:01:00.0: reg 0x10=
:
>> [mem 0xfd000000-0xfdffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.291671] pci 0000:01:00.0: reg 0x14=
:
>> [mem 0xd0000000-0xdfffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.291680] pci 0000:01:00.0: reg 0x1c=
:
>> [mem 0xfa000000-0xfbffffff 64bit]
>> Jun 11 20:16:58 v-caps kernel: [    0.291686] pci 0000:01:00.0: reg 0x24=
:
>> [io  0xa800-0xa87f]
>> Jun 11 20:16:58 v-caps kernel: [    0.291692] pci 0000:01:00.0: reg 0x30=
:
>> [mem 0xfe8e0000-0xfe8fffff pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.296100] pci 0000:00:02.0: PCI
>> bridge to [bus 01]
>> Jun 11 20:16:58 v-caps kernel: [    0.296105] pci 0000:00:02.0:   bridge
>> window [io  0xa000-0xafff]
>> Jun 11 20:16:58 v-caps kernel: [    0.296107] pci 0000:00:02.0:   bridge
>> window [mem 0xfa000000-0xfe8fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.296109] pci 0000:00:02.0:   bridge
>> window [mem 0xd0000000-0xdfffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.296156] pci 0000:02:00.0:
>> [10ec:8168] type 00 class 0x020000
>> Jun 11 20:16:58 v-caps kernel: [    0.296170] pci 0000:02:00.0: reg 0x10=
:
>> [io  0xb800-0xb8ff]
>> Jun 11 20:16:58 v-caps kernel: [    0.296189] pci 0000:02:00.0: reg 0x18=
:
>> [mem 0xfe9ff000-0xfe9fffff 64bit]
>> Jun 11 20:16:58 v-caps kernel: [    0.296201] pci 0000:02:00.0: reg 0x20=
:
>> [mem 0xf8efc000-0xf8efffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.296263] pci 0000:02:00.0: supports
>> D1 D2
>> Jun 11 20:16:58 v-caps kernel: [    0.296264] pci 0000:02:00.0: PME#
>> supported from D0 D1 D2 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.304108] pci 0000:00:06.0: PCI
>> bridge to [bus 02]
>> Jun 11 20:16:58 v-caps kernel: [    0.304112] pci 0000:00:06.0:   bridge
>> window [io  0xb000-0xbfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.304114] pci 0000:00:06.0:   bridge
>> window [mem 0xfe900000-0xfe9fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.304117] pci 0000:00:06.0:   bridge
>> window [mem 0xf8e00000-0xf8efffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.304162] pci 0000:03:00.0:
>> [1b21:0612] type 00 class 0x010601
>> Jun 11 20:16:58 v-caps kernel: [    0.304174] pci 0000:03:00.0: reg 0x10=
:
>> [io  0xd800-0xd807]
>> Jun 11 20:16:58 v-caps kernel: [    0.304181] pci 0000:03:00.0: reg 0x14=
:
>> [io  0xd400-0xd403]
>> Jun 11 20:16:58 v-caps kernel: [    0.304188] pci 0000:03:00.0: reg 0x18=
:
>> [io  0xd000-0xd007]
>> Jun 11 20:16:58 v-caps kernel: [    0.304195] pci 0000:03:00.0: reg 0x1c=
:
>> [io  0xc800-0xc803]
>> Jun 11 20:16:58 v-caps kernel: [    0.304202] pci 0000:03:00.0: reg 0x20=
:
>> [io  0xc400-0xc41f]
>> Jun 11 20:16:58 v-caps kernel: [    0.304209] pci 0000:03:00.0: reg 0x24=
:
>> [mem 0xfeaffc00-0xfeaffdff]
>> Jun 11 20:16:58 v-caps kernel: [    0.312113] pci 0000:00:07.0: PCI
>> bridge to [bus 03]
>> Jun 11 20:16:58 v-caps kernel: [    0.312118] pci 0000:00:07.0:   bridge
>> window [io  0xc000-0xdfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.312119] pci 0000:00:07.0:   bridge
>> window [mem 0xfea00000-0xfeafffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.312166] pci 0000:04:00.0:
>> [1b6f:7052] type 00 class 0x0c0330
>> Jun 11 20:16:58 v-caps kernel: [    0.312184] pci 0000:04:00.0: reg 0x10=
:
>> [mem 0xfebf8000-0xfebfffff 64bit]
>> Jun 11 20:16:58 v-caps kernel: [    0.312263] pci 0000:04:00.0: supports
>> D1 D2
>> Jun 11 20:16:58 v-caps kernel: [    0.312265] pci 0000:04:00.0: PME#
>> supported from D0 D1 D2 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.320122] pci 0000:00:09.0: PCI
>> bridge to [bus 04]
>> Jun 11 20:16:58 v-caps kernel: [    0.320128] pci 0000:00:09.0:   bridge
>> window [mem 0xfeb00000-0xfebfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.320173] pci 0000:05:00.0:
>> [10ec:8168] type 00 class 0x020000
>> Jun 11 20:16:58 v-caps kernel: [    0.320187] pci 0000:05:00.0: reg 0x10=
:
>> [io  0xe800-0xe8ff]
>> Jun 11 20:16:58 v-caps kernel: [    0.320206] pci 0000:05:00.0: reg 0x18=
:
>> [mem 0xf8fff000-0xf8ffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.320218] pci 0000:05:00.0: reg 0x20=
:
>> [mem 0xf8ff8000-0xf8ffbfff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.320279] pci 0000:05:00.0: supports
>> D1 D2
>> Jun 11 20:16:58 v-caps kernel: [    0.320280] pci 0000:05:00.0: PME#
>> supported from D0 D1 D2 D3hot D3cold
>> Jun 11 20:16:58 v-caps kernel: [    0.328130] pci 0000:00:0a.0: PCI
>> bridge to [bus 05]
>> Jun 11 20:16:58 v-caps kernel: [    0.328134] pci 0000:00:0a.0:   bridge
>> window [io  0xe000-0xefff]
>> Jun 11 20:16:58 v-caps kernel: [    0.328138] pci 0000:00:0a.0:   bridge
>> window [mem 0xf8f00000-0xf8ffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.328209] pci 0000:00:14.4: PCI
>> bridge to [bus 06] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328219] pci 0000:00:14.4:   bridge
>> window [io  0x0000-0x0cf7] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328220] pci 0000:00:14.4:   bridge
>> window [io  0x0d00-0xffff] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328221] pci 0000:00:14.4:   bridge
>> window [mem 0x000a0000-0x000bffff] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328223] pci 0000:00:14.4:   bridge
>> window [mem 0x000d0000-0x000dffff] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328224] pci 0000:00:14.4:   bridge
>> window [mem 0xd0000000-0xdfffffff] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328225] pci 0000:00:14.4:   bridge
>> window [mem 0xf0000000-0xfebfffff] (subtractive decode)
>> Jun 11 20:16:58 v-caps kernel: [    0.328246] pci_bus 0000:00: on NUMA
>> node 0
>> Jun 11 20:16:58 v-caps kernel: [    0.328858] ACPI: PCI Interrupt Link
>> [LNKA] (IRQs 4 7 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.328900] ACPI: PCI Interrupt Link
>> [LNKB] (IRQs 4 7 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.328942] ACPI: PCI Interrupt Link
>> [LNKC] (IRQs 10 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.328981] ACPI: PCI Interrupt Link
>> [LNKD] (IRQs 4 7 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.329021] ACPI: PCI Interrupt Link
>> [LNKE] (IRQs 4 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.329061] ACPI: PCI Interrupt Link
>> [LNKF] (IRQs 4 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.329101] ACPI: PCI Interrupt Link
>> [LNKG] (IRQs 4 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.329143] ACPI: PCI Interrupt Link
>> [LNKH] (IRQs 4 7 10 11 12 14 15) *0, disabled.
>> Jun 11 20:16:58 v-caps kernel: [    0.329200] ACPI: Enabled 1 GPEs in
>> block 00 to 1F
>> Jun 11 20:16:58 v-caps kernel: [    0.329282] vgaarb: setting as boot
>> device: PCI:0000:01:00.0
>> Jun 11 20:16:58 v-caps kernel: [    0.329285] vgaarb: device added:
>> PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
>> Jun 11 20:16:58 v-caps kernel: [    0.329288] vgaarb: loaded
>> Jun 11 20:16:58 v-caps kernel: [    0.329290] vgaarb: bridge control
>> possible 0000:01:00.0
>> Jun 11 20:16:58 v-caps kernel: [    0.329498] SCSI subsystem initialized
>> Jun 11 20:16:58 v-caps kernel: [    0.329545] libata version 3.00 loaded=
.
>> Jun 11 20:16:58 v-caps kernel: [    0.329567] ACPI: bus type USB
>> registered
>> Jun 11 20:16:58 v-caps kernel: [    0.329583] usbcore: registered new
>> interface driver usbfs
>> Jun 11 20:16:58 v-caps kernel: [    0.329592] usbcore: registered new
>> interface driver hub
>> Jun 11 20:16:58 v-caps kernel: [    0.329612] usbcore: registered new
>> device driver usb
>> Jun 11 20:16:58 v-caps kernel: [    0.329737] PCI: Using ACPI for IRQ
>> routing
>> Jun 11 20:16:58 v-caps kernel: [    0.337703] PCI: pci_cache_line_size
>> set to 64 bytes
>> Jun 11 20:16:58 v-caps kernel: [    0.337758] e820: reserve RAM buffer
>> [mem 0x0009dc00-0x0009ffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.337759] e820: reserve RAM buffer
>> [mem 0xcffa0000-0xcfffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.337760] e820: reserve RAM buffer
>> [mem 0x22f000000-0x22fffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.337848] NetLabel: Initializing
>> Jun 11 20:16:58 v-caps kernel: [    0.337849] NetLabel:  domain hash siz=
e
>> =3D 128
>> Jun 11 20:16:58 v-caps kernel: [    0.337851] NetLabel:  protocols =3D
>> UNLABELED CIPSOv4
>> Jun 11 20:16:58 v-caps kernel: [    0.337861] NetLabel:  unlabeled
>> traffic allowed by default
>> Jun 11 20:16:58 v-caps kernel: [    0.337907] hpet0: at MMIO 0xfed00000,
>> IRQs 2, 8, 0, 0
>> Jun 11 20:16:58 v-caps kernel: [    0.337912] hpet0: 4 comparators,
>> 32-bit 14.318180 MHz counter
>> Jun 11 20:16:58 v-caps kernel: [    0.339983] Switched to clocksource hp=
et
>> Jun 11 20:16:58 v-caps kernel: [    0.345803] AppArmor: AppArmor
>> Filesystem Enabled
>> Jun 11 20:16:58 v-caps kernel: [    0.345823] pnp: PnP ACPI init
>> Jun 11 20:16:58 v-caps kernel: [    0.345835] ACPI: bus type PNP
>> registered
>> Jun 11 20:16:58 v-caps kernel: [    0.345949] system 00:00: Plug and Pla=
y
>> ACPI device, IDs PNP0c02 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.345997] pnp 00:01: Plug and Play
>> ACPI device, IDs PNP0b00 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.346391] system 00:02: [mem
>> 0xfec00000-0xfec00fff] could not be reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346394] system 00:02: [mem
>> 0xfee00000-0xfee00fff] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346397] system 00:02: Plug and Pla=
y
>> ACPI device, IDs PNP0c02 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.346596] system 00:03: [io
>>  0x04d0-0x04d1] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346599] system 00:03: [io  0x040b]
>> has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346602] system 00:03: [io  0x04d6]
>> has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346605] system 00:03: [io
>>  0x0c00-0x0c01] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346607] system 00:03: [io  0x0c14]
>> has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346610] system 00:03: [io
>>  0x0c50-0x0c51] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346613] system 00:03: [io  0x0c52]
>> has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346615] system 00:03: [io  0x0c6c]
>> has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346618] system 00:03: [io  0x0c6f]
>> has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346620] system 00:03: [io
>>  0x0cd0-0x0cd1] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346623] system 00:03: [io
>>  0x0cd2-0x0cd3] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346626] system 00:03: [io
>>  0x0cd4-0x0cd5] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346628] system 00:03: [io
>>  0x0cd6-0x0cd7] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346631] system 00:03: [io
>>  0x0cd8-0x0cdf] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346634] system 00:03: [io
>>  0x0800-0x089f] could not be reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346636] system 00:03: [io
>>  0x0b00-0x0b0f] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346639] system 00:03: [io
>>  0x0b20-0x0b3f] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346642] system 00:03: [io
>>  0x0900-0x090f] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346644] system 00:03: [io
>>  0x0910-0x091f] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346647] system 00:03: [io
>>  0xfe00-0xfefe] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346650] system 00:03: [mem
>> 0xffb80000-0xffbfffff] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346653] system 00:03: [mem
>> 0xfec10000-0xfec1001f] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346656] system 00:03: Plug and Pla=
y
>> ACPI device, IDs PNP0c02 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.346855] pnp 00:04: [dma 0 disabled=
]
>> Jun 11 20:16:58 v-caps kernel: [    0.346903] pnp 00:04: Plug and Play
>> ACPI device, IDs PNP0501 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.346983] system 00:05: [io
>>  0x0290-0x029f] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.346986] system 00:05: Plug and Pla=
y
>> ACPI device, IDs PNP0c02 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.347038] system 00:06: [mem
>> 0xe0000000-0xefffffff] has been reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.347041] system 00:06: Plug and Pla=
y
>> ACPI device, IDs PNP0c02 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.347225] system 00:07: [mem
>> 0x00000000-0x0009ffff] could not be reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.347228] system 00:07: [mem
>> 0x000e0000-0x000fffff] could not be reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.347231] system 00:07: [mem
>> 0x00100000-0xcfffffff] could not be reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.347234] system 00:07: [mem
>> 0xfec00000-0xffffffff] could not be reserved
>> Jun 11 20:16:58 v-caps kernel: [    0.347237] system 00:07: Plug and Pla=
y
>> ACPI device, IDs PNP0c01 (active)
>> Jun 11 20:16:58 v-caps kernel: [    0.347320] pnp: PnP ACPI: found 8
>> devices
>> Jun 11 20:16:58 v-caps kernel: [    0.347322] ACPI: bus type PNP
>> unregistered
>> Jun 11 20:16:58 v-caps kernel: [    0.353807] pci 0000:00:02.0: PCI
>> bridge to [bus 01]
>> Jun 11 20:16:58 v-caps kernel: [    0.353810] pci 0000:00:02.0:   bridge
>> window [io  0xa000-0xafff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353814] pci 0000:00:02.0:   bridge
>> window [mem 0xfa000000-0xfe8fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353817] pci 0000:00:02.0:   bridge
>> window [mem 0xd0000000-0xdfffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.353822] pci 0000:00:06.0: PCI
>> bridge to [bus 02]
>> Jun 11 20:16:58 v-caps kernel: [    0.353824] pci 0000:00:06.0:   bridge
>> window [io  0xb000-0xbfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353828] pci 0000:00:06.0:   bridge
>> window [mem 0xfe900000-0xfe9fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353831] pci 0000:00:06.0:   bridge
>> window [mem 0xf8e00000-0xf8efffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.353835] pci 0000:00:07.0: PCI
>> bridge to [bus 03]
>> Jun 11 20:16:58 v-caps kernel: [    0.353838] pci 0000:00:07.0:   bridge
>> window [io  0xc000-0xdfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353841] pci 0000:00:07.0:   bridge
>> window [mem 0xfea00000-0xfeafffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353846] pci 0000:00:09.0: PCI
>> bridge to [bus 04]
>> Jun 11 20:16:58 v-caps kernel: [    0.353849] pci 0000:00:09.0:   bridge
>> window [mem 0xfeb00000-0xfebfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353853] pci 0000:00:0a.0: PCI
>> bridge to [bus 05]
>> Jun 11 20:16:58 v-caps kernel: [    0.353856] pci 0000:00:0a.0:   bridge
>> window [io  0xe000-0xefff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353860] pci 0000:00:0a.0:   bridge
>> window [mem 0xf8f00000-0xf8ffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.353864] pci 0000:00:14.4: PCI
>> bridge to [bus 06]
>> Jun 11 20:16:58 v-caps kernel: [    0.353876] pci_bus 0000:00: resource =
4
>> [io  0x0000-0x0cf7]
>> Jun 11 20:16:58 v-caps kernel: [    0.353877] pci_bus 0000:00: resource =
5
>> [io  0x0d00-0xffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353878] pci_bus 0000:00: resource =
6
>> [mem 0x000a0000-0x000bffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353880] pci_bus 0000:00: resource =
7
>> [mem 0x000d0000-0x000dffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353881] pci_bus 0000:00: resource =
8
>> [mem 0xd0000000-0xdfffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353882] pci_bus 0000:00: resource =
9
>> [mem 0xf0000000-0xfebfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353883] pci_bus 0000:01: resource =
0
>> [io  0xa000-0xafff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353885] pci_bus 0000:01: resource =
1
>> [mem 0xfa000000-0xfe8fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353886] pci_bus 0000:01: resource =
2
>> [mem 0xd0000000-0xdfffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.353887] pci_bus 0000:02: resource =
0
>> [io  0xb000-0xbfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353888] pci_bus 0000:02: resource =
1
>> [mem 0xfe900000-0xfe9fffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353889] pci_bus 0000:02: resource =
2
>> [mem 0xf8e00000-0xf8efffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.353891] pci_bus 0000:03: resource =
0
>> [io  0xc000-0xdfff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353892] pci_bus 0000:03: resource =
1
>> [mem 0xfea00000-0xfeafffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353893] pci_bus 0000:04: resource =
1
>> [mem 0xfeb00000-0xfebfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353894] pci_bus 0000:05: resource =
0
>> [io  0xe000-0xefff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353896] pci_bus 0000:05: resource =
2
>> [mem 0xf8f00000-0xf8ffffff 64bit pref]
>> Jun 11 20:16:58 v-caps kernel: [    0.353897] pci_bus 0000:06: resource =
4
>> [io  0x0000-0x0cf7]
>> Jun 11 20:16:58 v-caps kernel: [    0.353898] pci_bus 0000:06: resource =
5
>> [io  0x0d00-0xffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353899] pci_bus 0000:06: resource =
6
>> [mem 0x000a0000-0x000bffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353900] pci_bus 0000:06: resource =
7
>> [mem 0x000d0000-0x000dffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353902] pci_bus 0000:06: resource =
8
>> [mem 0xd0000000-0xdfffffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353903] pci_bus 0000:06: resource =
9
>> [mem 0xf0000000-0xfebfffff]
>> Jun 11 20:16:58 v-caps kernel: [    0.353923] NET: Registered protocol
>> family 2
>> Jun 11 20:16:58 v-caps kernel: [    0.354110] TCP established hash table
>> entries: 65536 (order: 7, 524288 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.354288] TCP bind hash table
>> entries: 65536 (order: 8, 1048576 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.354512] TCP: Hash tables configure=
d
>> (established 65536 bind 65536)
>> Jun 11 20:16:58 v-caps kernel: [    0.354544] TCP: reno registered
>> Jun 11 20:16:58 v-caps kernel: [    0.354554] UDP hash table entries:
>> 4096 (order: 5, 131072 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.354595] UDP-Lite hash table
>> entries: 4096 (order: 5, 131072 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    0.354661] NET: Registered protocol
>> family 1
>> Jun 11 20:16:58 v-caps kernel: [    0.800566] pci 0000:01:00.0: Video
>> device with shadowed ROM
>> Jun 11 20:16:58 v-caps kernel: [    0.800712] PCI: CLS 64 bytes, default
>> 64
>> Jun 11 20:16:58 v-caps kernel: [    0.800769] Trying to unpack rootfs
>> image as initramfs...
>> Jun 11 20:16:58 v-caps kernel: [    1.010395] Freeing initrd memory:
>> 19124K (ffff880035a96000 - ffff880036d43000)
>> Jun 11 20:16:58 v-caps kernel: [    1.010691] PCI-DMA: Disabling AGP.
>> Jun 11 20:16:58 v-caps kernel: [    1.010769] PCI-DMA: aperture base @
>> c4000000 size 65536 KB
>> Jun 11 20:16:58 v-caps kernel: [    1.010771] PCI-DMA: using GART IOMMU.
>> Jun 11 20:16:58 v-caps kernel: [    1.010774] PCI-DMA: Reserving 64MB of
>> IOMMU area in the AGP aperture
>> Jun 11 20:16:58 v-caps kernel: [    1.014431] perf: AMD NB counters
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.014496] microcode: CPU0:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014503] microcode: CPU1:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014513] microcode: CPU2:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014523] microcode: CPU3:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014533] microcode: CPU4:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014544] microcode: CPU5:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014553] microcode: CPU6:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014564] microcode: CPU7:
>> patch_level=3D0x06000817
>> Jun 11 20:16:58 v-caps kernel: [    1.014613] microcode: Microcode Updat=
e
>> Driver: v2.00 <tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
>> Jun 11 20:16:58 v-caps kernel: [    1.014619] LVT offset 0 assigned for
>> vector 0x400
>> Jun 11 20:16:58 v-caps kernel: [    1.014639] perf: AMD IBS detected
>> (0x000000ff)
>> Jun 11 20:16:58 v-caps kernel: [    1.014657] Scanning for low memory
>> corruption every 60 seconds
>> Jun 11 20:16:58 v-caps kernel: [    1.014968] futex hash table entries:
>> 2048 (order: 5, 131072 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    1.014992] Initialise system trusted
>> keyring
>> Jun 11 20:16:58 v-caps kernel: [    1.015010] audit: initializing netlin=
k
>> subsys (disabled)
>> Jun 11 20:16:58 v-caps kernel: [    1.015024] audit: type=3D2000
>> audit(1434064609.896:1): initialized
>> Jun 11 20:16:58 v-caps kernel: [    1.015292] HugeTLB registered 2 MB
>> page size, pre-allocated 0 pages
>> Jun 11 20:16:58 v-caps kernel: [    1.016720] zpool: loaded
>> Jun 11 20:16:58 v-caps kernel: [    1.016723] zbud: loaded
>> Jun 11 20:16:58 v-caps kernel: [    1.016845] VFS: Disk quotas dquot_6.5=
.2
>> Jun 11 20:16:58 v-caps kernel: [    1.016876] Dquot-cache hash table
>> entries: 512 (order 0, 4096 bytes)
>> Jun 11 20:16:58 v-caps kernel: [    1.017318] fuse init (API version 7.2=
3)
>> Jun 11 20:16:58 v-caps kernel: [    1.017394] msgmni has been set to 159=
32
>> Jun 11 20:16:58 v-caps kernel: [    1.017442] Key type big_key registere=
d
>> Jun 11 20:16:58 v-caps kernel: [    1.017828] Key type asymmetric
>> registered
>> Jun 11 20:16:58 v-caps kernel: [    1.017831] Asymmetric key parser
>> 'x509' registered
>> Jun 11 20:16:58 v-caps kernel: [    1.017862] Block layer SCSI generic
>> (bsg) driver version 0.4 loaded (major 252)
>> Jun 11 20:16:58 v-caps kernel: [    1.017915] io scheduler noop register=
ed
>> Jun 11 20:16:58 v-caps kernel: [    1.017918] io scheduler deadline
>> registered (default)
>> Jun 11 20:16:58 v-caps kernel: [    1.017960] io scheduler cfq registere=
d
>> Jun 11 20:16:58 v-caps kernel: [    1.018161] pcieport 0000:00:02.0: irq
>> 40 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.018295] pcieport 0000:00:06.0: irq
>> 41 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.018422] pcieport 0000:00:07.0: irq
>> 42 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.018463] pcieport 0000:00:09.0: irq
>> 43 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.018590] pcieport 0000:00:0a.0: irq
>> 44 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.018646] pci_hotplug: PCI Hot Plug
>> PCI Core version: 0.5
>> Jun 11 20:16:58 v-caps kernel: [    1.018661] pciehp: PCI Express Hot
>> Plug Controller Driver version: 0.4
>> Jun 11 20:16:58 v-caps kernel: [    1.018704] vesafb: mode is 640x480x32=
,
>> linelength=3D2560, pages=3D0
>> Jun 11 20:16:58 v-caps kernel: [    1.018706] vesafb: scrolling: redraw
>> Jun 11 20:16:58 v-caps kernel: [    1.018708] vesafb: Truecolor:
>> size=3D8:8:8:8, shift=3D24:16:8:0
>> Jun 11 20:16:58 v-caps kernel: [    1.026887] vesafb: framebuffer at
>> 0xfb000000, mapped to 0xffffc90010e80000, using 1216k, total 1216k
>> Jun 11 20:16:58 v-caps kernel: [    1.027623] Console: switching to
>> colour frame buffer device 80x30
>> Jun 11 20:16:58 v-caps kernel: [    1.028274] fb0: VESA VGA frame buffer
>> device
>> Jun 11 20:16:58 v-caps kernel: [    1.028370] input: Power Button as
>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
>> Jun 11 20:16:58 v-caps kernel: [    1.028398] ACPI: Power Button [PWRB]
>> Jun 11 20:16:58 v-caps kernel: [    1.028444] input: Power Button as
>> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
>> Jun 11 20:16:58 v-caps kernel: [    1.029305] ACPI: Power Button [PWRF]
>> Jun 11 20:16:58 v-caps kernel: [    1.029779] ACPI: acpi_idle registered
>> with cpuidle
>> Jun 11 20:16:58 v-caps kernel: [    1.030211] GHES: HEST is not enabled!
>> Jun 11 20:16:58 v-caps kernel: [    1.030719] Serial: 8250/16550 driver,
>> 32 ports, IRQ sharing enabled
>> Jun 11 20:16:58 v-caps kernel: [    1.051604] 00:04: ttyS0 at I/O 0x3f8
>> (irq =3D 4, base_baud =3D 115200) is a 16550A
>> Jun 11 20:16:58 v-caps kernel: [    1.054011] Linux agpgart interface
>> v0.103
>> Jun 11 20:16:58 v-caps kernel: [    1.055645] brd: module loaded
>> Jun 11 20:16:58 v-caps kernel: [    1.056690] loop: module loaded
>> Jun 11 20:16:58 v-caps kernel: [    1.057325] libphy: Fixed MDIO Bus:
>> probed
>> Jun 11 20:16:58 v-caps kernel: [    1.057761] tun: Universal TUN/TAP
>> device driver, 1.6
>> Jun 11 20:16:58 v-caps kernel: [    1.058190] tun: (C) 1999-2004 Max
>> Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
>> Jun 11 20:16:58 v-caps kernel: [    1.058676] PPP generic driver version
>> 2.4.2
>> Jun 11 20:16:58 v-caps kernel: [    1.059153] ehci_hcd: USB 2.0
>> 'Enhanced' Host Controller (EHCI) Driver
>> Jun 11 20:16:58 v-caps kernel: [    1.059606] ehci-pci: EHCI PCI platfor=
m
>> driver
>> Jun 11 20:16:58 v-caps kernel: [    1.060181] ehci-pci 0000:00:12.2: EHC=
I
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.060640] ehci-pci 0000:00:12.2: new
>> USB bus registered, assigned bus number 1
>> Jun 11 20:16:58 v-caps kernel: [    1.061560] ehci-pci 0000:00:12.2:
>> applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
>> Jun 11 20:16:58 v-caps kernel: [    1.062496] ehci-pci 0000:00:12.2:
>> debug port 1
>> Jun 11 20:16:58 v-caps kernel: [    1.062998] ehci-pci 0000:00:12.2: irq
>> 17, io mem 0xf9fff800
>> Jun 11 20:16:58 v-caps kernel: [    1.072731] ehci-pci 0000:00:12.2: USB
>> 2.0 started, EHCI 1.00
>> Jun 11 20:16:58 v-caps kernel: [    1.073227] usb usb1: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0002
>> Jun 11 20:16:58 v-caps kernel: [    1.073681] usb usb1: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.074551] usb usb1: Product: EHCI
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.074973] usb usb1: Manufacturer:
>> Linux 3.16.0-38-generic ehci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.075404] usb usb1: SerialNumber:
>> 0000:00:12.2
>> Jun 11 20:16:58 v-caps kernel: [    1.075971] hub 1-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.076402] hub 1-0:1.0: 6 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.077091] ehci-pci 0000:00:13.2: EHC=
I
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.077521] ehci-pci 0000:00:13.2: new
>> USB bus registered, assigned bus number 2
>> Jun 11 20:16:58 v-caps kernel: [    1.078364] ehci-pci 0000:00:13.2:
>> applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
>> Jun 11 20:16:58 v-caps kernel: [    1.079229] ehci-pci 0000:00:13.2:
>> debug port 1
>> Jun 11 20:16:58 v-caps kernel: [    1.079699] ehci-pci 0000:00:13.2: irq
>> 19, io mem 0xf9fff400
>> Jun 11 20:16:58 v-caps kernel: [    1.088779] ehci-pci 0000:00:13.2: USB
>> 2.0 started, EHCI 1.00
>> Jun 11 20:16:58 v-caps kernel: [    1.089269] usb usb2: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0002
>> Jun 11 20:16:58 v-caps kernel: [    1.089718] usb usb2: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.090598] usb usb2: Product: EHCI
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.091031] usb usb2: Manufacturer:
>> Linux 3.16.0-38-generic ehci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.091458] usb usb2: SerialNumber:
>> 0000:00:13.2
>> Jun 11 20:16:58 v-caps kernel: [    1.092027] hub 2-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.092455] hub 2-0:1.0: 6 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.093003] ehci-platform: EHCI generi=
c
>> platform driver
>> Jun 11 20:16:58 v-caps kernel: [    1.093427] ohci_hcd: USB 1.1 'Open'
>> Host Controller (OHCI) Driver
>> Jun 11 20:16:58 v-caps kernel: [    1.093842] ohci-pci: OHCI PCI platfor=
m
>> driver
>> Jun 11 20:16:58 v-caps kernel: [    1.094365] ohci-pci 0000:00:12.0: OHC=
I
>> PCI host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.094785] ohci-pci 0000:00:12.0: new
>> USB bus registered, assigned bus number 3
>> Jun 11 20:16:58 v-caps kernel: [    1.095643] ohci-pci 0000:00:12.0: irq
>> 16, io mem 0xf9ffe000
>> Jun 11 20:16:58 v-caps kernel: [    1.152862] usb usb3: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0001
>> Jun 11 20:16:58 v-caps kernel: [    1.153294] usb usb3: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.154140] usb usb3: Product: OHCI PC=
I
>> host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.154576] usb usb3: Manufacturer:
>> Linux 3.16.0-38-generic ohci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.155016] usb usb3: SerialNumber:
>> 0000:00:12.0
>> Jun 11 20:16:58 v-caps kernel: [    1.155600] hub 3-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.156043] hub 3-0:1.0: 3 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.156655] ohci-pci 0000:00:12.1: OHC=
I
>> PCI host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.157090] ohci-pci 0000:00:12.1: new
>> USB bus registered, assigned bus number 4
>> Jun 11 20:16:58 v-caps kernel: [    1.157929] ohci-pci 0000:00:12.1: irq
>> 16, io mem 0xf9ffd000
>> Jun 11 20:16:58 v-caps kernel: [    1.216925] usb usb4: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0001
>> Jun 11 20:16:58 v-caps kernel: [    1.217364] usb usb4: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.218228] usb usb4: Product: OHCI PC=
I
>> host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.218669] usb usb4: Manufacturer:
>> Linux 3.16.0-38-generic ohci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.219105] usb usb4: SerialNumber:
>> 0000:00:12.1
>> Jun 11 20:16:58 v-caps kernel: [    1.219692] hub 4-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.220126] hub 4-0:1.0: 3 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.220728] ohci-pci 0000:00:13.0: OHC=
I
>> PCI host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.221161] ohci-pci 0000:00:13.0: new
>> USB bus registered, assigned bus number 5
>> Jun 11 20:16:58 v-caps kernel: [    1.222054] ohci-pci 0000:00:13.0: irq
>> 18, io mem 0xf9ffc000
>> Jun 11 20:16:58 v-caps kernel: [    1.280989] usb usb5: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0001
>> Jun 11 20:16:58 v-caps kernel: [    1.281442] usb usb5: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.282335] usb usb5: Product: OHCI PC=
I
>> host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.282785] usb usb5: Manufacturer:
>> Linux 3.16.0-38-generic ohci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.283234] usb usb5: SerialNumber:
>> 0000:00:13.0
>> Jun 11 20:16:58 v-caps kernel: [    1.283833] hub 5-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.284272] hub 5-0:1.0: 3 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.284875] ohci-pci 0000:00:13.1: OHC=
I
>> PCI host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.285305] ohci-pci 0000:00:13.1: new
>> USB bus registered, assigned bus number 6
>> Jun 11 20:16:58 v-caps kernel: [    1.286172] ohci-pci 0000:00:13.1: irq
>> 18, io mem 0xf9ffb000
>> Jun 11 20:16:58 v-caps kernel: [    1.345068] usb usb6: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0001
>> Jun 11 20:16:58 v-caps kernel: [    1.345522] usb usb6: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.346411] usb usb6: Product: OHCI PC=
I
>> host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.346858] usb usb6: Manufacturer:
>> Linux 3.16.0-38-generic ohci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.347307] usb usb6: SerialNumber:
>> 0000:00:13.1
>> Jun 11 20:16:58 v-caps kernel: [    1.347896] hub 6-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.348335] hub 6-0:1.0: 3 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.348937] ohci-pci 0000:00:14.5: OHC=
I
>> PCI host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.349366] ohci-pci 0000:00:14.5: new
>> USB bus registered, assigned bus number 7
>> Jun 11 20:16:58 v-caps kernel: [    1.350231] ohci-pci 0000:00:14.5: irq
>> 18, io mem 0xf9ffa000
>> Jun 11 20:16:58 v-caps kernel: [    1.409109] usb usb7: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0001
>> Jun 11 20:16:58 v-caps kernel: [    1.409546] usb usb7: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.410403] usb usb7: Product: OHCI PC=
I
>> host controller
>> Jun 11 20:16:58 v-caps kernel: [    1.410846] usb usb7: Manufacturer:
>> Linux 3.16.0-38-generic ohci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.411294] usb usb7: SerialNumber:
>> 0000:00:14.5
>> Jun 11 20:16:58 v-caps kernel: [    1.411881] hub 7-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.412320] hub 7-0:1.0: 2 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.412809] ohci-platform: OHCI generi=
c
>> platform driver
>> Jun 11 20:16:58 v-caps kernel: [    1.413242] uhci_hcd: USB Universal
>> Host Controller Interface driver
>> Jun 11 20:16:58 v-caps kernel: [    1.413734] xhci_hcd 0000:04:00.0: xHC=
I
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.414166] xhci_hcd 0000:04:00.0: new
>> USB bus registered, assigned bus number 8
>> Jun 11 20:16:58 v-caps kernel: [    1.415118] xhci_hcd 0000:04:00.0: irq
>> 45 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.415165] usb usb8: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0002
>> Jun 11 20:16:58 v-caps kernel: [    1.415619] usb usb8: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.416507] usb usb8: Product: xHCI
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.416952] usb usb8: Manufacturer:
>> Linux 3.16.0-38-generic xhci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.417409] usb usb8: SerialNumber:
>> 0000:04:00.0
>> Jun 11 20:16:58 v-caps kernel: [    1.417980] hub 8-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.418413] hub 8-0:1.0: 4 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.418922] xhci_hcd 0000:04:00.0: xHC=
I
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.419346] xhci_hcd 0000:04:00.0: new
>> USB bus registered, assigned bus number 9
>> Jun 11 20:16:58 v-caps kernel: [    1.420224] usb usb9: New USB device
>> found, idVendor=3D1d6b, idProduct=3D0003
>> Jun 11 20:16:58 v-caps kernel: [    1.420676] usb usb9: New USB device
>> strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
>> Jun 11 20:16:58 v-caps kernel: [    1.421566] usb usb9: Product: xHCI
>> Host Controller
>> Jun 11 20:16:58 v-caps kernel: [    1.422009] usb usb9: Manufacturer:
>> Linux 3.16.0-38-generic xhci_hcd
>> Jun 11 20:16:58 v-caps kernel: [    1.422453] usb usb9: SerialNumber:
>> 0000:04:00.0
>> Jun 11 20:16:58 v-caps kernel: [    1.423014] hub 9-0:1.0: USB hub found
>> Jun 11 20:16:58 v-caps kernel: [    1.423450] hub 9-0:1.0: 4 ports
>> detected
>> Jun 11 20:16:58 v-caps kernel: [    1.423994] i8042: PNP: No PS/2
>> controller found. Probing ports directly.
>> Jun 11 20:16:58 v-caps kernel: [    1.426976] serio: i8042 KBD port at
>> 0x60,0x64 irq 1
>> Jun 11 20:16:58 v-caps kernel: [    1.427395] serio: i8042 AUX port at
>> 0x60,0x64 irq 12
>> Jun 11 20:16:58 v-caps kernel: [    1.427950] mousedev: PS/2 mouse devic=
e
>> common for all mice
>> Jun 11 20:16:58 v-caps kernel: [    1.428542] rtc_cmos 00:01: RTC can
>> wake from S4
>> Jun 11 20:16:58 v-caps kernel: [    1.429140] rtc_cmos 00:01: rtc core:
>> registered rtc_cmos as rtc0
>> Jun 11 20:16:58 v-caps kernel: [    1.429594] rtc_cmos 00:01: alarms up
>> to one month, y3k, 114 bytes nvram, hpet irqs
>> Jun 11 20:16:58 v-caps kernel: [    1.430501] device-mapper: uevent:
>> version 1.0.3
>> Jun 11 20:16:58 v-caps kernel: [    1.431015] device-mapper: ioctl:
>> 4.27.0-ioctl (2013-10-30) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
>> Jun 11 20:16:58 v-caps kernel: [    1.431876] ledtrig-cpu: registered to
>> indicate activity on CPUs
>> Jun 11 20:16:58 v-caps kernel: [    1.432385] TCP: cubic registered
>> Jun 11 20:16:58 v-caps kernel: [    1.432912] NET: Registered protocol
>> family 10
>> Jun 11 20:16:58 v-caps kernel: [    1.433562] NET: Registered protocol
>> family 17
>> Jun 11 20:16:58 v-caps kernel: [    1.433981] Key type dns_resolver
>> registered
>> Jun 11 20:16:58 v-caps kernel: [    1.435067] Loading compiled-in X.509
>> certificates
>> Jun 11 20:16:58 v-caps kernel: [    1.436122] Loaded X.509 cert
>> 'Magrathea: Glacier signing key: c284edaccf0b473652c34d23bec356944236e63=
b'
>> Jun 11 20:16:58 v-caps kernel: [    1.436985] registered taskstats
>> version 1
>> Jun 11 20:16:58 v-caps kernel: [    1.439184] Key type trusted registere=
d
>> Jun 11 20:16:58 v-caps kernel: [    1.442721] Key type encrypted
>> registered
>> Jun 11 20:16:58 v-caps kernel: [    1.443116] AppArmor: AppArmor sha1
>> policy hashing enabled
>> Jun 11 20:16:58 v-caps kernel: [    1.443514] ima: No TPM chip found,
>> activating TPM-bypass!
>> Jun 11 20:16:58 v-caps kernel: [    1.443921] evm: HMAC attrs: 0x1
>> Jun 11 20:16:58 v-caps kernel: [    1.444727]   Magic number: 3:985:301
>> Jun 11 20:16:58 v-caps kernel: [    1.445140] tty tty30: hash matches
>> Jun 11 20:16:58 v-caps kernel: [    1.445619] rtc_cmos 00:01: setting
>> system clock to 2015-06-11 23:16:51 UTC (1434064611)
>> Jun 11 20:16:58 v-caps kernel: [    1.446702] acpi-cpufreq: overriding
>> BIOS provided _PSD data
>> Jun 11 20:16:58 v-caps kernel: [    1.447525] BIOS EDD facility v0.16
>> 2004-Jun-25, 0 devices found
>> Jun 11 20:16:58 v-caps kernel: [    1.447941] EDD information not
>> available.
>> Jun 11 20:16:58 v-caps kernel: [    1.448403] PM: Hibernation image not
>> present or could not be loaded.
>> Jun 11 20:16:58 v-caps kernel: [    1.449473] Freeing unused kernel
>> memory: 1352K (ffffffff81d1c000 - ffffffff81e6e000)
>> Jun 11 20:16:58 v-caps kernel: [    1.450347] Write protecting the kerne=
l
>> read-only data: 12288k
>> Jun 11 20:16:58 v-caps kernel: [    1.452474] Freeing unused kernel
>> memory: 556K (ffff880001775000 - ffff880001800000)
>> Jun 11 20:16:58 v-caps kernel: [    1.454811] Freeing unused kernel
>> memory: 500K (ffff880001b83000 - ffff880001c00000)
>> Jun 11 20:16:58 v-caps kernel: [    1.467097] systemd-udevd[144]:
>> starting version 204
>> Jun 11 20:16:58 v-caps kernel: [    1.482331] r8169 Gigabit Ethernet
>> driver 2.3LK-NAPI loaded
>> Jun 11 20:16:58 v-caps kernel: [    1.482910] ahci 0000:00:11.0: version
>> 3.0
>> Jun 11 20:16:58 v-caps kernel: [    1.483020] r8169 0000:02:00.0: irq 46
>> for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.483144] ahci 0000:00:11.0: AHCI
>> 0001.0100 32 slots 4 ports 3 Gbps 0xf impl SATA mode
>> Jun 11 20:16:58 v-caps kernel: [    1.483256] r8169 0000:02:00.0 eth0:
>> RTL8168e/8111e at 0xffffc90010e66000, e8:de:27:01:f6:19, XID 0c200000 IR=
Q 46
>> Jun 11 20:16:58 v-caps kernel: [    1.483257] r8169 0000:02:00.0 eth0:
>> jumbo features [frames: 9200 bytes, tx checksumming: ko]
>> Jun 11 20:16:58 v-caps kernel: [    1.483275] r8169 Gigabit Ethernet
>> driver 2.3LK-NAPI loaded
>> Jun 11 20:16:58 v-caps kernel: [    1.483500] r8169 0000:05:00.0: irq 47
>> for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.483671] r8169 0000:05:00.0 eth1:
>> RTL8168evl/8111evl at 0xffffc90010fb4000, d0:50:99:30:c6:76, XID 0c90080=
0
>> IRQ 47
>> Jun 11 20:16:58 v-caps kernel: [    1.483672] r8169 0000:05:00.0 eth1:
>> jumbo features [frames: 9200 bytes, tx checksumming: ko]
>> Jun 11 20:16:58 v-caps kernel: [    1.488749] ahci 0000:00:11.0: flags:
>> 64bit ncq sntf ilck pm led clo pmp pio slum part ccc
>> Jun 11 20:16:58 v-caps kernel: [    1.490977] scsi0 : ahci
>> Jun 11 20:16:58 v-caps kernel: [    1.492030] scsi1 : ahci
>> Jun 11 20:16:58 v-caps kernel: [    1.494136] scsi2 : ahci
>> Jun 11 20:16:58 v-caps kernel: [    1.494821] scsi3 : ahci
>> Jun 11 20:16:58 v-caps kernel: [    1.495406] ata1: SATA max UDMA/133
>> abar m1024@0xf9fffc00 port 0xf9fffd00 irq 22
>> Jun 11 20:16:58 v-caps kernel: [    1.496404] ata2: SATA max UDMA/133
>> abar m1024@0xf9fffc00 port 0xf9fffd80 irq 22
>> Jun 11 20:16:58 v-caps kernel: [    1.497415] ata3: SATA max UDMA/133
>> abar m1024@0xf9fffc00 port 0xf9fffe00 irq 22
>> Jun 11 20:16:58 v-caps kernel: [    1.498417] ata4: SATA max UDMA/133
>> abar m1024@0xf9fffc00 port 0xf9fffe80 irq 22
>> Jun 11 20:16:58 v-caps kernel: [    1.499589] ahci 0000:03:00.0: irq 48
>> for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    1.499613] ahci 0000:03:00.0: SSS fla=
g
>> set, parallel bus scan disabled
>> Jun 11 20:16:58 v-caps kernel: [    1.500164] ahci 0000:03:00.0: AHCI
>> 0001.0200 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
>> Jun 11 20:16:58 v-caps kernel: [    1.501225] ahci 0000:03:00.0: flags:
>> 64bit ncq sntf stag led clo pmp pio slum part ccc sxs
>> Jun 11 20:16:58 v-caps kernel: [    1.501229] scsi4 : pata_atiixp
>> Jun 11 20:16:58 v-caps kernel: [    1.501445] scsi5 : pata_atiixp
>> Jun 11 20:16:58 v-caps kernel: [    1.501573] ata5: PATA max UDMA/100 cm=
d
>> 0x1f0 ctl 0x3f6 bmdma 0xff00 irq 14
>> Jun 11 20:16:58 v-caps kernel: [    1.501573] ata6: PATA max UDMA/100 cm=
d
>> 0x170 ctl 0x376 bmdma 0xff08 irq 15
>> Jun 11 20:16:58 v-caps kernel: [    1.504907] scsi6 : ahci
>> Jun 11 20:16:58 v-caps kernel: [    1.505613] scsi7 : ahci
>> Jun 11 20:16:58 v-caps kernel: [    1.506270] ata7: SATA max UDMA/133
>> abar m512@0xfeaffc00 port 0xfeaffd00 irq 48
>> Jun 11 20:16:58 v-caps kernel: [    1.507196] ata8: SATA max UDMA/133
>> abar m512@0xfeaffc00 port 0xfeaffd80 irq 48
>> Jun 11 20:16:58 v-caps kernel: [    1.529416] systemd-udevd[147]: rename=
d
>> network interface eth1 to p10p1
>> Jun 11 20:16:58 v-caps kernel: [    1.545433] systemd-udevd[152]: rename=
d
>> network interface eth0 to p7p1
>> Jun 11 20:16:58 v-caps kernel: [    1.573331] usb 2-2: new high-speed US=
B
>> device number 2 using ehci-pci
>> Jun 11 20:16:58 v-caps kernel: [    1.685915] ata6.01: ATAPI:
>> HL-DT-STDVD-RAM GSA-H58N, 1.00, max UDMA/66
>> Jun 11 20:16:58 v-caps kernel: [    1.701871] ata6.01: configured for
>> UDMA/66
>> Jun 11 20:16:58 v-caps kernel: [    1.706182] usb 2-2: New USB device
>> found, idVendor=3D0ace, idProduct=3D1215
>> Jun 11 20:16:58 v-caps kernel: [    1.706692] usb 2-2: New USB device
>> strings: Mfr=3D16, Product=3D32, SerialNumber=3D0
>> Jun 11 20:16:58 v-caps kernel: [    1.707680] usb 2-2: Product: USB2.0
>> WLAN
>> Jun 11 20:16:58 v-caps kernel: [    1.708165] usb 2-2: Manufacturer: ZyD=
AS
>> Jun 11 20:16:58 v-caps kernel: [    1.817520] ata1: SATA link down
>> (SStatus 0 SControl 300)
>> Jun 11 20:16:58 v-caps kernel: [    1.818101] ata3: SATA link down
>> (SStatus 0 SControl 300)
>> Jun 11 20:16:58 v-caps kernel: [    1.818587] ata4: SATA link down
>> (SStatus 0 SControl 300)
>> Jun 11 20:16:58 v-caps kernel: [    1.819049] ata2: SATA link down
>> (SStatus 0 SControl 300)
>> Jun 11 20:16:58 v-caps kernel: [    1.821142] scsi 5:0:1:0: CD-ROM
>>      HL-DT-ST DVD-RAM GSA-H58N 1.00 PQ: 0 ANSI: 5
>> Jun 11 20:16:58 v-caps kernel: [    1.831872] sr0: scsi3-mmc drive:
>> 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
>> Jun 11 20:16:58 v-caps kernel: [    1.832776] cdrom: Uniform CD-ROM
>> driver Revision: 3.20
>> Jun 11 20:16:58 v-caps kernel: [    1.833371] sr 5:0:1:0: Attached scsi
>> CD-ROM sr0
>> Jun 11 20:16:58 v-caps kernel: [    1.833487] sr 5:0:1:0: Attached scsi
>> generic sg0 type 5
>> Jun 11 20:16:58 v-caps kernel: [    1.841543] usb 4-1: new low-speed USB
>> device number 2 using ohci-pci
>> Jun 11 20:16:58 v-caps kernel: [    1.997384] ata7: SATA link up 6.0 Gbp=
s
>> (SStatus 133 SControl 300)
>> Jun 11 20:16:58 v-caps kernel: [    1.998773] ata7.00: ATA-9:
>> SSD2SC120G1SA754D117-820, N0530A, max UDMA/133
>> Jun 11 20:16:58 v-caps kernel: [    1.999239] ata7.00: 234441648 sectors=
,
>> multi 1: LBA48 NCQ (depth 31/32), AA
>> Jun 11 20:16:58 v-caps kernel: [    1.999981] ata7.00: configured for
>> UDMA/133
>> Jun 11 20:16:58 v-caps kernel: [    2.000550] scsi 6:0:0:0: Direct-Acces=
s
>>     ATA      SSD2SC120G1SA754 0A   PQ: 0 ANSI: 5
>> Jun 11 20:16:58 v-caps kernel: [    2.001687] sd 6:0:0:0: [sda] 23444164=
8
>> 512-byte logical blocks: (120 GB/111 GiB)
>> Jun 11 20:16:58 v-caps kernel: [    2.001692] sd 6:0:0:0: Attached scsi
>> generic sg1 type 0
>> Jun 11 20:16:58 v-caps kernel: [    2.003149] sd 6:0:0:0: [sda] Write
>> Protect is off
>> Jun 11 20:16:58 v-caps kernel: [    2.003554] sd 6:0:0:0: [sda] Mode
>> Sense: 00 3a 00 00
>> Jun 11 20:16:58 v-caps kernel: [    2.003683] sd 6:0:0:0: [sda] Write
>> cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> Jun 11 20:16:58 v-caps kernel: [    2.005117]  sda: sda1 sda2 sda3
>> Jun 11 20:16:58 v-caps kernel: [    2.005816] sd 6:0:0:0: [sda] Attached
>> SCSI disk
>> Jun 11 20:16:58 v-caps kernel: [    2.008240] tsc: Refined TSC
>> clocksource calibration: 4653.112 MHz
>> Jun 11 20:16:58 v-caps kernel: [    2.013385] usb 4-1: New USB device
>> found, idVendor=3D04d9, idProduct=3D0022
>> Jun 11 20:16:58 v-caps kernel: [    2.013882] usb 4-1: New USB device
>> strings: Mfr=3D0, Product=3D2, SerialNumber=3D0
>> Jun 11 20:16:58 v-caps kernel: [    2.014284] usb 4-1: Product: USB
>> Keyboard
>> Jun 11 20:16:58 v-caps kernel: [    2.018348] hidraw: raw HID events
>> driver (C) Jiri Kosina
>> Jun 11 20:16:58 v-caps kernel: [    2.042342] usbcore: registered new
>> interface driver usbhid
>> Jun 11 20:16:58 v-caps kernel: [    2.042763] usbhid: USB HID core drive=
r
>> Jun 11 20:16:58 v-caps kernel: [    2.044476] input: USB Keyboard as
>> /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.0/0003:04D9:0022.0001/in=
put/input5
>> Jun 11 20:16:58 v-caps kernel: [    2.045444] hid-generic
>> 0003:04D9:0022.0001: input,hidraw0: USB HID v1.10 Keyboard [USB Keyboard=
]
>> on usb-0000:00:12.1-1/input0
>> Jun 11 20:16:58 v-caps kernel: [    2.046435] input: USB Keyboard as
>> /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.1/0003:04D9:0022.0002/in=
put/input6
>> Jun 11 20:16:58 v-caps kernel: [    2.047461] hid-generic
>> 0003:04D9:0022.0002: input,hidraw1: USB HID v1.10 Device [USB Keyboard] =
on
>> usb-0000:00:12.1-1/input1
>> Jun 11 20:16:58 v-caps kernel: [    2.303673] ata8: SATA link down
>> (SStatus 0 SControl 300)
>> Jun 11 20:16:58 v-caps kernel: [    2.920111] Switched to clocksource ts=
c
>> Jun 11 20:16:58 v-caps kernel: [    4.382933] floppy0: no floppy
>> controllers found
>> Jun 11 20:16:58 v-caps kernel: [    7.272503] EXT4-fs (sda2): mounted
>> filesystem with ordered data mode. Opts: (null)
>> Jun 11 20:16:58 v-caps kernel: [    7.364061] random: init urandom read
>> with 70 bits of entropy available
>> Jun 11 20:16:58 v-caps kernel: [    7.388873] init:
>> plymouth-upstart-bridge main process (237) terminated with status 1
>> Jun 11 20:16:58 v-caps kernel: [    7.389819] init:
>> plymouth-upstart-bridge main process ended, respawning
>> Jun 11 20:16:58 v-caps kernel: [    7.394387] init:
>> plymouth-upstart-bridge main process (246) terminated with status 1
>> Jun 11 20:16:58 v-caps kernel: [    7.395354] init:
>> plymouth-upstart-bridge main process ended, respawning
>> Jun 11 20:16:58 v-caps kernel: [    7.399374] init:
>> plymouth-upstart-bridge main process (250) terminated with status 1
>> Jun 11 20:16:58 v-caps kernel: [    7.400340] init:
>> plymouth-upstart-bridge main process ended, respawning
>> Jun 11 20:16:58 v-caps kernel: [    7.402987] init:
>> plymouth-upstart-bridge main process (254) terminated with status 1
>> Jun 11 20:16:58 v-caps kernel: [    7.403967] init:
>> plymouth-upstart-bridge main process ended, respawning
>> Jun 11 20:16:58 v-caps kernel: [    7.495806] Adding 2097148k swap on
>> /dev/sda1.  Priority:-1 extents:1 across:2097148k SSFS
>> Jun 11 20:16:58 v-caps kernel: [    7.499478] EXT4-fs (sda2): re-mounted=
.
>> Opts: errors=3Dremount-ro
>> Jun 11 20:16:58 v-caps kernel: [    7.607450] systemd-udevd[399]:
>> starting version 204
>> Jun 11 20:16:58 v-caps kernel: [    7.619836] EXT4-fs (sda3): mounted
>> filesystem with ordered data mode. Opts: (null)
>> Jun 11 20:16:58 v-caps kernel: [    7.629983] lp: driver loaded but no
>> devices found
>> Jun 11 20:16:58 v-caps kernel: [    7.637946] ppdev: user-space parallel
>> port driver
>> Jun 11 20:16:58 v-caps kernel: [    7.647449] wmi: Mapper loaded
>> Jun 11 20:16:58 v-caps kernel: [    7.647894] shpchp: Standard Hot Plug
>> PCI Controller Driver version: 0.4
>> Jun 11 20:16:58 v-caps kernel: [    7.655187] [drm] Initialized drm 1.1.=
0
>> 20060810
>> Jun 11 20:16:58 v-caps kernel: [    7.664060] ACPI Warning: SystemIO
>> range 0x0000000000000b00-0x0000000000000b07 conflicts with OpRegion
>> 0x0000000000000b00-0x0000000000000b0f (\SOR1) (20140424/utaddress-258)
>> Jun 11 20:16:58 v-caps kernel: [    7.664067] ACPI: If an ACPI driver is
>> available for this device, you should use it instead of the native drive=
r
>> Jun 11 20:16:58 v-caps kernel: [    7.672812] MCE: In-kernel MCE decodin=
g
>> enabled.
>> Jun 11 20:16:58 v-caps kernel: [    7.674623] EDAC MC: Ver: 3.0.0
>> Jun 11 20:16:58 v-caps kernel: [    7.675757] checking generic (fb000000
>> 130000) vs hw (d0000000 10000000)
>> Jun 11 20:16:58 v-caps kernel: [    7.675759] checking generic (fb000000
>> 130000) vs hw (fa000000 2000000)
>> Jun 11 20:16:58 v-caps kernel: [    7.675761] fb: switching to nouveaufb
>> from VESA VGA
>> Jun 11 20:16:58 v-caps kernel: [    7.675782] Console: switching to
>> colour dummy device 80x25
>> Jun 11 20:16:58 v-caps kernel: [    7.675981] AMD64 EDAC driver v3.4.0
>> Jun 11 20:16:58 v-caps kernel: [    7.676002] EDAC amd64: DRAM ECC
>> disabled.
>> Jun 11 20:16:58 v-caps kernel: [    7.676008] EDAC amd64: ECC disabled i=
n
>> the BIOS or no ECC capability, module will not load.
>> Jun 11 20:16:58 v-caps kernel: [    7.676008]  Either enable ECC checkin=
g
>> or force module loading by setting 'ecc_enable_override'.
>> Jun 11 20:16:58 v-caps kernel: [    7.676008]  (Note that use of the
>> override may cause unknown side effects.)
>> Jun 11 20:16:58 v-caps kernel: [    7.676119] nouveau  [
>>  DEVICE][0000:01:00.0] BOOT0  : 0x298280a2
>> Jun 11 20:16:58 v-caps kernel: [    7.676122] nouveau  [
>>  DEVICE][0000:01:00.0] Chipset: G98 (NV98)
>> Jun 11 20:16:58 v-caps kernel: [    7.676123] nouveau  [
>>  DEVICE][0000:01:00.0] Family : NV50
>> Jun 11 20:16:58 v-caps kernel: [    7.676213] nouveau  [
>> VBIOS][0000:01:00.0] checking PRAMIN for image...
>> Jun 11 20:16:58 v-caps kernel: [    7.693108] AVX version of gcm_enc/dec
>> engaged.
>> Jun 11 20:16:58 v-caps kernel: [    7.712757] kvm: Nested Virtualization
>> enabled
>> Jun 11 20:16:58 v-caps kernel: [    7.712762] kvm: Nested Paging enabled
>> Jun 11 20:16:58 v-caps kernel: [    7.733822] nouveau  [
>> VBIOS][0000:01:00.0] ... appears to be valid
>> Jun 11 20:16:58 v-caps kernel: [    7.733823] nouveau  [
>> VBIOS][0000:01:00.0] using image from PRAMIN
>> Jun 11 20:16:58 v-caps kernel: [    7.733905] nouveau  [
>> VBIOS][0000:01:00.0] BIT signature found
>> Jun 11 20:16:58 v-caps kernel: [    7.733908] nouveau  [
>> VBIOS][0000:01:00.0] version 70.18.36.00.00
>> Jun 11 20:16:58 v-caps kernel: [    7.754325] nouveau 0000:01:00.0: irq
>> 49 for MSI/MSI-X
>> Jun 11 20:16:58 v-caps kernel: [    7.754335] nouveau  [
>> PMC][0000:01:00.0] MSI interrupts enabled
>> Jun 11 20:16:58 v-caps kernel: [    7.754358] nouveau  [
>> PFB][0000:01:00.0] RAM type: DDR2
>> Jun 11 20:16:58 v-caps kernel: [    7.754360] nouveau  [
>> PFB][0000:01:00.0] RAM size: 1024 MiB
>> Jun 11 20:16:58 v-caps kernel: [    7.754361] nouveau  [
>> PFB][0000:01:00.0]    ZCOMP: 960 tags
>> Jun 11 20:16:58 v-caps kernel: [    7.764707] sound hdaudioC0D0:
>> autoconfig: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
>> Jun 11 20:16:58 v-caps kernel: [    7.764710] sound hdaudioC0D0:
>>  speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
>> Jun 11 20:16:58 v-caps kernel: [    7.764712] sound hdaudioC0D0:
>>  hp_outs=3D1 (0x1b/0x0/0x0/0x0/0x0)
>> Jun 11 20:16:58 v-caps kernel: [    7.764713] sound hdaudioC0D0:    mono=
:
>> mono_out=3D0x0
>> Jun 11 20:16:58 v-caps kernel: [    7.764714] sound hdaudioC0D0:
>>  dig-out=3D0x1e/0x0
>> Jun 11 20:16:58 v-caps kernel: [    7.764715] sound hdaudioC0D0:
>>  inputs:
>> Jun 11 20:16:58 v-caps kernel: [    7.764717] sound hdaudioC0D0:
>>  Front Mic=3D0x19
>> Jun 11 20:16:58 v-caps kernel: [    7.764718] sound hdaudioC0D0:
>>  Rear Mic=3D0x18
>> Jun 11 20:16:58 v-caps kernel: [    7.764719] sound hdaudioC0D0:
>>  Line=3D0x1a
>> Jun 11 20:16:58 v-caps kernel: [    7.777512] input: HDA ATI SB Rear Mic
>> as /devices/pci0000:00/0000:00:14.2/sound/card0/input7
>> Jun 11 20:16:58 v-caps kernel: [    7.779263] input: HDA ATI SB Line as
>> /devices/pci0000:00/0000:00:14.2/sound/card0/input8
>> Jun 11 20:16:58 v-caps kernel: [    7.779485] input: HDA ATI SB Line Out
>> as /devices/pci0000:00/0000:00:14.2/sound/card0/input9
>> Jun 11 20:16:58 v-caps kernel: [    7.784065] nouveau  [
>>  PTHERM][0000:01:00.0] FAN control: none / external
>> Jun 11 20:16:58 v-caps kernel: [    7.784077] nouveau  [
>>  PTHERM][0000:01:00.0] fan management: automatic
>> Jun 11 20:16:58 v-caps kernel: [    7.784079] nouveau  [
>>  PTHERM][0000:01:00.0] internal sensor: yes
>> Jun 11 20:16:58 v-caps kernel: [    7.784087] nouveau  [
>> CLK][0000:01:00.0] 0f: core 550 MHz shader 1375 MHz memory 266 MHz
>> Jun 11 20:16:58 v-caps kernel: [    7.784121] nouveau  [
>> CLK][0000:01:00.0] --: core 566 MHz shader 1400 MHz memory 265 MHz
>> Jun 11 20:16:58 v-caps kernel: [    7.784167] nouveau E[
>> PDISP][0000:01:00.0] 02:0261: func 08 lookup failed, -2
>> Jun 11 20:16:58 v-caps kernel: [    7.784558] [TTM] Zone  kernel:
>> Available graphics memory: 4079904 kiB
>> Jun 11 20:16:58 v-caps kernel: [    7.784560] [TTM] Zone   dma32:
>> Available graphics memory: 2097152 kiB
>> Jun 11 20:16:58 v-caps kernel: [    7.784561] [TTM] Initializing pool
>> allocator
>> Jun 11 20:16:58 v-caps kernel: [    7.784567] [TTM] Initializing DMA poo=
l
>> allocator
>> Jun 11 20:16:58 v-caps kernel: [    7.784584] nouveau  [     DRM] VRAM:
>> 1024 MiB
>> Jun 11 20:16:58 v-caps kernel: [    7.784586] nouveau  [     DRM] GART:
>> 1048576 MiB
>> Jun 11 20:16:58 v-caps kernel: [    7.784590] nouveau  [     DRM] TMDS
>> table version 2.0
>> Jun 11 20:16:58 v-caps kernel: [    7.784593] nouveau  [     DRM] DCB
>> version 4.0
>> Jun 11 20:16:58 v-caps kernel: [    7.784596] nouveau  [     DRM] DCB
>> outp 00: 02000300 00000028
>> Jun 11 20:16:58 v-caps kernel: [    7.784599] nouveau  [     DRM] DCB
>> outp 01: 01000302 00020030
>> Jun 11 20:16:58 v-caps kernel: [    7.784601] nouveau  [     DRM] DCB
>> outp 02: 04011310 00000028
>> Jun 11 20:16:58 v-caps kernel: [    7.784603] nouveau  [     DRM] DCB
>> outp 03: 02022322 00c20090
>> Jun 11 20:16:58 v-caps kernel: [    7.784605] nouveau  [     DRM] DCB
>> conn 00: 00001030
>> Jun 11 20:16:58 v-caps kernel: [    7.784608] nouveau  [     DRM] DCB
>> conn 01: 00000100
>> Jun 11 20:16:58 v-caps kernel: [    7.784610] nouveau  [     DRM] DCB
>> conn 02: 00002261
>> Jun 11 20:16:58 v-caps kernel: [    7.790697] [drm] Supports vblank
>> timestamp caching Rev 2 (21.10.2013).
>> Jun 11 20:16:58 v-caps kernel: [    7.790699] [drm] Driver supports
>> precise vblank timestamp query.
>> Jun 11 20:16:58 v-caps kernel: [    7.799009] nouveau  [     DRM] MM:
>> using M2MF for buffer copies
>> Jun 11 20:16:58 v-caps kernel: [    7.811344] cfg80211: Calling CRDA to
>> update world regulatory domain
>> Jun 11 20:16:58 v-caps rsyslogd-2039: Could no open output pipe
>> '/dev/xconsole': No such file or directory [try
>> http://www.rsyslog.com/e/2039 ]
>> Jun 11 20:16:58 v-caps kernel: [    7.833323] cfg80211: World regulatory
>> domain updated:
>> Jun 11 20:16:58 v-caps kernel: [    7.833326] cfg80211:  DFS Master
>> region: unset
>> Jun 11 20:16:58 v-caps kernel: [    7.833327] cfg80211:   (start_freq -
>> end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
>> Jun 11 20:16:58 v-caps kernel: [    7.833330] cfg80211:   (2402000 KHz -
>> 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    7.833331] cfg80211:   (2457000 KHz -
>> 2482000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    7.833333] cfg80211:   (2474000 KHz -
>> 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    7.833335] cfg80211:   (5170000 KHz -
>> 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    7.833336] cfg80211:   (5735000 KHz -
>> 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    7.860841] init: failsafe main proces=
s
>> (660) killed by TERM signal
>> Jun 11 20:16:58 v-caps kernel: [    7.869101] nouveau  [     DRM]
>> allocated 1360x768 fb: 0x60000, bo ffff8800cadfe000
>> Jun 11 20:16:58 v-caps kernel: [    7.869168] fbcon: nouveaufb (fb0) is
>> primary device
>> Jun 11 20:16:58 v-caps kernel: [    7.870010] nouveau E[
>> DEVINIT][0000:01:00.0] unable to compute acceptable pll values
>> Jun 11 20:16:58 v-caps kernel: [    7.870012] nouveau E[
>> DEVINIT][0000:01:00.0] failed pll calculation
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Bluetooth daemon 4.101
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Starting SDP server
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Found user 'avahi' (UID 110)
>> and group 'avahi' (GID 117).
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Successfully dropped root
>> privileges.
>> Jun 11 20:16:58 v-caps bluetoothd[767]: DIS cannot start: GATT is disabl=
ed
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init deviceinfo plugin
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init proximity plugin
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init time plugin
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init alert plugin
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init thermometer plugi=
n
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: avahi-daemon 0.6.31 starting u=
p.
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Successfully called chroot().
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Successfully dropped remaining
>> capabilities.
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init gatt_example plug=
in
>> Jun 11 20:16:58 v-caps bluetoothd[767]: Bluetooth Management interface
>> initialized
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: No service file found in
>> /etc/avahi/services.
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Network interface enumeration
>> completed.
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Registering HINFO record with
>> values 'X86_64'/'LINUX'.
>> Jun 11 20:16:58 v-caps avahi-daemon[799]: Server startup complete. Host
>> name is v-caps.local. Local service cookie is 59173345.
>> Jun 11 20:16:58 v-caps ModemManager[762]: <info>  ModemManager (version
>> 1.0.0) starting...
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> NetworkManager
>> (version 0.9.8.8) is starting...
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Read config file
>> /etc/NetworkManager/NetworkManager.conf
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> WEXT support is enabl=
ed
>> Jun 11 20:16:58 v-caps kernel: [    7.925743] Bluetooth: Core ver 2.19
>> Jun 11 20:16:58 v-caps kernel: [    7.925758] NET: Registered protocol
>> family 31
>> Jun 11 20:16:58 v-caps kernel: [    7.925759] Bluetooth: HCI device and
>> connection manager initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.925765] Bluetooth: HCI socket laye=
r
>> initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.925767] Bluetooth: L2CAP socket
>> layer initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.925780] Bluetooth: SCO socket laye=
r
>> initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.928636] Bluetooth: RFCOMM TTY laye=
r
>> initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.928640] Bluetooth: RFCOMM socket
>> layer initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.928644] Bluetooth: RFCOMM ver 1.11
>> Jun 11 20:16:58 v-caps kernel: [    7.934949] Bluetooth: BNEP (Ethernet
>> Emulation) ver 1.3
>> Jun 11 20:16:58 v-caps kernel: [    7.934949] Bluetooth: BNEP filters:
>> protocol multicast
>> Jun 11 20:16:58 v-caps kernel: [    7.934954] Bluetooth: BNEP socket
>> layer initialized
>> Jun 11 20:16:58 v-caps kernel: [    7.936155] usb 2-2: reset high-speed
>> USB device number 2 using ehci-pci
>> Jun 11 20:16:58 v-caps kernel: [    7.938438] init: cups main process
>> (727) killed by HUP signal
>> Jun 11 20:16:58 v-caps kernel: [    7.938443] init: cups main process
>> ended, respawning
>> Jun 11 20:16:58 v-caps kernel: [    8.070645] ieee80211 phy0: Selected
>> rate control algorithm 'minstrel_ht'
>> Jun 11 20:16:58 v-caps kernel: [    8.070835] zd1211rw 2-2:1.0: phy0
>> Jun 11 20:16:58 v-caps kernel: [    8.070858] usbcore: registered new
>> interface driver zd1211rw
>> Jun 11 20:16:58 v-caps kernel: [    8.096090] Console: switching to
>> colour frame buffer device 170x48
>> Jun 11 20:16:58 v-caps kernel: [    8.096656] nouveau 0000:01:00.0: fb0:
>> nouveaufb frame buffer device
>> Jun 11 20:16:58 v-caps kernel: [    8.096657] nouveau 0000:01:00.0:
>> registered panic notifier
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> VPN: loaded
>> org.freedesktop.NetworkManager.pptp
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> DNS: loaded plugin
>> dnsmasq
>> Jun 11 20:16:58 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.PolicyKit1' (using servicehelper)
>> Jun 11 20:16:58 v-caps kernel: [    8.108042] random: nonblocking pool i=
s
>> initialized
>> Jun 11 20:16:58 v-caps kernel: [    8.115300] [drm] Initialized nouveau
>> 1.1.2 20120801 for 0000:01:00.0 on minor 0
>> Jun 11 20:16:58 v-caps polkitd[903]: started daemon version 0.105 using
>> authority implementation `local' version `0.105'
>> Jun 11 20:16:58 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.PolicyKit1'
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: init!
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown:
>> update_system_hostname
>> Jun 11 20:16:58 v-caps NetworkManager[866]:       interface-parser:
>> parsing file /etc/network/interfaces
>> Jun 11 20:16:58 v-caps NetworkManager[866]:       interface-parser:
>> finished parsing file /etc/network/interfaces
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPluginIfupdown:
>> management mode: unmanaged
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device=
s
>> added (path: /sys/devices/pci0000:00/0000:00:06.0/0000:02:00.0/net/p7p1,
>> iface: p7p1)
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device
>> added (path: /sys/devices/pci0000:00/0000:00:06.0/0000:02:00.0/net/p7p1,
>> iface: p7p1): no ifupdown configuration found.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device=
s
>> added (path: /sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0/net/p10p1=
,
>> iface: p10p1)
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device
>> added (path: /sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0/net/p10p1=
,
>> iface: p10p1): no ifupdown configuration found.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device=
s
>> added (path:
>> /sys/devices/pci0000:00/0000:00:13.2/usb2/2-2/2-2:1.0/net/wlan0, iface:
>> wlan0)
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device
>> added (path:
>> /sys/devices/pci0000:00/0000:00:13.2/usb2/2-2/2-2:1.0/net/wlan0, iface:
>> wlan0): no ifupdown configuration found.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device=
s
>> added (path: /sys/devices/virtual/net/lo, iface: lo)
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: device
>> added (path: /sys/devices/virtual/net/lo, iface: lo): no ifupdown
>> configuration found.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown: end
>> _init.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Loaded plugin
>> ifupdown: (C) 2008 Canonical Ltd.  To report bugs please use the
>> NetworkManager mailing list.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Loaded plugin keyfile=
:
>> (c) 2007 - 2010 Red Hat, Inc.  To report bugs please use the NetworkMana=
ger
>> mailing list.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ofono: Acquired
>> D-Bus service com.canonical.NMOfono
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ofono: init!
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ofono: end _init=
.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Loaded plugin (null):
>> (null)
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    Ifupdown: get unmanaged
>> devices count: 0
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown:
>> (21519088) ... get_connections.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ifupdown:
>> (21519088) ... get_connections (managed=3Dfalse): return empty list.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    keyfile: parsing semfio2
>> ...
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    keyfile:     read
>> connection 'semfio2'
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ofono:
>> (-1677705008) ... get_connections.
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    SCPlugin-Ofono:
>> (-1677705008) connections count: 0
>> Jun 11 20:16:58 v-caps NetworkManager[866]:    Ifupdown: get unmanaged
>> devices count: 0
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> monitoring kernel
>> firmware directory '/lib/firmware'.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> rfkill0: found WiFi
>> radio killswitch (at
>> /sys/devices/pci0000:00/0000:00:13.2/usb2/2-2/2-2:1.0/ieee80211/phy0/rfk=
ill0)
>> (driver zd1211rw)
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> WiFi enabled by radio
>> killswitch; enabled by state file
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> WWAN enabled by radio
>> killswitch; enabled by state file
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> WiMAX enabled by radi=
o
>> killswitch; enabled by state file
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Networking is enabled
>> by state file
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <warn> failed to allocate
>> link cache: (-12) Object not found
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): carrier is OF=
F
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): new Ethernet
>> device (driver: 'r8169' ifindex: 2)
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): exported as
>> /org/freedesktop/NetworkManager/Devices/0
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): device state
>> change: unmanaged -> unavailable (reason 'managed') [10 20 2]
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): bringing up
>> device.
>> Jun 11 20:16:58 v-caps cron[988]: (CRON) INFO (pidfile fd =3D 3)
>> Jun 11 20:16:58 v-caps kernel: [    8.286280] r8169 0000:02:00.0 p7p1:
>> link down
>> Jun 11 20:16:58 v-caps kernel: [    8.286309] IPv6: ADDRCONF(NETDEV_UP):
>> p7p1: link is not ready
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): preparing
>> device.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p7p1): deactivating
>> device (reason 'managed') [2]
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Added default wired
>> connection 'Conex=C3=A3o cabeada 1' for
>> /sys/devices/pci0000:00/0000:00:06.0/0000:02:00.0/net/p7p1
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <warn> failed to allocate
>> link cache: (-12) Object not found
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): carrier is O=
FF
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): new Ethernet
>> device (driver: 'r8169' ifindex: 3)
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): exported as
>> /org/freedesktop/NetworkManager/Devices/1
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): device state
>> change: unmanaged -> unavailable (reason 'managed') [10 20 2]
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): bringing up
>> device.
>> Jun 11 20:16:58 v-caps cron[1039]: (CRON) STARTUP (fork ok)
>> Jun 11 20:16:58 v-caps acpid: starting up with netlink and the input lay=
er
>> Jun 11 20:16:58 v-caps cron[1039]: (CRON) INFO (Running @reboot jobs)
>> Jun 11 20:16:58 v-caps acpid: 9 rules loaded
>> Jun 11 20:16:58 v-caps acpid: waiting for events: event logging is off
>> Jun 11 20:16:58 v-caps anacron[1063]: Anacron 2.3 started on 2015-06-11
>> Jun 11 20:16:58 v-caps anacron[1063]: Will run job `cron.daily' in 5 min=
.
>> Jun 11 20:16:58 v-caps anacron[1063]: Jobs will be executed sequentially
>> Jun 11 20:16:58 v-caps whoopsie[1030]: whoopsie 0.2.24.6 starting up.
>> Jun 11 20:16:58 v-caps whoopsie[1030]: Using lock path:
>> /var/lock/whoopsie/lock
>> Jun 11 20:16:58 v-caps ntpdate[1169]: Can't find host
>> 0.ubuntu.pool.ntp.org: Name or service not known (-2)
>> Jun 11 20:16:58 v-caps ntpdate[1169]: Can't find host
>> 1.ubuntu.pool.ntp.org: Name or service not known (-2)
>> Jun 11 20:16:58 v-caps ntpdate[1169]: Can't find host
>> 2.ubuntu.pool.ntp.org: Name or service not known (-2)
>> Jun 11 20:16:58 v-caps ntpdate[1169]: Can't find host
>> 3.ubuntu.pool.ntp.org: Name or service not known (-2)
>> Jun 11 20:16:58 v-caps ntpdate[1169]: Can't find host ntp.ubuntu.com:
>> Name or service not known (-2)
>> Jun 11 20:16:58 v-caps ntpdate[1169]: no servers can be used, exiting
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): preparing
>> device.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (p10p1): deactivating
>> device (reason 'managed') [2]
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> Added default wired
>> connection 'Conex=C3=A3o cabeada 2' for
>> /sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0/net/p10p1
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): using nl8021=
1
>> for WiFi device control
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): driver
>> supports Access Point (AP) mode
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): new 802.11
>> WiFi device (driver: 'zd1211rw' ifindex: 4)
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): exported as
>> /org/freedesktop/NetworkManager/Devices/2
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: unmanaged -> unavailable (reason 'managed') [10 20 2]
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): bringing up
>> device.
>> Jun 11 20:16:58 v-caps kernel: [    8.403879] r8169 0000:05:00.0 p10p1:
>> link down
>> Jun 11 20:16:58 v-caps kernel: [    8.403918] IPv6: ADDRCONF(NETDEV_UP):
>> p10p1: link is not ready
>> Jun 11 20:16:58 v-caps ntpd[1200]: ntpd 4.2.6p5@1.2349-o Mon Apr 13
>> 13:39:46 UTC 2015 (1)
>> Jun 11 20:16:58 v-caps ntpd[1203]: proto: precision =3D 0.141 usec
>> Jun 11 20:16:58 v-caps ntpd[1203]: ntp_io: estimated max descriptors:
>> 1024, initial socket boundary: 16
>> Jun 11 20:16:58 v-caps ntpd[1203]: Listen and drop on 0 v4wildcard
>> 0.0.0.0 UDP 123
>> Jun 11 20:16:58 v-caps ntpd[1203]: Listen and drop on 1 v6wildcard :: UD=
P
>> 123
>> Jun 11 20:16:58 v-caps kernel: [    8.443017] zd1211rw 2-2:1.0: firmware
>> version 4725
>> Jun 11 20:16:58 v-caps kernel: [    8.462399] vboxdrv: module
>> verification failed: signature and/or  required key missing - tainting
>> kernel
>> Jun 11 20:16:58 v-caps kernel: [    8.465366] vboxdrv: Found 8 processor
>> cores.
>> Jun 11 20:16:58 v-caps kernel: [    8.465801] vboxdrv: fAsync=3D0
>> offMin=3D0x529 offMax=3D0x3ee0
>> Jun 11 20:16:58 v-caps kernel: [    8.465893] vboxdrv: TSC mode is
>> 'synchronous', kernel timer mode is 'normal'.
>> Jun 11 20:16:58 v-caps kernel: [    8.465894] vboxdrv: Successfully
>> loaded version 4.3.20 (interface 0x001a0008).
>> Jun 11 20:16:58 v-caps kernel: [    8.483055] zd1211rw 2-2:1.0: zd1211b
>> chip 0ace:1215 v4810 high 00-02-72 AL2230_RF pa0 g--NS
>> Jun 11 20:16:58 v-caps ntpd[1203]: Listen normally on 2 lo 127.0.0.1 UDP
>> 123
>> Jun 11 20:16:58 v-caps ntpd[1203]: Listen normally on 3 lo ::1 UDP 123
>> Jun 11 20:16:58 v-caps ntpd[1203]: peers refreshed
>> Jun 11 20:16:58 v-caps ntpd[1203]: Listening on routing socket on fd #20
>> for interface updates
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): preparing
>> device.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): deactivating
>> device (reason 'managed') [2]
>> Jun 11 20:16:58 v-caps dbus[636]: [system] Activating service
>> name=3D'fi.w1.wpa_supplicant1' (using servicehelper)
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <warn>
>> /sys/devices/virtual/net/lo: couldn't determine device driver; ignoring.=
..
>> Jun 11 20:16:58 v-caps ntpd[1203]: Deferring DNS for
>> 0.ubuntu.pool.ntp.org 1
>> Jun 11 20:16:58 v-caps ntpd[1203]: Deferring DNS for
>> 1.ubuntu.pool.ntp.org 1
>> Jun 11 20:16:58 v-caps ntpd[1203]: Deferring DNS for
>> 2.ubuntu.pool.ntp.org 1
>> Jun 11 20:16:58 v-caps ntpd[1203]: Deferring DNS for
>> 3.ubuntu.pool.ntp.org 1
>> Jun 11 20:16:58 v-caps ntpd[1203]: Deferring DNS for ntp.ubuntu.com 1
>> Jun 11 20:16:58 v-caps kernel: [    8.519323] IPv6: ADDRCONF(NETDEV_UP):
>> wlan0: link is not ready
>> Jun 11 20:16:58 v-caps kernel: [    8.519353] cfg80211: Calling CRDA for
>> country: DE
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <warn>
>> /sys/devices/virtual/net/lo: couldn't determine device driver; ignoring.=
..
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> urfkill disappeared
>> from the bus
>> Jun 11 20:16:58 v-caps ntpd[1214]: signal_no_reset: signal 17 had flags
>> 4000000
>> Jun 11 20:16:58 v-caps whoopsie[1163]: offline
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> ModemManager availabl=
e
>> in the bus
>> Jun 11 20:16:58 v-caps kernel: [    8.521334] cfg80211: Regulatory domai=
n
>> changed to country: DE
>> Jun 11 20:16:58 v-caps kernel: [    8.521336] cfg80211:  DFS Master
>> region: unset
>> Jun 11 20:16:58 v-caps kernel: [    8.521337] cfg80211:   (start_freq -
>> end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
>> Jun 11 20:16:58 v-caps kernel: [    8.521339] cfg80211:   (2400000 KHz -
>> 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    8.521340] cfg80211:   (5150000 KHz -
>> 5250000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps kernel: [    8.521342] cfg80211:   (5250000 KHz -
>> 5350000 KHz @ 40000 KHz), (N/A, 2000 mBm), (0 s)
>> Jun 11 20:16:58 v-caps kernel: [    8.521343] cfg80211:   (5470000 KHz -
>> 5725000 KHz @ 40000 KHz), (N/A, 2698 mBm), (0 s)
>> Jun 11 20:16:58 v-caps kernel: [    8.521344] cfg80211:   (57240000 KHz =
-
>> 65880000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
>> Jun 11 20:16:58 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'fi.w1.wpa_supplicant1'
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> wpa_supplicant starte=
d
>> Jun 11 20:16:58 v-caps wpa_supplicant[1213]: Successfully initialized
>> wpa_supplicant
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0) supports 4
>> scan SSIDs
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <warn> Trying to remove a
>> non-existant call id.
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: starting -> ready
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: unavailable -> disconnected (reason 'supplicant-available') [20 =
30
>> 42]
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: ready -> disconnected
>> Jun 11 20:16:58 v-caps NetworkManager[866]: <info> (wlan0) supports 4
>> scan SSIDs
>> Jun 11 20:16:58 v-caps wpa_supplicant[1215]: wlan0: Reject scan trigger
>> since one is already pending
>> Jun 11 20:16:58 v-caps wpa_supplicant[1215]: wlan0:
>> CTRL-EVENT-SCAN-STARTED
>> Jun 11 20:16:58 v-caps kernel: [    8.671967] vboxpci: IOMMU not found
>> (not registered)
>> Jun 11 20:16:58 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.Accounts' (using servicehelper)
>> Jun 11 20:16:58 v-caps accounts-daemon[1279]: started daemon version
>> 0.6.35
>> Jun 11 20:16:58 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.Accounts'
>> Jun 11 20:16:59 v-caps kernel: [    9.153486] init:
>> plymouth-upstart-bridge main process ended, respawning
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Auto-activating
>> connection 'semfio2'.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> starting connection 'semfio2'
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: disconnected -> prepare (reason 'none') [30 40 0]
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> NetworkManager state
>> is now CONNECTING
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 1 of 5 (Device Prepare) scheduled...
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 1 of 5 (Device Prepare) started...
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 2 of 5 (Device Configure) scheduled...
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 1 of 5 (Device Prepare) complete.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 2 of 5 (Device Configure) starting...
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: prepare -> config (reason 'none') [40 50 0]
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation
>> (wlan0/wireless): connection 'semfio2' has security, and secrets exist. =
 No
>> new secrets needed.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Config: added 'ssid'
>> value 'semfio2'
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Config: added
>> 'scan_ssid' value '1'
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Config: added
>> 'key_mgmt' value 'WPA-PSK'
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Config: added
>> 'auth_alg' value 'OPEN'
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Config: added 'psk'
>> value '<omitted>'
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 2 of 5 (Device Configure) complete.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Config: set interface
>> ap_scan to 1
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: disconnected -> inactive
>> Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wlan0: SME: Trying to
>> authenticate with 5a:98:26:49:92:24 (SSID=3D'semfio2' freq=3D2412 MHz)
>> Jun 11 20:16:59 v-caps kernel: [    9.407531] wlan0: authenticate with
>> 5a:98:26:49:92:24
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: inactive -> authenticating
>> Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wlan0: Trying to associate
>> with 5a:98:26:49:92:24 (SSID=3D'semfio2' freq=3D2412 MHz)
>> Jun 11 20:16:59 v-caps kernel: [    9.433096] wlan0: send auth to
>> 5a:98:26:49:92:24 (try 1/3)
>> Jun 11 20:16:59 v-caps kernel: [    9.434594] wlan0: authenticated
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: authenticating -> associating
>> Jun 11 20:16:59 v-caps kernel: [    9.436876] wlan0: associate with
>> 5a:98:26:49:92:24 (try 1/3)
>> Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wlan0: Associated with
>> 5a:98:26:49:92:24
>> Jun 11 20:16:59 v-caps kernel: [    9.443353] wlan0: RX AssocResp from
>> 5a:98:26:49:92:24 (capab=3D0x411 status=3D0 aid=3D2)
>> Jun 11 20:16:59 v-caps kernel: [    9.443853] wlan0: associated
>> Jun 11 20:16:59 v-caps kernel: [    9.443881] IPv6:
>> ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: associating -> 4-way handshake
>> Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wlan0: WPA: Key negotiation
>> completed with 5a:98:26:49:92:24 [PTK=3DCCMP GTK=3DTKIP]
>> Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wlan0: CTRL-EVENT-CONNECTED
>> - Connection to 5a:98:26:49:92:24 completed [id=3D0 id_str=3D]
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): supplicant
>> interface state: 4-way handshake -> completed
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation
>> (wlan0/wireless) Stage 2 of 5 (Device Configure) successful.  Connected =
to
>> wireless network 'semfio2'.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 3 of 5 (IP Configure Start) scheduled.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 3 of 5 (IP Configure Start) started...
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: config -> ip-config (reason 'none') [50 70 0]
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Beginning DHCPv4 transaction (timeout in 45 seconds)
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> dhclient started with
>> pid 1498
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Beginning IP6 addrconf.
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 3 of 5 (IP Configure Start) complete.
>> Jun 11 20:16:59 v-caps dhclient: Internet Systems Consortium DHCP Client
>> 4.2.4
>> Jun 11 20:16:59 v-caps dhclient: Copyright 2004-2012 Internet Systems
>> Consortium.
>> Jun 11 20:16:59 v-caps dhclient: All rights reserved.
>> Jun 11 20:16:59 v-caps dhclient: For info, please visit
>> https://www.isc.org/software/dhcp/
>> Jun 11 20:16:59 v-caps dhclient:
>> Jun 11 20:16:59 v-caps NetworkManager[866]: <info> (wlan0): DHCPv4 state
>> changed nbi -> preinit
>> Jun 11 20:16:59 v-caps dhclient: Listening on LPF/wlan0/00:02:72:72:66:e=
6
>> Jun 11 20:16:59 v-caps dhclient: Sending on   LPF/wlan0/00:02:72:72:66:e=
6
>> Jun 11 20:16:59 v-caps dhclient: Sending on   Socket/fallback
>> Jun 11 20:16:59 v-caps dhclient: DHCPDISCOVER on wlan0 to 255.255.255.25=
5
>> port 67 interval 3 (xid=3D0x70ac9f93)
>> Jun 11 20:17:00 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.UPower' (using servicehelper)
>> Jun 11 20:17:00 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.UDisks2' (using servicehelper)
>> Jun 11 20:17:00 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.RealtimeKit1' (using servicehelper)
>> Jun 11 20:17:00 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.UPower'
>> Jun 11 20:17:00 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.RealtimeKit1'
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully called chroot.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully dropped
>> privileges.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully limited resource=
s.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Running.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Watchdog thread running.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Canary thread running.
>> Jun 11 20:17:00 v-caps udisksd[1573]: udisks daemon version 2.1.3 starti=
ng
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully made thread 1576
>> of process 1576 (n/a) owned by '1000' high priority at nice level -11.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Supervising 1 threads of 1
>> processes of 1 users.
>> Jun 11 20:17:00 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.UDisks2'
>> Jun 11 20:17:00 v-caps udisksd[1573]: Acquired the name
>> org.freedesktop.UDisks2 on the system message bus
>> Jun 11 20:17:00 v-caps ModemManager[762]: <warn>  Couldn't find support
>> for device at '/sys/devices/pci0000:00/0000:00:06.0/0000:02:00.0': not
>> supported by any plugin
>> Jun 11 20:17:00 v-caps ModemManager[762]: <warn>  Couldn't find support
>> for device at '/sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0': not
>> supported by any plugin
>> Jun 11 20:17:00 v-caps ModemManager[762]: <warn>  Couldn't find support
>> for device at '/sys/devices/pci0000:00/0000:00:13.2/usb2/2-2': not
>> supported by any plugin
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully made thread 1673
>> of process 1576 (n/a) owned by '1000' RT at priority 5.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Supervising 2 threads of 1
>> processes of 1 users.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully made thread 1681
>> of process 1576 (n/a) owned by '1000' RT at priority 5.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Supervising 3 threads of 1
>> processes of 1 users.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully made thread 1683
>> of process 1683 (n/a) owned by '1000' high priority at nice level -11.
>> Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Supervising 4 threads of 2
>> processes of 1 users.
>> Jun 11 20:17:00 v-caps pulseaudio[1683]: [pulseaudio] pid.c: Daemon
>> already running.
>> Jun 11 20:17:00 v-caps ntpd_intres[1214]: host name not found:
>> 0.ubuntu.pool.ntp.org
>> Jun 11 20:17:00 v-caps ntpd_intres[1214]: host name not found:
>> 1.ubuntu.pool.ntp.org
>> Jun 11 20:17:00 v-caps ntpd_intres[1214]: host name not found:
>> 2.ubuntu.pool.ntp.org
>> Jun 11 20:17:00 v-caps ntpd_intres[1214]: host name not found:
>> 3.ubuntu.pool.ntp.org
>> Jun 11 20:17:00 v-caps ntpd_intres[1214]: host name not found:
>> ntp.ubuntu.com
>> Jun 11 20:17:00 v-caps kernel: [   10.655128] floppy0: no floppy
>> controllers found
>> Jun 11 20:17:01 v-caps avahi-daemon[799]: Joining mDNS multicast group o=
n
>> interface wlan0.IPv6 with address fe80::202:72ff:fe72:66e6.
>> Jun 11 20:17:01 v-caps avahi-daemon[799]: New relevant interface
>> wlan0.IPv6 for mDNS.
>> Jun 11 20:17:01 v-caps avahi-daemon[799]: Registering new address record
>> for fe80::202:72ff:fe72:66e6 on wlan0.*.
>> Jun 11 20:17:01 v-caps CRON[1845]: (root) CMD (   cd / && run-parts
>> --report /etc/cron.hourly)
>> Jun 11 20:17:02 v-caps ntpd[1203]: Listen normally on 4 wlan0
>> fe80::202:72ff:fe72:66e6 UDP 123
>> Jun 11 20:17:02 v-caps ntpd[1203]: peers refreshed
>> Jun 11 20:17:02 v-caps ntpd[1203]: new interface(s) found: waking up
>> resolver
>> Jun 11 20:17:02 v-caps dhclient: DHCPDISCOVER on wlan0 to 255.255.255.25=
5
>> port 67 interval 6 (xid=3D0x70ac9f93)
>> Jun 11 20:17:03 v-caps dhclient: DHCPREQUEST of 192.168.25.7 on wlan0 to
>> 255.255.255.255 port 67 (xid=3D0x70ac9f93)
>> Jun 11 20:17:03 v-caps dhclient: DHCPOFFER of 192.168.25.7 from
>> 192.168.25.1
>> Jun 11 20:17:03 v-caps dhclient: DHCPACK of 192.168.25.7 from 192.168.25=
.1
>> Jun 11 20:17:03 v-caps dhclient: bound to 192.168.25.7 -- renewal in
>> 39070 seconds.
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info> (wlan0): DHCPv4 state
>> changed preinit -> bound
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info>   address 192.168.25.=
7
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info>   prefix 24
>> (255.255.255.0)
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info>   gateway 192.168.25.=
1
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info>   nameserver
>> '192.168.25.1'
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info>   domain name '
>> domain.name'
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 5 of 5 (IPv4 Configure Commit) scheduled...
>> Jun 11 20:17:03 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 5 of 5 (IPv4 Commit) started...
>> Jun 11 20:17:03 v-caps avahi-daemon[799]: Joining mDNS multicast group o=
n
>> interface wlan0.IPv4 with address 192.168.25.7.
>> Jun 11 20:17:03 v-caps avahi-daemon[799]: New relevant interface
>> wlan0.IPv4 for mDNS.
>> Jun 11 20:17:03 v-caps avahi-daemon[799]: Registering new address record
>> for 192.168.25.7 on wlan0.IPv4.
>> Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found:
>> 0.ubuntu.pool.ntp.org
>> Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found:
>> 1.ubuntu.pool.ntp.org
>> Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found:
>> 2.ubuntu.pool.ntp.org
>> Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found:
>> 3.ubuntu.pool.ntp.org
>> Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found:
>> ntp.ubuntu.com
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: ip-config -> secondaries (reason 'none') [70 90 0]
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 5 of 5 (IPv4 Commit) complete.
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> (wlan0): device state
>> change: secondaries -> activated (reason 'none') [90 100 0]
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> NetworkManager state
>> is now CONNECTED_GLOBAL
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> Policy set 'semfio2'
>> (wlan0) as default for IPv4 routing and DNS.
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> DNS: starting
>> dnsmasq...
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <warn> dnsmasq not available
>> on the bus, can't update servers.
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <error> [1434064624.899920]
>> [nm-dns-dnsmasq.c:396] update(): dnsmasq owner not found on bus: Could n=
ot
>> get owner of name 'org.freedesktop.NetworkManager.dnsmasq': no such name
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <warn> DNS: plugin dnsmasq
>> update failed
>> Jun 11 20:17:04 v-caps NetworkManager[866]: <info> Writing DNS
>> information to /sbin/resolvconf
>> Jun 11 20:17:04 v-caps dnsmasq[1862]: iniciado, vers=C3=A3o 2.68 cache
>> desabilitado
>> Jun 11 20:17:04 v-caps dnsmasq[1862]: op=C3=A7=C3=B5es de tempo de compi=
la=C3=A7=C3=A3o: IPv6
>> GNU-getopt DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack ipset auth
>> Jun 11 20:17:04 v-caps dnsmasq[1862]: suporte a DBus habilitado:
>> conectado ao barramento do sistema
>> Jun 11 20:17:04 v-caps dnsmasq[1862]: aviso: n=C3=A3o h=C3=A1 servidores=
 upstream
>> configurados
>> Jun 11 20:17:06 v-caps ntpd[1203]: Listen normally on 5 wlan0
>> 192.168.25.7 UDP 123
>> Jun 11 20:17:06 v-caps ntpd[1203]: peers refreshed
>> Jun 11 20:17:06 v-caps ntpd[1203]: new interface(s) found: waking up
>> resolver
>> Jun 11 20:16:59 v-caps whoopsie[1163]: offline
>> Jun 11 20:17:07 v-caps whoopsie[1163]: Could not get the list of active
>> connections: Timeout was reached
>> Jun 11 20:17:11 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> successful, device activated.
>> Jun 11 20:17:11 v-caps whoopsie[1163]: offline
>> Jun 11 20:17:11 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.nm_dispatcher' (using servicehelper)
>> Jun 11 20:17:11 v-caps NetworkManager[866]: <info> WiFi hardware radio
>> set enabled
>> Jun 11 20:17:11 v-caps NetworkManager[866]: <warn> dnsmasq appeared on
>> DBus: :1.40
>> Jun 11 20:17:11 v-caps NetworkManager[866]: <info> Writing DNS
>> information to /sbin/resolvconf
>> Jun 11 20:17:11 v-caps dnsmasq[1862]: configurando servidores upstream d=
o
>> DBus
>> Jun 11 20:17:11 v-caps dnsmasq[1862]: usando nome de servidor
>> 192.168.25.1#53
>> Jun 11 20:17:11 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.nm_dispatcher'
>> Jun 11 20:17:11 v-caps ntpd[1203]: ntpd exiting on signal 15
>> Jun 11 20:17:12 v-caps ntpd_intres[1214]: DNS 0.ubuntu.pool.ntp.org ->
>> 200.192.232.8
>> Jun 11 20:17:12 v-caps ntpd_intres[1214]: parent died before we finished=
,
>> exiting
>> Jun 11 20:17:20 v-caps NetworkManager[866]: <info> (wlan0): IP6 addrconf
>> timed out or failed.
>> Jun 11 20:17:20 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 4 of 5 (IPv6 Configure Timeout) scheduled...
>> Jun 11 20:17:20 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 4 of 5 (IPv6 Configure Timeout) started...
>> Jun 11 20:17:20 v-caps NetworkManager[866]: <info> Activation (wlan0)
>> Stage 4 of 5 (IPv6 Configure Timeout) complete.
>> Jun 11 20:17:22 v-caps wpa_supplicant[1215]: wlan0:
>> CTRL-EVENT-SCAN-STARTED
>> Jun 11 20:44:55 v-caps ntpdate[2027]: step time server 200.160.7.186
>> offset 1652.839285 sec
>> Jun 11 20:44:55 v-caps ntpd[2083]: ntpd 4.2.6p5@1.2349-o Mon Apr 13
>> 13:39:46 UTC 2015 (1)
>> Jun 11 20:44:55 v-caps ntpd[2084]: proto: precision =3D 0.113 usec
>> Jun 11 20:44:55 v-caps ntpd[2084]: ntp_io: estimated max descriptors:
>> 1024, initial socket boundary: 16
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listen and drop on 0 v4wildcard
>> 0.0.0.0 UDP 123
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listen and drop on 1 v6wildcard :: UD=
P
>> 123
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listen normally on 2 lo 127.0.0.1 UDP
>> 123
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listen normally on 3 wlan0
>> 192.168.25.7 UDP 123
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listen normally on 4 lo ::1 UDP 123
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listen normally on 5 wlan0
>> fe80::202:72ff:fe72:66e6 UDP 123
>> Jun 11 20:44:55 v-caps ntpd[2084]: peers refreshed
>> Jun 11 20:44:55 v-caps ntpd[2084]: Listening on routing socket on fd #22
>> for interface updates
>> Jun 11 20:45:00 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.ColorManager' (using servicehelper)
>> Jun 11 20:45:00 v-caps colord: Using config file /etc/colord.conf
>> Jun 11 20:45:00 v-caps colord: Using mapping database file
>> /var/lib/colord/mapping.db
>> Jun 11 20:45:01 v-caps colord: Using device database file
>> /var/lib/colord/storage.db
>> Jun 11 20:45:01 v-caps colord: loaded plugin libcd_plugin_camera.so
>> Jun 11 20:45:01 v-caps colord: loaded plugin libcd_plugin_scanner.so
>> Jun 11 20:45:01 v-caps colord: plugin
>> /usr/lib/x86_64-linux-gnu/colord-plugins/libcd_plugin_sane.so not loaded=
:
>> plugin refused to load
>> Jun 11 20:45:01 v-caps colord: Daemon ready for requests
>> Jun 11 20:45:01 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.ColorManager'
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-2f1f11ecd613fe5551420fcaf5b11ff8
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-c227f46f246694ba9971f270cb61a0c1
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-0720e7cdbc792b77c0740c39f325ef9e
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-a1d13bd5309e0f06ceda6f0d75367823
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-c3e6382fa9b2d31b01b736f6f97aac3a
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-353a6bcabda00f04b6988f89126ce6f5
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-d6490883a866e4059370e1de1d840283
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-3bd2261b1125a0fd9ebf827a2d1bed84
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-ea421e3a65cfa796e2732ce36086e327
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-526fbc9bdf0d7156c553998d47a3b5fc
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-f64a1f19ce07290b35a752b00217b684
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-57f0d896250f6f98f77ca1b0d19019c0
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-654b99c87e67edb1c1cfb0dcb7fa9d04
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-fb0ac62618f016ed9b92ce239258efa8
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-72f5b1cba915b68ea75cc843e270df5a
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-d4a7a2bd8ddaacf10e275e3db31d72b8
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-a10be98be58460669fcdc6946939b7cf
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-0383c34650771ce95ef93fe916867725
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-b0701c2ccf059287d0b067464df8bda9
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-6a245ab2d8892e2e56232af93cd48b81
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-df7c0067b1eb9bcc9fc9b33bc3a797eb
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-523e494bc2f53c53d51d0758b07f4879
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-6ad6d63767ce0393245528ada92f1cb2
>> Jun 11 20:45:01 v-caps colord: Profile added:
>> icc-3a34aa6c3d1fb1ef63ff41e04ee00979
>> Jun 11 20:45:01 v-caps colord: Profile added: DCP7065DN-Gray..
>> Jun 11 20:45:01 v-caps colord: Device added: cups-DCP7065DN
>> Jun 11 20:45:01 v-caps colord: Profile added: HP-8100-antiga-Gray..
>> Jun 11 20:45:01 v-caps colord: Profile added: HP-8100-antiga-RGB..
>> Jun 11 20:45:01 v-caps colord: Device added: cups-HP-8100-antiga
>> Jun 11 20:45:01 v-caps colord: Profile added: HP-8100-nova-Gray..
>> Jun 11 20:45:01 v-caps colord: Profile added: HP-8100-nova-RGB..
>> Jun 11 20:45:01 v-caps colord: Device added: cups-HP-8100-nova
>> Jun 11 20:45:01 v-caps colord: Profile added: L355-Series-Gray..
>> Jun 11 20:45:01 v-caps colord: Profile added: L355-Series-RGB..
>> Jun 11 20:45:01 v-caps colord: Device added: cups-L355-Series
>> Jun 11 20:46:20 v-caps dbus[636]: [system] Activating service
>> name=3D'org.freedesktop.ConsoleKit' (using servicehelper)
>> Jun 11 20:46:20 v-caps dbus[636]: [system] Successfully activated servic=
e
>> 'org.freedesktop.ConsoleKit'
>>
>>
>>
>> 2015-06-11 20:17 GMT-03:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:
>>
>>> Include logs from the failed boot
>>> On Jun 11, 2015 10:55 PM, "Andre Campos Rodovalho" <
>>> andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>> Hello, I'm facing issues with a Point of View GT210/218 and nouveau
>>>> drivers. I'm using ubuntu server with LXDE on top of it...
>>>>
>>>> *lshw -c video* output:
>>>> *-display
>>>>        description: VGA compatible controller
>>>>        product: GT218 [GeForce 210]
>>>>        vendor: NVIDIA Corporation
>>>>        physical id: 0
>>>>        bus info: pci@0000:01:00.0
>>>>        version: a2
>>>>        width: 64 bits
>>>>        clock: 33MHz
>>>>        capabilities: vga_controller bus_master cap_list rom
>>>>        configuration: driver=3Dnouveau latency=3D0
>>>>        resources: irq:82 memory:fd000000-fdffffff
>>>> memory:d0000000-d7ffffff memory:d8000000-d9ffffff ioport:e000(size=3D1=
28)
>>>> memory:fe000000-fe07ffff
>>>>
>>>> *modeinfo nouveau *output:
>>>> filename:
>>>> /lib/modules/3.16.0-38-generic/kernel/drivers/gpu/drm/nouveau/nouveau.=
ko
>>>> license:        GPL and additional rights
>>>> description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
>>>> author:         Nouveau Project
>>>> srcversion:     D0FCF627599F97CE5A4C810
>>>> alias:          pci:v000012D2d*sv*sd*bc03sc*i*
>>>> alias:          pci:v000010DEd*sv*sd*bc03sc*i*
>>>> depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
>>>> intree:         Y
>>>> vermagic:       3.16.0-38-generic SMP mod_unload modversions
>>>> signer:         Magrathea: Glacier signing key
>>>> sig_key:
>>>>  C2:84:ED:AC:CF:0B:47:36:52:C3:4D:23:BE:C3:56:94:42:36:E6:3B
>>>> sig_hashalgo:   sha512
>>>> parm:           tv_norm:Default TV norm.
>>>> Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
>>>> hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
>>>> Default: PAL
>>>> *NOTE* Ignored for cards with external TV encoders. (charp)
>>>> parm:           tv_disable:Disable TV-out detection (int)
>>>> parm:           ignorelid:Ignore ACPI lid status (int)
>>>> parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
>>>> parm:           nofbaccel:Disable fbcon acceleration (int)
>>>> parm:           agpmode:AGP mode (0 to disable AGP) (int)
>>>> parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
>>>> parm:           config:option string to pass to driver core (charp)
>>>> parm:           debug:debug string to pass to driver core (charp)
>>>> parm:           noaccel:disable kernel/abi16 acceleration (int)
>>>> parm:           modeset:enable driver (default: auto, 0 =3D disabled, =
1 =3D
>>>> enabled, 2 =3D headless) (int)
>>>> parm:           runpm:disable (0), force enable (1), optimus only
>>>> default (-1) (int)
>>>>
>>>> I need to boot with nomodeset to see something on this machine. But th=
e
>>>> most wierd is that I have a very similar machine with almost the same =
video
>>>> card and I have no problems to use it. The installation is the same, I
>>>> cloned the hard drive...
>>>>
>>>> The machine that is working fine is a Asus M5A97 R.20 + Zogis GeForce
>>>> GT210
>>>> The machine that is with blank screen after Xorg is loaded is ASRock
>>>> 980DE3/U3S3 + Point of View GeForce GT210.
>>>>
>>>> What can I do to solve this problem?
>>>>
>>>> ASRock has:
>>>> Northbridge: AMD RX881/760G; Southbridge: AMD SB710
>>>> And Asus has:
>>>> Northbridge: AMD 970; Southbridge: AMD SB950
>>>>
>>>> Tnx for your help!
>>>>
>>>> *Other outputs:*
>>>> *-core
>>>>  description: Motherboard
>>>>        product: M5A97 LE R2.0
>>>>        vendor: ASUSTeK COMPUTER INC.
>>>>        physical id: 0
>>>>        version: Rev 1.xx
>>>>        serial: 130207833100091
>>>>        slot: To be filled by O.E.M.
>>>>      *-firmware
>>>>           description: BIOS
>>>>           vendor: American Megatrends Inc.
>>>>           physical id: 0
>>>>           version: 1503
>>>>           date: 01/11/2013
>>>>           size: 64KiB
>>>>           capacity: 8128KiB
>>>>           capabilities: pci upgrade shadowing cdboot bootselect
>>>> socketedrom edd int13floppy1200 int13floppy720 int13floppy2880
>>>> int5printscreen int9keyboard int14serial
>>>> int17printer acpi usb biosbootspecification uefi
>>>> *-pci:0
>>>>           description: Host bridge
>>>>           product: RD890 PCI to PCI bridge (external gfx0 port B)
>>>>           vendor: Advanced Micro Devices, Inc. [AMD/ATI]
>>>>           physical id: 100
>>>>           bus info: pci@0000:00:00.0
>>>>           version: 02
>>>>           width: 32 bits
>>>>           clock: 33MHz
>>>>
>>>>
>>>> ----------------------------------------------------------------------=
------------
>>>>
>>>> *-core
>>>>        description: Motherboard
>>>>        product: 980DE3/U3S3
>>>>        vendor: ASRock
>>>>        physical id: 0
>>>>        serial: E80-46037902134
>>>>      *-firmware
>>>>           description: BIOS
>>>>           vendor: American Megatrends Inc.
>>>>           physical id: 0
>>>>           version: P1.60
>>>>           date: 05/06/2014
>>>>           size: 64KiB
>>>>           capacity: 1984KiB
>>>>           capabilities: pci upgrade shadowing cdboot bootselect
>>>> socketedrom edd int13floppy1200 int13floppy720 int13floppy2880
>>>> int5printscreen int9keyboard int14serial
>>>> int17printer int10video acpi usb ls120boot zipboot
>>>> biosbootspecification netboot
>>>>  *-pci:0
>>>>           description: Host bridge
>>>>           product: RS880 Host Bridge
>>>>           vendor: Advanced Micro Devices, Inc. [AMD]
>>>>           physical id: 100
>>>>           bus info: pci@0000:00:00.0
>>>>           version: 00
>>>>           width: 32 bits
>>>>           clock: 66MHz
>>>>
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>>
>>>>
>>
>

--001a1135fbdec41199051846dc9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8000001907349px">Hi, the boot =
does not fail, I belive... I can turn on and off the computer, I can access=
 it throught SSH and even VNC. The computer is functinal, but screen is bla=
nk/black. My monitor says something like &quot;invalid format&quot; or &quo=
t;invalid input&quot;...</span><div style=3D"font-size:12.8000001907349px">=
<br></div><div style=3D"font-size:12.8000001907349px">Tnx</div><div style=
=3D"font-size:12.8000001907349px">-----------------------------------------=
------------------------------------------------<br><br>I&#39;m attaching t=
he files, because this list does not accept a very big e-mail content...</d=
iv><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><br></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div>
<br><div class=3D"gmail_quote">2015-06-11 20:59 GMT-03:00 Andre Campos Rodo=
valho <span dir=3D"ltr">&lt;<a href=3D"mailto:andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" ta=
rget=3D"_blank">andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr">dmesg output:<div><br></div><div>--------=
---------------------------------------------------------------------------=
----------------------</div><div><br></div><div><br></div><div class=3D"gma=
il_extra"><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Initializing =
cgroup subsys cpuset</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] Initializing cgroup subsys cpu</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] Initializing cgroup subsys cpuacct</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] Linux version 3.16.0-38-generic (buildd@al=
lspice) (gcc version 4.8.2 (Ubuntu 4.8.2-19ubuntu1) ) #52~14.04.1-Ubuntu SM=
P Fri May 8 09:43:57 UTC 2015 (Ubuntu 3.16.0-38.52~14.04.1-generic 3.16.7-c=
kt10)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Command line=
: BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] KERNEL supported cpus:</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineI=
ntel</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 AMD Au=
thenticAMD</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 =
Centaur CentaurHauls</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] e820: BIOS-provided physical RAM map:</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dbf=
f] usable</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e82=
0: [mem 0x000000000009dc00-0x000000000009ffff] reserved</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000000e6000-0x=
00000000000fffff] reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cff9ffff] usable</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000=
0000cffa0000-0x00000000cffaffff] ACPI data</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000cffb0000-0x00000000cffdf=
fff] ACPI NVS</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS=
-e820: [mem 0x00000000cffe0000-0x00000000cfffffff] reserved</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000ffe0000=
0-0x00000000ffffffff] reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] BIOS-e820: [mem 0x0000000100000000-0x000000022effffff] usable<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] NX (Execute Disabl=
e) protection: active</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] SMBIOS 2.6 present.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] DMI: To Be Filled By O.E.M. To Be Filled By O.E.M./980DE3/U3S3, BIOS =
P1.60 05/06/2014</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e=
820: update [mem 0x00000000-0x00000fff] usable =3D=3D&gt; reserved</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820: remove [mem 0x000a00=
00-0x000fffff] usable</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] AGP: No AGP bridge found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] e820: last_pfn =3D 0x22f000 max_arch_pfn =3D 0x400000000</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] MTRR default type: unca=
chable</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] MTRR fixed =
ranges enabled:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
=C2=A0 00000-9FFFF write-back</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] =C2=A0 A0000-EFFFF uncachable</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.000000] =C2=A0 F0000-FFFFF write-protect</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] MTRR variable ranges enabled:</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 0 base 0000000=
00000 mask FFFF80000000 write-back</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.000000] =C2=A0 1 base 000080000000 mask FFFFC0000000 write-back</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 2 base 0000C0=
000000 mask FFFFF0000000 write-back</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] =C2=A0 3 disabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] =C2=A0 4 disabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] =C2=A0 5 disabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] =C2=A0 6 disabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] =C2=A0 7 disabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] TOM2: 000000022f000000 aka 8944M</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] x86 PAT enabled: cpu 0, old 0x7040600070=
406, new 0x7010600070106</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0=
00000] e820: update [mem 0xd0000000-0xffffffff] usable =3D=3D&gt; reserved<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] e820: last_pfn =3D=
 0xcffa0 max_arch_pfn =3D 0x400000000</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] found SMP MP-table at [mem 0x000ff780-0x000ff78f] mappe=
d at [ffff8800000ff780]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] Scanning 1 areas for low memory corruption</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.000000] Base memory trampoline at [ffff880000097000]=
 97000 size 24576</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
Using GB pages for direct mapping</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x00000000-0x000f=
ffff] page 4k</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] BRK =
[0x01fbd000, 0x01fbdfff] PGTABLE</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] BRK [0x01fbe000, 0x01fbefff] PGTABLE</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] BRK [0x01fbf000, 0x01fbffff] PGTABLE</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] init_memory_mapping: =
[mem 0x22ee00000-0x22effffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] =C2=A0[mem 0x22ee00000-0x22effffff] page 2M</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.000000] BRK [0x01fc0000, 0x01fc0fff] PGTABLE=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] init_memory_mappi=
ng: [mem 0x22c000000-0x22edfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] =C2=A0[mem 0x22c000000-0x22edfffff] page 2M</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x20000=
0000-0x22bffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
=C2=A0[mem 0x200000000-0x22bffffff] page 2M</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x00100000-0xcff9ffff]<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x00100=
000-0x001fffff] page 4k</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0[mem 0x00200000-0x3fffffff] page 2M</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x40000000-0xbfffffff] page 1G</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0xc0000000=
-0xcfdfffff] page 2M</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] =C2=A0[mem 0xcfe00000-0xcff9ffff] page 4k</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.000000] init_memory_mapping: [mem 0x100000000-0x1fffffff=
f]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0[mem 0x10=
0000000-0x1ffffffff] page 1G</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] RAMDISK: [mem 0x35a96000-0x36d42fff]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.000000] ACPI: Early table checksum verification dis=
abled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: RSDP 0=
x00000000000FB6C0 000014 (v00 ACPIAM)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] ACPI: RSDT 0x00000000CFFA0000 000040 (v01 050614 RSDT12=
13 20140506 MSFT 00000097)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.000000] ACPI: FACP 0x00000000CFFA0200 000084 (v01 A_M_I =C2=A0OEMFACP =C2=
=A012000601 MSFT 00000097)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.000000] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock has z=
ero address or length: 0x0000000000000000/0x1 (20140424/tbfadt-649)</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: DSDT 0x00000000CFFA=
0460 0088B0 (v01 AS636 =C2=A0AS636152 00000152 INTL 20051117)</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: FACS 0x00000000CFFB0000 0=
00040</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: APIC 0=
x00000000CFFA0390 00008C (v01 050614 APIC1213 20140506 MSFT 00000097)</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: MCFG 0x00000000CF=
FA0420 00003C (v01 050614 OEMMCFG =C2=A020140506 MSFT 00000097)</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: OEMB 0x00000000CFFB0040=
 000072 (v01 050614 OEMB1213 20140506 MSFT 00000097)</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] ACPI: AAFT 0x00000000CFFAA460 000027 (v0=
1 050614 OEMAAFT =C2=A020140506 MSFT 00000097)</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.000000] ACPI: HPET 0x00000000CFFAA490 000038 (v01 0506=
14 OEMHPET =C2=A020140506 MSFT 00000097)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] ACPI: SSDT 0x00000000CFFAA4D0 001714 (v01 A M I =C2=
=A0POWERNOW 00000001 AMD =C2=A000000001)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] ACPI: Local APIC address 0xfee00000</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] No NUMA configuration found</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Faking a node at [mem 0=
x0000000000000000-0x000000022effffff]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] Initmem setup node 0 [mem 0x00000000-0x22effffff]</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 NODE_DATA [mem 0=
x22eff9000-0x22effdfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00=
0000] =C2=A0[ffffea0000000000-ffffea0008bfffff] PMD -&gt; [ffff880226600000=
-ffff88022e5fffff] on node 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] Zone ranges:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
000000] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x00001000-0x00ffffff]</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0=
[mem 0x01000000-0xffffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
0.000000] =C2=A0 Normal =C2=A0 [mem 0x100000000-0x22effffff]</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Movable zone start for each node=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Early memory node=
 ranges</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 nod=
e =C2=A0 0: [mem 0x00001000-0x0009cfff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00100000-0xcff9ffff]</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0=
: [mem 0x100000000-0x22effffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] On node 0 totalpages: 2092860</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA zone: 64 pages used for memmap</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA zone: 21 pag=
es reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0=
 DMA zone: 3996 pages, LIFO batch:0</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] =C2=A0 DMA32 zone: 13247 pages used for memmap</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 zone: 847776 =
pages, LIFO batch:31</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] =C2=A0 Normal zone: 19392 pages used for memmap</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] =C2=A0 Normal zone: 1241088 pages, LIFO ba=
tch:31</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: PM-Ti=
mer IO Port: 0x808</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000]=
 ACPI: Local APIC address 0xfee00000</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x10] enabled)</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0=
x02] lapic_id[0x11] enabled)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x12] enabled)</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x04] la=
pic_id[0x13] enabled)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x14] enabled)</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x=
15] enabled)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI:=
 LAPIC (acpi_id[0x07] lapic_id[0x16] enabled)</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x17] enabl=
ed)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: IOAPIC (=
id[0x18] address[0xfec00000] gsi_base[0])</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.000000] IOAPIC[0]: apic_id 24, version 33, address 0xfec000=
00, GSI 0-23</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI:=
 INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global=
_irq 9 low level)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
ACPI: IRQ0 used by override.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] ACPI: IRQ2 used by override.</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.000000] ACPI: IRQ9 used by override.</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] Using ACPI (MADT) for SMP configuration =
information</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] ACPI: =
HPET id: 0x8300 base: 0xfed00000</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.000000] nr_irqs_gsi: 40</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0x0=
009d000-0x0009dfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000=
] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [me=
m 0x000a0000-0x000e5fff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0=
00000] PM: Registered nosave memory: [mem 0x000e6000-0x000fffff]</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave memory=
: [mem 0xcffa0000-0xcffaffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.000000] PM: Registered nosave memory: [mem 0xcffb0000-0xcffdffff]</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered nosave =
memory: [mem 0xcffe0000-0xcfffffff]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0xd0000000-0xffdffff=
f]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Registered =
nosave memory: [mem 0xffe00000-0xffffffff]</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.000000] e820: [mem 0xd0000000-0xffdfffff] available for PC=
I devices</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Booting =
paravirtualized kernel on bare hardware</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000000] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu=
_ids:8 nr_node_ids:1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] PERCPU: Embedded 27 pages/cpu @ffff88022ec00000 s81408 r8192 d20992 u262=
144</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] pcpu-alloc: s8=
1408 r8192 d20992 u262144 alloc=3D1*2097152</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=C2=A0</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Built 1 zonelists in Zone ord=
er, mobility grouping on.=C2=A0 Total pages: 2060136</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] Policy zone: Normal</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.000000] Kernel command line: BOOT_IMAGE=3D/boo=
t/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A00.000000] PID hash table entries: 4096 (order: 3, 32768=
 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] xsave: ena=
bled xstate_bv 0x7, cntxt size 0x340</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] AGP: Checking aperture...</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.000000] AGP: No AGP bridge found</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.000000] AGP: Node 0: aperture [bus addr 0x000000=
00-0x01ffffff] (32MB)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0000=
00] AGP: Your BIOS doesn&#39;t leave a aperture memory hole</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] AGP: Please enable the IOMMU opti=
on in the BIOS setup</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00000=
0] AGP: This costs you 64MB of RAM</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.000000] AGP: Mapping aperture over RAM [mem 0xc4000000-0xc7ffffff]=
 (65536KB)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] PM: Reg=
istered nosave memory: [mem 0xc4000000-0xc7ffffff]</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.000000] Memory: 8072292K/8371440K available (7626K=
 kernel code, 1131K rwdata, 3596K rodata, 1352K init, 1300K bss, 299148K re=
served)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] SLUB: HWal=
ign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, Nodes=3D1</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Hierarchical RCU implementation.<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=3D"whi=
te-space:pre-wrap">	</span>RCU dyntick-idle grace-period acceleration is en=
abled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=
=3D"white-space:pre-wrap">	</span>RCU restricting CPUs from NR_CPUS=3D256 t=
o nr_cpu_ids=3D8.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] =
<span style=3D"white-space:pre-wrap">	</span>Offload RCU callbacks from all=
 CPUs</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] <span style=
=3D"white-space:pre-wrap">	</span>Offload RCU callbacks from CPUs: 0-7.</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] RCU: Adjusting geomet=
ry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D8</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.000000] NR_IRQS:16640 nr_irqs:744 16</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.000000] spurious 8259A interrupt: IRQ7.</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] Console: colour dummy de=
vice 80x25</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] console=
 [tty0] enabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] al=
located 33554432 bytes of page_cgroup</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.000000] please try &#39;cgroup_disable=3Dmemory&#39; option if =
you don&#39;t want memory cgroups</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.000000] hpet clockevent registered</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.000000] tsc: Fast TSC calibration using PIT</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.000000] tsc: Detected 4680.606 MHz proce=
ssor</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.000020] Calibrating d=
elay loop (skipped), value calculated using timer frequency.. 9361.21 BogoM=
IPS (lpj=3D18722424)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.00002=
4] pid_max: default: 32768 minimum: 301</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.000031] ACPI: Core revision 20140424</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.002757] ACPI: All ACPI Tables successfully acquir=
ed</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.011663] Security Framew=
ork initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.011684] Ap=
pArmor: AppArmor initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.011686] Yama: becoming mindful.</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.012143] Dentry cache hash table entries: 1048576 (order: 11, 83=
88608 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.014204] Inode=
-cache hash table entries: 524288 (order: 10, 4194304 bytes)</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.015161] Mount-cache hash table entries: =
16384 (order: 5, 131072 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.015170] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 b=
ytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015394] Initializing=
 cgroup subsys memory</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.0154=
13] Initializing cgroup subsys devices</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.015419] Initializing cgroup subsys freezer</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.015422] Initializing cgroup subsys net_cl=
s</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015426] Initializing cgr=
oup subsys blkio</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015430] I=
nitializing cgroup subsys perf_event</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.015432] Initializing cgroup subsys net_prio</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.015439] Initializing cgroup subsys hugetlb</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015456] tseg: 0000000000</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015460] CPU: Physical Process=
or ID: 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015462] CPU: Proc=
essor Core ID: 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015464] m=
ce: CPU supports 7 MCE banks</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.015470] LVT offset 1 assigned for vector 0xf9</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.015475] Last level iTLB entries: 4KB 512, 2MB 1024=
, 4MB 512</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.015475] Last lev=
el dTLB entries: 4KB 1024, 2MB 1024, 4MB 512, 1GB 0</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.015475] tlb_flushall_shift: 6</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.015553] Freeing SMP alternatives memory: 32K =
(ffffffff81e6e000 - ffffffff81e76000)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.016170] ftrace: allocating 29244 entries in 115 pages</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.023710] ..TIMER: vector=3D0x30 apic=
1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.063438] smpboot: CPU0: AMD FX(tm)-8350 Eight-Core Processor (fa=
m: 15, model: 02, stepping: 00)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.167980] Performance Events: Fam15h core perfctr, AMD PMU driver.</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167985] ... version: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.167987] ... bit width: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A048</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167=
988] ... generic registers: =C2=A0 =C2=A0 =C2=A06</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.167990] ... value mask: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0000ffffffffffff</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.167992] ... max period: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
0007fffffffffff</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.167993] ..=
. fixed-purpose events: =C2=A0 0</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.167995] ... event mask: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
00000000000003f</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.169378] NM=
I watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.169445] x86: Booting SMP co=
nfiguration:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.169447] .... =
node =C2=A0#0, CPUs: =C2=A0 =C2=A0 =C2=A0#1 #2 #3 #4 #5 #6 #7</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.261441] x86: Booted up 1 node, 8 CPUs</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.261446] smpboot: Total of 8=
 processors activated (74889.69 BogoMIPS)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.269594] devtmpfs: initialized</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.272590] evm: security.selinux</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.272592] evm: security.SMACK64</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.272594] evm: security.SMACK64EXEC</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.272596] evm: security.SMACK64TRANSMUTE<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272597] evm: security.SMAC=
K64MMAP</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272599] evm: secur=
ity.ima</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272600] evm: secur=
ity.capability</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.272651] PM:=
 Registering ACPI NVS region [mem 0xcffb0000-0xcffdffff] (196608 bytes)</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273377] pinctrl core: initial=
ized pinctrl subsystem</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273=
439] regulator-dummy: no parameters</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.273472] RTC time: 23:16:50, date: 06/11/15</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.273514] NET: Registered protocol family 16</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273639] cpuidle: using govern=
or ladder</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273642] cpuidle:=
 using governor menu</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.27370=
5] ACPI: bus type PCI registered</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.273708] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273767] PCI: MMCONFIG for d=
omain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273771] PCI: not using MMCONF=
IG</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.273773] PCI: Using conf=
iguration type 1 for base access</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.273775] PCI: Using configuration type 1 for extended access</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.274069] mtrr: your CPUs had incon=
sistent variable MTRR settings</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.274071] mtrr: probably your BIOS does not setup all CPUs.</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.274073] mtrr: corrected configuration.=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.276493] ACPI: Added _OSI(=
Module Device)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.276496] ACP=
I: Added _OSI(Processor Device)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.276498] ACPI: Added _OSI(3.0 _SCP Extensions)</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.276500] ACPI: Added _OSI(Processor Aggregator D=
evice)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.278445] ACPI: Execu=
ted 3 blocks of module-level executable AML code</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.281893] ACPI: Interpreter enabled</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.281902] ACPI Exception: AE_NOT_FOUND, While =
evaluating Sleep State [\_S2_] (20140424/hwxface-580)</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.281918] ACPI: (supports S0 S1 S3 S4 S5)</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.281920] ACPI: Using IOAPIC for in=
terrupt routing</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.281975] PC=
I: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (bas=
e 0xe0000000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.282810] PCI:=
 MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resou=
rces</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.283069] PCI: Using ho=
st bridge windows from ACPI; if necessary, use &quot;pci=3Dnocrs&quot; and =
report a bug</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288165] ACPI:=
 PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.288171] acpi PNP0A03:00: _OSC: OS supports [Extende=
dConfig ASPM ClockPM Segments MSI]</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.288365] acpi PNP0A03:00: _OSC: platform does not support [PCIeHotp=
lug PME]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288550] acpi PNP0=
A03:00: _OSC: OS now controls [AER PCIeCapability]</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.288835] PCI host bridge to bus 0000:00</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.288838] pci_bus 0000:00: root bus res=
ource [bus 00-ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288840] =
pci_bus 0000:00: root bus resource [io =C2=A00x0000-0x0cf7]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.288843] pci_bus 0000:00: root bus resourc=
e [io =C2=A00x0d00-0xffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00=
.288846] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288848] pci_bus 0000:00: root=
 bus resource [mem 0x000d0000-0x000dffff]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.288851] pci_bus 0000:00: root bus resource [mem 0xd0000000-=
0xdfffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288853] pci_bu=
s 0000:00: root bus resource [mem 0xf0000000-0xfebfffff]</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.288863] pci 0000:00:00.0: [1022:9601] type 0=
0 class 0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.288955] p=
ci 0000:00:02.0: [1022:9603] type 01 class 0x060400</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.288988] pci 0000:00:02.0: PME# supported from D0 =
D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289023] pci 0=
000:00:02.0: System wakeup disabled by ACPI</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.289059] pci 0000:00:06.0: [1022:9606] type 01 class 0x060=
400</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289090] pci 0000:00:06=
.0: PME# supported from D0 D3hot D3cold</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.289127] pci 0000:00:06.0: System wakeup disabled by ACPI</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289159] pci 0000:00:07.0: [10=
22:9607] type 01 class 0x060400</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289190] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289224] pci 0000:00:07.0: Syste=
m wakeup disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
289257] pci 0000:00:09.0: [1022:9608] type 01 class 0x060400</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A00.289288] pci 0000:00:09.0: PME# supported=
 from D0 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2893=
22] pci 0000:00:09.0: System wakeup disabled by ACPI</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.289353] pci 0000:00:0a.0: [1022:9609] type 01 cl=
ass 0x060400</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289383] pci 0=
000:00:0a.0: PME# supported from D0 D3hot D3cold</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.289417] pci 0000:00:0a.0: System wakeup disabled by =
ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289463] pci 0000:00:1=
1.0: [1002:4391] type 00 class 0x010601</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.289482] pci 0000:00:11.0: reg 0x10: [io =C2=A00x9000-0x9007]=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289491] pci 0000:00:11.0:=
 reg 0x14: [io =C2=A00x8000-0x8003]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.289499] pci 0000:00:11.0: reg 0x18: [io =C2=A00x7000-0x7007]</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289508] pci 0000:00:11.0: re=
g 0x1c: [io =C2=A00x6000-0x6003]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289516] pci 0000:00:11.0: reg 0x20: [io =C2=A00x5000-0x500f]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289525] pci 0000:00:11.0: reg 0x=
24: [mem 0xf9fffc00-0xf9ffffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289622] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289635] pci 0000:00:12.0: reg 0x=
10: [mem 0xf9ffe000-0xf9ffefff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289715] pci 0000:00:12.0: System wakeup disabled by ACPI</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.289748] pci 0000:00:12.1: [1002:4398=
] type 00 class 0x0c0310</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2=
89760] pci 0000:00:12.1: reg 0x10: [mem 0xf9ffd000-0xf9ffdfff]</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.289841] pci 0000:00:12.1: System wakeu=
p disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289879]=
 pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.289896] pci 0000:00:12.2: reg 0x10: [mem 0xf9ff=
f800-0xf9fff8ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.289973] p=
ci 0000:00:12.2: supports D1 D2</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.289974] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290012] pci 0000:00:12.2: System=
 wakeup disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2=
90050] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.290062] pci 0000:00:13.0: reg 0x10: [mem =
0xf9ffc000-0xf9ffcfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290=
143] pci 0000:00:13.0: System wakeup disabled by ACPI</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.290175] pci 0000:00:13.1: [1002:4398] type 00 c=
lass 0x0c0310</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290187] pci =
0000:00:13.1: reg 0x10: [mem 0xf9ffb000-0xf9ffbfff]</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.290269] pci 0000:00:13.1: System wakeup disabled =
by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290306] pci 0000:0=
0:13.2: [1002:4396] type 00 class 0x0c0320</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.290324] pci 0000:00:13.2: reg 0x10: [mem 0xf9fff400-0xf9ff=
f4ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290400] pci 0000:00:=
13.2: supports D1 D2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.29040=
1] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.290440] pci 0000:00:13.2: System wakeup disab=
led by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290481] pci 00=
00:00:14.0: [1002:4385] type 00 class 0x0c0500</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.290619] pci 0000:00:14.1: [1002:439c] type 00 class 0x=
01018a</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290634] pci 0000:00=
:14.1: reg 0x10: [io =C2=A00x0000-0x0007]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.290642] pci 0000:00:14.1: reg 0x14: [io =C2=A00x0000-0x0003=
]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290650] pci 0000:00:14.1=
: reg 0x18: [io =C2=A00x0000-0x0007]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.290658] pci 0000:00:14.1: reg 0x1c: [io =C2=A00x0000-0x0003]</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290667] pci 0000:00:14.1: re=
g 0x20: [io =C2=A00xff00-0xff0f]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.290685] pci 0000:00:14.1: legacy IDE quirk: reg 0x10: [io =C2=A00x0=
1f0-0x01f7]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290688] pci 00=
00:00:14.1: legacy IDE quirk: reg 0x14: [io =C2=A00x03f6]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.290690] pci 0000:00:14.1: legacy IDE quir=
k: reg 0x18: [io =C2=A00x0170-0x0177]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.290692] pci 0000:00:14.1: legacy IDE quirk: reg 0x1c: [io =C2=
=A00x0376]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290775] pci 000=
0:00:14.2: [1002:4383] type 00 class 0x040300</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.290795] pci 0000:00:14.2: reg 0x10: [mem 0xf9ff4000-0xf=
9ff7fff 64bit]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290856] pci=
 0000:00:14.2: PME# supported from D0 D3hot D3cold</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.290891] pci 0000:00:14.2: System wakeup disabled b=
y ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.290924] pci 0000:00=
:14.3: [1002:439d] type 00 class 0x060100</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.291040] pci 0000:00:14.4: [1002:4384] type 01 class 0x06040=
1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291100] pci 0000:00:14.4=
: System wakeup disabled by ACPI</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.291132] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291144] pci 0000:00:14.5: reg 0x=
10: [mem 0xf9ffa000-0xf9ffafff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.291226] pci 0000:00:14.5: System wakeup disabled by ACPI</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.291261] pci 0000:00:18.0: [1022:1600=
] type 00 class 0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2=
91323] pci 0000:00:18.1: [1022:1601] type 00 class 0x060000</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.291378] pci 0000:00:18.2: [1022:1602] typ=
e 00 class 0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291435=
] pci 0000:00:18.3: [1022:1603] type 00 class 0x060000</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.291495] pci 0000:00:18.4: [1022:1604] type 00 =
class 0x060000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291550] pci=
 0000:00:18.5: [1022:1605] type 00 class 0x060000</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.291651] pci 0000:01:00.0: [10de:0a65] type 00 class=
 0x030000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.291661] pci 0000=
:01:00.0: reg 0x10: [mem 0xfd000000-0xfdffffff]</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A00.291671] pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0=
xdfffffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.2916=
80] pci 0000:01:00.0: reg 0x1c: [mem 0xfa000000-0xfbffffff 64bit]</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.291686] pci 0000:01:00.0: reg 0x24:=
 [io =C2=A00xa800-0xa87f]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
291692] pci 0000:01:00.0: reg 0x30: [mem 0xfe8e0000-0xfe8fffff pref]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.296100] pci 0000:00:02.0: PCI br=
idge to [bus 01]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.296105] p=
ci 0000:00:02.0: =C2=A0 bridge window [io =C2=A00xa000-0xafff]</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.296107] pci 0000:00:02.0: =C2=A0 bridg=
e window [mem 0xfa000000-0xfe8fffff]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.296109] pci 0000:00:02.0: =C2=A0 bridge window [mem 0xd0000000-=
0xdfffffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.296=
156] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.296170] pci 0000:02:00.0: reg 0x10: [io =
=C2=A00xb800-0xb8ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.29618=
9] pci 0000:02:00.0: reg 0x18: [mem 0xfe9ff000-0xfe9fffff 64bit]</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.296201] pci 0000:02:00.0: reg 0x20: =
[mem 0xf8efc000-0xf8efffff 64bit pref]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.296263] pci 0000:02:00.0: supports D1 D2</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A00.296264] pci 0000:02:00.0: PME# supported from=
 D0 D1 D2 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304=
108] pci 0000:00:06.0: PCI bridge to [bus 02]</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.304112] pci 0000:00:06.0: =C2=A0 bridge window [io =C2=
=A00xb000-0xbfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304114] =
pci 0000:00:06.0: =C2=A0 bridge window [mem 0xfe900000-0xfe9fffff]</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A00.304117] pci 0000:00:06.0: =C2=A0 b=
ridge window [mem 0xf8e00000-0xf8efffff 64bit pref]</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.304162] pci 0000:03:00.0: [1b21:0612] type 00 cla=
ss 0x010601</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304174] pci 00=
00:03:00.0: reg 0x10: [io =C2=A00xd800-0xd807]</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.304181] pci 0000:03:00.0: reg 0x14: [io =C2=A00xd400-0=
xd403]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304188] pci 0000:03=
:00.0: reg 0x18: [io =C2=A00xd000-0xd007]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.304195] pci 0000:03:00.0: reg 0x1c: [io =C2=A00xc800-0xc803=
]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.304202] pci 0000:03:00.0=
: reg 0x20: [io =C2=A00xc400-0xc41f]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.304209] pci 0000:03:00.0: reg 0x24: [mem 0xfeaffc00-0xfeaffdff]=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.312113] pci 0000:00:07.0:=
 PCI bridge to [bus 03]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.31=
2118] pci 0000:00:07.0: =C2=A0 bridge window [io =C2=A00xc000-0xdfff]</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.312119] pci 0000:00:07.0: =C2=
=A0 bridge window [mem 0xfea00000-0xfeafffff]</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.312166] pci 0000:04:00.0: [1b6f:7052] type 00 class 0x0=
c0330</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.312184] pci 0000:04:=
00.0: reg 0x10: [mem 0xfebf8000-0xfebfffff 64bit]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.312263] pci 0000:04:00.0: supports D1 D2</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.312265] pci 0000:04:00.0: PME# suppo=
rted from D0 D1 D2 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.320122] pci 0000:00:09.0: PCI bridge to [bus 04]</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.320128] pci 0000:00:09.0: =C2=A0 bridge wind=
ow [mem 0xfeb00000-0xfebfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.320173] pci 0000:05:00.0: [10ec:8168] type 00 class 0x020000</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.320187] pci 0000:05:00.0: reg 0x10:=
 [io =C2=A00xe800-0xe8ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
320206] pci 0000:05:00.0: reg 0x18: [mem 0xf8fff000-0xf8ffffff 64bit pref]<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.320218] pci 0000:05:00.0: =
reg 0x20: [mem 0xf8ff8000-0xf8ffbfff 64bit pref]</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.320279] pci 0000:05:00.0: supports D1 D2</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.320280] pci 0000:05:00.0: PME# suppor=
ted from D0 D1 D2 D3hot D3cold</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.328130] pci 0000:00:0a.0: PCI bridge to [bus 05]</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.328134] pci 0000:00:0a.0: =C2=A0 bridge window =
[io =C2=A00xe000-0xefff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3=
28138] pci 0000:00:0a.0: =C2=A0 bridge window [mem 0xf8f00000-0xf8ffffff 64=
bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.328209] pci 0000=
:00:14.4: PCI bridge to [bus 06] (subtractive decode)</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.328219] pci 0000:00:14.4: =C2=A0 bridge window =
[io =C2=A00x0000-0x0cf7] (subtractive decode)</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.328220] pci 0000:00:14.4: =C2=A0 bridge window [io =C2=
=A00x0d00-0xffff] (subtractive decode)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.328221] pci 0000:00:14.4: =C2=A0 bridge window [mem 0x000a00=
00-0x000bffff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.328223] pci 0000:00:14.4: =C2=A0 bridge window [mem 0x000d0000-=
0x000dffff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.328224] pci 0000:00:14.4: =C2=A0 bridge window [mem 0xd0000000-0xdf=
ffffff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.328225] pci 0000:00:14.4: =C2=A0 bridge window [mem 0xf0000000-0xfebff=
fff] (subtractive decode)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
328246] pci_bus 0000:00: on NUMA node 0</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.328858] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 7 10 11 12 1=
4 15) *0, disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.328900=
] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 7 10 11 12 14 15) *0, disabled.</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.328942] ACPI: PCI Interrupt=
 Link [LNKC] (IRQs 10 12 14 15) *0, disabled.</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A00.328981] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 7 10 11=
 12 14 15) *0, disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3=
29021] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 10 11 12 14 15) *0, disabled=
.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329061] ACPI: PCI Interr=
upt Link [LNKF] (IRQs 4 10 11 12 14 15) *0, disabled.</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.329101] ACPI: PCI Interrupt Link [LNKG] (IRQs 4=
 10 11 12 14 15) *0, disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.329143] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 7 10 11 12 14 15) *0, =
disabled.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329200] ACPI: En=
abled 1 GPEs in block 00 to 1F</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.329282] vgaarb: setting as boot device: PCI:0000:01:00.0</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.329285] vgaarb: device added: PCI:0000:=
01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A00.329288] vgaarb: loaded</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.329290] vgaarb: bridge control possible 0000:01:00.0=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329498] SCSI subsystem in=
itialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329545] libata v=
ersion 3.00 loaded.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329567=
] ACPI: bus type USB registered</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.329583] usbcore: registered new interface driver usbfs</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.329592] usbcore: registered new interf=
ace driver hub</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.329612] usb=
core: registered new device driver usb</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.329737] PCI: Using ACPI for IRQ routing</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A00.337703] PCI: pci_cache_line_size set to 64 byt=
es</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.337758] e820: reserve R=
AM buffer [mem 0x0009dc00-0x0009ffff]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.337759] e820: reserve RAM buffer [mem 0xcffa0000-0xcfffffff]</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.337760] e820: reserve RAM bu=
ffer [mem 0x22f000000-0x22fffffff]</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.337848] NetLabel: Initializing</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.337849] NetLabel: =C2=A0domain hash size =3D 128</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.337851] NetLabel: =C2=A0protocols =3D=
 UNLABELED CIPSOv4</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.337861]=
 NetLabel: =C2=A0unlabeled traffic allowed by default</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A00.337907] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0=
, 0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.337912] hpet0: 4 compa=
rators, 32-bit 14.318180 MHz counter</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.339983] Switched to clocksource hpet</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.345803] AppArmor: AppArmor Filesystem Enabled</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.345823] pnp: PnP ACPI init</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.345835] ACPI: bus type PNP regi=
stered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.345949] system 00:0=
0: Plug and Play ACPI device, IDs PNP0c02 (active)</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.345997] pnp 00:01: Plug and Play ACPI device, IDs =
PNP0b00 (active)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346391] s=
ystem 00:02: [mem 0xfec00000-0xfec00fff] could not be reserved</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.346394] system 00:02: [mem 0xfee00000-=
0xfee00fff] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.346397] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346596] system 00:03: [io =
=C2=A00x04d0-0x04d1] has been reserved</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.346599] system 00:03: [io =C2=A00x040b] has been reserved</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346602] system 00:03: [io =
=C2=A00x04d6] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.346605] system 00:03: [io =C2=A00x0c00-0x0c01] has been reserved</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346607] system 00:03: [io =
=C2=A00x0c14] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.346610] system 00:03: [io =C2=A00x0c50-0x0c51] has been reserved</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346613] system 00:03: [io =
=C2=A00x0c52] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.346615] system 00:03: [io =C2=A00x0c6c] has been reserved</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.346618] system 00:03: [io =C2=A00x0=
c6f] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346=
620] system 00:03: [io =C2=A00x0cd0-0x0cd1] has been reserved</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.346623] system 00:03: [io =C2=A00x0cd2-=
0x0cd3] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.=
346626] system 00:03: [io =C2=A00x0cd4-0x0cd5] has been reserved</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A00.346628] system 00:03: [io =C2=A00x0c=
d6-0x0cd7] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.346631] system 00:03: [io =C2=A00x0cd8-0x0cdf] has been reserved</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346634] system 00:03: [io =C2=
=A00x0800-0x089f] could not be reserved</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.346636] system 00:03: [io =C2=A00x0b00-0x0b0f] has been rese=
rved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346639] system 00:03:=
 [io =C2=A00x0b20-0x0b3f] has been reserved</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A00.346642] system 00:03: [io =C2=A00x0900-0x090f] has been r=
eserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346644] system 00:=
03: [io =C2=A00x0910-0x091f] has been reserved</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A00.346647] system 00:03: [io =C2=A00xfe00-0xfefe] has bee=
n reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346650] system =
00:03: [mem 0xffb80000-0xffbfffff] has been reserved</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A00.346653] system 00:03: [mem 0xfec10000-0xfec1001f=
] has been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346656=
] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.346855] pnp 00:04: [dma 0 disabled]</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346903] pnp 00:04: Plug and=
 Play ACPI device, IDs PNP0501 (active)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.346983] system 00:05: [io =C2=A00x0290-0x029f] has been rese=
rved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.346986] system 00:05:=
 Plug and Play ACPI device, IDs PNP0c02 (active)</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A00.347038] system 00:06: [mem 0xe0000000-0xefffffff] ha=
s been reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.347041] sy=
stem 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.347225] system 00:07: [mem 0x00000000-0x0=
009ffff] could not be reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.347228] system 00:07: [mem 0x000e0000-0x000fffff] could not be reserve=
d</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.347231] system 00:07: [m=
em 0x00100000-0xcfffffff] could not be reserved</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A00.347234] system 00:07: [mem 0xfec00000-0xffffffff] cou=
ld not be reserved</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.347237]=
 system 00:07: Plug and Play ACPI device, IDs PNP0c01 (active)</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A00.347320] pnp: PnP ACPI: found 8 devices=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.347322] ACPI: bus type PN=
P unregistered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353807] pci=
 0000:00:02.0: PCI bridge to [bus 01]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.353810] pci 0000:00:02.0: =C2=A0 bridge window [io =C2=A00xa000=
-0xafff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353814] pci 0000:=
00:02.0: =C2=A0 bridge window [mem 0xfa000000-0xfe8fffff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.353817] pci 0000:00:02.0: =C2=A0 bridge w=
indow [mem 0xd0000000-0xdfffffff 64bit pref]</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A00.353822] pci 0000:00:06.0: PCI bridge to [bus 02]</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.353824] pci 0000:00:06.0: =C2=A0 =
bridge window [io =C2=A00xb000-0xbfff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.353828] pci 0000:00:06.0: =C2=A0 bridge window [mem 0xfe9000=
00-0xfe9fffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353831] pci=
 0000:00:06.0: =C2=A0 bridge window [mem 0xf8e00000-0xf8efffff 64bit pref]<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353835] pci 0000:00:07.0: =
PCI bridge to [bus 03]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353=
838] pci 0000:00:07.0: =C2=A0 bridge window [io =C2=A00xc000-0xdfff]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353841] pci 0000:00:07.0: =C2=A0=
 bridge window [mem 0xfea00000-0xfeafffff]</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.353846] pci 0000:00:09.0: PCI bridge to [bus 04]</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A00.353849] pci 0000:00:09.0: =C2=A0 br=
idge window [mem 0xfeb00000-0xfebfffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.353853] pci 0000:00:0a.0: PCI bridge to [bus 05]</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A00.353856] pci 0000:00:0a.0: =C2=A0 brid=
ge window [io =C2=A00xe000-0xefff]</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.353860] pci 0000:00:0a.0: =C2=A0 bridge window [mem 0xf8f00000-0xf=
8ffffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353864=
] pci 0000:00:14.4: PCI bridge to [bus 06]</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A00.353876] pci_bus 0000:00: resource 4 [io =C2=A00x0000-0x0cf=
7]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353877] pci_bus 0000:00=
: resource 5 [io =C2=A00x0d00-0xffff]</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.353878] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353880] pci_bus 0000:00: =
resource 7 [mem 0x000d0000-0x000dffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.353881] pci_bus 0000:00: resource 8 [mem 0xd0000000-0xdfffff=
ff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353882] pci_bus 0000:0=
0: resource 9 [mem 0xf0000000-0xfebfffff]</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A00.353883] pci_bus 0000:01: resource 0 [io =C2=A00xa000-0xafff=
]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353885] pci_bus 0000:01:=
 resource 1 [mem 0xfa000000-0xfe8fffff]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.353886] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffff=
ff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353887] pci=
_bus 0000:02: resource 0 [io =C2=A00xb000-0xbfff]</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A00.353888] pci_bus 0000:02: resource 1 [mem 0xfe900000=
-0xfe9fffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353889] pci_b=
us 0000:02: resource 2 [mem 0xf8e00000-0xf8efffff 64bit pref]</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A00.353891] pci_bus 0000:03: resource 0 [io=
 =C2=A00xc000-0xdfff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3538=
92] pci_bus 0000:03: resource 1 [mem 0xfea00000-0xfeafffff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.353893] pci_bus 0000:04: resource 1 [mem =
0xfeb00000-0xfebfffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353=
894] pci_bus 0000:05: resource 0 [io =C2=A00xe000-0xefff]</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A00.353896] pci_bus 0000:05: resource 2 [mem =
0xf8f00000-0xf8ffffff 64bit pref]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.353897] pci_bus 0000:06: resource 4 [io =C2=A00x0000-0x0cf7]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353898] pci_bus 0000:06: resourc=
e 5 [io =C2=A00x0d00-0xffff]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A00.353899] pci_bus 0000:06: resource 6 [mem 0x000a0000-0x000bffff]</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353900] pci_bus 0000:06: resourc=
e 7 [mem 0x000d0000-0x000dffff]</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.353902] pci_bus 0000:06: resource 8 [mem 0xd0000000-0xdfffffff]</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.353903] pci_bus 0000:06: reso=
urce 9 [mem 0xf0000000-0xfebfffff]</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A00.353923] NET: Registered protocol family 2</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A00.354110] TCP established hash table entries: 65536 =
(order: 7, 524288 bytes)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.3=
54288] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A00.354512] TCP: Hash tables configur=
ed (established 65536 bind 65536)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A00.354544] TCP: reno registered</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A00.354554] UDP hash table entries: 4096 (order: 5, 131072 bytes)</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.354595] UDP-Lite hash table=
 entries: 4096 (order: 5, 131072 bytes)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A00.354661] NET: Registered protocol family 1</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A00.800566] pci 0000:01:00.0: Video device with =
shadowed ROM</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.800712] PCI: =
CLS 64 bytes, default 64</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A00.8=
00769] Trying to unpack rootfs image as initramfs...</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A01.010395] Freeing initrd memory: 19124K (ffff88003=
5a96000 - ffff880036d43000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.010691] PCI-DMA: Disabling AGP.</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.010769] PCI-DMA: aperture base @ c4000000 size 65536 KB</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.010771] PCI-DMA: using GART IOMMU.</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.010774] PCI-DMA: Reserving 6=
4MB of IOMMU area in the AGP aperture</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.014431] perf: AMD NB counters detected</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A01.014496] microcode: CPU0: patch_level=3D0x06000817<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014503] microcode: CPU1: p=
atch_level=3D0x06000817</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.01=
4513] microcode: CPU2: patch_level=3D0x06000817</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A01.014523] microcode: CPU3: patch_level=3D0x06000817</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014533] microcode: CPU4: patc=
h_level=3D0x06000817</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.01454=
4] microcode: CPU5: patch_level=3D0x06000817</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.014553] microcode: CPU6: patch_level=3D0x06000817</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014564] microcode: CPU7: patch_l=
evel=3D0x06000817</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014613] =
microcode: Microcode Update Driver: v2.00 &lt;<a href=3D"mailto:tigran@aiva=
zian.fsnet.co.uk" target=3D"_blank">tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org</a>&gt;, Pe=
ter Oruba</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014619] LVT offs=
et 0 assigned for vector 0x400</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.014639] perf: AMD IBS detected (0x000000ff)</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.014657] Scanning for low memory corruption every 60 =
seconds</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.014968] futex hash=
 table entries: 2048 (order: 5, 131072 bytes)</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.014992] Initialise system trusted keyring</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.015010] audit: initializing netlink sub=
sys (disabled)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.015024] aud=
it: type=3D2000 audit<a href=3D"tel:%281434064609" value=3D"+551434064609" =
target=3D"_blank">(1434064609</a>.896:1): initialized</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.015292] HugeTLB registered 2 MB page size, pre-=
allocated 0 pages</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.016720] =
zpool: loaded</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.016723] zbud=
: loaded</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.016845] VFS: Disk=
 quotas dquot_6.5.2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.016876=
] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.017318] fuse init (API version 7.23)</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017394] msgmni has been set to=
 15932</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017442] Key type bi=
g_key registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017828] K=
ey type asymmetric registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.017831] Asymmetric key parser &#39;x509&#39; registered</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.017862] Block layer SCSI generic (bsg) d=
river version 0.4 loaded (major 252)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.017915] io scheduler noop registered</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.017918] io scheduler deadline registered (default)</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.017960] io scheduler cfq re=
gistered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018161] pcieport =
0000:00:02.0: irq 40 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.018295] pcieport 0000:00:06.0: irq 41 for MSI/MSI-X</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.018422] pcieport 0000:00:07.0: irq 42 fo=
r MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018463] pciepo=
rt 0000:00:09.0: irq 43 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.018590] pcieport 0000:00:0a.0: irq 44 for MSI/MSI-X</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.018646] pci_hotplug: PCI Hot Plug PCI=
 Core version: 0.5</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.018661]=
 pciehp: PCI Express Hot Plug Controller Driver version: 0.4</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.018704] vesafb: mode is 640x480x32, line=
length=3D2560, pages=3D0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.0=
18706] vesafb: scrolling: redraw</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.018708] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.026887] vesafb: framebuffer at 0=
xfb000000, mapped to 0xffffc90010e80000, using 1216k, total 1216k</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.027623] Console: switching to colou=
r frame buffer device 80x30</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.028274] fb0: VESA VGA frame buffer device</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A01.028370] input: Power Button as /devices/LNXSYSTM:00/LNXSY=
BUS:00/PNP0C0C:00/input/input0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.028398] ACPI: Power Button [PWRB]</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.028444] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN=
:00/input/input1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.029305] A=
CPI: Power Button [PWRF]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.0=
29779] ACPI: acpi_idle registered with cpuidle</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A01.030211] GHES: HEST is not enabled!</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.030719] Serial: 8250/16550 driver, 32 ports, =
IRQ sharing enabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.051604=
] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) is a 16550A</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.054011] Linux agpgart inter=
face v0.103</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.055645] brd: m=
odule loaded</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.056690] loop:=
 module loaded</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.057325] lib=
phy: Fixed MDIO Bus: probed</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.057761] tun: Universal TUN/TAP device driver, 1.6</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A01.058190] tun: (C) 1999-2004 Max Krasnyansky &lt;<a=
 href=3D"mailto:maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org" target=3D"_blank">maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org</a>&=
gt;</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.058676] PPP generic dr=
iver version 2.4.2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.059153]=
 ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Controller (EHCI) Driver</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A01.059606] ehci-pci: EHCI PCI platfo=
rm driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.060181] ehci-pci=
 0000:00:12.2: EHCI Host Controller</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.060640] ehci-pci 0000:00:12.2: new USB bus registered, assigned=
 bus number 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.061560] ehci=
-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workar=
ound</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.062496] ehci-pci 0000=
:00:12.2: debug port 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.062=
998] ehci-pci 0000:00:12.2: irq 17, io mem 0xf9fff800</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.072731] ehci-pci 0000:00:12.2: USB 2.0 started,=
 EHCI 1.00</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.073227] usb usb=
1: New USB device found, idVendor=3D1d6b, idProduct=3D0002</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.073681] usb usb1: New USB device strings:=
 Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.074551] usb usb1: Product: EHCI Host Controller</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.074973] usb usb1: Manufacturer: Linux =
3.16.0-38-generic ehci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01=
.075404] usb usb1: SerialNumber: 0000:00:12.2</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.075971] hub 1-0:1.0: USB hub found</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.076402] hub 1-0:1.0: 6 ports detected</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A01.077091] ehci-pci 0000:00:13.2: EHC=
I Host Controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.077521] =
ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.078364] ehci-pci 0000:00:13.2: a=
pplying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.079229] ehci-pci 0000:00:13.2: debug port=
 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.079699] ehci-pci 0000:0=
0:13.2: irq 19, io mem 0xf9fff400</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.088779] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.089269] usb usb2: New USB device fo=
und, idVendor=3D1d6b, idProduct=3D0002</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.089718] usb usb2: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.090=
598] usb usb2: Product: EHCI Host Controller</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.091031] usb usb2: Manufacturer: Linux 3.16.0-38-generic =
ehci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.091458] usb usb2:=
 SerialNumber: 0000:00:13.2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.092027] hub 2-0:1.0: USB hub found</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.092455] hub 2-0:1.0: 6 ports detected</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A01.093003] ehci-platform: EHCI generic platform driver=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.093427] ohci_hcd: USB 1.1=
 &#39;Open&#39; Host Controller (OHCI) Driver</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.093842] ohci-pci: OHCI PCI platform driver</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.094365] ohci-pci 0000:00:12.0: OHCI PC=
I host controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.094785] =
ohci-pci 0000:00:12.0: new USB bus registered, assigned bus number 3</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.095643] ohci-pci 0000:00:12.0: i=
rq 16, io mem 0xf9ffe000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.1=
52862] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0001</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.153294] usb usb3: New USB de=
vice strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A01.154140] usb usb3: Product: OHCI PCI host control=
ler</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.154576] usb usb3: Manu=
facturer: Linux 3.16.0-38-generic ohci_hcd</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.155016] usb usb3: SerialNumber: 0000:00:12.0</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.155600] hub 3-0:1.0: USB hub found</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.156043] hub 3-0:1.0: 3 ports d=
etected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.156655] ohci-pci 0=
000:00:12.1: OHCI PCI host controller</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.157090] ohci-pci 0000:00:12.1: new USB bus registered, assigned=
 bus number 4</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.157929] ohci=
-pci 0000:00:12.1: irq 16, io mem 0xf9ffd000</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.216925] usb usb4: New USB device found, idVendor=3D1d6b,=
 idProduct=3D0001</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.217364] =
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.218228] usb usb4: Product: O=
HCI PCI host controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.21=
8669] usb usb4: Manufacturer: Linux 3.16.0-38-generic ohci_hcd</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.219105] usb usb4: SerialNumber: 0000:0=
0:12.1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.219692] hub 4-0:1.0=
: USB hub found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.220126] hu=
b 4-0:1.0: 3 ports detected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.220728] ohci-pci 0000:00:13.0: OHCI PCI host controller</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.221161] ohci-pci 0000:00:13.0: new USB bu=
s registered, assigned bus number 5</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.222054] ohci-pci 0000:00:13.0: irq 18, io mem 0xf9ffc000</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.280989] usb usb5: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0001</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A01.281442] usb usb5: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.282=
335] usb usb5: Product: OHCI PCI host controller</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.282785] usb usb5: Manufacturer: Linux 3.16.0-38-gene=
ric ohci_hcd</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.283234] usb u=
sb5: SerialNumber: 0000:00:13.0</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.283833] hub 5-0:1.0: USB hub found</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.284272] hub 5-0:1.0: 3 ports detected</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.284875] ohci-pci 0000:00:13.1: OHCI PCI host c=
ontroller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.285305] ohci-pci=
 0000:00:13.1: new USB bus registered, assigned bus number 6</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.286172] ohci-pci 0000:00:13.1: irq 18, i=
o mem 0xf9ffb000</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.345068] u=
sb usb6: New USB device found, idVendor=3D1d6b, idProduct=3D0001</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A01.345522] usb usb6: New USB device str=
ings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.346411] usb usb6: Product: OHCI PCI host controller</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.346858] usb usb6: Manufacturer=
: Linux 3.16.0-38-generic ohci_hcd</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.347307] usb usb6: SerialNumber: 0000:00:13.1</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A01.347896] hub 6-0:1.0: USB hub found</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.348335] hub 6-0:1.0: 3 ports detected<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.348937] ohci-pci 0000:00:1=
4.5: OHCI PCI host controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.349366] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus nu=
mber 7</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.350231] ohci-pci 00=
00:00:14.5: irq 18, io mem 0xf9ffa000</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.409109] usb usb7: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0001</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.409546] usb usb=
7: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.410403] usb usb7: Product: OHCI PCI=
 host controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.410846] u=
sb usb7: Manufacturer: Linux 3.16.0-38-generic ohci_hcd</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A01.411294] usb usb7: SerialNumber: 0000:00:14.5<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.411881] hub 7-0:1.0: USB h=
ub found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.412320] hub 7-0:1=
.0: 2 ports detected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.41280=
9] ohci-platform: OHCI generic platform driver</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A01.413242] uhci_hcd: USB Universal Host Controller Interf=
ace driver</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.413734] xhci_hc=
d 0000:04:00.0: xHCI Host Controller</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.414166] xhci_hcd 0000:04:00.0: new USB bus registered, assigned=
 bus number 8</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.415118] xhci=
_hcd 0000:04:00.0: irq 45 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.415165] usb usb8: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0002</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.415619] usb =
usb8: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.416507] usb usb8: Product: xHCI =
Host Controller</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.416952] us=
b usb8: Manufacturer: Linux 3.16.0-38-generic xhci_hcd</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.417409] usb usb8: SerialNumber: 0000:04:00.0</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.417980] hub 8-0:1.0: USB hu=
b found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.418413] hub 8-0:1.=
0: 4 ports detected</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.418922=
] xhci_hcd 0000:04:00.0: xHCI Host Controller</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.419346] xhci_hcd 0000:04:00.0: new USB bus registered, =
assigned bus number 9</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.4202=
24] usb usb9: New USB device found, idVendor=3D1d6b, idProduct=3D0003</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.420676] usb usb9: New USB devic=
e strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A01.421566] usb usb9: Product: xHCI Host Controller</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.422009] usb usb9: Manufacture=
r: Linux 3.16.0-38-generic xhci_hcd</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.422453] usb usb9: SerialNumber: 0000:04:00.0</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A01.423014] hub 9-0:1.0: USB hub found</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.423450] hub 9-0:1.0: 4 ports detect=
ed</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.423994] i8042: PNP: No =
PS/2 controller found. Probing ports directly.</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A01.426976] serio: i8042 KBD port at 0x60,0x64 irq 1</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.427395] serio: i8042 AUX port a=
t 0x60,0x64 irq 12</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.427950]=
 mousedev: PS/2 mouse device common for all mice</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.428542] rtc_cmos 00:01: RTC can wake from S4</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A01.429140] rtc_cmos 00:01: rtc core:=
 registered rtc_cmos as rtc0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.429594] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, =
hpet irqs</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.430501] device-m=
apper: uevent: version 1.0.3</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.431015] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30) initialised: <=
a href=3D"mailto:dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" target=3D"_blank">dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org=
</a></div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.431876] ledtrig-cpu: =
registered to indicate activity on CPUs</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.432385] TCP: cubic registered</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.432912] NET: Registered protocol family 10</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.433562] NET: Registered protocol family=
 17</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.433981] Key type dns_r=
esolver registered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.435067]=
 Loading compiled-in X.509 certificates</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.436122] Loaded X.509 cert &#39;Magrathea: Glacier signing ke=
y: c284edaccf0b473652c34d23bec356944236e63b&#39;</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A01.436985] registered taskstats version 1</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A01.439184] Key type trusted registered</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.442721] Key type encrypted re=
gistered</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.443116] AppArmor:=
 AppArmor sha1 policy hashing enabled</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A01.443514] ima: No TPM chip found, activating TPM-bypass!</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A01.443921] evm: HMAC attrs: 0x1</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.444727] =C2=A0 Magic number: 3:=
985:301</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.445140] tty tty30:=
 hash matches</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.445619] rtc_=
cmos 00:01: setting system clock to 2015-06-11 23:16:51 UTC (1434064611)</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.446702] acpi-cpufreq: overri=
ding BIOS provided _PSD data</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.447525] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A01.447941] EDD information not availab=
le.</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.448403] PM: Hibernatio=
n image not present or could not be loaded.</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A01.449473] Freeing unused kernel memory: 1352K (ffffffff81d1=
c000 - ffffffff81e6e000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.4=
50347] Write protecting the kernel read-only data: 12288k</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.452474] Freeing unused kernel memory: 556=
K (ffff880001775000 - ffff880001800000)</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.454811] Freeing unused kernel memory: 500K (ffff880001b83000=
 - ffff880001c00000)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.46709=
7] systemd-udevd[144]: starting version 204</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A01.482331] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.482910] ahci 0000:00:11.0: =
version 3.0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483020] r8169 =
0000:02:00.0: irq 46 for MSI/MSI-X</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.483144] ahci 0000:00:11.0: AHCI 0001.0100 32 slots 4 ports 3 Gbps =
0xf impl SATA mode</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483256]=
 r8169 0000:02:00.0 eth0: RTL8168e/8111e at 0xffffc90010e66000, e8:de:27:01=
:f6:19, XID 0c200000 IRQ 46</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
1.483257] r8169 0000:02:00.0 eth0: jumbo features [frames: 9200 bytes, tx c=
hecksumming: ko]</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483275] r=
8169 Gigabit Ethernet driver 2.3LK-NAPI loaded</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A01.483500] r8169 0000:05:00.0: irq 47 for MSI/MSI-X</div>=
<div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483671] r8169 0000:05:00.0 eth1=
: RTL8168evl/8111evl at 0xffffc90010fb4000, d0:50:99:30:c6:76, XID 0c900800=
 IRQ 47</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.483672] r8169 0000=
:05:00.0 eth1: jumbo features [frames: 9200 bytes, tx checksumming: ko]</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.488749] ahci 0000:00:11.0: fl=
ags: 64bit ncq sntf ilck pm led clo pmp pio slum part ccc=C2=A0</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A01.490977] scsi0 : ahci</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A01.492030] scsi1 : ahci</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A01.494136] scsi2 : ahci</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A01.494821] scsi3 : ahci</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A01.495406] ata1: SATA max UDMA/133 abar m1024@0xf9fffc00 po=
rt 0xf9fffd00 irq 22</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.49640=
4] ata2: SATA max UDMA/133 abar m1024@0xf9fffc00 port 0xf9fffd80 irq 22</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.497415] ata3: SATA max UDMA/1=
33 abar m1024@0xf9fffc00 port 0xf9fffe00 irq 22</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A01.498417] ata4: SATA max UDMA/133 abar m1024@0xf9fffc00=
 port 0xf9fffe80 irq 22</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.49=
9589] ahci 0000:03:00.0: irq 48 for MSI/MSI-X</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A01.499613] ahci 0000:03:00.0: SSS flag set, parallel bus s=
can disabled</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.500164] ahci =
0000:03:00.0: AHCI 0001.0200 32 slots 2 ports 6 Gbps 0x3 impl SATA mode</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.501225] ahci 0000:03:00.0: fl=
ags: 64bit ncq sntf stag led clo pmp pio slum part ccc sxs=C2=A0</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A01.501229] scsi4 : pata_atiixp</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A01.501445] scsi5 : pata_atiixp</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.501573] ata5: PATA max UDMA/100 =
cmd 0x1f0 ctl 0x3f6 bmdma 0xff00 irq 14</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A01.501573] ata6: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x=
ff08 irq 15</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.504907] scsi6 =
: ahci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.505613] scsi7 : ahc=
i</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.506270] ata7: SATA max U=
DMA/133 abar m512@0xfeaffc00 port 0xfeaffd00 irq 48</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A01.507196] ata8: SATA max UDMA/133 abar m512@0xfeaff=
c00 port 0xfeaffd80 irq 48</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01=
.529416] systemd-udevd[147]: renamed network interface eth1 to p10p1</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A01.545433] systemd-udevd[152]: rena=
med network interface eth0 to p7p1</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.573331] usb 2-2: new high-speed USB device number 2 using ehci-pci=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.685915] ata6.01: ATAPI: H=
L-DT-STDVD-RAM GSA-H58N, 1.00, max UDMA/66</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A01.701871] ata6.01: configured for UDMA/66</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A01.706182] usb 2-2: New USB device found, idVen=
dor=3D0ace, idProduct=3D1215</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A01.706692] usb 2-2: New USB device strings: Mfr=3D16, Product=3D32, Seria=
lNumber=3D0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.707680] usb 2-=
2: Product: USB2.0 WLAN</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.70=
8165] usb 2-2: Manufacturer: ZyDAS</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A01.817520] ata1: SATA link down (SStatus 0 SControl 300)</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.818101] ata3: SATA link down (SStatus =
0 SControl 300)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.818587] at=
a4: SATA link down (SStatus 0 SControl 300)</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A01.819049] ata2: SATA link down (SStatus 0 SControl 300)</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.821142] scsi 5:0:1:0: CD-ROM =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HL-DT-ST DVD-RAM GSA-H58N 1.00 PQ:=
 0 ANSI: 5</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.831872] sr0: sc=
si3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.832776] cdrom: Uniform CD-ROM driver R=
evision: 3.20</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.833371] sr 5=
:0:1:0: Attached scsi CD-ROM sr0</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.833487] sr 5:0:1:0: Attached scsi generic sg0 type 5</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A01.841543] usb 4-1: new low-speed USB devic=
e number 2 using ohci-pci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.=
997384] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A01.998773] ata7.00: ATA-9: SSD2SC120G1SA7=
54D117-820, N0530A, max UDMA/133</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A01.999239] ata7.00: 234441648 sectors, multi 1: LBA48 NCQ (depth 31/32=
), AA</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A01.999981] ata7.00: con=
figured for UDMA/133</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.00055=
0] scsi 6:0:0:0: Direct-Access =C2=A0 =C2=A0 ATA =C2=A0 =C2=A0 =C2=A0SSD2SC=
120G1SA754 0A =C2=A0 PQ: 0 ANSI: 5</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A02.001687] sd 6:0:0:0: [sda] 234441648 512-byte logical blocks: (120 =
GB/111 GiB)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.001692] sd 6:0=
:0:0: Attached scsi generic sg1 type 0</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A02.003149] sd 6:0:0:0: [sda] Write Protect is off</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A02.003554] sd 6:0:0:0: [sda] Mode Sense: 0=
0 3a 00 00</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.003683] sd 6:0:=
0:0: [sda] Write cache: enabled, read cache: enabled, doesn&#39;t support D=
PO or FUA</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.005117] =C2=A0sd=
a: sda1 sda2 sda3</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.005816] =
sd 6:0:0:0: [sda] Attached SCSI disk</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A02.008240] tsc: Refined TSC clocksource calibration: 4653.112 MHz<=
/div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.013385] usb 4-1: New USB d=
evice found, idVendor=3D04d9, idProduct=3D0022</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A02.013882] usb 4-1: New USB device strings: Mfr=3D0, Prod=
uct=3D2, SerialNumber=3D0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.=
014284] usb 4-1: Product: USB Keyboard</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A02.018348] hidraw: raw HID events driver (C) Jiri Kosina</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A02.042342] usbcore: registered new =
interface driver usbhid</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.04=
2763] usbhid: USB HID core driver</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A02.044476] input: USB Keyboard as /devices/pci0000:00/0000:00:12.1/usb=
4/4-1/4-1:1.0/0003:04D9:0022.0001/input/input5</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A02.045444] hid-generic 0003:04D9:0022.0001: input,hidraw0=
: USB HID v1.10 Keyboard [USB Keyboard] on usb-0000:00:12.1-1/input0</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A02.046435] input: USB Keyboard as /=
devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.1/0003:04D9:0022.0002/input/=
input6</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02.047461] hid-generic=
 0003:04D9:0022.0002: input,hidraw1: USB HID v1.10 Device [USB Keyboard] on=
 usb-0000:00:12.1-1/input1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A02=
.303673] ata8: SATA link down (SStatus 0 SControl 300)</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A02.920111] Switched to clocksource tsc</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A04.382933] floppy0: no floppy controlle=
rs found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.272503] EXT4-fs (=
sda2): mounted filesystem with ordered data mode. Opts: (null)</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.364061] random: init urandom read with=
 70 bits of entropy available</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.388873] init: plymouth-upstart-bridge main process (237) terminated wi=
th status 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.389819] init: =
plymouth-upstart-bridge main process ended, respawning</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A07.394387] init: plymouth-upstart-bridge main pro=
cess (246) terminated with status 1</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A07.395354] init: plymouth-upstart-bridge main process ended, respa=
wning</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.399374] init: plymou=
th-upstart-bridge main process (250) terminated with status 1</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A07.400340] init: plymouth-upstart-bridge m=
ain process ended, respawning</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.402987] init: plymouth-upstart-bridge main process (254) terminated wi=
th status 1</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.403967] init: =
plymouth-upstart-bridge main process ended, respawning</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A07.495806] Adding 2097148k swap on /dev/sda1.=C2=
=A0 Priority:-1 extents:1 across:2097148k SSFS</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A07.499478] EXT4-fs (sda2): re-mounted. Opts: errors=3Drem=
ount-ro</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.607450] systemd-ud=
evd[399]: starting version 204</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.619836] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opt=
s: (null)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.629983] lp: driv=
er loaded but no devices found</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.637946] ppdev: user-space parallel port driver</div><div class=3D"gmai=
l_extra">[ =C2=A0 =C2=A07.647449] wmi: Mapper loaded</div><div class=3D"gma=
il_extra">[ =C2=A0 =C2=A07.647894] shpchp: Standard Hot Plug PCI Controller=
 Driver version: 0.4</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.65518=
7] [drm] Initialized drm 1.1.0 20060810</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.664060] ACPI Warning: SystemIO range 0x0000000000000b00-0x00=
00000000000b07 conflicts with OpRegion 0x0000000000000b00-0x0000000000000b0=
f (\SOR1) (20140424/utaddress-258)</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A07.664067] ACPI: If an ACPI driver is available for this device, you =
should use it instead of the native driver</div><div class=3D"gmail_extra">=
[ =C2=A0 =C2=A07.672812] MCE: In-kernel MCE decoding enabled.</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A07.674623] EDAC MC: Ver: 3.0.0</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A07.675757] checking generic (fb000000 13=
0000) vs hw (d0000000 10000000)</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.675759] checking generic (fb000000 130000) vs hw (fa000000 2000000)=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.675761] fb: switching to =
nouveaufb from VESA VGA</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.67=
5782] Console: switching to colour dummy device 80x25</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A07.675981] AMD64 EDAC driver v3.4.0</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A07.676002] EDAC amd64: DRAM ECC disabled.</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.676008] EDAC amd64: ECC dis=
abled in the BIOS or no ECC capability, module will not load.</div><div cla=
ss=3D"gmail_extra">[ =C2=A0 =C2=A07.676008] =C2=A0Either enable ECC checkin=
g or force module loading by setting &#39;ecc_enable_override&#39;.</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A07.676008] =C2=A0(Note that use of t=
he override may cause unknown side effects.)</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A07.676119] nouveau =C2=A0[ =C2=A0DEVICE][0000:01:00.0] BOOT=
0 =C2=A0: 0x298280a2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.67612=
2] nouveau =C2=A0[ =C2=A0DEVICE][0000:01:00.0] Chipset: G98 (NV98)</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A07.676123] nouveau =C2=A0[ =C2=A0DEVI=
CE][0000:01:00.0] Family : NV50</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.676213] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] checking PRAMIN=
 for image...</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.693108] AVX =
version of gcm_enc/dec engaged.</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.712757] kvm: Nested Virtualization enabled</div><div class=3D"gmail=
_extra">[ =C2=A0 =C2=A07.712762] kvm: Nested Paging enabled</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A07.733822] nouveau =C2=A0[ =C2=A0 VBIOS][000=
0:01:00.0] ... appears to be valid</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A07.733823] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] using image fr=
om PRAMIN</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.733905] nouveau =
=C2=A0[ =C2=A0 VBIOS][0000:01:00.0] BIT signature found</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A07.733908] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01=
:00.0] version 70.18.36.00.00</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.754325] nouveau 0000:01:00.0: irq 49 for MSI/MSI-X</div><div class=3D"=
gmail_extra">[ =C2=A0 =C2=A07.754335] nouveau =C2=A0[ =C2=A0 =C2=A0 PMC][00=
00:01:00.0] MSI interrupts enabled</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A07.754358] nouveau =C2=A0[ =C2=A0 =C2=A0 PFB][0000:01:00.0] RAM type:=
 DDR2</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.754360] nouveau =C2=
=A0[ =C2=A0 =C2=A0 PFB][0000:01:00.0] RAM size: 1024 MiB</div><div class=3D=
"gmail_extra">[ =C2=A0 =C2=A07.754361] nouveau =C2=A0[ =C2=A0 =C2=A0 PFB][0=
000:01:00.0] =C2=A0 =C2=A0ZCOMP: 960 tags</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A07.764707] sound hdaudioC0D0: autoconfig: line_outs=3D1 (0x14/=
0x0/0x0/0x0/0x0) type:line</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07=
.764710] sound hdaudioC0D0: =C2=A0 =C2=A0speaker_outs=3D0 (0x0/0x0/0x0/0x0/=
0x0)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764712] sound hdaudio=
C0D0: =C2=A0 =C2=A0hp_outs=3D1 (0x1b/0x0/0x0/0x0/0x0)</div><div class=3D"gm=
ail_extra">[ =C2=A0 =C2=A07.764713] sound hdaudioC0D0: =C2=A0 =C2=A0mono: m=
ono_out=3D0x0</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764714] soun=
d hdaudioC0D0: =C2=A0 =C2=A0dig-out=3D0x1e/0x0</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A07.764715] sound hdaudioC0D0: =C2=A0 =C2=A0inputs:</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764717] sound hdaudioC0D0: =C2=
=A0 =C2=A0 =C2=A0Front Mic=3D0x19</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.764718] sound hdaudioC0D0: =C2=A0 =C2=A0 =C2=A0Rear Mic=3D0x18</div=
><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.764719] sound hdaudioC0D0: =C2=
=A0 =C2=A0 =C2=A0Line=3D0x1a</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.777512] input: HDA ATI SB Rear Mic as /devices/pci0000:00/0000:00:14.2=
/sound/card0/input7</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.779263=
] input: HDA ATI SB Line as /devices/pci0000:00/0000:00:14.2/sound/card0/in=
put8</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.779485] input: HDA AT=
I SB Line Out as /devices/pci0000:00/0000:00:14.2/sound/card0/input9</div><=
div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784065] nouveau =C2=A0[ =C2=A0PT=
HERM][0000:01:00.0] FAN control: none / external</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A07.784077] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] =
fan management: automatic</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.=
784079] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] internal sensor: yes</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784087] nouveau =C2=A0[ =C2=
=A0 =C2=A0 CLK][0000:01:00.0] 0f: core 550 MHz shader 1375 MHz memory 266 M=
Hz</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784121] nouveau =C2=A0[=
 =C2=A0 =C2=A0 CLK][0000:01:00.0] --: core 566 MHz shader 1400 MHz memory 2=
65 MHz</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784167] nouveau E[ =
=C2=A0 PDISP][0000:01:00.0] 02:0261: func 08 lookup failed, -2</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.784558] [TTM] Zone =C2=A0kernel: Avail=
able graphics memory: 4079904 kiB</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.784560] [TTM] Zone =C2=A0 dma32: Available graphics memory: 2097152=
 kiB</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784561] [TTM] Initial=
izing pool allocator</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.78456=
7] [TTM] Initializing DMA pool allocator</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.784584] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] VRAM: 1024 MiB</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784586] nouveau =C2=A0[ =C2=
=A0 =C2=A0 DRM] GART: 1048576 MiB</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.784590] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] TMDS table version 2.0</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784593] nouveau =C2=A0[ =C2=
=A0 =C2=A0 DRM] DCB version 4.0</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.784596] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 00: 02000300 00=
000028</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784599] nouveau =C2=
=A0[ =C2=A0 =C2=A0 DRM] DCB outp 01: 01000302 00020030</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A07.784601] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB=
 outp 02: 04011310 00000028</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A0=
7.784603] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 03: 02022322 00c20090=
</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784605] nouveau =C2=A0[ =
=C2=A0 =C2=A0 DRM] DCB conn 00: 00001030</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.784608] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB conn 01: 0000=
0100</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.784610] nouveau =C2=
=A0[ =C2=A0 =C2=A0 DRM] DCB conn 02: 00002261</div><div class=3D"gmail_extr=
a">[ =C2=A0 =C2=A07.790697] [drm] Supports vblank timestamp caching Rev 2 (=
21.10.2013).</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.790699] [drm]=
 Driver supports precise vblank timestamp query.</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A07.799009] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] MM: using=
 M2MF for buffer copies</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.81=
1344] cfg80211: Calling CRDA to update world regulatory domain</div><div cl=
ass=3D"gmail_extra">[ =C2=A0 =C2=A07.833323] cfg80211: World regulatory dom=
ain updated:</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833326] cfg80=
211: =C2=A0DFS Master region: unset</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A07.833327] cfg80211: =C2=A0 (start_freq - end_freq @ bandwidth), (=
max_antenna_gain, max_eirp), (dfs_cac_time)</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A07.833330] cfg80211: =C2=A0 (2402000 KHz - 2472000 KHz @ 400=
00 KHz), (300 mBi, 2000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A07.833331] cfg80211: =C2=A0 (2457000 KHz - 2482000 KHz @ 40000 KHz=
), (300 mBi, 2000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A07.833333] cfg80211: =C2=A0 (2474000 KHz - 2494000 KHz @ 20000 KHz), (300=
 mBi, 2000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833=
335] cfg80211: =C2=A0 (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 20=
00 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.833336] cfg=
80211: =C2=A0 (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm),=
 (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.860841] init: fails=
afe main process (660) killed by TERM signal</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A07.869101] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] allocated 136=
0x768 fb: 0x60000, bo ffff8800cadfe000</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A07.869168] fbcon: nouveaufb (fb0) is primary device</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A07.870010] nouveau E[ DEVINIT][0000:01:0=
0.0] unable to compute acceptable pll values</div><div class=3D"gmail_extra=
">[ =C2=A0 =C2=A07.870012] nouveau E[ DEVINIT][0000:01:00.0] failed pll cal=
culation</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925743] Bluetooth=
: Core ver 2.19</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925758] NE=
T: Registered protocol family 31</div><div class=3D"gmail_extra">[ =C2=A0 =
=C2=A07.925759] Bluetooth: HCI device and connection manager initialized</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925765] Bluetooth: HCI socke=
t layer initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.925767=
] Bluetooth: L2CAP socket layer initialized</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A07.925780] Bluetooth: SCO socket layer initialized</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A07.928636] Bluetooth: RFCOMM TTY layer=
 initialized</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.928640] Bluet=
ooth: RFCOMM socket layer initialized</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A07.928644] Bluetooth: RFCOMM ver 1.11</div><div class=3D"gmail_ext=
ra">[ =C2=A0 =C2=A07.934949] Bluetooth: BNEP (Ethernet Emulation) ver 1.3</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.934949] Bluetooth: BNEP fil=
ters: protocol multicast</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.9=
34954] Bluetooth: BNEP socket layer initialized</div><div class=3D"gmail_ex=
tra">[ =C2=A0 =C2=A07.936155] usb 2-2: reset high-speed USB device number 2=
 using ehci-pci</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A07.938438] in=
it: cups main process (727) killed by HUP signal</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A07.938443] init: cups main process ended, respawning</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.070645] ieee80211 phy0: Sele=
cted rate control algorithm &#39;minstrel_ht&#39;</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A08.070835] zd1211rw 2-2:1.0: phy0</div><div class=3D"g=
mail_extra">[ =C2=A0 =C2=A08.070858] usbcore: registered new interface driv=
er zd1211rw</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.096090] Consol=
e: switching to colour frame buffer device 170x48</div><div class=3D"gmail_=
extra">[ =C2=A0 =C2=A08.096656] nouveau 0000:01:00.0: fb0: nouveaufb frame =
buffer device</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.096657] nouv=
eau 0000:01:00.0: registered panic notifier</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A08.108042] random: nonblocking pool is initialized</div><div=
 class=3D"gmail_extra">[ =C2=A0 =C2=A08.115300] [drm] Initialized nouveau 1=
.1.2 20120801 for 0000:01:00.0 on minor 0</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A08.286280] r8169 0000:02:00.0 p7p1: link down</div><div class=
=3D"gmail_extra">[ =C2=A0 =C2=A08.286309] IPv6: ADDRCONF(NETDEV_UP): p7p1: =
link is not ready</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.403879] =
r8169 0000:05:00.0 p10p1: link down</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A08.403918] IPv6: ADDRCONF(NETDEV_UP): p10p1: link is not ready</di=
v><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.443017] zd1211rw 2-2:1.0: fir=
mware version 4725</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.462399]=
 vboxdrv: module verification failed: signature and/or =C2=A0required key m=
issing - tainting kernel</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.4=
65366] vboxdrv: Found 8 processor cores.</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A08.465801] vboxdrv: fAsync=3D0 offMin=3D0x529 offMax=3D0x3ee0</=
div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.465893] vboxdrv: TSC mode i=
s &#39;synchronous&#39;, kernel timer mode is &#39;normal&#39;.</div><div c=
lass=3D"gmail_extra">[ =C2=A0 =C2=A08.465894] vboxdrv: Successfully loaded =
version 4.3.20 (interface 0x001a0008).</div><div class=3D"gmail_extra">[ =
=C2=A0 =C2=A08.483055] zd1211rw 2-2:1.0: zd1211b chip 0ace:1215 v4810 high =
00-02-72 AL2230_RF pa0 g--NS</div><div class=3D"gmail_extra">[ =C2=A0 =C2=
=A08.519323] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A08.519353] cfg80211: Calling CRDA for c=
ountry: DE</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.521334] cfg8021=
1: Regulatory domain changed to country: DE</div><div class=3D"gmail_extra"=
>[ =C2=A0 =C2=A08.521336] cfg80211: =C2=A0DFS Master region: unset</div><di=
v class=3D"gmail_extra">[ =C2=A0 =C2=A08.521337] cfg80211: =C2=A0 (start_fr=
eq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)</d=
iv><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.521339] cfg80211: =C2=A0 (24=
00000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)</div><div clas=
s=3D"gmail_extra">[ =C2=A0 =C2=A08.521340] cfg80211: =C2=A0 (5150000 KHz - =
5250000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)</div><div class=3D"gmail_e=
xtra">[ =C2=A0 =C2=A08.521342] cfg80211: =C2=A0 (5250000 KHz - 5350000 KHz =
@ 40000 KHz), (N/A, 2000 mBm), (0 s)</div><div class=3D"gmail_extra">[ =C2=
=A0 =C2=A08.521343] cfg80211: =C2=A0 (5470000 KHz - 5725000 KHz @ 40000 KHz=
), (N/A, 2698 mBm), (0 s)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.=
521344] cfg80211: =C2=A0 (57240000 KHz - 65880000 KHz @ 2160000 KHz), (N/A,=
 4000 mBm), (N/A)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A08.671967] =
vboxpci: IOMMU not found (not registered)</div><div class=3D"gmail_extra">[=
 =C2=A0 =C2=A09.153486] init: plymouth-upstart-bridge main process ended, r=
espawning</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.407531] wlan0: a=
uthenticate with 5a:98:26:49:92:24</div><div class=3D"gmail_extra">[ =C2=A0=
 =C2=A09.433096] wlan0: send auth to 5a:98:26:49:92:24 (try 1/3)</div><div =
class=3D"gmail_extra">[ =C2=A0 =C2=A09.434594] wlan0: authenticated</div><d=
iv class=3D"gmail_extra">[ =C2=A0 =C2=A09.436876] wlan0: associate with 5a:=
98:26:49:92:24 (try 1/3)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.4=
43353] wlan0: RX AssocResp from 5a:98:26:49:92:24 (capab=3D0x411 status=3D0=
 aid=3D2)</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.443853] wlan0: a=
ssociated</div><div class=3D"gmail_extra">[ =C2=A0 =C2=A09.443881] IPv6: AD=
DRCONF(NETDEV_CHANGE): wlan0: link becomes ready</div><div class=3D"gmail_e=
xtra">[ =C2=A0 10.655128] floppy0: no floppy controllers found</div><div><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><br></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div>
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
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 DMA z=
one: 21 pages reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] =C2=A0 DMA zone: 3996 pages, LIFO batch:0</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 zone: 13247 p=
ages used for memmap</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] =C2=A0 DMA32 zone: 847776 pages, LIFO batch:31</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =C2=A0 Normal zone: 1939=
2 pages used for memmap</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] =C2=A0 Normal zone: 1241088 pages, LIFO batch:31</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: PM-Timer IO P=
ort: 0x808</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000=
] ACPI: Local APIC address 0xfee00000</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x10] enab=
led)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI=
: LAPIC (acpi_id[0x02] lapic_id[0x11] enabled)</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0=
x12] enabled)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000=
000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x13] enabled)</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x05] l=
apic_id[0x14] enabled)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x15] enabled)</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi=
_id[0x07] lapic_id[0x16] enabled)</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x17] enabled)=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: IO=
APIC (id[0x18] address[0xfec00000] gsi_base[0])</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.000000] IOAPIC[0]: apic_id 24, version 33, a=
ddress 0xfec00000, GSI 0-23</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl=
)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: I=
NT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: IRQ0 used by override.</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI: IRQ2 u=
sed by override.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
000000] ACPI: IRQ9 used by override.</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A00.000000] Using ACPI (MADT) for SMP configuration informa=
tion</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] ACPI=
: HPET id: 0x8300 base: 0xfed00000</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] nr_irqs_gsi: 40</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] PM: Regist=
ered nosave memory: [mem 0x0009d000-0x0009dfff]</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0=
x0009e000-0x0009ffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000e5fff]</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] PM: Registere=
d nosave memory: [mem 0x000e6000-0x000fffff]</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0xcf=
fa0000-0xcffaffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
0.000000] PM: Registered nosave memory: [mem 0xcffb0000-0xcffdffff]</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] PM: Registered n=
osave memory: [mem 0xcffe0000-0xcfffffff]</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0xd0000=
000-0xffdfffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.0=
00000] PM: Registered nosave memory: [mem 0xffe00000-0xffffffff]</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] e820: [mem 0xd00000=
00-0xffdfffff] available for PCI devices</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.000000] Booting paravirtualized kernel on bare hard=
ware</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] setu=
p_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8 nr_node_ids:1</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] PERCPU: Embedde=
d 27 pages/cpu @ffff88022ec00000 s81408 r8192 d20992 u262144</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] pcpu-alloc: s81408 r819=
2 d20992 u262144 alloc=3D1*2097152</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=C2=A0</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Built 1 zonelists in=
 Zone order, mobility grouping on.=C2=A0 Total pages: 2060136</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Policy zone: Normal</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] Kernel comm=
and line: BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-38-generic root=3D/dev/sda2 ro<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] PID hash =
table entries: 4096 (order: 3, 32768 bytes)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.000000] xsave: enabled xstate_bv 0x7, cntxt size=
 0x340</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] AG=
P: Checking aperture...</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] AGP: No AGP bridge found</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.000000] AGP: Node 0: aperture [bus addr 0x00000000-=
0x01ffffff] (32MB)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
0.000000] AGP: Your BIOS doesn&#39;t leave a aperture memory hole</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] AGP: Please enable=
 the IOMMU option in the BIOS setup</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A00.000000] AGP: This costs you 64MB of RAM</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] AGP: Mapping aperture ove=
r RAM [mem 0xc4000000-0xc7ffffff] (65536KB)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.000000] PM: Registered nosave memory: [mem 0xc40=
00000-0xc7ffffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00=
.000000] Memory: 8072292K/8371440K available (7626K kernel code, 1131K rwda=
ta, 3596K rodata, 1352K init, 1300K bss, 299148K reserved)</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=
=3D0-3, MinObjects=3D0, CPUs=3D8, Nodes=3D1</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.000000] Hierarchical RCU implementation.</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] <span style=3D"w=
hite-space:pre-wrap">	</span>RCU dyntick-idle grace-period acceleration is =
enabled.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] =
<span style=3D"white-space:pre-wrap">	</span>RCU restricting CPUs from NR_C=
PUS=3D256 to nr_cpu_ids=3D8.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000000] <span style=3D"white-space:pre-wrap">	</span>Offload RC=
U callbacks from all CPUs</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.000000] <span style=3D"white-space:pre-wrap">	</span>Offload RCU c=
allbacks from CPUs: 0-7.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_id=
s=3D8</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] NR_=
IRQS:16640 nr_irqs:744 16</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.000000] spurious 8259A interrupt: IRQ7.</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.000000] Console: colour dummy device 80x25<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] console [=
tty0] enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000=
000] allocated 33554432 bytes of page_cgroup</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A00.000000] please try &#39;cgroup_disable=3Dmemory=
&#39; option if you don&#39;t want memory cgroups</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.000000] hpet clockevent registered</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000000] tsc: Fast TSC ca=
libration using PIT</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.000000] tsc: Detected 4680.606 MHz processor</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.000020] Calibrating delay loop (skipped), =
value calculated using timer frequency.. 9361.21 BogoMIPS (lpj=3D18722424)<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.000024] pid_max: =
default: 32768 minimum: 301</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.000031] ACPI: Core revision 20140424</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.002757] ACPI: All ACPI Tables successfully =
acquired</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.011663] =
Security Framework initialized</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.011684] AppArmor: AppArmor initialized</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.011686] Yama: becoming mindful.</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.012143] Dentry cache ha=
sh table entries: 1048576 (order: 11, 8388608 bytes)</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.014204] Inode-cache hash table entries:=
 524288 (order: 10, 4194304 bytes)</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.015161] Mount-cache hash table entries: 16384 (order: 5, =
131072 bytes)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015=
170] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015394] Initializin=
g cgroup subsys memory</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.015413] Initializing cgroup subsys devices</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.015419] Initializing cgroup subsys freeze=
r</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015422] Initial=
izing cgroup subsys net_cls</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.015426] Initializing cgroup subsys blkio</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.015430] Initializing cgroup subsys perf=
_event</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015432] In=
itializing cgroup subsys net_prio</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.015439] Initializing cgroup subsys hugetlb</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015456] tseg: 0000000000</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015460] CPU: Physical Pr=
ocessor ID: 0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015=
462] CPU: Processor Core ID: 0</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.015464] mce: CPU supports 7 MCE banks</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.015470] LVT offset 1 assigned for vecto=
r 0xf9</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.015475] La=
st level iTLB entries: 4KB 512, 2MB 1024, 4MB 512</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.015475] Last level dTLB entries: 4KB 1024,=
 2MB 1024, 4MB 512, 1GB 0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.015475] tlb_flushall_shift: 6</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A00.015553] Freeing SMP alternatives memory: 32K (fffffff=
f81e6e000 - ffffffff81e76000)</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.016170] ftrace: allocating 29244 entries in 115 pages</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.023710] ..TIMER: vector=
=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.063438] smpboot: CPU0: AMD FX(tm)-8350 Eight=
-Core Processor (fam: 15, model: 02, stepping: 00)</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.167980] Performance Events: Fam15h core p=
erfctr, AMD PMU driver.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.167985] ... version: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.16798=
7] ... bit width: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A048</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.167988] ... generic reg=
isters: =C2=A0 =C2=A0 =C2=A06</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.167990] ... value mask: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0000ffffffffffff</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.167992] ... max period: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
0007fffffffffff</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.1=
67993] ... fixed-purpose events: =C2=A0 0</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A00.167995] ... event mask: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 000000000000003f</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.169378] NMI watchdog: enabled on all CPUs, permanently co=
nsumes one hw-PMU counter.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.169445] x86: Booting SMP configuration:</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A00.169447] .... node =C2=A0#0, CPUs: =C2=A0=
 =C2=A0 =C2=A0#1 #2 #3 #4 #5 #6 #7</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.261441] x86: Booted up 1 node, 8 CPUs</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A00.261446] smpboot: Total of 8 processo=
rs activated (74889.69 BogoMIPS)</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A00.269594] devtmpfs: initialized</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A00.272590] evm: security.selinux</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.272592] evm: security.SMACK64</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.272594] evm: securit=
y.SMACK64EXEC</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.272=
596] evm: security.SMACK64TRANSMUTE</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A00.272597] evm: security.SMACK64MMAP</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.272599] evm: security.ima</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.272600] evm: security.capabili=
ty</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.272651] PM: Re=
gistering ACPI NVS region [mem 0xcffb0000-0xcffdffff] (196608 bytes)</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.273377] pinctrl core: i=
nitialized pinctrl subsystem</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.273439] regulator-dummy: no parameters</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.273472] RTC time: 23:16:50, date: 06/11/1=
5</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.273514] NET: Re=
gistered protocol family 16</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.273639] cpuidle: using governor ladder</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.273642] cpuidle: using governor menu</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.273705] ACPI: bus typ=
e PCI registered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
273708] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.273767] PCI: MMCONFIG for =
domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.273771] PCI: not us=
ing MMCONFIG</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.2737=
73] PCI: Using configuration type 1 for base access</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A00.273775] PCI: Using configuration type 1 =
for extended access</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.274069] mtrr: your CPUs had inconsistent variable MTRR settings</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.274071] mtrr: probably =
your BIOS does not setup all CPUs.</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.274073] mtrr: corrected configuration.</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A00.276493] ACPI: Added _OSI(Module Dev=
ice)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.276496] ACPI=
: Added _OSI(Processor Device)</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.276498] ACPI: Added _OSI(3.0 _SCP Extensions)</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.276500] ACPI: Added _OSI(Proces=
sor Aggregator Device)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.278445] ACPI: Executed 3 blocks of module-level executable AML code=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.281893] ACPI: In=
terpreter enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00=
.281902] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_]=
 (20140424/hwxface-580)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.281918] ACPI: (supports S0 S1 S3 S4 S5)</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.281920] ACPI: Using IOAPIC for interrupt rou=
ting</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.281975] PCI:=
 MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base =
0xe0000000)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.28281=
0] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboar=
d resources</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.28306=
9] PCI: Using host bridge windows from ACPI; if necessary, use &quot;pci=3D=
nocrs&quot; and report a bug</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.288165] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.288171] acpi PNP0=
A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.288365] acpi PNP0A03:00=
: _OSC: platform does not support [PCIeHotplug PME]</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A00.288550] acpi PNP0A03:00: _OSC: OS now co=
ntrols [AER PCIeCapability]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.288835] PCI host bridge to bus 0000:00</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.288838] pci_bus 0000:00: root bus resourc=
e [bus 00-ff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.288=
840] pci_bus 0000:00: root bus resource [io =C2=A00x0000-0x0cf7]</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.288843] pci_bus 0000:00: ro=
ot bus resource [io =C2=A00x0d00-0xffff]</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.288846] pci_bus 0000:00: root bus resource [mem 0x0=
00a0000-0x000bffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.288848] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000dffff]=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.288851] pci_bus =
0000:00: root bus resource [mem 0xd0000000-0xdfffffff]</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A00.288853] pci_bus 0000:00: root bus res=
ource [mem 0xf0000000-0xfebfffff]</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.288863] pci 0000:00:00.0: [1022:9601] type 00 class 0x0600=
00</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.288955] pci 00=
00:00:02.0: [1022:9603] type 01 class 0x060400</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.288988] pci 0000:00:02.0: PME# supported from=
 D0 D3hot D3cold</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
289023] pci 0000:00:02.0: System wakeup disabled by ACPI</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289059] pci 0000:00:06.0: [1022:960=
6] type 01 class 0x060400</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.289090] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289127] pci 0000:00:0=
6.0: System wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A00.289159] pci 0000:00:07.0: [1022:9607] type 01 class 0x06=
0400</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289190] pci =
0000:00:07.0: PME# supported from D0 D3hot D3cold</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.289224] pci 0000:00:07.0: System wakeup di=
sabled by ACPI</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.28=
9257] pci 0000:00:09.0: [1022:9608] type 01 class 0x060400</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289288] pci 0000:00:09.0: PME# su=
pported from D0 D3hot D3cold</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.289322] pci 0000:00:09.0: System wakeup disabled by ACPI</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289353] pci 0000:00:0a.=
0: [1022:9609] type 01 class 0x060400</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.289383] pci 0000:00:0a.0: PME# supported from D0 D3hot=
 D3cold</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289417] p=
ci 0000:00:0a.0: System wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.289463] pci 0000:00:11.0: [1002:4391] type 0=
0 class 0x010601</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
289482] pci 0000:00:11.0: reg 0x10: [io =C2=A00x9000-0x9007]</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289491] pci 0000:00:11.0: reg 0=
x14: [io =C2=A00x8000-0x8003]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.289499] pci 0000:00:11.0: reg 0x18: [io =C2=A00x7000-0x7007]=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289508] pci 0000=
:00:11.0: reg 0x1c: [io =C2=A00x6000-0x6003]</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A00.289516] pci 0000:00:11.0: reg 0x20: [io =C2=A00=
x5000-0x500f]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289=
525] pci 0000:00:11.0: reg 0x24: [mem 0xf9fffc00-0xf9ffffff]</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289622] pci 0000:00:12.0: [1002=
:4397] type 00 class 0x0c0310</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.289635] pci 0000:00:12.0: reg 0x10: [mem 0xf9ffe000-0xf9ffef=
ff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289715] pci 0=
000:00:12.0: System wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.289748] pci 0000:00:12.1: [1002:4398] type 00 cl=
ass 0x0c0310</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.2897=
60] pci 0000:00:12.1: reg 0x10: [mem 0xf9ffd000-0xf9ffdfff]</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289841] pci 0000:00:12.1: System=
 wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.289879] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289896] pci 0000:00:12.=
2: reg 0x10: [mem 0xf9fff800-0xf9fff8ff]</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.289973] pci 0000:00:12.2: supports D1 D2</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.289974] pci 0000:00:12.2: P=
ME# supported from D0 D1 D2 D3hot</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.290012] pci 0000:00:12.2: System wakeup disabled by ACPI</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290050] pci 0000:0=
0:13.0: [1002:4397] type 00 class 0x0c0310</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.290062] pci 0000:00:13.0: reg 0x10: [mem 0xf9ffc0=
00-0xf9ffcfff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.29=
0143] pci 0000:00:13.0: System wakeup disabled by ACPI</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A00.290175] pci 0000:00:13.1: [1002:4398]=
 type 00 class 0x0c0310</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.290187] pci 0000:00:13.1: reg 0x10: [mem 0xf9ffb000-0xf9ffbfff]</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290269] pci 0000:00:=
13.1: System wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A00.290306] pci 0000:00:13.2: [1002:4396] type 00 class 0x0=
c0320</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290324] pci=
 0000:00:13.2: reg 0x10: [mem 0xf9fff400-0xf9fff4ff]</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.290400] pci 0000:00:13.2: supports D1 D=
2</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290401] pci 000=
0:00:13.2: PME# supported from D0 D1 D2 D3hot</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A00.290440] pci 0000:00:13.2: System wakeup disabl=
ed by ACPI</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290481=
] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A00.290619] pci 0000:00:14.1: [1002:439c]=
 type 00 class 0x01018a</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.290634] pci 0000:00:14.1: reg 0x10: [io =C2=A00x0000-0x0007]</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290642] pci 0000:00:14.=
1: reg 0x14: [io =C2=A00x0000-0x0003]</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.290650] pci 0000:00:14.1: reg 0x18: [io =C2=A00x0000-0=
x0007]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290658] pc=
i 0000:00:14.1: reg 0x1c: [io =C2=A00x0000-0x0003]</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.290667] pci 0000:00:14.1: reg 0x20: [io =
=C2=A00xff00-0xff0f]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.290685] pci 0000:00:14.1: legacy IDE quirk: reg 0x10: [io =C2=A00x01f0=
-0x01f7]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290688] =
pci 0000:00:14.1: legacy IDE quirk: reg 0x14: [io =C2=A00x03f6]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290690] pci 0000:00:14.1: le=
gacy IDE quirk: reg 0x18: [io =C2=A00x0170-0x0177]</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.290692] pci 0000:00:14.1: legacy IDE quir=
k: reg 0x1c: [io =C2=A00x0376]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.290775] pci 0000:00:14.2: [1002:4383] type 00 class 0x040300=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290795] pci 0000=
:00:14.2: reg 0x10: [mem 0xf9ff4000-0xf9ff7fff 64bit]</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.290856] pci 0000:00:14.2: PME# support=
ed from D0 D3hot D3cold</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.290891] pci 0000:00:14.2: System wakeup disabled by ACPI</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.290924] pci 0000:00:14.3: [=
1002:439d] type 00 class 0x060100</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.291040] pci 0000:00:14.4: [1002:4384] type 01 class 0x0604=
01</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291100] pci 00=
00:00:14.4: System wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.291132] pci 0000:00:14.5: [1002:4399] type 00 cla=
ss 0x0c0310</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.29114=
4] pci 0000:00:14.5: reg 0x10: [mem 0xf9ffa000-0xf9ffafff]</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291226] pci 0000:00:14.5: System =
wakeup disabled by ACPI</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.291261] pci 0000:00:18.0: [1022:1600] type 00 class 0x060000</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291323] pci 0000:00:18.=
1: [1022:1601] type 00 class 0x060000</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.291378] pci 0000:00:18.2: [1022:1602] type 00 class 0x=
060000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291435] pc=
i 0000:00:18.3: [1022:1603] type 00 class 0x060000</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.291495] pci 0000:00:18.4: [1022:1604] typ=
e 00 class 0x060000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.291550] pci 0000:00:18.5: [1022:1605] type 00 class 0x060000</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291651] pci 0000:01:00.0: =
[10de:0a65] type 00 class 0x030000</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.291661] pci 0000:01:00.0: reg 0x10: [mem 0xfd000000-0xfdf=
fffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291671] pc=
i 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff 64bit pref]</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.291680] pci 0000:01:00.0: r=
eg 0x1c: [mem 0xfa000000-0xfbffffff 64bit]</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.291686] pci 0000:01:00.0: reg 0x24: [io =C2=A00xa=
800-0xa87f]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.29169=
2] pci 0000:01:00.0: reg 0x30: [mem 0xfe8e0000-0xfe8fffff pref]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.296100] pci 0000:00:02.0: PC=
I bridge to [bus 01]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.296105] pci 0000:00:02.0: =C2=A0 bridge window [io =C2=A00xa000-0xafff=
]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.296107] pci 000=
0:00:02.0: =C2=A0 bridge window [mem 0xfa000000-0xfe8fffff]</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.296109] pci 0000:00:02.0: =C2=A0=
 bridge window [mem 0xd0000000-0xdfffffff 64bit pref]</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.296156] pci 0000:02:00.0: [10ec:8168] =
type 00 class 0x020000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.296170] pci 0000:02:00.0: reg 0x10: [io =C2=A00xb800-0xb8ff]</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.296189] pci 0000:02:00.=
0: reg 0x18: [mem 0xfe9ff000-0xfe9fffff 64bit]</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.296201] pci 0000:02:00.0: reg 0x20: [mem 0xf8=
efc000-0xf8efffff 64bit pref]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.296263] pci 0000:02:00.0: supports D1 D2</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A00.296264] pci 0000:02:00.0: PME# suppo=
rted from D0 D1 D2 D3hot D3cold</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.304108] pci 0000:00:06.0: PCI bridge to [bus 02]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.304112] pci 0000:00:06.0: =
=C2=A0 bridge window [io =C2=A00xb000-0xbfff]</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A00.304114] pci 0000:00:06.0: =C2=A0 bridge window=
 [mem 0xfe900000-0xfe9fffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.304117] pci 0000:00:06.0: =C2=A0 bridge window [mem 0xf8e00000-=
0xf8efffff 64bit pref]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.304162] pci 0000:03:00.0: [1b21:0612] type 00 class 0x010601</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.304174] pci 0000:03:00.=
0: reg 0x10: [io =C2=A00xd800-0xd807]</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.304181] pci 0000:03:00.0: reg 0x14: [io =C2=A00xd400-0=
xd403]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.304188] pc=
i 0000:03:00.0: reg 0x18: [io =C2=A00xd000-0xd007]</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.304195] pci 0000:03:00.0: reg 0x1c: [io =
=C2=A00xc800-0xc803]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.304202] pci 0000:03:00.0: reg 0x20: [io =C2=A00xc400-0xc41f]</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.304209] pci 0000:03:00.0: =
reg 0x24: [mem 0xfeaffc00-0xfeaffdff]</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.312113] pci 0000:00:07.0: PCI bridge to [bus 03]</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.312118] pci 0000:00:07=
.0: =C2=A0 bridge window [io =C2=A00xc000-0xdfff]</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.312119] pci 0000:00:07.0: =C2=A0 bridge wi=
ndow [mem 0xfea00000-0xfeafffff]</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A00.312166] pci 0000:04:00.0: [1b6f:7052] type 00 class 0x0c033=
0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.312184] pci 000=
0:04:00.0: reg 0x10: [mem 0xfebf8000-0xfebfffff 64bit]</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A00.312263] pci 0000:04:00.0: supports D1=
 D2</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.312265] pci 0=
000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A00.320122] pci 0000:00:09.0: PCI bridge =
to [bus 04]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.32012=
8] pci 0000:00:09.0: =C2=A0 bridge window [mem 0xfeb00000-0xfebfffff]</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.320173] pci 0000:05:00=
.0: [10ec:8168] type 00 class 0x020000</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A00.320187] pci 0000:05:00.0: reg 0x10: [io =C2=A00xe800-=
0xe8ff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.320206] p=
ci 0000:05:00.0: reg 0x18: [mem 0xf8fff000-0xf8ffffff 64bit pref]</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.320218] pci 0000:05:00.0: =
reg 0x20: [mem 0xf8ff8000-0xf8ffbfff 64bit pref]</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.320279] pci 0000:05:00.0: supports D1 D2</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.320280] pci 0000:05=
:00.0: PME# supported from D0 D1 D2 D3hot D3cold</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.328130] pci 0000:00:0a.0: PCI bridge to [bu=
s 05]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.328134] pci=
 0000:00:0a.0: =C2=A0 bridge window [io =C2=A00xe000-0xefff]</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.328138] pci 0000:00:0a.0: =C2=
=A0 bridge window [mem 0xf8f00000-0xf8ffffff 64bit pref]</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A00.328209] pci 0000:00:14.4: PCI bridg=
e to [bus 06] (subtractive decode)</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.328219] pci 0000:00:14.4: =C2=A0 bridge window [io =C2=A0=
0x0000-0x0cf7] (subtractive decode)</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A00.328220] pci 0000:00:14.4: =C2=A0 bridge window [io =C2=
=A00x0d00-0xffff] (subtractive decode)</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A00.328221] pci 0000:00:14.4: =C2=A0 bridge window [mem 0=
x000a0000-0x000bffff] (subtractive decode)</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.328223] pci 0000:00:14.4: =C2=A0 bridge window [m=
em 0x000d0000-0x000dffff] (subtractive decode)</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.328224] pci 0000:00:14.4: =C2=A0 bridge windo=
w [mem 0xd0000000-0xdfffffff] (subtractive decode)</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A00.328225] pci 0000:00:14.4: =C2=A0 bridge w=
indow [mem 0xf0000000-0xfebfffff] (subtractive decode)</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A00.328246] pci_bus 0000:00: on NUMA node=
 0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.328858] ACPI: =
PCI Interrupt Link [LNKA] (IRQs 4 7 10 11 12 14 15) *0, disabled.</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.328900] ACPI: PCI Interrup=
t Link [LNKB] (IRQs 4 7 10 11 12 14 15) *0, disabled.</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.328942] ACPI: PCI Interrupt Link [LNKC=
] (IRQs 10 12 14 15) *0, disabled.</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.328981] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 7 10 11 1=
2 14 15) *0, disabled.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.329021] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 10 11 12 14 15) *0,=
 disabled.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329061=
] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 10 11 12 14 15) *0, disabled.</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329101] ACPI: PCI In=
terrupt Link [LNKG] (IRQs 4 10 11 12 14 15) *0, disabled.</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329143] ACPI: PCI Interrupt Link [=
LNKH] (IRQs 4 7 10 11 12 14 15) *0, disabled.</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A00.329200] ACPI: Enabled 1 GPEs in block 00 to 1F=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329282] vgaarb: =
setting as boot device: PCI:0000:01:00.0</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.329285] vgaarb: device added: PCI:0000:01:00.0,deco=
des=3Dio+mem,owns=3Dio+mem,locks=3Dnone</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A00.329288] vgaarb: loaded</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A00.329290] vgaarb: bridge control possible 0000:0=
1:00.0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329498] SC=
SI subsystem initialized</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.329545] libata version 3.00 loaded.</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.329567] ACPI: bus type USB registered</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329583] usbcore: registered=
 new interface driver usbfs</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.329592] usbcore: registered new interface driver hub</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.329612] usbcore: registered=
 new device driver usb</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.329737] PCI: Using ACPI for IRQ routing</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.337703] PCI: pci_cache_line_size set to 64 b=
ytes</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.337758] e820=
: reserve RAM buffer [mem 0x0009dc00-0x0009ffff]</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.337759] e820: reserve RAM buffer [mem 0xcff=
a0000-0xcfffffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00=
.337760] e820: reserve RAM buffer [mem 0x22f000000-0x22fffffff]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.337848] NetLabel: Initializi=
ng</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.337849] NetLab=
el: =C2=A0domain hash size =3D 128</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.337851] NetLabel: =C2=A0protocols =3D UNLABELED CIPSOv4</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.337861] NetLabel: =
=C2=A0unlabeled traffic allowed by default</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.337907] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, =
0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.337912] hpet0: =
4 comparators, 32-bit 14.318180 MHz counter</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.339983] Switched to clocksource hpet</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.345803] AppArmor: AppArmor F=
ilesystem Enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00=
.345823] pnp: PnP ACPI init</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.345835] ACPI: bus type PNP registered</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A00.345949] system 00:00: Plug and Play ACPI d=
evice, IDs PNP0c02 (active)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.345997] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (acti=
ve)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346391] syste=
m 00:02: [mem 0xfec00000-0xfec00fff] could not be reserved</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346394] system 00:02: [mem 0xfee0=
0000-0xfee00fff] has been reserved</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A00.346397] system 00:02: Plug and Play ACPI device, IDs PNP0=
c02 (active)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.3465=
96] system 00:03: [io =C2=A00x04d0-0x04d1] has been reserved</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346599] system 00:03: [io =C2=
=A00x040b] has been reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.346602] system 00:03: [io =C2=A00x04d6] has been reserved</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346605] system 00:03: =
[io =C2=A00x0c00-0x0c01] has been reserved</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.346607] system 00:03: [io =C2=A00x0c14] has been =
reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346610] =
system 00:03: [io =C2=A00x0c50-0x0c51] has been reserved</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346613] system 00:03: [io =C2=A00x0=
c52] has been reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.346615] system 00:03: [io =C2=A00x0c6c] has been reserved</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346618] system 00:03: [io =
=C2=A00x0c6f] has been reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.346620] system 00:03: [io =C2=A00x0cd0-0x0cd1] has been rese=
rved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346623] syst=
em 00:03: [io =C2=A00x0cd2-0x0cd3] has been reserved</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A00.346626] system 00:03: [io =C2=A00x0cd4-=
0x0cd5] has been reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.346628] system 00:03: [io =C2=A00x0cd6-0x0cd7] has been reserved</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346631] system 00:=
03: [io =C2=A00x0cd8-0x0cdf] has been reserved</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A00.346634] system 00:03: [io =C2=A00x0800-0x089f=
] could not be reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A00.346636] system 00:03: [io =C2=A00x0b00-0x0b0f] has been reserved</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346639] system 00:0=
3: [io =C2=A00x0b20-0x0b3f] has been reserved</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A00.346642] system 00:03: [io =C2=A00x0900-0x090f]=
 has been reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
0.346644] system 00:03: [io =C2=A00x0910-0x091f] has been reserved</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346647] system 00:03: [io=
 =C2=A00xfe00-0xfefe] has been reserved</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A00.346650] system 00:03: [mem 0xffb80000-0xffbfffff] ha=
s been reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.3=
46653] system 00:03: [mem 0xfec10000-0xfec1001f] has been reserved</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346656] system 00:03: Plu=
g and Play ACPI device, IDs PNP0c02 (active)</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A00.346855] pnp 00:04: [dma 0 disabled]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.346903] pnp 00:04: Plug and =
Play ACPI device, IDs PNP0501 (active)</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A00.346983] system 00:05: [io =C2=A00x0290-0x029f] has be=
en reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.34698=
6] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.347038] system 00:06: [mem =
0xe0000000-0xefffffff] has been reserved</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A00.347041] system 00:06: Plug and Play ACPI device, ID=
s PNP0c02 (active)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
0.347225] system 00:07: [mem 0x00000000-0x0009ffff] could not be reserved</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.347228] system 00:=
07: [mem 0x000e0000-0x000fffff] could not be reserved</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.347231] system 00:07: [mem 0x00100000-=
0xcfffffff] could not be reserved</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A00.347234] system 00:07: [mem 0xfec00000-0xffffffff] could no=
t be reserved</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.347=
237] system 00:07: Plug and Play ACPI device, IDs PNP0c01 (active)</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.347320] pnp: PnP ACPI: fo=
und 8 devices</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.347=
322] ACPI: bus type PNP unregistered</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A00.353807] pci 0000:00:02.0: PCI bridge to [bus 01]</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353810] pci 0000:00:02.=
0: =C2=A0 bridge window [io =C2=A00xa000-0xafff]</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A00.353814] pci 0000:00:02.0: =C2=A0 bridge win=
dow [mem 0xfa000000-0xfe8fffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.353817] pci 0000:00:02.0: =C2=A0 bridge window [mem 0xd00000=
00-0xdfffffff 64bit pref]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.353822] pci 0000:00:06.0: PCI bridge to [bus 02]</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353824] pci 0000:00:06.0: =C2=A0 b=
ridge window [io =C2=A00xb000-0xbfff]</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.353828] pci 0000:00:06.0: =C2=A0 bridge window [mem 0x=
fe900000-0xfe9fffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.353831] pci 0000:00:06.0: =C2=A0 bridge window [mem 0xf8e00000-0xf8eff=
fff 64bit pref]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.3=
53835] pci 0000:00:07.0: PCI bridge to [bus 03]</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A00.353838] pci 0000:00:07.0: =C2=A0 bridge wind=
ow [io =C2=A00xc000-0xdfff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.353841] pci 0000:00:07.0: =C2=A0 bridge window [mem 0xfea00000-=
0xfeafffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.35384=
6] pci 0000:00:09.0: PCI bridge to [bus 04]</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.353849] pci 0000:00:09.0: =C2=A0 bridge window [=
mem 0xfeb00000-0xfebfffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.353853] pci 0000:00:0a.0: PCI bridge to [bus 05]</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353856] pci 0000:00:0a.0: =C2=
=A0 bridge window [io =C2=A00xe000-0xefff]</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.353860] pci 0000:00:0a.0: =C2=A0 bridge window [m=
em 0xf8f00000-0xf8ffffff 64bit pref]</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A00.353864] pci 0000:00:14.4: PCI bridge to [bus 06]</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353876] pci_bus 0000:00=
: resource 4 [io =C2=A00x0000-0x0cf7]</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A00.353877] pci_bus 0000:00: resource 5 [io =C2=A00x0d00-0=
xffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353878] pc=
i_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.353880] pci_bus 0000:00: resource 7 [m=
em 0x000d0000-0x000dffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A00.353881] pci_bus 0000:00: resource 8 [mem 0xd0000000-0xdfffffff]</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353882] pci_bus 000=
0:00: resource 9 [mem 0xf0000000-0xfebfffff]</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A00.353883] pci_bus 0000:01: resource 0 [io =C2=A00=
xa000-0xafff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353=
885] pci_bus 0000:01: resource 1 [mem 0xfa000000-0xfe8fffff]</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353886] pci_bus 0000:01: resour=
ce 2 [mem 0xd0000000-0xdfffffff 64bit pref]</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.353887] pci_bus 0000:02: resource 0 [io =C2=A00x=
b000-0xbfff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.3538=
88] pci_bus 0000:02: resource 1 [mem 0xfe900000-0xfe9fffff]</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353889] pci_bus 0000:02: resourc=
e 2 [mem 0xf8e00000-0xf8efffff 64bit pref]</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A00.353891] pci_bus 0000:03: resource 0 [io =C2=A00xc=
000-0xdfff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.35389=
2] pci_bus 0000:03: resource 1 [mem 0xfea00000-0xfeafffff]</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353893] pci_bus 0000:04: resource=
 1 [mem 0xfeb00000-0xfebfffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A00.353894] pci_bus 0000:05: resource 0 [io =C2=A00xe000-0xefff]=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353896] pci_bus =
0000:05: resource 2 [mem 0xf8f00000-0xf8ffffff 64bit pref]</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353897] pci_bus 0000:06: resource=
 4 [io =C2=A00x0000-0x0cf7]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.353898] pci_bus 0000:06: resource 5 [io =C2=A00x0d00-0xffff]</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353899] pci_bus 000=
0:06: resource 6 [mem 0x000a0000-0x000bffff]</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A00.353900] pci_bus 0000:06: resource 7 [mem 0x000d=
0000-0x000dffff]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.=
353902] pci_bus 0000:06: resource 8 [mem 0xd0000000-0xdfffffff]</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.353903] pci_bus 0000:06: res=
ource 9 [mem 0xf0000000-0xfebfffff]</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A00.353923] NET: Registered protocol family 2</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.354110] TCP established hash ta=
ble entries: 65536 (order: 7, 524288 bytes)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A00.354288] TCP bind hash table entries: 65536 (orde=
r: 8, 1048576 bytes)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A00.354512] TCP: Hash tables configured (established 65536 bind 65536)</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.354544] TCP: reno re=
gistered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A00.354554] =
UDP hash table entries: 4096 (order: 5, 131072 bytes)</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.354595] UDP-Lite hash table entries: 4=
096 (order: 5, 131072 bytes)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A00.354661] NET: Registered protocol family 1</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A00.800566] pci 0000:01:00.0: Video device=
 with shadowed ROM</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
0.800712] PCI: CLS 64 bytes, default 64</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A00.800769] Trying to unpack rootfs image as initramfs..=
.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.010395] Freeing=
 initrd memory: 19124K (ffff880035a96000 - ffff880036d43000)</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.010691] PCI-DMA: Disabling AGP.=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.010769] PCI-DMA:=
 aperture base @ c4000000 size 65536 KB</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.010771] PCI-DMA: using GART IOMMU.</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.010774] PCI-DMA: Reserving 64MB of=
 IOMMU area in the AGP aperture</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.014431] perf: AMD NB counters detected</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.014496] microcode: CPU0: patch_level=
=3D0x06000817</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.014=
503] microcode: CPU1: patch_level=3D0x06000817</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A01.014513] microcode: CPU2: patch_level=3D0x0600=
0817</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.014523] micr=
ocode: CPU3: patch_level=3D0x06000817</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A01.014533] microcode: CPU4: patch_level=3D0x06000817</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.014544] microcode: CP=
U5: patch_level=3D0x06000817</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.014553] microcode: CPU6: patch_level=3D0x06000817</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.014564] microcode: CPU7: patch=
_level=3D0x06000817</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.014613] microcode: Microcode Update Driver: v2.00 &lt;<a href=3D"mailt=
o:tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org" target=3D"_blank">tigran-ppwZ4lME3+KI6QP4U9MhSUkxwOvcTxT8@public.gmane.org=
k</a>&gt;, Peter Oruba</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.014619] LVT offset 0 assigned for vector 0x400</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A01.014639] perf: AMD IBS detected (0x000=
000ff)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.014657] Sc=
anning for low memory corruption every 60 seconds</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A01.014968] futex hash table entries: 2048 (or=
der: 5, 131072 bytes)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.014992] Initialise system trusted keyring</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A01.015010] audit: initializing netlink subsys (d=
isabled)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.015024] =
audit: type=3D2000 audit(1434064609.896:1): initialized</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A01.015292] HugeTLB registered 2 MB page=
 size, pre-allocated 0 pages</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.016720] zpool: loaded</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A01.016723] zbud: loaded</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A01.016845] VFS: Disk quotas dquot_6.5.2</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.016876] Dquot-cache hash table ent=
ries: 512 (order 0, 4096 bytes)</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.017318] fuse init (API version 7.23)</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A01.017394] msgmni has been set to 15932</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.017442] Key type big=
_key registered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.0=
17828] Key type asymmetric registered</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A01.017831] Asymmetric key parser &#39;x509&#39; registere=
d</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.017862] Block l=
ayer SCSI generic (bsg) driver version 0.4 loaded (major 252)</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.017915] io scheduler noop regi=
stered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.017918] io=
 scheduler deadline registered (default)</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A01.017960] io scheduler cfq registered</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.018161] pcieport 0000:00:02.0: i=
rq 40 for MSI/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.018295] pcieport 0000:00:06.0: irq 41 for MSI/MSI-X</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A01.018422] pcieport 0000:00:07.0: irq =
42 for MSI/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.=
018463] pcieport 0000:00:09.0: irq 43 for MSI/MSI-X</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A01.018590] pcieport 0000:00:0a.0: irq 44 fo=
r MSI/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.01864=
6] pci_hotplug: PCI Hot Plug PCI Core version: 0.5</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A01.018661] pciehp: PCI Express Hot Plug Cont=
roller Driver version: 0.4</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.018704] vesafb: mode is 640x480x32, linelength=3D2560, pages=3D=
0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.018706] vesafb:=
 scrolling: redraw</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
1.018708] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.026887] vesafb: framebuffer a=
t 0xfb000000, mapped to 0xffffc90010e80000, using 1216k, total 1216k</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.027623] Console: switch=
ing to colour frame buffer device 80x30</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.028274] fb0: VESA VGA frame buffer device</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.028370] input: Power Button=
 as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.028398] ACPI: Power Button [PWR=
B]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.028444] input:=
 Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.029305] ACPI: Power Button [P=
WRF]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.029779] ACPI=
: acpi_idle registered with cpuidle</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.030211] GHES: HEST is not enabled!</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.030719] Serial: 8250/16550 driver, 32 =
ports, IRQ sharing enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.051604] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.=
054011] Linux agpgart interface v0.103</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A01.055645] brd: module loaded</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A01.056690] loop: module loaded</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.057325] libphy: Fixed MDIO Bus: =
probed</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.057761] tu=
n: Universal TUN/TAP device driver, 1.6</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.058190] tun: (C) 1999-2004 Max Krasnyansky &lt;<a hr=
ef=3D"mailto:maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org" target=3D"_blank">maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org</a>&gt;=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.058676] PPP gene=
ric driver version 2.4.2</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.059153] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Controller (EHCI)=
 Driver</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.059606] e=
hci-pci: EHCI PCI platform driver</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A01.060181] ehci-pci 0000:00:12.2: EHCI Host Controller</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.060640] ehci-pci 0000:0=
0:12.2: new USB bus registered, assigned bus number 1</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.061560] ehci-pci 0000:00:12.2: applyin=
g AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.062496] ehci-pci 0000:00:12.2: debug p=
ort 1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.062998] ehc=
i-pci 0000:00:12.2: irq 17, io mem 0xf9fff800</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A01.072731] ehci-pci 0000:00:12.2: USB 2.0 started=
, EHCI 1.00</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.07322=
7] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.073681] usb usb1: New U=
SB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.074551] usb usb1: Product: EHCI Ho=
st Controller</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.074=
973] usb usb1: Manufacturer: Linux 3.16.0-38-generic ehci_hcd</div><div>Jun=
 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.075404] usb usb1: SerialNumber=
: 0000:00:12.2</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.07=
5971] hub 1-0:1.0: USB hub found</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A01.076402] hub 1-0:1.0: 6 ports detected</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.077091] ehci-pci 0000:00:13.2: EHCI Ho=
st Controller</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.077=
521] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.078364] ehci-pci 0=
000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.079229] ehci-pci 0=
000:00:13.2: debug port 1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A01.079699] ehci-pci 0000:00:13.2: irq 19, io mem 0xf9fff400</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.088779] ehci-pci 0000:00:1=
3.2: USB 2.0 started, EHCI 1.00</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.089269] usb usb2: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0002</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.089=
718] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=
=3D1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.090598] usb =
usb2: Product: EHCI Host Controller</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.091031] usb usb2: Manufacturer: Linux 3.16.0-38-generic =
ehci_hcd</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.091458] =
usb usb2: SerialNumber: 0000:00:13.2</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A01.092027] hub 2-0:1.0: USB hub found</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A01.092455] hub 2-0:1.0: 6 ports detected=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.093003] ehci-pla=
tform: EHCI generic platform driver</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.093427] ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller=
 (OHCI) Driver</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.09=
3842] ohci-pci: OHCI PCI platform driver</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A01.094365] ohci-pci 0000:00:12.0: OHCI PCI host contro=
ller</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.094785] ohci=
-pci 0000:00:12.0: new USB bus registered, assigned bus number 3</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.095643] ohci-pci 0000:00:12=
.0: irq 16, io mem 0xf9ffe000</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.152862] usb usb3: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0001</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.153=
294] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=
=3D1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.154140] usb =
usb3: Product: OHCI PCI host controller</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.154576] usb usb3: Manufacturer: Linux 3.16.0-38-gene=
ric ohci_hcd</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.1550=
16] usb usb3: SerialNumber: 0000:00:12.0</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A01.155600] hub 3-0:1.0: USB hub found</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.156043] hub 3-0:1.0: 3 ports dete=
cted</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.156655] ohci=
-pci 0000:00:12.1: OHCI PCI host controller</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A01.157090] ohci-pci 0000:00:12.1: new USB bus regis=
tered, assigned bus number 4</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.157929] ohci-pci 0000:00:12.1: irq 16, io mem 0xf9ffd000</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.216925] usb usb4: New U=
SB device found, idVendor=3D1d6b, idProduct=3D0001</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A01.217364] usb usb4: New USB device strings:=
 Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.218228] usb usb4: Product: OHCI PCI host controller<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.218669] usb usb4:=
 Manufacturer: Linux 3.16.0-38-generic ohci_hcd</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A01.219105] usb usb4: SerialNumber: 0000:00:12.1=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.219692] hub 4-0:=
1.0: USB hub found</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
1.220126] hub 4-0:1.0: 3 ports detected</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.220728] ohci-pci 0000:00:13.0: OHCI PCI host control=
ler</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.221161] ohci-=
pci 0000:00:13.0: new USB bus registered, assigned bus number 5</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.222054] ohci-pci 0000:00:13.=
0: irq 18, io mem 0xf9ffc000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.280989] usb usb5: New USB device found, idVendor=3D1d6b, idProd=
uct=3D0001</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.281442=
] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.282335] usb usb5:=
 Product: OHCI PCI host controller</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A01.282785] usb usb5: Manufacturer: Linux 3.16.0-38-generic o=
hci_hcd</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.283234] u=
sb usb5: SerialNumber: 0000:00:13.0</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.283833] hub 5-0:1.0: USB hub found</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.284272] hub 5-0:1.0: 3 ports detected<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.284875] ohci-pci =
0000:00:13.1: OHCI PCI host controller</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A01.285305] ohci-pci 0000:00:13.1: new USB bus registered=
, assigned bus number 6</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.286172] ohci-pci 0000:00:13.1: irq 18, io mem 0xf9ffb000</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.345068] usb usb6: New USB d=
evice found, idVendor=3D1d6b, idProduct=3D0001</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A01.345522] usb usb6: New USB device strings: Mfr=
=3D3, Product=3D2, SerialNumber=3D1</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.346411] usb usb6: Product: OHCI PCI host controller</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.346858] usb usb6: Man=
ufacturer: Linux 3.16.0-38-generic ohci_hcd</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A01.347307] usb usb6: SerialNumber: 0000:00:13.1</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.347896] hub 6-0:1.0:=
 USB hub found</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.34=
8335] hub 6-0:1.0: 3 ports detected</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.348937] ohci-pci 0000:00:14.5: OHCI PCI host controller<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.349366] ohci-pci =
0000:00:14.5: new USB bus registered, assigned bus number 7</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.350231] ohci-pci 0000:00:14.5: i=
rq 18, io mem 0xf9ffa000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.409109] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.409546] u=
sb usb7: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.410403] usb usb7: Pr=
oduct: OHCI PCI host controller</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.410846] usb usb7: Manufacturer: Linux 3.16.0-38-generic ohci=
_hcd</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.411294] usb =
usb7: SerialNumber: 0000:00:14.5</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A01.411881] hub 7-0:1.0: USB hub found</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A01.412320] hub 7-0:1.0: 2 ports detected</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.412809] ohci-platfor=
m: OHCI generic platform driver</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.413242] uhci_hcd: USB Universal Host Controller Interface dr=
iver</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.413734] xhci=
_hcd 0000:04:00.0: xHCI Host Controller</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A01.414166] xhci_hcd 0000:04:00.0: new USB bus registere=
d, assigned bus number 8</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.415118] xhci_hcd 0000:04:00.0: irq 45 for MSI/MSI-X</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.415165] usb usb8: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0002</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A01.415619] usb usb8: New USB device strings: Mfr=3D3,=
 Product=3D2, SerialNumber=3D1</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.416507] usb usb8: Product: xHCI Host Controller</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.416952] usb usb8: Manufacture=
r: Linux 3.16.0-38-generic xhci_hcd</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A01.417409] usb usb8: SerialNumber: 0000:04:00.0</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.417980] hub 8-0:1.0: USB hub=
 found</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.418413] hu=
b 8-0:1.0: 4 ports detected</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.418922] xhci_hcd 0000:04:00.0: xHCI Host Controller</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.419346] xhci_hcd 0000:04:00.=
0: new USB bus registered, assigned bus number 9</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A01.420224] usb usb9: New USB device found, idV=
endor=3D1d6b, idProduct=3D0003</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.420676] usb usb9: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.421566] usb usb9: Product: xHCI Host Controller</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A01.422009] usb usb9: Manufacturer: Linu=
x 3.16.0-38-generic xhci_hcd</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.422453] usb usb9: SerialNumber: 0000:04:00.0</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A01.423014] hub 9-0:1.0: USB hub found<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.423450] hub 9-0:1=
.0: 4 ports detected</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.423994] i8042: PNP: No PS/2 controller found. Probing ports directly.<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.426976] serio: i8=
042 KBD port at 0x60,0x64 irq 1</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.427395] serio: i8042 AUX port at 0x60,0x64 irq 12</div><div>=
Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.427950] mousedev: PS/2 mous=
e device common for all mice</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.428542] rtc_cmos 00:01: RTC can wake from S4</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A01.429140] rtc_cmos 00:01: rtc core: r=
egistered rtc_cmos as rtc0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.429594] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes =
nvram, hpet irqs</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.=
430501] device-mapper: uevent: version 1.0.3</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A01.431015] device-mapper: ioctl: 4.27.0-ioctl (201=
3-10-30) initialised: <a href=3D"mailto:dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" target=3D"_bla=
nk">dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a></div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.431876] ledtrig-cpu: registered to indicate activity on CPUs</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.432385] TCP: cubic =
registered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.432912=
] NET: Registered protocol family 10</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A01.433562] NET: Registered protocol family 17</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.433981] Key type dns_resolver=
 registered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.43506=
7] Loading compiled-in X.509 certificates</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A01.436122] Loaded X.509 cert &#39;Magrathea: Glacier =
signing key: c284edaccf0b473652c34d23bec356944236e63b&#39;</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.436985] registered taskstats vers=
ion 1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.439184] Key=
 type trusted registered</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.442721] Key type encrypted registered</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A01.443116] AppArmor: AppArmor sha1 policy hashing=
 enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.443514] =
ima: No TPM chip found, activating TPM-bypass!</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A01.443921] evm: HMAC attrs: 0x1</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.444727] =C2=A0 Magic number: 3:98=
5:301</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.445140] tty=
 tty30: hash matches</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.445619] rtc_cmos 00:01: setting system clock to 2015-06-11 23:16:51 UT=
C (1434064611)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.44=
6702] acpi-cpufreq: overriding BIOS provided _PSD data</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A01.447525] BIOS EDD facility v0.16 2004-=
Jun-25, 0 devices found</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.447941] EDD information not available.</div><div>Jun 11 20:16:58 v-=
caps kernel: [ =C2=A0 =C2=A01.448403] PM: Hibernation image not present or =
could not be loaded.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.449473] Freeing unused kernel memory: 1352K (ffffffff81d1c000 - ffffff=
ff81e6e000)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.45034=
7] Write protecting the kernel read-only data: 12288k</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A01.452474] Freeing unused kernel memory: =
556K (ffff880001775000 - ffff880001800000)</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A01.454811] Freeing unused kernel memory: 500K (ffff8=
80001b83000 - ffff880001c00000)</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.467097] systemd-udevd[144]: starting version 204</div><div>J=
un 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.482331] r8169 Gigabit Ethern=
et driver 2.3LK-NAPI loaded</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.482910] ahci 0000:00:11.0: version 3.0</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A01.483020] r8169 0000:02:00.0: irq 46 for MS=
I/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.483144] a=
hci 0000:00:11.0: AHCI 0001.0100 32 slots 4 ports 3 Gbps 0xf impl SATA mode=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.483256] r8169 00=
00:02:00.0 eth0: RTL8168e/8111e at 0xffffc90010e66000, e8:de:27:01:f6:19, X=
ID 0c200000 IRQ 46</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
1.483257] r8169 0000:02:00.0 eth0: jumbo features [frames: 9200 bytes, tx c=
hecksumming: ko]</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.=
483275] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded</div><div>Jun 11 20=
:16:58 v-caps kernel: [ =C2=A0 =C2=A01.483500] r8169 0000:05:00.0: irq 47 f=
or MSI/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.4836=
71] r8169 0000:05:00.0 eth1: RTL8168evl/8111evl at 0xffffc90010fb4000, d0:5=
0:99:30:c6:76, XID 0c900800 IRQ 47</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A01.483672] r8169 0000:05:00.0 eth1: jumbo features [frames: =
9200 bytes, tx checksumming: ko]</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A01.488749] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm le=
d clo pmp pio slum part ccc=C2=A0</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A01.490977] scsi0 : ahci</div><div>Jun 11 20:16:58 v-caps kern=
el: [ =C2=A0 =C2=A01.492030] scsi1 : ahci</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A01.494136] scsi2 : ahci</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A01.494821] scsi3 : ahci</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A01.495406] ata1: SATA max UDMA/133 abar m1024=
@0xf9fffc00 port 0xf9fffd00 irq 22</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A01.496404] ata2: SATA max UDMA/133 abar m1024@0xf9fffc00 por=
t 0xf9fffd80 irq 22</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A01.497415] ata3: SATA max UDMA/133 abar m1024@0xf9fffc00 port 0xf9fffe00 =
irq 22</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.498417] at=
a4: SATA max UDMA/133 abar m1024@0xf9fffc00 port 0xf9fffe80 irq 22</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.499589] ahci 0000:03:00.0=
: irq 48 for MSI/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.499613] ahci 0000:03:00.0: SSS flag set, parallel bus scan disabled=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.500164] ahci 000=
0:03:00.0: AHCI 0001.0200 32 slots 2 ports 6 Gbps 0x3 impl SATA mode</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.501225] ahci 0000:03:00=
.0: flags: 64bit ncq sntf stag led clo pmp pio slum part ccc sxs=C2=A0</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.501229] scsi4 : pata_=
atiixp</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.501445] sc=
si5 : pata_atiixp</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01=
.501573] ata5: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0xff00 irq 14</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.501573] ata6: PATA =
max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0xff08 irq 15</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A01.504907] scsi6 : ahci</div><div>Jun 11 2=
0:16:58 v-caps kernel: [ =C2=A0 =C2=A01.505613] scsi7 : ahci</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.506270] ata7: SATA max UDMA/133=
 abar m512@0xfeaffc00 port 0xfeaffd00 irq 48</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A01.507196] ata8: SATA max UDMA/133 abar m512@0xfea=
ffc00 port 0xfeaffd80 irq 48</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A01.529416] systemd-udevd[147]: renamed network interface eth1 to p=
10p1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.545433] syst=
emd-udevd[152]: renamed network interface eth0 to p7p1</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A01.573331] usb 2-2: new high-speed USB d=
evice number 2 using ehci-pci</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.685915] ata6.01: ATAPI: HL-DT-STDVD-RAM GSA-H58N, 1.00, max =
UDMA/66</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.701871] a=
ta6.01: configured for UDMA/66</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A01.706182] usb 2-2: New USB device found, idVendor=3D0ace, idPr=
oduct=3D1215</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.7066=
92] usb 2-2: New USB device strings: Mfr=3D16, Product=3D32, SerialNumber=
=3D0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.707680] usb =
2-2: Product: USB2.0 WLAN</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A01.708165] usb 2-2: Manufacturer: ZyDAS</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A01.817520] ata1: SATA link down (SStatus 0 SContr=
ol 300)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.818101] a=
ta3: SATA link down (SStatus 0 SControl 300)</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A01.818587] ata4: SATA link down (SStatus 0 SContro=
l 300)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.819049] at=
a2: SATA link down (SStatus 0 SControl 300)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A01.821142] scsi 5:0:1:0: CD-ROM =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0HL-DT-ST DVD-RAM GSA-H58N 1.00 PQ: 0 ANSI: 5</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.831872] sr0: scsi3-mmc =
drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A01.832776] cdrom: Uniform CD-ROM driver =
Revision: 3.20</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.83=
3371] sr 5:0:1:0: Attached scsi CD-ROM sr0</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A01.833487] sr 5:0:1:0: Attached scsi generic sg0 typ=
e 5</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.841543] usb 4=
-1: new low-speed USB device number 2 using ohci-pci</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A01.997384] ata7: SATA link up 6.0 Gbps (SS=
tatus 133 SControl 300)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A01.998773] ata7.00: ATA-9: SSD2SC120G1SA754D117-820, N0530A, max UDMA/=
133</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.999239] ata7.=
00: 234441648 sectors, multi 1: LBA48 NCQ (depth 31/32), AA</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A01.999981] ata7.00: configured for =
UDMA/133</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.000550] =
scsi 6:0:0:0: Direct-Access =C2=A0 =C2=A0 ATA =C2=A0 =C2=A0 =C2=A0SSD2SC120=
G1SA754 0A =C2=A0 PQ: 0 ANSI: 5</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A02.001687] sd 6:0:0:0: [sda] 234441648 512-byte logical blocks:=
 (120 GB/111 GiB)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02=
.001692] sd 6:0:0:0: Attached scsi generic sg1 type 0</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A02.003149] sd 6:0:0:0: [sda] Write Protec=
t is off</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.003554] =
sd 6:0:0:0: [sda] Mode Sense: 00 3a 00 00</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A02.003683] sd 6:0:0:0: [sda] Write cache: enabled, re=
ad cache: enabled, doesn&#39;t support DPO or FUA</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A02.005117] =C2=A0sda: sda1 sda2 sda3</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.005816] sd 6:0:0:0: [sda]=
 Attached SCSI disk</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A02.008240] tsc: Refined TSC clocksource calibration: 4653.112 MHz</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.013385] usb 4-1: New USB=
 device found, idVendor=3D04d9, idProduct=3D0022</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A02.013882] usb 4-1: New USB device strings: Mf=
r=3D0, Product=3D2, SerialNumber=3D0</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A02.014284] usb 4-1: Product: USB Keyboard</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.018348] hidraw: raw HID events dr=
iver (C) Jiri Kosina</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A02.042342] usbcore: registered new interface driver usbhid</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.042763] usbhid: USB HID core dr=
iver</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.044476] inpu=
t: USB Keyboard as /devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.0/0003:0=
4D9:0022.0001/input/input5</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A02.045444] hid-generic 0003:04D9:0022.0001: input,hidraw0: USB HID=
 v1.10 Keyboard [USB Keyboard] on usb-0000:00:12.1-1/input0</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.046435] input: USB Keyboard as /=
devices/pci0000:00/0000:00:12.1/usb4/4-1/4-1:1.1/0003:04D9:0022.0002/input/=
input6</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.047461] hi=
d-generic 0003:04D9:0022.0002: input,hidraw1: USB HID v1.10 Device [USB Key=
board] on usb-0000:00:12.1-1/input1</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A02.303673] ata8: SATA link down (SStatus 0 SControl 300)</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A02.920111] Switched to=
 clocksource tsc</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A04.=
382933] floppy0: no floppy controllers found</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A07.272503] EXT4-fs (sda2): mounted filesystem with=
 ordered data mode. Opts: (null)</div><div>Jun 11 20:16:58 v-caps kernel: [=
 =C2=A0 =C2=A07.364061] random: init urandom read with 70 bits of entropy a=
vailable</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.388873] =
init: plymouth-upstart-bridge main process (237) terminated with status 1</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.389819] init: plym=
outh-upstart-bridge main process ended, respawning</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A07.394387] init: plymouth-upstart-bridge mai=
n process (246) terminated with status 1</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A07.395354] init: plymouth-upstart-bridge main process =
ended, respawning</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07=
.399374] init: plymouth-upstart-bridge main process (250) terminated with s=
tatus 1</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.400340] i=
nit: plymouth-upstart-bridge main process ended, respawning</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.402987] init: plymouth-upstart-b=
ridge main process (254) terminated with status 1</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A07.403967] init: plymouth-upstart-bridge main=
 process ended, respawning</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A07.495806] Adding 2097148k swap on /dev/sda1.=C2=A0 Priority:-1 ex=
tents:1 across:2097148k SSFS</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A07.499478] EXT4-fs (sda2): re-mounted. Opts: errors=3Dremount-ro</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.607450] systemd-ud=
evd[399]: starting version 204</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A07.619836] EXT4-fs (sda3): mounted filesystem with ordered data=
 mode. Opts: (null)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A07.629983] lp: driver loaded but no devices found</div><div>Jun 11 20:16:=
58 v-caps kernel: [ =C2=A0 =C2=A07.637946] ppdev: user-space parallel port =
driver</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.647449] wm=
i: Mapper loaded</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.=
647894] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.655187] [drm] Initializ=
ed drm 1.1.0 20060810</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A07.664060] ACPI Warning: SystemIO range 0x0000000000000b00-0x000000000000=
0b07 conflicts with OpRegion 0x0000000000000b00-0x0000000000000b0f (\SOR1) =
(20140424/utaddress-258)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A07.664067] ACPI: If an ACPI driver is available for this device, you s=
hould use it instead of the native driver</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A07.672812] MCE: In-kernel MCE decoding enabled.</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.674623] EDAC MC: Ver: =
3.0.0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.675757] che=
cking generic (fb000000 130000) vs hw (d0000000 10000000)</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.675759] checking generic (fb000000=
 130000) vs hw (fa000000 2000000)</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A07.675761] fb: switching to nouveaufb from VESA VGA</div><div=
>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.675782] Console: switching=
 to colour dummy device 80x25</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A07.675981] AMD64 EDAC driver v3.4.0</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A07.676002] EDAC amd64: DRAM ECC disabled.</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.676008] EDAC amd64: EC=
C disabled in the BIOS or no ECC capability, module will not load.</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.676008] =C2=A0Either enab=
le ECC checking or force module loading by setting &#39;ecc_enable_override=
&#39;.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.676008] =
=C2=A0(Note that use of the override may cause unknown side effects.)</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.676119] nouveau =C2=A0=
[ =C2=A0DEVICE][0000:01:00.0] BOOT0 =C2=A0: 0x298280a2</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A07.676122] nouveau =C2=A0[ =C2=A0DEVICE]=
[0000:01:00.0] Chipset: G98 (NV98)</div><div>Jun 11 20:16:58 v-caps kernel:=
 [ =C2=A0 =C2=A07.676123] nouveau =C2=A0[ =C2=A0DEVICE][0000:01:00.0] Famil=
y : NV50</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.676213] =
nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] checking PRAMIN for image...</d=
iv><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.693108] AVX version=
 of gcm_enc/dec engaged.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A07.712757] kvm: Nested Virtualization enabled</div><div>Jun 11 20:16:5=
8 v-caps kernel: [ =C2=A0 =C2=A07.712762] kvm: Nested Paging enabled</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.733822] nouveau =C2=A0[=
 =C2=A0 VBIOS][0000:01:00.0] ... appears to be valid</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A07.733823] nouveau =C2=A0[ =C2=A0 VBIOS][0=
000:01:00.0] using image from PRAMIN</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A07.733905] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] BIT=
 signature found</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.=
733908] nouveau =C2=A0[ =C2=A0 VBIOS][0000:01:00.0] version 70.18.36.00.00<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.754325] nouveau 0=
000:01:00.0: irq 49 for MSI/MSI-X</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A07.754335] nouveau =C2=A0[ =C2=A0 =C2=A0 PMC][0000:01:00.0] M=
SI interrupts enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A07.754358] nouveau =C2=A0[ =C2=A0 =C2=A0 PFB][0000:01:00.0] RAM type: DDR=
2</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.754360] nouveau=
 =C2=A0[ =C2=A0 =C2=A0 PFB][0000:01:00.0] RAM size: 1024 MiB</div><div>Jun =
11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.754361] nouveau =C2=A0[ =C2=A0 =
=C2=A0 PFB][0000:01:00.0] =C2=A0 =C2=A0ZCOMP: 960 tags</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A07.764707] sound hdaudioC0D0: autoconfig=
: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line</div><div>Jun 11 20:16:58 =
v-caps kernel: [ =C2=A0 =C2=A07.764710] sound hdaudioC0D0: =C2=A0 =C2=A0spe=
aker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)</div><div>Jun 11 20:16:58 v-caps kernel=
: [ =C2=A0 =C2=A07.764712] sound hdaudioC0D0: =C2=A0 =C2=A0hp_outs=3D1 (0x1=
b/0x0/0x0/0x0/0x0)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
7.764713] sound hdaudioC0D0: =C2=A0 =C2=A0mono: mono_out=3D0x0</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.764714] sound hdaudioC0D0: =
=C2=A0 =C2=A0dig-out=3D0x1e/0x0</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A07.764715] sound hdaudioC0D0: =C2=A0 =C2=A0inputs:</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.764717] sound hdaudioC0D0: =
=C2=A0 =C2=A0 =C2=A0Front Mic=3D0x19</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A07.764718] sound hdaudioC0D0: =C2=A0 =C2=A0 =C2=A0Rear Mic=
=3D0x18</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.764719] s=
ound hdaudioC0D0: =C2=A0 =C2=A0 =C2=A0Line=3D0x1a</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A07.777512] input: HDA ATI SB Rear Mic as /dev=
ices/pci0000:00/0000:00:14.2/sound/card0/input7</div><div>Jun 11 20:16:58 v=
-caps kernel: [ =C2=A0 =C2=A07.779263] input: HDA ATI SB Line as /devices/p=
ci0000:00/0000:00:14.2/sound/card0/input8</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A07.779485] input: HDA ATI SB Line Out as /devices/pci=
0000:00/0000:00:14.2/sound/card0/input9</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A07.784065] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] =
FAN control: none / external</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A07.784077] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] fan managem=
ent: automatic</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.78=
4079] nouveau =C2=A0[ =C2=A0PTHERM][0000:01:00.0] internal sensor: yes</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784087] nouveau =C2=
=A0[ =C2=A0 =C2=A0 CLK][0000:01:00.0] 0f: core 550 MHz shader 1375 MHz memo=
ry 266 MHz</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784121=
] nouveau =C2=A0[ =C2=A0 =C2=A0 CLK][0000:01:00.0] --: core 566 MHz shader =
1400 MHz memory 265 MHz</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A07.784167] nouveau E[ =C2=A0 PDISP][0000:01:00.0] 02:0261: func 08 loo=
kup failed, -2</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.78=
4558] [TTM] Zone =C2=A0kernel: Available graphics memory: 4079904 kiB</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784560] [TTM] Zone =C2=
=A0 dma32: Available graphics memory: 2097152 kiB</div><div>Jun 11 20:16:58=
 v-caps kernel: [ =C2=A0 =C2=A07.784561] [TTM] Initializing pool allocator<=
/div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784567] [TTM] Ini=
tializing DMA pool allocator</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A07.784584] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] VRAM: 1024 MiB</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784586] nouveau =C2=A0=
[ =C2=A0 =C2=A0 DRM] GART: 1048576 MiB</div><div>Jun 11 20:16:58 v-caps ker=
nel: [ =C2=A0 =C2=A07.784590] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] TMDS table=
 version 2.0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.7845=
93] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB version 4.0</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A07.784596] nouveau =C2=A0[ =C2=A0 =C2=A0=
 DRM] DCB outp 00: 02000300 00000028</div><div>Jun 11 20:16:58 v-caps kerne=
l: [ =C2=A0 =C2=A07.784599] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 01:=
 01000302 00020030</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
7.784601] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 02: 04011310 00000028=
</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784603] nouveau =
=C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 03: 02022322 00c20090</div><div>Jun 11 =
20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784605] nouveau =C2=A0[ =C2=A0 =C2=
=A0 DRM] DCB conn 00: 00001030</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A07.784608] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB conn 01: 0000=
0100</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.784610] nouv=
eau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB conn 02: 00002261</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A07.790697] [drm] Supports vblank timestamp=
 caching Rev 2 (21.10.2013).</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A07.790699] [drm] Driver supports precise vblank timestamp query.</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.799009] nouveau =
=C2=A0[ =C2=A0 =C2=A0 DRM] MM: using M2MF for buffer copies</div><div>Jun 1=
1 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.811344] cfg80211: Calling CRDA t=
o update world regulatory domain</div><div>Jun 11 20:16:58 v-caps rsyslogd-=
2039: Could no open output pipe &#39;/dev/xconsole&#39;: No such file or di=
rectory [try <a href=3D"http://www.rsyslog.com/e/2039" target=3D"_blank">ht=
tp://www.rsyslog.com/e/2039</a> ]</div><div>Jun 11 20:16:58 v-caps kernel: =
[ =C2=A0 =C2=A07.833323] cfg80211: World regulatory domain updated:</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.833326] cfg80211: =C2=A0=
DFS Master region: unset</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A07.833327] cfg80211: =C2=A0 (start_freq - end_freq @ bandwidth), (max_=
antenna_gain, max_eirp), (dfs_cac_time)</div><div>Jun 11 20:16:58 v-caps ke=
rnel: [ =C2=A0 =C2=A07.833330] cfg80211: =C2=A0 (2402000 KHz - 2472000 KHz =
@ 40000 KHz), (300 mBi, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A07.833331] cfg80211: =C2=A0 (2457000 KHz - 2482000 KHz=
 @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A07.833333] cfg80211: =C2=A0 (2474000 KHz - 2494000 KH=
z @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A07.833335] cfg80211: =C2=A0 (5170000 KHz - 5250000 K=
Hz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A07.833336] cfg80211: =C2=A0 (5735000 KHz - 5835000 =
KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-ca=
ps kernel: [ =C2=A0 =C2=A07.860841] init: failsafe main process (660) kille=
d by TERM signal</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.=
869101] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] allocated 1360x768 fb: 0x60000, =
bo ffff8800cadfe000</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A07.869168] fbcon: nouveaufb (fb0) is primary device</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A07.870010] nouveau E[ DEVINIT][0000:01:00=
.0] unable to compute acceptable pll values</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A07.870012] nouveau E[ DEVINIT][0000:01:00.0] failed=
 pll calculation</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: Bluetoot=
h daemon 4.101</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: Starting S=
DP server</div><div>Jun 11 20:16:58 v-caps avahi-daemon[799]: Found user &#=
39;avahi&#39; (UID 110) and group &#39;avahi&#39; (GID 117).</div><div>Jun =
11 20:16:58 v-caps avahi-daemon[799]: Successfully dropped root privileges.=
</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: DIS cannot start: GATT i=
s disabled</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init=
 deviceinfo plugin</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: Failed=
 to init proximity plugin</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]:=
 Failed to init time plugin</div><div>Jun 11 20:16:58 v-caps bluetoothd[767=
]: Failed to init alert plugin</div><div>Jun 11 20:16:58 v-caps bluetoothd[=
767]: Failed to init thermometer plugin</div><div>Jun 11 20:16:58 v-caps av=
ahi-daemon[799]: avahi-daemon 0.6.31 starting up.</div><div>Jun 11 20:16:58=
 v-caps avahi-daemon[799]: Successfully called chroot().</div><div>Jun 11 2=
0:16:58 v-caps avahi-daemon[799]: Successfully dropped remaining capabiliti=
es.</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: Failed to init gatt_e=
xample plugin</div><div>Jun 11 20:16:58 v-caps bluetoothd[767]: Bluetooth M=
anagement interface initialized</div><div>Jun 11 20:16:58 v-caps avahi-daem=
on[799]: No service file found in /etc/avahi/services.</div><div>Jun 11 20:=
16:58 v-caps avahi-daemon[799]: Network interface enumeration completed.</d=
iv><div>Jun 11 20:16:58 v-caps avahi-daemon[799]: Registering HINFO record =
with values &#39;X86_64&#39;/&#39;LINUX&#39;.</div><div>Jun 11 20:16:58 v-c=
aps avahi-daemon[799]: Server startup complete. Host name is v-caps.local. =
Local service cookie is 59173345.</div><div>Jun 11 20:16:58 v-caps ModemMan=
ager[762]: &lt;info&gt; =C2=A0ModemManager (version 1.0.0) starting...</div=
><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; NetworkManag=
er (version 0.9.8.8) is starting...</div><div>Jun 11 20:16:58 v-caps Networ=
kManager[866]: &lt;info&gt; Read config file /etc/NetworkManager/NetworkMan=
ager.conf</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt=
; WEXT support is enabled</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A07.925743] Bluetooth: Core ver 2.19</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A07.925758] NET: Registered protocol family 31</div><d=
iv>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.925759] Bluetooth: HCI d=
evice and connection manager initialized</div><div>Jun 11 20:16:58 v-caps k=
ernel: [ =C2=A0 =C2=A07.925765] Bluetooth: HCI socket layer initialized</di=
v><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.925767] Bluetooth: L=
2CAP socket layer initialized</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A07.925780] Bluetooth: SCO socket layer initialized</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.928636] Bluetooth: RFCOMM TTY=
 layer initialized</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
7.928640] Bluetooth: RFCOMM socket layer initialized</div><div>Jun 11 20:16=
:58 v-caps kernel: [ =C2=A0 =C2=A07.928644] Bluetooth: RFCOMM ver 1.11</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.934949] Bluetooth: BN=
EP (Ethernet Emulation) ver 1.3</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A07.934949] Bluetooth: BNEP filters: protocol multicast</div><di=
v>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.934954] Bluetooth: BNEP s=
ocket layer initialized</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A07.936155] usb 2-2: reset high-speed USB device number 2 using ehci-pc=
i</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A07.938438] init: c=
ups main process (727) killed by HUP signal</div><div>Jun 11 20:16:58 v-cap=
s kernel: [ =C2=A0 =C2=A07.938443] init: cups main process ended, respawnin=
g</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.070645] ieee802=
11 phy0: Selected rate control algorithm &#39;minstrel_ht&#39;</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.070835] zd1211rw 2-2:1.0: phy=
0</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.070858] usbcore=
: registered new interface driver zd1211rw</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A08.096090] Console: switching to colour frame buffer=
 device 170x48</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.09=
6656] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.096657] nouveau 0000:01:00.0:=
 registered panic notifier</div><div>Jun 11 20:16:58 v-caps NetworkManager[=
866]: &lt;info&gt; VPN: loaded org.freedesktop.NetworkManager.pptp</div><di=
v>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; DNS: loaded plug=
in dnsmasq</div><div>Jun 11 20:16:58 v-caps dbus[636]: [system] Activating =
service name=3D&#39;org.freedesktop.PolicyKit1&#39; (using servicehelper)</=
div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.108042] random: no=
nblocking pool is initialized</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A08.115300] [drm] Initialized nouveau 1.1.2 20120801 for 0000:01=
:00.0 on minor 0</div><div>Jun 11 20:16:58 v-caps polkitd[903]: started dae=
mon version 0.105 using authority implementation `local&#39; version `0.105=
&#39;</div><div>Jun 11 20:16:58 v-caps dbus[636]: [system] Successfully act=
ivated service &#39;org.freedesktop.PolicyKit1&#39;</div><div>Jun 11 20:16:=
58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: init!</div><=
div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupd=
own: update_system_hostname</div><div>Jun 11 20:16:58 v-caps NetworkManager=
[866]: =C2=A0 =C2=A0 =C2=A0 interface-parser: parsing file /etc/network/int=
erfaces</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0=
 =C2=A0 interface-parser: finished parsing file /etc/network/interfaces</di=
v><div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPluginIfu=
pdown: management mode: unmanaged</div><div>Jun 11 20:16:58 v-caps NetworkM=
anager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: devices added (path: /sys/devi=
ces/pci0000:00/0000:00:06.0/0000:02:00.0/net/p7p1, iface: p7p1)</div><div>J=
un 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: =
device added (path: /sys/devices/pci0000:00/0000:00:06.0/0000:02:00.0/net/p=
7p1, iface: p7p1): no ifupdown configuration found.</div><div>Jun 11 20:16:=
58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: devices adde=
d (path: /sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0/net/p10p1, iface=
: p10p1)</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=
=A0SCPlugin-Ifupdown: device added (path: /sys/devices/pci0000:00/0000:00:0=
a.0/0000:05:00.0/net/p10p1, iface: p10p1): no ifupdown configuration found.=
</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugi=
n-Ifupdown: devices added (path: /sys/devices/pci0000:00/0000:00:13.2/usb2/=
2-2/2-2:1.0/net/wlan0, iface: wlan0)</div><div>Jun 11 20:16:58 v-caps Netwo=
rkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: device added (path: /sys/de=
vices/pci0000:00/0000:00:13.2/usb2/2-2/2-2:1.0/net/wlan0, iface: wlan0): no=
 ifupdown configuration found.</div><div>Jun 11 20:16:58 v-caps NetworkMana=
ger[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: devices added (path: /sys/devices=
/virtual/net/lo, iface: lo)</div><div>Jun 11 20:16:58 v-caps NetworkManager=
[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: device added (path: /sys/devices/vir=
tual/net/lo, iface: lo): no ifupdown configuration found.</div><div>Jun 11 =
20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: end _i=
nit.</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; Loa=
ded plugin ifupdown: (C) 2008 Canonical Ltd.=C2=A0 To report bugs please us=
e the NetworkManager mailing list.</div><div>Jun 11 20:16:58 v-caps Network=
Manager[866]: &lt;info&gt; Loaded plugin keyfile: (c) 2007 - 2010 Red Hat, =
Inc.=C2=A0 To report bugs please use the NetworkManager mailing list.</div>=
<div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ofon=
o: Acquired D-Bus service com.canonical.NMOfono</div><div>Jun 11 20:16:58 v=
-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ofono: init!</div><div>Jun=
 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ofono: end _=
init.</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; Lo=
aded plugin (null): (null)</div><div>Jun 11 20:16:58 v-caps NetworkManager[=
866]: =C2=A0 =C2=A0Ifupdown: get unmanaged devices count: 0</div><div>Jun 1=
1 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: (215=
19088) ... get_connections.</div><div>Jun 11 20:16:58 v-caps NetworkManager=
[866]: =C2=A0 =C2=A0SCPlugin-Ifupdown: (21519088) ... get_connections (mana=
ged=3Dfalse): return empty list.</div><div>Jun 11 20:16:58 v-caps NetworkMa=
nager[866]: =C2=A0 =C2=A0keyfile: parsing semfio2 ...=C2=A0</div><div>Jun 1=
1 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0keyfile: =C2=A0 =C2=A0 =
read connection &#39;semfio2&#39;</div><div>Jun 11 20:16:58 v-caps NetworkM=
anager[866]: =C2=A0 =C2=A0SCPlugin-Ofono: <a href=3D"tel:%28-1677705008" va=
lue=3D"+551677705008" target=3D"_blank">(-1677705008</a>) ... get_connectio=
ns.</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: =C2=A0 =C2=A0SCPl=
ugin-Ofono: <a href=3D"tel:%28-1677705008" value=3D"+551677705008" target=
=3D"_blank">(-1677705008</a>) connections count: 0</div><div>Jun 11 20:16:5=
8 v-caps NetworkManager[866]: =C2=A0 =C2=A0Ifupdown: get unmanaged devices =
count: 0</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt;=
 monitoring kernel firmware directory &#39;/lib/firmware&#39;.</div><div>Ju=
n 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; rfkill0: found WiFi =
radio killswitch (at /sys/devices/pci0000:00/0000:00:13.2/usb2/2-2/2-2:1.0/=
ieee80211/phy0/rfkill0) (driver zd1211rw)</div><div>Jun 11 20:16:58 v-caps =
NetworkManager[866]: &lt;info&gt; WiFi enabled by radio killswitch; enabled=
 by state file</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;in=
fo&gt; WWAN enabled by radio killswitch; enabled by state file</div><div>Ju=
n 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; WiMAX enabled by rad=
io killswitch; enabled by state file</div><div>Jun 11 20:16:58 v-caps Netwo=
rkManager[866]: &lt;info&gt; Networking is enabled by state file</div><div>=
Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;warn&gt; failed to allocate=
 link cache: (-12) Object not found</div><div>Jun 11 20:16:58 v-caps Networ=
kManager[866]: &lt;info&gt; (p7p1): carrier is OFF</div><div>Jun 11 20:16:5=
8 v-caps NetworkManager[866]: &lt;info&gt; (p7p1): new Ethernet device (dri=
ver: &#39;r8169&#39; ifindex: 2)</div><div>Jun 11 20:16:58 v-caps NetworkMa=
nager[866]: &lt;info&gt; (p7p1): exported as /org/freedesktop/NetworkManage=
r/Devices/0</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&=
gt; (p7p1): device state change: unmanaged -&gt; unavailable (reason &#39;m=
anaged&#39;) [10 20 2]</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]=
: &lt;info&gt; (p7p1): bringing up device.</div><div>Jun 11 20:16:58 v-caps=
 cron[988]: (CRON) INFO (pidfile fd =3D 3)</div><div>Jun 11 20:16:58 v-caps=
 kernel: [ =C2=A0 =C2=A08.286280] r8169 0000:02:00.0 p7p1: link down</div><=
div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.286309] IPv6: ADDRCONF(=
NETDEV_UP): p7p1: link is not ready</div><div>Jun 11 20:16:58 v-caps Networ=
kManager[866]: &lt;info&gt; (p7p1): preparing device.</div><div>Jun 11 20:1=
6:58 v-caps NetworkManager[866]: &lt;info&gt; (p7p1): deactivating device (=
reason &#39;managed&#39;) [2]</div><div>Jun 11 20:16:58 v-caps NetworkManag=
er[866]: &lt;info&gt; Added default wired connection &#39;Conex=C3=A3o cabe=
ada 1&#39; for /sys/devices/pci0000:00/0000:00:06.0/0000:02:00.0/net/p7p1</=
div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;warn&gt; failed to=
 allocate link cache: (-12) Object not found</div><div>Jun 11 20:16:58 v-ca=
ps NetworkManager[866]: &lt;info&gt; (p10p1): carrier is OFF</div><div>Jun =
11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (p10p1): new Ethernet =
device (driver: &#39;r8169&#39; ifindex: 3)</div><div>Jun 11 20:16:58 v-cap=
s NetworkManager[866]: &lt;info&gt; (p10p1): exported as /org/freedesktop/N=
etworkManager/Devices/1</div><div>Jun 11 20:16:58 v-caps NetworkManager[866=
]: &lt;info&gt; (p10p1): device state change: unmanaged -&gt; unavailable (=
reason &#39;managed&#39;) [10 20 2]</div><div>Jun 11 20:16:58 v-caps Networ=
kManager[866]: &lt;info&gt; (p10p1): bringing up device.</div><div>Jun 11 2=
0:16:58 v-caps cron[1039]: (CRON) STARTUP (fork ok)</div><div>Jun 11 20:16:=
58 v-caps acpid: starting up with netlink and the input layer</div><div>Jun=
 11 20:16:58 v-caps cron[1039]: (CRON) INFO (Running @reboot jobs)</div><di=
v>Jun 11 20:16:58 v-caps acpid: 9 rules loaded</div><div>Jun 11 20:16:58 v-=
caps acpid: waiting for events: event logging is off</div><div>Jun 11 20:16=
:58 v-caps anacron[1063]: Anacron 2.3 started on 2015-06-11</div><div>Jun 1=
1 20:16:58 v-caps anacron[1063]: Will run job `cron.daily&#39; in 5 min.</d=
iv><div>Jun 11 20:16:58 v-caps anacron[1063]: Jobs will be executed sequent=
ially</div><div>Jun 11 20:16:58 v-caps whoopsie[1030]: whoopsie 0.2.24.6 st=
arting up.</div><div>Jun 11 20:16:58 v-caps whoopsie[1030]: Using lock path=
: /var/lock/whoopsie/lock</div><div>Jun 11 20:16:58 v-caps ntpdate[1169]: C=
an&#39;t find host <a href=3D"http://0.ubuntu.pool.ntp.org" target=3D"_blan=
k">0.ubuntu.pool.ntp.org</a>: Name or service not known (-2)</div><div>Jun =
11 20:16:58 v-caps ntpdate[1169]: Can&#39;t find host <a href=3D"http://1.u=
buntu.pool.ntp.org" target=3D"_blank">1.ubuntu.pool.ntp.org</a>: Name or se=
rvice not known (-2)</div><div>Jun 11 20:16:58 v-caps ntpdate[1169]: Can&#3=
9;t find host <a href=3D"http://2.ubuntu.pool.ntp.org" target=3D"_blank">2.=
ubuntu.pool.ntp.org</a>: Name or service not known (-2)</div><div>Jun 11 20=
:16:58 v-caps ntpdate[1169]: Can&#39;t find host <a href=3D"http://3.ubuntu=
.pool.ntp.org" target=3D"_blank">3.ubuntu.pool.ntp.org</a>: Name or service=
 not known (-2)</div><div>Jun 11 20:16:58 v-caps ntpdate[1169]: Can&#39;t f=
ind host <a href=3D"http://ntp.ubuntu.com" target=3D"_blank">ntp.ubuntu.com=
</a>: Name or service not known (-2)</div><div>Jun 11 20:16:58 v-caps ntpda=
te[1169]: no servers can be used, exiting</div><div>Jun 11 20:16:58 v-caps =
NetworkManager[866]: &lt;info&gt; (p10p1): preparing device.</div><div>Jun =
11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (p10p1): deactivating =
device (reason &#39;managed&#39;) [2]</div><div>Jun 11 20:16:58 v-caps Netw=
orkManager[866]: &lt;info&gt; Added default wired connection &#39;Conex=C3=
=A3o cabeada 2&#39; for /sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0/n=
et/p10p1</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt;=
 (wlan0): using nl80211 for WiFi device control</div><div>Jun 11 20:16:58 v=
-caps NetworkManager[866]: &lt;info&gt; (wlan0): driver supports Access Poi=
nt (AP) mode</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info=
&gt; (wlan0): new 802.11 WiFi device (driver: &#39;zd1211rw&#39; ifindex: 4=
)</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (wlan0=
): exported as /org/freedesktop/NetworkManager/Devices/2</div><div>Jun 11 2=
0:16:58 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): device state chan=
ge: unmanaged -&gt; unavailable (reason &#39;managed&#39;) [10 20 2]</div><=
div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): bring=
ing up device.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.40=
3879] r8169 0000:05:00.0 p10p1: link down</div><div>Jun 11 20:16:58 v-caps =
kernel: [ =C2=A0 =C2=A08.403918] IPv6: ADDRCONF(NETDEV_UP): p10p1: link is =
not ready</div><div>Jun 11 20:16:58 v-caps ntpd[1200]: ntpd 4.2.6p5@1.2349-=
o Mon Apr 13 13:39:46 UTC 2015 (1)</div><div>Jun 11 20:16:58 v-caps ntpd[12=
03]: proto: precision =3D 0.141 usec</div><div>Jun 11 20:16:58 v-caps ntpd[=
1203]: ntp_io: estimated max descriptors: 1024, initial socket boundary: 16=
</div><div>Jun 11 20:16:58 v-caps ntpd[1203]: Listen and drop on 0 v4wildca=
rd 0.0.0.0 UDP 123</div><div>Jun 11 20:16:58 v-caps ntpd[1203]: Listen and =
drop on 1 v6wildcard :: UDP 123</div><div>Jun 11 20:16:58 v-caps kernel: [ =
=C2=A0 =C2=A08.443017] zd1211rw 2-2:1.0: firmware version 4725</div><div>Ju=
n 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.462399] vboxdrv: module verif=
ication failed: signature and/or =C2=A0required key missing - tainting kern=
el</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.465366] vboxdr=
v: Found 8 processor cores.</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A08.465801] vboxdrv: fAsync=3D0 offMin=3D0x529 offMax=3D0x3ee0</div=
><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.465893] vboxdrv: TSC =
mode is &#39;synchronous&#39;, kernel timer mode is &#39;normal&#39;.</div>=
<div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.465894] vboxdrv: Succe=
ssfully loaded version 4.3.20 (interface 0x001a0008).</div><div>Jun 11 20:1=
6:58 v-caps kernel: [ =C2=A0 =C2=A08.483055] zd1211rw 2-2:1.0: zd1211b chip=
 0ace:1215 v4810 high 00-02-72 AL2230_RF pa0 g--NS</div><div>Jun 11 20:16:5=
8 v-caps ntpd[1203]: Listen normally on 2 lo 127.0.0.1 UDP 123</div><div>Ju=
n 11 20:16:58 v-caps ntpd[1203]: Listen normally on 3 lo ::1 UDP 123</div><=
div>Jun 11 20:16:58 v-caps ntpd[1203]: peers refreshed</div><div>Jun 11 20:=
16:58 v-caps ntpd[1203]: Listening on routing socket on fd #20 for interfac=
e updates</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt=
; (wlan0): preparing device.</div><div>Jun 11 20:16:58 v-caps NetworkManage=
r[866]: &lt;info&gt; (wlan0): deactivating device (reason &#39;managed&#39;=
) [2]</div><div>Jun 11 20:16:58 v-caps dbus[636]: [system] Activating servi=
ce name=3D&#39;fi.w1.wpa_supplicant1&#39; (using servicehelper)</div><div>J=
un 11 20:16:58 v-caps NetworkManager[866]: &lt;warn&gt; /sys/devices/virtua=
l/net/lo: couldn&#39;t determine device driver; ignoring...</div><div>Jun 1=
1 20:16:58 v-caps ntpd[1203]: Deferring DNS for <a href=3D"http://0.ubuntu.=
pool.ntp.org" target=3D"_blank">0.ubuntu.pool.ntp.org</a> 1</div><div>Jun 1=
1 20:16:58 v-caps ntpd[1203]: Deferring DNS for <a href=3D"http://1.ubuntu.=
pool.ntp.org" target=3D"_blank">1.ubuntu.pool.ntp.org</a> 1</div><div>Jun 1=
1 20:16:58 v-caps ntpd[1203]: Deferring DNS for <a href=3D"http://2.ubuntu.=
pool.ntp.org" target=3D"_blank">2.ubuntu.pool.ntp.org</a> 1</div><div>Jun 1=
1 20:16:58 v-caps ntpd[1203]: Deferring DNS for <a href=3D"http://3.ubuntu.=
pool.ntp.org" target=3D"_blank">3.ubuntu.pool.ntp.org</a> 1</div><div>Jun 1=
1 20:16:58 v-caps ntpd[1203]: Deferring DNS for <a href=3D"http://ntp.ubunt=
u.com" target=3D"_blank">ntp.ubuntu.com</a> 1</div><div>Jun 11 20:16:58 v-c=
aps kernel: [ =C2=A0 =C2=A08.519323] IPv6: ADDRCONF(NETDEV_UP): wlan0: link=
 is not ready</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.519=
353] cfg80211: Calling CRDA for country: DE</div><div>Jun 11 20:16:58 v-cap=
s NetworkManager[866]: &lt;warn&gt; /sys/devices/virtual/net/lo: couldn&#39=
;t determine device driver; ignoring...</div><div>Jun 11 20:16:58 v-caps Ne=
tworkManager[866]: &lt;info&gt; urfkill disappeared from the bus</div><div>=
Jun 11 20:16:58 v-caps ntpd[1214]: signal_no_reset: signal 17 had flags 400=
0000</div><div>Jun 11 20:16:58 v-caps whoopsie[1163]: offline</div><div>Jun=
 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; ModemManager availabl=
e in the bus</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.5213=
34] cfg80211: Regulatory domain changed to country: DE</div><div>Jun 11 20:=
16:58 v-caps kernel: [ =C2=A0 =C2=A08.521336] cfg80211: =C2=A0DFS Master re=
gion: unset</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.52133=
7] cfg80211: =C2=A0 (start_freq - end_freq @ bandwidth), (max_antenna_gain,=
 max_eirp), (dfs_cac_time)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=
=A0 =C2=A08.521339] cfg80211: =C2=A0 (2400000 KHz - 2483500 KHz @ 40000 KHz=
), (N/A, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0=
 =C2=A08.521340] cfg80211: =C2=A0 (5150000 KHz - 5250000 KHz @ 40000 KHz), =
(N/A, 2000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =
=C2=A08.521342] cfg80211: =C2=A0 (5250000 KHz - 5350000 KHz @ 40000 KHz), (=
N/A, 2000 mBm), (0 s)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=
=A08.521343] cfg80211: =C2=A0 (5470000 KHz - 5725000 KHz @ 40000 KHz), (N/A=
, 2698 mBm), (0 s)</div><div>Jun 11 20:16:58 v-caps kernel: [ =C2=A0 =C2=A0=
8.521344] cfg80211: =C2=A0 (57240000 KHz - 65880000 KHz @ 2160000 KHz), (N/=
A, 4000 mBm), (N/A)</div><div>Jun 11 20:16:58 v-caps dbus[636]: [system] Su=
ccessfully activated service &#39;fi.w1.wpa_supplicant1&#39;</div><div>Jun =
11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; wpa_supplicant started=
</div><div>Jun 11 20:16:58 v-caps wpa_supplicant[1213]: Successfully initia=
lized wpa_supplicant</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: =
&lt;info&gt; (wlan0) supports 4 scan SSIDs</div><div>Jun 11 20:16:58 v-caps=
 NetworkManager[866]: &lt;warn&gt; Trying to remove a non-existant call id.=
</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (wlan0)=
: supplicant interface state: starting -&gt; ready</div><div>Jun 11 20:16:5=
8 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): device state change: un=
available -&gt; disconnected (reason &#39;supplicant-available&#39;) [20 30=
 42]</div><div>Jun 11 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (wl=
an0): supplicant interface state: ready -&gt; disconnected</div><div>Jun 11=
 20:16:58 v-caps NetworkManager[866]: &lt;info&gt; (wlan0) supports 4 scan =
SSIDs</div><div>Jun 11 20:16:58 v-caps wpa_supplicant[1215]: wlan0: Reject =
scan trigger since one is already pending</div><div>Jun 11 20:16:58 v-caps =
wpa_supplicant[1215]: wlan0: CTRL-EVENT-SCAN-STARTED=C2=A0</div><div>Jun 11=
 20:16:58 v-caps kernel: [ =C2=A0 =C2=A08.671967] vboxpci: IOMMU not found =
(not registered)</div><div>Jun 11 20:16:58 v-caps dbus[636]: [system] Activ=
ating service name=3D&#39;org.freedesktop.Accounts&#39; (using servicehelpe=
r)</div><div>Jun 11 20:16:58 v-caps accounts-daemon[1279]: started daemon v=
ersion 0.6.35</div><div>Jun 11 20:16:58 v-caps dbus[636]: [system] Successf=
ully activated service &#39;org.freedesktop.Accounts&#39;</div><div>Jun 11 =
20:16:59 v-caps kernel: [ =C2=A0 =C2=A09.153486] init: plymouth-upstart-bri=
dge main process ended, respawning</div><div>Jun 11 20:16:59 v-caps Network=
Manager[866]: &lt;info&gt; Auto-activating connection &#39;semfio2&#39;.</d=
iv><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; Activation=
 (wlan0) starting connection &#39;semfio2&#39;</div><div>Jun 11 20:16:59 v-=
caps NetworkManager[866]: &lt;info&gt; (wlan0): device state change: discon=
nected -&gt; prepare (reason &#39;none&#39;) [30 40 0]</div><div>Jun 11 20:=
16:59 v-caps NetworkManager[866]: &lt;info&gt; NetworkManager state is now =
CONNECTING</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&g=
t; Activation (wlan0) Stage 1 of 5 (Device Prepare) scheduled...</div><div>=
Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; Activation (wlan0)=
 Stage 1 of 5 (Device Prepare) started...</div><div>Jun 11 20:16:59 v-caps =
NetworkManager[866]: &lt;info&gt; Activation (wlan0) Stage 2 of 5 (Device C=
onfigure) scheduled...</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]=
: &lt;info&gt; Activation (wlan0) Stage 1 of 5 (Device Prepare) complete.</=
div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; Activatio=
n (wlan0) Stage 2 of 5 (Device Configure) starting...</div><div>Jun 11 20:1=
6:59 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): device state change:=
 prepare -&gt; config (reason &#39;none&#39;) [40 50 0]</div><div>Jun 11 20=
:16:59 v-caps NetworkManager[866]: &lt;info&gt; Activation (wlan0/wireless)=
: connection &#39;semfio2&#39; has security, and secrets exist.=C2=A0 No ne=
w secrets needed.</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt=
;info&gt; Config: added &#39;ssid&#39; value &#39;semfio2&#39;</div><div>Ju=
n 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; Config: added &#39;s=
can_ssid&#39; value &#39;1&#39;</div><div>Jun 11 20:16:59 v-caps NetworkMan=
ager[866]: &lt;info&gt; Config: added &#39;key_mgmt&#39; value &#39;WPA-PSK=
&#39;</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; Co=
nfig: added &#39;auth_alg&#39; value &#39;OPEN&#39;</div><div>Jun 11 20:16:=
59 v-caps NetworkManager[866]: &lt;info&gt; Config: added &#39;psk&#39; val=
ue &#39;&lt;omitted&gt;&#39;</div><div>Jun 11 20:16:59 v-caps NetworkManage=
r[866]: &lt;info&gt; Activation (wlan0) Stage 2 of 5 (Device Configure) com=
plete.</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; C=
onfig: set interface ap_scan to 1</div><div>Jun 11 20:16:59 v-caps NetworkM=
anager[866]: &lt;info&gt; (wlan0): supplicant interface state: disconnected=
 -&gt; inactive</div><div>Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wlan=
0: SME: Trying to authenticate with 5a:98:26:49:92:24 (SSID=3D&#39;semfio2&=
#39; freq=3D2412 MHz)</div><div>Jun 11 20:16:59 v-caps kernel: [ =C2=A0 =C2=
=A09.407531] wlan0: authenticate with 5a:98:26:49:92:24</div><div>Jun 11 20=
:16:59 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): supplicant interfa=
ce state: inactive -&gt; authenticating</div><div>Jun 11 20:16:59 v-caps wp=
a_supplicant[1215]: wlan0: Trying to associate with 5a:98:26:49:92:24 (SSID=
=3D&#39;semfio2&#39; freq=3D2412 MHz)</div><div>Jun 11 20:16:59 v-caps kern=
el: [ =C2=A0 =C2=A09.433096] wlan0: send auth to 5a:98:26:49:92:24 (try 1/3=
)</div><div>Jun 11 20:16:59 v-caps kernel: [ =C2=A0 =C2=A09.434594] wlan0: =
authenticated</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;inf=
o&gt; (wlan0): supplicant interface state: authenticating -&gt; associating=
</div><div>Jun 11 20:16:59 v-caps kernel: [ =C2=A0 =C2=A09.436876] wlan0: a=
ssociate with 5a:98:26:49:92:24 (try 1/3)</div><div>Jun 11 20:16:59 v-caps =
wpa_supplicant[1215]: wlan0: Associated with 5a:98:26:49:92:24</div><div>Ju=
n 11 20:16:59 v-caps kernel: [ =C2=A0 =C2=A09.443353] wlan0: RX AssocResp f=
rom 5a:98:26:49:92:24 (capab=3D0x411 status=3D0 aid=3D2)</div><div>Jun 11 2=
0:16:59 v-caps kernel: [ =C2=A0 =C2=A09.443853] wlan0: associated</div><div=
>Jun 11 20:16:59 v-caps kernel: [ =C2=A0 =C2=A09.443881] IPv6: ADDRCONF(NET=
DEV_CHANGE): wlan0: link becomes ready</div><div>Jun 11 20:16:59 v-caps Net=
workManager[866]: &lt;info&gt; (wlan0): supplicant interface state: associa=
ting -&gt; 4-way handshake</div><div>Jun 11 20:16:59 v-caps wpa_supplicant[=
1215]: wlan0: WPA: Key negotiation completed with 5a:98:26:49:92:24 [PTK=3D=
CCMP GTK=3DTKIP]</div><div>Jun 11 20:16:59 v-caps wpa_supplicant[1215]: wla=
n0: CTRL-EVENT-CONNECTED - Connection to 5a:98:26:49:92:24 completed [id=3D=
0 id_str=3D]</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info=
&gt; (wlan0): supplicant interface state: 4-way handshake -&gt; completed</=
div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; Activatio=
n (wlan0/wireless) Stage 2 of 5 (Device Configure) successful.=C2=A0 Connec=
ted to wireless network &#39;semfio2&#39;.</div><div>Jun 11 20:16:59 v-caps=
 NetworkManager[866]: &lt;info&gt; Activation (wlan0) Stage 3 of 5 (IP Conf=
igure Start) scheduled.</div><div>Jun 11 20:16:59 v-caps NetworkManager[866=
]: &lt;info&gt; Activation (wlan0) Stage 3 of 5 (IP Configure Start) starte=
d...</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; (wl=
an0): device state change: config -&gt; ip-config (reason &#39;none&#39;) [=
50 70 0]</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt;=
 Activation (wlan0) Beginning DHCPv4 transaction (timeout in 45 seconds)</d=
iv><div>Jun 11 20:16:59 v-caps NetworkManager[866]: &lt;info&gt; dhclient s=
tarted with pid 1498</div><div>Jun 11 20:16:59 v-caps NetworkManager[866]: =
&lt;info&gt; Activation (wlan0) Beginning IP6 addrconf.</div><div>Jun 11 20=
:16:59 v-caps NetworkManager[866]: &lt;info&gt; Activation (wlan0) Stage 3 =
of 5 (IP Configure Start) complete.</div><div>Jun 11 20:16:59 v-caps dhclie=
nt: Internet Systems Consortium DHCP Client 4.2.4</div><div>Jun 11 20:16:59=
 v-caps dhclient: Copyright 2004-2012 Internet Systems Consortium.</div><di=
v>Jun 11 20:16:59 v-caps dhclient: All rights reserved.</div><div>Jun 11 20=
:16:59 v-caps dhclient: For info, please visit <a href=3D"https://www.isc.o=
rg/software/dhcp/" target=3D"_blank">https://www.isc.org/software/dhcp/</a>=
</div><div>Jun 11 20:16:59 v-caps dhclient:=C2=A0</div><div>Jun 11 20:16:59=
 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): DHCPv4 state changed nbi=
 -&gt; preinit</div><div>Jun 11 20:16:59 v-caps dhclient: Listening on LPF/=
wlan0/00:02:72:72:66:e6</div><div>Jun 11 20:16:59 v-caps dhclient: Sending =
on =C2=A0 LPF/wlan0/00:02:72:72:66:e6</div><div>Jun 11 20:16:59 v-caps dhcl=
ient: Sending on =C2=A0 Socket/fallback</div><div>Jun 11 20:16:59 v-caps dh=
client: DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 3 (xid=3D=
0x70ac9f93)</div><div>Jun 11 20:17:00 v-caps dbus[636]: [system] Activating=
 service name=3D&#39;org.freedesktop.UPower&#39; (using servicehelper)</div=
><div>Jun 11 20:17:00 v-caps dbus[636]: [system] Activating service name=3D=
&#39;org.freedesktop.UDisks2&#39; (using servicehelper)</div><div>Jun 11 20=
:17:00 v-caps dbus[636]: [system] Activating service name=3D&#39;org.freede=
sktop.RealtimeKit1&#39; (using servicehelper)</div><div>Jun 11 20:17:00 v-c=
aps dbus[636]: [system] Successfully activated service &#39;org.freedesktop=
.UPower&#39;</div><div>Jun 11 20:17:00 v-caps dbus[636]: [system] Successfu=
lly activated service &#39;org.freedesktop.RealtimeKit1&#39;</div><div>Jun =
11 20:17:00 v-caps rtkit-daemon[1578]: Successfully called chroot.</div><di=
v>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully dropped privilege=
s.</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully limite=
d resources.</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Running.<=
/div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Watchdog thread runnin=
g.</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Canary thread runni=
ng.</div><div>Jun 11 20:17:00 v-caps udisksd[1573]: udisks daemon version 2=
.1.3 starting</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successf=
ully made thread 1576 of process 1576 (n/a) owned by &#39;1000&#39; high pr=
iority at nice level -11.</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[157=
8]: Supervising 1 threads of 1 processes of 1 users.</div><div>Jun 11 20:17=
:00 v-caps dbus[636]: [system] Successfully activated service &#39;org.free=
desktop.UDisks2&#39;</div><div>Jun 11 20:17:00 v-caps udisksd[1573]: Acquir=
ed the name org.freedesktop.UDisks2 on the system message bus</div><div>Jun=
 11 20:17:00 v-caps ModemManager[762]: &lt;warn&gt; =C2=A0Couldn&#39;t find=
 support for device at &#39;/sys/devices/pci0000:00/0000:00:06.0/0000:02:00=
.0&#39;: not supported by any plugin</div><div>Jun 11 20:17:00 v-caps Modem=
Manager[762]: &lt;warn&gt; =C2=A0Couldn&#39;t find support for device at &#=
39;/sys/devices/pci0000:00/0000:00:0a.0/0000:05:00.0&#39;: not supported by=
 any plugin</div><div>Jun 11 20:17:00 v-caps ModemManager[762]: &lt;warn&gt=
; =C2=A0Couldn&#39;t find support for device at &#39;/sys/devices/pci0000:0=
0/0000:00:13.2/usb2/2-2&#39;: not supported by any plugin</div><div>Jun 11 =
20:17:00 v-caps rtkit-daemon[1578]: Successfully made thread 1673 of proces=
s 1576 (n/a) owned by &#39;1000&#39; RT at priority 5.</div><div>Jun 11 20:=
17:00 v-caps rtkit-daemon[1578]: Supervising 2 threads of 1 processes of 1 =
users.</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Successfully ma=
de thread 1681 of process 1576 (n/a) owned by &#39;1000&#39; RT at priority=
 5.</div><div>Jun 11 20:17:00 v-caps rtkit-daemon[1578]: Supervising 3 thre=
ads of 1 processes of 1 users.</div><div>Jun 11 20:17:00 v-caps rtkit-daemo=
n[1578]: Successfully made thread 1683 of process 1683 (n/a) owned by &#39;=
1000&#39; high priority at nice level -11.</div><div>Jun 11 20:17:00 v-caps=
 rtkit-daemon[1578]: Supervising 4 threads of 2 processes of 1 users.</div>=
<div>Jun 11 20:17:00 v-caps pulseaudio[1683]: [pulseaudio] pid.c: Daemon al=
ready running.</div><div>Jun 11 20:17:00 v-caps ntpd_intres[1214]: host nam=
e not found: <a href=3D"http://0.ubuntu.pool.ntp.org" target=3D"_blank">0.u=
buntu.pool.ntp.org</a></div><div>Jun 11 20:17:00 v-caps ntpd_intres[1214]: =
host name not found: <a href=3D"http://1.ubuntu.pool.ntp.org" target=3D"_bl=
ank">1.ubuntu.pool.ntp.org</a></div><div>Jun 11 20:17:00 v-caps ntpd_intres=
[1214]: host name not found: <a href=3D"http://2.ubuntu.pool.ntp.org" targe=
t=3D"_blank">2.ubuntu.pool.ntp.org</a></div><div>Jun 11 20:17:00 v-caps ntp=
d_intres[1214]: host name not found: <a href=3D"http://3.ubuntu.pool.ntp.or=
g" target=3D"_blank">3.ubuntu.pool.ntp.org</a></div><div>Jun 11 20:17:00 v-=
caps ntpd_intres[1214]: host name not found: <a href=3D"http://ntp.ubuntu.c=
om" target=3D"_blank">ntp.ubuntu.com</a></div><div>Jun 11 20:17:00 v-caps k=
ernel: [ =C2=A0 10.655128] floppy0: no floppy controllers found</div><div>J=
un 11 20:17:01 v-caps avahi-daemon[799]: Joining mDNS multicast group on in=
terface wlan0.IPv6 with address fe80::202:72ff:fe72:66e6.</div><div>Jun 11 =
20:17:01 v-caps avahi-daemon[799]: New relevant interface wlan0.IPv6 for mD=
NS.</div><div>Jun 11 20:17:01 v-caps avahi-daemon[799]: Registering new add=
ress record for fe80::202:72ff:fe72:66e6 on wlan0.*.</div><div>Jun 11 20:17=
:01 v-caps CRON[1845]: (root) CMD ( =C2=A0 cd / &amp;&amp; run-parts --repo=
rt /etc/cron.hourly)</div><div>Jun 11 20:17:02 v-caps ntpd[1203]: Listen no=
rmally on 4 wlan0 fe80::202:72ff:fe72:66e6 UDP 123</div><div>Jun 11 20:17:0=
2 v-caps ntpd[1203]: peers refreshed</div><div>Jun 11 20:17:02 v-caps ntpd[=
1203]: new interface(s) found: waking up resolver</div><div>Jun 11 20:17:02=
 v-caps dhclient: DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval=
 6 (xid=3D0x70ac9f93)</div><div>Jun 11 20:17:03 v-caps dhclient: DHCPREQUES=
T of 192.168.25.7 on wlan0 to 255.255.255.255 port 67 (xid=3D0x70ac9f93)</d=
iv><div>Jun 11 20:17:03 v-caps dhclient: DHCPOFFER of 192.168.25.7 from 192=
.168.25.1</div><div>Jun 11 20:17:03 v-caps dhclient: DHCPACK of 192.168.25.=
7 from 192.168.25.1</div><div>Jun 11 20:17:03 v-caps dhclient: bound to 192=
.168.25.7 -- renewal in 39070 seconds.</div><div>Jun 11 20:17:03 v-caps Net=
workManager[866]: &lt;info&gt; (wlan0): DHCPv4 state changed preinit -&gt; =
bound</div><div>Jun 11 20:17:03 v-caps NetworkManager[866]: &lt;info&gt; =
=C2=A0 address 192.168.25.7</div><div>Jun 11 20:17:03 v-caps NetworkManager=
[866]: &lt;info&gt; =C2=A0 prefix 24 (255.255.255.0)</div><div>Jun 11 20:17=
:03 v-caps NetworkManager[866]: &lt;info&gt; =C2=A0 gateway 192.168.25.1</d=
iv><div>Jun 11 20:17:03 v-caps NetworkManager[866]: &lt;info&gt; =C2=A0 nam=
eserver &#39;192.168.25.1&#39;</div><div>Jun 11 20:17:03 v-caps NetworkMana=
ger[866]: &lt;info&gt; =C2=A0 domain name &#39;<a href=3D"http://domain.nam=
e" target=3D"_blank">domain.name</a>&#39;</div><div>Jun 11 20:17:03 v-caps =
NetworkManager[866]: &lt;info&gt; Activation (wlan0) Stage 5 of 5 (IPv4 Con=
figure Commit) scheduled...</div><div>Jun 11 20:17:03 v-caps NetworkManager=
[866]: &lt;info&gt; Activation (wlan0) Stage 5 of 5 (IPv4 Commit) started..=
.</div><div>Jun 11 20:17:03 v-caps avahi-daemon[799]: Joining mDNS multicas=
t group on interface wlan0.IPv4 with address 192.168.25.7.</div><div>Jun 11=
 20:17:03 v-caps avahi-daemon[799]: New relevant interface wlan0.IPv4 for m=
DNS.</div><div>Jun 11 20:17:03 v-caps avahi-daemon[799]: Registering new ad=
dress record for 192.168.25.7 on wlan0.IPv4.</div><div>Jun 11 20:17:04 v-ca=
ps ntpd_intres[1214]: host name not found: <a href=3D"http://0.ubuntu.pool.=
ntp.org" target=3D"_blank">0.ubuntu.pool.ntp.org</a></div><div>Jun 11 20:17=
:04 v-caps ntpd_intres[1214]: host name not found: <a href=3D"http://1.ubun=
tu.pool.ntp.org" target=3D"_blank">1.ubuntu.pool.ntp.org</a></div><div>Jun =
11 20:17:04 v-caps ntpd_intres[1214]: host name not found: <a href=3D"http:=
//2.ubuntu.pool.ntp.org" target=3D"_blank">2.ubuntu.pool.ntp.org</a></div><=
div>Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found: <a href=
=3D"http://3.ubuntu.pool.ntp.org" target=3D"_blank">3.ubuntu.pool.ntp.org</=
a></div><div>Jun 11 20:17:04 v-caps ntpd_intres[1214]: host name not found:=
 <a href=3D"http://ntp.ubuntu.com" target=3D"_blank">ntp.ubuntu.com</a></di=
v><div>Jun 11 20:17:04 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): de=
vice state change: ip-config -&gt; secondaries (reason &#39;none&#39;) [70 =
90 0]</div><div>Jun 11 20:17:04 v-caps NetworkManager[866]: &lt;info&gt; Ac=
tivation (wlan0) Stage 5 of 5 (IPv4 Commit) complete.</div><div>Jun 11 20:1=
7:04 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): device state change:=
 secondaries -&gt; activated (reason &#39;none&#39;) [90 100 0]</div><div>J=
un 11 20:17:04 v-caps NetworkManager[866]: &lt;info&gt; NetworkManager stat=
e is now CONNECTED_GLOBAL</div><div>Jun 11 20:17:04 v-caps NetworkManager[8=
66]: &lt;info&gt; Policy set &#39;semfio2&#39; (wlan0) as default for IPv4 =
routing and DNS.</div><div>Jun 11 20:17:04 v-caps NetworkManager[866]: &lt;=
info&gt; DNS: starting dnsmasq...</div><div>Jun 11 20:17:04 v-caps NetworkM=
anager[866]: &lt;warn&gt; dnsmasq not available on the bus, can&#39;t updat=
e servers.</div><div>Jun 11 20:17:04 v-caps NetworkManager[866]: &lt;error&=
gt; <a href=3D"tel:%5B1434064624" value=3D"+551434064624" target=3D"_blank"=
>[1434064624</a>.899920] [nm-dns-dnsmasq.c:396] update(): dnsmasq owner not=
 found on bus: Could not get owner of name &#39;org.freedesktop.NetworkMana=
ger.dnsmasq&#39;: no such name</div><div>Jun 11 20:17:04 v-caps NetworkMana=
ger[866]: &lt;warn&gt; DNS: plugin dnsmasq update failed</div><div>Jun 11 2=
0:17:04 v-caps NetworkManager[866]: &lt;info&gt; Writing DNS information to=
 /sbin/resolvconf</div><div>Jun 11 20:17:04 v-caps dnsmasq[1862]: iniciado,=
 vers=C3=A3o 2.68 cache desabilitado</div><div>Jun 11 20:17:04 v-caps dnsma=
sq[1862]: op=C3=A7=C3=B5es de tempo de compila=C3=A7=C3=A3o: IPv6 GNU-getop=
t DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack ipset auth</div><div>Jun =
11 20:17:04 v-caps dnsmasq[1862]: suporte a DBus habilitado: conectado ao b=
arramento do sistema</div><div>Jun 11 20:17:04 v-caps dnsmasq[1862]: aviso:=
 n=C3=A3o h=C3=A1 servidores upstream configurados</div><div>Jun 11 20:17:0=
6 v-caps ntpd[1203]: Listen normally on 5 wlan0 192.168.25.7 UDP 123</div><=
div>Jun 11 20:17:06 v-caps ntpd[1203]: peers refreshed</div><div>Jun 11 20:=
17:06 v-caps ntpd[1203]: new interface(s) found: waking up resolver</div><d=
iv>Jun 11 20:16:59 v-caps whoopsie[1163]: offline</div><div>Jun 11 20:17:07=
 v-caps whoopsie[1163]: Could not get the list of active connections: Timeo=
ut was reached</div><div>Jun 11 20:17:11 v-caps NetworkManager[866]: &lt;in=
fo&gt; Activation (wlan0) successful, device activated.</div><div>Jun 11 20=
:17:11 v-caps whoopsie[1163]: offline</div><div>Jun 11 20:17:11 v-caps dbus=
[636]: [system] Activating service name=3D&#39;org.freedesktop.nm_dispatche=
r&#39; (using servicehelper)</div><div>Jun 11 20:17:11 v-caps NetworkManage=
r[866]: &lt;info&gt; WiFi hardware radio set enabled</div><div>Jun 11 20:17=
:11 v-caps NetworkManager[866]: &lt;warn&gt; dnsmasq appeared on DBus: :1.4=
0</div><div>Jun 11 20:17:11 v-caps NetworkManager[866]: &lt;info&gt; Writin=
g DNS information to /sbin/resolvconf</div><div>Jun 11 20:17:11 v-caps dnsm=
asq[1862]: configurando servidores upstream do DBus</div><div>Jun 11 20:17:=
11 v-caps dnsmasq[1862]: usando nome de servidor 192.168.25.1#53</div><div>=
Jun 11 20:17:11 v-caps dbus[636]: [system] Successfully activated service &=
#39;org.freedesktop.nm_dispatcher&#39;</div><div>Jun 11 20:17:11 v-caps ntp=
d[1203]: ntpd exiting on signal 15</div><div>Jun 11 20:17:12 v-caps ntpd_in=
tres[1214]: DNS <a href=3D"http://0.ubuntu.pool.ntp.org" target=3D"_blank">=
0.ubuntu.pool.ntp.org</a> -&gt; 200.192.232.8</div><div>Jun 11 20:17:12 v-c=
aps ntpd_intres[1214]: parent died before we finished, exiting</div><div>Ju=
n 11 20:17:20 v-caps NetworkManager[866]: &lt;info&gt; (wlan0): IP6 addrcon=
f timed out or failed.</div><div>Jun 11 20:17:20 v-caps NetworkManager[866]=
: &lt;info&gt; Activation (wlan0) Stage 4 of 5 (IPv6 Configure Timeout) sch=
eduled...</div><div>Jun 11 20:17:20 v-caps NetworkManager[866]: &lt;info&gt=
; Activation (wlan0) Stage 4 of 5 (IPv6 Configure Timeout) started...</div>=
<div>Jun 11 20:17:20 v-caps NetworkManager[866]: &lt;info&gt; Activation (w=
lan0) Stage 4 of 5 (IPv6 Configure Timeout) complete.</div><div>Jun 11 20:1=
7:22 v-caps wpa_supplicant[1215]: wlan0: CTRL-EVENT-SCAN-STARTED=C2=A0</div=
><div>Jun 11 20:44:55 v-caps ntpdate[2027]: step time server 200.160.7.186 =
offset 1652.839285 sec</div><div>Jun 11 20:44:55 v-caps ntpd[2083]: ntpd 4.=
2.6p5@1.2349-o Mon Apr 13 13:39:46 UTC 2015 (1)</div><div>Jun 11 20:44:55 v=
-caps ntpd[2084]: proto: precision =3D 0.113 usec</div><div>Jun 11 20:44:55=
 v-caps ntpd[2084]: ntp_io: estimated max descriptors: 1024, initial socket=
 boundary: 16</div><div>Jun 11 20:44:55 v-caps ntpd[2084]: Listen and drop =
on 0 v4wildcard 0.0.0.0 UDP 123</div><div>Jun 11 20:44:55 v-caps ntpd[2084]=
: Listen and drop on 1 v6wildcard :: UDP 123</div><div>Jun 11 20:44:55 v-ca=
ps ntpd[2084]: Listen normally on 2 lo 127.0.0.1 UDP 123</div><div>Jun 11 2=
0:44:55 v-caps ntpd[2084]: Listen normally on 3 wlan0 192.168.25.7 UDP 123<=
/div><div>Jun 11 20:44:55 v-caps ntpd[2084]: Listen normally on 4 lo ::1 UD=
P 123</div><div>Jun 11 20:44:55 v-caps ntpd[2084]: Listen normally on 5 wla=
n0 fe80::202:72ff:fe72:66e6 UDP 123</div><div>Jun 11 20:44:55 v-caps ntpd[2=
084]: peers refreshed</div><div>Jun 11 20:44:55 v-caps ntpd[2084]: Listenin=
g on routing socket on fd #22 for interface updates</div><div>Jun 11 20:45:=
00 v-caps dbus[636]: [system] Activating service name=3D&#39;org.freedeskto=
p.ColorManager&#39; (using servicehelper)</div><div>Jun 11 20:45:00 v-caps =
colord: Using config file /etc/colord.conf</div><div>Jun 11 20:45:00 v-caps=
 colord: Using mapping database file /var/lib/colord/mapping.db</div><div>J=
un 11 20:45:01 v-caps colord: Using device database file /var/lib/colord/st=
orage.db</div><div>Jun 11 20:45:01 v-caps colord: loaded plugin libcd_plugi=
n_camera.so</div><div>Jun 11 20:45:01 v-caps colord: loaded plugin libcd_pl=
ugin_scanner.so</div><div>Jun 11 20:45:01 v-caps colord: plugin /usr/lib/x8=
6_64-linux-gnu/colord-plugins/libcd_plugin_sane.so not loaded: plugin refus=
ed to load</div><div>Jun 11 20:45:01 v-caps colord: Daemon ready for reques=
ts</div><div>Jun 11 20:45:01 v-caps dbus[636]: [system] Successfully activa=
ted service &#39;org.freedesktop.ColorManager&#39;</div><div>Jun 11 20:45:0=
1 v-caps colord: Profile added: icc-2f1f11ecd613fe5551420fcaf5b11ff8</div><=
div>Jun 11 20:45:01 v-caps colord: Profile added: icc-c227f46f246694ba9971f=
270cb61a0c1</div><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-072=
0e7cdbc792b77c0740c39f325ef9e</div><div>Jun 11 20:45:01 v-caps colord: Prof=
ile added: icc-a1d13bd5309e0f06ceda6f0d75367823</div><div>Jun 11 20:45:01 v=
-caps colord: Profile added: icc-c3e6382fa9b2d31b01b736f6f97aac3a</div><div=
>Jun 11 20:45:01 v-caps colord: Profile added: icc-353a6bcabda00f04b6988f89=
126ce6f5</div><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-d64908=
83a866e4059370e1de1d840283</div><div>Jun 11 20:45:01 v-caps colord: Profile=
 added: icc-3bd2261b1125a0fd9ebf827a2d1bed84</div><div>Jun 11 20:45:01 v-ca=
ps colord: Profile added: icc-ea421e3a65cfa796e2732ce36086e327</div><div>Ju=
n 11 20:45:01 v-caps colord: Profile added: icc-526fbc9bdf0d7156c553998d47a=
3b5fc</div><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-f64a1f19c=
e07290b35a752b00217b684</div><div>Jun 11 20:45:01 v-caps colord: Profile ad=
ded: icc-57f0d896250f6f98f77ca1b0d19019c0</div><div>Jun 11 20:45:01 v-caps =
colord: Profile added: icc-654b99c87e67edb1c1cfb0dcb7fa9d04</div><div>Jun 1=
1 20:45:01 v-caps colord: Profile added: icc-fb0ac62618f016ed9b92ce239258ef=
a8</div><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-72f5b1cba915=
b68ea75cc843e270df5a</div><div>Jun 11 20:45:01 v-caps colord: Profile added=
: icc-d4a7a2bd8ddaacf10e275e3db31d72b8</div><div>Jun 11 20:45:01 v-caps col=
ord: Profile added: icc-a10be98be58460669fcdc6946939b7cf</div><div>Jun 11 2=
0:45:01 v-caps colord: Profile added: icc-0383c34650771ce95ef93fe916867725<=
/div><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-b0701c2ccf05928=
7d0b067464df8bda9</div><div>Jun 11 20:45:01 v-caps colord: Profile added: i=
cc-6a245ab2d8892e2e56232af93cd48b81</div><div>Jun 11 20:45:01 v-caps colord=
: Profile added: icc-df7c0067b1eb9bcc9fc9b33bc3a797eb</div><div>Jun 11 20:4=
5:01 v-caps colord: Profile added: icc-523e494bc2f53c53d51d0758b07f4879</di=
v><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-6ad6d63767ce039324=
5528ada92f1cb2</div><div>Jun 11 20:45:01 v-caps colord: Profile added: icc-=
3a34aa6c3d1fb1ef63ff41e04ee00979</div><div>Jun 11 20:45:01 v-caps colord: P=
rofile added: DCP7065DN-Gray..</div><div>Jun 11 20:45:01 v-caps colord: Dev=
ice added: cups-DCP7065DN</div><div>Jun 11 20:45:01 v-caps colord: Profile =
added: HP-8100-antiga-Gray..</div><div>Jun 11 20:45:01 v-caps colord: Profi=
le added: HP-8100-antiga-RGB..</div><div>Jun 11 20:45:01 v-caps colord: Dev=
ice added: cups-HP-8100-antiga</div><div>Jun 11 20:45:01 v-caps colord: Pro=
file added: HP-8100-nova-Gray..</div><div>Jun 11 20:45:01 v-caps colord: Pr=
ofile added: HP-8100-nova-RGB..</div><div>Jun 11 20:45:01 v-caps colord: De=
vice added: cups-HP-8100-nova</div><div>Jun 11 20:45:01 v-caps colord: Prof=
ile added: L355-Series-Gray..</div><div>Jun 11 20:45:01 v-caps colord: Prof=
ile added: L355-Series-RGB..</div><div>Jun 11 20:45:01 v-caps colord: Devic=
e added: cups-L355-Series</div><div>Jun 11 20:46:20 v-caps dbus[636]: [syst=
em] Activating service name=3D&#39;org.freedesktop.ConsoleKit&#39; (using s=
ervicehelper)</div><div>Jun 11 20:46:20 v-caps dbus[636]: [system] Successf=
ully activated service &#39;org.freedesktop.ConsoleKit&#39;</div></div><div=
 class=3D"gmail_extra"><br clear=3D"all"><div><div><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><br></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div>
<br><div class=3D"gmail_quote">2015-06-11 20:17 GMT-03:00 Ilia Mirkin <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">=
imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex"><p dir=3D"ltr">Inc=
lude logs from the failed boot</p>
<div class=3D"gmail_quote"><div><div>On Jun 11, 2015 10:55 PM, &quot;Andre =
Campos Rodovalho&quot; &lt;<a href=3D"mailto:andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" tar=
get=3D"_blank">andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br type=3D"attribut=
ion"></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div><div><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div dir=3D"ltr">Hello, I&#39;m facing issues with a Point of =
View GT210/218 and nouveau drivers. I&#39;m using ubuntu server with LXDE o=
n top of it...<div><br></div><div><b>lshw -c video</b> output:</div><div><d=
iv><div>*-display =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0description: VGA compatible controller</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0product: GT218 [GeForce 210]</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor: NVIDIA Corporation</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0bus in=
fo: pci@0000:01:00.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0version: a2</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0width: 64 bits</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0clock: 33MHz</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0capabilities: v=
ga_controller bus_master cap_list rom</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
configuration: driver=3Dnouveau latency=3D0</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0resources: irq:82 memory:fd000000-fdffffff memory:d0000000-d7ffffff m=
emory:d8000000-d9ffffff ioport:e000(size=3D128) memory:fe000000-fe07ffff</d=
iv></div></div><div><br></div><div><b>modeinfo nouveau </b>output:</div><di=
v><div>filename: =C2=A0 =C2=A0 =C2=A0 /lib/modules/3.16.0-38-generic/kernel=
/drivers/gpu/drm/nouveau/nouveau.ko</div><div>license: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0GPL and additional rights</div><div>description: =C2=A0 =C2=A0nVidia=
 Riva/TNT/GeForce/Quadro/Tesla</div><div>author: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Nouveau Project</div><div>srcversion: =C2=A0 =C2=A0 D0FCF627599F97CE5A4=
C810</div><div>alias: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci:v000012D2d*sv*s=
d*bc03sc*i*</div><div>alias: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci:v000010D=
Ed*sv*sd*bc03sc*i*</div><div>depends: =C2=A0 =C2=A0 =C2=A0 =C2=A0drm,drm_km=
s_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit</div><div>intree: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Y</div><div>vermagic: =C2=A0 =C2=A0 =C2=A0 3.16.0-38-generic=
 SMP mod_unload modversions=C2=A0</div><div>signer: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Magrathea: Glacier signing key</div><div>sig_key: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0C2:84:ED:AC:CF:0B:47:36:52:C3:4D:23:BE:C3:56:94:42:36:E6:3B</div>=
<div>sig_hashalgo: =C2=A0 sha512</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tv_norm:Default TV norm.</div><div><span style=3D"white-space:pr=
e-wrap">		</span>Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,</div=
><div><span style=3D"white-space:pre-wrap">			</span>hd480i, hd480p, hd576i=
, hd576p, hd720p, hd1080i.</div><div><span style=3D"white-space:pre-wrap">	=
	</span>Default: PAL</div><div><span style=3D"white-space:pre-wrap">		</spa=
n>*NOTE* Ignored for cards with external TV encoders. (charp)</div><div>par=
m: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tv_disable:Disable TV-out detection (=
int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignorelid:Ignore AC=
PI lid status (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dual=
link:Allow dual-link TMDS (default: enabled) (int)</div><div>parm: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nofbaccel:Disable fbcon acceleration (int)</div=
><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 agpmode:AGP mode (0 to disab=
le AGP) (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vram_pushb=
uf:Create DMA push buffers in VRAM (int)</div><div>parm: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 config:option string to pass to driver core (charp)</div>=
<div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug:debug string to pass to=
 driver core (charp)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 noa=
ccel:disable kernel/abi16 acceleration (int)</div><div>parm: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 modeset:enable driver (default: auto, 0 =3D disabled, =
1 =3D enabled, 2 =3D headless) (int)</div><div>parm: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 runpm:disable (0), force enable (1), optimus only default (-1=
) (int)</div></div><div><br></div><div>I need to boot with nomodeset to see=
 something on this machine. But the most wierd is that I have a very simila=
r machine with almost the same video card and I have no problems to use it.=
 The installation is the same, I cloned the hard drive...</div><div><br></d=
iv><div>The machine that is working fine is a Asus=C2=A0M5A97 R.20 + Zogis =
GeForce GT210</div><div>The machine that is with blank screen after Xorg is=
 loaded is ASRock 980DE3/U3S3 + Point of View GeForce GT210.<br><br>What ca=
n I do to solve this problem?</div><div><br></div><div>ASRock has:</div><di=
v>Northbridge: AMD RX881/760G; Southbridge: AMD SB710<br></div><div>And Asu=
s has:</div><div>Northbridge:=C2=A0AMD 970; Southbridge:=C2=A0AMD=C2=A0SB95=
0</div><div><br></div><div>Tnx for your help!</div><div><br></div><div><b>O=
ther outputs:</b></div><div>*-core<b><br></b></div><div><div>=C2=A0descript=
ion: Motherboard</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0product: M5A97 LE R2.=
0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor: ASUSTeK COMPUTER INC.</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0version: Rev 1.xx</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0serial: 13=
0207833100091</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0slot: To be filled by O.=
E.M.</div><div>=C2=A0 =C2=A0 =C2=A0*-firmware</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 description: BIOS</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vendor: American Megatrends Inc.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vers=
ion: 1503</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date: 01/11/2013</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size: 64KiB</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 capacity: 8128KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 capabilities: pci upgrade shadowing cdboot bootselect sockete=
drom edd int13floppy1200 int13floppy720 int13floppy2880 int5printscreen int=
9keyboard int14serial=C2=A0</div><div>int17printer acpi usb biosbootspecifi=
cation uefi</div><div><div>*-pci:0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 description: Host bridge</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 product: RD890 PCI to PCI bridge (external gfx0 port B)</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor: Advanced Micro Devices, Inc. [AMD/A=
TI]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical id: 100</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus info: pci@0000:00:00.0</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 02</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 width: 32 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clock: 33MHz</div></div><div><br></div><div>---------------------------=
-------------------------------------------------------</div><div><br></div=
><div><div>*-core</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0description: Motherb=
oard</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0product: 980DE3/U3S3</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor: ASRock</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0serial: E80-46037=
902134</div><div>=C2=A0 =C2=A0 =C2=A0*-firmware</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 description: BIOS</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vendor: American Megatrends Inc.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vers=
ion: P1.60</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date: 05/06/2014</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size: 64KiB</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 capacity: 1984KiB</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 capabilities: pci upgrade shadowing cdboot bootselect sockete=
drom edd int13floppy1200 int13floppy720 int13floppy2880 int5printscreen int=
9keyboard int14serial=C2=A0</div><div>int17printer int10video acpi usb ls12=
0boot zipboot biosbootspecification netboot</div></div><div><div>=C2=A0*-pc=
i:0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: Host bridge</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 product: RS880 Host Bridge</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor: Advanced Micro Devices, In=
c. [AMD]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical id: 100</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus info: pci@0000:00:00.0</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 00</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 width: 32 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 clock: 66MHz</div></div><div><br></div><div><div><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><br></div></div></di=
v></div></div></div></div></div></div></div></div></div></div></div></div>
</div></div>
</div><br></div>
<br></div></div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div>
</blockquote></div><br></div></div>
</blockquote></div><br></div></div>
</blockquote></div><br></div></div>

--001a1135fbdec41199051846dc9e--

--001a1135fbdec411a0051846dca0
Content-Type: application/zip; name="dmesg.txt.zip"
Content-Disposition: attachment; filename="dmesg.txt.zip"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iasuq1yk0

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
--001a1135fbdec411a0051846dca0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--001a1135fbdec411a0051846dca0--
