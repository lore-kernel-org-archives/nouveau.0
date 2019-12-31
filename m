From: Wambui Karuga <wambui.karugax@gmail.com>
Subject: [PATCH] drm/nouveau: use NULL for pointer assignment.
Date: Tue, 31 Dec 2019 23:57:34 +0300
Message-ID: <20191231205734.1452-1-wambui.karugax@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Replace the use of 0 in the pointer assignment with NULL to address the
following sparse warning:
drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index d445c6f3fece..1c3104d20571 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
 			special_groups[i++] = &pwm_fan_sensor_group;
 	}
 
-	special_groups[i] = 0;
+	special_groups[i] = NULL;
 	hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
 							&nouveau_chip_info,
 							special_groups);
-- 
2.17.1
