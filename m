From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 08/10] nvc0: move video param and format support
	functions to nouveau
Date: Sun, 11 Aug 2013 03:19:16 -0400
Message-ID: <1376205558-23540-9-git-send-email-imirkin@alum.mit.edu>
References: <1376205558-23540-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1376205558-23540-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 37 +++++++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_vp3_video.h | 10 +++++++
 src/gallium/drivers/nvc0/nvc0_context.h         |  5 ----
 src/gallium/drivers/nvc0/nvc0_screen.c          | 18 +++---------
 src/gallium/drivers/nvc0/nvc0_video.c           | 26 -----------------
 5 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index a3387b3..95ba7ec 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -327,3 +327,40 @@ nouveau_vp3_load_firmware(struct nouveau_vp3_decoder *dec,
    dec->fw_bo->map = NULL;
    return 0;
 }
+
+int
+nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
+                                   enum pipe_video_profile profile,
+                                   enum pipe_video_cap param)
+{
+   switch (param) {
+   case PIPE_VIDEO_CAP_SUPPORTED:
+      return profile >= PIPE_VIDEO_PROFILE_MPEG1;
+   case PIPE_VIDEO_CAP_NPOT_TEXTURES:
+      return 1;
+   case PIPE_VIDEO_CAP_MAX_WIDTH:
+   case PIPE_VIDEO_CAP_MAX_HEIGHT:
+      return nouveau_screen(pscreen)->device->chipset < 0xd0 ? 2048 : 4096;
+   case PIPE_VIDEO_CAP_PREFERED_FORMAT:
+      return PIPE_FORMAT_NV12;
+   case PIPE_VIDEO_CAP_SUPPORTS_INTERLACED:
+   case PIPE_VIDEO_CAP_PREFERS_INTERLACED:
+      return true;
+   case PIPE_VIDEO_CAP_SUPPORTS_PROGRESSIVE:
+      return false;
+   default:
+      debug_printf("unknown video param: %d\n", param);
+      return 0;
+   }
+}
+
+boolean
+nouveau_vp3_screen_video_supported(struct pipe_screen *screen,
+                                   enum pipe_format format,
+                                   enum pipe_video_profile profile)
+{
+   if (profile != PIPE_VIDEO_PROFILE_UNKNOWN)
+      return format == PIPE_FORMAT_NV12;
+
+   return vl_video_buffer_is_format_supported(screen, format, profile);
+}
diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.h b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
index 5e40385..f1a1054 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.h
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
@@ -216,3 +216,13 @@ nouveau_vp3_vp_caps(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                     struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                     unsigned *caps, unsigned *is_ref,
                     struct nouveau_vp3_video_buffer *refs[16]);
+
+int
+nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
+                                   enum pipe_video_profile profile,
+                                   enum pipe_video_cap param);
+
+boolean
+nouveau_vp3_screen_video_supported(struct pipe_screen *screen,
+                                   enum pipe_format format,
+                                   enum pipe_video_profile profile);
diff --git a/src/gallium/drivers/nvc0/nvc0_context.h b/src/gallium/drivers/nvc0/nvc0_context.h
index 9e58960..db6bb10 100644
--- a/src/gallium/drivers/nvc0/nvc0_context.h
+++ b/src/gallium/drivers/nvc0/nvc0_context.h
@@ -346,11 +346,6 @@ struct pipe_video_buffer *
 nvc0_video_buffer_create(struct pipe_context *pipe,
                          const struct pipe_video_buffer *templat);
 
-int
-nvc0_screen_get_video_param(struct pipe_screen *pscreen,
-                            enum pipe_video_profile profile,
-                            enum pipe_video_cap param);
-
 /* nvc0_push.c */
 void nvc0_push_vbo(struct nvc0_context *, const struct pipe_draw_info *);
 
diff --git a/src/gallium/drivers/nvc0/nvc0_screen.c b/src/gallium/drivers/nvc0/nvc0_screen.c
index bc5580b..93a2902 100644
--- a/src/gallium/drivers/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nvc0/nvc0_screen.c
@@ -27,6 +27,8 @@
 #include "vl/vl_decoder.h"
 #include "vl/vl_video_buffer.h"
 
+#include "nouveau/nouveau_vp3_video.h"
+
 #include "nvc0_context.h"
 #include "nvc0_screen.h"
 
@@ -63,18 +65,6 @@ nvc0_screen_is_format_supported(struct pipe_screen *pscreen,
    return (nvc0_format_table[format].usage & bindings) == bindings;
 }
 
-static boolean
-nvc0_screen_video_supported(struct pipe_screen *screen,
-                            enum pipe_format format,
-                            enum pipe_video_profile profile)
-{
-   if (profile != PIPE_VIDEO_PROFILE_UNKNOWN)
-      return format == PIPE_FORMAT_NV12;
-
-   return vl_video_buffer_is_format_supported(screen, format, profile);
-}
-
-
 static int
 nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
 {
@@ -593,8 +583,8 @@ nvc0_screen_create(struct nouveau_device *dev)
 
    nvc0_screen_init_resource_functions(pscreen);
 
-   screen->base.base.get_video_param = nvc0_screen_get_video_param;
-   screen->base.base.is_video_format_supported = nvc0_screen_video_supported;
+   screen->base.base.get_video_param = nouveau_vp3_screen_get_video_param;
+   screen->base.base.is_video_format_supported = nouveau_vp3_screen_video_supported;
 
    ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0, 4096, NULL,
                         &screen->fence.bo);
diff --git a/src/gallium/drivers/nvc0/nvc0_video.c b/src/gallium/drivers/nvc0/nvc0_video.c
index e0f29be..5891f09 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.c
+++ b/src/gallium/drivers/nvc0/nvc0_video.c
@@ -25,32 +25,6 @@
 #include "util/u_sampler.h"
 #include "util/u_format.h"
 
-int
-nvc0_screen_get_video_param(struct pipe_screen *pscreen,
-                            enum pipe_video_profile profile,
-                            enum pipe_video_cap param)
-{
-   switch (param) {
-   case PIPE_VIDEO_CAP_SUPPORTED:
-      return profile >= PIPE_VIDEO_PROFILE_MPEG1;
-   case PIPE_VIDEO_CAP_NPOT_TEXTURES:
-      return 1;
-   case PIPE_VIDEO_CAP_MAX_WIDTH:
-   case PIPE_VIDEO_CAP_MAX_HEIGHT:
-      return nouveau_screen(pscreen)->device->chipset < 0xd0 ? 2048 : 4096;
-   case PIPE_VIDEO_CAP_PREFERED_FORMAT:
-      return PIPE_FORMAT_NV12;
-   case PIPE_VIDEO_CAP_SUPPORTS_INTERLACED:
-   case PIPE_VIDEO_CAP_PREFERS_INTERLACED:
-      return true;
-   case PIPE_VIDEO_CAP_SUPPORTS_PROGRESSIVE:
-      return false;
-   default:
-      debug_printf("unknown video param: %d\n", param);
-      return 0;
-   }
-}
-
 static void
 nvc0_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
                               struct pipe_video_buffer *video_target,
-- 
1.8.1.5
