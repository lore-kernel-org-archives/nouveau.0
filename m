From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix takedown in move_notify
Date: Wed, 21 Nov 2012 14:15:33 +0100
Message-ID: <50ACD3F5.6010007@canonical.com>
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

move_notify is called by ttm after the the object is idle and about
to be destroyed. Clean up the vm list properly in that case.

This is not a problem right now, since the list should already be
empty, but if it wasn't empty, vm_put was not called which leads to
random corruption later.

With this fix, nouveau_gem_object_close can be safely changed to a noop,
forcing the vm bindings to be removed when the original object is. This
is not done in this patch since it may lead to the object staying mapped
in the vm space until the gem object refcount drops to 0. This shouldn't
be a big issue however.

If we choose to do so does allow us to use ttm's delayed destruction
mechanism to unmap vm after object is idle, resulting in ioread32 no
longer taking up 30% of cpu in Team Fortress 2 if I don't do the vma
unmap in nouveau_gem_object_close.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

---
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 35ac57f..e8a47f0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1139,12 +1139,22 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem)
 	if (bo->destroy != nouveau_bo_del_ttm)
 		return;
 
+	if (!new_mem) {
+		while (!list_empty(&nvbo->vma_list)) {
+			vma = list_first_entry(&nvbo->vma_list, struct nouveau_vma, head);
+
+			nouveau_vm_unmap(vma);
+			nouveau_vm_put(vma);
+			list_del(&vma->head);
+		}
+		return;
+	}
+
 	list_for_each_entry(vma, &nvbo->vma_list, head) {
-		if (new_mem && new_mem->mem_type == TTM_PL_VRAM) {
+		if (new_mem->mem_type == TTM_PL_VRAM) {
 			nouveau_vm_map(vma, new_mem->mm_node);
-		} else
-		if (new_mem && new_mem->mem_type == TTM_PL_TT &&
-		    nvbo->page_shift == vma->vm->vmm->spg_shift) {
+		} else if (new_mem->mem_type == TTM_PL_TT &&
+		           nvbo->page_shift == vma->vm->vmm->spg_shift) {
 			if (((struct nouveau_mem *)new_mem->mm_node)->sg)
 				nouveau_vm_map_sg_table(vma, 0, new_mem->
 						  num_pages << PAGE_SHIFT,
@@ -1153,8 +1163,6 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem)
 				nouveau_vm_map_sg(vma, 0, new_mem->
 						  num_pages << PAGE_SHIFT,
 						  new_mem->mm_node);
-		} else {
-			nouveau_vm_unmap(vma);
 		}
 	}
 }
