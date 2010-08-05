From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: [PATCH] drmmode: Add backlight support
Date: Thu,  5 Aug 2010 15:46:41 +1000
Message-ID: <1280987201-17568-1-git-send-email-daniel@fooishbar.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Straight port of Matthias Hopf's KMS backlight code for
xf86-video-intel, with reformatting and a couple of minor cleanups.
Works fine on my MacBookAir2,1.

Signed-off-by: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
---
 src/drmmode_display.c |  269 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 268 insertions(+), 1 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 9b5d52d..7c3c250 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -35,13 +35,30 @@
 
 #include "nv_include.h"
 #include "xf86drmMode.h"
-#include "X11/Xatom.h"
+#include <X11/Xatom.h>
 
+#include <fcntl.h>
 #include <sys/ioctl.h>
 #ifdef HAVE_LIBUDEV
 #include "libudev.h"
 #endif
 
+
+#define BACKLIGHT_NAME             "Backlight"
+#define BACKLIGHT_DEPRECATED_NAME  "BACKLIGHT"
+#define BACKLIGHT_CLASS "/sys/class/backlight"
+
+/* List of available kernel interfaces in priority order */
+static char *backlight_interfaces[] = {
+	"nv_backlight",
+        NULL,
+};
+/* Must be long enough for BACKLIGHT_CLASS + '/' + longest in above table +
+ * '/' + "max_backlight" */
+#define BACKLIGHT_PATH_LEN 48
+/* Enough for 10 digits of backlight + '\n' + '\0' */
+#define BACKLIGHT_VALUE_LEN 12
+
 typedef struct {
     int fd;
     uint32_t fb_id;
@@ -51,6 +68,7 @@ typedef struct {
     struct udev_monitor *uevent_monitor;
     InputHandlerProc uevent_handler;
 #endif
+    Atom backlight_atom, backlight_deprecated_atom;
 } drmmode_rec, *drmmode_ptr;
 
 typedef struct {
@@ -81,6 +99,10 @@ typedef struct {
     drmModePropertyBlobPtr edid_blob;
     int num_props;
     drmmode_prop_ptr props;
+    char *backlight_iface;
+    int32_t backlight_active_level;
+    int32_t backlight_max;
+    int dpms_mode;
 } drmmode_output_private_rec, *drmmode_output_private_ptr;
 
 static void drmmode_output_dpms(xf86OutputPtr output, int mode);
@@ -160,6 +182,155 @@ drmmode_ConvertToKMode(ScrnInfoPtr scrn, drmModeModeInfo *kmode,
 }
 
 static void
+drmmode_backlight_set(xf86OutputPtr output, int level)
+{
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	char path[BACKLIGHT_PATH_LEN], val[BACKLIGHT_VALUE_LEN];
+	int fd, len, ret;
+
+	if (level > drmmode_output->backlight_max)
+		level = drmmode_output->backlight_max;
+	if (!drmmode_output->backlight_iface || level < 0)
+		return;
+
+	len = snprintf(val, BACKLIGHT_VALUE_LEN, "%d\n", level);
+	sprintf(path, "%s/%s/brightness",
+	        BACKLIGHT_CLASS, drmmode_output->backlight_iface);
+	fd = open(path, O_RDWR);
+	if (fd == -1) {
+		xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+                           "failed to open %s for backlight control: %s\n",
+                           path, strerror(errno));
+		return;
+	}
+
+	ret = write(fd, val, len);
+	if (ret == -1) {
+		xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+                           "write to %s for backlight control failed: %s\n",
+                           path, strerror(errno));
+	}
+
+	close(fd);
+}
+
+static int
+drmmode_backlight_get(xf86OutputPtr output)
+{
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	char path[BACKLIGHT_PATH_LEN], val[BACKLIGHT_VALUE_LEN];
+	int fd, level;
+
+	if (!drmmode_output->backlight_iface)
+		return -1;
+
+	sprintf(path, "%s/%s/actual_brightness",
+	    BACKLIGHT_CLASS, drmmode_output->backlight_iface);
+	fd = open(path, O_RDONLY);
+	if (fd == -1) {
+		xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+                   "failed to open %s for backlight control: %s\n",
+                   path, strerror(errno));
+		return -1;
+	}
+
+	memset(val, 0, sizeof(val));
+	if (read(fd, val, BACKLIGHT_VALUE_LEN) == -1) {
+		close(fd);
+		return -1;
+	}
+
+	close(fd);
+
+	level = atoi(val);
+	if (level > drmmode_output->backlight_max)
+		level = drmmode_output->backlight_max;
+	if (level < 0)
+		level = -1;
+
+	return level;
+}
+
+static int
+drmmode_backlight_get_max(xf86OutputPtr output)
+{
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	char path[BACKLIGHT_PATH_LEN], val[BACKLIGHT_VALUE_LEN];
+	int fd, max = 0;
+
+	sprintf(path, "%s/%s/max_brightness",
+	        BACKLIGHT_CLASS, drmmode_output->backlight_iface);
+	fd = open(path, O_RDONLY);
+	if (fd == -1) {
+		xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+                           "failed to open %s for backlight control: %s\n",
+                           path, strerror(errno));
+		return 0;
+	}
+
+	memset(val, 0, sizeof(val));
+	if (read(fd, val, BACKLIGHT_VALUE_LEN) == -1) {
+		close(fd);
+		return -1;
+	}
+
+	close(fd);
+
+	max = atoi(val);
+	if (max <= 0)
+		max = -1;
+
+	return max;
+}
+
+static void
+drmmode_backlight_init(xf86OutputPtr output)
+{
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	char path[BACKLIGHT_PATH_LEN];
+	struct stat buf;
+	int i;
+
+	for (i = 0; backlight_interfaces[i] != NULL; i++) {
+		sprintf(path, "%s/%s", BACKLIGHT_CLASS,
+		        backlight_interfaces[i]);
+		if (stat(path, &buf))
+			continue;
+
+		drmmode_output->backlight_iface = backlight_interfaces[i];
+		xf86DrvMsg(output->scrn->scrnIndex, X_INFO,
+		       "found backlight control interface %s\n", path);
+		drmmode_output->backlight_max = drmmode_backlight_get_max(output);
+		drmmode_output->backlight_active_level = drmmode_backlight_get(output);
+		return;
+    }
+    drmmode_output->backlight_iface = NULL;
+}
+
+static void
+drmmode_output_dpms_backlight(xf86OutputPtr output, int oldmode, int mode)
+{
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+
+	if (!drmmode_output->backlight_iface)
+		return;
+
+	if (mode == DPMSModeOn) {
+		/* If we're going from off->on we may need to turn on the
+                 * backlight. */
+		if (oldmode != DPMSModeOn)
+			drmmode_backlight_set(output,
+                                        drmmode_output->backlight_active_level);
+	} else {
+		/* Only save the current backlight value if we're going from on
+                 * to off. */
+		if (oldmode == DPMSModeOn)
+			drmmode_output->backlight_active_level = drmmode_backlight_get(output);
+		drmmode_backlight_set(output, 0);
+	}
+}
+
+static void
 drmmode_crtc_dpms(xf86CrtcPtr drmmode_crtc, int mode)
 {
 
@@ -648,6 +819,9 @@ drmmode_output_destroy(xf86OutputPtr output)
 		drmModeFreeProperty(drmmode_output->props[i].mode_prop);
 		free(drmmode_output->props[i].atoms);
 	}
+	if (drmmode_output->backlight_iface)
+		drmmode_backlight_set(output,
+		                      drmmode_output->backlight_active_level);
 	drmModeFreeConnector(drmmode_output->mode_output);
 	free(drmmode_output);
 	output->driver_private = NULL;
@@ -679,6 +853,8 @@ drmmode_output_dpms(xf86OutputPtr output, int mode)
 
 	drmModeConnectorSetProperty(drmmode->fd, koutput->connector_id,
 				    mode_id, mode);
+	drmmode_output_dpms_backlight(output, drmmode_output->dpms_mode, mode);
+	drmmode_output->dpms_mode = mode;
 }
 
 static Bool
@@ -711,6 +887,48 @@ drmmode_output_create_resources(xf86OutputPtr output)
 	if (!drmmode_output->props)
 		return;
 
+	if (drmmode_output->backlight_iface) {
+		int32_t data, backlight_range[2];
+
+		backlight_range[0] = 0;
+		backlight_range[1] = drmmode_output->backlight_max;
+		err = RRConfigureOutputProperty(output->randr_output,
+                                                drmmode->backlight_atom,
+                                                FALSE, TRUE, FALSE, 2,
+                                                backlight_range);
+		if (err != 0)
+			xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+			           "RRConfigureOutputProperty error, %d\n",
+			           err);
+
+		err = RRConfigureOutputProperty(output->randr_output,
+                                        drmmode->backlight_deprecated_atom,
+                                        FALSE, TRUE, FALSE, 2, backlight_range);
+		if (err != 0)
+			xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+			           "RRConfigureOutputProperty error, %d\n",
+			           err);
+
+		/* Set the current value of the backlight property */
+		data = drmmode_output->backlight_active_level;
+		err = RRChangeOutputProperty(output->randr_output,
+		                             drmmode->backlight_atom,
+		                             XA_INTEGER, 32, PropModeReplace,
+		                             1, &data, FALSE, TRUE);
+		if (err != 0)
+			xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+			           "RRChangeOutputProperty error, %d\n", err);
+
+		err = RRChangeOutputProperty(output->randr_output,
+					     drmmode->backlight_deprecated_atom,
+		                             XA_INTEGER, 32, PropModeReplace,
+		                             1, &data, FALSE, TRUE);
+		if (err != 0)
+			xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+			           "RRChangeOutputProperty error, %d\n", err);
+	}
+
+
 	drmmode_output->num_props = 0;
 	for (i = 0, j = 0; i < mode_output->count_props; i++) {
 		drmmode_prop = drmModeGetProperty(drmmode->fd, mode_output->props[i]);
@@ -795,6 +1013,24 @@ drmmode_output_set_property(xf86OutputPtr output, Atom property,
 	drmmode_ptr drmmode = drmmode_output->drmmode;
 	int i, ret;
 
+	if (property == drmmode->backlight_atom ||
+            property == drmmode->backlight_deprecated_atom) {
+		int32_t val;
+
+		if (value->type != XA_INTEGER || value->format != 32 ||
+		    value->size != 1)
+			return FALSE;
+
+		val = *(int32_t *)value->data;
+		if (val < 0 || val > drmmode_output->backlight_max)
+			return FALSE;
+
+		if (drmmode_output->dpms_mode == DPMSModeOn)
+			drmmode_backlight_set(output, val);
+		drmmode_output->backlight_active_level = val;
+		return TRUE;
+	}
+
 	for (i = 0; i < drmmode_output->num_props; i++) {
 		drmmode_prop_ptr p = &drmmode_output->props[i];
 
@@ -864,6 +1100,27 @@ drmmode_output_get_property(xf86OutputPtr output, Atom property)
 			drmModeGetConnector(drmmode->fd, drmmode_output->output_id);
 	}
 
+	if (property == drmmode->backlight_atom ||
+	    property == drmmode->backlight_deprecated_atom) {
+                int32_t val;
+		if (!drmmode_output->backlight_iface)
+			return FALSE;
+
+		val = drmmode_backlight_get(output);
+		if (val < 0)
+		    return FALSE;
+		err = RRChangeOutputProperty(output->randr_output, property,
+			                     XA_INTEGER, 32, PropModeReplace,
+					     1, &val, FALSE, TRUE);
+		if (err != 0) {
+			xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+			"RRChangeOutputProperty error, %d\n", err);
+			return FALSE;
+		}
+
+		return TRUE;
+	}
+
 	for (i = 0; i < drmmode_output->num_props; i++) {
 		drmmode_prop_ptr p = &drmmode_output->props[i];
 		if (p->atoms[0] != property)
@@ -993,6 +1250,9 @@ drmmode_output_init(ScrnInfoPtr pScrn, drmmode_ptr drmmode, int num)
 	output->interlaceAllowed = true;
 	output->doubleScanAllowed = true;
 
+	if (koutput->connector_type == DRM_MODE_CONNECTOR_LVDS)
+		drmmode_backlight_init(output);
+
 	return;
 }
 
@@ -1116,6 +1376,13 @@ Bool drmmode_pre_init(ScrnInfoPtr pScrn, int fd, int cpp)
 	if (!drmmode->mode_res)
 		return FALSE;
 
+	drmmode->backlight_atom = MakeAtom(BACKLIGHT_NAME,
+	                                   sizeof(BACKLIGHT_NAME) - 1,
+					   TRUE);
+	drmmode->backlight_deprecated_atom = MakeAtom(BACKLIGHT_DEPRECATED_NAME,
+	                                              sizeof(BACKLIGHT_DEPRECATED_NAME) - 1,
+						      TRUE);
+
 	xf86CrtcSetSizeRange(pScrn, 320, 200, drmmode->mode_res->max_width,
 			     drmmode->mode_res->max_height);
 	for (i = 0; i < drmmode->mode_res->count_crtcs; i++)
-- 
1.7.1
