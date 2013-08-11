From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 09/10] nv50: separate video logic from noalloc
Date: Sun, 11 Aug 2013 03:19:17 -0400
Message-ID: <1376205558-23540-10-git-send-email-imirkin@alum.mit.edu>
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

The upcoming vp3 logic will want the video layout, but allocated by the
miptree.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nv50/nv50_miptree.c  | 6 ++++--
 src/gallium/drivers/nv50/nv50_resource.h | 1 +
 src/gallium/drivers/nv50/nv84_video.c    | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 28be768..461710e 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -335,8 +335,10 @@ nv50_miptree_create(struct pipe_screen *pscreen,
 
    if (unlikely(pt->flags & NV50_RESOURCE_FLAG_VIDEO)) {
       nv50_miptree_init_layout_video(mt);
-      /* BO allocation done by client */
-      return pt;
+      if (pt->flags & NV50_RESOURCE_FLAG_NOALLOC) {
+         /* BO allocation done by client */
+         return pt;
+      }
    } else
    if (bo_config.nv50.memtype != 0) {
       nv50_miptree_init_layout_tiled(mt);
diff --git a/src/gallium/drivers/nv50/nv50_resource.h b/src/gallium/drivers/nv50/nv50_resource.h
index c520a72..b104404 100644
--- a/src/gallium/drivers/nv50/nv50_resource.h
+++ b/src/gallium/drivers/nv50/nv50_resource.h
@@ -17,6 +17,7 @@ void
 nv50_screen_init_resource_functions(struct pipe_screen *pscreen);
 
 #define NV50_RESOURCE_FLAG_VIDEO (NOUVEAU_RESOURCE_FLAG_DRV_PRIV << 0)
+#define NV50_RESOURCE_FLAG_NOALLOC (NOUVEAU_RESOURCE_FLAG_DRV_PRIV << 1)
 
 #define NV50_TILE_SHIFT_X(m) 6
 #define NV50_TILE_SHIFT_Y(m) ((((m) >> 4) & 0xf) + 2)
diff --git a/src/gallium/drivers/nv50/nv84_video.c b/src/gallium/drivers/nv50/nv84_video.c
index d5f6295..b24ea8f 100644
--- a/src/gallium/drivers/nv50/nv84_video.c
+++ b/src/gallium/drivers/nv50/nv84_video.c
@@ -669,7 +669,7 @@ nv84_video_buffer_create(struct pipe_context *pipe,
    templ.format = PIPE_FORMAT_R8_UNORM;
    templ.width0 = align(template->width, 2);
    templ.height0 = align(template->height, 4) / 2;
-   templ.flags = NV50_RESOURCE_FLAG_VIDEO;
+   templ.flags = NV50_RESOURCE_FLAG_VIDEO | NV50_RESOURCE_FLAG_NOALLOC;
    templ.array_size = 2;
 
    cfg.nv50.tile_mode = 0x20;
-- 
1.8.1.5
