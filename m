From: Lauri Peltonen <lpeltonen@nvidia.com>
Subject: [RFC PATCH 6/7] drm/nouveau: Support marking buffers for explicit sync
Date: Fri, 26 Sep 2014 13:00:11 +0300
Message-ID: <1411725612-10455-7-git-send-email-lpeltonen@nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

Do not attach fences automatically to buffers that are marked for
explicit synchronization.

Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
---
 drm/nouveau_bo.c           |  8 ++++----
 drm/nouveau_bo.h           |  4 ++--
 drm/nouveau_drm.c          |  1 +
 drm/nouveau_gem.c          | 47 +++++++++++++++++++++++++++++++++++++++-------
 drm/nouveau_gem.h          |  6 ++++--
 drm/nouveau_ttm.c          |  8 ++++----
 drm/nv50_display.c         |  2 +-
 drm/uapi/drm/nouveau_drm.h |  5 ++++-
 8 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drm/nouveau_bo.c b/drm/nouveau_bo.c
index 534734a..68b7bdd 100644
--- a/drm/nouveau_bo.c
+++ b/drm/nouveau_bo.c
@@ -180,7 +180,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
 
 int
 nouveau_bo_new(struct drm_device *dev, int size, int align,
-	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
+	       uint32_t flags, uint32_t tile_mode, uint32_t bo_flags,
 	       struct sg_table *sg,
 	       struct nouveau_bo **pnvbo)
 {
@@ -211,7 +211,7 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
 	nvbo->tile_mode = tile_mode;
-	nvbo->tile_flags = tile_flags;
+	nvbo->bo_flags = bo_flags;
 	nvbo->bo.bdev = &drm->ttm.bdev;
 
 	if (!nv_device_is_cpu_coherent(nvkm_device(&drm->device)))
@@ -272,7 +272,7 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t type)
 		 * speed up when alpha-blending and depth-test are enabled
 		 * at the same time.
 		 */
-		if (nvbo->tile_flags & NOUVEAU_GEM_TILE_ZETA) {
+		if (nvbo->bo_flags & NOUVEAU_GEM_TILE_ZETA) {
 			fpfn = vram_pages / 2;
 			lpfn = ~0;
 		} else {
@@ -1291,7 +1291,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem,
 	if (drm->device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
 		*new_tile = nv10_bo_set_tiling(dev, offset, new_mem->size,
 						nvbo->tile_mode,
-						nvbo->tile_flags);
+						nvbo->bo_flags);
 	}
 
 	return 0;
diff --git a/drm/nouveau_bo.h b/drm/nouveau_bo.h
index f97bc26..ff1edba 100644
--- a/drm/nouveau_bo.h
+++ b/drm/nouveau_bo.h
@@ -25,7 +25,7 @@ struct nouveau_bo {
 	unsigned page_shift;
 
 	u32 tile_mode;
-	u32 tile_flags;
+	u32 bo_flags;
 	struct nouveau_drm_tile *tile;
 
 	/* Only valid if allocated via nouveau_gem_new() and iff you hold a
@@ -68,7 +68,7 @@ extern struct ttm_bo_driver nouveau_bo_driver;
 
 void nouveau_bo_move_init(struct nouveau_drm *);
 int  nouveau_bo_new(struct drm_device *, int size, int align, u32 flags,
-		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
+		    u32 tile_mode, u32 bo_flags, struct sg_table *sg,
 		    struct nouveau_bo **);
 int  nouveau_bo_pin(struct nouveau_bo *, u32 flags);
 int  nouveau_bo_unpin(struct nouveau_bo *);
diff --git a/drm/nouveau_drm.c b/drm/nouveau_drm.c
index 74d5ac6..3d84f3a 100644
--- a/drm/nouveau_drm.c
+++ b/drm/nouveau_drm.c
@@ -816,6 +816,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_SET_INFO, nouveau_gem_ioctl_set_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 long
diff --git a/drm/nouveau_gem.c b/drm/nouveau_gem.c
index ee5782c..bb19507 100644
--- a/drm/nouveau_gem.c
+++ b/drm/nouveau_gem.c
@@ -149,7 +149,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 
 int
 nouveau_gem_new(struct drm_device *dev, int size, int align, uint32_t domain,
-		uint32_t tile_mode, uint32_t tile_flags,
+		uint32_t tile_mode, uint32_t bo_flags,
 		struct nouveau_bo **pnvbo)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -165,7 +165,7 @@ nouveau_gem_new(struct drm_device *dev, int size, int align, uint32_t domain,
 		flags |= TTM_PL_FLAG_SYSTEM;
 
 	ret = nouveau_bo_new(dev, size, align, flags, tile_mode,
-			     tile_flags, NULL, pnvbo);
+			     bo_flags, NULL, pnvbo);
 	if (ret)
 		return ret;
 	nvbo = *pnvbo;
@@ -216,7 +216,21 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 	rep->size = nvbo->bo.mem.num_pages << PAGE_SHIFT;
 	rep->map_handle = drm_vma_node_offset_addr(&nvbo->bo.vma_node);
 	rep->tile_mode = nvbo->tile_mode;
-	rep->tile_flags = nvbo->tile_flags;
+	rep->bo_flags = nvbo->bo_flags;
+	return 0;
+}
+
+static int
+nouveau_gem_set_info(struct drm_file *file_priv, struct drm_gem_object *gem,
+		     struct drm_nouveau_gem_info *req)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
+
+	if (req->bo_flags & NOUVEAU_GEM_EXPLICIT_SYNC)
+		nvbo->bo_flags |= NOUVEAU_GEM_EXPLICIT_SYNC;
+	else
+		nvbo->bo_flags &= ~NOUVEAU_GEM_EXPLICIT_SYNC;
+
 	return 0;
 }
 
@@ -231,14 +245,15 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 	struct nouveau_bo *nvbo = NULL;
 	int ret = 0;
 
-	if (!pfb->memtype_valid(pfb, req->info.tile_flags)) {
-		NV_PRINTK(error, cli, "bad page flags: 0x%08x\n", req->info.tile_flags);
+	if (!pfb->memtype_valid(pfb, req->info.bo_flags)) {
+		NV_PRINTK(error, cli, "bad page flags: 0x%08x\n",
+			  req->info.bo_flags);
 		return -EINVAL;
 	}
 
 	ret = nouveau_gem_new(dev, req->info.size, req->align,
 			      req->info.domain, req->info.tile_mode,
-			      req->info.tile_flags, &nvbo);
+			      req->info.bo_flags, &nvbo);
 	if (ret)
 		return ret;
 
@@ -303,12 +318,14 @@ validate_fini_no_ticket(struct validate_op *op, struct nouveau_fence *fence,
 {
 	struct nouveau_bo *nvbo;
 	struct drm_nouveau_gem_pushbuf_bo *b;
+	bool explicit_sync;
 
 	while (!list_empty(&op->list)) {
 		nvbo = list_entry(op->list.next, struct nouveau_bo, entry);
 		b = &pbbo[nvbo->pbbo_index];
+		explicit_sync = !!(nvbo->bo_flags & NOUVEAU_GEM_EXPLICIT_SYNC);
 
-		if (likely(fence))
+		if (likely(fence) && !explicit_sync)
 			nouveau_bo_fence(nvbo, fence, !!b->write_domains);
 
 		if (unlikely(nvbo->validate_mapped)) {
@@ -947,3 +964,19 @@ nouveau_gem_ioctl_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
+int
+nouveau_gem_ioctl_set_info(struct drm_device *dev, void *data,
+			   struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_info *req = data;
+	struct drm_gem_object *gem;
+	int ret;
+
+	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
+	if (!gem)
+		return -ENOENT;
+
+	ret = nouveau_gem_set_info(file_priv, gem, req);
+	drm_gem_object_unreference_unlocked(gem);
+	return ret;
+}
diff --git a/drm/nouveau_gem.h b/drm/nouveau_gem.h
index 7454dea..abac606 100644
--- a/drm/nouveau_gem.h
+++ b/drm/nouveau_gem.h
@@ -7,7 +7,7 @@
 #include "nouveau_bo.h"
 
 #define nouveau_bo_tile_layout(nvbo)				\
-	((nvbo)->tile_flags & NOUVEAU_GEM_TILE_LAYOUT_MASK)
+	((nvbo)->bo_flags & NOUVEAU_GEM_TILE_LAYOUT_MASK)
 
 static inline struct nouveau_bo *
 nouveau_gem_object(struct drm_gem_object *gem)
@@ -18,7 +18,7 @@ nouveau_gem_object(struct drm_gem_object *gem)
 /* nouveau_gem.c */
 extern int nouveau_gem_new(struct drm_device *, int size, int align,
 			   uint32_t domain, uint32_t tile_mode,
-			   uint32_t tile_flags, struct nouveau_bo **);
+			   uint32_t bo_flags, struct nouveau_bo **);
 extern void nouveau_gem_object_del(struct drm_gem_object *);
 extern int nouveau_gem_object_open(struct drm_gem_object *, struct drm_file *);
 extern void nouveau_gem_object_close(struct drm_gem_object *,
@@ -35,6 +35,8 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 				      struct drm_file *);
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
+extern int nouveau_gem_ioctl_set_info(struct drm_device *, void *,
+				      struct drm_file *);
 
 extern int nouveau_gem_prime_pin(struct drm_gem_object *);
 struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *);
diff --git a/drm/nouveau_ttm.c b/drm/nouveau_ttm.c
index 8058013..a224820 100644
--- a/drm/nouveau_ttm.c
+++ b/drm/nouveau_ttm.c
@@ -81,12 +81,12 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 	u32 size_nc = 0;
 	int ret;
 
-	if (nvbo->tile_flags & NOUVEAU_GEM_TILE_NONCONTIG)
+	if (nvbo->bo_flags & NOUVEAU_GEM_TILE_NONCONTIG)
 		size_nc = 1 << nvbo->page_shift;
 
 	ret = pfb->ram->get(pfb, mem->num_pages << PAGE_SHIFT,
 			   mem->page_alignment << PAGE_SHIFT, size_nc,
-			   (nvbo->tile_flags >> 8) & 0x3ff, &node);
+			   (nvbo->bo_flags >> 8) & 0x3ff, &node);
 	if (ret) {
 		mem->mm_node = NULL;
 		return (ret == -ENOSPC) ? 0 : ret;
@@ -174,11 +174,11 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 	switch (drm->device.info.family) {
 	case NV_DEVICE_INFO_V0_TESLA:
 		if (drm->device.info.chipset != 0x50)
-			node->memtype = (nvbo->tile_flags & 0x7f00) >> 8;
+			node->memtype = (nvbo->bo_flags & 0x7f00) >> 8;
 		break;
 	case NV_DEVICE_INFO_V0_FERMI:
 	case NV_DEVICE_INFO_V0_KEPLER:
-		node->memtype = (nvbo->tile_flags & 0xff00) >> 8;
+		node->memtype = (nvbo->bo_flags & 0xff00) >> 8;
 		break;
 	default:
 		break;
diff --git a/drm/nv50_display.c b/drm/nv50_display.c
index fdb3e1a..ce0df41 100644
--- a/drm/nv50_display.c
+++ b/drm/nv50_display.c
@@ -2352,7 +2352,7 @@ nv50_fb_ctor(struct drm_framebuffer *fb)
 	u8 kind = nouveau_bo_tile_layout(nvbo) >> 8;
 	u8 tile = nvbo->tile_mode;
 
-	if (nvbo->tile_flags & NOUVEAU_GEM_TILE_NONCONTIG) {
+	if (nvbo->bo_flags & NOUVEAU_GEM_TILE_NONCONTIG) {
 		NV_ERROR(drm, "framebuffer requires contiguous bo\n");
 		return -EINVAL;
 	}
diff --git a/drm/uapi/drm/nouveau_drm.h b/drm/uapi/drm/nouveau_drm.h
index 394cd94..49fc749 100644
--- a/drm/uapi/drm/nouveau_drm.h
+++ b/drm/uapi/drm/nouveau_drm.h
@@ -46,6 +46,7 @@
 #define NOUVEAU_GEM_TILE_32BPP       0x00000002
 #define NOUVEAU_GEM_TILE_ZETA        0x00000004
 #define NOUVEAU_GEM_TILE_NONCONTIG   0x00000008
+#define NOUVEAU_GEM_EXPLICIT_SYNC    0x00040000
 
 struct drm_nouveau_gem_info {
 	uint32_t handle;
@@ -54,7 +55,7 @@ struct drm_nouveau_gem_info {
 	uint64_t offset;
 	uint64_t map_handle;
 	uint32_t tile_mode;
-	uint32_t tile_flags;
+	uint32_t bo_flags;
 };
 
 struct drm_nouveau_gem_new {
@@ -149,6 +150,7 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
 #define DRM_NOUVEAU_GEM_PUSHBUF_2      0x45
+#define DRM_NOUVEAU_GEM_SET_INFO       0x46
 
 #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
@@ -156,5 +158,6 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
+#define DRM_IOCTL_NOUVEAU_GEM_SET_INFO       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_SET_INFO, struct drm_nouveau_gem_info)
 
 #endif /* __NOUVEAU_DRM_H__ */
-- 
1.8.1.5
