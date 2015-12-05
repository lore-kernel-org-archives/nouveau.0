From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: bad things happened, 4.4-rc3, nve7, virgl test server
Date: Sat, 5 Dec 2015 19:50:52 +1000
Message-ID: <5662B37C.7060706@gmail.com>
References: <CAPM=9tyP5f5yH+6ROOaGGkjGcGMLM-eV5gfRQCEgqeeBhgZ4dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1113805870=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tyP5f5yH+6ROOaGGkjGcGMLM-eV5gfRQCEgqeeBhgZ4dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1113805870==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WlDfHkD2D1L7Mjx5dJiEtv0cbLuBUP8OB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WlDfHkD2D1L7Mjx5dJiEtv0cbLuBUP8OB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/05/2015 06:12 PM, Dave Airlie wrote:
> [    0.000000] microcode: CPU0 microcode updated early to revision
> 0x1b, date =3D 2014-05-29
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 4.4.0-rc3+ (airlied@crackbookpro) (gcc
> version 5.1.1 20150618 (Red Hat 5.1.1-4) (GCC) ) #44 SMP Sat Dec 5
> 16:05:39 AEST 2015
> [    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-4.4.0-rc3+
> root=3DUUID=3Da390fe9d-8bba-4163-b5d0-0611437dbb3a ro LANG=3Den_US.UTF-=
8
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x01: 'x87 floating
> point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x02: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x04: 'AVX registers'
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is
> 832 bytes, using 'standard' format.
> [    0.000000] x86/fpu: Using 'eager' FPU context switches.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000008dfff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000000008e000-0x000000000008ffff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x0000000000090000-0x000000000009ffff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000bffff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001fffffff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x0000000020200000-0x0000000040003fff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x0000000040004000-0x0000000040004fff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x0000000040005000-0x000000008ad13fff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000008ad14000-0x000000008ad52fff] A=
CPI NVS
> [    0.000000] BIOS-e820: [mem 0x000000008ad53000-0x000000008ad68fff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000008ad69000-0x000000008ad8efff] A=
CPI data
> [    0.000000] BIOS-e820: [mem 0x000000008ad8f000-0x000000008ae3afff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000008ae3b000-0x000000008ae8efff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x000000008ae8f000-0x000000008aecdfff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000008aece000-0x000000008aefefff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x000000008aeff000-0x000000008af91fff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000008af92000-0x000000008affefff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x000000008afff000-0x000000008affffff] u=
sable
> [    0.000000] BIOS-e820: [mem 0x000000008b000000-0x000000008f9fffff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x00000000e00f8000-0x00000000e00f8fff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x00000000ffe70000-0x00000000ffe9ffff] r=
eserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000046f5fffff] u=
sable
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] e820: update [mem 0x8944f190-0x89464dcf] usable =3D=3D> =
usable
> [    0.000000] extended physical RAM map:
> [    0.000000] reserve setup_data: [mem
> 0x0000000000000000-0x000000000008dfff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000000008e000-0x000000000008ffff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x0000000000090000-0x000000000009ffff] usable
> [    0.000000] reserve setup_data: [mem
> 0x00000000000a0000-0x00000000000bffff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x0000000000100000-0x000000001fffffff] usable
> [    0.000000] reserve setup_data: [mem
> 0x0000000020000000-0x00000000201fffff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x0000000020200000-0x0000000040003fff] usable
> [    0.000000] reserve setup_data: [mem
> 0x0000000040004000-0x0000000040004fff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x0000000040005000-0x000000008944f18f] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008944f190-0x0000000089464dcf] usable
> [    0.000000] reserve setup_data: [mem
> 0x0000000089464dd0-0x000000008ad13fff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008ad14000-0x000000008ad52fff] ACPI NVS
> [    0.000000] reserve setup_data: [mem
> 0x000000008ad53000-0x000000008ad68fff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008ad69000-0x000000008ad8efff] ACPI data
> [    0.000000] reserve setup_data: [mem
> 0x000000008ad8f000-0x000000008ae3afff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008ae3b000-0x000000008ae8efff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x000000008ae8f000-0x000000008aecdfff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008aece000-0x000000008aefefff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x000000008aeff000-0x000000008af91fff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008af92000-0x000000008affefff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x000000008afff000-0x000000008affffff] usable
> [    0.000000] reserve setup_data: [mem
> 0x000000008b000000-0x000000008f9fffff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x00000000e00f8000-0x00000000e00f8fff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x00000000fed1c000-0x00000000fed1ffff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x00000000ffe70000-0x00000000ffe9ffff] reserved
> [    0.000000] reserve setup_data: [mem
> 0x0000000100000000-0x000000046f5fffff] usable
> [    0.000000] efi: EFI v1.10 by Apple
> [    0.000000] efi:  ACPI=3D0x8ad8e000  ACPI 2.0=3D0x8ad8e014  SMBIOS=3D=
0x8ad1b000
> [    0.000000] SMBIOS 2.4 present.
> [    0.000000] DMI: Apple Inc. MacBookPro10,1/Mac-C3EC7CD22292981F,
> BIOS MBP101.88Z.00EE.B02.1208081132 08/08/2012
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> =
reserved
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x46f600 max_arch_pfn =3D 0x400000000=

> [    0.000000] MTRR default type: write-back
> [    0.000000] MTRR fixed ranges enabled:
> [    0.000000]   00000-9FFFF write-back
> [    0.000000]   A0000-BFFFF uncachable
> [    0.000000]   C0000-DFFFF write-protect
> [    0.000000]   E0000-FFFFF uncachable
> [    0.000000] MTRR variable ranges enabled:
> [    0.000000]   0 base 0C0000000 mask FC0000000 uncachable
> [    0.000000]   1 base 0A0000000 mask FE0000000 uncachable
> [    0.000000]   2 base 090000000 mask FF0000000 uncachable
> [    0.000000]   3 base 08C000000 mask FFC000000 uncachable
> [    0.000000]   4 base 08B000000 mask FFF000000 uncachable
> [    0.000000]   5 disabled
> [    0.000000]   6 disabled
> [    0.000000]   7 disabled
> [    0.000000]   8 disabled
> [    0.000000]   9 disabled
> [    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC=
- WT
> [    0.000000] e820: last_pfn =3D 0x8b000 max_arch_pfn =3D 0x400000000
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size =
24576
> [    0.000000] BRK [0x02cff000, 0x02cfffff] PGTABLE
> [    0.000000] BRK [0x02d00000, 0x02d00fff] PGTABLE
> [    0.000000] BRK [0x02d01000, 0x02d01fff] PGTABLE
> [    0.000000] BRK [0x02d02000, 0x02d02fff] PGTABLE
> [    0.000000] BRK [0x02d03000, 0x02d03fff] PGTABLE
> [    0.000000] BRK [0x02d04000, 0x02d04fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x3edda000-0x3fffafff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000000008AD8E014 000024 (v02 APPLE )
> [    0.000000] ACPI: XSDT 0x000000008AD8E1C0 0000B4 (v01 APPLE
> Apple00  00000000      01000013)
> [    0.000000] ACPI: FACP 0x000000008AD8C000 0000F4 (v04 APPLE
> Apple00  00000000 Loki 0000005F)
> [    0.000000] ACPI: DSDT 0x000000008AD82000 004D5C (v01 APPLE
> MacBookP 00100001 INTL 20100915)
> [    0.000000] ACPI: FACS 0x000000008AD1E000 000040
> [    0.000000] ACPI: FACS 0x000000008AD1E000 000040
> [    0.000000] ACPI: HPET 0x000000008AD8B000 000038 (v01 APPLE
> Apple00  00000001 Loki 0000005F)
> [    0.000000] ACPI: APIC 0x000000008AD8A000 0000BC (v02 APPLE
> Apple00  00000001 Loki 0000005F)
> [    0.000000] ACPI: SBST 0x000000008AD88000 000030 (v01 APPLE
> Apple00  00000001 Loki 0000005F)
> [    0.000000] ACPI: ECDT 0x000000008AD87000 000053 (v01 APPLE
> Apple00  00000001 Loki 0000005F)
> [    0.000000] ACPI: SSDT 0x000000008AD7F000 00053A (v01 APPLE
> SataAhci 00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD7E000 000024 (v01 APPLE
> SmcDppt  00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD79000 000D3E (v01 APPLE  UsbPpt
>   00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD77000 000159 (v02 APPLE  IGHda
>   00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD75000 000032 (v01 APPLE  SsdtS3
>   00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD73000 0015EB (v02 APPLE
> SsdtIGPU 00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD6E000 0019AA (v01 APPLE
> TbtPEG11 00001000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD6D000 000615 (v01 PmRef
> Cpu0Ist  00003000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD6C000 000B3D (v01 PmRef  CpuPm
>   00003000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD6B000 000315 (v01 PmRef
> Cpu0Tst  00003000 INTL 20100915)
> [    0.000000] ACPI: SSDT 0x000000008AD6A000 00037A (v01 PmRef  ApTst
>   00003000 INTL 20100915)
> [    0.000000] ACPI: DMAR 0x000000008AD69000 000088 (v01 APPLE  IVB
>   00000001 AAPL 00000001)
> [    0.000000] ACPI: MCFG 0x000000008AD89000 00003C (v01 APPLE
> Apple00  00000001 Loki 0000005F)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x000000046f5ff=
fff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x46f5de000-0x46f5effff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000046f5fffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000008dfff]
> [    0.000000]   node   0: [mem 0x0000000000090000-0x000000000009ffff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x000000001fffffff]
> [    0.000000]   node   0: [mem 0x0000000020200000-0x0000000040003fff]
> [    0.000000]   node   0: [mem 0x0000000040005000-0x000000008ad13fff]
> [    0.000000]   node   0: [mem 0x000000008ad53000-0x000000008ad68fff]
> [    0.000000]   node   0: [mem 0x000000008ad8f000-0x000000008ae3afff]
> [    0.000000]   node   0: [mem 0x000000008ae8f000-0x000000008aecdfff]
> [    0.000000]   node   0: [mem 0x000000008aeff000-0x000000008af91fff]
> [    0.000000]   node   0: [mem 0x000000008afff000-0x000000008affffff]
> [    0.000000]   node   0: [mem 0x0000000100000000-0x000000046f5fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000046=
f5fffff]
> [    0.000000] On node 0 totalpages: 4170309
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 22 pages reserved
> [    0.000000]   DMA zone: 3997 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 8819 pages used for memmap
> [    0.000000]   DMA32 zone: 564392 pages, LIFO batch:31
> [    0.000000]   Normal zone: 56280 pages used for memmap
> [    0.000000]   Normal zone: 3601920 pages, LIFO batch:31
> [    0.000000] tboot: non-0 tboot_addr but it is not of type E820_RESER=
VED
> [    0.000000] Reserving Intel graphics stolen memory at 0x8ba00000-0x8=
f9fffff
> [    0.000000] ACPI: PM-Timer IO Port: 0x408
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
> [    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GS=
I 0-23
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)=

> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high lev=
el)
> [    0.000000] ACPI: IRQ0 used by override.
> [    0.000000] ACPI: IRQ9 used by override.
> [    0.000000] Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
> [    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x0008e000-0x0008ffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000bffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x000c0000-0x000fffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x20000000-0x201fffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x40004000-0x40004fff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8944f000-0x8944ffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x89464000-0x89464fff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8ad14000-0x8ad52fff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8ad69000-0x8ad8efff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8ae3b000-0x8ae8efff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8aece000-0x8aefefff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8af92000-0x8affefff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8b000000-0x8f9fffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0x8fa00000-0xe00f7fff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0xe00f8000-0xe00f8fff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0xe00f9000-0xfed1bfff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xffe6ffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0xffe70000-0xffe9ffff=
]
> [    0.000000] PM: Registered nosave memory: [mem 0xffea0000-0xffffffff=
]
> [    0.000000] e820: [mem 0x8fa00000-0xe00f7fff] available for PCI devi=
ces
> [    0.000000] Booting paravirtualized kernel on bare hardware
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff
> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.000000] setup_percpu: NR_CPUS:128 nr_cpumask_bits:128
> nr_cpu_ids:8 nr_node_ids:1
> [    0.000000] PERCPU: Embedded 34 pages/cpu @ffff88046f200000 s99976
> r8192 d31096 u262144
> [    0.000000] pcpu-alloc: s99976 r8192 d31096 u262144 alloc=3D1*209715=
2
> [    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
> [    0.000000] Built 1 zonelists in Node order, mobility grouping on.
> Total pages: 4105124
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line: BOOT_IMAGE=3D/vmlinuz-4.4.0-rc3+
> root=3DUUID=3Da390fe9d-8bba-4163-b5d0-0611437dbb3a ro LANG=3Den_US.UTF-=
8
> [    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
> [    0.000000] Memory: 16220788K/16681236K available (7917K kernel
> code, 1339K rwdata, 3424K rodata, 1516K init, 14508K bss, 460448K
> reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
8, Nodes=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU lockdep checking is enabled.
> [    0.000000] Build-time adjustment of leaf fanout to 64.
> [    0.000000] RCU restricting CPUs from NR_CPUS=3D128 to nr_cpu_ids=3D=
8.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D64, nr_cpu=
_ids=3D8
> [    0.000000] NR_IRQS:8448 nr_irqs:488 16
> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat,
> Inc., Ingo Molnar
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.000000] ... CHAINHASH_SIZE:          32768
> [    0.000000]  memory used by lock dependency info: 8159 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 133484882848 ns
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 2294.735 MHz processor
> [    0.000074] Calibrating delay loop (skipped), value calculated
> using timer frequency.. 4589.47 BogoMIPS (lpj=3D2294735)
> [    0.000085] pid_max: default: 32768 minimum: 301
> [    0.000097] ACPI: Core revision 20150930
> [    0.026232] ACPI: 12 ACPI AML tables successfully acquired and loade=
d
> [    0.035290] Security Framework initialized
> [    0.035296] SELinux:  Initializing.
> [    0.035343] SELinux:  Starting in permissive mode
> [    0.036740] Dentry cache hash table entries: 2097152 (order: 12,
> 16777216 bytes)
> [    0.041203] Inode-cache hash table entries: 1048576 (order: 11,
> 8388608 bytes)
> [    0.043122] Mount-cache hash table entries: 32768 (order: 6, 262144 =
bytes)
> [    0.043153] Mountpoint-cache hash table entries: 32768 (order: 6,
> 262144 bytes)
> [    0.044318] Initializing cgroup subsys io
> [    0.044348] Initializing cgroup subsys devices
> [    0.044376] Initializing cgroup subsys freezer
> [    0.044403] Initializing cgroup subsys net_cls
> [    0.044410] Initializing cgroup subsys perf_event
> [    0.044448] CPU: Physical Processor ID: 0
> [    0.044453] CPU: Processor Core ID: 0
> [    0.044846] mce: CPU supports 9 MCE banks
> [    0.044878] CPU0: Thermal monitoring enabled (TM1)
> [    0.044895] process: using mwait in idle threads
> [    0.044902] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
> [    0.044907] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
> [    0.045467] Freeing SMP alternatives memory: 28K (ffffffff81ecb000
> - ffffffff81ed2000)
> [    0.051442] ftrace: allocating 27581 entries in 108 pages
> [    0.065144] DMAR: Host address width 36
> [    0.065151] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
> [    0.065194] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap
> c0000020e60262 ecap f0101a
> [    0.065203] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
> [    0.065214] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap
> c9008020660262 ecap f0105a
> [    0.065222] DMAR: RMRR base: 0x0000008b800000 end: 0x0000008f9fffff
> [    0.065229] DMAR-IR: IOAPIC id 0 under DRHD base  0xfed91000 IOMMU 1=

> [    0.065235] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
> [    0.065241] DMAR-IR: [Firmware Bug]: ioapic 2 has no mapping iommu,
> interrupt remapping will be disabled
> [    0.065264] DMAR-IR: Not enabling interrupt remapping
> [    0.065276] DMAR-IR: Failed to enable irq remapping. You are
> vulnerable to irq-injection attacks.
> [    0.065362] x2apic: IRQ remapping doesn't support X2APIC mode
> [    0.065980] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin=
2=3D-1
> [    0.075995] TSC deadline timer enabled
> [    0.076000] smpboot: CPU0: Intel(R) Core(TM) i7-3615QM CPU @
> 2.30GHz (family: 0x6, model: 0x3a, stepping: 0x9)
> [    0.076039] Performance Events: PEBS fmt1+, 16-deep LBR, IvyBridge
> events, full-width counters, Intel PMU driver.
> [    0.076076] ... version:                3
> [    0.076081] ... bit width:              48
> [    0.076085] ... generic registers:      4
> [    0.076090] ... value mask:             0000ffffffffffff
> [    0.076095] ... max period:             0000ffffffffffff
> [    0.076100] ... fixed-purpose events:   3
> [    0.076104] ... event mask:             000000070000000f
> [    0.078043] x86: Booting SMP configuration:
> [    0.078050] .... node  #0, CPUs:      #1
> [    0.089458] microcode: CPU1 microcode updated early to revision
> 0x1b, date =3D 2014-05-29
> [    0.092199] NMI watchdog: enabled on all CPUs, permanently consumes
> one hw-PMU counter.
> [    0.092483]  #2
> [    0.103883] microcode: CPU2 microcode updated early to revision
> 0x1b, date =3D 2014-05-29
> [    0.106633]  #3
> [    0.118043] microcode: CPU3 microcode updated early to revision
> 0x1b, date =3D 2014-05-29
> [    0.120799]  #4 #5 #6 #7
> [    0.175665] x86: Booted up 1 node, 8 CPUs
> [    0.175676] smpboot: Total of 8 processors activated (36715.76 BogoM=
IPS)
> [    0.183997] devtmpfs: initialized
> [    0.184656] PM: Registering ACPI NVS region [mem
> 0x8ad14000-0x8ad52fff] (258048 bytes)
> [    0.184914] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.185139] atomic64_test: passed for x86-64 platform with CX8 and w=
ith SSE
> [    0.185207] RTC time: 16:26:44, date: 12/05/15
> [    0.185632] NET: Registered protocol family 16
> [    0.191002] cpuidle: using governor ladder
> [    0.197006] cpuidle: using governor menu
> [    0.197157] ACPI: bus type PCI registered
> [    0.197164] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.=
5
> [    0.197377] PCI: MMCONFIG for domain 0000 [bus 00-9b] at [mem
> 0xe0000000-0xe9bfffff] (base 0xe0000000)
> [    0.197387] PCI: not using MMCONFIG
> [    0.197392] PCI: Using configuration type 1 for base access
> [    0.198016] perf_event_intel: PMU erratum BJ122, BV98, HSD29 worked
> around, HT is on
> [    0.206969] ACPI: Added _OSI(Module Device)
> [    0.206976] ACPI: Added _OSI(Processor Device)
> [    0.206981] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.206987] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.212480] ACPI : EC: EC description table is found, configuring bo=
ot EC
> [    0.212517] ACPI : EC: EC started
> [    0.229120] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
> [    0.230183] ACPI: Dynamic OEM Table Load:
> [    0.230212] ACPI: SSDT 0xFFFF88045CB5A000 0008AD (v01 PmRef
> Cpu0Cst  00003001 INTL 20100915)
> [    0.232393] ACPI: Dynamic OEM Table Load:
> [    0.232420] ACPI: SSDT 0xFFFF88045CAFCC00 0003A4 (v01 PmRef  ApIst
>   00003000 INTL 20100915)
> [    0.234336] ACPI: Dynamic OEM Table Load:
> [    0.234361] ACPI: SSDT 0xFFFF88045CB0AE00 000119 (v01 PmRef  ApCst
>   00003000 INTL 20100915)
> [    0.239461] ACPI: Interpreter enabled
> [    0.239473] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep
> State [\_S1_] (20150930/hwxface-580)
> [    0.239486] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep
> State [\_S2_] (20150930/hwxface-580)
> [    0.239539] ACPI: (supports S0 S3 S4 S5)
> [    0.239544] ACPI: Using IOAPIC for interrupt routing
> [    0.239609] PCI: MMCONFIG for domain 0000 [bus 00-9b] at [mem
> 0xe0000000-0xe9bfffff] (base 0xe0000000)
> [    0.240777] PCI: MMCONFIG at [mem 0xe0000000-0xe9bfffff] reserved
> in ACPI motherboard resources
> [    0.240798] PCI: Using host bridge windows from ACPI; if necessary,
> use "pci=3Dnocrs" and report a bug
> [    0.259945] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.259957] acpi PNP0A08:00: _OSC: OS assumes control of
> [PCIeHotplug SHPCHotplug AER PCIeCapability]
> [    0.260023] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain
> 0000 [bus 00-9b] only partially covers this bridge
> [    0.261036] PCI host bridge to bus 0000:00
> [    0.261044] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wi=
ndow]
> [    0.261051] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wi=
ndow]
> [    0.261057] pci_bus 0000:00: root bus resource [mem
> 0x000a0000-0x000bffff window]
> [    0.261066] pci_bus 0000:00: root bus resource [mem
> 0x000c0000-0x000c3fff window]
> [    0.261074] pci_bus 0000:00: root bus resource [mem
> 0x000c4000-0x000c7fff window]
> [    0.261083] pci_bus 0000:00: root bus resource [mem
> 0x000c8000-0x000cbfff window]
> [    0.261092] pci_bus 0000:00: root bus resource [mem
> 0x000cc000-0x000cffff window]
> [    0.261100] pci_bus 0000:00: root bus resource [mem
> 0x000d0000-0x000d3fff window]
> [    0.261109] pci_bus 0000:00: root bus resource [mem
> 0x000d4000-0x000d7fff window]
> [    0.261117] pci_bus 0000:00: root bus resource [mem
> 0x000d8000-0x000dbfff window]
> [    0.261126] pci_bus 0000:00: root bus resource [mem
> 0x000dc000-0x000dffff window]
> [    0.261135] pci_bus 0000:00: root bus resource [mem
> 0x000e0000-0x000e3fff window]
> [    0.261143] pci_bus 0000:00: root bus resource [mem
> 0x000e4000-0x000e7fff window]
> [    0.261152] pci_bus 0000:00: root bus resource [mem
> 0x000e8000-0x000ebfff window]
> [    0.261161] pci_bus 0000:00: root bus resource [mem
> 0x000ec000-0x000effff window]
> [    0.261169] pci_bus 0000:00: root bus resource [mem
> 0x000f0000-0x000fffff window]
> [    0.261178] pci_bus 0000:00: root bus resource [mem
> 0x8fa00000-0xfeafffff window]
> [    0.261187] pci_bus 0000:00: root bus resource [mem
> 0xfed40000-0xfed44fff window]
> [    0.261196] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.261259] pci 0000:00:00.0: [8086:0154] type 00 class 0x060000
> [    0.261694] pci 0000:00:01.0: [8086:0151] type 01 class 0x060400
> [    0.261759] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
> [    0.261919] pci 0000:00:01.0: System wakeup disabled by ACPI
> [    0.262043] pci 0000:00:01.1: [8086:0155] type 01 class 0x060400
> [    0.262102] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
> [    0.262204] pci 0000:00:01.1: System wakeup disabled by ACPI
> [    0.262336] pci 0000:00:01.2: [8086:0159] type 01 class 0x060400
> [    0.262445] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
> [    0.262558] pci 0000:00:01.2: System wakeup disabled by ACPI
> [    0.262690] pci 0000:00:02.0: [8086:0166] type 00 class 0x030000
> [    0.262712] pci 0000:00:02.0: reg 0x10: [mem 0xc1400000-0xc17fffff 6=
4bit]
> [    0.262721] pci 0000:00:02.0: reg 0x18: [mem 0xb0000000-0xbfffffff
> 64bit pref]
> [    0.262728] pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
> [    0.263031] pci 0000:00:14.0: [8086:1e31] type 00 class 0x0c0330
> [    0.263085] pci 0000:00:14.0: reg 0x10: [mem 0xc1c00000-0xc1c0ffff 6=
4bit]
> [    0.263185] pci 0000:00:14.0: PME# supported from D3hot D3cold
> [    0.263437] pci 0000:00:14.0: System wakeup disabled by ACPI
> [    0.263573] pci 0000:00:16.0: [8086:1e3a] type 00 class 0x078000
> [    0.263630] pci 0000:00:16.0: reg 0x10: [mem 0xc1c17100-0xc1c1710f 6=
4bit]
> [    0.263750] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
> [    0.263972] pci 0000:00:1a.0: [8086:1e2d] type 00 class 0x0c0320
> [    0.264022] pci 0000:00:1a.0: reg 0x10: [mem 0xc1c16c00-0xc1c16fff]
> [    0.264146] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
> [    0.264397] pci 0000:00:1a.0: System wakeup disabled by ACPI
> [    0.264537] pci 0000:00:1b.0: [8086:1e20] type 00 class 0x040300
> [    0.264585] pci 0000:00:1b.0: reg 0x10: [mem 0xc1c10000-0xc1c13fff 6=
4bit]
> [    0.264693] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
> [    0.264838] pci 0000:00:1b.0: System wakeup disabled by ACPI
> [    0.264971] pci 0000:00:1c.0: [8086:1e10] type 01 class 0x060400
> [    0.265119] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
> [    0.265232] pci 0000:00:1c.0: System wakeup disabled by ACPI
> [    0.265371] pci 0000:00:1c.1: [8086:1e12] type 01 class 0x060400
> [    0.265525] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
> [    0.265654] pci 0000:00:1c.1: System wakeup disabled by ACPI
> [    0.265801] pci 0000:00:1d.0: [8086:1e26] type 00 class 0x0c0320
> [    0.265849] pci 0000:00:1d.0: reg 0x10: [mem 0xc1c16800-0xc1c16bff]
> [    0.265987] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
> [    0.266221] pci 0000:00:1d.0: System wakeup disabled by ACPI
> [    0.266358] pci 0000:00:1f.0: [8086:1e57] type 00 class 0x060100
> [    0.266737] pci 0000:00:1f.2: [8086:1e03] type 00 class 0x010601
> [    0.266793] pci 0000:00:1f.2: reg 0x10: [io  0x3098-0x309f]
> [    0.266808] pci 0000:00:1f.2: reg 0x14: [io  0x30bc-0x30bf]
> [    0.266824] pci 0000:00:1f.2: reg 0x18: [io  0x3090-0x3097]
> [    0.266840] pci 0000:00:1f.2: reg 0x1c: [io  0x30b8-0x30bb]
> [    0.266856] pci 0000:00:1f.2: reg 0x20: [io  0x3060-0x307f]
> [    0.266873] pci 0000:00:1f.2: reg 0x24: [mem 0xc1c16000-0xc1c167ff]
> [    0.266947] pci 0000:00:1f.2: PME# supported from D3hot
> [    0.267166] pci 0000:00:1f.3: [8086:1e22] type 00 class 0x0c0500
> [    0.267197] pci 0000:00:1f.3: reg 0x10: [mem 0xc1c17000-0xc1c170ff 6=
4bit]
> [    0.267229] pci 0000:00:1f.3: reg 0x20: [io  0xefa0-0xefbf]
> [    0.267614] pci 0000:01:00.0: [10de:0fd5] type 00 class 0x030000
> [    0.267654] pci 0000:01:00.0: reg 0x10: [mem 0xc0000000-0xc0ffffff]
> [    0.267673] pci 0000:01:00.0: reg 0x14: [mem 0x90000000-0x9fffffff
> 64bit pref]
> [    0.267692] pci 0000:01:00.0: reg 0x1c: [mem 0xa0000000-0xa1ffffff
> 64bit pref]
> [    0.267705] pci 0000:01:00.0: reg 0x24: [io  0x2000-0x207f]
> [    0.267717] pci 0000:01:00.0: reg 0x30: [mem 0xc1000000-0xc107ffff p=
ref]
> [    0.267886] pci 0000:01:00.0: System wakeup disabled by ACPI
> [    0.268029] pci 0000:01:00.1: [10de:0e1b] type 00 class 0x040300
> [    0.268064] pci 0000:01:00.1: reg 0x10: [mem 0xc1080000-0xc1083fff]
> [    1.276486] pci 0000:00:01.0: ASPM: Could not configure common clock=

> [    1.276548] pci 0000:00:01.0: PCI bridge to [bus 01]
> [    1.276556] pci 0000:00:01.0:   bridge window [io  0x2000-0x2fff]
> [    1.276560] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xc10f=
ffff]
> [    1.276565] pci 0000:00:01.0:   bridge window [mem
> 0x90000000-0xa1ffffff 64bit pref]
> [    1.276708] pci 0000:05:00.0: [8086:1547] type 01 class 0x060400
> [    1.276807] pci 0000:05:00.0: supports D1 D2
> [    1.276809] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.278525] pci 0000:00:01.1: PCI bridge to [bus 05-9b]
> [    1.278534] pci 0000:00:01.1:   bridge window [io  0x4000-0x6fff]
> [    1.278537] pci 0000:00:01.1:   bridge window [mem 0xc1d00000-0xcdff=
ffff]
> [    1.278544] pci 0000:00:01.1:   bridge window [mem
> 0xce000000-0xd9ffffff 64bit pref]
> [    1.278971] pci 0000:06:00.0: [8086:1547] type 01 class 0x060400
> [    1.279080] pci 0000:06:00.0: supports D1 D2
> [    1.279082] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.279282] pci 0000:06:03.0: [8086:1547] type 01 class 0x060400
> [    1.279383] pci 0000:06:03.0: supports D1 D2
> [    1.279385] pci 0000:06:03.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.279592] pci 0000:06:04.0: [8086:1547] type 01 class 0x060400
> [    1.279693] pci 0000:06:04.0: supports D1 D2
> [    1.279695] pci 0000:06:04.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.279892] pci 0000:06:05.0: [8086:1547] type 01 class 0x060400
> [    1.279992] pci 0000:06:05.0: supports D1 D2
> [    1.279994] pci 0000:06:05.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.280187] pci 0000:06:06.0: [8086:1547] type 01 class 0x060400
> [    1.280288] pci 0000:06:06.0: supports D1 D2
> [    1.280290] pci 0000:06:06.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.280509] pci 0000:05:00.0: PCI bridge to [bus 06-6b]
> [    1.280520] pci 0000:05:00.0:   bridge window [io  0x4000-0x5fff]
> [    1.280524] pci 0000:05:00.0:   bridge window [mem 0xc1d00000-0xc9ff=
ffff]
> [    1.280530] pci 0000:05:00.0:   bridge window [mem
> 0xce000000-0xd5ffffff 64bit pref]
> [    1.280664] pci 0000:07:00.0: [8086:1547] type 00 class 0x088000
> [    1.280705] pci 0000:07:00.0: reg 0x10: [mem 0xc1f00000-0xc1f3ffff]
> [    1.280717] pci 0000:07:00.0: reg 0x14: [mem 0xc1f40000-0xc1f40fff]
> [    1.280848] pci 0000:07:00.0: supports D1 D2
> [    1.280850] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3c=
old
> [    1.282557] pci 0000:06:00.0: PCI bridge to [bus 07]
> [    1.282574] pci 0000:06:00.0:   bridge window [mem 0xc1f00000-0xc1ff=
ffff]
> [    1.282914] pci 0000:06:03.0: PCI bridge to [bus 08-38]
> [    1.282925] pci 0000:06:03.0:   bridge window [io  0x4000-0x4fff]
> [    1.282929] pci 0000:06:03.0:   bridge window [mem 0xc2000000-0xc5ff=
ffff]
> [    1.282935] pci 0000:06:03.0:   bridge window [mem
> 0xce000000-0xd1ffffff 64bit pref]
> [    1.283264] pci 0000:06:04.0: PCI bridge to [bus 39-69]
> [    1.283275] pci 0000:06:04.0:   bridge window [io  0x5000-0x5fff]
> [    1.283279] pci 0000:06:04.0:   bridge window [mem 0xc6000000-0xc9ff=
ffff]
> [    1.283285] pci 0000:06:04.0:   bridge window [mem
> 0xd2000000-0xd5ffffff 64bit pref]
> [    1.283374] pci 0000:06:05.0: PCI bridge to [bus 6a]
> [    1.283386] pci 0000:06:05.0:   bridge window [mem 0xc1e00000-0xc1ef=
ffff]
> [    1.283479] pci 0000:06:06.0: PCI bridge to [bus 6b]
> [    1.283491] pci 0000:06:06.0:   bridge window [mem 0xc1d00000-0xc1df=
ffff]
> [    1.283653] pci 0000:00:01.2: PCI bridge to [bus 02]
> [    1.283665] pci 0000:00:01.2:   bridge window [mem 0xc1b00000-0xc1bf=
ffff]
> [    1.283897] pci 0000:03:00.0: [14e4:16a3] type 00 class 0x020000
> [    1.283972] pci 0000:03:00.0: reg 0x10: [mem 0xc1800000-0xc180ffff
> 64bit pref]
> [    1.283998] pci 0000:03:00.0: reg 0x18: [mem 0xc1810000-0xc181ffff
> 64bit pref]
> [    1.284040] pci 0000:03:00.0: reg 0x30: [mem 0xfffff800-0xffffffff p=
ref]
> [    1.284206] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
> [    1.284467] pci 0000:03:00.1: [14e4:16bc] type 00 class 0x080501
> [    1.284583] pci 0000:03:00.1: reg 0x10: [mem 0xc1820000-0xc182ffff
> 64bit pref]
> [    1.284802] pci 0000:03:00.1: PME# supported from D0 D3hot D3cold
> [    1.284894] pci 0000:03:00.1: System wakeup disabled by ACPI
> [    1.286685] pci 0000:00:1c.0: PCI bridge to [bus 03]
> [    1.286701] pci 0000:00:1c.0:   bridge window [mem 0xc1a00000-0xc1af=
ffff]
> [    1.286710] pci 0000:00:1c.0:   bridge window [mem
> 0xc1800000-0xc18fffff 64bit pref]
> [    1.286924] pci 0000:04:00.0: [14e4:4331] type 00 class 0x028000
> [    1.286996] pci 0000:04:00.0: reg 0x10: [mem 0xc1900000-0xc1903fff 6=
4bit]
> [    1.287173] pci 0000:04:00.0: supports D1 D2
> [    1.287175] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
> [    1.287266] pci 0000:04:00.0: System wakeup disabled by ACPI
> [    1.288612] pci 0000:00:1c.1: PCI bridge to [bus 04]
> [    1.288630] pci 0000:00:1c.1:   bridge window [mem 0xc1900000-0xc19f=
ffff]
> [    1.290223] ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7 10 12
> 14 15) *0, disabled.
> [    1.290392] ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 5 6 7 11 12
> 14 15) *0, disabled.
> [    1.290554] ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7 10 12
> 14 15) *0, disabled.
> [    1.290730] ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7 11 12
> 14 15) *0, disabled.
> [    1.290894] ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 5 6 7 10 12
> 14 15) *0, disabled.
> [    1.291058] ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 4 5 6 7 11 12
> 14 15) *0, disabled.
> [    1.291220] ACPI: PCI Interrupt Link [LNKG] (IRQs 1 3 4 5 6 7 10 12
> 14 15) *0, disabled.
> [    1.291381] ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 7 11 12
> 14 15) *0, disabled.
> [    1.291969] ACPI: Enabled 3 GPEs in block 00 to 3F
> [    1.292046] ACPI : EC: GPE =3D 0x17, I/O: command/status =3D 0x66, d=
ata =3D 0x62
> [    1.292649] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    1.292656] vgaarb: device added:
> PCI:0000:00:02.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
> [    1.292679] vgaarb: device added:
> PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
> [    1.292692] vgaarb: loaded
> [    1.292697] vgaarb: overriding boot device: PCI:0000:01:00.0
> [    1.292706] vgaarb: bridge control possible 0000:01:00.0
> [    1.292712] vgaarb: no bridge control possible 0000:00:02.0
> [    1.292873] SCSI subsystem initialized
> [    1.292990] libata version 3.00 loaded.
> [    1.293064] ACPI: bus type USB registered
> [    1.293116] usbcore: registered new interface driver usbfs
> [    1.293145] usbcore: registered new interface driver hub
> [    1.293217] usbcore: registered new device driver usb
> [    1.293541] PCI: Using ACPI for IRQ routing
> [    1.297614] PCI: pci_cache_line_size set to 64 bytes
> [    1.297844] e820: reserve RAM buffer [mem 0x0008e000-0x0008ffff]
> [    1.297853] e820: reserve RAM buffer [mem 0x40004000-0x43ffffff]
> [    1.297855] e820: reserve RAM buffer [mem 0x8944f190-0x8bffffff]
> [    1.297858] e820: reserve RAM buffer [mem 0x8ad14000-0x8bffffff]
> [    1.297860] e820: reserve RAM buffer [mem 0x8ad69000-0x8bffffff]
> [    1.297863] e820: reserve RAM buffer [mem 0x8ae3b000-0x8bffffff]
> [    1.297865] e820: reserve RAM buffer [mem 0x8aece000-0x8bffffff]
> [    1.297867] e820: reserve RAM buffer [mem 0x8af92000-0x8bffffff]
> [    1.297869] e820: reserve RAM buffer [mem 0x8b000000-0x8bffffff]
> [    1.297871] e820: reserve RAM buffer [mem 0x46f600000-0x46fffffff]
> [    1.298495] NetLabel: Initializing
> [    1.298500] NetLabel:  domain hash size =3D 128
> [    1.298504] NetLabel:  protocols =3D UNLABELED CIPSOv4
> [    1.298559] NetLabel:  unlabeled traffic allowed by default
> [    1.298669] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
> [    1.298681] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
> [    1.300780] clocksource: Switched to clocksource hpet
> [    1.339747] pnp: PnP ACPI init
> [    1.340380] system 00:00: [mem 0xfed00000-0xfed003ff] has been reser=
ved
> [    1.340420] system 00:00: Plug and Play ACPI device, IDs PNP0103
> PNP0c01 (active)
> [    1.340539] system 00:01: [io  0x1000-0x100f] has been reserved
> [    1.340548] system 00:01: [io  0x0400-0x047f] could not be reserved
> [    1.340555] system 00:01: [io  0x0500-0x057f] has been reserved
> [    1.340565] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (ac=
tive)
> [    1.340636] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (activ=
e)
> [    1.340849] pnp 00:03: Plug and Play ACPI device, IDs APP000b (activ=
e)
> [    1.341231] system 00:04: [mem 0xfed1c000-0xfed1ffff] has been reser=
ved
> [    1.341240] system 00:04: [mem 0xfed10000-0xfed17fff] has been reser=
ved
> [    1.341247] system 00:04: [mem 0xfed18000-0xfed18fff] has been reser=
ved
> [    1.341254] system 00:04: [mem 0xfed19000-0xfed19fff] has been reser=
ved
> [    1.341262] system 00:04: [mem 0xe0000000-0xefffffff] could not be r=
eserved
> [    1.341270] system 00:04: [mem 0xfed20000-0xfed3ffff] has been reser=
ved
> [    1.341279] system 00:04: [mem 0xfed90000-0xfed93fff] could not be r=
eserved
> [    1.341286] system 00:04: [mem 0xfed45000-0xfed8ffff] has been reser=
ved
> [    1.341294] system 00:04: [mem 0xff000000-0xffffffff] could not be r=
eserved
> [    1.341301] system 00:04: [mem 0xfee00000-0xfeefffff] has been reser=
ved
> [    1.341311] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (ac=
tive)
> [    1.341826] system 00:05: [mem 0x20000000-0x201fffff] has been reser=
ved
> [    1.341835] system 00:05: [mem 0x40000000-0x401fffff] could not be r=
eserved
> [    1.341845] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (ac=
tive)
> [    1.341858] pnp: PnP ACPI: found 6 devices
> [    1.352690] clocksource: acpi_pm: mask: 0xffffff max_cycles:
> 0xffffff, max_idle_ns: 2085701024 ns
> [    1.352709] pci 0000:03:00.0: can't claim BAR 6 [mem
> 0xfffff800-0xffffffff pref]: no compatible bridge window
> [    1.352735] pci 0000:06:00.0: bridge window [io  0x1000-0x0fff] to
> [bus 07] add_size 1000
> [    1.352739] pci 0000:06:00.0: bridge window [mem
> 0x00100000-0x000fffff 64bit pref] to [bus 07] add_size 200000
> add_align 100000
> [    1.352763] pci 0000:06:05.0: bridge window [io  0x1000-0x0fff] to
> [bus 6a] add_size 1000
> [    1.352765] pci 0000:06:05.0: bridge window [mem
> 0x00100000-0x000fffff 64bit pref] to [bus 6a] add_size 200000
> add_align 100000
> [    1.352787] pci 0000:06:06.0: bridge window [io  0x1000-0x0fff] to
> [bus 6b] add_size 1000
> [    1.352789] pci 0000:06:06.0: bridge window [mem
> 0x00100000-0x000fffff 64bit pref] to [bus 6b] add_size 200000
> add_align 100000
> [    1.352841] pci 0000:00:01.0: PCI bridge to [bus 01]
> [    1.352848] pci 0000:00:01.0:   bridge window [io  0x2000-0x2fff]
> [    1.352857] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xc10f=
ffff]
> [    1.352865] pci 0000:00:01.0:   bridge window [mem
> 0x90000000-0xa1ffffff 64bit pref]
> [    1.352881] pci 0000:06:00.0: res[15]=3D[mem 0x00100000-0x000fffff
> 64bit pref] res_to_dev_res add_size 200000 min_align 100000
> [    1.352884] pci 0000:06:00.0: res[15]=3D[mem 0x00100000-0x002fffff
> 64bit pref] res_to_dev_res add_size 200000 min_align 100000
> [    1.352886] pci 0000:06:05.0: res[15]=3D[mem 0x00100000-0x000fffff
> 64bit pref] res_to_dev_res add_size 200000 min_align 100000
> [    1.352888] pci 0000:06:05.0: res[15]=3D[mem 0x00100000-0x002fffff
> 64bit pref] res_to_dev_res add_size 200000 min_align 100000
> [    1.352890] pci 0000:06:06.0: res[15]=3D[mem 0x00100000-0x000fffff
> 64bit pref] res_to_dev_res add_size 200000 min_align 100000
> [    1.352892] pci 0000:06:06.0: res[15]=3D[mem 0x00100000-0x002fffff
> 64bit pref] res_to_dev_res add_size 200000 min_align 100000
> [    1.352894] pci 0000:06:00.0: res[13]=3D[io  0x1000-0x0fff]
> res_to_dev_res add_size 1000 min_align 1000
> [    1.352896] pci 0000:06:00.0: res[13]=3D[io  0x1000-0x1fff]
> res_to_dev_res add_size 1000 min_align 1000
> [    1.352898] pci 0000:06:05.0: res[13]=3D[io  0x1000-0x0fff]
> res_to_dev_res add_size 1000 min_align 1000
> [    1.352900] pci 0000:06:05.0: res[13]=3D[io  0x1000-0x1fff]
> res_to_dev_res add_size 1000 min_align 1000
> [    1.352902] pci 0000:06:06.0: res[13]=3D[io  0x1000-0x0fff]
> res_to_dev_res add_size 1000 min_align 1000
> [    1.352904] pci 0000:06:06.0: res[13]=3D[io  0x1000-0x1fff]
> res_to_dev_res add_size 1000 min_align 1000
> [    1.352910] pci 0000:06:00.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> [    1.352930] pci 0000:06:00.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> [    1.352942] pci 0000:06:05.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> [    1.352951] pci 0000:06:05.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> [    1.352962] pci 0000:06:06.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> [    1.352971] pci 0000:06:06.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> [    1.352980] pci 0000:06:00.0: BAR 13: no space for [io  size 0x1000]=

> [    1.352986] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x1=
000]
> [    1.352993] pci 0000:06:05.0: BAR 13: no space for [io  size 0x1000]=

> [    1.352999] pci 0000:06:05.0: BAR 13: failed to assign [io  size 0x1=
000]
> [    1.353006] pci 0000:06:06.0: BAR 13: no space for [io  size 0x1000]=

> [    1.353012] pci 0000:06:06.0: BAR 13: failed to assign [io  size 0x1=
000]
> [    1.353023] pci 0000:06:06.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> [    1.353032] pci 0000:06:06.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> [    1.353041] pci 0000:06:06.0: BAR 13: no space for [io  size 0x1000]=

> [    1.353047] pci 0000:06:06.0: BAR 13: failed to assign [io  size 0x1=
000]
> [    1.353055] pci 0000:06:05.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> [    1.353064] pci 0000:06:05.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> [    1.353073] pci 0000:06:05.0: BAR 13: no space for [io  size 0x1000]=

> [    1.353080] pci 0000:06:05.0: BAR 13: failed to assign [io  size 0x1=
000]
> [    1.353088] pci 0000:06:00.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> [    1.353097] pci 0000:06:00.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> [    1.353106] pci 0000:06:00.0: BAR 13: no space for [io  size 0x1000]=

> [    1.353112] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x1=
000]
> [    1.353120] pci 0000:06:00.0: PCI bridge to [bus 07]
> [    1.353129] pci 0000:06:00.0:   bridge window [mem 0xc1f00000-0xc1ff=
ffff]
> [    1.353142] pci 0000:06:03.0: PCI bridge to [bus 08-38]
> [    1.353148] pci 0000:06:03.0:   bridge window [io  0x4000-0x4fff]
> [    1.353158] pci 0000:06:03.0:   bridge window [mem 0xc2000000-0xc5ff=
ffff]
> [    1.353166] pci 0000:06:03.0:   bridge window [mem
> 0xce000000-0xd1ffffff 64bit pref]
> [    1.353179] pci 0000:06:04.0: PCI bridge to [bus 39-69]
> [    1.353185] pci 0000:06:04.0:   bridge window [io  0x5000-0x5fff]
> [    1.353194] pci 0000:06:04.0:   bridge window [mem 0xc6000000-0xc9ff=
ffff]
> [    1.353203] pci 0000:06:04.0:   bridge window [mem
> 0xd2000000-0xd5ffffff 64bit pref]
> [    1.353216] pci 0000:06:05.0: PCI bridge to [bus 6a]
> [    1.353224] pci 0000:06:05.0:   bridge window [mem 0xc1e00000-0xc1ef=
ffff]
> [    1.353237] pci 0000:06:06.0: PCI bridge to [bus 6b]
> [    1.353246] pci 0000:06:06.0:   bridge window [mem 0xc1d00000-0xc1df=
ffff]
> [    1.353258] pci 0000:05:00.0: PCI bridge to [bus 06-6b]
> [    1.353265] pci 0000:05:00.0:   bridge window [io  0x4000-0x5fff]
> [    1.353274] pci 0000:05:00.0:   bridge window [mem 0xc1d00000-0xc9ff=
ffff]
> [    1.353282] pci 0000:05:00.0:   bridge window [mem
> 0xce000000-0xd5ffffff 64bit pref]
> [    1.353295] pci 0000:00:01.1: PCI bridge to [bus 05-9b]
> [    1.353301] pci 0000:00:01.1:   bridge window [io  0x4000-0x6fff]
> [    1.353309] pci 0000:00:01.1:   bridge window [mem 0xc1d00000-0xcdff=
ffff]
> [    1.353317] pci 0000:00:01.1:   bridge window [mem
> 0xce000000-0xd9ffffff 64bit pref]
> [    1.353328] pci 0000:00:01.2: PCI bridge to [bus 02]
> [    1.353337] pci 0000:00:01.2:   bridge window [mem 0xc1b00000-0xc1bf=
ffff]
> [    1.353354] pci 0000:03:00.0: BAR 6: assigned [mem
> 0xc1a00000-0xc1a007ff pref]
> [    1.353364] pci 0000:00:1c.0: PCI bridge to [bus 03]
> [    1.353378] pci 0000:00:1c.0:   bridge window [mem 0xc1a00000-0xc1af=
ffff]
> [    1.353391] pci 0000:00:1c.0:   bridge window [mem
> 0xc1800000-0xc18fffff 64bit pref]
> [    1.353409] pci 0000:00:1c.1: PCI bridge to [bus 04]
> [    1.353423] pci 0000:00:1c.1:   bridge window [mem 0xc1900000-0xc19f=
ffff]
> [    1.353446] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    1.353448] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> [    1.353450] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff w=
indow]
> [    1.353452] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff w=
indow]
> [    1.353453] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff w=
indow]
> [    1.353455] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff w=
indow]
> [    1.353457] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff =
window]
> [    1.353459] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff =
window]
> [    1.353460] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff =
window]
> [    1.353462] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff =
window]
> [    1.353464] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff =
window]
> [    1.353466] pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff =
window]
> [    1.353468] pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff =
window]
> [    1.353469] pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff =
window]
> [    1.353471] pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff =
window]
> [    1.353473] pci_bus 0000:00: resource 19 [mem 0x000f0000-0x000fffff =
window]
> [    1.353475] pci_bus 0000:00: resource 20 [mem 0x8fa00000-0xfeafffff =
window]
> [    1.353476] pci_bus 0000:00: resource 21 [mem 0xfed40000-0xfed44fff =
window]
> [    1.353478] pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
> [    1.353480] pci_bus 0000:01: resource 1 [mem 0xc0000000-0xc10fffff]
> [    1.353482] pci_bus 0000:01: resource 2 [mem 0x90000000-0xa1ffffff
> 64bit pref]
> [    1.353484] pci_bus 0000:05: resource 0 [io  0x4000-0x6fff]
> [    1.353486] pci_bus 0000:05: resource 1 [mem 0xc1d00000-0xcdffffff]
> [    1.353487] pci_bus 0000:05: resource 2 [mem 0xce000000-0xd9ffffff
> 64bit pref]
> [    1.353489] pci_bus 0000:06: resource 0 [io  0x4000-0x5fff]
> [    1.353491] pci_bus 0000:06: resource 1 [mem 0xc1d00000-0xc9ffffff]
> [    1.353493] pci_bus 0000:06: resource 2 [mem 0xce000000-0xd5ffffff
> 64bit pref]
> [    1.353494] pci_bus 0000:07: resource 1 [mem 0xc1f00000-0xc1ffffff]
> [    1.353496] pci_bus 0000:08: resource 0 [io  0x4000-0x4fff]
> [    1.353498] pci_bus 0000:08: resource 1 [mem 0xc2000000-0xc5ffffff]
> [    1.353500] pci_bus 0000:08: resource 2 [mem 0xce000000-0xd1ffffff
> 64bit pref]
> [    1.353502] pci_bus 0000:39: resource 0 [io  0x5000-0x5fff]
> [    1.353503] pci_bus 0000:39: resource 1 [mem 0xc6000000-0xc9ffffff]
> [    1.353505] pci_bus 0000:39: resource 2 [mem 0xd2000000-0xd5ffffff
> 64bit pref]
> [    1.353507] pci_bus 0000:6a: resource 1 [mem 0xc1e00000-0xc1efffff]
> [    1.353509] pci_bus 0000:6b: resource 1 [mem 0xc1d00000-0xc1dfffff]
> [    1.353511] pci_bus 0000:02: resource 1 [mem 0xc1b00000-0xc1bfffff]
> [    1.353513] pci_bus 0000:03: resource 1 [mem 0xc1a00000-0xc1afffff]
> [    1.353515] pci_bus 0000:03: resource 2 [mem 0xc1800000-0xc18fffff
> 64bit pref]
> [    1.353517] pci_bus 0000:04: resource 1 [mem 0xc1900000-0xc19fffff]
> [    1.353592] NET: Registered protocol family 2
> [    1.354385] TCP established hash table entries: 131072 (order: 8,
> 1048576 bytes)
> [    1.354982] TCP bind hash table entries: 65536 (order: 10, 4194304 b=
ytes)
> [    1.358366] TCP: Hash tables configured (established 131072 bind 655=
36)
> [    1.358592] UDP hash table entries: 8192 (order: 8, 1310720 bytes)
> [    1.359595] UDP-Lite hash table entries: 8192 (order: 8, 1310720 byt=
es)
> [    1.360676] NET: Registered protocol family 1
> [    1.360722] pci 0000:00:14.0: enabling device (0000 -> 0002)
> [    1.361024] PCI: CLS 256 bytes, default 64
> [    1.361321] Unpacking initramfs...
> [    1.741385] Freeing initrd memory: 18564K (ffff88003edda000 -
> ffff88003fffb000)
> [    1.741515] PCI-DMA: Using software bounce buffering for IO (SWIOTLB=
)
> [    1.741522] software IO TLB [mem 0x81c27000-0x85c27000] (64MB)
> mapped at [ffff880081c27000-ffff880085c26fff]
> [    1.741665] RAPL PMU detected, API unit is 2^-32 Joules, 3 fixed
> counters 163840 ms ovfl timer
> [    1.741674] hw unit of domain pp0-core 2^-16 Joules
> [    1.741679] hw unit of domain package 2^-16 Joules
> [    1.741684] hw unit of domain pp1-gpu 2^-16 Joules
> [    1.745047] futex hash table entries: 2048 (order: 6, 262144 bytes)
> [    1.745190] audit: initializing netlink subsys (disabled)
> [    1.745258] audit: type=3D2000 audit(1449332805.708:1): initialized
> [    1.746590] Initialise system trusted keyring
> [    1.746841] HugeTLB registered 2 MB page size, pre-allocated 0 pages=

> [    1.753778] VFS: Disk quotas dquot_6.6.0
> [    1.753906] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 =
bytes)
> [    1.755919] SELinux:  Registering netfilter hooks
> [    1.762907] NET: Registered protocol family 38
> [    1.763075] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 252)
> [    1.763231] io scheduler noop registered
> [    1.763239] io scheduler deadline registered
> [    1.763363] io scheduler cfq registered (default)
> [    1.764960] pcieport 0000:00:01.2: enabling device (0000 -> 0002)
> [    1.766621] pcieport 0000:06:03.0: enabling device (0000 -> 0003)
> [    1.767005] pcieport 0000:06:04.0: enabling device (0000 -> 0003)
> [    1.767368] pcieport 0000:06:05.0: enabling device (0000 -> 0002)
> [    1.767738] pcieport 0000:06:06.0: enabling device (0000 -> 0002)
> [    1.768112] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
> [    1.768139] pciehp 0000:06:00.0:pcie24: Slot #0 AttnBtn- PwrCtrl-
> MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
> [    1.768414] pciehp 0000:06:00.0:pcie24: service driver pciehp loaded=

> [    1.768431] pciehp 0000:06:03.0:pcie24: Slot #3 AttnBtn- PwrCtrl-
> MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
> [    1.768540] pciehp 0000:06:03.0:pcie24: service driver pciehp loaded=

> [    1.768556] pciehp 0000:06:04.0:pcie24: Slot #4 AttnBtn- PwrCtrl-
> MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
> [    1.768660] pciehp 0000:06:04.0:pcie24: service driver pciehp loaded=

> [    1.768676] pciehp 0000:06:05.0:pcie24: Slot #5 AttnBtn- PwrCtrl-
> MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
> [    1.768780] pciehp 0000:06:05.0:pcie24: service driver pciehp loaded=

> [    1.768825] pciehp 0000:06:06.0:pcie24: Slot #6 AttnBtn- PwrCtrl-
> MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
> [    1.768931] pciehp 0000:06:06.0:pcie24: service driver pciehp loaded=

> [    1.768945] pciehp: PCI Express Hot Plug Controller Driver version: =
0.4
> [    1.769025] efifb: probing for efifb
> [    1.769087] efifb: framebuffer at 0x90020000, mapped to
> 0xffffc90004000000, using 28800k, total 28800k
> [    1.769096] efifb: mode is 2880x1800x32, linelength=3D16384, pages=3D=
1
> [    1.769101] efifb: scrolling: redraw
> [    1.769106] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    1.784904] Console: switching to colour frame buffer device 360x112=

> [    1.799133] fb0: EFI VGA frame buffer device
> [    1.799179] intel_idle: MWAIT substates: 0x21120
> [    1.799181] intel_idle: v0.4 model 0x3A
> [    1.799182] intel_idle: lapic_timer_reliable_states 0xffffffff
> [    1.800854] ACPI: AC Adapter [ADP1] (off-line)
> [    1.801089] input: Lid Switch as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
> [    1.801216] ACPI: Lid Switch [LID0]
> [    1.801351] input: Power Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
> [    1.801435] ACPI: Power Button [PWRB]
> [    1.801567] input: Sleep Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
> [    1.801612] ACPI: Sleep Button [SLPB]
> [    1.801738] input: Power Button as
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
> [    1.801779] ACPI: Power Button [PWRF]
> [    1.810814] GHES: HEST is not enabled!
> [    1.811058] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    1.812999] Non-volatile memory driver v1.3
> [    1.813149] Linux agpgart interface v0.103
> [    1.821694] loop: module loaded
> [    1.822118] ahci 0000:00:1f.2: version 3.0
> [    1.822469] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6
> Gbps 0x1 impl SATA mode
> [    1.822514] ahci 0000:00:1f.2: flags: 64bit ncq pm led clo pio slum
> part ems apst
> [    1.824952] scsi host0: ahci
> [    1.825498] scsi host1: ahci
> [    1.825959] scsi host2: ahci
> [    1.826435] scsi host3: ahci
> [    1.826875] scsi host4: ahci
> [    1.827294] scsi host5: ahci
> [    1.827463] ata1: SATA max UDMA/133 abar m2048@0xc1c16000 port
> 0xc1c16100 irq 33
> [    1.827502] ata2: DUMMY
> [    1.827516] ata3: DUMMY
> [    1.827529] ata4: DUMMY
> [    1.827541] ata5: DUMMY
> [    1.827554] ata6: DUMMY
> [    1.827913] libphy: Fixed MDIO Bus: probed
> [    1.828176] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
> [    1.828237] ehci-pci: EHCI PCI platform driver
> [    1.828608] ehci-pci 0000:00:1a.0: EHCI Host Controller
> [    1.829164] ehci-pci 0000:00:1a.0: new USB bus registered, assigned
> bus number 1
> [    1.829278] ehci-pci 0000:00:1a.0: debug port 2
> [    1.833288] ehci-pci 0000:00:1a.0: cache line size of 256 is not sup=
ported
> [    1.833341] ehci-pci 0000:00:1a.0: irq 23, io mem 0xc1c16c00
> [    1.838842] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
> [    1.839244] usb usb1: New USB device found, idVendor=3D1d6b, idProdu=
ct=3D0002
> [    1.839283] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.839319] usb usb1: Product: EHCI Host Controller
> [    1.839344] usb usb1: Manufacturer: Linux 4.4.0-rc3+ ehci_hcd
> [    1.839372] usb usb1: SerialNumber: 0000:00:1a.0
> [    1.840208] hub 1-0:1.0: USB hub found
> [    1.840262] hub 1-0:1.0: 2 ports detected
> [    1.841481] ehci-pci 0000:00:1d.0: EHCI Host Controller
> [    1.841644] ehci-pci 0000:00:1d.0: new USB bus registered, assigned
> bus number 2
> [    1.841704] ehci-pci 0000:00:1d.0: debug port 2
> [    1.845642] ehci-pci 0000:00:1d.0: cache line size of 256 is not sup=
ported
> [    1.845666] ehci-pci 0000:00:1d.0: irq 22, io mem 0xc1c16800
> [    1.850835] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
> [    1.850991] usb usb2: New USB device found, idVendor=3D1d6b, idProdu=
ct=3D0002
> [    1.851030] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.851065] usb usb2: Product: EHCI Host Controller
> [    1.851090] usb usb2: Manufacturer: Linux 4.4.0-rc3+ ehci_hcd
> [    1.851118] usb usb2: SerialNumber: 0000:00:1d.0
> [    1.851559] hub 2-0:1.0: USB hub found
> [    1.851602] hub 2-0:1.0: 2 ports detected
> [    1.852072] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    1.852136] ohci-pci: OHCI PCI platform driver
> [    1.852194] uhci_hcd: USB Universal Host Controller Interface driver=

> [    1.852500] xhci_hcd 0000:00:14.0: can't derive routing for PCI INT =
A
> [    1.852536] xhci_hcd 0000:00:14.0: PCI INT A: no GSI
> [    1.852614] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    1.852807] xhci_hcd 0000:00:14.0: new USB bus registered, assigned
> bus number 3
> [    1.853975] xhci_hcd 0000:00:14.0: hcc params 0x20007181 hci
> version 0x100 quirks 0x0000b930
> [    1.854028] xhci_hcd 0000:00:14.0: cache line size of 256 is not sup=
ported
> [    1.854250] usb usb3: New USB device found, idVendor=3D1d6b, idProdu=
ct=3D0002
> [    1.854288] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.854324] usb usb3: Product: xHCI Host Controller
> [    1.854349] usb usb3: Manufacturer: Linux 4.4.0-rc3+ xhci-hcd
> [    1.854378] usb usb3: SerialNumber: 0000:00:14.0
> [    1.854831] hub 3-0:1.0: USB hub found
> [    1.854914] hub 3-0:1.0: 4 ports detected
> [    1.855647] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    1.855829] xhci_hcd 0000:00:14.0: new USB bus registered, assigned
> bus number 4
> [    1.855990] usb usb4: New USB device found, idVendor=3D1d6b, idProdu=
ct=3D0003
> [    1.856028] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    1.856063] usb usb4: Product: xHCI Host Controller
> [    1.856088] usb usb4: Manufacturer: Linux 4.4.0-rc3+ xhci-hcd
> [    1.856116] usb usb4: SerialNumber: 0000:00:14.0
> [    1.856551] hub 4-0:1.0: USB hub found
> [    1.856609] hub 4-0:1.0: 4 ports detected
> [    1.857338] usbcore: registered new interface driver usbserial
> [    1.857390] usbcore: registered new interface driver usbserial_gener=
ic
> [    1.859639] usbserial: USB Serial support registered for generic
> [    1.861859] i8042: PNP: No PS/2 controller found. Probing ports dire=
ctly.
> [    2.132847] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [    2.135777] ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES)
> filtered out
> [    2.138153] ata1.00: ATA-8: APPLE SSD SM256E, CXM09A1Q, max UDMA/133=

> [    2.140370] ata1.00: 490234752 sectors, multi 16: LBA48 NCQ (depth 3=
1/32), AA
> [    2.142997] ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES)
> filtered out
> [    2.145367] ata1.00: configured for UDMA/133
> [    2.148519] scsi 0:0:0:0: Direct-Access     ATA      APPLE SSD
> SM256E 9A1Q PQ: 0 ANSI: 5
> [    2.151938] sd 0:0:0:0: [sda] 490234752 512-byte logical blocks:
> (251 GB/233 GiB)
> [    2.152172] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [    2.156354] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [    2.158639] sd 0:0:0:0: [sda] Write Protect is off
> [    2.160799] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    2.160836] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [    2.165810]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7
> [    2.169865] sd 0:0:0:0: [sda] Attached SCSI disk
> [    2.740898] tsc: Refined TSC clocksource calibration: 2294.787 MHz
> [    2.743051] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
> 0x2113f8b171d, max_idle_ns: 440795241185 ns
> [    2.963263] i8042: No controller found
> [    2.965753] mousedev: PS/2 mouse device common for all mice
> [    2.969178] rtc_cmos 00:02: RTC can wake from S4
> [    2.971703] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
> [    2.973908] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes
> nvram, hpet irqs
> [    2.976226] device-mapper: uevent: version 1.0.3
> [    2.978687] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28)
> initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
> [    2.982515] EFI Variables Facility v0.08 2004-May-17
> [    3.167876] usb 1-1: new high-speed USB device number 2 using ehci-p=
ci
> [    3.171357] usb 2-1: new high-speed USB device number 2 using ehci-p=
ci
> [    3.216964] hidraw: raw HID events driver (C) Jiri Kosina
> [    3.219413] usbcore: registered new interface driver usbhid
> [    3.221547] usbhid: USB HID core driver
> [    3.223739] drop_monitor: Initializing network drop monitor service
> [    3.226108] ip_tables: (C) 2000-2006 Netfilter Core Team
> [    3.228398] Initializing XFRM netlink socket
> [    3.231019] NET: Registered protocol family 10
> [    3.233942] mip6: Mobile IPv6
> [    3.236050] NET: Registered protocol family 17
> [    3.238174] Key type dns_resolver registered
> [    3.241239] AVX version of gcm_enc/dec engaged.
> [    3.243336] AES CTR mode by8 optimization enabled
> [    3.281607] registered taskstats version 1
> [    3.283698] Loading compiled-in X.509 certificates
> [    3.287768]   Magic number: 11:483:438
> [    3.290034] rtc_cmos 00:02: setting system clock to 2015-12-05
> 16:26:47 UTC (1449332807)
> [    3.292356] usb 1-1: New USB device found, idVendor=3D8087, idProduc=
t=3D0024
> [    3.294510] usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, S=
erialNumber=3D0
> [    3.296765] usb 2-1: New USB device found, idVendor=3D8087, idProduc=
t=3D0024
> [    3.298797] usb 2-1: New USB device strings: Mfr=3D0, Product=3D0, S=
erialNumber=3D0
> [    3.301442] hub 2-1:1.0: USB hub found
> [    3.301520] PM: Hibernation image not present or could not be loaded=
=2E
> [    3.303559] hub 1-1:1.0: USB hub found
> [    3.305589] hub 2-1:1.0: 8 ports detected
> [    3.307750] hub 1-1:1.0: 6 ports detected
> [    3.311248] Freeing unused kernel memory: 1516K (ffffffff81d50000 -
> ffffffff81ecb000)
> [    3.313794] Write protecting the kernel read-only data: 12288k
> [    3.317208] Freeing unused kernel memory: 264K (ffff8800017be000 -
> ffff880001800000)
> [    3.321196] Freeing unused kernel memory: 672K (ffff880001b58000 -
> ffff880001c00000)
> [    3.333082] random: systemd urandom read with 4 bits of entropy avai=
lable
> [    3.337263] systemd[1]: systemd 219 running in system mode. (+PAM
> +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP
> +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
> [    3.339871] systemd[1]: Detected architecture x86-64.
> [    3.342029] systemd[1]: Running in initial RAM disk.
> [    3.364543] systemd[1]: Set hostname to <crackbookpro>.
> [    3.454267] systemd[1]: Reached target Local File Systems.
> [    3.456476] systemd[1]: Starting Local File Systems.
> [    3.464141] systemd[1]: Reached target Swap.
> [    3.466340] systemd[1]: Starting Swap.
> [    3.474415] systemd[1]: Created slice -.slice.
> [    3.476586] systemd[1]: Starting -.slice.
> [    3.484157] systemd[1]: Listening on udev Kernel Socket.
> [    3.486326] systemd[1]: Starting udev Kernel Socket.
> [    3.493924] systemd[1]: Listening on udev Control Socket.
> [    3.496097] systemd[1]: Starting udev Control Socket.
> [    3.503737] systemd[1]: Listening on Journal Socket.
> [    3.505920] systemd[1]: Starting Journal Socket.
> [    3.513539] systemd[1]: Listening on Journal Socket (/dev/log).
> [    3.515703] systemd[1]: Starting Journal Socket (/dev/log).
> [    3.523545] systemd[1]: Listening on Journal Audit Socket.
> [    3.525766] systemd[1]: Starting Journal Audit Socket.
> [    3.533428] systemd[1]: Reached target Sockets.
> [    3.535599] systemd[1]: Starting Sockets.
> [    3.543559] systemd[1]: Created slice System Slice.
> [    3.545740] systemd[1]: Starting System Slice.
> [    3.553330] systemd[1]: Reached target Slices.
> [    3.555498] systemd[1]: Starting Slices.
> [    3.566268] systemd[1]: Starting Setup Virtual Console...
> [    3.579587] systemd[1]: Starting Create list of required static
> device nodes for the current kernel...
> [    3.587517] systemd[1]: Started Load Kernel Modules.
> [    3.590519] systemd[1]: Starting Apply Kernel Variables...
> [    3.591857] usb 1-1.1: new high-speed USB device number 3 using ehci=
-pci
> [    3.591887] usb 2-1.8: new high-speed USB device number 3 using ehci=
-pci
> [    3.603555] systemd[1]: Starting Journal Service...
> [    3.611410] systemd[1]: Started dracut ask for additional cmdline pa=
rameters.
> [    3.614560] systemd[1]: Starting dracut cmdline hook...
> [    3.631491] systemd[1]: Reached target Timers.
> [    3.633868] systemd[1]: Starting Timers.
> [    3.643581] systemd[1]: Started Setup Virtual Console.
> [    3.645984] audit: type=3D1130 audit(1449332807.854:2): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel
> msg=3D'unit=3Dsystemd-vconsole-setup comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    3.655466] systemd[1]: Started Create list of required static
> device nodes for the current kernel.
> [    3.658230] audit: type=3D1130 audit(1449332807.867:3): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dkmod-sta=
tic-nodes
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?=

> terminal=3D? res=3Dsuccess'
> [    3.668021] systemd[1]: Started Apply Kernel Variables.
> [    3.670484] audit: type=3D1130 audit(1449332807.879:4): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-=
sysctl
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?=

> terminal=3D? res=3Dsuccess'
> [    3.677355] usb 2-1.8: New USB device found, idVendor=3D0424, idProd=
uct=3D2512
> [    3.677357] usb 2-1.8: New USB device strings: Mfr=3D0, Product=3D0,=

> SerialNumber=3D0
> [    3.677967] hub 2-1.8:1.0: USB hub found
> [    3.678142] hub 2-1.8:1.0: 2 ports detected
> [    3.691411] systemd[1]: Started Journal Service.
> [    3.695269] audit: type=3D1130 audit(1449332807.903:5): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-=
journald
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?=

> terminal=3D? res=3Dsuccess'
> [    3.696918] usb 1-1.1: New USB device found, idVendor=3D05ac, idProd=
uct=3D8510
> [    3.696920] usb 1-1.1: New USB device strings: Mfr=3D1, Product=3D2,=

> SerialNumber=3D3
> [    3.696921] usb 1-1.1: Product: FaceTime HD Camera (Built-in)
> [    3.696923] usb 1-1.1: Manufacturer: Apple Inc.
> [    3.696924] usb 1-1.1: SerialNumber: DJHC7BZJ3XDNYGE0
> [    3.723768] audit: type=3D1130 audit(1449332807.931:6): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Ddracut-c=
mdline
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?=

> terminal=3D? res=3Dsuccess'
> [    3.745233] clocksource: Switched to clocksource tsc
> [    3.772935] audit: type=3D1130 audit(1449332807.982:7): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel
> msg=3D'unit=3Dsystemd-tmpfiles-setup-dev comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    3.790011] audit: type=3D1130 audit(1449332807.999:8): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Ddracut-p=
re-udev
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?=

> terminal=3D? res=3Dsuccess'
> [    3.827125] audit: type=3D1130 audit(1449332808.036:9): pid=3D1 uid=3D=
0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-=
udevd
> comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D?=

> terminal=3D? res=3Dsuccess'
> [    3.863042] audit: type=3D1130 audit(1449332808.072:10): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dkernel
> msg=3D'unit=3Ddracut-pre-trigger comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    3.951936] usb 2-1.8.1: new full-speed USB device number 4 using eh=
ci-pci
> [    3.981710] [drm] Initialized drm 1.1.0 20060810
> [    4.000003] wmi: Mapper loaded
> [    4.012358] sdhci: Secure Digital Host Controller Interface driver
> [    4.012359] sdhci: Copyright(c) Pierre Ossman
> [    4.014418] sdhci-pci 0000:03:00.1: SDHCI controller found
> [14e4:16bc] (rev 10)
> [    4.014486] sdhci-pci 0000:03:00.1: enabling device (0000 -> 0002)
> [    4.014672] sdhci-pci 0000:03:00.1: No vmmc regulator found
> [    4.014674] sdhci-pci 0000:03:00.1: No vqmmc regulator found
> [    4.021065] mmc0: SDHCI controller on PCI [0000:03:00.1] using ADMA =
64-bit
> [    4.021233] ACPI Warning: \_SB_.PCI0.IGPU._DSM: Argument #4 type
> mismatch - Found [Buffer], ACPI requires [Package]
> (20150930/nsarguments-95)
> [    4.021290] ACPI: \_SB_.PCI0.IGPU: failed to evaluate _DSM
> [    4.021370] ACPI Warning: \_SB_.PCI0.P0P2.GFX0._DSM: Argument #4
> type mismatch - Found [Buffer], ACPI requires [Package]
> (20150930/nsarguments-95)
> [    4.021424] ACPI: \_SB_.PCI0.P0P2.GFX0: failed to evaluate _DSM
> [    4.021612] checking generic (90020000 1c20000) vs hw (90000000 1000=
0000)
> [    4.021614] fb: switching to nouveaufb from EFI VGA
> [    4.026567] [drm] Memory usable by graphics device =3D 2048M
> [    4.043087] usb 2-1.8.1: New USB device found, idVendor=3D0a5c, idPr=
oduct=3D4500
> [    4.043089] usb 2-1.8.1: New USB device strings: Mfr=3D1, Product=3D=
2,
> SerialNumber=3D0
> [    4.043091] usb 2-1.8.1: Product: BRCM20702 Hub
> [    4.043092] usb 2-1.8.1: Manufacturer: Apple Inc.
> [    4.052014] hub 2-1.8.1:1.0: USB hub found
> [    4.052213] hub 2-1.8.1:1.0: 3 ports detected
> [    4.092869] Console: switching to colour dummy device 80x25
> [    4.095271] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
> [    4.095766] [drm] Replacing VGA console driver
> [    4.097218] nouveau 0000:01:00.0: NVIDIA GK107 (0e7150a2)
> [    4.126875] nouveau 0000:01:00.0: bios: version 80.07.26.04.01
> [    4.137860] usb 2-1.8.2: new full-speed USB device number 5 using eh=
ci-pci
> [    4.150892] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
> [    4.150903] [drm] Driver supports precise vblank timestamp query.
> [    4.150915] i915 0000:00:02.0: BAR 6: can't assign [??? 0x00000000
> flags 0x20000000] (bogus alignment)
> [    4.150926] [drm] failed to find VBIOS tables
> [    4.151721] vgaarb: device changed decodes:
> PCI:0000:00:02.0,olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
> [    4.167862] [drm] failed to retrieve link info, disabling eDP
> [    4.174686] [Firmware Bug]: ACPI(GFX0) defines _DOD but not _DOS
> [    4.174775] ACPI: Video Device [GFX0] (multi-head: yes  rom: yes  po=
st: no)
> [    4.179054] acpi device:02: registered as cooling_device0
> [    4.179638] input: Video Bus as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input=
/input4
> [    4.181403] EXT4-fs (sda7): mounted filesystem with ordered data
> mode. Opts: (null)
> [    4.182952] ACPI: Video Device [IGPU] (multi-head: yes  rom: no  pos=
t: no)
> [    4.184178] acpi device:20: registered as cooling_device1
> [    4.184616] input: Video Bus as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input5
> [    4.185284] [drm] Initialized i915 1.6.0 20151010 for 0000:00:02.0 o=
n minor 0
> [    4.187827] nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
> [    4.229644] usb 2-1.8.2: New USB device found, idVendor=3D05ac, idPr=
oduct=3D0262
> [    4.229653] usb 2-1.8.2: New USB device strings: Mfr=3D1, Product=3D=
2,
> SerialNumber=3D0
> [    4.229660] usb 2-1.8.2: Product: Apple Internal Keyboard / Trackpad=

> [    4.229665] usb 2-1.8.2: Manufacturer: Apple Inc.
> [    4.236074] input: Apple Inc. Apple Internal Keyboard / Trackpad as
> /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8.2/2-1.8.2:1.0/000=
3:05AC:0262.0001/input/input6
> [    4.238882] [drm] GMBUS [i915 gmbus vga] timed out, falling back to
> bit banging on pin 2
> [    4.246946] i915 0000:00:02.0: No connectors reported connected with=
 modes
> [    4.247080] [drm] Cannot find any crtc or sizes - going 1024x768
> [    4.255960] Console: switching to colour frame buffer device 128x48
> [    4.257405] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
> [    4.258975] [TTM] Zone  kernel: Available graphics memory: 8161924 k=
iB
> [    4.259000] [TTM] Zone   dma32: Available graphics memory: 2097152 k=
iB
> [    4.259022] [TTM] Initializing pool allocator
> [    4.259057] [TTM] Initializing DMA pool allocator
> [    4.259190] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
> [    4.259208] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [    4.259229] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    4.259249] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [    4.259267] nouveau 0000:01:00.0: DRM: DCB outp 00: 048101b6 0f23001=
0
> [    4.259289] nouveau 0000:01:00.0: DRM: DCB outp 01: 018212d6 0f22002=
0
> [    4.259311] nouveau 0000:01:00.0: DRM: DCB outp 02: 01021212 0002002=
0
> [    4.259332] nouveau 0000:01:00.0: DRM: DCB outp 03: 088324c6 0f22001=
0
> [    4.259354] nouveau 0000:01:00.0: DRM: DCB outp 04: 08032402 0002001=
0
> [    4.259375] nouveau 0000:01:00.0: DRM: DCB outp 05: 02843862 0002001=
0
> [    4.259397] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
> [    4.259416] nouveau 0000:01:00.0: DRM: DCB conn 01: 02208146
> [    4.259435] nouveau 0000:01:00.0: DRM: DCB conn 02: 01104246
> [    4.259454] nouveau 0000:01:00.0: DRM: DCB conn 03: 00410361
> [    4.279710] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
> [    4.279734] [drm] Driver supports precise vblank timestamp query.
> [    4.296376] apple 0003:05AC:0262.0001: input,hidraw0: USB HID v1.11
> Keyboard [Apple Inc. Apple Internal Keyboard / Trackpad] on
> usb-0000:00:1d.0-1.8.2/input0
> [    4.319883] usb 2-1.8.1.1: new full-speed USB device number 6 using =
ehci-pci
> [    4.377143] apple 0003:05AC:0262.0002: hidraw1: USB HID v1.11
> Device [Apple Inc. Apple Internal Keyboard / Trackpad] on
> usb-0000:00:1d.0-1.8.2/input1
> [    4.400143] usb 2-1.8.1.1: New USB device found, idVendor=3D05ac,
> idProduct=3D820a
> [    4.401841] usb 2-1.8.1.1: New USB device strings: Mfr=3D0,
> Product=3D0, SerialNumber=3D0
> [    4.406387] input: HID 05ac:820a as
> /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8.1/2-1.8.1.1/2-1.8=
=2E1.1:1.0/0003:05AC:820A.0003/input/input7
> [    4.476601] hid-generic 0003:05AC:820A.0003: input,hidraw2: USB HID
> v1.11 Keyboard [HID 05ac:820a] on usb-0000:00:1d.0-1.8.1.1/input0
> [    4.507610] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer cop=
ies
> [    4.542875] usb 2-1.8.1.2: new full-speed USB device number 7 using =
ehci-pci
> [    4.633778] nouveau 0000:01:00.0: DRM: allocated 2880x1800 fb:
> 0x60000, bo ffff880456e8e800
> [    4.634682] usb 2-1.8.1.2: New USB device found, idVendor=3D05ac,
> idProduct=3D820b
> [    4.634684] usb 2-1.8.1.2: New USB device strings: Mfr=3D0,
> Product=3D0, SerialNumber=3D0
> [    4.637018] input: HID 05ac:820b as
> /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8.1/2-1.8.1.2/2-1.8=
=2E1.2:1.0/0003:05AC:820B.0004/input/input8
> [    4.637773] hid-generic 0003:05AC:820B.0004: input,hidraw3: USB HID
> v1.11 Mouse [HID 05ac:820b] on usb-0000:00:1d.0-1.8.1.2/input0
> [    4.644616] fbcon: nouveaufb (fb1) is primary device
> [    4.644617] fbcon: Remapping primary device, fb1, to tty 1-63
> [    4.699932] usb 2-1.8.1.3: new full-speed USB device number 8 using =
ehci-pci
> [    4.778194] usb 2-1.8.1.3: New USB device found, idVendor=3D05ac,
> idProduct=3D8286
> [    4.778196] usb 2-1.8.1.3: New USB device strings: Mfr=3D1,
> Product=3D2, SerialNumber=3D0
> [    4.778197] usb 2-1.8.1.3: Product: Bluetooth USB Host Controller
> [    4.778199] usb 2-1.8.1.3: Manufacturer: Apple Inc.
> [    6.016138] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device=

> [    6.016142] [drm] Initialized nouveau 1.3.1 20120801 for
> 0000:01:00.0 on minor 1
> [    6.335914] systemd-journald[198]: Received SIGTERM from PID 1 (syst=
emd).
> [    6.458548] SELinux: 32768 avtab hash slots, 106872 rules.
> [    6.484789] SELinux: 32768 avtab hash slots, 106872 rules.
> [    6.530663] SELinux:  8 users, 105 roles, 4979 types, 303 bools, 1
> sens, 1024 cats
> [    6.530667] SELinux:  92 classes, 106872 rules
> [    6.538487] SELinux:  Completing initialization.
> [    6.538488] SELinux:  Setting up existing superblocks.
> [    6.579692] systemd[1]: Successfully loaded SELinux policy in 152.77=
5ms.
> [    6.594451] systemd[1]: RTC configured in localtime, applying delta
> of 600 minutes to system time.
> [    6.649745] systemd[1]: Relabelled /dev and /run in 28.905ms.
> [    6.830386] audit_printk_skb: 102 callbacks suppressed
> [    6.830815] audit: type=3D1130 audit(1449296811.039:45): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dsystemd-journald comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.831775] audit: type=3D1131 audit(1449296811.041:46): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dsystemd-journald comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.833516] audit: type=3D1130 audit(1449296811.042:47): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dinitrd-switch-root comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.834079] audit: type=3D1131 audit(1449296811.043:48): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dinitrd-switch-root comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.861266] audit: type=3D1130 audit(1449296811.070:49): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dsystemd-journald comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.861296] audit: type=3D1131 audit(1449296811.070:50): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dsystemd-journald comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.893519] audit: type=3D1305 audit(1449296811.102:51):
> audit_enabled=3D1 old=3D1 auid=3D4294967295 ses=3D4294967295
> subj=3Dsystem_u:system_r:syslogd_t:s0 res=3D1
> [    6.956404] EXT4-fs (sda7): re-mounted. Opts: (null)
> [    6.981421] audit: type=3D1130 audit(1449296811.190:52): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dsystemd-journald comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.985134] audit: type=3D1130 audit(1449296811.194:53): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dkmod-static-nodes comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    6.995624] audit: type=3D1130 audit(1449296811.204:54): pid=3D1 uid=
=3D0
> auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
> msg=3D'unit=3Dsystemd-remount-fs comm=3D"systemd"
> exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
> res=3Dsuccess'
> [    7.075836] systemd-journald[467]: Received request to flush
> runtime journal from PID 1
> [    7.234431] random: nonblocking pool is initialized
> [    7.290133] input: PC Speaker as /devices/platform/pcspkr/input/inpu=
t9
> [    7.302799] i801_smbus 0000:00:1f.3: enabling device (0000 -> 0003)
> [    7.303500] ACPI Warning: SystemIO range
> 0x000000000000EFA0-0x000000000000EFBF conflicts with OpRegion
> 0x000000000000EFA0-0x000000000000EFAF (\_SB_.PCI0.SBUS.SMBI)
> (20150930/utaddress-254)
> [    7.304657] ACPI: If an ACPI driver is available for this device,
> you should use it instead of the native driver
> [    7.311976] ACPI Warning: SystemIO range
> 0x0000000000000428-0x000000000000042F conflicts with OpRegion
> 0x0000000000000400-0x000000000000047F (\PMIO) (20150930/utaddress-254)
> [    7.312714] ACPI: If an ACPI driver is available for this device,
> you should use it instead of the native driver
> [    7.313972] ACPI Warning: SystemIO range
> 0x0000000000000540-0x000000000000054F conflicts with OpRegion
> 0x0000000000000500-0x0000000000000563 (\GPIO) (20150930/utaddress-254)
> [    7.315233] ACPI: If an ACPI driver is available for this device,
> you should use it instead of the native driver
> [    7.315433] apple_gmux: Found gmux version 3.2.19 [indexed]
> [    7.315446] apple_gmux: locked IO for PCI:0000:00:02.0
> [    7.319177] ACPI Warning: SystemIO range
> 0x0000000000000530-0x000000000000053F conflicts with OpRegion
> 0x0000000000000500-0x0000000000000563 (\GPIO) (20150930/utaddress-254)
> [    7.320497] ACPI: If an ACPI driver is available for this device,
> you should use it instead of the native driver
> [    7.321834] ACPI Warning: SystemIO range
> 0x0000000000000500-0x000000000000052F conflicts with OpRegion
> 0x0000000000000500-0x0000000000000563 (\GPIO) (20150930/utaddress-254)
> [    7.323243] ACPI: If an ACPI driver is available for this device,
> you should use it instead of the native driver
> [    7.324629] lpc_ich: Resource conflict(s) found affecting gpio_ich
> [    7.327932] vga_switcheroo: enabled
> [    7.355069] ACPI: SBS HC: EC =3D 0xffff88045cb0aa00, offset =3D 0x20=
,
> query_bit =3D 0x10
> [    7.416045] thunderbolt 0000:07:00.0: NHI initialized, starting thun=
derbolt
> [    7.417290] thunderbolt 0000:07:00.0: allocating TX ring 0 of size 1=
0
> [    7.418530] thunderbolt 0000:07:00.0: allocating RX ring 0 of size 1=
0
> [    7.419904] thunderbolt 0000:07:00.0: control channel created
> [    7.421332] thunderbolt 0000:07:00.0: control channel starting...
> [    7.422859] thunderbolt 0000:07:00.0: starting TX ring 0
> [    7.424174] thunderbolt 0000:07:00.0: enabling interrupt at
> register 0x38200 bit 0 (0x0 -> 0x1)
> [    7.425617] thunderbolt 0000:07:00.0: starting RX ring 0
> [    7.427030] thunderbolt 0000:07:00.0: enabling interrupt at
> register 0x38200 bit 12 (0x1 -> 0x1001)
> [    7.429077] thunderbolt 0000:07:00.0: initializing Switch at 0x0
> (depth: 0, up port: 5)
> [    7.429251] ACPI: Smart Battery System [SBS0]: Battery Slot [BAT0]
> (battery present)
> [    7.431479] thunderbolt 0000:07:00.0: old switch config:
> [    7.432900] thunderbolt 0000:07:00.0:  Switch: 8086:1547 (Revision:
> 3, TB Version: 1)
> [    7.434327] thunderbolt 0000:07:00.0:   Max Port Number: 12
> [    7.435749] thunderbolt 0000:07:00.0:   Config:
> [    7.437216] thunderbolt 0000:07:00.0:    Upstream Port Number: 5
> Depth: 0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 255ms
> [    7.438664] thunderbolt 0000:07:00.0:    unknown1: 0x0 unknown4: 0x0=

> [    7.447649] bcma-pci-bridge 0000:04:00.0: enabling device (0000 -> 0=
002)
> [    7.448712] bcma: bus0: Found chip with id 0x4331, rev 0x02 and pack=
age 0x09
> [    7.450140] bcma: bus0: Core 0 found: ChipCommon (manuf 0x4BF, id
> 0x800, rev 0x25, class 0x0)
> [    7.451518] bcma: bus0: Core 1 found: IEEE 802.11 (manuf 0x4BF, id
> 0x812, rev 0x1D, class 0x0)
> [    7.453039] bcma: bus0: Core 2 found: PCIe (manuf 0x4BF, id 0x820,
> rev 0x13, class 0x0)
> [    7.507183] thunderbolt 0000:07:00.0: 0: uid: 0x1000000000000
> [    7.508266] thunderbolt 0000:07:00.0:  Port 0: 8086:1547 (Revision:
> 3, TB Version: 1, Type: Port (0x1))
> [    7.509621] thunderbolt 0000:07:00.0:   Max hop id (in/out): 7/7
> [    7.510454] bcma: bus0: Bus registered
> [    7.512540] thunderbolt 0000:07:00.0:   Max counters: 8
> [    7.512543] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.513008] thunderbolt 0000:07:00.0:  Port 1: 8086:1547 (Revision:
> 3, TB Version: 1, Type: Port (0x1))
> [    7.513011] thunderbolt 0000:07:00.0:   Max hop id (in/out): 15/15
> [    7.513013] thunderbolt 0000:07:00.0:   Max counters: 16
> [    7.513015] thunderbolt 0000:07:00.0:   NFC Credits: 0x3c00000
> [    7.516698] thunderbolt 0000:07:00.0:  Port 2: 8086:1547 (Revision:
> 3, TB Version: 1, Type: Port (0x1))
> [    7.516710] thunderbolt 0000:07:00.0:   Max hop id (in/out): 15/15
> [    7.516712] thunderbolt 0000:07:00.0:   Max counters: 16
> [    7.516714] thunderbolt 0000:07:00.0:   NFC Credits: 0x3c00000
> [    7.517149] thunderbolt 0000:07:00.0:  Port 3: 8086:1547 (Revision:
> 3, TB Version: 1, Type: Port (0x1))
> [    7.517151] thunderbolt 0000:07:00.0:   Max hop id (in/out): 15/15
> [    7.517153] thunderbolt 0000:07:00.0:   Max counters: 16
> [    7.517155] thunderbolt 0000:07:00.0:   NFC Credits: 0x3c00000
> [    7.517648] thunderbolt 0000:07:00.0:  Port 4: 8086:1547 (Revision:
> 3, TB Version: 1, Type: Port (0x1))
> [    7.517650] thunderbolt 0000:07:00.0:   Max hop id (in/out): 15/15
> [    7.517651] thunderbolt 0000:07:00.0:   Max counters: 16
> [    7.517653] thunderbolt 0000:07:00.0:   NFC Credits: 0x3c00000
> [    7.517746] thunderbolt 0000:07:00.0:  Port 5: 8086:1547 (Revision:
> 3, TB Version: 1, Type: NHI (0x2))
> [    7.517749] thunderbolt 0000:07:00.0:   Max hop id (in/out): 11/11
> [    7.517750] thunderbolt 0000:07:00.0:   Max counters: 16
> [    7.517752] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.517847] thunderbolt 0000:07:00.0:  Port 6: 8086:1547 (Revision:
> 3, TB Version: 1, Type: PCIe (0x100101))
> [    7.517849] thunderbolt 0000:07:00.0:   Max hop id (in/out): 8/8
> [    7.517851] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.517853] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.517957] thunderbolt 0000:07:00.0:  Port 7: 8086:1547 (Revision:
> 3, TB Version: 1, Type: PCIe (0x100101))
> [    7.517959] thunderbolt 0000:07:00.0:   Max hop id (in/out): 8/8
> [    7.517961] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.517963] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.518047] thunderbolt 0000:07:00.0:  Port 8: 8086:1547 (Revision:
> 3, TB Version: 1, Type: PCIe (0x100101))
> [    7.518049] thunderbolt 0000:07:00.0:   Max hop id (in/out): 8/8
> [    7.518051] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.518052] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.518147] thunderbolt 0000:07:00.0:  Port 9: 8086:1547 (Revision:
> 3, TB Version: 1, Type: PCIe (0x100101))
> [    7.518149] thunderbolt 0000:07:00.0:   Max hop id (in/out): 8/8
> [    7.518151] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.518153] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.518246] thunderbolt 0000:07:00.0:  Port 10: ffff:ffff
> (Revision: 3, TB Version: 1, Type: DP/HDMI (0xe0102))
> [    7.518248] thunderbolt 0000:07:00.0:   Max hop id (in/out): 9/9
> [    7.518250] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.518252] thunderbolt 0000:07:00.0:   NFC Credits: 0x700000
> [    7.518345] thunderbolt 0000:07:00.0:  Port 11: 8086:1547
> (Revision: 3, TB Version: 1, Type: DP/HDMI (0xe0101))
> [    7.518347] thunderbolt 0000:07:00.0:   Max hop id (in/out): 9/9
> [    7.518349] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.518351] thunderbolt 0000:07:00.0:   NFC Credits: 0xf00000
> [    7.518445] thunderbolt 0000:07:00.0:  Port 12: 8086:1547
> (Revision: 3, TB Version: 1, Type: DP/HDMI (0xe0101))
> [    7.518447] thunderbolt 0000:07:00.0:   Max hop id (in/out): 9/9
> [    7.518449] thunderbolt 0000:07:00.0:   Max counters: 2
> [    7.518451] thunderbolt 0000:07:00.0:   NFC Credits: 0xf00000
> [    7.518844] thunderbolt 0000:07:00.0: 0:1: is unplugged (state: 7)
> [    7.518984] thunderbolt 0000:07:00.0: 0:3: is unplugged (state: 7)
> [    7.531297] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 000=
2)
> [    7.532561] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 000=
2)
> [    7.532568] snd_hda_intel 0000:01:00.1: Disabling MSI
> [    7.532581] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio =
client
> [    7.533322] thunderbolt 0000:07:00.0: resetting error on 0:b.
> [    7.533471] thunderbolt 0000:07:00.0: resetting error on 0:c.
> [    7.533576] thunderbolt 0000:07:00.0: 0:b: hotplug: scanning
> [    7.533579] thunderbolt 0000:07:00.0: 0:b: hotplug: no switch found
> [    7.533584] thunderbolt 0000:07:00.0: 0:c: hotplug: scanning
> [    7.533585] thunderbolt 0000:07:00.0: 0:c: hotplug: no switch found
> [    7.591993] snd_hda_codec_cirrus hdaudioC0D0: autoconfig for
> CS4206: line_outs=3D2 (0xb/0xa/0x0/0x0/0x0) type:speaker
> [    7.591996] snd_hda_codec_cirrus hdaudioC0D0:    speaker_outs=3D0
> (0x0/0x0/0x0/0x0/0x0)
> [    7.591998] snd_hda_codec_cirrus hdaudioC0D0:    hp_outs=3D1
> (0x9/0x0/0x0/0x0/0x0)
> [    7.591999] snd_hda_codec_cirrus hdaudioC0D0:    mono: mono_out=3D0x=
0
> [    7.592000] snd_hda_codec_cirrus hdaudioC0D0:    dig-out=3D0x10/0x0
> [    7.592001] snd_hda_codec_cirrus hdaudioC0D0:    inputs:
> [    7.592004] snd_hda_codec_cirrus hdaudioC0D0:      Mic=3D0xe
> [    7.628433] input: HDA Intel PCH Headphone as
> /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
> [    7.657989] applesmc: key=3D493 fan=3D2 temp=3D44 index=3D43 acc=3D0=
 lux=3D2 kbd=3D1
> [    7.740499] Adding 18448380k swap on /dev/sda6.  Priority:-1
> extents:1 across:18448380k SS
> [    7.759484] input: HDA NVidia HDMI/DP,pcm=3D3 as
> /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11
> [    7.764705] input: HDA NVidia HDMI/DP,pcm=3D7 as
> /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input12
> [    7.770475] input: HDA NVidia HDMI/DP,pcm=3D8 as
> /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input13
> [    7.810025] cfg80211: World regulatory domain updated:
> [    7.810027] cfg80211:  DFS Master region: unset
> [    7.810027] cfg80211:   (start_freq - end_freq @ bandwidth),
> (max_antenna_gain, max_eirp), (dfs_cac_time)
> [    7.810028] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz),
> (N/A, 2000 mBm), (N/A)
> [    7.810029] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz),
> (N/A, 2000 mBm), (N/A)
> [    7.810030] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz),
> (N/A, 2000 mBm), (N/A)
> [    7.810031] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz,
> 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
> [    7.810032] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz,
> 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
> [    7.810033] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz),
> (N/A, 2000 mBm), (0 s)
> [    7.810033] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
> (N/A, 2000 mBm), (N/A)
> [    7.810034] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
> KHz), (N/A, 0 mBm), (N/A)
> [    7.832765] EXT4-fs (sda5): mounted filesystem with ordered data
> mode. Opts: (null)
> [    7.834940] b43-phy0: Broadcom 4331 WLAN found (core revision 29)
> [    7.835391] b43-phy0: Found PHY: Analog 9, Type 7 (HT), Revision 1
> [    7.835402] b43-phy0: Found Radio: Manuf 0x17F, ID 0x2059, Revision
> 0, Version 1
> [    7.835404] b43-phy0 warning: 5 GHz band is unsupported on this PHY
> [    7.836420] Broadcom 43xx driver loaded [ Features: PNLS ]
> [    7.851610] ieee80211 phy0: Selected rate control algorithm 'minstre=
l_ht'
> [    7.878385] cfg80211: Regulatory domain changed to country: AU
> [    7.878387] cfg80211:  DFS Master region: ETSI
> [    7.878387] cfg80211:   (start_freq - end_freq @ bandwidth),
> (max_antenna_gain, max_eirp), (dfs_cac_time)
> [    7.878389] cfg80211:   (2402000 KHz - 2482000 KHz @ 40000 KHz),
> (N/A, 2000 mBm), (N/A)
> [    7.878391] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz,
> 160000 KHz AUTO), (N/A, 1700 mBm), (N/A)
> [    7.878392] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz,
> 160000 KHz AUTO), (N/A, 2400 mBm), (0 s)
> [    7.878393] cfg80211:   (5490000 KHz - 5710000 KHz @ 160000 KHz),
> (N/A, 2400 mBm), (0 s)
> [    7.878394] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
> (N/A, 3000 mBm), (N/A)
> [    7.884215] b43 bcma0:1 wlp4s0b1: renamed from wlan0
> [    7.910128] input: bcm5974 as
> /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8.2/2-1.8.2:1.2/inp=
ut/input14
> [    7.921108] usbcore: registered new interface driver bcm5974
> [    8.746038] nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
> [    8.766375] ip6_tables: (C) 2000-2006 Netfilter Core Team
> [    8.852757] Ebtables v2.0 registered
> [    8.867685] bridge: automatic filtering via arp/ip/ip6tables has
> been deprecated. Update your scripts to load br_netfilter if you need
> this.
> [    9.324200] IPv6: ADDRCONF(NETDEV_UP): wlp4s0b1: link is not ready
> [    9.479104] b43-phy0: Loading firmware version 666.2 (2011-02-23 01:=
15:07)
> [    9.539583] IPv6: ADDRCONF(NETDEV_UP): wlp4s0b1: link is not ready
> [    9.616667] IPv6: ADDRCONF(NETDEV_UP): wlp4s0b1: link is not ready
> [   10.557348] wlp4s0b1: authenticate with 00:04:ed:fa:3f:75
> [   10.570142] wlp4s0b1: send auth to 00:04:ed:fa:3f:75 (try 1/3)
> [   10.571892] wlp4s0b1: authenticated
> [   10.573176] wlp4s0b1: associate with 00:04:ed:fa:3f:75 (try 1/3)
> [   10.575465] wlp4s0b1: RX AssocResp from 00:04:ed:fa:3f:75
> (capab=3D0x411 status=3D0 aid=3D9)
> [   10.575871] wlp4s0b1: associated
> [   10.575925] IPv6: ADDRCONF(NETDEV_CHANGE): wlp4s0b1: link becomes re=
ady
> [   12.216360] tun: Universal TUN/TAP device driver, 1.6
> [   12.216364] tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
> [   12.367608] device virbr0-nic entered promiscuous mode
> [   12.571227] virbr0: port 1(virbr0-nic) entered listening state
> [   12.571534] virbr0: port 1(virbr0-nic) entered listening state
> [   12.614921] virbr0: port 1(virbr0-nic) entered disabled state
> [   18.114176] Adjusting tsc more than 11% (8359593 vs 8115223)
> [   26.090144] fuse init (API version 7.23)
> [  224.374505] CPU4: Core temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374506] CPU0: Core temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374513] CPU1: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374514] CPU5: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374515] CPU4: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374516] CPU0: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374517] CPU6: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374518] CPU2: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374529] CPU7: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374530] CPU3: Package temperature above threshold, cpu clock
> throttled (total events =3D 1)
> [  224.374848] mce: [Hardware Error]: Machine check events logged
> [  224.375481] CPU4: Core temperature/speed normal
> [  224.375483] CPU5: Package temperature/speed normal
> [  224.375483] CPU0: Core temperature/speed normal
> [  224.375486] CPU2: Package temperature/speed normal
> [  224.375487] CPU6: Package temperature/speed normal
> [  224.375488] CPU0: Package temperature/speed normal
> [  224.375490] CPU1: Package temperature/speed normal
> [  224.375491] mce: [Hardware Error]: Machine check events logged
> [  224.375497] CPU4: Package temperature/speed normal
> [  224.375509] CPU3: Package temperature/speed normal
> [  224.375510] CPU7: Package temperature/speed normal
> [ 6047.734844] show_signal_msg: 76 callbacks suppressed
> [ 6047.734850] lt-virgl_test_s[21395]: segfault at 249872ff8 ip
> 00000031ed68378d sp 00007ffe2cde9a30 error 4 in
> libc-2.21.so[31ed600000+1b7000]
> [ 6048.800654] lt-virgl_test_s[21415]: segfault at 24b887708 ip
> 00007f711e7038a7 sp 00007ffe2cde9a80 error 6 in
> nouveau_dri.so[7f711e4b9000+847000]
> [ 6050.782309] BUG: unable to handle kernel paging request at ffffc9000=
2378000
> [ 6050.782330] IP: [<ffffffff813d7dce>] iowrite32+0x2e/0x40
> [ 6050.782341] PGD 45e899067 PUD 45e89a067 PMD 45708c067 PTE 0
> [ 6050.782352] Oops: 0002 [#1] SMP
> [ 6050.782360] Modules linked in: fuse xt_CHECKSUM ipt_MASQUERADE
> nf_nat_masquerade_ipv4 tun ccm ip6t_REJECT nf_reject_ipv6 xt_conntrack
> ebtable_nat ebtable_broute bridge stp llc ebtable_filter ebtables
> ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6
> ip6table_mangle ip6table_security ip6table_raw ip6table_filter
> ip6_tables iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4
> nf_nat nf_conntrack iptable_mangle iptable_security iptable_raw joydev
> bcm5974 nls_utf8 hfsplus arc4 b43 ssb mac80211 cfg80211 rfkill
> snd_hda_codec_hdmi applesmc snd_hda_codec_cirrus snd_hda_codec_generic
> input_polldev snd_hda_intel snd_hda_codec snd_hwdep snd_hda_core bcma
> x86_pkg_temp_thermal thunderbolt coretemp kvm_intel sbs kvm irqbypass
> sbshc crc32c_intel snd_pcm snd_timer apple_gmux lpc_ich snd mfd_core
> soundcore
> [ 6050.782523]  i2c_i801 apple_bl pcspkr sdhci_pci nouveau sdhci
> mxm_wmi mmc_core wmi i915 ttm i2c_algo_bit drm_kms_helper drm i2c_core
> video
> [ 6050.782557] CPU: 4 PID: 21479 Comm: lt-virgl_test_s Not tainted
> 4.4.0-rc3+ #44
> [ 6050.782566] Hardware name: Apple Inc.
> MacBookPro10,1/Mac-C3EC7CD22292981F, BIOS
> MBP101.88Z.00EE.B02.1208081132 08/08/2012
> [ 6050.782575] task: ffff8803b0212540 ti: ffff88007c3cc000 task.ti:
> ffff88007c3cc000
> [ 6050.782583] RIP: 0010:[<ffffffff813d7dce>]  [<ffffffff813d7dce>]
> iowrite32+0x2e/0x40
> [ 6050.782593] RSP: 0018:ffff88007c3cfaf0  EFLAGS: 00010292
> [ 6050.782598] RAX: ffff880457d7f370 RBX: 0000000000008004 RCX: ffff880=
457322518
> [ 6050.782606] RDX: 0000000000000010 RSI: ffffc90002378000 RDI: 0000000=
000000010
> [ 6050.782613] RBP: ffff88007c3cfaf8 R08: ffff88007c3cfab0 R09: fffffff=
fa0337080
> [ 6050.782619] R10: 0000000000000000 R11: 0000000000000000 R12: ffff880=
443c22000
> [ 6050.782627] R13: ffff880089d06400 R14: 0000000000001001 R15: ffff880=
456e28c40
> [ 6050.782634] FS:  00007f711f3c7700(0000) GS:ffff88046f300000(0000)
> knlGS:0000000000000000
> [ 6050.782642] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6050.782648] CR2: ffffc90002378000 CR3: 0000000067fd2000 CR4: 0000000=
0001406e0
> [ 6050.782655] Stack:
> [ 6050.782658]  ffffffffa02a8634 ffff88007c3cfb80 ffffffffa02cfe28
> 0000000000000000
> [ 6050.782670]  ffff880457322028 0000000000000007 ffff880457322000
> ffff880457322518
> [ 6050.782682]  ffff8803b0212d10 ffff88007c3cfb70 ffffffff810f4fef
> ffff8803b0212540
> [ 6050.782695] Call Trace:
> [ 6050.782730]  [<ffffffffa02a8634>] ? nvkm_instobj_wr32+0x14/0x20 [nou=
veau]
Hey Dave,

I know about this one, and hit it myself when I was investigating
parallel piglit recently.

I have a partial fix for that race in my tree, but I've discovered that
it can still race with fault recovery so I held it back from mainline
until I finish up a more complete series of improvements to that area.

It wouldn't hurt to push the partial fixes now though, if necessary.

Thanks,
Ben.

> [ 6050.787479]  [<ffffffffa02cfe28>]
> gk104_fifo_runlist_update+0xd8/0x2b0 [nouveau]
> [ 6050.787494]  [<ffffffff810f4fef>] ? mark_held_locks+0x6f/0xa0
> [ 6050.787502]  [<ffffffff811247bd>] ? ktime_get+0x7d/0x140
> [ 6050.787529]  [<ffffffffa02d465c>] gk104_fifo_gpfifo_fini+0x8c/0xb0 [=
nouveau]
> [ 6050.787554]  [<ffffffffa02d04b4>] nvkm_fifo_chan_fini+0x14/0x20 [nou=
veau]
> [ 6050.787570]  [<ffffffffa026c3ab>] nvkm_object_fini+0xeb/0x230 [nouve=
au]
> [ 6050.787585]  [<ffffffffa026a98c>] nvkm_ioctl_del+0x2c/0x90 [nouveau]=

> [ 6050.787613]  [<ffffffffa026b1a7>] nvkm_ioctl+0x107/0x260 [nouveau]
> [ 6050.787639]  [<ffffffffa02ffb92>] ? nvkm_client_ioctl+0x12/0x20 [nou=
veau]
> [ 6050.787665]  [<ffffffffa02ffb92>] nvkm_client_ioctl+0x12/0x20 [nouve=
au]
> [ 6050.787679]  [<ffffffffa0268042>] nvif_object_ioctl+0x42/0x50 [nouve=
au]
> [ 6050.787695]  [<ffffffffa026860a>] nvif_object_fini+0x5a/0x80 [nouvea=
u]
> [ 6050.787721]  [<ffffffffa0315c11>] nouveau_channel_del+0x61/0x100 [no=
uveau]
> [ 6050.787747]  [<ffffffffa0314d05>]
> nouveau_abi16_chan_fini.isra.1+0x125/0x1d0 [nouveau]
> [ 6050.787771]  [<ffffffffa0314ca9>] ?
> nouveau_abi16_chan_fini.isra.1+0xc9/0x1d0 [nouveau]
> [ 6050.787796]  [<ffffffffa03154c7>]
> nouveau_abi16_ioctl_channel_free+0x77/0x90 [nouveau]
> [ 6050.787813]  [<ffffffffa002c942>] drm_ioctl+0x152/0x560 [drm]
> [ 6050.787821]  [<ffffffff811122ed>] ? debug_lockdep_rcu_enabled+0x1d/0=
x20
> [ 6050.787843]  [<ffffffffa0315450>] ? nouveau_abi16_usif+0xd0/0xd0 [no=
uveau]
> [ 6050.787852]  [<ffffffff810f5149>] ? trace_hardirqs_on_caller+0x129/0=
x1b0
> [ 6050.787859]  [<ffffffff810f51dd>] ? trace_hardirqs_on+0xd/0x10
> [ 6050.787883]  [<ffffffffa02fd7e8>] nouveau_drm_ioctl+0x68/0xc0 [nouve=
au]
> [ 6050.787894]  [<ffffffff8123ea02>] do_vfs_ioctl+0x2e2/0x530
> [ 6050.787902]  [<ffffffff81343ca3>] ? security_file_ioctl+0x43/0x60
> [ 6050.787910]  [<ffffffff8123ecc9>] SyS_ioctl+0x79/0x90
> [ 6050.787920]  [<ffffffff817b6772>] entry_SYSCALL_64_fastpath+0x12/0x7=
6
> [ 6050.787926] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f
> b7 d6 89 f8 ef c3 55 48 89 f7 48 c7 c6 c5 01 a9 81 48 89 e5 e8 54 fe
> ff ff 5d c3 <89> 3e c3 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48
> 81 ff
> [ 6050.788030] RIP  [<ffffffff813d7dce>] iowrite32+0x2e/0x40
> [ 6050.788038]  RSP <ffff88007c3cfaf0>
> [ 6050.788043] CR2: ffffc90002378000
> [ 6050.803566] ---[ end trace a3a72076405d69bb ]---
> [ 6050.803570] BUG: sleeping function called from invalid context at
> /home/airlied/devel/kernel/drm-next/include/linux/sched.h:2776
> [ 6050.803572] in_atomic(): 0, irqs_disabled(): 1, pid: 21479, name:
> lt-virgl_test_s
> [ 6050.803572] INFO: lockdep is turned off.
> [ 6050.803573] irq event stamp: 498928
> [ 6050.803574] hardirqs last  enabled at (498927):
> [<ffffffff817b729a>] restore_regs_and_iret+0x0/0x1d
> [ 6050.803579] hardirqs last disabled at (498928):
> [<ffffffff817b8ac3>] error_entry+0x63/0xb0
> [ 6050.803581] softirqs last  enabled at (498926):
> [<ffffffff810a678a>] __do_softirq+0x37a/0x450
> [ 6050.803584] softirqs last disabled at (498563):
> [<ffffffff810a6a31>] irq_exit+0xc1/0xd0
> [ 6050.803587] CPU: 4 PID: 21479 Comm: lt-virgl_test_s Tainted: G
> D         4.4.0-rc3+ #44
> [ 6050.803588] Hardware name: Apple Inc.
> MacBookPro10,1/Mac-C3EC7CD22292981F, BIOS
> MBP101.88Z.00EE.B02.1208081132 08/08/2012
> [ 6050.803590]  ffffffff81a482f8 ffff88007c3cf810 ffffffff813bd1f9
> ffff8803b0212540
> [ 6050.803592]  ffff88007c3cf838 ffffffff810ca979 ffffffff81a482f8
> 0000000000000ad8
> [ 6050.803594]  0000000000000000 ffff88007c3cf860 ffffffff810caa79
> ffff8803b0212540
> [ 6050.803596] Call Trace:
> [ 6050.803601]  [<ffffffff813bd1f9>] dump_stack+0x4b/0x72
> [ 6050.803603]  [<ffffffff810ca979>] ___might_sleep+0x179/0x230
> [ 6050.803604]  [<ffffffff810caa79>] __might_sleep+0x49/0x80
> [ 6050.803607]  [<ffffffff810b2444>] exit_signals+0x24/0x130
> [ 6050.803610]  [<ffffffff810a2bd2>] do_exit+0xb2/0xb90
> [ 6050.803614]  [<ffffffff81109970>] ? kmsg_dump+0x120/0x190
> [ 6050.803616]  [<ffffffff8101ed5a>] oops_end+0x9a/0xd0
> [ 6050.803619]  [<ffffffff8106a17b>] no_context+0x10b/0x350
> [ 6050.803622]  [<ffffffff8106a448>] __bad_area_nosemaphore+0x88/0x200
> [ 6050.803624]  [<ffffffff8106a5d3>] bad_area_nosemaphore+0x13/0x20
> [ 6050.803625]  [<ffffffff8106a8af>] __do_page_fault+0xcf/0x450
> [ 6050.803628]  [<ffffffff810f5149>] ? trace_hardirqs_on_caller+0x129/0=
x1b0
> [ 6050.803630]  [<ffffffff81003030>] ? trace_hardirqs_off_thunk+0x17/0x=
19
> [ 6050.803632]  [<ffffffff8106ac52>] do_page_fault+0x22/0x30
> [ 6050.803634]  [<ffffffff817b88b8>] page_fault+0x28/0x30
> [ 6050.803637]  [<ffffffff813d7dce>] ? iowrite32+0x2e/0x40
> [ 6050.803656]  [<ffffffffa02a8634>] ? nvkm_instobj_wr32+0x14/0x20 [nou=
veau]
> [ 6050.803673]  [<ffffffffa02cfe28>]
> gk104_fifo_runlist_update+0xd8/0x2b0 [nouveau]
> [ 6050.803675]  [<ffffffff810f4fef>] ? mark_held_locks+0x6f/0xa0
> [ 6050.803677]  [<ffffffff811247bd>] ? ktime_get+0x7d/0x140
> [ 6050.803693]  [<ffffffffa02d465c>] gk104_fifo_gpfifo_fini+0x8c/0xb0 [=
nouveau]
> [ 6050.803708]  [<ffffffffa02d04b4>] nvkm_fifo_chan_fini+0x14/0x20 [nou=
veau]
> [ 6050.803717]  [<ffffffffa026c3ab>] nvkm_object_fini+0xeb/0x230 [nouve=
au]
> [ 6050.803726]  [<ffffffffa026a98c>] nvkm_ioctl_del+0x2c/0x90 [nouveau]=

> [ 6050.803734]  [<ffffffffa026b1a7>] nvkm_ioctl+0x107/0x260 [nouveau]
> [ 6050.803751]  [<ffffffffa02ffb92>] ? nvkm_client_ioctl+0x12/0x20 [nou=
veau]
> [ 6050.803766]  [<ffffffffa02ffb92>] nvkm_client_ioctl+0x12/0x20 [nouve=
au]
> [ 6050.803774]  [<ffffffffa0268042>] nvif_object_ioctl+0x42/0x50 [nouve=
au]
> [ 6050.803781]  [<ffffffffa026860a>] nvif_object_fini+0x5a/0x80 [nouvea=
u]
> [ 6050.803797]  [<ffffffffa0315c11>] nouveau_channel_del+0x61/0x100 [no=
uveau]
> [ 6050.803812]  [<ffffffffa0314d05>]
> nouveau_abi16_chan_fini.isra.1+0x125/0x1d0 [nouveau]
> [ 6050.803826]  [<ffffffffa0314ca9>] ?
> nouveau_abi16_chan_fini.isra.1+0xc9/0x1d0 [nouveau]
> [ 6050.803840]  [<ffffffffa03154c7>]
> nouveau_abi16_ioctl_channel_free+0x77/0x90 [nouveau]
> [ 6050.803847]  [<ffffffffa002c942>] drm_ioctl+0x152/0x560 [drm]
> [ 6050.803849]  [<ffffffff811122ed>] ? debug_lockdep_rcu_enabled+0x1d/0=
x20
> [ 6050.803863]  [<ffffffffa0315450>] ? nouveau_abi16_usif+0xd0/0xd0 [no=
uveau]
> [ 6050.803865]  [<ffffffff810f5149>] ? trace_hardirqs_on_caller+0x129/0=
x1b0
> [ 6050.803867]  [<ffffffff810f51dd>] ? trace_hardirqs_on+0xd/0x10
> [ 6050.803882]  [<ffffffffa02fd7e8>] nouveau_drm_ioctl+0x68/0xc0 [nouve=
au]
> [ 6050.803884]  [<ffffffff8123ea02>] do_vfs_ioctl+0x2e2/0x530
> [ 6050.803887]  [<ffffffff81343ca3>] ? security_file_ioctl+0x43/0x60
> [ 6050.803889]  [<ffffffff8123ecc9>] SyS_ioctl+0x79/0x90
> [ 6050.803890]  [<ffffffff817b6772>] entry_SYSCALL_64_fastpath+0x12/0x7=
6
>=20


--WlDfHkD2D1L7Mjx5dJiEtv0cbLuBUP8OB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWYrN8AAoJEHYLnGJQkpH7pNcP/iV3CywK9oCMJT9WwXSdD8e3
r7kbvE/0TD66Am2ZjEIv5XijoD/SlZAX1Z5Cvj8vy2p5sa8DUcaMbEF77WPC+Bfs
qZeQYCYV/XfAwJP0fpehXb2MOi6GREwIqCnlFoEGmweJimNxw96B/KHcMl8oJOIz
l02TQ3G4K78xWz83DpoXPiFqu4wSxwPgz8xZ7vo2OJma3T2sK0MCHi71svD+Hofm
k36NNAjvu830ap/uZogMKyYunGmBGgHp8zHQtk4ag933tEvNpXw1Hwzm5zq0SnFQ
nkVl09OxxtFClcJeLTyhfeq8jkw5CYmOs3FATWqUuzQ/q2PmUTbxZu8O3kE5tzHF
JaQbDV5+a4XJhoF1Tt3QK5excLzE/De29lCKLJ5or6zAhUbEmJPodG+RK+92DRXy
lWXGtOrx+cvYg9zABeIqi8JWXhaepSeHWad7zW2cFvBLFuJrcnI7Ml32LFk6CG36
Pj+t7c1H3me9kQQpv7jsdx8cSxwYSa2xjXYshc/dFgtexTn7zvyjmZ8e8lMEDqHQ
8Dj/KugHCMHh0rUvGatjCFEkWctQ0n2QtwvLiyYrMC1DqDbiZhZTkMCODtE/OZ/I
nlMbLIBbQiA8JAjJELJRM8ZoJTsi6VAuvFLACojlfHtXYYx41xNZ4ckZhluPJ8aU
gfNlglrPeG2a2HlDO0X8
=SKRv
-----END PGP SIGNATURE-----

--WlDfHkD2D1L7Mjx5dJiEtv0cbLuBUP8OB--

--===============1113805870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1113805870==--
