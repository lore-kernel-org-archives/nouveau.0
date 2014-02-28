From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: enable texture query lod
Date: Fri, 28 Feb 2014 01:01:02 -0500
Message-ID: <1393567262-12168-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Note: this applies on top of airlied's r600g-texture-gather branch.

Appears to pass all 4 piglit tests. The conversion from what the instruction
outputs is the same as what the blob does.

 src/gallium/drivers/nouveau/codegen/nv50_ir.h      |  1 +
 .../drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp  |  4 ++++
 .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  |  3 +++
 .../nouveau/codegen/nv50_ir_lowering_nv50.cpp      | 23 ++++++++++++++++++++++
 .../drivers/nouveau/codegen/nv50_ir_print.cpp      |  1 +
 src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  2 +-
 6 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
index 857980d..286ac83 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
@@ -117,6 +117,7 @@ enum operation
    OP_TXQ, // texture size query
    OP_TXD, // texture derivatives
    OP_TXG, // texture gather
+   OP_TXLQ, // texture query lod
    OP_TEXCSAA, // texture op for coverage sampling
    OP_TEXPREP, // turn cube map array into 2d array coordinates
    OP_SULDB, // surface load (raw)
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
index bef103f..0b0d480 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
@@ -1450,6 +1450,9 @@ CodeEmitterNV50::emitTEX(const TexInstruction *i)
       code[0] = 0x01000000;
       code[1] = 0x80000000;
       break;
+   case OP_TXLQ:
+      code[1] = 0x60020000;
+      break;
    default:
       assert(i->op == OP_TEX);
       break;
@@ -1790,6 +1793,7 @@ CodeEmitterNV50::emitInstruction(Instruction *insn)
    case OP_TXB:
    case OP_TXL:
    case OP_TXF:
+   case OP_TXLQ:
       emitTEX(insn->asTex());
       break;
    case OP_TXQ:
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index d226d0c..10ec8c6 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -255,6 +255,7 @@ unsigned int Instruction::srcMask(unsigned int s) const
    case TGSI_OPCODE_TXD:
    case TGSI_OPCODE_TXL:
    case TGSI_OPCODE_TXP:
+   case TGSI_OPCODE_LODQ:
    {
       const struct tgsi_instruction_texture *tex = &insn->Texture;
 
@@ -558,6 +559,7 @@ static nv50_ir::operation translateOpcode(uint opcode)
    NV50_IR_OPCODE_CASE(SAD, SAD);
    NV50_IR_OPCODE_CASE(TXF, TXF);
    NV50_IR_OPCODE_CASE(TXQ, TXQ);
+   NV50_IR_OPCODE_CASE(LODQ, TXLQ);
 
    NV50_IR_OPCODE_CASE(EMIT, EMIT);
    NV50_IR_OPCODE_CASE(ENDPRIM, RESTART);
@@ -2428,6 +2430,7 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
    case TGSI_OPCODE_TXB:
    case TGSI_OPCODE_TXL:
    case TGSI_OPCODE_TXP:
+   case TGSI_OPCODE_LODQ:
       //              R  S     L     C    Dx    Dy
       handleTEX(dst0, 1, 1, 0x03, 0x0f, 0x00, 0x00);
       break;
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index 984a8ca..91cae53 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -543,6 +543,7 @@ private:
    bool handleTXB(TexInstruction *); // I really
    bool handleTXL(TexInstruction *); // hate
    bool handleTXD(TexInstruction *); // these 3
+   bool handleTXLQ(TexInstruction *);
 
    bool handleCALL(Instruction *);
    bool handlePRECONT(Instruction *);
@@ -856,6 +857,26 @@ NV50LoweringPreSSA::handleTXD(TexInstruction *i)
 }
 
 bool
+NV50LoweringPreSSA::handleTXLQ(TexInstruction *i)
+{
+   handleTEX(i);
+   bld.setPosition(i, true);
+
+   /* The returned values are not quite what we want:
+    * (a) convert from s32 to f32
+    * (b) multiply by 1/256
+    */
+   for (int def = 0; def < 2; ++def) {
+      if (!i->defExists(def))
+         continue;
+      bld.mkCvt(OP_CVT, TYPE_F32, i->getDef(def), TYPE_S32, i->getDef(def));
+      bld.mkOp2(OP_MUL, TYPE_F32, i->getDef(def),
+                i->getDef(def), bld.loadImm(NULL, 1.0f / 256));
+   }
+   return true;
+}
+
+bool
 NV50LoweringPreSSA::handleSET(Instruction *i)
 {
    if (i->dType == TYPE_F32) {
@@ -1196,6 +1217,8 @@ NV50LoweringPreSSA::visit(Instruction *i)
       return handleTXL(i->asTex());
    case OP_TXD:
       return handleTXD(i->asTex());
+   case OP_TXLQ:
+      return handleTXLQ(i->asTex());
    case OP_EX2:
       bld.mkOp1(OP_PREEX2, TYPE_F32, i->getDef(0), i->getSrc(0));
       i->setSrc(0, i->getDef(0));
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
index ae42d03..4093bc0 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
@@ -147,6 +147,7 @@ const char *operationStr[OP_LAST + 1] =
    "texquery",
    "texgrad",
    "texgather",
+   "texquerylod",
    "texcsaa",
    "texprep",
    "suldb",
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 6e02a24..ca9ce74 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -167,6 +167,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TEXTURE_BARRIER:
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_START_INSTANCE:
+   case PIPE_CAP_TEXTURE_QUERY_LOD:
       return 1;
    case PIPE_CAP_TGSI_CAN_COMPACT_CONSTANTS:
       return 0; /* state trackers will know better */
@@ -198,7 +199,6 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TGSI_VS_LAYER:
    case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
-   case PIPE_CAP_TEXTURE_QUERY_LOD:
       return 0;
    case PIPE_CAP_MAX_VIEWPORTS:
       return NV50_MAX_VIEWPORTS;
-- 
1.8.3.2
