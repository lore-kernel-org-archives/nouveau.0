From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 09/37] drm/vmgfx: use drm_modeset_lock_all
Date: Wed, 12 Dec 2012 14:06:49 +0100
Message-ID: <1355317637-16742-10-git-send-email-daniel.vetter@ffwll.ch>
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

Ok, this one here is a bit more complicated, but for an RFC I've
figured I can be a bit sloppy. So just convert ever mutex_lock call,
including the interruptible one. Since other places (e.g. in the
execbuf ioctl) take the mode_config.mutex without bothering with
interruptible handling, I've figured I should be able to get away with
this in a few more places ...

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c |   18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 2f7c08e..13e4371 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -161,11 +161,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 		goto out_no_copy;
 	}
 
-	ret = mutex_lock_interruptible(&dev->mode_config.mutex);
-	if (unlikely(ret != 0)) {
-		ret = -ERESTARTSYS;
-		goto out_no_mode_mutex;
-	}
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, arg->fb_id, DRM_MODE_OBJECT_FB);
 	if (!obj) {
@@ -198,8 +194,7 @@ out_no_surface:
 	ttm_read_unlock(&vmaster->lock);
 out_no_ttm_lock:
 out_no_fb:
-	mutex_unlock(&dev->mode_config.mutex);
-out_no_mode_mutex:
+	drm_modeset_unlock_all(dev);
 out_no_copy:
 	kfree(clips);
 out_clips:
@@ -249,11 +244,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 		goto out_no_copy;
 	}
 
-	ret = mutex_lock_interruptible(&dev->mode_config.mutex);
-	if (unlikely(ret != 0)) {
-		ret = -ERESTARTSYS;
-		goto out_no_mode_mutex;
-	}
+	drm_modeset_lock_all(dev);
 
 	obj = drm_mode_object_find(dev, arg->fb_id, DRM_MODE_OBJECT_FB);
 	if (!obj) {
@@ -280,8 +271,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 	ttm_read_unlock(&vmaster->lock);
 out_no_ttm_lock:
 out_no_fb:
-	mutex_unlock(&dev->mode_config.mutex);
-out_no_mode_mutex:
+	drm_modeset_unlock_all(dev);
 out_no_copy:
 	kfree(clips);
 out_clips:
-- 
1.7.10.4
