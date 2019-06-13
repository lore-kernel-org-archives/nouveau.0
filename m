From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 08/22] memremap: pass a struct dev_pagemap to ->kill
Date: Thu, 13 Jun 2019 11:43:11 +0200
Message-ID: <20190613094326.24093-9-hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190613094326.24093-1-hch-jcswGhMUV9g@public.gmane.org>
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
vs the actual references.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/dax/device.c              | 7 +++----
 drivers/nvdimm/pmem.c             | 6 +++---
 drivers/pci/p2pdma.c              | 6 +++---
 include/linux/memremap.h          | 2 +-
 kernel/memremap.c                 | 4 ++--
 mm/hmm.c                          | 4 ++--
 tools/testing/nvdimm/test/iomap.c | 6 ++----
 7 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 4adab774dade..e23fa1bd8c97 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -37,13 +37,12 @@ static void dev_dax_percpu_exit(void *data)
 	percpu_ref_exit(ref);
 }
 
-static void dev_dax_percpu_kill(struct percpu_ref *data)
+static void dev_dax_percpu_kill(struct dev_pagemap *pgmap)
 {
-	struct percpu_ref *ref = data;
-	struct dev_dax *dev_dax = ref_to_dev_dax(ref);
+	struct dev_dax *dev_dax = container_of(pgmap, struct dev_dax, pgmap);
 
 	dev_dbg(&dev_dax->dev, "%s\n", __func__);
-	percpu_ref_kill(ref);
+	percpu_ref_kill(pgmap->ref);
 }
 
 static int check_vma(struct dev_dax *dev_dax, struct vm_area_struct *vma,
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 4efbf184ea68..b9638c6553a1 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -316,11 +316,11 @@ static void pmem_release_queue(void *q)
 	blk_cleanup_queue(q);
 }
 
-static void pmem_kill(struct percpu_ref *ref)
+static void pmem_kill(struct dev_pagemap *pgmap)
 {
-	struct request_queue *q;
+	struct request_queue *q =
+		container_of(pgmap->ref, struct request_queue, q_usage_counter);
 
-	q = container_of(ref, typeof(*q), q_usage_counter);
 	blk_freeze_queue_start(q);
 }
 
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 6e76380f5b97..3bcacc9222c6 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -82,7 +82,7 @@ static void pci_p2pdma_percpu_release(struct percpu_ref *ref)
 	complete_all(&p2p->devmap_ref_done);
 }
 
-static void pci_p2pdma_percpu_kill(struct percpu_ref *ref)
+static void pci_p2pdma_percpu_kill(struct dev_pagemap *pgmap)
 {
 	/*
 	 * pci_p2pdma_add_resource() may be called multiple times
@@ -90,10 +90,10 @@ static void pci_p2pdma_percpu_kill(struct percpu_ref *ref)
 	 * times. We only want the first action to actually kill the
 	 * percpu_ref.
 	 */
-	if (percpu_ref_is_dying(ref))
+	if (percpu_ref_is_dying(pgmap->ref))
 		return;
 
-	percpu_ref_kill(ref);
+	percpu_ref_kill(pgmap->ref);
 }
 
 static void pci_p2pdma_release(void *data)
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 5f7f40875b35..96a3a6d564ad 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -74,7 +74,7 @@ struct dev_pagemap_ops {
 	/*
 	 * Transition the percpu_ref in struct dev_pagemap to the dead state.
 	 */
-	void (*kill)(struct percpu_ref *ref);
+	void (*kill)(struct dev_pagemap *pgmap);
 };
 
 /**
diff --git a/kernel/memremap.c b/kernel/memremap.c
index e23286ce0ec4..94b830b6eca5 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -92,7 +92,7 @@ static void devm_memremap_pages_release(void *data)
 	unsigned long pfn;
 	int nid;
 
-	pgmap->ops->kill(pgmap->ref);
+	pgmap->ops->kill(pgmap);
 	for_each_device_pfn(pfn, pgmap)
 		put_page(pfn_to_page(pfn));
 
@@ -266,7 +266,7 @@ void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)
  err_pfn_remap:
 	pgmap_array_delete(res);
  err_array:
-	pgmap->ops->kill(pgmap->ref);
+	pgmap->ops->kill(pgmap);
 	return ERR_PTR(error);
 }
 EXPORT_SYMBOL_GPL(devm_memremap_pages);
diff --git a/mm/hmm.c b/mm/hmm.c
index 2501ac6045d0..c76a1b5defda 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -1325,9 +1325,9 @@ static void hmm_devmem_ref_exit(void *data)
 	percpu_ref_exit(ref);
 }
 
-static void hmm_devmem_ref_kill(struct percpu_ref *ref)
+static void hmm_devmem_ref_kill(struct dev_pagemap *pgmap)
 {
-	percpu_ref_kill(ref);
+	percpu_ref_kill(pgmap->ref);
 }
 
 static vm_fault_t hmm_devmem_fault(struct vm_area_struct *vma,
diff --git a/tools/testing/nvdimm/test/iomap.c b/tools/testing/nvdimm/test/iomap.c
index 7f5ece9b5011..ee07c4de2b35 100644
--- a/tools/testing/nvdimm/test/iomap.c
+++ b/tools/testing/nvdimm/test/iomap.c
@@ -104,11 +104,9 @@ void *__wrap_devm_memremap(struct device *dev, resource_size_t offset,
 }
 EXPORT_SYMBOL(__wrap_devm_memremap);
 
-static void nfit_test_kill(void *_pgmap)
+static void nfit_test_kill(void *pgmap)
 {
-	struct dev_pagemap *pgmap = _pgmap;
-
-	pgmap->ops->kill(pgmap->ref);
+	pgmap->ops->kill(pgmap);
 }
 
 void *__wrap_devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)
-- 
2.20.1
