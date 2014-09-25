From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] gm107/ir: fix texture argument order
Date: Thu, 25 Sep 2014 04:07:34 -0400
Message-ID: <1411632454-1559-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---

With this, all the tex-miplevel-selection tests pass on maxwell. There is a
minor bit of this change which affects textureGrad on kepler that I have yet
to test, but I'm moderately sure it's correct and was only working by luck
before. (Changing the insbf to use getSrc(s) as its dest instead of
getSrc(0).)

 .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      | 32 ++++++++++++++++++----
 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp |  7 +++++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 3afbf43..9ec2366 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -601,6 +601,21 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
    //  lod bias
    //  depth compare
    //  offsets (same as fermi, except txd which takes it with array)
+   //
+   // Maxwell (tex):
+   //  array
+   //  coords
+   //  indirect handle
+   //  sample
+   //  lod bias
+   //  depth compare
+   //  offsets
+   //
+   // Maxwell (txd):
+   //  indirect handle
+   //  coords
+   //  array + offsets
+   //  derivatives
 
    if (chipset >= NVISA_GK104_CHIPSET) {
       if (i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
@@ -634,12 +649,17 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
          const int sat = (i->op == OP_TXF) ? 1 : 0;
          DataType sTy = (i->op == OP_TXF) ? TYPE_U32 : TYPE_F32;
          bld.mkCvt(OP_CVT, TYPE_U16, layer, sTy, src)->saturate = sat;
-         for (int s = dim; s >= 1; --s)
-            i->setSrc(s, i->getSrc(s - 1));
-         i->setSrc(0, layer);
+         if (i->op != OP_TXD || chipset < NVISA_GM107_CHIPSET) {
+            for (int s = dim; s >= 1; --s)
+               i->setSrc(s, i->getSrc(s - 1));
+            i->setSrc(0, layer);
+         } else {
+            i->setSrc(dim, layer);
+         }
       }
       // Move the indirect reference to the first place
-      if (i->tex.rIndirectSrc >= 0) {
+      if (i->tex.rIndirectSrc >= 0 && (
+                i->op == OP_TXD || chipset < NVISA_GM107_CHIPSET)) {
          Value *hnd = i->getIndirectR();
 
          i->setIndirectR(NULL);
@@ -742,8 +762,10 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
             // create it if it's not already there, and INSBF it if it already
             // is.
             s = (i->tex.rIndirectSrc >= 0) ? 1 : 0;
+            if (chipset >= NVISA_GM107_CHIPSET)
+               s += dim;
             if (i->tex.target.isArray()) {
-               bld.mkOp3(OP_INSBF, TYPE_U32, i->getSrc(0),
+               bld.mkOp3(OP_INSBF, TYPE_U32, i->getSrc(s),
                          bld.loadImm(NULL, imm), bld.mkImm(0xc10),
                          i->getSrc(s));
             } else {
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index d47fed2..898653c 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -1921,6 +1921,13 @@ RegAlloc::InsertConstraintsPass::texConstraintGM107(TexInstruction *tex)
    if (isTextureOp(tex->op)) {
       if (tex->op != OP_TXQ) {
          s = tex->tex.target.getArgCount() - tex->tex.target.isMS();
+         if (tex->op == OP_TXD) {
+            // Indirect handle belongs in the first arg
+            if (tex->tex.rIndirectSrc >= 0)
+               s++;
+            if (!tex->tex.target.isArray() && tex->tex.useOffsets)
+               s++;
+         }
          n = tex->srcCount(0xff) - s;
       } else {
          s = tex->srcCount(0xff);
-- 
1.8.5.5
