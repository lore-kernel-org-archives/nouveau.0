From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 10/10] drm: extract drm_dp_max_lane_count helper
Date: Thu, 18 Oct 2012 10:15:32 +0200
Message-ID: <1350548132-3037-11-git-send-email-daniel.vetter@ffwll.ch>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: nouveau@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, xorg-driver-ati@lists.x.org, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/intel_dp.c      | 17 ++---------------
 drivers/gpu/drm/nouveau/nouveau_dp.c |  2 +-
 drivers/gpu/drm/radeon/atombios_dp.c |  7 +------
 include/drm/drm_dp_helper.h          |  7 +++++++
 4 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index fea768d..72fbd6c 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -127,19 +127,6 @@ intel_edp_target_clock(struct intel_encoder *intel_encoder,
 }
 
 static int
-intel_dp_max_lane_count(struct intel_dp *intel_dp)
-{
-	int max_lane_count = intel_dp->dpcd[DP_MAX_LANE_COUNT] & 0x1f;
-	switch (max_lane_count) {
-	case 1: case 2: case 4:
-		break;
-	default:
-		max_lane_count = 4;
-	}
-	return max_lane_count;
-}
-
-static int
 intel_dp_max_link_bw(struct intel_dp *intel_dp)
 {
 	int max_link_bw = intel_dp->dpcd[DP_MAX_LINK_RATE];
@@ -199,7 +186,7 @@ intel_dp_adjust_dithering(struct intel_dp *intel_dp,
 			  bool adjust_mode)
 {
 	int max_link_clock = intel_dp_link_clock(intel_dp_max_link_bw(intel_dp));
-	int max_lanes = intel_dp_max_lane_count(intel_dp);
+	int max_lanes = drm_dp_max_lane_count(intel_dp->dpcd);
 	int max_rate, mode_rate;
 
 	mode_rate = intel_dp_link_required(mode->clock, 24);
@@ -675,7 +662,7 @@ intel_dp_mode_fixup(struct drm_encoder *encoder,
 	struct drm_device *dev = encoder->dev;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	int lane_count, clock;
-	int max_lane_count = intel_dp_max_lane_count(intel_dp);
+	int max_lane_count = drm_dp_max_lane_count(intel_dp->dpcd);
 	int max_clock = intel_dp_max_link_bw(intel_dp) == DP_LINK_BW_2_7 ? 1 : 0;
 	int bpp, mode_rate;
 	static int bws[2] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index d46a8ff..2786594 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -528,7 +528,7 @@ nouveau_dp_detect(struct drm_encoder *encoder)
 		return false;
 
 	nv_encoder->dp.link_bw = 27000 * dpcd[1];
-	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
+	nv_encoder->dp.link_nr = drm_dp_max_lane_count(dpcd);
 
 	NV_DEBUG_KMS(dev, "display: %dx%d dpcd 0x%02x\n",
 		     nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index aebd4d3..d808cb4 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -347,11 +347,6 @@ static int dp_get_max_dp_pix_clock(int link_rate,
 	return (link_rate * lane_num * 8) / bpp;
 }
 
-static u8 dp_get_max_lane_number(u8 dpcd[DP_DPCD_SIZE])
-{
-	return dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
-}
-
 /***** radeon specific DP functions *****/
 
 /* First get the min lane# when low rate is used according to pixel clock
@@ -364,7 +359,7 @@ static int radeon_dp_get_dp_lane_number(struct drm_connector *connector,
 {
 	int bpp = convert_bpc_to_bpp(radeon_get_monitor_bpc(connector));
 	int max_link_rate = drm_dp_max_link_rate(dpcd);
-	int max_lane_num = dp_get_max_lane_number(dpcd);
+	int max_lane_num = drm_dp_max_lane_count(dpcd);
 	int lane_num;
 	int max_dp_pix_clock;
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 455f8e0..c09d367 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -346,4 +346,11 @@ drm_dp_max_link_rate(u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	return drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
 }
+
+static inline u8
+drm_dp_max_lane_count(u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
+}
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.7.11.4
