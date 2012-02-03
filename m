From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH 2/4] nouveau: Add stubs for reserving old framebuffers
Date: Fri,  3 Feb 2012 13:22:20 -0500
Message-ID: <1328293342-1643-2-git-send-email-mjg@redhat.com>
References: <1328293342-1643-1-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1328293342-1643-1-git-send-email-mjg@redhat.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Garrett <mjg@redhat.com>
List-Id: nouveau.vger.kernel.org

Add core support for allocating buffer objects that cover the existing
framebuffers at startup.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    2 ++
 drivers/gpu/drm/nouveau/nouveau_mem.c   |    4 ++++
 drivers/gpu/drm/nouveau/nouveau_state.c |    9 ++++++++-
 3 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index ab4c071..3186545 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -400,6 +400,7 @@ struct nouveau_display_engine {
 	void (*destroy)(struct drm_device *);
 	int (*init)(struct drm_device *);
 	void (*fini)(struct drm_device *);
+	void (*reserve_fbs)(struct drm_device *);
 
 	struct drm_property *dithering_mode;
 	struct drm_property *dithering_depth;
@@ -729,6 +730,7 @@ struct drm_nouveau_private {
 	struct list_head classes;
 
 	struct nouveau_bo *vga_ram;
+	struct nouveau_bo *old_fb[2];
 
 	/* interrupt handling */
 	void (*irq_handler[32])(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 1c510ef..7961331 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -339,6 +339,7 @@ nouveau_mem_vram_init(struct drm_device *dev)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct ttm_bo_device *bdev = &dev_priv->ttm.bdev;
 	const struct vram_types *vram_type;
+	struct nouveau_engine *engine = &dev_priv->engine;
 	int ret, dma_bits;
 
 	dma_bits = 32;
@@ -426,6 +427,9 @@ nouveau_mem_vram_init(struct drm_device *dev)
 		}
 	}
 
+	if (engine->display.reserve_fbs)
+		engine->display.reserve_fbs(dev);
+
 	dev_priv->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 1),
 					 pci_resource_len(dev->pdev, 1),
 					 DRM_MTRR_WC);
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 1e04305..aff3b8d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -557,7 +557,7 @@ nouveau_card_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_engine *engine;
-	int ret, e = 0;
+	int ret, i, e = 0;
 
 	vga_client_register(dev->pdev, dev, NULL, nouveau_vga_set_decode);
 	vga_switcheroo_register_client(dev->pdev, nouveau_switcheroo_set_state,
@@ -759,6 +759,13 @@ nouveau_card_init(struct drm_device *dev)
 		nouveau_fbcon_init(dev);
 	}
 
+	for (i = 0; i < 2; i++) {
+		if (dev_priv->old_fb[i]) {
+			nouveau_bo_unpin(dev_priv->old_fb[i]);
+			nouveau_bo_ref(NULL, &dev_priv->old_fb[i]);
+		}
+	}
+
 	return 0;
 
 out_chan:
-- 
1.7.7.6
