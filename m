From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/5] mm/hmm: add output flags for PMD/PUD page
 mapping
Date: Tue, 30 Jun 2020 12:57:34 -0700
Message-ID: <20200630195737.8667-3-rcampbell@nvidia.com>
References: <20200630195737.8667-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200630195737.8667-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Add two new output flags to indicate the mapping size (PMD or PUD sized)
so that callers know the pages are being mapped with consistent permissions
and a large device page table mapping can be used if one is available.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/hmm.h | 11 ++++++++++-
 mm/hmm.c            | 13 +++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index f4a09ed223ac..bd250edc7048 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -28,6 +28,12 @@
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_PMD   - if HMM_PFN_VALID is set, the page is at least of size
+ *                 PMD_SIZE and fully mapped by the CPU with consistent
+ *                 protection (e.g., all writeable if HMM_PFN_WRITE is set).
+ * HMM_PFN_PUD   - if HMM_PFN_VALID is set, the page is at least of size
+ *                 PUD_SIZE and fully mapped by the CPU with consistent
+ *                 protection (e.g., all writeable if HMM_PFN_WRITE is set).
  *
  * On input:
  * 0                 - Return the current state of the page, do not fault it.
@@ -41,12 +47,15 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_PMD = 1UL << (BITS_PER_LONG - 4),
+	HMM_PFN_PUD = 1UL << (BITS_PER_LONG - 5),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
 	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
 
-	HMM_PFN_FLAGS = HMM_PFN_VALID | HMM_PFN_WRITE | HMM_PFN_ERROR,
+	HMM_PFN_FLAGS = HMM_PFN_VALID | HMM_PFN_WRITE | HMM_PFN_ERROR |
+			HMM_PFN_PMD | HMM_PFN_PUD,
 };
 
 /*
diff --git a/mm/hmm.c b/mm/hmm.c
index e9a545751108..d9de95450be3 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -170,7 +170,9 @@ static inline unsigned long pmd_to_hmm_pfn_flags(struct hmm_range *range,
 {
 	if (pmd_protnone(pmd))
 		return 0;
-	return pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
+	return pmd_write(pmd) ?
+			(HMM_PFN_VALID | HMM_PFN_PMD | HMM_PFN_WRITE) :
+			(HMM_PFN_VALID | HMM_PFN_PMD);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -389,7 +391,9 @@ static inline unsigned long pud_to_hmm_pfn_flags(struct hmm_range *range,
 {
 	if (!pud_present(pud))
 		return 0;
-	return pud_write(pud) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
+	return pud_write(pud) ?
+			(HMM_PFN_VALID | HMM_PFN_PUD | HMM_PFN_WRITE) :
+			(HMM_PFN_VALID | HMM_PFN_PUD);
 }
 
 static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
@@ -468,6 +472,7 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	unsigned long cpu_flags;
 	spinlock_t *ptl;
 	pte_t entry;
+	unsigned int hshift = huge_page_shift(hstate_vma(vma));
 
 	ptl = huge_pte_lock(hstate_vma(vma), walk->mm, pte);
 	entry = huge_ptep_get(pte);
@@ -475,6 +480,10 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	i = (start - range->start) >> PAGE_SHIFT;
 	pfn_req_flags = range->hmm_pfns[i];
 	cpu_flags = pte_to_hmm_pfn_flags(range, entry);
+	if (hshift >= PUD_SHIFT)
+		cpu_flags |= HMM_PFN_PUD;
+	else if (hshift >= PMD_SHIFT)
+		cpu_flags |= HMM_PFN_PMD;
 	required_fault =
 		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
 	if (required_fault) {
-- 
2.20.1
