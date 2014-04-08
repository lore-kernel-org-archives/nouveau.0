From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] libdrm/nouveau: safen up nouveau libdrm against
 concurrent access
Date: Tue, 08 Apr 2014 17:31:34 +0200
Message-ID: <53441656.5080703@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Based on the original patch by Ilia Mirkin.

Handle races between nouveau_bo_name_get, nouveau_bo_prime_handle_ref and unreffing.

Because DRM_IOCTL_GEM_CLOSE is not refcounted, some special care was needed by holding
the lock during some ioctls.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
---
  nouveau/nouveau.c | 108 +++++++++++++++++++++++++++++++++++++++++++-----------
  nouveau/private.h |   3 +-
  2 files changed, 89 insertions(+), 22 deletions(-)

diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
index ee7893b..75dfb0e 100644
--- a/nouveau/nouveau.c
+++ b/nouveau/nouveau.c
@@ -85,6 +85,12 @@ nouveau_device_wrap(int fd, int close, struct nouveau_device **pdev)
  
  	if (!nvdev)
  		return -ENOMEM;
+	ret = pthread_mutex_init(&nvdev->lock, NULL);
+	if (ret) {
+		free(nvdev);
+		return ret;
+	}
+
  	nvdev->base.fd = fd;
  
  	ver = drmGetVersion(fd);
@@ -161,6 +167,7 @@ nouveau_device_del(struct nouveau_device **pdev)
  		if (nvdev->close)
  			drmClose(nvdev->base.fd);
  		free(nvdev->client);
+		pthread_mutex_destroy(&nvdev->lock);
  		free(nvdev);
  		*pdev = NULL;
  	}
@@ -191,6 +198,8 @@ nouveau_client_new(struct nouveau_device *dev, struct nouveau_client **pclient)
  	int id = 0, i, ret = -ENOMEM;
  	uint32_t *clients;
  
+	pthread_mutex_lock(&nvdev->lock);
+
  	for (i = 0; i < nvdev->nr_client; i++) {
  		id = ffs(nvdev->client[i]) - 1;
  		if (id >= 0)
@@ -199,7 +208,7 @@ nouveau_client_new(struct nouveau_device *dev, struct nouveau_client **pclient)
  
  	clients = realloc(nvdev->client, sizeof(uint32_t) * (i + 1));
  	if (!clients)
-		return ret;
+		goto unlock;
  	nvdev->client = clients;
  	nvdev->client[i] = 0;
  	nvdev->nr_client++;
@@ -214,6 +223,9 @@ out:
  	}
  
  	*pclient = &pcli->base;
+
+unlock:
+	pthread_mutex_unlock(&nvdev->lock);
  	return ret;
  }
  
@@ -225,7 +237,9 @@ nouveau_client_del(struct nouveau_client **pclient)
  	if (pcli) {
  		int id = pcli->base.id;
  		nvdev = nouveau_device(pcli->base.device);
+		pthread_mutex_lock(&nvdev->lock);
  		nvdev->client[id / 32] &= ~(1 << (id % 32));
+		pthread_mutex_unlock(&nvdev->lock);
  		free(pcli->kref);
  		free(pcli);
  	}
@@ -331,12 +345,43 @@ nouveau_object_find(struct nouveau_object *obj, uint32_t pclass)
  static void
  nouveau_bo_del(struct nouveau_bo *bo)
  {
+	struct nouveau_device_priv *nvdev = nouveau_device(bo->device);
  	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
  	struct drm_gem_close req = { bo->handle };
-	DRMLISTDEL(&nvbo->head);
+
+	pthread_mutex_lock(&nvdev->lock);
+	if (nvbo->name) {
+		if (atomic_read(&bo->refcnt)) {
+			/*
+			 * bo has been revived by a race with
+			 * nouveau_bo_prime_handle_ref, or nouveau_bo_name_ref.
+			 *
+			 * In theory there's still a race possible with
+			 * nouveau_bo_wrap, but when using this function
+			 * the lifetime of the handle is probably already
+			 * handled in another way. If there are races
+			 * you're probably using nouveau_bo_wrap wrong.
+			 */
+			pthread_mutex_unlock(&nvdev->lock);
+			return;
+		}
+		DRMLISTDEL(&nvbo->head);
+		/*
+		 * This bo has to be closed with the lock held because gem
+		 * handles are not refcounted. If a shared bo is closed and
+		 * re-opened in another thread a race against
+		 * DRM_IOCTL_GEM_OPEN or drmPrimeFDToHandle might cause the
+		 * bo to be closed accidentally while re-importing.
+		 */
+		drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &req);
+		pthread_mutex_unlock(&nvdev->lock);
+	} else {
+		DRMLISTDEL(&nvbo->head);
+		pthread_mutex_unlock(&nvdev->lock);
+		drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &req);
+	}
  	if (bo->map)
  		munmap(bo->map, bo->size);
-	drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &req);
  	free(nvbo);
  }
  
@@ -363,15 +408,17 @@ nouveau_bo_new(struct nouveau_device *dev, uint32_t flags, uint32_t align,
  		return ret;
  	}
  
+	pthread_mutex_lock(&nvdev->lock);
  	DRMLISTADD(&nvbo->head, &nvdev->bo_list);
+	pthread_mutex_unlock(&nvdev->lock);
  
  	*pbo = bo;
  	return 0;
  }
  
  int
-nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
-		struct nouveau_bo **pbo)
+nouveau_bo_wrap_locked(struct nouveau_device *dev, uint32_t handle,
+		       struct nouveau_bo **pbo)
  {
  	struct nouveau_device_priv *nvdev = nouveau_device(dev);
  	struct drm_nouveau_gem_info req = { .handle = handle };
@@ -405,6 +452,18 @@ nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
  }
  
  int
+nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
+		struct nouveau_bo **pbo)
+{
+	struct nouveau_device_priv *nvdev = nouveau_device(dev);
+	int ret;
+	pthread_mutex_lock(&nvdev->lock);
+	ret = nouveau_bo_wrap_locked(dev, handle, pbo);
+	pthread_mutex_unlock(&ndev->lock);
+	return ret;
+}
+
+int
  nouveau_bo_name_ref(struct nouveau_device *dev, uint32_t name,
  		    struct nouveau_bo **pbo)
  {
@@ -413,18 +472,21 @@ nouveau_bo_name_ref(struct nouveau_device *dev, uint32_t name,
  	struct drm_gem_open req = { .name = name };
  	int ret;
  
+	pthread_mutex_lock(&nvdev->lock);
  	DRMLISTFOREACHENTRY(nvbo, &nvdev->bo_list, head) {
  		if (nvbo->name == name) {
  			*pbo = NULL;
  			nouveau_bo_ref(&nvbo->base, pbo);
+			pthread_mutex_unlock(&nvdev->lock);
  			return 0;
  		}
  	}
  
  	ret = drmIoctl(dev->fd, DRM_IOCTL_GEM_OPEN, &req);
  	if (ret == 0) {
-		ret = nouveau_bo_wrap(dev, req.handle, pbo);
+		ret = nouveau_bo_wrap_locked(dev, req.handle, pbo);
  		nouveau_bo((*pbo))->name = name;
+		pthread_mutex_unlock(&nvdev->lock);
  	}
  
  	return ret;
@@ -435,13 +497,16 @@ nouveau_bo_name_get(struct nouveau_bo *bo, uint32_t *name)
  {
  	struct drm_gem_flink req = { .handle = bo->handle };
  	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
-	if (!nvbo->name) {
+
+	*name = nvbo->name;
+	if (!*name || *name == ~0) {
  		int ret = drmIoctl(bo->device->fd, DRM_IOCTL_GEM_FLINK, &req);
-		if (ret)
+		if (ret) {
+			*name = 0;
  			return ret;
-		nvbo->name = req.name;
+		}
+		nvbo->name = *name = req.name;
  	}
-	*name = nvbo->name;
  	return 0;
  }
  
@@ -466,19 +531,18 @@ nouveau_bo_prime_handle_ref(struct nouveau_device *dev, int prime_fd,
  	int ret;
  	unsigned int handle;
  
-	ret = drmPrimeFDToHandle(dev->fd, prime_fd, &handle);
-	if (ret) {
-		nouveau_bo_ref(NULL, bo);
-		return ret;
-	}
+	nouveau_bo_ref(NULL, bo);
  
-	ret = nouveau_bo_wrap(dev, handle, bo);
-	if (ret) {
-		nouveau_bo_ref(NULL, bo);
-		return ret;
+	pthread_mutex_lock(&nvdev->lock);
+	ret = drmPrimeFDToHandle(dev->fd, prime_fd, &handle);
+	if (ret == 0) {
+		ret = nouveau_bo_wrap_locked(dev, handle, bo);
+		if (!bo->name)
+			// XXX: Force locked DRM_IOCTL_GEM_CLOSE to rule out race conditions
+			bo->name = ~0;
  	}
-
-	return 0;
+	pthread_mutex_unlock(&nvdev->lock);
+	return ret;
  }
  
  int
@@ -490,6 +554,8 @@ nouveau_bo_set_prime(struct nouveau_bo *bo, int *prime_fd)
  	ret = drmPrimeHandleToFD(bo->device->fd, nvbo->base.handle, DRM_CLOEXEC, prime_fd);
  	if (ret)
  		return ret;
+	if (!nvbo->name)
+		nvbo->name = ~0;
  	return 0;
  }
  
diff --git a/nouveau/private.h b/nouveau/private.h
index 60714b8..4f337ad 100644
--- a/nouveau/private.h
+++ b/nouveau/private.h
@@ -3,6 +3,7 @@
  
  #include <xf86drm.h>
  #include <xf86atomic.h>
+#include <pthread.h>
  #include "nouveau_drm.h"
  
  #include "nouveau.h"
@@ -94,7 +95,7 @@ nouveau_bo(struct nouveau_bo *bo)
  struct nouveau_device_priv {
  	struct nouveau_device base;
  	int close;
-	atomic_t lock;
+	pthread_mutex_t lock;
  	struct nouveau_list bo_list;
  	uint32_t *client;
  	int nr_client;
-- 
1.9.1
