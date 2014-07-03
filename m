From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v3 2/2] nv50/ir: Handle OP_CVT when folding
	constant expressions
Date: Thu,  3 Jul 2014 21:27:33 +0200
Message-ID: <1404415653-6089-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1404415653-6089-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404415653-6089-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
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

Folding for conversions: F32/64->(U16/32, S16/32) and (U16/32, S16/32)->F32
No piglit regressions observed on nv50 and nvc0!

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 .../drivers/nouveau/codegen/nv50_ir_peephole.cpp   | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index b89da43..007c730 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -970,6 +970,80 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
       i->op = OP_MOV;
       break;
    }
+   case OP_CVT: {
+      Storage res;
+      bld.setPosition(i, true); /* make sure bld is init'ed */
+
+      switch(i->dType) {
+      case TYPE_U16:
+         switch (i->sType) {
+         case TYPE_F32: res.data.u16 = util_iround(imm0.reg.data.f32); break;
+         case TYPE_F64: res.data.u16 = util_iround(imm0.reg.data.f64); break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.u16));
+         break;
+      case TYPE_U32:
+         switch (i->sType) {
+         case TYPE_F32: res.data.u32 = util_iround(imm0.reg.data.f32); break;
+         case TYPE_F64: res.data.u32 = util_iround(imm0.reg.data.f64); break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.u32));
+         break;
+      case TYPE_S16:
+         switch (i->sType) {
+         case TYPE_F32: res.data.s16 = util_iround(imm0.reg.data.f32); break;
+         case TYPE_F64: res.data.s16 = util_iround(imm0.reg.data.f64); break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.s16));
+         break;
+      case TYPE_S32:
+         switch (i->sType) {
+         case TYPE_F32: res.data.s32 = util_iround(imm0.reg.data.f32); break;
+         case TYPE_F64: res.data.s32 = util_iround(imm0.reg.data.f64); break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.s32));
+         break;
+      case TYPE_F32:
+         switch (i->sType) {
+         case TYPE_U16: res.data.f32 = (float) imm0.reg.data.u16; break;
+         case TYPE_U32: res.data.f32 = (float) imm0.reg.data.u32; break;
+         case TYPE_S16: res.data.f32 = (float) imm0.reg.data.s16; break;
+         case TYPE_S32: res.data.f32 = (float) imm0.reg.data.s32; break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.f32));
+         break;
+      case TYPE_F64:
+      /* TODO: Check if this works, after F64 support is available */
+         switch (i->sType) {
+         case TYPE_U16: res.data.f64 = (double) imm0.reg.data.u16; break;
+         case TYPE_U32: res.data.f64 = (double) imm0.reg.data.u32; break;
+         case TYPE_S16: res.data.f64 = (double) imm0.reg.data.s16; break;
+         case TYPE_S32: res.data.f64 = (double) imm0.reg.data.s32; break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.f64));
+         break;
+      default:
+         return;
+      }
+      i->setType(i->dType); /* Remove i->sType, which we don't need anymore */
+      i->setSrc(1, NULL);
+      i->op = OP_MOV;
+
+      i->src(0).mod = Modifier(0); /* Clear the already applied modifier */
+      break;
+   }
    default:
       return;
    }
-- 
1.8.4.5
