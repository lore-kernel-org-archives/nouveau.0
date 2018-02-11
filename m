From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/5] workqueue: Allow retrieval of current task's work struct
Date: Sun, 11 Feb 2018 10:38:28 +0100
Message-ID: <2d8f603074131eb87e588d2b803a71765bd3a2fd.1518338788.git.lukas@wunner.de>
References: <cover.1518338788.git.lukas@wunner.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1518338788.git.lukas@wunner.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Peter Wu <peter@lekensteyn.nl>, nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, Hans de Goede <hdegoede@redhat.com>, Pierre Moreau <pierre.morrow@free.fr>, linux-kernel@vger.kernel.org, Ismo Toijala <ismo.toijala@gmail.com>, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, Archit Taneja <architt@codeaurora.org>
List-Id: nouveau.vger.kernel.org

Introduce a helper to retrieve the current task's work struct if it is
a workqueue worker.

This allows us to fix a long-standing deadlock in several DRM drivers
wherein the ->runtime_suspend callback waits for a specific worker to
finish and that worker in turn calls a function which waits for runtime
suspend to finish.  That function is invoked from multiple call sites
and waiting for runtime suspend to finish is the correct thing to do
except if it's executing in the context of the worker.

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 include/linux/workqueue.h |  1 +
 kernel/workqueue.c        | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 4a54ef96aff5..bc0cda180c8b 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -465,6 +465,7 @@ extern bool cancel_delayed_work_sync(struct delayed_work *dwork);
 
 extern void workqueue_set_max_active(struct workqueue_struct *wq,
 				     int max_active);
+extern struct work_struct *current_work(void);
 extern bool current_is_workqueue_rescuer(void);
 extern bool workqueue_congested(int cpu, struct workqueue_struct *wq);
 extern unsigned int work_busy(struct work_struct *work);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 017044c26233..bb9a519cbf50 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4179,6 +4179,22 @@ void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 }
 EXPORT_SYMBOL_GPL(workqueue_set_max_active);
 
+/**
+ * current_work - retrieve %current task's work struct
+ *
+ * Determine if %current task is a workqueue worker and what it's working on.
+ * Useful to find out the context that the %current task is running in.
+ *
+ * Return: work struct if %current task is a workqueue worker, %NULL otherwise.
+ */
+struct work_struct *current_work(void)
+{
+	struct worker *worker = current_wq_worker();
+
+	return worker ? worker->current_work : NULL;
+}
+EXPORT_SYMBOL(current_work);
+
 /**
  * current_is_workqueue_rescuer - is %current workqueue rescuer?
  *
-- 
2.15.1
