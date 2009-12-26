From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: Allocate a per-channel instance
	of NV_SW.
Date: Sat, 26 Dec 2009 19:21:47 +0100
Message-ID: <1261851709-10677-1-git-send-email-currojerez@riseup.net>
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

It will be useful for various synchronization purposes, mostly stolen
from "[PATCH] drm/nv50: synchronize user channel after buffer object
move on kernel channel" by Maarten Maathuis.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |    4 +++-
 drivers/gpu/drm/nouveau/nouveau_dma.c     |   17 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h     |   10 ++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h     |   20 +++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_object.c  |    2 +-
 drivers/gpu/drm/nouveau/nv04_fbcon.c      |   19 ++++++++++---------
 6 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 9aaa972..4f378b6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -414,7 +414,9 @@ nouveau_ioctl_fifo_alloc(struct drm_device *dev, void *data,
 		init->subchan[0].grclass = 0x0039;
 	else
 		init->subchan[0].grclass = 0x5039;
-	init->nr_subchan = 1;
+	init->subchan[1].handle = NvSw;
+	init->subchan[1].grclass = NV_SW;
+	init->nr_subchan = 2;
 
 	/* Named memory object area */
 	ret = drm_gem_handle_create(file_priv, chan->notifier_bo->gem,
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 7035536..f1fd3f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -35,6 +35,7 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_gpuobj *m2mf = NULL;
+	struct nouveau_gpuobj *nvsw = NULL;
 	int ret, i;
 
 	/* Create NV_MEMORY_TO_MEMORY_FORMAT for buffer moves */
@@ -47,6 +48,15 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	if (ret)
 		return ret;
 
+	/* Create an NV_SW object for various sync purposes */
+	ret = nouveau_gpuobj_sw_new(chan, NV_SW, &nvsw);
+	if (ret)
+		return ret;
+
+	ret = nouveau_gpuobj_ref_add(dev, chan, NvSw, nvsw, NULL);
+	if (ret)
+		return ret;
+
 	/* NV_MEMORY_TO_MEMORY_FORMAT requires a notifier object */
 	ret = nouveau_notifier_alloc(chan, NvNotify0, 32, &chan->m2mf_ntfy);
 	if (ret)
@@ -87,6 +97,13 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	BEGIN_RING(chan, NvSubM2MF, NV_MEMORY_TO_MEMORY_FORMAT_DMA_NOTIFY, 1);
 	OUT_RING(chan, NvNotify0);
 
+	/* Initialise NV_SW */
+	ret = RING_SPACE(chan, 2);
+	if (ret)
+		return ret;
+	BEGIN_RING(chan, NvSubSw, 0, 1);
+	OUT_RING(chan, NvSw);
+
 	/* Sit back and pray the channel works.. */
 	FIRE_RING(chan);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 04e85d8..dabfd65 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -46,10 +46,11 @@
 /* Hardcoded object assignments to subchannels (subchannel id). */
 enum {
 	NvSubM2MF	= 0,
-	NvSub2D		= 1,
-	NvSubCtxSurf2D  = 1,
-	NvSubGdiRect    = 2,
-	NvSubImageBlit  = 3
+	NvSubSw		= 1,
+	NvSub2D		= 2,
+	NvSubCtxSurf2D  = 2,
+	NvSubGdiRect    = 3,
+	NvSubImageBlit  = 4
 };
 
 /* Object handles. */
@@ -67,6 +68,7 @@ enum {
 	NvClipRect	= 0x8000000b,
 	NvGdiRect	= 0x8000000c,
 	NvImageBlit	= 0x8000000d,
+	NvSw		= 0x8000000e,
 
 	/* G80+ display objects */
 	NvEvoVRAM	= 0x01000000,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 7da88a9..9181eae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -788,6 +788,8 @@ extern int nouveau_gpuobj_gart_dma_new(struct nouveau_channel *,
 				       uint32_t *o_ret);
 extern int nouveau_gpuobj_gr_new(struct nouveau_channel *, int class,
 				 struct nouveau_gpuobj **);
+extern int nouveau_gpuobj_sw_new(struct nouveau_channel *, int class,
+				 struct nouveau_gpuobj **);
 extern int nouveau_ioctl_grobj_alloc(struct drm_device *, void *data,
 				     struct drm_file *);
 extern int nouveau_ioctl_gpuobj_free(struct drm_device *, void *data,
@@ -1330,14 +1332,14 @@ nv_two_reg_pll(struct drm_device *dev)
 	return false;
 }
 
-#define NV50_NVSW                                                    0x0000506e
-#define NV50_NVSW_DMA_SEMAPHORE                                      0x00000060
-#define NV50_NVSW_SEMAPHORE_OFFSET                                   0x00000064
-#define NV50_NVSW_SEMAPHORE_ACQUIRE                                  0x00000068
-#define NV50_NVSW_SEMAPHORE_RELEASE                                  0x0000006c
-#define NV50_NVSW_DMA_VBLSEM                                         0x0000018c
-#define NV50_NVSW_VBLSEM_OFFSET                                      0x00000400
-#define NV50_NVSW_VBLSEM_RELEASE_VALUE                               0x00000404
-#define NV50_NVSW_VBLSEM_RELEASE                                     0x00000408
+#define NV_SW                                                        0x0000506e
+#define NV_SW_DMA_SEMAPHORE                                          0x00000060
+#define NV_SW_SEMAPHORE_OFFSET                                       0x00000064
+#define NV_SW_SEMAPHORE_ACQUIRE                                      0x00000068
+#define NV_SW_SEMAPHORE_RELEASE                                      0x0000006c
+#define NV_SW_DMA_VBLSEM                                             0x0000018c
+#define NV_SW_VBLSEM_OFFSET                                          0x00000400
+#define NV_SW_VBLSEM_RELEASE_VALUE                                   0x00000404
+#define NV_SW_VBLSEM_RELEASE                                         0x00000408
 
 #endif /* __NOUVEAU_DRV_H__ */
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index 93379bb..6c2cf81 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -881,7 +881,7 @@ nouveau_gpuobj_gr_new(struct nouveau_channel *chan, int class,
 	return 0;
 }
 
-static int
+int
 nouveau_gpuobj_sw_new(struct nouveau_channel *chan, int class,
 		      struct nouveau_gpuobj **gpuobj_ret)
 {
diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index 09a3107..d2d7f08 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -184,6 +184,7 @@ nv04_fbcon_accel_init(struct fb_info *info)
 	struct drm_device *dev = par->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *chan = dev_priv->channel;
+	const int sub = NvSubCtxSurf2D;
 	int surface_fmt, pattern_fmt, rect_fmt;
 	int ret;
 
@@ -247,25 +248,25 @@ nv04_fbcon_accel_init(struct fb_info *info)
 		return 0;
 	}
 
-	BEGIN_RING(chan, 1, 0x0000, 1);
+	BEGIN_RING(chan, sub, 0x0000, 1);
 	OUT_RING(chan, NvCtxSurf2D);
-	BEGIN_RING(chan, 1, 0x0184, 2);
+	BEGIN_RING(chan, sub, 0x0184, 2);
 	OUT_RING(chan, NvDmaFB);
 	OUT_RING(chan, NvDmaFB);
-	BEGIN_RING(chan, 1, 0x0300, 4);
+	BEGIN_RING(chan, sub, 0x0300, 4);
 	OUT_RING(chan, surface_fmt);
 	OUT_RING(chan, info->fix.line_length | (info->fix.line_length << 16));
 	OUT_RING(chan, info->fix.smem_start - dev->mode_config.fb_base);
 	OUT_RING(chan, info->fix.smem_start - dev->mode_config.fb_base);
 
-	BEGIN_RING(chan, 1, 0x0000, 1);
+	BEGIN_RING(chan, sub, 0x0000, 1);
 	OUT_RING(chan, NvRop);
-	BEGIN_RING(chan, 1, 0x0300, 1);
+	BEGIN_RING(chan, sub, 0x0300, 1);
 	OUT_RING(chan, 0x55);
 
-	BEGIN_RING(chan, 1, 0x0000, 1);
+	BEGIN_RING(chan, sub, 0x0000, 1);
 	OUT_RING(chan, NvImagePatt);
-	BEGIN_RING(chan, 1, 0x0300, 8);
+	BEGIN_RING(chan, sub, 0x0300, 8);
 	OUT_RING(chan, pattern_fmt);
 #ifdef __BIG_ENDIAN
 	OUT_RING(chan, 2);
@@ -279,9 +280,9 @@ nv04_fbcon_accel_init(struct fb_info *info)
 	OUT_RING(chan, ~0);
 	OUT_RING(chan, ~0);
 
-	BEGIN_RING(chan, 1, 0x0000, 1);
+	BEGIN_RING(chan, sub, 0x0000, 1);
 	OUT_RING(chan, NvClipRect);
-	BEGIN_RING(chan, 1, 0x0300, 2);
+	BEGIN_RING(chan, sub, 0x0300, 2);
 	OUT_RING(chan, 0);
 	OUT_RING(chan, (info->var.yres_virtual << 16) | info->var.xres_virtual);
 
-- 
1.6.4.4
