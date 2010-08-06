From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] mesa: nv vpe
Date: Thu, 5 Aug 2010 22:41:30 -0400
Message-ID: <20100805224130.24be9add@amd64linuxmsi.rentzhouse.lan>
References: <20100805223618.1cdcbb08@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100805223618.1cdcbb08-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch includes all the relevant nv vpe mesa support.
This patch applies against the latest mesa.pipe-video branch.

This is where all the real nv vpe work is done.

There are several changes required:
* Modify the existing pipe-video arch to support nv vpe - 
1. Push decode verifiction down into each context creation method.
2. Add some new decode flags into the context creation method.
3. Add some surface init/query methods - 
This includes a full XVMCQuerySurface/XVMCSyncSurface support.
* Modify the pipe-video vl compositor to support nv12 surfaces.
This means the frag shader/renderer needs to deal with 2 luma+chroma 
surfaces.

* Add the nv vpe video context - This uses the nv vpe video renderer for 
render and the vl compositor for display. 
Since the render output is nv12 the pipe video surface is actually made up 
of 2 surfaces.  One for luma (R8) and one for chroma (G8B8 and 1/2 luma).
* Add the nv vpe video renderer - 
This includes:
	* Open/close vpe channel.
	* Allocate/free vpe output surface from a buffer object.
	* Query vpe output surface status.
	* MB render.

* Hookup the nv vpe video context in the nvfx video context chain.

* Add the G8B8_UNORM pipe texture format.
This is required for the luma portion of the nv12 format for component
swizziling purposes.
* Add nv40 fragtex texture mapping for R8_UNORM and G8B8_UNORM with the
correct component swizzles.

Signed-off-by: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>



diff --git a/src/gallium/auxiliary/util/u_format.csv b/src/gallium/auxiliary/util/u_format.csv
index 0811280..178e854 100644
--- a/src/gallium/auxiliary/util/u_format.csv
+++ b/src/gallium/auxiliary/util/u_format.csv
@@ -201,6 +201,7 @@ PIPE_FORMAT_R16G16B16_SSCALED     , plain, 1, 1, s16 , s16 , s16 ,     , xyz1, r
 PIPE_FORMAT_R16G16B16A16_SSCALED  , plain, 1, 1, s16 , s16 , s16 , s16 , xyzw, rgb
 PIPE_FORMAT_R8_UNORM              , plain, 1, 1, un8 ,     ,     ,     , x001, rgb
 PIPE_FORMAT_R8G8_UNORM            , plain, 1, 1, un8 , un8 ,     ,     , xy01, rgb
+PIPE_FORMAT_G8B8_UNORM            , plain, 1, 1, un8 , un8 ,     ,     , yxyx, rgb
 PIPE_FORMAT_R8G8B8_UNORM          , plain, 1, 1, un8 , un8 , un8 ,     , xyz1, rgb
 PIPE_FORMAT_R8G8B8A8_UNORM        , plain, 1, 1, un8 , un8 , un8 , un8 , xyzw, rgb
 PIPE_FORMAT_R8_USCALED            , plain, 1, 1, u8  ,     ,     ,     , x001, rgb
diff --git a/src/gallium/auxiliary/vl/vl_compositor.c b/src/gallium/auxiliary/vl/vl_compositor.c
index 0640b1a..8dc0cef 100644
--- a/src/gallium/auxiliary/vl/vl_compositor.c
+++ b/src/gallium/auxiliary/vl/vl_compositor.c
@@ -98,6 +98,53 @@ create_vert_shader(struct vl_compositor *c)
 }
 
 static bool
+create_frag_shader_nv12_2_rgb(struct vl_compositor *c)
+{
+   struct ureg_program *shader;
+   struct ureg_src tc;
+   struct ureg_src csc[4];
+   struct ureg_src luma_sampler;
+   struct ureg_src chroma_sampler;
+   struct ureg_dst texel;
+   struct ureg_dst fragment;
+   unsigned i;
+
+   shader = ureg_create(TGSI_PROCESSOR_FRAGMENT);
+   if (!shader)
+      return false;
+
+   tc = ureg_DECL_fs_input(shader, TGSI_SEMANTIC_GENERIC, 1, TGSI_INTERPOLATE_LINEAR);
+   for (i = 0; i < 4; ++i)
+      csc[i] = ureg_DECL_constant(shader, i);
+   luma_sampler = ureg_DECL_sampler(shader, 0);
+   chroma_sampler = ureg_DECL_sampler(shader, 1);
+   texel = ureg_DECL_temporary(shader);
+   fragment = ureg_DECL_output(shader, TGSI_SEMANTIC_COLOR, 0);   
+   
+   ureg_MOV(shader, texel, ureg_imm4f(shader, 0.0f, 0.0f, 0.0f, 1.0f));
+   ureg_TEX(shader, ureg_writemask(texel, TGSI_WRITEMASK_X), TGSI_TEXTURE_2D, tc, luma_sampler);
+   ureg_TEX(shader, ureg_writemask(texel, TGSI_WRITEMASK_Y | TGSI_WRITEMASK_Z), TGSI_TEXTURE_2D, tc, chroma_sampler);
+
+   /*
+    * texel = {0,0,0,1}
+    * texel.x = tex(tc, luma_sampler)
+    * texel.yz = tex(tc, chroma_sampler)
+    * fragment = csc * texel
+    */
+   for (i = 0; i < 4; ++i)
+      ureg_DP4(shader, ureg_writemask(fragment, TGSI_WRITEMASK_X << i), csc[i], ureg_src(texel));
+      
+   ureg_release_temporary(shader, texel);
+   ureg_END(shader);
+
+   c->fragment_shader.ycbcr_2_rgb = ureg_create_shader_and_destroy(shader, c->pipe);
+   if (!c->fragment_shader.ycbcr_2_rgb)
+      return false;
+
+   return true;
+}
+
+static bool
 create_frag_shader_ycbcr_2_rgb(struct vl_compositor *c)
 {
    struct ureg_program *shader;
@@ -190,8 +237,10 @@ init_pipe_state(struct vl_compositor *c)
    /*sampler.max_lod = ;*/
    /*sampler.border_color[i] = ;*/
    /*sampler.max_anisotropy = ;*/
-   c->sampler = c->pipe->create_sampler_state(c->pipe, &sampler);
-
+   c->sampler[0] = c->pipe->create_sampler_state(c->pipe, &sampler);
+   if (c->src_surface_format == PIPE_FORMAT_NV12)
+        c->sampler[1] = c->pipe->create_sampler_state(c->pipe, &sampler);
+      
    return true;
 }
 
@@ -199,7 +248,9 @@ static void cleanup_pipe_state(struct vl_compositor *c)
 {
    assert(c);
 
-   c->pipe->delete_sampler_state(c->pipe, c->sampler);
+   c->pipe->delete_sampler_state(c->pipe, c->sampler[0]);
+   if (c->src_surface_format == PIPE_FORMAT_NV12)
+        c->pipe->delete_sampler_state(c->pipe, c->sampler[1]);
 }
 
 static bool
@@ -207,14 +258,25 @@ init_shaders(struct vl_compositor *c)
 {
    assert(c);
 
+   if (c->src_surface_format != PIPE_FORMAT_NV12) {
+       if (!create_frag_shader_ycbcr_2_rgb(c)) {
+          debug_printf("Unable to create YCbCr-to-RGB fragment shader.\n");
+          return false;
+       }
+   }
+   else {
+       
+       if (!create_frag_shader_nv12_2_rgb(c)) {
+          debug_printf("Unable to create NV12-to-RGB fragment shader.\n");
+          return false;
+       }
+   }
+   
    if (!create_vert_shader(c)) {
       debug_printf("Unable to create vertex shader.\n");
       return false;
-   }
-   if (!create_frag_shader_ycbcr_2_rgb(c)) {
-      debug_printf("Unable to create YCbCr-to-RGB fragment shader.\n");
-      return false;
-   }
+    }
+
    if (!create_frag_shader_rgb_2_rgb(c)) {
       debug_printf("Unable to create RGB-to-RGB fragment shader.\n");
       return false;
@@ -308,7 +370,8 @@ texview_map_delete(const struct keymap *map,
    pipe_sampler_view_reference(&sv, NULL);
 }
 
-bool vl_compositor_init(struct vl_compositor *compositor, struct pipe_context *pipe)
+bool vl_compositor_init(struct vl_compositor *compositor, struct pipe_context *pipe,
+                        enum pipe_format src_surface_format)
 {
    unsigned i;
 
@@ -317,6 +380,7 @@ bool vl_compositor_init(struct vl_compositor *compositor, struct pipe_context *p
    memset(compositor, 0, sizeof(struct vl_compositor));
 
    compositor->pipe = pipe;
+   compositor->src_surface_format = src_surface_format;
 
    compositor->texview_map = util_new_keymap(sizeof(struct pipe_surface*), -1,
                                              texview_map_delete);
@@ -519,6 +583,84 @@ static unsigned gen_data(struct vl_compositor *c,
    return num_rects;
 }
 
+static void draw_nv12_layers(struct vl_compositor *c,
+                             struct pipe_surface *src_luma_surface,
+                             struct pipe_surface *src_chroma_surface,
+                             struct pipe_video_rect *src_rect,
+                             struct pipe_video_rect *dst_rect)
+{
+   unsigned num_rects;
+   struct pipe_surface *src_surfaces[VL_COMPOSITOR_MAX_LAYERS + 2];
+   void *frag_shaders[VL_COMPOSITOR_MAX_LAYERS + 2];
+   unsigned i;
+   boolean is_video_surface = FALSE;
+   struct pipe_sampler_view templat;
+   struct pipe_surface *src_chroma_surf_ref = src_chroma_surface;
+   struct pipe_sampler_view *surface_views[2] = {NULL, NULL};
+
+   assert(c);
+   assert(src_luma_surface);
+   assert(src_chroma_surface);
+   assert(src_rect);
+   assert(dst_rect);
+
+   num_rects = gen_data(c, src_luma_surface, src_rect, dst_rect, src_surfaces,
+                    frag_shaders);
+
+   for (i = 0; i < num_rects; ++i) {
+      boolean delete_view = FALSE;
+      is_video_surface = FALSE;
+
+      surface_views[0] = (struct pipe_sampler_view*)util_keymap_lookup(c->texview_map, &src_surfaces[i]);
+      if (!surface_views[0]) {
+         u_sampler_view_default_template(&templat, src_surfaces[i]->texture,
+                                         src_surfaces[i]->texture->format);
+         surface_views[0] = c->pipe->create_sampler_view(c->pipe, src_surfaces[i]->texture,
+                                                     &templat);
+         if (!surface_views[0])
+            return;
+
+         delete_view = !util_keymap_insert(c->texview_map, &src_surfaces[i],
+                                           surface_views[0], c->pipe);
+      }
+      
+      if (src_surfaces[i] == src_luma_surface)
+         is_video_surface = TRUE;
+      
+      c->pipe->bind_fs_state(c->pipe, frag_shaders[i]);
+      if (is_video_surface) {
+          boolean delete_cview = FALSE;
+          
+          surface_views[1] = (struct pipe_sampler_view*)util_keymap_lookup(c->texview_map, &src_chroma_surf_ref);
+          if (!surface_views[1]) {
+             u_sampler_view_default_template(&templat, src_chroma_surf_ref->texture,
+                                             src_chroma_surf_ref->texture->format);
+             surface_views[1] = c->pipe->create_sampler_view(c->pipe, src_chroma_surf_ref->texture,
+                                                         &templat);
+             if (!surface_views[1])
+                return;
+
+             delete_cview = !util_keymap_insert(c->texview_map, &src_chroma_surf_ref,
+                                               surface_views[1], c->pipe);                               
+          }
+          
+          c->pipe->set_fragment_sampler_views(c->pipe, 2, surface_views);
+          c->pipe->draw_arrays(c->pipe, PIPE_PRIM_TRIANGLES, i * 6, 6);
+          
+          if (delete_cview)
+            pipe_sampler_view_reference(&surface_views[1], NULL);
+      }
+      else {
+          c->pipe->set_fragment_sampler_views(c->pipe, 1, surface_views);
+          c->pipe->draw_arrays(c->pipe, PIPE_PRIM_TRIANGLES, i * 6, 6);
+      }
+
+      if (delete_view) {
+         pipe_sampler_view_reference(&surface_views[0], NULL);
+      }
+   }
+}
+
 static void draw_layers(struct vl_compositor *c,
                         struct pipe_surface *src_surface,
                         struct pipe_video_rect *src_rect,
@@ -604,7 +746,7 @@ void vl_compositor_render(struct vl_compositor          *compositor,
 
    compositor->pipe->set_framebuffer_state(compositor->pipe, &compositor->fb_state);
    compositor->pipe->set_viewport_state(compositor->pipe, &compositor->viewport);
-   compositor->pipe->bind_fragment_sampler_states(compositor->pipe, 1, &compositor->sampler);
+   compositor->pipe->bind_fragment_sampler_states(compositor->pipe, 1, compositor->sampler);
    compositor->pipe->bind_vs_state(compositor->pipe, compositor->vertex_shader);
    compositor->pipe->set_vertex_buffers(compositor->pipe, 1, &compositor->vertex_buf);
    compositor->pipe->bind_vertex_elements_state(compositor->pipe, compositor->vertex_elems_state);
@@ -616,6 +758,62 @@ void vl_compositor_render(struct vl_compositor          *compositor,
    compositor->pipe->flush(compositor->pipe, PIPE_FLUSH_RENDER_CACHE, fence);
 }
 
+void vl_compositor_render_nv12(struct vl_compositor       *compositor,
+                            struct pipe_surface           *src_luma_surface,
+                            struct pipe_surface           *src_chroma_surface,
+                            enum pipe_mpeg12_picture_type picture_type,
+                            /*unsigned                    num_past_surfaces,
+                            struct pipe_surface           *past_surfaces,
+                            unsigned                      num_future_surfaces,
+                            struct pipe_surface           *future_surfaces,*/
+                            struct pipe_video_rect        *src_area,
+                            struct pipe_surface           *dst_surface,
+                            struct pipe_video_rect        *dst_area,
+                            struct pipe_fence_handle      **fence)
+{
+   assert(compositor);
+   assert(src_luma_surface);
+   assert(src_chroma_surface);
+   assert(src_area);
+   assert(dst_surface);
+   assert(dst_area);
+   assert(picture_type == PIPE_MPEG12_PICTURE_TYPE_FRAME);
+   assert(compositor->src_surface_format == PIPE_FORMAT_NV12);
+
+   if (compositor->fb_state.width != dst_surface->width) {
+      compositor->fb_inv_size.x = 1.0f / dst_surface->width;
+      compositor->fb_state.width = dst_surface->width;
+   }
+   if (compositor->fb_state.height != dst_surface->height) {
+      compositor->fb_inv_size.y = 1.0f / dst_surface->height;
+      compositor->fb_state.height = dst_surface->height;
+   }
+   
+   compositor->fb_state.cbufs[0] = dst_surface;
+
+   compositor->viewport.scale[0] = compositor->fb_state.width;
+   compositor->viewport.scale[1] = compositor->fb_state.height;
+   compositor->viewport.scale[2] = 1;
+   compositor->viewport.scale[3] = 1;
+   compositor->viewport.translate[0] = 0;
+   compositor->viewport.translate[1] = 0;
+   compositor->viewport.translate[2] = 0;
+   compositor->viewport.translate[3] = 0;
+
+   compositor->pipe->set_framebuffer_state(compositor->pipe, &compositor->fb_state);
+   compositor->pipe->set_viewport_state(compositor->pipe, &compositor->viewport);
+   compositor->pipe->bind_fragment_sampler_states(compositor->pipe, 2, compositor->sampler);
+   compositor->pipe->bind_vs_state(compositor->pipe, compositor->vertex_shader);
+   compositor->pipe->set_vertex_buffers(compositor->pipe, 1, &compositor->vertex_buf);
+   compositor->pipe->bind_vertex_elements_state(compositor->pipe, compositor->vertex_elems_state);
+   compositor->pipe->set_constant_buffer(compositor->pipe, PIPE_SHADER_FRAGMENT, 0, compositor->fs_const_buf);
+
+   draw_nv12_layers(compositor, src_luma_surface, src_chroma_surface, src_area, dst_area);
+
+   assert(!compositor->dirty_bg && !compositor->dirty_layers);
+   compositor->pipe->flush(compositor->pipe, PIPE_FLUSH_RENDER_CACHE, fence);
+}
+
 void vl_compositor_set_csc_matrix(struct vl_compositor *compositor, const float *mat)
 {
    struct pipe_transfer *buf_transfer;
diff --git a/src/gallium/auxiliary/vl/vl_compositor.h b/src/gallium/auxiliary/vl/vl_compositor.h
index 820c9ef..e53d1e2 100644
--- a/src/gallium/auxiliary/vl/vl_compositor.h
+++ b/src/gallium/auxiliary/vl/vl_compositor.h
@@ -42,9 +42,10 @@ struct vl_compositor
 {
    struct pipe_context *pipe;
 
+   enum pipe_format src_surface_format;
    struct pipe_framebuffer_state fb_state;
    struct vertex2f fb_inv_size;
-   void *sampler;
+   void *sampler[2];
    struct pipe_sampler_view *sampler_view;
    void *vertex_shader;
    struct
@@ -68,7 +69,8 @@ struct vl_compositor
    struct keymap *texview_map;
 };
 
-bool vl_compositor_init(struct vl_compositor *compositor, struct pipe_context *pipe);
+bool vl_compositor_init(struct vl_compositor *compositor, struct pipe_context *pipe,
+                        enum pipe_format src_surface_format);
 
 void vl_compositor_cleanup(struct vl_compositor *compositor);
 
@@ -92,6 +94,19 @@ void vl_compositor_render(struct vl_compositor          *compositor,
                           struct pipe_surface           *dst_surface,
                           struct pipe_video_rect        *dst_area,
                           struct pipe_fence_handle      **fence);
+                          
+void vl_compositor_render_nv12(struct vl_compositor       *compositor,
+                            struct pipe_surface           *src_luma_surface,
+                            struct pipe_surface           *src_chroma_surface,
+                            enum pipe_mpeg12_picture_type picture_type,
+                            /*unsigned                    num_past_surfaces,
+                            struct pipe_surface           *past_surfaces,
+                            unsigned                      num_future_surfaces,
+                            struct pipe_surface           *future_surfaces,*/
+                            struct pipe_video_rect        *src_area,
+                            struct pipe_surface           *dst_surface,
+                            struct pipe_video_rect        *dst_area,
+                            struct pipe_fence_handle      **fence);
 
 void vl_compositor_set_csc_matrix(struct vl_compositor *compositor, const float *mat);
 
diff --git a/src/gallium/drivers/nouveau/nouveau_winsys.h b/src/gallium/drivers/nouveau/nouveau_winsys.h
index cd7da99..0bc9eeb 100644
--- a/src/gallium/drivers/nouveau/nouveau_winsys.h
+++ b/src/gallium/drivers/nouveau/nouveau_winsys.h
@@ -12,6 +12,9 @@
 #include "nouveau/nouveau_notifier.h"
 #include "nouveau/nouveau_resource.h"
 #include "nouveau/nouveau_pushbuf.h"
+#include "nouveau/nouveau_vpe_hw.h"
+#include "nouveau/nouveau_vpe_channel.h"
+#include "nouveau/nouveau_vpe_pushbuf.h"
 
 static inline uint32_t
 nouveau_screen_transfer_flags(unsigned pipe)
diff --git a/src/gallium/drivers/nvfx/Makefile b/src/gallium/drivers/nvfx/Makefile
index e7ca6e6..3f9c19a 100644
--- a/src/gallium/drivers/nvfx/Makefile
+++ b/src/gallium/drivers/nvfx/Makefile
@@ -30,7 +30,9 @@ C_SOURCES = \
 	nvfx_transfer.c \
 	nvfx_vbo.c \
 	nvfx_vertprog.c \
-	nvfx_video_context.c
+	nvfx_video_context.c \
+	nvfx_vpe_video_context.c \
+	nvfx_vpe_mpeg2_mc_renderer.c
 
 LIBRARY_INCLUDES = \
 	-I$(TOP)/src/gallium/drivers/nouveau/include
diff --git a/src/gallium/drivers/nvfx/nv40_fragtex.c b/src/gallium/drivers/nvfx/nv40_fragtex.c
index 0068b1b..b38a777 100644
--- a/src/gallium/drivers/nvfx/nv40_fragtex.c
+++ b/src/gallium/drivers/nvfx/nv40_fragtex.c
@@ -87,6 +87,8 @@ nv40_texture_formats[] = {
 	_(DXT1_RGBA     , DXT1    ,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
 	_(DXT3_RGBA     , DXT3    ,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
 	_(DXT5_RGBA     , DXT5    ,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
+	_(R8_UNORM      , L8      ,   S1,   S1,   S1,   S1, X, X, X, X, 0, 0, 0, 0),
+	_(G8B8_UNORM    , A8L8    ,   S1,   S1,   S1,   S1, Y, X, Y, X, 0, 0, 0, 0),
 	{},
 };
 
diff --git a/src/gallium/drivers/nvfx/nvfx_video_context.c b/src/gallium/drivers/nvfx/nvfx_video_context.c
index 9212ae5..49fe3cc 100644
--- a/src/gallium/drivers/nvfx/nvfx_video_context.c
+++ b/src/gallium/drivers/nvfx/nvfx_video_context.c
@@ -26,24 +26,35 @@
  **************************************************************************/
 
 #include "nvfx_video_context.h"
+#include "nvfx_vpe_video_context.h"
 #include <softpipe/sp_video_context.h>
 
 struct pipe_video_context *
 nvfx_video_create(struct pipe_screen *screen, enum pipe_video_profile profile,
                   enum pipe_video_chroma_format chroma_format,
+                  enum pipe_video_entry_point entry_point,
+                  unsigned decode_flags,
                   unsigned width, unsigned height, void *priv)
 {
    struct pipe_context *pipe;
+   struct pipe_video_context  *pvctx;
 
    assert(screen);
 
    pipe = screen->context_create(screen, priv);
    if (!pipe)
       return NULL;
-
-   return sp_video_create_ex(pipe, profile, chroma_format, width, height,
+      
+    /* Try to create vpe context first.*/
+   pvctx = nv_vpe_video_create(pipe, profile, chroma_format, entry_point,
+                            decode_flags, width, height, priv);
+                  
+   if (!pvctx)
+	   pvctx = sp_video_create_ex(pipe, profile, chroma_format, entry_point, 
+                             decode_flags, width, height,
                              VL_MPEG12_MC_RENDERER_BUFFER_PICTURE,
                              VL_MPEG12_MC_RENDERER_EMPTY_BLOCK_XFER_ONE,
                              true,
                              PIPE_FORMAT_VUYX);
+   return pvctx;
 }
diff --git a/src/gallium/drivers/nvfx/nvfx_video_context.h b/src/gallium/drivers/nvfx/nvfx_video_context.h
index 6619427..50e178a 100644
--- a/src/gallium/drivers/nvfx/nvfx_video_context.h
+++ b/src/gallium/drivers/nvfx/nvfx_video_context.h
@@ -29,10 +29,12 @@
 #define __NVFX_VIDEO_CONTEXT_H__
 
 #include <pipe/p_video_context.h>
-
+                  
 struct pipe_video_context *
 nvfx_video_create(struct pipe_screen *screen, enum pipe_video_profile profile,
                   enum pipe_video_chroma_format chroma_format,
+                  enum pipe_video_entry_point entry_point,
+                  unsigned decode_flags,
                   unsigned width, unsigned height, void *priv);
 
 #endif
diff --git a/src/gallium/drivers/nvfx/nvfx_vpe_mpeg2_mc_renderer.c b/src/gallium/drivers/nvfx/nvfx_vpe_mpeg2_mc_renderer.c
new file mode 100644
index 0000000..d9796e4
--- /dev/null
+++ b/src/gallium/drivers/nvfx/nvfx_vpe_mpeg2_mc_renderer.c
@@ -0,0 +1,1053 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+ 
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <errno.h>
+
+#include <pipe/p_compiler.h>
+#include <pipe/p_state.h>
+#include <pipe/p_video_state.h>
+#include <util/u_memory.h>
+#include <util/u_rect.h>
+#include <util/u_video.h>
+
+#include <nouveau/nouveau_winsys.h>
+#include "nvfx_screen.h"
+#include "nvfx_resource.h"
+#include "nvfx_vpe_video_context.h"
+#include "nvfx_vpe_mpeg2_mc_renderer.h"
+
+static __inline__ boolean 
+is_odd_multiple(int val, int multiplier)
+{
+	return ( (val / multiplier) & 1);
+}
+
+static void 
+nv_vpe_mpeg2_mb_dct_header(struct nouveau_vpe_channel *vpe_channel,
+						boolean is_luma, 
+						enum pipe_mpeg12_picture_type picture_type, 
+						int target_surface_index, 
+						struct pipe_mpeg12_macroblock *mb)
+{
+	unsigned int base_dct;
+	unsigned int is_field_dct;
+	unsigned int luma_dct_extra;
+	unsigned int x;
+	unsigned int y;
+	unsigned int p;
+	unsigned int cbp;
+	boolean is_frame_picture;
+	boolean is_bottom_field;
+	
+	x = mb->mbx;
+	y = mb->mby;
+	
+	if (picture_type == PIPE_MPEG12_PICTURE_TYPE_FRAME) {
+		is_frame_picture = TRUE;
+		is_bottom_field = FALSE;
+	}
+	else {
+		is_frame_picture = FALSE;
+		is_bottom_field = picture_type == PIPE_MPEG12_PICTURE_TYPE_FIELD_BOTTOM;
+	}
+	
+	/* Intra blocks always have a full set of datablocks regardless of the pattern.
+	 * Any empty block sections are filled with a null.
+	 */
+	if (mb->mb_type == PIPE_MPEG12_MACROBLOCK_TYPE_INTRA)
+		cbp = 0x3F;
+	else 
+		cbp = mb->cbp;
+	
+	if ( !is_frame_picture && 
+	    ( (mb->mo_type == PIPE_MPEG12_MOTION_TYPE_FIELD) ||
+	      (mb->mo_type == PIPE_MPEG12_MOTION_TYPE_DUALPRIME) ||
+	      (mb->mo_type == PIPE_MPEG12_MOTION_TYPE_16x8) ) )
+		p = 2;
+	else
+		p = 1;
+	
+	is_field_dct = mb->dct_type == PIPE_MPEG12_DCT_TYPE_FIELD;
+	
+	base_dct = NV_VPE_CMD_DCT_BLOCK_UNKNOWN | 
+				NV_VPE_CMD_DCT_BLOCK_TARGET_SURFACE(target_surface_index);
+
+	if (!is_odd_multiple(x, 1))
+		base_dct |= NV_VD_VPE_CMD_EVEN_X_COORD;
+
+	if (is_frame_picture) {
+		base_dct |= NV_VPE_CMD_PICT_FRAME;
+		luma_dct_extra = (is_field_dct) ? NV_VPE_CMD_PICT_FRAME_FIELD : 0;
+	} else {
+		luma_dct_extra = 0;
+		if (is_bottom_field)
+			base_dct |= NV_VD_VPE_CMD_BOTTOM_FIELD;
+	}
+	
+	if (is_luma) {
+		nouveau_vpe_pushbuf_write(vpe_channel,
+					   NV_VPE_CMD_DCT_LUMA_HEADER << NV_VPE_CMD_TYPE_SHIFT
+			           | NV_VPE_CMD_DCT_BLOCK_PATTERN(cbp >> 2)
+			           | base_dct
+			           | luma_dct_extra);
+	    nouveau_vpe_pushbuf_write(vpe_channel,
+					   NV_VPE_CMD_DCT_COORDINATE << NV_VPE_CMD_TYPE_SHIFT
+			           | NV_VPE_DCT_POINTS_LUMA(x, y, p));
+	}
+	else {
+		nouveau_vpe_pushbuf_write(vpe_channel,
+					   NV_VPE_CMD_DCT_CHROMA_HEADER << NV_VPE_CMD_TYPE_SHIFT
+					   | NV_VPE_CMD_DCT_BLOCK_PATTERN( (cbp & 3) << 2)
+			           | base_dct);
+	    nouveau_vpe_pushbuf_write(vpe_channel,
+					   NV_VPE_CMD_DCT_COORDINATE << NV_VPE_CMD_TYPE_SHIFT
+			           |  NV_VPE_DCT_POINTS_CHROMA(x, y, p));
+	} 
+}
+
+static void 
+nv_vpe_mpeg2_mb_dct_blocks(struct nouveau_vpe_channel *vpe_channel, 
+						unsigned int cbp, boolean is_intra, void *blocks)
+{
+	short *db = (short*) blocks;
+	int cbb;
+	int  i;
+	int packed_db = 0;
+	char got_dct = 0;
+	
+	for (cbb = 0x20; cbb > 0; cbb >>= 1) {
+		
+		if (cbb & cbp) {
+			
+			nouveau_vpe_pushbuf_write(vpe_channel,
+						NV_VPE_CMD_DCT_SEPARATOR << NV_VPE_CMD_TYPE_SHIFT);
+
+			/* Pack each datablock (n datablocks of 64 entries each) into the command buffer.
+			*/
+			for (i = 0; i < 64; i += 2) {
+				
+				if (db[i] || db[i + 1]) {
+					packed_db = ((int)(db[i] & 0xFFF) << 19) | ((int)(db[i + 1] & 0xFFF) << 6);
+					nouveau_vpe_pushbuf_write(vpe_channel, 
+										packed_db | i);
+					got_dct = 1;
+				}
+			}
+			if (got_dct)
+				nouveau_vpe_pushbuf_last_or(vpe_channel, 
+										NV_VPE_DCT_BLOCK_TERMINATOR);
+			else
+				/* Nothing exists so null out this datablock.*/
+				nouveau_vpe_pushbuf_write(vpe_channel,
+										NV_VPE_DCT_BLOCK_NULL);
+			db += 64;
+			got_dct = 0;
+		}
+		else if (is_intra) {
+			nouveau_vpe_pushbuf_write(vpe_channel,
+						NV_VPE_CMD_DCT_SEPARATOR << NV_VPE_CMD_TYPE_SHIFT);
+			/* Intra blocks get a null data block if no data exists.
+			 * However, we do not increment the data block offset.*/
+			nouveau_vpe_pushbuf_write(vpe_channel,
+									NV_VPE_DCT_BLOCK_NULL);
+		}
+	}
+}
+
+static int 
+nv_vpe_mpeg2_mb_ipicture(struct nouveau_vpe_channel *vpe_channel,
+					enum pipe_mpeg12_picture_type picture_type, 
+					int target_surface_index, 
+					struct pipe_mpeg12_macroblock *mb)
+{
+	int ret;
+
+	ret = nouveau_vpe_pushbuf_start_mb(vpe_channel);
+	if (ret) {
+		debug_printf("[nv_vpe] could not start ipicture. error %d.\n", ret);
+		return ret;
+	}
+	
+	nv_vpe_mpeg2_mb_dct_header(vpe_channel, TRUE, picture_type, target_surface_index, mb);
+	nv_vpe_mpeg2_mb_dct_header(vpe_channel, FALSE, picture_type, target_surface_index, mb);
+	
+	ret = nouveau_vpe_pushbuf_start_mb_db(vpe_channel);
+	if (ret) {
+		debug_printf("[nv_vpe] could not start ipicture db. error %d.\n", ret);
+		return ret;
+	}
+		
+	nv_vpe_mpeg2_mb_dct_blocks(vpe_channel, mb->cbp, TRUE, mb->blocks);
+	
+	return 0;
+}
+
+static __inline__ boolean 
+mb_has_forward_mv(enum pipe_mpeg12_macroblock_type type)
+{
+	return (type == PIPE_MPEG12_MACROBLOCK_TYPE_FWD)||
+		   (type == PIPE_MPEG12_MACROBLOCK_TYPE_BI);
+}
+
+static __inline__ boolean 
+mb_has_backward_mv(enum pipe_mpeg12_macroblock_type type)
+{
+	return (type == PIPE_MPEG12_MACROBLOCK_TYPE_BKWD)||
+		   (type == PIPE_MPEG12_MACROBLOCK_TYPE_BI);
+}
+
+static unsigned int 
+nv_vpe_mpeg2_mb_mc_header(unsigned int type, unsigned int mc_header_base, 
+						boolean has_odd_horizontal_vector, 
+						boolean has_odd_vertical_vector, 
+						boolean is_forward, boolean is_first,
+						boolean is_vertical_motion)
+{
+	unsigned int mc_header;
+	
+	mc_header = (type << NV_VPE_CMD_TYPE_SHIFT) | mc_header_base;
+	
+	if (has_odd_horizontal_vector)
+		mc_header |= NV_VPE_CMD_ODD_HORIZONTAL_MOTION_VECTOR;
+
+	if (has_odd_vertical_vector)
+	 	mc_header |= NV_VPE_CMD_ODD_VERTICAL_MOTION_VECTOR;
+
+	if (!is_forward)
+		mc_header |= NV_VPE_CMD_MOTION_VECTOR_BACKWARD;
+		
+	if (!is_first)
+		mc_header |= NV_VPE_CMD_MOTION_VECTOR_TYPE_SECOND;
+		
+	if (is_vertical_motion)
+		mc_header |= NV_VPE_CMD_BOTTOM_FIELD_VERTICAL_MOTION_SELECT_FIRST;
+	
+	return mc_header;
+}
+
+static void 
+nv_vpe_mpeg2_mb_1mv_luma(struct nouveau_vpe_channel *vpe_channel,
+					boolean is_frame_picture_type, boolean is_forward, 
+					boolean is_dual_prime_motion, boolean is_vertical_motion,
+					unsigned int x, unsigned int y, 
+					int mv_horizontal, int mv_vertical, 
+					unsigned int mc_header_base,
+					int target_surface_index)
+{
+	unsigned int mc_header;
+	unsigned int mc_vector;
+	boolean has_odd_vertical_vector;
+	boolean has_odd_horizontal_vector;
+	
+	has_odd_horizontal_vector = is_odd_multiple(mv_horizontal, 1);
+	has_odd_vertical_vector = is_odd_multiple(mv_vertical, 1);
+	
+	mc_header = nv_vpe_mpeg2_mb_mc_header(NV_VPE_CMD_LUMA_MOTION_VECTOR_HEADER, 
+										 mc_header_base,
+										 has_odd_horizontal_vector, 
+										 has_odd_vertical_vector, 
+										 is_forward,
+										 TRUE, is_vertical_motion);
+	
+	mc_header |= NV_VPE_CMD_PREDICTION_SURFACE(target_surface_index);
+		
+	mc_vector = NV_VPE_CMD_MOTION_VECTOR << NV_VPE_CMD_TYPE_SHIFT;
+	
+	if (mv_horizontal < 0)
+		mv_horizontal--;
+		
+	mc_vector |= NV_VPE_MOTION_VECTOR_HORIZONTAL(x, 16, mv_horizontal, 2, 0);
+
+	if (is_frame_picture_type) {
+
+		if (mv_vertical < 0)
+			mv_vertical--;
+
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 16, mv_vertical, 2, 0);
+	} else {
+
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 32, mv_vertical, 1, 0);
+	}
+
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_header);
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_vector);
+}
+
+static void 
+nv_vpe_mpeg2_mb_1mv_chroma(struct nouveau_vpe_channel *vpe_channel,
+						boolean is_frame_picture_type, boolean is_forward, 
+						boolean is_dual_prime_motion, 
+						boolean is_vertical_motion,
+						unsigned int x, unsigned int y,
+						int mv_horizontal, int mv_vertical, 
+						unsigned int mc_header_base,
+						int target_surface_index)
+{
+	unsigned int mc_header;
+	unsigned int mc_vector;
+	boolean has_odd_vertical_vector;
+	boolean has_odd_horizontal_vector;
+	
+	has_odd_horizontal_vector = is_odd_multiple(mv_horizontal, 2);
+	has_odd_vertical_vector = is_odd_multiple(mv_vertical, 2);
+	
+	mc_header = nv_vpe_mpeg2_mb_mc_header(NV_VPE_CMD_CHROMA_MOTION_VECTOR_HEADER, 
+										 mc_header_base,
+										 has_odd_horizontal_vector, 
+										 has_odd_vertical_vector, 
+										 is_forward,
+										 TRUE, is_vertical_motion);
+	mc_header |= NV_VPE_CMD_PREDICTION_SURFACE(target_surface_index);
+		
+	mc_vector = NV_VPE_CMD_MOTION_VECTOR << NV_VPE_CMD_TYPE_SHIFT;
+	
+	mv_horizontal /= 2;
+	
+	if (has_odd_horizontal_vector)
+		mv_horizontal--;
+			
+	mc_vector |= NV_VPE_MOTION_VECTOR_HORIZONTAL(x, 16, mv_horizontal, 1, 0);
+
+	if (is_frame_picture_type) {
+		
+		if (mv_vertical < 0)
+			mv_vertical -= 2;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 8, mv_vertical, 4, 0); 
+	}
+	else {
+		
+		mv_vertical /= 2;
+		
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 16, mv_vertical, 1, 0); 
+	}
+
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_header); 
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_vector);
+}
+
+static int 
+nv_vpe_mpeg2_mb_1fbmv(struct nouveau_vpe_channel *vpe_channel, 
+					enum pipe_mpeg12_picture_type picture_type, 
+					int target_surface_index, int past_surface_index, 
+					int future_surface_index, 
+					struct pipe_mpeg12_macroblock *mb)
+{
+	int ret;
+	unsigned int x;
+	unsigned int y;
+	boolean has_forward;
+	boolean has_backward;
+	boolean is_frame_picture_type;
+	boolean is_dual_prime_motion;
+	boolean is_vertical_forward_motion;
+	boolean is_vertical_backward_motion;
+	unsigned int mc_header_base;
+	int mv_horizontal_forward;
+	int mv_vertical_forward;
+	int mv_horizontal_backward;
+	int mv_vertical_backward;
+
+	ret = nouveau_vpe_pushbuf_start_mb(vpe_channel);
+	if (ret) {
+		debug_printf("[nv_vpe] - could not start 1fbmv. error %d.\n", ret);
+		return ret;
+	}
+	
+	x = mb->mbx;
+	y = mb->mby;
+	
+	is_frame_picture_type = picture_type == PIPE_MPEG12_PICTURE_TYPE_FRAME;
+	is_dual_prime_motion = mb->mo_type == PIPE_MPEG12_MOTION_TYPE_DUALPRIME;
+	has_forward = mb_has_forward_mv(mb->mb_type);
+	has_backward = mb_has_backward_mv(mb->mb_type);
+	
+	mc_header_base = NV_VPE_CMD_FRAME_FRAME_PICT_OR_FIELD;
+	
+	if (is_frame_picture_type) {
+	 	mc_header_base |= NV_VPE_CMD_FRAME_PICT_FRAME_MOTION;
+	 	/* Frame pictures never have vertical motion selection.*/
+	 	is_vertical_forward_motion = FALSE;
+	 	is_vertical_backward_motion = FALSE;
+	}
+	else if (is_dual_prime_motion) {
+		/* dual-prime selects the backward vector for top field pictures.
+		 * Bottom field pictures are reversed.*/
+		if (picture_type == PIPE_MPEG12_PICTURE_TYPE_FIELD_TOP) {
+			is_vertical_forward_motion = FALSE;
+	 		is_vertical_backward_motion = TRUE;
+		}
+		else {
+			is_vertical_forward_motion = TRUE;
+	 		is_vertical_backward_motion = FALSE;
+		}
+		/* dual-prime always has forward and backward vectors.
+		 * However, for some reason the nv driver only does this if at least the forward motion vector exists.
+		 * So, if the backward doesn't exist then each motion vector is skipped.*/
+		has_backward = has_forward;
+	}
+	else {
+		is_vertical_forward_motion = mb->motion_vertical_field_select & 
+						PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_FIRST_FORWARD;
+		is_vertical_backward_motion = mb->motion_vertical_field_select & 
+						PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_FIRST_BACKWARD;
+	}
+	
+	/* Be sure the user passed valid predictor surfaces.
+	 * Skip them otherwise. */
+	if (has_forward && (past_surface_index == -1) )
+		has_forward = FALSE;
+		
+	if (has_backward && (future_surface_index == -1) )
+		has_backward = FALSE;
+		
+	if (!has_forward && !has_backward)
+		return 0;
+	
+	mv_horizontal_forward = mb->pmv[0][0][0];
+	mv_vertical_forward = mb->pmv[0][0][1];
+	mv_horizontal_backward = mb->pmv[0][1][0];
+	mv_vertical_backward = mb->pmv[0][1][1];
+	
+	/* Luma */
+	if (has_forward)
+		nv_vpe_mpeg2_mb_1mv_luma(vpe_channel, is_frame_picture_type, TRUE, 
+							  is_dual_prime_motion, is_vertical_forward_motion, 
+							  x, y, mv_horizontal_forward, mv_vertical_forward,
+							  mc_header_base, past_surface_index);
+	
+	if (has_backward)
+		nv_vpe_mpeg2_mb_1mv_luma(vpe_channel, is_frame_picture_type, !has_forward, 
+							is_dual_prime_motion, is_vertical_backward_motion,
+							x, y, mv_horizontal_backward, mv_vertical_backward,
+							mc_header_base, future_surface_index);
+	
+	if (has_forward || has_backward)
+		nv_vpe_mpeg2_mb_dct_header(vpe_channel, TRUE, picture_type, 
+								target_surface_index, mb);
+	
+	/* Chroma */
+	if (has_forward)
+		nv_vpe_mpeg2_mb_1mv_chroma(vpe_channel, is_frame_picture_type, TRUE, 
+							  is_dual_prime_motion, is_vertical_forward_motion,
+							  x, y, mv_horizontal_forward, mv_vertical_forward,
+							  mc_header_base, past_surface_index);
+	if (has_backward) 
+		nv_vpe_mpeg2_mb_1mv_chroma(vpe_channel, is_frame_picture_type, !has_forward, 
+							  is_dual_prime_motion, is_vertical_backward_motion,
+							  x, y, mv_horizontal_backward, mv_vertical_backward,
+							  mc_header_base, future_surface_index);
+	
+	if (has_forward || has_backward)
+		nv_vpe_mpeg2_mb_dct_header(vpe_channel, FALSE, picture_type, 
+								target_surface_index, mb);
+	
+	if ( (has_forward || has_backward) && mb->cbp) {		
+		ret = nouveau_vpe_pushbuf_start_mb_db(vpe_channel);
+		if (ret) {
+			debug_printf("[nv_vpe] - could not start 1fbmv db. error %d.\n", ret);
+			return ret;
+		}
+		
+		nv_vpe_mpeg2_mb_dct_blocks(vpe_channel, mb->cbp, FALSE, mb->blocks);
+	}
+	
+	return 0;
+}
+
+static void 
+nv_vpe_mpeg2_mb_2mv_luma(struct nouveau_vpe_channel *vpe_channel, boolean is_frame_picture_type, 
+						boolean is_forward, boolean is_first, boolean is_dual_prime_motion, 
+						boolean is_vertical_motion, unsigned int x, 
+						unsigned int y, int mv_horizontal, int mv_vertical, 
+						unsigned int mc_header_base, 
+						int target_surface_index)
+{
+	unsigned int mc_header;
+	unsigned int mc_vector;
+	boolean has_odd_vertical_vector;
+	boolean has_odd_horizontal_vector;
+	
+	has_odd_horizontal_vector = is_odd_multiple(mv_horizontal, 1);
+	
+	if (is_frame_picture_type)	{
+		if (mv_vertical < 0)
+			mv_vertical--;
+		has_odd_vertical_vector = is_odd_multiple(mv_vertical, 2);
+	}
+	else {
+		has_odd_vertical_vector = is_odd_multiple(mv_vertical, 2);
+	}
+	
+	mc_header = nv_vpe_mpeg2_mb_mc_header(NV_VPE_CMD_LUMA_MOTION_VECTOR_HEADER, 
+										 mc_header_base,
+										 has_odd_horizontal_vector, 
+										 has_odd_vertical_vector, 
+										 is_forward, 
+										 is_first, is_vertical_motion);
+	
+	mc_header |= NV_VPE_CMD_PREDICTION_SURFACE(target_surface_index);
+	
+	mc_vector = NV_VPE_CMD_MOTION_VECTOR << NV_VPE_CMD_TYPE_SHIFT;
+	
+	if (mv_horizontal < 0)
+		mv_horizontal--;
+
+	mc_vector |= NV_VPE_MOTION_VECTOR_HORIZONTAL(x, 16, mv_horizontal, 2, 0);
+
+	if (is_frame_picture_type) {
+		
+		mv_vertical /= 2;
+
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 16, mv_vertical, 1, 0);
+
+	} else if (!is_dual_prime_motion){
+			
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 32, mv_vertical, 1, (is_first ?  0 : 16));
+	}
+	else {
+			
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+		
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 16, mv_vertical, 1, 0);
+	}
+
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_header);
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_vector);
+}
+
+static void 
+nv_vpe_mpeg2_mb_2mv_chroma(struct nouveau_vpe_channel *vpe_channel, boolean is_frame_picture_type, 
+						boolean is_forward, boolean is_first, boolean is_dual_prime_motion, 
+						boolean is_vertical_motion, unsigned int x, 
+						unsigned int y, int mv_horizontal, int mv_vertical, 
+						unsigned int mc_header_base, 
+						int target_surface_index)
+{
+	unsigned int mc_header;
+	unsigned int mc_vector;
+	boolean has_odd_vertical_vector;
+	boolean has_odd_horizontal_vector;
+	
+	has_odd_horizontal_vector = is_odd_multiple(mv_horizontal, 2);
+	
+	if (is_frame_picture_type) {
+		if (mv_vertical < 0)
+			mv_vertical--;
+		has_odd_vertical_vector = is_odd_multiple(mv_vertical, 4);
+	}
+	else {
+		has_odd_vertical_vector = is_odd_multiple(mv_vertical, 2);
+	}
+	
+	mc_header = nv_vpe_mpeg2_mb_mc_header(NV_VPE_CMD_CHROMA_MOTION_VECTOR_HEADER, 
+										 mc_header_base,
+										 has_odd_horizontal_vector, 
+										 has_odd_vertical_vector, 
+										 is_forward,
+										 is_first, is_vertical_motion);
+	
+	mc_header |= NV_VPE_CMD_PREDICTION_SURFACE(target_surface_index);
+	
+	mc_vector = NV_VPE_CMD_MOTION_VECTOR << NV_VPE_CMD_TYPE_SHIFT;
+	
+	mv_horizontal /= 2;
+	if (has_odd_horizontal_vector)
+		mv_horizontal--;
+				
+	mc_vector |= NV_VPE_MOTION_VECTOR_HORIZONTAL(x, 16, mv_horizontal, 1, 0);
+
+	if (is_frame_picture_type) {
+
+		mv_vertical /= 4;
+
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 8, mv_vertical, 1, 0);
+		
+	} else if (!is_dual_prime_motion){
+		
+		mv_vertical /= 2;
+		
+		if (has_odd_vertical_vector)
+			mv_vertical--;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 16, mv_vertical, 1, (is_first ? 0 : 8));
+	}
+	else {
+
+		mv_vertical /= 4;
+
+		mc_vector |= NV_VPE_MOTION_VECTOR_VERTICAL(y, 8, mv_vertical, 1, 0);
+	}
+
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_header);
+	nouveau_vpe_pushbuf_write(vpe_channel, mc_vector);
+}
+
+static int 
+nv_vpe_mpeg2_mb_2fbmv(struct nouveau_vpe_channel *vpe_channel, 
+					enum pipe_mpeg12_picture_type picture_type, 
+					int target_surface_index, int past_surface_index, 
+					int future_surface_index, 
+					struct pipe_mpeg12_macroblock *mb)
+{
+	unsigned int ret;
+	unsigned int x;
+	unsigned int y;
+	boolean has_forward;
+	boolean has_backward;
+    boolean is_frame_picture_type;
+	boolean is_dual_prime_motion;
+	boolean is_vertical_forward_motion;
+	boolean is_second_vertical_forward_motion;
+	boolean is_vertical_backward_motion;
+	boolean is_second_vertical_backward_motion;
+	unsigned int mc_header_base;
+	int mv_horizontal_forward;
+	int mv_vertical_forward;
+	int mv_second_horizontal_forward;
+	int mv_second_vertical_forward;
+	int mv_horizontal_backward;
+	int mv_vertical_backward;
+	int mv_second_horizontal_backward;
+	int mv_second_vertical_backward;
+		
+	ret = nouveau_vpe_pushbuf_start_mb(vpe_channel);
+	if (ret) {
+		debug_printf("[nv_vpe] - could not start 2fbmv. error %d.\n", ret);
+		return ret;
+	}
+	
+	x = mb->mbx;
+	y = mb->mby;
+	
+	is_frame_picture_type = picture_type == PIPE_MPEG12_PICTURE_TYPE_FRAME;
+	is_dual_prime_motion = mb->mo_type == PIPE_MPEG12_MOTION_TYPE_DUALPRIME;
+	has_forward = mb_has_forward_mv(mb->mb_type);
+	has_backward = mb_has_backward_mv(mb->mb_type);
+	
+	mc_header_base = NV_VPE_CMD_MC_MV_COUNT_2;
+	
+	if (is_dual_prime_motion) {
+		/* Dual-prime selects the second forward and first backward vectors.*/
+		is_vertical_forward_motion = FALSE;
+	    is_second_vertical_forward_motion = TRUE;
+	    is_vertical_backward_motion = TRUE;
+	    is_second_vertical_backward_motion = FALSE;
+	    /* dual-prime always has forward and backward vectors.
+		 * However, for some reason the nv driver only does this if at least the forward motion vector exists.
+		 * So, if the backward doesn't exist then each motion vector is skipped.*/
+		has_backward = has_forward;
+	}
+	else {
+		/* Might need to check this condition again.
+		 * I changed this slightly from my original xvmc stuff.
+		 * I had two else conditions even though they both set the forward motion
+		 * thing.  However, the frame picture thing was the only reason another else existed.*/
+		if (!is_frame_picture_type)
+			mc_header_base |= NV_VPE_CMD_FRAME_FRAME_PICT_OR_FIELD;
+		/* Only the first forward/backward vectors use vertical motion selection.*/
+		is_vertical_forward_motion = mb->motion_vertical_field_select & 
+									PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_FIRST_FORWARD;
+		is_second_vertical_forward_motion = mb->motion_vertical_field_select & 
+									PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_SECOND_FORWARD;
+	    is_vertical_backward_motion = mb->motion_vertical_field_select & 
+									PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_FIRST_BACKWARD;
+	    is_second_vertical_backward_motion = mb->motion_vertical_field_select & 
+									PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_SECOND_BACKWARD;
+	}
+	
+	/* Be sure the user passed valid predictor surfaces.
+	 * Skip them otherwise. */
+	if (has_forward && (past_surface_index == -1) )
+		has_forward = FALSE;
+		
+	if (has_backward && (future_surface_index == -1) )
+		has_backward = FALSE;
+		
+	if (!has_forward && !has_backward)
+		return 0;
+	
+	mv_horizontal_forward = mb->pmv[0][0][0];
+	mv_vertical_forward = mb->pmv[0][0][1];
+	if (!is_dual_prime_motion) {
+		mv_second_horizontal_forward = mb->pmv[1][0][0];
+		mv_second_vertical_forward = mb->pmv[1][0][1];
+	}
+	else {
+		/* For dual-prime, the second forward vector is a duplicate of the first forward vector.*/
+		mv_second_horizontal_forward = mb->pmv[0][0][0];
+		mv_second_vertical_forward = mb->pmv[0][0][1];
+	}
+	
+	if (!is_dual_prime_motion) {
+		mv_horizontal_backward = mb->pmv[0][1][0];
+		mv_vertical_backward = mb->pmv[0][1][1];
+	}
+	else {
+		/* For dual-prime, the first backward vector actually uses the second forward vector.*/
+		mv_horizontal_backward = mb->pmv[1][0][0];
+		mv_vertical_backward = mb->pmv[1][0][1];
+	}
+	mv_second_horizontal_backward = mb->pmv[1][1][0];
+	mv_second_vertical_backward = mb->pmv[1][1][1];
+	
+	/* Luma */
+	if (has_forward) {
+		nv_vpe_mpeg2_mb_2mv_luma(vpe_channel, is_frame_picture_type, TRUE, 
+							TRUE, is_dual_prime_motion, is_vertical_forward_motion, 
+							x, y, mv_horizontal_forward, mv_vertical_forward, 
+							mc_header_base, past_surface_index);
+									     
+		nv_vpe_mpeg2_mb_2mv_luma(vpe_channel, is_frame_picture_type, TRUE, 
+							FALSE, is_dual_prime_motion, is_second_vertical_forward_motion,
+							x, y, mv_second_horizontal_forward, 
+							mv_second_vertical_forward, mc_header_base, 
+							past_surface_index);									 
+	}
+
+	if (has_backward) {
+		nv_vpe_mpeg2_mb_2mv_luma(vpe_channel, is_frame_picture_type, !has_forward, 
+							TRUE, is_dual_prime_motion, is_vertical_backward_motion,
+							x, y, mv_horizontal_backward, 
+							mv_vertical_backward, mc_header_base, 
+							future_surface_index);
+									     						     
+		nv_vpe_mpeg2_mb_2mv_luma(vpe_channel, is_frame_picture_type, !has_forward, 
+							FALSE, is_dual_prime_motion, is_second_vertical_backward_motion,
+							x, y, mv_second_horizontal_backward, 
+							mv_second_vertical_backward, mc_header_base, 
+							future_surface_index);
+	}
+
+	if (has_forward || has_backward)
+		nv_vpe_mpeg2_mb_dct_header(vpe_channel, TRUE, picture_type, 
+								target_surface_index, mb);
+
+	/* Chroma */
+	if (has_forward) {
+		nv_vpe_mpeg2_mb_2mv_chroma(vpe_channel, is_frame_picture_type, TRUE, 
+								TRUE, is_dual_prime_motion, is_vertical_forward_motion, 
+								x, y, mv_horizontal_forward, 
+								mv_vertical_forward, mc_header_base, 
+								past_surface_index);
+									     
+		nv_vpe_mpeg2_mb_2mv_chroma(vpe_channel, is_frame_picture_type, TRUE, 
+								FALSE, is_dual_prime_motion, is_second_vertical_forward_motion,
+								x, y, mv_second_horizontal_forward, 
+								mv_second_vertical_forward, mc_header_base, 
+								past_surface_index);				
+	}
+	if (has_backward) {
+		nv_vpe_mpeg2_mb_2mv_chroma(vpe_channel, is_frame_picture_type, !has_forward, 
+								TRUE, is_dual_prime_motion, is_vertical_backward_motion,
+								x, y, mv_horizontal_backward, 
+								mv_vertical_backward, mc_header_base, 
+								future_surface_index);
+									     						     
+		nv_vpe_mpeg2_mb_2mv_chroma(vpe_channel, is_frame_picture_type, !has_forward, 
+								FALSE, is_dual_prime_motion, is_second_vertical_backward_motion,
+								x, y, mv_second_horizontal_backward, 
+								mv_second_vertical_backward, mc_header_base, 
+								future_surface_index);
+	}
+
+	if (has_forward || has_backward)
+		nv_vpe_mpeg2_mb_dct_header(vpe_channel, FALSE, picture_type, 
+								target_surface_index, mb);
+	
+	if ( (has_forward || has_backward) && mb->cbp) {		
+		ret = nouveau_vpe_pushbuf_start_mb_db(vpe_channel);
+		if (ret) {
+			debug_printf("[nv_vpe] - could not start 2fbmv db. error %d.\n", ret);
+			return ret;
+		}
+		nv_vpe_mpeg2_mb_dct_blocks(vpe_channel, mb->cbp, FALSE, mb->blocks);
+	}
+	
+	return 0;
+}
+
+/* Exports */
+
+int 
+nv_vpe_mpeg2_mc_renderer_create(struct nouveau_device *dev, enum pipe_video_profile profile, 
+						enum pipe_video_chroma_format chroma_format,
+						enum pipe_video_entry_point entry_point, 
+						unsigned decode_flags,  
+						unsigned width, 
+						unsigned height, 
+						struct nouveau_vpe_channel **vpe_channel)
+{
+	switch (dev->chipset & 0xf0) {
+	case 0x30:
+	case 0x40:
+	case 0x60:
+		break;
+	default:
+		debug_printf("[nv_vpe] Chipset nv%02x is not supported.  Only nv30 and nv40 are supported.\n", dev->chipset);
+		return -EINVAL;
+	}
+	
+	if ((profile != PIPE_VIDEO_PROFILE_MPEG2_SIMPLE) &&
+		(profile != PIPE_VIDEO_PROFILE_MPEG2_MAIN) ) {
+		debug_printf("[nv_vpe] Cannot decode requested profile %d.  Only mpeg2 supported.\n", profile);
+		return -EINVAL;
+	}
+	
+	if (chroma_format != PIPE_VIDEO_CHROMA_FORMAT_420) {
+		debug_printf("[nv_vpe] Cannot decode requested chroma format %d.  Only 420 supported.\n", chroma_format);
+		return -EINVAL;
+	}
+	
+	if (entry_point != PIPE_VIDEO_ENTRY_POINT_IDCT) {
+		debug_printf("[nv_vpe] Cannot decode at requested entry point %d.  Only IDCT supported.\n", entry_point);
+        return -EINVAL;
+	}
+	
+	if (decode_flags & PIPE_VIDEO_DECODE_FLAG_MB_INTRA_UNSIGNED) {
+		debug_printf("[nv_vpe] Cannot decode requested surface type at IDCT entry point.  Only signed intra supported.\n");
+        return -EINVAL;
+	}
+
+	if ((width < NV_VPE_MIN_WIDTH) ||
+		(width > NV_VPE_MAX_WIDTH) ||
+		(height < NV_VPE_MIN_HEIGHT) ||
+		(height > NV_VPE_MAX_HEIGHT) ) {
+		debug_printf("[nv_vpe] Unsupported width = %d, height = %d.  %dx%d up to %dx%d supported.\n", width,
+					height, NV_VPE_MIN_WIDTH, NV_VPE_MIN_HEIGHT,
+					NV_VPE_MAX_WIDTH, NV_VPE_MAX_HEIGHT);
+		return -EINVAL;
+	}
+	
+	return nouveau_vpe_channel_alloc(dev, width, height, vpe_channel);
+}
+				
+void 
+nv_vpe_mpeg2_mc_renderer_destroy(struct nouveau_vpe_channel **vpe_channel)
+{
+	nouveau_vpe_channel_free(vpe_channel);
+}
+				
+int 
+nv_vpe_mpeg2_mc_renderer_surface_create(struct nouveau_vpe_channel *vpe_channel, 
+									struct nv_vpe_pipe_surface *surface)
+{
+	int ret;
+	struct nouveau_bo *luma_bo;
+	struct nouveau_bo *chroma_bo;
+	
+	if (!vpe_channel || !vpe_channel->device || !surface ||
+		!surface->luma_surf || !surface->chroma_surf)
+		return -EINVAL;
+		
+	luma_bo = nvfx_surface_buffer(surface->luma_surf);
+	chroma_bo = nvfx_surface_buffer(surface->chroma_surf);
+	
+	ret = nouveau_vpe_surface_alloc(vpe_channel,
+					luma_bo->handle, chroma_bo->handle, 
+					&surface->surface_index);
+	if (ret)
+		debug_printf("[nv_vpe] Could not allocate video surface. error %d.\n", ret);
+	
+	return ret;
+}
+
+void 
+nv_vpe_mpeg2_mc_renderer_surface_destroy(struct nouveau_vpe_channel *vpe_channel, 
+									struct nv_vpe_pipe_surface *surface)
+{
+	if (!vpe_channel || !surface)
+		return;
+		
+	nouveau_vpe_surface_free(vpe_channel, surface->surface_index);
+}
+						
+int 
+nv_vpe_mpeg2_mc_renderer_surface_query(struct nouveau_vpe_channel *vpe_channel, 
+									struct nv_vpe_pipe_surface *surface, 
+									enum pipe_video_surface_status *status)
+{
+	int ret;
+	uint32_t is_busy;
+	
+	if (!vpe_channel || !surface || !status)
+		return -EINVAL;
+		
+	ret = nouveau_vpe_surface_query(vpe_channel, surface->surface_index,
+									&is_busy);
+	if (!ret) {	
+		if (is_busy)
+			*status = PIPE_VIDEO_SURFACE_STATUS_RENDERING;
+		else
+			*status = PIPE_VIDEO_SURFACE_STATUS_FREE;
+	}
+	else
+		debug_printf("[nv_vpe] Could not query surface %d. error %d.\n", 
+				surface->surface_index, ret);
+		
+	return ret;
+}
+
+int 
+nv_vpe_mpeg2_mc_renderer_decode_macroblocks(struct nouveau_vpe_channel *vpe_channel, 
+								struct nv_vpe_pipe_surface *target, 
+								struct nv_vpe_pipe_surface *past, 
+								struct nv_vpe_pipe_surface *future, 
+								enum pipe_mpeg12_picture_type picture_type, 
+								unsigned num_macroblocks,
+								struct pipe_mpeg12_macroblock *mb_array)
+{
+	int ret;
+	struct pipe_mpeg12_macroblock *mb;
+	int target_surface_index;
+	int past_surface_index;
+	int future_surface_index;
+	unsigned int i;
+		
+	target_surface_index = target->surface_index;
+		
+	if (past)
+		past_surface_index = past->surface_index;
+	else
+		past_surface_index = -1;
+		
+	if (future)
+		future_surface_index = future->surface_index;
+	else
+		future_surface_index = -1;
+		
+	ret = nouveau_vpe_pushbuf_start(vpe_channel, 0, num_macroblocks, 
+								   target_surface_index, 
+								   past_surface_index, 
+								   future_surface_index);					   
+	if (ret) {
+		debug_printf("[nv_vpe] could start mb sequence. error %d.\n", 
+					ret);
+		return ret;
+	}
+		
+	for (i = 0; i < num_macroblocks; i++) {
+		mb = &mb_array[i];
+		if (mb->mb_type == PIPE_MPEG12_MACROBLOCK_TYPE_INTRA)
+			ret = nv_vpe_mpeg2_mb_ipicture(vpe_channel, picture_type, 
+										target_surface_index, mb);
+		else if (picture_type == PIPE_MPEG12_PICTURE_TYPE_FRAME) {
+			switch (mb->mo_type) {
+			case PIPE_MPEG12_MOTION_TYPE_FIELD: 
+				ret = nv_vpe_mpeg2_mb_2fbmv(vpe_channel, picture_type, 
+										 target_surface_index, past_surface_index, 
+										 future_surface_index, mb);
+				break;
+				
+			case PIPE_MPEG12_MOTION_TYPE_FRAME:
+			case PIPE_MPEG12_MOTION_TYPE_16x8:
+				ret = nv_vpe_mpeg2_mb_1fbmv(vpe_channel, picture_type, 
+										 target_surface_index, past_surface_index, 
+										 future_surface_index, mb);
+				break;
+
+			case PIPE_MPEG12_MOTION_TYPE_DUALPRIME:    
+				ret = nv_vpe_mpeg2_mb_2fbmv(vpe_channel, picture_type, 
+										 target_surface_index, past_surface_index, 
+										 future_surface_index, mb);
+				break;
+
+			default:  
+				/* INVALID..Do not log though.*/
+				continue;
+			}
+		} 
+		else {  /* Field Picture*/       
+			switch (mb->mo_type) {
+			case PIPE_MPEG12_MOTION_TYPE_FIELD: 
+				ret = nv_vpe_mpeg2_mb_1fbmv(vpe_channel, picture_type, 
+										 target_surface_index, past_surface_index, 
+										 future_surface_index, mb);
+				break;
+
+			case PIPE_MPEG12_MOTION_TYPE_FRAME:
+			case PIPE_MPEG12_MOTION_TYPE_16x8:
+				ret = nv_vpe_mpeg2_mb_2fbmv(vpe_channel, picture_type, 
+										 target_surface_index, past_surface_index, 
+										 future_surface_index, mb);
+				break;
+
+			case PIPE_MPEG12_MOTION_TYPE_DUALPRIME:    
+				ret = nv_vpe_mpeg2_mb_1fbmv(vpe_channel, picture_type, 
+										 target_surface_index, past_surface_index, 
+										 future_surface_index, mb);
+				break;
+
+			default:    
+				/* INVALID..Do not log though.*/
+				continue;
+			}
+		}
+		
+		if (ret) {
+			debug_printf("[nv_vpe] could process mb %d. error %d.\n", 
+			i, ret);
+			return ret;
+		}
+			
+		ret = nouveau_vpe_pushbuf_end_mb(vpe_channel);
+		if (ret) {
+			debug_printf("[nv_vpe] could end mb %d. error %d.\n", 
+					i, ret);
+			return ret;
+		}
+	}
+	
+	ret = nouveau_vpe_pushbuf_fire(vpe_channel, 1);
+	if (ret)
+		debug_printf("[nv_vpe] could end mb sequence. error %d.\n", 
+					ret);
+					
+	return ret;
+}
diff --git a/src/gallium/drivers/nvfx/nvfx_vpe_mpeg2_mc_renderer.h b/src/gallium/drivers/nvfx/nvfx_vpe_mpeg2_mc_renderer.h
new file mode 100644
index 0000000..05f4311
--- /dev/null
+++ b/src/gallium/drivers/nvfx/nvfx_vpe_mpeg2_mc_renderer.h
@@ -0,0 +1,63 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __NV_VPE_MPEG2_MC_RENDERER_H__
+#define __NV_VPE_MPEG2_MC_RENDERER_H__
+
+int 
+nv_vpe_mpeg2_mc_renderer_create(struct nouveau_device *dev, enum pipe_video_profile profile, 
+						enum pipe_video_chroma_format chroma_format,
+						enum pipe_video_entry_point entry_point, 
+						unsigned decode_flags,  
+						unsigned width, 
+						unsigned height, 
+						struct nouveau_vpe_channel **vpe_channel);
+				
+void 
+nv_vpe_mpeg2_mc_renderer_destroy(struct nouveau_vpe_channel **vpe_channel);
+				
+int 
+nv_vpe_mpeg2_mc_renderer_surface_create(struct nouveau_vpe_channel *vpe_channel, 
+						struct nv_vpe_pipe_surface *surface);
+						
+void 
+nv_vpe_mpeg2_mc_renderer_surface_destroy(struct nouveau_vpe_channel *vpe_channel, 
+						struct nv_vpe_pipe_surface *surface);
+						
+int 
+nv_vpe_mpeg2_mc_renderer_surface_query(struct nouveau_vpe_channel *vpe_channel, 
+						struct nv_vpe_pipe_surface *surface, 
+						enum pipe_video_surface_status *status);
+
+int 
+nv_vpe_mpeg2_mc_renderer_decode_macroblocks(struct nouveau_vpe_channel *vpe_channel, 
+									struct nv_vpe_pipe_surface *target, 
+									struct nv_vpe_pipe_surface *past, 
+									struct nv_vpe_pipe_surface *future, 
+									enum pipe_mpeg12_picture_type picture_type, 
+									unsigned num_macroblocks,
+									struct pipe_mpeg12_macroblock *mb_array);
+#endif
diff --git a/src/gallium/drivers/nvfx/nvfx_vpe_video_context.c b/src/gallium/drivers/nvfx/nvfx_vpe_video_context.c
new file mode 100644
index 0000000..38e99cf
--- /dev/null
+++ b/src/gallium/drivers/nvfx/nvfx_vpe_video_context.c
@@ -0,0 +1,532 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <errno.h>
+
+#include "util/u_inlines.h"
+#include "util/u_memory.h"
+
+#include <util/u_memory.h>
+#include <util/u_rect.h>
+#include <util/u_video.h>
+
+#include "nouveau/nouveau_winsys.h"
+#include "nvfx_screen.h"
+#include "nv04_surface_2d.h"
+#include "nvfx_vpe_video_context.h"
+#include "nvfx_vpe_mpeg2_mc_renderer.h"
+
+static void
+nv_vpe_video_destroy(struct pipe_video_context *vpipe)
+{
+    struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+
+    ctx = nv_vpe_video_context(vpipe);
+    
+    vl_compositor_cleanup(&ctx->compositor);
+
+    nv_vpe_mpeg2_mc_renderer_destroy(&ctx->vpe_channel);
+
+    ctx->pipe->destroy(ctx->pipe);
+
+    FREE(ctx);
+}
+
+static int
+nv_vpe_get_param(struct pipe_video_context *vpipe, int param)
+{
+    assert(vpipe);
+    
+    debug_printf("[nv_vpe]: get_param not supported\n");
+    
+    return 0;
+}
+
+static boolean
+nv_vpe_is_format_supported(struct pipe_video_context *vpipe,
+			enum pipe_format format, unsigned usage,
+			unsigned geom)
+{
+   assert(vpipe);
+   
+   debug_printf("[nv_vpe]: is_format_supported not supported\n");
+
+   return false;
+}
+
+static void
+nv_vpe_create_decoder_surface(struct pipe_video_context *vpipe,
+			    struct pipe_surface **surface)
+{
+    int ret;
+    struct nv_vpe_video_context *ctx;
+    struct nv_vpe_pipe_surface *vpe_surface;
+    struct pipe_resource template;
+    struct pipe_resource *vsfc_tex;
+    
+    assert(vpipe);
+    assert(surface);
+    
+    *surface = NULL;
+    
+    ctx = nv_vpe_video_context(vpipe);
+    
+    vpe_surface = CALLOC_STRUCT(nv_vpe_pipe_surface);
+    
+    if (!vpe_surface)
+	return;
+    
+    /* Create the NV12 luma and chroma surfaces.*/
+    memset(&template, 0, sizeof(struct pipe_resource));
+    template.target = PIPE_TEXTURE_2D;
+    template.format = PIPE_FORMAT_R8_UNORM;
+    template.last_level = 0;
+    template.width0 = vpipe->width;
+    template.height0 = vpipe->height;
+    template.depth0 = 1;
+    template.usage = PIPE_USAGE_DEFAULT;
+    template.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_SCANOUT;
+
+    vsfc_tex = vpipe->screen->resource_create(vpipe->screen, &template);
+    if (!vsfc_tex) {
+	FREE(vpe_surface);
+	debug_printf("[nv_vpe] Could not allocate luma surface.\n");
+	return;
+    }
+    
+    vpe_surface->luma_surf = vpipe->screen->get_tex_surface(vpipe->screen, vsfc_tex, 0, 0, 0,
+                                         PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_SCANOUT);
+    pipe_resource_reference(&vsfc_tex, NULL);
+   
+    memset(&template, 0, sizeof(struct pipe_resource));
+    template.target = PIPE_TEXTURE_2D;
+    template.format = PIPE_FORMAT_G8B8_UNORM;
+    template.last_level = 0;
+    /* Chroma is of 1/2.*/
+    template.width0 = vpipe->width / 2;
+    template.height0 = vpipe->height / 2;
+    template.depth0 = 1;
+    template.usage = PIPE_USAGE_DEFAULT;
+    template.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_SCANOUT;
+
+    vsfc_tex = vpipe->screen->resource_create(vpipe->screen, &template);
+    if (!vsfc_tex) {
+	pipe_surface_reference(&vpe_surface->luma_surf, NULL);
+	FREE(vpe_surface);
+	debug_printf("[nv_vpe] Could not allocate chroma surface.\n");
+	return;
+    }
+    
+    vpe_surface->chroma_surf = vpipe->screen->get_tex_surface(vpipe->screen, vsfc_tex, 0, 0, 0,
+                                         PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_SCANOUT);
+    pipe_resource_reference(&vsfc_tex, NULL);
+    
+    ret = nv_vpe_mpeg2_mc_renderer_surface_create(ctx->vpe_channel,
+						vpe_surface);
+    if (ret) {
+	pipe_surface_reference(&vpe_surface->luma_surf, NULL);
+	pipe_surface_reference(&vpe_surface->chroma_surf, NULL);
+	FREE(vpe_surface);
+	debug_printf("[nv_vpe] Could not allocate vpe surface. error %d.\n", ret);
+	return;
+    }
+    
+    *surface = &vpe_surface->base;
+}
+
+static void
+nv_vpe_destroy_decoder_surface(struct pipe_video_context *vpipe,
+			    struct pipe_surface **surface)
+{
+    struct nv_vpe_video_context *ctx;
+    struct nv_vpe_pipe_surface *vpe_surface;
+    
+    assert(vpipe);
+    assert(surface);
+    assert(*surface);
+    
+    ctx = nv_vpe_video_context(vpipe);
+    
+    vpe_surface = nv_vpe_pipe_surface(*surface);
+    
+    nv_vpe_mpeg2_mc_renderer_surface_destroy(ctx->vpe_channel, 
+					    vpe_surface);
+					    
+    pipe_surface_reference(&vpe_surface->luma_surf, NULL);
+    pipe_surface_reference(&vpe_surface->chroma_surf, NULL);
+    
+    FREE(vpe_surface);
+    *surface = NULL;
+}
+
+
+static void
+nv_vpe_query_decoder_surface(struct pipe_video_context *vpipe, 
+			     struct pipe_surface *surface,
+			     enum pipe_video_surface_status *status)
+{
+    int ret;
+    struct nv_vpe_video_context *ctx;
+    struct nv_vpe_pipe_surface *vpe_surface;
+
+    assert(vpipe);
+    assert(surface);
+    assert(status);
+    
+    ctx = nv_vpe_video_context(vpipe);
+    vpe_surface = nv_vpe_pipe_surface(surface);
+    
+    ret = nv_vpe_mpeg2_mc_renderer_surface_query(ctx->vpe_channel, vpe_surface, status);
+    /* how to handle errors?*/
+    assert(ret == 0);
+}
+
+static void
+nv_vpe_decode_macroblocks(struct pipe_video_context *vpipe,
+			 struct pipe_surface *past,
+			 struct pipe_surface *future,
+			 enum pipe_mpeg12_picture_type picture_type,
+			 unsigned num_macroblocks,
+			 struct pipe_macroblock *macroblocks,
+			 struct pipe_fence_handle **fence)
+{
+    struct nv_vpe_video_context *ctx;
+    int ret;
+
+    assert(vpipe);
+    assert(num_macroblocks);
+    assert(macroblocks);
+    /* Only mpeg2 is supported really...*/
+    assert(macroblocks->codec == PIPE_VIDEO_CODEC_MPEG12);
+    
+    ctx = nv_vpe_video_context(vpipe);
+    assert(ctx->decode_target);
+    
+    ret = nv_vpe_mpeg2_mc_renderer_decode_macroblocks(ctx->vpe_channel, 
+						    nv_vpe_pipe_surface(ctx->decode_target), 
+						    past ? nv_vpe_pipe_surface(past) : NULL, 
+						    future ? nv_vpe_pipe_surface(future) : NULL, 
+						    picture_type, 
+						    num_macroblocks,
+						    (struct pipe_mpeg12_macroblock *)macroblocks);
+    /* How to handle errors?*/
+    assert(ret == 0);
+}
+
+static void
+nv_vpe_render_picture(struct pipe_video_context     *vpipe,
+		     /*struct pipe_surface         *backround,
+		     struct pipe_video_rect        *backround_area,*/
+		     struct pipe_surface     	*src_surface,
+		     enum pipe_mpeg12_picture_type picture_type,
+		     /*unsigned                    num_past_surfaces,
+		     struct pipe_video_surface     *past_surfaces,
+		     unsigned                      num_future_surfaces,
+		     struct pipe_video_surface     *future_surfaces,*/
+		     struct pipe_video_rect        *src_area,
+		     struct pipe_surface           *dst_surface,
+		     struct pipe_video_rect        *dst_area,
+		     /*unsigned                      num_layers,
+		     struct pipe_surface           *layers,
+		     struct pipe_video_rect        *layer_src_areas,
+		     struct pipe_video_rect        *layer_dst_areas*/
+		     struct pipe_fence_handle      **fence)
+{
+    struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+    assert(src_surface);
+    assert(src_area);
+    assert(dst_surface);
+    assert(dst_area);
+
+    ctx = nv_vpe_video_context(vpipe);
+    
+    vl_compositor_render_nv12(&ctx->compositor, nv_vpe_pipe_surface(src_surface)->luma_surf,
+			nv_vpe_pipe_surface(src_surface)->chroma_surf,
+			picture_type, src_area, dst_surface, dst_area, fence);
+}
+
+static void
+nv_vpe_set_picture_background(struct pipe_video_context *vpipe,
+			    struct pipe_surface *bg, 
+			    struct pipe_video_rect *bg_src_rect)
+{
+    struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+    assert(bg);
+    assert(bg_src_rect);
+   
+    ctx = nv_vpe_video_context(vpipe);
+
+    vl_compositor_set_background(&ctx->compositor, bg, bg_src_rect);
+}
+
+static void
+nv_vpe_set_picture_layers(struct pipe_video_context *vpipe,
+			struct pipe_surface *layers[],
+			struct pipe_video_rect *src_rects[],
+			struct pipe_video_rect *dst_rects[],
+			unsigned num_layers)
+{
+    struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+    assert((layers && src_rects && dst_rects) ||
+          (!layers && !src_rects && !dst_rects));
+	  
+    ctx = nv_vpe_video_context(vpipe);
+
+    vl_compositor_set_layers(&ctx->compositor, layers, src_rects, dst_rects, num_layers);
+}
+
+static void
+nv_vpe_surface_fill(struct pipe_video_context *vpipe,
+		    struct pipe_surface *dst,
+		    unsigned dstx, unsigned dsty,
+		    unsigned width, unsigned height,
+		    unsigned value)
+{
+    /*struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+    assert(dst);
+
+    ctx = nv_vpe_video_context(vpipe);
+    
+    if (ctx->pipe->surface_fill)
+	ctx->pipe->surface_fill(ctx->pipe, dst, dstx, dsty, width, height, value);
+    else
+	util_surface_fill(ctx->pipe, dst, dstx, dsty, width, height, value);*/
+	
+    /* Need to fill luma+chroma surfaces somehow.*/
+    debug_printf("[nv_vpe]: surface_fill is not supported\n");
+}
+
+static void
+nv_vpe_surface_copy(struct pipe_video_context *vpipe,
+		    struct pipe_surface *dst,
+		    unsigned dstx, unsigned dsty,
+		    struct pipe_surface *src,
+		    unsigned srcx, unsigned srcy,
+		    unsigned width, unsigned height)
+{
+    /*struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+    assert(dst);
+
+    ctx = nv_vpe_video_context(vpipe);
+    
+    if (ctx->pipe->surface_copy)
+	ctx->pipe->surface_copy(ctx->pipe, dst, dstx, dsty, src, srcx, srcy, width, height);
+    else
+	util_surface_copy(ctx->pipe, FALSE, dst, dstx, dsty, src, srcx, srcy, width, height);
+    */
+    
+    /* Need to copy from luma+chroma surfaces somehow.*/
+	
+    debug_printf("[nv_vpe]: surface_copy is not supported\n");
+}
+
+static void
+nv_vpe_set_decode_target(struct pipe_video_context *vpipe,
+			struct pipe_surface *dt)
+{
+    struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+    assert(dt);
+
+    ctx = nv_vpe_video_context(vpipe);
+    
+    ctx->decode_target = dt;
+}
+
+static void
+nv_vpe_set_csc_matrix(struct pipe_video_context *vpipe, const float *mat)
+{
+    struct nv_vpe_video_context *ctx;
+
+    assert(vpipe);
+
+    ctx = nv_vpe_video_context(vpipe);
+
+    vl_compositor_set_csc_matrix(&ctx->compositor, mat);
+}
+
+static bool
+init_pipe_state(struct nv_vpe_video_context *ctx)
+{
+   struct pipe_rasterizer_state rast;
+   struct pipe_blend_state blend;
+   struct pipe_depth_stencil_alpha_state dsa;
+   unsigned i;
+
+   assert(ctx);
+
+   rast.flatshade = 1;
+   rast.flatshade_first = 0;
+   rast.light_twoside = 0;
+   rast.front_winding = PIPE_WINDING_CCW;
+   rast.cull_mode = PIPE_WINDING_CW;
+   rast.fill_cw = PIPE_POLYGON_MODE_FILL;
+   rast.fill_ccw = PIPE_POLYGON_MODE_FILL;
+   rast.offset_cw = 0;
+   rast.offset_ccw = 0;
+   rast.scissor = 0;
+   rast.poly_smooth = 0;
+   rast.poly_stipple_enable = 0;
+   rast.sprite_coord_enable = 0;
+   rast.point_size_per_vertex = 0;
+   rast.multisample = 0;
+   rast.line_smooth = 0;
+   rast.line_stipple_enable = 0;
+   rast.line_stipple_factor = 0;
+   rast.line_stipple_pattern = 0;
+   rast.line_last_pixel = 0;
+   rast.line_width = 1;
+   rast.point_smooth = 0;
+   rast.point_quad_rasterization = 0;
+   rast.point_size = 1;
+   rast.offset_units = 1;
+   rast.offset_scale = 1;
+   rast.gl_rasterization_rules = 1;
+   ctx->rast = ctx->pipe->create_rasterizer_state(ctx->pipe, &rast);
+   ctx->pipe->bind_rasterizer_state(ctx->pipe, ctx->rast);
+
+	
+   blend.independent_blend_enable = 0;
+   blend.rt[0].blend_enable = 0;
+   blend.rt[0].rgb_func = PIPE_BLEND_ADD;
+   blend.rt[0].rgb_src_factor = PIPE_BLENDFACTOR_ONE;
+   blend.rt[0].rgb_dst_factor = PIPE_BLENDFACTOR_ONE;
+   blend.rt[0].alpha_func = PIPE_BLEND_ADD;
+   blend.rt[0].alpha_src_factor = PIPE_BLENDFACTOR_ONE;
+   blend.rt[0].alpha_dst_factor = PIPE_BLENDFACTOR_ONE;
+   blend.logicop_enable = 0;
+   blend.logicop_func = PIPE_LOGICOP_CLEAR;
+   /* Needed to allow color writes to FB, even if blending disabled */
+   blend.rt[0].colormask = PIPE_MASK_RGBA;
+   blend.dither = 0;
+   ctx->blend = ctx->pipe->create_blend_state(ctx->pipe, &blend);
+   ctx->pipe->bind_blend_state(ctx->pipe, ctx->blend);
+
+   dsa.depth.enabled = 0;
+   dsa.depth.writemask = 0;
+   dsa.depth.func = PIPE_FUNC_ALWAYS;
+   for (i = 0; i < 2; ++i) {
+      dsa.stencil[i].enabled = 0;
+      dsa.stencil[i].func = PIPE_FUNC_ALWAYS;
+      dsa.stencil[i].fail_op = PIPE_STENCIL_OP_KEEP;
+      dsa.stencil[i].zpass_op = PIPE_STENCIL_OP_KEEP;
+      dsa.stencil[i].zfail_op = PIPE_STENCIL_OP_KEEP;
+      dsa.stencil[i].valuemask = 0;
+      dsa.stencil[i].writemask = 0;
+   }
+   dsa.alpha.enabled = 0;
+   dsa.alpha.func = PIPE_FUNC_ALWAYS;
+   dsa.alpha.ref_value = 0;
+   ctx->dsa = ctx->pipe->create_depth_stencil_alpha_state(ctx->pipe, &dsa);
+   ctx->pipe->bind_depth_stencil_alpha_state(ctx->pipe, ctx->dsa);
+   
+   return true;
+}
+
+struct pipe_video_context *
+nv_vpe_video_create(struct pipe_context *pipe, enum pipe_video_profile profile,
+		    enum pipe_video_chroma_format chroma_format,
+		    enum pipe_video_entry_point entry_point,
+		    unsigned decode_flags,
+                    unsigned width, unsigned height,
+                    unsigned pvctx_id)
+{
+    struct nouveau_device *dev = nouveau_screen(pipe->screen)->device;
+    struct nv_vpe_video_context *ctx;
+    int ret;
+    
+    ctx = CALLOC_STRUCT(nv_vpe_video_context);
+
+    if (!ctx)
+	return NULL;
+	    
+    ret = nv_vpe_mpeg2_mc_renderer_create(dev, profile, chroma_format, entry_point,
+					decode_flags, width, height, 
+					&ctx->vpe_channel); 
+    if (ret) {
+	FREE(ctx);
+	return NULL;
+    }
+
+    ctx->base.profile = profile;
+    ctx->base.chroma_format = chroma_format;
+    /* Width and height are adjusted automatically for the hw 
+     * so use those values.*/
+    ctx->base.width = ctx->vpe_channel->width;
+    ctx->base.height = ctx->vpe_channel->height;
+    ctx->base.entry_point = entry_point;
+    ctx->base.decode_flags = decode_flags;
+    
+    ctx->base.screen = pipe->screen;
+    ctx->base.destroy = nv_vpe_video_destroy;
+    ctx->base.get_param = nv_vpe_get_param;
+    ctx->base.is_format_supported = nv_vpe_is_format_supported;
+    ctx->base.decode_macroblocks = nv_vpe_decode_macroblocks;
+    ctx->base.render_picture = nv_vpe_render_picture;
+    ctx->base.surface_fill = nv_vpe_surface_fill;
+    ctx->base.surface_copy = nv_vpe_surface_copy;
+    ctx->base.set_picture_background = nv_vpe_set_picture_background;
+    ctx->base.set_picture_layers = nv_vpe_set_picture_layers;
+    ctx->base.set_decode_target = nv_vpe_set_decode_target;
+    ctx->base.set_csc_matrix = nv_vpe_set_csc_matrix;
+    ctx->base.create_decoder_surface = nv_vpe_create_decoder_surface;
+    ctx->base.destroy_decoder_surface = nv_vpe_destroy_decoder_surface;
+    ctx->base.query_decoder_surface = nv_vpe_query_decoder_surface;
+    
+    ctx->pipe = pipe;
+      
+    if (!vl_compositor_init(&ctx->compositor, ctx->pipe, PIPE_FORMAT_NV12)) {
+	ctx->pipe->destroy(ctx->pipe);
+	FREE(ctx);
+	return NULL;
+    }
+    
+    if (!init_pipe_state(ctx)) {
+	vl_compositor_cleanup(&ctx->compositor);
+	ctx->pipe->destroy(ctx->pipe);
+	FREE(ctx);
+	return NULL;
+    }
+
+    return &ctx->base;
+}
diff --git a/src/gallium/drivers/nvfx/nvfx_vpe_video_context.h b/src/gallium/drivers/nvfx/nvfx_vpe_video_context.h
new file mode 100644
index 0000000..22e97b9
--- /dev/null
+++ b/src/gallium/drivers/nvfx/nvfx_vpe_video_context.h
@@ -0,0 +1,89 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+ 
+#ifndef __NV_VPE_VIDEO_CONTEXT_H__
+#define __NV_VPE_VIDEO_CONTEXT_H__
+
+#include <pipe/p_video_context.h>
+#include <pipe/p_video_state.h>
+#include <vl/vl_compositor.h>
+
+struct pipe_screen;
+struct pipe_context;
+struct pipe_surface;
+struct nouveau_vpe_channel;
+
+struct nv_vpe_pipe_surface 
+{
+	struct pipe_surface base;
+	/* pipe textures for a surface.
+	 * They can be referenced as textures:
+	 * - Linear -> So, not swizzled.
+	 * - Rect
+	 * - Luma Surface -> L8 texture format.
+	 * - Chroma Surface -> A8L8 texture format.
+	 */
+	struct pipe_surface *luma_surf;
+	struct pipe_surface *chroma_surf;
+	
+	/* index in vpe hw.*/
+	uint32_t surface_index;
+};
+
+struct nv_vpe_video_context
+{
+	struct pipe_video_context base;
+	struct pipe_context *pipe;
+	struct pipe_surface *decode_target;
+	struct vl_compositor compositor;
+	
+	void *rast;
+	void *dsa;
+	void *blend;
+   
+	struct nouveau_vpe_channel *vpe_channel;
+};
+
+static INLINE struct nv_vpe_video_context *
+nv_vpe_video_context(struct pipe_video_context *vpipe)
+{
+	return (struct nv_vpe_video_context *)vpipe;
+}
+
+static INLINE struct nv_vpe_pipe_surface *
+nv_vpe_pipe_surface(struct pipe_surface *surface)
+{
+	return (struct nv_vpe_pipe_surface *)surface;
+}
+
+struct pipe_video_context *
+nv_vpe_video_create(struct pipe_context *pipe, enum pipe_video_profile profile,
+                  enum pipe_video_chroma_format chroma_format,
+                  enum pipe_video_entry_point entry_point,
+				  unsigned decode_flags,
+                  unsigned width, unsigned height,
+                  unsigned pvctx_id);
+#endif
diff --git a/src/gallium/drivers/softpipe/sp_video_context.c b/src/gallium/drivers/softpipe/sp_video_context.c
index 44df00e..6c0825f 100644
--- a/src/gallium/drivers/softpipe/sp_video_context.c
+++ b/src/gallium/drivers/softpipe/sp_video_context.c
@@ -36,6 +36,35 @@
 #include "sp_public.h"
 #include "sp_texture.h"
 
+static boolean 
+sp_mpeg12_validate_codec_params(enum pipe_video_profile profile,
+                enum pipe_video_chroma_format chroma_format, 
+                enum pipe_video_entry_point entry_point,
+                unsigned decode_flags)
+{	
+	if (u_reduce_video_profile(profile) != PIPE_VIDEO_CODEC_MPEG12) {
+		debug_printf("[XvMCg3dvl] Cannot decode requested profile %d.  Only mpeg1/2 supported.\n", profile);
+		return false;
+	}
+	
+	if (chroma_format != PIPE_VIDEO_CHROMA_FORMAT_420) {
+		debug_printf("[XvMCg3dvl] Cannot decode requested chroma format %d.  Only 420 supported.\n", chroma_format);
+		return false;
+	}
+	
+	if (entry_point != PIPE_VIDEO_ENTRY_POINT_MC) {
+		debug_printf("[XvMCg3dvl] Cannot decode at requested entry point %d.  Only MC supported.\n", entry_point);
+        return false;
+	}
+	
+	if (!(decode_flags & PIPE_VIDEO_DECODE_FLAG_MB_INTRA_UNSIGNED)) {
+		debug_printf("[XvMCg3dvl] Cannot decode requested surface type at MC entry point.  Signed intra is unsupported.\n");
+        return false;
+	}
+	
+	return true;
+}
+
 static void
 sp_mpeg12_destroy(struct pipe_video_context *vpipe)
 {
@@ -105,6 +134,7 @@ static void
 sp_mpeg12_decode_macroblocks(struct pipe_video_context *vpipe,
                              struct pipe_surface *past,
                              struct pipe_surface *future,
+                             enum pipe_mpeg12_picture_type picture_type,
                              unsigned num_macroblocks,
                              struct pipe_macroblock *macroblocks,
                              struct pipe_fence_handle **fence)
@@ -326,6 +356,70 @@ sp_mpeg12_set_csc_matrix(struct pipe_video_context *vpipe, const float *mat)
    vl_compositor_set_csc_matrix(&ctx->compositor, mat);
 }
 
+static void
+sp_mpeg12_create_decoder_surface(struct pipe_video_context *vpipe,
+                                struct pipe_surface **surface)
+{
+   assert(vpipe);
+   assert(surface);
+   
+   struct pipe_resource template;
+   struct pipe_resource *vsfc_tex;
+    
+   *surface = NULL;
+      
+   memset(&template, 0, sizeof(struct pipe_resource));
+   template.target = PIPE_TEXTURE_2D;
+   template.format = (enum pipe_format)vpipe->get_param(vpipe, PIPE_CAP_DECODE_TARGET_PREFERRED_FORMAT);
+   template.last_level = 0;
+   if (vpipe->is_format_supported(vpipe, template.format,
+                                  PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET,
+                                  PIPE_TEXTURE_GEOM_NON_POWER_OF_TWO)) {
+      template.width0 = vpipe->width;
+      template.height0 = vpipe->height;
+   }
+   else {
+      assert(vpipe->is_format_supported(vpipe, template.format,
+                                       PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET,
+                                       PIPE_TEXTURE_GEOM_NON_SQUARE));
+      template.width0 = util_next_power_of_two(vpipe->width);
+      template.height0 = util_next_power_of_two(vpipe->height);
+   }
+   template.depth0 = 1;
+   template.usage = PIPE_USAGE_DEFAULT;
+   template.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET;
+   template.flags = 0;
+   vsfc_tex = vpipe->screen->resource_create(vpipe->screen, &template);
+   if (!vsfc_tex)
+       return;
+
+   *surface = vpipe->screen->get_tex_surface(vpipe->screen, vsfc_tex, 0, 0, 0,
+                                         PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET);
+   pipe_resource_reference(&vsfc_tex, NULL);
+}
+
+static void
+sp_mpeg12_destroy_decoder_surface(struct pipe_video_context *vpipe,
+                                    struct pipe_surface **surface)
+{
+   assert(vpipe);
+   assert(surface);
+   
+   pipe_surface_reference(surface, NULL);
+}
+
+
+static void
+sp_mpeg12_query_decoder_surface(struct pipe_video_context *vpipe, 
+                                struct pipe_surface *surface,
+                                enum pipe_video_surface_status *status)
+{
+   assert(vpipe);
+   assert(surface);
+   assert(status);
+   *status = PIPE_VIDEO_SURFACE_STATUS_FREE;
+}
+
 static bool
 init_pipe_state(struct sp_mpeg12_context *ctx)
 {
@@ -406,6 +500,8 @@ init_pipe_state(struct sp_mpeg12_context *ctx)
 static struct pipe_video_context *
 sp_mpeg12_create(struct pipe_context *pipe, enum pipe_video_profile profile,
                  enum pipe_video_chroma_format chroma_format,
+                 enum pipe_video_entry_point entry_point,
+                 unsigned decode_flags,
                  unsigned width, unsigned height,
                  enum VL_MPEG12_MC_RENDERER_BUFFER_MODE bufmode,
                  enum VL_MPEG12_MC_RENDERER_EMPTY_BLOCK eb_handling,
@@ -425,6 +521,8 @@ sp_mpeg12_create(struct pipe_context *pipe, enum pipe_video_profile profile,
    ctx->base.chroma_format = chroma_format;
    ctx->base.width = width;
    ctx->base.height = height;
+   ctx->base.entry_point = entry_point;
+   ctx->base.decode_flags = decode_flags;
 
    ctx->base.screen = pipe->screen;
    ctx->base.destroy = sp_mpeg12_destroy;
@@ -445,6 +543,9 @@ sp_mpeg12_create(struct pipe_context *pipe, enum pipe_video_profile profile,
    ctx->base.set_picture_layers = sp_mpeg12_set_picture_layers;
    ctx->base.set_decode_target = sp_mpeg12_set_decode_target;
    ctx->base.set_csc_matrix = sp_mpeg12_set_csc_matrix;
+   ctx->base.create_decoder_surface = sp_mpeg12_create_decoder_surface;
+   ctx->base.destroy_decoder_surface = sp_mpeg12_destroy_decoder_surface;
+   ctx->base.query_decoder_surface = sp_mpeg12_query_decoder_surface;
 
    ctx->pipe = pipe;
    ctx->decode_format = decode_format;
@@ -457,7 +558,7 @@ sp_mpeg12_create(struct pipe_context *pipe, enum pipe_video_profile profile,
       return NULL;
    }
 
-   if (!vl_compositor_init(&ctx->compositor, ctx->pipe)) {
+   if (!vl_compositor_init(&ctx->compositor, ctx->pipe, decode_format)) {
       vl_mpeg12_mc_renderer_cleanup(&ctx->mc_renderer);
       ctx->pipe->destroy(ctx->pipe);
       FREE(ctx);
@@ -478,12 +579,18 @@ sp_mpeg12_create(struct pipe_context *pipe, enum pipe_video_profile profile,
 struct pipe_video_context *
 sp_video_create(struct pipe_screen *screen, enum pipe_video_profile profile,
                 enum pipe_video_chroma_format chroma_format,
+                enum pipe_video_entry_point entry_point,
+                unsigned decode_flags,
                 unsigned width, unsigned height, void *priv)
 {
    struct pipe_context *pipe;
 
    assert(screen);
    assert(width && height);
+   
+   if (!sp_mpeg12_validate_codec_params(profile, chroma_format, entry_point,
+                                        decode_flags))
+      return NULL;
 
    pipe = screen->context_create(screen, NULL);
    if (!pipe)
@@ -493,6 +600,8 @@ sp_video_create(struct pipe_screen *screen, enum pipe_video_profile profile,
    /* TODO: Use XFER_NONE when implemented */
    return sp_video_create_ex(pipe, profile,
                              chroma_format,
+                             entry_point,
+                             decode_flags,
                              width, height,
                              VL_MPEG12_MC_RENDERER_BUFFER_PICTURE,
                              VL_MPEG12_MC_RENDERER_EMPTY_BLOCK_XFER_ONE,
@@ -503,6 +612,8 @@ sp_video_create(struct pipe_screen *screen, enum pipe_video_profile profile,
 struct pipe_video_context *
 sp_video_create_ex(struct pipe_context *pipe, enum pipe_video_profile profile,
                    enum pipe_video_chroma_format chroma_format,
+                   enum pipe_video_entry_point entry_point,
+				   unsigned decode_flags,
                    unsigned width, unsigned height,
                    enum VL_MPEG12_MC_RENDERER_BUFFER_MODE bufmode,
                    enum VL_MPEG12_MC_RENDERER_EMPTY_BLOCK eb_handling,
@@ -511,11 +622,16 @@ sp_video_create_ex(struct pipe_context *pipe, enum pipe_video_profile profile,
 {
    assert(pipe);
    assert(width && height);
+   
+   if (!sp_mpeg12_validate_codec_params(profile, chroma_format, entry_point,
+                                        decode_flags))
+      return NULL;
 
    switch (u_reduce_video_profile(profile)) {
       case PIPE_VIDEO_CODEC_MPEG12:
          return sp_mpeg12_create(pipe, profile,
                                  chroma_format,
+                                 entry_point, decode_flags,
                                  width, height,
                                  bufmode, eb_handling,
                                  pot_buffers,
diff --git a/src/gallium/drivers/softpipe/sp_video_context.h b/src/gallium/drivers/softpipe/sp_video_context.h
index 0fe48d7..0657a44 100644
--- a/src/gallium/drivers/softpipe/sp_video_context.h
+++ b/src/gallium/drivers/softpipe/sp_video_context.h
@@ -53,13 +53,17 @@ struct sp_mpeg12_context
 struct pipe_video_context *
 sp_video_create(struct pipe_screen *screen, enum pipe_video_profile profile,
                 enum pipe_video_chroma_format chroma_format,
-                unsigned width, unsigned height, void *priv);
+                enum pipe_video_entry_point entry_point,
+                unsigned decode_flags, unsigned width, unsigned height, 
+                void *priv);
 
 /* Other drivers can call this function in their pipe_video_context constructors and pass it
    an accelerated pipe_context along with suitable buffering modes, etc */
 struct pipe_video_context *
 sp_video_create_ex(struct pipe_context *pipe, enum pipe_video_profile profile,
                    enum pipe_video_chroma_format chroma_format,
+                   enum pipe_video_entry_point entry_point,
+                   unsigned decode_flags,
                    unsigned width, unsigned height,
                    enum VL_MPEG12_MC_RENDERER_BUFFER_MODE bufmode,
                    enum VL_MPEG12_MC_RENDERER_EMPTY_BLOCK eb_handling,
diff --git a/src/gallium/include/pipe/p_defines.h b/src/gallium/include/pipe/p_defines.h
index 2831818..a663b59 100644
--- a/src/gallium/include/pipe/p_defines.h
+++ b/src/gallium/include/pipe/p_defines.h
@@ -487,6 +487,16 @@ enum pipe_video_profile
    PIPE_VIDEO_PROFILE_MPEG4_AVC_HIGH
 };
 
+enum pipe_video_entry_point
+{
+   PIPE_VIDEO_ENTRY_POINT_CSC,
+   PIPE_VIDEO_ENTRY_POINT_MC,
+   PIPE_VIDEO_ENTRY_POINT_IDCT,
+   PIPE_VIDEO_ENTRY_POINT_BS
+};
+
+#define PIPE_VIDEO_DECODE_FLAG_MB_INTRA_UNSIGNED 1
+
 
 #ifdef __cplusplus
 }
diff --git a/src/gallium/include/pipe/p_format.h b/src/gallium/include/pipe/p_format.h
index 5ca27b3..304e583 100644
--- a/src/gallium/include/pipe/p_format.h
+++ b/src/gallium/include/pipe/p_format.h
@@ -199,6 +199,7 @@ enum pipe_format {
    PIPE_FORMAT_VUYX                  = PIPE_FORMAT_B8G8R8X8_UNORM,
    PIPE_FORMAT_IA44                  = 141,
    PIPE_FORMAT_AI44                  = 142,
+   PIPE_FORMAT_G8B8_UNORM            = 143,
 
    PIPE_FORMAT_COUNT
 };
diff --git a/src/gallium/include/pipe/p_screen.h b/src/gallium/include/pipe/p_screen.h
index 919d162..5a1bf61 100644
--- a/src/gallium/include/pipe/p_screen.h
+++ b/src/gallium/include/pipe/p_screen.h
@@ -93,6 +93,8 @@ struct pipe_screen {
    struct pipe_video_context * (*video_context_create)( struct pipe_screen *screen,
                                                         enum pipe_video_profile profile,
                                                         enum pipe_video_chroma_format chroma_format,
+                                                        enum pipe_video_entry_point entry_point,
+                                                        unsigned decode_flags,
                                                         unsigned width, unsigned height, void *priv );
 
    /**
diff --git a/src/gallium/include/pipe/p_video_context.h b/src/gallium/include/pipe/p_video_context.h
index 294dc46..94f9ce2 100644
--- a/src/gallium/include/pipe/p_video_context.h
+++ b/src/gallium/include/pipe/p_video_context.h
@@ -52,6 +52,8 @@ struct pipe_video_context
    struct pipe_screen *screen;
    enum pipe_video_profile profile;
    enum pipe_video_chroma_format chroma_format;
+   enum pipe_video_entry_point entry_point;
+   unsigned decode_flags;
    unsigned width;
    unsigned height;
 
@@ -73,6 +75,17 @@ struct pipe_video_context
                                   unsigned geom);
 
    void (*destroy)(struct pipe_video_context *vpipe);
+   
+   /**
+    * Decoder surface creation/destruction/query
+    */
+   void (*create_decoder_surface)(struct pipe_video_context *vpipe,
+								 struct pipe_surface **surface);
+   void (*destroy_decoder_surface)(struct pipe_video_context *vpipe, 
+							      struct pipe_surface **surface);
+   void (*query_decoder_surface)(struct pipe_video_context *vpipe, 
+							    struct pipe_surface *surface,
+							    enum pipe_video_surface_status *status);
 
    /**
     * Picture decoding and displaying
@@ -85,6 +98,7 @@ struct pipe_video_context
    void (*decode_macroblocks)(struct pipe_video_context *vpipe,
                               struct pipe_surface *past,
                               struct pipe_surface *future,
+                              enum pipe_mpeg12_picture_type picture_type,
                               unsigned num_macroblocks,
                               struct pipe_macroblock *macroblocks,
                               struct pipe_fence_handle **fence);
diff --git a/src/gallium/include/pipe/p_video_state.h b/src/gallium/include/pipe/p_video_state.h
index 5eb9635..08a6707 100644
--- a/src/gallium/include/pipe/p_video_state.h
+++ b/src/gallium/include/pipe/p_video_state.h
@@ -38,6 +38,13 @@
 extern "C" {
 #endif
 
+enum pipe_video_surface_status
+{
+	PIPE_VIDEO_SURFACE_STATUS_FREE,
+	PIPE_VIDEO_SURFACE_STATUS_RENDERING,
+	PIPE_VIDEO_SURFACE_STATUS_DISPLAYING
+};
+
 struct pipe_video_rect
 {
    unsigned x, y, w, h;
@@ -79,6 +86,12 @@ struct pipe_macroblock
    enum pipe_video_codec codec;
 };
 
+/* Same motion_field_select from xvmc.*/
+#define PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_FIRST_FORWARD   0x1
+#define PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_FIRST_BACKWARD  0x2
+#define PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_SECOND_FORWARD  0x4
+#define PIPE_VIDEO_MOTION_VERTICAL_FIELD_SELECT_SECOND_BACKWARD 0x8
+
 struct pipe_mpeg12_macroblock
 {
    struct pipe_macroblock base;
@@ -88,6 +101,7 @@ struct pipe_mpeg12_macroblock
    enum pipe_mpeg12_macroblock_type mb_type;
    enum pipe_mpeg12_motion_type mo_type;
    enum pipe_mpeg12_dct_type dct_type;
+   unsigned motion_vertical_field_select;
    signed pmv[2][2][2];
    unsigned cbp;
    short *blocks;
diff --git a/src/gallium/state_trackers/xorg/xvmc/context.c b/src/gallium/state_trackers/xorg/xvmc/context.c
index 5e4af9e..272ae93 100644
--- a/src/gallium/state_trackers/xorg/xvmc/context.c
+++ b/src/gallium/state_trackers/xorg/xvmc/context.c
@@ -172,6 +172,28 @@ static enum pipe_video_chroma_format FormatToPipe(int xvmc_format)
    return -1;
 }
 
+static enum pipe_video_entry_point EntryPointToPipe(int xvmc_mc_type)
+{
+   if (xvmc_mc_type & XVMC_IDCT)
+	  return PIPE_VIDEO_ENTRY_POINT_IDCT;  
+   if ((xvmc_mc_type & XVMC_MOCOMP) == XVMC_MOCOMP)
+      return PIPE_VIDEO_ENTRY_POINT_MC;
+   
+   assert(0);
+
+   return -1;
+}
+
+static unsigned SurfaceFlagsToPipe(int surface_flags)
+{
+	unsigned flags = 0;
+	
+	if (surface_flags & XVMC_INTRA_UNSIGNED)
+		flags |= PIPE_VIDEO_DECODE_FLAG_MB_INTRA_UNSIGNED;
+		
+	return flags;
+}
+
 PUBLIC
 Status XvMCCreateContext(Display *dpy, XvPortID port, int surface_type_id,
                          int width, int height, int flags, XvMCContext *context)
@@ -204,20 +226,6 @@ Status XvMCCreateContext(Display *dpy, XvPortID port, int surface_type_id,
    if (ret != Success || !found_port)
       return ret;
 
-   /* XXX: Current limits */
-   if (chroma_format != XVMC_CHROMA_FORMAT_420) {
-      XVMC_MSG(XVMC_ERR, "[XvMC] Cannot decode requested surface type. Unsupported chroma format.\n");
-      return BadImplementation;
-   }
-   if (mc_type != (XVMC_MOCOMP | XVMC_MPEG_2)) {
-      XVMC_MSG(XVMC_ERR, "[XvMC] Cannot decode requested surface type. Non-MPEG2/Mocomp acceleration unsupported.\n");
-      return BadImplementation;
-   }
-   if (!(surface_flags & XVMC_INTRA_UNSIGNED)) {
-      XVMC_MSG(XVMC_ERR, "[XvMC] Cannot decode requested surface type. Signed intra unsupported.\n");
-      return BadImplementation;
-   }
-
    context_priv = CALLOC(1, sizeof(XvMCContextPrivate));
    if (!context_priv)
       return BadAlloc;
@@ -232,7 +240,8 @@ Status XvMCCreateContext(Display *dpy, XvPortID port, int surface_type_id,
    }
 
    vctx = vl_video_create(vscreen, ProfileToPipe(mc_type),
-                          FormatToPipe(chroma_format), width, height);
+                          FormatToPipe(chroma_format), EntryPointToPipe(mc_type), 
+                          SurfaceFlagsToPipe(surface_flags), width, height);
 
    if (!vctx) {
       XVMC_MSG(XVMC_ERR, "[XvMC] Could not create VL context.\n");
diff --git a/src/gallium/state_trackers/xorg/xvmc/surface.c b/src/gallium/state_trackers/xorg/xvmc/surface.c
index 0decc45..2c16744 100644
--- a/src/gallium/state_trackers/xorg/xvmc/surface.c
+++ b/src/gallium/state_trackers/xorg/xvmc/surface.c
@@ -181,6 +181,7 @@ MacroBlocksToPipe(struct pipe_screen *screen,
                pipe_macroblocks->pmv[j][k][l] = xvmc_mb->PMV[j][k][l];
 
       pipe_macroblocks->cbp = xvmc_mb->coded_block_pattern;
+      pipe_macroblocks->motion_vertical_field_select = xvmc_mb->motion_vertical_field_select;
       pipe_macroblocks->blocks = xvmc_blocks->blocks + xvmc_mb->index * BLOCK_SIZE_SAMPLES;
 
       ++pipe_macroblocks;
@@ -194,8 +195,6 @@ Status XvMCCreateSurface(Display *dpy, XvMCContext *context, XvMCSurface *surfac
    XvMCContextPrivate *context_priv;
    struct pipe_video_context *vpipe;
    XvMCSurfacePrivate *surface_priv;
-   struct pipe_resource template;
-   struct pipe_resource *vsfc_tex;
    struct pipe_surface *vsfc;
 
    XVMC_MSG(XVMC_TRACE, "[XvMC] Creating surface %p.\n", surface);
@@ -214,36 +213,7 @@ Status XvMCCreateSurface(Display *dpy, XvMCContext *context, XvMCSurface *surfac
    if (!surface_priv)
       return BadAlloc;
 
-   memset(&template, 0, sizeof(struct pipe_resource));
-   template.target = PIPE_TEXTURE_2D;
-   template.format = (enum pipe_format)vpipe->get_param(vpipe, PIPE_CAP_DECODE_TARGET_PREFERRED_FORMAT);
-   template.last_level = 0;
-   if (vpipe->is_format_supported(vpipe, template.format,
-                                  PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET,
-                                  PIPE_TEXTURE_GEOM_NON_POWER_OF_TWO)) {
-      template.width0 = context->width;
-      template.height0 = context->height;
-   }
-   else {
-      assert(vpipe->is_format_supported(vpipe, template.format,
-                                       PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET,
-                                       PIPE_TEXTURE_GEOM_NON_SQUARE));
-      template.width0 = util_next_power_of_two(context->width);
-      template.height0 = util_next_power_of_two(context->height);
-   }
-   template.depth0 = 1;
-   template.usage = PIPE_USAGE_DEFAULT;
-   template.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET;
-   template.flags = 0;
-   vsfc_tex = vpipe->screen->resource_create(vpipe->screen, &template);
-   if (!vsfc_tex) {
-      FREE(surface_priv);
-      return BadAlloc;
-   }
-
-   vsfc = vpipe->screen->get_tex_surface(vpipe->screen, vsfc_tex, 0, 0, 0,
-                                         PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET);
-   pipe_resource_reference(&vsfc_tex, NULL);
+   vpipe->create_decoder_surface(vpipe, &vsfc);
    if (!vsfc) {
       FREE(surface_priv);
       return BadAlloc;
@@ -331,7 +301,7 @@ Status XvMCRenderSurface(Display *dpy, XvMCContext *context, unsigned int pictur
                      num_macroblocks, pipe_macroblocks);
 
    vpipe->set_decode_target(vpipe, t_vsfc);
-   vpipe->decode_macroblocks(vpipe, p_vsfc, f_vsfc, num_macroblocks,
+   vpipe->decode_macroblocks(vpipe, p_vsfc, f_vsfc, PictureToPipe(picture_structure), num_macroblocks,
                              &pipe_macroblocks->base, &target_surface_priv->render_fence);
 
    XVMC_MSG(XVMC_TRACE, "[XvMC] Submitted surface %p for rendering.\n", target_surface);
@@ -353,12 +323,22 @@ Status XvMCFlushSurface(Display *dpy, XvMCSurface *surface)
 PUBLIC
 Status XvMCSyncSurface(Display *dpy, XvMCSurface *surface)
 {
+   Status ret;
+   int status;
+   
    assert(dpy);
 
    if (!surface)
       return XvMCBadSurface;
 
-   return Success;
+   for (;;) {
+	   ret = XvMCGetSurfaceStatus(dpy, surface, &status);
+	   if (ret || ( (status & XVMC_RENDERING) == 0) )
+		   break;
+       usec_sleep(1000);//1ms (may be 20ms on linux)
+   }
+
+   return ret;
 }
 
 PUBLIC
@@ -453,14 +433,40 @@ Status XvMCPutSurface(Display *dpy, XvMCSurface *surface, Drawable drawable,
 PUBLIC
 Status XvMCGetSurfaceStatus(Display *dpy, XvMCSurface *surface, int *status)
 {
+   struct pipe_video_context *vpipe;
+   XvMCSurfacePrivate *surface_priv;
+   XvMCContextPrivate *context_priv;
+   XvMCContext *context;
+   enum pipe_video_surface_status vs_status;
+   
    assert(dpy);
 
-   if (!surface)
+   if (!surface || !surface->privData)
       return XvMCBadSurface;
 
    assert(status);
 
-   *status = 0;
+   surface_priv = surface->privData;
+   context = surface_priv->context;
+   context_priv = context->privData;
+   vpipe = context_priv->vctx->vpipe;
+   
+   vpipe->query_decoder_surface(vpipe, surface_priv->pipe_vsfc,
+                               &vs_status);
+   switch (vs_status) {
+   case PIPE_VIDEO_SURFACE_STATUS_FREE:
+		*status = 0;
+		break;
+   case PIPE_VIDEO_SURFACE_STATUS_RENDERING:
+		*status = XVMC_RENDERING;
+		break;
+	case PIPE_VIDEO_SURFACE_STATUS_DISPLAYING:
+		*status = XVMC_DISPLAYING;
+		break;
+	default:
+		*status = XVMC_RENDERING;
+		break;
+   }
 
    return Success;
 }
@@ -468,7 +474,10 @@ Status XvMCGetSurfaceStatus(Display *dpy, XvMCSurface *surface, int *status)
 PUBLIC
 Status XvMCDestroySurface(Display *dpy, XvMCSurface *surface)
 {
+   struct pipe_video_context *vpipe;
    XvMCSurfacePrivate *surface_priv;
+   XvMCContextPrivate *context_priv;
+   XvMCContext *context;
 
    XVMC_MSG(XVMC_TRACE, "[XvMC] Destroying surface %p.\n", surface);
 
@@ -478,7 +487,11 @@ Status XvMCDestroySurface(Display *dpy, XvMCSurface *surface)
       return XvMCBadSurface;
 
    surface_priv = surface->privData;
-   pipe_surface_reference(&surface_priv->pipe_vsfc, NULL);
+   context = surface_priv->context;
+   context_priv = context->privData;
+   vpipe = context_priv->vctx->vpipe;
+   
+   vpipe->destroy_decoder_surface(vpipe, &surface_priv->pipe_vsfc);
    FREE(surface_priv);
    surface->privData = NULL;
 
diff --git a/src/gallium/winsys/g3dvl/dri/dri_winsys.c b/src/gallium/winsys/g3dvl/dri/dri_winsys.c
index 0663184..8ac7fdc 100644
--- a/src/gallium/winsys/g3dvl/dri/dri_winsys.c
+++ b/src/gallium/winsys/g3dvl/dri/dri_winsys.c
@@ -240,6 +240,8 @@ struct vl_context*
 vl_video_create(struct vl_screen *vscreen,
                 enum pipe_video_profile profile,
                 enum pipe_video_chroma_format chroma_format,
+                enum pipe_video_entry_point entry_point,
+                unsigned decode_flags,
                 unsigned width, unsigned height)
 {
    struct vl_dri_screen *vl_dri_scrn = (struct vl_dri_screen*)vscreen;
@@ -258,6 +260,8 @@ vl_video_create(struct vl_screen *vscreen,
 
    vl_dri_ctx->base.vpipe = vscreen->pscreen->video_context_create(vscreen->pscreen,
                                                                    profile, chroma_format,
+                                                                   entry_point,
+                                                                   decode_flags,
                                                                    width, height,
                                                                    vl_dri_ctx);
 
diff --git a/src/gallium/winsys/g3dvl/vl_winsys.h b/src/gallium/winsys/g3dvl/vl_winsys.h
index 3814786..dbdff71 100644
--- a/src/gallium/winsys/g3dvl/vl_winsys.h
+++ b/src/gallium/winsys/g3dvl/vl_winsys.h
@@ -56,6 +56,8 @@ struct vl_context*
 vl_video_create(struct vl_screen *vscreen,
                 enum pipe_video_profile profile,
                 enum pipe_video_chroma_format chroma_format,
+                enum pipe_video_entry_point entry_point,
+                unsigned decode_flags,
                 unsigned width, unsigned height);
 
 void vl_video_destroy(struct vl_context *vctx);
diff --git a/src/gallium/winsys/g3dvl/xlib/xsp_winsys.c b/src/gallium/winsys/g3dvl/xlib/xsp_winsys.c
index 0a7f324..c960fdb 100644
--- a/src/gallium/winsys/g3dvl/xlib/xsp_winsys.c
+++ b/src/gallium/winsys/g3dvl/xlib/xsp_winsys.c
@@ -164,6 +164,8 @@ struct vl_context*
 vl_video_create(struct vl_screen *vscreen,
                 enum pipe_video_profile profile,
                 enum pipe_video_chroma_format chroma_format,
+                enum pipe_video_entry_point entry_point,
+                unsigned decode_flags,
                 unsigned width, unsigned height)
 {
    struct pipe_video_context *vpipe;
@@ -176,6 +178,8 @@ vl_video_create(struct vl_screen *vscreen,
    vpipe = vscreen->pscreen->video_context_create(vscreen->pscreen,
                                                   profile,
                                                   chroma_format,
+                                                  entry_point,
+                                                  decode_flags,
                                                   width, height, NULL);
    if (!vpipe)
       return NULL;
