From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83271] New: Windowed mode causes framebuffer not to
 refresh with PRIME on optimus/kepler discrete GPU
Date: Sat, 30 Aug 2014 12:56:54 +0000
Message-ID: <bug-83271-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0418973368=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0418973368==
Content-Type: multipart/alternative; boundary="1409403414.338F2Bd1.7357"; charset="us-ascii"


--1409403414.338F2Bd1.7357
Date: Sat, 30 Aug 2014 12:56:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83271

          Priority: medium
            Bug ID: 83271
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Windowed mode causes framebuffer not to refresh with
                    PRIME on optimus/kepler discrete GPU
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dimitri.sabadie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105462
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D105462&action=3Dedit
Screenshot of the issue

------ ISSUE=C2=A0DESCRIPTION ------
xrandr --setoutputoffloadsink nouveau Intel

I ran this:

    DRI_PRIME=3D1 glxspheres64

And I got a window which doesn=E2=80=99t refresh. This doesn=E2=80=99t occu=
r in fullscreen
mode. You can find a screenshot of the issue attached to the bug report.

At the first look, I=E2=80=99d say it=E2=80=99s an ACPI calls issue (see th=
e kernel log just
below).

------ SETUP ------
Distribution: Archlinux, up-to-date.
Arch: x86_64
Kernel version: 3.16.1-1, mainline
nouveau driver version: 1.0.10-3
nouveau-dri version: 10.2.6-1
libdrm version: 2.4.56-1

------ KERNEL LOG ------
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.16.1-1-ARCH
(nobody@var-lib-archbuild-testing-x86_64-tobias) (gcc version 4.9.1 (GCC) )=
 #1
SMP PREEMPT Thu Aug 14 07:40:19 CEST 2014
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3D05e8dfbb-1841-4f52-afbf-78ed4a9b737e rw quiet
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000020200000-0x0000000040003fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040004000-0x0000000040004fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000040005000-0x00000000a857ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000a8580000-0x00000000bae9efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000bae9f000-0x00000000baf9efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000baf9f000-0x00000000baffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000bafff000-0x00000000bf9fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed08000-0x00000000fed08fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ffc00000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000023e5fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.7 present.
[    0.000000] DMI: LENOVO 2438CTO/2438CTO, BIOS G5ET29WW (1.07 ) 05/25/2012
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] AGP: No AGP bridge found
[    0.000000] e820: last_pfn =3D 0x23e600 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0FFC00000 mask FFFC00000 write-protect
[    0.000000]   1 base 000000000 mask F80000000 write-back
[    0.000000]   2 base 080000000 mask FC0000000 write-back
[    0.000000]   3 base 0BC000000 mask FFC000000 uncachable
[    0.000000]   4 base 0BB000000 mask FFF000000 uncachable
[    0.000000]   5 base 100000000 mask F00000000 write-back
[    0.000000]   6 base 200000000 mask FC0000000 write-back
[    0.000000]   7 base 23F000000 mask FFF000000 uncachable
[    0.000000]   8 base 23E800000 mask FFF800000 uncachable
[    0.000000]   9 base 23E600000 mask FFFE00000 uncachable
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x701060007=
0106
[    0.000000] e820: last_pfn =3D 0xa8580 max_arch_pfn =3D 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000f0100-0x000f010f] mapped at
[ffff8800000f0100]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x01b23000, 0x01b23fff] PGTABLE
[    0.000000] BRK [0x01b24000, 0x01b24fff] PGTABLE
[    0.000000] BRK [0x01b25000, 0x01b25fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x23e400000-0x23e5fffff]
[    0.000000]  [mem 0x23e400000-0x23e5fffff] page 2M
[    0.000000] BRK [0x01b26000, 0x01b26fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x23c000000-0x23e3fffff]
[    0.000000]  [mem 0x23c000000-0x23e3fffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x200000000-0x23bffffff]
[    0.000000]  [mem 0x200000000-0x23bffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0x1fffffff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0x1fffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x20200000-0x40003fff]
[    0.000000]  [mem 0x20200000-0x3fffffff] page 2M
[    0.000000]  [mem 0x40000000-0x40003fff] page 4k
[    0.000000] BRK [0x01b27000, 0x01b27fff] PGTABLE
[    0.000000] BRK [0x01b28000, 0x01b28fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x40005000-0xa857ffff]
[    0.000000]  [mem 0x40005000-0x401fffff] page 4k
[    0.000000]  [mem 0x40200000-0xa83fffff] page 2M
[    0.000000]  [mem 0xa8400000-0xa857ffff] page 4k
[    0.000000] init_memory_mapping: [mem 0x100000000-0x1ffffffff]
[    0.000000]  [mem 0x100000000-0x1ffffffff] page 2M
[    0.000000] RAMDISK: [mem 0x37948000-0x37c9bfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F0120 000024 (v02 LENOVO)
[    0.000000] ACPI: XSDT 0x00000000BAFFE170 0000B4 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: FACP 0x00000000BAFE6000 0000F4 (v04 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: DSDT 0x00000000BAFE9000 00F6BC (v01 LENOVO TP-G5=20=20=
=20
00001070 INTL 20061109)
[    0.000000] ACPI: FACS 0x00000000BAF54000 000040
[    0.000000] ACPI: SLIC 0x00000000BAFFD000 000176 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000001)
[    0.000000] ACPI: TCPA 0x00000000BAFFC000 000032 (v02 PTL    LENOVO=20=20
06040000 LNVO 00000001)
[    0.000000] ACPI: SSDT 0x00000000BAFFB000 000249 (v01 LENOVO TP-SSDT2
00000200 INTL 20061109)
[    0.000000] ACPI: SSDT 0x00000000BAFFA000 000033 (v01 LENOVO TP-SSDT1
00000100 INTL 20061109)
[    0.000000] ACPI: SSDT 0x00000000BAFF9000 000797 (v01 LENOVO SataAhci
00001000 INTL 20061109)
[    0.000000] ACPI: HPET 0x00000000BAFE5000 000038 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: APIC 0x00000000BAFE4000 000098 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: MCFG 0x00000000BAFE3000 00003C (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: ECDT 0x00000000BAFE2000 000052 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: FPDT 0x00000000BAFE1000 000054 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: ASF! 0x00000000BAFE8000 0000A5 (v32 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: UEFI 0x00000000BAFE0000 00003E (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: UEFI 0x00000000BAFDF000 000042 (v01 PTL    COMBUF=20=20
00000001 PTL  00000001)
[    0.000000] ACPI: POAT 0x00000000BAFDE000 000055 (v03 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: SSDT 0x00000000BAFDD000 000C20 (v01 PmRef  Cpu0Ist=20
00003000 INTL 20061109)
[    0.000000] ACPI: SSDT 0x00000000BAFDC000 000A7E (v01 PmRef  CpuPm=20=20=
=20
00003000 INTL 20061109)
[    0.000000] ACPI: UEFI 0x00000000BAFDB000 0002A6 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000023e5fffff]
[    0.000000] Initmem setup node 0 [mem 0x00000000-0x23e5fffff]
[    0.000000]   NODE_DATA [mem 0x23e5f5000-0x23e5f9fff]
[    0.000000]  [ffffea0000000000-ffffea0008ffffff] PMD ->
[ffff880236000000-ffff88023dbfffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
[    0.000000]   Normal   [mem 0x100000000-0x23e5fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
[    0.000000]   node   0: [mem 0x00100000-0x1fffffff]
[    0.000000]   node   0: [mem 0x20200000-0x40003fff]
[    0.000000]   node   0: [mem 0x40005000-0xa857ffff]
[    0.000000]   node   0: [mem 0x100000000-0x23e5fffff]
[    0.000000] On node 0 totalpages: 1992987
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 10702 pages used for memmap
[    0.000000]   DMA32 zone: 684927 pages, LIFO batch:31
[    0.000000]   Normal zone: 20376 pages used for memmap
[    0.000000]   Normal zone: 1304064 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics stolen memory at 0xbba00000-0xbf9ff=
fff
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x07] lapic_id[0x06] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a301 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x20000000-0x201fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x40004000-0x40004fff]
[    0.000000] PM: Registered nosave memory: [mem 0xa8580000-0xbae9efff]
[    0.000000] PM: Registered nosave memory: [mem 0xbae9f000-0xbaf9efff]
[    0.000000] PM: Registered nosave memory: [mem 0xbaf9f000-0xbaffefff]
[    0.000000] PM: Registered nosave memory: [mem 0xbafff000-0xbf9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xbfa00000-0xf7ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfc000000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfed07fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed08000-0xfed08fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed09000-0xfed0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xffbfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffc00000-0xffffffff]
[    0.000000] e820: [mem 0xbfa00000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:128 nr_cpumask_bits:128 nr_cpu_ids:8
nr_node_ids:1
[    0.000000] PERCPU: Embedded 29 pages/cpu @ffff88023e200000 s86784 r8192
d23808 u262144
[    0.000000] pcpu-alloc: s86784 r8192 d23808 u262144 alloc=3D1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total
pages: 1961824
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3D05e8dfbb-1841-4f52-afbf-78ed4a9b737e rw quiet
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
[    0.000000] AGP: Checking aperture...
[    0.000000] AGP: No AGP bridge found
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 7762776K/7971948K available (5334K kernel code, 887K
rwdata, 1688K rodata, 1128K init, 1164K bss, 209172K reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]     RCU dyntick-idle grace-period acceleration is enabled.
[    0.000000]     Dump stacks of tasks blocking RCU-preempt GP.
[    0.000000]     RCU restricting CPUs from NR_CPUS=3D128 to nr_cpu_ids=3D=
8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.000000] NR_IRQS:8448 nr_irqs:744 16
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] allocated 32505856 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=3Dmemory' option if you don't want
memory cgroups
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2294.729 MHz processor
[    0.000037] Calibrating delay loop (skipped), value calculated using tim=
er
frequency.. 4591.68 BogoMIPS (lpj=3D7649096)
[    0.000040] pid_max: default: 32768 minimum: 301
[    0.000047] ACPI: Core revision 20140424
[    0.011654] ACPI: All ACPI Tables successfully acquired
[    0.012970] Security Framework initialized
[    0.012976] Yama: becoming mindful.
[    0.013492] Dentry cache hash table entries: 1048576 (order: 11, 8388608
bytes)
[    0.015591] Inode-cache hash table entries: 524288 (order: 10, 4194304
bytes)
[    0.016543] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s)
[    0.016553] Mountpoint-cache hash table entries: 16384 (order: 5, 131072
bytes)
[    0.016774] Initializing cgroup subsys memory
[    0.016793] Initializing cgroup subsys devices
[    0.016799] Initializing cgroup subsys freezer
[    0.016802] Initializing cgroup subsys net_cls
[    0.016805] Initializing cgroup subsys blkio
[    0.016829] CPU: Physical Processor ID: 0
[    0.016830] CPU: Processor Core ID: 0
[    0.016835] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.017224] mce: CPU supports 9 MCE banks
[    0.017237] CPU0: Thermal monitoring enabled (TM1)
[    0.017246] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
tlb_flushall_shift: 2
[    0.017360] Freeing SMP alternatives memory: 20K (ffffffff819f9000 -
ffffffff819fe000)
[    0.018326] ftrace: allocating 20434 entries in 80 pages
[    0.028797] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.061784] smpboot: CPU0: Intel(R) Core(TM) i7-3610QM CPU @ 2.30GHz (fa=
m:
06, model: 3a, stepping: 09)
[    0.061794] TSC deadline timer enabled
[    0.061815] Performance Events: PEBS fmt1+, 16-deep LBR, IvyBridge event=
s,
full-width counters, Intel PMU driver.
[    0.061835] ... version:                3
[    0.061836] ... bit width:              48
[    0.061837] ... generic registers:      4
[    0.061838] ... value mask:             0000ffffffffffff
[    0.061839] ... max period:             0000ffffffffffff
[    0.061840] ... fixed-purpose events:   3
[    0.061841] ... event mask:             000000070000000f
[    0.085211] x86: Booting SMP configuration:
[    0.085213] .... node  #0, CPUs:      #1
[    0.098901] NMI watchdog: enabled on all CPUs, permanently consumes one
hw-PMU counter.
[    0.105557]  #2 #3 #4 #5 #6 #7
[    0.220934] x86: Booted up 1 node, 8 CPUs
[    0.220938] smpboot: Total of 8 processors activated (36730.48 BogoMIPS)
[    0.228625] devtmpfs: initialized
[    0.231308] PM: Registering ACPI NVS region [mem 0xbae9f000-0xbaf9efff]
(1048576 bytes)
[    0.232177] pinctrl core: initialized pinctrl subsystem
[    0.232220] RTC time: 12:36:05, date: 08/30/14
[    0.232272] NET: Registered protocol family 16
[    0.232384] cpuidle: using governor ladder
[    0.232386] cpuidle: using governor menu
[    0.232411] ACPI FADT declares the system doesn't support PCIe ASPM, so
disable it
[    0.232412] ACPI: bus type PCI registered
[    0.232414] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.232627] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.232630] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.232715] PCI: Using configuration type 1 for base access
[    0.245439] ACPI: Added _OSI(Module Device)
[    0.245441] ACPI: Added _OSI(Processor Device)
[    0.245442] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.245443] ACPI: Added _OSI(Processor Aggregator Device)
[    0.246859] ACPI : EC: EC description table is found, configuring boot EC
[    0.250593] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.285710] ACPI: Dynamic OEM Table Load:
[    0.285722] ACPI: SSDT 0xFFFF880232E38000 000A01 (v01 PmRef  Cpu0Cst=20
00003001 INTL 20061109)
[    0.305314] ACPI: Dynamic OEM Table Load:
[    0.305324] ACPI: SSDT 0xFFFF880232F09000 000303 (v01 PmRef  ApIst=20=20=
=20
00003000 INTL 20061109)
[    0.318526] ACPI: Dynamic OEM Table Load:
[    0.318535] ACPI: SSDT 0xFFFF8802329B4000 000119 (v01 PmRef  ApCst=20=20=
=20
00003000 INTL 20061109)
[    0.336209] ACPI: Interpreter enabled
[    0.336216] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S1_] (20140424/hwxface-580)
[    0.336221] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S2_] (20140424/hwxface-580)
[    0.336233] ACPI: (supports S0 S3 S4 S5)
[    0.336235] ACPI: Using IOAPIC for interrupt routing
[    0.336258] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=3Dnocrs" and report a bug
[    0.352146] ACPI: Power Resource [PUBS] (on)
[    0.352721] acpi PNP0C0A:01: ACPI dock station (docks/bays count: 1)
[    0.353531] acpi LNXIOBAY:00: ACPI dock station (docks/bays count: 2)
[    0.355905] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 *11)
[    0.355983] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 *10 11)
[    0.356061] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 *7 9 10 11)
[    0.356138] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 9 *10 11)
[    0.356215] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 *7 9 10 11)
[    0.356290] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 *10 11)
[    0.356365] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 *11)
[    0.356441] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11)
[    0.356519] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3f])
[    0.356524] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM
Segments MSI]
[    0.356621] acpi PNP0A08:00: _OSC: platform does not support
[PCIeCapability]
[    0.356665] acpi PNP0A08:00: _OSC: not requesting control; platform does=
 not
support [PCIeCapability]
[    0.356667] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug PME AER
PCIeCapability]
[    0.356669] acpi PNP0A08:00: _OSC: platform willing to grant [PCIeHotplug
PME AER]
[    0.356671] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[    0.356821] PCI host bridge to bus 0000:00
[    0.356825] pci_bus 0000:00: root bus resource [bus 00-3f]
[    0.356826] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
[    0.356828] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    0.356830] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f]
[    0.356831] pci_bus 0000:00: root bus resource [mem 0xbfa00000-0xfebffff=
f]
[    0.356833] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed4bff=
f]
[    0.356841] pci 0000:00:00.0: [8086:0154] type 00 class 0x060000
[    0.356917] pci 0000:00:01.0: [8086:0151] type 01 class 0x060400
[    0.356951] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.357015] pci 0000:00:02.0: [8086:0166] type 00 class 0x030000
[    0.357025] pci 0000:00:02.0: reg 0x10: [mem 0xf1400000-0xf17fffff 64bit]
[    0.357031] pci 0000:00:02.0: reg 0x18: [mem 0xe0000000-0xefffffff 64bit
pref]
[    0.357036] pci 0000:00:02.0: reg 0x20: [io  0x6000-0x603f]
[    0.357127] pci 0000:00:14.0: [8086:1e31] type 00 class 0x0c0330
[    0.357150] pci 0000:00:14.0: reg 0x10: [mem 0xf3a20000-0xf3a2ffff 64bit]
[    0.357224] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.357252] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.357297] pci 0000:00:16.0: [8086:1e3a] type 00 class 0x078000
[    0.357321] pci 0000:00:16.0: reg 0x10: [mem 0xf3a35000-0xf3a3500f 64bit]
[    0.357399] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.357472] pci 0000:00:19.0: [8086:1502] type 00 class 0x020000
[    0.357491] pci 0000:00:19.0: reg 0x10: [mem 0xf3a00000-0xf3a1ffff]
[    0.357500] pci 0000:00:19.0: reg 0x14: [mem 0xf3a3b000-0xf3a3bfff]
[    0.357509] pci 0000:00:19.0: reg 0x18: [io  0x6080-0x609f]
[    0.357574] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.357602] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.357646] pci 0000:00:1a.0: [8086:1e2d] type 00 class 0x0c0320
[    0.357667] pci 0000:00:1a.0: reg 0x10: [mem 0xf3a3a000-0xf3a3a3ff]
[    0.357759] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.357789] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    0.357832] pci 0000:00:1b.0: [8086:1e20] type 00 class 0x040300
[    0.357850] pci 0000:00:1b.0: reg 0x10: [mem 0xf3a30000-0xf3a33fff 64bit]
[    0.357926] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.357960] pci 0000:00:1b.0: System wakeup disabled by ACPI
[    0.358005] pci 0000:00:1c.0: [8086:1e10] type 01 class 0x060400
[    0.358142] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.358225] pci 0000:00:1c.1: [8086:1e12] type 01 class 0x060400
[    0.358362] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.358450] pci 0000:00:1c.2: [8086:1e14] type 01 class 0x060400
[    0.358591] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.358632] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    0.358683] pci 0000:00:1d.0: [8086:1e26] type 00 class 0x0c0320
[    0.358706] pci 0000:00:1d.0: reg 0x10: [mem 0xf3a39000-0xf3a393ff]
[    0.358798] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.358827] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.358868] pci 0000:00:1f.0: [8086:1e55] type 00 class 0x060100
[    0.359034] pci 0000:00:1f.2: [8086:1e03] type 00 class 0x010601
[    0.359053] pci 0000:00:1f.2: reg 0x10: [io  0x60a8-0x60af]
[    0.359062] pci 0000:00:1f.2: reg 0x14: [io  0x60b4-0x60b7]
[    0.359070] pci 0000:00:1f.2: reg 0x18: [io  0x60a0-0x60a7]
[    0.359079] pci 0000:00:1f.2: reg 0x1c: [io  0x60b0-0x60b3]
[    0.359087] pci 0000:00:1f.2: reg 0x20: [io  0x6060-0x607f]
[    0.359095] pci 0000:00:1f.2: reg 0x24: [mem 0xf3a38000-0xf3a387ff]
[    0.359141] pci 0000:00:1f.2: PME# supported from D3hot
[    0.359203] pci 0000:00:1f.3: [8086:1e22] type 00 class 0x0c0500
[    0.359219] pci 0000:00:1f.3: reg 0x10: [mem 0xf3a34000-0xf3a340ff 64bit]
[    0.359240] pci 0000:00:1f.3: reg 0x20: [io  0xefa0-0xefbf]
[    0.359355] pci 0000:01:00.0: [10de:0ffb] type 00 class 0x030000
[    0.359366] pci 0000:01:00.0: reg 0x10: [mem 0xf0000000-0xf0ffffff]
[    0.359375] pci 0000:01:00.0: reg 0x14: [mem 0xc0000000-0xcfffffff 64bit
pref]
[    0.359384] pci 0000:01:00.0: reg 0x1c: [mem 0xd0000000-0xd1ffffff 64bit
pref]
[    0.359389] pci 0000:01:00.0: reg 0x24: [io  0x5000-0x507f]
[    0.359395] pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pref]
[    0.365111] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.365116] pci 0000:00:01.0:   bridge window [io  0x5000-0x5fff]
[    0.365129] pci 0000:00:01.0:   bridge window [mem 0xf0000000-0xf10fffff]
[    0.365133] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff
64bit pref]
[    0.365297] pci 0000:02:00.0: [1180:e822] type 00 class 0x088001
[    0.365322] pci 0000:02:00.0: MMC controller base frequency changed to
50Mhz.
[    0.365350] pci 0000:02:00.0: reg 0x10: [mem 0xf3101000-0xf31010ff]
[    0.365578] pci 0000:02:00.0: supports D1 D2
[    0.365580] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.365724] pci 0000:02:00.3: [1180:e832] type 00 class 0x0c0010
[    0.365757] pci 0000:02:00.3: reg 0x10: [mem 0xf3100000-0xf31007ff]
[    0.365975] pci 0000:02:00.3: supports D1 D2
[    0.365977] pci 0000:02:00.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.371878] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.371882] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.371887] pci 0000:00:1c.0:   bridge window [mem 0xf3100000-0xf39fffff]
[    0.371896] pci 0000:00:1c.0:   bridge window [mem 0xf1800000-0xf1ffffff
64bit pref]
[    0.372142] pci 0000:03:00.0: [8086:0085] type 00 class 0x028000
[    0.372312] pci 0000:03:00.0: reg 0x10: [mem 0xf3000000-0xf3001fff 64bit]
[    0.373089] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.378532] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.378541] pci 0000:00:1c.1:   bridge window [mem 0xf3000000-0xf30fffff]
[    0.378654] acpiphp: Slot [1] registered
[    0.378663] pci 0000:00:1c.2: PCI bridge to [bus 04-0b]
[    0.378668] pci 0000:00:1c.2:   bridge window [io  0x3000-0x3fff]
[    0.378673] pci 0000:00:1c.2:   bridge window [mem 0xf2800000-0xf2ffffff]
[    0.378681] pci 0000:00:1c.2:   bridge window [mem 0xf2000000-0xf27fffff
64bit pref]
[    0.379541] ACPI: Enabled 4 GPEs in block 00 to 3F
[    0.379598] ACPI : EC: GPE =3D 0x11, I/O: command/status =3D 0x66, data =
=3D 0x62
[    0.379696] vgaarb: device added:
PCI:0000:00:02.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    0.379701] vgaarb: device added:
PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
[    0.379702] vgaarb: loaded
[    0.379703] vgaarb: bridge control possible 0000:01:00.0
[    0.379704] vgaarb: no bridge control possible 0000:00:02.0
[    0.379733] PCI: Using ACPI for IRQ routing
[    0.381463] PCI: pci_cache_line_size set to 64 bytes
[    0.381652] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
[    0.381653] e820: reserve RAM buffer [mem 0x40004000-0x43ffffff]
[    0.381655] e820: reserve RAM buffer [mem 0xa8580000-0xabffffff]
[    0.381656] e820: reserve RAM buffer [mem 0x23e600000-0x23fffffff]
[    0.381765] NetLabel: Initializing
[    0.381766] NetLabel:  domain hash size =3D 128
[    0.381767] NetLabel:  protocols =3D UNLABELED CIPSOv4
[    0.381779] NetLabel:  unlabeled traffic allowed by default
[    0.381805] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.381810] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.384841] Switched to clocksource hpet
[    0.389181] pnp: PnP ACPI init
[    0.389195] ACPI: bus type PNP registered
[    0.389564] system 00:00: [mem 0x00000000-0x0009ffff] could not be reser=
ved
[    0.389566] system 00:00: [mem 0x000c0000-0x000c3fff] could not be reser=
ved
[    0.389568] system 00:00: [mem 0x000c4000-0x000c7fff] could not be reser=
ved
[    0.389570] system 00:00: [mem 0x000c8000-0x000cbfff] has been reserved
[    0.389572] system 00:00: [mem 0x000cc000-0x000cffff] has been reserved
[    0.389574] system 00:00: [mem 0x000d0000-0x000d3fff] has been reserved
[    0.389575] system 00:00: [mem 0x000d4000-0x000d7fff] has been reserved
[    0.389577] system 00:00: [mem 0x000d8000-0x000dbfff] has been reserved
[    0.389579] system 00:00: [mem 0x000dc000-0x000dffff] has been reserved
[    0.389580] system 00:00: [mem 0x000e0000-0x000e3fff] could not be reser=
ved
[    0.389582] system 00:00: [mem 0x000e4000-0x000e7fff] could not be reser=
ved
[    0.389584] system 00:00: [mem 0x000e8000-0x000ebfff] could not be reser=
ved
[    0.389586] system 00:00: [mem 0x000ec000-0x000effff] could not be reser=
ved
[    0.389588] system 00:00: [mem 0x000f0000-0x000fffff] could not be reser=
ved
[    0.389589] system 00:00: [mem 0x00100000-0xbf9fffff] could not be reser=
ved
[    0.389591] system 00:00: [mem 0xfec00000-0xfed3ffff] could not be reser=
ved
[    0.389593] system 00:00: [mem 0xfed4c000-0xffffffff] could not be reser=
ved
[    0.389597] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.389674] pnp 00:01: disabling [mem 0xfffff000-0xffffffff] because it
overlaps 0000:01:00.0 BAR 6 [mem 0xfff80000-0xffffffff pref]
[    0.389681] pnp 00:01: [Firmware Bug]: PNP resource [mem
0xfed10000-0xfed13fff] covers only part of 0000:00:00.0 Intel MCH; extendin=
g to
[mem 0xfed10000-0xfed17fff]
[    0.389702] system 00:01: [io  0x0400-0x047f] could not be reserved
[    0.389704] system 00:01: [io  0x0500-0x057f] has been reserved
[    0.389706] system 00:01: [io  0x0800-0x080f] has been reserved
[    0.389707] system 00:01: [io  0x15e0-0x15ef] has been reserved
[    0.389709] system 00:01: [io  0x1600-0x167f] has been reserved
[    0.389711] system 00:01: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.389713] system 00:01: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.389715] system 00:01: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.389717] system 00:01: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.389719] system 00:01: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.389721] system 00:01: [mem 0xfed45000-0xfed4bfff] has been reserved
[    0.389723] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.389778] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.389806] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.389834] pnp 00:04: Plug and Play ACPI device, IDs LEN0015 PNP0f13
(active)
[    0.389878] pnp 00:05: Plug and Play ACPI device, IDs SMO1200 PNP0c31
(active)
[    0.390336] pnp: PnP ACPI: found 6 devices
[    0.390339] ACPI: bus type PNP unregistered
[    0.397133] pci 0000:01:00.0: can't claim BAR 6 [mem 0xfff80000-0xffffff=
ff
pref]: no compatible bridge window
[    0.397179] pci 0000:01:00.0: BAR 6: assigned [mem 0xf1000000-0xf107ffff
pref]
[    0.397182] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.397184] pci 0000:00:01.0:   bridge window [io  0x5000-0x5fff]
[    0.397187] pci 0000:00:01.0:   bridge window [mem 0xf0000000-0xf10fffff]
[    0.397189] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff
64bit pref]
[    0.397193] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.397199] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.397206] pci 0000:00:1c.0:   bridge window [mem 0xf3100000-0xf39fffff]
[    0.397211] pci 0000:00:1c.0:   bridge window [mem 0xf1800000-0xf1ffffff
64bit pref]
[    0.397219] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.397226] pci 0000:00:1c.1:   bridge window [mem 0xf3000000-0xf30fffff]
[    0.397238] pci 0000:00:1c.2: PCI bridge to [bus 04-0b]
[    0.397241] pci 0000:00:1c.2:   bridge window [io  0x3000-0x3fff]
[    0.397247] pci 0000:00:1c.2:   bridge window [mem 0xf2800000-0xf2ffffff]
[    0.397252] pci 0000:00:1c.2:   bridge window [mem 0xf2000000-0xf27fffff
64bit pref]
[    0.397261] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    0.397263] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    0.397264] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.397266] pci_bus 0000:00: resource 7 [mem 0xbfa00000-0xfebfffff]
[    0.397268] pci_bus 0000:00: resource 8 [mem 0xfed40000-0xfed4bfff]
[    0.397269] pci_bus 0000:01: resource 0 [io  0x5000-0x5fff]
[    0.397271] pci_bus 0000:01: resource 1 [mem 0xf0000000-0xf10fffff]
[    0.397273] pci_bus 0000:01: resource 2 [mem 0xc0000000-0xd1ffffff 64bit
pref]
[    0.397275] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.397276] pci_bus 0000:02: resource 1 [mem 0xf3100000-0xf39fffff]
[    0.397278] pci_bus 0000:02: resource 2 [mem 0xf1800000-0xf1ffffff 64bit
pref]
[    0.397280] pci_bus 0000:03: resource 1 [mem 0xf3000000-0xf30fffff]
[    0.397281] pci_bus 0000:04: resource 0 [io  0x3000-0x3fff]
[    0.397283] pci_bus 0000:04: resource 1 [mem 0xf2800000-0xf2ffffff]
[    0.397284] pci_bus 0000:04: resource 2 [mem 0xf2000000-0xf27fffff 64bit
pref]
[    0.397313] NET: Registered protocol family 2
[    0.397504] TCP established hash table entries: 65536 (order: 7, 524288
bytes)
[    0.397653] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.397774] TCP: Hash tables configured (established 65536 bind 65536)
[    0.397789] TCP: reno registered
[    0.397799] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.397826] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.397888] NET: Registered protocol family 1
[    0.397902] pci 0000:00:02.0: Boot video device
[    0.398365] PCI: CLS 64 bytes, default 64
[    0.398413] Unpacking initramfs...
[    0.457932] Freeing initrd memory: 3408K (ffff880037948000 -
ffff880037c9c000)
[    0.457939] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.457942] software IO TLB [mem 0xa4580000-0xa8580000] (64MB) mapped at
[ffff8800a4580000-ffff8800a857ffff]
[    0.458348] RAPL PMU detected, hw unit 2^-16 Joules, API unit is 2^-32
Joules, 3 fixed counters 163840 ms ovfl timer
[    0.458399] Scanning for low memory corruption every 60 seconds
[    0.458691] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.459104] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.460367] zbud: loaded
[    0.460529] VFS: Disk quotas dquot_6.5.2
[    0.460565] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.460687] msgmni has been set to 15168
[    0.460740] Key type big_key registered
[    0.460891] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor
252)
[    0.460957] io scheduler noop registered
[    0.460961] io scheduler deadline registered
[    0.461005] io scheduler cfq registered (default)
[    0.461144] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
[    0.461566] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.461581] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.461608] vesafb: mode is 1920x1080x32, linelength=3D7680, pages=3D0
[    0.461609] vesafb: scrolling: redraw
[    0.461611] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.461629] vesafb: framebuffer at 0xe0000000, mapped to 0xffffc90004f00=
000,
using 8128k, total 8128k
[    0.615420] Console: switching to colour frame buffer device 240x67
[    0.768602] fb0: VESA VGA frame buffer device
[    0.768622] intel_idle: MWAIT substates: 0x21120
[    0.768623] intel_idle: v0.4 model 0x3A
[    0.768624] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.768951] GHES: HEST is not enabled!
[    0.769028] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.769414] Linux agpgart interface v0.103
[    0.769476] rtc_cmos 00:02: RTC can wake from S4
[    0.769606] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    0.769640] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram,
hpet irqs
[    0.769651] Intel P-state driver initializing.
[    0.769668] Intel pstate controlling: cpu 0
[    0.769689] Intel pstate controlling: cpu 1
[    0.769705] Intel pstate controlling: cpu 2
[    0.769724] Intel pstate controlling: cpu 3
[    0.769742] Intel pstate controlling: cpu 4
[    0.769760] Intel pstate controlling: cpu 5
[    0.769780] Intel pstate controlling: cpu 6
[    0.769796] Intel pstate controlling: cpu 7
[    0.769849] ledtrig-cpu: registered to indicate activity on CPUs
[    0.770049] TCP: cubic registered
[    0.770220] NET: Registered protocol family 10
[    0.770571] NET: Registered protocol family 17
[    0.771183] registered taskstats version 1
[    0.772134]   Magic number: 10:121:634
[    0.772263] rtc_cmos 00:02: setting system clock to 2014-08-30 12:36:05 =
UTC
(1409402165)
[    0.772405] PM: Hibernation image not present or could not be loaded.
[    0.773757] Freeing unused kernel memory: 1128K (ffffffff818df000 -
ffffffff819f9000)
[    0.773760] Write protecting the kernel read-only data: 8192k
[    0.777354] Freeing unused kernel memory: 800K (ffff880001538000 -
ffff880001600000)
[    0.778457] Freeing unused kernel memory: 360K (ffff8800017a6000 -
ffff880001800000)
[    0.788944] random: systemd-tmpfile urandom read with 7 bits of entropy
available
[    0.790991] systemd-udevd[81]: starting version 216
[    0.799037] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at
0x60,0x64 irq 1,12
[    0.800701] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.800713] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.804376] ACPI: bus type USB registered
[    0.804406] usbcore: registered new interface driver usbfs
[    0.804420] usbcore: registered new interface driver hub
[    0.804473] usbcore: registered new device driver usb
[    0.805170] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.805396] sdhci: Secure Digital Host Controller Interface driver
[    0.805397] sdhci: Copyright(c) Pierre Ossman
[    0.805512] ehci-pci: EHCI PCI platform driver
[    0.805621] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    0.805628] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus
number 1
[    0.805647] ehci-pci 0000:00:1a.0: debug port 2
[    0.806167] SCSI subsystem initialized
[    0.807567] libata version 3.00 loaded.
[    0.809557] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[    0.809570] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf3a3a000
[    0.815776] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    0.817965] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    0.818106] hub 1-0:1.0: USB hub found
[    0.818110] hub 1-0:1.0: 3 ports detected
[    0.818308] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    0.818312] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus
number 2
[    0.818323] ehci-pci 0000:00:1d.0: debug port 2
[    0.822211] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[    0.822222] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf3a39000
[    0.831378] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    0.831567] hub 2-0:1.0: USB hub found
[    0.831572] hub 2-0:1.0: 3 ports detected
[    0.831805] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.831810] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus
number 3
[    0.831903] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.831921] xhci_hcd 0000:00:14.0: irq 41 for MSI/MSI-X
[    0.832105] hub 3-0:1.0: USB hub found
[    0.832113] hub 3-0:1.0: 4 ports detected
[    0.832400] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.832404] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus
number 4
[    0.832610] hub 4-0:1.0: USB hub found
[    0.832620] hub 4-0:1.0: 4 ports detected
[    0.832777] usb: failed to peer usb4-port2 and usb3-port1 by location
(usb4-port2:none) (usb3-port1:usb4-port1)
[    0.832779] usb usb4-port2: failed to peer to usb3-port1 (-16)
[    0.832780] usb: port power management may be unreliable
[    0.832837] usb: failed to peer usb4-port3 and usb3-port1 by location
(usb4-port3:none) (usb3-port1:usb4-port1)
[    0.832838] usb usb4-port3: failed to peer to usb3-port1 (-16)
[    0.832894] usb: failed to peer usb4-port4 and usb3-port1 by location
(usb4-port4:none) (usb3-port1:usb4-port1)
[    0.832896] usb usb4-port4: failed to peer to usb3-port1 (-16)
[    0.832965] ahci 0000:00:1f.2: version 3.0
[    0.833064] ahci 0000:00:1f.2: irq 42 for MSI/MSI-X
[    0.833086] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
[    0.844683] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x=
13
impl SATA mode
[    0.844687] ahci 0000:00:1f.2: flags: 64bit ncq ilck stag pm led clo pio
slum part ems sxs apst=20
[    0.858821] scsi0 : ahci
[    0.859207] scsi1 : ahci
[    0.859395] scsi2 : ahci
[    0.859540] scsi3 : ahci
[    0.859685] scsi4 : ahci
[    0.859834] scsi5 : ahci
[    0.859887] ata1: SATA max UDMA/133 abar m2048@0xf3a38000 port 0xf3a38100
irq 42
[    0.859890] ata2: SATA max UDMA/133 abar m2048@0xf3a38000 port 0xf3a38180
irq 42
[    0.859892] ata3: DUMMY
[    0.859893] ata4: DUMMY
[    0.859896] ata5: SATA max UDMA/133 abar m2048@0xf3a38000 port 0xf3a38300
irq 42
[    0.859897] ata6: DUMMY
[    0.864648] firewire_ohci 0000:02:00.3: added OHCI v1.10 device as card =
0, 4
IR + 4 IT contexts, quirks 0x11
[    0.864688] sdhci-pci 0000:02:00.0: SDHCI controller found [1180:e822] (=
rev
8)
[    0.864771] mmc0: no vqmmc regulator found
[    0.864773] mmc0: no vmmc regulator found
[    0.864859] mmc0: SDHCI controller on PCI [0000:02:00.0] using DMA
[    1.124528] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.177900] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.178535] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succee=
ded
[    1.178543] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK)
filtered out
[    1.178951] ata1.00: ATA-8: SAMSUNG MZ7PC128HAFU-000L1, CXM04L1Q, max
UDMA/133
[    1.178958] ata1.00: 250069680 sectors, multi 16: LBA48 NCQ (depth 31/32=
),
AA
[    1.179470] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succee=
ded
[    1.179478] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK)
filtered out
[    1.179827] ata1.00: configured for UDMA/133
[    1.180155] scsi 0:0:0:0: Direct-Access     ATA      SAMSUNG MZ7PC128 4L=
1Q
PQ: 0 ANSI: 5
[    1.249220] hub 1-1:1.0: USB hub found
[    1.249488] hub 1-1:1.0: 6 ports detected
[    1.357919] usb 2-1: new high-speed USB device number 2 using ehci-pci
[    1.364721] firewire_core 0000:02:00.3: created device fw0: GUID
3c970eff28d0b5ff, S400
[    1.457736] tsc: Refined TSC clocksource calibration: 2294.793 MHz
[    1.481903] hub 2-1:1.0: USB hub found
[    1.482069] hub 2-1:1.0: 8 ports detected
[    1.497717] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.502815] ata2.00: ACPI cmd e3/00:10:00:00:00:a0 (IDLE) succeeded
[    1.504364] ata2.00: ACPI cmd e3/00:03:00:00:00:a0 (IDLE) succeeded
[    1.508328] ata2.00: ATAPI: HL-DT-ST DVDRAM GT50N, LT20, max UDMA/33
[    1.513033] ata2.00: ACPI cmd e3/00:10:00:00:00:a0 (IDLE) succeeded
[    1.514546] ata2.00: ACPI cmd e3/00:03:00:00:00:a0 (IDLE) succeeded
[    1.518543] ata2.00: configured for UDMA/33
[    1.527993] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVDRAM GT50N     LT=
20
PQ: 0 ANSI: 5
[    1.551231] usb 1-1.2: new full-speed USB device number 3 using ehci-pci
[    1.640637] hidraw: raw HID events driver (C) Jiri Kosina
[    1.643684] usbcore: registered new interface driver usbhid
[    1.643686] usbhid: USB HID core driver
[    1.644090] input: Razer Razer Imperator as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.0/0003:1532:002F.00=
01/input/input2
[    1.644134] hid-generic 0003:1532:002F.0001: input,hidraw0: USB HID v1.11
Mouse [Razer Razer Imperator] on usb-0000:00:1a.0-1.2/input0
[    1.645164] input: Razer Razer Imperator as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.1/0003:1532:002F.00=
02/input/input3
[    1.645248] hid-generic 0003:1532:002F.0002: input,hidraw1: USB HID v1.11
Keyboard [Razer Razer Imperator] on usb-0000:00:1a.0-1.2/input1
[    1.704519] usb 1-1.4: new full-speed USB device number 4 using ehci-pci
[    1.857552] ata5: SATA link down (SStatus 0 SControl 300)
[    1.863518] sd 0:0:0:0: [sda] 250069680 512-byte logical blocks: (128 GB=
/119
GiB)
[    1.863715] sd 0:0:0:0: [sda] Write Protect is off
[    1.863720] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.863775] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    1.865058]  sda: sda1 sda2 < sda5 sda6 > sda3 sda4
[    1.865712] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.870879] usb 1-1.6: new high-speed USB device number 5 using ehci-pci
[    1.873801] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 =
cdda
tray
[    1.873814] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.874054] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    1.995327] EXT4-fs (sda1): mounted filesystem with ordered data mode. O=
pts:
(null)
[    2.030876] usb 2-1.7: new low-speed USB device number 3 using ehci-pci
[    2.100774] systemd[1]: Cannot add dependency job for unit
display-manager.service, ignoring: Unit display-manager.service failed to l=
oad:
No such file or directory.
[    2.100780] systemd[1]: Cannot add dependency job for unit
bumblebeed.service, ignoring: Unit bumblebeed.service failed to load: No su=
ch
file or directory.
[    2.119637] hid-generic 0003:0765:5010.0003: hiddev0,hidraw2: USB HID v1=
.11
Device [HID 0765:5010] on usb-0000:00:1d.0-1.7/input0
[    2.123652] EXT4-fs (sda1): re-mounted. Opts: data=3Dordered
[    2.134227] usbip_core: module is from the staging directory, the qualit=
y is
unknown, you have been warned.
[    2.134513] usbip_core: USB/IP Core v1.0.0
[    2.136059] usbip_host: module is from the staging directory, the qualit=
y is
unknown, you have been warned.
[    2.136415] usbcore: registered new device driver usbip-host
[    2.136418] usbip_host: USB/IP Host Driver v1.0.0
[    2.143992] systemd-udevd[207]: starting version 216
[    2.170324] input: Lid Switch as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input4
[    2.170484] ACPI: Lid Switch [LID]
[    2.170562] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input5
[    2.170566] ACPI: Sleep Button [SLPB]
[    2.170657] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input6
[    2.170660] ACPI: Power Button [PWRF]
[    2.171876] thermal LNXTHERM:00: registered as thermal_zone0
[    2.171879] ACPI: Thermal Zone [THM0] (46 C)
[    2.172513] ACPI Warning: SystemIO range
0x0000000000000428-0x000000000000042f conflicts with OpRegion
0x0000000000000400-0x000000000000047f (\_SB_.PCI0.LPC_.PMIO)
(20140424/utaddress-258)
[    2.172519] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172523] ACPI Warning: SystemIO range
0x0000000000000540-0x000000000000054f conflicts with OpRegion
0x0000000000000500-0x000000000000057f (\_SB_.PCI0.LPC_.LPIO)
(20140424/utaddress-258)
[    2.172527] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172528] ACPI Warning: SystemIO range
0x0000000000000530-0x000000000000053f conflicts with OpRegion
0x0000000000000500-0x000000000000057f (\_SB_.PCI0.LPC_.LPIO)
(20140424/utaddress-258)
[    2.172532] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172533] ACPI Warning: SystemIO range
0x0000000000000500-0x000000000000052f conflicts with OpRegion
0x0000000000000500-0x000000000000057f (\_SB_.PCI0.LPC_.LPIO)
(20140424/utaddress-258)
[    2.172537] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172538] lpc_ich: Resource conflict(s) found affecting gpio_ich
[    2.172994] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.173141] pps_core: LinuxPPS API ver. 1 registered
[    2.173143] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    2.173965] PTP clock support registered
[    2.176876] mei_me 0000:00:16.0: irq 43 for MSI/MSI-X
[    2.177688] tpm_tis 00:05: 1.2 TPM (device-id 0x0, rev-id 78)
[    2.182525] wmi: Mapper loaded
[    2.182982] e1000e: Intel(R) PRO/1000 Network Driver - 2.3.2-k
[    2.182984] e1000e: Copyright(c) 1999 - 2014 Intel Corporation.
[    2.184068] ACPI: Battery Slot [BAT0] (battery present)
[    2.184454] ACPI: AC Adapter [AC] (on-line)
[    2.185188] [drm] Initialized drm 1.1.0 20060810
[    2.186188] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) se=
t to
dynamic conservative mode
[    2.186211] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    2.186530] Non-volatile memory driver v1.3
[    2.196965] cfg80211: Calling CRDA to update world regulatory domain
[    2.198631] microcode: CPU0 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198887] microcode: CPU1 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198904] microcode: CPU2 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198917] microcode: CPU3 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198930] microcode: CPU4 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198940] microcode: CPU5 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198951] microcode: CPU6 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198964] microcode: CPU7 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.199006] microcode: Microcode Update Driver: v2.00
<tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
[    2.199661] input: PC Speaker as /devices/platform/pcspkr/input/input7
[    2.201928] Intel(R) Wireless WiFi driver for Linux, in-tree:
[    2.201933] Copyright(c) 2003- 2014 Intel Corporation
[    2.202170] iwlwifi 0000:03:00.0: can't disable ASPM; OS doesn't have AS=
PM
control
[    2.202390] iwlwifi 0000:03:00.0: irq 45 for MSI/MSI-X
[    2.206761] iwlwifi 0000:03:00.0: loaded firmware version 18.168.6.1 op_=
mode
iwldvm
[    2.208275] media: Linux media interface: v0.10
[    2.208354] Bluetooth: Core ver 2.19
[    2.208367] NET: Registered protocol family 31
[    2.208369] Bluetooth: HCI device and connection manager initialized
[    2.208375] Bluetooth: HCI socket layer initialized
[    2.208378] Bluetooth: L2CAP socket layer initialized
[    2.208386] Bluetooth: SCO socket layer initialized
[    2.208544] AVX version of gcm_enc/dec engaged.
[    2.208623] thinkpad_acpi: ThinkPad ACPI Extras v0.25
[    2.208625] thinkpad_acpi: http://ibm-acpi.sf.net/
[    2.208627] thinkpad_acpi: ThinkPad BIOS G5ET29WW (1.07 ), EC unknown
[    2.208629] thinkpad_acpi: Lenovo ThinkPad W530, model 2438CTO
[    2.209822] mousedev: PS/2 mouse device common for all mice
[    2.214317] thinkpad_acpi: detected a 16-level brightness capable ThinkP=
ad
[    2.214433] thinkpad_acpi: radio switch found; radios are enabled
[    2.214562] thinkpad_acpi: This ThinkPad has standard ACPI backlight
brightness control, supported by the ACPI video driver
[    2.214563] thinkpad_acpi: Disabling thinkpad-acpi brightness events by
default...
[    2.216617] Linux video capture interface: v2.00
[    2.217547] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[    2.217947] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[    2.218272] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[    2.218277] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG_.=
VID_
handle
[    2.218294] checking generic (e0000000 7f0000) vs hw (c0000000 10000000)
[    2.218296] checking generic (e0000000 7f0000) vs hw (d0000000 2000000)
[    2.218324] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
[    2.218547] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73b0a2
[    2.218549] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    2.218551] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    2.218580] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image.=
..
[    2.218591] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    2.218593] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    2.218683] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    2.218684] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    2.224385] uvcvideo: Found UVC 1.00 device Integrated Camera (04f2:b2ea)
[    2.226413] input: Integrated Camera as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.6/1-1.6:1.0/input/input10
[    2.226487] usbcore: registered new interface driver uvcvideo
[    2.226489] USB Video Class driver (1.1.1)
[    2.230675] Adding 7811068k swap on /dev/sda5.  Priority:-1 extents:1
across:7811068k SSFS
[    2.232775] iwlwifi 0000:03:00.0: CONFIG_IWLWIFI_DEBUG disabled
[    2.232778] iwlwifi 0000:03:00.0: CONFIG_IWLWIFI_DEBUGFS disabled
[    2.232780] iwlwifi 0000:03:00.0: CONFIG_IWLWIFI_DEVICE_TRACING enabled
[    2.232783] iwlwifi 0000:03:00.0: Detected Intel(R) Centrino(R) Advanced=
-N
6205 AGN, REV=3D0xB0
[    2.232920] iwlwifi 0000:03:00.0: L1 Enabled; Disabling L0S
[    2.240171] intel_rapl: RAPL domain dram detection failed
[    2.246664] iTCO_vendor_support: vendor-support=3D0
[    2.247573] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    2.247619] iTCO_wdt: Found a Panther Point TCO device (Version=3D2,
TCOBASE=3D0x0460)
[    2.247778] iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=3D0)
[    2.447711] e1000e 0000:00:19.0 eth0: registered PHC clock
[    2.447716] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1)
3c:97:0e:28:d0:b5
[    2.447719] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connecti=
on
[    2.447757] e1000e 0000:00:19.0 eth0: MAC: 10, PHY: 11, PBA No: 1000FF-0=
FF
[    2.457461] Switched to clocksource tsc
[    2.488048] i801_smbus 0000:00:1f.3: SMBus using PCI Interrupt
[    2.594850] psmouse serio1: alps: Unknown ALPS touchpad: E7=3D10 00 64, =
EC=3D10
00 64
[    2.927009] psmouse serio1: trackpoint: IBM TrackPoint firmware: 0x0e,
buttons: 3/3
[    2.940802] input: TPPS/2 IBM TrackPoint as
/devices/platform/i8042/serio1/input/input8
[    3.134963] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is
unblocked
[    3.134996] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    3.134999] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    3.135113] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    3.135117] nouveau  [   VBIOS][0000:01:00.0] version 80.07.31.00.0d
[    3.135399] usbcore: registered new interface driver btusb
[    3.135723] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    3.135732] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    3.135911] thinkpad_acpi: Standard ACPI backlight interface available, =
not
loading native one
[    3.135983] thinkpad_acpi: Console audio control enabled, mode: monitor
(read only)
[    3.136377] bluetooth hci0: Direct firmware load failed with error -2
[    3.136378] bluetooth hci0: Falling back to user helper
[    3.137749] input: ThinkPad Extra Buttons as
/devices/platform/thinkpad_acpi/input/input9
[    3.138925] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
[    3.142963] Bluetooth: hci0: BCM: patch brcm/BCM20702A0-0a5c-21e6.hcd not
found
[    3.155354] EXT4-fs (sda6): mounted filesystem with ordered data mode. O=
pts:
data=3Dordered
[    3.162197] systemd-journald[187]: Received request to flush runtime jou=
rnal
from PID 1
[    3.164029] systemd-udevd[216]: renamed network interface eth0 to enp0s25
[    3.190806] systemd-udevd[227]: renamed network interface wlan0 to wlp3s0
[    3.278309] random: nonblocking pool is initialized
[    3.379589] nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
[    3.379601] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    3.379647] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    3.379649] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    3.379650] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    3.380987] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    3.414155] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / extern=
al
[    3.414169] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    3.414180] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    3.414212] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz memory
810 MHz=20
[    3.414232] nouveau  [     CLK][0000:01:00.0] 0f: core 270-745 MHz memory
1800 MHz=20
[    3.414375] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 648
MHz=20
[    3.441165] [TTM] Zone  kernel: Available graphics memory: 3884246 kiB
[    3.441167] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    3.441168] [TTM] Initializing pool allocator
[    3.441172] [TTM] Initializing DMA pool allocator
[    3.441183] nouveau  [     DRM] VRAM: 2048 MiB
[    3.441184] nouveau  [     DRM] GART: 1048576 MiB
[    3.441187] nouveau  [     DRM] TMDS table version 2.0
[    3.441188] nouveau  [     DRM] DCB version 4.0
[    3.441190] nouveau  [     DRM] DCB outp 00: 01800f23 00010034
[    3.441191] nouveau  [     DRM] DCB outp 01: 02811f00 00000000
[    3.441192] nouveau  [     DRM] DCB outp 02: 02822fa6 0f420010
[    3.441193] nouveau  [     DRM] DCB outp 03: 02822f62 00020010
[    3.441194] nouveau  [     DRM] DCB outp 04: 04833fb6 0f220010
[    3.441195] nouveau  [     DRM] DCB outp 05: 04833f72 00020010
[    3.441196] nouveau  [     DRM] DCB outp 06: 08844fc6 0f220010
[    3.441197] nouveau  [     DRM] DCB outp 07: 08844f82 00020010
[    3.441198] nouveau  [     DRM] DCB conn 00: 00000040
[    3.441200] nouveau  [     DRM] DCB conn 01: 00000100
[    3.441201] nouveau  [     DRM] DCB conn 02: 00010246
[    3.441202] nouveau  [     DRM] DCB conn 03: 00020346
[    3.441203] nouveau  [     DRM] DCB conn 04: 01000446
[    3.442852] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.442853] [drm] Driver supports precise vblank timestamp query.
[    3.448215] nouveau  [     DRM] MM: using COPY for buffer copies
[    3.619879] nouveau 0000:01:00.0: No connectors reported connected with
modes
[    3.619884] [drm] Cannot find any crtc or sizes - going 1024x768
[    3.653439] nouveau  [     DRM] allocated 1024x768 fb: 0x80000, bo
ffff880231218800
[    3.653536] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[    3.653538] nouveau 0000:01:00.0: registered panic notifier
[    3.686525] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[    3.687111] [drm] Memory usable by graphics device =3D 2048M
[    3.687113] [drm] Replacing VGA console driver
[    3.687115] checking generic (e0000000 7f0000) vs hw (e0000000 10000000)
[    3.687116] fb: switching to inteldrmfb from VESA VGA
[    3.687142] Console: switching to colour dummy device 80x25
[    3.692577] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    3.706661] i915 0000:00:02.0: irq 47 for MSI/MSI-X
[    3.706674] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.706684] [drm] Driver supports precise vblank timestamp query.
[    3.706786] vga_switcheroo: enabled
[    3.706852] vgaarb: device changed decodes:
PCI:0000:01:00.0,olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    3.706855] vgaarb: device changed decodes:
PCI:0000:00:02.0,olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    3.730030] [drm] Wrong MCH_SSKPD value: 0x20100406
[    3.730034] [drm] This can cause pipe underruns and display issues.
[    3.730035] [drm] Please upgrade your BIOS to fix this.
[    3.793288] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    3.793451] IPv6: ADDRCONF(NETDEV_UP): enp0s25: link is not ready
[    3.796500] [drm] GMBUS [i915 gmbus vga] timed out, falling back to bit
banging on pin 2
[    3.798109] iwlwifi 0000:03:00.0: L1 Enabled; Disabling L0S
[    3.804595] iwlwifi 0000:03:00.0: Radio type=3D0x1-0x2-0x0
[    3.811772] fbcon: inteldrmfb (fb0) is primary device
[    4.080312] iwlwifi 0000:03:00.0: L1 Enabled; Disabling L0S
[    4.086804] iwlwifi 0000:03:00.0: Radio type=3D0x1-0x2-0x0
[    4.166321] [drm:cpt_set_fifo_underrun_reporting] *ERROR* uncleared pch =
fifo
underrun on pch transcoder A
[    4.166323] [drm:cpt_serr_int_handler] *ERROR* PCH transcoder A FIFO
underrun
[    4.179171] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[    4.514578] cfg80211: Calling CRDA to update world regulatory domain
[    4.621262] cfg80211: Calling CRDA to update world regulatory domain
[    4.703396] Console: switching to colour frame buffer device 240x67
[    4.713102] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    4.719046] cfg80211: Calling CRDA to update world regulatory domain
[    4.731807] ACPI: Video Device [VID] (multi-head: yes  rom: no  post: no)
[    4.754277] acpi device:00: registered as cooling_device9
[    4.754447] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
[    4.754873] ACPI: Video Device [VID1] (multi-head: yes  rom: yes  post: =
no)
[    4.757055] acpi device:0a: registered as cooling_device10
[    4.757202] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:09/LNXVIDEO:01/input/inp=
ut12
[    4.757361] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on mi=
nor
1
[    4.758861] snd_hda_intel 0000:00:1b.0: irq 48 for MSI/MSI-X
[    4.772580] sound hdaudioC0D0: autoconfig: line_outs=3D1
(0x14/0x0/0x0/0x0/0x0) type:speaker
[    4.772585] sound hdaudioC0D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
[    4.772587] sound hdaudioC0D0:    hp_outs=3D2 (0x15/0x1b/0x0/0x0/0x0)
[    4.772589] sound hdaudioC0D0:    mono: mono_out=3D0x0
[    4.772591] sound hdaudioC0D0:    inputs:
[    4.772593] sound hdaudioC0D0:      Mic=3D0x18
[    4.772609] sound hdaudioC0D0:      Dock Mic=3D0x19
[    4.772613] sound hdaudioC0D0:      Internal Mic=3D0x12
[    4.780717] input: HDA Digital PCBeep as
/devices/pci0000:00/0000:00:1b.0/sound/card0/hdaudioC0D0/input13
[    4.781015] input: HDA Intel PCH Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input14
[    4.781126] input: HDA Intel PCH Dock Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input15
[    4.781241] input: HDA Intel PCH Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input16
[    4.781386] input: HDA Intel PCH Dock Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input17
[    4.979640] cfg80211: Calling CRDA to update world regulatory domain
[    5.356171] [drm] Enabling RC6 states: RC6 on, RC6p on, RC6pp off
[    7.280500] wlp3s0: authenticate with 14:0c:76:95:63:5f
[    7.288194] wlp3s0: send auth to 14:0c:76:95:63:5f (try 1/3)
[    7.301077] wlp3s0: authenticated
[    7.304728] wlp3s0: associate with 14:0c:76:95:63:5f (try 1/3)
[    7.312726] wlp3s0: RX AssocResp from 14:0c:76:95:63:5f (capab=3D0x411
status=3D0 aid=3D1)
[    7.337192] wlp3s0: associated
[    7.337233] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[    9.337075] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[    9.338004] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   10.403837] thinkpad_acpi: EC reports that Thermal Table has changed
[   13.803170] thinkpad_acpi: EC reports that Thermal Table has changed
[   15.582492] fuse init (API version 7.23)
[   20.527911] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   20.528467] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   21.824661] thinkpad_acpi: EC reports that Thermal Table has changed
[   36.031425] thinkpad_acpi: EC reports that Thermal Table has changed
[   51.328953] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   51.330011] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1409403414.338F2Bd1.7357
Date: Sat, 30 Aug 2014 12:56:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Windowed mode causes framebuffer not to refresh with =
PRIME on optimus/kepler discrete GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83271">83271</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Windowed mode causes framebuffer not to refresh with PRIME on=
 optimus/kepler discrete GPU
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dimitri.sabadie&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D105462=
" name=3D"attach_105462" title=3D"Screenshot of the issue">attachment 10546=
2</a> <a href=3D"attachment.cgi?id=3D105462&amp;action=3Dedit" title=3D"Scr=
eenshot of the issue">[details]</a></span>
Screenshot of the issue

------ ISSUE=C2=A0DESCRIPTION ------
xrandr --setoutputoffloadsink nouveau Intel

I ran this:

    DRI_PRIME=3D1 glxspheres64

And I got a window which doesn=E2=80=99t refresh. This doesn=E2=80=99t occu=
r in fullscreen
mode. You can find a screenshot of the issue attached to the bug report.

At the first look, I=E2=80=99d say it=E2=80=99s an ACPI calls issue (see th=
e kernel log just
below).

------ SETUP ------
Distribution: Archlinux, up-to-date.
Arch: x86_64
Kernel version: 3.16.1-1, mainline
nouveau driver version: 1.0.10-3
nouveau-dri version: 10.2.6-1
libdrm version: 2.4.56-1

------ KERNEL LOG ------
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.16.1-1-ARCH
(nobody&#64;var-lib-archbuild-testing-x86_64-tobias) (gcc version 4.9.1 (GC=
C) ) #1
SMP PREEMPT Thu Aug 14 07:40:19 CEST 2014
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3D05e8dfbb-1841-4f52-afbf-78ed4a9b737e rw quiet
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000020200000-0x0000000040003fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040004000-0x0000000040004fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000040005000-0x00000000a857ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000a8580000-0x00000000bae9efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000bae9f000-0x00000000baf9efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000baf9f000-0x00000000baffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000bafff000-0x00000000bf9fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed08000-0x00000000fed08fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ffc00000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000023e5fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.7 present.
[    0.000000] DMI: LENOVO 2438CTO/2438CTO, BIOS G5ET29WW (1.07 ) 05/25/2012
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D&gt; r=
eserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] AGP: No AGP bridge found
[    0.000000] e820: last_pfn =3D 0x23e600 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0FFC00000 mask FFFC00000 write-protect
[    0.000000]   1 base 000000000 mask F80000000 write-back
[    0.000000]   2 base 080000000 mask FC0000000 write-back
[    0.000000]   3 base 0BC000000 mask FFC000000 uncachable
[    0.000000]   4 base 0BB000000 mask FFF000000 uncachable
[    0.000000]   5 base 100000000 mask F00000000 write-back
[    0.000000]   6 base 200000000 mask FC0000000 write-back
[    0.000000]   7 base 23F000000 mask FFF000000 uncachable
[    0.000000]   8 base 23E800000 mask FFF800000 uncachable
[    0.000000]   9 base 23E600000 mask FFFE00000 uncachable
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x701060007=
0106
[    0.000000] e820: last_pfn =3D 0xa8580 max_arch_pfn =3D 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000f0100-0x000f010f] mapped at
[ffff8800000f0100]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x01b23000, 0x01b23fff] PGTABLE
[    0.000000] BRK [0x01b24000, 0x01b24fff] PGTABLE
[    0.000000] BRK [0x01b25000, 0x01b25fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x23e400000-0x23e5fffff]
[    0.000000]  [mem 0x23e400000-0x23e5fffff] page 2M
[    0.000000] BRK [0x01b26000, 0x01b26fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x23c000000-0x23e3fffff]
[    0.000000]  [mem 0x23c000000-0x23e3fffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x200000000-0x23bffffff]
[    0.000000]  [mem 0x200000000-0x23bffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0x1fffffff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0x1fffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x20200000-0x40003fff]
[    0.000000]  [mem 0x20200000-0x3fffffff] page 2M
[    0.000000]  [mem 0x40000000-0x40003fff] page 4k
[    0.000000] BRK [0x01b27000, 0x01b27fff] PGTABLE
[    0.000000] BRK [0x01b28000, 0x01b28fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x40005000-0xa857ffff]
[    0.000000]  [mem 0x40005000-0x401fffff] page 4k
[    0.000000]  [mem 0x40200000-0xa83fffff] page 2M
[    0.000000]  [mem 0xa8400000-0xa857ffff] page 4k
[    0.000000] init_memory_mapping: [mem 0x100000000-0x1ffffffff]
[    0.000000]  [mem 0x100000000-0x1ffffffff] page 2M
[    0.000000] RAMDISK: [mem 0x37948000-0x37c9bfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F0120 000024 (v02 LENOVO)
[    0.000000] ACPI: XSDT 0x00000000BAFFE170 0000B4 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: FACP 0x00000000BAFE6000 0000F4 (v04 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: DSDT 0x00000000BAFE9000 00F6BC (v01 LENOVO TP-G5=20=20=
=20
00001070 INTL 20061109)
[    0.000000] ACPI: FACS 0x00000000BAF54000 000040
[    0.000000] ACPI: SLIC 0x00000000BAFFD000 000176 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000001)
[    0.000000] ACPI: TCPA 0x00000000BAFFC000 000032 (v02 PTL    LENOVO=20=20
06040000 LNVO 00000001)
[    0.000000] ACPI: SSDT 0x00000000BAFFB000 000249 (v01 LENOVO TP-SSDT2
00000200 INTL 20061109)
[    0.000000] ACPI: SSDT 0x00000000BAFFA000 000033 (v01 LENOVO TP-SSDT1
00000100 INTL 20061109)
[    0.000000] ACPI: SSDT 0x00000000BAFF9000 000797 (v01 LENOVO SataAhci
00001000 INTL 20061109)
[    0.000000] ACPI: HPET 0x00000000BAFE5000 000038 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: APIC 0x00000000BAFE4000 000098 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: MCFG 0x00000000BAFE3000 00003C (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: ECDT 0x00000000BAFE2000 000052 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: FPDT 0x00000000BAFE1000 000054 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: ASF! 0x00000000BAFE8000 0000A5 (v32 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: UEFI 0x00000000BAFE0000 00003E (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: UEFI 0x00000000BAFDF000 000042 (v01 PTL    COMBUF=20=20
00000001 PTL  00000001)
[    0.000000] ACPI: POAT 0x00000000BAFDE000 000055 (v03 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: SSDT 0x00000000BAFDD000 000C20 (v01 PmRef  Cpu0Ist=20
00003000 INTL 20061109)
[    0.000000] ACPI: SSDT 0x00000000BAFDC000 000A7E (v01 PmRef  CpuPm=20=20=
=20
00003000 INTL 20061109)
[    0.000000] ACPI: UEFI 0x00000000BAFDB000 0002A6 (v01 LENOVO TP-G5=20=20=
=20
00001070 PTL  00000002)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000023e5fffff]
[    0.000000] Initmem setup node 0 [mem 0x00000000-0x23e5fffff]
[    0.000000]   NODE_DATA [mem 0x23e5f5000-0x23e5f9fff]
[    0.000000]  [ffffea0000000000-ffffea0008ffffff] PMD -&gt;
[ffff880236000000-ffff88023dbfffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
[    0.000000]   Normal   [mem 0x100000000-0x23e5fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
[    0.000000]   node   0: [mem 0x00100000-0x1fffffff]
[    0.000000]   node   0: [mem 0x20200000-0x40003fff]
[    0.000000]   node   0: [mem 0x40005000-0xa857ffff]
[    0.000000]   node   0: [mem 0x100000000-0x23e5fffff]
[    0.000000] On node 0 totalpages: 1992987
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 10702 pages used for memmap
[    0.000000]   DMA32 zone: 684927 pages, LIFO batch:31
[    0.000000]   Normal zone: 20376 pages used for memmap
[    0.000000]   Normal zone: 1304064 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics stolen memory at 0xbba00000-0xbf9ff=
fff
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x07] lapic_id[0x06] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a301 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x20000000-0x201fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x40004000-0x40004fff]
[    0.000000] PM: Registered nosave memory: [mem 0xa8580000-0xbae9efff]
[    0.000000] PM: Registered nosave memory: [mem 0xbae9f000-0xbaf9efff]
[    0.000000] PM: Registered nosave memory: [mem 0xbaf9f000-0xbaffefff]
[    0.000000] PM: Registered nosave memory: [mem 0xbafff000-0xbf9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xbfa00000-0xf7ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfc000000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfed07fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed08000-0xfed08fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed09000-0xfed0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xffbfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffc00000-0xffffffff]
[    0.000000] e820: [mem 0xbfa00000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] setup_percpu: NR_CPUS:128 nr_cpumask_bits:128 nr_cpu_ids:8
nr_node_ids:1
[    0.000000] PERCPU: Embedded 29 pages/cpu &#64;ffff88023e200000 s86784 r=
8192
d23808 u262144
[    0.000000] pcpu-alloc: s86784 r8192 d23808 u262144 alloc=3D1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total
pages: 1961824
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux
root=3DUUID=3D05e8dfbb-1841-4f52-afbf-78ed4a9b737e rw quiet
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
[    0.000000] AGP: Checking aperture...
[    0.000000] AGP: No AGP bridge found
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 7762776K/7971948K available (5334K kernel code, 887K
rwdata, 1688K rodata, 1128K init, 1164K bss, 209172K reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]     RCU dyntick-idle grace-period acceleration is enabled.
[    0.000000]     Dump stacks of tasks blocking RCU-preempt GP.
[    0.000000]     RCU restricting CPUs from NR_CPUS=3D128 to nr_cpu_ids=3D=
8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.000000] NR_IRQS:8448 nr_irqs:744 16
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] allocated 32505856 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=3Dmemory' option if you don't want
memory cgroups
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2294.729 MHz processor
[    0.000037] Calibrating delay loop (skipped), value calculated using tim=
er
frequency.. 4591.68 BogoMIPS (lpj=3D7649096)
[    0.000040] pid_max: default: 32768 minimum: 301
[    0.000047] ACPI: Core revision 20140424
[    0.011654] ACPI: All ACPI Tables successfully acquired
[    0.012970] Security Framework initialized
[    0.012976] Yama: becoming mindful.
[    0.013492] Dentry cache hash table entries: 1048576 (order: 11, 8388608
bytes)
[    0.015591] Inode-cache hash table entries: 524288 (order: 10, 4194304
bytes)
[    0.016543] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s)
[    0.016553] Mountpoint-cache hash table entries: 16384 (order: 5, 131072
bytes)
[    0.016774] Initializing cgroup subsys memory
[    0.016793] Initializing cgroup subsys devices
[    0.016799] Initializing cgroup subsys freezer
[    0.016802] Initializing cgroup subsys net_cls
[    0.016805] Initializing cgroup subsys blkio
[    0.016829] CPU: Physical Processor ID: 0
[    0.016830] CPU: Processor Core ID: 0
[    0.016835] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.017224] mce: CPU supports 9 MCE banks
[    0.017237] CPU0: Thermal monitoring enabled (TM1)
[    0.017246] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
tlb_flushall_shift: 2
[    0.017360] Freeing SMP alternatives memory: 20K (ffffffff819f9000 -
ffffffff819fe000)
[    0.018326] ftrace: allocating 20434 entries in 80 pages
[    0.028797] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.061784] smpboot: CPU0: Intel(R) Core(TM) i7-3610QM CPU &#64; 2.30GHz=
 (fam:
06, model: 3a, stepping: 09)
[    0.061794] TSC deadline timer enabled
[    0.061815] Performance Events: PEBS fmt1+, 16-deep LBR, IvyBridge event=
s,
full-width counters, Intel PMU driver.
[    0.061835] ... version:                3
[    0.061836] ... bit width:              48
[    0.061837] ... generic registers:      4
[    0.061838] ... value mask:             0000ffffffffffff
[    0.061839] ... max period:             0000ffffffffffff
[    0.061840] ... fixed-purpose events:   3
[    0.061841] ... event mask:             000000070000000f
[    0.085211] x86: Booting SMP configuration:
[    0.085213] .... node  #0, CPUs:      #1
[    0.098901] NMI watchdog: enabled on all CPUs, permanently consumes one
hw-PMU counter.
[    0.105557]  #2 #3 #4 #5 #6 #7
[    0.220934] x86: Booted up 1 node, 8 CPUs
[    0.220938] smpboot: Total of 8 processors activated (36730.48 BogoMIPS)
[    0.228625] devtmpfs: initialized
[    0.231308] PM: Registering ACPI NVS region [mem 0xbae9f000-0xbaf9efff]
(1048576 bytes)
[    0.232177] pinctrl core: initialized pinctrl subsystem
[    0.232220] RTC time: 12:36:05, date: 08/30/14
[    0.232272] NET: Registered protocol family 16
[    0.232384] cpuidle: using governor ladder
[    0.232386] cpuidle: using governor menu
[    0.232411] ACPI FADT declares the system doesn't support PCIe ASPM, so
disable it
[    0.232412] ACPI: bus type PCI registered
[    0.232414] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.232627] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.232630] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.232715] PCI: Using configuration type 1 for base access
[    0.245439] ACPI: Added _OSI(Module Device)
[    0.245441] ACPI: Added _OSI(Processor Device)
[    0.245442] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.245443] ACPI: Added _OSI(Processor Aggregator Device)
[    0.246859] ACPI : EC: EC description table is found, configuring boot EC
[    0.250593] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.285710] ACPI: Dynamic OEM Table Load:
[    0.285722] ACPI: SSDT 0xFFFF880232E38000 000A01 (v01 PmRef  Cpu0Cst=20
00003001 INTL 20061109)
[    0.305314] ACPI: Dynamic OEM Table Load:
[    0.305324] ACPI: SSDT 0xFFFF880232F09000 000303 (v01 PmRef  ApIst=20=20=
=20
00003000 INTL 20061109)
[    0.318526] ACPI: Dynamic OEM Table Load:
[    0.318535] ACPI: SSDT 0xFFFF8802329B4000 000119 (v01 PmRef  ApCst=20=20=
=20
00003000 INTL 20061109)
[    0.336209] ACPI: Interpreter enabled
[    0.336216] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S1_] (20140424/hwxface-580)
[    0.336221] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S2_] (20140424/hwxface-580)
[    0.336233] ACPI: (supports S0 S3 S4 S5)
[    0.336235] ACPI: Using IOAPIC for interrupt routing
[    0.336258] PCI: Using host bridge windows from ACPI; if necessary, use
&quot;pci=3Dnocrs&quot; and report a bug
[    0.352146] ACPI: Power Resource [PUBS] (on)
[    0.352721] acpi PNP0C0A:01: ACPI dock station (docks/bays count: 1)
[    0.353531] acpi LNXIOBAY:00: ACPI dock station (docks/bays count: 2)
[    0.355905] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 *11)
[    0.355983] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 *10 11)
[    0.356061] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 *7 9 10 11)
[    0.356138] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 9 *10 11)
[    0.356215] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 *7 9 10 11)
[    0.356290] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 *10 11)
[    0.356365] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 *11)
[    0.356441] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11)
[    0.356519] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3f])
[    0.356524] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM
Segments MSI]
[    0.356621] acpi PNP0A08:00: _OSC: platform does not support
[PCIeCapability]
[    0.356665] acpi PNP0A08:00: _OSC: not requesting control; platform does=
 not
support [PCIeCapability]
[    0.356667] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug PME AER
PCIeCapability]
[    0.356669] acpi PNP0A08:00: _OSC: platform willing to grant [PCIeHotplug
PME AER]
[    0.356671] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[    0.356821] PCI host bridge to bus 0000:00
[    0.356825] pci_bus 0000:00: root bus resource [bus 00-3f]
[    0.356826] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
[    0.356828] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    0.356830] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f]
[    0.356831] pci_bus 0000:00: root bus resource [mem 0xbfa00000-0xfebffff=
f]
[    0.356833] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed4bff=
f]
[    0.356841] pci 0000:00:00.0: [8086:0154] type 00 class 0x060000
[    0.356917] pci 0000:00:01.0: [8086:0151] type 01 class 0x060400
[    0.356951] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.357015] pci 0000:00:02.0: [8086:0166] type 00 class 0x030000
[    0.357025] pci 0000:00:02.0: reg 0x10: [mem 0xf1400000-0xf17fffff 64bit]
[    0.357031] pci 0000:00:02.0: reg 0x18: [mem 0xe0000000-0xefffffff 64bit
pref]
[    0.357036] pci 0000:00:02.0: reg 0x20: [io  0x6000-0x603f]
[    0.357127] pci 0000:00:14.0: [8086:1e31] type 00 class 0x0c0330
[    0.357150] pci 0000:00:14.0: reg 0x10: [mem 0xf3a20000-0xf3a2ffff 64bit]
[    0.357224] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.357252] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.357297] pci 0000:00:16.0: [8086:1e3a] type 00 class 0x078000
[    0.357321] pci 0000:00:16.0: reg 0x10: [mem 0xf3a35000-0xf3a3500f 64bit]
[    0.357399] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.357472] pci 0000:00:19.0: [8086:1502] type 00 class 0x020000
[    0.357491] pci 0000:00:19.0: reg 0x10: [mem 0xf3a00000-0xf3a1ffff]
[    0.357500] pci 0000:00:19.0: reg 0x14: [mem 0xf3a3b000-0xf3a3bfff]
[    0.357509] pci 0000:00:19.0: reg 0x18: [io  0x6080-0x609f]
[    0.357574] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.357602] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.357646] pci 0000:00:1a.0: [8086:1e2d] type 00 class 0x0c0320
[    0.357667] pci 0000:00:1a.0: reg 0x10: [mem 0xf3a3a000-0xf3a3a3ff]
[    0.357759] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.357789] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    0.357832] pci 0000:00:1b.0: [8086:1e20] type 00 class 0x040300
[    0.357850] pci 0000:00:1b.0: reg 0x10: [mem 0xf3a30000-0xf3a33fff 64bit]
[    0.357926] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.357960] pci 0000:00:1b.0: System wakeup disabled by ACPI
[    0.358005] pci 0000:00:1c.0: [8086:1e10] type 01 class 0x060400
[    0.358142] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.358225] pci 0000:00:1c.1: [8086:1e12] type 01 class 0x060400
[    0.358362] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.358450] pci 0000:00:1c.2: [8086:1e14] type 01 class 0x060400
[    0.358591] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.358632] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    0.358683] pci 0000:00:1d.0: [8086:1e26] type 00 class 0x0c0320
[    0.358706] pci 0000:00:1d.0: reg 0x10: [mem 0xf3a39000-0xf3a393ff]
[    0.358798] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.358827] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.358868] pci 0000:00:1f.0: [8086:1e55] type 00 class 0x060100
[    0.359034] pci 0000:00:1f.2: [8086:1e03] type 00 class 0x010601
[    0.359053] pci 0000:00:1f.2: reg 0x10: [io  0x60a8-0x60af]
[    0.359062] pci 0000:00:1f.2: reg 0x14: [io  0x60b4-0x60b7]
[    0.359070] pci 0000:00:1f.2: reg 0x18: [io  0x60a0-0x60a7]
[    0.359079] pci 0000:00:1f.2: reg 0x1c: [io  0x60b0-0x60b3]
[    0.359087] pci 0000:00:1f.2: reg 0x20: [io  0x6060-0x607f]
[    0.359095] pci 0000:00:1f.2: reg 0x24: [mem 0xf3a38000-0xf3a387ff]
[    0.359141] pci 0000:00:1f.2: PME# supported from D3hot
[    0.359203] pci 0000:00:1f.3: [8086:1e22] type 00 class 0x0c0500
[    0.359219] pci 0000:00:1f.3: reg 0x10: [mem 0xf3a34000-0xf3a340ff 64bit]
[    0.359240] pci 0000:00:1f.3: reg 0x20: [io  0xefa0-0xefbf]
[    0.359355] pci 0000:01:00.0: [10de:0ffb] type 00 class 0x030000
[    0.359366] pci 0000:01:00.0: reg 0x10: [mem 0xf0000000-0xf0ffffff]
[    0.359375] pci 0000:01:00.0: reg 0x14: [mem 0xc0000000-0xcfffffff 64bit
pref]
[    0.359384] pci 0000:01:00.0: reg 0x1c: [mem 0xd0000000-0xd1ffffff 64bit
pref]
[    0.359389] pci 0000:01:00.0: reg 0x24: [io  0x5000-0x507f]
[    0.359395] pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pref]
[    0.365111] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.365116] pci 0000:00:01.0:   bridge window [io  0x5000-0x5fff]
[    0.365129] pci 0000:00:01.0:   bridge window [mem 0xf0000000-0xf10fffff]
[    0.365133] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff
64bit pref]
[    0.365297] pci 0000:02:00.0: [1180:e822] type 00 class 0x088001
[    0.365322] pci 0000:02:00.0: MMC controller base frequency changed to
50Mhz.
[    0.365350] pci 0000:02:00.0: reg 0x10: [mem 0xf3101000-0xf31010ff]
[    0.365578] pci 0000:02:00.0: supports D1 D2
[    0.365580] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.365724] pci 0000:02:00.3: [1180:e832] type 00 class 0x0c0010
[    0.365757] pci 0000:02:00.3: reg 0x10: [mem 0xf3100000-0xf31007ff]
[    0.365975] pci 0000:02:00.3: supports D1 D2
[    0.365977] pci 0000:02:00.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.371878] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.371882] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.371887] pci 0000:00:1c.0:   bridge window [mem 0xf3100000-0xf39fffff]
[    0.371896] pci 0000:00:1c.0:   bridge window [mem 0xf1800000-0xf1ffffff
64bit pref]
[    0.372142] pci 0000:03:00.0: [8086:0085] type 00 class 0x028000
[    0.372312] pci 0000:03:00.0: reg 0x10: [mem 0xf3000000-0xf3001fff 64bit]
[    0.373089] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.378532] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.378541] pci 0000:00:1c.1:   bridge window [mem 0xf3000000-0xf30fffff]
[    0.378654] acpiphp: Slot [1] registered
[    0.378663] pci 0000:00:1c.2: PCI bridge to [bus 04-0b]
[    0.378668] pci 0000:00:1c.2:   bridge window [io  0x3000-0x3fff]
[    0.378673] pci 0000:00:1c.2:   bridge window [mem 0xf2800000-0xf2ffffff]
[    0.378681] pci 0000:00:1c.2:   bridge window [mem 0xf2000000-0xf27fffff
64bit pref]
[    0.379541] ACPI: Enabled 4 GPEs in block 00 to 3F
[    0.379598] ACPI : EC: GPE =3D 0x11, I/O: command/status =3D 0x66, data =
=3D 0x62
[    0.379696] vgaarb: device added:
PCI:0000:00:02.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    0.379701] vgaarb: device added:
PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
[    0.379702] vgaarb: loaded
[    0.379703] vgaarb: bridge control possible 0000:01:00.0
[    0.379704] vgaarb: no bridge control possible 0000:00:02.0
[    0.379733] PCI: Using ACPI for IRQ routing
[    0.381463] PCI: pci_cache_line_size set to 64 bytes
[    0.381652] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
[    0.381653] e820: reserve RAM buffer [mem 0x40004000-0x43ffffff]
[    0.381655] e820: reserve RAM buffer [mem 0xa8580000-0xabffffff]
[    0.381656] e820: reserve RAM buffer [mem 0x23e600000-0x23fffffff]
[    0.381765] NetLabel: Initializing
[    0.381766] NetLabel:  domain hash size =3D 128
[    0.381767] NetLabel:  protocols =3D UNLABELED CIPSOv4
[    0.381779] NetLabel:  unlabeled traffic allowed by default
[    0.381805] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.381810] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.384841] Switched to clocksource hpet
[    0.389181] pnp: PnP ACPI init
[    0.389195] ACPI: bus type PNP registered
[    0.389564] system 00:00: [mem 0x00000000-0x0009ffff] could not be reser=
ved
[    0.389566] system 00:00: [mem 0x000c0000-0x000c3fff] could not be reser=
ved
[    0.389568] system 00:00: [mem 0x000c4000-0x000c7fff] could not be reser=
ved
[    0.389570] system 00:00: [mem 0x000c8000-0x000cbfff] has been reserved
[    0.389572] system 00:00: [mem 0x000cc000-0x000cffff] has been reserved
[    0.389574] system 00:00: [mem 0x000d0000-0x000d3fff] has been reserved
[    0.389575] system 00:00: [mem 0x000d4000-0x000d7fff] has been reserved
[    0.389577] system 00:00: [mem 0x000d8000-0x000dbfff] has been reserved
[    0.389579] system 00:00: [mem 0x000dc000-0x000dffff] has been reserved
[    0.389580] system 00:00: [mem 0x000e0000-0x000e3fff] could not be reser=
ved
[    0.389582] system 00:00: [mem 0x000e4000-0x000e7fff] could not be reser=
ved
[    0.389584] system 00:00: [mem 0x000e8000-0x000ebfff] could not be reser=
ved
[    0.389586] system 00:00: [mem 0x000ec000-0x000effff] could not be reser=
ved
[    0.389588] system 00:00: [mem 0x000f0000-0x000fffff] could not be reser=
ved
[    0.389589] system 00:00: [mem 0x00100000-0xbf9fffff] could not be reser=
ved
[    0.389591] system 00:00: [mem 0xfec00000-0xfed3ffff] could not be reser=
ved
[    0.389593] system 00:00: [mem 0xfed4c000-0xffffffff] could not be reser=
ved
[    0.389597] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.389674] pnp 00:01: disabling [mem 0xfffff000-0xffffffff] because it
overlaps 0000:01:00.0 BAR 6 [mem 0xfff80000-0xffffffff pref]
[    0.389681] pnp 00:01: [Firmware Bug]: PNP resource [mem
0xfed10000-0xfed13fff] covers only part of 0000:00:00.0 Intel MCH; extendin=
g to
[mem 0xfed10000-0xfed17fff]
[    0.389702] system 00:01: [io  0x0400-0x047f] could not be reserved
[    0.389704] system 00:01: [io  0x0500-0x057f] has been reserved
[    0.389706] system 00:01: [io  0x0800-0x080f] has been reserved
[    0.389707] system 00:01: [io  0x15e0-0x15ef] has been reserved
[    0.389709] system 00:01: [io  0x1600-0x167f] has been reserved
[    0.389711] system 00:01: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.389713] system 00:01: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.389715] system 00:01: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.389717] system 00:01: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.389719] system 00:01: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.389721] system 00:01: [mem 0xfed45000-0xfed4bfff] has been reserved
[    0.389723] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.389778] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.389806] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.389834] pnp 00:04: Plug and Play ACPI device, IDs LEN0015 PNP0f13
(active)
[    0.389878] pnp 00:05: Plug and Play ACPI device, IDs SMO1200 PNP0c31
(active)
[    0.390336] pnp: PnP ACPI: found 6 devices
[    0.390339] ACPI: bus type PNP unregistered
[    0.397133] pci 0000:01:00.0: can't claim BAR 6 [mem 0xfff80000-0xffffff=
ff
pref]: no compatible bridge window
[    0.397179] pci 0000:01:00.0: BAR 6: assigned [mem 0xf1000000-0xf107ffff
pref]
[    0.397182] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.397184] pci 0000:00:01.0:   bridge window [io  0x5000-0x5fff]
[    0.397187] pci 0000:00:01.0:   bridge window [mem 0xf0000000-0xf10fffff]
[    0.397189] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff
64bit pref]
[    0.397193] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.397199] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.397206] pci 0000:00:1c.0:   bridge window [mem 0xf3100000-0xf39fffff]
[    0.397211] pci 0000:00:1c.0:   bridge window [mem 0xf1800000-0xf1ffffff
64bit pref]
[    0.397219] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.397226] pci 0000:00:1c.1:   bridge window [mem 0xf3000000-0xf30fffff]
[    0.397238] pci 0000:00:1c.2: PCI bridge to [bus 04-0b]
[    0.397241] pci 0000:00:1c.2:   bridge window [io  0x3000-0x3fff]
[    0.397247] pci 0000:00:1c.2:   bridge window [mem 0xf2800000-0xf2ffffff]
[    0.397252] pci 0000:00:1c.2:   bridge window [mem 0xf2000000-0xf27fffff
64bit pref]
[    0.397261] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    0.397263] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    0.397264] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.397266] pci_bus 0000:00: resource 7 [mem 0xbfa00000-0xfebfffff]
[    0.397268] pci_bus 0000:00: resource 8 [mem 0xfed40000-0xfed4bfff]
[    0.397269] pci_bus 0000:01: resource 0 [io  0x5000-0x5fff]
[    0.397271] pci_bus 0000:01: resource 1 [mem 0xf0000000-0xf10fffff]
[    0.397273] pci_bus 0000:01: resource 2 [mem 0xc0000000-0xd1ffffff 64bit
pref]
[    0.397275] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.397276] pci_bus 0000:02: resource 1 [mem 0xf3100000-0xf39fffff]
[    0.397278] pci_bus 0000:02: resource 2 [mem 0xf1800000-0xf1ffffff 64bit
pref]
[    0.397280] pci_bus 0000:03: resource 1 [mem 0xf3000000-0xf30fffff]
[    0.397281] pci_bus 0000:04: resource 0 [io  0x3000-0x3fff]
[    0.397283] pci_bus 0000:04: resource 1 [mem 0xf2800000-0xf2ffffff]
[    0.397284] pci_bus 0000:04: resource 2 [mem 0xf2000000-0xf27fffff 64bit
pref]
[    0.397313] NET: Registered protocol family 2
[    0.397504] TCP established hash table entries: 65536 (order: 7, 524288
bytes)
[    0.397653] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.397774] TCP: Hash tables configured (established 65536 bind 65536)
[    0.397789] TCP: reno registered
[    0.397799] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.397826] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.397888] NET: Registered protocol family 1
[    0.397902] pci 0000:00:02.0: Boot video device
[    0.398365] PCI: CLS 64 bytes, default 64
[    0.398413] Unpacking initramfs...
[    0.457932] Freeing initrd memory: 3408K (ffff880037948000 -
ffff880037c9c000)
[    0.457939] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.457942] software IO TLB [mem 0xa4580000-0xa8580000] (64MB) mapped at
[ffff8800a4580000-ffff8800a857ffff]
[    0.458348] RAPL PMU detected, hw unit 2^-16 Joules, API unit is 2^-32
Joules, 3 fixed counters 163840 ms ovfl timer
[    0.458399] Scanning for low memory corruption every 60 seconds
[    0.458691] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.459104] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.460367] zbud: loaded
[    0.460529] VFS: Disk quotas dquot_6.5.2
[    0.460565] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.460687] msgmni has been set to 15168
[    0.460740] Key type big_key registered
[    0.460891] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor
252)
[    0.460957] io scheduler noop registered
[    0.460961] io scheduler deadline registered
[    0.461005] io scheduler cfq registered (default)
[    0.461144] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
[    0.461566] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.461581] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.461608] vesafb: mode is 1920x1080x32, linelength=3D7680, pages=3D0
[    0.461609] vesafb: scrolling: redraw
[    0.461611] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.461629] vesafb: framebuffer at 0xe0000000, mapped to 0xffffc90004f00=
000,
using 8128k, total 8128k
[    0.615420] Console: switching to colour frame buffer device 240x67
[    0.768602] fb0: VESA VGA frame buffer device
[    0.768622] intel_idle: MWAIT substates: 0x21120
[    0.768623] intel_idle: v0.4 model 0x3A
[    0.768624] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.768951] GHES: HEST is not enabled!
[    0.769028] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.769414] Linux agpgart interface v0.103
[    0.769476] rtc_cmos 00:02: RTC can wake from S4
[    0.769606] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    0.769640] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram,
hpet irqs
[    0.769651] Intel P-state driver initializing.
[    0.769668] Intel pstate controlling: cpu 0
[    0.769689] Intel pstate controlling: cpu 1
[    0.769705] Intel pstate controlling: cpu 2
[    0.769724] Intel pstate controlling: cpu 3
[    0.769742] Intel pstate controlling: cpu 4
[    0.769760] Intel pstate controlling: cpu 5
[    0.769780] Intel pstate controlling: cpu 6
[    0.769796] Intel pstate controlling: cpu 7
[    0.769849] ledtrig-cpu: registered to indicate activity on CPUs
[    0.770049] TCP: cubic registered
[    0.770220] NET: Registered protocol family 10
[    0.770571] NET: Registered protocol family 17
[    0.771183] registered taskstats version 1
[    0.772134]   Magic number: 10:121:634
[    0.772263] rtc_cmos 00:02: setting system clock to 2014-08-30 12:36:05 =
UTC
(1409402165)
[    0.772405] PM: Hibernation image not present or could not be loaded.
[    0.773757] Freeing unused kernel memory: 1128K (ffffffff818df000 -
ffffffff819f9000)
[    0.773760] Write protecting the kernel read-only data: 8192k
[    0.777354] Freeing unused kernel memory: 800K (ffff880001538000 -
ffff880001600000)
[    0.778457] Freeing unused kernel memory: 360K (ffff8800017a6000 -
ffff880001800000)
[    0.788944] random: systemd-tmpfile urandom read with 7 bits of entropy
available
[    0.790991] systemd-udevd[81]: starting version 216
[    0.799037] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at
0x60,0x64 irq 1,12
[    0.800701] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.800713] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.804376] ACPI: bus type USB registered
[    0.804406] usbcore: registered new interface driver usbfs
[    0.804420] usbcore: registered new interface driver hub
[    0.804473] usbcore: registered new device driver usb
[    0.805170] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.805396] sdhci: Secure Digital Host Controller Interface driver
[    0.805397] sdhci: Copyright(c) Pierre Ossman
[    0.805512] ehci-pci: EHCI PCI platform driver
[    0.805621] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    0.805628] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus
number 1
[    0.805647] ehci-pci 0000:00:1a.0: debug port 2
[    0.806167] SCSI subsystem initialized
[    0.807567] libata version 3.00 loaded.
[    0.809557] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[    0.809570] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf3a3a000
[    0.815776] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    0.817965] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    0.818106] hub 1-0:1.0: USB hub found
[    0.818110] hub 1-0:1.0: 3 ports detected
[    0.818308] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    0.818312] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus
number 2
[    0.818323] ehci-pci 0000:00:1d.0: debug port 2
[    0.822211] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[    0.822222] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf3a39000
[    0.831378] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    0.831567] hub 2-0:1.0: USB hub found
[    0.831572] hub 2-0:1.0: 3 ports detected
[    0.831805] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.831810] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus
number 3
[    0.831903] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.831921] xhci_hcd 0000:00:14.0: irq 41 for MSI/MSI-X
[    0.832105] hub 3-0:1.0: USB hub found
[    0.832113] hub 3-0:1.0: 4 ports detected
[    0.832400] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.832404] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus
number 4
[    0.832610] hub 4-0:1.0: USB hub found
[    0.832620] hub 4-0:1.0: 4 ports detected
[    0.832777] usb: failed to peer usb4-port2 and usb3-port1 by location
(usb4-port2:none) (usb3-port1:usb4-port1)
[    0.832779] usb usb4-port2: failed to peer to usb3-port1 (-16)
[    0.832780] usb: port power management may be unreliable
[    0.832837] usb: failed to peer usb4-port3 and usb3-port1 by location
(usb4-port3:none) (usb3-port1:usb4-port1)
[    0.832838] usb usb4-port3: failed to peer to usb3-port1 (-16)
[    0.832894] usb: failed to peer usb4-port4 and usb3-port1 by location
(usb4-port4:none) (usb3-port1:usb4-port1)
[    0.832896] usb usb4-port4: failed to peer to usb3-port1 (-16)
[    0.832965] ahci 0000:00:1f.2: version 3.0
[    0.833064] ahci 0000:00:1f.2: irq 42 for MSI/MSI-X
[    0.833086] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
[    0.844683] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x=
13
impl SATA mode
[    0.844687] ahci 0000:00:1f.2: flags: 64bit ncq ilck stag pm led clo pio
slum part ems sxs apst=20
[    0.858821] scsi0 : ahci
[    0.859207] scsi1 : ahci
[    0.859395] scsi2 : ahci
[    0.859540] scsi3 : ahci
[    0.859685] scsi4 : ahci
[    0.859834] scsi5 : ahci
[    0.859887] ata1: SATA max UDMA/133 abar m2048&#64;0xf3a38000 port 0xf3a=
38100
irq 42
[    0.859890] ata2: SATA max UDMA/133 abar m2048&#64;0xf3a38000 port 0xf3a=
38180
irq 42
[    0.859892] ata3: DUMMY
[    0.859893] ata4: DUMMY
[    0.859896] ata5: SATA max UDMA/133 abar m2048&#64;0xf3a38000 port 0xf3a=
38300
irq 42
[    0.859897] ata6: DUMMY
[    0.864648] firewire_ohci 0000:02:00.3: added OHCI v1.10 device as card =
0, 4
IR + 4 IT contexts, quirks 0x11
[    0.864688] sdhci-pci 0000:02:00.0: SDHCI controller found [1180:e822] (=
rev
8)
[    0.864771] mmc0: no vqmmc regulator found
[    0.864773] mmc0: no vmmc regulator found
[    0.864859] mmc0: SDHCI controller on PCI [0000:02:00.0] using DMA
[    1.124528] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.177900] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.178535] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succee=
ded
[    1.178543] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK)
filtered out
[    1.178951] ata1.00: ATA-8: SAMSUNG MZ7PC128HAFU-000L1, CXM04L1Q, max
UDMA/133
[    1.178958] ata1.00: 250069680 sectors, multi 16: LBA48 NCQ (depth 31/32=
),
AA
[    1.179470] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succee=
ded
[    1.179478] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK)
filtered out
[    1.179827] ata1.00: configured for UDMA/133
[    1.180155] scsi 0:0:0:0: Direct-Access     ATA      SAMSUNG MZ7PC128 4L=
1Q
PQ: 0 ANSI: 5
[    1.249220] hub 1-1:1.0: USB hub found
[    1.249488] hub 1-1:1.0: 6 ports detected
[    1.357919] usb 2-1: new high-speed USB device number 2 using ehci-pci
[    1.364721] firewire_core 0000:02:00.3: created device fw0: GUID
3c970eff28d0b5ff, S400
[    1.457736] tsc: Refined TSC clocksource calibration: 2294.793 MHz
[    1.481903] hub 2-1:1.0: USB hub found
[    1.482069] hub 2-1:1.0: 8 ports detected
[    1.497717] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.502815] ata2.00: ACPI cmd e3/00:10:00:00:00:a0 (IDLE) succeeded
[    1.504364] ata2.00: ACPI cmd e3/00:03:00:00:00:a0 (IDLE) succeeded
[    1.508328] ata2.00: ATAPI: HL-DT-ST DVDRAM GT50N, LT20, max UDMA/33
[    1.513033] ata2.00: ACPI cmd e3/00:10:00:00:00:a0 (IDLE) succeeded
[    1.514546] ata2.00: ACPI cmd e3/00:03:00:00:00:a0 (IDLE) succeeded
[    1.518543] ata2.00: configured for UDMA/33
[    1.527993] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVDRAM GT50N     LT=
20
PQ: 0 ANSI: 5
[    1.551231] usb 1-1.2: new full-speed USB device number 3 using ehci-pci
[    1.640637] hidraw: raw HID events driver (C) Jiri Kosina
[    1.643684] usbcore: registered new interface driver usbhid
[    1.643686] usbhid: USB HID core driver
[    1.644090] input: Razer Razer Imperator as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.0/0003:1532:002F.00=
01/input/input2
[    1.644134] hid-generic 0003:1532:002F.0001: input,hidraw0: USB HID v1.11
Mouse [Razer Razer Imperator] on usb-0000:00:1a.0-1.2/input0
[    1.645164] input: Razer Razer Imperator as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.1/0003:1532:002F.00=
02/input/input3
[    1.645248] hid-generic 0003:1532:002F.0002: input,hidraw1: USB HID v1.11
Keyboard [Razer Razer Imperator] on usb-0000:00:1a.0-1.2/input1
[    1.704519] usb 1-1.4: new full-speed USB device number 4 using ehci-pci
[    1.857552] ata5: SATA link down (SStatus 0 SControl 300)
[    1.863518] sd 0:0:0:0: [sda] 250069680 512-byte logical blocks: (128 GB=
/119
GiB)
[    1.863715] sd 0:0:0:0: [sda] Write Protect is off
[    1.863720] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.863775] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    1.865058]  sda: sda1 sda2 &lt; sda5 sda6 &gt; sda3 sda4
[    1.865712] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.870879] usb 1-1.6: new high-speed USB device number 5 using ehci-pci
[    1.873801] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 =
cdda
tray
[    1.873814] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.874054] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    1.995327] EXT4-fs (sda1): mounted filesystem with ordered data mode. O=
pts:
(null)
[    2.030876] usb 2-1.7: new low-speed USB device number 3 using ehci-pci
[    2.100774] systemd[1]: Cannot add dependency job for unit
display-manager.service, ignoring: Unit display-manager.service failed to l=
oad:
No such file or directory.
[    2.100780] systemd[1]: Cannot add dependency job for unit
bumblebeed.service, ignoring: Unit bumblebeed.service failed to load: No su=
ch
file or directory.
[    2.119637] hid-generic 0003:0765:5010.0003: hiddev0,hidraw2: USB HID v1=
.11
Device [HID 0765:5010] on usb-0000:00:1d.0-1.7/input0
[    2.123652] EXT4-fs (sda1): re-mounted. Opts: data=3Dordered
[    2.134227] usbip_core: module is from the staging directory, the qualit=
y is
unknown, you have been warned.
[    2.134513] usbip_core: USB/IP Core v1.0.0
[    2.136059] usbip_host: module is from the staging directory, the qualit=
y is
unknown, you have been warned.
[    2.136415] usbcore: registered new device driver usbip-host
[    2.136418] usbip_host: USB/IP Host Driver v1.0.0
[    2.143992] systemd-udevd[207]: starting version 216
[    2.170324] input: Lid Switch as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input4
[    2.170484] ACPI: Lid Switch [LID]
[    2.170562] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input5
[    2.170566] ACPI: Sleep Button [SLPB]
[    2.170657] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input6
[    2.170660] ACPI: Power Button [PWRF]
[    2.171876] thermal LNXTHERM:00: registered as thermal_zone0
[    2.171879] ACPI: Thermal Zone [THM0] (46 C)
[    2.172513] ACPI Warning: SystemIO range
0x0000000000000428-0x000000000000042f conflicts with OpRegion
0x0000000000000400-0x000000000000047f (\_SB_.PCI0.LPC_.PMIO)
(20140424/utaddress-258)
[    2.172519] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172523] ACPI Warning: SystemIO range
0x0000000000000540-0x000000000000054f conflicts with OpRegion
0x0000000000000500-0x000000000000057f (\_SB_.PCI0.LPC_.LPIO)
(20140424/utaddress-258)
[    2.172527] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172528] ACPI Warning: SystemIO range
0x0000000000000530-0x000000000000053f conflicts with OpRegion
0x0000000000000500-0x000000000000057f (\_SB_.PCI0.LPC_.LPIO)
(20140424/utaddress-258)
[    2.172532] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172533] ACPI Warning: SystemIO range
0x0000000000000500-0x000000000000052f conflicts with OpRegion
0x0000000000000500-0x000000000000057f (\_SB_.PCI0.LPC_.LPIO)
(20140424/utaddress-258)
[    2.172537] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[    2.172538] lpc_ich: Resource conflict(s) found affecting gpio_ich
[    2.172994] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.173141] pps_core: LinuxPPS API ver. 1 registered
[    2.173143] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti &lt;<a href=3D"mailto:giometti&#64;linux.it">giometti&#64;linux.it=
</a>&gt;
[    2.173965] PTP clock support registered
[    2.176876] mei_me 0000:00:16.0: irq 43 for MSI/MSI-X
[    2.177688] tpm_tis 00:05: 1.2 TPM (device-id 0x0, rev-id 78)
[    2.182525] wmi: Mapper loaded
[    2.182982] e1000e: Intel(R) PRO/1000 Network Driver - 2.3.2-k
[    2.182984] e1000e: Copyright(c) 1999 - 2014 Intel Corporation.
[    2.184068] ACPI: Battery Slot [BAT0] (battery present)
[    2.184454] ACPI: AC Adapter [AC] (on-line)
[    2.185188] [drm] Initialized drm 1.1.0 20060810
[    2.186188] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) se=
t to
dynamic conservative mode
[    2.186211] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    2.186530] Non-volatile memory driver v1.3
[    2.196965] cfg80211: Calling CRDA to update world regulatory domain
[    2.198631] microcode: CPU0 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198887] microcode: CPU1 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198904] microcode: CPU2 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198917] microcode: CPU3 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198930] microcode: CPU4 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198940] microcode: CPU5 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198951] microcode: CPU6 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.198964] microcode: CPU7 sig=3D0x306a9, pf=3D0x10, revision=3D0x12
[    2.199006] microcode: Microcode Update Driver: v2.00
&lt;<a href=3D"mailto:tigran&#64;aivazian.fsnet.co.uk">tigran&#64;aivazian.=
fsnet.co.uk</a>&gt;, Peter Oruba
[    2.199661] input: PC Speaker as /devices/platform/pcspkr/input/input7
[    2.201928] Intel(R) Wireless WiFi driver for Linux, in-tree:
[    2.201933] Copyright(c) 2003- 2014 Intel Corporation
[    2.202170] iwlwifi 0000:03:00.0: can't disable ASPM; OS doesn't have AS=
PM
control
[    2.202390] iwlwifi 0000:03:00.0: irq 45 for MSI/MSI-X
[    2.206761] iwlwifi 0000:03:00.0: loaded firmware version 18.168.6.1 op_=
mode
iwldvm
[    2.208275] media: Linux media interface: v0.10
[    2.208354] Bluetooth: Core ver 2.19
[    2.208367] NET: Registered protocol family 31
[    2.208369] Bluetooth: HCI device and connection manager initialized
[    2.208375] Bluetooth: HCI socket layer initialized
[    2.208378] Bluetooth: L2CAP socket layer initialized
[    2.208386] Bluetooth: SCO socket layer initialized
[    2.208544] AVX version of gcm_enc/dec engaged.
[    2.208623] thinkpad_acpi: ThinkPad ACPI Extras v0.25
[    2.208625] thinkpad_acpi: <a href=3D"http://ibm-acpi.sf.net/">http://ib=
m-acpi.sf.net/</a>
[    2.208627] thinkpad_acpi: ThinkPad BIOS G5ET29WW (1.07 ), EC unknown
[    2.208629] thinkpad_acpi: Lenovo ThinkPad W530, model 2438CTO
[    2.209822] mousedev: PS/2 mouse device common for all mice
[    2.214317] thinkpad_acpi: detected a 16-level brightness capable ThinkP=
ad
[    2.214433] thinkpad_acpi: radio switch found; radios are enabled
[    2.214562] thinkpad_acpi: This ThinkPad has standard ACPI backlight
brightness control, supported by the ACPI video driver
[    2.214563] thinkpad_acpi: Disabling thinkpad-acpi brightness events by
default...
[    2.216617] Linux video capture interface: v2.00
[    2.217547] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[    2.217947] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[    2.218272] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[    2.218277] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG_.=
VID_
handle
[    2.218294] checking generic (e0000000 7f0000) vs hw (c0000000 10000000)
[    2.218296] checking generic (e0000000 7f0000) vs hw (d0000000 2000000)
[    2.218324] nouveau 0000:01:00.0: enabling device (0004 -&gt; 0007)
[    2.218547] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73b0a2
[    2.218549] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    2.218551] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    2.218580] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image.=
..
[    2.218591] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    2.218593] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    2.218683] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    2.218684] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    2.224385] uvcvideo: Found UVC 1.00 device Integrated Camera (04f2:b2ea)
[    2.226413] input: Integrated Camera as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.6/1-1.6:1.0/input/input10
[    2.226487] usbcore: registered new interface driver uvcvideo
[    2.226489] USB Video Class driver (1.1.1)
[    2.230675] Adding 7811068k swap on /dev/sda5.  Priority:-1 extents:1
across:7811068k SSFS
[    2.232775] iwlwifi 0000:03:00.0: CONFIG_IWLWIFI_DEBUG disabled
[    2.232778] iwlwifi 0000:03:00.0: CONFIG_IWLWIFI_DEBUGFS disabled
[    2.232780] iwlwifi 0000:03:00.0: CONFIG_IWLWIFI_DEVICE_TRACING enabled
[    2.232783] iwlwifi 0000:03:00.0: Detected Intel(R) Centrino(R) Advanced=
-N
6205 AGN, REV=3D0xB0
[    2.232920] iwlwifi 0000:03:00.0: L1 Enabled; Disabling L0S
[    2.240171] intel_rapl: RAPL domain dram detection failed
[    2.246664] iTCO_vendor_support: vendor-support=3D0
[    2.247573] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    2.247619] iTCO_wdt: Found a Panther Point TCO device (Version=3D2,
TCOBASE=3D0x0460)
[    2.247778] iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=3D0)
[    2.447711] e1000e 0000:00:19.0 eth0: registered PHC clock
[    2.447716] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1)
3c:97:0e:28:d0:b5
[    2.447719] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connecti=
on
[    2.447757] e1000e 0000:00:19.0 eth0: MAC: 10, PHY: 11, PBA No: 1000FF-0=
FF
[    2.457461] Switched to clocksource tsc
[    2.488048] i801_smbus 0000:00:1f.3: SMBus using PCI Interrupt
[    2.594850] psmouse serio1: alps: Unknown ALPS touchpad: E7=3D10 00 64, =
EC=3D10
00 64
[    2.927009] psmouse serio1: trackpoint: IBM TrackPoint firmware: 0x0e,
buttons: 3/3
[    2.940802] input: TPPS/2 IBM TrackPoint as
/devices/platform/i8042/serio1/input/input8
[    3.134963] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is
unblocked
[    3.134996] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    3.134999] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    3.135113] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    3.135117] nouveau  [   VBIOS][0000:01:00.0] version 80.07.31.00.0d
[    3.135399] usbcore: registered new interface driver btusb
[    3.135723] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    3.135732] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    3.135911] thinkpad_acpi: Standard ACPI backlight interface available, =
not
loading native one
[    3.135983] thinkpad_acpi: Console audio control enabled, mode: monitor
(read only)
[    3.136377] bluetooth hci0: Direct firmware load failed with error -2
[    3.136378] bluetooth hci0: Falling back to user helper
[    3.137749] input: ThinkPad Extra Buttons as
/devices/platform/thinkpad_acpi/input/input9
[    3.138925] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
[    3.142963] Bluetooth: hci0: BCM: patch brcm/BCM20702A0-0a5c-21e6.hcd not
found
[    3.155354] EXT4-fs (sda6): mounted filesystem with ordered data mode. O=
pts:
data=3Dordered
[    3.162197] systemd-journald[187]: Received request to flush runtime jou=
rnal
from PID 1
[    3.164029] systemd-udevd[216]: renamed network interface eth0 to enp0s25
[    3.190806] systemd-udevd[227]: renamed network interface wlan0 to wlp3s0
[    3.278309] random: nonblocking pool is initialized
[    3.379589] nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
[    3.379601] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    3.379647] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    3.379649] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    3.379650] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    3.380987] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    3.414155] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / extern=
al
[    3.414169] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    3.414180] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    3.414212] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz memory
810 MHz=20
[    3.414232] nouveau  [     CLK][0000:01:00.0] 0f: core 270-745 MHz memory
1800 MHz=20
[    3.414375] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 648
MHz=20
[    3.441165] [TTM] Zone  kernel: Available graphics memory: 3884246 kiB
[    3.441167] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    3.441168] [TTM] Initializing pool allocator
[    3.441172] [TTM] Initializing DMA pool allocator
[    3.441183] nouveau  [     DRM] VRAM: 2048 MiB
[    3.441184] nouveau  [     DRM] GART: 1048576 MiB
[    3.441187] nouveau  [     DRM] TMDS table version 2.0
[    3.441188] nouveau  [     DRM] DCB version 4.0
[    3.441190] nouveau  [     DRM] DCB outp 00: 01800f23 00010034
[    3.441191] nouveau  [     DRM] DCB outp 01: 02811f00 00000000
[    3.441192] nouveau  [     DRM] DCB outp 02: 02822fa6 0f420010
[    3.441193] nouveau  [     DRM] DCB outp 03: 02822f62 00020010
[    3.441194] nouveau  [     DRM] DCB outp 04: 04833fb6 0f220010
[    3.441195] nouveau  [     DRM] DCB outp 05: 04833f72 00020010
[    3.441196] nouveau  [     DRM] DCB outp 06: 08844fc6 0f220010
[    3.441197] nouveau  [     DRM] DCB outp 07: 08844f82 00020010
[    3.441198] nouveau  [     DRM] DCB conn 00: 00000040
[    3.441200] nouveau  [     DRM] DCB conn 01: 00000100
[    3.441201] nouveau  [     DRM] DCB conn 02: 00010246
[    3.441202] nouveau  [     DRM] DCB conn 03: 00020346
[    3.441203] nouveau  [     DRM] DCB conn 04: 01000446
[    3.442852] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.442853] [drm] Driver supports precise vblank timestamp query.
[    3.448215] nouveau  [     DRM] MM: using COPY for buffer copies
[    3.619879] nouveau 0000:01:00.0: No connectors reported connected with
modes
[    3.619884] [drm] Cannot find any crtc or sizes - going 1024x768
[    3.653439] nouveau  [     DRM] allocated 1024x768 fb: 0x80000, bo
ffff880231218800
[    3.653536] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[    3.653538] nouveau 0000:01:00.0: registered panic notifier
[    3.686525] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[    3.687111] [drm] Memory usable by graphics device =3D 2048M
[    3.687113] [drm] Replacing VGA console driver
[    3.687115] checking generic (e0000000 7f0000) vs hw (e0000000 10000000)
[    3.687116] fb: switching to inteldrmfb from VESA VGA
[    3.687142] Console: switching to colour dummy device 80x25
[    3.692577] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    3.706661] i915 0000:00:02.0: irq 47 for MSI/MSI-X
[    3.706674] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.706684] [drm] Driver supports precise vblank timestamp query.
[    3.706786] vga_switcheroo: enabled
[    3.706852] vgaarb: device changed decodes:
PCI:0000:01:00.0,olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    3.706855] vgaarb: device changed decodes:
PCI:0000:00:02.0,olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    3.730030] [drm] Wrong MCH_SSKPD value: 0x20100406
[    3.730034] [drm] This can cause pipe underruns and display issues.
[    3.730035] [drm] Please upgrade your BIOS to fix this.
[    3.793288] e1000e 0000:00:19.0: irq 44 for MSI/MSI-X
[    3.793451] IPv6: ADDRCONF(NETDEV_UP): enp0s25: link is not ready
[    3.796500] [drm] GMBUS [i915 gmbus vga] timed out, falling back to bit
banging on pin 2
[    3.798109] iwlwifi 0000:03:00.0: L1 Enabled; Disabling L0S
[    3.804595] iwlwifi 0000:03:00.0: Radio type=3D0x1-0x2-0x0
[    3.811772] fbcon: inteldrmfb (fb0) is primary device
[    4.080312] iwlwifi 0000:03:00.0: L1 Enabled; Disabling L0S
[    4.086804] iwlwifi 0000:03:00.0: Radio type=3D0x1-0x2-0x0
[    4.166321] [drm:cpt_set_fifo_underrun_reporting] *ERROR* uncleared pch =
fifo
underrun on pch transcoder A
[    4.166323] [drm:cpt_serr_int_handler] *ERROR* PCH transcoder A FIFO
underrun
[    4.179171] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[    4.514578] cfg80211: Calling CRDA to update world regulatory domain
[    4.621262] cfg80211: Calling CRDA to update world regulatory domain
[    4.703396] Console: switching to colour frame buffer device 240x67
[    4.713102] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    4.719046] cfg80211: Calling CRDA to update world regulatory domain
[    4.731807] ACPI: Video Device [VID] (multi-head: yes  rom: no  post: no)
[    4.754277] acpi device:00: registered as cooling_device9
[    4.754447] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
[    4.754873] ACPI: Video Device [VID1] (multi-head: yes  rom: yes  post: =
no)
[    4.757055] acpi device:0a: registered as cooling_device10
[    4.757202] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:09/LNXVIDEO:01/input/inp=
ut12
[    4.757361] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on mi=
nor
1
[    4.758861] snd_hda_intel 0000:00:1b.0: irq 48 for MSI/MSI-X
[    4.772580] sound hdaudioC0D0: autoconfig: line_outs=3D1
(0x14/0x0/0x0/0x0/0x0) type:speaker
[    4.772585] sound hdaudioC0D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
[    4.772587] sound hdaudioC0D0:    hp_outs=3D2 (0x15/0x1b/0x0/0x0/0x0)
[    4.772589] sound hdaudioC0D0:    mono: mono_out=3D0x0
[    4.772591] sound hdaudioC0D0:    inputs:
[    4.772593] sound hdaudioC0D0:      Mic=3D0x18
[    4.772609] sound hdaudioC0D0:      Dock Mic=3D0x19
[    4.772613] sound hdaudioC0D0:      Internal Mic=3D0x12
[    4.780717] input: HDA Digital PCBeep as
/devices/pci0000:00/0000:00:1b.0/sound/card0/hdaudioC0D0/input13
[    4.781015] input: HDA Intel PCH Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input14
[    4.781126] input: HDA Intel PCH Dock Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input15
[    4.781241] input: HDA Intel PCH Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input16
[    4.781386] input: HDA Intel PCH Dock Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input17
[    4.979640] cfg80211: Calling CRDA to update world regulatory domain
[    5.356171] [drm] Enabling RC6 states: RC6 on, RC6p on, RC6pp off
[    7.280500] wlp3s0: authenticate with 14:0c:76:95:63:5f
[    7.288194] wlp3s0: send auth to 14:0c:76:95:63:5f (try 1/3)
[    7.301077] wlp3s0: authenticated
[    7.304728] wlp3s0: associate with 14:0c:76:95:63:5f (try 1/3)
[    7.312726] wlp3s0: RX AssocResp from 14:0c:76:95:63:5f (capab=3D0x411
status=3D0 aid=3D1)
[    7.337192] wlp3s0: associated
[    7.337233] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[    9.337075] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[    9.338004] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   10.403837] thinkpad_acpi: EC reports that Thermal Table has changed
[   13.803170] thinkpad_acpi: EC reports that Thermal Table has changed
[   15.582492] fuse init (API version 7.23)
[   20.527911] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   20.528467] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   21.824661] thinkpad_acpi: EC reports that Thermal Table has changed
[   36.031425] thinkpad_acpi: EC reports that Thermal Table has changed
[   51.328953] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
[   51.330011] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95=
)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409403414.338F2Bd1.7357--

--===============0418973368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0418973368==--
