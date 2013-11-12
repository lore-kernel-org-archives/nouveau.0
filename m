From: maarten.lankhorst@canonical.com
Subject: [PATCH 5/7] drm/nouveau: do not map evicted vram buffers in
	nouveau_bo_vma_add
Date: Tue, 12 Nov 2013 13:34:12 +0100
Message-ID: <1384259656-29483-5-git-send-email-maarten.lankhorst@canonical.com>
References: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: bskeggs@redhat.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst@canonical.com>

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 9ecb874..bb3734d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1549,7 +1549,8 @@ nouveau_bo_vma_add(struct nouveau_bo *nvbo, struct nouveau_vm *vm,
 
 	if (nvbo->bo.mem.mem_type == TTM_PL_VRAM)
 		nouveau_vm_map(vma, nvbo->bo.mem.mm_node);
-	else if (nvbo->bo.mem.mem_type == TTM_PL_TT) {
+	else if (nvbo->bo.mem.mem_type == TTM_PL_TT &&
+		 nvbo->page_shift == vma->vm->vmm->spg_shift) {
 		if (node->sg)
 			nouveau_vm_map_sg_table(vma, 0, size, node);
 		else
-- 
1.8.4
