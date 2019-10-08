From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 3/3] drm/nouveau/kms/nv50-: include n50_display.h for nv50_display_create
Date: Tue,  8 Oct 2019 12:07:39 +0100
Message-ID: <20191008110739.13757-3-ben.dooks@codethink.co.uk>
References: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: nouveau.vger.kernel.org

Include n50_display.h for the definition of nv50_display_create to
fix the warning (and remove the now non-exported definitions in the
n50_display.h to allow the code to build):

drivers/gpu/drm/nouveau/dispnv50/disp.c:2297:1: warning: symbol 'nv50_display_create' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 ++
 drivers/gpu/drm/nouveau/nv50_display.h  | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b46be8a091e9..f7774cc927d8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -53,6 +53,8 @@
 #include "nouveau_fence.h"
 #include "nouveau_fbcon.h"
 
+#include "nv50_display.h"
+
 #include <subdev/bios/dp.h>
 
 /******************************************************************************
diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
index fbd3b15583bc..2421401d1263 100644
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
2.23.0
