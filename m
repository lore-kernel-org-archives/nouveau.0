From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/4] drm/nouveau: refactor VGA font save/restore
Date: Sun,  2 Aug 2009 18:12:49 +0300
Message-ID: <1249225972-4655-1-git-send-email-pq@iki.fi>
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

Remove drm_nouveau_private::fb member and map the piece of VRAM only
when accessing VGA fonts.

Collect copied code into the static function nouveau_vga_font_io().

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   17 -------
 drivers/gpu/drm/nouveau/nouveau_hw.c    |   75 +++++++++++++++----------------
 drivers/gpu/drm/nouveau/nouveau_state.c |    8 ---
 3 files changed, 37 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 5477dc0..c6143b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -461,7 +461,6 @@ struct drm_nouveau_private {
 	int flags;
 
 	void __iomem *mmio;
-	void __iomem *fb;
 	void __iomem *ramin;
 	uint32_t ramin_size;
 
@@ -1014,22 +1013,6 @@ static inline void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
 #define nv_wait(reg,mask,val) nouveau_wait_until(dev, 2000000000ULL, (reg),    \
 						 (mask), (val))
 
-/*
- * VRAM access for the first 64kB
- * see nouveau_state.c
- */
-static inline u32 nv_rf32(struct drm_device *dev, unsigned offset)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return ioread32_native(dev_priv->fb + offset);
-}
-
-static inline void nv_wf32(struct drm_device *dev, unsigned offset, u32 val)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	iowrite32_native(val, dev_priv->fb + offset);
-}
-
 /* PRAMIN access */
 static inline u32 nv_ri32(struct drm_device *dev, unsigned offset)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.c b/drivers/gpu/drm/nouveau/nouveau_hw.c
index 295b876..6f55f55 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.c
@@ -537,13 +537,33 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
  * vga font save/restore
  */
 
+static void nouveau_vga_font_io(struct drm_device *dev,
+				void __iomem *iovram,
+				bool save, unsigned plane)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	unsigned i;
+
+	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 1 << plane);
+	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, plane);
+	for (i = 0; i < 16384; i++) {
+		if (save) {
+			dev_priv->saved_vga_font[plane][i] =
+					ioread32_native(iovram + i * 4);
+		} else {
+			iowrite32_native(dev_priv->saved_vga_font[plane][i],
+							iovram + i * 4);
+		}
+	}
+}
+
 void
 nouveau_hw_save_vga_fonts(struct drm_device *dev, bool save)
 {
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	uint8_t misc, gr4, gr5, gr6, seq2, seq4;
 	bool graphicsmode;
-	int i;
+	unsigned plane;
+	void __iomem *iovram;
 
 	if (nv_two_heads(dev))
 		NVSetOwner(dev, 0);
@@ -552,10 +572,19 @@ nouveau_hw_save_vga_fonts(struct drm_device *dev, bool save)
 	graphicsmode = NVReadVgaAttr(dev, 0, NV_CIO_AR_MODE_INDEX) & 1;
 	NVSetEnablePalette(dev, 0, false);
 
-	if (graphicsmode)	/* graphics mode => framebuffer => no need to save */
+	if (graphicsmode) /* graphics mode => framebuffer => no need to save */
 		return;
 
 	NV_INFO(dev, "%sing VGA fonts\n", save ? "Sav" : "Restor");
+
+	/* map first 64KiB of VRAM, holds VGA fonts etc */
+	iovram = ioremap(pci_resource_start(dev->pdev, 1), 65536);
+	if (!iovram) {
+		NV_ERROR(dev, "Failed to map VRAM, "
+					"cannot save/restore VGA fonts.\n");
+		return;
+	}
+
 	if (nv_two_heads(dev))
 		NVBlankScreen(dev, 1, true);
 	NVBlankScreen(dev, 0, true);
@@ -573,41 +602,9 @@ nouveau_hw_save_vga_fonts(struct drm_device *dev, bool save)
 	NVWriteVgaGr(dev, 0, NV_VIO_GX_MODE_INDEX, 0x0);
 	NVWriteVgaGr(dev, 0, NV_VIO_GX_MISC_INDEX, 0x5);
 
-	/* store font in plane 0 */
-	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x1);
-	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x0);
-	for (i = 0; i < 16384; i++)
-		if (save)
-			dev_priv->saved_vga_font[0][i] = nv_rf32(dev, i * 4);
-		else
-			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[0][i]);
-
-	/* store font in plane 1 */
-	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x2);
-	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x1);
-	for (i = 0; i < 16384; i++)
-		if (save)
-			dev_priv->saved_vga_font[1][i] = nv_rf32(dev, i * 4);
-		else
-			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[1][i]);
-
-	/* store font in plane 2 */
-	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x4);
-	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x2);
-	for (i = 0; i < 16384; i++)
-		if (save)
-			dev_priv->saved_vga_font[2][i] = nv_rf32(dev, i * 4);
-		else
-			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[2][i]);
-
-	/* store font in plane 3 */
-	NVWriteVgaSeq(dev, 0, NV_VIO_SR_PLANE_MASK_INDEX, 0x8);
-	NVWriteVgaGr(dev, 0, NV_VIO_GX_READ_MAP_INDEX, 0x3);
-	for (i = 0; i < 16384; i++)
-		if (save)
-			dev_priv->saved_vga_font[3][i] = nv_rf32(dev, i * 4);
-		else
-			nv_wf32(dev, i * 4, dev_priv->saved_vga_font[3][i]);
+	/* store font in planes 0..3 */
+	for (plane = 0; plane < 4; plane++)
+		nouveau_vga_font_io(dev, iovram, save, plane);
 
 	/* restore control regs */
 	NVWritePRMVIO(dev, 0, NV_PRMVIO_MISC__WRITE, misc);
@@ -620,6 +617,8 @@ nouveau_hw_save_vga_fonts(struct drm_device *dev, bool save)
 	if (nv_two_heads(dev))
 		NVBlankScreen(dev, 1, false);
 	NVBlankScreen(dev, 0, false);
+
+	iounmap(iovram);
 }
 
 /*
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 93d14f3..ace8beb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -590,13 +590,6 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 		}
 	}
 
-	/* map first 64KiB of VRAM, holds VGA fonts etc */
-	dev_priv->fb = ioremap(pci_resource_start(dev->pdev, 1), 65536);
-	if (!dev_priv->fb) {
-		NV_ERROR(dev, "Failed to map FB BAR\n");
-		return -ENOMEM;
-	}
-
 	nouveau_OF_copy_vbios_to_ramin(dev);
 
 	/* Special flags */
@@ -648,7 +641,6 @@ int nouveau_unload(struct drm_device *dev)
 
 	iounmap(dev_priv->mmio);
 	iounmap(dev_priv->ramin);
-	iounmap(dev_priv->fb);
 
 	kfree(dev_priv);
 	dev->dev_private = NULL;
-- 
1.6.3.3
