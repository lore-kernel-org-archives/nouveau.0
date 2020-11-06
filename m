From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v3 1/6] mm/thp: add prep_transhuge_device_private_page()
Date: Thu, 5 Nov 2020 16:51:42 -0800
Message-ID: <20201106005147.20113-2-rcampbell@nvidia.com>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201106005147.20113-1-rcampbell@nvidia.com>
To: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

Add a helper function to allow device drivers to create device private
transparent huge pages. This is intended to help support device private
THP migrations.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/huge_mm.h | 5 +++++
 mm/huge_memory.c        | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 0365aa97f8e7..3ec26ef27a93 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -184,6 +184,7 @@ extern unsigned long thp_get_unmapped_area(struct file =
*filp,
 		unsigned long flags);
=20
 extern void prep_transhuge_page(struct page *page);
+extern void prep_transhuge_device_private_page(struct page *page);
 extern void free_transhuge_page(struct page *page);
 bool is_transparent_hugepage(struct page *page);
=20
@@ -377,6 +378,10 @@ static inline bool transhuge_vma_suitable(struct vm_ar=
ea_struct *vma,
=20
 static inline void prep_transhuge_page(struct page *page) {}
=20
+static inline void prep_transhuge_device_private_page(struct page *page)
+{
+}
+
 static inline bool is_transparent_hugepage(struct page *page)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 08a183f6c3ab..b4141f12ff31 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -498,6 +498,15 @@ void prep_transhuge_page(struct page *page)
 	set_compound_page_dtor(page, TRANSHUGE_PAGE_DTOR);
 }
=20
+void prep_transhuge_device_private_page(struct page *page)
+{
+	prep_compound_page(page, HPAGE_PMD_ORDER);
+	prep_transhuge_page(page);
+	/* Only the head page has a reference to the pgmap. */
+	percpu_ref_put_many(page->pgmap->ref, HPAGE_PMD_NR - 1);
+}
+EXPORT_SYMBOL_GPL(prep_transhuge_device_private_page);
+
 bool is_transparent_hugepage(struct page *page)
 {
 	if (!PageCompound(page))
--=20
2.20.1
