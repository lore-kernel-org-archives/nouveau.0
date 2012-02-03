From: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] nouveau: Allow allocating BOs at specific
	offsets
Date: Fri,  3 Feb 2012 13:22:19 -0500
Message-ID: <1328293342-1643-1-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

We want to be able to guarantee the location of the allocated buffer
object if we're going to be able to reliably allocate the existing
framebuffer at startup. Add an argument to do so and pass that through to
the ttm core.

Signed-off-by: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/bcma/main.c                       |    1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c      |    8 +++++++-
 drivers/gpu/drm/nouveau/nouveau_channel.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_fence.c   |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c     |    2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c     |    5 +++--
 drivers/gpu/drm/nouveau/nouveau_mm.c      |    8 +++++++-
 drivers/gpu/drm/nouveau/nouveau_mm.h      |   12 ++++++------
 drivers/gpu/drm/nouveau/nouveau_vm.c      |    3 ++-
 drivers/gpu/drm/nouveau/nv04_crtc.c       |    2 +-
 drivers/gpu/drm/nouveau/nv50_crtc.c       |    4 ++--
 drivers/gpu/drm/nouveau/nv50_evo.c        |    4 ++--
 drivers/gpu/drm/nouveau/nv50_instmem.c    |    2 +-
 drivers/gpu/drm/nouveau/nv50_vram.c       |   17 +++++++++++++----
 drivers/gpu/drm/nouveau/nvc0_vram.c       |    5 +++--
 drivers/gpu/drm/nouveau/nvd0_display.c    |    6 +++---
 17 files changed, 55 insertions(+), 32 deletions(-)

diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index febbc0a..cb69fb0 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -171,7 +171,6 @@ int bcma_bus_register(struct bcma_bus *bus)
 		pr_err("No SPROM available\n");
 	} else if (err) {
 		pr_err("Failed to get SPROM: %d\n", err);
-		return -ENOENT;
 	}
 
 	/* Register found cores */
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ec54364..b0ed066 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -87,7 +87,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
 }
 
 int
-nouveau_bo_new(struct drm_device *dev, int size, int align,
+nouveau_bo_new(struct drm_device *dev, int base, int size, int align,
 	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
 	       struct nouveau_bo **pnvbo)
 {
@@ -119,10 +119,16 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
 	acc_size = ttm_bo_dma_acc_size(&dev_priv->ttm.bdev, size,
 				       sizeof(struct nouveau_bo));
 
+	if (base) {
+		nvbo->placement.fpfn = base >> PAGE_SHIFT;
+		nvbo->placement.lpfn = dev_priv->vram_size >> PAGE_SHIFT;
+	}
+
 	ret = ttm_bo_init(&dev_priv->ttm.bdev, &nvbo->bo, size,
 			  ttm_bo_type_device, &nvbo->placement,
 			  align >> PAGE_SHIFT, 0, false, NULL, acc_size,
 			  nouveau_bo_del_ttm);
+
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index a018def..58402ac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -38,7 +38,7 @@ nouveau_channel_pushbuf_init(struct nouveau_channel *chan)
 	int ret;
 
 	/* allocate buffer object */
-	ret = nouveau_bo_new(dev, 65536, 0, mem, 0, 0, &chan->pushbuf_bo);
+	ret = nouveau_bo_new(dev, 0, 65536, 0, mem, 0, 0, &chan->pushbuf_bo);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 4bb6aee..ab4c071 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -587,7 +587,7 @@ struct nouveau_vram_engine {
 
 	int  (*init)(struct drm_device *);
 	void (*takedown)(struct drm_device *dev);
-	int  (*get)(struct drm_device *, u64, u32 align, u32 size_nc,
+	int  (*get)(struct drm_device *, u32 base, u64, u32 align, u32 size_nc,
 		    u32 type, struct nouveau_mem **);
 	void (*put)(struct drm_device *, struct nouveau_mem **);
 
@@ -1424,7 +1424,7 @@ extern int nv04_crtc_create(struct drm_device *, int index);
 
 /* nouveau_bo.c */
 extern struct ttm_bo_driver nouveau_bo_driver;
-extern int nouveau_bo_new(struct drm_device *, int size, int align,
+extern int nouveau_bo_new(struct drm_device *, int base, int size, int align,
 			  uint32_t flags, uint32_t tile_mode,
 			  uint32_t tile_flags, struct nouveau_bo **);
 extern int nouveau_bo_pin(struct nouveau_bo *, uint32_t flags);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 2f6daae..3577e04 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -573,7 +573,7 @@ nouveau_fence_init(struct drm_device *dev)
 
 	/* Create a shared VRAM heap for cross-channel sync. */
 	if (USE_SEMA(dev)) {
-		ret = nouveau_bo_new(dev, size, 0, TTM_PL_FLAG_VRAM,
+		ret = nouveau_bo_new(dev, 0, size, 0, TTM_PL_FLAG_VRAM,
 				     0, 0, &dev_priv->fence.bo);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 7ce3fde..c300e36 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -138,7 +138,7 @@ nouveau_gem_new(struct drm_device *dev, int size, int align, uint32_t domain,
 	if (!flags || domain & NOUVEAU_GEM_DOMAIN_CPU)
 		flags |= TTM_PL_FLAG_SYSTEM;
 
-	ret = nouveau_bo_new(dev, size, align, flags, tile_mode,
+	ret = nouveau_bo_new(dev, 0, size, align, flags, tile_mode,
 			     tile_flags, pnvbo);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 8ff0027..1c510ef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -414,7 +414,7 @@ nouveau_mem_vram_init(struct drm_device *dev)
 	}
 
 	if (dev_priv->card_type < NV_50) {
-		ret = nouveau_bo_new(dev, 256*1024, 0, TTM_PL_FLAG_VRAM,
+		ret = nouveau_bo_new(dev, 0, 256*1024, 0, TTM_PL_FLAG_VRAM,
 				     0, 0, &dev_priv->vga_ram);
 		if (ret == 0)
 			ret = nouveau_bo_pin(dev_priv->vga_ram,
@@ -1139,7 +1139,8 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 	if (nvbo->tile_flags & NOUVEAU_GEM_TILE_NONCONTIG)
 		size_nc = 1 << nvbo->page_shift;
 
-	ret = vram->get(dev, mem->num_pages << PAGE_SHIFT,
+	ret = vram->get(dev, placement->fpfn << PAGE_SHIFT,
+			mem->num_pages << PAGE_SHIFT,
 			mem->page_alignment << PAGE_SHIFT, size_nc,
 			(nvbo->tile_flags >> 8) & 0x3ff, &node);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_mm.c b/drivers/gpu/drm/nouveau/nouveau_mm.c
index b29ffb3..78d1c81 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mm.c
@@ -83,7 +83,7 @@ nouveau_mm_put(struct nouveau_mm *mm, struct nouveau_mm_node *this)
 }
 
 int
-nouveau_mm_get(struct nouveau_mm *mm, int type, u32 size, u32 size_nc,
+nouveau_mm_get(struct nouveau_mm *mm, int type, u32 base, u32 size, u32 size_nc,
 	       u32 align, struct nouveau_mm_node **pnode)
 {
 	struct nouveau_mm_node *prev, *this, *next;
@@ -104,6 +104,12 @@ nouveau_mm_get(struct nouveau_mm *mm, int type, u32 size, u32 size_nc,
 		if (next && next->type != type)
 			e = rounddown(e, mm->block_size);
 
+		if (base) {
+			if (base < s || base > e)
+				continue;
+			s = base;
+		}
+
 		s  = (s + align_mask) & ~align_mask;
 		e &= ~align_mask;
 		if (s > e || e - s < min)
diff --git a/drivers/gpu/drm/nouveau/nouveau_mm.h b/drivers/gpu/drm/nouveau/nouveau_mm.h
index 57a600c..d6e8f6a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mm.h
@@ -48,20 +48,20 @@ struct nouveau_mm {
 int  nouveau_mm_init(struct nouveau_mm *, u32 offset, u32 length, u32 block);
 int  nouveau_mm_fini(struct nouveau_mm *);
 int  nouveau_mm_pre(struct nouveau_mm *);
-int  nouveau_mm_get(struct nouveau_mm *, int type, u32 size, u32 size_nc,
-		    u32 align, struct nouveau_mm_node **);
+int  nouveau_mm_get(struct nouveau_mm *, int type, u32 base, u32 size,
+		    u32 size_nc, u32 align, struct nouveau_mm_node **);
 void nouveau_mm_put(struct nouveau_mm *, struct nouveau_mm_node *);
 
 int  nv50_vram_init(struct drm_device *);
 void nv50_vram_fini(struct drm_device *);
-int  nv50_vram_new(struct drm_device *, u64 size, u32 align, u32 size_nc,
-		    u32 memtype, struct nouveau_mem **);
+int  nv50_vram_new(struct drm_device *, u32 base, u64 size, u32 align,
+		   u32 size_nc, u32 memtype, struct nouveau_mem **);
 void nv50_vram_del(struct drm_device *, struct nouveau_mem **);
 bool nv50_vram_flags_valid(struct drm_device *, u32 tile_flags);
 
 int  nvc0_vram_init(struct drm_device *);
-int  nvc0_vram_new(struct drm_device *, u64 size, u32 align, u32 ncmin,
-		    u32 memtype, struct nouveau_mem **);
+int  nvc0_vram_new(struct drm_device *, u32 base, u64 size, u32 align,
+		   u32 ncmin, u32 memtype, struct nouveau_mem **);
 bool nvc0_vram_flags_valid(struct drm_device *, u32 tile_flags);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_vm.c b/drivers/gpu/drm/nouveau/nouveau_vm.c
index 2bf6c03..7e4fc01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vm.c
@@ -225,7 +225,8 @@ nouveau_vm_get(struct nouveau_vm *vm, u64 size, u32 page_shift,
 	int ret;
 
 	mutex_lock(&vm->mm.mutex);
-	ret = nouveau_mm_get(&vm->mm, page_shift, msize, 0, align, &vma->node);
+	ret = nouveau_mm_get(&vm->mm, page_shift, 0, msize, 0, align,
+			     &vma->node);
 	if (unlikely(ret != 0)) {
 		mutex_unlock(&vm->mm.mutex);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 728d075..b5937c2 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -1046,7 +1046,7 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
 
-	ret = nouveau_bo_new(dev, 64*64*4, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 0, 64*64*4, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 701b927..691f261 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -768,7 +768,7 @@ nv50_crtc_create(struct drm_device *dev, int index)
 	}
 	nv_crtc->lut.depth = 0;
 
-	ret = nouveau_bo_new(dev, 4096, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 0, 4096, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->lut.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->lut.nvbo, TTM_PL_FLAG_VRAM);
@@ -794,7 +794,7 @@ nv50_crtc_create(struct drm_device *dev, int index)
 	drm_crtc_helper_add(&nv_crtc->base, &nv50_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
 
-	ret = nouveau_bo_new(dev, 64*64*4, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 0, 64*64*4, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nv50_evo.c b/drivers/gpu/drm/nouveau/nv50_evo.c
index 9b962e9..0c879b6 100644
--- a/drivers/gpu/drm/nouveau/nv50_evo.c
+++ b/drivers/gpu/drm/nouveau/nv50_evo.c
@@ -117,7 +117,7 @@ nv50_evo_channel_new(struct drm_device *dev, int chid,
 	evo->user_get = 4;
 	evo->user_put = 0;
 
-	ret = nouveau_bo_new(dev, 4096, 0, TTM_PL_FLAG_VRAM, 0, 0,
+	ret = nouveau_bo_new(dev, 0, 4096, 0, TTM_PL_FLAG_VRAM, 0, 0,
 			     &evo->pushbuf_bo);
 	if (ret == 0)
 		ret = nouveau_bo_pin(evo->pushbuf_bo, TTM_PL_FLAG_VRAM);
@@ -332,7 +332,7 @@ nv50_evo_create(struct drm_device *dev)
 		if (ret)
 			goto err;
 
-		ret = nouveau_bo_new(dev, 4096, 0x1000, TTM_PL_FLAG_VRAM,
+		ret = nouveau_bo_new(dev, 0, 4096, 0x1000, TTM_PL_FLAG_VRAM,
 				     0, 0x0000, &dispc->sem.bo);
 		if (!ret) {
 			ret = nouveau_bo_pin(dispc->sem.bo, TTM_PL_FLAG_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nouveau/nv50_instmem.c
index a7c12c9..fa4a7c5 100644
--- a/drivers/gpu/drm/nouveau/nv50_instmem.c
+++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
@@ -323,7 +323,7 @@ nv50_instmem_get(struct nouveau_gpuobj *gpuobj, struct nouveau_channel *chan,
 	size  = (size + 4095) & ~4095;
 	align = max(align, (u32)4096);
 
-	ret = vram->get(dev, size, align, 0, 0, &node->vram);
+	ret = vram->get(dev, 0, size, align, 0, 0, &node->vram);
 	if (ret) {
 		kfree(node);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv50_vram.c b/drivers/gpu/drm/nouveau/nv50_vram.c
index 9ed9ae39..9367de8 100644
--- a/drivers/gpu/drm/nouveau/nv50_vram.c
+++ b/drivers/gpu/drm/nouveau/nv50_vram.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <linux/efi.h>
 #include "drmP.h"
 #include "nouveau_drv.h"
 #include "nouveau_mm.h"
@@ -78,8 +79,8 @@ nv50_vram_del(struct drm_device *dev, struct nouveau_mem **pmem)
 }
 
 int
-nv50_vram_new(struct drm_device *dev, u64 size, u32 align, u32 size_nc,
-	      u32 memtype, struct nouveau_mem **pmem)
+nv50_vram_new(struct drm_device *dev, u32 base, u64 size, u32 align,
+	      u32 size_nc, u32 memtype, struct nouveau_mem **pmem)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_mm *mm = &dev_priv->engine.vram.mm;
@@ -91,6 +92,8 @@ nv50_vram_new(struct drm_device *dev, u64 size, u32 align, u32 size_nc,
 
 	if (!types[type])
 		return -EINVAL;
+
+	base >>= 12;
 	size >>= 12;
 	align >>= 12;
 	size_nc >>= 12;
@@ -120,7 +123,8 @@ nv50_vram_new(struct drm_device *dev, u64 size, u32 align, u32 size_nc,
 	mem->size = size;
 
 	do {
-		ret = nouveau_mm_get(mm, types[type], size, size_nc, align, &r);
+		ret = nouveau_mm_get(mm, types[type], base, size, size_nc,
+				     align, &r);
 		if (ret) {
 			mutex_unlock(&mm->mutex);
 			nv50_vram_del(dev, &mem);
@@ -187,9 +191,9 @@ nv50_vram_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_vram_engine *vram = &dev_priv->engine.vram;
-	const u32 rsvd_head = ( 256 * 1024) >> 12; /* vga memory */
 	const u32 rsvd_tail = (1024 * 1024) >> 12; /* vbios etc */
 	u32 pfb714 = nv_rd32(dev, 0x100714);
+	u32 rsvd_head;
 	u32 rblock, length;
 
 	switch (pfb714 & 0x00000007) {
@@ -207,6 +211,11 @@ nv50_vram_init(struct drm_device *dev)
 		break;
 	}
 
+	if (efi_enabled)
+		rsvd_head = 0;
+	else
+		rsvd_head = ( 256 * 1024) >> 12; /* vga memory */
+
 	dev_priv->vram_rank_B = !!(nv_rd32(dev, 0x100200) & 0x4);
 	dev_priv->vram_size  = nv_rd32(dev, 0x10020c);
 	dev_priv->vram_size |= (dev_priv->vram_size & 0xff) << 32;
diff --git a/drivers/gpu/drm/nouveau/nvc0_vram.c b/drivers/gpu/drm/nouveau/nvc0_vram.c
index 82b51b2..45c91b1 100644
--- a/drivers/gpu/drm/nouveau/nvc0_vram.c
+++ b/drivers/gpu/drm/nouveau/nvc0_vram.c
@@ -57,7 +57,7 @@ nvc0_vram_flags_valid(struct drm_device *dev, u32 tile_flags)
 }
 
 int
-nvc0_vram_new(struct drm_device *dev, u64 size, u32 align, u32 ncmin,
+nvc0_vram_new(struct drm_device *dev, u32 base, u64 size, u32 align, u32 ncmin,
 	      u32 type, struct nouveau_mem **pmem)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -66,6 +66,7 @@ nvc0_vram_new(struct drm_device *dev, u64 size, u32 align, u32 ncmin,
 	struct nouveau_mem *mem;
 	int ret;
 
+	base  >>= 12;
 	size  >>= 12;
 	align >>= 12;
 	ncmin >>= 12;
@@ -81,7 +82,7 @@ nvc0_vram_new(struct drm_device *dev, u64 size, u32 align, u32 ncmin,
 
 	mutex_lock(&mm->mutex);
 	do {
-		ret = nouveau_mm_get(mm, 1, size, ncmin, align, &r);
+		ret = nouveau_mm_get(mm, 1, base, size, ncmin, align, &r);
 		if (ret) {
 			mutex_unlock(&mm->mutex);
 			nv50_vram_del(dev, &mem);
diff --git a/drivers/gpu/drm/nouveau/nvd0_display.c b/drivers/gpu/drm/nouveau/nvd0_display.c
index d2ba2f0..0bd3f7d 100644
--- a/drivers/gpu/drm/nouveau/nvd0_display.c
+++ b/drivers/gpu/drm/nouveau/nvd0_display.c
@@ -883,7 +883,7 @@ nvd0_crtc_create(struct drm_device *dev, int index)
 	drm_crtc_helper_add(crtc, &nvd0_crtc_hfunc);
 	drm_mode_crtc_set_gamma_size(crtc, 256);
 
-	ret = nouveau_bo_new(dev, 64 * 64 * 4, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 0, 64 * 64 * 4, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
@@ -896,7 +896,7 @@ nvd0_crtc_create(struct drm_device *dev, int index)
 	if (ret)
 		goto out;
 
-	ret = nouveau_bo_new(dev, 8192, 0x100, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 0, 8192, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->lut.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->lut.nvbo, TTM_PL_FLAG_VRAM);
@@ -1830,7 +1830,7 @@ nvd0_display_create(struct drm_device *dev)
 	nouveau_irq_register(dev, 26, nvd0_display_intr);
 
 	/* small shared memory area we use for notifiers and semaphores */
-	ret = nouveau_bo_new(dev, 4096, 0x1000, TTM_PL_FLAG_VRAM,
+	ret = nouveau_bo_new(dev, 0, 4096, 0x1000, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &disp->sync);
 	if (!ret) {
 		ret = nouveau_bo_pin(disp->sync, TTM_PL_FLAG_VRAM);
-- 
1.7.7.6
