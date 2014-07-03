From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v3 1/2] nv50/ir: Add support for the double Type
	to BuildUtil
Date: Thu,  3 Jul 2014 21:27:32 +0200
Message-ID: <1404415653-6089-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
 .../drivers/nouveau/codegen/nv50_ir_build_util.cpp      | 17 +++++++++++++++++
 .../drivers/nouveau/codegen/nv50_ir_build_util.h        |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.cpp
index 6d9c830..44daece 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.cpp
@@ -391,6 +391,17 @@ BuildUtil::mkImm(float f)
    return mkImm(u.u32);
 }
 
+ImmediateValue *
+BuildUtil::mkImm(double f)
+{
+   union {
+      double f64;
+      uint64_t u64;
+   } u;
+   u.f64 = f;
+   return mkImm(u.u64);
+}
+
 Value *
 BuildUtil::loadImm(Value *dst, float f)
 {
@@ -398,6 +409,12 @@ BuildUtil::loadImm(Value *dst, float f)
 }
 
 Value *
+BuildUtil::loadImm(Value *dst, double u)
+{
+   return mkOp1v(OP_MOV, TYPE_F64, dst ? dst : getScratch(8), mkImm(u));
+}
+
+Value *
 BuildUtil::loadImm(Value *dst, uint32_t u)
 {
    return mkOp1v(OP_MOV, TYPE_U32, dst ? dst : getScratch(), mkImm(u));
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.h
index a610c77..2abf736 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.h
@@ -90,12 +90,14 @@ public:
    void mkClobber(DataFile file, uint32_t regMask, int regUnitLog2);
 
    ImmediateValue *mkImm(float);
+   ImmediateValue *mkImm(double);
    ImmediateValue *mkImm(uint32_t);
    ImmediateValue *mkImm(uint64_t);
 
    ImmediateValue *mkImm(int i) { return mkImm((uint32_t)i); }
 
    Value *loadImm(Value *dst, float);
+   Value *loadImm(Value *dst, double);
    Value *loadImm(Value *dst, uint32_t);
    Value *loadImm(Value *dst, uint64_t);
 
-- 
1.8.4.5
