From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] drm/nouveau: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 18:25:49 +0800
Message-ID: <20200520102549.17252-1-dinghao.liu@zju.edu.cn>
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
 drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f5ece1f94973..6697f960dd89 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -76,8 +76,10 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 		return ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev);
 		goto out;
+	}
 
 	ret = nouveau_vma_new(nvbo, vmm, &vma);
 	pm_runtime_mark_last_busy(dev);
-- 
2.17.1
