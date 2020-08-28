From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/6] drm/nouveau: Support fence FDs at kickoff
Date: Fri, 28 Aug 2020 12:40:13 +0200
Message-ID: <20200828104016.1672195-4-thierry.reding@gmail.com>
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

Add a new NOUVEAU_GEM_PUSHBUF2 IOCTL that accepts and emits a sync fence
FD from/to userspace if requested by the corresponding flags.

Based heavily on work by Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c | 79 +++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_gem.h |  2 +
 include/uapi/drm/nouveau_drm.h        | 14 +++++
 4 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e5..c9cb2648a28b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1140,6 +1140,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF2, nouveau_gem_ioctl_pushbuf2, DRM_RENDER_ALLOW),
 };
 
 long
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 590e4c1d2e8a..039f244c0a00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -24,6 +24,9 @@
  *
  */
 
+#include <linux/file.h>
+#include <linux/sync_file.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
@@ -677,24 +680,30 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 	return ret;
 }
 
-int
-nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv)
+static int
+__nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
+			    struct drm_nouveau_gem_pushbuf2 *request,
+			    struct drm_file *file_priv)
 {
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct drm_nouveau_gem_pushbuf *req = data;
+	struct drm_nouveau_gem_pushbuf *req = &request->base;
 	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	struct drm_nouveau_gem_pushbuf_bo *bo;
 	struct nouveau_channel *chan = NULL;
 	struct validate_op op;
 	struct nouveau_fence *fence = NULL;
+	struct dma_fence *prefence = NULL;
 	int i, j, ret = 0;
 	bool do_reloc = false, sync = false;
 
+	/* check for unrecognized flags */
+	if (request->flags & ~NOUVEAU_GEM_PUSHBUF_FLAGS)
+		return -EINVAL;
+
 	if (unlikely(!abi16))
 		return -ENOMEM;
 
@@ -764,6 +773,15 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		goto out_prevalid;
 	}
 
+	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_WAIT) {
+		prefence = sync_file_get_fence(request->fence);
+		if (prefence) {
+			ret = nouveau_fence_sync(prefence, chan, true);
+			if (ret < 0)
+				goto out;
+		}
+	}
+
 	/* Apply any relocations that are required */
 	if (do_reloc) {
 		if (!reloc) {
@@ -865,7 +883,30 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_EMIT) {
+		struct sync_file *file;
+		int fd;
+
+		fd = get_unused_fd_flags(O_CLOEXEC);
+		if (fd < 0) {
+			ret = fd;
+			goto out;
+		}
+
+		file = sync_file_create(&fence->base);
+		if (!file) {
+			put_unused_fd(fd);
+			goto out;
+		}
+
+		fd_install(fd, file->file);
+		request->fence = fd;
+	}
+
 out:
+	if (prefence)
+		dma_fence_put(prefence);
+
 	validate_fini(&op, chan, fence, bo);
 	nouveau_fence_unref(&fence);
 
@@ -906,6 +947,27 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	return nouveau_abi16_put(abi16, ret);
 }
 
+int
+nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_pushbuf *request = data;
+	struct drm_nouveau_gem_pushbuf2 req;
+	int ret;
+
+	memset(&req, 0, sizeof(req));
+	memcpy(&req.base, request, sizeof(*request));
+
+	ret = __nouveau_gem_ioctl_pushbuf(dev, &req, file_priv);
+
+	request->gart_available = req.base.gart_available;
+	request->vram_available = req.base.vram_available;
+	request->suffix1 = req.base.suffix1;
+	request->suffix0 = req.base.suffix0;
+
+	return ret;
+}
+
 int
 nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
@@ -973,3 +1035,12 @@ nouveau_gem_ioctl_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
+int
+nouveau_gem_ioctl_pushbuf2(struct drm_device *dev, void *data,
+			   struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_pushbuf2 *req = data;
+
+	return __nouveau_gem_ioctl_pushbuf(dev, req, file_priv);
+}
+
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index 978e07591990..652a63242303 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -29,6 +29,8 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 				      struct drm_file *);
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
+extern int nouveau_gem_ioctl_pushbuf2(struct drm_device *, void *,
+				      struct drm_file *);
 
 extern int nouveau_gem_prime_pin(struct drm_gem_object *);
 extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 853a327433d3..85425dc90301 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -115,6 +115,18 @@ struct drm_nouveau_gem_pushbuf {
 	__u64 gart_available;
 };
 
+#define NOUVEAU_GEM_PUSHBUF_FENCE_WAIT (1 << 0)
+#define NOUVEAU_GEM_PUSHBUF_FENCE_EMIT (1 << 1)
+#define NOUVEAU_GEM_PUSHBUF_FLAGS (NOUVEAU_GEM_PUSHBUF_FENCE_WAIT | \
+				   NOUVEAU_GEM_PUSHBUF_FENCE_EMIT)
+
+struct drm_nouveau_gem_pushbuf2 {
+	struct drm_nouveau_gem_pushbuf base;
+	__u32 flags;
+	__s32 fence;
+	__u64 reserved;
+};
+
 #define NOUVEAU_GEM_CPU_PREP_NOWAIT                                  0x00000001
 #define NOUVEAU_GEM_CPU_PREP_WRITE                                   0x00000004
 struct drm_nouveau_gem_cpu_prep {
@@ -141,6 +153,7 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
+#define DRM_NOUVEAU_GEM_PUSHBUF2       0x45
 
 struct drm_nouveau_svm_init {
 	__u64 unmanaged_addr;
@@ -196,6 +209,7 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
+#define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF2       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF2, struct drm_nouveau_gem_pushbuf2)
 
 #if defined(__cplusplus)
 }
-- 
2.28.0
