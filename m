From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/6] drm/nouveau: Fix some sparse warnings in the
	TV-out code.
Date: Mon, 17 Aug 2009 16:58:50 +0200
Message-ID: <1250521134-17768-2-git-send-email-currojerez@riseup.net>
References: <1250521134-17768-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250521134-17768-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nv17_tv_modes.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv17_tv_modes.c b/drivers/gpu/drm/nouveau/nv17_tv_modes.c
index 17adb8d..85f55b3 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv_modes.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv_modes.c
@@ -322,16 +322,15 @@ static void tv_setup_filter(struct drm_encoder *encoder)
 				       &tv_enc->state.vfilter};
 	int i, j, k;
 	int32_t overscan = calc_overscan(tv_enc->overscan);
-	int64_t flicker = (tv_enc->flicker - 50) * id3;
-	int64_t rs[] = {mode->hdisplay * id3,
-			mode->vdisplay * id3};
+	int64_t flicker = (tv_enc->flicker - 50) * (id3 / 100);
+	uint64_t rs[] = {mode->hdisplay * id3,
+			 mode->vdisplay * id3};
 
-	do_div(flicker, 100);
 	do_div(rs[0], overscan * tv_norm->tv_enc_mode.hdisplay);
 	do_div(rs[1], overscan * tv_norm->tv_enc_mode.vdisplay);
 
 	for (k = 0; k < 2; k++) {
-		rs[k] = max(rs[k], id2);
+		rs[k] = max((int64_t)rs[k], id2);
 
 		for (j = 0; j < 4; j++) {
 			struct filter_params *p = &fparams[k][j];
-- 
1.6.3.3
