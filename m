From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 03/10] nvc0: move nvc0_decoder into nouveau,
	rename to nouveau_vp3_decoder
Date: Sun, 11 Aug 2013 03:19:11 -0400
Message-ID: <1376205558-23540-4-git-send-email-imirkin@alum.mit.edu>
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
 src/gallium/drivers/nouveau/nouveau_vp3_video.h | 160 +++++++++++++++++++++++
 src/gallium/drivers/nvc0/nvc0_video.c           |  22 ++--
 src/gallium/drivers/nvc0/nvc0_video.h           | 165 +-----------------------
 src/gallium/drivers/nvc0/nvc0_video_bsp.c       |  28 ++--
 src/gallium/drivers/nvc0/nvc0_video_ppp.c       |  16 +--
 src/gallium/drivers/nvc0/nvc0_video_vp.c        |  60 ++++-----
 6 files changed, 227 insertions(+), 224 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.h b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
index bff5d76..7322138 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.h
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
@@ -21,8 +21,11 @@
  */
 
 #include "pipe/p_defines.h"
+
 #include "vl/vl_video_buffer.h"
 
+#include "util/u_video.h"
+
 struct nouveau_vp3_video_buffer {
    struct pipe_video_buffer base;
    unsigned num_planes, valid_ref;
@@ -32,6 +35,163 @@ struct nouveau_vp3_video_buffer {
    struct pipe_surface *surfaces[VL_NUM_COMPONENTS * 2];
 };
 
+#define SLICE_SIZE 0x200
+#define VP_OFFSET 0x200
+#define COMM_OFFSET 0x500
+
+#define NOUVEAU_VP3_DEBUG_FENCE 0
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+# define NOUVEAU_VP3_VIDEO_QDEPTH 1
+#else
+# define NOUVEAU_VP3_VIDEO_QDEPTH 2
+#endif
+
+#define SUBC_BSP(m) dec->bsp_idx, (m)
+#define SUBC_VP(m) dec->vp_idx, (m)
+#define SUBC_PPP(m) dec->ppp_idx, (m)
+
+union pipe_desc {
+   struct pipe_picture_desc *base;
+   struct pipe_mpeg12_picture_desc *mpeg12;
+   struct pipe_mpeg4_picture_desc *mpeg4;
+   struct pipe_vc1_picture_desc *vc1;
+   struct pipe_h264_picture_desc *h264;
+};
+
+struct nouveau_vp3_decoder {
+   struct pipe_video_decoder base;
+   struct nouveau_client *client;
+   struct nouveau_object *channel[3], *bsp, *vp, *ppp;
+   struct nouveau_pushbuf *pushbuf[3];
+
+#if NOUVEAU_VP3_DEBUG_FENCE
+   /* dump fence and comm, as needed.. */
+   unsigned *fence_map;
+   struct comm *comm;
+
+   struct nouveau_bo *fence_bo;
+#endif
+
+   struct nouveau_bo *fw_bo, *bitplane_bo;
+
+   // array size max_references + 2, contains unpostprocessed images
+   // added at the end of ref_bo is a tmp array
+   // tmp is an array for h264, with each member being used for a ref frame or current
+   // target.. size = (((mb(w)*((mb(h)+1)&~1))+3)>>2)<<8 * (max_references+1)
+   // for other codecs, it simply seems that size = w*h is enough
+   // unsure what it's supposed to contain..
+   struct nouveau_bo *ref_bo;
+
+   struct nouveau_bo *inter_bo[2];
+
+   struct nouveau_bo *bsp_bo[NOUVEAU_VP3_VIDEO_QDEPTH];
+
+   // bo's used by each cycle:
+
+   // bsp_bo: contains raw bitstream data and parameters for BSP and VP.
+   // inter_bo: contains data shared between BSP and VP
+   // ref_bo: reference image data, used by PPP and VP
+   // bitplane_bo: contain bitplane data (similar to ref_bo), used by BSP only
+   // fw_bo: used by VP only.
+
+   // Needed amount of copies in optimal case:
+   // 2 copies of inter_bo, VP would process the last inter_bo, while BSP is
+   // writing out a new set.
+   // NOUVEAU_VP3_VIDEO_QDEPTH copies of bsp_bo. We don't want to block the
+   // pipeline ever, and give shaders a chance to run as well.
+
+   struct {
+      struct nouveau_vp3_video_buffer *vidbuf;
+      unsigned last_used;
+      unsigned field_pic_flag : 1;
+      unsigned decoded_top : 1;
+      unsigned decoded_bottom : 1;
+   } refs[17];
+   unsigned fence_seq, fw_sizes, last_frame_num, tmp_stride, ref_stride;
+
+   unsigned bsp_idx, vp_idx, ppp_idx;
+};
+
+struct comm {
+	uint32_t bsp_cur_index; // 000
+	uint32_t byte_ofs; // 004
+	uint32_t status[0x10]; // 008
+	uint32_t pos[0x10]; // 048
+	uint8_t pad[0x100 - 0x88]; // 0a0 bool comm_encrypted
+
+	uint32_t pvp_cur_index; // 100
+	uint32_t acked_byte_ofs; // 104
+	uint32_t status_vp[0x10]; // 108
+	uint16_t mb_y[0x10]; //148
+	uint32_t pvp_stage; // 168 0xeeXX
+	uint16_t parse_endpos_index; // 16c
+	uint16_t irq_index; // 16e
+	uint8_t  irq_470[0x10]; // 170
+	uint32_t irq_pos[0x10]; // 180
+	uint32_t parse_endpos[0x10]; // 1c0
+};
+
+static INLINE uint32_t nouveau_vp3_video_align(uint32_t h)
+{
+   return ((h+0x3f)&~0x3f);
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
+static INLINE uint64_t
+nouveau_vp3_video_addr(struct nouveau_vp3_decoder *dec, struct nouveau_vp3_video_buffer *target)
+{
+   uint64_t ret;
+   if (target)
+      ret = dec->ref_stride * target->valid_ref;
+   else
+      ret = dec->ref_stride * (dec->base.max_references+1);
+   return dec->ref_bo->offset + ret;
+}
+
+static INLINE void
+nouveau_vp3_ycbcr_offsets(struct nouveau_vp3_decoder *dec, uint32_t *y2,
+                          uint32_t *cbcr, uint32_t *cbcr2)
+{
+   uint32_t w = mb(dec->base.width), size;
+   *y2 = mb_half(dec->base.height)*w;
+   *cbcr = *y2 * 2;
+   *cbcr2 = *cbcr + w * (nouveau_vp3_video_align(dec->base.height)>>6);
+
+   /* The check here should never fail because it means a bug
+    * in the code rather than a bug in hardware..
+    */
+   size = (2 * (*cbcr2 - *cbcr) + *cbcr) << 8;
+   if (size > dec->ref_stride) {
+      debug_printf("Overshot ref_stride (%u) with size %u and ofs (%u,%u,%u)\n",
+                   dec->ref_stride, size, *y2<<8, *cbcr<<8, *cbcr2<<8);
+      *y2 = *cbcr = *cbcr2 = 0;
+      assert(size <= dec->ref_stride);
+   }
+}
+
+static INLINE void
+nouveau_vp3_inter_sizes(struct nouveau_vp3_decoder *dec, uint32_t slice_count,
+                        uint32_t *slice_size, uint32_t *bucket_size,
+                        uint32_t *ring_size)
+{
+   *slice_size = (SLICE_SIZE * slice_count)>>8;
+   if (u_reduce_video_profile(dec->base.profile) == PIPE_VIDEO_CODEC_MPEG12)
+      *bucket_size = 0;
+   else
+      *bucket_size = mb(dec->base.width) * 3;
+   *ring_size = (dec->inter_bo[0]->size >> 8) - *bucket_size - *slice_size;
+}
+
 struct pipe_video_buffer *
 nouveau_vp3_video_buffer_create(struct pipe_context *pipe,
                                 const struct pipe_video_buffer *templat,
diff --git a/src/gallium/drivers/nvc0/nvc0_video.c b/src/gallium/drivers/nvc0/nvc0_video.c
index 18de2ed..73963c2 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.c
+++ b/src/gallium/drivers/nvc0/nvc0_video.c
@@ -62,7 +62,7 @@ nvc0_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
                               const void *const *data,
                               const unsigned *num_bytes)
 {
-   struct nvc0_decoder *dec = (struct nvc0_decoder *)decoder;
+   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
    struct nouveau_vp3_video_buffer *target = (struct nouveau_vp3_video_buffer *)video_target;
    uint32_t comm_seq = ++dec->fence_seq;
    union pipe_desc desc;
@@ -88,7 +88,7 @@ nvc0_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
 static void
 nvc0_decoder_flush(struct pipe_video_decoder *decoder)
 {
-   struct nvc0_decoder *dec = (struct nvc0_decoder *)decoder;
+   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
    (void)dec;
 }
 
@@ -109,19 +109,19 @@ nvc0_decoder_end_frame(struct pipe_video_decoder *decoder,
 static void
 nvc0_decoder_destroy(struct pipe_video_decoder *decoder)
 {
-   struct nvc0_decoder *dec = (struct nvc0_decoder *)decoder;
+   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
    int i;
 
    nouveau_bo_ref(NULL, &dec->ref_bo);
    nouveau_bo_ref(NULL, &dec->bitplane_bo);
    nouveau_bo_ref(NULL, &dec->inter_bo[0]);
    nouveau_bo_ref(NULL, &dec->inter_bo[1]);
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    nouveau_bo_ref(NULL, &dec->fence_bo);
 #endif
    nouveau_bo_ref(NULL, &dec->fw_bo);
 
-   for (i = 0; i < NVC0_VIDEO_QDEPTH; ++i)
+   for (i = 0; i < NOUVEAU_VP3_VIDEO_QDEPTH; ++i)
       nouveau_bo_ref(NULL, &dec->bsp_bo[i]);
 
    nouveau_object_del(&dec->bsp);
@@ -173,7 +173,7 @@ nvc0_create_decoder(struct pipe_context *context,
                     bool chunked_decode)
 {
    struct nouveau_screen *screen = &((struct nvc0_context *)context)->screen->base;
-   struct nvc0_decoder *dec;
+   struct nouveau_vp3_decoder *dec;
    struct nouveau_pushbuf **push;
    union nouveau_bo_config cfg;
    bool kepler = screen->device->chipset >= 0xe0;
@@ -196,7 +196,7 @@ nvc0_create_decoder(struct pipe_context *context,
       return NULL;
    }
 
-   dec = CALLOC_STRUCT(nvc0_decoder);
+   dec = CALLOC_STRUCT(nouveau_vp3_decoder);
    if (!dec)
       return NULL;
    dec->client = screen->client;
@@ -288,7 +288,7 @@ nvc0_create_decoder(struct pipe_context *context,
    dec->base.begin_frame = nvc0_decoder_begin_frame;
    dec->base.end_frame = nvc0_decoder_end_frame;
 
-   for (i = 0; i < NVC0_VIDEO_QDEPTH && !ret; ++i)
+   for (i = 0; i < NOUVEAU_VP3_VIDEO_QDEPTH && !ret; ++i)
       ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM,
                            0, 1 << 20, &cfg, &dec->bsp_bo[i]);
    if (!ret)
@@ -325,7 +325,7 @@ nvc0_create_decoder(struct pipe_context *context,
    }
    case PIPE_VIDEO_CODEC_MPEG4_AVC: {
       codec = 3;
-      dec->tmp_stride = 16 * mb_half(width) * nvc0_video_align(height) * 3 / 2;
+      dec->tmp_stride = 16 * mb_half(width) * nouveau_vp3_video_align(height) * 3 / 2;
       tmp_size = dec->tmp_stride * (max_references + 1);
       assert(max_references <= 16);
       break;
@@ -415,7 +415,7 @@ nvc0_create_decoder(struct pipe_context *context,
          goto fail;
    }
 
-   dec->ref_stride = mb(width)*16 * (mb_half(height)*32 + nvc0_video_align(height)/2);
+   dec->ref_stride = mb(width)*16 * (mb_half(height)*32 + nouveau_vp3_video_align(height)/2);
    ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM, 0,
                         dec->ref_stride * (max_references+2) + tmp_size,
                         &cfg, &dec->ref_bo);
@@ -438,7 +438,7 @@ nvc0_create_decoder(struct pipe_context *context,
 
    ++dec->fence_seq;
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    ret = nouveau_bo_new(screen->device, NOUVEAU_BO_GART|NOUVEAU_BO_MAP,
                         0, 0x1000, NULL, &dec->fence_bo);
    if (ret)
diff --git a/src/gallium/drivers/nvc0/nvc0_video.h b/src/gallium/drivers/nvc0/nvc0_video.h
index 67eca7c..1ceb6eb 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.h
+++ b/src/gallium/drivers/nvc0/nvc0_video.h
@@ -29,172 +29,15 @@
 
 #include "util/u_video.h"
 
-#define SLICE_SIZE 0x200
-#define VP_OFFSET 0x200
-#define COMM_OFFSET 0x500
-
-#define NVC0_DEBUG_FENCE 0
-
-#if NVC0_DEBUG_FENCE
-# define NVC0_VIDEO_QDEPTH 1
-#else
-# define NVC0_VIDEO_QDEPTH 2
-#endif
-
-#define SUBC_BSP(m) dec->bsp_idx, (m)
-#define SUBC_VP(m) dec->vp_idx, (m)
-#define SUBC_PPP(m) dec->ppp_idx, (m)
-
-union pipe_desc {
-   struct pipe_picture_desc *base;
-   struct pipe_mpeg12_picture_desc *mpeg12;
-   struct pipe_mpeg4_picture_desc *mpeg4;
-   struct pipe_vc1_picture_desc *vc1;
-   struct pipe_h264_picture_desc *h264;
-};
-
-struct nvc0_decoder {
-   struct pipe_video_decoder base;
-   struct nouveau_client *client;
-   struct nouveau_object *channel[3], *bsp, *vp, *ppp;
-   struct nouveau_pushbuf *pushbuf[3];
-
-#if NVC0_DEBUG_FENCE
-   /* dump fence and comm, as needed.. */
-   unsigned *fence_map;
-   struct comm *comm;
-
-   struct nouveau_bo *fence_bo;
-#endif
-
-   struct nouveau_bo *fw_bo, *bitplane_bo;
-
-   // array size max_references + 2, contains unpostprocessed images
-   // added at the end of ref_bo is a tmp array
-   // tmp is an array for h264, with each member being used for a ref frame or current
-   // target.. size = (((mb(w)*((mb(h)+1)&~1))+3)>>2)<<8 * (max_references+1)
-   // for other codecs, it simply seems that size = w*h is enough
-   // unsure what it's supposed to contain..
-   struct nouveau_bo *ref_bo;
-
-   struct nouveau_bo *inter_bo[2];
-
-   struct nouveau_bo *bsp_bo[NVC0_VIDEO_QDEPTH];
-
-   // bo's used by each cycle:
-
-   // bsp_bo: contains raw bitstream data and parameters for BSP and VP.
-   // inter_bo: contains data shared between BSP and VP
-   // ref_bo: reference image data, used by PPP and VP
-   // bitplane_bo: contain bitplane data (similar to ref_bo), used by BSP only
-   // fw_bo: used by VP only.
-
-   // Needed amount of copies in optimal case:
-   // 2 copies of inter_bo, VP would process the last inter_bo, while BSP is
-   // writing out a new set.
-   // NVC0_VIDEO_QDEPTH copies of bsp_bo. We don't want to block the pipeline ever,
-   // and give shaders a chance to run as well.
-
-   struct {
-      struct nouveau_vp3_video_buffer *vidbuf;
-      unsigned last_used;
-      unsigned field_pic_flag : 1;
-      unsigned decoded_top : 1;
-      unsigned decoded_bottom : 1;
-   } refs[17];
-   unsigned fence_seq, fw_sizes, last_frame_num, tmp_stride, ref_stride;
-
-   unsigned bsp_idx, vp_idx, ppp_idx;
-};
-
-struct comm {
-	uint32_t bsp_cur_index; // 000
-	uint32_t byte_ofs; // 004
-	uint32_t status[0x10]; // 008
-	uint32_t pos[0x10]; // 048
-	uint8_t pad[0x100 - 0x88]; // 0a0 bool comm_encrypted
-
-	uint32_t pvp_cur_index; // 100
-	uint32_t acked_byte_ofs; // 104
-	uint32_t status_vp[0x10]; // 108
-	uint16_t mb_y[0x10]; //148
-	uint32_t pvp_stage; // 168 0xeeXX
-	uint16_t parse_endpos_index; // 16c
-	uint16_t irq_index; // 16e
-	uint8_t  irq_470[0x10]; // 170
-	uint32_t irq_pos[0x10]; // 180
-	uint32_t parse_endpos[0x10]; // 1c0
-};
-
-static INLINE uint32_t nvc0_video_align(uint32_t h)
-{
-   return ((h+0x3f)&~0x3f);
-};
-
-static INLINE uint32_t mb(uint32_t coord)
-{
-   return (coord + 0xf)>>4;
-}
-
-static INLINE uint32_t mb_half(uint32_t coord)
-{
-   return (coord + 0x1f)>>5;
-}
-
-static INLINE uint64_t
-nvc0_video_addr(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *target)
-{
-   uint64_t ret;
-   if (target)
-      ret = dec->ref_stride * target->valid_ref;
-   else
-      ret = dec->ref_stride * (dec->base.max_references+1);
-   return dec->ref_bo->offset + ret;
-}
-
-static INLINE void
-nvc0_decoder_ycbcr_offsets(struct nvc0_decoder *dec, uint32_t *y2,
-                           uint32_t *cbcr, uint32_t *cbcr2)
-{
-   uint32_t w = mb(dec->base.width), size;
-   *y2 = mb_half(dec->base.height)*w;
-   *cbcr = *y2 * 2;
-   *cbcr2 = *cbcr + w * (nvc0_video_align(dec->base.height)>>6);
-
-   /* The check here should never fail because it means a bug
-    * in the code rather than a bug in hardware..
-    */
-   size = (2 * (*cbcr2 - *cbcr) + *cbcr) << 8;
-   if (size > dec->ref_stride) {
-      debug_printf("Overshot ref_stride (%u) with size %u and ofs (%u,%u,%u)\n",
-                   dec->ref_stride, size, *y2<<8, *cbcr<<8, *cbcr2<<8);
-      *y2 = *cbcr = *cbcr2 = 0;
-      assert(size <= dec->ref_stride);
-   }
-}
-
-static INLINE void
-nvc0_decoder_inter_sizes(struct nvc0_decoder *dec, uint32_t slice_count,
-                         uint32_t *slice_size, uint32_t *bucket_size,
-                         uint32_t *ring_size)
-{
-   *slice_size = (SLICE_SIZE * slice_count)>>8;
-   if (u_reduce_video_profile(dec->base.profile) == PIPE_VIDEO_CODEC_MPEG12)
-      *bucket_size = 0;
-   else
-      *bucket_size = mb(dec->base.width) * 3;
-   *ring_size = (dec->inter_bo[0]->size >> 8) - *bucket_size - *slice_size;
-}
-
 extern unsigned
-nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
+nvc0_decoder_bsp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                  struct nouveau_vp3_video_buffer *target,
                  unsigned comm_seq, unsigned num_buffers,
                  const void *const *data, const unsigned *num_bytes,
                  unsigned *vp_caps, unsigned *is_ref,
                  struct nouveau_vp3_video_buffer *refs[16]);
 
-extern void nvc0_decoder_vp_caps(struct nvc0_decoder *dec,
+extern void nvc0_decoder_vp_caps(struct nouveau_vp3_decoder *dec,
                                  union pipe_desc desc,
                                  struct nouveau_vp3_video_buffer *target,
                                  unsigned comm_seq,
@@ -202,11 +45,11 @@ extern void nvc0_decoder_vp_caps(struct nvc0_decoder *dec,
                                  struct nouveau_vp3_video_buffer *refs[16]);
 
 extern void
-nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
+nvc0_decoder_vp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                 struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                 unsigned caps, unsigned is_ref,
                 struct nouveau_vp3_video_buffer *refs[16]);
 
 extern void
-nvc0_decoder_ppp(struct nvc0_decoder *dec, union pipe_desc desc,
+nvc0_decoder_ppp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                  struct nouveau_vp3_video_buffer *target, unsigned comm_seq);
diff --git a/src/gallium/drivers/nvc0/nvc0_video_bsp.c b/src/gallium/drivers/nvc0/nvc0_video_bsp.c
index bdb9c64..c632a5e 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_bsp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_bsp.c
@@ -110,7 +110,7 @@ struct h264_picparm_bsp {
 };
 
 static uint32_t
-nvc0_decoder_fill_picparm_mpeg12_bsp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_mpeg12_bsp(struct nouveau_vp3_decoder *dec,
                                      struct pipe_mpeg12_picture_desc *desc,
                                      char *map)
 {
@@ -132,7 +132,7 @@ nvc0_decoder_fill_picparm_mpeg12_bsp(struct nvc0_decoder *dec,
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_mpeg4_bsp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_mpeg4_bsp(struct nouveau_vp3_decoder *dec,
                                     struct pipe_mpeg4_picture_desc *desc,
                                     char *map)
 {
@@ -157,7 +157,7 @@ nvc0_decoder_fill_picparm_mpeg4_bsp(struct nvc0_decoder *dec,
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_vc1_bsp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_vc1_bsp(struct nouveau_vp3_decoder *dec,
                                   struct pipe_vc1_picture_desc *d,
                                   char *map)
 {
@@ -189,7 +189,7 @@ nvc0_decoder_fill_picparm_vc1_bsp(struct nvc0_decoder *dec,
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_h264_bsp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_h264_bsp(struct nouveau_vp3_decoder *dec,
                                    struct pipe_h264_picture_desc *d,
                                    char *map)
 {
@@ -230,7 +230,7 @@ nvc0_decoder_fill_picparm_h264_bsp(struct nvc0_decoder *dec,
    return caps | 3;
 }
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
 static void dump_comm_bsp(struct comm *comm)
 {
    unsigned idx = comm->bsp_cur_index & 0xf;
@@ -240,7 +240,7 @@ static void dump_comm_bsp(struct comm *comm)
 #endif
 
 unsigned
-nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
+nvc0_decoder_bsp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                  struct nouveau_vp3_video_buffer *target,
                  unsigned comm_seq, unsigned num_buffers,
                  const void *const *data, const unsigned *num_bytes,
@@ -255,13 +255,13 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
    uint32_t endmarker, caps;
    struct strparm_bsp *str_bsp;
    int ret, i;
-   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NVC0_VIDEO_QDEPTH];
+   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NOUVEAU_VP3_VIDEO_QDEPTH];
    struct nouveau_bo *inter_bo = dec->inter_bo[comm_seq & 1];
    unsigned fence_extra = 0;
    struct nouveau_pushbuf_refn bo_refs[] = {
       { bsp_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
       { inter_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
       { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
 #endif
       { dec->bitplane_bo, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
@@ -271,7 +271,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
    if (!dec->bitplane_bo)
       num_refs--;
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    fence_extra = 4;
 #endif
 
@@ -329,7 +329,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
    /* Reserved for picparm_vp */
    bsp += 0x300;
    /* Reserved for comm */
-#if !NVC0_DEBUG_FENCE
+#if !NOUVEAU_VP3_DEBUG_FENCE
    memset(bsp, 0, 0x200);
 #endif
    bsp += 0x200;
@@ -351,7 +351,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
    bsp_addr = bsp_bo->offset >> 8;
    inter_addr = inter_bo->offset >> 8;
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    memset(dec->comm, 0, 0x200);
    comm_addr = (dec->fence_bo->offset + COMM_OFFSET) >> 8;
 #else
@@ -370,7 +370,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
 
       bitplane_addr = dec->bitplane_bo->offset >> 8;
 
-      nvc0_decoder_inter_sizes(dec, 1, &slice_size, &bucket_size, &ring_size);
+      nouveau_vp3_inter_sizes(dec, 1, &slice_size, &bucket_size, &ring_size);
       BEGIN_NVC0(push, SUBC_BSP(0x400), 6);
       PUSH_DATA (push, bsp_addr); // 400 picparm addr
       PUSH_DATA (push, inter_addr); // 404 interparm addr
@@ -379,7 +379,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
       PUSH_DATA (push, bitplane_addr); // 410 BITPLANE_DATA
       PUSH_DATA (push, 0x400); // 414 BITPLANE_DATA_SIZE
    } else {
-      nvc0_decoder_inter_sizes(dec, desc.h264->slice_count, &slice_size, &bucket_size, &ring_size);
+      nouveau_vp3_inter_sizes(dec, desc.h264->slice_count, &slice_size, &bucket_size, &ring_size);
       BEGIN_NVC0(push, SUBC_BSP(0x400), 8);
       PUSH_DATA (push, bsp_addr); // 400 picparm addr
       PUSH_DATA (push, inter_addr); // 404 interparm addr
@@ -392,7 +392,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
       // TODO: Double check 414 / 418 with nvidia trace
    }
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    BEGIN_NVC0(push, SUBC_BSP(0x240), 3);
    PUSH_DATAh(push, dec->fence_bo->offset);
    PUSH_DATA (push, dec->fence_bo->offset);
diff --git a/src/gallium/drivers/nvc0/nvc0_video_ppp.c b/src/gallium/drivers/nvc0/nvc0_video_ppp.c
index 836add3..496db80 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_ppp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_ppp.c
@@ -23,7 +23,7 @@
 #include "nvc0_video.h"
 
 static void
-nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *target, uint32_t low700) {
+nvc0_decoder_setup_ppp(struct nouveau_vp3_decoder *dec, struct nouveau_vp3_video_buffer *target, uint32_t low700) {
    struct nouveau_pushbuf *push = dec->pushbuf[2];
 
    uint32_t stride_in = mb(dec->base.width);
@@ -36,7 +36,7 @@ nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer
       { NULL, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { NULL, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { dec->ref_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
       { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
 #endif
    };
@@ -48,10 +48,10 @@ nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer
    }
 
    nouveau_pushbuf_refn(push, bo_refs, num_refs);
-   nvc0_decoder_ycbcr_offsets(dec, &y2, &cbcr, &cbcr2);
+   nouveau_vp3_ycbcr_offsets(dec, &y2, &cbcr, &cbcr2);
 
    BEGIN_NVC0(push, SUBC_PPP(0x700), 10);
-   in_addr = nvc0_video_addr(dec, target) >> 8;
+   in_addr = nouveau_vp3_video_addr(dec, target) >> 8;
 
    PUSH_DATA (push, (stride_out << 24) | (stride_out << 16) | low700); // 700
    PUSH_DATA (push, (stride_in << 24) | (stride_in << 16) | (dec_h << 8) | dec_w); // 704
@@ -73,7 +73,7 @@ nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer
 }
 
 static uint32_t
-nvc0_decoder_vc1_ppp(struct nvc0_decoder *dec, struct pipe_vc1_picture_desc *desc, struct nouveau_vp3_video_buffer *target) {
+nvc0_decoder_vc1_ppp(struct nouveau_vp3_decoder *dec, struct pipe_vc1_picture_desc *desc, struct nouveau_vp3_video_buffer *target) {
    struct nouveau_pushbuf *push = dec->pushbuf[2];
 
    nvc0_decoder_setup_ppp(dec, target, 0x1412);
@@ -89,13 +89,13 @@ nvc0_decoder_vc1_ppp(struct nvc0_decoder *dec, struct pipe_vc1_picture_desc *des
 }
 
 void
-nvc0_decoder_ppp(struct nvc0_decoder *dec, union pipe_desc desc, struct nouveau_vp3_video_buffer *target, unsigned comm_seq) {
+nvc0_decoder_ppp(struct nouveau_vp3_decoder *dec, union pipe_desc desc, struct nouveau_vp3_video_buffer *target, unsigned comm_seq) {
    enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
    struct nouveau_pushbuf *push = dec->pushbuf[2];
    unsigned ppp_caps = 0x10;
    unsigned fence_extra = 0;
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    fence_extra = 4;
 #endif
 
@@ -116,7 +116,7 @@ nvc0_decoder_ppp(struct nvc0_decoder *dec, union pipe_desc desc, struct nouveau_
    PUSH_DATA (push, comm_seq);
    PUSH_DATA (push, ppp_caps);
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    BEGIN_NVC0(push, SUBC_PPP(0x240), 3);
    PUSH_DATAh(push, (dec->fence_bo->offset + 0x20));
    PUSH_DATA (push, (dec->fence_bo->offset + 0x20));
diff --git a/src/gallium/drivers/nvc0/nvc0_video_vp.c b/src/gallium/drivers/nvc0/nvc0_video_vp.c
index 74e3915..e3c00b9 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_vp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_vp.c
@@ -170,7 +170,7 @@ struct h264_picparm_vp { // 700..a00
 };
 
 static void
-nvc0_decoder_handle_references(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *refs[16], unsigned seq, struct nouveau_vp3_video_buffer *target)
+nvc0_decoder_handle_references(struct nouveau_vp3_decoder *dec, struct nouveau_vp3_video_buffer *refs[16], unsigned seq, struct nouveau_vp3_video_buffer *target)
 {
    unsigned h264 = u_reduce_video_profile(dec->base.profile) == PIPE_VIDEO_CODEC_MPEG4_AVC;
    unsigned i, idx, empty_spot = dec->base.max_references + 1;
@@ -221,7 +221,7 @@ nvc0_decoder_handle_references(struct nvc0_decoder *dec, struct nouveau_vp3_vide
 }
 
 static void
-nvc0_decoder_kick_ref(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer *target)
+nvc0_decoder_kick_ref(struct nouveau_vp3_decoder *dec, struct nouveau_vp3_video_buffer *target)
 {
    dec->refs[target->valid_ref].vidbuf = NULL;
    dec->refs[target->valid_ref].last_used = 0;
@@ -229,7 +229,7 @@ nvc0_decoder_kick_ref(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_mpeg12_vp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_mpeg12_vp(struct nouveau_vp3_decoder *dec,
                                     struct pipe_mpeg12_picture_desc *desc,
                                     struct nouveau_vp3_video_buffer *refs[16],
                                     unsigned *is_ref,
@@ -252,10 +252,10 @@ nvc0_decoder_fill_picparm_mpeg12_vp(struct nvc0_decoder *dec,
    pic_vp->height = mb(dec->base.height);
    pic_vp->unk08 = pic_vp->unk04 = (dec->base.width+0xf)&~0xf; // Stride
 
-   nvc0_decoder_ycbcr_offsets(dec, &pic_vp->ofs[1], &pic_vp->ofs[3], &pic_vp->ofs[4]);
+   nouveau_vp3_ycbcr_offsets(dec, &pic_vp->ofs[1], &pic_vp->ofs[3], &pic_vp->ofs[4]);
    pic_vp->ofs[5] = pic_vp->ofs[3];
    pic_vp->ofs[0] = pic_vp->ofs[2] = 0;
-   nvc0_decoder_inter_sizes(dec, 1, &ring, &pic_vp->bucket_size, &pic_vp->inter_ring_data_size);
+   nouveau_vp3_inter_sizes(dec, 1, &ring, &pic_vp->bucket_size, &pic_vp->inter_ring_data_size);
 
    pic_vp->alternate_scan = desc->alternate_scan;
    pic_vp->pad2[0] = pic_vp->pad2[1] = pic_vp->pad2[2] = 0;
@@ -278,7 +278,7 @@ nvc0_decoder_fill_picparm_mpeg12_vp(struct nvc0_decoder *dec,
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_mpeg4_vp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_mpeg4_vp(struct nouveau_vp3_decoder *dec,
                                    struct pipe_mpeg4_picture_desc *desc,
                                    struct nouveau_vp3_video_buffer *refs[16],
                                    unsigned *is_ref,
@@ -293,11 +293,11 @@ nvc0_decoder_fill_picparm_mpeg4_vp(struct nvc0_decoder *dec,
    pic_vp->height = mb(dec->base.height)<<4;
    pic_vp->unk0c = pic_vp->unk08 = mb(dec->base.width)<<4; // Stride
 
-   nvc0_decoder_ycbcr_offsets(dec, &pic_vp->ofs[1], &pic_vp->ofs[3], &pic_vp->ofs[4]);
+   nouveau_vp3_ycbcr_offsets(dec, &pic_vp->ofs[1], &pic_vp->ofs[3], &pic_vp->ofs[4]);
    pic_vp->ofs[5] = pic_vp->ofs[3];
    pic_vp->ofs[0] = pic_vp->ofs[2] = 0;
    pic_vp->pad1 = pic_vp->pad2 = 0;
-   nvc0_decoder_inter_sizes(dec, 1, &ring, &pic_vp->bucket_size, &pic_vp->inter_ring_data_size);
+   nouveau_vp3_inter_sizes(dec, 1, &ring, &pic_vp->bucket_size, &pic_vp->inter_ring_data_size);
 
    pic_vp->trd[0] = desc->trd[0];
    pic_vp->trd[1] = desc->trd[1];
@@ -326,7 +326,7 @@ nvc0_decoder_fill_picparm_mpeg4_vp(struct nvc0_decoder *dec,
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_h264_vp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
                                   const struct pipe_h264_picture_desc *d,
                                   struct nouveau_vp3_video_buffer *refs[16],
                                   unsigned *is_ref,
@@ -341,12 +341,12 @@ nvc0_decoder_fill_picparm_h264_vp(struct nvc0_decoder *dec,
    h->width = mb(dec->base.width);
    h->height = mb(dec->base.height);
    h->stride1 = h->stride2 = mb(dec->base.width)*16;
-   nvc0_decoder_ycbcr_offsets(dec, &h->ofs[1], &h->ofs[3], &h->ofs[4]);
+   nouveau_vp3_ycbcr_offsets(dec, &h->ofs[1], &h->ofs[3], &h->ofs[4]);
    h->ofs[5] = h->ofs[3];
    h->ofs[0] = h->ofs[2] = 0;
    h->u24 = dec->tmp_stride >> 8;
    assert(h->u24);
-   nvc0_decoder_inter_sizes(dec, 1, &ring, &h->bucket_size, &h->inter_ring_data_size);
+   nouveau_vp3_inter_sizes(dec, 1, &ring, &h->bucket_size, &h->inter_ring_data_size);
 
    h->u220 = 0;
    h->f0 = d->mb_adaptive_frame_field_flag;
@@ -410,7 +410,7 @@ nvc0_decoder_fill_picparm_h264_vp(struct nvc0_decoder *dec,
 }
 
 static void
-nvc0_decoder_fill_picparm_h264_vp_refs(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_h264_vp_refs(struct nouveau_vp3_decoder *dec,
                                        struct pipe_h264_picture_desc *d,
                                        struct nouveau_vp3_video_buffer *refs[16],
                                        struct nouveau_vp3_video_buffer *target,
@@ -429,7 +429,7 @@ nvc0_decoder_fill_picparm_h264_vp_refs(struct nvc0_decoder *dec,
 }
 
 static uint32_t
-nvc0_decoder_fill_picparm_vc1_vp(struct nvc0_decoder *dec,
+nvc0_decoder_fill_picparm_vc1_vp(struct nouveau_vp3_decoder *dec,
                                  struct pipe_vc1_picture_desc *d,
                                  struct nouveau_vp3_video_buffer *refs[16],
                                  unsigned *is_ref,
@@ -440,14 +440,14 @@ nvc0_decoder_fill_picparm_vc1_vp(struct nvc0_decoder *dec,
    assert(dec->base.profile != PIPE_VIDEO_PROFILE_VC1_SIMPLE);
    *is_ref = d->picture_type <= 1;
 
-   nvc0_decoder_ycbcr_offsets(dec, &vc->ofs[1], &vc->ofs[3], &vc->ofs[4]);
+   nouveau_vp3_ycbcr_offsets(dec, &vc->ofs[1], &vc->ofs[3], &vc->ofs[4]);
    vc->ofs[5] = vc->ofs[3];
    vc->ofs[0] = vc->ofs[2] = 0;
    vc->width = dec->base.width;
    vc->height = mb(dec->base.height)<<4;
    vc->unk0c = vc->unk10 = mb(dec->base.width)<<4; // Stride
    vc->pad = vc->pad2 = 0;
-   nvc0_decoder_inter_sizes(dec, 1, &ring, &vc->bucket_size, &vc->inter_ring_data_size);
+   nouveau_vp3_inter_sizes(dec, 1, &ring, &vc->bucket_size, &vc->inter_ring_data_size);
    vc->profile = dec->base.profile - PIPE_VIDEO_PROFILE_VC1_SIMPLE;
    vc->loopfilter = d->loopfilter;
    vc->fastuvmc = d->fastuvmc;
@@ -460,8 +460,8 @@ nvc0_decoder_fill_picparm_vc1_vp(struct nvc0_decoder *dec,
    return 0x12;
 }
 
-#if NVC0_DEBUG_FENCE
-static void dump_comm_vp(struct nvc0_decoder *dec, struct comm *comm, u32 comm_seq,
+#if NOUVEAU_VP3_DEBUG_FENCE
+static void dump_comm_vp(struct nouveau_vp3_decoder *dec, struct comm *comm, u32 comm_seq,
                          struct nouveau_bo *inter_bo, unsigned slice_size)
 {
 	unsigned i, idx = comm->pvp_cur_index & 0xf;
@@ -493,12 +493,12 @@ static void dump_comm_vp(struct nvc0_decoder *dec, struct comm *comm, u32 comm_s
 }
 #endif
 
-void nvc0_decoder_vp_caps(struct nvc0_decoder *dec, union pipe_desc desc,
+void nvc0_decoder_vp_caps(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                           struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                           unsigned *caps, unsigned *is_ref,
                           struct nouveau_vp3_video_buffer *refs[16])
 {
-   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NVC0_VIDEO_QDEPTH];
+   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NOUVEAU_VP3_VIDEO_QDEPTH];
    enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
    char *vp = bsp_bo->map + VP_OFFSET;
 
@@ -527,7 +527,7 @@ void nvc0_decoder_vp_caps(struct nvc0_decoder *dec, union pipe_desc desc,
 }
 
 void
-nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
+nvc0_decoder_vp(struct nouveau_vp3_decoder *dec, union pipe_desc desc,
                 struct nouveau_vp3_video_buffer *target, unsigned comm_seq,
                 unsigned caps, unsigned is_ref,
                 struct nouveau_vp3_video_buffer *refs[16])
@@ -536,41 +536,41 @@ nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
    uint32_t bsp_addr, comm_addr, inter_addr, ucode_addr, pic_addr[17], last_addr, null_addr;
    uint32_t slice_size, bucket_size, ring_size, i;
    enum pipe_video_codec codec = u_reduce_video_profile(dec->base.profile);
-   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NVC0_VIDEO_QDEPTH];
+   struct nouveau_bo *bsp_bo = dec->bsp_bo[comm_seq % NOUVEAU_VP3_VIDEO_QDEPTH];
    struct nouveau_bo *inter_bo = dec->inter_bo[comm_seq & 1];
    u32 fence_extra = 0, codec_extra = 0;
    struct nouveau_pushbuf_refn bo_refs[] = {
       { inter_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { dec->ref_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { bsp_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
       { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
 #endif
       { dec->fw_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
    };
    int num_refs = sizeof(bo_refs)/sizeof(*bo_refs) - !dec->fw_bo;
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    fence_extra = 4;
 #endif
 
    if (codec == PIPE_VIDEO_CODEC_MPEG4_AVC) {
-      nvc0_decoder_inter_sizes(dec, desc.h264->slice_count, &slice_size, &bucket_size, &ring_size);
+      nouveau_vp3_inter_sizes(dec, desc.h264->slice_count, &slice_size, &bucket_size, &ring_size);
       codec_extra += 2;
    } else
-      nvc0_decoder_inter_sizes(dec, 1, &slice_size, &bucket_size, &ring_size);
+      nouveau_vp3_inter_sizes(dec, 1, &slice_size, &bucket_size, &ring_size);
 
    if (dec->base.max_references > 2)
       codec_extra += 1 + (dec->base.max_references - 2);
 
-   pic_addr[16] = nvc0_video_addr(dec, target) >> 8;
-   last_addr = null_addr = nvc0_video_addr(dec, NULL) >> 8;
+   pic_addr[16] = nouveau_vp3_video_addr(dec, target) >> 8;
+   last_addr = null_addr = nouveau_vp3_video_addr(dec, NULL) >> 8;
 
    for (i = 0; i < dec->base.max_references; ++i) {
       if (!refs[i])
          pic_addr[i] = last_addr;
       else if (dec->refs[refs[i]->valid_ref].vidbuf == refs[i])
-         last_addr = pic_addr[i] = nvc0_video_addr(dec, refs[i]) >> 8;
+         last_addr = pic_addr[i] = nouveau_vp3_video_addr(dec, refs[i]) >> 8;
       else
          pic_addr[i] = null_addr;
    }
@@ -583,7 +583,7 @@ nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
    nouveau_pushbuf_refn(push, bo_refs, num_refs);
 
    bsp_addr = bsp_bo->offset >> 8;
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    comm_addr = (dec->fence_bo->offset + COMM_OFFSET)>>8;
 #else
    comm_addr = bsp_addr + (COMM_OFFSET>>8);
@@ -635,7 +635,7 @@ nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
 
    //debug_printf("Decoding %08lx with %08lx and %08lx\n", pic_addr[16], pic_addr[0], pic_addr[1]);
 
-#if NVC0_DEBUG_FENCE
+#if NOUVEAU_VP3_DEBUG_FENCE
    BEGIN_NVC0(push, SUBC_VP(0x240), 3);
    PUSH_DATAh(push, (dec->fence_bo->offset + 0x10));
    PUSH_DATA (push, (dec->fence_bo->offset + 0x10));
-- 
1.8.1.5
