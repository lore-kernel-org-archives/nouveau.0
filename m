From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv50: add support for user clip planes.
Date: Tue, 17 May 2011 07:28:17 +0300
Message-ID: <1305606497-22747-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Clip distance is calculated each time vertex position is written
which is suboptiomal is some cases but very safe.
User clip planes are an obsolete feature anyway.

Every time number of clip planes increase, the vertex shader is recompiled.
That ensures no overhead in normal case (no user clip planes)
and reasonable overhead otherwice.

Fixes 3D windows in compiz, and reflection effect in neverball.
Also fixes noticeable artefacts in compiz expo plugin when windows were dragged.
(about later I might not be right)

Thanks to Christoph Bumiller for writing the shader compiler, and for helping me
learn it enough to fix that little issue.

(This is based on patch by same author that added this support to older version of shader compiler)

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nv50/nv50_program.c        |    3 ++
 src/gallium/drivers/nv50/nv50_shader_state.c   |    9 ++++++-
 src/gallium/drivers/nv50/nv50_state_validate.c |    4 +-
 src/gallium/drivers/nv50/nv50_tgsi_to_nc.c     |   33 ++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 41d3e14..4def93d 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -395,6 +395,9 @@ nv50_vertprog_prepare(struct nv50_translation_info *ti)
       }
    }
 
+   p->vp.clpd = p->max_out;
+   p->max_out += p->vp.clpd_nr;
+
    for (i = 0; i < TGSI_SEMANTIC_COUNT; ++i) {
       switch (ti->sysval_map[i]) {
       case 2:
diff --git a/src/gallium/drivers/nv50/nv50_shader_state.c b/src/gallium/drivers/nv50/nv50_shader_state.c
index 82c346c..76644a0 100644
--- a/src/gallium/drivers/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nv50/nv50_shader_state.c
@@ -170,6 +170,12 @@ nv50_vertprog_validate(struct nv50_context *nv50)
    struct nouveau_channel *chan = nv50->screen->base.channel;
    struct nv50_program *vp = nv50->vertprog;
 
+   if (nv50->clip.nr > vp->vp.clpd_nr) {
+         if (vp->translated)
+            nv50_program_destroy(nv50, vp);
+         vp->vp.clpd_nr = nv50->clip.nr;
+   }
+
    if (!nv50_program_validate(nv50, vp))
          return;
 
@@ -368,8 +374,9 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
    dummy.linear = 0;
    m = nv50_vec4_map(map, 0, lin, &dummy, &vp->out[0]);
 
+
    for (c = 0; c < vp->vp.clpd_nr; ++c)
-      map[m++] |= vp->vp.clpd + c;
+      map[m++] = vp->vp.clpd + c;
 
    colors |= m << 8; /* adjust BFC0 id */
 
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index cdf1a98..630006c 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -303,10 +303,10 @@ static struct state_validate {
 #endif
     { nv50_validate_viewport,      NV50_NEW_VIEWPORT },
     { nv50_validate_clip,          NV50_NEW_CLIP },
-    { nv50_vertprog_validate,      NV50_NEW_VERTPROG },
+    { nv50_vertprog_validate,      NV50_NEW_VERTPROG | NV50_NEW_CLIP},
     { nv50_gmtyprog_validate,      NV50_NEW_GMTYPROG },
     { nv50_fragprog_validate,      NV50_NEW_FRAGPROG },
-    { nv50_fp_linkage_validate,    NV50_NEW_FRAGPROG | NV50_NEW_VERTPROG |
+    { nv50_fp_linkage_validate,    NV50_NEW_FRAGPROG | NV50_NEW_VERTPROG | NV50_NEW_CLIP |
                                    NV50_NEW_GMTYPROG },
     { nv50_gp_linkage_validate,    NV50_NEW_GMTYPROG | NV50_NEW_VERTPROG },
     { nv50_validate_derived_rs,    NV50_NEW_FRAGPROG | NV50_NEW_RASTERIZER |
diff --git a/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c b/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
index 25dcaae..5a19363 100644
--- a/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
+++ b/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
@@ -1990,6 +1990,39 @@ bld_instruction(struct bld_context *bld,
 
    FOR_EACH_DST0_ENABLED_CHANNEL(c, insn)
       emit_store(bld, insn, c, dst0[c]);
+
+
+   const struct tgsi_full_dst_register *dreg = &insn->Dst[0];
+
+   if(bld->ti->p->type == PIPE_SHADER_VERTEX &&
+      dreg->Register.File == TGSI_FILE_OUTPUT &&
+      bld->ti->p->out[dreg->Register.Index].sn == TGSI_SEMANTIC_POSITION) {
+
+
+      for (int p = 0 ; p < bld->ti->p->vp.clpd_nr ; p++) {
+         struct nv_value *clipd = NULL;
+
+        for (int c = 0 ; c < 4 ; c++) {
+
+            temp = new_value(bld->pc, NV_FILE_MEM_C(15), NV_TYPE_F32);
+            temp->reg.id = p * 4 + c;
+            temp = bld_insn_1(bld, NV_OP_LDA, temp);
+
+            if (!clipd)
+               clipd = bld_insn_2(bld, NV_OP_MUL, dst0[c], temp);
+            else
+               clipd = bld_insn_3(bld, NV_OP_MAD, dst0[c], temp, clipd);
+         }
+
+         temp = bld_insn_1(bld, NV_OP_MOV, clipd);
+         temp->reg.file = NV_FILE_OUT;
+         temp->insn->fixed = 1;
+         temp->reg.id = bld->ti->p->vp.clpd + p;
+      }
+   }
+
+
+
 }
 
 static INLINE void
-- 
1.7.4.1
