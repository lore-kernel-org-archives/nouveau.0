From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Add pause/unpause methods for PFIFO & PGRAPH. Use
 them to get stable clock changes
Date: Thu, 30 Sep 2010 19:14:38 +0200
Message-ID: <4CA4C57E.5090400@free.fr>
References: <4CA3223F.9030503@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060107090404080201010405"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CA3223F.9030503-GANU6spQydw@public.gmane.org>
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
--------------060107090404080201010405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  Hi,

Here is an updated set of patches (in regards on comments got on IRC and 
an handling error when using several channels).

These updated patch allow me to run 5 glxgears at the same time and 
reclock the card almost 100 times per second without crashing.

Don't panic if you get theses in your logs:
PGRAPH: wait for idle fail: 00000000 00000000 00000000 00000103!
PGRAPH: PGRAPH paused while running a ctxprog, NV40_PGRAPH_CTXCTL_0310 = 
0x11

It means that we tried to reclock during a context switch. It would be 
safe to continue as when the program is at 0x11, it means it waits for 
another process (which is stopped because we stopped PFIFO before). I 
could allow to get this value (ie continue and clock), but if someone 
changes the ctxprog, he would have to update it here.

For the moment, I don't mind if from time to time, setting the clocks fail.

Waiting for your comments.

Regards,

Martin

--------------060107090404080201010405
Content-Type: text/x-patch;
 name="0001-Add-pause-unpause-methods-to-the-PFIFO-engine.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Add-pause-unpause-methods-to-the-PFIFO-engine.patch"

From a219259d5ea46fb18f8e36c6c5a2f9e9e63fe53e Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Wed, 29 Sep 2010 14:56:37 +0200
Subject: [PATCH 1/3] Add pause/unpause methods to the PFIFO engine

---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    8 ++++++++
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    1 +
 drivers/gpu/drm/nouveau/nouveau_state.c |   14 ++++++++++++++
 drivers/gpu/drm/nouveau/nv50_fifo.c     |   18 ++++++++++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 591254e..c256c0a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -304,6 +304,9 @@ struct nouveau_fifo_engine {
 	void (*destroy_context)(struct nouveau_channel *);
 	int  (*load_context)(struct nouveau_channel *);
 	int  (*unload_context)(struct drm_device *);
+
+	int  (*pause)(struct drm_device *);
+	int  (*unpause)(struct drm_device *);
 };
 
 struct nouveau_pgraph_object_method {
@@ -339,6 +342,9 @@ struct nouveau_pgraph_engine {
 
 	void (*set_region_tiling)(struct drm_device *dev, int i, uint32_t addr,
 				  uint32_t size, uint32_t pitch);
+
+	int  (*pause)(struct drm_device *);
+	int  (*unpause)(struct drm_device *);
 };
 
 struct nouveau_display_engine {
@@ -1036,6 +1042,8 @@ extern int  nv50_fifo_create_context(struct nouveau_channel *);
 extern void nv50_fifo_destroy_context(struct nouveau_channel *);
 extern int  nv50_fifo_load_context(struct nouveau_channel *);
 extern int  nv50_fifo_unload_context(struct drm_device *);
+extern int  nv50_fifo_pause(struct drm_device *);
+extern int  nv50_fifo_unpause(struct drm_device *);
 
 /* nvc0_fifo.c */
 extern int  nvc0_fifo_init(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index 1b42541..ee6dae1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -701,6 +701,7 @@
 #define NV50_PGRAPH                                         0x00400000
 #define NV50_PGRAPH__LEN                                           0x1
 #define NV50_PGRAPH__ESIZE                                     0x10000
+#define NV50_PFIFO_FREEZE                                       0x2504
 
 #define NV50_PDISPLAY                                                0x00610000
 #define NV50_PDISPLAY_OBJECTS                                        0x00610010
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 75bce91..cfc34f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -86,6 +86,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
 		engine->fifo.load_context	= nv04_fifo_load_context;
 		engine->fifo.unload_context	= nv04_fifo_unload_context;
+		engine->fifo.pause			= NULL;
+		engine->fifo.unpause		= NULL;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -140,6 +142,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv10_fifo_destroy_context;
 		engine->fifo.load_context	= nv10_fifo_load_context;
 		engine->fifo.unload_context	= nv10_fifo_unload_context;
+		engine->fifo.pause			= NULL;
+		engine->fifo.unpause		= NULL;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -194,6 +198,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv10_fifo_destroy_context;
 		engine->fifo.load_context	= nv10_fifo_load_context;
 		engine->fifo.unload_context	= nv10_fifo_unload_context;
+		engine->fifo.pause			= NULL;
+		engine->fifo.unpause		= NULL;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -248,6 +254,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv10_fifo_destroy_context;
 		engine->fifo.load_context	= nv10_fifo_load_context;
 		engine->fifo.unload_context	= nv10_fifo_unload_context;
+		engine->fifo.pause			= NULL;
+		engine->fifo.unpause		= NULL;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -305,6 +313,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv40_fifo_destroy_context;
 		engine->fifo.load_context	= nv40_fifo_load_context;
 		engine->fifo.unload_context	= nv40_fifo_unload_context;
+		engine->fifo.pause			= NULL;
+		engine->fifo.unpause		= NULL;
 		engine->display.early_init	= nv04_display_early_init;
 		engine->display.late_takedown	= nv04_display_late_takedown;
 		engine->display.create		= nv04_display_create;
@@ -365,6 +375,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nv50_fifo_destroy_context;
 		engine->fifo.load_context	= nv50_fifo_load_context;
 		engine->fifo.unload_context	= nv50_fifo_unload_context;
+		engine->fifo.pause			= nv50_fifo_pause;
+		engine->fifo.unpause		= nv50_fifo_unpause;
 		engine->display.early_init	= nv50_display_early_init;
 		engine->display.late_takedown	= nv50_display_late_takedown;
 		engine->display.create		= nv50_display_create;
@@ -434,6 +446,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.destroy_context	= nvc0_fifo_destroy_context;
 		engine->fifo.load_context	= nvc0_fifo_load_context;
 		engine->fifo.unload_context	= nvc0_fifo_unload_context;
+		engine->fifo.pause			= NULL;
+		engine->fifo.unpause		= NULL;
 		engine->display.early_init	= nv50_display_early_init;
 		engine->display.late_takedown	= nv50_display_late_takedown;
 		engine->display.create		= nv50_display_create;
diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index a46a961..dd746eb 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -464,3 +464,21 @@ nv50_fifo_unload_context(struct drm_device *dev)
 	return 0;
 }
 
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
+int
+nv50_fifo_unpause(struct drm_device *dev)
+{
+	nv_wr32(dev, NV50_PFIFO_FREEZE, 0);
+	return 0;
+}
-- 
1.7.2


--------------060107090404080201010405
Content-Type: text/x-patch;
 name="0002-Add-pause-unpause-methods-to-the-PGRAPH-engine-v2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-Add-pause-unpause-methods-to-the-PGRAPH-engine-v2.patch"

From c9392831ac4b3907322fb35c742ba5509d8cf0a1 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Thu, 30 Sep 2010 20:43:21 +0200
Subject: [PATCH 2/3] Add pause/unpause methods to the PGRAPH engine v2

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    2 +
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    2 +
 drivers/gpu/drm/nouveau/nouveau_state.c |   14 +++++++++
 drivers/gpu/drm/nouveau/nv50_graph.c    |   48 +++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index c256c0a..bed57d0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1121,6 +1121,8 @@ extern int  nv50_graph_load_context(struct nouveau_channel *);
 extern int  nv50_graph_unload_context(struct drm_device *);
 extern void nv50_graph_context_switch(struct drm_device *);
 extern int  nv50_grctx_init(struct nouveau_grctx *);
+extern int nv50_graph_pause(struct drm_device *dev);
+extern int nv50_graph_unpause(struct drm_device *dev);
 
 /* nvc0_graph.c */
 extern int  nvc0_graph_init(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index ee6dae1..346b77a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -699,6 +699,8 @@
 #define NV50_PROM__ESIZE                                       0x10000
 
 #define NV50_PGRAPH                                         0x00400000
+#define NV50_PGRAPH_CONTROL                                 0x00400500
+#define NV50_PGRAPH_STATUS                                  0x00400700
 #define NV50_PGRAPH__LEN                                           0x1
 #define NV50_PGRAPH__ESIZE                                     0x10000
 #define NV50_PFIFO_FREEZE                                       0x2504
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index cfc34f5..fc5fb46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -74,6 +74,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nv04_graph_destroy_context;
 		engine->graph.load_context	= nv04_graph_load_context;
 		engine->graph.unload_context	= nv04_graph_unload_context;
+		engine->graph.pause		= NULL;
+		engine->graph.unpause	= NULL;
 		engine->fifo.channels		= 16;
 		engine->fifo.init		= nv04_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -130,6 +132,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv10_graph_load_context;
 		engine->graph.unload_context	= nv10_graph_unload_context;
 		engine->graph.set_region_tiling	= nv10_graph_set_region_tiling;
+		engine->graph.pause		= NULL;
+		engine->graph.unpause	= NULL;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -186,6 +190,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv20_graph_load_context;
 		engine->graph.unload_context	= nv20_graph_unload_context;
 		engine->graph.set_region_tiling	= nv20_graph_set_region_tiling;
+		engine->graph.pause		= NULL;
+		engine->graph.unpause	= NULL;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -242,6 +248,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv20_graph_load_context;
 		engine->graph.unload_context	= nv20_graph_unload_context;
 		engine->graph.set_region_tiling	= nv20_graph_set_region_tiling;
+		engine->graph.pause		= NULL;
+		engine->graph.unpause	= NULL;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -301,6 +309,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.load_context	= nv40_graph_load_context;
 		engine->graph.unload_context	= nv40_graph_unload_context;
 		engine->graph.set_region_tiling	= nv40_graph_set_region_tiling;
+		engine->graph.pause		= NULL;
+		engine->graph.unpause	= NULL;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv40_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -364,6 +374,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nv50_graph_destroy_context;
 		engine->graph.load_context	= nv50_graph_load_context;
 		engine->graph.unload_context	= nv50_graph_unload_context;
+		engine->graph.pause		= nv50_graph_pause;
+		engine->graph.unpause	= nv50_graph_unpause;
 		engine->fifo.channels		= 128;
 		engine->fifo.init		= nv50_fifo_init;
 		engine->fifo.takedown		= nv50_fifo_takedown;
@@ -435,6 +447,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nvc0_graph_destroy_context;
 		engine->graph.load_context	= nvc0_graph_load_context;
 		engine->graph.unload_context	= nvc0_graph_unload_context;
+		engine->graph.pause		= NULL;
+		engine->graph.unpause	= NULL;
 		engine->fifo.channels		= 128;
 		engine->fifo.init		= nvc0_fifo_init;
 		engine->fifo.takedown		= nvc0_fifo_takedown;
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index cbf5ae2..252b432 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -381,6 +381,54 @@ nv50_graph_nvsw_vblsem_release(struct nouveau_channel *chan, int grclass,
 	return 0;
 }
 
+
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
+		if (nv04_timer_read(dev) - start >= 50000000) {
+			/* if you see this message, mask* above probably need to be adjusted
+			 * to not contain the bits you see failing */
+			NV_ERROR(dev, "PGRAPH: wait for idle fail: %08x %08x %08x %08x!\n",
+					 nv_rd32(dev, 0x400380), nv_rd32(dev, 0x400384),
+					 nv_rd32(dev, 0x400388), nv_rd32(dev, NV50_PGRAPH_STATUS));
+
+			if (nv_rd32(dev, NV50_PGRAPH_STATUS) & 0x100)
+				NV_ERROR(dev, "PGRAPH: PGRAPH paused while running a ctxprog, "
+							  "NV40_PGRAPH_CTXCTL_0310 = 0x%x\n",
+							  nv_rd32(dev, NV40_PGRAPH_CTXCTL_0310));
+
+			nv50_graph_unpause(dev);
+			return -EIO;
+		}
+
+		/* After a 1ms wait, do not use all the  */
+		if (nv04_timer_read(dev) - start >= 1000000)
+			schedule();
+	}
+	return 0;
+}
+
+int
+nv50_graph_unpause(struct drm_device *dev)
+{
+	nv_wr32(dev, NV50_PGRAPH_CONTROL, 0x10001);
+	return 0;
+}
+
 static struct nouveau_pgraph_object_method nv50_graph_nvsw_methods[] = {
 	{ 0x018c, nv50_graph_nvsw_dma_vblsem },
 	{ 0x0400, nv50_graph_nvsw_vblsem_offset },
-- 
1.7.2


--------------060107090404080201010405
Content-Type: text/x-patch;
 name="0003-Idle-PGRAPH-and-PFIFO-before-changing-the-clocks-v2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-Idle-PGRAPH-and-PFIFO-before-changing-the-clocks-v2.pat";
 filename*1="ch"

From 6f442a081ef358332f1e155a3c16f1f7c6152c21 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Thu, 30 Sep 2010 20:57:48 +0200
Subject: [PATCH 3/3] Idle PGRAPH and PFIFO before changing the clocks v2

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 1c99c55..fb3681c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -68,11 +68,30 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 		}
 	}
 
+	/* Pause the engines, if possible */
+	if (dev_priv->engine.fifo.pause) {
+		if (dev_priv->engine.fifo.pause(dev))
+			return -EIO;
+	}
+	if (dev_priv->engine.graph.pause) {
+		if (dev_priv->engine.graph.pause(dev))
+			return -EIO;
+	}
+
 	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
 	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
 	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
 
+	/* Wait for PLLs to stabilize */
+	udelay(100);
+
+	/* Un-pause the engines, if possible */
+	if (dev_priv->engine.fifo.unpause)
+		dev_priv->engine.fifo.unpause(dev);
+	if (dev_priv->engine.graph.unpause)
+		dev_priv->engine.graph.unpause(dev);
+
 	pm->cur = perflvl;
 	return 0;
 }
-- 
1.7.2


--------------060107090404080201010405
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------060107090404080201010405--
