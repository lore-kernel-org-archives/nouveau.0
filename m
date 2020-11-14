From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/8] drm/nouveau/kms/nv50-: Reverse args for
 nv50_outp_get_(old|new)_connector()
Date: Fri, 13 Nov 2020 19:14:14 -0500
Message-ID: <20201114001417.155093-6-lyude@redhat.com>
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

Just to be more consistent with the order of args that DRM helpers like
drm_atomic_get_new_crtc_state() use.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 15 ++++++---------
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  6 ++----
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index cbcf3ef517dc..2c0749fac9dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -418,8 +418,7 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
 }
 
 struct nouveau_connector *
-nv50_outp_get_new_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state)
+nv50_outp_get_new_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
@@ -435,8 +434,7 @@ nv50_outp_get_new_connector(struct nouveau_encoder *outp,
 }
 
 struct nouveau_connector *
-nv50_outp_get_old_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state)
+nv50_outp_get_old_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
@@ -743,7 +741,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 				     (0x0100 << nv_crtc->index),
 	};
 
-	nv_connector = nv50_outp_get_new_connector(nv_encoder, state);
+	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_monitor_audio(nv_connector->edid))
 		return;
 
@@ -810,7 +808,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 	int ret;
 	int size;
 
-	nv_connector = nv50_outp_get_new_connector(nv_encoder, state);
+	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_hdmi_monitor(nv_connector->edid))
 		return;
 
@@ -1616,8 +1614,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
-	struct nouveau_connector *nv_connector =
-		nv50_outp_get_old_connector(nv_encoder, state);
+	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	u8 pwr;
 
@@ -1664,7 +1661,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	u8 proto = NV507D_SOR_SET_CONTROL_PROTOCOL_CUSTOM;
 	u8 depth = NV837D_SOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT;
 
-	nv_connector = nv50_outp_get_new_connector(nv_encoder, state);
+	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	nv_encoder->crtc = encoder->crtc;
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 21937f1c7dd9..0dea219a666e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -141,11 +141,9 @@ enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
 					unsigned *clock);
 
 struct nouveau_connector *
-nv50_outp_get_new_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state);
+nv50_outp_get_new_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp);
 struct nouveau_connector *
-nv50_outp_get_old_connector(struct nouveau_encoder *outp,
-			    struct drm_atomic_state *state);
+nv50_outp_get_old_connector(struct drm_atomic_state *state, struct nouveau_encoder *outp);
 
 int nv50_mstm_detect(struct nouveau_encoder *encoder);
 void nv50_mstm_remove(struct nv50_mstm *mstm);
-- 
2.28.0
