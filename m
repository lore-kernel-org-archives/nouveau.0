From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 29/30] drm/nouveau/nv50_display: Remove superfluous prototype for local static functions
Date: Wed, 13 Jan 2021 08:07:51 +0000
Message-ID: <20210113080752.1003793-30-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes the following build error:

 drivers/gpu/drm/nouveau/dispnv50/disp.c:2530:1: error: conflicting types for ‘nv50_display_fini’
 In file included from drivers/gpu/drm/nouveau/dispnv50/disp.c:71:
 drivers/gpu/drm/nouveau/nv50_display.h:36:6: note: previous declaration of ‘nv50_display_fini’ was her
 In file included from drivers/gpu/drm/nouveau/dispnv50/disp.c:71:
 drivers/gpu/drm/nouveau/nv50_display.h:35:6: note: previous declaration of ‘nv50_display_init’ was here
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2581:1: error: static declaration of ‘nv50_display_destroy’ follows non-static declaration
 In file included from drivers/gpu/drm/nouveau/dispnv50/disp.c:71:
 drivers/gpu/drm/nouveau/nv50_display.h:34:6: note: previous declaration of ‘nv50_display_destroy’ was here

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nv50_display.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
index fbd3b15583bc8..2421401d12636 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.h
+++ b/drivers/gpu/drm/nouveau/nv50_display.h
@@ -31,7 +31,4 @@
 #include "nouveau_reg.h"
 
 int  nv50_display_create(struct drm_device *);
-void nv50_display_destroy(struct drm_device *);
-int  nv50_display_init(struct drm_device *);
-void nv50_display_fini(struct drm_device *);
 #endif /* __NV50_DISPLAY_H__ */
-- 
2.25.1
