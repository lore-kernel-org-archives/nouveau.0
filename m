From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] drm/nouveau: OUT_RINGp - optimize OUT_RING loops
Date: Mon, 17 Aug 2009 01:20:47 +0300
Message-ID: <1250461247-19108-1-git-send-email-pq@iki.fi>
References: <1249410166-4566-3-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249410166-4566-3-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

The introduction of nouveau_bo_wr32() in commit "drm/nouveau: use bo
accessors for push buffers" to OUT_RING() made it considerably slower.

'x11perf -aa10text' benchmark hits the OUT_RING hard, since user
pushbuffers are first copied from user to kernel, and then from kernel
to the real pushbuffer bo using OUT_RING. The speed
- before nouveau_bo_wr32(): 677k/sec
- after: 475k/sec

This patch implements OUT_RINGp() for copying an arbitrary number of
dwords from an array to the pushbuffer bo. All OUT_RING copy loops are
replaced with calls to OUT_RINGp(). This brings aa10text speed to
785k/sec.

The tests have been run on nv28, Athlon64 3000+ (x86_64) and oprofile
running.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c |   13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h |    3 +++
 drivers/gpu/drm/nouveau/nouveau_gem.c |    3 +--
 drivers/gpu/drm/nouveau/nv04_fbcon.c  |   14 ++++++++------
 drivers/gpu/drm/nouveau/nv50_fbcon.c  |    4 ++--
 5 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 183a7d5..0025c3d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -90,6 +90,19 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	return 0;
 }
 
+void
+OUT_RINGp(struct nouveau_channel *chan, const void *data, unsigned nr_dwords)
+{
+	bool is_iomem;
+	u32 *mem = ttm_kmap_obj_virtual(&chan->pushbuf_bo->kmap, &is_iomem);
+	mem = &mem[chan->dma.cur];
+	if (is_iomem)
+		memcpy_toio((void __force __iomem *)mem, data, nr_dwords * 4);
+	else
+		memcpy(mem, data, nr_dwords * 4);
+	chan->dma.cur += nr_dwords;
+}
+
 static inline bool
 READ_GET(struct nouveau_channel *chan, uint32_t *get)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 072d9b9..cdaa37d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -109,6 +109,9 @@ OUT_RING(struct nouveau_channel *chan, int data)
 	nouveau_bo_wr32(chan->pushbuf_bo, chan->dma.cur++, data);
 }
 
+extern void
+OUT_RINGp(struct nouveau_channel *chan, const void *data, unsigned nr_dwords);
+
 static inline void
 BEGIN_RING(struct nouveau_channel *chan, int subc, int mthd, int size)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 4516058..8b2c9e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -528,8 +528,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	for (i = 0; i < req->nr_dwords; i++)
-		OUT_RING (chan, pushbuf[i]);
+	OUT_RINGp(chan, pushbuf, req->nr_dwords);
 
 	ret = nouveau_fence_emit(fence);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index 648b435..14fc87f 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -94,9 +94,12 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	struct drm_device *dev = par->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *chan = dev_priv->channel;
-	uint32_t fg, bg, mask = ~(~0 >> (32 - info->var.bits_per_pixel));
-	uint32_t dsize, width, *data = (uint32_t *) image->data;
-	int j, k = 0;
+	uint32_t fg;
+	uint32_t bg;
+	uint32_t mask = ~(~0 >> (32 - info->var.bits_per_pixel));
+	uint32_t dsize;
+	uint32_t width;
+	uint32_t *data = (uint32_t *)image->data;
 
 	if (info->state != FBINFO_STATE_RUNNING)
 		return;
@@ -140,9 +143,8 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		}
 
 		BEGIN_RING(chan, NvSubGdiRect, 0x0c00, iter_len);
-		for (j = iter_len; j--;)
-			OUT_RING(chan, data[k++]);
-
+		OUT_RINGp(chan, data, iter_len);
+		data += iter_len;
 		dsize -= iter_len;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
index d7af9ed..d3807e3 100644
--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -139,8 +139,8 @@ nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		dwords -= push;
 
 		BEGIN_RING(chan, NvSub2D, 0x40000860, push);
-		while (push--)
-			OUT_RING(chan, *data++);
+		OUT_RINGp(chan, data, push);
+		data += push;
 	}
 
 	FIRE_RING (chan);
-- 
1.6.3.3
