From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] drm/nouveau: Unregister irq handler if init fails.
Date: Mon, 14 Dec 2009 18:08:12 +0000
Message-ID: <1260814092-367-1-git-send-email-koriakin@0x04.net>
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

---
 drivers/gpu/drm/nouveau/nouveau_state.c |   25 ++++++++++++++++---------
 1 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 2ed41d3..285e6da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -390,21 +390,26 @@ nouveau_card_init(struct drm_device *dev)
 	ret = nouveau_channel_alloc(dev, &dev_priv->channel,
 				    (struct drm_file *)-2,
 				    NvDmaFB, NvDmaTT);
-	if (ret)
+	if (ret) {
+		drm_irq_uninstall(dev);
 		return ret;
+	}
 
 	gpuobj = NULL;
 	ret = nouveau_gpuobj_dma_new(dev_priv->channel, NV_CLASS_DMA_IN_MEMORY,
 				     0, nouveau_mem_fb_amount(dev),
 				     NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
 				     &gpuobj);
-	if (ret)
+	if (ret) {
+		drm_irq_uninstall(dev);
 		return ret;
+	}
 
 	ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaVRAM,
 				     gpuobj, NULL);
 	if (ret) {
 		nouveau_gpuobj_del(dev, &gpuobj);
+		drm_irq_uninstall(dev);
 		return ret;
 	}
 
@@ -412,25 +417,27 @@ nouveau_card_init(struct drm_device *dev)
 	ret = nouveau_gpuobj_gart_dma_new(dev_priv->channel, 0,
 					  dev_priv->gart_info.aper_size,
 					  NV_DMA_ACCESS_RW, &gpuobj, NULL);
-	if (ret)
+	if (ret) {
+		drm_irq_uninstall(dev);
 		return ret;
+	}
 
 	ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaGART,
 				     gpuobj, NULL);
 	if (ret) {
+		drm_irq_uninstall(dev);
 		nouveau_gpuobj_del(dev, &gpuobj);
 		return ret;
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		if (dev_priv->card_type >= NV_50) {
+		if (dev_priv->card_type >= NV_50)
 			ret = nv50_display_create(dev);
-			if (ret)
-				return ret;
-		} else {
+		else
 			ret = nv04_display_create(dev);
-			if (ret)
-				return ret;
+		if (ret) {
+			drm_irq_uninstall(dev);
+			return ret;
 		}
 	}
 
-- 
1.6.5.6
