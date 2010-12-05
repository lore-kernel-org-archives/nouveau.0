From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] nvfx: fixes after array textures merge
Date: Sun,  5 Dec 2010 01:16:28 +0100
Message-ID: <1291508190-10771-1-git-send-email-chantry.xavier@gmail.com>
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
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

- pipe_surface->context not initialized in nvfx_miptree_surface_new

Should util_surfaces_get handle this initialization and take a pipe_context
rather than a pipe_screen ?

- ns was not properly initialized in nvfx_miptree_surface_new

ns->offset == ~0 test was dead, the initialization of offset to ~0 was done
in util_surfaces_* but was killed together with offset (removed from
pipe_surface)

util_surfaces_get now return a boolean value indicating if pipe surface is
new, so that driver specific fields can be initialized in that case.

- fix bogus assert in nvfx_surface_copy_temp
---
 src/gallium/auxiliary/util/u_surfaces.c |   16 +++++++++++-----
 src/gallium/auxiliary/util/u_surfaces.h |   19 ++++++++++++++-----
 src/gallium/drivers/nvfx/nvfx_miptree.c |   17 +++++++++--------
 src/gallium/drivers/nvfx/nvfx_surface.c |    2 +-
 4 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/src/gallium/auxiliary/util/u_surfaces.c b/src/gallium/auxiliary/util/u_surfaces.c
index 45aa15e..fd55bd1 100644
--- a/src/gallium/auxiliary/util/u_surfaces.c
+++ b/src/gallium/auxiliary/util/u_surfaces.c
@@ -29,10 +29,11 @@
 #include "util/u_inlines.h"
 #include "util/u_memory.h"
 
-struct pipe_surface *
+boolean
 util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
                      struct pipe_screen *pscreen, struct pipe_resource *pt,
-                     unsigned level, unsigned layer, unsigned flags)
+                     unsigned level, unsigned layer, unsigned flags,
+                     struct pipe_surface **res)
 {
    struct pipe_surface *ps;
 
@@ -53,12 +54,16 @@ util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
    if(ps)
    {
       p_atomic_inc(&ps->reference.count);
-      return ps;
+      *res = ps;
+      return FALSE;
    }
 
    ps = (struct pipe_surface *)CALLOC(1, surface_struct_size);
    if(!ps)
-      return NULL;
+   {
+      *res = NULL;
+      return FALSE;
+   }
 
    pipe_surface_init(ps, pt, level, layer, flags);
 
@@ -67,7 +72,8 @@ util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
    else
       us->u.array[level] = ps;
 
-   return ps;
+   *res = ps;
+   return TRUE;
 }
 
 void
diff --git a/src/gallium/auxiliary/util/u_surfaces.h b/src/gallium/auxiliary/util/u_surfaces.h
index 86a1c2f..da4fbbf 100644
--- a/src/gallium/auxiliary/util/u_surfaces.h
+++ b/src/gallium/auxiliary/util/u_surfaces.h
@@ -42,11 +42,19 @@ struct util_surfaces
    } u;
 };
 
-struct pipe_surface *util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size, struct pipe_screen *pscreen, struct pipe_resource *pt, unsigned level, unsigned layer, unsigned flags);
+/* Return value indicates if the pipe surface result is new */
+boolean
+util_surfaces_do_get(struct util_surfaces *us, unsigned surface_struct_size,
+                     struct pipe_screen *pscreen, struct pipe_resource *pt,
+                     unsigned level, unsigned layer, unsigned flags,
+                     struct pipe_surface **res);
 
 /* fast inline path for the very common case */
-static INLINE struct pipe_surface *
-util_surfaces_get(struct util_surfaces *us, unsigned surface_struct_size, struct pipe_screen *pscreen, struct pipe_resource *pt, unsigned level, unsigned layer, unsigned flags)
+static INLINE boolean
+util_surfaces_get(struct util_surfaces *us, unsigned surface_struct_size,
+                  struct pipe_screen *pscreen, struct pipe_resource *pt,
+                  unsigned level, unsigned layer, unsigned flags,
+                  struct pipe_surface **res)
 {
    if(likely((pt->target == PIPE_TEXTURE_2D || pt->target == PIPE_TEXTURE_RECT) && us->u.array))
    {
@@ -54,11 +62,12 @@ util_surfaces_get(struct util_surfaces *us, unsigned surface_struct_size, struct
       if(ps)
       {
 	 p_atomic_inc(&ps->reference.count);
-	 return ps;
+	 *res = ps;
+	 return FALSE;
       }
    }
 
-   return util_surfaces_do_get(us, surface_struct_size, pscreen, pt, level, layer, flags);
+   return util_surfaces_do_get(us, surface_struct_size, pscreen, pt, level, layer, flags, res);
 }
 
 static INLINE struct pipe_surface *
diff --git a/src/gallium/drivers/nvfx/nvfx_miptree.c b/src/gallium/drivers/nvfx/nvfx_miptree.c
index db48025..2f9d553 100644
--- a/src/gallium/drivers/nvfx/nvfx_miptree.c
+++ b/src/gallium/drivers/nvfx/nvfx_miptree.c
@@ -193,18 +193,19 @@ struct pipe_surface *
 nvfx_miptree_surface_new(struct pipe_context *pipe, struct pipe_resource *pt,
 			 const struct pipe_surface *surf_tmpl)
 {
-	struct nvfx_miptree* mt = (struct nvfx_miptree*)pt;
-	struct nvfx_surface *ns;
+	struct nvfx_miptree *mt = (struct nvfx_miptree *)pt;
 	unsigned level = surf_tmpl->u.tex.level;
+	struct nvfx_surface *ns = NULL;
 
 	assert(surf_tmpl->u.tex.first_layer == surf_tmpl->u.tex.last_layer);
-	ns = (struct nvfx_surface*)util_surfaces_get(&mt->surfaces, sizeof(struct nvfx_surface), NULL, pt,
-						     level, surf_tmpl->u.tex.first_layer, surf_tmpl->usage);
-	if(ns->offset == ~0) {
-		util_dirty_surface_init(&ns->base);
-		ns->pitch = nvfx_subresource_pitch(pt, level);
-		ns->offset = nvfx_subresource_offset(pt, surf_tmpl->u.tex.first_layer, level, surf_tmpl->u.tex.first_layer);
+	if(util_surfaces_get(&mt->surfaces, sizeof(struct nvfx_surface), NULL,
+                             pt, level, surf_tmpl->u.tex.first_layer,
+                             surf_tmpl->usage, (struct pipe_surface **)&ns)) {
+                util_dirty_surface_init(&ns->base);
+                ns->pitch = nvfx_subresource_pitch(pt, level);
+                ns->offset = nvfx_subresource_offset(pt, surf_tmpl->u.tex.first_layer, level, surf_tmpl->u.tex.first_layer);
 	}
+        ns->base.base.context = pipe;
 
 	return &ns->base.base;
 }
diff --git a/src/gallium/drivers/nvfx/nvfx_surface.c b/src/gallium/drivers/nvfx/nvfx_surface.c
index 7f315e9..6fd6c47 100644
--- a/src/gallium/drivers/nvfx/nvfx_surface.c
+++ b/src/gallium/drivers/nvfx/nvfx_surface.c
@@ -389,7 +389,7 @@ nvfx_surface_copy_temp(struct pipe_context* pipe, struct pipe_surface* surf, int
 	base_vertex = nvfx->base_vertex;
 
 	box.x = box.y = 0;
-	assert(surf->u.tex.first_layer = surf->u.tex.last_layer);
+	assert(surf->u.tex.first_layer == surf->u.tex.last_layer);
 	box.width = surf->width;
 	box.height = surf->height;
 	box.depth = 1;
-- 
1.7.3.2
