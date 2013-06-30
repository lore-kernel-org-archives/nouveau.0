From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH v2] nv50: H.264/MPEG2 decoding support via VP2,
	available on NV84-NV96, NVA0
Date: Sun, 30 Jun 2013 01:17:00 -0400
Message-ID: <1372569420-18489-1-git-send-email-imirkin@alum.mit.edu>
References: <1372332404-16547-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1372332404-16547-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

Adds H.264 and MPEG2 codec support via VP2, using firmware from the
blob. Acceleration is supported at the bitstream level for H.264 and
IDCT level for MPEG2.

Known issues:
 - H.264 interlaced doesn't render properly
 - H.264 shows very occasional artifacts on a small fraction of videos
 - MPEG2 + VDPAU shows frequent but small artifacts, which aren't there
   when using XvMC on the same videos

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

v1 -> v2:

 - Replaced SSE4.2 code with SSE2 code -- it's a little faster, and works on
   all machines likely to end up with one of these cards.

 - Style cleanups suggested by Emil Velikov. Emil, let me know if there were
   things that I said I'd do but I forgot about (or if there are more things
   that you notice).

 src/gallium/drivers/nv50/Makefile.sources |   5 +-
 src/gallium/drivers/nv50/nv50_context.c   |  13 +-
 src/gallium/drivers/nv50/nv50_context.h   |  24 +
 src/gallium/drivers/nv50/nv50_miptree.c   |  27 +
 src/gallium/drivers/nv50/nv50_resource.h  |   1 +
 src/gallium/drivers/nv50/nv50_screen.c    |  13 +-
 src/gallium/drivers/nv50/nv50_winsys.h    |   4 +
 src/gallium/drivers/nv50/nv84_video.c     | 793 ++++++++++++++++++++++++++++++
 src/gallium/drivers/nv50/nv84_video.h     | 134 +++++
 src/gallium/drivers/nv50/nv84_video_bsp.c | 251 ++++++++++
 src/gallium/drivers/nv50/nv84_video_vp.c  | 547 +++++++++++++++++++++
 11 files changed, 1809 insertions(+), 3 deletions(-)
 create mode 100644 src/gallium/drivers/nv50/nv84_video.c
 create mode 100644 src/gallium/drivers/nv50/nv84_video.h
 create mode 100644 src/gallium/drivers/nv50/nv84_video_bsp.c
 create mode 100644 src/gallium/drivers/nv50/nv84_video_vp.c

diff --git a/src/gallium/drivers/nv50/Makefile.sources b/src/gallium/drivers/nv50/Makefile.sources
index 1092570..0fdac51 100644
--- a/src/gallium/drivers/nv50/Makefile.sources
+++ b/src/gallium/drivers/nv50/Makefile.sources
@@ -13,7 +13,10 @@ C_SOURCES := \
 	nv50_program.c \
 	nv50_shader_state.c \
 	nv50_push.c \
-	nv50_query.c
+	nv50_query.c \
+	nv84_video.c \
+	nv84_video_bsp.c \
+	nv84_video_vp.c
 
 CODEGEN_NV50_SOURCES := \
 	codegen/nv50_ir.cpp \
diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index 5781c4b..79a0473 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -258,7 +258,18 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
    draw_set_rasterize_stage(nv50->draw, nv50_draw_render_stage(nv50));
 #endif
 
-   nouveau_context_init_vdec(&nv50->base);
+   if (screen->base.device->chipset < 0x84) {
+      /* PMPEG */
+      nouveau_context_init_vdec(&nv50->base);
+   } else if (screen->base.device->chipset < 0x98 ||
+              screen->base.device->chipset == 0xa0) {
+      /* VP2 */
+      pipe->create_video_decoder = nv84_create_decoder;
+      pipe->create_video_buffer = nv84_video_buffer_create;
+   } else {
+      /* Unsupported, but need to init pointers. */
+      nouveau_context_init_vdec(&nv50->base);
+   }
 
    flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_RD;
 
diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 0a83131..b204cc8 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -289,4 +289,28 @@ void nv50_vertex_arrays_validate(struct nv50_context *nv50);
 /* nv50_push.c */
 void nv50_push_vbo(struct nv50_context *, const struct pipe_draw_info *);
 
+/* nv84_video.c */
+struct pipe_video_decoder *
+nv84_create_decoder(struct pipe_context *context,
+                    enum pipe_video_profile profile,
+                    enum pipe_video_entrypoint entrypoint,
+                    enum pipe_video_chroma_format chroma_format,
+                    unsigned width, unsigned height,
+                    unsigned max_references,
+                    bool expect_chunked_decode);
+
+struct pipe_video_buffer *
+nv84_video_buffer_create(struct pipe_context *pipe,
+                         const struct pipe_video_buffer *template);
+
+int
+nv84_screen_get_video_param(struct pipe_screen *pscreen,
+                            enum pipe_video_profile profile,
+                            enum pipe_video_cap param);
+
+boolean
+nv84_screen_video_supported(struct pipe_screen *screen,
+                            enum pipe_format format,
+                            enum pipe_video_profile profile);
+
 #endif
diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 036f1c7..28be768 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -239,6 +239,28 @@ nv50_miptree_init_layout_linear(struct nv50_miptree *mt, unsigned pitch_align)
 }
 
 static void
+nv50_miptree_init_layout_video(struct nv50_miptree *mt)
+{
+   const struct pipe_resource *pt = &mt->base.base;
+   const unsigned blocksize = util_format_get_blocksize(pt->format);
+
+   assert(pt->last_level == 0);
+   assert(mt->ms_x == 0 && mt->ms_y == 0);
+   assert(!util_format_is_compressed(pt->format));
+
+   mt->layout_3d = pt->target == PIPE_TEXTURE_3D;
+
+   mt->level[0].tile_mode = 0x20;
+   mt->level[0].pitch = align(pt->width0 * blocksize, 64);
+   mt->total_size = align(pt->height0, 16) * mt->level[0].pitch * (mt->layout_3d ? pt->depth0 : 1);
+
+   if (pt->array_size > 1) {
+      mt->layer_stride = align(mt->total_size, NV50_TILE_SIZE(0x20));
+      mt->total_size = mt->layer_stride * pt->array_size;
+   }
+}
+
+static void
 nv50_miptree_init_layout_tiled(struct nv50_miptree *mt)
 {
    struct pipe_resource *pt = &mt->base.base;
@@ -311,6 +333,11 @@ nv50_miptree_create(struct pipe_screen *pscreen,
       return NULL;
    }
 
+   if (unlikely(pt->flags & NV50_RESOURCE_FLAG_VIDEO)) {
+      nv50_miptree_init_layout_video(mt);
+      /* BO allocation done by client */
+      return pt;
+   } else
    if (bo_config.nv50.memtype != 0) {
       nv50_miptree_init_layout_tiled(mt);
    } else
diff --git a/src/gallium/drivers/nv50/nv50_resource.h b/src/gallium/drivers/nv50/nv50_resource.h
index 6b92463..c520a72 100644
--- a/src/gallium/drivers/nv50/nv50_resource.h
+++ b/src/gallium/drivers/nv50/nv50_resource.h
@@ -16,6 +16,7 @@ nv50_init_resource_functions(struct pipe_context *pcontext);
 void
 nv50_screen_init_resource_functions(struct pipe_screen *pscreen);
 
+#define NV50_RESOURCE_FLAG_VIDEO (NOUVEAU_RESOURCE_FLAG_DRV_PRIV << 0)
 
 #define NV50_TILE_SHIFT_X(m) 6
 #define NV50_TILE_SHIFT_Y(m) ((((m) >> 4) & 0xf) + 2)
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index b6da303..86bad6b 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -646,7 +646,18 @@ nv50_screen_create(struct nouveau_device *dev)
 
    nv50_screen_init_resource_functions(pscreen);
 
-   nouveau_screen_init_vdec(&screen->base);
+   if (screen->base.device->chipset < 0x84) {
+      /* PMPEG */
+      nouveau_screen_init_vdec(&screen->base);
+   } else if (screen->base.device->chipset < 0x98 ||
+              screen->base.device->chipset == 0xa0) {
+      /* VP2 */
+      screen->base.base.get_video_param = nv84_screen_get_video_param;
+      screen->base.base.is_video_format_supported = nv84_screen_video_supported;
+   } else {
+      /* Unsupported, but need to init pointers. */
+      nouveau_screen_init_vdec(&screen->base);
+   }
 
    ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0, 4096,
                         NULL, &screen->fence.bo);
diff --git a/src/gallium/drivers/nv50/nv50_winsys.h b/src/gallium/drivers/nv50/nv50_winsys.h
index 145ee70..e04247b 100644
--- a/src/gallium/drivers/nv50/nv50_winsys.h
+++ b/src/gallium/drivers/nv50/nv50_winsys.h
@@ -60,6 +60,10 @@ PUSH_REFN(struct nouveau_pushbuf *push, struct nouveau_bo *bo, uint32_t flags)
 #define SUBC_COMPUTE(m) 6, (m)
 #define NV50_COMPUTE(n) SUBC_COMPUTE(NV50_COMPUTE_##n)
 
+/* These are expected to be on their own pushbufs */
+#define SUBC_BSP(m) 2, (m)
+#define SUBC_VP(m) 2, (m)
+
 
 static INLINE uint32_t
 NV50_FIFO_PKHDR(int subc, int mthd, unsigned size)
diff --git a/src/gallium/drivers/nv50/nv84_video.c b/src/gallium/drivers/nv50/nv84_video.c
new file mode 100644
index 0000000..502379a
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv84_video.c
@@ -0,0 +1,793 @@
+/*
+ * Copyright 2013 Ilia Mirkin
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
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+
+#include "util/u_format.h"
+#include "util/u_sampler.h"
+#include "vl/vl_zscan.h"
+
+#include "nv84_video.h"
+
+static int
+nv84_copy_firmware(const char *path, void *dest, ssize_t len)
+{
+   int fd = open(path, O_RDONLY | O_CLOEXEC);
+   ssize_t r;
+   if (fd < 0) {
+      fprintf(stderr, "opening firmware file %s failed: %m\n", path);
+      return 1;
+   }
+   r = read(fd, dest, len);
+   close(fd);
+
+   if (r != len) {
+      fprintf(stderr, "reading firwmare file %s failed: %m\n", path);
+      return 1;
+   }
+
+   return 0;
+}
+
+static int
+filesize(const char *path)
+{
+   int ret;
+   struct stat statbuf;
+
+   ret = stat(path, &statbuf);
+   if (ret)
+      return ret;
+   return statbuf.st_size;
+}
+
+static struct nouveau_bo *
+nv84_load_firmwares(struct nouveau_device *dev, struct nv84_decoder *dec,
+                    const char *fw1, const char *fw2)
+{
+   int ret, size1, size2 = 0;
+   struct nouveau_bo *fw;
+
+   size1 = filesize(fw1);
+   if (fw2)
+      size2 = filesize(fw2);
+   if (size1 < 0 || size2 < 0)
+      return NULL;
+
+   dec->vp_fw2_offset = align(size1, 0x100);
+
+   ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, dec->vp_fw2_offset + size2, NULL, &fw);
+   if (ret)
+      return NULL;
+   ret = nouveau_bo_map(fw, NOUVEAU_BO_WR, dec->client);
+   if (ret)
+      goto error;
+
+   ret = nv84_copy_firmware(fw1, fw->map, size1);
+   if (fw2 && !ret)
+      ret = nv84_copy_firmware(fw2, fw->map + dec->vp_fw2_offset, size2);
+   munmap(fw->map, fw->size);
+   fw->map = NULL;
+   if (!ret)
+      return fw;
+error:
+   nouveau_bo_ref(NULL, &fw);
+   return NULL;
+}
+
+static struct nouveau_bo *
+nv84_load_bsp_firmware(struct nouveau_device *dev, struct nv84_decoder *dec)
+{
+   return nv84_load_firmwares(
+         dev, dec, "/lib/firmware/nouveau/nv84_bsp-h264", NULL);
+}
+
+static struct nouveau_bo *
+nv84_load_vp_firmware(struct nouveau_device *dev, struct nv84_decoder *dec)
+{
+   return nv84_load_firmwares(
+         dev, dec,
+         "/lib/firmware/nouveau/nv84_vp-h264-1",
+         "/lib/firmware/nouveau/nv84_vp-h264-2");
+}
+
+static struct nouveau_bo *
+nv84_load_vp_firmware_mpeg(struct nouveau_device *dev, struct nv84_decoder *dec)
+{
+   return nv84_load_firmwares(
+         dev, dec, "/lib/firmware/nouveau/nv84_vp-mpeg12", NULL);
+}
+
+static void
+nv84_decoder_decode_bitstream_h264(struct pipe_video_decoder *decoder,
+                                   struct pipe_video_buffer *video_target,
+                                   struct pipe_picture_desc *picture,
+                                   unsigned num_buffers,
+                                   const void *const *data,
+                                   const unsigned *num_bytes)
+{
+   struct nv84_decoder *dec = (struct nv84_decoder *)decoder;
+   struct nv84_video_buffer *target = (struct nv84_video_buffer *)video_target;
+
+   struct pipe_h264_picture_desc *desc = (struct pipe_h264_picture_desc *)picture;
+
+   assert(target->base.buffer_format == PIPE_FORMAT_NV12);
+
+   nv84_decoder_bsp(dec, desc, num_buffers, data, num_bytes, target);
+   nv84_decoder_vp_h264(dec, desc, target);
+}
+
+static void
+nv84_decoder_flush(struct pipe_video_decoder *decoder)
+{
+}
+
+static void
+nv84_decoder_begin_frame_h264(struct pipe_video_decoder *decoder,
+                              struct pipe_video_buffer *target,
+                              struct pipe_picture_desc *picture)
+{
+}
+
+static void
+nv84_decoder_end_frame_h264(struct pipe_video_decoder *decoder,
+                            struct pipe_video_buffer *target,
+                            struct pipe_picture_desc *picture)
+{
+}
+
+static void
+nv84_decoder_decode_bitstream_mpeg12(struct pipe_video_decoder *decoder,
+                                     struct pipe_video_buffer *video_target,
+                                     struct pipe_picture_desc *picture,
+                                     unsigned num_buffers,
+                                     const void *const *data,
+                                     const unsigned *num_bytes)
+{
+   struct nv84_decoder *dec = (struct nv84_decoder *)decoder;
+
+   assert(video_target->buffer_format == PIPE_FORMAT_NV12);
+
+   vl_mpg12_bs_decode(dec->mpeg12_bs,
+                      video_target,
+                      (struct pipe_mpeg12_picture_desc *)picture,
+                      num_buffers,
+                      data,
+                      num_bytes);
+}
+
+static void
+nv84_decoder_begin_frame_mpeg12(struct pipe_video_decoder *decoder,
+                              struct pipe_video_buffer *target,
+                              struct pipe_picture_desc *picture)
+{
+   struct nv84_decoder *dec = (struct nv84_decoder *)decoder;
+   struct pipe_mpeg12_picture_desc *desc = (struct pipe_mpeg12_picture_desc *)picture;
+   int i;
+
+   nouveau_bo_wait(dec->mpeg12_bo, NOUVEAU_BO_RDWR, dec->client);
+   dec->mpeg12_mb_info = dec->mpeg12_bo->map + 0x100;
+   dec->mpeg12_data = dec->mpeg12_bo->map + 0x100 +
+      align(0x20 * mb(dec->base.width) * mb(dec->base.height), 0x100);
+   if (desc->intra_matrix) {
+      dec->zscan = desc->alternate_scan ? vl_zscan_alternate : vl_zscan_normal;
+      for (i = 0; i < 64; i++) {
+         dec->mpeg12_intra_matrix[i] = desc->intra_matrix[dec->zscan[i]];
+         dec->mpeg12_non_intra_matrix[i] = desc->non_intra_matrix[dec->zscan[i]];
+      }
+      dec->mpeg12_intra_matrix[0] = 1 << (7 - desc->intra_dc_precision);
+   }
+}
+
+static void
+nv84_decoder_end_frame_mpeg12(struct pipe_video_decoder *decoder,
+                              struct pipe_video_buffer *target,
+                              struct pipe_picture_desc *picture)
+{
+   nv84_decoder_vp_mpeg12(
+         (struct nv84_decoder *)decoder,
+         (struct pipe_mpeg12_picture_desc *)picture,
+         (struct nv84_video_buffer *)target);
+}
+
+static void
+nv84_decoder_decode_macroblock(struct pipe_video_decoder *decoder,
+                               struct pipe_video_buffer *target,
+                               struct pipe_picture_desc *picture,
+                               const struct pipe_macroblock *macroblocks,
+                               unsigned num_macroblocks)
+{
+   const struct pipe_mpeg12_macroblock *mb = (const struct pipe_mpeg12_macroblock *)macroblocks;
+   for (int i = 0; i < num_macroblocks; i++, mb++) {
+      nv84_decoder_vp_mpeg12_mb(
+            (struct nv84_decoder *)decoder,
+            (struct pipe_mpeg12_picture_desc *)picture,
+            mb);
+   }
+}
+
+static void
+nv84_decoder_destroy(struct pipe_video_decoder *decoder)
+{
+   struct nv84_decoder *dec = (struct nv84_decoder *)decoder;
+
+   nouveau_bo_ref(NULL, &dec->bsp_fw);
+   nouveau_bo_ref(NULL, &dec->bsp_data);
+   nouveau_bo_ref(NULL, &dec->vp_fw);
+   nouveau_bo_ref(NULL, &dec->vp_data);
+   nouveau_bo_ref(NULL, &dec->mbring);
+   nouveau_bo_ref(NULL, &dec->vpring);
+   nouveau_bo_ref(NULL, &dec->bitstream);
+   nouveau_bo_ref(NULL, &dec->vp_params);
+   nouveau_bo_ref(NULL, &dec->fence);
+
+   nouveau_object_del(&dec->bsp);
+   nouveau_object_del(&dec->vp);
+
+   nouveau_bufctx_del(&dec->bsp_bufctx);
+   nouveau_pushbuf_del(&dec->bsp_pushbuf);
+   nouveau_object_del(&dec->bsp_channel);
+
+   nouveau_bufctx_del(&dec->vp_bufctx);
+   nouveau_pushbuf_del(&dec->vp_pushbuf);
+   nouveau_object_del(&dec->vp_channel);
+
+   nouveau_client_del(&dec->client);
+
+   if (dec->mpeg12_bs)
+      FREE(dec->mpeg12_bs);
+   FREE(dec);
+}
+
+struct pipe_video_decoder *
+nv84_create_decoder(struct pipe_context *context,
+                    enum pipe_video_profile profile,
+                    enum pipe_video_entrypoint entrypoint,
+                    enum pipe_video_chroma_format chroma_format,
+                    unsigned width, unsigned height,
+                    unsigned max_references,
+                    bool chunked_decode)
+{
+   struct nv50_context *nv50 = (struct nv50_context *)context;
+   struct nouveau_screen *screen = &nv50->screen->base;
+   struct nv84_decoder *dec;
+   struct nouveau_pushbuf *bsp_push, *vp_push;
+   struct nv50_surface surf;
+   struct nv50_miptree mip;
+   union pipe_color_union color;
+   struct nv04_fifo nv04_data = { .vram = 0xbeef0201, .gart = 0xbeef0202 };
+   int ret, i;
+   int is_h264 = u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG4_AVC;
+   int is_mpeg12 = u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG12;
+
+   if (getenv("XVMC_VL"))
+      return vl_create_decoder(context, profile, entrypoint,
+                               chroma_format, width, height,
+                               max_references, chunked_decode);
+
+   if ((is_h264 && entrypoint != PIPE_VIDEO_ENTRYPOINT_BITSTREAM) ||
+       (is_mpeg12 && entrypoint > PIPE_VIDEO_ENTRYPOINT_IDCT)) {
+      debug_printf("%x\n", entrypoint);
+      return NULL;
+   }
+
+   if (!is_h264 && !is_mpeg12) {
+      debug_printf("invalid profile: %x\n", profile);
+      return NULL;
+   }
+
+   dec = CALLOC_STRUCT(nv84_decoder);
+   if (!dec)
+      return NULL;
+
+   dec->base.context = context;
+   dec->base.profile = profile;
+   dec->base.entrypoint = entrypoint;
+   dec->base.chroma_format = chroma_format;
+   dec->base.width = width;
+   dec->base.height = height;
+   dec->base.max_references = max_references;
+   dec->base.destroy = nv84_decoder_destroy;
+   dec->base.flush = nv84_decoder_flush;
+   if (is_h264) {
+      dec->base.decode_bitstream = nv84_decoder_decode_bitstream_h264;
+      dec->base.begin_frame = nv84_decoder_begin_frame_h264;
+      dec->base.end_frame = nv84_decoder_end_frame_h264;
+
+      dec->frame_mbs = mb(dec->base.width) * mb_half(dec->base.height) * 2;
+      dec->frame_size = dec->frame_mbs << 8;
+      dec->vpring_deblock = align(0x30 * dec->frame_mbs, 0x100);
+      dec->vpring_residual = 0x2000 + MAX2(0x32000, 0x600 * dec->frame_mbs);
+      dec->vpring_ctrl = MAX2(0x10000, align(0x1080 + 0x144 * dec->frame_mbs, 0x100));
+   } else if (is_mpeg12) {
+      dec->base.decode_macroblock = nv84_decoder_decode_macroblock;
+      dec->base.begin_frame = nv84_decoder_begin_frame_mpeg12;
+      dec->base.end_frame = nv84_decoder_end_frame_mpeg12;
+
+      if (entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
+         dec->mpeg12_bs = CALLOC_STRUCT(vl_mpg12_bs);
+         if (!dec->mpeg12_bs)
+            goto fail;
+         vl_mpg12_bs_init(dec->mpeg12_bs, &dec->base);
+         dec->base.decode_bitstream = nv84_decoder_decode_bitstream_mpeg12;
+      }
+   } else {
+      goto fail;
+   }
+
+   ret = nouveau_client_new(screen->device, &dec->client);
+   if (ret)
+      goto fail;
+
+   if (is_h264) {
+      ret = nouveau_object_new(&screen->device->object, 0,
+                               NOUVEAU_FIFO_CHANNEL_CLASS,
+                               &nv04_data, sizeof(nv04_data), &dec->bsp_channel);
+      if (ret)
+         goto fail;
+
+      ret = nouveau_pushbuf_new(dec->client, dec->bsp_channel, 4,
+                                32 * 1024, true, &dec->bsp_pushbuf);
+      if (ret)
+         goto fail;
+
+      ret = nouveau_bufctx_new(dec->client, 1, &dec->bsp_bufctx);
+      if (ret)
+         goto fail;
+   }
+
+   ret = nouveau_object_new(&screen->device->object, 0,
+                            NOUVEAU_FIFO_CHANNEL_CLASS,
+                            &nv04_data, sizeof(nv04_data), &dec->vp_channel);
+   if (ret)
+      goto fail;
+   ret = nouveau_pushbuf_new(dec->client, dec->vp_channel, 4,
+                             32 * 1024, true, &dec->vp_pushbuf);
+   if (ret)
+      goto fail;
+
+   ret = nouveau_bufctx_new(dec->client, 1, &dec->vp_bufctx);
+   if (ret)
+      goto fail;
+
+   bsp_push = dec->bsp_pushbuf;
+   vp_push = dec->vp_pushbuf;
+
+   if (is_h264) {
+      dec->bsp_fw = nv84_load_bsp_firmware(screen->device, dec);
+      dec->vp_fw = nv84_load_vp_firmware(screen->device, dec);
+      if (!dec->bsp_fw || !dec->vp_fw)
+         goto fail;
+   }
+   if (is_mpeg12) {
+      dec->vp_fw = nv84_load_vp_firmware_mpeg(screen->device, dec);
+      if (!dec->vp_fw)
+         goto fail;
+   }
+
+   if (is_h264) {
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP,
+                           0, 0x40000, NULL, &dec->bsp_data);
+      if (ret)
+         goto fail;
+   }
+   ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP,
+                        0, 0x40000, NULL, &dec->vp_data);
+   if (ret)
+      goto fail;
+   if (is_h264) {
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP,
+                           0,
+                           2 * (dec->vpring_deblock +
+                                dec->vpring_residual +
+                                dec->vpring_ctrl +
+                                0x1000),
+                           NULL, &dec->vpring);
+      if (ret)
+         goto fail;
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP,
+                           0,
+                           (max_references + 1) * dec->frame_mbs * 0x40 +
+                           dec->frame_size + 0x2000,
+                           NULL, &dec->mbring);
+      if (ret)
+         goto fail;
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_GART,
+                           0, 2 * (0x700 + MAX2(0x40000, 0x800 + 0x180 * dec->frame_mbs)),
+                           NULL, &dec->bitstream);
+      if (ret)
+         goto fail;
+      ret = nouveau_bo_map(dec->bitstream, NOUVEAU_BO_WR, dec->client);
+      if (ret)
+         goto fail;
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_GART,
+                           0, 0x2000, NULL, &dec->vp_params);
+      if (ret)
+         goto fail;
+      ret = nouveau_bo_map(dec->vp_params, NOUVEAU_BO_WR, dec->client);
+      if (ret)
+         goto fail;
+   }
+   if (is_mpeg12) {
+      ret = nouveau_bo_new(screen->device, NOUVEAU_BO_GART,
+                           0,
+                           align(0x20 * mb(width) * mb(height), 0x100) +
+                           (6 * 64 * 8) * mb(width) * mb(height) + 0x100,
+                           NULL, &dec->mpeg12_bo);
+      if (ret)
+         goto fail;
+      ret = nouveau_bo_map(dec->mpeg12_bo, NOUVEAU_BO_WR, dec->client);
+      if (ret)
+         goto fail;
+   }
+
+   ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM,
+                        0, 0x1000, NULL, &dec->fence);
+   if (ret)
+      goto fail;
+   ret = nouveau_bo_map(dec->fence, NOUVEAU_BO_WR, dec->client);
+   if (ret)
+      goto fail;
+   *(uint32_t *)dec->fence->map = 0;
+
+   if (is_h264) {
+      nouveau_pushbuf_bufctx(bsp_push, dec->bsp_bufctx);
+      nouveau_bufctx_refn(dec->bsp_bufctx, 0,
+                          dec->bsp_fw, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+      nouveau_bufctx_refn(dec->bsp_bufctx, 0,
+                          dec->bsp_data, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+   }
+
+   nouveau_pushbuf_bufctx(vp_push, dec->vp_bufctx);
+   nouveau_bufctx_refn(dec->vp_bufctx, 0, dec->vp_fw,
+                       NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+   nouveau_bufctx_refn(dec->vp_bufctx, 0, dec->vp_data,
+                       NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+
+   if (is_h264 && !ret)
+      ret = nouveau_object_new(dec->bsp_channel, 0xbeef74b0, 0x74b0,
+                               NULL, 0, &dec->bsp);
+
+   if (!ret)
+      ret = nouveau_object_new(dec->vp_channel, 0xbeef7476, 0x7476,
+                               NULL, 0, &dec->vp);
+
+   if (ret)
+      goto fail;
+
+
+   if (is_h264) {
+      /* Zero out some parts of mbring/vpring. there's gotta be some cleaner way
+       * of doing this... perhaps makes sense to just copy the relevant logic
+       * here. */
+      color.f[0] = color.f[1] = color.f[2] = color.f[3] = 0;
+      surf.offset = dec->frame_size;
+      surf.width = 64;
+      surf.height = (max_references + 1) * dec->frame_mbs / 4;
+      surf.depth = 1;
+      surf.base.format = PIPE_FORMAT_B8G8R8A8_UNORM;
+      surf.base.u.tex.level = 0;
+      surf.base.texture = &mip.base.base;
+      mip.level[0].tile_mode = 0;
+      mip.level[0].pitch = surf.width * 4;
+      mip.base.domain = NOUVEAU_BO_VRAM;
+      mip.base.bo = dec->mbring;
+      context->clear_render_target(context, &surf.base, &color, 0, 0, 64, 4760);
+      surf.offset = dec->vpring->size / 2 - 0x1000;
+      surf.width = 1024;
+      surf.height = 1;
+      mip.level[0].pitch = surf.width * 4;
+      mip.base.bo = dec->vpring;
+      context->clear_render_target(context, &surf.base, &color, 0, 0, 1024, 1);
+      surf.offset = dec->vpring->size - 0x1000;
+      context->clear_render_target(context, &surf.base, &color, 0, 0, 1024, 1);
+
+      PUSH_SPACE(screen->pushbuf, 5);
+      PUSH_REFN(screen->pushbuf, dec->fence, NOUVEAU_BO_VRAM | NOUVEAU_BO_RDWR);
+      /* The clear_render_target is done via 3D engine, so use it to write to a
+       * sempahore to indicate that it's done.
+       */
+      BEGIN_NV04(screen->pushbuf, NV50_3D(QUERY_ADDRESS_HIGH), 4);
+      PUSH_DATAh(screen->pushbuf, dec->fence->offset);
+      PUSH_DATA (screen->pushbuf, dec->fence->offset);
+      PUSH_DATA (screen->pushbuf, 1);
+      PUSH_DATA (screen->pushbuf, 0xf010);
+      PUSH_KICK (screen->pushbuf);
+
+      PUSH_SPACE(bsp_push, 2 + 12 + 2 + 4 + 3);
+
+      BEGIN_NV04(bsp_push, SUBC_BSP(NV01_SUBCHAN_OBJECT), 1);
+      PUSH_DATA (bsp_push, dec->bsp->handle);
+
+      BEGIN_NV04(bsp_push, SUBC_BSP(0x180), 11);
+      for (i = 0; i < 11; i++)
+         PUSH_DATA(bsp_push, nv04_data.vram);
+      BEGIN_NV04(bsp_push, SUBC_BSP(0x1b8), 1);
+      PUSH_DATA (bsp_push, nv04_data.vram);
+
+      BEGIN_NV04(bsp_push, SUBC_BSP(0x600), 3);
+      PUSH_DATAh(bsp_push, dec->bsp_fw->offset);
+      PUSH_DATA (bsp_push, dec->bsp_fw->offset);
+      PUSH_DATA (bsp_push, dec->bsp_fw->size);
+
+      BEGIN_NV04(bsp_push, SUBC_BSP(0x628), 2);
+      PUSH_DATA (bsp_push, dec->bsp_data->offset >> 8);
+      PUSH_DATA (bsp_push, dec->bsp_data->size);
+      PUSH_KICK (bsp_push);
+   }
+
+   PUSH_SPACE(vp_push, 2 + 12 + 2 + 4 + 3);
+
+   BEGIN_NV04(vp_push, SUBC_VP(NV01_SUBCHAN_OBJECT), 1);
+   PUSH_DATA (vp_push, dec->vp->handle);
+
+   BEGIN_NV04(vp_push, SUBC_VP(0x180), 11);
+   for (i = 0; i < 11; i++)
+      PUSH_DATA(vp_push, nv04_data.vram);
+
+   BEGIN_NV04(vp_push, SUBC_VP(0x1b8), 1);
+   PUSH_DATA (vp_push, nv04_data.vram);
+
+   BEGIN_NV04(vp_push, SUBC_VP(0x600), 3);
+   PUSH_DATAh(vp_push, dec->vp_fw->offset);
+   PUSH_DATA (vp_push, dec->vp_fw->offset);
+   PUSH_DATA (vp_push, dec->vp_fw->size);
+
+   BEGIN_NV04(vp_push, SUBC_VP(0x628), 2);
+   PUSH_DATA (vp_push, dec->vp_data->offset >> 8);
+   PUSH_DATA (vp_push, dec->vp_data->size);
+   PUSH_KICK (vp_push);
+
+   return &dec->base;
+fail:
+   nv84_decoder_destroy(&dec->base);
+   return NULL;
+}
+
+static struct pipe_sampler_view **
+nv84_video_buffer_sampler_view_planes(struct pipe_video_buffer *buffer)
+{
+   struct nv84_video_buffer *buf = (struct nv84_video_buffer *)buffer;
+   return buf->sampler_view_planes;
+}
+
+static struct pipe_sampler_view **
+nv84_video_buffer_sampler_view_components(struct pipe_video_buffer *buffer)
+{
+   struct nv84_video_buffer *buf = (struct nv84_video_buffer *)buffer;
+   return buf->sampler_view_components;
+}
+
+static struct pipe_surface **
+nv84_video_buffer_surfaces(struct pipe_video_buffer *buffer)
+{
+   struct nv84_video_buffer *buf = (struct nv84_video_buffer *)buffer;
+   return buf->surfaces;
+}
+
+static void
+nv84_video_buffer_destroy(struct pipe_video_buffer *buffer)
+{
+   struct nv84_video_buffer *buf = (struct nv84_video_buffer *)buffer;
+   unsigned i;
+
+   assert(buf);
+
+   for (i = 0; i < VL_NUM_COMPONENTS; ++i) {
+      pipe_resource_reference(&buf->resources[i], NULL);
+      pipe_sampler_view_reference(&buf->sampler_view_planes[i], NULL);
+      pipe_sampler_view_reference(&buf->sampler_view_components[i], NULL);
+      pipe_surface_reference(&buf->surfaces[i * 2], NULL);
+      pipe_surface_reference(&buf->surfaces[i * 2 + 1], NULL);
+   }
+
+   nouveau_bo_ref(NULL, &buf->interlaced);
+   nouveau_bo_ref(NULL, &buf->full);
+
+   FREE(buffer);
+}
+
+struct pipe_video_buffer *
+nv84_video_buffer_create(struct pipe_context *pipe,
+                         const struct pipe_video_buffer *template)
+{
+   struct nv84_video_buffer *buffer;
+   struct pipe_resource templ;
+   unsigned i, j, component;
+   struct pipe_sampler_view sv_templ;
+   struct pipe_surface surf_templ;
+   struct nv50_miptree *mt0, *mt1;
+   struct nouveau_bo *empty = NULL;
+   struct nouveau_screen *screen = &((struct nv50_context *)pipe)->screen->base;
+   union nouveau_bo_config cfg;
+   unsigned bo_size;
+
+   if (getenv("XVMC_VL"))
+      return vl_video_buffer_create(pipe, template);
+
+   if (!template->interlaced) {
+      debug_printf("Require interlaced video buffers\n");
+      return NULL;
+   }
+   if (template->buffer_format != PIPE_FORMAT_NV12) {
+      debug_printf("Must use NV12 format\n");
+      return NULL;
+   }
+   if (template->chroma_format != PIPE_VIDEO_CHROMA_FORMAT_420) {
+      debug_printf("Must use 4:2:0 format\n");
+      return NULL;
+   }
+
+   /*
+    * Note that there are always going to be exactly two planes, one for Y,
+    * and one for UV. These are also the resources. VP expects these to be
+    * adjacent, so they need to belong to the same BO.
+    */
+
+   buffer = CALLOC_STRUCT(nv84_video_buffer);
+   if (!buffer) return NULL;
+
+   buffer->mvidx = -1;
+
+   buffer->base.buffer_format = template->buffer_format;
+   buffer->base.context = pipe;
+   buffer->base.destroy = nv84_video_buffer_destroy;
+   buffer->base.chroma_format = template->chroma_format;
+   buffer->base.width = template->width;
+   buffer->base.height = template->height;
+   buffer->base.get_sampler_view_planes = nv84_video_buffer_sampler_view_planes;
+   buffer->base.get_sampler_view_components = nv84_video_buffer_sampler_view_components;
+   buffer->base.get_surfaces = nv84_video_buffer_surfaces;
+   buffer->base.interlaced = true;
+
+   memset(&templ, 0, sizeof(templ));
+   templ.target = PIPE_TEXTURE_2D_ARRAY;
+   templ.depth0 = 1;
+   templ.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET;
+   templ.format = PIPE_FORMAT_R8_UNORM;
+   templ.width0 = align(template->width, 2);
+   templ.height0 = align(template->height, 4) / 2;
+   templ.flags = NV50_RESOURCE_FLAG_VIDEO;
+   templ.array_size = 2;
+
+   cfg.nv50.tile_mode = 0x20;
+   cfg.nv50.memtype = 0x70;
+
+   buffer->resources[0] = pipe->screen->resource_create(pipe->screen, &templ);
+   if (!buffer->resources[0])
+      goto error;
+
+   templ.format = PIPE_FORMAT_R8G8_UNORM;
+   templ.width0 /= 2;
+   templ.height0 /= 2;
+   buffer->resources[1] = pipe->screen->resource_create(pipe->screen, &templ);
+   if (!buffer->resources[1])
+      goto error;
+
+   mt0 = nv50_miptree(buffer->resources[0]);
+   mt1 = nv50_miptree(buffer->resources[1]);
+
+   bo_size = mt0->total_size + mt1->total_size;
+   if (nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP, 0,
+                      bo_size, &cfg, &buffer->interlaced))
+      goto error;
+   /* XXX Change reference frame management so that this is only allocated in
+    * the decoder when necessary. */
+   if (nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP, 0,
+                      bo_size, &cfg, &buffer->full))
+      goto error;
+
+   mt0->base.bo = buffer->interlaced;
+   mt0->base.domain = NOUVEAU_BO_VRAM;
+   mt0->base.offset = 0;
+   mt0->base.address = buffer->interlaced->offset + mt0->base.offset;
+   nouveau_bo_ref(buffer->interlaced, &empty);
+
+   mt1->base.bo = buffer->interlaced;
+   mt1->base.domain = NOUVEAU_BO_VRAM;
+   mt1->base.offset = mt0->layer_stride * 2;
+   mt1->base.address = buffer->interlaced->offset + mt1->base.offset;
+   nouveau_bo_ref(buffer->interlaced, &empty);
+
+   memset(&sv_templ, 0, sizeof(sv_templ));
+   for (component = 0, i = 0; i < 2; ++i ) {
+      struct pipe_resource *res = buffer->resources[i];
+      unsigned nr_components = util_format_get_nr_components(res->format);
+
+      u_sampler_view_default_template(&sv_templ, res, res->format);
+      buffer->sampler_view_planes[i] =
+         pipe->create_sampler_view(pipe, res, &sv_templ);
+      if (!buffer->sampler_view_planes[i])
+         goto error;
+
+      for (j = 0; j < nr_components; ++j, ++component) {
+         sv_templ.swizzle_r = sv_templ.swizzle_g = sv_templ.swizzle_b =
+            PIPE_SWIZZLE_RED + j;
+         sv_templ.swizzle_a = PIPE_SWIZZLE_ONE;
+
+         buffer->sampler_view_components[component] =
+            pipe->create_sampler_view(pipe, res, &sv_templ);
+         if (!buffer->sampler_view_components[component])
+            goto error;
+      }
+   }
+
+   memset(&surf_templ, 0, sizeof(surf_templ));
+   for (j = 0; j < 2; ++j) {
+      surf_templ.format = buffer->resources[j]->format;
+      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 0;
+      buffer->surfaces[j * 2] =
+         pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
+      if (!buffer->surfaces[j * 2])
+         goto error;
+
+      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 1;
+      buffer->surfaces[j * 2 + 1] =
+         pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
+      if (!buffer->surfaces[j * 2 + 1])
+         goto error;
+   }
+
+   return &buffer->base;
+
+error:
+   nv84_video_buffer_destroy(&buffer->base);
+   return NULL;
+}
+
+int
+nv84_screen_get_video_param(struct pipe_screen *pscreen,
+                            enum pipe_video_profile profile,
+                            enum pipe_video_cap param)
+{
+   switch (param) {
+   case PIPE_VIDEO_CAP_SUPPORTED:
+      return u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG4_AVC ||
+         u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG12;
+   case PIPE_VIDEO_CAP_NPOT_TEXTURES:
+      return 1;
+   case PIPE_VIDEO_CAP_MAX_WIDTH:
+   case PIPE_VIDEO_CAP_MAX_HEIGHT:
+      return 2048;
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
+nv84_screen_video_supported(struct pipe_screen *screen,
+                            enum pipe_format format,
+                            enum pipe_video_profile profile)
+{
+   return format == PIPE_FORMAT_NV12;
+}
diff --git a/src/gallium/drivers/nv50/nv84_video.h b/src/gallium/drivers/nv50/nv84_video.h
new file mode 100644
index 0000000..4ff8cf3
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv84_video.h
@@ -0,0 +1,134 @@
+/*
+ * Copyright 2013 Ilia Mirkin
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
+#ifndef NV84_VIDEO_H_
+#define NV84_VIDEO_H_
+
+#include "vl/vl_decoder.h"
+#include "vl/vl_video_buffer.h"
+#include "vl/vl_types.h"
+
+#include "vl/vl_mpeg12_bitstream.h"
+
+#include "util/u_video.h"
+
+#include "nv50_context.h"
+
+union pipe_desc {
+   struct pipe_picture_desc *base;
+   struct pipe_mpeg12_picture_desc *mpeg12;
+   struct pipe_mpeg4_picture_desc *mpeg4;
+   struct pipe_vc1_picture_desc *vc1;
+   struct pipe_h264_picture_desc *h264;
+};
+
+struct nv84_video_buffer {
+   struct pipe_video_buffer base;
+   struct pipe_resource *resources[VL_NUM_COMPONENTS];
+   struct pipe_sampler_view *sampler_view_planes[VL_NUM_COMPONENTS];
+   struct pipe_sampler_view *sampler_view_components[VL_NUM_COMPONENTS];
+   struct pipe_surface *surfaces[VL_NUM_COMPONENTS * 2];
+
+   struct nouveau_bo *interlaced, *full;
+   int mvidx;
+   unsigned frame_num, frame_num_max;
+};
+
+struct nv84_decoder {
+   struct pipe_video_decoder base;
+   struct nouveau_client *client;
+   struct nouveau_object *bsp_channel, *vp_channel, *bsp, *vp;
+   struct nouveau_pushbuf *bsp_pushbuf, *vp_pushbuf;
+   struct nouveau_bufctx *bsp_bufctx, *vp_bufctx;
+
+   struct nouveau_bo *bsp_fw, *bsp_data;
+   struct nouveau_bo *vp_fw, *vp_data;
+   struct nouveau_bo *mbring, *vpring;
+
+   /*
+    * states:
+    *  0: init
+    *  1: vpring/mbring cleared, bsp is ready
+    *  2: bsp is done, vp is ready
+    * and then vp it back to 1
+    */
+   struct nouveau_bo *fence;
+
+   struct nouveau_bo *bitstream;
+   struct nouveau_bo *vp_params;
+
+   size_t vp_fw2_offset;
+
+   unsigned frame_mbs, frame_size;
+   /* VPRING layout:
+        RESIDUAL
+        CTRL
+        DEBLOCK
+        0x1000
+   */
+   unsigned vpring_deblock, vpring_residual, vpring_ctrl;
+
+
+   struct vl_mpg12_bs *mpeg12_bs;
+
+   struct nouveau_bo *mpeg12_bo;
+   void *mpeg12_mb_info;
+   uint16_t *mpeg12_data;
+   const int *zscan;
+   uint8_t mpeg12_intra_matrix[64];
+   uint8_t mpeg12_non_intra_matrix[64];
+};
+
+static INLINE uint32_t mb(uint32_t coord)
+{
+   return (coord + 0xf)>>4;
+}
+
+static INLINE uint32_t mb_half(uint32_t coord)
+{
+   return (coord + 0x1f)>>5;
+}
+
+int
+nv84_decoder_bsp(struct nv84_decoder *dec,
+                 struct pipe_h264_picture_desc *desc,
+                 unsigned num_buffers,
+                 const void *const *data,
+                 const unsigned *num_bytes,
+                 struct nv84_video_buffer *dest);
+
+void
+nv84_decoder_vp_h264(struct nv84_decoder *dec,
+                     struct pipe_h264_picture_desc *desc,
+                     struct nv84_video_buffer *dest);
+
+void
+nv84_decoder_vp_mpeg12_mb(struct nv84_decoder *dec,
+                          struct pipe_mpeg12_picture_desc *desc,
+                          const struct pipe_mpeg12_macroblock *mb);
+
+void
+nv84_decoder_vp_mpeg12(struct nv84_decoder *dec,
+                       struct pipe_mpeg12_picture_desc *desc,
+                       struct nv84_video_buffer *dest);
+
+#endif
diff --git a/src/gallium/drivers/nv50/nv84_video_bsp.c b/src/gallium/drivers/nv50/nv84_video_bsp.c
new file mode 100644
index 0000000..7885210
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv84_video_bsp.c
@@ -0,0 +1,251 @@
+/*
+ * Copyright 2013 Ilia Mirkin
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
+#include "nv84_video.h"
+
+struct iparm {
+   struct iseqparm {
+      uint32_t chroma_format_idc; // 00
+      uint32_t pad[(0x128 - 0x4) / 4];
+      uint32_t log2_max_frame_num_minus4; // 128
+      uint32_t pic_order_cnt_type; // 12c
+      uint32_t log2_max_pic_order_cnt_lsb_minus4; // 130
+      uint32_t delta_pic_order_always_zero_flag; // 134
+      uint32_t num_ref_frames; // 138
+      uint32_t pic_width_in_mbs_minus1; // 13c
+      uint32_t pic_height_in_map_units_minus1; // 140
+      uint32_t frame_mbs_only_flag; // 144
+      uint32_t mb_adaptive_frame_field_flag; // 148
+      uint32_t direct_8x8_inference_flag; // 14c
+   } iseqparm; // 000
+   struct ipicparm {
+      uint32_t entropy_coding_mode_flag; // 00
+      uint32_t pic_order_present_flag; // 04
+      uint32_t num_slice_groups_minus1; // 08
+      uint32_t slice_group_map_type; // 0c
+      uint32_t pad1[0x60 / 4];
+      uint32_t u70; // 70
+      uint32_t u74; // 74
+      uint32_t u78; // 78
+      uint32_t num_ref_idx_l0_active_minus1; // 7c
+      uint32_t num_ref_idx_l1_active_minus1; // 80
+      uint32_t weighted_pred_flag; // 84
+      uint32_t weighted_bipred_idc; // 88
+      uint32_t pic_init_qp_minus26; // 8c
+      uint32_t chroma_qp_index_offset; // 90
+      uint32_t deblocking_filter_control_present_flag; // 94
+      uint32_t constrained_intra_pred_flag; // 98
+      uint32_t redundant_pic_cnt_present_flag; // 9c
+      uint32_t transform_8x8_mode_flag; // a0
+      uint32_t pad2[(0x1c8 - 0xa0 - 4) / 4];
+      uint32_t second_chroma_qp_index_offset; // 1c8
+      uint32_t u1cc; // 1cc
+      uint32_t curr_pic_order_cnt; // 1d0
+      uint32_t field_order_cnt[2]; // 1d4
+      uint32_t curr_mvidx; // 1dc
+      struct iref {
+         uint32_t u00; // 00
+         uint32_t field_is_ref; // 04 // bit0: top, bit1: bottom
+         uint8_t is_long_term; // 08
+         uint8_t non_existing; // 09
+         uint32_t frame_idx; // 0c
+         uint32_t field_order_cnt[2]; // 10
+         uint32_t mvidx; // 18
+         uint8_t field_pic_flag; // 1c
+         // 20
+      } refs[0x10]; // 1e0
+   } ipicparm; // 150
+};
+
+int
+nv84_decoder_bsp(struct nv84_decoder *dec,
+                 struct pipe_h264_picture_desc *desc,
+                 unsigned num_buffers,
+                 const void *const *data,
+                 const unsigned *num_bytes,
+                 struct nv84_video_buffer *dest)
+{
+   struct iparm params;
+   uint32_t more_params[0x44 / 4] = {0};
+   unsigned total_bytes = 0;
+   int i;
+   static const uint32_t end[] = {0x0b010000, 0, 0x0b010000, 0};
+   char indexes[17] = {0};
+   struct nouveau_pushbuf *push = dec->bsp_pushbuf;
+   struct nouveau_pushbuf_refn bo_refs[] = {
+      { dec->vpring, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dec->mbring, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dec->bitstream, NOUVEAU_BO_RDWR | NOUVEAU_BO_GART },
+      { dec->fence, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+   };
+
+   nouveau_bo_wait(dec->fence, NOUVEAU_BO_RDWR, dec->client);
+
+   STATIC_ASSERT(sizeof(struct iparm) == 0x530);
+
+   memset(&params, 0, sizeof(params));
+
+   dest->frame_num = dest->frame_num_max = desc->frame_num;
+
+   for (i = 0; i < 16; i++) {
+      struct iref *ref = &params.ipicparm.refs[i];
+      struct nv84_video_buffer *frame = (struct nv84_video_buffer *)desc->ref[i];
+      if (!frame) break;
+      /* The frame index is relative to the last IDR frame. So once the frame
+       * num goes back to 0, previous reference frames need to have a negative
+       * index.
+       */
+      if (desc->frame_num >= frame->frame_num_max) {
+         frame->frame_num_max = desc->frame_num;
+      } else {
+         frame->frame_num -= frame->frame_num_max + 1;
+         frame->frame_num_max = desc->frame_num;
+      }
+      ref->non_existing = 0;
+      ref->field_is_ref = (desc->top_is_reference[i] ? 1 : 0) |
+         (desc->bottom_is_reference[i] ? 2 : 0);
+      ref->is_long_term = desc->is_long_term[i];
+      ref->field_order_cnt[0] = desc->field_order_cnt_list[i][0];
+      ref->field_order_cnt[1] = desc->field_order_cnt_list[i][1];
+      ref->frame_idx = frame->frame_num;
+      ref->u00 = ref->mvidx = frame->mvidx;
+      ref->field_pic_flag = desc->field_pic_flag;
+      indexes[frame->mvidx] = 1;
+   }
+
+   /* Needs to be adjusted if we ever support non-4:2:0 videos */
+   params.iseqparm.chroma_format_idc = 1;
+
+   params.iseqparm.pic_width_in_mbs_minus1 = mb(dec->base.width) - 1;
+   if (desc->field_pic_flag)
+      params.iseqparm.pic_height_in_map_units_minus1 = mb_half(dec->base.height) - 1;
+   else
+      params.iseqparm.pic_height_in_map_units_minus1 = mb(dec->base.height) - 1;
+
+   /* TODO: interlaced still doesn't work, maybe due to ref frame management. */
+   if (desc->bottom_field_flag)
+      params.ipicparm.curr_pic_order_cnt = desc->field_order_cnt[1];
+   else
+      params.ipicparm.curr_pic_order_cnt = desc->field_order_cnt[0];
+   params.ipicparm.field_order_cnt[0] = desc->field_order_cnt[0];
+   params.ipicparm.field_order_cnt[1] = desc->field_order_cnt[1];
+   if (desc->is_reference) {
+      if (dest->mvidx < 0) {
+         for (i = 0; i < desc->num_ref_frames + 1; i++) {
+            if (!indexes[i]) {
+               dest->mvidx = i;
+               break;
+            }
+         }
+         assert(i != desc->num_ref_frames + 1);
+      }
+
+      params.ipicparm.u1cc = params.ipicparm.curr_mvidx = dest->mvidx;
+   }
+
+   params.iseqparm.num_ref_frames = desc->num_ref_frames;
+   params.iseqparm.mb_adaptive_frame_field_flag = desc->mb_adaptive_frame_field_flag;
+   params.ipicparm.constrained_intra_pred_flag = desc->constrained_intra_pred_flag;
+   params.ipicparm.weighted_pred_flag = desc->weighted_pred_flag;
+   params.ipicparm.weighted_bipred_idc = desc->weighted_bipred_idc;
+   params.iseqparm.frame_mbs_only_flag = desc->frame_mbs_only_flag;
+   params.ipicparm.transform_8x8_mode_flag = desc->transform_8x8_mode_flag;
+   params.ipicparm.chroma_qp_index_offset = desc->chroma_qp_index_offset;
+   params.ipicparm.second_chroma_qp_index_offset = desc->second_chroma_qp_index_offset;
+   params.ipicparm.pic_init_qp_minus26 = desc->pic_init_qp_minus26;
+   params.ipicparm.num_ref_idx_l0_active_minus1 = desc->num_ref_idx_l0_active_minus1;
+   params.ipicparm.num_ref_idx_l1_active_minus1 = desc->num_ref_idx_l1_active_minus1;
+   params.iseqparm.log2_max_frame_num_minus4 = desc->log2_max_frame_num_minus4;
+   params.iseqparm.pic_order_cnt_type = desc->pic_order_cnt_type;
+   params.iseqparm.log2_max_pic_order_cnt_lsb_minus4 = desc->log2_max_pic_order_cnt_lsb_minus4;
+   params.iseqparm.delta_pic_order_always_zero_flag = desc->delta_pic_order_always_zero_flag;
+   params.iseqparm.direct_8x8_inference_flag = desc->direct_8x8_inference_flag;
+   params.ipicparm.entropy_coding_mode_flag = desc->entropy_coding_mode_flag;
+   params.ipicparm.pic_order_present_flag = desc->pic_order_present_flag;
+   params.ipicparm.deblocking_filter_control_present_flag = desc->deblocking_filter_control_present_flag;
+   params.ipicparm.redundant_pic_cnt_present_flag = desc->redundant_pic_cnt_present_flag;
+
+   memcpy(dec->bitstream->map, &params, sizeof(params));
+   for (i = 0; i < num_buffers; i++) {
+      assert(total_bytes + num_bytes[i] < dec->bitstream->size / 2 - 0x700);
+      memcpy(dec->bitstream->map + 0x700 + total_bytes, data[i], num_bytes[i]);
+      total_bytes += num_bytes[i];
+   }
+   memcpy(dec->bitstream->map + 0x700 + total_bytes, end, sizeof(end));
+   total_bytes += sizeof(end);
+   more_params[1] = total_bytes;
+   memcpy(dec->bitstream->map + 0x600, more_params, sizeof(more_params));
+
+   PUSH_SPACE(push, 5 + 21 + 3 + 2 + 4 + 2);
+   nouveau_pushbuf_refn(push, bo_refs, sizeof(bo_refs)/sizeof(bo_refs[0]));
+
+   /* Wait for the fence = 1 */
+   BEGIN_NV04(push, SUBC_BSP(0x10), 4);
+   PUSH_DATAh(push, dec->fence->offset);
+   PUSH_DATA (push, dec->fence->offset);
+   PUSH_DATA (push, 1);
+   PUSH_DATA (push, 1);
+
+   /* TODO: Use both halves of bitstream/vpring for alternating frames */
+
+   /* Kick off the BSP */
+   BEGIN_NV04(push, SUBC_BSP(0x400), 20);
+   PUSH_DATA (push, dec->bitstream->offset >> 8);
+   PUSH_DATA (push, (dec->bitstream->offset >> 8) + 7);
+   PUSH_DATA (push, dec->bitstream->size / 2 - 0x700);
+   PUSH_DATA (push, (dec->bitstream->offset >> 8) + 6);
+   PUSH_DATA (push, 1);
+   PUSH_DATA (push, dec->mbring->offset >> 8);
+   PUSH_DATA (push, dec->frame_size);
+   PUSH_DATA (push, (dec->mbring->offset + dec->frame_size) >> 8);
+   PUSH_DATA (push, dec->vpring->offset >> 8);
+   PUSH_DATA (push, dec->vpring->size / 2);
+   PUSH_DATA (push, dec->vpring_residual);
+   PUSH_DATA (push, dec->vpring_ctrl);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, dec->vpring_residual);
+   PUSH_DATA (push, dec->vpring_residual + dec->vpring_ctrl);
+   PUSH_DATA (push, dec->vpring_deblock);
+   PUSH_DATA (push, (dec->vpring->offset + dec->vpring_ctrl +
+                     dec->vpring_residual + dec->vpring_deblock) >> 8);
+   PUSH_DATA (push, 0x654321);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, 0x100008);
+
+   BEGIN_NV04(push, SUBC_BSP(0x620), 2);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, 0);
+
+   BEGIN_NV04(push, SUBC_BSP(0x300), 1);
+   PUSH_DATA (push, 0);
+
+   /* Write fence = 2, intr */
+   BEGIN_NV04(push, SUBC_BSP(0x610), 3);
+   PUSH_DATAh(push, dec->fence->offset);
+   PUSH_DATA (push, dec->fence->offset);
+   PUSH_DATA (push, 2);
+
+   BEGIN_NV04(push, SUBC_BSP(0x304), 1);
+   PUSH_DATA (push, 0x101);
+   PUSH_KICK (push);
+   return 0;
+}
diff --git a/src/gallium/drivers/nv50/nv84_video_vp.c b/src/gallium/drivers/nv50/nv84_video_vp.c
new file mode 100644
index 0000000..78d9a39
--- /dev/null
+++ b/src/gallium/drivers/nv50/nv84_video_vp.c
@@ -0,0 +1,547 @@
+/*
+ * Copyright 2013 Ilia Mirkin
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
+#include "nv84_video.h"
+
+#include "util/u_sse.h"
+
+struct h264_iparm1 {
+   uint8_t scaling_lists_4x4[6][16]; // 00
+   uint8_t scaling_lists_8x8[2][64]; // 60
+   uint32_t width; // e0
+   uint32_t height; // e4
+   uint64_t ref1_addrs[16]; // e8
+   uint64_t ref2_addrs[16]; // 168
+   uint32_t unk1e8;
+   uint32_t unk1ec;
+   uint32_t w1; // 1f0
+   uint32_t w2; // 1f4
+   uint32_t w3; // 1f8
+   uint32_t h1; // 1fc
+   uint32_t h2; // 200
+   uint32_t h3; // 204
+   uint32_t unk208;
+   uint32_t field_pic_flag;
+   uint32_t format;
+   uint32_t unk214;
+};
+
+struct h264_iparm2 {
+   uint32_t width; // 00
+   uint32_t height; // 04
+   uint32_t mbs; // 08
+   uint32_t w1; // 0c
+   uint32_t w2; // 10
+   uint32_t w3; // 14
+   uint32_t h1; // 18
+   uint32_t h2; // 1c
+   uint32_t h3; // 20
+   uint32_t unk24;
+   uint32_t unk28;
+   uint32_t top; // 2c
+   uint32_t bottom; // 30
+   uint32_t is_reference; // 34
+};
+
+void
+nv84_decoder_vp_h264(struct nv84_decoder *dec,
+                     struct pipe_h264_picture_desc *desc,
+                     struct nv84_video_buffer *dest)
+{
+   struct h264_iparm1 param1;
+   struct h264_iparm2 param2;
+   int i, width = align(dest->base.width, 16),
+      height = align(dest->base.height, 16);
+
+   struct nouveau_pushbuf *push = dec->vp_pushbuf;
+   struct nouveau_pushbuf_refn bo_refs[] = {
+      { dest->interlaced, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dest->full, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dec->vpring, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dec->mbring, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dec->vp_params, NOUVEAU_BO_RDWR | NOUVEAU_BO_GART },
+      { dec->fence, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+   };
+   int num_refs = sizeof(bo_refs)/sizeof(*bo_refs);
+   bool is_ref = desc->is_reference;
+
+   STATIC_ASSERT(sizeof(struct h264_iparm1) == 0x218);
+   STATIC_ASSERT(sizeof(struct h264_iparm2) == 0x38);
+
+   memset(&param1, 0, sizeof(param1));
+   memset(&param2, 0, sizeof(param2));
+
+   memcpy(&param1.scaling_lists_4x4, desc->scaling_lists_4x4,
+          sizeof(param1.scaling_lists_4x4));
+   memcpy(&param1.scaling_lists_8x8, desc->scaling_lists_8x8,
+          sizeof(param1.scaling_lists_8x8));
+
+   param1.width = width;
+   param1.w1 = param1.w2 = param1.w3 = align(width, 64);
+   param1.height = param1.h2 = height;
+   param1.h1 = param1.h3 = align(height, 32);
+   param1.format = 0x3231564e; /* 'NV12' */
+   param1.field_pic_flag = desc->field_pic_flag;
+
+   param2.width = width;
+   param2.w1 = param2.w2 = param2.w3 = param1.w1;
+   if (desc->field_pic_flag)
+      param2.height = align(height, 32) / 2;
+   else
+      param2.height = height;
+   param2.h1 = param2.h2 = align(height, 32);
+   param2.h3 = height;
+   param2.mbs = width * height >> 8;
+   if (desc->field_pic_flag) {
+      param2.top = desc->bottom_field_flag ? 2 : 1;
+      param2.bottom = desc->bottom_field_flag;
+   }
+   param2.is_reference = desc->is_reference;
+
+   PUSH_SPACE(push, 5 + 16 + 3 + 2 + 6 + (is_ref ? 2 : 0) + 3 + 2 + 4 + 2);
+
+   struct nouveau_bo *ref2_default = dest->full;
+
+   for (i = 0; i < 16; i++) {
+      struct nv84_video_buffer *buf = (struct nv84_video_buffer *)desc->ref[i];
+      struct nouveau_bo *bo1, *bo2;
+      if (buf) {
+         bo1 = buf->interlaced;
+         bo2 = buf->full;
+         if (i == 0)
+            ref2_default = buf->full;
+      } else {
+         bo1 = dest->interlaced;
+         bo2 = ref2_default;
+      }
+      param1.ref1_addrs[i] = bo1->offset;
+      param1.ref2_addrs[i] = bo2->offset;
+      struct nouveau_pushbuf_refn bo_refs[] = {
+         { bo1, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+         { bo2, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      };
+      nouveau_pushbuf_refn(push, bo_refs, sizeof(bo_refs)/sizeof(bo_refs[0]));
+   }
+
+   memcpy(dec->vp_params->map, &param1, sizeof(param1));
+   memcpy(dec->vp_params->map + 0x400, &param2, sizeof(param2));
+
+   nouveau_pushbuf_refn(push, bo_refs, num_refs);
+
+   /* Wait for BSP to have completed */
+   BEGIN_NV04(push, SUBC_VP(0x10), 4);
+   PUSH_DATAh(push, dec->fence->offset);
+   PUSH_DATA (push, dec->fence->offset);
+   PUSH_DATA (push, 2);
+   PUSH_DATA (push, 1); /* wait for sem == 2 */
+
+   /* VP step 1 */
+   BEGIN_NV04(push, SUBC_VP(0x400), 15);
+   PUSH_DATA (push, 1);
+   PUSH_DATA (push, param2.mbs);
+   PUSH_DATA (push, 0x3987654); /* each nibble probably a dma index */
+   PUSH_DATA (push, 0x55001); /* constant */
+   PUSH_DATA (push, dec->vp_params->offset >> 8);
+   PUSH_DATA (push, (dec->vpring->offset + dec->vpring_residual) >> 8);
+   PUSH_DATA (push, dec->vpring_ctrl);
+   PUSH_DATA (push, dec->vpring->offset >> 8);
+   PUSH_DATA (push, dec->bitstream->size / 2 - 0x700);
+   PUSH_DATA (push, (dec->mbring->offset + dec->mbring->size - 0x2000) >> 8);
+   PUSH_DATA (push, (dec->vpring->offset + dec->vpring_ctrl +
+                     dec->vpring_residual + dec->vpring_deblock) >> 8);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, 0x100008);
+   PUSH_DATA (push, dest->interlaced->offset >> 8);
+   PUSH_DATA (push, 0);
+
+   BEGIN_NV04(push, SUBC_VP(0x620), 2);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, 0);
+
+   BEGIN_NV04(push, SUBC_VP(0x300), 1);
+   PUSH_DATA (push, 0);
+
+   /* VP step 2 */
+   BEGIN_NV04(push, SUBC_VP(0x400), 5);
+   PUSH_DATA (push, 0x54530201);
+   PUSH_DATA (push, (dec->vp_params->offset >> 8) + 0x4);
+   PUSH_DATA (push, (dec->vpring->offset + dec->vpring_ctrl +
+                     dec->vpring_residual) >> 8);
+   PUSH_DATA (push, dest->interlaced->offset >> 8);
+   PUSH_DATA (push, dest->interlaced->offset >> 8);
+
+   if (is_ref) {
+      BEGIN_NV04(push, SUBC_VP(0x414), 1);
+      PUSH_DATA (push, dest->full->offset >> 8);
+   }
+
+   BEGIN_NV04(push, SUBC_VP(0x620), 2);
+   PUSH_DATAh(push, dec->vp_fw2_offset);
+   PUSH_DATA (push, dec->vp_fw2_offset);
+
+   BEGIN_NV04(push, SUBC_VP(0x300), 1);
+   PUSH_DATA (push, 0);
+
+   /* Set the semaphore back to 1 */
+   BEGIN_NV04(push, SUBC_VP(0x610), 3);
+   PUSH_DATAh(push, dec->fence->offset);
+   PUSH_DATA (push, dec->fence->offset);
+   PUSH_DATA (push, 1);
+
+   /* Write to the semaphore location, intr */
+   BEGIN_NV04(push, SUBC_VP(0x304), 1);
+   PUSH_DATA (push, 0x101);
+
+   for (i = 0; i < 2; i++) {
+      struct nv50_miptree *mt = nv50_miptree(dest->resources[i]);
+      mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
+   }
+
+   PUSH_KICK (push);
+}
+
+static INLINE int16_t inverse_quantize(int16_t val, uint8_t quant, int mpeg1) {
+   int16_t ret = val * quant / 16;
+   if (mpeg1 && ret) {
+      if (ret > 0)
+         ret = (ret - 1) | 1;
+      else
+         ret = (ret + 1) | 1;
+   }
+   if (ret < -2048)
+      ret = -2048;
+   else if (ret > 2047)
+      ret = 2047;
+   return ret;
+}
+
+struct mpeg12_mb_info {
+   uint32_t index;
+   uint8_t unk4;
+   uint8_t unk5;
+   uint16_t coded_block_pattern;
+   uint8_t block_counts[6];
+   uint16_t PMV[8];
+   uint16_t skipped;
+};
+
+void
+nv84_decoder_vp_mpeg12_mb(struct nv84_decoder *dec,
+                          struct pipe_mpeg12_picture_desc *desc,
+                          const struct pipe_mpeg12_macroblock *macrob)
+{
+   STATIC_ASSERT(sizeof(struct mpeg12_mb_info) == 32);
+
+   struct mpeg12_mb_info info = {0};
+   int i, sum = 0, mask, block_index, count;
+   const int16_t *blocks;
+   int intra = macrob->macroblock_type & PIPE_MPEG12_MB_TYPE_INTRA;
+   int motion = macrob->macroblock_type &
+      (PIPE_MPEG12_MB_TYPE_MOTION_FORWARD | PIPE_MPEG12_MB_TYPE_MOTION_BACKWARD);
+   const uint8_t *quant_matrix = intra ? dec->mpeg12_intra_matrix :
+      dec->mpeg12_non_intra_matrix;
+   int mpeg1 = dec->base.profile == PIPE_VIDEO_PROFILE_MPEG1;
+
+   info.index = macrob->y * mb(dec->base.width) + macrob->x;
+   info.unk4 = motion;
+   if (intra)
+      info.unk4 |= 1;
+   if (macrob->macroblock_modes.bits.dct_type)
+      info.unk4 |= 0x20;
+   info.unk5 = (macrob->motion_vertical_field_select << 4) |
+      (macrob->macroblock_modes.value & 0xf);
+   info.coded_block_pattern = macrob->coded_block_pattern;
+   if (motion) {
+      memcpy(info.PMV, macrob->PMV, sizeof(info.PMV));
+   }
+   blocks = macrob->blocks;
+   for (mask = 0x20, block_index = 0; mask > 0; mask >>= 1, block_index++) {
+      if ((macrob->coded_block_pattern & mask) == 0)
+         continue;
+
+      count = 0;
+
+      /*
+       * The observation here is that there are a lot of 0's, and things go
+       * a lot faster if one skips over them.
+       */
+
+#ifdef PIPE_ARCH_SSE
+/* This returns a 16-bit bit-mask, each 2 bits are both 1 or both 0, depending
+ * on whether the corresponding (16-bit) word in blocks is zero or non-zero. */
+#define wordmask(blocks, zero) \
+      (uint64_t)(_mm_movemask_epi8( \
+                       _mm_cmpeq_epi16( \
+                             zero, _mm_load_si128((__m128i *)(blocks)))))
+
+      __m128i zero = _mm_setzero_si128();
+
+      /* TODO: Look into doing the inverse quantization in terms of SSE
+       * operations unconditionally, when necessary. */
+      uint64_t bmask0 = wordmask(blocks, zero);
+      bmask0 |= wordmask(blocks + 8, zero) << 16;
+      bmask0 |= wordmask(blocks + 16, zero) << 32;
+      bmask0 |= wordmask(blocks + 24, zero) << 48;
+      uint64_t bmask1 = wordmask(blocks + 32, zero);
+      bmask1 |= wordmask(blocks + 40, zero) << 16;
+      bmask1 |= wordmask(blocks + 48, zero) << 32;
+      bmask1 |= wordmask(blocks + 56, zero) << 48;
+
+      /* The wordmask macro returns the inverse of what we want, since it
+       * returns a 1 for equal-to-zero. Invert. */
+      bmask0 = ~bmask0;
+      bmask1 = ~bmask1;
+
+      /* Note that the bitmask is actually sequences of 2 bits for each block
+       * index. This is because there is no movemask_epi16. That means that
+       * (a) ffs will never return 64, since the prev bit will always be set
+       * in that case, and (b) we need to do an extra bit shift. Or'ing the
+       * bitmasks together is faster than having a loop that computes them one
+       * at a time and processes them, on a Core i7-920. Trying to put bmask
+       * into an array and then looping also slows things down.
+       */
+
+      /* shift needs to be the same width as i, and unsigned so that / 2
+       * becomes a rshift operation */
+      uint32_t shift;
+      i = 0;
+
+      /* XXX avoid __builtin_ffsll as it translates into a (relatively)
+       * expensive function call on 32-bit, potentially losing out on the
+       * gains of using this approach. */
+
+      if (dec->base.entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
+         int16_t tmp;
+         while ((shift = __builtin_ffsll(bmask0))) {
+            i += (shift - 1) / 2;
+            bmask0 >>= shift - 1;
+            *dec->mpeg12_data++ = dec->zscan[i] * 2;
+            tmp = inverse_quantize(blocks[i], quant_matrix[i], mpeg1);
+            *dec->mpeg12_data++ = tmp;
+            sum += tmp;
+            count++;
+            i++;
+            bmask0 >>= 2;
+         }
+         i = 32;
+         while ((shift = __builtin_ffsll(bmask1))) {
+            i += (shift - 1) / 2;
+            bmask1 >>= shift - 1;
+            *dec->mpeg12_data++ = dec->zscan[i] * 2;
+            tmp = inverse_quantize(blocks[i], quant_matrix[i], mpeg1);
+            *dec->mpeg12_data++ = tmp;
+            sum += tmp;
+            count++;
+            i++;
+            bmask1 >>= 2;
+         }
+      } else {
+         while ((shift = __builtin_ffsll(bmask0))) {
+            i += (shift - 1) / 2;
+            bmask0 >>= shift - 1;
+            *dec->mpeg12_data++ = i * 2;
+            *dec->mpeg12_data++ = blocks[i];
+            count++;
+            i++;
+            bmask0 >>= 2;
+         }
+         i = 32;
+         while ((shift = __builtin_ffsll(bmask1))) {
+            i += (shift - 1) / 2;
+            bmask1 >>= shift - 1;
+            *dec->mpeg12_data++ = i * 2;
+            *dec->mpeg12_data++ = blocks[i];
+            count++;
+            i++;
+            bmask1 >>= 2;
+         }
+      }
+#undef wordmask
+#else
+
+      /*
+       * This loop looks ridiculously written... and it is. I tried a lot of
+       * different ways of achieving this scan, and this was the fastest, at
+       * least on a Core i7-920. Note that it's not necessary to skip the 0's,
+       * the firmware will deal with those just fine. But it's faster to skip
+       * them.
+       */
+      i = 0;
+      if (dec->base.entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
+         while (true) {
+            int16_t tmp;
+            // All the CPU time goes into this line.
+            while (likely(i < 64 && !(tmp = blocks[i]))) i++;
+            if (i >= 64) break;
+            *dec->mpeg12_data++ = dec->zscan[i] * 2;
+            tmp = inverse_quantize(tmp, quant_matrix[i], mpeg1);
+            *dec->mpeg12_data++ = tmp;
+            sum += tmp;
+            count++;
+            i++;
+         }
+      } else {
+         while (true) {
+            int16_t tmp;
+            // All the CPU time goes into this line.
+            while (likely(i < 64 && !(tmp = blocks[i]))) i++;
+            if (i >= 64) break;
+            *dec->mpeg12_data++ = i * 2;
+            *dec->mpeg12_data++ = tmp;
+            count++;
+            i++;
+         }
+      }
+
+#endif
+
+      if (dec->base.entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
+         if (!mpeg1 && (sum & 1) == 0) {
+            if (count && *(dec->mpeg12_data - 2) == 63 * 2) {
+               uint16_t *val = dec->mpeg12_data - 1;
+               if (*val & 1) *val -= 1;
+               else *val += 1;
+            } else {
+               *dec->mpeg12_data++ = 63 * 2;
+               *dec->mpeg12_data++ = 1;
+               count++;
+            }
+         }
+      }
+
+      if (count) {
+         *(dec->mpeg12_data - 2) |= 1;
+      } else {
+         *dec->mpeg12_data++ = 1;
+         *dec->mpeg12_data++ = 0;
+         count = 1;
+      }
+      info.block_counts[block_index] = count;
+      blocks += 64;
+   }
+
+   memcpy(dec->mpeg12_mb_info, &info, sizeof(info));
+   dec->mpeg12_mb_info += sizeof(info);
+
+   if (macrob->num_skipped_macroblocks) {
+      info.index++;
+      info.coded_block_pattern = 0;
+      info.skipped = macrob->num_skipped_macroblocks - 1;
+      memset(info.block_counts, 0, sizeof(info.block_counts));
+      memcpy(dec->mpeg12_mb_info, &info, sizeof(info));
+      dec->mpeg12_mb_info += sizeof(info);
+   }
+}
+
+struct mpeg12_header {
+   uint32_t luma_top_size; // 00
+   uint32_t luma_bottom_size; // 04
+   uint32_t chroma_top_size; // 08
+   uint32_t mbs; // 0c
+   uint32_t mb_info_size; // 10
+   uint32_t mb_width_minus1; // 14
+   uint32_t mb_height_minus1; // 18
+   uint32_t width; // 1c
+   uint32_t height; // 20
+   uint8_t progressive; // 24
+   uint8_t mocomp_only; // 25
+   uint8_t frames; // 26
+   uint8_t picture_structure; // 27
+   uint32_t unk28; // 28 -- 0x50100
+   uint32_t unk2c; // 2c
+   uint32_t pad[4 * 13];
+};
+
+void
+nv84_decoder_vp_mpeg12(struct nv84_decoder *dec,
+                       struct pipe_mpeg12_picture_desc *desc,
+                       struct nv84_video_buffer *dest)
+{
+   struct nouveau_pushbuf *push = dec->vp_pushbuf;
+   struct nv84_video_buffer *ref1 = (struct nv84_video_buffer *)desc->ref[0];
+   struct nv84_video_buffer *ref2 = (struct nv84_video_buffer *)desc->ref[1];
+   struct nouveau_pushbuf_refn bo_refs[] = {
+      { dest->interlaced, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { NULL, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { NULL, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
+      { dec->mpeg12_bo, NOUVEAU_BO_RDWR | NOUVEAU_BO_GART },
+   };
+   int i, num_refs = sizeof(bo_refs) / sizeof(*bo_refs);
+   struct mpeg12_header header = {0};
+   struct nv50_miptree *y = nv50_miptree(dest->resources[0]);
+   struct nv50_miptree *uv = nv50_miptree(dest->resources[1]);
+
+   STATIC_ASSERT(sizeof(struct mpeg12_header) == 0x100);
+
+   if (ref1 == NULL)
+      ref1 = dest;
+   if (ref2 == NULL)
+      ref2 = dest;
+   bo_refs[1].bo = ref1->interlaced;
+   bo_refs[2].bo = ref2->interlaced;
+
+   header.luma_top_size = y->layer_stride;
+   header.luma_bottom_size = y->layer_stride;
+   header.chroma_top_size = uv->layer_stride;
+   header.mbs = mb(dec->base.width) * mb(dec->base.height);
+   header.mb_info_size = dec->mpeg12_mb_info - dec->mpeg12_bo->map - 0x100;
+   header.mb_width_minus1 = mb(dec->base.width) - 1;
+   header.mb_height_minus1 = mb(dec->base.height) - 1;
+   header.width = align(dec->base.width, 16);
+   header.height = align(dec->base.height, 16);
+   header.progressive = desc->frame_pred_frame_dct;
+   header.frames = 1 + (desc->ref[0] != NULL) + (desc->ref[1] != NULL);
+   header.picture_structure = desc->picture_structure;
+   header.unk28 = 0x50100;
+
+   memcpy(dec->mpeg12_bo->map, &header, sizeof(header));
+
+   PUSH_SPACE(push, 10 + 3 + 2);
+
+   nouveau_pushbuf_refn(push, bo_refs, num_refs);
+
+   BEGIN_NV04(push, SUBC_VP(0x400), 9);
+   PUSH_DATA (push, 0x543210); /* each nibble possibly a dma index */
+   PUSH_DATA (push, 0x555001); /* constant */
+   PUSH_DATA (push, dec->mpeg12_bo->offset >> 8);
+   PUSH_DATA (push, (dec->mpeg12_bo->offset + 0x100) >> 8);
+   PUSH_DATA (push, (dec->mpeg12_bo->offset + 0x100 +
+                     align(0x20 * mb(dec->base.width) *
+                           mb(dec->base.height), 0x100)) >> 8);
+   PUSH_DATA (push, dest->interlaced->offset >> 8);
+   PUSH_DATA (push, ref1->interlaced->offset >> 8);
+   PUSH_DATA (push, ref2->interlaced->offset >> 8);
+   PUSH_DATA (push, 6 * 64 * 8 * header.mbs);
+
+   BEGIN_NV04(push, SUBC_VP(0x620), 2);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, 0);
+
+   BEGIN_NV04(push, SUBC_VP(0x300), 1);
+   PUSH_DATA (push, 0);
+
+   for (i = 0; i < 2; i++) {
+      struct nv50_miptree *mt = nv50_miptree(dest->resources[i]);
+      mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
+   }
+   PUSH_KICK (push);
+}
-- 
1.8.1.5
