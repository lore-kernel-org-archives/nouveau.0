From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: change channel regs mapping to
	ioremap
Date: Thu, 17 Sep 2009 22:08:48 +0300
Message-ID: <1253214530-4502-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Use ioremap() for mapping the channel user regs (that are never exposed
to user space) instead of drm_addmap().

This removes the last use cases of drm_addmap/drm_rmmap from Nouveau.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |   13 ++++++-------
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    9 +++------
 drivers/gpu/drm/nouveau/nv50_display.c    |   13 ++++++-------
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 65810d4..8661b68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -167,13 +167,12 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 	else
 		user = NV50_USER(channel);
 
-	ret = drm_addmap(dev, drm_get_resource_start(dev, 0) + user,
-			 PAGE_SIZE, _DRM_REGISTERS, _DRM_DRIVER |
-			 _DRM_READ_ONLY, &chan->user);
-	if (ret) {
-		NV_ERROR(dev, "regs %d\n", ret);
+	chan->user = ioremap(pci_resource_start(dev->pdev, 0) + user,
+								PAGE_SIZE);
+	if (!chan->user) {
+		NV_ERROR(dev, "ioremap of regs failed.\n");
 		nouveau_channel_free(chan);
-		return ret;
+		return -ENOMEM;
 	}
 	chan->user_put = 0x40;
 	chan->user_get = 0x44;
@@ -412,7 +411,7 @@ nouveau_channel_free(struct nouveau_channel *chan)
 	nouveau_notifier_takedown_channel(chan);
 
 	if (chan->user)
-		drm_rmmap(dev, chan->user);
+		iounmap(chan->user);
 
 	dev_priv->fifos[chan->id] = NULL;
 	dev_priv->fifo_alloc_count--;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 429c109..63cf483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -169,7 +169,7 @@ struct nouveau_channel {
 	struct drm_local_map *map;
 
 	/* mapping of the regs controling the fifo */
-	struct drm_local_map *user;
+	void __iomem *user;
 	uint32_t user_get;
 	uint32_t user_put;
 
@@ -1047,11 +1047,8 @@ extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 #endif /* !ioread32_native */
 
 /* channel control reg access */
-#define nvchan_wr32(reg, val) \
-	iowrite32_native((val), \
-			(void __force __iomem *)chan->user->handle + (reg))
-#define nvchan_rd32(reg) \
-	ioread32_native((void __force __iomem *)chan->user->handle + (reg))
+#define nvchan_wr32(reg, val) iowrite32_native((val), chan->user + (reg))
+#define nvchan_rd32(reg) ioread32_native(chan->user + (reg))
 
 /* register access */
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 69bfd21..0cf9953 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -44,7 +44,7 @@ nv50_evo_channel_del(struct nouveau_channel **pchan)
 	nouveau_bo_ref(NULL, &chan->pushbuf_bo);
 
 	if (chan->user)
-		drm_rmmap(chan->dev, chan->user);
+		iounmap(chan->user);
 
 	kfree(chan);
 }
@@ -166,13 +166,12 @@ nv50_evo_channel_new(struct drm_device *dev, struct nouveau_channel **pchan)
 		return ret;
 	}
 
-	ret = drm_addmap(dev, drm_get_resource_start(dev, 0) +
-			 NV50_PDISPLAY_USER(0), PAGE_SIZE, _DRM_REGISTERS,
-			 _DRM_DRIVER | _DRM_READ_ONLY, &chan->user);
-	if (ret) {
-		NV_ERROR(dev, "Error mapping EVO control regs: %d\n", ret);
+	chan->user = ioremap(pci_resource_start(dev->pdev, 0) +
+					NV50_PDISPLAY_USER(0), PAGE_SIZE);
+	if (!chan->user) {
+		NV_ERROR(dev, "Error mapping EVO control regs.\n");
 		nv50_evo_channel_del(pchan);
-		return ret;
+		return -ENOMEM;
 	}
 
 	return 0;
-- 
1.6.3.3
