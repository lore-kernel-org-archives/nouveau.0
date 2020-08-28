From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/6] drm/nouveau: Support sync FDs and syncobjs
Date: Fri, 28 Aug 2020 12:40:14 +0200
Message-ID: <20200828104016.1672195-5-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200828104016.1672195-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Extends the new NOUVEAU_GEM_PUSHBUF2 IOCTL to accept and emit one or
more sync FDs and/or DRM native sync objects.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note: If acceptable, this should be merged into the previous patch that
adds the new IOCTL.

 drivers/gpu/drm/nouveau/nouveau_gem.c | 180 ++++++++++++++++++++++----
 include/uapi/drm/nouveau_drm.h        |  21 ++-
 2 files changed, 167 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 039f244c0a00..b3ece731e4e1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -26,6 +26,7 @@
 
 #include <linux/file.h>
 #include <linux/sync_file.h>
+#include <drm/drm_syncobj.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
@@ -680,12 +681,137 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 	return ret;
 }
 
+static int nouveau_channel_wait_fence(struct nouveau_channel *channel,
+				      struct drm_file *file_priv,
+				      struct drm_nouveau_gem_fence *f)
+{
+	struct dma_fence *fence;
+
+	if (f->flags & NOUVEAU_GEM_FENCE_FD) {
+		fence = sync_file_get_fence(f->handle);
+		if (!fence)
+			return -ENOENT;
+	} else {
+		struct drm_syncobj *syncobj;
+
+		syncobj = drm_syncobj_find(file_priv, f->handle);
+		if (!syncobj)
+			return -ENOENT;
+
+		fence = drm_syncobj_fence_get(syncobj);
+		drm_syncobj_put(syncobj);
+	}
+
+	return nouveau_fence_sync(fence, channel, true);
+}
+
+static int nouveau_channel_wait_fences(struct nouveau_channel *channel,
+				       struct drm_file *file_priv,
+				       struct drm_nouveau_gem_fence *fences,
+				       unsigned int num_fences)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_fences; i++) {
+		if (fences[i].flags & NOUVEAU_GEM_FENCE_WAIT) {
+			ret = nouveau_channel_wait_fence(channel, file_priv,
+							 &fences[i]);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct nouveau_fence *
+nouveau_channel_emit_fence(struct nouveau_channel *channel,
+			   struct drm_file *file_priv,
+			   struct drm_nouveau_gem_fence *f)
+{
+	struct nouveau_fence *fence;
+	int ret;
+
+	ret = nouveau_fence_new(channel, false, &fence);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (f->flags & NOUVEAU_GEM_FENCE_FD) {
+		struct sync_file *file;
+		int fd;
+
+		fd = get_unused_fd_flags(O_CLOEXEC);
+		if (fd < 0) {
+			ret = fd;
+			goto put;
+		}
+
+		file = sync_file_create(&fence->base);
+		if (!file) {
+			put_unused_fd(fd);
+			ret = -ENOMEM;
+			goto put;
+		}
+
+		fd_install(fd, file->file);
+		f->handle = fd;
+	} else {
+		struct drm_syncobj *syncobj;
+
+		ret = drm_syncobj_create(&syncobj, 0, &fence->base);
+		if (ret < 0)
+			goto put;
+
+		ret = drm_syncobj_get_handle(file_priv, syncobj, &f->handle);
+		drm_syncobj_put(syncobj);
+	}
+
+put:
+	nouveau_fence_unref(&fence);
+	return ERR_PTR(ret);
+}
+
+static struct nouveau_fence *
+nouveau_channel_emit_fences(struct nouveau_channel *channel,
+			    struct drm_file *file_priv,
+			    struct drm_nouveau_gem_fence *fences,
+			    unsigned int num_fences)
+{
+	struct nouveau_fence *fence = NULL, *f;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_fences; i++) {
+		if (fences[i].flags & NOUVEAU_GEM_FENCE_EMIT) {
+			f = nouveau_channel_emit_fence(channel, file_priv,
+						        &fences[i]);
+			if (IS_ERR(f))
+				return f;
+
+			if (!fence)
+				fence = f;
+		}
+	}
+
+	if (!fence) {
+		ret = nouveau_fence_new(channel, false, &fence);
+		if (ret)
+			fence = ERR_PTR(ret);
+	} else {
+		nouveau_fence_ref(fence);
+	}
+
+	return fence;
+}
+
 static int
 __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 			    struct drm_nouveau_gem_pushbuf2 *request,
 			    struct drm_file *file_priv)
 {
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
+	struct drm_nouveau_gem_fence __user *user_fences;
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -693,12 +819,13 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	struct drm_nouveau_gem_pushbuf_bo *bo;
+	struct drm_nouveau_gem_fence *fences = NULL;
 	struct nouveau_channel *chan = NULL;
 	struct validate_op op;
 	struct nouveau_fence *fence = NULL;
-	struct dma_fence *prefence = NULL;
 	int i, j, ret = 0;
 	bool do_reloc = false, sync = false;
+	size_t size;
 
 	/* check for unrecognized flags */
 	if (request->flags & ~NOUVEAU_GEM_PUSHBUF_FLAGS)
@@ -773,13 +900,18 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		goto out_prevalid;
 	}
 
-	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_WAIT) {
-		prefence = sync_file_get_fence(request->fence);
-		if (prefence) {
-			ret = nouveau_fence_sync(prefence, chan, true);
-			if (ret < 0)
-				goto out;
+	if (request->num_fences > 0) {
+		fences = u_memcpya(request->fences, request->num_fences,
+				   sizeof(*fences));
+		if (IS_ERR(fences)) {
+			ret = PTR_ERR(fences);
+			goto out;
 		}
+
+		ret = nouveau_channel_wait_fences(chan, file_priv, fences,
+						  request->num_fences);
+		if (ret < 0)
+			goto out;
 	}
 
 	/* Apply any relocations that are required */
@@ -869,10 +1001,13 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		}
 	}
 
-	ret = nouveau_fence_new(chan, false, &fence);
-	if (ret) {
+	fence = nouveau_channel_emit_fences(chan, file_priv, fences,
+					    request->num_fences);
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
 		NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
+		fence = NULL;
 		goto out;
 	}
 
@@ -883,29 +1018,18 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		}
 	}
 
-	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_EMIT) {
-		struct sync_file *file;
-		int fd;
-
-		fd = get_unused_fd_flags(O_CLOEXEC);
-		if (fd < 0) {
-			ret = fd;
-			goto out;
-		}
-
-		file = sync_file_create(&fence->base);
-		if (!file) {
-			put_unused_fd(fd);
-			goto out;
-		}
+	user_fences = u64_to_user_ptr(request->fences);
+	size = sizeof(*fences) * request->num_fences;
 
-		fd_install(fd, file->file);
-		request->fence = fd;
+	if (copy_to_user(user_fences, fences, size)) {
+		WIND_RING(chan);
+		ret = -EFAULT;
+		fence = NULL;
+		goto out;
 	}
 
 out:
-	if (prefence)
-		dma_fence_put(prefence);
+	u_free(fences);
 
 	validate_fini(&op, chan, fence, bo);
 	nouveau_fence_unref(&fence);
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 85425dc90301..5b8d40228a1b 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -115,16 +115,25 @@ struct drm_nouveau_gem_pushbuf {
 	__u64 gart_available;
 };
 
-#define NOUVEAU_GEM_PUSHBUF_FENCE_WAIT (1 << 0)
-#define NOUVEAU_GEM_PUSHBUF_FENCE_EMIT (1 << 1)
-#define NOUVEAU_GEM_PUSHBUF_FLAGS (NOUVEAU_GEM_PUSHBUF_FENCE_WAIT | \
-				   NOUVEAU_GEM_PUSHBUF_FENCE_EMIT)
+#define NOUVEAU_GEM_FENCE_WAIT	(1 << 0)
+#define NOUVEAU_GEM_FENCE_EMIT	(1 << 1)
+#define NOUVEAU_GEM_FENCE_FD	(1 << 2)
+#define NOUVEAU_GEM_FENCE_FLAGS	(NOUVEAU_GEM_FENCE_WAIT | \
+				 NOUVEAU_GEM_FENCE_EMIT | \
+				 NOUVEAU_GEM_FENCE_FD)
+
+struct drm_nouveau_gem_fence {
+	__u32 handle;
+	__u32 flags;
+};
+
+#define NOUVEAU_GEM_PUSHBUF_FLAGS	0
 
 struct drm_nouveau_gem_pushbuf2 {
 	struct drm_nouveau_gem_pushbuf base;
 	__u32 flags;
-	__s32 fence;
-	__u64 reserved;
+	__u32 num_fences;
+	__u64 fences;
 };
 
 #define NOUVEAU_GEM_CPU_PREP_NOWAIT                                  0x00000001
-- 
2.28.0
