From: Julian Wollrath <jwollrath-S0/GAf8tV78@public.gmane.org>
Subject: suspend to ram does not work with Geforce 310M (NVA8)
Date: Mon, 17 Oct 2011 13:23:00 +0200
Message-ID: <201110171323.01097.jwollrath@web.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_VABnOxvdbE8w7af"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--Boundary-00=_VABnOxvdbE8w7af
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello.

Minimal testcase for my problem: No X running, just a TTY. Use of the nouveau 
kernel module as of today (or any older) with an up to date vanilla kernel.
Hardware: DELL Vostro 3500 with Geforce 310M.

To suspend to ram I use this script, as suggested in 
Documentation/power/s2ram.txt:
#!/bin/sh
sync
echo 1 > /sys/power/pm_trace
echo mem > /sys/power/state

When I try to suspend to ram, the screen wents black but the backlight is 
still on. The laptop is frozen, no interaction is possible, turning it of is 
only possible by holding the power button down.

This is the log for the suspending process via the bootparameters debug and 
no_console_suspend, which I present you, because it shows more information 
than the one I could obtain via netconsole.

[  204.782705] Freezing user space processes ... (elapsed 0.01 seconds) done.
[  204.793055] Freezing remaining freezable tasks ... (elapsed 0.01 seconds) 
done.
[  204.804134] PM: Entering mem sleep
[  204.806412] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  204.809828] sd 0:0:0:0: [sda] Stopping disk
[  204.885515] brcmsmac 0000:12:00.0: PCI INT A disabled
[  204.885580] r8169 0000:13:00.0: eth0: link down
[  204.885698] [drm] nouveau 0000:01:00.0: Disabling fbcon acceleration...
[  204.885718] [drm] nouveau 0000:01:00.0: Unspinning framebuffer(s)...
[  204.885760] ehci_hcd 0000:00:1d.0: PCI INT A disabled
[  204.885866] ehci_hcd 0000:00:1a.0: PCI INT A disabled
[  204.885885] [drm] nouveau 0000:01:00.0: Evicting buffers...
[  204.889356] [drm] nouveau 0000:01:00.0: Idling channels...
[  204.889588] [drm] nouveau 0000:01:00.0: Suspending GPU objects...
[  204.988219] snd_hda_intel 0000:00:1b.0: PCI INT A disabled
[  204.988360] ACPI handle has no context!
[  205.300366] snd_hda_intel 0000:00:1b.0: PCI INT A disabled
[  205.300499] ACPI handle has no context!
[  206.194719] [drm] nouveau 0000:01:00.0: And we're gone!
[  206.194803] nouveau 0000:01:00.0: PCI INT A disabled

I will also attached the dmesg output from after the failed suspend.

Suspending the laptop works fine with the proprietary driver.

If you want me to provide any further information, please feel free to ask.


Best regards
Julian Wollrath

P.S.: Please CC me, since I am not subscribed to the mailing list.

--Boundary-00=_VABnOxvdbE8w7af
Content-Type: text/plain;
  charset="UTF-8";
  name="dmesg_after_failed_suspend"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg_after_failed_suspend"

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.1.0-rc9-wl-debug-00147-g3ff4992 (root@aldoreel) (gcc version 4.6.1 (Debian 4.6.1-15) ) #3 SMP PREEMPT Sat Oct 15 12:50:53 CEST 2011
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-3.1.0-rc9-wl-debug-00147-g3ff4992 root=/dev/mapper/encrypted-root ro debug no_console_suspend 3
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009d400 (usable)
[    0.000000]  BIOS-e820: 000000000009d400 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 00000000bb593000 (usable)
[    0.000000]  BIOS-e820: 00000000bb593000 - 00000000bb5db000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bb5db000 - 00000000bb5e6000 (ACPI data)
[    0.000000]  BIOS-e820: 00000000bb5e6000 - 00000000bb5e9000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bb5e9000 - 00000000bb5ea000 (reserved)
[    0.000000]  BIOS-e820: 00000000bb5ea000 - 00000000bb5fb000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bb5fb000 - 00000000bb61e000 (reserved)
[    0.000000]  BIOS-e820: 00000000bb61e000 - 00000000bb61f000 (usable)
[    0.000000]  BIOS-e820: 00000000bb61f000 - 00000000bb622000 (reserved)
[    0.000000]  BIOS-e820: 00000000bb622000 - 00000000bb62a000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bb62a000 - 00000000bb62d000 (reserved)
[    0.000000]  BIOS-e820: 00000000bb62d000 - 00000000bb632000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bb632000 - 00000000bb652000 (reserved)
[    0.000000]  BIOS-e820: 00000000bb652000 - 00000000bb695000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bb695000 - 00000000bb800000 (usable)
[    0.000000]  BIOS-e820: 00000000e0000000 - 00000000f0000000 (reserved)
[    0.000000]  BIOS-e820: 00000000fed1c000 - 00000000fed20000 (reserved)
[    0.000000]  BIOS-e820: 00000000ff000000 - 0000000100000000 (reserved)
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI 2.6 present.
[    0.000000] DMI: Dell Inc. Vostro 3500/0NVXFV, BIOS A10 10/25/2010
[    0.000000] e820 update range: 0000000000000000 - 0000000000010000 (usable) ==> (reserved)
[    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
[    0.000000] No AGP bridge found
[    0.000000] last_pfn = 0xbb800 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-CFFFF write-protect
[    0.000000]   D0000-E7FFF uncachable
[    0.000000]   E8000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask F00000000 write-back
[    0.000000]   1 base 0BC000000 mask FFC000000 uncachable
[    0.000000]   2 base 0C0000000 mask FC0000000 uncachable
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] initial memory mapped : 0 - 20000000
[    0.000000] Base memory trampoline at [ffff880000098000] 98000 size 20480
[    0.000000] init_memory_mapping: 0000000000000000-00000000bb800000
[    0.000000]  0000000000 - 00bb800000 page 2M
[    0.000000] kernel direct mapping tables up to bb800000 @ bb7fc000-bb800000
[    0.000000] RAMDISK: 379d4000 - 37ce2000
[    0.000000] ACPI: RSDP 00000000000f0410 00024 (v03 DELL  )
[    0.000000] ACPI: XSDT 00000000bb5db088 00064 (v01 DELL    WN09    01072009 AMI  00010013)
[    0.000000] ACPI: FACP 00000000bb5e4e68 000F4 (v04 DELL    WN09    01072009 AMI  00010013)
[    0.000000] ACPI Warning: 32/64 FACS address mismatch in FADT - two FACS tables! (20110623/tbfadt-369)
[    0.000000] ACPI Warning: 32/64X FACS address mismatch in FADT - 0xBB62DF40/0x00000000BB62DF80, using 32 (20110623/tbfadt-489)
[    0.000000] ACPI: DSDT 00000000bb5db180 09CE8 (v02 DELL    WN09    00000050 INTL 20051117)
[    0.000000] ACPI: FACS 00000000bb62df40 00040
[    0.000000] ACPI: APIC 00000000bb5e4f60 00072 (v01 DELL   WN09     01072009 AMI  00010013)
[    0.000000] ACPI: SSDT 00000000bb5e4fd8 0014E (v01 AMICPU     PROC 00000001 MSFT 03000001)
[    0.000000] ACPI: MCFG 00000000bb5e5128 0003C (v01   DELL     WN09 01072009 MSFT 00000097)
[    0.000000] ACPI: SLIC 00000000bb5e5168 00176 (v01 DELL    WN09    01072009 AMI  00010013)
[    0.000000] ACPI: HPET 00000000bb5e52e0 00038 (v01   DELL     WN09 01072009 AMI. 00000003)
[    0.000000] ACPI: OSFR 00000000bb5e5318 00086 (v01 DELL    M08     07DA0A19 ASL  00000061)
[    0.000000] ACPI: SSDT 00000000bb5e53a0 001BB (v01 Nv1Ref  Nv1Tabl 00001000 INTL 20051117)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at 0000000000000000-00000000bb800000
[    0.000000] Initmem setup node 0 0000000000000000-00000000bb800000
[    0.000000]   NODE_DATA [00000000bb7f7000 - 00000000bb7fbfff]
[    0.000000]  [ffffea0000000000-ffffea0002ffffff] PMD -> [ffff8800b7c00000-ffff8800babfffff] on node 0
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000010 -> 0x00001000
[    0.000000]   DMA32    0x00001000 -> 0x00100000
[    0.000000]   Normal   empty
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[4] active PFN ranges
[    0.000000]     0: 0x00000010 -> 0x0000009d
[    0.000000]     0: 0x00000100 -> 0x000bb593
[    0.000000]     0: 0x000bb61e -> 0x000bb61f
[    0.000000]     0: 0x000bb695 -> 0x000bb800
[    0.000000] On node 0 totalpages: 767628
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 5 pages reserved
[    0.000000]   DMA zone: 3912 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 11936 pages used for memmap
[    0.000000]   DMA32 zone: 751711 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x04] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x05] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] SMP: Allowing 4 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 40
[    0.000000] PM: Registered nosave memory: 000000000009d000 - 000000000009e000
[    0.000000] PM: Registered nosave memory: 000000000009e000 - 00000000000a0000
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 00000000000e0000
[    0.000000] PM: Registered nosave memory: 00000000000e0000 - 0000000000100000
[    0.000000] PM: Registered nosave memory: 00000000bb593000 - 00000000bb5db000
[    0.000000] PM: Registered nosave memory: 00000000bb5db000 - 00000000bb5e6000
[    0.000000] PM: Registered nosave memory: 00000000bb5e6000 - 00000000bb5e9000
[    0.000000] PM: Registered nosave memory: 00000000bb5e9000 - 00000000bb5ea000
[    0.000000] PM: Registered nosave memory: 00000000bb5ea000 - 00000000bb5fb000
[    0.000000] PM: Registered nosave memory: 00000000bb5fb000 - 00000000bb61e000
[    0.000000] PM: Registered nosave memory: 00000000bb61f000 - 00000000bb622000
[    0.000000] PM: Registered nosave memory: 00000000bb622000 - 00000000bb62a000
[    0.000000] PM: Registered nosave memory: 00000000bb62a000 - 00000000bb62d000
[    0.000000] PM: Registered nosave memory: 00000000bb62d000 - 00000000bb632000
[    0.000000] PM: Registered nosave memory: 00000000bb632000 - 00000000bb652000
[    0.000000] PM: Registered nosave memory: 00000000bb652000 - 00000000bb695000
[    0.000000] Allocating PCI resources starting at bb800000 (gap: bb800000:24800000)
[    0.000000] setup_percpu: NR_CPUS:4 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
[    0.000000] PERCPU: Embedded 25 pages/cpu @ffff8800bb200000 s70656 r8192 d23552 u524288
[    0.000000] pcpu-alloc: s70656 r8192 d23552 u524288 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 755623
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-3.1.0-rc9-wl-debug-00147-g3ff4992 root=/dev/mapper/encrypted-root ro debug no_console_suspend 3
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Checking aperture...
[    0.000000] No AGP bridge found
[    0.000000] Memory: 3007796k/3072000k available (4090k kernel code, 1488k absent, 62716k reserved, 4471k data, 548k init)
[    0.000000] SLUB: Genslabs=15, HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] 	Verbose stalled-CPUs detection is disabled.
[    0.000000] NR_IRQS:4352 nr_irqs:712 16
[    0.000000] Extended CMOS year: 2000
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] ODEBUG: 0 of 0 active objects replaced
[    0.000000] hpet clockevent registered
[    0.000000] Fast TSC calibration using PIT
[    0.001000] Detected 2393.938 MHz processor.
[    0.000003] Calibrating delay loop (skipped), value calculated using timer frequency.. 4787.87 BogoMIPS (lpj=2393938)
[    0.000312] pid_max: default: 32768 minimum: 301
[    0.000545] Security Framework initialized
[    0.000700] SELinux:  Disabled at boot.
[    0.001175] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.003021] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.003935] Mount-cache hash table entries: 256
[    0.004447] Initializing cgroup subsys cpuacct
[    0.004603] Initializing cgroup subsys devices
[    0.004756] Initializing cgroup subsys freezer
[    0.004907] Initializing cgroup subsys net_cls
[    0.005057] Initializing cgroup subsys blkio
[    0.005292] CPU: Physical Processor ID: 0
[    0.005444] CPU: Processor Core ID: 0
[    0.005595] mce: CPU supports 9 MCE banks
[    0.005757] CPU0: Thermal monitoring enabled (TM1)
[    0.005916] using mwait in idle threads.
[    0.006138] ACPI: Core revision 20110623
[    0.041091] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.051239] CPU0: Intel(R) Core(TM) i5 CPU       M 450  @ 2.40GHz stepping 05
[    0.162920] APIC calibration not consistent with PM-Timer: 109ms instead of 100ms
[    0.163138] APIC delta adjusted to PM-Timer: 831249 (914364)
[    0.163299] Performance Events: PEBS fmt1+, Westmere events, Intel PMU driver.
[    0.165174] ... version:                3
[    0.165324] ... bit width:              48
[    0.165471] ... generic registers:      4
[    0.165621] ... value mask:             0000ffffffffffff
[    0.165772] ... max period:             000000007fffffff
[    0.165925] ... fixed-purpose events:   3
[    0.166072] ... event mask:             000000070000000f
[    0.173451] NMI watchdog enabled, takes one hw-pmu counter.
[    0.181290] Booting Node   0, Processors  #1
[    0.181449] smpboot cpu 1: start_ip = 98000
[    0.272209] NMI watchdog enabled, takes one hw-pmu counter.
[    0.278129]  #2
[    0.278211] smpboot cpu 2: start_ip = 98000
[    0.369031] NMI watchdog enabled, takes one hw-pmu counter.
[    0.374948]  #3 Ok.
[    0.375095] smpboot cpu 3: start_ip = 98000
[    0.465889] NMI watchdog enabled, takes one hw-pmu counter.
[    0.467764] Brought up 4 CPUs
[    0.467922] Total of 4 processors activated (19151.09 BogoMIPS).
[    0.469899] devtmpfs: initialized
[    0.470517] PM: Registering ACPI NVS region at bb593000 (294912 bytes)
[    0.470743] PM: Registering ACPI NVS region at bb5e6000 (12288 bytes)
[    0.470906] PM: Registering ACPI NVS region at bb5ea000 (69632 bytes)
[    0.471077] PM: Registering ACPI NVS region at bb622000 (32768 bytes)
[    0.471242] PM: Registering ACPI NVS region at bb62d000 (20480 bytes)
[    0.471402] PM: Registering ACPI NVS region at bb652000 (274432 bytes)
[    0.472073] print_constraints: dummy: 
[    0.472310] RTC time: 14:10:43, date: 10/15/11
[    0.472568] NET: Registered protocol family 16
[    0.473288] ACPI: bus type pci registered
[    0.473712] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.473943] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.521164] PCI: Using configuration type 1 for base access
[    0.525112] bio: create slab <bio-0> at 0
[    0.525509] ACPI: Added _OSI(Module Device)
[    0.525668] ACPI: Added _OSI(Processor Device)
[    0.525819] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.525968] ACPI: Added _OSI(Processor Aggregator Device)
[    0.527922] ACPI: EC: Look up EC in DSDT
[    0.530737] ACPI: Executed 1 blocks of module-level executable AML code
[    0.557534] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.565830] ACPI: SSDT 00000000bb622c18 003A4 (v01    AMI      IST 00000001 MSFT 03000001)
[    0.567197] ACPI: Dynamic OEM Table Load:
[    0.567494] ACPI: SSDT           (null) 003A4 (v01    AMI      IST 00000001 MSFT 03000001)
[    0.571010] ACPI: Interpreter enabled
[    0.571161] ACPI: (supports S0 S3 S4 S5)
[    0.571718] ACPI: Using IOAPIC for interrupt routing
[    0.617043] HEST: Table not found.
[    0.617194] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.618162] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.618821] pci_root PNP0A08:00: host bridge window [io  0x0000-0x0cf7]
[    0.618978] pci_root PNP0A08:00: host bridge window [io  0x0d00-0xffff]
[    0.619132] pci_root PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff]
[    0.619350] pci_root PNP0A08:00: host bridge window [mem 0xbc000000-0xffffffff]
[    0.619591] pci 0000:00:00.0: [8086:0044] type 0 class 0x000600
[    0.619764] DMAR: BIOS has allocated no shadow GTT; disabling IOMMU for graphics
[    0.620002] pci 0000:00:01.0: [8086:0045] type 1 class 0x000604
[    0.620181] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.620338] pci 0000:00:01.0: PME# disabled
[    0.620536] pci 0000:00:16.0: [8086:3b64] type 0 class 0x000780
[    0.620722] pci 0000:00:16.0: reg 10: [mem 0xfbe09000-0xfbe0900f 64bit]
[    0.620952] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.621111] pci 0000:00:16.0: PME# disabled
[    0.621301] pci 0000:00:1a.0: [8086:3b3c] type 0 class 0x000c03
[    0.621479] pci 0000:00:1a.0: reg 10: [mem 0xfbe08000-0xfbe083ff]
[    0.621727] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.621884] pci 0000:00:1a.0: PME# disabled
[    0.622062] pci 0000:00:1b.0: [8086:3b56] type 0 class 0x000403
[    0.622238] pci 0000:00:1b.0: reg 10: [mem 0xfbe00000-0xfbe03fff 64bit]
[    0.622470] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.622632] pci 0000:00:1b.0: PME# disabled
[    0.622816] pci 0000:00:1c.0: [8086:3b42] type 1 class 0x000604
[    0.623049] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.623208] pci 0000:00:1c.0: PME# disabled
[    0.623387] pci 0000:00:1c.1: [8086:3b44] type 1 class 0x000604
[    0.623624] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.623779] pci 0000:00:1c.1: PME# disabled
[    0.623955] pci 0000:00:1c.2: [8086:3b46] type 1 class 0x000604
[    0.624188] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.624345] pci 0000:00:1c.2: PME# disabled
[    0.624524] pci 0000:00:1c.4: [8086:3b4a] type 1 class 0x000604
[    0.624760] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.624919] pci 0000:00:1c.4: PME# disabled
[    0.625102] pci 0000:00:1d.0: [8086:3b34] type 0 class 0x000c03
[    0.625281] pci 0000:00:1d.0: reg 10: [mem 0xfbe07000-0xfbe073ff]
[    0.625520] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.625680] pci 0000:00:1d.0: PME# disabled
[    0.625858] pci 0000:00:1e.0: [8086:2448] type 1 class 0x000604
[    0.626088] pci 0000:00:1f.0: [8086:3b0b] type 0 class 0x000601
[    0.626375] pci 0000:00:1f.2: [8086:3b2f] type 0 class 0x000106
[    0.626555] pci 0000:00:1f.2: reg 10: [io  0xf070-0xf077]
[    0.626719] pci 0000:00:1f.2: reg 14: [io  0xf060-0xf063]
[    0.626882] pci 0000:00:1f.2: reg 18: [io  0xf050-0xf057]
[    0.627045] pci 0000:00:1f.2: reg 1c: [io  0xf040-0xf043]
[    0.627207] pci 0000:00:1f.2: reg 20: [io  0xf020-0xf03f]
[    0.627371] pci 0000:00:1f.2: reg 24: [mem 0xfbe06000-0xfbe067ff]
[    0.627570] pci 0000:00:1f.2: PME# supported from D3hot
[    0.627727] pci 0000:00:1f.2: PME# disabled
[    0.627899] pci 0000:00:1f.3: [8086:3b30] type 0 class 0x000c05
[    0.628071] pci 0000:00:1f.3: reg 10: [mem 0xfbe05000-0xfbe050ff 64bit]
[    0.628255] pci 0000:00:1f.3: reg 20: [io  0xf000-0xf01f]
[    0.628452] pci 0000:00:1f.6: [8086:3b32] type 0 class 0x001180
[    0.628638] pci 0000:00:1f.6: reg 10: [mem 0xfbe04000-0xfbe04fff 64bit]
[    0.628914] pci 0000:01:00.0: [10de:0a75] type 0 class 0x000300
[    0.629074] pci 0000:01:00.0: reg 10: [mem 0xfa000000-0xfaffffff]
[    0.629240] pci 0000:01:00.0: reg 14: [mem 0xc0000000-0xcfffffff 64bit pref]
[    0.629403] pci 0000:01:00.0: reg 1c: [mem 0xd0000000-0xd1ffffff 64bit pref]
[    0.629566] pci 0000:01:00.0: reg 24: [io  0xe000-0xe07f]
[    0.629725] pci 0000:01:00.0: reg 30: [mem 0xfb000000-0xfb07ffff pref]
[    0.629939] pci 0000:01:00.1: [10de:0be3] type 0 class 0x000403
[    0.630100] pci 0000:01:00.1: reg 10: [mem 0xfb080000-0xfb083fff]
[    0.630361] pci 0000:00:01.0: PCI bridge to [bus 01-01]
[    0.630512] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.630666] pci 0000:00:01.0:   bridge window [mem 0xfa000000-0xfb0fffff]
[    0.630825] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff 64bit pref]
[    0.631101] pci 0000:00:1c.0: PCI bridge to [bus 11-11]
[    0.631353] pci 0000:12:00.0: [14e4:4353] type 0 class 0x000280
[    0.631542] pci 0000:12:00.0: reg 10: [mem 0xfbd00000-0xfbd03fff 64bit]
[    0.631823] pci 0000:12:00.0: supports D1 D2
[    0.631975] pci 0000:12:00.0: PME# supported from D0 D3hot D3cold
[    0.632131] pci 0000:12:00.0: PME# disabled
[    0.633550] pci 0000:00:1c.1: PCI bridge to [bus 12-12]
[    0.633714] pci 0000:00:1c.1:   bridge window [mem 0xfbd00000-0xfbdfffff]
[    0.633955] pci 0000:13:00.0: [10ec:8168] type 0 class 0x000200
[    0.634125] pci 0000:13:00.0: reg 10: [io  0xd000-0xd0ff]
[    0.634305] pci 0000:13:00.0: reg 18: [mem 0xd2c04000-0xd2c04fff 64bit pref]
[    0.634480] pci 0000:13:00.0: reg 20: [mem 0xd2c00000-0xd2c03fff 64bit pref]
[    0.634647] pci 0000:13:00.0: reg 30: [mem 0xfbc00000-0xfbc1ffff pref]
[    0.634847] pci 0000:13:00.0: supports D1 D2
[    0.634999] pci 0000:13:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.635155] pci 0000:13:00.0: PME# disabled
[    0.636539] pci 0000:00:1c.2: PCI bridge to [bus 13-13]
[    0.636699] pci 0000:00:1c.2:   bridge window [io  0xd000-0xdfff]
[    0.636856] pci 0000:00:1c.2:   bridge window [mem 0xfbc00000-0xfbcfffff]
[    0.637012] pci 0000:00:1c.2:   bridge window [mem 0xd2c00000-0xd2cfffff 64bit pref]
[    0.637291] pci 0000:00:1c.4: PCI bridge to [bus 15-15]
[    0.637448] pci 0000:00:1c.4:   bridge window [io  0xc000-0xcfff]
[    0.637606] pci 0000:00:1c.4:   bridge window [mem 0xfb200000-0xfbbfffff]
[    0.637765] pci 0000:00:1c.4:   bridge window [mem 0xd2100000-0xd2afffff 64bit pref]
[    0.638063] pci 0000:00:1e.0: PCI bridge to [bus 20-20] (subtractive decode)
[    0.638235] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
[    0.638458] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
[    0.638685] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
[    0.638913] pci 0000:00:1e.0:   bridge window [mem 0xbc000000-0xffffffff] (subtractive decode)
[    0.639169] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.640817] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.BR20._PRT]
[    0.641593] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0._PRT]
[    0.641960] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX1._PRT]
[    0.642332] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX2._PRT]
[    0.642717] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX4._PRT]
[    0.643622]  pci0000:00: Requesting ACPI _OSC control (0x1d)
[    0.645190]  pci0000:00: ACPI _OSC control (0x19) granted
[    0.680595] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.681834] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.683076] ACPI: PCI Interrupt Link [LNKC] (IRQs *3 4 5 6 10 11 12 14 15)
[    0.684247] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 *4 5 6 10 11 12 14 15)
[    0.685414] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0
[    0.686795] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11 12 14 15) *0
[    0.688175] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.689415] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 *7 10 11 12 14 15)
[    0.690893] vgaarb: device added: PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.691117] vgaarb: loaded
[    0.691266] vgaarb: bridge control possible 0000:01:00.0
[    0.693408] PCI: Using ACPI for IRQ routing
[    0.703361] PCI: Discovered peer bus ff
[    0.703641] pci 0000:ff:00.0: [8086:2c62] type 0 class 0x000600
[    0.703814] pci 0000:ff:00.1: [8086:2d01] type 0 class 0x000600
[    0.703991] pci 0000:ff:02.0: [8086:2d10] type 0 class 0x000600
[    0.704161] pci 0000:ff:02.1: [8086:2d11] type 0 class 0x000600
[    0.704333] pci 0000:ff:02.2: [8086:2d12] type 0 class 0x000600
[    0.704510] pci 0000:ff:02.3: [8086:2d13] type 0 class 0x000600
[    0.705315] PCI: pci_cache_line_size set to 64 bytes
[    0.705624] reserve RAM buffer: 000000000009d400 - 000000000009ffff 
[    0.705717] reserve RAM buffer: 00000000bb593000 - 00000000bbffffff 
[    0.705963] reserve RAM buffer: 00000000bb61f000 - 00000000bbffffff 
[    0.706202] reserve RAM buffer: 00000000bb800000 - 00000000bbffffff 
[    0.706848] NetLabel: Initializing
[    0.707134] NetLabel:  domain hash size = 128
[    0.707280] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.707471] NetLabel:  unlabeled traffic allowed by default
[    0.707638] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.708461] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.710663] Switching to clocksource hpet
[    0.710969] pnp: PnP ACPI init
[    0.711147] ACPI: bus type pnp registered
[    0.711333] Switched to NOHz mode on CPU #0
[    0.711398] Switched to NOHz mode on CPU #2
[    0.711401] Switched to NOHz mode on CPU #1
[    0.711431] Switched to NOHz mode on CPU #3
[    0.711681] pnp 00:00: [bus 00-ff]
[    0.711686] pnp 00:00: [io  0x0cf8-0x0cff]
[    0.711689] pnp 00:00: [io  0x0000-0x0cf7 window]
[    0.711692] pnp 00:00: [io  0x0d00-0xffff window]
[    0.711695] pnp 00:00: [mem 0x000a0000-0x000bffff window]
[    0.711698] pnp 00:00: [mem 0x00000000 window]
[    0.711702] pnp 00:00: [mem 0xbc000000-0xffffffff window]
[    0.713062] pnp 00:00: Plug and Play ACPI device, IDs PNP0a08 PNP0a03 (active)
[    0.713537] pnp 00:01: [mem 0xfed14000-0xfed19fff]
[    0.713691] pnp 00:01: [mem 0xe0000000-0xefffffff]
[    0.713842] pnp 00:01: [mem 0xfed90000-0xfed93fff]
[    0.714015] pnp 00:01: [mem 0xfed20000-0xfed3ffff]
[    0.714169] pnp 00:01: [mem 0xfee00000-0xfee0ffff]
[    0.714487] system 00:01: [mem 0xfed14000-0xfed19fff] has been reserved
[    0.714646] system 00:01: [mem 0xe0000000-0xefffffff] has been reserved
[    0.714806] system 00:01: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.714990] system 00:01: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.715148] system 00:01: [mem 0xfee00000-0xfee0ffff] has been reserved
[    0.715302] system 00:01: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.715544] pnp 00:02: [dma 4]
[    0.715695] pnp 00:02: [io  0x0000-0x000f]
[    0.715851] pnp 00:02: [io  0x0081-0x0083]
[    0.716005] pnp 00:02: [io  0x0087]
[    0.716154] pnp 00:02: [io  0x0089-0x008b]
[    0.716302] pnp 00:02: [io  0x008f]
[    0.716449] pnp 00:02: [io  0x00c0-0x00df]
[    0.716718] pnp 00:02: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.716922] pnp 00:03: [io  0x0070-0x0071]
[    0.717081] pnp 00:03: [irq 8]
[    0.717345] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.717521] pnp 00:04: [io  0x0061]
[    0.717779] pnp 00:04: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.717972] pnp 00:05: [io  0x00f0-0x00ff]
[    0.718128] pnp 00:05: [irq 13]
[    0.718389] pnp 00:05: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.718617] pnp 00:06: [io  0x0010-0x001f]
[    0.718767] pnp 00:06: [io  0x0022-0x003f]
[    0.718935] pnp 00:06: [io  0x0044-0x005f]
[    0.719088] pnp 00:06: [io  0x0068-0x006f]
[    0.719234] pnp 00:06: [io  0x0072-0x007f]
[    0.719382] pnp 00:06: [io  0x0080]
[    0.719527] pnp 00:06: [io  0x0084-0x0086]
[    0.719676] pnp 00:06: [io  0x0088]
[    0.719823] pnp 00:06: [io  0x008c-0x008e]
[    0.719987] pnp 00:06: [io  0x0090-0x009f]
[    0.720136] pnp 00:06: [io  0x00a2-0x00bf]
[    0.720287] pnp 00:06: [io  0x00e0-0x00ef]
[    0.720435] pnp 00:06: [io  0x04d0-0x04d1]
[    0.720583] pnp 00:06: [mem 0xfe800000-0xfe8001ff]
[    0.720927] system 00:06: [io  0x04d0-0x04d1] has been reserved
[    0.721086] system 00:06: [mem 0xfe800000-0xfe8001ff] has been reserved
[    0.721238] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.721554] pnp 00:07: [irq 12]
[    0.721822] pnp 00:07: Plug and Play ACPI device, IDs SYN0604 SYN0600 SYN0002 PNP0f13 (active)
[    0.722133] pnp 00:08: [io  0x0060]
[    0.722284] pnp 00:08: [io  0x0064]
[    0.722430] pnp 00:08: [io  0x0062]
[    0.722581] pnp 00:08: [io  0x0066]
[    0.722732] pnp 00:08: [irq 1]
[    0.723006] pnp 00:08: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.724050] pnp 00:09: [io  0x0400-0x047f]
[    0.724204] pnp 00:09: [io  0x1180-0x119f]
[    0.724350] pnp 00:09: [io  0x0500-0x057f]
[    0.724497] pnp 00:09: [mem 0xfed1c000-0xfed1ffff]
[    0.724644] pnp 00:09: [mem 0xfec00000-0xfecfffff]
[    0.724794] pnp 00:09: [mem 0xfed08000-0xfed08fff]
[    0.724960] pnp 00:09: [mem 0xff000000-0xffffffff]
[    0.725292] system 00:09: [io  0x0400-0x047f] has been reserved
[    0.725451] system 00:09: [io  0x1180-0x119f] has been reserved
[    0.725606] system 00:09: [io  0x0500-0x057f] has been reserved
[    0.725759] system 00:09: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.725935] system 00:09: [mem 0xfec00000-0xfecfffff] could not be reserved
[    0.726095] system 00:09: [mem 0xfed08000-0xfed08fff] has been reserved
[    0.726253] system 00:09: [mem 0xff000000-0xffffffff] has been reserved
[    0.726408] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.727061] pnp 00:0a: [mem 0xfed00000-0xfed003ff]
[    0.727349] pnp 00:0a: Plug and Play ACPI device, IDs PNP0103 (active)
[    0.727857] pnp 00:0b: [irq 20]
[    0.728168] pnp 00:0b: Plug and Play ACPI device, IDs SMO8800 (active)
[    0.729246] pnp: PnP ACPI: found 12 devices
[    0.729397] ACPI: ACPI bus type pnp unregistered
[    0.743992] PCI: max bus depth: 1 pci_try_num: 2
[    0.744211] pci 0000:00:1c.1: BAR 15: assigned [mem 0xbc000000-0xbc1fffff 64bit pref]
[    0.744436] pci 0000:00:1c.1: BAR 13: assigned [io  0x2000-0x2fff]
[    0.744588] pci 0000:00:1c.0: BAR 14: assigned [mem 0xbc200000-0xbc3fffff]
[    0.744743] pci 0000:00:1c.0: BAR 15: assigned [mem 0xbc400000-0xbc5fffff 64bit pref]
[    0.744977] pci 0000:00:1c.0: BAR 13: assigned [io  0x3000-0x3fff]
[    0.745135] pci 0000:00:01.0: PCI bridge to [bus 01-01]
[    0.745290] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.745441] pci 0000:00:01.0:   bridge window [mem 0xfa000000-0xfb0fffff]
[    0.745594] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff 64bit pref]
[    0.745818] pci 0000:00:1c.0: PCI bridge to [bus 11-11]
[    0.745980] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.746140] pci 0000:00:1c.0:   bridge window [mem 0xbc200000-0xbc3fffff]
[    0.746303] pci 0000:00:1c.0:   bridge window [mem 0xbc400000-0xbc5fffff 64bit pref]
[    0.746531] pci 0000:00:1c.1: PCI bridge to [bus 12-12]
[    0.746685] pci 0000:00:1c.1:   bridge window [io  0x2000-0x2fff]
[    0.746853] pci 0000:00:1c.1:   bridge window [mem 0xfbd00000-0xfbdfffff]
[    0.747013] pci 0000:00:1c.1:   bridge window [mem 0xbc000000-0xbc1fffff 64bit pref]
[    0.747241] pci 0000:00:1c.2: PCI bridge to [bus 13-13]
[    0.747395] pci 0000:00:1c.2:   bridge window [io  0xd000-0xdfff]
[    0.747553] pci 0000:00:1c.2:   bridge window [mem 0xfbc00000-0xfbcfffff]
[    0.747711] pci 0000:00:1c.2:   bridge window [mem 0xd2c00000-0xd2cfffff 64bit pref]
[    0.747953] pci 0000:00:1c.4: PCI bridge to [bus 15-15]
[    0.748106] pci 0000:00:1c.4:   bridge window [io  0xc000-0xcfff]
[    0.748264] pci 0000:00:1c.4:   bridge window [mem 0xfb200000-0xfbbfffff]
[    0.748425] pci 0000:00:1c.4:   bridge window [mem 0xd2100000-0xd2afffff 64bit pref]
[    0.748650] pci 0000:00:1e.0: PCI bridge to [bus 20-20]
[    0.748830] pci 0000:00:01.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.749002] pci 0000:00:01.0: setting latency timer to 64
[    0.749171] pci 0000:00:1c.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
[    0.749328] pci 0000:00:1c.0: setting latency timer to 64
[    0.749483] pci 0000:00:1c.1: PCI INT B -> GSI 16 (level, low) -> IRQ 16
[    0.749643] pci 0000:00:1c.1: setting latency timer to 64
[    0.749806] pci 0000:00:1c.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
[    0.749976] pci 0000:00:1c.2: setting latency timer to 64
[    0.750137] pci 0000:00:1c.4: PCI INT A -> GSI 17 (level, low) -> IRQ 17
[    0.750297] pci 0000:00:1c.4: setting latency timer to 64
[    0.750452] pci 0000:00:1e.0: setting latency timer to 64
[    0.750608] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    0.750758] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    0.750923] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.751077] pci_bus 0000:00: resource 7 [mem 0xbc000000-0xffffffff]
[    0.751229] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    0.751380] pci_bus 0000:01: resource 1 [mem 0xfa000000-0xfb0fffff]
[    0.751533] pci_bus 0000:01: resource 2 [mem 0xc0000000-0xd1ffffff 64bit pref]
[    0.751747] pci_bus 0000:11: resource 0 [io  0x3000-0x3fff]
[    0.751914] pci_bus 0000:11: resource 1 [mem 0xbc200000-0xbc3fffff]
[    0.752070] pci_bus 0000:11: resource 2 [mem 0xbc400000-0xbc5fffff 64bit pref]
[    0.752290] pci_bus 0000:12: resource 0 [io  0x2000-0x2fff]
[    0.752438] pci_bus 0000:12: resource 1 [mem 0xfbd00000-0xfbdfffff]
[    0.752589] pci_bus 0000:12: resource 2 [mem 0xbc000000-0xbc1fffff 64bit pref]
[    0.752807] pci_bus 0000:13: resource 0 [io  0xd000-0xdfff]
[    0.752969] pci_bus 0000:13: resource 1 [mem 0xfbc00000-0xfbcfffff]
[    0.753127] pci_bus 0000:13: resource 2 [mem 0xd2c00000-0xd2cfffff 64bit pref]
[    0.753350] pci_bus 0000:15: resource 0 [io  0xc000-0xcfff]
[    0.753500] pci_bus 0000:15: resource 1 [mem 0xfb200000-0xfbbfffff]
[    0.753654] pci_bus 0000:15: resource 2 [mem 0xd2100000-0xd2afffff 64bit pref]
[    0.753876] pci_bus 0000:20: resource 4 [io  0x0000-0x0cf7]
[    0.754031] pci_bus 0000:20: resource 5 [io  0x0d00-0xffff]
[    0.755612] pci_bus 0000:20: resource 6 [mem 0x000a0000-0x000bffff]
[    0.755769] pci_bus 0000:20: resource 7 [mem 0xbc000000-0xffffffff]
[    0.755934] pci_bus 0000:ff: resource 0 [io  0x0000-0xffff]
[    0.756086] pci_bus 0000:ff: resource 1 [mem 0x00000000-0xfffffffff]
[    0.756307] NET: Registered protocol family 2
[    0.756601] IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.757841] TCP established hash table entries: 524288 (order: 11, 8388608 bytes)
[    0.761183] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.761716] TCP: Hash tables configured (established 524288 bind 65536)
[    0.761889] TCP reno registered
[    0.762049] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.762233] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.762574] NET: Registered protocol family 1
[    1.008488] pci 0000:01:00.0: Boot video device
[    1.008693] PCI: CLS 64 bytes, default 64
[    1.008955] Unpacking initramfs...
[    1.068739] Freeing initrd memory: 3128k freed
[    1.072594] audit: initializing netlink socket (disabled)
[    1.072776] type=2000 audit(1318687843.899:1): initialized
[    1.080564] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    1.108142] VFS: Disk quotas dquot_6.5.2
[    1.108476] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.108880] SGI XFS with ACLs, security attributes, realtime, large block/inode numbers, no debug enabled
[    1.111492] SGI XFS Quota Management subsystem
[    1.111658] msgmni has been set to 5880
[    1.112685] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    1.112911] io scheduler noop registered
[    1.113061] io scheduler deadline registered
[    1.113473] io scheduler cfq registered (default)
[    1.113902] pcieport 0000:00:01.0: setting latency timer to 64
[    1.114088] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
[    1.114413] pcieport 0000:00:1c.0: setting latency timer to 64
[    1.114620] pcieport 0000:00:1c.0: irq 41 for MSI/MSI-X
[    1.114943] pcieport 0000:00:1c.1: setting latency timer to 64
[    1.115158] pcieport 0000:00:1c.1: irq 42 for MSI/MSI-X
[    1.115506] pcieport 0000:00:1c.2: setting latency timer to 64
[    1.115713] pcieport 0000:00:1c.2: irq 43 for MSI/MSI-X
[    1.116039] pcieport 0000:00:1c.4: setting latency timer to 64
[    1.116267] pcieport 0000:00:1c.4: irq 44 for MSI/MSI-X
[    1.116998] intel_idle: MWAIT substates: 0x1120
[    1.117153] intel_idle: v0.4 model 0x25
[    1.117319] intel_idle: lapic_timer_reliable_states 0xffffffff
[    1.117769] ERST: Table is not found!
[    1.118103] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.183188] i8042: PNP: PS/2 Controller [PNP0303:KBC,PNP0f13:PS2] at 0x60,0x64 irq 1,12
[    1.204782] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.204993] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.205602] mousedev: PS/2 mouse device common for all mice
[    1.205997] rtc_cmos 00:03: RTC can wake from S4
[    1.206410] rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
[    1.206599] rtc0: alarms up to one year, y3k, 114 bytes nvram, hpet irqs
[    1.207668] device-mapper: ioctl: 4.21.0-ioctl (2011-07-06) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[    1.209193] cpuidle: using governor ladder
[    1.211605] cpuidle: using governor menu
[    1.212121] TCP cubic registered
[    1.213075] NET: Registered protocol family 10
[    1.214490] Registering the dns_resolver key type
[    1.215114] PM: Hibernation image not present or could not be loaded.
[    1.215282] registered taskstats version 1
[    1.223309]   Magic number: 15:252:182
[    1.223505] acpi device:41: hash matches
[    1.223749] rtc_cmos 00:03: setting system clock to 2011-10-15 14:10:44 UTC (1318687844)
[    1.225111] Freeing unused kernel memory: 548k freed
[    1.225357] Write protecting the kernel read-only data: 8192k
[    1.231221] Freeing unused kernel memory: 2036k freed
[    1.234301] Freeing unused kernel memory: 956k freed
[    1.242287] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.302960] udevd[696]: starting version 172
[    1.364666] thermal LNXTHERM:00: registered as thermal_zone0
[    1.364843] ACPI: Thermal Zone [THM] (80 C)
[    1.374938] SCSI subsystem initialized
[    1.377858] libata version 3.00 loaded.
[    1.378948] ahci 0000:00:1f.2: version 3.0
[    1.379141] ahci 0000:00:1f.2: PCI INT B -> GSI 19 (level, low) -> IRQ 19
[    1.379361] ahci 0000:00:1f.2: irq 45 for MSI/MSI-X
[    1.389835] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 3 Gbps 0x3f impl SATA mode
[    1.390068] ahci 0000:00:1f.2: flags: 64bit ncq sntf ilck pm led clo pio slum part ems sxs apst 
[    1.390300] ahci 0000:00:1f.2: setting latency timer to 64
[    1.401646] scsi0 : ahci
[    1.402324] scsi1 : ahci
[    1.402665] scsi2 : ahci
[    1.403036] scsi3 : ahci
[    1.403369] scsi4 : ahci
[    1.403695] scsi5 : ahci
[    1.405090] ata1: SATA max UDMA/133 abar m2048@0xfbe06000 port 0xfbe06100 irq 45
[    1.405316] ata2: SATA max UDMA/133 abar m2048@0xfbe06000 port 0xfbe06180 irq 45
[    1.405539] ata3: SATA max UDMA/133 abar m2048@0xfbe06000 port 0xfbe06200 irq 45
[    1.405783] ata4: SATA max UDMA/133 abar m2048@0xfbe06000 port 0xfbe06280 irq 45
[    1.406007] ata5: SATA max UDMA/133 abar m2048@0xfbe06000 port 0xfbe06300 irq 45
[    1.406227] ata6: SATA max UDMA/133 abar m2048@0xfbe06000 port 0xfbe06380 irq 45
[    1.710299] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.710492] ata4: SATA link down (SStatus 0 SControl 300)
[    1.710679] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.710865] ata3: SATA link down (SStatus 0 SControl 300)
[    1.711236] ata5: SATA link down (SStatus 0 SControl 300)
[    1.711863] ata6: SATA link down (SStatus 0 SControl 300)
[    1.712114] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by device (Stat=0x51 Err=0x04)
[    1.726434] ata2.00: ATAPI: TSSTcorp DVD+/-RW TS-L633C, DW60, max UDMA/100
[    1.726600] ata2.00: applying bridge limits
[    1.748299] ata2.00: configured for UDMA/100
[    1.753800] ata1.00: ATA-8: ST9320423AS, D005SDM1, max UDMA/133
[    1.754025] ata1.00: 625142448 sectors, multi 16: LBA48 NCQ (depth 31/32)
[    1.756868] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by device (Stat=0x51 Err=0x04)
[    1.757527] ata1.00: configured for UDMA/133
[    1.757968] scsi 0:0:0:0: Direct-Access     ATA      ST9320423AS      D005 PQ: 0 ANSI: 5
[    1.762029] scsi 1:0:0:0: CD-ROM            TSSTcorp DVD+-RW TS-L633C DW60 PQ: 0 ANSI: 5
[    1.768777] sd 0:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
[    1.769192] sd 0:0:0:0: [sda] Write Protect is off
[    1.769349] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.769540] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.823686]  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
[    1.825164] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.070651] Refined TSC clocksource calibration: 2393.999 MHz.
[    2.070820] Switching to clocksource tsc
[   37.274921] XFS (dm-1): Mounting Filesystem
[   37.409341] XFS (dm-1): Starting recovery (logdev: internal)
[   37.545132] XFS (dm-1): Ending recovery (logdev: internal)
[   38.873609] udevd[974]: starting version 172
[   39.452127] ACPI: acpi_idle yielding to intel_idle
[   39.463284] ACPI: AC Adapter [AC] (on-line)
[   39.485499] ACPI: Battery Slot [BAT0] (battery present)
[   39.486085] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input1
[   39.486323] ACPI: Power Button [PWRB]
[   39.486662] input: Lid Switch as /devices/LNXSYSTM:00/device:00/PNP0C0D:00/input/input2
[   39.489007] ACPI: Lid Switch [LID0]
[   39.489333] input: Sleep Button as /devices/LNXSYSTM:00/device:00/PNP0C0E:00/input/input3
[   39.489563] ACPI: Sleep Button [SBTN]
[   39.489863] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[   39.490100] ACPI: Power Button [PWRF]
[   39.534523] wmi: Mapper loaded
[   39.694988] usbcore: registered new interface driver usbfs
[   39.695235] usbcore: registered new interface driver hub
[   39.695465] usbcore: registered new device driver usb
[   39.715818] input: Dell WMI hotkeys as /devices/virtual/input/input5
[   39.821613] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   39.821808] ehci_hcd 0000:00:1a.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[   39.821993] ehci_hcd 0000:00:1a.0: setting latency timer to 64
[   39.822152] ehci_hcd 0000:00:1a.0: EHCI Host Controller
[   39.822349] ehci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 1
[   39.822622] ehci_hcd 0000:00:1a.0: debug port 2
[   39.826723] ehci_hcd 0000:00:1a.0: cache line size of 64 is not supported
[   39.826935] ehci_hcd 0000:00:1a.0: irq 16, io mem 0xfbe08000
[   39.836458] ehci_hcd 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[   39.836728] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[   39.836889] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   39.837126] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.2)
[   39.838757] usb usb1: Product: EHCI Host Controller
[   39.838907] usb usb1: Manufacturer: Linux 3.1.0-rc9-wl-debug-00147-g3ff4992 ehci_hcd
[   39.839128] usb usb1: SerialNumber: 0000:00:1a.0
[   39.839723] hub 1-0:1.0: USB hub found
[   39.839838] input: PC Speaker as /devices/platform/pcspkr/input/input6
[   39.840034] hub 1-0:1.0: 2 ports detected
[   39.840964] ehci_hcd 0000:00:1d.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
[   39.841156] ehci_hcd 0000:00:1d.0: setting latency timer to 64
[   39.841315] ehci_hcd 0000:00:1d.0: EHCI Host Controller
[   39.841487] ehci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
[   39.841751] ehci_hcd 0000:00:1d.0: debug port 2
[   39.846521] ehci_hcd 0000:00:1d.0: cache line size of 64 is not supported
[   39.848398] ehci_hcd 0000:00:1d.0: irq 23, io mem 0xfbe07000
[   39.861255] ehci_hcd 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[   39.861547] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[   39.862121] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   39.864053] usb usb2: Product: EHCI Host Controller
[   39.868967] usb usb2: Manufacturer: Linux 3.1.0-rc9-wl-debug-00147-g3ff4992 ehci_hcd
[   39.869191] usb usb2: SerialNumber: 0000:00:1d.0
[   39.869806] hub 2-0:1.0: USB hub found
[   39.869972] hub 2-0:1.0: 2 ports detected
[   39.896938] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[   39.897130] r8169 0000:13:00.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
[   39.897329] r8169 0000:13:00.0: setting latency timer to 64
[   39.897552] r8169 0000:13:00.0: irq 46 for MSI/MSI-X
[   39.898269] r8169 0000:13:00.0: eth0: RTL8168d/8111d at 0xffffc900128ea000, a4:ba:db:da:c0:b6, XID 083000c0 IRQ 46
[   39.919827] i801_smbus 0000:00:1f.3: PCI INT C -> GSI 18 (level, low) -> IRQ 18
[   40.065925] Linux agpgart interface v0.103
[   40.089175] [drm] Initialized drm 1.1.0 20060810
[   40.126553] snd_hda_intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
[   40.126863] snd_hda_intel 0000:00:1b.0: irq 47 for MSI/MSI-X
[   40.127067] snd_hda_intel 0000:00:1b.0: setting latency timer to 64
[   40.140948] usb 1-1: new high speed USB device number 2 using ehci_hcd
[   40.161283] cfg80211: Calling CRDA to update world regulatory domain
[   40.216175] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[   40.216339] nouveau 0000:01:00.0: setting latency timer to 64
[   40.218649] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x0a8a80a2)
[   40.225385] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[   40.242973] brcmsmac 0000:12:00.0: bus 18 slot 0 func 0 irq 5
[   40.243179] brcmsmac 0000:12:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
[   40.243440] brcmsmac 0000:12:00.0: setting latency timer to 64
[   40.255146] usb 1-1: New USB device found, idVendor=8087, idProduct=0020
[   40.255397] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   40.255994] hub 1-1:1.0: USB hub found
[   40.256364] hub 1-1:1.0: 6 ports detected
[   40.290174] input: HDA Intel Mic at Ext Front Jack as /devices/pci0000:00/0000:00:1b.0/sound/card0/input7
[   40.290725] input: HDA Intel HP Out at Ext Front Jack as /devices/pci0000:00/0000:00:1b.0/sound/card0/input8
[   40.359588] usb 2-1: new high speed USB device number 2 using ehci_hcd
[   40.366092] [drm] nouveau 0000:01:00.0: ... appears to be valid
[   40.366240] [drm] nouveau 0000:01:00.0: BIT BIOS found
[   40.366384] [drm] nouveau 0000:01:00.0: Bios version 70.18.49.00
[   40.366534] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[   40.366681] [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[   40.366891] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
[   40.367038] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011300 00000000
[   40.367182] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02022362 00020010
[   40.367326] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 0000000e 00000000
[   40.367470] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16 4
[   40.367619] [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[   40.367866] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[   40.368088] [drm] nouveau 0000:01:00.0:   2: 0x00001261: type 0x61 idx 2 tag 0x07
[   40.368310] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xDCC0
[   40.404574] sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[   40.404790] cdrom: Uniform CD-ROM driver Revision: 3.20
[   40.405273] sr 1:0:0:0: Attached scsi CD-ROM sr0
[   40.429449] [drm] nouveau 0000:01:00.0: 0xDF8D: Condition still not met after 20ms, skipping following opcodes
[   40.449647] [drm] nouveau 0000:01:00.0: 0xDF91: Condition still not met after 20ms, skipping following opcodes
[   40.469876] [drm] nouveau 0000:01:00.0: 0xE117: Condition still not met after 20ms, skipping following opcodes
[   40.469925] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   40.470050] sr 1:0:0:0: Attached scsi generic sg1 type 5
[   40.470391] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xE144
[   40.474380] usb 2-1: New USB device found, idVendor=8087, idProduct=0020
[   40.474533] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   40.475097] hub 2-1:1.0: USB hub found
[   40.475388] hub 2-1:1.0: 8 ports detected
[   40.479489] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEC78
[   40.479718] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEC91
[   40.522578] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xED78
[   40.522797] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xEDDD
[   40.542983] [drm] nouveau 0000:01:00.0: 0xDB34: Condition still not met after 20ms, skipping following opcodes
[   40.563697] [drm] nouveau 0000:01:00.0: 3 available performance level(s)
[   40.563856] [drm] nouveau 0000:01:00.0: 0: core 135MHz shader 270MHz memory 135MHz timing 2 voltage 850mV
[   40.564142] [drm] nouveau 0000:01:00.0: 1: core 405MHz shader 810MHz memory 405MHz timing 1 voltage 850mV
[   40.564388] [drm] nouveau 0000:01:00.0: 3: core 625MHz shader 1530MHz memory 790MHz timing 0 voltage 1030mV
[   40.564661] [drm] nouveau 0000:01:00.0: c: core 405MHz shader 810MHz memory 405MHz voltage 800mV
[   40.569782] [TTM] Zone  kernel: Available graphics memory: 1507232 kiB.
[   40.569939] [TTM] Initializing pool allocator.
[   40.570109] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[   40.570277] mtrr: type mismatch for c0000000,10000000 old: write-back new: write-combining
[   40.570517] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[   40.685164] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   40.685345] [drm] No driver support for vblank timestamp query.
[   40.845745] Synaptics Touchpad, model: 1, fw: 7.2, id: 0x1c0b1, caps: 0xd04733/0xa40000/0xa0000
[   40.860346] [drm] nouveau 0000:01:00.0: allocated 1366x768 fb: 0x310000, bo ffff8800b63b9568
[   40.860730] fbcon: nouveaufb (fb0) is primary device
[   40.884513] cfg80211: Updating information on frequency 2412 MHz for a 20 MHz width channel with regulatory rule:
[   40.884516] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884518] cfg80211: Updating information on frequency 2417 MHz for a 20 MHz width channel with regulatory rule:
[   40.884520] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884522] cfg80211: Updating information on frequency 2422 MHz for a 20 MHz width channel with regulatory rule:
[   40.884524] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884525] cfg80211: Updating information on frequency 2427 MHz for a 20 MHz width channel with regulatory rule:
[   40.884527] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884529] cfg80211: Updating information on frequency 2432 MHz for a 20 MHz width channel with regulatory rule:
[   40.884531] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884532] cfg80211: Updating information on frequency 2437 MHz for a 20 MHz width channel with regulatory rule:
[   40.884534] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884536] cfg80211: Updating information on frequency 2442 MHz for a 20 MHz width channel with regulatory rule:
[   40.884538] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884540] cfg80211: Updating information on frequency 2447 MHz for a 20 MHz width channel with regulatory rule:
[   40.884542] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884543] cfg80211: Updating information on frequency 2452 MHz for a 20 MHz width channel with regulatory rule:
[   40.884545] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884546] cfg80211: Updating information on frequency 2457 MHz for a 20 MHz width channel with regulatory rule:
[   40.884548] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884550] cfg80211: Updating information on frequency 2462 MHz for a 20 MHz width channel with regulatory rule:
[   40.884552] cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884553] cfg80211: Updating information on frequency 2467 MHz for a 20 MHz width channel with regulatory rule:
[   40.884555] cfg80211: 2457000 KHz - 2482000 KHz @ 20000 KHz), (600 mBi, 2000 mBm)
[   40.884557] cfg80211: Updating information on frequency 2472 MHz for a 20 MHz width channel with regulatory rule:
[   40.884559] cfg80211: 2457000 KHz - 2482000 KHz @ 20000 KHz), (600 mBi, 2000 mBm)
[   40.884560] cfg80211: Updating information on frequency 2484 MHz for a 20 MHz width channel with regulatory rule:
[   40.884605] cfg80211: 2474000 KHz - 2494000 KHz @ 20000 KHz), (600 mBi, 2000 mBm)
[   40.884606] cfg80211: Updating information on frequency 5180 MHz for a 20 MHz width channel with regulatory rule:
[   40.884608] cfg80211: 5170000 KHz - 5250000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884610] cfg80211: Updating information on frequency 5200 MHz for a 20 MHz width channel with regulatory rule:
[   40.884612] cfg80211: 5170000 KHz - 5250000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884613] cfg80211: Updating information on frequency 5220 MHz for a 20 MHz width channel with regulatory rule:
[   40.884615] cfg80211: 5170000 KHz - 5250000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884617] cfg80211: Updating information on frequency 5240 MHz for a 20 MHz width channel with regulatory rule:
[   40.884619] cfg80211: 5170000 KHz - 5250000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884621] cfg80211: Disabling freq 5260 MHz
[   40.884622] cfg80211: Disabling freq 5280 MHz
[   40.884623] cfg80211: Disabling freq 5300 MHz
[   40.884624] cfg80211: Disabling freq 5320 MHz
[   40.884625] cfg80211: Disabling freq 5500 MHz
[   40.884626] cfg80211: Disabling freq 5520 MHz
[   40.884627] cfg80211: Disabling freq 5540 MHz
[   40.884628] cfg80211: Disabling freq 5560 MHz
[   40.884629] cfg80211: Disabling freq 5580 MHz
[   40.884630] cfg80211: Disabling freq 5600 MHz
[   40.884637] cfg80211: Disabling freq 5620 MHz
[   40.884638] cfg80211: Disabling freq 5640 MHz
[   40.884639] cfg80211: Disabling freq 5660 MHz
[   40.884640] cfg80211: Disabling freq 5680 MHz
[   40.884642] cfg80211: Disabling freq 5700 MHz
[   40.884643] cfg80211: Updating information on frequency 5745 MHz for a 20 MHz width channel with regulatory rule:
[   40.884645] cfg80211: 5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884648] cfg80211: Updating information on frequency 5765 MHz for a 20 MHz width channel with regulatory rule:
[   40.884650] cfg80211: 5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884652] cfg80211: Updating information on frequency 5785 MHz for a 20 MHz width channel with regulatory rule:
[   40.884654] cfg80211: 5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884655] cfg80211: Updating information on frequency 5805 MHz for a 20 MHz width channel with regulatory rule:
[   40.884657] cfg80211: 5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.884659] cfg80211: Updating information on frequency 5825 MHz for a 20 MHz width channel with regulatory rule:
[   40.884661] cfg80211: 5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 2000 mBm)
[   40.921550] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input9
[   40.924470] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
[   40.925428] cfg80211: Pending regulatory request, waiting for it to be processed...
[   42.192341] Console: switching to colour frame buffer device 170x48
[   42.223904] fb0: nouveaufb frame buffer device
[   42.223906] drm: registered panic notifier
[   42.223916] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
[   42.224012] snd_hda_intel 0000:01:00.1: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[   42.224017] hda_intel: Disabling MSI
[   42.224094] snd_hda_intel 0000:01:00.1: setting latency timer to 64
[   42.440049] HDMI status: Codec=0 Pin=5 Presence_Detect=0 ELD_Valid=0
[   42.478974] HDMI status: Codec=1 Pin=5 Presence_Detect=0 ELD_Valid=0
[   42.517908] HDMI status: Codec=2 Pin=5 Presence_Detect=0 ELD_Valid=0
[   42.556826] HDMI status: Codec=3 Pin=5 Presence_Detect=0 ELD_Valid=0
[   42.575533] input: HDA NVidia HDMI/DP as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10
[   42.576332] input: HDA NVidia HDMI/DP as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11
[   42.576741] input: HDA NVidia HDMI/DP as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input12
[   42.577219] input: HDA NVidia HDMI/DP as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input13
[   44.673927] loop: module loaded
[   45.289107] Adding 2949116k swap on /dev/mapper/sda6_crypt.  Priority:-1 extents:1 across:2949116k 
[   45.575627] XFS (sda3): Mounting Filesystem
[   45.692833] XFS (sda3): Ending clean mount
[   45.764693] XFS (dm-2): Mounting Filesystem
[   45.920590] XFS (dm-2): Ending clean mount
[   46.719166] fuse init (API version 7.17)
[   47.632504] r8169 0000:13:00.0: eth0: link down
[   47.633080] ADDRCONF(NETDEV_UP): eth0: link is not ready
[   47.650252] ieee80211 phy0: brcms_ops_config: change monitor mode: false (implement)
[   47.651485] ieee80211 phy0: brcms_ops_config: change power-save mode: false (implement)
[   47.664597] ieee80211 phy0: brcms_ops_bss_info_changed: qos enabled: false (implement)
[   47.665186] ADDRCONF(NETDEV_UP): wlan0: link is not ready
[   47.781728] NET: Registered protocol family 17
[   47.888338] microcode: CPU0 sig=0x20655, pf=0x10, revision=0x2
[   47.891789] microcode: CPU1 sig=0x20655, pf=0x10, revision=0x2
[   47.895373] microcode: CPU2 sig=0x20655, pf=0x10, revision=0x2
[   47.899243] microcode: CPU3 sig=0x20655, pf=0x10, revision=0x2
[   47.901973] microcode: Microcode Update Driver: v2.00 <tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
[   49.015214] lp: driver loaded but no devices found
[   49.043382] ppdev: user-space parallel port driver
[   50.342437] wlan0: authenticate with 00:03:c9:a3:d2:7d (try 1)
[   50.344304] wlan0: authenticated
[   50.348213] wlan0: associate with 00:03:c9:a3:d2:7d (try 1)
[   50.351099] wlan0: RX AssocResp from 00:03:c9:a3:d2:7d (capab=0x411 status=0 aid=6)
[   50.351302] wlan0: associated
[   50.352245] ieee80211 phy0: brcms_ops_bss_info_changed: qos enabled: false (implement)
[   50.352438] ieee80211 phy0: brcmsmac: brcms_ops_bss_info_changed: associated
[   50.352720] ieee80211 phy0: changing basic rates failed: -22
[   50.353151] ieee80211 phy0: brcms_ops_bss_info_changed: arp filtering: enabled true, count 0 (implement)
[   50.354027] ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   53.855527] ieee80211 phy0: brcms_ops_bss_info_changed: arp filtering: enabled true, count 1 (implement)

--Boundary-00=_VABnOxvdbE8w7af
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Boundary-00=_VABnOxvdbE8w7af--
