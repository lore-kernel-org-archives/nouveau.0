From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: raise reporting levels of some
	messages
Date: Sun, 25 Nov 2012 23:00:57 +0100
Message-ID: <20121125220057.GB13248@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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


Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c  | 10 +++++-----
 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  |  2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nv20.c |  4 ++--
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c |  2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c |  6 +++---
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
index 1147aec..2fe14da3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
@@ -440,7 +440,7 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 			}
 
 			if (!nv04_fifo_swmthd(priv, chid, mthd, data)) {
-				nv_info(priv, "CACHE_ERROR - Ch %d/%d "
+				nv_error(priv, "CACHE_ERROR - Ch %d/%d "
 					      "Mthd 0x%04x Data 0x%08x\n",
 					chid, (mthd >> 13) & 7, mthd & 0x1ffc,
 					data);
@@ -476,7 +476,7 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 				u32 ib_get = nv_rd32(priv, 0x003334);
 				u32 ib_put = nv_rd32(priv, 0x003330);
 
-				nv_info(priv, "DMA_PUSHER - Ch %d Get 0x%02x%08x "
+				nv_error(priv, "DMA_PUSHER - Ch %d Get 0x%02x%08x "
 				     "Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x "
 				     "State 0x%08x (err: %s) Push 0x%08x\n",
 					chid, ho_get, dma_get, ho_put,
@@ -494,7 +494,7 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 					nv_wr32(priv, 0x003334, ib_put);
 				}
 			} else {
-				nv_info(priv, "DMA_PUSHER - Ch %d Get 0x%08x "
+				nv_error(priv, "DMA_PUSHER - Ch %d Get 0x%08x "
 					     "Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
 					chid, dma_get, dma_put, state,
 					nv_dma_state_err(state), push);
@@ -531,7 +531,7 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 		}
 
 		if (status) {
-			nv_info(priv, "unknown intr 0x%08x, ch %d\n",
+			nv_warn(priv, "unknown intr 0x%08x, ch %d\n",
 				status, chid);
 			nv_wr32(priv, NV03_PFIFO_INTR_0, status);
 			status = 0;
@@ -541,7 +541,7 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 	}
 
 	if (status) {
-		nv_info(priv, "still angry after %d spins, halt\n", cnt);
+		nv_error(priv, "still angry after %d spins, halt\n", cnt);
 		nv_wr32(priv, 0x002140, 0);
 		nv_wr32(priv, 0x000140, 0);
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
index d7c3f3e..ec60bc1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
@@ -503,7 +503,7 @@ nvc0_fifo_intr(struct nouveau_subdev *subdev)
 	u32 stat = nv_rd32(priv, 0x002100) & mask;
 
 	if (stat & 0x00000100) {
-		nv_info(priv, "unknown status 0x00000100\n");
+		nv_warn(priv, "unknown status 0x00000100\n");
 		nv_wr32(priv, 0x002100, 0x00000100);
 		stat &= ~0x00000100;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
index e45eded..5b20401 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
@@ -224,14 +224,14 @@ nv20_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, NV04_PGRAPH_FIFO, 0x00000001);
 
 	if (show) {
-		nv_info(priv, "");
+		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
 		printk(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
 		printk(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
 		printk("\n");
-		nv_info(priv, "ch %d/%d class 0x%04x mthd 0x%04x data 0x%08x\n",
+		nv_error(priv, "ch %d/%d class 0x%04x mthd 0x%04x data 0x%08x\n",
 			chid, subc, class, mthd, data);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
index 0052f09..0b36dd3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -321,7 +321,7 @@ nv40_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, NV04_PGRAPH_FIFO, 0x00000001);
 
 	if (show) {
-		nv_info(priv, "");
+		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
 		printk(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 07ca12f..b1c3d83 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -521,13 +521,13 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
 		}
 		if (ustatus) {
 			if (display)
-				nv_info(priv, "%s - TP%d: Unhandled ustatus 0x%08x\n", name, i, ustatus);
+				nv_error(priv, "%s - TP%d: Unhandled ustatus 0x%08x\n", name, i, ustatus);
 		}
 		nv_wr32(priv, ustatus_addr, 0xc0000000);
 	}
 
 	if (!tps && display)
-		nv_info(priv, "%s - No TPs claiming errors?\n", name);
+		nv_warn(priv, "%s - No TPs claiming errors?\n", name);
 }
 
 static int
@@ -786,7 +786,7 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, 0x400500, 0x00010001);
 
 	if (show) {
-		nv_info(priv, "");
+		nv_error(priv, "");
 		nouveau_bitfield_print(nv50_graph_intr_name, show);
 		printk("\n");
 		nv_error(priv, "ch %d [0x%010llx] subc %d class 0x%04x "
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index c62f2d0..47a0208 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -814,7 +814,7 @@ nvc0_graph_init_ctxctl(struct nvc0_graph_priv *priv)
 		nv_wr32(priv, 0x41a100, 0x00000002);
 		nv_wr32(priv, 0x409100, 0x00000002);
 		if (!nv_wait(priv, 0x409800, 0x00000001, 0x00000001))
-			nv_info(priv, "0x409800 wait failed\n");
+			nv_warn(priv, "0x409800 wait failed\n");
 
 		nv_wr32(priv, 0x409840, 0xffffffff);
 		nv_wr32(priv, 0x409500, 0x7fffffff);
-- 
1.7.12
