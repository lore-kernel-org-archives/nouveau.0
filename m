From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 08/25] memremap: validate the pagemap type passed to
 devm_memremap_pages
Date: Wed, 26 Jun 2019 14:27:07 +0200
Message-ID: <20190626122724.13313-9-hch@lst.de>
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

Most pgmap types are only supported when certain config options are
enabled.  Check for a type that is valid for the current configuration
before setting up the pagemap.  For this the usage of the 0 type for
device dax gets replaced with an explicit MEMORY_DEVICE_DEVDAX type.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 drivers/dax/device.c     |  1 +
 include/linux/memremap.h |  8 ++++++++
 kernel/memremap.c        | 22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 8465d12fecba..79014baa782d 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -468,6 +468,7 @@ int dev_dax_probe(struct device *dev)
 	dev_dax->pgmap.ref = &dev_dax->ref;
 	dev_dax->pgmap.kill = dev_dax_percpu_kill;
 	dev_dax->pgmap.cleanup = dev_dax_percpu_exit;
+	dev_dax->pgmap.type = MEMORY_DEVICE_DEVDAX;
 	addr = devm_memremap_pages(dev, &dev_dax->pgmap);
 	if (IS_ERR(addr))
 		return PTR_ERR(addr);
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 995c62c5a48b..0c86f2c5ac9c 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -45,13 +45,21 @@ struct vmem_altmap {
  * wakeup is used to coordinate physical address space management (ex:
  * fs truncate/hole punch) vs pinned pages (ex: device dma).
  *
+ * MEMORY_DEVICE_DEVDAX:
+ * Host memory that has similar access semantics as System RAM i.e. DMA
+ * coherent and supports page pinning. In contrast to
+ * MEMORY_DEVICE_FS_DAX, this memory is access via a device-dax
+ * character device.
+ *
  * MEMORY_DEVICE_PCI_P2PDMA:
  * Device memory residing in a PCI BAR intended for use with Peer-to-Peer
  * transactions.
  */
 enum memory_type {
+	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
 	MEMORY_DEVICE_FS_DAX,
+	MEMORY_DEVICE_DEVDAX,
 	MEMORY_DEVICE_PCI_P2PDMA,
 };
 
diff --git a/kernel/memremap.c b/kernel/memremap.c
index 6e1970719dc2..abda62d1e5a3 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -157,6 +157,28 @@ void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)
 	pgprot_t pgprot = PAGE_KERNEL;
 	int error, nid, is_ram;
 
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
+			WARN(1, "Device private memory not supported\n");
+			return ERR_PTR(-EINVAL);
+		}
+		break;
+	case MEMORY_DEVICE_FS_DAX:
+		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
+		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
+			WARN(1, "File system DAX not supported\n");
+			return ERR_PTR(-EINVAL);
+		}
+		break;
+	case MEMORY_DEVICE_DEVDAX:
+	case MEMORY_DEVICE_PCI_P2PDMA:
+		break;
+	default:
+		WARN(1, "Invalid pgmap type %d\n", pgmap->type);
+		break;
+	}
+
 	if (!pgmap->ref || !pgmap->kill || !pgmap->cleanup) {
 		WARN(1, "Missing reference count teardown definition\n");
 		return ERR_PTR(-EINVAL);
-- 
2.20.1
