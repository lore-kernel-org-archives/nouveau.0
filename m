From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/4] nv30: remove use_nv4x,
	it is identical to is_nv4x
Date: Fri, 21 Feb 2014 02:37:10 -0500
Message-ID: <1392968233-26889-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Perhaps there was a day when those were different, but that day is not today.

 src/gallium/drivers/nouveau/nv30/nv30_context.c  |  1 -
 src/gallium/drivers/nouveau/nv30/nv30_context.h  |  1 -
 src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c | 20 ++++++++++----------
 src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c |  8 ++++----
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.c b/src/gallium/drivers/nouveau/nv30/nv30_context.c
index 2146d27..4f68eee 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.c
@@ -235,7 +235,6 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
 
    /*XXX: nvfx... */
    nv30->is_nv4x = (screen->eng3d->oclass >= NV40_3D_CLASS) ? ~0 : 0;
-   nv30->use_nv4x = (screen->eng3d->oclass >= NV40_3D_CLASS) ? ~0 : 0;
    nv30->render_mode = HW;
 
    nv30->sample_mask = 0xffff;
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.h b/src/gallium/drivers/nouveau/nv30/nv30_context.h
index 527614a..d0cb5f5 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.h
@@ -121,7 +121,6 @@ struct nv30_context {
 
    /*XXX: nvfx state, DO NOT USE EVER OUTSIDE "STOLEN" NVFX code */
    unsigned is_nv4x;
-   unsigned use_nv4x;
    bool hw_pointsprite_control;
    enum {
       HW,
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
index 4751ec8..ae4f789 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
@@ -807,7 +807,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_IF:
       // MOVRC0 R31 (TR0.xyzw), R<src>:
       // IF (NE.xxxx) ELSE <else> END <end>
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_if(fpc, src[0]);
       break;
@@ -815,7 +815,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_ELSE:
    {
       uint32_t *hw;
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       assert(util_dynarray_contains(&fpc->if_stack, unsigned));
       hw = &fpc->fp->insn[util_dynarray_top(&fpc->if_stack, unsigned)];
@@ -826,7 +826,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
    case TGSI_OPCODE_ENDIF:
    {
       uint32_t *hw;
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       assert(util_dynarray_contains(&fpc->if_stack, unsigned));
       hw = &fpc->fp->insn[util_dynarray_pop(&fpc->if_stack, unsigned)];
@@ -849,19 +849,19 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       break;
 
    case TGSI_OPCODE_CAL:
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_cal(fpc, finst->Label.Label);
       break;
 
    case TGSI_OPCODE_RET:
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_ret(fpc);
       break;
 
    case TGSI_OPCODE_BGNLOOP:
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       /* TODO: we should support using two nested REPs to allow a > 255 iteration count */
       nv40_fp_rep(fpc, 255, finst->Label.Label);
@@ -871,7 +871,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       break;
 
    case TGSI_OPCODE_BRK:
-      if(!nvfx->use_nv4x)
+      if(!nvfx->is_nv4x)
          goto nv3x_cflow;
       nv40_fp_brk(fpc);
       break;
@@ -951,7 +951,7 @@ static boolean
 nvfx_fragprog_assign_generic(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
                              const struct tgsi_full_declaration *fdec)
 {
-   unsigned num_texcoords = nvfx->use_nv4x ? 10 : 8;
+   unsigned num_texcoords = nvfx->is_nv4x ? 10 : 8;
    unsigned idx = fdec->Range.First;
    unsigned hw;
 
@@ -1002,7 +1002,7 @@ nvfx_fragprog_parse_decl_output(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       case 2: hw = 3; break;
       case 3: hw = 4; break;
       }
-      if(hw > ((nvfx->use_nv4x) ? 4 : 2)) {
+      if(hw > ((nvfx->is_nv4x) ? 4 : 2)) {
          NOUVEAU_ERR("bad rcol index\n");
          return FALSE;
       }
@@ -1129,7 +1129,7 @@ _nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp,
    if (!fpc)
       goto out_err;
 
-   fpc->max_temps = nvfx->use_nv4x ? 48 : 32;
+   fpc->max_temps = nvfx->is_nv4x ? 48 : 32;
    fpc->fp = fp;
    fpc->num_regs = 2;
    memset(fp->texcoord, 0xff, sizeof(fp->texcoord));
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c b/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c
index 3ae51ef..7642c5e 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_vertprog.c
@@ -313,8 +313,8 @@ nvfx_vp_emit(struct nvfx_vpc *vpc, struct nvfx_insn insn)
       hw[0] |= NVFX_VP(INST_COND_UPDATE_ENABLE);
 
    if(insn.sat) {
-      assert(nv30->use_nv4x);
-      if(nv30->use_nv4x)
+      assert(nv30->is_nv4x);
+      if(nv30->is_nv4x)
          hw[0] |= NV40_VP_INST_SATURATE;
    }
 
@@ -540,7 +540,7 @@ nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
    mask = tgsi_mask(finst->Dst[0].Register.WriteMask);
    if(finst->Instruction.Saturate == TGSI_SAT_ZERO_ONE) {
       assert(finst->Instruction.Opcode != TGSI_OPCODE_ARL);
-      if (nv30->use_nv4x)
+      if (nv30->is_nv4x)
          sat = TRUE;
       else
       if(dst.type != NVFXSR_TEMP)
@@ -802,7 +802,7 @@ nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
       return FALSE;
    }
 
-   if(finst->Instruction.Saturate == TGSI_SAT_ZERO_ONE && !nv30->use_nv4x) {
+   if(finst->Instruction.Saturate == TGSI_SAT_ZERO_ONE && !nv30->is_nv4x) {
       if (!vpc->r_0_1.type)
          vpc->r_0_1 = constant(vpc, -1, 0, 1, 0, 0);
       nvfx_vp_emit(vpc, arith(0, VEC, MAX, dst, mask, nvfx_src(dst), swz(nvfx_src(vpc->r_0_1), X, X, X, X), none));
-- 
1.8.3.2
