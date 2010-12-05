From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] init ps->context with util_surfaces_get and
	do_get
Date: Sun,  5 Dec 2010 01:16:29 +0100
Message-ID: <1291508190-10771-2-git-send-email-chantry.xavier@gmail.com>
References: <1291508190-10771-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1291508190-10771-1-git-send-email-chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pass pipe_context rather than pipe_screen to util_surfaces_get and
util_surfaces_do_get so that they can check whether the saved pipe_surface
have the current context, and init properly a new pipe_surface with the
current context.

pipe_context is also passed to pipe_surface_reset and pipe_surface_init so
that context initialization is done in one central place.
---
 src/gallium/auxiliary/util/u_inlines.h  |   13 ++++++++-----
 src/gallium/auxiliary/util/u_surfaces.c |    6 +++---
 src/gallium/auxiliary/util/u_surfaces.h |    8 ++++----
 src/gallium/drivers/nvfx/nvfx_miptree.c |    3 +--
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/src/gallium/auxiliary/util/u_inlines.h b/src/gallium/auxiliary/util/u_inlines.h
index d5bc114..e55aafe 100644
--- a/src/gallium/auxiliary/util/u_inlines.h
+++ b/src/gallium/auxiliary/util/u_inlines.h
@@ -136,8 +136,9 @@ pipe_sampler_view_reference(struct pipe_sampler_view **ptr, struct pipe_sampler_
 }
 
 static INLINE void
-pipe_surface_reset(struct pipe_surface* ps, struct pipe_resource *pt,
-                   unsigned level, unsigned layer, unsigned flags)
+pipe_surface_reset(struct pipe_context *ctx, struct pipe_surface* ps,
+                   struct pipe_resource *pt, unsigned level, unsigned layer,
+                   unsigned flags)
 {
    pipe_resource_reference(&ps->texture, pt);
    ps->format = pt->format;
@@ -146,15 +147,17 @@ pipe_surface_reset(struct pipe_surface* ps, struct pipe_resource *pt,
    ps->usage = flags;
    ps->u.tex.level = level;
    ps->u.tex.first_layer = ps->u.tex.last_layer = layer;
+   ps->context = ctx;
 }
 
 static INLINE void
-pipe_surface_init(struct pipe_surface* ps, struct pipe_resource *pt,
-                  unsigned level, unsigned layer, unsigned flags)
+pipe_surface_init(struct pipe_context *ctx, struct pipe_surface* ps,
+                  struct pipe_resource *pt, unsigned level, unsigned layer,
+                  unsigned flags)
 {
    ps->texture = 0;
    pipe_reference_init(&ps->reference, 1);
-   pipe_surface_reset(ps, pt, level, layer, flags);
+   pipe_surface_reset(ctx, ps, pt, level, layer, flags);
 }
 
 /*
diff --git a/src/gallium/auxiliary/util/u_surfaces.c b/src/gallium/auxiliary/util/u_surfaces.c
index fd55bd1..b0cfec2 100644
--- a/src/gallium/auxiliary/util/u_surfaces.c
+++ b/src/gallium/auxiliary/util/u_surfaces.c
@@ -31,7 +31,7 @@
 
 boolean
 util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
-                     struct pipe_screen *pscreen, struct pipe_resource *pt,
+                     struct pipe_context *ctx, struct pipe_resource *pt,
                      unsigned level, unsigned layer, unsigned flags,
                      struct pipe_surface **res)
 {
@@ -51,7 +51,7 @@ util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
       ps = us->u.array[level];
    }
 
-   if(ps)
+   if(ps && ps->context == ctx)
    {
       p_atomic_inc(&ps->reference.count);
       *res = ps;
@@ -65,7 +65,7 @@ util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
       return FALSE;
    }
 
-   pipe_surface_init(ps, pt, level, layer, flags);
+   pipe_surface_init(ctx, ps, pt, level, layer, flags);
 
    if(pt->target == PIPE_TEXTURE_3D || pt->target == PIPE_TEXTURE_CUBE)
       cso_hash_insert(us->u.hash, (layer << 8) | level, ps);
diff --git a/src/gallium/auxiliary/util/u_surfaces.h b/src/gallium/auxiliary/util/u_surfaces.h
index da4fbbf..9581fed 100644
--- a/src/gallium/auxiliary/util/u_surfaces.h
+++ b/src/gallium/auxiliary/util/u_surfaces.h
@@ -45,21 +45,21 @@ struct util_surfaces
 /* Return value indicates if the pipe surface result is new */
 boolean
 util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
-                     struct pipe_screen *pscreen, struct pipe_resource *pt,
+                     struct pipe_context *ctx, struct pipe_resource *pt,
                      unsigned level, unsigned layer, unsigned flags,
                      struct pipe_surface **res);
 
 /* fast inline path for the very common case */
 static INLINE boolean
 util_surfaces_get(struct util_surfaces *us, unsigned surface_struct_size,
-                  struct pipe_screen *pscreen, struct pipe_resource *pt,
+                  struct pipe_context *ctx, struct pipe_resource *pt,
                   unsigned level, unsigned layer, unsigned flags,
                   struct pipe_surface **res)
 {
    if(likely((pt->target == PIPE_TEXTURE_2D || pt->target == PIPE_TEXTURE_RECT) && us->u.array))
    {
       struct pipe_surface *ps = us->u.array[level];
-      if(ps)
+      if(ps && ps->context == ctx)
       {
 	 p_atomic_inc(&ps->reference.count);
 	 *res = ps;
@@ -67,7 +67,7 @@ util_surfaces_get(struct util_surfaces *us, unsigned surface_struct_size,
       }
    }
 
-   return util_surfaces_do_get(us, surface_struct_size, pscreen, pt, level, layer, flags, res);
+   return util_surfaces_do_get(us, surface_struct_size, ctx, pt, level, layer, flags, res);
 }
 
 static INLINE struct pipe_surface *
diff --git a/src/gallium/drivers/nvfx/nvfx_miptree.c b/src/gallium/drivers/nvfx/nvfx_miptree.c
index 2f9d553..8c043b8 100644
--- a/src/gallium/drivers/nvfx/nvfx_miptree.c
+++ b/src/gallium/drivers/nvfx/nvfx_miptree.c
@@ -198,14 +198,13 @@ nvfx_miptree_surface_new(struct pipe_context *pipe, struct pipe_resource *pt,
 	struct nvfx_surface *ns = NULL;
 
 	assert(surf_tmpl->u.tex.first_layer == surf_tmpl->u.tex.last_layer);
-	if(util_surfaces_get(&mt->surfaces, sizeof(struct nvfx_surface), NULL,
+	if(util_surfaces_get(&mt->surfaces, sizeof(struct nvfx_surface), pipe,
                              pt, level, surf_tmpl->u.tex.first_layer,
                              surf_tmpl->usage, (struct pipe_surface **)&ns)) {
                 util_dirty_surface_init(&ns->base);
                 ns->pitch = nvfx_subresource_pitch(pt, level);
                 ns->offset = nvfx_subresource_offset(pt, surf_tmpl->u.tex.first_layer, level, surf_tmpl->u.tex.first_layer);
 	}
-        ns->base.base.context = pipe;
 
 	return &ns->base.base;
 }
-- 
1.7.3.2
