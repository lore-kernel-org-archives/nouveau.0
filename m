From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 4/6] drm/nouveau: introduce NOUVEAU_GEM_TILE_WCUS
Date: Wed, 28 Aug 2013 02:00:48 +0200
Message-ID: <1377648050-6649-5-git-send-email-dev@lynxeye.de>
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

This flag allows userspace to give the kernel a hint that it should use
a non-snooped resource. To guarantee coherency at all times mappings
into userspace are done write combined, so userspace should avoid
reading back from those resources.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
On x86 an optimized userspace can save up on snoop traffic in the
system, on ARM the benefits are potentially much larger, as we can save
the manual cache flush/invalidate.
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 11 ++++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.h |  1 +
 include/uapi/drm/nouveau_drm.h       |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f4a2eb9..c5fcbcc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -231,6 +231,12 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
 
 	nouveau_bo_fixup_align(nvbo, flags, &align, &size);
 	nvbo->bo.mem.num_pages = size >> PAGE_SHIFT;
+
+	if (tile_flags & NOUVEAU_GEM_TILE_WCUS)
+		nvbo->valid_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
+	else
+		nvbo->valid_caching = TTM_PL_MASK_CACHING;
+
 	nouveau_bo_placement_set(nvbo, flags, 0);
 
 	acc_size = ttm_bo_dma_acc_size(&drm->ttm.bdev, size,
@@ -292,7 +298,7 @@ void
 nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t type, uint32_t busy)
 {
 	struct ttm_placement *pl = &nvbo->placement;
-	uint32_t flags = TTM_PL_MASK_CACHING |
+	uint32_t flags = nvbo->valid_caching |
 		(nvbo->pin_refcnt ? TTM_PL_FLAG_NO_EVICT : 0);
 
 	pl->placement = nvbo->placements;
@@ -1554,6 +1560,9 @@ nouveau_bo_vma_add(struct nouveau_bo *nvbo, struct nouveau_vm *vm,
 	if (nvbo->bo.mem.mem_type == TTM_PL_VRAM)
 		nouveau_vm_map(vma, nvbo->bo.mem.mm_node);
 	else if (nvbo->bo.mem.mem_type == TTM_PL_TT) {
+		if (!(nvbo->valid_caching & TTM_PL_FLAG_CACHED))
+			vma->access |= NV_MEM_ACCESS_NOSNOOP;
+
 		if (node->sg)
 			nouveau_vm_map_sg_table(vma, 0, size, node);
 		else
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 653dbbb..2ecf8b7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -9,6 +9,7 @@ struct nouveau_bo {
 	struct ttm_buffer_object bo;
 	struct ttm_placement placement;
 	u32 valid_domains;
+	u32 valid_caching;
 	u32 placements[3];
 	u32 busy_placements[3];
 	struct ttm_bo_kmap_obj kmap;
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 2a5769f..4948eee2 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -36,6 +36,7 @@
 #define NOUVEAU_GEM_TILE_32BPP       0x00000002
 #define NOUVEAU_GEM_TILE_ZETA        0x00000004
 #define NOUVEAU_GEM_TILE_NONCONTIG   0x00000008
+#define NOUVEAU_GEM_TILE_WCUS        0x00000010 /* write-combined, unsnooped */
 
 struct drm_nouveau_gem_info {
 	uint32_t handle;
-- 
1.8.3.1
