From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 4/4] mm: check the device private page owner in hmm_range_fault
Date: Mon, 16 Mar 2020 20:32:16 +0100
Message-ID: <20200316193216.920734-5-hch@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200316193216.920734-1-hch@lst.de>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

Hmm range fault will succeed for any kind of device private memory,
even if it doesn't belong to the calling entity.  While nouveau
has some crude checks for that, they are broken because they assume
nouveau is the only user of device private memory.  Fix this by
passing in an expected pgmap owner in the hmm_range_fault structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Fixes: 4ef589dc9b10 ("mm/hmm/devmem: device memory hotplug using ZONE_DEVICE")
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 12 ------------
 include/linux/hmm.h                    |  2 ++
 mm/hmm.c                               | 10 +++++++++-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index edfd0805fba4..ad89e09a0be3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -672,12 +672,6 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	return ret;
 }
 
-static inline bool
-nouveau_dmem_page(struct nouveau_drm *drm, struct page *page)
-{
-	return is_device_private_page(page) && drm->dmem == page_to_dmem(page);
-}
-
 void
 nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 			 struct hmm_range *range)
@@ -696,12 +690,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 		if (!is_device_private_page(page))
 			continue;
 
-		if (!nouveau_dmem_page(drm, page)) {
-			WARN(1, "Some unknown device memory !\n");
-			range->pfns[i] = 0;
-			continue;
-		}
-
 		addr = nouveau_dmem_page_addr(page);
 		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
 		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 5e6034f105c3..bb6be4428633 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -132,6 +132,7 @@ enum hmm_pfn_value_e {
  * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
  * @pfn_shifts: pfn shift value (should be <= PAGE_SHIFT)
  * @valid: pfns array did not change since it has been fill by an HMM function
+ * @dev_private_owner: owner of device private pages
  */
 struct hmm_range {
 	struct mmu_interval_notifier *notifier;
@@ -144,6 +145,7 @@ struct hmm_range {
 	uint64_t		default_flags;
 	uint64_t		pfn_flags_mask;
 	uint8_t			pfn_shift;
+	void			*dev_private_owner;
 };
 
 /*
diff --git a/mm/hmm.c b/mm/hmm.c
index cfad65f6a67b..b75b3750e03d 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -216,6 +216,14 @@ int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		unsigned long end, uint64_t *pfns, pmd_t pmd);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static inline bool hmm_is_device_private_entry(struct hmm_range *range,
+		swp_entry_t entry)
+{
+	return is_device_private_entry(entry) &&
+		device_private_entry_to_page(entry)->pgmap->owner ==
+		range->dev_private_owner;
+}
+
 static inline uint64_t pte_to_hmm_pfn_flags(struct hmm_range *range, pte_t pte)
 {
 	if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
@@ -254,7 +262,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 * Never fault in device private pages pages, but just report
 		 * the PFN even if not present.
 		 */
-		if (is_device_private_entry(entry)) {
+		if (hmm_is_device_private_entry(range, entry)) {
 			*pfn = hmm_device_entry_from_pfn(range,
 					    swp_offset(entry));
 			*pfn |= range->flags[HMM_PFN_VALID];
-- 
2.24.1
