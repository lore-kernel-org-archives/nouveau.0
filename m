From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/nv04/disp: remove set but not used variable 'width'
Date: Fri, 17 Jan 2020 10:01:02 +0800
Message-ID: <20200117020102.56636-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, wambui.karugax@gmail.com, yuehaibing@huawei.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

drivers/gpu/drm/nouveau/dispnv04/arb.c: In function nv04_calc_arb:
drivers/gpu/drm/nouveau/dispnv04/arb.c:56:21: warning:
 variable width set but not used [-Wunused-but-set-variable]

'width' is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index f607a04..9d4a2d9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -53,7 +53,7 @@ struct nv_sim_state {
 static void
 nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
-	int pagemiss, cas, width, bpp;
+	int pagemiss, cas, bpp;
 	int nvclks, mclks, crtpagemiss;
 	int found, mclk_extra, mclk_loop, cbs, m1, p1;
 	int mclk_freq, pclk_freq, nvclk_freq;
@@ -65,7 +65,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	nvclk_freq = arb->nvclk_khz;
 	pagemiss = arb->mem_page_miss;
 	cas = arb->mem_latency;
-	width = arb->memory_width >> 6;
 	bpp = arb->bpp;
 	cbs = 128;
 
-- 
2.7.4
