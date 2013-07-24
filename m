From: Dave Airlie <airlied@gmail.com>
Subject: [PATCH] [RFC] drm/nouveau: bring back hdmi audio device after
	switcheroo power down
Date: Wed, 24 Jul 2013 17:13:42 +1000
Message-ID: <1374650022-17865-1-git-send-email-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: tiwai@suse.de, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

After a full device powerdown via the optimus power switch, we seem
to lose the HDMI device completely on power on, this keep track of
whether we had a hdmi audio sub function device at power on, and
pokes a magic register to make it reappear after the optimus power
switch is thrown.

This at least works on my NVC4 machine, probably needs testing on
a few other laptops with other nvidia GPUs.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.h |  2 ++
 drivers/gpu/drm/nouveau/nouveau_vga.c | 17 +++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6197266..12a6240 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -296,6 +296,31 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	return 0;
 }
 
+#define PCI_CLASS_MULTIMEDIA_HD_AUDIO 0x0403
+
+static void
+nouveau_get_hdmi_dev(struct drm_device *dev)
+{
+	struct nouveau_drm *drm = dev->dev_private;
+	struct pci_dev *pdev = dev->pdev;
+
+	/* subfunction one is a hdmi audio device? */
+	drm->hdmi_device = pci_get_bus_and_slot((unsigned int)pdev->bus->number,
+						PCI_DEVFN(PCI_SLOT(pdev->devfn), 1));
+
+	if (!drm->hdmi_device) {
+		DRM_INFO("hdmi device  not found %d %d %d\n", pdev->bus->number, PCI_SLOT(pdev->devfn), 1);
+		return;
+	}
+
+	if ((drm->hdmi_device->class >> 8) != PCI_CLASS_MULTIMEDIA_HD_AUDIO) {
+		DRM_INFO("possible hdmi device  not audio %d\n", drm->hdmi_device->class);
+		pci_dev_put(drm->hdmi_device);
+		drm->hdmi_device = NULL;
+		return;
+	}
+}
+
 static int
 nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 {
@@ -314,6 +339,8 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	INIT_LIST_HEAD(&drm->clients);
 	spin_lock_init(&drm->tile.lock);
 
+	nouveau_get_hdmi_dev(dev);
+
 	/* make sure AGP controller is in a consistent state before we
 	 * (possibly) execute vbios init tables (see nouveau_agp.h)
 	 */
@@ -400,6 +427,9 @@ fail_ttm:
 	nouveau_agp_fini(drm);
 	nouveau_vga_fini(drm);
 fail_device:
+	if (drm->hdmi_device)
+		pci_dev_put(drm->hdmi_device);
+
 	nouveau_cli_destroy(&drm->client);
 	return ret;
 }
@@ -424,6 +454,8 @@ nouveau_drm_unload(struct drm_device *dev)
 	nouveau_agp_fini(drm);
 	nouveau_vga_fini(drm);
 
+	if (drm->hdmi_device)
+		pci_dev_put(drm->hdmi_device);
 	nouveau_cli_destroy(&drm->client);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
index 41ff7e0..f276e37 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
@@ -129,6 +129,8 @@ struct nouveau_drm {
 
 	/* power management */
 	struct nouveau_pm *pm;
+
+	struct pci_dev *hdmi_device;
 };
 
 static inline struct nouveau_drm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 25d3495..d8af49c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -27,6 +27,22 @@ nouveau_vga_set_decode(void *priv, bool state)
 }
 
 static void
+nouveau_reenable_hdmi_device(struct drm_device *dev)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_device *device = nv_device(drm->device);
+	uint32_t val;
+
+	if (!drm->hdmi_device)
+		return;
+
+	/* write magic value into magic place */
+	val = nv_rd32(device, 0x88488);
+	val |= (1 << 25);
+	nv_wr32(device, 0x88488, val);
+}
+
+static void
 nouveau_switcheroo_set_state(struct pci_dev *pdev,
 			     enum vga_switcheroo_state state)
 {
@@ -37,6 +53,7 @@ nouveau_switcheroo_set_state(struct pci_dev *pdev,
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 		nouveau_pmops_resume(&pdev->dev);
 		drm_kms_helper_poll_enable(dev);
+		nouveau_reenable_hdmi_device(dev);
 		dev->switch_power_state = DRM_SWITCH_POWER_ON;
 	} else {
 		printk(KERN_ERR "VGA switcheroo: switched nouveau off\n");
-- 
1.8.2.1
