From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau: Clean up the arbitration
	parameters calculation code.
Date: Mon, 23 Nov 2009 14:45:52 +0100
Message-ID: <1258983953-15349-2-git-send-email-currojerez@riseup.net>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_calc.c |  248 +++++++++-----------------------
 1 files changed, 69 insertions(+), 179 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_calc.c b/drivers/gpu/drm/nouveau/nouveau_calc.c
index 3f80db8..5d48274 100644
--- a/drivers/gpu/drm/nouveau/nouveau_calc.c
+++ b/drivers/gpu/drm/nouveau/nouveau_calc.c
@@ -34,35 +34,31 @@
 \****************************************************************************/
 
 struct nv_fifo_info {
-	int graphics_lwm;
-	int video_lwm;
-	int graphics_burst_size;
-	int video_burst_size;
-	bool valid;
+	int lwm;
+	int burst;
 };
 
 struct nv_sim_state {
 	int pclk_khz;
 	int mclk_khz;
 	int nvclk_khz;
-	int pix_bpp;
-	bool enable_mp;
-	bool enable_video;
+	int bpp;
 	int mem_page_miss;
 	int mem_latency;
 	int memory_type;
 	int memory_width;
+	int two_heads;
 };
 
 static void
-nv4CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
+nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
-	int pagemiss, cas, width, video_enable, bpp;
-	int nvclks, mclks, pclks, vpagemiss, crtpagemiss, vbs;
+	int pagemiss, cas, width, bpp;
+	int nvclks, mclks, pclks, crtpagemiss;
 	int found, mclk_extra, mclk_loop, cbs, m1, p1;
-	int mclk_freq, pclk_freq, nvclk_freq, mp_enable;
-	int us_m, us_n, us_p, video_drain_rate, crtc_drain_rate;
-	int vpm_us, us_video, vlwm, video_fill_us, cpm_us, us_crt, clwm;
+	int mclk_freq, pclk_freq, nvclk_freq;
+	int us_m, us_n, us_p, crtc_drain_rate;
+	int cpm_us, us_crt, clwm;
 
 	pclk_freq = arb->pclk_khz;
 	mclk_freq = arb->mclk_khz;
@@ -70,107 +66,53 @@ nv4CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	pagemiss = arb->mem_page_miss;
 	cas = arb->mem_latency;
 	width = arb->memory_width >> 6;
-	video_enable = arb->enable_video;
-	bpp = arb->pix_bpp;
-	mp_enable = arb->enable_mp;
-	clwm = 0;
-	vlwm = 0;
+	bpp = arb->bpp;
 	cbs = 128;
+
 	pclks = 2;
-	nvclks = 2;
-	nvclks += 2;
-	nvclks += 1;
-	mclks = 5;
-	mclks += 3;
-	mclks += 1;
-	mclks += cas;
-	mclks += 1;
-	mclks += 1;
-	mclks += 1;
-	mclks += 1;
+	nvclks = 10;
+	mclks = 13 + cas;
 	mclk_extra = 3;
-	nvclks += 2;
-	nvclks += 1;
-	nvclks += 1;
-	nvclks += 1;
-	if (mp_enable)
-		mclks += 4;
-	nvclks += 0;
-	pclks += 0;
 	found = 0;
-	vbs = 0;
-	while (found != 1) {
-		fifo->valid = true;
+
+	while (!found) {
 		found = 1;
+
 		mclk_loop = mclks + mclk_extra;
 		us_m = mclk_loop * 1000 * 1000 / mclk_freq;
 		us_n = nvclks * 1000 * 1000 / nvclk_freq;
 		us_p = nvclks * 1000 * 1000 / pclk_freq;
-		if (video_enable) {
-			video_drain_rate = pclk_freq * 2;
-			crtc_drain_rate = pclk_freq * bpp / 8;
-			vpagemiss = 2;
-			vpagemiss += 1;
-			crtpagemiss = 2;
-			vpm_us = vpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-			if (nvclk_freq * 2 > mclk_freq * width)
-				video_fill_us = cbs * 1000 * 1000 / 16 / nvclk_freq;
-			else
-				video_fill_us = cbs * 1000 * 1000 / (8 * width) / mclk_freq;
-			us_video = vpm_us + us_m + us_n + us_p + video_fill_us;
-			vlwm = us_video * video_drain_rate / (1000 * 1000);
-			vlwm++;
-			vbs = 128;
-			if (vlwm > 128)
-				vbs = 64;
-			if (vlwm > (256 - 64))
-				vbs = 32;
-			if (nvclk_freq * 2 > mclk_freq * width)
-				video_fill_us = vbs * 1000 * 1000 / 16 / nvclk_freq;
-			else
-				video_fill_us = vbs * 1000 * 1000 / (8 * width) / mclk_freq;
-			cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-			us_crt = us_video + video_fill_us + cpm_us + us_m + us_n + us_p;
-			clwm = us_crt * crtc_drain_rate / (1000 * 1000);
-			clwm++;
-		} else {
-			crtc_drain_rate = pclk_freq * bpp / 8;
-			crtpagemiss = 2;
-			crtpagemiss += 1;
-			cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-			us_crt = cpm_us + us_m + us_n + us_p;
-			clwm = us_crt * crtc_drain_rate / (1000 * 1000);
-			clwm++;
-		}
+
+		crtc_drain_rate = pclk_freq * bpp / 8;
+		crtpagemiss = 2;
+		crtpagemiss += 1;
+		cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
+		us_crt = cpm_us + us_m + us_n + us_p;
+		clwm = us_crt * crtc_drain_rate / (1000 * 1000);
+		clwm++;
+
 		m1 = clwm + cbs - 512;
 		p1 = m1 * pclk_freq / mclk_freq;
 		p1 = p1 * bpp / 8;
-		if ((p1 < m1 && m1 > 0) ||
-		    (video_enable && (clwm > 511 || vlwm > 255)) ||
-		    (!video_enable && clwm > 519)) {
-			fifo->valid = false;
+		if ((p1 < m1 && m1 > 0) || clwm > 519) {
 			found = !mclk_extra;
 			mclk_extra--;
 		}
 		if (clwm < 384)
 			clwm = 384;
-		if (vlwm < 128)
-			vlwm = 128;
-		fifo->graphics_lwm = clwm;
-		fifo->graphics_burst_size = 128;
-		fifo->video_lwm = vlwm + 15;
-		fifo->video_burst_size = vbs;
+
+		fifo->lwm = clwm;
+		fifo->burst = cbs;
 	}
 }
 
 static void
-nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
+nv10_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
-	int pagemiss, width, video_enable, bpp;
+	int pagemiss, width, bpp;
 	int nvclks, mclks, pclks, vpagemiss, crtpagemiss;
-	int nvclk_fill;
 	int found, mclk_extra, mclk_loop, cbs, m1;
-	int mclk_freq, pclk_freq, nvclk_freq, mp_enable;
+	int mclk_freq, pclk_freq, nvclk_freq;
 	int us_m, us_m_min, us_n, us_p, crtc_drain_rate;
 	int vus_m;
 	int vpm_us, us_video, cpm_us, us_crt, clwm;
@@ -184,9 +126,7 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	nvclk_freq = arb->nvclk_khz;
 	pagemiss = arb->mem_page_miss;
 	width = arb->memory_width / 64;
-	video_enable = arb->enable_video;
-	bpp = arb->pix_bpp;
-	mp_enable = arb->enable_mp;
+	bpp = arb->bpp;
 	clwm = 0;
 	cbs = 512;
 	pclks = 4;	/* lwm detect. */
@@ -210,29 +150,20 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	else
 		mclks += 1;
 
-	if (!video_enable && arb->memory_width == 128) {
-		mclk_extra = (bpp == 32) ? 31 : 42;	/* Margin of error */
-		min_mclk_extra = 17;
-	} else {
-		mclk_extra = (bpp == 32) ? 8 : 4;	/* Margin of error */
-		/* mclk_extra = 4; *//* Margin of error */
-		min_mclk_extra = 18;
-	}
+	mclk_extra = (bpp == 32) ? 8 : 4;	/* Margin of error */
+	min_mclk_extra = 18;
 
 	nvclks += 1;	/* 2 edge sync.  may be very close to edge so just put one. */
 	nvclks += 1;	/* fbi_d_rdv_n */
 	nvclks += 1;	/* Fbi_d_rdata */
 	nvclks += 1;	/* crtfifo load */
 
-	if (mp_enable)
-		mclks += 4;	/* Mp can get in with a burst of 8. */
 	/* Extra clocks determined by heuristics */
 
 	nvclks += 0;
 	pclks += 0;
 	found = 0;
 	while (found != 1) {
-		fifo->valid = true;
 		found = 1;
 		mclk_loop = mclks + mclk_extra;
 		us_m = mclk_loop * 1000 * 1000 / mclk_freq;	/* Mclk latency in us */
@@ -244,50 +175,24 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 
 		vus_m = mclk_loop * 1000 * 1000 / mclk_freq;	/* Mclk latency in us */
 
-		if (video_enable) {
-			crtc_drain_rate = pclk_freq * bpp / 8;	/* MB/s */
-
-			vpagemiss = 1;	/* self generating page miss */
-			vpagemiss += 1;	/* One higher priority before */
-
-			crtpagemiss = 2;	/* self generating page miss */
-			if (mp_enable)
-				crtpagemiss += 1;	/* if MA0 conflict */
-
-			vpm_us = vpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-
-			us_video = vpm_us + vus_m;	/* Video has separate read return path */
-
-			cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-			us_crt = us_video	/* Wait for video */
-				 + cpm_us	/* CRT Page miss */
-				 + us_m + us_n + us_p;	/* other latency */
-
-			clwm = us_crt * crtc_drain_rate / (1000 * 1000);
-			clwm++;	/* fixed point <= float_point - 1.  Fixes that */
-		} else {
-			crtc_drain_rate = pclk_freq * bpp / 8;	/* bpp * pclk/8 */
-
-			crtpagemiss = 1;	/* self generating page miss */
-			crtpagemiss += 1;	/* MA0 page miss */
-			if (mp_enable)
-				crtpagemiss += 1;	/* if MA0 conflict */
-			cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
-			us_crt = cpm_us + us_m + us_n + us_p;
-			clwm = us_crt * crtc_drain_rate / (1000 * 1000);
-			clwm++;	/* fixed point <= float_point - 1.  Fixes that */
-
-			/* Finally, a heuristic check when width == 64 bits */
-			if (width == 1) {
-				nvclk_fill = nvclk_freq * 8;
-				if (crtc_drain_rate * 100 >= nvclk_fill * 102)
-					clwm = 0xfff;	/* Large number to fail */
-				else if (crtc_drain_rate * 100 >= nvclk_fill * 98) {
-					clwm = 1024;
-					cbs = 512;
-				}
-			}
-		}
+		crtc_drain_rate = pclk_freq * bpp / 8;	/* MB/s */
+
+		vpagemiss = 1;	/* self generating page miss */
+		vpagemiss += 1;	/* One higher priority before */
+
+		crtpagemiss = 2;	/* self generating page miss */
+
+		vpm_us = vpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
+
+		us_video = vpm_us + vus_m;	/* Video has separate read return path */
+
+		cpm_us = crtpagemiss * pagemiss * 1000 * 1000 / mclk_freq;
+		us_crt = us_video	/* Wait for video */
+			+ cpm_us	/* CRT Page miss */
+			+ us_m + us_n + us_p;	/* other latency */
+
+		clwm = us_crt * crtc_drain_rate / (1000 * 1000);
+		clwm++;	/* fixed point <= float_point - 1.  Fixes that */
 
 		/*
 		 * Overfill check:
@@ -305,7 +210,6 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 		p2 = p1clk * bpp / 8;	/* bytes drained. */
 
 		if (p2 < m1 && m1 > 0) {
-			fifo->valid = false;
 			found = 0;
 			if (min_mclk_extra == 0) {
 				if (cbs <= 32)
@@ -315,7 +219,6 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 			} else
 				min_mclk_extra--;
 		} else if (clwm > 1023) {	/* Have some margin */
-			fifo->valid = false;
 			found = 0;
 			if (min_mclk_extra == 0)
 				found = 1;	/* Can't adjust anymore! */
@@ -330,17 +233,14 @@ nv10CalcArbitration(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 			clwm = min_clwm;
 
 		/*  printf("CRT LWM: prog: 0x%x, bs: 256\n", clwm); */
-		fifo->graphics_lwm = clwm;
-		fifo->graphics_burst_size = cbs;
-
-		fifo->video_lwm = 1024;
-		fifo->video_burst_size = 512;
+		fifo->lwm = clwm;
+		fifo->burst = cbs;
 	}
 }
 
 static void
-nv4_10UpdateArbitrationSettings(struct drm_device *dev, int VClk, int bpp,
-				int *burst, int *lwm)
+nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
+		int *burst, int *lwm)
 {
 	struct nv_fifo_info fifo_data;
 	struct nv_sim_state sim_data;
@@ -351,21 +251,19 @@ nv4_10UpdateArbitrationSettings(struct drm_device *dev, int VClk, int bpp,
 	sim_data.pclk_khz = VClk;
 	sim_data.mclk_khz = MClk;
 	sim_data.nvclk_khz = NVClk;
-	sim_data.pix_bpp = bpp;
-	sim_data.enable_mp = false;
+	sim_data.bpp = bpp;
+	sim_data.two_heads = nv_two_heads(dev);
 	if ((dev->pci_device & 0xffff) == 0x01a0 /*CHIPSET_NFORCE*/ ||
 	    (dev->pci_device & 0xffff) == 0x01f0 /*CHIPSET_NFORCE2*/) {
 		uint32_t type;
 
 		pci_read_config_dword(pci_get_bus_and_slot(0, 1), 0x7c, &type);
 
-		sim_data.enable_video = false;
 		sim_data.memory_type = (type >> 12) & 1;
 		sim_data.memory_width = 64;
 		sim_data.mem_latency = 3;
 		sim_data.mem_page_miss = 10;
 	} else {
-		sim_data.enable_video = (nv_arch(dev) != NV_04);
 		sim_data.memory_type = nvReadFB(dev, NV_PFB_CFG0) & 0x1;
 		sim_data.memory_width = (nvReadEXTDEV(dev, NV_PEXTDEV_BOOT_0) & 0x10) ? 128 : 64;
 		sim_data.mem_latency = cfg1 & 0xf;
@@ -373,21 +271,16 @@ nv4_10UpdateArbitrationSettings(struct drm_device *dev, int VClk, int bpp,
 	}
 
 	if (nv_arch(dev) == NV_04)
-		nv4CalcArbitration(&fifo_data, &sim_data);
+		nv04_calc_arb(&fifo_data, &sim_data);
 	else
-		nv10CalcArbitration(&fifo_data, &sim_data);
-
-	if (fifo_data.valid) {
-		int b = fifo_data.graphics_burst_size >> 4;
-		*burst = 0;
-		while (b >>= 1)
-			(*burst)++;
-		*lwm = fifo_data.graphics_lwm >> 3;
-	}
+		nv10_calc_arb(&fifo_data, &sim_data);
+
+	*burst = ilog2(fifo_data.burst >> 4);
+	*lwm = fifo_data.lwm >> 3;
 }
 
 static void
-nv30UpdateArbitrationSettings(int *burst, int *lwm)
+nv30_update_arb(int *burst, int *lwm)
 {
 	unsigned int fifo_size, burst_size, graphics_lwm;
 
@@ -395,10 +288,7 @@ nv30UpdateArbitrationSettings(int *burst, int *lwm)
 	burst_size = 512;
 	graphics_lwm = fifo_size - burst_size;
 
-	*burst = 0;
-	burst_size >>= 5;
-	while (burst_size >>= 1)
-		(*burst)++;
+	*burst = ilog2(burst_size >> 5);
 	*lwm = graphics_lwm >> 3;
 }
 
@@ -406,13 +296,13 @@ void
 nouveau_calc_arb(struct drm_device *dev, int vclk, int bpp, int *burst, int *lwm)
 {
 	if (nv_arch(dev) < NV_30)
-		nv4_10UpdateArbitrationSettings(dev, vclk, bpp, burst, lwm);
+		nv04_update_arb(dev, vclk, bpp, burst, lwm);
 	else if ((dev->pci_device & 0xfff0) == 0x0240 /*CHIPSET_C51*/ ||
 		 (dev->pci_device & 0xfff0) == 0x03d0 /*CHIPSET_C512*/) {
 		*burst = 128;
 		*lwm = 0x0480;
 	} else
-		nv30UpdateArbitrationSettings(burst, lwm);
+		nv30_update_arb(burst, lwm);
 }
 
 static int
-- 
1.6.4.4
