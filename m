From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [v2] drm/nouveau/clk: fix gcc-7 -Wint-in-bool-context warning
Date: Wed,  6 Sep 2017 23:40:53 +0200
Message-ID: <20170906214108.1985196-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: Karol Herbst <karolherbst@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Baoyou Xie <baoyou.xie@linaro.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

gcc thinks that interpreting a multiplication result as a bool
is confusing:

drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c: In function 'read_pll':
drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c:133:8: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]

Adding a temporary variable to contain the divisor helps make
it clear what is going on and avoids that warning.

Fixes: 7632b30e4b8b ("drm/nouveau/clk: namespace + nvidia gpu names (no binary change)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Originally submitted on July 14, but no reply. This is the same
patch again. The warning is currently disabled in mainline, but
I think we can turn it back on in the future, and this change here
seems harmless.

v2: use a temporary variable as suggested by Karol Herbst.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
index 96e0941c8edd..f0a26881d9b9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
@@ -110,6 +110,7 @@ read_pll(struct gt215_clk *clk, int idx, u32 pll)
 	struct nvkm_device *device = clk->base.subdev.device;
 	u32 ctrl = nvkm_rd32(device, pll + 0);
 	u32 sclk = 0, P = 1, N = 1, M = 1;
+	u32 MP;
 
 	if (!(ctrl & 0x00000008)) {
 		if (ctrl & 0x00000001) {
@@ -130,10 +131,12 @@ read_pll(struct gt215_clk *clk, int idx, u32 pll)
 		sclk = read_clk(clk, 0x10 + idx, false);
 	}
 
-	if (M * P)
-		return sclk * N / (M * P);
+	MP = M * P;
 
-	return 0;
+	if (!MP)
+		return 0;
+
+	return sclk * N / MP;
 }
 
 static int
-- 
2.9.0
