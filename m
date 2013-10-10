From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: do not map evicted bo's in nouveau_bo_vma_add
Date: Thu, 10 Oct 2013 10:04:37 +0200
Message-ID: <52565F95.9000304@canonical.com>
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
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: <stable@vger.kernel.org> # v3.7+ 
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1551,7 +1579,8 @@ nouveau_bo_vma_add(struct nouveau_bo *nvbo, struct nouveau_vm *vm,
 
 	if (nvbo->bo.mem.mem_type == TTM_PL_VRAM)
 		nouveau_vm_map(vma, nvbo->bo.mem.mm_node);
-	else if (nvbo->bo.mem.mem_type == TTM_PL_TT) {
+	else if (nvbo->bo.mem.mem_type == TTM_PL_TT &&
+		 nvbo->page_shift == vma->vm->vmm->spg_shift) {
 		if (node->sg)
 			nouveau_vm_map_sg_table(vma, 0, size, node);
 		else
