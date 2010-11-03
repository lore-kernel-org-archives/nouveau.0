From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [To developers and hardcore NV50+ users] Experimental
 patch to get safer clock changes
Date: Wed, 03 Nov 2010 02:32:39 +0100
Message-ID: <4CD0BBB7.9090003@free.fr>
References: <4CA3223F.9030503@free.fr>	<4CA4C57E.5090400@free.fr>	<4CAD2383.50907@free.fr>	<4CADE982.7080309@free.fr>
	<4CC9A605.5050700@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060202050607010508080302"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CC9A605.5050700-GANU6spQydw@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------060202050607010508080302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

Please do not merge this patch. I'm just asking people with nv50+ to try 
this very experimental patch. Hopefully, the results are good and I can 
start rework the patch to make it run faster and, hopefully, flicker-free.

This patch introduces Ben Skeggs's PMS-based clock changing code that I 
reworked a little. It also introduces the use of the 0xc040 register 
(I'm still REing it, it seems like a PLL supervisor, it is really weird 
but gives dir1212's nv92 way more stability).
This should run fine on nv84 to nv94 but,I have no idea on how it will 
perform on later cards.

To test this patch, you should edit and use the (very small) script 
"test_mode_changes.sh" that is basically changing the clocks every 100ms.
Launch it and then, please do GPU intensive tasks like playing games. If 
it crashes, that's a fail.
I personally can leave my computer in openarena for minutes without 
crashes nor nasty messages in dmesg. I then get bored continue hacking.

So, please report success or failure accompanied with the mmiotrace of 
your card like explained here: 
http://github.com/pathscale/pscnv/wiki/pm_mmiotrace) in the case it fails.

Wish you luck :)

As for what is on my todo list:
  - I may generate a big PMS script to handle all the clock changes. The 
problem is that it takes a lot of time to execute scripts on my card and 
I really want clock changes to happen fast to lower the performance hit 
of the reclock (see the third item).
- If this patch works, I'll rework and send it for inclusion.
- I'll try working on nv40 a bit (see what I can backport).
- Try reverse engineering performance counters so as the clock can be 
changed according to the card's current load. This is supposed to be 
hard (IIRC), so, It should take me a while.

Kindly,

Martin

PS: I really don't want everyone to jump on this patch and try it. Only 
people actually aware of my work and understanding what are the changes 
I made should test this patch. I really don't want dozens of people 
testing this, it is not ready for people other than nouveau devs.

--------------060202050607010508080302
Content-Type: text/x-patch;
 name="0001-Pause-the-card-before-reclocking-and-use-PMS-to-recl.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Pause-the-card-before-reclocking-and-use-PMS-to-recl.pa";
 filename*1="tch"

From 61a256a6fa171c7c310a5abedd7cf178c8403f8b Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Wed, 3 Nov 2010 02:49:52 +0100
Subject: [PATCH] Pause the card before reclocking and use PMS to reclock the memory clocks.

This is a very experimental patch. Please test with caution. This should work on nv84 -> nv94 (included), I don't know how it is supposed to behave on later cards.

How to test? Well, make a script (or use the one I attached to the mail) to change the clocks every 100ms, launch it and then go play open arena or anything else that is GPU intensive.
Please report every success or failure stories.

Pitfalls: Changing the clocks will result in a garbelled screen for a few ms. This is really anoying but shouldn't impact the card's stability.

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   10 ++
 drivers/gpu/drm/nouveau/nouveau_pm.c    |   60 +++++++++++-
 drivers/gpu/drm/nouveau/nouveau_pms.h   |   98 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    3 +
 drivers/gpu/drm/nouveau/nouveau_state.c |   35 +++++++-
 drivers/gpu/drm/nouveau/nv50_fifo.c     |   18 ++++
 drivers/gpu/drm/nouveau/nv50_graph.c    |   46 +++++++++
 drivers/gpu/drm/nouveau/nv50_pm.c       |  164 +++++++++++++++++++++++++++----
 8 files changed, 412 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_pms.h

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index fc162c2..6f3b81b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -338,6 +338,9 @@ struct nouveau_fifo_engine {
 	int  (*load_context)(struct nouveau_channel *);
 	int  (*unload_context)(struct drm_device *);
 	void (*tlb_flush)(struct drm_device *dev);
+
+	int  (*pause)(struct drm_device *);
+	void  (*unpause)(struct drm_device *);
 };
 
 struct nouveau_pgraph_engine {
@@ -361,6 +364,9 @@ struct nouveau_pgraph_engine {
 	void (*tlb_flush)(struct drm_device *dev);
 
 	void (*set_tile_region)(struct drm_device *dev, int i);
+
+	int  (*pause)(struct drm_device *);
+	void  (*unpause)(struct drm_device *);
 };
 
 struct nouveau_display_engine {
@@ -1076,6 +1082,8 @@ extern void nv50_fifo_destroy_context(struct nouveau_channel *);
 extern int  nv50_fifo_load_context(struct nouveau_channel *);
 extern int  nv50_fifo_unload_context(struct drm_device *);
 extern void nv50_fifo_tlb_flush(struct drm_device *dev);
+extern int  nv50_fifo_pause(struct drm_device *);
+extern void  nv50_fifo_unpause(struct drm_device *);
 
 /* nvc0_fifo.c */
 extern int  nvc0_fifo_init(struct drm_device *);
@@ -1148,6 +1156,8 @@ extern void nv50_graph_context_switch(struct drm_device *);
 extern int  nv50_grctx_init(struct nouveau_grctx *);
 extern void nv50_graph_tlb_flush(struct drm_device *dev);
 extern void nv86_graph_tlb_flush(struct drm_device *dev);
+extern int nv50_graph_pause(struct drm_device *dev);
+extern void nv50_graph_unpause(struct drm_device *dev);
 
 /* nvc0_graph.c */
 extern int  nvc0_graph_init(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 8ef1d5b..268a6d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -59,6 +59,7 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	uint32_t status, rc040;
 	int ret;
 
 	if (perflvl == pm->cur)
@@ -72,13 +73,66 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 		}
 	}
 
+	/* Disable interrupts */
+	nv_wr32(dev, 0x140, 0);
+
+	/* Pause the engines, if possible */
+	if (dev_priv->engine.fifo.pause(dev)) {
+		ret = -EIO;
+		goto out;
+	}
+	if (dev_priv->engine.graph.pause(dev)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	/* Disable the PFIFO cache pulling */
+	status = nv_rd32(dev, 0x003250);
+	nv_wr32(dev, 0x003250, status&0xfffffffe);
+
+	/* Disable the PFIFO cache dma push */
+	status = nv_rd32(dev, 0x003220);
+	nv_wr32(dev, 0x003220, status&0xfffffffe);
+
+	/* Save the PLL supervisor state */
+	rc040 = nv_rd32(dev, 0xc040);
+
+	/* TODO: Wait for vblank */
+
+	/* Change the clocks */
+	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
 	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
-	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
 
+	/* Wait for PLLs to stabilize */
+	udelay(100);
+
+	/* Restaure the PLL supervisor state */
+	nv_wr32(dev, 0xc040, rc040);
+	nv_wr32(dev, 0xc040, 0x10);
+	nv_wr32(dev, 0xc040, rc040);
+
 	pm->cur = perflvl;
-	return 0;
+	ret = 0;
+
+out:
+	/* Re-enable the PFIFO cache dma push */
+	status = nv_rd32(dev, 0x003220);
+	nv_wr32(dev, 0x003220, status|0x1);
+
+	/* Re-enable the PFIFO cache pulling */
+	status = nv_rd32(dev, 0x003250);
+	nv_wr32(dev, 0x003250, status|0x1);
+
+	/* Un-pause the engines */
+	dev_priv->engine.fifo.unpause(dev);
+	dev_priv->engine.graph.unpause(dev);
+
+	/* Re-enable interrupts */
+	nv_wr32(dev, 0x140, 1);
+
+	return ret;
 }
 
 static int
@@ -112,7 +166,7 @@ nouveau_pm_profile_set(struct drm_device *dev, const char *profile)
 			return -EINVAL;
 	}
 
-	NV_INFO(dev, "setting performance level: %s\n", profile);
+	NV_INFO(dev, "setting performance level: %s", profile);
 	return nouveau_pm_perflvl_set(dev, perflvl);
 }
 
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index b6384d3..951c268 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -700,8 +700,11 @@
 #define NV50_PROM__ESIZE                                       0x10000
 
 #define NV50_PGRAPH                                         0x00400000
+#define NV50_PGRAPH_CONTROL                                 0x00400500
+#define NV50_PGRAPH_STATUS                                  0x00400700
 #define NV50_PGRAPH__LEN                                           0x1
 #define NV50_PGRAPH__ESIZE                                     0x10000
+#define NV50_PFIFO_FREEZE                                       0x2504
 
 #define NV50_PDISPLAY                                                0x00610000
 #define NV50_PDISPLAY_OBJECTS                                        0x00610010
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 1a7a50c..a41a028 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -42,6 +42,12 @@
 static void nouveau_stub_takedown(struct drm_device *dev) {}
 static int nouveau_stub_init(struct drm_device *dev) { return 0; }
 
+int nouveau_fifo_pause_dummy(struct drm_device *dev) { return 0; }
+void nouveau_fifo_unpause_dummy(struct drm_device *dev) { }
+
+int nouveau_graph_pause_dummy(struct drm_device *dev) {	return 0; }
+void nouveau_graph_unpause_dummy(struct drm_device *dev) {}
+
 static int nouveau_init_engine_ptrs(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -73,6 +79,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nv04_graph_destroy_context;
 		engine->graph.load_context	= nv04_graph_load_context;
 		engine->graph.unload_context	= nv04_graph_unload_context;
+		engine->graph.pause		= nouveau_graph_pause_dummy;
+		engine->graph.unpause	= nouveau_graph_unpause_dummy;
 		engine->fifo.channels		= 16;
 		engine->fifo.init		= nv04_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -85,6 +93,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
 		engine->fifo.load_context	= nv04_fifo_load_context;
 		engine->fifo.unload_context	= nv04_fifo_unload_context;
+		engine->fifo.pause		= nouveau_fifo_pause_dummy;
+		engine->fifo.unpause	= nouveau_fifo_unpause_dummy;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -130,6 +140,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv10_graph_load_context;
 		engine->graph.unload_context	= nv10_graph_unload_context;
 		engine->graph.set_tile_region	= nv10_graph_set_tile_region;
+		engine->graph.pause		= nouveau_graph_pause_dummy;
+		engine->graph.unpause	= nouveau_graph_unpause_dummy;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -142,6 +154,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
 		engine->fifo.load_context	= nv10_fifo_load_context;
 		engine->fifo.unload_context	= nv10_fifo_unload_context;
+		engine->fifo.pause		= nouveau_fifo_pause_dummy;
+		engine->fifo.unpause	= nouveau_fifo_unpause_dummy;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -187,6 +201,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv20_graph_load_context;
 		engine->graph.unload_context	= nv20_graph_unload_context;
 		engine->graph.set_tile_region	= nv20_graph_set_tile_region;
+		engine->graph.pause		= nouveau_graph_pause_dummy;
+		engine->graph.unpause	= nouveau_graph_unpause_dummy;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -199,6 +215,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
 		engine->fifo.load_context	= nv10_fifo_load_context;
 		engine->fifo.unload_context	= nv10_fifo_unload_context;
+		engine->fifo.pause		= nouveau_fifo_pause_dummy;
+		engine->fifo.unpause	= nouveau_fifo_unpause_dummy;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -244,6 +262,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv20_graph_load_context;
 		engine->graph.unload_context	= nv20_graph_unload_context;
 		engine->graph.set_tile_region	= nv20_graph_set_tile_region;
+		engine->graph.pause		= nouveau_graph_pause_dummy;
+		engine->graph.unpause	= nouveau_graph_unpause_dummy;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -256,6 +276,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
 		engine->fifo.load_context	= nv10_fifo_load_context;
 		engine->fifo.unload_context	= nv10_fifo_unload_context;
+		engine->fifo.pause		= nouveau_fifo_pause_dummy;
+		engine->fifo.unpause	= nouveau_fifo_unpause_dummy;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -304,6 +326,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv40_graph_load_context;
 		engine->graph.unload_context	= nv40_graph_unload_context;
 		engine->graph.set_tile_region	= nv40_graph_set_tile_region;
+		engine->graph.pause		= nouveau_graph_pause_dummy;
+		engine->graph.unpause	= nouveau_graph_unpause_dummy;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv40_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -316,6 +340,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
 		engine->fifo.load_context	= nv40_fifo_load_context;
 		engine->fifo.unload_context	= nv40_fifo_unload_context;
+		engine->fifo.pause		= nouveau_fifo_pause_dummy;
+		engine->fifo.unpause	= nouveau_fifo_unpause_dummy;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -366,6 +392,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nv50_graph_destroy_context;
 		engine->graph.load_context	= nv50_graph_load_context;
 		engine->graph.unload_context	= nv50_graph_unload_context;
+		engine->graph.pause		= nv50_graph_pause;
+		engine->graph.unpause	= nv50_graph_unpause;
 		if (dev_priv->chipset != 0x86)
 			engine->graph.tlb_flush	= nv50_graph_tlb_flush;
 		else {
@@ -387,6 +415,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.load_context	= nv50_fifo_load_context;
 		engine->fifo.unload_context	= nv50_fifo_unload_context;
 		engine->fifo.tlb_flush		= nv50_fifo_tlb_flush;
+		engine->fifo.pause			= nv50_fifo_pause;
+		engine->fifo.unpause		= nv50_fifo_unpause;
 		engine->display.early_init	= nv50_display_early_init;
 		engine->display.late_takedown	= nv50_display_late_takedown;
 		engine->display.create		= nv50_display_create;
@@ -467,6 +497,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nvc0_graph_destroy_context;
 		engine->graph.load_context	= nvc0_graph_load_context;
 		engine->graph.unload_context	= nvc0_graph_unload_context;
+		engine->graph.pause		= nouveau_graph_pause_dummy;
+		engine->graph.unpause	= nouveau_graph_unpause_dummy;
 		engine->fifo.channels		= 128;
 		engine->fifo.init		= nvc0_fifo_init;
 		engine->fifo.takedown		= nvc0_fifo_takedown;
@@ -478,6 +510,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nvc0_fifo_destroy_context;
 		engine->fifo.load_context	= nvc0_fifo_load_context;
 		engine->fifo.unload_context	= nvc0_fifo_unload_context;
+		engine->fifo.pause		= nouveau_fifo_pause_dummy;
+		engine->fifo.unpause	= nouveau_fifo_unpause_dummy;
 		engine->display.early_init	= nv50_display_early_init;
 		engine->display.late_takedown	= nv50_display_late_takedown;
 		engine->display.create		= nv50_display_create;
@@ -1167,4 +1201,3 @@ bool nouveau_wait_for_idle(struct drm_device *dev)
 
 	return true;
 }
-
diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index d3295aa..ea8cc34 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -487,3 +487,21 @@ nv50_fifo_tlb_flush(struct drm_device *dev)
 {
 	nv50_vm_flush(dev, 5);
 }
+
+int
+nv50_fifo_pause(struct drm_device *dev)
+{
+	nv_wr32(dev, NV50_PFIFO_FREEZE, 1);
+	if (!nouveau_wait_until(dev, 2000000000ULL, NV50_PFIFO_FREEZE,
+		0x10, 0x10)) {
+		NV_ERROR(dev, "PFIFO freeze fail!\n");
+		return -EIO;
+	}
+	return 0;
+}
+
+void
+nv50_fifo_unpause(struct drm_device *dev)
+{
+	nv_wr32(dev, NV50_PFIFO_FREEZE, 0);
+}
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index e0f5294..9c0543b 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -507,3 +507,49 @@ nv86_graph_tlb_flush(struct drm_device *dev)
 	nv_mask(dev, 0x400500, 0x00000001, 0x00000001);
 	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 }
+
+int
+nv50_graph_pause(struct drm_device *dev)
+{
+	uint64_t start;
+	/* initial guess... */
+	uint32_t mask380 = 0xffffffff;
+	uint32_t mask384 = 0xffffffff;
+	uint32_t mask388 = 0xffffffff;
+	uint32_t mask700 = 0x00000001;
+
+	start = nv04_timer_read(dev);
+	nv_wr32(dev, NV50_PGRAPH_CONTROL, 0x10000);
+	while ((nv_rd32(dev, 0x400380) & mask380) ||
+		   (nv_rd32(dev, 0x400384) & mask384) ||
+		   (nv_rd32(dev, 0x400388) & mask388) ||
+		   (nv_rd32(dev, NV50_PGRAPH_STATUS) & mask700)) {
+		if (nv04_timer_read(dev) - start >= 10000000) {
+			/* if you see this message,
+			 * mask* above probably need to be adjusted
+			 * to not contain the bits you see failing */
+			NV_ERROR(dev,
+					 "PGRAPH: wait for idle fail: %08x %08x %08x %08x!\n",
+					 nv_rd32(dev, 0x400380),
+					 nv_rd32(dev, 0x400384),
+					 nv_rd32(dev, 0x400388),
+					 nv_rd32(dev, NV50_PGRAPH_STATUS));
+
+			if (nv_rd32(dev, NV50_PGRAPH_STATUS) & 0x100)
+				NV_ERROR(dev,
+						"PGRAPH: PGRAPH paused while running a ctxprog,"
+						" NV40_PGRAPH_CTXCTL_0310 = 0x%x\n",
+						nv_rd32(dev, NV40_PGRAPH_CTXCTL_0310));
+
+			nv50_graph_unpause(dev);
+			return -EIO;
+		}
+	}
+	return 0;
+}
+
+void
+nv50_graph_unpause(struct drm_device *dev)
+{
+	nv_wr32(dev, NV50_PGRAPH_CONTROL, 0x10001);
+}
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index adc2ec7..f8a35ea 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -26,11 +26,13 @@
 #include "nouveau_drv.h"
 #include "nouveau_bios.h"
 #include "nouveau_pm.h"
+#include "nouveau_pms.h"
 
 struct nv50_pm_state {
 	struct nouveau_pm_level *perflvl;
-	struct pll_lims pll;
+	struct pms_ucode ucode;
 	enum pll_types type;
+	struct pll_lims pll;
 	int N, M, P;
 };
 
@@ -61,14 +63,20 @@ void *
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
+	int ret, i;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 	state->type = id;
 	state->perflvl = perflvl;
+	pms = &state->ucode;
 
 	ret = get_pll_limits(dev, id, &state->pll);
 	if (ret < 0) {
@@ -76,28 +84,98 @@ nv50_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 		return (ret == -ENOENT) ? NULL : ERR_PTR(ret);
 	}
 
-	ret = nv50_calc_pll(dev, &state->pll, khz, &state->N, &state->M,
-			    &dummy, &dummy, &state->P);
+	ret = nv50_calc_pll(dev, &state->pll, khz, &state->N,
+						&state->M, &i, &i, &state->P);
 	if (ret < 0) {
 		kfree(state);
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
+	if (crtc_mask) {
+		pms_op5f(pms, crtc_mask, 0x00);
+		pms_op5f(pms, crtc_mask, 0x01);
+	}
+	switch (state->type) {
+	case PLL_MEMORY:
+		if (dev_priv->chipset >= 0x92)
+			pms_wr32(pms, 0x611200, 0x00003300);
+
+		pms_wr32(pms, 0x002504, 0x00000001);
+		pms_unkn(pms, 0x06);
+		pms_unkn(pms, 0xb0);
+		pms_op5f(pms, 0x00, 0x01);
+
+		pms_wr32(pms, 0x100210, 0x00000000);
+		pms_wr32(pms, 0x1002dc, 0x00000001);
+		pms_wr32(pms, state->pll.reg + 0, reg0_old | 0x00000200);
+		pms_wr32(pms, state->pll.reg + 4, (state->N << 8) | state->M);
+		pms_wr32(pms, state->pll.reg + 0, reg0_new | 0x00000200);
+		pms_unkn(pms, 0x0d);
+		pms_unkn(pms, 0x0a);
+		pms_wr32(pms, state->pll.reg + 0, reg0_new);
+		pms_wr32(pms, 0x1002dc, 0x00000000);
+		pms_wr32(pms, 0x100210, 0x80000000);
+		pms_unkn(pms, 0x07);
+
+		pms_unkn(pms, 0x09);
+		pms_unkn(pms, 0x05);
+		pms_unkn(pms, 0x0b);
+
+		pms_unkn(pms, 0xd0);
+		pms_op5f(pms, 0x00, 0x00);
+		if (dev_priv->chipset >= 0x92)
+			pms_wr32(pms, 0x611200, 0x00003300);
+		pms_wr32(pms, 0x002504, 0x00000000);
+		break;
+	default:
+		pms_unkn(pms, 0xb0);
+		pms_op5f(pms, 0x00, 0x01);
+
+		pms_wr32(pms, 0xc040, (reg_c040 & ~(1 << 5 | 1 << 4)) | (1 << 20));
+		pms_wr32(pms, state->pll.reg + 0, reg0_new);
+		pms_wr32(pms, state->pll.reg + 4, (state->N << 8) | state->M);
+		pms_unkn(pms, 0x0e);
+
+		pms_wr32(pms, 0xc040, reg_c040);
+		pms_wr32(pms, 0xc040, 0x10);
+
+		pms_wr32(pms, 0xc040, reg_c040);
+
+		pms_unkn(pms, 0xd0);
+		pms_op5f(pms, 0x00, 0x00);
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
-	int N = state->N;
-	int M = state->M;
-	int P = state->P;
+	int i;
 
+	/* execute mem scripts from the M bit table if needed */
 	if (state->type == PLL_MEMORY && perflvl->memscript &&
 	    bit_table(dev, 'M', &BIT_M) == 0 &&
 	    BIT_M.version == 1 && BIT_M.length >= 0x0b) {
@@ -114,19 +192,69 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 		nouveau_bios_run_init_table(dev, perflvl->memscript, NULL);
 	}
 
+	/* only use PMS for changing the memory clocks */
 	if (state->type == PLL_MEMORY) {
-		nv_wr32(dev, 0x100210, 0);
-		nv_wr32(dev, 0x1002dc, 1);
-	}
+		if (dev_priv->chipset < 0x90) {
+			pms_data = 0x001400;
+			pms_kick = 0x00000003;
+		} else {
+			pms_data = 0x080000;
+			pms_kick = 0x00000001;
+		}
 
-	tmp  = nv_rd32(dev, reg + 0) & 0xfff8ffff;
-	tmp |= 0x80000000 | (P << 16);
-	nv_wr32(dev, reg + 0, tmp);
-	nv_wr32(dev, reg + 4, (N << 8) | M);
+		/* upload ucode */
+		pbus1098 = nv_mask(dev, 0x001098, 0x00000008, 0x00000000);
+		nv_wr32(dev, 0x001304, 0x00000000);
+		for (i = 0; i < pms->len / 4; i++)
+			nv_wr32(dev, pms_data + (i * 4), pms->ptr.u32[i]);
+		nv_wr32(dev, 0x001098, pbus1098 | 0x18);
 
-	if (state->type == PLL_MEMORY) {
-		nv_wr32(dev, 0x1002dc, 0);
-		nv_wr32(dev, 0x100210, 0x80000000);
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
+			NV_ERROR(dev, "0x001308: 0x%08x\n", nv_rd32(dev, 0x001308));
+			for (i = 0; i < pms->len / 4; i++) {
+				NV_ERROR(dev, "0x%06x: 0x%08x\n", 0x1400 + (i * 4),
+					nv_rd32(dev, 0x001400 + (i * 4)));
+			}
+		}
+		nv_wr32(dev, 0x619f00, r619f00);
+		nv_wr32(dev, 0x100b0c, r100b0c);
+		nv_mask(dev, 0x616308, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x616b08, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x100200, 0x00000000, 0x00000800);
+	} else {
+		u32 reg0;
+
+		reg0 = nv_rd32(dev, state->pll.reg + 0) & 0xfff8ffff;
+		reg0 |= 0x80000000 | (state->P << 16);
+
+		/* set the PLL supervisor as needed */
+		if (state->type == PLL_UNK05)
+			nv_mask(dev, 0xc040, 1 << 8 | 1 << 11, 0);
+		else if (state->type == PLL_CORE || state->type == PLL_SHADER)
+			nv_mask(dev, 0xc040, 1 << 5 | 1 << 4, 1 << 20);
+
+		/* set REG0 */
+		nv_wr32(dev, state->pll.reg + 0, reg0);
+
+		/* reset the PLL supervisor. This may not be needed */
+		if (state->type == PLL_UNK05)
+			nv_mask(dev, 0xc040, 1 << 8 | 1 << 11, 0);
+		else if (state->type == PLL_CORE || state->type == PLL_SHADER)
+			nv_mask(dev, 0xc040, 1 << 5 | 1 << 4, 1 << 20);
+
+		/* set REG1 */
+		nv_wr32(dev, state->pll.reg + 4, (state->N << 8) | state->M);
 	}
 
 	kfree(state);
-- 
1.7.3.2


--------------060202050607010508080302
Content-Type: application/x-shellscript;
 name="test_mode_changes.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="test_mode_changes.sh"

IyEvYmluL2Jhc2gKCndoaWxlIFsgL2Jpbi90cnVlIF0KZG8KZWNobyAwID4gL3N5cy9jbGFz
cy9kcm0vY2FyZDAvZGV2aWNlL3BlcmZvcm1hbmNlX2xldmVsCnNsZWVwIDAuMQplY2hvIDIg
PiAvc3lzL2NsYXNzL2RybS9jYXJkMC9kZXZpY2UvcGVyZm9ybWFuY2VfbGV2ZWwKc2xlZXAg
MC4xCmRvbmUK
--------------060202050607010508080302
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------060202050607010508080302--
