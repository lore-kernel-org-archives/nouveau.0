From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] drm/nv10-nv20: CRTC arbitration code rewrite.
Date: Mon, 23 Nov 2009 14:45:53 +0100
Message-ID: <1258983953-15349-3-git-send-email-currojerez@riseup.net>
References: <1258983953-15349-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1258983953-15349-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

The previous bandwidth calculation code was nv legacy and it had some
issues besides being obfuscated:

 * It assumed a single-head setup (I workarounded this on 5603fe7f,
   however it triggered bug 24820).

 * It could lead to unnecessarily conservative settings, because it
   assumed a 1kB FIFO size limit (like nv10/nv15, but not nv11/nv17).

 * It sometimes set unacceptably large FIFO burst values, screwing
   latency and causing some overlay corruption (bug 11993).

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_calc.c |  182 ++++++++++++--------------------
 1 files changed, 67 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_calc.c b/drivers/gpu/drm/nouveau/nouveau_calc.c
index 5d48274..1f85715 100644
--- a/drivers/gpu/drm/nouveau/nouveau_calc.c
+++ b/drivers/gpu/drm/nouveau/nouveau_calc.c
@@ -109,133 +109,85 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 static void
 nv10_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
-	int pagemiss, width, bpp;
-	int nvclks, mclks, pclks, vpagemiss, crtpagemiss;
-	int found, mclk_extra, mclk_loop, cbs, m1;
-	int mclk_freq, pclk_freq, nvclk_freq;
-	int us_m, us_m_min, us_n, us_p, crtc_drain_rate;
-	int vus_m;
-	int vpm_us, us_video, cpm_us, us_crt, clwm;
-	int clwm_rnd_down, min_clwm;
-	int m2us, us_pipe_min, p1clk, p2;
-	int min_mclk_extra;
-	int us_min_mclk_extra;
-
-	pclk_freq = arb->pclk_khz;	/* freq in KHz */
-	mclk_freq = arb->mclk_khz;
+	int fill_rate, drain_rate;
+	int pclks, nvclks, mclks, xclks;
+	int pclk_freq, nvclk_freq, mclk_freq;
+	int fill_lat, extra_lat;
+	int max_burst_o, max_burst_l, burst;
+	int fifo_len, min_lwm, max_lwm;
+	const int burst_lat = 80; /* Maximum allowable latency due
+				   * to the CRTC FIFO burst. (ns) */
+
+	pclk_freq = arb->pclk_khz;
 	nvclk_freq = arb->nvclk_khz;
-	pagemiss = arb->mem_page_miss;
-	width = arb->memory_width / 64;
-	bpp = arb->bpp;
-	clwm = 0;
-	cbs = 512;
+	mclk_freq = arb->mclk_khz;
+
+	fill_rate = mclk_freq * arb->memory_width / 8; /* kB/s */
+	drain_rate = pclk_freq * arb->bpp / 8; /* kB/s */
+
+	fifo_len = arb->two_heads ? 1536 : 1024; /* B */
+
+	/* Fixed FIFO refill latency. */
+
 	pclks = 4;	/* lwm detect. */
-	nvclks = 3;	/* lwm -> sync. */
-	nvclks += 2;	/* fbi bus cycles (1 req + 1 busy) */
-	mclks = 1;	/* 2 edge sync.  may be very close to edge so just put one. */
-	mclks += 1;	/* arb_hp_req */
-	mclks += 5;	/* ap_hp_req   tiling pipeline */
-	mclks += 2;	/* tc_req     latency fifo */
-	mclks += 2;	/* fb_cas_n_  memory request to fbio block */
-	mclks += 7;	/* sm_d_rdv   data returned from fbio block */
-
-	/* fb.rd.d.Put_gc   need to accumulate 256 bits for read */
-	if (arb->memory_type == 0) {
-		if (arb->memory_width == 64)	/* 64 bit bus */
-			mclks += 4;
-		else
-			mclks += 2;
-	} else if (arb->memory_width == 64)	/* 64 bit bus */
-		mclks += 2;
-	else
-		mclks += 1;
 
-	mclk_extra = (bpp == 32) ? 8 : 4;	/* Margin of error */
-	min_mclk_extra = 18;
+	nvclks = 3	/* lwm -> sync. */
+		+ 2	/* fbi bus cycles (1 req + 1 busy) */
+		+ 1	/* 2 edge sync.  may be very close to edge so
+			 * just put one. */
+		+ 1	/* fbi_d_rdv_n */
+		+ 1	/* Fbi_d_rdata */
+		+ 1;	/* crtfifo load */
 
-	nvclks += 1;	/* 2 edge sync.  may be very close to edge so just put one. */
-	nvclks += 1;	/* fbi_d_rdv_n */
-	nvclks += 1;	/* Fbi_d_rdata */
-	nvclks += 1;	/* crtfifo load */
+	mclks = 1	/* 2 edge sync.  may be very close to edge so
+			 * just put one. */
+		+ 1	/* arb_hp_req */
+		+ 5	/* tiling pipeline */
+		+ 2	/* latency fifo */
+		+ 2	/* memory request to fbio block */
+		+ 7;	/* data returned from fbio block */
 
-	/* Extra clocks determined by heuristics */
+	/* Need to accumulate 256 bits for read */
+	mclks += (arb->memory_type == 0 ? 2 : 1)
+		* arb->memory_width / 32;
 
-	nvclks += 0;
-	pclks += 0;
-	found = 0;
-	while (found != 1) {
-		found = 1;
-		mclk_loop = mclks + mclk_extra;
-		us_m = mclk_loop * 1000 * 1000 / mclk_freq;	/* Mclk latency in us */
-		us_m_min = mclks * 1000 * 1000 / mclk_freq;	/* Minimum Mclk latency in us */
-		us_min_mclk_extra = min_mclk_extra * 1000 * 1000 / mclk_freq;
-		us_n = nvclks * 1000 * 1000 / nvclk_freq;	/* nvclk latency in us */
-		us_p = pclks * 1000 * 1000 / pclk_freq;	/* nvclk latency in us */
-		us_pipe_min = us_m_min + us_n + us_p;
+	fill_lat = mclks * 1000 * 1000 / mclk_freq   /* minimum mclk latency */
+		+ nvclks * 1000 * 1000 / nvclk_freq  /* nvclk latency */
+		+ pclks * 1000 * 1000 / pclk_freq;   /* pclk latency */
 
-		vus_m = mclk_loop * 1000 * 1000 / mclk_freq;	/* Mclk latency in us */
+	/* Conditional FIFO refill latency. */
 
-		crtc_drain_rate = pclk_freq * bpp / 8;	/* MB/s */
+	xclks = 2 * arb->mem_page_miss + mclks /* Extra latency due to
+						* the overlay. */
+		+ 2 * arb->mem_page_miss       /* Extra pagemiss latency. */
+		+ (arb->bpp == 32 ? 8 : 4);    /* Margin of error. */
 
-		vpagemiss = 1;	/* self generating page miss */
-		vpagemiss += 1;	/* One higher priority before */
+	extra_lat = xclks * 1000 * 1000 / mclk_freq;
 
-		crtpagemiss = 2;	/* self generating page miss */
+	if (arb->two_heads)
+		/* Account for another CRTC. */
+		extra_lat += fill_lat + extra_lat + burst_lat;
 
-		vpm_us = vpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
+	/* FIFO burst */
 
-		us_video = vpm_us + vus_m;	/* Video has separate read return path */
+	/* Max burst not leading to overflows. */
+	max_burst_o = (1 + fifo_len - extra_lat * drain_rate / (1000 * 1000))
+		* (fill_rate / 1000) / ((fill_rate - drain_rate) / 1000);
 
-		cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-		us_crt = us_video	/* Wait for video */
-			+ cpm_us	/* CRT Page miss */
-			+ us_m + us_n + us_p;	/* other latency */
+	/* Max burst value with an acceptable latency. */
+	max_burst_l = burst_lat * fill_rate / (1000 * 1000);
 
-		clwm = us_crt * crtc_drain_rate / (1000 * 1000);
-		clwm++;	/* fixed point <= float_point - 1.  Fixes that */
-
-		/*
-		 * Overfill check:
-		 */
-
-		clwm_rnd_down = (clwm / 8) * 8;
-		if (clwm_rnd_down < clwm)
-			clwm += 8;
-
-		m1 = clwm + cbs - 1024;	/* Amount of overfill */
-		m2us = us_pipe_min + us_min_mclk_extra;
-
-		/* pclk cycles to drain */
-		p1clk = m2us * pclk_freq / (1000 * 1000);
-		p2 = p1clk * bpp / 8;	/* bytes drained. */
-
-		if (p2 < m1 && m1 > 0) {
-			found = 0;
-			if (min_mclk_extra == 0) {
-				if (cbs <= 32)
-					found = 1;	/* Can't adjust anymore! */
-				else
-					cbs = cbs / 2;	/* reduce the burst size */
-			} else
-				min_mclk_extra--;
-		} else if (clwm > 1023) {	/* Have some margin */
-			found = 0;
-			if (min_mclk_extra == 0)
-				found = 1;	/* Can't adjust anymore! */
-			else
-				min_mclk_extra--;
-		}
+	fifo->burst = burst = rounddown_pow_of_two(
+		min(max_burst_l, min(max_burst_o, 1024)));
 
-		/* This correction works around a slight snow effect
-		 * when the TV and VGA outputs are enabled simultaneously. */
-		min_clwm = 1024 - cbs + 128 * pclk_freq / 100000;
-		if (clwm < min_clwm)
-			clwm = min_clwm;
+	/* FIFO low watermark */
 
-		/*  printf("CRT LWM: prog: 0x%x, bs: 256\n", clwm); */
-		fifo->lwm = clwm;
-		fifo->burst = cbs;
-	}
+	min_lwm = (fill_lat + extra_lat) * drain_rate / (1000 * 1000) + 1;
+	max_lwm = fifo_len - burst
+		+ fill_lat * drain_rate / (1000 * 1000)
+		+ burst * drain_rate / fill_rate;
+
+	fifo->lwm = min_lwm + 5 * (max_lwm - min_lwm) / 100; /* Empirical. */
 }
 
 static void
-- 
1.6.4.4
