From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] drm: nouveau: remove a redundant local variable 'pclks'
Date: Wed, 19 Sep 2018 22:36:04 +0800
Message-ID: <1537367764-59819-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: bskeggs@redhat.com, okaya@codeaurora.org, helgaas@kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

The local variable 'pclks' is never used after being assigned.
hence it should be redundant and can be removed.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index c79160c..cae8f71 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -56,7 +56,7 @@ struct nv_sim_state {
 nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
 	int pagemiss, cas, width, bpp;
-	int nvclks, mclks, pclks, crtpagemiss;
+	int nvclks, mclks, crtpagemiss;
 	int found, mclk_extra, mclk_loop, cbs, m1, p1;
 	int mclk_freq, pclk_freq, nvclk_freq;
 	int us_m, us_n, us_p, crtc_drain_rate;
@@ -71,7 +71,6 @@ struct nv_sim_state {
 	bpp = arb->bpp;
 	cbs = 128;
 
-	pclks = 2;
 	nvclks = 10;
 	mclks = 13 + cas;
 	mclk_extra = 3;
-- 
1.7.12.4
