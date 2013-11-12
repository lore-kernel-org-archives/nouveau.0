From: maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH 2/7] drm/nv50-: untile mmap'd bo's
Date: Tue, 12 Nov 2013 13:34:09 +0100
Message-ID: <1384259656-29483-2-git-send-email-maarten.lankhorst@canonical.com>
References: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384259656-29483-1-git-send-email-maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

Map the GART to the bar and use that mapping, to hide all the tiling details from users.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c |  5 ++++-
 drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c |  5 ++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c           | 20 +++++++++++++++++---
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c
index 160d27f..9907a25 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c
@@ -67,7 +67,10 @@ nv50_bar_umap(struct nouveau_bar *bar, struct nouveau_mem *mem,
 	if (ret)
 		return ret;
 
-	nouveau_vm_map(vma, mem);
+	if (mem->pages)
+		nouveau_vm_map_sg(vma, 0, mem->size << 12, mem);
+	else
+		nouveau_vm_map(vma, mem);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
index b2ec741..badd835 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
@@ -66,7 +66,10 @@ nvc0_bar_umap(struct nouveau_bar *bar, struct nouveau_mem *mem,
 	if (ret)
 		return ret;
 
-	nouveau_vm_map(vma, mem);
+	if (mem->pages)
+		nouveau_vm_map_sg(vma, 0, mem->size << 12, mem);
+	else
+		nouveau_vm_map(vma, mem);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 639d7cd..9ecb874 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1259,6 +1259,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
 {
 	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
+	struct nouveau_mem *node = mem->mm_node;
 	struct drm_device *dev = drm->dev;
 	int ret;
 
@@ -1281,14 +1282,16 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
 			mem->bus.is_iomem = !dev->agp->cant_use_aperture;
 		}
 #endif
-		break;
+		if (!node->memtype)
+			/* untiled */
+			break;
+		/* fallthrough, tiled memory */
 	case TTM_PL_VRAM:
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 		mem->bus.base = pci_resource_start(dev->pdev, 1);
 		mem->bus.is_iomem = true;
 		if (nv_device(drm->device)->card_type >= NV_50) {
 			struct nouveau_bar *bar = nouveau_bar(drm->device);
-			struct nouveau_mem *node = mem->mm_node;
 
 			ret = bar->umap(bar, node, NV_MEM_ACCESS_RW,
 					&node->bar_vma);
@@ -1324,6 +1327,7 @@ nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_device *device = nv_device(drm->device);
 	u32 mappable = pci_resource_len(device->pdev, 1) >> PAGE_SHIFT;
+	int ret;
 
 	/* as long as the bo isn't in vram, and isn't tiled, we've got
 	 * nothing to do here.
@@ -1332,10 +1336,20 @@ nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 		if (nv_device(drm->device)->card_type < NV_50 ||
 		    !nouveau_bo_tile_layout(nvbo))
 			return 0;
+
+		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
+			nouveau_bo_placement_set(nvbo, TTM_PL_TT, 0);
+
+			ret = nouveau_bo_validate(nvbo, false, false);
+			if (ret)
+				return ret;
+		}
+		return 0;
 	}
 
 	/* make sure bo is in mappable vram */
-	if (bo->mem.start + bo->mem.num_pages < mappable)
+	if (nv_device(drm->device)->card_type >= NV_50 ||
+	    bo->mem.start + bo->mem.num_pages < mappable)
 		return 0;
 
 
-- 
1.8.4
