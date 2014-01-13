From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 01/19] nv50/ir: fix PFETCH and add RDSV to get
	VSTRIDE for GPs
Date: Mon, 13 Jan 2014 14:19:17 -0500
Message-ID: <1389640775-25046-2-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>

---
 src/gallium/drivers/nouveau/codegen/nv50_ir.h      |  1 +
 .../drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp  | 62 ++++++++++++++++++++--
 .../drivers/nouveau/codegen/nv50_ir_print.cpp      |  1 +
 3 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
index 68c76e5..6a001d3 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
@@ -366,6 +366,7 @@ enum SVSemantic
    SV_CLOCK,
    SV_LBASE,
    SV_SBASE,
+   SV_VERTEX_STRIDE,
    SV_UNDEFINED,
    SV_LAST
 };
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
index 3eca27d..cf82e2f 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
@@ -87,6 +87,7 @@ private:
    void emitLOAD(const Instruction *);
    void emitSTORE(const Instruction *);
    void emitMOV(const Instruction *);
+   void emitRDSV(const Instruction *);
    void emitNOP();
    void emitINTERP(const Instruction *);
    void emitPFETCH(const Instruction *);
@@ -772,6 +773,29 @@ CodeEmitterNV50::emitMOV(const Instruction *i)
    }
 }
 
+static inline uint8_t getSRegEncoding(const ValueRef &ref)
+{
+   switch (SDATA(ref).sv.sv) {
+   case SV_PHYSID:        return 0;
+   case SV_CLOCK:         return 1;
+   case SV_VERTEX_STRIDE: return 3;
+// case SV_PM_COUNTER:    return 4 + SDATA(ref).sv.index;
+   case SV_SAMPLE_INDEX:  return 8;
+   default:
+      assert(!"no sreg for system value");
+      return 0;
+   }
+}
+
+void
+CodeEmitterNV50::emitRDSV(const Instruction *i)
+{
+   code[0] = 0x00000001;
+   code[1] = 0x60000000 | (getSRegEncoding(i->src(0)) << 14);
+   defId(i->def(0), 2);
+   emitFlagsRd(i);
+}
+
 void
 CodeEmitterNV50::emitNOP()
 {
@@ -794,15 +818,40 @@ CodeEmitterNV50::emitQUADOP(const Instruction *i, uint8_t lane, uint8_t quOp)
       srcId(i->src(0), 32 + 14);
 }
 
+/* NOTE: This returns the base address of a vertex inside the primitive.
+ * src0 is an immediate, the index (not offset) of the vertex
+ * inside the primitive. XXX: signed or unsigned ?
+ * src1 (may be NULL) should use whatever units the hardware requires
+ * (on nv50 this is bytes, so, relative index * 4; signed 16 bit value).
+ */
 void
 CodeEmitterNV50::emitPFETCH(const Instruction *i)
 {
-   code[0] = 0x11800001;
-   code[1] = 0x04200000 | (0xf << 14);
+   const uint32_t prim = i->src(0).get()->reg.data.u32;
+   assert(prim <= 127);
 
-   defId(i->def(0), 2);
-   srcAddr8(i->src(0), 9);
-   setAReg16(i, 0);
+   if (i->def(0).getFile() == FILE_ADDRESS) {
+      // shl $aX a[] 0
+      code[0] = 0x00000001 | ((DDATA(i->def(0)).id + 1) << 2);
+      code[1] = 0xc0200000;
+      code[0] |= prim << 9;
+      assert(!i->srcExists(1));
+   } else
+   if (i->srcExists(1)) {
+      // ld b32 $rX a[$aX+base]
+      code[0] = 0x00000001;
+      code[1] = 0x04200000 | (0xf << 14);
+      defId(i->def(0), 2);
+      code[0] |= prim << 9;
+      setARegBits(SDATA(i->src(1)).id + 1);
+   } else {
+      // mov b32 $rX a[]
+      code[0] = 0x10000001;
+      code[1] = 0x04200000 | (0xf << 14);
+      defId(i->def(0), 2);
+      code[0] |= prim << 9;
+   }
+   emitFlagsRd(i);
 }
 
 void
@@ -1620,6 +1669,9 @@ CodeEmitterNV50::emitInstruction(Instruction *insn)
    case OP_PFETCH:
       emitPFETCH(insn);
       break;
+   case OP_RDSV:
+      emitRDSV(insn);
+      break;
    case OP_LINTERP:
    case OP_PINTERP:
       emitINTERP(insn);
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
index ee39b3c..ae42d03 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
@@ -265,6 +265,7 @@ static const char *SemanticStr[SV_LAST + 1] =
    "CLOCK",
    "LBASE",
    "SBASE",
+   "VERTEX_STRIDE",
    "?",
    "(INVALID)"
 };
-- 
1.8.3.2
