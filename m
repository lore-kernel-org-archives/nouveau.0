From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: [PATCH] drm/nouveau/core/client: use strlcpy() instead of strncpy()
Date: Fri, 12 Jan 2018 16:03:29 +0800
Message-ID: <1515744209-136099-1-git-send-email-wangxiongfeng2@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, wangxiongfeng2@huawei.com
List-Id: nouveau.vger.kernel.org

From: Xiongfeng Wang <xiongfeng.wang@linaro.org>

gcc-8 reports

drivers/gpu/drm/nouveau/nvif/client.c: In function 'nvif_client_init':
./include/linux/string.h:245:9: warning: '__builtin_strncpy' specified
bound 32 equals destination size [-Wstringop-truncation]

We need to use strlcpy() to make sure the dest string is nul-terminated.

Signed-off-by: Xiongfeng Wang <xiongfeng.wang@linaro.org>
---
 drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 12db549..f294d99 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -69,7 +69,7 @@
 	} nop = {};
 	int ret;
 
-	strncpy(args.name, name, sizeof(args.name));
+	strlcpy(args.name, name, sizeof(args.name));
 	ret = nvif_object_init(parent != client ? &parent->object : NULL,
 			       0, NVIF_CLASS_CLIENT, &args, sizeof(args),
 			       &client->object);
-- 
1.8.3.1
