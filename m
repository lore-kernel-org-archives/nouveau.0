From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 07/10] nvc0: move firmware loading functions to
	nouveau
Date: Sun, 11 Aug 2013 03:19:15 -0400
Message-ID: <1376205558-23540-8-git-send-email-imirkin@alum.mit.edu>
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
 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 101 ++++++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_vp3_video.h |   5 ++
 src/gallium/drivers/nvc0/nvc0_video.c           |  92 +--------------------
 3 files changed, 108 insertions(+), 90 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index 6abc581..a3387b3 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -20,6 +20,10 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <sys/mman.h>
+#include <stdio.h>
+#include <fcntl.h>
+
 #include "nouveau_screen.h"
 #include "nouveau_context.h"
 #include "nouveau_vp3_video.h"
@@ -226,3 +230,100 @@ nouveau_vp3_decoder_init_common(struct pipe_video_decoder *dec)
    dec->begin_frame = nouveau_vp3_decoder_begin_frame;
    dec->end_frame = nouveau_vp3_decoder_end_frame;
 }
+
+static void vp4_getpath(enum pipe_video_profile profile, char *path)
+{
+   switch (u_reduce_video_profile(profile)) {
+      case PIPE_VIDEO_CODEC_MPEG12: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-mpeg12-0");
+         break;
+      }
+      case PIPE_VIDEO_CODEC_MPEG4: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-mpeg4-0");
+         break;
+      }
+      case PIPE_VIDEO_CODEC_VC1: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-vc1-0");
+         break;
+      }
+      case PIPE_VIDEO_CODEC_MPEG4_AVC: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-h264-0");
+         break;
+      }
+      default: assert(0);
+   }
+}
+
+int
+nouveau_vp3_load_firmware(struct nouveau_vp3_decoder *dec,
+                          enum pipe_video_profile profile,
+                          unsigned chipset)
+{
+   int fd;
+   char path[PATH_MAX];
+   ssize_t r;
+   uint32_t *end, endval;
+
+   vp4_getpath(profile, path);
+
+   if (nouveau_bo_map(dec->fw_bo, NOUVEAU_BO_WR, dec->client))
+      return 1;
+
+   fd = open(path, O_RDONLY | O_CLOEXEC);
+   if (fd < 0) {
+      fprintf(stderr, "opening firmware file %s failed: %m\n", path);
+      return 1;
+   }
+   r = read(fd, dec->fw_bo->map, 0x4000);
+   close(fd);
+
+   if (r < 0) {
+      fprintf(stderr, "reading firmware file %s failed: %m\n", path);
+      return 1;
+   }
+
+   if (r == 0x4000) {
+      fprintf(stderr, "firmware file %s too large!\n", path);
+      return 1;
+   }
+
+   if (r & 0xff) {
+      fprintf(stderr, "firmware file %s wrong size!\n", path);
+      return 1;
+   }
+
+   end = dec->fw_bo->map + r - 4;
+   endval = *end;
+   while (endval == *end)
+      end--;
+
+   r = (intptr_t)end - (intptr_t)dec->fw_bo->map + 4;
+
+   switch (u_reduce_video_profile(profile)) {
+      case PIPE_VIDEO_CODEC_MPEG12: {
+         assert((r & 0xff) == 0xe0);
+         dec->fw_sizes = (0x2e0<<16) | (r - 0x2e0);
+         break;
+      }
+      case PIPE_VIDEO_CODEC_MPEG4: {
+         assert((r & 0xff) == 0xe0);
+         dec->fw_sizes = (0x2e0<<16) | (r - 0x2e0);
+         break;
+      }
+      case PIPE_VIDEO_CODEC_VC1: {
+         assert((r & 0xff) == 0xac);
+         dec->fw_sizes = (0x3ac<<16) | (r - 0x3ac);
+         break;
+      }
+      case PIPE_VIDEO_CODEC_MPEG4_AVC: {
+         assert((r & 0xff) == 0x70);
+         dec->fw_sizes = (0x370<<16) | (r - 0x370);
+         break;
+      }
+      default:
+         return 1;
+   }
+   munmap(dec->fw_bo->map, dec->fw_bo->size);
+   dec->fw_bo->map = NULL;
+   return 0;
+}
diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.h b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
index cb088fe..5e40385 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.h
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
@@ -200,6 +200,11 @@ nouveau_vp3_video_buffer_create(struct pipe_context *pipe,
 void
 nouveau_vp3_decoder_init_common(struct pipe_video_decoder *decoder);
 
+int
+nouveau_vp3_load_firmware(struct nouveau_vp3_decoder *dec,
+                          enum pipe_video_profile profile,
+                          unsigned chipset);
+
 uint32_t
 nouveau_vp3_bsp(struct nouveau_vp3_decoder *dec,  union pipe_desc desc,
                 struct nouveau_vp3_video_buffer *target,
diff --git a/src/gallium/drivers/nvc0/nvc0_video.c b/src/gallium/drivers/nvc0/nvc0_video.c
index 2ba17b4..e0f29be 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.c
+++ b/src/gallium/drivers/nvc0/nvc0_video.c
@@ -25,9 +25,6 @@
 #include "util/u_sampler.h"
 #include "util/u_format.h"
 
-#include <sys/mman.h>
-#include <fcntl.h>
-
 int
 nvc0_screen_get_video_param(struct pipe_screen *pscreen,
                             enum pipe_video_profile profile,
@@ -85,29 +82,6 @@ nvc0_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
    nvc0_decoder_ppp(dec, desc, target, comm_seq);
 }
 
-static void nvc0_video_getpath(enum pipe_video_profile profile, char *path)
-{
-   switch (u_reduce_video_profile(profile)) {
-      case PIPE_VIDEO_CODEC_MPEG12: {
-         sprintf(path, "/lib/firmware/nouveau/vuc-mpeg12-0");
-         break;
-      }
-      case PIPE_VIDEO_CODEC_MPEG4: {
-         sprintf(path, "/lib/firmware/nouveau/vuc-mpeg4-0");
-         break;
-      }
-      case PIPE_VIDEO_CODEC_VC1: {
-         sprintf(path, "/lib/firmware/nouveau/vuc-vc1-0");
-         break;
-      }
-      case PIPE_VIDEO_CODEC_MPEG4_AVC: {
-         sprintf(path, "/lib/firmware/nouveau/vuc-h264-0");
-         break;
-      }
-      default: assert(0);
-   }
-}
-
 struct pipe_video_decoder *
 nvc0_create_decoder(struct pipe_context *context,
                     enum pipe_video_profile profile,
@@ -277,76 +251,14 @@ nvc0_create_decoder(struct pipe_context *context,
    }
 
    if (screen->device->chipset < 0xd0) {
-      int fd;
-      char path[PATH_MAX];
-      ssize_t r;
-      uint32_t *end, endval;
-
       ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM, 0,
                            0x4000, &cfg, &dec->fw_bo);
-      if (!ret)
-         ret = nouveau_bo_map(dec->fw_bo, NOUVEAU_BO_WR, dec->client);
       if (ret)
          goto fail;
 
-      nvc0_video_getpath(profile, path);
-
-      fd = open(path, O_RDONLY | O_CLOEXEC);
-      if (fd < 0) {
-         fprintf(stderr, "opening firmware file %s failed: %m\n", path);
-         goto fw_fail;
-      }
-      r = read(fd, dec->fw_bo->map, 0x4000);
-      close(fd);
-
-      if (r < 0) {
-         fprintf(stderr, "reading firmware file %s failed: %m\n", path);
-         goto fw_fail;
-      }
-
-      if (r == 0x4000) {
-         fprintf(stderr, "firmware file %s too large!\n", path);
-         goto fw_fail;
-      }
-
-      if (r & 0xff) {
-         fprintf(stderr, "firmware file %s wrong size!\n", path);
-         goto fw_fail;
-      }
-
-      end = dec->fw_bo->map + r - 4;
-      endval = *end;
-      while (endval == *end)
-         end--;
-
-      r = (intptr_t)end - (intptr_t)dec->fw_bo->map + 4;
-
-      switch (u_reduce_video_profile(profile)) {
-      case PIPE_VIDEO_CODEC_MPEG12: {
-         assert((r & 0xff) == 0xe0);
-         dec->fw_sizes = (0x2e0<<16) | (r - 0x2e0);
-         break;
-      }
-      case PIPE_VIDEO_CODEC_MPEG4: {
-         assert((r & 0xff) == 0xe0);
-         dec->fw_sizes = (0x2e0<<16) | (r - 0x2e0);
-         break;
-      }
-      case PIPE_VIDEO_CODEC_VC1: {
-         assert((r & 0xff) == 0xac);
-         dec->fw_sizes = (0x3ac<<16) | (r - 0x3ac);
-         break;
-      }
-      case PIPE_VIDEO_CODEC_MPEG4_AVC: {
-         assert((r & 0xff) == 0x70);
-         dec->fw_sizes = (0x370<<16) | (r - 0x370);
-         break;
-      }
-      default:
+      ret = nouveau_vp3_load_firmware(dec, profile, screen->device->chipset);
+      if (ret)
          goto fw_fail;
-      }
-      munmap(dec->fw_bo->map, dec->fw_bo->size);
-      dec->fw_bo->map = NULL;
    }
 
    if (codec != 3) {
-- 
1.8.1.5
