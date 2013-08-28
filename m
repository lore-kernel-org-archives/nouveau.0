From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 3/6] drm/nouveau: hook up cache sync functions
Date: Wed, 28 Aug 2013 02:00:47 +0200
Message-ID: <1377648050-6649-4-git-send-email-dev@lynxeye.de>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1377648050-6649-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
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

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 4 ++++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index af20fba..f4a2eb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -411,6 +411,10 @@ nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
 {
 	int ret;
 
+	if (nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)
+		ttm_dma_tt_cache_sync_for_device((struct ttm_dma_tt *)nvbo->bo.ttm,
+			&nouveau_bdev(nvbo->bo.ttm->bdev)->dev->pdev->dev);
+
 	ret = ttm_bo_validate(&nvbo->bo, &nvbo->placement,
 			      interruptible, no_wait_gpu);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 830cb7b..f632b92 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -901,6 +901,11 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
 	spin_unlock(&nvbo->bo.bdev->fence_lock);
 	drm_gem_object_unreference_unlocked(gem);
+
+	if (!ret && nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)
+		ttm_dma_tt_cache_sync_for_cpu((struct ttm_dma_tt *)nvbo->bo.ttm,
+					      &dev->pdev->dev);
+
 	return ret;
 }
 
-- 
1.8.3.1
