From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 06/10] nvc0: move some of the simpler decoder
	functions into nouveau
Date: Sun, 11 Aug 2013 03:19:14 -0400
Message-ID: <1376205558-23540-7-git-send-email-imirkin@alum.mit.edu>
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
 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 63 ++++++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_vp3_video.h |  3 ++
 src/gallium/drivers/nvc0/nvc0_video.c           | 65 ++-----------------------
 3 files changed, 69 insertions(+), 62 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index a55c2e8..6abc581 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -163,3 +163,66 @@ error:
    nouveau_vp3_video_buffer_destroy(&buffer->base);
    return NULL;
 }
+
+static void
+nouveau_vp3_decoder_flush(struct pipe_video_decoder *decoder)
+{
+}
+
+static void
+nouveau_vp3_decoder_begin_frame(struct pipe_video_decoder *decoder,
+                                struct pipe_video_buffer *target,
+                                struct pipe_picture_desc *picture)
+{
+}
+
+static void
+nouveau_vp3_decoder_end_frame(struct pipe_video_decoder *decoder,
+                              struct pipe_video_buffer *target,
+                              struct pipe_picture_desc *picture)
+{
+}
+
+static void
+nouveau_vp3_decoder_destroy(struct pipe_video_decoder *decoder)
+{
+   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
+   int i;
+
+   nouveau_bo_ref(NULL, &dec->ref_bo);
+   nouveau_bo_ref(NULL, &dec->bitplane_bo);
+   nouveau_bo_ref(NULL, &dec->inter_bo[0]);
+   nouveau_bo_ref(NULL, &dec->inter_bo[1]);
+#if NOUVEAU_VP3_DEBUG_FENCE
+   nouveau_bo_ref(NULL, &dec->fence_bo);
+#endif
+   nouveau_bo_ref(NULL, &dec->fw_bo);
+
+   for (i = 0; i < NOUVEAU_VP3_VIDEO_QDEPTH; ++i)
+      nouveau_bo_ref(NULL, &dec->bsp_bo[i]);
+
+   nouveau_object_del(&dec->bsp);
+   nouveau_object_del(&dec->vp);
+   nouveau_object_del(&dec->ppp);
+
+   if (dec->channel[0] != dec->channel[1]) {
+      for (i = 0; i < 3; ++i) {
+         nouveau_pushbuf_del(&dec->pushbuf[i]);
+         nouveau_object_del(&dec->channel[i]);
+      }
+   } else {
+      nouveau_pushbuf_del(dec->pushbuf);
+      nouveau_object_del(dec->channel);
+   }
+
+   FREE(dec);
+}
+
+void
+nouveau_vp3_decoder_init_common(struct pipe_video_decoder *dec)
+{
+   dec->destroy = nouveau_vp3_decoder_destroy;
+   dec->flush = nouveau_vp3_decoder_flush;
+   dec->begin_frame = nouveau_vp3_decoder_begin_frame;
+   dec->end_frame = nouveau_vp3_decoder_end_frame;
+}
diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.h b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
index 8d3548a..cb088fe 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.h
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.h
@@ -197,6 +197,9 @@ nouveau_vp3_video_buffer_create(struct pipe_context *pipe,
                                 const struct pipe_video_buffer *templat,
                                 int flags);
 
+void
+nouveau_vp3_decoder_init_common(struct pipe_video_decoder *decoder);
+
 uint32_t
 nouveau_vp3_bsp(struct nouveau_vp3_decoder *dec,  union pipe_desc desc,
                 struct nouveau_vp3_video_buffer *target,
diff --git a/src/gallium/drivers/nvc0/nvc0_video.c b/src/gallium/drivers/nvc0/nvc0_video.c
index 73963c2..2ba17b4 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.c
+++ b/src/gallium/drivers/nvc0/nvc0_video.c
@@ -85,62 +85,6 @@ nvc0_decoder_decode_bitstream(struct pipe_video_decoder *decoder,
    nvc0_decoder_ppp(dec, desc, target, comm_seq);
 }
 
-static void
-nvc0_decoder_flush(struct pipe_video_decoder *decoder)
-{
-   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
-   (void)dec;
-}
-
-static void
-nvc0_decoder_begin_frame(struct pipe_video_decoder *decoder,
-                         struct pipe_video_buffer *target,
-                         struct pipe_picture_desc *picture)
-{
-}
-
-static void
-nvc0_decoder_end_frame(struct pipe_video_decoder *decoder,
-                       struct pipe_video_buffer *target,
-                       struct pipe_picture_desc *picture)
-{
-}
-
-static void
-nvc0_decoder_destroy(struct pipe_video_decoder *decoder)
-{
-   struct nouveau_vp3_decoder *dec = (struct nouveau_vp3_decoder *)decoder;
-   int i;
-
-   nouveau_bo_ref(NULL, &dec->ref_bo);
-   nouveau_bo_ref(NULL, &dec->bitplane_bo);
-   nouveau_bo_ref(NULL, &dec->inter_bo[0]);
-   nouveau_bo_ref(NULL, &dec->inter_bo[1]);
-#if NOUVEAU_VP3_DEBUG_FENCE
-   nouveau_bo_ref(NULL, &dec->fence_bo);
-#endif
-   nouveau_bo_ref(NULL, &dec->fw_bo);
-
-   for (i = 0; i < NOUVEAU_VP3_VIDEO_QDEPTH; ++i)
-      nouveau_bo_ref(NULL, &dec->bsp_bo[i]);
-
-   nouveau_object_del(&dec->bsp);
-   nouveau_object_del(&dec->vp);
-   nouveau_object_del(&dec->ppp);
-
-   if (dec->channel[0] != dec->channel[1]) {
-      for (i = 0; i < 3; ++i) {
-         nouveau_pushbuf_del(&dec->pushbuf[i]);
-         nouveau_object_del(&dec->channel[i]);
-      }
-   } else {
-      nouveau_pushbuf_del(dec->pushbuf);
-      nouveau_object_del(dec->channel);
-   }
-
-   FREE(dec);
-}
-
 static void nvc0_video_getpath(enum pipe_video_profile profile, char *path)
 {
    switch (u_reduce_video_profile(profile)) {
@@ -200,6 +144,7 @@ nvc0_create_decoder(struct pipe_context *context,
    if (!dec)
       return NULL;
    dec->client = screen->client;
+   nouveau_vp3_decoder_init_common(&dec->base);
 
    if (!kepler) {
       dec->bsp_idx = 5;
@@ -282,11 +227,7 @@ nvc0_create_decoder(struct pipe_context *context,
    dec->base.width = width;
    dec->base.height = height;
    dec->base.max_references = max_references;
-   dec->base.destroy = nvc0_decoder_destroy;
-   dec->base.flush = nvc0_decoder_flush;
    dec->base.decode_bitstream = nvc0_decoder_decode_bitstream;
-   dec->base.begin_frame = nvc0_decoder_begin_frame;
-   dec->base.end_frame = nvc0_decoder_end_frame;
 
    for (i = 0; i < NOUVEAU_VP3_VIDEO_QDEPTH && !ret; ++i)
       ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM,
@@ -497,12 +438,12 @@ nvc0_create_decoder(struct pipe_context *context,
 
 fw_fail:
    debug_printf("Cannot create decoder without firmware..\n");
-   nvc0_decoder_destroy(&dec->base);
+   dec->base.destroy(&dec->base);
    return NULL;
 
 fail:
    debug_printf("Creation failed: %s (%i)\n", strerror(-ret), ret);
-   nvc0_decoder_destroy(&dec->base);
+   dec->base.destroy(&dec->base);
    return NULL;
 }
 
-- 
1.8.1.5
