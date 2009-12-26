From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] drm/nv50: improve handling of tiled buffers
	wrt to cpu/gpu access
Date: Sat, 26 Dec 2009 22:43:05 +0100
Message-ID: <1261863788-8318-2-git-send-email-madman2003@gmail.com>
References: <1261863788-8318-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261863788-8318-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- Always make sure they are in vram (this is the only place where we have the
proper aperture).
- Hide the padding away from users, accessing this can cause problems for
neighbour buffer objects.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |   20 ++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |    2 ++
 drivers/gpu/drm/nouveau/nouveau_gem.c |   15 ++++++++++++++-
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fd767e7..a052016 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -130,7 +130,7 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_bo *nvbo;
-	int ret = 0;
+	int ret = 0, original_size;
 
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
@@ -142,7 +142,17 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 	nvbo->tile_mode = tile_mode;
 	nvbo->tile_flags = tile_flags;
 
+	/* NV50: align to page size, any extra size after that is padding. */
+	if (dev_priv->card_type == NV_50)
+		original_size = size = roundup(size, 65536);
+	else
+		original_size = size = roundup(size, PAGE_SIZE);
 	nouveau_bo_fixup_align(dev, tile_mode, tile_flags, &align, &size);
+	/* Touching this padding is dangerous as it will interfere with other
+	 * buffer objects.
+	 */
+	if (dev_priv->card_type == NV_50)
+		nvbo->padding = (size - original_size) >> PAGE_SHIFT;
 	align >>= PAGE_SHIFT;
 
 	nvbo->placement.fpfn = 0;
@@ -277,7 +287,8 @@ nouveau_bo_map(struct nouveau_bo *nvbo)
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.mem.num_pages, &nvbo->kmap);
+	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.mem.num_pages - nvbo->padding,
+					&nvbo->kmap);
 	ttm_bo_unreserve(&nvbo->bo);
 	return ret;
 }
@@ -661,8 +672,9 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem,
 	if (dev_priv->card_type == NV_50) {
 		ret = nv50_mem_vm_bind_linear(dev,
 					      offset + dev_priv->vm_vram_base,
-					      new_mem->size, nvbo->tile_flags,
-					      offset);
+					      new_mem->size -
+					      (nvbo->padding << PAGE_SHIFT),
+					      nvbo->tile_flags, offset);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 7da88a9..ed9bb0d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -91,6 +91,8 @@ struct nouveau_bo {
 
 	uint32_t tile_mode;
 	uint32_t tile_flags;
+	/* tile_flags dependent padding (in pages). */
+	int padding;
 	struct nouveau_tile_reg *tile;
 
 	struct drm_gem_object *gem;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 18fd8ac..427b43c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -95,7 +95,7 @@ nouveau_gem_info(struct drm_gem_object *gem, struct drm_nouveau_gem_info *rep)
 	else
 		rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
 
-	rep->size = nvbo->bo.mem.num_pages << PAGE_SHIFT;
+	rep->size = (nvbo->bo.mem.num_pages - nvbo->padding) << PAGE_SHIFT;
 	rep->offset = nvbo->bo.offset;
 	rep->map_handle = nvbo->mappable ? nvbo->bo.addr_space_offset : 0;
 	rep->tile_mode = nvbo->tile_mode;
@@ -908,6 +908,19 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 		return ret;
 	nvbo = nouveau_gem_object(gem);
 
+	/* Buffer objects with tile flags need to be in vram, so move them. */
+	if (nvbo->tile_flags) {
+		ret = ttm_bo_reserve(&nvbo->bo, false, false, false, 0);
+		if (ret)
+			return ret;
+
+		ret = ttm_bo_validate(&nvbo->bo, &nvbo->placement, false, false);
+		if (ret)
+			return ret;
+
+		ttm_bo_unreserve(&nvbo->bo);
+	}
+
 	if (nvbo->cpu_filp) {
 		if (nvbo->cpu_filp == file_priv)
 			goto out;
-- 
1.6.6.rc4
