From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 08/19] nv50/ir: add support for gl_PrimitiveIDIn
Date: Mon, 13 Jan 2014 14:19:24 -0500
Message-ID: <1389640775-25046-9-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Note that the primitive id is stored in a[0x18], while usually the
geometry instructions are of the form a[$a1 + 0x4] which gets mapped to
p[] space. We need to avoid the change from a[] to p[] here, so it's
keyed on whether the access is indirect or not.

Note that there's also a use-case for accessing e.g. a[$r1], however
that's not supported for now. (Could be added by checking the register
file of the indirect parameter.)

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp   | 6 +++---
 src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp   | 7 +++++--
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
index f4db2ed..a6ed4b0 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
@@ -381,7 +381,7 @@ CodeEmitterNV50::setSrcFileBits(const Instruction *i, int enc)
    case 0x00: // rrr
       break;
    case 0x01: // arr/grr
-      if (progType == Program::TYPE_GEOMETRY) {
+      if (progType == Program::TYPE_GEOMETRY && i->src(0).isIndirect(0)) {
          code[0] |= 0x01800000;
          if (enc == NV50_OP_ENC_LONG || enc == NV50_OP_ENC_LONG_ALT)
             code[1] |= 0x00200000;
@@ -407,7 +407,7 @@ CodeEmitterNV50::setSrcFileBits(const Instruction *i, int enc)
       code[1] |= (i->getSrc(1)->reg.fileIndex << 22);
       break;
    case 0x09: // acr/gcr
-      if (progType == Program::TYPE_GEOMETRY) {
+      if (progType == Program::TYPE_GEOMETRY && i->src(0).isIndirect(0)) {
          code[0] |= 0x01800000;
       } else {
          code[0] |= (enc == NV50_OP_ENC_LONG_ALT) ? 0x01000000 : 0x00800000;
@@ -612,7 +612,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)
 
    switch (sf) {
    case FILE_SHADER_INPUT:
-      if (progType == Program::TYPE_GEOMETRY)
+      if (progType == Program::TYPE_GEOMETRY && i->src(0).isIndirect(0))
          code[0] = 0x11800001;
       else
          // use 'mov' where we can
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 3c790cf..321410e 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -1434,13 +1434,16 @@ Converter::fetchSrc(tgsi::Instruction::SrcRegister src, int c, Value *ptr)
             return mkOp1v(OP_RDSV, TYPE_F32, getSSA(), mkSysVal(SV_FACE, 0));
          return interpolate(src, c, shiftAddress(ptr));
       } else
-      if (ptr && prog->getType() == Program::TYPE_GEOMETRY) {
+      if (prog->getType() == Program::TYPE_GEOMETRY) {
+         if (!ptr && info->in[idx].sn == TGSI_SEMANTIC_PRIMID)
+            return mkOp1v(OP_RDSV, TYPE_U32, getSSA(), mkSysVal(SV_PRIMITIVE_ID, 0));
          // XXX: This is going to be a problem with scalar arrays, i.e. when
          // we cannot assume that the address is given in units of vec4.
          //
          // nv50 and nvc0 need different things here, so let the lowering
          // passes decide what to do with the address
-         return mkLoadv(TYPE_U32, srcToSym(src, c), ptr);
+         if (ptr)
+            return mkLoadv(TYPE_U32, srcToSym(src, c), ptr);
       }
       return mkLoadv(TYPE_U32, srcToSym(src, c), shiftAddress(ptr));
    case TGSI_FILE_OUTPUT:
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
index a84a54a..1925c09 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -238,6 +238,9 @@ TargetNV50::getSVAddress(DataFile shaderFile, const Symbol *sym) const
             addr += 4;
       return addr;
    }
+   case SV_PRIMITIVE_ID:
+      return shaderFile == FILE_SHADER_INPUT ? 0x18 :
+         sysvalLocation[sym->reg.data.sv.sv];
    case SV_NCTAID:
       return 0x8 + 2 * sym->reg.data.sv.index;
    case SV_CTAID:
-- 
1.8.3.2
