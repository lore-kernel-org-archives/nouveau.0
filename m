From: Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
Subject: Re: missing text and icons with NV25
Date: Thu, 31 Dec 2009 11:00:56 -0500
Message-ID: <1262275256.24950.0@ffortso4>
References: <1262204506.8519.0@ffortso4>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-NpiYJFbsx42Ym/L+tfOZ"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262204506.8519.0@ffortso4> (from ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org on
	Wed Dec 30 15:21:46 2009)
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--=-NpiYJFbsx42Ym/L+tfOZ
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2009.12.30 15:21, Jack wrote:
> On 2009.12.24 04:12, Xavier wrote:
>> On Thu, Dec 24, 2009 at 12:29 AM, Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> =20
>> wrote:
.....
> It looks like some updates just hit arch, so I now have =20
> xf86-video-nouveau 0.0.10_git20091221-1 and nouveau-drm =20
> 0.0.15_20091220-1 with kernel26 2.6.32.2-2 and xorg-server =20
> 1.7.3.902-1.  Missing icons and fonts, and some apparent screen =20
> corruption as I'm exiting X.
>=20
> I still have to enable getting newer packages from testing, but these =20
> still give the same problem.  I suppose I could also set up to =20
> compile from git, if necessary to test bleeding edge or specific =20
> patches.
>=20
>>> X starts (with no apparent errors) but it's essentially unusable, =20
>>> since it's missing all the icons on all the panels and toolbars, =20
>>> and no text shows up at all. =A0For example, I can start an xterm, =20
>>> since I know where the icon is on the panel, and I can type =20
>>> commands, which by the cursor movement seem to be working =20
>>> correctly, but there is no visible text in the term. =A0Popups (such =20
>>> as right-clicking on the main window) have some clutter/video noise =20
>>> - but no text or icons. =A0I see no obvious error messages in the log =20
>>> or dmesg.
> >> ....

I've attached dmesg and Xorg.log.  However, I just noticed these two =20
lines in dmesg:
    X:1411 conflicting memory types d8000000-d8010000 =20
uncached-minus<->write-combining
    reserve_memtype failed 0xd8000000-0xd8010000, track uncached-minus, =20
req uncached-minus
and I see this error was mentioned in posts here on 11 and 13 =20
December.  I don't know if it's relevant, but I point it out to save =20
time, just in case.

xorg.conf is just
   Section "Device"
         Identifier  "nvidia"
         Driver      "nouveau"
   EndSection

I'll be glad to file as a new bug, but I want to be sure first that I'm =20
not simply missing something obvious.

Jack

--=-NpiYJFbsx42Ym/L+tfOZ
Content-Type: text/x-log; charset=us-ascii; name=dmesg.log
Content-Disposition: attachment; filename=dmesg.log
Content-Transfer-Encoding: quoted-printable

Linux version 2.6.32-ARCH (tobias@T-POWA-LX) (gcc version 4.4.2 20091208 (p=
rerelease) (GCC) ) #1 SMP PREEMPT Sat Dec 26 08:26:17 UTC 2009
KERNEL supported cpus:
  Intel GenuineIntel
  AMD AuthenticAMD
  NSC Geode by NSC
  Cyrix CyrixInstead
  Centaur CentaurHauls
  Transmeta GenuineTMx86
  Transmeta TransmetaCPU
  UMC UMC UMC UMC
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000004fffc000 (usable)
 BIOS-e820: 000000004fffc000 - 000000004ffff000 (ACPI data)
 BIOS-e820: 000000004ffff000 - 0000000050000000 (ACPI NVS)
 BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
DMI 2.3 present.
last_pfn =3D 0x4fffc max_arch_pfn =3D 0x100000
MTRR default type: uncachable
MTRR fixed ranges enabled:
  00000-9FFFF write-back
  A0000-EFFFF uncachable
  F0000-FFFFF write-protect
MTRR variable ranges enabled:
  0 base 000000000 mask FC0000000 write-back
  1 base 040000000 mask FF0000000 write-back
  2 disabled
  3 disabled
  4 disabled
  5 disabled
  6 disabled
  7 base 0E0000000 mask FFC000000 write-combining
x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
e820 update range: 0000000000002000 - 0000000000006000 (usable) =3D=3D> (re=
served)
Scanning 1 areas for low memory corruption
modified physical RAM map:
 modified: 0000000000000000 - 0000000000002000 (usable)
 modified: 0000000000002000 - 0000000000006000 (reserved)
 modified: 0000000000006000 - 000000000009fc00 (usable)
 modified: 000000000009fc00 - 00000000000a0000 (reserved)
 modified: 00000000000f0000 - 0000000000100000 (reserved)
 modified: 0000000000100000 - 000000004fffc000 (usable)
 modified: 000000004fffc000 - 000000004ffff000 (ACPI data)
 modified: 000000004ffff000 - 0000000050000000 (ACPI NVS)
 modified: 00000000fec00000 - 00000000fec01000 (reserved)
 modified: 00000000fee00000 - 00000000fee01000 (reserved)
 modified: 00000000ffff0000 - 0000000100000000 (reserved)
initial memory mapped : 0 - 01800000
init_memory_mapping: 0000000000000000-00000000377fe000
 0000000000 - 0000400000 page 4k
 0000400000 - 0037400000 page 2M
 0037400000 - 00377fe000 page 4k
kernel direct mapping tables up to 377fe000 @ 7000-c000
RAMDISK: 4ff59000 - 4ffeb519
Allocated new RAMDISK: 00008000 - 0009a519
Move RAMDISK from 000000004ff59000 - 000000004ffeb518 to 00008000 - 0009a51=
8
ACPI: RSDP 000f5c10 00014 (v00 ASUS  )
ACPI: RSDT 4fffc000 00030 (v01 ASUS   A7V333   42302E31 MSFT 31313031)
ACPI: FACP 4fffc0b2 00074 (v01 ASUS   A7V333   42302E31 MSFT 31313031)
ACPI: DSDT 4fffc126 02124 (v01   ASUS A7V333   00001000 MSFT 0100000B)
ACPI: FACS 4ffff000 00040
ACPI: BOOT 4fffc030 00028 (v01 ASUS   A7V333   42302E31 MSFT 31313031)
ACPI: APIC 4fffc058 0005A (v01 ASUS   A7V333   42302E31 MSFT 31313031)
ACPI: Local APIC address 0xfee00000
391MB HIGHMEM available.
887MB LOWMEM available.
  mapped low ram: 0 - 377fe000
  low ram: 0 - 377fe000
  node 0 low ram: 00000000 - 377fe000
  node 0 bootmap 00100000 - 00106f00
(9 early reservations) =3D=3D> bootmem [0000000000 - 00377fe000]
  #0 [0000000000 - 0000001000]   BIOS data page =3D=3D> [0000000000 - 00000=
01000]
  #1 [0000001000 - 0000002000]    EX TRAMPOLINE =3D=3D> [0000001000 - 00000=
02000]
  #2 [0000006000 - 0000007000]       TRAMPOLINE =3D=3D> [0000006000 - 00000=
07000]
  #3 [0001000000 - 0001525f44]    TEXT DATA BSS =3D=3D> [0001000000 - 00015=
25f44]
  #4 [000009fc00 - 0000100000]    BIOS reserved =3D=3D> [000009fc00 - 00001=
00000]
  #5 [0001526000 - 000152c148]              BRK =3D=3D> [0001526000 - 00015=
2c148]
  #6 [0000007000 - 0000008000]          PGTABLE =3D=3D> [0000007000 - 00000=
08000]
  #7 [0000008000 - 000009a519]      NEW RAMDISK =3D=3D> [0000008000 - 00000=
9a519]
  #8 [0000100000 - 0000107000]          BOOTMAP =3D=3D> [0000100000 - 00001=
07000]
Zone PFN ranges:
  DMA      0x00000000 -> 0x00001000
  Normal   0x00001000 -> 0x000377fe
  HighMem  0x000377fe -> 0x0004fffc
Movable zone start PFN for each node
early_node_map[3] active PFN ranges
    0: 0x00000000 -> 0x00000002
    0: 0x00000006 -> 0x0000009f
    0: 0x00000100 -> 0x0004fffc
On node 0 totalpages: 327575
free_area_init_node: node 0, pgdat c13d3c00, node_mem_map c152e000
  DMA zone: 32 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 3963 pages, LIFO batch:0
  Normal zone: 1744 pages used for memmap
  Normal zone: 221486 pages, LIFO batch:31
  HighMem zone: 784 pages used for memmap
  HighMem zone: 99566 pages, LIFO batch:31
Using APIC driver default
ACPI: PM-Timer IO Port: 0xe408
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
IOAPIC[0]: apic_id 2, version 2, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl edge)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Enabling APIC mode:  Flat.  Using 1 I/O APICs
Using ACPI (MADT) for SMP configuration information
SMP: Allowing 1 CPUs, 0 hotplug CPUs
nr_irqs_gsi: 24
PM: Registered nosave memory: 0000000000002000 - 0000000000006000
PM: Registered nosave memory: 000000000009f000 - 00000000000a0000
PM: Registered nosave memory: 00000000000a0000 - 00000000000f0000
PM: Registered nosave memory: 00000000000f0000 - 0000000000100000
Allocating PCI resources starting at 50000000 (gap: 50000000:aec00000)
Booting paravirtualized kernel on bare hardware
NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:1 nr_node_ids:1
PERCPU: Embedded 14 pages/cpu @c2000000 s34616 r0 d22728 u4194304
pcpu-alloc: s34616 r0 d22728 u4194304 alloc=3D1*4194304
pcpu-alloc: [0] 0=20
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 325015
Kernel command line: root=3D/dev/disk/by-uuid/31d1bf9f-d83f-445a-9adb-c0077=
d833ffe ro
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Initializing CPU#0
Initializing HighMem for node 0 (000377fe:0004fffc)
Memory: 1292416k/1310704k available (2772k kernel code, 17032k reserved, 11=
76k data, 408k init, 401400k highmem)
virtual kernel memory layout:
    fixmap  : 0xfff1e000 - 0xfffff000   ( 900 kB)
    pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
    vmalloc : 0xf7ffe000 - 0xff7fe000   ( 120 MB)
    lowmem  : 0xc0000000 - 0xf77fe000   ( 887 MB)
      .init : 0xc13dc000 - 0xc1442000   ( 408 kB)
      .data : 0xc12b53c6 - 0xc13db6a8   (1176 kB)
      .text : 0xc1000000 - 0xc12b53c6   (2772 kB)
Checking if this processor honours the WP bit even in supervisor mode...Ok.
SLUB: Genslabs=3D13, HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
Hierarchical RCU implementation.
NR_IRQS:512
Console: colour VGA+ 80x25
console [tty0] enabled
Fast TSC calibration using PIT
Detected 1916.753 MHz processor.
Calibrating delay loop (skipped), value calculated using timer frequency.. =
3835.23 BogoMIPS (lpj=3D6389176)
Security Framework initialized
Mount-cache hash table entries: 512
CPU: CLK_CTL MSR was 6003d22f. Reprogramming to 2003d22f
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
mce: CPU supports 4 MCE banks
Performance Events: AMD PMU driver.
... version:                0
... bit width:              48
... generic registers:      4
... value mask:             0000ffffffffffff
... max period:             00007fffffffffff
... fixed-purpose events:   0
... event mask:             000000000000000f
Checking 'hlt' instruction... OK.
SMP alternatives: switching to UP code
Freeing SMP alternatives: 11k freed
ACPI: Core revision 20090903
..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
CPU0: AMD Athlon(TM) XP stepping 00
Brought up 1 CPUs
Total of 1 processors activated (3835.23 BogoMIPS).
CPU0 attaching NULL sched-domain.
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: PCI BIOS revision 2.10 entry at 0xf17e0, last bus=3D1
PCI: Using configuration type 1 for base access
bio: create slab <bio-0> at 0
ACPI: EC: Look up EC in DSDT
ACPI: Interpreter enabled
ACPI: (supports S0 S1 S4 S5)
ACPI: Using IOAPIC for interrupt routing
ACPI: No dock devices found.
ACPI: PCI Root Bridge [PCI0] (0000:00)
pci 0000:00:00.0: reg 10 32bit mmio pref: [0xe0000000-0xe3ffffff]
pci 0000:00:01.0: supports D1
pci 0000:00:05.0: reg 10 io port: [0xd800-0xd8ff]
pci 0000:00:05.0: supports D1 D2
pci 0000:00:07.0: reg 10 32bit mmio: [0xd5800000-0xd58007ff]
pci 0000:00:07.0: reg 14 32bit mmio: [0xd5000000-0xd5003fff]
pci 0000:00:07.0: supports D1 D2
pci 0000:00:07.0: PME# supported from D0 D1 D2 D3hot
pci 0000:00:07.0: PME# disabled
pci 0000:00:09.0: reg 20 io port: [0xd400-0xd41f]
pci 0000:00:09.0: PME# supported from D0 D3hot D3cold
pci 0000:00:09.0: PME# disabled
pci 0000:00:09.1: reg 20 io port: [0xd000-0xd01f]
pci 0000:00:09.1: PME# supported from D0 D3hot D3cold
pci 0000:00:09.1: PME# disabled
pci 0000:00:09.2: reg 10 32bit mmio: [0xd4800000-0xd48000ff]
pci 0000:00:09.2: PME# supported from D0 D3hot D3cold
pci 0000:00:09.2: PME# disabled
pci 0000:00:0e.0: reg 10 io port: [0xb800-0xb8ff]
pci 0000:00:0e.0: reg 14 32bit mmio: [0xd4000000-0xd40000ff]
pci 0000:00:0e.0: reg 30 32bit mmio pref: [0x000000-0x00ffff]
pci 0000:00:0e.0: supports D1 D2
pci 0000:00:0e.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:00:0e.0: PME# disabled
pci 0000:00:11.1: reg 20 io port: [0xb400-0xb40f]
pci 0000:00:11.2: reg 20 io port: [0xb000-0xb01f]
pci 0000:00:11.3: reg 20 io port: [0xa800-0xa81f]
pci 0000:01:00.0: reg 10 32bit mmio: [0xd6000000-0xd6ffffff]
pci 0000:01:00.0: reg 14 32bit mmio pref: [0xd8000000-0xdfffffff]
pci 0000:01:00.0: reg 18 32bit mmio pref: [0xd7800000-0xd787ffff]
pci 0000:01:00.0: reg 30 32bit mmio pref: [0xd77e0000-0xd77fffff]
pci 0000:00:01.0: bridge 32bit mmio: [0xd6000000-0xd75fffff]
pci 0000:00:01.0: bridge 32bit mmio pref: [0xd7700000-0xdfffffff]
pci_bus 0000:00: on NUMA node 0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCI1._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disable=
d.
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 *5 6 7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11 12 14) *9
vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=
=3Dnone
vgaarb: loaded
PCI: Using ACPI for IRQ routing
NetLabel: Initializing
NetLabel:  domain hash size =3D 128
NetLabel:  protocols =3D UNLABELED CIPSOv4
NetLabel:  unlabeled traffic allowed by default
Switching to clocksource tsc
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 15 devices
ACPI: ACPI bus type pnp unregistered
system 00:00: iomem range 0x0-0x9ffff could not be reserved
system 00:00: iomem range 0xf0000-0xfffff could not be reserved
system 00:00: iomem range 0x100000-0x4fffffff could not be reserved
system 00:00: iomem range 0xfec00000-0xfec000ff could not be reserved
system 00:00: iomem range 0xfee00000-0xfee00fff has been reserved
system 00:02: ioport range 0xe400-0xe47f has been reserved
system 00:02: ioport range 0xe800-0xe81f has been reserved
system 00:02: iomem range 0xfff80000-0xffffffff could not be reserved
system 00:02: iomem range 0xffb80000-0xffbfffff has been reserved
system 00:03: ioport range 0x4d0-0x4d1 has been reserved
system 00:0e: ioport range 0x290-0x291 has been reserved
system 00:0e: ioport range 0x370-0x372 has been reserved
pci 0000:00:01.0: PCI bridge, secondary bus 0000:01
pci 0000:00:01.0:   IO window: disabled
pci 0000:00:01.0:   MEM window: 0xd6000000-0xd75fffff
pci 0000:00:01.0:   PREFETCH window: 0xd7700000-0xdfffffff
pci 0000:00:01.0: setting latency timer to 64
pci_bus 0000:00: resource 0 io:  [0x00-0xffff]
pci_bus 0000:00: resource 1 mem: [0x000000-0xffffffff]
pci_bus 0000:01: resource 1 mem: [0xd6000000-0xd75fffff]
pci_bus 0000:01: resource 2 pref mem [0xd7700000-0xdfffffff]
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
NET: Registered protocol family 1
pci 0000:00:01.0: disabling DAC on VIA PCI bridge
pci 0000:01:00.0: Boot video device
Unpacking initramfs...
Freeing initrd memory: 585k freed
Simple Boot Flag at 0x3a set to 0x1
apm: BIOS version 1.2 Flags 0x0b (Driver version 1.16ac)
apm: overridden by ACPI.
Scanning for low memory corruption every 60 seconds
audit: initializing netlink socket (disabled)
type=3D2000 audit(1262272932.146:1): initialized
highmem bounce pool size: 64 pages
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
msgmni has been set to 1743
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq =3D 3) is a 16550A
00:0a: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
00:0b: ttyS1 at I/O 0x2f8 (irq =3D 3) is a 16550A
input: Macintosh mouse button emulation as /devices/virtual/input/input0
PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mice: PS/2 mouse device common for all mice
cpuidle: using governor ladder
cpuidle: using governor menu
TCP cubic registered
NET: Registered protocol family 17
Using IPI No-Shortcut mode
PM: Resume from disk failed.
registered taskstats version 1
Initalizing network drop monitor service
Freeing unused kernel memory: 408k freed
input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input=
/input1
SCSI subsystem initialized
Floppy drive(s): fd0 is 1.44M
libata version 3.00 loaded.
pata_via 0000:00:11.1: version 0.3.4
pata_via 0000:00:11.1: can't derive routing for PCI INT A
scsi0 : pata_via
scsi1 : pata_via
ata1: PATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xb400 irq 14
ata2: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0xb408 irq 15
FDC 0 is a post-1991 82077
ata1.00: ATA-6: WDC WD400LB-00DNA0, 77.07W77, max UDMA/100
ata1.00: 78165360 sectors, multi 16: LBA48=20
ata1.00: configured for UDMA/100
scsi 0:0:0:0: Direct-Access     ATA      WDC WD400LB-00DN 77.0 PQ: 0 ANSI: =
5
ata2.00: ATAPI: AOPEN   CD-RW CRW4048     1.05 20020605, 1.05, max UDMA/33
ata2.01: ATAPI: TOSHIBA DVD-ROM SD-M1212, 1R14, max UDMA/33
ata2.00: configured for UDMA/33
ata2.01: configured for UDMA/33
scsi 1:0:0:0: CD-ROM            AOPEN    CD-RW CRW4048    1.05 PQ: 0 ANSI: =
5
scsi 1:0:1:0: CD-ROM            TOSHIBA  DVD-ROM SD-M1212 1R14 PQ: 0 ANSI: =
5
sd 0:0:0:0: [sda] 78165360 512-byte logical blocks: (40.0 GB/37.2 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
 sda:sr0: scsi3-mmc drive: 40x/40x writer cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi CD-ROM sr0
sr1: scsi3-mmc drive: 32x/32x cd/rw xa/form2 cdda tray
sr 1:0:1:0: Attached scsi CD-ROM sr1
 sda1 < sda5 sda6 sda7 sda8 sda9 > sda2 sda3 sda4
sd 0:0:0:0: [sda] Attached SCSI disk
EXT3-fs: mounted filesystem with writeback data mode.
kjournald starting.  Commit interval 5 seconds
Driver 'rtc_cmos' needs updating - please use bus_type methods
rtc_cmos 00:05: RTC can wake from S4
rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, 242 bytes nvram
udev: starting version 146
processor LNXCPU:00: registered as cooling_device0
sd 0:0:0:0: Attached scsi generic sg0 type 0
sr 1:0:0:0: Attached scsi generic sg1 type 5
sr 1:0:1:0: Attached scsi generic sg2 type 5
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
lp: driver loaded but no devices found
input: PC Speaker as /devices/platform/pcspkr/input/input2
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/in=
put3
ACPI: Power Button [PWRB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
ACPI: Power Button [PWRF]
Linux agpgart interface v0.103
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
parport_pc 00:09: reported by Plug and Play ACPI
parport0: PC-style at 0x378 (0x778), irq 7, dma 3 [PCSPP,TRISTATE,COMPAT,EC=
P,DMA]
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
lp0: using parport0 (interrupt-driven).
psmouse serio1: ID: 00 00 14
NET: Registered protocol family 23
ppdev: user-space parallel port driver
agpgart: Detected VIA KT266/KY266x/KT333 chipset
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
agpgart-via 0000:00:00.0: AGP aperture is 64M @ 0xe0000000
ehci_hcd 0000:00:09.2: PCI INT C -> GSI 17 (level, low) -> IRQ 17
ehci_hcd 0000:00:09.2: EHCI Host Controller
ehci_hcd 0000:00:09.2: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:09.2: irq 17, io mem 0xd4800000
ehci_hcd 0000:00:09.2: USB 2.0 started, EHCI 0.95
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 4 ports detected
8139cp 0000:00:0e.0: This (id 10ec:8139 rev 10) is not an 8139C+ compatible=
 chip, use 8139too
input: ImPS/2 Generic Wheel Mouse as /devices/platform/i8042/serio1/input/i=
nput5
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:09.0: PCI INT A -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:09.0: UHCI Host Controller
uhci_hcd 0000:00:09.0: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:09.0: irq 19, io base 0x0000d400
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
uhci_hcd 0000:00:09.1: PCI INT B -> GSI 16 (level, low) -> IRQ 16
uhci_hcd 0000:00:09.1: UHCI Host Controller
uhci_hcd 0000:00:09.1: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:09.1: irq 16, io base 0x0000d000
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
uhci_hcd 0000:00:11.2: PCI INT D -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:11.2: UHCI Host Controller
uhci_hcd 0000:00:11.2: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:11.2: irq 21, io base 0x0000b000
usb usb4: configuration #1 chosen from 1 choice
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
uhci_hcd 0000:00:11.3: PCI INT D -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:11.3: UHCI Host Controller
uhci_hcd 0000:00:11.3: new USB bus registered, assigned bus number 5
uhci_hcd 0000:00:11.3: irq 21, io base 0x0000a800
usb usb5: configuration #1 chosen from 1 choice
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
firewire_ohci 0000:00:07.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
8139too Fast Ethernet driver 0.9.28
firewire_ohci: Added fw-ohci device 0000:00:07.0, OHCI version 1.10
8139too 0000:00:0e.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
eth0: RealTek RTL8139 at 0xf81d4000, 00:30:bd:b4:f5:9e, IRQ 17
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[drm] nouveau 0000:01:00.0: Detected an NV20 generation card (0x025900a3)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
C-Media PCI 0000:00:05.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BMP BIOS found
[drm] nouveau 0000:01:00.0: BMP version 5.21
[drm] nouveau 0000:01:00.0: Bios version 04.25.00.29
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 2.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 02000110 000088b8
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01010200 000088b8
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02110202 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02110102 00000000
[drm] nouveau 0000:01:00.0: Merging DCB entries 2 and 3
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xC608
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xCA09
firewire_core: created device fw0: GUID 00e0180000044c9d, S400
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xC6FD
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xD029
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xC804
[TTM] Zone  kernel: Available graphics memory: 446436 kiB.
[TTM] Zone highmem: Available graphics memory: 647136 kiB.
[drm] nouveau 0000:01:00.0: 128 MiB VRAM
agpgart-via 0000:00:00.0: AGP 2.0 bridge
agpgart-via 0000:00:00.0: putting AGP V2 device into 4x mode
nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: Initial CRTC_OWNER is 0
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] nouveau 0000:01:00.0: Detected a VGA connector
[drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 1)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x9000, bo f68cca00
[drm] DAC-7: set mode 1680x1050 25
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output =
B
Console: switching to colour frame buffer device 210x65
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
EXT3 FS on sda7, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda8, internal journal
EXT3-fs: mounted filesystem with writeback data mode.
Adding 192772k swap on /dev/sda2.  Priority:-1 extents:1 across:192772k=20
Adding 248936k swap on /dev/sda5.  Priority:-2 extents:1 across:248936k=20
eth0: link up, 100Mbps, full-duplex, lpa 0x41E1
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
eth0: no IPv6 routers present
X:1411 conflicting memory types d8000000-d8010000 uncached-minus<->write-co=
mbining
reserve_memtype failed 0xd8000000-0xd8010000, track uncached-minus, req unc=
ached-minus
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1


--=-NpiYJFbsx42Ym/L+tfOZ
Content-Type: text/x-log; charset=us-ascii; name=Xorg.0.log
Content-Disposition: attachment; filename=Xorg.0.log
Content-Transfer-Encoding: quoted-printable


This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.

X.Org X Server 1.7.3.902 (1.7.4 RC 2)
Release Date: 2009-12-26
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.32-ARCH i686=20
Current Operating System: Linux ffortso2 2.6.32-ARCH #1 SMP PREEMPT Sat Dec=
 26 08:26:17 UTC 2009 i686
Kernel command line: root=3D/dev/disk/by-uuid/31d1bf9f-d83f-445a-9adb-c0077=
d833ffe ro
Build Date: 26 December 2009  11:37:45AM
=20
Current version of pixman: 0.16.4
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Thu Dec 31 10:23:03 2009
(=3D=3D) Using config file: "/etc/X11/xorg.conf"
(=3D=3D) No Layout section.  Using the first Screen section.
(=3D=3D) No screen section available. Using defaults.
(**) |-->Screen "Default Screen Section" (0)
(**) |   |-->Monitor "<default monitor>"
(=3D=3D) No device specified for screen "Default Screen Section".
	Using the first device section listed.
(**) |   |-->Device "nvidia"
(=3D=3D) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
(=3D=3D) Automatically adding devices
(=3D=3D) Automatically enabling devices
(WW) The directory "/usr/share/fonts/Type1" does not exist.
	Entry deleted from font path.
(=3D=3D) FontPath set to:
	/usr/share/fonts/misc,
	/usr/share/fonts/100dpi:unscaled,
	/usr/share/fonts/75dpi:unscaled,
	/usr/share/fonts/TTF
(=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
(II) Cannot locate a core pointer device.
(II) Cannot locate a core keyboard device.
(II) The server relies on HAL to provide the list of input devices.
	If no devices become available, reconfigure HAL or disable AutoAddDevices.
(II) Loader magic: 0x81e4c60
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 6.0
	X.Org XInput driver : 7.0
	X.Org Server Extension : 2.0
(--) using VT number 7

(--) PCI:*(0:1:0:0) 10de:0259:10de:0139 nVidia Corporation NV25GL [Quadro4 =
750 XGL] rev 163, Mem @ 0xd6000000/16777216, 0xd8000000/134217728, 0xd78000=
00/524288, BIOS @ 0x????????/131072
(II) Open ACPI successful (/var/run/acpid.socket)
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
(II) Module extmod: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
(II) Module dbe: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions/libglx.so
(II) Module glx: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(=3D=3D) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions/libdri.so
(II) Module dri: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
(II) Module dri2: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.1.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.901, module version =3D 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 6.0
(II) NOUVEAU driver=20
(II) NOUVEAU driver for NVIDIA chipset families :
	RIVA TNT    (NV04)
	RIVA TNT2   (NV05)
	GeForce 256 (NV10)
	GeForce 2   (NV11, NV15)
	GeForce 4MX (NV17, NV18)
	GeForce 3   (NV20)
	GeForce 4Ti (NV25, NV28)
	GeForce FX  (NV3x)
	GeForce 6   (NV4x)
	GeForce 7   (G7x)
	GeForce 8   (G8x)
(II) Primary Device is: PCI 01@00:00:0
(--) NOUVEAU(0): Chipset: "NVIDIA NV25"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules/libint10.so
(II) Module int10: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 6.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions/libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: drmOpenMinor returns 11
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] nouveau interface version: 0.0.15
(--) NOUVEAU(0): [drm] kernel modesetting in use
(II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
(=3D=3D) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(=3D=3D) NOUVEAU(0): RGB weight 888
(=3D=3D) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules/libvgahw.so
(II) Module vgahw: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 0.1.0
	ABI class: X.Org Video Driver, version 6.0
(=3D=3D) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD8000000
(--) NOUVEAU(0): MMIO registers at 0xD6000000
(II) NOUVEAU(0): Output VGA-0 has no monitor section
(II) NOUVEAU(0): Output DVI-I-0 has no monitor section
(II) NOUVEAU(0): EDID vendor "IQT", prod id 36869
(II) NOUVEAU(0): Using EDID range info for horizontal sync
(II) NOUVEAU(0): Using EDID range info for vertical refresh
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.00  1680 1784 1960 2240  105=
0 1053 1059 1089 -hsync -vsync (65.2 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 =
605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 =
603 625 +hsync +vsync (35.2 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 4=
84 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 4=
92 520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 4=
86 525 -hsync -vsync (35.0 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 4=
92 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 4=
14 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 =
769 772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 =
771 777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 =
771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 =
628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 =
604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 =
643 666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 =
865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 =
903 909 934 -hsync +vsync (55.9 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0  136.75  1440 1536 1688 1936  900 =
903 909 942 -hsync +vsync (70.6 kHz)
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  105=
0 1053 1059 1089 -hsync +vsync (65.3 kHz)
(II) NOUVEAU(0): Output VGA-0 connected
(II) NOUVEAU(0): Output DVI-I-0 disconnected
(II) NOUVEAU(0): Using exact sizes for initial modes
(II) NOUVEAU(0): Output VGA-0 using initial mode 1680x1050
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise st=
ated.
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(--) NOUVEAU(0): VideoRAM: 131072 kBytes
(--) NOUVEAU(0): Virtual size is 1680x1050 (pitch 1728)
(**) NOUVEAU(0):  Driver mode "1680x1050": 146.0 MHz (scaled from 0.0 MHz),=
 65.2 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x59.9  146.00  1680 1784 1960 2240  10=
50 1053 1059 1089 -hsync -vsync (65.2 kHz)
(**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz),=
 65.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  10=
50 1053 1059 1089 -hsync +vsync (65.3 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz),=
 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  10=
24 1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz),=
 64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  10=
24 1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Driver mode "1440x900": 136.8 MHz (scaled from 0.0 MHz), =
70.6 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1440x900"x75.0  136.75  1440 1536 1688 1936  900=
 903 909 942 -hsync +vsync (70.6 kHz)
(**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), =
55.9 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900=
 903 909 934 -hsync +vsync (55.9 kHz)
(**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), =
67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864=
 865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 6=
0.1 kHz, 75.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768=
 769 772 800 +hsync +vsync (60.1 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 5=
6.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768=
 771 777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 4=
8.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768=
 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49=
.7 kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625=
 628 667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48=
.1 kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637=
 643 666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46=
.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601=
 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37=
.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601=
 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35=
.2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601=
 603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37=
.9 kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 =
491 520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37=
.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 =
484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled from 0.0 MHz), 35=
.0 kHz, 66.7 Hz
(II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 =
486 525 -hsync -vsync (35.0 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31=
.5 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 =
492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31=
.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 =
414 449 -hsync +vsync (31.5 kHz)
(**) NOUVEAU(0): Display dimensions: (470, 290) mm
(**) NOUVEAU(0): DPI set to (90, 91)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules/libfb.so
(II) Module fb: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /usr/lib/xorg/modules/libexa.so
(II) Module exa: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 2.5.0
	ABI class: X.Org Video Driver, version 6.0
(II) Loading sub module "shadowfb"
(II) LoadModule: "shadowfb"
(II) Loading /usr/lib/xorg/modules/libshadowfb.so
(II) Module shadowfb: vendor=3D"X.Org Foundation"
	compiled for 1.7.3.902, module version =3D 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(--) Depth 24 pixmap format is 32 bpp
(II) NOUVEAU(0): Opened GPU channel 1
(II) NOUVEAU(0): [DRI2] Setup complete
(II) NOUVEAU(0): AGPGART: 64MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) EXA(0): Driver allocated offscreen pixmaps
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(=3D=3D) NOUVEAU(0): Backing store disabled
(=3D=3D) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): NVEnterVT is called.
(=3D=3D) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled mes=
sage.
(--) RandR disabled
(II) Initializing built-in extension Generic Event Extension
(II) Initializing built-in extension SHAPE
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension BIG-REQUESTS
(II) Initializing built-in extension SYNC
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-MISC
(II) Initializing built-in extension SECURITY
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(EE) AIGLX error: dlopen of /usr/lib/xorg/modules/dri/nouveau_dri.so failed=
 (/usr/lib/xorg/modules/dri/nouveau_dri.so: cannot open shared object file:=
 No such file or directory)
(EE) AIGLX: reverting to software rendering
(II) AIGLX: Screen 0 is not DRI capable
(II) AIGLX: Loaded and initialized /usr/lib/xorg/modules/dri/swrast_dri.so
(II) GLX: Initialized DRISWRAST GL provider for screen 0
(II) NOUVEAU(0): Setting screen physical size to 444 x 277
resize called 1680 1050
(II) config/hal: Adding input device Macintosh mouse button emulation
(II) LoadModule: "evdev"
(II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
(II) Module evdev: vendor=3D"X.Org Foundation"
	compiled for 1.7.3, module version =3D 2.3.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 7.0
(**) Macintosh mouse button emulation: always reports core events
(**) Macintosh mouse button emulation: Device: "/dev/input/event0"
(II) Macintosh mouse button emulation: Found 3 mouse buttons
(II) Macintosh mouse button emulation: Found relative axes
(II) Macintosh mouse button emulation: Found x and y relative axes
(II) Macintosh mouse button emulation: Configuring as mouse
(**) Macintosh mouse button emulation: YAxisMapping: buttons 4 and 5
(**) Macintosh mouse button emulation: EmulateWheelButton: 4, EmulateWheelI=
nertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "Macintosh mouse button emulation=
" (type: MOUSE)
(**) Macintosh mouse button emulation: (accel) keeping acceleration scheme =
1
(**) Macintosh mouse button emulation: (accel) acceleration profile 0
(II) Macintosh mouse button emulation: initialized for relative axes.
(II) config/hal: Adding input device ImPS/2 Generic Wheel Mouse
(**) ImPS/2 Generic Wheel Mouse: always reports core events
(**) ImPS/2 Generic Wheel Mouse: Device: "/dev/input/event5"
(II) ImPS/2 Generic Wheel Mouse: Found 3 mouse buttons
(II) ImPS/2 Generic Wheel Mouse: Found scroll wheel(s)
(II) ImPS/2 Generic Wheel Mouse: Found relative axes
(II) ImPS/2 Generic Wheel Mouse: Found x and y relative axes
(II) ImPS/2 Generic Wheel Mouse: Configuring as mouse
(**) ImPS/2 Generic Wheel Mouse: YAxisMapping: buttons 4 and 5
(**) ImPS/2 Generic Wheel Mouse: EmulateWheelButton: 4, EmulateWheelInertia=
: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "ImPS/2 Generic Wheel Mouse" (typ=
e: MOUSE)
(**) ImPS/2 Generic Wheel Mouse: (accel) keeping acceleration scheme 1
(**) ImPS/2 Generic Wheel Mouse: (accel) acceleration profile 0
(II) ImPS/2 Generic Wheel Mouse: initialized for relative axes.
(II) config/hal: Adding input device AT Translated Set 2 keyboard
(**) AT Translated Set 2 keyboard: always reports core events
(**) AT Translated Set 2 keyboard: Device: "/dev/input/event1"
(II) AT Translated Set 2 keyboard: Found keys
(II) AT Translated Set 2 keyboard: Configuring as keyboard
(II) XINPUT: Adding extended input device "AT Translated Set 2 keyboard" (t=
ype: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "evdev"
(**) Option "xkb_layout" "us"
(II) config/hal: Adding input device Power Button
(**) Power Button: always reports core events
(**) Power Button: Device: "/dev/input/event3"
(II) Power Button: Found keys
(II) Power Button: Configuring as keyboard
(II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "evdev"
(**) Option "xkb_layout" "us"
(II) config/hal: Adding input device Power Button
(**) Power Button: always reports core events
(**) Power Button: Device: "/dev/input/event4"
(II) Power Button: Found keys
(II) Power Button: Configuring as keyboard
(II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "evdev"
(**) Option "xkb_layout" "us"
(II) NOUVEAU(0): EDID vendor "IQT", prod id 36869
(II) NOUVEAU(0): Using hsync ranges from config file
(II) NOUVEAU(0): Using vrefresh ranges from config file
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.00  1680 1784 1960 2240  105=
0 1053 1059 1089 -hsync -vsync (65.2 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 =
605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 =
603 625 +hsync +vsync (35.2 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 4=
84 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 4=
92 520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 4=
86 525 -hsync -vsync (35.0 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 4=
92 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 4=
14 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 =
769 772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 =
771 777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 =
771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 =
628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 =
604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 =
643 666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 =
865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 =
903 909 934 -hsync +vsync (55.9 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0  136.75  1440 1536 1688 1936  900 =
903 909 942 -hsync +vsync (70.6 kHz)
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  105=
0 1053 1059 1089 -hsync +vsync (65.3 kHz)
(II) NOUVEAU(0): NVLeaveVT is called.
(II) Open ACPI successful (/var/run/acpid.socket)
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): EDID vendor "IQT", prod id 36869
(II) NOUVEAU(0): Using hsync ranges from config file
(II) NOUVEAU(0): Using vrefresh ranges from config file
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.00  1680 1784 1960 2240  105=
0 1053 1059 1089 -hsync -vsync (65.2 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 =
605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 =
603 625 +hsync +vsync (35.2 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 4=
84 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 4=
92 520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 4=
86 525 -hsync -vsync (35.0 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 4=
92 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 4=
14 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 =
769 772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 =
771 777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 =
771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 =
628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 =
604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 =
643 666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 =
865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 =
903 909 934 -hsync +vsync (55.9 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0  136.75  1440 1536 1688 1936  900 =
903 909 942 -hsync +vsync (70.6 kHz)
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  105=
0 1053 1059 1089 -hsync +vsync (65.3 kHz)
(II) Macintosh mouse button emulation: Device reopened after 1 attempts.
(II) ImPS/2 Generic Wheel Mouse: Device reopened after 1 attempts.
(II) AT Translated Set 2 keyboard: Device reopened after 1 attempts.
(II) Power Button: Device reopened after 1 attempts.
(II) Power Button: Device reopened after 1 attempts.
(II) Macintosh mouse button emulation: Close
(II) UnloadModule: "evdev"
(II) ImPS/2 Generic Wheel Mouse: Close
(II) UnloadModule: "evdev"
(II) AT Translated Set 2 keyboard: Close
(II) UnloadModule: "evdev"
(II) Power Button: Close
(II) UnloadModule: "evdev"
(II) Power Button: Close
(II) UnloadModule: "evdev"
(II) NOUVEAU(0): NVLeaveVT is called.
(II) NOUVEAU(0): Closed GPU channel 1


--=-NpiYJFbsx42Ym/L+tfOZ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-NpiYJFbsx42Ym/L+tfOZ--
