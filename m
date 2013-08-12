From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix ltcg allocating memory as free
Date: Mon, 12 Aug 2013 12:41:34 +0200
Message-ID: <5208BBDE.9030608@canonical.com>
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
@@ -142,7 +139,7 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
 	tag_size += tag_align;
 	tag_size  = (tag_size + 0xfff) >> 12; /* round up */
 
-	ret = nouveau_mm_tail(&pfb->vram, 0, tag_size, tag_size, 1,
+	ret = nouveau_mm_tail(&pfb->vram, 1, tag_size, tag_size, 1,
 	                      &priv->tag_ram);
 	if (ret) {
 		priv->num_tags = 0;
