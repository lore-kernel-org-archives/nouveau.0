From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 4/6] drm/nouveau: Fix some bandwidth problems on
	nv11 with TV and VGA enabled.
Date: Mon, 17 Aug 2009 17:24:21 +0200
Message-ID: <1250522663-18672-4-git-send-email-currojerez@riseup.net>
References: <1250522663-18672-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250522663-18672-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

The VGA output was showing some flashing pixels when TV was enabled
and the pixel clock was high enough.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_calc.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_calc.c b/drivers/gpu/drm/nouveau/nouveau_calc.c
index e2b78d2..3f80db8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_calc.c
+++ b/drivers/gpu/drm/nouveau/nouveau_calc.c
@@ -174,7 +174,7 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	int us_m, us_m_min, us_n, us_p, crtc_drain_rate;
 	int vus_m;
 	int vpm_us, us_video, cpm_us, us_crt, clwm;
-	int clwm_rnd_down;
+	int clwm_rnd_down, min_clwm;
 	int m2us, us_pipe_min, p1clk, p2;
 	int min_mclk_extra;
 	int us_min_mclk_extra;
@@ -323,8 +323,12 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 				min_mclk_extra--;
 		}
 
-		if (clwm < (1024 - cbs + 8))
-			clwm = 1024 - cbs + 8;
+		/* This correction works around a slight snow effect
+		 * when the TV and VGA outputs are enabled simultaneously. */
+		min_clwm = 1024 - cbs + 128 * pclk_freq / 100000;
+		if (clwm < min_clwm)
+			clwm = min_clwm;
+
 		/*  printf("CRT LWM: prog: 0x%x, bs: 256\n", clwm); */
 		fifo->graphics_lwm = clwm;
 		fifo->graphics_burst_size = cbs;
-- 
1.6.3.3
