From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] nouveau: add libbacklight and randr property
	support.
Date: Thu,  6 Jun 2013 11:35:01 +1000
Message-ID: <1370482501-14023-2-git-send-email-airlied@gmail.com>
References: <1370482501-14023-1-git-send-email-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1370482501-14023-1-git-send-email-airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

This adds support to detect libbacklight and use it to provide the standard
randr backlight properties, for desktops environments to use.

untested as of yet.

Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 configure.ac          |  3 +++
 src/Makefile.am       |  4 ++--
 src/drmmode_display.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 137de9c..d3e8692 100644
--- a/configure.ac
+++ b/configure.ac
@@ -81,6 +81,9 @@ sdkdir=$(pkg-config --variable=sdkdir xorg-server)
 # Checks for libraries.
 PKG_CHECK_MODULES([PCIACCESS], [pciaccess >= 0.10])
 
+PKG_CHECK_MODULES(LIBBACKLIGHT, [libbacklight], LIBBACKLIGHT="yes"; AC_DEFINE(HAVE_LIBBACKLIGHT, 1, [libbacklight available]), [LIBBACKLIGHT=no])
+AM_CONDITIONAL(LIBBACKLIGHT, [ test "$LIBBACKLIGHT" = "yes" ])
+
 PKG_CHECK_MODULES(LIBUDEV, [libudev], [LIBUDEV=yes], [LIBUDEV=no])
 if test "x$LIBUDEV" = xyes; then
 	AC_DEFINE(HAVE_LIBUDEV, 1, [libudev support])
diff --git a/src/Makefile.am b/src/Makefile.am
index 17c6389..826a3f6 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -23,10 +23,10 @@
 # -avoid-version prevents gratuitous .0.0.0 version numbers on the end
 # _ladir passes a dummy rpath to libtool so the thing will actually link
 # TODO: -nostdlib/-Bstatic/-lgcc platform magic, not installing the .a, etc.
-AM_CFLAGS = @XORG_CFLAGS@ @LIBUDEV_CFLAGS@ @LIBDRM_NOUVEAU_CFLAGS@
+AM_CFLAGS = @XORG_CFLAGS@ @LIBUDEV_CFLAGS@ @LIBDRM_NOUVEAU_CFLAGS@ @LIBBACKLIGHT_CFLAGS@
 nouveau_drv_la_LTLIBRARIES = nouveau_drv.la
 nouveau_drv_la_LDFLAGS = -module -avoid-version @LIBDRM_NOUVEAU_LIBS@ \
-			 @LIBUDEV_LIBS@
+			 @LIBUDEV_LIBS@ @LIBBACKLIGHT_LIBS@
 nouveau_drv_ladir = @moduledir@/drivers
 
 nouveau_drv_la_SOURCES = \
diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index ad7bc1f..927dbcf 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -42,6 +42,10 @@
 #include "libudev.h"
 #endif
 
+#ifdef HAVE_LIBBACKLIGHT
+#include "libbacklight.h"
+#endif
+
 static Bool drmmode_xf86crtc_resize(ScrnInfoPtr scrn, int width, int height);
 typedef struct {
     int fd;
@@ -82,6 +86,11 @@ typedef struct {
     drmModePropertyBlobPtr edid_blob;
     int num_props;
     drmmode_prop_ptr props;
+#ifdef HAVE_LIBBACKLIGHT
+    struct backlight *backlight;
+    int backlight_active_level;
+    int backlight_max;
+#endif
 } drmmode_output_private_rec, *drmmode_output_private_ptr;
 
 typedef struct {
@@ -99,6 +108,13 @@ typedef struct {
     Bool dispatch_me;
 } drmmode_flipevtcarrier_rec, *drmmode_flipevtcarrier_ptr;
 
+#ifdef HAVE_LIBBACKLIGHT
+#define BACKLIGHT_NAME             "Backlight"
+#define BACKLIGHT_DEPRECATED_NAME  "BACKLIGHT"
+
+static Atom backlight_atom, backlight_deprecated_atom;
+#endif
+
 static void drmmode_output_dpms(xf86OutputPtr output, int mode);
 
 static drmmode_ptr
@@ -717,6 +733,9 @@ drmmode_output_destroy(xf86OutputPtr output)
 		drmModeFreeProperty(drmmode_output->props[i].mode_prop);
 		free(drmmode_output->props[i].atoms);
 	}
+#ifdef HAVE_LIBBACKLIGHT
+	backlight_destroy(drmmode_output->backlight);
+#endif
 	drmModeFreeConnector(drmmode_output->mode_output);
 	free(drmmode_output);
 	output->driver_private = NULL;
@@ -868,6 +887,27 @@ drmmode_output_create_resources(xf86OutputPtr output)
 			}
 		}
 	}
+
+#ifdef HAVE_LIBBACKLIGHT
+    {
+	NVPtr pNv = NVPTR(output->scrn);
+	struct pci_device *dev = pNv->PciInfo;
+
+	drmmode_output->backlight = backlight_init(dev, 0, mode_output->connector_type,
+					mode_output->connector_type_id);
+
+	if (drmmode_output->backlight) {
+	    drmmode_output->backlight_max = backlight_get_max_brightness(drmmode_output->backlight);
+	    drmmode_output->backlight_active_level = backlight_get_brightness(drmmode_output->backlight);
+	    nouveau_create_ranged_atom(output, &backlight_atom,
+				      BACKLIGHT_NAME, 0, drmmode_output->backlight_max,
+				      drmmode_output->backlight_active_level, FALSE);
+	    nouveau_create_ranged_atom(output, &backlight_deprecated_atom,
+				      BACKLIGHT_DEPRECATED_NAME, 0, drmmode_output->backlight_max,
+				      drmmode_output->backlight_active_level, FALSE);
+	}
+    }
+#endif
 }
 
 static Bool
-- 
1.8.2.1
