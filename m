From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 3/5] drm/i915: Leave intel_conn->mst_port set, use mst_port_gone instead
Date: Thu,  4 Oct 2018 20:29:52 -0400
Message-ID: <20181005002956.7317-4-lyude@redhat.com>
References: <20181005002956.7317-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005002956.7317-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, stable@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Currently we set intel_connector->mst_port to NULL to signify that the
MST port has been removed from the system so that we can prevent further
action on the port such as connector probes, mode probing, etc.
However, we're going to need access to intel_connector->mst_port in
order to fixup ->best_encoder() so that it can always return the correct
encoder for an MST port to prevent legacy DPMS prop changes from
failing. This should be safe, so instead keep intel_connector->mst_port
always set and instead add intel_connector->mst_port_gone in order to
signify whether or not the connector has disappeared from the system.

Changes since v2:
- Add a comment to mst_port_gone (Jani Nikula)
- Change mst_port_gone to a u8 instead of a bool, per the kernel bot.
  Apparently bool is discouraged in structs these days

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/intel_dp_mst.c | 14 +++++++-------
 drivers/gpu/drm/i915/intel_drv.h    |  6 ++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index 4ecd65375603..fcb9b87b9339 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -311,9 +311,8 @@ static int intel_dp_mst_get_ddc_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (!intel_dp) {
+	if (intel_connector->mst_port_gone)
 		return intel_connector_update_modes(connector, NULL);
-	}
 
 	edid = drm_dp_mst_get_edid(connector, &intel_dp->mst_mgr, intel_connector->port);
 	ret = intel_connector_update_modes(connector, edid);
@@ -328,9 +327,10 @@ intel_dp_mst_detect(struct drm_connector *connector, bool force)
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	struct intel_dp *intel_dp = intel_connector->mst_port;
 
-	if (!intel_dp)
+	if (intel_connector->mst_port_gone)
 		return connector_status_disconnected;
-	return drm_dp_mst_detect_port(connector, &intel_dp->mst_mgr, intel_connector->port);
+	return drm_dp_mst_detect_port(connector, &intel_dp->mst_mgr,
+				      intel_connector->port);
 }
 
 static void
@@ -370,7 +370,7 @@ intel_dp_mst_mode_valid(struct drm_connector *connector,
 	int bpp = 24; /* MST uses fixed bpp */
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 
-	if (!intel_dp)
+	if (intel_connector->mst_port_gone)
 		return MODE_ERROR;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
@@ -402,7 +402,7 @@ static struct drm_encoder *intel_mst_atomic_best_encoder(struct drm_connector *c
 	struct intel_dp *intel_dp = intel_connector->mst_port;
 	struct intel_crtc *crtc = to_intel_crtc(state->crtc);
 
-	if (!intel_dp)
+	if (intel_connector->mst_port_gone)
 		return NULL;
 	return &intel_dp->mst_encoders[crtc->pipe]->base.base;
 }
@@ -514,7 +514,7 @@ static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 						   connector);
 	/* prevent race with the check in ->detect */
 	drm_modeset_lock(&connector->dev->mode_config.connection_mutex, NULL);
-	intel_connector->mst_port = NULL;
+	intel_connector->mst_port_gone = true;
 	drm_modeset_unlock(&connector->dev->mode_config.connection_mutex);
 
 	drm_connector_put(connector);
diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/intel_drv.h
index 8fc61e96754f..8261d4579452 100644
--- a/drivers/gpu/drm/i915/intel_drv.h
+++ b/drivers/gpu/drm/i915/intel_drv.h
@@ -410,6 +410,12 @@ struct intel_connector {
 
 	struct intel_dp *mst_port;
 
+	/*
+	 * Set to 1 if this is an MST connector that was removed from the
+	 * system and unregistered from sysfs
+	 */
+	u8 mst_port_gone;
+
 	/* Work struct to schedule a uevent on link train failure */
 	struct work_struct modeset_retry_work;
 
-- 
2.17.1
