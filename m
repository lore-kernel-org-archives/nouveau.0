From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/10] drm/nouveau: guard nv_error && printk pairs
	with nv_printk_enabled
Date: Sun, 19 Aug 2012 22:59:58 +0200
Message-ID: <1345410004-27729-3-git-send-email-marcin.slusarz@gmail.com>
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
List-Id: nouveau.vger.kernel.org

With CONFIG_NOUVEAU_DEBUG set to 0 or subdev debug flags set to 0 code paths
which use nv_error and printk would print awkwardly formatted data.

Guard those code paths with nv_printk_enabled.

Additionally, fix reporting levels of: nv20_graph_intr, nv40_graph_intr
and nv50_graph_intr.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/copy/nva3.c  |    4 +++-
 drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c  |    4 +++-
 drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c |    2 +-
 drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c |    4 +++-
 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  |    5 ++++-
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c  |    5 ++++-
 drivers/gpu/drm/nouveau/core/engine/graph/nv04.c |    2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nv10.c |    2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nv20.c |    6 +++---
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c |    4 ++--
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c |   21 ++++++++++++---------
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c |    4 +++-
 drivers/gpu/drm/nouveau/core/engine/graph/nve0.c |    4 +++-
 drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c    |    2 +-
 drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c   |    2 +-
 15 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c b/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
index c43c334..fd4ea19 100644
--- a/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
@@ -120,11 +120,13 @@ nva3_copy_intr(struct nouveau_subdev *subdev)
 	engctx = nouveau_engctx_get(engine, inst);
 	chid   = pfifo->chid(pfifo, engctx);
 
-	if (stat & 0x00000040) {
+	if ((stat & 0x00000040) && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "DISPATCH_ERROR [");
 		nouveau_enum_print(nva3_copy_isr_error_name, ssta);
 		printk("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
 		       chid, inst << 12, subc, mthd, data);
+	}
+	if (stat & 0x00000040) {
 		nv_wr32(priv, 0x104004, 0x00000040);
 		stat &= ~0x00000040;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c
index 3071e2c..6835d7d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c
@@ -133,11 +133,13 @@ nvc0_copy_intr(struct nouveau_subdev *subdev)
 	engctx = nouveau_engctx_get(engine, inst);
 	chid   = pfifo->chid(pfifo, engctx);
 
-	if (stat & 0x00000040) {
+	if ((stat & 0x00000040) && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "DISPATCH_ERROR [");
 		nouveau_enum_print(nvc0_copy_isr_error_name, ssta);
 		printk("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
 		       chid, (u64)inst << 12, subc, mthd, data);
+	}
+	if (stat & 0x00000040) {
 		nv_wr32(priv, 0x104004 + (idx * 0x1000), 0x00000040);
 		stat &= ~0x00000040;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c b/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
index 198989b..67622aa 100644
--- a/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
@@ -147,7 +147,7 @@ nv84_crypt_intr(struct nouveau_subdev *subdev)
 	engctx = nouveau_engctx_get(engine, inst);
 	chid   = pfifo->chid(pfifo, engctx);
 
-	if (stat) {
+	if (stat && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv84_crypt_intr_mask, stat);
 		printk(" ch %d [0x%010llx] mthd 0x%04x data 0x%08x\n",
diff --git a/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c b/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
index 835b8eb..9a589d3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
@@ -120,11 +120,13 @@ nv98_crypt_intr(struct nouveau_subdev *subdev)
 	engctx = nouveau_engctx_get(engine, inst);
 	chid   = pfifo->chid(pfifo, engctx);
 
-	if (stat & 0x00000040) {
+	if ((stat & 0x00000040) && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "DISPATCH_ERROR [");
 		nouveau_enum_print(nv98_crypt_isr_error_name, ssta);
 		printk("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
 		       chid, (u64)inst << 12, subc, mthd, data);
+	}
+	if (stat & 0x00000040) {
 		nv_wr32(priv, 0x087004, 0x00000040);
 		stat &= ~0x00000040;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
index 42276d9..31f5a96 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
@@ -395,6 +395,9 @@ nvc0_fifo_isr_vm_fault(struct nvc0_fifo_priv *priv, int unit)
 	u32 stat = nv_rd32(priv, 0x280c + (unit * 0x10));
 	u32 client = (stat & 0x00001f00) >> 8;
 
+	if (!nv_printk_enabled(priv, ERROR))
+		return;
+
 	nv_error(priv, "%s fault at 0x%010llx [", (stat & 0x00000080) ?
 		 "write" : "read", (u64)vahi << 32 | valo);
 	nouveau_enum_print(nvc0_fifo_fault_reason, stat & 0x0000000f);
@@ -459,7 +462,7 @@ nvc0_fifo_isr_subfifo_intr(struct nvc0_fifo_priv *priv, int unit)
 			show &= ~0x00800000;
 	}
 
-	if (show) {
+	if (show && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "SUBFIFO%d:", unit);
 		nouveau_bitfield_print(nvc0_fifo_subfifo_intr, show);
 		printk("\n");
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
index 945038c..b2612b0 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
@@ -408,6 +408,9 @@ nve0_fifo_isr_vm_fault(struct nve0_fifo_priv *priv, int unit)
 	u32 stat = nv_rd32(priv, 0x280c + (unit * 0x10));
 	u32 client = (stat & 0x00001f00) >> 8;
 
+	if (!nv_printk_enabled(priv, ERROR))
+		return;
+
 	nv_error(priv, "PFIFO: %s fault at 0x%010llx [", (stat & 0x00000080) ?
 		       "write" : "read", (u64)vahi << 32 | valo);
 	nouveau_enum_print(nve0_fifo_fault_reason, stat & 0x0000000f);
@@ -472,7 +475,7 @@ nve0_fifo_isr_subfifo_intr(struct nve0_fifo_priv *priv, int unit)
 			show &= ~0x00800000;
 	}
 
-	if (show) {
+	if (show && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "SUBFIFO%d:", unit);
 		nouveau_bitfield_print(nve0_fifo_subfifo_intr, show);
 		printk("\n");
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
index e5b0189..267ac60 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
@@ -1296,7 +1296,7 @@ nv04_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, NV03_PGRAPH_INTR, stat);
 	nv_wr32(priv, NV04_PGRAPH_FIFO, 0x00000001);
 
-	if (show) {
+	if (show && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv04_graph_intr_name, show);
 		printk(" nsource:");
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
index ce38196..35c4d71 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
@@ -1192,7 +1192,7 @@ nv10_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, NV03_PGRAPH_INTR, stat);
 	nv_wr32(priv, NV04_PGRAPH_FIFO, 0x00000001);
 
-	if (show) {
+	if (show && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
 		printk(" nsource:");
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
index 8f3f619..9e756e1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
@@ -223,15 +223,15 @@ nv20_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, NV03_PGRAPH_INTR, stat);
 	nv_wr32(priv, NV04_PGRAPH_FIFO, 0x00000001);
 
-	if (show) {
-		nv_info(priv, "");
+	if (show && nv_printk_enabled(priv, ERROR)) {
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
index 5690fe3..7817f53 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -292,8 +292,8 @@ nv40_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, NV03_PGRAPH_INTR, stat);
 	nv_wr32(priv, NV04_PGRAPH_FIFO, 0x00000001);
 
-	if (show) {
-		nv_info(priv, "");
+	if (show && nv_printk_enabled(priv, ERROR)) {
+		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
 		printk(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index f60aec9..6859514 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -274,7 +274,7 @@ nv84_graph_tlb_flush(struct nouveau_engine *engine)
 	} while (!idle &&
 		 !(timeout = ptimer->read(ptimer) - start > 2000000000));
 
-	if (timeout) {
+	if (timeout && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "PGRAPH TLB flush idle timeout fail\n");
 
 		nv_error(priv, "PGRAPH_STATUS: ");
@@ -417,6 +417,8 @@ nv50_priv_mp_trap(struct nv50_graph_priv *priv, int tpid, int display)
 			pc = nv_rd32(priv, addr + 0x24);
 			oplow = nv_rd32(priv, addr + 0x70);
 			ophigh = nv_rd32(priv, addr + 0x74);
+		}
+		if (display && nv_printk_enabled(priv, ERROR)) {
 			nv_error(priv, "TRAP_MP_EXEC - "
 					"TP %d MP %d: ", tpid, i);
 			nouveau_enum_print(nv50_mp_exec_error_names, status);
@@ -622,7 +624,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 	/* M2MF: Memory to memory copy engine. */
 	if (status & 0x002) {
 		u32 ustatus = nv_rd32(priv, 0x406800) & 0x7fffffff;
-		if (display) {
+		if (display && nv_printk_enabled(priv, ERROR)) {
 			nv_error(priv, "TRAP_M2MF");
 			nouveau_bitfield_print(nv50_graph_trap_m2mf, ustatus);
 			printk("\n");
@@ -643,7 +645,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 	/* VFETCH: Fetches data from vertex buffers. */
 	if (status & 0x004) {
 		u32 ustatus = nv_rd32(priv, 0x400c04) & 0x7fffffff;
-		if (display) {
+		if (display && nv_printk_enabled(priv, ERROR)) {
 			nv_error(priv, "TRAP_VFETCH");
 			nouveau_bitfield_print(nv50_graph_trap_vfetch, ustatus);
 			printk("\n");
@@ -660,7 +662,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 	/* STRMOUT: DirectX streamout / OpenGL transform feedback. */
 	if (status & 0x008) {
 		ustatus = nv_rd32(priv, 0x401800) & 0x7fffffff;
-		if (display) {
+		if (display && nv_printk_enabled(priv, ERROR)) {
 			nv_error(priv, "TRAP_STRMOUT");
 			nouveau_bitfield_print(nv50_graph_trap_strmout, ustatus);
 			printk("\n");
@@ -681,7 +683,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 	/* CCACHE: Handles code and c[] caches and fills them. */
 	if (status & 0x010) {
 		ustatus = nv_rd32(priv, 0x405018) & 0x7fffffff;
-		if (display) {
+		if (display && nv_printk_enabled(priv, ERROR)) {
 			nv_error(priv, "TRAP_CCACHE");
 			nouveau_bitfield_print(nv50_graph_trap_ccache, ustatus);
 			printk("\n");
@@ -772,7 +774,7 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 		nouveau_handle_put(handle);
 	}
 
-	if (show & 0x00100000) {
+	if ((show & 0x00100000) && nv_printk_enabled(priv, ERROR)) {
 		u32 ecode = nv_rd32(priv, 0x400110);
 		nv_error(priv, "DATA_ERROR ");
 		nouveau_enum_print(nv50_data_error_names, ecode);
@@ -787,15 +789,16 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, 0x400100, stat);
 	nv_wr32(priv, 0x400500, 0x00010001);
 
-	if (show) {
-		nv_info(priv, "");
+	if (show && nv_printk_enabled(priv, ERROR)) {
+		nv_error(priv, "");
 		nouveau_bitfield_print(nv50_graph_intr_name, show);
 		printk("\n");
 		nv_error(priv, "ch %d [0x%010llx] subc %d class 0x%04x "
 			       "mthd 0x%04x data 0x%08x\n",
 			 chid, (u64)inst << 12, subc, class, mthd, data);
-		nv50_fb_trap(nouveau_fb(priv), 1);
 	}
+	if (show)
+		nv50_fb_trap(nouveau_fb(priv), 1);
 
 	if (nv_rd32(priv, 0x400824) & (1 << 31))
 		nv_wr32(priv, 0x400824, nv_rd32(priv, 0x400824) & ~(1 << 31));
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index 80c263b..1cdd608 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -265,12 +265,14 @@ nvc0_graph_intr(struct nouveau_subdev *subdev)
 		stat &= ~0x00000020;
 	}
 
-	if (stat & 0x00100000) {
+	if ((stat & 0x00100000) && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "DATA_ERROR [");
 		nouveau_enum_print(nv50_data_error_names, code);
 		printk("] ch %d [0x%010llx] subc %d class 0x%04x "
 		       "mthd 0x%04x data 0x%08x\n",
 		       chid, inst << 12, subc, class, mthd, data);
+	}
+	if (stat & 0x00100000) {
 		nv_wr32(priv, 0x400100, 0x00100000);
 		stat &= ~0x00100000;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
index 2ba125b..ea58e10 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
@@ -161,12 +161,14 @@ nve0_graph_intr(struct nouveau_subdev *subdev)
 		stat &= ~0x00000020;
 	}
 
-	if (stat & 0x00100000) {
+	if ((stat & 0x00100000) && nv_printk_enabled(priv, ERROR)) {
 		nv_error(priv, "DATA_ERROR [");
 		nouveau_enum_print(nv50_data_error_names, code);
 		printk("] ch %d [0x%010llx] subc %d class 0x%04x "
 		       "mthd 0x%04x data 0x%08x\n",
 		       chid, inst, subc, class, mthd, data);
+	}
+	if (stat & 0x00100000) {
 		nv_wr32(priv, 0x400100, 0x00100000);
 		stat &= ~0x00100000;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
index eaf18fb..a36d190 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
@@ -447,7 +447,7 @@ nv50_fb_trap(struct nouveau_fb *pfb, int display)
 	}
 	nv_wr32(priv, 0x100c90, idx | 0x80000000);
 
-	if (!display)
+	if (!display || !nv_printk_enabled(priv, ERROR))
 		return;
 
 	/* decode status bits into something more useful */
diff --git a/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c b/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c
index 839ca1e..8cecafe 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c
@@ -146,7 +146,7 @@ mxms_foreach(struct nouveau_mxm *mxm, u8 types,
 			return false;
 		}
 
-		if (nv_subdev(mxm)->debug >= NV_DBG_DEBUG && (exec == NULL)) {
+		if ((exec == NULL) && nv_printk_enabled(mxm, DEBUG)) {
 			static const char * mxms_desc_name[] = {
 				"ODS", "SCCS", "TS", "IPS",
 				"GSD", "VSS", "BCS", "FCS",
-- 
1.7.8.6
