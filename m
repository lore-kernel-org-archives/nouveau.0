From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/8] drm/nouveau/kms/nv50-: Lookup current
 encoder/crtc from atomic state
Date: Fri, 13 Nov 2020 19:14:15 -0500
Message-ID: <20201114001417.155093-7-lyude@redhat.com>
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

Despite being an atomic driver, nouveau has a lot of leftover code that
relies on retrieving information regarding the new atomic state from
members of drm_encoder and drm_crtc. The first field being used,
drm_encoder.crtc, is deprecated for atomic drivers. The second field being
used is drm_crtc.state, which is only really sensible to use outside of an
atomic modeset.

So, add some helpers to lookup the current crtc for a given outp from the
atomic state. Then, convert most of the code in dispnv50/disp.c to use said
new helper, along with the relevant DRM atomic helpers for retrieving the
new encoder/crtc combinations for a new atomic state.

Note that we don't get rid of the nouveau_encoder.crtc field entirely for
three reasons:

- Legacy modesetting for pre-nv50 still uses it
- It doesn't cause any locking issues
- We need it for the HDA callbacks, as grabbing atomic modesetting locks in
  those would be a mess.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 59 ++++++++++++++++---------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2c0749fac9dc..63fff3988f19 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -449,6 +449,22 @@ nv50_outp_get_old_connector(struct drm_atomic_state *state, struct nouveau_encod
 	return NULL;
 }
 
+static struct nouveau_crtc *
+nv50_outp_get_new_crtc(const struct drm_atomic_state *state, const struct nouveau_encoder *outp)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	const u32 mask = drm_encoder_mask(&outp->base.base);
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		if (crtc_state->encoder_mask & mask)
+			return nouveau_crtc(crtc);
+	}
+
+	return NULL;
+}
+
 /******************************************************************************
  * DAC
  *****************************************************************************/
@@ -468,8 +484,9 @@ static void
 nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
+	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	u32 ctrl = 0;
 
@@ -490,7 +507,7 @@ nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	core->func->dac->ctrl(core, nv_encoder->or, ctrl, asyh);
 	asyh->or.depth = 0;
 
-	nv_encoder->crtc = encoder->crtc;
+	nv_encoder->crtc = &nv_crtc->base;
 }
 
 static enum drm_connector_status
@@ -719,13 +736,12 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 }
 
 static void
-nv50_audio_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
+nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
+		  struct nouveau_connector *nv_connector, struct drm_atomic_state *state,
 		  struct drm_display_mode *mode)
 {
 	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nouveau_connector *nv_connector;
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
 	struct __packed {
 		struct {
@@ -741,7 +757,6 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 				     (0x0100 << nv_crtc->index),
 	};
 
-	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_monitor_audio(nv_connector->edid))
 		return;
 
@@ -778,12 +793,12 @@ nv50_hdmi_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 }
 
 static void
-nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
+nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
+		 struct nouveau_connector *nv_connector, struct drm_atomic_state *state,
 		 struct drm_display_mode *mode)
 {
 	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
 	struct {
 		struct nv50_disp_mthd_v1 base;
@@ -798,7 +813,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 		.pwr.state = 1,
 		.pwr.rekey = 56, /* binary driver, and tegra, constant */
 	};
-	struct nouveau_connector *nv_connector;
 	struct drm_hdmi_info *hdmi;
 	u32 max_ac_packet;
 	union hdmi_infoframe avi_frame;
@@ -808,7 +822,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 	int ret;
 	int size;
 
-	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
 	if (!drm_detect_hdmi_monitor(nv_connector->edid))
 		return;
 
@@ -854,7 +867,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 		+ args.pwr.vendor_infoframe_length;
 	nvif_mthd(&disp->disp->object, 0, &args, size);
 
-	nv50_audio_enable(encoder, state, mode);
+	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 
 	/* If SCDC is supported by the downstream monitor, update
 	 * divider / scrambling settings to what we programmed above.
@@ -895,6 +908,7 @@ struct nv50_mstc {
 struct nv50_msto {
 	struct drm_encoder encoder;
 
+	/* head is statically assigned on msto creation */
 	struct nv50_head *head;
 	struct nv50_mstc *mstc;
 	bool disabled;
@@ -1055,9 +1069,10 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
 static void
 nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
-	struct nv50_head *head = nv50_head(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(head->base.base.state);
 	struct nv50_msto *msto = nv50_msto(encoder);
+	struct nv50_head *head = msto->head;
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &head->base.base));
 	struct nv50_mstc *mstc = NULL;
 	struct nv50_mstm *mstm = NULL;
 	struct drm_connector *connector;
@@ -1640,8 +1655,9 @@ static void
 nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
+	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct drm_display_mode *mode = &asyh->state.adjusted_mode;
 	struct {
 		struct nv50_disp_mthd_v1 base;
@@ -1662,7 +1678,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	u8 depth = NV837D_SOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT;
 
 	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
-	nv_encoder->crtc = encoder->crtc;
+	nv_encoder->crtc = &nv_crtc->base;
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
@@ -1688,7 +1704,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
 		}
 
-		nv50_hdmi_enable(&nv_encoder->base.base, state, mode);
+		nv50_hdmi_enable(&nv_encoder->base.base, nv_crtc, nv_connector, state, mode);
 		break;
 	case DCB_OUTPUT_LVDS:
 		proto = NV507D_SOR_SET_CONTROL_PROTOCOL_LVDS_CUSTOM;
@@ -1729,7 +1745,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		else
 			proto = NV887D_SOR_SET_CONTROL_PROTOCOL_DP_B;
 
-		nv50_audio_enable(encoder, state, mode);
+		nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 		break;
 	default:
 		BUG();
@@ -1879,8 +1895,9 @@ static void
 nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
-	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
+	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+	struct nv50_head_atom *asyh =
+		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	u32 ctrl = 0;
 
-- 
2.28.0
