From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH 1/5] drm: add optional per device rwsem for all ioctls
Date: Mon, 23 Apr 2012 00:18:28 +0200
Message-ID: <1335133112-8008-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Nouveau, in normal circumstances, does not need device lock for every ioctl,
but incoming "gpu reset" code needs exclusive access to the device.
This commit adds drm_driver flag which turns on read lock ioctl encapsulation.

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
---
 drivers/gpu/drm/drm_drv.c  |    6 ++++++
 drivers/gpu/drm/drm_stub.c |    2 ++
 include/drm/drmP.h         |    4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 6116e3b..c54e9f8 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -464,6 +464,9 @@ long drm_ioctl(struct file *filp,
 		} else
 			memset(kdata, 0, usize);
 
+		if (dev->driver->ioctls_need_rwsem)
+			down_read(&dev->ioctls_rwsem);
+
 		if (ioctl->flags & DRM_UNLOCKED)
 			retcode = func(dev, kdata, file_priv);
 		else {
@@ -472,6 +475,9 @@ long drm_ioctl(struct file *filp,
 			mutex_unlock(&drm_global_mutex);
 		}
 
+		if (dev->driver->ioctls_need_rwsem)
+			up_read(&dev->ioctls_rwsem);
+
 		if (cmd & IOC_OUT) {
 			if (copy_to_user((void __user *)arg, kdata,
 					 usize) != 0)
diff --git a/drivers/gpu/drm/drm_stub.c b/drivers/gpu/drm/drm_stub.c
index aa454f8..4af3227 100644
--- a/drivers/gpu/drm/drm_stub.c
+++ b/drivers/gpu/drm/drm_stub.c
@@ -275,6 +275,8 @@ int drm_fill_in_dev(struct drm_device *dev,
 	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->ctxlist_mutex);
 
+	init_rwsem(&dev->ioctls_rwsem);
+
 	if (drm_ht_create(&dev->map_hash, 12)) {
 		return -ENOMEM;
 	}
diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index dd73104..527dca5 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -954,6 +954,8 @@ struct drm_driver {
 	int dev_priv_size;
 	struct drm_ioctl_desc *ioctls;
 	int num_ioctls;
+	bool ioctls_need_rwsem;
+
 	const struct file_operations *fops;
 	union {
 		struct pci_driver *pci;
@@ -1070,6 +1072,8 @@ struct drm_device {
 	/*@{ */
 	spinlock_t count_lock;		/**< For inuse, drm_device::open_count, drm_device::buf_use */
 	struct mutex struct_mutex;	/**< For others */
+
+	struct rw_semaphore ioctls_rwsem;
 	/*@} */
 
 	/** \name Usage Counters */
-- 
1.7.8.5
