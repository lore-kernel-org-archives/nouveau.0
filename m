From: Christopher James Halse Rogers <christopher.halse.rogers-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] Add xwayland support (v2)
Date: Wed,  4 Jul 2012 18:00:11 +1000
Message-ID: <1341388811-32323-1-git-send-email-christopher.halse.rogers@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <wayland-devel-bounces+gcfw-wayland-devel=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/wayland-devel>,
	<mailto:wayland-devel-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/wayland-devel>
List-Post: <mailto:wayland-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:wayland-devel-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/wayland-devel>,
	<mailto:wayland-devel-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: wayland-devel-bounces+gcfw-wayland-devel=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: wayland-devel-bounces+gcfw-wayland-devel=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Christopher James Halse Rogers <christopher.halse.rogers-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, wayland-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

v2: Fix build against Xservers without Wayland support
    Don't try to acquire/drop drm master under Wayland
    Refresh for xserver 1.13 kill-all-direct-access-to-xf86Screens
    Remove #ifdef soup in favour of xwayland compat header

Signed-off-by: Christopher James Halse Rogers <christopher.halse.rogers-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 configure.ac          |    7 ++
 src/Makefile.am       |    4 ++
 src/nouveau_dri2.c    |   19 ++++++
 src/nv_driver.c       |  179 +++++++++++++++++++++++++++++++++++++++----------
 src/nv_include.h      |    7 ++
 src/nv_type.h         |    5 ++
 src/xwayland_compat.c |   61 +++++++++++++++++
 src/xwayland_compat.h |   52 ++++++++++++++
 8 files changed, 299 insertions(+), 35 deletions(-)
 create mode 100644 src/xwayland_compat.c
 create mode 100644 src/xwayland_compat.h

diff --git a/configure.ac b/configure.ac
index af126fb..a69a104 100644
--- a/configure.ac
+++ b/configure.ac
@@ -110,6 +110,13 @@ AC_SUBST([moduledir])
 DRIVER_NAME=nouveau
 AC_SUBST([DRIVER_NAME])
 
+AC_CHECK_DECL(XORG_WAYLAND,
+	      [have_xwayland=yes],
+	      [have_xwayland=no],
+	      [#include <xorg-server.h>])
+AM_CONDITIONAL([XORG_WAYLAND], test "x$have_xwayland" = "xyes")
+
+
 XORG_MANPAGE_SECTIONS
 XORG_RELEASE_VERSION
 
diff --git a/src/Makefile.am b/src/Makefile.am
index bf9c967..50dc586 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -54,6 +54,10 @@ nouveau_drv_la_SOURCES = \
 			 drmmode_display.c \
 			 vl_hwmc.c
 
+if !XORG_WAYLAND
+nouveau_drv_la_SOURCES += xwayland_compat.c
+endif
+
 EXTRA_DIST = hwdefs/nv_3ddefs.xml.h \
 	     hwdefs/nv_m2mf.xml.h \
 	     hwdefs/nv_object.xml.h \
diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 0b3cc38..c7f769d 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -653,6 +653,21 @@ nouveau_dri2_flip_event_handler(unsigned int frame, unsigned int tv_sec,
 	free(flip);
 }
 
+#ifdef XORG_WAYLAND
+static int nouveau_auth_magic(ScreenPtr pScreen, uint32_t magic)
+{
+	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+	NVPtr pNv = NVPTR(pScrn);
+
+	/* Not wayland, go stragight to drm */
+	if (!xorgWayland)
+		return drmAuthMagic(pNv->dev->fd, magic);
+
+	/* Forward the request to our host */
+	return xwl_drm_authenticate(pNv->xwl_screen, magic);
+}
+#endif
+
 Bool
 nouveau_dri2_init(ScreenPtr pScreen)
 {
@@ -682,6 +697,10 @@ nouveau_dri2_init(ScreenPtr pScreen)
 	dri2.ScheduleWaitMSC = nouveau_dri2_schedule_wait;
 	dri2.GetMSC = nouveau_dri2_get_msc;
 
+#if defined(XORG_WAYLAND)
+	dri2.AuthMagic2 = nouveau_auth_magic;
+#endif
+
 #if DRI2INFOREC_VERSION >= 6
 	dri2.SwapLimitValidate = nouveau_dri2_swap_limit_validate;
 #endif
diff --git a/src/nv_driver.c b/src/nv_driver.c
index beef789..fb29ce5 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -72,6 +72,26 @@ static Bool NVPciProbe (	DriverPtr 		drv,
 				struct pci_device	*dev,
 				intptr_t		match_data	);
 
+
+static Bool nouveau_driver_func(ScrnInfoPtr pScrn,
+				xorgDriverFuncOp op,
+				pointer ptr)
+{
+	xorgHWFlags *flag;
+
+	switch (op) {
+	case GET_REQUIRED_HW_INTERFACES:
+		flag = (CARD32*)ptr;
+		(*flag) = 0;
+		if (xorgWayland)
+			(*flag) = HW_SKIP_CONSOLE;
+		return TRUE;
+	default:
+		/* Unknown or deprecated function */
+		return FALSE;
+	}
+}
+
 /*
  * This contains the functions needed by the server after loading the
  * driver module.  It must be supplied, and gets added the driver list by
@@ -88,7 +108,7 @@ _X_EXPORT DriverRec NV = {
 	NVAvailableOptions,
 	NULL,
 	0,
-	NULL,
+	nouveau_driver_func,
 	nouveau_device_match,
 	NVPciProbe
 };
@@ -214,18 +234,46 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	drmVersion *version;
 	int chipset, ret;
 	char *busid;
+	struct xwl_screen *xwl_screen = NULL;
 
-	if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
-		return FALSE;
-	}
-	busid = DRICreatePCIBusID(pci_dev);
-
-	ret = nouveau_device_open(busid, &dev);
-	if (ret) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] failed to open device\n");
-		free(busid);
-		return FALSE;
+	if (xorgWayland) {
+		xwl_screen = xwl_screen_create ();
+		if (!xwl_screen) {
+			xf86DrvMsg(-1, X_ERROR, "Failed to initialise xwayland.\n");
+			return FALSE;
+		}
+		if (xwl_drm_pre_init(xwl_screen) != Success) {
+			xwl_screen_destroy(xwl_screen);
+			xf86DrvMsg(-1, X_ERROR, "Failed to initialise xwayland drm.\n");
+			return FALSE;
+		}
+		ret = nouveau_device_wrap(xwl_screen_get_drm_fd(xwl_screen), 0, &dev);
+		if (ret) {
+			xwl_screen_destroy(xwl_screen);
+			xf86DrvMsg(-1, X_ERROR, "[drm] Failed to create drm device.\n");
+			return FALSE;
+		}
+	} else {
+	        if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
+		        xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
+		        return FALSE;
+        	}
+        	busid = DRICreatePCIBusID(pci_dev);
+
+        	ret = nouveau_device_open(busid, &dev);
+	        if (ret) {
+        		xf86DrvMsg(-1, X_ERROR, "[drm] failed to open device\n");
+        		free(busid);
+		        return FALSE;
+        	}
+
+        	ret = drmCheckModesettingSupported(busid);
+	        free(busid);
+
+        	if (ret) {
+        		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
+        		return FALSE;
+        	}
 	}
 
 	/* Check the version reported by the kernel module.  In theory we
@@ -242,13 +290,6 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	chipset = dev->chipset;
 	nouveau_device_del(&dev);
 
-	ret = drmCheckModesettingSupported(busid);
-	free(busid);
-	if (ret) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
-		return FALSE;
-	}
-
 	switch (chipset & 0xf0) {
 	case 0x00:
 	case 0x10:
@@ -265,14 +306,17 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	case 0xe0:
 		break;
 	default:
+		xwl_screen_destroy(xwl_screen);
 		xf86DrvMsg(-1, X_ERROR, "Unknown chipset: NV%02x\n", chipset);
 		return FALSE;
 	}
 
 	pScrn = xf86ConfigPciEntity(pScrn, 0, entity_num, NVChipsets,
 				    NULL, NULL, NULL, NULL, NULL);
-	if (!pScrn)
+	if (!pScrn) {
+		xwl_screen_destroy(xwl_screen);
 		return FALSE;
+	}
 
 	pScrn->driverVersion    = NV_VERSION;
 	pScrn->driverName       = NV_DRIVER_NAME;
@@ -287,6 +331,8 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	pScrn->LeaveVT          = NVLeaveVT;
 	pScrn->FreeScreen       = NVFreeScreen;
 
+	pScrn->driverPrivate    = xwl_screen;
+
 	xf86SetEntitySharable(entity_num);
 
 	pEnt = xf86GetEntityInfo(entity_num);
@@ -333,7 +379,11 @@ NVEnterVT(VT_FUNC_ARGS_DECL)
 
 	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "NVEnterVT is called.\n");
 
-	ret = drmSetMaster(pNv->dev->fd);
+	if (pNv->xwl_screen) {
+		ret = 0;
+	} else {
+		ret = drmSetMaster(pNv->dev->fd);
+	}
 	if (ret)
 		ErrorF("Unable to get master: %s\n", strerror(errno));
 
@@ -361,7 +411,11 @@ NVLeaveVT(VT_FUNC_ARGS_DECL)
 
 	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "NVLeaveVT is called.\n");
 
-	ret = drmDropMaster(pNv->dev->fd);
+	if (pNv->xwl_screen) {
+		ret = 0;
+	} else {
+		ret = drmDropMaster(pNv->dev->fd);
+	}
 	if (ret)
 		ErrorF("Error dropping master: %d\n", ret);
 }
@@ -374,6 +428,9 @@ NVFlushCallback(CallbackListPtr *list, pointer user_data, pointer call_data)
 
 	if (pScrn->vtSema && !pNv->NoAccel)
 		nouveau_pushbuf_kick(pNv->pushbuf, pNv->pushbuf->channel);
+	if (pNv->xwl_screen)
+		xwl_screen_post_damage(pNv->xwl_screen);
+
 }
 
 static void 
@@ -392,6 +449,9 @@ NVBlockHandler (BLOCKHANDLER_ARGS_DECL)
 
 	if (pNv->VideoTimerCallback) 
 		(*pNv->VideoTimerCallback)(pScrn, currentTime.milliseconds);
+
+	if (pNv->xwl_screen)
+		xwl_screen_post_damage(pNv->xwl_screen);
 }
 
 static Bool
@@ -406,6 +466,9 @@ NVCreateScreenResources(ScreenPtr pScreen)
 		return FALSE;
 	pScreen->CreateScreenResources = NVCreateScreenResources;
 
+	if (pNv->xwl_screen)
+		xwl_screen_init(pNv->xwl_screen, pScreen);
+
 	drmmode_fbcon_copy(pScreen);
 	if (!NVEnterVT(VT_FUNC_ARGS(0)))
 		return FALSE;
@@ -418,6 +481,25 @@ NVCreateScreenResources(ScreenPtr pScreen)
 	return TRUE;
 }
 
+static int nouveau_create_window_buffer(struct xwl_window *xwl_window,
+					PixmapPtr pixmap)
+{
+	uint32_t name;
+	struct nouveau_bo *bo;
+
+	bo = nouveau_pixmap_bo(pixmap);
+	if (bo == NULL || nouveau_bo_name_get(bo, &name) != 0)
+		return BadDrawable;
+
+	return xwl_create_window_buffer_drm(xwl_window, pixmap, name);
+}
+
+static struct xwl_driver xwl_driver = {
+	.version = 1,
+	.use_drm = 1,
+	.create_window_buffer = nouveau_create_window_buffer
+};
+
 /*
  * This is called at the end of each server generation.  It restores the
  * original (text) mode.  It should also unmap the video memory, and free
@@ -432,6 +514,9 @@ NVCloseScreen(CLOSE_SCREEN_ARGS_DECL)
 	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
 	NVPtr pNv = NVPTR(pScrn);
 
+	if (pNv->xwl_screen)
+		xwl_screen_close(pNv->xwl_screen);
+
 	drmmode_screen_fini(pScreen);
 
 	if (!pNv->NoAccel)
@@ -499,6 +584,9 @@ NVFreeScreen(FREE_SCREEN_ARGS_DECL)
 	if (!pNv)
 		return;
 
+	if (pNv->xwl_screen)
+		xwl_screen_destroy(pNv->xwl_screen);
+
 	NVCloseDRM(pScrn);
 
 	free(pScrn->driverPrivate);
@@ -560,22 +648,29 @@ NVPreInitDRM(ScrnInfoPtr pScrn)
 	NVPtr pNv = NVPTR(pScrn);
 	char *bus_id;
 	int ret;
+	int drm_fd;
 
 	if (!NVDRIGetVersion(pScrn))
 		return FALSE;
 
-	/* Load the kernel module, and open the DRM */
-	bus_id = DRICreatePCIBusID(pNv->PciInfo);
-	ret = DRIOpenDRMMaster(pScrn, SAREA_MAX, bus_id, "nouveau");
-	free(bus_id);
-	if (!ret) {
-		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
-			   "[drm] error opening the drm\n");
-		return FALSE;
+	if (pNv->xwl_screen)
+		drm_fd = xwl_screen_get_drm_fd(pNv->xwl_screen);
+	else {
+		/* Load the kernel module, and open the DRM */
+		bus_id = DRICreatePCIBusID(pNv->PciInfo);
+		ret = DRIOpenDRMMaster(pScrn, SAREA_MAX, bus_id, "nouveau");
+		free(bus_id);
+		if (!ret) {
+			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+				   "[drm] error opening the drm\n");
+			return FALSE;
+		}
+
+		drm_fd = DRIMasterFD(pScrn);
 	}
 
 	/* Initialise libdrm_nouveau */
-	ret = nouveau_device_wrap(DRIMasterFD(pScrn), 1, &pNv->dev);
+	ret = nouveau_device_wrap(drm_fd, 1, &pNv->dev);
 	if (ret) {
 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
 			   "[drm] error creating device\n");
@@ -586,7 +681,7 @@ NVPreInitDRM(ScrnInfoPtr pScrn)
 	if (ret)
 		return FALSE;
 
-	pNv->drm_device_name = drmGetDeviceNameFromFd(DRIMasterFD(pScrn));
+	pNv->drm_device_name = drmGetDeviceNameFromFd(drm_fd);
 
 	return TRUE;
 }
@@ -602,6 +697,7 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	uint64_t v;
 	int ret;
 	int defaultDepth = 0;
+	struct xwl_screen *xwl_screen = pScrn->driverPrivate;
 
 	if (flags & PROBE_DETECT) {
 		EntityInfoPtr pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
@@ -636,6 +732,8 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 		return FALSE;
 	pNv = NVPTR(pScrn);
 
+	pNv->xwl_screen = xwl_screen;
+
 	/* Get the entity, and make sure it is PCI. */
 	pNv->pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
 	if (pNv->pEnt->location.type != BUS_PCI)
@@ -772,6 +870,12 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	memcpy(pNv->Options, NVOptions, sizeof(NVOptions));
 	xf86ProcessOptions(pScrn->scrnIndex, pScrn->options, pNv->Options);
 
+	if (xwl_screen) {
+		if (!xwl_screen_pre_init(pScrn, xwl_screen, 0, &xwl_driver)) {
+			NVPreInitFail("Failed to initialise xwayland\n");
+		}
+	}
+
 	from = X_DEFAULT;
 
 	pNv->HWCursor = TRUE;
@@ -813,7 +917,7 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	pNv->ce_enabled =
 		xf86ReturnOptValBool(pNv->Options, OPTION_ASYNC_COPY, FALSE);
 
-	if (!pNv->NoAccel && pNv->dev->chipset >= 0x11) {
+	if (!pNv->NoAccel && pNv->dev->chipset >= 0x11 && !xwl_screen) {
 		from = X_DEFAULT;
 		if (xf86GetOptValBool(pNv->Options, OPTION_GLX_VBLANK,
 				      &pNv->glx_vblank))
@@ -882,7 +986,11 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	xf86DrvMsg(pScrn->scrnIndex, from, "Swap limit set to %d [Max allowed %d]%s\n",
 		   pNv->swap_limit, pNv->max_swap_limit, reason);
 
-	ret = drmmode_pre_init(pScrn, pNv->dev->fd, pScrn->bitsPerPixel >> 3);
+	if (xwl_screen)
+		ret = TRUE;
+	else
+		ret = drmmode_pre_init(pScrn, pNv->dev->fd, pScrn->bitsPerPixel >> 3);
+
 	if (ret == FALSE)
 		NVPreInitFail("Kernel modesetting failed to initialize\n");
 
@@ -1241,7 +1349,8 @@ NVScreenInit(SCREEN_INIT_ARGS_DECL)
 	if (serverGeneration == 1)
 		xf86ShowUnusedOptions(pScrn->scrnIndex, pScrn->options);
 
-	drmmode_screen_init(pScreen);
+	if (!pNv->xwl_screen)
+		drmmode_screen_init(pScreen);
 	return TRUE;
 }
 
diff --git a/src/nv_include.h b/src/nv_include.h
index 8d628c0..d28ec89 100644
--- a/src/nv_include.h
+++ b/src/nv_include.h
@@ -65,6 +65,13 @@
 
 #include "compat-api.h"
 
+#ifdef XORG_WAYLAND
+#include <xwayland.h>
+#include <xf86Priv.h>
+#else
+#include "xwayland_compat.h"
+#endif
+
 #include "nouveau_local.h"
 
 #include "nv_type.h"
diff --git a/src/nv_type.h b/src/nv_type.h
index e1ea494..0e8690f 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -15,6 +15,9 @@
 #else
 #error "This driver requires a DRI-enabled X server"
 #endif
+#ifdef XORG_WAYLAND
+#include <xwayland.h>
+#endif
 
 #define NV_ARCH_03  0x03
 #define NV_ARCH_04  0x04
@@ -72,6 +75,8 @@ typedef struct _NVRec {
 
 	void *drmmode; /* for KMS */
 
+	struct xwl_screen *xwl_screen;
+
 	/* DRM interface */
 	struct nouveau_device *dev;
 	char *drm_device_name;
diff --git a/src/xwayland_compat.c b/src/xwayland_compat.c
new file mode 100644
index 0000000..bcc7685
--- /dev/null
+++ b/src/xwayland_compat.c
@@ -0,0 +1,61 @@
+#include "xwayland_compat.h"
+
+int xorgWayland = 0;
+
+int
+xwl_drm_authenticate(struct xwl_screen *xwl_screen, uint32_t magic)
+{
+	return 0;
+}
+
+struct xwl_screen *
+xwl_screen_create (void)
+{
+	return NULL;
+}
+
+int
+xwl_drm_pre_init(struct xwl_screen *xwl_screen)
+{
+	return 0;
+}
+
+int
+xwl_screen_get_drm_fd(struct xwl_screen *xwl_screen)
+{
+	return -1;
+}
+
+void
+xwl_screen_destroy(struct xwl_screen *xwl_screen)
+{
+}
+
+void
+xwl_screen_post_damage(struct xwl_screen *xwl_screen)
+{
+}
+
+int
+xwl_screen_init(struct xwl_screen *xwl_screen, ScreenPtr pScreen)
+{
+	return 0;
+}
+
+void
+xwl_screen_close(struct xwl_screen *xwl_screen)
+{
+}
+
+int
+xwl_screen_pre_init(ScrnInfoPtr pScrn, struct xwl_screen *xwl_screen, int flags, struct xwl_driver *driver)
+{
+	return 0;
+}
+
+int
+xwl_create_window_buffer_drm(struct xwl_window *xwl_window, PixmapPtr pixmap, int name)
+{
+	return 0;
+}
+
diff --git a/src/xwayland_compat.h b/src/xwayland_compat.h
new file mode 100644
index 0000000..4cc1dc9
--- /dev/null
+++ b/src/xwayland_compat.h
@@ -0,0 +1,52 @@
+#ifndef XWAYLAND_COMPAT_H
+#define XWAYLAND_COMPAT_H
+
+#ifndef XORG_WAYLAND
+
+#include "xorg-server.h"
+#include "nv_include.h"
+
+extern int xorgWayland;
+
+
+struct xwl_screen;
+struct xwl_window;
+
+struct xwl_driver {
+	int version;
+	int use_drm;
+	int (*create_window_buffer) (struct xwl_window *window, PixmapPtr pix);
+};
+
+int
+xwl_drm_authenticate(struct xwl_screen *xwl_screen, uint32_t magic);
+
+struct xwl_screen *
+xwl_screen_create (void);
+
+int
+xwl_drm_pre_init(struct xwl_screen *xwl_screen);
+
+int
+xwl_screen_get_drm_fd(struct xwl_screen *xwl_screen);
+
+void
+xwl_screen_destroy(struct xwl_screen *xwl_screen);
+
+void
+xwl_screen_post_damage(struct xwl_screen *xwl_screen);
+
+int
+xwl_screen_init(struct xwl_screen *xwl_screen, ScreenPtr pScreen);
+
+void
+xwl_screen_close(struct xwl_screen *xwl_screen);
+
+int
+xwl_screen_pre_init(ScrnInfoPtr pScrn, struct xwl_screen *xwl_screen, int flags, struct xwl_driver *driver);
+
+int
+xwl_create_window_buffer_drm(struct xwl_window *xwl_window, PixmapPtr pixmap, int name);
+
+#endif /* !XORG_WAYLAND */
+#endif /* XWAYLAND_COMPAT_H */
-- 
1.7.10.4
