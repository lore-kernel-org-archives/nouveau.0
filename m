From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau/therm: use workqueue to shutdown
	the machine
Date: Sun,  3 Feb 2013 21:07:57 +0100
Message-ID: <1359922077-3347-3-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

orderly_poweroff cannot be called from atomic context.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/temp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
index 8f27b44..b37624a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
@@ -90,6 +90,13 @@ nouveau_therm_sensor_get_threshold_state(struct nouveau_therm *therm,
 	return priv->sensor.alarm_state[thrs];
 }
 
+static void
+nv_poweroff_work(struct work_struct *work)
+{
+	orderly_poweroff(true);
+	kfree(work);
+}
+
 void nouveau_therm_sensor_event(struct nouveau_therm *therm,
 			        enum nouveau_therm_thrs thrs,
 			        enum nouveau_therm_thrs_direction dir)
@@ -128,8 +135,15 @@ void nouveau_therm_sensor_event(struct nouveau_therm *therm,
 			priv->emergency.pause(therm, active);
 		break;
 	case NOUVEAU_THERM_THRS_SHUTDOWN:
-		if (active)
-			orderly_poweroff(true);
+		if (active) {
+			struct work_struct *work;
+
+			work = kmalloc(sizeof(*work), GFP_ATOMIC);
+			if (work) {
+				INIT_WORK(work, nv_poweroff_work);
+				schedule_work(work);
+			}
+		}
 		break;
 	case NOUVEAU_THERM_THRS_NR:
 		break;
-- 
1.8.1
