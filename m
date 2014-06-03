From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 4/4] nvc0/ir: Handle OP_POPCNT when folding
	constant expressions
Date: Tue,  3 Jun 2014 22:58:04 +0200
Message-ID: <1401829084-4499-5-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
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

V2: Add support for a single-argument version of POPCNT for Maxwell (SM5)

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index c497335..19767b4 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -548,6 +548,10 @@ ConstantFolding::expr(Instruction *i,
       }
       break;
    }
+   case OP_POPCNT: {
+         res.data.u32 = util_bitcount(a->data.u32 & b->data.u32); break;
+      break;
+   }
    default:
       return;
    }
@@ -966,6 +970,17 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
       i->subOp = 0;
       break;
    }
+   case OP_POPCNT: {
+      uint32_t res;
+      if (!i->srcExists(1)) {
+         res = util_bitcount(imm0.reg.data.u32);
+         i->setSrc(0, new_ImmediateValue(i->bb->getProgram(), res));
+         i->setSrc(1, NULL);
+         i->op = OP_MOV;
+         i->subOp = 0;
+      }
+      break;
+   }
    default:
       return;
    }
-- 
1.8.4.5
