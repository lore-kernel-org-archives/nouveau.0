From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: add reservation to
	nouveau_gem_ioctl_cpu_prep
Date: Fri, 12 Oct 2012 17:06:48 +0200
Message-ID: <50783208.305@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Apart from some code inside ttm itself and nouveau_bo_vma_del,
this is the only place where ttm_bo_wait is used without a reservation.
Fix this so we can remove the fence_lock later on.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5e2f521..18342b0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -837,17 +837,31 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem;
 	struct nouveau_bo *nvbo;
 	bool no_wait = !!(req->flags & NOUVEAU_GEM_CPU_PREP_NOWAIT);
-	int ret = -EINVAL;
+	int ret;
+	struct nouveau_fence *fence = NULL;
 
 	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
 	if (!gem)
 		return -ENOENT;
 	nvbo = nouveau_gem_object(gem);
 
-	spin_lock(&nvbo->bo.bdev->fence_lock);
-	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
-	spin_unlock(&nvbo->bo.bdev->fence_lock);
+	ret = ttm_bo_reserve(&nvbo->bo, true, false, false, 0);
+	if (!ret) {
+		spin_lock(&nvbo->bo.bdev->fence_lock);
+		ret = ttm_bo_wait(&nvbo->bo, true, true, true);
+		if (!no_wait && ret)
+			fence = nouveau_fence_ref(nvbo->bo.sync_obj);
+		spin_unlock(&nvbo->bo.bdev->fence_lock);
+
+		ttm_bo_unreserve(&nvbo->bo);
+	}
 	drm_gem_object_unreference_unlocked(gem);
+
+	if (fence) {
+		ret = nouveau_fence_wait(fence, true, no_wait);
+		nouveau_fence_unref(&fence);
+	}
+
 	return ret;
 }
