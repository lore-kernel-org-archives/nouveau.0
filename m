From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] nvc0/ir: add base tex offset for fermi
	indirect tex case
Date: Thu,  7 Aug 2014 21:27:08 -0400
Message-ID: <1407461230-22369-1-git-send-email-imirkin@alum.mit.edu>
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
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 .../drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index f010767..4a9e48f 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -603,10 +603,18 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
       Value *ticRel = i->getIndirectR();
       Value *tscRel = i->getIndirectS();
 
-      if (ticRel)
+      if (ticRel) {
          i->setSrc(i->tex.rIndirectSrc, NULL);
-      if (tscRel)
+         if (i->tex.r)
+            ticRel = bld.mkOp2v(OP_ADD, TYPE_U32, bld.getScratch(),
+                                ticRel, bld.mkImm(i->tex.r));
+      }
+      if (tscRel) {
          i->setSrc(i->tex.sIndirectSrc, NULL);
+         if (i->tex.s)
+            tscRel = bld.mkOp2v(OP_ADD, TYPE_U32, bld.getScratch(),
+                                tscRel, bld.mkImm(i->tex.s));
+      }
 
       Value *arrayIndex = i->tex.target.isArray() ? i->getSrc(lyr) : NULL;
       for (int s = dim; s >= 1; --s)
-- 
1.8.5.5
