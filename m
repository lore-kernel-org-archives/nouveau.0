From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH 2/2] drm/nvc0: implement VRAM compression
Date: Sat, 21 Jan 2012 23:13:27 +0100
Message-ID: <1327184007-4325-2-git-send-email-e0425955@student.tuwien.ac.at>
References: <1327184007-4325-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1327184007-4325-1-git-send-email-e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

Safety margins checked on GTX470, not verified on other cards with
a different number of memory partitions.
---
 drivers/gpu/drm/nouveau/nouveau_state.c |   35 +++++++-------
 drivers/gpu/drm/nouveau/nvc0_fb.c       |   81 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvc0_vm.c       |   12 ++++-
 drivers/gpu/drm/nouveau/nvc0_vram.c     |   78 ++++++++++++++++++++---------
 4 files changed, 164 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 13e6102..9511009 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -602,18 +602,26 @@ nouveau_card_init(struct drm_device *dev)
 		goto out_mc;
 
 	/* PFB */
-	ret = engine->fb.init(dev);
+	ret = engine->vram.init(dev);
 	if (ret)
 		goto out_timer;
 
-	ret = engine->vram.init(dev);
+	ret = nouveau_mem_vram_init(dev);
 	if (ret)
-		goto out_fb;
+		goto out_vram;
+
+	ret = nouveau_mem_gart_init(dev);
+	if (ret)
+		goto out_ttmvram;
+
+	ret = engine->fb.init(dev);
+	if (ret)
+		goto out_ttmgart;
 
 	/* PGPIO */
 	ret = nouveau_gpio_create(dev);
 	if (ret)
-		goto out_vram;
+		goto out_fb;
 
 	ret = nouveau_gpuobj_init(dev);
 	if (ret)
@@ -623,14 +631,6 @@ nouveau_card_init(struct drm_device *dev)
 	if (ret)
 		goto out_gpuobj;
 
-	ret = nouveau_mem_vram_init(dev);
-	if (ret)
-		goto out_instmem;
-
-	ret = nouveau_mem_gart_init(dev);
-	if (ret)
-		goto out_ttmvram;
-
 	nouveau_pm_init(dev);
 
 	if (!dev_priv->noaccel) {
@@ -783,19 +783,20 @@ out_engine:
 		}
 	}
 	nouveau_pm_fini(dev);
-	nouveau_mem_gart_fini(dev);
-out_ttmvram:
-	nouveau_mem_vram_fini(dev);
 out_instmem:
 	engine->instmem.takedown(dev);
 out_gpuobj:
 	nouveau_gpuobj_takedown(dev);
 out_gpio:
 	nouveau_gpio_destroy(dev);
-out_vram:
-	engine->vram.takedown(dev);
 out_fb:
 	engine->fb.takedown(dev);
+out_ttmgart:
+	nouveau_mem_gart_fini(dev);
+out_ttmvram:
+	nouveau_mem_vram_fini(dev);
+out_vram:
+	engine->vram.takedown(dev);
 out_timer:
 	engine->timer.takedown(dev);
 out_mc:
diff --git a/drivers/gpu/drm/nouveau/nvc0_fb.c b/drivers/gpu/drm/nouveau/nvc0_fb.c
index 5bf5503..b9bb143 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fb.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fb.c
@@ -30,6 +30,8 @@
 struct nvc0_fb_priv {
 	struct page *r100c10_page;
 	dma_addr_t r100c10;
+	struct nouveau_bo *tag_ram;
+	uint8_t l2_part_nr;
 };
 
 static inline void
@@ -56,6 +58,74 @@ nvc0_mfb_isr(struct drm_device *dev)
 	}
 }
 
+static int
+nvc0_init_tag_ram(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
+	struct nvc0_fb_priv *priv = (struct nvc0_fb_priv *)pfb->priv;
+	int ret;
+	u32 align, buffer;
+	u32 tag_size;
+	u32 num_tags;
+	u64 tag_base;
+
+	priv->l2_part_nr = nv_rd32(dev, 0x121c74);
+
+	nv_wr32(dev, 0x17e8d8, priv->l2_part_nr);
+	nv_wr32(dev, 0x100800, priv->l2_part_nr);
+
+	/* need to align to l2_part_count * 0x800 */
+	align = ((priv->l2_part_nr + 1) & ~1) * 0x800; /* even -> page sized */
+
+	buffer = align; /* buffer zone to account for address mangling */
+
+	/* allocate tag space for 1/4 of VRAM */
+	num_tags = (dev_priv->vram_size >> 17) >> 2;
+	num_tags = (num_tags + 63) & ~63;
+
+	ret = drm_mm_init(&pfb->tag_heap, 0, num_tags);
+	if (ret)
+		return ret;
+
+	tag_size = (num_tags / 64) * 0x4000 + align + buffer;
+
+	ret = nouveau_bo_new(dev, tag_size, 1 << 12, TTM_PL_FLAG_VRAM,
+			     0, 0, &priv->tag_ram);
+	if (!ret)
+		ret = nouveau_bo_pin(priv->tag_ram, TTM_PL_FLAG_VRAM);
+	if (ret) {
+		nouveau_bo_ref(NULL, &priv->tag_ram);
+		return ret;
+	}
+
+	tag_base = (priv->tag_ram->bo.mem.start << PAGE_SHIFT) + buffer;
+	tag_base = tag_base + priv->l2_part_nr * 0x800 - 1;
+	tag_base = tag_base / (priv->l2_part_nr * 0x800);
+
+	nv_wr32(dev, 0x17e8d4, tag_base);
+
+	return 0;
+}
+
+void
+nvc0_tag_ram_clear(struct drm_device *dev, u32 first, u32 count)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nvc0_fb_priv *priv;
+	int p, i;
+
+	priv = (struct nvc0_fb_priv *)dev_priv->engine.fb.priv;
+
+	nv_wr32(dev, 0x17e8cc, first);
+	nv_wr32(dev, 0x17e8d0, first + count - 1);
+	nv_wr32(dev, 0x17e8c8, 4);
+
+	for (p = 0; p < priv->l2_part_nr; ++p)
+		for (i = 0; i < 2; ++i)
+			nv_wait(dev, 0x1410c8 + p * 0x2000 + i * 0x400, ~0, 0);
+}
+
 static void
 nvc0_fb_destroy(struct drm_device *dev)
 {
@@ -63,6 +133,14 @@ nvc0_fb_destroy(struct drm_device *dev)
 	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
 	struct nvc0_fb_priv *priv = pfb->priv;
 
+	if (drm_mm_initialized(&pfb->tag_heap))
+		drm_mm_takedown(&pfb->tag_heap);
+
+	if (priv->tag_ram) {
+		nouveau_bo_unpin(priv->tag_ram);
+		nouveau_bo_ref(NULL, &priv->tag_ram);
+	}
+
 	nouveau_irq_unregister(dev, 25);
 
 	if (priv->r100c10_page) {
@@ -118,6 +196,9 @@ nvc0_fb_init(struct drm_device *dev)
 	}
 	priv = dev_priv->engine.fb.priv;
 
+	if (nvc0_init_tag_ram(dev))
+		return ret;
+
 	nv_wr32(dev, 0x100c10, priv->r100c10 >> 8);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvc0_vm.c b/drivers/gpu/drm/nouveau/nvc0_vm.c
index 8360dc8..0f70f47 100644
--- a/drivers/gpu/drm/nouveau/nvc0_vm.c
+++ b/drivers/gpu/drm/nouveau/nvc0_vm.c
@@ -27,6 +27,8 @@
 #include "nouveau_drv.h"
 #include "nouveau_vm.h"
 
+void nvc0_tag_ram_clear(struct drm_device *dev, u32 first, u32 count);
+
 void
 nvc0_vm_map_pgt(struct nouveau_gpuobj *pgd, u32 index,
 		struct nouveau_gpuobj *pgt[2])
@@ -61,9 +63,17 @@ void
 nvc0_vm_map(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
 	    struct nouveau_mem *mem, u32 pte, u32 cnt, u64 phys, u64 delta)
 {
-	u32 next = 1 << (vma->node->type - 8);
+	u64 next = 1 << (vma->node->type - 8);
 
 	phys  = nvc0_vm_addr(vma, phys, mem->memtype, 0);
+
+	if (mem->tag) {
+		u32 tag = mem->tag->start + (delta >> 17);
+		phys |= (u64)tag << (32 + 12);
+		next |= (u64)1 << (32 + 12);
+		nvc0_tag_ram_clear(vma->vm->dev, tag, cnt);
+	}
+
 	pte <<= 3;
 	while (cnt--) {
 		nv_wo32(pgt, pte + 4, upper_32_bits(phys));
diff --git a/drivers/gpu/drm/nouveau/nvc0_vram.c b/drivers/gpu/drm/nouveau/nvc0_vram.c
index fd687ee..85632bf 100644
--- a/drivers/gpu/drm/nouveau/nvc0_vram.c
+++ b/drivers/gpu/drm/nouveau/nvc0_vram.c
@@ -26,34 +26,48 @@
 #include "nouveau_drv.h"
 #include "nouveau_mm.h"
 
-/* 0 = unsupported
- * 1 = non-compressed
- * 3 = compressed
- */
-static const u8 types[256] = {
-	1, 1, 3, 3, 3, 3, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0,
-	0, 1, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3,
-	3, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 1, 1, 1, 1, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 3, 3, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
-	3, 3, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3,
-	3, 3, 0, 0, 0, 0, 0, 0, 3, 0, 0, 3, 0, 3, 0, 3,
-	3, 0, 3, 3, 3, 3, 3, 0, 0, 3, 0, 3, 0, 3, 3, 0,
-	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 1, 1, 0
+/* Map from compressed to corresponding uncompressed storage type. */
+static const u8 storage_type_map[256] =
+{
+	0x00, 0x01, 0x01, 0x01, 0x01, 0x01,   -1, 0x01, /* 0x00 */
+	0x01, 0x01, 0x01,   -1,   -1,   -1,   -1,   -1,
+	  -1, 0x11,   -1,   -1,   -1,   -1,   -1, 0x11, /* 0x10 */
+	0x11, 0x11, 0x11,   -1,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1, 0x26, 0x27, /* 0x20 */
+	0x28, 0x29,   -1,   -1,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 0x30 */
+	  -1,   -1, 0x26, 0x27, 0x28, 0x29, 0x26, 0x27,
+	0x28, 0x29,   -1,   -1,   -1,   -1, 0x46,   -1, /* 0x40 */
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
+	  -1, 0x46, 0x46, 0x46, 0x46,   -1,   -1,   -1, /* 0x50 */
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 0x60 */
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 0x70 */
+	  -1,   -1,   -1, 0x7b,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1, 0x7b, 0x7b, /* 0x80 */
+	0x7b, 0x7b,   -1, 0x8b, 0x8c, 0x8d, 0x8e,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 0x90 */
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1, 0x8b, 0x8c, 0x8d, 0x8e, 0xa7, /* 0xa0 */
+	0xa8, 0xa9, 0xaa,   -1,   -1,   -1,   -1,   -1,
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 0xb0 */
+	  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xa7,
+	0xa8, 0xa9, 0xaa, 0xc3,   -1,   -1,   -1,   -1, /* 0xc0 */
+	  -1,   -1,   -1,   -1, 0xfe, 0xfe, 0xc3, 0xc3,
+	0xc3, 0xc3,   -1,   -1,   -1,   -1,   -1,   -1, /* 0xd0 */
+	0xfe,   -1,   -1, 0xfe,   -1, 0xfe,   -1, 0xfe,
+	0xfe,   -1, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe,   -1, /* 0xe0 */
+	  -1, 0xfe,   -1, 0xfe,   -1, 0xfe, 0xfe,   -1,
+	0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, /* 0xf0 */
+	0xfe, 0xfe, 0xfe, 0xfe,   -1, 0xfe, 0xfe,   -1
 };
 
 bool
 nvc0_vram_flags_valid(struct drm_device *dev, u32 tile_flags)
 {
 	u8 memtype = (tile_flags & NOUVEAU_GEM_TILE_LAYOUT_MASK) >> 8;
-	return likely((types[memtype] == 1));
+	return likely(storage_type_map[memtype] != (u8)-1);
 }
 
 int
@@ -65,6 +79,8 @@ nvc0_vram_new(struct drm_device *dev, u64 size, u32 align, u32 ncmin,
 	struct nouveau_mm_node *r;
 	struct nouveau_mem *mem;
 	int ret;
+	u8 memtype = type & 0xff;
+	u8 memtype_noncomp = storage_type_map[memtype];
 
 	size  >>= 12;
 	align >>= 12;
@@ -74,12 +90,26 @@ nvc0_vram_new(struct drm_device *dev, u64 size, u32 align, u32 ncmin,
 	if (!mem)
 		return -ENOMEM;
 
+	mutex_lock(&mm->mutex);
+	if (memtype != memtype_noncomp) {
+		if (align == 32) {
+			struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
+			int n = size >> 5;
+
+			mem->tag = drm_mm_search_free(&pfb->tag_heap, n, 0, 0);
+			if (mem->tag)
+				mem->tag = drm_mm_get_block(mem->tag, n, 0);
+		}
+
+		if (unlikely(!mem->tag))
+			memtype = memtype_noncomp;
+	}
+
 	INIT_LIST_HEAD(&mem->regions);
 	mem->dev = dev_priv->dev;
-	mem->memtype = (type & 0xff);
+	mem->memtype = memtype;
 	mem->size = size;
 
-	mutex_lock(&mm->mutex);
 	do {
 		ret = nouveau_mm_get(mm, 1, size, ncmin, align, &r);
 		if (ret) {
-- 
1.7.3.4
