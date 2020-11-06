From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v3 4/6] mm/thp: add THP allocation helper
Date: Thu, 5 Nov 2020 16:51:45 -0800
Message-ID: <20201106005147.20113-5-rcampbell@nvidia.com>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201106005147.20113-1-rcampbell@nvidia.com>
To: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

Transparent huge page allocation policy is controlled by several sysfs
variables. Rather than expose these to each device driver that needs to
allocate THPs, provide a helper function.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/gfp.h | 10 ++++++++++
 mm/huge_memory.c    | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index c603237e006c..242398c4b556 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -564,6 +564,16 @@ static inline struct page *alloc_pages(gfp_t gfp_mask,=
 unsigned int order)
 #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)
 #define alloc_page_vma(gfp_mask, vma, addr)			\
 	alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+extern struct page *alloc_transhugepage(struct vm_area_struct *vma,
+					unsigned long addr);
+#else
+static inline struct page *alloc_transhugepage(struct vm_area_struct *vma,
+						unsigned long addr)
+{
+	return NULL;
+}
+#endif
=20
 extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
 extern unsigned long get_zeroed_page(gfp_t gfp_mask);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a073e66d0ee2..c2c1d3e7c35f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -765,6 +765,20 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault =
*vmf)
 	return __do_huge_pmd_anonymous_page(vmf, page, gfp);
 }
=20
+struct page *alloc_transhugepage(struct vm_area_struct *vma,
+				 unsigned long haddr)
+{
+	gfp_t gfp;
+	struct page *page;
+
+	gfp =3D alloc_hugepage_direct_gfpmask(vma);
+	page =3D alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
+	if (page)
+		prep_transhuge_page(page);
+	return page;
+}
+EXPORT_SYMBOL_GPL(alloc_transhugepage);
+
 static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
 		pgtable_t pgtable)
--=20
2.20.1
