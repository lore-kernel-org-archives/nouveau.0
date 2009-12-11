From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau: Make the MM aware of pre-G80
	tiling.
Date: Fri, 11 Dec 2009 19:33:23 +0100
Message-ID: <1260556404-13389-2-git-send-email-currojerez@riseup.net>
References: <1260556404-13389-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260556404-13389-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |  221 +++++++++++++++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_drv.h |   22 ++++
 drivers/gpu/drm/nouveau/nouveau_mem.c |   80 ++++++++++++
 3 files changed, 258 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 320a14b..4616bae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -37,6 +37,7 @@ static void
 nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 {
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
+	struct drm_device *dev = dev_priv->dev;
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 
 	ttm_bo_kunmap(&nvbo->kmap);
@@ -44,12 +45,83 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	if (unlikely(nvbo->gem))
 		DRM_ERROR("bo %p still attached to GEM object\n", bo);
 
+	if (nvbo->tile)
+		nv10_mem_expire_tiling(dev, nvbo->tile, NULL);
+
 	spin_lock(&dev_priv->ttm.bo_list_lock);
 	list_del(&nvbo->head);
 	spin_unlock(&dev_priv->ttm.bo_list_lock);
 	kfree(nvbo);
 }
 
+static void
+nouveau_bo_fixup_align(struct drm_device *dev,
+		       uint32_t tile_mode, uint32_t tile_flags,
+		       int *align, int *size)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	/*
+	 * Some of the tile_flags have a periodic structure of N*4096 bytes,
+	 * align to to that as well as the page size. Overallocate memory to
+	 * avoid corruption of other buffer objects.
+	 */
+	if (dev_priv->card_type == NV_50) {
+		switch (tile_flags) {
+		case 0x1800:
+		case 0x2800:
+		case 0x4800:
+		case 0x7a00:
+			if (dev_priv->chipset >= 0xA0) {
+				/* This is based on high end cards with 448 bits
+				 * memory bus, could be different elsewhere.*/
+				*size += 6 * 28672;
+				/* 8 * 28672 is the actual alignment requirement
+				 * but we must also align to page size. */
+				*align = 2 * 8 * 28672;
+			} else if (dev_priv->chipset >= 0x90) {
+				*size += 3 * 16384;
+				*align = 12 * 16834;
+			} else {
+				*size += 3 * 8192;
+				/* 12 * 8192 is the actual alignment requirement
+				 * but we must also align to page size. */
+				*align = 2 * 12 * 8192;
+			}
+			break;
+		default:
+			break;
+		}
+
+	} else {
+		if (tile_mode) {
+			if (dev_priv->chipset >= 0x40) {
+				*align = 65536;
+				*size = roundup(*size, 64 * tile_mode);
+
+			} else if (dev_priv->chipset >= 0x30) {
+				*align = 32768;
+				*size = roundup(*size, 32 * tile_mode);
+
+			} else if (dev_priv->chipset >= 0x20) {
+				*align = 16384;
+				*size = roundup(*size, 32 * tile_mode);
+
+			} else if (dev_priv->chipset >= 0x10) {
+				*align = 4096;
+				*size = roundup(*size, 16 * tile_mode);
+			}
+		}
+	}
+
+	*size = ALIGN(*size, PAGE_SIZE);
+
+	if (dev_priv->card_type == NV_50) {
+		*size = ALIGN(*size, 65536);
+		*align = max(65536, *align);
+	}
+}
+
 int
 nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 	       int size, int align, uint32_t flags, uint32_t tile_mode,
@@ -70,46 +142,9 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 	nvbo->tile_mode = tile_mode;
 	nvbo->tile_flags = tile_flags;
 
-	/*
-	 * Some of the tile_flags have a periodic structure of N*4096 bytes,
-	 * align to to that as well as the page size. Overallocate memory to
-	 * avoid corruption of other buffer objects.
-	 */
-	switch (tile_flags) {
-	case 0x1800:
-	case 0x2800:
-	case 0x4800:
-	case 0x7a00:
-		if (dev_priv->chipset >= 0xA0) {
-			/* This is based on high end cards with 448 bits
-			 * memory bus, could be different elsewhere.*/
-			size += 6 * 28672;
-			/* 8 * 28672 is the actual alignment requirement,
-			 * but we must also align to page size. */
-			align = 2 * 8 * 28672;
-		} else if (dev_priv->chipset >= 0x90) {
-			size += 3 * 16384;
-			align = 12 * 16834;
-		} else {
-			size += 3 * 8192;
-			/* 12 * 8192 is the actual alignment requirement,
-			 * but we must also align to page size. */
-			align = 2 * 12 * 8192;
-		}
-		break;
-	default:
-		break;
-	}
-
+	nouveau_bo_fixup_align(dev, tile_mode, tile_flags, &align, &size);
 	align >>= PAGE_SHIFT;
 
-	size = (size + (PAGE_SIZE - 1)) & ~(PAGE_SIZE - 1);
-	if (dev_priv->card_type == NV_50) {
-		size = (size + 65535) & ~65535;
-		if (align < (65536 / PAGE_SIZE))
-			align = (65536 / PAGE_SIZE);
-	}
-
 	if (flags & TTM_PL_FLAG_VRAM)
 		nvbo->placements[n++] = TTM_PL_FLAG_VRAM | TTM_PL_MASK_CACHING;
 	if (flags & TTM_PL_FLAG_TT)
@@ -408,6 +443,7 @@ nouveau_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
 /* GPU-assisted copy using NV_MEMORY_TO_MEMORY_FORMAT, can access
  * TTM_PL_{VRAM,TT} directly.
  */
+
 static int
 nouveau_bo_move_accel_cleanup(struct nouveau_channel *chan,
 			      struct nouveau_bo *nvbo, bool evict, bool no_wait,
@@ -442,11 +478,12 @@ nouveau_bo_mem_ctxdma(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 }
 
 static int
-nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, int no_wait,
-		     struct ttm_mem_reg *old_mem, struct ttm_mem_reg *new_mem)
+nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
+		     int no_wait, struct ttm_mem_reg *new_mem)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
+	struct ttm_mem_reg *old_mem = &bo->mem;
 	struct nouveau_channel *chan;
 	uint64_t src_offset, dst_offset;
 	uint32_t page_count;
@@ -549,7 +586,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		goto out;
 
-	ret = nouveau_bo_move_m2mf(bo, true, no_wait, &bo->mem, &tmp_mem);
+	ret = nouveau_bo_move_m2mf(bo, true, intr, no_wait, &tmp_mem);
 	if (ret)
 		goto out;
 
@@ -587,7 +624,7 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		goto out;
 
-	ret = nouveau_bo_move_m2mf(bo, true, no_wait, &bo->mem, new_mem);
+	ret = nouveau_bo_move_m2mf(bo, true, intr, no_wait, new_mem);
 	if (ret)
 		goto out;
 
@@ -602,51 +639,105 @@ out:
 }
 
 static int
-nouveau_bo_move(struct ttm_buffer_object *bo, bool evict, bool intr,
-		bool no_wait, struct ttm_mem_reg *new_mem)
+nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem,
+		   struct nouveau_tile_reg **new_tile)
 {
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
-	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct drm_device *dev = dev_priv->dev;
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct nouveau_bo *nvbo = nouveau_bo(bo);
+	uint64_t offset;
 	int ret;
 
-	if (dev_priv->card_type == NV_50 && new_mem->mem_type == TTM_PL_VRAM &&
-	    !nvbo->no_vm) {
-		uint64_t offset = new_mem->mm_node->start << PAGE_SHIFT;
+	if (nvbo->no_vm || new_mem->mem_type != TTM_PL_VRAM) {
+		/* Nothing to do. */
+		*new_tile = NULL;
+		return 0;
+	}
+
+	offset = new_mem->mm_node->start << PAGE_SHIFT;
 
+	if (dev_priv->card_type == NV_50) {
 		ret = nv50_mem_vm_bind_linear(dev,
 					      offset + dev_priv->vm_vram_base,
 					      new_mem->size, nvbo->tile_flags,
 					      offset);
 		if (ret)
 			return ret;
+
+	} else if (dev_priv->card_type >= NV_10) {
+		*new_tile = nv10_mem_set_tiling(dev, offset, new_mem->size,
+						nvbo->tile_mode);
 	}
 
-	if (dev_priv->init_state != NOUVEAU_CARD_INIT_DONE)
-		return ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
+	return 0;
+}
 
+static void
+nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
+		      struct nouveau_tile_reg *new_tile,
+		      struct nouveau_tile_reg **old_tile)
+{
+	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
+	struct drm_device *dev = dev_priv->dev;
+
+	if (dev_priv->card_type >= NV_10 &&
+	    dev_priv->card_type < NV_50) {
+		if (*old_tile)
+			nv10_mem_expire_tiling(dev, *old_tile, bo->sync_obj);
+
+		*old_tile = new_tile;
+	}
+}
+
+static int
+nouveau_bo_move(struct ttm_buffer_object *bo, bool evict, bool intr,
+		bool no_wait, struct ttm_mem_reg *new_mem)
+{
+	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
+	struct nouveau_bo *nvbo = nouveau_bo(bo);
+	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct nouveau_tile_reg *new_tile = NULL;
+	int ret = 0;
+
+	ret = nouveau_bo_vm_bind(bo, new_mem, &new_tile);
+	if (ret)
+		return ret;
+
+	/* Software copy if the card isn't up and running yet. */
+	if (dev_priv->init_state != NOUVEAU_CARD_INIT_DONE) {
+		ret = ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
+		goto out;
+	}
+
+	/* Fake bo copy. */
 	if (old_mem->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
 		BUG_ON(bo->mem.mm_node != NULL);
 		bo->mem = *new_mem;
 		new_mem->mm_node = NULL;
-		return 0;
+		goto out;
 	}
 
-	if (new_mem->mem_type == TTM_PL_SYSTEM) {
-		if (old_mem->mem_type == TTM_PL_SYSTEM)
-			return ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
-		if (nouveau_bo_move_flipd(bo, evict, intr, no_wait, new_mem))
-			return ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
-	} else if (old_mem->mem_type == TTM_PL_SYSTEM) {
-		if (nouveau_bo_move_flips(bo, evict, intr, no_wait, new_mem))
-			return ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
-	} else {
-		if (nouveau_bo_move_m2mf(bo, evict, no_wait, old_mem, new_mem))
-			return ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
-	}
+	/* Hardware assisted copy. */
+	if (new_mem->mem_type == TTM_PL_SYSTEM)
+		ret = nouveau_bo_move_flipd(bo, evict, intr, no_wait, new_mem);
+	else if (old_mem->mem_type == TTM_PL_SYSTEM)
+		ret = nouveau_bo_move_flips(bo, evict, intr, no_wait, new_mem);
+	else
+		ret = nouveau_bo_move_m2mf(bo, evict, intr, no_wait, new_mem);
 
-	return 0;
+	if (!ret)
+		goto out;
+
+	/* Fallback to software copy. */
+	ret = ttm_bo_move_memcpy(bo, evict, no_wait, new_mem);
+
+out:
+	if (ret)
+		nouveau_bo_vm_cleanup(bo, NULL, &new_tile);
+	else
+		nouveau_bo_vm_cleanup(bo, new_tile, &nvbo->tile);
+
+	return ret;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2730497..7a2a322 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -58,11 +58,19 @@ struct nouveau_fpriv {
 #define MAX_NUM_DCB_ENTRIES 16
 
 #define NOUVEAU_MAX_CHANNEL_NR 128
+#define NOUVEAU_MAX_TILE_NR 15
 
 #define NV50_VM_MAX_VRAM (2*1024*1024*1024ULL)
 #define NV50_VM_BLOCK    (512*1024*1024ULL)
 #define NV50_VM_VRAM_NR  (NV50_VM_MAX_VRAM / NV50_VM_BLOCK)
 
+struct nouveau_tile_reg {
+	struct nouveau_fence *fence;
+	uint32_t addr;
+	uint32_t size;
+	bool used;
+};
+
 struct nouveau_bo {
 	struct ttm_buffer_object bo;
 	struct ttm_placement placement;
@@ -82,6 +90,7 @@ struct nouveau_bo {
 
 	uint32_t tile_mode;
 	uint32_t tile_flags;
+	struct nouveau_tile_reg *tile;
 
 	struct drm_gem_object *gem;
 	struct drm_file *cpu_filp;
@@ -554,6 +563,12 @@ struct drm_nouveau_private {
 		unsigned long sg_handle;
 	} gart_info;
 
+	/* nv10-nv40 tiling regions */
+	struct {
+		struct nouveau_tile_reg reg[NOUVEAU_MAX_TILE_NR];
+		spinlock_t lock;
+	} tile;
+
 	/* G8x/G9x virtual address space */
 	uint64_t vm_gart_base;
 	uint64_t vm_gart_size;
@@ -690,6 +705,13 @@ extern void nouveau_mem_release(struct drm_file *, struct mem_block *heap);
 extern int  nouveau_mem_init(struct drm_device *);
 extern int  nouveau_mem_init_agp(struct drm_device *);
 extern void nouveau_mem_close(struct drm_device *);
+extern struct nouveau_tile_reg *nv10_mem_set_tiling(struct drm_device *dev,
+						    uint32_t addr,
+						    uint32_t size,
+						    uint32_t pitch);
+extern void nv10_mem_expire_tiling(struct drm_device *dev,
+				   struct nouveau_tile_reg *tile,
+				   struct nouveau_fence *fence);
 extern int  nv50_mem_vm_bind_linear(struct drm_device *, uint64_t virt,
 				    uint32_t size, uint32_t flags,
 				    uint64_t phys);
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 0275571..6056f32 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -192,6 +192,85 @@ void nouveau_mem_release(struct drm_file *file_priv, struct mem_block *heap)
 }
 
 /*
+ * NV10-NV40 tiling helpers
+ */
+
+static void
+nv10_mem_set_tiling_locked(struct drm_device *dev, int i, uint32_t addr,
+			   uint32_t size, uint32_t pitch)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
+	struct nouveau_pgraph_engine *pgraph = &dev_priv->engine.graph;
+	struct nouveau_tile_reg *tile = &dev_priv->tile.reg[i];
+
+	tile->used = true;
+
+	spin_unlock(&dev_priv->tile.lock);
+
+	pgraph->set_region_tiling(dev, i, addr, size, pitch);
+	pfb->set_region_tiling(dev, i, addr, size, pitch);
+
+	spin_lock(&dev_priv->tile.lock);
+
+	tile->addr = addr;
+	tile->size = size;
+	tile->used = !!pitch;
+	nouveau_fence_unref((void **)&tile->fence);
+}
+
+struct nouveau_tile_reg *
+nv10_mem_set_tiling(struct drm_device *dev, uint32_t addr, uint32_t size,
+		    uint32_t pitch)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
+	struct nouveau_tile_reg *tile = dev_priv->tile.reg, *found = NULL;
+	int i;
+
+	spin_lock(&dev_priv->tile.lock);
+
+	for (i = 0; i < pfb->num_tiles; i++) {
+		if (tile[i].used)
+			/* Tile region in use. */
+			continue;
+
+		if (tile[i].fence &&
+		    !nouveau_fence_signalled(tile[i].fence, NULL))
+			/* Pending tile region. */
+			continue;
+
+		if (max(tile[i].addr, addr) <
+		    min(tile[i].addr + tile[i].size, addr + size))
+			/* Kill an intersecting tile region. */
+			nv10_mem_set_tiling_locked(dev, i, 0, 0, 0);
+
+		if (pitch && !found) {
+			/* Free tile region. */
+			nv10_mem_set_tiling_locked(dev, i, addr, size, pitch);
+			found = &tile[i];
+		}
+	}
+
+	spin_unlock(&dev_priv->tile.lock);
+
+	return found;
+}
+
+void
+nv10_mem_expire_tiling(struct drm_device *dev, struct nouveau_tile_reg *tile,
+		       struct nouveau_fence *fence)
+{
+	if (fence) {
+		/* Mark it as pending. */
+		tile->fence = fence;
+		nouveau_fence_ref(fence);
+	}
+
+	tile->used = false;
+}
+
+/*
  * NV50 VM helpers
  */
 int
@@ -509,6 +588,7 @@ nouveau_mem_init(struct drm_device *dev)
 
 	INIT_LIST_HEAD(&dev_priv->ttm.bo_list);
 	spin_lock_init(&dev_priv->ttm.bo_list_lock);
+	spin_lock_init(&dev_priv->tile.lock);
 
 	dev_priv->fb_available_size = nouveau_mem_fb_amount(dev);
 
-- 
1.6.4.4
