From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] drm/i2c/ch7006: Add module parameters to set
	the default TV norm and scale.
Date: Sat, 22 Aug 2009 02:11:27 +0200
Message-ID: <1250899888-7945-2-git-send-email-currojerez@riseup.net>
References: <1250899888-7945-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250899888-7945-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 drivers/gpu/drm/i2c/ch7006_drv.c  |   30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i2c/ch7006_priv.h |    2 ++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index a890652..47421ba 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -429,6 +429,7 @@ static int ch7006_encoder_init(struct i2c_client *client,
 			       struct drm_encoder_slave *encoder)
 {
 	struct ch7006_priv *priv;
+	int i;
 
 	ch7006_dbg(client, "\n");
 
@@ -450,6 +451,27 @@ static int ch7006_encoder_init(struct i2c_client *client,
 	priv->vmargin = 50;
 	priv->last_dpms = -1;
 
+	if (ch7006_tv_norm) {
+		for (i = 0; i < NUM_TV_NORMS; i++) {
+			if (!strcmp(ch7006_tv_norm_names[i], ch7006_tv_norm)) {
+				priv->norm = i;
+				break;
+			}
+		}
+
+		if (i == NUM_TV_NORMS)
+			ch7006_err(client, "Invalid TV norm setting \"%s\".\n",
+				   ch7006_tv_norm);
+	}
+
+	if (ch7006_scale) {
+		if (ch7006_scale >= 0 && ch7006_scale <= 2)
+			priv->scale = ch7006_scale;
+		else
+			ch7006_err(client, "Invalid scale setting \"%d\".\n",
+				   ch7006_scale);
+	}
+
 	return 0;
 }
 
@@ -491,6 +513,14 @@ int ch7006_debug = 0;
 module_param_named(debug, ch7006_debug, int, 0600);
 MODULE_PARM_DESC(debug, "Enable debug output.");
 
+char *ch7006_tv_norm = NULL;
+module_param_named(tv_norm, ch7006_tv_norm, charp, 0600);
+MODULE_PARM_DESC(tv_norm, "Default TV norm.");
+
+int ch7006_scale = 0;
+module_param_named(scale, ch7006_scale, int, 0600);
+MODULE_PARM_DESC(scale, "Default scale.");
+
 MODULE_AUTHOR("Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>");
 MODULE_DESCRIPTION("Chrontel ch7006 TV encoder driver");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/i2c/ch7006_priv.h b/drivers/gpu/drm/i2c/ch7006_priv.h
index 7ebb073..576bbea 100644
--- a/drivers/gpu/drm/i2c/ch7006_priv.h
+++ b/drivers/gpu/drm/i2c/ch7006_priv.h
@@ -101,6 +101,8 @@ struct ch7006_priv {
 #define to_ch7006_priv(x) ((struct ch7006_priv *)to_encoder_slave(x)->slave_priv)
 
 extern int ch7006_debug;
+extern char *ch7006_tv_norm;
+extern int ch7006_scale;
 
 extern char *ch7006_tv_norm_names[];
 extern struct ch7006_tv_norm_info ch7006_tv_norms[];
-- 
1.6.3.3
