From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH 1/2] ext4/xfs: add page refcount helper
Date: Fri, 25 Sep 2020 13:44:41 -0700
Message-ID: <20200925204442.31348-2-rcampbell@nvidia.com>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200925204442.31348-1-rcampbell@nvidia.com>
To: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

There are several places where ZONE_DEVICE struct pages assume a reference
count =3D=3D 1 means the page is idle and free. Instead of open coding this=
,
add a helper function to hide this detail.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 fs/dax.c            | 8 ++++----
 fs/ext4/inode.c     | 2 +-
 fs/xfs/xfs_file.c   | 2 +-
 include/linux/dax.h | 5 +++++
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 994ab66a9907..8eddbcc0e149 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct =
address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page =3D pfn_to_page(pfn);
=20
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
 		WARN_ON_ONCE(page->mapping && page->mapping !=3D mapping);
 		page->mapping =3D NULL;
 		page->index =3D 0;
@@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page =3D pfn_to_page(pfn);
=20
-		if (page_ref_count(page) > 1)
+		if (!dax_layout_is_idle_page(page))
 			return page;
 	}
 	return NULL;
@@ -560,11 +560,11 @@ static void *grab_mapping_entry(struct xa_state *xas,
=20
 /**
  * dax_layout_busy_page - find first pinned page in @mapping
- * @mapping: address space to scan for a page with ref count > 1
+ * @mapping: address space to scan for a page with ref count > 0
  *
  * DAX requires ZONE_DEVICE mapped pages. These pages are never
  * 'onlined' to the page allocator so they are considered idle when
- * page->count =3D=3D 1. A filesystem uses this interface to determine if
+ * page->count =3D=3D 0. A filesystem uses this interface to determine if
  * any page in the mapping is busy, i.e. for DMA, or other
  * get_user_pages() usages.
  *
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bf596467c234..d9f8ad55523a 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3927,7 +3927,7 @@ int ext4_break_layouts(struct inode *inode)
 			return 0;
=20
 		error =3D ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) =3D=3D 1,
+				dax_layout_is_idle_page(page),
 				TASK_INTERRUPTIBLE, 0, 0,
 				ext4_wait_dax_page(ei));
 	} while (error =3D=3D 0);
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index a29f78a663ca..29ab96541bc1 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -750,7 +750,7 @@ xfs_break_dax_layouts(
=20
 	*retry =3D true;
 	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) =3D=3D 1, TASK_INTERRUPTIBLE,
+			dax_layout_is_idle_page(page), TASK_INTERRUPTIBLE,
 			0, 0, xfs_wait_dax_page(inode));
 }
=20
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 43b39ab9de1a..3f78ed78d1d6 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -238,4 +238,9 @@ static inline bool dax_mapping(struct address_space *ma=
pping)
 	return mapping->host && IS_DAX(mapping->host);
 }
=20
+static inline bool dax_layout_is_idle_page(struct page *page)
+{
+	return page_ref_count(page) <=3D 1;
+}
+
 #endif
--=20
2.20.1
