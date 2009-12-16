From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau: Drop redundant placement
	initialization.
Date: Wed, 16 Dec 2009 19:15:37 +0100
Message-ID: <1260987337-8674-3-git-send-email-currojerez@riseup.net>
References: <1260987337-8674-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260987337-8674-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 96bb123..e18d7fc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -130,7 +130,7 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_bo *nvbo;
-	int ret, n = 0;
+	int ret = 0;
 
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
@@ -145,19 +145,11 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
 	nouveau_bo_fixup_align(dev, tile_mode, tile_flags, &align, &size);
 	align >>= PAGE_SHIFT;
 
-	if (flags & TTM_PL_FLAG_VRAM)
-		nvbo->placements[n++] = TTM_PL_FLAG_VRAM | TTM_PL_MASK_CACHING;
-	if (flags & TTM_PL_FLAG_TT)
-		nvbo->placements[n++] = TTM_PL_FLAG_TT | TTM_PL_MASK_CACHING;
 	nvbo->placement.fpfn = 0;
 	nvbo->placement.lpfn = mappable ? dev_priv->fb_mappable_pages : 0;
-	nvbo->placement.placement = nvbo->placements;
-	nvbo->placement.busy_placement = nvbo->placements;
-	nvbo->placement.num_placement = n;
-	nvbo->placement.num_busy_placement = n;
+	nouveau_bo_placement_set(nvbo, flags);
 
 	nvbo->channel = chan;
-	nouveau_bo_placement_set(nvbo, flags);
 	ret = ttm_bo_init(&dev_priv->ttm.bdev, &nvbo->bo, size,
 			  ttm_bo_type_device, &nvbo->placement, align, 0,
 			  false, NULL, size, nouveau_bo_del_ttm);
-- 
1.6.4.4
