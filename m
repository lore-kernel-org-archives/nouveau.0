From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 2/4] nvfx: rework state_fb code to get rid of
	render temps
Date: Tue, 10 Jan 2012 12:41:02 +0100
Message-ID: <1326195664-28384-3-git-send-email-dev@lynxeye.de>
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

This commit rewrites a lot of the state_fb code to support
rendering to targets not aligned to 64 byte.

This allows us to drop the render temporaries as unaligned
targets are the only use-case where they are really needed. The
temporaries code was used for a lot of things more, but apparently
those also work without temps.

There is one regression in piglit fbo-clear-formats, but this will
be fixed with the use of real hardware clears and doesn't matter in
practice as no real application tries to scissor clear a 2x2 pixel
render target.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 src/gallium/drivers/nvfx/nvfx_context.h    |    2 +-
 src/gallium/drivers/nvfx/nvfx_state_emit.c |   59 ++---------
 src/gallium/drivers/nvfx/nvfx_state_fb.c   |  155 ++++++++++-----------------
 src/gallium/drivers/nvfx/nvfx_surface.c    |    2 +
 4 files changed, 72 insertions(+), 146 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_context.h b/src/gallium/drivers/nvfx/nvfx_context.h
index 09d394b..019be6c 100644
--- a/src/gallium/drivers/nvfx/nvfx_context.h
+++ b/src/gallium/drivers/nvfx/nvfx_context.h
@@ -247,7 +247,7 @@ extern void nvfx_vtxfmt_validate(struct nvfx_context *nvfx);
 
 /* nvfx_fb.c */
 extern int nvfx_framebuffer_prepare(struct nvfx_context *nvfx);
-extern void nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result);
+extern void nvfx_framebuffer_validate(struct nvfx_context *nvfx);
 void
 nvfx_framebuffer_relocate(struct nvfx_context *nvfx);
 
diff --git a/src/gallium/drivers/nvfx/nvfx_state_emit.c b/src/gallium/drivers/nvfx/nvfx_state_emit.c
index 25da80e..e2cfb76 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_emit.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_emit.c
@@ -199,7 +199,6 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 	struct nouveau_grobj *eng3d = nvfx->screen->eng3d;
 	unsigned dirty;
 	unsigned still_dirty = 0;
-	int new_fb_mode = -1; /* 1 = all swizzled, 0 = make all linear */
 	boolean flush_tex_cache = FALSE;
 	unsigned render_temps;
 
@@ -213,29 +212,12 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		nvfx->relocs_needed = NVFX_RELOCATE_ALL;
 	}
 
-	/* These can trigger use the of 3D engine to copy temporaries.
-	 * That will recurse here and thus dirty all 3D state, so we need to this before anything else, and in a loop..
-	 * This converges to having clean temps, then binding both fragtexes and framebuffers.
-	 */
-	while(nvfx->dirty & (NVFX_NEW_FB | NVFX_NEW_SAMPLER))
-	{
-		if(nvfx->dirty & NVFX_NEW_SAMPLER)
-		{
-			nvfx->dirty &=~ NVFX_NEW_SAMPLER;
-			nvfx_fragtex_validate(nvfx);
-
-			// TODO: only set this if really necessary
-			flush_tex_cache = TRUE;
-		}
+	if(nvfx->dirty & NVFX_NEW_SAMPLER) {
+		nvfx->dirty &=~ NVFX_NEW_SAMPLER;
+		nvfx_fragtex_validate(nvfx);
 
-		if(nvfx->dirty & NVFX_NEW_FB)
-		{
-			nvfx->dirty &=~ NVFX_NEW_FB;
-			new_fb_mode = nvfx_framebuffer_prepare(nvfx);
-
-			// TODO: make sure this doesn't happen, i.e. fbs have matching formats
-			assert(new_fb_mode >= 0);
-		}
+		// TODO: only set this if really necessary
+		flush_tex_cache = TRUE;
 	}
 
 	dirty = nvfx->dirty;
@@ -305,8 +287,8 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		}
 	}
 
-	if(new_fb_mode >= 0)
-		nvfx_framebuffer_validate(nvfx, new_fb_mode);
+	if(dirty & NVFX_NEW_FB)
+		nvfx_framebuffer_validate(nvfx);
 
 	if(dirty & NVFX_NEW_BLEND)
 		sb_emit(chan, nvfx->blend->sb, nvfx->blend->sb_len);
@@ -324,19 +306,19 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
    etracer, neverball, foobillard, glest totally misrender
    TODO: find the right fix
 */
-	if(dirty & (NVFX_NEW_VIEWPORT | NVFX_NEW_RAST | NVFX_NEW_ZSA) || (new_fb_mode >= 0))
+	if(dirty & (NVFX_NEW_VIEWPORT | NVFX_NEW_RAST | NVFX_NEW_ZSA))
 	{
 		nvfx_state_viewport_validate(nvfx);
 	}
 
-	if(dirty & NVFX_NEW_ZSA || (new_fb_mode >= 0))
+	if(dirty & (NVFX_NEW_ZSA | NVFX_NEW_FB))
 	{
 		BEGIN_RING(chan, eng3d, NV30_3D_DEPTH_WRITE_ENABLE, 2);
 		OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.writemask);
-	        OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.enabled);
+	    OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.enabled);
 	}
 
-	if((new_fb_mode >= 0) || (dirty & NVFX_NEW_FRAGPROG))
+	if(dirty & (NVFX_NEW_FRAGPROG | NVFX_NEW_FB))
 		nvfx_coord_conventions_validate(nvfx);
 
 	if(flush_tex_cache)
@@ -353,25 +335,6 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 
 	nvfx->dirty = dirty & still_dirty;
 
-	render_temps = nvfx->state.render_temps;
-	if(render_temps)
-	{
-		for(int i = 0; i < nvfx->framebuffer.nr_cbufs; ++i)
-		{
-			if(render_temps & (1 << i)) {
-				assert(((struct nvfx_surface*)nvfx->framebuffer.cbufs[i])->temp);
-				util_dirty_surface_set_dirty(nvfx_surface_get_dirty_surfaces(nvfx->framebuffer.cbufs[i]),
-						(struct util_dirty_surface*)nvfx->framebuffer.cbufs[i]);
-			}
-		}
-
-		if(render_temps & 0x80) {
-			assert(((struct nvfx_surface*)nvfx->framebuffer.zsbuf)->temp);
-			util_dirty_surface_set_dirty(nvfx_surface_get_dirty_surfaces(nvfx->framebuffer.zsbuf),
-					(struct util_dirty_surface*)nvfx->framebuffer.zsbuf);
-		}
-	}
-
 	return TRUE;
 }
 
diff --git a/src/gallium/drivers/nvfx/nvfx_state_fb.c b/src/gallium/drivers/nvfx/nvfx_state_fb.c
index 406f5bb..ffc0844 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_fb.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_fb.c
@@ -3,96 +3,25 @@
 #include "util/u_format.h"
 
 static inline boolean
-nvfx_surface_linear_renderable(struct pipe_surface* surf)
+nvfx_surface_linear_target(struct pipe_surface* surf)
 {
-	/* TODO: precompute this in nvfx_surface creation */
-	return (surf->texture->flags & NOUVEAU_RESOURCE_FLAG_LINEAR)
-		&& !(((struct nvfx_surface*)surf)->offset & 63)
-		&& !(((struct nvfx_surface*)surf)->pitch & 63);
+	return !!((struct nvfx_miptree*)surf->texture)->linear_pitch;
 }
 
-static inline boolean
-nvfx_surface_swizzled_renderable(struct pipe_framebuffer_state* fb, struct pipe_surface* surf)
-{
-	/* TODO: precompute this in nvfx_surface creation */
-	return !((struct nvfx_miptree*)surf->texture)->linear_pitch
-		&& (surf->texture->target != PIPE_TEXTURE_3D || u_minify(surf->texture->depth0, surf->u.tex.level) <= 1)
-		&& !(((struct nvfx_surface*)surf)->offset & 127)
-		&& (surf->width == fb->width)
-		&& (surf->height == fb->height)
-		&& !((struct nvfx_surface*)surf)->temp
-		&& (surf->format == PIPE_FORMAT_B8G8R8A8_UNORM || surf->format == PIPE_FORMAT_B8G8R8X8_UNORM || surf->format == PIPE_FORMAT_B5G6R5_UNORM);
-}
-
-static boolean
-nvfx_surface_get_render_target(struct pipe_surface* surf, int all_swizzled, struct nvfx_render_target* target)
+static void
+nvfx_surface_get_render_target(struct pipe_surface* surf,
+                               struct nvfx_render_target* target)
 {
 	struct nvfx_surface* ns = (struct nvfx_surface*)surf;
-	if(!ns->temp)
-	{
-		target->bo = ((struct nvfx_miptree*)surf->texture)->base.bo;
-		target->offset = ns->offset;
-		target->pitch = align(ns->pitch, 64);
-		assert(target->pitch);
-		return FALSE;
-	}
-	else
-	{
-		target->offset = 0;
-		target->pitch = ns->temp->linear_pitch;
-		target->bo = ns->temp->base.bo;
-		assert(target->pitch);
-		return TRUE;
-	}
-}
 
-int
-nvfx_framebuffer_prepare(struct nvfx_context *nvfx)
-{
-	struct pipe_framebuffer_state *fb = &nvfx->framebuffer;
-	int i, color_format = 0, zeta_format = 0;
-	int all_swizzled = 1;
-
-	if(!nvfx->is_nv4x)
-		assert(fb->nr_cbufs <= 1);
-	else
-		assert(fb->nr_cbufs <= 4);
-
-	for (i = 0; i < fb->nr_cbufs; i++) {
-		if (color_format) {
-			if(color_format != fb->cbufs[i]->format)
-				return -1;
-		} else
-			color_format = fb->cbufs[i]->format;
-
-		if(!nvfx_surface_swizzled_renderable(fb, fb->cbufs[i]))
-			all_swizzled = 0;
-	}
-
-	if (fb->zsbuf) {
-		/* TODO: return FALSE if we have a format not supporting a depth buffer (e.g. r8); currently those are not supported at all */
-		if(!nvfx_surface_swizzled_renderable(fb, fb->zsbuf))
-			all_swizzled = 0;
-
-		if(all_swizzled && util_format_get_blocksize(color_format) != util_format_get_blocksize(zeta_format))
-			all_swizzled = 0;
-	}
-
-	for (i = 0; i < fb->nr_cbufs; i++) {
-		if(!((struct nvfx_surface*)fb->cbufs[i])->temp && !all_swizzled && !nvfx_surface_linear_renderable(fb->cbufs[i]))
-			nvfx_surface_create_temp(&nvfx->pipe, fb->cbufs[i]);
-	}
-
-	if(fb->zsbuf) {
-		if(!((struct nvfx_surface*)fb->zsbuf)->temp && !all_swizzled && !nvfx_surface_linear_renderable(fb->zsbuf))
-			nvfx_surface_create_temp(&nvfx->pipe, fb->zsbuf);
-	}
-
-	return all_swizzled;
+	target->bo = ((struct nvfx_miptree*)surf->texture)->base.bo;
+	target->offset = ns->offset;
+	target->pitch = align(ns->pitch, 64);
+	assert(target->pitch);
 }
 
 void
-nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
+nvfx_framebuffer_validate(struct nvfx_context *nvfx)
 {
 	struct pipe_framebuffer_state *fb = &nvfx->framebuffer;
 	struct nouveau_channel *chan = nvfx->screen->base.channel;
@@ -102,37 +31,69 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 	unsigned rt_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
 	unsigned w = fb->width;
 	unsigned h = fb->height;
+	int all_swizzled =1 , cb_format = 0;
+
+	/* do some sanity checks on the render target state and check if the targets
+	 * are swizzled
+	 */
+	nvfx->is_nv4x ? assert(fb->nr_cbufs <= 4) : assert(fb->nr_cbufs <= 1);
+	if(fb->nr_cbufs && fb->zsbuf)
+		assert(util_format_get_blocksize(fb->cbufs[0]->format) ==
+			   util_format_get_blocksize(fb->zsbuf->format));
+
+	for(i = 0; i < fb->nr_cbufs; i++) {
+		if(cb_format)
+			assert(cb_format == fb->cbufs[i]->format);
+		else
+			cb_format = fb->cbufs[i]->format;
+
+		if(nvfx_surface_linear_target(fb->cbufs[i]))
+			all_swizzled = 0;
+	}
+
+	if(fb->zsbuf && nvfx_surface_linear_target(fb->zsbuf))
+		all_swizzled = 0;
 
 	rt_enable = (NV30_3D_RT_ENABLE_COLOR0 << fb->nr_cbufs) - 1;
-	if (rt_enable & (NV30_3D_RT_ENABLE_COLOR1 |
-			 NV40_3D_RT_ENABLE_COLOR2 | NV40_3D_RT_ENABLE_COLOR3))
+	if(rt_enable & (NV30_3D_RT_ENABLE_COLOR1 |
+                    NV40_3D_RT_ENABLE_COLOR2 | NV40_3D_RT_ENABLE_COLOR3))
 		rt_enable |= NV30_3D_RT_ENABLE_MRT;
 
-	nvfx->state.render_temps = 0;
-
-	for (i = 0; i < fb->nr_cbufs; i++)
-		nvfx->state.render_temps |= nvfx_surface_get_render_target(fb->cbufs[i], prepare_result, &nvfx->hw_rt[i]) << i;
+	for(i = 0; i < fb->nr_cbufs; i++)
+		nvfx_surface_get_render_target(fb->cbufs[i], &nvfx->hw_rt[i]);
 
 	for(; i < 4; ++i)
 		nvfx->hw_rt[i].bo = NULL;
 
 	nvfx->hw_zeta.bo = NULL;
 
-	if (fb->zsbuf) {
-		nvfx->state.render_temps |= nvfx_surface_get_render_target(fb->zsbuf, prepare_result, &nvfx->hw_zeta) << 7;
-
-		assert(util_format_get_stride(fb->zsbuf->format, fb->width) <= nvfx->hw_zeta.pitch);
-		assert(nvfx->hw_zeta.offset + nvfx->hw_zeta.pitch * fb->height <= nvfx->hw_zeta.bo->size);
+	if(fb->zsbuf) {
+		nvfx_surface_get_render_target(fb->zsbuf, &nvfx->hw_zeta);
+		assert(util_format_get_stride(fb->zsbuf->format, fb->width) <=
+			   nvfx->hw_zeta.pitch);
 	}
 
-	if (prepare_result) {
-		assert(!(fb->width & (fb->width - 1)) && !(fb->height & (fb->height - 1)));
+	if(all_swizzled) {
+		/* hardware rounds down render target offset to 64 bytes,
+		 * but surfaces with a size of 2x2 pixel (16bpp) or 1x1 pixel (32bpp)
+		 * have an unaligned start address, for those two important square
+		 * formats we can hack around this limitation by adjusting the viewport
+		 */
+		if(nvfx->hw_rt[0].offset & 63) {
+			int delta = nvfx->hw_rt[0].offset & 63;
+			h = 2;
+			w = 16;
+			nvfx->viewport.translate[0] += delta /
+						(util_format_get_blocksize(fb->cbufs[0]->format) * 2);
+			nvfx->dirty |= NVFX_NEW_VIEWPORT;
+		}
 
 		rt_format = NV30_3D_RT_FORMAT_TYPE_SWIZZLED |
-			(util_logbase2(fb->width) << NV30_3D_RT_FORMAT_LOG2_WIDTH__SHIFT) |
-			(util_logbase2(fb->height) << NV30_3D_RT_FORMAT_LOG2_HEIGHT__SHIFT);
-	} else
+			(util_logbase2(w) << NV30_3D_RT_FORMAT_LOG2_WIDTH__SHIFT) |
+			(util_logbase2(h) << NV30_3D_RT_FORMAT_LOG2_HEIGHT__SHIFT);
+	} else {
 		rt_format = NV30_3D_RT_FORMAT_TYPE_LINEAR;
+	}
 
 	if(fb->nr_cbufs > 0) {
 		switch (fb->cbufs[0]->format) {
diff --git a/src/gallium/drivers/nvfx/nvfx_surface.c b/src/gallium/drivers/nvfx/nvfx_surface.c
index cac3fca..73a5260 100644
--- a/src/gallium/drivers/nvfx/nvfx_surface.c
+++ b/src/gallium/drivers/nvfx/nvfx_surface.c
@@ -428,6 +428,8 @@ nvfx_surface_copy_temp(struct pipe_context* pipe, struct pipe_surface* surf, int
 void
 nvfx_surface_create_temp(struct pipe_context* pipe, struct pipe_surface* surf)
 {
+	assert (0);
+
 	struct nvfx_surface* ns = (struct nvfx_surface*)surf;
 	struct pipe_resource template;
 	memset(&template, 0, sizeof(struct pipe_resource));
-- 
1.7.7.5
