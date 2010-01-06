From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Fix null deref in ttm_bo_mem_space caused by
	forgetting to set placement.busy_placement
Date: Wed,  6 Jan 2010 03:54:56 +0100
Message-ID: <1262746496-6370-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Set it to the same value of placement.placement

Triggered by running etracer under compiz.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0cad6d8..e0bc2cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -547,7 +547,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 
 	placement.fpfn = placement.lpfn = 0;
 	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = &placement_memtype;
+	placement.placement = placement.busy_placement = &placement_memtype;
 
 	tmp_mem = *new_mem;
 	tmp_mem.mm_node = NULL;
@@ -585,7 +585,7 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
 
 	placement.fpfn = placement.lpfn = 0;
 	placement.num_placement = placement.num_busy_placement = 1;
-	placement.placement = &placement_memtype;
+	placement.placement = placement.busy_placement = &placement_memtype;
 
 	tmp_mem = *new_mem;
 	tmp_mem.mm_node = NULL;
-- 
1.6.3.3
