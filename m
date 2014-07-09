From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 04/17] drm/nouveau: require reservations for
 nouveau_fence_sync and nouveau_bo_fence
Date: Wed, 09 Jul 2014 14:29:24 +0200
Message-ID: <20140709122924.11354.52022.stgit@patser>
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

This will ensure we always hold the required lock when calling those functions.
---
 drivers/gpu/drm/nouveau/nouveau_bo.c      |    2 ++
 drivers/gpu/drm/nouveau/nouveau_display.c |   17 +++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index b6dc85c614be..33eb7164525a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1431,6 +1431,8 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence)
 	struct nouveau_fence *new_fence = nouveau_fence_ref(fence);
 	struct nouveau_fence *old_fence = NULL;
 
+	lockdep_assert_held(&nvbo->bo.resv->lock.base);
+
 	spin_lock(&nvbo->bo.bdev->fence_lock);
 	old_fence = nvbo->bo.sync_obj;
 	nvbo->bo.sync_obj = new_fence;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 47ad74255bf1..826b66c44235 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -716,6 +716,9 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	}
 
 	mutex_lock(&chan->cli->mutex);
+	ret = ttm_bo_reserve(&new_bo->bo, true, false, false, NULL);
+	if (ret)
+		goto fail_unpin;
 
 	/* synchronise rendering channel with the kernel's channel */
 	spin_lock(&new_bo->bo.bdev->fence_lock);
@@ -723,12 +726,18 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	spin_unlock(&new_bo->bo.bdev->fence_lock);
 	ret = nouveau_fence_sync(fence, chan);
 	nouveau_fence_unref(&fence);
-	if (ret)
+	if (ret) {
+		ttm_bo_unreserve(&new_bo->bo);
 		goto fail_unpin;
+	}
 
-	ret = ttm_bo_reserve(&old_bo->bo, true, false, false, NULL);
-	if (ret)
-		goto fail_unpin;
+	if (new_bo != old_bo) {
+		ttm_bo_unreserve(&new_bo->bo);
+
+		ret = ttm_bo_reserve(&old_bo->bo, true, false, false, NULL);
+		if (ret)
+			goto fail_unpin;
+	}
 
 	/* Initialize a page flip struct */
 	*s = (struct nouveau_page_flip_state)
