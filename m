From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 5/6] drm/nouveau: Reject TV norm changes when
	there is a mode set.
Date: Mon, 17 Aug 2009 17:24:22 +0200
Message-ID: <1250522663-18672-5-git-send-email-currojerez@riseup.net>
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
 drivers/gpu/drm/nouveau/nv17_tv.c |   22 +++++++++++++++++++++-
 1 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
index fdc28b1..9d8e678 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -508,8 +508,10 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
 				uint64_t val)
 {
 	struct drm_mode_config *conf = &encoder->dev->mode_config;
+	struct drm_crtc *crtc = encoder->crtc;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
+	bool modes_changed = false;
 
 	if (property == conf->tv_overscan_property) {
 		tv_enc->overscan = val;
@@ -543,8 +545,12 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
 			nv17_tv_update_rescaler(encoder);
 
 	} else if (property == conf->tv_mode_property) {
+		if (connector->dpms != DRM_MODE_DPMS_OFF)
+			return -EINVAL;
+
 		tv_enc->tv_norm = val;
-		drm_helper_probe_single_connector_modes(connector, 0, 0);
+
+		modes_changed = true;
 
 	} else if (property == conf->tv_select_subconnector_property) {
 		if (tv_norm->kind != TV_ENC_MODE)
@@ -557,6 +563,20 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
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
