From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5] drm/nouveau: map pages using DMA API
Date: Thu, 31 Jul 2014 18:09:42 +0900
Message-ID: <1406797782-32220-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The DMA API is the recommended way to map pages no matter what the
underlying bus is. Use the DMA functions for page mapping and remove
currently existing wrappers.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
---
Changes since v4:
- Patch against the Nouveau tree instead of the kernel
- Separated this patch from the rest of the series since it can be
  merged alone
- Replaced all pci_map invokations with dma_map. As Daniel pointed
  out, using the PCI API is deprecated:
Documentation/DMA-API-HOWTO.txt:

"Note that the DMA API works with any bus independent of the underlying
microprocessor architecture. You should use the DMA API rather than the
bus-specific DMA API, i.e., use the dma_map_*() interfaces rather than the
pci_map_*() interfaces."
- As a result, removed the page mapping wrappers which have become
  unneeded.

 drm/nouveau_bo.c           | 22 ++++++++++++++++------
 lib/core/os.h              |  8 ++++----
 nvkm/engine/device/base.c  | 25 -------------------------
 nvkm/include/core/device.h |  6 ------
 nvkm/subdev/fb/nv50.c      |  7 +++++--
 nvkm/subdev/fb/nvc0.c      |  7 +++++--
 6 files changed, 30 insertions(+), 45 deletions(-)

diff --git a/drm/nouveau_bo.c b/drm/nouveau_bo.c
index 4db886f9f793..e4f2071c46c3 100644
--- a/drm/nouveau_bo.c
+++ b/drm/nouveau_bo.c
@@ -1340,6 +1340,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm)
 	struct nouveau_drm *drm;
 	struct nouveau_device *device;
 	struct drm_device *dev;
+	struct device *pdev;
 	unsigned i;
 	int r;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
@@ -1358,6 +1359,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm)
 	drm = nouveau_bdev(ttm->bdev);
 	device = nv_device(drm->device);
 	dev = drm->dev;
+	pdev = nv_device_base(device);
 
 #if __OS_HAS_AGP
 	if (drm->agp.stat == ENABLED) {
@@ -1377,17 +1379,22 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm)
 	}
 
 	for (i = 0; i < ttm->num_pages; i++) {
-		ttm_dma->dma_address[i] = nv_device_map_page(device,
-							     ttm->pages[i]);
-		if (!ttm_dma->dma_address[i]) {
+		dma_addr_t addr;
+
+		addr = dma_map_page(pdev, ttm->pages[i], 0, PAGE_SIZE,
+				    DMA_BIDIRECTIONAL);
+
+		if (dma_mapping_error(pdev, addr)) {
 			while (--i) {
-				nv_device_unmap_page(device,
-						     ttm_dma->dma_address[i]);
+				dma_unmap_page(pdev, ttm_dma->dma_address[i],
+					       PAGE_SIZE, DMA_BIDIRECTIONAL);
 				ttm_dma->dma_address[i] = 0;
 			}
 			ttm_pool_unpopulate(ttm);
 			return -EFAULT;
 		}
+
+		ttm_dma->dma_address[i] = addr;
 	}
 	return 0;
 }
@@ -1399,6 +1406,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	struct nouveau_drm *drm;
 	struct nouveau_device *device;
 	struct drm_device *dev;
+	struct device *pdev;
 	unsigned i;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
@@ -1408,6 +1416,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	drm = nouveau_bdev(ttm->bdev);
 	device = nv_device(drm->device);
 	dev = drm->dev;
+	pdev = nv_device_base(device);
 
 #if __OS_HAS_AGP
 	if (drm->agp.stat == ENABLED) {
@@ -1425,7 +1434,8 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 
 	for (i = 0; i < ttm->num_pages; i++) {
 		if (ttm_dma->dma_address[i]) {
-			nv_device_unmap_page(device, ttm_dma->dma_address[i]);
+			dma_unmap_page(pdev, ttm_dma->dma_address[i], PAGE_SIZE,
+				       DMA_BIDIRECTIONAL);
 		}
 	}
 
diff --git a/lib/core/os.h b/lib/core/os.h
index 5f4f04fbff3d..596e083ffb36 100644
--- a/lib/core/os.h
+++ b/lib/core/os.h
@@ -644,7 +644,7 @@ dma_free_coherent(struct device *dev, size_t sz, void *vaddr, dma_addr_t bus)
  *****************************************************************************/
 #include <pciaccess.h>
 
-#define PCI_DMA_BIDIRECTIONAL 1
+#define DMA_BIDIRECTIONAL 1
 
 #define PCI_CAP_ID_AGP 0x02
 
@@ -688,7 +688,7 @@ pci_resource_len(struct pci_dev *pdev, int bar)
 }
 
 static inline dma_addr_t
-pci_map_page(struct pci_dev *pdev, struct page *page, int offset,
+dma_map_page(struct device *pdev, struct page *page, int offset,
 	     int length, unsigned flags)
 {
 	return 0;
@@ -696,13 +696,13 @@ pci_map_page(struct pci_dev *pdev, struct page *page, int offset,
 
 
 static inline bool
-pci_dma_mapping_error(struct pci_dev *pdev, dma_addr_t addr)
+dma_mapping_error(struct device *pdev, dma_addr_t addr)
 {
 	return true;
 }
 
 static inline void
-pci_unmap_page(struct pci_dev *pdev, dma_addr_t addr, int size, unsigned flags)
+dma_unmap_page(struct device *pdev, dma_addr_t addr, int size, unsigned flags)
 {
 }
 
diff --git a/nvkm/engine/device/base.c b/nvkm/engine/device/base.c
index 466dda2f7a3a..6c16dabe13b3 100644
--- a/nvkm/engine/device/base.c
+++ b/nvkm/engine/device/base.c
@@ -487,31 +487,6 @@ nv_device_resource_len(struct nouveau_device *device, unsigned int bar)
 	}
 }
 
-dma_addr_t
-nv_device_map_page(struct nouveau_device *device, struct page *page)
-{
-	dma_addr_t ret;
-
-	if (nv_device_is_pci(device)) {
-		ret = pci_map_page(device->pdev, page, 0, PAGE_SIZE,
-				   PCI_DMA_BIDIRECTIONAL);
-		if (pci_dma_mapping_error(device->pdev, ret))
-			ret = 0;
-	} else {
-		ret = page_to_phys(page);
-	}
-
-	return ret;
-}
-
-void
-nv_device_unmap_page(struct nouveau_device *device, dma_addr_t addr)
-{
-	if (nv_device_is_pci(device))
-		pci_unmap_page(device->pdev, addr, PAGE_SIZE,
-			       PCI_DMA_BIDIRECTIONAL);
-}
-
 int
 nv_device_get_irq(struct nouveau_device *device, bool stall)
 {
diff --git a/nvkm/include/core/device.h b/nvkm/include/core/device.h
index 9ce2ee9aa32e..03c039dcc61f 100644
--- a/nvkm/include/core/device.h
+++ b/nvkm/include/core/device.h
@@ -174,12 +174,6 @@ nv_device_resource_start(struct nouveau_device *device, unsigned int bar);
 resource_size_t
 nv_device_resource_len(struct nouveau_device *device, unsigned int bar);
 
-dma_addr_t
-nv_device_map_page(struct nouveau_device *device, struct page *page);
-
-void
-nv_device_unmap_page(struct nouveau_device *device, dma_addr_t addr);
-
 int
 nv_device_get_irq(struct nouveau_device *device, bool stall);
 
diff --git a/nvkm/subdev/fb/nv50.c b/nvkm/subdev/fb/nv50.c
index 1fc55c1e91a1..7d88e17fa927 100644
--- a/nvkm/subdev/fb/nv50.c
+++ b/nvkm/subdev/fb/nv50.c
@@ -250,7 +250,9 @@ nv50_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	priv->r100c08_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (priv->r100c08_page) {
-		priv->r100c08 = nv_device_map_page(device, priv->r100c08_page);
+		priv->r100c08 = dma_map_page(nv_device_base(device),
+					     priv->r100c08_page, 0, PAGE_SIZE,
+					     DMA_BIDIRECTIONAL);
 		if (!priv->r100c08)
 			nv_warn(priv, "failed 0x100c08 page map\n");
 	} else {
@@ -268,7 +270,8 @@ nv50_fb_dtor(struct nouveau_object *object)
 	struct nv50_fb_priv *priv = (void *)object;
 
 	if (priv->r100c08_page) {
-		nv_device_unmap_page(device, priv->r100c08);
+		dma_unmap_page(nv_device_base(device), priv->r100c08, PAGE_SIZE,
+			       DMA_BIDIRECTIONAL);
 		__free_page(priv->r100c08_page);
 	}
 
diff --git a/nvkm/subdev/fb/nvc0.c b/nvkm/subdev/fb/nvc0.c
index 0670ae33ee45..9f5f3ac8d4c6 100644
--- a/nvkm/subdev/fb/nvc0.c
+++ b/nvkm/subdev/fb/nvc0.c
@@ -70,7 +70,8 @@ nvc0_fb_dtor(struct nouveau_object *object)
 	struct nvc0_fb_priv *priv = (void *)object;
 
 	if (priv->r100c10_page) {
-		nv_device_unmap_page(device, priv->r100c10);
+		dma_unmap_page(nv_device_base(device), priv->r100c10, PAGE_SIZE,
+			       DMA_BIDIRECTIONAL);
 		__free_page(priv->r100c10_page);
 	}
 
@@ -93,7 +94,9 @@ nvc0_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	priv->r100c10_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (priv->r100c10_page) {
-		priv->r100c10 = nv_device_map_page(device, priv->r100c10_page);
+		priv->r100c10 = dma_map_page(nv_device_base(device),
+					     priv->r100c10_page, 0, PAGE_SIZE,
+					     DMA_BIDIRECTIONAL);
 		if (!priv->r100c10)
 			return -EFAULT;
 	}
-- 
2.0.3
