From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 6/6] drm/i2c/ch7006: Reject TV norm changes when
	there is a mode set.
Date: Mon, 17 Aug 2009 17:24:23 +0200
Message-ID: <1250522663-18672-6-git-send-email-currojerez@riseup.net>
References: <1250522663-18672-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250522663-18672-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 drivers/gpu/drm/i2c/ch7006_drv.c |   26 ++++++++++++++++++++++++--
 1 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 7df4b86..a890652 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -287,6 +287,8 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
 	struct drm_mode_config *conf = &encoder->dev->mode_config;
+	struct drm_crtc *crtc = encoder->crtc;
+	bool modes_changed = false;
 
 	ch7006_dbg(client, "\n");
 
@@ -314,9 +316,12 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 		ch7006_load_reg(client, state, CH7006_VPOS);
 
 	} else if (property == conf->tv_mode_property) {
+		if (connector->dpms != DRM_MODE_DPMS_OFF)
+			return -EINVAL;
+
 		priv->norm = val;
 
-		drm_helper_probe_single_connector_modes(connector, 0, 0);
+		modes_changed = true;
 
 	} else if (property == conf->tv_brightness_property) {
 		priv->brightness = val;
@@ -340,14 +345,31 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 		ch7006_load_reg(client, state, CH7006_FFILTER);
 
 	} else if (property == priv->scale_property) {
+		if (connector->dpms != DRM_MODE_DPMS_OFF)
+			return -EINVAL;
+
 		priv->scale = val;
 
-		drm_helper_probe_single_connector_modes(connector, 0, 0);
+		modes_changed = true;
 
 	} else {
 		return -EINVAL;
 	}
 
+	if (modes_changed) {
+		drm_helper_probe_single_connector_modes(connector, 0, 0);
+
+		/* Disable the crtc to ensure a full modeset is
+		 * performed whenever it's turned on again. */
+		if (crtc) {
+			struct drm_mode_set modeset = {
+				.crtc = crtc,
+			};
+
+			crtc->funcs->set_config(&modeset);
+		}
+	}
+
 	return 0;
 }
 
-- 
1.6.3.3
