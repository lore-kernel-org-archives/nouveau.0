From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 10/25] memremap: pass a struct dev_pagemap to ->kill and
 ->cleanup
Date: Wed, 26 Jun 2019 14:27:09 +0200
Message-ID: <20190626122724.13313-11-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190626122724.13313-1-hch-jcswGhMUV9g@public.gmane.org>
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

Passing the actual typed structure leads to more understandable code
vs just passing the ref member.

Reported-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Reviewed-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Reviewed-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Reviewed-by: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/dax/device.c              | 12 ++++++------
 drivers/nvdimm/pmem.c             | 18 +++++++++---------
 drivers/pci/p2pdma.c              |  9 +++++----
 include/linux/memremap.h          |  4 ++--
 kernel/memremap.c                 |  8 ++++----
 mm/hmm.c                          | 10 +++++-----
 tools/testing/nvdimm/test/iomap.c |  4 ++--
 7 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index f390083a64d7..b5257038c188 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -27,21 +27,21 @@ static void dev_dax_percpu_release(struct percpu_ref *ref)
 	complete(&dev_dax->cmp);
 }
 
-static void dev_dax_percpu_exit(struct percpu_ref *ref)
+static void dev_dax_percpu_exit(struct dev_pagemap *pgmap)
 {
-	struct dev_dax *dev_dax = ref_to_dev_dax(ref);
+	struct dev_dax *dev_dax = container_of(pgmap, struct dev_dax, pgmap);
 
 	dev_dbg(&dev_dax->dev, "%s\n", __func__);
 	wait_for_completion(&dev_dax->cmp);
-	percpu_ref_exit(ref);
+	percpu_ref_exit(pgmap->ref);
 }
 
-static void dev_dax_percpu_kill(struct percpu_ref *ref)
+static void dev_dax_percpu_kill(struct dev_pagemap *pgmap)
 {
-	struct dev_dax *dev_dax = ref_to_dev_dax(ref);
+	struct dev_dax *dev_dax = container_of(pgmap, struct dev_dax, pgmap);
 
 	dev_dbg(&dev_dax->dev, "%s\n", __func__);
-	percpu_ref_kill(ref);
+	percpu_ref_kill(pgmap->ref);
 }
 
 static int check_vma(struct dev_dax *dev_dax, struct vm_area_struct *vma,
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index c2449af2b388..9dac48359353 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -303,24 +303,24 @@ static const struct attribute_group *pmem_attribute_groups[] = {
 	NULL,
 };
 
-static void pmem_pagemap_cleanup(struct percpu_ref *ref)
+static void pmem_pagemap_cleanup(struct dev_pagemap *pgmap)
 {
-	struct request_queue *q;
+	struct request_queue *q =
+		container_of(pgmap->ref, struct request_queue, q_usage_counter);
 
-	q = container_of(ref, typeof(*q), q_usage_counter);
 	blk_cleanup_queue(q);
 }
 
-static void pmem_release_queue(void *ref)
+static void pmem_release_queue(void *pgmap)
 {
-	pmem_pagemap_cleanup(ref);
+	pmem_pagemap_cleanup(pgmap);
 }
 
-static void pmem_pagemap_kill(struct percpu_ref *ref)
+static void pmem_pagemap_kill(struct dev_pagemap *pgmap)
 {
-	struct request_queue *q;
+	struct request_queue *q =
+		container_of(pgmap->ref, struct request_queue, q_usage_counter);
 
-	q = container_of(ref, typeof(*q), q_usage_counter);
 	blk_freeze_queue_start(q);
 }
 
@@ -435,7 +435,7 @@ static int pmem_attach_disk(struct device *dev,
 		memcpy(&bb_res, &pmem->pgmap.res, sizeof(bb_res));
 	} else {
 		if (devm_add_action_or_reset(dev, pmem_release_queue,
-					&q->q_usage_counter))
+					&pmem->pgmap))
 			return -ENOMEM;
 		addr = devm_memremap(dev, pmem->phys_addr,
 				pmem->size, ARCH_MEMREMAP_PMEM);
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 13f0380a8c7f..ebd8ce3bba2e 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -90,14 +90,15 @@ static void pci_p2pdma_percpu_release(struct percpu_ref *ref)
 	complete(&p2p_pgmap->ref_done);
 }
 
-static void pci_p2pdma_percpu_kill(struct percpu_ref *ref)
+static void pci_p2pdma_percpu_kill(struct dev_pagemap *pgmap)
 {
-	percpu_ref_kill(ref);
+	percpu_ref_kill(pgmap->ref);
 }
 
-static void pci_p2pdma_percpu_cleanup(struct percpu_ref *ref)
+static void pci_p2pdma_percpu_cleanup(struct dev_pagemap *pgmap)
 {
-	struct p2pdma_pagemap *p2p_pgmap = to_p2p_pgmap(ref);
+	struct p2pdma_pagemap *p2p_pgmap =
+		container_of(pgmap, struct p2pdma_pagemap, pgmap);
 
 	wait_for_completion(&p2p_pgmap->ref_done);
 	percpu_ref_exit(&p2p_pgmap->ref);
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 919755f48c7e..b8666a0d8665 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -74,12 +74,12 @@ struct dev_pagemap_ops {
 	/*
 	 * Transition the refcount in struct dev_pagemap to the dead state.
 	 */
-	void (*kill)(struct percpu_ref *ref);
+	void (*kill)(struct dev_pagemap *pgmap);
 
 	/*
 	 * Wait for refcount in struct dev_pagemap to be idle and reap it.
 	 */
-	void (*cleanup)(struct percpu_ref *ref);
+	void (*cleanup)(struct dev_pagemap *pgmap);
 };
 
 /**
diff --git a/kernel/memremap.c b/kernel/memremap.c
index 0824237ef979..00c1ceb60c19 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -92,10 +92,10 @@ static void devm_memremap_pages_release(void *data)
 	unsigned long pfn;
 	int nid;
 
-	pgmap->ops->kill(pgmap->ref);
+	pgmap->ops->kill(pgmap);
 	for_each_device_pfn(pfn, pgmap)
 		put_page(pfn_to_page(pfn));
-	pgmap->ops->cleanup(pgmap->ref);
+	pgmap->ops->cleanup(pgmap);
 
 	/* pages are dead and unused, undo the arch mapping */
 	align_start = res->start & ~(SECTION_SIZE - 1);
@@ -294,8 +294,8 @@ void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)
  err_pfn_remap:
 	pgmap_array_delete(res);
  err_array:
-	pgmap->ops->kill(pgmap->ref);
-	pgmap->ops->cleanup(pgmap->ref);
+	pgmap->ops->kill(pgmap);
+	pgmap->ops->cleanup(pgmap);
 	return ERR_PTR(error);
 }
 EXPORT_SYMBOL_GPL(devm_memremap_pages);
diff --git a/mm/hmm.c b/mm/hmm.c
index 583a02a16872..987793fba923 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -1352,18 +1352,18 @@ static void hmm_devmem_ref_release(struct percpu_ref *ref)
 	complete(&devmem->completion);
 }
 
-static void hmm_devmem_ref_exit(struct percpu_ref *ref)
+static void hmm_devmem_ref_exit(struct dev_pagemap *pgmap)
 {
 	struct hmm_devmem *devmem;
 
-	devmem = container_of(ref, struct hmm_devmem, ref);
+	devmem = container_of(pgmap, struct hmm_devmem, pagemap);
 	wait_for_completion(&devmem->completion);
-	percpu_ref_exit(ref);
+	percpu_ref_exit(pgmap->ref);
 }
 
-static void hmm_devmem_ref_kill(struct percpu_ref *ref)
+static void hmm_devmem_ref_kill(struct dev_pagemap *pgmap)
 {
-	percpu_ref_kill(ref);
+	percpu_ref_kill(pgmap->ref);
 }
 
 static vm_fault_t hmm_devmem_fault(struct vm_area_struct *vma,
diff --git a/tools/testing/nvdimm/test/iomap.c b/tools/testing/nvdimm/test/iomap.c
index cf3f064a697d..82f901569e06 100644
--- a/tools/testing/nvdimm/test/iomap.c
+++ b/tools/testing/nvdimm/test/iomap.c
@@ -102,8 +102,8 @@ static void nfit_test_kill(void *_pgmap)
 
 	WARN_ON(!pgmap || !pgmap->ref || !pgmap->ops || !pgmap->ops->kill ||
 		!pgmap->ops->cleanup);
-	pgmap->ops->kill(pgmap->ref);
-	pgmap->ops->cleanup(pgmap->ref);
+	pgmap->ops->kill(pgmap);
+	pgmap->ops->cleanup(pgmap);
 }
 
 void *__wrap_devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)
-- 
2.20.1
