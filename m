From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix acpi related kbuild warnings
Date: Wed, 2 Nov 2011 22:39:40 +0100
Message-ID: <20111102213940.GA5459@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Currently when X86 && ACPI && !X86_PLATFORM_DEVICES kbuild spits:

warning: (DRM_NOUVEAU) selects ACPI_WMI which has unmet direct
dependencies (X86 && X86_PLATFORM_DEVICES && ACPI)
warning: (DRM_NOUVEAU) selects MXM_WMI which has unmet direct
dependencies (X86 && X86_PLATFORM_DEVICES && ACPI_WMI)

and goes on, which leaves a situation where ACPI_WMI (which depends on
X86_PLATFORM_DEVICES) is enabled but X86_PLATFORM_DEVICES is not.
Additionally, Nouveau on IA64 would enable these X86-related drivers
when ACPI is enabled (doesn't matter but is wrong) and build
nouveau_acpi.c which depends on them.

To fix this, introduce hidden DRM_NOUVEAU_ACPI variable which selects
all acpi/x86 related configs and select it when both X86 and ACPI are
enabled.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Kconfig       |    9 +++++++--
 drivers/gpu/drm/nouveau/Makefile      |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h |    2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index ca16399..0e6c40f 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -11,11 +11,16 @@ config DRM_NOUVEAU
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FB_BACKLIGHT if DRM_NOUVEAU_BACKLIGHT
 	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL && INPUT
-	select ACPI_WMI if ACPI
-	select MXM_WMI if ACPI
+	select DRM_NOUVEAU_ACPI if ACPI && X86
 	help
 	  Choose this option for open-source nVidia support.
 
+config DRM_NOUVEAU_ACPI
+	bool
+	select X86_PLATFORM_DEVICES
+	select ACPI_WMI
+	select MXM_WMI
+
 config DRM_NOUVEAU_BACKLIGHT
 	bool "Support for backlight control"
 	depends on DRM_NOUVEAU
diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index cdd9c3d..200d458 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -41,6 +41,6 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
 nouveau-$(CONFIG_DRM_NOUVEAU_DEBUG) += nouveau_debugfs.o
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
-nouveau-$(CONFIG_ACPI) += nouveau_acpi.o
+nouveau-$(CONFIG_DRM_NOUVEAU_ACPI) += nouveau_acpi.o
 
 obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b793697..1fb7894 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1070,7 +1070,7 @@ extern int  nouveau_dma_wait(struct nouveau_channel *, int slots, int size);
 
 /* nouveau_acpi.c */
 #define ROM_BIOS_PAGE 4096
-#if defined(CONFIG_ACPI)
+#if defined(CONFIG_DRM_NOUVEAU_ACPI)
 void nouveau_register_dsm_handler(void);
 void nouveau_unregister_dsm_handler(void);
 int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len);
-- 
1.7.7
