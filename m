From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v6 4/6] mm/mmu_notifier: add mmu_interval_notifier_find()
Date: Mon, 13 Jan 2020 14:47:01 -0800
Message-ID: <20200113224703.5917-5-rcampbell@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20200113224703.5917-1-rcampbell@nvidia.com>
Sender: owner-linux-mm@kvack.org
To: linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew
 Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Shuah
 Khan <shuah@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

Device drivers may or may not have a convenient range based data structure
to look up and find intervals that are registered with the mmu interval
notifiers. Rather than forcing drivers to duplicate the interval tree,
provide an API to look up intervals that are registered and accessor
functions to return the start and last address of the interval.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/mmu_notifier.h | 15 +++++++++++++++
 mm/mmu_notifier.c            | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 0ce59b4f22c2..cdbbad13b278 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -314,6 +314,21 @@ void mmu_interval_notifier_remove(struct mmu_interval_=
notifier *mni);
 void mmu_interval_notifier_put(struct mmu_interval_notifier *mni);
 void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
 				  unsigned long start, unsigned long last);
+struct mmu_interval_notifier *mmu_interval_notifier_find(struct mm_struct =
*mm,
+				const struct mmu_interval_notifier_ops *ops,
+				unsigned long start, unsigned long last);
+
+static inline unsigned long mmu_interval_notifier_start(
+				struct mmu_interval_notifier *mni)
+{
+	return mni->interval_tree.start;
+}
+
+static inline unsigned long mmu_interval_notifier_last(
+				struct mmu_interval_notifier *mni)
+{
+	return mni->interval_tree.last;
+}
=20
 /**
  * mmu_interval_set_seq - Save the invalidation sequence
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 47ad9cc89aab..4efecc0f13cb 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -1171,6 +1171,39 @@ void mmu_interval_notifier_update(struct mmu_interva=
l_notifier *mni,
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
=20
+struct mmu_interval_notifier *mmu_interval_notifier_find(struct mm_struct =
*mm,
+				const struct mmu_interval_notifier_ops *ops,
+				unsigned long start, unsigned long last)
+{
+	struct mmu_notifier_mm *mmn_mm =3D mm->mmu_notifier_mm;
+	struct interval_tree_node *node;
+	struct mmu_interval_notifier *mni;
+	struct mmu_interval_notifier *res =3D NULL;
+
+	spin_lock(&mmn_mm->lock);
+	node =3D interval_tree_iter_first(&mmn_mm->itree, start, last);
+	if (node) {
+		mni =3D container_of(node, struct mmu_interval_notifier,
+				   interval_tree);
+		while (true) {
+			if (mni->ops =3D=3D ops) {
+				res =3D mni;
+				break;
+			}
+			node =3D interval_tree_iter_next(&mni->interval_tree,
+						       start, last);
+			if (!node)
+				break;
+			mni =3D container_of(node, struct mmu_interval_notifier,
+					   interval_tree);
+		}
+	}
+	spin_unlock(&mmn_mm->lock);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(mmu_interval_notifier_find);
+
 /**
  * mmu_notifier_synchronize - Ensure all mmu_notifiers are freed
  *
--=20
2.20.1
