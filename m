From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] drm/nouveau: Add proper error handling to
	nouveau_card_init
Date: Mon, 14 Dec 2009 20:58:39 +0000
Message-ID: <1260824319-1376-1-git-send-email-koriakin@0x04.net>
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
 drivers/gpu/drm/nouveau/nouveau_state.c |   73 ++++++++++++++++++++-----------
 1 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 2ed41d3..9fc5824 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -317,7 +317,7 @@ nouveau_card_init(struct drm_device *dev)
 	/* Initialise internal driver API hooks */
 	ret = nouveau_init_engine_ptrs(dev);
 	if (ret)
-		return ret;
+		goto out;
 	engine = &dev_priv->engine;
 	dev_priv->init_state = NOUVEAU_CARD_INIT_FAILED;
 
@@ -325,12 +325,12 @@ nouveau_card_init(struct drm_device *dev)
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		ret = nouveau_bios_init(dev);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	ret = nouveau_gpuobj_early_init(dev);
 	if (ret)
-		return ret;
+		goto out_bios;
 
 	/* Initialise instance memory, must happen before mem_init so we
 	 * know exactly how much VRAM we're able to use for "normal"
@@ -338,52 +338,52 @@ nouveau_card_init(struct drm_device *dev)
 	 */
 	ret = engine->instmem.init(dev);
 	if (ret)
-		return ret;
+		goto out_gpuobj_early;
 
 	/* Setup the memory manager */
 	ret = nouveau_mem_init(dev);
 	if (ret)
-		return ret;
+		goto out_instmem;
 
 	ret = nouveau_gpuobj_init(dev);
 	if (ret)
-		return ret;
+		goto out_mem;
 
 	/* PMC */
 	ret = engine->mc.init(dev);
 	if (ret)
-		return ret;
+		goto out_gpuobj;
 
 	/* PTIMER */
 	ret = engine->timer.init(dev);
 	if (ret)
-		return ret;
+		goto out_mc;
 
 	/* PFB */
 	ret = engine->fb.init(dev);
 	if (ret)
-		return ret;
+		goto out_timer;
 
 	/* PGRAPH */
 	ret = engine->graph.init(dev);
 	if (ret)
-		return ret;
+		goto out_fb;
 
 	/* PFIFO */
 	ret = engine->fifo.init(dev);
 	if (ret)
-		return ret;
+		goto out_graph;
 
 	/* this call irq_preinstall, register irq handler and
 	 * call irq_postinstall
 	 */
 	ret = drm_irq_install(dev);
 	if (ret)
-		return ret;
+		goto out_fifo;
 
 	ret = drm_vblank_init(dev, 0);
 	if (ret)
-		return ret;
+		goto out_irq;
 
 	/* what about PVIDEO/PCRTC/PRAMDAC etc? */
 
@@ -391,7 +391,7 @@ nouveau_card_init(struct drm_device *dev)
 				    (struct drm_file *)-2,
 				    NvDmaFB, NvDmaTT);
 	if (ret)
-		return ret;
+		goto out_irq;
 
 	gpuobj = NULL;
 	ret = nouveau_gpuobj_dma_new(dev_priv->channel, NV_CLASS_DMA_IN_MEMORY,
@@ -399,13 +399,13 @@ nouveau_card_init(struct drm_device *dev)
 				     NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
 				     &gpuobj);
 	if (ret)
-		return ret;
+		goto out_irq;
 
 	ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaVRAM,
 				     gpuobj, NULL);
 	if (ret) {
 		nouveau_gpuobj_del(dev, &gpuobj);
-		return ret;
+		goto out_irq;
 	}
 
 	gpuobj = NULL;
@@ -413,25 +413,22 @@ nouveau_card_init(struct drm_device *dev)
 					  dev_priv->gart_info.aper_size,
 					  NV_DMA_ACCESS_RW, &gpuobj, NULL);
 	if (ret)
-		return ret;
+		goto out_irq;
 
 	ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaGART,
 				     gpuobj, NULL);
 	if (ret) {
 		nouveau_gpuobj_del(dev, &gpuobj);
-		return ret;
+		goto out_irq;
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
-		}
+		if (ret)
+			goto out_irq;
 	}
 
 	ret = nouveau_backlight_init(dev);
@@ -444,6 +441,32 @@ nouveau_card_init(struct drm_device *dev)
 		drm_helper_initial_config(dev);
 
 	return 0;
+
+out_irq:
+	drm_irq_uninstall(dev);
+out_fifo:
+	engine->fifo.takedown(dev);
+out_graph:
+	engine->graph.takedown(dev);
+out_fb:
+	engine->fb.takedown(dev);
+out_timer:
+	engine->timer.takedown(dev);
+out_mc:
+	engine->mc.takedown(dev);
+out_gpuobj:
+	nouveau_gpuobj_takedown(dev);
+out_mem:
+	nouveau_mem_close(dev);
+out_instmem:
+	engine->instmem.takedown(dev);
+out_gpuobj_early:
+	nouveau_gpuobj_late_takedown(dev);
+out_bios:
+	nouveau_bios_takedown(dev);
+out:
+	vga_client_register(dev->pdev, NULL, NULL, NULL);
+	return ret;
 }
 
 static void nouveau_card_takedown(struct drm_device *dev)
-- 
1.6.5.6
