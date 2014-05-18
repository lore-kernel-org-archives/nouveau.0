From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] nv50/ir: fix constant folding for OP_MUL
	subop HIGH
Date: Sun, 18 May 2014 17:48:56 -0400
Message-ID: <1400449736-13177-2-git-send-email-imirkin@alum.mit.edu>
References: <1400449736-13177-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400449736-13177-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "10.1 10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

These instructions can come in either through IMUL_HI/UMUL_HI TGSI
opcodes, or from OP_DIV constant folding.

Also make sure that the constant foldings which delete the original
instruction still get counted as having done something.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.1 10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 .../drivers/nouveau/codegen/nv50_ir_peephole.cpp   | 47 ++++++++++++++++++++--
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index 3005922..e6f8f69 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -425,7 +425,17 @@ ConstantFolding::expr(Instruction *i,
       case TYPE_F32: res.data.f32 = a->data.f32 * b->data.f32; break;
       case TYPE_F64: res.data.f64 = a->data.f64 * b->data.f64; break;
       case TYPE_S32:
-      case TYPE_U32: res.data.u32 = a->data.u32 * b->data.u32; break;
+         if (i->subOp == NV50_IR_SUBOP_MUL_HIGH) {
+            res.data.s32 = ((int64_t)a->data.s32 * b->data.s32) >> 32;
+            break;
+         }
+         /* fallthrough */
+      case TYPE_U32:
+         if (i->subOp == NV50_IR_SUBOP_MUL_HIGH) {
+            res.data.u32 = ((uint64_t)a->data.u32 * b->data.u32) >> 32;
+            break;
+         }
+         res.data.u32 = a->data.u32 * b->data.u32; break;
       default:
          return;
       }
@@ -691,12 +701,41 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
 {
    const int t = !s;
    const operation op = i->op;
+   Instruction *newi = i;
 
    switch (i->op) {
    case OP_MUL:
       if (i->dType == TYPE_F32)
          tryCollapseChainedMULs(i, s, imm0);
 
+      if (i->subOp == NV50_IR_SUBOP_MUL_HIGH) {
+         assert(!isFloatType(i->sType));
+         if (imm0.isInteger(1) && i->dType == TYPE_S32) {
+            bld.setPosition(i, false);
+            // Need to set to the sign value, which is a compare.
+            newi = bld.mkCmp(OP_SET, CC_LT, TYPE_S32, i->getDef(0),
+                             TYPE_S32, i->getSrc(t), bld.mkImm(0));
+            delete_Instruction(prog, i);
+         } else if (imm0.isInteger(0) || imm0.isInteger(1)) {
+            // The high bits can't be set in this case (either mul by 0 or
+            // unsigned by 1)
+            i->op = OP_MOV;
+            i->subOp = 0;
+            i->setSrc(0, new_ImmediateValue(prog, 0u));
+            i->src(0).mod = Modifier(0);
+            i->setSrc(1, NULL);
+         } else if (!imm0.isNegative() && imm0.isPow2()) {
+            // Translate into a shift
+            imm0.applyLog2();
+            i->op = OP_SHR;
+            i->subOp = 0;
+            imm0.reg.data.u32 = 32 - imm0.reg.data.u32;
+            i->setSrc(0, i->getSrc(t));
+            i->src(0).mod = i->src(t).mod;
+            i->setSrc(1, new_ImmediateValue(prog, imm0.reg.data.u32));
+            i->src(1).mod = 0;
+         }
+      } else
       if (imm0.isInteger(0)) {
          i->op = OP_MOV;
          i->setSrc(0, new_ImmediateValue(prog, 0u));
@@ -787,7 +826,7 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
          else
             tA = tB;
          tB = s ? bld.getSSA() : i->getDef(0);
-         bld.mkOp2(OP_ADD, TYPE_U32, tB, mul->getDef(0), tA);
+         newi = bld.mkOp2(OP_ADD, TYPE_U32, tB, mul->getDef(0), tA);
          if (s)
             bld.mkOp2(OP_SHR, TYPE_U32, i->getDef(0), tB, bld.mkImm(s));
 
@@ -819,7 +858,7 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
          tA = bld.getSSA();
          bld.mkCmp(OP_SET, CC_LT, TYPE_S32, tA, TYPE_S32, i->getSrc(0), bld.mkImm(0));
          tD = (d < 0) ? bld.getSSA() : i->getDef(0)->asLValue();
-         bld.mkOp2(OP_SUB, TYPE_U32, tD, tB, tA);
+         newi = bld.mkOp2(OP_SUB, TYPE_U32, tD, tB, tA);
          if (d < 0)
             bld.mkOp1(OP_NEG, TYPE_S32, i->getDef(0), tB);
 
@@ -897,7 +936,7 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
    default:
       return;
    }
-   if (i->op != op)
+   if (newi->op != op)
       foldCount++;
 }
 
-- 
1.8.5.5
