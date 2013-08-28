From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 2/6] drm/ttm: introduce dma cache sync helpers
Date: Wed, 28 Aug 2013 02:00:46 +0200
Message-ID: <1377648050-6649-3-git-send-email-dev@lynxeye.de>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On arches with non-coherent PCI, we need to flush caches ourselfes at
the appropriate places. Introduce two small helpers to make things easy
for TTM based drivers.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/gpu/drm/ttm/ttm_tt.c    | 25 +++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_driver.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 5e93a52..935e121 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -38,6 +38,7 @@
 #include <linux/swap.h>
 #include <linux/slab.h>
 #include <linux/export.h>
+#include <linux/dma-mapping.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_mem_util.h>
 #include <drm/ttm/ttm_module.h>
@@ -249,6 +250,30 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma)
 }
 EXPORT_SYMBOL(ttm_dma_tt_fini);
 
+void ttm_dma_tt_cache_sync_for_device(struct ttm_dma_tt *ttm_dma,
+				      struct device *dev)
+{
+	int i;
+
+	for (i = 0; i < ttm_dma->ttm.num_pages; i++) {
+		dma_sync_single_for_device(dev, ttm_dma->dma_address[i],
+					   PAGE_SIZE, DMA_TO_DEVICE);
+	}
+}
+EXPORT_SYMBOL(ttm_dma_tt_cache_sync_for_device);
+
+void ttm_dma_tt_cache_sync_for_cpu(struct ttm_dma_tt *ttm_dma,
+				   struct device *dev)
+{
+	int i;
+
+	for (i = 0; i < ttm_dma->ttm.num_pages; i++) {
+		dma_sync_single_for_cpu(dev, ttm_dma->dma_address[i],
+					PAGE_SIZE, DMA_FROM_DEVICE);
+	}
+}
+EXPORT_SYMBOL(ttm_dma_tt_cache_sync_for_cpu);
+
 void ttm_tt_unbind(struct ttm_tt *ttm)
 {
 	int ret;
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 984fc2d..db5f3b5 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -40,6 +40,7 @@
 #include <linux/fs.h>
 #include <linux/spinlock.h>
 #include <linux/reservation.h>
+#include <linux/device.h>
 
 struct ttm_backend_func {
 	/**
@@ -681,6 +682,33 @@ extern int ttm_tt_set_placement_caching(struct ttm_tt *ttm, uint32_t placement);
 extern int ttm_tt_swapout(struct ttm_tt *ttm,
 			  struct file *persistent_swap_storage);
 
+/**
+ * ttm_dma_tt_cache_sync_for_device:
+ *
+ * @ttm A struct ttm_tt of the type returned by ttm_dma_tt_init.
+ * @dev A struct device representing the device to which to sync.
+ *
+ * This function will flush the CPU caches on arches where snooping in the
+ * TT is not available. On fully coherent arches this will turn into an (almost)
+ * noop. This makes sure that data written by the CPU is visible to the device.
+ */
+extern void ttm_dma_tt_cache_sync_for_device(struct ttm_dma_tt *ttm_dma,
+					     struct device *dev);
+
+/**
+ * ttm_dma_tt_cache_sync_for_cpu:
+ *
+ * @ttm A struct ttm_tt of the type returned by ttm_dma_tt_init.
+ * @dev A struct device representing the device from which to sync.
+ *
+ * This function will invalidate the CPU caches on arches where snooping in the
+ * TT is not available. On fully coherent arches this will turn into an (almost)
+ * noop. This makes sure that the CPU does not read any stale cached or
+ * prefetched data.
+ */
+extern void ttm_dma_tt_cache_sync_for_cpu(struct ttm_dma_tt *ttm_dma,
+					  struct device *dev);
+
 /*
  * ttm_bo.c
  */
-- 
1.8.3.1
