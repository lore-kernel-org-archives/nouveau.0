From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 25/37] drm: don't take modeset locks in getfb ioctl
Date: Wed, 12 Dec 2012 14:07:05 +0100
Message-ID: <1355317637-16742-26-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

We only need to push the fb unreference a bit down. While at it,
properly pass the return value from ->create_handle back to userspace.

Most drivers either return -ENODEV if they don't have a concept of
buffer objects (ast, cirrus, ...) or just install a handle for the
underlying gem object (which is ok since we hold a reference on that
through the framebuffer). But a few drivers needed tiny fixups:

- cirrus/ast/mga200: Return a consistent -ENODEV to signal to
  userspace that these drivers don't bother with implementing the
  ->create_handle callback, since it's rather pointless for them to do
  so with no accel support.

- udl: Didn't even bother with a callback, leading to a nice
  userspace-triggerable OOPS. Nice work. Fix this up and return
  -ENODEV like the other simple drivers. It could be somewhat useful
  to implement the real ->create_handle since udl buffers could be
  used with prime, but alas ...

- vmwgfx: This driver bothered with an implementation to return 0 as
  the handle (which is the canonical nofb handle). Dunno what this is
  for, but I've lost myself in vmwgfx too often. Just leave this
  as-is.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ast/ast_main.c         |    2 +-
 drivers/gpu/drm/cirrus/cirrus_main.c   |    2 +-
 drivers/gpu/drm/drm_crtc.c             |   17 ++++++-----------
 drivers/gpu/drm/mgag200/mgag200_main.c |    2 +-
 drivers/gpu/drm/udl/udl_fb.c           |    9 ++++++++-
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index d5ba709..a94f13e 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -250,7 +250,7 @@ static int ast_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 					      struct drm_file *file,
 					      unsigned int *handle)
 {
-	return -EINVAL;
+	return -ENODEV;
 }
 
 static const struct drm_framebuffer_funcs ast_fb_funcs = {
diff --git a/drivers/gpu/drm/cirrus/cirrus_main.c b/drivers/gpu/drm/cirrus/cirrus_main.c
index 2eac87b..e9de084 100644
--- a/drivers/gpu/drm/cirrus/cirrus_main.c
+++ b/drivers/gpu/drm/cirrus/cirrus_main.c
@@ -27,7 +27,7 @@ static int cirrus_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						 struct drm_file *file_priv,
 						 unsigned int *handle)
 {
-	return 0;
+	return -NODEV;
 }
 
 static const struct drm_framebuffer_funcs cirrus_fb_funcs = {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 9ad807d..28838cf 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2526,29 +2526,24 @@ int drm_mode_getfb(struct drm_device *dev,
 {
 	struct drm_mode_fb_cmd *r = data;
 	struct drm_framebuffer *fb;
-	int ret = 0;
+	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
 	fb = drm_framebuffer_lookup(dev, r->fb_id);
-	if (!fb) {
-		ret = -EINVAL;
-		goto out;
-	}
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
+	if (!fb)
+		return -EINVAL;
 
 	r->height = fb->height;
 	r->width = fb->width;
 	r->depth = fb->depth;
 	r->bpp = fb->bits_per_pixel;
 	r->pitch = fb->pitches[0];
-	fb->funcs->create_handle(fb, file_priv, &r->handle);
+	ret = fb->funcs->create_handle(fb, file_priv, &r->handle);
+
+	drm_framebuffer_unreference(fb);
 
-out:
-	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 266438a..90fd681 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -27,7 +27,7 @@ static int mga_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						 struct drm_file *file_priv,
 						 unsigned int *handle)
 {
-	return 0;
+	return -ENODEV;
 }
 
 static const struct drm_framebuffer_funcs mga_fb_funcs = {
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
index c09c04e..cb61ff7 100644
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ b/drivers/gpu/drm/udl/udl_fb.c
@@ -419,10 +419,17 @@ static void udl_user_framebuffer_destroy(struct drm_framebuffer *fb)
 	kfree(ufb);
 }
 
+static int udl_user_framebuffer_create_handle(struct drm_framebuffer *fb,
+					      struct drm_file *file_priv,
+					      unsigned int *handle)
+{
+	return -ENODEV;
+}
+
 static const struct drm_framebuffer_funcs udlfb_funcs = {
 	.destroy = udl_user_framebuffer_destroy,
 	.dirty = udl_user_framebuffer_dirty,
-	.create_handle = NULL,
+	.create_handle = udl_user_framebuffer_create_handle,
 };
 
 
-- 
1.7.10.4
