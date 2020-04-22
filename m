From: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Subject: [PATCH hmm 0/5] Adjust hmm_range_fault() API
Date: Tue, 21 Apr 2020 21:21:41 -0300
Message-ID: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

The API is a bit complicated for the uses we actually have, and
disucssions for simplifying have come up a number of times.

This small series removes the customizable pfn format and simplifies the
return code of hmm_range_fault()

All the drivers are adjusted to process in the simplified format.
I would appreciated tested-by's for the two drivers, thanks!

This passes the hmm tester with the following diff:

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index d75e18f2ffd245..a2442efa038c41 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -47,23 +47,8 @@ struct dmirror_bounce {
 	unsigned long		cpages;
 };
 
-#define DPT_SHIFT PAGE_SHIFT
-#define DPT_VALID (1UL << 0)
-#define DPT_WRITE (1UL << 1)
-
 #define DPT_XA_TAG_WRITE 3UL
 
-static const uint64_t dmirror_hmm_flags[HMM_PFN_FLAG_MAX] = {
-	[HMM_PFN_VALID] = DPT_VALID,
-	[HMM_PFN_WRITE] = DPT_WRITE,
-};
-
-static const uint64_t dmirror_hmm_values[HMM_PFN_VALUE_MAX] = {
-	[HMM_PFN_NONE]    = 0,
-	[HMM_PFN_ERROR]   = 0x10,
-	[HMM_PFN_SPECIAL] = 0x10,
-};
-
 /*
  * Data structure to track address ranges and register for mmu interval
  * notifier updates.
@@ -175,7 +160,7 @@ static inline struct dmirror_device *dmirror_page_to_device(struct page *page)
 
 static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
 {
-	uint64_t *pfns = range->pfns;
+	unsigned long *pfns = range->hmm_pfns;
 	unsigned long pfn;
 
 	for (pfn = (range->start >> PAGE_SHIFT);
@@ -188,15 +173,16 @@ static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
 		 * Since we asked for hmm_range_fault() to populate pages,
 		 * it shouldn't return an error entry on success.
 		 */
-		WARN_ON(*pfns == range->values[HMM_PFN_ERROR]);
+		WARN_ON(*pfns & HMM_PFN_ERROR);
+		WARN_ON(!(*pfns & HMM_PFN_VALID));
 
-		page = hmm_device_entry_to_page(range, *pfns);
+		page = hmm_pfn_to_page(*pfns);
 		WARN_ON(!page);
 
 		entry = page;
-		if (*pfns & range->flags[HMM_PFN_WRITE])
+		if (*pfns & HMM_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		else if (range->default_flags & range->flags[HMM_PFN_WRITE])
+		else if (WARN_ON(range->default_flags & HMM_PFN_WRITE))
 			return -EFAULT;
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
 		if (xa_is_err(entry))
@@ -260,8 +246,6 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 	int ret;
 
 	while (true) {
-		long count;
-
 		if (time_after(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
@@ -269,12 +253,11 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 
 		range->notifier_seq = mmu_interval_read_begin(range->notifier);
 		down_read(&mm->mmap_sem);
-		count = hmm_range_fault(range);
+		ret = hmm_range_fault(range);
 		up_read(&mm->mmap_sem);
-		if (count <= 0) {
-			if (count == 0 || count == -EBUSY)
+		if (ret) {
+			if (ret == -EBUSY)
 				continue;
-			ret = count;
 			goto out;
 		}
 
@@ -299,16 +282,13 @@ static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
 {
 	struct mm_struct *mm = dmirror->notifier.mm;
 	unsigned long addr;
-	uint64_t pfns[64];
+	unsigned long pfns[64];
 	struct hmm_range range = {
 		.notifier = &dmirror->notifier,
-		.pfns = pfns,
-		.flags = dmirror_hmm_flags,
-		.values = dmirror_hmm_values,
-		.pfn_shift = DPT_SHIFT,
+		.hmm_pfns = pfns,
 		.pfn_flags_mask = 0,
-		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
-				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
+		.default_flags =
+			HMM_PFN_REQ_FAULT | (write ? HMM_PFN_REQ_WRITE : 0),
 		.dev_private_owner = dmirror->mdevice,
 	};
 	int ret = 0;
@@ -754,19 +734,20 @@ static int dmirror_migrate(struct dmirror *dmirror,
 }
 
 static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
-			    unsigned char *perm, uint64_t entry)
+			    unsigned char *perm, unsigned long entry)
 {
 	struct page *page;
 
-	if (entry == range->values[HMM_PFN_ERROR]) {
+	if (entry & HMM_PFN_ERROR) {
 		*perm = HMM_DMIRROR_PROT_ERROR;
 		return;
 	}
-	page = hmm_device_entry_to_page(range, entry);
-	if (!page) {
+	if (!(entry & HMM_PFN_VALID)) {
 		*perm = HMM_DMIRROR_PROT_NONE;
 		return;
 	}
+
+	page = hmm_pfn_to_page(entry);
 	if (is_device_private_page(page)) {
 		/* Is the page migrated to this device or some other? */
 		if (dmirror->mdevice == dmirror_page_to_device(page))
@@ -777,7 +758,7 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 		*perm = HMM_DMIRROR_PROT_ZERO;
 	else
 		*perm = HMM_DMIRROR_PROT_NONE;
-	if (entry & range->flags[HMM_PFN_WRITE])
+	if (entry & HMM_PFN_WRITE)
 		*perm |= HMM_DMIRROR_PROT_WRITE;
 	else
 		*perm |= HMM_DMIRROR_PROT_READ;
@@ -832,8 +813,6 @@ static int dmirror_range_snapshot(struct dmirror *dmirror,
 		return ret;
 
 	while (true) {
-		long count;
-
 		if (time_after(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
@@ -842,12 +821,11 @@ static int dmirror_range_snapshot(struct dmirror *dmirror,
 		range->notifier_seq = mmu_interval_read_begin(range->notifier);
 
 		down_read(&mm->mmap_sem);
-		count = hmm_range_fault(range);
+		ret = hmm_range_fault(range);
 		up_read(&mm->mmap_sem);
-		if (count <= 0) {
-			if (count == 0 || count == -EBUSY)
+		if (ret) {
+			if (ret == -EBUSY)
 				continue;
-			ret = count;
 			goto out;
 		}
 
@@ -862,7 +840,7 @@ static int dmirror_range_snapshot(struct dmirror *dmirror,
 
 	n = (range->end - range->start) >> PAGE_SHIFT;
 	for (i = 0; i < n; i++)
-		dmirror_mkentry(dmirror, range, perm + i, range->pfns[i]);
+		dmirror_mkentry(dmirror, range, perm + i, range->hmm_pfns[i]);
 
 	mutex_unlock(&dmirror->mutex);
 out:
@@ -878,15 +856,11 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	unsigned long addr;
 	unsigned long next;
-	uint64_t pfns[64];
+	unsigned long pfns[64];
 	unsigned char perm[64];
 	char __user *uptr;
 	struct hmm_range range = {
-		.pfns = pfns,
-		.flags = dmirror_hmm_flags,
-		.values = dmirror_hmm_values,
-		.pfn_shift = DPT_SHIFT,
-		.pfn_flags_mask = 0,
+		.hmm_pfns = pfns,
 		.dev_private_owner = dmirror->mdevice,
 	};
 	int ret = 0;
@@ -1097,6 +1071,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 	spin_lock_init(&mdevice->lock);
 
 	cdev_init(&mdevice->cdevice, &dmirror_fops);
+	mdevice->cdevice.owner = THIS_MODULE;
 	ret = cdev_add(&mdevice->cdevice, dev, 1);
 	if (ret)
 		return ret;
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 033a12c7ab5b6d..da15471a2bbf9a 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1274,7 +1274,7 @@ TEST_F(hmm2, snapshot)
 	/* Check what the device saw. */
 	m = buffer->mirror;
 	ASSERT_EQ(m[0], HMM_DMIRROR_PROT_ERROR);
-	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_NONE);
+	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_ERROR);
 	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);

Jason Gunthorpe (5):
  mm/hmm: make CONFIG_DEVICE_PRIVATE into a select
  mm/hmm: make hmm_range_fault return 0 or -1
  drm/amdgpu: remove dead code after hmm_range_fault()
  mm/hmm: remove HMM_PFN_SPECIAL
  mm/hmm: remove the customizable pfn format from hmm_range_fault

 Documentation/vm/hmm.rst                |  28 ++--
 arch/powerpc/Kconfig                    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  56 +++----
 drivers/gpu/drm/nouveau/Kconfig         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  60 ++++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.h  |   4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  59 ++++----
 include/linux/hmm.h                     | 109 +++++---------
 mm/Kconfig                              |   7 +-
 mm/hmm.c                                | 185 +++++++++++-------------
 10 files changed, 229 insertions(+), 283 deletions(-)

-- 
2.26.0
