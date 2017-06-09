From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm/nouveau: use proper prototype in nouveau_pmops_runtime() definition
Date: Fri,  9 Jun 2017 12:38:33 +0200
Message-ID: <20170609103851.3267574-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

There is a prototype for this function in the header, but the function
itself lacks a 'void' in the argument list, causing a harmless warning
when building with 'make W=1':

drivers/gpu/drm/nouveau/nouveau_drm.c: In function 'nouveau_pmops_runtime':
drivers/gpu/drm/nouveau/nouveau_drm.c:730:1: error: old-style function definition [-Werror=old-style-definition]

Fixes: 321f5c5f2c49 ("drm/nouveau: replace multiple open-coded runpm support checks with function")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7acd1cf8c5a6..90757af9bc73 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -727,7 +727,7 @@ nouveau_pmops_thaw(struct device *dev)
 }
 
 bool
-nouveau_pmops_runtime()
+nouveau_pmops_runtime(void)
 {
 	if (nouveau_runtime_pm == -1)
 		return nouveau_is_optimus() || nouveau_is_v1_dsm();
-- 
2.9.0
