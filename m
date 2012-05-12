From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 1/4] nv30: Fix generic passing to fragment program
	in NV34
Date: Sat, 12 May 2012 03:42:29 +0200
Message-ID: <1336786951-3325-2-git-send-email-r.spliet@student.tudelft.nl>
References: <[Patches]mesa/nv30: Diverse set of patches that improve NV3x
	render quality>
	<1336786951-3325-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1336786951-3325-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

fixes over 800 piglit cases in quick-driver suite for NV34

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 src/gallium/drivers/nv30/nv30_fragprog.c |    2 +-
 src/gallium/drivers/nv30/nv30_state.h    |    2 +-
 src/gallium/drivers/nv30/nvfx_fragprog.c |   10 +++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_fragprog.c b/src/gallium/drivers/nv30/nv30_fragprog.c
index 865c828..cfaafd5 100644
--- a/src/gallium/drivers/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nv30/nv30_fragprog.c
@@ -117,7 +117,7 @@ nv30_fragprog_validate(struct nv30_context *nv30)
          BEGIN_NV04(push, NV30_3D(FP_REG_CONTROL), 1);
          PUSH_DATA (push, 0x00010004);
          BEGIN_NV04(push, NV30_3D(TEX_UNITS_ENABLE), 1);
-         PUSH_DATA (push, fp->samplers);
+         PUSH_DATA (push, fp->texcoords);
       } else {
          BEGIN_NV04(push, SUBC_3D(0x0b40), 1);
          PUSH_DATA (push, 0x00000000);
diff --git a/src/gallium/drivers/nv30/nv30_state.h b/src/gallium/drivers/nv30/nv30_state.h
index a219bf2..df3b696 100644
--- a/src/gallium/drivers/nv30/nv30_state.h
+++ b/src/gallium/drivers/nv30/nv30_state.h
@@ -115,6 +115,7 @@ struct nv30_fragprog {
    unsigned insn_len;
 
    uint16_t texcoord[10];
+   uint32_t texcoords;
    struct nv30_fragprog_data *consts;
    unsigned nr_consts;
 
@@ -123,7 +124,6 @@ struct nv30_fragprog {
    uint32_t fp_control;
    uint32_t point_sprite_control;
    uint32_t coord_conventions;
-   uint32_t samplers;
    uint32_t rt_enable;
 };
 
diff --git a/src/gallium/drivers/nv30/nvfx_fragprog.c b/src/gallium/drivers/nv30/nvfx_fragprog.c
index 592ad21..915b926 100644
--- a/src/gallium/drivers/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nv30/nvfx_fragprog.c
@@ -217,7 +217,7 @@ nvfx_fp_emit(struct nvfx_fpc *fpc, struct nvfx_insn insn)
    if(insn.unit >= 0)
    {
       hw[0] |= (insn.unit << NVFX_FP_OP_TEX_UNIT_SHIFT);
-      fp->samplers |= (1 << insn.unit);
+      fp->texcoords |= (1 << insn.unit);
    }
 
    emit_dst(fpc, insn.dst);
@@ -959,8 +959,12 @@ nvfx_fragprog_assign_generic(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
          for (hw = 0; hw < num_texcoords; hw++) {
             if (fpc->fp->texcoord[hw] == 0xffff) {
                fpc->fp->texcoord[hw] = fdec->Semantic.Index;
-               if (hw <= 7) fpc->fp->vp_or |= (0x00004000 << hw);
-               else         fpc->fp->vp_or |= (0x00001000 << (hw - 8));
+               if (hw <= 7) {
+                  fpc->fp->vp_or |= (0x00004000 << hw);
+                  fpc->fp->texcoords |= (0x1 << hw);
+               } else {
+                  fpc->fp->vp_or |= (0x00001000 << (hw - 8));
+               }
                if (fdec->Semantic.Index == 9)
                   fpc->fp->point_sprite_control |= (0x00000100 << hw);
                hw = NVFX_FP_OP_INPUT_SRC_TC(hw);
-- 
1.7.7.6
