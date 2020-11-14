From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 8/8] drm/nouveau/kms/nv50-: Fix locking for audio
 callbacks
Date: Fri, 13 Nov 2020 19:14:17 -0500
Message-ID: <20201114001417.155093-9-lyude@redhat.com>
References: <20201114001417.155093-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201114001417.155093-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Noticed that I wasn't paying close enough attention the last time I looked
at our audio callbacks, as I completely missed the fact that we were
figuring out which audio-enabled connector goes to each encoder by checking
it's state, but without grabbing any of the appropriate modesetting locks
to do so.

That being said however: trying to grab modesetting locks in our audio
callbacks would be very painful due to the potential for locking inversion
between HDA and DRM. So, let's instead just copy what i915 does again - add
our own audio lock to protect audio related state, and store each audio
enabled connector in each nouveau_encoder struct so that we don't need to
check any atomic states.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 66 ++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h     |  1 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  7 ++-
 3 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b19d0d7a6de9..65a991846e96 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -607,34 +607,27 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_encoder *encoder;
 	struct nouveau_encoder *nv_encoder;
-	struct drm_connector *connector;
 	struct nouveau_crtc *nv_crtc;
-	struct drm_connector_list_iter conn_iter;
 	int ret = 0;
 
 	*enabled = false;
 
+	mutex_lock(&drm->audio.lock);
+
 	drm_for_each_encoder(encoder, drm->dev) {
 		struct nouveau_connector *nv_connector = NULL;
 
+		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
+			continue; /* TODO */
+
 		nv_encoder = nouveau_encoder(encoder);
+		nv_connector = nouveau_connector(nv_encoder->audio.connector);
+		nv_crtc = nouveau_crtc(nv_encoder->crtc);
 
-		drm_connector_list_iter_begin(drm_dev, &conn_iter);
-		drm_for_each_connector_iter(connector, &conn_iter) {
-			if (connector->state->best_encoder == encoder) {
-				nv_connector = nouveau_connector(connector);
-				break;
-			}
-		}
-		drm_connector_list_iter_end(&conn_iter);
-		if (!nv_connector)
+		if (!nv_crtc || nv_encoder->or != port || nv_crtc->index != dev_id)
 			continue;
 
-		nv_crtc = nouveau_crtc(nv_encoder->crtc);
-		if (!nv_crtc || nv_encoder->or != port ||
-		    nv_crtc->index != dev_id)
-			continue;
-		*enabled = nv_encoder->audio;
+		*enabled = nv_encoder->audio.enabled;
 		if (*enabled) {
 			ret = drm_eld_size(nv_connector->base.eld);
 			memcpy(buf, nv_connector->base.eld,
@@ -643,6 +636,8 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 		break;
 	}
 
+	mutex_unlock(&drm->audio.lock);
+
 	return ret;
 }
 
@@ -692,17 +687,22 @@ static const struct component_ops nv50_audio_component_bind_ops = {
 static void
 nv50_audio_component_init(struct nouveau_drm *drm)
 {
-	if (!component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
-		drm->audio.component_registered = true;
+	if (component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
+		return;
+
+	drm->audio.component_registered = true;
+	mutex_init(&drm->audio.lock);
 }
 
 static void
 nv50_audio_component_fini(struct nouveau_drm *drm)
 {
-	if (drm->audio.component_registered) {
-		component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
-		drm->audio.component_registered = false;
-	}
+	if (!drm->audio.component_registered)
+		return;
+
+	component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
+	drm->audio.component_registered = false;
+	mutex_destroy(&drm->audio.lock);
 }
 
 /******************************************************************************
@@ -725,11 +725,13 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 				(0x0100 << nv_crtc->index),
 	};
 
-	if (!nv_encoder->audio)
-		return;
-
-	nv_encoder->audio = false;
-	nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
+	mutex_lock(&drm->audio.lock);
+	if (nv_encoder->audio.enabled) {
+		nv_encoder->audio.enabled = false;
+		nv_encoder->audio.connector = NULL;
+		nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
+	}
+	mutex_unlock(&drm->audio.lock);
 
 	nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
 					nv_crtc->index);
@@ -760,11 +762,16 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	if (!drm_detect_monitor_audio(nv_connector->edid))
 		return;
 
+	mutex_lock(&drm->audio.lock);
+
 	memcpy(args.data, nv_connector->base.eld, sizeof(args.data));
 
 	nvif_mthd(&disp->disp->object, 0, &args,
 		  sizeof(args.base) + drm_eld_size(args.data));
-	nv_encoder->audio = true;
+	nv_encoder->audio.enabled = true;
+	nv_encoder->audio.connector = &nv_connector->base;
+
+	mutex_unlock(&drm->audio.lock);
 
 	nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
 					nv_crtc->index);
@@ -1633,8 +1640,6 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	u8 pwr;
 
-	nv_encoder->crtc = NULL;
-
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
 		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
@@ -1649,6 +1654,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	nv50_audio_disable(encoder, nv_crtc);
 	nv50_hdmi_disable(&nv_encoder->base.base, nv_crtc);
 	nv50_outp_release(nv_encoder);
+	nv_encoder->crtc = NULL;
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9d04d1b36434..d91bf9c78976 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -222,6 +222,7 @@ struct nouveau_drm {
 
 	struct {
 		struct drm_audio_component *component;
+		struct mutex lock;
 		bool component_registered;
 	} audio;
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 0dea219a666e..1ffcc0a491fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -53,7 +53,12 @@ struct nouveau_encoder {
 	 * actually programmed on the hw, not the proposed crtc */
 	struct drm_crtc *crtc;
 	u32 ctrl;
-	bool audio;
+
+	/* Protected by nouveau_drm.audio.lock */
+	struct {
+		bool enabled;
+		struct drm_connector *connector;
+	} audio;
 
 	struct drm_display_mode mode;
 	int last_dpms;
-- 
2.28.0
