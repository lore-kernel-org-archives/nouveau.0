From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 08/10] drm/i915: use the new dp train delay helpers
Date: Thu, 18 Oct 2012 10:15:30 +0200
Message-ID: <1350548132-3037-9-git-send-email-daniel.vetter@ffwll.ch>
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

Only really required for dp 1.2. I've hoped this would help with some
link training woes I'm fighting, but alas those are only dp 1.1
devices.

Also move a comment that went misplaced in the recent refactorings to
the right spot again.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/intel_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index aa1a28c..865f7f3 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -1806,13 +1806,13 @@ intel_dp_start_link_train(struct intel_dp *intel_dp)
 		DRM_DEBUG_KMS("training pattern 1 signal levels %08x\n",
 			      signal_levels);
 
+		/* Set training pattern 1 */
 		if (!intel_dp_set_link_train(intel_dp, DP,
 					     DP_TRAINING_PATTERN_1 |
 					     DP_LINK_SCRAMBLING_DISABLE))
 			break;
-		/* Set training pattern 1 */
 
-		udelay(100);
+		drm_dp_link_train_clock_recovery_delay(intel_dp->dpcd);
 		if (!intel_dp_get_link_status(intel_dp, link_status)) {
 			DRM_ERROR("failed to get link status\n");
 			break;
@@ -1900,7 +1900,7 @@ intel_dp_complete_link_train(struct intel_dp *intel_dp)
 					     DP_LINK_SCRAMBLING_DISABLE))
 			break;
 
-		udelay(400);
+		drm_dp_link_train_channel_eq_delay(intel_dp->dpcd);
 		if (!intel_dp_get_link_status(intel_dp, link_status))
 			break;
 
-- 
1.7.11.4
