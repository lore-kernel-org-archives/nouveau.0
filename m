From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] drm/nouveau: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 18:36:04 +0800
Message-ID: <20200520103604.19083-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
the call returns an error code. Thus a pairing decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f5ece1f94973..125cefbb6210 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -157,8 +157,8 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 			if (!WARN_ON(ret < 0 && ret != -EACCES)) {
 				nouveau_gem_object_unmap(nvbo, vma);
 				pm_runtime_mark_last_busy(dev);
-				pm_runtime_put_autosuspend(dev);
 			}
+			pm_runtime_put_autosuspend(dev);
 		}
 	}
 	ttm_bo_unreserve(&nvbo->bo);
-- 
2.17.1
