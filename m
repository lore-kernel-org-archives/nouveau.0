From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] nouveau: Fix checkpatch.pl messages
Date: Sat, 19 Mar 2011 23:31:52 +0000
Message-ID: <1300577514-6833-3-git-send-email-emil.l.velikov@gmail.com>
References: <1300577514-6833-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300577514-6833-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Fix 'ERROR: trailing whitespace',
Fix 'ERROR: do not use C99 // comments'

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_state.c |    2 +-
 drivers/gpu/drm/nouveau/nv04_graph.c    |    2 +-
 drivers/gpu/drm/nouveau/nv50_grctx.c    |    2 +-
 drivers/gpu/drm/nouveau/nvc0_graph.c    |   50 ++++++++++++++++---------------
 drivers/gpu/drm/nouveau/nvc0_graph.h    |    6 ++--
 drivers/gpu/drm/nouveau/nvc0_grctx.c    |   16 +++++-----
 6 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 9582165..e162514 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -870,7 +870,7 @@ static int nouveau_remove_conflicting_drivers(struct drm_device *dev)
 #ifdef CONFIG_X86
 	primary = dev->pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
 #endif
-	
+
 	remove_conflicting_framebuffers(dev_priv->apertures, "nouveaufb", primary);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nv04_graph.c b/drivers/gpu/drm/nouveau/nv04_graph.c
index af75015..c624ae9 100644
--- a/drivers/gpu/drm/nouveau/nv04_graph.c
+++ b/drivers/gpu/drm/nouveau/nv04_graph.c
@@ -507,7 +507,7 @@ int nv04_graph_init(struct drm_device *dev)
 	nv_wr32(dev, NV04_PGRAPH_DEBUG_0, 0x001FFFFF);*/
 	nv_wr32(dev, NV04_PGRAPH_DEBUG_0, 0x1231c000);
 	/*1231C000 blob, 001 haiku*/
-	//*V_WRITE(NV04_PGRAPH_DEBUG_1, 0xf2d91100);*/
+	/*V_WRITE(NV04_PGRAPH_DEBUG_1, 0xf2d91100);*/
 	nv_wr32(dev, NV04_PGRAPH_DEBUG_1, 0x72111100);
 	/*0x72111100 blob , 01 haiku*/
 	/*nv_wr32(dev, NV04_PGRAPH_DEBUG_2, 0x11d5f870);*/
diff --git a/drivers/gpu/drm/nouveau/nv50_grctx.c b/drivers/gpu/drm/nouveau/nv50_grctx.c
index 9d1f6ba..871a6d8 100644
--- a/drivers/gpu/drm/nouveau/nv50_grctx.c
+++ b/drivers/gpu/drm/nouveau/nv50_grctx.c
@@ -925,7 +925,7 @@ nv50_graph_construct_mmio_ddata(struct nouveau_grctx *ctx)
 		dd_emit(ctx, 1, 0);	/* 0000007f MULTISAMPLE_SAMPLES_LOG2 */
 	} else {
 		dd_emit(ctx, 1, 0);	/* 0000000f MULTISAMPLE_SAMPLES_LOG2 */
-	} 
+	}
 	dd_emit(ctx, 1, 0xc);		/* 000000ff SEMANTIC_COLOR.BFC0_ID */
 	if (dev_priv->chipset != 0x50)
 		dd_emit(ctx, 1, 0);	/* 00000001 SEMANTIC_COLOR.CLMP_EN */
diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.c b/drivers/gpu/drm/nouveau/nvc0_graph.c
index c19ff30..68f5c3f 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.c
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.c
@@ -452,28 +452,30 @@ nvc0_graph_init_gpc_0(struct drm_device *dev)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nvc0_graph_priv *priv = dev_priv->engine.graph.priv;
 	int gpc;
-	
-	//      TP      ROP UNKVAL(magic_not_rop_nr)
-	// 450: 4/0/0/0 2        3
-	// 460: 3/4/0/0 4        1
-	// 465: 3/4/4/0 4        7
-	// 470: 3/3/4/4 5        5
-	// 480: 3/4/4/4 6        6
-
-	// magicgpc918
-	// 450: 00200000 00000000001000000000000000000000
-	// 460: 00124925 00000000000100100100100100100101
-	// 465: 000ba2e9 00000000000010111010001011101001
-	// 470: 00092493 00000000000010010010010010010011
-	// 480: 00088889 00000000000010001000100010001001
-
-	/* filled values up to tp_total, remainder 0 */
-	// 450: 00003210 00000000 00000000 00000000
-	// 460: 02321100 00000000 00000000 00000000
-	// 465: 22111000 00000233 00000000 00000000
-	// 470: 11110000 00233222 00000000 00000000
-	// 480: 11110000 03332222 00000000 00000000
-	
+
+	/*
+	 *      TP      ROP UNKVAL(magic_not_rop_nr)
+	 * 450: 4/0/0/0 2        3
+	 * 460: 3/4/0/0 4        1
+	 * 465: 3/4/4/0 4        7
+	 * 470: 3/3/4/4 5        5
+	 * 480: 3/4/4/4 6        6
+
+	 * magicgpc918
+	 * 450: 00200000 00000000001000000000000000000000
+	 * 460: 00124925 00000000000100100100100100100101
+	 * 465: 000ba2e9 00000000000010111010001011101001
+	 * 470: 00092493 00000000000010010010010010010011
+	 * 480: 00088889 00000000000010001000100010001001
+
+	 * filled values up to tp_total, remainder 0
+	 * 450: 00003210 00000000 00000000 00000000
+	 * 460: 02321100 00000000 00000000 00000000
+	 * 465: 22111000 00000233 00000000 00000000
+	 * 470: 11110000 00233222 00000000 00000000
+	 * 480: 11110000 03332222 00000000 00000000
+	 */
+
 	nv_wr32(dev, GPC_BCAST(0x0980), priv->magicgpc980[0]);
 	nv_wr32(dev, GPC_BCAST(0x0984), priv->magicgpc980[1]);
 	nv_wr32(dev, GPC_BCAST(0x0988), priv->magicgpc980[2]);
@@ -676,9 +678,9 @@ nvc0_graph_init(struct drm_device *dev)
 
 	nvc0_graph_init_obj418880(dev);
 	nvc0_graph_init_regs(dev);
-	//nvc0_graph_init_unitplemented_magics(dev);
+	/*nvc0_graph_init_unitplemented_magics(dev);*/
 	nvc0_graph_init_gpc_0(dev);
-	//nvc0_graph_init_unitplemented_c242(dev);
+	/*nvc0_graph_init_unitplemented_c242(dev);*/
 
 	nv_wr32(dev, 0x400500, 0x00010001);
 	nv_wr32(dev, 0x400100, 0xffffffff);
diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.h b/drivers/gpu/drm/nouveau/nvc0_graph.h
index 40e26f9..93c8777 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.h
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.h
@@ -52,9 +52,9 @@ struct nvc0_graph_priv {
 
 struct nvc0_graph_chan {
 	struct nouveau_gpuobj *grctx;
-	struct nouveau_gpuobj *unk408004; // 0x418810 too
-	struct nouveau_gpuobj *unk40800c; // 0x419004 too
-	struct nouveau_gpuobj *unk418810; // 0x419848 too
+	struct nouveau_gpuobj *unk408004; /* 0x418810 too */
+	struct nouveau_gpuobj *unk40800c; /* 0x419004 too */
+	struct nouveau_gpuobj *unk418810; /* 0x419848 too */
 	struct nouveau_gpuobj *mmio;
 	int mmio_nr;
 };
diff --git a/drivers/gpu/drm/nouveau/nvc0_grctx.c b/drivers/gpu/drm/nouveau/nvc0_grctx.c
index 7aa0cbf..da267da 100644
--- a/drivers/gpu/drm/nouveau/nvc0_grctx.c
+++ b/drivers/gpu/drm/nouveau/nvc0_grctx.c
@@ -1625,7 +1625,7 @@ nvc0_grctx_generate_rop(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	// ROPC_BROADCAST
+	/* ROPC_BROADCAST */
 	nv_wr32(dev, 0x408800, 0x02802a3c);
 	nv_wr32(dev, 0x408804, 0x00000040);
 	nv_wr32(dev, 0x408808, 0x0003e00d);
@@ -1649,7 +1649,7 @@ nvc0_grctx_generate_gpc(struct drm_device *dev)
 {
 	int i;
 
-	// GPC_BROADCAST
+	/* GPC_BROADCAST */
 	nv_wr32(dev, 0x418380, 0x00000016);
 	nv_wr32(dev, 0x418400, 0x38004e00);
 	nv_wr32(dev, 0x418404, 0x71e0ffff);
@@ -1730,7 +1730,7 @@ nvc0_grctx_generate_tp(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	// GPC_BROADCAST.TP_BROADCAST
+	/* GPC_BROADCAST.TP_BROADCAST */
 	nv_wr32(dev, 0x419848, 0x00000000);
 	nv_wr32(dev, 0x419864, 0x0000012a);
 	nv_wr32(dev, 0x419888, 0x00000000);
@@ -1743,7 +1743,7 @@ nvc0_grctx_generate_tp(struct drm_device *dev)
 	nv_wr32(dev, 0x419a1c, 0x00000000);
 	nv_wr32(dev, 0x419a20, 0x00000800);
 	if (dev_priv->chipset != 0xc0)
-		nv_wr32(dev, 0x00419ac4, 0x0007f440); // 0xc3
+		nv_wr32(dev, 0x00419ac4, 0x0007f440); /* 0xc3 */
 	nv_wr32(dev, 0x419b00, 0x0a418820);
 	nv_wr32(dev, 0x419b04, 0x062080e6);
 	nv_wr32(dev, 0x419b08, 0x020398a4);
@@ -1914,13 +1914,13 @@ nvc0_grctx_generate(struct nouveau_channel *chan)
 		for (i = 1; i < 7; i++)
 			data2[1] |= ((1 << (i + 5)) % ntpcv) << ((i - 1) * 5);
 
-		// GPC_BROADCAST
+		/* GPC_BROADCAST */
 		nv_wr32(dev, 0x418bb8, (priv->tp_total << 8) |
 					priv->magic_not_rop_nr);
 		for (i = 0; i < 6; i++)
 			nv_wr32(dev, 0x418b08 + (i * 4), data[i]);
 
-		// GPC_BROADCAST.TP_BROADCAST
+		/* GPC_BROADCAST.TP_BROADCAST */
 		nv_wr32(dev, 0x419bd0, (priv->tp_total << 8) |
 				       priv->magic_not_rop_nr |
 				       data2[0]);
@@ -1928,7 +1928,7 @@ nvc0_grctx_generate(struct nouveau_channel *chan)
 		for (i = 0; i < 6; i++)
 			nv_wr32(dev, 0x419b00 + (i * 4), data[i]);
 
-		// UNK78xx
+		/* UNK78xx */
 		nv_wr32(dev, 0x4078bc, (priv->tp_total << 8) |
 					priv->magic_not_rop_nr);
 		for (i = 0; i < 6; i++)
@@ -1946,7 +1946,7 @@ nvc0_grctx_generate(struct nouveau_channel *chan)
 		gpc = -1;
 		for (i = 0, gpc = -1; i < 32; i++) {
 			int ltp = i * (priv->tp_total - 1) / 32;
-			
+
 			do {
 				gpc = (gpc + 1) % priv->gpc_nr;
 			} while (!tpnr[gpc]);
-- 
1.7.1
