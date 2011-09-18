From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] nouveau: add support for DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT
Date: Sun, 18 Sep 2011 15:20:15 +0200
Message-ID: <20110918132015.GB3389@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <skeggsb@gmail.com>
List-Id: nouveau.vger.kernel.org

New ioctl is used internally by nouveau_bo_wait to properly handle
timeouts with signals.
---
 include/drm/nouveau_drm.h |   33 ++++++++++++++--------
 nouveau/nouveau_bo.c      |   66 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 77 insertions(+), 22 deletions(-)

diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index b18cad0..6541766 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -25,6 +25,8 @@
 #ifndef __NOUVEAU_DRM_H__
 #define __NOUVEAU_DRM_H__
 
+#include <sys/time.h>
+
 #define NOUVEAU_DRM_HEADER_PATCHLEVEL 16
 
 struct drm_nouveau_channel_alloc {
@@ -179,6 +181,12 @@ struct drm_nouveau_gem_cpu_prep {
 	uint32_t flags;
 };
 
+struct drm_nouveau_gem_cpu_prep_timeout {
+	uint32_t handle;
+	uint32_t flags;
+	struct timespec timeout;
+};
+
 struct drm_nouveau_gem_cpu_fini {
 	uint32_t handle;
 };
@@ -192,17 +200,18 @@ enum nouveau_bus_type {
 struct drm_nouveau_sarea {
 };
 
-#define DRM_NOUVEAU_GETPARAM           0x00
-#define DRM_NOUVEAU_SETPARAM           0x01
-#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
-#define DRM_NOUVEAU_CHANNEL_FREE       0x03
-#define DRM_NOUVEAU_GROBJ_ALLOC        0x04
-#define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05
-#define DRM_NOUVEAU_GPUOBJ_FREE        0x06
-#define DRM_NOUVEAU_GEM_NEW            0x40
-#define DRM_NOUVEAU_GEM_PUSHBUF        0x41
-#define DRM_NOUVEAU_GEM_CPU_PREP       0x42
-#define DRM_NOUVEAU_GEM_CPU_FINI       0x43
-#define DRM_NOUVEAU_GEM_INFO           0x44
+#define DRM_NOUVEAU_GETPARAM             0x00
+#define DRM_NOUVEAU_SETPARAM             0x01
+#define DRM_NOUVEAU_CHANNEL_ALLOC        0x02
+#define DRM_NOUVEAU_CHANNEL_FREE         0x03
+#define DRM_NOUVEAU_GROBJ_ALLOC          0x04
+#define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC    0x05
+#define DRM_NOUVEAU_GPUOBJ_FREE          0x06
+#define DRM_NOUVEAU_GEM_NEW              0x40
+#define DRM_NOUVEAU_GEM_PUSHBUF          0x41
+#define DRM_NOUVEAU_GEM_CPU_PREP         0x42
+#define DRM_NOUVEAU_GEM_CPU_FINI         0x43
+#define DRM_NOUVEAU_GEM_INFO             0x44
+#define DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT 0x45
 
 #endif /* __NOUVEAU_DRM_H__ */
diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index d6bb22d..d85eebc 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -361,11 +361,48 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pbo)
 }
 
 static int
+nouveau_bo_wait_timeout(int fd, uint32_t handle, uint32_t flags)
+{
+	struct drm_nouveau_gem_cpu_prep_timeout req;
+	int ret;
+
+	req.handle = handle;
+	req.flags = flags;
+	req.timeout.tv_sec = 3;
+	req.timeout.tv_nsec = 0;
+
+	do {
+		ret = drmCommandWriteRead(fd, DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT,
+					&req, sizeof(req));
+	} while (ret == -EAGAIN);
+
+	return ret;
+}
+
+static int
+nouveau_bo_wait_compat(int fd, uint32_t handle, uint32_t flags)
+{
+	struct drm_nouveau_gem_cpu_prep req;
+	int ret;
+
+	req.handle = handle;
+	req.flags = flags;
+
+	do {
+		ret = drmCommandWrite(fd, DRM_NOUVEAU_GEM_CPU_PREP,
+				      &req, sizeof(req));
+	} while (ret == -EAGAIN);
+
+	return ret;
+}
+
+static int
 nouveau_bo_wait(struct nouveau_bo *bo, int cpu_write, int no_wait, int no_block)
 {
 	struct nouveau_device_priv *nvdev = nouveau_device(bo->device);
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
-	struct drm_nouveau_gem_cpu_prep req;
+	static int timeout_available = -1;
+	uint32_t flags;
 	int ret;
 
 	if (!nvbo->global_handle && !nvbo->write_marker && !cpu_write)
@@ -377,19 +414,28 @@ nouveau_bo_wait(struct nouveau_bo *bo, int cpu_write, int no_wait, int no_block)
 		nouveau_pushbuf_flush(nvbo->pending_channel, 0);
 	}
 
-	req.handle = nvbo->handle;
-	req.flags = 0;
+	flags = 0;
 	if (cpu_write)
-		req.flags |= NOUVEAU_GEM_CPU_PREP_WRITE;
+		flags |= NOUVEAU_GEM_CPU_PREP_WRITE;
 	if (no_wait)
-		req.flags |= NOUVEAU_GEM_CPU_PREP_NOWAIT;
+		flags |= NOUVEAU_GEM_CPU_PREP_NOWAIT;
 	if (no_block)
-		req.flags |= NOUVEAU_GEM_CPU_PREP_NOBLOCK;
+		flags |= NOUVEAU_GEM_CPU_PREP_NOBLOCK;
+
+	if (timeout_available == 1)
+		ret = nouveau_bo_wait_timeout(nvdev->fd, nvbo->handle, flags);
+	else if (timeout_available == 0)
+		ret = nouveau_bo_wait_compat(nvdev->fd, nvbo->handle, flags);
+	else {
+		ret = nouveau_bo_wait_timeout(nvdev->fd, nvbo->handle, flags);
+		if (ret == -EINVAL) {
+			timeout_available = 0;
+			ret = nouveau_bo_wait_compat(nvdev->fd, nvbo->handle, flags);
+		} else {
+			timeout_available = 1;
+		}
+	}
 
-	do {
-		ret = drmCommandWrite(nvdev->fd, DRM_NOUVEAU_GEM_CPU_PREP,
-				      &req, sizeof(req));
-	} while (ret == -EAGAIN);
 	if (ret)
 		return ret;
 
-- 
1.7.6.1
