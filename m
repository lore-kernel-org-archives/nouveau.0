From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] drm/nouveau: propagate errors from vm
	flushes
Date: Sun, 27 May 2012 21:39:14 +0200
Message-ID: <20120527193914.GA2907@joi.lan>
References: <1335388836-13127-2-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335388836-13127-2-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] drm/nouveau: propagate errors from vm flushes

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v3: rebased on top of current nouveau-git
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   |    9 +++++++--
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fifo.h |    2 +-
 drivers/gpu/drm/nouveau/nouveau_vm.c   |   20 ++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_vm.h   |   20 ++++++++++----------
 drivers/gpu/drm/nouveau/nv50_fifo.c    |    4 ++--
 drivers/gpu/drm/nouveau/nv50_graph.c   |   12 ++++++++----
 drivers/gpu/drm/nouveau/nv50_mpeg.c    |    4 ++--
 drivers/gpu/drm/nouveau/nv50_vm.c      |   16 ++++++++++++----
 drivers/gpu/drm/nouveau/nv84_crypt.c   |    4 ++--
 drivers/gpu/drm/nouveau/nv98_crypt.c   |    4 ++--
 drivers/gpu/drm/nouveau/nva3_copy.c    |    4 ++--
 drivers/gpu/drm/nouveau/nvc0_vm.c      |   14 +++++++++++---
 13 files changed, 70 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ab15f5e..f30a75a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1427,10 +1427,15 @@ nouveau_bo_vma_add(struct nouveau_bo *nvbo, struct nouveau_vm *vm,
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
index b800c79..c1539b5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -125,7 +125,7 @@ struct nouveau_engine {
 	int  (*object_new)(struct nouveau_channel *, int engine,
 			   u32 handle, u16 class);
 	void (*set_tile_region)(struct nouveau_device *, int i);
-	void (*tlb_flush)(struct nouveau_device *, int engine);
+	int  (*tlb_flush)(struct nouveau_device *, int engine);
 };
 
 #define nouveau_engine_create(ndev,engine,sstr,fstr,data)                      \
diff --git a/drivers/gpu/drm/nouveau/nouveau_fifo.h b/drivers/gpu/drm/nouveau/nouveau_fifo.h
index 13a96ef..c2fb136 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fifo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fifo.h
@@ -20,7 +20,7 @@ void nv04_fifo_ramht(struct nouveau_device *, struct nouveau_ramht **);
 
 void nv50_fifo_playlist_update(struct nouveau_device *);
 void nv50_fifo_destroy(struct nouveau_device *, int);
-void nv50_fifo_tlb_flush(struct nouveau_device *, int);
+int  nv50_fifo_tlb_flush(struct nouveau_device *, int);
 
 int  nv04_fifo_create(struct nouveau_device *, int engine);
 int  nv10_fifo_create(struct nouveau_device *, int engine);
diff --git a/drivers/gpu/drm/nouveau/nouveau_vm.c b/drivers/gpu/drm/nouveau/nouveau_vm.c
index 2678a0b7..e3cd453 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vm.c
@@ -29,7 +29,7 @@
 #include "nouveau_vm.h"
 #include "nouveau_gpuobj.h"
 
-void
+int
 nouveau_vm_map_at(struct nouveau_vma *vma, u64 delta, struct nouveau_mem *node)
 {
 	struct nouveau_vm *vm = vma->vm;
@@ -69,16 +69,16 @@ nouveau_vm_map_at(struct nouveau_vma *vma, u64 delta, struct nouveau_mem *node)
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
@@ -112,10 +112,10 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
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
@@ -146,13 +146,13 @@ nouveau_vm_unmap_at(struct nouveau_vma *vma, u64 delta, u64 length)
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
index 93a975e..f3bd0a5 100644
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
-void nv50_vm_flush_engine(struct nouveau_device *, int engine);
+int  nv50_vm_flush(struct nouveau_vm *);
+int  nv50_vm_flush_engine(struct nouveau_device *, int engine);
 
 /* nvc0_vm.c */
 void nvc0_vm_map_pgt(struct nouveau_gpuobj *pgd, u32 pde,
@@ -110,7 +110,7 @@ void nvc0_vm_map(struct nouveau_vma *, struct nouveau_gpuobj *,
 void nvc0_vm_map_sg(struct nouveau_vma *, struct nouveau_gpuobj *,
 		    struct nouveau_mem *, u32 pte, u32 cnt, dma_addr_t *);
 void nvc0_vm_unmap(struct nouveau_gpuobj *, u32 pte, u32 cnt);
-void nvc0_vm_flush(struct nouveau_vm *);
-void nvc0_vm_flush_engine(struct nouveau_device *, u64 addr, u32 type);
+int  nvc0_vm_flush(struct nouveau_vm *);
+int  nvc0_vm_flush_engine(struct nouveau_device *, u64 addr, u32 type);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index a59094d..81271ee 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -229,10 +229,10 @@ nv50_fifo_fini(struct nouveau_device *ndev, int engine, bool suspend)
 	return 0;
 }
 
-void
+int
 nv50_fifo_tlb_flush(struct nouveau_device *ndev, int engine)
 {
-	nv50_vm_flush_engine(ndev, 5);
+	return nv50_vm_flush_engine(ndev, 5);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 4fe58eb..78365fe 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -205,13 +205,13 @@ nv50_graph_object_new(struct nouveau_channel *chan, int engine,
 	return ret;
 }
 
-static void
+static int
 nv50_graph_tlb_flush(struct nouveau_device *ndev, int engine)
 {
-	nv50_vm_flush_engine(ndev, 0);
+	return nv50_vm_flush_engine(ndev, 0);
 }
 
-static void
+static int
 nv84_graph_tlb_flush(struct nouveau_device *ndev, int engine)
 {
 	struct nouveau_timer *ptimer = nv_subdev(ndev, NVDEV_SUBDEV_TIMER);
@@ -219,6 +219,7 @@ nv84_graph_tlb_flush(struct nouveau_device *ndev, int engine)
 	unsigned long flags;
 	u64 start;
 	u32 tmp;
+	int ret = 0;
 
 	spin_lock_irqsave(&ndev->context_switch_lock, flags);
 	nv_mask(ndev, 0x400500, 0x00000001, 0x00000000);
@@ -249,12 +250,15 @@ nv84_graph_tlb_flush(struct nouveau_device *ndev, int engine)
 			      "0x%08x 0x%08x 0x%08x 0x%08x\n",
 			 nv_rd32(ndev, 0x400700), nv_rd32(ndev, 0x400380),
 			 nv_rd32(ndev, 0x400384), nv_rd32(ndev, 0x400388));
+		ret = -EIO;
 	}
 
-	nv50_vm_flush_engine(ndev, 0);
+	if (!ret)
+		ret = nv50_vm_flush_engine(ndev, 0);
 
 	nv_mask(ndev, 0x400500, 0x00000001, 0x00000001);
 	spin_unlock_irqrestore(&ndev->context_switch_lock, flags);
+	return ret;
 }
 
 static struct nouveau_enum nv50_mp_exec_error_names[] = {
diff --git a/drivers/gpu/drm/nouveau/nv50_mpeg.c b/drivers/gpu/drm/nouveau/nv50_mpeg.c
index 9a0e80b..2f3325c 100644
--- a/drivers/gpu/drm/nouveau/nv50_mpeg.c
+++ b/drivers/gpu/drm/nouveau/nv50_mpeg.c
@@ -115,10 +115,10 @@ nv50_mpeg_object_new(struct nouveau_channel *chan, int engine,
 	return ret;
 }
 
-static void
+static int
 nv50_mpeg_tlb_flush(struct nouveau_device *ndev, int engine)
 {
-	nv50_vm_flush_engine(ndev, 0x08);
+	return nv50_vm_flush_engine(ndev, 0x08);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nv50_vm.c b/drivers/gpu/drm/nouveau/nv50_vm.c
index a5be4cf..31138b4 100644
--- a/drivers/gpu/drm/nouveau/nv50_vm.c
+++ b/drivers/gpu/drm/nouveau/nv50_vm.c
@@ -146,30 +146,38 @@ nv50_vm_unmap(struct nouveau_gpuobj *pgt, u32 pte, u32 cnt)
 	}
 }
 
-void
+int
 nv50_vm_flush(struct nouveau_vm *vm)
 {
 	struct nouveau_device *ndev = vm->device;
 	int i;
+	int ret = 0;
 
 	nouveau_instmem_flush(ndev);
 
 	for (i = 0; i < NVDEV_SUBDEV_NR; i++) {
 		if (atomic_read(&vm->engref[i])) {
 			struct nouveau_engine *engine = nv_engine(ndev, i);
-			engine->tlb_flush(ndev, i);
+			ret = engine->tlb_flush(ndev, i);
+			if (ret)
+				break;
 		}
 	}
+	return ret;
 }
 
-void
+int
 nv50_vm_flush_engine(struct nouveau_device *ndev, int engine)
 {
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&ndev->vm_lock, flags);
 	nv_wr32(ndev, 0x100c80, (engine << 16) | 1);
-	if (!nv_wait(ndev, 0x100c80, 0x00000001, 0x00000000))
+	if (!nv_wait(ndev, 0x100c80, 0x00000001, 0x00000000)) {
 		NV_ERROR(ndev, "vm flush timeout: engine %d\n", engine);
+		ret = -EIO;
+	}
 	spin_unlock_irqrestore(&ndev->vm_lock, flags);
+	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nv84_crypt.c b/drivers/gpu/drm/nouveau/nv84_crypt.c
index 38dc6fc..6059f0e 100644
--- a/drivers/gpu/drm/nouveau/nv84_crypt.c
+++ b/drivers/gpu/drm/nouveau/nv84_crypt.c
@@ -114,10 +114,10 @@ nv84_crypt_object_new(struct nouveau_channel *chan, int engine,
 	return ret;
 }
 
-static void
+static int
 nv84_crypt_tlb_flush(struct nouveau_device *ndev, int engine)
 {
-	nv50_vm_flush_engine(ndev, 0x0a);
+	return nv50_vm_flush_engine(ndev, 0x0a);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nv98_crypt.c b/drivers/gpu/drm/nouveau/nv98_crypt.c
index ef2ff44..c42e41c 100644
--- a/drivers/gpu/drm/nouveau/nv98_crypt.c
+++ b/drivers/gpu/drm/nouveau/nv98_crypt.c
@@ -105,10 +105,10 @@ nv98_crypt_object_new(struct nouveau_channel *chan, int engine,
 	return nouveau_ramht_insert(chan, handle, cctx->mem);
 }
 
-static void
+static int
 nv98_crypt_tlb_flush(struct nouveau_device *ndev, int engine)
 {
-	nv50_vm_flush_engine(ndev, 0x0a);
+	return nv50_vm_flush_engine(ndev, 0x0a);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nva3_copy.c b/drivers/gpu/drm/nouveau/nva3_copy.c
index 87c3580..6e6482f 100644
--- a/drivers/gpu/drm/nouveau/nva3_copy.c
+++ b/drivers/gpu/drm/nouveau/nva3_copy.c
@@ -95,10 +95,10 @@ nva3_copy_context_del(struct nouveau_channel *chan, int engine)
 	chan->engctx[engine] = ctx;
 }
 
-static void
+static int
 nva3_copy_tlb_flush(struct nouveau_device *ndev, int engine)
 {
-	nv50_vm_flush_engine(ndev, 0x0d);
+	return nv50_vm_flush_engine(ndev, 0x0d);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvc0_vm.c b/drivers/gpu/drm/nouveau/nvc0_vm.c
index cc7096a..7301a5f 100644
--- a/drivers/gpu/drm/nouveau/nvc0_vm.c
+++ b/drivers/gpu/drm/nouveau/nvc0_vm.c
@@ -101,10 +101,11 @@ nvc0_vm_unmap(struct nouveau_gpuobj *pgt, u32 pte, u32 cnt)
 	}
 }
 
-void
+int
 nvc0_vm_flush_engine(struct nouveau_device *ndev, u64 addr, u32 type)
 {
 	unsigned long flags;
+	int ret = 0;
 
 	/* looks like maybe a "free flush slots" counter, the
 	 * faster you write to 0x100cbc to more it decreases
@@ -113,6 +114,7 @@ nvc0_vm_flush_engine(struct nouveau_device *ndev, u64 addr, u32 type)
 	if (!nv_wait_ne(ndev, 0x100c80, 0x00ff0000, 0x00000000)) {
 		NV_ERROR(ndev, "vm timeout 0: 0x%08x %d\n",
 			 nv_rd32(ndev, 0x100c80), type);
+		ret = -EIO;
 	}
 
 	nv_wr32(ndev, 0x100cb8, addr >> 8);
@@ -122,19 +124,25 @@ nvc0_vm_flush_engine(struct nouveau_device *ndev, u64 addr, u32 type)
 	if (!nv_wait(ndev, 0x100c80, 0x00008000, 0x00008000)) {
 		NV_ERROR(ndev, "vm timeout 1: 0x%08x %d\n",
 			 nv_rd32(ndev, 0x100c80), type);
+		ret = -EIO;
 	}
 	spin_unlock_irqrestore(&ndev->vm_lock, flags);
+	return ret;
 }
 
-void
+int
 nvc0_vm_flush(struct nouveau_vm *vm)
 {
 	struct nouveau_device *ndev = vm->device;
 	struct nouveau_vm_pgd *vpgd;
+	int ret = 0;
 
 	nouveau_instmem_flush(ndev);
 
 	list_for_each_entry(vpgd, &vm->pgd_list, head) {
-		nvc0_vm_flush_engine(ndev, vpgd->obj->vinst, 1);
+		ret = nvc0_vm_flush_engine(ndev, vpgd->obj->vinst, 1);
+		if (ret)
+			break;
 	}
+	return ret;
 }
-- 
1.7.8.6
