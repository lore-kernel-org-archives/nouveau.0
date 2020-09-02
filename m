From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/7] mm/thp: add
 prep_transhuge_device_private_page()
Date: Wed, 2 Sep 2020 09:58:27 -0700
Message-ID: <20200902165830.5367-5-rcampbell@nvidia.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200902165830.5367-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Add a helper function to allow device drivers to create device private
transparent huge pages. This is intended to help support device private
THP migrations.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/huge_mm.h | 5 +++++
 mm/huge_memory.c        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 87b42c81dedc..126e54da4fee 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -187,6 +187,7 @@ extern unsigned long thp_get_unmapped_area(struct file *filp,
 		unsigned long flags);
 
 extern void prep_transhuge_page(struct page *page);
+extern void prep_transhuge_device_private_page(struct page *page);
 extern void free_transhuge_page(struct page *page);
 bool is_transparent_hugepage(struct page *page);
 
@@ -382,6 +383,10 @@ static inline bool transhuge_vma_suitable(struct vm_area_struct *vma,
 
 static inline void prep_transhuge_page(struct page *page) {}
 
+static inline void prep_transhuge_device_private_page(struct page *page)
+{
+}
+
 static inline bool is_transparent_hugepage(struct page *page)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a8d48994481a..1e848cc0c3dc 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -498,6 +498,14 @@ void prep_transhuge_page(struct page *page)
 	set_compound_page_dtor(page, TRANSHUGE_PAGE_DTOR);
 }
 
+void prep_transhuge_device_private_page(struct page *page)
+{
+	prep_compound_page(page, HPAGE_PMD_ORDER);
+	prep_transhuge_page(page);
+	percpu_ref_put_many(page->pgmap->ref, HPAGE_PMD_NR - 1);
+}
+EXPORT_SYMBOL_GPL(prep_transhuge_device_private_page);
+
 bool is_transparent_hugepage(struct page *page)
 {
 	if (!PageCompound(page))
-- 
2.20.1
