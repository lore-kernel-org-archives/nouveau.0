From: Alfred Zastrow <ml.zastrow-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Subject: Re: Looking for NV44 testers?
Date: Thu, 01 Nov 2007 15:09:49 +0100
Message-ID: <4729DE2D.7050809@t-online.de>
References: <4729C32E.6050105@t-online.de>
	<20071101132746.47eb359a.arthur.huillet@agoctrl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20071101132746.47eb359a.arthur.huillet-y3fenRfD+QpAfugRpC6u6w@public.gmane.org>
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

Arthur Huillet schrieb:

> please use a serial console or some other means of getting the full kernel log available to you,
> then load drm.ko with debug=1, and send us the kernel log :)
>
> Thanks for your help

You are wellcome  :-)

The last kernel I used had the nvidia-fb copiled in. As Stephane
recommended I compiled a new kernel featuring this as module without
loading it.

Here is the next crash with "drm debug=1"


Nov  1 14:53:24 z1 kernel: Linux version 2.6.23.1 (root@z1) (gcc version
4.2.2) #2 SMP PREEMPT Sun Oct 21 08:05:02 CEST 2007
Nov  1 14:53:24 z1 kernel: BIOS-provided physical RAM map:
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 0000000000000000 -
000000000009f000 (usable)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 000000000009f000 -
00000000000a0000 (reserved)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 00000000000f0000 -
0000000000100000 (reserved)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 0000000000100000 -
00000000dfee0000 (usable)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 00000000dfee0000 -
00000000dfee3000 (ACPI NVS)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 00000000dfee3000 -
00000000dfef0000 (ACPI data)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 00000000dfef0000 -
00000000dff00000 (reserved)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 00000000f0000000 -
00000000f4000000 (reserved)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 00000000fec00000 -
0000000100000000 (reserved)
Nov  1 14:53:24 z1 kernel:  BIOS-e820: 0000000100000000 -
0000000120000000 (usable)
Nov  1 14:53:24 z1 kernel: 3712MB HIGHMEM available.
Nov  1 14:53:24 z1 kernel: 896MB LOWMEM available.
Nov  1 14:53:24 z1 kernel: found SMP MP-table at 000f5e30
Nov  1 14:53:24 z1 kernel: NX (Execute Disable) protection: active
Nov  1 14:53:24 z1 kernel: Entering add_active_range(0, 0, 1179648) 0
entries of 256 used
Nov  1 14:53:24 z1 kernel: Zone PFN ranges:
Nov  1 14:53:24 z1 kernel:   DMA             0 ->     4096
Nov  1 14:53:24 z1 kernel:   Normal       4096 ->   229376
Nov  1 14:53:24 z1 kernel:   HighMem    229376 ->  1179648
Nov  1 14:53:24 z1 kernel: Movable zone start PFN for each node
Nov  1 14:53:24 z1 kernel: early_node_map[1] active PFN ranges
Nov  1 14:53:24 z1 kernel:     0:        0 ->  1179648
Nov  1 14:53:24 z1 kernel: On node 0 totalpages: 1179648
Nov  1 14:53:24 z1 kernel:   DMA zone: 32 pages used for memmap
Nov  1 14:53:24 z1 kernel:   DMA zone: 0 pages reserved
Nov  1 14:53:24 z1 kernel:   DMA zone: 4064 pages, LIFO batch:0
Nov  1 14:53:24 z1 kernel:   Normal zone: 1760 pages used for memmap
Nov  1 14:53:24 z1 kernel:   Normal zone: 223520 pages, LIFO batch:31
Nov  1 14:53:24 z1 kernel:   HighMem zone: 7424 pages used for memmap
Nov  1 14:53:24 z1 kernel:   HighMem zone: 942848 pages, LIFO batch:31
Nov  1 14:53:24 z1 kernel:   Movable zone: 0 pages used for memmap
Nov  1 14:53:24 z1 kernel: DMI 2.4 present.
Nov  1 14:53:24 z1 kernel: ACPI: RSDP 000F7BC0, 0024 (r2 Nvidia)
Nov  1 14:53:24 z1 kernel: ACPI: XSDT DFEE3100, 004C (r1 Nvidia ASUSACPI
42302E31 AWRD        0)
Nov  1 14:53:24 z1 kernel: ACPI: FACP DFEEC880, 00F4 (r3 Nvidia ASUSACPI
42302E31 AWRD        0)
Nov  1 14:53:24 z1 kernel: ACPI: DSDT DFEE3280, 959D (r1 NVIDIA AWRDACPI
    1000 MSFT  3000000)
Nov  1 14:53:24 z1 kernel: ACPI: FACS DFEE0000, 0040
Nov  1 14:53:24 z1 kernel: ACPI: SSDT DFEECA80, 0206 (r1 PTLTD  POWERNOW
       1  LTP        1)
Nov  1 14:53:24 z1 kernel: ACPI: HPET DFEECD00, 0038 (r1 Nvidia ASUSACPI
42302E31 AWRD       98)
Nov  1 14:53:24 z1 kernel: ACPI: MCFG DFEECD80, 003C (r1 Nvidia ASUSACPI
42302E31 AWRD        0)
Nov  1 14:53:24 z1 kernel: ACPI: APIC DFEEC9C0, 007C (r1 Nvidia ASUSACPI
42302E31 AWRD        0)
Nov  1 14:53:24 z1 kernel: ACPI: PM-Timer IO Port: 0x1008
Nov  1 14:53:24 z1 kernel: ACPI: Local APIC address 0xfee00000
Nov  1 14:53:24 z1 kernel: ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00]
enabled)
Nov  1 14:53:24 z1 kernel: Processor #0 15:11 APIC version 16
Nov  1 14:53:24 z1 kernel: ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01]
enabled)
Nov  1 14:53:24 z1 kernel: Processor #1 15:11 APIC version 16
Nov  1 14:53:24 z1 kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high edge
lint[0x1])
Nov  1 14:53:24 z1 kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge
lint[0x1])
Nov  1 14:53:24 z1 kernel: ACPI: IOAPIC (id[0x02] address[0xfec00000]
gsi_base[0])
Nov  1 14:53:24 z1 kernel: IOAPIC[0]: apic_id 2, version 17, address
0xfec00000, GSI 0-23
Nov  1 14:53:24 z1 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq
2 dfl dfl)
Nov  1 14:53:24 z1 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq
9 high level)
Nov  1 14:53:24 z1 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 14
global_irq 14 high edge)
Nov  1 14:53:24 z1 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 15
global_irq 15 high edge)
Nov  1 14:53:24 z1 kernel: ACPI: IRQ0 used by override.
Nov  1 14:53:24 z1 kernel: ACPI: IRQ2 used by override.
Nov  1 14:53:24 z1 kernel: ACPI: IRQ9 used by override.
Nov  1 14:53:24 z1 kernel: ACPI: IRQ14 used by override.
Nov  1 14:53:24 z1 kernel: ACPI: IRQ15 used by override.
Nov  1 14:53:24 z1 kernel: Enabling APIC mode:  Flat.  Using 1 I/O APICs
Nov  1 14:53:24 z1 kernel: ACPI: HPET id: 0x10de8201 base: 0xfefff000
Nov  1 14:53:24 z1 kernel: Using ACPI (MADT) for SMP configuration
information
Nov  1 14:53:24 z1 kernel: Allocating PCI resources starting at e0000000
(gap: dff00000:10100000)
Nov  1 14:53:24 z1 kernel: swsusp: Registered nosave memory region:
000000000009f000 - 00000000000a0000
Nov  1 14:53:24 z1 kernel: swsusp: Registered nosave memory region:
00000000000a0000 - 00000000000f0000
Nov  1 14:53:24 z1 kernel: swsusp: Registered nosave memory region:
00000000000f0000 - 0000000000100000
Nov  1 14:53:24 z1 kernel: Built 1 zonelists in Zone order.  Total
pages: 1170432
Nov  1 14:53:24 z1 kernel: Kernel command line: BOOT_IMAGE=old_kernel_up
rw root=/dev/sda1 quiet init=/usr/sbin/init
Nov  1 14:53:24 z1 kernel: mapped APIC to ffffb000 (fee00000)
Nov  1 14:53:24 z1 kernel: mapped IOAPIC to ffffa000 (fec00000)
Nov  1 14:53:24 z1 kernel: Enabling fast FPU save and restore... done.
Nov  1 14:53:24 z1 kernel: Enabling unmasked SIMD FPU exception
support... done.
Nov  1 14:53:24 z1 kernel: Initializing CPU#0
Nov  1 14:53:24 z1 kernel: PID hash table entries: 4096 (order: 12,
16384 bytes)
Nov  1 14:53:24 z1 kernel: Detected 2210.113 MHz processor.
Nov  1 14:53:24 z1 kernel: spurious 8259A interrupt: IRQ7.
Nov  1 14:53:24 z1 kernel: Console: colour VGA+ 80x25
Nov  1 14:53:24 z1 kernel: console [tty0] enabled
Nov  1 14:53:24 z1 kernel: Dentry cache hash table entries: 131072
(order: 7, 524288 bytes)
Nov  1 14:53:24 z1 kernel: Inode-cache hash table entries: 65536 (order:
6, 262144 bytes)
Nov  1 14:53:24 z1 kernel: Memory: 4150980k/4718592k available (1881k
kernel code, 41092k reserved, 707k data, 204k init, 3275648k highmem)
Nov  1 14:53:24 z1 kernel: virtual kernel memory layout:
Nov  1 14:53:24 z1 kernel:     fixmap  : 0xfff4d000 - 0xfffff000   ( 712
kB)
Nov  1 14:53:24 z1 kernel:     pkmap   : 0xffc00000 - 0xffe00000   (2048
kB)
Nov  1 14:53:24 z1 kernel:     vmalloc : 0xf8800000 - 0xffbfe000   ( 115
MB)
Nov  1 14:53:24 z1 kernel:     lowmem  : 0xc0000000 - 0xf8000000   ( 896
MB)
Nov  1 14:53:24 z1 kernel:       .init : 0xc038d000 - 0xc03c0000   ( 204
kB)
Nov  1 14:53:24 z1 kernel:       .data : 0xc02d651e - 0xc03874cc   ( 707
kB)
Nov  1 14:53:24 z1 kernel:       .text : 0xc0100000 - 0xc02d651e   (1881
kB)
Nov  1 14:53:24 z1 kernel: Checking if this processor honours the WP bit
even in supervisor mode... Ok.
Nov  1 14:53:24 z1 kernel: hpet0: at MMIO 0xfefff000, IRQs 2, 8, 31
Nov  1 14:53:24 z1 kernel: hpet0: 3 32-bit timers, 25000000 Hz
Nov  1 14:53:24 z1 kernel: Calibrating delay using timer specific
routine.. 4423.66 BogoMIPS (lpj=8847321)
Nov  1 14:53:24 z1 kernel: Security Framework v1.0.0 initialized
Nov  1 14:53:24 z1 kernel: Capability LSM initialized
Nov  1 14:53:24 z1 kernel: Mount-cache hash table entries: 512
Nov  1 14:53:24 z1 kernel: CPU: After generic identify, caps: 178bfbff
ebd3fbff 00000000 00000000 00002001 00000000 0000001f 00000000
Nov  1 14:53:24 z1 kernel: CPU: L1 I Cache: 64K (64 bytes/line), D cache
64K (64 bytes/line)
Nov  1 14:53:24 z1 kernel: CPU: L2 Cache: 512K (64 bytes/line)
Nov  1 14:53:24 z1 kernel: CPU 0(2) -> Core 0
Nov  1 14:53:24 z1 kernel: CPU: After all inits, caps: 178bfbff ebd3fbff
00000000 00000410 00002001 00000000 0000001f 00000000
Nov  1 14:53:24 z1 kernel: Intel machine check architecture supported.
Nov  1 14:53:24 z1 kernel: Intel machine check reporting enabled on CPU#0.
Nov  1 14:53:24 z1 kernel: Compat vDSO mapped to ffffe000.
Nov  1 14:53:24 z1 kernel: Checking 'hlt' instruction... OK.
Nov  1 14:53:24 z1 kernel: SMP alternatives: switching to UP code
Nov  1 14:53:24 z1 kernel: ACPI: Core revision 20070126
Nov  1 14:53:24 z1 kernel: CPU0: AMD Athlon(tm) 64 X2 Dual Core
Processor 4200+ stepping 02
Nov  1 14:53:24 z1 kernel: SMP alternatives: switching to SMP code
Nov  1 14:53:24 z1 kernel: Booting processor 1/1 eip 3000
Nov  1 14:53:24 z1 kernel: Initializing CPU#1
Nov  1 14:53:24 z1 kernel: Calibrating delay using timer specific
routine.. 4420.13 BogoMIPS (lpj=8840270)
Nov  1 14:53:24 z1 kernel: CPU: After generic identify, caps: 178bfbff
ebd3fbff 00000000 00000000 00002001 00000000 0000001f 00000000
Nov  1 14:53:24 z1 kernel: CPU: L1 I Cache: 64K (64 bytes/line), D cache
64K (64 bytes/line)
Nov  1 14:53:24 z1 kernel: CPU: L2 Cache: 512K (64 bytes/line)
Nov  1 14:53:24 z1 kernel: CPU 1(2) -> Core 1
Nov  1 14:53:24 z1 kernel: CPU: After all inits, caps: 178bfbff ebd3fbff
00000000 00000410 00002001 00000000 0000001f 00000000
Nov  1 14:53:24 z1 kernel: Intel machine check architecture supported.
Nov  1 14:53:24 z1 kernel: Intel machine check reporting enabled on CPU#1.
Nov  1 14:53:24 z1 kernel: CPU1: AMD Athlon(tm) 64 X2 Dual Core
Processor 4200+ stepping 02
Nov  1 14:53:24 z1 kernel: Total of 2 processors activated (8843.79
BogoMIPS).
Nov  1 14:53:24 z1 kernel: ENABLING IO-APIC IRQs
Nov  1 14:53:24 z1 kernel: ..TIMER: vector=0x31 apic1=0 pin1=2 apic2=-1
pin2=-1
Nov  1 14:53:24 z1 kernel: Brought up 2 CPUs
Nov  1 14:53:24 z1 kernel: NET: Registered protocol family 16
Nov  1 14:53:24 z1 kernel: ACPI: bus type pci registered
Nov  1 14:53:24 z1 kernel: PCI: Using MMCONFIG
Nov  1 14:53:24 z1 kernel: PCI: No mmconfig possible on device 00:18
Nov  1 14:53:24 z1 kernel: Setting up standard PCI resources
Nov  1 14:53:24 z1 kernel: ACPI: EC: Look up EC in DSDT
Nov  1 14:53:24 z1 kernel: ACPI: Interpreter enabled
Nov  1 14:53:24 z1 kernel: ACPI: (supports S0 S1 S3 S4 S5)
Nov  1 14:53:24 z1 kernel: ACPI: Using IOAPIC for interrupt routing
Nov  1 14:53:24 z1 kernel: ACPI: PCI Root Bridge [PCI0] (0000:00)
Nov  1 14:53:24 z1 kernel: PCI: Transparent bridge - 0000:00:0e.0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Routing Table
[\_SB_.PCI0._PRT]
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Routing Table
[\_SB_.PCI0.HUB0._PRT]
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK1] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK2] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK3] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK4] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK5] (IRQs 5 7 9
*10 11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK6] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK7] (IRQs 5 7 9
10 *11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LNK8] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LP2P] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LUBA] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LMAC] (IRQs 5 7 9
*10 11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LMC1] (IRQs 5 7 9
10 *11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LAZA] (IRQs *5 7 9
10 11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LPMU] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LSMB] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LUB2] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LIDE] (IRQs 5 7 9
10 11 14 15) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LSID] (IRQs *5 7 9
10 11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LFID] (IRQs *5 7 9
10 11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [LSA2] (IRQs *5 7 9
10 11 14 15)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC1] (IRQs 16) *0,
disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC2] (IRQs 17) *0,
disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC3] (IRQs 18) *0,
disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC4] (IRQs 19) *0,
disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC5] (IRQs 16) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC6] (IRQs 16) *0,
disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC7] (IRQs 16) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC8] (IRQs 16) *0,
disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCF] (IRQs 20 21
22 23) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCH] (IRQs 20 21
22 23) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [AMC1] (IRQs 20 21
22 23) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APMU] (IRQs 20 21
22 23) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [AAZA] (IRQs 20 21
22 23) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCS] (IRQs 20 21
22 23) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCL] (IRQs 20 21
22 23) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCM] (IRQs 20 21
22 23) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCZ] (IRQs 20 21
22 23) *0, disabled.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APSI] (IRQs 20 21
22 23) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APSJ] (IRQs 20 21
22 23) *0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [ASA2] (IRQs 20 21
22 23) *0
Nov  1 14:53:24 z1 kernel: Linux Plug and Play Support v0.97 (c) Adam Belay
Nov  1 14:53:24 z1 kernel: pnp: PnP ACPI init
Nov  1 14:53:24 z1 kernel: ACPI: bus type pnp registered
Nov  1 14:53:24 z1 kernel: pnp: PnP ACPI: found 13 devices
Nov  1 14:53:24 z1 kernel: ACPI: ACPI bus type pnp unregistered
Nov  1 14:53:24 z1 kernel: SCSI subsystem initialized
Nov  1 14:53:24 z1 kernel: libata version 2.21 loaded.
Nov  1 14:53:24 z1 kernel: PCI: Using ACPI for IRQ routing
Nov  1 14:53:24 z1 kernel: PCI: If a device doesn't work, try
"pci=routeirq".  If it helps, post a report
Nov  1 14:53:24 z1 kernel: ACPI: RTC can wake from S4
Nov  1 14:53:24 z1 kernel: Time: hpet clocksource has been installed.
Nov  1 14:53:24 z1 kernel: Switched to high resolution mode on CPU 0
Nov  1 14:53:24 z1 kernel: Switched to high resolution mode on CPU 1
Nov  1 14:53:24 z1 kernel: pnp: 00:01: ioport range 0x1000-0x107f has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:01: ioport range 0x1080-0x10ff has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:01: ioport range 0x1400-0x147f has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:01: ioport range 0x1480-0x14ff has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:01: ioport range 0x1800-0x187f has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:01: ioport range 0x1880-0x18ff has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:0b: iomem range 0xf0000000-0xf3ffffff
could not be reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:0c: iomem range 0xea200-0xebfff has
been reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:0c: iomem range 0xf0000-0xf7fff could
not be reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:0c: iomem range 0xf8000-0xfbfff could
not be reserved
Nov  1 14:53:24 z1 kernel: pnp: 00:0c: iomem range 0xfc000-0xfffff could
not be reserved
Nov  1 14:53:24 z1 kernel: PCI: Bridge: 0000:00:04.0
Nov  1 14:53:24 z1 kernel:   IO window: disabled.
Nov  1 14:53:24 z1 kernel:   MEM window: fa000000-fcffffff
Nov  1 14:53:24 z1 kernel:   PREFETCH window: e0000000-efffffff
Nov  1 14:53:24 z1 kernel: PCI: Bridge: 0000:00:0e.0
Nov  1 14:53:24 z1 kernel:   IO window: disabled.
Nov  1 14:53:24 z1 kernel:   MEM window: fde00000-fdefffff
Nov  1 14:53:24 z1 kernel:   PREFETCH window: fdf00000-fdffffff
Nov  1 14:53:24 z1 kernel: PCI: Bridge: 0000:00:16.0
Nov  1 14:53:24 z1 kernel:   IO window: a000-afff
Nov  1 14:53:24 z1 kernel:   MEM window: fdd00000-fddfffff
Nov  1 14:53:24 z1 kernel:   PREFETCH window: disabled.
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:04.0 to 64
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:0e.0 to 64
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:16.0 to 64
Nov  1 14:53:24 z1 kernel: NET: Registered protocol family 2
Nov  1 14:53:24 z1 kernel: IP route cache hash table entries: 32768
(order: 5, 131072 bytes)
Nov  1 14:53:24 z1 kernel: TCP established hash table entries: 131072
(order: 9, 2097152 bytes)
Nov  1 14:53:24 z1 kernel: TCP bind hash table entries: 65536 (order: 7,
786432 bytes)
Nov  1 14:53:24 z1 kernel: TCP: Hash tables configured (established
131072 bind 65536)
Nov  1 14:53:24 z1 kernel: TCP reno registered
Nov  1 14:53:24 z1 kernel: Machine check exception polling timer started.
Nov  1 14:53:24 z1 kernel: highmem bounce pool size: 64 pages
Nov  1 14:53:24 z1 kernel: VFS: Disk quotas dquot_6.5.1
Nov  1 14:53:24 z1 kernel: Dquot-cache hash table entries: 1024 (order
0, 4096 bytes)
Nov  1 14:53:24 z1 kernel: Block layer SCSI generic (bsg) driver version
0.4 loaded (major 254)
Nov  1 14:53:24 z1 kernel: io scheduler noop registered
Nov  1 14:53:24 z1 kernel: io scheduler cfq registered (default)
Nov  1 14:53:24 z1 kernel: Boot video device is 0000:01:00.0
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:04.0 to 64
Nov  1 14:53:24 z1 kernel: assign_interrupt_mode Found MSI capability
Nov  1 14:53:24 z1 kernel: Allocate Port Service[0000:00:04.0:pcie00]
Nov  1 14:53:24 z1 kernel: Allocate Port Service[0000:00:04.0:pcie03]
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:16.0 to 64
Nov  1 14:53:24 z1 kernel: assign_interrupt_mode Found MSI capability
Nov  1 14:53:24 z1 kernel: Allocate Port Service[0000:00:16.0:pcie00]
Nov  1 14:53:24 z1 kernel: Allocate Port Service[0000:00:16.0:pcie03]
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC5] enabled at
IRQ 16
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:01:00.0[A] -> Link
[APC5] -> GSI 16 (level, low) -> IRQ 16
Nov  1 14:53:24 z1 kernel: nvidiafb: Device ID: 10de0161
Nov  1 14:53:24 z1 kernel: nvidiafb: CRTC0 analog not found
Nov  1 14:53:24 z1 kernel: nvidiafb: CRTC1 analog not found
Nov  1 14:53:24 z1 kernel: i2c-adapter i2c-0: unable to read EDID block.
Nov  1 14:53:24 z1 last message repeated 2 times
Nov  1 14:53:24 z1 kernel: i2c-adapter i2c-1: unable to read EDID block.
Nov  1 14:53:24 z1 last message repeated 2 times
Nov  1 14:53:24 z1 kernel: nvidiafb: CRTC 0 is currently programmed for DFP
Nov  1 14:53:24 z1 kernel: nvidiafb: Using DFP on CRTC 0
Nov  1 14:53:24 z1 kernel: nvidiafb: Panel size is 1400 x 1050
Nov  1 14:53:24 z1 kernel: nvidiafb: Panel is TMDS
Nov  1 14:53:24 z1 kernel: nvidiafb: MTRR set to ON
Nov  1 14:53:24 z1 kernel: fbcvt: 1400x1050@60: CVT Name - 1.470M3-R
Nov  1 14:53:24 z1 kernel: nvidiafb: Flat panel dithering disabled
Nov  1 14:53:24 z1 kernel: Console: switching to colour frame buffer
device 175x65
Nov  1 14:53:24 z1 kernel: nvidiafb: PCI nVidia NV16 framebuffer (64MB @
0xE0000000)
Nov  1 14:53:24 z1 kernel: vga16fb: initializing
Nov  1 14:53:24 z1 kernel: vga16fb: mapped to 0xc00a0000
Nov  1 14:53:24 z1 kernel: fb1: VGA16 VGA frame buffer device
Nov  1 14:53:24 z1 kernel: hpet_resources: 0xfefff000 is busy
Nov  1 14:53:24 z1 kernel: RAMDISK driver initialized: 16 RAM disks of
4096K size 1024 blocksize
Nov  1 14:53:24 z1 kernel: Uniform Multi-Platform E-IDE driver Revision:
7.00alpha2
Nov  1 14:53:24 z1 kernel: ide: Assuming 33MHz system bus speed for PIO
modes; override with idebus=xx
Nov  1 14:53:24 z1 kernel: Probing IDE interface ide0...
Nov  1 14:53:24 z1 kernel: hda: PLEXTOR CD-R PX-W4012A, ATAPI CD/DVD-ROM
drive
Nov  1 14:53:24 z1 kernel: hdb: _NEC DVD_RW ND-3500AG, ATAPI CD/DVD-ROM
drive
Nov  1 14:53:24 z1 kernel: Probing IDE interface ide1...
Nov  1 14:53:24 z1 kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Nov  1 14:53:24 z1 kernel: sata_sil24 0000:03:00.0: version 1.0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC7] enabled at
IRQ 16
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:03:00.0[A] -> Link
[APC7] -> GSI 16 (level, low) -> IRQ 16
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:03:00.0 to 64
Nov  1 14:53:24 z1 kernel: scsi0 : sata_sil24
Nov  1 14:53:24 z1 kernel: scsi1 : sata_sil24
Nov  1 14:53:24 z1 kernel: ata1: SATA max UDMA/100 cmd 0xf8840000 ctl
0x00000000 bmdma 0x00000000 irq 16
Nov  1 14:53:24 z1 kernel: ata2: SATA max UDMA/100 cmd 0xf8842000 ctl
0x00000000 bmdma 0x00000000 irq 16
Nov  1 14:53:24 z1 kernel: ata1: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: ata2: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: sata_nv 0000:00:0d.0: version 3.5
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APSI] enabled at
IRQ 23
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:00:0d.0[A] -> Link
[APSI] -> GSI 23 (level, low) -> IRQ 17
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:0d.0 to 64
Nov  1 14:53:24 z1 kernel: scsi2 : sata_nv
Nov  1 14:53:24 z1 kernel: scsi3 : sata_nv
Nov  1 14:53:24 z1 kernel: ata3: SATA max UDMA/133 cmd 0x000109f0 ctl
0x00010bf2 bmdma 0x0001e000 irq 17
Nov  1 14:53:24 z1 kernel: ata4: SATA max UDMA/133 cmd 0x00010970 ctl
0x00010b72 bmdma 0x0001e008 irq 17
Nov  1 14:53:24 z1 kernel: ata3: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: ata4: SATA link up 3.0 Gbps (SStatus 123
SControl 300)
Nov  1 14:53:24 z1 kernel: ata4.00: ATA-7: ST3500641NS, 3.AEC, max UDMA/133
Nov  1 14:53:24 z1 kernel: ata4.00: 976773168 sectors, multi 1: LBA48
NCQ (depth 0/32)
Nov  1 14:53:24 z1 kernel: ata4.00: configured for UDMA/133
Nov  1 14:53:24 z1 kernel: scsi 3:0:0:0: Direct-Access     ATA
ST3500641NS      3.AE PQ: 0 ANSI: 5
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] 976773168 512-byte hardware
sectors (500108 MB)
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Write Protect is off
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Mode Sense: 00 3a 00 00
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Write cache: enabled, read
cache: enabled, doesn't support DPO or FUA
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] 976773168 512-byte hardware
sectors (500108 MB)
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Write Protect is off
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Mode Sense: 00 3a 00 00
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Write cache: enabled, read
cache: enabled, doesn't support DPO or FUA
Nov  1 14:53:24 z1 kernel:  sda: sda1 sda2
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: [sda] Attached SCSI disk
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APSJ] enabled at
IRQ 22
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:00:0d.1[B] -> Link
[APSJ] -> GSI 22 (level, low) -> IRQ 18
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:0d.1 to 64
Nov  1 14:53:24 z1 kernel: scsi4 : sata_nv
Nov  1 14:53:24 z1 kernel: scsi5 : sata_nv
Nov  1 14:53:24 z1 kernel: ata5: SATA max UDMA/133 cmd 0x000109e0 ctl
0x00010be2 bmdma 0x0001cc00 irq 18
Nov  1 14:53:24 z1 kernel: ata6: SATA max UDMA/133 cmd 0x00010960 ctl
0x00010b62 bmdma 0x0001cc08 irq 18
Nov  1 14:53:24 z1 kernel: ata5: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: ata6: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [ASA2] enabled at
IRQ 21
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:00:0d.2[C] -> Link
[ASA2] -> GSI 21 (level, low) -> IRQ 19
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:0d.2 to 64
Nov  1 14:53:24 z1 kernel: scsi6 : sata_nv
Nov  1 14:53:24 z1 kernel: scsi7 : sata_nv
Nov  1 14:53:24 z1 kernel: ata7: SATA max UDMA/133 cmd 0x0001c800 ctl
0x0001c402 bmdma 0x0001b800 irq 19
Nov  1 14:53:24 z1 kernel: ata8: SATA max UDMA/133 cmd 0x0001c000 ctl
0x0001bc02 bmdma 0x0001b808 irq 19
Nov  1 14:53:24 z1 kernel: ata7: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: ata8: SATA link down (SStatus 0 SControl 300)
Nov  1 14:53:24 z1 kernel: PNP: PS/2 Controller [PNP0303:PS2K] at
0x60,0x64 irq 1
Nov  1 14:53:24 z1 kernel: PNP: PS/2 appears to have AUX port disabled,
if this is incorrect please boot with i8042.nopnp
Nov  1 14:53:24 z1 kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Nov  1 14:53:24 z1 kernel: mice: PS/2 mouse device common for all mice
Nov  1 14:53:24 z1 kernel: input: AT Translated Set 2 keyboard as
/class/input/input0
Nov  1 14:53:24 z1 kernel: TCP cubic registered
Nov  1 14:53:24 z1 kernel: NET: Registered protocol family 1
Nov  1 14:53:24 z1 kernel: NET: Registered protocol family 17
Nov  1 14:53:24 z1 kernel: Using IPI No-Shortcut mode
Nov  1 14:53:24 z1 kernel: ReiserFS: sda1: found reiserfs format "3.6"
with standard journal
Nov  1 14:53:24 z1 kernel: ReiserFS: sda1: using ordered data mode
Nov  1 14:53:24 z1 kernel: ReiserFS: sda1: journal params: device sda1,
size 8192, journal first block 18, max trans len 1024, max batch 900,
max commit age 30, max trans age 30
Nov  1 14:53:24 z1 kernel: ReiserFS: sda1: checking transaction log (sda1)
Nov  1 14:53:24 z1 kernel: ReiserFS: sda1: Using r5 hash to sort names
Nov  1 14:53:24 z1 kernel: VFS: Mounted root (reiserfs filesystem).
Nov  1 14:53:24 z1 kernel: Freeing unused kernel memory: 204k freed
Nov  1 14:53:24 z1 kernel: forcedeth.c: Reverse Engineered nForce
ethernet driver. Version 0.60.
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCH] enabled at
IRQ 20
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:00:10.0[A] -> Link
[APCH] -> GSI 20 (level, low) -> IRQ 20
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:10.0 to 64
Nov  1 14:53:24 z1 kernel: forcedeth: using HIGHDMA
Nov  1 14:53:24 z1 kernel: eth0: forcedeth.c: subsystem: 01043:cb84
bound to 0000:00:10.0
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [AMC1] enabled at
IRQ 23
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:00:11.0[A] -> Link
[AMC1] -> GSI 23 (level, low) -> IRQ 17
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:11.0 to 64
Nov  1 14:53:24 z1 kernel: forcedeth: using HIGHDMA
Nov  1 14:53:24 z1 kernel: Linux video capture interface: v2.00
Nov  1 14:53:24 z1 kernel: eth1: forcedeth.c: subsystem: 01043:cb84
bound to 0000:00:11.0
Nov  1 14:53:24 z1 kernel: sd 3:0:0:0: Attached scsi generic sg0 type 0
Nov  1 14:53:24 z1 kernel: i2c-adapter i2c-3: nForce2 SMBus adapter at
0x1c00
Nov  1 14:53:24 z1 kernel: i2c-adapter i2c-4: nForce2 SMBus adapter at
0x1c40
Nov  1 14:53:24 z1 kernel: usbcore: registered new interface driver usbfs
Nov  1 14:53:24 z1 kernel: usbcore: registered new interface driver hub
Nov  1 14:53:24 z1 kernel: usbcore: registered new device driver usb
Nov  1 14:53:24 z1 kernel: fb_ddc: exports duplicate symbol fb_ddc_read
(owned by kernel)
Nov  1 14:53:24 z1 kernel: hda: ATAPI 40X CD-ROM CD-R/RW drive, 4096kB
Cache
Nov  1 14:53:24 z1 kernel: Uniform CD-ROM driver Revision: 3.20
Nov  1 14:53:24 z1 kernel: hdb: ATAPI 48X DVD-ROM DVD-R CD-R/RW drive,
2048kB Cache
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APC2] enabled at
IRQ 17
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:02:07.1[A] -> Link
[APC2] -> GSI 17 (level, low) -> IRQ 21
Nov  1 14:53:24 z1 kernel: eth1: no link during initialization.
Nov  1 14:53:24 z1 kernel: eth0: no link during initialization.
Nov  1 14:53:24 z1 kernel: ohci_hcd: 2006 August 04 USB 1.1 'Open' Host
Controller (OHCI) Driver
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt Link [APCF] enabled at
IRQ 22
Nov  1 14:53:24 z1 kernel: ACPI: PCI Interrupt 0000:00:0a.0[A] -> Link
[APCF] -> GSI 22 (level, low) -> IRQ 18
Nov  1 14:53:24 z1 kernel: PCI: Setting latency timer of device
0000:00:0a.0 to 64
Nov  1 14:53:24 z1 kernel: ohci_hcd 0000:00:0a.0: OHCI Host Controller
Nov  1 14:53:24 z1 kernel: ohci_hcd 0000:00:0a.0: new USB bus
registered, assigned bus number 1
Nov  1 14:53:24 z1 kernel: ohci_hcd 0000:00:0a.0: irq 18, io mem 0xfe02f000
Nov  1 14:53:24 z1 kernel: kobject_add failed for nvidiafb with -EEXIST,
don't try to register things with the same name in the same directory.
Nov  1 14:55:50 z1 kernel: klogd 1.3-3, log source = /proc/kmsg started.
Nov  1 14:55:50 z1 kernel: Cannot find map file.
Nov  1 14:55:50 z1 kernel: No module symbols loaded - kernel modules not
enabled.
Nov  1 14:55:50 z1 kernel:  -> GSI 21 (level, low) -> IRQ 19
Nov  1 14:55:50 z1 kernel: PCI: Setting latency timer of device
0000:00:0e.1 to 64
Nov  1 14:55:50 z1 kernel: usb 1-2: new low speed USB device using
ohci_hcd and address 2
Nov  1 14:55:50 z1 kernel: ACPI: Fan [FAN] (on)
Nov  1 14:55:50 z1 kernel: eth0: link up.
Nov  1 14:55:50 z1 kernel: ADDRCONF(NETDEV_CHANGE): eth0: link becomes
ready
Nov  1 14:55:50 z1 kernel: usb 1-2: configuration #1 chosen from 1 choice
Nov  1 14:55:50 z1 kernel: bttv: driver version 0.9.17 loaded
Nov  1 14:55:50 z1 kernel: bttv: using 8 buffers with 2080k (520 pages)
each for capture
Nov  1 14:55:50 z1 kernel: bttv: Bt8xx card found (0).
Nov  1 14:55:50 z1 kernel: ACPI: PCI Interrupt 0000:02:07.0[A] -> Link
[APC2] -> GSI 17 (level, low) -> IRQ 21
Nov  1 14:55:50 z1 kernel: bttv0: Bt878 (rev 2) at 0000:02:07.0, irq:
21, latency: 32, mmio: 0xfdfff000
Nov  1 14:55:50 z1 kernel: bttv0: detected: Hauppauge WinTV [card=10],
PCI subsystem ID is 0070:13eb
Nov  1 14:55:50 z1 kernel: bttv0: using: Hauppauge (bt878)
[card=10,autodetected]
Nov  1 14:55:50 z1 kernel: bttv0: gpio: en=00000000, out=00000000
in=00ffffdb [init]
Nov  1 14:55:50 z1 kernel: bttv0: Hauppauge/Voodoo msp34xx: reset line
init [5]
Nov  1 14:55:50 z1 kernel: tveeprom 5-0050: Hauppauge model 61334, rev
A1B , serial# 607188
Nov  1 14:55:50 z1 kernel: tveeprom 5-0050: tuner model is Philips
FM1216 (idx 21, type 5)
Nov  1 14:55:50 z1 kernel: tveeprom 5-0050: TV standards PAL(B/G)
(eeprom 0x04)
Nov  1 14:55:50 z1 kernel: tveeprom 5-0050: audio processor is MSP3415
(idx 6)
Nov  1 14:55:50 z1 kernel: tveeprom 5-0050: has radio
Nov  1 14:55:50 z1 kernel: bttv0: Hauppauge eeprom indicates model#61334
Nov  1 14:55:50 z1 kernel: bttv0: tuner type=5
Nov  1 14:55:50 z1 kernel: bttv0: i2c: checking for MSP34xx @ 0x80... found
Nov  1 14:55:50 z1 kernel: usb 1-9: new full speed USB device using
ohci_hcd and address 3
Nov  1 14:55:50 z1 kernel: ACPI: PCI Interrupt Link [APCL] enabled at
IRQ 20
Nov  1 14:55:50 z1 kernel: ACPI: PCI Interrupt 0000:00:0a.1[B] -> Link
[APCL] -> GSI 20 (level, low) -> IRQ 20
Nov  1 14:55:50 z1 kernel: PCI: Setting latency timer of device
0000:00:0a.1 to 64
Nov  1 14:55:50 z1 kernel: ehci_hcd 0000:00:0a.1: EHCI Host Controller
Nov  1 14:55:50 z1 kernel: ehci_hcd 0000:00:0a.1: new USB bus
registered, assigned bus number 2
Nov  1 14:55:50 z1 kernel: ehci_hcd 0000:00:0a.1: debug port 1
Nov  1 14:55:50 z1 kernel: PCI: cache line size of 64 is not supported
by device 0000:00:0a.1
Nov  1 14:55:50 z1 kernel: ehci_hcd 0000:00:0a.1: irq 20, io mem 0xfe02e000
Nov  1 14:55:50 z1 kernel: ehci_hcd 0000:00:0a.1: USB 2.0 started, EHCI
1.00, driver 10 Dec 2004
Nov  1 14:55:50 z1 kernel: usb usb2: configuration #1 chosen from 1 choice
Nov  1 14:55:50 z1 kernel: hub 2-0:1.0: USB hub found
Nov  1 14:55:50 z1 kernel: hub 2-0:1.0: 10 ports detected
Nov  1 14:55:50 z1 kernel: input: Power Button (FF) as /class/input/input1
Nov  1 14:55:50 z1 kernel: ACPI: Power Button (FF) [PWRF]
Nov  1 14:55:50 z1 kernel: input: Power Button (CM) as /class/input/input2
Nov  1 14:55:50 z1 kernel: ACPI: Power Button (CM) [PWRB]
Nov  1 14:55:50 z1 kernel: usb 1-2: USB disconnect, address 2
Nov  1 14:55:50 z1 kernel: msp3400 5-0040: MSP3410D-B4 found @ 0x80
(bt878 #0 [sw])
Nov  1 14:55:50 z1 kernel: msp3400 5-0040: MSP3410D-B4 supports nicam,
mode is autodetect
Nov  1 14:55:50 z1 kernel: bttv0: i2c: checking for TDA9875 @ 0xb0...
not found
Nov  1 14:55:50 z1 kernel: bttv0: i2c: checking for TDA7432 @ 0x8a...
not found
Nov  1 14:55:50 z1 kernel: usb 2-9: new high speed USB device using
ehci_hcd and address 3
Nov  1 14:55:50 z1 kernel: tuner 5-0061: chip found @ 0xc2 (bt878 #0 [sw])
Nov  1 14:55:50 z1 kernel: tuner 5-0061: type set to 5 (Philips PAL_BG
(FI1216 and compatibles))
Nov  1 14:55:50 z1 kernel: tuner 5-0061: type set to 5 (Philips PAL_BG
(FI1216 and compatibles))
Nov  1 14:55:50 z1 kernel: bttv0: registered device video0
Nov  1 14:55:50 z1 kernel: bttv0: registered device vbi0
Nov  1 14:55:50 z1 kernel: bttv0: registered device radio0
Nov  1 14:55:50 z1 kernel: bttv0: PLL: 28636363 => 35468950 ..<6>usb
2-9: configuration #1 chosen from 1 choice
Nov  1 14:55:50 z1 kernel: usbcore: registered new interface driver
usbmouse
Nov  1 14:55:50 z1 kernel: drivers/hid/usbhid/usbmouse.c: v1.6:USB HID
Boot Protocol mouse driver
Nov  1 14:55:50 z1 kernel:  ok
Nov  1 14:55:50 z1 kernel: usb 1-2: new low speed USB device using
ohci_hcd and address 4
Nov  1 14:55:50 z1 kernel: usb 1-2: configuration #1 chosen from 1 choice
Nov  1 14:55:50 z1 kernel: input: USB HIDBP Mouse 062a:0000 as
/class/input/input3
Nov  1 14:55:50 z1 kernel: tsdev (compaq touchscreen emulation) is
scheduled for removal.
Nov  1 14:55:50 z1 kernel: See
Documentation/feature-removal-schedule.txt for details.
Nov  1 14:55:50 z1 kernel: wmaster0: Selected rate control algorithm
'simple'
Nov  1 14:55:50 z1 kernel: phy0: hwaddr 00:15:af:01:80:bd, rtl8187 V1 +
rtl8225z2
Nov  1 14:55:50 z1 kernel: usbcore: registered new interface driver rtl8187
Nov  1 14:55:50 z1 kernel: Adding 19286024k swap on /dev/sda2.
Priority:1 extents:1 across:19286024k
Nov  1 14:55:50 z1 kernel: eth0: no IPv6 routers present
Nov  1 14:55:50 z1 kernel: klogd[1340]: segfault at 00000004 eip
0804b2cc esp bf897c40 error 4
Nov  1 14:55:50 z1 kernel: Linux agpgart interface v0.102
Nov  1 14:55:50 z1 kernel: [drm] Initialized drm 1.1.0 20060810
Nov  1 14:55:50 z1 kernel: [drm:drm_init]
Nov  1 14:55:50 z1 kernel: [drm:drm_get_dev]
Nov  1 14:55:50 z1 kernel: PCI: Setting latency timer of device
0000:01:00.0 to 64
Nov  1 14:55:50 z1 kernel: [drm:nouveau_load] vendor: 0x10DE device:
0x161 class: 0x30000
Nov  1 14:55:50 z1 kernel: [drm] Detected an NV44 generation card
(0x044100a2)
Nov  1 14:55:50 z1 kernel: [drm:drm_get_head]
Nov  1 14:55:50 z1 kernel: [drm:drm_get_head] new minor assigned 0
Nov  1 14:55:50 z1 kernel: [drm] Initialized nouveau 0.0.10 20060213 on
minor 0
Nov  1 14:55:50 z1 kernel: [drm] Used old pci detect: framebuffer loaded
Nov  1 14:57:06 z1 kernel: [drm:drm_stub_open]
Nov  1 14:57:06 z1 kernel: [drm:drm_open_helper] pid = 1370, minor = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0x00000000,
size = 0x00002000, type = 2
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] 8192 13 fda16000
Nov  1 14:57:06 z1 kernel: [drm:drm_setup]
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_release] open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:nouveau_fifo_cleanup] clearing FIFO
enables from file_priv
Nov  1 14:57:06 z1 kernel: [drm:drm_release] pid = 1370, device =
0xe200, open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose]
Nov  1 14:57:06 z1 kernel: [drm:nouveau_card_takedown] prev state = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] driver lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_stub_open]
Nov  1 14:57:06 z1 kernel: [drm:drm_open_helper] pid = 1370, minor = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0x00000000,
size = 0x00002000, type = 2
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] 8192 13 fda16000
Nov  1 14:57:06 z1 kernel: [drm:drm_setup]
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086401, nr=0x01, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086401, nr=0x01, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_release] open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:nouveau_fifo_cleanup] clearing FIFO
enables from file_priv
Nov  1 14:57:06 z1 kernel: [drm:drm_release] pid = 1370, device =
0xe200, open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose]
Nov  1 14:57:06 z1 kernel: [drm:nouveau_card_takedown] prev state = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] driver lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_stub_open]
Nov  1 14:57:06 z1 kernel: [drm:drm_open_helper] pid = 1370, minor = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0x00000000,
size = 0x00002000, type = 2
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] 8192 13 fda16000
Nov  1 14:57:06 z1 kernel: [drm:drm_setup]
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_release] open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:nouveau_fifo_cleanup] clearing FIFO
enables from file_priv
Nov  1 14:57:06 z1 kernel: [drm:drm_release] pid = 1370, device =
0xe200, open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose]
Nov  1 14:57:06 z1 kernel: [drm:nouveau_card_takedown] prev state = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] driver lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_stub_open]
Nov  1 14:57:06 z1 kernel: [drm:drm_open_helper] pid = 1370, minor = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0x00000000,
size = 0x00002000, type = 2
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] 8192 13 fda16000
Nov  1 14:57:06 z1 kernel: [drm:drm_setup]
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0246400, nr=0x00, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_release] open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:nouveau_fifo_cleanup] clearing FIFO
enables from file_priv
Nov  1 14:57:06 z1 kernel: [drm:drm_release] pid = 1370, device =
0xe200, open_count = 1
Nov  1 14:57:06 z1 kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose]
Nov  1 14:57:06 z1 kernel: [drm:nouveau_card_takedown] prev state = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] driver lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_lastclose] lastclose completed
Nov  1 14:57:06 z1 kernel: [drm:drm_stub_open]
Nov  1 14:57:06 z1 kernel: [drm:drm_open_helper] pid = 1370, minor = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0x00000000,
size = 0x00002000, type = 2
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] 8192 13 fda16000
Nov  1 14:57:06 z1 kernel: [drm:drm_setup]
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086401, nr=0x01, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086401, nr=0x01, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0186415, nr=0x15, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0x00000000,
size = 0x00002000, type = 2
Nov  1 14:57:06 z1 kernel: [drm:drm_mmap_locked] start = 0xb7b47000, end
= 0xb7b49000, page offset = 0xfda16
Nov  1 14:57:06 z1 kernel: [drm:drm_vm_open_locked] 0xb7b47000,0x00002000
Nov  1 14:57:06 z1 kernel: [drm:drm_do_vm_shm_nopage] shm_nopage 0xb7b47000
Nov  1 14:57:06 z1 kernel: [drm:drm_do_vm_shm_nopage] shm_nopage 0xb7b48000
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0186415, nr=0x15, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0xe4000000,
size = 0x04000000, type = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086426, nr=0x26, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086426, nr=0x26, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0xc0086420, nr=0x20, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_addctx] 1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0x40086422, nr=0x22, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0x4008642a, nr=0x2a, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:drm_lock] 1 (pid 1370) requests lock
(0x00000000), flags = 0x00000000
Nov  1 14:57:06 z1 kernel: [drm:drm_lock] 1 has lock
Nov  1 14:57:06 z1 kernel: [drm:drm_fasync] fd = 8, device = 0xe200
Nov  1 14:57:06 z1 kernel: [drm:drm_unlocked_ioctl] pid=1370,
cmd=0x6440, nr=0x40, dev 0xe200, auth=1
Nov  1 14:57:06 z1 kernel: [drm:nouveau_card_init] prev state = 0
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0xfa000000,
size = 0x01000000, type = 1
Nov  1 14:57:06 z1 kernel: [drm:nouveau_init_card_mappings] regs mapped
ok at 0xfa000000
Nov  1 14:57:06 z1 kernel: [drm:drm_addmap_core] offset = 0xfb000000,
size = 0x01000000, type = 1
Nov  1 14:57:06 z1 kernel: allocation failed: out of vmalloc space - use
vmalloc=<size> to increase size.
Nov  1 14:57:06 z1 kernel: [drm:nouveau_gpuobj_early_init]
Nov  1 14:57:06 z1 kernel: [drm:nv04_instmem_determine_amount] RAMIN
size: 1024KiB
Nov  1 14:57:06 z1 kernel: BUG: unable to handle kernel paging request
at virtual address 00010000
Nov  1 14:57:06 z1 kernel:  printing eip:
Nov  1 14:57:06 z1 kernel: fe4c7f5f
Nov  1 14:57:06 z1 kernel: *pdpt = 0000000036ccb001
Nov  1 14:57:06 z1 kernel: *pde = 0000000036de6067
Nov  1 14:57:06 z1 kernel: *pte = 0000000000000000
Nov  1 14:57:06 z1 kernel: Oops: 0002 [#1]
Nov  1 14:57:06 z1 kernel: PREEMPT SMP
Nov  1 14:57:06 z1 kernel: Modules linked in: nouveau drm agpgart arc4
ecb blkcipher cryptomgr crypto_algapi rc80211_simple rtl8187 tsdev
mac80211 cfg80211 eeprom_93cx6 tuner tvaudio usbmouse msp3400 button
ehci_hcd bttv video_buf ir_common fan snd_hda_intel ipv6 k8temp hwmon
ohci_hcd evdev compat_ioctl32 btcx_risc snd_bt87x ide_cd usbcore
i2c_nforce2 sg tveeprom videodev v4l2_common v4l1_compat cdrom snd_pcm
snd_timer snd soundcore snd_page_alloc forcedeth
Nov  1 14:57:06 z1 kernel: CPU:    0


regards
Alfred
