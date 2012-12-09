From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] drm/nouveau: use pr_cont
Date: Sun,  9 Dec 2012 15:45:20 +0100
Message-ID: <1355064322-23025-2-git-send-email-marcin.slusarz@gmail.com>
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

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/core/enum.c         |  8 ++++----
 drivers/gpu/drm/nouveau/core/engine/copy/nva3.c  |  2 +-
 drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c |  2 +-
 drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c |  2 +-
 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  | 10 +++++-----
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c  | 10 +++++-----
 drivers/gpu/drm/nouveau/core/engine/graph/nv04.c |  6 +++---
 drivers/gpu/drm/nouveau/core/engine/graph/nv10.c |  6 +++---
 drivers/gpu/drm/nouveau/core/engine/graph/nv20.c |  6 +++---
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c |  6 +++---
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 14 +++++++-------
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c |  2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nve0.c |  2 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c    | 18 +++++++++---------
 drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c   |  8 ++++----
 drivers/gpu/drm/nouveau/nouveau_bios.c           |  4 ++--
 16 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/enum.c b/drivers/gpu/drm/nouveau/core/core/enum.c
index 7cc7133..148f91f 100644
--- a/drivers/gpu/drm/nouveau/core/core/enum.c
+++ b/drivers/gpu/drm/nouveau/core/core/enum.c
@@ -45,9 +45,9 @@ nouveau_enum_print(const struct nouveau_enum *en, u32 value)
 {
 	en = nouveau_enum_find(en, value);
 	if (en)
-		printk("%s", en->name);
+		pr_cont("%s", en->name);
 	else
-		printk("(unknown enum 0x%08x)", value);
+		pr_cont("(unknown enum 0x%08x)", value);
 }
 
 void
@@ -55,7 +55,7 @@ nouveau_bitfield_print(const struct nouveau_bitfield *bf, u32 value)
 {
 	while (bf->name) {
 		if (value & bf->mask) {
-			printk(" %s", bf->name);
+			pr_cont(" %s", bf->name);
 			value &= ~bf->mask;
 		}
 
@@ -63,5 +63,5 @@ nouveau_bitfield_print(const struct nouveau_bitfield *bf, u32 value)
 	}
 
 	if (value)
-		printk(" (unknown bits 0x%08x)", value);
+		pr_cont(" (unknown bits 0x%08x)", value);
 }
diff --git a/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c b/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
index 283248c..6068f5f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
@@ -100,7 +100,7 @@ nva3_copy_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00000040) {
 		nv_error(falcon, "DISPATCH_ERROR [");
 		nouveau_enum_print(nva3_copy_isr_error_name, ssta);
-		printk("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
+		pr_cont("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
 		       chid, inst << 12, subc, mthd, data);
 		nv_wo32(falcon, 0x004, 0x00000040);
 		stat &= ~0x00000040;
diff --git a/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c b/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
index b974905..8d0a440 100644
--- a/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
@@ -128,7 +128,7 @@ nv84_crypt_intr(struct nouveau_subdev *subdev)
 	if (stat) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv84_crypt_intr_mask, stat);
-		printk(" ch %d [0x%010llx] mthd 0x%04x data 0x%08x\n",
+		pr_cont(" ch %d [0x%010llx] mthd 0x%04x data 0x%08x\n",
 		       chid, (u64)inst << 12, mthd, data);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c b/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
index 21986f3..1b33c20 100644
--- a/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
@@ -102,7 +102,7 @@ nv98_crypt_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00000040) {
 		nv_error(priv, "DISPATCH_ERROR [");
 		nouveau_enum_print(nv98_crypt_isr_error_name, ssta);
-		printk("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
+		pr_cont("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
 		       chid, (u64)inst << 12, subc, mthd, data);
 		nv_wr32(priv, 0x087004, 0x00000040);
 		stat &= ~0x00000040;
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
index ec60bc1..151706b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
@@ -421,16 +421,16 @@ nvc0_fifo_isr_vm_fault(struct nvc0_fifo_priv *priv, int unit)
 	nv_error(priv, "%s fault at 0x%010llx [", (stat & 0x00000080) ?
 		 "write" : "read", (u64)vahi << 32 | valo);
 	nouveau_enum_print(nvc0_fifo_fault_reason, stat & 0x0000000f);
-	printk("] from ");
+	pr_cont("] from ");
 	nouveau_enum_print(nvc0_fifo_fault_unit, unit);
 	if (stat & 0x00000040) {
-		printk("/");
+		pr_cont("/");
 		nouveau_enum_print(nvc0_fifo_fault_hubclient, client);
 	} else {
-		printk("/GPC%d/", (stat & 0x1f000000) >> 24);
+		pr_cont("/GPC%d/", (stat & 0x1f000000) >> 24);
 		nouveau_enum_print(nvc0_fifo_fault_gpcclient, client);
 	}
-	printk(" on channel 0x%010llx\n", (u64)inst << 12);
+	pr_cont(" on channel 0x%010llx\n", (u64)inst << 12);
 }
 
 static int
@@ -485,7 +485,7 @@ nvc0_fifo_isr_subfifo_intr(struct nvc0_fifo_priv *priv, int unit)
 	if (show) {
 		nv_error(priv, "SUBFIFO%d:", unit);
 		nouveau_bitfield_print(nvc0_fifo_subfifo_intr, show);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "SUBFIFO%d: ch %d subc %d mthd 0x%04x "
 			       "data 0x%08x\n",
 			 unit, chid, subc, mthd, data);
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
index 1dcbe25..c23f7ba 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
@@ -417,16 +417,16 @@ nve0_fifo_isr_vm_fault(struct nve0_fifo_priv *priv, int unit)
 	nv_error(priv, "PFIFO: %s fault at 0x%010llx [", (stat & 0x00000080) ?
 		       "write" : "read", (u64)vahi << 32 | valo);
 	nouveau_enum_print(nve0_fifo_fault_reason, stat & 0x0000000f);
-	printk("] from ");
+	pr_cont("] from ");
 	nouveau_enum_print(nve0_fifo_fault_unit, unit);
 	if (stat & 0x00000040) {
-		printk("/");
+		pr_cont("/");
 		nouveau_enum_print(nve0_fifo_fault_hubclient, client);
 	} else {
-		printk("/GPC%d/", (stat & 0x1f000000) >> 24);
+		pr_cont("/GPC%d/", (stat & 0x1f000000) >> 24);
 		nouveau_enum_print(nve0_fifo_fault_gpcclient, client);
 	}
-	printk(" on channel 0x%010llx\n", (u64)inst << 12);
+	pr_cont(" on channel 0x%010llx\n", (u64)inst << 12);
 }
 
 static int
@@ -481,7 +481,7 @@ nve0_fifo_isr_subfifo_intr(struct nve0_fifo_priv *priv, int unit)
 	if (show) {
 		nv_error(priv, "SUBFIFO%d:", unit);
 		nouveau_bitfield_print(nve0_fifo_subfifo_intr, show);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "SUBFIFO%d: ch %d subc %d mthd 0x%04x "
 			       "data 0x%08x\n",
 			 unit, chid, subc, mthd, data);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
index e30a9c5..f4fb844 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
@@ -1299,11 +1299,11 @@ nv04_graph_intr(struct nouveau_subdev *subdev)
 	if (show) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv04_graph_intr_name, show);
-		printk(" nsource:");
+		pr_cont(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
-		printk(" nstatus:");
+		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv04_graph_nstatus, nstatus);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "ch %d/%d class 0x%04x "
 			       "mthd 0x%04x data 0x%08x\n",
 			 chid, subc, class, mthd, data);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
index 5c0f843..deea80f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
@@ -1195,11 +1195,11 @@ nv10_graph_intr(struct nouveau_subdev *subdev)
 	if (show) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
-		printk(" nsource:");
+		pr_cont(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
-		printk(" nstatus:");
+		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "ch %d/%d class 0x%04x "
 			       "mthd 0x%04x data 0x%08x\n",
 			 chid, subc, class, mthd, data);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
index 5b20401..4c0d79c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
@@ -226,11 +226,11 @@ nv20_graph_intr(struct nouveau_subdev *subdev)
 	if (show) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
-		printk(" nsource:");
+		pr_cont(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
-		printk(" nstatus:");
+		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "ch %d/%d class 0x%04x mthd 0x%04x data 0x%08x\n",
 			chid, subc, class, mthd, data);
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
index 0b36dd3..961a073 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -323,11 +323,11 @@ nv40_graph_intr(struct nouveau_subdev *subdev)
 	if (show) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv10_graph_intr_name, show);
-		printk(" nsource:");
+		pr_cont(" nsource:");
 		nouveau_bitfield_print(nv04_graph_nsource, nsource);
-		printk(" nstatus:");
+		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "ch %d [0x%08x] subc %d class 0x%04x "
 			       "mthd 0x%04x data 0x%08x\n",
 			 chid, inst << 4, subc, class, mthd, data);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index b1c3d83..2c9e9ad 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -418,7 +418,7 @@ nv50_priv_mp_trap(struct nv50_graph_priv *priv, int tpid, int display)
 			nv_error(priv, "TRAP_MP_EXEC - "
 					"TP %d MP %d: ", tpid, i);
 			nouveau_enum_print(nv50_mp_exec_error_names, status);
-			printk(" at %06x warp %d, opcode %08x %08x\n",
+			pr_cont(" at %06x warp %d, opcode %08x %08x\n",
 					pc&0xffffff, pc >> 24,
 					oplow, ophigh);
 		}
@@ -623,7 +623,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 		if (display) {
 			nv_error(priv, "TRAP_M2MF");
 			nouveau_bitfield_print(nv50_graph_trap_m2mf, ustatus);
-			printk("\n");
+			pr_cont("\n");
 			nv_error(priv, "TRAP_M2MF %08x %08x %08x %08x\n",
 				nv_rd32(priv, 0x406804), nv_rd32(priv, 0x406808),
 				nv_rd32(priv, 0x40680c), nv_rd32(priv, 0x406810));
@@ -644,7 +644,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 		if (display) {
 			nv_error(priv, "TRAP_VFETCH");
 			nouveau_bitfield_print(nv50_graph_trap_vfetch, ustatus);
-			printk("\n");
+			pr_cont("\n");
 			nv_error(priv, "TRAP_VFETCH %08x %08x %08x %08x\n",
 				nv_rd32(priv, 0x400c00), nv_rd32(priv, 0x400c08),
 				nv_rd32(priv, 0x400c0c), nv_rd32(priv, 0x400c10));
@@ -661,7 +661,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 		if (display) {
 			nv_error(priv, "TRAP_STRMOUT");
 			nouveau_bitfield_print(nv50_graph_trap_strmout, ustatus);
-			printk("\n");
+			pr_cont("\n");
 			nv_error(priv, "TRAP_STRMOUT %08x %08x %08x %08x\n",
 				nv_rd32(priv, 0x401804), nv_rd32(priv, 0x401808),
 				nv_rd32(priv, 0x40180c), nv_rd32(priv, 0x401810));
@@ -682,7 +682,7 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 		if (display) {
 			nv_error(priv, "TRAP_CCACHE");
 			nouveau_bitfield_print(nv50_graph_trap_ccache, ustatus);
-			printk("\n");
+			pr_cont("\n");
 			nv_error(priv, "TRAP_CCACHE %08x %08x %08x %08x"
 				     " %08x %08x %08x\n",
 				nv_rd32(priv, 0x405000), nv_rd32(priv, 0x405004),
@@ -774,7 +774,7 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 		u32 ecode = nv_rd32(priv, 0x400110);
 		nv_error(priv, "DATA_ERROR ");
 		nouveau_enum_print(nv50_data_error_names, ecode);
-		printk("\n");
+		pr_cont("\n");
 	}
 
 	if (stat & 0x00200000) {
@@ -788,7 +788,7 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 	if (show) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv50_graph_intr_name, show);
-		printk("\n");
+		pr_cont("\n");
 		nv_error(priv, "ch %d [0x%010llx] subc %d class 0x%04x "
 			       "mthd 0x%04x data 0x%08x\n",
 			 chid, (u64)inst << 12, subc, class, mthd, data);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index 47a0208..5ab6645 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -454,7 +454,7 @@ nvc0_graph_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00100000) {
 		nv_error(priv, "DATA_ERROR [");
 		nouveau_enum_print(nv50_data_error_names, code);
-		printk("] ch %d [0x%010llx] subc %d class 0x%04x "
+		pr_cont("] ch %d [0x%010llx] subc %d class 0x%04x "
 		       "mthd 0x%04x data 0x%08x\n",
 		       chid, inst << 12, subc, class, mthd, data);
 		nv_wr32(priv, 0x400100, 0x00100000);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
index 539d4c7..8aba211 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
@@ -166,7 +166,7 @@ nve0_graph_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00100000) {
 		nv_error(priv, "DATA_ERROR [");
 		nouveau_enum_print(nv50_data_error_names, code);
-		printk("] ch %d [0x%010llx] subc %d class 0x%04x "
+		pr_cont("] ch %d [0x%010llx] subc %d class 0x%04x "
 		       "mthd 0x%04x data 0x%08x\n",
 		       chid, inst, subc, class, mthd, data);
 		nv_wr32(priv, 0x400100, 0x00100000);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
index 487cb8c..88bdb02 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
@@ -372,30 +372,30 @@ nv50_fb_intr(struct nouveau_subdev *subdev)
 
 	en = nouveau_enum_find(vm_engine, st0);
 	if (en)
-		printk("%s/", en->name);
+		pr_cont("%s/", en->name);
 	else
-		printk("%02x/", st0);
+		pr_cont("%02x/", st0);
 
 	cl = nouveau_enum_find(vm_client, st2);
 	if (cl)
-		printk("%s/", cl->name);
+		pr_cont("%s/", cl->name);
 	else
-		printk("%02x/", st2);
+		pr_cont("%02x/", st2);
 
 	if      (cl && cl->data) cl = nouveau_enum_find(cl->data, st3);
 	else if (en && en->data) cl = nouveau_enum_find(en->data, st3);
 	else                     cl = NULL;
 	if (cl)
-		printk("%s", cl->name);
+		pr_cont("%s", cl->name);
 	else
-		printk("%02x", st3);
+		pr_cont("%02x", st3);
 
-	printk(" reason: ");
+	pr_cont(" reason: ");
 	en = nouveau_enum_find(vm_fault, st1);
 	if (en)
-		printk("%s\n", en->name);
+		pr_cont("%s\n", en->name);
 	else
-		printk("0x%08x\n", st1);
+		pr_cont("0x%08x\n", st1);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c b/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c
index 839ca1e..4bde7f7 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mxm/mxms.c
@@ -156,15 +156,15 @@ mxms_foreach(struct nouveau_mxm *mxm, u8 types,
 
 			nv_debug(mxm, "%4s: ", mxms_desc_name[type]);
 			for (j = headerlen - 1; j >= 0; j--)
-				printk("%02x", dump[j]);
-			printk("\n");
+				pr_cont("%02x", dump[j]);
+			pr_cont("\n");
 			dump += headerlen;
 
 			for (i = 0; i < entries; i++, dump += recordlen) {
 				nv_debug(mxm, "      ");
 				for (j = recordlen - 1; j >= 0; j--)
-					printk("%02x", dump[j]);
-				printk("\n");
+					pr_cont("%02x", dump[j]);
+				pr_cont("\n");
 			}
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 865eddf..5cf3626 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -1937,9 +1937,9 @@ parse_dcb_table(struct drm_device *dev, struct nvbios *bios)
 		if (conn[0] != 0xff) {
 			NV_INFO(drm, "DCB conn %02d: ", idx);
 			if (olddcb_conntab(dev)[3] < 4)
-				printk("%04x\n", ROM16(conn[0]));
+				pr_cont("%04x\n", ROM16(conn[0]));
 			else
-				printk("%08x\n", ROM32(conn[0]));
+				pr_cont("%08x\n", ROM32(conn[0]));
 		}
 	}
 	dcb_fake_connectors(bios);
-- 
1.7.12
