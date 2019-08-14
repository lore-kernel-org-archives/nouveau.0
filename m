From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 03/10] nouveau: factor out device memory address calculation
Date: Wed, 14 Aug 2019 09:59:21 +0200
Message-ID: <20190814075928.23766-4-hch@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Factor out the repeated device memory address calculation into
a helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 42 +++++++++++---------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e696157f771e..d469bc334438 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -102,6 +102,14 @@ struct nouveau_migrate {
 	unsigned long dma_nr;
 };
 
+static unsigned long nouveau_dmem_page_addr(struct page *page)
+{
+	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
+	unsigned long idx = page_to_pfn(page) - chunk->pfn_first;
+
+	return (idx << PAGE_SHIFT) + chunk->bo->bo.offset;
+}
+
 static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
@@ -169,9 +177,7 @@ nouveau_dmem_fault_alloc_and_copy(struct vm_area_struct *vma,
 	/* Copy things over */
 	copy = drm->dmem->migrate.copy_func;
 	for (addr = start, i = 0; addr < end; addr += PAGE_SIZE, i++) {
-		struct nouveau_dmem_chunk *chunk;
 		struct page *spage, *dpage;
-		u64 src_addr, dst_addr;
 
 		dpage = migrate_pfn_to_page(dst_pfns[i]);
 		if (!dpage || dst_pfns[i] == MIGRATE_PFN_ERROR)
@@ -194,14 +200,10 @@ nouveau_dmem_fault_alloc_and_copy(struct vm_area_struct *vma,
 			continue;
 		}
 
-		dst_addr = fault->dma[fault->npages++];
-
-		chunk = spage->zone_device_data;
-		src_addr = page_to_pfn(spage) - chunk->pfn_first;
-		src_addr = (src_addr << PAGE_SHIFT) + chunk->bo->bo.offset;
-
-		ret = copy(drm, 1, NOUVEAU_APER_HOST, dst_addr,
-				   NOUVEAU_APER_VRAM, src_addr);
+		ret = copy(drm, 1, NOUVEAU_APER_HOST,
+				fault->dma[fault->npages++],
+				NOUVEAU_APER_VRAM,
+				nouveau_dmem_page_addr(spage));
 		if (ret) {
 			dst_pfns[i] = MIGRATE_PFN_ERROR;
 			__free_page(dpage);
@@ -687,18 +689,12 @@ nouveau_dmem_migrate_alloc_and_copy(struct vm_area_struct *vma,
 	/* Copy things over */
 	copy = drm->dmem->migrate.copy_func;
 	for (addr = start, i = 0; addr < end; addr += PAGE_SIZE, i++) {
-		struct nouveau_dmem_chunk *chunk;
 		struct page *spage, *dpage;
-		u64 src_addr, dst_addr;
 
 		dpage = migrate_pfn_to_page(dst_pfns[i]);
 		if (!dpage || dst_pfns[i] == MIGRATE_PFN_ERROR)
 			continue;
 
-		chunk = dpage->zone_device_data;
-		dst_addr = page_to_pfn(dpage) - chunk->pfn_first;
-		dst_addr = (dst_addr << PAGE_SHIFT) + chunk->bo->bo.offset;
-
 		spage = migrate_pfn_to_page(src_pfns[i]);
 		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE)) {
 			nouveau_dmem_page_free_locked(drm, dpage);
@@ -716,10 +712,10 @@ nouveau_dmem_migrate_alloc_and_copy(struct vm_area_struct *vma,
 			continue;
 		}
 
-		src_addr = migrate->dma[migrate->dma_nr++];
-
-		ret = copy(drm, 1, NOUVEAU_APER_VRAM, dst_addr,
-				   NOUVEAU_APER_HOST, src_addr);
+		ret = copy(drm, 1, NOUVEAU_APER_VRAM,
+				nouveau_dmem_page_addr(dpage),
+				NOUVEAU_APER_HOST,
+				migrate->dma[migrate->dma_nr++]);
 		if (ret) {
 			nouveau_dmem_page_free_locked(drm, dpage);
 			dst_pfns[i] = 0;
@@ -846,7 +842,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 
 	npages = (range->end - range->start) >> PAGE_SHIFT;
 	for (i = 0; i < npages; ++i) {
-		struct nouveau_dmem_chunk *chunk;
 		struct page *page;
 		uint64_t addr;
 
@@ -864,10 +859,7 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 			continue;
 		}
 
-		chunk = page->zone_device_data;
-		addr = page_to_pfn(page) - chunk->pfn_first;
-		addr = (addr + chunk->bo->bo.mem.start) << PAGE_SHIFT;
-
+		addr = nouveau_dmem_page_addr(page);
 		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
 		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
 	}
-- 
2.20.1
