From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] nvc0: remove vport_int hack and instead use
	the usual state validation
Date: Mon, 16 Jun 2014 23:16:49 -0400
Message-ID: <1402975011-27394-1-git-send-email-imirkin@alum.mit.edu>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Commit ad4dc772 fixed an issue with the viewport not being restored
correctly. However it's rather hackish and confusing. Instead just mark
the viewport dirty and let the viewport validation take care of it.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_context.h        | 1 -
 src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c | 5 -----
 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c        | 8 +++-----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
index 41cee78..052f0ba 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
@@ -202,7 +202,6 @@ struct nvc0_context {
    struct pipe_surface *surfaces[2][NVC0_MAX_SURFACE_SLOTS];
    uint16_t surfaces_dirty[2];
    uint16_t surfaces_valid[2];
-   uint32_t vport_int[2];
 
    struct util_dynarray global_residents;
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
index 0cc7a52..25a3232 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
@@ -299,11 +299,6 @@ nvc0_validate_viewport(struct nvc0_context *nvc0)
       PUSH_DATA (push, (w << 16) | x);
       PUSH_DATA (push, (h << 16) | y);
 
-      if (i == 0) {
-         nvc0->vport_int[0] = (w << 16) | x;
-         nvc0->vport_int[1] = (h << 16) | y;
-      }
-
       zmin = vp->translate[2] - fabsf(vp->scale[2]);
       zmax = vp->translate[2] + fabsf(vp->scale[2]);
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index f782eec..a29f0cc 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -1012,11 +1012,13 @@ nvc0_blitctx_post_blit(struct nvc0_blitctx *blit)
    nvc0->dirty = blit->saved.dirty |
       (NVC0_NEW_FRAMEBUFFER | NVC0_NEW_SCISSOR | NVC0_NEW_SAMPLE_MASK |
        NVC0_NEW_RASTERIZER | NVC0_NEW_ZSA | NVC0_NEW_BLEND |
+       NVC0_NEW_VIEWPORT |
        NVC0_NEW_TEXTURES | NVC0_NEW_SAMPLERS |
        NVC0_NEW_VERTPROG | NVC0_NEW_FRAGPROG |
        NVC0_NEW_TCTLPROG | NVC0_NEW_TEVLPROG | NVC0_NEW_GMTYPROG |
        NVC0_NEW_TFB_TARGETS | NVC0_NEW_VERTEX | NVC0_NEW_ARRAYS);
    nvc0->scissors_dirty |= 1;
+   nvc0->viewports_dirty |= 1;
 
    nvc0->base.pipe.set_min_samples(&nvc0->base.pipe, blit->saved.min_samples);
 }
@@ -1188,11 +1190,7 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
 
    nvc0_blitctx_post_blit(blit);
 
-   /* restore viewport */
-
-   BEGIN_NVC0(push, NVC0_3D(VIEWPORT_HORIZ(0)), 2);
-   PUSH_DATA (push, nvc0->vport_int[0]);
-   PUSH_DATA (push, nvc0->vport_int[1]);
+   /* restore viewport transform */
    IMMED_NVC0(push, NVC0_3D(VIEWPORT_TRANSFORM_EN), 1);
 }
 
-- 
1.8.5.5
