From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/5] drm/nouveau/fan: restore the PWM value on
	resume when using the manual or auto mode
Date: Sun, 11 Aug 2013 22:48:49 -0400
Message-ID: <1376275732-2878-3-git-send-email-martin.peres@free.fr>
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

If the fan was in manual or auto mode, we should restore the fan speed that was
previously set when resuming.

The initial pwm value is saved when loading the module.

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Dash Four <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/base.c | 7 ++++++-
 drivers/gpu/drm/nouveau/core/subdev/therm/fan.c  | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/base.c b/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
index 3e9d941..2ada3d7 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
@@ -267,8 +267,13 @@ _nouveau_therm_init(struct nouveau_object *object)
 	if (ret)
 		return ret;
 
-	if (priv->suspend >= 0)
+	if (priv->suspend >= 0) {
+		/* restore the pwm value only when on manual or auto mode */
+		if (priv->suspend > 0)
+			nouveau_therm_fan_set(therm, true, priv->fan->percent);
+
 		nouveau_therm_fan_mode(therm, priv->suspend);
+	}
 	priv->sensor.program_alarms(therm);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
index c728380..6d411e1 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
@@ -233,6 +233,9 @@ nouveau_therm_fan_ctor(struct nouveau_therm *therm)
 	}
 
 	nv_info(therm, "FAN control: %s\n", priv->fan->type);
+	
+	/* read the current speed, it is useful when resuming */
+	priv->fan->percent = nouveau_therm_fan_get(therm);
 
 	/* attempt to detect a tachometer connection */
 	ret = gpio->find(gpio, 0, DCB_GPIO_FAN_SENSE, 0xff, &priv->fan->tach);
-- 
1.8.3.4
