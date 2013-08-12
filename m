From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/5] drm/nouveau/timer: add a way to cancel alarms
Date: Sun, 11 Aug 2013 22:48:51 -0400
Message-ID: <1376275732-2878-5-git-send-email-martin.peres@free.fr>
References: <1376275732-2878-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1376275732-2878-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

Since alarms don't play well with suspend, it is important every alarm user
cancels his tasks before suspending. The task should be rescheduled on resume.

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Dash Four <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/timer.h |  2 ++
 drivers/gpu/drm/nouveau/core/subdev/timer/base.c    |  7 +++++++
 drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c    | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/timer.h b/drivers/gpu/drm/nouveau/core/include/subdev/timer.h
index e465d15..9ab70df 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/timer.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/timer.h
@@ -22,6 +22,7 @@ bool nouveau_timer_wait_eq(void *, u64 nsec, u32 addr, u32 mask, u32 data);
 bool nouveau_timer_wait_ne(void *, u64 nsec, u32 addr, u32 mask, u32 data);
 bool nouveau_timer_wait_cb(void *, u64 nsec, bool (*func)(void *), void *data);
 void nouveau_timer_alarm(void *, u32 nsec, struct nouveau_alarm *);
+void nouveau_timer_alarm_cancel(void *, struct nouveau_alarm *);
 
 #define NV_WAIT_DEFAULT 2000000000ULL
 #define nv_wait(o,a,m,v)                                                       \
@@ -35,6 +36,7 @@ struct nouveau_timer {
 	struct nouveau_subdev base;
 	u64  (*read)(struct nouveau_timer *);
 	void (*alarm)(struct nouveau_timer *, u64 time, struct nouveau_alarm *);
+	void (*alarm_cancel)(struct nouveau_timer *, struct nouveau_alarm *);
 };
 
 static inline struct nouveau_timer *
diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/base.c b/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
index 5d417cc..cf8a0e0 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/timer/base.c
@@ -85,3 +85,10 @@ nouveau_timer_alarm(void *obj, u32 nsec, struct nouveau_alarm *alarm)
 	struct nouveau_timer *ptimer = nouveau_timer(obj);
 	ptimer->alarm(ptimer, nsec, alarm);
 }
+
+void
+nouveau_timer_alarm_cancel(void *obj, struct nouveau_alarm *alarm)
+{
+	struct nouveau_timer *ptimer = nouveau_timer(obj);
+	ptimer->alarm_cancel(ptimer, alarm);
+}
diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
index 8c72da6..e0d4fd1 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
@@ -114,6 +114,25 @@ nv04_timer_alarm(struct nouveau_timer *ptimer, u64 time,
 }
 
 static void
+nv04_timer_alarm_cancel(struct nouveau_timer *ptimer,
+			struct nouveau_alarm *alarm)
+{
+	struct nv04_timer_priv *priv = (void *)ptimer;
+	unsigned long flags;
+
+	/* avoid deleting an entry while the alarm intr is running */
+	spin_lock_irqsave(&priv->lock, flags);
+
+	/* delete the alarm from the list */
+	list_del(&alarm->head);
+
+	/* reset the head so as list_empty returns 1 */
+	INIT_LIST_HEAD(&alarm->head);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void
 nv04_timer_intr(struct nouveau_subdev *subdev)
 {
 	struct nv04_timer_priv *priv = (void *)subdev;
@@ -147,6 +166,7 @@ nv04_timer_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	priv->base.base.intr = nv04_timer_intr;
 	priv->base.read = nv04_timer_read;
 	priv->base.alarm = nv04_timer_alarm;
+	priv->base.alarm_cancel = nv04_timer_alarm_cancel;
 	priv->suspend_time = 0;
 
 	INIT_LIST_HEAD(&priv->alarms);
-- 
1.8.3.4
