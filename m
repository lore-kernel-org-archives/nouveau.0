From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 06/10] drm/nouveau: use dp link train request
	helper
Date: Thu, 18 Oct 2012 10:15:28 +0200
Message-ID: <1350548132-3037-7-git-send-email-daniel.vetter@ffwll.ch>
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

nouveau again score with an impressive density of magic numbers.

Again only compile-tested due to lack of hw, but should be equivalent
code.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 60d561e..d46a8ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -261,11 +261,10 @@ dp_link_train_commit(struct drm_device *dev, struct dp_state *dp)
 	int i;
 
 	for (i = 0; i < dp->link_nr; i++) {
-		u8 lane = (dp->stat[4 + (i >> 1)] >> ((i & 1) * 4)) & 0xf;
-		u8 lpre = (lane & 0x0c) >> 2;
-		u8 lvsw = (lane & 0x03) >> 0;
+		u8 lpre = drm_dp_get_adjust_request_pre_emphasis(dp->stat, i);
+		u8 lvsw = drm_dp_get_adjust_request_voltage(dp->stat, i);
 
-		dp->conf[i] = (lpre << 3) | lvsw;
+		dp->conf[i] = lpre | lvsw;
 		if (lvsw == DP_TRAIN_VOLTAGE_SWING_1200)
 			dp->conf[i] |= DP_TRAIN_MAX_SWING_REACHED;
 		if ((lpre << 3) == DP_TRAIN_PRE_EMPHASIS_9_5)
-- 
1.7.11.4
