From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [RFC PATCH v1 16/16] drm/ttm: use rcu in core ttm
Date: Wed, 14 May 2014 16:58:56 +0200
Message-ID: <20140514145856.21163.96610.stgit@patser>
References: <20140514145134.21163.32350.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140514145134.21163.32350.stgit@patser>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c |   76 +++++++-----------------------------------
 1 file changed, 13 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 31c4a6dd722d..6fe1f4bf37ed 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -466,66 +466,6 @@ static void ttm_bo_cleanup_refs_or_queue(struct ttm_buffer_object *bo)
 			      ((HZ / 100) < 1) ? 1 : HZ / 100);
 }
 
-static int ttm_bo_unreserve_and_wait(struct ttm_buffer_object *bo,
-				     bool interruptible)
-{
-	struct ttm_bo_global *glob = bo->glob;
-	struct reservation_object_list *fobj;
-	struct fence *excl = NULL;
-	struct fence **shared = NULL;
-	u32 shared_count = 0, i;
-	int ret = 0;
-
-	fobj = reservation_object_get_list(bo->resv);
-	if (fobj && fobj->shared_count) {
-		shared = kmalloc(sizeof(*shared) * fobj->shared_count,
-				 GFP_KERNEL);
-
-		if (!shared) {
-			ret = -ENOMEM;
-			__ttm_bo_unreserve(bo);
-			spin_unlock(&glob->lru_lock);
-			return ret;
-		}
-
-		for (i = 0; i < fobj->shared_count; ++i) {
-			if (!fence_is_signaled(fobj->shared[i])) {
-				fence_get(fobj->shared[i]);
-				shared[shared_count++] = fobj->shared[i];
-			}
-		}
-		if (!shared_count) {
-			kfree(shared);
-			shared = NULL;
-		}
-	}
-
-	excl = reservation_object_get_excl(bo->resv);
-	if (excl && !fence_is_signaled(excl))
-		fence_get(excl);
-	else
-		excl = NULL;
-
-	__ttm_bo_unreserve(bo);
-	spin_unlock(&glob->lru_lock);
-
-	if (excl) {
-		ret = fence_wait(excl, interruptible);
-		fence_put(excl);
-	}
-
-	if (shared_count > 0) {
-		for (i = 0; i < shared_count; ++i) {
-			if (!ret)
-				ret = fence_wait(shared[i], interruptible);
-			fence_put(shared[i]);
-		}
-		kfree(shared);
-	}
-
-	return ret;
-}
-
 /**
  * function ttm_bo_cleanup_refs_and_unlock
  * If bo idle, remove from delayed- and lru lists, and unref.
@@ -549,9 +489,19 @@ static int ttm_bo_cleanup_refs_and_unlock(struct ttm_buffer_object *bo,
 	ret = ttm_bo_wait(bo, false, false, true);
 
 	if (ret && !no_wait_gpu) {
-		ret = ttm_bo_unreserve_and_wait(bo, interruptible);
-		if (ret)
-			return ret;
+		long lret;
+		ww_mutex_unlock(&bo->resv->lock);
+		spin_unlock(&glob->lru_lock);
+
+		lret = reservation_object_wait_timeout_rcu(bo->resv,
+							   true,
+							   interruptible,
+							   30 * HZ);
+
+		if (lret < 0)
+			return lret;
+		else if (lret == 0)
+			return -EBUSY;
 
 		spin_lock(&glob->lru_lock);
 		ret = __ttm_bo_reserve(bo, false, true, false, 0);
