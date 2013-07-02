From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: handle framebuffer pinning correctly
Date: Tue, 02 Jul 2013 13:31:21 +0200
Message-ID: <20130702113121.6488.96024.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Unpinning wasn't always handled correctly. The crtc_disable
and nouveau_fbcon_destroy calls needed to unpin but didn't,
resulting in a pin leak.

While debugging this I found some leaks in the error paths of
nouveau_user_framebuffer_create, so I fixed those too.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c |   15 ++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   |    7 +++++++
 drivers/gpu/drm/nouveau/nv50_display.c    |   13 +++++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 165f04a..599abc9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -142,17 +142,22 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 	if (!gem)
 		return ERR_PTR(-ENOENT);
 
+	ret = -ENOMEM;
 	nouveau_fb = kzalloc(sizeof(struct nouveau_framebuffer), GFP_KERNEL);
 	if (!nouveau_fb)
-		return ERR_PTR(-ENOMEM);
+		goto err_unref;
 
 	ret = nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nouveau_gem_object(gem));
-	if (ret) {
-		drm_gem_object_unreference(gem);
-		return ERR_PTR(ret);
-	}
+	if (ret)
+		goto err;
 
 	return &nouveau_fb->base;
+
+err:
+	kfree(nouveau_fb);
+err_unref:
+	drm_gem_object_unreference(gem);
+	return ERR_PTR(ret);
 }
 
 static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index ecbfe69..839b7e7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -385,6 +385,7 @@ out_unlock:
 	mutex_unlock(&dev->struct_mutex);
 	if (chan)
 		nouveau_bo_vma_del(nvbo, &fbcon->nouveau_fb.vma);
+	nouveau_bo_unmap(nvbo);
 out_unpin:
 	nouveau_bo_unpin(nvbo);
 out_unref:
@@ -415,6 +416,12 @@ nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 	}
 
 	if (nouveau_fb->nvbo) {
+		struct drm_crtc *crtc;
+
+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
+			if (nouveau_framebuffer(crtc->fb) == nouveau_fb)
+				nouveau_bo_unpin(nouveau_fb->nvbo);
+
 		nouveau_bo_unmap(nouveau_fb->nvbo);
 		nouveau_bo_vma_del(nouveau_fb->nvbo, &nouveau_fb->vma);
 		nouveau_bo_unpin(nouveau_fb->nvbo);
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index c60bae1..05c9667 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1272,6 +1272,18 @@ nv50_crtc_gamma_set(struct drm_crtc *crtc, u16 *r, u16 *g, u16 *b,
 }
 
 static void
+nv50_crtc_disable(struct drm_crtc *crtc)
+{
+	struct nouveau_framebuffer *nv_fb;
+
+	if (!crtc->fb)
+		return;
+
+	nv_fb = nouveau_framebuffer(crtc->fb);
+	nouveau_bo_unpin(nv_fb->nvbo);
+}
+
+static void
 nv50_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
@@ -1294,6 +1306,7 @@ nv50_crtc_destroy(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_helper_funcs nv50_crtc_hfunc = {
+	.disable = nv50_crtc_disable,
 	.dpms = nv50_crtc_dpms,
 	.prepare = nv50_crtc_prepare,
 	.commit = nv50_crtc_commit,
