From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 11/28] dma-mapping: add (back) arch_dma_mark_clean for ia64
Date: Wed, 19 Aug 2020 08:55:38 +0200
Message-ID: <20200819065555.1802761-12-hch@lst.de>
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

Add back a hook to optimize dcache flushing after reading executable
code using DMA.  This gets ia64 out of the business of pretending to
be dma incoherent just for this optimization.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/ia64/Kconfig               |  3 +--
 arch/ia64/kernel/dma-mapping.c  | 14 +-------------
 arch/ia64/mm/init.c             |  3 +--
 include/linux/dma-direct.h      |  3 +++
 include/linux/dma-noncoherent.h |  8 ++++++++
 kernel/dma/Kconfig              |  6 ++++++
 kernel/dma/direct.c             |  3 +++
 7 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 5b4ec80bf5863a..513ba0c5d33610 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -8,6 +8,7 @@ menu "Processor type and features"
 
 config IA64
 	bool
+	select ARCH_HAS_DMA_MARK_CLEAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ACPI
@@ -32,8 +33,6 @@ config IA64
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
-	select DMA_NONCOHERENT_MMAP
-	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select VIRT_TO_BUS
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PENDING_IRQ if SMP
diff --git a/arch/ia64/kernel/dma-mapping.c b/arch/ia64/kernel/dma-mapping.c
index 09ef9ce9988d1f..f640ed6fe1d576 100644
--- a/arch/ia64/kernel/dma-mapping.c
+++ b/arch/ia64/kernel/dma-mapping.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
 #include <linux/export.h>
 
 /* Set this to 1 if there is a HW IOMMU in the system */
@@ -7,15 +7,3 @@ int iommu_detected __read_mostly;
 
 const struct dma_map_ops *dma_ops;
 EXPORT_SYMBOL(dma_ops);
-
-void *arch_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-}
-
-void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
-{
-	dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-}
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 0b3fb4c7af2920..02e5aa08294ee0 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -73,8 +73,7 @@ __ia64_sync_icache_dcache (pte_t pte)
  * DMA can be marked as "clean" so that lazy_mmu_prot_update() doesn't have to
  * flush them when they get mapped into an executable vm-area.
  */
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
 {
 	unsigned long pfn = PHYS_PFN(paddr);
 
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 5a3ce2a2479437..738485b3578062 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -153,6 +153,9 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 	if (unlikely(is_swiotlb_buffer(paddr)))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
+
+	if (dir == DMA_FROM_DEVICE)
+		arch_dma_mark_clean(paddr, size);
 }
 
 static inline dma_addr_t dma_direct_map_page(struct device *dev,
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index ca09a4e07d2d3d..b9bc6c557ea46f 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -108,6 +108,14 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+#ifdef CONFIG_ARCH_HAS_DMA_MARK_CLEAN
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size);
+#else
+static inline void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
+{
+}
+#endif /* ARCH_HAS_DMA_MARK_CLEAN */
+
 void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 847a9d1fa6343d..6cf7f7947ae797 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -43,6 +43,12 @@ config ARCH_HAS_DMA_SET_MASK
 config ARCH_HAS_DMA_WRITE_COMBINE
 	bool
 
+#
+# Select if the architectures provides the arch_dma_mark_clean hook
+#
+config ARCH_HAS_DMA_MARK_CLEAN
+	bool
+
 config DMA_DECLARE_COHERENT
 	bool
 
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index bb0041e9965975..1123e767f4315f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -340,6 +340,9 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		if (unlikely(is_swiotlb_buffer(paddr)))
 			swiotlb_tbl_sync_single(dev, paddr, sg->length, dir,
 					SYNC_FOR_CPU);
+
+		if (dir == DMA_FROM_DEVICE)
+			arch_dma_mark_clean(paddr, sg->length);
 	}
 
 	if (!dev_is_dma_coherent(dev))
-- 
2.28.0
