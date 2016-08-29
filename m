From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v2] drm/nouveau: add missing header dependencies
Date: Mon, 29 Aug 2016 19:15:37 +0800
Message-ID: <1472469337-13358-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning when build kernel with W=1:
drivers/gpu/drm/nouveau/dispnv04/overlay.c:496:1: warning: no previous prototype for 'nouveau_overlay_init' [-Wmissing-prototypes]

In fact, this function is declared in disp.h, so this patch
add missing header dependencies

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index ec444ea..a79514d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -33,7 +33,7 @@
 #include "nouveau_connector.h"
 #include "nouveau_display.h"
 #include "nvreg.h"
-
+#include "disp.h"
 
 struct nouveau_plane {
 	struct drm_plane base;
-- 
2.7.4
