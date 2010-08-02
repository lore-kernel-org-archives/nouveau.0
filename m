From: =?utf-8?q?K=C4=81rlis_Repsons?= <k@11.lv>
Subject: Re: 2 cards in, but work only separately
Date: Mon, 2 Aug 2010 15:01:25 +0000
Message-ID: <201008021501.30085.k@11.lv>
References: <201007312208.33260.k@11.lv> <201008021332.02470.k@11.lv>
	<87sk2xhzvs.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0608908649=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87sk2xhzvs.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0608908649==
Content-Type: multipart/signed;
  boundary="nextPart1749595.3BgREj9eck";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1749595.3BgREj9eck
Content-Type: multipart/mixed;
  boundary="Boundary-01=_F3tVMHPJBDHGUAK"
Content-Transfer-Encoding: 7bit


--Boundary-01=_F3tVMHPJBDHGUAK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 02 August 2010 14:07:19 Francisco Jerez wrote:
> K=C4=81rlis Repsons <k@11.lv> writes:
> > On Monday 02 August 2010 11:33:14 Francisco Jerez wrote:
> >> > But now I'm at the "next level of trouble":
> >> > 1. when two Xservers are running, after some minutes video output of
> >> > the primary card ceases (logging out restarts X and then it's
> >> > back..), while the  second output is still ok;
> >>=20
> >> Kernel and X logs after the crash would be helpful.
> >=20
> > I found them to be funnily short: in my kernel log there is this line:
> > [drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output =
0)
> >=20
> > And yes it doesn't come back just by moving mouse.
> > In xorg.conf there is /Option "DPMS" "off"/ for each monitor and also f=
or
> > each server layout Blank, Standby, Suspend, Off *Time is set to "0"...
> >=20
> > $ cat Xorg.0.log | egrep "(DPMS|Dpms|dpms)"
> > Aug  2 13:05:01 station 19180.806] (II) Loading extension DPMS
> > Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): DPMS capabilities:
> > Off; RGB/Color Display
> >=20
> > Now what should I do please?
>=20
> Show us your full logs, please.
Ok. Here I post the kernel log fragment between start of Xservers at 13:05:=
00 and crash,
which happened at 13:14:47, you can find full logs in attach,
note that syslog-ng has done some "modifications", but I hope they're not
harmful for us:

Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Allocating FIFO=
 number 1
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: nouveau_channel=
_alloc: initialised FIFO 1
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Setting dpms mo=
de 3 on tmds encoder (output 2)
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: 0xD0B6: Parsing=
 digital output script table
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Setting dpms mo=
de 0 on tmds encoder (output 2)
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:04:00.0: Output DVI-I-2 =
is running on CRTC 0 using output A
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO=
 number 1
Aug  2 13:05:01 station kernel: [drm] nouveau 0000:01:00.0: nouveau_channel=
_alloc: initialised FIFO 1
Aug  2 13:14:47 station kernel: [drm] nouveau 0000:01:00.0: Setting dpms mo=
de 1 on vga encoder (output 0)
Aug  2 13:17:11 station kernel: [drm] nouveau 0000:04:00.0: nouveau_channel=
_free: freeing fifo 1
Aug  2 13:17:11 station kernel: [drm] nouveau 0000:01:00.0: nouveau_channel=
_free: freeing fifo 1

Let me know what you find...

--Boundary-01=_F3tVMHPJBDHGUAK
Content-Type: text/plain;
  charset="UTF-8";
  name="dmesg-output"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="dmesg-output"

Linux version 2.6.35-rc3-2010-08-01 (root@station) (gcc version 4.4.4 (Gent=
oo 4.4.4-r1 p1.0, pie-0.4.5) ) #1 SMP Sun Aug 1 14:34:35 GMT 2010
Command line: root=3D/dev/sda3 xdriver=3Dnouveau
BIOS-provided physical RAM map:
BIOS-e820: 0000000000000000 - 000000000009cc00 (usable)
BIOS-e820: 000000000009cc00 - 00000000000a0000 (reserved)
BIOS-e820: 00000000000e4000 - 0000000000100000 (reserved)
BIOS-e820: 0000000000100000 - 00000000bff70000 (usable)
BIOS-e820: 00000000bff70000 - 00000000bff7e000 (ACPI data)
BIOS-e820: 00000000bff7e000 - 00000000bffd0000 (ACPI NVS)
BIOS-e820: 00000000bffd0000 - 00000000c0000000 (reserved)
BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
BIOS-e820: 00000000ffe00000 - 0000000100000000 (reserved)
BIOS-e820: 0000000100000000 - 0000000240000000 (usable)
NX (Execute Disable) protection: active
DMI present.
AMI BIOS detected: BIOS may corrupt low RAM, working around it.
e820 update range: 0000000000000000 - 0000000000010000 (usable) =3D=3D> (re=
served)
e820 update range: 0000000000000000 - 0000000000001000 (usable) =3D=3D> (re=
served)
e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
No AGP bridge found
last_pfn =3D 0x240000 max_arch_pfn =3D 0x400000000
MTRR default type: uncachable
MTRR fixed ranges enabled:
00000-9FFFF write-back
A0000-BFFFF uncachable
C0000-DFFFF write-protect
E0000-EFFFF write-through
=460000-FFFFF write-protect
MTRR variable ranges enabled:
0 base 000000000 mask E00000000 write-back
1 base 200000000 mask FC0000000 write-back
2 base 0C0000000 mask FC0000000 uncachable
3 disabled
4 disabled
5 disabled
6 disabled
7 disabled
x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
e820 update range: 00000000c0000000 - 0000000100000000 (usable) =3D=3D> (re=
served)
last_pfn =3D 0xbff70 max_arch_pfn =3D 0x400000000
initial memory mapped : 0 - 20000000
found SMP MP-table at [ffff8800000ff780] ff780
init_memory_mapping: 0000000000000000-00000000bff70000
0000000000 - 00bfe00000 page 2M
00bfe00000 - 00bff70000 page 4k
kernel direct mapping tables up to bff70000 @ 16000-1b000
init_memory_mapping: 0000000100000000-0000000240000000
0100000000 - 0240000000 page 2M
kernel direct mapping tables up to 240000000 @ 19000-23000
ACPI: RSDP 00000000000fb030 00024 (v02 ACPIAM)
ACPI: XSDT 00000000bff70100 0005C (v01 A_M_I_ OEMXSDT  07000809 MSFT 000000=
97)
ACPI: FACP 00000000bff70290 000F4 (v03 A_M_I_ OEMFACP  07000809 MSFT 000000=
97)
ACPI: DSDT 00000000bff70440 0963E (v01  A0986 A0986000 00000000 INTL 200601=
13)
ACPI: FACS 00000000bff7e000 00040
ACPI: APIC 00000000bff70390 0006C (v01 A_M_I_ OEMAPIC  07000809 MSFT 000000=
97)
ACPI: MCFG 00000000bff70400 0003C (v01 A_M_I_ OEMMCFG  07000809 MSFT 000000=
97)
ACPI: OEMB 00000000bff7e040 00081 (v01 A_M_I_ AMI_OEM  07000809 MSFT 000000=
97)
ACPI: HPET 00000000bff79a80 00038 (v01 A_M_I_ OEMHPET  07000809 MSFT 000000=
97)
ACPI: OSFR 00000000bff79ac0 000B0 (v01 A_M_I_ OEMOSFR  07000809 MSFT 000000=
97)
ACPI: SSDT 00000000bff7e5d0 00A7C (v01 DpgPmm    CpuPm 00000012 INTL 200601=
13)
ACPI: Local APIC address 0xfee00000
[ffffea0000000000-ffffea0007dfffff] PMD -> [ffff880002200000-ffff8800091fff=
ff] on node 0
Zone PFN ranges:
DMA      0x00000010 -> 0x00001000
DMA32    0x00001000 -> 0x00100000
Normal   0x00100000 -> 0x00240000
Movable zone start PFN for each node
early_node_map[3] active PFN ranges
  0: 0x00000010 -> 0x0000009c
  0: 0x00000100 -> 0x000bff70
  0: 0x00100000 -> 0x00240000
On node 0 totalpages: 2096892
DMA zone: 56 pages used for memmap
DMA zone: 0 pages reserved
DMA zone: 3924 pages, LIFO batch:0
DMA32 zone: 14280 pages used for memmap
DMA32 zone: 767912 pages, LIFO batch:31
Normal zone: 17920 pages used for memmap
Normal zone: 1292800 pages, LIFO batch:31
ACPI: PM-Timer IO Port: 0x808
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
ACPI: LAPIC (acpi_id[0x03] lapic_id[0x82] disabled)
ACPI: LAPIC (acpi_id[0x04] lapic_id[0x83] disabled)
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Using ACPI (MADT) for SMP configuration information
ACPI: HPET id: 0x8086a301 base: 0xfed00000
SMP: Allowing 4 CPUs, 2 hotplug CPUs
nr_irqs_gsi: 40
early_res array is doubled to 64 at [1e000 - 1e7ff]
PM: Registered nosave memory: 000000000009c000 - 000000000009d000
PM: Registered nosave memory: 000000000009d000 - 00000000000a0000
PM: Registered nosave memory: 00000000000a0000 - 00000000000e4000
PM: Registered nosave memory: 00000000000e4000 - 0000000000100000
PM: Registered nosave memory: 00000000bff70000 - 00000000bff7e000
PM: Registered nosave memory: 00000000bff7e000 - 00000000bffd0000
PM: Registered nosave memory: 00000000bffd0000 - 00000000c0000000
PM: Registered nosave memory: 00000000c0000000 - 00000000fee00000
PM: Registered nosave memory: 00000000fee00000 - 00000000fee01000
PM: Registered nosave memory: 00000000fee01000 - 00000000ffe00000
PM: Registered nosave memory: 00000000ffe00000 - 0000000100000000
Allocating PCI resources starting at c0000000 (gap: c0000000:3ee00000)
setup_percpu: NR_CPUS:4 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
PERCPU: Embedded 26 pages/cpu @ffff880001a00000 s77056 r8192 d21248 u524288
pcpu-alloc: s77056 r8192 d21248 u524288 alloc=3D1*2097152
pcpu-alloc: [0] 0 1 2 3=20
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 2064636
Kernel command line: root=3D/dev/sda3 xdriver=3Dnouveau
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Checking aperture...
No AGP bridge found
Subtract (56 early reservations)
#1 [0001000000 - 00018568c4]   TEXT DATA BSS
#2 [0001857000 - 0001857280]             BRK
#3 [00000ff790 - 0000100000]   BIOS reserved
#4 [00000ff780 - 00000ff790]    MP-table mpf
#5 [000009cc00 - 00000e3bf0]   BIOS reserved
#6 [00000e3d6c - 00000ff780]   BIOS reserved
#7 [00000e3bf0 - 00000e3d6c]    MP-table mpc
#8 [0000010000 - 0000012000]      TRAMPOLINE
#9 [0000012000 - 0000016000]     ACPI WAKEUP
#10 [0000016000 - 0000019000]         PGTABLE
#11 [0000019000 - 000001e000]         PGTABLE
#12 [0001857280 - 0001858280]         BOOTMEM
#13 [0001856900 - 0001856f00]         BOOTMEM
#14 [0002059000 - 000205a000]         BOOTMEM
#15 [000205a000 - 000205b000]         BOOTMEM
#16 [0002200000 - 0009200000]        MEMMAP 0
#17 [0001858280 - 0001858400]         BOOTMEM
#18 [0001858400 - 0001870400]         BOOTMEM
#19 [0001870400 - 0001888400]         BOOTMEM
#20 [0001889000 - 000188a000]         BOOTMEM
#21 [0001856f00 - 0001856f41]         BOOTMEM
#22 [0001856f80 - 0001856fc3]         BOOTMEM
#23 [0001888400 - 0001888668]         BOOTMEM
#24 [0001888680 - 00018886e8]         BOOTMEM
#25 [0001888700 - 0001888768]         BOOTMEM
#26 [0001888780 - 00018887e8]         BOOTMEM
#27 [0001888800 - 0001888868]         BOOTMEM
#28 [0001888880 - 00018888e8]         BOOTMEM
#29 [0001888900 - 0001888968]         BOOTMEM
#30 [0001888980 - 00018889e8]         BOOTMEM
#31 [0001888a00 - 0001888a68]         BOOTMEM
#32 [0001888a80 - 0001888ae8]         BOOTMEM
#33 [0001888b00 - 0001888b68]         BOOTMEM
#34 [0001888b80 - 0001888ba0]         BOOTMEM
#35 [0001888bc0 - 0001888be0]         BOOTMEM
#36 [0001888c00 - 0001888c1f]         BOOTMEM
#37 [0001888c40 - 0001888c5f]         BOOTMEM
#38 [0001a00000 - 0001a1a000]         BOOTMEM
#39 [0001a80000 - 0001a9a000]         BOOTMEM
#40 [0001b00000 - 0001b1a000]         BOOTMEM
#41 [0001b80000 - 0001b9a000]         BOOTMEM
#42 [0001888c80 - 0001888c88]         BOOTMEM
#43 [0001888cc0 - 0001888cc8]         BOOTMEM
#44 [0001888d00 - 0001888d10]         BOOTMEM
#45 [0001888d40 - 0001888d60]         BOOTMEM
#46 [0001888d80 - 0001888eb0]         BOOTMEM
#47 [0001888ec0 - 0001888f10]         BOOTMEM
#48 [0001888f40 - 0001888f90]         BOOTMEM
#49 [000188a000 - 0001892000]         BOOTMEM
#50 [0009200000 - 0009a00000]         BOOTMEM
#51 [0001b9a000 - 0001f9a000]         BOOTMEM
#52 [0009a00000 - 000da00000]         BOOTMEM
#53 [0001892000 - 00018b2000]         BOOTMEM
#54 [00018b2000 - 00018f2000]         BOOTMEM
#55 [000001e800 - 0000026800]         BOOTMEM
Memory: 8185380k/9437184k available (4942k kernel code, 1049616k absent, 20=
2188k reserved, 2486k data, 464k init)
SLUB: Genslabs=3D13, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
Hierarchical RCU implementation.
	RCU-based detection of stalled CPUs is disabled.
	Verbose stalled-CPUs detection is disabled.
NR_IRQS:384
Extended CMOS year: 2000
Console: colour VGA+ 80x25
console [tty0] enabled
hpet clockevent registered
=46ast TSC calibration using PIT
Detected 2500.146 MHz processor.
Calibrating delay loop (skipped), value calculated using timer frequency.. =
5000.29 BogoMIPS (lpj=3D10000584)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 256
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 0
mce: CPU supports 6 MCE banks
CPU0: Thermal monitoring enabled (TM2)
using mwait in idle threads.
Performance Events: PEBS fmt0+, Core2 events, Intel PMU driver.
=2E.. version:                2
=2E.. bit width:              40
=2E.. generic registers:      2
=2E.. value mask:             000000ffffffffff
=2E.. max period:             000000007fffffff
=2E.. fixed-purpose events:   3
=2E.. event mask:             0000000700000003
ACPI: Core revision 20100428
Setting APIC routing to flat
=2E.TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
CPU0: Intel Pentium(R) Dual-Core  CPU      E5200  @ 2.50GHz stepping 06
Booting Node   0, Processors  #1
Brought up 2 CPUs
Total of 2 processors activated (10000.43 BogoMIPS).
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (b=
ase 0xe0000000)
PCI: not using MMCONFIG
PCI: Using configuration type 1 for base access
bio: create slab <bio-0> at 0
ACPI: EC: Look up EC in DSDT
ACPI: Executed 1 blocks of module-level executable AML code
ACPI: SSDT 00000000bff7e0d0 00277 (v01 DpgPmm  P001Ist 00000011 INTL 200601=
13)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT (null) 00277 (v01 DpgPmm  P001Ist 00000011 INTL 20060113)
ACPI: SSDT 00000000bff7e350 00277 (v01 DpgPmm  P002Ist 00000012 INTL 200601=
13)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT (null) 00277 (v01 DpgPmm  P002Ist 00000012 INTL 20060113)
ACPI: Interpreter enabled
ACPI: (supports S0 S1 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (b=
ase 0xe0000000)
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard r=
esources
ACPI: No dock devices found.
PCI: Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs" a=
nd report a bug
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
pci_root PNP0A08:00: host bridge window [io  0x0000-0x0cf7]
pci_root PNP0A08:00: host bridge window [io  0x0d00-0xffff]
pci_root PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff]
pci_root PNP0A08:00: host bridge window [mem 0x000d0000-0x000dffff]
pci_root PNP0A08:00: host bridge window [mem 0xc0000000-0xffffffff]
pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
pci 0000:00:01.0: PME# disabled
pci 0000:00:1a.0: reg 20: [io  0xb800-0xb81f]
pci 0000:00:1a.1: reg 20: [io  0xb880-0xb89f]
pci 0000:00:1a.2: reg 20: [io  0xbc00-0xbc1f]
pci 0000:00:1a.7: reg 10: [mem 0xf8fffc00-0xf8ffffff]
pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1a.7: PME# disabled
pci 0000:00:1b.0: reg 10: [mem 0xf8ff8000-0xf8ffbfff 64bit]
pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1b.0: PME# disabled
pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.0: PME# disabled
pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.4: PME# disabled
pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.5: PME# disabled
pci 0000:00:1d.0: reg 20: [io  0xb080-0xb09f]
pci 0000:00:1d.1: reg 20: [io  0xb400-0xb41f]
pci 0000:00:1d.2: reg 20: [io  0xb480-0xb49f]
pci 0000:00:1d.7: reg 10: [mem 0xf8fff800-0xf8fffbff]
pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1d.7: PME# disabled
pci 0000:00:1f.0: quirk: [io  0x0800-0x087f] claimed by ICH6 ACPI/GPIO/TCO
pci 0000:00:1f.0: quirk: [io  0x0500-0x053f] claimed by ICH6 GPIO
pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 0294 (mask 0003)
pci 0000:00:1f.0: ICH7 LPC Generic IO decode 3 PIO at 4700 (mask 001f)
pci 0000:00:1f.2: reg 10: [io  0xac00-0xac07]
pci 0000:00:1f.2: reg 14: [io  0xa880-0xa883]
pci 0000:00:1f.2: reg 18: [io  0xa800-0xa807]
pci 0000:00:1f.2: reg 1c: [io  0xa480-0xa483]
pci 0000:00:1f.2: reg 20: [io  0xa400-0xa41f]
pci 0000:00:1f.2: reg 24: [mem 0xf8ffe800-0xf8ffefff]
pci 0000:00:1f.2: PME# supported from D3hot
pci 0000:00:1f.2: PME# disabled
pci 0000:00:1f.3: reg 10: [mem 0xf8fff400-0xf8fff4ff 64bit]
pci 0000:00:1f.3: reg 20: [io  0x0400-0x041f]
pci 0000:01:00.0: reg 10: [mem 0xfa000000-0xfaffffff]
pci 0000:01:00.0: reg 14: [mem 0xc0000000-0xcfffffff 64bit pref]
pci 0000:01:00.0: reg 1c: [mem 0xf9000000-0xf9ffffff 64bit]
pci 0000:01:00.0: reg 30: [mem 0xfbde0000-0xfbdfffff pref]
pci 0000:00:01.0: PCI bridge to [bus 01-01]
pci 0000:00:01.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:01.0:   bridge window [mem 0xf9000000-0xfbdfffff]
pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
pci 0000:04:00.0: reg 10: [mem 0xfd000000-0xfdffffff]
pci 0000:04:00.0: reg 14: [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:04:00.0: reg 1c: [mem 0xfc000000-0xfcffffff 64bit]
pci 0000:04:00.0: reg 30: [mem 0xfeae0000-0xfeafffff pref]
pci 0000:00:1c.0: PCI bridge to [bus 04-04]
pci 0000:00:1c.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1c.0:   bridge window [mem 0xfc000000-0xfeafffff]
pci 0000:00:1c.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:03:00.0: reg 10: [io  0xdc00-0xdc07]
pci 0000:03:00.0: reg 14: [io  0xd880-0xd883]
pci 0000:03:00.0: reg 18: [io  0xd800-0xd807]
pci 0000:03:00.0: reg 1c: [io  0xd480-0xd483]
pci 0000:03:00.0: reg 20: [io  0xd400-0xd40f]
pci 0000:03:00.0: reg 24: [mem 0xfbfffc00-0xfbffffff]
pci 0000:03:00.0: supports D1
pci 0000:03:00.0: PME# supported from D0 D1 D3hot
pci 0000:03:00.0: PME# disabled
pci 0000:00:1c.4: PCI bridge to [bus 03-03]
pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
pci 0000:00:1c.4:   bridge window [mem 0xfbf00000-0xfbffffff]
pci 0000:00:1c.4:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:02:00.0: reg 10: [mem 0xfbefc000-0xfbefffff 64bit]
pci 0000:02:00.0: reg 18: [io  0xc800-0xc8ff]
pci 0000:02:00.0: reg 30: [mem 0xfbec0000-0xfbedffff pref]
pci 0000:02:00.0: supports D1 D2
pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
pci 0000:02:00.0: PME# disabled
pci 0000:00:1c.5: PCI bridge to [bus 02-02]
pci 0000:00:1c.5:   bridge window [io  0xc000-0xcfff]
pci 0000:00:1c.5:   bridge window [mem 0xfbe00000-0xfbefffff]
pci 0000:00:1c.5:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:05:02.0: reg 10: [mem 0xfebfc000-0xfebfffff]
pci 0000:05:02.0: reg 14: [io  0xe800-0xe8ff]
pci 0000:05:02.0: reg 30: [mem 0xfebc0000-0xfebdffff pref]
pci 0000:05:02.0: supports D1 D2
pci 0000:05:02.0: PME# supported from D0 D1 D2 D3hot D3cold
pci 0000:05:02.0: PME# disabled
pci 0000:05:03.0: reg 10: [mem 0xfebfb000-0xfebfbfff]
pci 0000:05:03.0: supports D1 D2
pci 0000:05:03.0: PME# supported from D0 D1 D2 D3hot
pci 0000:05:03.0: PME# disabled
pci 0000:00:1e.0: PCI bridge to [bus 05-05] (subtractive decode)
pci 0000:00:1e.0:   bridge window [io  0xe000-0xefff]
pci 0000:00:1e.0:   bridge window [mem 0xfeb00000-0xfebfffff]
pci 0000:00:1e.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive =
decode)
pci 0000:00:1e.0:   bridge window [mem 0x000d0000-0x000dffff] (subtractive =
decode)
pci 0000:00:1e.0:   bridge window [mem 0xc0000000-0xffffffff] (subtractive =
decode)
pci_bus 0000:00: on NUMA node 0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P2._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P8._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P9._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P4._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 11 12 14 *15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 *5 6 7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disable=
d.
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11 12 *14 15)
ACPI: PCI Interrupt Link [LNKG] (IRQs *3 4 5 6 7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 *7 10 11 12 14 15)
vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=
=3Dnone
vgaarb: device added: PCI:0000:04:00.0,decodes=3Dio+mem,owns=3Dnone,locks=
=3Dnone
vgaarb: loaded
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
reserve RAM buffer: 000000000009cc00 - 000000000009ffff=20
reserve RAM buffer: 00000000bff70000 - 00000000bfffffff=20
HPET: 4 timers in total, 0 timers will be used for per-cpu timer
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
hpet0: 4 comparators, 64-bit 14.318180 MHz counter
Switching to clocksource tsc
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 16 devices
ACPI: ACPI bus type pnp unregistered
system 00:01: [mem 0xfed14000-0xfed19fff] has been reserved
system 00:06: [io  0x0290-0x029f] has been reserved
system 00:07: [io  0x04d0-0x04d1] has been reserved
system 00:07: [io  0x0800-0x087f] has been reserved
system 00:07: [io  0x0500-0x057f] could not be reserved
system 00:07: [mem 0xfed08000-0xfed08fff] has been reserved
system 00:07: [mem 0xfed1c000-0xfed1ffff] has been reserved
system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
system 00:07: [mem 0xfed50000-0xfed8ffff] has been reserved
system 00:0a: [mem 0xffc00000-0xffdfffff] has been reserved
system 00:0c: [mem 0xfec00000-0xfec00fff] could not be reserved
system 00:0c: [mem 0xfee00000-0xfee00fff] has been reserved
system 00:0e: [mem 0xe0000000-0xefffffff] has been reserved
system 00:0f: [mem 0x00000000-0x0009ffff] could not be reserved
system 00:0f: [mem 0x000c0000-0x000cffff] has been reserved
system 00:0f: [mem 0x000e0000-0x000fffff] could not be reserved
system 00:0f: [mem 0x00100000-0xbfffffff] could not be reserved
pci 0000:00:1c.4: BAR 9: assigned [mem 0xf0000000-0xf01fffff 64bit pref]
pci 0000:00:1c.5: BAR 9: assigned [mem 0xf0200000-0xf03fffff 64bit pref]
pci 0000:00:1c.0: BAR 7: assigned [io  0x1000-0x1fff]
pci 0000:00:01.0: PCI bridge to [bus 01-01]
pci 0000:00:01.0:   bridge window [io  disabled]
pci 0000:00:01.0:   bridge window [mem 0xf9000000-0xfbdfffff]
pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
pci 0000:00:1c.0: PCI bridge to [bus 04-04]
pci 0000:00:1c.0:   bridge window [io  0x1000-0x1fff]
pci 0000:00:1c.0:   bridge window [mem 0xfc000000-0xfeafffff]
pci 0000:00:1c.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:00:1c.4: PCI bridge to [bus 03-03]
pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
pci 0000:00:1c.4:   bridge window [mem 0xfbf00000-0xfbffffff]
pci 0000:00:1c.4:   bridge window [mem 0xf0000000-0xf01fffff 64bit pref]
pci 0000:00:1c.5: PCI bridge to [bus 02-02]
pci 0000:00:1c.5:   bridge window [io  0xc000-0xcfff]
pci 0000:00:1c.5:   bridge window [mem 0xfbe00000-0xfbefffff]
pci 0000:00:1c.5:   bridge window [mem 0xf0200000-0xf03fffff 64bit pref]
pci 0000:00:1e.0: PCI bridge to [bus 05-05]
pci 0000:00:1e.0:   bridge window [io  0xe000-0xefff]
pci 0000:00:1e.0:   bridge window [mem 0xfeb00000-0xfebfffff]
pci 0000:00:1e.0:   bridge window [mem pref disabled]
pci 0000:00:01.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pci 0000:00:01.0: setting latency timer to 64
pci 0000:00:1c.0: enabling device (0106 -> 0107)
pci 0000:00:1c.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.0: setting latency timer to 64
pci 0000:00:1c.4: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.4: setting latency timer to 64
pci 0000:00:1c.5: PCI INT B -> GSI 16 (level, low) -> IRQ 16
pci 0000:00:1c.5: setting latency timer to 64
pci 0000:00:1e.0: setting latency timer to 64
pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff]
pci_bus 0000:00: resource 8 [mem 0xc0000000-0xffffffff]
pci_bus 0000:01: resource 1 [mem 0xf9000000-0xfbdfffff]
pci_bus 0000:01: resource 2 [mem 0xc0000000-0xcfffffff 64bit pref]
pci_bus 0000:04: resource 0 [io  0x1000-0x1fff]
pci_bus 0000:04: resource 1 [mem 0xfc000000-0xfeafffff]
pci_bus 0000:04: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
pci_bus 0000:03: resource 0 [io  0xd000-0xdfff]
pci_bus 0000:03: resource 1 [mem 0xfbf00000-0xfbffffff]
pci_bus 0000:03: resource 2 [mem 0xf0000000-0xf01fffff 64bit pref]
pci_bus 0000:02: resource 0 [io  0xc000-0xcfff]
pci_bus 0000:02: resource 1 [mem 0xfbe00000-0xfbefffff]
pci_bus 0000:02: resource 2 [mem 0xf0200000-0xf03fffff 64bit pref]
pci_bus 0000:05: resource 0 [io  0xe000-0xefff]
pci_bus 0000:05: resource 1 [mem 0xfeb00000-0xfebfffff]
pci_bus 0000:05: resource 4 [io  0x0000-0x0cf7]
pci_bus 0000:05: resource 5 [io  0x0d00-0xffff]
pci_bus 0000:05: resource 6 [mem 0x000a0000-0x000bffff]
pci_bus 0000:05: resource 7 [mem 0x000d0000-0x000dffff]
pci_bus 0000:05: resource 8 [mem 0xc0000000-0xffffffff]
NET: Registered protocol family 2
IP route cache hash table entries: 262144 (order: 9, 2097152 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
UDP hash table entries: 4096 (order: 5, 131072 bytes)
UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
NET: Registered protocol family 1
pci 0000:00:1d.7: EHCI: BIOS handoff failed (BIOS bug?) 01010001
pci 0000:01:00.0: Boot video device
PCI: CLS 32 bytes, default 64
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
Placing 64MB software IO TLB between ffff880009a00000 - ffff88000da00000
software IO TLB at phys 0x9a00000 - 0xda00000
kvm: no hardware support
HugeTLB registered 2 MB page size, pre-allocated 0 pages
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
DLM (built Aug  1 2010 14:20:30) installed
ROMFS MTD (C) 2007 Red Hat, Inc.
fuse init (API version 7.14)
msgmni has been set to 15987
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
pcieport 0000:00:01.0: setting latency timer to 64
pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
pcieport 0000:00:1c.0: setting latency timer to 64
pcieport 0000:00:1c.0: irq 41 for MSI/MSI-X
pcieport 0000:00:1c.4: setting latency timer to 64
pcieport 0000:00:1c.4: irq 42 for MSI/MSI-X
pcieport 0000:00:1c.5: setting latency timer to 64
pcieport 0000:00:1c.5: irq 43 for MSI/MSI-X
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/in=
put0
ACPI: Power Button [PWRB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
ACPI: Power Button [PWRF]
ACPI: acpi_idle registered with cpuidle
ipmi message handler version 39.2
ipmi device interface
IPMI System Interface driver.
ipmi_si: Adding default-specified kcs state machine
ipmi_si: Trying default-specified kcs state machine at i/o address 0xca2, s=
lave address 0x0, irq 0
ipmi_si: Interface detection failed
ipmi_si: Adding default-specified smic state machine
ipmi_si: Trying default-specified smic state machine at i/o address 0xca9, =
slave address 0x0, irq 0
ipmi_si: Interface detection failed
ipmi_si: Adding default-specified bt state machine
ipmi_si: Trying default-specified bt state machine at i/o address 0xe4, sla=
ve address 0x0, irq 0
ipmi_si: Interface detection failed
ipmi_si: Unable to find any System Interface(s)
IPMI Watchdog: driver initialized
Copyright (C) 2004 MontaVista Software - IPMI Powerdown via sys_reboot.
Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is 6=
0 seconds).
Hangcheck: Using getrawmonotonic().
[drm] Initialized drm 1.1.0 20060810
Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
00:0b: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
brd: module loaded
Loading iSCSI transport class v2.0-870.
ahci 0000:00:1f.2: version 3.0
ahci 0000:00:1f.2: PCI INT B -> GSI 19 (level, low) -> IRQ 19
ahci 0000:00:1f.2: irq 44 for MSI/MSI-X
ahci: SSS flag set, parallel bus scan disabled
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA mo=
de
ahci 0000:00:1f.2: flags: 64bit ncq sntf stag pm led clo pmp pio slum part =
ccc ems sxs=20
ahci 0000:00:1f.2: setting latency timer to 64
scsi0 : ahci
scsi1 : ahci
scsi2 : ahci
scsi3 : ahci
scsi4 : ahci
scsi5 : ahci
ata1: SATA max UDMA/133 abar m2048@0xf8ffe800 port 0xf8ffe900 irq 44
ata2: SATA max UDMA/133 abar m2048@0xf8ffe800 port 0xf8ffe980 irq 44
ata3: SATA max UDMA/133 abar m2048@0xf8ffe800 port 0xf8ffea00 irq 44
ata4: SATA max UDMA/133 abar m2048@0xf8ffe800 port 0xf8ffea80 irq 44
ata5: SATA max UDMA/133 abar m2048@0xf8ffe800 port 0xf8ffeb00 irq 44
ata6: SATA max UDMA/133 abar m2048@0xf8ffe800 port 0xf8ffeb80 irq 44
pata_marvell 0000:03:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pata_marvell 0000:03:00.0: setting latency timer to 64
scsi6 : pata_marvell
scsi7 : pata_marvell
ata7: PATA max UDMA/100 cmd 0xdc00 ctl 0xd880 bmdma 0xd400 irq 16
ata8: PATA max UDMA/133 cmd 0xd800 ctl 0xd480 bmdma 0xd408 irq 16
ohci1394 0000:05:03.0: PCI INT A -> GSI 19 (level, low) -> IRQ 19
ohci1394: fw-host0: OHCI-1394 1.0 (PCI): IRQ=3D[19]  MMIO=3D[febfb000-febfb=
7ff]  Max Packet=3D[2048]  IR/IT contexts=3D[8/8]
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci_hcd 0000:00:1a.7: PCI INT C -> GSI 18 (level, low) -> IRQ 18
ehci_hcd 0000:00:1a.7: setting latency timer to 64
ehci_hcd 0000:00:1a.7: EHCI Host Controller
ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:1a.7: debug port 1
ehci_hcd 0000:00:1a.7: cache line size of 32 is not supported
ehci_hcd 0000:00:1a.7: irq 18, io mem 0xf8fffc00
ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.35-rc3-2010-08-01 ehci_hcd
usb usb1: SerialNumber: 0000:00:1a.7
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
ehci_hcd 0000:00:1d.7: PCI INT A -> GSI 23 (level, low) -> IRQ 23
ehci_hcd 0000:00:1d.7: setting latency timer to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 2
ehci_hcd 0000:00:1d.7: debug port 1
ehci_hcd 0000:00:1d.7: cache line size of 32 is not supported
ehci_hcd 0000:00:1d.7: irq 23, io mem 0xf8fff800
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: EHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.35-rc3-2010-08-01 ehci_hcd
usb usb2: SerialNumber: 0000:00:1d.7
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 6 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
uhci_hcd 0000:00:1a.0: setting latency timer to 64
uhci_hcd 0000:00:1a.0: UHCI Host Controller
uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1a.0: irq 16, io base 0x0000b800
usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb3: Product: UHCI Host Controller
usb usb3: Manufacturer: Linux 2.6.35-rc3-2010-08-01 uhci_hcd
usb usb3: SerialNumber: 0000:00:1a.0
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:1a.1: setting latency timer to 64
uhci_hcd 0000:00:1a.1: UHCI Host Controller
uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1a.1: irq 21, io base 0x0000b880
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb4: Product: UHCI Host Controller
usb usb4: Manufacturer: Linux 2.6.35-rc3-2010-08-01 uhci_hcd
usb usb4: SerialNumber: 0000:00:1a.1
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
uhci_hcd 0000:00:1a.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1a.2: setting latency timer to 64
uhci_hcd 0000:00:1a.2: UHCI Host Controller
uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus number 5
uhci_hcd 0000:00:1a.2: irq 18, io base 0x0000bc00
usb usb5: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb5: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb5: Product: UHCI Host Controller
usb usb5: Manufacturer: Linux 2.6.35-rc3-2010-08-01 uhci_hcd
usb usb5: SerialNumber: 0000:00:1a.2
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
uhci_hcd 0000:00:1d.0: setting latency timer to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 6
uhci_hcd 0000:00:1d.0: irq 23, io base 0x0000b080
usb usb6: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb6: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb6: Product: UHCI Host Controller
usb usb6: Manufacturer: Linux 2.6.35-rc3-2010-08-01 uhci_hcd
usb usb6: SerialNumber: 0000:00:1d.0
hub 6-0:1.0: USB hub found
hub 6-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:1d.1: setting latency timer to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 7
uhci_hcd 0000:00:1d.1: irq 19, io base 0x0000b400
usb usb7: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb7: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb7: Product: UHCI Host Controller
usb usb7: Manufacturer: Linux 2.6.35-rc3-2010-08-01 uhci_hcd
usb usb7: SerialNumber: 0000:00:1d.1
hub 7-0:1.0: USB hub found
hub 7-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1d.2: setting latency timer to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 8
uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000b480
usb usb8: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb8: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb8: Product: UHCI Host Controller
usb usb8: Manufacturer: Linux 2.6.35-rc3-2010-08-01 uhci_hcd
usb usb8: SerialNumber: 0000:00:1d.2
hub 8-0:1.0: USB hub found
hub 8-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
PNP: PS/2 appears to have AUX port disabled, if this is incorrect please bo=
ot with i8042.nopnp
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
input: PC Speaker as /devices/platform/pcspkr/input/input2
I2O subsystem v1.325
i2o: max drivers =3D 8
I2O Configuration OSM v1.323
I2O Bus Adapter OSM v1.317
I2O Block Device OSM v1.325
I2O SCSI Peripheral OSM v1.316
I2O ProcFS OSM v1.316
i2c /dev entries driver
Driver for 1-wire Dallas network protocol.
cpuidle: using governor ladder
usbcore: registered new interface driver hiddev
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
IPv4 over IPv4 tunneling driver
GRE over IPv4 tunneling driver
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
tunl0: Disabled Privacy Extensions
IPv6 over IPv4 tunneling driver
sit0: Disabled Privacy Extensions
ip6tnl0: Disabled Privacy Extensions
NET: Registered protocol family 17
NET: Registered protocol family 15
SCTP: Hash tables configured (established 65536 bind 65536)
input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input=
/input3
ata7.00: ATAPI: _NEC DVD_RW ND-3500AG, 2.16, max UDMA/33
ata7.00: configured for UDMA/33
ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata1.00: ATA-8: WDC WD6401AALS-00L3B2, 01.03B01, max UDMA/133
ata1.00: 1250263728 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
ata1.00: configured for UDMA/133
scsi 0:0:0:0: Direct-Access     ATA      WDC WD6401AALS-0 01.0 PQ: 0 ANSI: 5
sd 0:0:0:0: Attached scsi generic sg0 type 0
sd 0:0:0:0: [sda] 1250263728 512-byte logical blocks: (640 GB/596 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
sd 0:0:0:0: [sda] Attached SCSI disk
usb 2-2: new high speed USB device using ehci_hcd and address 2
usb 2-2: New USB device found, idVendor=3D0409, idProduct=3D005a
usb 2-2: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
hub 2-2:1.0: USB hub found
hub 2-2:1.0: 4 ports detected
ata2: SATA link down (SStatus 0 SControl 300)
usb 7-2: new low speed USB device using uhci_hcd and address 2
ata3: SATA link down (SStatus 0 SControl 300)
usb 7-2: New USB device found, idVendor=3D046d, idProduct=3Dc018
usb 7-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 7-2: Product: USB Optical Mouse
usb 7-2: Manufacturer: Logitech
input: Logitech USB Optical Mouse as /devices/pci0000:00/0000:00:1d.1/usb7/=
7-2/7-2:1.0/input/input4
generic-usb 0003:046D:C018.0001: input,hidraw0: USB HID v1.11 Mouse [Logite=
ch USB Optical Mouse] on usb-0000:00:1d.1-2/input0
ata4: SATA link down (SStatus 0 SControl 300)
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[001e8c0001660a39]
usb 8-1: new low speed USB device using uhci_hcd and address 2
usb 8-1: New USB device found, idVendor=3D046d, idProduct=3Dc315
usb 8-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 8-1: Product: Logitech USB Keyboard
usb 8-1: Manufacturer: Logitech
input: Logitech Logitech USB Keyboard as /devices/pci0000:00/0000:00:1d.2/u=
sb8/8-1/8-1:1.0/input/input5
generic-usb 0003:046D:C315.0002: input,hidraw1: USB HID v1.10 Keyboard [Log=
itech Logitech USB Keyboard] on usb-0000:00:1d.2-1/input0
ata5: SATA link down (SStatus 0 SControl 300)
usb 8-2: new low speed USB device using uhci_hcd and address 3
ata6: SATA link down (SStatus 0 SControl 300)
scsi 6:0:0:0: CD-ROM            _NEC     DVD_RW ND-3500AG 2.16 PQ: 0 ANSI: 5
sr0: scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 6:0:0:0: Attached scsi CD-ROM sr0
sr 6:0:0:0: Attached scsi generic sg1 type 5
usb 8-2: New USB device found, idVendor=3D046d, idProduct=3Dc050
usb 8-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 8-2: Product: USB-PS/2 Optical Mouse
usb 8-2: Manufacturer: Logitech
input: Logitech USB-PS/2 Optical Mouse as /devices/pci0000:00/0000:00:1d.2/=
usb8/8-2/8-2:1.0/input/input6
generic-usb 0003:046D:C050.0003: input,hidraw2: USB HID v1.10 Mouse [Logite=
ch USB-PS/2 Optical Mouse] on usb-0000:00:1d.2-2/input0
ata8.00: ATA-7: Config   Disk 0, 1.2569, max MWDMA2
ata8.00: 16777215 sectors, multi 1: LBA=20
ata8.00: configured for MWDMA2
scsi 7:0:0:0: Direct-Access     ATA      Config   Disk 0  1.25 PQ: 0 ANSI: 5
sd 7:0:0:0: [sdb] 16777215 512-byte logical blocks: (8.58 GB/7.99 GiB)
sd 7:0:0:0: [sdb] Write Protect is off
sd 7:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 7:0:0:0: Attached scsi generic sg2 type 0
sd 7:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't suppo=
rt DPO or FUA
sdb: unknown partition table
sd 7:0:0:0: [sdb] Attached SCSI disk
EXT3-fs (sda3): recovery required on readonly filesystem
EXT3-fs (sda3): write access will be enabled during recovery
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda3): orphan cleanup on readonly fs
ext3_orphan_cleanup: deleting unreferenced inode 21364748
ext3_orphan_cleanup: deleting unreferenced inode 21364747
ext3_orphan_cleanup: deleting unreferenced inode 21364746
ext3_orphan_cleanup: deleting unreferenced inode 21364745
ext3_orphan_cleanup: deleting unreferenced inode 21364744
EXT3-fs (sda3): 5 orphan inodes deleted
EXT3-fs (sda3): recovery complete
EXT3-fs (sda3): mounted filesystem with writeback data mode
VFS: Mounted root (ext3 filesystem) readonly on device 8:3.
=46reeing unused kernel memory: 464k freed
udev: starting version 160
i801_smbus 0000:00:1f.3: PCI INT C -> GSI 18 (level, low) -> IRQ 18
ACPI: resource 0000:00:1f.3 [io  0x0400-0x041f] conflicts with ACPI region =
SMRG [io  0x0400-0x040f 64bit pref window disabled]
ACPI: If an ACPI driver is available for this device, you should use it ins=
tead of the native driver
rtc_cmos 00:03: RTC can wake from S4
rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
skge 0000:05:02.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
skge: 1.13 addr 0xfebfc000 irq 18 chip Yukon-Lite rev 9
skge 0000:05:02.0: eth0: addr 00:22:15:68:61:d6
sky2: driver version 1.28
sky2 0000:02:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
sky2 0000:02:00.0: setting latency timer to 64
sky2 0000:02:00.0: Yukon-2 EC Ultra chip revision 3
sky2 0000:02:00.0: irq 45 for MSI/MSI-X
sky2 0000:02:00.0: eth1: addr 00:22:15:68:51:a9
HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
HDA Intel 0000:00:1b.0: irq 46 for MSI/MSI-X
HDA Intel 0000:00:1b.0: setting latency timer to 64
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x046f00a3)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 05.72.22.43
[drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 01011312 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
[drm] nouveau 0000:01:00.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
[drm] nouveau 0000:01:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xE0F0
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xE41F
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xE9BD
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEB38
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xED91
[drm] nouveau 0000:01:00.0: Detected 256MiB VRAM
[TTM] Zone  kernel: Available graphics memory: 4092922 kiB.
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB.
[TTM] Initializing pool allocator.
[drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
mtrr: type mismatch for c0000000,10000000 old: write-back new: write-combin=
ing
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 1)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
[drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x48000, bo ffff88023e9=
1dc00
fbcon: nouveaufb (fb0) is primary device
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
Console: switching to colour frame buffer device 160x64
fb0: nouveaufb frame buffer device
drm: registered panic notifier
Slow work thread pool: Starting up
Slow work thread pool: Ready
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
nouveau 0000:04:00.0: enabling device (0000 -> 0002)
nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:04:00.0: setting latency timer to 64
[drm] nouveau 0000:04:00.0: Detected an NV40 generation card (0x044300b2)
[drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:04:00.0: ... BIOS signature not found
[drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:04:00.0: ... appears to be valid
[drm] nouveau 0000:04:00.0: BIT BIOS found
[drm] nouveau 0000:04:00.0: Bios version 05.44.02.67
[drm] nouveau 0000:04:00.0: BIT table 'd' not found
[drm] nouveau 0000:04:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:04:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:04:00.0: Raw DCB entry 1: 02011310 00000028
[drm] nouveau 0000:04:00.0: Raw DCB entry 2: 01011312 00000000
[drm] nouveau 0000:04:00.0: Raw DCB entry 3: 020223f1 0080c020
[drm] nouveau 0000:04:00.0: DCB connector table: VHER 0x30 5 7 2
[drm] nouveau 0000:04:00.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
[drm] nouveau 0000:04:00.0:   1: 0x00001130: type 0x30 idx 1 tag 0x07
[drm] nouveau 0000:04:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:04:00.0: Adaptor not initialised, running VBIOS init tab=
les.
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xDCEA
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xE04F
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xE589
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xE6DE
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xE888
[drm] nouveau 0000:04:00.0: Detected 256MiB VRAM
[drm] nouveau 0000:04:00.0: 64 MiB GART (aperture)
mtrr: type mismatch for d0000000,10000000 old: write-back new: write-combin=
ing
[drm] nouveau 0000:04:00.0: Saving VGA fonts
[drm] nouveau 0000:04:00.0: Allocating FIFO number 0
[drm] nouveau 0000:04:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[drm] nouveau 0000:04:00.0: allocated 1280x1024 fb: 0x48000, bo ffff88023e9=
47000
fb1: nouveaufb frame buffer device
[drm] Initialized nouveau 0.0.16 20090420 for 0000:04:00.0 on minor 1
vboxdrv: Trying to deactivate the NMI watchdog permanently...
vboxdrv: Successfully done.
vboxdrv: Found 2 processor cores.
VBoxDrv: dbg - g_abExecMemory=3Dffffffffa02661e0
vboxdrv: fAsync=3D0 offMin=3D0x183 offMax=3D0x708
vboxdrv: TSC mode is 'synchronous', kernel timer mode is 'normal'.
vboxdrv: Successfully loaded version 3.2.6 (interface 0x00140001).
EXT3-fs (sda3): using internal journal
sky2 0000:02:00.0: eth1: enabling interface
ADDRCONF(NETDEV_UP): eth1: link is not ready
Adding 31350840k swap on /dev/sda2.  Priority:-1 extents:1 across:31350840k=
=20
sky2 0000:02:00.0: eth1: Link is up at 1000 Mbps, full duplex, flow control=
 both
ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
eth1: no IPv6 routers present
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
ip_tables: (C) 2000-2006 Netfilter Core Team
nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=3D1 kernel parameter, acct=3D1 nf_conntrack module option=
 or
sysctl net.netfilter.nf_conntrack_acct=3D1 to enable it.
vgaarb: device changed decodes: PCI:0000:04:00.0,olddecodes=3Dio+mem,decode=
s=3Dnone:owns=3Dnone
vgaarb: device changed decodes: PCI:0000:01:00.0,olddecodes=3Dio+mem,decode=
s=3Dnone:owns=3Dio+mem
ata8.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
ata8.00: failed command: READ DMA
ata8.00: cmd c8/00:08:70:fe:ff/00:00:00:00:00/e0 tag 0 dma 4096 in
       res 40/00:f4:00:00:00/00:00:00:00:00/40 Emask 0x4 (timeout)
ata8.00: status: { DRDY }
[drm] nouveau 0000:04:00.0: Allocating FIFO number 1
[drm] nouveau 0000:04:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:04:00.0: 0xD0B6: Parsing digital output script table
[drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: Output DVI-I-2 is running on CRTC 0 using outpu=
t A
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
ata8: link is slow to respond, please be patient (ready=3D0)
ata8: device not ready (errno=3D-16), forcing hardreset
ata8: soft resetting link
ata8: link is slow to respond, please be patient (ready=3D0)
ata8: SRST failed (errno=3D-16)
ata8: soft resetting link
ata8: link is slow to respond, please be patient (ready=3D0)
ata8: SRST failed (errno=3D-16)
ata8: soft resetting link
ata8: link is slow to respond, please be patient (ready=3D0)
ata8: SRST failed (errno=3D-16)
ata8: soft resetting link
ata8: SRST failed (errno=3D-16)
ata8: reset failed, giving up
ata8.00: disabled
ata8.00: device reported invalid CHS sector 0
ata8: EH complete
sd 7:0:0:0: [sdb] Unhandled error code
sd 7:0:0:0: [sdb] Result: hostbyte=3DDID_BAD_TARGET driverbyte=3DDRIVER_OK
sd 7:0:0:0: [sdb] CDB: Read(10): 28 00 00 ff fe 70 00 00 08 00
end_request: I/O error, dev sdb, sector 16776816
Buffer I/O error on device sdb, logical block 16776816
Buffer I/O error on device sdb, logical block 16776817
Buffer I/O error on device sdb, logical block 16776818
Buffer I/O error on device sdb, logical block 16776819
Buffer I/O error on device sdb, logical block 16776820
Buffer I/O error on device sdb, logical block 16776821
Buffer I/O error on device sdb, logical block 16776822
Buffer I/O error on device sdb, logical block 16776823
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:04:00.0: Allocating FIFO number 1
[drm] nouveau 0000:04:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: 0xD0B6: Parsing digital output script table
[drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: Output DVI-I-2 is running on CRTC 0 using outpu=
t A
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
ata1.00: configured for UDMA/133
ata1: EH complete
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
ata1.00: configured for UDMA/133
ata1: EH complete
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:04:00.0: Allocating FIFO number 1
[drm] nouveau 0000:04:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: 0xD0B6: Parsing digital output script table
[drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: Output DVI-I-2 is running on CRTC 0 using outpu=
t A
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)
X:6970 freeing invalid memtype d0548000-d054c000
X:6970 freeing invalid memtype d0548000-d054c000
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
ata1.00: configured for UDMA/133
ata1: EH complete
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: Allocating FIFO number 1
[drm] nouveau 0000:04:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: 0xD0B6: Parsing digital output script table
[drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:04:00.0: Output DVI-I-2 is running on CRTC 0 using outpu=
t A
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using outpu=
t A
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
ata1.00: configured for UDMA/133
ata1: EH complete

--Boundary-01=_F3tVMHPJBDHGUAK
Content-Type: text/plain;
  charset="UTF-8";
  name="DPMS crash Xorg.0"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="DPMS crash Xorg.0"

Aug  2 13:05:01 station This: is a pre-release version of the X server from=
 The X.Org Foundation.
Aug  2 13:05:01 station It: is not supported in any way.
Aug  2 13:05:01 station Bugs: may be filed in the bugzilla at http://bugs.f=
reedesktop.org/.
Aug  2 13:05:01 station Select: the "xorg" product for bugs you find in thi=
s release.
Aug  2 13:05:01 station Before: reporting bugs in pre-release versions plea=
se check the
Aug  2 13:05:01 station latest: version in the X.Org Foundation git reposit=
ory.
Aug  2 13:05:01 station See: http://wiki.x.org/wiki/GitPage for git access =
instructions.
Aug  2 13:05:01 station 19180.803]=20
Aug  2 13:05:01 station X.Org: X Server 1.8.99.905 (1.9.0 RC 5)
Aug  2 13:05:01 station Release: Date: 2010-07-14
Aug  2 13:05:01 station 19180.803] X Protocol Version 11, Revision 0
Aug  2 13:05:01 station 19180.803] Build Operating System: Linux 2.6.35-rc3=
=2D2010-08-01 x86_64 Gentoo
Aug  2 13:05:01 station 19180.803] Current Operating System: Linux station =
2.6.35-rc3-2010-08-01 #1 SMP Sun Aug 1 14:34:35 GMT 2010 x86_64
Aug  2 13:05:01 station 19180.803] Kernel command line: root=3D/dev/sda3 xd=
river=3Dnouveau
Aug  2 13:05:01 station 19180.803] Build Date: 01 August 2010  08:37:26PM
Aug  2 13:05:01 station 19180.803] =20
Aug  2 13:05:01 station 19180.803] Current version of pixman: 0.18.2
Aug  2 13:05:01 station 19180.803]      Before reporting problems, check ht=
tp://wiki.x.org
Aug  2 13:05:01 station         to: make sure that you have the latest vers=
ion.
Aug  2 13:05:01 station 19180.803] Markers: (--) probed, (**) from config f=
ile, (=3D=3D) default setting,
Aug  2 13:05:01 station         (++): from command line, (!!) notice, (II) =
informational,
Aug  2 13:05:01 station         (WW): warning, (EE) error, (NI) not impleme=
nted, (??) unknown.
Aug  2 13:05:01 station 19180.803] (=3D=3D) Log file: "/var/log/Xorg.0.log"=
, Time: Mon Aug  2 13:05:01 2010
Aug  2 13:05:01 station 19180.803] (=3D=3D) Using config file: "/etc/X11/xo=
rg.conf"
Aug  2 13:05:01 station 19180.803] (=3D=3D) Using system config directory "=
/usr/share/X11/xorg.conf.d"
Aug  2 13:05:01 station 19180.803] (++) ServerLayout "Seat.A"
Aug  2 13:05:01 station 19180.803] (**) |-->Screen "Screen.A" (0)
Aug  2 13:05:01 station 19180.803] (**) |   |-->Monitor "Monitor.A1"
Aug  2 13:05:01 station 19180.803] (**) |   |-->Device "VideoCard.A"
Aug  2 13:05:01 station 19180.803] (**) |-->Input Device "Keyboard.A"
Aug  2 13:05:01 station 19180.803] (**) |-->Input Device "Mouse.A"
Aug  2 13:05:01 station 19180.803] (**) Option "DontZap" "true"
Aug  2 13:05:01 station 19180.803] (**) Option "AllowMouseOpenFail" "true"
Aug  2 13:05:01 station 19180.803] (**) Option "BlankTime" "0"
Aug  2 13:05:01 station 19180.803] (**) Option "StandbyTime" "0"
Aug  2 13:05:01 station 19180.803] (**) Option "SuspendTime" "0"
Aug  2 13:05:01 station 19180.803] (**) Option "OffTime" "0"
Aug  2 13:05:01 station 19180.803] (**) Option "AIGLX" "off"
Aug  2 13:05:01 station 19180.803] (**) Option "AutoAddDevices" "off"
Aug  2 13:05:01 station 19180.803] (**) Not automatically adding devices
Aug  2 13:05:01 station 19180.803] (=3D=3D) Automatically enabling devices
Aug  2 13:05:01 station 19180.803] (**) FontPath set to:
Aug  2 13:05:01 station         /usr/share/fonts/jisx0213,:=20
Aug  2 13:05:01 station         /usr/share/fonts/monafont,:=20
Aug  2 13:05:01 station         /usr/share/fonts/misc/,:=20
Aug  2 13:05:01 station         /usr/share/fonts/TTF/,:=20
Aug  2 13:05:01 station         /usr/share/fonts/OTF/,:=20
Aug  2 13:05:01 station         /usr/share/fonts/Type1/,:=20
Aug  2 13:05:01 station         /usr/share/fonts/100dpi/,:=20
Aug  2 13:05:01 station         /usr/share/fonts/75dpi/:=20
Aug  2 13:05:01 station 19180.803] (=3D=3D) ModulePath set to "/usr/lib64/x=
org/modules"
Aug  2 13:05:01 station 19180.803] (II) Loader magic: 0x7b4e40
Aug  2 13:05:01 station 19180.803] (II) Module ABI versions:
Aug  2 13:05:01 station 19180.803]      X.Org ANSI C Emulation: 0.4
Aug  2 13:05:01 station 19180.803]      X.Org Video Driver: 8.0
Aug  2 13:05:01 station 19180.803]      X.Org XInput driver : 11.0
Aug  2 13:05:01 station 19180.803]      X.Org Server Extension : 4.0
Aug  2 13:05:01 station 19180.804] (--) PCI:*(0:1:0:0) 10de:01df:1462:0345 =
rev 161, Mem @ 0xfa000000/16777216, 0xc0000000/268435456, 0xf9000000/167772=
16, BIOS @ 0x????????/131072
Aug  2 13:05:01 station 19180.804] (--) PCI: (0:4:0:0) 10de:0163:1043:826d =
rev 161, Mem @ 0xfd000000/16777216, 0xd0000000/268435456, 0xfc000000/167772=
16, BIOS @ 0x????????/131072
Aug  2 13:05:01 station 19180.805] (II) Open ACPI successful (/var/run/acpi=
d.socket)
Aug  2 13:05:01 station 19180.805] (II) LoadModule: "extmod"
Aug  2 13:05:01 station 19180.805] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libextmod.so
Aug  2 13:05:01 station 19180.806] (II) Module extmod: vendor=3D"X.Org Foun=
dation"
Aug  2 13:05:01 station 19180.806]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19180.806]      Module class: X.Org Server Extension
Aug  2 13:05:01 station 19180.806]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19180.806] (II) Loading extension MIT-SCREEN-SAVER
Aug  2 13:05:01 station 19180.806] (II) Loading extension XFree86-VidModeEx=
tension
Aug  2 13:05:01 station 19180.806] (II) Loading extension XFree86-DGA
Aug  2 13:05:01 station 19180.806] (II) Loading extension DPMS
Aug  2 13:05:01 station 19180.806] (II) Loading extension XVideo
Aug  2 13:05:01 station 19180.806] (II) Loading extension XVideo-MotionComp=
ensation
Aug  2 13:05:01 station 19180.806] (II) Loading extension X-Resource
Aug  2 13:05:01 station 19180.806] (II) LoadModule: "dbe"
Aug  2 13:05:01 station 19180.806] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libdbe.so
Aug  2 13:05:01 station 19180.806] (II) Module dbe: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:01 station 19180.806]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19180.806]      Module class: X.Org Server Extension
Aug  2 13:05:01 station 19180.806]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19180.806] (II) Loading extension DOUBLE-BUFFER
Aug  2 13:05:01 station 19180.806] (II) LoadModule: "glx"
Aug  2 13:05:01 station 19180.806] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libglx.so
Aug  2 13:05:01 station 19180.806] (II) Module glx: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:01 station 19180.806]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19180.806]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19180.806] (**) AIGLX disabled
Aug  2 13:05:01 station 19180.806] (II) Loading extension GLX
Aug  2 13:05:01 station 19180.806] (II) LoadModule: "record"
Aug  2 13:05:01 station 19180.812] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/librecord.so
Aug  2 13:05:01 station 19180.812] (II) Module record: vendor=3D"X.Org Foun=
dation"
Aug  2 13:05:01 station 19180.812]      compiled for 1.8.99.905, module ver=
sion =3D 1.13.0
Aug  2 13:05:01 station 19180.812]      Module class: X.Org Server Extension
Aug  2 13:05:01 station 19180.812]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19180.812] (II) Loading extension RECORD
Aug  2 13:05:01 station 19180.812] (II) LoadModule: "dri"
Aug  2 13:05:01 station 19180.812] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libdri.so
Aug  2 13:05:01 station 19180.812] (II) Module dri: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:01 station 19180.812]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19180.812]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19180.812] (II) Loading extension XFree86-DRI
Aug  2 13:05:01 station 19180.812] (II) LoadModule: "dri2"
Aug  2 13:05:01 station 19180.812] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libdri2.so
Aug  2 13:05:01 station 19180.812] (II) Module dri2: vendor=3D"X.Org Founda=
tion"
Aug  2 13:05:01 station 19180.812]      compiled for 1.8.99.905, module ver=
sion =3D 1.2.0
Aug  2 13:05:01 station 19180.812]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19180.812] (II) Loading extension DRI2
Aug  2 13:05:01 station 19180.812] (II) LoadModule: "nouveau"
Aug  2 13:05:01 station 19180.813] (II) Loading /usr/lib64/xorg/modules/dri=
vers/nouveau_drv.so
Aug  2 13:05:01 station 19180.813] (II) Module nouveau: vendor=3D"X.Org Fou=
ndation"
Aug  2 13:05:01 station 19180.813]      compiled for 1.8.99.905, module ver=
sion =3D 0.0.16
Aug  2 13:05:01 station 19180.813]      Module class: X.Org Video Driver
Aug  2 13:05:01 station 19180.813]      ABI class: X.Org Video Driver, vers=
ion 8.0
Aug  2 13:05:01 station 19180.813] (II) LoadModule: "evdev"
Aug  2 13:05:01 station 19180.813] (II) Loading /usr/lib64/xorg/modules/inp=
ut/evdev_drv.so
Aug  2 13:05:01 station 19180.813] (II) Module evdev: vendor=3D"X.Org Found=
ation"
Aug  2 13:05:01 station 19180.813]      compiled for 1.8.99.905, module ver=
sion =3D 2.4.0
Aug  2 13:05:01 station 19180.813]      Module class: X.Org XInput Driver
Aug  2 13:05:01 station 19180.813]      ABI class: X.Org XInput driver, ver=
sion 11.0
Aug  2 13:05:01 station 19180.813] (II) NOUVEAU driver=20
Aug  2 13:05:01 station 19180.813] (II) NOUVEAU driver for NVIDIA chipset f=
amilies :
Aug  2 13:05:01 station 19180.813]      RIVA TNT    (NV04)
Aug  2 13:05:01 station 19180.813]      RIVA TNT2   (NV05)
Aug  2 13:05:01 station 19180.813]      GeForce 256 (NV10)
Aug  2 13:05:01 station 19180.813]      GeForce 2   (NV11, NV15)
Aug  2 13:05:01 station 19180.813]      GeForce 4MX (NV17, NV18)
Aug  2 13:05:01 station 19180.813]      GeForce 3   (NV20)
Aug  2 13:05:01 station 19180.813]      GeForce 4Ti (NV25, NV28)
Aug  2 13:05:01 station 19180.813]      GeForce FX  (NV3x)
Aug  2 13:05:01 station 19180.813]      GeForce 6   (NV4x)
Aug  2 13:05:01 station 19180.813]      GeForce 7   (G7x)
Aug  2 13:05:01 station 19180.813]      GeForce 8   (G8x)
Aug  2 13:05:01 station 19180.813] (++) using VT number 8
Aug  2 13:05:01 station 19180.814] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: open result is 8, (OK)
Aug  2 13:05:01 station 19180.814] drmOpenByBusid: Searching for BusID pci:=
0000:01:00.0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: open result is 8, (OK)
Aug  2 13:05:01 station 19180.814] drmOpenByBusid: drmOpenMinor returns 8
Aug  2 13:05:01 station 19180.814] drmOpenByBusid: drmGetBusid reports pci:=
0000:01:00.0
Aug  2 13:05:01 station 19180.814] (II) [drm] nouveau interface version: 0.=
0.16
Aug  2 13:05:01 station 19180.814] (II) Loading sub module "dri"
Aug  2 13:05:01 station 19180.814] (II) LoadModule: "dri"
Aug  2 13:05:01 station 19180.814] (II) Reloading /usr/lib64/xorg/modules/e=
xtensions/libdri.so
Aug  2 13:05:01 station 19180.814] (II) NOUVEAU(0): Loaded DRI module
Aug  2 13:05:01 station 19180.814] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19180.814] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19180.814] drmOpenByBusid: Searching for BusID pci:=
0000:01:00.0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19180.814] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19180.814] drmOpenByBusid: drmOpenMinor returns 9
Aug  2 13:05:01 station 19180.814] drmOpenByBusid: drmGetBusid reports pci:=
0000:01:00.0
Aug  2 13:05:01 station 19180.814] (II) [drm] DRM interface version 1.3
Aug  2 13:05:01 station 19180.814] (II) [drm] DRM open master succeeded.
Aug  2 13:05:01 station 19180.814] (--) NOUVEAU(0): Chipset: "NVIDIA NV46"
Aug  2 13:05:01 station 19180.814] (**) NOUVEAU(0): Depth 24, (--) framebuf=
fer bpp 32
Aug  2 13:05:01 station 19180.814] (=3D=3D) NOUVEAU(0): RGB weight 888
Aug  2 13:05:01 station 19180.815] (=3D=3D) NOUVEAU(0): Default visual is T=
rueColor
Aug  2 13:05:01 station 19180.815] (=3D=3D) NOUVEAU(0): Using HW cursor
Aug  2 13:05:01 station 19180.921] (II) NOUVEAU(0): Output VGA-1 using moni=
tor section Monitor.A1
Aug  2 13:05:01 station 19180.992] (II) NOUVEAU(0): Output DVI-I-1 has no m=
onitor section
Aug  2 13:05:01 station 19181.048] (II) NOUVEAU(0): Output TV-1 has no moni=
tor section
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): EDID for output VGA-1
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Manufacturer: VSC  Mode=
l: a720  Serial#: 16843009
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Year: 2008  Week: 3
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): EDID Version: 1.3
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Analog Display Input,  =
Input Voltage Level: 0.700/0.300 V
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Sync:  Separate  Compos=
ite  SyncOnGreen
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Max Image Size [cm]: ho=
riz.: 38  vert.: 30
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Gamma: 2.20
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): DPMS capabilities: Off;=
 RGB/Color Display
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Default color space is =
primary color space
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): First detailed timing i=
s preferred mode
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): redX: 0.665 redY: 0.320=
   greenX: 0.225 greenY: 0.680
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): blueX: 0.145 blueY: 0.0=
80   whiteX: 0.315 whiteY: 0.321
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Supported established t=
imings:
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 720x400@70Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 640x480@60Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 640x480@67Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 640x480@72Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 640x480@75Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 800x600@56Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 800x600@60Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 800x600@72Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 800x600@75Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 832x624@75Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 1024x768@60Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 1024x768@70Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 1024x768@75Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 1280x1024@75Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): 1152x864@75Hz
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Manufacturer's mask: 0
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Supported standard timi=
ngs:
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): #0: hsize: 1280  vsize =
1024  refresh: 60  vid: 32897
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): #1: hsize: 1280  vsize =
960  refresh: 60  vid: 16513
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): #2: hsize: 1152  vsize =
864  refresh: 75  vid: 20337
Aug  2 13:05:01 station 19181.154] (II) NOUVEAU(0): Supported detailed timi=
ng:
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): clock: 108.0 MHz   Imag=
e Size:  376 x 301 mm
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): h_active: 1280  h_sync:=
 1328  h_sync_end 1440 h_blank_end 1688 h_border: 0
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): v_active: 1024  v_sync:=
 1025  v_sync_end 1028 v_blanking: 1066 v_border: 0
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Serial No: QT3080300798
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Ranges: V min: 50 V max=
: 85 Hz, H min: 24 H max: 82 kHz, PixClock max 140 MHz
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Monitor name: VP950b
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): EDID (in hex):
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     00ffffffffffff005a6=
320a701010101
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     031201030e261e782e4=
82daa5239ae25
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     145052bfef808180814=
0714f01010101
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     010101010101302a009=
851002a403070
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     1300782d1100001e000=
000ff00515433
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     3038303330303739380=
a000000fd0032
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     5518520e000a2020202=
02020000000fc
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0):     005650393530620a202=
0202020200066
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): EDID vendor "VSC", prod=
 id 42784
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Using hsync ranges from=
 config file
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Using vrefresh ranges f=
rom config file
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Printing DDC gathered M=
odelines:
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "720x400"x0.0 =
  28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "832x624"x0.0 =
  57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1152x864"x0.0=
  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1280x960"x0.0=
  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "1280x10=
24" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "1152x86=
4" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "1024x76=
8" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "1024x76=
8" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "832x624=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "800x600=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "800x600=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "800x600=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "640x480=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "640x480=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "640x480=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Not using mode "720x400=
" (vrefresh out of range)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Printing probed modes f=
or output VGA-1
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1280x1024"x60=
=2E0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 =
kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1280x960"x60.=
0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "1024x768"x60.=
0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "800x600"x60.3=
   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:02 station 19181.154] (II) NOUVEAU(0): Modeline "640x480"x60.0=
   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:02 station 19181.220] (II) NOUVEAU(0): EDID for output DVI-I-1
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): EDID for output TV-1
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Output VGA-1 connected
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Output DVI-I-1 disconne=
cted
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Output TV-1 disconnected
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Using user preference f=
or initial modes
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Output VGA-1 using init=
ial mode 1280x1024
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Using default gamma of =
(1.0, 1.0, 1.0) unless otherwise stated.
Aug  2 13:05:02 station 19181.276] (--) NOUVEAU(0): Virtual size is 1280x10=
24 (pitch 1280)
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0):  Driver mode "1280x1024=
": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Modeline "1280x1024"x60=
=2E0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 =
kHz)
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0):  Driver mode "1280x960"=
: 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Modeline "1280x960"x60.=
0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0):  Driver mode "1024x768"=
: 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Modeline "1024x768"x60.=
0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0):  Driver mode "800x600":=
 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Modeline "800x600"x60.3=
   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0):  Driver mode "640x480":=
 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
Aug  2 13:05:02 station 19181.276] (II) NOUVEAU(0): Modeline "640x480"x60.0=
   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0): Display dimensions: (38=
0, 300) mm
Aug  2 13:05:02 station 19181.276] (**) NOUVEAU(0): DPI set to (85, 86)
Aug  2 13:05:02 station 19181.276] (II) Loading sub module "fb"
Aug  2 13:05:02 station 19181.276] (II) LoadModule: "fb"
Aug  2 13:05:02 station 19181.276] (II) Loading /usr/lib64/xorg/modules/lib=
fb.so
Aug  2 13:05:02 station 19181.276] (II) Module fb: vendor=3D"X.Org Foundati=
on"
Aug  2 13:05:02 station 19181.276]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:02 station 19181.276]      ABI class: X.Org ANSI C Emulation, =
version 0.4
Aug  2 13:05:02 station 19181.276] (II) Loading sub module "exa"
Aug  2 13:05:02 station 19181.276] (II) LoadModule: "exa"
Aug  2 13:05:02 station 19181.276] (II) Loading /usr/lib64/xorg/modules/lib=
exa.so
Aug  2 13:05:02 station 19181.276] (II) Module exa: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:02 station 19181.276]      compiled for 1.8.99.905, module ver=
sion =3D 2.5.0
Aug  2 13:05:02 station 19181.276]      ABI class: X.Org Video Driver, vers=
ion 8.0
Aug  2 13:05:02 station 19181.276] (II) Loading sub module "shadowfb"
Aug  2 13:05:02 station 19181.276] (II) LoadModule: "shadowfb"
Aug  2 13:05:02 station 19181.276] (II) Loading /usr/lib64/xorg/modules/lib=
shadowfb.so
Aug  2 13:05:03 station 19181.276] (II) Module shadowfb: vendor=3D"X.Org Fo=
undation"
Aug  2 13:05:03 station 19181.276]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:03 station 19181.276]      ABI class: X.Org ANSI C Emulation, =
version 0.4
Aug  2 13:05:03 station 19181.276] (--) Depth 24 pixmap format is 32 bpp
Aug  2 13:05:03 station 19181.277] (II) NOUVEAU(0): Opened GPU channel 1
Aug  2 13:05:03 station 19181.277] (II) NOUVEAU(0): [DRI2] Setup complete
Aug  2 13:05:03 station 19181.277] (II) NOUVEAU(0): [DRI2]   DRI driver: no=
uveau
Aug  2 13:05:03 station 19181.277] (II) NOUVEAU(0): GART: 64MiB available
Aug  2 13:05:03 station 19181.278] (II) NOUVEAU(0): GART: Allocated 16MiB a=
s a scratch buffer
Aug  2 13:05:03 station 19181.278] (II) EXA(0): Driver allocated offscreen =
pixmaps
Aug  2 13:05:03 station 19181.279] (II) EXA(0): Driver registered support f=
or the following operations:
Aug  2 13:05:03 station 19181.279] (II)         Solid
Aug  2 13:05:03 station 19181.279] (II)         Copy
Aug  2 13:05:03 station 19181.279] (II)         Composite (RENDER accelerat=
ion)
Aug  2 13:05:03 station 19181.279] (II)         UploadToScreen
Aug  2 13:05:03 station 19181.279] (II)         DownloadFromScreen
Aug  2 13:05:03 station 19181.279] (=3D=3D) NOUVEAU(0): Backing store disab=
led
Aug  2 13:05:03 station 19181.279] (=3D=3D) NOUVEAU(0): Silken mouse enabled
Aug  2 13:05:03 station 19181.279] (II) NOUVEAU(0): [XvMC] Associated with =
NV40 texture adapter.
Aug  2 13:05:03 station 19181.279] (II) NOUVEAU(0): [XvMC] Extension initia=
lized.
Aug  2 13:05:03 station 19181.279] (II) NOUVEAU(0): RandR 1.2 enabled, igno=
re the following RandR disabled message.
Aug  2 13:05:03 station 19181.279] (--) RandR disabled
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension Gen=
eric Event Extension
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension SHA=
PE
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension MIT=
=2DSHM
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension XIn=
putExtension
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension XTE=
ST
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension BIG=
=2DREQUESTS
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension SYNC
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension XKE=
YBOARD
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension XC-=
MISC
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension XIN=
ERAMA
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension XFI=
XES
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension REN=
DER
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension RAN=
DR
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension COM=
POSITE
Aug  2 13:05:03 station 19181.279] (II) Initializing built-in extension DAM=
AGE
Aug  2 13:05:03 station 19181.286] (II) AIGLX: Loaded and initialized /usr/=
lib64/dri/swrast_dri.so
Aug  2 13:05:03 station 19181.286] (II) GLX: Initialized DRISWRAST GL provi=
der for screen 0
Aug  2 13:05:03 station 19181.294] (II) NOUVEAU(0): NVEnterVT is called.
Aug  2 13:05:03 station 19181.295] (II) NOUVEAU(0): Setting screen physical=
 size to 338 x 270
Aug  2 13:05:03 station 19181.295] resize called 1280 1024
Aug  2 13:05:03 station 19181.380] (**) Option "CoreKeyboard"
Aug  2 13:05:03 station 19181.380] (**) Keyboard.A: always reports core eve=
nts
Aug  2 13:05:03 station 19181.381] (**) Keyboard.A: Device: "/dev/input/by-=
path/pci-0000:00:1d.2-usb-0:1:1.0-event-kbd"
Aug  2 13:05:03 station 19181.448] (II) Keyboard.A: Found keys
Aug  2 13:05:03 station 19181.448] (II) Keyboard.A: Configuring as keyboard
Aug  2 13:05:03 station 19181.448] (II) XINPUT: Adding extended input devic=
e "Keyboard.A" (type: KEYBOARD)
Aug  2 13:05:03 station 19181.448] (**) Option "xkb_rules" "evdev"
Aug  2 13:05:03 station 19181.448] (**) Option "xkb_model" "evdev"
Aug  2 13:05:03 station 19181.448] (**) Option "xkb_layout" "us"
Aug  2 13:05:03 station 19181.524] (**) Option "CorePointer"
Aug  2 13:05:03 station 19181.524] (**) Mouse.A: always reports core events
Aug  2 13:05:03 station 19181.524] (**) Mouse.A: Device: "/dev/input/event6"
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: Found 12 mouse buttons
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: Found scroll wheel(s)
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: Found relative axes
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: Found x and y relative axes
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: Configuring as mouse
Aug  2 13:05:03 station 19181.608] (**) Option "Emulate3Buttons" "no"
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: Forcing middle mouse butto=
n emulation off.
Aug  2 13:05:03 station 19181.608] (**) Option "YAxisMapping" "4 5"
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: YAxisMapping: buttons 4 an=
d 5
Aug  2 13:05:03 station 19181.608] (**) Option "XAxisMapping" "7 6"
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: XAxisMapping: buttons 7 an=
d 6
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: EmulateWheelButton: 4, Emu=
lateWheelInertia: 10, EmulateWheelTimeout: 200
Aug  2 13:05:03 station 19181.608] (II) XINPUT: Adding extended input devic=
e "Mouse.A" (type: MOUSE)
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: (accel) keeping accelerati=
on scheme 1
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: (accel) acceleration profi=
le 0
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: (accel) acceleration facto=
r: 2.000
Aug  2 13:05:03 station 19181.608] (**) Mouse.A: (accel) acceleration thres=
hold: 4
Aug  2 13:05:03 station 19181.608] (II) Mouse.A: initialized for relative a=
xes.
Aug  2 13:05:03 station 19181.651] (II) config/udev: Adding input device Po=
wer Button (/dev/input/event1)
Aug  2 13:05:03 station 19181.651] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.652] (II) config/udev: Adding input device Po=
wer Button (/dev/input/event0)
Aug  2 13:05:03 station 19181.652] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.656] (II) config/udev: Adding input device Lo=
gitech USB Optical Mouse (/dev/input/event4)
Aug  2 13:05:03 station 19181.656] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.656] (II) config/udev: Adding input device Lo=
gitech USB Optical Mouse (/dev/input/mouse0)
Aug  2 13:05:03 station 19181.656] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.656] (II) config/udev: Adding input device Lo=
gitech Logitech USB Keyboard (/dev/input/event5)
Aug  2 13:05:03 station 19181.656] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.657] (II) config/udev: Adding input device Lo=
gitech USB-PS/2 Optical Mouse (/dev/input/event6)
Aug  2 13:05:03 station 19181.657] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.657] (II) config/udev: Adding input device Lo=
gitech USB-PS/2 Optical Mouse (/dev/input/mouse1)
Aug  2 13:05:03 station 19181.657] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.658] (II) config/udev: Adding input device AT=
 Translated Set 2 keyboard (/dev/input/event3)
Aug  2 13:05:03 station 19181.658] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:03 station 19181.658] (II) config/udev: Adding input device PC=
 Speaker (/dev/input/event2)
Aug  2 13:05:03 station 19181.658] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): EDID vendor "VSC", prod=
 id 42784
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Using hsync ranges from=
 config file
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Using vrefresh ranges f=
rom config file
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Printing DDC gathered M=
odelines:
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
Aug  2 13:05:18 station 19197.893] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "720x400"x0.0 =
  28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "832x624"x0.0 =
  57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "1152x864"x0.0=
  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:05:19 station 19197.893] (II) NOUVEAU(0): Modeline "1280x960"x0.0=
  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): EDID vendor "VSC", prod=
 id 42784
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Using hsync ranges from=
 config file
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Using vrefresh ranges f=
rom config file
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Printing DDC gathered M=
odelines:
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
Aug  2 13:05:29 station 19209.156] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "720x400"x0.0 =
  28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "832x624"x0.0 =
  57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "1152x864"x0.0=
  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:05:30 station 19209.156] (II) NOUVEAU(0): Modeline "1280x960"x0.0=
  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:17:11 station 19910.552] (II) Keyboard.A: Close
Aug  2 13:17:11 station 19910.552] (II) UnloadModule: "evdev"
Aug  2 13:17:11 station 19910.596] (II) Mouse.A: Close
Aug  2 13:17:11 station 19910.596] (II) UnloadModule: "evdev"
Aug  2 13:17:11 station 19910.596] (II) NOUVEAU(0): NVLeaveVT is called.
Aug  2 13:17:11 station 19910.596] (II) NOUVEAU(0): Closed GPU channel 1

--Boundary-01=_F3tVMHPJBDHGUAK
Content-Type: text/plain;
  charset="UTF-8";
  name="DPMS crash Xorg.1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="DPMS crash Xorg.1"

Aug  2 13:05:00 station Select: the "xorg" product for bugs you find in thi=
s release.
Aug  2 13:05:00 station Before: reporting bugs in pre-release versions plea=
se check the
Aug  2 13:05:00 station latest: version in the X.Org Foundation git reposit=
ory.
Aug  2 13:05:00 station See: http://wiki.x.org/wiki/GitPage for git access =
instructions.
Aug  2 13:05:00 station 19179.947]=20
Aug  2 13:05:00 station X.Org: X Server 1.8.99.905 (1.9.0 RC 5)
Aug  2 13:05:00 station Release: Date: 2010-07-14
Aug  2 13:05:00 station 19179.947] X Protocol Version 11, Revision 0
Aug  2 13:05:00 station 19179.947] Build Operating System: Linux 2.6.35-rc3=
=2D2010-08-01 x86_64 Gentoo
Aug  2 13:05:00 station 19179.947] Current Operating System: Linux station =
2.6.35-rc3-2010-08-01 #1 SMP Sun Aug 1 14:34:35 GMT 2010 x86_64
Aug  2 13:05:00 station 19179.947] Kernel command line: root=3D/dev/sda3 xd=
river=3Dnouveau
Aug  2 13:05:00 station 19179.947] Build Date: 01 August 2010  08:37:26PM
Aug  2 13:05:00 station 19179.947] =20
Aug  2 13:05:00 station 19179.947] Current version of pixman: 0.18.2
Aug  2 13:05:00 station 19179.947]      Before reporting problems, check ht=
tp://wiki.x.org
Aug  2 13:05:00 station         to: make sure that you have the latest vers=
ion.
Aug  2 13:05:00 station 19179.947] Markers: (--) probed, (**) from config f=
ile, (=3D=3D) default setting,
Aug  2 13:05:00 station         (++): from command line, (!!) notice, (II) =
informational,
Aug  2 13:05:00 station         (WW): warning, (EE) error, (NI) not impleme=
nted, (??) unknown.
Aug  2 13:05:00 station 19179.947] (=3D=3D) Log file: "/var/log/Xorg.1.log"=
, Time: Mon Aug  2 13:05:00 2010
Aug  2 13:05:00 station 19179.948] (=3D=3D) Using config file: "/etc/X11/xo=
rg.conf"
Aug  2 13:05:00 station 19179.948] (=3D=3D) Using system config directory "=
/usr/share/X11/xorg.conf.d"
Aug  2 13:05:00 station 19179.948] (++) ServerLayout "Seat.B"
Aug  2 13:05:00 station 19179.948] (**) |-->Screen "Screen.B" (1)
Aug  2 13:05:00 station 19179.948] (**) |   |-->Monitor "Monitor.B"
Aug  2 13:05:00 station 19179.948] (**) |   |-->Device "VideoCard.B"
Aug  2 13:05:00 station 19179.948] (**) |-->Input Device "Keyboard.B"
Aug  2 13:05:00 station 19179.948] (**) |-->Input Device "Mouse.B"
Aug  2 13:05:00 station 19179.948] (**) Option "DontZap" "true"
Aug  2 13:05:00 station 19179.948] (**) Option "AllowMouseOpenFail" "true"
Aug  2 13:05:00 station 19179.948] (**) Option "BlankTime" "0"
Aug  2 13:05:00 station 19179.948] (**) Option "StandbyTime" "0"
Aug  2 13:05:00 station 19179.948] (**) Option "SuspendTime" "0"
Aug  2 13:05:00 station 19179.948] (**) Option "OffTime" "0"
Aug  2 13:05:00 station 19179.948] (**) Option "AIGLX" "off"
Aug  2 13:05:00 station 19179.948] (**) Option "AutoAddDevices" "off"
Aug  2 13:05:00 station 19179.948] (**) Not automatically adding devices
Aug  2 13:05:00 station 19179.948] (=3D=3D) Automatically enabling devices
Aug  2 13:05:00 station 19179.948] (**) FontPath set to:
Aug  2 13:05:00 station         /usr/share/fonts/jisx0213,:=20
Aug  2 13:05:00 station         /usr/share/fonts/monafont,:=20
Aug  2 13:05:00 station         /usr/share/fonts/misc/,:=20
Aug  2 13:05:00 station         /usr/share/fonts/TTF/,:=20
Aug  2 13:05:00 station         /usr/share/fonts/OTF/,:=20
Aug  2 13:05:00 station         /usr/share/fonts/Type1/,:=20
Aug  2 13:05:00 station         /usr/share/fonts/100dpi/,:=20
Aug  2 13:05:00 station         /usr/share/fonts/75dpi/:=20
Aug  2 13:05:00 station 19179.948] (=3D=3D) ModulePath set to "/usr/lib64/x=
org/modules"
Aug  2 13:05:00 station 19179.948] (II) Loader magic: 0x7b4e40
Aug  2 13:05:00 station 19179.948] (II) Module ABI versions:
Aug  2 13:05:00 station 19179.948]      X.Org ANSI C Emulation: 0.4
Aug  2 13:05:00 station 19179.948]      X.Org Video Driver: 8.0
Aug  2 13:05:00 station 19179.948]      X.Org XInput driver : 11.0
Aug  2 13:05:00 station 19179.948]      X.Org Server Extension : 4.0
Aug  2 13:05:00 station 19179.949] (--) PCI:*(0:1:0:0) 10de:01df:1462:0345 =
rev 161, Mem @ 0xfa000000/16777216, 0xc0000000/268435456, 0xf9000000/167772=
16, BIOS @ 0x????????/131072
Aug  2 13:05:00 station 19179.949] (--) PCI: (0:4:0:0) 10de:0163:1043:826d =
rev 161, Mem @ 0xfd000000/16777216, 0xd0000000/268435456, 0xfc000000/167772=
16, BIOS @ 0x????????/131072
Aug  2 13:05:00 station 19179.949] (II) Open ACPI successful (/var/run/acpi=
d.socket)
Aug  2 13:05:00 station 19179.949] (II) LoadModule: "extmod"
Aug  2 13:05:00 station 19179.949] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libextmod.so
Aug  2 13:05:00 station 19179.949] (II) Module extmod: vendor=3D"X.Org Foun=
dation"
Aug  2 13:05:00 station 19179.949]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:00 station 19179.949]      Module class: X.Org Server Extension
Aug  2 13:05:00 station 19179.949]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:00 station 19179.949] (II) Loading extension MIT-SCREEN-SAVER
Aug  2 13:05:00 station 19179.949] (II) Loading extension XFree86-VidModeEx=
tension
Aug  2 13:05:00 station 19179.949] (II) Loading extension XFree86-DGA
Aug  2 13:05:00 station 19179.949] (II) Loading extension DPMS
Aug  2 13:05:00 station 19179.949] (II) Loading extension XVideo
Aug  2 13:05:00 station 19179.949] (II) Loading extension XVideo-MotionComp=
ensation
Aug  2 13:05:00 station 19179.949] (II) Loading extension X-Resource
Aug  2 13:05:00 station 19179.950] (II) LoadModule: "dbe"
Aug  2 13:05:00 station 19179.950] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libdbe.so
Aug  2 13:05:00 station 19179.950] (II) Module dbe: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:00 station 19179.950]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:00 station 19179.950]      Module class: X.Org Server Extension
Aug  2 13:05:00 station 19179.950]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:00 station 19179.950] (II) Loading extension DOUBLE-BUFFER
Aug  2 13:05:00 station 19179.950] (II) LoadModule: "glx"
Aug  2 13:05:00 station 19179.950] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libglx.so
Aug  2 13:05:00 station 19179.950] (II) Module glx: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:00 station 19179.950]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:00 station 19179.950]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:00 station 19179.950] (**) AIGLX disabled
Aug  2 13:05:00 station 19179.950] (II) Loading extension GLX
Aug  2 13:05:00 station 19179.950] (II) LoadModule: "record"
Aug  2 13:05:00 station 19179.950] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/librecord.so
Aug  2 13:05:00 station 19179.950] (II) Module record: vendor=3D"X.Org Foun=
dation"
Aug  2 13:05:00 station 19179.950]      compiled for 1.8.99.905, module ver=
sion =3D 1.13.0
Aug  2 13:05:00 station 19179.950]      Module class: X.Org Server Extension
Aug  2 13:05:00 station 19179.950]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:00 station 19179.950] (II) Loading extension RECORD
Aug  2 13:05:00 station 19179.950] (II) LoadModule: "dri"
Aug  2 13:05:00 station 19179.950] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libdri.so
Aug  2 13:05:01 station 19179.950] (II) Module dri: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:01 station 19179.950]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19179.950]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19179.950] (II) Loading extension XFree86-DRI
Aug  2 13:05:01 station 19179.950] (II) LoadModule: "dri2"
Aug  2 13:05:01 station 19179.951] (II) Loading /usr/lib64/xorg/modules/ext=
ensions/libdri2.so
Aug  2 13:05:01 station 19179.951] (II) Module dri2: vendor=3D"X.Org Founda=
tion"
Aug  2 13:05:01 station 19179.951]      compiled for 1.8.99.905, module ver=
sion =3D 1.2.0
Aug  2 13:05:01 station 19179.951]      ABI class: X.Org Server Extension, =
version 4.0
Aug  2 13:05:01 station 19179.951] (II) Loading extension DRI2
Aug  2 13:05:01 station 19179.951] (II) LoadModule: "nouveau"
Aug  2 13:05:01 station 19179.951] (II) Loading /usr/lib64/xorg/modules/dri=
vers/nouveau_drv.so
Aug  2 13:05:01 station 19179.951] (II) Module nouveau: vendor=3D"X.Org Fou=
ndation"
Aug  2 13:05:01 station 19179.951]      compiled for 1.8.99.905, module ver=
sion =3D 0.0.16
Aug  2 13:05:01 station 19179.951]      Module class: X.Org Video Driver
Aug  2 13:05:01 station 19179.951]      ABI class: X.Org Video Driver, vers=
ion 8.0
Aug  2 13:05:01 station 19179.951] (II) LoadModule: "evdev"
Aug  2 13:05:01 station 19179.951] (II) Loading /usr/lib64/xorg/modules/inp=
ut/evdev_drv.so
Aug  2 13:05:01 station 19179.951] (II) Module evdev: vendor=3D"X.Org Found=
ation"
Aug  2 13:05:01 station 19179.951]      compiled for 1.8.99.905, module ver=
sion =3D 2.4.0
Aug  2 13:05:01 station 19179.951]      Module class: X.Org XInput Driver
Aug  2 13:05:01 station 19179.951]      ABI class: X.Org XInput driver, ver=
sion 11.0
Aug  2 13:05:01 station 19179.951] (II) NOUVEAU driver=20
Aug  2 13:05:01 station 19179.951] (II) NOUVEAU driver for NVIDIA chipset f=
amilies :
Aug  2 13:05:01 station 19179.951]      RIVA TNT    (NV04)
Aug  2 13:05:01 station 19179.951]      RIVA TNT2   (NV05)
Aug  2 13:05:01 station 19179.951]      GeForce 256 (NV10)
Aug  2 13:05:01 station 19179.951]      GeForce 2   (NV11, NV15)
Aug  2 13:05:01 station 19179.951]      GeForce 4MX (NV17, NV18)
Aug  2 13:05:01 station 19179.951]      GeForce 3   (NV20)
Aug  2 13:05:01 station 19179.951]      GeForce 4Ti (NV25, NV28)
Aug  2 13:05:01 station 19179.951]      GeForce FX  (NV3x)
Aug  2 13:05:01 station 19179.951]      GeForce 6   (NV4x)
Aug  2 13:05:01 station 19179.951]      GeForce 7   (G7x)
Aug  2 13:05:01 station 19179.951]      GeForce 8   (G8x)
Aug  2 13:05:01 station 19179.951] (++) using VT number 9
Aug  2 13:05:01 station 19179.951] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19179.951] drmOpenDevice: open result is 8, (OK)
Aug  2 13:05:01 station 19179.951] drmOpenByBusid: Searching for BusID pci:=
0000:04:00.0
Aug  2 13:05:01 station 19179.951] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19179.951] drmOpenDevice: open result is 8, (OK)
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmOpenMinor returns 8
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmGetBusid reports pci:=
0000:01:00.0
Aug  2 13:05:01 station 19179.952] drmOpenDevice: node name is /dev/dri/car=
d1
Aug  2 13:05:01 station 19179.952] drmOpenDevice: open result is 8, (OK)
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmOpenMinor returns 8
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmGetBusid reports pci:=
0000:04:00.0
Aug  2 13:05:01 station 19179.952] (II) [drm] nouveau interface version: 0.=
0.16
Aug  2 13:05:01 station 19179.952] (II) Loading sub module "dri"
Aug  2 13:05:01 station 19179.952] (II) LoadModule: "dri"
Aug  2 13:05:01 station 19179.952] (II) Reloading /usr/lib64/xorg/modules/e=
xtensions/libdri.so
Aug  2 13:05:01 station 19179.952] (II) NOUVEAU(0): Loaded DRI module
Aug  2 13:05:01 station 19179.952] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19179.952] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19179.952] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19179.952] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: Searching for BusID pci:=
0000:04:00.0
Aug  2 13:05:01 station 19179.952] drmOpenDevice: node name is /dev/dri/car=
d0
Aug  2 13:05:01 station 19179.952] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmOpenMinor returns 9
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmGetBusid reports pci:=
0000:01:00.0
Aug  2 13:05:01 station 19179.952] drmOpenDevice: node name is /dev/dri/car=
d1
Aug  2 13:05:01 station 19179.952] drmOpenDevice: open result is 9, (OK)
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmOpenMinor returns 9
Aug  2 13:05:01 station 19179.952] drmOpenByBusid: drmGetBusid reports pci:=
0000:04:00.0
Aug  2 13:05:01 station 19179.952] (II) [drm] DRM interface version 1.3
Aug  2 13:05:01 station 19179.952] (II) [drm] DRM open master succeeded.
Aug  2 13:05:01 station 19179.952] (--) NOUVEAU(0): Chipset: "NVIDIA NV44"
Aug  2 13:05:01 station 19179.952] (**) NOUVEAU(0): Depth 24, (--) framebuf=
fer bpp 32
Aug  2 13:05:01 station 19179.952] (=3D=3D) NOUVEAU(0): RGB weight 888
Aug  2 13:05:01 station 19179.952] (=3D=3D) NOUVEAU(0): Default visual is T=
rueColor
Aug  2 13:05:01 station 19179.952] (=3D=3D) NOUVEAU(0): Using HW cursor
Aug  2 13:05:01 station 19180.016] (II) NOUVEAU(0): Output VGA-2 using moni=
tor section Monitor.B
Aug  2 13:05:01 station 19180.125] (II) NOUVEAU(0): Output DVI-I-2 has no m=
onitor section
Aug  2 13:05:01 station 19180.188] (II) NOUVEAU(0): Output TV-2 has no moni=
tor section
Aug  2 13:05:01 station 19180.252] (II) NOUVEAU(0): EDID for output VGA-2
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): EDID for output DVI-I-2
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Manufacturer: VSC  Mode=
l: a720  Serial#: 16843009
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Year: 2008  Week: 35
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): EDID Version: 1.3
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Digital Display Input
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Max Image Size [cm]: ho=
riz.: 38  vert.: 30
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Gamma: 2.20
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): DPMS capabilities: Off
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Supported color encodin=
gs: RGB 4:4:4 YCrCb 4:4:4=20
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Default color space is =
primary color space
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): First detailed timing i=
s preferred mode
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): redX: 0.665 redY: 0.320=
   greenX: 0.225 greenY: 0.680
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): blueX: 0.145 blueY: 0.0=
80   whiteX: 0.315 whiteY: 0.321
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Supported established t=
imings:
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 720x400@70Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 640x480@60Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 640x480@67Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 640x480@72Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 640x480@75Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 800x600@56Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 800x600@60Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 800x600@72Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 800x600@75Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 832x624@75Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 1024x768@60Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 1024x768@70Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 1024x768@75Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 1280x1024@75Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): 1152x864@75Hz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Manufacturer's mask: 0
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Supported standard timi=
ngs:
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): #0: hsize: 1280  vsize =
1024  refresh: 60  vid: 32897
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): #1: hsize: 1280  vsize =
960  refresh: 60  vid: 16513
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): #2: hsize: 1152  vsize =
864  refresh: 75  vid: 20337
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): #3: hsize: 640  vsize 4=
00  refresh: 70  vid: 2609
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Supported detailed timi=
ng:
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): clock: 108.0 MHz   Imag=
e Size:  376 x 301 mm
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): h_active: 1280  h_sync:=
 1328  h_sync_end 1440 h_blank_end 1688 h_border: 0
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): v_active: 1024  v_sync:=
 1025  v_sync_end 1028 v_blanking: 1066 v_border: 0
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Serial No: QT3083500621
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Ranges: V min: 50 V max=
: 85 Hz, H min: 24 H max: 82 kHz, PixClock max 140 MHz
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): Monitor name: VP950b
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0): EDID (in hex):
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     00ffffffffffff005a6=
320a701010101
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     2312010380261e782e4=
82daa5239ae25
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     145052bfef808180814=
0714f310a0101
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     010101010101302a009=
851002a403070
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     1300782d1100001e000=
000ff00515433
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     3038333530303632310=
a000000fd0032
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     5518520e000a2020202=
02020000000fc
Aug  2 13:05:01 station 19180.361] (II) NOUVEAU(0):     005650393530620a202=
02020202000a5
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Printing probed modes f=
or output DVI-I-2
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1280x1024"x60=
=2E0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 =
kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1280x1024"x75=
=2E0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 =
kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1280x960"x60.=
0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1152x864"x75.=
0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1024x768"x75.=
1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1024x768"x70.=
1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "1024x768"x60.=
0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "832x624"x74.6=
   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "800x600"x72.2=
   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "800x600"x75.0=
   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "800x600"x60.3=
   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "800x600"x56.2=
   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "640x480"x75.0=
   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "640x480"x72.8=
   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "640x480"x66.7=
   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "640x480"x60.0=
   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:01 station 19180.362] (II) NOUVEAU(0): Modeline "720x400"x70.1=
   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): EDID for output TV-2
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Output VGA-2 disconnect=
ed
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Output DVI-I-2 connected
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Output TV-2 disconnected
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Using user preference f=
or initial modes
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Output DVI-I-2 using in=
itial mode 1280x1024
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Using default gamma of =
(1.0, 1.0, 1.0) unless otherwise stated.
Aug  2 13:05:01 station 19180.424] (--) NOUVEAU(0): Virtual size is 1280x10=
24 (pitch 1280)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1280x1024=
": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1280x1024"x60=
=2E0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 =
kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1280x1024=
": 135.0 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1280x1024"x75=
=2E0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 =
kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1280x960"=
: 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1280x960"x60.=
0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1152x864"=
: 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1152x864"x75.=
0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1024x768"=
: 78.8 MHz (scaled from 0.0 MHz), 60.1 kHz, 75.1 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1024x768"x75.=
1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1024x768"=
: 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1024x768"x70.=
1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "1024x768"=
: 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "1024x768"x60.=
0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "832x624":=
 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "832x624"x74.6=
   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "800x600":=
 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "800x600"x72.2=
   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "800x600":=
 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "800x600"x75.0=
   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "800x600":=
 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "800x600"x60.3=
   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "800x600":=
 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "800x600"x56.2=
   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "640x480":=
 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "640x480"x75.0=
   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "640x480":=
 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "640x480"x72.8=
   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "640x480":=
 30.2 MHz (scaled from 0.0 MHz), 35.0 kHz, 66.7 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "640x480"x66.7=
   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "640x480":=
 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "640x480"x60.0=
   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:05:01 station 19180.424] (**) NOUVEAU(0):  Driver mode "720x400":=
 28.3 MHz (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz
Aug  2 13:05:01 station 19180.424] (II) NOUVEAU(0): Modeline "720x400"x70.1=
   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:05:01 station 19180.424] (=3D=3D) NOUVEAU(0): DPI set to (96, 96)
Aug  2 13:05:01 station 19180.424] (II) Loading sub module "fb"
Aug  2 13:05:01 station 19180.424] (II) LoadModule: "fb"
Aug  2 13:05:01 station 19180.425] (II) Loading /usr/lib64/xorg/modules/lib=
fb.so
Aug  2 13:05:01 station 19180.425] (II) Module fb: vendor=3D"X.Org Foundati=
on"
Aug  2 13:05:01 station 19180.425]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19180.425]      ABI class: X.Org ANSI C Emulation, =
version 0.4
Aug  2 13:05:01 station 19180.425] (II) Loading sub module "exa"
Aug  2 13:05:01 station 19180.425] (II) LoadModule: "exa"
Aug  2 13:05:01 station 19180.425] (II) Loading /usr/lib64/xorg/modules/lib=
exa.so
Aug  2 13:05:01 station 19180.425] (II) Module exa: vendor=3D"X.Org Foundat=
ion"
Aug  2 13:05:01 station 19180.425]      compiled for 1.8.99.905, module ver=
sion =3D 2.5.0
Aug  2 13:05:01 station 19180.425]      ABI class: X.Org Video Driver, vers=
ion 8.0
Aug  2 13:05:01 station 19180.425] (II) Loading sub module "shadowfb"
Aug  2 13:05:01 station 19180.425] (II) LoadModule: "shadowfb"
Aug  2 13:05:01 station 19180.425] (II) Loading /usr/lib64/xorg/modules/lib=
shadowfb.so
Aug  2 13:05:01 station 19180.425] (II) Module shadowfb: vendor=3D"X.Org Fo=
undation"
Aug  2 13:05:01 station 19180.425]      compiled for 1.8.99.905, module ver=
sion =3D 1.0.0
Aug  2 13:05:01 station 19180.425]      ABI class: X.Org ANSI C Emulation, =
version 0.4
Aug  2 13:05:01 station 19180.425] (--) Depth 24 pixmap format is 32 bpp
Aug  2 13:05:01 station 19180.428] (II) NOUVEAU(0): Opened GPU channel 1
Aug  2 13:05:01 station 19180.428] (II) NOUVEAU(0): [DRI2] Setup complete
Aug  2 13:05:01 station 19180.428] (II) NOUVEAU(0): [DRI2]   DRI driver: no=
uveau
Aug  2 13:05:01 station 19180.428] (II) NOUVEAU(0): GART: 64MiB available
Aug  2 13:05:01 station 19180.429] (II) NOUVEAU(0): GART: Allocated 16MiB a=
s a scratch buffer
Aug  2 13:05:01 station 19180.429] (II) EXA(0): Driver allocated offscreen =
pixmaps
Aug  2 13:05:01 station 19180.429] (II) EXA(0): Driver registered support f=
or the following operations:
Aug  2 13:05:01 station 19180.429] (II)         Solid
Aug  2 13:05:01 station 19180.429] (II)         Copy
Aug  2 13:05:01 station 19180.429] (II)         Composite (RENDER accelerat=
ion)
Aug  2 13:05:01 station 19180.429] (II)         UploadToScreen
Aug  2 13:05:01 station 19180.429] (II)         DownloadFromScreen
Aug  2 13:05:01 station 19180.429] (=3D=3D) NOUVEAU(0): Backing store disab=
led
Aug  2 13:05:01 station 19180.429] (=3D=3D) NOUVEAU(0): Silken mouse enabled
Aug  2 13:05:01 station 19180.430] (II) NOUVEAU(0): [XvMC] Associated with =
NV40 texture adapter.
Aug  2 13:05:01 station 19180.430] (II) NOUVEAU(0): [XvMC] Extension initia=
lized.
Aug  2 13:05:01 station 19180.430] (II) NOUVEAU(0): RandR 1.2 enabled, igno=
re the following RandR disabled message.
Aug  2 13:05:01 station 19180.430] (--) RandR disabled
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension Gen=
eric Event Extension
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension SHA=
PE
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension MIT=
=2DSHM
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension XIn=
putExtension
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension XTE=
ST
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension BIG=
=2DREQUESTS
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension SYNC
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension XKE=
YBOARD
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension XC-=
MISC
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension XIN=
ERAMA
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension XFI=
XES
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension REN=
DER
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension RAN=
DR
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension COM=
POSITE
Aug  2 13:05:01 station 19180.430] (II) Initializing built-in extension DAM=
AGE
Aug  2 13:05:01 station 19180.437] (II) AIGLX: Loaded and initialized /usr/=
lib64/dri/swrast_dri.so
Aug  2 13:05:01 station 19180.437] (II) GLX: Initialized DRISWRAST GL provi=
der for screen 0
Aug  2 13:05:01 station 19180.437] (II) NOUVEAU(0): NVEnterVT is called.
Aug  2 13:05:01 station 19180.504] (II) NOUVEAU(0): Setting screen physical=
 size to 338 x 270
Aug  2 13:05:01 station 19180.504] resize called 1280 1024
Aug  2 13:05:01 station 19180.587] (**) Option "CoreKeyboard"
Aug  2 13:05:01 station 19180.587] (**) Keyboard.B: always reports core eve=
nts
Aug  2 13:05:01 station 19180.587] (**) Keyboard.B: Device: "/dev/input/by-=
path/platform-i8042-serio-0-event-kbd"
Aug  2 13:05:01 station 19180.636] (II) Keyboard.B: Found keys
Aug  2 13:05:01 station 19180.636] (II) Keyboard.B: Configuring as keyboard
Aug  2 13:05:01 station 19180.636] (II) XINPUT: Adding extended input devic=
e "Keyboard.B" (type: KEYBOARD)
Aug  2 13:05:01 station 19180.636] (**) Option "xkb_rules" "evdev"
Aug  2 13:05:01 station 19180.636] (**) Option "xkb_model" "evdev"
Aug  2 13:05:01 station 19180.636] (**) Option "xkb_layout" "us"
Aug  2 13:05:01 station 19180.680] (**) Option "CorePointer"
Aug  2 13:05:01 station 19180.680] (**) Mouse.B: always reports core events
Aug  2 13:05:01 station 19180.680] (**) Mouse.B: Device: "/dev/input/event4"
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: Found 3 mouse buttons
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: Found scroll wheel(s)
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: Found relative axes
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: Found x and y relative axes
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: Configuring as mouse
Aug  2 13:05:01 station 19180.724] (**) Option "Emulate3Buttons" "no"
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: Forcing middle mouse butto=
n emulation off.
Aug  2 13:05:01 station 19180.724] (**) Option "YAxisMapping" "4 5"
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: YAxisMapping: buttons 4 an=
d 5
Aug  2 13:05:01 station 19180.724] (**) Option "XAxisMapping" "7 6"
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: XAxisMapping: buttons 7 an=
d 6
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: EmulateWheelButton: 4, Emu=
lateWheelInertia: 10, EmulateWheelTimeout: 200
Aug  2 13:05:01 station 19180.724] (II) XINPUT: Adding extended input devic=
e "Mouse.B" (type: MOUSE)
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: (accel) keeping accelerati=
on scheme 1
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: (accel) acceleration profi=
le 0
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: (accel) acceleration facto=
r: 2.000
Aug  2 13:05:01 station 19180.724] (**) Mouse.B: (accel) acceleration thres=
hold: 4
Aug  2 13:05:01 station 19180.724] (II) Mouse.B: initialized for relative a=
xes.
Aug  2 13:05:01 station 19180.756] (II) config/udev: Adding input device Po=
wer Button (/dev/input/event1)
Aug  2 13:05:01 station 19180.756] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.757] (II) config/udev: Adding input device Po=
wer Button (/dev/input/event0)
Aug  2 13:05:01 station 19180.757] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.760] (II) config/udev: Adding input device Lo=
gitech USB Optical Mouse (/dev/input/event4)
Aug  2 13:05:01 station 19180.760] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.760] (II) config/udev: Adding input device Lo=
gitech USB Optical Mouse (/dev/input/mouse0)
Aug  2 13:05:01 station 19180.760] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.761] (II) config/udev: Adding input device Lo=
gitech Logitech USB Keyboard (/dev/input/event5)
Aug  2 13:05:01 station 19180.761] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.761] (II) config/udev: Adding input device Lo=
gitech USB-PS/2 Optical Mouse (/dev/input/event6)
Aug  2 13:05:01 station 19180.761] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.761] (II) config/udev: Adding input device Lo=
gitech USB-PS/2 Optical Mouse (/dev/input/mouse1)
Aug  2 13:05:01 station 19180.761] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.763] (II) config/udev: Adding input device AT=
 Translated Set 2 keyboard (/dev/input/event3)
Aug  2 13:05:01 station 19180.763] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:05:01 station 19180.763] (II) config/udev: Adding input device PC=
 Speaker (/dev/input/event2)
Aug  2 13:05:01 station 19180.763] (II) AutoAddDevices is off - not adding =
device.
Aug  2 13:06:10 station 19249.608] (II) NOUVEAU(0): EDID vendor "VSC", prod=
 id 42784
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Using hsync ranges from=
 config file
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Using vrefresh ranges f=
rom config file
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Printing DDC gathered M=
odelines:
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "720x400"x0.0 =
  28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "832x624"x0.0 =
  57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1152x864"x0.0=
  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "1280x960"x0.0=
  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:06:10 station 19249.609] (II) NOUVEAU(0): Modeline "640x400"x70.0=
   23.35  640 656 720 800  400 401 404 417 -hsync +vsync (29.2 kHz)
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): EDID vendor "VSC", prod=
 id 42784
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Using hsync ranges from=
 config file
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Using vrefresh ranges f=
rom config file
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Printing DDC gathered M=
odelines:
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
Aug  2 13:06:14 station 19253.745] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "720x400"x0.0 =
  28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "1280x1024"x0.=
0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "1024x768"x0.0=
   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "832x624"x0.0 =
  57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "800x600"x0.0 =
  50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "1152x864"x0.0=
  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "1280x960"x0.0=
  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
Aug  2 13:06:15 station 19253.745] (II) NOUVEAU(0): Modeline "640x400"x70.0=
   23.35  640 656 720 800  400 401 404 417 -hsync +vsync (29.2 kHz)
Aug  2 13:17:10 station 19910.360] (II) Keyboard.B: Close
Aug  2 13:17:10 station 19910.360] (II) UnloadModule: "evdev"
Aug  2 13:17:11 station 19910.408] (II) Mouse.B: Close
Aug  2 13:17:11 station 19910.408] (II) UnloadModule: "evdev"
Aug  2 13:17:11 station 19910.408] (II) NOUVEAU(0): NVLeaveVT is called.
Aug  2 13:17:11 station 19910.409] (II) NOUVEAU(0): Closed GPU channel 1

--Boundary-01=_F3tVMHPJBDHGUAK--

--nextPart1749595.3BgREj9eck
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxW3coACgkQHuSu329e3GHArQCbBAXTLI1TvMOU/2Oy6MPokU0b
SA0AniWvIArv2dpIL/Z2pYoe9L6nf+Ky
=++RK
-----END PGP SIGNATURE-----

--nextPart1749595.3BgREj9eck--

--===============0608908649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0608908649==--
