From: Pekka J Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
Subject: [PATCH 1/4] nouveau: add nouveau_addmap_{agp, fb,
	pci} functions
Date: Sun, 9 Mar 2008 18:36:16 +0200 (EET)
Message-ID: <Pine.LNX.4.64.0803091835520.29158@sbz-30.cs.Helsinki.FI>
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

This introduces memory type specific nouveau_addmap_{agp,fb,pci} functions as a
preparatory step to cleaning up nouveau_mem_alloc().

Signed-off-by: Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
---
 shared-core/nouveau_mem.c |   50 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

Index: drm/shared-core/nouveau_mem.c
===================================================================
--- drm.orig/shared-core/nouveau_mem.c
+++ drm/shared-core/nouveau_mem.c
@@ -515,6 +515,39 @@ int nouveau_mem_init(struct drm_device *
 	return 0;
 }
 
+static int nouveau_addmap(struct drm_device *dev, struct mem_block *block,
+			  unsigned long offset, enum drm_map_type type)
+{
+	return drm_addmap(dev, block->start, block->size, type, 0,
+			  &block->map);
+}
+
+static int nouveau_addmap_pci(struct drm_device *dev, struct mem_block *block)
+{
+	return nouveau_addmap(dev, block, block->start, _DRM_SCATTER_GATHER);
+}
+
+static int nouveau_addmap_fb(struct drm_device *dev, struct mem_block *block)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	unsigned long offset = block->start + dev_priv->fb_phys;
+
+	return nouveau_addmap(dev, block, offset, _DRM_SCATTER_GATHER);
+}
+
+static int nouveau_addmap_agp(struct drm_device *dev, struct mem_block *block)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	enum drm_map_type type;
+
+	if (dev_priv->gart_info.type == NOUVEAU_GART_SGDMA)
+		type = _DRM_SCATTER_GATHER;
+	else
+		type = _DRM_AGP;
+
+	return nouveau_addmap(dev, block, block->start, type);
+}
+
 struct mem_block* nouveau_mem_alloc(struct drm_device *dev, int alignment,
 				    uint64_t size, int flags,
 				    struct drm_file *file_priv)
@@ -590,21 +623,12 @@ alloc_ok:
 		int ret = 0;
 		block->flags|=NOUVEAU_MEM_MAPPED;
 
-		if (type == NOUVEAU_MEM_AGP) {
-			if (dev_priv->gart_info.type != NOUVEAU_GART_SGDMA)
-			ret = drm_addmap(dev, block->start, block->size,
-					 _DRM_AGP, 0, &block->map);
-			else
-			ret = drm_addmap(dev, block->start, block->size,
-					 _DRM_SCATTER_GATHER, 0, &block->map);
-		}
+		if (type == NOUVEAU_MEM_AGP)
+			ret = nouveau_addmap_agp(dev, block);
 		else if (type == NOUVEAU_MEM_FB)
-			ret = drm_addmap(dev, block->start + dev_priv->fb_phys,
-					 block->size, _DRM_FRAME_BUFFER,
-					 0, &block->map);
+			ret = nouveau_addmap_fb(dev, block);
 		else if (type == NOUVEAU_MEM_PCI)
-			ret = drm_addmap(dev, block->start, block->size,
-					 _DRM_SCATTER_GATHER, 0, &block->map);
+			ret = nouveau_addmap_pci(dev, block);
 
 		if (ret) {
 			nouveau_mem_free_block(block);
