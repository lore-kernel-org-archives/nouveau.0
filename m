From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v3] nv50/ir: make ARB_viewport_array behave like
	it does with other drivers
Date: Mon, 23 Jun 2014 23:01:42 +0200
Message-ID: <1403557302-20290-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: nouveau.vger.kernel.org

previously, if we had something like:

gl_ViewportIndex = idx;
for(int i = 0; i < gl_in.length(); i++) {
   gl_Position = gl_in[i].gl_Position;
   EmitVertex();
}
EndPrimitive();

we failed to set the right ViewportIndex.
To resolve this, save the ViewportIndex and store it to the right register on each emit.

This fixes the remaining piglit tests in ARB_viewport_array for nvc0.

Note: Not tested on nv50

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
V2:
   provide description
   fix naming of vars
V3:
   spare a function call, use the idx we already have
   second arg to mkSymbol changed to 0, the other one was just wrong (double checked)

 .../drivers/nouveau/codegen/nv50_ir_driver.h       |  1 +
 .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  | 31 ++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
index c885c8c..002ac8f 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
@@ -177,6 +177,7 @@ struct nv50_ir_prog_info
       uint8_t vertexId;          /* system value index of VertexID */
       uint8_t edgeFlagIn;
       uint8_t edgeFlagOut;
+      int8_t viewportId;         /* output index of ViewportId */
       uint8_t fragDepth;         /* output index of FragDepth */
       uint8_t sampleMask;        /* output index of SampleMask */
       boolean sampleInterp;      /* perform sample interp on all fp inputs */
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index a0f1fe1..4911995 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -790,6 +790,8 @@ bool Source::scanSource()
       info->prop.gp.instanceCount = 1; // default value
    }
 
+   info->io.viewportId = -1;
+
    info->immd.data = (uint32_t *)MALLOC(scan.immediate_count * 16);
    info->immd.type = (ubyte *)MALLOC(scan.immediate_count * sizeof(ubyte));
 
@@ -982,6 +984,9 @@ bool Source::scanDeclaration(const struct tgsi_full_declaration *decl)
          case TGSI_SEMANTIC_SAMPLEMASK:
             info->io.sampleMask = i;
             break;
+         case TGSI_SEMANTIC_VIEWPORT_INDEX:
+            info->io.viewportId = i;
+            break;
          default:
             break;
          }
@@ -1258,6 +1263,8 @@ private:
    Stack joinBBs;  // fork BB, for inserting join ops on ENDIF
    Stack loopBBs;  // loop headers
    Stack breakBBs; // end of / after loop
+
+   Value *viewport;
 };
 
 Symbol *
@@ -1555,8 +1562,16 @@ Converter::storeDst(const tgsi::Instruction::DstRegister dst, int c,
       mkOp2(OP_WRSV, TYPE_U32, NULL, dstToSym(dst, c), val);
    } else
    if (f == TGSI_FILE_OUTPUT && prog->getType() != Program::TYPE_FRAGMENT) {
-      if (ptr || (info->out[idx].mask & (1 << c)))
-         mkStore(OP_EXPORT, TYPE_U32, dstToSym(dst, c), ptr, val);
+
+      if (ptr || (info->out[idx].mask & (1 << c))) {
+         /* Save the viewport index into a scratch register so that it can be
+            exported at EMIT time */
+         if (info->out[idx].sn == TGSI_SEMANTIC_VIEWPORT_INDEX
+             && viewport != NULL)
+            mkOp1(OP_MOV, TYPE_U32, viewport, val);
+         else
+            mkStore(OP_EXPORT, TYPE_U32, dstToSym(dst, c), ptr, val);
+      }
    } else
    if (f == TGSI_FILE_TEMPORARY ||
        f == TGSI_FILE_PREDICATE ||
@@ -2523,6 +2538,13 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
          mkCvt(OP_CVT, dstTy, dst0[c], srcTy, fetchSrc(0, c));
       break;
    case TGSI_OPCODE_EMIT:
+      /* export the saved viewport index */
+      if (viewport != NULL) {
+         Symbol *vpSym = mkSymbol(FILE_SHADER_OUTPUT, 0, TYPE_U32,
+                                  info->out[info->io.viewportId].slot[0] * 4);
+         mkStore(OP_EXPORT, TYPE_U32, vpSym, NULL, viewport);
+      }
+      /* fallthrough */
    case TGSI_OPCODE_ENDPRIM:
       // get vertex stream if specified (must be immediate)
       src0 = tgsi.srcCount() ?
@@ -2952,6 +2974,11 @@ Converter::run()
       mkOp1(OP_RCP, TYPE_F32, fragCoord[3], fragCoord[3]);
    }
 
+   if (info->io.viewportId >= 0)
+      viewport = getScratch();
+   else
+      viewport = NULL;
+
    for (ip = 0; ip < code->scan.num_instructions; ++ip) {
       if (!handleInstruction(&code->insns[ip]))
          return false;
-- 
1.8.4.5
