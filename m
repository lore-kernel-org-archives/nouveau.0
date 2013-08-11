From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Sun, 11 Aug 2013 18:04:16 +1000
Message-ID: <1376208256.32100.117.camel@pasglop>
References: <1372740099.4820.24.camel@pasglop>
	<CAPM=9txvRW5MM849FVqOoSL28g=+hTDiLWaMtn5Kj-X3h1kJ8g@mail.gmail.com>
	<1376175111.32100.53.camel@pasglop> <1376179046.32100.60.camel@pasglop>
	<1376181670.32100.77.camel@pasglop>
	<1376199396.32100.106.camel@pasglop>
	<52072C7C.8040104@canonical.com> <1376204790.32100.109.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1376204790.32100.109.camel@pasglop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
List-Id: nouveau.vger.kernel.org

On Sun, 2013-08-11 at 17:06 +1000, Benjamin Herrenschmidt wrote:

> I think I found at least two cases where "12" was used where it should
> have been PAGE_SHIFT (basically ttm_mem_reg->num_pages). This
> is only the tip of the iceberg, so this isn't a formal patch submission,
> but I would appreciate your thought as to whether the below is correct
> (and thus I'm on the right track) :

This patch (which needs cleanups, and probably be broken down for
bisectability) makes it work for me. I've disabled nouveau_dri for now
as this has its own problems related to Ajax recent gallium endian
changes.

Note the horrible duplication of nouveau_vm_map_sg...

I think to fix it "cleanly" we probably need to slightly change the
->map_sg API to the vmmr. However, I do have a question whose answer
might make things a LOT easier if "yes" can make things a lot easier:

Can we guarantee that that such an sg object (I assume this is always
a ttm_bo getting placed in the "TT" memory, correct ?) has an alignment
in *card VM space* that is a multiple of the *system page size* ? Ie,
can we make that happen easily ?

For example, if my system page size is 64k, can we guarantee that it
will always be mapped in the card at a virtual address that is 64k
aligned ?

If that is the case, then we *know* that a given page in the page list
passed to nouveau_vm_map_sg() will never cross a pde boundary (will
always be fully contained in the bottom level of the page table). That
allows to simplify the code a bit, and maybe to write a unified function
that can still pass down page lists to the vmmr....

On the other hand, if we have to handle misalignment, then we may as
well stick to 1 PTE at a time like my patch does to avoid horrible
complications.

Cheers,
Ben.

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c
index 5c7433d..c314a5f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c
@@ -190,8 +190,8 @@ nv40_fifo_chan_ctor(struct nouveau_object *parent,
 	if (size < sizeof(*args))
 		return -EINVAL;
 
-	ret = nouveau_fifo_channel_create(parent, engine, oclass, 0, 0xc00000,
-					  0x1000, args->pushbuf,
+	ret = nouveau_fifo_channel_create(parent, engine, oclass, 0, 0x800000,
+					  0x10000, args->pushbuf,
 					  (1ULL << NVDEV_ENGINE_DMAOBJ) |
 					  (1ULL << NVDEV_ENGINE_SW) |
 					  (1ULL << NVDEV_ENGINE_GR) |
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
index ef3133e..5833851 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
@@ -84,10 +84,11 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
 {
 	struct nouveau_vm *vm = vma->vm;
 	struct nouveau_vmmgr *vmm = vm->vmm;
-	int big = vma->node->type != vmm->spg_shift;
+	u32 shift = vma->node->type;
+	int big = shift != vmm->spg_shift;
 	u32 offset = vma->node->offset + (delta >> 12);
-	u32 bits = vma->node->type - 12;
-	u32 num  = length >> vma->node->type;
+	u32 bits = shift - 12;
+	u32 num  = length >> shift;
 	u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
 	u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
 	u32 max  = 1 << (vmm->pgt_bits - bits);
@@ -98,7 +99,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
 
 	for_each_sg(mem->sg->sgl, sg, mem->sg->nents, i) {
 		struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
-		sglen = sg_dma_len(sg) >> PAGE_SHIFT;
+		sglen = sg_dma_len(sg) >> shift;
 
 		end = pte + sglen;
 		if (unlikely(end >= max))
@@ -106,7 +107,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
 		len = end - pte;
 
 		for (m = 0; m < len; m++) {
-			dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);
+			dma_addr_t addr = sg_dma_address(sg) + (m << shift);
 
 			vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
 			num--;
@@ -121,7 +122,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
 		}
 		if (m < sglen) {
 			for (; m < sglen; m++) {
-				dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);
+				dma_addr_t addr = sg_dma_address(sg) + (m << shift);
 
 				vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
 				num--;
@@ -136,6 +137,7 @@ finish:
 	vmm->flush(vm);
 }
 
+#if PAGE_SHIFT == 12
 void
 nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
 		  struct nouveau_mem *mem)
@@ -143,10 +145,11 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
 	struct nouveau_vm *vm = vma->vm;
 	struct nouveau_vmmgr *vmm = vm->vmm;
 	dma_addr_t *list = mem->pages;
-	int big = vma->node->type != vmm->spg_shift;
+	u32 shift = vma->node->type;
+	int big = shift != vmm->spg_shift;
 	u32 offset = vma->node->offset + (delta >> 12);
-	u32 bits = vma->node->type - 12;
-	u32 num  = length >> vma->node->type;
+	u32 bits = shift - 12;
+	u32 num  = length >> shift;
 	u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
 	u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
 	u32 max  = 1 << (vmm->pgt_bits - bits);
@@ -173,6 +176,52 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
 
 	vmm->flush(vm);
 }
+#else
+void
+nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
+		  struct nouveau_mem *mem)
+{
+	struct nouveau_vm *vm = vma->vm;
+	struct nouveau_vmmgr *vmm = vm->vmm;
+	dma_addr_t *list = mem->pages;
+	u32 shift = vma->node->type;
+	int big = shift != vmm->spg_shift;
+	u32 offset = vma->node->offset + (delta >> 12);
+	u32 bits = shift - 12;
+	u32 num  = length >> shift;
+	u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
+	u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
+	u32 max  = 1 << (vmm->pgt_bits - bits);
+	u32 sub_cnt = 1 << (PAGE_SHIFT - shift);
+	u32 sub_rem = 0;
+	u64 phys = 0;
+
+
+	/* XXX This will not work for a big mapping ! */
+	WARN_ON_ONCE(big);
+
+	while (num) {
+		struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
+
+		if (sub_rem == 0) {
+			phys = *(list++);
+			sub_rem = sub_cnt;
+		}
+		vmm->map_sg(vma, pgt, mem, pte, 1, &phys);
+
+		num  -= 1;
+		pte  += 1;
+		sub_rem -= 1;
+		phys += 1 << shift;
+		if (unlikely(pte >= max)) {
+			pde++;
+			pte = 0;
+		}
+	}
+
+	vmm->flush(vm);
+}
+#endif
 
 void
 nouveau_vm_unmap_at(struct nouveau_vma *vma, u64 delta, u64 length)
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
index ed45437..f7e2311 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
@@ -39,14 +39,10 @@ nv04_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
 {
 	pte = 0x00008 + (pte * 4);
 	while (cnt) {
-		u32 page = PAGE_SIZE / NV04_PDMA_PAGE;
 		u32 phys = (u32)*list++;
-		while (cnt && page--) {
-			nv_wo32(pgt, pte, phys | 3);
-			phys += NV04_PDMA_PAGE;
-			pte += 4;
-			cnt -= 1;
-		}
+		nv_wo32(pgt, pte, phys | 3);
+		pte += 4;
+		cnt -= 1;
 	}
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
index 064c762..a78f624 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
@@ -43,14 +43,10 @@ nv41_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
 {
 	pte = pte * 4;
 	while (cnt) {
-		u32 page = PAGE_SIZE / NV41_GART_PAGE;
 		u64 phys = (u64)*list++;
-		while (cnt && page--) {
-			nv_wo32(pgt, pte, (phys >> 7) | 1);
-			phys += NV41_GART_PAGE;
-			pte += 4;
-			cnt -= 1;
-		}
+		nv_wo32(pgt, pte, (phys >> 7) | 1);
+		pte += 4;
+		cnt -= 1;
 	}
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index af20fba..694024d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -226,7 +226,7 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
 	nvbo->page_shift = 12;
 	if (drm->client.base.vm) {
 		if (!(flags & TTM_PL_FLAG_TT) && size > 256 * 1024)
-			nvbo->page_shift = drm->client.base.vm->vmm->lpg_shift;
+			nvbo->page_shift = lpg_shift;
 	}
 
 	nouveau_bo_fixup_align(nvbo, flags, &align, &size);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index ca5492a..494cf88 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -31,7 +31,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *mem)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	struct nouveau_mem *node = mem->mm_node;
-	u64 size = mem->num_pages << 12;
+	u64 size = mem->num_pages << PAGE_SHIFT;
 
 	if (ttm->sg) {
 		node->sg = ttm->sg;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 19e3757..f0629de 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -252,8 +252,8 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
 
 	node->page_shift = 12;
 
-	ret = nouveau_vm_get(man->priv, mem->num_pages << 12, node->page_shift,
-			     NV_MEM_ACCESS_RW, &node->vma[0]);
+	ret = nouveau_vm_get(man->priv, mem->num_pages << PAGE_SHIFT,
+			     node->page_shift, NV_MEM_ACCESS_RW, &node->vma[0]);
 	if (ret) {
 		kfree(node);
 		return ret;
