From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/2] nv30: hook up PMPEG support via
	nouveau_video, enables XvMC to work
Date: Mon, 29 Jul 2013 19:39:06 -0400
Message-ID: <1375141147-29058-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

It seems as though at least the NV44 expects the same format as VP2
does. But NV96 expects the format as currently done.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nouveau_video.c | 43 +++++++++++++++++++++++++----
 src/gallium/drivers/nouveau/nouveau_video.h |  2 ++
 src/gallium/drivers/nv30/nv30_context.c     |  2 ++
 src/gallium/drivers/nv30/nv30_screen.c      |  1 +
 4 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_video.c b/src/gallium/drivers/nouveau/nouveau_video.c
index 9357508..62cb8d5 100644
--- a/src/gallium/drivers/nouveau/nouveau_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_video.c
@@ -101,7 +101,32 @@ nouveau_vpe_fini(struct nouveau_decoder *dec) {
 }
 
 static INLINE void
-nouveau_vpe_mb_dct_blocks(struct nouveau_decoder *dec, const struct pipe_mpeg12_macroblock *mb)
+nouveau_vpe_mb_dct_blocks_31(struct nouveau_decoder *dec, const struct pipe_mpeg12_macroblock *mb)
+{
+   int cbb;
+   unsigned cbp = mb->coded_block_pattern;
+   short *db = mb->blocks;
+   for (cbb = 0x20; cbb > 0; cbb >>= 1) {
+      if (cbb & cbp) {
+         int i, found = 0;
+         for (i = 0; i < 64; ++i) {
+            if (!db[i]) continue;
+            dec->data[dec->data_pos++] = (db[i] << 16) | (i * 2);
+            found = 1;
+         }
+         if (found)
+            dec->data[dec->data_pos - 1] |= 1;
+         else
+            dec->data[dec->data_pos++] = 1;
+         db += 64;
+      } else if (mb->macroblock_type & PIPE_MPEG12_MB_TYPE_INTRA) {
+         dec->data[dec->data_pos++] = 1;
+      }
+   }
+}
+
+static INLINE void
+nouveau_vpe_mb_dct_blocks_84(struct nouveau_decoder *dec, const struct pipe_mpeg12_macroblock *mb)
 {
    int cbb;
    unsigned cbp = mb->coded_block_pattern;
@@ -455,10 +480,14 @@ nouveau_decoder_decode_macroblock(struct pipe_video_decoder *decoder,
          nouveau_vpe_mb_mv_header(dec, mb, FALSE);
          nouveau_vpe_mb_dct_header(dec, mb, FALSE);
       }
-      if (dec->base.entrypoint <= PIPE_VIDEO_ENTRYPOINT_IDCT)
-         nouveau_vpe_mb_dct_blocks(dec, mb);
-      else
+      if (dec->base.entrypoint <= PIPE_VIDEO_ENTRYPOINT_IDCT) {
+         if (dec->is8274)
+            nouveau_vpe_mb_dct_blocks_84(dec, mb);
+         else
+            nouveau_vpe_mb_dct_blocks_31(dec, mb);
+      } else {
          nouveau_vpe_mb_data_blocks(dec, mb);
+      }
    }
 }
 
@@ -528,6 +557,8 @@ nouveau_create_decoder(struct pipe_context *context,
       goto vl;
    if (screen->device->chipset >= 0x98 && screen->device->chipset != 0xa0)
       goto vl;
+   if (screen->device->chipset < 0x31)
+      goto vl;
 
    dec = CALLOC_STRUCT(nouveau_decoder);
    if (!dec)
@@ -577,6 +608,7 @@ nouveau_create_decoder(struct pipe_context *context,
    dec->base.end_frame = nouveau_decoder_end_frame;
    dec->base.flush = nouveau_decoder_flush;
    dec->screen = screen;
+   dec->is8274 = is8274;
 
    ret = nouveau_bo_new(dec->screen->device, NOUVEAU_BO_GART | NOUVEAU_BO_MAP,
                         0, 1024 * 1024, NULL, &dec->cmd_bo);
@@ -793,7 +825,8 @@ nouveau_video_buffer_create(struct pipe_context *pipe,
     * and it only supports the NV12 format
     */
    if (templat->buffer_format != PIPE_FORMAT_NV12 || getenv("XVMC_VL") ||
-       (screen->device->chipset >= 0x98 && screen->device->chipset != 0xa0))
+       (screen->device->chipset >= 0x98 && screen->device->chipset != 0xa0) ||
+       screen->device->chipset < 0x31)
       return vl_video_buffer_create(pipe, templat);
 
    assert(templat->chroma_format == PIPE_VIDEO_CHROMA_FORMAT_420);
diff --git a/src/gallium/drivers/nouveau/nouveau_video.h b/src/gallium/drivers/nouveau/nouveau_video.h
index 1d6ced0..6306ac3 100644
--- a/src/gallium/drivers/nouveau/nouveau_video.h
+++ b/src/gallium/drivers/nouveau/nouveau_video.h
@@ -26,6 +26,8 @@ struct nouveau_decoder {
    struct nouveau_object *mpeg;
    struct nouveau_bo *cmd_bo, *data_bo, *fence_bo;
 
+   bool is8274;
+
    unsigned *fence_map;
    unsigned fence_seq;
 
diff --git a/src/gallium/drivers/nv30/nv30_context.c b/src/gallium/drivers/nv30/nv30_context.c
index bd05042..e872c02 100644
--- a/src/gallium/drivers/nv30/nv30_context.c
+++ b/src/gallium/drivers/nv30/nv30_context.c
@@ -257,5 +257,7 @@ nv30_context_create(struct pipe_screen *pscreen, void *priv)
       return NULL;
    }
 
+   nouveau_context_init_vdec(&nv30->base);
+
    return pipe;
 }
diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 3d55d6f..40e8b5f 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -377,6 +377,7 @@ nv30_screen_create(struct nouveau_device *dev)
    pscreen->context_create = nv30_context_create;
    pscreen->is_format_supported = nv30_screen_is_format_supported;
    nv30_resource_screen_init(pscreen);
+   nouveau_screen_init_vdec(&screen->base);
 
    screen->base.fence.emit = nv30_screen_fence_emit;
    screen->base.fence.update = nv30_screen_fence_update;
-- 
1.8.1.5
