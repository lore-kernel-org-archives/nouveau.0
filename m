From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Wed, 25 Apr 2012 23:20:36 +0200
Message-ID: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Overall idea:
Detect lockups by watching for timeouts (vm flush / fence), return -EIOs,
handle them at ioctl level, reset the GPU and repeat last ioctl.

GPU reset is done by doing suspend / resume cycle with few tweaks:
- CPU-only bo eviction
- ignoring vm flush / fence timeouts
- shortening waits

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c       |    2 +-
 drivers/gpu/drm/nouveau/nouveau_channel.c  |    5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.c      |   56 ++++++++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h      |   45 ++++++++-
 drivers/gpu/drm/nouveau/nouveau_fence.c    |    7 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c      |   14 +++-
 drivers/gpu/drm/nouveau/nouveau_notifier.c |    3 +
 drivers/gpu/drm/nouveau/nouveau_object.c   |    6 +
 drivers/gpu/drm/nouveau/nouveau_reset.c    |  148 ++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_state.c    |    6 +
 drivers/gpu/drm/nouveau/nv50_graph.c       |   11 +-
 12 files changed, 290 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_reset.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 03860f5..77d0c33 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -9,7 +9,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
              nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
              nouveau_display.o nouveau_connector.o nouveau_fbcon.o \
-             nouveau_hdmi.o nouveau_dp.o nouveau_ramht.o \
+             nouveau_hdmi.o nouveau_dp.o nouveau_ramht.o nouveau_reset.o \
 	     nouveau_pm.o nouveau_volt.o nouveau_perf.o nouveau_temp.o \
 	     nouveau_mm.o nouveau_vm.o nouveau_mxm.o nouveau_gpio.o \
              nv04_timer.o \
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 5b0dc50..7de6cad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -936,7 +936,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict, bool intr,
 	}
 
 	/* Software copy if the card isn't up and running yet. */
-	if (!dev_priv->channel) {
+	if (!dev_priv->channel || nouveau_gpu_reset_in_progress(dev_priv->dev)) {
 		ret = ttm_bo_move_memcpy(bo, evict, no_wait_reserve, no_wait_gpu, new_mem);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 846afb0..c0fa5a7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -420,7 +420,7 @@ nouveau_ioctl_fifo_alloc(struct drm_device *dev, void *data,
 				    init->fb_ctxdma_handle,
 				    init->tt_ctxdma_handle);
 	if (ret)
-		return ret;
+		goto out;
 	init->channel  = chan->id;
 
 	if (nouveau_vram_pushbuf == 0) {
@@ -450,6 +450,9 @@ nouveau_ioctl_fifo_alloc(struct drm_device *dev, void *data,
 	if (ret == 0)
 		atomic_inc(&chan->users); /* userspace reference */
 	nouveau_channel_put(&chan);
+out:
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 090fff6..261e1f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -237,7 +237,7 @@ nouveau_pci_suspend(struct pci_dev *pdev, pm_message_t pm_state)
 		if (!dev_priv->eng[e])
 			continue;
 
-		ret = dev_priv->eng[e]->fini(dev, e, true);
+		ret = dev_priv->eng[e]->fini(dev, e, !nouveau_gpu_reset_in_progress(dev));
 		if (ret) {
 			NV_ERROR(dev, "... engine %d failed: %d\n", e, ret);
 			goto out_abort;
@@ -443,11 +443,63 @@ nouveau_pci_resume(struct pci_dev *pdev)
 	return 0;
 }
 
+void intr_rwsem_init(struct intr_rwsem *r)
+{
+	init_rwsem(&r->rwsem);
+	mutex_init(&r->mutex);
+}
+
+int intr_rwsem_down_read_interruptible(struct intr_rwsem *r)
+{
+	while (down_read_trylock(&r->rwsem) == 0) {
+		int ret = mutex_lock_interruptible(&r->mutex);
+		if (ret)
+			return ret;
+		mutex_unlock(&r->mutex);
+	}
+	return 0;
+}
+
+void intr_rwsem_up_read(struct intr_rwsem *r)
+{
+	up_read(&r->rwsem);
+}
+
+void intr_rwsem_down_write(struct intr_rwsem *r)
+{
+	mutex_lock(&r->mutex);
+	down_write(&r->rwsem);
+}
+
+void intr_rwsem_up_write(struct intr_rwsem *r)
+{
+	up_write(&r->rwsem);
+	mutex_unlock(&r->mutex);
+}
+
+static long nouveau_ioctl(struct file *filp,
+	      unsigned int cmd, unsigned long arg)
+{
+	struct drm_file *file_priv = filp->private_data;
+	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	long ret = intr_rwsem_down_read_interruptible(&dev_priv->ioctls_rwsem);
+	if (ret)
+		return ret;
+
+	ret = drm_ioctl(filp, cmd, arg);
+
+	intr_rwsem_up_read(&dev_priv->ioctls_rwsem);
+
+	return ret;
+}
+
 static const struct file_operations nouveau_driver_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release,
-	.unlocked_ioctl = drm_ioctl,
+	.unlocked_ioctl = nouveau_ioctl,
 	.mmap = nouveau_ttm_mmap,
 	.poll = drm_poll,
 	.fasync = drm_fasync,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index d120baf..ad146e7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -704,9 +704,25 @@ enum nouveau_card_type {
 	NV_E0      = 0xe0,
 };
 
+struct intr_rwsem {
+	struct rw_semaphore rwsem;
+	struct mutex mutex;
+};
+
+extern void intr_rwsem_init(struct intr_rwsem *r);
+extern int  intr_rwsem_down_read_interruptible(struct intr_rwsem *r);
+extern void intr_rwsem_up_read(struct intr_rwsem *r);
+extern void intr_rwsem_down_write(struct intr_rwsem *r);
+extern void intr_rwsem_up_write(struct intr_rwsem *r);
+
 struct drm_nouveau_private {
 	struct drm_device *dev;
 	bool noaccel;
+	struct intr_rwsem ioctls_rwsem;
+
+	struct mutex reset_lock;
+	atomic_t gpureset_in_progress;
+	unsigned long last_gpu_reset;
 
 	/* the card type, takes NV_* as values */
 	enum nouveau_card_type card_type;
@@ -841,6 +857,7 @@ struct drm_nouveau_private {
 
 	struct {
 		struct dentry *channel_root;
+		struct dentry *reset;
 	} debugfs;
 
 	struct nouveau_fbdev *nfbdev;
@@ -1537,6 +1554,20 @@ int nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
 				    uint32_t handle, uint64_t *offset);
 int nouveau_display_dumb_destroy(struct drm_file *, struct drm_device *,
 				 uint32_t handle);
+/* nouveau_reset.c */
+#ifdef CONFIG_DRM_NOUVEAU_DEBUG
+void nouveau_reset_debugfs_fini(struct drm_minor *minor);
+void nouveau_reset_debugfs_init(struct drm_minor *minor);
+#else
+static inline void nouveau_reset_debugfs_fini(struct drm_minor *minor) {}
+static inline void nouveau_reset_debugfs_init(struct drm_minor *minor) {}
+#endif
+int  nouveau_reset_device(struct drm_device *dev);
+static inline bool nouveau_gpu_reset_in_progress(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	return atomic_read(&dev_priv->gpureset_in_progress) != 0;
+}
 
 /* nv10_gpio.c */
 int nv10_gpio_init(struct drm_device *dev);
@@ -1632,12 +1663,20 @@ static inline void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
 	iowrite8(val, dev_priv->mmio + reg);
 }
 
+static inline uint64_t nv_timeout(struct drm_device *dev)
+{
+	uint64_t tm = 2000000000ULL;
+	if (nouveau_gpu_reset_in_progress(dev))
+		tm = 50000000; /* 50ms */
+	return tm;
+}
+
 #define nv_wait(dev, reg, mask, val) \
-	nouveau_wait_eq(dev, 2000000000ULL, (reg), (mask), (val))
+	nouveau_wait_eq(dev, nv_timeout(dev), (reg), (mask), (val))
 #define nv_wait_ne(dev, reg, mask, val) \
-	nouveau_wait_ne(dev, 2000000000ULL, (reg), (mask), (val))
+	nouveau_wait_ne(dev, nv_timeout(dev), (reg), (mask), (val))
 #define nv_wait_cb(dev, func, data) \
-	nouveau_wait_cb(dev, 2000000000ULL, (func), (data))
+	nouveau_wait_cb(dev, nv_timeout(dev), (func), (data))
 
 /* PRAMIN access */
 static inline u32 nv_ri32(struct drm_device *dev, unsigned offset)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 41ee17d..13d0176 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -233,17 +233,22 @@ int
 __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 {
 	struct nouveau_fence *fence = nouveau_fence(sync_obj);
+	struct drm_device *dev = fence->channel->dev;
 	unsigned long timeout = fence->timeout;
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	ktime_t t;
 	int ret = 0;
 
+	if (nouveau_gpu_reset_in_progress(dev))
+		timeout = jiffies + DRM_HZ / 5;
+
 	while (1) {
 		if (__nouveau_fence_signalled(sync_obj, sync_arg))
 			break;
 
 		if (time_after_eq(jiffies, timeout)) {
-			ret = -EBUSY;
+			if (!nouveau_gpu_reset_in_progress(dev))
+				ret = -EIO;
 			break;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ed52a6f..f9bbcc0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -214,7 +214,7 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 			      req->info.domain, req->info.tile_mode,
 			      req->info.tile_flags, &nvbo);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = drm_gem_handle_create(file_priv, nvbo->gem, &req->info.handle);
 	if (ret == 0) {
@@ -225,6 +225,9 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 
 	/* drop reference from allocate - handle holds it now */
 	drm_gem_object_unreference_unlocked(nvbo->gem);
+out:
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
@@ -804,6 +807,9 @@ out_next:
 	}
 
 	nouveau_channel_put(&chan);
+
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
@@ -839,6 +845,9 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
 	spin_unlock(&nvbo->bo.bdev->fence_lock);
 	drm_gem_object_unreference_unlocked(gem);
+
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
@@ -863,6 +872,9 @@ nouveau_gem_ioctl_info(struct drm_device *dev, void *data,
 
 	ret = nouveau_gem_info(file_priv, gem, req);
 	drm_gem_object_unreference_unlocked(gem);
+
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_notifier.c b/drivers/gpu/drm/nouveau/nouveau_notifier.c
index 2ef883c..e224b1c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_notifier.c
+++ b/drivers/gpu/drm/nouveau/nouveau_notifier.c
@@ -200,5 +200,8 @@ nouveau_ioctl_notifier_alloc(struct drm_device *dev, void *data,
 	ret = nouveau_notifier_alloc(chan, na->handle, na->size, 0, 0x1000,
 				     &na->offset);
 	nouveau_channel_put(&chan);
+
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index cc419fa..ba592b0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -973,6 +973,9 @@ int nouveau_ioctl_grobj_alloc(struct drm_device *dev, void *data,
 
 out:
 	nouveau_channel_put(&chan);
+
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
@@ -992,6 +995,9 @@ int nouveau_ioctl_gpuobj_free(struct drm_device *dev, void *data,
 
 	ret = nouveau_ramht_remove(chan, objfree->handle);
 	nouveau_channel_put(&chan);
+
+	if (ret == -EIO)
+		ret = nouveau_reset_device(dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_reset.c b/drivers/gpu/drm/nouveau/nouveau_reset.c
new file mode 100644
index 0000000..e893096
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_reset.c
@@ -0,0 +1,148 @@
+/*
+ * Copyright (C) 2012 Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include <linux/debugfs.h>
+#include "drmP.h"
+#include "nouveau_drv.h"
+
+static bool off(struct drm_device *dev)
+{
+	struct pci_dev *pdev = dev->pdev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	pm_message_t pmm = { .event = PM_EVENT_SUSPEND };
+	atomic_inc(&dev_priv->gpureset_in_progress);
+	intr_rwsem_down_write(&dev_priv->ioctls_rwsem);
+
+	dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+	if (nouveau_pci_suspend(pdev, pmm))
+		goto fail;
+
+	dev->switch_power_state = DRM_SWITCH_POWER_OFF;
+	return true;
+
+fail:
+	dev->switch_power_state = DRM_SWITCH_POWER_ON;
+	intr_rwsem_up_write(&dev_priv->ioctls_rwsem);
+	return false;
+}
+
+static void on(struct drm_device *dev)
+{
+	struct pci_dev *pdev = dev->pdev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+	atomic_dec(&dev_priv->gpureset_in_progress);
+	nouveau_pci_resume(pdev);
+	dev->switch_power_state = DRM_SWITCH_POWER_ON;
+
+	dev_priv->last_gpu_reset = jiffies;
+	intr_rwsem_up_write(&dev_priv->ioctls_rwsem);
+}
+
+#ifdef CONFIG_DRM_NOUVEAU_DEBUG
+static ssize_t nouveau_reset_write(struct file *filp, const char __user *ubuf,
+			     size_t cnt, loff_t *ppos)
+{
+	struct drm_device *dev = filp->private_data;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	char usercmd[2];
+	if (cnt > 2)
+		cnt = 2;
+
+	if (copy_from_user(usercmd, ubuf, cnt))
+		return -EFAULT;
+
+	if (usercmd[0] == '1') {
+		int ret = intr_rwsem_down_read_interruptible(&dev_priv->ioctls_rwsem);
+		if (ret)
+			return ret;
+		nouveau_reset_device(dev);
+		intr_rwsem_up_read(&dev_priv->ioctls_rwsem);
+	}
+
+	return cnt;
+}
+
+static const struct file_operations nouveau_reset_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = nouveau_reset_write,
+	.llseek = noop_llseek,
+};
+
+void nouveau_reset_debugfs_fini(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	if (dev_priv->debugfs.reset) {
+		debugfs_remove(dev_priv->debugfs.reset);
+		dev_priv->debugfs.reset = NULL;
+	}
+}
+
+
+void nouveau_reset_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	dev_priv->debugfs.reset = debugfs_create_file("reset", 0200,
+			minor->debugfs_root, dev, &nouveau_reset_fops);
+	if (IS_ERR_OR_NULL(dev_priv->debugfs.reset))
+		dev_priv->debugfs.reset = NULL;
+
+}
+#endif
+
+int nouveau_reset_device(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	if (mutex_trylock(&dev_priv->reset_lock) == 0)
+		/* gpu reset in progress */
+		goto out;
+
+	if (time_after_eq(jiffies, dev_priv->last_gpu_reset + 10 * DRM_HZ)) {
+		unsigned long start, end;
+
+		intr_rwsem_up_read(&dev_priv->ioctls_rwsem);
+		NV_INFO(dev, "GPU lockup detected, resetting...\n");
+		start = jiffies;
+		while (!off(dev))
+			;
+		on(dev);
+		end = jiffies;
+		NV_INFO(dev, "GPU reset done, took %lu s\n", (end - start) / DRM_HZ);
+		while (intr_rwsem_down_read_interruptible(&dev_priv->ioctls_rwsem))
+			; /* not possible, we are holding reset_lock */
+	}
+	mutex_unlock(&dev_priv->reset_lock);
+
+out:
+	return -EAGAIN;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index afec760..2fac5e5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -697,6 +697,8 @@ nouveau_card_init(struct drm_device *dev)
 	if (ret)
 		goto out;
 	engine = &dev_priv->engine;
+	intr_rwsem_init(&dev_priv->ioctls_rwsem);
+	mutex_init(&dev_priv->reset_lock);
 	spin_lock_init(&dev_priv->channels.lock);
 	spin_lock_init(&dev_priv->tile.lock);
 	spin_lock_init(&dev_priv->context_switch_lock);
@@ -886,6 +888,7 @@ nouveau_card_init(struct drm_device *dev)
 
 		nouveau_fbcon_init(dev);
 	}
+	nouveau_reset_debugfs_init(dev->primary);
 
 	return 0;
 
@@ -943,6 +946,8 @@ static void nouveau_card_takedown(struct drm_device *dev)
 	struct nouveau_engine *engine = &dev_priv->engine;
 	int e;
 
+	nouveau_reset_debugfs_fini(dev->primary);
+
 	if (dev->mode_config.num_crtc) {
 		nouveau_fbcon_fini(dev);
 		nouveau_display_fini(dev);
@@ -1129,6 +1134,7 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	}
 	dev->dev_private = dev_priv;
 	dev_priv->dev = dev;
+	atomic_set(&dev_priv->gpureset_in_progress, 0);
 
 	pci_set_master(dev->pdev);
 
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index a61853f..d0a2e50 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -440,13 +440,14 @@ nv84_graph_tlb_flush(struct drm_device *dev, int engine)
 			ret = -ERESTARTSYS;
 			break;
 		}
-	} while (!idle && !(timeout = ptimer->read(dev) - start > 2000000000));
+	} while (!idle && !(timeout = ptimer->read(dev) - start > nv_timeout(dev)));
 
 	if (timeout) {
-		NV_ERROR(dev, "PGRAPH TLB flush idle timeout fail: "
-			      "0x%08x 0x%08x 0x%08x 0x%08x\n",
-			 nv_rd32(dev, 0x400700), nv_rd32(dev, 0x400380),
-			 nv_rd32(dev, 0x400384), nv_rd32(dev, 0x400388));
+		if (!nouveau_gpu_reset_in_progress(dev))
+			NV_ERROR(dev, "PGRAPH TLB flush idle timeout fail: "
+				"0x%08x 0x%08x 0x%08x 0x%08x\n",
+				nv_rd32(dev, 0x400700), nv_rd32(dev, 0x400380),
+				nv_rd32(dev, 0x400384), nv_rd32(dev, 0x400388));
 		ret = -EIO;
 	}
 
-- 
1.7.8.5
