From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] device: detect vGPUs
Date: Fri, 17 Apr 2020 20:09:32 +0200
Message-ID: <20200417180932.111335-3-kherbst@redhat.com>
References: <20200417180932.111335-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200417180932.111335-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/device/base.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index ddaa96a75..70effb36e 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2948,7 +2948,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 {
 	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
-	u32 boot0, strap;
+	u32 boot0, boot1, strap;
 	void __iomem *map;
 	int ret = -EEXIST, i;
 	unsigned chipset;
@@ -2993,8 +2993,19 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			}
 		}
 
-		/* read boot0 and strapping information */
+		/* vGPU detection */
 		boot0 = ioread32_native(map + 0x000000);
+		boot1 = ioread32_native(map + 0x000004);
+		chipset = (boot0 & 0x1ff00000) >> 20;
+
+		if (chipset >= 0x160 && (boot1 & 0x00030000)) {
+			iounmap(map);
+			nvdev_info(device, "vGPUs are not supported\n");
+			ret = -ENODEV;
+			goto done;
+		}
+
+		/* read strapping information */
 		strap = ioread32_native(map + 0x101000);
 		iounmap(map);
 
-- 
2.25.2
