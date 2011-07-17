From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: restore subchannel<->object binding
	on resume
Date: Sun, 17 Jul 2011 23:03:59 +0200
Message-ID: <20110717210359.GA4435@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On at least one nv43 after resume gdi subchannel on kernel channel
is bound to M2MF object. It seems last used (before suspend) channel
needs manual restore of subchannel binding.
Addresses: https://bugzilla.kernel.org/show_bug.cgi?id=39422

Reported-by: Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>
Tested-by: Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c   |    3 +--
 drivers/gpu/drm/nouveau/nouveau_dma.h   |   20 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.c   |    8 ++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    3 +++
 drivers/gpu/drm/nouveau/nouveau_fence.c |    3 +--
 drivers/gpu/drm/nouveau/nv04_fbcon.c    |   18 ++++++------------
 drivers/gpu/drm/nouveau/nv50_fbcon.c    |    3 +--
 drivers/gpu/drm/nouveau/nvc0_fbcon.c    |    3 +--
 8 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 568caed..2711abd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -70,8 +70,7 @@ nouveau_dma_init(struct nouveau_channel *chan)
 		if (ret)
 			return ret;
 
-		BEGIN_NVC0(chan, 2, NvSubM2MF, 0x0000, 1);
-		OUT_RING  (chan, 0x00009039);
+		BIND_RING_C0(chan, NvSubM2MF, 0x00009039);
 		FIRE_RING (chan);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 23d4edf..2ce4619 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -138,6 +138,26 @@ BEGIN_RING(struct nouveau_channel *chan, int subc, int mthd, int size)
 	OUT_RING(chan, (subc << 13) | (size << 18) | mthd);
 }
 
+static inline void
+BIND_RING(struct nouveau_channel *chan, int subc, int handle)
+{
+	BUG_ON(subc < 0 || subc > 7);
+	chan->subchannels[subc] = handle;
+
+	BEGIN_RING(chan, subc, 0x0000, 1);
+	OUT_RING  (chan, handle);
+}
+
+static inline void
+BIND_RING_C0(struct nouveau_channel *chan, int subc, int handle)
+{
+	BUG_ON(subc < 0 || subc > 7);
+	chan->subchannels[subc] = handle;
+
+	BEGIN_NVC0(chan, 2, subc, 0x0000, 1);
+	OUT_RING  (chan, handle);
+}
+
 #define WRITE_PUT(val) do {                                                    \
 	DRM_MEMORYBARRIER();                                                   \
 	nouveau_bo_rd32(chan->pushbuf_bo, 0);                                  \
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 02c6f37..69afd95 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -262,6 +262,7 @@ nouveau_pci_resume(struct pci_dev *pdev)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_engine *engine = &dev_priv->engine;
 	struct drm_crtc *crtc;
+	struct nouveau_channel *chan = dev_priv->channel;
 	int ret, i;
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
@@ -301,6 +302,13 @@ nouveau_pci_resume(struct pci_dev *pdev)
 	NV_INFO(dev, "Restoring GPU objects...\n");
 	nouveau_gpuobj_resume(dev);
 
+	for (i = 0; i < 8; ++i)
+		if (chan->subchannels[i])
+			if (dev_priv->card_type >= NV_C0)
+				BIND_RING_C0(chan, i, chan->subchannels[i]);
+			else
+				BIND_RING(chan, i, chan->subchannels[i]);
+
 	NV_INFO(dev, "Reinitialising engines...\n");
 	engine->instmem.resume(dev);
 	engine->mc.init(dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9c56331..bc1adf8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -287,6 +287,9 @@ struct nouveau_channel {
 		struct list_head flip;
 	} nvsw;
 
+	/* subchannel->object binding, valid only for kernel channel */
+	int subchannels[8];
+
 	struct {
 		bool active;
 		char name[32];
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7347075..22998a7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -520,8 +520,7 @@ nouveau_fence_channel_init(struct nouveau_channel *chan)
 		if (ret)
 			return ret;
 
-		BEGIN_RING(chan, NvSubSw, 0, 1);
-		OUT_RING  (chan, NvSw);
+		BIND_RING(chan, NvSubSw, NvSw);
 		FIRE_RING (chan);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index 7a11893..9ab4fbe 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -209,8 +209,7 @@ nv04_fbcon_accel_init(struct fb_info *info)
 		return 0;
 	}
 
-	BEGIN_RING(chan, sub, 0x0000, 1);
-	OUT_RING(chan, NvCtxSurf2D);
+	BIND_RING(chan, sub, NvCtxSurf2D);
 	BEGIN_RING(chan, sub, 0x0184, 2);
 	OUT_RING(chan, NvDmaFB);
 	OUT_RING(chan, NvDmaFB);
@@ -220,13 +219,11 @@ nv04_fbcon_accel_init(struct fb_info *info)
 	OUT_RING(chan, info->fix.smem_start - dev->mode_config.fb_base);
 	OUT_RING(chan, info->fix.smem_start - dev->mode_config.fb_base);
 
-	BEGIN_RING(chan, sub, 0x0000, 1);
-	OUT_RING(chan, NvRop);
+	BIND_RING(chan, sub, NvRop);
 	BEGIN_RING(chan, sub, 0x0300, 1);
 	OUT_RING(chan, 0x55);
 
-	BEGIN_RING(chan, sub, 0x0000, 1);
-	OUT_RING(chan, NvImagePatt);
+	BIND_RING(chan, sub, NvImagePatt);
 	BEGIN_RING(chan, sub, 0x0300, 8);
 	OUT_RING(chan, pattern_fmt);
 #ifdef __BIG_ENDIAN
@@ -241,21 +238,18 @@ nv04_fbcon_accel_init(struct fb_info *info)
 	OUT_RING(chan, ~0);
 	OUT_RING(chan, ~0);
 
-	BEGIN_RING(chan, sub, 0x0000, 1);
-	OUT_RING(chan, NvClipRect);
+	BIND_RING(chan, sub, NvClipRect);
 	BEGIN_RING(chan, sub, 0x0300, 2);
 	OUT_RING(chan, 0);
 	OUT_RING(chan, (info->var.yres_virtual << 16) | info->var.xres_virtual);
 
-	BEGIN_RING(chan, NvSubImageBlit, 0x0000, 1);
-	OUT_RING(chan, NvImageBlit);
+	BIND_RING(chan, NvSubImageBlit, NvImageBlit);
 	BEGIN_RING(chan, NvSubImageBlit, 0x019c, 1);
 	OUT_RING(chan, NvCtxSurf2D);
 	BEGIN_RING(chan, NvSubImageBlit, 0x02fc, 1);
 	OUT_RING(chan, 3);
 
-	BEGIN_RING(chan, NvSubGdiRect, 0x0000, 1);
-	OUT_RING(chan, NvGdiRect);
+	BIND_RING(chan, NvSubGdiRect, NvGdiRect);
 	BEGIN_RING(chan, NvSubGdiRect, 0x0198, 1);
 	OUT_RING(chan, NvCtxSurf2D);
 	BEGIN_RING(chan, NvSubGdiRect, 0x0188, 2);
diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
index 791ded1..b819703 100644
--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -199,8 +199,7 @@ nv50_fbcon_accel_init(struct fb_info *info)
 		return ret;
 	}
 
-	BEGIN_RING(chan, NvSub2D, 0x0000, 1);
-	OUT_RING(chan, Nv2D);
+	BIND_RING(chan, NvSub2D, Nv2D);
 	BEGIN_RING(chan, NvSub2D, 0x0180, 4);
 	OUT_RING(chan, NvNotify0);
 	OUT_RING(chan, chan->vram_handle);
diff --git a/drivers/gpu/drm/nouveau/nvc0_fbcon.c b/drivers/gpu/drm/nouveau/nvc0_fbcon.c
index fa5d4c2..7d1f3c4 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fbcon.c
@@ -200,8 +200,7 @@ nvc0_fbcon_accel_init(struct fb_info *info)
 		return ret;
 	}
 
-	BEGIN_NVC0(chan, 2, NvSub2D, 0x0000, 1);
-	OUT_RING  (chan, 0x0000902d);
+	BIND_RING_C0(chan, NvSub2D, 0x0000902d);
 	BEGIN_NVC0(chan, 2, NvSub2D, 0x0104, 2);
 	OUT_RING  (chan, upper_32_bits(chan->notifier_bo->bo.offset));
 	OUT_RING  (chan, lower_32_bits(chan->notifier_bo->bo.offset));
-- 
1.7.5.3
