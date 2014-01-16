From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH v2] drm/nv50/graph: add more trap names to print
	on error
Date: Thu, 16 Jan 2014 02:47:11 -0500
Message-ID: <1389858431-30271-1-git-send-email-imirkin@alum.mit.edu>
References: <CAKb7Uvi6w-CH8TAQnZEy9Hx+5DTMCNL9DrAMTvmBN4dPVm5hgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi6w-CH8TAQnZEy9Hx+5DTMCNL9DrAMTvmBN4dPVm5hgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org, "Skeggs <bskeggs"@redhat.com
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Also avoids printing the errors bitfield if that information has already
been shown.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Here's a sample output:

[99995.048486] nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - TP 0 - RT_FAULT - Address 0000000000
[99995.048490] nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100, e24: 00030000
[99995.048494] nouveau E[  PGRAPH][0000:02:00.0] ch 4 [0x000f94c000 gl-3.2-layered-[26795]] subc 3 class 0x8297 mthd 0x15e0 data 0x00000000
[99995.048506] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000000000 on channel 0x0000f94c [gl-3.2-layered-[26795]] PGRAPH/PROP/RT0 reason: PT_NOT_PRESENT

and

[100391.766915] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[100391.766926] nouveau E[  PGRAPH][0000:02:00.0] ch 4 [0x000f94c000 fbo-depthstenci[30109]] subc 5 class 0x5039 mthd 0x0328 data 0x00000000

A downside of this approach is that it can get split up onto multiple lines if
the timing is right, but I think it's worth it to avoid all the duplicate
information in the errors.

 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 128 +++++++++++++----------
 1 file changed, 70 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 03de517..a489ac2 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -396,6 +396,60 @@ static const struct nouveau_bitfield nv50_graph_intr_name[] = {
 	{}
 };
 
+static const struct nouveau_bitfield nv50_graph_trap_prop[] = {
+	{ 0x00000004, "SURF_WIDTH_OVERRUN" },
+	{ 0x00000008, "SURF_HEIGHT_OVERRUN" },
+	{ 0x00000010, "DST2D_FAULT" },
+	{ 0x00000020, "ZETA_FAULT" },
+	{ 0x00000040, "RT_FAULT" },
+	{ 0x00000080, "CUDA_FAULT" },
+	{ 0x00000100, "DST2D_STORAGE_TYPE_MISMATCH" },
+	{ 0x00000200, "ZETA_STORAGE_TYPE_MISMATCH" },
+	{ 0x00000400, "RT_STORAGE_TYPE_MISMATCH" },
+	{ 0x00000800, "DST2D_LINEAR_MISMATCH" },
+	{ 0x00001000, "RT_LINEAR_MISMATCH" },
+	{}
+};
+
+static void
+nv50_priv_prop_trap(struct nv50_graph_priv *priv,
+		    u32 ustatus_addr, u32 ustatus, u32 tp)
+{
+	u32 e0c = nv_rd32(priv, ustatus_addr + 0x04);
+	u32 e10 = nv_rd32(priv, ustatus_addr + 0x08);
+	u32 e14 = nv_rd32(priv, ustatus_addr + 0x0c);
+	u32 e18 = nv_rd32(priv, ustatus_addr + 0x10);
+	u32 e1c = nv_rd32(priv, ustatus_addr + 0x14);
+	u32 e20 = nv_rd32(priv, ustatus_addr + 0x18);
+	u32 e24 = nv_rd32(priv, ustatus_addr + 0x1c);
+
+	/* CUDA memory: l[], g[] or stack. */
+	if (ustatus & 0x00000080) {
+		if (e18 & 0x80000000) {
+			/* g[] read fault? */
+			nv_error(priv, "TRAP_PROP - TP %d - CUDA_FAULT - Global read fault at address %02x%08x\n",
+					 tp, e14, e10 | ((e18 >> 24) & 0x1f));
+			e18 &= ~0x1f000000;
+		} else if (e18 & 0xc) {
+			/* g[] write fault? */
+			nv_error(priv, "TRAP_PROP - TP %d - CUDA_FAULT - Global write fault at address %02x%08x\n",
+				 tp, e14, e10 | ((e18 >> 7) & 0x1f));
+			e18 &= ~0x00000f80;
+		} else {
+			nv_error(priv, "TRAP_PROP - TP %d - Unknown CUDA fault at address %02x%08x\n",
+				 tp, e14, e10);
+		}
+		ustatus &= ~0x00000080;
+	}
+	if (ustatus) {
+		nv_error(priv, "TRAP_PROP - TP %d -", tp);
+		nouveau_bitfield_print(nv50_graph_trap_prop, ustatus);
+		pr_cont(" - Address %02x%08x\n", e14, e10);
+	}
+	nv_error(priv, "TRAP_PROP - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
+		 tp, e0c, e18, e1c, e20, e24);
+}
+
 static void
 nv50_priv_mp_trap(struct nv50_graph_priv *priv, int tpid, int display)
 {
@@ -469,58 +523,11 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
 				ustatus &= ~0x04030000;
 			}
 			break;
-		case 8: /* TPDMA error */
-			{
-			u32 e0c = nv_rd32(priv, ustatus_addr + 4);
-			u32 e10 = nv_rd32(priv, ustatus_addr + 8);
-			u32 e14 = nv_rd32(priv, ustatus_addr + 0xc);
-			u32 e18 = nv_rd32(priv, ustatus_addr + 0x10);
-			u32 e1c = nv_rd32(priv, ustatus_addr + 0x14);
-			u32 e20 = nv_rd32(priv, ustatus_addr + 0x18);
-			u32 e24 = nv_rd32(priv, ustatus_addr + 0x1c);
-			/* 2d engine destination */
-			if (ustatus & 0x00000010) {
-				if (display) {
-					nv_error(priv, "TRAP_TPDMA_2D - TP %d - Unknown fault at address %02x%08x\n",
-							i, e14, e10);
-					nv_error(priv, "TRAP_TPDMA_2D - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
-							i, e0c, e18, e1c, e20, e24);
-				}
-				ustatus &= ~0x00000010;
-			}
-			/* Render target */
-			if (ustatus & 0x00000040) {
-				if (display) {
-					nv_error(priv, "TRAP_TPDMA_RT - TP %d - Unknown fault at address %02x%08x\n",
-							i, e14, e10);
-					nv_error(priv, "TRAP_TPDMA_RT - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
-							i, e0c, e18, e1c, e20, e24);
-				}
-				ustatus &= ~0x00000040;
-			}
-			/* CUDA memory: l[], g[] or stack. */
-			if (ustatus & 0x00000080) {
-				if (display) {
-					if (e18 & 0x80000000) {
-						/* g[] read fault? */
-						nv_error(priv, "TRAP_TPDMA - TP %d - Global read fault at address %02x%08x\n",
-								i, e14, e10 | ((e18 >> 24) & 0x1f));
-						e18 &= ~0x1f000000;
-					} else if (e18 & 0xc) {
-						/* g[] write fault? */
-						nv_error(priv, "TRAP_TPDMA - TP %d - Global write fault at address %02x%08x\n",
-								i, e14, e10 | ((e18 >> 7) & 0x1f));
-						e18 &= ~0x00000f80;
-					} else {
-						nv_error(priv, "TRAP_TPDMA - TP %d - Unknown CUDA fault at address %02x%08x\n",
-								i, e14, e10);
-					}
-					nv_error(priv, "TRAP_TPDMA - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
-							i, e0c, e18, e1c, e20, e24);
-				}
-				ustatus &= ~0x00000080;
-			}
-			}
+		case 8: /* PROP error */
+			if (display)
+				nv50_priv_prop_trap(
+						priv, ustatus_addr, ustatus, i);
+			ustatus = 0;
 			break;
 		}
 		if (ustatus) {
@@ -727,11 +734,11 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 		status &= ~0x080;
 	}
 
-	/* TPDMA:  Handles TP-initiated uncached memory accesses:
+	/* PROP:  Handles TP-initiated uncached memory accesses:
 	 * l[], g[], stack, 2d surfaces, render targets. */
 	if (status & 0x100) {
 		nv50_priv_tp_trap(priv, 8, 0x408e08, 0x408708, display,
-				    "TRAP_TPDMA");
+				    "TRAP_PROP");
 		nv_wr32(priv, 0x400108, 0x100);
 		status &= ~0x100;
 	}
@@ -760,7 +767,7 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 	u32 mthd = (addr & 0x00001ffc);
 	u32 data = nv_rd32(priv, 0x400708);
 	u32 class = nv_rd32(priv, 0x400814);
-	u32 show = stat;
+	u32 show = stat, show_bitfield = stat;
 	int chid;
 
 	engctx = nouveau_engctx_get(engine, inst);
@@ -778,21 +785,26 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 		nv_error(priv, "DATA_ERROR ");
 		nouveau_enum_print(nv50_data_error_names, ecode);
 		pr_cont("\n");
+		show_bitfield &= ~0x00100000;
 	}
 
 	if (stat & 0x00200000) {
 		if (!nv50_graph_trap_handler(priv, show, chid, (u64)inst << 12,
 				engctx))
 			show &= ~0x00200000;
+		show_bitfield &= ~0x00200000;
 	}
 
 	nv_wr32(priv, 0x400100, stat);
 	nv_wr32(priv, 0x400500, 0x00010001);
 
 	if (show) {
-		nv_error(priv, "%s", "");
-		nouveau_bitfield_print(nv50_graph_intr_name, show);
-		pr_cont("\n");
+		show &= show_bitfield;
+		if (show) {
+			nv_error(priv, "%s", "");
+			nouveau_bitfield_print(nv50_graph_intr_name, show);
+			pr_cont("\n");
+		}
 		nv_error(priv,
 			 "ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
 			 chid, (u64)inst << 12, nouveau_client_name(engctx),
-- 
1.8.3.2
