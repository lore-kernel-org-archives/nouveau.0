From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 3/6] mm/notifier: add mmu_interval_notifier_update()
Date: Mon, 13 Jan 2020 14:47:00 -0800
Message-ID: <20200113224703.5917-4-rcampbell@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200113224703.5917-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When using mmu interval notifiers, the underlying VMA range that the
interval is tracking might be expanded or shrunk. Add a helper function
to allow the interval to be updated safely from the ops->invalidate()
callback in response to VMA range changes. This is effectively removing
and inserting the mmu interval notifier but more efficient.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/mmu_notifier.h |  4 +++
 mm/mmu_notifier.c            | 69 ++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 6dcaa632eef7..0ce59b4f22c2 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -251,6 +251,8 @@ struct mmu_interval_notifier {
 	struct mm_struct *mm;
 	struct hlist_node deferred_item;
 	unsigned long invalidate_seq;
+	unsigned long updated_start;
+	unsigned long updated_last;
 };
=20
 #ifdef CONFIG_MMU_NOTIFIER
@@ -310,6 +312,8 @@ int mmu_interval_notifier_insert_safe(
 	const struct mmu_interval_notifier_ops *ops);
 void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni);
 void mmu_interval_notifier_put(struct mmu_interval_notifier *mni);
+void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
+				  unsigned long start, unsigned long last);
=20
 /**
  * mmu_interval_set_seq - Save the invalidation sequence
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 40c837ae8d90..47ad9cc89aab 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -157,7 +157,14 @@ static void mn_itree_inv_end(struct mmu_notifier_mm *m=
mn_mm)
 		else {
 			interval_tree_remove(&mni->interval_tree,
 					     &mmn_mm->itree);
-			if (mni->ops->release)
+			if (mni->updated_last) {
+				mni->interval_tree.start =3D mni->updated_start;
+				mni->interval_tree.last =3D mni->updated_last;
+				mni->updated_start =3D 0;
+				mni->updated_last =3D 0;
+				interval_tree_insert(&mni->interval_tree,
+						     &mmn_mm->itree);
+			} else if (mni->ops->release)
 				hlist_add_head(&mni->deferred_item,
 					       &removed_list);
 		}
@@ -872,6 +879,8 @@ static int __mmu_interval_notifier_insert(
 	mni->ops =3D ops;
 	RB_CLEAR_NODE(&mni->interval_tree.rb);
 	mni->interval_tree.start =3D start;
+	mni->updated_start =3D 0;
+	mni->updated_last =3D 0;
 	/*
 	 * Note that the representation of the intervals in the interval tree
 	 * considers the ending point as contained in the interval.
@@ -1038,8 +1047,12 @@ static unsigned long __mmu_interval_notifier_put(
 		if (RB_EMPTY_NODE(&mni->interval_tree.rb)) {
 			hlist_del(&mni->deferred_item);
 		} else {
-			hlist_add_head(&mni->deferred_item,
-				       &mmn_mm->deferred_list);
+			if (mni->updated_last) {
+				mni->updated_start =3D 0;
+				mni->updated_last =3D 0;
+			} else
+				hlist_add_head(&mni->deferred_item,
+					       &mmn_mm->deferred_list);
 			seq =3D mmn_mm->invalidate_seq;
 		}
 	} else {
@@ -1108,6 +1121,56 @@ void mmu_interval_notifier_put(struct mmu_interval_n=
otifier *mni)
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_put);
=20
+/**
+ * mmu_interval_notifier_update - Update interval notifier range
+ * @mni: Interval notifier to update
+ * @start: New starting virtual address to monitor
+ * @last: New last virtual address (inclusive) to monitor
+ *
+ * This function updates the range being monitored and is safe to call fro=
m
+ * the invalidate() callback function.
+ * Upon return, the mmu_interval_notifier range may not be updated in the
+ * interval tree yet. The caller must use the normal interval notifier rea=
d
+ * flow via mmu_interval_read_begin() to establish SPTEs for this range.
+ */
+void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
+				  unsigned long start, unsigned long last)
+{
+	struct mm_struct *mm =3D mni->mm;
+	struct mmu_notifier_mm *mmn_mm =3D mm->mmu_notifier_mm;
+	unsigned long seq =3D 0;
+
+	if (WARN_ON(start >=3D last))
+		return;
+
+	spin_lock(&mmn_mm->lock);
+	if (mn_itree_is_invalidating(mmn_mm)) {
+		/*
+		 * Update is being called after insert put this on the
+		 * deferred list, but before the deferred list was processed.
+		 */
+		if (RB_EMPTY_NODE(&mni->interval_tree.rb)) {
+			mni->interval_tree.start =3D start;
+			mni->interval_tree.last =3D last;
+		} else {
+			if (!mni->updated_last)
+				hlist_add_head(&mni->deferred_item,
+					       &mmn_mm->deferred_list);
+			mni->updated_start =3D start;
+			mni->updated_last =3D last;
+		}
+		seq =3D mmn_mm->invalidate_seq;
+	} else {
+		WARN_ON(RB_EMPTY_NODE(&mni->interval_tree.rb));
+		interval_tree_remove(&mni->interval_tree, &mmn_mm->itree);
+		mni->interval_tree.start =3D start;
+		mni->interval_tree.last =3D last;
+		interval_tree_insert(&mni->interval_tree, &mmn_mm->itree);
+	}
+	spin_unlock(&mmn_mm->lock);
+}
+EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
+
 /**
  * mmu_notifier_synchronize - Ensure all mmu_notifiers are freed
  *
--=20
2.20.1
