From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/3] nvc0: fix translate path for
	PRIM_RESTART_WITH_DRAW_ARRAYS
Date: Wed,  9 Jul 2014 23:59:05 -0400
Message-ID: <1404964745-31949-4-git-send-email-imirkin@alum.mit.edu>
References: <1404964745-31949-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404964745-31949-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 .../drivers/nouveau/nvc0/nvc0_vbo_translate.c      | 41 +++++++++++++++-------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo_translate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo_translate.c
index fc578f2..f180087 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo_translate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo_translate.c
@@ -253,7 +253,7 @@ disp_vertices_i08(struct push_context *ctx, unsigned start, unsigned count)
       }
       if (count) {
          BEGIN_NVC0(push, NVC0_3D(VB_ELEMENT_U32), 1);
-         PUSH_DATA (push, ctx->restart_index);
+         PUSH_DATA (push, 0xffffffff);
          ++elts;
          ctx->dest += ctx->vertex_size;
          ++pos;
@@ -309,7 +309,7 @@ disp_vertices_i16(struct push_context *ctx, unsigned start, unsigned count)
       }
       if (count) {
          BEGIN_NVC0(push, NVC0_3D(VB_ELEMENT_U32), 1);
-         PUSH_DATA (push, ctx->restart_index);
+         PUSH_DATA (push, 0xffffffff);
          ++elts;
          ctx->dest += ctx->vertex_size;
          ++pos;
@@ -365,7 +365,7 @@ disp_vertices_i32(struct push_context *ctx, unsigned start, unsigned count)
       }
       if (count) {
          BEGIN_NVC0(push, NVC0_3D(VB_ELEMENT_U32), 1);
-         PUSH_DATA (push, ctx->restart_index);
+         PUSH_DATA (push, 0xffffffff);
          ++elts;
          ctx->dest += ctx->vertex_size;
          ++pos;
@@ -381,6 +381,9 @@ disp_vertices_seq(struct push_context *ctx, unsigned start, unsigned count)
    struct translate *translate = ctx->translate;
    unsigned pos = 0;
 
+   /* XXX: This will read the data corresponding to the primitive restart index,
+    *  maybe we should avoid that ?
+    */
    translate->run(translate, start, count, 0, ctx->instance_id, ctx->dest);
    do {
       unsigned nr = count;
@@ -444,25 +447,37 @@ nvc0_push_vbo(struct nvc0_context *nvc0, const struct pipe_draw_info *info)
 
    nvc0_vertex_configure_translate(nvc0, info->index_bias);
 
+   if (nvc0->state.index_bias) {
+      /* this is already taken care of by translate */
+      IMMED_NVC0(ctx.push, NVC0_3D(VB_ELEMENT_BASE), 0);
+      nvc0->state.index_bias = 0;
+   }
+
    if (unlikely(ctx.edgeflag.enabled))
       nvc0_push_map_edgeflag(&ctx, nvc0, info->index_bias);
 
    ctx.prim_restart = info->primitive_restart;
    ctx.restart_index = info->restart_index;
 
+   if (info->primitive_restart) {
+      /* NOTE: I hope we won't ever need that last index (~0).
+       * If we do, we have to disable primitive restart here always and
+       * use END,BEGIN to restart. (XXX: would that affect PrimitiveID ?)
+       * We could also deactive PRIM_RESTART_WITH_DRAW_ARRAYS temporarily,
+       * and add manual restart to disp_vertices_seq.
+       */
+      BEGIN_NVC0(ctx.push, NVC0_3D(PRIM_RESTART_ENABLE), 2);
+      PUSH_DATA (ctx.push, 1);
+      PUSH_DATA (ctx.push, info->indexed ? 0xffffffff : info->restart_index);
+   } else
+   if (nvc0->state.prim_restart) {
+      IMMED_NVC0(ctx.push, NVC0_3D(PRIM_RESTART_ENABLE), 0);
+   }
+   nvc0->state.prim_restart = info->primitive_restart;
+
    if (info->indexed) {
       nvc0_push_map_idxbuf(&ctx, nvc0);
       index_size = nvc0->idxbuf.index_size;
-
-      if (info->primitive_restart) {
-         BEGIN_NVC0(ctx.push, NVC0_3D(PRIM_RESTART_ENABLE), 2);
-         PUSH_DATA (ctx.push, 1);
-         PUSH_DATA (ctx.push, info->restart_index);
-      } else
-      if (nvc0->state.prim_restart) {
-         IMMED_NVC0(ctx.push, NVC0_3D(PRIM_RESTART_ENABLE), 0);
-      }
-      nvc0->state.prim_restart = info->primitive_restart;
    } else {
       if (unlikely(info->count_from_stream_output)) {
          struct pipe_context *pipe = &nvc0->base.pipe;
-- 
1.8.5.5
