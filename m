From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] drm/nouveau: Fix memleak in nv50_wndw_new_
Date: Thu, 24 Dec 2020 21:17:34 +0800
Message-ID: <20201224131736.9584-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

When nv50_lut_init() fails, *pwndw should be freed
just like when drm_universal_plane_init() fails.
It's the same for the subsequent error paths.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0356474ad6f6..47ce1df2ae5f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -732,18 +732,15 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 				       format, nformat,
 				       nouveau_display(dev)->format_modifiers,
 				       type, "%s-%d", name, index);
-	if (ret) {
-		kfree(*pwndw);
-		*pwndw = NULL;
-		return ret;
-	}
+	if (ret)
+		goto err_free;
 
 	drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
 
 	if (wndw->func->ilut) {
 		ret = nv50_lut_init(disp, mmu, &wndw->ilut);
 		if (ret)
-			return ret;
+			goto err_free;
 	}
 
 	wndw->notify.func = nv50_wndw_notify;
@@ -752,26 +749,31 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 		ret = drm_plane_create_zpos_property(&wndw->plane,
 				nv50_wndw_zpos_default(&wndw->plane), 0, 254);
 		if (ret)
-			return ret;
+			goto err_free;
 
 		ret = drm_plane_create_alpha_property(&wndw->plane);
 		if (ret)
-			return ret;
+			goto err_free;
 
 		ret = drm_plane_create_blend_mode_property(&wndw->plane,
 				BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 				BIT(DRM_MODE_BLEND_PREMULTI) |
 				BIT(DRM_MODE_BLEND_COVERAGE));
 		if (ret)
-			return ret;
+			goto err_free;
 	} else {
 		ret = drm_plane_create_zpos_immutable_property(&wndw->plane,
 				nv50_wndw_zpos_default(&wndw->plane));
 		if (ret)
-			return ret;
+			goto err_free;
 	}
 
 	return 0;
+
+err_free:
+	kfree(*pwndw);
+	*pwndw = NULL;
+	return ret;
 }
 
 int
-- 
2.17.1
