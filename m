From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: TXF already has integer arguments,
	don't try to convert from f32
Date: Sun,  8 Dec 2013 03:16:38 -0500
Message-ID: <1386490598-32666-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes the texelFetch piglit tests.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Verified a few things, but it's hard to check this fully. They array-texture
piglit test fails if the conversion isn't done at all, and texelFetch starts
passing if the conversion is removed.

Dunno if this is the sort of thing worth sticking a stable tag on, so leaving
it out. Feel free to add on commit.

 .../drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index caaf09f..07f3a21 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -575,14 +575,16 @@ NV50LoweringPreSSA::handleTEX(TexInstruction *i)
       if (i->op == OP_TXB || i->op == OP_TXL)
          i->swapSources(dref, lod);
 
-   // array index must be converted to u32
    if (i->tex.target.isArray()) {
-      Value *layer = i->getSrc(arg - 1);
-      LValue *src = new_LValue(func, FILE_GPR);
-      bld.mkCvt(OP_CVT, TYPE_U32, src, TYPE_F32, layer);
-      bld.mkOp2(OP_MIN, TYPE_U32, src, src, bld.loadImm(NULL, 511));
-      i->setSrc(arg - 1, src);
-
+      if (i->op != OP_TXF) {
+         // array index must be converted to u32, but it's already an integer
+         // for TXF
+         Value *layer = i->getSrc(arg - 1);
+         LValue *src = new_LValue(func, FILE_GPR);
+         bld.mkCvt(OP_CVT, TYPE_U32, src, TYPE_F32, layer);
+         bld.mkOp2(OP_MIN, TYPE_U32, src, src, bld.loadImm(NULL, 511));
+         i->setSrc(arg - 1, src);
+      }
       if (i->tex.target.isCube()) {
          std::vector<Value *> acube, a2d;
          int c;
-- 
1.8.3.2
