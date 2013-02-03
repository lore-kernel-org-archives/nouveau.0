From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau/therm: turn on a fan only when
	crossing threshold in positive direction
Date: Sun,  3 Feb 2013 21:07:55 +0100
Message-ID: <1359922077-3347-1-git-send-email-marcin.slusarz@gmail.com>
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

+ the same for shutdown threshold - seems impossible, but shutdown can fail.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/temp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
index bf9b3ce..8f27b44 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/temp.c
@@ -105,7 +105,7 @@ void nouveau_therm_sensor_event(struct nouveau_therm *therm,
 		return;
 
 	if (dir == NOUVEAU_THERM_THRS_FALLING)
-		nv_info(therm, "temperature (%u C) went bellow the '%s' threshold\n",
+		nv_info(therm, "temperature (%u C) went below the '%s' threshold\n",
 			temperature, thresolds[thrs]);
 	else
 		nv_info(therm, "temperature (%u C) hit the '%s' threshold\n",
@@ -114,8 +114,10 @@ void nouveau_therm_sensor_event(struct nouveau_therm *therm,
 	active = (dir == NOUVEAU_THERM_THRS_RISING);
 	switch (thrs) {
 	case NOUVEAU_THERM_THRS_FANBOOST:
-		nouveau_therm_fan_set(therm, true, 100);
-		nouveau_therm_mode(therm, NOUVEAU_THERM_CTRL_AUTO);
+		if (active) {
+			nouveau_therm_fan_set(therm, true, 100);
+			nouveau_therm_mode(therm, NOUVEAU_THERM_CTRL_AUTO);
+		}
 		break;
 	case NOUVEAU_THERM_THRS_DOWNCLOCK:
 		if (priv->emergency.downclock)
@@ -126,7 +128,8 @@ void nouveau_therm_sensor_event(struct nouveau_therm *therm,
 			priv->emergency.pause(therm, active);
 		break;
 	case NOUVEAU_THERM_THRS_SHUTDOWN:
-		orderly_poweroff(true);
+		if (active)
+			orderly_poweroff(true);
 		break;
 	case NOUVEAU_THERM_THRS_NR:
 		break;
-- 
1.8.1
