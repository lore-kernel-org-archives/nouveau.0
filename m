From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Date: Fri, 17 May 2019 15:31:34 +0900
Message-ID: <20190517063134.GA812@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517061340.GA709@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
List-Id: nouveau.vger.kernel.org

On (05/17/19 15:13), Sergey Senozhatsky wrote:
> 5.1.0-next-20190517
> 
> I'm looking at quite a lot of kmemleak reports coming from
> drm/nouveau/core/memory, all of which are:
> 
>     unreferenced object 0xffff8deec27c4ac0 (size 16):
>       comm "Web Content", pid 5309, jiffies 4309675011 (age 68.076s)
>       hex dump (first 16 bytes):
>         00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>       backtrace:
>         [<0000000081f2894f>] nvkm_memory_tags_get+0x8e/0x130
>         [<000000007cd7c0bc>] gf100_vmm_valid+0x196/0x2f0
>         [<0000000070cc6d67>] nvkm_vmm_map+0xa8/0x360
>         [<00000000ab678644>] nvkm_vram_map+0x48/0x50
>         [<00000000d8176378>] nvkm_uvmm_mthd+0x658/0x770
>         [<00000000463fca5a>] nvkm_ioctl+0xdf/0x177
>         [<000000000afc4996>] nvif_object_mthd+0xd4/0x100
>         [<000000002f7a7385>] nvif_vmm_map+0xeb/0x100
>         [<00000000ef2537ed>] nouveau_mem_map+0x79/0xd0
>         [<0000000014ddc0cf>] nouveau_vma_new+0x19d/0x1c0
>         [<00000000f99888a1>] nouveau_gem_object_open+0xd4/0x140
>         [<000000009cd25861>] drm_gem_handle_create_tail+0xe3/0x160
>         [<00000000191784d9>] nouveau_gem_ioctl_new+0x6e/0xd0
>         [<00000000159678df>] drm_ioctl_kernel+0x8c/0xd0
>         [<00000000fbaa6154>] drm_ioctl+0x1c4/0x360
>         [<000000006833fe15>] nouveau_drm_ioctl+0x63/0xb0

Yet another one (4 leaks), but this looks more like a real leak.

unreferenced object 0xffff8f1e0cbbe840 (size 192):
  comm "swapper/0", pid 1, jiffies 4294668445 (age 742.639s)
  hex dump (first 32 bytes):
    00 90 89 0c 1e 8f ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000006933ed2b>] nouveau_conn_reset+0x20/0xb0
    [<00000000572e2e30>] nouveau_connector_create+0x356/0x54c
    [<000000008a6a13cd>] nv50_display_create+0x2fb/0x917
    [<000000007fab0a58>] nouveau_display_create+0x3e6/0x600
    [<000000008b8644c8>] nouveau_drm_device_init+0x149/0x6b0
    [<000000004fd78a1f>] nouveau_drm_probe+0x263/0x2b0
    [<00000000357716ef>] pci_device_probe+0xa3/0x110
    [<00000000061d40e4>] really_probe+0xd3/0x240
    [<000000000ade44b6>] driver_probe_device+0x50/0xc0
    [<000000009cd0024c>] device_driver_attach+0x53/0x60
    [<00000000b11ab0bb>] __driver_attach+0x4c/0xb0
    [<0000000016d8457f>] bus_for_each_dev+0x66/0x90
    [<00000000f2855f5e>] bus_add_driver+0x171/0x1c0
    [<0000000021c08fc1>] driver_register+0x6c/0xaf
    [<0000000086357843>] do_one_initcall+0x36/0x1d4
    [<00000000a6be055a>] kernel_init_freeable+0x1bf/0x24f

Seems that connector ->state is not fully destroyed.

---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 4116ee62adaf..caec1737a7de 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -251,8 +251,10 @@ nouveau_conn_reset(struct drm_connector *connector)
 	if (WARN_ON(!(asyc = kzalloc(sizeof(*asyc), GFP_KERNEL))))
 		return;
 
-	if (connector->state)
+	if (connector->state) {
 		__drm_atomic_helper_connector_destroy_state(connector->state);
+		kfree(connector->state);
+	}
 	__drm_atomic_helper_connector_reset(connector, &asyc->state);
 	asyc->dither.mode = DITHERING_MODE_AUTO;
 	asyc->dither.depth = DITHERING_DEPTH_AUTO;
-- 
2.21.0
