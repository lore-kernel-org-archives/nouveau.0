From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/5] mm: move hmm_vma_fault to nouveau
Date: Wed,  3 Jul 2019 11:45:00 -0700
Message-ID: <20190703184502.16234-4-hch@lst.de>
References: <20190703184502.16234-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703184502.16234-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

hmm_vma_fault is marked as a legacy API to get rid of, but seems to suit
the current nouveau flow.  Move it to the only user in preparation for
fixing a locking bug involving caller and callee.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 54 ++++++++++++++++++++++++++-
 include/linux/hmm.h                   | 54 ---------------------------
 2 files changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 9d40114d7949..e831f4184a17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -36,6 +36,13 @@
 #include <linux/sort.h>
 #include <linux/hmm.h>
 
+/*
+ * When waiting for mmu notifiers we need some kind of time out otherwise we
+ * could potentialy wait for ever, 1000ms ie 1s sounds like a long time to
+ * wait already.
+ */
+#define NOUVEAU_RANGE_FAULT_TIMEOUT 1000
+
 struct nouveau_svm {
 	struct nouveau_drm *drm;
 	struct mutex mutex;
@@ -475,6 +482,51 @@ nouveau_svm_fault_cache(struct nouveau_svm *svm,
 		fault->inst, fault->addr, fault->access);
 }
 
+static int
+nouveau_range_fault(struct hmm_mirror *mirror, struct hmm_range *range,
+		    bool block)
+{
+	long ret;
+
+	/*
+	 * With the old API the driver must set each individual entries with
+	 * the requested flags (valid, write, ...). So here we set the mask to
+	 * keep intact the entries provided by the driver and zero out the
+	 * default_flags.
+	 */
+	range->default_flags = 0;
+	range->pfn_flags_mask = -1UL;
+
+	ret = hmm_range_register(range, mirror,
+				 range->start, range->end,
+				 PAGE_SHIFT);
+	if (ret)
+		return (int)ret;
+
+	if (!hmm_range_wait_until_valid(range, NOUVEAU_RANGE_FAULT_TIMEOUT)) {
+		/*
+		 * The mmap_sem was taken by driver we release it here and
+		 * returns -EAGAIN which correspond to mmap_sem have been
+		 * drop in the old API.
+		 */
+		up_read(&range->vma->vm_mm->mmap_sem);
+		return -EAGAIN;
+	}
+
+	ret = hmm_range_fault(range, block);
+	if (ret <= 0) {
+		if (ret == -EBUSY || !ret) {
+			/* Same as above, drop mmap_sem to match old API. */
+			up_read(&range->vma->vm_mm->mmap_sem);
+			ret = -EBUSY;
+		} else if (ret == -EAGAIN)
+			ret = -EBUSY;
+		hmm_range_unregister(range);
+		return ret;
+	}
+	return 0;
+}
+
 static int
 nouveau_svm_fault(struct nvif_notify *notify)
 {
@@ -649,7 +701,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		range.values = nouveau_svm_pfn_values;
 		range.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT;
 again:
-		ret = hmm_vma_fault(&svmm->mirror, &range, true);
+		ret = nouveau_range_fault(&svmm->mirror, &range, true);
 		if (ret == 0) {
 			mutex_lock(&svmm->mutex);
 			if (!hmm_range_unregister(&range)) {
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 6b55e59fd8e3..657606f48796 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -475,60 +475,6 @@ long hmm_range_dma_unmap(struct hmm_range *range,
 			 dma_addr_t *daddrs,
 			 bool dirty);
 
-/*
- * HMM_RANGE_DEFAULT_TIMEOUT - default timeout (ms) when waiting for a range
- *
- * When waiting for mmu notifiers we need some kind of time out otherwise we
- * could potentialy wait for ever, 1000ms ie 1s sounds like a long time to
- * wait already.
- */
-#define HMM_RANGE_DEFAULT_TIMEOUT 1000
-
-/* This is a temporary helper to avoid merge conflict between trees. */
-static inline int hmm_vma_fault(struct hmm_mirror *mirror,
-				struct hmm_range *range, bool block)
-{
-	long ret;
-
-	/*
-	 * With the old API the driver must set each individual entries with
-	 * the requested flags (valid, write, ...). So here we set the mask to
-	 * keep intact the entries provided by the driver and zero out the
-	 * default_flags.
-	 */
-	range->default_flags = 0;
-	range->pfn_flags_mask = -1UL;
-
-	ret = hmm_range_register(range, mirror,
-				 range->start, range->end,
-				 PAGE_SHIFT);
-	if (ret)
-		return (int)ret;
-
-	if (!hmm_range_wait_until_valid(range, HMM_RANGE_DEFAULT_TIMEOUT)) {
-		/*
-		 * The mmap_sem was taken by driver we release it here and
-		 * returns -EAGAIN which correspond to mmap_sem have been
-		 * drop in the old API.
-		 */
-		up_read(&range->vma->vm_mm->mmap_sem);
-		return -EAGAIN;
-	}
-
-	ret = hmm_range_fault(range, block);
-	if (ret <= 0) {
-		if (ret == -EBUSY || !ret) {
-			/* Same as above, drop mmap_sem to match old API. */
-			up_read(&range->vma->vm_mm->mmap_sem);
-			ret = -EBUSY;
-		} else if (ret == -EAGAIN)
-			ret = -EBUSY;
-		hmm_range_unregister(range);
-		return ret;
-	}
-	return 0;
-}
-
 /* Below are for HMM internal use only! Not to be used by device driver! */
 static inline void hmm_mm_init(struct mm_struct *mm)
 {
-- 
2.20.1
