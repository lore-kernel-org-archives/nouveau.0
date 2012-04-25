From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/4] drm/nouveau: propagate errors from vm
	flushes
Date: Wed, 25 Apr 2012 23:20:34 +0200
Message-ID: <1335388836-13127-2-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

We need this for lockup recovery.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |    9 +++++++--
 drivers/gpu/drm/nouveau/nouveau_drv.h |    6 +++---
 drivers/gpu/drm/nouveau/nouveau_vm.c  |   20 ++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_vm.h  |   18 +++++++++---------
 drivers/gpu/drm/nouveau/nv50_fifo.c   |    4 ++--
 drivers/gpu/drm/nouveau/nv50_graph.c  |   12 ++++++++----
 drivers/gpu/drm/nouveau/nv50_mpeg.c   |    4 ++--
 drivers/gpu/drm/nouveau/nv50_vm.c     |   30 ++++++++++++++++++++----------
 drivers/gpu/drm/nouveau/nv84_crypt.c  |    4 ++--
 drivers/gpu/drm/nouveau/nva3_copy.c   |    4 ++--
 drivers/gpu/drm/nouveau/nvc0_vm.c     |    3 ++-
 11 files changed, 67 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 638ae32..5b0dc50 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1230,10 +1230,15 @@ nouveau_bo_vma_add(struct nouveau_bo *nvbo, struct nouveau_vm *vm,
 		return ret;
 
 	if (nvbo->bo.mem.mem_type == TTM_PL_VRAM)
-		nouveau_vm_map(vma, nvbo->bo.mem.mm_node);
+		ret = nouveau_vm_map(vma, nvbo->bo.mem.mm_node);
 	else
 	if (nvbo->bo.mem.mem_type == TTM_PL_TT)
-		nouveau_vm_map_sg(vma, 0, size, node);
+		ret = nouveau_vm_map_sg(vma, 0, size, node);
+
+	if (ret) {
+		nouveau_vm_put(vma);
+		return ret;
+	}
 
 	list_add_tail(&vma->head, &nvbo->vma_list);
 	vma->refcount = 1;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2f8e80a..d120baf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -320,7 +320,7 @@ struct nouveau_exec_engine {
 	int  (*object_new)(struct nouveau_channel *, int engine,
 			   u32 handle, u16 class);
 	void (*set_tile_region)(struct drm_device *dev, int i);
-	void (*tlb_flush)(struct drm_device *, int engine);
+	int (*tlb_flush)(struct drm_device *, int engine);
 };
 
 struct nouveau_instmem_engine {
@@ -387,7 +387,7 @@ struct nouveau_fifo_engine {
 	void (*destroy_context)(struct nouveau_channel *);
 	int  (*load_context)(struct nouveau_channel *);
 	int  (*unload_context)(struct drm_device *);
-	void (*tlb_flush)(struct drm_device *dev);
+	int  (*tlb_flush)(struct drm_device *dev);
 };
 
 struct nouveau_display_engine {
@@ -1246,7 +1246,7 @@ extern int  nv50_fifo_create_context(struct nouveau_channel *);
 extern void nv50_fifo_destroy_context(struct nouveau_channel *);
 extern int  nv50_fifo_load_context(struct nouveau_channel *);
 extern int  nv50_fifo_unload_context(struct drm_device *);
-extern void nv50_fifo_tlb_flush(struct drm_device *dev);
+extern int  nv50_fifo_tlb_flush(struct drm_device *dev);
 
 /* nvc0_fifo.c */
 extern int  nvc0_fifo_init(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_vm.c b/drivers/gpu/drm/nouveau/nouveau_vm.c
index 2bf6c03..e2d4853 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vm.c
@@ -27,7 +27,7 @@
 #include "nouveau_mm.h"
 #include "nouveau_vm.h"
 
-void
+int
 nouveau_vm_map_at(struct nouveau_vma *vma, u64 delta, struct nouveau_mem *node)
 {
 	struct nouveau_vm *vm = vma->vm;
@@ -67,16 +67,16 @@ nouveau_vm_map_at(struct nouveau_vma *vma, u64 delta, struct nouveau_mem *node)
 		}
 	}
 
-	vm->flush(vm);
+	return vm->flush(vm);
 }
 
-void
+int
 nouveau_vm_map(struct nouveau_vma *vma, struct nouveau_mem *node)
 {
-	nouveau_vm_map_at(vma, 0, node);
+	return nouveau_vm_map_at(vma, 0, node);
 }
 
-void
+int
 nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
 		  struct nouveau_mem *mem)
 {
@@ -110,10 +110,10 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
 		}
 	}
 
-	vm->flush(vm);
+	return vm->flush(vm);
 }
 
-void
+int
 nouveau_vm_unmap_at(struct nouveau_vma *vma, u64 delta, u64 length)
 {
 	struct nouveau_vm *vm = vma->vm;
@@ -144,13 +144,13 @@ nouveau_vm_unmap_at(struct nouveau_vma *vma, u64 delta, u64 length)
 		}
 	}
 
-	vm->flush(vm);
+	return vm->flush(vm);
 }
 
-void
+int
 nouveau_vm_unmap(struct nouveau_vma *vma)
 {
-	nouveau_vm_unmap_at(vma, 0, (u64)vma->node->length << 12);
+	return nouveau_vm_unmap_at(vma, 0, (u64)vma->node->length << 12);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_vm.h b/drivers/gpu/drm/nouveau/nouveau_vm.h
index 4fb6e72..59dc206 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_vm.h
@@ -73,7 +73,7 @@ struct nouveau_vm {
 	void (*map_sg)(struct nouveau_vma *, struct nouveau_gpuobj *,
 		       struct nouveau_mem *, u32 pte, u32 cnt, dma_addr_t *);
 	void (*unmap)(struct nouveau_gpuobj *pgt, u32 pte, u32 cnt);
-	void (*flush)(struct nouveau_vm *);
+	int (*flush)(struct nouveau_vm *);
 };
 
 /* nouveau_vm.c */
@@ -84,11 +84,11 @@ int  nouveau_vm_ref(struct nouveau_vm *, struct nouveau_vm **,
 int  nouveau_vm_get(struct nouveau_vm *, u64 size, u32 page_shift,
 		    u32 access, struct nouveau_vma *);
 void nouveau_vm_put(struct nouveau_vma *);
-void nouveau_vm_map(struct nouveau_vma *, struct nouveau_mem *);
-void nouveau_vm_map_at(struct nouveau_vma *, u64 offset, struct nouveau_mem *);
-void nouveau_vm_unmap(struct nouveau_vma *);
-void nouveau_vm_unmap_at(struct nouveau_vma *, u64 offset, u64 length);
-void nouveau_vm_map_sg(struct nouveau_vma *, u64 offset, u64 length,
+int  nouveau_vm_map(struct nouveau_vma *, struct nouveau_mem *);
+int  nouveau_vm_map_at(struct nouveau_vma *, u64 offset, struct nouveau_mem *);
+int  nouveau_vm_unmap(struct nouveau_vma *);
+int  nouveau_vm_unmap_at(struct nouveau_vma *, u64 offset, u64 length);
+int  nouveau_vm_map_sg(struct nouveau_vma *, u64 offset, u64 length,
 		       struct nouveau_mem *);
 
 /* nv50_vm.c */
@@ -99,8 +99,8 @@ void nv50_vm_map(struct nouveau_vma *, struct nouveau_gpuobj *,
 void nv50_vm_map_sg(struct nouveau_vma *, struct nouveau_gpuobj *,
 		    struct nouveau_mem *, u32 pte, u32 cnt, dma_addr_t *);
 void nv50_vm_unmap(struct nouveau_gpuobj *, u32 pte, u32 cnt);
-void nv50_vm_flush(struct nouveau_vm *);
-void nv50_vm_flush_engine(struct drm_device *, int engine);
+int  nv50_vm_flush(struct nouveau_vm *);
+int  nv50_vm_flush_engine(struct drm_device *, int engine);
 
 /* nvc0_vm.c */
 void nvc0_vm_map_pgt(struct nouveau_gpuobj *pgd, u32 pde,
@@ -110,6 +110,6 @@ void nvc0_vm_map(struct nouveau_vma *, struct nouveau_gpuobj *,
 void nvc0_vm_map_sg(struct nouveau_vma *, struct nouveau_gpuobj *,
 		    struct nouveau_mem *, u32 pte, u32 cnt, dma_addr_t *);
 void nvc0_vm_unmap(struct nouveau_gpuobj *, u32 pte, u32 cnt);
-void nvc0_vm_flush(struct nouveau_vm *);
+int  nvc0_vm_flush(struct nouveau_vm *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index 3bc2a56..3438fc2 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -499,8 +499,8 @@ nv50_fifo_unload_context(struct drm_device *dev)
 	return 0;
 }
 
-void
+int
 nv50_fifo_tlb_flush(struct drm_device *dev)
 {
-	nv50_vm_flush_engine(dev, 5);
+	return nv50_vm_flush_engine(dev, 5);
 }
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 2698d80..6899547 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -397,13 +397,13 @@ nv50_graph_nvsw_mthd_page_flip(struct nouveau_channel *chan,
 }
 
 
-static void
+static int
 nv50_graph_tlb_flush(struct drm_device *dev, int engine)
 {
-	nv50_vm_flush_engine(dev, 0);
+	return nv50_vm_flush_engine(dev, 0);
 }
 
-static void
+static int
 nv84_graph_tlb_flush(struct drm_device *dev, int engine)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -412,6 +412,7 @@ nv84_graph_tlb_flush(struct drm_device *dev, int engine)
 	unsigned long flags;
 	u64 start;
 	u32 tmp;
+	int ret = 0;
 
 	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
 	nv_mask(dev, 0x400500, 0x00000001, 0x00000000);
@@ -441,12 +442,15 @@ nv84_graph_tlb_flush(struct drm_device *dev, int engine)
 			      "0x%08x 0x%08x 0x%08x 0x%08x\n",
 			 nv_rd32(dev, 0x400700), nv_rd32(dev, 0x400380),
 			 nv_rd32(dev, 0x400384), nv_rd32(dev, 0x400388));
+		ret = -EIO;
 	}
 
-	nv50_vm_flush_engine(dev, 0);
+	if (!ret)
+		ret = nv50_vm_flush_engine(dev, 0);
 
 	nv_mask(dev, 0x400500, 0x00000001, 0x00000001);
 	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
+	return ret;
 }
 
 static struct nouveau_enum nv50_mp_exec_error_names[] = {
diff --git a/drivers/gpu/drm/nouveau/nv50_mpeg.c b/drivers/gpu/drm/nouveau/nv50_mpeg.c
index b57a2d1..1730611 100644
--- a/drivers/gpu/drm/nouveau/nv50_mpeg.c
+++ b/drivers/gpu/drm/nouveau/nv50_mpeg.c
@@ -128,10 +128,10 @@ nv50_mpeg_object_new(struct nouveau_channel *chan, int engine,
 	return ret;
 }
 
-static void
+static int
 nv50_mpeg_tlb_flush(struct drm_device *dev, int engine)
 {
-	nv50_vm_flush_engine(dev, 0x08);
+	return nv50_vm_flush_engine(dev, 0x08);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nv50_vm.c b/drivers/gpu/drm/nouveau/nv50_vm.c
index 44fbac9..6b8df85 100644
--- a/drivers/gpu/drm/nouveau/nv50_vm.c
+++ b/drivers/gpu/drm/nouveau/nv50_vm.c
@@ -142,38 +142,48 @@ nv50_vm_unmap(struct nouveau_gpuobj *pgt, u32 pte, u32 cnt)
 	}
 }
 
-void
+int
 nv50_vm_flush(struct nouveau_vm *vm)
 {
 	struct drm_nouveau_private *dev_priv = vm->dev->dev_private;
 	struct nouveau_instmem_engine *pinstmem = &dev_priv->engine.instmem;
 	struct nouveau_fifo_engine *pfifo = &dev_priv->engine.fifo;
 	int i;
+	int ret;
 
 	pinstmem->flush(vm->dev);
 
 	/* BAR */
-	if (vm == dev_priv->bar1_vm || vm == dev_priv->bar3_vm) {
-		nv50_vm_flush_engine(vm->dev, 6);
-		return;
-	}
+	if (vm == dev_priv->bar1_vm || vm == dev_priv->bar3_vm)
+		return nv50_vm_flush_engine(vm->dev, 6);
+
+	ret = pfifo->tlb_flush(vm->dev);
+	if (ret)
+		return ret;
 
-	pfifo->tlb_flush(vm->dev);
 	for (i = 0; i < NVOBJ_ENGINE_NR; i++) {
-		if (atomic_read(&vm->engref[i]))
-			dev_priv->eng[i]->tlb_flush(vm->dev, i);
+		if (atomic_read(&vm->engref[i])) {
+			ret = dev_priv->eng[i]->tlb_flush(vm->dev, i);
+			if (ret)
+				break;
+		}
 	}
+	return ret;
 }
 
-void
+int
 nv50_vm_flush_engine(struct drm_device *dev, int engine)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&dev_priv->vm_lock, flags);
 	nv_wr32(dev, 0x100c80, (engine << 16) | 1);
-	if (!nv_wait(dev, 0x100c80, 0x00000001, 0x00000000))
+	if (!nv_wait(dev, 0x100c80, 0x00000001, 0x00000000)) {
 		NV_ERROR(dev, "vm flush timeout: engine %d\n", engine);
+		ret = -EIO;
+	}
 	spin_unlock_irqrestore(&dev_priv->vm_lock, flags);
+	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nv84_crypt.c b/drivers/gpu/drm/nouveau/nv84_crypt.c
index edece9c..6b8b78e 100644
--- a/drivers/gpu/drm/nouveau/nv84_crypt.c
+++ b/drivers/gpu/drm/nouveau/nv84_crypt.c
@@ -111,10 +111,10 @@ nv84_crypt_object_new(struct nouveau_channel *chan, int engine,
 	return ret;
 }
 
-static void
+static int
 nv84_crypt_tlb_flush(struct drm_device *dev, int engine)
 {
-	nv50_vm_flush_engine(dev, 0x0a);
+	return nv50_vm_flush_engine(dev, 0x0a);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nva3_copy.c b/drivers/gpu/drm/nouveau/nva3_copy.c
index 8f356d5..c116e73 100644
--- a/drivers/gpu/drm/nouveau/nva3_copy.c
+++ b/drivers/gpu/drm/nouveau/nva3_copy.c
@@ -105,10 +105,10 @@ nva3_copy_context_del(struct nouveau_channel *chan, int engine)
 	chan->engctx[engine] = ctx;
 }
 
-static void
+static int
 nva3_copy_tlb_flush(struct drm_device *dev, int engine)
 {
-	nv50_vm_flush_engine(dev, 0x0d);
+	return nv50_vm_flush_engine(dev, 0x0d);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvc0_vm.c b/drivers/gpu/drm/nouveau/nvc0_vm.c
index 30d2bd5..1f6fbff 100644
--- a/drivers/gpu/drm/nouveau/nvc0_vm.c
+++ b/drivers/gpu/drm/nouveau/nvc0_vm.c
@@ -99,7 +99,7 @@ nvc0_vm_unmap(struct nouveau_gpuobj *pgt, u32 pte, u32 cnt)
 	}
 }
 
-void
+int
 nvc0_vm_flush(struct nouveau_vm *vm)
 {
 	struct drm_nouveau_private *dev_priv = vm->dev->dev_private;
@@ -133,4 +133,5 @@ nvc0_vm_flush(struct nouveau_vm *vm)
 		}
 	}
 	spin_unlock_irqrestore(&dev_priv->vm_lock, flags);
+	return 0;
 }
-- 
1.7.8.5
