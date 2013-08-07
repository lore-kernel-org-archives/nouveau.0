From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix ltcg memory corruptions
Date: Wed, 07 Aug 2013 17:16:32 +0200
Message-ID: <520264D0.3020602@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Allocating type=0 marks the memory as free. This allows the ltcg memory to be
allocated twice. Add a BUG_ON in core/mm.c to prevent this ever happening again.
Additionally some registers were not initialized in init, this causes them to be
uninitialized after suspend.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/core/core/mm.c b/drivers/gpu/drm/nouveau/core/core/mm.c
index d829172..7a4e089 100644
--- a/drivers/gpu/drm/nouveau/core/core/mm.c
+++ b/drivers/gpu/drm/nouveau/core/core/mm.c
@@ -98,6 +98,8 @@ nouveau_mm_head(struct nouveau_mm *mm, u8 type, u32 size_max, u32 size_min,
 	u32 splitoff;
 	u32 s, e;
 
+	BUG_ON(!type);
+
 	list_for_each_entry(this, &mm->free, fl_entry) {
 		e = this->offset + this->length;
 		s = this->offset;
@@ -162,6 +164,8 @@ nouveau_mm_tail(struct nouveau_mm *mm, u8 type, u32 size_max, u32 size_min,
 	struct nouveau_mm_node *prev, *this, *next;
 	u32 mask = align - 1;
 
+	BUG_ON(!type);
+
 	list_for_each_entry_reverse(this, &mm->free, fl_entry) {
 		u32 e = this->offset + this->length;
 		u32 s = this->offset;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
index bcca883..7288940 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
@@ -30,8 +30,9 @@ struct nvc0_ltcg_priv {
 	struct nouveau_ltcg base;
 	u32 part_nr;
 	u32 subp_nr;
-	struct nouveau_mm tags;
 	u32 num_tags;
+	u32 tag_base;
+	struct nouveau_mm tags;
 	struct nouveau_mm_node *tag_ram;
 };
 
@@ -117,10 +118,6 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
 	u32 tag_size, tag_margin, tag_align;
 	int ret;
 
-	nv_wr32(priv, 0x17e8d8, priv->part_nr);
-	if (nv_device(pfb)->card_type >= NV_E0)
-		nv_wr32(priv, 0x17e000, priv->part_nr);
-
 	/* tags for 1/4 of VRAM should be enough (8192/4 per GiB of VRAM) */
 	priv->num_tags = (pfb->ram->size >> 17) / 4;
 	if (priv->num_tags > (1 << 17))
@@ -142,7 +139,7 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
 	tag_size += tag_align;
 	tag_size  = (tag_size + 0xfff) >> 12; /* round up */
 
-	ret = nouveau_mm_tail(&pfb->vram, 0, tag_size, tag_size, 1,
+	ret = nouveau_mm_tail(&pfb->vram, 1, tag_size, tag_size, 1,
 	                      &priv->tag_ram);
 	if (ret) {
 		priv->num_tags = 0;
@@ -152,7 +149,7 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
 		tag_base += tag_align - 1;
 		ret = do_div(tag_base, tag_align);
 
-		nv_wr32(priv, 0x17e8d4, tag_base);
+		priv->tag_base = tag_base;
 	}
 	ret = nouveau_mm_init(&priv->tags, 0, priv->num_tags, 1);
 
@@ -182,8 +179,6 @@ nvc0_ltcg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	}
 	priv->subp_nr = nv_rd32(priv, 0x17e8dc) >> 28;
 
-	nv_mask(priv, 0x17e820, 0x00100000, 0x00000000); /* INTR_EN &= ~0x10 */
-
 	ret = nvc0_ltcg_init_tag_ram(pfb, priv);
 	if (ret)
 		return ret;
@@ -209,13 +204,36 @@ nvc0_ltcg_dtor(struct nouveau_object *object)
 	nouveau_ltcg_destroy(ltcg);
 }
 
+int
+nvc0_ltcg_init(struct nouveau_object *object)
+{
+	struct nouveau_ltcg *ltcg = (struct nouveau_ltcg *)object;
+	struct nvc0_ltcg_priv *priv = (struct nvc0_ltcg_priv *)ltcg;
+	struct nouveau_fb *pfb = nouveau_fb(ltcg->base.base.parent);
+	int ret;
+
+	ret = nouveau_subdev_init(&pfb->base);
+	if (ret)
+		return ret;
+
+	nv_mask(priv, 0x17e820, 0x00100000, 0x00000000); /* INTR_EN &= ~0x10 */
+
+	nv_wr32(priv, 0x17e8d8, priv->part_nr);
+	if (nv_device(pfb)->card_type >= NV_E0)
+		nv_wr32(priv, 0x17e000, priv->part_nr);
+
+	nv_wr32(priv, 0x17e8d4, priv->tag_base);
+
+	return 0;
+}
+
 struct nouveau_oclass
 nvc0_ltcg_oclass = {
 	.handle = NV_SUBDEV(LTCG, 0xc0),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nvc0_ltcg_ctor,
 		.dtor = nvc0_ltcg_dtor,
-		.init = _nouveau_ltcg_init,
+		.init = nvc0_ltcg_init,
 		.fini = _nouveau_ltcg_fini,
 	},
 };
