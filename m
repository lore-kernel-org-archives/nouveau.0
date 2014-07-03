From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH] nv50/ir: Handle OP_CVT when folding constant
	expressions
Date: Thu,  3 Jul 2014 05:32:48 +0200
Message-ID: <1404358368-2233-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, imirkin@alum.mit.edu
List-Id: nouveau.vger.kernel.org

Folding for conversions: F32/64->(U16/32, S16/32) and (U16/32, S16/32)->F32
No piglit regressions observed!

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 .../drivers/nouveau/codegen/nv50_ir_peephole.cpp   | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index b89da43..f92e635 100644
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
+         case TYPE_U16: res.data.f32 = (float) imm0.reg.data.u32; break;
+         case TYPE_U32: res.data.f32 = (float) imm0.reg.data.u32; break;
+         case TYPE_S16: res.data.f32 = (float) imm0.reg.data.s16; break;
+         case TYPE_S32: res.data.f32 = (float) imm0.reg.data.s32; break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(res.data.f32));
+         break;
+      /* case TYPE_F64: */
+      /* TODO: Check if this works, after F64 support is available */
+       /* switch (i->sType) {
+         case TYPE_U16: res.data.f64 = (double) imm0.reg.data.u32; break;
+         case TYPE_U32: res.data.f64 = (double) imm0.reg.data.u32; break;
+         case TYPE_S16: res.data.f64 = (double) imm0.reg.data.s16; break;
+         case TYPE_S32: res.data.f64 = (double) imm0.reg.data.s32; break;
+         default:
+            return;
+         }
+         i->setSrc(0, bld.mkImm(NULL, imm0.reg.data.f64));
+         break; */
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
