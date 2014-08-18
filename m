From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm: Display Nouveau boot options at launch
Date: Mon, 18 Aug 2014 22:43:24 +0200
Message-ID: <1408394604-7611-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

It can help to remove any ambiguity about which options were passed to Nouveau,
especially in case the user had some options set in /etc/modprobe.d/*.conf that
he forgot about, as they won't appear in a dmesg.

Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
---
 drm/nouveau_chan.c      |  2 +-
 drm/nouveau_chan.h      |  2 ++
 drm/nouveau_connector.c |  6 +++---
 drm/nouveau_connector.h |  4 ++++
 drm/nouveau_drm.c       | 20 ++++++++++++++++++++
 drm/nouveau_fbcon.c     |  2 +-
 drm/nouveau_fbcon.h     |  3 +++
 drm/nouveau_sysfs.c     |  2 +-
 drm/nouveau_sysfs.h     |  2 ++
 9 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drm/nouveau_chan.c b/drm/nouveau_chan.c
index 99cd9e4..9a362dd 100644
--- a/drm/nouveau_chan.c
+++ b/drm/nouveau_chan.c
@@ -36,7 +36,7 @@
 #include "nouveau_abi16.h"
 
 MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
-static int nouveau_vram_pushbuf;
+int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 
 int
diff --git a/drm/nouveau_chan.h b/drm/nouveau_chan.h
index 2016370..8309c24 100644
--- a/drm/nouveau_chan.h
+++ b/drm/nouveau_chan.h
@@ -47,4 +47,6 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *,
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
 
+extern int nouveau_vram_pushbuf;
+
 #endif
diff --git a/drm/nouveau_connector.c b/drm/nouveau_connector.c
index 1ec44c8..c8ac948 100644
--- a/drm/nouveau_connector.c
+++ b/drm/nouveau_connector.c
@@ -45,15 +45,15 @@
 #include <nvif/event.h>
 
 MODULE_PARM_DESC(tv_disable, "Disable TV-out detection");
-static int nouveau_tv_disable = 0;
+int nouveau_tv_disable = 0;
 module_param_named(tv_disable, nouveau_tv_disable, int, 0400);
 
 MODULE_PARM_DESC(ignorelid, "Ignore ACPI lid status");
-static int nouveau_ignorelid = 0;
+int nouveau_ignorelid = 0;
 module_param_named(ignorelid, nouveau_ignorelid, int, 0400);
 
 MODULE_PARM_DESC(duallink, "Allow dual-link TMDS (default: enabled)");
-static int nouveau_duallink = 1;
+int nouveau_duallink = 1;
 module_param_named(duallink, nouveau_duallink, int, 0400);
 
 struct nouveau_encoder *
diff --git a/drm/nouveau_connector.h b/drm/nouveau_connector.h
index 68029d0..629a380 100644
--- a/drm/nouveau_connector.h
+++ b/drm/nouveau_connector.h
@@ -105,4 +105,8 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 struct drm_connector *
 nouveau_connector_create(struct drm_device *, int index);
 
+extern int nouveau_tv_disable;
+extern int nouveau_ignorelid;
+extern int nouveau_duallink;
+
 #endif /* __NOUVEAU_CONNECTOR_H__ */
diff --git a/drm/nouveau_drm.c b/drm/nouveau_drm.c
index 606cc6b..aaccb25 100644
--- a/drm/nouveau_drm.c
+++ b/drm/nouveau_drm.c
@@ -51,6 +51,7 @@
 #include "nouveau_fence.h"
 #include "nouveau_debugfs.h"
 #include "nouveau_usif.h"
+#include "nouveau_connector.h"
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
@@ -1025,6 +1026,23 @@ static int nouveau_pmops_runtime_idle(struct device *dev)
 	return 1;
 }
 
+static void nouveau_display_options(void)
+{
+	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n");
+
+	DRM_DEBUG_DRIVER("... tv_disable   : %d\n", nouveau_tv_disable);
+	DRM_DEBUG_DRIVER("... ignorelid    : %d\n", nouveau_ignorelid);
+	DRM_DEBUG_DRIVER("... duallink     : %d\n", nouveau_duallink);
+	DRM_DEBUG_DRIVER("... nofbaccel    : %d\n", nouveau_nofbaccel);
+	DRM_DEBUG_DRIVER("... config       : %s\n", nouveau_config);
+	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
+	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
+	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
+	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
+	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
+	DRM_DEBUG_DRIVER("... pstate       : %d\n", nouveau_pstate);
+}
+
 static const struct dev_pm_ops nouveau_pm_ops = {
 	.suspend = nouveau_pmops_suspend,
 	.resume = nouveau_pmops_resume,
@@ -1085,6 +1103,8 @@ EXPORT_SYMBOL(nouveau_platform_device_create_);
 static int __init
 nouveau_drm_init(void)
 {
+	nouveau_display_options();
+
 	if (nouveau_modeset == -1) {
 #ifdef CONFIG_VGA_CONSOLE
 		if (vgacon_text_force())
diff --git a/drm/nouveau_fbcon.c b/drm/nouveau_fbcon.c
index 8bdd270..f0ae10c 100644
--- a/drm/nouveau_fbcon.c
+++ b/drm/nouveau_fbcon.c
@@ -52,7 +52,7 @@
 #include "nouveau_crtc.h"
 
 MODULE_PARM_DESC(nofbaccel, "Disable fbcon acceleration");
-static int nouveau_nofbaccel = 0;
+int nouveau_nofbaccel = 0;
 module_param_named(nofbaccel, nouveau_nofbaccel, int, 0400);
 
 static void
diff --git a/drm/nouveau_fbcon.h b/drm/nouveau_fbcon.h
index 34658cf..1e2e9e2 100644
--- a/drm/nouveau_fbcon.h
+++ b/drm/nouveau_fbcon.h
@@ -72,5 +72,8 @@ void nouveau_fbcon_accel_save_disable(struct drm_device *dev);
 void nouveau_fbcon_accel_restore(struct drm_device *dev);
 
 void nouveau_fbcon_output_poll_changed(struct drm_device *dev);
+
+extern int nouveau_nofbaccel;
+
 #endif /* __NV50_FBCON_H__ */
 
diff --git a/drm/nouveau_sysfs.c b/drm/nouveau_sysfs.c
index 3c6962d..8fbbf30 100644
--- a/drm/nouveau_sysfs.c
+++ b/drm/nouveau_sysfs.c
@@ -29,7 +29,7 @@
 #include "nouveau_sysfs.h"
 
 MODULE_PARM_DESC(pstate, "enable sysfs pstate file, which will be moved in the future");
-static int nouveau_pstate;
+int nouveau_pstate;
 module_param_named(pstate, nouveau_pstate, int, 0400);
 
 static inline struct drm_device *
diff --git a/drm/nouveau_sysfs.h b/drm/nouveau_sysfs.h
index f973378..4e5ea92 100644
--- a/drm/nouveau_sysfs.h
+++ b/drm/nouveau_sysfs.h
@@ -16,4 +16,6 @@ nouveau_sysfs(struct drm_device *dev)
 int  nouveau_sysfs_init(struct drm_device *);
 void nouveau_sysfs_fini(struct drm_device *);
 
+extern int nouveau_pstate;
+
 #endif
-- 
2.0.4
