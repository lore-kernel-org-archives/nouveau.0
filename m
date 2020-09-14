From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 12/17] 53c700: convert to dma_alloc_noncoherent
Date: Mon, 14 Sep 2020 16:44:28 +0200
Message-ID: <20200914144433.1622958-13-hch@lst.de>
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

Use the new non-coherent DMA API including proper ownership transfers.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/scsi/53c700.c | 11 +++++++++--
 drivers/scsi/53c700.h | 16 ++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 9a343f8ecb6c3e..5117d90ccd9edf 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -269,18 +269,25 @@ NCR_700_get_SXFER(struct scsi_device *SDp)
 					      spi_period(SDp->sdev_target));
 }
 
+static inline dma_addr_t virt_to_dma(struct NCR_700_Host_Parameters *h, void *p)
+{
+	return h->pScript + ((uintptr_t)p - (uintptr_t)h->script);
+}
+
 static inline void dma_sync_to_dev(struct NCR_700_Host_Parameters *h,
 		void *addr, size_t size)
 {
 	if (h->noncoherent)
-		dma_cache_sync(h->dev, addr, size, DMA_TO_DEVICE);
+		dma_sync_single_for_device(h->dev, virt_to_dma(h, addr),
+					   size, DMA_BIDIRECTIONAL);
 }
 
 static inline void dma_sync_from_dev(struct NCR_700_Host_Parameters *h,
 		void *addr, size_t size)
 {
 	if (h->noncoherent)
-		dma_cache_sync(h->dev, addr, size, DMA_FROM_DEVICE);
+		dma_sync_single_for_device(h->dev, virt_to_dma(h, addr), size,
+					   DMA_BIDIRECTIONAL);
 }
 
 struct Scsi_Host *
diff --git a/drivers/scsi/53c700.h b/drivers/scsi/53c700.h
index 0f545b05fe611d..c9f8c497babb3d 100644
--- a/drivers/scsi/53c700.h
+++ b/drivers/scsi/53c700.h
@@ -423,33 +423,33 @@ struct NCR_700_Host_Parameters {
 #define NCR_710_MIN_XFERP	0
 #define NCR_700_MIN_PERIOD	25 /* for SDTR message, 100ns */
 
-#define script_patch_32(dev, script, symbol, value) \
+#define script_patch_32(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		__u32 val = bS_to_cpu((script)[A_##symbol##_used[i]]) + da; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
-#define script_patch_32_abs(dev, script, symbol, value) \
+#define script_patch_32_abs(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		(script)[A_##symbol##_used[i]] = bS_to_host(da); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
 /* Used for patching the SCSI ID in the SELECT instruction */
-#define script_patch_ID(dev, script, symbol, value) \
+#define script_patch_ID(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -457,13 +457,13 @@ struct NCR_700_Host_Parameters {
 		val &= 0xff00ffff; \
 		val |= ((value) & 0xff) << 16; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching ID field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
 }
 
-#define script_patch_16(dev, script, symbol, value) \
+#define script_patch_16(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -471,7 +471,7 @@ struct NCR_700_Host_Parameters {
 		val &= 0xffff0000; \
 		val |= ((value) & 0xffff); \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching short field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
-- 
2.28.0
