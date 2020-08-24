From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Log SOR/PIOR caps
Date: Mon, 24 Aug 2020 14:32:53 -0400
Message-ID: <20200824183253.826343-3-lyude@redhat.com>
References: <20200824183253.826343-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200824183253.826343-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Manasi Navare <manasi.d.navare-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Since I'm almost certain I didn't get capability checking right for
pre-volta chipsets, let's start logging any caps we find to make things
like this obvious in the future.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 800b7757252e3..6210ee1c145a2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -258,6 +258,14 @@ evo_kick(u32 *push, struct nv50_dmac *evoc)
 /******************************************************************************
  * Output path helpers
  *****************************************************************************/
+static void
+nv50_outp_dump_caps(struct nouveau_drm *drm,
+		    struct nouveau_encoder *outp)
+{
+	NV_DEBUG(drm, "%s caps: dp_interlace=%d\n",
+		 outp->base.base.name, outp->caps.dp_interlace);
+}
+
 static void
 nv50_outp_release(struct nouveau_encoder *nv_encoder)
 {
@@ -1715,6 +1723,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_connector_attach_encoder(connector, encoder);
 
 	disp->core->func->sor->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv50_outp_dump_caps(drm, nv_encoder);
 
 	if (dcbe->type == DCB_OUTPUT_DP) {
 		struct nvkm_i2c_aux *aux =
@@ -1875,6 +1884,7 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_connector_attach_encoder(connector, encoder);
 
 	disp->core->func->pior->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv50_outp_dump_caps(drm, nv_encoder);
 
 	return 0;
 }
-- 
2.26.2
