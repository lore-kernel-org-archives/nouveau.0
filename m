From: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] novueau: Preliminary support for switchable
	graphics
Date: Fri,  4 Sep 2009 15:58:45 -0400
Message-ID: <1252094325-9865-1-git-send-email-mjg@redhat.com>
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
Cc: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Some recent laptops have switchable graphics, providing a discrete nvidia
gpu and either an integrated Intel gpu or a lower-powered nvidia gpu. An
ACPI interface is provided for controlling these devices. BIOSes will
often leave both gpus running, wasting power. This initial support simply
turns off whichever gpu is currently inactive. In future it will be
extended to allow for runtime switching of gpu.

Signed-off-by: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile        |    1 +
 drivers/gpu/drm/nouveau/nouveau_acpi.c  |  127 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   16 ++++
 drivers/gpu/drm/nouveau/nouveau_state.c |    5 +
 4 files changed, 149 insertions(+), 0 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_acpi.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 5a46cdd..a4e8223 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -23,5 +23,6 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
 
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
+nouveau-$(CONFIG_ACPI) += nouveau_acpi.o
 
 obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
new file mode 100644
index 0000000..714e5fb
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -0,0 +1,127 @@
+#include <linux/pci.h>
+#include <linux/acpi.h>
+#include <acpi/acpi_drivers.h>
+#include <acpi/acpi_bus.h>
+
+#include "drmP.h"
+#include "drm.h"
+#include "drm_sarea.h"
+#include "drm_crtc_helper.h"
+#include "nouveau_drv.h"
+#include "nouveau_drm.h"
+#include "nv50_display.h"
+
+#define NOUVEAU_DSM_SUPPORTED 0x00
+#define NOUVEAU_DSM_SUPPORTED_FUNCTIONS 0x00
+
+#define NOUVEAU_DSM_ACTIVE 0x01
+#define NOUVEAU_DSM_ACTIVE_QUERY 0x00
+
+#define NOUVEAU_DSM_LED 0x02
+#define NOUVEAU_DSM_LED_STATE 0x00
+#define NOUVEAU_DSM_LED_OFF 0x10
+#define NOUVEAU_DSM_LED_STAMINA 0x11
+#define NOUVEAU_DSM_LED_SPEED 0x12
+
+#define NOUVEAU_DSM_POWER 0x03
+#define NOUVEAU_DSM_POWER_STATE 0x00
+#define NOUVEAU_DSM_POWER_SPEED 0x01
+#define NOUVEAU_DSM_POWER_STAMINA 0x02
+
+static int nvidia_dsm(struct pci_dev *dev, int func, int arg, int *result)
+{
+	static char muid[] = {
+		0xA0, 0xA0, 0x95, 0x9D, 0x60, 0x00, 0x48, 0x4D,
+		0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4,
+	};
+
+	struct acpi_handle *handle;
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_object_list input;
+	union acpi_object params[4];
+	union acpi_object *obj;
+	int err;
+
+	handle = DEVICE_ACPI_HANDLE(&dev->dev);
+
+	if (!handle)
+		return -ENODEV;
+
+	input.count = 4;
+	input.pointer = params;
+	params[0].type = ACPI_TYPE_BUFFER;
+	params[0].buffer.length = sizeof(muid);
+	params[0].buffer.pointer = (char *)muid;
+	params[1].type = ACPI_TYPE_INTEGER;
+	params[1].integer.value = 0x00000102;
+	params[2].type = ACPI_TYPE_INTEGER;
+	params[2].integer.value = func;
+	params[3].type = ACPI_TYPE_INTEGER;
+	params[3].integer.value = arg;
+
+	err = acpi_evaluate_object(handle, "_DSM", &input, &output);
+	if (err) {
+		printk(KERN_ERR "nvidia-control: failed to evaluate _DSM: %d\n",
+		       err);
+		return err;
+	}
+
+	obj = (union acpi_object *)output.pointer;
+
+	if (obj->type == ACPI_TYPE_INTEGER)
+		if (obj->integer.value == 0x80000002)
+			return -ENODEV;
+
+	if (obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length == 4 && result) {
+			*result = 0;
+			*result |= obj->buffer.pointer[0];
+			*result |= (obj->buffer.pointer[1] << 8);
+			*result |= (obj->buffer.pointer[2] << 16);
+			*result |= (obj->buffer.pointer[3] << 24);
+		}
+	}
+
+	kfree(output.pointer);
+	return 0;
+}
+
+int nouveau_hybrid_setup(struct drm_device *dev)
+{
+	struct pci_dev *pdev = dev->pdev;
+	int result;
+
+	if (nvidia_dsm(pdev, NOUVEAU_DSM_ACTIVE, NOUVEAU_DSM_ACTIVE_QUERY,
+		       &result))
+		return -ENODEV;
+
+	printk(KERN_INFO "nouveau: _DSM hardware status gave 0x%x\n", result);
+
+	if (result &= 0x1) {	/* Stamina mode - disable the external GPU */
+		nvidia_dsm(pdev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_STAMINA,
+			   NULL);
+		nvidia_dsm(pdev, NOUVEAU_DSM_POWER, NOUVEAU_DSM_POWER_STAMINA,
+			   NULL);
+	} else {		/* Ensure that the external GPU is enabled */
+		nvidia_dsm(pdev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_SPEED, NULL);
+		nvidia_dsm(pdev, NOUVEAU_DSM_POWER, NOUVEAU_DSM_POWER_SPEED,
+			   NULL);
+	}
+
+	return 0;
+}
+
+bool nouveau_dsm_probe(struct drm_device *dev)
+{
+	struct pci_dev *pdev = dev->pdev;
+	int support = 0;
+	
+	if (nvidia_dsm(pdev, NOUVEAU_DSM_SUPPORTED,
+		       NOUVEAU_DSM_SUPPORTED_FUNCTIONS, &support))
+		return false;
+
+	if (!support)
+		return false;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 4a1efa1..f26d6ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -565,6 +565,7 @@ struct drm_nouveau_private {
 	} susres;
 
 	struct backlight_device *backlight;
+	bool acpi_dsm;
 
 	struct nouveau_channel *evo;
 };
@@ -748,6 +749,21 @@ extern struct ttm_backend *nouveau_sgdma_init_ttm(struct drm_device *);
 extern int  nouveau_dma_init(struct nouveau_channel *);
 extern int  nouveau_dma_wait(struct nouveau_channel *, int size);
 
+/* nouveau_acpi.c */
+#ifdef CONFIG_ACPI
+extern int nouveau_hybrid_setup(struct drm_device *dev);
+extern bool nouveau_dsm_probe(struct drm_device *dev);
+#else
+static inline int nouveau_hybrid_setup(struct drm_device *dev)
+{
+	return 0;
+}
+static inline bool nouveau_dsm_probe(struct drm_device *dev)
+{
+	return false;
+}
+#endif
+
 /* nouveau_backlight.c */
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 extern int nouveau_backlight_init(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 9abc7c8..4d91887 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -497,6 +497,11 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	NV_DEBUG(dev, "vendor: 0x%X device: 0x%X class: 0x%X\n",
 		 dev->pci_vendor, dev->pci_device, dev->pdev->class);
 
+	dev_priv->acpi_dsm = nouveau_dsm_probe(dev);
+
+	if (dev_priv->acpi_dsm)
+		nouveau_hybrid_setup(dev);
+
 	/* resource 0 is mmio regs */
 	/* resource 1 is linear FB */
 	/* resource 2 is RAMIN (mmio regs + 0x1000000) */
-- 
1.6.4.1
