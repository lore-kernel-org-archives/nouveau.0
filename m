From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 1/3] Introduce nouveau_bo_wait for waiting on a BO
	with a GPU channel
Date: Mon,  1 Feb 2010 10:50:08 +0100
Message-ID: <1265017810-13354-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

nouveau_bo_wait will make the GPU channel wait for fence if possible,
otherwise falling back to waiting with the CPU using ttm_bo_wait.

The nouveau_fence_sync function currently returns -ENOSYS, and is
the focus of the next patch.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |   68 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    2 +
 drivers/gpu/drm/nouveau/nouveau_fence.c |    6 +++
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   20 +++++----
 4 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index db0ed4c..8afc17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -35,6 +35,70 @@
 
 #include <linux/log2.h>
 
+int
+nouveau_bo_wait(struct ttm_buffer_object *bo, struct nouveau_channel *chan)
+{
+	int ret = 0;
+
+	if (likely(!bo->sync_obj))
+		return 0;
+
+	spin_lock(&bo->lock);
+	if (chan) {
+		struct nouveau_fence *new_fence;
+		struct nouveau_channel *waited_chan;
+
+		do {
+			struct nouveau_fence *prev_fence;
+			prev_fence = bo->sync_obj;
+
+			waited_chan = nouveau_fence_channel(prev_fence);
+			if (likely(!waited_chan || waited_chan == chan))
+				break;
+
+			nouveau_fence_ref(prev_fence);
+
+			ret = ttm_bo_wait(bo, false, false, true);
+			if (!ret)
+				goto unref_break;
+
+			if (unlikely(prev_fence != bo->sync_obj))
+				goto unref_continue;
+
+			spin_unlock(&bo->lock);
+			new_fence = nouveau_fence_sync(prev_fence, chan);
+			spin_lock(&bo->lock);
+
+			if (likely(!IS_ERR(new_fence))) {
+				if (likely(bo->sync_obj)) {
+					if (unlikely(bo->sync_obj != prev_fence)) {
+						nouveau_fence_unref((void **)&new_fence);
+						continue;
+					}
+					nouveau_fence_unref((void **)&bo->sync_obj);
+				}
+				bo->sync_obj = new_fence;
+				ret = 0;
+unref_break:
+				nouveau_fence_unref((void **)&prev_fence);
+				break;
+			}
+
+			if (unlikely(prev_fence != bo->sync_obj)) {
+unref_continue:
+				nouveau_fence_unref((void **)&prev_fence);
+				continue;
+			}
+
+			nouveau_fence_unref((void **)&prev_fence);
+			ret = ttm_bo_wait(bo, false, false, false);
+		} while (0);
+	} else
+		ret = ttm_bo_wait(bo, false, false, false);
+	spin_unlock(&bo->lock);
+	return ret;
+}
+
 static void
 nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 {
@@ -469,8 +533,10 @@ nouveau_bo_move_accel_cleanup(struct nouveau_channel *chan,
 
 	ret = ttm_bo_move_accel_cleanup(&nvbo->bo, fence, NULL,
 					evict, no_wait, new_mem);
+
+	/* TODO: this should be redundant, since we do the check in validate */
 	if (nvbo->channel && nvbo->channel != chan)
-		ret = nouveau_fence_wait(fence, NULL, false, false);
+		ret = nouveau_bo_wait(&nvbo->bo, nvbo->channel);
 	nouveau_fence_unref((void *)&fence);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 5445cef..2b78ee6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1110,6 +1110,7 @@ extern int nv04_crtc_create(struct drm_device *, int index);
 
 /* nouveau_bo.c */
 extern struct ttm_bo_driver nouveau_bo_driver;
+extern int nouveau_bo_wait(struct ttm_buffer_object *bo, struct nouveau_channel *chan);
 extern int nouveau_bo_new(struct drm_device *, struct nouveau_channel *,
 			  int size, int align, uint32_t flags,
 			  uint32_t tile_mode, uint32_t tile_flags,
@@ -1135,6 +1136,7 @@ extern int nouveau_fence_emit(struct nouveau_fence *);
 struct nouveau_channel *nouveau_fence_channel(struct nouveau_fence *);
 extern bool nouveau_fence_signalled(void *obj, void *arg);
 extern int nouveau_fence_wait(void *obj, void *arg, bool lazy, bool intr);
+extern struct nouveau_fence *nouveau_fence_sync(struct nouveau_fence *, struct nouveau_channel *);
 extern int nouveau_fence_flush(void *obj, void *arg);
 extern void nouveau_fence_unref(void **obj);
 extern void *nouveau_fence_ref(void *obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index faddf53..9b1c2c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -56,6 +56,12 @@ nouveau_fence_del(struct kref *ref)
 	kfree(fence);
 }
 
+struct nouveau_fence*
+nouveau_fence_sync(struct nouveau_fence *waited_fence, struct nouveau_channel *chan)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 void
 nouveau_fence_update(struct nouveau_channel *chan)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 70cc308..b8d61ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -356,15 +356,6 @@ validate_list(struct nouveau_channel *chan, struct list_head *list,
 
 	list_for_each_entry(nvbo, list, entry) {
 		struct drm_nouveau_gem_pushbuf_bo *b = &pbbo[nvbo->pbbo_index];
-		struct nouveau_fence *prev_fence = nvbo->bo.sync_obj;
-
-		if (prev_fence && nouveau_fence_channel(prev_fence) != chan) {
-			spin_lock(&nvbo->bo.lock);
-			ret = ttm_bo_wait(&nvbo->bo, false, false, false);
-			spin_unlock(&nvbo->bo.lock);
-			if (unlikely(ret))
-				return ret;
-		}
 
 		ret = nouveau_gem_set_domain(nvbo->gem, b->read_domains,
 					     b->write_domains,
@@ -379,6 +370,17 @@ validate_list(struct nouveau_channel *chan, struct list_head *list,
 		if (unlikely(ret))
 			return ret;
 
+		/* we must wait *after *validation, since we do the move
+		   with the kernel channel.
+
+		    Note that this may spin/sleep on a fence
+		    TODO: is this a good idea, or should we bail and retry?
+		  */
+		ret = nouveau_bo_wait(&nvbo->bo, chan);
+		if (unlikely(ret))
+			return ret;
+
+
 		if (nvbo->bo.offset == b->presumed_offset &&
 		    ((nvbo->bo.mem.mem_type == TTM_PL_VRAM &&
 		      b->presumed_domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
-- 
1.6.6.1.476.g01ddb
