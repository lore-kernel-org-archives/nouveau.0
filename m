From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] drm/nouveau/core: add missing header dependencies
Date: Sun, 18 Sep 2016 20:58:53 +0800
Message-ID: <1474203533-1248-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 2 warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/core/firmware.c:34:1: warning: no previous prototype for 'nvkm_firmware_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/core/firmware.c:58:1: warning: no previous prototype for 'nvkm_firmware_put' [-Wmissing-prototypes]

In fact, both functions are declared in
drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h,
so this patch adds missing header dependencies.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 34ecd4a..058ff46 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -20,6 +20,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <core/device.h>
+#include <core/firmware.h>
 
 /**
  * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
-- 
2.7.4
