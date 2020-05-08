From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] nouveau/hmm: support mapping large sysmem
 pages
Date: Fri, 8 May 2020 12:20:08 -0700
Message-ID: <20200508192009.15302-6-rcampbell@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200508192009.15302-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Nouveau currently only supports mapping PAGE_SIZE sized pages of system
memory when shared virtual memory (SVM) is enabled. Use the new
HMM_PFN_COMPOUND flag that hmm_range_fault() returns to support mapping
system memory pages larger than PAGE_SIZE.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 47 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |  4 ++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |  2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  8 ++--
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 29 ++++++++----
 5 files changed, 66 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a87b9347d6ce..f9892e71a960 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -514,38 +514,51 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
 };
 
 static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
-				    struct hmm_range *range, u64 *ioctl_addr)
+				    struct hmm_range *range,
+				    struct nouveau_pfnmap_args *args)
 {
 	struct page *page;
 
 	/*
-	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
+	 * The address prepared here is passed through nvif_object_ioctl()
 	 * to an eventual DMA map in something like gp100_vmm_pgt_pfn()
 	 *
 	 * This is all just encoding the internal hmm representation into a
 	 * different nouveau internal representation.
 	 */
 	if (!(range->hmm_pfns[0] & HMM_PFN_VALID)) {
-		ioctl_addr[0] = 0;
+		args->p.phys[0] = 0;
 		return;
 	}
 
 	page = hmm_pfn_to_page(range->hmm_pfns[0]);
+	/*
+	 * Only map compound pages to the GPU if the CPU is also mapping the
+	 * page as a compound page. Otherwise, the PTE protections might not be
+	 * consistent (i.e., CPU only maps part of a compound page).
+	 */
+	if (range->hmm_pfns[0] & HMM_PFN_COMPOUND) {
+		page = compound_head(page);
+		args->p.page = page_shift(page);
+		args->p.size = 1UL << args->p.page;
+		args->p.addr &= ~(args->p.size - 1);
+	}
 	if (is_device_private_page(page))
-		ioctl_addr[0] = nouveau_dmem_page_addr(page) |
+		args->p.phys[0] = nouveau_dmem_page_addr(page) |
 				NVIF_VMM_PFNMAP_V0_V |
 				NVIF_VMM_PFNMAP_V0_VRAM;
 	else
-		ioctl_addr[0] = page_to_phys(page) |
+		args->p.phys[0] = page_to_phys(page) |
 				NVIF_VMM_PFNMAP_V0_V |
 				NVIF_VMM_PFNMAP_V0_HOST;
 	if (range->hmm_pfns[0] & HMM_PFN_WRITE)
-		ioctl_addr[0] |= NVIF_VMM_PFNMAP_V0_W;
+		args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
-			       struct nouveau_drm *drm, void *data, u32 size,
-			       u64 *ioctl_addr, unsigned long hmm_flags,
+			       struct nouveau_drm *drm,
+			       struct nouveau_pfnmap_args *args, u32 size,
+			       unsigned long hmm_flags,
 			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =
@@ -585,10 +598,10 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		break;
 	}
 
-	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
+	nouveau_hmm_convert_pfn(drm, &range, args);
 
 	svmm->vmm->vmm.object.client->super = true;
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
+	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
 	svmm->vmm->vmm.object.client->super = false;
 	mutex_unlock(&svmm->mutex);
 
@@ -716,12 +729,13 @@ nouveau_svm_fault(struct nvif_notify *notify)
 						   args.i.p.addr, args.i.p.size,
 						   &nouveau_svm_mni_ops);
 		if (!ret) {
-			ret = nouveau_range_fault(svmm, svm->drm, &args,
-				sizeof(args), args.phys, hmm_flags, &notifier);
+			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
+				sizeof(args), hmm_flags, &notifier);
 			mmu_interval_notifier_remove(&notifier.notifier);
 		}
 		mmput(mm);
 
+		limit = args.i.p.addr + args.i.p.size;
 		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
 			 * same SVMM as faults are ordered by access type such
@@ -729,9 +743,16 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			 *
 			 * ie. WRITE faults appear first, thus any handling of
 			 * pending READ faults will already be satisfied.
+			 * But if a large page is mapped, make sure subsequent
+			 * fault addresses have sufficient access permission.
 			 */
 			if (buffer->fault[fn]->svmm != svmm ||
-			    buffer->fault[fn]->addr >= limit)
+			    buffer->fault[fn]->addr >= limit ||
+			    (buffer->fault[fi]->access == 0 /* READ. */ &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
+			    (buffer->fault[fi]->access != 0 /* READ. */ &&
+			     buffer->fault[fi]->access != 3 /* PREFETCH. */ &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)))
 				break;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index de91e9a26172..ecea365d72ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -94,6 +94,8 @@ nvkm_mmu_ptp_get(struct nvkm_mmu *mmu, u32 size, bool zero)
 	}
 	pt->ptp = ptp;
 	pt->sub = true;
+	pt->ptei_shift = 3;
+	pt->page_shift = PAGE_SHIFT;
 
 	/* Sub-allocate from parent object, removing PTP from cache
 	 * if there's no more free slots left.
@@ -203,6 +205,8 @@ nvkm_mmu_ptc_get(struct nvkm_mmu *mmu, u32 size, u32 align, bool zero)
 		return NULL;
 	pt->ptc = ptc;
 	pt->sub = false;
+	pt->ptei_shift = 3;
+	pt->page_shift = PAGE_SHIFT;
 
 	ret = nvkm_memory_new(mmu->subdev.device, NVKM_MEM_TARGET_INST,
 			      size, align, zero, &pt->memory);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
index 479b02344271..f2162bb35bea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
@@ -55,6 +55,8 @@ struct nvkm_mmu_pt {
 	struct nvkm_memory *memory;
 	bool sub;
 	u16 base;
+	u8 ptei_shift;
+	u8 page_shift;
 	u64 addr;
 	struct list_head head;
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 67b00dcef4b8..c7581f4f313e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -562,6 +562,9 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 		/* Handle PTE updates. */
 		if (!REF_PTES || REF_PTES(&it, pfn, ptei, ptes)) {
 			struct nvkm_mmu_pt *pt = pgt->pt[type];
+
+			pt->page_shift = page->shift;
+			pt->ptei_shift = ilog2(desc->size);
 			if (MAP_PTES || CLR_PTES) {
 				if (MAP_PTES)
 					MAP_PTES(vmm, pt, ptei, ptes, map);
@@ -1204,7 +1207,6 @@ nvkm_vmm_pfn_unmap(struct nvkm_vmm *vmm, u64 addr, u64 size)
 /*TODO:
  * - Avoid PT readback (for dma_unmap etc), this might end up being dealt
  *   with inside HMM, which would be a lot nicer for us to deal with.
- * - Multiple page sizes (particularly for huge page support).
  * - Support for systems without a 4KiB page size.
  */
 int
@@ -1220,8 +1222,8 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 	/* Only support mapping where the page size of the incoming page
 	 * array matches a page size available for direct mapping.
 	 */
-	while (page->shift && page->shift != shift &&
-	       page->desc->func->pfn == NULL)
+	while (page->shift && (page->shift != shift ||
+	       page->desc->func->pfn == NULL))
 		page++;
 
 	if (!page->shift || !IS_ALIGNED(addr, 1ULL << shift) ||
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index d86287565542..94507cb2cf75 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -39,12 +39,15 @@ gp100_vmm_pfn_unmap(struct nvkm_vmm *vmm,
 
 	nvkm_kmap(pt->memory);
 	while (ptes--) {
-		u32 datalo = nvkm_ro32(pt->memory, pt->base + ptei * 8 + 0);
-		u32 datahi = nvkm_ro32(pt->memory, pt->base + ptei * 8 + 4);
+		u32 datalo = nvkm_ro32(pt->memory,
+				       pt->base + (ptei << pt->ptei_shift) + 0);
+		u32 datahi = nvkm_ro32(pt->memory,
+				       pt->base + (ptei << pt->ptei_shift) + 4);
 		u64 data   = (u64)datahi << 32 | datalo;
 		if ((data & (3ULL << 1)) != 0) {
 			addr = (data >> 8) << 12;
-			dma_unmap_page(dev, addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+			dma_unmap_page(dev, addr, 1UL << pt->page_shift,
+					DMA_BIDIRECTIONAL);
 		}
 		ptei++;
 	}
@@ -58,11 +61,14 @@ gp100_vmm_pfn_clear(struct nvkm_vmm *vmm,
 	bool dma = false;
 	nvkm_kmap(pt->memory);
 	while (ptes--) {
-		u32 datalo = nvkm_ro32(pt->memory, pt->base + ptei * 8 + 0);
-		u32 datahi = nvkm_ro32(pt->memory, pt->base + ptei * 8 + 4);
+		u32 datalo = nvkm_ro32(pt->memory,
+				       pt->base + (ptei << pt->ptei_shift) + 0);
+		u32 datahi = nvkm_ro32(pt->memory,
+				       pt->base + (ptei << pt->ptei_shift) + 4);
 		u64 data   = (u64)datahi << 32 | datalo;
 		if ((data & BIT_ULL(0)) && (data & (3ULL << 1)) != 0) {
-			VMM_WO064(pt, vmm, ptei * 8, data & ~BIT_ULL(0));
+			VMM_WO064(pt, vmm, ptei << pt->ptei_shift,
+				  data & ~BIT_ULL(0));
 			dma = true;
 		}
 		ptei++;
@@ -87,7 +93,8 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr = dma_map_page(dev, pfn_to_page(addr), 0,
-					    PAGE_SIZE, DMA_BIDIRECTIONAL);
+					    1UL << pt->page_shift,
+					    DMA_BIDIRECTIONAL);
 			if (!WARN_ON(dma_mapping_error(dev, addr))) {
 				data |= addr >> 4;
 				data |= 2ULL << 1; /* SYSTEM_COHERENT_MEMORY. */
@@ -99,7 +106,7 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 			data |= BIT_ULL(0); /* VALID. */
 		}
 
-		VMM_WO064(pt, vmm, ptei++ * 8, data);
+		VMM_WO064(pt, vmm, ptei++ << pt->ptei_shift, data);
 		map->pfn++;
 	}
 	nvkm_done(pt->memory);
@@ -264,6 +271,9 @@ gp100_vmm_desc_pd0 = {
 	.sparse = gp100_vmm_pd0_sparse,
 	.pde = gp100_vmm_pd0_pde,
 	.mem = gp100_vmm_pd0_mem,
+	.pfn = gp100_vmm_pgt_pfn,
+	.pfn_clear = gp100_vmm_pfn_clear,
+	.pfn_unmap = gp100_vmm_pfn_unmap,
 };
 
 static void
@@ -286,6 +296,9 @@ gp100_vmm_desc_pd1 = {
 	.unmap = gf100_vmm_pgt_unmap,
 	.sparse = gp100_vmm_pgt_sparse,
 	.pde = gp100_vmm_pd1_pde,
+	.pfn = gp100_vmm_pgt_pfn,
+	.pfn_clear = gp100_vmm_pfn_clear,
+	.pfn_unmap = gp100_vmm_pfn_unmap,
 };
 
 const struct nvkm_vmm_desc
-- 
2.20.1
