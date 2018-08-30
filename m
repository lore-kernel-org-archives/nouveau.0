From: Joe Perches <joe@perches.com>
Subject: [PATCH 1/2] drm/nouveau: Add new logging function nv_cli_printk
Date: Thu, 30 Aug 2018 11:36:26 -0700
Message-ID: <89bd597dc1b130af25371f815af10cefed732422.1535654026.git.joe@perches.com>
References: <cover.1535654026.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1535654026.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

NV_PRINTK is a macro that adds the "%s: ", nouveau_cli.name to
logging output.

Save a few KB by creating a specific function to add that name
and change the users of theh NV_PRINTK macros to use the new
logging function.

(size -t drivers/gpu/drm/nouveau/built-in.a x86/64 defconfig with nouveau)
   text	   data	    bss	    dec	    hex	filename
1737254	 108484	   1048	1846786	 1c2e02	(TOTALS) (new)
1740706	 108484	   1048	1850238	 1c3b7e	(TOTALS) (old)

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h | 34 ++++++++++++++++++++++------------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c7ec86d6c3c9..aeca2ea3c4d1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1153,6 +1153,27 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	return ERR_PTR(err);
 }
 
+void nouveau_cli_printk(struct nouveau_cli *cli, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+	char level[2] = {KERN_SOH_ASCII, 0};
+
+	level[1] = printk_get_level(fmt);
+	if (level[1] == 0)
+		level[1] = 'd';
+
+	va_start(args, fmt);
+
+	vaf.fmt = printk_skip_headers(fmt);
+	vaf.va = &args;
+
+	dev_printk(level, cli->drm->dev->dev, "%s: %pV",
+		   cli->name, &vaf);
+
+	va_end(args);
+}
+
 static int __init
 nouveau_drm_init(void)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 6e1acaec3400..6110730d5df0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -244,18 +244,28 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 	struct nouveau_cli *_cli = (c);                                        \
 	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
 } while(0)
-#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
-#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
-#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
-#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
-#define NV_DEBUG(drm,f,a...) do {                                              \
-	if (unlikely(drm_debug & DRM_UT_DRIVER))                               \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
-} while(0)
-#define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (unlikely(drm_debug & DRM_UT_ATOMIC))                               \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
-} while(0)
+
+__printf(2, 3)
+void nouveau_cli_printk(struct nouveau_cli *cli, const char *fmt, ...);
+
+#define NV_FATAL(drm, fmt, ...)						\
+	nouveau_cli_printk(&(drm)->client, KERN_CRIT fmt, ##__VA_ARGS__)
+#define NV_ERROR(drm, fmt, ...)						\
+	nouveau_cli_printk(&(drm)->client, KERN_ERR fmt, ##__VA_ARGS__)
+#define NV_WARN(drm, fmt, ...)						\
+	nouveau_cli_printk(&(drm)->client, KERN_WARNING fmt, ##__VA_ARGS__)
+#define NV_INFO(drm, fmt, ...)						\
+	nouveau_cli_printk(&(drm)->client, KERN_INFO fmt, ##__VA_ARGS__)
+#define NV_DEBUG(drm, fmt, ...)						\
+do {									\
+	if (unlikely(drm_debug & DRM_UT_DRIVER))			\
+		NV_INFO(drm, fmt, ##__VA_ARGS__);			\
+} while (0)
+#define NV_ATOMIC(drm, fmt, ...)					\
+do {									\
+	if (unlikely(drm_debug & DRM_UT_ATOMIC))			\
+		NV_INFO(drm, fmt, ##__VA_ARGS__);			\
+} while (0)
 
 extern int nouveau_modeset;
 
-- 
2.15.0
