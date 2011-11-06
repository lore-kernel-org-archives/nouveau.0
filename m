From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: add nouveau.vram_limit module option
Date: Sun,  6 Nov 2011 20:32:07 +0100
Message-ID: <1320607930-21794-5-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Useful for simulating low-mem cards.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    4 ++++
 drivers/gpu/drm/nouveau/nouveau_drv.h |    2 ++
 drivers/gpu/drm/nouveau/nouveau_mem.c |   16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_vram.c   |    1 +
 drivers/gpu/drm/nouveau/nvc0_vram.c   |    1 +
 5 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 401c8ee..d46e7ce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -61,6 +61,10 @@ MODULE_PARM_DESC(vram_notify, "Force DMA notifiers to be in VRAM");
 int nouveau_vram_notify = 0;
 module_param_named(vram_notify, nouveau_vram_notify, int, 0400);
 
+MODULE_PARM_DESC(vram_limit, "Limit size of VRAM (MB)");
+int nouveau_vram_limit = 0;
+module_param_named(vram_limit, nouveau_vram_limit, int, 0400);
+
 MODULE_PARM_DESC(duallink, "Allow dual-link TMDS (>=GeForce 8)");
 int nouveau_duallink = 1;
 module_param_named(duallink, nouveau_duallink, int, 0400);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 1fb7894..4b5d5aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -865,6 +865,7 @@ extern int nouveau_uscript_lvds;
 extern int nouveau_uscript_tmds;
 extern int nouveau_vram_pushbuf;
 extern int nouveau_vram_notify;
+extern int nouveau_vram_limit;
 extern int nouveau_fbpercrtc;
 extern int nouveau_tv_disable;
 extern char *nouveau_tv_norm;
@@ -912,6 +913,7 @@ extern void nouveau_mem_gart_fini(struct drm_device *);
 extern int  nouveau_mem_init_agp(struct drm_device *);
 extern int  nouveau_mem_reset_agp(struct drm_device *);
 extern void nouveau_mem_close(struct drm_device *);
+extern void nouveau_limit_vram(struct drm_device *);
 extern int  nouveau_mem_detect(struct drm_device *);
 extern bool nouveau_mem_flags_valid(struct drm_device *, u32 tile_flags);
 extern struct nouveau_tile_reg *nv10_mem_set_tiling(
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 36bec48..3330d6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -240,6 +240,21 @@ nouveau_mem_detect_nforce(struct drm_device *dev)
 	return 0;
 }
 
+void nouveau_limit_vram(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	u64 tmp;
+	if (!nouveau_vram_limit)
+		return;
+
+	tmp = min((u64)(nouveau_vram_limit << 20), dev_priv->vram_size);
+	if (tmp != dev_priv->vram_size) {
+		NV_INFO(dev, "limiting size of VRAM to %d MiB (from %d MiB)\n",
+				(int)(tmp >> 20), (int)(dev_priv->vram_size >> 20));
+		dev_priv->vram_size = tmp;
+	}
+}
+
 int
 nouveau_mem_detect(struct drm_device *dev)
 {
@@ -255,6 +270,7 @@ nouveau_mem_detect(struct drm_device *dev)
 		dev_priv->vram_size  = nv_rd32(dev, NV04_PFB_FIFO_DATA);
 		dev_priv->vram_size &= NV10_PFB_FIFO_DATA_RAM_AMOUNT_MB_MASK;
 	}
+	nouveau_limit_vram(dev);
 
 	if (dev_priv->vram_size)
 		return 0;
diff --git a/drivers/gpu/drm/nouveau/nv50_vram.c b/drivers/gpu/drm/nouveau/nv50_vram.c
index 2e45e57..266c111 100644
--- a/drivers/gpu/drm/nouveau/nv50_vram.c
+++ b/drivers/gpu/drm/nouveau/nv50_vram.c
@@ -194,6 +194,7 @@ nv50_vram_init(struct drm_device *dev)
 	dev_priv->vram_size  = nv_rd32(dev, 0x10020c);
 	dev_priv->vram_size |= (dev_priv->vram_size & 0xff) << 32;
 	dev_priv->vram_size &= 0xffffffff00ULL;
+	nouveau_limit_vram(dev);
 
 	/* IGPs, no funky reordering happens here, they don't have VRAM */
 	if (dev_priv->chipset == 0xaa ||
diff --git a/drivers/gpu/drm/nouveau/nvc0_vram.c b/drivers/gpu/drm/nouveau/nvc0_vram.c
index ce984d5..b3cee9c 100644
--- a/drivers/gpu/drm/nouveau/nvc0_vram.c
+++ b/drivers/gpu/drm/nouveau/nvc0_vram.c
@@ -132,6 +132,7 @@ nvc0_vram_init(struct drm_device *dev)
 		NV_DEBUG(dev, "%d: mem_amount 0x%08x\n", part, psize);
 		dev_priv->vram_size += (u64)psize << 20;
 	}
+	nouveau_limit_vram(dev);
 
 	/* if all controllers have the same amount attached, there's no holes */
 	if (uniform) {
-- 
1.7.7
