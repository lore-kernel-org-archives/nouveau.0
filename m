From: Matt Parnell <parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: Add DRM_NOUVEAU_DEBUG option
Date: Thu,  8 Oct 2009 16:26:51 -0500
Message-ID: <1255037211-5992-1-git-send-email-parwok@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Sometimes we have DEBUG_FS enabled, but don't want output from certain modules.
Most modules make this an option, so I figured that Nouveau needed it too.

Signed-off-by: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/Kconfig                   |   11 +++++++++++
 drivers/gpu/drm/nouveau/Makefile          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c |    2 --
 drivers/gpu/drm/nouveau/nouveau_drv.c     |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    2 +-
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7fe8a4c..62dd13c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -176,6 +176,9 @@ config DRM_NOUVEAU_KMS
 	and you have a new enough userspace to support this. Running old
 	userspaces with this enabled will cause pain.
 
+	NOTICE: if you plan on using the text based console outside of X, enable
+	FRAMEBUFFER_CONSOLE or else the console will be unusable.
+
 config DRM_NOUVEAU_BACKLIGHT
 	bool "Support for backlight control"
 	depends on DRM_NOUVEAU
@@ -184,6 +187,14 @@ config DRM_NOUVEAU_BACKLIGHT
 	  Say Y here if you want to control the backlight of your display
 	  (e.g. a laptop panel).
 
+config DRM_NOUVEAU_DEBUG
+	bool "Build in Nouveau's debugfs support"
+	depends on DRM_NOUVEAU && DEBUG_FS
+	default y
+	help
+	  Say Y here if you want Nouveau to output debugging information
+	  via debugfs.
+
 menu "I2C encoder or helper chips"
      depends on DRM
 
diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index ab46e3a..e12b4ff 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -9,7 +9,6 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
              nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
 	     nouveau_display.o nouveau_connector.o nouveau_fbcon.o \
-	     nouveau_debugfs.o \
              nv04_timer.o \
              nv04_mc.o nv40_mc.o nv50_mc.o \
              nv04_fb.o nv10_fb.o nv40_fb.o \
@@ -22,6 +21,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nv04_dac.o nv04_dfp.o nv04_tv.o nv17_tv.o nv17_tv_modes.o \
              nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o
 
+nouveau-$(CONFIG_DRM_NOUVEAU_DEBUG) += nouveau_debugfs.o
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
 nouveau-$(CONFIG_ACPI) += nouveau_acpi.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 1ac871b..6ccafd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -33,7 +33,6 @@
 #include "drmP.h"
 #include "nouveau_drv.h"
 
-#if defined(CONFIG_DEBUG_FS)
 static int
 nouveau_debugfs_channel_info(struct seq_file *m, void *data)
 {
@@ -154,4 +153,3 @@ nouveau_debugfs_takedown(struct drm_minor *minor)
 	drm_debugfs_remove_files(nouveau_debugfs_list, NOUVEAU_DEBUGFS_ENTRIES,
 				 minor);
 }
-#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 327f01a..5e9d38a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -325,7 +325,7 @@ static struct drm_driver driver = {
 	.lastclose = nouveau_lastclose,
 	.unload = nouveau_unload,
 	.preclose = nouveau_preclose,
-#if defined(CONFIG_DEBUG_FS)
+#if defined(CONFIG_DRM_NOUVEAU_DEBUG)
 	.debugfs_init = nouveau_debugfs_init,
 	.debugfs_cleanup = nouveau_debugfs_takedown,
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2ecfb25..46436ce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -765,7 +765,7 @@ extern int nouveau_sgdma_get_page(struct drm_device *, uint32_t offset,
 extern struct ttm_backend *nouveau_sgdma_init_ttm(struct drm_device *);
 
 /* nouveau_debugfs.c */
-#if defined(CONFIG_DEBUG_FS)
+#if defined(CONFIG_DRM_NOUVEAU_DEBUG)
 extern int  nouveau_debugfs_init(struct drm_minor *);
 extern void nouveau_debugfs_takedown(struct drm_minor *);
 extern int  nouveau_debugfs_channel_init(struct nouveau_channel *);
-- 
1.6.4.4
