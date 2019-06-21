From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 15/18] drm/nouveau: switch driver from bo->resv to bo->base.resv
Date: Fri, 21 Jun 2019 13:57:52 +0200
Message-ID: <20190621115755.8481-16-kraxel@redhat.com>
References: <20190621115755.8481-1-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621115755.8481-1-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: ckoenig.leichtzumerken@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 283ff690350e..89f8e76a2d7d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -457,7 +457,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 		asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = reservation_object_get_excl_rcu(fb->nvbo->bo.resv);
+	asyw->state.fence = reservation_object_get_excl_rcu(fb->nvbo->bo.base.resv);
 	asyw->image.offset[0] = fb->nvbo->bo.offset;
 
 	if (wndw->func->prepare) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 376215b2206f..8294bb6e6955 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1323,7 +1323,7 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = reservation_object_get_excl(bo->resv);
+	struct dma_fence *fence = reservation_object_get_excl(bo->base.resv);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
@@ -1654,7 +1654,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 void
 nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool exclusive)
 {
-	struct reservation_object *resv = nvbo->bo.resv;
+	struct reservation_object *resv = nvbo->bo.base.resv;
 
 	if (exclusive)
 		reservation_object_add_excl_fence(resv, &fence->base);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d4964f3397a1..e5f249ab216a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -335,7 +335,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct dma_fence *fence;
-	struct reservation_object *resv = nvbo->bo.resv;
+	struct reservation_object *resv = nvbo->bo.base.resv;
 	struct reservation_object_list *fobj;
 	struct nouveau_fence *f;
 	int ret = 0, i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index b1e4852810ed..c7368aa0bdec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -887,7 +887,7 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 		return -ENOENT;
 	nvbo = nouveau_gem_object(gem);
 
-	lret = reservation_object_wait_timeout_rcu(nvbo->bo.resv, write, true,
+	lret = reservation_object_wait_timeout_rcu(nvbo->bo.base.resv, write, true,
 						   no_wait ? 0 : 30 * HZ);
 	if (!lret)
 		ret = -EBUSY;
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 0750caf86e12..b4b06ad34d4f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -112,5 +112,5 @@ struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 
-	return nvbo->bo.resv;
+	return nvbo->bo.base.resv;
 }
-- 
2.18.1
