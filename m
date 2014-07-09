From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 05/17] drm/ttm: call ttm_bo_wait while inside a reservation
Date: Wed, 09 Jul 2014 14:29:30 +0200
Message-ID: <20140709122930.11354.25660.stgit@patser>
References: <20140709093124.11354.3774.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140709093124.11354.3774.stgit@patser>
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
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: nouveau.vger.kernel.org

This is the last remaining function that doesn't use the reservation
lock completely to fence off access to a buffer.
---
 drivers/gpu/drm/ttm/ttm_bo.c |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 4ab9f7171c4f..d7d34336f108 100644
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
 		ret = __ttm_bo_reserve(bo, false, true, false, 0);
 
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
