From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: [PATCH] Add in-kernel backlight control support
Date: Wed, 18 Feb 2009 02:08:25 +0000
Message-ID: <20090218020825.GA5562@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
List-Id: nouveau.vger.kernel.org

Several nvidia-based systems don't support backlight control via the 
standard ACPI control mechanisms. Instead, it's necessary for the driver 
to modify the backlight control registers directly. This patch adds 
support for determining whether the registers appear to be in use, and 
if so registers a kernel backlight device to control them. The backlight 
can then be controlled via existing userspace tools.

Signed-off-by: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/linux-core/Makefile.kernel b/linux-core/Makefile.kernel
index 1e03347..0bea35d 100644
--- a/linux-core/Makefile.kernel
+++ b/linux-core/Makefile.kernel
@@ -22,6 +22,7 @@ i810-objs   := i810_drv.o i810_dma.o
 nouveau-objs := nouveau_drv.o nouveau_state.o nouveau_fifo.o nouveau_mem.o \
 		nouveau_object.o nouveau_irq.o nouveau_notifier.o nouveau_swmthd.o \
 		nouveau_sgdma.o nouveau_dma.o nouveau_bo.o nouveau_fence.o \
+		nouveau_backlight.o \
 		nv04_timer.o \
 		nv04_mc.o nv40_mc.o nv50_mc.o \
 		nv04_fb.o nv10_fb.o nv40_fb.o \
diff --git a/linux-core/nouveau_backlight.c b/linux-core/nouveau_backlight.c
new file mode 100644
index 0000000..dc75c44
--- /dev/null
+++ b/linux-core/nouveau_backlight.c
@@ -0,0 +1,156 @@
+/*
+ * Copyright (C) 2009 Red Hat <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+/*
+ * Authors:
+ *  Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * Register locations derived from NVClock by Roderick Colenbrander
+ */
+
+#include <linux/backlight.h>
+
+#include "drmP.h"
+#include "nouveau_drv.h"
+#include "nouveau_drm.h"
+#include "nouveau_reg.h"
+
+static int nv40_get_intensity(struct backlight_device *bd)
+{
+	struct drm_device *dev = bl_get_data(bd);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int val = (NV_READ(NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK) >> 16;
+
+	return val;
+}
+
+static int nv40_set_intensity(struct backlight_device *bd)
+{
+	struct drm_device *dev = bl_get_data(bd);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int val = bd->props.brightness;
+	int reg = NV_READ(NV40_PMC_BACKLIGHT);
+
+	NV_WRITE(NV40_PMC_BACKLIGHT,
+		 (val << 16) | (reg & ~NV40_PMC_BACKLIGHT_MASK));
+
+	return 0;
+}
+
+static struct backlight_ops nv40_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = nv40_get_intensity,
+	.update_status = nv40_set_intensity,
+};
+
+static int nv50_get_intensity(struct backlight_device *bd)
+{
+	struct drm_device *dev = bl_get_data(bd);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	return NV_READ(NV50_PDISPLAY_BACKLIGHT);
+}
+
+static int nv50_set_intensity(struct backlight_device *bd)
+{
+	struct drm_device *dev = bl_get_data(bd);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int val = bd->props.brightness;
+
+	NV_WRITE(NV50_PDISPLAY_BACKLIGHT, val | NV50_PDISPLAY_BACKLIGHT_ENABLE);
+
+	return 0;
+}
+
+static struct backlight_ops nv50_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = nv50_get_intensity,
+	.update_status = nv50_set_intensity,
+};
+
+static int nouveau_nv40_backlight_init(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct backlight_device *bd;
+	
+	if (!(NV_READ(NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
+		return 0;
+
+	bd = backlight_device_register("nv_backlight", &dev->pdev->dev, dev,
+				       &nv40_bl_ops);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	dev_priv->backlight = bd;
+	bd->props.max_brightness = 31;
+	bd->props.brightness = nv40_get_intensity(bd);
+	backlight_update_status(bd);
+
+	return 0;
+}
+
+static int nouveau_nv50_backlight_init(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct backlight_device *bd;
+
+	if (!NV_READ(NV50_PDISPLAY_BACKLIGHT))
+		return 0;
+
+	bd = backlight_device_register("nv_backlight", &dev->pdev->dev, dev,
+				       &nv50_bl_ops);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	dev_priv->backlight = bd;
+	bd->props.max_brightness = 1025;
+	bd->props.brightness = nv50_get_intensity(bd);
+	backlight_update_status(bd);
+	return 0;
+}
+
+int nouveau_backlight_init(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	switch (dev_priv->card_type) {
+	case NV_40:
+	case NV_44:
+		return nouveau_nv40_backlight_init(dev);
+		break;
+	case NV_50:
+		return nouveau_nv50_backlight_init(dev);
+		break;
+	}
+	return 0;
+}
+
+void nouveau_backlight_exit(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	if (dev_priv->backlight)
+		backlight_device_unregister(dev_priv->backlight);
+}	
diff --git a/shared-core/nouveau_drv.h b/shared-core/nouveau_drv.h
index 158d6fd..1cd10bf 100644
--- a/shared-core/nouveau_drv.h
+++ b/shared-core/nouveau_drv.h
@@ -318,6 +318,7 @@ struct drm_nouveau_private {
 		uint32_t *ramin_copy;
 		uint64_t ramin_size;
 	} susres;
+	struct backlight_device *backlight;
 };
 
 #define NOUVEAU_CHECK_INITIALISED_WITH_RETURN do {         \
@@ -468,6 +469,10 @@ extern int  nouveau_dma_channel_init(struct drm_device *);
 extern void nouveau_dma_channel_takedown(struct drm_device *);
 extern int  nouveau_dma_wait(struct drm_device *, int size);
 
+/* nouveau_backlight.c */
+extern int nouveau_backlight_init(struct drm_device *);
+extern void nouveau_backlight_exit(struct drm_device *);
+
 /* nv04_fb.c */
 extern int  nv04_fb_init(struct drm_device *);
 extern void nv04_fb_takedown(struct drm_device *);
diff --git a/shared-core/nouveau_reg.h b/shared-core/nouveau_reg.h
index 1ae0177..060abe0 100644
--- a/shared-core/nouveau_reg.h
+++ b/shared-core/nouveau_reg.h
@@ -99,6 +99,8 @@
  * the card will hang early on in the X init process.
  */
 #    define NV_PMC_ENABLE_UNK13                               (1<<13)
+#define NV40_PMC_BACKLIGHT				   0x000015f0
+#	define NV40_PMC_BACKLIGHT_MASK			   0x001f0000
 #define NV40_PMC_1700                                      0x00001700
 #define NV40_PMC_1704                                      0x00001704
 #define NV40_PMC_1708                                      0x00001708
@@ -542,6 +544,9 @@
 /* This name is a partial guess. */
 #define NV50_DISPLAY_SUPERVISOR                     0x00610024
 
+#define NV50_PDISPLAY_BACKLIGHT				0x0061c084
+#	define NV50_PDISPLAY_BACKLIGHT_ENABLE		0x80000000
+
 /* Fifo commands. These are not regs, neither masks */
 #define NV03_FIFO_CMD_JUMP                                 0x20000000
 #define NV03_FIFO_CMD_JUMP_OFFSET_MASK                     0x1ffffffc
@@ -591,3 +596,4 @@
 #define NV40_RAMFC_UNK_48                                        0x48
 #define NV40_RAMFC_UNK_4C                                        0x4C
 #define NV40_RAMFC_UNK_50                                        0x50
+
diff --git a/shared-core/nouveau_state.c b/shared-core/nouveau_state.c
index 0b6002c..c9f4329 100644
--- a/shared-core/nouveau_state.c
+++ b/shared-core/nouveau_state.c
@@ -363,6 +363,11 @@ nouveau_card_init(struct drm_device *dev)
 	ret = nouveau_dma_channel_init(dev);
 	if (ret) return ret;
 
+	ret = nouveau_backlight_init(dev);
+	if (ret)
+		DRM_ERROR("Error code %d when trying to register backlight\n",
+			  ret);
+
 	dev_priv->init_state = NOUVEAU_CARD_INIT_DONE;
 	return 0;
 }
@@ -375,6 +380,8 @@ static void nouveau_card_takedown(struct drm_device *dev)
 	DRM_DEBUG("prev state = %d\n", dev_priv->init_state);
 
 	if (dev_priv->init_state != NOUVEAU_CARD_INIT_DOWN) {
+		nouveau_backlight_exit(dev);
+
 		nouveau_dma_channel_takedown(dev);
 
 		engine->fifo.takedown(dev);

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
