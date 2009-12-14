From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nv10: Add the initial graph context and soft
	methods needed for LMA.
Date: Mon, 14 Dec 2009 15:05:23 +0100
Message-ID: <1260799523-5220-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
 drivers/gpu/drm/nouveau/nv10_graph.c |  200 ++++++++++++++++++++++++++-------
 1 files changed, 157 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv10_graph.c b/drivers/gpu/drm/nouveau/nv10_graph.c
index 669ad9d..959a5ce 100644
--- a/drivers/gpu/drm/nouveau/nv10_graph.c
+++ b/drivers/gpu/drm/nouveau/nv10_graph.c
@@ -389,49 +389,50 @@ struct graph_state {
 	int nv10[ARRAY_SIZE(nv10_graph_ctx_regs)];
 	int nv17[ARRAY_SIZE(nv17_graph_ctx_regs)];
 	struct pipe_state pipe_state;
+	uint32_t lma_window[4];
 };
 
+#define PIPE_SAVE(dev, state, addr)					\
+	do {								\
+		int __i;						\
+		nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, addr);		\
+		for (__i = 0; __i < ARRAY_SIZE(state); __i++)		\
+			state[__i] = nv_rd32(dev, NV10_PGRAPH_PIPE_DATA); \
+	} while (0)
+
+#define PIPE_RESTORE(dev, state, addr)					\
+	do {								\
+		int __i;						\
+		nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, addr);		\
+		for (__i = 0; __i < ARRAY_SIZE(state); __i++)		\
+			nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, state[__i]); \
+	} while (0)
+
 static void nv10_graph_save_pipe(struct nouveau_channel *chan)
 {
 	struct drm_device *dev = chan->dev;
 	struct graph_state *pgraph_ctx = chan->pgraph_ctx;
-	struct pipe_state *fifo_pipe_state = &pgraph_ctx->pipe_state;
-	int i;
-#define PIPE_SAVE(addr) \
-	do { \
-		nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, addr); \
-		for (i = 0; i < ARRAY_SIZE(fifo_pipe_state->pipe_##addr); i++) \
-			fifo_pipe_state->pipe_##addr[i] = nv_rd32(dev, NV10_PGRAPH_PIPE_DATA); \
-	} while (0)
-
-	PIPE_SAVE(0x4400);
-	PIPE_SAVE(0x0200);
-	PIPE_SAVE(0x6400);
-	PIPE_SAVE(0x6800);
-	PIPE_SAVE(0x6c00);
-	PIPE_SAVE(0x7000);
-	PIPE_SAVE(0x7400);
-	PIPE_SAVE(0x7800);
-	PIPE_SAVE(0x0040);
-	PIPE_SAVE(0x0000);
-
-#undef PIPE_SAVE
+	struct pipe_state *pipe = &pgraph_ctx->pipe_state;
+
+	PIPE_SAVE(dev, pipe->pipe_0x4400, 0x4400);
+	PIPE_SAVE(dev, pipe->pipe_0x0200, 0x0200);
+	PIPE_SAVE(dev, pipe->pipe_0x6400, 0x6400);
+	PIPE_SAVE(dev, pipe->pipe_0x6800, 0x6800);
+	PIPE_SAVE(dev, pipe->pipe_0x6c00, 0x6c00);
+	PIPE_SAVE(dev, pipe->pipe_0x7000, 0x7000);
+	PIPE_SAVE(dev, pipe->pipe_0x7400, 0x7400);
+	PIPE_SAVE(dev, pipe->pipe_0x7800, 0x7800);
+	PIPE_SAVE(dev, pipe->pipe_0x0040, 0x0040);
+	PIPE_SAVE(dev, pipe->pipe_0x0000, 0x0000);
 }
 
 static void nv10_graph_load_pipe(struct nouveau_channel *chan)
 {
 	struct drm_device *dev = chan->dev;
 	struct graph_state *pgraph_ctx = chan->pgraph_ctx;
-	struct pipe_state *fifo_pipe_state = &pgraph_ctx->pipe_state;
-	int i;
+	struct pipe_state *pipe = &pgraph_ctx->pipe_state;
 	uint32_t xfmode0, xfmode1;
-#define PIPE_RESTORE(addr) \
-	do { \
-		nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, addr); \
-		for (i = 0; i < ARRAY_SIZE(fifo_pipe_state->pipe_##addr); i++) \
-			nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, fifo_pipe_state->pipe_##addr[i]); \
-	} while (0)
-
+	int i;
 
 	nouveau_wait_for_idle(dev);
 	/* XXX check haiku comments */
@@ -457,24 +458,22 @@ static void nv10_graph_load_pipe(struct nouveau_channel *chan)
 	nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x00000008);
 
 
-	PIPE_RESTORE(0x0200);
+	PIPE_RESTORE(dev, pipe->pipe_0x0200, 0x0200);
 	nouveau_wait_for_idle(dev);
 
 	/* restore XFMODE */
 	nv_wr32(dev, NV10_PGRAPH_XFMODE0, xfmode0);
 	nv_wr32(dev, NV10_PGRAPH_XFMODE1, xfmode1);
-	PIPE_RESTORE(0x6400);
-	PIPE_RESTORE(0x6800);
-	PIPE_RESTORE(0x6c00);
-	PIPE_RESTORE(0x7000);
-	PIPE_RESTORE(0x7400);
-	PIPE_RESTORE(0x7800);
-	PIPE_RESTORE(0x4400);
-	PIPE_RESTORE(0x0000);
-	PIPE_RESTORE(0x0040);
+	PIPE_RESTORE(dev, pipe->pipe_0x6400, 0x6400);
+	PIPE_RESTORE(dev, pipe->pipe_0x6800, 0x6800);
+	PIPE_RESTORE(dev, pipe->pipe_0x6c00, 0x6c00);
+	PIPE_RESTORE(dev, pipe->pipe_0x7000, 0x7000);
+	PIPE_RESTORE(dev, pipe->pipe_0x7400, 0x7400);
+	PIPE_RESTORE(dev, pipe->pipe_0x7800, 0x7800);
+	PIPE_RESTORE(dev, pipe->pipe_0x4400, 0x4400);
+	PIPE_RESTORE(dev, pipe->pipe_0x0000, 0x0000);
+	PIPE_RESTORE(dev, pipe->pipe_0x0040, 0x0040);
 	nouveau_wait_for_idle(dev);
-
-#undef PIPE_RESTORE
 }
 
 static void nv10_graph_create_pipe(struct nouveau_channel *chan)
@@ -846,6 +845,9 @@ int nv10_graph_init(struct drm_device *dev)
 				      (1<<31));
 	if (dev_priv->chipset >= 0x17) {
 		nv_wr32(dev, NV10_PGRAPH_DEBUG_4, 0x1f000000);
+		nv_wr32(dev, 0x400a10, 0x3ff3fb6);
+		nv_wr32(dev, 0x400838, 0x2f8684);
+		nv_wr32(dev, 0x40083c, 0x115f3f);
 		nv_wr32(dev, 0x004006b0, 0x40000020);
 	} else
 		nv_wr32(dev, NV10_PGRAPH_DEBUG_4, 0x00000000);
@@ -873,6 +875,118 @@ void nv10_graph_takedown(struct drm_device *dev)
 {
 }
 
+static int
+nv17_graph_mthd_lma_window(struct nouveau_channel *chan, int grclass,
+			   int mthd, uint32_t data)
+{
+	struct drm_device *dev = chan->dev;
+	struct graph_state *ctx = chan->pgraph_ctx;
+	struct pipe_state *pipe = &ctx->pipe_state;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pgraph_engine *pgraph = &dev_priv->engine.graph;
+	uint32_t pipe_0x64c0[8], pipe_0x6a80[3], pipe_0x6ab0[3];
+	uint32_t xfmode0, xfmode1;
+	int i;
+
+	ctx->lma_window[(mthd - 0x1638) / 4] = data;
+
+	if (mthd != 0x1644)
+		return 0;
+
+	nouveau_wait_for_idle(dev);
+
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x00000040);
+	pipe->pipe_0x0040[0] = nv_rd32(dev, NV10_PGRAPH_PIPE_DATA);
+
+	PIPE_SAVE(dev, pipe->pipe_0x0200, 0x0200);
+
+	PIPE_RESTORE(dev, ctx->lma_window, 0x6790);
+
+	nouveau_wait_for_idle(dev);
+
+	xfmode0 = nv_rd32(dev, NV10_PGRAPH_XFMODE0);
+	xfmode1 = nv_rd32(dev, NV10_PGRAPH_XFMODE1);
+
+	PIPE_SAVE(dev, pipe->pipe_0x4400, 0x4400);
+	PIPE_SAVE(dev, pipe_0x64c0, 0x64c0);
+	PIPE_SAVE(dev, pipe_0x6ab0, 0x6ab0);
+	PIPE_SAVE(dev, pipe_0x6a80, 0x6a80);
+
+	nouveau_wait_for_idle(dev);
+
+	nv_wr32(dev, NV10_PGRAPH_XFMODE0, 0x10000000);
+	nv_wr32(dev, NV10_PGRAPH_XFMODE1, 0x00000000);
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x000064c0);
+	for (i = 0; i < 4; i++)
+		nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x3f800000);
+	for (i = 0; i < 4; i++)
+		nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x00000000);
+
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x00006ab0);
+	for (i = 0; i < 3; i++)
+		nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x3f800000);
+
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x00006a80);
+	for (i = 0; i < 3; i++)
+		nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x00000000);
+
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x00000040);
+	nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x00000008);
+
+	PIPE_RESTORE(dev, pipe->pipe_0x0200, 0x0200);
+
+	nouveau_wait_for_idle(dev);
+
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x00000040);
+	nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, pipe->pipe_0x0040[0]);
+
+	nv_wr32(dev, NV10_PGRAPH_XFMODE0, xfmode0);
+	nv_wr32(dev, NV10_PGRAPH_XFMODE1, xfmode1);
+
+	PIPE_RESTORE(dev, pipe_0x64c0, 0x64c0);
+	PIPE_RESTORE(dev, pipe_0x6ab0, 0x6ab0);
+	PIPE_RESTORE(dev, pipe_0x6a80, 0x6a80);
+	PIPE_RESTORE(dev, pipe->pipe_0x4400, 0x4400);
+
+	nv_wr32(dev, NV10_PGRAPH_PIPE_ADDRESS, 0x000000c0);
+	nv_wr32(dev, NV10_PGRAPH_PIPE_DATA, 0x00000000);
+
+	nouveau_wait_for_idle(dev);
+
+	pgraph->fifo_access(dev, true);
+
+	return 0;
+}
+
+static int
+nv17_graph_mthd_lma_enable(struct nouveau_channel *chan, int grclass,
+			   int mthd, uint32_t data)
+{
+	struct drm_device *dev = chan->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pgraph_engine *pgraph = &dev_priv->engine.graph;
+
+	nouveau_wait_for_idle(dev);
+
+	nv_wr32(dev, NV10_PGRAPH_DEBUG_4,
+		nv_rd32(dev, NV10_PGRAPH_DEBUG_4) | 0x1 << 8);
+	nv_wr32(dev, 0x004006b0,
+		nv_rd32(dev, 0x004006b0) | 0x8 << 24);
+
+	pgraph->fifo_access(dev, true);
+
+	return 0;
+}
+
+static struct nouveau_pgraph_object_method nv17_graph_celsius_mthds[] = {
+	{ 0x1638, nv17_graph_mthd_lma_window },
+	{ 0x163c, nv17_graph_mthd_lma_window },
+	{ 0x1640, nv17_graph_mthd_lma_window },
+	{ 0x1644, nv17_graph_mthd_lma_window },
+	{ 0x1658, nv17_graph_mthd_lma_enable },
+	{}
+};
+
 struct nouveau_pgraph_object_class nv10_graph_grclass[] = {
 	{ 0x0030, false, NULL }, /* null */
 	{ 0x0039, false, NULL }, /* m2mf */
@@ -893,6 +1007,6 @@ struct nouveau_pgraph_object_class nv10_graph_grclass[] = {
 	{ 0x0095, false, NULL }, /* multitex_tri */
 	{ 0x0056, false, NULL }, /* celcius (nv10) */
 	{ 0x0096, false, NULL }, /* celcius (nv11) */
-	{ 0x0099, false, NULL }, /* celcius (nv17) */
+	{ 0x0099, false, nv17_graph_celsius_mthds }, /* celcius (nv17) */
 	{}
 };
-- 
1.6.4.4
