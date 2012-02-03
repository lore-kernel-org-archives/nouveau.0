From: Xi Wang <xi.wang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC] drm/nouveau/dp: fix bad comparison in
	dp_link_train_commit()
Date: Fri,  3 Feb 2012 11:13:55 -0500
Message-ID: <1328285635-28404-1-git-send-email-xi.wang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Xi Wang <xi.wang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The comparison (lpre == DP_TRAIN_PRE_EMPHASIS_9_5) is always false:
lpre is initialized as (lane & 0x0c) >> 2, which is at most 3, while
DP_TRAIN_PRE_EMPHASIS_9_5 is defined as (3 << 3).

Signed-off-by: Xi Wang <xi.wang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 9b93b70..c51c68b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -432,7 +432,7 @@ dp_link_train_commit(struct drm_device *dev, struct dp_state *dp)
 		dp->conf[i] = (lpre << 3) | lvsw;
 		if (lvsw == DP_TRAIN_VOLTAGE_SWING_1200)
 			dp->conf[i] |= DP_TRAIN_MAX_SWING_REACHED;
-		if (lpre == DP_TRAIN_PRE_EMPHASIS_9_5)
+		if ((lpre << 3) == DP_TRAIN_PRE_EMPHASIS_9_5)
 			dp->conf[i] |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
 
 		NV_DEBUG_KMS(dev, "config lane %d %02x\n", i, dp->conf[i]);
-- 
1.7.5.4
