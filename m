From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: Nouveau failing during probe followed by GPF on 3.13-rc2
Date: Wed, 4 Dec 2013 15:37:54 -0500
Message-ID: <CAKb7UvhjvDaEQYRPvQjp-FfprpnqbJp-oGg52Gp2r7xyv323Zw@mail.gmail.com>
References: <20131204120100.5331f1c6@pluto.restena.lu>
	<CAKb7Uvg2XpchxYxVTRgbwBWZzk9ONrSOAQcUQoM8GECn8-w=8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvg2XpchxYxVTRgbwBWZzk9ONrSOAQcUQoM8GECn8-w=8g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: =?ISO-8859-1?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>, David Airlie <airlied@linux.ie>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 4, 2013 at 6:15 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Wed, Dec 4, 2013 at 6:01 AM, Bruno Pr=E9mont <bonbons@linux-vserver.or=
g> wrote:
>> [  657.800140] nouveau E[     DRM] failed to create 0x80000080, -22
>> [  657.802123] general protection fault: 0000 [#1] SMP
>> [  657.802130] Modules linked in: nouveau(+) ttm drm_kms_helper
>> [  657.802140] CPU: 0 PID: 2999 Comm: modprobe Not tainted 3.13.0-rc2-ai=
r+ #5
>> [  657.802144] Hardware name: Apple Inc. MacBookAir2,1/Mac-F42D88C8, BIO=
S    MBA21.88Z.0075.B03.0811141325 11/14/08
>> [  657.802150] task: ffff88007f161520 ti: ffff88007defe000 task.ti: ffff=
88007defe000
>> [  657.802154] RIP: 0010:[<ffffffff813d2af0>]  [<ffffffff813d2af0>] devi=
ce_del+0x10/0x1b0
>> [  657.802165] RSP: 0018:ffff88007deff9f8  EFLAGS: 00010292
>> [  657.802168] RAX: 0000000000000000 RBX: 6b6b6b6b6b6b6b6b RCX: ffffffff=
81a6f237
>> [  657.802173] RDX: ffffffff81876dea RSI: ffffffff81a6e811 RDI: 6b6b6b6b=
6b6b6b6b
>> [  657.802177] RBP: ffff88007deffa18 R08: 000000006b6b6b6b R09: 00000000=
00000000
>> [  657.802181] R10: ffff880078801d00 R11: 000000000000002e R12: 6b6b6b6b=
6b6b6b6b
>> [  657.802185] R13: ffff88007f5720f8 R14: ffffffffa010e7a0 R15: 00000000=
ffffffea
>> [  657.802189] FS:  00007f3c23d75700(0000) GS:ffff88007b000000(0000) knl=
GS:0000000000000000
>> [  657.802194] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
>> [  657.802198] CR2: 00007f27436e40f0 CR3: 000000007db4e000 CR4: 00000000=
000007f0
>> [  657.802201] Stack:
>> [  657.802204]  ffffffff8134fd0b 6b6b6b6b6b6b6b6b ffff88007f572060 ffff8=
8007f5720f8
>> [  657.802211]  ffff88007deffa38 ffffffff813d2ca1 ffff88007d938058 ffff8=
8007da01ca8
>> [  657.802217]  ffff88007deffa58 ffffffff813bdd6a ffff88007f572060 ffff8=
8007da01ca8
>> [  657.802224] Call Trace:
>> [  657.802231]  [<ffffffff8134fd0b>] ? acpi_pci_irq_disable+0x3c/0x49
>> [  657.802237]  [<ffffffff813d2ca1>] device_unregister+0x11/0x20
>> [  657.802243]  [<ffffffff813bdd6a>] drm_sysfs_device_remove+0x1a/0x30
>> [  657.802249]  [<ffffffff813b9dbd>] drm_unplug_minor+0x1d/0x40
>> [  657.802255]  [<ffffffff813ba0cd>] drm_put_minor+0x3d/0x50
>> [  657.802260]  [<ffffffff813ba0f8>] drm_dev_free+0x18/0x80
>> [  657.802265]  [<ffffffff813bc67f>] drm_get_pci_dev+0xaf/0x150
>> [  657.802272]  [<ffffffff8131d8ce>] ? pcibios_set_master+0x5e/0x90
>> [  657.802315]  [<ffffffffa00a7eba>] nouveau_drm_probe+0x24a/0x290 [nouv=
eau]
>> [  657.802321]  [<ffffffff8131f36c>] pci_device_probe+0x9c/0xf0
>> [  657.802328]  [<ffffffff813d6046>] driver_probe_device+0x76/0x240
>> [  657.802333]  [<ffffffff813d62ab>] __driver_attach+0x9b/0xa0
>> [  657.802339]  [<ffffffff813d6210>] ? driver_probe_device+0x240/0x240
>> [  657.802345]  [<ffffffff813d43b5>] bus_for_each_dev+0x55/0x90
>> [  657.802350]  [<ffffffff813d5b79>] driver_attach+0x19/0x20
>> [  657.802355]  [<ffffffff813d577c>] bus_add_driver+0x10c/0x210
>> [  657.802360]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
>> [  657.802365]  [<ffffffff813d692f>] driver_register+0x5f/0xf0
>> [  657.802370]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
>> [  657.802375]  [<ffffffff8131e697>] __pci_register_driver+0x47/0x50
>> [  657.802381]  [<ffffffff813bc835>] drm_pci_init+0x115/0x130
>> [  657.802386]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
>> [  657.802390]  [<ffffffffa0133000>] ? 0xffffffffa0132fff
>> [  657.802414]  [<ffffffffa0133043>] nouveau_drm_init+0x43/0x1000 [nouve=
au]
>> [  657.802422]  [<ffffffff8100034a>] do_one_initcall+0x11a/0x170
>> [  657.802429]  [<ffffffff81071e33>] ? set_memory_nx+0x43/0x50
>> [  657.802435]  [<ffffffff8113a132>] ? __vunmap+0xb2/0x100
>> [  657.802441]  [<ffffffff810eeb26>] load_module+0x1966/0x21b0
>> [  657.802446]  [<ffffffff810ec070>] ? show_initstate+0x50/0x50
>> [  657.802453]  [<ffffffff8115bc94>] ? vfs_read+0x114/0x160
>> [  657.802458]  [<ffffffff810ef4a6>] SyS_finit_module+0x86/0x90
>> [  657.802465]  [<ffffffff817235e2>] system_call_fastpath+0x16/0x1b
>> [  657.802469] Code: 74 24 18 48 89 df e8 90 ff ff ff 48 8b 5d e8 4c 8b =
65 f0 4c 8b 6d f8 c9 c3 66 90 55 48 89 e5 41 55 41 54 49 89 fc 53 48 83 ec =
08 <48> 8b 87 88 00 00 00 4c 8b 2f 48 85 c0 74 1b 48 8b b8 90 00 00
>> [  657.802514] RIP  [<ffffffff813d2af0>] device_del+0x10/0x1b0
>> [  657.802520]  RSP <ffff88007deff9f8>
>> [  657.802524] ---[ end trace 11e780c61d88afaf ]---
>>
>> I'm booting with efi stub and SYSFB=3Dy, FB_SIMPLE=3Dy, DRM_NOUVEAU=3Dm
>> Same config did boot properly with 3.12. Above output contains complete
>> output from the time of calling modprobe nouveau.
>
> Hrm.... that is a separate bug that we should probably figure out.
> Looks like some use-after-free when nouveau fails to come up (note the
> poison 0x6b values in various registers). But the above patch will
> hopefully prevent that situation.

OK, so it looks like here's what happens:

nouveau_drm_probe -> drm_get_pci_dev -> drm_dev_register-> nouveau_drm_load

The load fails. In its cleanup path, drm_dev_register cleans up
dev->primary/render/control and propagates the error. Reasonable
enough.

drm_get_pci_dev, in turn, calls drm_dev_free. The first thing that
does is... clean up dev->primary/render/control. So that's the most
likely source of the double-free.

I'm not sufficiently familiar with the drm internals to know which
function shouldn't be cleaning up what, but it definitely seems like a
problem. Dave, I leave this in your capable hands :)

  -ilia
