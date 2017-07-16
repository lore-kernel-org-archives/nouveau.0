From: Mike Galbraith <efault@gmx.de>
Subject: Re: [drm/nouveau] GeForce 8600 GT boot/suspend grumbling
Date: Sun, 16 Jul 2017 06:43:56 +0200
Message-ID: <1500180236.5334.7.camel@gmx.de>
References: <1500097200.6712.17.camel@gmx.de>
         <CAKb7UvgO9ajtFAcj-OmfvG4mcyhASdaNa5PNTqLbN9Uskzvw6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvgO9ajtFAcj-OmfvG4mcyhASdaNa5PNTqLbN9Uskzvw6Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Sat, 2017-07-15 at 14:52 -0400, Ilia Mirkin wrote:
> 
> OK, so this issue appears to be that we're calling
> drm_crtc_vblank_off() on a crtc for which vblank is already disabled.
> My guess is that this happens because the crtc is disabled.
> 
> Not sure what the proper check is to see if vblanks are already disabled...

Seems so, the below shut up suspend for both 8600 GT and GTX 980.

---
 drivers/gpu/drm/drm_vblank.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -323,6 +323,14 @@ void drm_vblank_disable_and_save(struct
 	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);
 
 	/*
+	 * Always update the count and timestamp to maintain the
+	 * appearance that the counter has been ticking all along until
+	 * this time. This makes the count account for the entire time
+	 * between drm_crtc_vblank_on() and drm_crtc_vblank_off().
+	 */
+	drm_update_vblank_count(dev, pipe, false);
+
+	/*
 	 * Only disable vblank interrupts if they're enabled. This avoids
 	 * calling the ->disable_vblank() operation in atomic context with the
 	 * hardware potentially runtime suspended.
@@ -332,14 +340,6 @@ void drm_vblank_disable_and_save(struct
 		vblank->enabled = false;
 	}
 
-	/*
-	 * Always update the count and timestamp to maintain the
-	 * appearance that the counter has been ticking all along until
-	 * this time. This makes the count account for the entire time
-	 * between drm_crtc_vblank_on() and drm_crtc_vblank_off().
-	 */
-	drm_update_vblank_count(dev, pipe, false);
-
 	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
 }
 
@@ -605,7 +605,7 @@ bool drm_calc_vbltimestamp_from_scanoutp
 	 */
 	if (mode->crtc_clock == 0) {
 		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
-		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
+		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev) && vblank->enabled);
 
 		return false;
 	}
