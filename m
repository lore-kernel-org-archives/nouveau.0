From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: use the cr_ok/chanel_eq_ok
	helpers
Date: Wed, 21 Nov 2012 17:03:58 +0100
Message-ID: <1353513840-30765-2-git-send-email-daniel.vetter@ffwll.ch>
References: <1353513840-30765-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1353513840-30765-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Only compile-tested, due to a lack of nouveau dp hw. Should be
equivalent code though.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 978a108..3045a00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -175,7 +175,7 @@ dp_link_train_cr(struct drm_device *dev, struct dp_state *dp)
 {
 	bool cr_done = false, abort = false;
 	int voltage = dp->conf[0] & DP_TRAIN_VOLTAGE_SWING_MASK;
-	int tries = 0, i;
+	int tries = 0;
 
 	dp_set_training_pattern(dev, dp, DP_TRAINING_PATTERN_1);
 
@@ -184,16 +184,7 @@ dp_link_train_cr(struct drm_device *dev, struct dp_state *dp)
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
@@ -208,7 +199,7 @@ static int
 dp_link_train_eq(struct drm_device *dev, struct dp_state *dp)
 {
 	bool eq_done, cr_done = true;
-	int tries = 0, i;
+	int tries = 0;
 
 	dp_set_training_pattern(dev, dp, DP_TRAINING_PATTERN_2);
 
@@ -216,15 +207,8 @@ dp_link_train_eq(struct drm_device *dev, struct dp_state *dp)
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
