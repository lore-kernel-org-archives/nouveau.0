From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 3/3] drm/nouveau: fix semaphore dmabuf obj
Date: Tue, 23 Jul 2013 15:49:39 +0200
Message-ID: <51EE89F3.6030205@canonical.com>
References: <51EE8888.4030302@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51EE8888.4030302@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Fixes some dmabuf object errors on nv50 chipset and below.

Cc: stable@vger.kernel.org [3.7+]
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
Xorg still won't start with vblank enabled on nv50, I have no idea why yet.

diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 37a032b..260f3c5 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -76,7 +76,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 	struct ttm_mem_reg *mem = &priv->bo->bo.mem;
 	struct nouveau_object *object;
 	u32 start = mem->start * PAGE_SIZE;
-	u32 limit = mem->start + mem->size - 1;
+	u32 limit = start + mem->size - 1;
 	int ret = 0;
 
 	fctx = chan->fence = kzalloc(sizeof(*fctx), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index ada4d6d..60afa5c 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -51,26 +51,27 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 	fctx->base.sync = nv17_fence_sync;
 
 	ret = nouveau_object_new(nv_object(chan->cli), chan->handle,
-				 NvSema, 0x0002,
+				 NvSema, 0x003d,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
 						 NV_DMA_ACCESS_RDWR,
 					.start = mem->start * PAGE_SIZE,
-					.limit = mem->size - 1,
+					.limit = mem->start * PAGE_SIZE + mem->size - 1,
 				 }, sizeof(struct nv_dma_class),
 				 &object);
 
 	/* dma objects for display sync channel semaphore blocks */
 	for (i = 0; !ret && i < dev->mode_config.num_crtc; i++) {
 		struct nouveau_bo *bo = nv50_display_crtc_sema(dev, i);
+		mem = &bo->bo.mem;
 
 		ret = nouveau_object_new(nv_object(chan->cli), chan->handle,
 					 NvEvoSema0 + i, 0x003d,
 					 &(struct nv_dma_class) {
 						.flags = NV_DMA_TARGET_VRAM |
 							 NV_DMA_ACCESS_RDWR,
-						.start = bo->bo.offset,
-						.limit = bo->bo.offset + 0xfff,
+						.start = mem->start * PAGE_SIZE,
+						.limit = mem->start * PAGE_SIZE + mem->size - 1,
 					 }, sizeof(struct nv_dma_class),
 					 &object);
 	}
