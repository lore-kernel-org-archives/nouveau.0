From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/8] drm/nouveau/kms/nv50-: Rename
 encoder->atomic_(enable|disable) callbacks
Date: Fri, 13 Nov 2020 19:14:12 -0500
Message-ID: <20201114001417.155093-4-lyude@redhat.com>
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

No functional changes, just change the function names to match the
callbacks they provide.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 33 ++++++++++++-------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 073ac66b2922..a47be145827e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -455,7 +455,7 @@ nv50_outp_get_old_connector(struct nouveau_encoder *outp,
  * DAC
  *****************************************************************************/
 static void
-nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_dac_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
@@ -467,7 +467,7 @@ nv50_dac_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 }
 
 static void
-nv50_dac_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -525,8 +525,8 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 static const struct drm_encoder_helper_funcs
 nv50_dac_help = {
 	.atomic_check = nv50_outp_atomic_check,
-	.atomic_enable = nv50_dac_enable,
-	.atomic_disable = nv50_dac_disable,
+	.atomic_enable = nv50_dac_atomic_enable,
+	.atomic_disable = nv50_dac_atomic_disable,
 	.detect = nv50_dac_detect
 };
 
@@ -1055,7 +1055,7 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
 }
 
 static void
-nv50_msto_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_head *head = nv50_head(encoder->crtc);
 	struct nv50_head_atom *armh = nv50_head_atom(head->base.base.state);
@@ -1101,7 +1101,7 @@ nv50_msto_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 }
 
 static void
-nv50_msto_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_msto_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_msto *msto = nv50_msto(encoder);
 	struct nv50_mstc *mstc = msto->mstc;
@@ -1118,8 +1118,8 @@ nv50_msto_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 
 static const struct drm_encoder_helper_funcs
 nv50_msto_help = {
-	.atomic_disable = nv50_msto_disable,
-	.atomic_enable = nv50_msto_enable,
+	.atomic_disable = nv50_msto_atomic_disable,
+	.atomic_enable = nv50_msto_atomic_enable,
 	.atomic_check = nv50_msto_atomic_check,
 };
 
@@ -1613,8 +1613,7 @@ nv50_sor_update(struct nouveau_encoder *nv_encoder, u8 head,
 }
 
 static void
-nv50_sor_disable(struct drm_encoder *encoder,
-		 struct drm_atomic_state *state)
+nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
@@ -1642,7 +1641,7 @@ nv50_sor_disable(struct drm_encoder *encoder,
 }
 
 static void
-nv50_sor_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -1747,8 +1746,8 @@ nv50_sor_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 static const struct drm_encoder_helper_funcs
 nv50_sor_help = {
 	.atomic_check = nv50_outp_atomic_check,
-	.atomic_enable = nv50_sor_enable,
-	.atomic_disable = nv50_sor_disable,
+	.atomic_enable = nv50_sor_atomic_enable,
+	.atomic_disable = nv50_sor_atomic_disable,
 };
 
 static void
@@ -1869,7 +1868,7 @@ nv50_pior_atomic_check(struct drm_encoder *encoder,
 }
 
 static void
-nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_pior_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_core *core = nv50_disp(encoder->dev)->core;
@@ -1881,7 +1880,7 @@ nv50_pior_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 }
 
 static void
-nv50_pior_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -1923,8 +1922,8 @@ nv50_pior_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 static const struct drm_encoder_helper_funcs
 nv50_pior_help = {
 	.atomic_check = nv50_pior_atomic_check,
-	.atomic_enable = nv50_pior_enable,
-	.atomic_disable = nv50_pior_disable,
+	.atomic_enable = nv50_pior_atomic_enable,
+	.atomic_disable = nv50_pior_atomic_disable,
 };
 
 static void
-- 
2.28.0
