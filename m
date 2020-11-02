From: Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] drm/nouveu: remove unused variable
Date: Mon, 2 Nov 2020 20:20:39 +0800
Message-ID: <1604319639-12227-1-git-send-email-zou_wei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Zou Wei <zou_wei@huawei.com>
List-Id: nouveau.vger.kernel.org

Fix variables set but not used compilation warnings:

./nouveau_bo.c:1313:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
  struct device *dev;
                 ^~~
./nouveau_bo.c:1337:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
  struct device *dev;
                 ^~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 8133377..96f00b5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1310,7 +1310,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1324,7 +1323,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1334,14 +1332,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 			  struct ttm_tt *ttm)
 {
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
 		return;
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
-- 
2.6.2
