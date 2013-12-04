From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Nouveau failing during probe followed by GPF on
	3.13-rc2
Date: Wed, 4 Dec 2013 06:15:30 -0500
Message-ID: <CAKb7Uvg2XpchxYxVTRgbwBWZzk9ONrSOAQcUQoM8GECn8-w=8g@mail.gmail.com>
References: <20131204120100.5331f1c6@pluto.restena.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131204120100.5331f1c6-I2t2yFIzmohO7ya8xxV06g@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Bruno_Pr=E9mont?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 4, 2013 at 6:01 AM, Bruno Pr=E9mont <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>=
 wrote:
> Hi,
>
> With 3.13-rc1 and 3.13-rc2 kernel crashes/BUGs while loading nouveau:
> [  657.654915] ACPI Warning: \_SB_.PCI0.IXVE.IGPU._DSM: Argument #4 type =
mismatch - Found [Integer], ACPI requires [Package] (20131115/nsarguments-9=
5)
> [  657.655099] ACPI Warning: \_SB_.PCI0.IXVE.IGPU._DSM: Argument #4 type =
mismatch - Found [Buffer], ACPI requires [Package] (20131115/nsarguments-95)
> [  657.655270] checking generic (80010000 640000) vs hw (80000000 1000000=
0)
> [  657.655273] fb: conflicting fb hw usage nouveaufb vs simple - removing=
 generic driver
> [  657.655383] Console: switching to colour dummy device 80x25
> [  657.655632] nouveau 0000:02:00.0: enabling device (0006 -> 0007)
> [  657.657149] ACPI: PCI Interrupt Link [LGPU] enabled at IRQ 16
> [  657.657456] [drm] hdmi device  not found 2 0 1
> [  657.657954] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0ac800b1
> [  657.657958] nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP79/MCP7A (NV=
AC)
> [  657.657960] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
> [  657.665274] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for imag=
e...
> [  657.722478] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
> [  657.722481] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
> [  657.722624] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
> [  657.722627] nouveau  [   VBIOS][0000:02:00.0] version 62.79.47.00.01
> [  657.745324] nouveau 0000:02:00.0: irq 42 for MSI/MSI-X
> [  657.745360] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
> [  657.745437] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system =
memory
> [  657.745441] nouveau  [     PFB][0000:02:00.0] RAM size: 256 MiB
> [  657.745444] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
> [  657.800072] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / exte=
rnal
> [  657.800083] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
> [  657.800086] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
> [  657.800105] nouveau  [     CLK][0000:02:00.0] 03: core 100 MHz shader =
200 MHz
> [  657.800111] nouveau  [     CLK][0000:02:00.0] 05: core 150 MHz shader =
300 MHz
> [  657.800116] nouveau  [     CLK][0000:02:00.0] 0e: core 300 MHz shader =
600 MHz
> [  657.800121] nouveau  [     CLK][0000:02:00.0] 0f: core 350 MHz shader =
800 MHz
> [  657.800135] nouveau E[     CLK][0000:02:00.0] 17 freq unknown
> [  657.800137] nouveau E[     CLK][0000:02:00.0] init failed, -22

There are some patches in
http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=3Ddrm-nouveau-next
that should help with that, specifically:

http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=3Ddrm-nouveau-next&=
id=3Da7e4201f0f7d47e03b851f06f8987856e8d33083

> [  657.800140] nouveau E[     DRM] failed to create 0x80000080, -22
> [  657.802123] general protection fault: 0000 [#1] SMP
> [  657.802130] Modules linked in: nouveau(+) ttm drm_kms_helper
> [  657.802140] CPU: 0 PID: 2999 Comm: modprobe Not tainted 3.13.0-rc2-air=
+ #5
> [  657.802144] Hardware name: Apple Inc. MacBookAir2,1/Mac-F42D88C8, BIOS=
    MBA21.88Z.0075.B03.0811141325 11/14/08
> [  657.802150] task: ffff88007f161520 ti: ffff88007defe000 task.ti: ffff8=
8007defe000
> [  657.802154] RIP: 0010:[<ffffffff813d2af0>]  [<ffffffff813d2af0>] devic=
e_del+0x10/0x1b0
> [  657.802165] RSP: 0018:ffff88007deff9f8  EFLAGS: 00010292
> [  657.802168] RAX: 0000000000000000 RBX: 6b6b6b6b6b6b6b6b RCX: ffffffff8=
1a6f237
> [  657.802173] RDX: ffffffff81876dea RSI: ffffffff81a6e811 RDI: 6b6b6b6b6=
b6b6b6b
> [  657.802177] RBP: ffff88007deffa18 R08: 000000006b6b6b6b R09: 000000000=
0000000
> [  657.802181] R10: ffff880078801d00 R11: 000000000000002e R12: 6b6b6b6b6=
b6b6b6b
> [  657.802185] R13: ffff88007f5720f8 R14: ffffffffa010e7a0 R15: 00000000f=
fffffea
> [  657.802189] FS:  00007f3c23d75700(0000) GS:ffff88007b000000(0000) knlG=
S:0000000000000000
> [  657.802194] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [  657.802198] CR2: 00007f27436e40f0 CR3: 000000007db4e000 CR4: 000000000=
00007f0
> [  657.802201] Stack:
> [  657.802204]  ffffffff8134fd0b 6b6b6b6b6b6b6b6b ffff88007f572060 ffff88=
007f5720f8
> [  657.802211]  ffff88007deffa38 ffffffff813d2ca1 ffff88007d938058 ffff88=
007da01ca8
> [  657.802217]  ffff88007deffa58 ffffffff813bdd6a ffff88007f572060 ffff88=
007da01ca8
> [  657.802224] Call Trace:
> [  657.802231]  [<ffffffff8134fd0b>] ? acpi_pci_irq_disable+0x3c/0x49
> [  657.802237]  [<ffffffff813d2ca1>] device_unregister+0x11/0x20
> [  657.802243]  [<ffffffff813bdd6a>] drm_sysfs_device_remove+0x1a/0x30
> [  657.802249]  [<ffffffff813b9dbd>] drm_unplug_minor+0x1d/0x40
> [  657.802255]  [<ffffffff813ba0cd>] drm_put_minor+0x3d/0x50
> [  657.802260]  [<ffffffff813ba0f8>] drm_dev_free+0x18/0x80
> [  657.802265]  [<ffffffff813bc67f>] drm_get_pci_dev+0xaf/0x150
> [  657.802272]  [<ffffffff8131d8ce>] ? pcibios_set_master+0x5e/0x90
> [  657.802315]  [<ffffffffa00a7eba>] nouveau_drm_probe+0x24a/0x290 [nouve=
au]
> [  657.802321]  [<ffffffff8131f36c>] pci_device_probe+0x9c/0xf0
> [  657.802328]  [<ffffffff813d6046>] driver_probe_device+0x76/0x240
> [  657.802333]  [<ffffffff813d62ab>] __driver_attach+0x9b/0xa0
> [  657.802339]  [<ffffffff813d6210>] ? driver_probe_device+0x240/0x240
> [  657.802345]  [<ffffffff813d43b5>] bus_for_each_dev+0x55/0x90
> [  657.802350]  [<ffffffff813d5b79>] driver_attach+0x19/0x20
> [  657.802355]  [<ffffffff813d577c>] bus_add_driver+0x10c/0x210
> [  657.802360]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
> [  657.802365]  [<ffffffff813d692f>] driver_register+0x5f/0xf0
> [  657.802370]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
> [  657.802375]  [<ffffffff8131e697>] __pci_register_driver+0x47/0x50
> [  657.802381]  [<ffffffff813bc835>] drm_pci_init+0x115/0x130
> [  657.802386]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
> [  657.802390]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
> [  657.802414]  [<ffffffffa0133043>] nouveau_drm_init+0x43/0x1000 [nouvea=
u]
> [  657.802422]  [<ffffffff8100034a>] do_one_initcall+0x11a/0x170
> [  657.802429]  [<ffffffff81071e33>] ? set_memory_nx+0x43/0x50
> [  657.802435]  [<ffffffff8113a132>] ? __vunmap+0xb2/0x100
> [  657.802441]  [<ffffffff810eeb26>] load_module+0x1966/0x21b0
> [  657.802446]  [<ffffffff810ec070>] ? show_initstate+0x50/0x50
> [  657.802453]  [<ffffffff8115bc94>] ? vfs_read+0x114/0x160
> [  657.802458]  [<ffffffff810ef4a6>] SyS_finit_module+0x86/0x90
> [  657.802465]  [<ffffffff817235e2>] system_call_fastpath+0x16/0x1b
> [  657.802469] Code: 74 24 18 48 89 df e8 90 ff ff ff 48 8b 5d e8 4c 8b 6=
5 f0 4c 8b 6d f8 c9 c3 66 90 55 48 89 e5 41 55 41 54 49 89 fc 53 48 83 ec 0=
8 <48> 8b 87 88 00 00 00 4c 8b 2f 48 85 c0 74 1b 48 8b b8 90 00 00
> [  657.802514] RIP  [<ffffffff813d2af0>] device_del+0x10/0x1b0
> [  657.802520]  RSP <ffff88007deff9f8>
> [  657.802524] ---[ end trace 11e780c61d88afaf ]---
>
> I'm booting with efi stub and SYSFB=3Dy, FB_SIMPLE=3Dy, DRM_NOUVEAU=3Dm
> Same config did boot properly with 3.12. Above output contains complete
> output from the time of calling modprobe nouveau.

Hrm.... that is a separate bug that we should probably figure out.
Looks like some use-after-free when nouveau fails to come up (note the
poison 0x6b values in various registers). But the above patch will
hopefully prevent that situation.

>
> lspci -nn:
> 00:00.0 Host bridge [0600]: NVIDIA Corporation MCP79 Host Bridge [10de:0a=
82] (rev b1)
> 00:00.1 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10=
de:0a88] (rev b1)
> 00:03.0 ISA bridge [0601]: NVIDIA Corporation MCP79 LPC Bridge [10de:0aaf=
] (rev b2)
> 00:03.1 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10=
de:0aa4] (rev b1)
> 00:03.2 SMBus [0c05]: NVIDIA Corporation MCP79 SMBus [10de:0aa2] (rev b1)
> 00:03.3 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10=
de:0a89] (rev b1)
> 00:03.4 RAM memory [0500]: NVIDIA Corporation MCP79 Memory Controller [10=
de:0a98] (rev b1)
> 00:03.5 Co-processor [0b40]: NVIDIA Corporation MCP79 Co-processor [10de:=
0aa3] (rev b1)
> 00:04.0 USB controller [0c03]: NVIDIA Corporation MCP79 OHCI USB 1.1 Cont=
roller [10de:0aa5] (rev b1)
> 00:04.1 USB controller [0c03]: NVIDIA Corporation MCP79 EHCI USB 2.0 Cont=
roller [10de:0aa6] (rev b1)
> 00:06.0 USB controller [0c03]: NVIDIA Corporation MCP79 OHCI USB 1.1 Cont=
roller [10de:0aa7] (rev b1)
> 00:06.1 USB controller [0c03]: NVIDIA Corporation MCP79 EHCI USB 2.0 Cont=
roller [10de:0aa9] (rev b1)
> 00:08.0 Audio device [0403]: NVIDIA Corporation MCP79 High Definition Aud=
io [10de:0ac0] (rev b1)
> 00:09.0 PCI bridge [0604]: NVIDIA Corporation MCP79 PCI Bridge [10de:0aab=
] (rev b1)
> 00:0b.0 SATA controller [0106]: NVIDIA Corporation MCP79 AHCI Controller =
[10de:0ab9] (rev b1)
> 00:10.0 PCI bridge [0604]: NVIDIA Corporation MCP79 PCI Express Bridge [1=
0de:0aa0] (rev b1)
> 00:15.0 PCI bridge [0604]: NVIDIA Corporation MCP79 PCI Express Bridge [1=
0de:0ac6] (rev b1)
> 02:00.0 VGA compatible controller [0300]: NVIDIA Corporation C79 [GeForce=
 9400M] [10de:0870] (rev b1)
> 03:00.0 Network controller [0280]: Broadcom Corporation BCM4321 802.11a/b=
/g/n [14e4:4328] (rev 05)
>
> Bruno
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
