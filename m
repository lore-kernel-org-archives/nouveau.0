From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: shader generation patches, update
Date: Sat, 16 May 2009 20:55:10 +0200
Message-ID: <4A0F0C0E.3050600@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050906050400090706030006"
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
--------------050906050400090706030006
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi ! Here are some more changes to the shader code to be applied in
addition to the previous ones.

Well, I've though about getting an account so I could commit some (or
all) of this stuff, probably in splitting some patches up a bit more.
But I'd feel much better doing so (if I was even allowed to) if
someone (darktama) had a look at my code before, preferably with some
comments on how to improve / do / not do things.

Someone testing this stuff and reporting to me whether they see improve-
ments as compared to the code currently in mesa master wouldn't be bad
either.

Well, if no one has any major complaints, and once I feel a little bit
more comfortable with what I've done so far, I'll probably have to
ask/apply for a mesa account as Maarten suggested ...

Thank you, Christoph

--------------050906050400090706030006
Content-Type: text/plain;
 name="patch-10.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-10.diff"

commit 78f4b96b9b874e487571b59cec22e683f23d2e3e
Author: chr <chr@ECHELON.(none)>
Date:   Sat May 16 15:33:34 2009 +0200

    - Introduce argument negation for MUL, MAD, ADD, DP3, DP4 and POW.
      This is now done via a negation bitmask in nv50_pc that is checked
      in the emit functions, the 'neg' member of nv50_reg is obsolete
      with this.
      (maybe I should have used it instead, but I completely forgot
       about it and went with this way ...)
    
    - changed emit_sub and emit_msb to use negated emit_add and emit_mad

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 6e279bd..ed9e20b 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -117,6 +117,7 @@ struct nv50_pc {
 	unsigned insn_cur;
 	unsigned insn_nr;
 
+	unsigned negate;
 	boolean allow32; /* TRUE when half insns are allowed */
 };
 
@@ -531,6 +532,8 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 	emit(pc, e);
 }
 
+#define BITS_0_1_SWAPPED(x) ((x & 1) << 1) | ((x & 2) >> 1)
+
 static boolean
 check_swap_src_0_1(struct nv50_pc *pc,
 		   struct nv50_reg **s0, struct nv50_reg **s1)
@@ -628,14 +631,6 @@ set_src_2(struct nv50_pc *pc, struct nv50_reg *src, struct nv50_program_exec *e)
 	e->inst[1] |= (src->hw << 14);
 }
 
-static boolean
-requires_long(struct nv50_program_exec *e, struct nv50_reg *src)
-{
-	if (is_long(e) || src->type == P_IMMD || src->type == P_CONST)
-		return TRUE;
-	return FALSE;
-}
-
 static void
 emit_mul(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
 	 struct nv50_reg *src1)
@@ -650,6 +645,13 @@ emit_mul(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
 	set_src_0(pc, src0, e);
 	set_src_1(pc, src1, e);
 
+	if (pc->negate & 1) {
+		if (is_long(e))
+			e->inst[1] |= 0x08000000;
+		else
+			e->inst[0] |= 0x00008000;
+	}
+
 	emit(pc, e);
 }
 
@@ -658,18 +660,25 @@ emit_add(struct nv50_pc *pc, struct nv50_reg *dst,
 	 struct nv50_reg *src0, struct nv50_reg *src1)
 {
 	struct nv50_program_exec *e = exec(pc);
+	unsigned neg = pc->negate;
 
 	e->inst[0] |= 0xb0000000;
 
-	check_swap_src_0_1(pc, &src0, &src1);
+	if (check_swap_src_0_1(pc, &src0, &src1))
+		neg = BITS_0_1_SWAPPED(neg);
+	if (!pc->allow32 || neg) {
+		set_long(pc, e);
+		e->inst[1] |= (neg << 26);
+	}
+
 	set_dst(pc, dst, e);
 	set_src_0(pc, src0, e);
-	if (!is_long(e) && src1->type == P_IMMD && pc->allow32)
-		set_immd(pc, src1, e);
-	else
-	if (requires_long(e, src1))
+	if (src1->type == P_CONST || is_long(e))
 		set_src_2(pc, src1, e);
 	else
+	if (src1->type == P_IMMD)
+		set_immd(pc, src1, e);
+	else
 		set_src_1(pc, src1, e);
 
 	emit(pc, e);
@@ -693,25 +702,13 @@ emit_minmax(struct nv50_pc *pc, unsigned sub, struct nv50_reg *dst,
 	emit(pc, e);
 }
 
-static void
+static INLINE void
 emit_sub(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
 	 struct nv50_reg *src1)
 {
-	struct nv50_program_exec *e = exec(pc);
-
-	e->inst[0] |= 0xb0000000;
-
-	set_long(pc, e);
-	if (check_swap_src_0_1(pc, &src0, &src1))
-		e->inst[1] |= 0x04000000;
-	else
-		e->inst[1] |= 0x08000000;
-
-	set_dst(pc, dst, e);
-	set_src_0(pc, src0, e);
-	set_src_2(pc, src1, e);
-
-	emit(pc, e);
+	pc->negate ^= 2;
+	emit_add(pc, dst, src0, src1);
+	pc->negate ^= 2;
 }
 
 static void
@@ -728,26 +725,21 @@ emit_mad(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
 	set_src_1(pc, src1, e);
 	set_src_2(pc, src2, e);
 
+	if (pc->negate & 1)
+		e->inst[1] |= 0x04000000;
+	if (pc->negate & 2)
+		e->inst[1] |= 0x08000000;
+
 	emit(pc, e);
 }
 
-static void
+static INLINE void
 emit_msb(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
 	 struct nv50_reg *src1, struct nv50_reg *src2)
 {
-	struct nv50_program_exec *e = exec(pc);
-
-	e->inst[0] |= 0xe0000000;
-	set_long(pc, e);
-	e->inst[1] |= 0x08000000; /* src0 * src1 - src2 */
-
-	check_swap_src_0_1(pc, &src0, &src1);
-	set_dst(pc, dst, e);
-	set_src_0(pc, src0, e);
-	set_src_1(pc, src1, e);
-	set_src_2(pc, src2, e);
-
-	emit(pc, e);
+	pc->negate ^= 2;
+	emit_mad(pc, dst, src0, src1, src2);
+	pc->negate ^= 2;
 }
 
 static void
@@ -1012,8 +1004,15 @@ convert_to_long(struct nv50_pc *pc, struct nv50_program_exec *e)
 			if (e->inst[0] & 0x02000000)
 				q = 0x00020000;
 			break;
+		case 0xB:
+			/* ADD */
+			m = ~(127 << 16);
+			q = ((e->inst[0] & (~m)) >> 2);
+			break;
 		case 0xC:
 			/* MUL */
+			m = ~0x00008000;
+			q = ((e->inst[0] & (~m)) << 12);
 			break;
 		case 0x9:
 			/* RCP */
@@ -1090,8 +1089,33 @@ tgsi_dst(struct nv50_pc *pc, int c, const struct tgsi_full_dst_register *dst)
 	return NULL;
 }
 
+/* Returns bit with which to XOR pc->negate on negation, or -1 if negation
+ * is not supported for the instruction. This is used in tgsi_src, and set
+ * to -2 in tx_insn to indicate XOR has already been taken care of in c 0.
+ */
+static int
+negate_supported(const struct tgsi_full_instruction *insn, int i)
+{
+	switch (insn->Instruction.Opcode) {
+	case TGSI_OPCODE_DP3:
+	case TGSI_OPCODE_DP4:
+	case TGSI_OPCODE_MUL:
+		return 0;
+	case TGSI_OPCODE_ADD:
+	case TGSI_OPCODE_SUB:
+		return i;
+	case TGSI_OPCODE_MAD:
+		return (i == 2) ? 1 : 0;
+	case TGSI_OPCODE_POW:
+		return (i == 1) ? 0 : -1;
+	default:
+		return -1;
+	}
+}
+
 static struct nv50_reg *
-tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src)
+tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src,
+	int neg)
 {
 	struct nv50_reg *r = NULL;
 	struct nv50_reg *temp;
@@ -1146,9 +1170,12 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src)
 		r = temp;
 		break;
 	case TGSI_UTIL_SIGN_TOGGLE:
-		temp = temp_temp(pc);
-		emit_neg(pc, temp, r);
-		r = temp;
+		if (neg == -1) {
+			temp = temp_temp(pc);
+			emit_neg(pc, temp, r);
+			r = temp;
+		} else if (neg >= 0)
+			pc->negate ^= (1 << neg);
 		break;
 	case TGSI_UTIL_SIGN_SET:
 		temp = temp_temp(pc);
@@ -1202,6 +1229,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 
 	mask = inst->FullDstRegisters[0].DstRegister.WriteMask;
 	sat = inst->Instruction.Saturate == TGSI_SAT_ZERO_ONE;
+	pc->negate = 0;
 
 	for (c = 0; c < 4; c++) {
 		if (mask & (1 << c))
@@ -1218,12 +1246,16 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
 		const struct tgsi_full_src_register *fs = &inst->FullSrcRegisters[i];
+		int neg = negate_supported(inst, i);
 
 		if (fs->SrcRegister.File == TGSI_FILE_SAMPLER)
 			unit = fs->SrcRegister.Index;
 
-		for (c = 0; c < 4; c++)
-			src[i][c] = tgsi_src(pc, c, fs);
+		for (c = 0; c < 4; c++) {
+			src[i][c] = tgsi_src(pc, c, fs, neg);
+			if (neg >= 0)
+				neg = -2; /* already negated */
+		}
 	}
 
 	if (sat) {

--------------050906050400090706030006
Content-Type: text/plain;
 name="patch-11.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-11.diff"

commit e611bc623c1526d5c806964287edf31b4b346d0d
Author: chr <chr@ECHELON.(none)>
Date:   Sat May 16 16:50:23 2009 +0200

    - Unify moving result from temporary to destination registers.
    - Don't do mov and cvt.sat for MOV_SAT, just cvt.sat suffices.

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index ed9e20b..4a03cf5 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -221,7 +221,7 @@ alloc_preferred_temp(struct nv50_pc *pc, int hw)
 static void
 assimilate_temp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 {
-	assert(dst->index != -1 && src->index == -1 && src->hw != -1);
+	assert(src->index == -1 && src->hw != -1);
 
 	if (dst->hw != -1)
 		pc->r_temp[dst->hw] = NULL;
@@ -1311,22 +1311,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		temp = alloc_temp(pc, NULL);
 		emit_precossin(pc, temp, src[0][0]);
 		emit_flop(pc, 5, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_DP3:
 		temp = alloc_temp(pc, NULL);
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_DP4:
 		temp = alloc_temp(pc, NULL);
@@ -1334,11 +1324,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
 		emit_mad(pc, temp, src[0][3], src[1][3], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_DPH:
 		temp = alloc_temp(pc, NULL);
@@ -1346,11 +1331,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
 		emit_add(pc, temp, src[1][3], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_DST:
 	{
@@ -1370,11 +1350,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		temp = alloc_temp(pc, NULL);
 		emit_preex2(pc, temp, src[0][0]);
 		emit_flop(pc, 6, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_FLR:
 		for (c = 0; c < 4; c++) {
@@ -1405,11 +1380,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	case TGSI_OPCODE_LG2:
 		temp = alloc_temp(pc, NULL);
 		emit_flop(pc, 3, temp, src[0][0]);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_LRP:
 		temp = alloc_temp(pc, NULL);
@@ -1419,6 +1389,8 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			emit_sub(pc, temp, src[1][c], src[2][c]);
 			emit_mad(pc, dst[c], temp, src[0][c], src[2][c]);
 		}
+		free_temp(pc, temp);
+		temp = NULL;
 		break;
 	case TGSI_OPCODE_MAD:
 		for (c = 0; c < 4; c++) {
@@ -1442,6 +1414,13 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 		break;
 	case TGSI_OPCODE_MOV:
+		if (sat) {
+			dst[0] = src[0][0];
+			dst[1] = src[0][1];
+			dst[2] = src[0][2];
+			dst[3] = src[0][3];
+			break;
+		}
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
@@ -1458,11 +1437,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	case TGSI_OPCODE_POW:
 		temp = alloc_temp(pc, NULL);
 		emit_pow(pc, temp, src[0][0], src[1][0]);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_RCP:
 		for (c = 0; c < 4; c++) {
@@ -1493,6 +1467,8 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			emit_flop(pc, 5, dst[0], temp);
 		if (mask & (1 << 1))
 			emit_flop(pc, 4, dst[1], temp);
+		free_temp(pc, temp);
+		temp = NULL;
 		break;
 	case TGSI_OPCODE_SGE:
 		for (c = 0; c < 4; c++) {
@@ -1505,11 +1481,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		temp = alloc_temp(pc, NULL);
 		emit_precossin(pc, temp, src[0][0]);
 		emit_flop(pc, 4, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
 		break;
 	case TGSI_OPCODE_SLT:
 		for (c = 0; c < 4; c++) {
@@ -1573,8 +1544,24 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		return FALSE;
 	}
 
-	if (temp)
-		free_temp(pc, temp);
+	i = -1;
+	if (temp) {
+		for (c = 0; c < 4; c++) {
+			if (!(mask & (1 << c)))
+				continue;
+			if (i >= 0)
+				emit_mov(pc, dst[c], dst[i]);
+			else if (dst[c]->type == P_TEMP) {
+				assimilate_temp(pc, dst[c], temp);
+				i = c;
+				temp = NULL;
+			} else
+				emit_mov(pc, dst[c], temp);
+		}
+
+		if (temp)
+			free_temp(pc, temp);
+	}
 
 	if (sat) {
 		for (c = 0; c < 4; c++) {

--------------050906050400090706030006
Content-Type: text/plain;
 name="patch-12.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-12.diff"

commit 1b3a83bd57065aa015d5251f44bea0b710838581
Author: chr <chr@ECHELON.(none)>
Date:   Sat May 16 16:39:38 2009 +0200

    - Make TXP do what it's supposed to (centroid not yet honored, could
      store interpolation mode in some per register flag maybe).
    
    - FIX: don't set perspect_load = FALSE if we encounter a centroid
      attribute, instead make perspect/centroid_load counters.

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 3a00c90..3116735 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1497,14 +1497,33 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 		break;
 	case TGSI_OPCODE_TEX:
-	case TGSI_OPCODE_TXP: /* XXX: TXP should use w-component as iv on interp */
+	case TGSI_OPCODE_TXP:
 	{
 		struct nv50_reg *t[4];
 		struct nv50_program_exec *e;
 
 		alloc_temp4(pc, t, 0);
-		emit_mov(pc, t[0], src[0][0]);
-		emit_mov(pc, t[1], src[0][1]);
+
+		if (inst->Instruction.Opcode == TGSI_OPCODE_TXP) {
+			if (src[0][0]->type == P_TEMP && src[0][0]->rhw != -1) {
+				/* XXX: centroid is not honored here */
+				t[1]->rhw = src[0][3]->rhw;
+				emit_interp(pc, t[1], NULL, INTERP_LINEAR);
+				emit_flop(pc, 0, t[1], t[1]);
+				t[0]->rhw = src[0][0]->rhw;
+				t[1]->rhw = src[0][1]->rhw;
+				emit_interp(pc, t[0], t[1], INTERP_PERSPECTIVE);
+				emit_interp(pc, t[1], t[1], INTERP_PERSPECTIVE);
+			} else {
+				emit_mov(pc, t[1], src[0][3]);
+				emit_flop(pc, 0, t[1], t[1]);
+				emit_mul(pc, t[0], src[0][0], t[1]);
+				emit_mul(pc, t[1], src[0][1], t[1]);
+			}
+		} else {
+			emit_mov(pc, t[0], src[0][0]);
+			emit_mov(pc, t[1], src[0][1]);
+		}
 
 		e = exec(pc);
 		e->inst[0] = 0xf6400000;
@@ -1514,6 +1533,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		set_dst(pc, t[0], e);
 		emit(pc, e);
 
+		/* XXX: without these MOVs, it can happen that TEX has no effect */
 		if (mask & (1 << 0)) emit_mov(pc, dst[0], t[0]);
 		if (mask & (1 << 1)) emit_mov(pc, dst[1], t[1]);
 		if (mask & (1 << 2)) emit_mov(pc, dst[2], t[2]);
@@ -1636,8 +1656,8 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	unsigned fcol, bcol, fcrd, depr;
 
 	/* record interpolation mode from declaration */
-	boolean centroid_load = FALSE;
-	boolean perspect_load = FALSE;
+	unsigned centroid_load = 0;
+	unsigned perspect_load = 0;
 	unsigned interp_mode[32];
 
 	/* track register usage for temps and attrs */
@@ -1721,38 +1741,45 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 					break;
 				case TGSI_INTERPOLATE_PERSPECTIVE:
 					mode = INTERP_PERSPECTIVE;
-					perspect_load = TRUE;
+					if (!d->Declaration.Centroid)
+						perspect_load++;
 					break;
 				default:
 					mode = INTERP_LINEAR;
 					break;
 				}
 
+				if (d->Declaration.Centroid) {
+					mode |= INTERP_CENTROID;
+					centroid_load++;
+				}
+				
 				if (d->Declaration.Semantic) {
 					switch (d->Semantic.SemanticName) {
 					case TGSI_SEMANTIC_POSITION:
 						fcrd = first;
 						break;
+					/* XXX: FLAT and LINEAR don't seem to behave correctly: */
 					case TGSI_SEMANTIC_COLOR:
 						fcol = first;
-						mode = INTERP_PERSPECTIVE;
-						perspect_load = TRUE;
+						if (!(mode & INTERP_PERSPECTIVE)) {
+							mode &= INTERP_CENTROID;
+							mode |= INTERP_PERSPECTIVE;
+							perspect_load++;
+						}
 						break;
 					case TGSI_SEMANTIC_BCOLOR:
 						bcol = first;
-						mode = INTERP_PERSPECTIVE;
-						perspect_load = TRUE;
+						if (!(mode & INTERP_PERSPECTIVE)) {
+							mode &= INTERP_CENTROID;
+							mode |= INTERP_PERSPECTIVE;
+							perspect_load++;
+						}
 						break;
 					default:
 						break;
 					}
 				}
-
-				if (d->Declaration.Centroid) {
-					mode |= INTERP_CENTROID;
-					centroid_load = TRUE;
-					perspect_load = FALSE;
-				}
 				
 				assert(last < 32);
 				for (i = first; i <= last; i++)

--------------050906050400090706030006
Content-Type: text/plain;
 name="patch-13.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-13.diff"

commit 3f66c5d0daf7ef15ddc9f7bc22967d95d52ab2af
Author: chr <chr@ECHELON.(none)>
Date:   Sat May 16 16:43:09 2009 +0200

    - Introduce emit_cvt and use it where applicable (flr, abs, sat, and in set).
    - Restructure LIT again, now src == dst case is completely taken care of there.
    - Change emit_kil and add negation support (the generated insn was different
      before, but this is how the blob does it here, should look into this).
    - Remove unnecessary MALLOC and FREE in program dump ifdef block.
    - In alloc_immd(), also put -f and 0.5 * f in the immd buffer, as it is now
      this might save some space.
    
    Well, that's a lot of rather unrelated changes, maybe I should break things
    up more.

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 3116735..4dc5676 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -335,7 +335,7 @@ alloc_immd(struct nv50_pc *pc, float f)
 			break;
 
 	if (hw == pc->immd_nr * 4)
-		hw = ctor_immd(pc, f, 0, 0, 0) * 4;
+		hw = ctor_immd(pc, f, -f, 0.5f * f, 0) * 4;
 
 	r->type = P_IMMD;
 	r->hw = hw;
@@ -790,6 +790,48 @@ emit_precossin(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 	emit(pc, e);
 }
 
+#define CVTOP_RN	0x01
+#define CVTOP_FLOOR	0x03
+#define CVTOP_CEIL	0x05
+#define CVTOP_TRUNC	0x07
+#define CVTOP_SAT	0x08
+#define CVTOP_ABS	0x10
+
+#define CVT_F32_F32 0xc4
+#define CVT_F32_S32 0x44
+#define CVT_F32_U32 0x64
+#define CVT_S32_F32 0x8c
+#define CVT_S32_S32 0x0c
+#define CVT_R32_F32 0xcc
+
+static void
+emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
+	int wp, unsigned cop, unsigned fmt)
+{
+	struct nv50_program_exec *e;
+
+	e = exec(pc);
+	set_long(pc, e);
+
+	e->inst[0] |= 0xa0000000;
+	e->inst[1] |= 0x00004000;
+	e->inst[1] |= (cop << 16);
+	e->inst[1] |= (fmt << 24);
+	set_src_0(pc, src, e);
+
+	if (wp >= 0)
+		set_pred_wr(pc, 1, wp, e);
+
+	if (dst)
+		set_dst(pc, dst, e);
+	else {
+		e->inst[0] |= 0x000001fc;
+		e->inst[1] |= 0x00000008;
+	}
+
+	emit(pc, e);
+}
+
 static void
 emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst,
 	 struct nv50_reg *src0, struct nv50_reg *src1)
@@ -821,34 +863,16 @@ emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst,
 	set_src_1(pc, src1, e);
 	emit(pc, e);
 
-	/* cvt.f32.u32 */
-	e = exec(pc);
-	e->inst[0] = 0xa0000001;
-	e->inst[1] = 0x64014780;
-	set_dst(pc, rdst, e);
-	set_src_0(pc, dst, e);
-	emit(pc, e);
-
+	emit_cvt(pc, rdst, dst, -1, CVTOP_RN, CVT_F32_U32);
+	
 	if (dst != rdst)
 		free_temp(pc, dst);
 }
 
-static void
+static INLINE void
 emit_flr(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 {
-	struct nv50_program_exec *e = exec(pc);
-
-	e->inst[0] = 0xa0000000; /* cvt */
-	set_long(pc, e);
-	e->inst[1] |= (6 << 29); /* cvt */
-	e->inst[1] |= 0x08000000; /* integer mode */
-	e->inst[1] |= 0x04000000; /* 32 bit */
-	e->inst[1] |= ((0x1 << 3)) << 14; /* .rn */
-	e->inst[1] |= (1 << 14); /* src .f32 */
-	set_dst(pc, dst, e);
-	set_src_0(pc, src, e);
-
-	emit(pc, e);
+	emit_cvt(pc, dst, src, -1, CVTOP_FLOOR, CVT_R32_F32);
 }
 
 static void
@@ -865,21 +889,10 @@ emit_pow(struct nv50_pc *pc, struct nv50_reg *dst,
 	free_temp(pc, temp);
 }
 
-static void
+static INLINE void
 emit_abs(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 {
-	struct nv50_program_exec *e = exec(pc);
-
-	e->inst[0] = 0xa0000000; /* cvt */
-	set_long(pc, e);
-	e->inst[1] |= (6 << 29); /* cvt */
-	e->inst[1] |= 0x04000000; /* 32 bit */
-	e->inst[1] |= (1 << 14); /* src .f32 */
-	e->inst[1] |= ((1 << 6) << 14); /* .abs */
-	set_dst(pc, dst, e);
-	set_src_0(pc, src, e);
-
-	emit(pc, e);
+	emit_cvt(pc, dst, src, -1, CVTOP_ABS, CVT_F32_F32);
 }
 
 static void
@@ -894,10 +907,7 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 	boolean allow32 = pc->allow32;
 
 	if (mask & (3 << 1)) {
-		if (mask & (1 << 1))
-			tmp[0] = dst[1];
-		else
-			tmp[0] = temp_temp(pc);
+		tmp[0] = alloc_temp(pc, NULL);
 		emit_minmax(pc, 4, tmp[0], src[0], zero);
 	}
 
@@ -920,6 +930,12 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 
 	pc->allow32 = allow32;
 
+	if (mask & (1 << 1))
+		assimilate_temp(pc, dst[1], tmp[0]);
+	else
+	if (mask & (1 << 2))
+		free_temp(pc, tmp[0]);
+	
 	/* do this last, in case src[i,j] == dst[0,3] */
 	if (mask & (1 << 0))
 		emit_mov(pc, dst[0], one);
@@ -953,21 +969,16 @@ static void
 emit_kil(struct nv50_pc *pc, struct nv50_reg *src)
 {
 	struct nv50_program_exec *e;
-	const int r_pred = 1;
 
-	/* Sets predicate reg ? */
-	e = exec(pc);
-	e->inst[0] = 0xa00001fd;
-	e->inst[1] = 0xc4014788;
-	set_src_0(pc, src, e);
-	set_pred_wr(pc, 1, r_pred, e);
-	emit(pc, e);
+	emit_cvt(pc, NULL, src, 0, CVTOP_RN, CVT_F32_F32);
+	if (pc->negate)
+		pc->p->exec_tail->inst[1] |= 0x20000000;
 
-	/* This is probably KILP */
+	/* @p0.lt kil */
 	e = exec(pc);
-	e->inst[0] = 0x000001fe;
 	set_long(pc, e);
-	set_pred(pc, 1 /* LT? */, r_pred, e);
+	e->inst[0] |= 0x00000002;
+	set_pred(pc, 1, 0, e);
 	emit(pc, e);
 }
 
@@ -1100,6 +1111,7 @@ negate_supported(const struct tgsi_full_instruction *insn, int i)
 	case TGSI_OPCODE_DP3:
 	case TGSI_OPCODE_DP4:
 	case TGSI_OPCODE_MUL:
+	case TGSI_OPCODE_KIL:
 		return 0;
 	case TGSI_OPCODE_ADD:
 	case TGSI_OPCODE_SUB:
@@ -1281,14 +1293,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			rdst[c] = dst[c];
 			dst[c] = alloc_preferred_temp(pc, rdst[c]->rhw);
 		}
-	} else if (inst->Instruction.Opcode == TGSI_OPCODE_LIT) {
-		/* XXX: shouldn't give LIT an extra case here */
-		if (src[0][1] == dst[1] ||
-			src[0][3] == dst[1]) {
-			assimilate = TRUE;
-			rdst[1] = dst[1];
-			dst[1] = alloc_temp(pc, NULL);
-		}
 	}
 
 	i = -1;
@@ -1585,21 +1589,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 
 	if (sat) {
 		for (c = 0; c < 4; c++) {
-			struct nv50_program_exec *e;
-
 			if (!(mask & (1 << c)))
 				continue;
-			e = exec(pc);
-
-			e->inst[0] = 0xa0000000; /* cvt */
-			set_long(pc, e);
-			e->inst[1] |= (6 << 29); /* cvt */
-			e->inst[1] |= 0x04000000; /* 32 bit */
-			e->inst[1] |= (1 << 14); /* src .f32 */
-			e->inst[1] |= ((1 << 5) << 14); /* .sat */
-			set_dst(pc, rdst[c], e);
-			set_src_0(pc, dst[c], e);
-			emit(pc, e);
+			emit_cvt(pc, rdst[c], dst[c], -1, CVTOP_SAT, CVT_F32_F32);
 		}
 	} else if (assimilate) {
 		for (c = 0; c < 4; c++)
@@ -2272,13 +2264,11 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 
 #ifdef NV50_PROGRAM_DUMP
 	NOUVEAU_ERR("-------\n");
-	up = ptr = MALLOC(p->exec_size * 4);
 	for (e = p->exec_head; e; e = e->next) {
 		NOUVEAU_ERR("0x%08x\n", e->inst[0]);
 		if (is_long(e))
 			NOUVEAU_ERR("0x%08x\n", e->inst[1]);
 	}
-	FREE(up);
 #endif
 
 	up = ptr = MALLOC(p->exec_size * 4);

--------------050906050400090706030006
Content-Type: text/plain;
 name="patch-14.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-14.diff"

commit 0bd93153d45bec1616a40b81af28d0c5a1536539
Author: chr <chr@ECHELON.(none)>
Date:   Sat May 16 16:30:59 2009 +0200

    Rewrite emit_set.

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 95e3bdf..c3185a9 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -833,38 +833,45 @@ emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
 }
 
 static void
-emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst,
+emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst, int wp,
 	 struct nv50_reg *src0, struct nv50_reg *src1)
 {
 	struct nv50_program_exec *e = exec(pc);
-	unsigned inv_cop[8] = { 0, 4, 2, 6, 1, 5, 3, 7 };
 	struct nv50_reg *rdst;
 
-	assert(c_op <= 7);
+	/* This maps TGSI_CC_GT/EQ/LT/GE/LE/NE  to condition codes for SET.
+	 * Note that conditional execution prefixes are probably different,
+	 * and for SET, code 0xE seems to mean 'output condition code'.
+	 * XXX: maybe verify these again
+	 */
+	static unsigned cop_map[16] = { 0x4, 0x2, 0x1, 0x6, 0x3, 0xd, 0, 0,
+									0x3, 0xd, 0x6, 0x1, 0x4, 0x2, 0, 0 };
 	if (check_swap_src_0_1(pc, &src0, &src1))
-		c_op = inv_cop[c_op];
+		c_op += 8;
 
 	rdst = dst;
 	if (dst->type != P_TEMP)
 		dst = alloc_temp(pc, NULL);
 
-	/* set.u32 */
 	set_long(pc, e);
 	e->inst[0] |= 0xb0000000;
-	e->inst[1] |= (3 << 29);
-	e->inst[1] |= (c_op << 14);
-	/*XXX: breaks things, .u32 by default?
-	 *     decuda will disasm as .u16 and use .lo/.hi regs, but this
-	 *     doesn't seem to match what the hw actually does.
-	inst[1] |= 0x04000000; << breaks things.. .u32 by default?
-	 */
-	set_dst(pc, dst, e);
-	set_src_0(pc, src0, e);
-	set_src_1(pc, src1, e);
+	e->inst[1] |= 0x60000000;
+	e->inst[1] |= ((c_op < 16) ? cop_map[c_op] : 0xe) << 14;
+
+	if (dst)
+		set_dst(pc, dst, e);
+	else {
+		e->inst[0] |= 0x000001fc;
+		e->inst[1] |= 0x00000008;
+	}
+	if (wp >= 0)
+		set_pred_wr(pc, 1, wp, e);
+
 	emit(pc, e);
 
-	emit_cvt(pc, rdst, dst, -1, CVTOP_RN, CVT_F32_U32);
-	
+	if (dst)
+		emit_cvt(pc, rdst, dst, -1, CVTOP_RN | CVTOP_ABS, CVT_F32_S32);
+
 	if (dst != rdst)
 		free_temp(pc, dst);
 }
@@ -1478,7 +1485,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_set(pc, 6, dst[c], src[0][c], src[1][c]);
+			emit_set(pc, TGSI_CC_GE, dst[c], -1, src[0][c], src[1][c]);
 		}
 		break;
 	case TGSI_OPCODE_SIN:
@@ -1490,7 +1497,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_set(pc, 1, dst[c], src[0][c], src[1][c]);
+			emit_set(pc, TGSI_CC_LT, dst[c], -1, src[0][c], src[1][c]);
 		}
 		break;
 	case TGSI_OPCODE_SUB:

--------------050906050400090706030006
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------050906050400090706030006--
