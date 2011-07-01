From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm/nouveau: set ptimer to count in ns on all
	chipset at the exception of nv40
Date: Fri,  1 Jul 2011 02:34:18 +0200
Message-ID: <1309480458-4494-1-git-send-email-martin.peres@free.fr>
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
Cc: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>

May cause problems with your laptop screen on nv17-nv40 even though it should
be very unlickely.

nv40 isn't impacted by the patch as we need further reverse engineering to
support it.

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile        |    3 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    4 ++
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    9 ++--
 drivers/gpu/drm/nouveau/nouveau_state.c |   17 ++++--
 drivers/gpu/drm/nouveau/nv04_pm.c       |    6 ++
 drivers/gpu/drm/nouveau/nv04_timer.c    |   66 ++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nv41_timer.c    |   90 +++++++++++++++++++++++++++++++
 7 files changed, 170 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nv41_timer.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index f65ade6..da45a66 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -32,7 +32,8 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
 	     nv50_calc.o \
 	     nv04_pm.o nv50_pm.o nva3_pm.o nvc0_pm.o \
 	     nv50_vram.o nvc0_vram.o \
-	     nv50_vm.o nvc0_vm.o
+	     nv50_vm.o nvc0_vm.o \
+	     nv41_timer.o
 
 nouveau-$(CONFIG_DRM_NOUVEAU_DEBUG) += nouveau_debugfs.o
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3bb9716..a2027f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1250,6 +1250,10 @@ extern int  nv04_timer_init(struct drm_device *);
 extern uint64_t nv04_timer_read(struct drm_device *);
 extern void nv04_timer_takedown(struct drm_device *);
 
+/* nv41_timer.c */
+extern int  nv41_timer_init(struct drm_device *);
+extern void nv41_timer_takedown(struct drm_device *);
+
 extern long nouveau_compat_ioctl(struct file *file, unsigned int cmd,
 				 unsigned long arg);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index f18cdfc..de5f265 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -164,10 +164,11 @@
 
 #define NV04_PTIMER_INTR_0                                 0x00009100
 #define NV04_PTIMER_INTR_EN_0                              0x00009140
-#define NV04_PTIMER_NUMERATOR                              0x00009200
-#define NV04_PTIMER_DENOMINATOR                            0x00009210
-#define NV04_PTIMER_TIME_0                                 0x00009400
-#define NV04_PTIMER_TIME_1                                 0x00009410
+#define NV04_PTIMER_CLOCK_DIV                              0x00009200
+#define NV04_PTIMER_CLOCK_MUL                              0x00009210
+#define NV41_PTIMER_CLOCK_SOURCE                           0x00009220
+#define NV04_PTIMER_TIME_LOW                               0x00009400
+#define NV04_PTIMER_TIME_HIGH                              0x00009410
 #define NV04_PTIMER_ALARM_0                                0x00009420
 
 #define NV04_PGRAPH_DEBUG_0                                0x00400080
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index f12a7ae..67b281d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -256,9 +256,14 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->instmem.flush		= nv04_instmem_flush;
 		engine->mc.init			= nv40_mc_init;
 		engine->mc.takedown		= nv40_mc_takedown;
-		engine->timer.init		= nv04_timer_init;
+		if (dev_priv->chipset == 0x40) {
+			engine->timer.init		= nv04_timer_init;
+			engine->timer.takedown		= nv04_timer_takedown;
+		} else {
+			engine->timer.init		= nv41_timer_init;
+			engine->timer.takedown		= nv41_timer_takedown;
+		}
 		engine->timer.read		= nv04_timer_read;
-		engine->timer.takedown		= nv04_timer_takedown;
 		engine->fb.init			= nv40_fb_init;
 		engine->fb.takedown		= nv40_fb_takedown;
 		engine->fb.init_tile_region	= nv30_fb_init_tile_region;
@@ -314,9 +319,9 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 			engine->instmem.flush	= nv84_instmem_flush;
 		engine->mc.init			= nv50_mc_init;
 		engine->mc.takedown		= nv50_mc_takedown;
-		engine->timer.init		= nv04_timer_init;
+		engine->timer.init		= nv41_timer_init;
 		engine->timer.read		= nv04_timer_read;
-		engine->timer.takedown		= nv04_timer_takedown;
+		engine->timer.takedown		= nv41_timer_takedown;
 		engine->fb.init			= nv50_fb_init;
 		engine->fb.takedown		= nv50_fb_takedown;
 		engine->fifo.channels		= 128;
@@ -389,9 +394,9 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->instmem.flush		= nv84_instmem_flush;
 		engine->mc.init			= nv50_mc_init;
 		engine->mc.takedown		= nv50_mc_takedown;
-		engine->timer.init		= nv04_timer_init;
+		engine->timer.init		= nv41_timer_init;
 		engine->timer.read		= nv04_timer_read;
-		engine->timer.takedown		= nv04_timer_takedown;
+		engine->timer.takedown		= nv41_timer_takedown;
 		engine->fb.init			= nvc0_fb_init;
 		engine->fb.takedown		= nvc0_fb_takedown;
 		engine->fifo.channels		= 128;
diff --git a/drivers/gpu/drm/nouveau/nv04_pm.c b/drivers/gpu/drm/nouveau/nv04_pm.c
index eb1c70d..ba5eb58 100644
--- a/drivers/gpu/drm/nouveau/nv04_pm.c
+++ b/drivers/gpu/drm/nouveau/nv04_pm.c
@@ -85,6 +85,12 @@ nv04_pm_clock_set(struct drm_device *dev, void *pre_state)
 		nv_mask(dev, 0x1002c0, 0, 1 << 8);
 	}
 
+	/* On nv04-40, PTIMER depends on NVPLL.
+	 * If we changed it, PTIMER must be set up again.
+	 */
+	if (dev_priv->card_type < NV_40 && reg == NV_PRAMDAC_NVPLL_COEFF)
+		nv04_timer_init(dev);
+
 	kfree(state);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv04_timer.c b/drivers/gpu/drm/nouveau/nv04_timer.c
index 1d09ddd..43004ce 100644
--- a/drivers/gpu/drm/nouveau/nv04_timer.c
+++ b/drivers/gpu/drm/nouveau/nv04_timer.c
@@ -3,23 +3,61 @@
 #include "nouveau_drv.h"
 #include "nouveau_drm.h"
 
+static void
+ptimer_ratio(u32 refclk, u32 *d, u32 *m)
+{
+	if (!m || !d)
+		return;
+
+	/* aim for 31.25MHz, which gives us nanosecond timestamps */
+	*m = refclk;
+	*d = 1000000 / 32;
+
+	/* reduce the ratio to accepted values */
+	while (((*m % 5) == 0) && ((*d % 5) == 0)) {
+		*m /= 5;
+		*d /= 5;
+	}
+
+	while (((*m % 2) == 0) && ((*d % 2) == 0)) {
+		*m /= 2;
+		*d /= 2;
+	}
+
+	while (*m > 0xffff || *d > 0xffff) {
+		*m >>= 1;
+		*d >>= 1;
+	}
+}
+
 int
 nv04_timer_init(struct drm_device *dev)
 {
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_engine *engine = &dev_priv->engine;
+	int core_clock, m, d;
+
 	nv_wr32(dev, NV04_PTIMER_INTR_EN_0, 0x00000000);
 	nv_wr32(dev, NV04_PTIMER_INTR_0, 0xFFFFFFFF);
 
-	/* Just use the pre-existing values when possible for now; these regs
-	 * are not written in nv (driver writer missed a /4 on the address), and
-	 * writing 8 and 3 to the correct regs breaks the timings on the LVDS
-	 * hardware sequencing microcode.
-	 * A correct solution (involving calculations with the GPU PLL) can
-	 * be done when kernel modesetting lands
-	 */
-	if (!nv_rd32(dev, NV04_PTIMER_NUMERATOR) ||
-				!nv_rd32(dev, NV04_PTIMER_DENOMINATOR)) {
-		nv_wr32(dev, NV04_PTIMER_NUMERATOR, 0x00000008);
-		nv_wr32(dev, NV04_PTIMER_DENOMINATOR, 0x00000003);
+	if (dev_priv->card_type < NV_40 || engine->pm.clock_get) {
+		core_clock = engine->pm.clock_get(dev, PLL_CORE);
+		ptimer_ratio(core_clock, &m, &d);
+
+		nv_wr32(dev, NV04_PTIMER_CLOCK_DIV, d);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_MUL, m);
+	} else {
+		/* As we can't depend on core clock, let's fallback to the old
+		 * behaviour until we can do better.
+		 */
+		if (!nv_rd32(dev, NV04_PTIMER_CLOCK_DIV) ||
+				!nv_rd32(dev, NV04_PTIMER_CLOCK_MUL)) {
+			nv_wr32(dev, NV04_PTIMER_CLOCK_DIV, 0x00000008);
+			nv_wr32(dev, NV04_PTIMER_CLOCK_MUL, 0x00000003);
+		}
+
+		NV_ERROR(dev,
+			"Failed to setup PTIMER, fallback to default values\n");
 	}
 
 	return 0;
@@ -35,12 +73,12 @@ nv04_timer_read(struct drm_device *dev)
 	 * advances between high and low dword reads and may corrupt the
 	 * result. Not confirmed.
 	 */
-	uint32_t high2 = nv_rd32(dev, NV04_PTIMER_TIME_1);
+	uint32_t high2 = nv_rd32(dev, NV04_PTIMER_TIME_HIGH);
 	uint32_t high1;
 	do {
 		high1 = high2;
-		low = nv_rd32(dev, NV04_PTIMER_TIME_0);
-		high2 = nv_rd32(dev, NV04_PTIMER_TIME_1);
+		low = nv_rd32(dev, NV04_PTIMER_TIME_LOW);
+		high2 = nv_rd32(dev, NV04_PTIMER_TIME_HIGH);
 	} while (high1 != high2);
 	return (((uint64_t)high2) << 32) | (uint64_t)low;
 }
diff --git a/drivers/gpu/drm/nouveau/nv41_timer.c b/drivers/gpu/drm/nouveau/nv41_timer.c
new file mode 100644
index 0000000..2233600
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv41_timer.c
@@ -0,0 +1,90 @@
+/*
+ * Copyright 2011 Martin Peres
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "drmP.h"
+#include "drm.h"
+#include "nouveau_drv.h"
+#include "nouveau_drm.h"
+
+int
+nv41_timer_init(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	unsigned int crystal;
+
+	nv_wr32(dev, NV04_PTIMER_INTR_EN_0, 0x00000000);
+	nv_wr32(dev, NV04_PTIMER_INTR_0, 0xFFFFFFFF);
+
+	crystal = (nv_rd32(dev, 0x101000) & 0x40) >> 6;
+
+	if ((dev_priv->chipset >= 0x17 && dev_priv->chipset < 0x20) ||
+		dev_priv->chipset > 0x25) {
+		crystal += (nv_rd32(dev, 0x101000) & 0x400000) >> 21;
+	}
+
+	/* Set PTIMER to count in ns.
+	 * As the last 5 bits are always 0, we only need to set PTIMER's
+	 * frequency to 1/32 GHz = 31.25 MHz.
+	 */
+	switch (crystal) {
+	case 0:
+		/* Crystal frequency is 13500000 Hz
+		 * 31.25 = 13.5 * 4 * 0xfa/0x288
+		 */
+		nv_wr32(dev, NV41_PTIMER_CLOCK_SOURCE, 0x00000003);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_DIV, 0x000000288);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_MUL, 0x000000fa);
+		break;
+	case 1:
+		/* Crystal frequency is 14318800 Hz
+		 * 31.25 = 14.3188 * 4 * 4c4b/8db5
+		 */
+		nv_wr32(dev, NV41_PTIMER_CLOCK_SOURCE, 0x00000003);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_DIV, 0x00008db5);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_MUL, 0x00004c4b);
+		break;
+	case 2:
+		/* Crystal frequency is 27000000 Hz
+		 * 31.25 = 27 * 3 * 0xfa/0x288
+		 */
+		nv_wr32(dev, NV41_PTIMER_CLOCK_SOURCE, 0x00000002);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_DIV, 0x00000288);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_MUL, 0x000000fa);
+		break;
+	case 3:
+		/* Crystal frequency is 25000000 Hz
+		 * 31.25 = 25 * 2 * 5 / 8
+		 */
+		nv_wr32(dev, NV41_PTIMER_CLOCK_SOURCE, 0x00000001);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_DIV, 0x00000008);
+		nv_wr32(dev, NV04_PTIMER_CLOCK_MUL, 0x00000005);
+		break;
+	}
+
+	return 0;
+}
+
+void
+nv41_timer_takedown(struct drm_device *dev)
+{
+}
-- 
1.7.6
