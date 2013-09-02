From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nv50-: fix tiled memory layout checks
Date: Mon,  2 Sep 2013 16:31:18 +0200
Message-ID: <1378132278-19496-1-git-send-email-maarten.lankhorst@canonical.com>
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
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

nv50_bo_move_m2mf might copy to tiled gart, in which case linear copy is not appropriate.
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 42 ++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 88f0c45..0daf3f0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -176,8 +176,8 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
 			*size = roundup(*size, 32 * nvbo->tile_mode);
 		}
 	} else {
-		*size = roundup(*size, (1 << nvbo->page_shift));
-		*align = max((1 <<  nvbo->page_shift), *align);
+		*align = 1 << nvbo->page_shift;
+		*size = roundup(*size, *align);
 	}
 
 	*size = roundup(*size, PAGE_SIZE);
@@ -713,6 +713,8 @@ nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 	u32 page_count = new_mem->num_pages;
 	int ret, last_count = 0;
 
+	nv_error(chan->drm, "Evicting %#x bytes from %u/%#Lx to %u/%#Lx\n", page_count << PAGE_SHIFT, old_mem->mem_type, src_offset, new_mem->mem_type, dst_offset);
+
 	ret = RING_SPACE(chan, (page_count + 2046) / 2047 * 7 + 2);
 	if (ret)
 		return ret;
@@ -834,19 +836,17 @@ static int
 nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_mem_reg *old_mem, struct ttm_mem_reg *new_mem)
 {
-	struct nouveau_mem *node = old_mem->mm_node;
+	struct nouveau_mem *old_node = old_mem->mm_node;
+	struct nouveau_mem *new_node = new_mem->mm_node;
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	u64 length = (new_mem->num_pages << PAGE_SHIFT);
-	u64 src_offset = node->vma[0].offset;
-	u64 dst_offset = node->vma[1].offset;
+	u64 src_offset = old_node->vma[0].offset;
+	u64 dst_offset = old_node->vma[1].offset;
 	u32 size;
 	int ret;
 
 	size = 18;
-	if (nouveau_bo_tile_layout(nvbo)) {
-		size += 6 * (old_mem->mem_type == TTM_PL_VRAM);
-		size += 6 * (new_mem->mem_type == TTM_PL_VRAM);
-	}
+	size += 6 * (!!old_node->memtype + !!new_node->memtype);
 	size *= (length + (4 * 1024 * 1024) - 1) / (4 * 1024 * 1024);
 	ret = RING_SPACE(chan, size);
 	if (ret)
@@ -859,8 +859,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		stride  = 16 * 4;
 		height  = amount / stride;
 
-		if (old_mem->mem_type == TTM_PL_VRAM &&
-		    nouveau_bo_tile_layout(nvbo)) {
+		if (old_node->memtype) {
 			BEGIN_NV04(chan, NvSubCopy, 0x0200, 7);
 			OUT_RING  (chan, 0);
 			OUT_RING  (chan, 0);
@@ -873,8 +872,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 			BEGIN_NV04(chan, NvSubCopy, 0x0200, 1);
 			OUT_RING  (chan, 1);
 		}
-		if (new_mem->mem_type == TTM_PL_VRAM &&
-		    nouveau_bo_tile_layout(nvbo)) {
+		if (new_node->memtype) {
 			BEGIN_NV04(chan, NvSubCopy, 0x021c, 7);
 			OUT_RING  (chan, 0);
 			OUT_RING  (chan, 0);
@@ -1051,8 +1049,8 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 	} _methods[] = {
 		{  "COPY", 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "GRCE", 0, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
-		{ "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_copy_init },
-		{ "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_copy_init },
+//		{ "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_copy_init },
+//		{ "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_copy_init },
 		{  "COPY", 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
 		{ "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
 		{  "M2MF", 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_m2mf_init },
@@ -1166,13 +1164,23 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_vma *vma;
+	struct ttm_mem_reg *old_mem = &bo->mem;
 
 	/* ttm can now (stupidly) pass the driver bos it didn't create... */
 	if (bo->destroy != nouveau_bo_del_ttm)
 		return;
 
 	list_for_each_entry(vma, &nvbo->vma_list, head) {
-		if (new_mem && new_mem->mem_type == TTM_PL_VRAM) {
+		if (!new_mem ||
+		    old_mem->mem_type == TTM_PL_VRAM ||
+		    (old_mem->mem_type == TTM_PL_TT &&
+		     nvbo->page_shift == vma->vm->vmm->spg_shift))
+		    nouveau_vm_unmap(vma);
+
+		if (!new_mem)
+			continue;
+
+		if (new_mem->mem_type == TTM_PL_VRAM) {
 			nouveau_vm_map(vma, new_mem->mm_node);
 		} else
 		if (new_mem && new_mem->mem_type == TTM_PL_TT &&
@@ -1185,8 +1193,6 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem)
 				nouveau_vm_map_sg(vma, 0, new_mem->
 						  num_pages << PAGE_SHIFT,
 						  new_mem->mm_node);
-		} else {
-			nouveau_vm_unmap(vma);
 		}
 	}
 }
-- 
1.8.3.4
