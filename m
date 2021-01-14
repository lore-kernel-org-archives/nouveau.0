From: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Subject: [PATCH] drm/nouveau/dispnv50: cleanup on
 nv50_head_atom_get failure
Date: Thu, 14 Jan 2021 22:44:06 +0100
Message-ID: <20210114214406.77976-1-contact@emersion.fr>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When nv50_head_atom_get fails, we need to un-do everything we've
done so far: release the fence and unpin the BO.

Signed-off-by: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0356474ad6f6..60aabb1bc095 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -562,8 +562,12 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 
 	if (wndw->func->prepare) {
 		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
-		if (IS_ERR(asyh))
+		if (IS_ERR(asyh)) {
+			dma_fence_put(asyw->state.fence);
+			asyw->state.fence = NULL;
+			nouveau_bo_unpin(nvbo);
 			return PTR_ERR(asyh);
+		}
 
 		wndw->func->prepare(wndw, asyh, asyw);
 	}
-- 
2.30.0
