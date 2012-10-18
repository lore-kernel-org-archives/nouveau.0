From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 03/10] drm: dp helper: extract
	drm_dp_clock_recovery_ok
Date: Thu, 18 Oct 2012 10:15:25 +0200
Message-ID: <1350548132-3037-4-git-send-email-daniel.vetter@ffwll.ch>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1350548132-3037-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: nouveau.vger.kernel.org

radeon and intel use the exact same definition.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/i915/intel_dp.c      |  4 ++--
 drivers/gpu/drm/radeon/atombios_dp.c | 25 +------------------------
 include/drm/drm_dp_helper.h          |  2 ++
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index d3f4db0..5a9ab3a 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -1845,7 +1845,7 @@ intel_dp_start_link_train(struct intel_dp *intel_dp)
 			break;
 		}
 
-		if (intel_clock_recovery_ok(link_status, intel_dp->lane_count)) {
+		if (drm_dp_clock_recovery_ok(link_status, intel_dp->lane_count)) {
 			DRM_DEBUG_KMS("clock recovery OK\n");
 			clock_recovery = true;
 			break;
@@ -1932,7 +1932,7 @@ intel_dp_complete_link_train(struct intel_dp *intel_dp)
 			break;
 
 		/* Make sure clock is still ok */
-		if (!intel_clock_recovery_ok(link_status, intel_dp->lane_count)) {
+		if (!drm_dp_clock_recovery_ok(link_status, intel_dp->lane_count)) {
 			intel_dp_start_link_train(intel_dp);
 			cr_tries++;
 			continue;
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 8aa8187..75fdf34 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -294,29 +294,6 @@ static u8 dp_link_status(u8 link_status[DP_LINK_STATUS_SIZE], int r)
 	return link_status[r - DP_LANE0_1_STATUS];
 }
 
-static u8 dp_get_lane_status(u8 link_status[DP_LINK_STATUS_SIZE],
-			     int lane)
-{
-	int i = DP_LANE0_1_STATUS + (lane >> 1);
-	int s = (lane & 1) * 4;
-	u8 l = dp_link_status(link_status, i);
-	return (l >> s) & 0xf;
-}
-
-static bool dp_clock_recovery_ok(u8 link_status[DP_LINK_STATUS_SIZE],
-				 int lane_count)
-{
-	int lane;
-	u8 lane_status;
-
-	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = dp_get_lane_status(link_status, lane);
-		if ((lane_status & DP_LANE_CR_DONE) == 0)
-			return false;
-	}
-	return true;
-}
-
 static u8 dp_get_adjust_request_voltage(u8 link_status[DP_LINK_STATUS_SIZE],
 					int lane)
 
@@ -811,7 +788,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
 			break;
 		}
 
-		if (dp_clock_recovery_ok(dp_info->link_status, dp_info->dp_lane_count)) {
+		if (drm_dp_clock_recovery_ok(dp_info->link_status, dp_info->dp_lane_count)) {
 			clock_recovery = true;
 			break;
 		}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 9e10420..89e92c9 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -326,5 +326,7 @@ i2c_dp_aux_add_bus(struct i2c_adapter *adapter);
 #define DP_LINK_STATUS_SIZE	   6
 bool drm_dp_channel_eq_ok(u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
+bool drm_dp_clock_recovery_ok(u8 link_status[DP_LINK_STATUS_SIZE],
+			      int lane_count);
 
 #endif /* _DRM_DP_HELPER_H_ */
-- 
1.7.11.4
