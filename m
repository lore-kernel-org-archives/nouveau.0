From: Pekka J Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
Subject: [PATCH 2/4] nouveau: add nouveau_map_block function
Date: Sun, 9 Mar 2008 18:36:32 +0200 (EET)
Message-ID: <Pine.LNX.4.64.0803091836170.29158@sbz-30.cs.Helsinki.FI>
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

This extracts the struct mem_block to struct drm_map_list entry mapping into a
separate function.

Signed-off-by: Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
---
 shared-core/nouveau_mem.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

Index: drm/shared-core/nouveau_mem.c
===================================================================
--- drm.orig/shared-core/nouveau_mem.c
+++ drm/shared-core/nouveau_mem.c
@@ -515,6 +515,20 @@ int nouveau_mem_init(struct drm_device *
 	return 0;
 }
 
+/* Returns zero on success; otherwise returns non-zero.  */
+static int nouveau_map_block(struct drm_device *dev, struct mem_block *block)
+{
+	struct drm_map_list *entry;
+
+	entry = drm_find_matching_map(dev, block->map);
+	if (!entry)
+		return -EINVAL;
+
+	block->map_handle = entry->user_token;
+	block->flags |= NOUVEAU_MEM_MAPPED;
+	return 0;
+}
+
 static int nouveau_addmap(struct drm_device *dev, struct mem_block *block,
 			  unsigned long offset, enum drm_map_type type)
 {
@@ -619,9 +633,7 @@ alloc_ok:
 
 	if (flags&NOUVEAU_MEM_MAPPED)
 	{
-		struct drm_map_list *entry;
 		int ret = 0;
-		block->flags|=NOUVEAU_MEM_MAPPED;
 
 		if (type == NOUVEAU_MEM_AGP)
 			ret = nouveau_addmap_agp(dev, block);
@@ -635,12 +647,10 @@ alloc_ok:
 			return NULL;
 		}
 
-		entry = drm_find_matching_map(dev, block->map);
-		if (!entry) {
+		if (!nouveau_map_block(dev, block)) {
 			nouveau_mem_free_block(block);
 			return NULL;
 		}
-		block->map_handle = entry->user_token;
 	}
 
 	DRM_DEBUG("allocated %lld bytes at 0x%llx type=0x%08x\n", block->size, block->start, block->flags);
