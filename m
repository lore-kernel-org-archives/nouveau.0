From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 16/19] drm/nouveau: use rcu in nouveau_gem_ioctl_cpu_prep
Date: Thu, 31 Jul 2014 17:34:26 +0200
Message-ID: <20140731153426.15061.43806.stgit@patser>
References: <20140731153245.15061.63023.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140731153245.15061.63023.stgit@patser>
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

With the conversion to the reservation api this should be safe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 0a1fee7eb211..b24a6fe6c601 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -863,33 +863,29 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem;
 	struct nouveau_bo *nvbo;
 	bool no_wait = !!(req->flags & NOUVEAU_GEM_CPU_PREP_NOWAIT);
+	bool write = !!(req->flags & NOUVEAU_GEM_CPU_PREP_WRITE);
 	int ret;
-	struct nouveau_fence *fence = NULL;
 
 	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
 	if (!gem)
 		return -ENOENT;
 	nvbo = nouveau_gem_object(gem);
 
-	ret = ttm_bo_reserve(&nvbo->bo, true, false, false, 0);
-	if (!ret) {
-		ret = ttm_bo_wait(&nvbo->bo, true, true, true);
-		if (!no_wait && ret) {
-			struct fence *excl;
-
-			excl = reservation_object_get_excl(nvbo->bo.resv);
-			fence = nouveau_fence_ref((struct nouveau_fence *)excl);
-		}
+	if (no_wait)
+		ret = reservation_object_test_signaled_rcu(nvbo->bo.resv, write) ? 0 : -EBUSY;
+	else {
+		long lret;
 
-		ttm_bo_unreserve(&nvbo->bo);
+		lret = reservation_object_wait_timeout_rcu(nvbo->bo.resv, write, true, 30 * HZ);
+		if (!lret)
+			ret = -EBUSY;
+		else if (lret > 0)
+			ret = 0;
+		else
+			ret = lret;
 	}
 	drm_gem_object_unreference_unlocked(gem);
 
-	if (fence) {
-		ret = nouveau_fence_wait(fence, true, no_wait);
-		nouveau_fence_unref(&fence);
-	}
-
 	return ret;
 }
