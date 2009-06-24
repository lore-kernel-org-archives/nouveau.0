From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] nv50/gallium patch series 2, fixes
Date: Wed, 24 Jun 2009 22:22:20 +0200
Message-ID: <4A428AFC.2070409@student.tuwien.ac.at>
References: <4A2FA30B.5080902@defora.org>	<20090610164512.2259da49@daedalus.pq.iki.fi>	<20090613000157.524d8440@laptop64.home>	<1244857734.3791.0.camel@localhost.localdomain>
	<4A3E6E2C.10505@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090105040905020104000900"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A3E6E2C.10505-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------090105040905020104000900
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ah, obviously I DID introduce a few regressions in those patches,
this should fix what I discovered so far; will be merged into
the respective patches later.

Christoph

--------------090105040905020104000900
Content-Type: text/plain;
 name="0018-nv50-fix-previous-patches.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0018-nv50-fix-previous-patches.patch"

From c7feb3ab5aaf6a323e842987d6ea5f7637fac79d Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Wed, 24 Jun 2009 22:18:37 +0200
Subject: [PATCH] nv50: fix previous patches

This fixes the previous patches, and add some debugging output
if NV50_PROGRAM_DUMP is un-commented.
Will merge this into the patches, later.
---
 src/gallium/drivers/nv50/nv50_program.c |   94 +++++++++++++++++++------------
 1 files changed, 58 insertions(+), 36 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 4b05075..caf03c9 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -28,11 +28,12 @@
 #include "pipe/p_shader_tokens.h"
 #include "tgsi/tgsi_parse.h"
 #include "tgsi/tgsi_util.h"
+#include "tgsi/tgsi_dump.h"
 
 #include "nv50_context.h"
 
 #define NV50_SU_MAX_TEMP 64
-//#define NV50_PROGRAM_DUMP
+/* #define NV50_PROGRAM_DUMP */
 
 /* ARL - gallium craps itself on progs/vp/arl.txt
  *
@@ -44,7 +45,7 @@
  * case, if the emit_src() causes the inst to suddenly become long.
  *
  * Verify half-insns work where expected - if they are used, they have to
- * come in pairs. We cannot branch to between two half insns.
+ * come in pairs. Also, we cannot branch to between two half insns.
  *
  * Watch dst == src vectors, can overwrite components that are needed:
  *	p.e. SUB R0, R0.yzxw, R0
@@ -52,8 +53,8 @@
  * some cases (notably XPD) may still be bad though.
  *
  * Things to check with renouveau:
- *	FP results: can DEPR be mapped to another registers
- *	(currently it goes after all color outputs)
+ *	FP results: can DEPR output be mapped to another register ?
+ *	(currently it's index is that of the last color's register + 1)
  *
  * 1298 = 0x00000004; or 0x00000005 if DEPR is written
  *
@@ -444,7 +445,7 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_exec *e)
 
 
 #define INTERP_LINEAR		0
-#define INTERP_FLAT			1
+#define INTERP_FLAT		1
 #define INTERP_PERSPECTIVE	2
 #define INTERP_CENTROID		4
 
@@ -1852,6 +1853,10 @@ prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
 	dst = &insn->FullDstRegisters[0].DstRegister;
 	mask = dst->WriteMask;
 
+#ifdef NV50_PROGRAM_DUMP
+	tgsi_dump_instruction(insn, 1);
+#endif
+
 	if (dst->File == TGSI_FILE_TEMPORARY) {
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
@@ -1900,13 +1905,14 @@ static unsigned
 prep_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *p_mid,
 	       int *aid, int *p_oid)
 {
-	int c, n, oid = *p_oid, mid = *p_mid;
+	int c, n, oid, mid = *p_mid;
 	unsigned mask = 0;
 
 	for (c = 0, n = i * 4; c < 4; c++, n++) {
 		pc->attr[n].type = P_TEMP;
 		pc->attr[n].hw = -1;
 		pc->attr[n].index = i;
+		oid = (*p_oid)++;
 
 		if (pc->attr[n].acc == acc[n])
 			continue;
@@ -1915,13 +1921,12 @@ prep_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *p_mid,
 		pc->attr[n].acc = acc[n];
 		pc->attr[n].rhw = (*aid)++;
 
-		pc->p->cfg.fp.map[mid / 4] |= (oid + c) << (8 * (mid % 4));
+		pc->p->cfg.fp.map[mid / 4] |= oid << (8 * (mid % 4));
 		mid++;
 		pc->p->cfg.fp.regs[1] += 0x00010001;
 	}
 
 	*p_mid = mid;
-	*p_oid = oid + 4;
 	return mask;
 }
 
@@ -1958,6 +1963,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			const struct tgsi_full_immediate *imm =
 				&p.FullToken.FullImmediate;
 
+#ifdef NV50_PROGRAM_DUMP
+			tgsi_dump_immediate(imm);
+#endif
+
 			ctor_immd(pc, imm->u.ImmediateFloat32[0].Float,
 				      imm->u.ImmediateFloat32[1].Float,
 				      imm->u.ImmediateFloat32[2].Float,
@@ -1973,6 +1982,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			first = d->DeclarationRange.First;
 			last = d->DeclarationRange.Last;
 
+#ifdef NV50_PROGRAM_DUMP
+			tgsi_dump_declaration(d);
+#endif
+
 			switch (d->Declaration.File) {
 			case TGSI_FILE_TEMPORARY:
 				break;
@@ -2094,38 +2107,36 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			/* position should be loaded first */
 			if (fcrd != 0xffff) {
 				unsigned mask;
-				oid = mid = 0;
+				oid = 0;
+				mid = 0;
 				mask = prep_fp_attrib(pc, fcrd, r_usage[1],
 						      &mid, &aid, &oid);
 				pc->p->cfg.fp.regs[1] |= (mask << 24);
 				pc->p->cfg.fp.map[0] += 0x04040404 * fcrd;
+				oid = 0;
 			}
 
 			/* should do MAD fcrd.xy, fcrd, SOME_CONST, fcrd */
 
 			if (perspect_loads) {
 				pc->iv_p = alloc_temp(pc, NULL);
-
-				if (!(pc->p->cfg.fp.regs[1] & 0x08000000)) {
-					pc->p->cfg.fp.regs[1] |= 0x08000000;
+				pc->iv_p->rhw = aid - 1;
+				if (!(pc->p->cfg.fp.regs[1] & (1 << 27)))
 					pc->iv_p->rhw = aid++;
-					emit_interp(pc, pc->iv_p, NULL,
-						    INTERP_LINEAR);
-					emit_flop(pc, 0, pc->iv_p, pc->iv_p);
-				} else {
-					pc->iv_p->rhw = aid - 1;
-					emit_flop(pc, 0, pc->iv_p,
-						  &pc->attr[fcrd * 4 + 3]);
-				}
+				pc->p->cfg.fp.regs[1] |= (1 << 27);
+				emit_interp(pc, pc->iv_p, NULL, INTERP_LINEAR);
+				emit_flop(pc, 0, pc->iv_p, pc->iv_p);
 			}
 
 			if (centroid_loads) {
 				pc->iv_c = alloc_temp(pc, NULL);
-				pc->iv_c->rhw = pc->iv_p ? aid - 1 : aid++;
+				pc->iv_c->rhw = aid - 1;
+				if (!(pc->p->cfg.fp.regs[1] & (1 << 27)))
+					pc->iv_c->rhw = aid++;
+				pc->p->cfg.fp.regs[1] |= (1 << 27);
 				emit_interp(pc, pc->iv_c, NULL,
 					    INTERP_CENTROID);
 				emit_flop(pc, 0, pc->iv_c, pc->iv_c);
-				pc->p->cfg.fp.regs[1] |= 0x08000000;
 			}
 
 			/* load colors directly after position - XXX: might
@@ -2301,7 +2312,8 @@ nv50fp_move_outputs(struct nv50_pc *pc)
 	ctor_reg(&out, P_TEMP, -1, -1);
 
 	for (i = 0; i < pc->result_nr * 4; i++) {
-		if (pc->result[i].rhw < 0)
+		if (pc->result[i].rhw < 0 ||
+		    pc->result[i].rhw == pc->result[i].hw)
 			continue;
 		out.hw = pc->result[i].rhw;
 		emit_mov(pc, &out, &pc->result[i]);
@@ -2337,7 +2349,7 @@ static void nv50_program_tx_postprocess(struct nv50_pc *pc)
 	if (pc->p->type == PIPE_SHADER_FRAGMENT)
 		nv50fp_move_outputs(pc);
 	else
-	if (pc->p->type == PIPE_SHADER_VERTEX)
+	if (pc->p->type == PIPE_SHADER_VERTEX && pc->p->cfg.vp.ucp.nr > 0)
 		nv50vp_ucp_append(pc);
 
 	/* collect branching instructions, we need to adjust their target
@@ -2811,14 +2823,26 @@ nv50_linkage_create(struct nv50_context *nv50)
 	so_ref(so, &ln->so);
 	so_ref(NULL, &so);
 
+#ifdef NV50_PROGRAM_DUMP
+	fprintf(stderr, "LINKAGE:\n");
+	for (i = 0; i < n; i++)
+		fprintf(stderr, "MAP[%i] = 0x%08x\n",i,map[i]);
+	fprintf(stderr, "REG1904 = 0x%08x\n",regs[0]);
+	fprintf(stderr, "REG1908 = 0x%08x\n",regs[1]);
+	fprintf(stderr, "REG190c = 0x%08x\n",regs[2]);
+	fprintf(stderr, "REG1910 = 0x%08x\n",regs[3]);
+	fprintf(stderr, "REG1988 = 0x%08x\n",regs[4]);
+	fprintf(stderr, "REG19a8 = 0x%08x\n",fp->cfg.fp.regs[2]);
+	fprintf(stderr, "REG196c = 0x%08x\n",fp->cfg.fp.regs[3]);
+#endif
+
 	return ln;
 }
 
 void nv50_linkage_validate(struct nv50_context *nv50)
 {
-	struct nv50_linkage *it, *ln = NULL;
+	struct nv50_linkage *ln;
 	struct nv50_program *vp = nv50->vertprog;
-	struct nv50_program *fp = nv50->fragprog;
 	unsigned cfg;
 
 	cfg = nv50->rasterizer->pipe.light_twoside;
@@ -2827,20 +2851,18 @@ void nv50_linkage_validate(struct nv50_context *nv50)
 		cfg |= (1 << 2);
 
 	if (vp->ln) {
-		it = vp->ln->next[0];
+		ln = vp->ln->next[0];
 		do {
-			if (it->prog[1] == (void *)fp && it->cfg == cfg) {
-				ln = it;
-				break;
+			if (ln->prog[1] == nv50->fragprog && ln->cfg == cfg) {
+				so_ref(ln->so, &nv50->state.plinkage);
+				return;
 			}
-			it = it->next[0];
-		} while (it != vp->ln);
+			ln = ln->next[0];
+		} while (ln != vp->ln);
 	}
 
-	if (!ln) {
-		ln = nv50_linkage_create(nv50);
-		ln->cfg = cfg;
-	}
+	ln = nv50_linkage_create(nv50);
+	ln->cfg = cfg;
 
 	so_ref(ln->so, &nv50->state.plinkage);
 }
-- 
1.6.0.6


--------------090105040905020104000900
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------090105040905020104000900--
