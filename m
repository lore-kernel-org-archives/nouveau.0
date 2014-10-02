From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 6/9] fb/ramnva3: Reclocking script for DDR2
Date: Thu,  2 Oct 2014 18:01:55 +0200
Message-ID: <1412265718-1215-7-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
 <1412265718-1215-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412265718-1215-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c | 57 +++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index 7cff2d4..0e1697a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -356,7 +356,7 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 {
 	struct nva3_ram *ram = (void *)pfb->ram;
 	struct nvbios_ramcfg *cfg = &ram->base.target.bios;
-	int tUNK_base;
+	int tUNK_base, tUNK_40_0, prevCL;
 	u32 cur3, cur7, cur8;
 
 	cur3 = nv_rd32(pfb, 0x10022c);
@@ -364,10 +364,11 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 	cur8 = nv_rd32(pfb, 0x100240);
 
 	if (T(CWL) == 0)
-		T(CWL) = ((nv_rd32(pfb, 0x100228) & 0x0f000000) >> 24) + 1;
+		/* Observed on DDR2 */
+		T(CWL) = T(CL) - 1;
 
-	tUNK_base =  ((cur7 & 0x00ff0000) >> 16) -
-		     (cur3 & 0x000000ff) - 1;
+	prevCL = (cur3 & 0x000000ff) + 1;
+	tUNK_base = ((cur7 & 0x00ff0000) >> 16) - prevCL;
 
 	timing[0] = (T(RP) << 24 | T(RAS) << 16 | T(RFC) << 8 | T(RC));
 	timing[1] = (T(WR) + 1 + T(CWL)) << 24 |
@@ -398,6 +399,16 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 		    0x202;
 	timing[8] = cur8 & 0xffffff00;
 
+	switch (ram->base.type) {
+	case NV_MEM_TYPE_DDR2:
+		tUNK_40_0 = prevCL - (cur8 & 0xff);
+		if (tUNK_40_0 > 0)
+			timing[8] |= T(CL);
+		break;
+	default:
+		break;
+	}
+
 	nv_debug(pfb, "Entry: 220: %08x %08x %08x %08x\n",
 			timing[0], timing[1], timing[2], timing[3]);
 	nv_debug(pfb, "  230: %08x %08x %08x %08x\n",
@@ -408,7 +419,7 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 #undef T
 
 static void
-nouveau_sddr3_dll_reset(struct nva3_ramfuc *fuc)
+nouveau_sddr2_dll_reset(struct nva3_ramfuc *fuc)
 {
 	ram_mask(fuc, mr[0], 0x100, 0x100);
 	ram_nsec(fuc, 1000);
@@ -514,6 +525,9 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram->base.mr[2] = ram_rd32(fuc, mr[2]);
 
 	switch (ram->base.type) {
+	case NV_MEM_TYPE_DDR2:
+		ret = nouveau_sddr2_calc(&ram->base);
+		break;
 	case NV_MEM_TYPE_DDR3:
 		ret = nouveau_sddr3_calc(&ram->base);
 		break;
@@ -573,8 +587,11 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		ram_mask(fuc, 0x111100, 0x04020000, 0x04020000); /*XXX*/
 
 	/* If we're disabling the DLL, do it now */
-	if (next->bios.ramcfg_10_DLLoff)
+	switch (next->bios.ramcfg_10_DLLoff * ram->base.type) {
+	case NV_MEM_TYPE_DDR3:
 		nouveau_sddr3_dll_disable(fuc, ram->base.mr);
+		break;
+	}
 
 	/* Brace RAM for impact */
 	ram_wr32(fuc, 0x1002d4, 0x00000001);
@@ -658,12 +675,12 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_nsec(fuc, 2000);
 
 	/* Set RAM MR parameters and timings */
-	ram_wr32(fuc, mr[2], ram->base.mr[2]);
-	ram_nsec(fuc, 1000);
-	ram_wr32(fuc, mr[1], ram->base.mr[1]);
-	ram_nsec(fuc, 1000);
-	ram_wr32(fuc, mr[0], ram->base.mr[0]);
-	ram_nsec(fuc, 1000);
+	for (i = 2; i >= 0; i--) {
+		if (ram_rd32(fuc, mr[i]) != ram->base.mr[i]) {
+			ram_wr32(fuc, mr[i], ram->base.mr[i]);
+			ram_nsec(fuc, 1000);
+		}
+	}
 
 	ram_wr32(fuc, 0x100220[3], timing[3]);
 	ram_wr32(fuc, 0x100220[1], timing[1]);
@@ -690,11 +707,18 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 			if (nv_device(pfb)->chipset != 0xa8)
 				r111100 |= 0x00000004;
 			/* no break */
+		case NV_MEM_TYPE_DDR2:
+			r111100 |= 0x08000000;
+			break;
 		default:
 			break;
 		}
 	} else {
 		switch (ram->base.type) {
+		case NV_MEM_TYPE_DDR2:
+			r111100 |= 0x1a800000;
+			unk714  |= 0x00000010;
+			break;
 		case NV_MEM_TYPE_DDR3:
 			if (nv_device(pfb)->chipset == 0xa8) {
 				r111100 |=  0x08000000;
@@ -731,12 +755,14 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 
 	/* Reset DLL */
 	if (!next->bios.ramcfg_10_DLLoff)
-		nouveau_sddr3_dll_reset(fuc);
+		nouveau_sddr2_dll_reset(fuc);
 
 	ram_nsec(fuc, 14000);
 
-	ram_wr32(fuc, 0x100264, 0x1);
-	ram_nsec(fuc, 2000);
+	if (ram->base.type == NV_MEM_TYPE_DDR3) {
+		ram_wr32(fuc, 0x100264, 0x1);
+		ram_nsec(fuc, 2000);
+	}
 
 	ram_nuke(fuc, 0x100700);
 	ram_mask(fuc, 0x100700, 0x01000000, 0x01000000);
@@ -842,6 +868,7 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	switch (ram->base.type) {
+	case NV_MEM_TYPE_DDR2:
 	case NV_MEM_TYPE_DDR3:
 		ram->base.calc = nva3_ram_calc;
 		ram->base.prog = nva3_ram_prog;
-- 
1.9.3
