From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: "(EE) NOUVEAU(0): Unable to allocate GART memory"
	(TNT-2)
Date: Fri, 19 Nov 2010 18:51:30 +0100
Message-ID: <87lj4ptd5p.fsf@riseup.net>
References: <20101116214015.15A3C940003@tippex.mynet.homeunix.org>
	<87wrocvobd.fsf@riseup.net>
	<20101117212826.016CF3BC00E@tippex.mynet.homeunix.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0656849085=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101117212826.016CF3BC00E-ZOnKU5P2/IUVO05zmlNvLXEk6Bp1+KyB2LY78lusg7I@public.gmane.org> (Anders
	Eriksson's message of "Wed, 17 Nov 2010 22:28:25 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0656849085==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org> writes:

> currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org said:
>> Can you boot with "drm.debug=3D3 log_buf_len=3D512k" in your kernel comm=
and line,
>> start X and attach the full output from "dmesg"?
>
> Sure thing:
>
Weird, nouveau_bo_new() is returning -ENOMEM even though you should have
plenty of GART space available. To rule out an AGP backend issue, can
you try to reproduce it with "nouveau.noagp=3D1" in the kernel command
line? (attach full kernel logs if you can)

> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 2.6.35.7 (anders@tippex) (gcc version 4.4.3 =
(Gentoo 4.4.3-r2 p1.2) ) #33 PREEMPT Mon Oct 11 13:46:33 CEST 2010
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000]  BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
> [    0.000000]  BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
> [    0.000000]  BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
> [    0.000000]  BIOS-e820: 0000000000100000 - 0000000028000000 (usable)
> [    0.000000]  BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)
> [    0.000000] Notice: NX (Execute Disable) protection missing in CPU or =
disabled in BIOS!
> [    0.000000] DMI 2.1 present.
> [    0.000000] e820 update range: 0000000000000000 - 0000000000001000 (us=
able) =3D=3D> (reserved)
> [    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (us=
able)
> [    0.000000] last_pfn =3D 0x28000 max_arch_pfn =3D 0x100000
> [    0.000000] MTRR default type: uncachable
> [    0.000000] MTRR fixed ranges enabled:
> [    0.000000]   00000-9FFFF write-back
> [    0.000000]   A0000-BFFFF uncachable
> [    0.000000]   C0000-C7FFF write-protect
> [    0.000000]   C8000-EFFFF uncachable
> [    0.000000]   F0000-FFFFF write-protect
> [    0.000000] MTRR variable ranges enabled:
> [    0.000000]   0 base 000000000 mask FE0000000 write-back
> [    0.000000]   1 disabled
> [    0.000000]   2 disabled
> [    0.000000]   3 disabled
> [    0.000000]   4 disabled
> [    0.000000]   5 disabled
> [    0.000000]   6 disabled
> [    0.000000]   7 disabled
> [    0.000000] initial memory mapped : 0 - 01000000
> [    0.000000] init_memory_mapping: 0000000000000000-0000000028000000
> [    0.000000]  0000000000 - 0000400000 page 4k
> [    0.000000]  0000400000 - 0028000000 page 2M
> [    0.000000] kernel direct mapping tables up to 28000000 @ 7000-b000
> [    0.000000] ACPI: RSDP 000e8010 00014 (v00 COMPAQ)
> [    0.000000] ACPI: RSDT 000e8080 0002C (v01 COMPAQ PANTHER  00000001   =
   00000000)
> [    0.000000] ACPI: FACP 000e80cc 00074 (v01 COMPAQ PANTHER  00000001   =
   00000000)
> [    0.000000] ACPI Warning: Optional field Pm2ControlBlock has zero addr=
ess or length: 0x0000000000000000/0x1 (20100428/tbfadt-557)
> [    0.000000] ACPI: DSDT 000e8140 00037 (v01 COMPAQ DSDTTBL  00000001 MS=
FT 01000007)
> [    0.000000] ACPI: FACS 000e8040 00040
> [    0.000000] ACPI: SSDT 000e8177 02603 (v01 COMPAQ PANTHTBL 00000001 MS=
FT 01000007)
> [    0.000000] 640MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 28000000
> [    0.000000]   low ram: 0 - 28000000
> [    0.000000] Zone PFN ranges:
> [    0.000000]   DMA      0x00000001 -> 0x00001000
> [    0.000000]   Normal   0x00001000 -> 0x00028000
> [    0.000000] Movable zone start PFN for each node
> [    0.000000] early_node_map[2] active PFN ranges
> [    0.000000]     0: 0x00000001 -> 0x0000009f
> [    0.000000]     0: 0x00000100 -> 0x00028000
> [    0.000000] On node 0 totalpages: 163742
> [    0.000000] free_area_init_node: node 0, pgdat c080a8ac, node_mem_map =
c1000020
> [    0.000000]   DMA zone: 32 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3966 pages, LIFO batch:0
> [    0.000000]   Normal zone: 1248 pages used for memmap
> [    0.000000]   Normal zone: 158496 pages, LIFO batch:31
> [    0.000000] Using APIC driver default
> [    0.000000] ACPI: PM-Timer IO Port: 0xee08
> [    0.000000] Local APIC disabled by BIOS -- reenabling.
> [    0.000000] Found and enabled local APIC!
> [    0.000000] nr_irqs_gsi: 16
> [    0.000000] PM: Registered nosave memory: 000000000009f000 - 000000000=
00a0000
> [    0.000000] PM: Registered nosave memory: 00000000000a0000 - 000000000=
00f0000
> [    0.000000] PM: Registered nosave memory: 00000000000f0000 - 000000000=
0100000
> [    0.000000] Allocating PCI resources starting at 28000000 (gap: 280000=
00:d7fe0000)
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 162462
> [    0.000000] Kernel command line: ro lapic root=3D/dev/sda1 disable_mtr=
r_trim drm.debug=3D3 log_buf_len=3D512k
> [    0.000000] log_buf_len: 524288
> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 by=
tes)
> [    0.000000] Enabling fast FPU save and restore... done.
> [    0.000000] Initializing CPU#0
> [    0.000000] allocated 3276780 bytes of page_cgroup
> [    0.000000] please try 'cgroup_disable=3Dmemory' option if you don't w=
ant memory cgroups
> [    0.000000] Subtract (23 early reservations)
> [    0.000000]   #0 [0000100000 - 0000cb2a70]   TEXT DATA BSS
> [    0.000000]   #1 [000009fc00 - 0000100000]   BIOS reserved
> [    0.000000]   #2 [0000cb3000 - 0000cb7310]             BRK
> [    0.000000]   #3 [0000001000 - 0000005000]     ACPI WAKEUP
> [    0.000000]   #4 [0001000000 - 0001500000]         BOOTMEM
> [    0.000000]   #5 [0001500000 - 0001500004]         BOOTMEM
> [    0.000000]   #6 [0001500020 - 00015002e0]         BOOTMEM
> [    0.000000]   #7 [00015002e0 - 000150031c]         BOOTMEM
> [    0.000000]   #8 [0001500320 - 000150b320]         BOOTMEM
> [    0.000000]   #9 [000150b320 - 000150b3c8]         BOOTMEM
> [    0.000000]   #10 [000150b3e0 - 000150b420]         BOOTMEM
> [    0.000000]   #11 [000150b420 - 000150b460]         BOOTMEM
> [    0.000000]   #12 [000150b460 - 000150b4a0]         BOOTMEM
> [    0.000000]   #13 [000150b4a0 - 000150b4e0]         BOOTMEM
> [    0.000000]   #14 [000150b4e0 - 000150b520]         BOOTMEM
> [    0.000000]   #15 [000150b520 - 000150b530]         BOOTMEM
> [    0.000000]   #16 [000150b540 - 000150b587]         BOOTMEM
> [    0.000000]   #17 [000150b5a0 - 000150b5e7]         BOOTMEM
> [    0.000000]   #18 [000150b600 - 000158b600]         BOOTMEM
> [    0.000000]   #19 [000158b600 - 000158f600]         BOOTMEM
> [    0.000000]   #20 [000158f600 - 000160f600]         BOOTMEM
> [    0.000000]   #21 [000160f600 - 000164f600]         BOOTMEM
> [    0.000000]   #22 [0001650000 - 000196ffec]         BOOTMEM
> [    0.000000] Memory: 633288k/655360k available (3872k kernel code, 2168=
0k reserved, 3355k data, 300k init, 0k highmem)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xfffa3000 - 0xfffff000   ( 368 kB)
> [    0.000000]     vmalloc : 0xe8800000 - 0xfffa1000   ( 375 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xe8000000   ( 640 MB)
> [    0.000000]       .init : 0xc0810000 - 0xc085b000   ( 300 kB)
> [    0.000000]       .data : 0xc04c836c - 0xc080f024   (3355 kB)
> [    0.000000]       .text : 0xc0100000 - 0xc04c836c   (3872 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] NR_IRQS:288
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc=
., Ingo Molnar
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
> [    0.000000] ... CHAINHASH_SIZE:          16384
> [    0.000000]  memory used by lock dependency info: 3807 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000] Fast TSC calibration using PIT
> [    0.000000] Detected 448.147 MHz processor.
> [    0.008067] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 896.29 BogoMIPS (lpj=3D1792588)
> [    0.008577] pid_max: default: 32768 minimum: 301
> [    0.010668] Mount-cache hash table entries: 512
> [    0.016514] Initializing cgroup subsys debug
> [    0.016763] Initializing cgroup subsys ns
> [    0.017005] Initializing cgroup subsys cpuacct
> [    0.017253] Initializing cgroup subsys memory
> [    0.018468] Performance Events: p6 PMU driver.
> [    0.019060] ... version:                0
> [    0.019291] ... bit width:              32
> [    0.019521] ... generic registers:      2
> [    0.019750] ... value mask:             00000000ffffffff
> [    0.020029] ... max period:             000000007fffffff
> [    0.020285] ... fixed-purpose events:   0
> [    0.020519] ... event mask:             0000000000000003
> [    0.020768] CPU: Intel Pentium II (Deschutes) stepping 02
> [    0.021416] ACPI: Core revision 20100428
> [    0.069979] ACPI: setting ELCR to 0200 (from 0808)
> [    0.089824] Enabling APIC mode:  Flat.  Using 0 I/O APICs
> [    0.112450] PM: Adding info for No Bus:platform
> [    0.245347] NET: Registered protocol family 16
> [    0.339233] PM: Adding info for No Bus:vtcon0
> [    0.382245] ACPI: bus type pci registered
> [    0.398466] PM: Adding info for No Bus:id
> [    0.438249] PCI: PCI BIOS revision 2.10 entry at 0xfa144, last bus=3D1
> [    0.439759] PCI: Using configuration type 1 for base access
> [    2.505887] PM: Adding info for No Bus:default
> [    2.529708] bio: create slab <bio-0> at 0
> [    2.956459] ACPI: EC: Look up EC in DSDT
> [    3.555044] ACPI: Interpreter enabled
> [    3.556305] ACPI: (supports S0 S1 S4 S5)
> [    3.562904] ACPI: Using PIC for interrupt routing
> [    3.606053] PM: Adding info for acpi:LNXSYSTM:00
> [    3.625799] PM: Adding info for acpi:LNXCPU:00
> [    3.651282] PM: Adding info for acpi:LNXSYBUS:00
> [    3.672920] PM: Adding info for acpi:PNP0C0C:00
> [    3.813413] PM: Adding info for acpi:PNP0C0F:00
> [    3.845498] PM: Adding info for acpi:PNP0C0F:01
> [    3.882324] PM: Adding info for acpi:PNP0C0F:02
> [    3.914094] PM: Adding info for acpi:PNP0C0F:03
> [    3.942511] PM: Adding info for acpi:PNP0C01:00
> [    3.965850] PM: Adding info for acpi:PNP0A03:00
> [    3.994136] PM: Adding info for acpi:PNP0C02:00
> [    4.027613] PM: Adding info for acpi:device:00
> [    4.054883] PM: Adding info for acpi:device:01
> [    4.086948] PM: Adding info for acpi:device:02
> [    4.115595] PM: Adding info for acpi:device:03
> [    4.138408] PM: Adding info for acpi:PNP0C04:00
> [    4.164422] PM: Adding info for acpi:PNP0000:00
> [    4.185533] PM: Adding info for acpi:PNP0100:00
> [    4.212310] PM: Adding info for acpi:PNP0200:00
> [    4.233404] PM: Adding info for acpi:PNP0B00:00
> [    4.259268] PM: Adding info for acpi:PNP0800:00
> [    4.282548] PM: Adding info for acpi:PNP0F13:00
> [    4.311307] PM: Adding info for acpi:PNP0303:00
> [    4.374452] PM: Adding info for acpi:PNP0400:00
> [    4.433460] PM: Adding info for acpi:PNP0501:00
> [    4.490685] PM: Adding info for acpi:PNP0700:00
> [    4.516847] PM: Adding info for acpi:LNXTHERM:00
> [    4.531077] PM: Adding info for acpi:LNXTHERM:01
> [    4.573009] PM: Adding info for acpi:LNXPWRBN:00
> [    4.619184] PCI: Ignoring host bridge windows from ACPI; if necessary,=
 use "pci=3Duse_crs" and report a bug
> [    4.635639] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    4.641231] PM: Adding info for No Bus:pci0000:00
> [    4.644336] PM: Adding info for No Bus:0000:00
> [    4.677010] pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7=
] (ignored)
> [    4.677362] pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff=
] (ignored)
> [    4.677721] pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x=
000bffff] (ignored)
> [    4.678086] pci_root PNP0A03:00: host bridge window [mem 0x000c8000-0x=
000dffff] (ignored)
> [    4.678455] pci_root PNP0A03:00: host bridge window [mem 0xfd100000-0x=
ffdfffff] (ignored)
> [    4.682320] pci 0000:00:00.0: reg 10: [mem 0x44000000-0x47ffffff pref]
> [    4.699767] pci 0000:00:03.0: reg 10: [mem 0x48000000-0x48001fff]
> [    4.710597] pci 0000:00:04.0: reg 10: [mem 0x41000000-0x4101ffff]
> [    4.711515] pci 0000:00:04.0: reg 14: [io  0x10b0-0x10b7]
> [    4.712823] pci 0000:00:04.0: reg 18: [io  0x10b8-0x10bf]
> [    4.718197] pci 0000:00:04.0: supports D2
> [    4.725856] pci 0000:00:12.0: reg 10: [io  0x1000-0x107f]
> [    4.726777] pci 0000:00:12.0: reg 14: [mem 0x41200000-0x412003ff]
> [    4.730441] pci 0000:00:12.0: reg 30: [mem 0x00000000-0x0003ffff pref]
> [    4.733516] pci 0000:00:12.0: supports D1 D2
> [    4.733807] pci 0000:00:12.0: PME# supported from D1 D2 D3hot
> [    4.734372] pci 0000:00:12.0: PME# disabled
> [    4.747834] pci 0000:00:14.1: reg 20: [io  0x10a0-0x10af]
> [    4.755760] pci 0000:00:14.2: reg 20: [io  0x1080-0x109f]
> [    4.760333] * Found PM-Timer Bug on the chipset. Due to workarounds fo=
r a bug,
> [    4.760490] * this clock source is slow. Consider trying other clock s=
ources
> [    4.769630] pci 0000:00:14.3: quirk: [io  0xee00-0xee3f] claimed by PI=
IX4 ACPI
> [    4.771800] pci 0000:00:14.3: quirk: [io  0xee80-0xee8f] claimed by PI=
IX4 SMB
> [    4.785128] pci 0000:01:00.0: reg 10: [mem 0x40000000-0x40ffffff]
> [    4.786063] pci 0000:01:00.0: reg 14: [mem 0x42000000-0x43ffffff pref]
> [    4.789708] pci 0000:01:00.0: reg 30: [mem 0x00000000-0x0000ffff pref]
> [    4.801818] pci 0000:00:01.0: PCI bridge to [bus 01-01]
> [    4.803533] pci 0000:00:01.0:   bridge window [io  0xf000-0x0000] (dis=
abled)
> [    4.804527] pci 0000:00:01.0:   bridge window [mem 0x40000000-0x40ffff=
ff]
> [    4.805161] pci 0000:00:01.0:   bridge window [mem 0x42000000-0x43ffff=
ff pref]
> [    4.806249] pci_bus 0000:00: on NUMA node 0
> [    4.806727] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
> [    4.867613] PM: Adding info for pci:0000:00:00.0
> [    4.916562] PM: Adding info for pci:0000:00:01.0
> [    4.959818] PM: Adding info for pci:0000:00:03.0
> [    5.008790] PM: Adding info for pci:0000:00:04.0
> [    5.052940] PM: Adding info for pci:0000:00:12.0
> [    5.101900] PM: Adding info for pci:0000:00:14.0
> [    5.146121] PM: Adding info for pci:0000:00:14.1
> [    5.195094] PM: Adding info for pci:0000:00:14.2
> [    5.241271] PM: Adding info for pci:0000:00:14.3
> [    5.261127] PM: Adding info for pci:0000:01:00.0
> [    5.273212] PM: Adding info for No Bus:0000:01
> [    5.311179] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11)
> [    5.327807] ACPI: PCI Interrupt Link [LNKB] (IRQs *3 4 5 6 7 10 11)
> [    5.344386] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 *11)
> [    5.360496] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 *11)
> [    5.405907] PM: Adding info for No Bus:vga_arbiter
> [    5.422609] vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    5.424547] vgaarb: loaded
> [    5.473774] SCSI subsystem initialized
> [    5.486758] libata version 3.00 loaded.
> [    5.519518] usbcore: registered new interface driver usbfs
> [    5.544503] usbcore: registered new interface driver hub
> [    5.563549] usbcore: registered new device driver usb
> [    5.647651] Advanced Linux Sound Architecture Driver Version 1.0.23.
> [    5.664524] PCI: Using ACPI for IRQ routing
> [    5.665823] PCI: pci_cache_line_size set to 32 bytes
> [    5.678539] reserve RAM buffer: 000000000009fc00 - 000000000009ffff=20
> [    5.705027] PM: Adding info for No Bus:lo
> [    5.724932] Bluetooth: Core ver 2.15
> [    5.735241] NET: Registered protocol family 31
> [    5.736297] Bluetooth: HCI device and connection manager initialized
> [    5.739168] Bluetooth: HCI socket layer initialized
> [    5.767190] PM: Adding info for platform:regulatory.0
> [    5.777061] cfg80211: Calling CRDA to update world regulatory domain
> [    5.801829] Switching to clocksource tsc
> [    5.810527] pnp: PnP ACPI init
> [    5.813774] PM: Adding info for No Bus:pnp0
> [    5.814157] ACPI: bus type pnp registered
> [    5.857916] PM: Adding info for pnp:00:00
> [    5.892028] PM: Adding info for pnp:00:01
> [    5.918874] PM: Adding info for pnp:00:02
> [    5.946596] ERROR: Unable to locate IOAPIC for GSI 13
> [    5.955759] PM: Adding info for pnp:00:03
> [    5.978490] PM: Adding info for pnp:00:04
> [    5.994591] ERROR: Unable to locate IOAPIC for GSI 8
> [    6.004659] PM: Adding info for pnp:00:05
> [    6.025170] PM: Adding info for pnp:00:06
> [    6.040547] ERROR: Unable to locate IOAPIC for GSI 12
> [    6.052048] PM: Adding info for pnp:00:07
> [    6.063030] ERROR: Unable to locate IOAPIC for GSI 1
> [    6.074441] PM: Adding info for pnp:00:08
> [    6.112640] PM: Adding info for pnp:00:09
> [    6.159581] ERROR: Unable to locate IOAPIC for GSI 4
> [    6.175239] PM: Adding info for pnp:00:0a
> [    6.233134] ERROR: Unable to locate IOAPIC for GSI 6
> [    6.246068] PM: Adding info for pnp:00:0b
> [    6.255419] pnp: PnP ACPI: found 12 devices
> [    6.256622] ACPI: ACPI bus type pnp unregistered
> [    6.259725] system 00:00: [mem 0x00000000-0x0009ffff] could not be res=
erved
> [    6.262021] system 00:00: [mem 0x000e0000-0x000fffff] could not be res=
erved
> [    6.263882] system 00:00: [mem 0x00100000-0xfd0fffff] could not be res=
erved
> [    6.266188] system 00:00: [mem 0xfff80000-0xffffffff] could not be res=
erved
> [    6.269608] system 00:02: [io  0x04d0-0x04d1] has been reserved
> [    6.271274] system 00:02: [io  0xee00-0xee3f] has been reserved
> [    6.273381] system 00:02: [io  0xee40-0xee7f] has been reserved
> [    6.275051] system 00:02: [io  0xee80-0xee8f] has been reserved
> [    6.303793] PM: Adding info for No Bus:mem
> [    6.318477] PM: Adding info for No Bus:null
> [    6.334853] PM: Adding info for No Bus:port
> [    6.346023] PM: Adding info for No Bus:zero
> [    6.359496] PM: Adding info for No Bus:full
> [    6.373593] PM: Adding info for No Bus:random
> [    6.389757] PM: Adding info for No Bus:urandom
> [    6.402554] PM: Adding info for No Bus:kmsg
> [    6.417213] PM: Adding info for No Bus:tty
> [    6.431748] PM: Adding info for No Bus:console
> [    6.448106] PM: Adding info for No Bus:tty0
> [    6.470827] PM: Adding info for No Bus:vcs
> [    6.486192] PM: Adding info for No Bus:vcsa
> [    6.503116] PM: Adding info for No Bus:vcs1
> [    6.514735] PM: Adding info for No Bus:vcsa1
> [    6.529756] PM: Adding info for No Bus:tty1
> [    6.543312] PM: Adding info for No Bus:tty2
> [    6.559518] PM: Adding info for No Bus:tty3
> [    6.570826] PM: Adding info for No Bus:tty4
> [    6.584384] PM: Adding info for No Bus:tty5
> [    6.599122] PM: Adding info for No Bus:tty6
> [    6.615712] PM: Adding info for No Bus:tty7
> [    6.627240] PM: Adding info for No Bus:tty8
> [    6.641280] PM: Adding info for No Bus:tty9
> [    6.654898] PM: Adding info for No Bus:tty10
> [    6.671201] PM: Adding info for No Bus:tty11
> [    6.682615] PM: Adding info for No Bus:tty12
> [    6.697177] PM: Adding info for No Bus:tty13
> [    6.710855] PM: Adding info for No Bus:tty14
> [    6.727800] PM: Adding info for No Bus:tty15
> [    6.739234] PM: Adding info for No Bus:tty16
> [    6.753896] PM: Adding info for No Bus:tty17
> [    6.767613] PM: Adding info for No Bus:tty18
> [    6.784008] PM: Adding info for No Bus:tty19
> [    6.795952] PM: Adding info for No Bus:tty20
> [    6.810125] PM: Adding info for No Bus:tty21
> [    6.823857] PM: Adding info for No Bus:tty22
> [    6.841642] PM: Adding info for No Bus:tty23
> [    6.853149] PM: Adding info for No Bus:tty24
> [    6.866927] PM: Adding info for No Bus:tty25
> [    6.881143] PM: Adding info for No Bus:tty26
> [    6.898257] PM: Adding info for No Bus:tty27
> [    6.909813] PM: Adding info for No Bus:tty28
> [    6.923625] PM: Adding info for No Bus:tty29
> [    6.937879] PM: Adding info for No Bus:tty30
> [    6.954940] PM: Adding info for No Bus:tty31
> [    6.966537] PM: Adding info for No Bus:tty32
> [    6.980365] PM: Adding info for No Bus:tty33
> [    6.995320] PM: Adding info for No Bus:tty34
> [    7.011842] PM: Adding info for No Bus:tty35
> [    7.024003] PM: Adding info for No Bus:tty36
> [    7.038339] PM: Adding info for No Bus:tty37
> [    7.055180] PM: Adding info for No Bus:tty38
> [    7.067185] PM: Adding info for No Bus:tty39
> [    7.081529] PM: Adding info for No Bus:tty40
> [    7.095927] PM: Adding info for No Bus:tty41
> [    7.113212] PM: Adding info for No Bus:tty42
> [    7.124458] PM: Adding info for No Bus:tty43
> [    7.138863] PM: Adding info for No Bus:tty44
> [    7.153267] PM: Adding info for No Bus:tty45
> [    7.170096] PM: Adding info for No Bus:tty46
> [    7.182190] PM: Adding info for No Bus:tty47
> [    7.197335] PM: Adding info for No Bus:tty48
> [    7.211359] PM: Adding info for No Bus:tty49
> [    7.228310] PM: Adding info for No Bus:tty50
> [    7.240073] PM: Adding info for No Bus:tty51
> [    7.254554] PM: Adding info for No Bus:tty52
> [    7.269419] PM: Adding info for No Bus:tty53
> [    7.286147] PM: Adding info for No Bus:tty54
> [    7.299287] PM: Adding info for No Bus:tty55
> [    7.313765] PM: Adding info for No Bus:tty56
> [    7.330537] PM: Adding info for No Bus:tty57
> [    7.342376] PM: Adding info for No Bus:tty58
> [    7.357147] PM: Adding info for No Bus:tty59
> [    7.371241] PM: Adding info for No Bus:tty60
> [    7.387988] PM: Adding info for No Bus:tty61
> [    7.400310] PM: Adding info for No Bus:tty62
> [    7.415211] PM: Adding info for No Bus:tty63
> [    7.487622] pci 0000:00:12.0: BAR 6: assigned [mem 0x28000000-0x2803ff=
ff pref]
> [    7.490226] pci 0000:01:00.0: BAR 6: can't assign mem pref (size 0x100=
00)
> [    7.491861] pci 0000:00:01.0: PCI bridge to [bus 01-01]
> [    7.493617] pci 0000:00:01.0:   bridge window [io  disabled]
> [    7.495501] pci 0000:00:01.0:   bridge window [mem 0x40000000-0x40ffff=
ff]
> [    7.497860] pci 0000:00:01.0:   bridge window [mem 0x42000000-0x43ffff=
ff pref]
> [    7.501201] pci_bus 0000:00: resource 0 [io  0x0000-0xffff]
> [    7.501529] pci_bus 0000:00: resource 1 [mem 0x00000000-0xffffffff]
> [    7.501877] pci_bus 0000:01: resource 1 [mem 0x40000000-0x40ffffff]
> [    7.502223] pci_bus 0000:01: resource 2 [mem 0x42000000-0x43ffffff pre=
f]
> [    7.514112] NET: Registered protocol family 2
> [    7.553515] IP route cache hash table entries: 32768 (order: 5, 131072=
 bytes)
> [    7.683956] TCP established hash table entries: 131072 (order: 8, 1048=
576 bytes)
> [    7.718101] TCP bind hash table entries: 65536 (order: 9, 2621440 byte=
s)
> [    8.183938] TCP: Hash tables configured (established 131072 bind 65536)
> [    8.186698] TCP reno registered
> [    8.188174] UDP hash table entries: 512 (order: 3, 49152 bytes)
> [    8.197703] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes)
> [    8.225004] NET: Registered protocol family 1
> [    8.265324] RPC: Registered udp transport module.
> [    8.266664] RPC: Registered tcp transport module.
> [    8.268001] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    8.270672] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    8.278740] pci 0000:01:00.0: Boot video device
> [    8.279404] PCI: CLS 32 bytes, default 32
> [    8.348977] PM: Adding info for platform:pcspkr
> [    8.422393] PM: Adding info for No Bus:snapshot
> [    8.561494] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
> [    8.601480] PM: Adding info for No Bus:autofs
> [    8.615882] msgmni has been set to 1236
> [    8.693478] alg: No test for stdrng (krng)
> [    8.698526] io scheduler noop registered
> [    8.699700] io scheduler deadline registered
> [    8.703699] io scheduler cfq registered (default)
> [    8.740758] PM: Adding info for No Bus:fbcon
> [    8.815044] PM: Adding info for No Bus:input0
> [    8.833110] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0C:00/input/input0
> [    8.837242] ACPI: Power Button [PBTN]
> [    8.853732] PM: Adding info for No Bus:input1
> [    8.864679] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input1
> [    8.866888] ACPI: Power Button [PWRF]
> [    8.914362] ACPI: acpi_idle registered with cpuidle
> [    8.923467] Marking TSC unstable due to TSC halts in idle
> [    8.943100] Switching to clocksource acpi_pm
> [    8.961639] PM: Adding info for No Bus:cooling_device0
> [    9.021426] PM: Adding info for No Bus:thermal_zone0
> [    9.045187] thermal LNXTHERM:01: registered as thermal_zone0
> [    9.049727] ACPI: Thermal Zone [THRM] (80 C)
> [    9.085149] PM: Adding info for No Bus:ptmx
> [    9.094498] Linux agpgart interface v0.103
> [    9.151343] agpgart-intel 0000:00:00.0: Intel 440BX Chipset
> [    9.187191] PM: Adding info for No Bus:agpgart
> [    9.202576] agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0x440000=
00
> [    9.231621] [drm] Initialized drm 1.1.0 20060810
> [    9.235665] PM: Adding info for No Bus:ttm
> [    9.251799] [drm:drm_init],=20
> [    9.255812] [drm:drm_get_dev],=20
> [    9.275563] ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
> [    9.277626] PCI: setting IRQ 11 as level-triggered
> [    9.277991] nouveau 0000:01:00.0: PCI INT A -> Link[LNKA] -> GSI 11 (l=
evel, low) -> IRQ 11
> [    9.570020] [drm:drm_get_minor],=20
> [    9.592798] PM: Adding info for No Bus:controlD64
> [    9.601901] [drm:drm_get_minor], new minor assigned 64
> [    9.602254] [drm:drm_get_minor],=20
> [    9.627251] PM: Adding info for No Bus:card0
> [    9.642142] [drm:drm_get_minor], new minor assigned 0
> [    9.686749] [drm] nouveau 0000:01:00.0: nouveau_load:705 - vendor: 0x1=
0DE device: 0x28 class: 0x30000
> [    9.886123] [drm] nouveau 0000:01:00.0: nouveau_load:725 - regs mapped=
 ok at 0x40000000
> [    9.886450] [drm] nouveau 0000:01:00.0: Detected an NV 0 generation ca=
rd (0x20154000)
> [    9.913203] [drm] nouveau 0000:01:00.0: nouveau_card_init:410 - prev s=
tate =3D 0
> [    9.914776] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image =
from PRAMIN
> [   10.084994] [drm] nouveau 0000:01:00.0: ... appears to be valid
> [   10.154110] [drm] nouveau 0000:01:00.0: BMP BIOS found
> [   10.155496] [drm] nouveau 0000:01:00.0: BMP version 5.1
> [   10.157575] [drm] nouveau 0000:01:00.0: Bios version 02.05.17.06
> [   10.159085] [drm] nouveau 0000:01:00.0: Assuming a CRT output exists
> [   10.161306] [drm] nouveau 0000:01:00.0: Probing TV encoders on I2C bus=
: 1
> [   10.170177] PM: Adding info for i2c:i2c-0
> [   10.194246] [drm] nouveau 0000:01:00.0: No TV encoders found.
> [   10.195719] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0x8000404F
> [   10.196039] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data:=
 0x00001114
> [   10.197006] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00101000, Data:=
 0x8000404F
> [   10.254784] [drm] nouveau 0000:01:00.0: 0x0146: [ (0x65) - INIT_RESET ]
> [   10.255093] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000184C, Data:=
 0x00000000
> [   10.255408] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data:=
 0x00000000
> [   10.255726] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data:=
 0x01010100
> [   10.256063] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data:=
 0x01110100
> [   10.256998] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data:=
 0x00000000
> [   10.257315] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001850, Data:=
 0x00000001
> [   10.257629] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001850, Data:=
 0x00000000
> [   10.257959] [drm] nouveau 0000:01:00.0: 0x0153: [ (0x6E) - INIT_NV_REG=
 ]
> [   10.258314] [drm] nouveau 0000:01:00.0: 0x0153: Reg: 0x00101000, Mask:=
 0xFFFFFFC3, Data: 0x8000000C
> [   10.258652] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0x8000404F
> [   10.258972] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00101000, Data:=
 0x8000404F
> [   10.259305] [drm] nouveau 0000:01:00.0: 0x0160: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.259617] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000010E0, Data:=
 0xF0F000F0
> [   10.259949] [drm] nouveau 0000:01:00.0: 0x0169: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.260879] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001080, Data:=
 0x04040000
> [   10.261211] [drm] nouveau 0000:01:00.0: 0x0172: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.261523] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000010B0, Data:=
 0x0800BBA7
> [   10.261854] [drm] nouveau 0000:01:00.0: 0x017B: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.262166] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000010B4, Data:=
 0xEFE00000
> [   10.262498] [drm] nouveau 0000:01:00.0: 0x0184: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.262810] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000010B8, Data:=
 0x88C98200
> [   10.263142] [drm] nouveau 0000:01:00.0: 0x018D: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.263453] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000010BC, Data:=
 0xFF988AA9
> [   10.263785] [drm] nouveau 0000:01:00.0: 0x0196: [ (0x79) - INIT_PLL ]
> [   10.264108] [drm] nouveau 0000:01:00.0: 0x0196: Reg: 0x00680500, Freq:=
 142000kHz
> [   10.265034] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   10.265313] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   10.265584] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   10.265867] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   10.266149] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   10.266415] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   10.266683] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   10.266949] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   10.267216] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   10.267476] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   10.267742] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   10.268092] [drm] nouveau 0000:01:00.0: 0x019D: [ (0x79) - INIT_PLL ]
> [   10.269035] [drm] nouveau 0000:01:00.0: 0x019D: Reg: 0x00680504, Freq:=
 166000kHz
> [   10.269338] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   10.269616] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   10.269887] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   10.270169] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   10.270451] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   10.270717] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   10.270985] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   10.271251] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   10.271518] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   10.271778] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   10.272044] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   10.273010] [drm] nouveau 0000:01:00.0: 0x01A4: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.273321] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data:=
 0x00001114
> [   10.273654] [drm] nouveau 0000:01:00.0: 0x01AD: [ (0x79) - INIT_PLL ]
> [   10.273976] [drm] nouveau 0000:01:00.0: 0x01AD: Reg: 0x00680508, Freq:=
 36000kHz
> [   10.274279] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   10.274557] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   10.274828] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   10.275111] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   10.275392] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   10.275658] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   10.275926] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   10.276811] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   10.277078] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   10.277339] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   10.277604] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   10.277959] [drm] nouveau 0000:01:00.0: 0x01B4: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.278267] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000C0, Data:=
 0x00000000
> [   10.278600] [drm] nouveau 0000:01:00.0: 0x01BD: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.278913] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100080, Data:=
 0x20002800
> [   10.279244] [drm] nouveau 0000:01:00.0: 0x01C6: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.279557] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100204, Data:=
 0x42216293
> [   10.279889] [drm] nouveau 0000:01:00.0: 0x01CF: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.280816] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100300, Data:=
 0x00000000
> [   10.281148] [drm] nouveau 0000:01:00.0: 0x01D8: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.281458] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001084, Data:=
 0x000057C8
> [   10.281786] [drm] nouveau 0000:01:00.0: 0x01E1: [ (0x63) - INIT_COMPUT=
E_MEM ]
> [   10.282104] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data:=
 0x80000000
> [   10.282423] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data:=
 0x00001114
> [   10.282754] [drm] nouveau 0000:01:00.0: 0x01E2: [ (0x6E) - INIT_NV_REG=
 ]
> [   10.283102] [drm] nouveau 0000:01:00.0: 0x01E2: Reg: 0x00100000, Mask:=
 0xFFFFFFFF, Data: 0x00000000
> [   10.283437] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100000, Data:=
 0x0000001F
> [   10.283754] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100000, Data:=
 0x0000001F
> [   10.284083] [drm] nouveau 0000:01:00.0: 0x01EF: [ (0x6E) - INIT_NV_REG=
 ]
> [   10.285052] [drm] nouveau 0000:01:00.0: 0x01EF: Reg: 0x00100204, Mask:=
 0x00000000, Data: 0xC2216293
> [   10.285391] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100204, Data:=
 0xC2216293
> [   10.285711] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100204, Data:=
 0xC2216293
> [   10.286043] [drm] nouveau 0000:01:00.0: 0x01FC: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.286354] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068050C, Data:=
 0x00000500
> [   10.286685] [drm] nouveau 0000:01:00.0: 0x0205: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.286994] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001088, Data:=
 0x000001F0
> [   10.287326] [drm] nouveau 0000:01:00.0: 0x020E: [ (0x7A) - INIT_ZM_REG=
 ]
> [   10.287635] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000108C, Data:=
 0x000000E1
> [   10.287966] [drm] nouveau 0000:01:00.0: 0x0217: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.288945] [drm] nouveau 0000:01:00.0: 0x0217: Port: 0x03D4, Index: 0=
x38, Mask: 0x00, Data: 0x00
> [   10.289317] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x38, Head: 0x00, Data: 0x00
> [   10.289697] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x38, Head: 0x00, Data: 0x00
> [   10.290055] [drm] nouveau 0000:01:00.0: 0x021D: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.290417] [drm] nouveau 0000:01:00.0: 0x021D: Port: 0x03D4, Index: 0=
x1A, Mask: 0x00, Data: 0x3F
> [   10.290788] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x1A, Head: 0x00, Data: 0x3D
> [   10.291170] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x1A, Head: 0x00, Data: 0x3F
> [   10.291528] [drm] nouveau 0000:01:00.0: 0x0223: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.291887] [drm] nouveau 0000:01:00.0: 0x0223: Port: 0x03D4, Index: 0=
x28, Mask: 0x00, Data: 0x00
> [   10.292878] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x28, Head: 0x00, Data: 0x00
> [   10.293258] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x28, Head: 0x00, Data: 0x00
> [   10.293616] [drm] nouveau 0000:01:00.0: 0x0229: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.293976] [drm] nouveau 0000:01:00.0: 0x0229: Port: 0x03D4, Index: 0=
x33, Mask: 0x00, Data: 0x00
> [   10.294346] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x33, Head: 0x00, Data: 0x00
> [   10.294725] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x33, Head: 0x00, Data: 0x00
> [   10.295083] [drm] nouveau 0000:01:00.0: 0x022F: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.295444] [drm] nouveau 0000:01:00.0: 0x022F: Port: 0x03D4, Index: 0=
x21, Mask: 0x00, Data: 0xFA
> [   10.295816] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x21, Head: 0x00, Data: 0xFA
> [   10.296816] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x21, Head: 0x00, Data: 0xFA
> [   10.297174] [drm] nouveau 0000:01:00.0: 0x0235: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.297534] [drm] nouveau 0000:01:00.0: 0x0235: Port: 0x03D4, Index: 0=
x2B, Mask: 0x07, Data: 0x00
> [   10.297904] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x2B, Head: 0x00, Data: 0x00
> [   10.298284] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x2B, Head: 0x00, Data: 0x00
> [   10.298642] [drm] nouveau 0000:01:00.0: 0x023B: [ (0x78) - INIT_INDEX_=
IO ]
> [   10.299001] [drm] nouveau 0000:01:00.0: 0x023B: Port: 0x03D4, Index: 0=
x2C, Mask: 0x00, Data: 0x00
> [   10.299371] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x2C, Head: 0x00, Data: 0x00
> [   10.299750] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x2C, Head: 0x00, Data: 0x00
> [   10.300725] [drm] nouveau 0000:01:00.0: 0x0241: [ (0x71) - INIT_DONE ]
> [   10.301047] [drm] nouveau 0000:01:00.0: 0x0242: [ (0x71) - INIT_DONE ]
> [   10.301355] [drm] nouveau 0000:01:00.0: Detected 16MiB VRAM
> [   10.302761] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_early_init:297 =
-=20
> [   10.303076] [drm] nouveau 0000:01:00.0: nv04_instmem_determine_amount:=
49 - RAMIN size: 512KiB
> [   10.443444] [drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_t=
ables:73 - RAMHT offset=3D0x10000, size=3D4096
> [   10.443816] [drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_t=
ables:79 - RAMRO offset=3D0x11200, size=3D512
> [   10.444807] [drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_t=
ables:102 - RAMFC offset=3D0x11400, size=3D512
> [   10.453405] [TTM] Zone  kernel: Available graphics memory: 316644 kiB.
> [   10.454925] [TTM] Initializing pool allocator.
> [   10.483052] agpgart-intel 0000:00:00.0: AGP 1.0 bridge
> [   10.487760] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x =
mode
> [   10.497757] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
> [   10.499747] [drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
> [   10.505271] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_init:310 -=20
> [   10.505659] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:580 - =
p_offset=3D0x00010000 b_offset=3D0xffffffff size=3D0x00001000 flags=3D0x000=
00003
> [   10.506055] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:585 - =
gpuobj e7f52b60
> [   10.509166] [drm:drm_irq_install], irq=3D11
> [   10.510280] [drm] nouveau 0000:01:00.0: Allocating FIFO number 0
> [   10.661067] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init:97=
0 - ch0 vram=3D0x80000002 tt=3D0x80000003
> [   10.661463] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h-1 h=3D0x00000000 gpuobj=3De7f52b60
> [   10.661877] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h0 class=3D0x003d offset=3D0x0 size=3D0xf80000
> [   10.662239] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D0
> [   10.662623] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.662980] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f52720
> [   10.663288] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.663704] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000002 gpuobj=3De7f52720
> [   10.664080] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000002
> [   10.665056] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000090
> [   10.665456] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x00000090: h=3D0x80000002, c=3D0x80001160
> [   10.665880] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h0 class=3D0x003d offset=3D0x0 size=3D0x4000000
> [   10.666246] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D3
> [   10.666632] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.666988] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f526e0
> [   10.667296] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.667712] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000003 gpuobj=3De7f526e0
> [   10.668087] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000003
> [   10.669061] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000098
> [   10.669460] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x00000098: h=3D0x80000003, c=3D0x80001161
> [   10.669885] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h0 class=3D0x003d offset=3D0x0 size=3D0x4000000
> [   10.670255] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D1 target=3D3
> [   10.670641] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.670997] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f526a0
> [   10.671304] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.671716] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x00000000 gpuobj=3De7f526a0
> [   10.672077] [drm] nouveau 0000:01:00.0: nv04_graph_create_context:401 =
- nv04_graph_context_create 0
> [   10.673292] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:580 - =
p_offset=3D0x00011400 b_offset=3D0xffffffff size=3D0x00000020 flags=3D0x000=
00006
> [   10.673687] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:585 - =
gpuobj e7f52660
> [   10.674631] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h-1 h=3D0x00000000 gpuobj=3De7f52660
> [   10.677090] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x0039
> [   10.677473] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.677830] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f52620
> [   10.678137] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.678548] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000001 gpuobj=3De7f52620
> [   10.678922] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000001
> [   10.679258] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000088
> [   10.679654] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x00000088: h=3D0x80000001, c=3D0x80011163
> [   10.680073] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x8000000e gpuobj=3De7f525e0
> [   10.681086] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x8000000e
> [   10.681422] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000f0
> [   10.681818] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000f0: h=3D0x8000000e, c=3D0x80000004
> [   10.682258] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h0 class=3D0x003d offset=3D0x40000 size=3D0x20
> [   10.682620] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D0
> [   10.683004] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.683360] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f525a0
> [   10.683667] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.684085] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000006 gpuobj=3De7f525a0
> [   10.685099] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000006
> [   10.685434] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000b0
> [   10.685831] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000b0: h=3D0x80000006, c=3D0x80001164
> [   10.689316] [drm] nouveau 0000:01:00.0: nouveau_pgraph_intr_context_sw=
itch:551 - PGRAPH context switch interrupt channel 0
> [   10.693224] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initial=
ised FIFO 0
> [   10.695261] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h0 class=3D0x003d offset=3D0x0 size=3D0x1000000
> [   10.695623] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D0
> [   10.696008] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.697005] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f524e0
> [   10.697313] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.697732] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000004 gpuobj=3De7f524e0
> [   10.698107] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000004
> [   10.698442] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000a0
> [   10.698839] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000a0: h=3D0x80000004, c=3D0x80001165
> [   10.699263] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h0 class=3D0x003d offset=3D0x0 size=3D0x4000000
> [   10.699630] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D3
> [   10.700015] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   10.701009] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e7f524a0
> [   10.701317] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   10.701737] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000005 gpuobj=3De7f524a0
> [   10.702112] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000005
> [   10.702447] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000a8
> [   10.702845] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000a8: h=3D0x80000005, c=3D0x80001166
> [   10.703185] [drm] nouveau 0000:01:00.0: Saving VGA fonts
> [   10.818156] [drm] nouveau 0000:01:00.0: Detected a VGA connector
> [   10.819959] [drm:drm_sysfs_connector_add], adding "VGA-1" to sysfs
> [   10.823041] PM: Adding info for No Bus:card0-VGA-1
> [   10.837489] [drm:drm_sysfs_hotplug_event], generating hotplug event
> [   10.846746] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   10.847025] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   10.847296] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   10.847579] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   10.847861] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   10.848755] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   10.849022] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   10.849288] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   10.849554] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   10.849815] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   10.850081] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   10.852927] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga enc=
oder (output 0)
> [   10.869024] PM: Adding info for i2c:i2c-1
> [   11.234348] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x0042
> [   11.234728] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   11.235081] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e73e4de0
> [   11.235385] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   11.235797] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000008 gpuobj=3De73e4de0
> [   11.236788] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000008
> [   11.237120] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000c0
> [   11.237513] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000c0: h=3D0x80000008, c=3D0x80011167
> [   11.237889] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x0019
> [   11.238267] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   11.238619] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e73e4da0
> [   11.238924] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   11.239335] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x8000000b gpuobj=3De73e4da0
> [   11.239705] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x8000000b
> [   11.240036] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000d8
> [   11.241051] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000d8: h=3D0x8000000b, c=3D0x80011168
> [   11.241427] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x0043
> [   11.241805] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   11.242157] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e73e4d60
> [   11.242461] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   11.242875] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x80000009 gpuobj=3De73e4d60
> [   11.243244] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x80000009
> [   11.243575] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000c8
> [   11.243967] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000c8: h=3D0x80000009, c=3D0x80011169
> [   11.244963] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x0044
> [   11.245342] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   11.245693] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e73e4d20
> [   11.245997] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   11.246411] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x8000000a gpuobj=3De73e4d20
> [   11.246782] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x8000000a
> [   11.247113] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000d0
> [   11.247505] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000d0: h=3D0x8000000a, c=3D0x8001116a
> [   11.247880] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x004a
> [   11.248879] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   11.249232] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e73e4ce0
> [   11.249536] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   11.249951] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x8000000c gpuobj=3De73e4ce0
> [   11.250320] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x8000000c
> [   11.250651] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000e0
> [   11.251044] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000e0: h=3D0x8000000c, c=3D0x8001116b
> [   11.251419] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
0 class=3D0x005f
> [   11.251797] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [   11.252769] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e73e4ca0
> [   11.253074] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [   11.253490] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h0 h=3D0x8000000d gpuobj=3De73e4ca0
> [   11.253860] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch0 handle=3D0x8000000d
> [   11.254191] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000000e8
> [   11.254584] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch0 0x000000e8: h=3D0x8000000d, c=3D0x8001116c
> [   11.255103] [drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x4500=
0, bo e73e3a00
> [   11.261523] PM: Adding info for No Bus:fb0
> [   11.282397] PM: Adding info for No Bus:vtcon1
> [   11.360352] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   11.360589] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   11.360817] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   11.361056] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   11.361295] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   11.361519] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   11.361744] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   11.361967] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   11.362191] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   11.362408] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   11.362632] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   11.362929] [drm:drm_crtc_helper_set_mode], DAC-6: set mode 1680x1050 =
19
> [   11.431302] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   11.431538] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   11.431766] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   11.432006] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   11.432866] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   11.433091] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   11.433315] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   11.433538] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   11.433762] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   11.433980] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   11.434203] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   11.434450] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [   11.434685] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [   11.434913] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [   11.435152] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [   11.435392] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [   11.435615] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [   11.435840] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [   11.436063] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [   11.436908] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [   11.437127] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [   11.437350] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [   11.447724] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga enc=
oder (output 0)
> [   11.448035] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRT=
C 0 using output @
> [   11.899300] Console: switching to colour frame buffer device 210x65
> [   12.141364] fb0: nouveaufb frame buffer device
> [   12.143157] drm: registered panic notifier
> [   12.146979] Slow work thread pool: Starting up
> [   12.162810] Slow work thread pool: Ready
> [   12.165343] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0=
 on minor 0
> [   12.194129] Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
> [   12.201617] PM: Adding info for platform:serial8250
> [   12.219626] serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
> [   12.226581] PM: Adding info for No Bus:ttyS0
> [   12.239822] PM: Adding info for No Bus:ttyS1
> [   12.289592] PM: Removing info for No Bus:ttyS0
> [   12.314934] 00:0a: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
> [   12.321773] PM: Adding info for No Bus:ttyS0
> [   12.445873] parport_pc 00:09: activated
> [   12.447514] parport_pc 00:09: reported by Plug and Play ACPI
> [   12.451772] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE,EPP]
> [   12.610359] PM: Adding info for platform:parport_pc.956
> [   12.623674] PM: Removing info for platform:parport_pc.956
> [   12.645636] PM: Adding info for platform:parport_pc.888
> [   12.655815] PM: Removing info for platform:parport_pc.888
> [   12.673748] PM: Adding info for platform:parport_pc.632
> [   12.689540] PM: Removing info for platform:parport_pc.632
> [   12.733568] PM: Adding info for No Bus:isa
> [   12.746300] PM: Adding info for No Bus:loop0
> [   12.771732] PM: Adding info for No Bus:7:0
> [   12.789750] PM: Adding info for No Bus:loop1
> [   12.813653] PM: Adding info for No Bus:7:1
> [   12.831574] PM: Adding info for No Bus:loop2
> [   12.858705] PM: Adding info for No Bus:7:2
> [   12.875763] PM: Adding info for No Bus:loop3
> [   12.901751] PM: Adding info for No Bus:7:3
> [   12.919940] PM: Adding info for No Bus:loop4
> [   12.944891] PM: Adding info for No Bus:7:4
> [   12.961996] PM: Adding info for No Bus:loop5
> [   12.985971] PM: Adding info for No Bus:7:5
> [   13.002568] PM: Adding info for No Bus:loop6
> [   13.026795] PM: Adding info for No Bus:7:6
> [   13.044864] PM: Adding info for No Bus:loop7
> [   13.069069] PM: Adding info for No Bus:7:7
> [   13.080980] loop: module loaded
> [   13.103525] PM: Adding info for No Bus:pktcdvd
> [   13.130097] PM: Adding info for No Bus:tgt
> [   13.189636] ata_piix 0000:00:14.1: version 2.13
> [   13.211048] scsi0 : ata_piix
> [   13.219617] PM: Adding info for scsi:host0
> [   13.239570] PM: Adding info for No Bus:host0
> [   13.261379] scsi1 : ata_piix
> [   13.265156] PM: Adding info for scsi:host1
> [   13.286154] PM: Adding info for No Bus:host1
> [   13.295828] ata1: PATA max UDMA/33 cmd 0x1f0 ctl 0x3f6 bmdma 0x10a0 ir=
q 14
> [   13.299027] ata2: PATA max UDMA/33 cmd 0x170 ctl 0x376 bmdma 0x10a8 ir=
q 15
> [   13.347354] e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI
> [   13.350237] e100: Copyright(c) 1999-2006 Intel Corporation
> [   13.367418] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
> [   13.373294] tulip 0000:00:12.0: enabling device (0004 -> 0007)
> [   13.394474] ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
> [   13.397480] tulip 0000:00:12.0: PCI INT A -> Link[LNKD] -> GSI 11 (lev=
el, low) -> IRQ 11
> [   13.412887] tulip0: EEPROM default media type Autosense
> [   13.415086] tulip0: Index #0 - Media AUI (#18) described by a 21142 Se=
rial PHY (2) block
> [   13.418834] tulip0: Index #1 - Media 10baseT (#0) described by a 21142=
 Serial PHY (2) block
> [   13.422663] tulip0: Index #2 - Media 10baseT-FDX (#4) described by a 2=
1142 Serial PHY (2) block
> [   13.426608] tulip0: Index #3 - Media MII (#11) described by a 21142 MI=
I PHY (3) block
> [   13.446754] tulip0:  MII transceiver #0 config 1000 status 7809 advert=
ising 01e1
> [   13.465272] PM: Adding info for No Bus:eth0
> [   13.591637] net eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0x412000=
00, 00:08:c7:93:98:78, IRQ 11
> [   13.616940] ata2.00: ATA-6: FUJITSU MHT2080AT, 0022, max UDMA/100
> [   13.619369] ata2.00: 156301488 sectors, multi 8: LBA=20
> [   13.645194] ata1.00: ATA-6: IC35L120AVV207-0, V24OA63A, max UDMA/100
> [   13.647631] ata1.00: 241254720 sectors, multi 8: LBA48=20
> [   13.659441] ata2.00: configured for UDMA/33
> [   13.669232] ata1.01: ATA-7: Maxtor 6L250R0, BAH41G10, max UDMA/133
> [   13.671627] ata1.01: 490234752 sectors, multi 8: LBA48=20
> [   13.698492] ata1.00: configured for UDMA/33
> [   13.720873] uhci_hcd: USB Universal Host Controller Interface driver
> [   13.795799] uhci_hcd 0000:00:14.2: PCI INT D -> Link[LNKA] -> GSI 11 (=
level, low) -> IRQ 11
> [   13.869398] uhci_hcd 0000:00:14.2: UHCI Host Controller
> [   13.958335] uhci_hcd 0000:00:14.2: new USB bus registered, assigned bu=
s number 1
> [   14.034327] uhci_hcd 0000:00:14.2: irq 11, io base 0x00001080
> [   14.137483] PM: Adding info for usb:usb1
> [   14.155210] ata1.01: configured for UDMA/33
> [   14.248945] PM: Adding info for usb:1-0:1.0
> [   14.267134] hub 1-0:1.0: USB hub found
> [   14.347324] hub 1-0:1.0: 2 ports detected
> [   14.433637] PM: Adding info for No Bus:ep_81
> [   14.437599] PM: Adding info for No Bus:usbdev1.1
> [   14.482894] scsi 0:0:0:0: Direct-Access     ATA      IC35L120AVV207-0 =
V24O PQ: 0 ANSI: 5
> [   14.573241] PM: Adding info for scsi:target0:0:0
> [   14.593362] PM: Adding info for scsi:0:0:0:0
> [   14.618454] PM: Adding info for No Bus:0:0:0:0
> [   14.646555] PM: Adding info for No Bus:0:0:0:0
> [   14.655880] sd 0:0:0:0: [sda] 241254720 512-byte logical blocks: (123 =
GB/115 GiB)
> [   14.762835] scsi 0:0:1:0: Direct-Access     ATA      Maxtor 6L250R0   =
BAH4 PQ: 0 ANSI: 5
> [   14.857034] PM: Adding info for No Bus:ep_00
> [   14.900960] usbcore: registered new interface driver cdc_acm
> [   14.983751] cdc_acm: v0.26:USB Abstract Control Model driver for USB m=
odems and ISDN adapters
> [   15.070283] Initializing USB Mass Storage driver...
> [   15.195165] sd 0:0:0:0: [sda] Write Protect is off
> [   15.282387] usb 1-1: new full speed USB device using uhci_hcd and addr=
ess 2
> [   15.371896] PM: Adding info for scsi:target0:0:1
> [   15.393661] PM: Adding info for scsi:0:0:1:0
> [   15.413541] PM: Adding info for No Bus:0:0:1:0
> [   15.431059] PM: Adding info for No Bus:0:0:1:0
> [   15.450183] sd 0:0:1:0: [sdb] 490234752 512-byte logical blocks: (251 =
GB/233 GiB)
> [   15.561998] scsi 1:0:0:0: Direct-Access     ATA      FUJITSU MHT2080A =
0022 PQ: 0 ANSI: 5
> [   15.654657] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [   15.663634] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
> [   15.781456] sd 0:0:1:0: [sdb] Write Protect is off
> [   15.875803] PM: Adding info for scsi:target1:0:0
> [   15.895067] PM: Adding info for scsi:1:0:0:0
> [   15.914660] PM: Adding info for No Bus:1:0:0:0
> [   15.947290] PM: Adding info for No Bus:1:0:0:0
> [   15.949552] sd 1:0:0:0: [sdc] 156301488 512-byte logical blocks: (80.0=
 GB/74.5 GiB)
> [   16.062799] PM: Adding info for No Bus:sda
> [   16.101494] usbcore: registered new interface driver usb-storage
> [   16.194130] USB Mass Storage support registered.
> [   16.315131]  sda:
> [   16.332920] sd 0:0:1:0: [sdb] Mode Sense: 00 3a 00 00
> [   16.430382]  sda1
> [   16.532714] PM: Adding info for No Bus:sda1
> [   16.570649] PM: Adding info for usb:1-1
> [   16.573436] sd 1:0:0:0: [sdc] Write Protect is off
> [   16.689303] PM: Adding info for usb:1-1:1.0
> [   16.709294] PM: Adding info for No Bus:ep_81
> [   16.713477] PM: Adding info for No Bus:ep_02
> [   16.717665] PM: Adding info for No Bus:ep_82
> [   16.722828] PM: Adding info for usb:1-1:1.1
> [   16.751324] sd 0:0:1:0: [sdb] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
> [   16.849544] PM: Adding info for No Bus:ep_03
> [   16.854540] PM: Adding info for No Bus:ep_83
> [   16.859237] PM: Adding info for usb:1-1:1.2
> [   16.879789] PM: Adding info for No Bus:usbdev1.2
> [   16.898799] PM: Adding info for No Bus:ep_00
> [   16.911243] sd 1:0:0:0: [sdc] Mode Sense: 00 3a 00 00
> [   16.945360] sd 1:0:0:0: [sdc] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
> [   17.045505] PM: Adding info for No Bus:8:0
> [   17.082244] usbcore: registered new interface driver libusual
> [   17.203507] sd 0:0:0:0: [sda] Attached SCSI disk
> [   17.302245] PM: Adding info for No Bus:sdb
> [   17.340746]  sdb:
> [   17.350853] PM: Adding info for No Bus:sdc
> [   17.445219]  sdb1
> [   17.541213] PM: Adding info for No Bus:sdb1
> [   17.545432] usbcore: registered new interface driver ums-alauda
> [   17.689270]  sdc:
> [   17.699996] usbcore: registered new interface driver ums-datafab
> [   17.925519] PM: Adding info for No Bus:8:16
> [   17.973249] sd 0:0:1:0: [sdb] Attached SCSI disk
> [   18.067776]  sdc1 sdc2 sdc3 <
> [   18.076798] usbcore: registered new interface driver ums-freecom
> [   18.267405]  sdc5 > sdc4
> [   18.365431] PM: Adding info for No Bus:sdc1
> [   18.371332] PM: Adding info for No Bus:sdc2
> [   18.377342] PM: Adding info for No Bus:sdc3
> [   18.383211] PM: Adding info for No Bus:sdc4
> [   18.389246] PM: Adding info for No Bus:sdc5
> [   18.401239] usbcore: registered new interface driver ums-isd200
> [   18.507150] usbcore: registered new interface driver ums-jumpshot
> [   18.707272] PM: Adding info for No Bus:8:32
> [   18.755480] sd 1:0:0:0: [sdc] Attached SCSI disk
> [   18.853519] usbcore: registered new interface driver ums-karma
> [   18.962114] usbcore: registered new interface driver ums-sddr09
> [   19.064745] usbcore: registered new interface driver ums-sddr55
> [   19.176963] usbcore: registered new interface driver ums-usbat
> [   19.294809] PNP: PS/2 Controller [PNP0303:KBD,PNP0f0e:PS2M] at 0x60,0x=
64 irq 1,12
> [   19.388890] PM: Adding info for platform:i8042
> [   19.415847] serio: i8042 KBD port at 0x60,0x64 irq 1
> [   19.505874] serio: i8042 AUX port at 0x60,0x64 irq 12
> [   19.606039] PM: Adding info for serio:serio0
> [   19.628733] PM: Adding info for serio:serio1
> [   19.646084] PM: Adding info for No Bus:mice
> [   19.655210] mice: PS/2 mouse device common for all mice
> [   19.795031] rtc_cmos 00:05: RTC can wake from S4
> [   19.894044] PM: Adding info for No Bus:rtc0
> [   19.915517] rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
> [   20.005867] rtc0: alarms up to one year, y3k, 114 bytes nvram
> [   20.127415] PM: Adding info for No Bus:input2
> [   20.141236] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input2
> [   20.234050] EDAC MC: Ver: 2.1.0 Oct 11 2010
> [   20.441199] cpuidle: using governor ladder
> [   20.659437] cpuidle: using governor menu
> [   20.785328] PM: Adding info for No Bus:timer
> [   20.817063] PM: Adding info for No Bus:seq
> [   20.860964] PM: Adding info for No Bus:sequencer
> [   20.886167] PM: Adding info for No Bus:sequencer2
> [   20.997243] ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
> [   21.085688] au8820 0000:00:04.0: PCI INT A -> Link[LNKC] -> GSI 11 (le=
vel, low) -> IRQ 11
> [   21.178835] Vortex: init....=20
> [   21.773634] PM: Adding info for No Bus:input3
> [   21.874723] input: ImPS/2 Generic Wheel Mouse as /devices/platform/i80=
42/serio1/input/input3
> [   21.974740] PM: Adding info for No Bus:mouse0
> [   22.070091] done.
> [   22.250919] PM: Adding info for No Bus:card0
> [   22.270841] PM: Adding info for No Bus:midiC0D0
> [   22.283441] PM: Adding info for No Bus:midi
> [   22.299098] PM: Adding info for No Bus:dmmidi
> [   22.325644] PM: Adding info for ac97:0-0:WM9701,WM9701A
> [   22.338828] PM: Adding info for No Bus:pcmC0D3p
> [   22.366807] PM: Adding info for No Bus:pcmC0D0p
> [   22.391848] PM: Adding info for No Bus:pcmC0D0c
> [   22.410746] PM: Adding info for No Bus:dsp
> [   22.429312] PM: Adding info for No Bus:audio
> [   22.445489] PM: Adding info for No Bus:controlC0
> [   22.466290] PM: Adding info for No Bus:mixer
> [   22.569479] ALSA device list:
> [   22.656880]   #0: Aureal Vortex au8820 at 0x41000000 irq 11
> [   22.746612] Netfilter messages via NETLINK v0.30.
> [   23.074685] ip_tables: (C) 2000-2006 Netfilter Core Team
> [   23.180839] TCP cubic registered
> [   23.279551] NET: Registered protocol family 10
> [   23.941223] IPv6 over IPv4 tunneling driver
> [   24.046458] PM: Adding info for No Bus:sit0
> [   24.419383] PM: Adding info for No Bus:ip6tnl0
> [   24.799837] NET: Registered protocol family 17
> [   24.889305] NET: Registered protocol family 15
> [   24.977051] Using IPI Shortcut mode
> [   25.067140] PM: Adding info for No Bus:cpu_dma_latency
> [   25.083179] PM: Adding info for No Bus:network_latency
> [   25.097341] PM: Adding info for No Bus:network_throughput
> [   25.110208] PM: Checking image partition /dev/sdc1
> [   25.113658] PM: Resume from partition 8:33
> [   25.113879] PM: Checking hibernation image.
> [   25.122943] PM: Error -22 checking image file
> [   25.123197] PM: Resume from disk failed.
> [   25.154506] rtc_cmos 00:05: setting system clock to 2010-11-17 21:04:1=
5 UTC (1290027855)
> [   25.396010] EXT3-fs: barriers not enabled
> [   25.499132] kjournald starting.  Commit interval 5 seconds
> [   25.607681] EXT3-fs (sda1): mounted filesystem with writeback data mode
> [   25.702203] VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
> [   25.790471] Freeing unused kernel memory: 300k freed
> [  102.430594] udev: starting version 151
> [  158.619052] PM: Adding info for No Bus:event0
> [  158.831909] PM: Adding info for No Bus:event1
> [  158.987519] PM: Adding info for No Bus:event2
> [  159.205628] PM: Adding info for No Bus:event3
> [  160.465092] PM: Adding info for No Bus:input4
> [  160.467941] input: PC Speaker as /devices/platform/pcspkr/input/input4
> [  160.713831] PM: Adding info for No Bus:event4
> [  166.730475] piix4_smbus 0000:00:14.3: Host SMBus controller not enable=
d!
> [  182.561132] Floppy drive(s): fd0 is 1.44M
> [  182.630356] FDC 0 is a post-1991 82077
> [  182.657311] PM: Adding info for platform:floppy.0
> [  182.734337] PM: Adding info for No Bus:fd0
> [  182.842415] PM: Adding info for No Bus:2:0
> [  184.127473] Bluetooth: Generic Bluetooth USB driver ver 0.6
> [  184.271297] PM: Adding info for No Bus:hci0
> [  184.422606] usbcore: registered new interface driver btusb
> [  185.091838] PM: Adding info for No Bus:sg0
> [  185.192952] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [  185.239075] PM: Adding info for No Bus:sg1
> [  185.265756] sd 0:0:1:0: Attached scsi generic sg1 type 0
> [  185.315411] PM: Adding info for No Bus:sg2
> [  185.345769] sd 1:0:0:0: Attached scsi generic sg2 type 0
> [  191.277722] rt2500pci 0000:00:03.0: enabling device (0004 -> 0006)
> [  191.419495] ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 3
> [  191.419791] PCI: setting IRQ 3 as level-triggered
> [  191.433065] rt2500pci 0000:00:03.0: PCI INT A -> Link[LNKB] -> GSI 3 (=
level, low) -> IRQ 3
> [  194.815602] PM: Adding info for No Bus:phy0
> [  203.898118] phy0: Selected rate control algorithm 'minstrel'
> [  204.198674] PM: Adding info for No Bus:wlan0
> [  206.725190] PM: Adding info for No Bus:rt2500pci-phy0::radio
> [  206.757010] Registered led device: rt2500pci-phy0::radio
> [  206.765530] PM: Adding info for No Bus:rt2500pci-phy0::quality
> [  206.773644] Registered led device: rt2500pci-phy0::quality
> [  600.000775] [drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga enc=
oder (output 0)
> [  629.462381] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga enc=
oder (output 0)
> [  938.575989] EXT3-fs (sda1): using internal journal
> [  939.342421] EXT3-fs: barriers not enabled
> [  939.344689] kjournald starting.  Commit interval 5 seconds
> [  939.345064] EXT3-fs (sdb1): using internal journal
> [  939.345135] EXT3-fs (sdb1): mounted filesystem with writeback data mode
> [  939.351511] EXT3-fs: barriers not enabled
> [  939.353000] kjournald starting.  Commit interval 5 seconds
> [  939.353425] EXT3-fs (sdc5): using internal journal
> [  939.353494] EXT3-fs (sdc5): mounted filesystem with writeback data mode
> [  943.394274] Bluetooth: L2CAP ver 2.14
> [  943.394294] Bluetooth: L2CAP socket layer initialized
> [  943.472804] Bluetooth: RFCOMM TTY layer initialized
> [  943.472887] Bluetooth: RFCOMM socket layer initialized
> [  943.472904] Bluetooth: RFCOMM ver 1.11
> [  943.917535] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [  943.917555] Bluetooth: BNEP filters: protocol multicast
> [  943.994579] PM: Adding info for No Bus:vcs2
> [  943.994902] PM: Adding info for No Bus:vcsa2
> [  944.005971] PM: Adding info for No Bus:vcs3
> [  944.006281] PM: Adding info for No Bus:vcsa3
> [  944.019555] PM: Adding info for No Bus:vcs4
> [  944.019871] PM: Adding info for No Bus:vcsa4
> [  944.028361] PM: Adding info for No Bus:vcs5
> [  944.028666] PM: Adding info for No Bus:vcsa5
> [  944.041717] PM: Adding info for No Bus:vcs6
> [  944.042027] PM: Adding info for No Bus:vcsa6
> [  944.052945] PM: Adding info for No Bus:vcs7
> [  944.053270] PM: Adding info for No Bus:vcsa7
> [  944.069845] PM: Adding info for No Bus:vcs8
> [  944.070203] PM: Adding info for No Bus:vcsa8
> [  944.078614] PM: Adding info for No Bus:vcs9
> [  944.078926] PM: Adding info for No Bus:vcsa9
> [  944.087079] PM: Adding info for No Bus:vcs10
> [  944.087521] PM: Adding info for No Bus:vcsa10
> [  944.102230] PM: Adding info for No Bus:vcs11
> [  944.102674] PM: Adding info for No Bus:vcsa11
> [  944.104304] PM: Adding info for No Bus:vcs12
> [  944.104600] PM: Adding info for No Bus:vcsa12
> [  944.119677] Bluetooth: SCO (Voice Link) ver 0.6
> [  944.119698] Bluetooth: SCO socket layer initialized
> [  951.658835] phy0: device now idle
> [  951.667864] ADDRCONF(NETDEV_UP): wlan0: link is not ready
> [  952.639837] phy0: device no longer idle - scanning
> [  953.863503] Adding 819468k swap on /dev/sdc1.  Priority:10 extents:1 a=
cross:819468k=20
> [  953.872216] phy0: device now idle
> [  953.873454] wlan0: deauthenticating from 00:18:39:c0:5f:50 by local ch=
oice (reason=3D3)
> [  953.874308] phy0: device no longer idle - working
> [  953.874452] wlan0: authenticate with 00:18:39:c0:5f:50 (try 1)
> [  953.879994] wlan0: authenticated
> [  953.880288] wlan0: associate with 00:18:39:c0:5f:50 (try 1)
> [  953.882292] wlan0: RX AssocResp from 00:18:39:c0:5f:50 (capab=3D0x411 =
status=3D0 aid=3D2)
> [  953.882313] wlan0: associated
> [  953.882352] phy0: Allocated STA 00:18:39:c0:5f:50
> [  953.887809] phy0: Inserted STA 00:18:39:c0:5f:50
> [  953.889406] ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [  954.380615] Adding 195308k swap on /var/cache/swapfile.  Priority:-1 e=
xtents:2098 across:40112400k=20
> [  954.590574] Adding 102396k swap on /var/cache/swapfile.2.  Priority:-2=
 extents:663 across:3794360k=20
> [  954.796314] Adding 97652k swap on /var/cache/swapfile.3.  Priority:-3 =
extents:1046 across:1133364k=20
> [  954.991269] Adding 97652k swap on /var/cache/swapfile.4.  Priority:-4 =
extents:1254 across:163240k=20
> [  955.261162] Adding 124996k swap on /var/cache/swapfile.5.  Priority:-5=
 extents:2231 across:278360k=20
> [  955.811681] Adding 249996k swap on /var/cache/swapfile.6.  Priority:-6=
 extents:3581 across:75386296k=20
> [  959.552114] eth0: no IPv6 routers present
> [  964.032108] wlan0: no IPv6 routers present
> [  968.614156] svc: failed to register lockdv1 RPC service (errno 97).
> [  992.074177] PM: Adding info for platform:microcode
> [  992.088838] microcode: CPU0 sig=3D0x652, pf=3D0x1, revision=3D0x14
> [  992.089047] PM: Adding info for No Bus:microcode
> [  992.164088] PM: Removing info for No Bus:microcode
> [  992.172784] PM: Adding info for No Bus:microcode
> [  992.180819] microcode: Microcode Update Driver: v2.00 <tigran@aivazian=
.fsnet.co.uk>, Peter Oruba
> [  992.732035] microcode: CPU0 updated to revision 0x2a, date =3D 1999-05=
-12
> [  992.771134] PM: Removing info for No Bus:microcode
> [  992.777318] PM: Removing info for platform:microcode
> [  992.778987] microcode: Microcode Update Driver: v2.00 removed.
> [ 1022.881845] [drm:drm_stub_open],=20
> [ 1022.881873] [drm:drm_open_helper], pid =3D 2299, minor =3D 0
> [ 1022.882383] [drm:drm_setup],=20
> [ 1022.882723] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.882768] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.882880] [drm:drm_release], open_count =3D 1
> [ 1022.882906] [drm] nouveau 0000:01:00.0: nouveau_channel_cleanup:334 - =
clearing FIFO enables from file_priv
> [ 1022.882926] [drm:drm_release], pid =3D 2299, device =3D 0xe200, open_c=
ount =3D 1
> [ 1022.883390] [drm:drm_lastclose],=20
> [ 1022.883408] [drm:drm_lastclose], driver lastclose completed
> [ 1022.883438] [drm:drm_lastclose], lastclose completed
> [ 1022.883982] [drm:drm_stub_open],=20
> [ 1022.888154] [drm:drm_open_helper], pid =3D 2299, minor =3D 0
> [ 1022.888206] [drm:drm_setup],=20
> [ 1022.888674] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106407, nr=3D0x07, =
dev 0xe200, auth=3D1
> [ 1022.888727] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0086401, nr=3D0x01, =
dev 0xe200, auth=3D1
> [ 1022.888756] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0086401, nr=3D0x01, =
dev 0xe200, auth=3D1
> [ 1022.889020] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0086420, nr=3D0x20, =
dev 0xe200, auth=3D1
> [ 1022.889126] [drm:drm_addctx], 1
> [ 1022.889183] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.889214] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.889296] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.889327] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.889352] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.889420] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.889465] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.889495] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.889769] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0086421, nr=3D0x21, =
dev 0xe200, auth=3D1
> [ 1022.889796] [drm:drm_rmctx], 1
> [ 1022.890032] [drm:drm_release], open_count =3D 1
> [ 1022.890052] [drm] nouveau 0000:01:00.0: nouveau_channel_cleanup:334 - =
clearing FIFO enables from file_priv
> [ 1022.890067] [drm:drm_release], pid =3D 2299, device =3D 0xe200, open_c=
ount =3D 1
> [ 1022.890119] [drm:drm_lastclose],=20
> [ 1022.890132] [drm:drm_lastclose], driver lastclose completed
> [ 1022.890155] [drm:drm_lastclose], lastclose completed
> [ 1022.898031] [drm:drm_stub_open],=20
> [ 1022.898050] [drm:drm_open_helper], pid =3D 2299, minor =3D 0
> [ 1022.898100] [drm:drm_setup],=20
> [ 1022.898334] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.898368] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.898414] [drm:drm_release], open_count =3D 1
> [ 1022.898434] [drm] nouveau 0000:01:00.0: nouveau_channel_cleanup:334 - =
clearing FIFO enables from file_priv
> [ 1022.898449] [drm:drm_release], pid =3D 2299, device =3D 0xe200, open_c=
ount =3D 1
> [ 1022.898499] [drm:drm_lastclose],=20
> [ 1022.898512] [drm:drm_lastclose], driver lastclose completed
> [ 1022.898536] [drm:drm_lastclose], lastclose completed
> [ 1022.898938] [drm:drm_stub_open],=20
> [ 1022.898955] [drm:drm_open_helper], pid =3D 2299, minor =3D 0
> [ 1022.899001] [drm:drm_setup],=20
> [ 1022.899227] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.899260] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.899304] [drm:drm_release], open_count =3D 1
> [ 1022.899323] [drm] nouveau 0000:01:00.0: nouveau_channel_cleanup:334 - =
clearing FIFO enables from file_priv
> [ 1022.899338] [drm:drm_release], pid =3D 2299, device =3D 0xe200, open_c=
ount =3D 1
> [ 1022.899385] [drm:drm_lastclose],=20
> [ 1022.899398] [drm:drm_lastclose], driver lastclose completed
> [ 1022.899420] [drm:drm_lastclose], lastclose completed
> [ 1022.899937] [drm:drm_stub_open],=20
> [ 1022.899954] [drm:drm_open_helper], pid =3D 2299, minor =3D 0
> [ 1022.899999] [drm:drm_setup],=20
> [ 1022.904528] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106407, nr=3D0x07, =
dev 0xe200, auth=3D1
> [ 1022.904574] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0086401, nr=3D0x01, =
dev 0xe200, auth=3D1
> [ 1022.904609] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0086401, nr=3D0x01, =
dev 0xe200, auth=3D1
> [ 1022.904855] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106407, nr=3D0x07, =
dev 0xe200, auth=3D1
> [ 1022.905125] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0186415, nr=3D0x15, =
dev 0xe200, auth=3D1
> [ 1022.905161] [drm:drm_addmap_core], offset =3D 0x00000000, size =3D 0x0=
0002000, type =3D 2
> [ 1022.905303] [drm:drm_addmap_core], 8192 13 e8a1f000
> [ 1022.905739] [drm:drm_mmap_locked], start =3D 0xb7831000, end =3D 0xb78=
33000, page offset =3D 0xe8a1f
> [ 1022.905771] [drm:drm_vm_open_locked], 0xb7831000,0x00002000
> [ 1022.905821] [drm:drm_do_vm_shm_fault], shm_fault 0x0
> [ 1022.905868] [drm:drm_do_vm_shm_fault], shm_fault 0x1000
> [ 1022.906160] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.906200] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0246400, nr=3D0x00, =
dev 0xe200, auth=3D1
> [ 1022.906247] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.906282] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.906313] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.906345] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106440, nr=3D0x40, =
dev 0xe200, auth=3D1
> [ 1022.908178] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064a0, nr=3D0xa0, =
dev 0xe200, auth=3D1
> [ 1022.908231] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064a0, nr=3D0xa0, =
dev 0xe200, auth=3D1
> [ 1022.908379] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc06864a1, nr=3D0xa1, =
dev 0xe200, auth=3D1
> [ 1022.908466] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1022.909087] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04c64a7, nr=3D0xa7, =
dev 0xe200, auth=3D1
> [ 1023.102314] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04c64a7, nr=3D0xa7, =
dev 0xe200, auth=3D1
> [ 1023.102428] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01464a6, nr=3D0xa6, =
dev 0xe200, auth=3D1
> [ 1023.102936] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04c64a7, nr=3D0xa7, =
dev 0xe200, auth=3D1
> [ 1023.216443] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04c64a7, nr=3D0xa7, =
dev 0xe200, auth=3D1
> [ 1023.216557] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.216608] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.216724] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01064ac, nr=3D0xac, =
dev 0xe200, auth=3D1
> [ 1023.216775] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01064ac, nr=3D0xac, =
dev 0xe200, auth=3D1
> [ 1023.216844] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.216899] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.321846] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0586442, nr=3D0x42, =
dev 0xe200, auth=3D1
> [ 1023.321890] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
> [ 1023.322393] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init:97=
0 - ch1 vram=3D0xd8000001 tt=3D0xd8000002
> [ 1023.322422] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h-1 h=3D0x00000000 gpuobj=3De7f52b60
> [ 1023.322449] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h1 class=3D0x003d offset=3D0x0 size=3D0xf80000
> [ 1023.322470] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D0
> [ 1023.322495] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.322516] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e1dd5aa0
> [ 1023.322536] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.322568] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0xd8000001 gpuobj=3De1dd5aa0
> [ 1023.322593] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0xd8000001
> [ 1023.322613] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000001d0
> [ 1023.322637] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x000001d0: h=3D0xd8000001, c=3D0x8100116d
> [ 1023.322663] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h1 class=3D0x003d offset=3D0x0 size=3D0x4000000
> [ 1023.322684] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D3
> [ 1023.322707] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.322728] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j e6e11d20
> [ 1023.322746] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.322773] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0xd8000002 gpuobj=3De6e11d20
> [ 1023.322796] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0xd8000002
> [ 1023.322816] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000001c8
> [ 1023.322840] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x000001c8: h=3D0xd8000002, c=3D0x8100116e
> [ 1023.322865] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h1 class=3D0x003d offset=3D0x0 size=3D0x4000000
> [ 1023.322887] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D1 target=3D3
> [ 1023.322910] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.322931] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd9c9720
> [ 1023.322949] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.322975] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x00000000 gpuobj=3Ddd9c9720
> [ 1023.323001] [drm] nouveau 0000:01:00.0: nv04_graph_create_context:401 =
- nv04_graph_context_create 1
> [ 1023.323067] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:580 - =
p_offset=3D0x00011420 b_offset=3D0xffffffff size=3D0x00000020 flags=3D0x000=
00006
> [ 1023.323092] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:585 - =
gpuobj dd9c9960
> [ 1023.323116] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h-1 h=3D0x00000000 gpuobj=3Ddd9c9960
> [ 1023.323147] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0039
> [ 1023.323170] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.323191] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e120
> [ 1023.323209] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.323236] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000001 gpuobj=3Ddd90e120
> [ 1023.323259] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000001
> [ 1023.323279] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000188
> [ 1023.323302] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000188: h=3D0x80000001, c=3D0x81011170
> [ 1023.323328] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x8000000e gpuobj=3Ddd90e160
> [ 1023.323350] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x8000000e
> [ 1023.323370] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000001f0
> [ 1023.323392] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x000001f0: h=3D0x8000000e, c=3D0x81000004
> [ 1023.323420] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h1 class=3D0x003d offset=3D0x735000 size=3D0x20
> [ 1023.323442] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D0
> [ 1023.323464] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.323485] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e1a0
> [ 1023.323504] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.323530] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000006 gpuobj=3Ddd90e1a0
> [ 1023.323553] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000006
> [ 1023.323574] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000001b0
> [ 1023.323597] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x000001b0: h=3D0x80000006, c=3D0x81001171
> [ 1023.323809] [drm] nouveau 0000:01:00.0: nouveau_pgraph_intr_context_sw=
itch:551 - PGRAPH context switch interrupt channel 1
> [ 1023.324239] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initial=
ised FIFO 1
> [ 1023.328896] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0286484, nr=3D0x84, =
dev 0xe200, auth=3D1
> [ 1023.329053] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1023.329128] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.329167] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0030
> [ 1023.329191] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.329213] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e260
> [ 1023.329232] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.329261] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x00000000 gpuobj=3Ddd90e260
> [ 1023.329286] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x00000000
> [ 1023.329306] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000100
> [ 1023.329329] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000100: h=3D0x00000000, c=3D0x81011172
> [ 1023.329368] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1023.329408] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1023.329629] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1023.329834] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1023.330038] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1023.330280] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1023.330362] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1023.331417] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0106445, nr=3D0x45, =
dev 0xe200, auth=3D1
> [ 1023.331463] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - c=
h1 class=3D0x003d offset=3D0x735020 size=3D0x20
> [ 1023.331486] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - a=
ccess=3D0 target=3D0
> [ 1023.331510] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.331532] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e6a0
> [ 1023.331551] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.331580] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0xd8000003 gpuobj=3Ddd90e6a0
> [ 1023.331604] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0xd8000003
> [ 1023.331625] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x000001c0
> [ 1023.331649] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x000001c0: h=3D0xd8000003, c=3D0x81001173
> [ 1023.331694] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.331731] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0042
> [ 1023.331755] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.331777] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e6e0
> [ 1023.331795] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.331822] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000010 gpuobj=3Ddd90e6e0
> [ 1023.331846] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000010
> [ 1023.331866] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000100
> [ 1023.331890] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:150 - col=
lision ch1 0x00000100: h=3D0x00000000
> [ 1023.331915] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000108: h=3D0x80000010, c=3D0x81011174
> [ 1023.332084] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.332123] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0012
> [ 1023.332146] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.332168] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e720
> [ 1023.332186] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.332214] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x8000001b gpuobj=3Ddd90e720
> [ 1023.332238] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x8000001b
> [ 1023.332258] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000158
> [ 1023.332282] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000158: h=3D0x8000001b, c=3D0x81011175
> [ 1023.332310] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.332345] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0072
> [ 1023.332368] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.332389] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e760
> [ 1023.332408] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.332434] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x8000001c gpuobj=3Ddd90e760
> [ 1023.332457] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x8000001c
> [ 1023.332478] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000160
> [ 1023.332501] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000160: h=3D0x8000001c, c=3D0x81011176
> [ 1023.332528] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.332562] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0044
> [ 1023.332585] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.332607] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e7a0
> [ 1023.332625] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.332651] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000012 gpuobj=3Ddd90e7a0
> [ 1023.332675] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000012
> [ 1023.332695] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000110
> [ 1023.332718] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000110: h=3D0x80000012, c=3D0x81011177
> [ 1023.332747] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.332781] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0043
> [ 1023.332804] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.332825] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e7e0
> [ 1023.332843] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.332870] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000011 gpuobj=3Ddd90e7e0
> [ 1023.332894] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000011
> [ 1023.332914] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000108
> [ 1023.332937] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:150 - col=
lision ch1 0x00000108: h=3D0x80000010
> [ 1023.332961] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:150 - col=
lision ch1 0x00000110: h=3D0x80000012
> [ 1023.332986] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000118: h=3D0x80000011, c=3D0x81011178
> [ 1023.333013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.333047] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x004a
> [ 1023.333070] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.333092] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e820
> [ 1023.333110] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.333136] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000016 gpuobj=3Ddd90e820
> [ 1023.333160] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000016
> [ 1023.333180] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000130
> [ 1023.333204] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000130: h=3D0x80000016, c=3D0x81011179
> [ 1023.333232] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.333267] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x005f
> [ 1023.333290] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.333311] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e860
> [ 1023.333330] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.333356] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000015 gpuobj=3Ddd90e860
> [ 1023.333380] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000015
> [ 1023.333400] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000128
> [ 1023.333423] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000128: h=3D0x80000015, c=3D0x8101117a
> [ 1023.333453] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.333487] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0077
> [ 1023.333510] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.333532] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e8a0
> [ 1023.333550] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.333576] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000017 gpuobj=3Ddd90e8a0
> [ 1023.333600] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000017
> [ 1023.333620] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000138
> [ 1023.333643] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000138: h=3D0x80000017, c=3D0x8101117b
> [ 1023.333672] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.333706] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0019
> [ 1023.333729] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.333751] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e8e0
> [ 1023.333769] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.333795] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000013 gpuobj=3Ddd90e8e0
> [ 1023.333819] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000013
> [ 1023.333839] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000118
> [ 1023.333863] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:150 - col=
lision ch1 0x00000118: h=3D0x80000011
> [ 1023.333887] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000120: h=3D0x80000013, c=3D0x8101117c
> [ 1023.333914] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.333949] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0061
> [ 1023.333972] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.333993] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e920
> [ 1023.334012] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.334038] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x8000001a gpuobj=3Ddd90e920
> [ 1023.334062] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x8000001a
> [ 1023.334082] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000150
> [ 1023.334105] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000150: h=3D0x8000001a, c=3D0x8101117d
> [ 1023.334135] [drm:drm_ioctl], pid=3D2299, cmd=3D0x400c6444, nr=3D0x44, =
dev 0xe200, auth=3D1
> [ 1023.334169] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:840 - ch=
1 class=3D0x0039
> [ 1023.334192] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch1 s=
ize=3D16 align=3D16 flags=3D0x00000006
> [ 1023.334214] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuob=
j dd90e960
> [ 1023.334232] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - globa=
l heap fallback
> [ 1023.334258] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - c=
h1 h=3D0x80000018 gpuobj=3Ddd90e960
> [ 1023.334282] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 -=
 ch1 handle=3D0x80000018
> [ 1023.334302] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 -=
 hash=3D0x00000140
> [ 1023.334326] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - ins=
ert ch1 0x00000140: h=3D0x80000018, c=3D0x8101117e
> [ 1023.334890] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1023.335090] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1023.335165] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1023.335419] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0306480, nr=3D0x80, =
dev 0xe200, auth=3D1
> [ 1023.335793] [drm:drm_ioctl], ret =3D fffffff4
> [ 1023.375614] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.375672] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.375728] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.375779] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.591598] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64ad, nr=3D0xad, =
dev 0xe200, auth=3D1
> [ 1023.591689] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0286484, nr=3D0x84, =
dev 0xe200, auth=3D1
> [ 1023.591950] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1023.596752] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1023.596870] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1023.616139] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1023.616260] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086409, nr=3D0x09, =
dev 0xe200, auth=3D1
> [ 1023.616567] [drm:drm_ioctl], pid=3D2299, cmd=3D0x641e, nr=3D0x1e, dev =
0xe200, auth=3D1
> [ 1023.616636] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64ae, nr=3D0xae, =
dev 0xe200, auth=3D1
> [ 1023.616822] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc06864a2, nr=3D0xa2, =
dev 0xe200, auth=3D1
> [ 1023.616935] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [ 1023.616949] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [ 1023.616962] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [ 1023.616975] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [ 1023.616988] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [ 1023.617000] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [ 1023.617012] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [ 1023.617024] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [ 1023.617037] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [ 1023.617049] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [ 1023.617061] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [ 1023.617076] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 128000
> [ 1023.617089] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 256000
> [ 1023.617101] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 0
> [ 1023.617114] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 214748=
3647
> [ 1023.617126] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 1
> [ 1023.617138] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
> [ 1023.617150] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 8
> [ 1023.617162] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 14
> [ 1023.617173] [drm] nouveau 0000:01:00.0: pll.max_log2p: 4
> [ 1023.617185] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
> [ 1023.617197] [drm] nouveau 0000:01:00.0: pll.refclk: 14318
> [ 1023.617232] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.617272] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.617323] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.617367] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc04064aa, nr=3D0xaa, =
dev 0xe200, auth=3D1
> [ 1023.617441] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01064ab, nr=3D0xab, =
dev 0xe200, auth=3D1
> [ 1023.617505] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc02064a5, nr=3D0xa5, =
dev 0xe200, auth=3D1
> [ 1025.428905] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1025.509583] [drm:drm_vm_open_locked], 0xb7831000,0x00002000
> [ 1025.517096] [drm:drm_vm_shm_close], 0xb7831000,0x00002000
> [ 1026.060379] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1026.060514] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1026.060732] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1026.060804] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1026.060923] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1026.060994] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1026.287654] [drm:drm_vm_open_locked], 0xb7831000,0x00002000
> [ 1026.300551] [drm:drm_vm_shm_close], 0xb7831000,0x00002000
> [ 1026.822395] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.310343] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.310683] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.310788] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.311365] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.311650] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.318883] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.319055] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.319151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.319749] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.319816] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.320242] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.320310] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.320619] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.320684] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.321063] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.321128] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.321435] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.321499] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.321806] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.321871] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.322249] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.322314] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.322622] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.322687] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.322994] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.323058] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.323452] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.323517] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.323842] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.323906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.332390] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.332487] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.333268] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.333345] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.333678] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.333750] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.334079] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.334151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.334551] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.334623] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.334956] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.335028] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.335360] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.335432] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.335835] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.344342] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.344696] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.344905] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.345242] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.345313] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.345698] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.345769] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.346082] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.346154] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.346468] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.346535] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.346609] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.346812] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1028.577527] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.577641] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.577757] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.577854] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.578821] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.578911] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.578980] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.579054] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.579119] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1028.579192] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1028.579390] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1030.492555] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1030.492648] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1030.492693] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.493663] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1030.493737] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1030.493780] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.494545] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.495645] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1030.495743] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1030.502407] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.512147] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.522359] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.532221] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.541772] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.552141] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.561911] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.571725] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.581556] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.591872] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.601697] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.611293] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.621600] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.631420] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.641050] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.651354] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.661181] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.671489] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.681095] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.691417] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.701244] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.701728] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1030.701813] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1030.701858] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.702832] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1030.702906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1030.702948] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.703703] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.704801] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1030.704895] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1030.705096] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1030.710825] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.721121] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.730979] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.740807] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.750622] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.760933] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.770755] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.780375] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.790871] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.800559] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.810168] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.820489] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.830298] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.840186] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.850676] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.860512] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.870328] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.879948] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.890265] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.900160] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.909924] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.919735] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.930057] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.939869] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.949480] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.959792] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.969625] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.979223] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.989551] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1030.999369] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.008979] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.009456] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1031.009541] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1031.009584] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.010553] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1031.010627] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1031.010670] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.011427] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.012505] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1031.012602] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1031.019275] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.029133] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.039438] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.049061] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.058871] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.069198] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.079020] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.088852] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.098679] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.108996] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.118596] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.248234] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.901959] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc01c64a3, nr=3D0xa3, =
dev 0xe200, auth=3D1
> [ 1031.902076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1031.902173] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1031.902242] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1031.902318] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1031.902385] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1031.902458] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.132930] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.133034] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.133102] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.133178] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.133246] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.133320] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.336904] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.337000] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.337069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.337145] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.337212] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.337286] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.552903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.553000] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.553069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.553145] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.553212] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.553286] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.796906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.797004] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.797073] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.797147] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1032.797214] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1032.797288] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.192908] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.193007] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.193076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.193152] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.193220] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.193293] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.949401] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.949511] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.949581] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.949680] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.949748] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.949823] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.957043] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.957141] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.957213] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.957306] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.957374] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.957456] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.957523] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.957596] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.957663] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.957736] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.965446] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.965550] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.965620] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.965774] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1033.965841] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1033.965917] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1035.012940] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1035.013046] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1035.013116] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1035.013207] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1035.013274] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1035.013349] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1035.904890] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1035.904992] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1035.905063] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1035.905139] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.068893] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.068997] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.069067] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.069142] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.672930] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.673034] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.673103] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.673184] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.673252] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.673326] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.817403] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.817516] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.817586] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.817685] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.817752] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.817827] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.821261] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.821354] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.821425] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.821582] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.821650] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.821725] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.828960] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.829045] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.829110] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.829198] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.829259] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.829336] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.829395] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.829462] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.829522] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.829590] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.837233] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.837330] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.837395] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.837554] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1036.837615] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1036.837683] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1038.949419] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1038.949528] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1038.949600] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1038.949762] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1038.949831] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1038.949926] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1038.949993] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1038.950076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1038.950142] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1038.950215] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1038.950283] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1038.950356] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1039.125196] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1039.125301] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1039.125373] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1039.125469] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1039.125537] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1039.125620] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1039.125686] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1039.125759] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1039.125826] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1039.125900] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1040.120943] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1040.121052] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1040.121121] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1040.121197] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1040.121264] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1040.121338] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1040.396909] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1040.397007] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1040.397076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1040.397151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1040.397218] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1040.397292] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1041.360936] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1041.361044] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1041.361183] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1041.361409] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1041.361555] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1041.361635] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1043.976934] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1043.977040] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1043.977109] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1043.977185] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1043.977252] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1043.977325] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1044.652935] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1044.653041] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1044.653178] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1044.653402] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1044.653548] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1044.653628] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1044.852911] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1044.853010] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1044.853138] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1044.853353] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1044.853498] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1044.853578] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1045.420907] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1045.421007] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1045.421076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1045.421151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1045.421219] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1045.421293] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1045.808912] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1045.809012] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1045.809081] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1045.809156] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1045.809223] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1045.809297] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.064916] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.065017] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.065085] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.065160] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.065227] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.065300] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.584930] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.585033] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.585168] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1046.585392] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1046.585538] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.585617] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.780922] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.781023] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.781154] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1046.781374] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1046.781520] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.781600] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.927548] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.927646] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.927715] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.927790] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.927858] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.927931] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.929454] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.929535] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.929603] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.929677] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1046.929743] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1046.929817] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1047.276917] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1047.277017] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1047.277147] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1047.277369] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1047.277515] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1047.277755] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1047.992930] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1047.993034] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1047.993168] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1047.993390] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1047.993536] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1047.993616] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.207294] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.207399] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.207468] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.207543] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.207611] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.207684] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.216950] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.217041] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.217109] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.217184] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.217251] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.217324] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.564910] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.565008] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1048.565143] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1048.565366] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1048.565513] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1048.565592] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1049.420923] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1049.421027] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1049.421161] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1049.421383] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1049.421531] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1049.421610] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1049.620915] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1049.621013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1049.621141] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1049.621358] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1049.621505] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1049.621584] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.061197] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.061304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.061376] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.061473] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.061541] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.061624] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.061690] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.061763] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.061830] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.061903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.245194] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.245299] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.245371] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.245467] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.245535] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.245618] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.245684] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.245757] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1050.245825] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1050.245898] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.704935] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.705043] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.705112] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.705188] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.705255] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.705329] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.832909] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.833008] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.833076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.833153] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.833220] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.833293] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.928907] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.929006] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.929075] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.929151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1055.929218] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1055.929291] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.128908] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.129006] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.129075] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.129151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.129219] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.129292] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.285029] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.285132] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.285201] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.285277] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.285344] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.285418] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.384903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.385000] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.385069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.385142] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1056.385210] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1056.385283] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1059.700992] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1059.701097] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1059.701233] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1059.701466] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1059.701613] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1059.701693] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.360943] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.361048] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.361183] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.361406] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.361552] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.361632] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.400914] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.401013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.401140] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.401356] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.401502] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.401581] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.440908] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.441003] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.441130] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.441343] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.441489] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.441568] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.480910] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.481009] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.481138] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.481356] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.481502] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.481581] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.520913] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.521013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1060.521144] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.521360] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1060.521506] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1060.521585] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1061.964916] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1061.965020] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1061.965089] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1061.965166] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1061.965233] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1061.965307] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.092914] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.093015] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.093084] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.093159] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.093227] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.093300] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.284924] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.285027] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.285096] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.285172] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.285239] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.285454] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.424903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.425001] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.425070] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.425146] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.425213] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.425287] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.537111] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.537207] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.537276] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.537350] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.537417] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.537491] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.688902] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.689000] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.689069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.689145] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.689211] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.689285] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.760903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.760999] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.761068] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.761144] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.761211] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.761285] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.920902] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.920999] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.921068] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.921144] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.921211] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.921285] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.996916] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.997015] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.997084] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.997160] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1062.997227] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1062.997301] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.084904] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.085001] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.085069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.085145] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.085212] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.085285] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.200904] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.201002] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.201071] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.201147] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.201215] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.201288] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.388906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.389004] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.389073] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.389148] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.389215] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.389288] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.464915] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.465013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.465082] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.465158] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.465225] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.465298] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.632936] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.633043] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.633112] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.633188] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.633255] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.633329] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.844934] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.845039] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.845109] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.845185] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1063.845253] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1063.845326] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.041716] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.041819] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.041888] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.041987] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.042054] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.042127] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.493232] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.493343] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.493414] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.493489] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.725693] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.725806] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.725942] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.726110] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.726211] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.726621] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.726693] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.726775] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.726843] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.726934] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.727001] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.727098] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.727165] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.727254] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.727320] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.727401] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.727468] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.727622] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.727688] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.727779] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.727845] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.727938] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.736136] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.736304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.736379] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.736469] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.736536] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.736617] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.736686] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.736839] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.736908] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737062] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.737129] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737219] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.737286] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737367] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.737433] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737507] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.737573] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737662] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.737728] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737809] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.737875] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.737947] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.738013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.738103] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.738170] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.738251] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.738318] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.738391] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.738457] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.738546] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.738613] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.738694] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.738762] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.738908] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.739023] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.739346] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.739449] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.739739] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.739814] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.749941] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.750161] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.750331] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.750402] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.750665] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.750735] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.750974] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.751044] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.751290] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.751360] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.751582] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.751652] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.751902] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.751969] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.752191] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.752263] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.752441] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.752510] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.752653] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.752870] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.753075] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.753226] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1064.753327] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.753991] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.754063] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.754211] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.754280] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.754529] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.754597] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.754711] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.754780] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.755082] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.755151] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.755302] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.755371] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.755561] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.755630] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.755931] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.755999] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.760258] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.760332] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.760529] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.760597] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.760814] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.760883] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.761024] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.761090] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.761203] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.761271] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.761488] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.761556] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.761758] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.761826] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.761974] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.762043] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.762301] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.762369] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.762471] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.762540] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.762757] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.762824] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.762954] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.763024] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.763320] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.763387] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.763460] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.763565] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.763749] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1064.763817] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1064.763890] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.365087] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.365188] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.365323] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1065.365544] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1065.365684] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.365760] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.365824] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.365893] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.716972] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.717076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.717210] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1065.717435] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1065.717580] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.717661] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.717731] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.717805] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.717873] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.717947] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.868968] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.869075] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.869210] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1065.869437] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1065.869583] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.869664] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.869733] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.869807] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1065.869875] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1065.869949] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.052998] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.053104] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.053239] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.053463] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.053609] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.053688] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.076486] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.076585] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.076649] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.076758] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.076822] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.077094] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.077155] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.077307] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.077370] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.077624] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.077687] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.077906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.077969] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.078193] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.078256] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.078459] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.078522] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.078751] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.078811] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.078912] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.078973] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.079145] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.079206] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.079342] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.079404] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.079600] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.079663] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.079905] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.079969] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.084358] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.084429] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.084500] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.084562] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.084708] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.085911] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.086215] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.086278] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.086346] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.086406] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.086541] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.086602] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.086737] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.086799] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.086868] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.100443] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.100538] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.100609] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.100764] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.100831] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.100945] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.101013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.101219] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.101290] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.101549] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.101618] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.101837] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.101907] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.102201] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.102269] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.102375] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.102445] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.102700] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.102767] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.102916] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.102986] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.103230] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.103300] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.103523] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.103593] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.103823] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.103892] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.108228] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.108317] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.108559] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.110304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.110424] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.110494] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.110667] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.110734] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.110872] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.110940] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.111137] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.111203] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.111278] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.111344] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.111418] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.124392] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.124482] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.124554] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.124805] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.124875] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.125138] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.125205] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.125283] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.125349] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.125450] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.125516] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.125590] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.125657] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.125801] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.125871] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.126155] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.126222] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.126296] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.126363] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.126498] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.126567] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.126772] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.126839] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.126948] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.127016] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.127207] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.127277] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.127521] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.127590] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.127795] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.127865] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.132262] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.132339] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.132589] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.138582] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.138810] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.138965] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.139066] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.139828] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.139900] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.139979] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.140121] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.140323] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.140391] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.140487] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.140557] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.140862] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.140929] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.141003] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.141073] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.141319] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.141387] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.141620] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.141688] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.141811] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.141877] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.141977] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.142047] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.142257] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.142323] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.142396] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.142463] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.142536] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.142605] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.142848] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.152671] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.152869] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.153025] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1066.153126] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.153935] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.154007] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.154147] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.154215] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.154408] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.154476] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.154632] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.154700] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.154893] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.154961] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.155111] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.155179] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.155364] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.155432] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.155593] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.155661] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.155857] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.155926] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.164170] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.164246] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.164454] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.164523] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.164671] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.164739] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.164946] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.165014] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.165162] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.165230] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.165416] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1066.165482] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1066.165556] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.339595] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.339704] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.339844] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.340157] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.340304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.340386] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.340487] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.340683] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.340829] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.341055] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.341168] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.341345] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.341495] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.341595] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.342300] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.342372] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.342547] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.342614] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.342770] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.342839] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.343008] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.343076] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.343223] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.343293] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.343464] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.343532] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.343676] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.343745] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.343918] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.343985] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.348268] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.348343] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.348522] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.348590] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.348754] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.348823] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.349129] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.349430] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.349597] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.349670] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.349848] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.349916] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.350072] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.350140] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.350322] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.350389] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.350543] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.350612] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.350795] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.350862] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.351015] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.351085] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.351266] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.351336] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.351521] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.351589] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.351662] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.585212] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.585318] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.585455] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.585681] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.585826] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.585907] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.586008] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.586203] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.586349] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.586428] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.600337] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.600425] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.600488] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.600598] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.606305] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.606476] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1067.606572] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.607139] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.607205] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.607278] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.607338] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.607425] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.607486] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.607607] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.607669] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.607896] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.607958] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.608174] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.608240] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.608434] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.608496] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.608627] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.608688] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.608862] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.608924] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.609069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.609130] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.609307] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.609369] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.609510] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.609572] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.609800] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.609861] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.609965] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.610026] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.610214] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.610276] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.610416] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.610477] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.610653] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.610715] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.610872] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.610934] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.611205] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.611266] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.611351] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.611413] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.611636] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.611698] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.611809] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.611871] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.616251] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.616331] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.616443] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.616512] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.616733] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.616802] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.616937] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.617006] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.617256] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.617325] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.617437] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.617505] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.617699] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.617768] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.617925] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.617992] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.618165] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.618234] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.618406] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.618474] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.618744] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.618812] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.618911] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.618979] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.619209] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.619278] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.619404] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.619473] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.619719] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.619787] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.619898] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.619967] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.624304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.624382] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.624518] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.624587] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.624834] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.624901] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.625013] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.625081] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.625296] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.625503] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.625650] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.625719] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.625898] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.625967] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.626137] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.626467] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.626731] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.626799] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.626892] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.626960] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.627137] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1067.627204] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1067.627278] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.381164] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.381271] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.381408] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1068.381634] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1068.381780] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.381862] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.381962] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1068.382155] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1068.382301] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.382380] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.412304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.412402] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.412472] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.412585] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.414614] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1068.414785] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1068.414886] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.415373] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.415444] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.415523] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.415592] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.415788] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.415856] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.415967] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.416127] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.416366] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.416435] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.416545] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.416615] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.416896] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.416964] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.417039] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.417108] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.417337] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.417404] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.417554] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.417623] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.417791] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.417858] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.418005] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.418074] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.418245] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.418312] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.418485] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.418554] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.418704] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.418772] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.418956] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.419024] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.419167] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.419235] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.419448] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.419517] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.419643] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.419711] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.419925] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.419994] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.424386] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.424461] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.424662] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.424731] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.424887] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.424958] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.425261] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.432164] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.432289] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.432361] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.432583] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.432653] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.432906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.432975] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.433089] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.433156] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.433322] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.433391] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.433569] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.433639] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.433918] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.433986] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.434160] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.434232] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.434464] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.434768] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.434903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.434973] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.435214] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.435282] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.435405] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.435474] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.435732] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.435871] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.435978] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.444146] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.444374] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.444444] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.444566] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.444636] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.444874] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.445085] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.445198] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.445268] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.445486] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.445555] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.445677] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.445746] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.445976] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.446045] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.446158] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.446226] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.446418] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1068.446485] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1068.446559] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.574005] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.574112] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.574254] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1069.574495] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1069.574640] [drm:drm_ioctl], pid=3D2299, cmd=3D0xc0406481, nr=3D0x81, =
dev 0xe200, auth=3D1
> [ 1069.574741] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.575209] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.575280] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.575362] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.575430] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.575521] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.575588] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.575685] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.575752] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.575840] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.575906] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.575987] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.576190] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.576345] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.576413] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.576503] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.576570] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.576663] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.576731] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.576883] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.576951] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.577040] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.577106] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.577187] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.577256] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.577408] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.577477] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.577631] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.577699] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.577789] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.577856] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.577938] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578005] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578078] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578144] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578233] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578300] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578380] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578446] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578519] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578586] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578674] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578741] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578821] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.578888] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.578961] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.579027] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.579116] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.579183] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.579263] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.579331] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.579471] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.579540] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.579614] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.592955] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.593062] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.593134] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.593228] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.593296] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.593381] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.593447] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.593520] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1069.593587] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1069.593660] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1070.768938] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1070.769045] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1070.769114] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1070.769190] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1070.769258] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1070.769332] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1070.956914] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1070.957016] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1070.957085] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1070.957160] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1070.957228] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1070.957301] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.052920] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.053019] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.053087] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.053163] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.053230] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.053303] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.228903] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.229000] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.229069] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.229144] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.229212] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.229286] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.288905] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.289002] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.289071] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.289147] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.289214] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.289288] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.380913] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.381012] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.381081] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.381155] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.381222] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.381295] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.844920] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.845024] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.845092] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.845168] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.845235] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.845309] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.949379] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.949477] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.949545] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.949619] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1071.949686] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1071.949759] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1072.072919] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1072.073019] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1072.073088] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1072.073163] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1072.073230] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1072.073304] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1072.692924] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1072.693027] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1072.693096] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1072.693172] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1072.693239] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1072.693313] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.020913] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.021010] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.021078] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.021153] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.021220] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.021293] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.236905] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.237003] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.237072] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.237147] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.237214] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.237288] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.412913] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.413012] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.413080] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.413156] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.413223] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.413297] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.572914] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.573014] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.573084] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.573159] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1073.573227] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1073.573300] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1074.117542] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1074.117655] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1
> [ 1074.117725] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40086482, nr=3D0x82, =
dev 0xe200, auth=3D1
> [ 1074.117801] [drm:drm_ioctl], pid=3D2299, cmd=3D0x40046483, nr=3D0x83, =
dev 0xe200, auth=3D1

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzmuSQACgkQg5k4nX1Sv1tJJwD7BvpjXNayLxOsZ3LTnbXa6//R
JkKjpGjtII9cBuh6FzwBAJRS9NC0MyGmQ0l9Su/2jRoMlDiQvfgAw36Q7zrIlOoa
=gxtV
-----END PGP SIGNATURE-----
--==-=-=--

--===============0656849085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0656849085==--
