From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau/nv50: reclock memory using PMS on
	nv50
Date: Sat, 30 Apr 2011 02:17:13 +0200
Message-ID: <1304122633-21621-3-git-send-email-martin.peres@free.fr>
References: <1304015622-5910-1-git-send-email-martin.peres@free.fr>
	<1304122633-21621-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1304122633-21621-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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
Cc: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>

v2: Reclock memory after reclocking the other engines

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c  |   11 +--
 drivers/gpu/drm/nouveau/nouveau_pms.h |   98 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_pm.c     |  153 ++++++++++++++++++++++++++++++---
 3 files changed, 242 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_pms.h

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 88f58b1..44d01bb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -45,10 +45,6 @@ nouveau_pm_clock_set(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 	if (khz == 0)
 		return 0;
 
-	/* Do no reclock the memory if the frequencies didn't change */
-	if (id == PLL_MEMORY && pm->cur->memory == khz)
-		return 0;
-
 	pre_state = pm->clock_pre(dev, perflvl, id, khz);
 	if (IS_ERR(pre_state))
 		return PTR_ERR(pre_state);
@@ -100,7 +96,6 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 
 	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
 	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
-	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
 
 	/* Decrease the voltage if needed*/
@@ -110,11 +105,13 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 	/* Wait for PLLs to stabilize */
 	udelay(100);
 
+	pm->unpause(dev);
+
+	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
+
 	pm->cur = perflvl;
 	ret = 0;
 
-	pm->unpause(dev);
-
 	NV_DEBUG(dev, "Reclocking took %lluns\n",
 		 (nv04_timer_read(dev) - start));
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_pms.h b/drivers/gpu/drm/nouveau/nouveau_pms.h
new file mode 100644
index 0000000..d7a445b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_pms.h
@@ -0,0 +1,98 @@
+/*
+ * Copyright 2010 Red Hat Inc.
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
+#ifndef __NOUVEAU_PMS_H__
+#define __NOUVEAU_PMS_H__
+
+struct pms_ucode {
+	u8 data[256];
+	union {
+		u8  *u08;
+		u16 *u16;
+		u32 *u32;
+	} ptr;
+	u16 len;
+
+	u32 reg;
+	u32 val;
+};
+
+static inline void
+pms_init(struct pms_ucode *pms)
+{
+	pms->ptr.u08 = pms->data;
+	pms->reg = 0xffffffff;
+	pms->val = 0xffffffff;
+}
+
+static inline void
+pms_fini(struct pms_ucode *pms)
+{
+	do {
+		*pms->ptr.u08++ = 0x7f;
+		pms->len = pms->ptr.u08 - pms->data;
+	} while (pms->len & 3);
+	pms->ptr.u08 = pms->data;
+}
+
+static inline void
+pms_unkn(struct pms_ucode *pms, u8 v0)
+{
+	*pms->ptr.u08++ = v0;
+}
+
+static inline void
+pms_op5f(struct pms_ucode *pms, u8 v0, u8 v1)
+{
+	*pms->ptr.u08++ = 0x5f;
+	*pms->ptr.u08++ = v0;
+	*pms->ptr.u08++ = v1;
+}
+
+static inline void
+pms_wr32(struct pms_ucode *pms, u32 reg, u32 val)
+{
+	if (val != pms->val) {
+		if ((val & 0xffff0000) == (pms->val & 0xffff0000)) {
+			*pms->ptr.u08++ = 0x42;
+			*pms->ptr.u16++ = (val & 0x0000ffff);
+		} else {
+			*pms->ptr.u08++ = 0xe2;
+			*pms->ptr.u32++ = val;
+		}
+
+		pms->val = val;
+	}
+
+	if ((reg & 0xffff0000) == (pms->reg & 0xffff0000)) {
+		*pms->ptr.u08++ = 0x40;
+		*pms->ptr.u16++ = (reg & 0x0000ffff);
+	} else {
+		*pms->ptr.u08++ = 0xe0;
+		*pms->ptr.u32++ = reg;
+	}
+	pms->reg = reg;
+}
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 4dd2d76..9b81f03 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -26,9 +26,11 @@
 #include "nouveau_drv.h"
 #include "nouveau_bios.h"
 #include "nouveau_pm.h"
+#include "nouveau_pms.h"
 
 struct nv50_pm_state {
 	struct nouveau_pm_level *perflvl;
+	struct pms_ucode ucode;
 	struct pll_lims pll;
 	enum pll_types type;
 	int N, M, P;
@@ -73,14 +75,20 @@ void *
 nv50_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 		  u32 id, int khz)
 {
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv50_pm_state *state;
-	int dummy, ret;
+	struct pms_ucode *pms;
+	u32 reg0_old, reg0_new;
+	u32 crtc_mask;
+	u32 reg_c040;
+	int ret, dummy, i;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 	state->type = id;
 	state->perflvl = perflvl;
+	pms = &state->ucode;
 
 	ret = get_pll_limits(dev, id, &state->pll);
 	if (ret < 0) {
@@ -95,20 +103,88 @@ nv50_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 		return ERR_PTR(ret);
 	}
 
+	reg0_old = nv_rd32(dev, state->pll.reg + 0);
+	reg0_new = 0x80000000 | (state->P << 16) | (reg0_old & 0xfff8ffff);
+
+	reg_c040 = nv_rd32(dev, 0xc040);
+
+	crtc_mask = 0;
+	for (i = 0; i < 2; i++) {
+		if (nv_rd32(dev, NV50_PDISPLAY_CRTC_C(i, CLOCK)))
+			crtc_mask |= (1 << i);
+	}
+
+	pms_init(pms);
+
+	switch (state->type) {
+	case PLL_MEMORY:
+		/* Wait for vblank on all the CRTCs */
+		if (crtc_mask) {
+			pms_op5f(pms, crtc_mask, 0x00);
+			pms_op5f(pms, crtc_mask, 0x01);
+		}
+
+		pms_wr32(pms, 0x002504, 0x00000001);
+		pms_unkn(pms, 0x06); /* unknown */
+		pms_unkn(pms, 0xb0); /* Disable bus access */
+		pms_op5f(pms, 0x00, 0x01);
+
+		pms_wr32(pms, 0x1002d4, 0x00000001);
+		pms_wr32(pms, 0x1002d0, 0x00000001);
+
+		pms_wr32(pms, 0x100210, 0x00000000);
+		pms_wr32(pms, 0x1002dc, 0x00000001);
+		pms_wr32(pms, state->pll.reg + 0, reg0_old);
+		pms_wr32(pms, state->pll.reg + 4, (state->N << 8) | state->M);
+
+		pms_wr32(pms, state->pll.reg + 0, reg0_new);
+		pms_wr32(pms, 0x1002dc, 0x00000000);
+		pms_wr32(pms, 0x100210, 0x80000000);
+		pms_unkn(pms, 0x07); /* unknown */
+
+		pms_unkn(pms, 0x0b);
+		pms_unkn(pms, 0xd0); /* Enable bus access again */
+		pms_op5f(pms, 0x00, 0x01);
+		pms_wr32(pms, 0x002504, 0x00000000);
+		break;
+	default:
+		pms_unkn(pms, 0xb0); /* Disable bus access */
+
+		pms_wr32(pms, 0xc040,
+			(reg_c040 & ~(1 << 5 | 1 << 4)) | (1 << 20));
+		pms_wr32(pms, state->pll.reg + 0, reg0_new);
+		pms_wr32(pms, state->pll.reg + 4, (state->N << 8) | state->M);
+		pms_unkn(pms, 0x0e);
+
+		pms_wr32(pms, 0xc040, reg_c040);
+		pms_wr32(pms, 0xc040, 0x10);
+
+		pms_wr32(pms, 0xc040, reg_c040);
+
+		pms_unkn(pms, 0xd0); /* Enable bus access again */
+		break;
+	}
+	pms_fini(pms);
+
 	return state;
 }
 
 void
 nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 {
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv50_pm_state *state = pre_state;
 	struct nouveau_pm_level *perflvl = state->perflvl;
-	u32 reg = state->pll.reg, tmp;
+	struct pms_ucode *pms = &state->ucode;
 	struct bit_entry BIT_M;
+	u32 pbus1098, r100b0c, r619f00;
+	u32 pms_data, pms_kick;
 	u16 script;
+	u32 reg = state->pll.reg, tmp;
 	int N = state->N;
 	int M = state->M;
 	int P = state->P;
+	int i;
 
 	if (state->type == PLL_MEMORY && perflvl->memscript &&
 	    bit_table(dev, 'M', &BIT_M) == 0 &&
@@ -126,20 +202,71 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 		nouveau_bios_run_init_table(dev, perflvl->memscript, NULL);
 	}
 
+	/* only use PMS for changing the memory clocks */
 	if (state->type == PLL_MEMORY) {
-		nv_wr32(dev, 0x100210, 0);
-		nv_wr32(dev, 0x1002dc, 1);
-	}
-	/* TODO: Tweek 0x4700 before reclocking UNK05 */
-
-	tmp  = nv_rd32(dev, reg + 0) & 0xfff8ffff;
-	tmp |= 0x80000000 | (P << 16);
-	nv_wr32(dev, reg + 0, tmp);
-	nv_wr32(dev, reg + 4, (N << 8) | M);
+		if (dev_priv->chipset < 0x90) {
+			pms_data = 0x001400;
+			pms_kick = 0x00000003;
+		} else {
+			pms_data = 0x080000;
+			pms_kick = 0x00000001;
+		}
 
-	if (state->type == PLL_MEMORY) {
-		nv_wr32(dev, 0x1002dc, 0);
-		nv_wr32(dev, 0x100210, 0x80000000);
+		/* upload ucode */
+		pbus1098 = nv_mask(dev, 0x001098, 0x00000008, 0x00000000);
+		nv_wr32(dev, 0x001304, 0x00000000);
+		for (i = 0; i < pms->len / 4; i++)
+			nv_wr32(dev, pms_data + (i * 4), pms->ptr.u32[i]);
+		nv_wr32(dev, 0x001098, pbus1098 | 0x18);
+
+		nv_mask(dev, 0x616308, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x616b08, 0x00000000, 0x00000010);
+
+		/* and run it! there's some pre and post script operations that
+		* nvidia do too, need to figure those out
+		*/
+		nv_mask(dev, 0x100200, 0x00000800, 0x00000000);
+		r100b0c = nv_mask(dev, 0x100b0c, 0x000000ff, 0x00000012);
+		r619f00 = nv_mask(dev, 0x619f00, 0x00000008, 0x00000000);
+		nv_wr32(dev, 0x00130c, pms_kick);
+		if (!nv_wait(dev, 0x001308, 0x00000100, 0x00000000)) {
+			NV_ERROR(dev, "pms ucode exec timed out\n");
+			NV_ERROR(dev, "0x001308: 0x%08x\n",
+				nv_rd32(dev, 0x001308));
+			for (i = 0; i < pms->len / 4; i++) {
+				NV_ERROR(dev, "0x%06x: 0x%08x\n",
+					0x1400 + (i * 4),
+					nv_rd32(dev, 0x001400 + (i * 4)));
+			}
+		}
+		nv_wr32(dev, 0x619f00, r619f00);
+		nv_wr32(dev, 0x100b0c, r100b0c);
+		nv_mask(dev, 0x616308, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x616b08, 0x00000000, 0x00000010);
+
+		/*if (perflvl->id == 0) {
+			nv_wr32(dev, 0x100228, 0x00020102);
+			nv_wr32(dev, 0x100230, 0x28000808);
+			nv_wr32(dev, 0x100234, 0x06020702);
+		} else if (perflvl->id == 1) {
+			nv_wr32(dev, 0x100228, 0x00040305);
+			nv_wr32(dev, 0x100230, 0x28000808);
+			nv_wr32(dev, 0x100234, 0x11050905);
+		}else if (perflvl->id == 2) {
+			nv_wr32(dev, 0x100228, 0x0008080c);
+			nv_wr32(dev, 0x100230, 0x28000808);
+			nv_wr32(dev, 0x100234, 0x270c0c09);
+		}*/
+
+		nv_mask(dev, 0x100200, 0x00000000, 0x00000800);
+
+	} else {
+		/* TODO: Tweek 0x4700 before reclocking UNK05 */
+
+		tmp  = nv_rd32(dev, reg + 0) & 0xfff8ffff;
+		tmp |= 0x80000000 | (P << 16);
+		nv_wr32(dev, reg + 0, tmp);
+		nv_wr32(dev, reg + 4, (N << 8) | M);
 	}
 
 	kfree(state);
-- 
1.7.5
