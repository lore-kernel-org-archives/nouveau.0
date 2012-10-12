From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 2/3] drm/nouveau: add reservation to nouveau_bo_vma_del
Date: Fri, 12 Oct 2012 17:07:27 +0200
Message-ID: <5078322F.8050601@canonical.com>
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |   16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h  |    1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c |    2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2fa736d..cee7448 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1551,9 +1551,25 @@ nouveau_bo_vma_del(struct nouveau_bo *nvbo, struct nouveau_vma *vma)
 {
 	if (vma->node) {
 		if (nvbo->bo.mem.mem_type != TTM_PL_SYSTEM) {
+			ttm_bo_reserve(&nvbo->bo, false, false, false, 0);
 			spin_lock(&nvbo->bo.bdev->fence_lock);
 			ttm_bo_wait(&nvbo->bo, false, false, false);
 			spin_unlock(&nvbo->bo.bdev->fence_lock);
+			ttm_bo_unreserve(&nvbo->bo);
+			nouveau_vm_unmap(vma);
+		}
+
+		nouveau_vm_put(vma);
+		list_del(&vma->head);
+	}
+}
+
+void
+nouveau_bo_vma_del_reserved(struct nouveau_bo *nvbo, struct nouveau_vma *vma)
+{
+	if (vma->node) {
+		if (nvbo->bo.mem.mem_type != TTM_PL_SYSTEM) {
+			ttm_bo_wait(&nvbo->bo, false, false, false);
 			nouveau_vm_unmap(vma);
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index dec51b1..61b8980 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -84,6 +84,7 @@ nouveau_bo_vma_find(struct nouveau_bo *, struct nouveau_vm *);
 int  nouveau_bo_vma_add(struct nouveau_bo *, struct nouveau_vm *,
 			struct nouveau_vma *);
 void nouveau_bo_vma_del(struct nouveau_bo *, struct nouveau_vma *);
+void nouveau_bo_vma_del_reserved(struct nouveau_bo *, struct nouveau_vma *);
 
 /* TODO: submit equivalent to TTM generic API upstream? */
 static inline void __iomem *
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 18342b0..5972ecd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -121,7 +121,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	vma = nouveau_bo_vma_find(nvbo, cli->base.vm);
 	if (vma) {
 		if (--vma->refcount == 0) {
-			nouveau_bo_vma_del(nvbo, vma);
+			nouveau_bo_vma_del_reserved(nvbo, vma);
 			kfree(vma);
 		}
 	}
