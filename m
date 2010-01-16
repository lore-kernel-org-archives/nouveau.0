From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] drm/nouveau: Evict buffers in VRAM before freeing
	sgdma
Date: Sat, 16 Jan 2010 15:30:15 +0100
Message-ID: <1263652216-18087-1-git-send-email-luca@luca-barbieri.com>
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
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Currently, we take down the sgdma engine without evicting all buffers
from VRAM.

The TTM device release will try to evict anything in VRAM to GART
memory, but this will fail since sgdma has already been taken down.

This causes an infinite loop in kernel mode on module unload.
It usually doesn't happen because there aren't any buffer on close.
However, if the GPU is locked up, this condition is easily triggered.

This patch fixes it in the simplest way possible by cleaning VRAM
right before cleaning SGDMA memory.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c   |    1 -
 drivers/gpu/drm/nouveau/nouveau_state.c |    1 +
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 186f34b..8f3a12f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -386,7 +386,6 @@ void nouveau_mem_close(struct drm_device *dev)
 	nouveau_bo_unpin(dev_priv->vga_ram);
 	nouveau_bo_ref(NULL, &dev_priv->vga_ram);
 
-	ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM);
 	ttm_bo_device_release(&dev_priv->ttm.bdev);
 
 	nouveau_ttm_global_release(dev_priv);
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 09b9a46..c212742 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -525,6 +525,7 @@ static void nouveau_card_takedown(struct drm_device *dev)
 		engine->mc.takedown(dev);
 
 		mutex_lock(&dev->struct_mutex);
+                ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM);
 		ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_TT);
 		mutex_unlock(&dev->struct_mutex);
 		nouveau_sgdma_takedown(dev);
-- 
1.6.3.3
