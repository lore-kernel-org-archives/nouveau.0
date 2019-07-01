From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 18/22] mm: return valid info from hmm_range_unregister
Date: Mon,  1 Jul 2019 08:20:16 +0200
Message-ID: <20190701062020.19239-19-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190701062020.19239-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Checking range->valid is trivial and has no meaningful cost, but
nicely simplifies the fastpath in typical callers.  Also remove the
hmm_vma_range_done function, which now is a trivial wrapper around
hmm_range_unregister.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |  2 +-
 include/linux/hmm.h                   | 11 +----------
 mm/hmm.c                              |  6 +++++-
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 8c92374afcf2..9d40114d7949 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -652,7 +652,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		ret = hmm_vma_fault(&svmm->mirror, &range, true);
 		if (ret == 0) {
 			mutex_lock(&svmm->mutex);
-			if (!hmm_vma_range_done(&range)) {
+			if (!hmm_range_unregister(&range)) {
 				mutex_unlock(&svmm->mutex);
 				goto again;
 			}
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 0fa8ea34ccef..4b185d286c3b 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -465,7 +465,7 @@ int hmm_range_register(struct hmm_range *range,
 		       unsigned long start,
 		       unsigned long end,
 		       unsigned page_shift);
-void hmm_range_unregister(struct hmm_range *range);
+bool hmm_range_unregister(struct hmm_range *range);
 long hmm_range_snapshot(struct hmm_range *range);
 long hmm_range_fault(struct hmm_range *range, bool block);
 long hmm_range_dma_map(struct hmm_range *range,
@@ -487,15 +487,6 @@ long hmm_range_dma_unmap(struct hmm_range *range,
  */
 #define HMM_RANGE_DEFAULT_TIMEOUT 1000
 
-/* This is a temporary helper to avoid merge conflict between trees. */
-static inline bool hmm_vma_range_done(struct hmm_range *range)
-{
-	bool ret = hmm_range_valid(range);
-
-	hmm_range_unregister(range);
-	return ret;
-}
-
 /* This is a temporary helper to avoid merge conflict between trees. */
 static inline int hmm_vma_fault(struct hmm_mirror *mirror,
 				struct hmm_range *range, bool block)
diff --git a/mm/hmm.c b/mm/hmm.c
index de35289df20d..c85ed7d4e2ce 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -920,11 +920,14 @@ EXPORT_SYMBOL(hmm_range_register);
  *
  * Range struct is used to track updates to the CPU page table after a call to
  * hmm_range_register(). See include/linux/hmm.h for how to use it.
+ *
+ * Returns if the range was still valid at the time of unregistering.
  */
-void hmm_range_unregister(struct hmm_range *range)
+bool hmm_range_unregister(struct hmm_range *range)
 {
 	struct hmm *hmm = range->hmm;
 	unsigned long flags;
+	bool ret = range->valid;
 
 	spin_lock_irqsave(&hmm->ranges_lock, flags);
 	list_del_init(&range->list);
@@ -941,6 +944,7 @@ void hmm_range_unregister(struct hmm_range *range)
 	 */
 	range->valid = false;
 	memset(&range->hmm, POISON_INUSE, sizeof(range->hmm));
+	return ret;
 }
 EXPORT_SYMBOL(hmm_range_unregister);
 
-- 
2.20.1
