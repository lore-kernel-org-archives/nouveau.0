From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/nv50: handle failures in crtc objects
 construction
Date: Sun, 11 Dec 2011 21:03:39 +0100
Message-ID: <20111211200339.GB12385@joi.lan>
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

Fixes oopses / leaks depending on point of failure.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_crtc.c    |   59 +++++++++++++++++++++----------
 drivers/gpu/drm/nouveau/nv50_display.c |    7 +++-
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 8f6c2ac..9fa012d 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -733,18 +733,16 @@ nv50_crtc_create(struct drm_device *dev, int index)
 
 	ret = nouveau_bo_new(dev, 4096, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->lut.nvbo);
-	if (!ret) {
-		ret = nouveau_bo_pin(nv_crtc->lut.nvbo, TTM_PL_FLAG_VRAM);
-		if (!ret)
-			ret = nouveau_bo_map(nv_crtc->lut.nvbo);
-		if (ret)
-			nouveau_bo_ref(NULL, &nv_crtc->lut.nvbo);
-	}
+	if (ret)
+		goto lut_bo_err;
 
-	if (ret) {
-		kfree(nv_crtc);
-		return ret;
-	}
+	ret = nouveau_bo_pin(nv_crtc->lut.nvbo, TTM_PL_FLAG_VRAM);
+	if (ret)
+		goto lut_bo_pin_err;
+
+	ret = nouveau_bo_map(nv_crtc->lut.nvbo);
+	if (ret)
+		goto lut_bo_map_err;
 
 	nv_crtc->index = index;
 
@@ -758,14 +756,37 @@ nv50_crtc_create(struct drm_device *dev, int index)
 
 	ret = nouveau_bo_new(dev, 64*64*4, 0x100, TTM_PL_FLAG_VRAM,
 			     0, 0x0000, &nv_crtc->cursor.nvbo);
-	if (!ret) {
-		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
-		if (!ret)
-			ret = nouveau_bo_map(nv_crtc->cursor.nvbo);
-		if (ret)
-			nouveau_bo_ref(NULL, &nv_crtc->cursor.nvbo);
-	}
+	if (ret)
+		goto cursor_bo_err;
+
+	ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM);
+	if (ret)
+		goto cursor_bo_pin_err;
+
+	ret = nouveau_bo_map(nv_crtc->cursor.nvbo);
+	if (ret)
+		goto cursor_bo_map_err;
+
+	ret = nv50_cursor_init(nv_crtc);
+	if (ret)
+		goto cursor_init_err;
 
-	nv50_cursor_init(nv_crtc);
 	return 0;
+
+cursor_init_err:
+	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
+cursor_bo_map_err:
+	nouveau_bo_unpin(nv_crtc->cursor.nvbo);
+cursor_bo_pin_err:
+	nouveau_bo_ref(NULL, &nv_crtc->cursor.nvbo);
+cursor_bo_err:
+	drm_crtc_cleanup(&nv_crtc->base);
+	nouveau_bo_unmap(nv_crtc->lut.nvbo);
+lut_bo_map_err:
+	nouveau_bo_unpin(nv_crtc->lut.nvbo);
+lut_bo_pin_err:
+	nouveau_bo_ref(NULL, &nv_crtc->lut.nvbo);
+lut_bo_err:
+	kfree(nv_crtc);
+	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 7ba28e0..a1b335b 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -335,8 +335,11 @@ nv50_display_create(struct drm_device *dev)
 	dev_priv->engine.display.priv = priv;
 
 	/* Create CRTC objects */
-	for (i = 0; i < 2; i++)
-		nv50_crtc_create(dev, i);
+	for (i = 0; i < 2; i++) {
+		ret = nv50_crtc_create(dev, i);
+		if (ret)
+			return ret;
+	}
 
 	/* We setup the encoders from the BIOS table */
 	for (i = 0 ; i < dcb->entries; i++) {
-- 
1.7.8.rc3
