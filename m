From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 4/7] drm/nouveau: convert struct down-cast macros
	to funcs
Date: Sat,  8 Aug 2009 10:38:59 +0300
Message-ID: <1249717142-6302-4-git-send-email-pq@iki.fi>
References: <1249717142-6302-1-git-send-email-pq@iki.fi>
	<1249717142-6302-2-git-send-email-pq@iki.fi>
	<1249717142-6302-3-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249717142-6302-3-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Turn macros, that cast parent class struct pointers to child class
struct pointers, into static inline functions. Inline functions provide
a little more type safety than the conversion macros, especially as
several structs have the same parent member name.

Fixes one sparse warning.

Unfortunately, the same name cannot be at the same time a struct name, a
function name and a variable name. Therefore some renames in
nouveau_fbcon.c are necessary.

The macro nouveau_fdev() is not used and references to a member that
does not exist. The macro is removed.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.h |    7 +++++-
 drivers/gpu/drm/nouveau/nouveau_crtc.h      |    6 ++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   12 +++++-----
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |    6 ++++-
 drivers/gpu/drm/nouveau/nouveau_fb.h        |    6 ++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |   28 +++++++++++++-------------
 6 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index cc6369f..0d314df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -45,7 +45,12 @@ struct nouveau_connector {
 
 	struct edid *edid;
 };
-#define nouveau_connector(x) container_of((x), struct nouveau_connector, base)
+
+static inline struct nouveau_connector *nouveau_connector(
+						struct drm_connector *con)
+{
+	return container_of(con, struct nouveau_connector, base);
+}
 
 int nouveau_connector_create(struct drm_device *dev, int i2c_index, int type);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_crtc.h b/drivers/gpu/drm/nouveau/nouveau_crtc.h
index c6a12b3..7b26c17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_crtc.h
+++ b/drivers/gpu/drm/nouveau/nouveau_crtc.h
@@ -70,7 +70,11 @@ struct nouveau_crtc {
 	int (*set_dither)(struct nouveau_crtc *crtc, bool on, bool update);
 	int (*set_scale)(struct nouveau_crtc *crtc, int mode, bool update);
 };
-#define nouveau_crtc(x) container_of((x), struct nouveau_crtc, base)
+
+static inline struct nouveau_crtc *nouveau_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct nouveau_crtc, base);
+}
 
 int nv50_crtc_create(struct drm_device *dev, int index);
 int nv50_cursor_init(struct nouveau_crtc *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index fa89b14..381cadd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -51,12 +51,6 @@ struct nouveau_fpriv {
 
 #define DRM_FILE_PAGE_OFFSET (0x100000000ULL >> PAGE_SHIFT)
 
-#define nouveau_bdev(_bd) \
-	container_of(_bd, struct drm_nouveau_private, ttm.bdev)
-
-#define nouveau_fdev(_fd) \
-	container_of(_fd, struct drm_nouveau_private, ttm.fdev)
-
 #include "nouveau_drm.h"
 #include "nouveau_reg.h"
 #include "nouveau_bios.h"
@@ -569,6 +563,12 @@ struct drm_nouveau_private {
 	struct nouveau_channel *evo;
 };
 
+static inline struct drm_nouveau_private *
+nouveau_bdev(struct ttm_bo_device *bd)
+{
+	return container_of(bd, struct drm_nouveau_private, ttm.bdev);
+}
+
 static inline int
 nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pnvbo)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index c4846a9..3344e6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -41,7 +41,11 @@ struct nouveau_encoder {
 
 	struct nv04_output_reg restore;
 };
-#define nouveau_encoder(x) container_of((x), struct nouveau_encoder, base)
+
+static inline struct nouveau_encoder *nouveau_encoder(struct drm_encoder *enc)
+{
+	return container_of(enc, struct nouveau_encoder, base);
+}
 
 int nv50_sor_create(struct drm_device *dev, struct dcb_entry *entry);
 int nv50_dac_create(struct drm_device *dev, struct dcb_entry *entry);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fb.h b/drivers/gpu/drm/nouveau/nouveau_fb.h
index 1101d1d..4a3f31a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fb.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fb.h
@@ -32,7 +32,11 @@ struct nouveau_framebuffer {
 	struct nouveau_bo *nvbo;
 };
 
-#define nouveau_framebuffer(x) container_of((x), struct nouveau_framebuffer, base)
+static inline struct nouveau_framebuffer *
+nouveau_framebuffer(struct drm_framebuffer *fb)
+{
+	return container_of(fb, struct nouveau_framebuffer, base);
+}
 
 extern const struct drm_mode_config_funcs nouveau_mode_config_funcs;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 228e763..df317a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -104,8 +104,8 @@ static int nouveau_fbcon_setcolreg(unsigned regno, unsigned red, unsigned green,
 	int i;
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct nouveau_crtc *nouveau_crtc = nouveau_crtc(crtc);
-		struct drm_mode_set *modeset = &nouveau_crtc->mode_set;
+		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
+		struct drm_mode_set *modeset = &nv_crtc->mode_set;
 		struct drm_framebuffer *fb = modeset->fb;
 
 		for (i = 0; i < par->crtc_count; i++)
@@ -283,7 +283,7 @@ static int nouveau_fbcon_set_par(struct fb_info *info)
 		int ret;
 
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-			struct nouveau_crtc *nouveau_crtc = nouveau_crtc(crtc);
+			struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
 			for (i = 0; i < par->crtc_count; i++)
 				if (crtc->base.id == par->crtc_ids[i])
@@ -292,9 +292,9 @@ static int nouveau_fbcon_set_par(struct fb_info *info)
 			if (i == par->crtc_count)
 				continue;
 
-			if (crtc->fb == nouveau_crtc->mode_set.fb) {
+			if (crtc->fb == nv_crtc->mode_set.fb) {
 				mutex_lock(&dev->mode_config.mutex);
-				ret = crtc->funcs->set_config(&nouveau_crtc->mode_set);
+				ret = crtc->funcs->set_config(&nv_crtc->mode_set);
 				mutex_unlock(&dev->mode_config.mutex);
 				if (ret)
 					return ret;
@@ -311,7 +311,7 @@ static int nouveau_fbcon_pan_display(struct fb_var_screeninfo *var,
 	struct drm_device *dev = par->dev;
 	struct drm_mode_set *modeset;
 	struct drm_crtc *crtc;
-	struct nouveau_crtc *nouveau_crtc;
+	struct nouveau_crtc *nv_crtc;
 	int ret = 0;
 	int i;
 
@@ -323,8 +323,8 @@ static int nouveau_fbcon_pan_display(struct fb_var_screeninfo *var,
 		if (i == par->crtc_count)
 			continue;
 
-		nouveau_crtc = nouveau_crtc(crtc);
-		modeset = &nouveau_crtc->mode_set;
+		nv_crtc = nouveau_crtc(crtc);
+		modeset = &nv_crtc->mode_set;
 
 		modeset->x = var->xoffset;
 		modeset->y = var->yoffset;
@@ -657,7 +657,7 @@ out:
 static int nouveau_fbcon_multi_fb_probe_crtc(struct drm_device *dev,
 					     struct drm_crtc *crtc)
 {
-	struct nouveau_crtc *nouveau_crtc = nouveau_crtc(crtc);
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_framebuffer *nouveau_fb;
 	struct drm_framebuffer *fb;
 	struct drm_connector *connector;
@@ -678,13 +678,13 @@ static int nouveau_fbcon_multi_fb_probe_crtc(struct drm_device *dev,
 	height = crtc->desired_mode->vdisplay;
 
 	/* is there an fb bound to this crtc already */
-	if (!nouveau_crtc->mode_set.fb) {
+	if (!nv_crtc->mode_set.fb) {
 		ret = nouveau_fbcon_create(dev, width, height, width, height, &nouveau_fb);
 		if (ret)
 			return -EINVAL;
 		new_fb = 1;
 	} else {
-		fb = nouveau_crtc->mode_set.fb;
+		fb = nv_crtc->mode_set.fb;
 		nouveau_fb = nouveau_framebuffer(fb);
 		if ((nouveau_fb->base.width < width) || (nouveau_fb->base.height < height))
 			return -EINVAL;
@@ -693,7 +693,7 @@ static int nouveau_fbcon_multi_fb_probe_crtc(struct drm_device *dev,
 	info = nouveau_fb->base.fbdev;
 	par = info->par;
 
-	modeset = &nouveau_crtc->mode_set;
+	modeset = &nv_crtc->mode_set;
 	modeset->fb = &nouveau_fb->base;
 	conn_count = 0;
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
@@ -841,9 +841,9 @@ static int nouveau_fbcon_single_fb_probe(struct drm_device *dev)
 	 * set configuration.
 	 */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct nouveau_crtc *nouveau_crtc = nouveau_crtc(crtc);
+		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
-		modeset = &nouveau_crtc->mode_set;
+		modeset = &nv_crtc->mode_set;
 		modeset->fb = &nouveau_fb->base;
 		conn_count = 0;
 		list_for_each_entry(connector, &dev->mode_config.connector_list,
-- 
1.6.3.3
