From: Alfred Zastrow <ml.zastrow-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Subject: Re: Looking for NV44 testers?
Date: Thu, 01 Nov 2007 14:08:54 +0100
Message-ID: <4729CFE6.50009@t-online.de>
References: <4729C32E.6050105@t-online.de>
	<6a89f9d50711010547q7d06da6dkf919852d87c717e5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50711010547q7d06da6dkf919852d87c717e5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Stephane Marchesin schrieb:

> Could you also please provide a matching kernel log ?


Is everthing in you want to know?

--------------- snipp------------


Linux version 2.6.23.1 (root@z1) (gcc version 4.2.2) #2 SMP PREEMPT Sun
Oct 21 08:05:02 CEST 2007
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
 BIOS-e820: 000000000009f000 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 00000000dfee0000 (usable)
 BIOS-e820: 00000000dfee0000 - 00000000dfee3000 (ACPI NVS)
 BIOS-e820: 00000000dfee3000 - 00000000dfef0000 (ACPI data)
 BIOS-e820: 00000000dfef0000 - 00000000dff00000 (reserved)
 BIOS-e820: 00000000f0000000 - 00000000f4000000 (reserved)
 BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
 BIOS-e820: 0000000100000000 - 0000000120000000 (usable)
3712MB HIGHMEM available.
896MB LOWMEM available.
found SMP MP-table at 000f5e30
NX (Execute Disable) protection: active
Entering add_active_range(0, 0, 1179648) 0 entries of 256 used
Zone PFN ranges:
  DMA             0 ->     4096
  Normal       4096 ->   229376
  HighMem    229376 ->  1179648
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0:        0 ->  1179648
On node 0 totalpages: 1179648
  DMA zone: 32 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 4064 pages, LIFO batch:0
  Normal zone: 1760 pages used for memmap
  Normal zone: 223520 pages, LIFO batch:31
  HighMem zone: 7424 pages used for memmap
  HighMem zone: 942848 pages, LIFO batch:31
  Movable zone: 0 pages used for memmap
DMI 2.4 present.
ACPI: RSDP 000F7BC0, 0024 (r2 Nvidia)
ACPI: XSDT DFEE3100, 004C (r1 Nvidia ASUSACPI 42302E31 AWRD        0)
ACPI: FACP DFEEC880, 00F4 (r3 Nvidia ASUSACPI 42302E31 AWRD        0)
ACPI: DSDT DFEE3280, 959D (r1 NVIDIA AWRDACPI     1000 MSFT  3000000)
ACPI: FACS DFEE0000, 0040
ACPI: SSDT DFEECA80, 0206 (r1 PTLTD  POWERNOW        1  LTP        1)
ACPI: HPET DFEECD00, 0038 (r1 Nvidia ASUSACPI 42302E31 AWRD       98)
ACPI: MCFG DFEECD80, 003C (r1 Nvidia ASUSACPI 42302E31 AWRD        0)
ACPI: APIC DFEEC9C0, 007C (r1 Nvidia ASUSACPI 42302E31 AWRD        0)
ACPI: PM-Timer IO Port: 0x1008
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
Processor #0 15:11 APIC version 16
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
Processor #1 15:11 APIC version 16
ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
IOAPIC[0]: apic_id 2, version 17, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 14 global_irq 14 high edge)
ACPI: INT_SRC_OVR (bus 0 bus_irq 15 global_irq 15 high edge)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
ACPI: IRQ14 used by override.
ACPI: IRQ15 used by override.
Enabling APIC mode:  Flat.  Using 1 I/O APICs
ACPI: HPET id: 0x10de8201 base: 0xfefff000
Using ACPI (MADT) for SMP configuration information
Allocating PCI resources starting at e0000000 (gap: dff00000:10100000)
swsusp: Registered nosave memory region: 000000000009f000 - 00000000000a0000
swsusp: Registered nosave memory region: 00000000000a0000 - 00000000000f0000
swsusp: Registered nosave memory region: 00000000000f0000 - 0000000000100000
Built 1 zonelists in Zone order.  Total pages: 1170432
Kernel command line: BOOT_IMAGE=old_kernel_up rw root=/dev/sda1 quiet
init=/usr/sbin/init
mapped APIC to ffffb000 (fee00000)
mapped IOAPIC to ffffa000 (fec00000)
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Initializing CPU#0
PID hash table entries: 4096 (order: 12, 16384 bytes)
Detected 2210.086 MHz processor.
spurious 8259A interrupt: IRQ7.
Console: colour VGA+ 80x25
console [tty0] enabled
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 4150980k/4718592k available (1881k kernel code, 41092k reserved,
707k data, 204k init, 3275648k highmem)
virtual kernel memory layout:
    fixmap  : 0xfff4d000 - 0xfffff000   ( 712 kB)
    pkmap   : 0xffc00000 - 0xffe00000   (2048 kB)
    vmalloc : 0xf8800000 - 0xffbfe000   ( 115 MB)
    lowmem  : 0xc0000000 - 0xf8000000   ( 896 MB)
      .init : 0xc038d000 - 0xc03c0000   ( 204 kB)
      .data : 0xc02d651e - 0xc03874cc   ( 707 kB)
      .text : 0xc0100000 - 0xc02d651e   (1881 kB)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
hpet0: at MMIO 0xfefff000, IRQs 2, 8, 31
hpet0: 3 32-bit timers, 25000000 Hz
Calibrating delay using timer specific routine.. 4423.68 BogoMIPS
(lpj=8847364)
Security Framework v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512
CPU: After generic identify, caps: 178bfbff ebd3fbff 00000000 00000000
00002001 00000000 0000001f 00000000
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
CPU 0(2) -> Core 0
CPU: After all inits, caps: 178bfbff ebd3fbff 00000000 00000410 00002001
00000000 0000001f 00000000
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
Compat vDSO mapped to ffffe000.
Checking 'hlt' instruction... OK.
SMP alternatives: switching to UP code
ACPI: Core revision 20070126
CPU0: AMD Athlon(tm) 64 X2 Dual Core Processor 4200+ stepping 02
SMP alternatives: switching to SMP code
Booting processor 1/1 eip 3000
Initializing CPU#1
Calibrating delay using timer specific routine.. 4420.12 BogoMIPS
(lpj=8840258)
CPU: After generic identify, caps: 178bfbff ebd3fbff 00000000 00000000
00002001 00000000 0000001f 00000000
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
CPU 1(2) -> Core 1
CPU: After all inits, caps: 178bfbff ebd3fbff 00000000 00000410 00002001
00000000 0000001f 00000000
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#1.
CPU1: AMD Athlon(tm) 64 X2 Dual Core Processor 4200+ stepping 02
Total of 2 processors activated (8843.81 BogoMIPS).
ENABLING IO-APIC IRQs
..TIMER: vector=0x31 apic1=0 pin1=2 apic2=-1 pin2=-1
Brought up 2 CPUs
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: Using MMCONFIG
PCI: No mmconfig possible on device 00:18
Setting up standard PCI resources
ACPI: EC: Look up EC in DSDT
ACPI: Interpreter enabled
ACPI: (supports S0 S1 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (0000:00)
PCI: Transparent bridge - 0000:00:0e.0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.HUB0._PRT]
ACPI: PCI Interrupt Link [LNK1] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNK2] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNK3] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNK4] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNK5] (IRQs 5 7 9 *10 11 14 15)
ACPI: PCI Interrupt Link [LNK6] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNK7] (IRQs 5 7 9 10 *11 14 15)
ACPI: PCI Interrupt Link [LNK8] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LP2P] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LUBA] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LMAC] (IRQs 5 7 9 *10 11 14 15)
ACPI: PCI Interrupt Link [LMC1] (IRQs 5 7 9 10 *11 14 15)
ACPI: PCI Interrupt Link [LAZA] (IRQs *5 7 9 10 11 14 15)
ACPI: PCI Interrupt Link [LPMU] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LSMB] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LUB2] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LIDE] (IRQs 5 7 9 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LSID] (IRQs *5 7 9 10 11 14 15)
ACPI: PCI Interrupt Link [LFID] (IRQs *5 7 9 10 11 14 15)
ACPI: PCI Interrupt Link [LSA2] (IRQs *5 7 9 10 11 14 15)
ACPI: PCI Interrupt Link [APC1] (IRQs 16) *0, disabled.
ACPI: PCI Interrupt Link [APC2] (IRQs 17) *0, disabled.
ACPI: PCI Interrupt Link [APC3] (IRQs 18) *0, disabled.
ACPI: PCI Interrupt Link [APC4] (IRQs 19) *0, disabled.
ACPI: PCI Interrupt Link [APC5] (IRQs 16) *0
ACPI: PCI Interrupt Link [APC6] (IRQs 16) *0, disabled.
ACPI: PCI Interrupt Link [APC7] (IRQs 16) *0
ACPI: PCI Interrupt Link [APC8] (IRQs 16) *0, disabled.
ACPI: PCI Interrupt Link [APCF] (IRQs 20 21 22 23) *0, disabled.
ACPI: PCI Interrupt Link [APCH] (IRQs 20 21 22 23) *0
ACPI: PCI Interrupt Link [AMC1] (IRQs 20 21 22 23) *0
ACPI: PCI Interrupt Link [APMU] (IRQs 20 21 22 23) *0, disabled.
ACPI: PCI Interrupt Link [AAZA] (IRQs 20 21 22 23) *0
ACPI: PCI Interrupt Link [APCS] (IRQs 20 21 22 23) *0, disabled.
ACPI: PCI Interrupt Link [APCL] (IRQs 20 21 22 23) *0, disabled.
ACPI: PCI Interrupt Link [APCM] (IRQs 20 21 22 23) *0, disabled.
ACPI: PCI Interrupt Link [APCZ] (IRQs 20 21 22 23) *0, disabled.
ACPI: PCI Interrupt Link [APSI] (IRQs 20 21 22 23) *0
ACPI: PCI Interrupt Link [APSJ] (IRQs 20 21 22 23) *0
ACPI: PCI Interrupt Link [ASA2] (IRQs 20 21 22 23) *0
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 13 devices
ACPI: ACPI bus type pnp unregistered
SCSI subsystem initialized
libata version 2.21 loaded.
PCI: Using ACPI for IRQ routing
PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a
report
ACPI: RTC can wake from S4
Time: hpet clocksource has been installed.
Switched to high resolution mode on CPU 0
Switched to high resolution mode on CPU 1
pnp: 00:01: ioport range 0x1000-0x107f has been reserved
pnp: 00:01: ioport range 0x1080-0x10ff has been reserved
pnp: 00:01: ioport range 0x1400-0x147f has been reserved
pnp: 00:01: ioport range 0x1480-0x14ff has been reserved
pnp: 00:01: ioport range 0x1800-0x187f has been reserved
pnp: 00:01: ioport range 0x1880-0x18ff has been reserved
pnp: 00:0b: iomem range 0xf0000000-0xf3ffffff could not be reserved
pnp: 00:0c: iomem range 0xea200-0xebfff has been reserved
pnp: 00:0c: iomem range 0xf0000-0xf7fff could not be reserved
pnp: 00:0c: iomem range 0xf8000-0xfbfff could not be reserved
pnp: 00:0c: iomem range 0xfc000-0xfffff could not be reserved
PCI: Bridge: 0000:00:04.0
  IO window: disabled.
  MEM window: fa000000-fcffffff
  PREFETCH window: e0000000-efffffff
PCI: Bridge: 0000:00:0e.0
  IO window: disabled.
  MEM window: fde00000-fdefffff
  PREFETCH window: fdf00000-fdffffff
PCI: Bridge: 0000:00:16.0
  IO window: a000-afff
  MEM window: fdd00000-fddfffff
  PREFETCH window: disabled.
PCI: Setting latency timer of device 0000:00:04.0 to 64
PCI: Setting latency timer of device 0000:00:0e.0 to 64
PCI: Setting latency timer of device 0000:00:16.0 to 64
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 9, 2097152 bytes)
TCP bind hash table entries: 65536 (order: 7, 786432 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
Machine check exception polling timer started.
highmem bounce pool size: 64 pages
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler cfq registered (default)
Boot video device is 0000:01:00.0
PCI: Setting latency timer of device 0000:00:04.0 to 64
assign_interrupt_mode Found MSI capability
Allocate Port Service[0000:00:04.0:pcie00]
Allocate Port Service[0000:00:04.0:pcie03]
PCI: Setting latency timer of device 0000:00:16.0 to 64
assign_interrupt_mode Found MSI capability
Allocate Port Service[0000:00:16.0:pcie00]
Allocate Port Service[0000:00:16.0:pcie03]
ACPI: PCI Interrupt Link [APC5] enabled at IRQ 16
ACPI: PCI Interrupt 0000:01:00.0[A] -> Link [APC5] -> GSI 16 (level,
low) -> IRQ 16
nvidiafb: Device ID: 10de0161
nvidiafb: CRTC0 analog not found
nvidiafb: CRTC1 analog not found
i2c-adapter i2c-0: unable to read EDID block.
i2c-adapter i2c-0: unable to read EDID block.
i2c-adapter i2c-0: unable to read EDID block.
i2c-adapter i2c-1: unable to read EDID block.
i2c-adapter i2c-1: unable to read EDID block.
i2c-adapter i2c-1: unable to read EDID block.
nvidiafb: CRTC 0 is currently programmed for DFP
nvidiafb: Using DFP on CRTC 0
nvidiafb: Panel size is 1400 x 1050
nvidiafb: Panel is TMDS
nvidiafb: MTRR set to ON
fbcvt: 1400x1050@60: CVT Name - 1.470M3-R
nvidiafb: Flat panel dithering disabled
Console: switching to colour frame buffer device 175x65
nvidiafb: PCI nVidia NV16 framebuffer (64MB @ 0xE0000000)
vga16fb: initializing
vga16fb: mapped to 0xc00a0000
fb1: VGA16 VGA frame buffer device
hpet_resources: 0xfefff000 is busy
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Probing IDE interface ide0...
hda: PLEXTOR CD-R PX-W4012A, ATAPI CD/DVD-ROM drive
hdb: _NEC DVD_RW ND-3500AG, ATAPI CD/DVD-ROM drive
Probing IDE interface ide1...
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
sata_sil24 0000:03:00.0: version 1.0
ACPI: PCI Interrupt Link [APC7] enabled at IRQ 16
ACPI: PCI Interrupt 0000:03:00.0[A] -> Link [APC7] -> GSI 16 (level,
low) -> IRQ 16
PCI: Setting latency timer of device 0000:03:00.0 to 64
scsi0 : sata_sil24
scsi1 : sata_sil24
ata1: SATA max UDMA/100 cmd 0xf8840000 ctl 0x00000000 bmdma 0x00000000
irq 16
ata2: SATA max UDMA/100 cmd 0xf8842000 ctl 0x00000000 bmdma 0x00000000
irq 16
ata1: SATA link down (SStatus 0 SControl 300)
ata2: SATA link down (SStatus 0 SControl 300)
sata_nv 0000:00:0d.0: version 3.5
ACPI: PCI Interrupt Link [APSI] enabled at IRQ 23
ACPI: PCI Interrupt 0000:00:0d.0[A] -> Link [APSI] -> GSI 23 (level,
low) -> IRQ 17
PCI: Setting latency timer of device 0000:00:0d.0 to 64
scsi2 : sata_nv
scsi3 : sata_nv
ata3: SATA max UDMA/133 cmd 0x000109f0 ctl 0x00010bf2 bmdma 0x0001e000
irq 17
ata4: SATA max UDMA/133 cmd 0x00010970 ctl 0x00010b72 bmdma 0x0001e008
irq 17
ata3: SATA link down (SStatus 0 SControl 300)
ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata4.00: ATA-7: ST3500641NS, 3.AEC, max UDMA/133
ata4.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 0/32)
ata4.00: configured for UDMA/133
scsi 3:0:0:0: Direct-Access     ATA      ST3500641NS      3.AE PQ: 0 ANSI: 5
sd 3:0:0:0: [sda] 976773168 512-byte hardware sectors (500108 MB)
sd 3:0:0:0: [sda] Write Protect is off
sd 3:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't
support DPO or FUA
sd 3:0:0:0: [sda] 976773168 512-byte hardware sectors (500108 MB)
sd 3:0:0:0: [sda] Write Protect is off
sd 3:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't
support DPO or FUA
 sda: sda1 sda2
sd 3:0:0:0: [sda] Attached SCSI disk
ACPI: PCI Interrupt Link [APSJ] enabled at IRQ 22
ACPI: PCI Interrupt 0000:00:0d.1[B] -> Link [APSJ] -> GSI 22 (level,
low) -> IRQ 18
PCI: Setting latency timer of device 0000:00:0d.1 to 64
scsi4 : sata_nv
scsi5 : sata_nv
ata5: SATA max UDMA/133 cmd 0x000109e0 ctl 0x00010be2 bmdma 0x0001cc00
irq 18
ata6: SATA max UDMA/133 cmd 0x00010960 ctl 0x00010b62 bmdma 0x0001cc08
irq 18
ata5: SATA link down (SStatus 0 SControl 300)
ata6: SATA link down (SStatus 0 SControl 300)
ACPI: PCI Interrupt Link [ASA2] enabled at IRQ 21
ACPI: PCI Interrupt 0000:00:0d.2[C] -> Link [ASA2] -> GSI 21 (level,
low) -> IRQ 19
PCI: Setting latency timer of device 0000:00:0d.2 to 64
scsi6 : sata_nv
scsi7 : sata_nv
ata7: SATA max UDMA/133 cmd 0x0001c800 ctl 0x0001c402 bmdma 0x0001b800
irq 19
ata8: SATA max UDMA/133 cmd 0x0001c000 ctl 0x0001bc02 bmdma 0x0001b808
irq 19
ata7: SATA link down (SStatus 0 SControl 300)
ata8: SATA link down (SStatus 0 SControl 300)
PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
PNP: PS/2 appears to have AUX port disabled, if this is incorrect please
boot with i8042.nopnp
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
input: AT Translated Set 2 keyboard as /class/input/input0
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Using IPI No-Shortcut mode
ReiserFS: sda1: found reiserfs format "3.6" with standard journal
ReiserFS: sda1: using ordered data mode
ReiserFS: sda1: journal params: device sda1, size 8192, journal first
block 18, max trans len 1024, max batch 900, max commit age 30, max
trans age 30
ReiserFS: sda1: checking transaction log (sda1)
ReiserFS: sda1: replayed 74 transactions in 3 seconds
ReiserFS: sda1: Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem).
Freeing unused kernel memory: 204k freed
hda: ATAPI 40X CD-ROM CD-R/RW drive, 4096kB Cache
Uniform CD-ROM driver Revision: 3.20
hdb: ATAPI 48X DVD-ROM DVD-R CD-R/RW drive, 2048kB Cache
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
ACPI: PCI Interrupt Link [APCL] enabled at IRQ 20
ACPI: PCI Interrupt 0000:00:0a.1[B] -> Link [APCL] -> GSI 20 (level,
low) -> IRQ 20
PCI: Setting latency timer of device 0000:00:0a.1 to 64
ehci_hcd 0000:00:0a.1: EHCI Host Controller
ehci_hcd 0000:00:0a.1: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:0a.1: debug port 1
PCI: cache line size of 64 is not supported by device 0000:00:0a.1
ehci_hcd 0000:00:0a.1: irq 20, io mem 0xfe02e000
ehci_hcd 0000:00:0a.1: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 10 ports detected
input: Power Button (FF) as /class/input/input1
ACPI: Power Button (FF) [PWRF]
input: Power Button (CM) as /class/input/input2
ACPI: Power Button (CM) [PWRB]
ACPI: PCI Interrupt Link [AAZA] enabled at IRQ 23
ACPI: PCI Interrupt 0000:00:0e.1[B] -> Link [AAZA] -> GSI 23 (level,
low) -> IRQ 17
PCI: Setting latency timer of device 0000:00:0e.1 to 64
forcedeth.c: Reverse Engineered nForce ethernet driver. Version 0.60.
ACPI: PCI Interrupt Link [APCH] enabled at IRQ 22
ACPI: PCI Interrupt 0000:00:10.0[A] -> Link [APCH] -> GSI 22 (level,
low) -> IRQ 18
PCI: Setting latency timer of device 0000:00:10.0 to 64
forcedeth: using HIGHDMA
sd 3:0:0:0: Attached scsi generic sg0 type 0
usb 1-9: new high speed USB device using ehci_hcd and address 3
usb 1-9: configuration #1 chosen from 1 choice
eth0: forcedeth.c: subsystem: 01043:cb84 bound to 0000:00:10.0
ACPI: PCI Interrupt Link [AMC1] enabled at IRQ 21
ACPI: PCI Interrupt 0000:00:11.0[A] -> Link [AMC1] -> GSI 21 (level,
low) -> IRQ 19
PCI: Setting latency timer of device 0000:00:11.0 to 64
forcedeth: using HIGHDMA
ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
ACPI: Fan [FAN] (on)
Linux video capture interface: v2.00
NET: Registered protocol family 10
eth1: forcedeth.c: subsystem: 01043:cb84 bound to 0000:00:11.0
i2c-adapter i2c-3: nForce2 SMBus adapter at 0x1c00
i2c-adapter i2c-4: nForce2 SMBus adapter at 0x1c40
ACPI: PCI Interrupt Link [APCF] enabled at IRQ 20
ACPI: PCI Interrupt 0000:00:0a.0[A] -> Link [APCF] -> GSI 20 (level,
low) -> IRQ 20
PCI: Setting latency timer of device 0000:00:0a.0 to 64
ohci_hcd 0000:00:0a.0: OHCI Host Controller
ohci_hcd 0000:00:0a.0: new USB bus registered, assigned bus number 2
ohci_hcd 0000:00:0a.0: irq 20, io mem 0xfe02f000
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 10 ports detected
ACPI: PCI Interrupt Link [APC2] enabled at IRQ 17
ACPI: PCI Interrupt 0000:02:07.1[A] -> Link [APC2] -> GSI 17 (level,
low) -> IRQ 21
usb 2-2: new low speed USB device using ohci_hcd and address 2
bttv: driver version 0.9.17 loaded
bttv: using 8 buffers with 2080k (520 pages) each for capture
bttv: Bt8xx card found (0).
ACPI: PCI Interrupt 0000:02:07.0[A] -> Link [APC2] -> GSI 17 (level,
low) -> IRQ 21
bttv0: Bt878 (rev 2) at 0000:02:07.0, irq: 21, latency: 32, mmio: 0xfdfff000
bttv0: detected: Hauppauge WinTV [card=10], PCI subsystem ID is 0070:13eb
bttv0: using: Hauppauge (bt878) [card=10,autodetected]
bttv0: gpio: en=00000000, out=00000000 in=00ffffdb [init]
bttv0: Hauppauge/Voodoo msp34xx: reset line init [5]
tveeprom 5-0050: Hauppauge model 61334, rev A1B , serial# 607188
tveeprom 5-0050: tuner model is Philips FM1216 (idx 21, type 5)
tveeprom 5-0050: TV standards PAL(B/G) (eeprom 0x04)
tveeprom 5-0050: audio processor is MSP3415 (idx 6)
tveeprom 5-0050: has radio
bttv0: Hauppauge eeprom indicates model#61334
bttv0: tuner type=5
bttv0: i2c: checking for MSP34xx @ 0x80... found
msp3400 5-0040: MSP3410D-B4 found @ 0x80 (bt878 #0 [sw])
msp3400 5-0040: MSP3410D-B4 supports nicam, mode is autodetect
bttv0: i2c: checking for TDA9875 @ 0xb0... not found
bttv0: i2c: checking for TDA7432 @ 0x8a... not found
tuner 5-0061: chip found @ 0xc2 (bt878 #0 [sw])
tuner 5-0061: type set to 5 (Philips PAL_BG (FI1216 and compatibles))
tuner 5-0061: type set to 5 (Philips PAL_BG (FI1216 and compatibles))
bttv0: registered device video0
bttv0: registered device vbi0
bttv0: registered device radio0
bttv0: PLL: 28636363 => 35468950 ..<6>usb 2-2: configuration #1 chosen
from 1 choice
 ok
wmaster0: Selected rate control algorithm 'simple'
phy0: hwaddr 00:15:af:01:80:bd, rtl8187 V1 + rtl8225z2
usbcore: registered new interface driver rtl8187
eth1: no link during initialization.
ADDRCONF(NETDEV_UP): eth1: link is not ready
eth0: no link during initialization.
ADDRCONF(NETDEV_UP): eth0: link is not ready
input: USB HIDBP Mouse 062a:0000 as /class/input/input3
usbcore: registered new interface driver usbmouse
drivers/hid/usbhid/usbmouse.c: v1.6:USB HID Boot Protocol mouse driver
eth0: link up.
ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Adding 19286024k swap on /dev/sda2.  Priority:1 extents:1 across:19286024k
tsdev (compaq touchscreen emulation) is scheduled for removal.
See Documentation/feature-removal-schedule.txt for details.
eth0: no IPv6 routers present
Linux agpgart interface v0.102
[drm] Initialized drm 1.1.0 20060810
PCI: Setting latency timer of device 0000:01:00.0 to 64
[drm] Detected an NV44 generation card (0x044100a2)
[drm] Initialized nouveau 0.0.10 20060213 on minor 0
[drm] Used old pci detect: framebuffer loaded
