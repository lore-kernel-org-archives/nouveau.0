From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 3/4] nvfx: drop render temporaries code
Date: Tue, 10 Jan 2012 12:41:03 +0100
Message-ID: <1326195664-28384-4-git-send-email-dev@lynxeye.de>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This code is unneeded now, we don't use render temps any more.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 src/gallium/drivers/nvfx/nvfx_fragtex.c  |    4 -
 src/gallium/drivers/nvfx/nvfx_miptree.c  |   18 +---
 src/gallium/drivers/nvfx/nvfx_resource.h |   30 +------
 src/gallium/drivers/nvfx/nvfx_surface.c  |  138 +++---------------------------
 4 files changed, 18 insertions(+), 172 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_fragtex.c b/src/gallium/drivers/nvfx/nvfx_fragtex.c
index cb87539..036991e 100644
--- a/src/gallium/drivers/nvfx/nvfx_fragtex.c
+++ b/src/gallium/drivers/nvfx/nvfx_fragtex.c
@@ -189,10 +189,6 @@ nvfx_fragtex_validate(struct nvfx_context *nvfx)
 		samplers &= ~(1 << unit);
 
 		if(nvfx->fragment_sampler_views[unit] && nvfx->tex_sampler[unit]) {
-			util_dirty_surfaces_use_for_sampling(&nvfx->pipe,
-					&((struct nvfx_miptree*)nvfx->fragment_sampler_views[unit]->texture)->dirty_surfaces,
-					nvfx_surface_flush);
-
 			if(!nvfx->is_nv4x)
 				nv30_fragtex_set(nvfx, unit);
 			else
diff --git a/src/gallium/drivers/nvfx/nvfx_miptree.c b/src/gallium/drivers/nvfx/nvfx_miptree.c
index 8695aa3..dd9ad35 100644
--- a/src/gallium/drivers/nvfx/nvfx_miptree.c
+++ b/src/gallium/drivers/nvfx/nvfx_miptree.c
@@ -99,9 +99,7 @@ nvfx_miptree_layout(struct nvfx_miptree *mt)
 static void
 nvfx_miptree_surface_final_destroy(struct pipe_surface* ps)
 {
-	struct nvfx_surface* ns = (struct nvfx_surface*)ps;
 	pipe_resource_reference(&ps->texture, 0);
-	pipe_resource_reference((struct pipe_resource**)&ns->temp, 0);
 	FREE(ps);
 }
 
@@ -127,7 +125,6 @@ nvfx_miptree_create_skeleton(struct pipe_screen *pscreen, const struct pipe_reso
                 return NULL;
 
         mt->base.base = *pt;
-        util_dirty_surfaces_init(&mt->dirty_surfaces);
 
         pipe_reference_init(&mt->base.base.reference, 1);
         mt->base.base.screen = pscreen;
@@ -201,24 +198,17 @@ nvfx_miptree_surface_new(struct pipe_context *pipe, struct pipe_resource *pt,
 	if(util_surfaces_get(&mt->surfaces, sizeof(struct nvfx_surface), pipe,
                              pt, level, surf_tmpl->u.tex.first_layer,
                              surf_tmpl->usage, (struct pipe_surface **)&ns)) {
-                util_dirty_surface_init(&ns->base);
                 ns->pitch = nvfx_subresource_pitch(pt, level);
                 ns->offset = nvfx_subresource_offset(pt, surf_tmpl->u.tex.first_layer, level, surf_tmpl->u.tex.first_layer);
 	}
 
-	return &ns->base.base;
+	return &ns->base;
 }
 
 void
 nvfx_miptree_surface_del(struct pipe_context *pipe, struct pipe_surface *ps)
 {
-	struct nvfx_surface* ns = (struct nvfx_surface*)ps;
-
-	if(!ns->temp)
-	{
-		assert(!util_dirty_surface_is_dirty(&ns->base));
-		util_surfaces_detach(&((struct nvfx_miptree*)ps->texture)->surfaces, ps);
-		pipe_resource_reference(&ps->texture, 0);
-		FREE(ps);
-	}
+	util_surfaces_detach(&((struct nvfx_miptree*)ps->texture)->surfaces, ps);
+	pipe_resource_reference(&ps->texture, 0);
+	FREE(ps);
 }
diff --git a/src/gallium/drivers/nvfx/nvfx_resource.h b/src/gallium/drivers/nvfx/nvfx_resource.h
index 6e0493f..4a66358 100644
--- a/src/gallium/drivers/nvfx/nvfx_resource.h
+++ b/src/gallium/drivers/nvfx/nvfx_resource.h
@@ -47,18 +47,6 @@ nvfx_resource_on_gpu(struct pipe_resource* pr)
 
 #define NVFX_MAX_TEXTURE_LEVELS  16
 
-/* We have the following invariants for render temporaries
- *
- * 1. Render temporaries are always linear
- * 2. Render temporaries are always up to date
- * 3. Currently, render temporaries are destroyed when the resource is used for sampling, but kept for any other use
- *
- * Also, we do NOT flush temporaries on any pipe->flush().
- * This is fine, as long as scanout targets and shared resources never need temps.
- *
- * TODO: we may want to also support swizzled temporaries to improve performance in some cases.
- */
-
 struct nvfx_miptree {
         struct nvfx_resource base;
 
@@ -67,15 +55,12 @@ struct nvfx_miptree {
         unsigned level_offset[NVFX_MAX_TEXTURE_LEVELS];
 
         struct util_surfaces surfaces;
-        struct util_dirty_surfaces dirty_surfaces;
 };
 
 struct nvfx_surface {
-	struct util_dirty_surface base;
+	struct pipe_surface base;
 	unsigned pitch;
 	unsigned offset;
-
-	struct nvfx_miptree* temp;
 };
 
 static INLINE struct nouveau_bo *
@@ -86,13 +71,6 @@ nvfx_surface_buffer(struct pipe_surface *surf)
 	return mt->bo;
 }
 
-static INLINE struct util_dirty_surfaces*
-nvfx_surface_get_dirty_surfaces(struct pipe_surface* surf)
-{
-	struct nvfx_miptree *mt = (struct nvfx_miptree *)surf->texture;
-	return &mt->dirty_surfaces;
-}
-
 void
 nvfx_init_resource_functions(struct pipe_context *pipe);
 
@@ -159,12 +137,6 @@ nvfx_subresource_pitch(struct pipe_resource* pt, unsigned level)
 	}
 }
 
-void
-nvfx_surface_create_temp(struct pipe_context* pipe, struct pipe_surface* surf);
-
-void
-nvfx_surface_flush(struct pipe_context* pipe, struct pipe_surface* surf);
-
 struct nvfx_buffer
 {
 	struct nvfx_resource base;
diff --git a/src/gallium/drivers/nvfx/nvfx_surface.c b/src/gallium/drivers/nvfx/nvfx_surface.c
index 73a5260..4dd6ccc 100644
--- a/src/gallium/drivers/nvfx/nvfx_surface.c
+++ b/src/gallium/drivers/nvfx/nvfx_surface.c
@@ -90,31 +90,20 @@ nvfx_region_init_for_surface(struct nv04_region* rgn, struct nvfx_surface* surf,
 	rgn->y = y;
 	rgn->z = 0;
 
-	if(surf->temp)
-	{
-		rgn->bo = surf->temp->base.bo;
-		rgn->offset = 0;
-		rgn->pitch = surf->temp->linear_pitch;
-
-		if(for_write)
-			util_dirty_surface_set_dirty(nvfx_surface_get_dirty_surfaces(&surf->base.base), &surf->base);
-	} else {
-		rgn->bo = ((struct nvfx_resource*)surf->base.base.texture)->bo;
-		rgn->offset = surf->offset;
-
-		if(surf->base.base.texture->flags & NOUVEAU_RESOURCE_FLAG_LINEAR)
-			rgn->pitch = surf->pitch;
-	        else
-	        {
-		        rgn->pitch = 0;
-		        rgn->z = surf->base.base.u.tex.first_layer;
-		        rgn->w = surf->base.base.width;
-		        rgn->h = surf->base.base.height;
-		        rgn->d = u_minify(surf->base.base.texture->depth0, surf->base.base.u.tex.level);
-	        }
+	rgn->bo = ((struct nvfx_resource*)surf->base.texture)->bo;
+	rgn->offset = surf->offset;
+
+	if(surf->base.texture->flags & NOUVEAU_RESOURCE_FLAG_LINEAR)
+		rgn->pitch = surf->pitch;
+	else {
+		rgn->pitch = 0;
+		rgn->z = surf->base.u.tex.first_layer;
+		rgn->w = surf->base.width;
+		rgn->h = surf->base.height;
+		rgn->d = u_minify(surf->base.texture->depth0, surf->base.u.tex.level);
 	}
 
-	nvfx_region_set_format(rgn, surf->base.base.format);
+	nvfx_region_set_format(rgn, surf->base.format);
 	if(!rgn->pitch)
 		nv04_region_try_to_linearize(rgn);
 }
@@ -125,7 +114,7 @@ nvfx_region_init_for_subresource(struct nv04_region* rgn, struct pipe_resource*
 	if(pt->target != PIPE_BUFFER)
 	{
 		struct nvfx_surface* ns = (struct nvfx_surface*)util_surfaces_peek(&((struct nvfx_miptree*)pt)->surfaces, pt, level, z);
-		if(ns && util_dirty_surface_is_dirty(&ns->base))
+		if(ns)
 		{
 			nvfx_region_init_for_surface(rgn, ns, x, y, for_write);
 			return;
@@ -376,107 +365,6 @@ nvfx_screen_surface_init(struct pipe_screen *pscreen)
 }
 
 static void
-nvfx_surface_copy_temp(struct pipe_context* pipe, struct pipe_surface* surf, int to_temp)
-{
-	struct nvfx_surface* ns = (struct nvfx_surface*)surf;
-	struct pipe_box box;
-	struct nvfx_context* nvfx = nvfx_context(pipe);
-	struct nvfx_miptree* temp;
-	unsigned use_vertex_buffers;
-	boolean use_index_buffer;
-	unsigned base_vertex;
-
-	/* temporarily detach the temp, so it isn't used in place of the actual resource */
-	temp = ns->temp;
-	ns->temp = 0;
-
-	// TODO: we really should do this validation before setting these variable in draw calls
-	use_vertex_buffers = nvfx->use_vertex_buffers;
-	use_index_buffer = nvfx->use_index_buffer;
-	base_vertex = nvfx->base_vertex;
-
-	box.x = box.y = 0;
-	assert(surf->u.tex.first_layer == surf->u.tex.last_layer);
-	box.width = surf->width;
-	box.height = surf->height;
-	box.depth = 1;
-
-	if(to_temp) {
-	        box.z = surf->u.tex.first_layer;
-		nvfx_resource_copy_region(pipe, &temp->base.base, 0, 0, 0, 0, surf->texture, surf->u.tex.level, &box);
-	}
-	else {
-		box.z = 0;
-		nvfx_resource_copy_region(pipe, surf->texture, surf->u.tex.level, 0, 0, surf->u.tex.first_layer, &temp->base.base, 0, &box);
-	}
-
-	/* If this triggers, it probably means we attempted to use the blitter
-	 * but failed due to non-renderability of the target.
-	 * Obviously, this would lead to infinite recursion if supported. */
-	assert(!ns->temp);
-
-	ns->temp = temp;
-
-	nvfx->use_vertex_buffers = use_vertex_buffers;
-	nvfx->use_index_buffer = use_index_buffer;
-        nvfx->base_vertex = base_vertex;
-
-	nvfx->dirty |= NVFX_NEW_ARRAYS;
-	nvfx->draw_dirty |= NVFX_NEW_ARRAYS;
-}
-
-void
-nvfx_surface_create_temp(struct pipe_context* pipe, struct pipe_surface* surf)
-{
-	assert (0);
-
-	struct nvfx_surface* ns = (struct nvfx_surface*)surf;
-	struct pipe_resource template;
-	memset(&template, 0, sizeof(struct pipe_resource));
-	template.target = PIPE_TEXTURE_2D;
-	template.format = surf->format;
-	template.width0 = surf->width;
-	template.height0 = surf->height;
-	template.depth0 = 1;
-	template.nr_samples = surf->texture->nr_samples;
-	template.flags = NOUVEAU_RESOURCE_FLAG_LINEAR;
-
-	assert(!ns->temp && !util_dirty_surface_is_dirty(&ns->base));
-
-	ns->temp = (struct nvfx_miptree*)nvfx_miptree_create(pipe->screen, &template);
-	nvfx_surface_copy_temp(pipe, surf, 1);
-}
-
-void
-nvfx_surface_flush(struct pipe_context* pipe, struct pipe_surface* surf)
-{
-	struct nvfx_context* nvfx = (struct nvfx_context*)pipe;
-	struct nvfx_surface* ns = (struct nvfx_surface*)surf;
-	boolean bound = FALSE;
-
-	nvfx_surface_copy_temp(pipe, surf, 0);
-
-	util_dirty_surface_set_clean(nvfx_surface_get_dirty_surfaces(surf), &ns->base);
-
-	if(nvfx->framebuffer.zsbuf == surf)
-		bound = TRUE;
-	else
-	{
-		for(unsigned i = 0; i < nvfx->framebuffer.nr_cbufs; ++i)
-		{
-			if(nvfx->framebuffer.cbufs[i] == surf)
-			{
-				bound = TRUE;
-				break;
-			}
-		}
-	}
-
-	if(!bound)
-		pipe_resource_reference((struct pipe_resource**)&ns->temp, 0);
-}
-
-static void
 nvfx_clear_render_target(struct pipe_context *pipe,
 			 struct pipe_surface *dst,
 			 const union pipe_color_union *color,
-- 
1.7.7.5
