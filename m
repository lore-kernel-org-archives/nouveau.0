From: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH v2] nv50: add support for user clip planes.
Date: Wed, 18 May 2011 20:07:15 +0300
Message-ID: <1305738435-12754-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Clip distance is calculated each time vertex position is written
which is suboptiomal is some cases but very safe.
User clip planes are an obsolete feature anyway.

Every time number of clip planes increases, the vertex program is recompiled.
That ensures no overhead in normal case (no user clip planes)
and reasonable overhead otherwice.

Fixes 3D windows in compiz, and reflection effect in neverball.
Also fixes  compiz expo plugin when windows were dragged and each window shown 3 times.

Thanks to Christoph Bumiller for writing the shader compiler, and for helping me
learn it enough to fix that little issue.
Also, this is based on old patch by him, that added this support to older version of the shader compiler.

V2: * revalidate shader linkage only when vertex program is rebuilt as suggested by Christoph Bumiller
    * little consmetic fixes

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 src/gallium/drivers/nv50/nv50_program.c        |    3 ++
 src/gallium/drivers/nv50/nv50_shader_state.c   |    8 ++++++-
 src/gallium/drivers/nv50/nv50_state_validate.c |    4 +++
 src/gallium/drivers/nv50/nv50_tgsi_to_nc.c     |   28 ++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletions(-)

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
index 82c346c..065a9e7 100644
--- a/src/gallium/drivers/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nv50/nv50_shader_state.c
@@ -170,6 +170,12 @@ nv50_vertprog_validate(struct nv50_context *nv50)
    struct nouveau_channel *chan = nv50->screen->base.channel;
    struct nv50_program *vp = nv50->vertprog;
 
+   if (nv50->clip.nr > vp->vp.clpd_nr) {
+      if (vp->translated)
+            nv50_program_destroy(nv50, vp);
+      vp->vp.clpd_nr = nv50->clip.nr;
+   }
+
    if (!nv50_program_validate(nv50, vp))
          return;
 
@@ -369,7 +375,7 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
    m = nv50_vec4_map(map, 0, lin, &dummy, &vp->out[0]);
 
    for (c = 0; c < vp->vp.clpd_nr; ++c)
-      map[m++] |= vp->vp.clpd + c;
+      map[m++] = vp->vp.clpd + c;
 
    colors |= m << 8; /* adjust BFC0 id */
 
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index cdf1a98..c8a0d50 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -225,6 +225,10 @@ nv50_validate_clip(struct nv50_context *nv50)
 
    BEGIN_RING(chan, RING_3D(VP_CLIP_DISTANCE_ENABLE), 1);
    OUT_RING  (chan, (1 << nv50->clip.nr) - 1);
+
+   if (nv50->vertprog && nv50->vertprog->translated &&
+                                 nv50->clip.nr > nv50->vertprog->vp.clpd_nr)
+         nv50->dirty |= NV50_NEW_VERTPROG;
 }
 
 static void
diff --git a/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c b/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
index 25dcaae..5efa99c 100644
--- a/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
+++ b/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
@@ -1990,6 +1990,34 @@ bld_instruction(struct bld_context *bld,
 
    FOR_EACH_DST0_ENABLED_CHANNEL(c, insn)
       emit_store(bld, insn, c, dst0[c]);
+
+
+   const struct tgsi_full_dst_register *dreg = &insn->Dst[0];
+   struct nv50_program *prog = bld->ti->p;
+
+   if (prog->vp.clpd_nr && prog->type == PIPE_SHADER_VERTEX &&
+      dreg->Register.File == TGSI_FILE_OUTPUT &&
+      prog->out[dreg->Register.Index].sn == TGSI_SEMANTIC_POSITION) {
+
+      for (int p = 0 ; p < prog->vp.clpd_nr ; p++) {
+         struct nv_value *clipd = NULL;
+
+         for (int c = 0 ; c < 4 ; c++) {
+            temp = new_value(bld->pc, NV_FILE_MEM_C(15), NV_TYPE_F32);
+            temp->reg.id = p * 4 + c;
+            temp = bld_insn_1(bld, NV_OP_LDA, temp);
+
+            clipd = clipd ?
+                        bld_insn_3(bld, NV_OP_MAD, dst0[c], temp, clipd) :
+                        bld_insn_2(bld, NV_OP_MUL, dst0[c], temp);
+         }
+
+         temp = bld_insn_1(bld, NV_OP_MOV, clipd);
+         temp->reg.file = NV_FILE_OUT;
+         temp->reg.id = bld->ti->p->vp.clpd + p;
+         temp->insn->fixed = 1;
+      }
+   }
 }
 
 static INLINE void
-- 
1.7.4.1
