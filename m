From: maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH 3/7] drm/nouveau: fixup locking inversion between
	mmap_sem and reservations
Date: Tue, 12 Nov 2013 13:34:10 +0100
Message-ID: <1384259656-29483-3-git-send-email-maarten.lankhorst@canonical.com>
References: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384259656-29483-1-git-send-email-maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

Allocate and copy all kernel memory before doing reservations. This prevents a locking
inversion between mmap_sem and reservation_class, and allows us to drop the trylocking
in ttm_bo_vm_fault without upsetting lockdep.

Relocations are handled by trying with __copy_from_user_inatomic first. If that fails
all validation will be undone, memory copied from userspace and all validations retried.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 188 +++++++++++++++++++++-------------
 1 file changed, 119 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f32b712..41a4bf6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -464,8 +464,6 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 	      uint64_t user_pbbo_ptr)
 {
 	struct nouveau_drm *drm = chan->drm;
-	struct drm_nouveau_gem_pushbuf_bo __user *upbbo =
-				(void __force __user *)(uintptr_t)user_pbbo_ptr;
 	struct nouveau_bo *nvbo;
 	int ret, relocs = 0;
 
@@ -499,7 +497,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 			return ret;
 		}
 
-		if (nv_device(drm->device)->card_type < NV_50) {
+		if (nv_device(drm->device)->card_type < NV_50 && !relocs) {
 			if (nvbo->bo.offset == b->presumed.offset &&
 			    ((nvbo->bo.mem.mem_type == TTM_PL_VRAM &&
 			      b->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
@@ -507,32 +505,53 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 			      b->presumed.domain & NOUVEAU_GEM_DOMAIN_GART)))
 				continue;
 
-			if (nvbo->bo.mem.mem_type == TTM_PL_TT)
-				b->presumed.domain = NOUVEAU_GEM_DOMAIN_GART;
-			else
-				b->presumed.domain = NOUVEAU_GEM_DOMAIN_VRAM;
-			b->presumed.offset = nvbo->bo.offset;
-			b->presumed.valid = 0;
-			relocs++;
-
-			if (DRM_COPY_TO_USER(&upbbo[nvbo->pbbo_index].presumed,
-					     &b->presumed, sizeof(b->presumed)))
-				return -EFAULT;
+			relocs = 1;
 		}
 	}
 
 	return relocs;
 }
 
+static inline void *
+u_memcpya(uint64_t user, unsigned nmemb, unsigned size, unsigned inatomic)
+{
+	void *mem;
+	void __user *userptr = (void __force __user *)(uintptr_t)user;
+
+	mem = drm_malloc_ab(size, nmemb);
+	if (!mem)
+		return ERR_PTR(-ENOMEM);
+	size *= nmemb;
+
+	if (inatomic && (!access_ok(VERIFY_READ, userptr, size) ||
+	    __copy_from_user_inatomic(mem, userptr, size))) {
+		drm_free_large(mem);
+		return ERR_PTR(-EFAULT);
+	} else if (!inatomic && copy_from_user(mem, userptr, size)) {
+		drm_free_large(mem);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return mem;
+}
+
+static int
+nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
+				struct drm_nouveau_gem_pushbuf *req,
+				struct drm_nouveau_gem_pushbuf_bo *bo,
+				struct drm_nouveau_gem_pushbuf_reloc *reloc);
+
 static int
 nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 			     struct drm_file *file_priv,
 			     struct drm_nouveau_gem_pushbuf_bo *pbbo,
+			     struct drm_nouveau_gem_pushbuf *req,
 			     uint64_t user_buffers, int nr_buffers,
-			     struct validate_op *op, int *apply_relocs)
+			     struct validate_op *op, int *do_reloc)
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	int ret, relocs = 0;
+	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 
 	INIT_LIST_HEAD(&op->vram_list);
 	INIT_LIST_HEAD(&op->gart_list);
@@ -541,19 +560,19 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	if (nr_buffers == 0)
 		return 0;
 
+restart:
 	ret = validate_init(chan, file_priv, pbbo, nr_buffers, op);
 	if (unlikely(ret)) {
 		if (ret != -ERESTARTSYS)
 			NV_ERROR(cli, "validate_init\n");
-		return ret;
+		goto err;
 	}
 
 	ret = validate_list(chan, cli, &op->vram_list, pbbo, user_buffers);
 	if (unlikely(ret < 0)) {
 		if (ret != -ERESTARTSYS)
 			NV_ERROR(cli, "validate vram_list\n");
-		validate_fini(op, NULL);
-		return ret;
+		goto err_fini;
 	}
 	relocs += ret;
 
@@ -561,8 +580,7 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	if (unlikely(ret < 0)) {
 		if (ret != -ERESTARTSYS)
 			NV_ERROR(cli, "validate gart_list\n");
-		validate_fini(op, NULL);
-		return ret;
+		goto err_fini;
 	}
 	relocs += ret;
 
@@ -570,58 +588,90 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 	if (unlikely(ret < 0)) {
 		if (ret != -ERESTARTSYS)
 			NV_ERROR(cli, "validate both_list\n");
-		validate_fini(op, NULL);
-		return ret;
+		goto err_fini;
 	}
 	relocs += ret;
+	if (relocs) {
+		if (!reloc)
+			reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc), 1);
+		if (IS_ERR(reloc)) {
+			validate_fini(op, NULL);
+
+			if (PTR_ERR(reloc) == -EFAULT) {
+				reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc), 0);
+				if (!IS_ERR(reloc))
+					goto restart;
+			}
+
+			return PTR_ERR(reloc);
+		}
+
+		ret = nouveau_gem_pushbuf_reloc_apply(cli, req, pbbo, reloc);
+		if (ret) {
+			NV_ERROR(cli, "reloc apply: %d\n", ret);
+			goto err_fini;
+		}
+		drm_free_large(reloc);
+		*do_reloc = 1;
+	}
 
-	*apply_relocs = relocs;
 	return 0;
-}
 
-static inline void
-u_free(void *addr)
-{
-	if (!is_vmalloc_addr(addr))
-		kfree(addr);
-	else
-		vfree(addr);
+err_fini:
+	validate_fini(op, NULL);
+err:
+	drm_free_large(reloc);
+	return ret;
 }
 
-static inline void *
-u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
+static int
+nouveau_gem_pushbuf_reloc_copy_to_user(struct drm_nouveau_gem_pushbuf *req,
+				       struct drm_nouveau_gem_pushbuf_bo *bo)
 {
-	void *mem;
-	void __user *userptr = (void __force __user *)(uintptr_t)user;
-
-	size *= nmemb;
+	struct drm_nouveau_gem_pushbuf_bo __user *upbbo =
+				 (void __force __user *)(uintptr_t)req->buffers;
+	unsigned i;
 
-	mem = kmalloc(size, GFP_KERNEL | __GFP_NOWARN);
-	if (!mem)
-		mem = vmalloc(size);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
+	for (i = 0; i < req->nr_buffers; ++i) {
+		struct drm_nouveau_gem_pushbuf_bo *b = &bo[i];
 
-	if (DRM_COPY_FROM_USER(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
+		if (!b->presumed.valid &&
+		    copy_to_user(&upbbo[i].presumed, &b->presumed, sizeof(b->presumed)))
+			return -EFAULT;
 	}
-
-	return mem;
+	return 0;
 }
 
 static int
 nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf *req,
-				struct drm_nouveau_gem_pushbuf_bo *bo)
+				struct drm_nouveau_gem_pushbuf_bo *bo,
+				struct drm_nouveau_gem_pushbuf_reloc *reloc)
 {
-	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	int ret = 0;
 	unsigned i;
 
-	reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
-	if (IS_ERR(reloc))
-		return PTR_ERR(reloc);
+	for (i = 0; i < req->nr_buffers; ++i) {
+		struct drm_nouveau_gem_pushbuf_bo *b = &bo[i];
+		struct nouveau_bo *nvbo = (void *)(unsigned long)
+			bo[i].user_priv;
+
+		if (nvbo->bo.offset == b->presumed.offset &&
+		    ((nvbo->bo.mem.mem_type == TTM_PL_VRAM &&
+		      b->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
+		     (nvbo->bo.mem.mem_type == TTM_PL_TT &&
+		      b->presumed.domain & NOUVEAU_GEM_DOMAIN_GART))) {
+			b->presumed.valid = 1;
+			continue;
+		}
+
+		if (nvbo->bo.mem.mem_type == TTM_PL_TT)
+			b->presumed.domain = NOUVEAU_GEM_DOMAIN_GART;
+		else
+			b->presumed.domain = NOUVEAU_GEM_DOMAIN_VRAM;
+		b->presumed.offset = nvbo->bo.offset;
+		b->presumed.valid = 0;
+	}
 
 	for (i = 0; i < req->nr_relocs; i++) {
 		struct drm_nouveau_gem_pushbuf_reloc *r = &reloc[i];
@@ -688,8 +738,6 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 
 		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
 	}
-
-	u_free(reloc);
 	return ret;
 }
 
@@ -745,13 +793,13 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		return nouveau_abi16_put(abi16, -EINVAL);
 	}
 
-	push = u_memcpya(req->push, req->nr_push, sizeof(*push));
+	push = u_memcpya(req->push, req->nr_push, sizeof(*push), 0);
 	if (IS_ERR(push))
 		return nouveau_abi16_put(abi16, PTR_ERR(push));
 
-	bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
+	bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo), 0);
 	if (IS_ERR(bo)) {
-		u_free(push);
+		drm_free_large(push);
 		return nouveau_abi16_put(abi16, PTR_ERR(bo));
 	}
 
@@ -765,7 +813,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	}
 
 	/* Validate buffer list */
-	ret = nouveau_gem_pushbuf_validate(chan, file_priv, bo, req->buffers,
+	ret = nouveau_gem_pushbuf_validate(chan, file_priv, bo, req, req->buffers,
 					   req->nr_buffers, &op, &do_reloc);
 	if (ret) {
 		if (ret != -ERESTARTSYS)
@@ -773,15 +821,6 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		goto out_prevalid;
 	}
 
-	/* Apply any relocations that are required */
-	if (do_reloc) {
-		ret = nouveau_gem_pushbuf_reloc_apply(cli, req, bo);
-		if (ret) {
-			NV_ERROR(cli, "reloc apply: %d\n", ret);
-			goto out;
-		}
-	}
-
 	if (chan->dma.ib_max) {
 		ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
 		if (ret) {
@@ -861,9 +900,20 @@ out:
 	validate_fini(&op, fence);
 	nouveau_fence_unref(&fence);
 
+	if (do_reloc && !ret) {
+		ret = nouveau_gem_pushbuf_reloc_copy_to_user(req, bo);
+		if (ret) {
+			NV_ERROR(cli, "error copying presumed back to userspace: %d\n", ret);
+			/*
+			 * XXX: We return -EFAULT, but command submission
+			 * has already been completed.
+			 */
+		}
+	}
+
 out_prevalid:
-	u_free(bo);
-	u_free(push);
+	drm_free_large(bo);
+	drm_free_large(push);
 
 out_next:
 	if (chan->dma.ib_max) {
-- 
1.8.4
