From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/3] drm/nouveau: Start using new drm_dev initialization helpers
Date: Wed, 22 Aug 2018 21:40:07 -0400
Message-ID: <20180823014009.21532-3-lyude@redhat.com>
References: <20180823014009.21532-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823014009.21532-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Per the documentation in drm_get_pci_dev(), this function is deprecated
and shouldn't be used anymore. As it turns out, we're going to need to
stop using drm_get_pci_dev() anyway in order to allow us to turn off the
card before full system shutdowns, otherwise we'll hit race conditions
with userspace while trying to tear down the card on shutdown.

So, start using drm_dev_get() and drm_dev_put(), and just turn our
load/unload callbacks into open coded init/fini() functions.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 173 +++++++++++++++-----------
 1 file changed, 101 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6c88ff776ff6..b88b338dc79c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -458,75 +458,8 @@ nouveau_accel_init(struct nouveau_drm *drm)
 	nouveau_bo_move_init(drm);
 }
 
-static int nouveau_drm_probe(struct pci_dev *pdev,
-			     const struct pci_device_id *pent)
-{
-	struct nvkm_device *device;
-	struct apertures_struct *aper;
-	bool boot = false;
-	int ret;
-
-	if (vga_switcheroo_client_probe_defer(pdev))
-		return -EPROBE_DEFER;
-
-	/* We need to check that the chipset is supported before booting
-	 * fbdev off the hardware, as there's no way to put it back.
-	 */
-	ret = nvkm_device_pci_new(pdev, NULL, "error", true, false, 0, &device);
-	if (ret)
-		return ret;
-
-	nvkm_device_del(&device);
-
-	/* Remove conflicting drivers (vesafb, efifb etc). */
-	aper = alloc_apertures(3);
-	if (!aper)
-		return -ENOMEM;
-
-	aper->ranges[0].base = pci_resource_start(pdev, 1);
-	aper->ranges[0].size = pci_resource_len(pdev, 1);
-	aper->count = 1;
-
-	if (pci_resource_len(pdev, 2)) {
-		aper->ranges[aper->count].base = pci_resource_start(pdev, 2);
-		aper->ranges[aper->count].size = pci_resource_len(pdev, 2);
-		aper->count++;
-	}
-
-	if (pci_resource_len(pdev, 3)) {
-		aper->ranges[aper->count].base = pci_resource_start(pdev, 3);
-		aper->ranges[aper->count].size = pci_resource_len(pdev, 3);
-		aper->count++;
-	}
-
-#ifdef CONFIG_X86
-	boot = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
-#endif
-	if (nouveau_modeset != 2)
-		drm_fb_helper_remove_conflicting_framebuffers(aper, "nouveaufb", boot);
-	kfree(aper);
-
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
-				  true, true, ~0ULL, &device);
-	if (ret)
-		return ret;
-
-	pci_set_master(pdev);
-
-	if (nouveau_atomic)
-		driver_pci.driver_features |= DRIVER_ATOMIC;
-
-	ret = drm_get_pci_dev(pdev, pent, &driver_pci);
-	if (ret) {
-		nvkm_device_del(&device);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int
-nouveau_drm_load(struct drm_device *dev, unsigned long flags)
+nouveau_drm_device_init(struct drm_device *dev)
 {
 	struct nouveau_drm *drm;
 	int ret;
@@ -615,7 +548,7 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 }
 
 static void
-nouveau_drm_unload(struct drm_device *dev)
+nouveau_drm_device_fini(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
@@ -644,18 +577,116 @@ nouveau_drm_unload(struct drm_device *dev)
 	kfree(drm);
 }
 
+static int nouveau_drm_probe(struct pci_dev *pdev,
+			     const struct pci_device_id *pent)
+{
+	struct nvkm_device *device;
+	struct drm_device *drm_dev;
+	struct apertures_struct *aper;
+	bool boot = false;
+	int ret;
+
+	if (vga_switcheroo_client_probe_defer(pdev))
+		return -EPROBE_DEFER;
+
+	/* We need to check that the chipset is supported before booting
+	 * fbdev off the hardware, as there's no way to put it back.
+	 */
+	ret = nvkm_device_pci_new(pdev, NULL, "error", true, false, 0, &device);
+	if (ret)
+		return ret;
+
+	nvkm_device_del(&device);
+
+	/* Remove conflicting drivers (vesafb, efifb etc). */
+	aper = alloc_apertures(3);
+	if (!aper)
+		return -ENOMEM;
+
+	aper->ranges[0].base = pci_resource_start(pdev, 1);
+	aper->ranges[0].size = pci_resource_len(pdev, 1);
+	aper->count = 1;
+
+	if (pci_resource_len(pdev, 2)) {
+		aper->ranges[aper->count].base = pci_resource_start(pdev, 2);
+		aper->ranges[aper->count].size = pci_resource_len(pdev, 2);
+		aper->count++;
+	}
+
+	if (pci_resource_len(pdev, 3)) {
+		aper->ranges[aper->count].base = pci_resource_start(pdev, 3);
+		aper->ranges[aper->count].size = pci_resource_len(pdev, 3);
+		aper->count++;
+	}
+
+#ifdef CONFIG_X86
+	boot = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
+#endif
+	if (nouveau_modeset != 2)
+		drm_fb_helper_remove_conflicting_framebuffers(aper, "nouveaufb", boot);
+	kfree(aper);
+
+	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
+				  true, true, ~0ULL, &device);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	if (nouveau_atomic)
+		driver_pci.driver_features |= DRIVER_ATOMIC;
+
+	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
+	if (IS_ERR(drm_dev)) {
+		ret = PTR_ERR(drm_dev);
+		goto fail_nvkm;
+	}
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		goto fail_drm;
+
+	drm_dev->pdev = pdev;
+	pci_set_drvdata(pdev, drm_dev);
+
+	ret = nouveau_drm_device_init(drm_dev);
+	if (ret)
+		goto fail_pci;
+
+	ret = drm_dev_register(drm_dev, pent->driver_data);
+	if (ret)
+		goto fail_drm_dev_init;
+
+	return 0;
+
+fail_drm_dev_init:
+	nouveau_drm_device_fini(drm_dev);
+fail_pci:
+	pci_disable_device(pdev);
+fail_drm:
+	drm_dev_put(drm_dev);
+fail_nvkm:
+	nvkm_device_del(&device);
+	return ret;
+}
+
 void
 nouveau_drm_device_remove(struct drm_device *dev)
 {
+	struct pci_dev *pdev = dev->pdev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_client *client;
 	struct nvkm_device *device;
 
+	drm_dev_unregister(dev);
+
 	dev->irq_enabled = false;
 	client = nvxx_client(&drm->client.base);
 	device = nvkm_device_find(client->device);
-	drm_put_dev(dev);
 
+	nouveau_drm_device_fini(dev);
+	pci_disable_device(pdev);
+	drm_dev_put(dev);
 	nvkm_device_del(&device);
 }
 
@@ -1022,8 +1053,6 @@ driver_stub = {
 		DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME | DRIVER_RENDER |
 		DRIVER_KMS_LEGACY_CONTEXT,
 
-	.load = nouveau_drm_load,
-	.unload = nouveau_drm_unload,
 	.open = nouveau_drm_open,
 	.postclose = nouveau_drm_postclose,
 	.lastclose = nouveau_vga_lastclose,
-- 
2.17.1
