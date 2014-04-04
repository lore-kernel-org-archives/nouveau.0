From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/2] nvc0: add support for texture gather
Date: Fri,  4 Apr 2014 01:35:46 -0400
Message-ID: <1396589747-17988-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Tested on NVE6. Very strange that it seems to use 8 bits for offsets, vs 4
bits used by texelFetch. But this passes the piglit tests.

Will test on a NVCX before checking in, in case it's different
there. (Although that'd be surprising, given the similarities between the 2
ISAs.)

 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp  | 13 +++++++++++--
 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp   |  1 +
 .../drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp       | 10 ++++++++--
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c              |  3 ++-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
index b716d54..a4b50ee 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
@@ -984,6 +984,9 @@ CodeEmitterGK110::emitTEX(const TexInstruction *i)
       case OP_TXF:
          code[1] = 0x78000000;
          break;
+      case OP_TXG:
+         code[1] = 0x7dc00000;
+         break;
       default:
          code[1] = 0x7d800000;
          break;
@@ -1005,6 +1008,11 @@ CodeEmitterGK110::emitTEX(const TexInstruction *i)
          code[1] = 0x70000000;
          code[1] |= i->tex.r << 13;
          break;
+      case OP_TXG:
+         code[0] = 0x00000001;
+         code[1] = 0x70000000;
+         code[1] |= i->tex.r << 15;
+         break;
       default:
          code[0] = 0x00000001;
          code[1] = 0x60000000;
@@ -1023,7 +1031,7 @@ CodeEmitterGK110::emitTEX(const TexInstruction *i)
    case OP_TXB: code[1] |= 0x2000; break;
    case OP_TXL: code[1] |= 0x3000; break;
    case OP_TXF: break;
-   case OP_TXG: break; // XXX
+   case OP_TXG: break;
    case OP_TXD: break;
    case OP_TXLQ: break;
    default:
@@ -1052,7 +1060,7 @@ CodeEmitterGK110::emitTEX(const TexInstruction *i)
    srcId(i->src(0), 10);
    srcId(i, src1, 23);
 
-   // if (i->op == OP_TXG) code[0] |= i->tex.gatherComp << 5;
+   if (i->op == OP_TXG) code[1] |= i->tex.gatherComp << 13;
 
    // texture target:
    code[1] |= (i->tex.target.isCube() ? 3 : (i->tex.target.getDim() - 1)) << 7;
@@ -1666,6 +1674,7 @@ CodeEmitterGK110::emitInstruction(Instruction *insn)
    case OP_TXL:
    case OP_TXD:
    case OP_TXF:
+   case OP_TXG:
    case OP_TXLQ:
       emitTEX(insn->asTex());
       break;
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
index 1f624a5..d486c8d 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
@@ -2303,6 +2303,7 @@ CodeEmitterNVC0::emitInstruction(Instruction *insn)
    case OP_TXL:
    case OP_TXD:
    case OP_TXF:
+   case OP_TXG:
    case OP_TXLQ:
       emitTEX(insn->asTex());
       break;
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 382b02d..44b5ecd 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -744,9 +744,15 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
       int s = i->srcCount(0xff, true);
       if (i->srcExists(s)) // move potential predicate out of the way
          i->moveSources(s, 1);
-      for (n = 0; n < i->tex.useOffsets; ++n)
+      if (i->op == OP_TXG) {
+         assert(i->tex.useOffsets == 1);
          for (c = 0; c < 3; ++c)
-            value |= (i->tex.offset[n][c] & 0xf) << (n * 12 + c * 4);
+            value |= (i->tex.offset[0][c] & 0xff) << (c * 8);
+      } else {
+         for (n = 0; n < i->tex.useOffsets; ++n)
+            for (c = 0; c < 3; ++c)
+               value |= (i->tex.offset[n][c] & 0xf) << (n * 12 + c * 4);
+      }
       i->setSrc(s, bld.loadImm(NULL, value));
    }
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index fa3145e..1ee6f72 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -174,7 +174,6 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_ENDIANNESS:
       return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
-   case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
    case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
    case PIPE_CAP_FAKE_SW_MSAA:
@@ -183,6 +182,8 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return 1;
    case PIPE_CAP_TEXTURE_QUERY_LOD:
       return 1;
+   case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
+      return 4;
    default:
       NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
       return 0;
-- 
1.8.3.2
