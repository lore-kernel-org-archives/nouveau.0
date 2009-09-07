From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix ref leak in
	nouveau_gem_pushbuf_validate()
Date: Mon,  7 Sep 2009 23:09:25 +0300
Message-ID: <1252354165-5109-1-git-send-email-pq@iki.fi>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

If ttm_bo_reserve() in nouveau_gem_pushbuf_validate() failed, the GEM
object reference is leaked, since the object is not yet in the list for
cleanup.

Create a new function nouveau_gem_pushbuf_lookup_and_reserve() that does
the GEM object lookup and ttm_bo_reserve() together, or fails and undos
them both, eliminating GEM object reference leaks.

I believe this bug lead to a permanent validation failure, which was
worked around in the earlier commit "drm/nouveau: bail out if validation
fails repeatedly". I also believe this bug later triggered a BUG_ON() in
TTM cleanup during module unload, making nouveau.ko impossible to
unload. The relevant bug report:
https://bugs.freedesktop.org/show_bug.cgi?id=23741

This patch also includes Ben's cleanup fix in
nouveau_gem_pushbuf_validate(), where the current object ref and
reservervation would have not been cancelled, if cpu_writers test
failed.

However, this patch does NOT fix nouveau_gem_pushbuf_validate()
completely. The scenario described in the bug report now leads to X
server being stuck in uninterruptible sleep in ttm_bo_wait_unreserved().

Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   65 +++++++++++++++++++++------------
 1 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f0c78a8..55e7988 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -268,6 +268,40 @@ nouveau_gem_pushbuf_fence(struct list_head *list, struct nouveau_fence *fence)
 }
 
 static int
+nouveau_gem_pushbuf_lookup_and_reserve(struct nouveau_channel *chan,
+				struct drm_file *file_priv,
+				struct drm_nouveau_gem_pushbuf_bo *pbbo,
+				struct nouveau_bo **bop)
+{
+	struct drm_gem_object *gem;
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	gem = drm_gem_object_lookup(chan->dev, file_priv, pbbo->handle);
+	if (!gem) {
+		NV_ERROR(chan->dev, "Unknown handle 0x%08x\n", pbbo->handle);
+		return -EINVAL;
+	}
+	nvbo = gem->driver_private;
+
+	ret = ttm_bo_reserve(&nvbo->bo, false, false, true,
+			     chan->fence.sequence);
+	switch (ret) {
+	case 0:
+		*bop = nvbo;
+		return 0;
+	case -EAGAIN:
+		ret = ttm_bo_wait_unreserved(&nvbo->bo, false);
+		if (ret == 0)
+			ret = -EAGAIN;
+		/* fall through */
+	default:
+		drm_gem_object_unreference(gem);
+	}
+	return ret;
+}
+
+static int
 nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 			     struct drm_file *file_priv,
 			     struct drm_nouveau_gem_pushbuf_bo *pbbo,
@@ -279,7 +313,7 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	struct drm_nouveau_gem_pushbuf_bo __user *user_pbbos =
 				(void __force __user *)(uintptr_t)user_buffers;
 	struct nouveau_fence *prev_fence;
-	struct nouveau_bo *nvbo;
+	struct nouveau_bo *nvbo = NULL;
 	struct list_head *entry, *tmp;
 	int ret = -EINVAL;
 	int i;
@@ -296,28 +330,15 @@ retry:
 	}
 
 	for (i = 0, b = pbbo; i < nr_buffers; i++, b++) {
-		struct drm_gem_object *gem;
-
-		gem = drm_gem_object_lookup(dev, file_priv, b->handle);
-		if (!gem) {
-			NV_ERROR(dev, "Unknown handle 0x%08x\n", b->handle);
-			ret = -EINVAL;
-			goto out_unref;
-		}
-		nvbo = gem->driver_private;
-
-		ret = ttm_bo_reserve(&nvbo->bo, false, false, true,
-				     chan->fence.sequence);
-		if (ret) {
+		ret = nouveau_gem_pushbuf_lookup_and_reserve(chan, file_priv,
+								b, &nvbo);
+		if (ret == -EAGAIN) {
 			nouveau_gem_pushbuf_backoff(list);
-			if (ret == -EAGAIN) {
-				ret = ttm_bo_wait_unreserved(&nvbo->bo, false);
-				if (unlikely(ret))
-					goto out_unref;
-				goto retry;
-			} else
-				goto out_unref;
+			goto retry;
 		}
+		if (ret)
+			goto out_unref;
+		list_add_tail(&nvbo->entry, list);
 
 		if (unlikely(atomic_read(&nvbo->bo.cpu_writers) > 0)) {
 			nouveau_gem_pushbuf_backoff(list);
@@ -326,8 +347,6 @@ retry:
 				goto out_unref;
 			goto retry;
 		}
-
-		list_add_tail(&nvbo->entry, list);
 	}
 
 	b = pbbo;
-- 
1.6.3.3
