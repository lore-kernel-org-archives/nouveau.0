From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 09/22] mm/hmm: Simplify hmm_get_or_create and make it reliable
Date: Mon,  1 Jul 2019 08:20:07 +0200
Message-ID: <20190701062020.19239-10-hch@lst.de>
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
Cc: Philip Yang <Philip.Yang-5C7GfCeVMHo@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

As coded this function can false-fail in various racy situations. Make it
reliable and simpler by running under the write side of the mmap_sem and
avoiding the false-failing compare/exchange pattern. Due to the mmap_sem
this no longer has to avoid racing with a 2nd parallel
hmm_get_or_create().

Unfortunately this still has to use the page_table_lock as the
non-sleeping lock protecting mm->hmm, since the contexts where we free the
hmm are incompatible with mmap_sem.

Signed-off-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Reviewed-by: John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Reviewed-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Tested-by: Philip Yang <Philip.Yang-5C7GfCeVMHo@public.gmane.org>
---
 mm/hmm.c | 77 ++++++++++++++++++++++----------------------------------
 1 file changed, 30 insertions(+), 47 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 080b17a2e87e..0423f4ca3a7e 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -31,16 +31,6 @@
 #if IS_ENABLED(CONFIG_HMM_MIRROR)
 static const struct mmu_notifier_ops hmm_mmu_notifier_ops;
 
-static inline struct hmm *mm_get_hmm(struct mm_struct *mm)
-{
-	struct hmm *hmm = READ_ONCE(mm->hmm);
-
-	if (hmm && kref_get_unless_zero(&hmm->kref))
-		return hmm;
-
-	return NULL;
-}
-
 /**
  * hmm_get_or_create - register HMM against an mm (HMM internal)
  *
@@ -55,11 +45,16 @@ static inline struct hmm *mm_get_hmm(struct mm_struct *mm)
  */
 static struct hmm *hmm_get_or_create(struct mm_struct *mm)
 {
-	struct hmm *hmm = mm_get_hmm(mm);
-	bool cleanup = false;
+	struct hmm *hmm;
+
+	lockdep_assert_held_exclusive(&mm->mmap_sem);
 
-	if (hmm)
-		return hmm;
+	/* Abuse the page_table_lock to also protect mm->hmm. */
+	spin_lock(&mm->page_table_lock);
+	hmm = mm->hmm;
+	if (mm->hmm && kref_get_unless_zero(&mm->hmm->kref))
+		goto out_unlock;
+	spin_unlock(&mm->page_table_lock);
 
 	hmm = kmalloc(sizeof(*hmm), GFP_KERNEL);
 	if (!hmm)
@@ -74,57 +69,45 @@ static struct hmm *hmm_get_or_create(struct mm_struct *mm)
 	hmm->notifiers = 0;
 	hmm->dead = false;
 	hmm->mm = mm;
-	mmgrab(hmm->mm);
 
-	spin_lock(&mm->page_table_lock);
-	if (!mm->hmm)
-		mm->hmm = hmm;
-	else
-		cleanup = true;
-	spin_unlock(&mm->page_table_lock);
+	hmm->mmu_notifier.ops = &hmm_mmu_notifier_ops;
+	if (__mmu_notifier_register(&hmm->mmu_notifier, mm)) {
+		kfree(hmm);
+		return NULL;
+	}
 
-	if (cleanup)
-		goto error;
+	mmgrab(hmm->mm);
 
 	/*
-	 * We should only get here if hold the mmap_sem in write mode ie on
-	 * registration of first mirror through hmm_mirror_register()
+	 * We hold the exclusive mmap_sem here so we know that mm->hmm is
+	 * still NULL or 0 kref, and is safe to update.
 	 */
-	hmm->mmu_notifier.ops = &hmm_mmu_notifier_ops;
-	if (__mmu_notifier_register(&hmm->mmu_notifier, mm))
-		goto error_mm;
-
-	return hmm;
-
-error_mm:
 	spin_lock(&mm->page_table_lock);
-	if (mm->hmm == hmm)
-		mm->hmm = NULL;
+	mm->hmm = hmm;
+
+out_unlock:
 	spin_unlock(&mm->page_table_lock);
-error:
-	mmdrop(hmm->mm);
-	kfree(hmm);
-	return NULL;
+	return hmm;
 }
 
 static void hmm_free_rcu(struct rcu_head *rcu)
 {
-	kfree(container_of(rcu, struct hmm, rcu));
+	struct hmm *hmm = container_of(rcu, struct hmm, rcu);
+
+	mmdrop(hmm->mm);
+	kfree(hmm);
 }
 
 static void hmm_free(struct kref *kref)
 {
 	struct hmm *hmm = container_of(kref, struct hmm, kref);
-	struct mm_struct *mm = hmm->mm;
 
-	mmu_notifier_unregister_no_release(&hmm->mmu_notifier, mm);
+	spin_lock(&hmm->mm->page_table_lock);
+	if (hmm->mm->hmm == hmm)
+		hmm->mm->hmm = NULL;
+	spin_unlock(&hmm->mm->page_table_lock);
 
-	spin_lock(&mm->page_table_lock);
-	if (mm->hmm == hmm)
-		mm->hmm = NULL;
-	spin_unlock(&mm->page_table_lock);
-
-	mmdrop(hmm->mm);
+	mmu_notifier_unregister_no_release(&hmm->mmu_notifier, hmm->mm);
 	mmu_notifier_call_srcu(&hmm->rcu, hmm_free_rcu);
 }
 
-- 
2.20.1
