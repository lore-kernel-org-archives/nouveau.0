From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 10/28] MIPS/jazzdma: decouple from dma-direct
Date: Wed, 19 Aug 2020 08:55:37 +0200
Message-ID: <20200819065555.1802761-11-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200819065555.1802761-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvme-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

The jazzdma ops implement support for a very basic IOMMU.  Thus we really
should not use the dma-direct code that takes physical address limits
into account.  This survived through the great MIPS DMA ops cleanup mostly
because I was lazy, but now it is time to fully split the implementations.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/mips/jazz/jazzdma.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index fe40dbed04c1d6..d0b5a2ba2b1a8a 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -16,7 +16,6 @@
 #include <linux/memblock.h>
 #include <linux/spinlock.h>
 #include <linux/gfp.h>
-#include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
 #include <asm/mipsregs.h>
 #include <asm/jazz.h>
@@ -492,26 +491,38 @@ int vdma_get_enable(int channel)
 static void *jazz_dma_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
+	struct page *page;
 	void *ret;
 
-	ret = dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-	if (!ret)
-		return NULL;
+	if (attrs & DMA_ATTR_NO_WARN)
+		gfp |= __GFP_NOWARN;
 
-	*dma_handle = vdma_alloc(virt_to_phys(ret), size);
-	if (*dma_handle == DMA_MAPPING_ERROR) {
-		dma_direct_free_pages(dev, size, ret, *dma_handle, attrs);
+	size = PAGE_ALIGN(size);
+	page = alloc_pages(gfp, get_order(size));
+	if (!page)
 		return NULL;
-	}
+	ret = page_address(page);
+	*dma_handle = vdma_alloc(virt_to_phys(ret), size);
+	if (*dma_handle == DMA_MAPPING_ERROR)
+		goto out_free_pages;
+
+	if (attrs & DMA_ATTR_NON_CONSISTENT)
+		return ret;
+	arch_dma_prep_coherent(page, size);
+	return (void *)(UNCAC_BASE + __pa(ret));
 
-	return ret;
+out_free_pages:
+	__free_pages(page, get_order(size));
+	return NULL;
 }
 
 static void jazz_dma_free(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
 	vdma_free(dma_handle);
-	dma_direct_free_pages(dev, size, vaddr, dma_handle, attrs);
+	if (!(attrs & DMA_ATTR_NON_CONSISTENT))
+		vaddr = __va(vaddr - UNCAC_BASE);
+	__free_pages(virt_to_page(vaddr), get_order(size));
 }
 
 static dma_addr_t jazz_dma_map_page(struct device *dev, struct page *page,
@@ -608,7 +619,6 @@ const struct dma_map_ops jazz_dma_ops = {
 	.sync_single_for_device	= jazz_dma_sync_single_for_device,
 	.sync_sg_for_cpu	= jazz_dma_sync_sg_for_cpu,
 	.sync_sg_for_device	= jazz_dma_sync_sg_for_device,
-	.dma_supported		= dma_direct_supported,
 	.cache_sync		= arch_dma_cache_sync,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
-- 
2.28.0
