From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm/nouveau: create function for
 "dealing" with gpu lockup
Date: Mon, 4 Jan 2010 19:25:09 +0100
Message-ID: <20100104182509.GA2927@joi.lan>
References: <20091227215009.GA14612@joi.lan> <20100103173839.GA2863@joi.lan>
	<1262557174.18387.7.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1262557174.18387.7.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 04, 2010 at 08:19:34AM +1000, Ben Skeggs wrote:
> On Sun, 2010-01-03 at 18:38 +0100, Marcin Slusarz wrote:
> > New version, without file/line markers in nouveau_gpu_lockup (they were useless...).
> Looks mostly good to me, can you rename to nouveau_fbcon_gpu_lockup()
> instead however, as the function only deals with fbcon and not a more
> general handling.

done
---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] drm/nouveau: create function for "dealing" with gpu lockup

It's mostly a cleanup, but in nv50_fbcon_accel_init gpu lockup
message was printed, but HWACCEL_DISBALED flag was not set.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |   15 +++++++++++----
 drivers/gpu/drm/nouveau/nouveau_fbcon.h |    1 +
 drivers/gpu/drm/nouveau/nv04_fbcon.c    |   15 +++++----------
 drivers/gpu/drm/nouveau/nv50_fbcon.c    |   17 +++++------------
 4 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 44cbbee..eb48488 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -64,8 +64,7 @@ nouveau_fbcon_sync(struct fb_info *info)
 		return 0;
 
 	if (RING_SPACE(chan, 4)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 		return 0;
 	}
 
@@ -86,8 +85,7 @@ nouveau_fbcon_sync(struct fb_info *info)
 	}
 
 	if (ret) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 		return 0;
 	}
 
@@ -380,3 +378,12 @@ nouveau_fbcon_remove(struct drm_device *dev, struct drm_framebuffer *fb)
 
 	return 0;
 }
+
+void nouveau_fbcon_gpu_lockup(struct fb_info *info)
+{
+	struct nouveau_fbcon_par *par = info->par;
+	struct drm_device *dev = par->dev;
+
+	NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
+	info->flags |= FBINFO_HWACCEL_DISABLED;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.h b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
index 8531140..6c095c2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
@@ -43,5 +43,6 @@ void nouveau_fbcon_zfill(struct drm_device *dev);
 int nv04_fbcon_accel_init(struct fb_info *info);
 int nv50_fbcon_accel_init(struct fb_info *info);
 
+void nouveau_fbcon_gpu_lockup(struct fb_info *info);
 #endif /* __NV50_FBCON_H__ */
 
diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index d2d7f08..feb7219 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -39,8 +39,7 @@ nv04_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region)
 		return;
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 4)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -68,8 +67,7 @@ nv04_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		return;
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 7)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -109,8 +107,7 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	}
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 8)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -144,8 +141,7 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		int iter_len = dsize > 128 ? 128 : dsize;
 
 		if (RING_SPACE(chan, iter_len + 1)) {
-			NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-			info->flags |= FBINFO_HWACCEL_DISABLED;
+			nouveau_fbcon_gpu_lockup(info);
 			cfb_imageblit(info, image);
 			return;
 		}
@@ -243,8 +239,7 @@ nv04_fbcon_accel_init(struct fb_info *info)
 		return ret;
 
 	if (RING_SPACE(chan, 49)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
index c966ef8..7e25d49 100644
--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -17,9 +17,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) &&
 	     RING_SPACE(chan, rect->rop == ROP_COPY ? 7 : 11)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -57,9 +55,7 @@ nv50_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region)
 		return;
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 12)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -102,8 +98,7 @@ nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	}
 
 	if (!(info->flags & FBINFO_HWACCEL_DISABLED) && RING_SPACE(chan, 11)) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
-		info->flags |= FBINFO_HWACCEL_DISABLED;
+		nouveau_fbcon_gpu_lockup(info);
 	}
 
 	if (info->flags & FBINFO_HWACCEL_DISABLED) {
@@ -136,9 +131,7 @@ nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		int push = dwords > 2047 ? 2047 : dwords;
 
 		if (RING_SPACE(chan, push + 1)) {
-			NV_ERROR(dev,
-				 "GPU lockup - switching to software fbcon\n");
-			info->flags |= FBINFO_HWACCEL_DISABLED;
+			nouveau_fbcon_gpu_lockup(info);
 			cfb_imageblit(info, image);
 			return;
 		}
@@ -200,7 +193,7 @@ nv50_fbcon_accel_init(struct fb_info *info)
 
 	ret = RING_SPACE(chan, 59);
 	if (ret) {
-		NV_ERROR(dev, "GPU lockup - switching to software fbcon\n");
+		nouveau_fbcon_gpu_lockup(info);
 		return ret;
 	}
 
-- 
1.6.6.rc3
