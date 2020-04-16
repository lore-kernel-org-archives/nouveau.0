From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix regression by audio component
 transition
Date: Thu, 16 Apr 2020 09:54:28 +0200
Message-ID: <20200416075428.25521-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Since the commit 742db30c4ee6 ("drm/nouveau: Add HD-audio component
notifier support"), the nouveau driver notifies and pokes the HD-audio
HPD and ELD via audio component, but this seems broken.  The culprit
is the naive assumption that crtc->index corresponds to the HDA pin.
Actually this rather corresponds to the MST dev_id (alias "pipe" in
the audio component framework) while the actual port number is given
from the output ior id number.

This patch corrects the assignment of port and dev_id arguments in the
audio component ops to recover from the HDMI/DP audio regression.

Fixes: 742db30c4ee6 ("drm/nouveau: Add HD-audio component notifier support")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207223
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a3dc2ba19fb2..3a9fd565079d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -481,15 +481,16 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
  * audio component binding for ELD notification
  */
 static void
-nv50_audio_component_eld_notify(struct drm_audio_component *acomp, int port)
+nv50_audio_component_eld_notify(struct drm_audio_component *acomp, int port,
+				int dev_id)
 {
 	if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
 		acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
-						 port, -1);
+						 port, dev_id);
 }
 
 static int
-nv50_audio_component_get_eld(struct device *kdev, int port, int pipe,
+nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 			     bool *enabled, unsigned char *buf, int max_bytes)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
@@ -505,7 +506,8 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int pipe,
 		nv_encoder = nouveau_encoder(encoder);
 		nv_connector = nouveau_encoder_connector_get(nv_encoder);
 		nv_crtc = nouveau_crtc(encoder->crtc);
-		if (!nv_connector || !nv_crtc || nv_crtc->index != port)
+		if (!nv_connector || !nv_crtc || nv_encoder->or != port ||
+		    nv_crtc->index != dev_id)
 			continue;
 		*enabled = drm_detect_monitor_audio(nv_connector->edid);
 		if (*enabled) {
@@ -599,7 +601,8 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 
 	nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
 
-	nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
+	nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
+					nv_crtc->index);
 }
 
 static void
@@ -633,7 +636,8 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_display_mode *mode)
 	nvif_mthd(&disp->disp->object, 0, &args,
 		  sizeof(args.base) + drm_eld_size(args.data));
 
-	nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
+	nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
+					nv_crtc->index);
 }
 
 /******************************************************************************
-- 
2.16.4
