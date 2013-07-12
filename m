From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: kill nouveau_ttm_fault_reserve_notify handler
	to prevent useless buffer moves
Date: Fri, 12 Jul 2013 14:45:06 +0200
Message-ID: <51DFFA52.6010102@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

I have no idea what this bogus restriction on placement is, but it breaks decoding 1080p
VDPAU at boot speed. With this patch applied I only need to bump the vdec clock to
get real-time 1080p decoding. It prevents a lot of VRAM <-> VRAM buffer moves.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index d506da5..86eb321 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1339,34 +1339,6 @@ nouveau_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
 }
 
 static int
-nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
-{
-	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
-	struct nouveau_bo *nvbo = nouveau_bo(bo);
-	struct nouveau_device *device = nv_device(drm->device);
-	u32 mappable = pci_resource_len(device->pdev, 1) >> PAGE_SHIFT;
-
-	/* as long as the bo isn't in vram, and isn't tiled, we've got
-	 * nothing to do here.
-	 */
-	if (bo->mem.mem_type != TTM_PL_VRAM) {
-		if (nv_device(drm->device)->card_type < NV_50 ||
-		    !nouveau_bo_tile_layout(nvbo))
-			return 0;
-	}
-
-	/* make sure bo is in mappable vram */
-	if (bo->mem.start + bo->mem.num_pages < mappable)
-		return 0;
-
-
-	nvbo->placement.fpfn = 0;
-	nvbo->placement.lpfn = mappable;
-	nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_VRAM, 0);
-	return nouveau_bo_validate(nvbo, false, false);
-}
-
-static int
 nouveau_ttm_tt_populate(struct ttm_tt *ttm)
 {
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
@@ -1524,7 +1496,6 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.sync_obj_flush = nouveau_bo_fence_flush,
 	.sync_obj_unref = nouveau_bo_fence_unref,
 	.sync_obj_ref = nouveau_bo_fence_ref,
-	.fault_reserve_notify = &nouveau_ttm_fault_reserve_notify,
 	.io_mem_reserve = &nouveau_ttm_io_mem_reserve,
 	.io_mem_free = &nouveau_ttm_io_mem_free,
 };
