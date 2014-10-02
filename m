From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 7/9] fb/ramnva3: Reclocking script for GDDR3
Date: Thu,  2 Oct 2014 18:01:56 +0200
Message-ID: <1412265718-1215-8-git-send-email-rspliet@eclipso.eu>
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
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c | 100 +++++++++++++++++++++--
 drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c  |   2 +-
 2 files changed, 92 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index 0e1697a..3b38a53 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -33,6 +33,8 @@
 #include <subdev/clock/nva3.h>
 #include <subdev/clock/pll.h>
 
+#include <subdev/gpio.h>
+
 #include <subdev/timer.h>
 
 #include <engine/fifo.h>
@@ -43,6 +45,9 @@
 
 #include "nv50.h"
 
+/* XXX: Remove when memx gains GPIO support */
+extern int nv50_gpio_location(int line, u32 *reg, u32 *shift);
+
 struct nva3_ramfuc {
 	struct ramfuc base;
 	struct ramfuc_reg r_0x001610;
@@ -81,6 +86,7 @@ struct nva3_ramfuc {
 	struct ramfuc_reg r_0x111400;
 	struct ramfuc_reg r_0x611200;
 	struct ramfuc_reg r_mr[4];
+	struct ramfuc_reg r_gpioFBVREF;
 };
 
 struct nva3_ltrain {
@@ -357,15 +363,22 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 	struct nva3_ram *ram = (void *)pfb->ram;
 	struct nvbios_ramcfg *cfg = &ram->base.target.bios;
 	int tUNK_base, tUNK_40_0, prevCL;
-	u32 cur3, cur7, cur8;
+	u32 cur2, cur3, cur7, cur8;
 
+	cur2 = nv_rd32(pfb, 0x100228);
 	cur3 = nv_rd32(pfb, 0x10022c);
 	cur7 = nv_rd32(pfb, 0x10023c);
 	cur8 = nv_rd32(pfb, 0x100240);
 
-	if (T(CWL) == 0)
-		/* Observed on DDR2 */
+
+	switch ((!T(CWL)) * ram->base.type) {
+	case NV_MEM_TYPE_DDR2:
 		T(CWL) = T(CL) - 1;
+		break;
+	case NV_MEM_TYPE_GDDR3:
+		T(CWL) = ((cur2 & 0xff000000) >> 24) + 1;
+		break;
+	}
 
 	prevCL = (cur3 & 0x000000ff) + 1;
 	tUNK_base = ((cur7 & 0x00ff0000) >> 16) - prevCL;
@@ -389,10 +402,10 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 		    T(13);
 	timing[5] = T(RFC) << 24 |
 		    max_t(u8,T(RCDRD), T(RCDWR)) << 16 |
-		    (T(CWL) + 6) << 8 |
+		    max_t(u8, (T(CWL) + 6), (T(CL) + 2)) << 8 |
 		    T(RP);
 	timing[6] = (0x5a + T(CL)) << 16 |
-		    (6 - T(CL) + T(CWL)) << 8 |
+		    max_t(u8, 1, (6 - T(CL) + T(CWL))) << 8 |
 		    (0x50 + T(CL) - T(CWL));
 	timing[7] = (cur7 & 0xff000000) |
 		    ((tUNK_base + T(CL)) << 16) |
@@ -401,6 +414,7 @@ nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
 
 	switch (ram->base.type) {
 	case NV_MEM_TYPE_DDR2:
+	case NV_MEM_TYPE_GDDR3:
 		tUNK_40_0 = prevCL - (cur8 & 0xff);
 		if (tUNK_40_0 > 0)
 			timing[8] |= T(CL);
@@ -440,6 +454,17 @@ nouveau_sddr3_dll_disable(struct nva3_ramfuc *fuc, u32 *mr)
 }
 
 static void
+nouveau_gddr3_dll_disable(struct nva3_ramfuc *fuc, u32 *mr)
+{
+	u32 mr1_old = ram_rd32(fuc, mr[1]);
+
+	if (!(mr1_old & 0x40)) {
+		ram_wr32(fuc, mr[1], mr[1]);
+		ram_nsec(fuc, 1000);
+	}
+}
+
+static void
 nva3_ram_lock_pll(struct nva3_ramfuc *fuc, struct nva3_clock_info *mclk)
 {
 	ram_wr32(fuc, 0x004004, mclk->pll);
@@ -449,6 +474,29 @@ nva3_ram_lock_pll(struct nva3_ramfuc *fuc, struct nva3_clock_info *mclk)
 	ram_mask(fuc, 0x004000, 0x00000010, 0x00000010);
 }
 
+static void
+nva3_ram_fbvref(struct nva3_ramfuc *fuc, u32 val)
+{
+	struct nouveau_gpio *gpio = nouveau_gpio(fuc->base.pfb);
+	struct dcb_gpio_func func;
+	u32 reg, sh, gpio_val;
+	int ret;
+
+	if (gpio->get(gpio, 0, 0x2e, DCB_GPIO_UNUSED) != val) {
+		ret = gpio->find(gpio, 0, 0x2e, DCB_GPIO_UNUSED, &func);
+		if (ret)
+			return;
+
+		nv50_gpio_location(func.line, &reg, &sh);
+		gpio_val = ram_rd32(fuc, gpioFBVREF);
+		if (gpio_val & (8 << sh))
+			val = !val;
+
+		ram_mask(fuc, gpioFBVREF, (0x3 << sh), ((val | 0x2) << sh));
+		ram_nsec(fuc, 20000);
+	}
+}
+
 static int
 nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 {
@@ -531,6 +579,9 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	case NV_MEM_TYPE_DDR3:
 		ret = nouveau_sddr3_calc(&ram->base);
 		break;
+	case NV_MEM_TYPE_GDDR3:
+		ret = nouveau_gddr3_calc(&ram->base);
+		break;
 	default:
 		ret = -ENOSYS;
 		break;
@@ -582,17 +633,26 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_block(fuc);
 	ram_nsec(fuc, 2000);
 
-
-	if (!next->bios.ramcfg_10_02_10)
-		ram_mask(fuc, 0x111100, 0x04020000, 0x04020000); /*XXX*/
+	if (!next->bios.ramcfg_10_02_10) {
+		if (ram->base.type == NV_MEM_TYPE_GDDR3)
+			ram_mask(fuc, 0x111100, 0x04020000, 0x00020000);
+		else
+			ram_mask(fuc, 0x111100, 0x04020000, 0x04020000);
+	}
 
 	/* If we're disabling the DLL, do it now */
 	switch (next->bios.ramcfg_10_DLLoff * ram->base.type) {
 	case NV_MEM_TYPE_DDR3:
 		nouveau_sddr3_dll_disable(fuc, ram->base.mr);
 		break;
+	case NV_MEM_TYPE_GDDR3:
+		nouveau_gddr3_dll_disable(fuc, ram->base.mr);
+		break;
 	}
 
+	if (fuc->r_gpioFBVREF.addr && next->bios.timing_10_ODT)
+		nva3_ram_fbvref(fuc, 0);
+
 	/* Brace RAM for impact */
 	ram_wr32(fuc, 0x1002d4, 0x00000001);
 	ram_wr32(fuc, 0x1002d0, 0x00000001);
@@ -728,6 +788,10 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 			}
 			unk714  |= 0x00000010;
 			break;
+		case NV_MEM_TYPE_GDDR3:
+			r111100 |= 0x30000000;
+			unk714  |= 0x00000020;
+			break;
 		default:
 			break;
 		}
@@ -753,11 +817,18 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_mask(fuc, 0x100718, 0xffffffff, unk718);
 	ram_mask(fuc, 0x111100, 0xffffffff, r111100);
 
+	if (fuc->r_gpioFBVREF.addr && !next->bios.timing_10_ODT)
+		nva3_ram_fbvref(fuc, 1);
+
 	/* Reset DLL */
 	if (!next->bios.ramcfg_10_DLLoff)
 		nouveau_sddr2_dll_reset(fuc);
 
-	ram_nsec(fuc, 14000);
+	if (ram->base.type == NV_MEM_TYPE_GDDR3) {
+		ram_nsec(fuc, 31000);
+	} else {
+		ram_nsec(fuc, 14000);
+	}
 
 	if (ram->base.type == NV_MEM_TYPE_DDR3) {
 		ram_wr32(fuc, 0x100264, 0x1);
@@ -859,8 +930,12 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_oclass *oclass, void *data, u32 datasize,
 	      struct nouveau_object **pobject)
 {
+	struct nouveau_fb *pfb = nouveau_fb(parent);
+	struct nouveau_gpio *gpio = nouveau_gpio(pfb);
+	struct dcb_gpio_func func;
 	struct nva3_ram *ram;
 	int ret, i;
+	u32 reg, shift;
 
 	ret = nv50_ram_create(parent, engine, oclass, &ram);
 	*pobject = nv_object(ram);
@@ -870,6 +945,7 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	switch (ram->base.type) {
 	case NV_MEM_TYPE_DDR2:
 	case NV_MEM_TYPE_DDR3:
+	case NV_MEM_TYPE_GDDR3:
 		ram->base.calc = nva3_ram_calc;
 		ram->base.prog = nva3_ram_prog;
 		ram->base.tidy = nva3_ram_tidy;
@@ -928,6 +1004,12 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		ram->fuc.r_mr[3] = ramfuc_reg(0x1002e4);
 	}
 
+	ret = gpio->find(gpio, 0, 0x2e, DCB_GPIO_UNUSED, &func);
+	if (ret == 0) {
+		nv50_gpio_location(func.line, &reg, &shift);
+		ram->fuc.r_gpioFBVREF = ramfuc_reg(reg);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c
index 1864fa9..2e30d5a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c
@@ -54,7 +54,7 @@ nv50_gpio_reset(struct nouveau_gpio *gpio, u8 match)
 	}
 }
 
-static int
+int
 nv50_gpio_location(int line, u32 *reg, u32 *shift)
 {
 	const u32 nv50_gpio_reg[4] = { 0xe104, 0xe108, 0xe280, 0xe284 };
-- 
1.9.3
