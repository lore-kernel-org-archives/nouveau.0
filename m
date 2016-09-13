From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] drm/nouveau/disp: remove unused function in sorg94.c
Date: Tue, 13 Sep 2016 20:17:32 +0800
Message-ID: <1473769052-9158-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c:49:1: warning: no previous prototype for 'g94_sor_output_new' [-Wmissing-prototypes]

In fact, this function is called by no one and not exported,
so this patch removes it.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
index 1bb9d66..4510cb6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
@@ -45,14 +45,6 @@ static const struct nvkm_output_func
 g94_sor_output_func = {
 };
 
-int
-g94_sor_output_new(struct nvkm_disp *disp, int index,
-		   struct dcb_output *dcbE, struct nvkm_output **poutp)
-{
-	return nvkm_output_new_(&g94_sor_output_func, disp,
-				index, dcbE, poutp);
-}
-
 /*******************************************************************************
  * DisplayPort
  ******************************************************************************/
-- 
2.7.4
