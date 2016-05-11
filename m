From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] drm/nouveau/bios: remove unused variable.
Date: Thu, 12 May 2016 01:18:23 +0530
Message-ID: <1462996110-3959-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Remove unused vairable, return 0 explicitly.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 4dca65a..5449838 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2039,7 +2039,6 @@ nouveau_run_vbios_init(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvbios *bios = &drm->vbios;
-	int ret = 0;
 
 	/* Reset the BIOS head to 0. */
 	bios->state.crtchead = 0;
@@ -2052,7 +2051,7 @@ nouveau_run_vbios_init(struct drm_device *dev)
 		bios->fp.lvds_init_run = false;
 	}
 
-	return ret;
+	return 0;
 }
 
 static bool
-- 
1.9.1
