From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 3/3] nv50: organize screen caps
Date: Mon, 16 Jun 2014 23:16:51 -0400
Message-ID: <1402975011-27394-3-git-send-email-imirkin@alum.mit.edu>
References: <1402975011-27394-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1402975011-27394-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_screen.c | 124 ++++++++++++-------------
 1 file changed, 57 insertions(+), 67 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 015f139..c09a8c6 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -85,6 +85,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    const uint16_t class_3d = nouveau_screen(pscreen)->class_3d;
 
    switch (param) {
+   /* non-boolean caps */
    case PIPE_CAP_MAX_TEXTURE_2D_LEVELS:
       return 14;
    case PIPE_CAP_MAX_TEXTURE_3D_LEVELS:
@@ -99,6 +100,38 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_MAX_TEXTURE_GATHER_OFFSET:
    case PIPE_CAP_MAX_TEXEL_OFFSET:
       return 7;
+   case PIPE_CAP_MAX_TEXTURE_BUFFER_SIZE:
+      return 65536;
+   case PIPE_CAP_GLSL_FEATURE_LEVEL:
+      return 330;
+   case PIPE_CAP_MAX_RENDER_TARGETS:
+      return 8;
+   case PIPE_CAP_MAX_DUAL_SOURCE_RENDER_TARGETS:
+      return 1;
+   case PIPE_CAP_MAX_STREAM_OUTPUT_BUFFERS:
+      return 4;
+   case PIPE_CAP_MAX_STREAM_OUTPUT_INTERLEAVED_COMPONENTS:
+   case PIPE_CAP_MAX_STREAM_OUTPUT_SEPARATE_COMPONENTS:
+      return 64;
+   case PIPE_CAP_MAX_GEOMETRY_OUTPUT_VERTICES:
+   case PIPE_CAP_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS:
+      return 1024;
+   case PIPE_CAP_CONSTANT_BUFFER_OFFSET_ALIGNMENT:
+      return 256;
+   case PIPE_CAP_TEXTURE_BUFFER_OFFSET_ALIGNMENT:
+      return 1; /* 256 for binding as RT, but that's not possible in GL */
+   case PIPE_CAP_MIN_MAP_BUFFER_ALIGNMENT:
+      return NOUVEAU_MIN_BUFFER_MAP_ALIGN;
+   case PIPE_CAP_MAX_VIEWPORTS:
+      return NV50_MAX_VIEWPORTS;
+   case PIPE_CAP_TEXTURE_BORDER_COLOR_QUIRK:
+      return PIPE_QUIRK_TEXTURE_BORDER_COLOR_SWIZZLE_NV50;
+   case PIPE_CAP_ENDIANNESS:
+      return PIPE_ENDIAN_LITTLE;
+   case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
+      return (class_3d >= NVA3_3D_CLASS) ? 4 : 0;
+
+   /* supported caps */
    case PIPE_CAP_TEXTURE_MIRROR_CLAMP:
    case PIPE_CAP_TEXTURE_SWIZZLE:
    case PIPE_CAP_TEXTURE_SHADOW_MAP:
@@ -107,58 +140,20 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_ANISOTROPIC_FILTER:
    case PIPE_CAP_TEXTURE_BUFFER_OBJECTS:
    case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
-      return 1;
-   case PIPE_CAP_MAX_TEXTURE_BUFFER_SIZE:
-      return 65536;
-   case PIPE_CAP_SEAMLESS_CUBE_MAP:
-      return 1; /* nv50_screen(pscreen)->tesla->oclass >= NVA0_3D_CLASS; */
-   case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
-      return 0;
-   case PIPE_CAP_CUBE_MAP_ARRAY:
-      return nv50_screen(pscreen)->tesla->oclass >= NVA3_3D_CLASS;
    case PIPE_CAP_TWO_SIDED_STENCIL:
    case PIPE_CAP_DEPTH_CLIP_DISABLE:
    case PIPE_CAP_POINT_SPRITE:
-      return 1;
    case PIPE_CAP_SM3:
-      return 1;
-   case PIPE_CAP_GLSL_FEATURE_LEVEL:
-      return 330;
-   case PIPE_CAP_MAX_RENDER_TARGETS:
-      return 8;
-   case PIPE_CAP_MAX_DUAL_SOURCE_RENDER_TARGETS:
-      return 1;
    case PIPE_CAP_FRAGMENT_COLOR_CLAMPED:
    case PIPE_CAP_VERTEX_COLOR_UNCLAMPED:
    case PIPE_CAP_VERTEX_COLOR_CLAMPED:
-      return 1;
    case PIPE_CAP_QUERY_TIMESTAMP:
    case PIPE_CAP_QUERY_TIME_ELAPSED:
    case PIPE_CAP_OCCLUSION_QUERY:
-      return 1;
-   case PIPE_CAP_MAX_STREAM_OUTPUT_BUFFERS:
-      return 4;
-   case PIPE_CAP_MAX_STREAM_OUTPUT_INTERLEAVED_COMPONENTS:
-   case PIPE_CAP_MAX_STREAM_OUTPUT_SEPARATE_COMPONENTS:
-      return 64;
-   case PIPE_CAP_MAX_GEOMETRY_OUTPUT_VERTICES:
-   case PIPE_CAP_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS:
-      return 1024;
-   case PIPE_CAP_STREAM_OUTPUT_PAUSE_RESUME:
-      return (class_3d >= NVA0_3D_CLASS) ? 1 : 0;
    case PIPE_CAP_BLEND_EQUATION_SEPARATE:
    case PIPE_CAP_INDEP_BLEND_ENABLE:
-      return 1;
-   case PIPE_CAP_INDEP_BLEND_FUNC:
-      return nv50_screen(pscreen)->tesla->oclass >= NVA3_3D_CLASS;
    case PIPE_CAP_TGSI_FS_COORD_ORIGIN_UPPER_LEFT:
    case PIPE_CAP_TGSI_FS_COORD_PIXEL_CENTER_HALF_INTEGER:
-      return 1;
-   case PIPE_CAP_TGSI_FS_COORD_ORIGIN_LOWER_LEFT:
-   case PIPE_CAP_TGSI_FS_COORD_PIXEL_CENTER_INTEGER:
-      return 0;
-   case PIPE_CAP_SHADER_STENCIL_EXPORT:
-      return 0;
    case PIPE_CAP_PRIMITIVE_RESTART:
    case PIPE_CAP_TGSI_INSTANCEID:
    case PIPE_CAP_VERTEX_ELEMENT_INSTANCE_DIVISOR:
@@ -167,51 +162,46 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TEXTURE_BARRIER:
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_START_INSTANCE:
-      return 1;
-   case PIPE_CAP_TGSI_CAN_COMPACT_CONSTANTS:
-      return 0; /* state trackers will know better */
    case PIPE_CAP_USER_CONSTANT_BUFFERS:
    case PIPE_CAP_USER_INDEX_BUFFERS:
    case PIPE_CAP_USER_VERTEX_BUFFERS:
+   case PIPE_CAP_TEXTURE_MULTISAMPLE:
+   case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
       return 1;
-   case PIPE_CAP_CONSTANT_BUFFER_OFFSET_ALIGNMENT:
-      return 256;
-   case PIPE_CAP_TEXTURE_BUFFER_OFFSET_ALIGNMENT:
-      return 1; /* 256 for binding as RT, but that's not possible in GL */
-   case PIPE_CAP_MIN_MAP_BUFFER_ALIGNMENT:
-      return NOUVEAU_MIN_BUFFER_MAP_ALIGN;
+   case PIPE_CAP_SEAMLESS_CUBE_MAP:
+      return 1; /* class_3d >= NVA0_3D_CLASS; */
+   /* supported on nva0+ */
+   case PIPE_CAP_STREAM_OUTPUT_PAUSE_RESUME:
+      return class_3d >= NVA0_3D_CLASS;
+   /* supported on nva3+ */
+   case PIPE_CAP_CUBE_MAP_ARRAY:
+   case PIPE_CAP_INDEP_BLEND_FUNC:
+   case PIPE_CAP_TEXTURE_QUERY_LOD:
+   case PIPE_CAP_SAMPLE_SHADING:
+      return class_3d >= NVA3_3D_CLASS;
+
+   /* unsupported caps */
+   case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
+   case PIPE_CAP_TGSI_FS_COORD_ORIGIN_LOWER_LEFT:
+   case PIPE_CAP_TGSI_FS_COORD_PIXEL_CENTER_INTEGER:
+   case PIPE_CAP_SHADER_STENCIL_EXPORT:
+   case PIPE_CAP_TGSI_CAN_COMPACT_CONSTANTS:
    case PIPE_CAP_VERTEX_BUFFER_OFFSET_4BYTE_ALIGNED_ONLY:
    case PIPE_CAP_VERTEX_BUFFER_STRIDE_4BYTE_ALIGNED_ONLY:
    case PIPE_CAP_VERTEX_ELEMENT_SRC_OFFSET_4BYTE_ALIGNED_ONLY:
    case PIPE_CAP_TGSI_TEXCOORD:
-      return 0;
-   case PIPE_CAP_TEXTURE_MULTISAMPLE:
-      return 1;
-   case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
-      return 1;
    case PIPE_CAP_QUERY_PIPELINE_STATISTICS:
-      return 0;
-   case PIPE_CAP_TEXTURE_BORDER_COLOR_QUIRK:
-      return PIPE_QUIRK_TEXTURE_BORDER_COLOR_SWIZZLE_NV50;
-   case PIPE_CAP_ENDIANNESS:
-      return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
    case PIPE_CAP_FAKE_SW_MSAA:
    case PIPE_CAP_TEXTURE_GATHER_OFFSETS:
    case PIPE_CAP_TGSI_VS_WINDOW_SPACE_POSITION:
-      return 0;
-   case PIPE_CAP_MAX_VIEWPORTS:
-      return NV50_MAX_VIEWPORTS;
-   case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
-      return (class_3d >= NVA3_3D_CLASS) ? 4 : 0;
-   case PIPE_CAP_TEXTURE_QUERY_LOD:
-   case PIPE_CAP_SAMPLE_SHADING:
-      return class_3d >= NVA3_3D_CLASS;
-   default:
-      NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
+   case PIPE_CAP_COMPUTE:
       return 0;
    }
+
+   NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
+   return 0;
 }
 
 static int
-- 
1.8.5.5
