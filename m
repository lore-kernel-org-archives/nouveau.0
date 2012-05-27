From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Sun, 27 May 2012 21:52:32 +0200
Message-ID: <20120527195232.GC2907@joi.lan>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335388836-13127-4-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4] drm/nouveau: gpu lockup recovery

Detect lockups by watching for vm flush / fence timeouts and signal them by
returning EIO. When EIOs are met at ioctl level, reset the card and repeat
last ioctl.

GPU reset is done by going through suspend / resume cycle with few tweaks:
- CPU-only bo eviction
- ignoring vm flush / fence timeouts
- shortening wait times

v2:
- move ioctl locking from drm core to nouveau
- make ioctl-side locking interruptible
- fix build bug on 32-bit systems

v3:
- make reset-side locking interruptible
- add module parameter to disable lockup recovery
- move reset code to nouveau_ioctl

v4:
- rebased on top current nouveau-git

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
I skipped posting v3 because of possible other approach to the problem, but
I find this patch useful for debugging, so I'm posting rebased version for
other devs.
---
 drivers/gpu/drm/nouveau/Makefile        |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.c   |   88 ++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   47 ++++++++-
 drivers/gpu/drm/nouveau/nouveau_fence.c |   10 ++-
 drivers/gpu/drm/nouveau/nouveau_reset.c |  166 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_state.c |    6 +
 drivers/gpu/drm/nouveau/nv50_graph.c    |   11 +-
 8 files changed, 318 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_reset.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 338450e..1fa707c 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -10,7 +10,7 @@ nouveau-y := nouveau_device.o nouveau_subdev.o nouveau_engine.o \
              nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
              nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
              nouveau_display.o nouveau_connector.o nouveau_fbcon.o \
-             nouveau_hdmi.o nouveau_dp.o nouveau_ramht.o \
+             nouveau_hdmi.o nouveau_dp.o nouveau_ramht.o nouveau_reset.o \
 	     nouveau_pm.o nouveau_volt.o nouveau_perf.o nouveau_therm.o \
 	     nouveau_mm.o nouveau_vm.o nouveau_mxm.o nouveau_gpio.o \
 	     nouveau_fanctl.o nouveau_abi16.o nouveau_agp.o \
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f30a75a..6827f2e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1133,7 +1133,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict, bool intr,
 	}
 
 	/* CPU copy if we have no accelerated method available */
-	if (!ndev->ttm.move) {
+	if (!ndev->ttm.move || nouveau_gpu_reset_in_progress(ndev)) {
 		ret = ttm_bo_move_memcpy(bo, evict, no_wait_reserve, no_wait_gpu, new_mem);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 79b3236..1dccfcc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -131,6 +131,10 @@ MODULE_PARM_DESC(mxmdcb, "Santise DCB table according to MXM-SIS");
 int nouveau_mxmdcb = 1;
 module_param_named(mxmdcb, nouveau_mxmdcb, int, 0400);
 
+MODULE_PARM_DESC(lockup_recovery, "Reset GPU on lockup (default: 1)\n");
+int nouveau_lockup_recovery = 1;
+module_param_named(lockup_recovery, nouveau_lockup_recovery, int, 0600);
+
 int nouveau_fbpercrtc;
 #if 0
 module_param_named(fbpercrtc, nouveau_fbpercrtc, int, 0400);
@@ -222,7 +226,7 @@ nouveau_pci_suspend(struct pci_dev *pdev, pm_message_t pm_state)
 	}
 
 	NV_INFO(ndev, "Disabling engines...\n");
-	ret = nouveau_device_fini(ndev, true);
+	ret = nouveau_device_fini(ndev, !nouveau_gpu_reset_in_progress(ndev));
 	if (ret)
 		goto out_abort;
 
@@ -362,11 +366,91 @@ static struct drm_ioctl_desc nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH),
 };
 
+void intr_rwsem_init(struct intr_rwsem *r)
+{
+	atomic_set(&r->readers, 0);
+	mutex_init(&r->mutex);
+}
+
+int intr_rwsem_down_read_interruptible(struct intr_rwsem *r)
+{
+	int ret = mutex_lock_interruptible(&r->mutex);
+	if (ret)
+		return ret;
+	atomic_inc(&r->readers);
+	mutex_unlock(&r->mutex);
+	return 0;
+}
+
+void intr_rwsem_down_read(struct intr_rwsem *r)
+{
+	mutex_lock(&r->mutex);
+	atomic_inc(&r->readers);
+	mutex_unlock(&r->mutex);
+}
+
+void intr_rwsem_up_read(struct intr_rwsem *r)
+{
+	atomic_dec(&r->readers);
+}
+
+int intr_rwsem_down_write_interruptible(struct intr_rwsem *r)
+{
+	int ret = mutex_lock_interruptible(&r->mutex);
+	if (ret)
+		return ret;
+	while (atomic_read(&r->readers)) {
+		if (signal_pending(current)) {
+			mutex_unlock(&r->mutex);
+			return -EINTR;
+		}
+		cond_resched();
+	}
+
+	return 0;
+}
+
+void intr_rwsem_down_write(struct intr_rwsem *r)
+{
+	mutex_lock(&r->mutex);
+	while (atomic_read(&r->readers))
+		cond_resched();
+}
+
+void intr_rwsem_up_write(struct intr_rwsem *r)
+{
+	mutex_unlock(&r->mutex);
+}
+
+static long nouveau_ioctl(struct file *filp,
+	      unsigned int cmd, unsigned long arg)
+{
+	struct drm_file *file_priv = filp->private_data;
+	struct drm_device *dev = file_priv->minor->dev;
+	struct nouveau_device *ndev = dev->dev_private;
+
+	long ret = intr_rwsem_down_read_interruptible(&ndev->ioctls_rwsem);
+	if (ret)
+		return -ERESTARTSYS;
+
+	ret = drm_ioctl(filp, cmd, arg);
+
+	intr_rwsem_up_read(&ndev->ioctls_rwsem);
+
+	if (unlikely(ret == -EIO)) {
+		ret = nouveau_reset_device(ndev);
+		if (ret == -EINTR)
+			ret = -ERESTARTSYS;
+	}
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
index c1539b5..83573b5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -481,8 +481,26 @@ enum nouveau_card_type {
 	NV_E0      = 0xe0,
 };
 
+struct intr_rwsem {
+	struct mutex mutex;
+	atomic_t readers;
+};
+
+extern void intr_rwsem_init(struct intr_rwsem *r);
+extern void intr_rwsem_down_read(struct intr_rwsem *r);
+extern int  intr_rwsem_down_read_interruptible(struct intr_rwsem *r);
+extern void intr_rwsem_up_read(struct intr_rwsem *r);
+extern void intr_rwsem_down_write(struct intr_rwsem *r);
+extern int  intr_rwsem_down_write_interruptible(struct intr_rwsem *r);
+extern void intr_rwsem_up_write(struct intr_rwsem *r);
+
 struct nouveau_device {
 	struct drm_device *dev;
+	struct intr_rwsem ioctls_rwsem;
+
+	struct mutex reset_lock;
+	atomic_t gpureset_in_progress;
+	unsigned long last_gpu_reset;
 
 	/* the card type, takes NV_* as values */
 	enum nouveau_card_type card_type;
@@ -575,6 +593,7 @@ struct nouveau_device {
 
 	struct {
 		struct dentry *channel_root;
+		struct dentry *reset;
 	} debugfs;
 
 	struct nouveau_fbdev *nfbdev;
@@ -652,6 +671,7 @@ extern int nouveau_perflvl_wr;
 extern int nouveau_msi;
 extern int nouveau_ctxfw;
 extern int nouveau_mxmdcb;
+extern int nouveau_lockup_recovery;
 
 int nouveau_pci_suspend(struct pci_dev *pdev, pm_message_t pm_state);
 int nouveau_pci_resume(struct pci_dev *pdev);
@@ -926,6 +946,19 @@ int nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
 				    u32 handle, u64 *offset);
 int nouveau_display_dumb_destroy(struct drm_file *, struct drm_device *,
 				 u32 handle);
+/* nouveau_reset.c */
+#ifdef CONFIG_DRM_NOUVEAU_DEBUG
+void nouveau_reset_debugfs_fini(struct drm_minor *minor);
+void nouveau_reset_debugfs_init(struct drm_minor *minor);
+#else
+static inline void nouveau_reset_debugfs_fini(struct drm_minor *minor) {}
+static inline void nouveau_reset_debugfs_init(struct drm_minor *minor) {}
+#endif
+int  nouveau_reset_device(struct nouveau_device *ndev);
+static inline bool nouveau_gpu_reset_in_progress(struct nouveau_device *ndev)
+{
+	return atomic_read(&ndev->gpureset_in_progress) != 0;
+}
 
 /* nv50_calc.c */
 int nv50_calc_pll(struct nouveau_device *, struct pll_lims *, int clk,
@@ -1001,12 +1034,20 @@ static inline void nv_wr08(struct nouveau_device *ndev, unsigned reg, u8 val)
 	iowrite8(val, ndev->mmio + reg);
 }
 
+static inline uint64_t nv_timeout(struct nouveau_device *ndev)
+{
+	uint64_t tm = 2000000000ULL;
+	if (nouveau_gpu_reset_in_progress(ndev))
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
 static inline u32 nv_ri32(struct nouveau_device *ndev, unsigned offset)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 19a2534..e55fc52 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -114,13 +114,19 @@ nouveau_fence_done(struct nouveau_fence *fence)
 int
 nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 {
+	struct nouveau_device *ndev = fence->channel->device;
+	unsigned long timeout = fence->timeout;
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	ktime_t t;
 	int ret = 0;
 
+	if (nouveau_gpu_reset_in_progress(ndev))
+		timeout = jiffies + DRM_HZ / 5;
+
 	while (!nouveau_fence_done(fence)) {
-		if (fence->timeout && time_after_eq(jiffies, fence->timeout)) {
-			ret = -EBUSY;
+		if (fence->timeout && time_after_eq(jiffies, timeout)) {
+			if (!nouveau_gpu_reset_in_progress(ndev))
+				ret = -EIO;
 			break;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_reset.c b/drivers/gpu/drm/nouveau/nouveau_reset.c
new file mode 100644
index 0000000..9df93e6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_reset.c
@@ -0,0 +1,166 @@
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
+static int off(struct nouveau_device *ndev)
+{
+	struct drm_device *dev = ndev->dev;
+	struct pci_dev *pdev = dev->pdev;
+	int ret;
+
+	pm_message_t pmm = { .event = PM_EVENT_SUSPEND };
+	atomic_inc(&ndev->gpureset_in_progress);
+	ret = intr_rwsem_down_write_interruptible(&ndev->ioctls_rwsem);
+	if (ret)
+		goto fail2;
+
+	dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+	ret = nouveau_pci_suspend(pdev, pmm);
+	if (ret)
+		goto fail;
+
+	dev->switch_power_state = DRM_SWITCH_POWER_OFF;
+	return 0;
+
+fail:
+	dev->switch_power_state = DRM_SWITCH_POWER_ON;
+	intr_rwsem_up_write(&ndev->ioctls_rwsem);
+fail2:
+	atomic_dec(&ndev->gpureset_in_progress);
+	return ret;
+}
+
+static void on(struct nouveau_device *ndev)
+{
+	struct drm_device *dev = ndev->dev;
+	struct pci_dev *pdev = dev->pdev;
+
+	dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
+	atomic_dec(&ndev->gpureset_in_progress);
+	nouveau_pci_resume(pdev);
+	dev->switch_power_state = DRM_SWITCH_POWER_ON;
+
+	ndev->last_gpu_reset = jiffies;
+	intr_rwsem_up_write(&ndev->ioctls_rwsem);
+}
+
+static int __nouveau_reset_device(struct nouveau_device *ndev, bool manual)
+{
+	int ret = -EAGAIN;
+	unsigned long start, end;
+	int offret;
+
+	if (mutex_trylock(&ndev->reset_lock) == 0)
+		/* gpu reset in progress */
+		return -EAGAIN;
+
+	if (time_before(jiffies, ndev->last_gpu_reset + 10 * DRM_HZ))
+		goto out;
+	if (!(nouveau_lockup_recovery || manual))
+		goto out;
+
+	if (manual)
+		NV_INFO(ndev, "Manual GPU reset invoked...\n");
+	else
+		NV_INFO(ndev, "GPU lockup detected, resetting... (process: %s[%d])\n",
+				current->comm, task_pid_nr(current));
+
+	start = jiffies;
+	do {
+		offret = off(ndev);
+	} while (offret != 0 && offret != -EINTR);
+
+	if (offret == 0) {
+		on(ndev);
+		end = jiffies;
+		NV_INFO(ndev, "GPU reset done, took %lus\n", (end - start) / DRM_HZ);
+	} else {
+		ret = offret;
+		end = jiffies;
+		NV_INFO(ndev, "GPU reset interrupted after %lus\n", (end - start) / DRM_HZ);
+	}
+
+out:
+	mutex_unlock(&ndev->reset_lock);
+	return ret;
+}
+
+int nouveau_reset_device(struct nouveau_device *ndev)
+{
+	return __nouveau_reset_device(ndev, false);
+}
+
+#ifdef CONFIG_DRM_NOUVEAU_DEBUG
+static ssize_t nouveau_reset_write(struct file *filp, const char __user *ubuf,
+			     size_t cnt, loff_t *ppos)
+{
+	struct nouveau_device *ndev = filp->private_data;
+	char usercmd[2];
+	if (cnt > 2)
+		cnt = 2;
+
+	if (copy_from_user(usercmd, ubuf, cnt))
+		return -EFAULT;
+
+	if (usercmd[0] == '1')
+		__nouveau_reset_device(ndev, true);
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
+	struct nouveau_device *ndev = dev->dev_private;
+
+	if (ndev->debugfs.reset) {
+		debugfs_remove(ndev->debugfs.reset);
+		ndev->debugfs.reset = NULL;
+	}
+}
+
+
+void nouveau_reset_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct nouveau_device *ndev = dev->dev_private;
+
+	ndev->debugfs.reset = debugfs_create_file("reset", 0200,
+			minor->debugfs_root, ndev, &nouveau_reset_fops);
+	if (IS_ERR_OR_NULL(ndev->debugfs.reset))
+		ndev->debugfs.reset = NULL;
+
+}
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 628c46c..304b6a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -241,6 +241,8 @@ nouveau_card_init(struct nouveau_device *ndev)
 	if (ret)
 		goto out;
 	engine = &ndev->subsys;
+	intr_rwsem_init(&ndev->ioctls_rwsem);
+	mutex_init(&ndev->reset_lock);
 	spin_lock_init(&ndev->channels.lock);
 	spin_lock_init(&ndev->tile.lock);
 	spin_lock_init(&ndev->context_switch_lock);
@@ -323,6 +325,7 @@ nouveau_card_init(struct nouveau_device *ndev)
 
 		nouveau_fbcon_init(ndev);
 	}
+	nouveau_reset_debugfs_init(dev->primary);
 
 	return 0;
 
@@ -354,6 +357,8 @@ static void nouveau_card_takedown(struct nouveau_device *ndev)
 	struct nouveau_subsys *engine = &ndev->subsys;
 	struct drm_device *dev = ndev->dev;
 
+	nouveau_reset_debugfs_fini(dev->primary);
+
 	if (dev->mode_config.num_crtc) {
 		nouveau_fbcon_fini(ndev);
 		nouveau_display_fini(ndev);
@@ -528,6 +533,7 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	}
 	dev->dev_private = ndev;
 	ndev->dev = dev;
+	atomic_set(&ndev->gpureset_in_progress, 0);
 
 	pci_set_master(dev->pdev);
 
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index ef6757f..26728100 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -247,13 +247,14 @@ nv84_graph_tlb_flush(struct nouveau_device *ndev, int engine)
 			break;
 		}
 	} while (!idle &&
-		 !(timeout = ptimer->read(ptimer) - start > 2000000000));
+		 !(timeout = ptimer->read(ptimer) - start > nv_timeout(ndev)));
 
 	if (timeout) {
-		NV_ERROR(ndev, "PGRAPH TLB flush idle timeout fail: "
-			      "0x%08x 0x%08x 0x%08x 0x%08x\n",
-			 nv_rd32(ndev, 0x400700), nv_rd32(ndev, 0x400380),
-			 nv_rd32(ndev, 0x400384), nv_rd32(ndev, 0x400388));
+		if (!nouveau_gpu_reset_in_progress(ndev))
+			NV_ERROR(ndev, "PGRAPH TLB flush idle timeout fail: "
+				      "0x%08x 0x%08x 0x%08x 0x%08x\n",
+				 nv_rd32(ndev, 0x400700), nv_rd32(ndev, 0x400380),
+				 nv_rd32(ndev, 0x400384), nv_rd32(ndev, 0x400388));
 		ret = -EIO;
 	}
 
-- 
1.7.8.6
