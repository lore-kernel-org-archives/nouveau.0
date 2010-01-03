From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: nv50: fix ->pseudo_palette usage
Date: Sun, 3 Jan 2010 11:17:42 +0200
Message-ID: <20100103091742.GA11518@x200>
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
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Sometimes struct fb_fillrect::color is color, sometimes palette index.

Steps to reproduce:

	make menuconfig

Blue background will have quite random black color.

Signed-off-by: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

 drivers/gpu/drm/nouveau/nv50_fbcon.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
@@ -10,6 +10,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 	struct drm_device *dev = par->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *chan = dev_priv->channel;
+	uint32_t color;
 
 	if (info->state != FBINFO_STATE_RUNNING)
 		return;
@@ -31,7 +32,12 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		OUT_RING(chan, 1);
 	}
 	BEGIN_RING(chan, NvSub2D, 0x0588, 1);
-	OUT_RING(chan, rect->color);
+	if (info->fix.visual == FB_VISUAL_TRUECOLOR ||
+	    info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
+		color = ((uint32_t *)info->pseudo_palette)[rect->color];
+	} else
+		color = rect->color;
+	OUT_RING(chan, color);
 	BEGIN_RING(chan, NvSub2D, 0x0600, 4);
 	OUT_RING(chan, rect->dx);
 	OUT_RING(chan, rect->dy);
