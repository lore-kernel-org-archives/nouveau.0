From: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 3/7] drm/nouveau: Add fence fd helpers
Date: Fri, 26 Sep 2014 13:00:08 +0300
Message-ID: <1411725612-10455-4-git-send-email-lpeltonen@nvidia.com>
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

Add nouveau_fence_install, which installs a drm fence as a file
descriptor that can be returned to user space.

Add nouveau_fence_sync_fd, which pushes semaphore wait commands for
each Nouveau fence contained within the sync fd.  If the sync fd
contains non-Nouveau fences, those are waited on the CPU.

Add missing fence_value_str and timeline_value_str callbacks to
nouveau fence_ops.

Signed-off-by: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau_fence.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drm/nouveau_fence.h |  2 ++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drm/nouveau_fence.c b/drm/nouveau_fence.c
index 39b5436..e67d467 100644
--- a/drm/nouveau_fence.c
+++ b/drm/nouveau_fence.c
@@ -37,6 +37,8 @@
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
 
+#include "../drivers/staging/android/sync.h"
+
 static const struct fence_ops nouveau_fence_ops_uevent;
 static const struct fence_ops nouveau_fence_ops_legacy;
 
@@ -471,11 +473,78 @@ static bool nouveau_fence_enable_signaling(struct fence *f)
 	return ret;
 }
 
+static void nouveau_fence_timeline_value_str(struct fence *fence,
+					     char *str, int size)
+{
+	struct nouveau_fence *f = from_fence(fence);
+	struct nouveau_fence_chan *fctx = nouveau_fctx(f);
+	u32 cur;
+
+	cur = f->channel ? fctx->read(f->channel) : 0;
+	snprintf(str, size, "%d", cur);
+}
+
+static void
+nouveau_fence_value_str(struct fence *fence, char *str, int size)
+{
+	snprintf(str, size, "%d", fence->seqno);
+}
+
 static const struct fence_ops nouveau_fence_ops_uevent = {
 	.get_driver_name = nouveau_fence_get_get_driver_name,
 	.get_timeline_name = nouveau_fence_get_timeline_name,
 	.enable_signaling = nouveau_fence_enable_signaling,
 	.signaled = nouveau_fence_is_signaled,
 	.wait = fence_default_wait,
-	.release = NULL
+	.release = NULL,
+	.fence_value_str = nouveau_fence_value_str,
+	.timeline_value_str = nouveau_fence_timeline_value_str,
 };
+
+int
+nouveau_fence_install(struct fence *fence, const char *name, int *fd_out)
+{
+#ifdef CONFIG_SYNC
+	struct sync_fence *f;
+	int fd;
+
+	f = sync_fence_create(name, &fence, 1);
+	if (!f)
+		return -ENOMEM;
+
+	fd = get_unused_fd();
+	if (fd < 0) {
+		sync_fence_put(f);
+		return fd;
+	}
+	sync_fence_install(f, fd);
+	*fd_out = fd;
+	return 0;
+#else
+	return -ENODEV;
+#endif
+}
+
+int
+nouveau_fence_sync_fd(int fence_fd, struct nouveau_channel *chan)
+{
+#ifdef CONFIG_SYNC
+	int i, ret = 0;
+	struct sync_fence *fence;
+
+	fence = sync_fence_fdget(fence_fd);
+	if (!fence)
+		return -EINVAL;
+
+	for (i = 0; i < fence->num_fences; ++i) {
+		struct fence *pt = fence->cbs[i].sync_pt;
+
+		ret = nouveau_fence_sync(pt, chan);
+		if (ret)
+			break;
+	}
+	sync_fence_put(fence);
+	return ret;
+#else
+	return -ENODEV;
+#endif
+}
diff --git a/drm/nouveau_fence.h b/drm/nouveau_fence.h
index 8b70166..76342ea 100644
--- a/drm/nouveau_fence.h
+++ b/drm/nouveau_fence.h
@@ -27,6 +27,8 @@ bool nouveau_fence_done(struct nouveau_fence *);
 void nouveau_fence_work(struct fence *, void (*)(void *), void *);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
 int  nouveau_fence_sync(struct fence *, struct nouveau_channel *);
+int  nouveau_fence_sync_fd(int, struct nouveau_channel *);
+int  nouveau_fence_install(struct fence *, const char *name, int *);
 
 struct nouveau_fence_chan {
 	spinlock_t lock;
-- 
1.8.1.5
