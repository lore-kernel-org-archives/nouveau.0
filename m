From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 02/37] drm/doc: integrate drm_crtc.c kerneldoc
Date: Wed, 12 Dec 2012 14:06:42 +0100
Message-ID: <1355317637-16742-3-git-send-email-daniel.vetter@ffwll.ch>
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

And do a quick pass to adjust them to the last few (years?) of changes
...

This time actually compile-tested ;-)

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 Documentation/DocBook/drm.tmpl |    4 ++
 drivers/gpu/drm/drm_crtc.c     |   92 +++++++++++++++++++---------------------
 2 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/Documentation/DocBook/drm.tmpl b/Documentation/DocBook/drm.tmpl
index 4ee2304..caab791 100644
--- a/Documentation/DocBook/drm.tmpl
+++ b/Documentation/DocBook/drm.tmpl
@@ -1609,6 +1609,10 @@ void intel_crt_init(struct drm_device *dev)
         make its properties available to applications.
       </para>
     </sect2>
+    <sect2>
+      <title>KMS API Functions</title>
+!Edrivers/gpu/drm/drm_crtc.c
+    </sect2>
   </sect1>
 
   <!-- Internals: kms helper functions -->
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 7902d3c..f22d4a7 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -203,10 +203,10 @@ char *drm_get_connector_status_name(enum drm_connector_status status)
 }
 
 /**
- * drm_mode_object_get - allocate a new identifier
+ * drm_mode_object_get - allocate a new modeset identifier
  * @dev: DRM device
- * @ptr: object pointer, used to generate unique ID
- * @type: object type
+ * @obj: object pointer, used to generate unique ID
+ * @obj_type: object type
  *
  * Create a unique identifier based on @ptr in @dev's identifier space.  Used
  * for tracking modes, CRTCs and connectors.
@@ -241,9 +241,9 @@ again:
 }
 
 /**
- * drm_mode_object_put - free an identifer
+ * drm_mode_object_put - free a modeset identifer
  * @dev: DRM device
- * @id: ID to free
+ * @object: object to free
  *
  * Free @id from @dev's unique identifier pool.
  */
@@ -273,6 +273,8 @@ EXPORT_SYMBOL(drm_mode_object_find);
 /**
  * drm_framebuffer_init - initialize a framebuffer
  * @dev: DRM device
+ * @fb: framebuffer to be initialized
+ * @funcs: ... with these functions
  *
  * Allocates an ID for the framebuffer's parent mode object, sets its mode
  * functions & device file and adds it to the master fd list.
@@ -309,6 +311,9 @@ static void drm_framebuffer_free(struct kref *kref)
 
 /**
  * drm_framebuffer_unreference - unref a framebuffer
+ * @fb: framebuffer to unref
+ *
+ * This functions decrements the fb's refcount and frees it if it drops to zero.
  */
 void drm_framebuffer_unreference(struct drm_framebuffer *fb)
 {
@@ -321,6 +326,7 @@ EXPORT_SYMBOL(drm_framebuffer_unreference);
 
 /**
  * drm_framebuffer_reference - incr the fb refcnt
+ * @fb: framebuffer
  */
 void drm_framebuffer_reference(struct drm_framebuffer *fb)
 {
@@ -493,7 +499,7 @@ EXPORT_SYMBOL(drm_mode_remove);
  * @dev: DRM device
  * @connector: the connector to init
  * @funcs: callbacks for this connector
- * @name: user visible name of the connector
+ * @connector_type: user visible type of the connector
  *
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
@@ -1145,10 +1151,9 @@ static int drm_crtc_convert_umode(struct drm_display_mode *out,
 
 /**
  * drm_mode_getresources - get graphics configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Construct a set of configuration description structures and return
  * them to the user, including CRTC, connector and framebuffer configuration.
@@ -1330,10 +1335,9 @@ out:
 
 /**
  * drm_mode_getcrtc - get CRTC configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Construct a CRTC configuration structure to return to the user.
  *
@@ -1387,10 +1391,9 @@ out:
 
 /**
  * drm_mode_getconnector - get connector configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Construct a connector configuration structure to return to the user.
  *
@@ -1675,7 +1678,7 @@ out:
  * drm_mode_setplane - set up or tear down an plane
  * @dev: DRM device
  * @data: ioctl data*
- * @file_prive: DRM file info
+ * @file_priv: DRM file info
  *
  * Set plane info, including placement, fb, scaling, and other factors.
  * Or pass a NULL fb to disable.
@@ -1801,10 +1804,9 @@ out:
 
 /**
  * drm_mode_setcrtc - set CRTC configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Build a new CRTC configuration based on user request.
  *
@@ -2056,10 +2058,9 @@ EXPORT_SYMBOL(drm_mode_legacy_fb_format);
 
 /**
  * drm_mode_addfb - add an FB to the graphics configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Add a new FB to the specified CRTC, given a user request.
  *
@@ -2237,10 +2238,9 @@ static int framebuffer_check(const struct drm_mode_fb_cmd2 *r)
 
 /**
  * drm_mode_addfb2 - add an FB to the graphics configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Add a new FB to the specified CRTC, given a user request with format.
  *
@@ -2300,10 +2300,9 @@ out:
 
 /**
  * drm_mode_rmfb - remove an FB from the configuration
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Remove the FB specified by the user.
  *
@@ -2352,10 +2351,9 @@ out:
 
 /**
  * drm_mode_getfb - get FB info
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Lookup the FB given its ID and return info about it.
  *
@@ -2471,7 +2469,7 @@ out_err1:
 
 /**
  * drm_fb_release - remove and free the FBs on this file
- * @filp: file * from the ioctl
+ * @priv: drm file for the ioctl
  *
  * Destroy all the FBs associated with @filp.
  *
@@ -2581,10 +2579,9 @@ EXPORT_SYMBOL(drm_mode_detachmode_crtc);
 
 /**
  * drm_fb_attachmode - Attach a user mode to an connector
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * This attaches a user specified mode to an connector.
  * Called by the user via ioctl.
@@ -2636,10 +2633,9 @@ out:
 
 /**
  * drm_fb_detachmode - Detach a user specified mode from an connector
- * @inode: inode from the ioctl
- * @filp: file * from the ioctl
- * @cmd: cmd from ioctl
- * @arg: arg from ioctl
+ * @dev: drm device for the ioctl
+ * @data: data pointer for the ioctl
+ * @file_priv: drm file for the ioctl call
  *
  * Called by the user via ioctl.
  *
-- 
1.7.10.4
