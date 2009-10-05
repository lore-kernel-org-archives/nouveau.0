From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau: Fix TV-out for the new semantics
	of drm_mode_vrefresh().
Date: Mon,  5 Oct 2009 04:37:06 +0200
Message-ID: <1254710226-26139-3-git-send-email-currojerez@riseup.net>
References: <1254710226-26139-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1254710226-26139-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv17_tv.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
index 3856342..34f95c7 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -178,13 +178,13 @@ static int nv17_tv_mode_valid(struct drm_encoder *encoder,
 			return MODE_NO_DBLESCAN;
 
 	} else {
-		const int vsync_tolerance = 10;
+		const int vsync_tolerance = 600;
 
 		if (mode->clock > 70000)
 			return MODE_CLOCK_HIGH;
 
-		if (abs(drm_mode_vrefresh(mode) -
-			    tv_norm->tv_enc_mode.vrefresh) > vsync_tolerance)
+		if (abs(drm_mode_vrefresh(mode) * 1000 -
+			tv_norm->tv_enc_mode.vrefresh) > vsync_tolerance)
 			return MODE_VSYNC;
 
 		/* The encoder takes care of the actual interlacing */
-- 
1.6.3.3
