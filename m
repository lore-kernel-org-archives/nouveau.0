From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 4/7] fb/ramnva3: Reclocking script for DDR3
Date: Mon, 29 Sep 2014 19:27:16 +0200
Message-ID: <1412011639-3210-5-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412011639-3210-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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
 .../drm/nouveau/core/include/subdev/bios/ramcfg.h  |   3 +-
 drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c  |   3 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c   | 299 +++++++++++++++------
 drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c     |   2 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c     |   2 +-
 5 files changed, 230 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h b/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
index 0b4bdc2..4a0e0ce 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
@@ -43,8 +43,9 @@ struct nvbios_ramcfg {
 			unsigned ramcfg_10_02_08:1;
 			unsigned ramcfg_10_02_10:1;
 			unsigned ramcfg_10_02_20:1;
-			unsigned ramcfg_10_02_40:1;
+			unsigned ramcfg_10_DLLoff:1;
 			unsigned ramcfg_10_03_0f:4;
+			unsigned ramcfg_10_04_01:1;
 			unsigned ramcfg_10_05:8;
 			unsigned ramcfg_10_06:8;
 			unsigned ramcfg_10_07:8;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c b/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
index 585e693..c568522 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
@@ -162,8 +162,9 @@ nvbios_rammapSp(struct nouveau_bios *bios, u32 data,
 		p->ramcfg_10_02_08 = (nv_ro08(bios, data + 0x02) & 0x08) >> 3;
 		p->ramcfg_10_02_10 = (nv_ro08(bios, data + 0x02) & 0x10) >> 4;
 		p->ramcfg_10_02_20 = (nv_ro08(bios, data + 0x02) & 0x20) >> 5;
-		p->ramcfg_10_02_40 = (nv_ro08(bios, data + 0x02) & 0x40) >> 6;
+		p->ramcfg_10_DLLoff = (nv_ro08(bios, data + 0x02) & 0x40) >> 6;
 		p->ramcfg_10_03_0f = (nv_ro08(bios, data + 0x03) & 0x0f) >> 0;
+		p->ramcfg_10_04_01 = (nv_ro08(bios, data + 0x04) & 0x01) >> 0;
 		p->ramcfg_10_05    = (nv_ro08(bios, data + 0x05) & 0xff) >> 0;
 		p->ramcfg_10_06    = (nv_ro08(bios, data + 0x06) & 0xff) >> 0;
 		p->ramcfg_10_07    = (nv_ro08(bios, data + 0x07) & 0xff) >> 0;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index a4fe7a4..7cff2d4 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -47,6 +47,7 @@ struct nva3_ramfuc {
 	struct ramfuc base;
 	struct ramfuc_reg r_0x001610;
 	struct ramfuc_reg r_0x001700;
+	struct ramfuc_reg r_0x002504;
 	struct ramfuc_reg r_0x004000;
 	struct ramfuc_reg r_0x004004;
 	struct ramfuc_reg r_0x004018;
@@ -56,12 +57,14 @@ struct nva3_ramfuc {
 	struct ramfuc_reg r_0x100200;
 	struct ramfuc_reg r_0x100210;
 	struct ramfuc_reg r_0x100220[9];
+	struct ramfuc_reg r_0x100264;
 	struct ramfuc_reg r_0x1002d0;
 	struct ramfuc_reg r_0x1002d4;
 	struct ramfuc_reg r_0x1002dc;
 	struct ramfuc_reg r_0x10053c;
 	struct ramfuc_reg r_0x1005a0;
 	struct ramfuc_reg r_0x1005a4;
+	struct ramfuc_reg r_0x100700;
 	struct ramfuc_reg r_0x100714;
 	struct ramfuc_reg r_0x100718;
 	struct ramfuc_reg r_0x10071c;
@@ -69,6 +72,7 @@ struct nva3_ramfuc {
 	struct ramfuc_reg r_0x100760;
 	struct ramfuc_reg r_0x1007a0;
 	struct ramfuc_reg r_0x1007e0;
+	struct ramfuc_reg r_0x100da0;
 	struct ramfuc_reg r_0x10f804;
 	struct ramfuc_reg r_0x1110e0;
 	struct ramfuc_reg r_0x111100;
@@ -403,19 +407,53 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 }
 #undef T
 
+static void
+nouveau_sddr3_dll_reset(struct nva3_ramfuc *fuc)
+{
+	ram_mask(fuc, mr[0], 0x100, 0x100);
+	ram_nsec(fuc, 1000);
+	ram_mask(fuc, mr[0], 0x100, 0x000);
+	ram_nsec(fuc, 1000);
+}
+
+static void
+nouveau_sddr3_dll_disable(struct nva3_ramfuc *fuc, u32 *mr)
+{
+	u32 mr1_old = ram_rd32(fuc, mr[1]);
+
+	if (!(mr1_old & 0x1)) {
+		ram_wr32(fuc, 0x1002d4, 0x00000001);
+		ram_wr32(fuc, mr[1], mr[1]);
+		ram_nsec(fuc, 1000);
+	}
+}
+
+static void
+nva3_ram_lock_pll(struct nva3_ramfuc *fuc, struct nva3_clock_info *mclk)
+{
+	ram_wr32(fuc, 0x004004, mclk->pll);
+	ram_mask(fuc, 0x004000, 0x00000001, 0x00000001);
+	ram_mask(fuc, 0x004000, 0x00000010, 0x00000000);
+	ram_wait(fuc, 0x004000, 0x00020000, 0x00020000, 64000);
+	ram_mask(fuc, 0x004000, 0x00000010, 0x00000010);
+}
+
 static int
 nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 {
 	struct nouveau_bios *bios = nouveau_bios(pfb);
 	struct nva3_ram *ram = (void *)pfb->ram;
 	struct nva3_ramfuc *fuc = &ram->fuc;
+	struct nva3_ltrain *train = &ram->ltrain;
 	struct nva3_clock_info mclk;
 	struct nouveau_ram_data *next;
 	u8  ver, hdr, cnt, len, strap;
 	u32 data;
-	u32 r004018, r100760, ctrl;
+	u32 r004018, r100760, r100da0, r111100, ctrl;
 	u32 unk714, unk718, unk71c;
 	int ret, i;
+	u32 timing[9];
+	bool pll2pll;
 
 	next = &ram->base.target;
 	next->freq = freq;
@@ -426,14 +464,9 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 
 	/* lookup memory config data relevant to the target frequency */
 	i = 0;
-	while ((data = nvbios_rammapEp(bios, i++, &ver, &hdr, &cnt, &len,
-				      &next->bios))) {
-		if (freq / 1000 >= next->bios.rammap_min &&
-		    freq / 1000 <= next->bios.rammap_max)
-			break;
-	}
-
-	if (!data || ver != 0x10 || hdr < 0x0e) {
+	data = nvbios_rammapEm(bios, freq / 1000, &ver, &hdr, &cnt, &len,
+				      &next->bios);
+	if (!data || ver != 0x10 || hdr < 0x05) {
 		nv_error(pfb, "invalid/missing rammap entry\n");
 		return -EINVAL;
 	}
@@ -447,7 +480,7 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 
 	data = nvbios_rammapSp(bios, data, ver, hdr, cnt, len, strap,
 			       &ver, &hdr, &next->bios);
-	if (!data || ver != 0x10 || hdr < 0x0e) {
+	if (!data || ver != 0x10 || hdr < 0x09) {
 		nv_error(pfb, "invalid/missing ramcfg entry\n");
 		return -EINVAL;
 	}
@@ -457,7 +490,7 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		data = nvbios_timingEp(bios, next->bios.ramcfg_timing,
 				       &ver, &hdr, &cnt, &len,
 				       &next->bios);
-		if (!data || ver != 0x10 || hdr < 0x19) {
+		if (!data || ver != 0x10 || hdr < 0x17) {
 			nv_error(pfb, "invalid/missing timing entry\n");
 			return -EINVAL;
 		}
@@ -469,53 +502,81 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		return ret;
 	}
 
+	nva3_ram_timing_calc(pfb, timing);
+
 	ret = ram_init(fuc, pfb);
 	if (ret)
 		return ret;
 
+	/* Determine ram-specific MR values */
+	ram->base.mr[0] = ram_rd32(fuc, mr[0]);
+	ram->base.mr[1] = ram_rd32(fuc, mr[1]);
+	ram->base.mr[2] = ram_rd32(fuc, mr[2]);
+
+	switch (ram->base.type) {
+	case NV_MEM_TYPE_DDR3:
+		ret = nouveau_sddr3_calc(&ram->base);
+		break;
+	default:
+		ret = -ENOSYS;
+		break;
+	}
+
+	if (ret)
+		return ret;
+
 	/* XXX: where the fuck does 750MHz come from? */
 	if (freq <= 750000) {
 		r004018 = 0x10000000;
 		r100760 = 0x22222222;
+		r100da0 = 0x00000010;
 	} else {
 		r004018 = 0x00000000;
 		r100760 = 0x00000000;
+		r100da0 = 0x00000000;
 	}
 
+	if (!next->bios.ramcfg_10_DLLoff)
+		r004018 |= 0x00004000;
+
+	/* pll2pll requires to switch to a safe clock first */
 	ctrl = ram_rd32(fuc, 0x004000);
-	if (ctrl & 0x00000008) {
-		if (mclk.pll) {
-			ram_mask(fuc, 0x004128, 0x00000101, 0x00000101);
-			ram_wr32(fuc, 0x004004, mclk.pll);
-			ram_wr32(fuc, 0x004000, (ctrl |= 0x00000001));
-			ram_wr32(fuc, 0x004000, (ctrl &= 0xffffffef));
-			ram_wait(fuc, 0x004000, 0x00020000, 0x00020000, 64000);
-			ram_wr32(fuc, 0x004000, (ctrl |= 0x00000010));
-			ram_wr32(fuc, 0x004018, 0x00005000 | r004018);
-			ram_wr32(fuc, 0x004000, (ctrl |= 0x00000004));
-		}
-	} else {
-		u32 ssel = 0x00000101;
-		if (mclk.clk)
-			ssel |= mclk.clk;
-		else
-			ssel |= 0x00080000; /* 324MHz, shouldn't matter... */
-		ram_mask(fuc, 0x004168, 0x003f3141, ctrl);
-	}
+	pll2pll = (!(ctrl & 0x00000008)) && mclk.pll;
 
+	/* Pre, NVIDIA does this outside the script */
 	if (next->bios.ramcfg_10_02_10) {
 		ram_mask(fuc, 0x111104, 0x00000600, 0x00000000);
 	} else {
 		ram_mask(fuc, 0x111100, 0x40000000, 0x40000000);
 		ram_mask(fuc, 0x111104, 0x00000180, 0x00000000);
 	}
+	/* Always disable this bit during reclock */
+	ram_mask(fuc, 0x100200, 0x00000800, 0x00000000);
+
+	/* If switching from non-pll to pll, lock before disabling FB */
+	if (mclk.pll && !pll2pll) {
+		ram_mask(fuc, 0x004128, 0x003f3141, mclk.clk | 0x00000101);
+		nva3_ram_lock_pll(fuc, &mclk);
+	}
+
+	/* Start with disabling some CRTCs and PFIFO? */
+	ram_wait_vblank(fuc);
+	ram_wr32(fuc, 0x611200, 0x3300);
+	ram_mask(fuc, 0x002504, 0x1, 0x1);
+	ram_nsec(fuc, 10000);
+	ram_wait(fuc, 0x002504, 0x10, 0x10, 20000); /* XXX: or longer? */
+	ram_block(fuc);
+	ram_nsec(fuc, 2000);
+
 
-	if (!next->bios.rammap_10_04_02)
-		ram_mask(fuc, 0x100200, 0x00000800, 0x00000000);
-	ram_wr32(fuc, 0x611200, 0x00003300);
 	if (!next->bios.ramcfg_10_02_10)
-		ram_wr32(fuc, 0x111100, 0x4c020000); /*XXX*/
+		ram_mask(fuc, 0x111100, 0x04020000, 0x04020000); /*XXX*/
+
+	/* If we're disabling the DLL, do it now */
+	if (next->bios.ramcfg_10_DLLoff)
+		nouveau_sddr3_dll_disable(fuc, ram->base.mr);
 
+	/* Brace RAM for impact */
 	ram_wr32(fuc, 0x1002d4, 0x00000001);
 	ram_wr32(fuc, 0x1002d0, 0x00000001);
 	ram_wr32(fuc, 0x1002d0, 0x00000001);
@@ -523,24 +584,38 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_wr32(fuc, 0x1002dc, 0x00000001);
 	ram_nsec(fuc, 2000);
 
-	ctrl = ram_rd32(fuc, 0x004000);
-	if (!(ctrl & 0x00000008) && mclk.pll) {
-		ram_wr32(fuc, 0x004000, (ctrl |=  0x00000008));
+	if (nv_device(pfb)->chipset == 0xa3 && freq <= 500000)
+		ram_mask(fuc, 0x100700, 0x00000006, 0x00000006);
+
+	/* Fiddle with clocks */
+	/* There's 4 scenario's
+	 * pll->pll: first switch to a 324MHz clock, set up new PLL, switch
+	 * clk->pll: Set up new PLL, switch
+	 * pll->clk: Set up clock, switch
+	 * clk->clk: Overwrite ctrl and other bits, switch */
+
+	/* Switch to regular clock - 324MHz */
+	if (pll2pll) {
+		ram_mask(fuc, 0x004000, 0x00000004, 0x00000004);
+		ram_mask(fuc, 0x004168, 0x003f3141, 0x00083101);
+		ram_mask(fuc, 0x004000, 0x00000008, 0x00000008);
 		ram_mask(fuc, 0x1110e0, 0x00088000, 0x00088000);
 		ram_wr32(fuc, 0x004018, 0x00001000);
-		ram_wr32(fuc, 0x004000, (ctrl &= ~0x00000001));
-		ram_wr32(fuc, 0x004004, mclk.pll);
-		ram_wr32(fuc, 0x004000, (ctrl |=  0x00000001));
-		udelay(64);
-		ram_wr32(fuc, 0x004018, 0x00005000 | r004018);
-		udelay(20);
-	} else
-	if (!mclk.pll) {
-		ram_mask(fuc, 0x004168, 0x003f3040, mclk.clk);
-		ram_wr32(fuc, 0x004000, (ctrl |= 0x00000008));
+		nva3_ram_lock_pll(fuc, &mclk);
+	}
+
+	if (mclk.pll) {
+		ram_mask(fuc, 0x004000, 0x00000105, 0x00000105);
+		ram_wr32(fuc, 0x004018, 0x00001000 | r004018);
+		ram_wr32(fuc, 0x100da0, r100da0);
+	} else {
+		ram_mask(fuc, 0x004168, 0x003f3141, mclk.clk | 0x00000101);
+		ram_mask(fuc, 0x004000, 0x00000108, 0x00000008);
 		ram_mask(fuc, 0x1110e0, 0x00088000, 0x00088000);
-		ram_wr32(fuc, 0x004018, 0x0000d000 | r004018);
+		ram_wr32(fuc, 0x004018, 0x00009000 | r004018);
+		ram_wr32(fuc, 0x100da0, r100da0);
 	}
+	ram_nsec(fuc, 20000);
 
 	if (next->bios.rammap_10_04_08) {
 		ram_wr32(fuc, 0x1005a0, next->bios.ramcfg_10_06 << 16 |
@@ -554,6 +629,12 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 					0x80000000);
 		ram_mask(fuc, 0x10053c, 0x00001000, 0x00000000);
 	} else {
+		if (train->state == NVA3_TRAIN_DONE) {
+			ram_wr32(fuc, 0x100080, 0x1020);
+			ram_mask(fuc, 0x111400, 0xffffffff, train->r_111400);
+			ram_mask(fuc, 0x1111e0, 0xffffffff, train->r_1111e0);
+			ram_mask(fuc, 0x100720, 0xffffffff, train->r_100720);
+		}
 		ram_mask(fuc, 0x10053c, 0x00001000, 0x00001000);
 		ram_mask(fuc, 0x10f804, 0x80000000, 0x00000000);
 		ram_mask(fuc, 0x100760, 0x22222222, r100760);
@@ -561,22 +642,27 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		ram_mask(fuc, 0x1007e0, 0x22222222, r100760);
 	}
 
+	if (nv_device(pfb)->chipset == 0xa3 && freq > 500000) {
+		ram_mask(fuc, 0x100700, 0x00000006, 0x00000000);
+	}
+
+	/* Final switch */
 	if (mclk.pll) {
 		ram_mask(fuc, 0x1110e0, 0x00088000, 0x00011000);
-		ram_wr32(fuc, 0x004000, (ctrl &= ~0x00000008));
+		ram_mask(fuc, 0x004000, 0x00000008, 0x00000000);
 	}
 
-	/*XXX: LEAVE */
 	ram_wr32(fuc, 0x1002dc, 0x00000000);
 	ram_wr32(fuc, 0x1002d4, 0x00000001);
 	ram_wr32(fuc, 0x100210, 0x80000000);
-	ram_nsec(fuc, 1000);
-	ram_nsec(fuc, 1000);
+	ram_nsec(fuc, 2000);
 
-	ram_mask(fuc, mr[2], 0x00000000, 0x00000000);
+	/* Set RAM MR parameters and timings */
+	ram_wr32(fuc, mr[2], ram->base.mr[2]);
+	ram_nsec(fuc, 1000);
+	ram_wr32(fuc, mr[1], ram->base.mr[1]);
 	ram_nsec(fuc, 1000);
-	ram_nuke(fuc, mr[0]);
-	ram_mask(fuc, mr[0], 0x00000000, 0x00000000);
+	ram_wr32(fuc, mr[0], ram->base.mr[0]);
 	ram_nsec(fuc, 1000);
 
 	ram_wr32(fuc, 0x100220[3], timing[3]);
@@ -592,35 +678,75 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	/* Misc */
 	ram_mask(fuc, 0x100200, 0x00001000, !next->bios.ramcfg_10_02_08 << 12);
 
-	unk714 = ram_rd32(fuc, 0x100714) & ~0xf0000010;
-	unk718 = ram_rd32(fuc, 0x100718) & ~0x00000100;
-	unk71c = ram_rd32(fuc, 0x10071c) & ~0x00000100;
+	/* XXX: A lot of "chipset"/"ram type" specific stuff...? */
+	unk714  = ram_rd32(fuc, 0x100714) & ~0xf0000130;
+	unk718  = ram_rd32(fuc, 0x100718) & ~0x00000100;
+	unk71c  = ram_rd32(fuc, 0x10071c) & ~0x00000100;
+	r111100 = ram_rd32(fuc, 0x111100) & ~0x3a800000;
+
+	if (next->bios.ramcfg_10_02_04) {
+		switch (ram->base.type) {
+		case NV_MEM_TYPE_DDR3:
+			if (nv_device(pfb)->chipset != 0xa8)
+				r111100 |= 0x00000004;
+			/* no break */
+		default:
+			break;
+		}
+	} else {
+		switch (ram->base.type) {
+		case NV_MEM_TYPE_DDR3:
+			if (nv_device(pfb)->chipset == 0xa8) {
+				r111100 |=  0x08000000;
+			} else {
+				r111100 &= ~0x00000004;
+				r111100 |=  0x12800000;
+			}
+			unk714  |= 0x00000010;
+			break;
+		default:
+			break;
+		}
+	}
+
+	unk714 |= (next->bios.ramcfg_10_04_01) << 8;
+
 	if (next->bios.ramcfg_10_02_20)
 		unk714 |= 0xf0000000;
-	if (!next->bios.ramcfg_10_02_04)
-		unk714 |= 0x00000010;
-	ram_wr32(fuc, 0x100714, unk714);
-
+	if (next->bios.ramcfg_10_02_02)
+		unk718 |= 0x00000100;
 	if (next->bios.ramcfg_10_02_01)
 		unk71c |= 0x00000100;
-	ram_wr32(fuc, 0x10071c, unk71c);
+	if (next->bios.timing_10_24 != 0xff) {
+		unk718 &= ~0xf0000000;
+		unk718 |= next->bios.timing_10_24 << 28;
+	}
+	if (next->bios.ramcfg_10_02_10)
+		r111100 &= ~0x04020000;
 
-	if (next->bios.ramcfg_10_02_02)
-		unk718 |= 0x00000100;
-	ram_wr32(fuc, 0x100718, unk718);
+	ram_mask(fuc, 0x100714, 0xffffffff, unk714);
+	ram_mask(fuc, 0x10071c, 0xffffffff, unk71c);
+	ram_mask(fuc, 0x100718, 0xffffffff, unk718);
+	ram_mask(fuc, 0x111100, 0xffffffff, r111100);
 
-	if (next->bios.ramcfg_10_02_10)
-		ram_wr32(fuc, 0x111100, 0x48000000); /*XXX*/
+	/* Reset DLL */
+	if (!next->bios.ramcfg_10_DLLoff)
+		nouveau_sddr3_dll_reset(fuc);
 
-	ram_mask(fuc, mr[0], 0x100, 0x100);
-	ram_nsec(fuc, 1000);
-	ram_mask(fuc, mr[0], 0x100, 0x000);
-	ram_nsec(fuc, 1000);
+	ram_nsec(fuc, 14000);
 
+	ram_wr32(fuc, 0x100264, 0x1);
 	ram_nsec(fuc, 2000);
-	ram_nsec(fuc, 12000);
 
-	ram_wr32(fuc, 0x611200, 0x00003330);
+	ram_nuke(fuc, 0x100700);
+	ram_mask(fuc, 0x100700, 0x01000000, 0x01000000);
+	ram_mask(fuc, 0x100700, 0x01000000, 0x00000000);
+
+	/* Re-enable FB */
+	ram_unblock(fuc);
+	ram_wr32(fuc, 0x611200, 0x3330);
+
+	/* Post fiddlings */
 	if (next->bios.rammap_10_04_02)
 		ram_mask(fuc, 0x100200, 0x00000800, 0x00000800);
 	if (next->bios.ramcfg_10_02_10) {
@@ -648,7 +774,22 @@ nva3_ram_prog(struct nouveau_fb *pfb)
 	struct nouveau_device *device = nv_device(pfb);
 	struct nva3_ram *ram = (void *)pfb->ram;
 	struct nva3_ramfuc *fuc = &ram->fuc;
-	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", true));
+	bool exec = nouveau_boolopt(device->cfgopt, "NvMemExec", true);
+
+	if (exec) {
+		nv_mask(pfb, 0x001534, 0x2, 0x2);
+
+		ram_exec(fuc, true);
+
+		/* Post-processing, avoids flicker */
+		nv_mask(pfb, 0x002504, 0x1, 0x0);
+		nv_mask(pfb, 0x001534, 0x2, 0x0);
+
+		nv_mask(pfb, 0x616308, 0x10, 0x10);
+		nv_mask(pfb, 0x616b08, 0x10, 0x10);
+	} else {
+		ram_exec(fuc, false);
+	}
 	return 0;
 }
 
@@ -713,31 +854,39 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	ram->fuc.r_0x001610 = ramfuc_reg(0x001610);
 	ram->fuc.r_0x001700 = ramfuc_reg(0x001700);
+	ram->fuc.r_0x002504 = ramfuc_reg(0x002504);
 	ram->fuc.r_0x004000 = ramfuc_reg(0x004000);
 	ram->fuc.r_0x004004 = ramfuc_reg(0x004004);
 	ram->fuc.r_0x004018 = ramfuc_reg(0x004018);
 	ram->fuc.r_0x004128 = ramfuc_reg(0x004128);
 	ram->fuc.r_0x004168 = ramfuc_reg(0x004168);
+	ram->fuc.r_0x100080 = ramfuc_reg(0x100080);
 	ram->fuc.r_0x100200 = ramfuc_reg(0x100200);
 	ram->fuc.r_0x100210 = ramfuc_reg(0x100210);
 	for (i = 0; i < 9; i++)
 		ram->fuc.r_0x100220[i] = ramfuc_reg(0x100220 + (i * 4));
+	ram->fuc.r_0x100264 = ramfuc_reg(0x100264);
 	ram->fuc.r_0x1002d0 = ramfuc_reg(0x1002d0);
 	ram->fuc.r_0x1002d4 = ramfuc_reg(0x1002d4);
 	ram->fuc.r_0x1002dc = ramfuc_reg(0x1002dc);
 	ram->fuc.r_0x10053c = ramfuc_reg(0x10053c);
 	ram->fuc.r_0x1005a0 = ramfuc_reg(0x1005a0);
 	ram->fuc.r_0x1005a4 = ramfuc_reg(0x1005a4);
+	ram->fuc.r_0x100700 = ramfuc_reg(0x100700);
 	ram->fuc.r_0x100714 = ramfuc_reg(0x100714);
 	ram->fuc.r_0x100718 = ramfuc_reg(0x100718);
 	ram->fuc.r_0x10071c = ramfuc_reg(0x10071c);
+	ram->fuc.r_0x100720 = ramfuc_reg(0x100720);
 	ram->fuc.r_0x100760 = ramfuc_stride(0x100760, 4, ram->base.part_mask);
 	ram->fuc.r_0x1007a0 = ramfuc_stride(0x1007a0, 4, ram->base.part_mask);
 	ram->fuc.r_0x1007e0 = ramfuc_stride(0x1007e0, 4, ram->base.part_mask);
+	ram->fuc.r_0x100da0 = ramfuc_stride(0x100da0, 4, ram->base.part_mask);
 	ram->fuc.r_0x10f804 = ramfuc_reg(0x10f804);
 	ram->fuc.r_0x1110e0 = ramfuc_stride(0x1110e0, 4, ram->base.part_mask);
 	ram->fuc.r_0x111100 = ramfuc_reg(0x111100);
 	ram->fuc.r_0x111104 = ramfuc_reg(0x111104);
+	ram->fuc.r_0x1111e0 = ramfuc_reg(0x1111e0);
+	ram->fuc.r_0x111400 = ramfuc_reg(0x111400);
 	ram->fuc.r_0x611200 = ramfuc_reg(0x611200);
 
 	if (ram->base.ranks > 1) {
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
index bb1eb8f..252575f 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
@@ -66,7 +66,7 @@ nouveau_sddr2_calc(struct nouveau_ram *ram)
 	case 0x10:
 		CL  = ram->next->bios.timing_10_CL;
 		WR  = ram->next->bios.timing_10_WR;
-		DLL = !ram->next->bios.ramcfg_10_02_40;
+		DLL = !ram->next->bios.ramcfg_10_DLLoff;
 		ODT = ram->next->bios.timing_10_ODT & 3;
 		break;
 	case 0x20:
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
index 83949b1..a2dca48 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
@@ -80,7 +80,7 @@ nouveau_sddr3_calc(struct nouveau_ram *ram)
 		CWL = ram->next->bios.timing_10_CWL;
 		CL  = ram->next->bios.timing_10_CL;
 		WR  = ram->next->bios.timing_10_WR;
-		DLL = !ram->next->bios.ramcfg_10_02_40;
+		DLL = !ram->next->bios.ramcfg_10_DLLoff;
 		ODT = ram->next->bios.timing_10_ODT;
 		break;
 	case 0x20:
-- 
1.9.3
