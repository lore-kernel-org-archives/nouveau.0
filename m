From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] drm/nouveau/gr: add missing header dependencies
Date: Mon, 29 Aug 2016 19:24:50 +0800
Message-ID: <1472469890-23683-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 2 warnings when build kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c:255:1: warning: no previous prototype for 'nv50_grctx_fill' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c:265:1: warning: no previous prototype for 'nv50_grctx_init' [-Wmissing-prototypes]

In fact, these functions are declared in gr/nv50.h, so this patch
add missing header dependencies

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
index 1e13278..0490ee8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
@@ -109,6 +109,8 @@
 
 #include <subdev/fb.h>
 
+#include "nv50.h"
+
 #define IS_NVA3F(x) (((x) > 0xa0 && (x) < 0xaa) || (x) == 0xaf)
 #define IS_NVAAF(x) ((x) >= 0xaa && (x) <= 0xac)
 
-- 
2.7.4
