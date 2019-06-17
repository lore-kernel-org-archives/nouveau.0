From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 16/25] PCI/P2PDMA: use the dev_pagemap internal refcount
Date: Mon, 17 Jun 2019 14:27:24 +0200
Message-ID: <20190617122733.22432-17-hch@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190617122733.22432-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The functionality is identical to the one currently open coded in
p2pdma.c.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/pci/p2pdma.c | 56 ++++----------------------------------------
 1 file changed, 4 insertions(+), 52 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 48a88158e46a..608f84df604a 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -24,12 +24,6 @@ struct pci_p2pdma {
 	bool p2pmem_published;
 };
 
-struct p2pdma_pagemap {
-	struct dev_pagemap pgmap;
-	struct percpu_ref ref;
-	struct completion ref_done;
-};
-
 static ssize_t size_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
@@ -78,32 +72,6 @@ static const struct attribute_group p2pmem_group = {
 	.name = "p2pmem",
 };
 
-static struct p2pdma_pagemap *to_p2p_pgmap(struct percpu_ref *ref)
-{
-	return container_of(ref, struct p2pdma_pagemap, ref);
-}
-
-static void pci_p2pdma_percpu_release(struct percpu_ref *ref)
-{
-	struct p2pdma_pagemap *p2p_pgmap = to_p2p_pgmap(ref);
-
-	complete(&p2p_pgmap->ref_done);
-}
-
-static void pci_p2pdma_percpu_kill(struct dev_pagemap *pgmap)
-{
-	percpu_ref_kill(pgmap->ref);
-}
-
-static void pci_p2pdma_percpu_cleanup(struct dev_pagemap *pgmap)
-{
-	struct p2pdma_pagemap *p2p_pgmap =
-		container_of(pgmap, struct p2pdma_pagemap, pgmap);
-
-	wait_for_completion(&p2p_pgmap->ref_done);
-	percpu_ref_exit(&p2p_pgmap->ref);
-}
-
 static void pci_p2pdma_release(void *data)
 {
 	struct pci_dev *pdev = data;
@@ -153,11 +121,6 @@ static int pci_p2pdma_setup(struct pci_dev *pdev)
 	return error;
 }
 
-static const struct dev_pagemap_ops pci_p2pdma_pagemap_ops = {
-	.kill		= pci_p2pdma_percpu_kill,
-	.cleanup	= pci_p2pdma_percpu_cleanup,
-};
-
 /**
  * pci_p2pdma_add_resource - add memory for use as p2p memory
  * @pdev: the device to add the memory to
@@ -171,7 +134,6 @@ static const struct dev_pagemap_ops pci_p2pdma_pagemap_ops = {
 int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 			    u64 offset)
 {
-	struct p2pdma_pagemap *p2p_pgmap;
 	struct dev_pagemap *pgmap;
 	void *addr;
 	int error;
@@ -194,22 +156,12 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 			return error;
 	}
 
-	p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
-	if (!p2p_pgmap)
+	pgmap = devm_kzalloc(&pdev->dev, sizeof(*pgmap), GFP_KERNEL);
+	if (!pgmap)
 		return -ENOMEM;
-
-	init_completion(&p2p_pgmap->ref_done);
-	error = percpu_ref_init(&p2p_pgmap->ref,
-			pci_p2pdma_percpu_release, 0, GFP_KERNEL);
-	if (error)
-		goto pgmap_free;
-
-	pgmap = &p2p_pgmap->pgmap;
-
 	pgmap->res.start = pci_resource_start(pdev, bar) + offset;
 	pgmap->res.end = pgmap->res.start + size - 1;
 	pgmap->res.flags = pci_resource_flags(pdev, bar);
-	pgmap->ref = &p2p_pgmap->ref;
 	pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
 	pgmap->pci_p2pdma_bus_offset = pci_bus_address(pdev, bar) -
 		pci_resource_start(pdev, bar);
@@ -223,7 +175,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	error = gen_pool_add_owner(pdev->p2pdma->pool, (unsigned long)addr,
 			pci_bus_address(pdev, bar) + offset,
 			resource_size(&pgmap->res), dev_to_node(&pdev->dev),
-			&p2p_pgmap->ref);
+			pgmap->ref);
 	if (error)
 		goto pages_free;
 
@@ -235,7 +187,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 pages_free:
 	devm_memunmap_pages(&pdev->dev, pgmap);
 pgmap_free:
-	devm_kfree(&pdev->dev, p2p_pgmap);
+	devm_kfree(&pdev->dev, pgmap);
 	return error;
 }
 EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
-- 
2.20.1
