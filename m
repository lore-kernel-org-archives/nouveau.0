From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 4/4] drm/nouveau: change FB map to simple ioremap
Date: Sat, 25 Jul 2009 15:29:07 +0300
Message-ID: <1248524947-4550-5-git-send-email-pq@iki.fi>
References: <1248524947-4550-1-git-send-email-pq@iki.fi>
	<1248524947-4550-2-git-send-email-pq@iki.fi>
	<1248524947-4550-3-git-send-email-pq@iki.fi>
	<1248524947-4550-4-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1248524947-4550-4-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Remove the use of drm_local_map for the FB mapping and replace it with
the equivalent ioremap.

Macros nv_[rw]f32() are changed into inline functions and the 'dev'
argument is explicit.

Macros nv_[rw]v32() are removed as unused.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   17 ++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_hw.c    |   16 ++++++++--------
 drivers/gpu/drm/nouveau/nouveau_state.c |   12 +++++-------
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 4d53129..74f835f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -448,7 +448,7 @@ struct drm_nouveau_private {
 	int flags;
 
 	void __iomem *mmio;
-	struct drm_local_map *fb;
+	void __iomem *fb;
 	struct drm_local_map *ramin;
 
 	struct work_struct irq_work;
@@ -998,10 +998,17 @@ static inline void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
 						 (mask), (val))
 
 /* VRAM access */
-#define nv_rf32(reg) nv_in32(fb, (reg))
-#define nv_wf32(reg,val) nv_out32(fb, (reg), (val))
-#define nv_rv32(reg) nv_rf32(reg)
-#define nv_wv32(reg,val) nv_wf32(reg, val)
+static inline u32 nv_rf32(struct drm_device *dev, unsigned reg)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	return ioread32_native(dev_priv->fb + reg);
+}
+
+static inline void nv_wf32(struct drm_device *dev, unsigned reg, u32 val)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	iowrite32_native(val, dev_priv->fb + reg);
+}
 
 /* PRAMIN access */
 #define nv_ri32(reg) nv_in32(ramin, (reg))
diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.c b/drivers/gpu/drm/nouveau/nouveau_hw.c
index f3cd10d..295b876 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.c
@@ -578,36 +578,36 @@ nouveau_hw_save_vga_fonts(struct drm_device *dev, bool save)
 	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x0);
 	for (i = 0; i < 16384; i++)
 		if (save)
-			dev_priv->saved_vga_font[0][i] = nv_rf32(i * 4);
+			dev_priv->saved_vga_font[0][i] = nv_rf32(dev, i * 4);
 		else
-			nv_wf32(i * 4, dev_priv->saved_vga_font[0][i]);
+			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[0][i]);
 
 	/* store font in plane 1 */
 	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x2);
 	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x1);
 	for (i = 0; i < 16384; i++)
 		if (save)
-			dev_priv->saved_vga_font[1][i] = nv_rf32(i * 4);
+			dev_priv->saved_vga_font[1][i] = nv_rf32(dev, i * 4);
 		else
-			nv_wf32(i * 4, dev_priv->saved_vga_font[1][i]);
+			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[1][i]);
 
 	/* store font in plane 2 */
 	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x4);
 	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x2);
 	for (i = 0; i < 16384; i++)
 		if (save)
-			dev_priv->saved_vga_font[2][i] = nv_rf32(i * 4);
+			dev_priv->saved_vga_font[2][i] = nv_rf32(dev, i * 4);
 		else
-			nv_wf32(i * 4, dev_priv->saved_vga_font[2][i]);
+			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[2][i]);
 
 	/* store font in plane 3 */
 	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x8);
 	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x3);
 	for (i = 0; i < 16384; i++)
 		if (save)
-			dev_priv->saved_vga_font[3][i] = nv_rf32(i * 4);
+			dev_priv->saved_vga_font[3][i] = nv_rf32(dev, i * 4);
 		else
-			nv_wf32(i * 4, dev_priv->saved_vga_font[3][i]);
+			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[3][i]);
 
 	/* restore control regs */
 	NVWritePRMVIO(dev, 0, NV_PRMVIO_MISC__WRITE, misc);
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index b70ec33..3a6cabf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -579,12 +579,10 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	/* map first 64KiB of VRAM, holds VGA fonts etc */
-	ret = drm_addmap(dev, drm_get_resource_start(dev, 1), 65536,
-			 _DRM_REGISTERS, _DRM_READ_ONLY | _DRM_DRIVER,
-			 &dev_priv->fb);
-	if (ret) {
-		NV_ERROR(dev, "Failed to map FB BAR: %d\n", ret);
-		return ret;
+	dev_priv->fb = ioremap(pci_resource_start(dev->pdev, 1), 65536);
+	if (!dev_priv->fb) {
+		NV_ERROR(dev, "Failed to map FB BAR\n");
+		return -ENOMEM;
 	}
 
 #if defined(__powerpc__)
@@ -656,7 +654,7 @@ int nouveau_unload(struct drm_device *dev)
 
 	iounmap(dev_priv->mmio);
 	drm_rmmap(dev, dev_priv->ramin);
-	drm_rmmap(dev, dev_priv->fb);
+	iounmap(dev_priv->fb);
 
 	kfree(dev_priv);
 	dev->dev_private = NULL;
-- 
1.6.3.3
