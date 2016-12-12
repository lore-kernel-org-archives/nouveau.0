From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH] drm/nouveau: fix unknown chipset for GTX 1060
Date: Mon, 12 Dec 2016 19:26:33 +0800
Message-ID: <1481541993-40287-1-git-send-email-chiu@endlessm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>, Karol Herbst <nouveau@karolherbst.de>, Martin Peres <martin.peres@free.fr>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: linux@endlessm.com, Chris Chiu <chiu@endlessm.com>
List-Id: nouveau.vger.kernel.org

Nouveau driver shows unknown chipset (136000a1) for GTX 1060, so it
only gives VGA resolution on screen. Use the same chipset as nv134
then it shows FullHD. This commit copies fields from nv134_chipset
to nv136_chipset for GTX 1060.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 7218a06..7c6eece 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2209,6 +2209,34 @@ nv134_chipset = {
 	.fifo = gp100_fifo_new,
 };
 
+static const struct nvkm_device_chip
+nv136_chipset = {
+	.name = "GP104",
+	.bar = gf100_bar_new,
+	.bios = nvkm_bios_new,
+	.bus = gf100_bus_new,
+	.devinit = gm200_devinit_new,
+	.fb = gp104_fb_new,
+	.fuse = gm107_fuse_new,
+	.gpio = gk104_gpio_new,
+	.i2c = gm200_i2c_new,
+	.ibus = gm200_ibus_new,
+	.imem = nv50_instmem_new,
+	.ltc = gp100_ltc_new,
+	.mc = gp100_mc_new,
+	.mmu = gf100_mmu_new,
+	.pci = gp100_pci_new,
+	.timer = gk20a_timer_new,
+	.top = gk104_top_new,
+	.ce[0] = gp104_ce_new,
+	.ce[1] = gp104_ce_new,
+	.ce[2] = gp104_ce_new,
+	.ce[3] = gp104_ce_new,
+	.disp = gp104_disp_new,
+	.dma = gf119_dma_new,
+	.fifo = gp100_fifo_new,
+};
+
 static int
 nvkm_device_event_ctor(struct nvkm_object *object, void *data, u32 size,
 		       struct nvkm_notify *notify)
@@ -2644,6 +2672,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x12b: device->chip = &nv12b_chipset; break;
 		case 0x130: device->chip = &nv130_chipset; break;
 		case 0x134: device->chip = &nv134_chipset; break;
+		case 0x136: device->chip = &nv136_chipset; break;
 		default:
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
 			goto done;
-- 
2.1.4
