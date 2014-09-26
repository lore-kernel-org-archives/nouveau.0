From: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 7/7] drm/prime: Support explicit fence on
	export
Date: Fri, 26 Sep 2014 13:00:12 +0300
Message-ID: <1411725612-10455-8-git-send-email-lpeltonen@nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1411725612-10455-1-git-send-email-lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Allow user space to provide an explicit sync fence fd when exporting
a dma-buf from gem handle.  The fence will be stored as the explicit
fence to the reservation object.

Signed-off-by: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_prime.c | 41 +++++++++++++++++++++++++++++++++--------
 include/uapi/drm/drm.h      |  9 ++++++++-
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2807a77..c69df2e 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -28,8 +28,10 @@
 
 #include <linux/export.h>
 #include <linux/dma-buf.h>
+#include <linux/reservation.h>
 #include <drm/drmP.h>
 #include "drm_internal.h"
+#include "../../staging/android/sync.h"
 
 /*
  * DMA-BUF/GEM Object references and lifetime overview:
@@ -329,7 +331,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
  * drm_gem_prime_export - helper library implemention of the export callback
  * @dev: drm_device to export from
  * @obj: GEM object to export
- * @flags: flags like DRM_CLOEXEC
+ * @flags: flags like DRM_CLOEXEC or DRM_SYNC_FD
  *
  * This is the implementation of the gem_prime_export functions for GEM drivers
  * using the PRIME helpers.
@@ -385,7 +387,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
  * @dev: dev to export the buffer from
  * @file_priv: drm file-private structure
  * @handle: buffer handle to export
- * @flags: flags like DRM_CLOEXEC
+ * @flags: flags like DRM_CLOEXEC or DRM_SYNC_FD
  * @prime_fd: pointer to storage for the fd id of the create dma-buf
  *
  * This is the PRIME export function which must be used mandatorily by GEM
@@ -401,6 +403,24 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret = 0;
 	struct dma_buf *dmabuf;
+	struct fence *fence = NULL;
+
+	if (flags & DRM_SYNC_FD) {
+#ifdef CONFIG_SYNC
+		struct sync_fence *sf = sync_fence_fdget(*prime_fd);
+		if (!sf)
+			return -ENOENT;
+		if (sf->num_fences != 1) {
+			sync_fence_put(sf);
+			return -EINVAL;
+		}
+		fence = fence_get(sf->cbs[0].sync_pt);
+		sync_fence_put(sf);
+		flags &= ~DRM_SYNC_FD;
+#else
+		return -ENODEV;
+#endif
+	}
 
 	mutex_lock(&file_priv->prime.lock);
 	obj = drm_gem_object_lookup(dev, file_priv, handle);
@@ -453,6 +473,14 @@ out_have_obj:
 		goto fail_put_dmabuf;
 
 out_have_handle:
+	if (fence) {
+		if (!dmabuf->resv) {
+			ret = -ENODEV;
+			goto fail_put_dmabuf;
+		}
+		reservation_object_add_excl_fence(dmabuf->resv, fence);
+	}
+
 	ret = dma_buf_fd(dmabuf, flags);
 	/*
 	 * We must _not_ remove the buffer from the handle cache since the newly
@@ -475,6 +503,7 @@ out:
 	drm_gem_object_unreference_unlocked(obj);
 out_unlock:
 	mutex_unlock(&file_priv->prime.lock);
+	fence_put(fence);
 
 	return ret;
 }
@@ -624,7 +653,6 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
 {
 	struct drm_prime_handle *args = data;
-	uint32_t flags;
 
 	if (!drm_core_check_feature(dev, DRIVER_PRIME))
 		return -EINVAL;
@@ -633,14 +661,11 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 		return -ENOSYS;
 
 	/* check flags are valid */
-	if (args->flags & ~DRM_CLOEXEC)
+	if (args->flags & ~(DRM_CLOEXEC | DRM_SYNC_FD))
 		return -EINVAL;
 
-	/* we only want to pass DRM_CLOEXEC which is == O_CLOEXEC */
-	flags = args->flags & DRM_CLOEXEC;
-
 	return dev->driver->prime_handle_to_fd(dev, file_priv,
-			args->handle, flags, &args->fd);
+			args->handle, args->flags, &args->fd);
 }
 
 int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index b0b8556..a11b893 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -661,13 +661,20 @@ struct drm_set_client_cap {
 };
 
 #define DRM_CLOEXEC O_CLOEXEC
+#define DRM_SYNC_FD O_DSYNC
 struct drm_prime_handle {
 	__u32 handle;
 
 	/** Flags.. only applicable for handle->fd */
 	__u32 flags;
 
-	/** Returned dmabuf file descriptor */
+	/**
+	 * DRM_IOCTL_PRIME_FD_TO_HANDLE:
+	 *   in: dma-buf fd
+	 * DRM_IOCTL_PRIME_HANDLE_TO_FD:
+	 *   in: sync fence fd if DRM_SYNC_FD flag is passed
+	 *   out: dma-buf fd
+	 */
 	__s32 fd;
 };
 
-- 
1.8.1.5
