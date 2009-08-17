From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/8] drm/nouveau: use bo accessors for push buffers
Date: Mon, 17 Aug 2009 16:42:38 +0300
Message-ID: <1250516564-14193-3-git-send-email-pq@iki.fi>
References: <1250516564-14193-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250516564-14193-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Since push buffers may reside in system memory or VRAM (iomem), they
must be accessed via the proper functions instead of just dereferencing
a pointer which might be an iomem cookie.

Remove the redundant member nouveau_channel::dma.pushbuf.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c  |    1 -
 drivers/gpu/drm/nouveau/nouveau_dma.h  |    5 ++---
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    3 +--
 drivers/gpu/drm/nouveau/nv50_display.c |    1 -
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 7b2bea3..183a7d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -56,7 +56,6 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	ret = nouveau_bo_map(chan->pushbuf_bo);
 	if (ret)
 		return ret;
-	chan->dma.pushbuf = chan->pushbuf_bo->kmap.virtual;
 
 	/* Map M2MF notifier object - fbcon. */
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 497edca..072d9b9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -106,7 +106,7 @@ OUT_RING(struct nouveau_channel *chan, int data)
 	NV_INFO(chan->dev, "Ch%d/0x%08x: 0x%08x\n",
 		chan->id, chan->dma.cur << 2, data);
 #endif
-	chan->dma.pushbuf[chan->dma.cur++] = data;
+	nouveau_bo_wr32(chan->pushbuf_bo, chan->dma.cur++, data);
 }
 
 static inline void
@@ -116,9 +116,8 @@ BEGIN_RING(struct nouveau_channel *chan, int subc, int mthd, int size)
 }
 
 #define WRITE_PUT(val) do {                                                    \
-	volatile uint32_t tmp;                                                 \
 	DRM_MEMORYBARRIER();                                                   \
-	tmp = chan->dma.pushbuf[0];                                            \
+	nouveau_bo_rd32(chan->pushbuf_bo, 0);                                  \
 	nvchan_wr32(chan->user_put, ((val) << 2) + chan->pushbuf_base);        \
 } while (0)
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index fe6a0a1..8516fda 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -214,8 +214,7 @@ struct nouveau_channel
 		int free;
 		int cur;
 		int put;
-
-		volatile uint32_t *pushbuf;
+		/* access via pushbuf_bo */
 	} dma;
 
 	uint32_t sw_subchannel[8];
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 59febd5..49225c8 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -328,7 +328,6 @@ nv50_display_init(struct drm_device *dev)
 	evo->dma.put = 0;
 	evo->dma.cur = evo->dma.put;
 	evo->dma.free = evo->dma.max - evo->dma.cur;
-	evo->dma.pushbuf = evo->pushbuf_bo->kmap.virtual;
 
 	RING_SPACE(evo, NOUVEAU_DMA_SKIPS);
 	for (i = 0; i < NOUVEAU_DMA_SKIPS; i++)
-- 
1.6.3.3
