From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Add a MM for mappable VRAM that
	isn't usable as scanout.
Date: Wed, 19 Aug 2009 19:03:47 +0200
Message-ID: <1250701427-5686-1-git-send-email-currojerez@riseup.net>
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

Dynamically resizing the framebuffer on nv04 was like playing Russian
roulette (and it often happened gratuitously) because it seems unable
to scan out from buffers above 16MB. This patch splits the mappable
VRAM into two chunks when that's the case, and makes the higher one to
be used as well when applicable.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |   24 ++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_drv.c |    2 ++
 drivers/gpu/drm/nouveau/nouveau_gem.c |   15 ++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_mem.c |   26 +++++++++++++++++++++++++-
 4 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index eba257a..06c2d13 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -68,8 +68,11 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 	nvbo->tile_mode = tile_mode;
 	nvbo->tile_flags = tile_flags;
 
-	if (!nvbo->mappable && (flags & TTM_PL_FLAG_VRAM))
-		flags |= TTM_PL_FLAG_PRIV0;
+	if (flags & TTM_PL_FLAG_VRAM) {
+		flags |= TTM_PL_FLAG_PRIV1;
+		if (!nvbo->mappable)
+			flags |= TTM_PL_FLAG_PRIV0;
+	}
 
 	/* Some of the tile_flags have a periodic structure of 24*4096 bytes, 
 	 * align to to that as well as the page size. Overallocate memory to 
@@ -271,6 +274,21 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		man->available_caching =
 		man->default_caching = 0;
 		break;
+	case TTM_PL_PRIV1: /* Mappable but unusable as scanout. */
+	{
+		man->flags = TTM_MEMTYPE_FLAG_FIXED |
+			     TTM_MEMTYPE_FLAG_MAPPABLE |
+			     TTM_MEMTYPE_FLAG_NEEDS_IOREMAP;
+		man->available_caching = TTM_PL_FLAG_UNCACHED |
+					 TTM_PL_FLAG_WC;
+		man->default_caching = TTM_PL_FLAG_WC;
+
+		man->io_addr = NULL;
+		man->io_offset = drm_get_resource_start(dev, 1);
+		man->io_size = drm_get_resource_len(dev, 1);
+		man->gpu_offset = dev_priv->vm_vram_base;
+		break;
+	}
 	case TTM_PL_TT:
 		switch (dev_priv->gart_info.type) {
 		case NOUVEAU_GART_AGP:
@@ -564,6 +582,7 @@ nouveau_bo_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 
 static uint32_t nouveau_mem_prios[]  = {
 	TTM_PL_PRIV0,
+	TTM_PL_PRIV1,
 	TTM_PL_VRAM,
 	TTM_PL_TT,
 	TTM_PL_SYSTEM
@@ -571,6 +590,7 @@ static uint32_t nouveau_mem_prios[]  = {
 static uint32_t nouveau_busy_prios[] = {
 	TTM_PL_TT,
 	TTM_PL_PRIV0,
+	TTM_PL_PRIV1,
 	TTM_PL_VRAM,
 	TTM_PL_SYSTEM
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 65d884e..7d2a032 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -114,6 +114,8 @@ nouveau_pci_suspend(struct pci_dev *pdev, pm_message_t pm_state)
 
 	NV_INFO(dev, "Evicting buffers...\n");
 	ttm_bo_evict_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM);
+	if (dev_priv->ttm.bdev.man[TTM_PL_PRIV1].has_type)
+		ttm_bo_evict_mm(&dev_priv->ttm.bdev, TTM_PL_PRIV1);
 
 	NV_INFO(dev, "Idling channels...\n");
 	for (i = 0; i < engine->fifo.channels; i++) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 1c06801..f3baadf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -206,7 +206,8 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
 		if ((valid_domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
 		    (read_domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
 		    (bo->mem.mem_type == TTM_PL_VRAM ||
-		     bo->mem.mem_type == TTM_PL_PRIV0))
+		     bo->mem.mem_type == TTM_PL_PRIV0 ||
+		     bo->mem.mem_type == TTM_PL_PRIV1))
 			flags = TTM_PL_FLAG_VRAM;
 		else
 		if ((valid_domains & NOUVEAU_GEM_DOMAIN_GART) &&
@@ -221,8 +222,11 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
 			flags = TTM_PL_FLAG_TT;
 	}
 
-	if ((flags & TTM_PL_FLAG_VRAM) && !nvbo->mappable)
-		flags |= TTM_PL_FLAG_PRIV0;
+	if (flags & TTM_PL_FLAG_VRAM) {
+		flags |= TTM_PL_FLAG_PRIV1;
+		if (!nvbo->mappable)
+			flags |= TTM_PL_FLAG_PRIV0;
+	}
 
 	bo->proposed_placement &= ~TTM_PL_MASK_MEM;
 	bo->proposed_placement |= flags;
@@ -352,7 +356,8 @@ retry:
 
 		if (nvbo->bo.offset == b->presumed_offset &&
 		    (((nvbo->bo.mem.mem_type == TTM_PL_VRAM ||
-		       nvbo->bo.mem.mem_type == TTM_PL_PRIV0) &&
+		       nvbo->bo.mem.mem_type == TTM_PL_PRIV0 ||
+		       nvbo->bo.mem.mem_type == TTM_PL_PRIV1) &&
 		      b->presumed_domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
 		     (nvbo->bo.mem.mem_type == TTM_PL_TT &&
 		      b->presumed_domain & NOUVEAU_GEM_DOMAIN_GART))) {
@@ -761,7 +766,7 @@ domain_to_ttm(struct nouveau_bo *nvbo, uint32_t domain)
 	uint32_t flags = 0;
 
 	if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
-		flags |= TTM_PL_FLAG_VRAM;
+		flags |= TTM_PL_FLAG_VRAM | TTM_PL_FLAG_PRIV1;
 		if (!nvbo->mappable)
 			flags |= TTM_PL_FLAG_PRIV0;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 01160fe..61336a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -299,6 +299,8 @@ void nouveau_mem_close(struct drm_device *dev)
 
 	if (dev_priv->ttm.bdev.man[TTM_PL_PRIV0].has_type)
 		ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_PRIV0);
+	if (dev_priv->ttm.bdev.man[TTM_PL_PRIV1].has_type)
+		ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_PRIV1);
 	ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM);
 
 	ttm_bo_device_release(&dev_priv->ttm.bdev);
@@ -410,6 +412,17 @@ uint64_t nouveau_mem_fb_amount(struct drm_device *dev)
 	return 0;
 }
 
+static uint64_t nouveau_mem_scanout_limit(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv=dev->dev_private;
+	uint64_t vram_size = dev_priv->fb_available_size;
+
+	if (dev_priv->card_type == NV_04)
+		return min(16ull*1024*1024, vram_size);
+
+	return vram_size;
+}
+
 static void nouveau_mem_reset_agp(struct drm_device *dev)
 {
 	uint32_t saved_pci_nv_1, saved_pci_nv_19, pmc_enable;
@@ -482,7 +495,7 @@ nouveau_mem_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct ttm_bo_device *bdev = &dev_priv->ttm.bdev;
-	uint32_t vram_size, bar1_size, text_size;
+	uint32_t vram_size, bar1_size, text_size, scanout_size;
 	int ret, dma_bits = 32;
 
 	dev_priv->fb_phys = drm_get_resource_start(dev, 1);
@@ -517,6 +530,7 @@ nouveau_mem_init(struct drm_device *dev)
 	/* non-mappable vram */
 	dev_priv->fb_available_size = nouveau_mem_fb_amount(dev);
 	dev_priv->fb_available_size -= dev_priv->ramin_rsvd_vram;
+	scanout_size = nouveau_mem_scanout_limit(dev) >> PAGE_SHIFT;
 	vram_size = dev_priv->fb_available_size >> PAGE_SHIFT;
 	bar1_size = drm_get_resource_len(dev, 1) >> PAGE_SHIFT;
 	text_size = (256 * 1024) >> PAGE_SHIFT;
@@ -530,6 +544,16 @@ nouveau_mem_init(struct drm_device *dev)
 		vram_size = bar1_size;
 	}
 
+	/* mappable vram that's unusable as scanout. */
+	if (scanout_size < vram_size) {
+		if ((ret = ttm_bo_init_mm(bdev, TTM_PL_PRIV1, scanout_size,
+					  vram_size - scanout_size))) {
+			NV_ERROR(dev, "Failed PRIV1 mm init: %d\n", ret);
+			return ret;
+		}
+		vram_size = scanout_size;
+	}
+
 	/* mappable vram */
 	if ((ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM, text_size,
 				  vram_size - text_size))) {
-- 
1.6.3.3
