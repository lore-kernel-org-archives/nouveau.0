From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH hmm v2 4/5] mm/hmm: remove HMM_PFN_SPECIAL
Date: Fri,  1 May 2020 15:20:47 -0300
Message-ID: <4-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
References: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>
List-Id: nouveau.vger.kernel.org

From: Jason Gunthorpe <jgg@mellanox.com>

This is just an alias for HMM_PFN_ERROR, nothing cares that the error was
because of a special page vs any other error case.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_svm.c   | 1 -
 include/linux/hmm.h                     | 8 --------
 mm/hmm.c                                | 2 +-
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 41ae7f96f48194..76b4a4fa39ed04 100644
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
index f06bcac948a79b..2e975eedb14f89 100644
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
2.26.2
