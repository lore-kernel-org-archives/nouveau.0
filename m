From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 04/10] drm/nouveau: use the cr_ok/chanel_eq_ok
	helpers
Date: Thu, 18 Oct 2012 10:15:26 +0200
Message-ID: <1350548132-3037-5-git-send-email-daniel.vetter@ffwll.ch>
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

Only compile-tested, due to a lack of nouveau dp hw. Should be
equivalent code though.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index e754aa3..60d561e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -298,7 +298,7 @@ dp_link_train_cr(struct drm_device *dev, struct dp_state *dp)
 {
 	bool cr_done = false, abort = false;
 	int voltage = dp->conf[0] & DP_TRAIN_VOLTAGE_SWING_MASK;
-	int tries = 0, i;
+	int tries = 0;
 
 	dp_set_training_pattern(dev, dp, DP_TRAINING_PATTERN_1);
 
@@ -307,16 +307,7 @@ dp_link_train_cr(struct drm_device *dev, struct dp_state *dp)
 		    dp_link_train_update(dev, dp, 100))
 			break;
 
-		cr_done = true;
-		for (i = 0; i < dp->link_nr; i++) {
-			u8 lane = (dp->stat[i >> 1] >> ((i & 1) * 4)) & 0xf;
-			if (!(lane & DP_LANE_CR_DONE)) {
-				cr_done = false;
-				if (dp->conf[i] & DP_TRAIN_MAX_SWING_REACHED)
-					abort = true;
-				break;
-			}
-		}
+		cr_done = drm_dp_clock_recovery_ok(dp->stat, dp->link_nr);
 
 		if ((dp->conf[0] & DP_TRAIN_VOLTAGE_SWING_MASK) != voltage) {
 			voltage = dp->conf[0] & DP_TRAIN_VOLTAGE_SWING_MASK;
@@ -331,7 +322,7 @@ static int
 dp_link_train_eq(struct drm_device *dev, struct dp_state *dp)
 {
 	bool eq_done, cr_done = true;
-	int tries = 0, i;
+	int tries = 0;
 
 	dp_set_training_pattern(dev, dp, DP_TRAINING_PATTERN_2);
 
@@ -339,15 +330,8 @@ dp_link_train_eq(struct drm_device *dev, struct dp_state *dp)
 		if (dp_link_train_update(dev, dp, 400))
 			break;
 
-		eq_done = !!(dp->stat[2] & DP_INTERLANE_ALIGN_DONE);
-		for (i = 0; i < dp->link_nr && eq_done; i++) {
-			u8 lane = (dp->stat[i >> 1] >> ((i & 1) * 4)) & 0xf;
-			if (!(lane & DP_LANE_CR_DONE))
-				cr_done = false;
-			if (!(lane & DP_LANE_CHANNEL_EQ_DONE) ||
-			    !(lane & DP_LANE_SYMBOL_LOCKED))
-				eq_done = false;
-		}
+		eq_done = drm_dp_channel_eq_ok(dp->stat, dp->link_nr);
+		cr_done = drm_dp_clock_recovery_ok(dp->stat, dp->link_nr);
 
 		if (dp_link_train_commit(dev, dp))
 			break;
-- 
1.7.11.4
