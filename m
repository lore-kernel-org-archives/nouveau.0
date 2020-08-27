From: trix@redhat.com
Subject: [PATCH] drm/nouveau: remove redundant check
Date: Thu, 27 Aug 2020 11:37:23 -0700
Message-ID: <20200827183723.7767-1-trix@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
List-Id: nouveau.vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this problem

hw.c:271:12: warning: The left operand of '>=' is a
  garbage value
    if (pv.M1 >= pll_lim.vco1.min_m ...
        ~~~~~ ^

This is mostly not a problem because an early check in
nouveau_hw_fix_bad_vpll()

    	if (nvbios_pll_parse(bios, pll, &pll_lim))
		return;
	nouveau_hw_get_pllvals(dev, pll, &pv);

shadows a similar check in nouveau_hw_get_pllvals()

	ret = nvbios_pll_parse(bios, plltype, &pll_lim);
	if (ret || !(reg1 = pll_lim.reg))
		return -ENOENT;

Since the first check is redundant, remove it and
check the status of nouveau_hw_get_pllvals().

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/hw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index b674d68ef28a..b96c5628c33b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -259,14 +259,12 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_device *device = &drm->client.device;
 	struct nvkm_clk *clk = nvxx_clk(device);
-	struct nvkm_bios *bios = nvxx_bios(device);
 	struct nvbios_pll pll_lim;
 	struct nvkm_pll_vals pv;
 	enum nvbios_pll_type pll = head ? PLL_VPLL1 : PLL_VPLL0;
 
-	if (nvbios_pll_parse(bios, pll, &pll_lim))
+	if (nouveau_hw_get_pllvals(dev, pll, &pv))
 		return;
-	nouveau_hw_get_pllvals(dev, pll, &pv);
 
 	if (pv.M1 >= pll_lim.vco1.min_m && pv.M1 <= pll_lim.vco1.max_m &&
 	    pv.N1 >= pll_lim.vco1.min_n && pv.N1 <= pll_lim.vco1.max_n &&
-- 
2.18.1
