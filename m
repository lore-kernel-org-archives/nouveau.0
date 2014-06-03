From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v3 3/4] nvc0/ir: Handle OP_BFIND when folding
	constant expressions
Date: Wed,  4 Jun 2014 00:35:49 +0200
Message-ID: <1401834950-20257-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
V3: Use BuildUtil for the Immediate instead of a type conversion

 .../drivers/nouveau/codegen/nv50_ir_peephole.cpp        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index 538e745..e4d91d7 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -944,6 +944,23 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
    case OP_EX2:
       unary(i, imm0);
       break;
+   case OP_BFIND: {
+      int32_t res;
+      switch (i->dType) {
+      case TYPE_S32: res = util_last_bit_signed(imm0.reg.data.s32) - 1; break;
+      case TYPE_U32: res = util_last_bit(imm0.reg.data.u32) - 1; break;
+      default:
+         return;
+      }
+      if (i->subOp ==  NV50_IR_SUBOP_BFIND_SAMT && res >= 0)
+         res = 31 - res;
+      bld.setPosition(i, false); /* make sure bld is init'ed */
+      i->setSrc(0, bld.mkImm(res));
+      i->setSrc(1, NULL);
+      i->op = OP_MOV;
+      i->subOp = 0;
+      break;
+   }
    default:
       return;
    }
-- 
1.8.4.5
