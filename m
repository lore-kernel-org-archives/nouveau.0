From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH 3/5] mm/notifier: add migration invalidation type
Date: Mon, 6 Jul 2020 15:23:45 -0700
Message-ID: <20200706222347.32290-4-rcampbell@nvidia.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200706222347.32290-1-rcampbell@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

Currently migrate_vma_setup() calls mmu_notifier_invalidate_range_start()
which flushes all device private page mappings whether or not a page
is being migrated to/from device private memory. In order to not disrupt
device mappings that are not being migrated, shift the responsibility
for clearing device private mappings to the device driver and leave
CPU page table unmapping handled by migrate_vma_setup(). To support
this, the caller of migrate_vma_setup() should always set struct
migrate_vma::src_owner to a non NULL value that matches the device
private page->pgmap->owner. This value is then passed to the struct
mmu_notifier_range with a new event type which the driver's invalidation
function can use to avoid device MMU invalidations.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/mmu_notifier.h | 7 +++++++
 mm/migrate.c                 | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index fc68f3570e19..bd0b34dbe4de 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -38,6 +38,10 @@ struct mmu_interval_notifier;
  *
  * @MMU_NOTIFY_RELEASE: used during mmu_interval_notifier invalidate to si=
gnal
  * that the mm refcount is zero and the range is no longer accessible.
+ *
+ * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to si=
gnal
+ * a device driver to possibly ignore the invalidation if the src_own
+ * field matches.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP =3D 0,
@@ -46,6 +50,7 @@ enum mmu_notifier_event {
 	MMU_NOTIFY_PROTECTION_PAGE,
 	MMU_NOTIFY_SOFT_DIRTY,
 	MMU_NOTIFY_RELEASE,
+	MMU_NOTIFY_MIGRATE,
 };
=20
 #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
@@ -264,6 +269,7 @@ struct mmu_notifier_range {
 	unsigned long end;
 	unsigned flags;
 	enum mmu_notifier_event event;
+	void *data;
 };
=20
 static inline int mm_has_notifiers(struct mm_struct *mm)
@@ -513,6 +519,7 @@ static inline void mmu_notifier_range_init(struct mmu_n=
otifier_range *range,
 	range->start =3D start;
 	range->end =3D end;
 	range->flags =3D flags;
+	range->data =3D NULL;
 }
=20
 #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
diff --git a/mm/migrate.c b/mm/migrate.c
index 2bbc5c4c672e..62270e6727b0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2391,8 +2391,14 @@ static void migrate_vma_collect(struct migrate_vma *=
migrate)
 {
 	struct mmu_notifier_range range;
=20
-	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL,
+	/*
+	 * Note that the src_owner is passed to the mmu notifier callback so
+	 * that the registered device driver can skip invalidating device
+	 * private page mappings that won't be migrated.
+	 */
+	mmu_notifier_range_init(&range, MMU_NOTIFY_MIGRATE, 0, migrate->vma,
 			migrate->vma->vm_mm, migrate->start, migrate->end);
+	range.data =3D migrate->src_owner;
 	mmu_notifier_invalidate_range_start(&range);
=20
 	walk_page_range(migrate->vma->vm_mm, migrate->start, migrate->end,
--=20
2.20.1
