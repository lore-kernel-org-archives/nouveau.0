From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/8] drm/nouveau/kms/nv50-: Remove
 (nv_encoder->crtc) checks in ->disable callbacks
Date: Fri, 13 Nov 2020 19:14:11 -0500
Message-ID: <20201114001417.155093-3-lyude@redhat.com>
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

Noticed these in both the disable (which we'll be getting rid of in a
moment) and the atomic disable callbacks: both callback types check whether
or not there's actually a CRTC assigned to the given encoder. However, as
->atomic_disable and ->disable will never be called without a CRTC assigned
to the given encoder there's no point in this check. So just remove it.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 37 ++++++++++++-------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 36d6b6093d16..073ac66b2922 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -460,8 +460,8 @@ nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	const u32 ctrl = NVDEF(NV507D, DAC_SET_CONTROL, OWNER, NONE);
-	if (nv_encoder->crtc)
-		core->func->dac->ctrl(core, nv_encoder->or, ctrl, NULL);
+
+	core->func->dac->ctrl(core, nv_encoder->or, ctrl, NULL);
 	nv_encoder->crtc = NULL;
 	nv50_outp_release(nv_encoder);
 }
@@ -1620,28 +1620,25 @@ nv50_sor_disable(struct drm_encoder *encoder,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector =
 		nv50_outp_get_old_connector(nv_encoder, state);
+	struct drm_dp_aux *aux = &nv_connector->aux;
+	u8 pwr;
 
 	nv_encoder->crtc = NULL;
 
-	if (nv_crtc) {
-		struct drm_dp_aux *aux = &nv_connector->aux;
-		u8 pwr;
+	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
+		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
-		if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
-			int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
-
-			if (ret == 0) {
-				pwr &= ~DP_SET_POWER_MASK;
-				pwr |=  DP_SET_POWER_D3;
-				drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
-			}
+		if (ret == 0) {
+			pwr &= ~DP_SET_POWER_MASK;
+			pwr |=  DP_SET_POWER_D3;
+			drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
 		}
-
-		nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
-		nv50_audio_disable(encoder, nv_crtc);
-		nv50_hdmi_disable(&nv_encoder->base.base, nv_crtc);
-		nv50_outp_release(nv_encoder);
 	}
+
+	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
+	nv50_audio_disable(encoder, nv_crtc);
+	nv50_hdmi_disable(&nv_encoder->base.base, nv_crtc);
+	nv50_outp_release(nv_encoder);
 }
 
 static void
@@ -1877,8 +1874,8 @@ nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
 	const u32 ctrl = NVDEF(NV507D, PIOR_SET_CONTROL, OWNER, NONE);
-	if (nv_encoder->crtc)
-		core->func->pior->ctrl(core, nv_encoder->or, ctrl, NULL);
+
+	core->func->pior->ctrl(core, nv_encoder->or, ctrl, NULL);
 	nv_encoder->crtc = NULL;
 	nv50_outp_release(nv_encoder);
 }
-- 
2.28.0
