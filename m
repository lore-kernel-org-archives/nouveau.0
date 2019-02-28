From: Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH] drm/nouveau/debugfs: Fix check of pm_runtime_get_sync failure
Date: Thu, 28 Feb 2019 20:24:59 +0800
Message-ID: <20190228122459.25460-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>
List-Id: nouveau.vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

pm_runtime_get_sync returns negative on failure.

Fixes: eaeb9010bb4b ("drm/nouveau/debugfs: Wake up GPU before doing any reclocking")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 88a52f6..7dfbbbc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -181,7 +181,7 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 	}
 
 	ret = pm_runtime_get_sync(drm->dev);
-	if (IS_ERR_VALUE(ret) && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES)
 		return ret;
 	ret = nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_USER, &args, sizeof(args));
 	pm_runtime_put_autosuspend(drm->dev);
-- 
2.7.0
