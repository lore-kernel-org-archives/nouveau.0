From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 8/8] drm/nouveau: remove mask in
	nv04_fbcon_imageblit()
Date: Mon, 17 Aug 2009 16:42:44 +0300
Message-ID: <1250516564-14193-9-git-send-email-pq@iki.fi>
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

The local variable 'mask' is simply confusing, the value is equivalent
to zero.

Why? The literal 0 is by default signed. So is ~0. Bitshift to right of
a signed type is implementation defined, gcc replicates the sign bit.
Therefore ~0 >> x equals always ~0, and the final 'mask' value is 0.

Remove this obfuscation.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_fbcon.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
index 14fc87f..3d19492 100644
--- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
@@ -96,7 +96,6 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	struct nouveau_channel *chan = dev_priv->channel;
 	uint32_t fg;
 	uint32_t bg;
-	uint32_t mask = ~(~0 >> (32 - info->var.bits_per_pixel));
 	uint32_t dsize;
 	uint32_t width;
 	uint32_t *data = (uint32_t *)image->data;
@@ -119,8 +118,8 @@ nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image)
 	width = (image->width + 31) & ~31;
 	dsize = (width * image->height) >> 5;
 
-	fg = ((uint32_t *) info->pseudo_palette)[image->fg_color] | mask;
-	bg = ((uint32_t *) info->pseudo_palette)[image->bg_color] | mask;
+	fg = ((uint32_t *) info->pseudo_palette)[image->fg_color];
+	bg = ((uint32_t *) info->pseudo_palette)[image->bg_color];
 
 	BEGIN_RING(chan, NvSubGdiRect, 0x0be4, 7);
 	OUT_RING  (chan, (image->dy << 16) | (image->dx & 0xffff));
-- 
1.6.3.3
