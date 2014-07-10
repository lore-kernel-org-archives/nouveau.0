From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/3] nvc0: add support for indirect drawing
Date: Wed,  9 Jul 2014 23:59:04 -0400
Message-ID: <1404964745-31949-3-git-send-email-imirkin@alum.mit.edu>
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
 docs/GL3.txt                                       |  5 +-
 docs/relnotes/10.3.html                            |  1 +
 src/gallium/drivers/nouveau/nouveau_screen.c       |  6 +-
 src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h     |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_screen.c     |  2 +
 src/gallium/drivers/nouveau/nvc0/mme/com9097.mme   | 75 ++++++++++++++++++
 src/gallium/drivers/nouveau/nvc0/mme/com9097.mme.h | 56 ++++++++++++++
 src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h     |  6 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     | 13 +++-
 src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c        | 90 ++++++++++++++++------
 10 files changed, 223 insertions(+), 33 deletions(-)

diff --git a/docs/GL3.txt b/docs/GL3.txt
index 296e14c..8f41df0 100644
--- a/docs/GL3.txt
+++ b/docs/GL3.txt
@@ -98,7 +98,7 @@ GL 4.0:
 
   GLSL 4.0                                             not started
   GL_ARB_draw_buffers_blend                            DONE (i965, nv50, nvc0, r600, radeonsi, softpipe)
-  GL_ARB_draw_indirect                                 DONE (i965)
+  GL_ARB_draw_indirect                                 DONE (i965, nvc0)
   GL_ARB_gpu_shader5                                   started
   - 'precise' qualifier                                DONE
   - Dynamically uniform sampler array indices          started (Chris)
@@ -123,7 +123,6 @@ GL 4.0:
   GL_ARB_transform_feedback2                           DONE (i965, nv50, nvc0, r600, radeonsi)
   GL_ARB_transform_feedback3                           DONE (i965, nv50, nvc0, r600, radeonsi)
 
-
 GL 4.1:
 
   GLSL 4.1                                             not started
@@ -165,7 +164,7 @@ GL 4.3:
   GL_ARB_framebuffer_no_attachments                    not started
   GL_ARB_internalformat_query2                         not started
   GL_ARB_invalidate_subdata                            DONE (all drivers)
-  GL_ARB_multi_draw_indirect                           DONE (i965)
+  GL_ARB_multi_draw_indirect                           DONE (i965, nvc0)
   GL_ARB_program_interface_query                       not started
   GL_ARB_robust_buffer_access_behavior                 not started
   GL_ARB_shader_image_size                             not started
diff --git a/docs/relnotes/10.3.html b/docs/relnotes/10.3.html
index 2e718fc..7d4f533 100644
--- a/docs/relnotes/10.3.html
+++ b/docs/relnotes/10.3.html
@@ -56,6 +56,7 @@ Note: some of the new features are only available with certain drivers.
 <li>GL_ARB_seamless_cubemap_per_texture on i965, llvmpipe, nvc0, r600, radeonsi, softpipe</li>
 <li>GL_ARB_fragment_layer_viewport on nv50, nvc0, llvmpipe, r600</li>
 <li>GL_AMD_vertex_shader_viewport_index on i965/gen7+, r600</li>
+<li>GL_ARB_(multi_)draw_indirect on nvc0</li>
 </ul>
 
 
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 9d71bf7..517978d 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -194,12 +194,14 @@ nouveau_screen_init(struct nouveau_screen *screen, struct nouveau_device *dev)
 	screen->lowmem_bindings = PIPE_BIND_GLOBAL; /* gallium limit */
 	screen->vidmem_bindings =
 		PIPE_BIND_RENDER_TARGET | PIPE_BIND_DEPTH_STENCIL |
-		PIPE_BIND_DISPLAY_TARGET | PIPE_BIND_SCANOUT | PIPE_BIND_CURSOR |
+		PIPE_BIND_DISPLAY_TARGET | PIPE_BIND_SCANOUT |
+		PIPE_BIND_CURSOR |
 		PIPE_BIND_SAMPLER_VIEW |
 		PIPE_BIND_SHADER_RESOURCE | PIPE_BIND_COMPUTE_RESOURCE |
 		PIPE_BIND_GLOBAL;
 	screen->sysmem_bindings =
-		PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_STREAM_OUTPUT;
+		PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_STREAM_OUTPUT |
+		PIPE_BIND_COMMAND_ARGS_BUFFER;
 
 	memset(&mm_config, 0, sizeof(mm_config));
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h b/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h
index cc3a382..7523fdc 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h
@@ -479,7 +479,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define NV50_3D_WATCHDOG_TIMER					0x00000de4
 
-#define NV50_3D_UNK0DE8						0x00000de8
+#define NV50_3D_PRIM_RESTART_WITH_DRAW_ARRAYS			0x00000de8
 
 #define NV50_3D_UNK0DEC						0x00000dec
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 17d8fa3..fd63819 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -437,6 +437,8 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
    PUSH_DATA (push, NV50_3D_MULTISAMPLE_MODE_MS1);
    BEGIN_NV04(push, NV50_3D(MULTISAMPLE_CTRL), 1);
    PUSH_DATA (push, 0);
+   BEGIN_NV04(push, NV50_3D(PRIM_RESTART_WITH_DRAW_ARRAYS), 1);
+   PUSH_DATA (push, 1);
    BEGIN_NV04(push, NV50_3D(LINE_LAST_PIXEL), 1);
    PUSH_DATA (push, 0);
    BEGIN_NV04(push, NV50_3D(BLEND_SEPARATE_ALPHA), 1);
diff --git a/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme b/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme
index da9975b..07e4519 100644
--- a/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme
+++ b/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme
@@ -223,3 +223,78 @@ locn_0a_ts:
 locn_0f_ts:
    exit maddr 0xbb
    send $r6
+
+/* NVC0_3D_MACRO_DRAW_ELEMENTS_INDIRECT
+ *
+ * NOTE: Saves and restores VB_ELEMENT,INSTANCE_BASE.
+ *
+ * arg     = mode
+ * parm[0] = count
+ * parm[1] = instance_count
+ * parm[2] = start
+ * parm[3] = index_bias
+ * parm[4] = start_instance
+ */
+.section #mme9097_draw_elts_indirect
+   parm $r3 /* count */
+   parm $r2 /* instance_count */
+   parm $r4 maddr 0x5f7 /* INDEX_BATCH_FIRST, start */
+   parm $r4 send $r4 /* index_bias, send start */
+   braz $r2 #dei_end
+   parm $r5 /* start_instance */
+   read $r6 0x50d /* VB_ELEMENT_BASE */
+   read $r7 0x50e /* VB_INSTANCE_BASE */
+   maddr 0x150d /* VB_ELEMENT,INSTANCE_BASE */
+   send $r4
+   send $r5
+   mov $r4 0x1
+dei_again:
+   maddr 0x586 /* VERTEX_BEGIN_GL */
+   send $r1 /* mode */
+   maddr 0x5f8 /* INDEX_BATCH_COUNT */
+   send $r3 /* count */
+   mov $r2 (sub $r2 $r4)
+   maddrsend 0x585 /* VERTEX_END_GL */
+   branz $r2 #dei_again
+   mov $r1 (extrinsrt $r1 $r4 0 1 26) /* set INSTANCE_NEXT */
+   maddr 0x150d /* VB_ELEMENT,INSTANCE_BASE */
+   exit send $r6
+   send $r7
+dei_end:
+   exit
+   nop
+
+/* NVC0_3D_MACRO_DRAW_ARRAYS_INDIRECT:
+ *
+ * NOTE: Saves and restores VB_INSTANCE_BASE.
+ *
+ * arg     = mode
+ * parm[0] = count
+ * parm[1] = instance_count
+ * parm[2] = start
+ * parm[3] = start_instance
+ */
+.section #mme9097_draw_arrays_indirect
+   parm $r2 /* count */
+   parm $r3 /* instance_count */
+   parm $r4 maddr 0x35d /* VERTEX_BUFFER_FIRST, start */
+   parm $r4 send $r4 /* start_instance */
+   braz $r3 #dai_end
+   read $r6 0x50e /* VB_INSTANCE_BASE */
+   maddr 0x50e /* VB_INSTANCE_BASE */
+   mov $r5 0x1
+   send $r4
+dai_again:
+   maddr 0x586 /* VERTEX_BEGIN_GL */
+   send $r1 /* mode */
+   maddr 0x35e /* VERTEX_BUFFER_COUNT */
+   send $r2
+   mov $r3 (sub $r3 $r5)
+   maddrsend 0x585 /* VERTEX_END_GL */
+   branz $r3 #dai_again
+   mov $r1 (extrinsrt $r1 $r5 0 1 26) /* set INSTANCE_NEXT */
+   exit maddr 0x50e /* VB_INSTANCE_BASE to restore */
+   send $r6
+dai_end:
+   exit
+   nop
diff --git a/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme.h b/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme.h
index fd81a2f..654bf93 100644
--- a/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme.h
+++ b/src/gallium/drivers/nouveau/nvc0/mme/com9097.mme.h
@@ -123,3 +123,59 @@ uint32_t mme9097_tep_select[] = {
 	0x002ec0a1,
 	0x00003041,
 };
+
+uint32_t mme9097_draw_elts_indirect[] = {
+	0x00000301,
+	0x00000201,
+	0x017dc451,
+/* 0x000c: dei_again */
+	0x00002431,
+	0x0004d007,
+/* 0x0017: dei_end */
+	0x00000501,
+	0x01434615,
+	0x01438715,
+	0x05434021,
+	0x00002041,
+	0x00002841,
+	0x00004411,
+	0x01618021,
+	0x00000841,
+	0x017e0021,
+	0x00001841,
+	0x00051210,
+	0x01614071,
+	0xfffe9017,
+	0xd0410912,
+	0x05434021,
+	0x000030c1,
+	0x00003841,
+	0x00000091,
+	0x00000011,
+};
+
+uint32_t mme9097_draw_arrays_indirect[] = {
+	0x00000201,
+	0x00000301,
+/* 0x0009: dai_again */
+	0x00d74451,
+	0x00002431,
+/* 0x0013: dai_end */
+	0x0003d807,
+	0x01438615,
+	0x01438021,
+	0x00004511,
+	0x00002041,
+	0x01618021,
+	0x00000841,
+	0x00d78021,
+	0x00001041,
+	0x00055b10,
+	0x01614071,
+	0xfffe9817,
+	0xd0414912,
+	0x014380a1,
+	0x00003041,
+	0x00000091,
+	0x00000011,
+};
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h b/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h
index 9e3c56b..94b447b 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h
@@ -338,6 +338,8 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define NVC0_3D_WATCHDOG_TIMER					0x00000de4
 
+#define NVC0_3D_PRIM_RESTART_WITH_DRAW_ARRAYS			0x00000de8
+
 #define NVC0_3D_WINDOW_OFFSET_X					0x00000df8
 
 #define NVC0_3D_WINDOW_OFFSET_Y					0x00000dfc
@@ -1347,5 +1349,9 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define NVC0_3D_MACRO_TEP_SELECT				0x00003830
 
+#define NVC0_3D_MACRO_DRAW_ARRAYS_INDIRECT			0x00003838
+
+#define NVC0_3D_MACRO_DRAW_ELEMENTS_INDIRECT			0x00003840
+
 
 #endif /* NVC0_3D_XML */
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index dc9b143..3f444a4 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -158,6 +158,7 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_START_INSTANCE:
    case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
+   case PIPE_CAP_DRAW_INDIRECT:
    case PIPE_CAP_USER_CONSTANT_BUFFERS:
    case PIPE_CAP_USER_INDEX_BUFFERS:
    case PIPE_CAP_USER_VERTEX_BUFFERS:
@@ -183,7 +184,6 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TGSI_VS_LAYER_VIEWPORT:
    case PIPE_CAP_FAKE_SW_MSAA:
    case PIPE_CAP_TGSI_VS_WINDOW_SPACE_POSITION:
-   case PIPE_CAP_DRAW_INDIRECT:
       return 0;
    }
 
@@ -405,6 +405,8 @@ nvc0_graph_set_macro(struct nvc0_screen *screen, uint32_t m, unsigned pos,
 
    size /= 4;
 
+   assert((pos + size) <= 0x800);
+
    BEGIN_NVC0(push, SUBC_3D(NVC0_GRAPH_MACRO_ID), 2);
    PUSH_DATA (push, (m - 0x3800) / 8);
    PUSH_DATA (push, pos);
@@ -433,8 +435,6 @@ nvc0_magic_3d_init(struct nouveau_pushbuf *push, uint16_t obj_class)
    PUSH_DATA (push, (3 << 16) | 3);
    BEGIN_NVC0(push, SUBC_3D(0x1794), 1);
    PUSH_DATA (push, (2 << 16) | 2);
-   BEGIN_NVC0(push, SUBC_3D(0x0de8), 1);
-   PUSH_DATA (push, 1);
 
    if (obj_class < GM107_3D_CLASS) {
       BEGIN_NVC0(push, SUBC_3D(0x12ac), 1);
@@ -609,7 +609,8 @@ nvc0_screen_create(struct nouveau_device *dev)
    push->rsvd_kick = 5;
 
    screen->base.vidmem_bindings |= PIPE_BIND_CONSTANT_BUFFER |
-      PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER;
+      PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER |
+      PIPE_BIND_COMMAND_ARGS_BUFFER;
    screen->base.sysmem_bindings |=
       PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER;
 
@@ -768,6 +769,8 @@ nvc0_screen_create(struct nouveau_device *dev)
    PUSH_DATA (push, 1);
    BEGIN_NVC0(push, NVC0_3D(LINE_LAST_PIXEL), 1);
    PUSH_DATA (push, 0);
+   BEGIN_NVC0(push, NVC0_3D(PRIM_RESTART_WITH_DRAW_ARRAYS), 1);
+   PUSH_DATA (push, 1);
    BEGIN_NVC0(push, NVC0_3D(BLEND_SEPARATE_ALPHA), 1);
    PUSH_DATA (push, 1);
    BEGIN_NVC0(push, NVC0_3D(BLEND_ENABLE_COMMON), 1);
@@ -954,6 +957,8 @@ nvc0_screen_create(struct nouveau_device *dev)
    MK_MACRO(NVC0_3D_MACRO_GP_SELECT, mme9097_gp_select);
    MK_MACRO(NVC0_3D_MACRO_POLYGON_MODE_FRONT, mme9097_poly_mode_front);
    MK_MACRO(NVC0_3D_MACRO_POLYGON_MODE_BACK, mme9097_poly_mode_back);
+   MK_MACRO(NVC0_3D_MACRO_DRAW_ARRAYS_INDIRECT, mme9097_draw_arrays_indirect);
+   MK_MACRO(NVC0_3D_MACRO_DRAW_ELEMENTS_INDIRECT, mme9097_draw_elts_indirect);
 
    BEGIN_NVC0(push, NVC0_3D(RASTERIZE_ENABLE), 1);
    PUSH_DATA (push, 1);
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index c26b98f..f99d533 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
@@ -573,6 +573,8 @@ nvc0_draw_arrays(struct nvc0_context *nvc0,
    unsigned prim;
 
    if (nvc0->state.index_bias) {
+      /* index_bias is implied 0 if !info->indexed (really ?) */
+      /* TODO: can we deactivate it for the VERTEX_BUFFER_FIRST command ? */
       PUSH_SPACE(push, 1);
       IMMED_NVC0(push, NVC0_3D(VB_ELEMENT_BASE), 0);
       nvc0->state.index_bias = 0;
@@ -794,6 +796,61 @@ nvc0_draw_stream_output(struct nvc0_context *nvc0,
    }
 }
 
+static void
+nvc0_draw_indirect(struct nvc0_context *nvc0, const struct pipe_draw_info *info)
+{
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+   struct nv04_resource *buf = nv04_resource(info->indirect);
+   unsigned size;
+   const uint32_t offset = buf->offset + info->indirect_offset;
+
+   /* must make FIFO wait for engines idle before continuing to process */
+   if (buf->fence_wr && !nouveau_fence_signalled(buf->fence_wr))
+      IMMED_NVC0(push, SUBC_3D(NV10_SUBCHAN_REF_CNT), 0);
+
+   PUSH_SPACE(push, 8);
+   if (info->indexed) {
+      assert(nvc0->idxbuf.buffer);
+      assert(nouveau_resource_mapped_by_gpu(nvc0->idxbuf.buffer));
+      size = 5 * 4;
+      BEGIN_1IC0(push, NVC0_3D(MACRO_DRAW_ELEMENTS_INDIRECT), 1 + size / 4);
+   } else {
+      if (nvc0->state.index_bias) {
+         /* index_bias is implied 0 if !info->indexed (really ?) */
+         IMMED_NVC0(push, NVC0_3D(VB_ELEMENT_BASE), 0);
+         nvc0->state.index_bias = 0;
+      }
+      size = 4 * 4;
+      BEGIN_1IC0(push, NVC0_3D(MACRO_DRAW_ARRAYS_INDIRECT), 1 + size / 4);
+   }
+   PUSH_DATA(push, nvc0_prim_gl(info->mode));
+#define NVC0_IB_ENTRY_1_NO_PREFETCH (1 << (31 - 8))
+   nouveau_pushbuf_space(push, 0, 0, 1);
+   nouveau_pushbuf_data(push,
+                        buf->bo, offset, NVC0_IB_ENTRY_1_NO_PREFETCH | size);
+}
+
+static INLINE void
+nvc0_update_prim_restart(struct nvc0_context *nvc0, boolean en, uint32_t index)
+{
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+
+   if (en != nvc0->state.prim_restart) {
+      if (en) {
+         BEGIN_NVC0(push, NVC0_3D(PRIM_RESTART_ENABLE), 2);
+         PUSH_DATA (push, 1);
+         PUSH_DATA (push, index);
+      } else {
+         IMMED_NVC0(push, NVC0_3D(PRIM_RESTART_ENABLE), 0);
+      }
+      nvc0->state.prim_restart = en;
+   } else
+   if (en) {
+      BEGIN_NVC0(push, NVC0_3D(PRIM_RESTART_INDEX), 1);
+      PUSH_DATA (push, index);
+   }
+}
+
 void
 nvc0_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
@@ -885,42 +942,29 @@ nvc0_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
        nvc0->idxbuf.buffer->flags & PIPE_RESOURCE_FLAG_MAP_COHERENT)
       nvc0->base.vbo_dirty = TRUE;
 
+   nvc0_update_prim_restart(nvc0, info->primitive_restart, info->restart_index);
+
    if (nvc0->base.vbo_dirty) {
       if (nvc0->screen->eng3d->oclass < GM107_3D_CLASS)
          IMMED_NVC0(push, NVC0_3D(VERTEX_ARRAY_FLUSH), 0);
       nvc0->base.vbo_dirty = FALSE;
    }
 
+   if (unlikely(info->indirect)) {
+      nvc0_draw_indirect(nvc0, info);
+   } else
+   if (unlikely(info->count_from_stream_output)) {
+      nvc0_draw_stream_output(nvc0, info);
+   } else
    if (info->indexed) {
       boolean shorten = info->max_index <= 65535;
 
-      if (info->primitive_restart != nvc0->state.prim_restart) {
-         if (info->primitive_restart) {
-            BEGIN_NVC0(push, NVC0_3D(PRIM_RESTART_ENABLE), 2);
-            PUSH_DATA (push, 1);
-            PUSH_DATA (push, info->restart_index);
-
-            if (info->restart_index > 65535)
-               shorten = FALSE;
-         } else {
-            IMMED_NVC0(push, NVC0_3D(PRIM_RESTART_ENABLE), 0);
-         }
-         nvc0->state.prim_restart = info->primitive_restart;
-      } else
-      if (info->primitive_restart) {
-         BEGIN_NVC0(push, NVC0_3D(PRIM_RESTART_INDEX), 1);
-         PUSH_DATA (push, info->restart_index);
-
-         if (info->restart_index > 65535)
-            shorten = FALSE;
-      }
+      if (info->primitive_restart && info->restart_index > 65535)
+         shorten = FALSE;
 
       nvc0_draw_elements(nvc0, shorten,
                          info->mode, info->start, info->count,
                          info->instance_count, info->index_bias);
-   } else
-   if (unlikely(info->count_from_stream_output)) {
-      nvc0_draw_stream_output(nvc0, info);
    } else {
       nvc0_draw_arrays(nvc0,
                        info->mode, info->start, info->count,
-- 
1.8.5.5
