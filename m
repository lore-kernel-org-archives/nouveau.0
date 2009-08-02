From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 3/4] drm/nouveau: remove unused arg from
	nouveau_bo_new()
Date: Sun,  2 Aug 2009 18:12:51 +0300
Message-ID: <1249225972-4655-3-git-send-email-pq@iki.fi>
References: <1249225972-4655-1-git-send-email-pq@iki.fi>
	<1249225972-4655-2-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249225972-4655-2-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

nouveau_bo_new() took struct nouveau_channel *chan as a parameter, yet
it was not used (it was set and then reset to NULL). Remove the unused
parameter (which was almost always NULL anyway).

No need to set nvbo->channel = NULL since kzalloc already zeros it.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   |    4 +---
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fifo.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c  |    2 +-
 drivers/gpu/drm/nouveau/nv04_crtc.c    |    2 +-
 drivers/gpu/drm/nouveau/nv50_crtc.c    |    2 +-
 drivers/gpu/drm/nouveau/nv50_display.c |    2 +-
 drivers/gpu/drm/nouveau/nv50_instmem.c |    2 +-
 8 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index de4ca71..052ec56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -52,7 +52,7 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 }
 
 int
-nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
+nouveau_bo_new(struct drm_device *dev,
 	       int size, int align, uint32_t flags, uint32_t tile_mode,
 	       uint32_t tile_flags, bool no_vm, bool mappable,
 	       struct nouveau_bo **pnvbo)
@@ -81,11 +81,9 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 			align = (65536 / PAGE_SIZE);
 	}
 
-	nvbo->channel = chan;
 	ret = ttm_buffer_object_init(&dev_priv->ttm.bdev, &nvbo->bo, size,
 				     ttm_bo_type_device, flags, align,
 				     0, false, NULL, size, nouveau_bo_del_ttm);
-	nvbo->channel = NULL;
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index c6143b8..01c615a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -918,7 +918,7 @@ extern struct nouveau_connector *nouveau_encoder_connector_get(
 
 /* nouveau_bo.c */
 extern struct ttm_bo_driver nouveau_bo_driver;
-extern int nouveau_bo_new(struct drm_device *, struct nouveau_channel *,
+extern int nouveau_bo_new(struct drm_device *,
 			  int size, int align, uint32_t flags,
 			  uint32_t tile_mode, uint32_t tile_flags,
 			  bool no_vm, bool mappable, struct nouveau_bo **);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fifo.c b/drivers/gpu/drm/nouveau/nouveau_fifo.c
index 58cef14..9d96ce6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fifo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fifo.c
@@ -256,7 +256,7 @@ nouveau_fifo_user_pushbuf_alloc(struct drm_device *dev)
 	if (!config->cmdbuf.size || config->cmdbuf.size < pb_min_size)
 		config->cmdbuf.size = 65536;
 
-	ret = nouveau_bo_new(dev, NULL, config->cmdbuf.size, 0,
+	ret = nouveau_bo_new(dev, config->cmdbuf.size, 0,
 			     config->cmdbuf.location, 0, 0x0000,
 			     false, true, &pushbuf);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 670348b..a54fce4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -68,7 +68,7 @@ nouveau_gem_new(struct drm_device *dev, struct nouveau_channel *chan,
 	struct nouveau_bo *nvbo;
 	int ret;
 
-	ret = nouveau_bo_new(dev, chan, size, align, flags, tile_mode,
+	ret = nouveau_bo_new(dev, size, align, flags, tile_mode,
 			     tile_flags, no_vm, mappable, pnvbo);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index c732fbe..860cf0d 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -1118,7 +1118,7 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
 
-	ret = nouveau_bo_new(dev, NULL, 64*64*4, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 64 * 64 * 4, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, false, true, &nv_crtc->cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 81c53c4..32d423d 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -777,7 +777,7 @@ nv50_crtc_create(struct drm_device *dev, int index)
 	}
 	crtc->lut.depth = 0;
 
-	ret = nouveau_bo_new(dev, NULL, 4096, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 4096, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, false, true, &crtc->lut.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(crtc->lut.nvbo, TTM_PL_FLAG_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 2ab1685..9b22a3d 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -149,7 +149,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct nouveau_channel **pchan)
 		return ret;
 	}
 
-	ret = nouveau_bo_new(dev, NULL, 4096, 0, TTM_PL_FLAG_VRAM, 0, 0,
+	ret = nouveau_bo_new(dev, 4096, 0, TTM_PL_FLAG_VRAM, 0, 0,
 			     false, true, &chan->pushbuf_bo);
 	if (ret == 0)
 		ret = nouveau_bo_pin(chan->pushbuf_bo, TTM_PL_FLAG_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nouveau/nv50_instmem.c
index 062d085..f2401b9 100644
--- a/drivers/gpu/drm/nouveau/nv50_instmem.c
+++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
@@ -368,7 +368,7 @@ nv50_instmem_populate(struct drm_device *dev, struct nouveau_gpuobj *gpuobj,
 	if (*sz == 0)
 		return -EINVAL;
 
-	ret = nouveau_bo_new(dev, NULL, *sz, 0, TTM_PL_FLAG_VRAM, 0, 0x0000,
+	ret = nouveau_bo_new(dev, *sz, 0, TTM_PL_FLAG_VRAM, 0, 0x0000,
 			     true, false, &gpuobj->im_backing);
 	if (ret) {
 		NV_ERROR(dev, "error getting PRAMIN backing pages: %d\n", ret);
-- 
1.6.3.3
