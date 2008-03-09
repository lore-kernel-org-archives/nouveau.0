From: Pekka J Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
Subject: [PATCH 3/4] nouveau: move nouveau_map_block() call to
	nouveau_addmap()
Date: Sun, 9 Mar 2008 18:36:45 +0200 (EET)
Message-ID: <Pine.LNX.4.64.0803091836340.29158@sbz-30.cs.Helsinki.FI>
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
List-Id: nouveau.vger.kernel.org

From: Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>

Move nouveau_map_block() call from nouveau_mem_alloc() to nouveau_addmap() to
simplify error handling.

Signed-off-by: Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
---
 shared-core/nouveau_mem.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

Index: drm/shared-core/nouveau_mem.c
===================================================================
--- drm.orig/shared-core/nouveau_mem.c
+++ drm/shared-core/nouveau_mem.c
@@ -532,8 +532,13 @@ static int nouveau_map_block(struct drm_
 static int nouveau_addmap(struct drm_device *dev, struct mem_block *block,
 			  unsigned long offset, enum drm_map_type type)
 {
-	return drm_addmap(dev, block->start, block->size, type, 0,
-			  &block->map);
+	int err;
+
+	err = drm_addmap(dev, block->start, block->size, type, 0, &block->map);
+	if (err)
+		return err;
+
+	return nouveau_map_block(dev, block);
 }
 
 static int nouveau_addmap_pci(struct drm_device *dev, struct mem_block *block)
@@ -646,11 +651,6 @@ alloc_ok:
 			nouveau_mem_free_block(block);
 			return NULL;
 		}
-
-		if (!nouveau_map_block(dev, block)) {
-			nouveau_mem_free_block(block);
-			return NULL;
-		}
 	}
 
 	DRM_DEBUG("allocated %lld bytes at 0x%llx type=0x%08x\n", block->size, block->start, block->flags);
