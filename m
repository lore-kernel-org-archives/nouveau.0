From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 28/28] nvme-pci: use dma_alloc_pages backed dmapools
Date: Wed, 19 Aug 2020 08:55:55 +0200
Message-ID: <20200819065555.1802761-29-hch@lst.de>
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

Switch from coherent DMA pools to those backed by dma_alloc_pages.  This
helps device with non-coherent DMA to avoid host accesses to uncached
memory for every submission of a larger than single entry I/O.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/nvme/host/pci.c | 80 ++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a33adab62acbaf..fb34dbcb973673 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -114,8 +114,8 @@ struct nvme_dev {
 	struct blk_mq_tag_set admin_tagset;
 	u32 __iomem *dbs;
 	struct device *dev;
-	struct dma_pool *prp_page_pool;
-	struct dma_pool *prp_small_pool;
+	struct dma_pool prp_page_pool;
+	struct dma_pool prp_small_pool;
 	unsigned online_queues;
 	unsigned max_qid;
 	unsigned io_queues[HCTX_MAX_TYPES];
@@ -536,7 +536,7 @@ static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
 
 
 	if (iod->npages == 0)
-		dma_pool_free(dev->prp_small_pool, nvme_pci_iod_list(req)[0],
+		dma_pool_free(&dev->prp_small_pool, nvme_pci_iod_list(req)[0],
 			dma_addr);
 
 	for (i = 0; i < iod->npages; i++) {
@@ -553,7 +553,7 @@ static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
 			next_dma_addr = le64_to_cpu(prp_list[last_prp]);
 		}
 
-		dma_pool_free(dev->prp_page_pool, addr, dma_addr);
+		dma_pool_free(&dev->prp_page_pool, addr, dma_addr);
 		dma_addr = next_dma_addr;
 	}
 
@@ -611,10 +611,10 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 
 	nprps = DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE);
 	if (nprps <= (256 / 8)) {
-		pool = dev->prp_small_pool;
+		pool = &dev->prp_small_pool;
 		iod->npages = 0;
 	} else {
-		pool = dev->prp_page_pool;
+		pool = &dev->prp_page_pool;
 		iod->npages = 1;
 	}
 
@@ -630,6 +630,11 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 	for (;;) {
 		if (i == NVME_CTRL_PAGE_SIZE >> 3) {
 			__le64 *old_prp_list = prp_list;
+
+			dma_sync_single_for_device(dev->dev, prp_dma,
+						   i * sizeof(*prp_list),
+						   DMA_TO_DEVICE);
+
 			prp_list = dma_pool_alloc(pool, GFP_ATOMIC, &prp_dma);
 			if (!prp_list)
 				return BLK_STS_RESOURCE;
@@ -653,6 +658,8 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 		dma_len = sg_dma_len(sg);
 	}
 
+	dma_sync_single_for_device(dev->dev, prp_dma, i * sizeof(*prp_list),
+				   DMA_TO_DEVICE);
 done:
 	cmnd->dptr.prp1 = cpu_to_le64(sg_dma_address(iod->sg));
 	cmnd->dptr.prp2 = cpu_to_le64(iod->first_dma);
@@ -706,10 +713,10 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 	}
 
 	if (entries <= (256 / sizeof(struct nvme_sgl_desc))) {
-		pool = dev->prp_small_pool;
+		pool = &dev->prp_small_pool;
 		iod->npages = 0;
 	} else {
-		pool = dev->prp_page_pool;
+		pool = &dev->prp_page_pool;
 		iod->npages = 1;
 	}
 
@@ -728,6 +735,10 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 		if (i == SGES_PER_PAGE) {
 			struct nvme_sgl_desc *old_sg_desc = sg_list;
 			struct nvme_sgl_desc *link = &old_sg_desc[i - 1];
+	
+			dma_sync_single_for_device(dev->dev, sgl_dma,
+						   i * sizeof(*sg_list),
+						   DMA_TO_DEVICE);
 
 			sg_list = dma_pool_alloc(pool, GFP_ATOMIC, &sgl_dma);
 			if (!sg_list)
@@ -743,6 +754,8 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 		sg = sg_next(sg);
 	} while (--entries > 0);
 
+	dma_sync_single_for_device(dev->dev, sgl_dma, i * sizeof(*sg_list),
+				   DMA_TO_DEVICE);
 	return BLK_STS_OK;
 }
 
@@ -2457,30 +2470,6 @@ static int nvme_disable_prepare_reset(struct nvme_dev *dev, bool shutdown)
 	return 0;
 }
 
-static int nvme_setup_prp_pools(struct nvme_dev *dev)
-{
-	dev->prp_page_pool = dma_pool_create("prp list page", dev->dev,
-						NVME_CTRL_PAGE_SIZE,
-						NVME_CTRL_PAGE_SIZE, 0);
-	if (!dev->prp_page_pool)
-		return -ENOMEM;
-
-	/* Optimisation for I/Os between 4k and 128k */
-	dev->prp_small_pool = dma_pool_create("prp list 256", dev->dev,
-						256, 256, 0);
-	if (!dev->prp_small_pool) {
-		dma_pool_destroy(dev->prp_page_pool);
-		return -ENOMEM;
-	}
-	return 0;
-}
-
-static void nvme_release_prp_pools(struct nvme_dev *dev)
-{
-	dma_pool_destroy(dev->prp_page_pool);
-	dma_pool_destroy(dev->prp_small_pool);
-}
-
 static void nvme_free_tagset(struct nvme_dev *dev)
 {
 	if (dev->tagset.tags)
@@ -2851,10 +2840,6 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
 	mutex_init(&dev->shutdown_lock);
 
-	result = nvme_setup_prp_pools(dev);
-	if (result)
-		goto unmap;
-
 	quirks |= check_vendor_combination_bug(pdev);
 
 	if (!noacpi && nvme_acpi_storage_d3(pdev)) {
@@ -2867,6 +2852,18 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		quirks |= NVME_QUIRK_SIMPLE_SUSPEND;
 	}
 
+	result = dma_pool_init(dev->dev, &dev->prp_page_pool, "prp list page",
+			NVME_CTRL_PAGE_SIZE, NVME_CTRL_PAGE_SIZE, 0,
+			DMA_TO_DEVICE);
+	if (result)
+		goto unmap;
+
+	/* Optimisation for I/Os between 4k and 128k */
+	result = dma_pool_init(dev->dev, &dev->prp_small_pool, "prp list 256",
+			256, 256, 0, DMA_TO_DEVICE);
+	if (result)
+		goto release_prp_page_pool;
+
 	/*
 	 * Double check that our mempool alloc size will cover the biggest
 	 * command we support.
@@ -2880,7 +2877,7 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 						GFP_KERNEL, node);
 	if (!dev->iod_mempool) {
 		result = -ENOMEM;
-		goto release_pools;
+		goto release_prp_small_pool;
 	}
 
 	result = nvme_init_ctrl(&dev->ctrl, &pdev->dev, &nvme_pci_ctrl_ops,
@@ -2897,8 +2894,10 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  release_mempool:
 	mempool_destroy(dev->iod_mempool);
- release_pools:
-	nvme_release_prp_pools(dev);
+ release_prp_small_pool:
+	dma_pool_exit(&dev->prp_small_pool);
+ release_prp_page_pool:
+	dma_pool_exit(&dev->prp_page_pool);
  unmap:
 	nvme_dev_unmap(dev);
  put_pci:
@@ -2963,7 +2962,8 @@ static void nvme_remove(struct pci_dev *pdev)
 	nvme_free_host_mem(dev);
 	nvme_dev_remove_admin(dev);
 	nvme_free_queues(dev, 0);
-	nvme_release_prp_pools(dev);
+	dma_pool_exit(&dev->prp_small_pool);
+	dma_pool_exit(&dev->prp_page_pool);
 	nvme_dev_unmap(dev);
 	nvme_uninit_ctrl(&dev->ctrl);
 }
-- 
2.28.0
