From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 24/30] drm/nouveau/nouveau_bo: Remove unused variables 'dev'
Date: Wed, 13 Jan 2021 08:07:46 +0000
Message-ID: <20210113080752.1003793-25-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
List-Id: nouveau.vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_tt_populate’:
 drivers/gpu/drm/nouveau/nouveau_bo.c:1228:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_tt_unpopulate’:
 drivers/gpu/drm/nouveau/nouveau_bo.c:1252:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c85b1af06b7bf..1e8d5e1cb18f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1225,7 +1225,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1239,7 +1238,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1249,14 +1247,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
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
2.25.1
