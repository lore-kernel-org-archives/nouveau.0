From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/4] nv30: remove unused render_mode and
	hw_pointsprite_control
Date: Fri, 21 Feb 2014 02:37:11 -0500
Message-ID: <1392968233-26889-2-git-send-email-imirkin@alum.mit.edu>
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

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Were these things that didn't get quite ported over from the old nvfx? If so,
does it matter? Are they things we need? Even if they are, they can be
implemented in a way that doesn't put that state into nv30_context.

 src/gallium/drivers/nouveau/nv30/nv30_context.c |  1 -
 src/gallium/drivers/nouveau/nv30/nv30_context.h | 10 +++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.c b/src/gallium/drivers/nouveau/nv30/nv30_context.c
index 4f68eee..4a4538c 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.c
@@ -235,7 +235,6 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
 
    /*XXX: nvfx... */
    nv30->is_nv4x = (screen->eng3d->oclass >= NV40_3D_CLASS) ? ~0 : 0;
-   nv30->render_mode = HW;
 
    nv30->sample_mask = 0xffff;
    nv30_vbo_init(pipe);
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.h b/src/gallium/drivers/nouveau/nv30/nv30_context.h
index d0cb5f5..864d97a 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.h
@@ -119,16 +119,12 @@ struct nv30_context {
    struct nouveau_heap  *blit_vp;
    struct pipe_resource *blit_fp;
 
-   /*XXX: nvfx state, DO NOT USE EVER OUTSIDE "STOLEN" NVFX code */
-   unsigned is_nv4x;
-   bool hw_pointsprite_control;
-   enum {
-      HW,
-   } render_mode;
-
    struct pipe_query *render_cond_query;
    unsigned render_cond_mode;
    boolean render_cond_cond;
+
+   /*XXX: nvfx state, DO NOT USE EVER OUTSIDE "STOLEN" NVFX code */
+   unsigned is_nv4x;
 };
 
 static INLINE struct nv30_context *
-- 
1.8.3.2
