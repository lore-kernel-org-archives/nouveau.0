From: Studio_IKN <iknstudio-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] drm/nouveau: add config NvForceGpioReset
Date: Mon, 27 Jul 2020 10:59:04 +0000
Message-ID: <TB7aP_CBiaV1xQxQXLcElMwJFbZSEyuDynYXmxQmCbVp0EmY_I12EQxlqb8pFc3GoKNhRAJgMnfldyQQFu36-xqu0pyDIXkkIJ44R_FaXiQ=@protonmail.com>
Reply-To: Studio_IKN <iknstudio-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Some OEMs manage to mess up their VBIOS such that GPIO isn't initialized
correctly at boot time.  The NVIDIA proprietary driver seems to initialize
GPIO unconditionally at boot.  Nouveau doesn't because it assumes GPIO is
set up correctly.  This patch adds a new config option, NvForceGpio, which
allow users with broken VBIOS to force a GPIO reset at boot time.  This
issue seems to be rare enough to not warrant a DMI override.
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c     | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c    | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h
index 1a39e52e09e3..842d16e93b40 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h
@@ -9,6 +9,7 @@ struct nvkm_devinit {
 	struct nvkm_subdev subdev;
 	bool post;
 	bool force_post;
+	bool force_gpio_reset;
 };

 u32 nvkm_devinit_mmio(struct nvkm_devinit *, u32 addr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 5b90c2a1bf3d..1b7535805e71 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2836,6 +2836,11 @@ nvkm_device_preinit(struct nvkm_device *device)
 	if (ret)
 		goto fail;

+	if (device->devinit->force_gpio_reset) {
+		struct nvkm_gpio *gpio = device->devinit->subdev.device->gpio;
+		nvkm_gpio_reset(gpio, DCB_GPIO_UNUSED);
+	}
+
 	time = ktime_to_us(ktime_get()) - time;
 	nvdev_trace(device, "preinit completed in %lldus\n", time);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
index 4756019ddf3f..ddec3c16150f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
@@ -133,4 +133,6 @@ nvkm_devinit_ctor(const struct nvkm_devinit_func *func,
 	nvkm_subdev_ctor(&nvkm_devinit, device, index, &init->subdev);
 	init->func = func;
 	init->force_post = nvkm_boolopt(device->cfgopt, "NvForcePost", false);
+	init->force_gpio_reset = nvkm_boolopt(
+		device->cfgopt, "NvForceGpioReset", false);
 }
--
2.27.0
