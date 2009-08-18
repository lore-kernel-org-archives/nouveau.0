From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: fix bo access after CALL
	implementation
Date: Tue, 18 Aug 2009 16:23:38 +0300
Message-ID: <1250601818-6082-2-git-send-email-pq@iki.fi>
References: <1250601818-6082-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250601818-6082-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

TTM buffer object's virtual cookie may be an iomem cookie or a kernel
virtual address. These need to be handled separately.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 75cae79..6b150fc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -408,7 +408,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_channel *chan, int nr_bo,
 				struct drm_nouveau_gem_pushbuf_bo *bo,
 				int nr_relocs, uint64_t ptr_relocs,
 				int nr_dwords, int first_dword,
-				uint32_t *pushbuf)
+				uint32_t *pushbuf, bool is_iomem)
 {
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	struct drm_device *dev = chan->dev;
@@ -451,7 +451,11 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_channel *chan, int nr_bo,
 				data |= r->vor;
 		}
 
-		pushbuf[r->reloc_index] = data;
+		if (is_iomem)
+			iowrite32_native(data, (void __force __iomem *)
+						&pushbuf[r->reloc_index]);
+		else
+			pushbuf[r->reloc_index] = data;
 	}
 
 	kfree(reloc);
@@ -516,7 +520,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 						      bo, req->nr_relocs,
 						      req->relocs,
 						      req->nr_dwords, 0,
-						      pushbuf);
+						      pushbuf, false);
 		if (ret)
 			goto out;
 	}
@@ -669,6 +673,8 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 
 	/* Apply any relocations that are required */
 	if (do_reloc) {
+		void *pbvirt;
+		bool is_iomem;
 		ret = ttm_bo_kmap(&pbbo->bo, 0, pbbo->bo.mem.num_pages,
 				  &pbbo->kmap);
 		if (ret) {
@@ -676,17 +682,18 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
 			goto out;
 		}
 
+		pbvirt = ttm_kmap_obj_virtual(&pbbo->kmap, &is_iomem);
 		ret = nouveau_gem_pushbuf_reloc_apply(chan, req->nr_buffers, bo,
 						      req->nr_relocs,
 						      req->relocs,
 						      req->nr_dwords,
 						      req->offset / 4,
-						      pbbo->kmap.virtual);
+						      pbvirt, is_iomem);
 
 		if (!PUSHBUF_CAL) {
-			uint32_t *pushbuf = pbbo->kmap.virtual + req->offset;
-
-			pushbuf[req->nr_dwords - 2] = req->suffix0;
+			nouveau_bo_wr32(pbbo,
+					req->offset / 4 + req->nr_dwords - 2,
+					req->suffix0);
 		}
 
 		ttm_bo_kunmap(&pbbo->kmap);
-- 
1.6.3.3
