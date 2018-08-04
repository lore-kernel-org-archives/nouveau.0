From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] gpu: drm: nouveau: nvkm: nv50: Replace mdelay() with msleep() in nv50_sensor_setup()
Date: Sat,  4 Aug 2018 08:30:30 +0800
Message-ID: <20180804003030.18669-1-baijiaju1990@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
List-Id: nouveau.vger.kernel.org

nv50_sensor_setup() is never called in atomic context.
It calls mdelay() to busily wait, which is not necessary.
mdelay() can be replaced with msleep().

This is found by a static analysis tool named DCNS written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
index 9b57b433d4cf..ce8f98f3ee48 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
@@ -122,7 +122,7 @@ nv50_sensor_setup(struct nvkm_therm *therm)
 {
 	struct nvkm_device *device = therm->subdev.device;
 	nvkm_mask(device, 0x20010, 0x40000000, 0x0);
-	mdelay(20); /* wait for the temperature to stabilize */
+	msleep(20); /* wait for the temperature to stabilize */
 }
 
 static int
-- 
2.17.0
