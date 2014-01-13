From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 03/19] nv50: add support for geometry shaders
Date: Mon, 13 Jan 2014 14:19:19 -0500
Message-ID: <1389640775-25046-4-git-send-email-imirkin@alum.mit.edu>
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

From: Bryan Cain <bryancain3@gmail.com>

Layer output probably doesn't work yet, but other than that everything seems
to be working.

Signed-off-by: Bryan Cain <bryancain3@gmail.com>
[calim: fix up minor bugs, code formatting]
Signed-off-by: Christoph Bumiller <e0425955@student.tuwien.ac.at>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 .../drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp  | 25 ++++++++++++++++------
 src/gallium/drivers/nouveau/nv50/nv50_program.c    | 16 ++++++++++++++
 .../drivers/nouveau/nv50/nv50_shader_state.c       |  2 ++
 src/gallium/drivers/nouveau/nv50/nv50_tex.c        |  2 ++
 4 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
index cf82e2f..f4db2ed 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
@@ -493,7 +493,12 @@ CodeEmitterNV50::emitForm_MAD(const Instruction *i)
    setSrc(i, 1, 1);
    setSrc(i, 2, 2);
 
-   setAReg16(i, 1);
+   if (i->getIndirect(0, 0)) {
+      assert(!i->getIndirect(1, 0));
+      setAReg16(i, 0);
+   } else {
+      setAReg16(i, 1);
+   }
 }
 
 // like default form, but 2nd source in slot 2, and no 3rd source
@@ -512,7 +517,12 @@ CodeEmitterNV50::emitForm_ADD(const Instruction *i)
    setSrc(i, 0, 0);
    setSrc(i, 1, 2);
 
-   setAReg16(i, 1);
+   if (i->getIndirect(0, 0)) {
+      assert(!i->getIndirect(1, 0));
+      setAReg16(i, 0);
+   } else {
+      setAReg16(i, 1);
+   }
 }
 
 // default short form (rr, ar, rc, gr)
@@ -602,8 +612,11 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)
 
    switch (sf) {
    case FILE_SHADER_INPUT:
-      // use 'mov' where we can
-      code[0] = i->src(0).isIndirect(0) ? 0x00000001 : 0x10000001;
+      if (progType == Program::TYPE_GEOMETRY)
+         code[0] = 0x11800001;
+      else
+         // use 'mov' where we can
+         code[0] = i->src(0).isIndirect(0) ? 0x00000001 : 0x10000001;
       code[1] = 0x00200000 | (i->lanes << 14);
       if (typeSizeof(i->dType) == 4)
          code[1] |= 0x04000000;
@@ -1399,8 +1412,8 @@ CodeEmitterNV50::emitShift(const Instruction *i)
 void
 CodeEmitterNV50::emitOUT(const Instruction *i)
 {
-   code[0] = (i->op == OP_EMIT) ? 0xf0000200 : 0xf0000400;
-   code[1] = 0xc0000001;
+   code[0] = (i->op == OP_EMIT) ? 0xf0000201 : 0xf0000401;
+   code[1] = 0xc0000000;
 
    emitFlagsRd(i);
 }
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index 97857d7..78a12e3 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -358,6 +358,22 @@ nv50_program_translate(struct nv50_program *prog, uint16_t chipset)
       }
       if (info->prop.fp.usesDiscard)
          prog->fp.flags[0] |= NV50_3D_FP_CONTROL_USES_KIL;
+   } else
+   if (prog->type == PIPE_SHADER_GEOMETRY) {
+      switch (info->prop.gp.outputPrim) {
+      case PIPE_PRIM_LINE_STRIP:
+         prog->gp.prim_type = NV50_3D_GP_OUTPUT_PRIMITIVE_TYPE_LINE_STRIP;
+         break;
+      case PIPE_PRIM_TRIANGLE_STRIP:
+         prog->gp.prim_type = NV50_3D_GP_OUTPUT_PRIMITIVE_TYPE_TRIANGLE_STRIP;
+         break;
+      case PIPE_PRIM_POINTS:
+      default:
+         assert(info->prop.gp.outputPrim == PIPE_PRIM_POINTS);
+         prog->gp.prim_type = NV50_3D_GP_OUTPUT_PRIMITIVE_TYPE_POINTS;
+         break;
+      }
+      prog->gp.vert_count = info->prop.gp.maxVertices;
    }
 
    if (prog->pipe.stream_output.num_outputs)
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index 9144fc4..ba4f592 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
@@ -193,6 +193,8 @@ nv50_gmtyprog_validate(struct nv50_context *nv50)
    struct nv50_program *gp = nv50->gmtyprog;
 
    if (gp) {
+      if (!nv50_program_validate(nv50, gp))
+         return;
       BEGIN_NV04(push, NV50_3D(GP_REG_ALLOC_TEMP), 1);
       PUSH_DATA (push, gp->max_gpr);
       BEGIN_NV04(push, NV50_3D(GP_REG_ALLOC_RESULT), 1);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_tex.c b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
index f7284fa..6663a61 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
@@ -293,6 +293,7 @@ void nv50_validate_textures(struct nv50_context *nv50)
    boolean need_flush;
 
    need_flush  = nv50_validate_tic(nv50, 0);
+   need_flush |= nv50_validate_tic(nv50, 1);
    need_flush |= nv50_validate_tic(nv50, 2);
 
    if (need_flush) {
@@ -343,6 +344,7 @@ void nv50_validate_samplers(struct nv50_context *nv50)
    boolean need_flush;
 
    need_flush  = nv50_validate_tsc(nv50, 0);
+   need_flush |= nv50_validate_tsc(nv50, 1);
    need_flush |= nv50_validate_tsc(nv50, 2);
 
    if (need_flush) {
-- 
1.8.3.2
