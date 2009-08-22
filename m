From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] drm/nv04: Turn every CRTC off before
	restoring the hardware state.
Date: Sat, 22 Aug 2009 02:11:26 +0200
Message-ID: <1250899888-7945-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

5ef5f72febfea420ce58f670bad83830a5e5e3de broke VGA console restore
because it makes drm_framebuffer_cleanup() turn off every CRTC with an
associated framebuffer: do it by ourselves before the original
hardware state is written out.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_display.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index 32f504d..7b4d5c0 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -228,6 +228,15 @@ nv04_display_destroy(struct drm_device *dev)
 
 	NV_DEBUG(dev, "\n");
 
+	/* Turn every CRTC off. */
+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+		struct drm_mode_set modeset = {
+			.crtc = crtc,
+		};
+
+		crtc->funcs->set_config(&modeset);
+	}
+
 	/* Restore state */
 	NVLockVgaCrtcs(dev, false);
 
-- 
1.6.3.3
