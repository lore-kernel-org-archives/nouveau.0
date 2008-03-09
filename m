From: Pekka J Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
Subject: [PATCH 4/4] nouveau: clean up nouveau_mem_alloc function
Date: Sun, 9 Mar 2008 18:37:12 +0200 (EET)
Message-ID: <Pine.LNX.4.64.0803091836460.29158@sbz-30.cs.Helsinki.FI>
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

Convert the macros in nouveau_mem_alloc() to nouveau_mem_alloc_agp(),
nouveau_mem_alloc_fb(), and nouveau_mem_alloc_pci() functions that use a new
generic __nouveau_mem_alloc() function to allocate and map memory.

Signed-off-by: Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
---
 shared-core/nouveau_mem.c |  174 ++++++++++++++++++++++++++++++----------------
 1 file changed, 117 insertions(+), 57 deletions(-)

Index: drm/shared-core/nouveau_mem.c
===================================================================
--- drm.orig/shared-core/nouveau_mem.c
+++ drm/shared-core/nouveau_mem.c
@@ -567,13 +567,91 @@ static int nouveau_addmap_agp(struct drm
 	return nouveau_addmap(dev, block, block->start, type);
 }
 
+static struct mem_block *
+__nouveau_mem_alloc(struct drm_device *dev, int type, struct mem_block *heap,
+		    uint64_t size, int alignment, int flags,
+		    struct drm_file *file_priv)
+{
+	struct mem_block *block;
+	int err;
+
+	block = nouveau_mem_alloc_block(heap, size, alignment, file_priv);
+	if (!block)
+		return NULL;
+	block->flags = type;
+
+	/*
+	 * Does the block need mapping?
+	 */
+	if (!(flags & NOUVEAU_MEM_MAPPED))
+		return block;
+
+	switch (type) {
+		case NOUVEAU_MEM_AGP:
+			err = nouveau_addmap_agp(dev, block);
+			break;
+		case NOUVEAU_MEM_FB:
+			err = nouveau_addmap_fb(dev, block);
+			break;
+		case NOUVEAU_MEM_PCI:
+			err = nouveau_addmap_pci(dev, block);
+			break;
+		default:
+			err = -EINVAL;
+			break;
+	};
+	if (err)
+		goto error;
+
+	return block;
+error:
+	nouveau_mem_free_block(block);
+	return NULL;
+}
+
+static struct mem_block *
+nouveau_mem_alloc_pci(struct drm_device *dev, uint64_t size, int alignment,
+		      int flags, struct drm_file *file_priv)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	return __nouveau_mem_alloc(dev, NOUVEAU_MEM_PCI, dev_priv->pci_heap,
+				   size, alignment, flags, file_priv);
+}
+
+static struct mem_block *
+nouveau_mem_alloc_agp(struct drm_device *dev, uint64_t size, int alignment,
+		      int flags, struct drm_file *file_priv)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+	return __nouveau_mem_alloc(dev, NOUVEAU_MEM_AGP, dev_priv->agp_heap,
+				   size, alignment, flags, file_priv);
+}
+
+static struct mem_block *
+nouveau_mem_alloc_fb(struct drm_device *dev, uint64_t size, int alignment,
+		     int flags, struct drm_file *file_priv)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct mem_block *block;
+
+	if (!(flags & NOUVEAU_MEM_MAPPED)) {
+		block = __nouveau_mem_alloc(dev, NOUVEAU_MEM_FB,
+					    dev_priv->fb_nomap_heap, size,
+					    alignment, flags, file_priv);
+		if (block)
+			return block;
+	}
+	return __nouveau_mem_alloc(dev, NOUVEAU_MEM_FB, dev_priv->fb_heap,
+				   size, alignment, flags, file_priv);
+}
+
 struct mem_block* nouveau_mem_alloc(struct drm_device *dev, int alignment,
 				    uint64_t size, int flags,
 				    struct drm_file *file_priv)
 {
 	struct mem_block *block;
-	int type;
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
 	/*
 	 * Make things easier on ourselves: all allocations are page-aligned.
@@ -594,67 +672,49 @@ struct mem_block* nouveau_mem_alloc(stru
 	if (size & (~PAGE_MASK))
 		size = ((size/PAGE_SIZE) + 1) * PAGE_SIZE;
 
+	if (flags & NOUVEAU_MEM_FB) {
+		block = nouveau_mem_alloc_fb(dev, size, alignment, flags,
+					     file_priv);
+		if (block)
+			goto out;
+	}
 
-#define NOUVEAU_MEM_ALLOC_AGP {\
-		type=NOUVEAU_MEM_AGP;\
-                block = nouveau_mem_alloc_block(dev_priv->agp_heap, size,\
-                                                alignment, file_priv); \
-                if (block) goto alloc_ok;\
-	        }
-
-#define NOUVEAU_MEM_ALLOC_PCI {\
-                type = NOUVEAU_MEM_PCI;\
-                block = nouveau_mem_alloc_block(dev_priv->pci_heap, size, \
-						alignment, file_priv); \
-                if ( block ) goto alloc_ok;\
-	        }
-
-#define NOUVEAU_MEM_ALLOC_FB {\
-                type=NOUVEAU_MEM_FB;\
-                if (!(flags&NOUVEAU_MEM_MAPPED)) {\
-                        block = nouveau_mem_alloc_block(dev_priv->fb_nomap_heap,\
-                                                        size, alignment, \
-							file_priv); \
-                        if (block) goto alloc_ok;\
-                }\
-                block = nouveau_mem_alloc_block(dev_priv->fb_heap, size,\
-                                                alignment, file_priv);\
-                if (block) goto alloc_ok;\
-	        }
-
-
-	if (flags&NOUVEAU_MEM_FB) NOUVEAU_MEM_ALLOC_FB
-	if (flags&NOUVEAU_MEM_AGP) NOUVEAU_MEM_ALLOC_AGP
-	if (flags&NOUVEAU_MEM_PCI) NOUVEAU_MEM_ALLOC_PCI
-	if (flags&NOUVEAU_MEM_FB_ACCEPTABLE) NOUVEAU_MEM_ALLOC_FB
-	if (flags&NOUVEAU_MEM_AGP_ACCEPTABLE) NOUVEAU_MEM_ALLOC_AGP
-	if (flags&NOUVEAU_MEM_PCI_ACCEPTABLE) NOUVEAU_MEM_ALLOC_PCI
-
+	if (flags & NOUVEAU_MEM_AGP) {
+		block = nouveau_mem_alloc_agp(dev, size, alignment, flags,
+					      file_priv);
+		if (block)
+			goto out;
+	}
 
-	return NULL;
+	if (flags & NOUVEAU_MEM_PCI) {
+		block = nouveau_mem_alloc_pci(dev, size, alignment, flags,
+					      file_priv);
+		if (block)
+			goto out;
+	}
 
-alloc_ok:
-	block->flags=type;
+	if (flags & NOUVEAU_MEM_FB_ACCEPTABLE) {
+		block = nouveau_mem_alloc_fb(dev, size, alignment, flags,
+					     file_priv);
+		if (block)
+			goto out;
+	}
 
-	if (flags&NOUVEAU_MEM_MAPPED)
-	{
-		int ret = 0;
-
-		if (type == NOUVEAU_MEM_AGP)
-			ret = nouveau_addmap_agp(dev, block);
-		else if (type == NOUVEAU_MEM_FB)
-			ret = nouveau_addmap_fb(dev, block);
-		else if (type == NOUVEAU_MEM_PCI)
-			ret = nouveau_addmap_pci(dev, block);
-
-		if (ret) {
-			nouveau_mem_free_block(block);
-			return NULL;
-		}
+	if (flags & NOUVEAU_MEM_AGP_ACCEPTABLE) {
+		block = nouveau_mem_alloc_agp(dev, size, alignment, flags,
+					      file_priv);
+		if (block)
+			goto out;
 	}
 
-	DRM_DEBUG("allocated %lld bytes at 0x%llx type=0x%08x\n", block->size, block->start, block->flags);
-	return block;
+	if (flags & NOUVEAU_MEM_PCI_ACCEPTABLE)
+		block = nouveau_mem_alloc_pci(dev, size, alignment, flags,
+					      file_priv);
+out:
+	if (block)
+		DRM_DEBUG("allocated %lld bytes at 0x%llx type=0x%08x\n",
+			  block->size, block->start, block->flags);
+  	return block;
 }
 
 void nouveau_mem_free(struct drm_device* dev, struct mem_block* block)
