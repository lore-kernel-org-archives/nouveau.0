From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH 1/4] drm/nvc0: implement VRAM compression
Date: Wed, 27 Mar 2013 22:16:53 +0100
Message-ID: <1364419016-18275-1-git-send-email-e0425955@student.tuwien.ac.at>
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
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/core/include/subdev/ltcg.h |    7 +
 drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c      |   55 +++++----
 drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c    |  129 +++++++++++++++++++-
 drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c      |   58 +++++++++-
 4 files changed, 220 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/ltcg.h b/drivers/gpu/drm/nouveau/core/include/subdev/ltcg.h
index f351f63..a1985ed 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/ltcg.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/ltcg.h
@@ -4,8 +4,15 @@
 #include <core/subdev.h>
 #include <core/device.h>
 
+struct nouveau_mm_node;
+
 struct nouveau_ltcg {
 	struct nouveau_subdev base;
+
+	int  (*tags_alloc)(struct nouveau_ltcg *, u32 count,
+	                   struct nouveau_mm_node **);
+	void (*tags_free)(struct nouveau_ltcg *, struct nouveau_mm_node **);
+	void (*tags_clear)(struct nouveau_ltcg *, u32 first, u32 count);
 };
 
 static inline struct nouveau_ltcg *
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
index 3b2ddc6..86ad592 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
@@ -23,6 +23,7 @@
  */
 
 #include <subdev/fb.h>
+#include <subdev/ltcg.h>
 #include <subdev/bios.h>
 
 struct nvc0_fb_priv {
@@ -31,34 +32,14 @@ struct nvc0_fb_priv {
 	dma_addr_t r100c10;
 };
 
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
-};
+extern const u8 nvc0_pte_storage_type_map[256];
+
 
 static bool
 nvc0_fb_memtype_valid(struct nouveau_fb *pfb, u32 tile_flags)
 {
 	u8 memtype = (tile_flags & 0x0000ff00) >> 8;
-	return likely((types[memtype] == 1));
+	return likely((nvc0_pte_storage_type_map[memtype] != 0xff));
 }
 
 static int
@@ -130,6 +111,7 @@ nvc0_fb_vram_new(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 	int type = (memtype & 0x0ff);
 	int back = (memtype & 0x800);
 	int ret;
+	const bool comp = nvc0_pte_storage_type_map[type] != type;
 
 	size  >>= 12;
 	align >>= 12;
@@ -142,10 +124,22 @@ nvc0_fb_vram_new(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&mem->regions);
-	mem->memtype = type;
 	mem->size = size;
 
 	mutex_lock(&pfb->base.mutex);
+	if (comp) {
+		struct nouveau_ltcg *ltcg = nouveau_ltcg(pfb->base.base.parent);
+
+		/* compression only works with lpages */
+		if (align == (1 << (17 - 12))) {
+			int n = size >> 5;
+			ltcg->tags_alloc(ltcg, n, &mem->tag);
+		}
+		if (unlikely(!mem->tag))
+			type = nvc0_pte_storage_type_map[type];
+	}
+	mem->memtype = type;
+
 	do {
 		if (back)
 			ret = nouveau_mm_tail(mm, 1, size, ncmin, align, &r);
@@ -168,6 +162,17 @@ nvc0_fb_vram_new(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 	return 0;
 }
 
+static void
+nvc0_fb_vram_del(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
+{
+	struct nouveau_ltcg *ltcg = nouveau_ltcg(pfb->base.base.parent);
+
+	if ((*pmem)->tag)
+		ltcg->tags_free(ltcg, &(*pmem)->tag);
+
+	nv50_fb_vram_del(pfb, pmem);
+}
+
 static int
 nvc0_fb_init(struct nouveau_object *object)
 {
@@ -215,7 +220,7 @@ nvc0_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	priv->base.memtype_valid = nvc0_fb_memtype_valid;
 	priv->base.ram.init = nvc0_fb_vram_init;
 	priv->base.ram.get = nvc0_fb_vram_new;
-	priv->base.ram.put = nv50_fb_vram_del;
+	priv->base.ram.put = nvc0_fb_vram_del;
 
 	priv->r100c10_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (priv->r100c10_page) {
diff --git a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
index 078a2b9..a529563 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
@@ -23,10 +23,17 @@
  */
 
 #include <subdev/ltcg.h>
+#include <subdev/fb.h>
+#include <subdev/timer.h>
 
 struct nvc0_ltcg_priv {
 	struct nouveau_ltcg base;
+	u32 part_nr;
+	u32 part_mask;
 	u32 subp_nr;
+	struct nouveau_mm tags;
+	u32 num_tags;
+	struct nouveau_mm_node *tag_ram;
 };
 
 static void
@@ -62,11 +69,104 @@ nvc0_ltcg_intr(struct nouveau_subdev *subdev)
 }
 
 static int
+nvc0_ltcg_tags_alloc(struct nouveau_ltcg *ltcg, u32 n,
+		     struct nouveau_mm_node **pnode)
+{
+	struct nvc0_ltcg_priv *priv = (struct nvc0_ltcg_priv *)ltcg;
+	int ret;
+
+	ret = nouveau_mm_head(&priv->tags, 1, n, n, 1, pnode);
+	if (ret)
+		*pnode = NULL;
+
+	return ret;
+}
+
+static void
+nvc0_ltcg_tags_free(struct nouveau_ltcg *ltcg, struct nouveau_mm_node **pnode)
+{
+	struct nvc0_ltcg_priv *priv = (struct nvc0_ltcg_priv *)ltcg;
+
+	nouveau_mm_free(&priv->tags, pnode);
+}
+
+static void
+nvc0_ltcg_tags_clear(struct nouveau_ltcg *ltcg, u32 first, u32 count)
+{
+	struct nvc0_ltcg_priv *priv = (struct nvc0_ltcg_priv *)ltcg;
+	u32 last = first + count - 1;
+	int p, i;
+
+	BUG_ON((first > last) || (last >= priv->num_tags));
+
+	nv_wr32(priv, 0x17e8cc, first);
+	nv_wr32(priv, 0x17e8d0, last);
+	nv_wr32(priv, 0x17e8c8, 0x4); /* trigger clear */
+
+	/* wait until it's finished with clearing */
+	for (p = 0; p < priv->part_nr; ++p) {
+		if (!(priv->part_mask & (1 << p)))
+			continue;
+		for (i = 0; i < priv->subp_nr; ++i)
+			nv_wait(priv, 0x1410c8 + p * 0x2000 + i * 0x400, ~0, 0);
+	}
+}
+
+/* TODO: Figure out tag memory details and drop the over-cautious allocation.
+ */
+static int
+nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
+{
+	u32 tag_size, tag_margin, tag_align;
+	int ret;
+
+	nv_wr32(priv, 0x17e8d8, priv->part_nr);
+
+	/* tags for 1/4 of VRAM should be enough (8192/4 per GiB of VRAM) */
+	priv->num_tags = (pfb->ram.size >> 17) / 4;
+	if (priv->num_tags > (1 << 17))
+		priv->num_tags = 1 << 17; /* we have 17 bits in PTE */
+	priv->num_tags = (priv->num_tags + 63) & ~63; /* round up to 64 */
+
+	tag_align = priv->part_nr * 0x800;
+	tag_margin = (tag_align < 0x6000) ? 0x6000 : tag_align;
+
+	/* 4 part 4 sub: 0x2000 bytes for 56 tags */
+	/* 3 part 4 sub: 0x6000 bytes for 168 tags */
+	/*
+	 * About 147 bytes per tag. Let's be safe and allocate x2, which makes
+	 * 0x4980 bytes for 64 tags, and round up to 0x6000 bytes for 64 tags.
+	 *
+	 * For 4 GiB of memory we'll have 8192 tags which makes 3 MiB, < 0.1 %.
+	 */
+	tag_size  = (priv->num_tags / 64) * 0x6000 + tag_margin;
+	tag_size += tag_align;
+	tag_size  = (tag_size + 0xfff) >> 12; /* round up */
+
+	ret = nouveau_mm_tail(&pfb->vram, 0, tag_size, tag_size, 1,
+	                      &priv->tag_ram);
+	if (ret) {
+		priv->num_tags = 0;
+	} else {
+		u64 tag_base = (priv->tag_ram->offset << 12) + tag_margin;
+
+		tag_base += tag_align - 1;
+		tag_base /= tag_align;
+
+		nv_wr32(priv, 0x17e8d4, tag_base);
+	}
+	ret = nouveau_mm_init(&priv->tags, 0, priv->num_tags, 1);
+
+	return ret;
+}
+
+static int
 nvc0_ltcg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	       struct nouveau_oclass *oclass, void *data, u32 size,
 	       struct nouveau_object **pobject)
 {
 	struct nvc0_ltcg_priv *priv;
+	struct nouveau_fb *pfb = nouveau_fb(parent);
 	int ret;
 
 	ret = nouveau_ltcg_create(parent, engine, oclass, &priv);
@@ -74,19 +174,44 @@ nvc0_ltcg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	priv->subp_nr = nv_rd32(priv, 0x17e8dc) >> 24;
+	priv->part_nr = nv_rd32(priv, 0x022438);
+	priv->part_mask = nv_rd32(priv, 0x022554);
+
+	priv->subp_nr = nv_rd32(priv, 0x17e8dc) >> 28;
+
 	nv_mask(priv, 0x17e820, 0x00100000, 0x00000000); /* INTR_EN &= ~0x10 */
 
+	ret = nvc0_ltcg_init_tag_ram(pfb, priv);
+	if (ret)
+		return ret;
+
+	priv->base.tags_alloc = nvc0_ltcg_tags_alloc;
+	priv->base.tags_free  = nvc0_ltcg_tags_free;
+	priv->base.tags_clear = nvc0_ltcg_tags_clear;
+
 	nv_subdev(priv)->intr = nvc0_ltcg_intr;
 	return 0;
 }
 
+static void
+nvc0_ltcg_dtor(struct nouveau_object *object)
+{
+	struct nouveau_ltcg *ltcg = (struct nouveau_ltcg *)object;
+	struct nvc0_ltcg_priv *priv = (struct nvc0_ltcg_priv *)ltcg;
+	struct nouveau_fb *pfb = nouveau_fb(ltcg->base.base.parent);
+
+	nouveau_mm_fini(&priv->tags);
+	nouveau_mm_free(&pfb->vram, &priv->tag_ram);
+
+	nouveau_ltcg_destroy(ltcg);
+}
+
 struct nouveau_oclass
 nvc0_ltcg_oclass = {
 	.handle = NV_SUBDEV(LTCG, 0xc0),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nvc0_ltcg_ctor,
-		.dtor = _nouveau_ltcg_dtor,
+		.dtor = nvc0_ltcg_dtor,
 		.init = _nouveau_ltcg_init,
 		.fini = _nouveau_ltcg_fini,
 	},
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c
index 30c61e6..4c3b0a2 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c
@@ -28,12 +28,54 @@
 #include <subdev/timer.h>
 #include <subdev/fb.h>
 #include <subdev/vm.h>
+#include <subdev/ltcg.h>
 
 struct nvc0_vmmgr_priv {
 	struct nouveau_vmmgr base;
 	spinlock_t lock;
 };
 
+
+/* Map from compressed to corresponding uncompressed storage type.
+ * The value 0xff represents an invalid storage type.
+ */
+const u8 nvc0_pte_storage_type_map[256] =
+{
+	0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0xff, 0x01, /* 0x00 */
+	0x01, 0x01, 0x01, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0x11, 0xff, 0xff, 0xff, 0xff, 0xff, 0x11, /* 0x10 */
+	0x11, 0x11, 0x11, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x26, 0x27, /* 0x20 */
+	0x28, 0x29, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 0x30 */
+	0xff, 0xff, 0x26, 0x27, 0x28, 0x29, 0x26, 0x27,
+	0x28, 0x29, 0xff, 0xff, 0xff, 0xff, 0x46, 0xff, /* 0x40 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0x46, 0x46, 0x46, 0x46, 0xff, 0xff, 0xff, /* 0x50 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 0x60 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 0x70 */
+	0xff, 0xff, 0xff, 0x7b, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7b, 0x7b, /* 0x80 */
+	0x7b, 0x7b, 0xff, 0x8b, 0x8c, 0x8d, 0x8e, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 0x90 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0x8b, 0x8c, 0x8d, 0x8e, 0xa7, /* 0xa0 */
+	0xa8, 0xa9, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 0xb0 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xa7,
+	0xa8, 0xa9, 0xaa, 0xc3, 0xff, 0xff, 0xff, 0xff, /* 0xc0 */
+	0xff, 0xff, 0xff, 0xff, 0xfe, 0xfe, 0xc3, 0xc3,
+	0xc3, 0xc3, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 0xd0 */
+	0xfe, 0xff, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
+	0xfe, 0xff, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xff, /* 0xe0 */
+	0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xfe, 0xff,
+	0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, 0xfe, /* 0xf0 */
+	0xfe, 0xfe, 0xfe, 0xfe, 0xff, 0xfd, 0xfe, 0xff
+};
+
+
 static void
 nvc0_vm_map_pgt(struct nouveau_gpuobj *pgd, u32 index,
 		struct nouveau_gpuobj *pgt[2])
@@ -68,10 +110,20 @@ static void
 nvc0_vm_map(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
 	    struct nouveau_mem *mem, u32 pte, u32 cnt, u64 phys, u64 delta)
 {
-	u32 next = 1 << (vma->node->type - 8);
+	u64 next = 1 << (vma->node->type - 8);
 
 	phys  = nvc0_vm_addr(vma, phys, mem->memtype, 0);
 	pte <<= 3;
+
+	if (mem->tag) {
+		struct nouveau_ltcg *ltcg =
+			nouveau_ltcg(vma->vm->vmm->base.base.parent);
+		u32 tag = mem->tag->offset + (delta >> 17);
+		phys |= (u64)tag << (32 + 12);
+		next |= (u64)1   << (32 + 12);
+		ltcg->tags_clear(ltcg, tag, cnt);
+	}
+
 	while (cnt--) {
 		nv_wo32(pgt, pte + 0, lower_32_bits(phys));
 		nv_wo32(pgt, pte + 4, upper_32_bits(phys));
@@ -85,10 +137,12 @@ nvc0_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
 	       struct nouveau_mem *mem, u32 pte, u32 cnt, dma_addr_t *list)
 {
 	u32 target = (vma->access & NV_MEM_ACCESS_NOSNOOP) ? 7 : 5;
+	/* compressed storage types are invalid for system memory */
+	u32 memtype = nvc0_pte_storage_type_map[mem->memtype & 0xff];
 
 	pte <<= 3;
 	while (cnt--) {
-		u64 phys = nvc0_vm_addr(vma, *list++, mem->memtype, target);
+		u64 phys = nvc0_vm_addr(vma, *list++, memtype, target);
 		nv_wo32(pgt, pte + 0, lower_32_bits(phys));
 		nv_wo32(pgt, pte + 4, upper_32_bits(phys));
 		pte += 8;
-- 
1.7.3.4
