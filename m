From: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] drm: Fix compilation on 2.6.30
Date: Mon, 11 May 2009 00:21:14 +0200
Message-ID: <200905110021.14623.mb@bu3sch.de>
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

This fixes DRM compilation of nouveau.ko on kernel 2.6.30.

Signed-off-by: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>

---
 linux-core/drm_os_linux.h |   19 ++++++++++++++++++-
 linux-core/drm_sysfs.c    |    8 ++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)

--- drm.orig/linux-core/drm_os_linux.h
+++ drm/linux-core/drm_os_linux.h
@@ -32,12 +32,29 @@
 /** IRQ handler arguments and return type and values */
 #define DRM_IRQ_ARGS		int irq, void *arg
 /** backwards compatibility with old irq return values */
-#ifndef IRQ_HANDLED
+#if !defined(IRQ_HANDLED) && LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,29)
 typedef void irqreturn_t;
 #define IRQ_HANDLED		/* nothing */
 #define IRQ_NONE		/* nothing */
 #endif
 
+#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,25)
+static inline const char *dev_name(const struct device *dev)
+{
+	return dev->bus_id;
+}
+static inline int dev_set_name(struct device *dev, const char *name, ...)
+{
+	va_list vargs;
+
+	va_start(vargs, name);
+	vsnprintf(dev->bus_id, sizeof(dev->bus_id), name, vargs);
+	va_end(vargs);
+
+	return 0;
+}
+#endif
+
 /** AGP types */
 #if __OS_HAS_AGP
 #define DRM_AGP_MEM		struct agp_memory
--- drm.orig/linux-core/drm_sysfs.c
+++ drm/linux-core/drm_sysfs.c
@@ -168,8 +168,12 @@ int drm_sysfs_device_add(struct drm_mino
 	minor->kdev.release = drm_sysfs_device_release;
 	minor->kdev.devt = minor->device;
 	minor_str = "card%d";
-	
-	snprintf(minor->kdev.bus_id, BUS_ID_SIZE, minor_str, minor->index);
+
+	err = dev_set_name(&minor->kdev, minor_str, minor->index);
+	if (err) {
+		DRM_ERROR("device set name failed: %d\n", err);
+		goto err_out;
+	}
 
 	err = device_register(&minor->kdev);
 	if (err) {

-- 
Greetings, Michael.
