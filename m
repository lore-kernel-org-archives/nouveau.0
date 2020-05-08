From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v4 02/12] kthread: Add kthread_(un)block_work_queuing() and kthread_work_queuable()
Date: Fri,  8 May 2020 16:46:52 -0400
Message-ID: <20200508204751.155488-3-lyude@redhat.com>
References: <20200508204751.155488-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200508204751.155488-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Tejun Heo <tj@kernel.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Suren Baghdasaryan <surenb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liang Chen <cl@rock-chips.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>
List-Id: nouveau.vger.kernel.org

Add some simple wrappers around incrementing/decrementing
kthread_work.cancelling under lock, along with checking whether queuing
is currently allowed on a given kthread_work, which we'll use want to
implement work cancelling with DRM's vblank work helpers.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tejun Heo <tj@kernel.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/kthread.h | 19 +++++++++++++++++
 kernel/kthread.c        | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index 0006540ce7f9..c6fee200fced 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -211,9 +211,28 @@ void kthread_flush_worker(struct kthread_worker *worker);
 
 bool kthread_cancel_work_sync(struct kthread_work *work);
 bool kthread_cancel_delayed_work_sync(struct kthread_delayed_work *work);
+void kthread_block_work_queuing(struct kthread_worker *worker,
+				struct kthread_work *work);
+void kthread_unblock_work_queuing(struct kthread_worker *worker,
+				  struct kthread_work *work);
 
 void kthread_destroy_worker(struct kthread_worker *worker);
 
+/**
+ * kthread_work_queuable - whether or not a kthread work can be queued
+ * @work: The kthread work to check
+ *
+ * Checks whether or not queuing @work is currently blocked from queuing,
+ * either by kthread_cancel_work_sync() and friends or
+ * kthread_block_work_queuing().
+ *
+ * Returns: whether or not the @work may be queued.
+ */
+static inline bool kthread_work_queuable(struct kthread_work *work)
+{
+	return READ_ONCE(work->canceling) == 0;
+}
+
 struct cgroup_subsys_state;
 
 #ifdef CONFIG_BLK_CGROUP
diff --git a/kernel/kthread.c b/kernel/kthread.c
index c1f8ec9d5836..f8a5c5a87cc6 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1187,6 +1187,52 @@ bool kthread_cancel_delayed_work_sync(struct kthread_delayed_work *dwork)
 }
 EXPORT_SYMBOL_GPL(kthread_cancel_delayed_work_sync);
 
+/**
+ * kthread_block_work_queuing - prevent a kthread_work from being queued
+ * without actually cancelling it
+ * @worker: kthread worker to use
+ * @work: work to block queuing on
+ *
+ * Prevents @work from being queued using kthread_queue_work() and friends,
+ * but doesn't attempt to cancel any previous queuing. The caller must unblock
+ * queuing later by calling kthread_unblock_work_queuing(). This call can be
+ * called multiple times.
+ *
+ * See also: kthread_work_queuable()
+ */
+void kthread_block_work_queuing(struct kthread_worker *worker,
+				struct kthread_work *work)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&worker->lock, flags);
+	work->canceling++;
+	raw_spin_unlock_irqrestore(&worker->lock, flags);
+}
+EXPORT_SYMBOL_GPL(kthread_block_work_queuing);
+
+/**
+ * kthread_unblock_work_queuing - unblock queuing on a kthread_work
+ * @worker: kthread worker to use
+ * @work: work to unblock queuing on
+ *
+ * Removes a request to prevent @work from being queued with
+ * kthread_queue_work() and friends, so that it may potentially be queued
+ * again.
+ *
+ * See also: kthread_work_queuable()
+ */
+void kthread_unblock_work_queuing(struct kthread_worker *worker,
+				  struct kthread_work *work)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&worker->lock, flags);
+	WARN_ON_ONCE(--work->canceling < 0);
+	raw_spin_unlock_irqrestore(&worker->lock, flags);
+}
+EXPORT_SYMBOL_GPL(kthread_unblock_work_queuing);
+
 /**
  * kthread_flush_worker - flush all current works on a kthread_worker
  * @worker: worker to flush
-- 
2.25.4
