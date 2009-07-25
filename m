From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/4] drm/nouveau: use proper IO accessors on PPC
Date: Sat, 25 Jul 2009 15:29:05 +0300
Message-ID: <1248524947-4550-3-git-send-email-pq@iki.fi>
References: <1248524947-4550-1-git-send-email-pq@iki.fi>
	<1248524947-4550-2-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1248524947-4550-2-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Use the generic io{read,write}32be() functions on big-endian instead of the
PPC-specific private {in,out}_be32(), which are not meant to be used
with PCI devices.

While we are at it, change all #ifdef __powerpc__ that are really just
for endianness into #ifdef __BIG_ENDIAN, and clean up a bit of style.

On Wed, 22 Jul 2009 00:01:59 +0200
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> The powerpc in_le32 style functions are a completely different
> story, they are basically defined to operate only on on-chip
> components, while ioread32 and readl do work on PCI devices.

On Wed, 22 Jul 2009 23:20:58 +0200
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> If it's a PCI/AGP/PCIe device, use iowrite32be(), otherwise it
> may not work correctly on a pseries, celleb or qs20 machine.
>
> If it's connected over a different bus (IOIF on PS3), out_be32
> would be more appropriate, but AFAICT, iowrite32be should work
> just as well.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   39 +++++++++++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_state.c |    2 +-
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 90802dc..7a37559 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -948,40 +948,45 @@ extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
 
 #define NVDEV ((struct drm_nouveau_private *)dev->dev_private)
-#if defined(__powerpc__)
-#define nv_out32(map,reg,val) out_be32((void __iomem *)NVDEV->map->handle + (reg), (val))
-#define nv_out16(map,reg,val) out_be16((void __iomem *)NVDEV->map->handle + (reg), (val))
-#define nv_in32(map,reg) in_be32((void __iomem *)NVDEV->map->handle + (reg))
-#define nv_in16(map,reg) in_be16((void __iomem *)NVDEV->map->handle + (reg))
+#ifdef __BIG_ENDIAN
+#define nv_out32(map, reg, val) \
+	iowrite32be((val), (void __iomem *)NVDEV->map->handle + (reg))
+#define nv_out16(map, reg, val) \
+	iowrite16be((val), (void __iomem *)NVDEV->map->handle + (reg))
+#define nv_in32(map, reg) \
+	ioread32be((void __iomem *)NVDEV->map->handle + (reg))
+#define nv_in16(map, reg) \
+	ioread16be((void __iomem *)NVDEV->map->handle + (reg))
 #else
-#define nv_out32(map,reg,val) DRM_WRITE32(NVDEV->map, (reg), (val))
-#define nv_out16(map,reg,val) DRM_WRITE16(NVDEV->map, (reg), (val))
-#define nv_in32(map,reg) DRM_READ32(NVDEV->map, (reg))
-#define nv_in16(map,reg) DRM_READ16(NVDEV->map, (reg))
+#define nv_out32(map, reg, val) DRM_WRITE32(NVDEV->map, (reg), (val))
+#define nv_out16(map, reg, val) DRM_WRITE16(NVDEV->map, (reg), (val))
+#define nv_in32(map, reg) DRM_READ32(NVDEV->map, (reg))
+#define nv_in16(map, reg) DRM_READ16(NVDEV->map, (reg))
 #endif
 
 /* channel control reg access */
-#if defined(__powerpc__)
-#define nvchan_wr32(reg,val) out_be32((void __iomem *)chan->user->handle + (reg), (val))
-#define nvchan_rd32(reg) in_be32((void __iomem *)chan->user->handle + (reg))
+#ifdef __BIG_ENDIAN
+#define nvchan_wr32(reg, val) \
+	iowrite32be((val), (void __iomem *)chan->user->handle + (reg))
+#define nvchan_rd32(reg) ioread32be((void __iomem *)chan->user->handle + (reg))
 #else
-#define nvchan_wr32(reg,val) DRM_WRITE32(chan->user, (reg), (val))
+#define nvchan_wr32(reg, val) DRM_WRITE32(chan->user, (reg), (val))
 #define nvchan_rd32(reg) DRM_READ32(chan->user, (reg))
 #endif
 
 
 /* register access */
-#if defined(__powerpc__)
+#ifdef __BIG_ENDIAN
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return in_be32(dev_priv->mmio + reg);
+	return ioread32be(dev_priv->mmio + reg);
 }
 
 static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	out_be32(dev_priv->mmio + reg, val);
+	iowrite32be(val, dev_priv->mmio + reg);
 }
 #else
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
@@ -995,7 +1000,7 @@ static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	writel(val, dev_priv->mmio + reg);
 }
-#endif /* not __powerpc__ */
+#endif /* not __BIG_ENDIAN */
 
 static inline u8 nv_rd08(struct drm_device *dev, unsigned reg)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 911dc7e..b70ec33 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -485,7 +485,7 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	NV_DEBUG(dev, "regs mapped ok at 0x%llx\n",
 					(unsigned long long)mmio_start_offs);
 
-#if defined(__powerpc__)
+#ifdef __BIG_ENDIAN
 	/* Put the card in BE mode if it's not */
 	if (nv_rd32(dev, NV03_PMC_BOOT_1))
 		nv_wr32(dev, NV03_PMC_BOOT_1, 0x00000001);
-- 
1.6.3.3
