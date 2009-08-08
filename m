From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 6/7] drm/nouveau: expand some drm_os_linux macros
Date: Sat,  8 Aug 2009 10:39:01 +0300
Message-ID: <1249717142-6302-6-git-send-email-pq@iki.fi>
References: <1249717142-6302-1-git-send-email-pq@iki.fi>
	<1249717142-6302-2-git-send-email-pq@iki.fi>
	<1249717142-6302-3-git-send-email-pq@iki.fi>
	<1249717142-6302-4-git-send-email-pq@iki.fi>
	<1249717142-6302-5-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249717142-6302-5-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

In a Linux tree there is no reason to use these macros anymore.
Other DRM_* macros are IMO more readable than the Linux name, or they
are non-trivial to expand.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c   |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fifo.c  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_ioc32.c |    2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index a555a5d..43aef71 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -112,7 +112,7 @@ nouveau_dma_wait(struct nouveau_channel *chan, int size)
 						if (get > NOUVEAU_DMA_SKIPS)
 							break;
 
-						DRM_UDELAY(1);
+						udelay(1);
 					}
 
 					if (i >= us_timeout)
@@ -133,7 +133,7 @@ nouveau_dma_wait(struct nouveau_channel *chan, int size)
 			break;
 		}
 
-		DRM_UDELAY(1);
+		udelay(1);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 381cadd..45dbaf5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -600,7 +600,7 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pnvbo)
 	struct drm_nouveau_private *nv = dev->dev_private;       \
 	if (!nouveau_fifo_owner(dev, (cl), (id))) {              \
 		NV_ERROR(dev, "pid %d doesn't own channel %d\n", \
-			 DRM_CURRENTPID, (id));                  \
+			 task_pid_nr(current), (id));            \
 		return -EPERM;                                   \
 	}                                                        \
 	(ch) = nv->fifos[(id)];                                  \
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index df317a4..d41d133 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -81,7 +81,7 @@ nouveau_fbcon_sync(struct fb_info *info)
 			ret = 0;
 			break;
 		}
-		DRM_UDELAY(1);
+		udelay(1);
 	}
 
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 32b4bb9..fedc5f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -186,7 +186,7 @@ nouveau_fence_signalled(void *sync_obj, void *sync_arg)
 int
 nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 {
-	unsigned long timeout = jiffies + (3 * DRM_HZ);
+	unsigned long timeout = jiffies + (3 * HZ);
 	int ret = 0;
 
 	__set_current_state(intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fifo.c b/drivers/gpu/drm/nouveau/nouveau_fifo.c
index f938d6d..2f8dc8e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fifo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fifo.c
@@ -680,4 +680,4 @@ struct drm_ioctl_desc nouveau_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_AUTH),
 };
 
-int nouveau_max_ioctl = DRM_ARRAY_SIZE(nouveau_ioctls);
+int nouveau_max_ioctl = ARRAY_SIZE(nouveau_ioctls);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index bbef95d..4717ced 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -371,7 +371,7 @@ retry:
 		if (apply_relocs)
 			(*apply_relocs)++;
 
-		if (DRM_COPY_TO_USER((void __user *)user_bo, b, sizeof(*b))) {
+		if (copy_to_user((void __user *)user_bo, b, sizeof(*b))) {
 			ret = -EFAULT;
 			goto out_unref;
 		}
@@ -443,7 +443,7 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 	if (!mem)
 		return ERR_PTR(-ENOMEM);
 
-	if (DRM_COPY_FROM_USER(mem, (void __user *)user, nmemb * size)) {
+	if (copy_from_user(mem, (void __user *)user, nmemb * size)) {
 		kfree(mem);
 		return ERR_PTR(-EFAULT);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index a2c30f4..9ac1f2a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -58,7 +58,7 @@ long nouveau_compat_ioctl(struct file *filp, unsigned int cmd,
 		return drm_compat_ioctl(filp, cmd, arg);
 
 #if 0
-	if (nr < DRM_COMMAND_BASE + DRM_ARRAY_SIZE(mga_compat_ioctls))
+	if (nr < DRM_COMMAND_BASE + ARRAY_SIZE(mga_compat_ioctls))
 		fn = nouveau_compat_ioctls[nr - DRM_COMMAND_BASE];
 #endif
 	lock_kernel();	  /* XXX for now */
-- 
1.6.3.3
