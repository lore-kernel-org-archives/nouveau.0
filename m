From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 13/17] dma-mapping: remove dma_cache_sync
Date: Mon, 14 Sep 2020 16:44:29 +0200
Message-ID: <20200914144433.1622958-14-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200914144433.1622958-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Stefan Richter <stefanr-MtYdepGKPcBMYopoZt5u/LNAH6kLmebB@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux1394-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

All users are gone now, remove the API.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/mips/Kconfig               |  1 -
 arch/mips/jazz/jazzdma.c        |  1 -
 arch/mips/mm/dma-noncoherent.c  |  6 ------
 arch/parisc/Kconfig             |  1 -
 arch/parisc/kernel/pci-dma.c    |  6 ------
 include/linux/dma-mapping.h     |  8 --------
 include/linux/dma-noncoherent.h | 10 ----------
 kernel/dma/Kconfig              |  3 ---
 kernel/dma/mapping.c            | 14 --------------
 9 files changed, 50 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484cf0..1be91c5d666e61 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1134,7 +1134,6 @@ config DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select DMA_NONCOHERENT_MMAP
-	select DMA_NONCOHERENT_CACHE_SYNC
 	select NEED_DMA_MAP_STATE
 
 config SYS_HAS_EARLY_PRINTK
diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index dab4d058cea9b1..2bf849caf507b1 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -620,7 +620,6 @@ const struct dma_map_ops jazz_dma_ops = {
 	.sync_single_for_device	= jazz_dma_sync_single_for_device,
 	.sync_sg_for_cpu	= jazz_dma_sync_sg_for_cpu,
 	.sync_sg_for_device	= jazz_dma_sync_sg_for_device,
-	.cache_sync		= arch_dma_cache_sync,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
 };
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 97a14adbafc99c..f34ad1f09799f1 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -137,12 +137,6 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif
 
-void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction direction)
-{
-	dma_sync_virt_for_device(vaddr, size, direction);
-}
-
 #ifdef CONFIG_DMA_PERDEV_COHERENT
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		const struct iommu_ops *iommu, bool coherent)
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3b0f53dd70bc9b..ed15da1da174e0 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -195,7 +195,6 @@ config PA11
 	depends on PA7000 || PA7100LC || PA7200 || PA7300LC
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select DMA_NONCOHERENT_CACHE_SYNC
 
 config PREFETCH
 	def_bool y
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 38c68e131bbe2a..ce38c0b9158125 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -454,9 +454,3 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 {
 	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
 }
-
-void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-	       enum dma_data_direction direction)
-{
-	flush_kernel_dcache_range((unsigned long)vaddr, size);
-}
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4e1de194b45cbf..5b4e97b0846fd3 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -123,8 +123,6 @@ struct dma_map_ops {
 	void (*sync_sg_for_device)(struct device *dev,
 				   struct scatterlist *sg, int nents,
 				   enum dma_data_direction dir);
-	void (*cache_sync)(struct device *dev, void *vaddr, size_t size,
-			enum dma_data_direction direction);
 	int (*dma_supported)(struct device *dev, u64 mask);
 	u64 (*get_required_mask)(struct device *dev);
 	size_t (*max_mapping_size)(struct device *dev);
@@ -254,8 +252,6 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
 void dmam_free_coherent(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle);
-void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction dir);
 int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
@@ -339,10 +335,6 @@ static inline void dmam_free_coherent(struct device *dev, size_t size,
 		void *vaddr, dma_addr_t dma_handle)
 {
 }
-static inline void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction dir)
-{
-}
 static inline int dma_get_sgtable_attrs(struct device *dev,
 		struct sg_table *sgt, void *cpu_addr, dma_addr_t dma_addr,
 		size_t size, unsigned long attrs)
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index b9bc6c557ea46f..0888656369a45b 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -62,16 +62,6 @@ static inline pgprot_t dma_pgprot(struct device *dev, pgprot_t prot,
 }
 #endif /* CONFIG_MMU */
 
-#ifdef CONFIG_DMA_NONCOHERENT_CACHE_SYNC
-void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction direction);
-#else
-static inline void arch_dma_cache_sync(struct device *dev, void *vaddr,
-		size_t size, enum dma_data_direction direction)
-{
-}
-#endif /* CONFIG_DMA_NONCOHERENT_CACHE_SYNC */
-
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir);
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 281785feb874db..c5f717021f5654 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -75,9 +75,6 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
-config DMA_NONCOHERENT_CACHE_SYNC
-	bool
-
 config DMA_VIRT_OPS
 	bool
 	depends on HAS_DMA
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 848c95c27d79ff..e71abcec8d3913 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -518,20 +518,6 @@ int dma_set_coherent_mask(struct device *dev, u64 mask)
 EXPORT_SYMBOL(dma_set_coherent_mask);
 #endif
 
-void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction dir)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-
-	if (dma_alloc_direct(dev, ops))
-		arch_dma_cache_sync(dev, vaddr, size, dir);
-	else if (ops->cache_sync)
-		ops->cache_sync(dev, vaddr, size, dir);
-}
-EXPORT_SYMBOL(dma_cache_sync);
-
 size_t dma_max_mapping_size(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.28.0
