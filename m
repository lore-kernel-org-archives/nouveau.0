From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v5 03/10] drm/nouveau/kms/nv50-: Unroll error
 cleanup in nv50_head_create()
Date: Mon, 22 Jun 2020 16:07:23 -0400
Message-ID: <20200622200730.120716-4-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200622200730.120716-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

We'll be rolling back more things in this function, and the way it's
structured is a bit confusing. So, let's clean this up a bit and just
unroll in the event of failure.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 8f6455697ba72..e29ea40e7c334 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -507,20 +507,28 @@ nv50_head_create(struct drm_device *dev, int index)
 
 	if (disp->disp->object.oclass < GV100_DISP) {
 		ret = nv50_base_new(drm, head->base.index, &base);
+		if (ret)
+			goto fail_free;
+
 		ret = nv50_ovly_new(drm, head->base.index, &ovly);
+		if (ret)
+			goto fail_free;
 	} else {
 		ret = nv50_wndw_new(drm, DRM_PLANE_TYPE_PRIMARY,
 				    head->base.index * 2 + 0, &base);
+		if (ret)
+			goto fail_free;
+
 		ret = nv50_wndw_new(drm, DRM_PLANE_TYPE_OVERLAY,
 				    head->base.index * 2 + 1, &ovly);
-	}
-	if (ret == 0)
-		ret = nv50_curs_new(drm, head->base.index, &curs);
-	if (ret) {
-		kfree(head);
-		return ERR_PTR(ret);
+		if (ret)
+			goto fail_free;
 	}
 
+	ret = nv50_curs_new(drm, head->base.index, &curs);
+	if (ret)
+		goto fail_free;
+
 	crtc = &head->base.base;
 	drm_crtc_init_with_planes(dev, crtc, &base->plane, &curs->plane,
 				  &nv50_head_func, "head-%d", head->base.index);
@@ -533,11 +541,16 @@ nv50_head_create(struct drm_device *dev, int index)
 
 	if (head->func->olut_set) {
 		ret = nv50_lut_init(disp, &drm->client.mmu, &head->olut);
-		if (ret) {
-			nv50_head_destroy(crtc);
-			return ERR_PTR(ret);
-		}
+		if (ret)
+			goto fail_crtc_cleanup;
 	}
 
 	return head;
+
+fail_crtc_cleanup:
+	drm_crtc_cleanup(crtc);
+fail_free:
+	kfree(head);
+
+	return ERR_PTR(ret);
 }
-- 
2.26.2
