From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: protect vm refcount with mutex
Date: Mon, 29 Jul 2013 11:55:02 +0200
Message-ID: <51F63BF6.5090903@canonical.com>
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
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The refcount was not protected by the vm lock, fix this..

------------[ cut here ]------------
WARNING: CPU: 2 PID: 2008 at drivers/gpu/drm/nouveau/core/core/mm.c:242 nouveau_mm_fini+0x4f/0x56 [nouveau]()
Modules linked in: adt7475 ebtable_nat ebtables nouveau ipt_MASQUERADE iptable_nat nf_nat_ipv4 nf_nat xt_CHECKSUM iptable_mangle bridge stp llc snd_hda_codec_hdmi kvm_intel ttm kvm drm_kms_helper drm mxm_wmi snd_hda_codec_realtek snd_hda_intel e1000e snd_hda_codec snd_hwdep snd_pcm ptp pps_core snd_page_alloc video parport_pc ppdev nfsd parport lockd nfs_acl auth_rpcgss sunrpc oid_registry
CPU: 2 PID: 2008 Comm: Xorg Tainted: G        W    3.11.0-rc1-patser+ #119
Hardware name: Acer Aspire M3985/Aspire M3985, BIOS P01-A1 03/12/2012
 00000000000000f2 ffff8803f59b1b68 ffffffff81637988 000000000000b0b0
 0000000000000000 ffff8803f59b1ba8 ffffffff81059e1d 0000000000000000
 0000000000000000 ffff8803f9dd6c48 ffff8803f9dd6c00 ffff8803f688d898
Call Trace:
 [<ffffffff81637988>] dump_stack+0x55/0x86
 [<ffffffff81059e1d>] warn_slowpath_common+0x87/0xaf
 [<ffffffff81059e5a>] warn_slowpath_null+0x15/0x17
 [<ffffffffa02d6109>] nouveau_mm_fini+0x4f/0x56 [nouveau]
 [<ffffffffa02f5703>] nouveau_vm_ref+0x154/0x180 [nouveau]
 [<ffffffffa02d5cdb>] ? nouveau_mm_free+0x85/0x116 [nouveau]
 [<ffffffffa02f57c9>] nouveau_vm_put+0x9a/0xb0 [nouveau]
 [<ffffffffa033462d>] ? nouveau_gem_info+0x9d/0x9d [nouveau]
 [<ffffffffa0334646>] nouveau_gem_object_delete+0x19/0x28 [nouveau]
 [<ffffffffa032fc90>] nouveau_fence_work+0xc9/0x102 [nouveau]
 [<ffffffffa0334d59>] nouveau_gem_object_close+0x103/0x182 [nouveau]
 [<ffffffffa01d8bcd>] drm_gem_handle_delete+0xcc/0x153 [drm]
 [<ffffffffa01d8fc5>] drm_gem_close_ioctl+0x23/0x25 [drm]
 [<ffffffffa01d6f75>] drm_ioctl+0x4cc/0x612 [drm]
 [<ffffffff816341c0>] ? __slab_free.isra.66+0x24d/0x2aa
 [<ffffffffa01d8fa2>] ? drm_gem_destroy+0x4c/0x4c [drm]
 [<ffffffff812dbef8>] ? avc_has_perm_flags+0xb1/0x179
 [<ffffffff8115e988>] do_vfs_ioctl+0x8b/0x4f8
 [<ffffffff812dccb4>] ? inode_has_perm.isra.43.constprop.75+0x25/0x2b
 [<ffffffff812debef>] ? file_has_perm+0x8c/0x9a
 [<ffffffff810d3267>] ? rcu_user_exit+0xe/0x10
 [<ffffffff8115ee7f>] SyS_ioctl+0x8a/0x9b
 [<ffffffff8164240b>] tracesys+0xdd/0xe2
---[ end trace f99ff0179509b495 ]---

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---

diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
index 3b90b42..afc5106 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
@@ -28,6 +28,8 @@
 #include <subdev/fb.h>
 #include <subdev/vm.h>
 
+static void nouveau_vm_del(struct nouveau_vm *vm);
+
 void
 nouveau_vm_map_at(struct nouveau_vma *vma, u64 delta, struct nouveau_mem *node)
 {
@@ -335,10 +337,10 @@ nouveau_vm_get(struct nouveau_vm *vm, u64 size, u32 page_shift,
 			return ret;
 		}
 	}
+	++vm->refcount;
+	vma->vm = vm;
 	mutex_unlock(&nv_subdev(vmm)->mutex);
 
-	vma->vm = NULL;
-	nouveau_vm_ref(vm, &vma->vm, NULL);
 	vma->offset = (u64)vma->node->offset << 12;
 #ifdef NOUVEAU_VM_POISON
 	if (vm->poison)
@@ -353,7 +355,7 @@ nouveau_vm_put(struct nouveau_vma *vma)
 {
 	struct nouveau_vm *vm = vma->vm;
 	struct nouveau_vmmgr *vmm = vm->vmm;
-	u32 fpde, lpde;
+	u32 fpde, lpde, ref;
 
 	if (unlikely(vma->node == NULL))
 		return;
@@ -363,9 +365,12 @@ nouveau_vm_put(struct nouveau_vma *vma)
 	mutex_lock(&nv_subdev(vmm)->mutex);
 	nouveau_vm_unmap_pgt(vm, vma->node->type != vmm->spg_shift, fpde, lpde);
 	nouveau_mm_free(&vm->mm, &vma->node);
-	mutex_unlock(&nv_subdev(vmm)->mutex);
 
-	nouveau_vm_ref(NULL, &vma->vm, NULL);
+	vma->vm = NULL;
+	ref = --vm->refcount;
+	mutex_unlock(&nv_subdev(vmm)->mutex);
+	if (!ref)
+		nouveau_vm_del(vm);
 }
 
 int
@@ -429,25 +434,21 @@ nouveau_vm_link(struct nouveau_vm *vm, struct nouveau_gpuobj *pgd)
 
 	nouveau_gpuobj_ref(pgd, &vpgd->obj);
 
-	mutex_lock(&nv_subdev(vmm)->mutex);
 	for (i = vm->fpde; i <= vm->lpde; i++)
 		vmm->map_pgt(pgd, i, vm->pgt[i - vm->fpde].obj);
 	list_add(&vpgd->head, &vm->pgd_list);
-	mutex_unlock(&nv_subdev(vmm)->mutex);
 	return 0;
 }
 
 static void
 nouveau_vm_unlink(struct nouveau_vm *vm, struct nouveau_gpuobj *mpgd)
 {
-	struct nouveau_vmmgr *vmm = vm->vmm;
 	struct nouveau_vm_pgd *vpgd, *tmp;
 	struct nouveau_gpuobj *pgd = NULL;
 
 	if (!mpgd)
 		return;
 
-	mutex_lock(&nv_subdev(vmm)->mutex);
 	list_for_each_entry_safe(vpgd, tmp, &vm->pgd_list, head) {
 		if (vpgd->obj == mpgd) {
 			pgd = vpgd->obj;
@@ -456,7 +457,6 @@ nouveau_vm_unlink(struct nouveau_vm *vm, struct nouveau_gpuobj *mpgd)
 			break;
 		}
 	}
-	mutex_unlock(&nv_subdev(vmm)->mutex);
 
 	nouveau_gpuobj_ref(NULL, &pgd);
 }
@@ -489,20 +489,31 @@ nouveau_vm_ref(struct nouveau_vm *ref, struct nouveau_vm **ptr,
 
 	vm = ref;
 	if (vm) {
+		struct nouveau_vmmgr *vmm = vm->vmm;
+
+		mutex_lock(&nv_subdev(vmm)->mutex);
 		ret = nouveau_vm_link(vm, pgd);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&nv_subdev(vmm)->mutex);
 			return ret;
+		}
 
 		vm->refcount++;
+		mutex_unlock(&nv_subdev(vmm)->mutex);
 	}
 
 	vm = *ptr;
 	*ptr = ref;
 
 	if (vm) {
+		struct nouveau_vmmgr *vmm = vm->vmm;
+
+		mutex_lock(&nv_subdev(vmm)->mutex);
 		nouveau_vm_unlink(vm, pgd);
 
-		if (--vm->refcount == 0)
+		ret = --vm->refcount;
+		mutex_unlock(&nv_subdev(vmm)->mutex);
+		if (!ret)
 			nouveau_vm_del(vm);
 	}
