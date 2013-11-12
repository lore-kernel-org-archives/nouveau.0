From: maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH 7/7] drm/nouveau: use a single vma for display
Date: Tue, 12 Nov 2013 13:34:14 +0100
Message-ID: <1384259656-29483-7-git-send-email-maarten.lankhorst@canonical.com>
References: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384259656-29483-1-git-send-email-maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

No need to map the same vma multiple times.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.h |  4 ++--
 drivers/gpu/drm/nouveau/nv50_display.c  | 13 ++++++-------
 drivers/gpu/drm/nouveau/nv50_display.h  |  2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c    | 24 +++++++++++++-----------
 drivers/gpu/drm/nouveau/nv84_fence.c    | 21 +++++++++------------
 5 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index c57bb61..60ae4e7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -82,7 +82,7 @@ struct nv84_fence_chan {
 	struct nouveau_fence_chan base;
 	struct nouveau_vma vma;
 	struct nouveau_vma vma_gart;
-	struct nouveau_vma dispc_vma[4];
+	struct nouveau_vma dispc_vma;
 };
 
 struct nv84_fence_priv {
@@ -92,7 +92,7 @@ struct nv84_fence_priv {
 	u32 *suspend;
 };
 
-u64  nv84_fence_crtc(struct nouveau_channel *, int);
+u64  nv84_fence_crtc(struct nouveau_channel *);
 int  nv84_fence_context_new(struct nouveau_channel *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index f8e66c0..4153c8a 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -433,7 +433,7 @@ evo_kick(u32 *push, void *evoc)
 static bool
 evo_sync_wait(void *data)
 {
-	if (nouveau_bo_rd32(data, EVO_MAST_NTFY) != 0x00000000)
+	if (nouveau_bo_rd32(data, EVO_MAST_NTFY / 4) != 0x00000000)
 		return true;
 	usleep_range(1, 2);
 	return false;
@@ -447,7 +447,7 @@ evo_sync(struct drm_device *dev)
 	struct nv50_mast *mast = nv50_mast(dev);
 	u32 *push = evo_wait(mast, 8);
 	if (push) {
-		nouveau_bo_wr32(disp->sync, EVO_MAST_NTFY, 0x00000000);
+		nouveau_bo_wr32(disp->sync, EVO_MAST_NTFY / 4, 0x00000000);
 		evo_mthd(push, 0x0084, 1);
 		evo_data(push, 0x80000000 | EVO_MAST_NTFY);
 		evo_mthd(push, 0x0080, 2);
@@ -465,7 +465,7 @@ evo_sync(struct drm_device *dev)
  * Page flipping channel
  *****************************************************************************/
 struct nouveau_bo *
-nv50_display_crtc_sema(struct drm_device *dev, int crtc)
+nv50_display_crtc_sema(struct drm_device *dev)
 {
 	return nv50_disp(dev)->sync;
 }
@@ -517,7 +517,6 @@ nv50_display_flip_next(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		       struct nouveau_channel *chan, u32 swap_interval)
 {
 	struct nouveau_framebuffer *nv_fb = nouveau_framebuffer(fb);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv50_head *head = nv50_head(crtc);
 	struct nv50_sync *sync = nv50_sync(crtc);
 	u32 *push;
@@ -539,7 +538,7 @@ nv50_display_flip_next(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 			return ret;
 
 		BEGIN_NV04(chan, 0, NV11_SUBCHAN_DMA_SEMAPHORE, 2);
-		OUT_RING  (chan, NvEvoSema0 + nv_crtc->index);
+		OUT_RING  (chan, NvEvoSema0);
 		OUT_RING  (chan, sync->addr ^ 0x10);
 		BEGIN_NV04(chan, 0, NV11_SUBCHAN_SEMAPHORE_RELEASE, 1);
 		OUT_RING  (chan, sync->data + 1);
@@ -548,7 +547,7 @@ nv50_display_flip_next(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		OUT_RING  (chan, sync->data);
 	} else
 	if (chan && nv_mclass(chan->object) < NVC0_CHANNEL_IND_CLASS) {
-		u64 addr = nv84_fence_crtc(chan, nv_crtc->index) + sync->addr;
+		u64 addr = nv84_fence_crtc(chan) + sync->addr;
 		ret = RING_SPACE(chan, 12);
 		if (ret)
 			return ret;
@@ -567,7 +566,7 @@ nv50_display_flip_next(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		OUT_RING  (chan, NV84_SUBCHAN_SEMAPHORE_TRIGGER_ACQUIRE_EQUAL);
 	} else
 	if (chan) {
-		u64 addr = nv84_fence_crtc(chan, nv_crtc->index) + sync->addr;
+		u64 addr = nv84_fence_crtc(chan) + sync->addr;
 		ret = RING_SPACE(chan, 10);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
index 70da347..ea681be 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.h
+++ b/drivers/gpu/drm/nouveau/nv50_display.h
@@ -40,6 +40,6 @@ void nv50_display_flip_stop(struct drm_crtc *);
 int  nv50_display_flip_next(struct drm_crtc *, struct drm_framebuffer *,
 			    struct nouveau_channel *, u32 swap_interval);
 
-struct nouveau_bo *nv50_display_crtc_sema(struct drm_device *, int head);
+struct nouveau_bo *nv50_display_crtc_sema(struct drm_device *);
 
 #endif /* __NV50_DISPLAY_H__ */
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 0ee3638..f302e7f 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -41,7 +41,8 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 	struct nouveau_object *object;
 	u32 start = mem->start * PAGE_SIZE;
 	u32 limit = start + mem->size - 1;
-	int ret, i;
+	int ret;
+	struct nouveau_bo *bo;
 
 	fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
 	if (!fctx)
@@ -62,21 +63,22 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 				 }, sizeof(struct nv_dma_class),
 				 &object);
 
-	/* dma objects for display sync channel semaphore blocks */
-	for (i = 0; !ret && i < dev->mode_config.num_crtc; i++) {
-		struct nouveau_bo *bo = nv50_display_crtc_sema(dev, i);
-		u32 start = bo->bo.mem.start * PAGE_SIZE;
-		u32 limit = start + bo->bo.mem.size - 1;
+	/* dma object for display sync channel semaphore blocks */
+	bo = nv50_display_crtc_sema(dev);
+
+	if (!ret && bo) {
+		start = bo->bo.mem.start * PAGE_SIZE;
+		limit = start + bo->bo.mem.size - 1;
 
 		ret = nouveau_object_new(nv_object(chan->cli), chan->handle,
-					 NvEvoSema0 + i, 0x003d,
-					 &(struct nv_dma_class) {
+					NvEvoSema0, 0x003d,
+					&(struct nv_dma_class) {
 						.flags = NV_DMA_TARGET_VRAM |
-							 NV_DMA_ACCESS_RDWR,
+							NV_DMA_ACCESS_RDWR,
 						.start = start,
 						.limit = limit,
-					 }, sizeof(struct nv_dma_class),
-					 &object);
+					}, sizeof(struct nv_dma_class),
+					&object);
 	}
 
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 9fd475c..2fbfb73 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -35,10 +35,10 @@
 #include "nv50_display.h"
 
 u64
-nv84_fence_crtc(struct nouveau_channel *chan, int crtc)
+nv84_fence_crtc(struct nouveau_channel *chan)
 {
 	struct nv84_fence_chan *fctx = chan->fence;
-	return fctx->dispc_vma[crtc].offset;
+	return fctx->dispc_vma.offset;
 }
 
 static int
@@ -122,12 +122,10 @@ nv84_fence_context_del(struct nouveau_channel *chan)
 	struct drm_device *dev = chan->drm->dev;
 	struct nv84_fence_priv *priv = chan->drm->fence;
 	struct nv84_fence_chan *fctx = chan->fence;
-	int i;
+	struct nouveau_bo *bo = nv50_display_crtc_sema(dev);
 
-	for (i = 0; i < dev->mode_config.num_crtc; i++) {
-		struct nouveau_bo *bo = nv50_display_crtc_sema(dev, i);
-		nouveau_bo_vma_del(bo, &fctx->dispc_vma[i]);
-	}
+	if (bo)
+		nouveau_bo_vma_del(bo, &fctx->dispc_vma);
 
 	nouveau_bo_vma_del(priv->bo, &fctx->vma_gart);
 	nouveau_bo_vma_del(priv->bo, &fctx->vma);
@@ -143,7 +141,8 @@ nv84_fence_context_new(struct nouveau_channel *chan)
 	struct nouveau_client *client = nouveau_client(fifo);
 	struct nv84_fence_priv *priv = chan->drm->fence;
 	struct nv84_fence_chan *fctx;
-	int ret, i;
+	struct nouveau_bo *bo = nv50_display_crtc_sema(chan->drm->dev);
+	int ret;
 
 	fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
 	if (!fctx)
@@ -163,10 +162,8 @@ nv84_fence_context_new(struct nouveau_channel *chan)
 	}
 
 	/* map display semaphore buffers into channel's vm */
-	for (i = 0; !ret && i < chan->drm->dev->mode_config.num_crtc; i++) {
-		struct nouveau_bo *bo = nv50_display_crtc_sema(chan->drm->dev, i);
-		ret = nouveau_bo_vma_add(bo, client->vm, &fctx->dispc_vma[i]);
-	}
+	if (!ret && bo)
+		ret = nouveau_bo_vma_add(bo, client->vm, &fctx->dispc_vma);
 
 	nouveau_bo_wr32(priv->bo, fifo->chid * 16/4, 0x00000000);
 
-- 
1.8.4
