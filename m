From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] gpu:nouveau: Do not use unnecessary IS_ERR_VALUE when pm_runtime_* calls
Date: Sat, 4 Aug 2018 20:00:23 +0800
Message-ID: <1533384023-18787-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, bskeggs@redhat.com
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Make sure Pm_runtime_* calls does not use unnecessary IS_ERR_VALUE.
when I run pm_runtime.cocci, I find the issue. So just replace it.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 9109b69..9635704 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -161,7 +161,7 @@
 	}
 
 	ret = pm_runtime_get_sync(drm->dev);
-	if (IS_ERR_VALUE(ret) && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES)
 		return ret;
 	ret = nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_USER, &args, sizeof(args));
 	pm_runtime_put_autosuspend(drm->dev);
-- 
1.7.12.4
