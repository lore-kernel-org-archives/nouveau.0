From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 02/10] drm/nouveau: Fix fbcon with multiple
	outputs connected.
Date: Thu, 13 Aug 2009 14:01:29 +0200
Message-ID: <1250164897-7871-2-git-send-email-currojerez@riseup.net>
References: <1250164897-7871-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250164897-7871-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

vgacon attempts to restore the CRTC base on deinit so it messes up the
second head scanout address. Call crtc->helper_funcs->mode_set_base
directly from nouveau_fbcon_pan_display to ensure it's written out
even if the coordinates haven't changed. Modify nouveau_fbcon_set_par
so that it always calls crtc->funcs->set_config.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 0e6ebaa..645b087 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -282,7 +282,7 @@ static int nouveau_fbcon_set_par(struct fb_info *info)
 		int ret;
 
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-			struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
+			struct drm_mode_set *modeset = &nouveau_crtc(crtc)->mode_set;
 
 			for (i = 0; i < par->crtc_count; i++)
 				if (crtc->base.id == par->crtc_ids[i])
@@ -291,9 +291,9 @@ static int nouveau_fbcon_set_par(struct fb_info *info)
 			if (i == par->crtc_count)
 				continue;
 
-			if (crtc->fb == nv_crtc->mode_set.fb) {
+			if (modeset->num_connectors) {
 				mutex_lock(&dev->mode_config.mutex);
-				ret = crtc->funcs->set_config(&nv_crtc->mode_set);
+				ret = crtc->funcs->set_config(modeset);
 				mutex_unlock(&dev->mode_config.mutex);
 				if (ret)
 					return ret;
@@ -310,7 +310,7 @@ static int nouveau_fbcon_pan_display(struct fb_var_screeninfo *var,
 	struct drm_device *dev = par->dev;
 	struct drm_mode_set *modeset;
 	struct drm_crtc *crtc;
-	struct nouveau_crtc *nv_crtc;
+	struct drm_crtc_helper_funcs *helper_funcs;
 	int ret = 0;
 	int i;
 
@@ -322,16 +322,16 @@ static int nouveau_fbcon_pan_display(struct fb_var_screeninfo *var,
 		if (i == par->crtc_count)
 			continue;
 
-		nv_crtc = nouveau_crtc(crtc);
-		modeset = &nv_crtc->mode_set;
+		helper_funcs = crtc->helper_private;
+		modeset = &nouveau_crtc(crtc)->mode_set;
 
 		modeset->x = var->xoffset;
 		modeset->y = var->yoffset;
 
 		if (modeset->num_connectors) {
-			mutex_lock(&dev->mode_config.mutex);
-			ret = crtc->funcs->set_config(modeset);
-			mutex_unlock(&dev->mode_config.mutex);
+			ret = helper_funcs->mode_set_base(crtc,
+				modeset->x, modeset->y, modeset->fb);
+
 			if (!ret) {
 				info->var.xoffset = var->xoffset;
 				info->var.yoffset = var->yoffset;
-- 
1.6.3.3
