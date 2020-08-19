From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 09/28] MIPS/jazzdma: remove the unused vdma_remap function
Date: Wed, 19 Aug 2020 08:55:36 +0200
Message-ID: <20200819065555.1802761-10-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/mips/include/asm/jazzdma.h |  2 -
 arch/mips/jazz/jazzdma.c        | 70 ---------------------------------
 2 files changed, 72 deletions(-)

diff --git a/arch/mips/include/asm/jazzdma.h b/arch/mips/include/asm/jazzdma.h
index d13f940022d5f9..c831da7fa89803 100644
--- a/arch/mips/include/asm/jazzdma.h
+++ b/arch/mips/include/asm/jazzdma.h
@@ -10,8 +10,6 @@
  */
 extern unsigned long vdma_alloc(unsigned long paddr, unsigned long size);
 extern int vdma_free(unsigned long laddr);
-extern int vdma_remap(unsigned long laddr, unsigned long paddr,
-		      unsigned long size);
 extern unsigned long vdma_phys2log(unsigned long paddr);
 extern unsigned long vdma_log2phys(unsigned long laddr);
 extern void vdma_stats(void);		/* for debugging only */
diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index 014773f0bfcd74..fe40dbed04c1d6 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -209,76 +209,6 @@ int vdma_free(unsigned long laddr)
 
 EXPORT_SYMBOL(vdma_free);
 
-/*
- * Map certain page(s) to another physical address.
- * Caller must have allocated the page(s) before.
- */
-int vdma_remap(unsigned long laddr, unsigned long paddr, unsigned long size)
-{
-	int first, pages;
-
-	if (laddr > 0xffffff) {
-		if (vdma_debug)
-			printk
-			    ("vdma_map: Invalid logical address: %08lx\n",
-			     laddr);
-		return -EINVAL; /* invalid logical address */
-	}
-	if (paddr > 0x1fffffff) {
-		if (vdma_debug)
-			printk
-			    ("vdma_map: Invalid physical address: %08lx\n",
-			     paddr);
-		return -EINVAL; /* invalid physical address */
-	}
-
-	pages = (((paddr & (VDMA_PAGESIZE - 1)) + size) >> 12) + 1;
-	first = laddr >> 12;
-	if (vdma_debug)
-		printk("vdma_remap: first=%x, pages=%x\n", first, pages);
-	if (first + pages > VDMA_PGTBL_ENTRIES) {
-		if (vdma_debug)
-			printk("vdma_alloc: Invalid size: %08lx\n", size);
-		return -EINVAL;
-	}
-
-	paddr &= ~(VDMA_PAGESIZE - 1);
-	while (pages > 0 && first < VDMA_PGTBL_ENTRIES) {
-		if (pgtbl[first].owner != laddr) {
-			if (vdma_debug)
-				printk("Trying to remap other's pages.\n");
-			return -EPERM;	/* not owner */
-		}
-		pgtbl[first].frame = paddr;
-		paddr += VDMA_PAGESIZE;
-		first++;
-		pages--;
-	}
-
-	/*
-	 * Update translation table
-	 */
-	r4030_write_reg32(JAZZ_R4030_TRSTBL_INV, 0);
-
-	if (vdma_debug > 2) {
-		int i;
-		pages = (((paddr & (VDMA_PAGESIZE - 1)) + size) >> 12) + 1;
-		first = laddr >> 12;
-		printk("LADDR: ");
-		for (i = first; i < first + pages; i++)
-			printk("%08x ", i << 12);
-		printk("\nPADDR: ");
-		for (i = first; i < first + pages; i++)
-			printk("%08x ", pgtbl[i].frame);
-		printk("\nOWNER: ");
-		for (i = first; i < first + pages; i++)
-			printk("%08x ", pgtbl[i].owner);
-		printk("\n");
-	}
-
-	return 0;
-}
-
 /*
  * Translate a physical address to a logical address.
  * This will return the logical address of the first
-- 
2.28.0
