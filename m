From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/6] nouveau/hmm: fault one page at a time
Date: Fri, 8 May 2020 12:20:06 -0700
Message-ID: <20200508192009.15302-4-rcampbell@nvidia.com>
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

The SVM page fault handler groups faults into a range of contiguous
virtual addresses and requests hmm_range_fault() to populate and
return the page frame number of system memory mapped by the CPU.
In preparation for supporting large pages to be mapped by the GPU,
process faults one page at a time. In addition, use the hmm_range
default_flags to fix a corner case where the input hmm_pfns array
is not reinitialized after hmm_range_fault() returns -EBUSY and must
be called again.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 198 +++++++++-----------------
 1 file changed, 65 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 22f054f7ee3e..a87b9347d6ce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -516,7 +516,7 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
 static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 				    struct hmm_range *range, u64 *ioctl_addr)
 {
-	unsigned long i, npages;
+	struct page *page;
 
 	/*
 	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
@@ -525,42 +525,38 @@ static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 	 * This is all just encoding the internal hmm representation into a
 	 * different nouveau internal representation.
 	 */
-	npages = (range->end - range->start) >> PAGE_SHIFT;
-	for (i = 0; i < npages; ++i) {
-		struct page *page;
-
-		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
-			ioctl_addr[i] = 0;
-			continue;
-		}
-
-		page = hmm_pfn_to_page(range->hmm_pfns[i]);
-		if (is_device_private_page(page))
-			ioctl_addr[i] = nouveau_dmem_page_addr(page) |
-					NVIF_VMM_PFNMAP_V0_V |
-					NVIF_VMM_PFNMAP_V0_VRAM;
-		else
-			ioctl_addr[i] = page_to_phys(page) |
-					NVIF_VMM_PFNMAP_V0_V |
-					NVIF_VMM_PFNMAP_V0_HOST;
-		if (range->hmm_pfns[i] & HMM_PFN_WRITE)
-			ioctl_addr[i] |= NVIF_VMM_PFNMAP_V0_W;
+	if (!(range->hmm_pfns[0] & HMM_PFN_VALID)) {
+		ioctl_addr[0] = 0;
+		return;
 	}
+
+	page = hmm_pfn_to_page(range->hmm_pfns[0]);
+	if (is_device_private_page(page))
+		ioctl_addr[0] = nouveau_dmem_page_addr(page) |
+				NVIF_VMM_PFNMAP_V0_V |
+				NVIF_VMM_PFNMAP_V0_VRAM;
+	else
+		ioctl_addr[0] = page_to_phys(page) |
+				NVIF_VMM_PFNMAP_V0_V |
+				NVIF_VMM_PFNMAP_V0_HOST;
+	if (range->hmm_pfns[0] & HMM_PFN_WRITE)
+		ioctl_addr[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       struct nouveau_drm *drm, void *data, u32 size,
-			       unsigned long hmm_pfns[], u64 *ioctl_addr,
+			       u64 *ioctl_addr, unsigned long hmm_flags,
 			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	/* Have HMM fault pages within the fault window to the GPU. */
+	unsigned long hmm_pfns[1];
 	struct hmm_range range = {
 		.notifier = &notifier->notifier,
 		.start = notifier->notifier.interval_tree.start,
 		.end = notifier->notifier.interval_tree.last + 1,
-		.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
+		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
 	};
 	struct mm_struct *mm = notifier->notifier.mm;
@@ -575,11 +571,6 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		ret = hmm_range_fault(&range);
 		up_read(&mm->mmap_sem);
 		if (ret) {
-			/*
-			 * FIXME: the input PFN_REQ flags are destroyed on
-			 * -EBUSY, we need to regenerate them, also for the
-			 * other continue below
-			 */
 			if (ret == -EBUSY)
 				continue;
 			return ret;
@@ -614,17 +605,12 @@ nouveau_svm_fault(struct nvif_notify *notify)
 	struct nvif_object *device = &svm->drm->client.device.object;
 	struct nouveau_svmm *svmm;
 	struct {
-		struct {
-			struct nvif_ioctl_v0 i;
-			struct nvif_ioctl_mthd_v0 m;
-			struct nvif_vmm_pfnmap_v0 p;
-		} i;
-		u64 phys[16];
+		struct nouveau_pfnmap_args i;
+		u64 phys[1];
 	} args;
-	unsigned long hmm_pfns[ARRAY_SIZE(args.phys)];
-	struct vm_area_struct *vma;
+	unsigned long hmm_flags;
 	u64 inst, start, limit;
-	int fi, fn, pi, fill;
+	int fi, fn;
 	int replay = 0, ret;
 
 	/* Parse available fault buffer entries into a cache, and update
@@ -691,66 +677,52 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		 * window into a single update.
 		 */
 		start = buffer->fault[fi]->addr;
-		limit = start + (ARRAY_SIZE(args.phys) << PAGE_SHIFT);
+		limit = start + PAGE_SIZE;
 		if (start < svmm->unmanaged.limit)
 			limit = min_t(u64, limit, svmm->unmanaged.start);
-		SVMM_DBG(svmm, "wndw %016llx-%016llx", start, limit);
-
-		mm = svmm->notifier.mm;
-		if (!mmget_not_zero(mm)) {
-			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
-			continue;
-		}
 
-		/* Intersect fault window with the CPU VMA, cancelling
-		 * the fault if the address is invalid.
+		/* Prepare the GPU-side update of all pages within the
+		 * fault window, determining required pages and access
+		 * permissions based on pending faults.
 		 */
-		down_read(&mm->mmap_sem);
-		vma = find_vma_intersection(mm, start, limit);
-		if (!vma) {
-			SVMM_ERR(svmm, "wndw %016llx-%016llx", start, limit);
-			up_read(&mm->mmap_sem);
-			mmput(mm);
-			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
-			continue;
+		args.i.p.addr = start;
+		args.i.p.page = PAGE_SHIFT;
+		args.i.p.size = PAGE_SIZE;
+		/*
+		 * Determine required permissions based on GPU fault
+		 * access flags.
+		 * XXX: atomic?
+		 */
+		switch (buffer->fault[fi]->access) {
+		case 0: /* READ. */
+			hmm_flags = HMM_PFN_REQ_FAULT;
+			break;
+		case 3: /* PREFETCH. */
+			hmm_flags = 0;
+			break;
+		default:
+			hmm_flags = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
+			break;
 		}
-		start = max_t(u64, start, vma->vm_start);
-		limit = min_t(u64, limit, vma->vm_end);
-		up_read(&mm->mmap_sem);
-		SVMM_DBG(svmm, "wndw %016llx-%016llx", start, limit);
 
-		if (buffer->fault[fi]->addr != start) {
-			SVMM_ERR(svmm, "addr %016llx", buffer->fault[fi]->addr);
-			mmput(mm);
+		mm = svmm->notifier.mm;
+		if (!mmget_not_zero(mm)) {
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
 
-		/* Prepare the GPU-side update of all pages within the
-		 * fault window, determining required pages and access
-		 * permissions based on pending faults.
-		 */
-		args.i.p.page = PAGE_SHIFT;
-		args.i.p.addr = start;
-		for (fn = fi, pi = 0;;) {
-			/* Determine required permissions based on GPU fault
-			 * access flags.
-			 *XXX: atomic?
-			 */
-			switch (buffer->fault[fn]->access) {
-			case 0: /* READ. */
-				hmm_pfns[pi++] = HMM_PFN_REQ_FAULT;
-				break;
-			case 3: /* PREFETCH. */
-				hmm_pfns[pi++] = 0;
-				break;
-			default:
-				hmm_pfns[pi++] = HMM_PFN_REQ_FAULT |
-						 HMM_PFN_REQ_WRITE;
-				break;
-			}
-			args.i.p.size = pi << PAGE_SHIFT;
+		notifier.svmm = svmm;
+		ret = mmu_interval_notifier_insert(&notifier.notifier, mm,
+						   args.i.p.addr, args.i.p.size,
+						   &nouveau_svm_mni_ops);
+		if (!ret) {
+			ret = nouveau_range_fault(svmm, svm->drm, &args,
+				sizeof(args), args.phys, hmm_flags, &notifier);
+			mmu_interval_notifier_remove(&notifier.notifier);
+		}
+		mmput(mm);
 
+		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
 			 * same SVMM as faults are ordered by access type such
 			 * that only the first one needs to be handled.
@@ -758,61 +730,21 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			 * ie. WRITE faults appear first, thus any handling of
 			 * pending READ faults will already be satisfied.
 			 */
-			while (++fn < buffer->fault_nr &&
-			       buffer->fault[fn]->svmm == svmm &&
-			       buffer->fault[fn    ]->addr ==
-			       buffer->fault[fn - 1]->addr);
-
-			/* If the next fault is outside the window, or all GPU
-			 * faults have been dealt with, we're done here.
-			 */
-			if (fn >= buffer->fault_nr ||
-			    buffer->fault[fn]->svmm != svmm ||
+			if (buffer->fault[fn]->svmm != svmm ||
 			    buffer->fault[fn]->addr >= limit)
 				break;
-
-			/* Fill in the gap between this fault and the next. */
-			fill = (buffer->fault[fn    ]->addr -
-				buffer->fault[fn - 1]->addr) >> PAGE_SHIFT;
-			while (--fill)
-				hmm_pfns[pi++] = 0;
 		}
 
-		SVMM_DBG(svmm, "wndw %016llx-%016llx covering %d fault(s)",
-			 args.i.p.addr,
-			 args.i.p.addr + args.i.p.size, fn - fi);
-
-		notifier.svmm = svmm;
-		ret = mmu_interval_notifier_insert(&notifier.notifier,
-						   svmm->notifier.mm,
-						   args.i.p.addr, args.i.p.size,
-						   &nouveau_svm_mni_ops);
-		if (!ret) {
-			ret = nouveau_range_fault(
-				svmm, svm->drm, &args,
-				sizeof(args.i) + pi * sizeof(args.phys[0]),
-				hmm_pfns, args.phys, &notifier);
-			mmu_interval_notifier_remove(&notifier.notifier);
-		}
-		mmput(mm);
+		/* If handling failed completely, cancel all faults. */
+		if (ret) {
+			while (fi < fn) {
+				struct nouveau_svm_fault *fault =
+					buffer->fault[fi++];
 
-		/* Cancel any faults in the window whose pages didn't manage
-		 * to keep their valid bit, or stay writeable when required.
-		 *
-		 * If handling failed completely, cancel all faults.
-		 */
-		while (fi < fn) {
-			struct nouveau_svm_fault *fault = buffer->fault[fi++];
-			pi = (fault->addr - args.i.p.addr) >> PAGE_SHIFT;
-			if (ret ||
-			     !(args.phys[pi] & NVIF_VMM_PFNMAP_V0_V) ||
-			    (!(args.phys[pi] & NVIF_VMM_PFNMAP_V0_W) &&
-			     fault->access != 0 && fault->access != 3)) {
 				nouveau_svm_fault_cancel_fault(svm, fault);
-				continue;
 			}
+		} else
 			replay++;
-		}
 	}
 
 	/* Issue fault replay to the GPU. */
-- 
2.20.1
