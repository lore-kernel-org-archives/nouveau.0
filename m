From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 03/17] drm/nouveau: add reservation to
 nouveau_gem_ioctl_cpu_prep
Date: Wed, 09 Jul 2014 14:29:18 +0200
Message-ID: <20140709122918.11354.32309.stgit@patser>
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

Apart from some code inside ttm itself and nouveau_bo_vma_del,
this is the only place where ttm_bo_wait is used without a reservation.
Fix this so we can remove the fence_lock later on.

After the switch to rcu the reservation lock will be
removed again.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c90c0dc0afe8..6e1c58a880fe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -886,17 +886,31 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
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
