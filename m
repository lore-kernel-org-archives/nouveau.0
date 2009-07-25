From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/4] drm/nouveau: change MMIO map to simple ioremap
Date: Sat, 25 Jul 2009 15:29:04 +0300
Message-ID: <1248524947-4550-2-git-send-email-pq@iki.fi>
References: <1248524947-4550-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1248524947-4550-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

This removes the ugliness of using drm_local_map. The use of ioremap()
is identical to what drm_addmap()/drm_rmmap() did.

Is ioremap() the right thing or should we use e.g. ioremap_uc()?
The ioremap API has been reworked in the past, and some assumptions
changed in the mapping caching type.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   14 +++++++-------
 drivers/gpu/drm/nouveau/nouveau_state.c |   21 +++++++++++----------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index cba3b3b..90802dc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -447,7 +447,7 @@ struct drm_nouveau_private {
 	int chipset;
 	int flags;
 
-	struct drm_local_map *mmio;
+	void __iomem *mmio;
 	struct drm_local_map *fb;
 	struct drm_local_map *ramin;
 
@@ -975,38 +975,38 @@ extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return in_be32((void __force __iomem *)dev_priv->mmio->handle + reg);
+	return in_be32(dev_priv->mmio + reg);
 }
 
 static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	out_be32((void __force __iomem *)dev_priv->mmio->handle + reg, val);
+	out_be32(dev_priv->mmio + reg, val);
 }
 #else
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return readl((void __force __iomem *)dev_priv->mmio->handle + reg);
+	return readl(dev_priv->mmio + reg);
 }
 
 static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	writel(val, (void __force __iomem *)dev_priv->mmio->handle + reg);
+	writel(val, dev_priv->mmio + reg);
 }
 #endif /* not __powerpc__ */
 
 static inline u8 nv_rd08(struct drm_device *dev, unsigned reg)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return readb((void __force __iomem *)dev_priv->mmio->handle + reg);
+	return readb(dev_priv->mmio + reg);
 }
 
 static inline void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	writeb(val, (void __force __iomem *)dev_priv->mmio->handle + reg);
+	writeb(val, dev_priv->mmio + reg);
 }
 
 #define nv_wait(reg,mask,val) nouveau_wait_until(dev, 2000000000ULL, (reg),    \
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index ae3d2d5..911dc7e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -454,6 +454,7 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 #endif
 	uint32_t reg0;
 	uint8_t architecture = 0;
+	resource_size_t mmio_start_offs;
 	int ret;
 
 	dev_priv = kzalloc(sizeof(*dev_priv), GFP_KERNEL);
@@ -474,16 +475,15 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	/* resource 6 is bios */
 
 	/* map the mmio regs */
-	ret = drm_addmap(dev, drm_get_resource_start(dev, 0),
-			 0x00800000, _DRM_REGISTERS, _DRM_READ_ONLY |
-			 _DRM_DRIVER, &dev_priv->mmio);
-	if (ret) {
-		NV_ERROR(dev, "Unable to initialize the mmio mapping (%d). "
-			      "Please report your setup to " DRIVER_EMAIL "\n",
-			 ret);
+	mmio_start_offs = pci_resource_start(dev->pdev, 0);
+	dev_priv->mmio = ioremap(mmio_start_offs, 0x00800000);
+	if (!dev_priv->mmio) {
+		NV_ERROR(dev, "Unable to initialize the mmio mapping. "
+			 "Please report your setup to " DRIVER_EMAIL "\n");
 		return -EINVAL;
 	}
-	NV_DEBUG(dev, "regs mapped ok at 0x%lx\n", (unsigned long)dev_priv->mmio->offset);
+	NV_DEBUG(dev, "regs mapped ok at 0x%llx\n",
+					(unsigned long long)mmio_start_offs);
 
 #if defined(__powerpc__)
 	/* Put the card in BE mode if it's not */
@@ -538,7 +538,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 		dev_priv->card_type = NV_UNKNOWN;
 	}
 
-	NV_INFO(dev, "Detected an NV%d generation card (0x%08x)\n", dev_priv->card_type,reg0);
+	NV_INFO(dev, "Detected an NV%d generation card (0x%08x)\n",
+						dev_priv->card_type, reg0);
 
 	if (dev_priv->card_type == NV_UNKNOWN) {
 		return -EINVAL;
@@ -653,7 +654,7 @@ int nouveau_unload(struct drm_device *dev)
 		nouveau_close(dev);
 	}
 
-	drm_rmmap(dev, dev_priv->mmio);
+	iounmap(dev_priv->mmio);
 	drm_rmmap(dev, dev_priv->ramin);
 	drm_rmmap(dev, dev_priv->fb);
 
-- 
1.6.3.3
