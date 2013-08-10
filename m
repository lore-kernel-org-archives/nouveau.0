From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/4] nouveau: fix number of surfaces in video
	buffer, use defines
Date: Sat, 10 Aug 2013 06:39:55 -0400
Message-ID: <1376131198-3506-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

The pipe_surface miscount caused issues for my (failed) attempt at getting
vdpau to work with pmpeg.

 src/gallium/drivers/nouveau/nouveau_video.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_video.h b/src/gallium/drivers/nouveau/nouveau_video.h
index 1d6ced0..be53758 100644
--- a/src/gallium/drivers/nouveau/nouveau_video.h
+++ b/src/gallium/drivers/nouveau/nouveau_video.h
@@ -10,10 +10,10 @@
 struct nouveau_video_buffer {
    struct pipe_video_buffer base;
    unsigned num_planes;
-   struct pipe_resource     *resources[3];
-   struct pipe_sampler_view *sampler_view_planes[3];
-   struct pipe_sampler_view *sampler_view_components[3];
-   struct pipe_surface      *surfaces[3];
+   struct pipe_resource     *resources[VL_NUM_COMPONENTS];
+   struct pipe_sampler_view *sampler_view_planes[VL_NUM_COMPONENTS];
+   struct pipe_sampler_view *sampler_view_components[VL_NUM_COMPONENTS];
+   struct pipe_surface      *surfaces[VL_NUM_COMPONENTS * 2];
 };
 
 struct nouveau_decoder {
-- 
1.8.1.5
