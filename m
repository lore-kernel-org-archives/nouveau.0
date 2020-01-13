From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 1/6] mm/mmu_notifier: add
 mmu_interval_notifier_insert_safe()
Date: Mon, 13 Jan 2020 14:46:58 -0800
Message-ID: <20200113224703.5917-2-rcampbell@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200113224703.5917-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

mmu_interval_notifier_insert() can't be called safely from inside the
invalidate() callback because it can acquire the mmap_sem lock which
might already be held. Insertion might be needed when the invalidate()
callback creates a "hole" in the interval being tracked (i.e., the event
type MMU_NOTIFY_UNMAP) and the interval needs to be split in order to
continue receiving callbacks for the remaining left and right intervals.

Add a new function mmu_interval_notifier_insert_safe() which can be called
from the invalidate() callback.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/mmu_notifier.h |  4 ++++
 mm/mmu_notifier.c            | 45 ++++++++++++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 9e6caa8ecd19..027c9c8f3a69 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -299,6 +299,10 @@ int mmu_interval_notifier_insert_locked(
 	struct mmu_interval_notifier *mni, struct mm_struct *mm,
 	unsigned long start, unsigned long length,
 	const struct mmu_interval_notifier_ops *ops);
+int mmu_interval_notifier_insert_safe(
+	struct mmu_interval_notifier *mni, struct mm_struct *mm,
+	unsigned long start, unsigned long length,
+	const struct mmu_interval_notifier_ops *ops);
 void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni);
 
 /**
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index f76ea05b1cb0..a5ff19cd1bc5 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -913,16 +913,17 @@ static int __mmu_interval_notifier_insert(
 /**
  * mmu_interval_notifier_insert - Insert an interval notifier
  * @mni: Interval notifier to register
+ * @mm: mm_struct to attach to
  * @start: Starting virtual address to monitor
  * @length: Length of the range to monitor
- * @mm : mm_struct to attach to
+ * @ops: Interval notifier callback operations
  *
  * This function subscribes the interval notifier for notifications from the
- * mm.  Upon return the ops related to mmu_interval_notifier will be called
+ * mm.  Upon return, the ops related to mmu_interval_notifier will be called
  * whenever an event that intersects with the given range occurs.
  *
- * Upon return the range_notifier may not be present in the interval tree yet.
- * The caller must use the normal interval notifier read flow via
+ * Upon return, the mmu_interval_notifier may not be present in the interval
+ * tree yet.  The caller must use the normal interval notifier read flow via
  * mmu_interval_read_begin() to establish SPTEs for this range.
  */
 int mmu_interval_notifier_insert(struct mmu_interval_notifier *mni,
@@ -969,6 +970,42 @@ int mmu_interval_notifier_insert_locked(
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert_locked);
 
+/**
+ * mmu_interval_notifier_insert_safe - Insert an interval notifier
+ * @mni: Interval notifier to register
+ * @mm: mm_struct to attach to
+ * @start: Starting virtual address to monitor
+ * @length: Length of the range to monitor
+ * @ops: Interval notifier callback operations
+ *
+ * Return: -EINVAL if @mm hasn't been initialized for interval notifiers
+ *	by calling mmu_notifier_register(NULL, mm) or
+ *	__mmu_notifier_register(NULL, mm).
+ *
+ * This function subscribes the interval notifier for notifications from the
+ * mm.  Upon return, the ops related to mmu_interval_notifier will be called
+ * whenever an event that intersects with the given range occurs.
+ *
+ * This function is safe to call from the ops->invalidate() function.
+ * Upon return, the mmu_interval_notifier may not be present in the interval
+ * tree yet.  The caller must use the normal interval notifier read flow via
+ * mmu_interval_read_begin() to establish SPTEs for this range.
+ */
+int mmu_interval_notifier_insert_safe(
+	struct mmu_interval_notifier *mni, struct mm_struct *mm,
+	unsigned long start, unsigned long length,
+	const struct mmu_interval_notifier_ops *ops)
+{
+	struct mmu_notifier_mm *mmn_mm;
+
+	mmn_mm = mm->mmu_notifier_mm;
+	if (!mmn_mm || !mmn_mm->has_itree)
+		return -EINVAL;
+	return __mmu_interval_notifier_insert(mni, mm, mmn_mm, start, length,
+					      ops);
+}
+EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert_safe);
+
 /**
  * mmu_interval_notifier_remove - Remove a interval notifier
  * @mni: Interval notifier to unregister
-- 
2.20.1
