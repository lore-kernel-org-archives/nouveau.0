From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 05/10] drm: extract helpers to compute new
	training values from sink request
Date: Thu, 18 Oct 2012 10:15:27 +0200
Message-ID: <1350548132-3037-6-git-send-email-daniel.vetter@ffwll.ch>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
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
Cc: nouveau@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, xorg-driver-ati@lists.x.org, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

Safe for the minor difference that the intel versions get an offset
into the link_status as an argument, both are the same again.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_dp_helper.c      | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_dp.c      | 30 ++----------------------------
 drivers/gpu/drm/radeon/atombios_dp.c | 34 ++--------------------------------
 include/drm/drm_dp_helper.h          |  4 ++++
 4 files changed, 35 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 9dde04a..d1a196f 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -256,3 +256,30 @@ bool drm_dp_clock_recovery_ok(u8 link_status[DP_LINK_STATUS_SIZE],
 	return true;
 }
 EXPORT_SYMBOL(drm_dp_clock_recovery_ok);
+
+u8 drm_dp_get_adjust_request_voltage(u8 link_status[DP_LINK_STATUS_SIZE],
+				     int lane)
+{
+	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
+	int s = ((lane & 1) ?
+		 DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT :
+		 DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT);
+	u8 l = dp_link_status(link_status, i);
+
+	return ((l >> s) & 0x3) << DP_TRAIN_VOLTAGE_SWING_SHIFT;
+}
+EXPORT_SYMBOL(drm_dp_get_adjust_request_voltage);
+
+u8 drm_dp_get_adjust_request_pre_emphasis(u8 link_status[DP_LINK_STATUS_SIZE],
+					  int lane)
+{
+	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
+	int s = ((lane & 1) ?
+		 DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT :
+		 DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT);
+	u8 l = dp_link_status(link_status, i);
+
+	return ((l >> s) & 0x3) << DP_TRAIN_PRE_EMPHASIS_SHIFT;
+}
+EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
+
diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index 5a9ab3a..4cd957a 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -1399,31 +1399,6 @@ intel_dp_get_link_status(struct intel_dp *intel_dp, uint8_t link_status[DP_LINK_
 					      DP_LINK_STATUS_SIZE);
 }
 
-static uint8_t
-intel_get_adjust_request_voltage(uint8_t adjust_request[2],
-				 int lane)
-{
-	int	    s = ((lane & 1) ?
-			 DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT :
-			 DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT);
-	uint8_t l = adjust_request[lane>>1];
-
-	return ((l >> s) & 3) << DP_TRAIN_VOLTAGE_SWING_SHIFT;
-}
-
-static uint8_t
-intel_get_adjust_request_pre_emphasis(uint8_t adjust_request[2],
-				      int lane)
-{
-	int	    s = ((lane & 1) ?
-			 DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT :
-			 DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT);
-	uint8_t l = adjust_request[lane>>1];
-
-	return ((l >> s) & 3) << DP_TRAIN_PRE_EMPHASIS_SHIFT;
-}
-
-
 #if 0
 static char	*voltage_names[] = {
 	"0.4V", "0.6V", "0.8V", "1.2V"
@@ -1502,13 +1477,12 @@ intel_get_adjust_train(struct intel_dp *intel_dp, uint8_t link_status[DP_LINK_ST
 	uint8_t v = 0;
 	uint8_t p = 0;
 	int lane;
-	uint8_t	*adjust_request = link_status + (DP_ADJUST_REQUEST_LANE0_1 - DP_LANE0_1_STATUS);
 	uint8_t voltage_max;
 	uint8_t preemph_max;
 
 	for (lane = 0; lane < intel_dp->lane_count; lane++) {
-		uint8_t this_v = intel_get_adjust_request_voltage(adjust_request, lane);
-		uint8_t this_p = intel_get_adjust_request_pre_emphasis(adjust_request, lane);
+		uint8_t this_v = drm_dp_get_adjust_request_voltage(link_status, lane);
+		uint8_t this_p = drm_dp_get_adjust_request_pre_emphasis(link_status, lane);
 
 		if (this_v > v)
 			v = this_v;
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 75fdf34..5479832 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -289,36 +289,6 @@ int radeon_dp_i2c_aux_ch(struct i2c_adapter *adapter, int mode,
 
 /***** general DP utility functions *****/
 
-static u8 dp_link_status(u8 link_status[DP_LINK_STATUS_SIZE], int r)
-{
-	return link_status[r - DP_LANE0_1_STATUS];
-}
-
-static u8 dp_get_adjust_request_voltage(u8 link_status[DP_LINK_STATUS_SIZE],
-					int lane)
-
-{
-	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
-	int s = ((lane & 1) ?
-		 DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT :
-		 DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT);
-	u8 l = dp_link_status(link_status, i);
-
-	return ((l >> s) & 0x3) << DP_TRAIN_VOLTAGE_SWING_SHIFT;
-}
-
-static u8 dp_get_adjust_request_pre_emphasis(u8 link_status[DP_LINK_STATUS_SIZE],
-					     int lane)
-{
-	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
-	int s = ((lane & 1) ?
-		 DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT :
-		 DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT);
-	u8 l = dp_link_status(link_status, i);
-
-	return ((l >> s) & 0x3) << DP_TRAIN_PRE_EMPHASIS_SHIFT;
-}
-
 #define DP_VOLTAGE_MAX         DP_TRAIN_VOLTAGE_SWING_1200
 #define DP_PRE_EMPHASIS_MAX    DP_TRAIN_PRE_EMPHASIS_9_5
 
@@ -331,8 +301,8 @@ static void dp_get_adjust_train(u8 link_status[DP_LINK_STATUS_SIZE],
 	int lane;
 
 	for (lane = 0; lane < lane_count; lane++) {
-		u8 this_v = dp_get_adjust_request_voltage(link_status, lane);
-		u8 this_p = dp_get_adjust_request_pre_emphasis(link_status, lane);
+		u8 this_v = drm_dp_get_adjust_request_voltage(link_status, lane);
+		u8 this_p = drm_dp_get_adjust_request_pre_emphasis(link_status, lane);
 
 		DRM_DEBUG_KMS("requested signal parameters: lane %d voltage %s pre_emph %s\n",
 			  lane,
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 89e92c9..57e6dbd 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -328,5 +328,9 @@ bool drm_dp_channel_eq_ok(u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
 bool drm_dp_clock_recovery_ok(u8 link_status[DP_LINK_STATUS_SIZE],
 			      int lane_count);
+u8 drm_dp_get_adjust_request_voltage(u8 link_status[DP_LINK_STATUS_SIZE],
+				     int lane);
+u8 drm_dp_get_adjust_request_pre_emphasis(u8 link_status[DP_LINK_STATUS_SIZE],
+					  int lane);
 
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.7.11.4
