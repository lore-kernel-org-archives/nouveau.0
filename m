From: Peter Saisanas <psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Nouveau driver cannot extract DCB Block from OF DEV TREE
Date: Mon, 13 Jul 2015 07:48:25 +1000
Message-ID: <55A2E0A9.1070000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090908060801040400080608"
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

This is a multi-part message in MIME format.
--------------090908060801040400080608
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
As mentioned recently in the nouveau IRC room recently,

When running a Powermac 11.2, (G5 Quad) with a Quadro FX4500 (NV47), 
previous kernels had no issue extracting the DCB block / GPU BIOS from 
the OpenFirmware device tree via the FCODE ROM.
Last vanilla kernel that i have compiled seemed to work fine (vanilla 
3.18.16).

However, when compiling a newer vanilla kernel, (vanilla 4.1.2), nouveau 
seems to have an issue reading the DCB block / GPU BIOS from the 
OpenFirmware device tree.

As instructed, i have attached a dmesg.log along with a dump of the 
NVDA,BMP fimage out of the following folder: 
/sys/firmware/devicetree/base/pci@0,f0000000/NVDA,Parent@0/

Also, i have passed the following nouveau module options as instructed:
options nouveau config="NvMSI=0,debug=debug,VBIOS=trace"

Please let me know if there is any more info required.

Thanks for your help!

Best Regards,
Peter



--------------090908060801040400080608
Content-Type: text/x-log;
 name="dmesg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.log"

[    0.000000] Allocated 4096 bytes for 4 pacas at c00000000ffff000
[    0.000000] DART table allocated at: c00000007f000000
[    0.000000] Using PowerMac machine description
[    0.000000] Page orders: linear mapping = 24, virtual = 12, io = 12
[    0.000000] Found initrd at 0xc000000001500000:0xc000000001c57000
[    0.000000] Found U4 memory controller & host bridge @ 0xf8000000 revision: 0x42
[    0.000000] Mapped at 0xd000080080000000
[    0.000000] Found a Shasta mac-io controller, rev: 0, mapped at 0xd000080080041000
[    0.000000] PowerMac motherboard: PowerMac G5 Dual Core
[    0.000000] DART IOMMU initialized for U4 type chipset
[    0.000000] bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] Starting Linux PPC64 #1 SMP Sun Jul 12 11:01:34 AEST 2015
[    0.000000] -----------------------------------------------------
[    0.000000] ppc64_pft_size    = 0x0
[    0.000000] phys_mem_size     = 0x400000000
[    0.000000] cpu_features      = 0x0804806318100448
[    0.000000]   possible        = 0x1fffffef18500649
[    0.000000]   always          = 0x0000000018100040
[    0.000000] cpu_user_features = 0xdc080000 0x00000000
[    0.000000] mmu_features      = 0x0c000001
[    0.000000] firmware_features = 0x0000000000000000
[    0.000000] htab_address      = 0xc000000470000000
[    0.000000] htab_hash_mask    = 0x1fffff
[    0.000000] -----------------------------------------------------
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.1.2-powerpc64 (root@powermac-g5-quad) (gcc version 4.9.2 (Debian 4.9.2-10) ) #1 SMP Sun Jul 12 11:01:34 AEST 2015
[    0.000000] Found U4-PCIE PCI host bridge.  Firmware bus number: 0->255
[    0.000000] PCI host bridge /pci@0,f0000000  ranges:
[    0.000000]  MEM 0x00000000f1000000..0x00000000f1ffffff -> 0x00000000f1000000 
[    0.000000]   IO 0x00000000f0000000..0x00000000f07fffff -> 0x0000000000000000
[    0.000000]  MEM 0x0000000090000000..0x00000000bfffffff -> 0x0000000090000000 
[    0.000000] Can't get bus-range for /ht@0,f2000000, assume bus 0
[    0.000000] Found U3-HT PCI host bridge.  Firmware bus number: 0->239
[    0.000000] PCI host bridge /ht@0,f2000000 (primary) ranges:
[    0.000000] SMU: Driver 0.7 (c) 2005 Benjamin Herrenschmidt, IBM Corp.
[    0.000000] nvram: Checking bank 0...
[    0.000000] nvram: gen0=1710, gen1=1711
[    0.000000] nvram: Active bank is: 1
[    0.000000] nvram: OF partition at 0x410
[    0.000000] nvram: XP partition at 0x1020
[    0.000000] nvram: NR partition at 0x1120
[    0.000000] Top of RAM: 0x480000000, Total RAM: 0x400000000
[    0.000000] Memory hole size: 2048MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000047fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000047fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000047fffffff]
[    0.000000] On node 0 totalpages: 4194304
[    0.000000] free_area_init_node: node 0, pgdat c000000000715200, node_mem_map c0000004603baf80
[    0.000000]   DMA zone: 64512 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 4194304 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 21 pages/cpu @c000000460200000 s46360 r0 d39656 u262144
[    0.000000] pcpu-alloc: s46360 r0 d39656 u262144 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 0 1 2 3 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 4129792
[    0.000000] Kernel command line: root=UUID=3e9f281b-e012-4b4f-8c36-6fe559e02786 ro  
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[    0.000000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 16199008K/16777216K available (5428K kernel code, 936K rwdata, 1260K rodata, 316K init, 478K bss, 578208K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:512 nr_irqs:512 16
[    0.000000] mpic: Resetting
[    0.000000] mpic: Setting up MPIC " MPIC 1   " version 1.2 at f8040000, max 4 CPUs
[    0.000000] mpic: ISU size: 124, shift: 7, mask: 7f
[    0.000000] mpic: Initializing for 124 sources
[    0.000000] mpic: Setting up HT PICs workarounds for U3/U4
[    0.000000] mpic:   - HT:01.0 disabled MSI mapping found @ 0xfee00000
[    0.000000] mpic:   - HT:02.0 disabled MSI mapping found @ 0xfee00000
[    0.000000] mpic:   - HT:03.0 disabled MSI mapping found @ 0xfee00000
[    0.000000] mpic:   - HT:04.0 disabled MSI mapping found @ 0xfee00000
[    0.000000] mpic:   - HT:05.0 disabled MSI mapping found @ 0xfee00000
[    0.000000] mpic:   - HT:06.0 disabled MSI mapping found @ 0xfee00000
[    0.000000] mpic:   - HT:07.0 [0x90] vendor 106b device 0053 has 86 irqs
[    0.000000] time_init: decrementer frequency = 33.333333 MHz
[    0.000000] time_init: processor frequency   = 2500.000000 MHz
[    0.000002] clocksource timebase: mask: 0xffffffffffffffff max_cycles: 0x7b00c4bad, max_idle_ns: 440795202744 ns
[    0.000006] clocksource: timebase mult[1e000005] shift[24] registered
[    0.000009] clockevent: decrementer mult[8888887] shift[32] cpu[0]
[    0.000059] Console: colour dummy device 80x25
[    0.000063] console [tty0] enabled
[    0.000068] bootconsole [udbg0] disabled
[    0.000074] pid_max: default: 32768 minimum: 301
[    0.000105] Security Framework initialized
[    0.000113] AppArmor: AppArmor disabled by boot time parameter
[    0.000128] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.000133] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.000686] Initializing cgroup subsys blkio
[    0.000696] Initializing cgroup subsys devices
[    0.000702] Initializing cgroup subsys freezer
[    0.000708] Initializing cgroup subsys net_cls
[    0.000714] Initializing cgroup subsys perf_event
[    0.000858] PowerMac SMP probe found 4 cpus
[    0.000945] KeyWest i2c @0xf8001003 irq 16 /u4@0,f8000000/i2c@f8001000
[    0.000950]  channel 1 bus /u4@0,f8000000/i2c@f8001000/i2c-bus@1
[    0.000991] KeyWest i2c @0x80018000 irq 27 /ht@0,f2000000/pci@8/mac-io@7/i2c@18000
[    0.000996]  channel 0 bus /ht@0,f2000000/pci@8/mac-io@7/i2c@18000/i2c-bus@0
[    0.001000]  channel 0 bus /ht@0,f2000000/pci@8/mac-io@7/i2c@18000/i2c-bus@0
[    0.001061] SMU i2c /smu@0,0/smu-i2c-control@0
[    0.001065]  channel b bus /smu@0,0/smu-i2c-control@0/i2c-bus@b
[    0.001069]  channel e bus /smu@0,0/smu-i2c-control@0/i2c-bus@e
[    0.001083] Processor timebase sync using platform function
[    0.001087] mpic: requesting IPIs...
[    0.001120] PPC970/FX/MP performance monitor hardware support registered
[    0.005024] Brought up 4 CPUs
[    0.005378] devtmpfs: initialized
[    0.007371] device-tree: Duplicate name in i2c@18000, renamed to "i2c-bus@0#1"
[    0.009254] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.009694] NET: Registered protocol family 16
[    0.013998] cpuidle: using governor ladder
[    0.020011] cpuidle: using governor menu
[    0.020413] PCI: Probing PCI hardware
[    0.020503] PCI host bridge to bus 0000:00
[    0.020512] pci_bus 0000:00: root bus resource [io  0x10000-0x80ffff] (bus address [0x0000-0x7fffff])
[    0.020522] pci_bus 0000:00: root bus resource [mem 0xf1000000-0xf1ffffff]
[    0.020530] pci_bus 0000:00: root bus resource [mem 0x90000000-0xbfffffff]
[    0.020537] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.020547] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.020578] pci 0000:00:0b.0: [106b:005b] type 01 class 0x060400
[    0.020609] PCI: Fixup U4 PCIe bridge range: [mem 0x90000000-0xbfffffff]
[    0.020642] pci 0000:00:0b.0: PME# supported from D0 D3hot D3cold
[    0.053546] IOMMU table initialized, virtual merging enabled
[    0.053616] pci 0000:0a:00.0: [10de:009d] type 00 class 0x030000
[    0.053632] pci 0000:0a:00.0: reg 0x10: [mem 0x92000000-0x92ffffff]
[    0.053645] pci 0000:0a:00.0: reg 0x14: [mem 0xa0000000-0xbfffffff 64bit pref]
[    0.053658] pci 0000:0a:00.0: reg 0x1c: [mem 0x91000000-0x91ffffff 64bit]
[    0.053667] pci 0000:0a:00.0: reg 0x24: [io  0x10000-0x1007f]
[    0.053676] pci 0000:0a:00.0: reg 0x30: [mem 0x90000000-0x9001ffff pref]
[    0.053766] pci 0000:0a:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    0.053782] pci 0000:00:0b.0: PCI bridge to [bus 0a]
[    0.053793] pci 0000:00:0b.0:   bridge window [io  0x10000-0x1ffff]
[    0.053797] pci 0000:00:0b.0:   bridge window [mem 0x90000000-0xbfffffff]
[    0.053804] pci 0000:00:0b.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    0.053832] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 0a
[    0.053894] PCI host bridge to bus 0001:00
[    0.053901] pci_bus 0001:00: root bus resource [io  0x811000-0xc10fff] (bus address [0x0000-0x3fffff])
[    0.053912] pci_bus 0001:00: root bus resource [mem 0xfa000000-0xffffffff]
[    0.053919] pci_bus 0001:00: root bus resource [mem 0x80000000-0x8fffffff]
[    0.053926] pci_bus 0001:00: root bus resource [mem 0xc0000000-0xefffffff]
[    0.053933] pci_bus 0001:00: root bus resource [bus 00-ef]
[    0.053941] pci_bus 0001:00: busn_res: [bus 00-ef] end is updated to ff
[    0.053956] pci 0001:00:00.0: [106b:0074] type 00 class 0x060000
[    0.054025] pci 0001:00:01.0: [1166:0130] type 01 class 0x060400
[    0.054112] pci 0001:00:02.0: [1166:0130] type 01 class 0x060400
[    0.054201] pci 0001:00:03.0: [1166:0132] type 01 class 0x060400
[    0.054283] pci 0001:00:04.0: [1166:0132] type 01 class 0x060400
[    0.054363] pci 0001:00:05.0: [1166:0132] type 01 class 0x060400
[    0.054448] pci 0001:00:06.0: [1166:0132] type 01 class 0x060400
[    0.054531] pci 0001:00:07.0: [106b:0053] type 01 class 0x060400
[    0.054628] pci 0001:00:08.0: [106b:0054] type 01 class 0x060400
[    0.054719] pci 0001:00:09.0: [106b:0055] type 01 class 0x060400
[    0.054879] pci 0001:00:01.0: PCI bridge to [bus 04]
[    0.054941] pci 0001:05:04.0: [14e4:166a] type 00 class 0x020000
[    0.054955] pci 0001:05:04.0: reg 0x10: [mem 0xfa530000-0xfa53ffff 64bit]
[    0.054964] pci 0001:05:04.0: reg 0x18: [mem 0xfa520000-0xfa52ffff 64bit]
[    0.055003] pci 0001:05:04.0: PME# supported from D3hot D3cold
[    0.055061] pci 0001:05:04.1: [14e4:166a] type 00 class 0x020000
[    0.055076] pci 0001:05:04.1: reg 0x10: [mem 0xfa510000-0xfa51ffff 64bit]
[    0.055085] pci 0001:05:04.1: reg 0x18: [mem 0xfa500000-0xfa50ffff 64bit]
[    0.055123] pci 0001:05:04.1: PME# supported from D3hot D3cold
[    0.055188] pci 0001:00:02.0: PCI bridge to [bus 05]
[    0.055199] pci 0001:00:02.0:   bridge window [mem 0xfa500000-0xfa5fffff]
[    0.055258] pci 0001:00:03.0: PCI bridge to [bus 06]
[    0.055309] pci 0001:00:04.0: PCI bridge to [bus 07]
[    0.055359] pci 0001:00:05.0: PCI bridge to [bus 08]
[    0.055408] pci 0001:00:06.0: PCI bridge to [bus 09]
[    0.055472] pci 0001:00:07.0: PCI bridge to [bus 02]
[    0.055484] pci 0001:00:07.0:   bridge window [mem 0xfa000000-0xfa3fffff]
[    0.055489] pci 0001:00:07.0:   bridge window [mem 0x00000000-0x000fffff pref]
[    0.055539] pci 0001:01:01.0: [14e4:4318] type 00 class 0x028000
[    0.055550] pci 0001:01:01.0: reg 0x10: [mem 0x80084000-0x80085fff]
[    0.055640] pci 0001:01:07.0: [106b:004f] type 00 class 0xff0000
[    0.055650] pci 0001:01:07.0: reg 0x10: [mem 0x80000000-0x8007ffff]
[    0.055744] pci 0001:01:0b.0: [1033:0035] type 00 class 0x0c0310
[    0.055758] pci 0001:01:0b.0: reg 0x10: [mem 0x80082000-0x80082fff]
[    0.055807] pci 0001:01:0b.0: supports D1 D2
[    0.055810] pci 0001:01:0b.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.055868] pci 0001:01:0b.1: [1033:0035] type 00 class 0x0c0310
[    0.055882] pci 0001:01:0b.1: reg 0x10: [mem 0x80081000-0x80081fff]
[    0.055931] pci 0001:01:0b.1: supports D1 D2
[    0.055934] pci 0001:01:0b.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.055993] pci 0001:01:0b.2: [1033:00e0] type 00 class 0x0c0320
[    0.056006] pci 0001:01:0b.2: reg 0x10: [mem 0x80080000-0x800800ff]
[    0.056056] pci 0001:01:0b.2: supports D1 D2
[    0.056059] pci 0001:01:0b.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.056117] pci 0001:00:08.0: PCI bridge to [bus 01]
[    0.056129] pci 0001:00:08.0:   bridge window [mem 0x80000000-0x800fffff]
[    0.056134] pci 0001:00:08.0:   bridge window [mem 0x00000000-0x000fffff pref]
[    0.056224] pci 0001:03:0c.0: [1166:0240] type 00 class 0x01018f
[    0.056234] pci 0001:03:0c.0: reg 0x10: [io  0x811000-0x811007]
[    0.056242] pci 0001:03:0c.0: reg 0x14: [io  0x811000-0x811003]
[    0.056249] pci 0001:03:0c.0: reg 0x18: [io  0x811000-0x811007]
[    0.056257] pci 0001:03:0c.0: reg 0x1c: [io  0x811000-0x811003]
[    0.056264] pci 0001:03:0c.0: reg 0x20: [io  0x811000-0x81100f]
[    0.056272] pci 0001:03:0c.0: reg 0x24: [mem 0xfa402000-0xfa403fff]
[    0.056343] pci 0001:03:0d.0: [106b:0050] type 00 class 0xff0000
[    0.056353] pci 0001:03:0d.0: reg 0x10: [mem 0xfa404000-0xfa407fff]
[    0.056437] pci 0001:03:0e.0: [106b:0052] type 00 class 0x0c0010
[    0.056449] pci 0001:03:0e.0: reg 0x10: [mem 0xfa400000-0xfa400fff]
[    0.056494] pci 0001:03:0e.0: supports D1 D2
[    0.056497] pci 0001:03:0e.0: PME# supported from D0 D1 D2 D3hot
[    0.056551] pci 0001:00:09.0: PCI bridge to [bus 03]
[    0.056563] pci 0001:00:09.0:   bridge window [mem 0xfa400000-0xfa4fffff]
[    0.056568] pci 0001:00:09.0:   bridge window [mem 0x00000000-0x000fffff pref]
[    0.056619] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 09
[    0.056711] PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]
[    0.056726] pci 0000:00:0b.0: BAR 9: assigned [mem 0xf1000000-0xf10fffff 64bit pref]
[    0.056737] pci 0000:0a:00.0: BAR 5: assigned [io  0x10000-0x1007f]
[    0.056747] pci 0000:00:0b.0: PCI bridge to [bus 0a]
[    0.056754] pci 0000:00:0b.0:   bridge window [io  0x10000-0x1ffff]
[    0.056764] pci 0000:00:0b.0:   bridge window [mem 0x90000000-0xbfffffff]
[    0.056772] pci 0000:00:0b.0:   bridge window [mem 0xf1000000-0xf10fffff 64bit pref]
[    0.056786] pci_bus 0000:00: resource 4 [io  0x10000-0x80ffff]
[    0.056789] pci_bus 0000:00: resource 5 [mem 0xf1000000-0xf1ffffff]
[    0.056792] pci_bus 0000:00: resource 6 [mem 0x90000000-0xbfffffff]
[    0.056795] pci_bus 0000:0a: resource 0 [io  0x10000-0x1ffff]
[    0.056798] pci_bus 0000:0a: resource 1 [mem 0x90000000-0xbfffffff]
[    0.056801] pci_bus 0000:0a: resource 2 [mem 0xf1000000-0xf10fffff 64bit pref]
[    0.056838] pci 0001:00:01.0: PCI bridge to [bus 04]
[    0.056848] pci 0001:00:02.0: PCI bridge to [bus 05]
[    0.056855] pci 0001:00:02.0:   bridge window [mem 0xfa500000-0xfa5fffff]
[    0.056864] pci 0001:00:03.0: PCI bridge to [bus 06]
[    0.056874] pci 0001:00:04.0: PCI bridge to [bus 07]
[    0.056883] pci 0001:00:05.0: PCI bridge to [bus 08]
[    0.056892] pci 0001:00:06.0: PCI bridge to [bus 09]
[    0.056901] pci 0001:00:07.0: PCI bridge to [bus 02]
[    0.056909] pci 0001:00:07.0:   bridge window [mem 0xfa000000-0xfa3fffff]
[    0.056918] pci 0001:00:08.0: PCI bridge to [bus 01]
[    0.056926] pci 0001:00:08.0:   bridge window [mem 0x80000000-0x800fffff]
[    0.056935] pci 0001:00:09.0: PCI bridge to [bus 03]
[    0.056943] pci 0001:00:09.0:   bridge window [mem 0xfa400000-0xfa4fffff]
[    0.056953] pci_bus 0001:00: resource 4 [io  0x811000-0xc10fff]
[    0.056956] pci_bus 0001:00: resource 5 [mem 0xfa000000-0xffffffff]
[    0.056959] pci_bus 0001:00: resource 6 [mem 0x80000000-0x8fffffff]
[    0.056961] pci_bus 0001:00: resource 7 [mem 0xc0000000-0xefffffff]
[    0.056964] pci_bus 0001:05: resource 1 [mem 0xfa500000-0xfa5fffff]
[    0.056968] pci_bus 0001:02: resource 1 [mem 0xfa000000-0xfa3fffff]
[    0.056971] pci_bus 0001:01: resource 1 [mem 0x80000000-0x800fffff]
[    0.056974] pci_bus 0001:03: resource 1 [mem 0xfa400000-0xfa4fffff]
[    0.056976] PCI: Probing PCI hardware done
[    0.061988] vgaarb: device added: PCI:0000:0a:00.0,decodes=io+mem,owns=none,locks=none
[    0.062026] vgaarb: loaded
[    0.062031] vgaarb: bridge control possible 0000:0a:00.0
[    0.062153] SCSI subsystem initialized
[    0.062186] pps_core: LinuxPPS API ver. 1 registered
[    0.062192] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    0.062473] Switched to clocksource timebase
[    0.064385] b43-pci-bridge 0001:01:01.0: enabling device (0004 -> 0006)
[    0.071497] ssb: Found chip with id 0x4318, rev 0x02 and package 0x02
[    0.071508] ssb: Core 0 found: ChipCommon (cc 0x800, rev 0x0D, vendor 0x4243)
[    0.071514] ssb: Core 1 found: IEEE 802.11 (cc 0x812, rev 0x09, vendor 0x4243)
[    0.071520] ssb: Core 2 found: PCI (cc 0x804, rev 0x0C, vendor 0x4243)
[    0.071525] ssb: Core 3 found: PCMCIA (cc 0x80D, rev 0x07, vendor 0x4243)
[    0.090531] ssb: Sonics Silicon Backplane found on PCI device 0001:01:01.0
[    0.090593] NET: Registered protocol family 2
[    0.090868] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.091432] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.092653] TCP: Hash tables configured (established 131072 bind 65536)
[    0.092720] UDP hash table entries: 8192 (order: 6, 262144 bytes)
[    0.092864] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
[    0.093110] NET: Registered protocol family 1
[    0.093151] PCI: CLS mismatch (32 != 64), using 128 bytes
[    0.093167] pci 0001:00:03.0: Found enabled HT MSI Mapping
[    0.093180] pci 0001:00:04.0: Found enabled HT MSI Mapping
[    0.093191] pci 0001:00:05.0: Found enabled HT MSI Mapping
[    0.093203] pci 0001:00:06.0: Found enabled HT MSI Mapping
[    0.093231] pci 0001:01:0b.0: enabling device (0000 -> 0002)
[    0.143508] pci 0001:01:0b.1: enabling device (0000 -> 0002)
[    0.194487] pci 0001:01:0b.2: enabling device (0004 -> 0006)
[    0.194596] Unpacking initramfs...
[    0.381233] Freeing initrd memory: 7516K (c000000001500000 - c000000001c57000)
[    0.381687] futex hash table entries: 1024 (order: 5, 131072 bytes)
[    0.381738] Initialise system trusted keyring
[    0.381772] audit: initializing netlink subsys (disabled)
[    0.381804] audit: type=2000 audit(1436735021.379:1): initialized
[    0.382113] HugeTLB registered 16 MB page size, pre-allocated 0 pages
[    0.385340] VFS: Disk quotas dquot_6.6.0
[    0.385409] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.386088] alg: No test for stdrng (krng)
[    0.386120] bounce: pool size: 64 pages
[    0.386187] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.386199] io scheduler noop registered
[    0.386206] io scheduler deadline registered
[    0.386267] io scheduler cfq registered (default)
[    0.386560] Using unsupported 1920x1200 NVDA,Display-A at a0020000, depth=8, pitch=2048
[    0.426429] Console: switching to colour frame buffer device 240x75
[    0.466006] fb0: Open Firmware frame buffer device on /pci@0,f0000000/NVDA,Parent@0/NVDA,Display-A@0
[    0.466503] MacIO PCI driver attached to Shasta chipset
[    0.467200] mousedev: PS/2 mouse device common for all mice
[    0.518499] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[    0.529482] Registering G5 CPU frequency driver
[    0.529601] Frequency method: SCOM, Voltage method: GPIO
[    0.529739] Low: 1250 Mhz, High: 2500 Mhz, Cur: 2500 MHz
[    0.530216] NET: Registered protocol family 10
[    0.530683] mip6: Mobile IPv6
[    0.530766] NET: Registered protocol family 17
[    0.530897] Key type dns_resolver registered
[    0.531202] Loading compiled-in X.509 certificates
[    0.531339] registered taskstats version 1
[    0.581472] rtc-generic rtc-generic: setting system clock to 2015-07-12 21:03:42 UTC (1436735022)
[    0.582108] Freeing unused kernel memory: 316K (c00000000068f000 - c0000000006de000)
[    0.622443] systemd-udevd[71]: starting version 215
[    0.624337] random: systemd-udevd urandom read with 7 bits of entropy available
[    0.638246] PTP clock support registered
[    0.644019] tg3.c:v3.137 (May 11, 2014)
[    0.645817] libata version 3.00 loaded.
[    0.646173] sata_svw 0001:03:0c.0: version 2.3
[    0.646247] sata_svw 0001:03:0c.0: Using 32-bit DMA via iommu
[    0.650922] scsi host0: sata_svw
[    0.652914] usbcore: registered new interface driver usbfs
[    0.653108] usbcore: registered new interface driver hub
[    0.653298] usbcore: registered new device driver usb
[    0.653700] scsi host1: sata_svw
[    0.654295] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.654781] ehci-pci: EHCI PCI platform driver
[    0.655013] ehci-pci 0001:01:0b.2: EHCI Host Controller
[    0.655164] ehci-pci 0001:01:0b.2: new USB bus registered, assigned bus number 1
[    0.655424] ehci-pci 0001:01:0b.2: irq 70, io mem 0x80080000
[    0.655431] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.655692] tg3 0001:05:04.0: Using 32-bit DMA via iommu
[    0.656145] tg3 0001:05:04.0 eth0: Tigon3 [partno(BCM95780) rev 8003] (PCIX:133MHz:64-bit) MAC address 00:14:51:68:67:70
[    0.656330] scsi host2: sata_svw
[    0.656571] tg3 0001:05:04.0 eth0: attached PHY is 5780 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
[    0.656830] tg3 0001:05:04.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    0.657044] tg3 0001:05:04.0 eth0: dma_rwctrl[76144000] dma_mask[40-bit]
[    0.658388] scsi host3: sata_svw
[    0.658578] ata1: SATA max UDMA/133 mmio m8192@0xfa402000 port 0xfa402000 irq 18
[    0.658775] ata2: SATA max UDMA/133 mmio m8192@0xfa402000 port 0xfa402100 irq 18
[    0.658970] ata3: SATA max UDMA/133 mmio m8192@0xfa402000 port 0xfa402200 irq 18
[    0.659165] ata4: SATA max UDMA/133 mmio m8192@0xfa402000 port 0xfa402300 irq 18
[    0.659425] pata-pci-macio 0001:03:0d.0: enabling device (0004 -> 0006)
[    0.661514] ehci-pci 0001:01:0b.2: USB 2.0 started, EHCI 1.00
[    0.661781] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    0.661960] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.662152] usb usb1: Product: EHCI Host Controller
[    0.662280] usb usb1: Manufacturer: Linux 4.1.2-powerpc64 ehci_hcd
[    0.662443] usb usb1: SerialNumber: 0001:01:0b.2
[    0.665734] tg3 0001:05:04.1: Using 32-bit DMA via iommu
[    0.666129] tg3 0001:05:04.1 eth1: Tigon3 [partno(BCM95780) rev 8003] (PCIX:133MHz:64-bit) MAC address 00:14:51:68:67:71
[    0.666132] tg3 0001:05:04.1 eth1: attached PHY is 5780 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
[    0.666134] tg3 0001:05:04.1 eth1: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    0.666136] tg3 0001:05:04.1 eth1: dma_rwctrl[76144000] dma_mask[40-bit]
[    0.676087] pata-pci-macio 0001:03:0d.0: Activating pata-macio chipset Shasta ATA-6, Apple bus ID 3
[    0.676392] scsi host4: pata_macio
[    0.676453] ata5: PATA max UDMA/133 irq 38
[    0.677555] firewire_ohci 0001:03:0e.0: enabling device (0000 -> 0002)
[    0.728546] firewire_ohci 0001:03:0e.0: added OHCI v1.0 device as card 0, 8 IR + 8 IT contexts, quirks 0x0
[    0.760994] hub 1-0:1.0: USB hub found
[    0.770126] hub 1-0:1.0: 5 ports detected
[    0.779664] ohci-pci: OHCI PCI platform driver
[    0.788755] ohci-pci 0001:01:0b.0: OHCI PCI host controller
[    0.797847] ohci-pci 0001:01:0b.0: new USB bus registered, assigned bus number 2
[    0.806883] ohci-pci 0001:01:0b.0: irq 70, io mem 0x80082000
[    0.846939] ata5.00: ATAPI: HL-DT-ST DVD-RW GWA-4165B, C006, max UDMA/66
[    0.884796] ata5.00: configured for UDMA/66
[    0.886377] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    0.886380] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.886381] usb usb2: Product: OHCI PCI host controller
[    0.886383] usb usb2: Manufacturer: Linux 4.1.2-powerpc64 ohci_hcd
[    0.886385] usb usb2: SerialNumber: 0001:01:0b.0
[    0.898598] hub 2-0:1.0: USB hub found
[    0.898616] hub 2-0:1.0: 3 ports detected
[    0.898772] ohci-pci 0001:01:0b.1: OHCI PCI host controller
[    0.898778] ohci-pci 0001:01:0b.1: new USB bus registered, assigned bus number 3
[    0.898803] ohci-pci 0001:01:0b.1: irq 70, io mem 0x80081000
[    0.965517] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    0.975700] ata1.00: ATA-8: WDC WD3200AAKS-75L9A0, 02.03E02, max UDMA/133
[    0.975702] ata1.00: 625142448 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    0.977353] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    0.977355] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.977357] usb usb3: Product: OHCI PCI host controller
[    0.977359] usb usb3: Manufacturer: Linux 4.1.2-powerpc64 ohci_hcd
[    0.977360] usb usb3: SerialNumber: 0001:01:0b.1
[    0.977534] hub 3-0:1.0: USB hub found
[    0.977545] hub 3-0:1.0: 2 ports detected
[    0.992738] ata1.00: configured for UDMA/133
[    0.992912] scsi 0:0:0:0: Direct-Access     ATA      WDC WD3200AAKS-7 3E02 PQ: 0 ANSI: 5
[    1.229707] firewire_core 0001:03:0e.0: created device fw0: GUID 001451fffe357de8, S800
[    1.245088] firewire_core 0001:03:0e.0: phy config: new root=ffc1, gap_count=5
[    1.323557] ata2: SATA link down (SStatus 4 SControl 300)
[    1.398511] usb 2-2: new full-speed USB device number 2 using ohci-pci
[    1.603513] usb 2-2: New USB device found, idVendor=413c, idProduct=1003
[    1.618804] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.634101] usb 2-2: Product: Dell USB Keyboard Hub
[    1.649351] usb 2-2: Manufacturer: Dell
[    1.672513] hub 2-2:1.0: USB hub found
[    1.686509] hub 2-2:1.0: 3 ports detected
[    1.970502] usb 2-3: new full-speed USB device number 3 using ohci-pci
[    2.248502] usb 2-3: New USB device found, idVendor=05ac, idProduct=1000
[    2.263824] usb 2-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.280501] usb 2-2.1: new full-speed USB device number 4 using ohci-pci
[    2.295460] hidraw: raw HID events driver (C) Jiri Kosina
[    2.343861] usbcore: registered new interface driver usbhid
[    2.345503] ata3: failed to resume link (SControl 0)
[    2.345535] ata3: SATA link down (SStatus 0 SControl 0)
[    2.376290] usbhid: USB HID core driver
[    2.385733] input: HID 05ac:1000 as /devices/pci0001:00/0001:00:08.0/0001:01:0b.0/usb2/2-3/2-3:1.0/0003:05AC:1000.0001/input/input0
[    2.389483] usb 2-2.1: New USB device found, idVendor=413c, idProduct=2010
[    2.389485] usb 2-2.1: New USB device strings: Mfr=1, Product=3, SerialNumber=0
[    2.389487] usb 2-2.1: Product: Dell USB Keyboard
[    2.389489] usb 2-2.1: Manufacturer: Dell
[    2.400034] input: Dell Dell USB Keyboard as /devices/pci0001:00/0001:00:08.0/0001:01:0b.0/usb2/2-2/2-2.1/2-2.1:1.0/0003:413C:2010.0003/input/input1
[    2.450629] hid-generic 0003:413C:2010.0003: input,hidraw0: USB HID v1.10 Keyboard [Dell Dell USB Keyboard] on usb-0001:01:0b.0-2.1/input0
[    2.475568] input: Dell Dell USB Keyboard as /devices/pci0001:00/0001:00:08.0/0001:01:0b.0/usb2/2-2/2-2.1/2-2.1:1.1/0003:413C:2010.0004/input/input2
[    2.501607] hid-generic 0003:05AC:1000.0001: input,hidraw1: USB HID v1.11 Keyboard [HID 05ac:1000] on usb-0001:01:0b.0-3/input0
[    2.511670] input: HID 05ac:1000 as /devices/pci0001:00/0001:00:08.0/0001:01:0b.0/usb2/2-3/2-3:1.1/0003:05AC:1000.0002/input/input3
[    2.552559] hid-generic 0003:413C:2010.0004: input,hidraw2: USB HID v1.10 Device [Dell Dell USB Keyboard] on usb-0001:01:0b.0-2.1/input1
[    2.552737] hid-generic 0003:05AC:1000.0002: input,hidraw3: USB HID v1.11 Mouse [HID 05ac:1000] on usb-0001:01:0b.0-3/input1
[    2.643516] usb 2-2.3: new low-speed USB device number 5 using ohci-pci
[    2.760487] usb 2-2.3: New USB device found, idVendor=045e, idProduct=0040
[    2.778277] usb 2-2.3: New USB device strings: Mfr=1, Product=3, SerialNumber=0
[    2.796084] usb 2-2.3: Product: Microsoft 3-Button Mouse with IntelliEye(TM)
[    2.813944] usb 2-2.3: Manufacturer: Microsoft
[    2.841294] input: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM) as /devices/pci0001:00/0001:00:08.0/0001:01:0b.0/usb2/2-2/2-2.3/2-2.3:1.0/0003:045E:0040.0005/input/input4
[    2.856724] hid-generic 0003:045E:0040.0005: input,hidraw4: USB HID v1.10 Mouse [Microsoft Microsoft 3-Button Mouse with IntelliEye(TM)] on usb-0001:01:0b.0-2.3/input0
[    3.366505] ata4: failed to resume link (SControl 0)
[    3.385257] ata4: SATA link down (SStatus 0 SControl 0)
[    3.407752] scsi 4:0:0:0: CD-ROM            HL-DT-ST DVD-RW GWA-4165B C006 PQ: 0 ANSI: 5
[    3.426546] ata5.00: K2/Shasta alignment limits applied
[    3.455738] sd 0:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
[    3.466535] sd 0:0:0:0: [sda] Write Protect is off
[    3.477124] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    3.477153] sr 4:0:0:0: [sr0] scsi3-mmc drive: 32x/32x writer cd/rw xa/form2 cdda tray
[    3.477176] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    3.497665]  sda: [mac] sda1 sda2 sda3 sda4 sda5
[    3.498109] sd 0:0:0:0: [sda] Attached SCSI disk
[    3.499262] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    3.499316] sr 4:0:0:0: Attached scsi generic sg1 type 5
[    3.541266] cdrom: Uniform CD-ROM driver Revision: 3.20
[    3.552066] sr 4:0:0:0: Attached scsi CD-ROM sr0
[    3.879084] windfarm: initializing for dual-core desktop G5
[    4.226585] random: nonblocking pool is initialized
[    4.450941] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
[    5.119281] systemd[1]: systemd 215 running in system mode. (+PAM +AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ -SECCOMP -APPARMOR)
[    5.139747] systemd[1]: Detected architecture 'ppc64'.
[    5.404458] systemd[1]: Inserted module 'autofs4'
[    5.442843] systemd[1]: Set hostname to <powermac-g5-quad>.
[    6.450092] systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
[    6.470580] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    6.482109] systemd[1]: Starting Remote File Systems (Pre).
[    6.505249] systemd[1]: Reached target Remote File Systems (Pre).
[    6.516706] systemd[1]: Starting Encrypted Volumes.
[    6.539605] systemd[1]: Reached target Encrypted Volumes.
[    6.551008] systemd[1]: Starting Arbitrary Executable File Formats File System Automount Point.
[    6.574457] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    6.586201] systemd[1]: Starting Dispatch Password Requests to Console Directory Watch.
[    6.598056] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    6.609958] systemd[1]: Starting Paths.
[    6.633772] systemd[1]: Reached target Paths.
[    6.645579] systemd[1]: Expecting device dev-disk-by\x2duuid-861a4b9b\x2df791\x2d4100\x2d9e21\x2d4ed0d0740fe9.device...
[    6.669972] systemd[1]: Starting Root Slice.
[    6.694434] systemd[1]: Created slice Root Slice.
[    6.706577] systemd[1]: Starting User and Session Slice.
[    6.730979] systemd[1]: Created slice User and Session Slice.
[    6.742850] systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
[    6.766959] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
[    6.779005] systemd[1]: Starting Delayed Shutdown Socket.
[    6.802699] systemd[1]: Listening on Delayed Shutdown Socket.
[    6.814190] systemd[1]: Starting Journal Socket (/dev/log).
[    6.836860] systemd[1]: Listening on Journal Socket (/dev/log).
[    6.847876] systemd[1]: Starting udev Control Socket.
[    6.869838] systemd[1]: Listening on udev Control Socket.
[    6.880654] systemd[1]: Starting udev Kernel Socket.
[    6.902413] systemd[1]: Listening on udev Kernel Socket.
[    6.913188] systemd[1]: Starting Journal Socket.
[    6.934107] systemd[1]: Listening on Journal Socket.
[    6.944137] systemd[1]: Starting System Slice.
[    6.964291] systemd[1]: Created slice System Slice.
[    6.974177] systemd[1]: Started File System Check on Root Device.
[    6.984019] systemd[1]: Starting system-getty.slice.
[    7.003866] systemd[1]: Created slice system-getty.slice.
[    7.013660] systemd[1]: Starting Increase datagram queue length...
[    7.095808] systemd[1]: Started Set Up Additional Binary Formats.
[    7.113446] systemd[1]: Starting Create list of required static device nodes for the current kernel...
[    7.134637] systemd[1]: Mounting Huge Pages File System...
[    7.155603] systemd[1]: Mounting POSIX Message Queue File System...
[    7.176678] systemd[1]: Mounting Debug File System...
[    7.197497] systemd[1]: Starting udev Coldplug all Devices...
[    7.349452] systemd[1]: Starting Load Kernel Modules...
[    7.382007] systemd[1]: Starting Slices.
[    7.401752] systemd[1]: Reached target Slices.
[    7.422320] systemd[1]: Started Increase datagram queue length.
[    7.432243] systemd[1]: Starting Syslog Socket.
[    7.451381] systemd[1]: Listening on Syslog Socket.
[    7.460959] systemd[1]: Starting Journal Service...
[    7.490881] systemd[1]: Started Journal Service.
[    7.575966] fuse init (API version 7.23)
[    7.817656] loop: module loaded
[    8.130023] snd-aoa-fabric-layout: Using PMF GPIOs
[    8.213394] PowerMac i2c bus smu 14 registered
[    8.228140] PowerMac i2c bus smu 11 registered
[    8.236934] i2c i2c-1: i2c-powermac: register /smu@0,0/smu-i2c-control@0/i2c-bus@b/sat@b0
[    8.237030] i2c i2c-1: i2c-powermac: register /smu@0,0/smu-i2c-control@0/i2c-bus@b/sat@b2
[    8.237101] i2c i2c-1: i2c-powermac: register /smu@0,0/smu-i2c-control@0/i2c-bus@b/system-clock@d4
[    8.237170] PowerMac i2c bus mac-io 0 registered
[    8.245882] i2c i2c-2: i2c-powermac: register /ht@0,f2000000/pci@8/mac-io@7/i2c@18000/i2c-bus@0/codec@8c
[    8.246077] i2c i2c-2: I2C transfer at 0x46 failed, size 2, err -6
[    8.246080] snd-aoa-codec-onyx: failed to read control register
[    8.254866] PowerMac i2c bus mac-io 0 registered
[    8.263594] i2c i2c-3: i2c-powermac: register /ht@0,f2000000/pci@8/mac-io@7/i2c@18000/i2c-bus@0/codec@8c
[    8.263973] i2c i2c-3: I2C transfer at 0x46 failed, size 2, err -6
[    8.263975] snd-aoa-codec-onyx: failed to read control register
[    8.263985] i2c i2c-3: i2c-powermac: register /ht@0,f2000000/pci@8/mac-io@7/i2c@18000/i2c-bus@0/codec@24
[    8.264051] PowerMac i2c bus u4 1 registered
[    8.264054] i2c i2c-4: i2c-powermac: register /u4@0,f8000000/i2c@f8001000/i2c-bus@1/temp-monitor@94
[    8.264092] i2c i2c-4: i2c-powermac: register /u4@0,f8000000/i2c@f8001000/i2c-bus@1/temp-monitor@96
[    8.264117] i2c i2c-4: i2c-powermac: register /u4@0,f8000000/i2c@f8001000/i2c-bus@1/temp-monitor@98
[    8.264153] i2c i2c-4: i2c-powermac: register /u4@0,f8000000/i2c@f8001000/i2c-bus@1/temp-monitor@9c
[    8.427167] systemd-udevd[211]: starting version 215
[    9.168492] windfarm: CPUs control loops started.
[    9.872800] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>)
[    9.881081] 0.00013020:ch-a: ttyPZ0 at MMIO 0x80013020 (irq = 23, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    9.889581] 0.00013000:ch-b: ttyPZ1 at MMIO 0x80013000 (irq = 24, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    9.909744] Linux agpgart interface v0.103
[   10.042393] sat 0 partition c8: c8 6 2 7f ff 2 ff 1 fb bf 0 59 0 20 0 0 0 7 89 37 0 a0 0 0
[   10.174815] cfg80211: Calling CRDA to update world regulatory domain
[   10.500544] [drm] Initialized drm 1.1.0 20060810
[   10.692279] sat 0 partition c4: c4 4 1 7f a0 12 20 5f ff 55 29 14 7b 12 0 0
[   10.746946] EXT4-fs (sda3): re-mounted. Opts: errors=remount-ro
[   10.778674] b43-phy0: Broadcom 4318 WLAN found (core revision 9)
[   10.793495] b43-phy0: Found PHY: Analog 3, Type 2 (G), Revision 7
[   10.793515] b43-phy0: Found Radio: Manuf 0x17F, ID 0x2050, Revision 8, Version 0
[   10.800675] Broadcom 43xx driver loaded [ Features: PNL ]
[   11.428254] checking generic (a0020000 258000) vs hw (a0000000 20000000)
[   11.428259] fb: switching to nouveaufb from OFfb NVDA,Displ
[   11.436742] Console: switching to colour dummy device 80x25
[   11.437370] nouveau 0000:0a:00.0: enabling device (0006 -> 0007)
[   11.438071] nouveau  [  DEVICE][0000:0a:00.0] BOOT0  : 0x047d00a1
[   11.438081] nouveau  [  DEVICE][0000:0a:00.0] Chipset: G70 (NV47)
[   11.438088] nouveau  [  DEVICE][0000:0a:00.0] Family : NV40
[   11.558175] sat 0 partition c9: c9 6 2 7f ff 2 ff 1 fb bf 0 59 0 20 0 0 0 7 89 37 0 a0 0 0
[   11.611131] nouveau  [   VBIOS][0000:0a:00.0] using image from PROM
[   11.611532] nouveau  [   VBIOS][0000:0a:00.0] BIT signature found
[   11.611540] nouveau  [   VBIOS][0000:0a:00.0] version 00.00.00.10.10
[   11.611602] nouveau W[   VBIOS][0000:0a:00.0] DCB table not found
[   11.611615] nouveau W[   VBIOS][0000:0a:00.0] DCB table not found
[   11.611658] nouveau E[   VBIOS][0000:0a:00.0] 0x47a4[ ]: unknown opcode 0xff
[   11.611666] nouveau E[ DEVINIT][0000:0a:00.0] init failed, -22
[   11.611673] nouveau E[     DRM] failed to create 0x00000080, -22
[   11.612251] nouveau: probe of 0000:0a:00.0 failed with error -22
[   11.666202] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
[   11.843494] systemd-journald[191]: Received request to flush runtime journal from PID 1
[   12.203983] sat 0 partition c5: c5 4 1 7f a0 12 20 5f ff 55 29 14 7b 12 0 0
[   12.647574] usb 2-3: USB disconnect, device number 3
[   12.670795] usb 2-3: usbfs: USBDEVFS_CONTROL failed cmd hid2hci rqt 64 rq 0 len 0 ret -62
[   13.070185] sat 1 partition c8: c8 6 2 7f ff 2 ff 1 fb bf 0 59 0 20 0 0 0 7 89 37 0 a0 0 0
[   13.121517] usb 2-3: new full-speed USB device number 6 using ohci-pci
[   13.328523] cfg80211: Calling CRDA to update world regulatory domain
[   13.336556] cfg80211: World regulatory domain updated:
[   13.336581] cfg80211:  DFS Master region: unset
[   13.336587] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   13.336615] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   13.336634] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   13.336653] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[   13.336673] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   13.336693] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   13.336713] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[   13.336732] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[   13.336751] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[   13.539307] usb 2-3: New USB device found, idVendor=05ac, idProduct=8207
[   13.539335] usb 2-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   13.657535] Bluetooth: Core ver 2.20
[   13.657573] NET: Registered protocol family 31
[   13.657579] Bluetooth: HCI device and connection manager initialized
[   13.657659] Bluetooth: HCI socket layer initialized
[   13.657668] Bluetooth: L2CAP socket layer initialized
[   13.657691] Bluetooth: SCO socket layer initialized
[   13.720292] sat 1 partition c4: c4 4 1 7f a0 12 20 5f ff 55 b8 14 7b 12 0 0
[   13.792654] usbcore: registered new interface driver btusb
[   14.163842] Adding 793808k swap on /dev/sda4.  Priority:-1 extents:1 across:793808k FS
[   14.368478] systemd-journald[191]: Received request to flush runtime journal from PID 1
[   14.586046] sat 1 partition c9: c9 6 2 7f ff 2 ff 1 fb bf 0 59 0 20 0 0 0 7 89 37 0 a0 0 0
[   15.220611] RPC: Registered named UNIX socket transport module.
[   15.220622] RPC: Registered udp transport module.
[   15.220628] RPC: Registered tcp transport module.
[   15.220634] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   15.232048] sat 1 partition c5: c5 4 1 7f a0 12 20 5f ff 55 48 15 7b 12 0 0
[   15.264163] FS-Cache: Loaded
[   15.345940] FS-Cache: Netfs 'nfs' registered for caching
[   15.397183] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
[   15.860195] windfarm: Backside control loop started.
[   15.912570] windfarm: Slots control loop started.
[   16.018393] windfarm: Drive bay control loop started.
[   16.943787] usb 2-2: USB disconnect, device number 2
[   16.943812] usb 2-2.1: USB disconnect, device number 4
[   16.985553] usb 2-2.3: USB disconnect, device number 5
[   21.012837] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   21.012850] Bluetooth: BNEP filters: protocol multicast
[   21.012865] Bluetooth: BNEP socket layer initialized
[   21.897662] u3msi: allocated virq 0x20 (hw 0x8) addr 0xfee00000
[   21.941183] u3msi: allocated virq 0x21 (hw 0x9) addr 0xfee00000
[   22.114507] b43-phy0: Loading firmware version 666.2 (2011-02-23 01:15:07)
[   22.137638] b43-pci-bridge 0001:01:01.0: Using 32-bit DMA via iommu
[   24.651029] tg3 0001:05:04.0 eth0: Link is up at 1000 Mbps, full duplex
[   24.651059] tg3 0001:05:04.0 eth0: Flow control is on for TX and on for RX
[   24.740101] tg3 0001:05:04.1 eth1: Link is up at 1000 Mbps, full duplex
[   24.740119] tg3 0001:05:04.1 eth1: Flow control is on for TX and on for RX

--------------090908060801040400080608
Content-Type: application/octet-stream;
 name="NVDA,BMP"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="NVDA,BMP"

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
d2ZmZmYzMDMzMtQDPHAECDgFEABmZmZmZmZmZmZmZmZmZmZmd3d3d3d3d3dmZmZmMjMzMzLU
AzxwBAhABRAAZWRmZmVkZmZlZGZmZWRmZodQd3eHUHd3ZWRmZiIiEREy1AM8cAQIJAUQAHd3
d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3l3d3MtQDPHAECCwFEAB3d3d3d3d3d3d3d3d3
d3d3d3d3d3d3d3d3d3d3d3B3dzLUAzxwBAg0BRAAd3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3
d3d3d3d6d3cy1AM8cAQIPAUQAHd3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d6end3eiAF
EAAPAAAAeoAEEAAiIiIieoQEEAAiIiIieogEEAAiIiIieowEEAAiIiIiepAEEAACAAAAepQE
EAACAAAAepgEEAACAAAAepwEEAACAAAAMtQDPHAECFgEEAAAAAAAAAAAABEAAAAQAAAAEAAA
ABAAAAARAAAAEQAAADLUAzxwBAhcBBAAERAAABEQAAAREAAAERAAABEQAAAREAAAERAAABEQ
AAB6cAQQAAABAAAy1AM8cAQIdAQQAAEBERESABERBAAREQQAEREEABERBAAREQQAEREEABER
eoAAEAAgAADweoQAEAAdAAAAepAAEAAAAAAAeqAAEAAAAAAAevAAEAAAAAAAcUsIBWgAoIwA
AHqIEAAA8BEAAHqMEAAA0AAAAG4wFQAA/8nw/wAECgBUBTgAGj8oADMAIfpSKyAAVAYsADoA
OwBKAEsATABRV1gAB38AAAAAAABTQwF41AOFAP941AOGAAFTRANTIfp41AOFAP941AOGAAFS
KxAAVAcsADoAOwA8AEoASwBMAFFXWAADfwAAU0MBU0QAU1IEU1NAboQVAAAAAPD/AAAAAHoQ
AhAAAAAAgG4sBWgA//7//wEAAABuLCVoAP////8BAQAAbkgIaAD/////AAAQAG5IKGgA////
/wAAEABugAhoAP////8AAAQAboAoaAD/////AAAEAHoAEgAAPBADAHFbThVbXxQy1AM8cAQI
wAIQADIAAAAcDAAAAgMAADICAABiBQAAYgUAAAIFAAACAgAAMtQDPHAECMgCEAAyAAAAHAwA
AAIDAAAyAgAAYgUAAGIFAAACBQAAAgIAAHToA28AMwpvAjZuwAIQAP/+//8AAAAAbsgCEAD/
/v//AAAAAHRkAG8Eawd06ANvBWsIdOgDehACEAABAACAevD/cAAAAAAAY24AAhAA/////wAA
AAB4xAMB3wBuQMAAAADw//8zAwgMbjiBCAAB/P+/AAEAAG48gQgA////8AAAAAduFBABAP9/
//8AgAAAeiQFaAAAAAAAcXFK1AM8cAQIBEAAAEANAwBADQMAQA0DAEANAwBADQMAODIEADgy
BAA4MgQAcUrUAzxwBAgkQAAAYK4KAGCuCgBgrgoAYK4KAGCuCgCQBRAAkAUQAJAFEABxeNQD
RAAAOQVuzAIQAP////8BAAAAbsQCEAD/////AQAAAG7MAhAA/v///wAAAABuxAIQAP7///8A
AAAAdB4AcjkGbswCEAD/////QAAAAG7EAhAA/////0AAAABuzAIQAL////8AAAAAbsQCEAC/
////AAAAAHQeAHI5B27IAhAA//7//wAAAABuwAIQAP/+//8AAAAAbsgCEAD/////AAEAAG7A
AhAA/////wABAABuyAIQAP/+//8AAAAAbsACEAD//v//AAAAAHJxcXFuSAhoAP////8AAACA
bkgIaAD/////AAAAIHT0AVsyFVvXFHRQw25ICGgA////3wAAAAB0uIhxbkgIaAD/////AAAA
gFsyFVu3FHFbMhVblhRxWzIVW4QUcVsyFVtyFHFbMhVbYBRxbkgoaAD/////AAAAgG5IKGgA
/////wAAACB09AFbQBVb1xR0UMNuSChoAP///98AAAAAdLiIcW5IKGgA/////wAAAIBbQBVb
txRxW0AVW5YUcVtAFVuEFHFbQBVbchRxW0AVW2AUcXFb9BRQgAQAzAFCAikuhVsiFXFb9BRQ
gAQAzAFEAikuhVsiFXFb9BRQgAQAygFHAikuhVsiFXFb9BRQgAQAwQFBAqkugVsiFXFbCxVQ
gAQAwQFKAqkuiXFblhRQgQsAygFHAikEgAVuLoUwADEAMgAzADoAWyIVcVuoFFCBCwDBAUoC
qQSABW4uiTAAMQAyADMAOgBxUIAHBIAFbi//MAAxADIAMwBQgQEEAHFQgAcEgAVuLyEwADEA
MgAzAFCBAQQAcVCAAS8IdFDDUIACLyEsAHFugAhoAP///98AAAAAcW6AKGgA////zwAAAABx
TQJcHTCzQEVOM09GUO1RTVLtU1lYAFmAXOJdgF6AX8hgzGHMZGZnMmhkapl4EXtUMzw0YjYg
fQU5wTrBfAFxMBkKCPYVy73cTgcWZRZxFn0WixafFgGyFgABAAEoAAAAAgEAAwAAAAAQEgEE
KAAAABISAQwAAAAADwAAAAAAAAAPAAAAAAAAAA8AAAAAAAAADwAAAAAAAAAPAAAAAAAAAA8A
AAAAAAAAMAUDBAI3NgAAPz4AAFFQAAAxBhACLRbgcAFx4AfgB0RyhSCmIOAHKFrgByp14AdM
XOAH4AfgBzAEAgI1FlwWMAcQAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
MAcBAgJcACAgMAQIAQ8PDw8PDw8PMQwAAPAAAAAPAAAAMQoEAQAAAAAAAA8PDw8wBAQEcFwA
AP8AAAD/AAAA/wAAADAFBwIAMBAwIWAC/wD/AP8A/wAQBAMCAMAAwAAy
--------------090908060801040400080608
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--------------090908060801040400080608--
