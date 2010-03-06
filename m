From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Never evict VRAM buffers to system.
Date: Sat,  6 Mar 2010 15:04:27 +0100
Message-ID: <1267884267-22456-1-git-send-email-currojerez@riseup.net>
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
List-Id: nouveau.vger.kernel.org

VRAM->system is a synchronous operation: it involves scheduling a
VRAM->TT DMA transfer and stalling the CPU until it's finished so that
we can unbind the new memory from the translation tables. VRAM->TT can
always be performed asynchronously, even if TT is already full and we
have to move something out of it.

Additionally, allowing VRAM->system behaves badly under heavy memory
pressure because once we run out of TT, stuff starts to be moved back
and forth between VRAM and system, and the TT contents are hardly
renewed.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 028719f..0266124 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -439,8 +439,7 @@ nouveau_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
 
 	switch (bo->mem.mem_type) {
 	case TTM_PL_VRAM:
-		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_TT |
-					 TTM_PL_FLAG_SYSTEM);
+		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_TT);
 		break;
 	default:
 		nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_SYSTEM);
-- 
1.6.4.4
