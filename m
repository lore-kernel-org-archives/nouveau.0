From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/i2c/ch7006: Fix the scale parameter handling.
Date: Tue, 25 Aug 2009 16:23:43 +0200
Message-ID: <1251210223-22942-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/i2c/ch7006_drv.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 76570d6..0a3f7a0 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -464,13 +464,11 @@ static int ch7006_encoder_init(struct i2c_client *client,
 				   ch7006_tv_norm);
 	}
 
-	if (ch7006_scale) {
-		if (ch7006_scale >= 0 && ch7006_scale <= 2)
-			priv->scale = ch7006_scale;
-		else
-			ch7006_err(client, "Invalid scale setting \"%d\".\n",
-				   ch7006_scale);
-	}
+	if (ch7006_scale >= 0 && ch7006_scale <= 2)
+		priv->scale = ch7006_scale;
+	else
+		ch7006_err(client, "Invalid scale setting \"%d\".\n",
+			   ch7006_scale);
 
 	return 0;
 }
@@ -519,7 +517,7 @@ MODULE_PARM_DESC(tv_norm, "Default TV norm.\n"
 		 "\t\tSupported: PAL, PAL-M, PAL-N, PAL-Nc, PAL-60, NTSC-M, NTSC-J.\n"
 		 "\t\tDefault: PAL");
 
-int ch7006_scale = 0;
+int ch7006_scale = 1;
 module_param_named(scale, ch7006_scale, int, 0600);
 MODULE_PARM_DESC(scale, "Default scale.\n"
 		 "\t\tSupported: 0 -> Select video modes with a higher blanking ratio.\n"
-- 
1.6.3.3
