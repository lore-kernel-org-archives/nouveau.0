From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/3] nv50: implement multiple viewports/scissors,
	enable ARB_viewport_array
Date: Tue,  4 Feb 2014 02:06:58 -0500
Message-ID: <1391497618-4275-3-git-send-email-imirkin@alum.mit.edu>
References: <1391497618-4275-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1391497618-4275-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

This was tested along with airlied's patches to add support to mesa/st. With
the piglit tests modified to emit the viewport index for every vertex, this
passes all but the minmax test (it wants a viewport of 16K while we only offer
8K).

No apparent piglit regressions.

 .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp  |   1 +
 src/gallium/drivers/nouveau/nv50/nv50_context.h    |   6 +-
 src/gallium/drivers/nouveau/nv50/nv50_program.c    |   5 +
 src/gallium/drivers/nouveau/nv50/nv50_program.h    |   2 +
 src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  20 ++--
 src/gallium/drivers/nouveau/nv50/nv50_screen.h     |   2 +
 .../drivers/nouveau/nv50/nv50_shader_state.c       |  15 ++-
 src/gallium/drivers/nouveau/nv50/nv50_state.c      |  28 +++--
 .../drivers/nouveau/nv50/nv50_state_validate.c     | 113 +++++++++++++--------
 9 files changed, 136 insertions(+), 56 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 33ebb54..51d3d08 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -1031,6 +1031,7 @@ bool Source::scanInstruction(const struct tgsi_full_instruction *inst)
          if (info->out[dst.getIndex(0)].sn == TGSI_SEMANTIC_PSIZE ||
              info->out[dst.getIndex(0)].sn == TGSI_SEMANTIC_PRIMID ||
              info->out[dst.getIndex(0)].sn == TGSI_SEMANTIC_LAYER ||
+             info->out[dst.getIndex(0)].sn == TGSI_SEMANTIC_VIEWPORT_INDEX ||
              info->out[dst.getIndex(0)].sn == TGSI_SEMANTIC_FOG)
             info->out[dst.getIndex(0)].mask &= 1;
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index 1ce52c9..57a3090 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -163,8 +163,10 @@ struct nv50_context {
    struct pipe_blend_color blend_colour;
    struct pipe_stencil_ref stencil_ref;
    struct pipe_poly_stipple stipple;
-   struct pipe_scissor_state scissor;
-   struct pipe_viewport_state viewport;
+   struct pipe_scissor_state scissors[NV50_MAX_VIEWPORTS];
+   unsigned scissors_dirty;
+   struct pipe_viewport_state viewports[NV50_MAX_VIEWPORTS];
+   unsigned viewports_dirty;
    struct pipe_clip_state clip;
 
    unsigned sample_mask;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index e506438..0e06125 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -107,6 +107,10 @@ nv50_vertprog_assign_slots(struct nv50_ir_prog_info *info)
          prog->gp.has_layer = TRUE;
          prog->gp.layerid = n;
          break;
+      case TGSI_SEMANTIC_VIEWPORT_INDEX:
+         prog->gp.has_viewport = true;
+         prog->gp.viewportid = n;
+         break;
       default:
          break;
       }
@@ -344,6 +348,7 @@ nv50_program_translate(struct nv50_program *prog, uint16_t chipset)
    prog->vp.clpd[1] = map_undef;
    prog->vp.psiz = map_undef;
    prog->gp.has_layer = 0;
+   prog->gp.has_viewport = 0;
 
    info->driverPriv = prog;
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.h b/src/gallium/drivers/nouveau/nv50/nv50_program.h
index 8c1b327..87b0679 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.h
@@ -91,6 +91,8 @@ struct nv50_program {
       uint8_t prim_type; /* point, line strip or tri strip */
       uint8_t has_layer;
       ubyte layerid; /* hw value of layer output */
+      uint8_t has_viewport;
+      ubyte viewportid; /* hw value of viewport index output */
    } gp;
 
    void *fixups; /* relocation records */
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 5bb341d..bdfb931 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -196,6 +196,8 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
       return 0;
+   case PIPE_CAP_MAX_VIEWPORTS:
+      return NV50_MAX_VIEWPORTS;
    default:
       NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
       return 0;
@@ -524,9 +526,11 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
 
    BEGIN_NV04(push, NV50_3D(VIEWPORT_TRANSFORM_EN), 1);
    PUSH_DATA (push, 1);
-   BEGIN_NV04(push, NV50_3D(DEPTH_RANGE_NEAR(0)), 2);
-   PUSH_DATAf(push, 0.0f);
-   PUSH_DATAf(push, 1.0f);
+   for (i = 0; i < NV50_MAX_VIEWPORTS; i++) {
+      BEGIN_NV04(push, NV50_3D(DEPTH_RANGE_NEAR(i)), 2);
+      PUSH_DATAf(push, 0.0f);
+      PUSH_DATAf(push, 1.0f);
+   }
 
    BEGIN_NV04(push, NV50_3D(VIEW_VOLUME_CLIP_CTRL), 1);
 #ifdef NV50_SCISSORS_CLIPPING
@@ -541,10 +545,12 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
    /* We use scissors instead of exact view volume clipping,
     * so they're always enabled.
     */
-   BEGIN_NV04(push, NV50_3D(SCISSOR_ENABLE(0)), 3);
-   PUSH_DATA (push, 1);
-   PUSH_DATA (push, 8192 << 16);
-   PUSH_DATA (push, 8192 << 16);
+   for (i = 0; i < NV50_MAX_VIEWPORTS; i++) {
+      BEGIN_NV04(push, NV50_3D(SCISSOR_ENABLE(i)), 3);
+      PUSH_DATA (push, 1);
+      PUSH_DATA (push, 8192 << 16);
+      PUSH_DATA (push, 8192 << 16);
+   }
 
    BEGIN_NV04(push, NV50_3D(RASTERIZE_ENABLE), 1);
    PUSH_DATA (push, 1);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.h b/src/gallium/drivers/nouveau/nv50/nv50_screen.h
index 091a392..f8ce365 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.h
@@ -21,6 +21,8 @@ struct nv50_context;
 
 #define NV50_SCREEN_RESIDENT_BO_COUNT 5
 
+#define NV50_MAX_VIEWPORTS 16
+
 struct nv50_blitter;
 
 struct nv50_screen {
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index 129ed2a..28cff8b 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
@@ -347,6 +347,7 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
    int i, n, c, m;
    uint32_t primid = 0;
    uint32_t layerid = 0;
+   uint32_t viewportid = 0;
    uint32_t psiz = 0x000;
    uint32_t interp = fp->fp.interp;
    uint32_t colors = fp->fp.colors;
@@ -408,6 +409,9 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
       case TGSI_SEMANTIC_LAYER:
          layerid = m;
          break;
+      case TGSI_SEMANTIC_VIEWPORT_INDEX:
+         viewportid = m;
+         break;
       }
       m = nv50_vec4_map(map, m, lin,
                         &fp->in[i], (n < vp->out_nr) ? &vp->out[n] : &dummy);
@@ -418,6 +422,11 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
       map[m++] = vp->gp.layerid;
    }
 
+   if (vp->gp.has_viewport && !viewportid) {
+      viewportid = m;
+      map[m++] = vp->gp.viewportid;
+   }
+
    if (nv50->rast->pipe.point_size_per_vertex) {
       psiz = (m << 4) | 1;
       map[m++] = vp->vp.psiz;
@@ -472,12 +481,16 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
       PUSH_DATAp(push, map, n);
    }
 
-   BEGIN_NV04(push, NV50_3D(SEMANTIC_COLOR), 4);
+   BEGIN_NV04(push, NV50_3D(GP_VIEWPORT_ID_ENABLE), 5);
+   PUSH_DATA (push, vp->gp.has_viewport);
    PUSH_DATA (push, colors);
    PUSH_DATA (push, (vp->vp.clpd_nr << 8) | 4);
    PUSH_DATA (push, layerid);
    PUSH_DATA (push, psiz);
 
+   BEGIN_NV04(push, NV50_3D(SEMANTIC_VIEWPORT), 1);
+   PUSH_DATA (push, viewportid);
+
    BEGIN_NV04(push, NV50_3D(LAYER), 1);
    PUSH_DATA (push, vp->gp.has_layer << 16);
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state.c b/src/gallium/drivers/nouveau/nv50/nv50_state.c
index 247f295..288ba46 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state.c
@@ -235,8 +235,10 @@ nv50_rasterizer_state_create(struct pipe_context *pipe,
    so->pipe = *cso;
 
 #ifndef NV50_SCISSORS_CLIPPING
-   SB_BEGIN_3D(so, SCISSOR_ENABLE(0), 1);
-   SB_DATA    (so, cso->scissor);
+   for (int i = 0; i < NV50_MAX_VIEWPORTS; i++) {
+      SB_BEGIN_3D(so, SCISSOR_ENABLE(i), 1);
+      SB_DATA    (so, cso->scissor);
+   }
 #endif
 
    SB_BEGIN_3D(so, SHADE_MODEL, 1);
@@ -903,9 +905,16 @@ nv50_set_scissor_states(struct pipe_context *pipe,
                         const struct pipe_scissor_state *scissor)
 {
    struct nv50_context *nv50 = nv50_context(pipe);
+   int i;
 
-   nv50->scissor = *scissor;
-   nv50->dirty |= NV50_NEW_SCISSOR;
+   assert(start_slot + num_scissors <= NV50_MAX_VIEWPORTS);
+   for (i = 0; i < num_scissors; i++) {
+      if (!memcmp(&nv50->scissors[start_slot + i], &scissor[i], sizeof(*scissor)))
+         continue;
+      nv50->scissors[start_slot + i] = scissor[i];
+      nv50->scissors_dirty |= 1 << (start_slot + i);
+      nv50->dirty |= NV50_NEW_SCISSOR;
+   }
 }
 
 static void
@@ -915,9 +924,16 @@ nv50_set_viewport_states(struct pipe_context *pipe,
                          const struct pipe_viewport_state *vpt)
 {
    struct nv50_context *nv50 = nv50_context(pipe);
+   int i;
 
-   nv50->viewport = *vpt;
-   nv50->dirty |= NV50_NEW_VIEWPORT;
+   assert(start_slot + num_viewports <= NV50_MAX_VIEWPORTS);
+   for (i = 0; i < num_viewports; i++) {
+      if (!memcmp(&nv50->viewports[start_slot + i], &vpt[i], sizeof(*vpt)))
+         continue;
+      nv50->viewports[start_slot + i] = vpt[i];
+      nv50->viewports_dirty |= 1 << (start_slot + i);
+      nv50->dirty |= NV50_NEW_VIEWPORT;
+   }
 }
 
 static void
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 9559253..fdc2e63 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -124,9 +124,11 @@ nv50_validate_fb(struct nv50_context *nv50)
    BEGIN_NV04(push, NV50_3D(MULTISAMPLE_MODE), 1);
    PUSH_DATA (push, ms_mode);
 
-   BEGIN_NV04(push, NV50_3D(VIEWPORT_HORIZ(0)), 2);
-   PUSH_DATA (push, fb->width << 16);
-   PUSH_DATA (push, fb->height << 16);
+   for (i = 0; i < NV50_MAX_VIEWPORTS; i++) {
+      BEGIN_NV04(push, NV50_3D(VIEWPORT_HORIZ(i)), 2);
+      PUSH_DATA (push, fb->width << 16);
+      PUSH_DATA (push, fb->height << 16);
+   }
 }
 
 static void
@@ -167,42 +169,63 @@ static void
 nv50_validate_scissor(struct nv50_context *nv50)
 {
    struct nouveau_pushbuf *push = nv50->base.pushbuf;
-   struct pipe_scissor_state *s = &nv50->scissor;
 #ifdef NV50_SCISSORS_CLIPPING
-   struct pipe_viewport_state *vp = &nv50->viewport;
-   int minx, maxx, miny, maxy;
+   int minx, maxx, miny, maxy, i;
 
    if (!(nv50->dirty &
          (NV50_NEW_SCISSOR | NV50_NEW_VIEWPORT | NV50_NEW_FRAMEBUFFER)) &&
        nv50->state.scissor == nv50->rast->pipe.scissor)
       return;
+
+   if (nv50->state.scissor != nv50->rast->pipe.scissor)
+      nv50->scissors_dirty = (1 << NV50_MAX_VIEWPORTS) - 1;
+
    nv50->state.scissor = nv50->rast->pipe.scissor;
 
-   if (nv50->state.scissor) {
-      minx = s->minx;
-      maxx = s->maxx;
-      miny = s->miny;
-      maxy = s->maxy;
-   } else {
-      minx = 0;
-      maxx = nv50->framebuffer.width;
-      miny = 0;
-      maxy = nv50->framebuffer.height;
-   }
+   if ((nv50->dirty & NV50_NEW_FRAMEBUFFER) && !nv50->state.scissor)
+      nv50->scissors_dirty = (1 << NV50_MAX_VIEWPORTS) - 1;
+
+   for (i = 0; i < NV50_MAX_VIEWPORTS; i++) {
+      struct pipe_scissor_state *s = &nv50->scissors[i];
+      struct pipe_viewport_state *vp = &nv50->viewports[i];
 
-   minx = MAX2(minx, (int)(vp->translate[0] - fabsf(vp->scale[0])));
-   maxx = MIN2(maxx, (int)(vp->translate[0] + fabsf(vp->scale[0])));
-   miny = MAX2(miny, (int)(vp->translate[1] - fabsf(vp->scale[1])));
-   maxy = MIN2(maxy, (int)(vp->translate[1] + fabsf(vp->scale[1])));
+      if (!(nv50->scissors_dirty & (1 << i)) &&
+          !(nv50->viewports_dirty & (1 << i)))
+         continue;
 
-   BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(0)), 2);
-   PUSH_DATA (push, (maxx << 16) | minx);
-   PUSH_DATA (push, (maxy << 16) | miny);
+      if (nv50->state.scissor) {
+         minx = s->minx;
+         maxx = s->maxx;
+         miny = s->miny;
+         maxy = s->maxy;
+      } else {
+         minx = 0;
+         maxx = nv50->framebuffer.width;
+         miny = 0;
+         maxy = nv50->framebuffer.height;
+      }
+
+      minx = MAX2(minx, (int)(vp->translate[0] - fabsf(vp->scale[0])));
+      maxx = MIN2(maxx, (int)(vp->translate[0] + fabsf(vp->scale[0])));
+      miny = MAX2(miny, (int)(vp->translate[1] - fabsf(vp->scale[1])));
+      maxy = MIN2(maxy, (int)(vp->translate[1] + fabsf(vp->scale[1])));
+
+      minx = MIN2(minx, 8192);
+      maxx = MAX2(maxx, 0);
+      miny = MIN2(miny, 8192);
+      maxy = MAX2(maxy, 0);
+
+      BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(i)), 2);
+      PUSH_DATA (push, (maxx << 16) | minx);
+      PUSH_DATA (push, (maxy << 16) | miny);
 #else
-   BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(0)), 2);
-   PUSH_DATA (push, (s->maxx << 16) | s->minx);
-   PUSH_DATA (push, (s->maxy << 16) | s->miny);
+      BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(i)), 2);
+      PUSH_DATA (push, (s->maxx << 16) | s->minx);
+      PUSH_DATA (push, (s->maxy << 16) | s->miny);
 #endif
+   }
+
+   nv50->scissors_dirty = 0;
 }
 
 static void
@@ -210,24 +233,34 @@ nv50_validate_viewport(struct nv50_context *nv50)
 {
    struct nouveau_pushbuf *push = nv50->base.pushbuf;
    float zmin, zmax;
+   int i;
 
-   BEGIN_NV04(push, NV50_3D(VIEWPORT_TRANSLATE_X(0)), 3);
-   PUSH_DATAf(push, nv50->viewport.translate[0]);
-   PUSH_DATAf(push, nv50->viewport.translate[1]);
-   PUSH_DATAf(push, nv50->viewport.translate[2]);
-   BEGIN_NV04(push, NV50_3D(VIEWPORT_SCALE_X(0)), 3);
-   PUSH_DATAf(push, nv50->viewport.scale[0]);
-   PUSH_DATAf(push, nv50->viewport.scale[1]);
-   PUSH_DATAf(push, nv50->viewport.scale[2]);
+   for (i = 0; i < NV50_MAX_VIEWPORTS; i++) {
+      struct pipe_viewport_state *vpt = &nv50->viewports[i];
 
-   zmin = nv50->viewport.translate[2] - fabsf(nv50->viewport.scale[2]);
-   zmax = nv50->viewport.translate[2] + fabsf(nv50->viewport.scale[2]);
+      if (!(nv50->viewports_dirty & (1 << i)))
+         continue;
+
+      BEGIN_NV04(push, NV50_3D(VIEWPORT_TRANSLATE_X(i)), 3);
+      PUSH_DATAf(push, vpt->translate[0]);
+      PUSH_DATAf(push, vpt->translate[1]);
+      PUSH_DATAf(push, vpt->translate[2]);
+      BEGIN_NV04(push, NV50_3D(VIEWPORT_SCALE_X(i)), 3);
+      PUSH_DATAf(push, vpt->scale[0]);
+      PUSH_DATAf(push, vpt->scale[1]);
+      PUSH_DATAf(push, vpt->scale[2]);
+
+      zmin = vpt->translate[2] - fabsf(vpt->scale[2]);
+      zmax = vpt->translate[2] + fabsf(vpt->scale[2]);
 
 #ifdef NV50_SCISSORS_CLIPPING
-   BEGIN_NV04(push, NV50_3D(DEPTH_RANGE_NEAR(0)), 2);
-   PUSH_DATAf(push, zmin);
-   PUSH_DATAf(push, zmax);
+      BEGIN_NV04(push, NV50_3D(DEPTH_RANGE_NEAR(i)), 2);
+      PUSH_DATAf(push, zmin);
+      PUSH_DATAf(push, zmax);
 #endif
+   }
+
+   nv50->viewports_dirty = 0;
 }
 
 static INLINE void
-- 
1.8.3.2
