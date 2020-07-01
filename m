From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/5] mm/hmm: add hmm_mapping order
Date: Wed, 1 Jul 2020 15:53:49 -0700
Message-ID: <20200701225352.9649-3-rcampbell@nvidia.com>
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

hmm_range_fault() returns an array of page frame numbers and flags for
how the pages are mapped in the requested process' page tables. The PFN
can be used to get the struct page with hmm_pfn_to_page() and the page
size order can be determined with compound_order(page) but if the page
is larger than order 0 (PAGE_SIZE), there is no indication that a
compound page is mapped by the CPU using a larger page size. Without
this information, the caller can't safely use a large device PTE to map
the compound page because the CPU might be using smaller PTEs with
different read/write permissions.

Add a new function hmm_pfn_to_map_order() to return the mapping size
order so that callers know the pages are being mapped with consistent
permissions and a large device page table mapping can be used if one is
available.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/hmm.h | 24 ++++++++++++++++++++++--
 mm/hmm.c            | 14 +++++++++++---
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index f4a09ed223ac..e7a21a21f11f 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -37,16 +37,17 @@
  *                     will fail. Must be combined with HMM_PFN_REQ_FAULT.
  */
 enum hmm_pfn_flags {
-	/* Output flags */
+	/* Output fields and flags */
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 8),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
 	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
 
-	HMM_PFN_FLAGS = HMM_PFN_VALID | HMM_PFN_WRITE | HMM_PFN_ERROR,
+	HMM_PFN_FLAGS = 0xFFUL << HMM_PFN_ORDER_SHIFT,
 };
 
 /*
@@ -61,6 +62,25 @@ static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
 	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
 }
 
+/*
+ * hmm_pfn_to_map_order() - return the CPU mapping size order
+ *
+ * The hmm_pfn entry returned by hmm_range_fault() is for a PAGE_SIZE
+ * address range. hmm_pfn_to_map_order() lets the caller know that the
+ * underlying physical page order is at least as large as the return value and
+ * that the CPU has mapped that physical range with the same permissions so
+ * that a device MMU mapping of up to the size of the return value can be
+ * used without giving the device more access than the CPU process.
+ *
+ * This must be called under the caller 'user_lock' after a successful
+ * mmu_interval_read_begin(). The caller must have tested for HMM_PFN_VALID
+ * already.
+ */
+static inline unsigned int hmm_pfn_to_map_order(unsigned long hmm_pfn)
+{
+	return (hmm_pfn >> HMM_PFN_ORDER_SHIFT) & 0x1F;
+}
+
 /*
  * struct hmm_range - track invalidation lock on virtual address range
  *
diff --git a/mm/hmm.c b/mm/hmm.c
index e9a545751108..de04bbed47b3 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -170,7 +170,10 @@ static inline unsigned long pmd_to_hmm_pfn_flags(struct hmm_range *range,
 {
 	if (pmd_protnone(pmd))
 		return 0;
-	return pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
+	return ((unsigned long)(PMD_SHIFT - PAGE_SHIFT) <<
+			HMM_PFN_ORDER_SHIFT) |
+		pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
+				 HMM_PFN_VALID;
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -389,7 +392,10 @@ static inline unsigned long pud_to_hmm_pfn_flags(struct hmm_range *range,
 {
 	if (!pud_present(pud))
 		return 0;
-	return pud_write(pud) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
+	return ((unsigned long)(PUD_SHIFT - PAGE_SHIFT) <<
+			HMM_PFN_ORDER_SHIFT) |
+		pud_write(pud) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
+				 HMM_PFN_VALID;
 }
 
 static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
@@ -468,13 +474,15 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	unsigned long cpu_flags;
 	spinlock_t *ptl;
 	pte_t entry;
+	unsigned long horder = huge_page_order(hstate_vma(vma));
 
 	ptl = huge_pte_lock(hstate_vma(vma), walk->mm, pte);
 	entry = huge_ptep_get(pte);
 
 	i = (start - range->start) >> PAGE_SHIFT;
 	pfn_req_flags = range->hmm_pfns[i];
-	cpu_flags = pte_to_hmm_pfn_flags(range, entry);
+	cpu_flags = pte_to_hmm_pfn_flags(range, entry) |
+			(horder << HMM_PFN_ORDER_SHIFT);
 	required_fault =
 		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
 	if (required_fault) {
-- 
2.20.1
