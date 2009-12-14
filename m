From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 1/3] drm/nouveau: Pre-G80 tiling support.
Date: Mon, 14 Dec 2009 04:03:37 +0100
Message-ID: <1260759817-26855-1-git-send-email-currojerez@riseup.net>
References: <1260556404-13389-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260556404-13389-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
v2: Simplify things a bit.

 drivers/gpu/drm/nouveau/nouveau_drv.h   |   18 +++++
 drivers/gpu/drm/nouveau/nouveau_reg.h   |   16 ++--
 drivers/gpu/drm/nouveau/nouveau_state.c |    8 ++
 drivers/gpu/drm/nouveau/nv10_fb.c       |   32 +++++++--
 drivers/gpu/drm/nouveau/nv10_graph.c    |   28 +++++---
 drivers/gpu/drm/nouveau/nv20_graph.c    |   61 ++++++++---------
 drivers/gpu/drm/nouveau/nv40_fb.c       |   53 +++++++++-----
 drivers/gpu/drm/nouveau/nv40_graph.c    |  116 +++++++++++++------------------
 8 files changed, 185 insertions(+), 147 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 88b4c7b..40b4a37 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -276,8 +276,13 @@ struct nouveau_timer_engine {
 };
 
 struct nouveau_fb_engine {
+	int num_tiles;
+
 	int  (*init)(struct drm_device *dev);
 	void (*takedown)(struct drm_device *dev);
+
+	void (*set_region_tiling)(struct drm_device *dev, int i, uint32_t addr,
+				 uint32_t size, uint32_t pitch);
 };
 
 struct nouveau_fifo_engine {
@@ -328,6 +333,9 @@ struct nouveau_pgraph_engine {
 	void (*destroy_context)(struct nouveau_channel *);
 	int  (*load_context)(struct nouveau_channel *);
 	int  (*unload_context)(struct drm_device *);
+
+	void (*set_region_tiling)(struct drm_device *dev, int i, uint32_t addr,
+				  uint32_t size, uint32_t pitch);
 };
 
 struct nouveau_engine {
@@ -876,10 +884,14 @@ extern void nv04_fb_takedown(struct drm_device *);
 /* nv10_fb.c */
 extern int  nv10_fb_init(struct drm_device *);
 extern void nv10_fb_takedown(struct drm_device *);
+extern void nv10_fb_set_region_tiling(struct drm_device *, int, uint32_t,
+				      uint32_t, uint32_t);
 
 /* nv40_fb.c */
 extern int  nv40_fb_init(struct drm_device *);
 extern void nv40_fb_takedown(struct drm_device *);
+extern void nv40_fb_set_region_tiling(struct drm_device *, int, uint32_t,
+				      uint32_t, uint32_t);
 
 /* nv04_fifo.c */
 extern int  nv04_fifo_init(struct drm_device *);
@@ -938,6 +950,8 @@ extern void nv10_graph_destroy_context(struct nouveau_channel *);
 extern int  nv10_graph_load_context(struct nouveau_channel *);
 extern int  nv10_graph_unload_context(struct drm_device *);
 extern void nv10_graph_context_switch(struct drm_device *);
+extern void nv10_graph_set_region_tiling(struct drm_device *, int, uint32_t,
+					 uint32_t, uint32_t);
 
 /* nv20_graph.c */
 extern struct nouveau_pgraph_object_class nv20_graph_grclass[];
@@ -949,6 +963,8 @@ extern int  nv20_graph_unload_context(struct drm_device *);
 extern int  nv20_graph_init(struct drm_device *);
 extern void nv20_graph_takedown(struct drm_device *);
 extern int  nv30_graph_init(struct drm_device *);
+extern void nv20_graph_set_region_tiling(struct drm_device *, int, uint32_t,
+					 uint32_t, uint32_t);
 
 /* nv40_graph.c */
 extern struct nouveau_pgraph_object_class nv40_graph_grclass[];
@@ -962,6 +978,8 @@ extern int  nv40_graph_unload_context(struct drm_device *);
 extern int  nv40_grctx_init(struct drm_device *);
 extern void nv40_grctx_fini(struct drm_device *);
 extern void nv40_grctx_vals_load(struct drm_device *, struct nouveau_gpuobj *);
+extern void nv40_graph_set_region_tiling(struct drm_device *, int, uint32_t,
+					 uint32_t, uint32_t);
 
 /* nv50_graph.c */
 extern struct nouveau_pgraph_object_class nv50_graph_grclass[];
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index fa1b0e7..251f1b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -349,19 +349,19 @@
 #define NV04_PGRAPH_BLEND                                  0x00400824
 #define NV04_PGRAPH_STORED_FMT                             0x00400830
 #define NV04_PGRAPH_PATT_COLORRAM                          0x00400900
-#define NV40_PGRAPH_TILE0(i)                               (0x00400900 + (i*16))
-#define NV40_PGRAPH_TLIMIT0(i)                             (0x00400904 + (i*16))
-#define NV40_PGRAPH_TSIZE0(i)                              (0x00400908 + (i*16))
-#define NV40_PGRAPH_TSTATUS0(i)                            (0x0040090C + (i*16))
+#define NV20_PGRAPH_TILE(i)                                (0x00400900 + (i*16))
+#define NV20_PGRAPH_TLIMIT(i)                              (0x00400904 + (i*16))
+#define NV20_PGRAPH_TSIZE(i)                               (0x00400908 + (i*16))
+#define NV20_PGRAPH_TSTATUS(i)                             (0x0040090C + (i*16))
 #define NV10_PGRAPH_TILE(i)                                (0x00400B00 + (i*16))
 #define NV10_PGRAPH_TLIMIT(i)                              (0x00400B04 + (i*16))
 #define NV10_PGRAPH_TSIZE(i)                               (0x00400B08 + (i*16))
 #define NV10_PGRAPH_TSTATUS(i)                             (0x00400B0C + (i*16))
 #define NV04_PGRAPH_U_RAM                                  0x00400D00
-#define NV47_PGRAPH_TILE0(i)                               (0x00400D00 + (i*16))
-#define NV47_PGRAPH_TLIMIT0(i)                             (0x00400D04 + (i*16))
-#define NV47_PGRAPH_TSIZE0(i)                              (0x00400D08 + (i*16))
-#define NV47_PGRAPH_TSTATUS0(i)                            (0x00400D0C + (i*16))
+#define NV47_PGRAPH_TILE(i)                                (0x00400D00 + (i*16))
+#define NV47_PGRAPH_TLIMIT(i)                              (0x00400D04 + (i*16))
+#define NV47_PGRAPH_TSIZE(i)                               (0x00400D08 + (i*16))
+#define NV47_PGRAPH_TSTATUS(i)                             (0x00400D0C + (i*16))
 #define NV04_PGRAPH_V_RAM                                  0x00400D40
 #define NV04_PGRAPH_W_RAM                                  0x00400D80
 #define NV10_PGRAPH_COMBINER0_IN_ALPHA                     0x00400E40
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 2ed41d3..4342867 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -100,6 +100,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->timer.takedown		= nv04_timer_takedown;
 		engine->fb.init			= nv10_fb_init;
 		engine->fb.takedown		= nv10_fb_takedown;
+		engine->fb.set_region_tiling	= nv10_fb_set_region_tiling;
 		engine->graph.grclass		= nv10_graph_grclass;
 		engine->graph.init		= nv10_graph_init;
 		engine->graph.takedown		= nv10_graph_takedown;
@@ -109,6 +110,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.fifo_access	= nv04_graph_fifo_access;
 		engine->graph.load_context	= nv10_graph_load_context;
 		engine->graph.unload_context	= nv10_graph_unload_context;
+		engine->graph.set_region_tiling	= nv10_graph_set_region_tiling;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -139,6 +141,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->timer.takedown		= nv04_timer_takedown;
 		engine->fb.init			= nv10_fb_init;
 		engine->fb.takedown		= nv10_fb_takedown;
+		engine->fb.set_region_tiling	= nv10_fb_set_region_tiling;
 		engine->graph.grclass		= nv20_graph_grclass;
 		engine->graph.init		= nv20_graph_init;
 		engine->graph.takedown		= nv20_graph_takedown;
@@ -148,6 +151,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.fifo_access	= nv04_graph_fifo_access;
 		engine->graph.load_context	= nv20_graph_load_context;
 		engine->graph.unload_context	= nv20_graph_unload_context;
+		engine->graph.set_region_tiling	= nv20_graph_set_region_tiling;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -178,6 +182,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->timer.takedown		= nv04_timer_takedown;
 		engine->fb.init			= nv10_fb_init;
 		engine->fb.takedown		= nv10_fb_takedown;
+		engine->fb.set_region_tiling	= nv10_fb_set_region_tiling;
 		engine->graph.grclass		= nv30_graph_grclass;
 		engine->graph.init		= nv30_graph_init;
 		engine->graph.takedown		= nv20_graph_takedown;
@@ -187,6 +192,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nv20_graph_destroy_context;
 		engine->graph.load_context	= nv20_graph_load_context;
 		engine->graph.unload_context	= nv20_graph_unload_context;
+		engine->graph.set_region_tiling	= nv20_graph_set_region_tiling;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv10_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
@@ -218,6 +224,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->timer.takedown		= nv04_timer_takedown;
 		engine->fb.init			= nv40_fb_init;
 		engine->fb.takedown		= nv40_fb_takedown;
+		engine->fb.set_region_tiling	= nv40_fb_set_region_tiling;
 		engine->graph.grclass		= nv40_graph_grclass;
 		engine->graph.init		= nv40_graph_init;
 		engine->graph.takedown		= nv40_graph_takedown;
@@ -227,6 +234,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->graph.destroy_context	= nv40_graph_destroy_context;
 		engine->graph.load_context	= nv40_graph_load_context;
 		engine->graph.unload_context	= nv40_graph_unload_context;
+		engine->graph.set_region_tiling	= nv40_graph_set_region_tiling;
 		engine->fifo.channels		= 32;
 		engine->fifo.init		= nv40_fifo_init;
 		engine->fifo.takedown		= nouveau_stub_takedown;
diff --git a/drivers/gpu/drm/nouveau/nv10_fb.c b/drivers/gpu/drm/nouveau/nv10_fb.c
index 79e2d10..cc5cda4 100644
--- a/drivers/gpu/drm/nouveau/nv10_fb.c
+++ b/drivers/gpu/drm/nouveau/nv10_fb.c
@@ -3,17 +3,37 @@
 #include "nouveau_drv.h"
 #include "nouveau_drm.h"
 
+void
+nv10_fb_set_region_tiling(struct drm_device *dev, int i, uint32_t addr,
+			  uint32_t size, uint32_t pitch)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	uint32_t limit = max(1u, addr + size) - 1;
+
+	if (pitch) {
+		if (dev_priv->card_type >= NV_20)
+			addr |= 1;
+		else
+			addr |= 1 << 31;
+	}
+
+	nv_wr32(dev, NV10_PFB_TLIMIT(i), limit);
+	nv_wr32(dev, NV10_PFB_TSIZE(i), pitch);
+	nv_wr32(dev, NV10_PFB_TILE(i), addr);
+}
+
 int
 nv10_fb_init(struct drm_device *dev)
 {
-	uint32_t fb_bar_size;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
 	int i;
 
-	fb_bar_size = drm_get_resource_len(dev, 0) - 1;
-	for (i = 0; i < NV10_PFB_TILE__SIZE; i++) {
-		nv_wr32(dev, NV10_PFB_TILE(i), 0);
-		nv_wr32(dev, NV10_PFB_TLIMIT(i), fb_bar_size);
-	}
+	pfb->num_tiles = NV10_PFB_TILE__SIZE;
+
+	/* Turn all the tiling regions off. */
+	for (i = 0; i < pfb->num_tiles; i++)
+		pfb->set_region_tiling(dev, i, 0, 0, 0);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nv10_graph.c b/drivers/gpu/drm/nouveau/nv10_graph.c
index 6bf6804..669ad9d 100644
--- a/drivers/gpu/drm/nouveau/nv10_graph.c
+++ b/drivers/gpu/drm/nouveau/nv10_graph.c
@@ -808,6 +808,20 @@ void nv10_graph_destroy_context(struct nouveau_channel *chan)
 	chan->pgraph_ctx = NULL;
 }
 
+void
+nv10_graph_set_region_tiling(struct drm_device *dev, int i, uint32_t addr,
+			     uint32_t size, uint32_t pitch)
+{
+	uint32_t limit = max(1u, addr + size) - 1;
+
+	if (pitch)
+		addr |= 1 << 31;
+
+	nv_wr32(dev, NV10_PGRAPH_TLIMIT(i), limit);
+	nv_wr32(dev, NV10_PGRAPH_TSIZE(i), pitch);
+	nv_wr32(dev, NV10_PGRAPH_TILE(i), addr);
+}
+
 int nv10_graph_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -836,17 +850,9 @@ int nv10_graph_init(struct drm_device *dev)
 	} else
 		nv_wr32(dev, NV10_PGRAPH_DEBUG_4, 0x00000000);
 
-	/* copy tile info from PFB */
-	for (i = 0; i < NV10_PFB_TILE__SIZE; i++) {
-		nv_wr32(dev, NV10_PGRAPH_TILE(i),
-					nv_rd32(dev, NV10_PFB_TILE(i)));
-		nv_wr32(dev, NV10_PGRAPH_TLIMIT(i),
-					nv_rd32(dev, NV10_PFB_TLIMIT(i)));
-		nv_wr32(dev, NV10_PGRAPH_TSIZE(i),
-					nv_rd32(dev, NV10_PFB_TSIZE(i)));
-		nv_wr32(dev, NV10_PGRAPH_TSTATUS(i),
-					nv_rd32(dev, NV10_PFB_TSTATUS(i)));
-	}
+	/* Turn all the tiling regions off. */
+	for (i = 0; i < NV10_PFB_TILE__SIZE; i++)
+		nv10_graph_set_region_tiling(dev, i, 0, 0, 0);
 
 	nv_wr32(dev, NV10_PGRAPH_CTX_SWITCH1, 0x00000000);
 	nv_wr32(dev, NV10_PGRAPH_CTX_SWITCH2, 0x00000000);
diff --git a/drivers/gpu/drm/nouveau/nv20_graph.c b/drivers/gpu/drm/nouveau/nv20_graph.c
index 18ba74f..d6fc0a8 100644
--- a/drivers/gpu/drm/nouveau/nv20_graph.c
+++ b/drivers/gpu/drm/nouveau/nv20_graph.c
@@ -514,6 +514,27 @@ nv20_graph_rdi(struct drm_device *dev)
 	nouveau_wait_for_idle(dev);
 }
 
+void
+nv20_graph_set_region_tiling(struct drm_device *dev, int i, uint32_t addr,
+			     uint32_t size, uint32_t pitch)
+{
+	uint32_t limit = max(1u, addr + size) - 1;
+
+	if (pitch)
+		addr |= 1;
+
+	nv_wr32(dev, NV20_PGRAPH_TLIMIT(i), limit);
+	nv_wr32(dev, NV20_PGRAPH_TSIZE(i), pitch);
+	nv_wr32(dev, NV20_PGRAPH_TILE(i), addr);
+
+	nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0030 + 4 * i);
+	nv_wr32(dev, NV10_PGRAPH_RDI_DATA, limit);
+	nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0050 + 4 * i);
+	nv_wr32(dev, NV10_PGRAPH_RDI_DATA, pitch);
+	nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0010 + 4 * i);
+	nv_wr32(dev, NV10_PGRAPH_RDI_DATA, addr);
+}
+
 int
 nv20_graph_init(struct drm_device *dev)
 {
@@ -572,27 +593,10 @@ nv20_graph_init(struct drm_device *dev)
 		nv_wr32(dev, NV10_PGRAPH_RDI_DATA , 0x00000030);
 	}
 
-	/* copy tile info from PFB */
-	for (i = 0; i < NV10_PFB_TILE__SIZE; i++) {
-		nv_wr32(dev, 0x00400904 + i * 0x10,
-					nv_rd32(dev, NV10_PFB_TLIMIT(i)));
-			/* which is NV40_PGRAPH_TLIMIT0(i) ?? */
-		nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0030 + i * 4);
-		nv_wr32(dev, NV10_PGRAPH_RDI_DATA,
-					nv_rd32(dev, NV10_PFB_TLIMIT(i)));
-		nv_wr32(dev, 0x00400908 + i * 0x10,
-					nv_rd32(dev, NV10_PFB_TSIZE(i)));
-			/* which is NV40_PGRAPH_TSIZE0(i) ?? */
-		nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0050 + i * 4);
-		nv_wr32(dev, NV10_PGRAPH_RDI_DATA,
-					nv_rd32(dev, NV10_PFB_TSIZE(i)));
-		nv_wr32(dev, 0x00400900 + i * 0x10,
-					nv_rd32(dev, NV10_PFB_TILE(i)));
-			/* which is NV40_PGRAPH_TILE0(i) ?? */
-		nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0010 + i * 4);
-		nv_wr32(dev, NV10_PGRAPH_RDI_DATA,
-					nv_rd32(dev, NV10_PFB_TILE(i)));
-	}
+	/* Turn all the tiling regions off. */
+	for (i = 0; i < NV10_PFB_TILE__SIZE; i++)
+		nv20_graph_set_region_tiling(dev, i, 0, 0, 0);
+
 	for (i = 0; i < 8; i++) {
 		nv_wr32(dev, 0x400980 + i * 4, nv_rd32(dev, 0x100300 + i * 4));
 		nv_wr32(dev, NV10_PGRAPH_RDI_INDEX, 0x00EA0090 + i * 4);
@@ -704,18 +708,9 @@ nv30_graph_init(struct drm_device *dev)
 
 	nv_wr32(dev, 0x4000c0, 0x00000016);
 
-	/* copy tile info from PFB */
-	for (i = 0; i < NV10_PFB_TILE__SIZE; i++) {
-		nv_wr32(dev, 0x00400904 + i * 0x10,
-					nv_rd32(dev, NV10_PFB_TLIMIT(i)));
-			/* which is NV40_PGRAPH_TLIMIT0(i) ?? */
-		nv_wr32(dev, 0x00400908 + i * 0x10,
-					nv_rd32(dev, NV10_PFB_TSIZE(i)));
-			/* which is NV40_PGRAPH_TSIZE0(i) ?? */
-		nv_wr32(dev, 0x00400900 + i * 0x10,
-					nv_rd32(dev, NV10_PFB_TILE(i)));
-			/* which is NV40_PGRAPH_TILE0(i) ?? */
-	}
+	/* Turn all the tiling regions off. */
+	for (i = 0; i < NV10_PFB_TILE__SIZE; i++)
+		nv20_graph_set_region_tiling(dev, i, 0, 0, 0);
 
 	nv_wr32(dev, NV10_PGRAPH_CTX_CONTROL, 0x10000100);
 	nv_wr32(dev, NV10_PGRAPH_STATE      , 0xFFFFFFFF);
diff --git a/drivers/gpu/drm/nouveau/nv40_fb.c b/drivers/gpu/drm/nouveau/nv40_fb.c
index ca1d271..3cd07d8 100644
--- a/drivers/gpu/drm/nouveau/nv40_fb.c
+++ b/drivers/gpu/drm/nouveau/nv40_fb.c
@@ -3,12 +3,37 @@
 #include "nouveau_drv.h"
 #include "nouveau_drm.h"
 
+void
+nv40_fb_set_region_tiling(struct drm_device *dev, int i, uint32_t addr,
+			  uint32_t size, uint32_t pitch)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	uint32_t limit = max(1u, addr + size) - 1;
+
+	if (pitch)
+		addr |= 1;
+
+	switch (dev_priv->chipset) {
+	case 0x40:
+		nv_wr32(dev, NV10_PFB_TLIMIT(i), limit);
+		nv_wr32(dev, NV10_PFB_TSIZE(i), pitch);
+		nv_wr32(dev, NV10_PFB_TILE(i), addr);
+		break;
+
+	default:
+		nv_wr32(dev, NV40_PFB_TLIMIT(i), limit);
+		nv_wr32(dev, NV40_PFB_TSIZE(i), pitch);
+		nv_wr32(dev, NV40_PFB_TILE(i), addr);
+		break;
+	}
+}
+
 int
 nv40_fb_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	uint32_t fb_bar_size, tmp;
-	int num_tiles;
+	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
+	uint32_t tmp;
 	int i;
 
 	/* This is strictly a NV4x register (don't know about NV5x). */
@@ -23,35 +48,23 @@ nv40_fb_init(struct drm_device *dev)
 	case 0x45:
 		tmp = nv_rd32(dev, NV10_PFB_CLOSE_PAGE2);
 		nv_wr32(dev, NV10_PFB_CLOSE_PAGE2, tmp & ~(1 << 15));
-		num_tiles = NV10_PFB_TILE__SIZE;
+		pfb->num_tiles = NV10_PFB_TILE__SIZE;
 		break;
 	case 0x46: /* G72 */
 	case 0x47: /* G70 */
 	case 0x49: /* G71 */
 	case 0x4b: /* G73 */
 	case 0x4c: /* C51 (G7X version) */
-		num_tiles = NV40_PFB_TILE__SIZE_1;
+		pfb->num_tiles = NV40_PFB_TILE__SIZE_1;
 		break;
 	default:
-		num_tiles = NV40_PFB_TILE__SIZE_0;
+		pfb->num_tiles = NV40_PFB_TILE__SIZE_0;
 		break;
 	}
 
-	fb_bar_size = drm_get_resource_len(dev, 0) - 1;
-	switch (dev_priv->chipset) {
-	case 0x40:
-		for (i = 0; i < num_tiles; i++) {
-			nv_wr32(dev, NV10_PFB_TILE(i), 0);
-			nv_wr32(dev, NV10_PFB_TLIMIT(i), fb_bar_size);
-		}
-		break;
-	default:
-		for (i = 0; i < num_tiles; i++) {
-			nv_wr32(dev, NV40_PFB_TILE(i), 0);
-			nv_wr32(dev, NV40_PFB_TLIMIT(i), fb_bar_size);
-		}
-		break;
-	}
+	/* Turn all the tiling regions off. */
+	for (i = 0; i < pfb->num_tiles; i++)
+		pfb->set_region_tiling(dev, i, 0, 0, 0);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nv40_graph.c b/drivers/gpu/drm/nouveau/nv40_graph.c
index d3e0a2a..01773e3 100644
--- a/drivers/gpu/drm/nouveau/nv40_graph.c
+++ b/drivers/gpu/drm/nouveau/nv40_graph.c
@@ -333,6 +333,48 @@ nv40_grctx_vals_load(struct drm_device *dev, struct nouveau_gpuobj *ctx)
 		nv_wo32(dev, ctx, cv->data[i].offset, cv->data[i].value);
 }
 
+void
+nv40_graph_set_region_tiling(struct drm_device *dev, int i, uint32_t addr,
+			     uint32_t size, uint32_t pitch)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	uint32_t limit = max(1u, addr + size) - 1;
+
+	if (pitch)
+		addr |= 1;
+
+	switch (dev_priv->chipset) {
+	case 0x44:
+	case 0x4a:
+	case 0x4e:
+		nv_wr32(dev, NV20_PGRAPH_TSIZE(i), pitch);
+		nv_wr32(dev, NV20_PGRAPH_TLIMIT(i), limit);
+		nv_wr32(dev, NV20_PGRAPH_TILE(i), addr);
+		break;
+
+	case 0x46:
+	case 0x47:
+	case 0x49:
+	case 0x4b:
+		nv_wr32(dev, NV47_PGRAPH_TSIZE(i), pitch);
+		nv_wr32(dev, NV47_PGRAPH_TLIMIT(i), limit);
+		nv_wr32(dev, NV47_PGRAPH_TILE(i), addr);
+		nv_wr32(dev, NV40_PGRAPH_TSIZE1(i), pitch);
+		nv_wr32(dev, NV40_PGRAPH_TLIMIT1(i), limit);
+		nv_wr32(dev, NV40_PGRAPH_TILE1(i), addr);
+		break;
+
+	default:
+		nv_wr32(dev, NV20_PGRAPH_TSIZE(i), pitch);
+		nv_wr32(dev, NV20_PGRAPH_TLIMIT(i), limit);
+		nv_wr32(dev, NV20_PGRAPH_TILE(i), addr);
+		nv_wr32(dev, NV40_PGRAPH_TSIZE1(i), pitch);
+		nv_wr32(dev, NV40_PGRAPH_TLIMIT1(i), limit);
+		nv_wr32(dev, NV40_PGRAPH_TILE1(i), addr);
+		break;
+	}
+}
+
 /*
  * G70		0x47
  * G71		0x49
@@ -347,7 +389,8 @@ nv40_graph_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv =
 		(struct drm_nouveau_private *)dev->dev_private;
-	uint32_t vramsz, tmp;
+	struct nouveau_fb_engine *pfb = &dev_priv->engine.fb;
+	uint32_t vramsz;
 	int i, j;
 
 	nv_wr32(dev, NV03_PMC_ENABLE, nv_rd32(dev, NV03_PMC_ENABLE) &
@@ -425,74 +468,9 @@ nv40_graph_init(struct drm_device *dev)
 	nv_wr32(dev, 0x400b38, 0x2ffff800);
 	nv_wr32(dev, 0x400b3c, 0x00006000);
 
-	/* copy tile info from PFB */
-	switch (dev_priv->chipset) {
-	case 0x40: /* vanilla NV40 */
-		for (i = 0; i < NV10_PFB_TILE__SIZE; i++) {
-			tmp = nv_rd32(dev, NV10_PFB_TILE(i));
-			nv_wr32(dev, NV40_PGRAPH_TILE0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TILE1(i), tmp);
-			tmp = nv_rd32(dev, NV10_PFB_TLIMIT(i));
-			nv_wr32(dev, NV40_PGRAPH_TLIMIT0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TLIMIT1(i), tmp);
-			tmp = nv_rd32(dev, NV10_PFB_TSIZE(i));
-			nv_wr32(dev, NV40_PGRAPH_TSIZE0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TSIZE1(i), tmp);
-			tmp = nv_rd32(dev, NV10_PFB_TSTATUS(i));
-			nv_wr32(dev, NV40_PGRAPH_TSTATUS0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TSTATUS1(i), tmp);
-		}
-		break;
-	case 0x44:
-	case 0x4a:
-	case 0x4e: /* NV44-based cores don't have 0x406900? */
-		for (i = 0; i < NV40_PFB_TILE__SIZE_0; i++) {
-			tmp = nv_rd32(dev, NV40_PFB_TILE(i));
-			nv_wr32(dev, NV40_PGRAPH_TILE0(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TLIMIT(i));
-			nv_wr32(dev, NV40_PGRAPH_TLIMIT0(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TSIZE(i));
-			nv_wr32(dev, NV40_PGRAPH_TSIZE0(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TSTATUS(i));
-			nv_wr32(dev, NV40_PGRAPH_TSTATUS0(i), tmp);
-		}
-		break;
-	case 0x46:
-	case 0x47:
-	case 0x49:
-	case 0x4b: /* G7X-based cores */
-		for (i = 0; i < NV40_PFB_TILE__SIZE_1; i++) {
-			tmp = nv_rd32(dev, NV40_PFB_TILE(i));
-			nv_wr32(dev, NV47_PGRAPH_TILE0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TILE1(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TLIMIT(i));
-			nv_wr32(dev, NV47_PGRAPH_TLIMIT0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TLIMIT1(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TSIZE(i));
-			nv_wr32(dev, NV47_PGRAPH_TSIZE0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TSIZE1(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TSTATUS(i));
-			nv_wr32(dev, NV47_PGRAPH_TSTATUS0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TSTATUS1(i), tmp);
-		}
-		break;
-	default: /* everything else */
-		for (i = 0; i < NV40_PFB_TILE__SIZE_0; i++) {
-			tmp = nv_rd32(dev, NV40_PFB_TILE(i));
-			nv_wr32(dev, NV40_PGRAPH_TILE0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TILE1(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TLIMIT(i));
-			nv_wr32(dev, NV40_PGRAPH_TLIMIT0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TLIMIT1(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TSIZE(i));
-			nv_wr32(dev, NV40_PGRAPH_TSIZE0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TSIZE1(i), tmp);
-			tmp = nv_rd32(dev, NV40_PFB_TSTATUS(i));
-			nv_wr32(dev, NV40_PGRAPH_TSTATUS0(i), tmp);
-			nv_wr32(dev, NV40_PGRAPH_TSTATUS1(i), tmp);
-		}
-		break;
-	}
+	/* Turn all the tiling regions off. */
+	for (i = 0; i < pfb->num_tiles; i++)
+		nv40_graph_set_region_tiling(dev, i, 0, 0, 0);
 
 	/* begin RAM config */
 	vramsz = drm_get_resource_len(dev, 0) - 1;
-- 
1.6.4.4
