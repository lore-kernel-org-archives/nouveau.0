From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nvc0/ir: move sample id to second source arg to
	fix sampler2DMS
Date: Thu, 20 Mar 2014 18:01:01 -0400
Message-ID: <1395352861-24668-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: "10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The nvc0 texfetch instruction expects the sample id to be in the second
source (usually used for the offset) rather than as part of the texture
coordinate.

This fixes all the sampler2DMS/Array tests on nvc0.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---

Tested on nvc1 with a full piglit run, no regressions, ARB_texture_multisample
passes fully now. Since 10.1 introduced OpenGL 3.3 support (and
ARB_texture_multisample is a prereq for GL3.2), I think it makes sense to
backport.

 .../drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp       | 13 ++++++++++---
 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp          |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 3840f75..62241ba 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -666,8 +666,9 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
    const int dim = i->tex.target.getDim() + i->tex.target.isCube();
    const int arg = i->tex.target.getArgCount();
    const int lyr = arg - (i->tex.target.isMS() ? 2 : 1);
+   const int chipset = prog->getTarget()->getChipset();
 
-   if (prog->getTarget()->getChipset() >= NVISA_GK104_CHIPSET) {
+   if (chipset >= NVISA_GK104_CHIPSET) {
       if (i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
          WARN("indirect TEX not implemented\n");
       }
@@ -697,7 +698,7 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
       }
    } else
    // (nvc0) generate and move the tsc/tic/array source to the front
-   if (dim != arg || i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
+   if (i->tex.target.isArray() || i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
       LValue *src = new_LValue(func, FILE_GPR); // 0xttxsaaaa
 
       Value *arrayIndex = i->tex.target.isArray() ? i->getSrc(lyr) : NULL;
@@ -728,6 +729,12 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
       i->setSrc(0, src);
    }
 
+   // for nvc0, the sample id ends up being treated as an offset, so we can't
+   // do offset and ms at the same time. on nve0, the sample id is part of the
+   // texture coordinate argument.
+   assert(chipset >= NVISA_GK104_CHIPSET ||
+          !i->tex.useOffsets || !i->tex.target.isMS());
+
    // offset is last source (lod 1st, dc 2nd)
    if (i->tex.useOffsets) {
       uint32_t value = 0;
@@ -741,7 +748,7 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
       i->setSrc(s, bld.loadImm(NULL, value));
    }
 
-   if (prog->getTarget()->getChipset() >= NVISA_GK104_CHIPSET) {
+   if (chipset >= NVISA_GK104_CHIPSET) {
       //
       // If TEX requires more than 4 sources, the 2nd register tuple must be
       // aligned to 4, even if it consists of just a single 4-byte register.
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 1ace9f5..60a6a3f 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -1914,7 +1914,7 @@ RegAlloc::InsertConstraintsPass::texConstraintNVC0(TexInstruction *tex)
       s = tex->srcCount(0xff);
       n = 0;
    } else {
-      s = tex->tex.target.getArgCount();
+      s = tex->tex.target.getArgCount() - tex->tex.target.isMS();
       if (!tex->tex.target.isArray() &&
           (tex->tex.rIndirectSrc >= 0 || tex->tex.sIndirectSrc >= 0))
          ++s;
-- 
1.8.3.2
