From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 6/6] mm/migrate: remove range invalidation in
 migrate_vma_pages()
Date: Thu, 23 Jul 2020 15:30:04 -0700
Message-ID: <20200723223004.9586-7-rcampbell@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200723223004.9586-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When migrating the special zero page, migrate_vma_pages() calls
mmu_notifier_invalidate_range_start() before replacing the zero page
PFN in the CPU page tables. This is unnecessary since the range was
invalidated in migrate_vma_setup() and the page table entry is checked
to be sure it hasn't changed between migrate_vma_setup() and
migrate_vma_pages(). Therefore, remove the redundant invalidation.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t95543388; bh=Y8qnSzc0udfc4m+P6cziRmRJk5XEGcgDU5ImloLrCuE=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
	 Content-Transfer-Encoding:Content-Type;
	b=rIyLVqKU1Kxf67Qz9TIZ2f1lAaP7YxvFgCZR8v0Vw1fwq7aUbMbgfzcF0bd6+XzG6
	 ZHtBRMp/Zu/ZLGRxP6lBqZo4wHMHbuW3fXOvPCrYTD5YsCCLv+Ao4RmreWyec2wBTk
	 uBo3ZylCHJ0ckD85BcjQQxpXyY99cBsvIomZw9wzg6QGm7Ksbq6d+UKSkb0L04d6v8
	 fiRvvLNq3kCbPzrifaBTj3klQcVcKXz34km0XUoRQlSaftlq4BJWopBPX8U7gQtstO
	 OvA7Al9t87sCpKjSnqjE7N1jThU0KzjPrCxJiEHq/0Vf4sqeUA42bOkc+bk/CV1ZSF
	 n9jm36j4kRTUg=

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 mm/migrate.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 96e1f41a991e..36076ba2f51a 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2877,9 +2877,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 {
 	const unsigned long npages = migrate->npages;
 	const unsigned long start = migrate->start;
-	struct mmu_notifier_range range;
 	unsigned long addr, i;
-	bool notified = false;
 
 	for (i = 0, addr = start; i < npages; addr += PAGE_SIZE, i++) {
 		struct page *newpage = migrate_pfn_to_page(migrate->dst[i]);
@@ -2895,16 +2893,6 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		if (!page) {
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
-			if (!notified) {
-				notified = true;
-
-				mmu_notifier_range_init(&range,
-							MMU_NOTIFY_CLEAR, 0,
-							NULL,
-							migrate->vma->vm_mm,
-							addr, migrate->end);
-				mmu_notifier_invalidate_range_start(&range);
-			}
 			migrate_vma_insert_page(migrate, addr, newpage,
 						&migrate->src[i],
 						&migrate->dst[i]);
@@ -2937,14 +2925,6 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		if (r != MIGRATEPAGE_SUCCESS)
 			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
-
-	/*
-	 * No need to double call mmu_notifier->invalidate_range() callback as
-	 * the above ptep_clear_flush_notify() inside migrate_vma_insert_page()
-	 * did already call it.
-	 */
-	if (notified)
-		mmu_notifier_invalidate_range_only_end(&range);
 }
 EXPORT_SYMBOL(migrate_vma_pages);
 
-- 
2.20.1
