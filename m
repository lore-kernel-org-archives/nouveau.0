From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v5 01/10] drm/vblank: Register drmm cleanup action once per drm_vblank_crtc
Date: Mon, 22 Jun 2020 16:07:21 -0400
Message-ID: <20200622200730.120716-2-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Since we'll be allocating resources for kthread_create_worker() in the
next commit (which could fail and require us to clean up the mess),
let's simplify the cleanup process a bit by registering a
drm_vblank_init_release() action for each drm_vblank_crtc so they're
still cleaned up if we fail to initialize one of them.

Changes since v3:
* Use drmm_add_action_or_reset() - Daniel Vetter

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_vblank.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 85e5f2db16085..ce5c1e1d29963 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -492,16 +492,12 @@ static void vblank_disable_fn(struct timer_list *t)
 
 static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
 {
-	unsigned int pipe;
-
-	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
-		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = ptr;
 
-		drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
-			    drm_core_check_feature(dev, DRIVER_MODESET));
+	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
+		    drm_core_check_feature(dev, DRIVER_MODESET));
 
-		del_timer_sync(&vblank->disable_timer);
-	}
+	del_timer_sync(&vblank->disable_timer);
 }
 
 /**
@@ -511,7 +507,7 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
  *
  * This function initializes vblank support for @num_crtcs display pipelines.
  * Cleanup is handled automatically through a cleanup function added with
- * drmm_add_action().
+ * drmm_add_action_or_reset().
  *
  * Returns:
  * Zero on success or a negative error code on failure.
@@ -530,10 +526,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 
 	dev->num_crtcs = num_crtcs;
 
-	ret = drmm_add_action(dev, drm_vblank_init_release, NULL);
-	if (ret)
-		return ret;
-
 	for (i = 0; i < num_crtcs; i++) {
 		struct drm_vblank_crtc *vblank = &dev->vblank[i];
 
@@ -542,6 +534,11 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 		init_waitqueue_head(&vblank->queue);
 		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
 		seqlock_init(&vblank->seqlock);
+
+		ret = drmm_add_action_or_reset(dev, drm_vblank_init_release,
+					       vblank);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.26.2
