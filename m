From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 09/10] drm: extract dp link bw helpers
Date: Thu, 18 Oct 2012 10:15:31 +0200
Message-ID: <1350548132-3037-10-git-send-email-daniel.vetter@ffwll.ch>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1350548132-3037-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_dp_helper.c      | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_dp.c      |  5 +----
 drivers/gpu/drm/radeon/atombios_dp.c | 32 +++-----------------------------
 include/drm/drm_dp_helper.h          |  8 ++++++++
 4 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index e43ddde..d8a4189 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -298,3 +298,31 @@ void drm_dp_link_train_channel_eq_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]) {
 		mdelay(dpcd[DP_TRAINING_AUX_RD_INTERVAL] * 4);
 }
 EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
+
+u8 drm_dp_link_rate_to_bw_code(int link_rate)
+{
+	switch (link_rate) {
+	case 162000:
+	default:
+		return DP_LINK_BW_1_62;
+	case 270000:
+		return DP_LINK_BW_2_7;
+	case 540000:
+		return DP_LINK_BW_5_4;
+	}
+}
+EXPORT_SYMBOL(drm_dp_link_rate_to_bw_code);
+
+int drm_dp_bw_code_to_link_rate(u8 link_bw)
+{
+	switch (link_bw) {
+	case DP_LINK_BW_1_62:
+	default:
+		return 162000;
+	case DP_LINK_BW_2_7:
+		return 270000;
+	case DP_LINK_BW_5_4:
+		return 540000;
+	}
+}
+EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index 865f7f3..fea768d 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -111,10 +111,7 @@ intel_edp_link_config(struct intel_encoder *intel_encoder,
 	struct intel_dp *intel_dp = container_of(intel_encoder, struct intel_dp, base);
 
 	*lane_num = intel_dp->lane_count;
-	if (intel_dp->link_bw == DP_LINK_BW_1_62)
-		*link_bw = 162000;
-	else if (intel_dp->link_bw == DP_LINK_BW_2_7)
-		*link_bw = 270000;
+	*link_bw = drm_dp_bw_code_to_link_rate(intel_dp->link_bw);
 }
 
 int
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 4551ea5..aebd4d3 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -347,37 +347,11 @@ static int dp_get_max_dp_pix_clock(int link_rate,
 	return (link_rate * lane_num * 8) / bpp;
 }
 
-static int dp_get_max_link_rate(u8 dpcd[DP_DPCD_SIZE])
-{
-	switch (dpcd[DP_MAX_LINK_RATE]) {
-	case DP_LINK_BW_1_62:
-	default:
-		return 162000;
-	case DP_LINK_BW_2_7:
-		return 270000;
-	case DP_LINK_BW_5_4:
-		return 540000;
-	}
-}
-
 static u8 dp_get_max_lane_number(u8 dpcd[DP_DPCD_SIZE])
 {
 	return dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
 }
 
-static u8 dp_get_dp_link_rate_coded(int link_rate)
-{
-	switch (link_rate) {
-	case 162000:
-	default:
-		return DP_LINK_BW_1_62;
-	case 270000:
-		return DP_LINK_BW_2_7;
-	case 540000:
-		return DP_LINK_BW_5_4;
-	}
-}
-
 /***** radeon specific DP functions *****/
 
 /* First get the min lane# when low rate is used according to pixel clock
@@ -389,7 +363,7 @@ static int radeon_dp_get_dp_lane_number(struct drm_connector *connector,
 					int pix_clock)
 {
 	int bpp = convert_bpc_to_bpp(radeon_get_monitor_bpc(connector));
-	int max_link_rate = dp_get_max_link_rate(dpcd);
+	int max_link_rate = drm_dp_max_link_rate(dpcd);
 	int max_lane_num = dp_get_max_lane_number(dpcd);
 	int lane_num;
 	int max_dp_pix_clock;
@@ -427,7 +401,7 @@ static int radeon_dp_get_dp_link_clock(struct drm_connector *connector,
 			return 540000;
 	}
 
-	return dp_get_max_link_rate(dpcd);
+	return drm_dp_max_link_rate(dpcd);
 }
 
 static u8 radeon_dp_encoder_service(struct radeon_device *rdev,
@@ -692,7 +666,7 @@ static int radeon_dp_link_train_init(struct radeon_dp_link_train_info *dp_info)
 	radeon_write_dpcd_reg(dp_info->radeon_connector, DP_LANE_COUNT_SET, tmp);
 
 	/* set the link rate on the sink */
-	tmp = dp_get_dp_link_rate_coded(dp_info->dp_clock);
+	tmp = drm_dp_link_rate_to_bw_code(dp_info->dp_clock);
 	radeon_write_dpcd_reg(dp_info->radeon_connector, DP_LINK_BW_SET, tmp);
 
 	/* start training on the source */
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 60bd8d3..455f8e0 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -338,4 +338,12 @@ u8 drm_dp_get_adjust_request_pre_emphasis(u8 link_status[DP_LINK_STATUS_SIZE],
 void drm_dp_link_train_clock_recovery_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 void drm_dp_link_train_channel_eq_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
+u8 drm_dp_link_rate_to_bw_code(int link_rate);
+int drm_dp_bw_code_to_link_rate(u8 link_bw);
+
+static inline int
+drm_dp_max_link_rate(u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
+}
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.7.11.4
