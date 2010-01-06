From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Fix null deref in nouveau_fence_emit due to
	deleted fence
Date: Wed,  6 Jan 2010 04:02:45 +0100
Message-ID: <1262746965-6670-1-git-send-email-luca@luca-barbieri.com>
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

Currently Nouveau will unvalidate all buffers if it is forced to wait on one, and then start revalidating from the beginning.
While doing so, it destroys the operation fence, causing nouveau_fence_emit to crash.

This patch fixes this bug by taking the fence object out of validate_op and creating it just before emit.
The fence pointer is initialized to 0 and unref'ed unconditionally.

In addition to fixing the bug, this prevents its reintroduction and simplifies the code.
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   35 ++++++++++++++------------------
 1 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 18fd8ac..7c1ff14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -220,7 +220,6 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
 }
 
 struct validate_op {
-	struct nouveau_fence *fence;
 	struct list_head vram_list;
 	struct list_head gart_list;
 	struct list_head both_list;
@@ -252,17 +251,11 @@ validate_fini_list(struct list_head *list, struct nouveau_fence *fence)
 }
 
 static void
-validate_fini(struct validate_op *op, bool success)
+validate_fini(struct validate_op *op, struct nouveau_fence* fence)
 {
-	struct nouveau_fence *fence = op->fence;
-
-	if (unlikely(!success))
-		op->fence = NULL;
-
-	validate_fini_list(&op->vram_list, op->fence);
-	validate_fini_list(&op->gart_list, op->fence);
-	validate_fini_list(&op->both_list, op->fence);
-	nouveau_fence_unref((void *)&fence);
+	validate_fini_list(&op->vram_list, fence);
+	validate_fini_list(&op->gart_list, fence);
+	validate_fini_list(&op->both_list, fence);
 }
 
 static int
@@ -420,10 +413,6 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	INIT_LIST_HEAD(&op->gart_list);
 	INIT_LIST_HEAD(&op->both_list);
 
-	ret = nouveau_fence_new(chan, &op->fence, false);
-	if (ret)
-		return ret;
-
 	if (nr_buffers == 0)
 		return 0;
 
@@ -541,6 +530,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	struct drm_nouveau_gem_pushbuf_bo *bo = NULL;
 	struct nouveau_channel *chan;
 	struct validate_op op;
+	struct nouveau_fence* fence = 0;
 	uint32_t *pushbuf = NULL;
 	int ret = 0, do_reloc = 0, i;
 
@@ -597,7 +587,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 
 	OUT_RINGp(chan, pushbuf, req->nr_dwords);
 
-	ret = nouveau_fence_emit(op.fence);
+	ret = nouveau_fence_new(chan, &fence, false)
+		|| nouveau_fence_emit(fence);
 	if (ret) {
 		NV_ERROR(dev, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
@@ -605,7 +596,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	}
 
 	if (nouveau_gem_pushbuf_sync(chan)) {
-		ret = nouveau_fence_wait(op.fence, NULL, false, false);
+		ret = nouveau_fence_wait(fence, NULL, false, false);
 		if (ret) {
 			for (i = 0; i < req->nr_dwords; i++)
 				NV_ERROR(dev, "0x%08x\n", pushbuf[i]);
@@ -614,7 +605,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	}
 
 out:
-	validate_fini(&op, ret == 0);
+	validate_fini(&op, fence);
+	nouveau_fence_unref((void**)&fence);
 	mutex_unlock(&dev->struct_mutex);
 	kfree(pushbuf);
 	kfree(bo);
@@ -634,6 +626,7 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem;
 	struct nouveau_bo *pbbo;
 	struct validate_op op;
+	struct nouveau_fence* fence = 0;
 	int i, ret = 0, do_reloc = 0;
 
 	NOUVEAU_CHECK_INITIALISED_WITH_RETURN;
@@ -772,7 +765,8 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 			OUT_RING(chan, 0);
 	}
 
-	ret = nouveau_fence_emit(op.fence);
+	ret = nouveau_fence_new(chan, &fence, false)
+		|| nouveau_fence_emit(fence);
 	if (ret) {
 		NV_ERROR(dev, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
@@ -780,7 +774,8 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 	}
 
 out:
-	validate_fini(&op, ret == 0);
+	validate_fini(&op, fence);
+	nouveau_fence_unref((void**)&fence);
 	mutex_unlock(&dev->struct_mutex);
 	kfree(bo);
 
-- 
1.6.3.3
