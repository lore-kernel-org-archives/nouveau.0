From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 17/19] nv50: add support for textureFetch'ing MS
	textures, ARB_texture_multisample
Date: Mon, 13 Jan 2014 14:19:33 -0500
Message-ID: <1389640775-25046-18-git-send-email-imirkin@alum.mit.edu>
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

Creates two areas in the AUX constbuf:
 - Sample offsets for MS textures
 - Per-texture MS settings

When executing a textureFetch with a MS sampler, looks up that texture's
settings and adjusts the parameters given to the texfetch instruction.

With this change, all the ARB_texture_multisample piglits pass, so turn
on PIPE_CAP_TEXTURE_MULTISAMPLE.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir.h      |  8 +++
 .../drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp  |  1 +
 .../nouveau/codegen/nv50_ir_lowering_nv50.cpp      | 60 +++++++++++++++++
 src/gallium/drivers/nouveau/nv50/nv50_context.h    | 13 +++-
 src/gallium/drivers/nouveau/nv50/nv50_program.c    |  7 +-
 src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  7 +-
 src/gallium/drivers/nouveau/nv50/nv50_tex.c        | 75 +++++++++++++++++++++-
 7 files changed, 164 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
index 6a001d3..857980d 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
@@ -827,6 +827,14 @@ public:
       int isShadow() const { return descTable[target].shadow ? 1 : 0; }
       int isMS() const {
         return target == TEX_TARGET_2D_MS || target == TEX_TARGET_2D_MS_ARRAY; }
+      void clearMS() {
+         if (isMS()) {
+            if (isArray())
+               target = TEX_TARGET_2D_ARRAY;
+            else
+               target = TEX_TARGET_2D;
+         }
+      }
 
       Target& operator=(TexTarget targ)
       {
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
index a6ed4b0..8f9b7de 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
@@ -1221,6 +1221,7 @@ CodeEmitterNV50::emitCVT(const Instruction *i)
       case TYPE_S32: code[1] = 0x44014000; break;
       case TYPE_U32: code[1] = 0x44004000; break;
       case TYPE_F16: code[1] = 0xc4000000; break;
+      case TYPE_U16: code[1] = 0x44000000; break;
       default:
          assert(0);
          break;
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index 1d13aea..984a8ca 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -549,6 +549,8 @@ private:
    bool handleCONT(Instruction *);
 
    void checkPredicate(Instruction *);
+   void loadTexMsInfo(uint32_t off, Value **ms, Value **ms_x, Value **ms_y);
+   void loadMsInfo(Value *ms, Value *s, Value **dx, Value **dy);
 
 private:
    const Target *const targ;
@@ -582,6 +584,41 @@ NV50LoweringPreSSA::visit(Function *f)
    return true;
 }
 
+void NV50LoweringPreSSA::loadTexMsInfo(uint32_t off, Value **ms,
+                                       Value **ms_x, Value **ms_y) {
+   // This loads the texture-indexed ms setting from the constant buffer
+   Value *tmp = new_LValue(func, FILE_GPR);
+   uint8_t b = prog->driver->io.resInfoCBSlot;
+   off += prog->driver->io.suInfoBase;
+   *ms_x = bld.mkLoadv(TYPE_U32, bld.mkSymbol(
+                             FILE_MEMORY_CONST, b, TYPE_U32, off + 0), NULL);
+   *ms_y = bld.mkLoadv(TYPE_U32, bld.mkSymbol(
+                             FILE_MEMORY_CONST, b, TYPE_U32, off + 4), NULL);
+   *ms = bld.mkOp2v(OP_ADD, TYPE_U32, tmp, *ms_x, *ms_y);
+}
+
+void NV50LoweringPreSSA::loadMsInfo(Value *ms, Value *s, Value **dx, Value **dy) {
+   // Given a MS level, and a sample id, compute the delta x/y
+   uint8_t b = prog->driver->io.msInfoCBSlot;
+   Value *off = new_LValue(func, FILE_ADDRESS), *t = new_LValue(func, FILE_GPR);
+
+   // The required information is at mslevel * 16 * 4 + sample * 8
+   // = (mslevel * 8 + sample) * 8
+   bld.mkOp2(OP_SHL,
+             TYPE_U32,
+             off,
+             bld.mkOp2v(OP_ADD, TYPE_U32, t,
+                        bld.mkOp2v(OP_SHL, TYPE_U32, t, ms, bld.mkImm(3)),
+                        s),
+             bld.mkImm(3));
+   *dx = bld.mkLoadv(TYPE_U32, bld.mkSymbol(
+                           FILE_MEMORY_CONST, b, TYPE_U32,
+                           prog->driver->io.msInfoBase), off);
+   *dy = bld.mkLoadv(TYPE_U32, bld.mkSymbol(
+                           FILE_MEMORY_CONST, b, TYPE_U32,
+                           prog->driver->io.msInfoBase + 4), off);
+}
+
 bool
 NV50LoweringPreSSA::handleTEX(TexInstruction *i)
 {
@@ -589,6 +626,29 @@ NV50LoweringPreSSA::handleTEX(TexInstruction *i)
    const int dref = arg;
    const int lod = i->tex.target.isShadow() ? (arg + 1) : arg;
 
+   // handle MS, which means looking up the MS params for this texture, and
+   // adjusting the input coordinates to point at the right sample.
+   if (i->tex.target.isMS()) {
+      Value *x = i->getSrc(0);
+      Value *y = i->getSrc(1);
+      Value *s = i->getSrc(arg - 1);
+      Value *tx = new_LValue(func, FILE_GPR), *ty = new_LValue(func, FILE_GPR),
+         *ms, *ms_x, *ms_y, *dx, *dy;
+
+      i->tex.target.clearMS();
+
+      loadTexMsInfo(i->tex.r * 4 * 2, &ms, &ms_x, &ms_y);
+      loadMsInfo(ms, s, &dx, &dy);
+
+      bld.mkOp2(OP_SHL, TYPE_U32, tx, x, ms_x);
+      bld.mkOp2(OP_SHL, TYPE_U32, ty, y, ms_y);
+      bld.mkOp2(OP_ADD, TYPE_U32, tx, tx, dx);
+      bld.mkOp2(OP_ADD, TYPE_U32, ty, ty, dy);
+      i->setSrc(0, tx);
+      i->setSrc(1, ty);
+      i->setSrc(arg - 1, bld.loadImm(NULL, 0));
+   }
+
    // dref comes before bias/lod
    if (i->tex.target.isShadow())
       if (i->op == OP_TXB || i->op == OP_TXL)
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index 7bf4ce3..1ce52c9 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -75,9 +75,15 @@
 /* size of the buffer: 64k. not all taken up, can be reduced if needed. */
 #define NV50_CB_AUX_SIZE          (1 << 16)
 /* 8 user clip planes, at 4 32-bit floats each */
-#define NV50_CB_AUX_UCP_OFFSET    0x0
-/* 256 textures, each with 2 16-bit integers specifying the x/y MS shift */
-#define NV50_CB_AUX_MS_OFFSET     0x80
+#define NV50_CB_AUX_UCP_OFFSET    0x0000
+#define NV50_CB_AUX_UCP_SIZE      (8 * 4 * 4)
+/* 256 textures, each with ms_x, ms_y u32 pairs */
+#define NV50_CB_AUX_TEX_MS_OFFSET 0x0080
+#define NV50_CB_AUX_TEX_MS_SIZE   (256 * 2 * 4)
+/* For each MS level (4), 8 sets of 32-bit integer pairs sample offsets */
+#define NV50_CB_AUX_MS_OFFSET     0x880
+#define NV50_CB_AUX_MS_SIZE       (4 * 8 * 4 * 2)
+/* next spot: 0x980 */
 /* 4 32-bit floats for the vertex runout, put at the end */
 #define NV50_CB_AUX_RUNOUT_OFFSET (NV50_CB_AUX_SIZE - 0x10)
 
@@ -251,6 +257,7 @@ extern void nv50_init_surface_functions(struct nv50_context *);
 /* nv50_tex.c */
 void nv50_validate_textures(struct nv50_context *);
 void nv50_validate_samplers(struct nv50_context *);
+void nv50_upload_ms_info(struct nouveau_pushbuf *);
 
 struct pipe_sampler_view *
 nv50_create_texture_view(struct pipe_context *,
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index e7609fa..73583bd 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -323,9 +323,14 @@ nv50_program_translate(struct nv50_program *prog, uint16_t chipset)
    info->bin.source = (void *)prog->pipe.tokens;
 
    info->io.ucpCBSlot = 15;
-   info->io.ucpBase = 0;
+   info->io.ucpBase = NV50_CB_AUX_UCP_OFFSET;
    info->io.genUserClip = prog->vp.clpd_nr;
 
+   info->io.resInfoCBSlot = 15;
+   info->io.suInfoBase = NV50_CB_AUX_TEX_MS_OFFSET;
+   info->io.msInfoCBSlot = 15;
+   info->io.msInfoBase = NV50_CB_AUX_MS_OFFSET;
+
    info->assignSlots = nv50_program_assign_varying_slots;
 
    prog->vp.bfc[0] = 0xff;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 9ed2d01..5732b21 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -184,8 +184,9 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_VERTEX_BUFFER_STRIDE_4BYTE_ALIGNED_ONLY:
    case PIPE_CAP_VERTEX_ELEMENT_SRC_OFFSET_4BYTE_ALIGNED_ONLY:
    case PIPE_CAP_TGSI_TEXCOORD:
-   case PIPE_CAP_TEXTURE_MULTISAMPLE:
       return 0;
+   case PIPE_CAP_TEXTURE_MULTISAMPLE:
+      return 1;
    case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
       return 1;
    case PIPE_CAP_QUERY_PIPELINE_STATISTICS:
@@ -481,7 +482,7 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
 
    /* return { 0.0, 0.0, 0.0, 0.0 } on out-of-bounds vtxbuf access */
    BEGIN_NV04(push, NV50_3D(CB_ADDR), 1);
-   PUSH_DATA (push, (NV50_CB_AUX_RUNOUT_OFFSET << 6) | NV50_CB_AUX);
+   PUSH_DATA (push, (NV50_CB_AUX_RUNOUT_OFFSET << (8 - 2)) | NV50_CB_AUX);
    BEGIN_NI04(push, NV50_3D(CB_DATA(0)), 4);
    PUSH_DATAf(push, 0.0f);
    PUSH_DATAf(push, 0.0f);
@@ -491,6 +492,8 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
    PUSH_DATAh(push, screen->uniforms->offset + (3 << 16) + NV50_CB_AUX_RUNOUT_OFFSET);
    PUSH_DATA (push, screen->uniforms->offset + (3 << 16) + NV50_CB_AUX_RUNOUT_OFFSET);
 
+   nv50_upload_ms_info(push);
+
    /* max TIC (bits 4:8) & TSC bindings, per program type */
    for (i = 0; i < 3; ++i) {
       BEGIN_NV04(push, NV50_3D(TEX_LIMITS(i)), 1);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_tex.c b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
index 6663a61..e76876d 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
@@ -143,7 +143,7 @@ nv50_create_texture_view(struct pipe_context *pipe,
          tic[2] |= NV50_TIC_2_LINEAR | NV50_TIC_2_TARGET_RECT;
          tic[3] = mt->level[0].pitch;
          tic[4] = mt->base.base.width0;
-         tic[5] = (1 << 16) | mt->base.base.height0;
+         tic[5] = (1 << 16) | (mt->base.base.height0);
       }
       tic[6] =
       tic[7] = 0;
@@ -283,6 +283,24 @@ nv50_validate_tic(struct nv50_context *nv50, int s)
       BEGIN_NV04(push, NV50_3D(BIND_TIC(s)), 1);
       PUSH_DATA (push, (i << 1) | 0);
    }
+   if (nv50->num_textures[s]) {
+      BEGIN_NV04(push, NV50_3D(CB_ADDR), 1);
+      PUSH_DATA (push, (NV50_CB_AUX_TEX_MS_OFFSET << (8 - 2)) | NV50_CB_AUX);
+      BEGIN_NI04(push, NV50_3D(CB_DATA(0)), nv50->num_textures[s] * 2);
+      for (i = 0; i < nv50->num_textures[s]; i++) {
+         struct nv50_tic_entry *tic = nv50_tic_entry(nv50->textures[s][i]);
+         struct nv50_miptree *res;
+
+         if (!tic) {
+            PUSH_DATA (push, 0);
+            PUSH_DATA (push, 0);
+            continue;
+         }
+         res = nv50_miptree(tic->pipe.texture);
+         PUSH_DATA (push, res->ms_x);
+         PUSH_DATA (push, res->ms_y);
+      }
+   }
    nv50->state.num_textures[s] = nv50->num_textures[s];
 
    return need_flush;
@@ -352,3 +370,58 @@ void nv50_validate_samplers(struct nv50_context *nv50)
       PUSH_DATA (nv50->base.pushbuf, 0);
    }
 }
+
+/* There can be up to 4 different MS levels (1, 2, 4, 8). To simplify the
+ * shader logic, allow each one to take up 8 offsets.
+ */
+#define COMBINE(x, y) x, y
+#define DUMMY 0, 0
+static const uint32_t msaa_sample_xy_offsets[] = {
+   /* MS1 */
+   COMBINE(0, 0),
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+
+   /* MS2 */
+   COMBINE(0, 0),
+   COMBINE(1, 0),
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+
+   /* MS4 */
+   COMBINE(0, 0),
+   COMBINE(1, 0),
+   COMBINE(0, 1),
+   COMBINE(1, 1),
+   DUMMY,
+   DUMMY,
+   DUMMY,
+   DUMMY,
+
+   /* MS8 */
+   COMBINE(0, 0),
+   COMBINE(1, 0),
+   COMBINE(0, 1),
+   COMBINE(1, 1),
+   COMBINE(2, 0),
+   COMBINE(3, 0),
+   COMBINE(2, 1),
+   COMBINE(3, 1),
+};
+
+void nv50_upload_ms_info(struct nouveau_pushbuf *push)
+{
+   BEGIN_NV04(push, NV50_3D(CB_ADDR), 1);
+   PUSH_DATA (push, (NV50_CB_AUX_MS_OFFSET << (8 - 2)) | NV50_CB_AUX);
+   BEGIN_NI04(push, NV50_3D(CB_DATA(0)), Elements(msaa_sample_xy_offsets));
+   PUSH_DATAp(push, msaa_sample_xy_offsets, Elements(msaa_sample_xy_offsets));
+}
-- 
1.8.3.2
