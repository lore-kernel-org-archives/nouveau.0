From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: add some basic debugfs dumping for
 nouveau's clients and vm mappings
Date: Thu, 17 Apr 2014 17:13:46 +0200
Message-ID: <534FEFAA.6090109@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This adds some basic debug information about the internal nouveau state.
making it slightly easier to determine which bo belongs to which vm address,
as long as that program is still running.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/vm.h b/drivers/gpu/drm/nouveau/core/include/subdev/vm.h
index c9509039f94b..945ca4efe97c 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/vm.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/vm.h
@@ -50,6 +50,12 @@ struct nouveau_vma {
  	struct nouveau_mm_node *node;
  	u64 offset;
  	u32 access;
+	enum nouveau_vma_mapping {
+		NOUVEAU_MAP_UNMAPPED,
+		NOUVEAU_MAP_SG,
+		NOUVEAU_MAP_GART,
+		NOUVEAU_MAP_VRAM
+	} mapping;
  };
  
  struct nouveau_vm {
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
index 7dd680ff2f6f..6deb6de88717 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
@@ -70,6 +70,7 @@ nouveau_vm_map_at(struct nouveau_vma *vma, u64 delta, struct nouveau_mem *node)
  	}
  
  	vmm->flush(vm);
+	vma->mapping = NOUVEAU_MAP_VRAM;
  }
  
  static void
@@ -128,6 +129,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
  	}
  finish:
  	vmm->flush(vm);
+	vma->mapping = NOUVEAU_MAP_SG;
  }
  
  static void
@@ -166,6 +168,7 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
  	}
  
  	vmm->flush(vm);
+	vma->mapping = NOUVEAU_MAP_GART;
  }
  
  void
@@ -213,6 +216,7 @@ nouveau_vm_unmap_at(struct nouveau_vma *vma, u64 delta, u64 length)
  	}
  
  	vmm->flush(vm);
+	vma->mapping = NOUVEAU_MAP_UNMAPPED;
  }
  
  void
@@ -330,6 +334,7 @@ nouveau_vm_get(struct nouveau_vm *vm, u64 size, u32 page_shift,
  	nouveau_vm_ref(vm, &vma->vm, NULL);
  	vma->offset = (u64)vma->node->offset << 12;
  	vma->access = access;
+	vma->mapping = NOUVEAU_MAP_UNMAPPED;
  	return 0;
  }
  
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 900fae01793e..ba2d43fb37c6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -47,6 +47,8 @@ nouveau_abi16_get(struct drm_file *file_priv, struct drm_device *dev)
  		struct nouveau_abi16 *abi16;
  		cli->abi16 = abi16 = kzalloc(sizeof(*abi16), GFP_KERNEL);
  		if (cli->abi16) {
+			abi16->file = file_priv;
+
  			INIT_LIST_HEAD(&abi16->channels);
  			abi16->client = nv_object(cli);
  
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 90004081a501..79a66f0180a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -31,6 +31,7 @@ struct nouveau_abi16 {
  	struct nouveau_object *client;
  	struct nouveau_object *device;
  	struct list_head channels;
+	struct drm_file *file;
  	u64 handles;
  };
  
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 5392e07edfc6..ca2d4817c85c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -30,6 +30,14 @@
  
  #include "nouveau_debugfs.h"
  #include "nouveau_drm.h"
+#include "nouveau_bo.h"
+#include "nouveau_abi16.h"
+#include "nv50_display.h"
+#include "nouveau_fence.h"
+#include "nouveau_chan.h"
+#include "nouveau_gem.h"
+#include "nouveau_fbcon.h"
+#include "subdev/fb.h"
  
  static int
  nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
@@ -43,8 +51,204 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
  	return 0;
  }
  
+static void nouveau_get_access(char *ba, u32 access)
+{
+	if (access & NV_MEM_ACCESS_RO)
+		*ba++ = 'R';
+	else
+		*ba++ = '-';
+
+	if (access & NV_MEM_ACCESS_WO)
+		*ba++ = 'W';
+	else
+		*ba++ = '-';
+
+	if (access & NV_MEM_ACCESS_SYS)
+		*ba++ = 'S';
+
+	if (access & NV_MEM_ACCESS_NOSNOOP)
+		*ba++ = 'N';
+
+	*ba = 0;
+}
+
+static const char *nouveau_get_mapping(enum nouveau_vma_mapping mapping)
+{
+	switch (mapping) {
+	case NOUVEAU_MAP_UNMAPPED: return "unmapped";
+	case NOUVEAU_MAP_SG: return "sgt ";
+	case NOUVEAU_MAP_GART: return "gart";
+	case NOUVEAU_MAP_VRAM: return "vram";
+	default: return "????";
+	}
+}
+
+static void dump_single_bo(struct seq_file *m, struct nouveau_bo *nvbo, int handle, struct nouveau_vma *vma)
+{
+	char ba[5];
+	u64 offset = vma->offset, len = 0, end = vma->offset;
+	const char *map = nouveau_get_mapping(vma->mapping);
+
+	nouveau_get_access(ba, vma->access);
+
+	if (vma->node) {
+		len = vma->node->length << 12;
+		end = vma->offset + len - 1;
+	}
+
+	seq_printf(m, "\tbo %p with handle %02i mapped %s at [%08llx-%08llx]: %s size %llu\n",
+		   nvbo, handle, ba, offset, end, map, len);
+}
+
+/*
+ * In theory this function doesn't need locking because all bo's are pinned,
+ * and we hold the modification lock.
+ */
+static void dump_channel_single(struct seq_file *m, struct nouveau_drm *drm,
+				struct nouveau_cli *cli, struct nouveau_channel *chan)
+{
+	struct nouveau_device *device = nv_device(drm->device);
+
+	if (device->chipset >= 0x84) {
+		struct nv84_fence_priv *priv = drm->fence;
+		struct nv84_fence_chan *fctx = chan->fence;
+		int i;
+
+		for (i = 0; i < drm->dev->mode_config.num_crtc; i++) {
+			struct nouveau_bo *bo = nv50_display_crtc_sema(drm->dev, i);
+
+			dump_single_bo(m, bo, -2, &fctx->dispc_vma[i]);
+		}
+		dump_single_bo(m, priv->bo, -3, &fctx->vma);
+		dump_single_bo(m, priv->bo_gart, -3, &fctx->vma_gart);
+	}
+
+	if (chan->push.buffer)
+		dump_single_bo(m, chan->push.buffer, -4, &chan->push.vma);
+}
+
+static void dump_channels_abi16(struct seq_file *m, struct nouveau_drm *drm,
+				struct nouveau_cli *cli, struct nouveau_abi16 *abi16)
+{
+	struct nouveau_abi16_chan *chan;
+	int i = 0;
+
+	if (!mutex_trylock(&cli->mutex)) {
+		seq_printf(m, "    *** skipping channels to prevent deadlock ***\n");
+		return;
+	}
+	list_for_each_entry(chan, &abi16->channels, head) {
+		seq_printf(m, "    channel %i\n", i++);
+		dump_channel_single(m, drm, cli, chan->chan);
+		if (chan->ntfy)
+			dump_single_bo(m, chan->ntfy, -5, &chan->ntfy_vma);
+	}
+	mutex_unlock(&cli->mutex);
+}
+
+
+/*
+ * important bo's to dump:
+ *  - all gem handles
+ *  - ntfy bo in abi16
+ *  - chan->push.buffer
+ *  - nv84+: vma for fences and display semaphores
+ *  - nv50+: framebuffer vma in kernel channel
+ *  - nvc0+: gpuobj mappings in fifo and graph
+ */
+
+static int dump_client(struct seq_file *m, struct nouveau_drm *drm, struct nouveau_cli *cli)
+{
+	struct nouveau_abi16 *abi16;
+	struct drm_file *filp = NULL;
+	struct nouveau_vma *vma;
+	int ret = 0;
+	struct drm_gem_object *entry;
+	u32 id;
+
+	seq_printf(m, "client \"%s\"\n", cli->base.name);
+
+	if (!cli->base.vm)
+		return 0;
+
+	abi16 = cli->abi16;
+	if (!abi16)
+		return 0;
+
+	filp = abi16->file;
+	dump_channels_abi16(m, drm, cli, abi16);
+
+	seq_printf(m, "    gem handles\n");
+	spin_lock(&filp->table_lock);
+	idr_for_each_entry(&filp->object_idr, entry, id) {
+		struct nouveau_bo *nvbo = nouveau_gem_object(entry);
+		struct ttm_buffer_object *bo = &nvbo->bo;
+
+		ttm_bo_reference(&nvbo->bo);
+		spin_unlock(&filp->table_lock);
+
+		ret = ww_mutex_lock_interruptible(&nvbo->bo.resv->lock, NULL);
+		if (ret) {
+			ttm_bo_unref(&bo);
+			return ret;
+		}
+
+		vma = nouveau_bo_vma_find(nvbo, cli->base.vm);
+		if (vma)
+			dump_single_bo(m, nvbo, id, vma);
+		else
+			WARN_ON(1);
+		ww_mutex_unlock(&nvbo->bo.resv->lock);
+		ttm_bo_unref(&bo);
+
+		spin_lock(&filp->table_lock);
+	}
+	spin_unlock(&filp->table_lock);
+	return ret;
+}
+
+static int
+nouveau_debugfs_clients(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_cli *cli;
+	int ret = 0;
+
+	mutex_lock(&drm->client.mutex);
+
+	seq_printf(m, "client \"%s\"\n", drm->client.base.name);
+
+	if (drm->fbcon && drm->fbcon->nouveau_fb.nvbo) {
+		seq_printf(m, "    fbcon mapping\n");
+		dump_single_bo(m, drm->fbcon->nouveau_fb.nvbo,
+			       -6, &drm->fbcon->nouveau_fb.vma);
+	}
+
+	if (drm->channel) {
+		seq_printf(m, "    drm channel permanent mappings\n");
+		dump_channel_single(m, drm, cli, drm->channel);
+	}
+
+	if (drm->cechan) {
+		seq_printf(m, "    drm copy engine channel permanent mappings\n");
+		dump_channel_single(m, drm, cli, drm->cechan);
+	}
+
+	list_for_each_entry(cli, &drm->clients, head) {
+		seq_printf(m, "\n");
+		ret = dump_client(m, drm, cli);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&drm->client.mutex);
+	return ret;
+}
+
  static struct drm_info_list nouveau_debugfs_list[] = {
  	{ "vbios.rom", nouveau_debugfs_vbios_image, 0, NULL },
+	{ "nouveau_clients", nouveau_debugfs_clients, 0, NULL },
  };
  #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
