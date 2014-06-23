From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH] nv50/ir: make ARB_viewport_array behave like it
	does with other drivers
Date: Mon, 23 Jun 2014 17:24:04 +0200
Message-ID: <1403537044-7231-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 .../drivers/nouveau/codegen/nv50_ir_driver.h       |  1 +
 .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  | 27 ++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
index c885c8c..a8cc97c 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
@@ -189,6 +189,7 @@ struct nv50_ir_prog_info
       uint16_t sampleInfoBase;   /* base address for sample positions */
       uint8_t msInfoCBSlot;      /* cX[] used for multisample info */
       uint16_t msInfoBase;       /* base address for multisample info */
+      int32_t viewportID;
    } io;
 
    /* driver callback to assign input/output locations */
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index a0f1fe1..78e33f8 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -982,6 +982,9 @@ bool Source::scanDeclaration(const struct tgsi_full_declaration *decl)
          case TGSI_SEMANTIC_SAMPLEMASK:
             info->io.sampleMask = i;
             break;
+         case TGSI_SEMANTIC_VIEWPORT_INDEX:
+            info->io.viewportID = i;
+            break;
          default:
             break;
          }
@@ -1258,6 +1261,8 @@ private:
    Stack joinBBs;  // fork BB, for inserting join ops on ENDIF
    Stack loopBBs;  // loop headers
    Stack breakBBs; // end of / after loop
+
+   Value *viewport;
 };
 
 Symbol *
@@ -1555,8 +1560,15 @@ Converter::storeDst(const tgsi::Instruction::DstRegister dst, int c,
       mkOp2(OP_WRSV, TYPE_U32, NULL, dstToSym(dst, c), val);
    } else
    if (f == TGSI_FILE_OUTPUT && prog->getType() != Program::TYPE_FRAGMENT) {
-      if (ptr || (info->out[idx].mask & (1 << c)))
-         mkStore(OP_EXPORT, TYPE_U32, dstToSym(dst, c), ptr, val);
+
+      if (ptr || (info->out[idx].mask & (1 << c))) {
+         /* Save the viewport index into a scratch register so that it can be
+            exported at EMIT time */
+         if (info->out[dst.getIndex(0)].sn == TGSI_SEMANTIC_VIEWPORT_INDEX && viewport != NULL)
+            mkOp1(OP_MOV, TYPE_U32, viewport, val);
+         else
+            mkStore(OP_EXPORT, TYPE_U32, dstToSym(dst, c), ptr, val);
+      }
    } else
    if (f == TGSI_FILE_TEMPORARY ||
        f == TGSI_FILE_PREDICATE ||
@@ -2523,6 +2535,14 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
          mkCvt(OP_CVT, dstTy, dst0[c], srcTy, fetchSrc(0, c));
       break;
    case TGSI_OPCODE_EMIT:
+      /* export the saved viewport index */
+      if (viewport != NULL) {
+         Symbol *VPSym = mkSymbol(FILE_SHADER_OUTPUT, info->io.viewportID,
+                                  TYPE_U32,
+                                  info->out[info->io.viewportID].slot[0] * 4);
+         mkStore(OP_EXPORT, TYPE_U32, VPSym, NULL, viewport);
+      }
+      /* fallthrough */
    case TGSI_OPCODE_ENDPRIM:
       // get vertex stream if specified (must be immediate)
       src0 = tgsi.srcCount() ?
@@ -2952,6 +2972,9 @@ Converter::run()
       mkOp1(OP_RCP, TYPE_F32, fragCoord[3], fragCoord[3]);
    }
 
+   if (info->io.viewportID > 0)
+      viewport = getScratch();
+
    for (ip = 0; ip < code->scan.num_instructions; ++ip) {
       if (!handleInstruction(&code->insns[ip]))
          return false;
-- 
1.8.4.5
