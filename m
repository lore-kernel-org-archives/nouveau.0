From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 02/10] drm: dp helper: extract drm_dp_channel_eq_ok
Date: Thu, 18 Oct 2012 10:15:24 +0200
Message-ID: <1350548132-3037-3-git-send-email-daniel.vetter@ffwll.ch>
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

radeon and intel use the exact same definition.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_dp_helper.c      | 50 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_dp.c      | 35 ++-----------------------
 drivers/gpu/drm/radeon/atombios_dp.c | 24 ++---------------
 include/drm/drm_dp_helper.h          |  5 ++++
 4 files changed, 59 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index f7eba0a..9dde04a 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -206,3 +206,53 @@ i2c_dp_aux_add_bus(struct i2c_adapter *adapter)
 	return error;
 }
 EXPORT_SYMBOL(i2c_dp_aux_add_bus);
+
+/* Helpers for DP link training */
+static u8 dp_link_status(u8 link_status[DP_LINK_STATUS_SIZE], int r)
+{
+	return link_status[r - DP_LANE0_1_STATUS];
+}
+
+static u8 dp_get_lane_status(u8 link_status[DP_LINK_STATUS_SIZE],
+			     int lane)
+{
+	int i = DP_LANE0_1_STATUS + (lane >> 1);
+	int s = (lane & 1) * 4;
+	u8 l = dp_link_status(link_status, i);
+	return (l >> s) & 0xf;
+}
+
+bool drm_dp_channel_eq_ok(u8 link_status[DP_LINK_STATUS_SIZE],
+			  int lane_count)
+{
+	u8 lane_align;
+	u8 lane_status;
+	int lane;
+
+	lane_align = dp_link_status(link_status,
+				    DP_LANE_ALIGN_STATUS_UPDATED);
+	if ((lane_align & DP_INTERLANE_ALIGN_DONE) == 0)
+		return false;
+	for (lane = 0; lane < lane_count; lane++) {
+		lane_status = dp_get_lane_status(link_status, lane);
+		if ((lane_status & DP_CHANNEL_EQ_BITS) != DP_CHANNEL_EQ_BITS)
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL(drm_dp_channel_eq_ok);
+
+bool drm_dp_clock_recovery_ok(u8 link_status[DP_LINK_STATUS_SIZE],
+			      int lane_count)
+{
+	int lane;
+	u8 lane_status;
+
+	for (lane = 0; lane < lane_count; lane++) {
+		lane_status = dp_get_lane_status(link_status, lane);
+		if ((lane_status & DP_LANE_CR_DONE) == 0)
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL(drm_dp_clock_recovery_ok);
diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index f2c9ea6..d3f4db0 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -38,7 +38,6 @@
 #include "i915_drv.h"
 
 #define DP_RECEIVER_CAP_SIZE	0xf
-#define DP_LINK_STATUS_SIZE	6
 #define DP_LINK_CHECK_TIMEOUT	(10 * 1000)
 
 /**
@@ -1401,13 +1400,6 @@ intel_dp_get_link_status(struct intel_dp *intel_dp, uint8_t link_status[DP_LINK_
 }
 
 static uint8_t
-intel_dp_link_status(uint8_t link_status[DP_LINK_STATUS_SIZE],
-		     int r)
-{
-	return link_status[r - DP_LANE0_1_STATUS];
-}
-
-static uint8_t
 intel_get_adjust_request_voltage(uint8_t adjust_request[2],
 				 int lane)
 {
@@ -1692,29 +1684,6 @@ intel_clock_recovery_ok(uint8_t link_status[DP_LINK_STATUS_SIZE], int lane_count
 	return true;
 }
 
-/* Check to see if channel eq is done on all channels */
-#define CHANNEL_EQ_BITS (DP_LANE_CR_DONE|\
-			 DP_LANE_CHANNEL_EQ_DONE|\
-			 DP_LANE_SYMBOL_LOCKED)
-static bool
-intel_channel_eq_ok(struct intel_dp *intel_dp, uint8_t link_status[DP_LINK_STATUS_SIZE])
-{
-	uint8_t lane_align;
-	uint8_t lane_status;
-	int lane;
-
-	lane_align = intel_dp_link_status(link_status,
-					  DP_LANE_ALIGN_STATUS_UPDATED);
-	if ((lane_align & DP_INTERLANE_ALIGN_DONE) == 0)
-		return false;
-	for (lane = 0; lane < intel_dp->lane_count; lane++) {
-		lane_status = intel_get_lane_status(link_status, lane);
-		if ((lane_status & CHANNEL_EQ_BITS) != CHANNEL_EQ_BITS)
-			return false;
-	}
-	return true;
-}
-
 static bool
 intel_dp_set_link_train(struct intel_dp *intel_dp,
 			uint32_t dp_reg_value,
@@ -1969,7 +1938,7 @@ intel_dp_complete_link_train(struct intel_dp *intel_dp)
 			continue;
 		}
 
-		if (intel_channel_eq_ok(intel_dp, link_status)) {
+		if (drm_dp_channel_eq_ok(link_status, intel_dp->lane_count)) {
 			channel_eq = true;
 			break;
 		}
@@ -2170,7 +2139,7 @@ intel_dp_check_link_status(struct intel_dp *intel_dp)
 			DRM_DEBUG_DRIVER("CP or sink specific irq unhandled\n");
 	}
 
-	if (!intel_channel_eq_ok(intel_dp, link_status)) {
+	if (!drm_dp_channel_eq_ok(link_status, intel_dp->lane_count)) {
 		DRM_DEBUG_KMS("%s: channel EQ not ok, retraining\n",
 			      drm_get_encoder_name(&intel_dp->base.base));
 		intel_dp_start_link_train(intel_dp);
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index d48224b..8aa8187 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -34,7 +34,6 @@
 
 /* move these to drm_dp_helper.c/h */
 #define DP_LINK_CONFIGURATION_SIZE 9
-#define DP_LINK_STATUS_SIZE	   6
 #define DP_DPCD_SIZE	           8
 
 static char *voltage_names[] = {
@@ -318,25 +317,6 @@ static bool dp_clock_recovery_ok(u8 link_status[DP_LINK_STATUS_SIZE],
 	return true;
 }
 
-static bool dp_channel_eq_ok(u8 link_status[DP_LINK_STATUS_SIZE],
-			     int lane_count)
-{
-	u8 lane_align;
-	u8 lane_status;
-	int lane;
-
-	lane_align = dp_link_status(link_status,
-				    DP_LANE_ALIGN_STATUS_UPDATED);
-	if ((lane_align & DP_INTERLANE_ALIGN_DONE) == 0)
-		return false;
-	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = dp_get_lane_status(link_status, lane);
-		if ((lane_status & DP_CHANNEL_EQ_BITS) != DP_CHANNEL_EQ_BITS)
-			return false;
-	}
-	return true;
-}
-
 static u8 dp_get_adjust_request_voltage(u8 link_status[DP_LINK_STATUS_SIZE],
 					int lane)
 
@@ -664,7 +644,7 @@ bool radeon_dp_needs_link_train(struct radeon_connector *radeon_connector)
 
 	if (!radeon_dp_get_link_status(radeon_connector, link_status))
 		return false;
-	if (dp_channel_eq_ok(link_status, dig->dp_lane_count))
+	if (drm_dp_channel_eq_ok(link_status, dig->dp_lane_count))
 		return false;
 	return true;
 }
@@ -896,7 +876,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
 			break;
 		}
 
-		if (dp_channel_eq_ok(dp_info->link_status, dp_info->dp_lane_count)) {
+		if (drm_dp_channel_eq_ok(dp_info->link_status, dp_info->dp_lane_count)) {
 			channel_eq = true;
 			break;
 		}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index fe06148..9e10420 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -322,4 +322,9 @@ struct i2c_algo_dp_aux_data {
 int
 i2c_dp_aux_add_bus(struct i2c_adapter *adapter);
 
+
+#define DP_LINK_STATUS_SIZE	   6
+bool drm_dp_channel_eq_ok(u8 link_status[DP_LINK_STATUS_SIZE],
+			  int lane_count);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.7.11.4
