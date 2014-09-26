From: Lauri Peltonen <lpeltonen@nvidia.com>
Subject: [RFC PATCH 2/7] drm/nouveau: Split nouveau_fence_sync
Date: Fri, 26 Sep 2014 13:00:07 +0300
Message-ID: <1411725612-10455-3-git-send-email-lpeltonen@nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

Split nouveau_fence_sync to two functions:

 * nouveau_fence_sync, which only adds a fence wait to the channel
   command stream, and
 * nouveau_bo_sync, which gets the fences from the reservation object
   and passes them to nouveau_fence_sync.

Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
---
 drm/nouveau_bo.c      | 38 +++++++++++++++++++++++++++++++++++-
 drm/nouveau_bo.h      |  2 ++
 drm/nouveau_display.c |  4 ++--
 drm/nouveau_fence.c   | 54 ++++++++-------------------------------------------
 drm/nouveau_fence.h   |  2 +-
 drm/nouveau_gem.c     |  2 +-
 6 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drm/nouveau_bo.c b/drm/nouveau_bo.c
index 70c3cb5..534734a 100644
--- a/drm/nouveau_bo.c
+++ b/drm/nouveau_bo.c
@@ -463,6 +463,42 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 }
 
 int
+nouveau_bo_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive)
+{
+	struct fence *fence;
+	struct reservation_object *resv = nvbo->bo.resv;
+	struct reservation_object_list *fobj;
+	int ret = 0, i;
+
+	if (!exclusive) {
+		ret = reservation_object_reserve_shared(resv);
+
+		if (ret)
+			return ret;
+	}
+
+	fobj = reservation_object_get_list(resv);
+	fence = reservation_object_get_excl(resv);
+
+	if (fence && (!exclusive || !fobj || !fobj->shared_count))
+		return nouveau_fence_sync(fence, chan);
+
+	if (!exclusive || !fobj)
+		return ret;
+
+	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+		fence = rcu_dereference_protected(fobj->shared[i],
+						reservation_object_held(resv));
+		ret = nouveau_fence_sync(fence, chan);
+
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+int
 nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
 		    bool no_wait_gpu)
 {
@@ -1070,7 +1106,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 	}
 
 	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
-	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true);
+	ret = nouveau_bo_sync(nouveau_bo(bo), chan, true);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_mem);
 		if (ret == 0) {
diff --git a/drm/nouveau_bo.h b/drm/nouveau_bo.h
index 8ab877b..f97bc26 100644
--- a/drm/nouveau_bo.h
+++ b/drm/nouveau_bo.h
@@ -84,6 +84,8 @@ int  nouveau_bo_validate(struct nouveau_bo *, bool interruptible,
 			 bool no_wait_gpu);
 void nouveau_bo_sync_for_device(struct nouveau_bo *nvbo);
 void nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo);
+int  nouveau_bo_sync(struct nouveau_bo *, struct nouveau_channel *,
+		     bool exclusive);
 
 struct nouveau_vma *
 nouveau_bo_vma_find(struct nouveau_bo *, struct nouveau_vm *);
diff --git a/drm/nouveau_display.c b/drm/nouveau_display.c
index 6d0a3cd..41b130c 100644
--- a/drm/nouveau_display.c
+++ b/drm/nouveau_display.c
@@ -658,7 +658,7 @@ nouveau_page_flip_emit(struct nouveau_channel *chan,
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
 	/* Synchronize with the old framebuffer */
-	ret = nouveau_fence_sync(old_bo, chan, false);
+	ret = nouveau_bo_sync(old_bo, chan, false);
 	if (ret)
 		goto fail;
 
@@ -722,7 +722,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		goto fail_unpin;
 
 	/* synchronise rendering channel with the kernel's channel */
-	ret = nouveau_fence_sync(new_bo, chan, false);
+	ret = nouveau_bo_sync(new_bo, chan, false);
 	if (ret) {
 		ttm_bo_unreserve(&new_bo->bo);
 		goto fail_unpin;
diff --git a/drm/nouveau_fence.c b/drm/nouveau_fence.c
index decfe6c..39b5436 100644
--- a/drm/nouveau_fence.c
+++ b/drm/nouveau_fence.c
@@ -342,57 +342,19 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 }
 
 int
-nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive)
+nouveau_fence_sync(struct fence *fence, struct nouveau_channel *chan)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct fence *fence;
-	struct reservation_object *resv = nvbo->bo.resv;
-	struct reservation_object_list *fobj;
+	struct nouveau_channel *prev = NULL;
 	struct nouveau_fence *f;
-	int ret = 0, i;
-
-	if (!exclusive) {
-		ret = reservation_object_reserve_shared(resv);
-
-		if (ret)
-			return ret;
-	}
-
-	fobj = reservation_object_get_list(resv);
-	fence = reservation_object_get_excl(resv);
-
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
-		struct nouveau_channel *prev = NULL;
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f)
-			prev = f->channel;
-
-		if (!prev || (prev != chan && (ret = fctx->sync(f, prev, chan))))
-			ret = fence_wait(fence, true);
-
-		return ret;
-	}
-
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
-		struct nouveau_channel *prev = NULL;
-
-		fence = rcu_dereference_protected(fobj->shared[i],
-						reservation_object_held(resv));
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f)
-			prev = f->channel;
+	int ret = 0;
 
-		if (!prev || (ret = fctx->sync(f, prev, chan)))
-			ret = fence_wait(fence, true);
+	f = nouveau_local_fence(fence, chan->drm);
+	if (f)
+		prev = f->channel;
 
-		if (ret)
-			break;
-	}
+	if (!prev || (prev != chan && (ret = fctx->sync(f, prev, chan))))
+		ret = fence_wait(fence, true);
 
 	return ret;
 }
diff --git a/drm/nouveau_fence.h b/drm/nouveau_fence.h
index 986c813..8b70166 100644
--- a/drm/nouveau_fence.h
+++ b/drm/nouveau_fence.h
@@ -26,7 +26,7 @@ int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
 bool nouveau_fence_done(struct nouveau_fence *);
 void nouveau_fence_work(struct fence *, void (*)(void *), void *);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
-int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive);
+int  nouveau_fence_sync(struct fence *, struct nouveau_channel *);
 
 struct nouveau_fence_chan {
 	spinlock_t lock;
diff --git a/drm/nouveau_gem.c b/drm/nouveau_gem.c
index a43af30..78398d4 100644
--- a/drm/nouveau_gem.c
+++ b/drm/nouveau_gem.c
@@ -459,7 +459,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 			return ret;
 		}
 
-		ret = nouveau_fence_sync(nvbo, chan, !!b->write_domains);
+		ret = nouveau_bo_sync(nvbo, chan, !!b->write_domains);
 		if (unlikely(ret)) {
 			if (ret != -ERESTARTSYS)
 				NV_PRINTK(error, cli, "fail post-validate sync\n");
-- 
1.8.1.5
