From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 02/10] nvc0: standardize on using #if for
	NVC0_DEBUG_FENCE
Date: Sun, 11 Aug 2013 03:19:10 -0400
Message-ID: <1376205558-23540-3-git-send-email-imirkin@alum.mit.edu>
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
 src/gallium/drivers/nvc0/nvc0_video.c     | 2 +-
 src/gallium/drivers/nvc0/nvc0_video.h     | 6 +++---
 src/gallium/drivers/nvc0/nvc0_video_bsp.c | 4 ++--
 src/gallium/drivers/nvc0/nvc0_video_ppp.c | 2 +-
 src/gallium/drivers/nvc0/nvc0_video_vp.c  | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nvc0/nvc0_video.c b/src/gallium/drivers/nvc0/nvc0_video.c
index 626d0d4..18de2ed 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.c
+++ b/src/gallium/drivers/nvc0/nvc0_video.c
@@ -116,7 +116,7 @@ nvc0_decoder_destroy(struct pipe_video_decoder *decoder)
    nouveau_bo_ref(NULL, &dec->bitplane_bo);
    nouveau_bo_ref(NULL, &dec->inter_bo[0]);
    nouveau_bo_ref(NULL, &dec->inter_bo[1]);
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
    nouveau_bo_ref(NULL, &dec->fence_bo);
 #endif
    nouveau_bo_ref(NULL, &dec->fw_bo);
diff --git a/src/gallium/drivers/nvc0/nvc0_video.h b/src/gallium/drivers/nvc0/nvc0_video.h
index 271ed5c..67eca7c 100644
--- a/src/gallium/drivers/nvc0/nvc0_video.h
+++ b/src/gallium/drivers/nvc0/nvc0_video.h
@@ -33,9 +33,9 @@
 #define VP_OFFSET 0x200
 #define COMM_OFFSET 0x500
 
-//#define NVC0_DEBUG_FENCE 1
+#define NVC0_DEBUG_FENCE 0
 
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
 # define NVC0_VIDEO_QDEPTH 1
 #else
 # define NVC0_VIDEO_QDEPTH 2
@@ -59,7 +59,7 @@ struct nvc0_decoder {
    struct nouveau_object *channel[3], *bsp, *vp, *ppp;
    struct nouveau_pushbuf *pushbuf[3];
 
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
    /* dump fence and comm, as needed.. */
    unsigned *fence_map;
    struct comm *comm;
diff --git a/src/gallium/drivers/nvc0/nvc0_video_bsp.c b/src/gallium/drivers/nvc0/nvc0_video_bsp.c
index 8f93861..bdb9c64 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_bsp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_bsp.c
@@ -261,7 +261,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
    struct nouveau_pushbuf_refn bo_refs[] = {
       { bsp_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
       { inter_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
       { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
 #endif
       { dec->bitplane_bo, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
@@ -271,7 +271,7 @@ nvc0_decoder_bsp(struct nvc0_decoder *dec, union pipe_desc desc,
    if (!dec->bitplane_bo)
       num_refs--;
 
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
    fence_extra = 4;
 #endif
 
diff --git a/src/gallium/drivers/nvc0/nvc0_video_ppp.c b/src/gallium/drivers/nvc0/nvc0_video_ppp.c
index 823e360..836add3 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_ppp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_ppp.c
@@ -36,7 +36,7 @@ nvc0_decoder_setup_ppp(struct nvc0_decoder *dec, struct nouveau_vp3_video_buffer
       { NULL, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { NULL, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { dec->ref_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
       { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
 #endif
    };
diff --git a/src/gallium/drivers/nvc0/nvc0_video_vp.c b/src/gallium/drivers/nvc0/nvc0_video_vp.c
index 7c1691c..74e3915 100644
--- a/src/gallium/drivers/nvc0/nvc0_video_vp.c
+++ b/src/gallium/drivers/nvc0/nvc0_video_vp.c
@@ -543,7 +543,7 @@ nvc0_decoder_vp(struct nvc0_decoder *dec, union pipe_desc desc,
       { inter_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { dec->ref_bo, NOUVEAU_BO_WR | NOUVEAU_BO_VRAM },
       { bsp_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
-#ifdef NVC0_DEBUG_FENCE
+#if NVC0_DEBUG_FENCE
       { dec->fence_bo, NOUVEAU_BO_WR | NOUVEAU_BO_GART },
 #endif
       { dec->fw_bo, NOUVEAU_BO_RD | NOUVEAU_BO_VRAM },
-- 
1.8.1.5
