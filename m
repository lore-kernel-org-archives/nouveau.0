From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH 4/4] drm/nve0: add handling for a bunch of PGRAPH
	traps
Date: Wed, 27 Mar 2013 22:16:56 +0100
Message-ID: <1364419016-18275-4-git-send-email-e0425955@student.tuwien.ac.at>
References: <1364419016-18275-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1364419016-18275-1-git-send-email-e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
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

---
 drivers/gpu/drm/nouveau/core/engine/graph/nve0.c |  230 ++++++++++++++++++++++
 1 files changed, 230 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
index 4b45afb..e411b18 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
@@ -77,11 +77,214 @@ nve0_graph_ctxctl_isr(struct nvc0_graph_priv *priv)
 	nv_wr32(priv, 0x409c20, ustat);
 }
 
+static const struct nouveau_enum nve0_mp_warp_error[] = {
+	{ 0x00, "(no error)" },
+	{ 0x01, "stack mismatch" },
+	{ 0x05, "misaligned PC" },
+	{ 0x08, "misaligned GPR" },
+	{ 0x09, "invalid opcode" },
+	{ 0x0d, "out of bounds GPR" },
+	{ 0x0e, "out of bounds l/s/a[]" },
+	{ 0x0f, "unaligned memory access" },
+	{ 0x11, "invalid param" },
+	{}
+};
+
+static const struct nouveau_enum nve0_mp_global_error[] = {
+	{ 2, "multiple warp errors" },
+	{ 3, "out of stack space" },
+	{}
+};
+
+static const struct nouveau_enum nve0_gpc_rop_error[] = {
+	{ 1, "RT pitch overrun" },
+	{ 4, "RT width overrun" },
+	{ 5, "RT height overrun" },
+	{ 7, "ZETA storage type mismatch" },
+	{ 8, "RT storage type mismatch" },
+	{ 10, "RT linear mismatch" },
+	{}
+};
+
+static const struct nouveau_enum nve0_sked_error[] = {
+	{ 7, "constant buffer size" },
+	{ 9, "local memory size pos" },
+	{ 10, "local memory size neg" },
+	{ 11, "warp cstack size" },
+	{ 12, "total temp size" },
+	{ 13, "register count" },
+	{ 18, "total threads" },
+	{ 20, "program offset" },
+	{ 21, "shared memory size" },
+	{ 25, "shared/l1 config" },
+	{ 26, "total register count" },
+	{}
+};
+
+static void
+nve0_graph_mp_trap(struct nvc0_graph_priv *priv, int gpc, int tp)
+{
+	int i;
+	u32 bpct = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x010));
+	u32 bpst = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x00c));
+	u32 werr = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x648));
+	u32 gerr = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x650));
+
+	nv_error(priv, "GPC%i/TP%i/MP trap:", gpc, tp);
+
+	for (i = 0; i <= 31; ++i) {
+		if (!(gerr & (1 << i)))
+			continue;
+		pr_cont(" <");
+		nouveau_enum_print(nve0_mp_global_error, i);
+		pr_cont(">");
+	}
+	if (werr) {
+		pr_cont(" <");
+		nouveau_enum_print(nve0_mp_warp_error, werr & 0xffff);
+		pr_cont(">");
+	}
+	pr_cont("\n");
+
+	nv_error(priv, "breakpoint control,status = %08x %08x\n", bpct, bpst);
+
+	/* disable MP trap to avoid spam */
+	nv_mask(priv, TPC_UNIT(gpc, tp, 0x50c), 0x2, 0x0);
+
+	/* TODO: figure out how to resume after an MP trap */
+}
+
+static void
+nve0_graph_tp_trap(struct nvc0_graph_priv *priv, int gpc, int tp)
+{
+	u32 stat = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x508));
+
+	if (stat & 0x1) {
+		u32 trap = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x224));
+		nv_error(priv, "GPC%i/TP%i/TEX trap: %08x\n",
+			 gpc, tp, trap);
+
+		nv_wr32(priv, TPC_UNIT(gpc, tp, 0x224), 0xc0000000);
+		stat &= ~0x1;
+	}
+
+	if (stat & 0x2) {
+		nve0_graph_mp_trap(priv, gpc, tp);
+		stat &= ~0x2;
+	}
+
+	if (stat & 0x4) {
+		u32 trap = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x084));
+		nv_error(priv, "GPC%i/TP%i/POLY trap: %08x\n",
+			 gpc, tp, trap);
+
+		nv_wr32(priv, TPC_UNIT(gpc, tp, 0x084), 0xc0000000);
+		stat &= ~0x4;
+	}
+
+	if (stat & 0x8) {
+		u32 trap = nv_rd32(priv, TPC_UNIT(gpc, tp, 0x48c));
+		nv_error(priv, "GPC%i/TP%i/L1C trap: %08x\n",
+			 gpc, tp, trap);
+
+		nv_wr32(priv, TPC_UNIT(gpc, tp, 0x48c), 0xc0000000);
+		stat &= ~0x8;
+	}
+
+	if (stat) {
+		nv_error(priv, "GPC%i/TP%i: unknown stat %08x\n",
+			 gpc, tp, stat);
+	}
+}
+
+static void
+nve0_graph_gpc_trap(struct nvc0_graph_priv *priv)
+{
+	const u32 mask = nv_rd32(priv, 0x400118);
+	int gpc;
+
+	for (gpc = 0; gpc < 4; ++gpc) {
+		u32 stat;
+		int tp;
+
+		if (!(mask & (1 << gpc)))
+			continue;
+		stat = nv_rd32(priv, GPC_UNIT(gpc, 0x2c90));
+
+		if (stat & 0x0001) {
+			u32 trap[4];
+			int i;
+
+			trap[0] = nv_rd32(priv, GPC_UNIT(gpc, 0x0420));
+			trap[1] = nv_rd32(priv, GPC_UNIT(gpc, 0x0434));
+			trap[2] = nv_rd32(priv, GPC_UNIT(gpc, 0x0438));
+			trap[3] = nv_rd32(priv, GPC_UNIT(gpc, 0x043c));
+
+			nv_error(priv, "GPC%i/PROP trap:", gpc);
+			for (i = 0; i <= 29; ++i) {
+				if (!(trap[0] & (1 << i)))
+					continue;
+				pr_cont(" <");
+				nouveau_enum_print(nve0_gpc_rop_error, i);
+				pr_cont(">");
+			}
+			pr_cont("\n");
+
+			nv_error(priv, "x = %u, y = %u, "
+				 "format = %x, storage type = %x\n",
+				 trap[1] & 0xffff,
+				 trap[1] >> 16,
+				 (trap[2] >> 8) & 0x3f,
+				 trap[3] & 0xff);
+
+			nv_wr32(priv, GPC_UNIT(gpc, 0x0420), 0xc0000000);
+			stat &= ~0x0001;
+		}
+
+		if (stat & 0x0002) {
+			u32 trap = nv_rd32(priv, GPC_UNIT(gpc, 0x0900));
+			nv_error(priv, "GPC%i/ZCULL trap: %08x\n", gpc,
+				 trap);
+			nv_wr32(priv, GPC_UNIT(gpc, 0x0900), 0xc0000000);
+			stat &= ~0x0002;
+		}
+
+		if (stat & 0x0004) {
+			u32 trap = nv_rd32(priv, GPC_UNIT(gpc, 0x1028));
+			nv_error(priv, "GPC%i/CCACHE trap: %08x\n", gpc,
+				 trap);
+			nv_wr32(priv, GPC_UNIT(gpc, 0x1028), 0xc0000000);
+			stat &= ~0x0004;
+		}
+
+		if (stat & 0x0008) {
+			u32 trap = nv_rd32(priv, GPC_UNIT(gpc, 0x0824));
+			nv_error(priv, "GPC%i/ESETUP trap %08x\n", gpc,
+				 trap);
+			nv_wr32(priv, GPC_UNIT(gpc, 0x0824), 0xc0000000);
+			stat &= ~0x0008;
+		}
+
+		for (tp = 0; tp < 8; ++tp) {
+			if (stat & (1 << (16 + tp)))
+				nve0_graph_tp_trap(priv, gpc, tp);
+		}
+		stat &= ~0xff0000;
+
+		if (stat) {
+			nv_error(priv, "GPC%i: unknown stat %08x\n",
+				 gpc, stat);
+		}
+	}
+}
+
+
 static void
 nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst,
 		struct nouveau_object *engctx)
 {
 	u32 trap = nv_rd32(priv, 0x400108);
+	int i;
 	int rop;
 
 	if (trap & 0x00000001) {
@@ -102,6 +305,33 @@ nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst,
 		trap &= ~0x00000010;
 	}
 
+	if (trap & 0x00000100) {
+		u32 stat = nv_rd32(priv, 0x407020);
+		nv_error(priv, "SKED ch %d [0x%010llx %s]:",
+			 chid, inst, nouveau_client_name(engctx));
+
+		for (i = 0; i <= 29; ++i) {
+			if (!(stat & (1 << i)))
+				continue;
+			pr_cont(" <");
+			nouveau_enum_print(nve0_sked_error, i);
+			pr_cont(">");
+		}
+		pr_cont("\n");
+
+		if (stat & 0x3fffffff)
+			nv_wr32(priv, 0x407020, 0x40000000);
+		nv_wr32(priv, 0x400108, 0x00000100);
+		trap &= ~0x00000100;
+	}
+
+	if (trap & 0x01000000) {
+		nv_error(priv, "GPC ch %d [0x%010llx %s]:\n",
+			 chid, inst, nouveau_client_name(engctx));
+		nve0_graph_gpc_trap(priv);
+		trap &= ~0x01000000;
+	}
+
 	if (trap & 0x02000000) {
 		for (rop = 0; rop < priv->rop_nr; rop++) {
 			u32 statz = nv_rd32(priv, ROP_UNIT(rop, 0x070));
-- 
1.7.3.4
