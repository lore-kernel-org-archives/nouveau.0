From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 07/10] drm: extract dp link train delay
	functions from radeon
Date: Thu, 18 Oct 2012 10:15:29 +0200
Message-ID: <1350548132-3037-8-git-send-email-daniel.vetter@ffwll.ch>
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

This requires a few changes since that dpcd value is above the
range currently cached by radeon. I've check the dp specs, and
above 0xf there's a big gap and nothing that looks like we should
cache it while a given device is plugged in. It's also the same value
that i915.ko uses.

Hence extend the various dpcd arrays in the radeon driver, use
proper symbolic constants where applicable (one place overallocated
the dpcd array to 25 bytes). Then also drop the rd_interval cache -
radeon_dp_link_train_init re-reads the dpcd block, so the values we'll
consume in train_cr and train_ce will always be fresh.

To avoid needless diff-churn, #define the old size of dpcd as the new
one and keep it around.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_dp_helper.c      | 15 +++++++++++++++
 drivers/gpu/drm/i915/intel_dp.c      |  1 -
 drivers/gpu/drm/radeon/atombios_dp.c | 25 +++++++++----------------
 drivers/gpu/drm/radeon/radeon_mode.h |  2 +-
 include/drm/drm_dp_helper.h          |  5 +++++
 5 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index d1a196f..e43ddde 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -283,3 +283,18 @@ u8 drm_dp_get_adjust_request_pre_emphasis(u8 link_status[DP_LINK_STATUS_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
 
+void drm_dp_link_train_clock_recovery_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]) {
+	if (dpcd[DP_TRAINING_AUX_RD_INTERVAL] == 0)
+		udelay(100);
+	else
+		mdelay(dpcd[DP_TRAINING_AUX_RD_INTERVAL] * 4);
+}
+EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
+
+void drm_dp_link_train_channel_eq_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]) {
+	if (dpcd[DP_TRAINING_AUX_RD_INTERVAL] == 0)
+		udelay(400);
+	else
+		mdelay(dpcd[DP_TRAINING_AUX_RD_INTERVAL] * 4);
+}
+EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index 4cd957a..aa1a28c 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -37,7 +37,6 @@
 #include "i915_drm.h"
 #include "i915_drv.h"
 
-#define DP_RECEIVER_CAP_SIZE	0xf
 #define DP_LINK_CHECK_TIMEOUT	(10 * 1000)
 
 /**
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 5479832..4551ea5 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -34,7 +34,7 @@
 
 /* move these to drm_dp_helper.c/h */
 #define DP_LINK_CONFIGURATION_SIZE 9
-#define DP_DPCD_SIZE	           8
+#define DP_DPCD_SIZE DP_RECEIVER_CAP_SIZE
 
 static char *voltage_names[] = {
         "0.4V", "0.6V", "0.8V", "1.2V"
@@ -478,14 +478,15 @@ static void radeon_dp_probe_oui(struct radeon_connector *radeon_connector)
 bool radeon_dp_getdpcd(struct radeon_connector *radeon_connector)
 {
 	struct radeon_connector_atom_dig *dig_connector = radeon_connector->con_priv;
-	u8 msg[25];
+	u8 msg[DP_DPCD_SIZE];
 	int ret, i;
 
-	ret = radeon_dp_aux_native_read(radeon_connector, DP_DPCD_REV, msg, 8, 0);
+	ret = radeon_dp_aux_native_read(radeon_connector, DP_DPCD_REV, msg,
+					DP_DPCD_SIZE, 0);
 	if (ret > 0) {
-		memcpy(dig_connector->dpcd, msg, 8);
+		memcpy(dig_connector->dpcd, msg, DP_DPCD_SIZE);
 		DRM_DEBUG_KMS("DPCD: ");
-		for (i = 0; i < 8; i++)
+		for (i = 0; i < DP_DPCD_SIZE; i++)
 			DRM_DEBUG_KMS("%02x ", msg[i]);
 		DRM_DEBUG_KMS("\n");
 
@@ -604,9 +605,8 @@ struct radeon_dp_link_train_info {
 	int enc_id;
 	int dp_clock;
 	int dp_lane_count;
-	int rd_interval;
 	bool tp3_supported;
-	u8 dpcd[8];
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 train_set[4];
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	u8 tries;
@@ -748,10 +748,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
 	dp_info->tries = 0;
 	voltage = 0xff;
 	while (1) {
-		if (dp_info->rd_interval == 0)
-			udelay(100);
-		else
-			mdelay(dp_info->rd_interval * 4);
+		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
 
 		if (!radeon_dp_get_link_status(dp_info->radeon_connector, dp_info->link_status)) {
 			DRM_ERROR("displayport link status failed\n");
@@ -813,10 +810,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
 	dp_info->tries = 0;
 	channel_eq = false;
 	while (1) {
-		if (dp_info->rd_interval == 0)
-			udelay(400);
-		else
-			mdelay(dp_info->rd_interval * 4);
+		drm_dp_link_train_channel_eq_delay(dp_info->dpcd);
 
 		if (!radeon_dp_get_link_status(dp_info->radeon_connector, dp_info->link_status)) {
 			DRM_ERROR("displayport link status failed\n");
@@ -901,7 +895,6 @@ void radeon_dp_link_train(struct drm_encoder *encoder,
 	else
 		dp_info.enc_id |= ATOM_DP_CONFIG_LINK_A;
 
-	dp_info.rd_interval = radeon_read_dpcd_reg(radeon_connector, DP_TRAINING_AUX_RD_INTERVAL);
 	tmp = radeon_read_dpcd_reg(radeon_connector, DP_MAX_LANE_COUNT);
 	if (ASIC_IS_DCE5(rdev) && (tmp & DP_TPS3_SUPPORTED))
 		dp_info.tp3_supported = true;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index d569789..e5b668e 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -403,7 +403,7 @@ struct radeon_connector_atom_dig {
 	uint32_t igp_lane_info;
 	/* displayport */
 	struct radeon_i2c_chan *dp_i2c_bus;
-	u8 dpcd[8];
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 dp_sink_type;
 	int dp_clock;
 	int dp_lane_count;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 57e6dbd..60bd8d3 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -25,6 +25,7 @@
 
 #include <linux/types.h>
 #include <linux/i2c.h>
+#include <linux/delay.h>
 
 /*
  * Unless otherwise noted, all values are from the DP 1.1a spec.  Note that
@@ -333,4 +334,8 @@ u8 drm_dp_get_adjust_request_voltage(u8 link_status[DP_LINK_STATUS_SIZE],
 u8 drm_dp_get_adjust_request_pre_emphasis(u8 link_status[DP_LINK_STATUS_SIZE],
 					  int lane);
 
+#define DP_RECEIVER_CAP_SIZE	0xf
+void drm_dp_link_train_clock_recovery_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+void drm_dp_link_train_channel_eq_delay(u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.7.11.4
