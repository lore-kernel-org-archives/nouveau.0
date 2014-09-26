From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] gm107/ir: take relative pfetch offset into account
Date: Fri, 26 Sep 2014 00:37:35 -0400
Message-ID: <1411706255-14724-1-git-send-email-imirkin@alum.mit.edu>
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

There is no dedicated instruction for this, so just combine it with the
constant offset.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---

This fixes the spec/glsl-1.50/execution/geometry/dynamic_input_array_index
piglit test.

 src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp
index 113f372..64989ac 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_gm107.cpp
@@ -159,7 +159,10 @@ GM107LoweringPass::handlePFETCH(Instruction *i)
    bld.mkOp2(OP_SHR , TYPE_U32, tmp1, tmp0, bld.mkImm(16));
    bld.mkOp2(OP_AND , TYPE_U32, tmp0, tmp0, bld.mkImm(0xff));
    bld.mkOp2(OP_AND , TYPE_U32, tmp1, tmp1, bld.mkImm(0xff));
-   bld.mkOp1(OP_MOV , TYPE_U32, tmp2, bld.mkImm(i->getSrc(0)->reg.data.u32));
+   if (i->getSrc(1))
+      bld.mkOp2(OP_ADD , TYPE_U32, tmp2, i->getSrc(0), i->getSrc(1));
+   else
+      bld.mkOp1(OP_MOV , TYPE_U32, tmp2, i->getSrc(0));
    bld.mkOp3(OP_MAD , TYPE_U32, tmp0, tmp0, tmp1, tmp2);
    i->setSrc(0, tmp0);
    i->setSrc(1, NULL);
-- 
1.8.5.5
