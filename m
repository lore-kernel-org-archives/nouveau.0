From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Add pause/unpause methods for PFIFO & PGRAPH. Use
 them to get stable clock changes
Date: Thu, 28 Oct 2010 18:34:13 +0200
Message-ID: <4CC9A605.5050700@free.fr>
References: <4CA3223F.9030503@free.fr>
	<4CA4C57E.5090400@free.fr>	<4CAD2383.50907@free.fr>
	<4CADE982.7080309@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070000000503080201060705"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CADE982.7080309-GANU6spQydw@public.gmane.org>
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
--------------070000000503080201060705
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Please merge this patch, it helps a lot when it comes to safe 
re-clocking. It isn't perfect yet but it will satisfy most users.

Cheers,

Martin

--------------070000000503080201060705
Content-Type: text/x-patch;
 name="0001-Pause-the-card-before-reclocking.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Pause-the-card-before-reclocking.patch"

From 58605d78ec7a576502a8f46953f6e2f0092eb180 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Thu, 28 Oct 2010 20:27:08 +0200
Subject: [PATCH] Pause the card before reclocking

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   10 ++++++
 drivers/gpu/drm/nouveau/nouveau_pm.c    |   50 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    3 ++
 drivers/gpu/drm/nouveau/nouveau_state.c |   35 +++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nv50_fifo.c     |   18 +++++++++++
 drivers/gpu/drm/nouveau/nv50_graph.c    |   46 ++++++++++++++++++++++++++++
 6 files changed, 159 insertions(+), 3 deletions(-)

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
index 8ef1d5b..bc7c70e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -59,6 +59,7 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	uint32_t status;
 	int ret;
 
 	if (perflvl == pm->cur)
@@ -72,13 +73,58 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 		}
 	}
 
+	/* TODO: Wait for vblank */
+
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
+	/* Change the clocks */
 	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
 	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
 	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
 
+	/* Wait for PLLs to stabilize */
+	udelay(100);
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
@@ -112,7 +158,7 @@ nouveau_pm_profile_set(struct drm_device *dev, const char *profile)
 			return -EINVAL;
 	}
 
-	NV_INFO(dev, "setting performance level: %s\n", profile);
+	NV_INFO(dev, "setting performance level: %s", profile);
 	return nouveau_pm_perflvl_set(dev, perflvl);
 }
 
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
-- 
1.7.3.2


--------------070000000503080201060705
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------070000000503080201060705--
