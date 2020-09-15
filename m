From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 18/18] firewire-ohci: use dma_alloc_pages
Date: Tue, 15 Sep 2020 17:51:22 +0200
Message-ID: <20200915155122.1768241-19-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200915155122.1768241-1-hch-jcswGhMUV9g@public.gmane.org>
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

Use dma_alloc_pages to allocate DMAable pages instead of hoping that
the architecture either has GFP_DMA32 or not more than 4G of memory.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/firewire/ohci.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 020cb15a4d8fcc..9811c40956e54d 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -674,17 +674,16 @@ static void ar_context_link_page(struct ar_context *ctx, unsigned int index)
 
 static void ar_context_release(struct ar_context *ctx)
 {
+	struct device *dev = ctx->ohci->card.device;
 	unsigned int i;
 
 	vunmap(ctx->buffer);
 
-	for (i = 0; i < AR_BUFFERS; i++)
-		if (ctx->pages[i]) {
-			dma_unmap_page(ctx->ohci->card.device,
-				       ar_buffer_bus(ctx, i),
-				       PAGE_SIZE, DMA_FROM_DEVICE);
-			__free_page(ctx->pages[i]);
-		}
+	for (i = 0; i < AR_BUFFERS; i++) {
+		if (ctx->pages[i])
+			dma_free_pages(dev, PAGE_SIZE, ctx->pages[i],
+				       ar_buffer_bus(ctx, i), DMA_FROM_DEVICE);
+	}
 }
 
 static void ar_context_abort(struct ar_context *ctx, const char *error_msg)
@@ -970,6 +969,7 @@ static void ar_context_tasklet(unsigned long data)
 static int ar_context_init(struct ar_context *ctx, struct fw_ohci *ohci,
 			   unsigned int descriptors_offset, u32 regs)
 {
+	struct device *dev = ohci->card.device;
 	unsigned int i;
 	dma_addr_t dma_addr;
 	struct page *pages[AR_BUFFERS + AR_WRAPAROUND_PAGES];
@@ -980,17 +980,13 @@ static int ar_context_init(struct ar_context *ctx, struct fw_ohci *ohci,
 	tasklet_init(&ctx->tasklet, ar_context_tasklet, (unsigned long)ctx);
 
 	for (i = 0; i < AR_BUFFERS; i++) {
-		ctx->pages[i] = alloc_page(GFP_KERNEL | GFP_DMA32);
+		ctx->pages[i] = dma_alloc_pages(dev, PAGE_SIZE, &dma_addr,
+						DMA_FROM_DEVICE, GFP_KERNEL);
 		if (!ctx->pages[i])
 			goto out_of_memory;
-		dma_addr = dma_map_page(ohci->card.device, ctx->pages[i],
-					0, PAGE_SIZE, DMA_FROM_DEVICE);
-		if (dma_mapping_error(ohci->card.device, dma_addr)) {
-			__free_page(ctx->pages[i]);
-			ctx->pages[i] = NULL;
-			goto out_of_memory;
-		}
 		set_page_private(ctx->pages[i], dma_addr);
+		dma_sync_single_for_device(dev, dma_addr, PAGE_SIZE,
+					   DMA_FROM_DEVICE);
 	}
 
 	for (i = 0; i < AR_BUFFERS; i++)
-- 
2.28.0
