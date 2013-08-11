From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 01/10] nvc0: refactor video buffer management
	logic into nouveau_vp3
Date: Sun, 11 Aug 2013 03:19:09 -0400
Message-ID: <1376205558-23540-2-git-send-email-imirkin@alum.mit.edu>
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

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/Makefile.sources    |   3 +-
 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 165 ++++++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_vp3_video.h |  38 ++++++
 src/gallium/drivers/nvc0/nvc0_video.c           | 135 +------------------
 src/gallium/drivers/nvc0/nvc0_video.h           |  29 ++---
 src/gallium/drivers/nvc0/nvc0_video_bsp.c       |   4 +-
 src/gallium/drivers/nvc0/nvc0_video_ppp.c       |   6 +-
 src/gallium/drivers/nvc0/nvc0_video_vp.c        |  38 +++---
 8 files changed, 243 insertions(+), 175 deletions(-)
 create mode 100644 src/gallium/drivers/nouveau/nouveau_vp3_video.c
 create mode 100644 src/gallium/drivers/nouveau/nouveau_vp3_video.h

diff --git a/src/gallium/drivers/nouveau/Makefile.sources b/src/gallium/drivers/nouveau/Makefile.sources
index cc9e68f..f7c9249 100644
--- a/src/gallium/drivers/nouveau/Makefile.sources
+++ b/src/gallium/drivers/nouveau/Makefile.sources
@@ -4,4 +4,5 @@ C_SOURCES := \
 	nouveau_mm.c \
 	nouveau_buffer.c \
 	nouveau_heap.c \
-	nouveau_video.c
+	nouveau_video.c \
+	nouveau_vp3_video.c
diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
new file mode 100644
index 0000000..a55c2e8
--- /dev/null
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -0,0 +1,165 @@
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
+#include "nouveau_screen.h"
+#include "nouveau_context.h"
+#include "nouveau_vp3_video.h"
+
+#include "util/u_video.h"
+#include "util/u_format.h"
+#include "util/u_sampler.h"
+
+static struct pipe_sampler_view **
+nouveau_vp3_video_buffer_sampler_view_planes(struct pipe_video_buffer *buffer)
+{
+   struct nouveau_vp3_video_buffer *buf = (struct nouveau_vp3_video_buffer *)buffer;
+   return buf->sampler_view_planes;
+}
+
+static struct pipe_sampler_view **
+nouveau_vp3_video_buffer_sampler_view_components(struct pipe_video_buffer *buffer)
+{
+   struct nouveau_vp3_video_buffer *buf = (struct nouveau_vp3_video_buffer *)buffer;
+   return buf->sampler_view_components;
+}
+
+static struct pipe_surface **
+nouveau_vp3_video_buffer_surfaces(struct pipe_video_buffer *buffer)
+{
+   struct nouveau_vp3_video_buffer *buf = (struct nouveau_vp3_video_buffer *)buffer;
+   return buf->surfaces;
+}
+
+static void
+nouveau_vp3_video_buffer_destroy(struct pipe_video_buffer *buffer)
+{
+   struct nouveau_vp3_video_buffer *buf = (struct nouveau_vp3_video_buffer *)buffer;
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
+   FREE(buffer);
+}
+
+struct pipe_video_buffer *
+nouveau_vp3_video_buffer_create(struct pipe_context *pipe,
+                         const struct pipe_video_buffer *templat,
+                         int flags)
+{
+   struct nouveau_vp3_video_buffer *buffer;
+   struct pipe_resource templ;
+   unsigned i, j, component;
+   struct pipe_sampler_view sv_templ;
+   struct pipe_surface surf_templ;
+
+   assert(templat->interlaced);
+   if (getenv("XVMC_VL") || templat->buffer_format != PIPE_FORMAT_NV12)
+      return vl_video_buffer_create(pipe, templat);
+
+   assert(templat->chroma_format == PIPE_VIDEO_CHROMA_FORMAT_420);
+
+   buffer = CALLOC_STRUCT(nouveau_vp3_video_buffer);
+   if (!buffer)
+      return NULL;
+
+   buffer->base.buffer_format = templat->buffer_format;
+   buffer->base.context = pipe;
+   buffer->base.destroy = nouveau_vp3_video_buffer_destroy;
+   buffer->base.chroma_format = templat->chroma_format;
+   buffer->base.width = templat->width;
+   buffer->base.height = templat->height;
+   buffer->base.get_sampler_view_planes = nouveau_vp3_video_buffer_sampler_view_planes;
+   buffer->base.get_sampler_view_components = nouveau_vp3_video_buffer_sampler_view_components;
+   buffer->base.get_surfaces = nouveau_vp3_video_buffer_surfaces;
+   buffer->base.interlaced = true;
+
+   memset(&templ, 0, sizeof(templ));
+   templ.target = PIPE_TEXTURE_2D_ARRAY;
+   templ.depth0 = 1;
+   templ.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET;
+   templ.format = PIPE_FORMAT_R8_UNORM;
+   templ.width0 = buffer->base.width;
+   templ.height0 = (buffer->base.height + 1)/2;
+   templ.flags = flags;
+   templ.array_size = 2;
+
+   buffer->resources[0] = pipe->screen->resource_create(pipe->screen, &templ);
+   if (!buffer->resources[0])
+      goto error;
+
+   templ.format = PIPE_FORMAT_R8G8_UNORM;
+   buffer->num_planes = 2;
+   templ.width0 = (templ.width0 + 1) / 2;
+   templ.height0 = (templ.height0 + 1) / 2;
+   for (i = 1; i < buffer->num_planes; ++i) {
+      buffer->resources[i] = pipe->screen->resource_create(pipe->screen, &templ);
+      if (!buffer->resources[i])
+         goto error;
+   }
+
+   memset(&sv_templ, 0, sizeof(sv_templ));
+   for (component = 0, i = 0; i < buffer->num_planes; ++i ) {
+      struct pipe_resource *res = buffer->resources[i];
+      unsigned nr_components = util_format_get_nr_components(res->format);
+
+      u_sampler_view_default_template(&sv_templ, res, res->format);
+      buffer->sampler_view_planes[i] = pipe->create_sampler_view(pipe, res, &sv_templ);
+      if (!buffer->sampler_view_planes[i])
+         goto error;
+
+      for (j = 0; j < nr_components; ++j, ++component) {
+         sv_templ.swizzle_r = sv_templ.swizzle_g = sv_templ.swizzle_b = PIPE_SWIZZLE_RED + j;
+         sv_templ.swizzle_a = PIPE_SWIZZLE_ONE;
+
+         buffer->sampler_view_components[component] = pipe->create_sampler_view(pipe, res, &sv_templ);
+         if (!buffer->sampler_view_components[component])
+            goto error;
+      }
+  }
+
+   memset(&surf_templ, 0, sizeof(surf_templ));
+   for (j = 0; j < buffer->num_planes; ++j) {
+      surf_templ.format = buffer->resources[j]->format;
+      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 0;
+      buffer->surfaces[j * 2] = pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
+      if (!buffer->surfaces[j * 2])
+         goto error;
+
+      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 1;
+      buffer->surfaces[j * 2 + 1] = pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
+      if (!buffer->surfaces[j * 2 + 1])
+         goto error;
+   }
+
+   return &buffer->base;
+
+error:
+   nouveau_vp3_video_buffer_destroy(&buffer->base);
+   return NULL;
+}
diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.h b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
new file mode 100644
index 0000000..bff5d76
--- /dev/null
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
@@ -0,0 +1,38 @@
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
+#include "pipe/p_defines.h"
+#include "vl/vl_video_buffer.h"
+
+struct nouveau_vp3_video_buffer {
+   struct pipe_video_buffer base;
+   unsigned num_planes, valid_ref;
+   struct pipe_resource *resources[VL_NUM_COMPONENTS];
+   struct pipe_sampler_view *sampler_view_planes[VL_NUM_COMPONENTS];
+   struct pipe_sampler_view *sampler_view_components[VL_NUM_COMPONENTS];
+   struct pipe_surface *surfaces[VL_NUM_COMPONENTS * 2];
+};
+
+struct pipe_video_buffer *
+nouveau_vp3_video_buffer_create(struct pipe_context *pipe,
+                                const struct pipe_video_buffer *templat,
+                                int flags);
diff --git a/src/gallium/drivers/nvc0/nvc0_video.c b/src/gallium/drivers/nvc0/nvc0_video.c
index 7cc086a..626d0d4 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.c
+++ b/src/gallium/drivers/nvc0/nvc0_video.c
@@ -63,12 +63,12 @@ nvc0_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
                               const unsigned *num_bytes)
 {
    struct nvc0_decoder *dec = (struct nvc0_decoder *)decoder;
-   struct nvc0_video_buffer *target = (struct nvc0_video_buffer *)video_target;
+   struct nouveau_vp3_video_buffer *target = (struct nouveau_vp3_video_buffer *)video_target;
    uint32_t comm_seq = ++dec->fence_seq;
    union pipe_desc desc;
 
    unsigned vp_caps, is_ref, ret;
-   struct nvc0_video_buffer *refs[16] = {};
+   struct nouveau_vp3_video_buffer *refs[16] = {};
 
    desc.base = picture;
 
@@ -506,137 +506,10 @@ fail:
    return NULL;
 }
 
-static struct pipe_sampler_view **
-nvc0_video_buffer_sampler_view_planes(struct pipe_video_buffer *buffer)
-{
-   struct nvc0_video_buffer *buf = (struct nvc0_video_buffer *)buffer;
-   return buf->sampler_view_planes;
-}
-
-static struct pipe_sampler_view **
-nvc0_video_buffer_sampler_view_components(struct pipe_video_buffer *buffer)
-{
-   struct nvc0_video_buffer *buf = (struct nvc0_video_buffer *)buffer;
-   return buf->sampler_view_components;
-}
-
-static struct pipe_surface **
-nvc0_video_buffer_surfaces(struct pipe_video_buffer *buffer)
-{
-   struct nvc0_video_buffer *buf = (struct nvc0_video_buffer *)buffer;
-   return buf->surfaces;
-}
-
-static void
-nvc0_video_buffer_destroy(struct pipe_video_buffer *buffer)
-{
-   struct nvc0_video_buffer *buf = (struct nvc0_video_buffer *)buffer;
-   unsigned i;
-
-   assert(buf);
-
-   for (i = 0; i < VL_NUM_COMPONENTS; ++i) {
-      pipe_resource_reference(&buf->resources[i], NULL);
-      pipe_sampler_view_reference(&buf->sampler_view_planes[i], NULL);
-      pipe_sampler_view_reference(&buf->sampler_view_components[i], NULL);
-      pipe_surface_reference(&buf->surfaces[i * 2], NULL);
-      pipe_surface_reference(&buf->surfaces[i * 2 + 1], NULL);
-   }
-   FREE(buffer);
-}
-
 struct pipe_video_buffer *
 nvc0_video_buffer_create(struct pipe_context *pipe,
                          const struct pipe_video_buffer *templat)
 {
-   struct nvc0_video_buffer *buffer;
-   struct pipe_resource templ;
-   unsigned i, j, component;
-   struct pipe_sampler_view sv_templ;
-   struct pipe_surface surf_templ;
-
-   assert(templat->interlaced);
-   if (getenv("XVMC_VL") || templat->buffer_format != PIPE_FORMAT_NV12)
-      return vl_video_buffer_create(pipe, templat);
-
-   assert(templat->chroma_format == PIPE_VIDEO_CHROMA_FORMAT_420);
-
-   buffer = CALLOC_STRUCT(nvc0_video_buffer);
-   if (!buffer)
-      return NULL;
-
-   buffer->base.buffer_format = templat->buffer_format;
-   buffer->base.context = pipe;
-   buffer->base.destroy = nvc0_video_buffer_destroy;
-   buffer->base.chroma_format = templat->chroma_format;
-   buffer->base.width = templat->width;
-   buffer->base.height = templat->height;
-   buffer->base.get_sampler_view_planes = nvc0_video_buffer_sampler_view_planes;
-   buffer->base.get_sampler_view_components = nvc0_video_buffer_sampler_view_components;
-   buffer->base.get_surfaces = nvc0_video_buffer_surfaces;
-   buffer->base.interlaced = true;
-
-   memset(&templ, 0, sizeof(templ));
-   templ.target = PIPE_TEXTURE_2D_ARRAY;
-   templ.depth0 = 1;
-   templ.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET;
-   templ.format = PIPE_FORMAT_R8_UNORM;
-   templ.width0 = buffer->base.width;
-   templ.height0 = (buffer->base.height + 1)/2;
-   templ.flags = NVC0_RESOURCE_FLAG_VIDEO;
-   templ.array_size = 2;
-
-   buffer->resources[0] = pipe->screen->resource_create(pipe->screen, &templ);
-   if (!buffer->resources[0])
-      goto error;
-
-   templ.format = PIPE_FORMAT_R8G8_UNORM;
-   buffer->num_planes = 2;
-   templ.width0 = (templ.width0 + 1) / 2;
-   templ.height0 = (templ.height0 + 1) / 2;
-   for (i = 1; i < buffer->num_planes; ++i) {
-      buffer->resources[i] = pipe->screen->resource_create(pipe->screen, &templ);
-      if (!buffer->resources[i])
-         goto error;
-   }
-
-   memset(&sv_templ, 0, sizeof(sv_templ));
-   for (component = 0, i = 0; i < buffer->num_planes; ++i ) {
-      struct pipe_resource *res = buffer->resources[i];
-      unsigned nr_components = util_format_get_nr_components(res->format);
-
-      u_sampler_view_default_template(&sv_templ, res, res->format);
-      buffer->sampler_view_planes[i] = pipe->create_sampler_view(pipe, res, &sv_templ);
-      if (!buffer->sampler_view_planes[i])
-         goto error;
-
-      for (j = 0; j < nr_components; ++j, ++component) {
-         sv_templ.swizzle_r = sv_templ.swizzle_g = sv_templ.swizzle_b = PIPE_SWIZZLE_RED + j;
-         sv_templ.swizzle_a = PIPE_SWIZZLE_ONE;
-
-         buffer->sampler_view_components[component] = pipe->create_sampler_view(pipe, res, &sv_templ);
-         if (!buffer->sampler_view_components[component])
-            goto error;
-      }
-  }
-
-   memset(&surf_templ, 0, sizeof(surf_templ));
-   for (j = 0; j < buffer->num_planes; ++j) {
-      surf_templ.format = buffer->resources[j]->format;
-      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 0;
-      buffer->surfaces[j * 2] = pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
-      if (!buffer->surfaces[j * 2])
-         goto error;
-
-      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 1;
-      buffer->surfaces[j * 2 + 1] = pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
-      if (!buffer->surfaces[j * 2 + 1])
-         goto error;
-   }
-
-   return &buffer->base;
-
-error:
-   nvc0_video_buffer_destroy(&buffer->base);
-   return NULL;
+   return nouveau_vp3_video_buffer_create(
+         pipe, templat, NVC0_RESOURCE_FLAG_VIDEO);
 }
diff --git a/src/gallium/drivers/nvc0/nvc0_video.h b/src/gallium/drivers/nvc0/nvc0_video.h
index aed1424..271ed5c 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.h
+++ b/src/gallium/drivers/nvc0/nvc0_video.h
@@ -22,9 +22,9 @@
 
 #include "nvc0_context.h"
 #include "nvc0_screen.h"
+#include "nouveau/nouveau_vp3_video.h"
 
 #include "vl/vl_decoder.h"
-#include "vl/vl_video_buffer.h"
 #include "vl/vl_types.h"
 
 #include "util/u_video.h"
@@ -53,15 +53,6 @@ union pipe_desc {
    struct pipe_h264_picture_desc *h264;
 };
 
-struct nvc0_video_buffer {
-   struct pipe_video_buffer base;
-   unsigned num_planes, valid_ref;
-   struct pipe_resource *resources[VL_NUM_COMPONENTS];
-   struct pipe_sampler_view *sampler_view_planes[VL_NUM_COMPONENTS];
-   struct pipe_sampler_view *sampler_view_components[VL_NUM_COMPONENTS];
-   struct pipe_surface *surfaces[VL_NUM_COMPONENTS * 2];
-};
-
 struct nvc0_decoder {
    struct pipe_video_decoder base;
    struct nouveau_client *client;
@@ -105,7 +96,7 @@ struct nvc0_decoder {
    // and give shaders a chance to run as well.
 
    struct {
-      struct nvc0_video_buffer *vidbuf;
+      struct nouveau_vp3_video_buffer *vidbuf;
       unsigned last_used;
       unsigned field_pic_flag : 1;
       unsigned decoded_top : 1;
@@ -151,7 +142,7 @@ static INLINE uint32_t mb_half(uint32_t coord)
 }
 
 static INLINE uint64_t
-nvc0_video_addr(struct nvc0_decoder *dec, struct nvc0_video_buffer *target)
+nvc0_video_addr(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *target)
 {
    uint64_t ret;
    if (target)
@@ -197,25 +188,25 @@ nvc0_decoder_inter_sizes(struct nvc0_decoder *dec, uint32_t slice_count,
 
 extern unsigned
 nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
-                 struct nvc0_video_buffer *target,
+                 struct nouveau_vp3_video_buffer *target,
                  unsigned comm_seq, unsigned num_buffers,
                  const void *const *data, const unsigned *num_bytes,
                  unsigned *vp_caps, unsigned *is_ref,
-                 struct nvc0_video_buffer *refs[16]);
+                 struct nouveau_vp3_video_buffer *refs[16]);
 
 extern void nvc0_decoder_vp_caps(struct nvc0_decoder *dec,
                                  union pipe_desc desc,
-                                 struct nvc0_video_buffer *target,
+                                 struct nouveau_vp3_video_buffer *target,
                                  unsigned comm_seq,
                                  unsigned *caps, unsigned *is_ref,
-                                 struct nvc0_video_buffer *refs[16]);
+                                 struct nouveau_vp3_video_buffer *refs[16]);
 
 extern void
 nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
-                struct nvc0_video_buffer *target, unsigned comm_seq,
+                struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                 unsigned caps, unsigned is_ref,
-                struct nvc0_video_buffer *refs[16]);
+                struct nouveau_vp3_video_buffer *refs[16]);
 
 extern void
 nvc0_decoder_ppp(struct nvc0_decoder *dec, union pipe_desc desc,
-                 struct nvc0_video_buffer *target, unsigned comm_seq);
+                 struct nouveau_vp3_video_buffer *target, unsigned comm_seq);
diff --git a/src/gallium/drivers/nvc0/nvc0_video_bsp.c b/src/gallium/drivers/nvc0/nvc0_video_bsp.c
index 450dc2b..8f93861 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_bsp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_bsp.c
@@ -241,11 +241,11 @@ static void dump_comm_bsp(struct comm *comm)
 
 unsigned
 nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
-                 struct nvc0_video_buffer *target,
+                 struct nouveau_vp3_video_buffer *target,
                  unsigned comm_seq, unsigned num_buffers,
                  const void *const *data, const unsigned *num_bytes,
                  unsigned *vp_caps, unsigned *is_ref,
-                 struct nvc0_video_buffer *refs[16])
+                 struct nouveau_vp3_video_buffer *refs[16])
 {
    struct nouveau_pushbuf *push = dec->pushbuf[0];
    enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
diff --git a/src/gallium/drivers/nvc0/nvc0_video_ppp.c b/src/gallium/drivers/nvc0/nvc0_video_ppp.c
index efa2527..823e360 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_ppp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_ppp.c
@@ -23,7 +23,7 @@
 #include "nvc0_video.h"
 
 static void
-nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nvc0_video_buffer *target, uint32_t low700) {
+nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *target, uint32_t low700) {
    struct nouveau_pushbuf *push = dec->pushbuf[2];
 
    uint32_t stride_in = mb(dec->base.width);
@@ -73,7 +73,7 @@ nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nvc0_video_buffer *targe
 }
 
 static uint32_t
-nvc0_decoder_vc1_ppp(struct nvc0_decoder *dec, struct pipe_vc1_picture_desc *desc, struct nvc0_video_buffer *target) {
+nvc0_decoder_vc1_ppp(struct nvc0_decoder *dec, struct pipe_vc1_picture_desc *desc, struct nouveau_vp3_video_buffer *target) {
    struct nouveau_pushbuf *push = dec->pushbuf[2];
 
    nvc0_decoder_setup_ppp(dec, target, 0x1412);
@@ -89,7 +89,7 @@ nvc0_decoder_vc1_ppp(struct nvc0_decoder *dec, struct pipe_vc1_picture_desc *des
 }
 
 void
-nvc0_decoder_ppp(struct nvc0_decoder *dec, union pipe_desc desc, struct nvc0_video_buffer *target, unsigned comm_seq) {
+nvc0_decoder_ppp(struct nvc0_decoder *dec, union pipe_desc desc, struct nouveau_vp3_video_buffer *target, unsigned comm_seq) {
    enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
    struct nouveau_pushbuf *push = dec->pushbuf[2];
    unsigned ppp_caps = 0x10;
diff --git a/src/gallium/drivers/nvc0/nvc0_video_vp.c b/src/gallium/drivers/nvc0/nvc0_video_vp.c
index c5d4f94..7c1691c 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_vp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_vp.c
@@ -170,7 +170,7 @@ struct h264_picparm_vp { // 700..a00
 };
 
 static void
-nvc0_decoder_handle_references(struct nvc0_decoder *dec, struct nvc0_video_buffer *refs[16], unsigned seq, struct nvc0_video_buffer *target)
+nvc0_decoder_handle_references(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *refs[16], unsigned seq, struct nouveau_vp3_video_buffer *target)
 {
    unsigned h264 = u_reduce_video_profile(dec->base.profile) == PIPE_VIDEO_CODEC_MPEG4_AVC;
    unsigned i, idx, empty_spot = dec->base.max_references + 1;
@@ -221,7 +221,7 @@ nvc0_decoder_handle_references(struct nvc0_decoder *dec, struct nvc0_video_buffe
 }
 
 static void
-nvc0_decoder_kick_ref(struct nvc0_decoder *dec, struct nvc0_video_buffer *target)
+nvc0_decoder_kick_ref(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *target)
 {
    dec->refs[target->valid_ref].vidbuf = NULL;
    dec->refs[target->valid_ref].last_used = 0;
@@ -231,7 +231,7 @@ nvc0_decoder_kick_ref(struct nvc0_decoder *dec, struct nvc0_video_buffer *target
 static uint32_t
 nvc0_decoder_fill_picparm_mpeg12_vp(struct nvc0_decoder *dec,
                                     struct pipe_mpeg12_picture_desc *desc,
-                                    struct nvc0_video_buffer *refs[16],
+                                    struct nouveau_vp3_video_buffer *refs[16],
                                     unsigned *is_ref,
                                     char *map)
 {
@@ -272,15 +272,15 @@ nvc0_decoder_fill_picparm_mpeg12_vp(struct nvc0_decoder *dec,
    memcpy(pic_vp->intra_quantizer_matrix, desc->intra_matrix, 0x40);
    memcpy(pic_vp->non_intra_quantizer_matrix, desc->non_intra_matrix, 0x40);
    memcpy(map, pic_vp, sizeof(*pic_vp));
-   refs[0] = (struct nvc0_video_buffer *)desc->ref[0];
-   refs[!!refs[0]] = (struct nvc0_video_buffer *)desc->ref[1];
+   refs[0] = (struct nouveau_vp3_video_buffer *)desc->ref[0];
+   refs[!!refs[0]] = (struct nouveau_vp3_video_buffer *)desc->ref[1];
    return ret | (dec->base.profile != PIPE_VIDEO_PROFILE_MPEG1);
 }
 
 static uint32_t
 nvc0_decoder_fill_picparm_mpeg4_vp(struct nvc0_decoder *dec,
                                    struct pipe_mpeg4_picture_desc *desc,
-                                   struct nvc0_video_buffer *refs[16],
+                                   struct nouveau_vp3_video_buffer *refs[16],
                                    unsigned *is_ref,
                                    char *map)
 {
@@ -320,15 +320,15 @@ nvc0_decoder_fill_picparm_mpeg4_vp(struct nvc0_decoder *dec,
    memcpy(pic_vp->intra, desc->intra_matrix, 0x40);
    memcpy(pic_vp->non_intra, desc->non_intra_matrix, 0x40);
    memcpy(map, pic_vp, sizeof(*pic_vp));
-   refs[0] = (struct nvc0_video_buffer *)desc->ref[0];
-   refs[!!refs[0]] = (struct nvc0_video_buffer *)desc->ref[1];
+   refs[0] = (struct nouveau_vp3_video_buffer *)desc->ref[0];
+   refs[!!refs[0]] = (struct nouveau_vp3_video_buffer *)desc->ref[1];
    return ret;
 }
 
 static uint32_t
 nvc0_decoder_fill_picparm_h264_vp(struct nvc0_decoder *dec,
                                   const struct pipe_h264_picture_desc *d,
-                                  struct nvc0_video_buffer *refs[16],
+                                  struct nouveau_vp3_video_buffer *refs[16],
                                   unsigned *is_ref,
                                   char *map)
 {
@@ -377,7 +377,7 @@ nvc0_decoder_fill_picparm_h264_vp(struct nvc0_decoder *dec,
    for (i = 0; i < d->num_ref_frames; ++i) {
       if (!d->ref[i])
          break;
-      refs[j] = (struct nvc0_video_buffer *)d->ref[i];
+      refs[j] = (struct nouveau_vp3_video_buffer *)d->ref[i];
       h->refs[j].fifo_idx = j + 1;
       h->refs[j].tmp_idx = refs[j]->valid_ref;
       h->refs[j].field_order_cnt[0] = d->field_order_cnt_list[i][0];
@@ -412,8 +412,8 @@ nvc0_decoder_fill_picparm_h264_vp(struct nvc0_decoder *dec,
 static void
 nvc0_decoder_fill_picparm_h264_vp_refs(struct nvc0_decoder *dec,
                                        struct pipe_h264_picture_desc *d,
-                                       struct nvc0_video_buffer *refs[16],
-                                       struct nvc0_video_buffer *target,
+                                       struct nouveau_vp3_video_buffer *refs[16],
+                                       struct nouveau_vp3_video_buffer *target,
                                        char *map)
 {
    struct h264_picparm_vp *h = (struct h264_picparm_vp *)map;
@@ -431,7 +431,7 @@ nvc0_decoder_fill_picparm_h264_vp_refs(struct nvc0_decoder *dec,
 static uint32_t
 nvc0_decoder_fill_picparm_vc1_vp(struct nvc0_decoder *dec,
                                  struct pipe_vc1_picture_desc *d,
-                                 struct nvc0_video_buffer *refs[16],
+                                 struct nouveau_vp3_video_buffer *refs[16],
                                  unsigned *is_ref,
                                  char *map)
 {
@@ -455,8 +455,8 @@ nvc0_decoder_fill_picparm_vc1_vp(struct nvc0_decoder *dec,
    vc->overlap = d->overlap;
    vc->quantizer = d->quantizer;
    vc->u36 = 0; // ? No idea what this one is..
-   refs[0] = (struct nvc0_video_buffer *)d->ref[0];
-   refs[!!refs[0]] = (struct nvc0_video_buffer *)d->ref[1];
+   refs[0] = (struct nouveau_vp3_video_buffer *)d->ref[0];
+   refs[!!refs[0]] = (struct nouveau_vp3_video_buffer *)d->ref[1];
    return 0x12;
 }
 
@@ -494,9 +494,9 @@ static void dump_comm_vp(struct nvc0_decoder *dec, struct comm *comm, u32 comm_s
 #endif
 
 void nvc0_decoder_vp_caps(struct nvc0_decoder *dec, union pipe_desc desc,
-                          struct nvc0_video_buffer *target, unsigned comm_seq,
+                          struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                           unsigned *caps, unsigned *is_ref,
-                          struct nvc0_video_buffer *refs[16])
+                          struct nouveau_vp3_video_buffer *refs[16])
 {
    struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NVC0_VIDEO_QDEPTH];
    enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
@@ -528,9 +528,9 @@ void nvc0_decoder_vp_caps(struct nvc0_decoder *dec, union pipe_desc desc,
 
 void
 nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
-                struct nvc0_video_buffer *target, unsigned comm_seq,
+                struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                 unsigned caps, unsigned is_ref,
-                struct nvc0_video_buffer *refs[16])
+                struct nouveau_vp3_video_buffer *refs[16])
 {
    struct nouveau_pushbuf *push = dec->pushbuf[1];
    uint32_t bsp_addr, comm_addr, inter_addr, ucode_addr, pic_addr[17], last_addr, null_addr;
-- 
1.8.1.5
