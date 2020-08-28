From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/6] drm/nouveau: Allow zero pushbuffer submits
Date: Fri, 28 Aug 2020 12:40:16 +0200
Message-ID: <20200828104016.1672195-7-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200828104016.1672195-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These are useful in cases where only a fence is to be created to wait
for existing jobs in the command stream.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 197 +++++++++++++-------------
 1 file changed, 99 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index b3ece731e4e1..c70a045d7141 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -816,9 +816,9 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_nouveau_gem_pushbuf *req = &request->base;
-	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
-	struct drm_nouveau_gem_pushbuf_bo *bo;
+	struct drm_nouveau_gem_pushbuf_push *push = NULL;
+	struct drm_nouveau_gem_pushbuf_bo *bo = NULL;
 	struct drm_nouveau_gem_fence *fences = NULL;
 	struct nouveau_channel *chan = NULL;
 	struct validate_op op;
@@ -850,8 +850,6 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 
 	req->vram_available = drm->gem.vram_available;
 	req->gart_available = drm->gem.gart_available;
-	if (unlikely(req->nr_push == 0))
-		goto out_next;
 
 	if (unlikely(req->nr_push > NOUVEAU_GEM_MAX_PUSH)) {
 		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
@@ -871,33 +869,35 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		return nouveau_abi16_put(abi16, -EINVAL);
 	}
 
-	push = u_memcpya(req->push, req->nr_push, sizeof(*push));
-	if (IS_ERR(push))
-		return nouveau_abi16_put(abi16, PTR_ERR(push));
+	if (req->nr_push > 0) {
+		push = u_memcpya(req->push, req->nr_push, sizeof(*push));
+		if (IS_ERR(push))
+			return nouveau_abi16_put(abi16, PTR_ERR(push));
 
-	bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
-	if (IS_ERR(bo)) {
-		u_free(push);
-		return nouveau_abi16_put(abi16, PTR_ERR(bo));
-	}
+		bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
+		if (IS_ERR(bo)) {
+			u_free(push);
+			return nouveau_abi16_put(abi16, PTR_ERR(bo));
+		}
 
-	/* Ensure all push buffers are on validate list */
-	for (i = 0; i < req->nr_push; i++) {
-		if (push[i].bo_index >= req->nr_buffers) {
-			NV_PRINTK(err, cli, "push %d buffer not in list\n", i);
-			ret = -EINVAL;
-			goto out_prevalid;
+		/* Ensure all push buffers are on validate list */
+		for (i = 0; i < req->nr_push; i++) {
+			if (push[i].bo_index >= req->nr_buffers) {
+				NV_PRINTK(err, cli, "push %d buffer not in list\n", i);
+				ret = -EINVAL;
+				goto out_prevalid;
+			}
 		}
-	}
 
-	/* Validate buffer list */
+		/* Validate buffer list */
 revalidate:
-	ret = nouveau_gem_pushbuf_validate(chan, file_priv, bo,
-					   req->nr_buffers, &op, &do_reloc);
-	if (ret) {
-		if (ret != -ERESTARTSYS)
-			NV_PRINTK(err, cli, "validate: %d\n", ret);
-		goto out_prevalid;
+		ret = nouveau_gem_pushbuf_validate(chan, file_priv, bo,
+						   req->nr_buffers, &op, &do_reloc);
+		if (ret) {
+			if (ret != -ERESTARTSYS)
+				NV_PRINTK(err, cli, "validate: %d\n", ret);
+			goto out_prevalid;
+		}
 	}
 
 	if (request->num_fences > 0) {
@@ -915,89 +915,89 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	}
 
 	/* Apply any relocations that are required */
-	if (do_reloc) {
-		if (!reloc) {
-			validate_fini(&op, chan, NULL, bo);
-			reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
-			if (IS_ERR(reloc)) {
-				ret = PTR_ERR(reloc);
-				goto out_prevalid;
-			}
+	if (req->nr_push > 0) {
+		if (do_reloc) {
+			if (!reloc) {
+				validate_fini(&op, chan, NULL, bo);
+				reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
+				if (IS_ERR(reloc)) {
+					ret = PTR_ERR(reloc);
+					goto out_prevalid;
+				}
 
-			goto revalidate;
-		}
+				goto revalidate;
+			}
 
-		ret = nouveau_gem_pushbuf_reloc_apply(cli, req, reloc, bo);
-		if (ret) {
-			NV_PRINTK(err, cli, "reloc apply: %d\n", ret);
-			goto out;
+			ret = nouveau_gem_pushbuf_reloc_apply(cli, req, reloc, bo);
+			if (ret) {
+				NV_PRINTK(err, cli, "reloc apply: %d\n", ret);
+				goto out;
+			}
 		}
-	}
 
-	if (chan->dma.ib_max) {
-		ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
-		if (ret) {
-			NV_PRINTK(err, cli, "nv50cal_space: %d\n", ret);
-			goto out;
-		}
+		if (chan->dma.ib_max) {
+			ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
+			if (ret) {
+				NV_PRINTK(err, cli, "nv50cal_space: %d\n", ret);
+				goto out;
+			}
 
-		for (i = 0; i < req->nr_push; i++) {
-			struct nouveau_vma *vma = (void *)(unsigned long)
-				bo[push[i].bo_index].user_priv;
+			for (i = 0; i < req->nr_push; i++) {
+				struct nouveau_vma *vma = (void *)(unsigned long)
+					bo[push[i].bo_index].user_priv;
 
-			nv50_dma_push(chan, vma->addr + push[i].offset,
-				      push[i].length);
-		}
-	} else
-	if (drm->client.device.info.chipset >= 0x25) {
-		ret = PUSH_WAIT(chan->chan.push, req->nr_push * 2);
-		if (ret) {
-			NV_PRINTK(err, cli, "cal_space: %d\n", ret);
-			goto out;
-		}
+				nv50_dma_push(chan, vma->addr + push[i].offset,
+					      push[i].length);
+			}
+		} else if (drm->client.device.info.chipset >= 0x25) {
+			ret = PUSH_WAIT(chan->chan.push, req->nr_push * 2);
+			if (ret) {
+				NV_PRINTK(err, cli, "cal_space: %d\n", ret);
+				goto out;
+			}
 
-		for (i = 0; i < req->nr_push; i++) {
-			struct nouveau_bo *nvbo = (void *)(unsigned long)
-				bo[push[i].bo_index].user_priv;
+			for (i = 0; i < req->nr_push; i++) {
+				struct nouveau_bo *nvbo = (void *)(unsigned long)
+					bo[push[i].bo_index].user_priv;
 
-			PUSH_CALL(chan->chan.push, nvbo->offset + push[i].offset);
-			PUSH_DATA(chan->chan.push, 0);
-		}
-	} else {
-		ret = PUSH_WAIT(chan->chan.push, req->nr_push * (2 + NOUVEAU_DMA_SKIPS));
-		if (ret) {
-			NV_PRINTK(err, cli, "jmp_space: %d\n", ret);
-			goto out;
-		}
+				PUSH_CALL(chan->chan.push, nvbo->offset + push[i].offset);
+				PUSH_DATA(chan->chan.push, 0);
+			}
+		} else {
+			ret = PUSH_WAIT(chan->chan.push, req->nr_push * (2 + NOUVEAU_DMA_SKIPS));
+			if (ret) {
+				NV_PRINTK(err, cli, "jmp_space: %d\n", ret);
+				goto out;
+			}
 
-		for (i = 0; i < req->nr_push; i++) {
-			struct nouveau_bo *nvbo = (void *)(unsigned long)
-				bo[push[i].bo_index].user_priv;
-			uint32_t cmd;
-
-			cmd = chan->push.addr + ((chan->dma.cur + 2) << 2);
-			cmd |= 0x20000000;
-			if (unlikely(cmd != req->suffix0)) {
-				if (!nvbo->kmap.virtual) {
-					ret = ttm_bo_kmap(&nvbo->bo, 0,
-							  nvbo->bo.mem.
-							  num_pages,
-							  &nvbo->kmap);
-					if (ret) {
-						WIND_RING(chan);
-						goto out;
+			for (i = 0; i < req->nr_push; i++) {
+				struct nouveau_bo *nvbo = (void *)(unsigned long)
+					bo[push[i].bo_index].user_priv;
+				uint32_t cmd;
+
+				cmd = chan->push.addr + ((chan->dma.cur + 2) << 2);
+				cmd |= 0x20000000;
+				if (unlikely(cmd != req->suffix0)) {
+					if (!nvbo->kmap.virtual) {
+						ret = ttm_bo_kmap(&nvbo->bo, 0,
+								  nvbo->bo.mem.num_pages,
+								  &nvbo->kmap);
+						if (ret) {
+							WIND_RING(chan);
+							goto out;
+						}
+						nvbo->validate_mapped = true;
 					}
-					nvbo->validate_mapped = true;
-				}
 
-				nouveau_bo_wr32(nvbo, (push[i].offset +
-						push[i].length - 8) / 4, cmd);
-			}
+					nouveau_bo_wr32(nvbo, (push[i].offset +
+							push[i].length - 8) / 4, cmd);
+				}
 
-			PUSH_JUMP(chan->chan.push, nvbo->offset + push[i].offset);
-			PUSH_DATA(chan->chan.push, 0);
-			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
+				PUSH_JUMP(chan->chan.push, nvbo->offset + push[i].offset);
 				PUSH_DATA(chan->chan.push, 0);
+				for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
+					PUSH_DATA(chan->chan.push, 0);
+			}
 		}
 	}
 
@@ -1031,7 +1031,9 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 out:
 	u_free(fences);
 
-	validate_fini(&op, chan, fence, bo);
+	if (req->nr_push > 0)
+		validate_fini(&op, chan, fence, bo);
+
 	nouveau_fence_unref(&fence);
 
 	if (do_reloc) {
@@ -1054,7 +1056,6 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	u_free(bo);
 	u_free(push);
 
-out_next:
 	if (chan->dma.ib_max) {
 		req->suffix0 = 0x00000000;
 		req->suffix1 = 0x00000000;
-- 
2.28.0
