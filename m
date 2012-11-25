From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: unpin various bo's before destroying
Date: Sun, 25 Nov 2012 23:04:23 +0100
Message-ID: <20121125220423.GE13248@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

These objects leak VRAM - but only on module unload.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_crtc.c    |  6 +++++-
 drivers/gpu/drm/nouveau/nv10_fence.c   |  7 ++++++-
 drivers/gpu/drm/nouveau/nv50_display.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/nouveau/nv50_fence.c   |  5 ++++-
 drivers/gpu/drm/nouveau/nvc0_fence.c   |  7 ++++++-
 5 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 82a0d9c..6578cd2 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -730,6 +730,7 @@ static void nv_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 
 	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
+	nouveau_bo_unpin(nv_crtc->cursor.nvbo);
 	nouveau_bo_ref(NULL, &nv_crtc->cursor.nvbo);
 	kfree(nv_crtc);
 }
@@ -1056,8 +1057,11 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 			     0, 0x0000, NULL, &nv_crtc->cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
-		if (!ret)
+		if (!ret) {
 			ret = nouveau_bo_map(nv_crtc->cursor.nvbo);
+			if (ret)
+				nouveau_bo_unpin(nv_crtc->cursor.nvbo);
+		}
 		if (ret)
 			nouveau_bo_ref(NULL, &nv_crtc->cursor.nvbo);
 	}
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index ce752bf..7ae7f97 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -155,6 +155,8 @@ nv10_fence_destroy(struct nouveau_drm *drm)
 {
 	struct nv10_fence_priv *priv = drm->fence;
 	nouveau_bo_unmap(priv->bo);
+	if (priv->bo)
+		nouveau_bo_unpin(priv->bo);
 	nouveau_bo_ref(NULL, &priv->bo);
 	drm->fence = NULL;
 	kfree(priv);
@@ -183,8 +185,11 @@ nv10_fence_create(struct nouveau_drm *drm)
 				     0, 0x0000, NULL, &priv->bo);
 		if (!ret) {
 			ret = nouveau_bo_pin(priv->bo, TTM_PL_FLAG_VRAM);
-			if (!ret)
+			if (!ret) {
 				ret = nouveau_bo_map(priv->bo);
+				if (ret)
+					nouveau_bo_unpin(priv->bo);
+			}
 			if (ret)
 				nouveau_bo_ref(NULL, &priv->bo);
 		}
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index b252dbe..3587408 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1228,8 +1228,12 @@ nv50_crtc_destroy(struct drm_crtc *crtc)
 	nv50_dmac_destroy(disp->core, &head->sync.base);
 	nv50_pioc_destroy(disp->core, &head->curs.base);
 	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
+	if (nv_crtc->cursor.nvbo)
+		nouveau_bo_unpin(nv_crtc->cursor.nvbo);
 	nouveau_bo_ref(NULL, &nv_crtc->cursor.nvbo);
 	nouveau_bo_unmap(nv_crtc->lut.nvbo);
+	if (nv_crtc->lut.nvbo)
+		nouveau_bo_unpin(nv_crtc->lut.nvbo);
 	nouveau_bo_ref(NULL, &nv_crtc->lut.nvbo);
 	drm_crtc_cleanup(crtc);
 	kfree(crtc);
@@ -1300,8 +1304,11 @@ nv50_crtc_create(struct drm_device *dev, struct nouveau_object *core, int index)
 			     0, 0x0000, NULL, &head->base.lut.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(head->base.lut.nvbo, TTM_PL_FLAG_VRAM);
-		if (!ret)
+		if (!ret) {
 			ret = nouveau_bo_map(head->base.lut.nvbo);
+			if (ret)
+				nouveau_bo_unpin(head->base.lut.nvbo);
+		}
 		if (ret)
 			nouveau_bo_ref(NULL, &head->base.lut.nvbo);
 	}
@@ -1324,8 +1331,11 @@ nv50_crtc_create(struct drm_device *dev, struct nouveau_object *core, int index)
 			     0, 0x0000, NULL, &head->base.cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(head->base.cursor.nvbo, TTM_PL_FLAG_VRAM);
-		if (!ret)
+		if (!ret) {
 			ret = nouveau_bo_map(head->base.cursor.nvbo);
+			if (ret)
+				nouveau_bo_unpin(head->base.lut.nvbo);
+		}
 		if (ret)
 			nouveau_bo_ref(NULL, &head->base.cursor.nvbo);
 	}
@@ -1917,6 +1927,8 @@ nv50_display_destroy(struct drm_device *dev)
 	nv50_dmac_destroy(disp->core, &disp->mast.base);
 
 	nouveau_bo_unmap(disp->sync);
+	if (disp->sync)
+		nouveau_bo_unpin(disp->sync);
 	nouveau_bo_ref(NULL, &disp->sync);
 
 	nouveau_display(dev)->priv = NULL;
@@ -1957,8 +1969,11 @@ nv50_display_create(struct drm_device *dev)
 			     0, 0x0000, NULL, &disp->sync);
 	if (!ret) {
 		ret = nouveau_bo_pin(disp->sync, TTM_PL_FLAG_VRAM);
-		if (!ret)
+		if (!ret) {
 			ret = nouveau_bo_map(disp->sync);
+			if (ret)
+				nouveau_bo_unpin(disp->sync);
+		}
 		if (ret)
 			nouveau_bo_ref(NULL, &disp->sync);
 	}
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index e0763ea..c20f272 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -110,8 +110,11 @@ nv50_fence_create(struct nouveau_drm *drm)
 			     0, 0x0000, NULL, &priv->bo);
 	if (!ret) {
 		ret = nouveau_bo_pin(priv->bo, TTM_PL_FLAG_VRAM);
-		if (!ret)
+		if (!ret) {
 			ret = nouveau_bo_map(priv->bo);
+			if (ret)
+				nouveau_bo_unpin(priv->bo);
+		}
 		if (ret)
 			nouveau_bo_ref(NULL, &priv->bo);
 	}
diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c b/drivers/gpu/drm/nouveau/nvc0_fence.c
index 2747baaa..2a56b1b 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fence.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fence.c
@@ -190,6 +190,8 @@ nvc0_fence_destroy(struct nouveau_drm *drm)
 {
 	struct nvc0_fence_priv *priv = drm->fence;
 	nouveau_bo_unmap(priv->bo);
+	if (priv->bo)
+		nouveau_bo_unpin(priv->bo);
 	nouveau_bo_ref(NULL, &priv->bo);
 	drm->fence = NULL;
 	kfree(priv);
@@ -219,8 +221,11 @@ nvc0_fence_create(struct nouveau_drm *drm)
 			     TTM_PL_FLAG_VRAM, 0, 0, NULL, &priv->bo);
 	if (ret == 0) {
 		ret = nouveau_bo_pin(priv->bo, TTM_PL_FLAG_VRAM);
-		if (ret == 0)
+		if (ret == 0) {
 			ret = nouveau_bo_map(priv->bo);
+			if (ret)
+				nouveau_bo_unpin(priv->bo);
+		}
 		if (ret)
 			nouveau_bo_ref(NULL, &priv->bo);
 	}
-- 
1.7.12
