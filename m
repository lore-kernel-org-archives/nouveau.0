From: Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Subject: [PATCH] drm/nouveau: fix memory leak in iccsense/base.c
Date: Mon, 19 Oct 2020 14:39:04 +0530
Message-ID: <20201019090854.GA2085@cosmos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

kmemleak report:
  unreferenced object 0xffff9071c65644e0 (size 96):
  comm "systemd-udevd", pid 347, jiffies 4294898424 (age 810.828s)
  hex dump (first 32 bytes):
    02 01 00 00 00 00 00 00 00 00 10 00 02 04 00 00  ................
    00 00 00 00 00 00 a0 86 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000007c0d0ac3>] __kmalloc+0x337/0x500
    [<00000000551bfaeb>] nvbios_iccsense_parse+0xf7/0x280 [nouveau]
    [<00000000e3e8968b>] nvkm_iccsense_oneinit+0x6c/0x4e0 [nouveau]
    [<00000000287e7701>] nvkm_subdev_init+0x58/0xd0 [nouveau]
    [<0000000008e4793e>] nvkm_device_init+0x118/0x1a0 [nouveau]
    [<000000008cd3afa3>] nvkm_udevice_init+0x48/0x60 [nouveau]
    [<000000007e047aee>] nvkm_object_init+0x43/0x110 [nouveau]
    [<000000006c56b3a4>] nvkm_ioctl_new+0x184/0x210 [nouveau]
    [<0000000080abc890>] nvkm_ioctl+0xf0/0x190 [nouveau]
    [<00000000f35056a2>] nvkm_client_ioctl+0x12/0x20 [nouveau]
    [<000000000f001008>] nvif_object_ioctl+0x4f/0x60 [nouveau]
    [<0000000098d66807>] nvif_object_ctor+0xfb/0x160 [nouveau]
    [<00000000fe24934a>] nvif_device_ctor+0x24/0x70 [nouveau]
    [<00000000878b3286>] nouveau_cli_init+0x1a3/0x460 [nouveau]
    [<00000000a1578335>] nouveau_drm_device_init+0x77/0x740 [nouveau]
    [<00000000faef6b28>] nouveau_drm_probe+0x132/0x1f0 [nouveau]

Fix nvkm_iccsense_oneinit(), to free stbl.rail post iteration.

Signed-off-by: Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index fecfa6a..23d91b6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -291,6 +291,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+	kfree(stbl.rail);
 	return 0;
 }
 
-- 
2.7.4
