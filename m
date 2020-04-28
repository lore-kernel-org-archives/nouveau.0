From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/3] device: detect vGPUs
Date: Tue, 28 Apr 2020 18:54:04 +0200
Message-ID: <20200428165404.936235-3-kherbst@redhat.com>
References: <20200428165404.936235-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200428165404.936235-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Using ENODEV as this prevents probe failed errors in dmesg.

v2: move check further down

Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/device/base.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index c732074bf..f977dddcd 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2948,7 +2948,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 {
 	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
-	u32 boot0, strap;
+	u32 boot0, boot1, strap;
 	void __iomem *map = NULL;
 	int ret = -EEXIST, i;
 	unsigned chipset;
@@ -2998,9 +2998,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			}
 		}
 
-		/* read boot0 and strapping information */
 		boot0 = ioread32_native(map + 0x000000);
-		strap = ioread32_native(map + 0x101000);
 
 		/* chipset can be overridden for devel/testing purposes */
 		chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
@@ -3158,6 +3156,17 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		nvdev_info(device, "NVIDIA %s (%08x)\n",
 			   device->chip->name, boot0);
 
+		/* vGPU detection */
+		boot1 = ioread32_native(map + 0x000004);
+		if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
+			nvdev_info(device, "vGPUs are not supported\n");
+			ret = -ENODEV;
+			goto done;
+		}
+
+		/* read strapping information */
+		strap = ioread32_native(map + 0x101000);
+
 		/* determine frequency of timing crystal */
 		if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
 		    (device->chipset >= 0x20 && device->chipset < 0x25))
-- 
2.25.3
