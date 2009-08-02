From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 4/4] drm/nouveau: detect bad iomem usage in TTM
	maps
Date: Sun,  2 Aug 2009 18:12:52 +0300
Message-ID: <1249225972-4655-4-git-send-email-pq@iki.fi>
References: <1249225972-4655-1-git-send-email-pq@iki.fi>
	<1249225972-4655-2-git-send-email-pq@iki.fi>
	<1249225972-4655-3-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249225972-4655-3-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

kmap.virtual should not be used blindly, because it may be a kernel
virtual pointer or an iomem cookie. Iomem cookies may not be
dereferenced directly, they must be used via ioread32() etc. functions.
Unfortunately x86 doesn't care too much, except for caching issues
(barriers). Other arches may fail mysteriously.

Use the TTM API to get the virtual pointer from a map object, and check
if the map type is as expected. This is not the fix but simply shows in
how many places things are wrong.

TTM does not use __iomem attributes in the API and sparse yells its head
off. Seems that TTM would need another set of access wrappers that use
ttm_kmap_obj_virtual() and honour is_iomem.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c   |   11 +++++++++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    7 ++++++-
 drivers/gpu/drm/nouveau/nv04_crtc.c     |    9 +++++++--
 drivers/gpu/drm/nouveau/nv50_crtc.c     |    7 ++++++-
 drivers/gpu/drm/nouveau/nv50_display.c  |   11 +++++++++--
 5 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 7766af4..6d26c1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -36,6 +36,7 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_gpuobj *m2mf = NULL;
 	int ret, i;
+	bool is_iomem;
 
 	/* Create NV_MEMORY_TO_MEMORY_FORMAT for buffer moves */
 	ret = nouveau_gpuobj_gr_new(chan, dev_priv->card_type < NV_50 ?
@@ -56,14 +57,20 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	ret = nouveau_bo_map(chan->pushbuf_bo);
 	if (ret)
 		return ret;
-	chan->dma.pushbuf = chan->pushbuf_bo->kmap.virtual;
+	chan->dma.pushbuf = ttm_kmap_obj_virtual(&chan->pushbuf_bo->kmap,
+								&is_iomem);
+	if (is_iomem)
+		NV_WARN(dev, "WARNING: chan->dma.pushbuf is iomem.\n");
 
 	/* Map M2MF notifier object - fbcon. */
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		ret = nouveau_bo_map(chan->notifier_bo);
 		if (ret)
 			return ret;
-		chan->m2mf_ntfy_map  = chan->notifier_bo->kmap.virtual;
+		chan->m2mf_ntfy_map = ttm_kmap_obj_virtual(
+					&chan->notifier_bo->kmap, &is_iomem);
+		if (is_iomem)
+			NV_WARN(dev, "WARNING: chan->m2mf_ntfy is iomem.\n");
 		chan->m2mf_ntfy_map += chan->m2mf_ntfy;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 1511d6c..b7e6eb8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -505,6 +505,7 @@ static int nouveau_fbcon_create(struct drm_device *dev, uint32_t fb_width,
 	struct device *device = &dev->pdev->dev;
 	struct fb_fillrect rect;
 	int size, ret;
+	bool is_iomem;
 
 	mode_cmd.width = surface_width;
 	mode_cmd.height = surface_height;
@@ -573,7 +574,11 @@ static int nouveau_fbcon_create(struct drm_device *dev, uint32_t fb_width,
 	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_COPYAREA |
 		      FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_IMAGEBLIT;
 
-	info->screen_base = nouveau_fb->nvbo->kmap.virtual;
+	info->screen_base = ttm_kmap_obj_virtual(&nouveau_fb->nvbo->kmap,
+								&is_iomem);
+	if (!is_iomem)
+		NV_WARN(dev,
+			"WARNING: fbcon info->screen_base is not iomem.\n");
 	info->screen_size = size;
 
 	info->pseudo_palette = fb->pseudo_palette;
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 860cf0d..a038a5f 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -999,6 +999,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct drm_gem_object *gem;
 	uint32_t *src, *dst, pixel;
 	int ret = 0, alpha, i;
+	bool is_iomem;
 
 	if (width != 64 || height != 64)
 		return -EINVAL;
@@ -1016,8 +1017,12 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	ret = nouveau_bo_map(cursor);
 	if (ret)
 		goto out;
-	src = cursor->kmap.virtual;
-	dst = nv_crtc->cursor.nvbo->kmap.virtual;
+	src = ttm_kmap_obj_virtual(&cursor->kmap, &is_iomem);
+	if (is_iomem)
+		NV_WARN(dev, "WARNING: nv04 cursor src is iomem.\n");
+	dst = ttm_kmap_obj_virtual(&nv_crtc->cursor.nvbo->kmap, &is_iomem);
+	if (is_iomem)
+		NV_WARN(dev, "WARNING: nv04 cursor dst is iomem.\n");
 
 	/* nv11+ supports premultiplied (PM), or non-premultiplied (NPM) alpha
 	 * cursors (though NPM in combination with fp dithering may not work on
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 32d423d..66e802b 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -43,10 +43,15 @@ nv50_crtc_lut_load(struct nouveau_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
 	uint32_t index = 0, i;
-	void __iomem *lut = crtc->lut.nvbo->kmap.virtual;
+	bool is_iomem;
+	void __iomem *lut = ttm_kmap_obj_virtual(&crtc->lut.nvbo->kmap,
+								&is_iomem);
 
 	NV_DEBUG(dev, "\n");
 
+	if (!is_iomem)
+		NV_WARN(dev, "WARNING: nv50 lut is not iomem.\n");
+
 	/* 16 bits, red, green, blue, unused, total of 64 bits per index */
 	/* 10 bits lut, with 14 bits values. */
 	switch (crtc->lut.depth) {
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 9b22a3d..72fce83 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -187,6 +187,7 @@ nv50_display_init(struct drm_device *dev)
 	uint32_t val, ram_amount;
 	uint64_t start;
 	int i;
+	bool is_iomem;
 
 	NV_DEBUG(dev, "\n");
 
@@ -328,7 +329,10 @@ nv50_display_init(struct drm_device *dev)
 	evo->dma.put = 0;
 	evo->dma.cur = evo->dma.put;
 	evo->dma.free = evo->dma.max - evo->dma.cur;
-	evo->dma.pushbuf = evo->pushbuf_bo->kmap.virtual;
+	evo->dma.pushbuf = ttm_kmap_obj_virtual(&evo->pushbuf_bo->kmap,
+								&is_iomem);
+	if (is_iomem)
+		NV_WARN(dev, "WARNING: evo->dma.pushbuf is iomem.\n");
 
 	RING_SPACE(evo, NOUVEAU_DMA_SKIPS);
 	for (i = 0; i < NOUVEAU_DMA_SKIPS; i++)
@@ -638,11 +642,14 @@ nv50_display_vblank_crtc_handler(struct drm_device *dev, int crtc)
 	struct nouveau_channel *chan;
 	struct list_head *entry, *tmp;
 	uint32_t *sem;
+	bool is_iomem;
 
 	list_for_each_safe(entry, tmp, &dev_priv->vbl_waiting) {
 		chan = list_entry(entry, struct nouveau_channel, nvsw.vbl_wait);
 
-		sem = chan->notifier_bo->kmap.virtual;
+		sem = ttm_kmap_obj_virtual(&chan->notifier_bo->kmap, &is_iomem);
+		if (is_iomem)
+			NV_WARN(dev, "WARNING: nv50 sem is iomem.\n");
 		sem[chan->nvsw.vblsem_offset] = chan->nvsw.vblsem_rval;
 
 		list_del(&chan->nvsw.vbl_wait);
-- 
1.6.3.3
