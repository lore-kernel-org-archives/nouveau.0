From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 37/37] drm: don't hold crtc mutexes for connector
	->detect callbacks
Date: Wed, 12 Dec 2012 14:07:17 +0100
Message-ID: <1355317637-16742-38-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The coup de grace of the entire journey. No more dropped frames every
10s on my testbox!

I've tried to audit all ->detect and ->get_modes callbacks, but things
became a bit fuzzy after trying to piece together the umpteenth
implemenation. Afaict most drivers just have bog-standard output
register frobbing with a notch of i2c edid reading, nothing which
could potentially race with the newly concurrent pageflip/set_cursor
code. The big exception is load-detection code which requires a
running pipe, but radeon/nouveau seem to to this without touching any
state which can be observed from page_flip (e.g. disabled crtcs
temporarily getting enabled and so a pageflip succeeding).

The only special case I could find is the i915 load detect code. That
uses the normal modeset interface to enable the load-detect crtc, and
so userspace could try to squeeze in a pageflip on the load-detect
pipe. So we need to grab the relevant crtc mutex in there, to avoid
the temporary crtc enabling to sneak out and be visible to userspace.

Note that the sysfs files already stopped grabbing the per-crtc locks,
since I didn't want to bother with doing a interruptible
modeset_lock_all. But since there's very little in-between breakage
(essentially just the ability for userspace to pageflip on load-detect
crtcs when it shouldn't on the i915 driver) I figured I don't need to
bother.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c           |    5 +++--
 drivers/gpu/drm/drm_crtc_helper.c    |    8 ++++----
 drivers/gpu/drm/i915/intel_display.c |   10 ++++++++--
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 36c75e6..313d7d2 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1616,7 +1616,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 
 	DRM_DEBUG_KMS("[CONNECTOR:%d:?]\n", out_resp->connector_id);
 
-	drm_modeset_lock_all(dev);
+	mutex_lock(&dev->mode_config.mutex);
 
 	obj = drm_mode_object_find(dev, out_resp->connector_id,
 				   DRM_MODE_OBJECT_CONNECTOR);
@@ -1713,7 +1713,8 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	out_resp->count_encoders = encoders_count;
 
 out:
-	drm_modeset_unlock_all(dev);
+	mutex_unlock(&dev->mode_config.mutex);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 400ef86..7b2d378 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -980,7 +980,7 @@ static void output_poll_execute(struct work_struct *work)
 	if (!drm_kms_helper_poll)
 		return;
 
-	drm_modeset_lock_all(dev);
+	mutex_lock(&dev->mode_config.mutex);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 
 		/* Ignore forced connectors. */
@@ -1010,7 +1010,7 @@ static void output_poll_execute(struct work_struct *work)
 			changed = true;
 	}
 
-	drm_modeset_unlock_all(dev);
+	mutex_unlock(&dev->mode_config.mutex);
 
 	if (changed)
 		drm_kms_helper_hotplug_event(dev);
@@ -1070,7 +1070,7 @@ void drm_helper_hpd_irq_event(struct drm_device *dev)
 	if (!dev->mode_config.poll_enabled)
 		return;
 
-	drm_modeset_lock_all(dev);
+	mutex_lock(&dev->mode_config.mutex);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 
 		/* Only handle HPD capable connectors. */
@@ -1088,7 +1088,7 @@ void drm_helper_hpd_irq_event(struct drm_device *dev)
 			changed = true;
 	}
 
-	drm_modeset_unlock_all(dev);
+	mutex_unlock(&dev->mode_config.mutex);
 
 	if (changed)
 		drm_kms_helper_hotplug_event(dev);
diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index fd8cfeb..2429d39 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -6390,6 +6390,8 @@ bool intel_get_load_detect_pipe(struct drm_connector *connector,
 	if (encoder->crtc) {
 		crtc = encoder->crtc;
 
+		mutex_lock(&crtc->mutex);
+
 		old->dpms_mode = connector->dpms;
 		old->load_detect_temp = false;
 
@@ -6419,6 +6421,7 @@ bool intel_get_load_detect_pipe(struct drm_connector *connector,
 		return false;
 	}
 
+	mutex_lock(&crtc->mutex);
 	intel_encoder->new_crtc = to_intel_crtc(crtc);
 	to_intel_connector(connector)->new_encoder = intel_encoder;
 
@@ -6446,6 +6449,7 @@ bool intel_get_load_detect_pipe(struct drm_connector *connector,
 		DRM_DEBUG_KMS("reusing fbdev for load-detection framebuffer\n");
 	if (IS_ERR(fb)) {
 		DRM_DEBUG_KMS("failed to allocate framebuffer for load-detection\n");
+		mutex_unlock(&crtc->mutex);
 		return false;
 	}
 
@@ -6453,6 +6457,7 @@ bool intel_get_load_detect_pipe(struct drm_connector *connector,
 		DRM_DEBUG_KMS("failed to set mode on load-detect pipe\n");
 		if (old->release_fb)
 			old->release_fb->funcs->destroy(old->release_fb);
+		mutex_unlock(&crtc->mutex);
 		return false;
 	}
 
@@ -6467,14 +6472,13 @@ void intel_release_load_detect_pipe(struct drm_connector *connector,
 	struct intel_encoder *intel_encoder =
 		intel_attached_encoder(connector);
 	struct drm_encoder *encoder = &intel_encoder->base;
+	struct drm_crtc *crtc = encoder->crtc;
 
 	DRM_DEBUG_KMS("[CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
 		      connector->base.id, drm_get_connector_name(connector),
 		      encoder->base.id, drm_get_encoder_name(encoder));
 
 	if (old->load_detect_temp) {
-		struct drm_crtc *crtc = encoder->crtc;
-
 		to_intel_connector(connector)->new_encoder = NULL;
 		intel_encoder->new_crtc = NULL;
 		intel_set_mode(crtc, NULL, 0, 0, NULL);
@@ -6490,6 +6494,8 @@ void intel_release_load_detect_pipe(struct drm_connector *connector,
 	/* Switch crtc and encoder back off if necessary */
 	if (old->dpms_mode != DRM_MODE_DPMS_ON)
 		connector->funcs->dpms(connector, old->dpms_mode);
+
+	mutex_unlock(&crtc->mutex);
 }
 
 /* Returns the clock of the currently programmed mode of the given pipe. */
-- 
1.7.10.4
