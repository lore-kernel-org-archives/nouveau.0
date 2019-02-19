From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109681] Nvidia GT710 => nouveau + wayland + swayWM
 => crash when use acceleration (open Firefox)
Date: Tue, 19 Feb 2019 22:52:19 +0000
Message-ID: <bug-109681-8800-x0cOsFepeh@http.bugs.freedesktop.org/>
References: <bug-109681-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771473581=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109681-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1771473581==
Content-Type: multipart/alternative; boundary="15506167390.58cF1.23867"
Content-Transfer-Encoding: 7bit


--15506167390.58cF1.23867
Date: Tue, 19 Feb 2019 22:52:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109681

--- Comment #1 from nolik03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <nolik03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
full dmesg logs (for archiving):=20
[    0.000000] Linux version 4.20.8-arch1-1-ARCH (builduser@heftig-16404) (=
gcc
version 8.2.1 20181127 (GCC)) #1 SMP PREEMPT Wed Feb 13 00:06:58 UTC 2019
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3De1f39821-3d89-4694-a3a5-53aa73b0fc4f rw quiet
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point
registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes,
using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d3ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d400-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d00000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x00000000da7e9fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000da7ea000-0x00000000da971fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000da972000-0x00000000da990fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000da991000-0x00000000daa98fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000daa99000-0x00000000dae53fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000dae54000-0x00000000dbe73fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dbe74000-0x00000000ddffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000de000000-0x00000000dfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fdf00000-0x00000000fdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000081f37ffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: System manufacturer System Product Name/PRIME A320M-A, =
BIOS
0902 09/08/2017
[    0.000000] tsc: Fast TSC calibration failed
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] last_pfn =3D 0x81f380 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF write-through
[    0.000000]   C0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000000 mask FFFF80000000 write-back
[    0.000000]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.000000]   2 base 0000C0000000 mask FFFFE0000000 write-back
[    0.000000]   3 base 0000DE000000 mask FFFFFE000000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] TOM2: 0000000820000000 aka 33280M
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
=20=20
[    0.000000] total RAM covered: 3552M
[    0.000000] Found optimal setting for mtrr clean up
[    0.000000]  gran_size: 64K  chunk_size: 1G  num_reg: 3      lose cover =
RAM:
0G
[    0.000000] e820: update [mem 0xde000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.000000] last_pfn =3D 0xde000 max_arch_pfn =3D 0x400000000
[    0.000000] check: Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [(____ptrval____)] 97000 size 24576
[    0.000000] Using GB pages for direct mapping
[    0.000000] BRK [0x4d6e01000, 0x4d6e01fff] PGTABLE
[    0.000000] BRK [0x4d6e02000, 0x4d6e02fff] PGTABLE
[    0.000000] BRK [0x4d6e03000, 0x4d6e03fff] PGTABLE
[    0.000000] BRK [0x4d6e04000, 0x4d6e04fff] PGTABLE
[    0.000000] BRK [0x4d6e05000, 0x4d6e05fff] PGTABLE
[    0.000000] BRK [0x4d6e06000, 0x4d6e06fff] PGTABLE
[    0.000000] BRK [0x4d6e07000, 0x4d6e07fff] PGTABLE
[    0.000000] BRK [0x4d6e08000, 0x4d6e08fff] PGTABLE
[    0.000000] BRK [0x4d6e09000, 0x4d6e09fff] PGTABLE
[    0.000000] BRK [0x4d6e0a000, 0x4d6e0afff] PGTABLE
[    0.000000] BRK [0x4d6e0b000, 0x4d6e0bfff] PGTABLE
[    0.000000] BRK [0x4d6e0c000, 0x4d6e0cfff] PGTABLE
[    0.000000] RAMDISK: [mem 0x36e49000-0x3771bfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F05B0 000024 (v02 ALASKA)
[    0.000000] ACPI: XSDT 0x00000000DA979098 0000AC (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: FACP 0x00000000DA9811E8 000114 (v06 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock=
 has
valid Length but zero Address: 0x0000000000000000/0x1 (20181003/tbfadt-624)
[    0.000000] ACPI: DSDT 0x00000000DA9791D0 008017 (v02 ALASKA A M I=20=20=
=20
01072009 INTL 20120913)
[    0.000000] ACPI: FACS 0x00000000DAE51C80 000040
[    0.000000] ACPI: APIC 0x00000000DA981300 0000DE (v03 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: FPDT 0x00000000DA9813E0 000044 (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: MSDM 0x00000000DA981428 000055 (v01 ALASKA A M I=20=20=
=20
01072009      00000000)
[    0.000000] ACPI: SSDT 0x00000000DA981480 008C4C (v02 AMD    AMD ALIB
00000002 MSFT 04000000)
[    0.000000] ACPI: FIDT 0x00000000DA98A0D0 00009C (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: SSDT 0x00000000DA98A170 0018B4 (v01 AMD    AMD CPU=20
00000001 AMD  00000001)
[    0.000000] ACPI: CRAT 0x00000000DA98BA28 000BD0 (v01 AMD    AMD CRAT
00000001 AMD  00000001)
[    0.000000] ACPI: CDIT 0x00000000DA98C5F8 000029 (v01 AMD    AMD CDIT
00000001 AMD  00000001)
[    0.000000] ACPI: SSDT 0x00000000DA98C628 0017FF (v01 AMD    AMD AOD=20
00000001 INTL 20120913)
[    0.000000] ACPI: MCFG 0x00000000DA98DE28 00003C (v01 ALASKA A M I=20=20=
=20
01072009 MSFT 00010013)
[    0.000000] ACPI: HPET 0x00000000DA98DE68 000038 (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00000005)
[    0.000000] ACPI: SSDT 0x00000000DA98DEA0 000024 (v01 AMDFCH FCHZP=20=20=
=20
00001000 INTL 20120913)
[    0.000000] ACPI: UEFI 0x00000000DA98DEC8 000042 (v01=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
00000000      00000000)
[    0.000000] ACPI: IVRS 0x00000000DA98DF10 0000D0 (v02 AMD    AMD IVRS
00000001 AMD  00000000)
[    0.000000] ACPI: SSDT 0x00000000DA98DFE0 0000F8 (v01 AMD    AMD PT=20=20
00001000 INTL 20120913)
[    0.000000] ACPI: SSDT 0x00000000DA98E0D8 001664 (v01 AMD    CPMCMN=20=20
00000001 INTL 20120913)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] system APIC only can use physical flat
[    0.000000] Setting APIC routing to physical flat.
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000081f37ffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x81f37c000-0x81f37ffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000081f37ffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009cfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000009cfffff]
[    0.000000]   node   0: [mem 0x000000000a000000-0x00000000da7e9fff]
[    0.000000]   node   0: [mem 0x00000000da991000-0x00000000daa98fff]
[    0.000000]   node   0: [mem 0x00000000dbe74000-0x00000000ddffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000081f37ffff]
[    0.000000] Zeroed struct page in unavailable ranges: 14566 pages
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000081f37f=
fff]
[    0.000000] On node 0 totalpages: 8370842
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 14046 pages used for memmap
[    0.000000]   DMA32 zone: 898942 pages, LIFO batch:63
[    0.000000]   Normal zone: 116686 pages used for memmap
[    0.000000]   Normal zone: 7467904 pages, LIFO batch:63
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] system APIC only can use physical flat
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 13, version 33, address 0xfec00000, GSI 0=
-23
[    0.000000] IOAPIC[1]: apic_id 14, version 33, address 0xfec01000, GSI 2=
4-55
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.000000] smpboot: Allowing 16 CPUs, 4 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x09d00000-0x09ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xda7ea000-0xda971fff]
[    0.000000] PM: Registered nosave memory: [mem 0xda972000-0xda990fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdaa99000-0xdae53fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdae54000-0xdbe73fff]
[    0.000000] PM: Registered nosave memory: [mem 0xde000000-0xdfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xf7ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfc000000-0xfdefffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfdf00000-0xfdffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe000000-0xfe9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedd6000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] [mem 0xe0000000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.000000] random: get_random_bytes called from start_kernel+0x95/0x548
with crng_init=3D0
[    0.000000] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:16
nr_node_ids:1
[    0.000000] percpu: Embedded 45 pages/cpu @(____ptrval____) s147456 r8192
d28672 u262144
[    0.000000] pcpu-alloc: s147456 r8192 d28672 u262144 alloc=3D1*2097152
[    0.000000] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 1=
3 14
15=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 82400=
25
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3De1f39821-3d89-4694-a3a5-53aa73b0fc4f rw quiet
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 32851792K/33483368K available (12293K kernel code, 1=
268K
rwdata, 3688K rodata, 1536K init, 3936K bss, 631576K reserved, 0K cma-reser=
ved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, =
Nodes=3D1
[    0.000000] ftrace: allocating 35811 entries in 140 pages
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     CONFIG_RCU_FANOUT set to non-default value of 32.
[    0.000000] rcu:     RCU dyntick-idle grace-period acceleration is enabl=
ed.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_i=
ds=3D16.
[    0.000000] rcu:     RCU priority boosting: priority 1 delay 500 ms.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30
jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D16
[    0.000000] NR_IRQS: 20736, nr_irqs: 1096, preallocated irqs: 16
[    0.000000] rcu:     Offload RCU callbacks from CPUs: (none).
[    0.000000] spurious 8259A interrupt: IRQ7.
[    0.000000] Console: colour dummy device 80x25
[    0.000000] printk: console [tty0] enabled
[    0.000000] ACPI: Core revision 20181003
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 133484873504 ns
[    0.000000] hpet clockevent registered
[    0.000000] APIC: Switch to symmetric I/O mode setup
[    0.003333] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.026666] tsc: PIT calibration matches HPET. 2 loops
[    0.026666] tsc: Detected 3193.621 MHz processor
[    0.000006] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:
0x2e08c04ce27, max_idle_ns: 440795324432 ns
[    0.000012] Calibrating delay loop (skipped), value calculated using tim=
er
frequency.. 6389.37 BogoMIPS (lpj=3D10645403)
[    0.000013] pid_max: default: 32768 minimum: 301
[    0.000053] LSM: Security Framework initializing
[    0.000054] Yama: becoming mindful.
[    0.000057] AppArmor: AppArmor disabled by boot time parameter
[    0.004628] Dentry cache hash table entries: 4194304 (order: 13, 33554432
bytes)
[    0.006693] Inode-cache hash table entries: 2097152 (order: 12, 16777216
bytes)
[    0.006777] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s)
[    0.006850] Mountpoint-cache hash table entries: 65536 (order: 7, 524288
bytes)
[    0.007061] mce: CPU supports 23 MCE banks
[    0.007079] LVT offset 1 assigned for vector 0xf9
[    0.007198] LVT offset 2 assigned for vector 0xf4
[    0.007209] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.007210] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.007211] Spectre V2 : Mitigation: Full AMD retpoline
[    0.007212] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on
context switch
[    0.007213] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss
disabled via prctl and seccomp
[    0.007381] Freeing SMP alternatives memory: 28K
[    0.013341] smpboot: CPU0: AMD Ryzen 5 1600 Six-Core Processor (family:
0x17, model: 0x1, stepping: 0x1)
[    0.030031] Performance Events: Fam17h core perfctr, AMD PMU driver.
[    0.030036] ... version:                0
[    0.030037] ... bit width:              48
[    0.030037] ... generic registers:      6
[    0.030038] ... value mask:             0000ffffffffffff
[    0.030039] ... max period:             00007fffffffffff
[    0.030039] ... fixed-purpose events:   0
[    0.030039] ... event mask:             000000000000003f
[    0.036689] rcu: Hierarchical SRCU implementation.
[    0.060024] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.066690] smp: Bringing up secondary CPUs ...
[    0.106708] x86: Booting SMP configuration:
[    0.106710] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  =
#9
#10 #11
[    0.508882] smp: Brought up 1 node, 12 CPUs
[    0.508882] smpboot: Max logical packages: 2
[    0.508882] smpboot: Total of 12 processors activated (76677.52 BogoMIPS)
[    0.510684] devtmpfs: initialized
[    0.510684] x86/mm: Memory block size: 128MB
[    0.511694] PM: Registering ACPI NVS region [mem 0xdaa99000-0xdae53fff]
(3911680 bytes)
[    0.511694] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f,
max_idle_ns: 6370867519511994 ns
[    0.511694] futex hash table entries: 4096 (order: 6, 262144 bytes)
[    0.511694] pinctrl core: initialized pinctrl subsystem
[    0.511694] RTC time: 11:40:31, date: 02/18/19
[    0.511694] NET: Registered protocol family 16
[    0.511694] audit: initializing netlink subsys (disabled)
[    0.511694] audit: type=3D2000 audit(1550490030.536:1): state=3Dinitiali=
zed
audit_enabled=3D0 res=3D1
[    0.513349] cpuidle: using governor ladder
[    0.513353] cpuidle: using governor menu
[    0.513368] ACPI: bus type PCI registered
[    0.513370] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.513428] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.513431] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.513436] pmd_set_huge: Cannot satisfy [mem 0xf8000000-0xf8200000] wit=
h a
huge-page mapping due to MTRR override.
[    0.513500] PCI: Using configuration type 1 for base access
[    0.514588] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.514588] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.514588] ACPI: Added _OSI(Module Device)
[    0.514588] ACPI: Added _OSI(Processor Device)
[    0.514588] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.514588] ACPI: Added _OSI(Processor Aggregator Device)
[    0.514588] ACPI: Added _OSI(Linux-Dell-Video)
[    0.514588] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.517450] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.524172] ACPI: 7 ACPI AML tables successfully acquired and loaded
[    0.529141] ACPI: Interpreter enabled
[    0.529154] ACPI: (supports S0 S3 S4 S5)
[    0.529155] ACPI: Using IOAPIC for interrupt routing
[    0.529291] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=3Dnocrs" and report a bug
[    0.529533] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.537333] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.537337] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM
Segments MSI]
[    0.537520] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug
SHPCHotplug PME LTR]
[    0.537692] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
[    0.537702] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus
00-3f] only partially covers this bridge
[    0.538032] PCI host bridge to bus 0000:00
[    0.538034] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.538035] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.538036] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.538037] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.538039] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff
window]
[    0.538040] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff
window]
[    0.538041] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xf7ffffff
window]
[    0.538042] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.538048] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
[    0.538142] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
[    0.538250] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
[    0.538332] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
[    0.538382] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.538463] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
[    0.538544] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
[    0.538612] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
[    0.538676] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.538769] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
[    0.538854] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
[    0.538919] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
[    0.538938] pci 0000:00:07.1: enabling Extended Tags
[    0.538959] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.539032] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
[    0.539099] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
[    0.539118] pci 0000:00:08.1: enabling Extended Tags
[    0.539141] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.539250] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    0.539466] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    0.539687] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
[    0.539742] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
[    0.539798] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
[    0.539853] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
[    0.539907] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
[    0.539965] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
[    0.540024] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
[    0.540079] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
[    0.540194] pci 0000:03:00.0: [1022:43bc] type 00 class 0x0c0330
[    0.540216] pci 0000:03:00.0: reg 0x10: [mem 0xf76a0000-0xf76a7fff 64bit]
[    0.540290] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.540360] pci 0000:03:00.1: [1022:43b8] type 00 class 0x010601
[    0.540404] pci 0000:03:00.1: reg 0x24: [mem 0xf7680000-0xf769ffff]
[    0.540412] pci 0000:03:00.1: reg 0x30: [mem 0xf7600000-0xf767ffff pref]
[    0.540449] pci 0000:03:00.1: PME# supported from D3hot D3cold
[    0.540501] pci 0000:03:00.2: [1022:43b3] type 01 class 0x060400
[    0.540572] pci 0000:03:00.2: PME# supported from D3hot D3cold
[    0.540656] pci 0000:00:01.3: PCI bridge to [bus 03-25]
[    0.540659] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
[    0.540661] pci 0000:00:01.3:   bridge window [mem 0xf7500000-0xf76fffff]
[    0.540726] pci 0000:1d:04.0: [1022:43b4] type 01 class 0x060400
[    0.540811] pci 0000:1d:04.0: PME# supported from D3hot D3cold
[    0.540882] pci 0000:1d:05.0: [1022:43b4] type 01 class 0x060400
[    0.540965] pci 0000:1d:05.0: PME# supported from D3hot D3cold
[    0.541029] pci 0000:1d:06.0: [1022:43b4] type 01 class 0x060400
[    0.541114] pci 0000:1d:06.0: PME# supported from D3hot D3cold
[    0.541185] pci 0000:1d:07.0: [1022:43b4] type 01 class 0x060400
[    0.541270] pci 0000:1d:07.0: PME# supported from D3hot D3cold
[    0.541352] pci 0000:03:00.2: PCI bridge to [bus 1d-25]
[    0.541356] pci 0000:03:00.2:   bridge window [io  0xf000-0xffff]
[    0.541359] pci 0000:03:00.2:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.541403] pci 0000:1d:04.0: PCI bridge to [bus 22]
[    0.541444] pci 0000:1d:05.0: PCI bridge to [bus 23]
[    0.541509] pci 0000:24:00.0: [10ec:8168] type 00 class 0x020000
[    0.541550] pci 0000:24:00.0: reg 0x10: [io  0xf000-0xf0ff]
[    0.541585] pci 0000:24:00.0: reg 0x18: [mem 0xf7504000-0xf7504fff 64bit]
[    0.541607] pci 0000:24:00.0: reg 0x20: [mem 0xf7500000-0xf7503fff 64bit]
[    0.541733] pci 0000:24:00.0: supports D1 D2
[    0.541733] pci 0000:24:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541905] pci 0000:1d:06.0: PCI bridge to [bus 24]
[    0.541910] pci 0000:1d:06.0:   bridge window [io  0xf000-0xffff]
[    0.541912] pci 0000:1d:06.0:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.541955] pci 0000:1d:07.0: PCI bridge to [bus 25]
[    0.542035] pci 0000:26:00.0: [10de:128b] type 00 class 0x030000
[    0.542060] pci 0000:26:00.0: reg 0x10: [mem 0xf6000000-0xf6ffffff]
[    0.542073] pci 0000:26:00.0: reg 0x14: [mem 0xe8000000-0xefffffff 64bit
pref]
[    0.542086] pci 0000:26:00.0: reg 0x1c: [mem 0xf0000000-0xf1ffffff 64bit
pref]
[    0.542094] pci 0000:26:00.0: reg 0x24: [io  0xe000-0xe07f]
[    0.542103] pci 0000:26:00.0: reg 0x30: [mem 0xf7000000-0xf707ffff pref]
[    0.542199] pci 0000:26:00.0: 16.000 Gb/s available PCIe bandwidth, limi=
ted
by 2.5 GT/s x8 link at 0000:00:03.1 (capable of 63.008 Gb/s with 8 GT/s x8
link)
[    0.542240] pci 0000:26:00.1: [10de:0e0f] type 00 class 0x040300
[    0.542260] pci 0000:26:00.1: reg 0x10: [mem 0xf7080000-0xf7083fff]
[    0.542416] pci 0000:00:03.1: ASPM: current common clock configuration is
broken, reconfiguring
[    0.553388] pci 0000:00:03.1: PCI bridge to [bus 26]
[    0.553394] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.553397] pci 0000:00:03.1:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.553401] pci 0000:00:03.1:   bridge window [mem 0xe8000000-0xf1ffffff
64bit pref]
[    0.553485] pci 0000:27:00.0: [1022:145a] type 00 class 0x130000
[    0.553521] pci 0000:27:00.0: enabling Extended Tags
[    0.553607] pci 0000:27:00.2: [1022:1456] type 00 class 0x108000
[    0.553624] pci 0000:27:00.2: reg 0x18: [mem 0xf7300000-0xf73fffff]
[    0.553636] pci 0000:27:00.2: reg 0x24: [mem 0xf7400000-0xf7401fff]
[    0.553643] pci 0000:27:00.2: enabling Extended Tags
[    0.553717] pci 0000:27:00.3: [1022:145c] type 00 class 0x0c0330
[    0.553729] pci 0000:27:00.3: reg 0x10: [mem 0xf7200000-0xf72fffff 64bit]
[    0.553749] pci 0000:27:00.3: enabling Extended Tags
[    0.553774] pci 0000:27:00.3: PME# supported from D0 D3hot D3cold
[    0.553834] pci 0000:00:07.1: PCI bridge to [bus 27]
[    0.553838] pci 0000:00:07.1:   bridge window [mem 0xf7200000-0xf74fffff]
[    0.553891] pci 0000:28:00.0: [1022:1455] type 00 class 0x130000
[    0.553925] pci 0000:28:00.0: enabling Extended Tags
[    0.553989] pci 0000:28:00.2: [1022:7901] type 00 class 0x010601
[    0.554016] pci 0000:28:00.2: reg 0x24: [mem 0xf7708000-0xf7708fff]
[    0.554024] pci 0000:28:00.2: enabling Extended Tags
[    0.554050] pci 0000:28:00.2: PME# supported from D3hot D3cold
[    0.554095] pci 0000:28:00.3: [1022:1457] type 00 class 0x040300
[    0.554105] pci 0000:28:00.3: reg 0x10: [mem 0xf7700000-0xf7707fff]
[    0.554130] pci 0000:28:00.3: enabling Extended Tags
[    0.554155] pci 0000:28:00.3: PME# supported from D0 D3hot D3cold
[    0.554206] pci 0000:00:08.1: PCI bridge to [bus 28]
[    0.554209] pci 0000:00:08.1:   bridge window [mem 0xf7700000-0xf77fffff]
[    0.554657] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    0.554723] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    0.554780] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    0.554851] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    0.554914] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    0.554961] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    0.555005] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    0.555049] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    0.556705] pci 0000:26:00.0: vgaarb: setting as boot VGA device
[    0.556705] pci 0000:26:00.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    0.556705] pci 0000:26:00.0: vgaarb: bridge control possible
[    0.556705] vgaarb: loaded
[    0.556812] ACPI: bus type USB registered
[    0.556822] usbcore: registered new interface driver usbfs
[    0.556826] usbcore: registered new interface driver hub
[    0.556858] usbcore: registered new device driver usb
[    0.556873] pps_core: LinuxPPS API ver. 1 registered
[    0.556874] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    0.556876] PTP clock support registered
[    0.556881] EDAC MC: Ver: 3.0.0
[    0.556964] PCI: Using ACPI for IRQ routing
[    0.559199] PCI: pci_cache_line_size set to 64 bytes
[    0.559258] e820: reserve RAM buffer [mem 0x0009d400-0x0009ffff]
[    0.559259] e820: reserve RAM buffer [mem 0x09d00000-0x0bffffff]
[    0.559260] e820: reserve RAM buffer [mem 0xda7ea000-0xdbffffff]
[    0.559260] e820: reserve RAM buffer [mem 0xdaa99000-0xdbffffff]
[    0.559261] e820: reserve RAM buffer [mem 0xde000000-0xdfffffff]
[    0.559261] e820: reserve RAM buffer [mem 0x81f380000-0x81fffffff]
[    0.559333] NetLabel: Initializing
[    0.559334] NetLabel:  domain hash size =3D 128
[    0.559334] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.559346] NetLabel:  unlabeled traffic allowed by default
[    0.560043] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.560045] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.563342] clocksource: Switched to clocksource tsc-early
[    0.572198] VFS: Disk quotas dquot_6.6.0
[    0.572215] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.572267] pnp: PnP ACPI init
[    0.572371] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.572374] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.572441] system 00:01: [mem 0xfeb80000-0xfebfffff] could not be reser=
ved
[    0.572444] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.572545] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.572705] system 00:03: [io  0x0300-0x030f] has been reserved
[    0.572706] system 00:03: [io  0x0230-0x023f] has been reserved
[    0.572708] system 00:03: [io  0x0290-0x029f] has been reserved
[    0.572710] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.572983] pnp 00:04: [dma 0 disabled]
[    0.573022] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.573242] system 00:05: [io  0x04d0-0x04d1] has been reserved
[    0.573244] system 00:05: [io  0x040b] has been reserved
[    0.573245] system 00:05: [io  0x04d6] has been reserved
[    0.573246] system 00:05: [io  0x0c00-0x0c01] has been reserved
[    0.573248] system 00:05: [io  0x0c14] has been reserved
[    0.573250] system 00:05: [io  0x0c50-0x0c51] has been reserved
[    0.573251] system 00:05: [io  0x0c52] has been reserved
[    0.573252] system 00:05: [io  0x0c6c] has been reserved
[    0.573253] system 00:05: [io  0x0c6f] has been reserved
[    0.573254] system 00:05: [io  0x0cd0-0x0cd1] has been reserved
[    0.573255] system 00:05: [io  0x0cd2-0x0cd3] has been reserved
[    0.573256] system 00:05: [io  0x0cd4-0x0cd5] has been reserved
[    0.573257] system 00:05: [io  0x0cd6-0x0cd7] has been reserved
[    0.573258] system 00:05: [io  0x0cd8-0x0cdf] has been reserved
[    0.573259] system 00:05: [io  0x0800-0x089f] has been reserved
[    0.573260] system 00:05: [io  0x0b00-0x0b0f] has been reserved
[    0.573261] system 00:05: [io  0x0b20-0x0b3f] has been reserved
[    0.573262] system 00:05: [io  0x0900-0x090f] has been reserved
[    0.573263] system 00:05: [io  0x0910-0x091f] has been reserved
[    0.573264] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    0.573266] system 00:05: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    0.573267] system 00:05: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.573268] system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.573269] system 00:05: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    0.573270] system 00:05: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.573271] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.573274] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.573649] pnp: PnP ACPI: found 6 devices
[    0.579432] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,
max_idle_ns: 2085701024 ns
[    0.579482] pci 0000:1d:04.0: PCI bridge to [bus 22]
[    0.579491] pci 0000:1d:05.0: PCI bridge to [bus 23]
[    0.579501] pci 0000:1d:06.0: PCI bridge to [bus 24]
[    0.579503] pci 0000:1d:06.0:   bridge window [io  0xf000-0xffff]
[    0.579506] pci 0000:1d:06.0:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.579512] pci 0000:1d:07.0: PCI bridge to [bus 25]
[    0.579522] pci 0000:03:00.2: PCI bridge to [bus 1d-25]
[    0.579523] pci 0000:03:00.2:   bridge window [io  0xf000-0xffff]
[    0.579527] pci 0000:03:00.2:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.579533] pci 0000:00:01.3: PCI bridge to [bus 03-25]
[    0.579534] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
[    0.579536] pci 0000:00:01.3:   bridge window [mem 0xf7500000-0xf76fffff]
[    0.579540] pci 0000:00:03.1: PCI bridge to [bus 26]
[    0.579542] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.579545] pci 0000:00:03.1:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.579547] pci 0000:00:03.1:   bridge window [mem 0xe8000000-0xf1ffffff
64bit pref]
[    0.579550] pci 0000:00:07.1: PCI bridge to [bus 27]
[    0.579553] pci 0000:00:07.1:   bridge window [mem 0xf7200000-0xf74fffff]
[    0.579556] pci 0000:00:08.1: PCI bridge to [bus 28]
[    0.579558] pci 0000:00:08.1:   bridge window [mem 0xf7700000-0xf77fffff]
[    0.579563] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.579564] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.579565] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.579566] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    0.579567] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff windo=
w]
[    0.579568] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff windo=
w]
[    0.579569] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xf7ffffff wind=
ow]
[    0.579570] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
[    0.579571] pci_bus 0000:03: resource 1 [mem 0xf7500000-0xf76fffff]
[    0.579572] pci_bus 0000:1d: resource 0 [io  0xf000-0xffff]
[    0.579573] pci_bus 0000:1d: resource 1 [mem 0xf7500000-0xf75fffff]
[    0.579574] pci_bus 0000:24: resource 0 [io  0xf000-0xffff]
[    0.579575] pci_bus 0000:24: resource 1 [mem 0xf7500000-0xf75fffff]
[    0.579576] pci_bus 0000:26: resource 0 [io  0xe000-0xefff]
[    0.579577] pci_bus 0000:26: resource 1 [mem 0xf6000000-0xf70fffff]
[    0.579578] pci_bus 0000:26: resource 2 [mem 0xe8000000-0xf1ffffff 64bit
pref]
[    0.579579] pci_bus 0000:27: resource 1 [mem 0xf7200000-0xf74fffff]
[    0.579580] pci_bus 0000:28: resource 1 [mem 0xf7700000-0xf77fffff]
[    0.579658] NET: Registered protocol family 2
[    0.579797] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6,
262144 bytes)
[    0.579870] TCP established hash table entries: 262144 (order: 9, 2097152
bytes)
[    0.580151] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.580268] TCP: Hash tables configured (established 262144 bind 65536)
[    0.580311] UDP hash table entries: 16384 (order: 7, 524288 bytes)
[    0.580385] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes)
[    0.580486] NET: Registered protocol family 1
[    0.580490] NET: Registered protocol family 44
[    0.580637] pci 0000:26:00.0: Video device with shadowed ROM at [mem
0x000c0000-0x000dffff]
[    0.580649] pci 0000:26:00.1: Linked as a consumer to 0000:26:00.0
[    0.580805] PCI: CLS 64 bytes, default 64
[    0.580836] Unpacking initramfs...
[    0.681150] Freeing initrd memory: 9036K
[    0.681168] AMD-Vi: IOMMU performance counters supported
[    0.681269] pci 0000:00:00.2: can't derive routing for PCI INT A
[    0.681270] pci 0000:00:00.2: PCI INT A: not connected
[    0.681501] iommu: Adding device 0000:00:01.0 to group 0
[    0.681601] iommu: Adding device 0000:00:01.3 to group 1
[    0.681708] iommu: Adding device 0000:00:02.0 to group 2
[    0.681805] iommu: Adding device 0000:00:03.0 to group 3
[    0.681897] iommu: Adding device 0000:00:03.1 to group 4
[    0.681998] iommu: Adding device 0000:00:04.0 to group 5
[    0.682091] iommu: Adding device 0000:00:07.0 to group 6
[    0.682105] iommu: Adding device 0000:00:07.1 to group 6
[    0.682208] iommu: Adding device 0000:00:08.0 to group 7
[    0.682222] iommu: Adding device 0000:00:08.1 to group 7
[    0.682316] iommu: Adding device 0000:00:14.0 to group 8
[    0.682329] iommu: Adding device 0000:00:14.3 to group 8
[    0.682456] iommu: Adding device 0000:00:18.0 to group 9
[    0.682469] iommu: Adding device 0000:00:18.1 to group 9
[    0.682481] iommu: Adding device 0000:00:18.2 to group 9
[    0.682495] iommu: Adding device 0000:00:18.3 to group 9
[    0.682507] iommu: Adding device 0000:00:18.4 to group 9
[    0.682519] iommu: Adding device 0000:00:18.5 to group 9
[    0.682532] iommu: Adding device 0000:00:18.6 to group 9
[    0.682545] iommu: Adding device 0000:00:18.7 to group 9
[    0.682653] iommu: Adding device 0000:03:00.0 to group 10
[    0.682673] iommu: Adding device 0000:03:00.1 to group 10
[    0.682694] iommu: Adding device 0000:03:00.2 to group 10
[    0.682708] iommu: Adding device 0000:1d:04.0 to group 10
[    0.682719] iommu: Adding device 0000:1d:05.0 to group 10
[    0.682731] iommu: Adding device 0000:1d:06.0 to group 10
[    0.682743] iommu: Adding device 0000:1d:07.0 to group 10
[    0.682763] iommu: Adding device 0000:24:00.0 to group 10
[    0.682881] iommu: Adding device 0000:26:00.0 to group 11
[    0.682905] iommu: Adding device 0000:26:00.1 to group 11
[    0.682915] iommu: Adding device 0000:27:00.0 to group 6
[    0.682924] iommu: Adding device 0000:27:00.2 to group 6
[    0.682934] iommu: Adding device 0000:27:00.3 to group 6
[    0.682944] iommu: Adding device 0000:28:00.0 to group 7
[    0.682954] iommu: Adding device 0000:28:00.2 to group 7
[    0.682963] iommu: Adding device 0000:28:00.3 to group 7
[    0.683188] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
[    0.683189] AMD-Vi: Extended features (0xf77ef22294ada):
[    0.683190]  PPR NX GT IA GA PC GA_vAPIC
[    0.683192] AMD-Vi: Interrupt remapping enabled
[    0.683192] AMD-Vi: virtual APIC enabled
[    0.683426] AMD-Vi: Lazy IO/TLB flushing enabled
[    0.684323] amd_uncore: AMD NB counters detected
[    0.684326] amd_uncore: AMD LLC counters detected
[    0.684571] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4
counters/bank).
[    0.684615] check: Scanning for low memory corruption every 60 seconds
[    0.685150] Initialise system trusted keyrings
[    0.685163] Key type blacklist registered
[    0.685200] workingset: timestamp_bits=3D41 max_order=3D23 bucket_order=
=3D0
[    0.686164] zbud: loaded
[    0.721650] Key type asymmetric registered
[    0.721652] Asymmetric key parser 'x509' registered
[    0.721662] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor
244)
[    0.721712] io scheduler noop registered
[    0.721713] io scheduler deadline registered
[    0.721742] io scheduler cfq registered (default)
[    0.721743] io scheduler mq-deadline registered
[    0.721744] io scheduler kyber registered
[    0.721777] io scheduler bfq registered
[    0.722069] aer 0000:00:01.3:pcie002: AER enabled with IRQ 26
[    0.722185] aer 0000:00:03.1:pcie002: AER enabled with IRQ 27
[    0.722916] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.722965] vesafb: mode is 1920x1080x32, linelength=3D7680, pages=3D0
[    0.722965] vesafb: scrolling: redraw
[    0.722966] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.722982] vesafb: framebuffer at 0xf1000000, mapped to 0x0000000083236=
fa5,
using 8128k, total 8128k
[    0.723097] fbcon: Deferring console take-over
[    0.723098] fb0: VESA VGA frame buffer device
[    0.723161] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.723168] ACPI: Power Button [PWRB]
[    0.723202] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.723211] ACPI: Power Button [PWRF]
[    0.724270] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.745330] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a
16550A
[    0.746617] usbcore: registered new interface driver usbserial_generic
[    0.746621] usbserial: USB Serial support registered for generic
[    0.746648] rtc_cmos 00:02: RTC can wake from S4
[    0.746897] rtc_cmos 00:02: registered as rtc0
[    0.746908] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram,
hpet irqs
[    0.747057] ledtrig-cpu: registered to indicate activity on CPUs
[    0.747260] NET: Registered protocol family 10
[    0.753363] Segment Routing with IPv6
[    0.753377] NET: Registered protocol family 17
[    0.754069] RAS: Correctable Errors collector initialized.
[    0.754090] microcode: CPU0: patch_level=3D0x08001129
[    0.754095] microcode: CPU1: patch_level=3D0x08001129
[    0.754100] microcode: CPU2: patch_level=3D0x08001129
[    0.754105] microcode: CPU3: patch_level=3D0x08001129
[    0.754110] microcode: CPU4: patch_level=3D0x08001129
[    0.754115] microcode: CPU5: patch_level=3D0x08001129
[    0.754121] microcode: CPU6: patch_level=3D0x08001129
[    0.754128] microcode: CPU7: patch_level=3D0x08001129
[    0.754134] microcode: CPU8: patch_level=3D0x08001129
[    0.754141] microcode: CPU9: patch_level=3D0x08001129
[    0.754148] microcode: CPU10: patch_level=3D0x08001129
[    0.754154] microcode: CPU11: patch_level=3D0x08001129
[    0.754181] microcode: Microcode Update Driver: v2.2.
[    0.754190] sched_clock: Marking stable (780836210, -26658860)->(8780714=
71,
-123894121)
[    0.754522] registered taskstats version 1
[    0.754528] Loading compiled-in X.509 certificates
[    0.756707] Loaded X.509 cert 'Build time autogenerated kernel key:
0138fd63a261ba6db3be5b3e8299ee4407c2944b'
[    0.756725] zswap: loaded using pool lzo/zbud
[    0.762118] Key type big_key registered
[    0.762392]   Magic number: 7:625:681
[    0.762543] rtc_cmos 00:02: setting system clock to 2019-02-18 11:40:31 =
UTC
(1550490031)
[    0.763557] Freeing unused decrypted memory: 2040K
[    0.763822] Freeing unused kernel image memory: 1536K
[    0.795505] Write protecting the kernel read-only data: 18432k
[    0.796055] Freeing unused kernel image memory: 2016K
[    0.796128] Freeing unused kernel image memory: 408K
[    0.803842] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.803846] Run /init as init process
[    0.818013] fbcon: Taking over console
[    0.818073] Console: switching to colour frame buffer device 240x67
[    0.902160] SCSI subsystem initialized
[    0.904844] QUIRK: Enable AMD PLL fix
[    0.904862] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.904867] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus
number 1
[    0.908280] libata version 3.00 loaded.
[    0.910590] ahci 0000:03:00.1: version 3.0
[    0.910711] ahci 0000:03:00.1: SSS flag set, parallel bus scan disabled
[    0.910746] ahci 0000:03:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
33
impl SATA mode
[    0.910748] ahci 0000:03:00.1: flags: 64bit ncq sntf stag pm led clo only
pmp pio slum part sxs deso sadm sds apst=20
[    0.911339] scsi host0: ahci
[    0.911950] scsi host1: ahci
[    0.912071] scsi host2: ahci
[    0.912199] scsi host3: ahci
[    0.912315] scsi host4: ahci
[    0.916730] scsi host5: ahci
[    0.916856] scsi host6: ahci
[    0.917992] scsi host7: ahci
[    0.918048] ata1: SATA max UDMA/133 abar m131072@0xf7680000 port 0xf7680=
100
irq 38
[    0.918050] ata2: SATA max UDMA/133 abar m131072@0xf7680000 port 0xf7680=
180
irq 38
[    0.918051] ata3: DUMMY
[    0.918052] ata4: DUMMY
[    0.918054] ata5: SATA max UDMA/133 abar m131072@0xf7680000 port 0xf7680=
300
irq 38
[    0.918055] ata6: SATA max UDMA/133 abar m131072@0xf7680000 port 0xf7680=
380
irq 38
[    0.918056] ata7: DUMMY
[    0.918057] ata8: DUMMY
[    0.918231] ahci 0000:28:00.2: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1
impl SATA mode
[    0.918233] ahci 0000:28:00.2: flags: 64bit ncq sntf ilck pm led clo only
pmp fbs pio slum part=20
[    0.918394] scsi host8: ahci
[    0.918450] ata9: SATA max UDMA/133 abar m4096@0xf7708000 port 0xf7708100
irq 40
[    0.960230] xhci_hcd 0000:03:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000008000418
[    0.960393] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 4.20
[    0.960395] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.960396] usb usb1: Product: xHCI Host Controller
[    0.960397] usb usb1: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.960398] usb usb1: SerialNumber: 0000:03:00.0
[    0.960500] hub 1-0:1.0: USB hub found
[    0.960511] hub 1-0:1.0: 9 ports detected
[    0.965688] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.965691] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus
number 2
[    0.965693] xhci_hcd 0000:03:00.0: Host supports USB 3.10 Enhanced
SuperSpeed
[    0.965716] usb usb2: We don't know the algorithms for LPM for this host,
disabling LPM.
[    0.965731] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 4.20
[    0.965733] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.965733] usb usb2: Product: xHCI Host Controller
[    0.965734] usb usb2: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.965735] usb usb2: SerialNumber: 0000:03:00.0
[    0.965805] hub 2-0:1.0: USB hub found
[    0.965811] hub 2-0:1.0: 3 ports detected
[    0.967666] xhci_hcd 0000:27:00.3: xHCI Host Controller
[    0.967669] xhci_hcd 0000:27:00.3: new USB bus registered, assigned bus
number 3
[    0.967764] xhci_hcd 0000:27:00.3: hcc params 0x0270f665 hci version 0x1=
00
quirks 0x0000000000000418
[    0.967866] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 4.20
[    0.967868] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.967868] usb usb3: Product: xHCI Host Controller
[    0.967869] usb usb3: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.967870] usb usb3: SerialNumber: 0000:27:00.3
[    0.967936] hub 3-0:1.0: USB hub found
[    0.967942] hub 3-0:1.0: 4 ports detected
[    0.968064] xhci_hcd 0000:27:00.3: xHCI Host Controller
[    0.968065] xhci_hcd 0000:27:00.3: new USB bus registered, assigned bus
number 4
[    0.968067] xhci_hcd 0000:27:00.3: Host supports USB 3.0  SuperSpeed
[    0.968077] usb usb4: We don't know the algorithms for LPM for this host,
disabling LPM.
[    0.968091] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 4.20
[    0.968092] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.968093] usb usb4: Product: xHCI Host Controller
[    0.968093] usb usb4: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.968094] usb usb4: SerialNumber: 0000:27:00.3
[    0.968153] hub 4-0:1.0: USB hub found
[    0.968159] hub 4-0:1.0: 4 ports detected
[    1.210796] ata9: SATA link down (SStatus 0 SControl 300)
[    1.273776] usb 1-9: new low-speed USB device number 2 using xhci_hcd
[    1.280430] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[    1.370272] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.370605] ata1.00: supports DRM functions and may not be fully accessi=
ble
[    1.372497] ata1.00: ATA-11: Samsung SSD 860 EVO 500GB, RVT01B6Q, max
UDMA/133
[    1.372499] ata1.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    1.374841] ata1.00: supports DRM functions and may not be fully accessi=
ble
[    1.377601] ata1.00: configured for UDMA/133
[    1.377910] scsi 0:0:0:0: Direct-Access     ATA      Samsung SSD 860  1B=
6Q
PQ: 0 ANSI: 5
[    1.529152] usb 1-9: New USB device found, idVendor=3D046d, idProduct=3D=
c31c,
bcdDevice=3D64.00
[    1.529154] usb 1-9: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    1.529155] usb 1-9: Product: USB Keyboard
[    1.529157] usb 1-9: Manufacturer: Logitech
[    1.558533] hidraw: raw HID events driver (C) Jiri Kosina
[    1.596459] usbcore: registered new interface driver usbhid
[    1.596460] usbhid: USB HID core driver
[    1.598362] input: Logitech USB Keyboard as
/devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-9/1-9:1.0/0003:046D:C3=
1C.0001/input/input2
[    1.643341] usb 3-2: New USB device found, idVendor=3D046d, idProduct=3D=
0825,
bcdDevice=3D 0.12
[    1.643352] usb 3-2: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D2
[    1.643354] usb 3-2: SerialNumber: DDAFE0A0
[    1.654001] hid-generic 0003:046D:C31C.0001: input,hidraw0: USB HID v1.10
Keyboard [Logitech USB Keyboard] on usb-0000:03:00.0-9/input0
[    1.654189] input: Logitech USB Keyboard Consumer Control as
/devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-9/1-9:1.1/0003:046D:C3=
1C.0002/input/input3
[    1.691833] ata2: SATA link down (SStatus 0 SControl 300)
[    1.703762] tsc: Refined TSC clocksource calibration: 3193.998 MHz
[    1.703774] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x2e0a244aeba, max_idle_ns: 440795290469 ns
[    1.703820] clocksource: Switched to clocksource tsc
[    1.710486] input: Logitech USB Keyboard System Control as
/devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-9/1-9:1.1/0003:046D:C3=
1C.0002/input/input4
[    1.710559] hid-generic 0003:046D:C31C.0002: input,hidraw1: USB HID v1.10
Device [Logitech USB Keyboard] on usb-0000:03:00.0-9/input1
[    1.793762] usb 3-3: new low-speed USB device number 3 using xhci_hcd
[    1.967297] usb 3-3: New USB device found, idVendor=3D046d, idProduct=3D=
c077,
bcdDevice=3D72.00
[    1.967299] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    1.967301] usb 3-3: Product: USB Optical Mouse
[    1.967302] usb 3-3: Manufacturer: Logitech
[    1.995914] input: Logitech USB Optical Mouse as
/devices/pci0000:00/0000:00:07.1/0000:27:00.3/usb3/3-3/3-3:1.0/0003:046D:C0=
77.0003/input/input5
[    1.995985] hid-generic 0003:046D:C077.0003: input,hidraw2: USB HID v1.11
Mouse [Logitech USB Optical Mouse] on usb-0000:27:00.3-3/input0
[    2.007294] ata5: SATA link down (SStatus 0 SControl 300)
[    2.317540] ata6: SATA link down (SStatus 0 SControl 300)
[    2.323865] ata1.00: Enabling discard_zeroes_data
[    2.323946] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB=
/466
GiB)
[    2.323960] sd 0:0:0:0: [sda] Write Protect is off
[    2.323962] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.323976] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    2.324108] ata1.00: Enabling discard_zeroes_data
[    2.328288]  sda: sda1 sda2 sda3 sda4
[    2.328709] ata1.00: Enabling discard_zeroes_data
[    2.330243] sd 0:0:0:0: [sda] supports TCG Opal
[    2.330245] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.375831] random: fast init done
[    2.426659] EXT4-fs (sda4): mounted filesystem with ordered data mode. O=
pts:
(null)
[    2.508444] systemd[1]: systemd 240 running in system mode. (+PAM +AUDIT
-SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUT=
LS
+ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2
default-hierarchy=3Dhybrid)
[    2.523624] systemd[1]: Detected architecture x86-64.
[    2.532987] systemd[1]: Set hostname to <skynet>.
[    2.598221] systemd[1]: Reached target Remote File Systems.
[    2.598298] systemd[1]: Listening on udev Kernel Socket.
[    2.598360] systemd[1]: Listening on Journal Audit Socket.
[    2.598388] systemd[1]: Started Forward Password Requests to Wall Direct=
ory
Watch.
[    2.598439] systemd[1]: Listening on Journal Socket.
[    2.598757] systemd[1]: Condition check resulted in Load Kernel Modules
being skipped.
[    2.602370] systemd[1]: Starting Apply Kernel Variables...
[    2.608968] EXT4-fs (sda4): re-mounted. Opts: (null)
[    2.613991] random: lvm: uninitialized urandom read (4 bytes read)
[    2.621289] random: systemd-random-: uninitialized urandom read (512 byt=
es
read)
[    2.627022] audit: type=3D1130 audit(1550490033.361:2): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-setup-dev
comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? ter=
minal=3D?
res=3Dsuccess'
[    2.648956] audit: type=3D1130 audit(1550490033.381:3): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-udevd comm=3D"syst=
emd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.653863] audit: type=3D1130 audit(1550490033.387:4): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-journald comm=3D"s=
ystemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.662414] systemd-journald[373]: Received request to flush runtime jou=
rnal
from PID 1
[    2.668502] systemd-journald[373]: File
/var/log/journal/6e1615886332458a938e364b3d6ec1c6/system.journal corrupted =
or
uncleanly shut down, renaming and replacing.
[    2.674087] audit: type=3D1130 audit(1550490033.407:5): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-networkd comm=3D"s=
ystemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.676255] acpi_cpufreq: overriding BIOS provided _PSD data
[    2.677156] audit: type=3D1130 audit(1550490033.411:6): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-udev-trigger comm=
=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.700242] acpi PNP0C14:01: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    2.723991] input: PC Speaker as /devices/platform/pcspkr/input/input6
[    2.729133] audit: type=3D1130 audit(1550490033.461:7): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-journal-flush comm=
=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.729474] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00,
revision 0
[    2.729476] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port
selection
[    2.731160] cryptd: max_cpu_qlen set to 1000
[    2.733313] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    2.733421] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO
address
[    2.733432] sp5100-tco sp5100-tco: Watchdog hardware is disabled
[    2.737346] mousedev: PS/2 mouse device common for all mice
[    2.738334] Linux agpgart interface v0.103
[    2.744481] AVX2 version of gcm_enc/dec engaged.
[    2.744482] AES CTR mode by8 optimization enabled
[    2.745914] media: Linux media interface: v0.10
[    2.763514] ccp 0000:27:00.2: ccp enabled
[    2.763544] ccp 0000:27:00.2: psp initialization failed
[    2.763546] ccp 0000:27:00.2: enabled
[    2.765277] videodev: Linux video capture interface: v2.00
[    2.765528] libphy: r8169: probed
[    2.765833] r8169 0000:24:00.0 eth0: RTL8168h/8111h, b0:6e:bf:61:51:67, =
XID
54100800, IRQ 47
[    2.765835] r8169 0000:24:00.0 eth0: jumbo features [frames: 9200 bytes,=
 tx
checksumming: ko]
[    2.775099] r8169 0000:24:00.0 enp36s0: renamed from eth0
[    2.808684] Generic PHY r8169-2400:00: attached PHY driver [Generic PHY]
(mii_bus:phy_addr=3Dr8169-2400:00, irq=3DIGNORE)
[    2.813125] snd_hda_intel 0000:26:00.1: Disabling MSI
[    2.813140] snd_hda_intel 0000:26:00.1: Handle vga_switcheroo audio clie=
nt
[    2.813209] asus_wmi: ASUS WMI generic driver loaded
[    2.815437] asus_wmi: Initialization: 0x0
[    2.815472] asus_wmi: BIOS WMI version: 0.9
[    2.815588] asus_wmi: SFUN value: 0x0
[    2.816036] input: Eee PC WMI hotkeys as
/devices/platform/eeepc-wmi/input/input7
[    2.816220] asus_wmi: Number of fans: 1
[    2.836352] snd_hda_codec_realtek hdaudioC2D0: autoconfig for ALC887-VD:
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[    2.836354] snd_hda_codec_realtek hdaudioC2D0:    speaker_outs=3D0
(0x0/0x0/0x0/0x0/0x0)
[    2.836356] snd_hda_codec_realtek hdaudioC2D0:    hp_outs=3D1
(0x1b/0x0/0x0/0x0/0x0)
[    2.836357] snd_hda_codec_realtek hdaudioC2D0:    mono: mono_out=3D0x0
[    2.836358] snd_hda_codec_realtek hdaudioC2D0:    dig-out=3D0x11/0x0
[    2.836359] snd_hda_codec_realtek hdaudioC2D0:    inputs:
[    2.836360] snd_hda_codec_realtek hdaudioC2D0:      Front Mic=3D0x19
[    2.836362] snd_hda_codec_realtek hdaudioC2D0:      Rear Mic=3D0x18
[    2.836363] snd_hda_codec_realtek hdaudioC2D0:      Line=3D0x1a
[    2.850963] input: HD-Audio Generic Front Mic as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input8
[    2.851021] input: HD-Audio Generic Rear Mic as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input9
[    2.851109] input: HD-Audio Generic Line as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input10
[    2.851185] input: HD-Audio Generic Line Out as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input11
[    2.851257] input: HD-Audio Generic Front Headphone as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input12
[    2.854280] audit: type=3D1130 audit(1550490033.587:8): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dlvm2-monitor comm=3D"syste=
md"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.867829] audit: type=3D1130 audit(1550490033.601:9): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-setup com=
m=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[    2.873903] audit: type=3D1127 audit(1550490033.607:10): pid=3D539 uid=
=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D' comm=3D"systemd-update-utmp"
exe=3D"/usr/lib/systemd/systemd-update-utmp" hostname=3D? addr=3D? terminal=
=3D?
res=3Dsuccess'
[    2.884122] random: dbus-daemon: uninitialized urandom read (12 bytes re=
ad)
[    2.912710] IPv6: ADDRCONF(NETDEV_UP): enp36s0: link is not ready
[    2.913122] kvm: Nested Virtualization enabled
[    2.913127] kvm: Nested Paging enabled
[    2.913127] SVM: Virtual VMLOAD VMSAVE supported
[    2.913128] SVM: Virtual GIF supported
[    2.916309] MCE: In-kernel MCE decoding enabled.
[    2.919683] EDAC amd64: Node 0: DRAM ECC disabled.
[    2.919685] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    2.943897] checking generic (f1000000 7f0000) vs hw (e8000000 8000000)
[    2.943899] checking generic (f1000000 7f0000) vs hw (f0000000 2000000)
[    2.943900] fb0: switching to nouveaufb from VESA VGA
[    2.943918] Console: switching to colour dummy device 80x25
[    2.944049] nouveau 0000:26:00.0: NVIDIA GK208B (b060b0b1)
[    2.970844] EDAC amd64: Node 0: DRAM ECC disabled.
[    2.970846] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    3.024463] EDAC amd64: Node 0: DRAM ECC disabled.
[    3.024465] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    3.058057] nouveau 0000:26:00.0: bios: version 80.28.b8.00.05
[    3.058771] nouveau 0000:26:00.0: fb: 1024 MiB GDDR5
[    3.061091] EDAC amd64: Node 0: DRAM ECC disabled.
[    3.061093] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    3.354033] input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:03.1/0000:26:00.1/sound/card1/input13
[    3.354089] input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:03.1/0000:26:00.1/sound/card1/input14
[    4.174663] [TTM] Zone  kernel: Available graphics memory: 16466388 kiB
[    4.174664] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    4.174665] [TTM] Initializing pool allocator
[    4.174668] [TTM] Initializing DMA pool allocator
[    4.174681] nouveau 0000:26:00.0: DRM: VRAM: 1024 MiB
[    4.174682] nouveau 0000:26:00.0: DRM: GART: 1048576 MiB
[    4.174685] nouveau 0000:26:00.0: DRM: TMDS table version 2.0
[    4.174686] nouveau 0000:26:00.0: DRM: DCB version 4.0
[    4.174687] nouveau 0000:26:00.0: DRM: DCB outp 00: 01000f02 00020030
[    4.174689] nouveau 0000:26:00.0: DRM: DCB outp 01: 02011f62 00020010
[    4.174690] nouveau 0000:26:00.0: DRM: DCB outp 02: 02022f10 00000000
[    4.174691] nouveau 0000:26:00.0: DRM: DCB conn 00: 00001031
[    4.174692] nouveau 0000:26:00.0: DRM: DCB conn 01: 00002161
[    4.174693] nouveau 0000:26:00.0: DRM: DCB conn 02: 00000200
[    4.175855] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.175856] [drm] Driver supports precise vblank timestamp query.
[    4.176530] nouveau 0000:26:00.0: DRM: MM: using COPY for buffer copies
[    4.282226] usb 3-2: set resolution quirk: cval->res =3D 384
[    4.282410] usbcore: registered new interface driver snd-usb-audio
[    4.282520] uvcvideo: Found UVC 1.00 device <unnamed> (046d:0825)
[    4.324164] uvcvideo 3-2:1.0: Entity type for entity Extension 4 was not
initialized!
[    4.324167] uvcvideo 3-2:1.0: Entity type for entity Extension 6 was not
initialized!
[    4.324169] uvcvideo 3-2:1.0: Entity type for entity Extension 7 was not
initialized!
[    4.324170] uvcvideo 3-2:1.0: Entity type for entity Processing 2 was not
initialized!
[    4.324172] uvcvideo 3-2:1.0: Entity type for entity Extension 3 was not
initialized!
[    4.324173] uvcvideo 3-2:1.0: Entity type for entity Camera 1 was not
initialized!
[    4.324249] input: UVC Camera (046d:0825) as
/devices/pci0000:00/0000:00:07.1/0000:27:00.3/usb3/3-2/3-2:1.0/input/input15
[    4.324341] usbcore: registered new interface driver uvcvideo
[    4.324342] USB Video Class driver (1.1.1)
[    4.405004] nouveau 0000:26:00.0: DRM: allocated 1920x1080 fb: 0x80000, =
bo
00000000124a817b
[    4.405082] fbcon: nouveaufb (fb0) is primary device
[    4.448204] Console: switching to colour frame buffer device 240x67
[    4.450391] nouveau 0000:26:00.0: fb0: nouveaufb frame buffer device
[    4.477398] [drm] Initialized nouveau 1.3.1 20120801 for 0000:26:00.0 on
minor 0
[    7.134214] r8169 0000:24:00.0 enp36s0: Link is Up - 1Gbps/Full - flow
control off
[    7.134229] IPv6: ADDRCONF(NETDEV_CHANGE): enp36s0: link becomes ready
[    9.015908] random: crng init done
[    9.015912] random: 1 urandom warning(s) missed due to ratelimiting
[   10.582929] kauditd_printk_skb: 6 callbacks suppressed
[   10.582932] audit: type=3D1006 audit(1550490041.314:17): pid=3D551 uid=
=3D0
old-auid=3D4294967295 auid=3D1000 tty=3Dtty1 old-ses=3D4294967295 ses=3D1 r=
es=3D1
[   10.602928] audit: type=3D1130 audit(1550490041.334:18): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser-runtime-dir@1000 comm=
=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[   10.609570] audit: type=3D1006 audit(1550490041.341:19): pid=3D563 uid=
=3D0
old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D2=
 res=3D1
[   10.641110] systemd-journald[373]: File
/var/log/journal/6e1615886332458a938e364b3d6ec1c6/user-1000.journal corrupt=
ed
or uncleanly shut down, renaming and replacing.
[   10.644652] audit: type=3D1130 audit(1550490041.377:20): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser@1000 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
[   99.818101] nouveau 0000:26:00.0: fifo: CHSW_ERROR 00000002
[ 99.818106] nouveau 0000:26:00.0: fifo: FB_FLUSH_TIMEOUT

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15506167390.58cF1.23867
Date: Tue, 19 Feb 2019 22:52:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia GT710 =3D&gt; nouveau + wayland + swayWM =3D&gt; c=
rash when use acceleration (open Firefox)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109681#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia GT710 =3D&gt; nouveau + wayland + swayWM =3D&gt; c=
rash when use acceleration (open Firefox)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109681">bug 10968=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nolik03&#64;gmail.com" title=3D"nolik03&#64;gmail.com &lt;nolik03&#64;gmail=
.com&gt;"> <span class=3D"fn">nolik03&#64;gmail.com</span></a>
</span></b>
        <pre>full dmesg logs (for archiving):=20
[    0.000000] Linux version 4.20.8-arch1-1-ARCH (builduser&#64;heftig-1640=
4) (gcc
version 8.2.1 20181127 (GCC)) #1 SMP PREEMPT Wed Feb 13 00:06:58 UTC 2019
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3De1f39821-3d89-4694-a3a5-53aa73b0fc4f rw quiet
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point
registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes,
using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d3ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d400-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d00000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x00000000da7e9fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000da7ea000-0x00000000da971fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000da972000-0x00000000da990fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000da991000-0x00000000daa98fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000daa99000-0x00000000dae53fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000dae54000-0x00000000dbe73fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dbe74000-0x00000000ddffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000de000000-0x00000000dfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fdf00000-0x00000000fdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000081f37ffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: System manufacturer System Product Name/PRIME A320M-A, =
BIOS
0902 09/08/2017
[    0.000000] tsc: Fast TSC calibration failed
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D&gt; r=
eserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] last_pfn =3D 0x81f380 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF write-through
[    0.000000]   C0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000000 mask FFFF80000000 write-back
[    0.000000]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.000000]   2 base 0000C0000000 mask FFFFE0000000 write-back
[    0.000000]   3 base 0000DE000000 mask FFFFFE000000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] TOM2: 0000000820000000 aka 33280M
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
=20=20
[    0.000000] total RAM covered: 3552M
[    0.000000] Found optimal setting for mtrr clean up
[    0.000000]  gran_size: 64K  chunk_size: 1G  num_reg: 3      lose cover =
RAM:
0G
[    0.000000] e820: update [mem 0xde000000-0xffffffff] usable =3D=3D&gt; r=
eserved
[    0.000000] last_pfn =3D 0xde000 max_arch_pfn =3D 0x400000000
[    0.000000] check: Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [(____ptrval____)] 97000 size 24576
[    0.000000] Using GB pages for direct mapping
[    0.000000] BRK [0x4d6e01000, 0x4d6e01fff] PGTABLE
[    0.000000] BRK [0x4d6e02000, 0x4d6e02fff] PGTABLE
[    0.000000] BRK [0x4d6e03000, 0x4d6e03fff] PGTABLE
[    0.000000] BRK [0x4d6e04000, 0x4d6e04fff] PGTABLE
[    0.000000] BRK [0x4d6e05000, 0x4d6e05fff] PGTABLE
[    0.000000] BRK [0x4d6e06000, 0x4d6e06fff] PGTABLE
[    0.000000] BRK [0x4d6e07000, 0x4d6e07fff] PGTABLE
[    0.000000] BRK [0x4d6e08000, 0x4d6e08fff] PGTABLE
[    0.000000] BRK [0x4d6e09000, 0x4d6e09fff] PGTABLE
[    0.000000] BRK [0x4d6e0a000, 0x4d6e0afff] PGTABLE
[    0.000000] BRK [0x4d6e0b000, 0x4d6e0bfff] PGTABLE
[    0.000000] BRK [0x4d6e0c000, 0x4d6e0cfff] PGTABLE
[    0.000000] RAMDISK: [mem 0x36e49000-0x3771bfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F05B0 000024 (v02 ALASKA)
[    0.000000] ACPI: XSDT 0x00000000DA979098 0000AC (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: FACP 0x00000000DA9811E8 000114 (v06 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock=
 has
valid Length but zero Address: 0x0000000000000000/0x1 (20181003/tbfadt-624)
[    0.000000] ACPI: DSDT 0x00000000DA9791D0 008017 (v02 ALASKA A M I=20=20=
=20
01072009 INTL 20120913)
[    0.000000] ACPI: FACS 0x00000000DAE51C80 000040
[    0.000000] ACPI: APIC 0x00000000DA981300 0000DE (v03 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: FPDT 0x00000000DA9813E0 000044 (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: MSDM 0x00000000DA981428 000055 (v01 ALASKA A M I=20=20=
=20
01072009      00000000)
[    0.000000] ACPI: SSDT 0x00000000DA981480 008C4C (v02 AMD    AMD ALIB
00000002 MSFT 04000000)
[    0.000000] ACPI: FIDT 0x00000000DA98A0D0 00009C (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00010013)
[    0.000000] ACPI: SSDT 0x00000000DA98A170 0018B4 (v01 AMD    AMD CPU=20
00000001 AMD  00000001)
[    0.000000] ACPI: CRAT 0x00000000DA98BA28 000BD0 (v01 AMD    AMD CRAT
00000001 AMD  00000001)
[    0.000000] ACPI: CDIT 0x00000000DA98C5F8 000029 (v01 AMD    AMD CDIT
00000001 AMD  00000001)
[    0.000000] ACPI: SSDT 0x00000000DA98C628 0017FF (v01 AMD    AMD AOD=20
00000001 INTL 20120913)
[    0.000000] ACPI: MCFG 0x00000000DA98DE28 00003C (v01 ALASKA A M I=20=20=
=20
01072009 MSFT 00010013)
[    0.000000] ACPI: HPET 0x00000000DA98DE68 000038 (v01 ALASKA A M I=20=20=
=20
01072009 AMI  00000005)
[    0.000000] ACPI: SSDT 0x00000000DA98DEA0 000024 (v01 AMDFCH FCHZP=20=20=
=20
00001000 INTL 20120913)
[    0.000000] ACPI: UEFI 0x00000000DA98DEC8 000042 (v01=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
00000000      00000000)
[    0.000000] ACPI: IVRS 0x00000000DA98DF10 0000D0 (v02 AMD    AMD IVRS
00000001 AMD  00000000)
[    0.000000] ACPI: SSDT 0x00000000DA98DFE0 0000F8 (v01 AMD    AMD PT=20=20
00001000 INTL 20120913)
[    0.000000] ACPI: SSDT 0x00000000DA98E0D8 001664 (v01 AMD    CPMCMN=20=20
00000001 INTL 20120913)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] system APIC only can use physical flat
[    0.000000] Setting APIC routing to physical flat.
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000081f37ffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x81f37c000-0x81f37ffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000081f37ffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009cfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000009cfffff]
[    0.000000]   node   0: [mem 0x000000000a000000-0x00000000da7e9fff]
[    0.000000]   node   0: [mem 0x00000000da991000-0x00000000daa98fff]
[    0.000000]   node   0: [mem 0x00000000dbe74000-0x00000000ddffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000081f37ffff]
[    0.000000] Zeroed struct page in unavailable ranges: 14566 pages
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000081f37f=
fff]
[    0.000000] On node 0 totalpages: 8370842
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 14046 pages used for memmap
[    0.000000]   DMA32 zone: 898942 pages, LIFO batch:63
[    0.000000]   Normal zone: 116686 pages used for memmap
[    0.000000]   Normal zone: 7467904 pages, LIFO batch:63
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] system APIC only can use physical flat
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 13, version 33, address 0xfec00000, GSI 0=
-23
[    0.000000] IOAPIC[1]: apic_id 14, version 33, address 0xfec01000, GSI 2=
4-55
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.000000] smpboot: Allowing 16 CPUs, 4 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x09d00000-0x09ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xda7ea000-0xda971fff]
[    0.000000] PM: Registered nosave memory: [mem 0xda972000-0xda990fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdaa99000-0xdae53fff]
[    0.000000] PM: Registered nosave memory: [mem 0xdae54000-0xdbe73fff]
[    0.000000] PM: Registered nosave memory: [mem 0xde000000-0xdfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xf7ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfc000000-0xfdefffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfdf00000-0xfdffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe000000-0xfe9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfedd6000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] [mem 0xe0000000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.000000] random: get_random_bytes called from start_kernel+0x95/0x548
with crng_init=3D0
[    0.000000] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:16
nr_node_ids:1
[    0.000000] percpu: Embedded 45 pages/cpu &#64;(____ptrval____) s147456 =
r8192
d28672 u262144
[    0.000000] pcpu-alloc: s147456 r8192 d28672 u262144 alloc=3D1*2097152
[    0.000000] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 1=
3 14
15=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 82400=
25
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3De1f39821-3d89-4694-a3a5-53aa73b0fc4f rw quiet
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 32851792K/33483368K available (12293K kernel code, 1=
268K
rwdata, 3688K rodata, 1536K init, 3936K bss, 631576K reserved, 0K cma-reser=
ved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, =
Nodes=3D1
[    0.000000] ftrace: allocating 35811 entries in 140 pages
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     CONFIG_RCU_FANOUT set to non-default value of 32.
[    0.000000] rcu:     RCU dyntick-idle grace-period acceleration is enabl=
ed.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_i=
ds=3D16.
[    0.000000] rcu:     RCU priority boosting: priority 1 delay 500 ms.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30
jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D16
[    0.000000] NR_IRQS: 20736, nr_irqs: 1096, preallocated irqs: 16
[    0.000000] rcu:     Offload RCU callbacks from CPUs: (none).
[    0.000000] spurious 8259A interrupt: IRQ7.
[    0.000000] Console: colour dummy device 80x25
[    0.000000] printk: console [tty0] enabled
[    0.000000] ACPI: Core revision 20181003
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 133484873504 ns
[    0.000000] hpet clockevent registered
[    0.000000] APIC: Switch to symmetric I/O mode setup
[    0.003333] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.026666] tsc: PIT calibration matches HPET. 2 loops
[    0.026666] tsc: Detected 3193.621 MHz processor
[    0.000006] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:
0x2e08c04ce27, max_idle_ns: 440795324432 ns
[    0.000012] Calibrating delay loop (skipped), value calculated using tim=
er
frequency.. 6389.37 BogoMIPS (lpj=3D10645403)
[    0.000013] pid_max: default: 32768 minimum: 301
[    0.000053] LSM: Security Framework initializing
[    0.000054] Yama: becoming mindful.
[    0.000057] AppArmor: AppArmor disabled by boot time parameter
[    0.004628] Dentry cache hash table entries: 4194304 (order: 13, 33554432
bytes)
[    0.006693] Inode-cache hash table entries: 2097152 (order: 12, 16777216
bytes)
[    0.006777] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s)
[    0.006850] Mountpoint-cache hash table entries: 65536 (order: 7, 524288
bytes)
[    0.007061] mce: CPU supports 23 MCE banks
[    0.007079] LVT offset 1 assigned for vector 0xf9
[    0.007198] LVT offset 2 assigned for vector 0xf4
[    0.007209] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.007210] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.007211] Spectre V2 : Mitigation: Full AMD retpoline
[    0.007212] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on
context switch
[    0.007213] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss
disabled via prctl and seccomp
[    0.007381] Freeing SMP alternatives memory: 28K
[    0.013341] smpboot: CPU0: AMD Ryzen 5 1600 Six-Core Processor (family:
0x17, model: 0x1, stepping: 0x1)
[    0.030031] Performance Events: Fam17h core perfctr, AMD PMU driver.
[    0.030036] ... version:                0
[    0.030037] ... bit width:              48
[    0.030037] ... generic registers:      6
[    0.030038] ... value mask:             0000ffffffffffff
[    0.030039] ... max period:             00007fffffffffff
[    0.030039] ... fixed-purpose events:   0
[    0.030039] ... event mask:             000000000000003f
[    0.036689] rcu: Hierarchical SRCU implementation.
[    0.060024] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.066690] smp: Bringing up secondary CPUs ...
[    0.106708] x86: Booting SMP configuration:
[    0.106710] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  =
#9
#10 #11
[    0.508882] smp: Brought up 1 node, 12 CPUs
[    0.508882] smpboot: Max logical packages: 2
[    0.508882] smpboot: Total of 12 processors activated (76677.52 BogoMIPS)
[    0.510684] devtmpfs: initialized
[    0.510684] x86/mm: Memory block size: 128MB
[    0.511694] PM: Registering ACPI NVS region [mem 0xdaa99000-0xdae53fff]
(3911680 bytes)
[    0.511694] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f,
max_idle_ns: 6370867519511994 ns
[    0.511694] futex hash table entries: 4096 (order: 6, 262144 bytes)
[    0.511694] pinctrl core: initialized pinctrl subsystem
[    0.511694] RTC time: 11:40:31, date: 02/18/19
[    0.511694] NET: Registered protocol family 16
[    0.511694] audit: initializing netlink subsys (disabled)
[    0.511694] audit: type=3D2000 audit(1550490030.536:1): state=3Dinitiali=
zed
audit_enabled=3D0 res=3D1
[    0.513349] cpuidle: using governor ladder
[    0.513353] cpuidle: using governor menu
[    0.513368] ACPI: bus type PCI registered
[    0.513370] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.513428] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.513431] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.513436] pmd_set_huge: Cannot satisfy [mem 0xf8000000-0xf8200000] wit=
h a
huge-page mapping due to MTRR override.
[    0.513500] PCI: Using configuration type 1 for base access
[    0.514588] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.514588] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.514588] ACPI: Added _OSI(Module Device)
[    0.514588] ACPI: Added _OSI(Processor Device)
[    0.514588] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.514588] ACPI: Added _OSI(Processor Aggregator Device)
[    0.514588] ACPI: Added _OSI(Linux-Dell-Video)
[    0.514588] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.517450] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.524172] ACPI: 7 ACPI AML tables successfully acquired and loaded
[    0.529141] ACPI: Interpreter enabled
[    0.529154] ACPI: (supports S0 S3 S4 S5)
[    0.529155] ACPI: Using IOAPIC for interrupt routing
[    0.529291] PCI: Using host bridge windows from ACPI; if necessary, use
&quot;pci=3Dnocrs&quot; and report a bug
[    0.529533] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.537333] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.537337] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM
Segments MSI]
[    0.537520] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug
SHPCHotplug PME LTR]
[    0.537692] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
[    0.537702] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus
00-3f] only partially covers this bridge
[    0.538032] PCI host bridge to bus 0000:00
[    0.538034] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.538035] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.538036] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.538037] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.538039] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff
window]
[    0.538040] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff
window]
[    0.538041] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xf7ffffff
window]
[    0.538042] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.538048] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
[    0.538142] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
[    0.538250] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
[    0.538332] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
[    0.538382] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.538463] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
[    0.538544] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
[    0.538612] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
[    0.538676] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.538769] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
[    0.538854] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
[    0.538919] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
[    0.538938] pci 0000:00:07.1: enabling Extended Tags
[    0.538959] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.539032] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
[    0.539099] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
[    0.539118] pci 0000:00:08.1: enabling Extended Tags
[    0.539141] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.539250] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    0.539466] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    0.539687] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
[    0.539742] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
[    0.539798] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
[    0.539853] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
[    0.539907] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
[    0.539965] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
[    0.540024] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
[    0.540079] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
[    0.540194] pci 0000:03:00.0: [1022:43bc] type 00 class 0x0c0330
[    0.540216] pci 0000:03:00.0: reg 0x10: [mem 0xf76a0000-0xf76a7fff 64bit]
[    0.540290] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.540360] pci 0000:03:00.1: [1022:43b8] type 00 class 0x010601
[    0.540404] pci 0000:03:00.1: reg 0x24: [mem 0xf7680000-0xf769ffff]
[    0.540412] pci 0000:03:00.1: reg 0x30: [mem 0xf7600000-0xf767ffff pref]
[    0.540449] pci 0000:03:00.1: PME# supported from D3hot D3cold
[    0.540501] pci 0000:03:00.2: [1022:43b3] type 01 class 0x060400
[    0.540572] pci 0000:03:00.2: PME# supported from D3hot D3cold
[    0.540656] pci 0000:00:01.3: PCI bridge to [bus 03-25]
[    0.540659] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
[    0.540661] pci 0000:00:01.3:   bridge window [mem 0xf7500000-0xf76fffff]
[    0.540726] pci 0000:1d:04.0: [1022:43b4] type 01 class 0x060400
[    0.540811] pci 0000:1d:04.0: PME# supported from D3hot D3cold
[    0.540882] pci 0000:1d:05.0: [1022:43b4] type 01 class 0x060400
[    0.540965] pci 0000:1d:05.0: PME# supported from D3hot D3cold
[    0.541029] pci 0000:1d:06.0: [1022:43b4] type 01 class 0x060400
[    0.541114] pci 0000:1d:06.0: PME# supported from D3hot D3cold
[    0.541185] pci 0000:1d:07.0: [1022:43b4] type 01 class 0x060400
[    0.541270] pci 0000:1d:07.0: PME# supported from D3hot D3cold
[    0.541352] pci 0000:03:00.2: PCI bridge to [bus 1d-25]
[    0.541356] pci 0000:03:00.2:   bridge window [io  0xf000-0xffff]
[    0.541359] pci 0000:03:00.2:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.541403] pci 0000:1d:04.0: PCI bridge to [bus 22]
[    0.541444] pci 0000:1d:05.0: PCI bridge to [bus 23]
[    0.541509] pci 0000:24:00.0: [10ec:8168] type 00 class 0x020000
[    0.541550] pci 0000:24:00.0: reg 0x10: [io  0xf000-0xf0ff]
[    0.541585] pci 0000:24:00.0: reg 0x18: [mem 0xf7504000-0xf7504fff 64bit]
[    0.541607] pci 0000:24:00.0: reg 0x20: [mem 0xf7500000-0xf7503fff 64bit]
[    0.541733] pci 0000:24:00.0: supports D1 D2
[    0.541733] pci 0000:24:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541905] pci 0000:1d:06.0: PCI bridge to [bus 24]
[    0.541910] pci 0000:1d:06.0:   bridge window [io  0xf000-0xffff]
[    0.541912] pci 0000:1d:06.0:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.541955] pci 0000:1d:07.0: PCI bridge to [bus 25]
[    0.542035] pci 0000:26:00.0: [10de:128b] type 00 class 0x030000
[    0.542060] pci 0000:26:00.0: reg 0x10: [mem 0xf6000000-0xf6ffffff]
[    0.542073] pci 0000:26:00.0: reg 0x14: [mem 0xe8000000-0xefffffff 64bit
pref]
[    0.542086] pci 0000:26:00.0: reg 0x1c: [mem 0xf0000000-0xf1ffffff 64bit
pref]
[    0.542094] pci 0000:26:00.0: reg 0x24: [io  0xe000-0xe07f]
[    0.542103] pci 0000:26:00.0: reg 0x30: [mem 0xf7000000-0xf707ffff pref]
[    0.542199] pci 0000:26:00.0: 16.000 Gb/s available PCIe bandwidth, limi=
ted
by 2.5 GT/s x8 link at 0000:00:03.1 (capable of 63.008 Gb/s with 8 GT/s x8
link)
[    0.542240] pci 0000:26:00.1: [10de:0e0f] type 00 class 0x040300
[    0.542260] pci 0000:26:00.1: reg 0x10: [mem 0xf7080000-0xf7083fff]
[    0.542416] pci 0000:00:03.1: ASPM: current common clock configuration is
broken, reconfiguring
[    0.553388] pci 0000:00:03.1: PCI bridge to [bus 26]
[    0.553394] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.553397] pci 0000:00:03.1:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.553401] pci 0000:00:03.1:   bridge window [mem 0xe8000000-0xf1ffffff
64bit pref]
[    0.553485] pci 0000:27:00.0: [1022:145a] type 00 class 0x130000
[    0.553521] pci 0000:27:00.0: enabling Extended Tags
[    0.553607] pci 0000:27:00.2: [1022:1456] type 00 class 0x108000
[    0.553624] pci 0000:27:00.2: reg 0x18: [mem 0xf7300000-0xf73fffff]
[    0.553636] pci 0000:27:00.2: reg 0x24: [mem 0xf7400000-0xf7401fff]
[    0.553643] pci 0000:27:00.2: enabling Extended Tags
[    0.553717] pci 0000:27:00.3: [1022:145c] type 00 class 0x0c0330
[    0.553729] pci 0000:27:00.3: reg 0x10: [mem 0xf7200000-0xf72fffff 64bit]
[    0.553749] pci 0000:27:00.3: enabling Extended Tags
[    0.553774] pci 0000:27:00.3: PME# supported from D0 D3hot D3cold
[    0.553834] pci 0000:00:07.1: PCI bridge to [bus 27]
[    0.553838] pci 0000:00:07.1:   bridge window [mem 0xf7200000-0xf74fffff]
[    0.553891] pci 0000:28:00.0: [1022:1455] type 00 class 0x130000
[    0.553925] pci 0000:28:00.0: enabling Extended Tags
[    0.553989] pci 0000:28:00.2: [1022:7901] type 00 class 0x010601
[    0.554016] pci 0000:28:00.2: reg 0x24: [mem 0xf7708000-0xf7708fff]
[    0.554024] pci 0000:28:00.2: enabling Extended Tags
[    0.554050] pci 0000:28:00.2: PME# supported from D3hot D3cold
[    0.554095] pci 0000:28:00.3: [1022:1457] type 00 class 0x040300
[    0.554105] pci 0000:28:00.3: reg 0x10: [mem 0xf7700000-0xf7707fff]
[    0.554130] pci 0000:28:00.3: enabling Extended Tags
[    0.554155] pci 0000:28:00.3: PME# supported from D0 D3hot D3cold
[    0.554206] pci 0000:00:08.1: PCI bridge to [bus 28]
[    0.554209] pci 0000:00:08.1:   bridge window [mem 0xf7700000-0xf77fffff]
[    0.554657] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    0.554723] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    0.554780] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    0.554851] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    0.554914] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    0.554961] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    0.555005] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    0.555049] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    0.556705] pci 0000:26:00.0: vgaarb: setting as boot VGA device
[    0.556705] pci 0000:26:00.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    0.556705] pci 0000:26:00.0: vgaarb: bridge control possible
[    0.556705] vgaarb: loaded
[    0.556812] ACPI: bus type USB registered
[    0.556822] usbcore: registered new interface driver usbfs
[    0.556826] usbcore: registered new interface driver hub
[    0.556858] usbcore: registered new device driver usb
[    0.556873] pps_core: LinuxPPS API ver. 1 registered
[    0.556874] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti &lt;<a href=3D"mailto:giometti&#64;linux.it">giometti&#64;linux.it=
</a>&gt;
[    0.556876] PTP clock support registered
[    0.556881] EDAC MC: Ver: 3.0.0
[    0.556964] PCI: Using ACPI for IRQ routing
[    0.559199] PCI: pci_cache_line_size set to 64 bytes
[    0.559258] e820: reserve RAM buffer [mem 0x0009d400-0x0009ffff]
[    0.559259] e820: reserve RAM buffer [mem 0x09d00000-0x0bffffff]
[    0.559260] e820: reserve RAM buffer [mem 0xda7ea000-0xdbffffff]
[    0.559260] e820: reserve RAM buffer [mem 0xdaa99000-0xdbffffff]
[    0.559261] e820: reserve RAM buffer [mem 0xde000000-0xdfffffff]
[    0.559261] e820: reserve RAM buffer [mem 0x81f380000-0x81fffffff]
[    0.559333] NetLabel: Initializing
[    0.559334] NetLabel:  domain hash size =3D 128
[    0.559334] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.559346] NetLabel:  unlabeled traffic allowed by default
[    0.560043] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.560045] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.563342] clocksource: Switched to clocksource tsc-early
[    0.572198] VFS: Disk quotas dquot_6.6.0
[    0.572215] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.572267] pnp: PnP ACPI init
[    0.572371] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.572374] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.572441] system 00:01: [mem 0xfeb80000-0xfebfffff] could not be reser=
ved
[    0.572444] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.572545] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.572705] system 00:03: [io  0x0300-0x030f] has been reserved
[    0.572706] system 00:03: [io  0x0230-0x023f] has been reserved
[    0.572708] system 00:03: [io  0x0290-0x029f] has been reserved
[    0.572710] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.572983] pnp 00:04: [dma 0 disabled]
[    0.573022] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.573242] system 00:05: [io  0x04d0-0x04d1] has been reserved
[    0.573244] system 00:05: [io  0x040b] has been reserved
[    0.573245] system 00:05: [io  0x04d6] has been reserved
[    0.573246] system 00:05: [io  0x0c00-0x0c01] has been reserved
[    0.573248] system 00:05: [io  0x0c14] has been reserved
[    0.573250] system 00:05: [io  0x0c50-0x0c51] has been reserved
[    0.573251] system 00:05: [io  0x0c52] has been reserved
[    0.573252] system 00:05: [io  0x0c6c] has been reserved
[    0.573253] system 00:05: [io  0x0c6f] has been reserved
[    0.573254] system 00:05: [io  0x0cd0-0x0cd1] has been reserved
[    0.573255] system 00:05: [io  0x0cd2-0x0cd3] has been reserved
[    0.573256] system 00:05: [io  0x0cd4-0x0cd5] has been reserved
[    0.573257] system 00:05: [io  0x0cd6-0x0cd7] has been reserved
[    0.573258] system 00:05: [io  0x0cd8-0x0cdf] has been reserved
[    0.573259] system 00:05: [io  0x0800-0x089f] has been reserved
[    0.573260] system 00:05: [io  0x0b00-0x0b0f] has been reserved
[    0.573261] system 00:05: [io  0x0b20-0x0b3f] has been reserved
[    0.573262] system 00:05: [io  0x0900-0x090f] has been reserved
[    0.573263] system 00:05: [io  0x0910-0x091f] has been reserved
[    0.573264] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    0.573266] system 00:05: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    0.573267] system 00:05: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.573268] system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.573269] system 00:05: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    0.573270] system 00:05: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.573271] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.573274] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.573649] pnp: PnP ACPI: found 6 devices
[    0.579432] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,
max_idle_ns: 2085701024 ns
[    0.579482] pci 0000:1d:04.0: PCI bridge to [bus 22]
[    0.579491] pci 0000:1d:05.0: PCI bridge to [bus 23]
[    0.579501] pci 0000:1d:06.0: PCI bridge to [bus 24]
[    0.579503] pci 0000:1d:06.0:   bridge window [io  0xf000-0xffff]
[    0.579506] pci 0000:1d:06.0:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.579512] pci 0000:1d:07.0: PCI bridge to [bus 25]
[    0.579522] pci 0000:03:00.2: PCI bridge to [bus 1d-25]
[    0.579523] pci 0000:03:00.2:   bridge window [io  0xf000-0xffff]
[    0.579527] pci 0000:03:00.2:   bridge window [mem 0xf7500000-0xf75fffff]
[    0.579533] pci 0000:00:01.3: PCI bridge to [bus 03-25]
[    0.579534] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
[    0.579536] pci 0000:00:01.3:   bridge window [mem 0xf7500000-0xf76fffff]
[    0.579540] pci 0000:00:03.1: PCI bridge to [bus 26]
[    0.579542] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.579545] pci 0000:00:03.1:   bridge window [mem 0xf6000000-0xf70fffff]
[    0.579547] pci 0000:00:03.1:   bridge window [mem 0xe8000000-0xf1ffffff
64bit pref]
[    0.579550] pci 0000:00:07.1: PCI bridge to [bus 27]
[    0.579553] pci 0000:00:07.1:   bridge window [mem 0xf7200000-0xf74fffff]
[    0.579556] pci 0000:00:08.1: PCI bridge to [bus 28]
[    0.579558] pci 0000:00:08.1:   bridge window [mem 0xf7700000-0xf77fffff]
[    0.579563] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.579564] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.579565] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.579566] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    0.579567] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff windo=
w]
[    0.579568] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff windo=
w]
[    0.579569] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xf7ffffff wind=
ow]
[    0.579570] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
[    0.579571] pci_bus 0000:03: resource 1 [mem 0xf7500000-0xf76fffff]
[    0.579572] pci_bus 0000:1d: resource 0 [io  0xf000-0xffff]
[    0.579573] pci_bus 0000:1d: resource 1 [mem 0xf7500000-0xf75fffff]
[    0.579574] pci_bus 0000:24: resource 0 [io  0xf000-0xffff]
[    0.579575] pci_bus 0000:24: resource 1 [mem 0xf7500000-0xf75fffff]
[    0.579576] pci_bus 0000:26: resource 0 [io  0xe000-0xefff]
[    0.579577] pci_bus 0000:26: resource 1 [mem 0xf6000000-0xf70fffff]
[    0.579578] pci_bus 0000:26: resource 2 [mem 0xe8000000-0xf1ffffff 64bit
pref]
[    0.579579] pci_bus 0000:27: resource 1 [mem 0xf7200000-0xf74fffff]
[    0.579580] pci_bus 0000:28: resource 1 [mem 0xf7700000-0xf77fffff]
[    0.579658] NET: Registered protocol family 2
[    0.579797] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6,
262144 bytes)
[    0.579870] TCP established hash table entries: 262144 (order: 9, 2097152
bytes)
[    0.580151] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.580268] TCP: Hash tables configured (established 262144 bind 65536)
[    0.580311] UDP hash table entries: 16384 (order: 7, 524288 bytes)
[    0.580385] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes)
[    0.580486] NET: Registered protocol family 1
[    0.580490] NET: Registered protocol family 44
[    0.580637] pci 0000:26:00.0: Video device with shadowed ROM at [mem
0x000c0000-0x000dffff]
[    0.580649] pci 0000:26:00.1: Linked as a consumer to 0000:26:00.0
[    0.580805] PCI: CLS 64 bytes, default 64
[    0.580836] Unpacking initramfs...
[    0.681150] Freeing initrd memory: 9036K
[    0.681168] AMD-Vi: IOMMU performance counters supported
[    0.681269] pci 0000:00:00.2: can't derive routing for PCI INT A
[    0.681270] pci 0000:00:00.2: PCI INT A: not connected
[    0.681501] iommu: Adding device 0000:00:01.0 to group 0
[    0.681601] iommu: Adding device 0000:00:01.3 to group 1
[    0.681708] iommu: Adding device 0000:00:02.0 to group 2
[    0.681805] iommu: Adding device 0000:00:03.0 to group 3
[    0.681897] iommu: Adding device 0000:00:03.1 to group 4
[    0.681998] iommu: Adding device 0000:00:04.0 to group 5
[    0.682091] iommu: Adding device 0000:00:07.0 to group 6
[    0.682105] iommu: Adding device 0000:00:07.1 to group 6
[    0.682208] iommu: Adding device 0000:00:08.0 to group 7
[    0.682222] iommu: Adding device 0000:00:08.1 to group 7
[    0.682316] iommu: Adding device 0000:00:14.0 to group 8
[    0.682329] iommu: Adding device 0000:00:14.3 to group 8
[    0.682456] iommu: Adding device 0000:00:18.0 to group 9
[    0.682469] iommu: Adding device 0000:00:18.1 to group 9
[    0.682481] iommu: Adding device 0000:00:18.2 to group 9
[    0.682495] iommu: Adding device 0000:00:18.3 to group 9
[    0.682507] iommu: Adding device 0000:00:18.4 to group 9
[    0.682519] iommu: Adding device 0000:00:18.5 to group 9
[    0.682532] iommu: Adding device 0000:00:18.6 to group 9
[    0.682545] iommu: Adding device 0000:00:18.7 to group 9
[    0.682653] iommu: Adding device 0000:03:00.0 to group 10
[    0.682673] iommu: Adding device 0000:03:00.1 to group 10
[    0.682694] iommu: Adding device 0000:03:00.2 to group 10
[    0.682708] iommu: Adding device 0000:1d:04.0 to group 10
[    0.682719] iommu: Adding device 0000:1d:05.0 to group 10
[    0.682731] iommu: Adding device 0000:1d:06.0 to group 10
[    0.682743] iommu: Adding device 0000:1d:07.0 to group 10
[    0.682763] iommu: Adding device 0000:24:00.0 to group 10
[    0.682881] iommu: Adding device 0000:26:00.0 to group 11
[    0.682905] iommu: Adding device 0000:26:00.1 to group 11
[    0.682915] iommu: Adding device 0000:27:00.0 to group 6
[    0.682924] iommu: Adding device 0000:27:00.2 to group 6
[    0.682934] iommu: Adding device 0000:27:00.3 to group 6
[    0.682944] iommu: Adding device 0000:28:00.0 to group 7
[    0.682954] iommu: Adding device 0000:28:00.2 to group 7
[    0.682963] iommu: Adding device 0000:28:00.3 to group 7
[    0.683188] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
[    0.683189] AMD-Vi: Extended features (0xf77ef22294ada):
[    0.683190]  PPR NX GT IA GA PC GA_vAPIC
[    0.683192] AMD-Vi: Interrupt remapping enabled
[    0.683192] AMD-Vi: virtual APIC enabled
[    0.683426] AMD-Vi: Lazy IO/TLB flushing enabled
[    0.684323] amd_uncore: AMD NB counters detected
[    0.684326] amd_uncore: AMD LLC counters detected
[    0.684571] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4
counters/bank).
[    0.684615] check: Scanning for low memory corruption every 60 seconds
[    0.685150] Initialise system trusted keyrings
[    0.685163] Key type blacklist registered
[    0.685200] workingset: timestamp_bits=3D41 max_order=3D23 bucket_order=
=3D0
[    0.686164] zbud: loaded
[    0.721650] Key type asymmetric registered
[    0.721652] Asymmetric key parser 'x509' registered
[    0.721662] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor
244)
[    0.721712] io scheduler noop registered
[    0.721713] io scheduler deadline registered
[    0.721742] io scheduler cfq registered (default)
[    0.721743] io scheduler mq-deadline registered
[    0.721744] io scheduler kyber registered
[    0.721777] io scheduler bfq registered
[    0.722069] aer 0000:00:01.3:pcie002: AER enabled with IRQ 26
[    0.722185] aer 0000:00:03.1:pcie002: AER enabled with IRQ 27
[    0.722916] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.722965] vesafb: mode is 1920x1080x32, linelength=3D7680, pages=3D0
[    0.722965] vesafb: scrolling: redraw
[    0.722966] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.722982] vesafb: framebuffer at 0xf1000000, mapped to 0x0000000083236=
fa5,
using 8128k, total 8128k
[    0.723097] fbcon: Deferring console take-over
[    0.723098] fb0: VESA VGA frame buffer device
[    0.723161] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.723168] ACPI: Power Button [PWRB]
[    0.723202] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.723211] ACPI: Power Button [PWRF]
[    0.724270] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.745330] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a
16550A
[    0.746617] usbcore: registered new interface driver usbserial_generic
[    0.746621] usbserial: USB Serial support registered for generic
[    0.746648] rtc_cmos 00:02: RTC can wake from S4
[    0.746897] rtc_cmos 00:02: registered as rtc0
[    0.746908] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram,
hpet irqs
[    0.747057] ledtrig-cpu: registered to indicate activity on CPUs
[    0.747260] NET: Registered protocol family 10
[    0.753363] Segment Routing with IPv6
[    0.753377] NET: Registered protocol family 17
[    0.754069] RAS: Correctable Errors collector initialized.
[    0.754090] microcode: CPU0: patch_level=3D0x08001129
[    0.754095] microcode: CPU1: patch_level=3D0x08001129
[    0.754100] microcode: CPU2: patch_level=3D0x08001129
[    0.754105] microcode: CPU3: patch_level=3D0x08001129
[    0.754110] microcode: CPU4: patch_level=3D0x08001129
[    0.754115] microcode: CPU5: patch_level=3D0x08001129
[    0.754121] microcode: CPU6: patch_level=3D0x08001129
[    0.754128] microcode: CPU7: patch_level=3D0x08001129
[    0.754134] microcode: CPU8: patch_level=3D0x08001129
[    0.754141] microcode: CPU9: patch_level=3D0x08001129
[    0.754148] microcode: CPU10: patch_level=3D0x08001129
[    0.754154] microcode: CPU11: patch_level=3D0x08001129
[    0.754181] microcode: Microcode Update Driver: v2.2.
[    0.754190] sched_clock: Marking stable (780836210, -26658860)-&gt;(8780=
71471,
-123894121)
[    0.754522] registered taskstats version 1
[    0.754528] Loading compiled-in X.509 certificates
[    0.756707] Loaded X.509 cert 'Build time autogenerated kernel key:
0138fd63a261ba6db3be5b3e8299ee4407c2944b'
[    0.756725] zswap: loaded using pool lzo/zbud
[    0.762118] Key type big_key registered
[    0.762392]   Magic number: 7:625:681
[    0.762543] rtc_cmos 00:02: setting system clock to 2019-02-18 11:40:31 =
UTC
(1550490031)
[    0.763557] Freeing unused decrypted memory: 2040K
[    0.763822] Freeing unused kernel image memory: 1536K
[    0.795505] Write protecting the kernel read-only data: 18432k
[    0.796055] Freeing unused kernel image memory: 2016K
[    0.796128] Freeing unused kernel image memory: 408K
[    0.803842] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.803846] Run /init as init process
[    0.818013] fbcon: Taking over console
[    0.818073] Console: switching to colour frame buffer device 240x67
[    0.902160] SCSI subsystem initialized
[    0.904844] QUIRK: Enable AMD PLL fix
[    0.904862] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.904867] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus
number 1
[    0.908280] libata version 3.00 loaded.
[    0.910590] ahci 0000:03:00.1: version 3.0
[    0.910711] ahci 0000:03:00.1: SSS flag set, parallel bus scan disabled
[    0.910746] ahci 0000:03:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
33
impl SATA mode
[    0.910748] ahci 0000:03:00.1: flags: 64bit ncq sntf stag pm led clo only
pmp pio slum part sxs deso sadm sds apst=20
[    0.911339] scsi host0: ahci
[    0.911950] scsi host1: ahci
[    0.912071] scsi host2: ahci
[    0.912199] scsi host3: ahci
[    0.912315] scsi host4: ahci
[    0.916730] scsi host5: ahci
[    0.916856] scsi host6: ahci
[    0.917992] scsi host7: ahci
[    0.918048] ata1: SATA max UDMA/133 abar m131072&#64;0xf7680000 port 0xf=
7680100
irq 38
[    0.918050] ata2: SATA max UDMA/133 abar m131072&#64;0xf7680000 port 0xf=
7680180
irq 38
[    0.918051] ata3: DUMMY
[    0.918052] ata4: DUMMY
[    0.918054] ata5: SATA max UDMA/133 abar m131072&#64;0xf7680000 port 0xf=
7680300
irq 38
[    0.918055] ata6: SATA max UDMA/133 abar m131072&#64;0xf7680000 port 0xf=
7680380
irq 38
[    0.918056] ata7: DUMMY
[    0.918057] ata8: DUMMY
[    0.918231] ahci 0000:28:00.2: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1
impl SATA mode
[    0.918233] ahci 0000:28:00.2: flags: 64bit ncq sntf ilck pm led clo only
pmp fbs pio slum part=20
[    0.918394] scsi host8: ahci
[    0.918450] ata9: SATA max UDMA/133 abar m4096&#64;0xf7708000 port 0xf77=
08100
irq 40
[    0.960230] xhci_hcd 0000:03:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000008000418
[    0.960393] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 4.20
[    0.960395] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.960396] usb usb1: Product: xHCI Host Controller
[    0.960397] usb usb1: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.960398] usb usb1: SerialNumber: 0000:03:00.0
[    0.960500] hub 1-0:1.0: USB hub found
[    0.960511] hub 1-0:1.0: 9 ports detected
[    0.965688] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.965691] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus
number 2
[    0.965693] xhci_hcd 0000:03:00.0: Host supports USB 3.10 Enhanced
SuperSpeed
[    0.965716] usb usb2: We don't know the algorithms for LPM for this host,
disabling LPM.
[    0.965731] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 4.20
[    0.965733] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.965733] usb usb2: Product: xHCI Host Controller
[    0.965734] usb usb2: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.965735] usb usb2: SerialNumber: 0000:03:00.0
[    0.965805] hub 2-0:1.0: USB hub found
[    0.965811] hub 2-0:1.0: 3 ports detected
[    0.967666] xhci_hcd 0000:27:00.3: xHCI Host Controller
[    0.967669] xhci_hcd 0000:27:00.3: new USB bus registered, assigned bus
number 3
[    0.967764] xhci_hcd 0000:27:00.3: hcc params 0x0270f665 hci version 0x1=
00
quirks 0x0000000000000418
[    0.967866] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 4.20
[    0.967868] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.967868] usb usb3: Product: xHCI Host Controller
[    0.967869] usb usb3: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.967870] usb usb3: SerialNumber: 0000:27:00.3
[    0.967936] hub 3-0:1.0: USB hub found
[    0.967942] hub 3-0:1.0: 4 ports detected
[    0.968064] xhci_hcd 0000:27:00.3: xHCI Host Controller
[    0.968065] xhci_hcd 0000:27:00.3: new USB bus registered, assigned bus
number 4
[    0.968067] xhci_hcd 0000:27:00.3: Host supports USB 3.0  SuperSpeed
[    0.968077] usb usb4: We don't know the algorithms for LPM for this host,
disabling LPM.
[    0.968091] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 4.20
[    0.968092] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.968093] usb usb4: Product: xHCI Host Controller
[    0.968093] usb usb4: Manufacturer: Linux 4.20.8-arch1-1-ARCH xhci-hcd
[    0.968094] usb usb4: SerialNumber: 0000:27:00.3
[    0.968153] hub 4-0:1.0: USB hub found
[    0.968159] hub 4-0:1.0: 4 ports detected
[    1.210796] ata9: SATA link down (SStatus 0 SControl 300)
[    1.273776] usb 1-9: new low-speed USB device number 2 using xhci_hcd
[    1.280430] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[    1.370272] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.370605] ata1.00: supports DRM functions and may not be fully accessi=
ble
[    1.372497] ata1.00: ATA-11: Samsung SSD 860 EVO 500GB, RVT01B6Q, max
UDMA/133
[    1.372499] ata1.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    1.374841] ata1.00: supports DRM functions and may not be fully accessi=
ble
[    1.377601] ata1.00: configured for UDMA/133
[    1.377910] scsi 0:0:0:0: Direct-Access     ATA      Samsung SSD 860  1B=
6Q
PQ: 0 ANSI: 5
[    1.529152] usb 1-9: New USB device found, idVendor=3D046d, idProduct=3D=
c31c,
bcdDevice=3D64.00
[    1.529154] usb 1-9: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    1.529155] usb 1-9: Product: USB Keyboard
[    1.529157] usb 1-9: Manufacturer: Logitech
[    1.558533] hidraw: raw HID events driver (C) Jiri Kosina
[    1.596459] usbcore: registered new interface driver usbhid
[    1.596460] usbhid: USB HID core driver
[    1.598362] input: Logitech USB Keyboard as
/devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-9/1-9:1.0/0003:046D:C3=
1C.0001/input/input2
[    1.643341] usb 3-2: New USB device found, idVendor=3D046d, idProduct=3D=
0825,
bcdDevice=3D 0.12
[    1.643352] usb 3-2: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D2
[    1.643354] usb 3-2: SerialNumber: DDAFE0A0
[    1.654001] hid-generic 0003:046D:C31C.0001: input,hidraw0: USB HID v1.10
Keyboard [Logitech USB Keyboard] on usb-0000:03:00.0-9/input0
[    1.654189] input: Logitech USB Keyboard Consumer Control as
/devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-9/1-9:1.1/0003:046D:C3=
1C.0002/input/input3
[    1.691833] ata2: SATA link down (SStatus 0 SControl 300)
[    1.703762] tsc: Refined TSC clocksource calibration: 3193.998 MHz
[    1.703774] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x2e0a244aeba, max_idle_ns: 440795290469 ns
[    1.703820] clocksource: Switched to clocksource tsc
[    1.710486] input: Logitech USB Keyboard System Control as
/devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-9/1-9:1.1/0003:046D:C3=
1C.0002/input/input4
[    1.710559] hid-generic 0003:046D:C31C.0002: input,hidraw1: USB HID v1.10
Device [Logitech USB Keyboard] on usb-0000:03:00.0-9/input1
[    1.793762] usb 3-3: new low-speed USB device number 3 using xhci_hcd
[    1.967297] usb 3-3: New USB device found, idVendor=3D046d, idProduct=3D=
c077,
bcdDevice=3D72.00
[    1.967299] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    1.967301] usb 3-3: Product: USB Optical Mouse
[    1.967302] usb 3-3: Manufacturer: Logitech
[    1.995914] input: Logitech USB Optical Mouse as
/devices/pci0000:00/0000:00:07.1/0000:27:00.3/usb3/3-3/3-3:1.0/0003:046D:C0=
77.0003/input/input5
[    1.995985] hid-generic 0003:046D:C077.0003: input,hidraw2: USB HID v1.11
Mouse [Logitech USB Optical Mouse] on usb-0000:27:00.3-3/input0
[    2.007294] ata5: SATA link down (SStatus 0 SControl 300)
[    2.317540] ata6: SATA link down (SStatus 0 SControl 300)
[    2.323865] ata1.00: Enabling discard_zeroes_data
[    2.323946] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB=
/466
GiB)
[    2.323960] sd 0:0:0:0: [sda] Write Protect is off
[    2.323962] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.323976] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    2.324108] ata1.00: Enabling discard_zeroes_data
[    2.328288]  sda: sda1 sda2 sda3 sda4
[    2.328709] ata1.00: Enabling discard_zeroes_data
[    2.330243] sd 0:0:0:0: [sda] supports TCG Opal
[    2.330245] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.375831] random: fast init done
[    2.426659] EXT4-fs (sda4): mounted filesystem with ordered data mode. O=
pts:
(null)
[    2.508444] systemd[1]: systemd 240 running in system mode. (+PAM +AUDIT
-SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUT=
LS
+ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2
default-hierarchy=3Dhybrid)
[    2.523624] systemd[1]: Detected architecture x86-64.
[    2.532987] systemd[1]: Set hostname to &lt;skynet&gt;.
[    2.598221] systemd[1]: Reached target Remote File Systems.
[    2.598298] systemd[1]: Listening on udev Kernel Socket.
[    2.598360] systemd[1]: Listening on Journal Audit Socket.
[    2.598388] systemd[1]: Started Forward Password Requests to Wall Direct=
ory
Watch.
[    2.598439] systemd[1]: Listening on Journal Socket.
[    2.598757] systemd[1]: Condition check resulted in Load Kernel Modules
being skipped.
[    2.602370] systemd[1]: Starting Apply Kernel Variables...
[    2.608968] EXT4-fs (sda4): re-mounted. Opts: (null)
[    2.613991] random: lvm: uninitialized urandom read (4 bytes read)
[    2.621289] random: systemd-random-: uninitialized urandom read (512 byt=
es
read)
[    2.627022] audit: type=3D1130 audit(1550490033.361:2): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-setup-dev
comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; hostn=
ame=3D? addr=3D? terminal=3D?
res=3Dsuccess'
[    2.648956] audit: type=3D1130 audit(1550490033.381:3): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-udevd comm=3D&quot=
;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.653863] audit: type=3D1130 audit(1550490033.387:4): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-journald comm=3D&q=
uot;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.662414] systemd-journald[373]: Received request to flush runtime jou=
rnal
from PID 1
[    2.668502] systemd-journald[373]: File
/var/log/journal/6e1615886332458a938e364b3d6ec1c6/system.journal corrupted =
or
uncleanly shut down, renaming and replacing.
[    2.674087] audit: type=3D1130 audit(1550490033.407:5): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-networkd comm=3D&q=
uot;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.676255] acpi_cpufreq: overriding BIOS provided _PSD data
[    2.677156] audit: type=3D1130 audit(1550490033.411:6): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-udev-trigger comm=
=3D&quot;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.700242] acpi PNP0C14:01: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    2.723991] input: PC Speaker as /devices/platform/pcspkr/input/input6
[    2.729133] audit: type=3D1130 audit(1550490033.461:7): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-journal-flush comm=
=3D&quot;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.729474] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00,
revision 0
[    2.729476] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port
selection
[    2.731160] cryptd: max_cpu_qlen set to 1000
[    2.733313] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    2.733421] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO
address
[    2.733432] sp5100-tco sp5100-tco: Watchdog hardware is disabled
[    2.737346] mousedev: PS/2 mouse device common for all mice
[    2.738334] Linux agpgart interface v0.103
[    2.744481] AVX2 version of gcm_enc/dec engaged.
[    2.744482] AES CTR mode by8 optimization enabled
[    2.745914] media: Linux media interface: v0.10
[    2.763514] ccp 0000:27:00.2: ccp enabled
[    2.763544] ccp 0000:27:00.2: psp initialization failed
[    2.763546] ccp 0000:27:00.2: enabled
[    2.765277] videodev: Linux video capture interface: v2.00
[    2.765528] libphy: r8169: probed
[    2.765833] r8169 0000:24:00.0 eth0: RTL8168h/8111h, b0:6e:bf:61:51:67, =
XID
54100800, IRQ 47
[    2.765835] r8169 0000:24:00.0 eth0: jumbo features [frames: 9200 bytes,=
 tx
checksumming: ko]
[    2.775099] r8169 0000:24:00.0 enp36s0: renamed from eth0
[    2.808684] Generic PHY r8169-2400:00: attached PHY driver [Generic PHY]
(mii_bus:phy_addr=3Dr8169-2400:00, irq=3DIGNORE)
[    2.813125] snd_hda_intel 0000:26:00.1: Disabling MSI
[    2.813140] snd_hda_intel 0000:26:00.1: Handle vga_switcheroo audio clie=
nt
[    2.813209] asus_wmi: ASUS WMI generic driver loaded
[    2.815437] asus_wmi: Initialization: 0x0
[    2.815472] asus_wmi: BIOS WMI version: 0.9
[    2.815588] asus_wmi: SFUN value: 0x0
[    2.816036] input: Eee PC WMI hotkeys as
/devices/platform/eeepc-wmi/input/input7
[    2.816220] asus_wmi: Number of fans: 1
[    2.836352] snd_hda_codec_realtek hdaudioC2D0: autoconfig for ALC887-VD:
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[    2.836354] snd_hda_codec_realtek hdaudioC2D0:    speaker_outs=3D0
(0x0/0x0/0x0/0x0/0x0)
[    2.836356] snd_hda_codec_realtek hdaudioC2D0:    hp_outs=3D1
(0x1b/0x0/0x0/0x0/0x0)
[    2.836357] snd_hda_codec_realtek hdaudioC2D0:    mono: mono_out=3D0x0
[    2.836358] snd_hda_codec_realtek hdaudioC2D0:    dig-out=3D0x11/0x0
[    2.836359] snd_hda_codec_realtek hdaudioC2D0:    inputs:
[    2.836360] snd_hda_codec_realtek hdaudioC2D0:      Front Mic=3D0x19
[    2.836362] snd_hda_codec_realtek hdaudioC2D0:      Rear Mic=3D0x18
[    2.836363] snd_hda_codec_realtek hdaudioC2D0:      Line=3D0x1a
[    2.850963] input: HD-Audio Generic Front Mic as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input8
[    2.851021] input: HD-Audio Generic Rear Mic as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input9
[    2.851109] input: HD-Audio Generic Line as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input10
[    2.851185] input: HD-Audio Generic Line Out as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input11
[    2.851257] input: HD-Audio Generic Front Headphone as
/devices/pci0000:00/0000:00:08.1/0000:28:00.3/sound/card2/input12
[    2.854280] audit: type=3D1130 audit(1550490033.587:8): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dlvm2-monitor comm=3D&quot;=
systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.867829] audit: type=3D1130 audit(1550490033.601:9): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-setup com=
m=3D&quot;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[    2.873903] audit: type=3D1127 audit(1550490033.607:10): pid=3D539 uid=
=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D' comm=3D&quot;systemd-update-utmp=
&quot;
exe=3D&quot;/usr/lib/systemd/systemd-update-utmp&quot; hostname=3D? addr=3D=
? terminal=3D?
res=3Dsuccess'
[    2.884122] random: dbus-daemon: uninitialized urandom read (12 bytes re=
ad)
[    2.912710] IPv6: ADDRCONF(NETDEV_UP): enp36s0: link is not ready
[    2.913122] kvm: Nested Virtualization enabled
[    2.913127] kvm: Nested Paging enabled
[    2.913127] SVM: Virtual VMLOAD VMSAVE supported
[    2.913128] SVM: Virtual GIF supported
[    2.916309] MCE: In-kernel MCE decoding enabled.
[    2.919683] EDAC amd64: Node 0: DRAM ECC disabled.
[    2.919685] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    2.943897] checking generic (f1000000 7f0000) vs hw (e8000000 8000000)
[    2.943899] checking generic (f1000000 7f0000) vs hw (f0000000 2000000)
[    2.943900] fb0: switching to nouveaufb from VESA VGA
[    2.943918] Console: switching to colour dummy device 80x25
[    2.944049] nouveau 0000:26:00.0: NVIDIA GK208B (b060b0b1)
[    2.970844] EDAC amd64: Node 0: DRAM ECC disabled.
[    2.970846] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    3.024463] EDAC amd64: Node 0: DRAM ECC disabled.
[    3.024465] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    3.058057] nouveau 0000:26:00.0: bios: version 80.28.b8.00.05
[    3.058771] nouveau 0000:26:00.0: fb: 1024 MiB GDDR5
[    3.061091] EDAC amd64: Node 0: DRAM ECC disabled.
[    3.061093] EDAC amd64: ECC disabled in the BIOS or no ECC capability,
module will not load.
                Either enable ECC checking or force module loading by setti=
ng
'ecc_enable_override'.
                (Note that use of the override may cause unknown side effec=
ts.)
[    3.354033] input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:03.1/0000:26:00.1/sound/card1/input13
[    3.354089] input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:03.1/0000:26:00.1/sound/card1/input14
[    4.174663] [TTM] Zone  kernel: Available graphics memory: 16466388 kiB
[    4.174664] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    4.174665] [TTM] Initializing pool allocator
[    4.174668] [TTM] Initializing DMA pool allocator
[    4.174681] nouveau 0000:26:00.0: DRM: VRAM: 1024 MiB
[    4.174682] nouveau 0000:26:00.0: DRM: GART: 1048576 MiB
[    4.174685] nouveau 0000:26:00.0: DRM: TMDS table version 2.0
[    4.174686] nouveau 0000:26:00.0: DRM: DCB version 4.0
[    4.174687] nouveau 0000:26:00.0: DRM: DCB outp 00: 01000f02 00020030
[    4.174689] nouveau 0000:26:00.0: DRM: DCB outp 01: 02011f62 00020010
[    4.174690] nouveau 0000:26:00.0: DRM: DCB outp 02: 02022f10 00000000
[    4.174691] nouveau 0000:26:00.0: DRM: DCB conn 00: 00001031
[    4.174692] nouveau 0000:26:00.0: DRM: DCB conn 01: 00002161
[    4.174693] nouveau 0000:26:00.0: DRM: DCB conn 02: 00000200
[    4.175855] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.175856] [drm] Driver supports precise vblank timestamp query.
[    4.176530] nouveau 0000:26:00.0: DRM: MM: using COPY for buffer copies
[    4.282226] usb 3-2: set resolution quirk: cval-&gt;res =3D 384
[    4.282410] usbcore: registered new interface driver snd-usb-audio
[    4.282520] uvcvideo: Found UVC 1.00 device &lt;unnamed&gt; (046d:0825)
[    4.324164] uvcvideo 3-2:1.0: Entity type for entity Extension 4 was not
initialized!
[    4.324167] uvcvideo 3-2:1.0: Entity type for entity Extension 6 was not
initialized!
[    4.324169] uvcvideo 3-2:1.0: Entity type for entity Extension 7 was not
initialized!
[    4.324170] uvcvideo 3-2:1.0: Entity type for entity Processing 2 was not
initialized!
[    4.324172] uvcvideo 3-2:1.0: Entity type for entity Extension 3 was not
initialized!
[    4.324173] uvcvideo 3-2:1.0: Entity type for entity Camera 1 was not
initialized!
[    4.324249] input: UVC Camera (046d:0825) as
/devices/pci0000:00/0000:00:07.1/0000:27:00.3/usb3/3-2/3-2:1.0/input/input15
[    4.324341] usbcore: registered new interface driver uvcvideo
[    4.324342] USB Video Class driver (1.1.1)
[    4.405004] nouveau 0000:26:00.0: DRM: allocated 1920x1080 fb: 0x80000, =
bo
00000000124a817b
[    4.405082] fbcon: nouveaufb (fb0) is primary device
[    4.448204] Console: switching to colour frame buffer device 240x67
[    4.450391] nouveau 0000:26:00.0: fb0: nouveaufb frame buffer device
[    4.477398] [drm] Initialized nouveau 1.3.1 20120801 for 0000:26:00.0 on
minor 0
[    7.134214] r8169 0000:24:00.0 enp36s0: Link is Up - 1Gbps/Full - flow
control off
[    7.134229] IPv6: ADDRCONF(NETDEV_CHANGE): enp36s0: link becomes ready
[    9.015908] random: crng init done
[    9.015912] random: 1 urandom warning(s) missed due to ratelimiting
[   10.582929] kauditd_printk_skb: 6 callbacks suppressed
[   10.582932] audit: type=3D1006 audit(1550490041.314:17): pid=3D551 uid=
=3D0
old-auid=3D4294967295 auid=3D1000 tty=3Dtty1 old-ses=3D4294967295 ses=3D1 r=
es=3D1
[   10.602928] audit: type=3D1130 audit(1550490041.334:18): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser-runtime-dir&#64;1000 =
comm=3D&quot;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[   10.609570] audit: type=3D1006 audit(1550490041.341:19): pid=3D563 uid=
=3D0
old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D2=
 res=3D1
[   10.641110] systemd-journald[373]: File
/var/log/journal/6e1615886332458a938e364b3d6ec1c6/user-1000.journal corrupt=
ed
or uncleanly shut down, renaming and replacing.
[   10.644652] audit: type=3D1130 audit(1550490041.377:20): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser&#64;1000 comm=3D&quot=
;systemd&quot;
exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D? addr=3D? terminal=
=3D? res=3Dsuccess'
[   99.818101] nouveau 0000:26:00.0: fifo: CHSW_ERROR 00000002
[ 99.818106] nouveau 0000:26:00.0: fifo: FB_FLUSH_TIMEOUT</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15506167390.58cF1.23867--

--===============1771473581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1771473581==--
