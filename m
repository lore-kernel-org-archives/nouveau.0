From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] gpu: drm: nouveau: nvkm: nv40: Replace mdelay() with msleep() in nv40_sensor_setup()
Date: Sat,  4 Aug 2018 08:28:45 +0800
Message-ID: <20180804002845.18557-1-baijiaju1990@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
List-Id: nouveau.vger.kernel.org

nv40_sensor_setup() is never called in atomic context.
It calls mdelay() to busily wait, which is not necessary.
mdelay() can be replaced with msleep().

This is found by a static analysis tool named DCNS written by myself

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c
index 2c92ffb5f9d0..36c4b8865083 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c
@@ -59,11 +59,11 @@ nv40_sensor_setup(struct nvkm_therm *therm)
 	if (style == NEW_STYLE) {
 		nvkm_mask(device, 0x15b8, 0x80000000, 0);
 		nvkm_wr32(device, 0x15b0, 0x80003fff);
-		mdelay(20); /* wait for the temperature to stabilize */
+		msleep(20); /* wait for the temperature to stabilize */
 		return nvkm_rd32(device, 0x15b4) & 0x3fff;
 	} else if (style == OLD_STYLE) {
 		nvkm_wr32(device, 0x15b0, 0xff);
-		mdelay(20); /* wait for the temperature to stabilize */
+		msleep(20); /* wait for the temperature to stabilize */
 		return nvkm_rd32(device, 0x15b4) & 0xff;
 	} else
 		return -ENODEV;
-- 
2.17.0
