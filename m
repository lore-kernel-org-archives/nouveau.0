From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 06/19] drm/ttm: call ttm_bo_wait while inside a
	reservation
Date: Thu, 31 Jul 2014 17:33:21 +0200
Message-ID: <20140731153321.15061.64400.stgit@patser>
References: <20140731153245.15061.63023.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140731153245.15061.63023.stgit@patser>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is the last remaining function that doesn't use the reservation
lock completely to fence off access to a buffer.
---
 drivers/gpu/drm/ttm/ttm_bo.c |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3da89d5dab60..df08f18f05ac 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -502,17 +502,6 @@ static int ttm_bo_cleanup_refs_and_unlock(struct ttm_buffer_object *bo,
 		if (ret)
 			return ret;
 
-		/*
-		 * remove sync_obj with ttm_bo_wait, the wait should be
-		 * finished, and no new wait object should have been added.
-		 */
-		spin_lock(&bdev->fence_lock);
-		ret = ttm_bo_wait(bo, false, false, true);
-		WARN_ON(ret);
-		spin_unlock(&bdev->fence_lock);
-		if (ret)
-			return ret;
-
 		spin_lock(&glob->lru_lock);
 		ret = __ttm_bo_reserve(bo, false, true, false, NULL);
 
@@ -528,8 +517,16 @@ static int ttm_bo_cleanup_refs_and_unlock(struct ttm_buffer_object *bo,
 			spin_unlock(&glob->lru_lock);
 			return 0;
 		}
-	} else
-		spin_unlock(&bdev->fence_lock);
+
+		/*
+		 * remove sync_obj with ttm_bo_wait, the wait should be
+		 * finished, and no new wait object should have been added.
+		 */
+		spin_lock(&bdev->fence_lock);
+		ret = ttm_bo_wait(bo, false, false, true);
+		WARN_ON(ret);
+	}
+	spin_unlock(&bdev->fence_lock);
 
 	if (ret || unlikely(list_empty(&bo->ddestroy))) {
 		__ttm_bo_unreserve(bo);
@@ -1539,6 +1536,8 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	void *sync_obj;
 	int ret = 0;
 
+	lockdep_assert_held(&bo->resv->lock.base);
+
 	if (likely(bo->sync_obj == NULL))
 		return 0;
