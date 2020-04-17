From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] device: detect if changing endianness
 failed
Date: Fri, 17 Apr 2020 20:09:31 +0200
Message-ID: <20200417180932.111335-2-kherbst@redhat.com>
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

v2: relax the checks a little

Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/device/base.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 17676c75a..ddaa96a75 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2924,6 +2924,20 @@ nvkm_device_del(struct nvkm_device **pdevice)
 	}
 }
 
+static inline bool
+nvkm_device_endianness(void __iomem *pri)
+{
+	u32 boot1 = ioread32_native(pri + 0x000004) & 0x01000001;
+#ifdef __BIG_ENDIAN
+	if (!boot1)
+		return false;
+#else
+	if (boot1)
+		return false;
+#endif
+	return true;
+}
+
 int
 nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
@@ -2968,13 +2982,15 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			goto done;
 
 		/* switch mmio to cpu's native endianness */
-#ifndef __BIG_ENDIAN
-		if (ioread32_native(map + 0x000004) != 0x00000000) {
-#else
-		if (ioread32_native(map + 0x000004) == 0x00000000) {
-#endif
+		if (!nvkm_device_endianness(map)) {
 			iowrite32_native(0x01000001, map + 0x000004);
 			ioread32_native(map);
+			if (!nvkm_device_endianness(map)) {
+				nvdev_error(device,
+					    "GPU not supported on big-endian\n");
+				ret = -ENOSYS;
+				goto done;
+			}
 		}
 
 		/* read boot0 and strapping information */
-- 
2.25.2
