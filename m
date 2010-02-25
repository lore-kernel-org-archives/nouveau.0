From: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: use ALIGN instead of open coding it
Date: Wed, 24 Feb 2010 23:27:10 -0500
Message-ID: <1267072030-23176-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

CC: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_fbcon.c   |    2 +-
 drivers/gpu/drm/nouveau/nv50_fbcon.c   |    2 +-
 drivers/gpu/drm/nouveau/nv50_instmem.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index fd01caa..3da90c2 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -118,7 +118,7 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		return;
 	}
 
-	width = (image->width + 31) & ~31;
+	width = ALIGN(image->width, 32);
 	dsize = (width * image->height) >> 5;
 
 	if (info->fix.visual == FB_VISUAL_TRUECOLOR ||
diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
index 0f57cdf..993c712 100644
--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -109,7 +109,7 @@ nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 		return;
 	}
 
-	width = (image->width + 31) & ~31;
+	width = ALIGN(image->width, 32);
 	dwords = (width * image->height) >> 5;
 
 	BEGIN_RING(chan, NvSub2D, 0x0814, 2);
diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nouveau/nv50_instmem.c
index 94400f7..a8a639e 100644
--- a/drivers/gpu/drm/nouveau/nv50_instmem.c
+++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
@@ -373,7 +373,7 @@ nv50_instmem_populate(struct drm_device *dev, struct nouveau_gpuobj *gpuobj,
 	if (gpuobj->im_backing)
 		return -EINVAL;
 
-	*sz = (*sz + (NV50_INSTMEM_PAGE_SIZE-1)) & ~(NV50_INSTMEM_PAGE_SIZE-1);
+	*sz = ALIGN(*sz, NV50_INSTMEM_PAGE_SIZE);
 	if (*sz == 0)
 		return -EINVAL;
 
-- 
1.6.4.4
