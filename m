From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] nv50: enable MPEG-4 for NVA3+ (VP4.0)
Date: Sat,  7 Dec 2013 14:11:22 +0100
Message-ID: <1386421882-25352-1-git-send-email-martin.peres@free.fr>
References: <1386391387-26182-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1386391387-26182-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>, "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

This patch is a follow-up from Ilia Mirkin's enable H.264 patch which
solves the problem that prevented MPEG-4 videos to play correctly.

Tested on an nva3.

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Cc: "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_vp3_video.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
index 2f4196c..0843b78 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
@@ -362,11 +362,6 @@ nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
    enum pipe_video_format codec = u_reduce_video_profile(profile);
    switch (param) {
    case PIPE_VIDEO_CAP_SUPPORTED:
-      /* For now, mpeg4 doesn't work on pre-nvc0. */
-      if (chipset < 0xc0)
-         return codec == PIPE_VIDEO_FORMAT_MPEG12 ||
-            codec == PIPE_VIDEO_FORMAT_VC1 ||
-            codec == PIPE_VIDEO_FORMAT_MPEG4_AVC;
       /* In the general case, this should work, once the pre-nvc0 problems are
        * resolved. */
       return profile >= PIPE_VIDEO_PROFILE_MPEG1 && (
-- 
1.8.4.2
