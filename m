From: Colin King <colin.king@canonical.com>
Subject: [PATCH] drm/nouveau/iccsense: fix memory leak on default sensor->type case
Date: Thu,  2 Jun 2016 11:28:52 +0100
Message-ID: <1464863332-9610-1-git-send-email-colin.king@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Karol Herbst <nouveau@karolherbst.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The default sensor->type case leaks memory allocated to rail. Fix
this by free'ing rail before we continue with the next loop iteration.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 323c79a..79b0eb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -305,6 +305,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			rail->read = nvkm_iccsense_ina3221_read;
 			break;
 		default:
+			kfree(rail);
 			continue;
 		}
 
-- 
2.8.1
