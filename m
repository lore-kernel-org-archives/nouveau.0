From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 3/6] fb/ramnv50: Store the number of partitions in
	the designated fields
Date: Fri, 12 Sep 2014 18:00:14 +0200
Message-ID: <1410537617-8269-4-git-send-email-rspliet@eclipso.eu>
References: <1410537617-8269-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410537617-8269-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/fb.h |  1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c | 18 ++++++++----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/fb.h b/drivers/gpu/drm/nouveau/core/include/subdev/fb.h
index 871e739..613b2b7 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/fb.h
@@ -136,6 +136,7 @@ struct nouveau_ram {
 
 	int ranks;
 	int parts;
+	int part_mask;
 
 	int  (*get)(struct nouveau_fb *, u64 size, u32 align,
 		    u32 size_nc, u32 type, struct nouveau_mem **);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
index e5d12c2..16a3cb5 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
@@ -319,27 +319,22 @@ nv50_ram_get(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 static u32
 nv50_fb_vram_rblock(struct nouveau_fb *pfb, struct nouveau_ram *ram)
 {
-	int i, parts, colbits, rowbitsa, rowbitsb, banks;
+	int colbits, rowbitsa, rowbitsb, banks;
 	u64 rowsize, predicted;
-	u32 r0, r4, rt, ru, rblock_size;
+	u32 r0, r4, rt, rblock_size;
 
 	r0 = nv_rd32(pfb, 0x100200);
 	r4 = nv_rd32(pfb, 0x100204);
 	rt = nv_rd32(pfb, 0x100250);
-	ru = nv_rd32(pfb, 0x001540);
-	nv_debug(pfb, "memcfg 0x%08x 0x%08x 0x%08x 0x%08x\n", r0, r4, rt, ru);
-
-	for (i = 0, parts = 0; i < 8; i++) {
-		if (ru & (0x00010000 << i))
-			parts++;
-	}
+	nv_debug(pfb, "memcfg 0x%08x 0x%08x 0x%08x 0x%08x\n", r0, r4, rt,
+			nv_rd32(pfb, 0x001540));
 
 	colbits  =  (r4 & 0x0000f000) >> 12;
 	rowbitsa = ((r4 & 0x000f0000) >> 16) + 8;
 	rowbitsb = ((r4 & 0x00f00000) >> 20) + 8;
 	banks    = 1 << (((r4 & 0x03000000) >> 24) + 2);
 
-	rowsize = parts * banks * (1 << colbits) * 8;
+	rowsize = ram->parts * banks * (1 << colbits) * 8;
 	predicted = rowsize << rowbitsa;
 	if (r0 & 0x00000004)
 		predicted += rowsize << rowbitsb;
@@ -376,6 +371,9 @@ nv50_ram_create_(struct nouveau_object *parent, struct nouveau_object *engine,
 	ram->size = nv_rd32(pfb, 0x10020c);
 	ram->size = (ram->size & 0xffffff00) | ((ram->size & 0x000000ff) << 32);
 
+	ram->part_mask = (nv_rd32(pfb, 0x001540) & 0x00ff0000) >> 16;
+	ram->parts = hweight8(ram->part_mask);
+
 	switch (nv_rd32(pfb, 0x100714) & 0x00000007) {
 	case 0: ram->type = NV_MEM_TYPE_DDR1; break;
 	case 1:
-- 
1.9.3
