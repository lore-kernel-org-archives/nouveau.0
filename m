From: Wambui Karuga <wambui.karugax@gmail.com>
Subject: [PATCH] drm/nouveau: remove set but unused variable.
Date: Tue, 31 Dec 2019 23:56:07 +0300
Message-ID: <20191231205607.1005-1-wambui.karugax@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

The local variable `pclks` is defined and set but not used and can
therefore be removed.
Issue found by coccinelle.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index 362495535e69..f607a04d262d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -54,7 +54,7 @@ static void
 nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
 	int pagemiss, cas, width, bpp;
-	int nvclks, mclks, pclks, crtpagemiss;
+	int nvclks, mclks, crtpagemiss;
 	int found, mclk_extra, mclk_loop, cbs, m1, p1;
 	int mclk_freq, pclk_freq, nvclk_freq;
 	int us_m, us_n, us_p, crtc_drain_rate;
@@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	bpp = arb->bpp;
 	cbs = 128;
 
-	pclks = 2;
 	nvclks = 10;
 	mclks = 13 + cas;
 	mclk_extra = 3;
-- 
2.17.1
