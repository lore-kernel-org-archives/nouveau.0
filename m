From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: some new shader stuff
Date: Sat, 12 Sep 2009 23:06:12 +0200
Message-ID: <4AAC0D44.1010702@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010208090904000401070505"
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
--------------010208090904000401070505
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Here's the new and better version of the shader patches I
sent some time ago, including some (hopefully) improvements.

I'm probably going to push them next week after pondering
them for a while longer, if there are no complaints.
I considered just committing them right away, but well, I'm sending
them here just in case ...

There's one quite large patch I considered splitting up more, but that
wouldn't work well since it does a lot of restructuring, I added a lot
of log text instead ...

Christoph

--------------010208090904000401070505
Content-Type: text/plain;
 name="0001-nv50-extend-insn-src-mask-function.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-nv50-extend-insn-src-mask-function.patch"

From 2ccdea8266db2123d382d6375e9942a74c81baf0 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 12:00:37 +0200
Subject: [PATCH 01/13] nv50: extend insn src mask function

Extend its usage to avoiding e.g. emission of negation
instructions in tx_insn for sources we don't need.
---
 src/gallium/drivers/nv50/nv50_program.c |  118 +++++++++++++++++++------------
 1 files changed, 72 insertions(+), 46 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 4a83852..a6c70ae 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1159,6 +1159,70 @@ negate_supported(const struct tgsi_full_instruction *insn, int i)
 	}
 }
 
+/* Return a read mask for source registers deduced from opcode & write mask. */
+static unsigned
+nv50_tgsi_src_mask(const struct tgsi_full_instruction *insn, int c)
+{
+	unsigned x, mask = insn->FullDstRegisters[0].DstRegister.WriteMask;
+
+	switch (insn->Instruction.Opcode) {
+	case TGSI_OPCODE_COS:
+	case TGSI_OPCODE_SIN:
+		return (mask & 0x8) | ((mask & 0x7) ? 0x1 : 0x0);
+	case TGSI_OPCODE_DP3:
+		return 0x7;
+	case TGSI_OPCODE_DP4:
+	case TGSI_OPCODE_DPH:
+	case TGSI_OPCODE_KIL: /* WriteMask ignored */
+		return 0xf;
+	case TGSI_OPCODE_DST:
+		return mask & (c ? 0xa : 0x6);
+	case TGSI_OPCODE_EX2:
+	case TGSI_OPCODE_LG2:
+	case TGSI_OPCODE_POW:
+	case TGSI_OPCODE_RCP:
+	case TGSI_OPCODE_RSQ:
+	case TGSI_OPCODE_SCS:
+		return 0x1;
+	case TGSI_OPCODE_LIT:
+		return 0xb;
+	case TGSI_OPCODE_TEX:
+	case TGSI_OPCODE_TXP:
+	{
+		const struct tgsi_instruction_ext_texture *tex;
+
+		assert(insn->Instruction.Extended);
+		tex = &insn->InstructionExtTexture;
+
+		mask = 0x7;
+		if (insn->Instruction.Opcode == TGSI_OPCODE_TXP)
+			mask |= 0x8;
+
+		switch (tex->Texture) {
+		case TGSI_TEXTURE_1D:
+			mask &= 0x9;
+			break;
+		case TGSI_TEXTURE_2D:
+			mask &= 0xb;
+			break;
+		default:
+			break;
+		}
+	}
+		return mask;
+	case TGSI_OPCODE_XPD:
+		x = 0;
+		if (mask & 1) x |= 0x6;
+		if (mask & 2) x |= 0x5;
+		if (mask & 4) x |= 0x3;
+		return x;
+	default:
+		break;
+	}
+
+	return mask;
+}
+
 static struct nv50_reg *
 tgsi_dst(struct nv50_pc *pc, int c, const struct tgsi_full_dst_register *dst)
 {
@@ -1310,13 +1374,18 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
 		const struct tgsi_full_src_register *fs = &inst->FullSrcRegisters[i];
+		unsigned src_mask;
+		boolean neg_supp;
+
+		src_mask = nv50_tgsi_src_mask(inst, i);
+		neg_supp = negate_supported(inst, i);
 
 		if (fs->SrcRegister.File == TGSI_FILE_SAMPLER)
 			unit = fs->SrcRegister.Index;
 
 		for (c = 0; c < 4; c++)
-			src[i][c] = tgsi_src(pc, c, fs,
-					     negate_supported(inst, i));
+			if (src_mask & (1 << c))
+				src[i][c] = tgsi_src(pc, c, fs, neg_supp);
 	}
 
 	if (sat) {
@@ -1636,49 +1705,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	return TRUE;
 }
 
-/* Adjust a bitmask that indicates what components of a source are used,
- * we use this in tx_prep so we only load interpolants that are needed.
- */
-static void
-insn_adjust_mask(const struct tgsi_full_instruction *insn, unsigned *mask)
-{
-	const struct tgsi_instruction_ext_texture *tex;
-
-	switch (insn->Instruction.Opcode) {
-	case TGSI_OPCODE_DP3:
-		*mask = 0x7;
-		break;
-	case TGSI_OPCODE_DP4:
-	case TGSI_OPCODE_DPH:
-		*mask = 0xF;
-		break;
-	case TGSI_OPCODE_LIT:
-		*mask = 0xB;
-		break;
-	case TGSI_OPCODE_RCP:
-	case TGSI_OPCODE_RSQ:
-		*mask = 0x1;
-		break;
-	case TGSI_OPCODE_TEX:
-	case TGSI_OPCODE_TXP:
-		assert(insn->Instruction.Extended);
-		tex = &insn->InstructionExtTexture;
-
-		*mask = 0x7;
-		if (tex->Texture == TGSI_TEXTURE_1D)
-			*mask = 0x1;
-		else
-		if (tex->Texture == TGSI_TEXTURE_2D)
-			*mask = 0x3;
-
-		if (insn->Instruction.Opcode == TGSI_OPCODE_TXP)
-			*mask |= 0x8;
-		break;
-	default:
-		break;
-	}
-}
-
 static void
 prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
 		  unsigned *r_usage[2])
@@ -1720,7 +1746,7 @@ prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
 			continue;
 		}
 
-		insn_adjust_mask(insn, &mask);
+		mask = nv50_tgsi_src_mask(insn, i);
 
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0002-nv50-add-functions-for-swizzle-resolution.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0002-nv50-add-functions-for-swizzle-resolution.patch"

From 6751bce2fdae02caecf9123323d5ae22e019c2e0 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 13:48:24 +0200
Subject: [PATCH 02/13] nv50: add functions for swizzle resolution

We're going to try to reorder the scalar ops of a vector instr
to accomodate swizzles that would otherwise require us to emit
to an additional TEMP first (like MOV R0.xy, R0.zx).
---
 src/gallium/drivers/nv50/nv50_program.c |  148 ++++++++++++++++++++++++------
 1 files changed, 118 insertions(+), 30 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index a6c70ae..a50a63d 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1322,30 +1322,69 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src,
 	return r;
 }
 
-/* returns TRUE if instruction can overwrite sources before they're read */
+/* return TRUE for ops that produce only a single result */
 static boolean
-direct2dest_op(const struct tgsi_full_instruction *insn)
+is_scalar_op(unsigned op)
 {
-	if (insn->Instruction.Saturate)
-		return FALSE;
-
-	switch (insn->Instruction.Opcode) {
-	case TGSI_OPCODE_COS:
+	switch (op) {
+	case TGSI_OPCODE_DP2:
 	case TGSI_OPCODE_DP3:
 	case TGSI_OPCODE_DP4:
 	case TGSI_OPCODE_DPH:
-	case TGSI_OPCODE_KIL:
-	case TGSI_OPCODE_LIT:
+	case TGSI_OPCODE_EX2:
+	case TGSI_OPCODE_LG2:
 	case TGSI_OPCODE_POW:
 	case TGSI_OPCODE_RCP:
 	case TGSI_OPCODE_RSQ:
+		/*
+	case TGSI_OPCODE_COS:
+	case TGSI_OPCODE_KIL:
+	case TGSI_OPCODE_LIT:
 	case TGSI_OPCODE_SCS:
 	case TGSI_OPCODE_SIN:
+		*/
+		return TRUE;
+	default:
+		return FALSE;
+	}
+}
+
+/* Returns a bitmask indicating which dst components depend
+ * on source s, component c (reverse of nv50_tgsi_src_mask).
+ */
+static unsigned
+nv50_tgsi_dst_revdep(unsigned op, int s, int c)
+{
+	if (is_scalar_op(op))
+		return 0x1;
+
+	switch (op) {
+	case TGSI_OPCODE_DST:
+		return (1 << c) & (s ? 0xa : 0x6);
+	case TGSI_OPCODE_XPD:
+		switch (c) {
+		case 0: return 0x6;
+		case 1: return 0x5;
+		case 2: return 0x3;
+		case 3: return 0x0;
+		default:
+			assert(0);
+			return 0x0;
+		}
+	case TGSI_OPCODE_LIT:
+	case TGSI_OPCODE_SCS:
 	case TGSI_OPCODE_TEX:
 	case TGSI_OPCODE_TXP:
-		return FALSE;
+		/* these take care of dangerous swizzles themselves */
+		return 0x0;
+	case TGSI_OPCODE_IF:
+	case TGSI_OPCODE_KIL:
+		/* don't call this function for these ops */
+		assert(0);
+		break;
 	default:
-		return TRUE;
+		/* linear vector instruction */
+		return (1 << c);
 	}
 }
 
@@ -1393,25 +1432,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			rdst[c] = dst[c];
 			dst[c] = temp_temp(pc);
 		}
-	} else
-	if (direct2dest_op(inst)) {
-		for (c = 0; c < 4; c++) {
-			if (!dst[c] || dst[c]->type != P_TEMP)
-				continue;
-
-			for (i = c + 1; i < 4; i++) {
-				if (dst[c] == src[0][i] ||
-				    dst[c] == src[1][i] ||
-				    dst[c] == src[2][i])
-					break;
-			}
-			if (i == 4)
-				continue;
-
-			assimilate = TRUE;
-			rdst[c] = dst[c];
-			dst[c] = alloc_temp(pc, NULL);
-		}
 	}
 
 	switch (inst->Instruction.Opcode) {
@@ -1768,6 +1788,74 @@ prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
 	}
 }
 
+/* Returns a bitmask indicating which dst components need to be
+ * written to temporaries first to avoid 'corrupting' sources.
+ *
+ * m[i]   (out) indicate component to write in the i-th position
+ * rdep[c] (in) bitmasks of dst[i] that require dst[c] as source
+ */
+static unsigned
+nv50_revdep_reorder(unsigned m[4], unsigned rdep[4])
+{
+	unsigned i, c, x, unsafe;
+
+	for (c = 0; c < 4; c++)
+		m[c] = c;
+
+	/* Swap as long as a dst component written earlier is depended on
+	 * by one written later, but the next one isn't depended on by it.
+	 */
+	for (c = 0; c < 3; c++) {
+		if (rdep[m[c + 1]] & (1 << m[c]))
+			continue; /* if next one is depended on by us */
+		for (i = c + 1; i < 4; i++)
+			/* if we are depended on by a later one */
+			if (rdep[m[c]] & (1 << m[i]))
+				break;
+		if (i == 4)
+			continue;
+		/* now, swap */
+		x = m[c];
+		m[c] = m[c + 1];
+		m[c + 1] = x;
+
+		/* restart */
+		c = 0;
+	}
+
+	/* mark dependencies that could not be resolved by reordering */
+	for (i = 0; i < 3; ++i)
+		for (c = i + 1; c < 4; ++c)
+			if (rdep[m[i]] & (1 << m[c]))
+				unsafe |= (1 << i);
+
+	/* NOTE: $unsafe is with respect to order, not component */
+	return unsafe;
+}
+
+/* Select a suitable dst register for broadcasting scalar results,
+ * or return NULL if we have to allocate an extra TEMP.
+ *
+ * If e.g. only 1 component is written, we may also emit the final
+ * result to a write-only register.
+ */
+static struct nv50_reg *
+tgsi_broadcast_dst(struct nv50_pc *pc,
+		   const struct tgsi_full_dst_register *fd, unsigned mask)
+{
+	if (fd->DstRegister.File == TGSI_FILE_TEMPORARY) {
+		int c = ffs(~mask & fd->DstRegister.WriteMask);
+		if (c)
+			return tgsi_dst(pc, c - 1, fd);
+	} else {
+		int c = ffs(fd->DstRegister.WriteMask) - 1;
+		if ((1 << c) == fd->DstRegister.WriteMask)
+			return tgsi_dst(pc, c, fd);
+	}
+
+	return NULL;
+}
+
 static unsigned
 load_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *mid,
 	       int *aid, int *p_oid)
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0003-nv50-add-nv50_tgsi_insn-to-handle-swizzles-safely.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0003-nv50-add-nv50_tgsi_insn-to-handle-swizzles-safely.patch"

From 5a05cf1f07102f0d232a3a7f5a25242142ec5e6d Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 15:49:38 +0200
Subject: [PATCH 03/13] nv50: add nv50_tgsi_insn to handle swizzles safely

---
 src/gallium/drivers/nv50/nv50_program.c |  144 +++++++++++++++++++++++++++----
 1 files changed, 125 insertions(+), 19 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index a50a63d..58dafdc 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -112,6 +112,10 @@ struct nv50_pc {
 	struct nv50_reg *temp_temp[16];
 	unsigned temp_temp_nr;
 
+	/* broadcast and destination replacement regs */
+	struct nv50_reg *r_brdc;
+	struct nv50_reg *r_dst[4];
+
 	unsigned interp_mode[32];
 	/* perspective interpolation registers */
 	struct nv50_reg *iv_p;
@@ -890,6 +894,12 @@ emit_abs(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 	emit_cvt(pc, dst, src, -1, CVTOP_ABS, CVT_F32_F32);
 }
 
+static INLINE void
+emit_sat(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
+{
+	emit_cvt(pc, dst, src, -1, CVTOP_SAT, CVT_F32_F32);
+}
+
 static void
 emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 	 struct nv50_reg **src)
@@ -1389,26 +1399,24 @@ nv50_tgsi_dst_revdep(unsigned op, int s, int c)
 }
 
 static boolean
-nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
+nv50_program_tx_insn(struct nv50_pc *pc,
+		     const struct tgsi_full_instruction *inst)
 {
-	const struct tgsi_full_instruction *inst = &tok->FullInstruction;
 	struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp;
 	unsigned mask, sat, unit;
-	boolean assimilate = FALSE;
 	int i, c;
 
 	mask = inst->FullDstRegisters[0].DstRegister.WriteMask;
 	sat = inst->Instruction.Saturate == TGSI_SAT_ZERO_ONE;
 
+	memset(src, 0, sizeof(src));
+
 	for (c = 0; c < 4; c++) {
-		if (mask & (1 << c))
+		if ((mask & (1 << c)) && !pc->r_dst[c])
 			dst[c] = tgsi_dst(pc, c, &inst->FullDstRegisters[0]);
 		else
-			dst[c] = NULL;
-		rdst[c] = NULL;
-		src[0][c] = NULL;
-		src[1][c] = NULL;
-		src[2][c] = NULL;
+			dst[c] = pc->r_dst[c];
+		rdst[c] = dst[c];
 	}
 
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
@@ -1429,6 +1437,8 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 
 	if (sat) {
 		for (c = 0; c < 4; c++) {
+			if (!(mask & (1 << c)) || dst[c]->type == P_TEMP)
+				continue;
 			rdst[c] = dst[c];
 			dst[c] = temp_temp(pc);
 		}
@@ -1700,13 +1710,11 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_cvt(pc, rdst[c], dst[c], -1, CVTOP_SAT,
-				 CVT_F32_F32);
+			/* in this case we saturate later */
+			if (dst[c]->type == P_TEMP && dst[c]->index < 0)
+				continue;
+			emit_sat(pc, rdst[c], dst[c]);
 		}
-	} else if (assimilate) {
-		for (c = 0; c < 4; c++)
-			if (rdst[c])
-				assimilate_temp(pc, rdst[c], dst[c]);
 	}
 
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
@@ -1715,9 +1723,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				continue;
 			if (src[i][c]->index == -1 && src[i][c]->type == P_IMMD)
 				FREE(src[i][c]);
-			else
-			if (src[i][c]->acc == pc->insn_cur)
-				release_hw(pc, src[i][c]);
 		}
 	}
 
@@ -1857,6 +1862,107 @@ tgsi_broadcast_dst(struct nv50_pc *pc,
 }
 
 static unsigned
+nv50_tgsi_scan_swizzle(const struct tgsi_full_instruction *insn,
+		       unsigned rdep[4])
+{
+	const struct tgsi_full_dst_register *fd = &insn->FullDstRegisters[0];
+	const struct tgsi_full_src_register *fs;
+	unsigned i, deqs = 0;
+
+	for (i = 0; i < 4; ++i)
+		rdep[i] = 0;
+
+	for (i = 0; i < insn->Instruction.NumSrcRegs; i++) {
+		unsigned chn, mask = nv50_tgsi_src_mask(insn, i);
+		boolean neg_supp = negate_supported(insn, i);
+
+		fs = &insn->FullSrcRegisters[i];
+		if (fs->SrcRegister.File != fd->DstRegister.File ||
+		    fs->SrcRegister.Index != fd->DstRegister.Index)
+			continue;
+
+		for (chn = 0; chn < 4; ++chn) {
+			unsigned s, c;
+
+			if (!(mask & (1 << chn))) /* src is not read */
+				continue;
+			c = tgsi_util_get_full_src_register_extswizzle(fs, chn);
+			s = tgsi_util_get_full_src_register_sign_mode(fs, chn);
+
+			if (c > TGSI_EXTSWIZZLE_W ||
+			    !(fd->DstRegister.WriteMask & (1 << c)))
+				continue;
+
+			/* no danger if src is copied to TEMP first */
+			if ((s != TGSI_UTIL_SIGN_KEEP) &&
+			    (s != TGSI_UTIL_SIGN_TOGGLE || !neg_supp))
+				continue;
+
+			rdep[c] |= nv50_tgsi_dst_revdep(
+				insn->Instruction.Opcode, i, chn);
+			deqs |= (1 << c);
+		}
+	}
+
+	return deqs;
+}
+
+static boolean
+nv50_tgsi_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
+{
+	struct tgsi_full_instruction insn = tok->FullInstruction;
+	const struct tgsi_full_dst_register *fd;
+	unsigned i, deqs, rdep[4], m[4];
+
+	fd = &tok->FullInstruction.FullDstRegisters[0];
+	deqs = nv50_tgsi_scan_swizzle(&insn, rdep);
+
+	if (is_scalar_op(insn.Instruction.Opcode)) {
+		pc->r_brdc = tgsi_broadcast_dst(pc, fd, deqs);
+		if (!pc->r_brdc)
+			pc->r_brdc = temp_temp(pc);
+		return nv50_program_tx_insn(pc, &insn);
+	}
+	pc->r_brdc = NULL;
+
+	if (!deqs)
+		return nv50_program_tx_insn(pc, &insn);
+
+	deqs = nv50_revdep_reorder(m, rdep);
+
+	for (i = 0; i < 4; ++i) {
+		assert(pc->r_dst[m[i]] == NULL);
+
+		insn.FullDstRegisters[0].DstRegister.WriteMask =
+			fd->DstRegister.WriteMask & (1 << m[i]);
+
+		if (!insn.FullDstRegisters[0].DstRegister.WriteMask)
+			continue;
+
+		if (deqs & (1 << i))
+			pc->r_dst[m[i]] = alloc_temp(pc, NULL);
+
+		if (!nv50_program_tx_insn(pc, &insn))
+			return FALSE;
+	}
+
+	for (i = 0; i < 4; i++) {
+		struct nv50_reg *reg = pc->r_dst[i];
+		if (!reg)
+			continue;
+		pc->r_dst[i] = NULL;
+
+		if (insn.Instruction.Saturate == TGSI_SAT_ZERO_ONE)
+			emit_sat(pc, tgsi_dst(pc, i, fd), reg);
+		else
+			emit_mov(pc, tgsi_dst(pc, i, fd), reg);
+		free_temp(pc, reg);
+	}
+
+	return TRUE;
+}
+
+static unsigned
 load_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *mid,
 	       int *aid, int *p_oid)
 {
@@ -2255,7 +2361,7 @@ nv50_program_tx(struct nv50_program *p)
 		switch (tok->Token.Type) {
 		case TGSI_TOKEN_TYPE_INSTRUCTION:
 			++pc->insn_cur;
-			ret = nv50_program_tx_insn(pc, tok);
+			ret = nv50_tgsi_insn(pc, tok);
 			if (ret == FALSE)
 				goto out_err;
 			break;
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0004-nv50-use-broadcast-TEMP-reg-in-tx_insn.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0004-nv50-use-broadcast-TEMP-reg-in-tx_insn.patch"

From 38bb2aa1d822769d68ac776f00224aa88c778c1a Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 16:33:54 +0200
Subject: [PATCH 04/13] nv50: use broadcast TEMP reg in tx_insn

Makes some opcode cases nicer and might reduce the total
nr of TEMPs required, or save some MOVs.
---
 src/gallium/drivers/nv50/nv50_program.c |   88 ++++++++++---------------------
 1 files changed, 28 insertions(+), 60 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 58dafdc..d198032 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1402,7 +1402,7 @@ static boolean
 nv50_program_tx_insn(struct nv50_pc *pc,
 		     const struct tgsi_full_instruction *inst)
 {
-	struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp;
+	struct nv50_reg *rdst[4], *dst[4], *brdc, *src[3][4], *temp;
 	unsigned mask, sat, unit;
 	int i, c;
 
@@ -1435,6 +1435,12 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 				src[i][c] = tgsi_src(pc, c, fs, neg_supp);
 	}
 
+	brdc = temp = pc->r_brdc;
+	if (brdc && brdc->type != P_TEMP) {
+		temp = temp_temp(pc);
+		if (sat)
+			brdc = temp;
+	} else
 	if (sat) {
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)) || dst[c]->type == P_TEMP)
@@ -1444,6 +1450,8 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		}
 	}
 
+	assert(brdc || !is_scalar_op(inst->Instruction.Opcode));
+
 	switch (inst->Instruction.Opcode) {
 	case TGSI_OPCODE_ABS:
 		for (c = 0; c < 4; c++) {
@@ -1470,63 +1478,35 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		}
 		break;
 	case TGSI_OPCODE_DP3:
-		temp = temp_temp(pc);
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
-		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_mad(pc, brdc, src[0][2], src[1][2], temp);
 		break;
 	case TGSI_OPCODE_DP4:
-		temp = temp_temp(pc);
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		emit_mad(pc, temp, src[0][3], src[1][3], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_mad(pc, brdc, src[0][3], src[1][3], temp);
 		break;
 	case TGSI_OPCODE_DPH:
-		temp = temp_temp(pc);
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		emit_add(pc, temp, src[1][3], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_add(pc, brdc, src[1][3], temp);
 		break;
 	case TGSI_OPCODE_DST:
-	{
-		struct nv50_reg *one = alloc_immd(pc, 1.0);
-		if (mask & (1 << 0))
-			emit_mov(pc, dst[0], one);
 		if (mask & (1 << 1))
 			emit_mul(pc, dst[1], src[0][1], src[1][1]);
 		if (mask & (1 << 2))
 			emit_mov(pc, dst[2], src[0][2]);
 		if (mask & (1 << 3))
 			emit_mov(pc, dst[3], src[1][3]);
-		FREE(one);
-	}
+		if (mask & (1 << 0))
+			emit_mov_immdval(pc, dst[0], 1.0f);
 		break;
 	case TGSI_OPCODE_EX2:
-		temp = temp_temp(pc);
 		emit_preex2(pc, temp, src[0][0]);
-		emit_flop(pc, 6, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_flop(pc, 6, brdc, temp);
 		break;
 	case TGSI_OPCODE_FLR:
 		for (c = 0; c < 4; c++) {
@@ -1555,13 +1535,7 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		emit_lit(pc, &dst[0], mask, &src[0][0]);
 		break;
 	case TGSI_OPCODE_LG2:
-		temp = temp_temp(pc);
-		emit_flop(pc, 3, temp, src[0][0]);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_flop(pc, 3, brdc, src[0][0]);
 		break;
 	case TGSI_OPCODE_LRP:
 		temp = temp_temp(pc);
@@ -1609,31 +1583,18 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		}
 		break;
 	case TGSI_OPCODE_POW:
-		temp = temp_temp(pc);
-		emit_pow(pc, temp, src[0][0], src[1][0]);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_pow(pc, brdc, src[0][0], src[1][0]);
 		break;
 	case TGSI_OPCODE_RCP:
-		for (c = 3; c >= 0; c--) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_flop(pc, 0, dst[c], src[0][0]);
-		}
+		emit_flop(pc, 0, brdc, src[0][0]);
 		break;
 	case TGSI_OPCODE_RSQ:
-		for (c = 3; c >= 0; c--) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_flop(pc, 2, dst[c], src[0][0]);
-		}
+		emit_flop(pc, 2, brdc, src[0][0]);
 		break;
 	case TGSI_OPCODE_SCS:
 		temp = temp_temp(pc);
-		emit_precossin(pc, temp, src[0][0]);
+		if (mask & 3)
+			emit_precossin(pc, temp, src[0][0]);
 		if (mask & (1 << 0))
 			emit_flop(pc, 5, dst[0], temp);
 		if (mask & (1 << 1))
@@ -1706,6 +1667,13 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		return FALSE;
 	}
 
+	if (brdc) {
+		if (sat)
+			emit_sat(pc, brdc, brdc);
+		for (c = 0; c < 4; c++)
+			if ((mask & (1 << c)) && dst[c] != brdc)
+				emit_mov(pc, dst[c], brdc);
+	} else
 	if (sat) {
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0005-nv50-SIN-and-COS-use-src0.w-for-dst.w.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0005-nv50-SIN-and-COS-use-src0.w-for-dst.w.patch"

From 36313101fb599980be5155c9419f270a8255d958 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Mon, 7 Sep 2009 18:12:29 +0200
Subject: [PATCH 05/13] nv50: SIN and COS use src0.w for dst.w

Try to save some MOVs.
---
 src/gallium/drivers/nv50/nv50_program.c |   36 +++++++++++++++++-------------
 1 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index d198032..e7beb26 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1337,6 +1337,7 @@ static boolean
 is_scalar_op(unsigned op)
 {
 	switch (op) {
+	case TGSI_OPCODE_COS:
 	case TGSI_OPCODE_DP2:
 	case TGSI_OPCODE_DP3:
 	case TGSI_OPCODE_DP4:
@@ -1346,12 +1347,11 @@ is_scalar_op(unsigned op)
 	case TGSI_OPCODE_POW:
 	case TGSI_OPCODE_RCP:
 	case TGSI_OPCODE_RSQ:
+	case TGSI_OPCODE_SIN:
 		/*
-	case TGSI_OPCODE_COS:
 	case TGSI_OPCODE_KIL:
 	case TGSI_OPCODE_LIT:
 	case TGSI_OPCODE_SCS:
-	case TGSI_OPCODE_SIN:
 		*/
 		return TRUE;
 	default:
@@ -1468,14 +1468,16 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		}
 		break;
 	case TGSI_OPCODE_COS:
-		temp = temp_temp(pc);
-		emit_precossin(pc, temp, src[0][0]);
-		emit_flop(pc, 5, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
+		if (mask & 8) {
+			emit_precossin(pc, temp, src[0][3]);
+			emit_flop(pc, 5, dst[3], temp);
+			if (!(mask &= 7))
+				break;
+			if (temp == dst[3])
+				temp = brdc = temp_temp(pc);
 		}
+		emit_precossin(pc, temp, src[0][0]);
+		emit_flop(pc, 5, brdc, temp);
 		break;
 	case TGSI_OPCODE_DP3:
 		emit_mul(pc, temp, src[0][0], src[1][0]);
@@ -1612,14 +1614,16 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		}
 		break;
 	case TGSI_OPCODE_SIN:
-		temp = temp_temp(pc);
-		emit_precossin(pc, temp, src[0][0]);
-		emit_flop(pc, 4, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
+		if (mask & 8) {
+			emit_precossin(pc, temp, src[0][3]);
+			emit_flop(pc, 4, dst[3], temp);
+			if (!(mask &= 7))
+				break;
+			if (temp == dst[3])
+				temp = brdc = temp_temp(pc);
 		}
+		emit_precossin(pc, temp, src[0][0]);
+		emit_flop(pc, 4, brdc, temp);
 		break;
 	case TGSI_OPCODE_SLT:
 		for (c = 0; c < 4; c++) {
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0006-nv50-handle-SEQ-SGT-SLE-SNE-opcodes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0006-nv50-handle-SEQ-SGT-SLE-SNE-opcodes.patch"

From eab925aa08abff211c7963110003840f8fc14d72 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 22:38:09 +0200
Subject: [PATCH 06/13] nv50: handle SEQ, SGT, SLE, SNE opcodes

---
 src/gallium/drivers/nv50/nv50_program.c |   91 +++++++++++++++++++++----------
 1 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index e7beb26..381e396 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -790,6 +790,9 @@ emit_precossin(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 #define CVTOP_SAT	0x08
 #define CVTOP_ABS	0x10
 
+/* 0x04 == 32 bit */
+/* 0x40 == dst is float */
+/* 0x80 == src is float */
 #define CVT_F32_F32 0xc4
 #define CVT_F32_S32 0x44
 #define CVT_F32_U32 0x64
@@ -799,7 +802,7 @@ emit_precossin(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 
 static void
 emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
-	 int wp, unsigned cop, unsigned fmt)
+	 int wp, unsigned cvn, unsigned fmt)
 {
 	struct nv50_program_exec *e;
 
@@ -808,7 +811,7 @@ emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
 
 	e->inst[0] |= 0xa0000000;
 	e->inst[1] |= 0x00004000;
-	e->inst[1] |= (cop << 16);
+	e->inst[1] |= (cvn << 16);
 	e->inst[1] |= (fmt << 24);
 	set_src_0(pc, src, e);
 
@@ -825,49 +828,78 @@ emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
 	emit(pc, e);
 }
 
+/* nv50 Condition codes:
+ *  0x1 = LT
+ *  0x2 = EQ
+ *  0x3 = LE
+ *  0x4 = GT
+ *  0x5 = NE
+ *  0x6 = GE
+ *  0x7 = set condition code ? (used before bra.lt/le/gt/ge)
+ *  0x8 = unordered bit (allows NaN)
+ */
 static void
-emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst,
+emit_set(struct nv50_pc *pc, unsigned ccode, struct nv50_reg *dst, int wp,
 	 struct nv50_reg *src0, struct nv50_reg *src1)
 {
 	struct nv50_program_exec *e = exec(pc);
-	unsigned inv_cop[8] = { 0, 4, 2, 6, 1, 5, 3, 7 };
 	struct nv50_reg *rdst;
 
-	assert(c_op <= 7);
+	assert(ccode < 16);
 	if (check_swap_src_0_1(pc, &src0, &src1))
-		c_op = inv_cop[c_op];
+		ccode = ccode ^ 0x7;
 
 	rdst = dst;
-	if (dst->type != P_TEMP)
+	if (dst && dst->type != P_TEMP)
 		dst = alloc_temp(pc, NULL);
 
 	/* set.u32 */
 	set_long(pc, e);
 	e->inst[0] |= 0xb0000000;
-	e->inst[1] |= (3 << 29);
-	e->inst[1] |= (c_op << 14);
-	/*XXX: breaks things, .u32 by default?
-	 *     decuda will disasm as .u16 and use .lo/.hi regs, but this
-	 *     doesn't seem to match what the hw actually does.
-	inst[1] |= 0x04000000; << breaks things.. .u32 by default?
+	e->inst[1] |= 0x60000000 | (ccode << 14);
+
+	/* XXX: decuda will disasm as .u16 and use .lo/.hi regs, but
+	 * that doesn't seem to match what the hw actually does
+	e->inst[1] |= 0x04000000; << breaks things, u32 by default ?
 	 */
-	set_dst(pc, dst, e);
+
+	if (wp >= 0)
+		set_pred_wr(pc, 1, wp, e);
+	if (dst)
+		set_dst(pc, dst, e);
+	else {
+		e->inst[0] |= 0x000001fc;
+		e->inst[1] |= 0x00000008;
+	}
+
 	set_src_0(pc, src0, e);
 	set_src_1(pc, src1, e);
-	emit(pc, e);
 
-	/* cvt.f32.u32 */
-	e = exec(pc);
-	e->inst[0] = 0xa0000001;
-	e->inst[1] = 0x64014780;
-	set_dst(pc, rdst, e);
-	set_src_0(pc, dst, e);
 	emit(pc, e);
 
-	if (dst != rdst)
+	/* cvt.f32.u32/s32 (?) if we didn't only write the predicate */
+	if (rdst)
+		emit_cvt(pc, rdst, dst, -1, CVTOP_ABS | CVTOP_RN, CVT_F32_S32);
+	if (rdst && rdst != dst)
 		free_temp(pc, dst);
 }
 
+static INLINE unsigned
+map_tgsi_setop_cc(unsigned op)
+{
+	switch (op) {
+	case TGSI_OPCODE_SLT: return 0x1;
+	case TGSI_OPCODE_SGE: return 0x6;
+	case TGSI_OPCODE_SEQ: return 0x2;
+	case TGSI_OPCODE_SGT: return 0x4;
+	case TGSI_OPCODE_SLE: return 0x3;
+	case TGSI_OPCODE_SNE: return 0xd;
+	default:
+		assert(0);
+		return 0;
+	}
+}
+
 static INLINE void
 emit_flr(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 {
@@ -1606,13 +1638,6 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		if (mask & (1 << 3))
 			emit_mov_immdval(pc, dst[3], 1.0);
 		break;
-	case TGSI_OPCODE_SGE:
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_set(pc, 6, dst[c], src[0][c], src[1][c]);
-		}
-		break;
 	case TGSI_OPCODE_SIN:
 		if (mask & 8) {
 			emit_precossin(pc, temp, src[0][3]);
@@ -1626,10 +1651,16 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		emit_flop(pc, 4, brdc, temp);
 		break;
 	case TGSI_OPCODE_SLT:
+	case TGSI_OPCODE_SGE:
+	case TGSI_OPCODE_SEQ:
+	case TGSI_OPCODE_SGT:
+	case TGSI_OPCODE_SLE:
+	case TGSI_OPCODE_SNE:
+		i = map_tgsi_setop_cc(inst->Instruction.Opcode);
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_set(pc, 1, dst[c], src[0][c], src[1][c]);
+			emit_set(pc, i, dst[c], -1, src[0][c], src[1][c]);
 		}
 		break;
 	case TGSI_OPCODE_SUB:
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0007-nv50-handle-CEIL-and-TRUNC-opcodes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0007-nv50-handle-CEIL-and-TRUNC-opcodes.patch"

From b79a3b863f77866b08c200b025cbcfbca13fdb47 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 22:42:57 +0200
Subject: [PATCH 07/13] nv50: handle CEIL and TRUNC opcodes

---
 src/gallium/drivers/nv50/nv50_program.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 381e396..16df4d8 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1499,6 +1499,14 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 			emit_add(pc, dst[c], src[0][c], src[1][c]);
 		}
 		break;
+	case TGSI_OPCODE_CEIL:
+		for (c = 0; c < 4; c++) {
+			if (!(mask & (1 << c)))
+				continue;
+			emit_cvt(pc, dst[c], src[0][c], -1,
+				 CVTOP_CEIL, CVT_F32_F32);
+		}
+		break;
 	case TGSI_OPCODE_COS:
 		if (mask & 8) {
 			emit_precossin(pc, temp, src[0][3]);
@@ -1678,6 +1686,14 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		emit_tex(pc, dst, mask, src[0], unit,
 			 inst->InstructionExtTexture.Texture, TRUE);
 		break;
+	case TGSI_OPCODE_TRUNC:
+		for (c = 0; c < 4; c++) {
+			if (!(mask & (1 << c)))
+				continue;
+			emit_cvt(pc, dst[c], src[0][c], -1,
+				 CVTOP_TRUNC, CVT_F32_F32);
+		}
+		break;
 	case TGSI_OPCODE_XPD:
 		temp = temp_temp(pc);
 		if (mask & (1 << 0)) {
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0008-nv50-cleanup-nv50_reg-initialization-a-little.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0008-nv50-cleanup-nv50_reg-initialization-a-little.patch"

From 985bd5a5f26d66ad6afa2a51a508369a8d1d5b79 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Thu, 10 Sep 2009 23:44:54 +0200
Subject: [PATCH 08/13] nv50: cleanup nv50_reg initialization a little

---
 src/gallium/drivers/nv50/nv50_program.c |   93 ++++++++++++++-----------------
 1 files changed, 42 insertions(+), 51 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 16df4d8..e2adeca 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -128,6 +128,17 @@ struct nv50_pc {
 	boolean allow32;
 };
 
+static INLINE void
+ctor_reg(struct nv50_reg *reg, unsigned type, int index, int hw)
+{
+	reg->type = type;
+	reg->index = index;
+	reg->hw = hw;
+	reg->neg = 0;
+	reg->rhw = -1;
+	reg->acc = 0;
+}
+
 static void
 alloc_reg(struct nv50_pc *pc, struct nv50_reg *reg)
 {
@@ -188,11 +199,8 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
 
 	for (i = 0; i < NV50_SU_MAX_TEMP; i++) {
 		if (!pc->r_temp[i]) {
-			r = CALLOC_STRUCT(nv50_reg);
-			r->type = P_TEMP;
-			r->index = -1;
-			r->hw = i;
-			r->rhw = -1;
+			r = MALLOC_STRUCT(nv50_reg);
+			ctor_reg(r, P_TEMP, -1, i);
 			pc->r_temp[i] = r;
 			return r;
 		}
@@ -258,10 +266,8 @@ alloc_temp4(struct nv50_pc *pc, struct nv50_reg *dst[4], int idx)
 		return alloc_temp4(pc, dst, idx + 4);
 
 	for (i = 0; i < 4; i++) {
-		dst[i] = CALLOC_STRUCT(nv50_reg);
-		dst[i]->type = P_TEMP;
-		dst[i]->index = -1;
-		dst[i]->hw = idx + i;
+		dst[i] = MALLOC_STRUCT(nv50_reg);
+		ctor_reg(dst[i], P_TEMP, -1, idx + i);
 		pc->r_temp[idx + i] = dst[i];
 	}
 
@@ -313,7 +319,7 @@ ctor_immd(struct nv50_pc *pc, float x, float y, float z, float w)
 static struct nv50_reg *
 alloc_immd(struct nv50_pc *pc, float f)
 {
-	struct nv50_reg *r = CALLOC_STRUCT(nv50_reg);
+	struct nv50_reg *r = MALLOC_STRUCT(nv50_reg);
 	unsigned hw;
 
 	for (hw = 0; hw < pc->immd_nr * 4; hw++)
@@ -323,9 +329,7 @@ alloc_immd(struct nv50_pc *pc, float f)
 	if (hw == pc->immd_nr * 4)
 		hw = ctor_immd(pc, f, -f, 0.5 * f, 0) * 4;
 
-	r->type = P_IMMD;
-	r->hw = hw;
-	r->index = -1;
+	ctor_reg(r, P_IMMD, -1, hw);
 	return r;
 }
 
@@ -2160,16 +2164,13 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	}
 
 	if (pc->temp_nr) {
-		pc->temp = CALLOC(pc->temp_nr * 4, sizeof(struct nv50_reg));
+		pc->temp = MALLOC(pc->temp_nr * 4 * sizeof(struct nv50_reg));
 		if (!pc->temp)
 			goto out_err;
 
 		for (i = 0; i < pc->temp_nr; i++) {
 			for (c = 0; c < 4; c++) {
-				pc->temp[i*4+c].type = P_TEMP;
-				pc->temp[i*4+c].hw = -1;
-				pc->temp[i*4+c].rhw = -1;
-				pc->temp[i*4+c].index = i;
+				ctor_reg(&pc->temp[i*4+c], P_TEMP, i, -1);
 				pc->temp[i*4+c].acc = r_usage[0][i*4+c];
 			}
 		}
@@ -2252,71 +2253,61 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			for (i = 0; i < pc->attr_nr * 4; i++) {
 				pc->p->cfg.vp.attr[aid / 32] |=
 					(1 << (aid % 32));
-				pc->attr[i].type = P_ATTR;
-				pc->attr[i].hw = aid++;
-				pc->attr[i].index = i / 4;
+				ctor_reg(&pc->attr[i], P_ATTR, i / 4, aid++);
 			}
 		}
 	}
 
 	if (pc->result_nr) {
+		unsigned nr = pc->result_nr * 4;
 		int rid = 0;
 
-		pc->result = CALLOC(pc->result_nr * 4, sizeof(struct nv50_reg));
+		pc->result = MALLOC(nr * sizeof(struct nv50_reg));
 		if (!pc->result)
 			goto out_err;
 
-		for (i = 0; i < pc->result_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-					pc->result[i*4+c].type = P_TEMP;
-					pc->result[i*4+c].hw = -1;
-					pc->result[i*4+c].rhw = (i == depr) ?
-						-1 : rid++;
-				} else {
-					pc->result[i*4+c].type = P_RESULT;
-					pc->result[i*4+c].hw = rid++;
+		if (pc->p->type == PIPE_SHADER_VERTEX) {
+			for (i = 0; i < nr; i++)
+				ctor_reg(&pc->result[i], P_RESULT, i / 4, i);
+		} else {
+			/* pc->p->type == PIPE_SHADER_FRAGMENT */
+			for (i = 0; i < pc->result_nr; i++) {
+				for (c = 0; c < 4; c++) {
+					ctor_reg(&pc->result[i*4+c],
+						 P_TEMP, i, -1);
+					if (i != depr)
+						pc->result[i*4+c].rhw = rid++;
 				}
-				pc->result[i*4+c].index = i;
 			}
 
-			if (pc->p->type == PIPE_SHADER_FRAGMENT &&
-			    depr != 0xffff) {
-				pc->result[depr * 4 + 2].rhw =
-					(pc->result_nr - 1) * 4;
-			}
+			if (depr != 0xffff)
+				pc->result[depr*4+2].rhw = rid++;
 		}
 	}
 
 	if (pc->param_nr) {
 		int rid = 0;
 
-		pc->param = CALLOC(pc->param_nr * 4, sizeof(struct nv50_reg));
+		pc->param = MALLOC(pc->param_nr * 4 * sizeof(struct nv50_reg));
 		if (!pc->param)
 			goto out_err;
 
 		for (i = 0; i < pc->param_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				pc->param[i*4+c].type = P_CONST;
-				pc->param[i*4+c].hw = rid++;
-				pc->param[i*4+c].index = i;
-			}
+			for (c = 0; c < 4; c++, rid++)
+				ctor_reg(&pc->param[rid], P_CONST, i, rid);
 		}
 	}
 
 	if (pc->immd_nr) {
 		int rid = 0;
 
-		pc->immd = CALLOC(pc->immd_nr * 4, sizeof(struct nv50_reg));
+		pc->immd = MALLOC(pc->immd_nr * 4 * sizeof(struct nv50_reg));
 		if (!pc->immd)
 			goto out_err;
 
 		for (i = 0; i < pc->immd_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				pc->immd[i*4+c].type = P_IMMD;
-				pc->immd[i*4+c].hw = rid++;
-				pc->immd[i*4+c].index = i;
-			}
+			for (c = 0; c < 4; c++, rid++)
+				ctor_reg(&pc->immd[rid], P_IMMD, i, rid);
 		}
 	}
 
@@ -2391,8 +2382,8 @@ nv50_program_tx(struct nv50_program *p)
 
 	if (p->type == PIPE_SHADER_FRAGMENT) {
 		struct nv50_reg out;
+		ctor_reg(&out, P_TEMP, -1, -1);
 
-		out.type = P_TEMP;
 		for (k = 0; k < pc->result_nr * 4; k++) {
 			if (pc->result[k].rhw == -1)
 				continue;
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0009-nv50-move-allocation-of-pc-regs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0009-nv50-move-allocation-of-pc-regs.patch"

From 17801b4d71db15041212eb2e50e56afa782f521e Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 12 Sep 2009 15:36:09 +0200
Subject: [PATCH 09/13] nv50: move allocation of pc regs

Make use of tgsi_shader_info to determine how many nv50_regs
we need to allocate, if program uses KIL, or writes DEPR.
---
 src/gallium/drivers/nv50/nv50_program.c |  284 ++++++++++++++-----------------
 1 files changed, 129 insertions(+), 155 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index e2adeca..c8157f1 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1575,7 +1575,6 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 		emit_kil(pc, src[0][1]);
 		emit_kil(pc, src[0][2]);
 		emit_kil(pc, src[0][3]);
-		pc->p->cfg.fp.regs[2] |= 0x00100000;
 		break;
 	case TGSI_OPCODE_LIT:
 		emit_lit(pc, &dst[0], mask, &src[0][0]);
@@ -1754,64 +1753,52 @@ nv50_program_tx_insn(struct nv50_pc *pc,
 }
 
 static void
-prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
-		  unsigned *r_usage[2])
+prep_inspect_insn(struct nv50_pc *pc, const struct tgsi_full_instruction *insn)
 {
-	const struct tgsi_full_instruction *insn;
+	struct nv50_reg *reg = NULL;
 	const struct tgsi_full_src_register *src;
 	const struct tgsi_dst_register *dst;
+	unsigned i, c, k, mask;
 
-	unsigned i, c, k, n, mask, *acc_p;
-
-	insn = &tok->FullInstruction;
 	dst = &insn->FullDstRegisters[0].DstRegister;
 	mask = dst->WriteMask;
 
-	if (!r_usage[0])
-		r_usage[0] = CALLOC(pc->temp_nr * 4, sizeof(unsigned));
-	if (!r_usage[1])
-		r_usage[1] = CALLOC(pc->attr_nr * 4, sizeof(unsigned));
+        if (dst->File == TGSI_FILE_TEMPORARY)
+                reg = pc->temp;
+        else
+        if (dst->File == TGSI_FILE_OUTPUT)
+                reg = pc->result;
 
-	if (dst->File == TGSI_FILE_TEMPORARY) {
+	if (reg) {
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			r_usage[0][dst->Index * 4 + c] = pc->insn_nr;
+			reg[dst->Index * 4 + c].acc = pc->insn_nr;
 		}
 	}
 
 	for (i = 0; i < insn->Instruction.NumSrcRegs; i++) {
 		src = &insn->FullSrcRegisters[i];
 
-		switch (src->SrcRegister.File) {
-		case TGSI_FILE_TEMPORARY:
-			acc_p = r_usage[0];
-			break;
-		case TGSI_FILE_INPUT:
-			acc_p = r_usage[1];
-			break;
-		default:
+		if (src->SrcRegister.File == TGSI_FILE_TEMPORARY)
+			reg = pc->temp;
+		else
+		if (src->SrcRegister.File == TGSI_FILE_INPUT)
+			reg = pc->attr;
+		else
 			continue;
-		}
 
 		mask = nv50_tgsi_src_mask(insn, i);
 
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-
 			k = tgsi_util_get_full_src_register_extswizzle(src, c);
-			switch (k) {
-			case TGSI_EXTSWIZZLE_X:
-			case TGSI_EXTSWIZZLE_Y:
-			case TGSI_EXTSWIZZLE_Z:
-			case TGSI_EXTSWIZZLE_W:
-				n = src->SrcRegister.Index * 4 + k;
-				acc_p[n] = pc->insn_nr;
-				break;
-			default:
-				break;
-			}
+
+			if (k > TGSI_EXTSWIZZLE_W)
+				continue;
+
+			reg[src->SrcRegister.Index * 4 + k].acc = pc->insn_nr;
 		}
 	}
 }
@@ -1986,8 +1973,7 @@ nv50_tgsi_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 }
 
 static unsigned
-load_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *mid,
-	       int *aid, int *p_oid)
+load_fp_attrib(struct nv50_pc *pc, int i, int *mid, int *aid, int *p_oid)
 {
 	struct nv50_reg *iv;
 	int oid, c, n;
@@ -1997,15 +1983,11 @@ load_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *mid,
 
 	for (c = 0, n = i * 4; c < 4; c++, n++) {
 		oid = (*p_oid)++;
-		pc->attr[n].type = P_TEMP;
-		pc->attr[n].index = i;
 
-		if (pc->attr[n].acc == acc[n])
+		if (!pc->attr[n].acc)
 			continue;
 		mask |= (1 << c);
 
-		pc->attr[n].acc = acc[n];
-		pc->attr[n].rhw = pc->attr[n].hw = -1;
 		alloc_reg(pc, &pc->attr[n]);
 
 		pc->attr[n].rhw = (*aid)++;
@@ -2025,23 +2007,13 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	struct tgsi_parse_context p;
 	boolean ret = FALSE;
 	unsigned i, c;
-	unsigned fcol, bcol, fcrd, depr;
+	unsigned fcol, bcol, fcrd;
 
 	/* count (centroid) perspective interpolations */
 	unsigned centroid_loads = 0;
 	unsigned perspect_loads = 0;
 
-	/* track register access for temps and attrs */
-	unsigned *r_usage[2];
-	r_usage[0] = NULL;
-	r_usage[1] = NULL;
-
-	depr = fcol = bcol = fcrd = 0xffff;
-
-	if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-		pc->p->cfg.fp.regs[0] = 0x01000404;
-		pc->p->cfg.fp.regs[1] = 0x00000400;
-	}
+	fcol = bcol = fcrd = ~0;
 
 	tgsi_parse_init(&p, pc->p->pipe.tokens);
 	while (!tgsi_parse_end_of_tokens(&p)) {
@@ -2071,32 +2043,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 			switch (d->Declaration.File) {
 			case TGSI_FILE_TEMPORARY:
-				if (pc->temp_nr < (last + 1))
-					pc->temp_nr = last + 1;
 				break;
 			case TGSI_FILE_OUTPUT:
-				if (pc->result_nr < (last + 1))
-					pc->result_nr = last + 1;
-
-				if (!d->Declaration.Semantic)
-					break;
-
-				switch (d->Semantic.SemanticName) {
-				case TGSI_SEMANTIC_POSITION:
-					depr = first;
-					pc->p->cfg.fp.regs[2] |= 0x00000100;
-					pc->p->cfg.fp.regs[3] |= 0x00000011;
-					break;
-				default:
-					break;
-				}
-
 				break;
 			case TGSI_FILE_INPUT:
 			{
-				if (pc->attr_nr < (last + 1))
-					pc->attr_nr = last + 1;
-
 				if (pc->p->type != PIPE_SHADER_FRAGMENT)
 					break;
 
@@ -2121,10 +2072,6 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 						fcol = first;
 						mode = INTERP_PERSPECTIVE;
 						break;
-					case TGSI_SEMANTIC_BCOLOR:
-						bcol = first;
-						mode = INTERP_PERSPECTIVE;
-						break;
 					}
 				}
 
@@ -2142,8 +2089,6 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			}
 				break;
 			case TGSI_FILE_CONSTANT:
-				if (pc->param_nr < (last + 1))
-					pc->param_nr = last + 1;
 				break;
 			case TGSI_FILE_SAMPLER:
 				break;
@@ -2156,49 +2101,29 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			break;
 		case TGSI_TOKEN_TYPE_INSTRUCTION:
 			pc->insn_nr++;
-			prep_inspect_insn(pc, tok, r_usage);
+			prep_inspect_insn(pc, &tok->FullInstruction);
 			break;
 		default:
 			break;
 		}
 	}
 
-	if (pc->temp_nr) {
-		pc->temp = MALLOC(pc->temp_nr * 4 * sizeof(struct nv50_reg));
-		if (!pc->temp)
-			goto out_err;
-
-		for (i = 0; i < pc->temp_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				ctor_reg(&pc->temp[i*4+c], P_TEMP, i, -1);
-				pc->temp[i*4+c].acc = r_usage[0][i*4+c];
-			}
-		}
-	}
-
 	if (pc->attr_nr) {
 		int oid = 4, mid = 4, aid = 0;
 		/* oid = VP output id
 		 * aid = FP attribute/interpolant id
 		 * mid = VP output mapping field ID
 		 */
-
-		pc->attr = CALLOC(pc->attr_nr * 4, sizeof(struct nv50_reg));
-		if (!pc->attr)
-			goto out_err;
-
 		if (pc->p->type == PIPE_SHADER_FRAGMENT) {
 			/* position should be loaded first */
-			if (fcrd != 0xffff) {
+			if (fcrd < 0x40) {
 				unsigned mask;
 				mid = 0;
-				mask = load_fp_attrib(pc, fcrd, r_usage[1],
-						      &mid, &aid, &oid);
-				oid = 0;
+				mask = load_fp_attrib(pc, fcrd, &mid, &aid,
+						      &oid);
 				pc->p->cfg.fp.regs[1] |= (mask << 24);
-				pc->p->cfg.fp.map[0] = 0x04040404 * fcrd;
+				pc->p->cfg.fp.map[0] += 0x04040404 * fcrd;
 			}
-			pc->p->cfg.fp.map[0] += 0x03020100;
 
 			/* should do MAD fcrd.xy, fcrd, SOME_CONST, fcrd */
 
@@ -2228,18 +2153,13 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			}
 
 			for (c = 0; c < 4; c++) {
-				/* I don't know what these values do, but
-				 * let's set them like the blob does:
-				 */
-				if (fcol != 0xffff && r_usage[1][fcol * 4 + c])
-					pc->p->cfg.fp.regs[0] += 0x00010000;
-				if (bcol != 0xffff && r_usage[1][bcol * 4 + c])
+				/* XXX: secondary colour, tbd */
+				if (fcol < 0x40 && pc->attr[fcol * 4 + c].acc)
 					pc->p->cfg.fp.regs[0] += 0x00010000;
 			}
 
-			for (i = 0; i < pc->attr_nr; i++)
-				load_fp_attrib(pc, i, r_usage[1],
-					       &mid, &aid, &oid);
+			for (i = ((fcrd < 0x40) ? 1 : 0); i < pc->attr_nr; i++)
+				load_fp_attrib(pc, i, &mid, &aid, &oid);
 
 			if (pc->iv_p)
 				free_temp(pc, pc->iv_p);
@@ -2253,48 +2173,26 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			for (i = 0; i < pc->attr_nr * 4; i++) {
 				pc->p->cfg.vp.attr[aid / 32] |=
 					(1 << (aid % 32));
-				ctor_reg(&pc->attr[i], P_ATTR, i / 4, aid++);
+				pc->attr[i].hw = aid++;
 			}
 		}
 	}
 
 	if (pc->result_nr) {
-		unsigned nr = pc->result_nr * 4;
-		int rid = 0;
-
-		pc->result = MALLOC(nr * sizeof(struct nv50_reg));
-		if (!pc->result)
-			goto out_err;
-
 		if (pc->p->type == PIPE_SHADER_VERTEX) {
-			for (i = 0; i < nr; i++)
-				ctor_reg(&pc->result[i], P_RESULT, i / 4, i);
+			for (i = 0; i < pc->result_nr * 4; i++)
+				pc->result[i].hw = i;
 		} else {
-			/* pc->p->type == PIPE_SHADER_FRAGMENT */
-			for (i = 0; i < pc->result_nr; i++) {
-				for (c = 0; c < 4; c++) {
-					ctor_reg(&pc->result[i*4+c],
-						 P_TEMP, i, -1);
-					if (i != depr)
-						pc->result[i*4+c].rhw = rid++;
-				}
-			}
-
-			if (depr != 0xffff)
-				pc->result[depr*4+2].rhw = rid++;
-		}
-	}
-
-	if (pc->param_nr) {
-		int rid = 0;
-
-		pc->param = MALLOC(pc->param_nr * 4 * sizeof(struct nv50_reg));
-		if (!pc->param)
-			goto out_err;
+			/* type == PIPE_SHADER_FRAGMENT
+			 * FragDepth is always first TGSI and last HW output
+			 */
+			int rid = 0;
+			i = pc->p->info.writes_z ? 4 : 0;
 
-		for (i = 0; i < pc->param_nr; i++) {
-			for (c = 0; c < 4; c++, rid++)
-				ctor_reg(&pc->param[rid], P_CONST, i, rid);
+			for (; i < pc->result_nr * 4; i++)
+				pc->result[i].rhw = rid++;
+			if (pc->p->info.writes_z)
+				pc->result[2].rhw = rid;
 		}
 	}
 
@@ -2313,11 +2211,6 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 	ret = TRUE;
 out_err:
-	if (r_usage[0])
-		FREE(r_usage[0]);
-	if (r_usage[1])
-		FREE(r_usage[1]);
-
 	tgsi_parse_free(&p);
 	return ret;
 }
@@ -2340,6 +2233,85 @@ free_nv50_pc(struct nv50_pc *pc)
 }
 
 static boolean
+ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
+{
+	int i, c;
+	unsigned rtype[2] = { P_ATTR, P_RESULT };
+
+	pc->p = p;
+	pc->temp_nr = p->info.file_max[TGSI_FILE_TEMPORARY] + 1;
+	pc->attr_nr = p->info.file_max[TGSI_FILE_INPUT] + 1;
+	pc->result_nr = p->info.file_max[TGSI_FILE_OUTPUT] + 1;
+	pc->param_nr = p->info.file_max[TGSI_FILE_CONSTANT] + 1;
+
+	p->cfg.high_temp = 4;
+
+	switch (p->type) {
+	case PIPE_SHADER_VERTEX:
+		break;
+	case PIPE_SHADER_FRAGMENT:
+		p->cfg.fp.regs[0] = 0x01000404;
+		p->cfg.fp.regs[1] = 0x00000400;
+
+		p->cfg.fp.map[0] = 0x03020100;
+		p->cfg.fp.high_map = 1;
+
+		rtype[0] = rtype[1] = P_TEMP;
+
+		if (p->info.writes_z) {
+			p->cfg.fp.regs[2] |= 0x00000100;
+			p->cfg.fp.regs[3] |= 0x00000011;
+		}
+		if (p->info.uses_kill)
+			p->cfg.fp.regs[2] |= 0x00100000;
+		break;
+	}
+
+	if (pc->temp_nr) {
+		pc->temp = MALLOC(pc->temp_nr * 4 * sizeof(struct nv50_reg));
+		if (!pc->temp)
+			return FALSE;
+
+		for (i = 0; i < pc->temp_nr * 4; ++i)
+			ctor_reg(&pc->temp[i], P_TEMP, i / 4, -1);
+	}
+
+	if (pc->attr_nr) {
+		pc->attr = MALLOC(pc->attr_nr * 4 * sizeof(struct nv50_reg));
+		if (!pc->attr)
+			return FALSE;
+
+		for (i = 0; i < pc->attr_nr * 4; ++i)
+			ctor_reg(&pc->attr[i], rtype[0], i / 4, -1);
+	}
+
+	if (pc->result_nr) {
+		unsigned nr = pc->result_nr * 4;
+
+		pc->result = MALLOC(nr * sizeof(struct nv50_reg));
+		if (!pc->result)
+			return FALSE;
+
+		for (i = 0; i < nr; ++i)
+			ctor_reg(&pc->result[i], rtype[1], i / 4, -1);
+	}
+
+	if (pc->param_nr) {
+		int rid = 0;
+
+		pc->param = MALLOC(pc->param_nr * 4 * sizeof(struct nv50_reg));
+		if (!pc->param)
+			return FALSE;
+
+		for (i = 0; i < pc->param_nr; ++i)
+			for (c = 0; c < 4; ++c, ++rid)
+				ctor_reg(&pc->param[rid], P_CONST, i, rid);
+	}
+
+	return TRUE;
+}
+
+static boolean
 nv50_program_tx(struct nv50_program *p)
 {
 	struct tgsi_parse_context parse;
@@ -2350,8 +2322,10 @@ nv50_program_tx(struct nv50_program *p)
 	pc = CALLOC_STRUCT(nv50_pc);
 	if (!pc)
 		return FALSE;
-	pc->p = p;
-	pc->p->cfg.high_temp = 4;
+
+	ret = ctor_nv50_pc(pc, p);
+	if (ret == FALSE)
+		goto out_cleanup;
 
 	ret = nv50_program_tx_prep(pc);
 	if (ret == FALSE)
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0010-nv50-proper-linkage-between-VP-and-FP.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0010-nv50-proper-linkage-between-VP-and-FP.patch"

From 2b379601b411361d7ab92a324425300dcd9a91c2 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 12 Sep 2009 21:30:49 +0200
Subject: [PATCH 10/13] nv50: proper linkage between VP and FP

This moves construction of the mapping between VP outputs
and FP inputs into validation.

The map also contains slots for special outputs like clip
distance and point size, so we need to at least merge the
VP related and FP related parts on validation if we want
to support those.

Now we match every single FP input component with results
from the VP and leave those not read out of the map, or
replace those not written by 0 (xyz) or 1 (w).
The bitmap indicating linear interpolants is also filled,
and flat FP inputs are mapped in only after non-flat ones,
as is required.

Furthermore, we can save some space by only fetching VP
attrs we actually use, and avoid wasting any output regs
because of TGSI using less than 4 components.
---
 src/gallium/drivers/nv50/nv50_context.h        |    2 +
 src/gallium/drivers/nv50/nv50_program.c        |  408 +++++++++++++++---------
 src/gallium/drivers/nv50/nv50_program.h        |   28 ++-
 src/gallium/drivers/nv50/nv50_state_validate.c |    5 +
 4 files changed, 283 insertions(+), 160 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 1e9e8e4..3a5f990 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -116,6 +116,7 @@ struct nv50_state {
 	unsigned miptree_nr;
 	struct nouveau_stateobj *vertprog;
 	struct nouveau_stateobj *fragprog;
+	struct nouveau_stateobj *programs;
 	struct nouveau_stateobj *vtxfmt;
 	struct nouveau_stateobj *vtxbuf;
 	struct nouveau_stateobj *vtxattr;
@@ -190,6 +191,7 @@ extern void nv50_clear(struct pipe_context *pipe, unsigned buffers,
 /* nv50_program.c */
 extern void nv50_vertprog_validate(struct nv50_context *nv50);
 extern void nv50_fragprog_validate(struct nv50_context *nv50);
+extern void nv50_linkage_validate(struct nv50_context *nv50);
 extern void nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p);
 
 /* nv50_state_validate.c */
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index c8157f1..feb1504 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -139,6 +139,14 @@ ctor_reg(struct nv50_reg *reg, unsigned type, int index, int hw)
 	reg->acc = 0;
 }
 
+static INLINE unsigned
+popcnt4(uint32_t val)
+{
+	static const unsigned cnt[16]
+	= { 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4 };
+	return cnt[val & 0xf];
+}
+
 static void
 alloc_reg(struct nv50_pc *pc, struct nv50_reg *reg)
 {
@@ -1972,59 +1980,48 @@ nv50_tgsi_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	return TRUE;
 }
 
-static unsigned
-load_fp_attrib(struct nv50_pc *pc, int i, int *mid, int *aid, int *p_oid)
+static void
+load_interpolant(struct nv50_pc *pc, struct nv50_reg *reg)
 {
-	struct nv50_reg *iv;
-	int oid, c, n;
-	unsigned mask = 0;
-
-	iv = (pc->interp_mode[i] & INTERP_CENTROID) ? pc->iv_c : pc->iv_p;
+	struct nv50_reg *iv, **ppiv;
+	unsigned mode = pc->interp_mode[reg->index];
 
-	for (c = 0, n = i * 4; c < 4; c++, n++) {
-		oid = (*p_oid)++;
+	ppiv = (mode & INTERP_CENTROID) ? &pc->iv_c : &pc->iv_p;
+	iv = *ppiv;
 
-		if (!pc->attr[n].acc)
-			continue;
-		mask |= (1 << c);
+	if ((mode & INTERP_PERSPECTIVE) && !iv) {
+		iv = *ppiv = alloc_temp(pc, NULL);
+		iv->rhw = popcnt4(pc->p->cfg.regs[1] >> 24) - 1;
 
-		alloc_reg(pc, &pc->attr[n]);
+		emit_interp(pc, iv, NULL, mode & INTERP_CENTROID);
+		emit_flop(pc, 0, iv, iv);
 
-		pc->attr[n].rhw = (*aid)++;
-		emit_interp(pc, &pc->attr[n], iv, pc->interp_mode[i]);
-
-		pc->p->cfg.fp.map[(*mid) / 4] |= oid << (8 * ((*mid) % 4));
-		(*mid)++;
-		pc->p->cfg.fp.regs[1] += 0x00010001;
+		/* XXX: when loading interpolants dynamically, move these
+		 * to the program head, or make sure it can't be skipped.
+		 */
 	}
 
-	return mask;
+	emit_interp(pc, reg, iv, mode);
 }
 
 static boolean
 nv50_program_tx_prep(struct nv50_pc *pc)
 {
-	struct tgsi_parse_context p;
+	struct tgsi_parse_context tp;
+	struct nv50_program *p = pc->p;
 	boolean ret = FALSE;
-	unsigned i, c;
-	unsigned fcol, bcol, fcrd;
-
-	/* count (centroid) perspective interpolations */
-	unsigned centroid_loads = 0;
-	unsigned perspect_loads = 0;
+	unsigned i, c, flat_nr = 0;
 
-	fcol = bcol = fcrd = ~0;
+	tgsi_parse_init(&tp, pc->p->pipe.tokens);
+	while (!tgsi_parse_end_of_tokens(&tp)) {
+		const union tgsi_full_token *tok = &tp.FullToken;
 
-	tgsi_parse_init(&p, pc->p->pipe.tokens);
-	while (!tgsi_parse_end_of_tokens(&p)) {
-		const union tgsi_full_token *tok = &p.FullToken;
-
-		tgsi_parse_token(&p);
+		tgsi_parse_token(&tp);
 		switch (tok->Token.Type) {
 		case TGSI_TOKEN_TYPE_IMMEDIATE:
 		{
 			const struct tgsi_full_immediate *imm =
-				&p.FullToken.FullImmediate;
+				&tp.FullToken.FullImmediate;
 
 			ctor_immd(pc, imm->u[0].Float,
 				      imm->u[1].Float,
@@ -2035,9 +2032,9 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		case TGSI_TOKEN_TYPE_DECLARATION:
 		{
 			const struct tgsi_full_declaration *d;
-			unsigned last, first, mode;
+			unsigned si, last, first, mode;
 
-			d = &p.FullToken.FullDeclaration;
+			d = &tp.FullToken.FullDeclaration;
 			first = d->DeclarationRange.First;
 			last = d->DeclarationRange.Last;
 
@@ -2045,43 +2042,41 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			case TGSI_FILE_TEMPORARY:
 				break;
 			case TGSI_FILE_OUTPUT:
+				if (!d->Declaration.Semantic ||
+				    p->type == PIPE_SHADER_FRAGMENT)
+					break;
+
+				si = d->Semantic.SemanticIndex;
+				switch (d->Semantic.SemanticName) {
+					/*
+				case TGSI_SEMANTIC_CLIP_DISTANCE:
+					p->cfg.clpd = MIN2(p->cfg.clpd, first);
+					break;
+					*/
+				default:
+					break;
+				}
 				break;
 			case TGSI_FILE_INPUT:
 			{
-				if (pc->p->type != PIPE_SHADER_FRAGMENT)
+				if (p->type != PIPE_SHADER_FRAGMENT)
 					break;
 
 				switch (d->Declaration.Interpolate) {
 				case TGSI_INTERPOLATE_CONSTANT:
 					mode = INTERP_FLAT;
+					flat_nr++;
 					break;
 				case TGSI_INTERPOLATE_PERSPECTIVE:
 					mode = INTERP_PERSPECTIVE;
+					p->cfg.regs[1] |= 0x08 << 24;
 					break;
 				default:
 					mode = INTERP_LINEAR;
 					break;
 				}
-
-				if (d->Declaration.Semantic) {
-					switch (d->Semantic.SemanticName) {
-					case TGSI_SEMANTIC_POSITION:
-						fcrd = first;
-						break;
-					case TGSI_SEMANTIC_COLOR:
-						fcol = first;
-						mode = INTERP_PERSPECTIVE;
-						break;
-					}
-				}
-
-				if (d->Declaration.Centroid) {
+				if (d->Declaration.Centroid)
 					mode |= INTERP_CENTROID;
-					if (mode & INTERP_PERSPECTIVE)
-						centroid_loads++;
-				} else
-				if (mode & INTERP_PERSPECTIVE)
-					perspect_loads++;
 
 				assert(last < 32);
 				for (i = first; i <= last; i++)
@@ -2108,92 +2103,105 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		}
 	}
 
-	if (pc->attr_nr) {
-		int oid = 4, mid = 4, aid = 0;
-		/* oid = VP output id
-		 * aid = FP attribute/interpolant id
-		 * mid = VP output mapping field ID
-		 */
-		if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-			/* position should be loaded first */
-			if (fcrd < 0x40) {
-				unsigned mask;
-				mid = 0;
-				mask = load_fp_attrib(pc, fcrd, &mid, &aid,
-						      &oid);
-				pc->p->cfg.fp.regs[1] |= (mask << 24);
-				pc->p->cfg.fp.map[0] += 0x04040404 * fcrd;
-			}
+	if (p->type == PIPE_SHADER_VERTEX) {
+		int rid = 0;
 
-			/* should do MAD fcrd.xy, fcrd, SOME_CONST, fcrd */
-
-			if (perspect_loads) {
-				pc->iv_p = alloc_temp(pc, NULL);
-
-				if (!(pc->p->cfg.fp.regs[1] & 0x08000000)) {
-					pc->p->cfg.fp.regs[1] |= 0x08000000;
-					pc->iv_p->rhw = aid++;
-					emit_interp(pc, pc->iv_p, NULL,
-						    INTERP_LINEAR);
-					emit_flop(pc, 0, pc->iv_p, pc->iv_p);
-				} else {
-					pc->iv_p->rhw = aid - 1;
-					emit_flop(pc, 0, pc->iv_p,
-						  &pc->attr[fcrd * 4 + 3]);
-				}
+		for (i = 0; i < pc->attr_nr * 4; ++i) {
+			if (pc->attr[i].acc) {
+				pc->attr[i].hw = rid++;
+				p->cfg.attr[i / 32] |= 1 << (i % 32);
 			}
+		}
+
+		for (i = 0, rid = 0; i < pc->result_nr; ++i) {
+			p->cfg.io[i].hw_id = rid;
+			p->cfg.io[i].tgsi_id = i;
 
-			if (centroid_loads) {
-				pc->iv_c = alloc_temp(pc, NULL);
-				pc->iv_c->rhw = pc->iv_p ? aid - 1 : aid++;
-				emit_interp(pc, pc->iv_c, NULL,
-					    INTERP_CENTROID);
-				emit_flop(pc, 0, pc->iv_c, pc->iv_c);
-				pc->p->cfg.fp.regs[1] |= 0x08000000;
+			for (c = 0; c < 4; ++c) {
+				int n = i * 4 + c;
+				if (!pc->result[n].acc)
+					continue;
+				pc->result[n].hw = rid++;
+				p->cfg.io[i].mask |= 1 << c;
 			}
+		}
+	} else
+	if (p->type == PIPE_SHADER_FRAGMENT) {
+		int rid, aid;
+		unsigned n = 0, m = pc->attr_nr - flat_nr;
 
-			for (c = 0; c < 4; c++) {
-				/* XXX: secondary colour, tbd */
-				if (fcol < 0x40 && pc->attr[fcol * 4 + c].acc)
-					pc->p->cfg.fp.regs[0] += 0x00010000;
+		int tgsi_off = (TGSI_SEMANTIC_POSITION ==
+				p->info.input_semantic_name[0]) ? 0 : 1;
+
+		/* non-flat interpolants have to be mapped to
+		 * the lower hardware IDs, so sort them:
+		 */
+		for (i = 0; i < pc->attr_nr; i++) {
+			if (pc->interp_mode[i] == INTERP_FLAT)
+				p->cfg.io[m++].tgsi_id = i + tgsi_off;
+			else {
+				if (!(pc->interp_mode[i] & INTERP_PERSPECTIVE))
+					p->cfg.io[n].linear = TRUE;
+				p->cfg.io[n++].tgsi_id = i + tgsi_off;
 			}
+		}
 
-			for (i = ((fcrd < 0x40) ? 1 : 0); i < pc->attr_nr; i++)
-				load_fp_attrib(pc, i, &mid, &aid, &oid);
+		/* now load the interpolants */
+		aid = tgsi_off ? popcnt4(p->cfg.regs[1] >> 24) : 0;
 
-			if (pc->iv_p)
-				free_temp(pc, pc->iv_p);
-			if (pc->iv_c)
-				free_temp(pc, pc->iv_c);
+		for (i = 0; i < pc->attr_nr; ++i) {
+			p->cfg.io[i].hw_id = aid;
 
-			pc->p->cfg.fp.high_map = (mid / 4);
-			pc->p->cfg.fp.high_map += ((mid % 4) ? 1 : 0);
-		} else {
-			/* vertex program */
-			for (i = 0; i < pc->attr_nr * 4; i++) {
-				pc->p->cfg.vp.attr[aid / 32] |=
-					(1 << (aid % 32));
-				pc->attr[i].hw = aid++;
+			for (c = 0; c < 4; ++c) {
+				if (!pc->attr[i * 4 + c].acc)
+					continue;
+				pc->attr[i * 4 + c].rhw = aid++;
+				p->cfg.io[i].mask |= 1 << c;
+
+				load_interpolant(pc, &pc->attr[i * 4 + c]);
 			}
 		}
-	}
 
-	if (pc->result_nr) {
-		if (pc->p->type == PIPE_SHADER_VERTEX) {
-			for (i = 0; i < pc->result_nr * 4; i++)
-				pc->result[i].hw = i;
+		if (!tgsi_off)
+			p->cfg.regs[1] |= p->cfg.io[0].mask << 24;
+
+		m = popcnt4(p->cfg.regs[1] >> 24);
+
+		/* set count of non-position inputs and of non-flat
+		 * non-position inputs for FP_INTERPOLANT_CTRL
+		 */
+		p->cfg.regs[1] |= aid - m;
+		if (flat_nr) {
+			i = p->cfg.io[pc->attr_nr - flat_nr - 1].hw_id;
+			p->cfg.regs[1] |= (i - m) << 16;
 		} else {
-			/* type == PIPE_SHADER_FRAGMENT
-			 * FragDepth is always first TGSI and last HW output
-			 */
-			int rid = 0;
-			i = pc->p->info.writes_z ? 4 : 0;
+			assert(!(p->cfg.regs[1] & 0x0000ff00));
+			p->cfg.regs[1] |= p->cfg.regs[1] << 16;
+		}
 
-			for (; i < pc->result_nr * 4; i++)
-				pc->result[i].rhw = rid++;
-			if (pc->p->info.writes_z)
-				pc->result[2].rhw = rid;
+		/* mark color semantic for light-twoside */
+		for (i = 0; i < pc->attr_nr; i++) {
+			ubyte si, sn;
+
+			n = p->cfg.io[i].tgsi_id - tgsi_off;
+			sn = p->info.input_semantic_name[n];
+			si = p->info.input_semantic_index[n];
+
+			if (sn == TGSI_SEMANTIC_COLOR) {
+				p->cfg.two_side[si] = p->cfg.io[i];
+				p->cfg.regs[0] += popcnt4(
+					p->cfg.two_side[si].mask) << 16;
+			}
 		}
+
+		/* Initialize FP results:
+		 * FragDepth is always first TGSI and last hw output
+		 */
+		i = p->info.writes_z ? 4 : 0;
+		for (rid = 0; i < pc->result_nr * 4; i++)
+			pc->result[i].rhw = rid++;
+		if (p->info.writes_z)
+			pc->result[2].rhw = rid;
 	}
 
 	if (pc->immd_nr) {
@@ -2211,7 +2219,12 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 	ret = TRUE;
 out_err:
-	tgsi_parse_free(&p);
+	if (pc->iv_p)
+		free_temp(pc, pc->iv_p);
+	if (pc->iv_c)
+		free_temp(pc, pc->iv_c);
+
+	tgsi_parse_free(&tp);
 	return ret;
 }
 
@@ -2246,24 +2259,26 @@ ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
 
 	p->cfg.high_temp = 4;
 
+	p->cfg.two_side[0].hw_id = 0x40;
+	p->cfg.two_side[1].hw_id = 0x40;
+
 	switch (p->type) {
 	case PIPE_SHADER_VERTEX:
+		p->cfg.clpd = 0x40;
+		p->cfg.io_nr = pc->result_nr;
 		break;
 	case PIPE_SHADER_FRAGMENT:
-		p->cfg.fp.regs[0] = 0x01000404;
-		p->cfg.fp.regs[1] = 0x00000400;
-
-		p->cfg.fp.map[0] = 0x03020100;
-		p->cfg.fp.high_map = 1;
-
 		rtype[0] = rtype[1] = P_TEMP;
 
+		p->cfg.regs[0] = 0x01000404;
+		p->cfg.io_nr = pc->attr_nr;
+
 		if (p->info.writes_z) {
-			p->cfg.fp.regs[2] |= 0x00000100;
-			p->cfg.fp.regs[3] |= 0x00000011;
+			p->cfg.regs[2] |= 0x00000100;
+			p->cfg.regs[3] |= 0x00000011;
 		}
 		if (p->info.uses_kill)
-			p->cfg.fp.regs[2] |= 0x00100000;
+			p->cfg.regs[2] |= 0x00100000;
 		break;
 	}
 
@@ -2606,8 +2621,8 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		      NOUVEAU_BO_LOW, 0, 0);
 	so_method(so, tesla, NV50TCL_VP_ATTR_EN_0, 2);
-	so_data  (so, p->cfg.vp.attr[0]);
-	so_data  (so, p->cfg.vp.attr[1]);
+	so_data  (so, p->cfg.attr[0]);
+	so_data  (so, p->cfg.attr[1]);
 	so_method(so, tesla, NV50TCL_VP_REG_ALLOC_RESULT, 1);
 	so_data  (so, p->cfg.high_result);
 	so_method(so, tesla, NV50TCL_VP_RESULT_MAP_SIZE, 2);
@@ -2625,7 +2640,6 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_program *p = nv50->fragprog;
 	struct nouveau_stateobj *so;
-	unsigned i;
 
 	if (!p->translated) {
 		nv50_program_validate(nv50, p);
@@ -2642,29 +2656,119 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 		      NOUVEAU_BO_HIGH, 0, 0);
 	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
 		      NOUVEAU_BO_LOW, 0, 0);
-	so_method(so, tesla, NV50TCL_MAP_SEMANTIC_0, 4);
-	so_data  (so, p->cfg.fp.regs[0]); /* 0x01000404 / 0x00040404 */
-	so_data  (so, 0x00000004);
-	so_data  (so, 0x00000000);
-	so_data  (so, 0x00000000);
-	so_method(so, tesla, NV50TCL_VP_RESULT_MAP(0), p->cfg.fp.high_map);
-	for (i = 0; i < p->cfg.fp.high_map; i++)
-		so_data(so, p->cfg.fp.map[i]);
-	so_method(so, tesla, NV50TCL_FP_INTERPOLANT_CTRL, 2);
-	so_data  (so, p->cfg.fp.regs[1]); /* 0x08040404 / 0x0f000401 */
+	so_method(so, tesla, NV50TCL_FP_REG_ALLOC_TEMP, 1);
 	so_data  (so, p->cfg.high_temp);
 	so_method(so, tesla, NV50TCL_FP_RESULT_COUNT, 1);
 	so_data  (so, p->cfg.high_result);
 	so_method(so, tesla, NV50TCL_FP_CTRL_UNK19A8, 1);
-	so_data  (so, p->cfg.fp.regs[2]);
+	so_data  (so, p->cfg.regs[2]);
 	so_method(so, tesla, NV50TCL_FP_CTRL_UNK196C, 1);
-	so_data  (so, p->cfg.fp.regs[3]);
+	so_data  (so, p->cfg.regs[3]);
 	so_method(so, tesla, NV50TCL_FP_START_ID, 1);
 	so_data  (so, 0); /* program start offset */
 	so_ref(so, &nv50->state.fragprog);
 	so_ref(NULL, &so);
 }
 
+static int
+nv50_sreg4_map(uint32_t *p_map, int mid, uint32_t lin[4],
+	       struct nv50_sreg4 *fpi, struct nv50_sreg4 *vpo)
+{
+	int c;
+	uint8_t mv = vpo->mask, mf = fpi->mask, oid = vpo->hw_id;
+	uint8_t *map = (uint8_t *)p_map;
+
+	for (c = 0; c < 4; ++c) {
+		if (mf & 1) {
+			if (fpi->linear == TRUE)
+				lin[mid / 32] |= 1 << (mid % 32);
+			map[mid++] = (mv & 1) ? oid : ((c == 3) ? 0x41 : 0x40);
+		}
+
+		oid += mv & 1;
+		mf >>= 1;
+		mv >>= 1;
+	}
+
+	return mid;
+}
+
+void
+nv50_linkage_validate(struct nv50_context *nv50)
+{
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_program *vp = nv50->vertprog;
+	struct nv50_program *fp = nv50->fragprog;
+	struct nouveau_stateobj *so;
+	struct nv50_sreg4 dummy, *vpo;
+	int i, n, c, m = 0;
+	uint32_t map[16], lin[4], reg[5];
+
+	memset(map, 0, sizeof(map));
+	memset(lin, 0, sizeof(lin));
+
+	reg[1] = 0x00000004; /* low and high clip distance map ids */
+	reg[2] = 0x00000000; /* layer index map id (disabled, GP only) */
+	reg[3] = 0x00000000; /* point size map id & enable */
+	reg[0] = fp->cfg.regs[0]; /* colour semantic reg */
+	reg[4] = fp->cfg.regs[1]; /* interpolant info */
+
+	dummy.linear = FALSE;
+	dummy.mask = 0xf; /* map all components of HPOS */
+	m = nv50_sreg4_map(map, m, lin, &dummy, &vp->cfg.io[0]);
+
+	dummy.mask = 0x0;
+
+	if (vp->cfg.clpd < 0x40) {
+		for (c = 0; c < vp->cfg.clpd_nr; ++c)
+			map[m++] = vp->cfg.clpd + c;
+		reg[1] = (m << 8);
+	}
+
+	reg[0] += (m - 4) << 8; /* adjust BFC0 id */
+	reg[0] += m - 4; /* adjust FFC0 id */
+	reg[4] |= m << 8; /* set mid where 'normal' FP inputs start */
+
+	i = 0;
+	if (fp->info.input_semantic_name[0] == TGSI_SEMANTIC_POSITION)
+		i = 1;
+	for (; i < fp->cfg.io_nr; i++) {
+		unsigned sn = fp->info.input_semantic_name[i];
+		unsigned si = fp->info.input_semantic_index[i];
+
+		n = fp->cfg.io[i].tgsi_id;
+		if (n >= vp->cfg.io_nr ||
+		    vp->info.output_semantic_name[n] != sn ||
+		    fp->info.output_semantic_index[n] != si)
+			vpo = &dummy;
+		else
+			vpo = &vp->cfg.io[n];
+
+		m = nv50_sreg4_map(map, m, lin, &fp->cfg.io[i], vpo);
+	}
+
+	/* now fill the stateobj */
+	so = so_new(64, 0);
+
+	n = (m + 3) / 4;
+	so_method(so, tesla, NV50TCL_VP_RESULT_MAP_SIZE, 1);
+	so_data  (so, m);
+	so_method(so, tesla, NV50TCL_VP_RESULT_MAP(0), n);
+	so_datap (so, map, n);
+
+	so_method(so, tesla, NV50TCL_MAP_SEMANTIC_0, 4);
+	so_datap (so, reg, 4);
+
+	so_method(so, tesla, NV50TCL_FP_INTERPOLANT_CTRL, 1);
+	so_data  (so, reg[4]);
+
+	so_method(so, tesla, 0x1540, 4);
+	so_datap (so, lin, 4);
+
+        so_ref(so, &nv50->state.programs);
+        so_ref(NULL, &so);
+}
+
 void
 nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 {
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index 096e047..cb10d36 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -15,6 +15,13 @@ struct nv50_program_exec {
 	} param;
 };
 
+struct nv50_sreg4 {
+	uint8_t hw_id;
+	uint8_t tgsi_id;
+	uint8_t mask;
+	boolean linear;
+};
+
 struct nv50_program {
 	struct pipe_shader_state pipe;
 	struct tgsi_shader_info info;
@@ -36,14 +43,19 @@ struct nv50_program {
 	struct {
 		unsigned high_temp;
 		unsigned high_result;
-		struct {
-			unsigned attr[2];
-		} vp;
-		struct {
-			unsigned regs[4];
-			unsigned map[5];
-			unsigned high_map;
-		} fp;
+
+		uint32_t attr[2];
+		uint32_t regs[4];
+
+		/* for VPs, io_nr doesn't count 'private' results (PSIZ etc.) */
+		unsigned io_nr;
+		struct nv50_sreg4 io[PIPE_MAX_SHADER_OUTPUTS];
+
+		/* FP colour inputs, VP/GP back colour outputs */
+		struct nv50_sreg4 two_side[2];
+
+		/* VP only */
+		uint8_t clpd, clpd_nr;
 	} cfg;
 };
 
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index d294356..d307a98 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -189,6 +189,8 @@ nv50_state_emit(struct nv50_context *nv50)
 		so_emit(chan, nv50->state.vertprog);
 	if (nv50->state.dirty & NV50_NEW_FRAGPROG)
 		so_emit(chan, nv50->state.fragprog);
+	if (nv50->state.dirty & (NV50_NEW_FRAGPROG | NV50_NEW_VERTPROG))
+		so_emit(chan, nv50->state.programs);
 	if (nv50->state.dirty & NV50_NEW_RASTERIZER)
 		so_emit(chan, nv50->state.rast);
 	if (nv50->state.dirty & NV50_NEW_BLEND_COLOUR)
@@ -240,6 +242,9 @@ nv50_state_validate(struct nv50_context *nv50)
 	if (nv50->dirty & (NV50_NEW_FRAGPROG | NV50_NEW_FRAGPROG_CB))
 		nv50_fragprog_validate(nv50);
 
+	if (nv50->dirty & (NV50_NEW_FRAGPROG | NV50_NEW_VERTPROG))
+		nv50_linkage_validate(nv50);
+
 	if (nv50->dirty & NV50_NEW_RASTERIZER)
 		so_ref(nv50->rasterizer->so, &nv50->state.rast);
 
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0011-nv50-add-support-for-light-twoside.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0011-nv50-add-support-for-light-twoside.patch"

From 4c749e950ad79a9023a2960f17e18d496a3b079e Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 12 Sep 2009 21:33:56 +0200
Subject: [PATCH 11/13] nv50: add support for light-twoside

---
 src/gallium/drivers/nv50/nv50_program.c |   19 +++++++++++++++++++
 src/gallium/drivers/nv50/nv50_state.c   |    4 +++-
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index feb1504..39c3afc 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2048,6 +2048,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 				si = d->Semantic.SemanticIndex;
 				switch (d->Semantic.SemanticName) {
+				case TGSI_SEMANTIC_BCOLOR:
+					p->cfg.two_side[si].hw_id = first;
+					if (p->cfg.io_nr > first)
+						p->cfg.io_nr = first;
+					break;
 					/*
 				case TGSI_SEMANTIC_CLIP_DISTANCE:
 					p->cfg.clpd = MIN2(p->cfg.clpd, first);
@@ -2125,6 +2130,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 				p->cfg.io[i].mask |= 1 << c;
 			}
 		}
+
+		for (c = 0; c < 2; ++c)
+			if (p->cfg.two_side[c].hw_id < 0x40)
+				p->cfg.two_side[c] = p->cfg.io[
+					p->cfg.two_side[c].hw_id];
 	} else
 	if (p->type == PIPE_SHADER_FRAGMENT) {
 		int rid, aid;
@@ -2726,6 +2736,15 @@ nv50_linkage_validate(struct nv50_context *nv50)
 	}
 
 	reg[0] += (m - 4) << 8; /* adjust BFC0 id */
+
+	/* if VP writes any back-face colour, use separate slots */
+	if (vp->cfg.two_side[0].mask | vp->cfg.two_side[1].mask) {
+		vpo = &vp->cfg.two_side[0];
+
+		m = nv50_sreg4_map(map, m, lin, &fp->cfg.two_side[0], &vpo[0]);
+		m = nv50_sreg4_map(map, m, lin, &fp->cfg.two_side[1], &vpo[1]);
+	}
+
 	reg[0] += m - 4; /* adjust FFC0 id */
 	reg[4] |= m << 8; /* set mid where 'normal' FP inputs start */
 
diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 4283808..20d9f43 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -264,7 +264,6 @@ nv50_rasterizer_state_create(struct pipe_context *pipe,
 		CALLOC_STRUCT(nv50_rasterizer_stateobj);
 
 	/*XXX: ignored
-	 * 	- light_twosize
 	 * 	- point_smooth
 	 * 	- multisample
 	 * 	- point_sprite / sprite_coord_mode
@@ -276,6 +275,9 @@ nv50_rasterizer_state_create(struct pipe_context *pipe,
 	so_method(so, tesla, 0x1684, 1);
 	so_data  (so, cso->flatshade_first ? 0 : 1);
 
+	so_method(so, tesla, NV50TCL_VERTEX_TWO_SIDE_ENABLE, 1);
+	so_data  (so, cso->light_twoside);
+
 	so_method(so, tesla, NV50TCL_LINE_WIDTH, 1);
 	so_data  (so, fui(cso->line_width));
 	so_method(so, tesla, NV50TCL_LINE_SMOOTH_ENABLE, 1);
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0012-nv50-add-support-for-point-size-per-vertex.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0012-nv50-add-support-for-point-size-per-vertex.patch"

From 2c6a8d97a2b8ac42d1ab4945e36944bfee25037f Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 12 Sep 2009 21:36:07 +0200
Subject: [PATCH 12/13] nv50: add support for point size per vertex

---
 src/gallium/drivers/nv50/nv50_program.c |   14 ++++++++++++++
 src/gallium/drivers/nv50/nv50_program.h |    1 +
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 39c3afc..cf57d5c 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2053,6 +2053,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 					if (p->cfg.io_nr > first)
 						p->cfg.io_nr = first;
 					break;
+				case TGSI_SEMANTIC_PSIZE:
+					p->cfg.psiz = first;
+					if (p->cfg.io_nr > first)
+						p->cfg.io_nr = first;
+					break;
 					/*
 				case TGSI_SEMANTIC_CLIP_DISTANCE:
 					p->cfg.clpd = MIN2(p->cfg.clpd, first);
@@ -2135,6 +2140,9 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			if (p->cfg.two_side[c].hw_id < 0x40)
 				p->cfg.two_side[c] = p->cfg.io[
 					p->cfg.two_side[c].hw_id];
+
+		if (p->cfg.psiz < 0x40)
+			p->cfg.psiz = p->cfg.io[p->cfg.psiz].hw_id;
 	} else
 	if (p->type == PIPE_SHADER_FRAGMENT) {
 		int rid, aid;
@@ -2274,6 +2282,7 @@ ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
 
 	switch (p->type) {
 	case PIPE_SHADER_VERTEX:
+		p->cfg.psiz = 0x40;
 		p->cfg.clpd = 0x40;
 		p->cfg.io_nr = pc->result_nr;
 		break;
@@ -2766,6 +2775,11 @@ nv50_linkage_validate(struct nv50_context *nv50)
 		m = nv50_sreg4_map(map, m, lin, &fp->cfg.io[i], vpo);
 	}
 
+	if (vp->cfg.psiz < 0x40) {
+		map[m / 4] |= vp->cfg.psiz << ((m % 4) * 8);
+		reg[3] = (m++ << 4) | 1;
+	}
+
 	/* now fill the stateobj */
 	so = so_new(64, 0);
 
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index cb10d36..93607e3 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -56,6 +56,7 @@ struct nv50_program {
 
 		/* VP only */
 		uint8_t clpd, clpd_nr;
+		uint8_t psiz;
 	} cfg;
 };
 
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain;
 name="0013-nv50-add-support-for-point-sprites.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0013-nv50-add-support-for-point-sprites.patch"

From e6fe11b4aff92e2eab48b5420f67935627e48249 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 12 Sep 2009 21:12:37 +0200
Subject: [PATCH 13/13] nv50: add support for point sprites

---
 src/gallium/drivers/nv50/nv50_program.c |   54 ++++++++++++++++++++++++++++++-
 src/gallium/drivers/nv50/nv50_screen.c  |    2 +-
 src/gallium/drivers/nv50/nv50_state.c   |    3 ++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index cf57d5c..883c28b 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2689,6 +2689,51 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	so_ref(NULL, &so);
 }
 
+static void
+nv50_pntc_replace(struct nv50_context *nv50, uint32_t pntc[8], unsigned base)
+{
+	struct nv50_program *fp = nv50->fragprog;
+	struct nv50_program *vp = nv50->vertprog;
+	unsigned i, c, m = base;
+
+	/* XXX: This can't work correctly in all cases yet, we either
+	 * have to create TGSI_SEMANTIC_PNTC or sprite_coord_mode has
+	 * to be per FP input instead of per VP output
+	 */
+	memset(pntc, 0, 8 * sizeof(uint32_t));
+
+	for (i = 0; i < fp->cfg.io_nr; i++) {
+		uint8_t sn, si, j = fp->cfg.io[i].tgsi_id;
+		unsigned n = popcnt4(fp->cfg.io[i].mask);
+
+		if (fp->info.input_semantic_name[i] != TGSI_SEMANTIC_GENERIC) {
+			m += n;
+			continue;
+		}
+
+		sn = vp->info.input_semantic_name[j];
+		si = vp->info.input_semantic_index[j];
+
+		if (j < fp->cfg.io_nr && sn == TGSI_SEMANTIC_GENERIC) {
+			ubyte mode =
+				nv50->rasterizer->pipe.sprite_coord_mode[si];
+
+			if (mode == PIPE_SPRITE_COORD_NONE) {
+				m += n;
+				continue;
+			}
+		}
+
+		/* this is either PointCoord or replaced by sprite coords */
+		for (c = 0; c < 4; c++) {
+			if (!(fp->cfg.io[i].mask & (1 << c)))
+				continue;
+			pntc[m / 8] |= (c + 1) << ((m % 8) * 4);
+			++m;
+		}
+	}
+}
+
 static int
 nv50_sreg4_map(uint32_t *p_map, int mid, uint32_t lin[4],
 	       struct nv50_sreg4 *fpi, struct nv50_sreg4 *vpo)
@@ -2721,7 +2766,7 @@ nv50_linkage_validate(struct nv50_context *nv50)
 	struct nouveau_stateobj *so;
 	struct nv50_sreg4 dummy, *vpo;
 	int i, n, c, m = 0;
-	uint32_t map[16], lin[4], reg[5];
+	uint32_t map[16], lin[4], reg[5], pcrd[8];
 
 	memset(map, 0, sizeof(map));
 	memset(lin, 0, sizeof(lin));
@@ -2798,6 +2843,13 @@ nv50_linkage_validate(struct nv50_context *nv50)
 	so_method(so, tesla, 0x1540, 4);
 	so_datap (so, lin, 4);
 
+	if (nv50->rasterizer->pipe.point_sprite) {
+		nv50_pntc_replace(nv50, pcrd, (reg[4] >> 8) & 0xff);
+
+		so_method(so, tesla, NV50TCL_POINT_COORD_REPLACE_MAP(0), 8);
+		so_datap (so, pcrd, 8);
+	}
+
         so_ref(so, &nv50->state.programs);
         so_ref(NULL, &so);
 }
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index c7f80a2..7adaaaa 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -92,7 +92,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, int param)
 	case PIPE_CAP_ANISOTROPIC_FILTER:
 		return 1;
 	case PIPE_CAP_POINT_SPRITE:
-		return 0;
+		return 1;
 	case PIPE_CAP_MAX_RENDER_TARGETS:
 		return 8;
 	case PIPE_CAP_OCCLUSION_QUERY:
diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 20d9f43..6612e72 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -296,6 +296,9 @@ nv50_rasterizer_state_create(struct pipe_context *pipe,
 	so_method(so, tesla, NV50TCL_POINT_SIZE, 1);
 	so_data  (so, fui(cso->point_size));
 
+	so_method(so, tesla, NV50TCL_POINT_SPRITE_ENABLE, 1);
+	so_data  (so, cso->point_sprite);
+
 	so_method(so, tesla, NV50TCL_POLYGON_MODE_FRONT, 3);
 	if (cso->front_winding == PIPE_WINDING_CCW) {
 		so_data(so, nvgl_polygon_mode(cso->fill_ccw));
-- 
1.6.3.3


--------------010208090904000401070505
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010208090904000401070505--
