From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/7] drm/nouveau: collect switch blocks in
	nouveau_fbcon.c
Date: Sat,  8 Aug 2009 10:38:57 +0300
Message-ID: <1249717142-6302-2-git-send-email-pq@iki.fi>
References: <1249717142-6302-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249717142-6302-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

The two large switch blocks are refactored into a function. While doing
this, some inconsistencies are corrected:

- in nouveau_fbcon_check_var(), case 30 was writing to a wrong
  structure.

- in nouveau_fbcon_create(), case 16 was missing transp.length.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |  156 ++++++++++---------------------
 1 files changed, 51 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index bc229cb..7ccadc0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -153,46 +153,15 @@ static int nouveau_fbcon_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return 0;
 }
 
-static int nouveau_fbcon_check_var(struct fb_var_screeninfo *var,
-				   struct fb_info *info)
+static int nouveau_fbcon_set_color_fields(int depth,
+					  struct fb_var_screeninfo *var)
 {
-	struct nouveau_fbcon_par *par = info->par;
-	struct nouveau_framebuffer *nouveau_fb = par->nouveau_fb;
-	struct drm_device *dev = par->dev;
-	struct drm_framebuffer *fb = &nouveau_fb->base;
-	int depth;
-
-	/* Need to resize the fb object !!! */
-	if (var->xres > fb->width || var->yres > fb->height) {
-		NV_ERROR(dev, "Requested width/height is greater than current fb object %dx%d > %dx%d\n",var->xres,var->yres,fb->width,fb->height);
-		NV_ERROR(dev, "Need resizing code.\n");
-		return -EINVAL;
-	}
-
-	switch (var->bits_per_pixel) {
-	case 16:
-		depth = (var->green.length == 6) ? 16 : 15;
-		break;
-	case 32:
-		if (var->transp.length == 2)
-			depth = 30;
-		else
-		if (var->transp.length > 0)
-			depth = 32;
-		else
-			depth = 24;
-		break;
-	default:
-		depth = var->bits_per_pixel;
-		break;
-	}
-
 	switch (depth) {
 	case 8:
 		var->red.offset = 0;
 		var->green.offset = 0;
 		var->blue.offset = 0;
-		var->red.length = 8;
+		var->red.length = 8; /* 8-bit DAC */
 		var->green.length = 8;
 		var->blue.length = 8;
 		var->transp.length = 0;
@@ -229,14 +198,14 @@ static int nouveau_fbcon_check_var(struct fb_var_screeninfo *var,
 		var->transp.offset = 0;
 		break;
 	case 30:
-		info->var.red.offset = 0;
-		info->var.green.offset = 10;
-		info->var.blue.offset = 20;
-		info->var.red.length = 10;
-		info->var.green.length = 10;
-		info->var.blue.length = 10;
-		info->var.transp.offset = 30;
-		info->var.transp.length = 2;
+		var->red.offset = 0;
+		var->green.offset = 10;
+		var->blue.offset = 20;
+		var->red.length = 10;
+		var->green.length = 10;
+		var->blue.length = 10;
+		var->transp.offset = 30;
+		var->transp.length = 2;
 		break;
 	case 32:
 		var->red.offset = 16;
@@ -251,6 +220,45 @@ static int nouveau_fbcon_check_var(struct fb_var_screeninfo *var,
 	default:
 		return -EINVAL;
 	}
+	return 0;
+}
+
+static int nouveau_fbcon_check_var(struct fb_var_screeninfo *var,
+				   struct fb_info *info)
+{
+	struct nouveau_fbcon_par *par = info->par;
+	struct nouveau_framebuffer *nouveau_fb = par->nouveau_fb;
+	struct drm_device *dev = par->dev;
+	struct drm_framebuffer *fb = &nouveau_fb->base;
+	int depth;
+
+	/* Need to resize the fb object !!! */
+	if (var->xres > fb->width || var->yres > fb->height) {
+		NV_ERROR(dev, "Requested width/height is greater than current fb object %dx%d > %dx%d\n",var->xres,var->yres,fb->width,fb->height);
+		NV_ERROR(dev, "Need resizing code.\n");
+		return -EINVAL;
+	}
+
+	switch (var->bits_per_pixel) {
+	case 16:
+		depth = (var->green.length == 6) ? 16 : 15;
+		break;
+	case 32:
+		if (var->transp.length == 2)
+			depth = 30;
+		else
+		if (var->transp.length > 0)
+			depth = 32;
+		else
+			depth = 24;
+		break;
+	default:
+		depth = var->bits_per_pixel;
+		break;
+	}
+
+	if (nouveau_fbcon_set_color_fields(depth, var))
+		return -EINVAL;
 
 	return 0;
 }
@@ -606,69 +614,7 @@ static int nouveau_fbcon_create(struct drm_device *dev, uint32_t fb_width,
 	info->pixmap.flags = FB_PIXMAP_SYSTEM;
 	info->pixmap.scan_align = 1;
 
-	switch(fb->depth) {
-	case 8:
-		info->var.red.offset = 0;
-		info->var.green.offset = 0;
-		info->var.blue.offset = 0;
-		info->var.red.length = 8; /* 8bit DAC */
-		info->var.green.length = 8;
-		info->var.blue.length = 8;
-		info->var.transp.offset = 0;
-		info->var.transp.length = 0;
-		break;
-	case 15:
-		info->var.red.offset = 10;
-		info->var.green.offset = 5;
-		info->var.blue.offset = 0;
-		info->var.red.length = 5;
-		info->var.green.length = 5;
-		info->var.blue.length = 5;
-		info->var.transp.offset = 15;
-		info->var.transp.length = 1;
-		break;
-	case 16:
-		info->var.red.offset = 11;
-		info->var.green.offset = 5;
-		info->var.blue.offset = 0;
-		info->var.red.length = 5;
-		info->var.green.length = 6;
-		info->var.blue.length = 5;
-		info->var.transp.offset = 0;
-		break;
-	case 24:
-		info->var.red.offset = 16;
-		info->var.green.offset = 8;
-		info->var.blue.offset = 0;
-		info->var.red.length = 8;
-		info->var.green.length = 8;
-		info->var.blue.length = 8;
-		info->var.transp.offset = 0;
-		info->var.transp.length = 0;
-		break;
-	case 30:
-		info->var.red.offset = 0;
-		info->var.green.offset = 10;
-		info->var.blue.offset = 20;
-		info->var.red.length = 10;
-		info->var.green.length = 10;
-		info->var.blue.length = 10;
-		info->var.transp.offset = 30;
-		info->var.transp.length = 2;
-		break;
-	case 32:
-		info->var.red.offset = 16;
-		info->var.green.offset = 8;
-		info->var.blue.offset = 0;
-		info->var.red.length = 8;
-		info->var.green.length = 8;
-		info->var.blue.length = 8;
-		info->var.transp.offset = 24;
-		info->var.transp.length = 8;
-		break;
-	default:
-		break;
-	}
+	nouveau_fbcon_set_color_fields(fb->depth, &info->var);
 
 	fb->fbdev = info;
 
-- 
1.6.3.3
