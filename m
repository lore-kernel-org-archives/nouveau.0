From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/3] device: rework mmio mapping code to get
 rid of second map
Date: Tue, 28 Apr 2020 18:54:02 +0200
Message-ID: <20200428165404.936235-1-kherbst@redhat.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes warnings on GPUs with smaller a smaller mmio region like vGPUs.

Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/device/base.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 8ebbe1656..37589f365 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
 	u32 boot0, strap;
-	void __iomem *map;
+	void __iomem *map = NULL;
 	int ret = -EEXIST, i;
 	unsigned chipset;
 
@@ -2961,12 +2961,17 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	mmio_base = device->func->resource_addr(device, 0);
 	mmio_size = device->func->resource_size(device, 0);
 
-	/* identify the chipset, and determine classes of subdev/engines */
-	if (detect) {
-		map = ioremap(mmio_base, 0x102000);
-		if (ret = -ENOMEM, map == NULL)
+	if (detect || mmio) {
+		map = ioremap(mmio_base, mmio_size);
+		if (map == NULL) {
+			nvdev_error(device, "unable to map PRI\n");
+			ret = -ENOMEM;
 			goto done;
+		}
+	}
 
+	/* identify the chipset, and determine classes of subdev/engines */
+	if (detect) {
 		/* switch mmio to cpu's native endianness */
 #ifndef __BIG_ENDIAN
 		if (ioread32_native(map + 0x000004) != 0x00000000) {
@@ -2980,7 +2985,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		/* read boot0 and strapping information */
 		boot0 = ioread32_native(map + 0x000000);
 		strap = ioread32_native(map + 0x101000);
-		iounmap(map);
 
 		/* chipset can be overridden for devel/testing purposes */
 		chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
@@ -3159,12 +3163,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		device->name = device->chip->name;
 
 	if (mmio) {
-		device->pri = ioremap(mmio_base, mmio_size);
-		if (!device->pri) {
-			nvdev_error(device, "unable to map PRI\n");
-			ret = -ENOMEM;
-			goto done;
-		}
+		device->pri = map;
 	}
 
 	mutex_init(&device->mutex);
@@ -3254,6 +3253,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 
 	ret = 0;
 done:
+	if (map && (!mmio || ret)) {
+		device->pri = NULL;
+		iounmap(map);
+	}
 	mutex_unlock(&nv_devices_mutex);
 	return ret;
 }
-- 
2.25.3
