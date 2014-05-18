From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/2] nv50/ir: fix s32 x s32 -> high s32 multiply
	logic
Date: Sun, 18 May 2014 17:48:55 -0400
Message-ID: <1400449736-13177-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org, "10.1 10.2" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Retrieving the high 32 bits of a signed multiply is rather annoying. It
appears that the simplest way to do this is to compute the absolute
value of the arguments, and perform a u32 x u32 -> u64 operation. If the
arguments' signs differ, then negate the result. Since there is no u64
support in the cvt instruction, we have the perform the 2's complement
negation "by hand".

This logic can come into use by the IMUL_HI instruction (very unlikely
to be seen), as well as from constant folding of division by a constant.
Fixes dolphin's divisions by 255.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.1 10.2" <mesa-stable@lists.freedesktop.org>
---

This took WAY longer than it should have. My initial approach was to stick the
code conditional on the sign in a BB. Long story short, splitting off BBs once
SSA has been run is ~impossible without adding a bunch of APIs to help with
it. The Graph/Node/Edge API would probably also have to be reworked... it's a
bunch of hand-rolled things that C++ STL handles quite gracefully. The problem
I eventually ran into that I couldn't (aka wasn't willing to) solve is that
the order of PHI node sources has to line up with the order of inbound edges
into the BB. When you split a BB, it deletes/readds edges, which means that
their orders get all jumbled up.

This does appear to work. It handles both the imulExtended piglit as well as
dolphin's shaders that have the constant division. And there are no piglit
regressions.

Unfortunately the generated code isn't the cleanest, but... the payoff is
starting to dwindle greatly. If it becomes a problem, someone can take another
look at it.

 .../nouveau/codegen/nv50_ir_lowering_nv50.cpp      | 91 +++++++++++++++++++---
 .../nouveau/codegen/nv50_ir_target_nv50.cpp        |  2 +
 2 files changed, 82 insertions(+), 11 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index b17d57d..0fb7666 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -37,18 +37,25 @@ namespace nv50_ir {
 //    ah*bl 00
 //
 // fffe0001 + fffe0001
+//
+// Note that this sort of splitting doesn't work for signed values, so we
+// compute the sign on those manually and then perform an unsigned multiply.
 static bool
 expandIntegerMUL(BuildUtil *bld, Instruction *mul)
 {
    const bool highResult = mul->subOp == NV50_IR_SUBOP_MUL_HIGH;
 
-   DataType fTy = mul->sType; // full type
-   DataType hTy;
+   DataType fTy; // full type
+   switch (mul->sType) {
+   case TYPE_S32: fTy = TYPE_U32; break;
+   case TYPE_S64: fTy = TYPE_U64; break;
+   default: fTy = mul->sType; break;
+   }
+
+   DataType hTy; // half type
    switch (fTy) {
-   case TYPE_S32: hTy = TYPE_S16; break;
    case TYPE_U32: hTy = TYPE_U16; break;
    case TYPE_U64: hTy = TYPE_U32; break;
-   case TYPE_S64: hTy = TYPE_S32; break;
    default:
       return false;
    }
@@ -59,15 +66,25 @@ expandIntegerMUL(BuildUtil *bld, Instruction *mul)
 
    bld->setPosition(mul, true);
 
+   Value *s[2];
    Value *a[2], *b[2];
-   Value *c[2];
    Value *t[4];
    for (int j = 0; j < 4; ++j)
       t[j] = bld->getSSA(fullSize);
 
+   s[0] = mul->getSrc(0);
+   s[1] = mul->getSrc(1);
+
+   if (isSignedType(mul->sType)) {
+      s[0] = bld->getSSA(fullSize);
+      s[1] = bld->getSSA(fullSize);
+      bld->mkOp1(OP_ABS, mul->sType, s[0], mul->getSrc(0));
+      bld->mkOp1(OP_ABS, mul->sType, s[1], mul->getSrc(1));
+   }
+
    // split sources into halves
-   i[0] = bld->mkSplit(a, halfSize, mul->getSrc(0));
-   i[1] = bld->mkSplit(b, halfSize, mul->getSrc(1));
+   i[0] = bld->mkSplit(a, halfSize, s[0]);
+   i[1] = bld->mkSplit(b, halfSize, s[1]);
 
    i[2] = bld->mkOp2(OP_MUL, fTy, t[0], a[0], b[1]);
    i[3] = bld->mkOp3(OP_MAD, fTy, t[1], a[1], b[0], t[0]);
@@ -75,24 +92,76 @@ expandIntegerMUL(BuildUtil *bld, Instruction *mul)
    i[4] = bld->mkOp3(OP_MAD, fTy, t[3], a[0], b[0], t[2]);
 
    if (highResult) {
-      Value *r[4];
+      Value *c[2];
+      Value *r[5];
       Value *imm = bld->loadImm(NULL, 1 << (halfSize * 8));
       c[0] = bld->getSSA(1, FILE_FLAGS);
       c[1] = bld->getSSA(1, FILE_FLAGS);
-      for (int j = 0; j < 4; ++j)
+      for (int j = 0; j < 5; ++j)
          r[j] = bld->getSSA(fullSize);
 
       i[8] = bld->mkOp2(OP_SHR, fTy, r[0], t[1], bld->mkImm(halfSize * 8));
       i[6] = bld->mkOp2(OP_ADD, fTy, r[1], r[0], imm);
       bld->mkMov(r[3], r[0])->setPredicate(CC_NC, c[0]);
       bld->mkOp2(OP_UNION, TYPE_U32, r[2], r[1], r[3]);
-      i[5] = bld->mkOp3(OP_MAD, fTy, mul->getDef(0), a[1], b[1], r[2]);
+      i[5] = bld->mkOp3(OP_MAD, fTy, r[4], a[1], b[1], r[2]);
 
       // set carry defs / sources
       i[3]->setFlagsDef(1, c[0]);
-      i[4]->setFlagsDef(0, c[1]); // actual result not required, just the carry
+      // actual result required in negative case, but ignored for
+      // unsigned. for some reason the compiler ends up dropping the whole
+      // instruction if the destination is unused but the flags are.
+      if (isSignedType(mul->sType))
+         i[4]->setFlagsDef(1, c[1]);
+      else
+         i[4]->setFlagsDef(0, c[1]);
       i[6]->setPredicate(CC_C, c[0]);
       i[5]->setFlagsSrc(3, c[1]);
+
+      if (isSignedType(mul->sType)) {
+         Value *cc[2];
+         Value *rr[7];
+         Value *one = bld->getSSA(fullSize);
+         bld->loadImm(one, 1);
+         for (int j = 0; j < 7; j++)
+            rr[j] = bld->getSSA(fullSize);
+
+         // NOTE: this logic uses predicates because splitting basic blocks is
+         // ~impossible during the SSA phase. The RA relies on a correlation
+         // between edge order and phi node sources.
+
+         // Set the sign of the result based on the inputs
+         bld->mkOp2(OP_XOR, fTy, NULL, mul->getSrc(0), mul->getSrc(1))
+            ->setFlagsDef(0, (cc[0] = bld->getSSA(1, FILE_FLAGS)));
+
+         // 1s complement of 64-bit value
+         bld->mkOp1(OP_NOT, fTy, rr[0], r[4])
+            ->setPredicate(CC_S, cc[0]);
+         bld->mkOp1(OP_NOT, fTy, rr[1], t[3])
+            ->setPredicate(CC_S, cc[0]);
+
+         // add to low 32-bits, keep track of the carry
+         Instruction *n = bld->mkOp2(OP_ADD, fTy, NULL, rr[1], one);
+         n->setPredicate(CC_S, cc[0]);
+         n->setFlagsDef(0, (cc[1] = bld->getSSA(1, FILE_FLAGS)));
+
+         // If there was a carry, add 1 to the upper 32 bits
+         // XXX: These get executed even if they shouldn't be
+         bld->mkOp2(OP_ADD, fTy, rr[2], rr[0], one)
+            ->setPredicate(CC_C, cc[1]);
+         bld->mkMov(rr[3], rr[0])
+            ->setPredicate(CC_NC, cc[1]);
+         bld->mkOp2(OP_UNION, fTy, rr[4], rr[2], rr[3]);
+
+         // Merge the results from the negative and non-negative paths
+         bld->mkMov(rr[5], rr[4])
+            ->setPredicate(CC_S, cc[0]);
+         bld->mkMov(rr[6], r[4])
+            ->setPredicate(CC_NS, cc[0]);
+         bld->mkOp2(OP_UNION, mul->sType, mul->getDef(0), rr[5], rr[6]);
+      } else {
+         bld->mkMov(mul->getDef(0), r[4]);
+      }
    } else {
       bld->mkMov(mul->getDef(0), t[3]);
    }
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
index 799ac2f..abadc7f 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -332,6 +332,8 @@ TargetNV50::insnCanLoad(const Instruction *i, int s,
          return false;
       if (sf == FILE_IMMEDIATE)
          return false;
+      if (i->subOp == NV50_IR_SUBOP_MUL_HIGH && sf == FILE_MEMORY_CONST)
+         return false;
       ldSize = 2;
    } else {
       ldSize = typeSizeof(ld->dType);
-- 
1.8.5.5
