From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: enable H.264 for NV98+ (VP3, VP4.0)
Date: Fri,  6 Dec 2013 23:43:07 -0500
Message-ID: <1386391387-26182-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Create the ref_bo without any storage type flags set for now. This can
probably be split up somehow later on, but this seems to work.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---

Would be great if someone could see if this also makes MPEG4 work on NVA3+. In
order to do that, remove the if (chipset < 0xc0) conditional entirely from
nouveau_vp3_video.c (which I modify in this patch).

 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 5 +++--
 src/gallium/drivers/nouveau/nv50/nv98_video.c   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index 07ce016..2f4196c 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -362,10 +362,11 @@ nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
    enum pipe_video_format codec = u_reduce_video_profile(profile);
    switch (param) {
    case PIPE_VIDEO_CAP_SUPPORTED:
-      /* For now, h264 and mpeg4 don't work on pre-nvc0. */
+      /* For now, mpeg4 doesn't work on pre-nvc0. */
       if (chipset < 0xc0)
          return codec == PIPE_VIDEO_FORMAT_MPEG12 ||
-            codec == PIPE_VIDEO_FORMAT_VC1;
+            codec == PIPE_VIDEO_FORMAT_VC1 ||
+            codec == PIPE_VIDEO_FORMAT_MPEG4_AVC;
       /* In the general case, this should work, once the pre-nvc0 problems are
        * resolved. */
       return profile >= PIPE_VIDEO_PROFILE_MPEG1 && (
diff --git a/src/gallium/drivers/nouveau/nv50/nv98_video.c b/src/gallium/drivers/nouveau/nv50/nv98_video.c
index 069481d..f748c81 100644
--- a/src/gallium/drivers/nouveau/nv50/nv98_video.c
+++ b/src/gallium/drivers/nouveau/nv50/nv98_video.c
@@ -200,7 +200,7 @@ nv98_create_decoder(struct pipe_context *context,
    dec->ref_stride = mb(templ->width)*16 * (mb_half(templ->height)*32 + nouveau_vp3_video_align(templ->height)/2);
    ret = nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM, 0,
                         dec->ref_stride * (templ->max_references+2) + tmp_size,
-                        &cfg, &dec->ref_bo);
+                        NULL, &dec->ref_bo);
    if (ret)
       goto fail;
 
-- 
1.8.3.2
