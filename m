From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 11/22] memremap: remove the data field in struct dev_pagemap
Date: Thu, 13 Jun 2019 11:43:14 +0200
Message-ID: <20190613094326.24093-12-hch@lst.de>
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

struct dev_pagemap is always embedded into a containing structure, so
there is no need to an additional private data field.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/nvdimm/pmem.c    | 2 +-
 include/linux/memremap.h | 3 +--
 kernel/memremap.c        | 2 +-
 mm/hmm.c                 | 9 +++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 66837eed6375..847d1b2bc10e 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -334,7 +334,7 @@ static void pmem_release_disk(void *__pmem)
 	put_disk(pmem->disk);
 }
 
-static void pmem_fsdax_page_free(struct page *page, void *data)
+static void pmem_fsdax_page_free(struct page *page)
 {
 	wake_up_var(&page->_refcount);
 }
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 03a4099be701..75b80de6394a 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -69,7 +69,7 @@ struct dev_pagemap_ops {
 	 * reach 0 refcount unless there is a refcount bug. This allows the
 	 * device driver to implement its own memory management.)
 	 */
-	void (*page_free)(struct page *page, void *data);
+	void (*page_free)(struct page *page);
 
 	/*
 	 * Transition the percpu_ref in struct dev_pagemap to the dead state.
@@ -99,7 +99,6 @@ struct dev_pagemap {
 	struct resource res;
 	struct percpu_ref *ref;
 	struct device *dev;
-	void *data;
 	enum memory_type type;
 	u64 pci_p2pdma_bus_offset;
 	const struct dev_pagemap_ops *ops;
diff --git a/kernel/memremap.c b/kernel/memremap.c
index 7167e717647d..5c94ad4f5783 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -337,7 +337,7 @@ void __put_devmap_managed_page(struct page *page)
 
 		mem_cgroup_uncharge(page);
 
-		page->pgmap->ops->page_free(page, page->pgmap->data);
+		page->pgmap->ops->page_free(page);
 	} else if (!count)
 		__put_page(page);
 }
diff --git a/mm/hmm.c b/mm/hmm.c
index aab799677c7d..ff0f9568922b 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -1332,15 +1332,17 @@ static void hmm_devmem_ref_kill(struct dev_pagemap *pgmap)
 
 static vm_fault_t hmm_devmem_migrate(struct vm_fault *vmf)
 {
-	struct hmm_devmem *devmem = vmf->page->pgmap->data;
+	struct hmm_devmem *devmem =
+		container_of(vmf->page->pgmap, struct hmm_devmem, pagemap);
 
 	return devmem->ops->fault(devmem, vmf->vma, vmf->address, vmf->page,
 			vmf->flags, vmf->pmd);
 }
 
-static void hmm_devmem_free(struct page *page, void *data)
+static void hmm_devmem_free(struct page *page)
 {
-	struct hmm_devmem *devmem = data;
+	struct hmm_devmem *devmem =
+		container_of(page->pgmap, struct hmm_devmem, pagemap);
 
 	devmem->ops->free(devmem, page);
 }
@@ -1409,7 +1411,6 @@ struct hmm_devmem *hmm_devmem_add(const struct hmm_devmem_ops *ops,
 	devmem->pagemap.ops = &hmm_pagemap_ops;
 	devmem->pagemap.altmap_valid = false;
 	devmem->pagemap.ref = &devmem->ref;
-	devmem->pagemap.data = devmem;
 
 	result = devm_memremap_pages(devmem->device, &devmem->pagemap);
 	if (IS_ERR(result))
-- 
2.20.1
