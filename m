From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 6/8] drm/nouveau: screen_base and lut must be iomem
Date: Mon, 17 Aug 2009 16:42:42 +0300
Message-ID: <1250516564-14193-7-git-send-email-pq@iki.fi>
References: <1250516564-14193-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250516564-14193-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This introduces nvbo_kmap_obj_iovirtual() for cases where the bo memory
is guaranteed (or supposed) to be iomem.

Fbcon assumes screen_base is iomem, and the crtc color LUT must reside
in iomem.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   11 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    2 +-
 drivers/gpu/drm/nouveau/nv50_crtc.c     |    2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 556b0fa..5aca302 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -95,6 +95,17 @@ nouveau_gem_object(struct drm_gem_object *gem)
 	return gem ? gem->driver_private : NULL;
 }
 
+/* TODO: submit equivalent to TTM generic API upstream? */
+static inline void __iomem *
+nvbo_kmap_obj_iovirtual(struct nouveau_bo *nvbo)
+{
+	bool is_iomem;
+	void __iomem *ioptr = (void __force __iomem *)ttm_kmap_obj_virtual(
+						&nvbo->kmap, &is_iomem);
+	WARN_ON_ONCE(ioptr && !is_iomem);
+	return ioptr;
+}
+
 struct mem_block {
 	struct mem_block *next;
 	struct mem_block *prev;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 6a21a70..2c261fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -588,7 +588,7 @@ static int nouveau_fbcon_create(struct drm_device *dev, uint32_t fb_width,
 	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_COPYAREA |
 		      FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_IMAGEBLIT;
 
-	info->screen_base = nouveau_fb->nvbo->kmap.virtual;
+	info->screen_base = nvbo_kmap_obj_iovirtual(nouveau_fb->nvbo);
 	info->screen_size = size;
 
 	info->pseudo_palette = fb->pseudo_palette;
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index f1c67bf..f3dab44 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -43,7 +43,7 @@ nv50_crtc_lut_load(struct nouveau_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
 	uint32_t index = 0, i;
-	void __iomem *lut = crtc->lut.nvbo->kmap.virtual;
+	void __iomem *lut = nvbo_kmap_obj_iovirtual(crtc->lut.nvbo);
 
 	NV_DEBUG(dev, "\n");
 
-- 
1.6.3.3
