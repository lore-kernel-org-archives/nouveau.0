From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Date: Fri, 17 May 2019 15:45:30 +0900
Message-ID: <20190517064530.GA6986@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
 <20190517063134.GA812@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517063134.GA812@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
List-Id: nouveau.vger.kernel.org

On (05/17/19 15:31), Sergey Senozhatsky wrote:
> >       backtrace:
> >         [<0000000081f2894f>] nvkm_memory_tags_get+0x8e/0x130
> >         [<000000007cd7c0bc>] gf100_vmm_valid+0x196/0x2f0
> >         [<0000000070cc6d67>] nvkm_vmm_map+0xa8/0x360
> >         [<00000000ab678644>] nvkm_vram_map+0x48/0x50
> >         [<00000000d8176378>] nvkm_uvmm_mthd+0x658/0x770
> >         [<00000000463fca5a>] nvkm_ioctl+0xdf/0x177
> >         [<000000000afc4996>] nvif_object_mthd+0xd4/0x100
> >         [<000000002f7a7385>] nvif_vmm_map+0xeb/0x100
> >         [<00000000ef2537ed>] nouveau_mem_map+0x79/0xd0
> >         [<0000000014ddc0cf>] nouveau_vma_new+0x19d/0x1c0
> >         [<00000000f99888a1>] nouveau_gem_object_open+0xd4/0x140
> >         [<000000009cd25861>] drm_gem_handle_create_tail+0xe3/0x160
> >         [<00000000191784d9>] nouveau_gem_ioctl_new+0x6e/0xd0
> >         [<00000000159678df>] drm_ioctl_kernel+0x8c/0xd0
> >         [<00000000fbaa6154>] drm_ioctl+0x1c4/0x360
> >         [<000000006833fe15>] nouveau_drm_ioctl+0x63/0xb0
[..]
>   backtrace:
>     [<000000006933ed2b>] nouveau_conn_reset+0x20/0xb0
>     [<00000000572e2e30>] nouveau_connector_create+0x356/0x54c
>     [<000000008a6a13cd>] nv50_display_create+0x2fb/0x917
>     [<000000007fab0a58>] nouveau_display_create+0x3e6/0x600
>     [<000000008b8644c8>] nouveau_drm_device_init+0x149/0x6b0
>     [<000000004fd78a1f>] nouveau_drm_probe+0x263/0x2b0
>     [<00000000357716ef>] pci_device_probe+0xa3/0x110
>     [<00000000061d40e4>] really_probe+0xd3/0x240
>     [<000000000ade44b6>] driver_probe_device+0x50/0xc0
>     [<000000009cd0024c>] device_driver_attach+0x53/0x60
>     [<00000000b11ab0bb>] __driver_attach+0x4c/0xb0
>     [<0000000016d8457f>] bus_for_each_dev+0x66/0x90
>     [<00000000f2855f5e>] bus_add_driver+0x171/0x1c0
>     [<0000000021c08fc1>] driver_register+0x6c/0xaf
>     [<0000000086357843>] do_one_initcall+0x36/0x1d4
>     [<00000000a6be055a>] kernel_init_freeable+0x1bf/0x24f

And one more:

	iccsense->rail = kmalloc_array(cnt, sizeof(struct pwr_rail_t), GFP_KERNEL);

unreferenced object 0xffff94e5ccdc7600 (size 96):
  comm "swapper/0", pid 1, jiffies 4294667774 (age 913.205s)
  hex dump (first 32 bytes):
    00 00 00 cc e5 94 ff ff 00 00 00 00 00 00 00 00  ................
    04 00 f1 ff 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000242abcb3>] nvbios_iccsense_parse+0xdc/0x250
    [<00000000b5c70490>] nvkm_iccsense_oneinit+0x55/0x370
    [<0000000020e0a743>] nvkm_subdev_init+0x53/0xd0
    [<000000004d8c6ef1>] nvkm_device_init+0x10d/0x190
    [<00000000bd7a4da4>] nvkm_udevice_init+0x41/0x60
    [<0000000047effcfc>] nvkm_object_init+0x3e/0x100
    [<000000006d6bad21>] nvkm_ioctl_new+0x145/0x1e0
    [<00000000fc4e7e48>] nvkm_ioctl+0xdf/0x177
    [<000000004cdc9cf8>] nvif_object_init+0xd6/0x130
    [<000000001637584b>] nvif_device_init+0xe/0x50
    [<00000000830683d4>] nouveau_cli_init+0x17d/0x410
    [<00000000fd93c306>] nouveau_drm_device_init+0x55/0x6b0
    [<000000007bc74e3f>] nouveau_drm_probe+0x263/0x2b0
    [<000000000f94f913>] pci_device_probe+0xa3/0x110
    [<00000000f82d21be>] really_probe+0xd3/0x240
    [<00000000a8b8b02e>] driver_probe_device+0x50/0xc0

	-ss
