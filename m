From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: create function for "dealing" with
	gpu lockup
Date: Sun, 27 Dec 2009 22:50:09 +0100
Message-ID: <20091227215009.GA14612@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

It's mostly a cleanup, but in nv50_fbcon_accel_init gpu lockup
message was printed, but HWACCEL_DISBALED flag was not set.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |   15 +++++++++++----
 drivers/gpu/drm/nouveau/nouveau_fbcon.h |    2 ++
 drivers/gpu/drm/nouveau/nv04_fbcon.c    |   15 +++++----------
 drivers/gpu/drm/nouveau/nv50_fbcon.c    |   17 +++++------------
 4 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 84af25c..6438935 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -64,8 +64,7 @@ nouveau_fbcon_sync(struct fb_info *info)
 		return 0;
 
 	if (RING_SPACE(chan, 4)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 		return 0;
 	}
 
@@ -86,8 +85,7 @@ nouveau_fbcon_sync(struct fb_info *info)
 	}
 
 	if (ret) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 		return 0;
 	}
 
@@ -380,3 +378,12 @@ nouveau_fbcon_remove(struct drm_device *dev, struct drm_framebuffer *fb)
 
 	return 0;
 }
+
+void nouveau_gpu_lockup(struct fb_info *info, const char *file, int line)
+{
+	struct nouveau_fbcon_par *par = info->par;
+	struct drm_device *dev = par->dev;
+
+	NV_ERROR(dev, "GPU lockup - switching to software fbcon (%s:%d)\n", file, line);
+	info->flags |= FBINFO_HWACCEL_DISABLED;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.h b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
index 8531140..52c87fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
@@ -43,5 +43,7 @@ void nouveau_fbcon_zfill(struct drm_device *dev);
 int nv04_fbcon_accel_init(struct fb_info *info);
 int nv50_fbcon_accel_init(struct fb_info *info);
 
+#define NV_GPU_LOCKUP(info) nouveau_gpu_lockup(info, __FILE__, __LINE__)
+void nouveau_gpu_lockup(struct fb_info *info, const char *file, int line);
 #endif /* __NV50_FBCON_H__ */
 
diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index 09a3107..0ae7069 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -39,8 +39,7 @@ nv04_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region)
 		return;
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 4)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -68,8 +67,7 @@ nv04_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		return;
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 7)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -109,8 +107,7 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	}
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 8)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -144,8 +141,7 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		int iter_len = dsize > 128 ? 128 : dsize;
 
 		if (RING_SPACE(chan, iter_len + 1)) {
-			NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-			info->flags |= FBINFO_HWACCEL_DISABLED;
+			NV_GPU_LOCKUP(info);
 			cfb_imageblit(info, image);
 			return;
 		}
@@ -242,8 +238,7 @@ nv04_fbcon_accel_init(struct fb_info *info)
 		return ret;
 
 	if (RING_SPACE(chan, 49)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
index c966ef8..4aff98b 100644
--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -17,9 +17,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) &&
 	     RING_SPACE(chan, rect->rop == ROP_COPY ? 7 : 11)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -57,9 +55,7 @@ nv50_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region)
 		return;
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 12)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -102,8 +98,7 @@ nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	}
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 11)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		NV_GPU_LOCKUP(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -136,9 +131,7 @@ nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		int push = dwords > 2047 ? 2047 : dwords;
 
 		if (RING_SPACE(chan, push + 1)) {
-			NV_ERROR(dev,
-				 "GPU lockup - switching to software fbcon\n");
-			info->flags |= FBINFO_HWACCEL_DISABLED;
+			NV_GPU_LOCKUP(info);
 			cfb_imageblit(info, image);
 			return;
 		}
@@ -200,7 +193,7 @@ nv50_fbcon_accel_init(struct fb_info *info)
 
 	ret = RING_SPACE(chan, 59);
 	if (ret) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
+		NV_GPU_LOCKUP(info);
 		return ret;
 	}
 
-- 
1.6.6.rc3
