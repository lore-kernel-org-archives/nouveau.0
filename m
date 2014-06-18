From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nv30: tidy screen caps, add missing ones
Date: Tue, 17 Jun 2014 23:55:20 -0400
Message-ID: <1403063721-28896-1-git-send-email-imirkin@alum.mit.edu>
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
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv30/nv30_screen.c | 33 +++++++++++++-------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index 4baabaf..5c3d783 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -62,6 +62,12 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return 13;
    case PIPE_CAP_GLSL_FEATURE_LEVEL:
       return 120;
+   case PIPE_CAP_ENDIANNESS:
+      return PIPE_ENDIAN_LITTLE;
+   case PIPE_CAP_CONSTANT_BUFFER_OFFSET_ALIGNMENT:
+      return 16;
+   case PIPE_CAP_MAX_VIEWPORTS:
+      return 1;
    /* supported capabilities */
    case PIPE_CAP_TWO_SIDED_STENCIL:
    case PIPE_CAP_ANISOTROPIC_FILTER:
@@ -80,12 +86,10 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_USER_CONSTANT_BUFFERS:
    case PIPE_CAP_USER_INDEX_BUFFERS:
    case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
-      return 1;
-   case PIPE_CAP_USER_VERTEX_BUFFERS:
-      return 0;
-   case PIPE_CAP_CONSTANT_BUFFER_OFFSET_ALIGNMENT:
-      return 16;
-   case PIPE_CAP_MAX_VIEWPORTS:
+   case PIPE_CAP_VERTEX_BUFFER_OFFSET_4BYTE_ALIGNED_ONLY:
+   case PIPE_CAP_VERTEX_BUFFER_STRIDE_4BYTE_ALIGNED_ONLY:
+   case PIPE_CAP_VERTEX_ELEMENT_SRC_OFFSET_4BYTE_ALIGNED_ONLY:
+   case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
       return 1;
    /* nv4x capabilities */
    case PIPE_CAP_BLEND_EQUATION_SEPARATE:
@@ -119,6 +123,8 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
    case PIPE_CAP_CUBE_MAP_ARRAY:
    case PIPE_CAP_VERTEX_COLOR_UNCLAMPED:
+   case PIPE_CAP_FRAGMENT_COLOR_CLAMPED:
+   case PIPE_CAP_VERTEX_COLOR_CLAMPED:
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_MIXED_COLORBUFFER_FORMATS:
    case PIPE_CAP_START_INSTANCE:
@@ -138,18 +144,13 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_SAMPLE_SHADING:
    case PIPE_CAP_TEXTURE_GATHER_OFFSETS:
    case PIPE_CAP_TGSI_VS_WINDOW_SPACE_POSITION:
-      return 0;
-   case PIPE_CAP_VERTEX_BUFFER_OFFSET_4BYTE_ALIGNED_ONLY:
-   case PIPE_CAP_VERTEX_BUFFER_STRIDE_4BYTE_ALIGNED_ONLY:
-   case PIPE_CAP_VERTEX_ELEMENT_SRC_OFFSET_4BYTE_ALIGNED_ONLY:
-   case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
-      return 1;
-   case PIPE_CAP_ENDIANNESS:
-      return PIPE_ENDIAN_LITTLE;
-   default:
-      debug_printf("unknown param %d\n", param);
+   case PIPE_CAP_USER_VERTEX_BUFFERS:
+   case PIPE_CAP_COMPUTE:
       return 0;
    }
+
+   debug_printf("unknown param %d\n", param);
+   return 0;
 }
 
 static float
-- 
1.8.5.5
