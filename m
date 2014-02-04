From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] nv50: rework primid logic
Date: Tue,  4 Feb 2014 02:06:56 -0500
Message-ID: <1391497618-4275-1-git-send-email-imirkin@alum.mit.edu>
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
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Functionally identical but much simpler. Should also better integrate
with future layer/viewport changes/fixes.

Cc: 10.1 <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not *strictly* necessary in stable, but it will make backporting later fixes
easier. No regressions in piglit.

 src/gallium/drivers/nouveau/nv50/nv50_program.c      | 5 +----
 src/gallium/drivers/nouveau/nv50/nv50_program.h      | 1 -
 src/gallium/drivers/nouveau/nv50/nv50_shader_state.c | 4 +++-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index 636ef87..f14d3ef 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -170,10 +170,8 @@ nv50_fragprog_assign_slots(struct nv50_ir_prog_info *info)
 
          if (info->in[i].sn == TGSI_SEMANTIC_COLOR)
             prog->vp.bfc[info->in[i].si] = j;
-         else if (info->in[i].sn == TGSI_SEMANTIC_PRIMID) {
+         else if (info->in[i].sn == TGSI_SEMANTIC_PRIMID)
             prog->vp.attrs[2] |= NV50_3D_VP_GP_BUILTIN_ATTR_EN_PRIMITIVE_ID;
-            prog->gp.primid = j;
-         }
 
          prog->in[j].id = i;
          prog->in[j].mask = info->in[i].mask;
@@ -345,7 +343,6 @@ nv50_program_translate(struct nv50_program *prog, uint16_t chipset)
    prog->vp.clpd[0] = map_undef;
    prog->vp.clpd[1] = map_undef;
    prog->vp.psiz = map_undef;
-   prog->gp.primid = 0x80;
    prog->gp.has_layer = 0;
 
    info->driverPriv = prog;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.h b/src/gallium/drivers/nouveau/nv50/nv50_program.h
index 5b092bd..75de007 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.h
@@ -88,7 +88,6 @@ struct nv50_program {
 
    struct {
       uint32_t vert_count;
-      ubyte primid; /* primitive id output register */
       uint8_t prim_type; /* point, line strip or tri strip */
       bool has_layer;
       ubyte layerid; /* hw value of layer output */
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index 9a43502..f8b1c1b 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
@@ -401,8 +401,10 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
          if (vp->out[n].sn == fp->in[i].sn &&
              vp->out[n].si == fp->in[i].si)
             break;
-      if (i == fp->gp.primid) {
+      switch (fp->in[i].sn) {
+      case TGSI_SEMANTIC_PRIMID:
          primid = m;
+         break;
       }
       m = nv50_vec4_map(map, m, lin,
                         &fp->in[i], (n < vp->out_nr) ? &vp->out[n] : &dummy);
-- 
1.8.3.2
