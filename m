From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/8] drm/nouveau/kms/nv50-: Use atomic encoder
 callbacks everywhere
Date: Fri, 13 Nov 2020 19:14:10 -0500
Message-ID: <20201114001417.155093-2-lyude@redhat.com>
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
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "Kirill A . Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

It turns out that I forgot to go through and make sure that I converted all
encoder callbacks to use atomic_enable/atomic_disable(), so let's go and
actually do that.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kirill A. Shutemov <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Fixes: 09838c4efe9a ("drm/nouveau/kms: Search for encoders' connectors properly")
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 29 ++++++++++++-------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b111fe24a06b..36d6b6093d16 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -455,7 +455,7 @@ nv50_outp_get_old_connector(struct nouveau_encoder *outp,
  * DAC
  *****************************************************************************/
 static void
-nv50_dac_disable(struct drm_encoder *encoder)
+nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
@@ -467,7 +467,7 @@ nv50_dac_disable(struct drm_encoder *encoder)
 }
 
 static void
-nv50_dac_enable(struct drm_encoder *encoder)
+nv50_dac_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -525,8 +525,8 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 static const struct drm_encoder_helper_funcs
 nv50_dac_help = {
 	.atomic_check = nv50_outp_atomic_check,
-	.enable = nv50_dac_enable,
-	.disable = nv50_dac_disable,
+	.atomic_enable = nv50_dac_enable,
+	.atomic_disable = nv50_dac_disable,
 	.detect = nv50_dac_detect
 };
 
@@ -1055,7 +1055,7 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
 }
 
 static void
-nv50_msto_enable(struct drm_encoder *encoder)
+nv50_msto_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_head *head = nv50_head(encoder->crtc);
 	struct nv50_head_atom *armh = nv50_head_atom(head->base.base.state);
@@ -1101,7 +1101,7 @@ nv50_msto_enable(struct drm_encoder *encoder)
 }
 
 static void
-nv50_msto_disable(struct drm_encoder *encoder)
+nv50_msto_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_msto *msto = nv50_msto(encoder);
 	struct nv50_mstc *mstc = msto->mstc;
@@ -1118,8 +1118,8 @@ nv50_msto_disable(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs
 nv50_msto_help = {
-	.disable = nv50_msto_disable,
-	.enable = nv50_msto_enable,
+	.atomic_disable = nv50_msto_disable,
+	.atomic_enable = nv50_msto_enable,
 	.atomic_check = nv50_msto_atomic_check,
 };
 
@@ -1645,8 +1645,7 @@ nv50_sor_disable(struct drm_encoder *encoder,
 }
 
 static void
-nv50_sor_enable(struct drm_encoder *encoder,
-		struct drm_atomic_state *state)
+nv50_sor_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -1873,7 +1872,7 @@ nv50_pior_atomic_check(struct drm_encoder *encoder,
 }
 
 static void
-nv50_pior_disable(struct drm_encoder *encoder)
+nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
@@ -1885,7 +1884,7 @@ nv50_pior_disable(struct drm_encoder *encoder)
 }
 
 static void
-nv50_pior_enable(struct drm_encoder *encoder)
+nv50_pior_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -1921,14 +1920,14 @@ nv50_pior_enable(struct drm_encoder *encoder)
 	}
 
 	core->func->pior->ctrl(core, nv_encoder->or, ctrl, asyh);
-	nv_encoder->crtc = encoder->crtc;
+	nv_encoder->crtc = &nv_crtc->base;
 }
 
 static const struct drm_encoder_helper_funcs
 nv50_pior_help = {
 	.atomic_check = nv50_pior_atomic_check,
-	.enable = nv50_pior_enable,
-	.disable = nv50_pior_disable,
+	.atomic_enable = nv50_pior_enable,
+	.atomic_disable = nv50_pior_disable,
 };
 
 static void
-- 
2.28.0
