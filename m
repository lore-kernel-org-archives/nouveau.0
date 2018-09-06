From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 2/6] drm/nouveau: Add NV_PRINTK_ONCE and variants
Date: Thu,  6 Sep 2018 17:43:22 -0400
Message-ID: <20180906214328.24012-3-lyude@redhat.com>
References: <20180906214328.24012-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906214328.24012-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Since we're about to use this in nouveau_backlight.c. Same thing as
DRM_WARN_ONCE, DRM_INFO_ONCE, etc...

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 6e1acaec3400..d9d687916553 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -244,10 +244,12 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 	struct nouveau_cli *_cli = (c);                                        \
 	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
 } while(0)
+
 #define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
 #define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
 #define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
+
 #define NV_DEBUG(drm,f,a...) do {                                              \
 	if (unlikely(drm_debug & DRM_UT_DRIVER))                               \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
@@ -257,6 +259,12 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 
+#define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
+
+#define NV_ERROR_ONCE(drm,f,a...) NV_PRINTK_ONCE(err, &(drm)->client, f, ##a)
+#define NV_WARN_ONCE(drm,f,a...) NV_PRINTK_ONCE(warn, &(drm)->client, f, ##a)
+#define NV_INFO_ONCE(drm,f,a...) NV_PRINTK_ONCE(info, &(drm)->client, f, ##a)
+
 extern int nouveau_modeset;
 
 #endif
-- 
2.17.1
