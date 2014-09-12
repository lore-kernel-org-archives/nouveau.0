From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 6/6] fb/ramnva3: Use ram->base structs instead of
	local structs
Date: Fri, 12 Sep 2014 18:00:17 +0200
Message-ID: <1410537617-8269-7-git-send-email-rspliet@eclipso.eu>
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

This will ease the use of generic timing and MR generation bits later

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c | 77 +++++++++++++-----------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index c2037b9..cdd3648 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -80,20 +80,19 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	struct nva3_ramfuc *fuc = &ram->fuc;
 	struct nva3_clock_info mclk;
 	struct nvbios_ramcfg cfg;
-	u8  ver, cnt, len, strap;
+	u8  cnt, len, strap, idx;
 	u32 data;
-	struct {
-		u32 data;
-		u8  size;
-	} rammap, ramcfg, timing;
 	u32 r004018, r100760, ctrl;
 	u32 unk714, unk718, unk71c;
 	int ret;
 
 	/* lookup memory config data relevant to the target frequency */
-	rammap.data = nvbios_rammapEm(bios, freq / 1000, &ver, &rammap.size,
-				     &cnt, &ramcfg.size, &cfg);
-	if (!rammap.data || ver != 0x10 || rammap.size < 0x0e) {
+	ram->base.rammap.data = nvbios_rammapEm(bios, freq / 1000,
+				&ram->base.rammap.version,
+				&ram->base.rammap.size, &cnt,
+				&len, &cfg);
+	if (!ram->base.rammap.data || ram->base.rammap.version != 0x10 ||
+	     ram->base.rammap.size < 0x05) {
 		nv_error(pfb, "invalid/missing rammap entry\n");
 		return -EINVAL;
 	}
@@ -105,23 +104,33 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		return -EINVAL;
 	}
 
-	ramcfg.data = rammap.data + rammap.size + (strap * ramcfg.size);
-	if (!ramcfg.data || ver != 0x10 || ramcfg.size < 0x0e) {
+	ram->base.ramcfg.data = nvbios_rammapSe(bios, ram->base.rammap.data,
+					ram->base.rammap.version,
+					ram->base.rammap.size,
+					cnt, len, strap,
+					&ram->base.ramcfg.version,
+					&ram->base.ramcfg.size);
+	if (!ram->base.ramcfg.data || ram->base.ramcfg.version != 0x10 ||
+	     ram->base.ramcfg.size < 0x09) {
 		nv_error(pfb, "invalid/missing ramcfg entry\n");
 		return -EINVAL;
 	}
 
 	/* lookup memory timings, if bios says they're present */
-	strap = nv_ro08(bios, ramcfg.data + 0x01);
-	if (strap != 0xff) {
-		timing.data = nvbios_timingEe(bios, strap, &ver, &timing.size,
-					     &cnt, &len);
-		if (!timing.data || ver != 0x10 || timing.size < 0x19) {
+	idx = nv_ro08(bios, ram->base.ramcfg.data + 0x01) & 0xff;
+	if (idx != 0xff) {
+		ram->base.timing.data = nvbios_timingEe(bios, idx,
+					&ram->base.timing.version,
+					&ram->base.timing.size,
+					&cnt, &len);
+		if (!ram->base.timing.data ||
+		     ram->base.timing.version != 0x10 ||
+		     ram->base.timing.size < 0x18) {
 			nv_error(pfb, "invalid/missing timing entry\n");
 			return -EINVAL;
 		}
 	} else {
-		timing.data = 0;
+		ram->base.timing.data = 0;
 	}
 
 	ret = nva3_pll_info(nouveau_clock(pfb), 0x12, 0x4000, freq, &mclk);
@@ -164,17 +173,17 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		ram_mask(fuc, 0x004168, 0x003f3141, ctrl);
 	}
 
-	if ( (nv_ro08(bios, ramcfg.data + 0x02) & 0x10)) {
+	if ( (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x10)) {
 		ram_mask(fuc, 0x111104, 0x00000600, 0x00000000);
 	} else {
 		ram_mask(fuc, 0x111100, 0x40000000, 0x40000000);
 		ram_mask(fuc, 0x111104, 0x00000180, 0x00000000);
 	}
 
-	if (!(nv_ro08(bios, rammap.data + 0x04) & 0x02))
+	if (!(nv_ro08(bios, ram->base.rammap.data + 0x04) & 0x02))
 		ram_mask(fuc, 0x100200, 0x00000800, 0x00000000);
 	ram_wr32(fuc, 0x611200, 0x00003300);
-	if (!(nv_ro08(bios, ramcfg.data + 0x02) & 0x10))
+	if (!(nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x10))
 		ram_wr32(fuc, 0x111100, 0x4c020000); /*XXX*/
 
 	ram_wr32(fuc, 0x1002d4, 0x00000001);
@@ -203,13 +212,13 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		ram_wr32(fuc, 0x004018, 0x0000d000 | r004018);
 	}
 
-	if ( (nv_ro08(bios, rammap.data + 0x04) & 0x08)) {
-		u32 unk5a0 = (nv_ro16(bios, ramcfg.data + 0x05) << 8) |
-			      nv_ro08(bios, ramcfg.data + 0x05);
-		u32 unk5a4 = (nv_ro16(bios, ramcfg.data + 0x07));
-		u32 unk804 = (nv_ro08(bios, ramcfg.data + 0x09) & 0xf0) << 16 |
-			     (nv_ro08(bios, ramcfg.data + 0x03) & 0x0f) << 16 |
-			     (nv_ro08(bios, ramcfg.data + 0x09) & 0x0f) |
+	if ( (nv_ro08(bios, ram->base.rammap.data + 0x04) & 0x08)) {
+		u32 unk5a0 = (nv_ro16(bios, ram->base.ramcfg.data + 0x05) << 8) |
+			      nv_ro08(bios, ram->base.ramcfg.data + 0x05);
+		u32 unk5a4 = (nv_ro16(bios, ram->base.ramcfg.data + 0x07));
+		u32 unk804 = (nv_ro08(bios, ram->base.ramcfg.data + 0x09) & 0xf0) << 16 |
+			     (nv_ro08(bios, ram->base.ramcfg.data + 0x03) & 0x0f) << 16 |
+			     (nv_ro08(bios, ram->base.ramcfg.data + 0x09) & 0x0f) |
 			     0x80000000;
 		ram_wr32(fuc, 0x1005a0, unk5a0);
 		ram_wr32(fuc, 0x1005a4, unk5a4);
@@ -251,27 +260,27 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_mask(fuc, 0x100220[0], 0x00000000, 0x00000000);
 	ram_mask(fuc, 0x100220[8], 0x00000000, 0x00000000);
 
-	data = (nv_ro08(bios, ramcfg.data + 0x02) & 0x08) ? 0x00000000 : 0x00001000;
+	data = (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x08) ? 0x00000000 : 0x00001000;
 	ram_mask(fuc, 0x100200, 0x00001000, data);
 
 	unk714 = ram_rd32(fuc, 0x100714) & ~0xf0000010;
 	unk718 = ram_rd32(fuc, 0x100718) & ~0x00000100;
 	unk71c = ram_rd32(fuc, 0x10071c) & ~0x00000100;
-	if ( (nv_ro08(bios, ramcfg.data + 0x02) & 0x20))
+	if ( (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x20))
 		unk714 |= 0xf0000000;
-	if (!(nv_ro08(bios, ramcfg.data + 0x02) & 0x04))
+	if (!(nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x04))
 		unk714 |= 0x00000010;
 	ram_wr32(fuc, 0x100714, unk714);
 
-	if (nv_ro08(bios, ramcfg.data + 0x02) & 0x01)
+	if (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x01)
 		unk71c |= 0x00000100;
 	ram_wr32(fuc, 0x10071c, unk71c);
 
-	if (nv_ro08(bios, ramcfg.data + 0x02) & 0x02)
+	if (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x02)
 		unk718 |= 0x00000100;
 	ram_wr32(fuc, 0x100718, unk718);
 
-	if (nv_ro08(bios, ramcfg.data + 0x02) & 0x10)
+	if (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x10)
 		ram_wr32(fuc, 0x111100, 0x48000000); /*XXX*/
 
 	ram_mask(fuc, mr[0], 0x100, 0x100);
@@ -283,9 +292,9 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_nsec(fuc, 12000);
 
 	ram_wr32(fuc, 0x611200, 0x00003330);
-	if ( (nv_ro08(bios, rammap.data + 0x04) & 0x02))
+	if ( (nv_ro08(bios, ram->base.rammap.data + 0x04) & 0x02))
 		ram_mask(fuc, 0x100200, 0x00000800, 0x00000800);
-	if ( (nv_ro08(bios, ramcfg.data + 0x02) & 0x10)) {
+	if ( (nv_ro08(bios, ram->base.ramcfg.data + 0x02) & 0x10)) {
 		ram_mask(fuc, 0x111104, 0x00000180, 0x00000180);
 		ram_mask(fuc, 0x111100, 0x40000000, 0x00000000);
 	} else {
-- 
1.9.3
