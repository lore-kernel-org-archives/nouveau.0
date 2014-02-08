From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH v2] nouveau/video: make sure that firmware is
	present when checking caps
Date: Sat,  8 Feb 2014 15:22:46 -0500
Message-ID: <1391890966-17564-1-git-send-email-imirkin@alum.mit.edu>
References: <1391576540-1337-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1391576540-1337-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.0 10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Apparently some players are ill-prepared for us claiming that a decoder
exists only to have creating it fail, and express this poor preparation
with crashes (e.g. flash). Check that firmware is there to increase the
chances of there being a high correlation between reported capabilities
and ability to create a decoder.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: 10.0 10.1 <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Tested-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Have to create a new channel on kepler, otherwise it doesn't work... Emil, I'm
keeping your tested-by since you tested the nv84_video bits which haven't
changed.

 src/gallium/drivers/nouveau/nouveau_screen.h    |  5 ++
 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 78 ++++++++++++++++++++++++-
 src/gallium/drivers/nouveau/nv50/nv84_video.c   | 68 ++++++++++++++++++++-
 3 files changed, 147 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index 7f15d10..51e24fa 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -49,6 +49,11 @@ struct nouveau_screen {
 
 	boolean hint_buf_keep_sysmem_copy;
 
+	struct {
+		unsigned profiles_checked;
+		unsigned profiles_present;
+	} firmware_info;
+
 #ifdef NOUVEAU_ENABLE_DRIVER_STATISTICS
    union {
       uint64_t v[29];
diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index ff00b37..11cf729 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -21,6 +21,7 @@
  */
 
 #include <sys/mman.h>
+#include <sys/stat.h>
 #include <stdio.h>
 #include <fcntl.h>
 
@@ -350,6 +351,77 @@ nouveau_vp3_load_firmware(struct nouveau_vp3_decoder *dec,
    return 0;
 }
 
+static int
+firmware_present(struct pipe_screen *pscreen, enum pipe_video_profile profile)
+{
+   struct nouveau_screen *screen = nouveau_screen(pscreen);
+   int chipset = screen->device->chipset;
+   int vp3 = chipset < 0xa3 || chipset == 0xaa || chipset == 0xac;
+   int vp5 = chipset >= 0xd0;
+   int ret;
+
+   /* For all chipsets, try to create a BSP objects. Assume that if firmware
+    * is present for it, firmware is also present for VP/PPP */
+   if (!(screen->firmware_info.profiles_checked & 1)) {
+      struct nouveau_object *channel = NULL, *bsp = NULL;
+      struct nv04_fifo nv04_data = {.vram = 0xbeef0201, .gart = 0xbeef0202};
+      struct nvc0_fifo nvc0_args = {};
+      struct nve0_fifo nve0_args = {.engine = NVE0_FIFO_ENGINE_BSP};
+      void *data = NULL;
+      int size, oclass;
+      if (chipset < 0xc0)
+         oclass = 0x85b1;
+      else if (vp5)
+         oclass = 0x95b1;
+      else
+         oclass = 0x90b1;
+
+      if (chipset < 0xc0) {
+         data = &nv04_data;
+         size = sizeof(nv04_data);
+      } else if (chipset < 0xe0) {
+         data = &nvc0_args;
+         size = sizeof(nvc0_args);
+      } else {
+         data = &nve0_args;
+         size = sizeof(nve0_args);
+      }
+
+      /* kepler must have its own channel, so just do this for everyone */
+      nouveau_object_new(&screen->device->object, 0,
+                         NOUVEAU_FIFO_CHANNEL_CLASS,
+                         data, size, &channel);
+
+      if (channel) {
+         nouveau_object_new(channel, 0, oclass, NULL, 0, &bsp);
+         if (bsp)
+            screen->firmware_info.profiles_present |= 1;
+         nouveau_object_del(&bsp);
+         nouveau_object_del(&channel);
+      }
+      screen->firmware_info.profiles_checked |= 1;
+   }
+
+   if (!(screen->firmware_info.profiles_present & 1))
+      return 0;
+
+   /* For vp3/vp4 chipsets, make sure that the relevant firmware is present */
+   if (!vp5 && !(screen->firmware_info.profiles_checked & (1 << profile))) {
+      char path[PATH_MAX];
+      struct stat s;
+      if (vp3)
+         vp3_getpath(profile, path);
+      else
+         vp4_getpath(profile, path);
+      ret = stat(path, &s);
+      if (!ret && s.st_size > 1000)
+         screen->firmware_info.profiles_present |= (1 << profile);
+      screen->firmware_info.profiles_checked |= (1 << profile);
+   }
+
+   return vp5 || (screen->firmware_info.profiles_present & (1 << profile));
+}
+
 int
 nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
                                    enum pipe_video_profile profile,
@@ -363,8 +435,10 @@ nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
    switch (param) {
    case PIPE_VIDEO_CAP_SUPPORTED:
       /* VP3 does not support MPEG4, VP4+ do. */
-      return profile >= PIPE_VIDEO_PROFILE_MPEG1 && (
-            !vp3 || codec != PIPE_VIDEO_FORMAT_MPEG4);
+      return entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM &&
+         profile >= PIPE_VIDEO_PROFILE_MPEG1 &&
+         (!vp3 || codec != PIPE_VIDEO_FORMAT_MPEG4) &&
+         firmware_present(pscreen, profile);
    case PIPE_VIDEO_CAP_NPOT_TEXTURES:
       return 1;
    case PIPE_VIDEO_CAP_MAX_WIDTH:
diff --git a/src/gallium/drivers/nouveau/nv50/nv84_video.c b/src/gallium/drivers/nouveau/nv50/nv84_video.c
index 3fee6d9..a39f572 100644
--- a/src/gallium/drivers/nouveau/nv50/nv84_video.c
+++ b/src/gallium/drivers/nouveau/nv50/nv84_video.c
@@ -741,16 +741,80 @@ error:
    return NULL;
 }
 
+#define FIRMWARE_BSP_KERN  0x01
+#define FIRMWARE_VP_KERN   0x02
+#define FIRMWARE_BSP_H264  0x04
+#define FIRMWARE_VP_MPEG2  0x08
+#define FIRMWARE_VP_H264_1 0x10
+#define FIRMWARE_VP_H264_2 0x20
+#define FIRMWARE_PRESENT(val, fw) (val & FIRMWARE_ ## fw)
+
+static int
+firmware_present(struct pipe_screen *pscreen, enum pipe_video_format codec)
+{
+   struct nouveau_screen *screen = nouveau_screen(pscreen);
+   struct nouveau_object *obj = NULL;
+   struct stat s;
+   int checked = screen->firmware_info.profiles_checked;
+   int present, ret;
+
+   if (!FIRMWARE_PRESENT(checked, VP_KERN)) {
+      nouveau_object_new(screen->channel, 0, 0x7476, NULL, 0, &obj);
+      if (obj)
+         screen->firmware_info.profiles_present |= FIRMWARE_VP_KERN;
+      nouveau_object_del(&obj);
+      screen->firmware_info.profiles_checked |= FIRMWARE_VP_KERN;
+   }
+
+   if (codec == PIPE_VIDEO_FORMAT_MPEG4_AVC) {
+      if (!FIRMWARE_PRESENT(checked, BSP_KERN)) {
+         nouveau_object_new(screen->channel, 0, 0x74b0, NULL, 0, &obj);
+         if (obj)
+            screen->firmware_info.profiles_present |= FIRMWARE_BSP_KERN;
+         nouveau_object_del(&obj);
+         screen->firmware_info.profiles_checked |= FIRMWARE_BSP_KERN;
+      }
+
+      if (!FIRMWARE_PRESENT(checked, VP_H264_1)) {
+         ret = stat("/lib/firmware/nouveau/nv84_vp-h264-1", &s);
+         if (!ret && s.st_size > 1000)
+            screen->firmware_info.profiles_present |= FIRMWARE_VP_H264_1;
+         screen->firmware_info.profiles_checked |= FIRMWARE_VP_H264_1;
+      }
+
+      /* should probably check the others, but assume that 1 means all */
+
+      present = screen->firmware_info.profiles_present;
+      return FIRMWARE_PRESENT(present, VP_KERN) &&
+         FIRMWARE_PRESENT(present, BSP_KERN) &&
+         FIRMWARE_PRESENT(present, VP_H264_1);
+   } else {
+      if (!FIRMWARE_PRESENT(checked, VP_MPEG2)) {
+         ret = stat("/lib/firmware/nouveau/nv84_vp-mpeg12", &s);
+         if (!ret && s.st_size > 1000)
+            screen->firmware_info.profiles_present |= FIRMWARE_VP_MPEG2;
+         screen->firmware_info.profiles_checked |= FIRMWARE_VP_MPEG2;
+      }
+      present = screen->firmware_info.profiles_present;
+      return FIRMWARE_PRESENT(present, VP_KERN) &&
+         FIRMWARE_PRESENT(present, VP_MPEG2);
+   }
+}
+
 int
 nv84_screen_get_video_param(struct pipe_screen *pscreen,
                             enum pipe_video_profile profile,
                             enum pipe_video_entrypoint entrypoint,
                             enum pipe_video_cap param)
 {
+   enum pipe_video_format codec;
+
    switch (param) {
    case PIPE_VIDEO_CAP_SUPPORTED:
-      return u_reduce_video_profile(profile) == PIPE_VIDEO_FORMAT_MPEG4_AVC ||
-         u_reduce_video_profile(profile) == PIPE_VIDEO_FORMAT_MPEG12;
+      codec = u_reduce_video_profile(profile);
+      return (codec == PIPE_VIDEO_FORMAT_MPEG4_AVC ||
+              codec == PIPE_VIDEO_FORMAT_MPEG12) &&
+         firmware_present(pscreen, codec);
    case PIPE_VIDEO_CAP_NPOT_TEXTURES:
       return 1;
    case PIPE_VIDEO_CAP_MAX_WIDTH:
-- 
1.8.3.2
