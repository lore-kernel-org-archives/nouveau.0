From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 4/4] nv30: remove nv30_context use from nvfx_*prog
Date: Fri, 21 Feb 2014 02:37:13 -0500
Message-ID: <1392968233-26889-4-git-send-email-imirkin@alum.mit.edu>
References: <1392968233-26889-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392968233-26889-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This should pave the way to being able to use the compiler without a
context. Also leads to cleaner code.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

So... there was a bit of an oops on this patch, I realized that NOUVEAU_ERR
was supplied in silly places and decided to move it to a shared
nouveau_debug. Ideally this would have been a separate patch, but I did things
in the wrong order, and it's a pain to split it. Let me know if you _really_
want that, and I'll do it, but I'd rather not.

It's not really great that nvfx_*prog relies on nv30_*prog, but... wtvr. Not a
huge deal. This patch sets up nvfx to be plug-in-able into nouveau_compiler.

 src/gallium/drivers/nouveau/codegen/nv50_ir.cpp  |  2 +-
 src/gallium/drivers/nouveau/nouveau_debug.h      | 25 +++++++++
 src/gallium/drivers/nouveau/nv30/nv30_context.c  |  3 --
 src/gallium/drivers/nouveau/nv30/nv30_context.h  | 10 ----
 src/gallium/drivers/nouveau/nv30/nv30_fragprog.c |  2 +-
 src/gallium/drivers/nouveau/nv30/nv30_screen.h   |  4 +-
 src/gallium/drivers/nouveau/nv30/nv30_vertprog.c |  3 +-
 src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c | 65 +++++++++++++-----------
 src/gallium/drivers/nouveau/nv30/nvfx_shader.h   | 12 ++++-
 src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c | 62 +++++++++++-----------
 src/gallium/drivers/nouveau/nv50/nv50_context.h  |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_debug.h    | 25 ---------
 src/gallium/drivers/nouveau/nvc0/nvc0_context.h  |  2 +-
 13 files changed, 110 insertions(+), 107 deletions(-)
 create mode 100644 src/gallium/drivers/nouveau/nouveau_debug.h
 delete mode 100644 src/gallium/drivers/nouveau/nv50/nv50_debug.h

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
index 90fb51c..a24a66c 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
@@ -25,8 +25,8 @@
 #include "codegen/nv50_ir_driver.h"
 
 extern "C" {
+#include "nouveau_debug.h"
 #include "nv50/nv50_program.h"
-#include "nv50/nv50_debug.h"
 }
 
 namespace nv50_ir {
diff --git a/src/gallium/drivers/nouveau/nouveau_debug.h b/src/gallium/drivers/nouveau/nouveau_debug.h
new file mode 100644
index 0000000..d17df81
--- /dev/null
+++ b/src/gallium/drivers/nouveau/nouveau_debug.h
@@ -0,0 +1,25 @@
+
+#ifndef __NOUVEAU_DEBUG_H__
+#define __NOUVEAU_DEBUG_H__
+
+#include <stdio.h>
+
+#include "util/u_debug.h"
+
+#define NOUVEAU_DEBUG_MISC       0x0001
+#define NOUVEAU_DEBUG_SHADER     0x0100
+#define NOUVEAU_DEBUG_PROG_IR    0x0200
+#define NOUVEAU_DEBUG_PROG_RA    0x0400
+#define NOUVEAU_DEBUG_PROG_CFLOW 0x0800
+#define NOUVEAU_DEBUG_PROG_ALL   0x1f00
+
+#define NOUVEAU_DEBUG 0
+
+#define NOUVEAU_ERR(fmt, args...)                                 \
+   fprintf(stderr, "%s:%d - "fmt, __FUNCTION__, __LINE__, ##args)
+
+#define NOUVEAU_DBG(ch, args...)           \
+   if ((NOUVEAU_DEBUG) & (NOUVEAU_DEBUG_##ch))        \
+      debug_printf(args)
+
+#endif /* __NOUVEAU_DEBUG_H__ */
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.c b/src/gallium/drivers/nouveau/nv30/nv30_context.c
index 4a4538c..f325c5c 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.c
@@ -233,9 +233,6 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
    if (debug_get_bool_option("NV30_SWTNL", FALSE))
       nv30->draw_flags |= NV30_NEW_SWTNL;
 
-   /*XXX: nvfx... */
-   nv30->is_nv4x = (screen->eng3d->oclass >= NV40_3D_CLASS) ? ~0 : 0;
-
    nv30->sample_mask = 0xffff;
    nv30_vbo_init(pipe);
    nv30_query_init(pipe);
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.h b/src/gallium/drivers/nouveau/nv30/nv30_context.h
index 6dfab38..7b32aae 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.h
@@ -122,9 +122,6 @@ struct nv30_context {
    struct pipe_query *render_cond_query;
    unsigned render_cond_mode;
    boolean render_cond_cond;
-
-   /*XXX: nvfx state, DO NOT USE EVER OUTSIDE "STOLEN" NVFX code */
-   unsigned is_nv4x;
 };
 
 static INLINE struct nv30_context *
@@ -212,13 +209,6 @@ nv30_state_validate(struct nv30_context *nv30, boolean hwtnl);
 void
 nv30_state_release(struct nv30_context *nv30);
 
-//XXX: needed to make it build, clean this up!
-void
-_nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp);
-
-boolean
-_nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp);
-
 #ifdef NV30_3D_VERTEX_BEGIN_END
 #define NV30_PRIM_GL_CASE(n) \
    case PIPE_PRIM_##n: return NV30_3D_VERTEX_BEGIN_END_##n
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c b/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c
index 3551645..a05bfe1 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c
@@ -67,7 +67,7 @@ nv30_fragprog_validate(struct nv30_context *nv30)
    int i;
 
    if (!fp->translated) {
-      _nvfx_fragprog_translate(nv30, fp);
+      _nvfx_fragprog_translate(eng3d->oclass, fp);
       if (!fp->translated)
          return;
 
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.h b/src/gallium/drivers/nouveau/nv30/nv30_screen.h
index c4c3aae..0b3bbbb 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.h
@@ -3,11 +3,9 @@
 
 #include <stdio.h>
 
-#define NOUVEAU_ERR(fmt, args...) \
-   fprintf(stderr, "%s:%d -  "fmt, __FUNCTION__, __LINE__, ##args);
-
 #include "util/u_double_list.h"
 
+#include "nouveau_debug.h"
 #include "nouveau_screen.h"
 #include "nouveau_fence.h"
 #include "nouveau_heap.h"
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_vertprog.c b/src/gallium/drivers/nouveau/nv30/nv30_vertprog.c
index 7bf05dd..3c1b7e7 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_vertprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_vertprog.c
@@ -29,6 +29,7 @@
 #include "nv_object.xml.h"
 #include "nv30/nv30-40_3d.xml.h"
 #include "nv30/nv30_context.h"
+#include "nv30/nvfx_shader.h"
 #include "nv30/nv30_state.h"
 
 static void
@@ -75,7 +76,7 @@ nv30_vertprog_validate(struct nv30_context *nv30)
    }
 
    if (!vp->translated) {
-      vp->translated = _nvfx_vertprog_translate(nv30, vp);
+      vp->translated = _nvfx_vertprog_translate(eng3d->oclass, vp);
       if (!vp->translated) {
          nv30->draw_flags |= NV30_NEW_VERTPROG;
          return;
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
index bee23eb..4955226 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
@@ -2,6 +2,7 @@
 #include "pipe/p_context.h"
 #include "pipe/p_defines.h"
 #include "pipe/p_state.h"
+#include "util/u_dynarray.h"
 #include "util/u_linkage.h"
 #include "util/u_inlines.h"
 #include "util/u_debug.h"
@@ -12,9 +13,11 @@
 #include "tgsi/tgsi_dump.h"
 #include "tgsi/tgsi_ureg.h"
 
+#include "nouveau_debug.h"
+#include "nv_object.xml.h"
 #include "nv30/nv30-40_3d.xml.h"
-#include "nv30/nv30_context.h"
 #include "nv30/nvfx_shader.h"
+#include "nv30/nv30_state.h"
 
 struct nvfx_fpc {
    struct nv30_fragprog *fp;
@@ -30,6 +33,7 @@ struct nvfx_fpc {
 
    unsigned inst_offset;
    unsigned have_const;
+   unsigned is_nv4x;
 
    struct util_dynarray imm_data;
 
@@ -437,7 +441,7 @@ tgsi_mask(uint tgsi)
 }
 
 static boolean
-nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
+nvfx_fragprog_parse_instruction(struct nvfx_fpc *fpc,
             const struct tgsi_full_instruction *finst)
 {
    const struct nvfx_src none = nvfx_src(nvfx_reg(NVFXSR_NONE, 0));
@@ -621,7 +625,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       nvfx_fp_emit(fpc, arith(sat, LG2, dst, mask, src[0], none, none));
       break;
    case TGSI_OPCODE_LIT:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          nvfx_fp_emit(fpc, arith(sat, LIT_NV30, dst, mask, src[0], none, none));
       else {
          /* we use FLT_MIN, so that log2 never gives -infinity, and thus multiplication by
@@ -642,7 +646,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       }
       break;
    case TGSI_OPCODE_LRP:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          nvfx_fp_emit(fpc, arith(sat, LRP_NV30, dst, mask, src[0], src[1], src[2]));
       else {
          tmp = nvfx_src(temp(fpc));
@@ -668,7 +672,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_NOP:
       break;
    case TGSI_OPCODE_POW:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          nvfx_fp_emit(fpc, arith(sat, POW_NV30, dst, mask, src[0], src[1], none));
       else {
          tmp = nvfx_src(temp(fpc));
@@ -681,7 +685,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       nvfx_fp_emit(fpc, arith(sat, RCP, dst, mask, src[0], none, none));
       break;
    case TGSI_OPCODE_RFL:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          nvfx_fp_emit(fpc, arith(0, RFL_NV30, dst, mask, src[0], src[1], none));
       else {
          tmp = nvfx_src(temp(fpc));
@@ -694,7 +698,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       }
       break;
    case TGSI_OPCODE_RSQ:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          nvfx_fp_emit(fpc, arith(sat, RSQ_NV30, dst, mask, abs(swz(src[0], X, X, X, X)), none, none));
       else {
          tmp = nvfx_src(temp(fpc));
@@ -790,7 +794,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
                 nvfx_fp_emit(fpc, tex(sat, TXB, unit, dst, mask, src[0], none, none));
                 break;
         case TGSI_OPCODE_TXL:
-                if(nvfx->is_nv4x)
+                if(fpc->is_nv4x)
                         nvfx_fp_emit(fpc, tex(sat, TXL_NV40, unit, dst, mask, src[0], none, none));
                 else /* unsupported on nv30, use TEX and hope they like it */
                         nvfx_fp_emit(fpc, tex(sat, TEX, unit, dst, mask, src[0], none, none));
@@ -807,7 +811,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_IF:
       // MOVRC0 R31 (TR0.xyzw), R<src>:
       // IF (NE.xxxx) ELSE <else> END <end>
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_if(fpc, src[0]);
       break;
@@ -815,7 +819,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_ELSE:
    {
       uint32_t *hw;
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       assert(util_dynarray_contains(&fpc->if_stack, unsigned));
       hw = &fpc->fp->insn[util_dynarray_top(&fpc->if_stack, unsigned)];
@@ -826,7 +830,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_ENDIF:
    {
       uint32_t *hw;
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       assert(util_dynarray_contains(&fpc->if_stack, unsigned));
       hw = &fpc->fp->insn[util_dynarray_pop(&fpc->if_stack, unsigned)];
@@ -849,19 +853,19 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       break;
 
    case TGSI_OPCODE_CAL:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_cal(fpc, finst->Label.Label);
       break;
 
    case TGSI_OPCODE_RET:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_ret(fpc);
       break;
 
    case TGSI_OPCODE_BGNLOOP:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       /* TODO: we should support using two nested REPs to allow a > 255 iteration count */
       nv40_fp_rep(fpc, 255, finst->Label.Label);
@@ -871,7 +875,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       break;
 
    case TGSI_OPCODE_BRK:
-      if(!nvfx->is_nv4x)
+      if(!fpc->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_brk(fpc);
       break;
@@ -908,7 +912,7 @@ nv3x_cflow:
 }
 
 static boolean
-nvfx_fragprog_parse_decl_input(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
+nvfx_fragprog_parse_decl_input(struct nvfx_fpc *fpc,
                                const struct tgsi_full_declaration *fdec)
 {
    unsigned idx = fdec->Range.First;
@@ -948,10 +952,10 @@ nvfx_fragprog_parse_decl_input(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
 }
 
 static boolean
-nvfx_fragprog_assign_generic(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
+nvfx_fragprog_assign_generic(struct nvfx_fpc *fpc,
                              const struct tgsi_full_declaration *fdec)
 {
-   unsigned num_texcoords = nvfx->is_nv4x ? 10 : 8;
+   unsigned num_texcoords = fpc->is_nv4x ? 10 : 8;
    unsigned idx = fdec->Range.First;
    unsigned hw;
 
@@ -984,7 +988,7 @@ nvfx_fragprog_assign_generic(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
 }
 
 static boolean
-nvfx_fragprog_parse_decl_output(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
+nvfx_fragprog_parse_decl_output(struct nvfx_fpc *fpc,
             const struct tgsi_full_declaration *fdec)
 {
    unsigned idx = fdec->Range.First;
@@ -1002,7 +1006,7 @@ nvfx_fragprog_parse_decl_output(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       case 2: hw = 3; break;
       case 3: hw = 4; break;
       }
-      if(hw > ((nvfx->is_nv4x) ? 4 : 2)) {
+      if(hw > ((fpc->is_nv4x) ? 4 : 2)) {
          NOUVEAU_ERR("bad rcol index\n");
          return FALSE;
       }
@@ -1018,7 +1022,7 @@ nvfx_fragprog_parse_decl_output(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
 }
 
 static boolean
-nvfx_fragprog_prepare(struct nv30_context* nvfx, struct nvfx_fpc *fpc)
+nvfx_fragprog_prepare(struct nvfx_fpc *fpc)
 {
    struct tgsi_parse_context p;
    int high_temp = -1, i;
@@ -1037,11 +1041,11 @@ nvfx_fragprog_prepare(struct nv30_context* nvfx, struct nvfx_fpc *fpc)
          fdec = &p.FullToken.FullDeclaration;
          switch (fdec->Declaration.File) {
          case TGSI_FILE_INPUT:
-            if (!nvfx_fragprog_parse_decl_input(nvfx, fpc, fdec))
+            if (!nvfx_fragprog_parse_decl_input(fpc, fdec))
                goto out_err;
             break;
          case TGSI_FILE_OUTPUT:
-            if (!nvfx_fragprog_parse_decl_output(nvfx, fpc, fdec))
+            if (!nvfx_fragprog_parse_decl_output(fpc, fdec))
                goto out_err;
             break;
          case TGSI_FILE_TEMPORARY:
@@ -1081,7 +1085,7 @@ nvfx_fragprog_prepare(struct nv30_context* nvfx, struct nvfx_fpc *fpc)
          fdec = &p.FullToken.FullDeclaration;
          switch (fdec->Declaration.File) {
          case TGSI_FILE_INPUT:
-            if (!nvfx_fragprog_assign_generic(nvfx, fpc, fdec))
+            if (!nvfx_fragprog_assign_generic(fpc, fdec))
                goto out_err;
             break;
          default:
@@ -1114,7 +1118,7 @@ out_err:
 DEBUG_GET_ONCE_BOOL_OPTION(nvfx_dump_fp, "NVFX_DUMP_FP", FALSE)
 
 void
-_nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
+_nvfx_fragprog_translate(uint16_t oclass, struct nv30_fragprog *fp)
 {
    struct tgsi_parse_context parse;
    struct nvfx_fpc *fpc = NULL;
@@ -1128,7 +1132,8 @@ _nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
    if (!fpc)
       goto out_err;
 
-   fpc->max_temps = nvfx->is_nv4x ? 48 : 32;
+   fpc->is_nv4x = (oclass >= NV40_3D_CLASS) ? ~0 : 0;
+   fpc->max_temps = fpc->is_nv4x ? 48 : 32;
    fpc->fp = fp;
    fpc->num_regs = 2;
    memset(fp->texcoord, 0xff, sizeof(fp->texcoord));
@@ -1152,7 +1157,7 @@ _nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
       }
    }
 
-   if (!nvfx_fragprog_prepare(nvfx, fpc))
+   if (!nvfx_fragprog_prepare(fpc))
       goto out_err;
 
    tgsi_parse_init(&parse, fp->pipe.tokens);
@@ -1168,7 +1173,7 @@ _nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
 
          util_dynarray_append(&insns, unsigned, fp->insn_len);
          finst = &parse.FullToken.FullInstruction;
-         if (!nvfx_fragprog_parse_instruction(nvfx, fpc, finst))
+         if (!nvfx_fragprog_parse_instruction(fpc, finst))
             goto out_err;
       }
          break;
@@ -1185,7 +1190,7 @@ _nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
    }
    util_dynarray_fini(&insns);
 
-   if(!nvfx->is_nv4x)
+   if(!fpc->is_nv4x)
       fp->fp_control |= (fpc->num_regs-1)/2;
    else
       fp->fp_control |= fpc->num_regs << NV40_3D_FP_CONTROL_TEMP_COUNT__SHIFT;
@@ -1207,7 +1212,7 @@ _nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
       debug_printf("\n");
       tgsi_dump(fp->pipe.tokens, 0);
 
-      debug_printf("\n%s fragment program:\n", nvfx->is_nv4x ? "nv4x" : "nv3x");
+      debug_printf("\n%s fragment program:\n", fpc->is_nv4x ? "nv4x" : "nv3x");
       for (unsigned i = 0; i < fp->insn_len; i += 4)
          debug_printf("%3u: %08x %08x %08x %08x\n", i >> 2, fp->insn[i], fp->insn[i + 1], fp->insn[i + 2], fp->insn[i + 3]);
       debug_printf("\n");
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_shader.h b/src/gallium/drivers/nouveau/nv30/nvfx_shader.h
index 987e1b0..9538a79 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_shader.h
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_shader.h
@@ -10,7 +10,7 @@
 /* this will resolve to either the NV30 or the NV40 version
  * depending on the current hardware */
 /* unusual, but very fast and compact method */
-#define NVFX_VP(c) ((NV30_VP_##c) + (nv30->is_nv4x & ((NV40_VP_##c) - (NV30_VP_##c))))
+#define NVFX_VP(c) ((NV30_VP_##c) + (vpc->is_nv4x & ((NV40_VP_##c) - (NV30_VP_##c))))
 
 #define NVFX_VP_INST_SLOT_VEC 0
 #define NVFX_VP_INST_SLOT_SCA 1
@@ -522,4 +522,14 @@ struct nvfx_relocation {
         unsigned target;
 };
 
+struct nv30_fragprog;
+struct nv30_vertprog;
+
+//XXX: needed to make it build, clean this up!
+void
+_nvfx_fragprog_translate(uint16_t oclass, struct nv30_fragprog *fp);
+
+boolean
+_nvfx_vertprog_translate(uint16_t oclass, struct nv30_vertprog *vp);
+
 #endif
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c b/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c
index 7642c5e..8da2c0c 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c
@@ -1,6 +1,7 @@
 #include "pipe/p_context.h"
 #include "pipe/p_defines.h"
 #include "pipe/p_state.h"
+#include "util/u_dynarray.h"
 #include "util/u_linkage.h"
 #include "util/u_debug.h"
 
@@ -12,9 +13,10 @@
 
 #include "draw/draw_context.h"
 
+#include "nv_object.xml.h"
+#include "nouveau_debug.h"
 #include "nv30/nv30-40_3d.xml.h"
-#include "nv30/nv30_context.h"
-#include "nv30/nv30_resource.h"
+#include "nv30/nv30_state.h"
 
 /* TODO (at least...):
  *  1. Indexed consts  + ARL
@@ -36,7 +38,6 @@ struct nvfx_loop_entry {
 };
 
 struct nvfx_vpc {
-   struct nv30_context* nv30;
    struct pipe_shader_state pipe;
    struct nv30_vertprog *vp;
    struct tgsi_shader_info* info;
@@ -57,6 +58,8 @@ struct nvfx_vpc {
    int hpos_idx;
    int cvtx_idx;
 
+   unsigned is_nv4x;
+
    struct util_dynarray label_relocs;
    struct util_dynarray loop_stack;
 };
@@ -114,7 +117,7 @@ constant(struct nvfx_vpc *vpc, int pipe, float x, float y, float z, float w)
    nvfx_insn((s), (NVFX_VP_INST_SLOT_##t << 7) | NVFX_VP_INST_##t##_OP_##o, -1, (d), (m), (s0), (s1), (s2))
 
 static void
-emit_src(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
+emit_src(struct nvfx_vpc *vpc, uint32_t *hw,
          int pos, struct nvfx_src src)
 {
    struct nv30_vertprog *vp = vpc->vp;
@@ -198,14 +201,14 @@ emit_src(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
 }
 
 static void
-emit_dst(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
+emit_dst(struct nvfx_vpc *vpc, uint32_t *hw,
          int slot, struct nvfx_reg dst)
 {
    struct nv30_vertprog *vp = vpc->vp;
 
    switch (dst.type) {
    case NVFXSR_NONE:
-      if(!nv30->is_nv4x)
+      if(!vpc->is_nv4x)
          hw[0] |= NV30_VP_INST_DEST_TEMP_ID_MASK;
       else {
          hw[3] |= NV40_VP_INST_DEST_MASK;
@@ -216,7 +219,7 @@ emit_dst(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
       }
       break;
    case NVFXSR_TEMP:
-      if(!nv30->is_nv4x)
+      if(!vpc->is_nv4x)
          hw[0] |= (dst.index << NV30_VP_INST_DEST_TEMP_ID_SHIFT);
       else {
          hw[3] |= NV40_VP_INST_DEST_MASK;
@@ -228,7 +231,7 @@ emit_dst(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
       break;
    case NVFXSR_OUTPUT:
       /* TODO: this may be wrong because on nv30 COL0 and BFC0 are swapped */
-      if(nv30->is_nv4x) {
+      if(vpc->is_nv4x) {
          switch (dst.index) {
          case NV30_VP_INST_DEST_CLP(0):
             dst.index = NVFX_VP(INST_DEST_FOGC);
@@ -263,7 +266,7 @@ emit_dst(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
          }
       }
 
-      if(!nv30->is_nv4x) {
+      if(!vpc->is_nv4x) {
          hw[3] |= (dst.index << NV30_VP_INST_DEST_SHIFT);
          hw[0] |= NV30_VP_INST_VEC_DEST_TEMP_MASK;
 
@@ -290,7 +293,6 @@ emit_dst(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
 static void
 nvfx_vp_emit(struct nvfx_vpc *vpc, struct nvfx_insn insn)
 {
-   struct nv30_context *nv30 = vpc->nv30;
    struct nv30_vertprog *vp = vpc->vp;
    unsigned slot = insn.op >> 7;
    unsigned op = insn.op & 0x7f;
@@ -313,12 +315,12 @@ nvfx_vp_emit(struct nvfx_vpc *vpc, struct nvfx_insn insn)
       hw[0] |= NVFX_VP(INST_COND_UPDATE_ENABLE);
 
    if(insn.sat) {
-      assert(nv30->is_nv4x);
-      if(nv30->is_nv4x)
+      assert(vpc->is_nv4x);
+      if(vpc->is_nv4x)
          hw[0] |= NV40_VP_INST_SATURATE;
    }
 
-   if(!nv30->is_nv4x) {
+   if(!vpc->is_nv4x) {
       if(slot == 0)
          hw[1] |= (op << NV30_VP_INST_VEC_OPCODE_SHIFT);
       else {
@@ -351,10 +353,10 @@ nvfx_vp_emit(struct nvfx_vpc *vpc, struct nvfx_insn insn)
       }
    }
 
-   emit_dst(nv30, vpc, hw, slot, insn.dst);
-   emit_src(nv30, vpc, hw, 0, insn.src[0]);
-   emit_src(nv30, vpc, hw, 1, insn.src[1]);
-   emit_src(nv30, vpc, hw, 2, insn.src[2]);
+   emit_dst(vpc, hw, slot, insn.dst);
+   emit_src(vpc, hw, 0, insn.src[0]);
+   emit_src(vpc, hw, 1, insn.src[1]);
+   emit_src(vpc, hw, 2, insn.src[2]);
 
 //   if(insn.src[0].indirect || op == NVFX_VP_INST_VEC_OP_ARL)
 //      hw[3] |= NV40_VP_INST_SCA_RESULT;
@@ -455,7 +457,7 @@ tgsi_mask(uint tgsi)
 }
 
 static boolean
-nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
+nvfx_vertprog_parse_instruction(struct nvfx_vpc *vpc,
             unsigned idx, const struct tgsi_full_instruction *finst)
 {
    struct nvfx_src src[3], tmp;
@@ -540,7 +542,7 @@ nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
    mask = tgsi_mask(finst->Dst[0].Register.WriteMask);
    if(finst->Instruction.Saturate == TGSI_SAT_ZERO_ONE) {
       assert(finst->Instruction.Opcode != TGSI_OPCODE_ARL);
-      if (nv30->is_nv4x)
+      if (vpc->is_nv4x)
          sat = TRUE;
       else
       if(dst.type != NVFXSR_TEMP)
@@ -802,7 +804,7 @@ nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
       return FALSE;
    }
 
-   if(finst->Instruction.Saturate == TGSI_SAT_ZERO_ONE && !nv30->is_nv4x) {
+   if(finst->Instruction.Saturate == TGSI_SAT_ZERO_ONE && !vpc->is_nv4x) {
       if (!vpc->r_0_1.type)
          vpc->r_0_1 = constant(vpc, -1, 0, 1, 0, 0);
       nvfx_vp_emit(vpc, arith(0, VEC, MAX, dst, mask, nvfx_src(dst), swz(nvfx_src(vpc->r_0_1), X, X, X, X), none));
@@ -814,10 +816,10 @@ nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
 }
 
 static boolean
-nvfx_vertprog_parse_decl_output(struct nv30_context *nv30, struct nvfx_vpc *vpc,
+nvfx_vertprog_parse_decl_output(struct nvfx_vpc *vpc,
                                 const struct tgsi_full_declaration *fdec)
 {
-   unsigned num_texcoords = nv30->is_nv4x ? 10 : 8;
+   unsigned num_texcoords = vpc->is_nv4x ? 10 : 8;
    unsigned idx = fdec->Range.First;
    unsigned semantic_index = fdec->Semantic.Index;
    int hw = 0, i;
@@ -891,7 +893,7 @@ nvfx_vertprog_parse_decl_output(struct nv30_context *nv30, struct nvfx_vpc *vpc,
 }
 
 static boolean
-nvfx_vertprog_prepare(struct nv30_context *nv30, struct nvfx_vpc *vpc)
+nvfx_vertprog_prepare(struct nvfx_vpc *vpc)
 {
    struct tgsi_parse_context p;
    int high_const = -1, high_temp = -1, high_addr = -1, nr_imm = 0, i;
@@ -930,7 +932,7 @@ nvfx_vertprog_prepare(struct nv30_context *nv30, struct nvfx_vpc *vpc)
             }
             break;
          case TGSI_FILE_OUTPUT:
-            if (!nvfx_vertprog_parse_decl_output(nv30, vpc, fdec))
+            if (!nvfx_vertprog_parse_decl_output(vpc, fdec))
                return FALSE;
             break;
          default:
@@ -974,7 +976,7 @@ nvfx_vertprog_prepare(struct nv30_context *nv30, struct nvfx_vpc *vpc)
 DEBUG_GET_ONCE_BOOL_OPTION(nvfx_dump_vp, "NVFX_DUMP_VP", FALSE)
 
 boolean
-_nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp)
+_nvfx_vertprog_translate(uint16_t oclass, struct nv30_vertprog *vp)
 {
    struct tgsi_parse_context parse;
    struct nvfx_vpc *vpc = NULL;
@@ -989,13 +991,13 @@ _nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp)
    vpc = CALLOC_STRUCT(nvfx_vpc);
    if (!vpc)
       return FALSE;
-   vpc->nv30 = nv30;
+   vpc->is_nv4x = (oclass >= NV40_3D_CLASS) ? ~0 : 0;
    vpc->vp   = vp;
    vpc->pipe = vp->pipe;
    vpc->info = &vp->info;
    vpc->cvtx_idx = -1;
 
-   if (!nvfx_vertprog_prepare(nv30, vpc)) {
+   if (!nvfx_vertprog_prepare(vpc)) {
       FREE(vpc);
       return FALSE;
    }
@@ -1038,7 +1040,7 @@ _nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp)
          unsigned idx = insns.size >> 2;
          util_dynarray_append(&insns, unsigned, vp->nr_insns);
          finst = &parse.FullToken.FullInstruction;
-         if (!nvfx_vertprog_parse_instruction(nv30, vpc, idx, finst))
+         if (!nvfx_vertprog_parse_instruction(vpc, idx, finst))
             goto out;
       }
          break;
@@ -1084,7 +1086,7 @@ _nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp)
       struct nvfx_src htmp = nvfx_src(vpc->r_result[vpc->cvtx_idx]);
       unsigned mask;
 
-      if(nv30->is_nv4x)
+      if(vpc->is_nv4x)
       {
          switch (i) {
          case 0: case 3: mask = NVFX_VP_MASK_Y; break;
@@ -1109,7 +1111,7 @@ _nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp)
       debug_printf("\n");
       tgsi_dump(vpc->pipe.tokens, 0);
 
-      debug_printf("\n%s vertex program:\n", nv30->is_nv4x ? "nv4x" : "nv3x");
+      debug_printf("\n%s vertex program:\n", vpc->is_nv4x ? "nv4x" : "nv3x");
       for (i = 0; i < vp->nr_insns; i++)
          debug_printf("%3u: %08x %08x %08x %08x\n", i, vp->insns[i].data[0], vp->insns[i].data[1], vp->insns[i].data[2], vp->insns[i].data[3]);
       debug_printf("\n");
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index 84ff46e..32ca591 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -14,7 +14,6 @@
 #include "draw/draw_vertex.h"
 #endif
 
-#include "nv50/nv50_debug.h"
 #include "nv50/nv50_winsys.h"
 #include "nv50/nv50_stateobj.h"
 #include "nv50/nv50_screen.h"
@@ -23,6 +22,7 @@
 #include "nv50/nv50_transfer.h"
 
 #include "nouveau_context.h"
+#include "nouveau_debug.h"
 #include "nv_object.xml.h"
 #include "nv_m2mf.xml.h"
 #include "nv50/nv50_3ddefs.xml.h"
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_debug.h b/src/gallium/drivers/nouveau/nv50/nv50_debug.h
deleted file mode 100644
index f3dee62..0000000
--- a/src/gallium/drivers/nouveau/nv50/nv50_debug.h
+++ /dev/null
@@ -1,25 +0,0 @@
-
-#ifndef __NV50_DEBUG_H__
-#define __NV50_DEBUG_H__
-
-#include <stdio.h>
-
-#include "util/u_debug.h"
-
-#define NV50_DEBUG_MISC       0x0001
-#define NV50_DEBUG_SHADER     0x0100
-#define NV50_DEBUG_PROG_IR    0x0200
-#define NV50_DEBUG_PROG_RA    0x0400
-#define NV50_DEBUG_PROG_CFLOW 0x0800
-#define NV50_DEBUG_PROG_ALL   0x1f00
-
-#define NV50_DEBUG 0
-
-#define NOUVEAU_ERR(fmt, args...)                                 \
-   fprintf(stderr, "%s:%d - "fmt, __FUNCTION__, __LINE__, ##args)
-
-#define NV50_DBGMSG(ch, args...)           \
-   if ((NV50_DEBUG) & (NV50_DEBUG_##ch))        \
-      debug_printf(args)
-
-#endif /* __NV50_DEBUG_H__ */
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
index 3fbecdc..b6b5beb 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
@@ -14,7 +14,6 @@
 #include "draw/draw_vertex.h"
 #endif
 
-#include "nv50/nv50_debug.h"
 #include "nvc0/nvc0_winsys.h"
 #include "nvc0/nvc0_stateobj.h"
 #include "nvc0/nvc0_screen.h"
@@ -24,6 +23,7 @@
 #include "nv50/nv50_transfer.h"
 
 #include "nouveau_context.h"
+#include "nouveau_debug.h"
 
 #include "nvc0/nvc0_3ddefs.xml.h"
 #include "nvc0/nvc0_3d.xml.h"
-- 
1.8.3.2
