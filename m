From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH v2] nv50: Handle ARB_conditional_render_inverted
	and enable it
Date: Tue, 21 Oct 2014 18:28:35 +0200
Message-ID: <1413908915-3446-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 docs/GL3.txt                                    |  2 +-
 docs/relnotes/10.4.html                         |  1 +
 src/gallium/drivers/nouveau/nv50/nv50_context.h |  3 +-
 src/gallium/drivers/nouveau/nv50/nv50_query.c   | 56 +++++++++++++++++++++----
 src/gallium/drivers/nouveau/nv50/nv50_screen.c  |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_surface.c |  2 +-
 6 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/docs/GL3.txt b/docs/GL3.txt
index 07d1d2c..08a22b2 100644
--- a/docs/GL3.txt
+++ b/docs/GL3.txt
@@ -188,7 +188,7 @@ GL 4.5, GLSL 4.50:
 
   GL_ARB_ES3_1_compatibility                           not started
   GL_ARB_clip_control                                  not started
-  GL_ARB_conditional_render_inverted                   DONE (i965, nvc0, llvmpipe, softpipe)
+  GL_ARB_conditional_render_inverted                   DONE (i965, nv50, nvc0, llvmpipe, softpipe)
   GL_ARB_cull_distance                                 not started
   GL_ARB_derivative_control                            DONE (i965, nv50, nvc0, r600)
   GL_ARB_direct_state_access                           not started
diff --git a/docs/relnotes/10.4.html b/docs/relnotes/10.4.html
index 64cbfae..88b5856 100644
--- a/docs/relnotes/10.4.html
+++ b/docs/relnotes/10.4.html
@@ -44,6 +44,7 @@ Note: some of the new features are only available with certain drivers.
 </p>
 
 <ul>
+<li>GL_ARB_conditional_render_inverted on nv50</li>
 <li>GL_ARB_sample_shading on r600</li>
 <li>GL_ARB_texture_view on nv50, nvc0</li>
 </ul>
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index 9557317..45eb554 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -178,8 +178,9 @@ struct nv50_context {
    uint32_t rt_array_mode;
 
    struct pipe_query *cond_query;
-   boolean cond_cond;
+   boolean cond_cond; /* inverted rendering condition */
    uint cond_mode;
+   uint32_t cond_condmode; /* the calculated condition */
 
    struct nv50_blitctx *blit;
 };
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_query.c b/src/gallium/drivers/nouveau/nv50/nv50_query.c
index a373dc6..0b4a149 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_query.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_query.c
@@ -158,7 +158,10 @@ nv50_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
       /* XXX: can we do this with the GPU, and sync with respect to a previous
        *  query ?
        */
+      q->data[0] = q->sequence; /* initialize sequence */
       q->data[1] = 1; /* initial render condition = TRUE */
+      q->data[4] = q->sequence + 1; /* for comparison COND_MODE */
+      q->data[5] = 0;
    }
    if (!q->is64bit)
       q->data[0] = q->sequence++; /* the previously used one */
@@ -326,31 +329,68 @@ nv50_render_condition(struct pipe_context *pipe,
 {
    struct nv50_context *nv50 = nv50_context(pipe);
    struct nouveau_pushbuf *push = nv50->base.pushbuf;
-   struct nv50_query *q;
+   struct nv50_query *q = nv50_query(pq);
+
+
+   uint32_t cond;
+   boolean wait =
+      mode != PIPE_RENDER_COND_NO_WAIT &&
+      mode != PIPE_RENDER_COND_BY_REGION_NO_WAIT;
+
+   if (!pq) {
+      cond = NV50_3D_COND_MODE_ALWAYS;
+   }
+   else {
+      /* NOTE: comparison of 2 queries only works if both have completed */
+      switch (q->type) {
+      case PIPE_QUERY_SO_OVERFLOW_PREDICATE:
+         cond = condition ? NV50_3D_COND_MODE_EQUAL :
+                            NV50_3D_COND_MODE_NOT_EQUAL;
+         wait = TRUE;
+         break;
+      case PIPE_QUERY_OCCLUSION_COUNTER:
+      case PIPE_QUERY_OCCLUSION_PREDICATE:
+         if (likely(!condition)) {
+            /* XXX: Placeholder, handle nesting here if available */
+            if (unlikely(false))
+               cond = wait ? NV50_3D_COND_MODE_NOT_EQUAL :
+                             NV50_3D_COND_MODE_ALWAYS;
+            else
+               cond = NV50_3D_COND_MODE_RES_NON_ZERO;
+         } else {
+            cond = wait ? NV50_3D_COND_MODE_EQUAL : NV50_3D_COND_MODE_ALWAYS;
+         }
+         break;
+      default:
+         assert(!"render condition query not a predicate");
+         cond = NV50_3D_COND_MODE_ALWAYS;
+         break;
+      }
+   }
 
    nv50->cond_query = pq;
    nv50->cond_cond = condition;
+   nv50->cond_condmode = cond;
    nv50->cond_mode = mode;
 
-   PUSH_SPACE(push, 9);
-
    if (!pq) {
+      PUSH_SPACE(push, 2);
       BEGIN_NV04(push, NV50_3D(COND_MODE), 1);
-      PUSH_DATA (push, NV50_3D_COND_MODE_ALWAYS);
+      PUSH_DATA (push, cond);
       return;
    }
-   q = nv50_query(pq);
 
-   if (mode == PIPE_RENDER_COND_WAIT ||
-       mode == PIPE_RENDER_COND_BY_REGION_WAIT) {
+   if (wait) {
       BEGIN_NV04(push, SUBC_3D(NV50_GRAPH_SERIALIZE), 1);
       PUSH_DATA (push, 0);
    }
 
+   PUSH_SPACE(push, 8);
+   PUSH_REFN (push, q->bo, NOUVEAU_BO_GART | NOUVEAU_BO_RD);
    BEGIN_NV04(push, NV50_3D(COND_ADDRESS_HIGH), 3);
    PUSH_DATAh(push, q->bo->offset + q->offset);
    PUSH_DATA (push, q->bo->offset + q->offset);
-   PUSH_DATA (push, NV50_3D_COND_MODE_RES_NON_ZERO);
+   PUSH_DATA (push, cond);
 
    BEGIN_NV04(push, NV50_2D(COND_ADDRESS_HIGH), 2);
    PUSH_DATAh(push, q->bo->offset + q->offset);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 3a46e72..06b191d 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -172,6 +172,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
    case PIPE_CAP_TGSI_FS_FINE_DERIVATIVE:
    case PIPE_CAP_SAMPLER_VIEW_TARGET:
+   case PIPE_CAP_CONDITIONAL_RENDER_INVERTED:
       return 1;
    case PIPE_CAP_SEAMLESS_CUBE_MAP:
       return 1; /* class_3d >= NVA0_3D_CLASS; */
@@ -203,7 +204,6 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TGSI_VS_WINDOW_SPACE_POSITION:
    case PIPE_CAP_COMPUTE:
    case PIPE_CAP_DRAW_INDIRECT:
-   case PIPE_CAP_CONDITIONAL_RENDER_INVERTED:
       return 0;
 
    case PIPE_CAP_VENDOR_ID:
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index e1dd6e0..e1d2b26 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -1297,7 +1297,7 @@ nv50_blit_eng2d(struct nv50_context *nv50, const struct pipe_blit_info *info)
 
    if (nv50->cond_query && info->render_condition_enable) {
       BEGIN_NV04(push, NV50_2D(COND_MODE), 1);
-      PUSH_DATA (push, NV50_2D_COND_MODE_RES_NON_ZERO);
+      PUSH_DATA (push, nv50->cond_condmode);
    }
 
    if (mask != 0xffffffff) {
-- 
2.1.2
