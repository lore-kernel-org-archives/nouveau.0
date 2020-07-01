From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 4/5] nouveau/hmm: support mapping large sysmem
 pages
Date: Wed, 1 Jul 2020 15:53:51 -0700
Message-ID: <20200701225352.9649-5-rcampbell@nvidia.com>
References: <20200701225352.9649-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200701225352.9649-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Nouveau currently only supports mapping PAGE_SIZE sized pages of system
memory when shared virtual memory (SVM) is enabled. Use the new
hmm_pfn_to_map_order() function to support mapping system memory pages
that are PMD_SIZE.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 53 ++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 665dede69bd1..c5f8ca6fb2e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -514,38 +514,57 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
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
+	 * consistent (e.g., CPU only maps part of a compound page).
+	 * Note that the underlying page might still be larger than the
+	 * CPU mapping (e.g., a PUD sized compound page partially mapped with
+	 * a PMD sized page table entry).
+	 */
+	if (hmm_pfn_to_map_order(range->hmm_pfns[0])) {
+		unsigned long addr = args->p.addr;
+
+		args->p.page = hmm_pfn_to_map_order(range->hmm_pfns[0]) +
+				PAGE_SHIFT;
+		args->p.size = 1UL << args->p.page;
+		args->p.addr &= ~(args->p.size - 1);
+		page -= (addr - args->p.addr) >> PAGE_SHIFT;
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
@@ -585,10 +604,10 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		break;
 	}
 
-	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
+	nouveau_hmm_convert_pfn(drm, &range, args);
 
 	svmm->vmm->vmm.object.client->super = true;
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
+	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
 	svmm->vmm->vmm.object.client->super = false;
 	mutex_unlock(&svmm->mutex);
 
@@ -717,12 +736,13 @@ nouveau_svm_fault(struct nvif_notify *notify)
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
@@ -730,9 +750,16 @@ nouveau_svm_fault(struct nvif_notify *notify)
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
 
-- 
2.20.1
