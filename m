From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 3/3] drm: Constify struct drm_driver in DRM core
Date: Tue, 25 Feb 2020 16:59:02 +0100
Message-ID: <20200225155902.9751-4-tzimmermann@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200225155902.9751-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Once used for creatign a DRM device, instances of struct drm_driver
are not modified. So all related variables in the DRM core can be
declared 'const'.

In addition to the core interfaces, the patch also changes tdfx
accordingly. The other non-KMS drivers set.num_ioctls outside of
their instance's initialization, so they cannot have the instance
declared const yet.

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/drm_drv.c       |  8 ++++----
 drivers/gpu/drm/drm_pci.c       |  8 +++++---
 drivers/gpu/drm/tdfx/tdfx_drv.c |  2 +-
 include/drm/drm_device.h        |  2 +-
 include/drm/drm_drv.h           |  6 +++---
 include/drm/drm_legacy.h        | 10 ++++++----
 include/drm/drm_pci.h           |  4 ++--
 7 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 4875b76e7656..98d1f4169e6c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -612,7 +612,7 @@ static void drm_fs_inode_free(struct inode *inode)
  * 0 on success, or error code on failure.
  */
 int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
+		 const struct drm_driver *driver,
 		 struct device *parent)
 {
 	int ret;
@@ -726,7 +726,7 @@ static void devm_drm_dev_init_release(void *data)
  */
 int devm_drm_dev_init(struct device *parent,
 		      struct drm_device *dev,
-		      struct drm_driver *driver)
+		      const struct drm_driver *driver)
 {
 	int ret;
 
@@ -804,7 +804,7 @@ EXPORT_SYMBOL(drm_dev_fini);
  * RETURNS:
  * Pointer to new DRM device, or ERR_PTR on failure.
  */
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent)
 {
 	struct drm_device *dev;
@@ -947,7 +947,7 @@ static void remove_compat_control_link(struct drm_device *dev)
  */
 int drm_dev_register(struct drm_device *dev, unsigned long flags)
 {
-	struct drm_driver *driver = dev->driver;
+	const struct drm_driver *driver = dev->driver;
 	int ret;
 
 	if (drm_dev_needs_global_mutex(dev))
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 24ed0e92fd66..f6b7b30f7c5e 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -207,7 +207,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
  * Return: 0 on success or a negative error code on failure.
  */
 int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
-		    struct drm_driver *driver)
+		    const struct drm_driver *driver)
 {
 	struct drm_device *dev;
 	int ret;
@@ -264,7 +264,8 @@ EXPORT_SYMBOL(drm_get_pci_dev);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
+int drm_legacy_pci_init(const struct drm_driver *driver,
+			struct pci_driver *pdriver)
 {
 	struct pci_dev *pdev = NULL;
 	const struct pci_device_id *pid;
@@ -310,7 +311,8 @@ EXPORT_SYMBOL(drm_legacy_pci_init);
  * Unregister a DRM driver shadow-attached through drm_legacy_pci_init(). This
  * is deprecated and only used by dri1 drivers.
  */
-void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
+void drm_legacy_pci_exit(const struct drm_driver *driver,
+			 struct pci_driver *pdriver)
 {
 	struct drm_device *dev, *tmp;
 	DRM_DEBUG("\n");
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
index a8a6bce6afbe..637c9352c1af 100644
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
@@ -59,7 +59,7 @@ static const struct file_operations tdfx_driver_fops = {
 static struct drm_legacy_state tdfx_legacy_state = {
 };
 
-static struct drm_driver driver = {
+static const struct drm_driver driver = {
 	.driver_features = DRIVER_LEGACY,
 	.fops = &tdfx_driver_fops,
 	.name = DRIVER_NAME,
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bb60a949f416..6b2e2799d83c 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -68,7 +68,7 @@ struct drm_device {
 	struct device *dev;
 
 	/** @driver: DRM driver managing the device */
-	struct drm_driver *driver;
+	const struct drm_driver *driver;
 
 	/**
 	 * @dev_private:
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 15dd9a179216..887728d28226 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -604,14 +604,14 @@ struct drm_driver {
 };
 
 int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
+		 const struct drm_driver *driver,
 		 struct device *parent);
 int devm_drm_dev_init(struct device *parent,
 		      struct drm_device *dev,
-		      struct drm_driver *driver);
+		      const struct drm_driver *driver);
 void drm_dev_fini(struct drm_device *dev);
 
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent);
 int drm_dev_register(struct drm_device *dev, unsigned long flags);
 void drm_dev_unregister(struct drm_device *dev);
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index 7b5ee6a94a8c..abc77cf84752 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -211,18 +211,20 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
 
 #ifdef CONFIG_PCI
 
-int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
-void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
+int drm_legacy_pci_init(const struct drm_driver *driver,
+			struct pci_driver *pdriver);
+void drm_legacy_pci_exit(const struct drm_driver *driver,
+			 struct pci_driver *pdriver);
 
 #else
 
-static inline int drm_legacy_pci_init(struct drm_driver *driver,
+static inline int drm_legacy_pci_init(const struct drm_driver *driver,
 				      struct pci_driver *pdriver)
 {
 	return -EINVAL;
 }
 
-static inline void drm_legacy_pci_exit(struct drm_driver *driver,
+static inline void drm_legacy_pci_exit(const struct drm_driver *driver,
 				       struct pci_driver *pdriver)
 {
 }
diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
index 9031e217b506..8f98ae8384c2 100644
--- a/include/drm/drm_pci.h
+++ b/include/drm/drm_pci.h
@@ -47,7 +47,7 @@ void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
 
 int drm_get_pci_dev(struct pci_dev *pdev,
 		    const struct pci_device_id *ent,
-		    struct drm_driver *driver);
+		    const struct drm_driver *driver);
 
 #else
 
@@ -64,7 +64,7 @@ static inline void drm_pci_free(struct drm_device *dev,
 
 static inline int drm_get_pci_dev(struct pci_dev *pdev,
 				  const struct pci_device_id *ent,
-				  struct drm_driver *driver)
+				  const struct drm_driver *driver)
 {
 	return -ENOSYS;
 }
-- 
2.25.0
