From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau/clk: Implement reclocking for
	NVAA/NVAC
Date: Sat,  9 Nov 2013 19:52:00 +0100
Message-ID: <1384023120-11958-3-git-send-email-rspliet@eclipso.eu>
References: <1384023120-11958-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384023120-11958-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile                   |   1 +
 drivers/gpu/drm/nouveau/core/engine/device/nv50.c  |   4 +-
 .../gpu/drm/nouveau/core/include/subdev/clock.h    |   4 +
 drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c   | 435 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.h   |  22 ++
 5 files changed, 464 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.h

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index edcf801..b3fa1ba 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -59,6 +59,7 @@ nouveau-y += core/subdev/clock/nv40.o
 nouveau-y += core/subdev/clock/nv50.o
 nouveau-y += core/subdev/clock/nv84.o
 nouveau-y += core/subdev/clock/nva3.o
+nouveau-y += core/subdev/clock/nvaa.o
 nouveau-y += core/subdev/clock/nvc0.o
 nouveau-y += core/subdev/clock/nve0.o
 nouveau-y += core/subdev/clock/pllnv04.o
diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv50.c b/drivers/gpu/drm/nouveau/core/engine/device/nv50.c
index db13982..db3fc7b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/nv50.c
@@ -283,7 +283,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] = &nv50_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] = &nv94_i2c_oclass;
-		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
+		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nvaa_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
 		device->oclass[NVDEV_SUBDEV_DEVINIT] = &nv50_devinit_oclass;
@@ -311,7 +311,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] = &nv50_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] = &nv94_i2c_oclass;
-		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
+		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nvaa_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
 		device->oclass[NVDEV_SUBDEV_DEVINIT] = &nv50_devinit_oclass;
diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
index e2675bc..8f4ced7 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
@@ -14,6 +14,9 @@ enum nv_clk_src {
 	nv_clk_src_hclk,
 	nv_clk_src_hclkm3,
 	nv_clk_src_hclkm3d2,
+	nv_clk_src_hclkm2d3, /* NVAA */
+	nv_clk_src_hclkm4, /* NVAA */
+	nv_clk_src_cclk, /* NVAA */
 
 	nv_clk_src_host,
 
@@ -127,6 +130,7 @@ extern struct nouveau_oclass nv04_clock_oclass;
 extern struct nouveau_oclass nv40_clock_oclass;
 extern struct nouveau_oclass *nv50_clock_oclass;
 extern struct nouveau_oclass *nv84_clock_oclass;
+extern struct nouveau_oclass *nvaa_clock_oclass;
 extern struct nouveau_oclass nva3_clock_oclass;
 extern struct nouveau_oclass nvc0_clock_oclass;
 extern struct nouveau_oclass nve0_clock_oclass;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c
new file mode 100644
index 0000000..60db9c1
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c
@@ -0,0 +1,435 @@
+/*
+ * Copyright 2012 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Ben Skeggs
+ */
+
+#include <engine/fifo.h>
+#include <subdev/bios.h>
+#include <subdev/bios/pll.h>
+#include <subdev/timer.h>
+
+#include "nv50.h"
+#include "nvaa.h"
+#include "pll.h"
+
+static u32
+read_div(struct nouveau_clock *clk)
+{
+	return nv_rd32(clk, 0x004600);
+}
+
+static u32
+read_pll(struct nouveau_clock *clk, u32 base)
+{
+	u32 ctrl = nv_rd32(clk, base + 0);
+	u32 coef = nv_rd32(clk, base + 4);
+	u32 ref = clk->read(clk, nv_clk_src_href);
+	u32 post_div = 0;
+	u32 clock = 0;
+	int N1, M1;
+
+	switch (base){
+	case 0x4020:
+		post_div = 1 << ((nv_rd32(clk, 0x4070) & 0x000f0000) >> 16);
+		break;
+	case 0x4028:
+		post_div = (nv_rd32(clk, 0x4040) & 0x000f0000) >> 16;
+		break;
+	default:
+		break;
+	}
+
+	N1 = (coef & 0x0000ff00) >> 8;
+	M1 = (coef & 0x000000ff);
+	if ((ctrl & 0x80000000) && M1) {
+		clock = ref * N1 / M1;
+		clock = clock / post_div;
+	}
+
+	return clock;
+}
+
+static int
+nvaa_clock_read(struct nouveau_clock *clk, enum nv_clk_src src)
+{
+	struct nvaa_clock_priv *priv = (void *)clk;
+	u32 mast = nv_rd32(clk, 0x00c054);
+	u32 P = 0;
+
+	switch (src) {
+	case nv_clk_src_crystal:
+		return nv_device(priv)->crystal;
+	case nv_clk_src_href:
+		return 100000; /* PCIE reference clock */
+	case nv_clk_src_hclkm4:
+		return clk->read(clk, nv_clk_src_href) * 4;
+	case nv_clk_src_hclkm2d3:
+		return clk->read(clk, nv_clk_src_href) * 2 / 3;
+	case nv_clk_src_host:
+		switch (mast & 0x000c0000) {
+		case 0x00000000: return clk->read(clk, nv_clk_src_hclkm2d3);
+		case 0x00040000: break;
+		case 0x00080000: return clk->read(clk, nv_clk_src_hclkm4);
+		case 0x000c0000: return clk->read(clk, nv_clk_src_cclk);
+		}
+		break;
+	case nv_clk_src_core:
+		P = (nv_rd32(clk, 0x004028) & 0x00070000) >> 16;
+
+		switch (mast & 0x00000003) {
+		case 0x00000000: return clk->read(clk, nv_clk_src_crystal) >> P;
+		case 0x00000001: return 0;
+		case 0x00000002: return clk->read(clk, nv_clk_src_hclkm4) >> P;
+		case 0x00000003: return read_pll(clk, 0x004028) >> P;
+		}
+		break;
+	case nv_clk_src_cclk:
+		if ((mast & 0x03000000) != 0x03000000)
+			return clk->read(clk, nv_clk_src_core);
+
+		if ((mast & 0x00000200) == 0x00000000)
+			return clk->read(clk, nv_clk_src_core);
+
+		switch (mast & 0x00000c00) {
+		case 0x00000000: return clk->read(clk, nv_clk_src_href);
+		case 0x00000400: return clk->read(clk, nv_clk_src_hclkm4);
+		case 0x00000800: return clk->read(clk, nv_clk_src_hclkm2d3);
+		default: return 0;
+		}
+	case nv_clk_src_shader:
+		P = (nv_rd32(clk, 0x004020) & 0x00070000) >> 16;
+		switch (mast & 0x00000030) {
+		case 0x00000000:
+			if (mast & 0x00000040)
+				return clk->read(clk, nv_clk_src_href) >> P;
+			return clk->read(clk, nv_clk_src_crystal) >> P;
+		case 0x00000010: break;
+		case 0x00000020: return read_pll(clk, 0x004028) >> P;
+		case 0x00000030: return read_pll(clk, 0x004020) >> P;
+		}
+		break;
+	case nv_clk_src_mem:
+		return 0;
+		break;
+	case nv_clk_src_vdec:
+		P = (read_div(clk) & 0x00000700) >> 8;
+
+		switch (mast & 0x00400000) {
+		case 0x00400000:
+			return clk->read(clk, nv_clk_src_core) >> P;
+			break;
+		default:
+			return 500000 >> P;
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	nv_debug(priv, "unknown clock source %d 0x%08x\n", src, mast);
+	return 0;
+}
+
+static u32
+calc_pll(struct nvaa_clock_priv *priv, u32 reg,
+	 u32 clock, int *N, int *M, int *P)
+{
+	struct nouveau_bios *bios = nouveau_bios(priv);
+	struct nvbios_pll pll;
+	struct nouveau_clock *clk = &priv->base;
+	int ret;
+
+	ret = nvbios_pll_parse(bios, reg, &pll);
+	if (ret)
+		return 0;
+
+	pll.vco2.max_freq = 0;
+	pll.refclk = clk->read(clk, nv_clk_src_href);
+	if (!pll.refclk)
+		return 0;
+
+	return nv04_pll_calc(nv_subdev(priv), &pll, clock, N, M, NULL, NULL, P);
+}
+
+static inline u32
+calc_P(u32 src, u32 target, int *div)
+{
+	u32 clk0 = src, clk1 = src;
+	for (*div = 0; *div <= 7; (*div)++) {
+		if (clk0 <= target) {
+			clk1 = clk0 << (*div ? 1 : 0);
+			break;
+		}
+		clk0 >>= 1;
+	}
+
+	if (target - clk0 <= clk1 - target)
+		return clk0;
+	(*div)--;
+	return clk1;
+}
+
+static int
+nvaa_clock_calc(struct nouveau_clock *clk, struct nouveau_cstate *cstate)
+{
+	struct nvaa_clock_priv *priv = (void *)clk;
+	const int shader = cstate->domain[nv_clk_src_shader];
+	const int core = cstate->domain[nv_clk_src_core];
+	const int vdec = cstate->domain[nv_clk_src_vdec];
+	u32 out = 0, clock = 0, divs = 0;
+	int N, M, P1, P2 = 0;
+
+	/* cclk: find suitable source, disable PLL if we can */
+	if (core < clk->read(clk, nv_clk_src_hclkm4))
+		out = calc_P(clk->read(clk, nv_clk_src_hclkm4), core, &divs);
+
+	/* Calculate clock * 2, so shader clock can use it too */
+	clock = calc_pll(priv, 0x4028, (core << 1), &N, &M, &P1);
+
+	if (abs(core - out) <=
+	    abs(core - (clock >> 1))) {
+		priv->csrc = nv_clk_src_hclkm4;
+		priv->cctrl = divs << 16;
+	} else {
+		/* NVCTRL is actually used _after_ NVPOST, and after what we
+		 * call NVPLL. To make matters worse, NVPOST is an integer
+		 * divider instead of a right-shift number. */
+		if(P1 > 2) {
+			P2 = P1 - 2;
+			P1 = 2;
+		}
+
+		priv->csrc = nv_clk_src_core;
+		priv->ccoef = (N << 8) | M;
+
+		priv->cctrl = (P2 + 1) << 16;
+		priv->cpost = (1 << P1) << 16;
+	}
+
+	/* sclk: nvpll + divisor, href or spll */
+	out = 0;
+	if (shader == clk->read(clk, nv_clk_src_href)) {
+		priv->ssrc = nv_clk_src_href;
+	} else {
+		clock = calc_pll(priv, 0x4020, shader, &N, &M, &P1);
+		if (priv->csrc == nv_clk_src_core) {
+			out = calc_P((core << 1), shader, &divs);
+		}
+
+		if (abs(shader - out) <=
+		    abs(shader - clock) &&
+		   (divs + P2) <= 7) {
+			priv->ssrc = nv_clk_src_core;
+			priv->sctrl = (divs + P2) << 16;
+		} else {
+			priv->ssrc = nv_clk_src_shader;
+			priv->scoef = (N << 8) | M;
+			priv->sctrl = P1 << 16;
+		}
+	}
+
+	/* vclk */
+	out = calc_P(core, vdec, &divs);
+	clock = calc_P(500000, vdec, &P1);
+	if(abs(vdec - out) <=
+	   abs(vdec - clock)) {
+		priv->vsrc = nv_clk_src_cclk;
+		priv->vdiv = divs << 16;
+	} else {
+		priv->vsrc = nv_clk_src_vdec;
+		priv->vdiv = P1 << 16;
+	}
+
+	/* Print strategy! */
+	nv_debug(priv, "nvpll: %08x %08x %08x\n",
+			priv->ccoef, priv->cpost, priv->cctrl);
+	nv_debug(priv, " spll: %08x %08x %08x\n",
+			priv->scoef, priv->spost, priv->sctrl);
+	nv_debug(priv, " vdiv: %08x\n", priv->vdiv);
+	if (priv->csrc == nv_clk_src_hclkm4)
+		nv_debug(priv, "core: hrefm4\n");
+	else
+		nv_debug(priv, "core: nvpll\n");
+
+	if (priv->ssrc == nv_clk_src_hclkm4)
+		nv_debug(priv, "shader: hrefm4\n");
+	else if (priv->ssrc == nv_clk_src_core)
+		nv_debug(priv, "shader: nvpll\n");
+	else
+		nv_debug(priv, "shader: spll\n");
+
+	if (priv->vsrc == nv_clk_src_hclkm4)
+		nv_debug(priv, "vdec: 500MHz\n");
+	else
+		nv_debug(priv, "vdec: core\n");
+
+	return 0;
+}
+
+static int
+nvaa_clock_prog(struct nouveau_clock *clk)
+{
+	struct nvaa_clock_priv *priv = (void *)clk;
+	struct nouveau_fifo *pfifo = nouveau_fifo(clk);
+	unsigned long flags;
+	u32 pllmask = 0, mast, ptherm_gate;
+	int ret = -EBUSY;
+
+	/* halt and idle execution engines */
+	ptherm_gate = nv_mask(clk, 0x20060, 0x00070000, 0x00000000);
+	nv_mask(clk, 0x002504, 0x00000001, 0x00000001);
+	/* Wait until the interrupt handler is finished */
+	if (!nv_wait(clk, 0x000100, 0xffffffff, 0x00000000))
+		goto resume;
+
+	pfifo->pause(pfifo, &flags);
+	if (!nv_wait(clk, 0x002504, 0x00000010, 0x00000010))
+		goto resume;
+	if (!nv_wait(clk, 0x00251c, 0x0000003f, 0x0000003f))
+		goto resume;
+
+	/* First switch to safe clocks: href */
+	mast = nv_mask(clk, 0xc054, 0x03400e70, 0x03400640);
+	mast &= ~0x00400e73;
+	mast |= 0x03000000;
+
+	switch (priv->csrc) {
+	case nv_clk_src_hclkm4:
+		nv_mask(clk, 0x4028, 0x00070000, priv->cctrl);
+		mast |= 0x00000002;
+		break;
+	case nv_clk_src_core:
+		nv_wr32(clk, 0x402c, priv->ccoef);
+		nv_wr32(clk, 0x4028, 0x80000000 | priv->cctrl);
+		nv_wr32(clk, 0x4040, priv->cpost);
+		pllmask |= (0x3 << 8);
+		mast |= 0x00000003;
+		break;
+	default:
+		nv_warn(priv,"Reclocking failed: unknown core clock\n");
+		goto resume;
+	}
+
+	switch (priv->ssrc) {
+	case nv_clk_src_href:
+		nv_mask(clk, 0x4020, 0x00070000, 0x00000000);
+		/* mast |= 0x00000000; */
+		break;
+	case nv_clk_src_core:
+		nv_mask(clk, 0x4020, 0x00070000, priv->sctrl);
+		mast |= 0x00000020;
+		break;
+	case nv_clk_src_shader:
+		nv_wr32(clk, 0x4024, priv->scoef);
+		nv_wr32(clk, 0x4020, 0x80000000 | priv->sctrl);
+		nv_wr32(clk, 0x4070, priv->spost);
+		pllmask |= (0x3 << 12);
+		mast |= 0x00000030;
+		break;
+	default:
+		nv_warn(priv,"Reclocking failed: unknown sclk clock\n");
+		goto resume;
+	}
+
+	if (!nv_wait(clk, 0x004080, pllmask, pllmask)) {
+		nv_warn(priv,"Reclocking failed: unstable PLLs\n");
+		goto resume;
+	}
+
+	switch (priv->vsrc) {
+	case nv_clk_src_cclk:
+		mast |= 0x00400000;
+	default:
+		nv_wr32(clk, 0x4600, priv->vdiv);
+	}
+
+	nv_wr32(clk, 0xc054, mast);
+	ret = 0;
+
+resume:
+	pfifo->start(pfifo, &flags);
+	nv_mask(clk, 0x002504, 0x00000001, 0x00000000);
+	nv_wr32(clk, 0x20060, ptherm_gate);
+
+	/* Disable some PLLs and dividers when unused */
+	if (priv->csrc != nv_clk_src_core) {
+		nv_wr32(clk, 0x4040, 0x00000000);
+		nv_mask(clk, 0x4028, 0x80000000, 0x00000000);
+	}
+
+	if (priv->ssrc != nv_clk_src_shader) {
+		nv_wr32(clk, 0x4070, 0x00000000);
+		nv_mask(clk, 0x4020, 0x80000000, 0x00000000);
+	}
+
+	return ret;
+}
+
+static void
+nvaa_clock_tidy(struct nouveau_clock *clk)
+{
+}
+
+int
+nvaa_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+		struct nouveau_oclass *oclass, void *data, u32 size,
+		struct nouveau_object **pobject)
+{
+	struct nv50_clock_oclass *pclass = (void *)oclass;
+	struct nvaa_clock_priv *priv;
+	int ret;
+
+	ret = nouveau_clock_create(parent, engine, oclass, pclass->domains,
+				  &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	priv->base.read = nvaa_clock_read;
+	priv->base.calc = nvaa_clock_calc;
+	priv->base.prog = nvaa_clock_prog;
+	priv->base.tidy = nvaa_clock_tidy;
+	return 0;
+}
+
+static struct nouveau_clocks
+nvaa_domains[] = {
+	{ nv_clk_src_crystal, 0xff },
+	{ nv_clk_src_href   , 0xff },
+	{ nv_clk_src_core   , 0xff, 0, "core", 1000 },
+	{ nv_clk_src_shader , 0xff, 0, "shader", 1000 },
+	{ nv_clk_src_vdec   , 0xff, 0, "vdec", 1000 },
+	{ nv_clk_src_max }
+};
+
+struct nouveau_oclass *
+nvaa_clock_oclass = &(struct nv50_clock_oclass) {
+	.base.handle = NV_SUBDEV(CLOCK, 0xaa),
+	.base.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nvaa_clock_ctor,
+		.dtor = _nouveau_clock_dtor,
+		.init = _nouveau_clock_init,
+		.fini = _nouveau_clock_fini,
+	},
+	.domains = nvaa_domains,
+}.base;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.h b/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.h
new file mode 100644
index 0000000..619bfbd
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.h
@@ -0,0 +1,22 @@
+#ifndef __NVKM_CLK_NVAA_H__
+#define __NVKM_CLK_NVAA_H__
+
+#include <subdev/bus.h>
+#include <subdev/bus/hwsq.h>
+#include <subdev/clock.h>
+
+struct nvaa_clock_priv {
+	struct nouveau_clock base;
+	enum nv_clk_src csrc, ssrc, vsrc;
+	//u32 ctrl;
+	u32 cctrl, sctrl;
+	u32 ccoef, scoef;
+	u32 cpost, spost;
+	u32 vdiv;
+};
+
+int  nvaa_clock_ctor(struct nouveau_object *, struct nouveau_object *,
+		     struct nouveau_oclass *, void *, u32,
+		     struct nouveau_object **);
+
+#endif
-- 
1.8.3.1
