From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 01/37] drm: review locking rules in drm_crtc.c
Date: Wed, 12 Dec 2012 14:06:41 +0100
Message-ID: <1355317637-16742-2-git-send-email-daniel.vetter@ffwll.ch>
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

- config_cleanup was confused: It claimed that callers need to hold
  the modeset lock, but the connector|encoder_cleanup helpers grabbed
  that themselves (note that crtc_cleanup did _not_ grab the modeset
  lock). Which resulted in all drivers _not_ hodling the lock. Since
  this is for single-threaded cleanup code, drop the requirement from
  docs and also drop the lock_grabbing from all _cleanup functions.

- Kill the LOCKING section in the doctype, since clearly we're not
  good enough to keep them up-to-date. And misleading locking
  documentation is worse than useless (see e.g. the comment in the
  vmgfx driver about the cleanup mess). And since for most functions
  the very first line either grabs the lock or has a WARN_ON(!locked)
  the documentation doesn't really add anything.

- Instead put in some effort into explaining the only two special
  cases a bit better: config_init and config_cleanup are both called
  from single-threaded setup/teardown code, so don't do any locking.
  It's the driver's job though to enforce this.

- Where lacking, add a WARN_ON(!is_locked). Not many places though,
  since locking around fbdev setup/teardown is through-roughly screwed
  up, and so will break almost every single WARN annotation I've tried
  to add.

- Add a drm_modeset_is_locked helper - the Grate Modset Locking Rework
  will use the compiler to assist in the big reorg by renaming the
  mode lock, so start encapsulating things. Unfortunately this ended
  up in the "wrong" header file since it needs the definition of
  struct drm_device.

v2: Drop most WARNS again - we hit them all over the place, mostly in
the setup and teardown sequences. And trying to fix it up leads to
nice deadlocks, since the locking in the setup code is really
inconsistent.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_crtc.c |  105 ++++++--------------------------------------
 include/drm/drmP.h         |    5 +++
 2 files changed, 18 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index d6d0072..7902d3c 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -208,8 +208,6 @@ char *drm_get_connector_status_name(enum drm_connector_status status)
  * @ptr: object pointer, used to generate unique ID
  * @type: object type
  *
- * LOCKING:
- *
  * Create a unique identifier based on @ptr in @dev's identifier space.  Used
  * for tracking modes, CRTCs and connectors.
  *
@@ -247,9 +245,6 @@ again:
  * @dev: DRM device
  * @id: ID to free
  *
- * LOCKING:
- * Caller must hold DRM mode_config lock.
- *
  * Free @id from @dev's unique identifier pool.
  */
 static void drm_mode_object_put(struct drm_device *dev,
@@ -279,9 +274,6 @@ EXPORT_SYMBOL(drm_mode_object_find);
  * drm_framebuffer_init - initialize a framebuffer
  * @dev: DRM device
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Allocates an ID for the framebuffer's parent mode object, sets its mode
  * functions & device file and adds it to the master fd list.
  *
@@ -317,15 +309,12 @@ static void drm_framebuffer_free(struct kref *kref)
 
 /**
  * drm_framebuffer_unreference - unref a framebuffer
- *
- * LOCKING:
- * Caller must hold mode config lock.
  */
 void drm_framebuffer_unreference(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
 	DRM_DEBUG("FB ID: %d\n", fb->base.id);
-	WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
+	WARN_ON(!drm_modeset_is_locked(dev));
 	kref_put(&fb->refcount, drm_framebuffer_free);
 }
 EXPORT_SYMBOL(drm_framebuffer_unreference);
@@ -344,15 +333,13 @@ EXPORT_SYMBOL(drm_framebuffer_reference);
  * drm_framebuffer_cleanup - remove a framebuffer object
  * @fb: framebuffer to remove
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Scans all the CRTCs in @dev's mode_config.  If they're using @fb, removes
  * it, setting it to NULL.
  */
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
+
 	/*
 	 * This could be moved to drm_framebuffer_remove(), but for
 	 * debugging is nice to keep around the list of fb's that are
@@ -370,9 +357,6 @@ EXPORT_SYMBOL(drm_framebuffer_cleanup);
  * drm_framebuffer_remove - remove and unreference a framebuffer object
  * @fb: framebuffer to remove
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Scans all the CRTCs and planes in @dev's mode_config.  If they're
  * using @fb, removes it, setting it to NULL.
  */
@@ -384,6 +368,8 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 	struct drm_mode_set set;
 	int ret;
 
+	WARN_ON(!drm_modeset_is_locked(dev));
+
 	/* remove from any CRTC */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (crtc->fb == fb) {
@@ -421,9 +407,6 @@ EXPORT_SYMBOL(drm_framebuffer_remove);
  * @crtc: CRTC object to init
  * @funcs: callbacks for the new CRTC
  *
- * LOCKING:
- * Takes mode_config lock.
- *
  * Inits a new object created as base part of an driver crtc object.
  *
  * RETURNS:
@@ -460,9 +443,6 @@ EXPORT_SYMBOL(drm_crtc_init);
  * drm_crtc_cleanup - Cleans up the core crtc usage.
  * @crtc: CRTC to cleanup
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Cleanup @crtc. Removes from drm modesetting space
  * does NOT free object, caller does that.
  */
@@ -484,9 +464,6 @@ EXPORT_SYMBOL(drm_crtc_cleanup);
  * @connector: connector the new mode
  * @mode: mode data
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Add @mode to @connector's mode list for later use.
  */
 void drm_mode_probed_add(struct drm_connector *connector,
@@ -501,9 +478,6 @@ EXPORT_SYMBOL(drm_mode_probed_add);
  * @connector: connector list to modify
  * @mode: mode to remove
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Remove @mode from @connector's mode list, then free it.
  */
 void drm_mode_remove(struct drm_connector *connector,
@@ -521,9 +495,6 @@ EXPORT_SYMBOL(drm_mode_remove);
  * @funcs: callbacks for this connector
  * @name: user visible name of the connector
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
  *
@@ -577,9 +548,6 @@ EXPORT_SYMBOL(drm_connector_init);
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Cleans up the connector but doesn't free the object.
  */
 void drm_connector_cleanup(struct drm_connector *connector)
@@ -596,11 +564,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	list_for_each_entry_safe(mode, t, &connector->user_modes, head)
 		drm_mode_remove(connector, mode);
 
-	mutex_lock(&dev->mode_config.mutex);
 	drm_mode_object_put(dev, &connector->base);
 	list_del(&connector->head);
 	dev->mode_config.num_connector--;
-	mutex_unlock(&dev->mode_config.mutex);
 }
 EXPORT_SYMBOL(drm_connector_cleanup);
 
@@ -721,9 +687,6 @@ EXPORT_SYMBOL(drm_plane_cleanup);
  * drm_mode_create - create a new display mode
  * @dev: DRM device
  *
- * LOCKING:
- * Caller must hold DRM mode_config lock.
- *
  * Create a new drm_display_mode, give it an ID, and return it.
  *
  * RETURNS:
@@ -751,9 +714,6 @@ EXPORT_SYMBOL(drm_mode_create);
  * @dev: DRM device
  * @mode: mode to remove
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Free @mode's unique identifier, then free it.
  */
 void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode)
@@ -978,11 +938,13 @@ EXPORT_SYMBOL(drm_mode_create_dirty_info_property);
  * drm_mode_config_init - initialize DRM mode_configuration structure
  * @dev: DRM device
  *
- * LOCKING:
- * None, should happen single threaded at init time.
- *
  * Initialize @dev's mode_config structure, used for tracking the graphics
  * configuration of @dev.
+ *
+ * Since this initializes the modeset locks, no locking is possible. Which is no
+ * problem, since this should happen single threaded at init time. It is the
+ * driver's problem to ensure this guarantee.
+ *
  */
 void drm_mode_config_init(struct drm_device *dev)
 {
@@ -1057,12 +1019,13 @@ EXPORT_SYMBOL(drm_mode_group_init_legacy_group);
  * drm_mode_config_cleanup - free up DRM mode_config info
  * @dev: DRM device
  *
- * LOCKING:
- * Caller must hold mode config lock.
- *
  * Free up all the connectors and CRTCs associated with this DRM device, then
  * free up the framebuffers and associated buffer objects.
  *
+ * Note that since this /should/ happen single-threaded at driver/device
+ * teardown time, no locking is required. It's the driver's job to ensure that
+ * this guarantee actually holds true.
+ *
  * FIXME: cleanup any dangling user buffer objects too
  */
 void drm_mode_config_cleanup(struct drm_device *dev)
@@ -1112,9 +1075,6 @@ EXPORT_SYMBOL(drm_mode_config_cleanup);
  * @out: drm_mode_modeinfo struct to return to the user
  * @in: drm_display_mode to use
  *
- * LOCKING:
- * None.
- *
  * Convert a drm_display_mode into a drm_mode_modeinfo structure to return to
  * the user.
  */
@@ -1151,9 +1111,6 @@ static void drm_crtc_convert_to_umode(struct drm_mode_modeinfo *out,
  * @out: drm_display_mode to return to the user
  * @in: drm_mode_modeinfo to use
  *
- * LOCKING:
- * None.
- *
  * Convert a drm_mode_modeinfo into a drm_display_mode structure to return to
  * the caller.
  *
@@ -1193,9 +1150,6 @@ static int drm_crtc_convert_umode(struct drm_display_mode *out,
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Construct a set of configuration description structures and return
  * them to the user, including CRTC, connector and framebuffer configuration.
  *
@@ -1381,9 +1335,6 @@ out:
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Construct a CRTC configuration structure to return to the user.
  *
  * Called by the user via ioctl.
@@ -1441,9 +1392,6 @@ out:
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Construct a connector configuration structure to return to the user.
  *
  * Called by the user via ioctl.
@@ -1618,9 +1566,6 @@ out:
  * @data: ioctl data
  * @file_priv: DRM file info
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Return an plane count and set of IDs.
  */
 int drm_mode_getplane_res(struct drm_device *dev, void *data,
@@ -1667,9 +1612,6 @@ out:
  * @data: ioctl data
  * @file_priv: DRM file info
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Return plane info, including formats supported, gamma size, any
  * current fb, etc.
  */
@@ -1735,9 +1677,6 @@ out:
  * @data: ioctl data*
  * @file_prive: DRM file info
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Set plane info, including placement, fb, scaling, and other factors.
  * Or pass a NULL fb to disable.
  */
@@ -1867,9 +1806,6 @@ out:
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Build a new CRTC configuration based on user request.
  *
  * Called by the user via ioctl.
@@ -2125,9 +2061,6 @@ EXPORT_SYMBOL(drm_mode_legacy_fb_format);
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Add a new FB to the specified CRTC, given a user request.
  *
  * Called by the user via ioctl.
@@ -2309,9 +2242,6 @@ static int framebuffer_check(const struct drm_mode_fb_cmd2 *r)
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Add a new FB to the specified CRTC, given a user request with format.
  *
  * Called by the user via ioctl.
@@ -2375,9 +2305,6 @@ out:
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Remove the FB specified by the user.
  *
  * Called by the user via ioctl.
@@ -2430,9 +2357,6 @@ out:
  * @cmd: cmd from ioctl
  * @arg: arg from ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Lookup the FB given its ID and return info about it.
  *
  * Called by the user via ioctl.
@@ -2549,9 +2473,6 @@ out_err1:
  * drm_fb_release - remove and free the FBs on this file
  * @filp: file * from the ioctl
  *
- * LOCKING:
- * Takes mode config lock.
- *
  * Destroy all the FBs associated with @filp.
  *
  * Called by the user via ioctl.
diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index fad21c9..3c609ab 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -1276,6 +1276,11 @@ static inline int drm_device_is_unplugged(struct drm_device *dev)
 	return ret;
 }
 
+static inline bool drm_modeset_is_locked(struct drm_device *dev)
+{
+	return mutex_is_locked(&dev->mode_config.mutex);
+}
+
 /******************************************************************/
 /** \name Internal function definitions */
 /*@{*/
-- 
1.7.10.4
