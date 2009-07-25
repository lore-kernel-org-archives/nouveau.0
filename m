From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 3/4] drm/nouveau: io{read,write}32_native API
Date: Sat, 25 Jul 2009 15:29:06 +0300
Message-ID: <1248524947-4550-4-git-send-email-pq@iki.fi>
References: <1248524947-4550-1-git-send-email-pq@iki.fi>
	<1248524947-4550-2-git-send-email-pq@iki.fi>
	<1248524947-4550-3-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1248524947-4550-3-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Try to clean up the register accessor definitions by defining
io{read,write}32_native API, which does not byteswap, and rewrite all
accessors to use it.

As a consequence, readl/writel calls are changed to ioread32/iowrite32
also on x86. It adds a tiny overhead, since they are generic IO
functions, but the overhead should be diminishing as compared to access
over PCI bus.

All 16-bit accessors are removed as unused.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h |   58 +++++++++++----------------------
 1 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 7a37559..4d53129 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -947,71 +947,51 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
 
-#define NVDEV ((struct drm_nouveau_private *)dev->dev_private)
+#ifndef ioread32_native
 #ifdef __BIG_ENDIAN
+#define ioread32_native  ioread32be
+#define iowrite32_native iowrite32be
+#else /* def __BIG_ENDIAN */
+#define ioread32_native  ioread32
+#define iowrite32_native iowrite32
+#endif /* def __BIG_ENDIAN else */
+#endif /* !ioread32_native */
+
+#define NVDEV ((struct drm_nouveau_private *)dev->dev_private)
 #define nv_out32(map, reg, val) \
-	iowrite32be((val), (void __iomem *)NVDEV->map->handle + (reg))
-#define nv_out16(map, reg, val) \
-	iowrite16be((val), (void __iomem *)NVDEV->map->handle + (reg))
+	iowrite32_native((val), (void __iomem *)NVDEV->map->handle + (reg))
 #define nv_in32(map, reg) \
-	ioread32be((void __iomem *)NVDEV->map->handle + (reg))
-#define nv_in16(map, reg) \
-	ioread16be((void __iomem *)NVDEV->map->handle + (reg))
-#else
-#define nv_out32(map, reg, val) DRM_WRITE32(NVDEV->map, (reg), (val))
-#define nv_out16(map, reg, val) DRM_WRITE16(NVDEV->map, (reg), (val))
-#define nv_in32(map, reg) DRM_READ32(NVDEV->map, (reg))
-#define nv_in16(map, reg) DRM_READ16(NVDEV->map, (reg))
-#endif
+	ioread32_native((void __iomem *)NVDEV->map->handle + (reg))
 
 /* channel control reg access */
-#ifdef __BIG_ENDIAN
 #define nvchan_wr32(reg, val) \
-	iowrite32be((val), (void __iomem *)chan->user->handle + (reg))
-#define nvchan_rd32(reg) ioread32be((void __iomem *)chan->user->handle + (reg))
-#else
-#define nvchan_wr32(reg, val) DRM_WRITE32(chan->user, (reg), (val))
-#define nvchan_rd32(reg) DRM_READ32(chan->user, (reg))
-#endif
-
+	iowrite32_native((val), (void __iomem *)chan->user->handle + (reg))
+#define nvchan_rd32(reg) \
+	ioread32_native((void __iomem *)chan->user->handle + (reg))
 
 /* register access */
-#ifdef __BIG_ENDIAN
-static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return ioread32be(dev_priv->mmio + reg);
-}
-
-static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	iowrite32be(val, dev_priv->mmio + reg);
-}
-#else
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return readl(dev_priv->mmio + reg);
+	return ioread32_native(dev_priv->mmio + reg);
 }
 
 static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	writel(val, dev_priv->mmio + reg);
+	iowrite32_native(val, dev_priv->mmio + reg);
 }
-#endif /* not __BIG_ENDIAN */
 
 static inline u8 nv_rd08(struct drm_device *dev, unsigned reg)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return readb(dev_priv->mmio + reg);
+	return ioread8(dev_priv->mmio + reg);
 }
 
 static inline void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	writeb(val, dev_priv->mmio + reg);
+	iowrite8(val, dev_priv->mmio + reg);
 }
 
 #define nv_wait(reg,mask,val) nouveau_wait_until(dev, 2000000000ULL, (reg),    \
-- 
1.6.3.3
