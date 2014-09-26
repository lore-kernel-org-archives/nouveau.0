From: Lauri Peltonen <lpeltonen@nvidia.com>
Subject: [RFC PATCH 4/7] drm/nouveau: Support fence fd's at kickoff
Date: Fri, 26 Sep 2014 13:00:09 +0300
Message-ID: <1411725612-10455-5-git-send-email-lpeltonen@nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

Add a new NOUVEAU_GEM_PUSHBUF_2 ioctl that accepts and emits a sync
fence fd from/to user space if the user space requests it by passing
corresponding flags.

Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
---
 drm/nouveau_drm.c          |  1 +
 drm/nouveau_gem.c          | 46 ++++++++++++++++++++++++++++++++++++++++++----
 drm/nouveau_gem.h          |  2 ++
 drm/uapi/drm/nouveau_drm.h | 11 +++++++++++
 4 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drm/nouveau_drm.c b/drm/nouveau_drm.c
index 244d78f..74d5ac6 100644
--- a/drm/nouveau_drm.c
+++ b/drm/nouveau_drm.c
@@ -812,6 +812,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF, nouveau_gem_ioctl_pushbuf, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF_2, nouveau_gem_ioctl_pushbuf_2, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
diff --git a/drm/nouveau_gem.c b/drm/nouveau_gem.c
index 78398d4..ee5782c 100644
--- a/drm/nouveau_gem.c
+++ b/drm/nouveau_gem.c
@@ -636,15 +636,16 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 	return ret;
 }
 
-int
-nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv)
+static int
+__nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
+			    struct drm_nouveau_gem_pushbuf *req,
+			    struct drm_nouveau_gem_pushbuf_2 *req_2,
+			    struct drm_file *file_priv)
 {
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv, dev);
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct drm_nouveau_gem_pushbuf *req = data;
 	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_bo *bo;
 	struct nouveau_channel *chan = NULL;
@@ -725,6 +726,14 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (req_2 && (req_2->flags & NOUVEAU_GEM_PUSHBUF_2_FENCE_WAIT)) {
+		ret = nouveau_fence_sync_fd(req_2->fence, chan);
+		if (ret) {
+			NV_PRINTK(error, cli, "fence wait: %d\n", ret);
+			goto out;
+		}
+	}
+
 	if (chan->dma.ib_max) {
 		ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
 		if (ret) {
@@ -800,6 +809,16 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		goto out;
 	}
 
+	if (req_2 && (req_2->flags & NOUVEAU_GEM_PUSHBUF_2_FENCE_EMIT)) {
+		ret = nouveau_fence_install(&fence->base, "nv-pushbuf",
+					    &req_2->fence);
+		if (ret) {
+			NV_PRINTK(error, cli, "fence install: %d\n", ret);
+			WIND_RING(chan);
+			goto out;
+		}
+	}
+
 out:
 	validate_fini(&op, fence, bo);
 	nouveau_fence_unref(&fence);
@@ -825,6 +844,25 @@ out_next:
 	return nouveau_abi16_put(abi16, ret);
 }
 
+int
+nouveau_gem_ioctl_pushbuf_2(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_pushbuf_2 *req_2 = data;
+	struct drm_nouveau_gem_pushbuf *req = &req_2->base;
+
+	return __nouveau_gem_ioctl_pushbuf(dev, req, req_2, file_priv);
+}
+
+int
+nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_pushbuf *req = data;
+
+	return __nouveau_gem_ioctl_pushbuf(dev, req, NULL, file_priv);
+}
+
 static inline uint32_t
 domain_to_ttm(struct nouveau_bo *nvbo, uint32_t domain)
 {
diff --git a/drm/nouveau_gem.h b/drm/nouveau_gem.h
index ddab762..7454dea 100644
--- a/drm/nouveau_gem.h
+++ b/drm/nouveau_gem.h
@@ -27,6 +27,8 @@ extern int nouveau_gem_ioctl_new(struct drm_device *, void *,
 				 struct drm_file *);
 extern int nouveau_gem_ioctl_pushbuf(struct drm_device *, void *,
 				     struct drm_file *);
+extern int nouveau_gem_ioctl_pushbuf_2(struct drm_device *, void *,
+				       struct drm_file *);
 extern int nouveau_gem_ioctl_cpu_prep(struct drm_device *, void *,
 				      struct drm_file *);
 extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
diff --git a/drm/uapi/drm/nouveau_drm.h b/drm/uapi/drm/nouveau_drm.h
index 0d7608d..394cd94 100644
--- a/drm/uapi/drm/nouveau_drm.h
+++ b/drm/uapi/drm/nouveau_drm.h
@@ -115,6 +115,15 @@ struct drm_nouveau_gem_pushbuf {
 	uint64_t gart_available;
 };
 
+#define NOUVEAU_GEM_PUSHBUF_2_FENCE_WAIT                             0x00000001
+#define NOUVEAU_GEM_PUSHBUF_2_FENCE_EMIT                             0x00000002
+struct drm_nouveau_gem_pushbuf_2 {
+	struct drm_nouveau_gem_pushbuf base;
+	uint32_t flags;
+	int32_t  fence;
+	uint64_t reserved;
+};
+
 #define NOUVEAU_GEM_CPU_PREP_NOWAIT                                  0x00000001
 #define NOUVEAU_GEM_CPU_PREP_WRITE                                   0x00000004
 struct drm_nouveau_gem_cpu_prep {
@@ -139,9 +148,11 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
+#define DRM_NOUVEAU_GEM_PUSHBUF_2      0x45
 
 #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
+#define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF_2      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF_2, struct drm_nouveau_gem_pushbuf_2)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
-- 
1.8.1.5
