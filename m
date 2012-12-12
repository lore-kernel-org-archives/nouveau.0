From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 26/37] drm: fb refcounting for dirtyfb_ioctl
Date: Wed, 12 Dec 2012 14:07:06 +0100
Message-ID: <1355317637-16742-27-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

We only need to ensure that the fb stays around for long enough. While
at it, only grab the modeset locks when we need them (since most
drivers don't implement the dirty callback, this should help jitter
and stalls when using the generic modeset driver).

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_crtc.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 28838cf..8132e13 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2561,14 +2561,9 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
 	fb = drm_framebuffer_lookup(dev, r->fb_id);
-	if (!fb) {
-		ret = -EINVAL;
-		goto out_err1;
-	}
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
+	if (!fb)
+		return -EINVAL;
 
 	num_clips = r->num_clips;
 	clips_ptr = (struct drm_clip_rect __user *)(unsigned long)r->clips_ptr;
@@ -2606,17 +2601,19 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 	}
 
 	if (fb->funcs->dirty) {
+		drm_modeset_lock_all(dev);
 		ret = fb->funcs->dirty(fb, file_priv, flags, r->color,
 				       clips, num_clips);
+		drm_modeset_unlock_all(dev);
 	} else {
 		ret = -ENOSYS;
-		goto out_err2;
 	}
 
 out_err2:
 	kfree(clips);
 out_err1:
-	drm_modeset_unlock_all(dev);
+	drm_framebuffer_unreference(fb);
+
 	return ret;
 }
 
-- 
1.7.10.4
