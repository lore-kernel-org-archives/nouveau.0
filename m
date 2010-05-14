From: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Kernel module fails to initialize on AMD751 based system
	with NV34
Date: Fri, 14 May 2010 20:27:15 +0200
Message-ID: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Today I tried Ubuntu-10.04 on a system with an NV34 (Geforce-5200)
AMD-751 (Ironlake) Northbridge,
however the kernel-module fails to initialize.

Any idea what could be going wrong?

Thank you in advance, Clemens

PS: I filed a bug at ubuntu's launchpad:
https://bugs.launchpad.net/ubuntu/+bug/580656

May 14 19:17:28 max-desktop kernel: [    3.266782] [drm] Initialized
drm 1.1.0 20060810
May 14 19:17:28 max-desktop kernel: [    3.295911] agpgart-amdk7
0000:00:00.0: AMD Irongate chipset
May 14 19:17:28 max-desktop kernel: [    3.295948] agpgart-amdk7
0000:00:00.0: AMD 751 chipset with NVidia GeForce; forcing 1X due to
errata
May 14 19:17:28 max-desktop kernel: [    3.346901] 8139too Fast
Ethernet driver 0.9.28
May 14 19:17:28 max-desktop kernel: [    3.398550] agpgart-amdk7
0000:00:00.0: AGP aperture is 64M @ 0xe8000000
May 14 19:17:28 max-desktop kernel: [    3.398722] 8139too
0000:00:08.0: PCI INT A -> Link[LNKD] -> GSI 10 (level, low) -> IRQ 10
May 14 19:17:28 max-desktop kernel: [    3.401624] eth0: RealTek
RTL8139 at 0xd800, 00:02:44:63:f3:76, IRQ 10
May 14 19:17:28 max-desktop kernel: [    3.542553] ACPI: PCI Interrupt
Link [LNKB] enabled at IRQ 11
May 14 19:17:28 max-desktop kernel: [    3.542588] nouveau
0000:01:05.0: PCI INT A -> Link[LNKB] -> GSI 11 (level, low) -> IRQ 11
May 14 19:17:28 max-desktop kernel: [    3.558896] [drm] nouveau
0000:01:05.0: Detected an NV30 generation card (0x034200b1)
May 14 19:17:28 max-desktop kernel: [    3.559147] [drm] nouveau
0000:01:05.0: Attempting to load BIOS image from PROM
May 14 19:17:28 max-desktop kernel: [    3.687469] [drm] nouveau
0000:01:05.0: ... appears to be valid
May 14 19:17:28 max-desktop kernel: [    3.688278] [drm] nouveau
0000:01:05.0: BMP BIOS found
May 14 19:17:28 max-desktop kernel: [    3.688288] [drm] nouveau
0000:01:05.0: BMP version 5.40
May 14 19:17:28 max-desktop kernel: [    3.688300] [drm] nouveau
0000:01:05.0: Bios version 04.34.20.67
May 14 19:17:28 max-desktop kernel: [    3.688314] [drm] nouveau
0000:01:05.0: Found Display Configuration Block version 2.2
May 14 19:17:28 max-desktop kernel: [    3.688329] [drm] nouveau
0000:01:05.0: Raw DCB entry 0: 01000300 000088b8
May 14 19:17:28 max-desktop kernel: [    3.688342] [drm] nouveau
0000:01:05.0: Raw DCB entry 1: 01010312 00000000
May 14 19:17:28 max-desktop kernel: [    3.688353] [drm] nouveau
0000:01:05.0: Raw DCB entry 2: 02010310 000088b8
May 14 19:17:28 max-desktop kernel: [    3.688363] [drm] nouveau
0000:01:05.0: Raw DCB entry 3: 02020321 00000303
May 14 19:17:28 max-desktop kernel: [    3.689017] [drm] nouveau
0000:01:05.0: Loading NV17 power sequencing microcode
May 14 19:17:28 max-desktop kernel: [    3.689030] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 0 at offset 0xEE75
May 14 19:17:28 max-desktop kernel: [    3.704109] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 1 at offset 0xF12A
May 14 19:17:28 max-desktop kernel: [    3.704132] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 2 at offset 0xF270
May 14 19:17:28 max-desktop kernel: [    3.704205] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 3 at offset 0xF3F9
May 14 19:17:28 max-desktop kernel: [    3.704218] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 4 at offset 0xF416
May 14 19:17:28 max-desktop kernel: [    3.704233] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 5 at offset 0xF433
May 14 19:17:28 max-desktop kernel: [    3.712086] [drm] nouveau
0000:01:05.0: Parsing VBIOS init table 6 at offset 0xF5CC
May 14 19:17:28 max-desktop kernel: [    3.733406] [TTM] Zone  kernel:
Available graphics memory: 189918 kiB.
May 14 19:17:28 max-desktop kernel: [    3.733460] [drm] nouveau
0000:01:05.0: 128 MiB VRAM
May 14 19:17:28 max-desktop kernel: [    3.733613] agpgart-amdk7
0000:00:00.0: AGP 1.0 bridge
May 14 19:17:28 max-desktop kernel: [    3.733655] agpgart-amdk7
0000:00:00.0: putting AGP V2 device into 1x mode
May 14 19:17:28 max-desktop kernel: [    3.733712] nouveau
0000:01:05.0: putting AGP V2 device into 1x mode
May 14 19:17:28 max-desktop kernel: [    3.733726] [drm] nouveau
0000:01:05.0: 64 MiB GART (aperture)
May 14 19:17:28 max-desktop kernel: [    3.734674] [drm] nouveau
0000:01:05.0: Allocating FIFO number 0
May 14 19:17:28 max-desktop kernel: [    3.741258] [drm] nouveau
0000:01:05.0: nouveau_channel_free: freeing fifo 0
May 14 19:17:28 max-desktop kernel: [    3.741271] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.741303] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.741314] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.741329] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.741383] Pid: 129, comm:
modprobe Not tainted 2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.741393] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.741421]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.741437]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.741450]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.741464]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.741477]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.741492]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.741610]  [<d8a2a243>]
nouveau_fence_update+0xa3/0xb0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.741655]  [<d8a21420>]
nouveau_channel_free+0x60/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.741700]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.741745]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.741839]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.741884]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.741927]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.741971]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.742013]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.742037]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.742092]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.742123]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.742137]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.742166]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.742191]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.742207]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.742222]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.742237]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.742251]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.742265]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.742279]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.742293]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.742307]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.742331]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.742344]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.742384]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.742432]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.742446]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.742487]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.742513]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.742529]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.742540] ---[ end trace
ae02d86c418e8aca ]---
May 14 19:17:28 max-desktop kernel: [    3.743419] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.743443] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.743453] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.743468] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.743511] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.743520] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.743538]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.743553]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.743566]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.743580]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.743594]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.743607]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.743667]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.743715]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.743763]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.743778]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.743821]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.743865]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.743911]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.743958]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.744002]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744125]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744170]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744213]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.744232]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.744287]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744307]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.744319]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.744338]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.744355]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.744370]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.744385]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.744399]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.744414]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.744428]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.744442]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.744455]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.744470]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.744485]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.744498]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.744535]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.744579]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744592]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.744632]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744649]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.744663]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.744673] ---[ end trace
ae02d86c418e8acb ]---
May 14 19:17:28 max-desktop kernel: [    3.744681] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.744695] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.744704] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.744719] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.744760] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.744769] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.744782]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.744795]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.744808]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.744821]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.744833]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.744847]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.744893]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744940]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.744988]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745001]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.745044]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745088]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745133]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745172]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.745216]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745259]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745302]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745341]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.745358]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.745412]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745429]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.745441]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.745458]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.745473]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.745488]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.745503]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.745517]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.745531]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.745545]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.745559]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.745572]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.745586]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.745600]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.745613]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.745649]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.745692]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745705]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.745746]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.745761]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.745774]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.745783] ---[ end trace
ae02d86c418e8acc ]---
May 14 19:17:28 max-desktop kernel: [    3.745790] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.745804] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.745813] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.745827] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.745868] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.745877] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.745890]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.745904]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.745916]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.745929]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.745942]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.745955]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.746001]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746049]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746096]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746109]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.746152]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746196]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746241]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746279]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.746323]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746366]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746409]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746448]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.746464]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.746519]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746536]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.746548]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.746564]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.746579]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.746594]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.746609]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.746623]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.746637]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.746651]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.746665]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.746678]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.746692]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.746706]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.746719]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.746755]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.746798]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746810]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.746851]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.746867]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.746880]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.746889] ---[ end trace
ae02d86c418e8acd ]---
May 14 19:17:28 max-desktop kernel: [    3.746896] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.746909] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.746918] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.746933] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.746973] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.746982] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.746994]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.747008]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.747020]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.747033]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.747046]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.747059]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.747105]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747153]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747200]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747213]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.747256]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747300]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747345]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747383]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.747426]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747469]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747513]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747551]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.747568]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.747622]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747639]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.747651]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.747667]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.747682]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.747697]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.747712]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.747726]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.747740]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.747754]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.747768]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.747781]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.747796]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.747810]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.747822]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.747858]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.747901]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747914]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.747954]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.747971]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.747984]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.747993] ---[ end trace
ae02d86c418e8ace ]---
May 14 19:17:28 max-desktop kernel: [    3.748000] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.748013] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.748052] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.748067] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.748107] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.748116] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.748130]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.748144]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.748156]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.748170]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.748183]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.748196]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.748241]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748289]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748336]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748350]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.748393]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748437]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748482]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748521]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.748564]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748607]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748651]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748689]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.748706]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.748761]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.748778]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.748790]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.748807]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.748822]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.748837]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.748852]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.748866]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.748881]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.748895]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.748909]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.748922]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.748936]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.748951]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.748964]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.749000]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.749044]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749056]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.749097]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749113]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.749126]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.749135] ---[ end trace
ae02d86c418e8acf ]---
May 14 19:17:28 max-desktop kernel: [    3.749142] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.749155] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.749165] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.749179] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.749220] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.749228] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.749241]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.749255]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.749267]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.749280]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.749293]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.749306]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.749352]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749400]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749447]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749461]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.749503]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749547]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749592]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749630]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.749674]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749717]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749760]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749799]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.749815]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.749869]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.749886]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.749898]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.749915]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.749930]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.749945]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.749960]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.749974]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.749989]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.750003]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.750016]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.750030]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.750044]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.750058]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.750070]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.750107]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.750150]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750162]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.750203]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750218]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.750231]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.750241] ---[ end trace
ae02d86c418e8ad0 ]---
May 14 19:17:28 max-desktop kernel: [    3.750247] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.750260] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.750270] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.750284] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.750324] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.750333] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.750345]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.750359]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.750372]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.750385]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.750398]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.750411]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.750457]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750504]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750551]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750565]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.750608]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750652]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750697]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750735]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.750778]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750821]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750865]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750903]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.750920]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.750974]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.750991]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.751003]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.751019]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.751034]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.751050]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.751064]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.751079]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.751093]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.751107]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.751121]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.751134]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.751149]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.751163]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.751176]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.751213]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.751255]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751268]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.751309]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751324]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.751337]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.751346] ---[ end trace
ae02d86c418e8ad1 ]---
May 14 19:17:28 max-desktop kernel: [    3.751353] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.751366] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.751375] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.751390] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.751430] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.751438] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.751451]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.751464]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.751477]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.751490]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.751503]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.751516]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.751562]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751609]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751657]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751671]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.751713]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751758]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751803]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751841]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.751885]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751928]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.751971]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752010]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.752054]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.752110]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752127]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.752139]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.752155]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.752171]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.752185]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.752200]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.752215]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.752229]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.752243]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.752257]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.752270]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.752284]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.752298]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.752311]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.752349]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.752392]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752405]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.752446]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752462]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.752475]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.752484] ---[ end trace
ae02d86c418e8ad2 ]---
May 14 19:17:28 max-desktop kernel: [    3.752491] ------------[ cut
here ]------------
May 14 19:17:28 max-desktop kernel: [    3.752504] WARNING: at
/build/buildd/linux-2.6.32/lib/iomap.c:43 bad_io_access+0x45/0x50()
May 14 19:17:28 max-desktop kernel: [    3.752514] Hardware name:
MS-6195
May 14 19:17:28 max-desktop kernel: [    3.752528] Modules linked in:
nouveau(+) ttm drm_kms_helper 8139too amd_k7_agp drm 8139cp usbhid hid
floppy i2c_algo_bit mii agpgart pata_amd
May 14 19:17:28 max-desktop kernel: [    3.752568] Pid: 129, comm:
modprobe Tainted: G        W  2.6.32-21-generic #32-Ubuntu
May 14 19:17:28 max-desktop kernel: [    3.752577] Call Trace:
May 14 19:17:28 max-desktop kernel: [    3.752589]  [<c014c3d2>]
warn_slowpath_common+0x72/0xa0
May 14 19:17:28 max-desktop kernel: [    3.752603]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.752615]  [<c0356215>] ?
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.752629]  [<c014c44b>]
warn_slowpath_fmt+0x2b/0x30
May 14 19:17:28 max-desktop kernel: [    3.752642]  [<c0356215>]
bad_io_access+0x45/0x50
May 14 19:17:28 max-desktop kernel: [    3.752654]  [<c0356582>]
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.752700]  [<d8a286c8>]
nouveau_dma_wait+0x38/0x1b0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752748]  [<d8a2a4ec>]
nouveau_fence_emit+0x12c/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752795]  [<d8a2a5b0>]
nouveau_fence_new+0x80/0xe0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752809]  [<c0356582>] ?
ioread32+0x22/0x40
May 14 19:17:28 max-desktop kernel: [    3.752851]  [<d8a2144b>]
nouveau_channel_free+0x8b/0x1f0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752895]  [<d8a21a8e>]
nouveau_channel_alloc+0x39e/0x450 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752940]  [<d8a207fb>]
nouveau_card_init_channel+0x3b/0x170 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.752978]  [<d891ac44>] ?
drm_vblank_init+0x104/0x190 [drm]
May 14 19:17:28 max-desktop kernel: [    3.753022]  [<d8a20bbc>]
nouveau_card_init+0x28c/0x2c0 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.753065]  [<d8a20c00>] ?
nouveau_vga_set_decode+0x0/0x60 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.753108]  [<d8a20e40>]
nouveau_load+0x1e0/0x580 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.753146]  [<d891c685>]
drm_get_dev+0x125/0x230 [drm]
May 14 19:17:28 max-desktop kernel: [    3.753163]  [<c025f2b0>] ?
sysfs_addrm_start+0x60/0xa0
May 14 19:17:28 max-desktop kernel: [    3.753217]  [<d8a77a21>]
nouveau_pci_probe+0x12/0x14 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.753235]  [<c0363883>]
local_pci_probe+0x13/0x20
May 14 19:17:28 max-desktop kernel: [    3.753247]  [<c0364688>]
pci_device_probe+0x68/0x90
May 14 19:17:28 max-desktop kernel: [    3.753263]  [<c03e684d>]
really_probe+0x4d/0x140
May 14 19:17:28 max-desktop kernel: [    3.753279]  [<c03ed15e>] ?
pm_runtime_barrier+0x4e/0xc0
May 14 19:17:28 max-desktop kernel: [    3.753294]  [<c03e697c>]
driver_probe_device+0x3c/0x60
May 14 19:17:28 max-desktop kernel: [    3.753308]  [<c03e6a21>]
__driver_attach+0x81/0x90
May 14 19:17:28 max-desktop kernel: [    3.753322]  [<c03e5e63>]
bus_for_each_dev+0x53/0x80
May 14 19:17:28 max-desktop kernel: [    3.753336]  [<c03e671e>]
driver_attach+0x1e/0x20
May 14 19:17:28 max-desktop kernel: [    3.753350]  [<c03e69a0>] ?
__driver_attach+0x0/0x90
May 14 19:17:28 max-desktop kernel: [    3.753364]  [<c03e60e5>]
bus_add_driver+0xd5/0x280
May 14 19:17:28 max-desktop kernel: [    3.753377]  [<c03645c0>] ?
pci_device_remove+0x0/0x40
May 14 19:17:28 max-desktop kernel: [    3.753392]  [<c03e6d1a>]
driver_register+0x6a/0x130
May 14 19:17:28 max-desktop kernel: [    3.753405]  [<c01b03ce>] ?
ftrace_now+0x2e/0x50
May 14 19:17:28 max-desktop kernel: [    3.753418]  [<c03648c5>]
__pci_register_driver+0x45/0xb0
May 14 19:17:28 max-desktop kernel: [    3.753454]  [<d89172a3>]
drm_init+0xf3/0x100 [drm]
May 14 19:17:28 max-desktop kernel: [    3.753497]  [<d887b045>]
nouveau_init+0x45/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.753510]  [<c0101131>]
do_one_initcall+0x31/0x190
May 14 19:17:28 max-desktop kernel: [    3.753550]  [<d887b000>] ?
nouveau_init+0x0/0x47 [nouveau]
May 14 19:17:28 max-desktop kernel: [    3.753565]  [<c0182340>]
sys_init_module+0xb0/0x210
May 14 19:17:28 max-desktop kernel: [    3.753578]  [<c01033ec>]
syscall_call+0x7/0xb
May 14 19:17:28 max-desktop kernel: [    3.753587] ---[ end trace
ae02d86c418e8ad3 ]---
May 14 19:17:28 max-desktop kernel: [    3.758776] [TTM] Zone  kernel:
Used memory at exit: 0 kiB.
May 14 19:17:28 max-desktop kernel: [    3.760555] nouveau
0000:01:05.0: PCI INT A disabled
May 14 19:17:28 max-desktop kernel: [    3.760588] nouveau: probe of
0000:01:05.0 failed with error -12
