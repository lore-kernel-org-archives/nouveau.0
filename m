From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 4/5] drm/i915: Skip vcpi allocation for MSTB ports that are gone
Date: Mon,  8 Oct 2018 18:52:59 -0400
Message-ID: <20181008225303.2907-5-lyude@redhat.com>
References: <20181008225303.2907-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008225303.2907-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Since we need to be able to allow DPMS on->off prop changes after an MST
port has disappeared from the system, we need to be able to make sure we
can compute a config for the resulting atomic commit. Currently this is
impossible when the port has disappeared, since the VCPI slot searching
we try to do in intel_dp_mst_compute_config() will fail with -EINVAL.

Since the only commits we want to allow on no-longer-present MST ports
are ones that shut off display hardware, we already know that no VCPI
allocations are needed. So, hardcode the VCPI slot count to 0 when
intel_dp_mst_compute_config() is called on an MST port that's gone.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: stable@vger.kernel.org

Changes since V4:
- Don't use mst_port_gone at all, just check whether or not the drm
  connector is registered - Daniel Vetter

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/intel_dp_mst.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index aa21742d8634..0f14c0d1669c 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -38,11 +38,11 @@ static bool intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(&encoder->base);
 	struct intel_digital_port *intel_dig_port = intel_mst->primary;
 	struct intel_dp *intel_dp = &intel_dig_port->dp;
-	struct intel_connector *connector =
-		to_intel_connector(conn_state->connector);
+	struct drm_connector *connector = conn_state->connector;
+	void *port = to_intel_connector(connector)->port;
 	struct drm_atomic_state *state = pipe_config->base.state;
 	int bpp;
-	int lane_count, slots;
+	int lane_count, slots = 0;
 	const struct drm_display_mode *adjusted_mode = &pipe_config->base.adjusted_mode;
 	int mst_pbn;
 	bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
@@ -70,17 +70,23 @@ static bool intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	pipe_config->port_clock = intel_dp_max_link_rate(intel_dp);
 
-	if (drm_dp_mst_port_has_audio(&intel_dp->mst_mgr, connector->port))
+	if (drm_dp_mst_port_has_audio(&intel_dp->mst_mgr, port))
 		pipe_config->has_audio = true;
 
 	mst_pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock, bpp);
 	pipe_config->pbn = mst_pbn;
 
-	slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
-					      connector->port, mst_pbn);
-	if (slots < 0) {
-		DRM_DEBUG_KMS("failed finding vcpi slots:%d\n", slots);
-		return false;
+	/* Zombie connectors can't have VCPI slots */
+	if (READ_ONCE(connector->registered)) {
+		slots = drm_dp_atomic_find_vcpi_slots(state,
+						      &intel_dp->mst_mgr,
+						      port,
+						      mst_pbn);
+		if (slots < 0) {
+			DRM_DEBUG_KMS("failed finding vcpi slots:%d\n",
+				      slots);
+			return false;
+		}
 	}
 
 	intel_link_compute_m_n(bpp, lane_count,
-- 
2.17.1
