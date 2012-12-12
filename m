From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 10/37] drm: add per-crtc locks
Date: Wed, 12 Dec 2012 14:06:50 +0100
Message-ID: <1355317637-16742-11-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

*drumroll*

The basic idea is to protect per-crtc state which can change without
touching the output configuration with separate mutexes, i.e.  all the
input side state to a crtc like framebuffers, cursor settings or plane
configuration. Holding such a crtc lock gives a read-lock on all the
other crtc state which can be changed by e.g. a modeset.

All non-crtc state is still protected by the mode_config mutex.
Callers that need to change modeset state of a crtc (e.g. dpms or
set_mode) need to grab both the mode_config lock and nested within any
crtc locks.

Note that since there can only ever be one holder of the mode_config
lock we can grab the subordinate crtc locks in any order (if we need
to grab more than one of them). Lockdep can handle such nesting with
the mutex_lock_nest_lock call correctly.

With this functions that only touch connectors/encoders but not crtcs
only need to take the mode_config lock. The biggest such case is the
output probing, which means that we can now pageflip and move cursors
while the output probe code is reading an edid.

Most cases neatly fall into the three buckets:
- Only touches connectors and similar output state and so only needs
  the mode_config lock.
- Touches the global configuration and so needs all locks.
- Only touches the crtc input side and so only needs the crtc lock.

But a few cases that need special consideration:

- Load detection which requires a crtc. The mode_config lock already
  prevents a modeset change, so we can use any unused crtc as we like
  to do load detection. The only thing to consider is that such
  temporary state changes don't leak out to userspace through ioctls
  that only take the crtc look (like a pageflip). Hence the load
  detect code needs to grab the crtc of any output pipes it touches
  (but only if it touches state used by the pageflip or cursor
  ioctls).

- Atomic pageflip when moving planes. The first case is sane hw, where
  planes have a fixed association with crtcs - nothing needs to be
  done there. More insane^Wflexible hw needs to have plane->crtc
  mapping which is separately protect with a lock that nests within
  the crtc lock. If the plane is unused we can just assign it to the
  current crtc and continue. But if a plane is already in use by
  another crtc we can't just reassign it.

  Two solution present themselves: Either go back to a slow-path which
  takes all modeset locks, potentially incure quite a hefty delay. Or
  simply disallowing such changes in one atomic pageflip - in general
  the vblanks of two crtcs are not synced, so there's no sane way to
  atomically flip such plane changes accross more than one crtc. I'd
  heavily favour the later approach, going as far as mandating it as
  part of the ABI of such a new a nuclear pageflip.

  And if we _really_ want such semantics, we can always get them by
  introducing another pageflip mutex between the mode_config.mutex and
  the individual crtc locks. Pageflips crossing more than one crtc
  would then need to take that lock first, to lock out concurrent
  multi-crtc pageflips.

- Optimized global modeset operations: We could just take the
  mode_config lock and then lazily lock all crtc which are affected by
  a modeset operation. This has the advantage that pageflip could
  continue unhampered on unaffected crtc. But if e.g. global resources
  like plls need to be reassigned and so affect unrelated crtcs we can
  still do that - nested locking works in any order.

This patch just adds the locks and takes them in drm_modeset_lock_all,
no real locking changes yet.

v2: Need to initialize the new lock in crtc_init and lock it righ
away, for otherwise the modeset_unlock_all below will try to unlock a
not-locked mutex.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_crtc.c |   12 ++++++++++++
 include/drm/drm_crtc.h     |    9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 5d223af..91e8068 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -46,7 +46,12 @@
  */
 void drm_modeset_lock_all(struct drm_device *dev)
 {
+	struct drm_crtc *crtc;
+
 	mutex_lock(&dev->mode_config.mutex);
+
+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
+		mutex_lock_nest_lock(&crtc->mutex, &dev->mode_config.mutex);
 }
 EXPORT_SYMBOL(drm_modeset_lock_all);
 
@@ -56,6 +61,11 @@ EXPORT_SYMBOL(drm_modeset_lock_all);
  */
 void drm_modeset_unlock_all(struct drm_device *dev)
 {
+	struct drm_crtc *crtc;
+
+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
+		mutex_unlock(&crtc->mutex);
+
 	mutex_unlock(&dev->mode_config.mutex);
 }
 EXPORT_SYMBOL(drm_modeset_unlock_all);
@@ -451,6 +461,8 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	crtc->invert_dimensions = false;
 
 	drm_modeset_lock_all(dev);
+	mutex_init(&crtc->mutex);
+	mutex_lock_nest_lock(&crtc->mutex, &dev->mode_config.mutex);
 
 	ret = drm_mode_object_get(dev, &crtc->base, DRM_MODE_OBJECT_CRTC);
 	if (ret)
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index b487922..f1296ce 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -390,6 +390,15 @@ struct drm_crtc {
 	struct drm_device *dev;
 	struct list_head head;
 
+	/**
+	 * crtc mutex
+	 *
+	 * This provides a read lock for the overall crtc state (mode, dpms
+	 * state, ...) and a write lock for everything which can be update
+	 * without a full modeset (fb, cursor data, ...)
+	 */
+	struct mutex mutex;
+
 	struct drm_mode_object base;
 
 	/* framebuffer the connector is currently bound to */
-- 
1.7.10.4
