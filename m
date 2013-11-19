From: Christoph Rudorff <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] drm/nouveau/fbcon: fix suspend/resume fbcon
Date: Tue, 19 Nov 2013 17:59:13 +0100
Message-ID: <1384880353.25836.12.camel@localhost>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Current code disables fbcon acceleration before fbcon is suspended,
leading to corrupted console after resume from s2disk. In a similar
fashion we must make sure that fbcon acceleration is enabled before we
revive the console.

With this patch s2disk works correctly on my MacBookPro6,2 with GT216
[GeForce GT 330M]

hibernate:
kernel: nouveau  [     DRM] suspending fbcon...
kernel: nouveau  [     DRM] suspending display...
kernel: nouveau  [     DRM] unpinning framebuffer(s)...
kernel: nouveau  [     DRM] evicting buffers...
kernel: nouveau  [     DRM] waiting for kernel channels to go idle...
kernel: nouveau  [     DRM] suspending client object trees...
kernel: nouveau  [     DRM] suspending kernel object tree...
resume:
kernel: nouveau  [     DRM] re-enabling device...
kernel: nouveau  [     DRM] resuming kernel object tree...
kernel: nouveau  [   VBIOS][0000:01:00.0] running init tables
kernel: nouveau  [     DRM] resuming client object trees...
kernel: nouveau  [     DRM] resuming display...
kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe000 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe000 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe240 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe400 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT

http://lists.freedesktop.org/archives/nouveau/2013-October/014656.html
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index b035317..3fa6628 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -513,11 +513,11 @@ void nouveau_fbcon_set_suspend(struct drm_device *dev, int state)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	console_lock();
-	if (state == 0)
-		nouveau_fbcon_save_disable_accel(dev);
-	fb_set_suspend(drm->fbcon->helper.fbdev, state);
-	if (state == 1)
+	if (state == FBINFO_STATE_RUNNING)
 		nouveau_fbcon_restore_accel(dev);
+	fb_set_suspend(drm->fbcon->helper.fbdev, state);
+	if (state == FBINFO_STATE_SUSPENDED)
+		nouveau_fbcon_save_disable_accel(dev);
 	console_unlock();
 }
 
-- 
1.7.10.4
