From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: enable txg where supported
Date: Thu, 20 Feb 2014 01:33:30 -0500
Message-ID: <1392878010-4909-1-git-send-email-imirkin@alum.mit.edu>
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
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

This applies on top of Dave Airlie's r600g-texture-gather branch. Ran piglit
with -t gather, passed all 1057 tests. Can't say I fully understand what all
the arguments to handleTEX in the Coverter are but... seems to work. Will
probably require some care for nvc0 support which should have SM5 caps.

 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp | 3 ++-
 src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 4 ++++
 src/gallium/drivers/nouveau/nv50/nv50_screen.c            | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
index bef103f..e2f93bb 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
@@ -1447,7 +1447,7 @@ CodeEmitterNV50::emitTEX(const TexInstruction *i)
       code[0] |= 0x01000000;
       break;
    case OP_TXG:
-      code[0] = 0x01000000;
+      code[0] |= 0x01000000;
       code[1] = 0x80000000;
       break;
    default:
@@ -1790,6 +1790,7 @@ CodeEmitterNV50::emitInstruction(Instruction *insn)
    case OP_TXB:
    case OP_TXL:
    case OP_TXF:
+   case OP_TXG:
       emitTEX(insn->asTex());
       break;
    case OP_TXQ:
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index d226d0c..ccddb9a 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -558,6 +558,7 @@ static nv50_ir::operation translateOpcode(uint opcode)
    NV50_IR_OPCODE_CASE(SAD, SAD);
    NV50_IR_OPCODE_CASE(TXF, TXF);
    NV50_IR_OPCODE_CASE(TXQ, TXQ);
+   NV50_IR_OPCODE_CASE(TG4, TXG);
 
    NV50_IR_OPCODE_CASE(EMIT, EMIT);
    NV50_IR_OPCODE_CASE(ENDPRIM, RESTART);
@@ -2434,6 +2435,9 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
    case TGSI_OPCODE_TXD:
       handleTEX(dst0, 3, 3, 0x03, 0x0f, 0x10, 0x20);
       break;
+   case TGSI_OPCODE_TG4:
+      handleTEX(dst0, 2, 2, 0x03, 0x0f, 0x00, 0x00);
+      break;
    case TGSI_OPCODE_TEX2:
       handleTEX(dst0, 2, 2, 0x03, 0x10, 0x00, 0x00);
       break;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 488642a..9aafe94 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -193,11 +193,12 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_ENDIANNESS:
       return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
-   case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
       return 0;
    case PIPE_CAP_MAX_VIEWPORTS:
       return NV50_MAX_VIEWPORTS;
+   case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
+      return (class_3d >= NVA3_3D_CLASS) ? 4 : 0;
    default:
       NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
       return 0;
-- 
1.8.3.2
