From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: always do buffer object moves on
	bo->channel
Date: Sat, 19 Dec 2009 21:33:43 +0100
Message-ID: <1261254823-3556-1-git-send-email-madman2003@gmail.com>
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

- Use the "direct" objects that previously only the kernel fifo had.
- This avoids corruption on some buffer moves.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c     |   23 ++---------------
 drivers/gpu/drm/nouveau/nouveau_object.c |   36 ++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_state.c  |   38 +-----------------------------
 3 files changed, 40 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e18d7fc..8ee5583 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -471,15 +471,9 @@ static inline uint32_t
 nouveau_bo_mem_ctxdma(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 		      struct ttm_mem_reg *mem)
 {
-	if (chan == nouveau_bdev(nvbo->bo.bdev)->channel) {
-		if (mem->mem_type == TTM_PL_TT)
-			return NvDmaGART;
-		return NvDmaVRAM;
-	}
-
 	if (mem->mem_type == TTM_PL_TT)
-		return chan->gart_handle;
-	return chan->vram_handle;
+		return NvDmaGART;
+	return NvDmaVRAM;
 }
 
 static int
@@ -495,22 +489,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 	int ret;
 
 	chan = nvbo->channel;
-	if (!chan || nvbo->tile_flags || nvbo->no_vm)
+	if (!chan)
 		chan = dev_priv->channel;
 
 	src_offset = old_mem->mm_node->start << PAGE_SHIFT;
 	dst_offset = new_mem->mm_node->start << PAGE_SHIFT;
-	if (chan != dev_priv->channel) {
-		if (old_mem->mem_type == TTM_PL_TT)
-			src_offset += dev_priv->vm_gart_base;
-		else
-			src_offset += dev_priv->vm_vram_base;
-
-		if (new_mem->mem_type == TTM_PL_TT)
-			dst_offset += dev_priv->vm_gart_base;
-		else
-			dst_offset += dev_priv->vm_vram_base;
-	}
 
 	ret = RING_SPACE(chan, 3);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index 93379bb..35271c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -33,6 +33,7 @@
 #include "drmP.h"
 #include "drm.h"
 #include "nouveau_drv.h"
+#include "nouveau_dma.h"
 #include "nouveau_drm.h"
 
 /* NVidia uses context objects to drive drawing operations.
@@ -1099,6 +1100,41 @@ nouveau_gpuobj_channel_init(struct nouveau_channel *chan,
 		return ret;
 	}
 
+	/* Two objects for kernel consumption, on nv50 they allow direct access
+	 * to vram. This is needed because we don't know the tiling layout.
+	 */
+	vram = NULL;
+	ret = nouveau_gpuobj_dma_new(chan, NV_CLASS_DMA_IN_MEMORY,
+				0, nouveau_mem_fb_amount(dev),
+				NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
+				&vram);
+	if (ret) {
+		NV_ERROR(dev, "Error creating direct VRAM ctxdma: %d\n", ret);
+		return ret;
+	}
+
+	ret = nouveau_gpuobj_ref_add(dev, chan, NvDmaVRAM, vram, NULL);
+	if (ret) {
+		NV_ERROR(dev, "Error referencing direct VRAM ctxdma:" \
+			" %d\n", ret);
+		return ret;
+	}
+
+	tt = NULL;
+	ret = nouveau_gpuobj_gart_dma_new(chan, 0,
+						  dev_priv->gart_info.aper_size,
+						  NV_DMA_ACCESS_RW, &tt, NULL);
+	if (ret) {
+		NV_ERROR(dev, "Error creating GART ctxdma: %d\n", ret);
+		return ret;
+	}
+
+	ret = nouveau_gpuobj_ref_add(dev, chan, NvDmaGART, tt, NULL);
+	if (ret) {
+		NV_ERROR(dev, "Error referencing GART ctxdma: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 6a45913..c9757f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -321,46 +321,10 @@ static int
 nouveau_card_init_channel(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct nouveau_gpuobj *gpuobj;
-	int ret;
 
-	ret = nouveau_channel_alloc(dev, &dev_priv->channel,
+	return nouveau_channel_alloc(dev, &dev_priv->channel,
 				    (struct drm_file *)-2,
 				    NvDmaFB, NvDmaTT);
-	if (ret)
-		return ret;
-
-	gpuobj = NULL;
-	ret = nouveau_gpuobj_dma_new(dev_priv->channel, NV_CLASS_DMA_IN_MEMORY,
-				     0, nouveau_mem_fb_amount(dev),
-				     NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
-				     &gpuobj);
-	if (ret)
-		goto out_err;
-
-	ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaVRAM,
-				     gpuobj, NULL);
-	if (ret)
-		goto out_err;
-
-	gpuobj = NULL;
-	ret = nouveau_gpuobj_gart_dma_new(dev_priv->channel, 0,
-					  dev_priv->gart_info.aper_size,
-					  NV_DMA_ACCESS_RW, &gpuobj, NULL);
-	if (ret)
-		goto out_err;
-
-	ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaGART,
-				     gpuobj, NULL);
-	if (ret)
-		goto out_err;
-
-	return 0;
-out_err:
-	nouveau_gpuobj_del(dev, &gpuobj);
-	nouveau_channel_free(dev_priv->channel);
-	dev_priv->channel = NULL;
-	return ret;
 }
 
 int
-- 
1.6.5.4
