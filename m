From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 02/19] nv50/ir: delay calculation of indirect
	addresses
Date: Mon, 13 Jan 2014 14:19:18 -0500
Message-ID: <1389640775-25046-3-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Instead of emitting an SHL 4 io an address register on the TGSI ARL and UARL
instructions, emit the shift when the loaded address is actually used.  This
is necessary because input vertex and attribute indices in geometry shaders on
nv50 need to be shifted left by 2 instead of 4.

Signed-off-by: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
[calim: various updates to the indirect address logic]
Signed-off-by: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
[imirkin: remove OP_MAD change that calim made, add OP_RESTART handling
          same as OP_EMIT for code flow analysis]
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  |  38 ++++++--
 .../nouveau/codegen/nv50_ir_lowering_nv50.cpp      | 104 ++++++++++++++++++++-
 .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      |   7 ++
 3 files changed, 136 insertions(+), 13 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 49a45f8..3c790cf 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -1126,6 +1126,7 @@ private:
       ValueMap values;
    };
 
+   Value *shiftAddress(Value *);
    Value *getVertexBase(int s);
    DataArray *getArrayForFile(unsigned file, int idx);
    Value *fetchSrc(int s, int c);
@@ -1344,7 +1345,8 @@ Converter::getVertexBase(int s)
       if (tgsi.getSrc(s).isIndirect(1))
          rel = fetchSrc(tgsi.getSrc(s).getIndirect(1), 0, NULL);
       vtxBaseValid |= 1 << s;
-      vtxBase[s] = mkOp2v(OP_PFETCH, TYPE_U32, getSSA(), mkImm(index), rel);
+      vtxBase[s] = mkOp2v(OP_PFETCH, TYPE_U32, getSSA(4, FILE_ADDRESS),
+                          mkImm(index), rel);
    }
    return vtxBase[s];
 }
@@ -1403,6 +1405,14 @@ Converter::getArrayForFile(unsigned file, int idx)
 }
 
 Value *
+Converter::shiftAddress(Value *index)
+{
+   if (!index)
+      return NULL;
+   return mkOp2v(OP_SHL, TYPE_U32, getSSA(4, FILE_ADDRESS), index, mkImm(4));
+}
+
+Value *
 Converter::fetchSrc(tgsi::Instruction::SrcRegister src, int c, Value *ptr)
 {
    const int idx2d = src.is2D() ? src.getIndex(1) : 0;
@@ -1414,7 +1424,7 @@ Converter::fetchSrc(tgsi::Instruction::SrcRegister src, int c, Value *ptr)
       assert(!ptr);
       return loadImm(NULL, info->immd.data[idx * 4 + swz]);
    case TGSI_FILE_CONSTANT:
-      return mkLoadv(TYPE_U32, srcToSym(src, c), ptr);
+      return mkLoadv(TYPE_U32, srcToSym(src, c), shiftAddress(ptr));
    case TGSI_FILE_INPUT:
       if (prog->getType() == Program::TYPE_FRAGMENT) {
          // don't load masked inputs, won't be assigned a slot
@@ -1422,9 +1432,17 @@ Converter::fetchSrc(tgsi::Instruction::SrcRegister src, int c, Value *ptr)
             return loadImm(NULL, swz == TGSI_SWIZZLE_W ? 1.0f : 0.0f);
 	 if (!ptr && info->in[idx].sn == TGSI_SEMANTIC_FACE)
             return mkOp1v(OP_RDSV, TYPE_F32, getSSA(), mkSysVal(SV_FACE, 0));
-         return interpolate(src, c, ptr);
+         return interpolate(src, c, shiftAddress(ptr));
+      } else
+      if (ptr && prog->getType() == Program::TYPE_GEOMETRY) {
+         // XXX: This is going to be a problem with scalar arrays, i.e. when
+         // we cannot assume that the address is given in units of vec4.
+         //
+         // nv50 and nvc0 need different things here, so let the lowering
+         // passes decide what to do with the address
+         return mkLoadv(TYPE_U32, srcToSym(src, c), ptr);
       }
-      return mkLoadv(TYPE_U32, srcToSym(src, c), ptr);
+      return mkLoadv(TYPE_U32, srcToSym(src, c), shiftAddress(ptr));
    case TGSI_FILE_OUTPUT:
       assert(!"load from output file");
       return NULL;
@@ -1433,7 +1451,7 @@ Converter::fetchSrc(tgsi::Instruction::SrcRegister src, int c, Value *ptr)
       return mkOp1v(OP_RDSV, TYPE_U32, getSSA(), srcToSym(src, c));
    default:
       return getArrayForFile(src.getFile(), idx2d)->load(
-         sub.cur->values, idx, swz, ptr);
+         sub.cur->values, idx, swz, shiftAddress(ptr));
    }
 }
 
@@ -1476,8 +1494,9 @@ Converter::storeDst(int d, int c, Value *val)
       break;
    }
 
-   Value *ptr = dst.isIndirect(0) ?
-      fetchSrc(dst.getIndirect(0), 0, NULL) : NULL;
+   Value *ptr = NULL;
+   if (dst.isIndirect(0))
+      ptr = shiftAddress(fetchSrc(dst.getIndirect(0), 0, NULL));
 
    if (info->io.genUserClip > 0 &&
        dst.getFile() == TGSI_FILE_OUTPUT &&
@@ -2179,12 +2198,11 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
       FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi) {
          src0 = fetchSrc(0, c);
          mkCvt(OP_CVT, TYPE_S32, dst0[c], TYPE_F32, src0)->rnd = ROUND_M;
-         mkOp2(OP_SHL, TYPE_U32, dst0[c], dst0[c], mkImm(4));
       }
       break;
    case TGSI_OPCODE_UARL:
       FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
-         mkOp2(OP_SHL, TYPE_U32, dst0[c], fetchSrc(0, c), mkImm(4));
+         mkOp1(OP_MOV, TYPE_U32, dst0[c], fetchSrc(0, c));
       break;
    case TGSI_OPCODE_EX2:
    case TGSI_OPCODE_LG2:
@@ -2721,7 +2739,7 @@ Converter::Converter(Program *ir, const tgsi::Source *code) : BuildUtil(ir),
 
    tData.setup(TGSI_FILE_TEMPORARY, 0, 0, tSize, 4, 4, tFile, 0);
    pData.setup(TGSI_FILE_PREDICATE, 0, 0, pSize, 4, 4, FILE_PREDICATE, 0);
-   aData.setup(TGSI_FILE_ADDRESS, 0, 0, aSize, 4, 4, FILE_ADDRESS, 0);
+   aData.setup(TGSI_FILE_ADDRESS, 0, 0, aSize, 4, 4, FILE_GPR, 0);
    oData.setup(TGSI_FILE_OUTPUT, 0, 0, oSize, 4, 4, FILE_GPR, 0);
 
    zero = mkImm((uint32_t)0);
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index 07f3a21..1d13aea 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -278,10 +278,24 @@ NV50LegalizeSSA::propagateWriteToOutput(Instruction *st)
    // TODO: move exports (if beneficial) in common opt pass
    if (di->isPseudo() || isTextureOp(di->op) || di->defCount(0xff, true) > 1)
       return;
+
    for (int s = 0; di->srcExists(s); ++s)
       if (di->src(s).getFile() == FILE_IMMEDIATE)
          return;
 
+   if (prog->getType() == Program::TYPE_GEOMETRY) {
+      // Only propagate output writes in geometry shaders when we can be sure
+      // that we are propagating to the same output vertex.
+      if (di->bb != st->bb)
+         return;
+      Instruction *i;
+      for (i = di; i != st; i = i->next) {
+         if (i->op == OP_EMIT || i->op == OP_RESTART)
+            return;
+      }
+      assert(i); // st after di
+   }
+
    // We cannot set defs to non-lvalues before register allocation, so
    // save & remove (to save registers) the exports and replace later.
    outWrites->push_back(st);
@@ -307,6 +321,9 @@ NV50LegalizeSSA::handleAddrDef(Instruction *i)
 
    i->getDef(0)->reg.size = 2; // $aX are only 16 bit
 
+   // PFETCH can always write to $a
+   if (i->op == OP_PFETCH)
+      return;
    // only ADDR <- SHL(GPR, IMM) and ADDR <- ADD(ADDR, IMM) are valid
    if (i->srcExists(1) && i->src(1).getFile() == FILE_IMMEDIATE) {
       if (i->op == OP_SHL && i->src(0).getFile() == FILE_GPR)
@@ -473,6 +490,9 @@ NV50LegalizeSSA::visit(BasicBlock *bb)
    for (insn = bb->getEntry(); insn; insn = next) {
       next = insn->next;
 
+      if (insn->defExists(0) && insn->getDef(0)->reg.file == FILE_ADDRESS)
+         handleAddrDef(insn);
+
       switch (insn->op) {
       case OP_EXPORT:
          if (outWrites)
@@ -491,9 +511,6 @@ NV50LegalizeSSA::visit(BasicBlock *bb)
       default:
          break;
       }
-
-      if (insn->defExists(0) && insn->getDef(0)->reg.file == FILE_ADDRESS)
-         handleAddrDef(insn);
    }
    return true;
 }
@@ -510,7 +527,9 @@ private:
    bool handleRDSV(Instruction *);
    bool handleWRSV(Instruction *);
 
+   bool handlePFETCH(Instruction *);
    bool handleEXPORT(Instruction *);
+   bool handleLOAD(Instruction *);
 
    bool handleDIV(Instruction *);
    bool handleSQRT(Instruction *);
@@ -1002,6 +1021,81 @@ NV50LoweringPreSSA::handleEXPORT(Instruction *i)
    return true;
 }
 
+// Handle indirect addressing in geometry shaders:
+//
+// ld $r0 a[$a1][$a2+k] ->
+// ld $r0 a[($a1 + $a2 * $vstride) + k], where k *= $vstride is implicit
+//
+bool
+NV50LoweringPreSSA::handleLOAD(Instruction *i)
+{
+   ValueRef src = i->src(0);
+
+   if (src.isIndirect(1)) {
+      assert(prog->getType() == Program::TYPE_GEOMETRY);
+      Value *addr = i->getIndirect(0, 1);
+
+      if (src.isIndirect(0)) {
+         // base address is in an address register, so move to a GPR
+         Value *base = bld.getScratch();
+         bld.mkMov(base, addr);
+
+         Symbol *sv = bld.mkSysVal(SV_VERTEX_STRIDE, 0);
+         Value *vstride = bld.mkOp1v(OP_RDSV, TYPE_U32, bld.getSSA(), sv);
+         Value *attrib = bld.mkOp2v(OP_SHL, TYPE_U32, bld.getSSA(),
+                                    i->getIndirect(0, 0), bld.mkImm(2));
+
+         // Calculate final address: addr = base + attr*vstride; use 16-bit
+         // multiplication since 32-bit would be lowered to multiple
+         // instructions, and we only need the low 16 bits of the result
+         Value *a[2], *b[2];
+         bld.mkSplit(a, 2, attrib);
+         bld.mkSplit(b, 2, vstride);
+         Value *sum = bld.mkOp3v(OP_MAD, TYPE_U16, bld.getSSA(), a[0], b[0],
+                                 base);
+
+         // move address from GPR into an address register
+         addr = bld.getSSA(2, FILE_ADDRESS);
+         bld.mkMov(addr, sum);
+      }
+
+      i->setIndirect(0, 1, NULL);
+      i->setIndirect(0, 0, addr);
+   }
+
+   return true;
+}
+
+bool
+NV50LoweringPreSSA::handlePFETCH(Instruction *i)
+{
+   assert(prog->getType() == Program::TYPE_GEOMETRY);
+
+   // NOTE: cannot use getImmediate here, not in SSA form yet, move to
+   // later phase if that assertion ever triggers:
+
+   ImmediateValue *imm = i->getSrc(0)->asImm();
+   assert(imm);
+
+   assert(imm->reg.data.u32 <= 127); // TODO: use address reg if that happens
+
+   if (i->srcExists(1)) {
+      // indirect addressing of vertex in primitive space
+
+      LValue *val = bld.getScratch();
+      Value *ptr = bld.getSSA(2, FILE_ADDRESS);
+      bld.mkOp2v(OP_SHL, TYPE_U32, ptr, i->getSrc(1), bld.mkImm(2));
+      bld.mkOp2v(OP_PFETCH, TYPE_U32, val, imm, ptr);
+
+      // NOTE: PFETCH directly to an $aX only works with direct addressing
+      i->op = OP_SHL;
+      i->setSrc(0, val);
+      i->setSrc(1, bld.mkImm(0));
+   }
+
+   return true;
+}
+
 // Set flags according to predicate and make the instruction read $cX.
 void
 NV50LoweringPreSSA::checkPredicate(Instruction *insn)
@@ -1060,6 +1154,8 @@ NV50LoweringPreSSA::visit(Instruction *i)
       return handleSQRT(i);
    case OP_EXPORT:
       return handleEXPORT(i);
+   case OP_LOAD:
+      return handleLOAD(i);
    case OP_RDSV:
       return handleRDSV(i);
    case OP_WRSV:
@@ -1070,6 +1166,8 @@ NV50LoweringPreSSA::visit(Instruction *i)
       return handlePRECONT(i);
    case OP_CONT:
       return handleCONT(i);
+   case OP_PFETCH:
+      return handlePFETCH(i);
    default:
       break;
    }
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index a838004..3840f75 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -1548,6 +1548,13 @@ NVC0LoweringPass::visit(Instruction *i)
          if (prog->getType() == Program::TYPE_COMPUTE) {
             i->getSrc(0)->reg.file = FILE_MEMORY_CONST;
             i->getSrc(0)->reg.fileIndex = 0;
+         } else
+         if (prog->getType() == Program::TYPE_GEOMETRY &&
+             i->src(0).isIndirect(0)) {
+            // XXX: this assumes vec4 units
+            Value *ptr = bld.mkOp2v(OP_SHL, TYPE_U32, bld.getSSA(),
+                                    i->getIndirect(0, 0), bld.mkImm(4));
+            i->setIndirect(0, 0, ptr);
          } else {
             i->op = OP_VFETCH;
             assert(prog->getType() != Program::TYPE_FRAGMENT); // INTERP
-- 
1.8.3.2
