From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nouveau: resume display if any later suspend
	bits fail
Date: Thu, 23 Jan 2014 02:45:02 -0500
Message-ID: <1390463102-1054-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

If either idling channels or suspending the fence were to fail, the
display would never be resumed. Also if a client fails, resume the fence
(not functionally important, but it would potentially leak memory).

See https://bugs.freedesktop.org/show_bug.cgi?id=70213

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Untested, but makes sense given that the bug report has cursor setting
failures, and suspending the display kills the cursor.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 466037c..bfd02410 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -503,19 +503,21 @@ nouveau_do_suspend(struct drm_device *dev)
 	if (drm->cechan) {
 		ret = nouveau_channel_idle(drm->cechan);
 		if (ret)
-			return ret;
+			goto fail_display;
 	}
 
 	if (drm->channel) {
 		ret = nouveau_channel_idle(drm->channel);
 		if (ret)
-			return ret;
+			goto fail_display;
 	}
 
 	NV_INFO(drm, "suspending client object trees...\n");
 	if (drm->fence && nouveau_fence(drm)->suspend) {
-		if (!nouveau_fence(drm)->suspend(drm))
-			return -ENOMEM;
+		if (!nouveau_fence(drm)->suspend(drm)) {
+			ret = -ENOMEM;
+			goto fail_display;
+		}
 	}
 
 	list_for_each_entry(cli, &drm->clients, head) {
@@ -537,6 +539,10 @@ fail_client:
 		nouveau_client_init(&cli->base);
 	}
 
+	if (drm->fence && nouveau_fence(drm)->resume)
+		nouveau_fence(drm)->resume(drm);
+
+fail_display:
 	if (dev->mode_config.num_crtc) {
 		NV_INFO(drm, "resuming display...\n");
 		nouveau_display_resume(dev);
-- 
1.8.3.2
