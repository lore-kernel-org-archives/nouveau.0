From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] nouveau: remove bogus uses of DMA_ATTR_SKIP_CPU_SYNC
Date: Wed,  3 Jul 2019 13:35:13 -0700
Message-ID: <20190703203513.22692-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com
Cc: jglisse@redhat.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

DMA_ATTR_SKIP_CPU_SYNC should only be used when the driver manually
performs dma cache maintainance operations using the dma_sync_*
calls.  Nouveau doesn't do that, and generally just assumes DMA
is coherent.  Use plain dma_map_page which doesn't make this code
correct but at least a little less wrong and simpler.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index b9ced2e61667..a5d9b537cbaf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -186,9 +186,8 @@ nouveau_dmem_fault_alloc_and_copy(struct vm_area_struct *vma,
 		}
 
 		fault->dma[fault->npages] =
-			dma_map_page_attrs(dev, dpage, 0, PAGE_SIZE,
-					   PCI_DMA_BIDIRECTIONAL,
-					   DMA_ATTR_SKIP_CPU_SYNC);
+			dma_map_page(dev, dpage, 0, PAGE_SIZE,
+				     PCI_DMA_BIDIRECTIONAL);
 		if (dma_mapping_error(dev, fault->dma[fault->npages])) {
 			dst_pfns[i] = MIGRATE_PFN_ERROR;
 			__free_page(dpage);
@@ -706,9 +705,8 @@ nouveau_dmem_migrate_alloc_and_copy(struct vm_area_struct *vma,
 		}
 
 		migrate->dma[migrate->dma_nr] =
-			dma_map_page_attrs(dev, spage, 0, PAGE_SIZE,
-					   PCI_DMA_BIDIRECTIONAL,
-					   DMA_ATTR_SKIP_CPU_SYNC);
+			dma_map_page(dev, spage, 0, PAGE_SIZE,
+				     PCI_DMA_BIDIRECTIONAL);
 		if (dma_mapping_error(dev, migrate->dma[migrate->dma_nr])) {
 			nouveau_dmem_page_free_locked(drm, dpage);
 			dst_pfns[i] = 0;
-- 
2.20.1
