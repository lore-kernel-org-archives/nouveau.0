From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 19/37] drm/gma500: move fbcon restore to lastclose
Date: Wed, 12 Dec 2012 14:06:59 +0100
Message-ID: <1355317637-16742-20-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-driver-ati>
List-Post: <mailto:xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Doing this within the fb->destroy callback leads to a locking
nightmare. And all other drm drivers that restore the fbcon do
it in lastclose, too.

With this adjustments all fb->destroy callbacks optionally drop
references to any gem objects used as backing storage, call
drm_framebuffer_cleanup and then kfree the struct. Which nicely
simplifies the locking for framebuffer unreferencing and freeing,
since this doesn't require that we hold the mode_config lock. A
slight exception is the vmwgfx surface backed framebuffer, it also
calls drm_master_put and removes the object from a device-private
framebuffer list. Both seem to have solid locking in place already.

Conclusion is that now it is no longer required to hold the
mode_config lock while freeing a framebuffer.

v2: Drop the corresponding mutex_lock WARN check from
drm_framebuffer_unreference.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c           |    2 --
 drivers/gpu/drm/gma500/framebuffer.c |   24 ------------------------
 drivers/gpu/drm/gma500/psb_drv.c     |   11 +++++++++++
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 75ffc3b..17cdd32 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -412,9 +412,7 @@ EXPORT_SYMBOL(drm_framebuffer_lookup);
  */
 void drm_framebuffer_unreference(struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = fb->dev;
 	DRM_DEBUG("FB ID: %d\n", fb->base.id);
-	WARN_ON(!drm_modeset_is_locked(dev));
 	kref_put(&fb->refcount, drm_framebuffer_free);
 }
 EXPORT_SYMBOL(drm_framebuffer_unreference);
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 38e7e75..49800d2 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -668,30 +668,6 @@ static void psb_user_framebuffer_destroy(struct drm_framebuffer *fb)
 {
 	struct psb_framebuffer *psbfb = to_psb_fb(fb);
 	struct gtt_range *r = psbfb->gtt;
-	struct drm_device *dev = fb->dev;
-	struct drm_psb_private *dev_priv = dev->dev_private;
-	struct psb_fbdev *fbdev = dev_priv->fbdev;
-	struct drm_crtc *crtc;
-	int reset = 0;
-
-	/* Should never get stolen memory for a user fb */
-	WARN_ON(r->stolen);
-
-	/* Check if we are erroneously live */
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
-		if (crtc->fb == fb)
-			reset = 1;
-
-	if (reset)
-		/*
-		 * Now force a sane response before we permit the DRM CRTC
-		 * layer to do stupid things like blank the display. Instead
-		 * we reset this framebuffer as if the user had forced a reset.
-		 * We must do this before the cleanup so that the DRM layer
-		 * doesn't get a chance to stick its oar in where it isn't
-		 * wanted.
-		 */
-		drm_fb_helper_restore_fbdev_mode(&fbdev->psb_fb_helper);
 
 	/* Let DRM do its clean up */
 	drm_framebuffer_cleanup(fb);
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2bf0c92..5518305 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -149,6 +149,17 @@ static struct drm_ioctl_desc psb_ioctls[] = {
 
 static void psb_lastclose(struct drm_device *dev)
 {
+	int ret;
+	struct drm_psb_private *dev_priv = dev->dev_private;
+	struct psb_fbdev *fbdev = dev_priv->fbdev;
+
+	drm_modeset_lock_all(dev);
+	ret = drm_fb_helper_restore_fbdev_mode(&fbdev->psb_fb_helper);
+	if (ret)
+		DRM_DEBUG("failed to restore crtc mode\n");
+
+	drm_modeset_unlock_all(dev);
+
 	return;
 }
 
-- 
1.7.10.4
