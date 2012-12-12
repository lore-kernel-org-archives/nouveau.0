From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 36/37] drm: only grab the crtc lock for pageflips
Date: Wed, 12 Dec 2012 14:07:16 +0100
Message-ID: <1355317637-16742-37-git-send-email-daniel.vetter@ffwll.ch>
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

The pagelip ioctl itself is rather simply, so the hard work for this
patch is auditing all the drivers:

- exynos: Pageflip is protect with dev->struct_mutex and ...
  synchronous. But nothing fancy going on, besides a check whether the
  crtc is enabled, which should probably be somewhere in the drm core
  so that we have unified behaviour across all drivers.

- i915: hw-state is protected with dev->struct_mutex, the delayed
  unpin work together with the other stuff the pageflip complete irq
  handler needs is protected by the event_lock spinlock.

- nouveau: With the pin/unpin functions fixed, everything looks safe:
  A bit of ttm wrestling and refcounting, and a few channel accesses.
  The later are either already proteced sufficiently, or are now safe
  with the channel locking introduced to make cursor updates safe.

- radeon: The irq_get/put functions look a bit race, since the
  atomic_inc/dec isn't protect with locks. Otoh they're all per-crtc,
  so we should be safe with per-crtc locking from the drm core. Then
  there's tons of per-crtc register access, which could potentially go
  through the indirect reg acces. But that's fixed to make cursor
  updates concurrent. Bookeeping for the drm even is also protected
  with the even_lock, which also protects against the pageflip irq
  handler since radeon hw seems to have no way to queue these up
  asynchronously. Otherwise just a bit of ttm-based buffer handling
  and fencing, which is now safe with the previous patch to hold
  bdev->fence_lock while grabbing the ttm fence.

- shmob: Only one crtc. That's an easy one ...

- vmwgfx: As usual a bit special with tons different things:
  - Flippable check using is_implicit and num_implicit. Changes to
    those seem to be nicely covered with the global modeset lock, so
    we should be fine.
  - Some dirty cliprect handling stuff, or at least that is my guess.
    Looks like it's fine since either it's per-crtc, invariant or
    (like the execbuf stuff launched) protected otherwise.
  - Adding the actual flip to the fence_event list. On a quick look
    this seems to have solid locking in place, too.
  ... but generally this is all way over my head.

- imx: Impressive display of races between the page_flip
  implementation and the irq handler. Also, ipu_drm_set_base which
  gets eventually called from the irq handler to update the display
  base isn't really protected against concurrent set_config calls from
  process context.  In any case, going for per-crtc locking won't make
  this worse, so nothing to do.

- omap: Does just some prep work on per-crtc data and grabs a ref on
  the backing storage, then calls down into omap_gem_op_async which
  does some nicely-protected async callback stuff, or directly calls
  the passed-in page_flip_cb. That seems to lock most of the stuff it
  touches properly, safe for the eventually called omap_plane_dpms,
  which updates modeset state. Which will be a problem if this is
  called asynchronously, since the sync_op waiter callback code in
  omap_gem.c does not seem to take the right modeset locks. So looks a
  bit racy already with the old locking, and no worse off with the new
  per-crtc locks.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 6dd441c..36c75e6 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -3716,12 +3716,12 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	    page_flip->reserved != 0)
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, page_flip->crtc_id, DRM_MODE_OBJECT_CRTC);
 	if (!obj)
-		goto out;
+		return -EINVAL;
 	crtc = obj_to_crtc(obj);
 
+	mutex_lock(&crtc->mutex);
 	if (crtc->fb == NULL) {
 		/* The framebuffer is currently unbound, presumably
 		 * due to a hotplug event, that userspace has not
@@ -3803,7 +3803,8 @@ out:
 		drm_framebuffer_unreference(fb);
 	if (old_fb)
 		drm_framebuffer_unreference(old_fb);
-	drm_modeset_unlock_all(dev);
+	mutex_unlock(&crtc->mutex);
+
 	return ret;
 }
 
-- 
1.7.10.4
