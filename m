From: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Subject: [PATCH hmm 4/5] mm/hmm: remove HMM_PFN_SPECIAL
Date: Tue, 21 Apr 2020 21:21:45 -0300
Message-ID: <4-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "Kuehling, Felix" <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Niranjana Vishwanathapura <niranjana.vishwanathapura-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

This is just an alias for HMM_PFN_ERROR, nothing cares that the error was
because of a special page vs any other error case.

Signed-off-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_svm.c   | 1 -
 include/linux/hmm.h                     | 8 --------
 mm/hmm.c                                | 2 +-
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index bff8e64701a547..449083f9f8a2bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -775,7 +775,6 @@ static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
 static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
 	0xfffffffffffffffeUL, /* HMM_PFN_ERROR */
 	0, /* HMM_PFN_NONE */
-	0xfffffffffffffffcUL /* HMM_PFN_SPECIAL */
 };
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index c68e9317cf0740..cf0d9bd61bebf9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -379,7 +379,6 @@ static const u64
 nouveau_svm_pfn_values[HMM_PFN_VALUE_MAX] = {
 	[HMM_PFN_ERROR  ] = ~NVIF_VMM_PFNMAP_V0_V,
 	[HMM_PFN_NONE   ] =  NVIF_VMM_PFNMAP_V0_NONE,
-	[HMM_PFN_SPECIAL] = ~NVIF_VMM_PFNMAP_V0_V,
 };
 
 /* Issue fault replay for GPU to retry accesses that faulted previously. */
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 0df27dd03d53d7..81c302c884c0e3 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -44,10 +44,6 @@ enum hmm_pfn_flag_e {
  * Flags:
  * HMM_PFN_ERROR: corresponding CPU page table entry points to poisoned memory
  * HMM_PFN_NONE: corresponding CPU page table entry is pte_none()
- * HMM_PFN_SPECIAL: corresponding CPU page table entry is special; i.e., the
- *      result of vmf_insert_pfn() or vm_insert_page(). Therefore, it should not
- *      be mirrored by a device, because the entry will never have HMM_PFN_VALID
- *      set and the pfn value is undefined.
  *
  * Driver provides values for none entry, error entry, and special entry.
  * Driver can alias (i.e., use same value) error and special, but
@@ -56,12 +52,10 @@ enum hmm_pfn_flag_e {
  * HMM pfn value returned by hmm_vma_get_pfns() or hmm_vma_fault() will be:
  * hmm_range.values[HMM_PFN_ERROR] if CPU page table entry is poisonous,
  * hmm_range.values[HMM_PFN_NONE] if there is no CPU page table entry,
- * hmm_range.values[HMM_PFN_SPECIAL] if CPU page table entry is a special one
  */
 enum hmm_pfn_value_e {
 	HMM_PFN_ERROR,
 	HMM_PFN_NONE,
-	HMM_PFN_SPECIAL,
 	HMM_PFN_VALUE_MAX
 };
 
@@ -110,8 +104,6 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
 		return NULL;
 	if (entry == range->values[HMM_PFN_ERROR])
 		return NULL;
-	if (entry == range->values[HMM_PFN_SPECIAL])
-		return NULL;
 	if (!(entry & range->flags[HMM_PFN_VALID]))
 		return NULL;
 	return pfn_to_page(entry >> range->pfn_shift);
diff --git a/mm/hmm.c b/mm/hmm.c
index 4c7c396655b528..2693393dc14b30 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -301,7 +301,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			pte_unmap(ptep);
 			return -EFAULT;
 		}
-		*pfn = range->values[HMM_PFN_SPECIAL];
+		*pfn = range->values[HMM_PFN_ERROR];
 		return 0;
 	}
 
-- 
2.26.0
