From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 10/10] nv50: add vp3/vp4 support for mpeg2/vc1
Date: Sun, 11 Aug 2013 03:19:18 -0400
Message-ID: <1376205558-23540-11-git-send-email-imirkin@alum.mit.edu>
References: <1376205558-23540-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1376205558-23540-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

h264/mpeg4 remain disabled for pre-nvc0, there's some minor
bug/difference which causes the decoding to hang after some frames.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nouveau_vp3_video.c |  39 ++-
 src/gallium/drivers/nv50/Makefile.sources       |   6 +-
 src/gallium/drivers/nv50/nv50_context.c         |   5 +-
 src/gallium/drivers/nv50/nv50_context.h         |  14 ++
 src/gallium/drivers/nv50/nv50_screen.c          |   7 +-
 src/gallium/drivers/nv50/nv50_winsys.h          |   4 -
 src/gallium/drivers/nv50/nv84_video.h           |   4 +
 src/gallium/drivers/nv50/nv98_video.c           | 308 ++++++++++++++++++++++++
 src/gallium/drivers/nv50/nv98_video.h           |  48 ++++
 src/gallium/drivers/nv50/nv98_video_bsp.c       | 159 ++++++++++++
 src/gallium/drivers/nv50/nv98_video_ppp.c       | 143 +++++++++++
 src/gallium/drivers/nv50/nv98_video_vp.c        | 202 ++++++++++++++++
 12 files changed, 927 insertions(+), 12 deletions(-)
 create mode 100644 src/gallium/drivers/nv50/nv98_video.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video.h
 create mode 100644 src/gallium/drivers/nv50/nv98_video_bsp.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video_ppp.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video_vp.c

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index 95ba7ec..5926ff2 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -231,6 +231,25 @@ nouveau_vp3_decoder_init_common(struct pipe_video_decoder *dec)
    dec->end_frame = nouveau_vp3_decoder_end_frame;
 }
 
+static void vp3_getpath(enum pipe_video_profile profile, char *path)
+{
+   switch (u_reduce_video_profile(profile)) {
+      case PIPE_VIDEO_CODEC_MPEG12: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-vp3-mpeg12-0");
+         break;
+      }
+      case PIPE_VIDEO_CODEC_VC1: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-vp3-vc1-0");
+         break;
+      }
+      case PIPE_VIDEO_CODEC_MPEG4_AVC: {
+         sprintf(path, "/lib/firmware/nouveau/vuc-vp3-h264-0");
+         break;
+      }
+      default: assert(0);
+   }
+}
+
 static void vp4_getpath(enum pipe_video_profile profile, char *path)
 {
    switch (u_reduce_video_profile(profile)) {
@@ -264,7 +283,10 @@ nouveau_vp3_load_firmware(struct nouveau_vp3_decoder *dec,
    ssize_t r;
    uint32_t *end, endval;
 
-   vp4_getpath(profile, path);
+   if (chipset >= 0xa3 && chipset != 0xaa && chipset != 0xac)
+      vp4_getpath(profile, path);
+   else
+      vp3_getpath(profile, path);
 
    if (nouveau_bo_map(dec->fw_bo, NOUVEAU_BO_WR, dec->client))
       return 1;
@@ -333,14 +355,25 @@ nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
                                    enum pipe_video_profile profile,
                                    enum pipe_video_cap param)
 {
+   int chipset = nouveau_screen(pscreen)->device->chipset;
+   int vp3 = chipset < 0xa3 || chipset == 0xaa || chipset == 0xac;
+   int vp5 = chipset >= 0xd0;
+   enum pipe_video_codec codec = u_reduce_video_profile(profile);
    switch (param) {
    case PIPE_VIDEO_CAP_SUPPORTED:
-      return profile >= PIPE_VIDEO_PROFILE_MPEG1;
+      /* For now, h264 and mpeg4 don't work on pre-nvc0. */
+      if (chipset < 0xc0)
+         return codec == PIPE_VIDEO_CODEC_MPEG12 ||
+            codec == PIPE_VIDEO_CODEC_VC1;
+      /* In the general case, this should work, once the pre-nvc0 problems are
+       * resolved. */
+      return profile >= PIPE_VIDEO_PROFILE_MPEG1 && (
+            !vp3 || codec != PIPE_VIDEO_CODEC_MPEG4);
    case PIPE_VIDEO_CAP_NPOT_TEXTURES:
       return 1;
    case PIPE_VIDEO_CAP_MAX_WIDTH:
    case PIPE_VIDEO_CAP_MAX_HEIGHT:
-      return nouveau_screen(pscreen)->device->chipset < 0xd0 ? 2048 : 4096;
+      return vp5 ? 4096 : 2048;
    case PIPE_VIDEO_CAP_PREFERED_FORMAT:
       return PIPE_FORMAT_NV12;
    case PIPE_VIDEO_CAP_SUPPORTS_INTERLACED:
diff --git a/src/gallium/drivers/nv50/Makefile.sources b/src/gallium/drivers/nv50/Makefile.sources
index 0fdac51..9a2d102 100644
--- a/src/gallium/drivers/nv50/Makefile.sources
+++ b/src/gallium/drivers/nv50/Makefile.sources
@@ -16,7 +16,11 @@ C_SOURCES := \
 	nv50_query.c \
 	nv84_video.c \
 	nv84_video_bsp.c \
-	nv84_video_vp.c
+	nv84_video_vp.c \
+	nv98_video.c \
+	nv98_video_bsp.c \
+	nv98_video_vp.c \
+	nv98_video_ppp.c
 
 CODEGEN_NV50_SOURCES := \
 	codegen/nv50_ir.cpp \
diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index 79a0473..6fdbb0b 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -267,8 +267,9 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
       pipe->create_video_decoder = nv84_create_decoder;
       pipe->create_video_buffer = nv84_video_buffer_create;
    } else {
-      /* Unsupported, but need to init pointers. */
-      nouveau_context_init_vdec(&nv50->base);
+      /* VP3/4 */
+      pipe->create_video_decoder = nv98_create_decoder;
+      pipe->create_video_buffer = nv98_video_buffer_create;
    }
 
    flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_RD;
diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index b204cc8..52a1aa5 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -313,4 +313,18 @@ nv84_screen_video_supported(struct pipe_screen *screen,
                             enum pipe_format format,
                             enum pipe_video_profile profile);
 
+/* nv98_video.c */
+struct pipe_video_decoder *
+nv98_create_decoder(struct pipe_context *context,
+                    enum pipe_video_profile profile,
+                    enum pipe_video_entrypoint entrypoint,
+                    enum pipe_video_chroma_format chroma_format,
+                    unsigned width, unsigned height,
+                    unsigned max_references,
+                    bool expect_chunked_decode);
+
+struct pipe_video_buffer *
+nv98_video_buffer_create(struct pipe_context *pipe,
+                         const struct pipe_video_buffer *template);
+
 #endif
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 2951eb4..5f57d96 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -27,6 +27,8 @@
 #include "nv50_context.h"
 #include "nv50_screen.h"
 
+#include "nouveau/nouveau_vp3_video.h"
+
 #include "nouveau/nv_object.xml.h"
 #include <errno.h>
 
@@ -656,8 +658,9 @@ nv50_screen_create(struct nouveau_device *dev)
       screen->base.base.get_video_param = nv84_screen_get_video_param;
       screen->base.base.is_video_format_supported = nv84_screen_video_supported;
    } else {
-      /* Unsupported, but need to init pointers. */
-      nouveau_screen_init_vdec(&screen->base);
+      /* VP3/4 */
+      screen->base.base.get_video_param = nouveau_vp3_screen_get_video_param;
+      screen->base.base.is_video_format_supported = nouveau_vp3_screen_video_supported;
    }
 
    ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0, 4096,
diff --git a/src/gallium/drivers/nv50/nv50_winsys.h b/src/gallium/drivers/nv50/nv50_winsys.h
index e04247b..145ee70 100644
--- a/src/gallium/drivers/nv50/nv50_winsys.h
+++ b/src/gallium/drivers/nv50/nv50_winsys.h
@@ -60,10 +60,6 @@ PUSH_REFN(struct nouveau_pushbuf *push, struct nouveau_bo *bo, uint32_t flags)
 #define SUBC_COMPUTE(m) 6, (m)
 #define NV50_COMPUTE(n) SUBC_COMPUTE(NV50_COMPUTE_##n)
 
-/* These are expected to be on their own pushbufs */
-#define SUBC_BSP(m) 2, (m)
-#define SUBC_VP(m) 2, (m)
-
 
 static INLINE uint32_t
 NV50_FIFO_PKHDR(int subc, int mthd, unsigned size)
diff --git a/src/gallium/drivers/nv50/nv84_video.h b/src/gallium/drivers/nv50/nv84_video.h
index 4ff8cf3..4240cef 100644
--- a/src/gallium/drivers/nv50/nv84_video.h
+++ b/src/gallium/drivers/nv50/nv84_video.h
@@ -33,6 +33,10 @@
 
 #include "nv50_context.h"
 
+/* These are expected to be on their own pushbufs */
+#define SUBC_BSP(m) 2, (m)
+#define SUBC_VP(m) 2, (m)
+
 union pipe_desc {
    struct pipe_picture_desc *base;
    struct pipe_mpeg12_picture_desc *mpeg12;
diff --git a/src/gallium/drivers/nv50/nv98_video.c b/src/gallium/drivers/nv50/nv98_video.c
new file mode 100644
index 0000000..eb23804
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv98_video.c
@@ -0,0 +1,308 @@
+/*
+ * Copyright 2011-2013 Maarten Lankhorst
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "nv98_video.h"
+
+#include "util/u_sampler.h"
+#include "util/u_format.h"
+
+static void
+nv98_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
+                              struct pipe_video_buffer *video_target,
+                              struct pipe_picture_desc *picture,
+                              unsigned num_buffers,
+                              const void *const *data,
+                              const unsigned *num_bytes)
+{
+   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
+   struct nouveau_vp3_video_buffer *target = (struct nouveau_vp3_video_buffer *)video_target;
+   uint32_t comm_seq = ++dec->fence_seq;
+   union pipe_desc desc;
+
+   unsigned vp_caps, is_ref, ret;
+   struct nouveau_vp3_video_buffer *refs[16] = {};
+
+   desc.base = picture;
+
+   assert(target->base.buffer_format == PIPE_FORMAT_NV12);
+
+   ret = nv98_decoder_bsp(dec, desc, target, comm_seq,
+                          num_buffers, data, num_bytes,
+                          &vp_caps, &is_ref, refs);
+
+   /* did we decode bitstream correctly? */
+   assert(ret == 2);
+
+   nv98_decoder_vp(dec, desc, target, comm_seq, vp_caps, is_ref, refs);
+   nv98_decoder_ppp(dec, desc, target, comm_seq);
+}
+
+struct pipe_video_decoder *
+nv98_create_decoder(struct pipe_context *context,
+                    enum pipe_video_profile profile,
+                    enum pipe_video_entrypoint entrypoint,
+                    enum pipe_video_chroma_format chroma_format,
+                    unsigned width, unsigned height, unsigned max_references,
+                    bool chunked_decode)
+{
+   struct nouveau_screen *screen = &((struct nv50_context *)context)->screen->base;
+   struct nouveau_vp3_decoder *dec;
+   struct nouveau_pushbuf **push;
+   struct nv04_fifo nv04_data = {.vram = 0xbeef0201, .gart = 0xbeef0202};
+   union nouveau_bo_config cfg;
+
+   cfg.nv50.tile_mode = 0x20;
+   cfg.nv50.memtype = 0x70;
+
+   int ret, i;
+   uint32_t codec = 1, ppp_codec = 3;
+   uint32_t timeout;
+   u32 tmp_size = 0;
+
+   if (getenv("XVMC_VL"))
+       return vl_create_decoder(context, profile, entrypoint,
+                                chroma_format, width, height,
+                                max_references, chunked_decode);
+
+   if (entrypoint != PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
+      debug_printf("%x\n", entrypoint);
+      return NULL;
+   }
+
+   dec = CALLOC_STRUCT(nouveau_vp3_decoder);
+   if (!dec)
+      return NULL;
+   dec->client = screen->client;
+   nouveau_vp3_decoder_init_common(&dec->base);
+
+   dec->bsp_idx = 5;
+   dec->vp_idx = 6;
+   dec->ppp_idx = 7;
+
+   ret = nouveau_object_new(&screen->device->object, 0,
+                            NOUVEAU_FIFO_CHANNEL_CLASS,
+                            &nv04_data, sizeof(nv04_data), &dec->channel[0]);
+
+   if (!ret)
+      ret = nouveau_pushbuf_new(screen->client, dec->channel[0], 4,
+                                32 * 1024, true, &dec->pushbuf[0]);
+
+   for (i = 1; i < 3; ++i) {
+      dec->channel[i] = dec->channel[0];
+      dec->pushbuf[i] = dec->pushbuf[0];
+   }
+   push = dec->pushbuf;
+
+   if (!ret)
+      ret = nouveau_object_new(dec->channel[0], 0x390b1, 0x85b1, NULL, 0, &dec->bsp);
+   if (!ret)
+      ret = nouveau_object_new(dec->channel[1], 0x190b2, 0x85b2, NULL, 0, &dec->vp);
+   if (!ret)
+      ret = nouveau_object_new(dec->channel[2], 0x290b3, 0x85b3, NULL, 0, &dec->ppp);
+   if (ret)
+      goto fail;
+
+   BEGIN_NV04(push[0], SUBC_BSP(NV01_SUBCHAN_OBJECT), 1);
+   PUSH_DATA (push[0], dec->bsp->handle);
+
+   BEGIN_NV04(push[0], SUBC_BSP(0x180), 5);
+   for (i = 0; i < 5; i++)
+      PUSH_DATA (push[0], nv04_data.vram);
+
+   BEGIN_NV04(push[1], SUBC_VP(NV01_SUBCHAN_OBJECT), 1);
+   PUSH_DATA (push[1], dec->vp->handle);
+
+   BEGIN_NV04(push[1], SUBC_VP(0x180), 6);
+   for (i = 0; i < 6; i++)
+      PUSH_DATA (push[1], nv04_data.vram);
+
+   BEGIN_NV04(push[2], SUBC_PPP(NV01_SUBCHAN_OBJECT), 1);
+   PUSH_DATA (push[2], dec->ppp->handle);
+
+   BEGIN_NV04(push[2], SUBC_PPP(0x180), 5);
+   for (i = 0; i < 5; i++)
+      PUSH_DATA (push[2], nv04_data.vram);
+
+   dec->base.context = context;
+   dec->base.profile = profile;
+   dec->base.entrypoint = entrypoint;
+   dec->base.chroma_format = chroma_format;
+   dec->base.width = width;
+   dec->base.height = height;
+   dec->base.max_references = max_references;
+   dec->base.decode_bitstream = nv98_decoder_decode_bitstream;
+
+   for (i = 0; i < NOUVEAU_VP3_VIDEO_QDEPTH && !ret; ++i)
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM,
+                           0, 1 << 20, NULL, &dec->bsp_bo[i]);
+   if (!ret)
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM,
+                           0x100, 4 << 20, NULL, &dec->inter_bo[0]);
+   if (!ret)
+      nouveau_bo_ref(dec->inter_bo[0], &dec->inter_bo[1]);
+   if (ret)
+      goto fail;
+
+   switch (u_reduce_video_profile(profile)) {
+   case PIPE_VIDEO_CODEC_MPEG12: {
+      codec = 1;
+      assert(max_references <= 2);
+      break;
+   }
+   case PIPE_VIDEO_CODEC_MPEG4: {
+      codec = 4;
+      tmp_size = mb(height)*16 * mb(width)*16;
+      assert(max_references <= 2);
+      break;
+   }
+   case PIPE_VIDEO_CODEC_VC1: {
+      ppp_codec = codec = 2;
+      tmp_size = mb(height)*16 * mb(width)*16;
+      assert(max_references <= 2);
+      break;
+   }
+   case PIPE_VIDEO_CODEC_MPEG4_AVC: {
+      codec = 3;
+      dec->tmp_stride = 16 * mb_half(width) * nouveau_vp3_video_align(height) * 3 / 2;
+      tmp_size = dec->tmp_stride * (max_references + 1);
+      assert(max_references <= 16);
+      break;
+   }
+   default:
+      fprintf(stderr, "invalid codec\n");
+      goto fail;
+   }
+
+   ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM, 0,
+                           0x4000, NULL, &dec->fw_bo);
+   if (ret)
+      goto fail;
+
+   ret = nouveau_vp3_load_firmware(dec, profile, screen->device->chipset);
+   if (ret)
+      goto fw_fail;
+
+   if (codec != 3) {
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM, 0,
+                           0x400, NULL, &dec->bitplane_bo);
+      if (ret)
+         goto fail;
+   }
+
+   dec->ref_stride = mb(width)*16 * (mb_half(height)*32 + nouveau_vp3_video_align(height)/2);
+   ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM, 0,
+                        dec->ref_stride * (max_references+2) + tmp_size,
+                        &cfg, &dec->ref_bo);
+   if (ret)
+      goto fail;
+
+   timeout = 0;
+
+   BEGIN_NV04(push[0], SUBC_BSP(0x200), 2);
+   PUSH_DATA (push[0], codec);
+   PUSH_DATA (push[0], timeout);
+
+   BEGIN_NV04(push[1], SUBC_VP(0x200), 2);
+   PUSH_DATA (push[1], codec);
+   PUSH_DATA (push[1], timeout);
+
+   BEGIN_NV04(push[2], SUBC_PPP(0x200), 2);
+   PUSH_DATA (push[2], ppp_codec);
+   PUSH_DATA (push[2], timeout);
+
+   ++dec->fence_seq;
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   ret = nouveau_bo_new(screen->device, NOUVEAU_BO_GART|NOUVEAU_BO_MAP,
+                        0, 0x1000, NULL, &dec->fence_bo);
+   if (ret)
+      goto fail;
+
+   nouveau_bo_map(dec->fence_bo, NOUVEAU_BO_RDWR, screen->client);
+   dec->fence_map = dec->fence_bo->map;
+   dec->fence_map[0] = dec->fence_map[4] = dec->fence_map[8] = 0;
+   dec->comm = (struct comm *)(dec->fence_map + (COMM_OFFSET/sizeof(*dec->fence_map)));
+
+   /* So lets test if the fence is working? */
+   nouveau_pushbuf_space(push[0], 6, 1, 0);
+   PUSH_REFN (push[0], dec->fence_bo, NOUVEAU_BO_GART|NOUVEAU_BO_RDWR);
+   BEGIN_NV04(push[0], SUBC_BSP(0x240), 3);
+   PUSH_DATAh(push[0], dec->fence_bo->offset);
+   PUSH_DATA (push[0], dec->fence_bo->offset);
+   PUSH_DATA (push[0], dec->fence_seq);
+
+   BEGIN_NV04(push[0], SUBC_BSP(0x304), 1);
+   PUSH_DATA (push[0], 0);
+   PUSH_KICK (push[0]);
+
+   nouveau_pushbuf_space(push[1], 6, 1, 0);
+   PUSH_REFN (push[1], dec->fence_bo, NOUVEAU_BO_GART|NOUVEAU_BO_RDWR);
+   BEGIN_NV04(push[1], SUBC_VP(0x240), 3);
+   PUSH_DATAh(push[1], (dec->fence_bo->offset + 0x10));
+   PUSH_DATA (push[1], (dec->fence_bo->offset + 0x10));
+   PUSH_DATA (push[1], dec->fence_seq);
+
+   BEGIN_NV04(push[1], SUBC_VP(0x304), 1);
+   PUSH_DATA (push[1], 0);
+   PUSH_KICK (push[1]);
+
+   nouveau_pushbuf_space(push[2], 6, 1, 0);
+   PUSH_REFN (push[2], dec->fence_bo, NOUVEAU_BO_GART|NOUVEAU_BO_RDWR);
+   BEGIN_NV04(push[2], SUBC_PPP(0x240), 3);
+   PUSH_DATAh(push[2], (dec->fence_bo->offset + 0x20));
+   PUSH_DATA (push[2], (dec->fence_bo->offset + 0x20));
+   PUSH_DATA (push[2], dec->fence_seq);
+
+   BEGIN_NV04(push[2], SUBC_PPP(0x304), 1);
+   PUSH_DATA (push[2], 0);
+   PUSH_KICK (push[2]);
+
+   usleep(100);
+   while (dec->fence_seq > dec->fence_map[0] ||
+          dec->fence_seq > dec->fence_map[4] ||
+          dec->fence_seq > dec->fence_map[8]) {
+      debug_printf("%u: %u %u %u\n", dec->fence_seq, dec->fence_map[0], dec->fence_map[4], dec->fence_map[8]);
+      usleep(100);
+   }
+   debug_printf("%u: %u %u %u\n", dec->fence_seq, dec->fence_map[0], dec->fence_map[4], dec->fence_map[8]);
+#endif
+
+   return &dec->base;
+
+fw_fail:
+   debug_printf("Cannot create decoder without firmware..\n");
+   dec->base.destroy(&dec->base);
+   return NULL;
+
+fail:
+   debug_printf("Creation failed: %s (%i)\n", strerror(-ret), ret);
+   dec->base.destroy(&dec->base);
+   return NULL;
+}
+
+struct pipe_video_buffer *
+nv98_video_buffer_create(struct pipe_context *pipe,
+                         const struct pipe_video_buffer *templat)
+{
+   return nouveau_vp3_video_buffer_create(
+         pipe, templat, NV50_RESOURCE_FLAG_VIDEO);
+}
diff --git a/src/gallium/drivers/nv50/nv98_video.h b/src/gallium/drivers/nv50/nv98_video.h
new file mode 100644
index 0000000..a157201
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv98_video.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2011-2013 Maarten Lankhorst
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "nv50_context.h"
+#include "nv50_screen.h"
+#include "nouveau/nouveau_vp3_video.h"
+
+#include "vl/vl_decoder.h"
+#include "vl/vl_types.h"
+
+#include "util/u_video.h"
+
+extern unsigned
+nv98_decoder_bsp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
+                 struct nouveau_vp3_video_buffer *target,
+                 unsigned comm_seq, unsigned num_buffers,
+                 const void *const *data, const unsigned *num_bytes,
+                 unsigned *vp_caps, unsigned *is_ref,
+                 struct nouveau_vp3_video_buffer *refs[16]);
+
+extern void
+nv98_decoder_vp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
+                struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
+                unsigned caps, unsigned is_ref,
+                struct nouveau_vp3_video_buffer *refs[16]);
+
+extern void
+nv98_decoder_ppp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
+                 struct nouveau_vp3_video_buffer *target, unsigned comm_seq);
diff --git a/src/gallium/drivers/nv50/nv98_video_bsp.c b/src/gallium/drivers/nv50/nv98_video_bsp.c
new file mode 100644
index 0000000..440066d
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv98_video_bsp.c
@@ -0,0 +1,159 @@
+/*
+ * Copyright 2011-2013 Maarten Lankhorst
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "nv98_video.h"
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+static void dump_comm_bsp(struct comm *comm)
+{
+   unsigned idx = comm->bsp_cur_index & 0xf;
+   debug_printf("Cur seq: %x, bsp byte ofs: %x\n", comm->bsp_cur_index, comm->byte_ofs);
+   debug_printf("Status: %08x, pos: %08x\n", comm->status[idx], comm->pos[idx]);
+}
+#endif
+
+unsigned
+nv98_decoder_bsp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
+                 struct nouveau_vp3_video_buffer *target,
+                 unsigned comm_seq, unsigned num_buffers,
+                 const void *const *data, const unsigned *num_bytes,
+                 unsigned *vp_caps, unsigned *is_ref,
+                 struct nouveau_vp3_video_buffer *refs[16])
+{
+   struct nouveau_pushbuf *push = dec->pushbuf[0];
+   enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
+   uint32_t bsp_addr, comm_addr, inter_addr;
+   uint32_t slice_size, bucket_size, ring_size;
+   uint32_t caps;
+   int ret;
+   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NOUVEAU_VP3_VIDEO_QDEPTH];
+   struct nouveau_bo *inter_bo = dec->inter_bo[comm_seq & 1];
+   unsigned fence_extra = 0;
+   struct nouveau_pushbuf_refn bo_refs[] = {
+      { bsp_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
+      { inter_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
+#if NOUVEAU_VP3_DEBUG_FENCE
+      { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
+#endif
+      { dec->bitplane_bo, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+   };
+   int num_refs = sizeof(bo_refs)/sizeof(*bo_refs);
+
+   if (!dec->bitplane_bo)
+      num_refs--;
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   fence_extra = 4;
+#endif
+
+   ret = nouveau_bo_map(bsp_bo, NOUVEAU_BO_WR, dec->client);
+   if (ret) {
+      debug_printf("map failed: %i %s\n", ret, strerror(-ret));
+      return -1;
+   }
+
+   caps = nouveau_vp3_bsp(dec, desc, target, comm_seq,
+                          num_buffers, data, num_bytes);
+
+   nouveau_vp3_vp_caps(dec, desc, target, comm_seq, vp_caps, is_ref, refs);
+
+   nouveau_pushbuf_space(push, 6 + (codec == PIPE_VIDEO_CODEC_MPEG4_AVC ? 9 : 8) + fence_extra + 2, num_refs, 0);
+   nouveau_pushbuf_refn(push, bo_refs, num_refs);
+
+   bsp_addr = bsp_bo->offset >> 8;
+   inter_addr = inter_bo->offset >> 8;
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   memset(dec->comm, 0, 0x200);
+   comm_addr = (dec->fence_bo->offset + COMM_OFFSET) >> 8;
+#else
+   comm_addr = bsp_addr + (COMM_OFFSET>>8);
+#endif
+
+   BEGIN_NV04(push, SUBC_BSP(0x700), 5);
+   PUSH_DATA (push, caps); // 700 cmd
+   PUSH_DATA (push, bsp_addr + 1); // 704 strparm_bsp
+   PUSH_DATA (push, bsp_addr + 7); // 708 str addr
+   PUSH_DATA (push, comm_addr); // 70c comm
+   PUSH_DATA (push, comm_seq); // 710 seq
+
+   if (codec != PIPE_VIDEO_CODEC_MPEG4_AVC) {
+      u32 bitplane_addr;
+      int mpeg12 = (codec == PIPE_VIDEO_CODEC_MPEG12);
+
+      bitplane_addr = dec->bitplane_bo->offset >> 8;
+
+      nouveau_vp3_inter_sizes(dec, 1, &slice_size, &bucket_size, &ring_size);
+      BEGIN_NV04(push, SUBC_BSP(0x400), mpeg12 ? 5 : 7);
+      PUSH_DATA (push, bsp_addr); // 400 picparm addr
+      PUSH_DATA (push, inter_addr); // 404 interparm addr
+      PUSH_DATA (push, inter_addr + slice_size + bucket_size); // 408 interdata addr
+      PUSH_DATA (push, ring_size << 8); // 40c interdata_size
+      if (!mpeg12) {
+         PUSH_DATA (push, bitplane_addr); // 410 BITPLANE_DATA
+         PUSH_DATA (push, 0x400); // 414 BITPLANE_DATA_SIZE
+      }
+      PUSH_DATA (push, 0); // dma idx
+   } else {
+      nouveau_vp3_inter_sizes(dec, desc.h264->slice_count, &slice_size, &bucket_size, &ring_size);
+      BEGIN_NV04(push, SUBC_BSP(0x400), 8);
+      PUSH_DATA (push, bsp_addr); // 400 picparm addr
+      PUSH_DATA (push, inter_addr); // 404 interparm addr
+      PUSH_DATA (push, slice_size << 8); // 408 interparm size?
+      PUSH_DATA (push, inter_addr + slice_size + bucket_size); // 40c interdata addr
+      PUSH_DATA (push, ring_size << 8); // 410 interdata size
+      PUSH_DATA (push, inter_addr + slice_size); // 414 bucket?
+      PUSH_DATA (push, bucket_size << 8); // 418 bucket size? unshifted..
+      PUSH_DATA (push, 0); // 41c targets
+      // TODO: Double check 414 / 418 with nvidia trace
+   }
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   BEGIN_NV04(push, SUBC_BSP(0x240), 3);
+   PUSH_DATAh(push, dec->fence_bo->offset);
+   PUSH_DATA (push, dec->fence_bo->offset);
+   PUSH_DATA (push, dec->fence_seq);
+
+   BEGIN_NV04(push, SUBC_BSP(0x300), 1);
+   PUSH_DATA (push, 1);
+   PUSH_KICK (push);
+
+   {
+      unsigned spin = 0;
+      do {
+         usleep(100);
+         if ((spin++ & 0xff) == 0xff) {
+            debug_printf("b%u: %u\n", dec->fence_seq, dec->fence_map[0]);
+            dump_comm_bsp(dec->comm);
+         }
+      } while (dec->fence_seq > dec->fence_map[0]);
+   }
+
+   dump_comm_bsp(dec->comm);
+   return dec->comm->status[comm_seq & 0xf];
+#else
+   BEGIN_NV04(push, SUBC_BSP(0x300), 1);
+   PUSH_DATA (push, 0);
+   PUSH_KICK (push);
+   return 2;
+#endif
+}
diff --git a/src/gallium/drivers/nv50/nv98_video_ppp.c b/src/gallium/drivers/nv50/nv98_video_ppp.c
new file mode 100644
index 0000000..4c4b8af
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv98_video_ppp.c
@@ -0,0 +1,143 @@
+/*
+ * Copyright 2011-2013 Maarten Lankhorst
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "nv98_video.h"
+
+static void
+nv98_decoder_setup_ppp(struct nouveau_vp3_decoder *dec, struct nouveau_vp3_video_buffer *target, uint32_t low700) {
+   struct nouveau_pushbuf *push = dec->pushbuf[2];
+
+   uint32_t stride_in = mb(dec->base.width);
+   uint32_t stride_out = mb(target->resources[0]->width0);
+   uint32_t dec_h = mb(dec->base.height);
+   uint32_t dec_w = mb(dec->base.width);
+   uint64_t in_addr;
+   uint32_t y2, cbcr, cbcr2, i;
+   struct nouveau_pushbuf_refn bo_refs[] = {
+      { NULL, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
+      { NULL, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
+      { dec->ref_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
+#if NOUVEAU_VP3_DEBUG_FENCE
+      { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
+#endif
+   };
+   unsigned num_refs = sizeof(bo_refs)/sizeof(*bo_refs);
+
+   for (i = 0; i < 2; ++i) {
+      struct nv50_miptree *mt = (struct nv50_miptree *)target->resources[i];
+      bo_refs[i].bo = mt->base.bo;
+   }
+
+   nouveau_pushbuf_refn(push, bo_refs, num_refs);
+   nouveau_vp3_ycbcr_offsets(dec, &y2, &cbcr, &cbcr2);
+
+   BEGIN_NV04(push, SUBC_PPP(0x700), 10);
+   in_addr = nouveau_vp3_video_addr(dec, target) >> 8;
+
+   PUSH_DATA (push, (stride_out << 24) | (stride_out << 16) | low700); // 700
+   PUSH_DATA (push, (stride_in << 24) | (stride_in << 16) | (dec_h << 8) | dec_w); // 704
+   assert(dec_w == stride_in);
+
+   /* Input: */
+   PUSH_DATA (push, in_addr); // 708
+   PUSH_DATA (push, in_addr + y2); // 70c
+   PUSH_DATA (push, in_addr + cbcr); // 710
+   PUSH_DATA (push, in_addr + cbcr2); // 714
+
+   for (i = 0; i < 2; ++i) {
+      struct nv50_miptree *mt = (struct nv50_miptree *)target->resources[i];
+
+      PUSH_DATA (push, mt->base.address >> 8);
+      PUSH_DATA (push, (mt->base.address + mt->total_size/2) >> 8);
+      mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
+   }
+}
+
+static uint32_t
+nv98_decoder_vc1_ppp(struct nouveau_vp3_decoder *dec, struct pipe_vc1_picture_desc *desc, struct nouveau_vp3_video_buffer *target) {
+   struct nouveau_pushbuf *push = dec->pushbuf[2];
+
+   nv98_decoder_setup_ppp(dec, target, 0x1412);
+   assert(!desc->deblockEnable);
+   assert(!(dec->base.width & 0xf));
+   assert(!(dec->base.height & 0xf));
+
+   BEGIN_NV04(push, SUBC_PPP(0x400), 1);
+   PUSH_DATA (push, desc->pquant << 11);
+
+   // 728 = wtf?
+   return 0x10;
+}
+
+void
+nv98_decoder_ppp(struct nouveau_vp3_decoder *dec, union pipe_desc desc, struct nouveau_vp3_video_buffer *target, unsigned comm_seq) {
+   enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
+   struct nouveau_pushbuf *push = dec->pushbuf[2];
+   unsigned ppp_caps = 0x10;
+   unsigned fence_extra = 0;
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   fence_extra = 4;
+#endif
+
+   nouveau_pushbuf_space(push, 11 + (codec == PIPE_VIDEO_CODEC_VC1 ? 2 : 0) + 3 + fence_extra + 2, 4, 0);
+
+   switch (codec) {
+   case PIPE_VIDEO_CODEC_MPEG12: {
+      unsigned mpeg2 = dec->base.profile != PIPE_VIDEO_PROFILE_MPEG1;
+      nv98_decoder_setup_ppp(dec, target, 0x1410 | mpeg2);
+      break;
+   }
+   case PIPE_VIDEO_CODEC_MPEG4: nv98_decoder_setup_ppp(dec, target, 0x1414); break;
+   case PIPE_VIDEO_CODEC_VC1: ppp_caps = nv98_decoder_vc1_ppp(dec, desc.vc1, target); break;
+   case PIPE_VIDEO_CODEC_MPEG4_AVC: nv98_decoder_setup_ppp(dec, target, 0x1413); break;
+   default: assert(0);
+   }
+   BEGIN_NV04(push, SUBC_PPP(0x734), 2);
+   PUSH_DATA (push, comm_seq);
+   PUSH_DATA (push, ppp_caps);
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   BEGIN_NV04(push, SUBC_PPP(0x240), 3);
+   PUSH_DATAh(push, (dec->fence_bo->offset + 0x20));
+   PUSH_DATA (push, (dec->fence_bo->offset + 0x20));
+   PUSH_DATA (push, dec->fence_seq);
+
+   BEGIN_NV04(push, SUBC_PPP(0x300), 1);
+   PUSH_DATA (push, 1);
+   PUSH_KICK (push);
+
+   {
+      unsigned spin = 0;
+
+      do {
+         usleep(100);
+         if ((spin++ & 0xff) == 0xff)
+            debug_printf("p%u: %u\n", dec->fence_seq, dec->fence_map[8]);
+      } while (dec->fence_seq > dec->fence_map[8]);
+   }
+#else
+   BEGIN_NV04(push, SUBC_PPP(0x300), 1);
+   PUSH_DATA (push, 0);
+   PUSH_KICK (push);
+#endif
+}
diff --git a/src/gallium/drivers/nv50/nv98_video_vp.c b/src/gallium/drivers/nv50/nv98_video_vp.c
new file mode 100644
index 0000000..04994bd
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv98_video_vp.c
@@ -0,0 +1,202 @@
+/*
+ * Copyright 2011-2013 Maarten Lankhorst
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "nv98_video.h"
+#include <sys/mman.h>
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+static void dump_comm_vp(struct nouveau_vp3_decoder *dec, struct comm *comm, u32 comm_seq,
+                         struct nouveau_bo *inter_bo, unsigned slice_size)
+{
+	unsigned i, idx = comm->pvp_cur_index & 0xf;
+	debug_printf("Status: %08x, stage: %08x\n", comm->status_vp[idx], comm->pvp_stage);
+#if 0
+	debug_printf("Acked byte ofs: %x, bsp byte ofs: %x\n", comm->acked_byte_ofs, comm->byte_ofs);
+	debug_printf("Irq/parse indexes: %i %i\n", comm->irq_index, comm->parse_endpos_index);
+
+	for (i = 0; i != comm->irq_index; ++i)
+		debug_printf("irq[%i] = { @ %08x -> %04x }\n", i, comm->irq_pos[i], comm->irq_470[i]);
+	for (i = 0; i != comm->parse_endpos_index; ++i)
+		debug_printf("parse_endpos[%i] = { @ %08x}\n", i, comm->parse_endpos[i]);
+#endif
+	debug_printf("mb_y = %u\n", comm->mb_y[idx]);
+	if (comm->status_vp[idx] == 1)
+		return;
+
+	if ((comm->pvp_stage & 0xff) != 0xff) {
+		unsigned *map;
+		assert(nouveau_bo_map(inter_bo, NOUVEAU_BO_RD|NOUVEAU_BO_NOBLOCK, dec->client) >= 0);
+		map = inter_bo->map;
+		for (i = 0; i < comm->byte_ofs + slice_size; i += 0x10) {
+			debug_printf("%05x: %08x %08x %08x %08x\n", i, map[i/4], map[i/4+1], map[i/4+2], map[i/4+3]);
+		}
+		munmap(inter_bo->map, inter_bo->size);
+		inter_bo->map = NULL;
+	}
+	assert((comm->pvp_stage & 0xff) == 0xff);
+}
+#endif
+
+static void
+nv98_decoder_kick_ref(struct nouveau_vp3_decoder *dec, struct nouveau_vp3_video_buffer *target)
+{
+   dec->refs[target->valid_ref].vidbuf = NULL;
+   dec->refs[target->valid_ref].last_used = 0;
+//   debug_printf("Unreffed %p\n", target);
+}
+
+void
+nv98_decoder_vp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
+                struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
+                unsigned caps, unsigned is_ref,
+                struct nouveau_vp3_video_buffer *refs[16])
+{
+   struct nouveau_pushbuf *push = dec->pushbuf[1];
+   uint32_t bsp_addr, comm_addr, inter_addr, ucode_addr, pic_addr[17], last_addr, null_addr;
+   uint32_t slice_size, bucket_size, ring_size, i;
+   enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
+   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NOUVEAU_VP3_VIDEO_QDEPTH];
+   struct nouveau_bo *inter_bo = dec->inter_bo[comm_seq & 1];
+   u32 fence_extra = 0, codec_extra = 0;
+   struct nouveau_pushbuf_refn bo_refs[] = {
+      { inter_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
+      { dec->ref_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
+      { bsp_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
+#if NOUVEAU_VP3_DEBUG_FENCE
+      { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
+#endif
+      { dec->fw_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
+   };
+   int num_refs = sizeof(bo_refs)/sizeof(*bo_refs) - !dec->fw_bo;
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   fence_extra = 4;
+#endif
+
+   if (codec == PIPE_VIDEO_CODEC_MPEG4_AVC) {
+      nouveau_vp3_inter_sizes(dec, desc.h264->slice_count, &slice_size, &bucket_size, &ring_size);
+      codec_extra += 2;
+   } else
+      nouveau_vp3_inter_sizes(dec, 1, &slice_size, &bucket_size, &ring_size);
+
+   if (dec->base.max_references > 2)
+      codec_extra += 1 + (dec->base.max_references - 2);
+
+   pic_addr[16] = nouveau_vp3_video_addr(dec, target) >> 8;
+   last_addr = null_addr = nouveau_vp3_video_addr(dec, NULL) >> 8;
+
+   for (i = 0; i < dec->base.max_references; ++i) {
+      if (!refs[i])
+         pic_addr[i] = last_addr;
+      else if (dec->refs[refs[i]->valid_ref].vidbuf == refs[i])
+         last_addr = pic_addr[i] = nouveau_vp3_video_addr(dec, refs[i]) >> 8;
+      else
+         pic_addr[i] = null_addr;
+   }
+   if (!is_ref)
+      nv98_decoder_kick_ref(dec, target);
+
+   nouveau_pushbuf_space(push, 8 + 3 * (codec != PIPE_VIDEO_CODEC_MPEG12) +
+              6 + codec_extra + fence_extra + 2, num_refs, 0);
+
+   nouveau_pushbuf_refn(push, bo_refs, num_refs);
+
+   bsp_addr = bsp_bo->offset >> 8;
+#if NOUVEAU_VP3_DEBUG_FENCE
+   comm_addr = (dec->fence_bo->offset + COMM_OFFSET)>>8;
+#else
+   comm_addr = bsp_addr + (COMM_OFFSET>>8);
+#endif
+   inter_addr = inter_bo->offset >> 8;
+   if (dec->fw_bo)
+      ucode_addr = dec->fw_bo->offset >> 8;
+   else
+      ucode_addr = 0;
+
+   BEGIN_NV04(push, SUBC_VP(0x700), 7);
+   PUSH_DATA (push, caps); // 700
+   PUSH_DATA (push, comm_seq); // 704
+   PUSH_DATA (push, 0); // 708 fuc targets, ignored for nv98
+   PUSH_DATA (push, dec->fw_sizes); // 70c
+   PUSH_DATA (push, bsp_addr+(VP_OFFSET>>8)); // 710 picparm_addr
+   PUSH_DATA (push, inter_addr); // 714 inter_parm
+   PUSH_DATA (push, inter_addr + slice_size + bucket_size); // 718 inter_data_ofs
+
+   if (bucket_size) {
+      uint64_t tmpimg_addr = dec->ref_bo->offset + dec->ref_stride * (dec->base.max_references+2);
+
+      BEGIN_NV04(push, SUBC_VP(0x71c), 2);
+      PUSH_DATA (push, tmpimg_addr >> 8); // 71c
+      PUSH_DATA (push, inter_addr + slice_size); // 720 bucket_ofs
+   }
+
+   BEGIN_NV04(push, SUBC_VP(0x724), 5);
+   PUSH_DATA (push, comm_addr); // 724
+   PUSH_DATA (push, ucode_addr); // 728
+   PUSH_DATA (push, pic_addr[16]); // 734
+   PUSH_DATA (push, pic_addr[0]); // 72c
+   PUSH_DATA (push, pic_addr[1]); // 730
+
+   if (dec->base.max_references > 2) {
+      int i;
+
+      BEGIN_NV04(push, SUBC_VP(0x400), dec->base.max_references - 2);
+      for (i = 2; i < dec->base.max_references; ++i) {
+         assert(0x400 + (i - 2) * 4 < 0x438);
+         PUSH_DATA (push, pic_addr[i]);
+      }
+   }
+
+   if (codec == PIPE_VIDEO_CODEC_MPEG4_AVC) {
+      BEGIN_NV04(push, SUBC_VP(0x438), 1);
+      PUSH_DATA (push, desc.h264->slice_count);
+   }
+
+   //debug_printf("Decoding %08lx with %08lx and %08lx\n", pic_addr[16], pic_addr[0], pic_addr[1]);
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   BEGIN_NV04(push, SUBC_VP(0x240), 3);
+   PUSH_DATAh(push, (dec->fence_bo->offset + 0x10));
+   PUSH_DATA (push, (dec->fence_bo->offset + 0x10));
+   PUSH_DATA (push, dec->fence_seq);
+
+   BEGIN_NV04(push, SUBC_VP(0x300), 1);
+   PUSH_DATA (push, 1);
+   PUSH_KICK(push);
+
+   {
+      unsigned spin = 0;
+      do {
+         usleep(100);
+         if ((spin++ & 0xff) == 0xff) {
+            debug_printf("v%u: %u\n", dec->fence_seq, dec->fence_map[4]);
+            dump_comm_vp(dec, dec->comm, comm_seq, inter_bo, slice_size << 8);
+         }
+      } while (dec->fence_seq > dec->fence_map[4]);
+   }
+   dump_comm_vp(dec, dec->comm, comm_seq, inter_bo, slice_size << 8);
+#else
+   BEGIN_NV04(push, SUBC_VP(0x300), 1);
+   PUSH_DATA (push, 0);
+   PUSH_KICK (push);
+#endif
+}
-- 
1.8.1.5
