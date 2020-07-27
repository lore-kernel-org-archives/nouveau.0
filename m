From: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] i915: fall back to ACPI EDID retrieval
Date: Mon, 27 Jul 2020 15:53:55 -0500
Message-ID: <20200727205357.27839-3-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200727205357.27839-1-ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, david1.zhou-5C7GfCeVMHo@public.gmane.org
Cc: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Fall back to retrieving the EDID via the ACPI _DDC method, when present
for notebook internal panels, when EDID retrieval via the standard EDID
paths is unsuccessful.

Signed-off-by: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_lvds.c | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 804b1d966f66..ff402cef8183 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5657,6 +5657,7 @@ static struct edid *
 intel_dp_get_edid(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct edid *edid;
 
 	/* use cached edid if we have one */
 	if (intel_connector->edid) {
@@ -5666,8 +5667,13 @@ intel_dp_get_edid(struct intel_dp *intel_dp)
 
 		return drm_edid_duplicate(intel_connector->edid);
 	} else
-		return drm_get_edid(&intel_connector->base,
+		edid = drm_get_edid(&intel_connector->base,
 				    &intel_dp->aux.ddc);
+
+	if (!edid && intel_dp_is_edp(intel_dp))
+		edid = drm_get_edid_acpi();
+
+	return edid;
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 9a067effcfa0..811eea3f5d9f 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -946,6 +946,10 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	else
 		edid = drm_get_edid(connector,
 				    intel_gmbus_get_adapter(dev_priv, pin));
+
+	if (!edid)
+		edid = drm_get_edid_acpi();
+
 	if (edid) {
 		if (drm_add_edid_modes(connector, edid)) {
 			drm_connector_update_edid_property(connector,
-- 
2.18.4
