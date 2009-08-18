From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: minor gem cleanups
Date: Tue, 18 Aug 2009 16:23:37 +0300
Message-ID: <1250601818-6082-1-git-send-email-pq@iki.fi>
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
List-Id: nouveau.vger.kernel.org

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 64e59fb..75cae79 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -595,7 +595,7 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 
 	bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
 	if (IS_ERR(bo))
-		return (unsigned long)bo;
+		return PTR_ERR(bo);
 
 	mutex_lock(&dev->struct_mutex);
 
@@ -622,7 +622,7 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 		ret = -EINVAL;
 		goto out;
 	}
-	pbbo = gem->driver_private;
+	pbbo = nouveau_gem_object(gem);
 
 	ret = ttm_bo_reserve(&pbbo->bo, false, false, true,
 			     chan->fence.sequence);
@@ -669,7 +669,8 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 
 	/* Apply any relocations that are required */
 	if (do_reloc) {
-		ret = ttm_bo_kmap(&pbbo->bo, 0, pbbo->bo.mem.num_pages, &pbbo->kmap);
+		ret = ttm_bo_kmap(&pbbo->bo, 0, pbbo->bo.mem.num_pages,
+				  &pbbo->kmap);
 		if (ret) {
 			NV_ERROR(dev, "kmap pb: %d\n", ret);
 			goto out;
-- 
1.6.3.3
