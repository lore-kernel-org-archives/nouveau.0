From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 3/4] nv30: hook up PMPEG support via
	nouveau_video, enables XvMC to work
Date: Sat, 10 Aug 2013 06:39:57 -0400
Message-ID: <1376131198-3506-3-git-send-email-imirkin@alum.mit.edu>
References: <1376131198-3506-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1376131198-3506-1-git-send-email-imirkin@alum.mit.edu>
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

Force the format to be the reasonable format that doesn't require an
inverse z-scan.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Tested this on both nv44 and nv96, and it works, all at the same time. Without
the 0x72 command, they default to different scan orders. Putting the 0x72
command only at the beginning (in nouveau_vpe_init) seemed to cause pmpeg to
hang.

 src/gallium/drivers/nouveau/nouveau_video.c | 27 ++++++++++++---------------
 src/gallium/drivers/nv30/nv30_context.c     |  2 ++
 src/gallium/drivers/nv30/nv30_screen.c      |  1 +
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_video.c b/src/gallium/drivers/nouveau/nouveau_video.c
index 2e7f9b1..cbe2477 100644
--- a/src/gallium/drivers/nouveau/nouveau_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_video.c
@@ -108,21 +108,10 @@ nouveau_vpe_mb_dct_blocks(struct nouveau_decoder *dec, const struct pipe_mpeg12_
    short *db = mb->blocks;
    for (cbb = 0x20; cbb > 0; cbb >>= 1) {
       if (cbb & cbp) {
-         static const int lookup[64] = {
-             0, 1, 8,16, 9, 2, 3,10,
-            17,24,32,25,18,11, 4, 5,
-            12,19,26,33,40,48,41,34,
-            27,20,13, 6, 7,14,21,28,
-            35,42,49,56,57,50,43,36,
-            29,22,15,23,30,37,44,51,
-            58,59,52,45,38,31,39,46,
-            53,60,61,54,47,55,62,63
-         };
-         int i, j = 0, found = 0;
+         int i, found = 0;
          for (i = 0; i < 64; ++i) {
-            if (!db[lookup[i]]) { j += 2; continue; }
-            dec->data[dec->data_pos++] = (db[lookup[i]] << 16) | j;
-            j = 0;
+            if (!db[i]) continue;
+            dec->data[dec->data_pos++] = (db[i] << 16) | (i * 2);
             found = 1;
          }
          if (found)
@@ -443,6 +432,11 @@ nouveau_decoder_decode_macroblock(struct pipe_video_decoder *decoder,
       dec->past = nouveau_decoder_surface_index(dec, desc->ref[0]);
 
    if (nouveau_vpe_init(dec)) return;
+
+   /* initialize scan order */
+   nouveau_vpe_write(dec, 0x720000c0);
+   nouveau_vpe_write(dec, dec->data_pos);
+
    mb = (const struct pipe_mpeg12_macroblock *)pipe_mb;
    for (i = 0; i < num_macroblocks; ++i, mb++) {
       if (mb->macroblock_type & PIPE_MPEG12_MB_TYPE_INTRA) {
@@ -528,6 +522,8 @@ nouveau_create_decoder(struct pipe_context *context,
       goto vl;
    if (screen->device->chipset >= 0x98 && screen->device->chipset != 0xa0)
       goto vl;
+   if (screen->device->chipset < 0x31 || screen->device->chipset == 0x35)
+      goto vl;
 
    dec = CALLOC_STRUCT(nouveau_decoder);
    if (!dec)
@@ -793,7 +789,8 @@ nouveau_video_buffer_create(struct pipe_context *pipe,
     * and it only supports the NV12 format
     */
    if (templat->buffer_format != PIPE_FORMAT_NV12 || getenv("XVMC_VL") ||
-       (screen->device->chipset >= 0x98 && screen->device->chipset != 0xa0))
+       (screen->device->chipset >= 0x98 && screen->device->chipset != 0xa0) ||
+       screen->device->chipset < 0x31 || screen->device->chipset == 0x35)
       return vl_video_buffer_create(pipe, templat);
 
    assert(templat->chroma_format == PIPE_VIDEO_CHROMA_FORMAT_420);
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
