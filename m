From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] pm/fan: drop the fan lock in fan_update() before
	rescheduling
Date: Fri, 14 Mar 2014 00:48:23 +0100
Message-ID: <1394754503-22066-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

This should fix a deadlock that has been reported to us where fan_update()
would hold the fan lock and try to grab the alarm_program_lock to reschedule
an update. On an other CPU, the alarm_program_lock would have been taken
before calling fan_update(), leading to a deadlock.

Reported-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 nvkm/subdev/therm/fan.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/nvkm/subdev/therm/fan.c b/nvkm/subdev/therm/fan.c
index 95f6129..29d4c41 100644
--- a/nvkm/subdev/therm/fan.c
+++ b/nvkm/subdev/therm/fan.c
@@ -54,8 +54,10 @@ nouveau_fan_update(struct nouveau_fan *fan, bool immediate, int target)
 
 	/* check that we're not already at the target duty cycle */
 	duty = fan->get(therm);
-	if (duty == target)
-		goto done;
+	if (duty == target) {
+		spin_unlock_irqrestore(&fan->lock, flags);
+		return 0;
+	}
 
 	/* smooth out the fanspeed increase/decrease */
 	if (!immediate && duty >= 0) {
@@ -73,8 +75,15 @@ nouveau_fan_update(struct nouveau_fan *fan, bool immediate, int target)
 
 	nv_debug(therm, "FAN update: %d\n", duty);
 	ret = fan->set(therm, duty);
-	if (ret)
-		goto done;
+	if (ret) {
+		spin_unlock_irqrestore(&fan->lock, flags);
+		return ret;
+	}
+
+	/* fan speed updated, drop the fan lock before grabbing the
+	 * alarm-scheduling lock and risking a deadlock
+	 */
+	spin_unlock_irqrestore(&fan->lock, flags);
 
 	/* schedule next fan update, if not at target speed already */
 	if (list_empty(&fan->alarm.head) && target != duty) {
@@ -92,8 +101,6 @@ nouveau_fan_update(struct nouveau_fan *fan, bool immediate, int target)
 		ptimer->alarm(ptimer, delay * 1000 * 1000, &fan->alarm);
 	}
 
-done:
-	spin_unlock_irqrestore(&fan->lock, flags);
 	return ret;
 }
 
-- 
1.9.0
