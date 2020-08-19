From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 12/28] dma-direct: remove dma_direct_{alloc,free}_pages
Date: Wed, 19 Aug 2020 08:55:39 +0200
Message-ID: <20200819065555.1802761-13-hch@lst.de>
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

Just merge these helpers into the main dma_direct_{alloc,free} routines,
as the additional checks are always false for the two callers.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/x86/kernel/amd_gart_64.c |  6 +++---
 include/linux/dma-direct.h    |  4 ----
 kernel/dma/direct.c           | 39 ++++++++++++++---------------------
 kernel/dma/pool.c             |  2 +-
 4 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index e89031e9c84761..adbf616d35d15d 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -468,7 +468,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
 {
 	void *vaddr;
 
-	vaddr = dma_direct_alloc_pages(dev, size, dma_addr, flag, attrs);
+	vaddr = dma_direct_alloc(dev, size, dma_addr, flag, attrs);
 	if (!vaddr ||
 	    !force_iommu || dev->coherent_dma_mask <= DMA_BIT_MASK(24))
 		return vaddr;
@@ -480,7 +480,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
 		goto out_free;
 	return vaddr;
 out_free:
-	dma_direct_free_pages(dev, size, vaddr, *dma_addr, attrs);
+	dma_direct_free(dev, size, vaddr, *dma_addr, attrs);
 	return NULL;
 }
 
@@ -490,7 +490,7 @@ gart_free_coherent(struct device *dev, size_t size, void *vaddr,
 		   dma_addr_t dma_addr, unsigned long attrs)
 {
 	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
-	dma_direct_free_pages(dev, size, vaddr, dma_addr, attrs);
+	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
 }
 
 static int no_agp;
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 738485b3578062..6a96a8ecac7cbc 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -80,10 +80,6 @@ void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
 void dma_direct_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_addr, unsigned long attrs);
-void *dma_direct_alloc_pages(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs);
-void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs);
 int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 1123e767f4315f..8da9a62dd9a72c 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -151,13 +151,18 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 	return page;
 }
 
-void *dma_direct_alloc_pages(struct device *dev, size_t size,
+void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	struct page *page;
 	void *ret;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    dma_alloc_need_uncached(dev, attrs))
+		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
+
 	size = PAGE_ALIGN(size);
 
 	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
@@ -251,11 +256,18 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	return NULL;
 }
 
-void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
+void dma_direct_free(struct device *dev, size_t size,
+		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
 	unsigned int page_order = get_order(size);
 
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    dma_alloc_need_uncached(dev, attrs)) {
+		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
+		return;
+	}
+
 	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
 	if (dma_should_free_from_pool(dev, attrs) &&
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
@@ -279,27 +291,6 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
 }
 
-void *dma_direct_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    dma_alloc_need_uncached(dev, attrs))
-		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
-	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-}
-
-void dma_direct_free(struct device *dev, size_t size,
-		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
-{
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    dma_alloc_need_uncached(dev, attrs))
-		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
-	else
-		dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-}
-
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_SWIOTLB)
 void dma_direct_sync_sg_for_device(struct device *dev,
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 6bc74a2d51273e..222cebf1f10548 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -86,7 +86,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 #endif
 	/*
 	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
-	 * shrink so no re-encryption occurs in dma_direct_free_pages().
+	 * shrink so no re-encryption occurs in dma_direct_free().
 	 */
 	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
 				   1 << order);
-- 
2.28.0
