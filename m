From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [RFC PATCH v3 1/2] ext4/xfs: add page refcount helper
Date: Thu, 1 Oct 2020 11:17:14 -0700
Message-ID: <20201001181715.17416-2-rcampbell@nvidia.com>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20201001181715.17416-1-rcampbell@nvidia.com>
To: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

There are several places where ZONE_DEVICE struct pages assume a reference
count =3D=3D 1 means the page is idle and free. Instead of open coding this=
,
add a helper function to hide this detail.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 5b47834f2e1b..85c63f735909 100644
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
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bf596467c234..4c3b80e68121 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3926,10 +3926,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
=20
-		error =3D ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) =3D=3D 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(ei));
+		error =3D dax_wait_page(ei, page, ext4_wait_dax_page);
 	} while (error =3D=3D 0);
=20
 	return error;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 3d1b95124744..a5304aaeaa3a 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -749,9 +749,7 @@ xfs_break_dax_layouts(
 		return 0;
=20
 	*retry =3D true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) =3D=3D 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page(inode, page, xfs_wait_dax_page);
 }
=20
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index b52f084aa643..f906cf4db1cc 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *m=
apping)
 	return mapping->host && IS_DAX(mapping->host);
 }
=20
+static inline bool dax_layout_is_idle_page(struct page *page)
+{
+	return page_ref_count(page) =3D=3D 1;
+}
+
+#define dax_wait_page(_inode, _page, _wait_cb)				\
+	___wait_var_event(&(_page)->_refcount,				\
+		dax_layout_is_idle_page(_page),				\
+		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
+
 #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
 void hmem_register_device(int target_nid, struct resource *r);
 #else
--=20
2.20.1
