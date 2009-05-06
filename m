From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50: shader generation patches
Date: Wed, 06 May 2009 12:28:27 +0200
Message-ID: <4A01664B.3080500@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020807040709030700080400"
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

This is a multi-part message in MIME format.
--------------020807040709030700080400
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi ! I've been trying to improve NV50 shader generation a bit the last couple of weeks, so here is
what I've produced. I don't know if it's usable for you or just a pile of horrible hacks, but at
least it makes some mesa demos render more correcly, p.e. the teapot (aside from mip-mapping issues
of the floor texture), arbfplight, and I think the gears also didn't appear as they should before,
and I hope it doesn't break others that worked.
I also tried playing neverball and neverputt, which at some point worked fine, but now it locks up
the GPU again after a certain (short) amount of time. That's probably not related to my
modifications, because it crashes without the patches as well (plus has some flickering and other
graphics errors). It seems to work OK if I run it with valgrind, though.
There also are and have been some random graphics errors that spam the kernel log with invalid
method NV50TCL_VERTEX_END, so if something doesn't look right, try to restart the program, or toggle
some options in the mesa demos (show help, etc.).

There might, as always, be some bugs in the patches, of course, and the they probably can't be
committed unmodified. I've not put them in the email text but as attachments because there's rather
many changes. There's a short description (commit log) in each patch, but I hope the code speaks for
itself, otherwise I'll provide more explanation / add more comments ... later.
These don't represent everything I've tried to improve, but the rest isn't in any usable shape yet.

If anyone who knows their way around the gallium code has time, please have a look and tell me what
you think. Thank you.

Christoph

--------------020807040709030700080400
Content-Type: text/plain;
 name="patch-00.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-00.diff"

commit 7ab9fc73707be46375668e557b5a5c1a373096ad
Author: chr <chr@LAPTOP.(none)>
Date:   Sun May 3 21:03:35 2009 +0200

    Remove some memory leaks: free allocated temp in all opcode cases
    of tx_insn; free nv50_regs for immds in LIT and those allocated in
    tgsi_src.
    Make LRP use 2 instructions (SUB,MAD) instead of 3 (NEG,MAD,MAD).

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 2d15868..1a94327 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -28,6 +28,7 @@
 #include "pipe/p_shader_tokens.h"
 #include "tgsi/tgsi_parse.h"
 #include "tgsi/tgsi_util.h"
+#include "tgsi/tgsi_dump.h"
 
 #include "nv50_context.h"
 
@@ -795,12 +796,6 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 	struct nv50_reg *pos128 = alloc_immd(pc,  127.999999);
 	struct nv50_reg *tmp[4];
 
-	if (mask & (1 << 0))
-		emit_mov(pc, dst[0], one);
-
-	if (mask & (1 << 3))
-		emit_mov(pc, dst[3], one);
-
 	if (mask & (3 << 1)) {
 		if (mask & (1 << 1))
 			tmp[0] = dst[1];
@@ -823,6 +818,18 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 		emit_mov(pc, dst[2], zero);
 		set_pred(pc, 3, 0, pc->p->exec_tail);
 	}
+
+	/* do this last, in case src[i,j] == dst[0,3] */
+	if (mask & (1 << 0))
+		emit_mov(pc, dst[0], one);
+
+	if (mask & (1 << 3))
+		emit_mov(pc, dst[3], one);
+	
+	FREE(pos128);
+	FREE(neg128);
+	FREE(zero);
+	FREE(one);
 }
 
 static void
@@ -885,8 +892,9 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src)
 {
 	struct nv50_reg *r = NULL;
 	struct nv50_reg *temp;
-	unsigned c;
+	unsigned sgn, c;
 
+	sgn = tgsi_util_get_full_src_register_sign_mode(src, chan);
 	c = tgsi_util_get_full_src_register_extswizzle(src, chan);
 	switch (c) {
 	case TGSI_EXTSWIZZLE_X:
@@ -915,16 +923,18 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src)
 		break;
 	case TGSI_EXTSWIZZLE_ZERO:
 		r = alloc_immd(pc, 0.0);
-		break;
+		return r;
 	case TGSI_EXTSWIZZLE_ONE:
-		r = alloc_immd(pc, 1.0);
-		break;
+		if (sgn == TGSI_UTIL_SIGN_TOGGLE || sgn == TGSI_UTIL_SIGN_SET)
+			return alloc_immd(pc, -1.0);
+		else
+			return alloc_immd(pc, 1.0);
 	default:
 		assert(0);
 		break;
 	}
 
-	switch (tgsi_util_get_full_src_register_sign_mode(src, chan)) {
+	switch (sgn) {
 	case TGSI_UTIL_SIGN_KEEP:
 		break;
 	case TGSI_UTIL_SIGN_CLEAR:
@@ -955,7 +965,7 @@ static boolean
 nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 {
 	const struct tgsi_full_instruction *inst = &tok->FullInstruction;
-	struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp;
+	struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp = NULL;
 	unsigned mask, sat, unit;
 	int i, c;
 
@@ -1021,7 +1031,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			emit_mov(pc, dst[c], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_DP4:
 		temp = alloc_temp(pc, NULL);
@@ -1034,7 +1043,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			emit_mov(pc, dst[c], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_DPH:
 		temp = alloc_temp(pc, NULL);
@@ -1047,7 +1055,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			emit_mov(pc, dst[c], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_DST:
 	{
@@ -1072,7 +1079,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			emit_mov(pc, dst[c], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_FLR:
 		for (c = 0; c < 4; c++) {
@@ -1089,7 +1095,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			emit_flr(pc, temp, src[0][c]);
 			emit_sub(pc, dst[c], src[0][c], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_KIL:
 		emit_kil(pc, src[0][0]);
@@ -1110,15 +1115,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 		break;
 	case TGSI_OPCODE_LRP:
+		temp = alloc_temp(pc, NULL);
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			/*XXX: we can do better than this */
-			temp = alloc_temp(pc, NULL);
-			emit_neg(pc, temp, src[0][c]);
-			emit_mad(pc, temp, temp, src[2][c], src[2][c]);
-			emit_mad(pc, dst[c], src[0][c], src[1][c], temp);
-			free_temp(pc, temp);
+			emit_sub(pc, temp, src[1][c], src[2][c]);
+			emit_mad(pc, dst[c], temp, src[0][c], src[2][c]);
 		}
 		break;
 	case TGSI_OPCODE_MAD:
@@ -1164,7 +1166,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			emit_mov(pc, dst[c], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_RCP:
 		for (c = 0; c < 4; c++) {
@@ -1259,7 +1260,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			emit_mul(pc, temp, src[0][1], src[1][0]);
 			emit_msb(pc, dst[2], src[0][0], src[1][1], temp);
 		}
-		free_temp(pc, temp);
 		break;
 	case TGSI_OPCODE_END:
 		break;
@@ -1268,6 +1268,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		return FALSE;
 	}
 
+	if (temp)
+		free_temp(pc, temp);
+
 	if (sat) {
 		for (c = 0; c < 4; c++) {
 			struct nv50_program_exec *e;
@@ -1288,6 +1291,19 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 	}
 
+	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
+		for (c = 0; c < 4; c++) {
+			if (!src[i][c])
+				continue;
+			if (src[i][c]->index == -1 && src[i][c]->type == P_IMMD)
+				FREE(src[i][c]);
+
+			/* Might also release temporaries not used anymore in this loop,
+			 * therefore no temp_immd and temp_immd_nr like for temp_temp.
+			 */
+		}
+	}
+
 	kill_temp_temp(pc);
 	return TRUE;
 }

--------------020807040709030700080400
Content-Type: text/plain;
 name="patch-01.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-01.diff"

commit 93d8cfb3e13179d6ed28c4989cefc92389008f0b
Author: chr <chr@LAPTOP.(none)>
Date:   Tue May 5 20:54:43 2009 +0200

    - extend nv50_pc to track insn nr, add allow half insn boolean
    - extend nv50_reg to record insn of last use and FP output hw index
    - add some functions for later use
    - modify alloc_reg to prefer final FP output hw if set
    - record interpolation mode in tx_prep
    - count number of insns in tx_prep
    - record depth output, and position and color input indices
    - inspect instructions for register usage
    - set pc->allow32 to FALSE on first and last insn
    
    shouldn't change generated shader code yet

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 1a94327..cb92a31 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -86,6 +86,9 @@ struct nv50_reg {
 
 	int hw;
 	int neg;
+
+	int rhw; /* result hw for FP outputs */
+	int acc; /* instruction where this reg is last read (first insn == 1) */
 };
 
 struct nv50_pc {
@@ -109,6 +112,12 @@ struct nv50_pc {
 
 	struct nv50_reg *temp_temp[16];
 	unsigned temp_temp_nr;
+
+	/* current instruction and total number of insns */
+	unsigned insn_cur;
+	unsigned insn_nr;
+
+	boolean allow32; /* TRUE when half insns are allowed */
 };
 
 static void
@@ -132,7 +141,24 @@ alloc_reg(struct nv50_pc *pc, struct nv50_reg *reg)
 		return;
 	}
 
-	for (i = 0; i < NV50_SU_MAX_TEMP; i++) {
+	i = 0;
+	if (reg->rhw != -1) {
+		/* try to allocate temporary with index rhw first */
+		if (!(pc->r_temp[reg->rhw])) {
+			pc->r_temp[reg->rhw] = reg;
+			reg->hw = reg->rhw;
+			if (pc->p->cfg.high_temp < (reg->rhw + 1))
+				pc->p->cfg.high_temp = reg->rhw + 1;
+			return;
+		}
+        /* If we can't allocate the final destination index of the output,
+         * put it in a high temporary so we need not shuffle around later.
+		 * (like, $r0 needs to go in $r1 and $r1 in $r0 etc.)
+         */
+		i = pc->result_nr * 4;
+	}
+
+	for (; i < NV50_SU_MAX_TEMP; i++) {
 		if (!(pc->r_temp[i])) {
 			pc->r_temp[i] = reg;
 			reg->hw = i;
@@ -160,6 +186,7 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
 			r->type = P_TEMP;
 			r->index = -1;
 			r->hw = i;
+			r->rhw = -1;
 			pc->r_temp[i] = r;
 			return r;
 		}
@@ -169,6 +196,56 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
 	return NULL;
 }
 
+static struct nv50_reg *
+alloc_preferred_temp(struct nv50_pc *pc, int hw)
+{
+	struct nv50_reg *r;
+
+	if (hw >= NV50_SU_MAX_TEMP || hw == -1 || pc->r_temp[hw])
+		return alloc_temp(pc, NULL);
+
+	r = CALLOC_STRUCT(nv50_reg);
+	r->type = P_TEMP;
+	r->index = -1;
+	r->hw = hw;
+	r->rhw = -1;
+	pc->r_temp[hw] = r;
+
+	return r;
+}
+
+/* Assign the hw of the discarded temporary register src
+ * to the tgsi register dst and free src.
+ */
+static void
+assimilate_temp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
+{
+	assert(dst->index != -1 && src->index == -1 && src->hw != -1);
+
+	if (dst->hw != -1)
+		pc->r_temp[dst->hw] = NULL;
+	pc->r_temp[src->hw] = dst;
+	dst->hw = src->hw;
+
+	FREE(src);
+}
+
+/* release the hardware resource held by r */
+static void
+release_hw(struct nv50_pc *pc, struct nv50_reg *r)
+{
+	assert(r->type == P_TEMP);
+	if (r->hw == -1)
+		return;
+
+	assert(pc->r_temp[r->hw] == r);
+	pc->r_temp[r->hw] = NULL;
+	
+	r->acc = 0;
+	if (r->index == -1)
+		FREE(r);
+}
+
 static void
 free_temp(struct nv50_pc *pc, struct nv50_reg *r)
 {
@@ -251,7 +328,14 @@ alloc_immd(struct nv50_pc *pc, float f)
 	struct nv50_reg *r = CALLOC_STRUCT(nv50_reg);
 	unsigned hw;
 
-	hw = ctor_immd(pc, f, 0, 0, 0) * 4;
+	/* don't allocate more space if the value is already there */
+	for (hw = 0; hw < pc->immd_nr * 4; ++hw)
+		if (pc->immd_buf[hw] == f)
+			break;
+
+	if (hw == pc->immd_nr * 4)
+		hw = ctor_immd(pc, f, 0, 0, 0) * 4;
+
 	r->type = P_IMMD;
 	r->hw = hw;
 	r->index = -1;
@@ -355,6 +439,12 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_exec *e)
 	e->inst[1] |= (val >> 6) << 2;
 }
 
+
+#define INTERP_LINEAR		0
+#define INTERP_FLAT			1
+#define INTERP_PERSPECTIVE	2
+#define INTERP_CENTROID		4
+
 static void
 emit_interp(struct nv50_pc *pc, struct nv50_reg *dst,
 	    struct nv50_reg *src, struct nv50_reg *iv)
@@ -535,6 +625,14 @@ set_src_2(struct nv50_pc *pc, struct nv50_reg *src, struct nv50_program_exec *e)
 	e->inst[1] |= (src->hw << 14);
 }
 
+static boolean
+requires_long(struct nv50_program_exec *e, struct nv50_reg *src)
+{
+	if (is_long(e) || src->type == P_IMMD || src->type == P_CONST)
+		return TRUE;
+	return FALSE;
+}
+
 static void
 emit_mul(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
 	 struct nv50_reg *src1)
@@ -870,6 +968,62 @@ emit_kil(struct nv50_pc *pc, struct nv50_reg *src)
 	emit(pc, e);
 }
 
+static void
+emit_nop(struct nv50_pc *pc, boolean l)
+{
+	struct nv50_program_exec *e = exec(pc);
+
+	e->inst[0] = 0xF0000000;
+	if (l) {
+		set_long(pc, e);
+		e->inst[1] = 0xE0000000;
+	}
+
+	emit(pc, e);
+}
+
+/* Adjust a bitmask that indicates what components of a source are used,
+ * we use this in tx_prep so we only load interpolants that are needed.
+ */
+static void
+insn_adjust_mask(const struct tgsi_full_instruction *insn, unsigned *mask)
+{
+	const struct tgsi_instruction_ext_texture *tex;
+	
+	switch (insn->Instruction.Opcode) {
+	case TGSI_OPCODE_DP3:
+		*mask = 0x7;
+		break;
+	case TGSI_OPCODE_DP4:
+	case TGSI_OPCODE_DPH:
+		*mask = 0xF;
+		break;
+	case TGSI_OPCODE_LIT:
+		*mask = 0xB;
+		break;
+	case TGSI_OPCODE_RCP:
+	case TGSI_OPCODE_RSQ:
+		*mask = 0x1;
+		break;
+	case TGSI_OPCODE_TXP:
+		*mask = 0x8;
+		/* fall through to TEX */
+	case TGSI_OPCODE_TEX:
+		assert(insn->Instruction.Extended);
+		tex = &insn->InstructionExtTexture;
+
+		if (tex->Texture == TGSI_TEXTURE_1D)
+			*mask |= 0x1;
+		else
+		if (tex->Texture == TGSI_TEXTURE_2D)
+			*mask |= 0x3;
+		else
+			*mask |= 0x7;
+	default:
+		break;
+	}
+}
+
 static struct nv50_reg *
 tgsi_dst(struct nv50_pc *pc, int c, const struct tgsi_full_dst_register *dst)
 {
@@ -1308,12 +1462,53 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	return TRUE;
 }
 
+static void
+set_acc_array(unsigned *p, const struct tgsi_full_src_register *src,
+			  unsigned mask, unsigned n)
+{
+	unsigned k, c;
+
+	for (c = 0; c < 4; c++) {
+		if (!(mask & (1 << c)))
+			continue;
+
+		k = tgsi_util_get_full_src_register_extswizzle(src, c);
+		switch (k) {
+		case TGSI_EXTSWIZZLE_X:
+		case TGSI_EXTSWIZZLE_Y:
+		case TGSI_EXTSWIZZLE_Z:
+		case TGSI_EXTSWIZZLE_W:
+			p[src->SrcRegister.Index * 4 + k] = n;
+			break;
+		default:
+			break;
+		}
+	}
+}
+
 static boolean
 nv50_program_tx_prep(struct nv50_pc *pc)
 {
 	struct tgsi_parse_context p;
 	boolean ret = FALSE;
 	unsigned i, c;
+	unsigned fcol, bcol, fcrd, depr;
+
+	/* record interpolation mode from declaration */
+	boolean centroid_load = FALSE;
+	boolean perspect_load = FALSE;
+	unsigned interp_mode[32];
+
+	/* track register usage for temps and attrs */
+	unsigned *last_t_use = NULL;
+	unsigned *last_a_use = NULL;
+
+	depr = fcol = bcol = fcrd = 0xFFFFFFFF;
+	
+	if (pc->p->type == PIPE_SHADER_FRAGMENT) {
+		pc->p->cfg.fp.regs[0] = 0x01000404;
+		pc->p->cfg.fp.regs[1] = 0x00000400;
+	}
 
 	tgsi_parse_init(&p, pc->p->pipe.tokens);
 	while (!tgsi_parse_end_of_tokens(&p)) {
@@ -1326,6 +1521,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			const struct tgsi_full_immediate *imm =
 				&p.FullToken.FullImmediate;
 
+#ifdef NV50_PROGRAM_DUMP
+			tgsi_dump_immediate(imm);
+#endif
+
 			ctor_immd(pc, imm->u.ImmediateFloat32[0].Float,
 				      imm->u.ImmediateFloat32[1].Float,
 				      imm->u.ImmediateFloat32[2].Float,
@@ -1335,11 +1534,16 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		case TGSI_TOKEN_TYPE_DECLARATION:
 		{
 			const struct tgsi_full_declaration *d;
-			unsigned last;
+			unsigned last, first, mode;
 
 			d = &p.FullToken.FullDeclaration;
+			first = d->DeclarationRange.First;
 			last = d->DeclarationRange.Last;
 
+#ifdef NV50_PROGRAM_DUMP
+			tgsi_dump_declaration(d);
+#endif
+
 			switch (d->Declaration.File) {
 			case TGSI_FILE_TEMPORARY:
 				if (pc->temp_nr < (last + 1))
@@ -1348,10 +1552,71 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			case TGSI_FILE_OUTPUT:
 				if (pc->result_nr < (last + 1))
 					pc->result_nr = last + 1;
+
+				if (!d->Declaration.Semantic)
+					break;
+
+				switch (d->Semantic.SemanticName) {
+				case TGSI_SEMANTIC_POSITION:
+					depr = first;
+					pc->p->cfg.fp.regs[2] |= 0x00000100;
+					pc->p->cfg.fp.regs[3] |= 0x00000011;
+					break;
+				default:
+					break;
+				}
 				break;
 			case TGSI_FILE_INPUT:
+			{
 				if (pc->attr_nr < (last + 1))
 					pc->attr_nr = last + 1;
+
+				if (pc->p->type != PIPE_SHADER_FRAGMENT)
+					break;
+
+			    switch (d->Declaration.Interpolate) {
+				case TGSI_INTERPOLATE_CONSTANT:
+					mode = INTERP_FLAT;
+					break;
+				case TGSI_INTERPOLATE_PERSPECTIVE:
+					mode = INTERP_PERSPECTIVE;
+					perspect_load = TRUE;
+					break;
+				default:
+					mode = INTERP_LINEAR;
+					break;
+				}
+
+				if (d->Declaration.Semantic) {
+					switch (d->Semantic.SemanticName) {
+					case TGSI_SEMANTIC_POSITION:
+						fcrd = first;
+						break;
+					case TGSI_SEMANTIC_COLOR:
+						fcol = first;
+						mode = INTERP_PERSPECTIVE;
+						perspect_load = TRUE;
+						break;
+					case TGSI_SEMANTIC_BCOLOR:
+						bcol = first;
+						mode = INTERP_PERSPECTIVE;
+						perspect_load = TRUE;
+						break;
+					default:
+						break;
+					}
+				}
+
+				if (d->Declaration.Centroid) {
+					mode |= INTERP_CENTROID;
+					centroid_load = TRUE;
+					perspect_load = FALSE;
+				}
+				
+				assert(last < 32);
+				for (i = first; i <= last; i++)
+					interp_mode[i] = mode;
+			}
 				break;
 			case TGSI_FILE_CONSTANT:
 				if (pc->param_nr < (last + 1))
@@ -1367,6 +1632,43 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		}
 			break;
 		case TGSI_TOKEN_TYPE_INSTRUCTION:
+		{
+			const struct tgsi_full_instruction *insn;
+			const struct tgsi_full_src_register *src;
+			const struct tgsi_dst_register *dst;
+			unsigned mask;
+
+			pc->insn_nr++;
+
+			if (!last_t_use) {
+				last_t_use = CALLOC(pc->temp_nr * 4, sizeof(unsigned));
+				last_a_use = CALLOC(pc->attr_nr * 4, sizeof(unsigned));
+			}
+
+			insn = &tok->FullInstruction;
+			dst = &insn->FullDstRegisters[0].DstRegister;
+			mask = dst->WriteMask;
+
+#ifdef NV50_PROGRAM_DUMP
+			tgsi_dump_instruction(insn, 1);
+#endif
+			if (dst->File == TGSI_FILE_TEMPORARY) {
+				for (c = 0; c < 4; c++)
+					if (mask & (1 << c))
+						last_t_use[dst->Index * 4 + c] = pc->insn_nr;
+			}
+
+			for (i = 0; i < insn->Instruction.NumSrcRegs; ++i) {
+				src = &insn->FullSrcRegisters[i];
+				insn_adjust_mask(insn, &mask);
+
+				if (src->SrcRegister.File == TGSI_FILE_TEMPORARY)
+					set_acc_array(last_t_use, src, mask, pc->insn_nr);
+				else
+				if (src->SrcRegister.File == TGSI_FILE_INPUT)
+					set_acc_array(last_a_use, src, mask, pc->insn_nr);
+			}
+		}
 			break;
 		default:
 			break;
@@ -1487,6 +1789,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		}
 	}
 
+	if (last_t_use)
+		FREE(last_t_use);
+	if (last_a_use)
+		FREE(last_a_use);
+
 	ret = TRUE;
 out_err:
 	tgsi_parse_free(&p);
@@ -1516,8 +1823,15 @@ nv50_program_tx(struct nv50_program *p)
 
 		tgsi_parse_token(&parse);
 
+		/* don't allow half insn on first and last (not END) instruction */
+		if (pc->insn_cur == 0 || pc->insn_cur + 2 == pc->insn_nr)
+			pc->allow32 = FALSE;
+		else
+			pc->allow32 = TRUE;
+
 		switch (tok->Token.Type) {
 		case TGSI_TOKEN_TYPE_INSTRUCTION:
+			++pc->insn_cur;
 			ret = nv50_program_tx_insn(pc, tok);
 			if (ret == FALSE)
 				goto out_err;
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index 78deed6..3b3b6bb 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -39,6 +39,11 @@ struct nv50_program {
 		struct {
 			unsigned attr[2];
 		} vp;
+		struct {
+			unsigned regs[4];
+			unsigned map[4];
+			unsigned high_map;
+		} fp;
 	} cfg;
 };
 

--------------020807040709030700080400
Content-Type: text/plain;
 name="patch-02.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-02.diff"

commit ebcc4b9cf61a25d8ef2fa87eecfb5e4e75b47bca
Author: chr <chr@LAPTOP.(none)>
Date:   Tue May 5 20:56:12 2009 +0200

    - more correct loading FP interpolants, also consider interpolation mode
    - use tgsi resource nv50_regs to store attributes
    - improve values of shader registers
    - make sure FP depth output goes where it's supposed to go
    - loop through all instructions and make sure there are no single half insns

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index cb92a31..9acf882 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -445,20 +445,29 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_exec *e)
 #define INTERP_PERSPECTIVE	2
 #define INTERP_CENTROID		4
 
+/* interpolant index has been stored in dst->rhw */
 static void
-emit_interp(struct nv50_pc *pc, struct nv50_reg *dst,
-	    struct nv50_reg *src, struct nv50_reg *iv)
+emit_interp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *iv,
+		unsigned mode)
 {
+	assert(dst->rhw != -1);
 	struct nv50_program_exec *e = exec(pc);
 
 	e->inst[0] |= 0x80000000;
 	set_dst(pc, dst, e);
-	alloc_reg(pc, src);
-	e->inst[0] |= (src->hw << 16);
-	if (iv) {
-		e->inst[0] |= (1 << 25);
-		alloc_reg(pc, iv);
-		e->inst[0] |= (iv->hw << 9);
+	e->inst[0] |= (dst->rhw << 16);
+
+	if (mode & INTERP_FLAT) {
+		e->inst[0] |= (1 << 8);
+	} else {
+		if (mode & INTERP_PERSPECTIVE) {
+			e->inst[0] |= (1 << 25);
+			alloc_reg(pc, iv);
+			e->inst[0] |= (iv->hw << 9);
+		}
+
+		if (mode & INTERP_CENTROID)
+			e->inst[0] |= (1 << 24);
 	}
 
 	emit(pc, e);
@@ -982,6 +991,43 @@ emit_nop(struct nv50_pc *pc, boolean l)
 	emit(pc, e);
 }
 
+static void
+convert_to_long(struct nv50_pc *pc, struct nv50_program_exec *e)
+{
+	unsigned q = 0, m = ~0;
+
+	assert(!is_long(e));
+
+	switch (e->inst[0] >> 28) {
+		case 0x1:
+			/* MOV */
+			q = 0x0403c000;
+			m = 0xFFFF7FFF;
+			break;
+		case 0x8:
+			/* INTERP */
+			m = ~0x02000000;
+			if (e->inst[0] & 0x02000000)
+				q = 0x00020000;
+			break;
+		case 0xC:
+			/* MUL */
+			break;
+		case 0x9:
+			/* RCP */
+			break;
+		default:
+			assert(0);
+			break;
+	}
+
+	set_long(pc, e);
+	pc->p->exec_size++;
+
+	e->inst[0] &= m;
+	e->inst[1] |= q;
+}
+
 /* Adjust a bitmask that indicates what components of a source are used,
  * we use this in tx_prep so we only load interpolants that are needed.
  */
@@ -1005,20 +1051,21 @@ insn_adjust_mask(const struct tgsi_full_instruction *insn, unsigned *mask)
 	case TGSI_OPCODE_RSQ:
 		*mask = 0x1;
 		break;
-	case TGSI_OPCODE_TXP:
-		*mask = 0x8;
-		/* fall through to TEX */
 	case TGSI_OPCODE_TEX:
+	case TGSI_OPCODE_TXP:
 		assert(insn->Instruction.Extended);
 		tex = &insn->InstructionExtTexture;
 
+		*mask = 0x7;
 		if (tex->Texture == TGSI_TEXTURE_1D)
-			*mask |= 0x1;
+			*mask = 0x1;
 		else
 		if (tex->Texture == TGSI_TEXTURE_2D)
-			*mask |= 0x3;
-		else
-			*mask |= 0x7;
+			*mask = 0x3;
+
+		if (insn->Instruction.Opcode == TGSI_OPCODE_TXP)
+			*mask |= 0x8;
+		break;
 	default:
 		break;
 	}
@@ -1255,6 +1302,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		emit_kil(pc, src[0][1]);
 		emit_kil(pc, src[0][2]);
 		emit_kil(pc, src[0][3]);
+		pc->p->cfg.fp.regs[2] |= 0x00100000;
 		break;
 	case TGSI_OPCODE_LIT:
 		emit_lit(pc, &dst[0], mask, &src[0][0]);
@@ -1503,7 +1551,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	unsigned *last_t_use = NULL;
 	unsigned *last_a_use = NULL;
 
-	depr = fcol = bcol = fcrd = 0xFFFFFFFF;
+	depr = fcol = bcol = fcrd = 0xFFFF;
 	
 	if (pc->p->type == PIPE_SHADER_FRAGMENT) {
 		pc->p->cfg.fp.regs[0] = 0x01000404;
@@ -1683,37 +1731,106 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		for (i = 0; i < pc->temp_nr; i++) {
 			for (c = 0; c < 4; c++) {
 				pc->temp[i*4+c].type = P_TEMP;
-				pc->temp[i*4+c].hw = -1;
+				pc->temp[i*4+c].hw = pc->temp[i*4+c].rhw = -1;
 				pc->temp[i*4+c].index = i;
+				pc->temp[i*4+c].acc = last_t_use[i*4+c];
 			}
 		}
 	}
 
 	if (pc->attr_nr) {
-		struct nv50_reg *iv = NULL;
-		int aid = 0;
+		struct nv50_reg *iv, *iv_c = NULL, *iv_p = NULL;
+		int oid, off = 4, mid = 0, aid = 0;
+
+		/* off = VP output id offset to i*4 (oid = i*4 + off + c)
+		 * aid = FP attribute/interpolant id (incremented only for used attrs)
+		 * mid = VP output mapping field ID (HPOS not counted)
+		 */
 
 		pc->attr = CALLOC(pc->attr_nr * 4, sizeof(struct nv50_reg));
 		if (!pc->attr)
 			goto out_err;
 
+		i = 0;
 		if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-			iv = alloc_temp(pc, NULL);
-			emit_interp(pc, iv, iv, NULL);
-			emit_flop(pc, 0, iv, iv);
-			aid++;
+
+			if (fcrd != 0xFFFF) {
+				assert(fcrd == 0); /* position input should always be 0 */
+				i = 1;
+				off = 0;
+				for (c = 0; c < 4; ++c) {
+					if (last_a_use[c] == 0)
+						continue;
+
+					pc->attr[c].index = fcrd;
+					pc->attr[c].type = P_TEMP;
+					pc->attr[c].acc = last_a_use[c];
+					pc->attr[c].hw = pc->attr[c].rhw = -1;
+
+					alloc_reg(pc, &pc->attr[c]);
+					pc->attr[c].rhw = aid++;
+
+					emit_interp(pc, &pc->attr[c], NULL, INTERP_LINEAR);
+					pc->p->cfg.fp.regs[1] |= (1 << (24 + c));
+
+					switch (c) {
+					case 0:
+					case 1:
+						/* should probably do viewport stuff here */
+						break;
+					case 3:
+						iv_p = &pc->attr[c];
+						emit_flop(pc, 0, iv_p, iv_p);
+						break;
+					default:
+						break;
+					}
+				}
+			}
+
+			if (perspect_load && !iv_p) {
+				iv_p = alloc_temp(pc, NULL);
+				iv_p->rhw = aid++;
+				emit_interp(pc, iv_p, NULL, INTERP_LINEAR);
+				emit_flop(pc, 0, iv_p, iv_p);
+				pc->p->cfg.fp.regs[1] |= 0x08000000;
+			}
+
+			if (centroid_load) {
+				iv_c = alloc_temp(pc, NULL);
+				iv_c->rhw = iv_p ? aid - 1 : aid++;
+				emit_interp(pc, iv_c, NULL, INTERP_CENTROID);
+				emit_flop(pc, 0, iv_c, iv_c);
+				pc->p->cfg.fp.regs[1] |= 0x08000000;
+			}
 		}
 
-		for (i = 0; i < pc->attr_nr; i++) {
+		for (; i < pc->attr_nr; i++) {
 			struct nv50_reg *a = &pc->attr[i*4];
+			iv = (interp_mode[i] & INTERP_CENTROID) ? iv_c : iv_p;
 
 			for (c = 0; c < 4; c++) {
 				if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-					struct nv50_reg *at =
-						alloc_temp(pc, NULL);
-					pc->attr[i*4+c].type = at->type;
-					pc->attr[i*4+c].hw = at->hw;
-					pc->attr[i*4+c].index = at->index;
+					a[c].hw = a[c].rhw = -1;
+					a[c].index = -1;
+					if (last_a_use[i*4+c] == 0)
+						continue;
+
+					if (i == fcol || i == bcol)
+						pc->p->cfg.fp.regs[0] += 0x00010000;
+					pc->p->cfg.fp.regs[1] += 0x00010000;
+
+					a[c].index = i;
+					a[c].type = P_TEMP;
+					a[c].acc = last_a_use[i*4+c];
+
+					alloc_reg(pc, &a[c]);
+					a[c].rhw = aid++;
+					emit_interp(pc, &a[c], iv, interp_mode[i]);
+
+					oid = off + i * 4 + c;
+					pc->p->cfg.fp.map[mid / 4] |= oid << (8 * (mid % 4));
+					mid++;
 				} else {
 					pc->p->cfg.vp.attr[aid/32] |=
 						(1 << (aid % 32));
@@ -1722,18 +1839,16 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 					pc->attr[i*4+c].index = i;
 				}
 			}
+		}
 
-			if (pc->p->type != PIPE_SHADER_FRAGMENT)
-				continue;
+		if (pc->p->type == PIPE_SHADER_FRAGMENT) {
+			pc->p->cfg.fp.high_map = (mid / 4) + ((mid % 4) ? 1 : 0);
 
-			emit_interp(pc, &a[0], &a[0], iv);
-			emit_interp(pc, &a[1], &a[1], iv);
-			emit_interp(pc, &a[2], &a[2], iv);
-			emit_interp(pc, &a[3], &a[3], iv);
+			if (iv_p && iv_p->index == -1)
+				free_temp(pc, iv_p);
+			if (iv_c)
+				free_temp(pc, iv_c);
 		}
-
-		if (iv)
-			free_temp(pc, iv);
 	}
 
 	if (pc->result_nr) {
@@ -1748,9 +1863,15 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 				if (pc->p->type == PIPE_SHADER_FRAGMENT) {
 					pc->result[i*4+c].type = P_TEMP;
 					pc->result[i*4+c].hw = -1;
+					if (i == depr) {
+						pc->result[i*4+c].rhw = ((c == 2) ?
+							(pc->result_nr - 1) * 4 : -1);
+					} else
+						pc->result[i*4+c].rhw = rid++;
 				} else {
 					pc->result[i*4+c].type = P_RESULT;
 					pc->result[i*4+c].hw = rid++;
+					pc->result[i*4+c].rhw = -1;
 				}
 				pc->result[i*4+c].index = i;
 			}
@@ -1805,6 +1926,7 @@ nv50_program_tx(struct nv50_program *p)
 {
 	struct tgsi_parse_context parse;
 	struct nv50_pc *pc;
+	unsigned i, k;
 	boolean ret;
 
 	pc = CALLOC_STRUCT(nv50_pc);
@@ -1843,10 +1965,42 @@ nv50_program_tx(struct nv50_program *p)
 
 	if (p->type == PIPE_SHADER_FRAGMENT) {
 		struct nv50_reg out;
-
 		out.type = P_TEMP;
-		for (out.hw = 0; out.hw < pc->result_nr * 4; out.hw++)
-			emit_mov(pc, &out, &pc->result[out.hw]);
+
+		for (i = 0; i < pc->result_nr * 4; i++) {
+			if (pc->result[i].rhw == -1)
+				continue;
+			if (pc->result[i].hw != pc->result[i].rhw) {
+				out.hw = pc->result[i].rhw;
+				emit_mov(pc, &out, &pc->result[i]);
+			}
+			if (pc->p->cfg.high_result < pc->result[i].rhw + 1)
+				pc->p->cfg.high_result = pc->result[i].rhw + 1;
+		}
+	}
+
+	/* look for single half instructions and make them long */
+	struct nv50_program_exec *e, *e_prev;
+
+	for (k = 0, e = pc->p->exec_head, e_prev = NULL; e; e = e->next) {
+		if (!is_long(e))
+			k++;
+
+		if (!e->next || is_long(e->next)) {
+			if (k & 1)
+				convert_to_long(pc, e);
+			k = 0;
+		}
+
+		if (e->next)
+			e_prev = e;
+	}
+
+	if (!is_long(pc->p->exec_tail)) {
+		/* this may occur if moving FP results */
+		assert(e_prev && !is_long(e_prev));
+		convert_to_long(pc, e_prev);
+		convert_to_long(pc, pc->p->exec_tail);
 	}
 
 	assert(is_long(pc->p->exec_tail) && !is_immd(pc->p->exec_head));
@@ -1973,7 +2127,7 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 		if (is_long(e))
 			NOUVEAU_ERR("0x%08x\n", e->inst[1]);
 	}
-
+	FREE(up);
 #endif
 
 	up = ptr = MALLOC(p->exec_size * 4);
@@ -2058,6 +2212,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_program *p = nv50->fragprog;
 	struct nouveau_stateobj *so;
+	unsigned i;
 
 	if (!p->translated) {
 		nv50_program_validate(nv50, p);
@@ -2068,24 +2223,30 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(64, 2);
+	so = so_new(32, 2);
 	so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
 	so_reloc (so, p->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		  NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, p->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		  NOUVEAU_BO_LOW, 0, 0);
 	so_method(so, tesla, 0x1904, 4);
-	so_data  (so, 0x00040404); /* p: 0x01000404 */
+	so_data  (so, p->cfg.fp.regs[0]); /* 0x01000404 / 0x00040404 etc. */
 	so_data  (so, 0x00000004);
 	so_data  (so, 0x00000000);
 	so_data  (so, 0x00000000);
-	so_method(so, tesla, 0x16bc, 3); /*XXX: fixme */
+	so_method(so, tesla, 0x16bc, 1 + p->cfg.fp.high_map);
 	so_data  (so, 0x03020100);
-	so_data  (so, 0x07060504);
-	so_data  (so, 0x0b0a0908);
+	for (i = 0; i < p->cfg.fp.high_map; i++)
+		so_data(so, p->cfg.fp.map[i]);
 	so_method(so, tesla, 0x1988, 2);
-	so_data  (so, 0x08080408); //0x08040404); /* p: 0x0f000401 */
+	so_data  (so, p->cfg.fp.regs[1]); /* 0x08040404 / 0x0f000401 etc. */
 	so_data  (so, p->cfg.high_temp);
+	so_method(so, tesla, 0x1298, 1);
+	so_data  (so, p->cfg.high_result);
+	so_method(so, tesla, 0x19a8, 1);
+	so_data  (so, p->cfg.fp.regs[2]);
+	so_method(so, tesla, 0x196c, 1);
+	so_data  (so, p->cfg.fp.regs[3]);
 	so_method(so, tesla, 0x1414, 1);
 	so_data  (so, 0); /* program start offset */
 	so_ref(so, &nv50->state.fragprog);

--------------020807040709030700080400
Content-Type: text/plain;
 name="patch-03.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-03.diff"

commit dacf2f879d63b5bf756da62eee901379336e7335
Author: chr <chr@LAPTOP.(none)>
Date:   Tue May 5 20:57:15 2009 +0200

    - avoid overwriting sources before they're used in cases where dst == src
    - add magical adjustment for register 1988 (I should find out how that
      really works)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 9acf882..e4fc261 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1162,12 +1162,40 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src)
 	return r;
 }
 
+/* returns TRUE if instruction can overwrite sources before they're read */
+static boolean
+direct2dest_op(const struct tgsi_full_instruction *insn)
+{
+	if (insn->Instruction.Saturate)
+		return FALSE;
+
+	switch (insn->Instruction.Opcode) {
+	case TGSI_OPCODE_COS:
+	case TGSI_OPCODE_DP3:
+	case TGSI_OPCODE_DP4:
+	case TGSI_OPCODE_DPH:
+	case TGSI_OPCODE_KIL:
+	case TGSI_OPCODE_LIT:
+	case TGSI_OPCODE_POW:
+	case TGSI_OPCODE_RCP:
+	case TGSI_OPCODE_RSQ:
+	case TGSI_OPCODE_SCS:
+	case TGSI_OPCODE_SIN:
+	case TGSI_OPCODE_TEX:
+	case TGSI_OPCODE_TXP:
+		return FALSE;
+	default:
+		return TRUE;
+	}
+}
+
 static boolean
 nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 {
 	const struct tgsi_full_instruction *inst = &tok->FullInstruction;
 	struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp = NULL;
 	unsigned mask, sat, unit;
+	boolean assimilate = FALSE;
 	int i, c;
 
 	mask = inst->FullDstRegisters[0].DstRegister.WriteMask;
@@ -1178,6 +1206,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			dst[c] = tgsi_dst(pc, c, &inst->FullDstRegisters[0]);
 		else
 			dst[c] = NULL;
+
+		rdst[c] = NULL;
+
+		src[0][c] = NULL;
+		src[1][c] = NULL;
+		src[2][c] = NULL;
 	}
 
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
@@ -1195,8 +1229,35 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			rdst[c] = dst[c];
 			dst[c] = temp_temp(pc);
 		}
+	} else if (direct2dest_op(inst)) {
+		for (c = 0; c < 4; c++) {
+			if (!dst[c] || dst[c]->type != P_TEMP)
+				continue;
+
+			for (i = c + 1; i < 4; i++) {
+				if (dst[c] == src[0][i] ||
+					dst[c] == src[1][i] ||
+					dst[c] == src[2][i])
+					break;
+			}
+			if (i == 4)
+				continue;
+
+			assimilate = TRUE;
+			rdst[c] = dst[c];
+			dst[c] = alloc_preferred_temp(pc, rdst[c]->rhw);
+		}
+	} else if (inst->Instruction.Opcode == TGSI_OPCODE_LIT) {
+		/* XXX: shouldn't give LIT an extra case here */
+		if (src[0][1] == dst[1] ||
+			src[0][3] == dst[1]) {
+			assimilate = TRUE;
+			rdst[1] = dst[1];
+			dst[1] = alloc_temp(pc, NULL);
+		}
 	}
 
+	i = -1;
 	switch (inst->Instruction.Opcode) {
 	case TGSI_OPCODE_ABS:
 		for (c = 0; c < 4; c++) {
@@ -1373,14 +1434,22 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_flop(pc, 0, dst[c], src[0][0]);
+			if (i == -1) {
+				emit_flop(pc, 0, dst[c], src[0][0]);
+				i = c;
+			} else
+				emit_mov(pc, dst[c], dst[i]);
 		}
 		break;
 	case TGSI_OPCODE_RSQ:
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_flop(pc, 2, dst[c], src[0][0]);
+			if (i == -1) {
+				emit_flop(pc, 2, dst[c], src[0][0]);
+				i = c;
+			} else
+				emit_mov(pc, dst[c], dst[i]);
 		}
 		break;
 	case TGSI_OPCODE_SCS:
@@ -1491,6 +1560,10 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			set_src_0(pc, dst[c], e);
 			emit(pc, e);
 		}
+	} else if (assimilate) {
+		for (c = 0; c < 4; c++)
+			if (rdst[c])
+				assimilate_temp(pc, rdst[c], dst[c]);
 	}
 
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
@@ -1499,10 +1572,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			if (src[i][c]->index == -1 && src[i][c]->type == P_IMMD)
 				FREE(src[i][c]);
-
-			/* Might also release temporaries not used anymore in this loop,
-			 * therefore no temp_immd and temp_immd_nr like for temp_temp.
-			 */
+			else
+			if (src[i][c]->acc == pc->insn_cur)
+				release_hw(pc, src[i][c]);
 		}
 	}
 
@@ -1996,6 +2068,18 @@ nv50_program_tx(struct nv50_program *p)
 			e_prev = e;
 	}
 
+	/* adjust register 1988 'heuristically' */
+	/* XXX: make this go away */
+	for (i = 0, k = 0; k < 4; ++k)
+		if (pc->p->cfg.fp.regs[1] & (1 << (24 + k)))
+			i++;
+	if (i > 3 || i < ((pc->p->cfg.fp.regs[1] >> 16) & 0xFF) + 3) {
+		pc->p->cfg.fp.regs[1] &= 0xFFFFFF00;
+		pc->p->cfg.fp.regs[1] |= ((pc->p->cfg.fp.regs[1] >> 16) & 0xFF);
+	} else {
+		pc->p->cfg.fp.regs[1] |= (3 - i);
+	}
+
 	if (!is_long(pc->p->exec_tail)) {
 		/* this may occur if moving FP results */
 		assert(e_prev && !is_long(e_prev));

--------------020807040709030700080400
Content-Type: text/plain;
 name="patch-04.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-04.diff"

commit 4411b1e3b3c11c69ec11148783327759a94165e2
Author: chr <chr@LAPTOP.(none)>
Date:   Wed May 6 11:46:17 2009 +0200

    Enable half insns and immediates for MOV and ADD.

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index e4fc261..2ab7b57 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -426,7 +426,7 @@ set_dst(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_program_exec *e)
 static INLINE void
 set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_exec *e)
 {
-	unsigned val = fui(pc->immd_buf[imm->hw]); /* XXX */
+	unsigned val = fui(pc->immd_buf[imm->hw - pc->param_nr * 4]);
 
 	set_long(pc, e);
 	/*XXX: can't be predicated - bits overlap.. catch cases where both
@@ -505,12 +505,11 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 
 	set_dst(pc, dst, e);
 
-	if (0 && dst->type != P_RESULT && src->type == P_IMMD) {
+	if (pc->allow32 && dst->type != P_RESULT && src->type == P_IMMD) {
 		set_immd(pc, src, e);
 		/*XXX: 32-bit, but steals part of "half" reg space - need to
 		 *     catch and handle this case if/when we do half-regs
 		 */
-		e->inst[0] |= 0x00008000;
 	} else
 	if (src->type == P_IMMD || src->type == P_CONST) {
 		set_long(pc, e);
@@ -526,13 +525,15 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 		e->inst[0] |= (src->hw << 9);
 	}
 
-	/* We really should support "half" instructions here at some point,
-	 * but I don't feel confident enough about them yet.
-	 */
-	set_long(pc, e);
-	if (is_long(e) && !is_immd(e)) {
+	if (!is_long(e) || is_immd(e))
+		e->inst[0] |= 0x00008000;
+	else {
 		e->inst[1] |= 0x04000000; /* 32-bit */
-		e->inst[1] |= 0x0003c000; /* "subsubop" 0xf == mov */
+
+		/* XXX: look into this 0x3 or 0xf again */
+		e->inst[1] |= 0x0000c000; /* "subsubop" 0x3 */
+		if (!(e->inst[1] & 0x20000000))
+			e->inst[1] |= 0x00030000; /* "subsubop" 0xf */
 	}
 
 	emit(pc, e);
@@ -606,6 +607,7 @@ set_src_1(struct nv50_pc *pc, struct nv50_reg *src, struct nv50_program_exec *e)
 	e->inst[0] |= (src->hw << 16);
 }
 
+/* XXX: can source 2 really be a constant ? */
 static void
 set_src_2(struct nv50_pc *pc, struct nv50_reg *src, struct nv50_program_exec *e)
 {
@@ -670,7 +672,10 @@ emit_add(struct nv50_pc *pc, struct nv50_reg *dst,
 	check_swap_src_0_1(pc, &src0, &src1);
 	set_dst(pc, dst, e);
 	set_src_0(pc, src0, e);
-	if (is_long(e))
+	if (!is_long(e) && src1->type == P_IMMD && pc->allow32)
+		set_immd(pc, src1, e);
+	else
+	if (requires_long(e, src1))
 		set_src_2(pc, src1, e);
 	else
 		set_src_1(pc, src1, e);
@@ -902,6 +907,7 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 	struct nv50_reg *neg128 = alloc_immd(pc, -127.999999);
 	struct nv50_reg *pos128 = alloc_immd(pc,  127.999999);
 	struct nv50_reg *tmp[4];
+	boolean allow32 = pc->allow32;
 
 	if (mask & (3 << 1)) {
 		if (mask & (1 << 1))
@@ -911,6 +917,8 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 		emit_minmax(pc, 4, tmp[0], src[0], zero);
 	}
 
+	pc->allow32 = FALSE;
+
 	if (mask & (1 << 2)) {
 		set_pred_wr(pc, 1, 0, pc->p->exec_tail);
 
@@ -926,6 +934,8 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 		set_pred(pc, 3, 0, pc->p->exec_tail);
 	}
 
+	pc->allow32 = allow32;
+
 	/* do this last, in case src[i,j] == dst[0,3] */
 	if (mask & (1 << 0))
 		emit_mov(pc, dst[0], one);

--------------020807040709030700080400
Content-Type: text/plain;
 name="patch-05.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-05.diff"

commit 88dbc993e651da91d66c4ca471d11ee5aa2b5085
Author: chr <chr@LAPTOP.(none)>
Date:   Wed May 6 11:50:17 2009 +0200

    Use multiple (3 for now: PVP, PFP, PMISC) constant buffers.

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 2ab7b57..6e279bd 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -426,7 +426,7 @@ set_dst(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_program_exec *e)
 static INLINE void
 set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_exec *e)
 {
-	unsigned val = fui(pc->immd_buf[imm->hw - pc->param_nr * 4]);
+	unsigned val = fui(pc->immd_buf[imm->hw]);
 
 	set_long(pc, e);
 	/*XXX: can't be predicated - bits overlap.. catch cases where both
@@ -478,22 +478,14 @@ set_data(struct nv50_pc *pc, struct nv50_reg *src, unsigned m, unsigned s,
 	 struct nv50_program_exec *e)
 {
 	set_long(pc, e);
-#if 1
-	e->inst[1] |= (1 << 22);
-#else
-	if (src->type == P_IMMD) {
-		e->inst[1] |= (NV50_CB_PMISC << 22);
-	} else {
-		if (pc->p->type == PIPE_SHADER_VERTEX)
-			e->inst[1] |= (NV50_CB_PVP << 22);
-		else
-			e->inst[1] |= (NV50_CB_PFP << 22);
-	}
-#endif
 
+	/* XXX: param.bs can be extracted from inst[1] */
+	e->param.bs = (src->type == P_IMMD) ? 0 : 1;
 	e->param.index = src->hw;
 	e->param.shift = s;
 	e->param.mask = m << (s % 32);
+
+	e->inst[1] |= (e->param.bs << 22);
 }
 
 static void
@@ -1502,7 +1494,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 		break;
 	case TGSI_OPCODE_TEX:
-	case TGSI_OPCODE_TXP:
+	case TGSI_OPCODE_TXP: /* XXX: TXP should use w-component as iv on interp */
 	{
 		struct nv50_reg *t[4];
 		struct nv50_program_exec *e;
@@ -1977,7 +1969,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	}
 
 	if (pc->immd_nr) {
-		int rid = pc->param_nr * 4;
+		int rid = 0;
 
 		pc->immd = CALLOC(pc->immd_nr * 4, sizeof(struct nv50_reg));
 		if (!pc->immd)
@@ -2121,7 +2113,7 @@ nv50_program_validate(struct nv50_context *nv50, struct nv50_program *p)
 
 static void
 nv50_program_upload_data(struct nv50_context *nv50, float *map,
-			 unsigned start, unsigned count)
+			unsigned start, unsigned count, unsigned cbuf)
 {
 	struct nouveau_channel *chan = nv50->screen->nvws->channel;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
@@ -2130,7 +2122,7 @@ nv50_program_upload_data(struct nv50_context *nv50, float *map,
 		unsigned nr = count > 2047 ? 2047 : count;
 
 		BEGIN_RING(chan, tesla, 0x00000f00, 1);
-		OUT_RING  (chan, (NV50_CB_PMISC << 0) | (start << 8));
+		OUT_RING  (chan, (cbuf << 0) | (start << 8));
 		BEGIN_RING(chan, tesla, 0x40000f04, nr);
 		OUT_RINGp (chan, map, nr);
 
@@ -2145,35 +2137,48 @@ nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 {
 	struct nouveau_winsys *nvws = nv50->screen->nvws;
 	struct pipe_winsys *ws = nv50->pipe.winsys;
-	unsigned nr = p->param_nr + p->immd_nr;
 
-	if (!p->data && nr) {
-		struct nouveau_resource *heap = nv50->screen->vp_data_heap;
+	if (!p->data[0] && p->immd_nr) {
+		struct nouveau_resource *heap = nv50->screen->immd_heap[0];
+
+		if (nvws->res_alloc(heap, p->immd_nr, p, &p->data[0])) {
+			while (heap->next && heap->size < p->immd_nr) {
+				struct nv50_program *evict = heap->next->priv;
+				nvws->res_free(&evict->data[0]);
+			}
+
+			if (nvws->res_alloc(heap, p->immd_nr, p, &p->data[0]))
+				assert(0);
+		}
+
+		/* immediates only need to be uploaded again when freed */
+		nv50_program_upload_data(nv50, p->immd, p->data[0]->start,
+								 p->immd_nr, NV50_CB_PMISC);
+	}
+
+	if (!p->data[1] && p->param_nr) {
+		struct nouveau_resource *heap = nv50->screen->parm_heap[p->type];
 
-		if (nvws->res_alloc(heap, nr, p, &p->data)) {
-			while (heap->next && heap->size < nr) {
+		if (nvws->res_alloc(heap, p->param_nr, p, &p->data[1])) {
+			while (heap->next && heap->size < p->param_nr) {
 				struct nv50_program *evict = heap->next->priv;
-				nvws->res_free(&evict->data);
+				nvws->res_free(&evict->data[1]);
 			}
 
-			if (nvws->res_alloc(heap, nr, p, &p->data))
+			if (nvws->res_alloc(heap, p->param_nr, p, &p->data[1]))
 				assert(0);
 		}
 	}
 
 	if (p->param_nr) {
+		unsigned cbuf;
 		float *map = ws->buffer_map(ws, nv50->constbuf[p->type],
 					    PIPE_BUFFER_USAGE_CPU_READ);
-		nv50_program_upload_data(nv50, map, p->data->start,
-					 p->param_nr);
+		cbuf = (p->type == PIPE_SHADER_VERTEX) ? NV50_CB_PVP : NV50_CB_PFP;
+		nv50_program_upload_data(nv50, map, p->data[1]->start,
+								 p->param_nr, cbuf);
 		ws->buffer_unmap(ws, nv50->constbuf[p->type]);
 	}
-
-	if (p->immd_nr) {
-		nv50_program_upload_data(nv50, p->immd,
-					 p->data->start + p->param_nr,
-					 p->immd_nr);
-	}
 }
 
 static void
@@ -2193,20 +2198,26 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 		upload = TRUE;
 	}
 
-	if (p->data && p->data->start != p->data_start) {
+	if ((p->data[0] && p->data[0]->start != p->data_start[0]) ||
+		(p->data[1] && p->data[1]->start != p->data_start[1]))
+	{
 		for (e = p->exec_head; e; e = e->next) {
 			unsigned ei, ci;
 
 			if (e->param.index < 0)
 				continue;
 			ei = e->param.shift >> 5;
-			ci = e->param.index + p->data->start;
+			ci = e->param.index + p->data[e->param.bs]->start;
 
 			e->inst[ei] &= ~e->param.mask;
 			e->inst[ei] |= (ci << e->param.shift);
 		}
 
-		p->data_start = p->data->start;
+		if (p->data[0])
+			p->data_start[0] = p->data[0]->start;
+		if (p->data[1])
+			p->data_start[1] = p->data[1]->start;
+
 		upload = TRUE;
 	}
 
@@ -2364,7 +2375,8 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 	if (p->buffer)
 		pipe_buffer_reference(&p->buffer, NULL);
 
-	nv50->screen->nvws->res_free(&p->data);
+	nv50->screen->nvws->res_free(&p->data[0]);
+	nv50->screen->nvws->res_free(&p->data[1]);
 
 	p->translated = 0;
 }
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index 3b3b6bb..9dd0f37 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -10,6 +10,7 @@ struct nv50_program_exec {
 	unsigned inst[2];
 	struct {
 		int index;
+		int bs; /* buffer selector */
 		unsigned mask;
 		unsigned shift;
 	} param;
@@ -24,8 +25,8 @@ struct nv50_program {
 	struct nv50_program_exec *exec_head;
 	struct nv50_program_exec *exec_tail;
 	unsigned exec_size;
-	struct nouveau_resource *data;
-	unsigned data_start;
+	struct nouveau_resource *data[2];
+	unsigned data_start[2];
 
 	struct pipe_buffer *buffer;
 
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 2980564..268eeeb 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -290,20 +290,61 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_winsys *nvws)
 	so_method(so, screen->tesla, 0x16b8, 1);
 	so_data  (so, 8);
 
-	/* Shared constant buffer */
-	screen->constbuf = screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 * 4);
-	if (nvws->res_init(&screen->vp_data_heap, 0, 128)) {
-		NOUVEAU_ERR("Error initialising constant buffer\n");
+	/* constant buffers for immediates and VP/FP parameters */
+	screen->constbuf_misc[0] =
+		screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 * 4);
+
+	screen->constbuf_parm[0] =
+		screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 * 4);
+
+	screen->constbuf_parm[1] =
+		screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 * 4);
+	
+	if (nvws->res_init(&screen->immd_heap[0], 0, 128) ||
+		nvws->res_init(&screen->parm_heap[0], 0, 128) ||
+		nvws->res_init(&screen->parm_heap[1], 0, 128))
+	{
+		NOUVEAU_ERR("Error initialising constant buffers.\n");
 		nv50_screen_destroy(&screen->pipe);
 		return NULL;
 	}
 
 	so_method(so, screen->tesla, 0x1280, 3);
-	so_reloc (so, screen->constbuf, 0, NOUVEAU_BO_VRAM |
+	so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->constbuf, 0, NOUVEAU_BO_VRAM |
+	so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
 		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_PMISC << 16) | 0x00001000);
+	so_data  (so, (NV50_CB_PMISC << 16) | 0x00000800);
+	so_method(so, screen->tesla, 0x1694, 1);
+	so_data  (so, 0x00000001 | (NV50_CB_PMISC << 12));
+	so_method(so, screen->tesla, 0x1694, 1);
+	so_data  (so, 0x00000031 | (NV50_CB_PMISC << 12));
+
+	so_method(so, screen->tesla, 0x1280, 3);
+	so_reloc (so, screen->constbuf_parm[0], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
+	so_reloc (so, screen->constbuf_parm[0], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
+	so_data  (so, (NV50_CB_PVP << 16) | 0x00000800);
+	so_method(so, screen->tesla, 0x1694, 1);
+	so_data  (so, 0x00000101 | (NV50_CB_PVP << 12));
+
+	so_method(so, screen->tesla, 0x1280, 3);
+	so_reloc (so, screen->constbuf_parm[1], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
+	so_reloc (so, screen->constbuf_parm[1], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
+	so_data  (so, (NV50_CB_PMISC << 16) | 0x00000800);
+	so_method(so, screen->tesla, 0x1694, 1);
+	so_data  (so, 0x00000131 | (NV50_CB_PFP << 12));
+
+	/*
+	// map VP and FP CB index 0 to CB_PMISC
+	so_method(so, screen->tesla, 0x1694, 1);
+	so_data  (so, 0x000BBNP1 = 0x00000001);
+	so_method(so, screen->tesla, 0x1694, 1);
+	so_data  (so, 0x000BBNP1 = 0x00000031);
+	*/
 
 	/* Texture sampler/image unit setup - we abuse the constant buffer
 	 * upload mechanism for the moment to upload data to the tex config
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
index db567aa..31b8ef2 100644
--- a/src/gallium/drivers/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nv50/nv50_screen.h
@@ -15,8 +15,11 @@ struct nv50_screen {
 	struct nouveau_grobj *m2mf;
 	struct nouveau_notifier *sync;
 
-	struct pipe_buffer *constbuf;
-	struct nouveau_resource *vp_data_heap;
+	struct pipe_buffer *constbuf_misc[1];
+	struct pipe_buffer *constbuf_parm[2];
+
+	struct nouveau_resource *immd_heap[1];
+	struct nouveau_resource *parm_heap[2];
 
 	struct pipe_buffer *tic;
 	struct pipe_buffer *tsc;

--------------020807040709030700080400
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------020807040709030700080400--
