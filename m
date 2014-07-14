From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm/nouveau/therm: fix a potential deadlock in
	the therm monitoring code
Date: Mon, 14 Jul 2014 11:12:56 +0200
Message-ID: <1405329176-19964-1-git-send-email-martin.peres@free.fr>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Tested-by: Stefan Ringel <mail-Omqj8X2OoDOCVLKmEEjRFg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/temp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
index cfde9eb..6212537 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
@@ -192,11 +192,11 @@ alarm_timer_callback(struct nouveau_alarm *alarm)
 	nouveau_therm_threshold_hyst_polling(therm, &sensor->thrs_shutdown,
 					     NOUVEAU_THERM_THRS_SHUTDOWN);
 
+	spin_unlock_irqrestore(&priv->sensor.alarm_program_lock, flags);
+
 	/* schedule the next poll in one second */
 	if (therm->temp_get(therm) >= 0 && list_empty(&alarm->head))
-		ptimer->alarm(ptimer, 1000 * 1000 * 1000, alarm);
-
-	spin_unlock_irqrestore(&priv->sensor.alarm_program_lock, flags);
+		ptimer->alarm(ptimer, 1000000000ULL, alarm);
 }
 
 void
-- 
2.0.1
