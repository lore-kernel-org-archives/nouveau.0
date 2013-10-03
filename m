From: Christoph Rudorff <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] drm/nouveau/fb: fix suspend/resume fbcon
Date: Thu, 03 Oct 2013 16:41:52 +0200
Message-ID: <1380811312.8640.6.camel@localhost>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On resume of a hibernated notebook, I get garbled virtual consoles.

fb_set_suspend(*dev, state == 0 means dev is running ...)

This patch fixes that issue for me:

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

https://bugs.freedesktop.org/buglist.cgi?query_format=specific&order=relevance+desc&bug_status=__open__&product=&content=PAGE_NOT_PRESENT

https://bugs.freedesktop.org/show_bug.cgi?id=58556
https://bugs.freedesktop.org/show_bug.cgi?id=62835
https://bugs.freedesktop.org/show_bug.cgi?id=68037
https://bugs.freedesktop.org/show_bug.cgi?id=69029
https://bugs.freedesktop.org/show_bug.cgi?id=69928
---
 drivers/gpu/drm/nouveau/nouveau_drm.c   |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 383f4e6..6148758 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -544,7 +544,7 @@ nouveau_do_resume(struct drm_device *dev)
 	nouveau_pm_resume(dev);
 
 	if (dev->mode_config.num_crtc) {
-		NV_INFO(drm, "resuming display...\n");
+		NV_INFO(drm, "resuming display and fbcon...\n");
 		nouveau_display_resume(dev);
 	}
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index b035317..46e37c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -514,10 +514,10 @@ void nouveau_fbcon_set_suspend(struct drm_device *dev, int state)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	console_lock();
 	if (state == 0)
-		nouveau_fbcon_save_disable_accel(dev);
+		nouveau_fbcon_restore_accel(dev);
 	fb_set_suspend(drm->fbcon->helper.fbdev, state);
 	if (state == 1)
-		nouveau_fbcon_restore_accel(dev);
+		nouveau_fbcon_save_disable_accel(dev);
 	console_unlock();
 }
 
-- 
1.7.10.4
