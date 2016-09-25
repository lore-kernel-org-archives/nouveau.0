From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH 3/3] drm/nouveau: remove unused function
Date: Sun, 25 Sep 2016 15:12:17 +0800
Message-ID: <1474787537-3779-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c:49:1: warning: no previous prototype for 'g94_sor_output_new' [-Wmissing-prototypes]

In fact, this function is called by no one and not exported,
so this patch removes it.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
index 1bb9d66..627b9ee1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
@@ -39,21 +39,6 @@ g94_sor_loff(struct nvkm_output_dp *outp)
 }
 
 /*******************************************************************************
- * TMDS/LVDS
- ******************************************************************************/
-static const struct nvkm_output_func
-g94_sor_output_func = {
-};
-
-int
-g94_sor_output_new(struct nvkm_disp *disp, int index,
-		   struct dcb_output *dcbE, struct nvkm_output **poutp)
-{
-	return nvkm_output_new_(&g94_sor_output_func, disp,
-				index, dcbE, poutp);
-}
-
-/*******************************************************************************
  * DisplayPort
  ******************************************************************************/
 u32
-- 
2.7.4
