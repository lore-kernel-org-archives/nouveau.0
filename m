From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Make use of TTM busy_placements.
Date: Thu, 18 Mar 2010 15:31:07 +0100
Message-ID: <1268922667-8290-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Previously we were filling it the same as "placements", but in some
cases there're valid alternatives that we were ignoring completely.
Keeping a back-up memory type helps on several low-mem situations.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |   61 ++++++++++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |    4 ++-
 drivers/gpu/drm/nouveau/nouveau_gem.c |   55 +++++++++++++----------------
 3 files changed, 61 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0266124..418d881 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -153,7 +153,7 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 
 	nvbo->placement.fpfn = 0;
 	nvbo->placement.lpfn = mappable ? dev_priv->fb_mappable_pages : 0;
-	nouveau_bo_placement_set(nvbo, flags);
+	nouveau_bo_placement_set(nvbo, flags, 0);
 
 	nvbo->channel = chan;
 	ret = ttm_bo_init(&dev_priv->ttm.bdev, &nvbo->bo, size,
@@ -172,26 +172,33 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 	return 0;
 }
 
+static void
+set_placement_list(uint32_t *pl, unsigned *n, uint32_t type, uint32_t flags)
+{
+	*n = 0;
+
+	if (type & TTM_PL_FLAG_VRAM)
+		pl[(*n)++] = TTM_PL_FLAG_VRAM | flags;
+	if (type & TTM_PL_FLAG_TT)
+		pl[(*n)++] = TTM_PL_FLAG_TT | flags;
+	if (type & TTM_PL_FLAG_SYSTEM)
+		pl[(*n)++] = TTM_PL_FLAG_SYSTEM | flags;
+}
+
 void
-nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t memtype)
+nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t type, uint32_t busy)
 {
-	int n = 0;
-
-	if (memtype & TTM_PL_FLAG_VRAM)
-		nvbo->placements[n++] = TTM_PL_FLAG_VRAM | TTM_PL_MASK_CACHING;
-	if (memtype & TTM_PL_FLAG_TT)
-		nvbo->placements[n++] = TTM_PL_FLAG_TT | TTM_PL_MASK_CACHING;
-	if (memtype & TTM_PL_FLAG_SYSTEM)
-		nvbo->placements[n++] = TTM_PL_FLAG_SYSTEM | TTM_PL_MASK_CACHING;
-	nvbo->placement.placement = nvbo->placements;
-	nvbo->placement.busy_placement = nvbo->placements;
-	nvbo->placement.num_placement = n;
-	nvbo->placement.num_busy_placement = n;
-
-	if (nvbo->pin_refcnt) {
-		while (n--)
-			nvbo->placements[n] |= TTM_PL_FLAG_NO_EVICT;
-	}
+	struct ttm_placement *pl = &nvbo->placement;
+	uint32_t flags = TTM_PL_MASK_CACHING |
+		(nvbo->pin_refcnt ? TTM_PL_FLAG_NO_EVICT : 0);
+
+	pl->placement = nvbo->placements;
+	set_placement_list(nvbo->placements, &pl->num_placement,
+			   type, flags);
+
+	pl->busy_placement = nvbo->busy_placements;
+	set_placement_list(nvbo->busy_placements, &pl->num_busy_placement,
+			   type | busy, flags);
 }
 
 int
@@ -199,7 +206,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t memtype)
 {
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_buffer_object *bo = &nvbo->bo;
-	int ret, i;
+	int ret;
 
 	if (nvbo->pin_refcnt && !(memtype & (1 << bo->mem.mem_type))) {
 		NV_ERROR(nouveau_bdev(bo->bdev)->dev,
@@ -215,9 +222,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t memtype)
 	if (ret)
 		goto out;
 
-	nouveau_bo_placement_set(nvbo, memtype);
-	for (i = 0; i < nvbo->placement.num_placement; i++)
-		nvbo->placements[i] |= TTM_PL_FLAG_NO_EVICT;
+	nouveau_bo_placement_set(nvbo, memtype, 0);
 
 	ret = ttm_bo_validate(bo, &nvbo->placement, false, false);
 	if (ret == 0) {
@@ -244,7 +249,7 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 {
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_buffer_object *bo = &nvbo->bo;
-	int ret, i;
+	int ret;
 
 	if (--nvbo->pin_refcnt)
 		return 0;
@@ -253,8 +258,7 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < nvbo->placement.num_placement; i++)
-		nvbo->placements[i] &= ~TTM_PL_FLAG_NO_EVICT;
+	nouveau_bo_placement_set(nvbo, bo->mem.placement, 0);
 
 	ret = ttm_bo_validate(bo, &nvbo->placement, false, false);
 	if (ret == 0) {
@@ -439,10 +443,11 @@ nouveau_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
 
 	switch (bo->mem.mem_type) {
 	case TTM_PL_VRAM:
-		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_TT);
+		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_TT,
+					 TTM_PL_FLAG_SYSTEM);
 		break;
 	default:
-		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_SYSTEM);
+		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_SYSTEM, 0);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3b6bbd0..46d8b3a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -76,6 +76,7 @@ struct nouveau_bo {
 	struct ttm_buffer_object bo;
 	struct ttm_placement placement;
 	u32 placements[3];
+	u32 busy_placements[3];
 	struct ttm_bo_kmap_obj kmap;
 	struct list_head head;
 
@@ -1128,7 +1129,8 @@ extern int nouveau_bo_pin(struct nouveau_bo *, uint32_t flags);
 extern int nouveau_bo_unpin(struct nouveau_bo *);
 extern int nouveau_bo_map(struct nouveau_bo *);
 extern void nouveau_bo_unmap(struct nouveau_bo *);
-extern void nouveau_bo_placement_set(struct nouveau_bo *, uint32_t memtype);
+extern void nouveau_bo_placement_set(struct nouveau_bo *, uint32_t type,
+				     uint32_t busy);
 extern u16 nouveau_bo_rd16(struct nouveau_bo *nvbo, unsigned index);
 extern void nouveau_bo_wr16(struct nouveau_bo *nvbo, unsigned index, u16 val);
 extern u32 nouveau_bo_rd32(struct nouveau_bo *nvbo, unsigned index);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 8265fed..0846a1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -182,40 +182,35 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
 {
 	struct nouveau_bo *nvbo = gem->driver_private;
 	struct ttm_buffer_object *bo = &nvbo->bo;
-	uint64_t flags;
+	uint32_t domains = valid_domains &
+		(write_domains ? write_domains : read_domains);
+	uint32_t pref_flags = 0, valid_flags = 0;
 
-	if (!valid_domains || (!read_domains && !write_domains))
+	if (!domains)
 		return -EINVAL;
 
-	if (write_domains) {
-		if ((valid_domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
-		    (write_domains & NOUVEAU_GEM_DOMAIN_VRAM))
-			flags = TTM_PL_FLAG_VRAM;
-		else
-		if ((valid_domains & NOUVEAU_GEM_DOMAIN_GART) &&
-		    (write_domains & NOUVEAU_GEM_DOMAIN_GART))
-			flags = TTM_PL_FLAG_TT;
-		else
-			return -EINVAL;
-	} else {
-		if ((valid_domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
-		    (read_domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
-		    bo->mem.mem_type == TTM_PL_VRAM)
-			flags = TTM_PL_FLAG_VRAM;
-		else
-		if ((valid_domains & NOUVEAU_GEM_DOMAIN_GART) &&
-		    (read_domains & NOUVEAU_GEM_DOMAIN_GART) &&
-		    bo->mem.mem_type == TTM_PL_TT)
-			flags = TTM_PL_FLAG_TT;
-		else
-		if ((valid_domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
-		    (read_domains & NOUVEAU_GEM_DOMAIN_VRAM))
-			flags = TTM_PL_FLAG_VRAM;
-		else
-			flags = TTM_PL_FLAG_TT;
-	}
+	if (valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)
+		valid_flags |= TTM_PL_FLAG_VRAM;
+
+	if (valid_domains & NOUVEAU_GEM_DOMAIN_GART)
+		valid_flags |= TTM_PL_FLAG_TT;
+
+	if ((domains & NOUVEAU_GEM_DOMAIN_VRAM) &&
+	    bo->mem.mem_type == TTM_PL_VRAM)
+		pref_flags |= TTM_PL_FLAG_VRAM;
+
+	else if ((domains & NOUVEAU_GEM_DOMAIN_GART) &&
+		 bo->mem.mem_type == TTM_PL_TT)
+		pref_flags |= TTM_PL_FLAG_TT;
+
+	else if (domains & NOUVEAU_GEM_DOMAIN_VRAM)
+		pref_flags |= TTM_PL_FLAG_VRAM;
+
+	else
+		pref_flags |= TTM_PL_FLAG_TT;
+
+	nouveau_bo_placement_set(nvbo, pref_flags, valid_flags);
 
-	nouveau_bo_placement_set(nvbo, flags);
 	return 0;
 }
 
-- 
1.6.4.4
