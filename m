From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 5/5] drm/nouveau/therm: survive to suspend/resume
	cycles
Date: Sun, 11 Aug 2013 22:48:52 -0400
Message-ID: <1376275732-2878-6-git-send-email-martin.peres@free.fr>
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

Therm uses 3 ptimer alarms. Two to drive the fan and one for polling the
temperature. When suspending/resuming, alarms will never be fired.
As we are checking if there isn't an alarm pending before rescheduling
another one, we end up never checking temperature or updating the
fan speed.

This commit also adds debug messages to be able to spot more easily
if this case happens again in the future. Sorry for the spam if you
activate the debug level though.

Tested-by: Dash Four <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

v2:
- fix temperature polling too

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/base.c | 10 +++++++++-
 drivers/gpu/drm/nouveau/core/subdev/therm/fan.c  | 19 ++++++++++++++++++-
 drivers/gpu/drm/nouveau/core/subdev/therm/priv.h |  4 ++++
 drivers/gpu/drm/nouveau/core/subdev/therm/temp.c | 21 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/base.c b/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
index 2ada3d7..f1de7a9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
@@ -95,12 +95,14 @@ nouveau_therm_update(struct nouveau_therm *therm, int mode)
 	int duty;
 
 	spin_lock_irqsave(&priv->lock, flags);
+	nv_debug(therm, "FAN speed check\n");
 	if (mode < 0)
 		mode = priv->mode;
 	priv->mode = mode;
 
 	switch (mode) {
 	case NOUVEAU_THERM_CTRL_MANUAL:
+		ptimer->alarm_cancel(ptimer, &priv->alarm);
 		duty = nouveau_therm_fan_get(therm);
 		if (duty < 0)
 			duty = 100;
@@ -113,6 +115,7 @@ nouveau_therm_update(struct nouveau_therm *therm, int mode)
 		break;
 	case NOUVEAU_THERM_CTRL_NONE:
 	default:
+		ptimer->alarm_cancel(ptimer, &priv->alarm);
 		goto done;
 	}
 
@@ -122,6 +125,8 @@ nouveau_therm_update(struct nouveau_therm *therm, int mode)
 done:
 	if (list_empty(&priv->alarm.head) && (mode == NOUVEAU_THERM_CTRL_AUTO))
 		ptimer->alarm(ptimer, 1000000000ULL, &priv->alarm);
+	else if (!list_empty(&priv->alarm.head))
+		nv_debug(therm, "therm fan alarm list is not empty\n");
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
@@ -274,7 +279,8 @@ _nouveau_therm_init(struct nouveau_object *object)
 
 		nouveau_therm_fan_mode(therm, priv->suspend);
 	}
-	priv->sensor.program_alarms(therm);
+	nouveau_therm_sensor_init(therm);
+	nouveau_therm_fan_init(therm);
 	return 0;
 }
 
@@ -284,6 +290,8 @@ _nouveau_therm_fini(struct nouveau_object *object, bool suspend)
 	struct nouveau_therm *therm = (void *)object;
 	struct nouveau_therm_priv *priv = (void *)therm;
 
+	nouveau_therm_fan_fini(therm, suspend);
+	nouveau_therm_sensor_fini(therm, suspend);
 	if (suspend) {
 		priv->suspend = priv->mode;
 		priv->mode = NOUVEAU_THERM_CTRL_NONE;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
index 6d411e1..39f47b9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
@@ -204,6 +204,23 @@ nouveau_therm_fan_safety_checks(struct nouveau_therm *therm)
 }
 
 int
+nouveau_therm_fan_init(struct nouveau_therm *therm)
+{
+	return 0;
+}
+
+int
+nouveau_therm_fan_fini(struct nouveau_therm *therm, bool suspend)
+{
+	struct nouveau_therm_priv *priv = (void *)therm;
+	struct nouveau_timer *ptimer = nouveau_timer(therm);
+
+	if (suspend)
+		ptimer->alarm_cancel(ptimer, &priv->fan->alarm);
+	return 0;
+}
+
+int
 nouveau_therm_fan_ctor(struct nouveau_therm *therm)
 {
 	struct nouveau_therm_priv *priv = (void *)therm;
@@ -233,7 +250,7 @@ nouveau_therm_fan_ctor(struct nouveau_therm *therm)
 	}
 
 	nv_info(therm, "FAN control: %s\n", priv->fan->type);
-	
+
 	/* read the current speed, it is useful when resuming */
 	priv->fan->percent = nouveau_therm_fan_get(therm);
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h
index 15ca64e..dd38529 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h
@@ -113,6 +113,8 @@ void nouveau_therm_ic_ctor(struct nouveau_therm *therm);
 int nouveau_therm_sensor_ctor(struct nouveau_therm *therm);
 
 int nouveau_therm_fan_ctor(struct nouveau_therm *therm);
+int nouveau_therm_fan_init(struct nouveau_therm *therm);
+int nouveau_therm_fan_fini(struct nouveau_therm *therm, bool suspend);
 int nouveau_therm_fan_get(struct nouveau_therm *therm);
 int nouveau_therm_fan_set(struct nouveau_therm *therm, bool now, int percent);
 int nouveau_therm_fan_user_get(struct nouveau_therm *therm);
@@ -122,6 +124,8 @@ int nouveau_therm_fan_sense(struct nouveau_therm *therm);
 
 int nouveau_therm_preinit(struct nouveau_therm *);
 
+int nouveau_therm_sensor_init(struct nouveau_therm *therm);
+int nouveau_therm_sensor_fini(struct nouveau_therm *therm, bool suspend);
 void nouveau_therm_sensor_preinit(struct nouveau_therm *);
 void nouveau_therm_sensor_set_threshold_state(struct nouveau_therm *therm,
 					     enum nouveau_therm_thrs thrs,
diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
index dde746c..b80a330 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
@@ -180,6 +180,8 @@ alarm_timer_callback(struct nouveau_alarm *alarm)
 
 	spin_lock_irqsave(&priv->sensor.alarm_program_lock, flags);
 
+	nv_debug(therm, "polling the internal temperature\n");
+
 	nouveau_therm_threshold_hyst_polling(therm, &sensor->thrs_fan_boost,
 					     NOUVEAU_THERM_THRS_FANBOOST);
 
@@ -216,6 +218,25 @@ nouveau_therm_program_alarms_polling(struct nouveau_therm *therm)
 	alarm_timer_callback(&priv->sensor.therm_poll_alarm);
 }
 
+int
+nouveau_therm_sensor_init(struct nouveau_therm *therm)
+{
+	struct nouveau_therm_priv *priv = (void *)therm;
+	priv->sensor.program_alarms(therm);
+	return 0;
+}
+
+int
+nouveau_therm_sensor_fini(struct nouveau_therm *therm, bool suspend)
+{
+	struct nouveau_therm_priv *priv = (void *)therm;
+	struct nouveau_timer *ptimer = nouveau_timer(therm);
+
+	if (suspend)
+		ptimer->alarm_cancel(ptimer, &priv->sensor.therm_poll_alarm);
+	return 0;
+}
+
 void
 nouveau_therm_sensor_preinit(struct nouveau_therm *therm)
 {
-- 
1.8.3.4
